@implementation WKWebView

- (id)viewForZoomingInScrollView:(id)a3
{
  if (self->_resizeAnimationView.m_ptr)
    return 0;
  else
    return -[WKWebView _currentContentView](self, "_currentContentView", a3);
}

- (BOOL)hasFullScreenWindowController
{
  return self->_fullScreenWindowController.m_ptr != 0;
}

- (UIEdgeInsets)_obscuredInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_obscuredInsets.top;
  left = self->_obscuredInsets.left;
  bottom = self->_obscuredInsets.bottom;
  right = self->_obscuredInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (BOOL)_isInFullscreen
{
  uint64_t v2;

  v2 = *((_QWORD *)self->_page.m_ptr + 45);
  if (v2)
    return (*(uint64_t (**)(_QWORD))(**(_QWORD **)(v2 + 32) + 24))(*(_QWORD *)(v2 + 32));
  else
    return 0;
}

- (void)_setupPageConfiguration:(void *)a3
{
  API::PageConfiguration *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  API::PageConfiguration *v11;
  uint64_t v12;
  unsigned int *v13;
  unsigned int v14;
  unsigned int *v15;
  unsigned int v16;
  unsigned int v17;
  uint64_t v18;
  void *v19;
  API::PageConfiguration *v20;
  uint64_t v21;
  unsigned int *v22;
  unsigned int v23;
  unsigned int *v24;
  unsigned int v25;
  unsigned int v26;
  API::PageConfiguration *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  API::PageConfiguration *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  API::PageConfiguration *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  API::PageConfiguration *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  API::PageConfiguration *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  void *v48;
  API::PageConfiguration *v49;
  CFTypeRef *v50;
  WebKit::WebPageGroup *v51;
  uint64_t v52;
  WTF::StringImpl *v53;
  WTF::StringImpl *v54;
  API::PageConfiguration *v55;
  WTF::StringImpl *v56;
  void *v57;
  WebKit::WebPreferences *v58;
  WebKit::WebPreferences *v59;
  WebKit::WebPreferences *v60;
  WTF::StringImpl *v61;
  WebKit::WebPreferences *v62;
  WebKit::WebPreferences *v63;
  WebKit::WebPreferences *v64;
  WebKit::WebPreferences *v65;
  WebKit::WebPreferences *v66;
  API::PageConfiguration *v67;
  API::PageConfiguration *v68;
  API::PageConfiguration *v69;
  WebKit::WebPreferences *v70;
  WebKit::WebPreferences *v71;
  WebKit::WebPreferences *v72;
  char v73;
  WebKit::WebPreferences *v74;
  WebKit::WebPreferences *v75;
  WebKit::WebPreferences *v76;
  WebKit::WebPreferences *v77;
  int v78;
  WebKit::WebPreferences *v79;
  WebKit::WebPreferences *v80;
  WebKit::WebPreferences *v81;
  char v82;
  WebKit::WebPreferences *v83;
  WebKit::WebPreferences *v84;
  WebKit::WebPreferences *v85;
  WebKit::WebPreferences *v86;
  WebKit::WebPreferences *v87;
  WebKit::WebPreferences *v88;
  WebKit::WebPreferences *v89;
  WebKit::WebPreferences *v90;
  char v91;
  WebKit::WebPreferences *v92;
  WebKit::WebPreferences *v93;
  WebKit::WebPreferences *v94;
  WebKit::WebPreferences *v95;
  WebKit::WebPreferences *v96;
  WebKit::WebPreferences *v97;
  WebKit::WebPreferences *v98;
  WebKit::WebPreferences *v99;
  WebKit::WebPreferences *v100;
  WebKit::WebPreferences *v101;
  WTF::StringImpl *v102;
  WTF::StringImpl *v103;
  WebKit::WebPreferences *v104;
  WebKit::WebPreferences *v105;
  const WTF::StringImpl *v106;
  WebKit::WebPreferences *v107;
  WebKit::WebPreferences *v108;
  WebKit::WebPreferences *v109;
  WebKit::WebPreferences *v110;
  WebKit::WebPreferences *v111;
  WebKit::WebPreferences *v112;
  WebKit::WebPreferences *v113;
  WebKit::WebPreferences *v114;
  WTF::StringImpl *v115;
  WebKit::WebPreferences *v116;
  WTF::StringImpl *v117;
  WebKit::WebPreferences *v118;
  WebKit::WebPreferences *v119;
  WebKit::WebPreferences *v120;
  WebKit::WebPreferences *v121;
  uint64_t isCardiogram;
  WTF::StringImpl *v123;
  WTF::StringImpl *v124;
  WTF::StringImpl *v125[2];
  char v126;

  v5 = *(API::PageConfiguration **)a3;
  v6 = objc_msgSend(self->_configuration.m_ptr, "preferences");
  v7 = v6 + 8;
  if (v6)
    CFRetain(*(CFTypeRef *)(v6 + 16));
  v8 = *((_QWORD *)v5 + 5);
  *((_QWORD *)v5 + 5) = v7;
  if (v8)
    CFRelease(*(CFTypeRef *)(v8 + 8));
  v9 = objc_msgSend(self->_configuration.m_ptr, "_relatedWebView");
  if (v9)
  {
    v11 = *(API::PageConfiguration **)a3;
    v12 = *(_QWORD *)(v9 + 424);
    if (v12)
    {
      WTF::WeakPtrFactory<IPC::MessageReceiver,WTF::DefaultWeakPtrImpl>::initializeIfNeeded((unsigned int *)(v12 + 24), v12 + 16);
      v13 = *(unsigned int **)(v12 + 24);
      if (v13)
      {
        do
          v14 = __ldaxr(v13);
        while (__stlxr(v14 + 1, v13));
      }
    }
    else
    {
      v13 = 0;
    }
    v15 = (unsigned int *)*((_QWORD *)v11 + 17);
    *((_QWORD *)v11 + 17) = v13;
    if (v15)
    {
      do
      {
        v16 = __ldaxr(v15);
        v17 = v16 - 1;
      }
      while (__stlxr(v17, v15));
      if (!v17)
      {
        atomic_store(1u, v15);
        WTF::fastFree((WTF *)v15, v10);
      }
    }
  }
  v18 = objc_msgSend(self->_configuration.m_ptr, "_webViewToCloneSessionStorageFrom");
  if (v18)
  {
    v20 = *(API::PageConfiguration **)a3;
    v21 = *(_QWORD *)(v18 + 424);
    if (v21)
    {
      WTF::WeakPtrFactory<IPC::MessageReceiver,WTF::DefaultWeakPtrImpl>::initializeIfNeeded((unsigned int *)(v21 + 24), v21 + 16);
      v22 = *(unsigned int **)(v21 + 24);
      if (v22)
      {
        do
          v23 = __ldaxr(v22);
        while (__stlxr(v23 + 1, v22));
      }
    }
    else
    {
      v22 = 0;
    }
    v24 = (unsigned int *)*((_QWORD *)v20 + 19);
    *((_QWORD *)v20 + 19) = v22;
    if (v24)
    {
      do
      {
        v25 = __ldaxr(v24);
        v26 = v25 - 1;
      }
      while (__stlxr(v26, v24));
      if (!v26)
      {
        atomic_store(1u, v24);
        WTF::fastFree((WTF *)v24, v19);
      }
    }
  }
  v27 = *(API::PageConfiguration **)a3;
  v28 = objc_msgSend(self->_configuration.m_ptr, "userContentController");
  v29 = v28 + 8;
  CFRetain(*(CFTypeRef *)(v28 + 16));
  v30 = *((_QWORD *)v27 + 4);
  *((_QWORD *)v27 + 4) = v29;
  if (v30)
    CFRelease(*(CFTypeRef *)(v30 + 8));
  v31 = *(API::PageConfiguration **)a3;
  v32 = objc_msgSend(self->_configuration.m_ptr, "_visitedLinkStore");
  v33 = v32 + 8;
  if (v32)
    CFRetain(*(CFTypeRef *)(v32 + 16));
  v34 = *((_QWORD *)v31 + 6);
  *((_QWORD *)v31 + 6) = v33;
  if (v34)
    CFRelease(*(CFTypeRef *)(v34 + 8));
  v35 = *(API::PageConfiguration **)a3;
  v36 = objc_msgSend(self->_configuration.m_ptr, "websiteDataStore");
  v37 = v36 + 8;
  if (v36)
    CFRetain(*(CFTypeRef *)(v36 + 16));
  v38 = *((_QWORD *)v35 + 8);
  *((_QWORD *)v35 + 8) = v37;
  if (v38)
    CFRelease(*(CFTypeRef *)(v38 + 8));
  v39 = *(API::PageConfiguration **)a3;
  v40 = objc_msgSend(self->_configuration.m_ptr, "defaultWebpagePreferences");
  v41 = v40 + 8;
  if (v40)
    CFRetain(*(CFTypeRef *)(v40 + 16));
  v42 = *((_QWORD *)v39 + 7);
  *((_QWORD *)v39 + 7) = v41;
  if (v42)
    CFRelease(*(CFTypeRef *)(v42 + 8));
  v43 = (void *)objc_msgSend(self->_configuration.m_ptr, "_strongWebExtensionController");
  if (v43)
  {
    v44 = *(API::PageConfiguration **)a3;
    v45 = objc_msgSend(v43, "_webExtensionController");
    CFRetain(*(CFTypeRef *)(v45 + 8));
    v46 = *((_QWORD *)v44 + 14);
    *((_QWORD *)v44 + 14) = v45;
    if (v46)
      CFRelease(*(CFTypeRef *)(v46 + 8));
  }
  v47 = (void *)objc_msgSend(self->_configuration.m_ptr, "_weakWebExtensionController");
  if (v47)
    API::PageConfiguration::setWeakWebExtensionController(*(API::PageConfiguration **)a3, (WebKit::WebExtensionController *)objc_msgSend(v47, "_webExtensionController"));
  v48 = (void *)objc_msgSend(self->_configuration.m_ptr, "_groupIdentifier");
  if (objc_msgSend(v48, "length"))
  {
    v49 = *(API::PageConfiguration **)a3;
    MEMORY[0x19AEABCC8](v125, v48);
    v50 = (CFTypeRef *)API::Object::newObject(0x30uLL, 88);
    v51 = WebKit::WebPageGroup::WebPageGroup((WebKit::WebPageGroup *)v50, v125);
    CFRetain(*((CFTypeRef *)v51 + 1));
    v52 = *((_QWORD *)v49 + 16);
    *((_QWORD *)v49 + 16) = v50;
    if (v52)
      CFRelease(*(CFTypeRef *)(v52 + 8));
    CFRelease(v50[1]);
    v54 = v125[0];
    v125[0] = 0;
    if (v54)
    {
      if (*(_DWORD *)v54 == 2)
        WTF::StringImpl::destroy(v54, v53);
      else
        *(_DWORD *)v54 -= 2;
    }
  }
  v55 = *(API::PageConfiguration **)a3;
  WTF::makeVector<WTF::String>((void *)objc_msgSend(self->_configuration.m_ptr, "_additionalSupportedImageTypes"), (uint64_t)&v123);
  v125[0] = v123;
  v56 = v124;
  v123 = 0;
  v124 = 0;
  v125[1] = v56;
  v126 = 1;
  std::__optional_storage_base<WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>,false>::__assign_from[abi:sn180100]<std::__optional_move_assign_base<WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>,false>>((API::PageConfiguration *)((char *)v55 + 248), (uint64_t *)v125);
  if (v126)
    WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)v125, v57);
  WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v123, v57);
  v58 = API::PageConfiguration::Data::LazyInitializedRef<WebKit::WebPreferences,&API::PageConfiguration::Data::createWebPreferences>::get((WebKit::WebPreferences **)(*(_QWORD *)a3 + 40));
  LOBYTE(v125[0]) = objc_msgSend(self->_configuration.m_ptr, "suppressesIncrementalRendering");
  WebKit::WebPreferences::setSuppressesIncrementalRendering(v58, (const BOOL *)v125);
  if ((WTF::linkedOnOrAfterSDKWithBehavior() & 1) == 0)
  {
    v59 = API::PageConfiguration::Data::LazyInitializedRef<WebKit::WebPreferences,&API::PageConfiguration::Data::createWebPreferences>::get((WebKit::WebPreferences **)(*(_QWORD *)a3 + 40));
    LOBYTE(v125[0]) = objc_msgSend(self->_configuration.m_ptr, "_printsBackgrounds");
    WebKit::WebPreferences::setShouldPrintBackgrounds(v59, (const BOOL *)v125);
  }
  v60 = API::PageConfiguration::Data::LazyInitializedRef<WebKit::WebPreferences,&API::PageConfiguration::Data::createWebPreferences>::get((WebKit::WebPreferences **)(*(_QWORD *)a3 + 40));
  objc_msgSend(self->_configuration.m_ptr, "_incrementalRenderingSuppressionTimeout");
  v125[0] = v61;
  WebKit::WebPreferences::setIncrementalRenderingSuppressionTimeout(v60, (double *)v125);
  v62 = API::PageConfiguration::Data::LazyInitializedRef<WebKit::WebPreferences,&API::PageConfiguration::Data::createWebPreferences>::get((WebKit::WebPreferences **)(*(_QWORD *)a3 + 40));
  LOBYTE(v125[0]) = objc_msgSend(self->_configuration.m_ptr, "_allowsJavaScriptMarkup");
  WebKit::WebPreferences::setJavaScriptMarkupEnabled(v62, (const BOOL *)v125);
  v63 = API::PageConfiguration::Data::LazyInitializedRef<WebKit::WebPreferences,&API::PageConfiguration::Data::createWebPreferences>::get((WebKit::WebPreferences **)(*(_QWORD *)a3 + 40));
  LOBYTE(v125[0]) = objc_msgSend(self->_configuration.m_ptr, "_convertsPositionStyleOnCopy");
  WebKit::WebPreferences::setShouldConvertPositionStyleOnCopy(v63, (const BOOL *)v125);
  v64 = API::PageConfiguration::Data::LazyInitializedRef<WebKit::WebPreferences,&API::PageConfiguration::Data::createWebPreferences>::get((WebKit::WebPreferences **)(*(_QWORD *)a3 + 40));
  LOBYTE(v125[0]) = objc_msgSend(self->_configuration.m_ptr, "_allowsMetaRefresh");
  WebKit::WebPreferences::setHTTPEquivEnabled(v64, (const BOOL *)v125);
  v65 = API::PageConfiguration::Data::LazyInitializedRef<WebKit::WebPreferences,&API::PageConfiguration::Data::createWebPreferences>::get((WebKit::WebPreferences **)(*(_QWORD *)a3 + 40));
  LOBYTE(v125[0]) = objc_msgSend(self->_configuration.m_ptr, "_allowUniversalAccessFromFileURLs");
  WebKit::WebPreferences::setAllowUniversalAccessFromFileURLs(v65, (const BOOL *)v125);
  v66 = API::PageConfiguration::Data::LazyInitializedRef<WebKit::WebPreferences,&API::PageConfiguration::Data::createWebPreferences>::get((WebKit::WebPreferences **)(*(_QWORD *)a3 + 40));
  LOBYTE(v125[0]) = objc_msgSend(self->_configuration.m_ptr, "_allowTopNavigationToDataURLs");
  WebKit::WebPreferences::setAllowTopNavigationToDataURLs(v66, (const BOOL *)v125);
  v67 = *(API::PageConfiguration **)a3;
  *((_BYTE *)v67 + 197) = objc_msgSend(self->_configuration.m_ptr, "_waitsForPaintAfterViewDidMoveToWindow");
  v68 = *(API::PageConfiguration **)a3;
  *((_BYTE *)v68 + 198) = objc_msgSend(self->_configuration.m_ptr, "_drawsBackground");
  v69 = *(API::PageConfiguration **)a3;
  *((_BYTE *)v69 + 199) = objc_msgSend(self->_configuration.m_ptr, "_isControlledByAutomation");
  v70 = API::PageConfiguration::Data::LazyInitializedRef<WebKit::WebPreferences,&API::PageConfiguration::Data::createWebPreferences>::get((WebKit::WebPreferences **)(*(_QWORD *)a3 + 40));
  LOBYTE(v125[0]) = objc_msgSend(self->_configuration.m_ptr, "_incompleteImageBorderEnabled");
  WebKit::WebPreferences::setIncompleteImageBorderEnabled(v70, (const BOOL *)v125);
  v71 = API::PageConfiguration::Data::LazyInitializedRef<WebKit::WebPreferences,&API::PageConfiguration::Data::createWebPreferences>::get((WebKit::WebPreferences **)(*(_QWORD *)a3 + 40));
  LOBYTE(v125[0]) = objc_msgSend(self->_configuration.m_ptr, "_shouldDeferAsynchronousScriptsUntilAfterDocumentLoad");
  WebKit::WebPreferences::setShouldDeferAsynchronousScriptsUntilAfterDocumentLoadOrFirstPaint(v71, (const BOOL *)v125);
  v72 = API::PageConfiguration::Data::LazyInitializedRef<WebKit::WebPreferences,&API::PageConfiguration::Data::createWebPreferences>::get((WebKit::WebPreferences **)(*(_QWORD *)a3 + 40));
  if (byte_1EE34175A == 1)
  {
    v73 = byte_1EE341759;
  }
  else
  {
    v73 = WTF::linkedOnOrAfterSDKWithBehavior();
    byte_1EE341759 = v73;
    byte_1EE34175A = 1;
  }
  LOBYTE(v125[0]) = v73;
  WebKit::WebPreferences::setShouldRestrictBaseURLSchemes(v72, (const BOOL *)v125);
  v74 = API::PageConfiguration::Data::LazyInitializedRef<WebKit::WebPreferences,&API::PageConfiguration::Data::createWebPreferences>::get((WebKit::WebPreferences **)(*(_QWORD *)a3 + 40));
  LOBYTE(v125[0]) = objc_msgSend(self->_configuration.m_ptr, "allowsInlineMediaPlayback");
  WebKit::WebPreferences::setAllowsInlineMediaPlayback(v74, (const BOOL *)v125);
  v75 = API::PageConfiguration::Data::LazyInitializedRef<WebKit::WebPreferences,&API::PageConfiguration::Data::createWebPreferences>::get((WebKit::WebPreferences **)(*(_QWORD *)a3 + 40));
  LOBYTE(v125[0]) = objc_msgSend(self->_configuration.m_ptr, "_allowsInlineMediaPlaybackAfterFullscreen");
  WebKit::WebPreferences::setAllowsInlineMediaPlaybackAfterFullscreen(v75, (const BOOL *)v125);
  v76 = API::PageConfiguration::Data::LazyInitializedRef<WebKit::WebPreferences,&API::PageConfiguration::Data::createWebPreferences>::get((WebKit::WebPreferences **)(*(_QWORD *)a3 + 40));
  LOBYTE(v125[0]) = objc_msgSend(self->_configuration.m_ptr, "_inlineMediaPlaybackRequiresPlaysInlineAttribute");
  WebKit::WebPreferences::setInlineMediaPlaybackRequiresPlaysInlineAttribute(v76, (const BOOL *)v125);
  v77 = API::PageConfiguration::Data::LazyInitializedRef<WebKit::WebPreferences,&API::PageConfiguration::Data::createWebPreferences>::get((WebKit::WebPreferences **)(*(_QWORD *)a3 + 40));
  v78 = objc_msgSend(self->_configuration.m_ptr, "allowsPictureInPictureMediaPlayback");
  if (v78)
  {
    if (byte_1EE34175C == 1)
    {
      LOBYTE(v78) = byte_1EE34175B != 0;
    }
    else
    {
      LOBYTE(v78) = WTF::linkedOnOrAfterSDKWithBehavior();
      byte_1EE34175B = v78;
      byte_1EE34175C = 1;
    }
  }
  LOBYTE(v125[0]) = v78;
  WebKit::WebPreferences::setAllowsPictureInPictureMediaPlayback(v77, (const BOOL *)v125);
  v79 = API::PageConfiguration::Data::LazyInitializedRef<WebKit::WebPreferences,&API::PageConfiguration::Data::createWebPreferences>::get((WebKit::WebPreferences **)(*(_QWORD *)a3 + 40));
  LODWORD(v125[0]) = 0;
  WebKit::WebPreferences::setUserInterfaceDirectionPolicy(v79, (const unsigned int *)v125);
  v80 = API::PageConfiguration::Data::LazyInitializedRef<WebKit::WebPreferences,&API::PageConfiguration::Data::createWebPreferences>::get((WebKit::WebPreferences **)(*(_QWORD *)a3 + 40));
  LODWORD(v125[0]) = 0;
  WebKit::WebPreferences::setSystemLayoutDirection(v80, (const unsigned int *)v125);
  v81 = API::PageConfiguration::Data::LazyInitializedRef<WebKit::WebPreferences,&API::PageConfiguration::Data::createWebPreferences>::get((WebKit::WebPreferences **)(*(_QWORD *)a3 + 40));
  if (byte_1EE34175E == 1)
  {
    v82 = byte_1EE34175D;
  }
  else
  {
    v121 = v81;
    isCardiogram = WebCore::IOSApplication::isCardiogram(v81);
    if ((isCardiogram & 1) != 0
      || WebCore::IOSApplication::isNike((WebCore::IOSApplication *)isCardiogram))
    {
      v82 = WTF::linkedOnOrAfterSDKWithBehavior() ^ 1;
    }
    else
    {
      v82 = 0;
    }
    byte_1EE34175D = v82;
    byte_1EE34175E = 1;
    v81 = v121;
  }
  LOBYTE(v125[0]) = v82;
  WebKit::WebPreferences::setAllowSettingAnyXHRHeaderFromFileURLs(v81, (const BOOL *)v125);
  v83 = API::PageConfiguration::Data::LazyInitializedRef<WebKit::WebPreferences,&API::PageConfiguration::Data::createWebPreferences>::get((WebKit::WebPreferences **)(*(_QWORD *)a3 + 40));
  LOBYTE(v125[0]) = objc_msgSend(self->_configuration.m_ptr, "_shouldDecidePolicyBeforeLoadingQuickLookPreview");
  WebKit::WebPreferences::setShouldDecidePolicyBeforeLoadingQuickLookPreview(v83, (const BOOL *)v125);
  v84 = API::PageConfiguration::Data::LazyInitializedRef<WebKit::WebPreferences,&API::PageConfiguration::Data::createWebPreferences>::get((WebKit::WebPreferences **)(*(_QWORD *)a3 + 40));
  LOBYTE(v125[0]) = WTF::linkedOnOrAfterSDKWithBehavior();
  WebKit::WebPreferences::setDeviceOrientationPermissionAPIEnabled(v84, (const BOOL *)v125);
  v85 = API::PageConfiguration::Data::LazyInitializedRef<WebKit::WebPreferences,&API::PageConfiguration::Data::createWebPreferences>::get((WebKit::WebPreferences **)(*(_QWORD *)a3 + 40));
  LOBYTE(v125[0]) = objc_msgSend(self->_configuration.m_ptr, "_systemPreviewEnabled");
  WebKit::WebPreferences::setSystemPreviewEnabled(v85, (const BOOL *)v125);
  v86 = API::PageConfiguration::Data::LazyInitializedRef<WebKit::WebPreferences,&API::PageConfiguration::Data::createWebPreferences>::get((WebKit::WebPreferences **)(*(_QWORD *)a3 + 40));
  LOBYTE(v125[0]) = objc_msgSend(self->_configuration.m_ptr, "_scrollToTextFragmentIndicatorEnabled");
  WebKit::WebPreferences::setScrollToTextFragmentIndicatorEnabled(v86, (const BOOL *)v125);
  v87 = API::PageConfiguration::Data::LazyInitializedRef<WebKit::WebPreferences,&API::PageConfiguration::Data::createWebPreferences>::get((WebKit::WebPreferences **)(*(_QWORD *)a3 + 40));
  LOBYTE(v125[0]) = objc_msgSend(self->_configuration.m_ptr, "_scrollToTextFragmentMarkingEnabled");
  WebKit::WebPreferences::setScrollToTextFragmentMarkingEnabled(v87, (const BOOL *)v125);
  LOBYTE(v87) = objc_msgSend(self->_configuration.m_ptr, "mediaTypesRequiringUserActionForPlayback");
  v88 = API::PageConfiguration::Data::LazyInitializedRef<WebKit::WebPreferences,&API::PageConfiguration::Data::createWebPreferences>::get((WebKit::WebPreferences **)(*(_QWORD *)a3 + 40));
  LOBYTE(v125[0]) = (v87 & 2) != 0;
  WebKit::WebPreferences::setRequiresUserGestureForVideoPlayback(v88, (const BOOL *)v125);
  v89 = API::PageConfiguration::Data::LazyInitializedRef<WebKit::WebPreferences,&API::PageConfiguration::Data::createWebPreferences>::get((WebKit::WebPreferences **)(*(_QWORD *)a3 + 40));
  LOBYTE(v125[0]) = v87 & 1;
  WebKit::WebPreferences::setRequiresUserGestureForAudioPlayback(v89, (const BOOL *)v125);
  v90 = API::PageConfiguration::Data::LazyInitializedRef<WebKit::WebPreferences,&API::PageConfiguration::Data::createWebPreferences>::get((WebKit::WebPreferences **)(*(_QWORD *)a3 + 40));
  if (byte_1EE341760 == 1)
  {
    v91 = byte_1EE34175F;
  }
  else
  {
    v91 = WTF::linkedOnOrAfterSDKWithBehavior();
    byte_1EE34175F = v91;
    byte_1EE341760 = 1;
  }
  LOBYTE(v125[0]) = v91;
  WebKit::WebPreferences::setRequiresUserGestureToLoadVideo(v90, (const BOOL *)v125);
  v92 = API::PageConfiguration::Data::LazyInitializedRef<WebKit::WebPreferences,&API::PageConfiguration::Data::createWebPreferences>::get((WebKit::WebPreferences **)(*(_QWORD *)a3 + 40));
  LOBYTE(v125[0]) = objc_msgSend(self->_configuration.m_ptr, "_mainContentUserGestureOverrideEnabled");
  WebKit::WebPreferences::setMainContentUserGestureOverrideEnabled(v92, (const BOOL *)v125);
  v93 = API::PageConfiguration::Data::LazyInitializedRef<WebKit::WebPreferences,&API::PageConfiguration::Data::createWebPreferences>::get((WebKit::WebPreferences **)(*(_QWORD *)a3 + 40));
  LOBYTE(v125[0]) = objc_msgSend(self->_configuration.m_ptr, "_invisibleAutoplayNotPermitted");
  WebKit::WebPreferences::setInvisibleAutoplayNotPermitted(v93, (const BOOL *)v125);
  v94 = API::PageConfiguration::Data::LazyInitializedRef<WebKit::WebPreferences,&API::PageConfiguration::Data::createWebPreferences>::get((WebKit::WebPreferences **)(*(_QWORD *)a3 + 40));
  LOBYTE(v125[0]) = objc_msgSend(self->_configuration.m_ptr, "_mediaDataLoadsAutomatically");
  WebKit::WebPreferences::setMediaDataLoadsAutomatically(v94, (const BOOL *)v125);
  v95 = API::PageConfiguration::Data::LazyInitializedRef<WebKit::WebPreferences,&API::PageConfiguration::Data::createWebPreferences>::get((WebKit::WebPreferences **)(*(_QWORD *)a3 + 40));
  LOBYTE(v125[0]) = objc_msgSend(self->_configuration.m_ptr, "_attachmentElementEnabled");
  WebKit::WebPreferences::setAttachmentElementEnabled(v95, (const BOOL *)v125);
  v96 = API::PageConfiguration::Data::LazyInitializedRef<WebKit::WebPreferences,&API::PageConfiguration::Data::createWebPreferences>::get((WebKit::WebPreferences **)(*(_QWORD *)a3 + 40));
  LOBYTE(v125[0]) = objc_msgSend(self->_configuration.m_ptr, "_attachmentWideLayoutEnabled");
  WebKit::WebPreferences::setAttachmentWideLayoutEnabled(v96, (const BOOL *)v125);
  v97 = API::PageConfiguration::Data::LazyInitializedRef<WebKit::WebPreferences,&API::PageConfiguration::Data::createWebPreferences>::get((WebKit::WebPreferences **)(*(_QWORD *)a3 + 40));
  LOBYTE(v125[0]) = objc_msgSend(self->_configuration.m_ptr, "dataDetectorTypes") & 0x7F;
  LODWORD(v125[0]) = LOBYTE(v125[0]);
  WebKit::WebPreferences::setDataDetectorTypes(v97, (const unsigned int *)v125);
  v98 = API::PageConfiguration::Data::LazyInitializedRef<WebKit::WebPreferences,&API::PageConfiguration::Data::createWebPreferences>::get((WebKit::WebPreferences **)(*(_QWORD *)a3 + 40));
  LOBYTE(v125[0]) = objc_msgSend(self->_configuration.m_ptr, "allowsAirPlayForMediaPlayback");
  WebKit::WebPreferences::setAllowsAirPlayForMediaPlayback(v98, (const BOOL *)v125);
  v99 = API::PageConfiguration::Data::LazyInitializedRef<WebKit::WebPreferences,&API::PageConfiguration::Data::createWebPreferences>::get((WebKit::WebPreferences **)(*(_QWORD *)a3 + 40));
  LOBYTE(v125[0]) = objc_msgSend(self->_configuration.m_ptr, "_applePayEnabled");
  WebKit::WebPreferences::setApplePayEnabled(v99, (const BOOL *)v125);
  v100 = API::PageConfiguration::Data::LazyInitializedRef<WebKit::WebPreferences,&API::PageConfiguration::Data::createWebPreferences>::get((WebKit::WebPreferences **)(*(_QWORD *)a3 + 40));
  LOBYTE(v125[0]) = objc_msgSend(self->_configuration.m_ptr, "_needsStorageAccessFromFileURLsQuirk");
  WebKit::WebPreferences::setNeedsStorageAccessFromFileURLsQuirk(v100, (const BOOL *)v125);
  v101 = API::PageConfiguration::Data::LazyInitializedRef<WebKit::WebPreferences,&API::PageConfiguration::Data::createWebPreferences>::get((WebKit::WebPreferences **)(*(_QWORD *)a3 + 40));
  MEMORY[0x19AEABCC8](v125, objc_msgSend(self->_configuration.m_ptr, "_mediaContentTypesRequiringHardwareSupport"));
  WebKit::WebPreferences::setMediaContentTypesRequiringHardwareSupport(v101, v125);
  v103 = v125[0];
  v125[0] = 0;
  if (v103)
  {
    if (*(_DWORD *)v103 == 2)
      WTF::StringImpl::destroy(v103, v102);
    else
      *(_DWORD *)v103 -= 2;
  }
  v104 = API::PageConfiguration::Data::LazyInitializedRef<WebKit::WebPreferences,&API::PageConfiguration::Data::createWebPreferences>::get((WebKit::WebPreferences **)(*(_QWORD *)a3 + 40));
  LOBYTE(v125[0]) = objc_msgSend(self->_configuration.m_ptr, "_allowMediaContentTypesRequiringHardwareSupportAsFallback");
  WebKit::WebPreferences::setAllowMediaContentTypesRequiringHardwareSupportAsFallback(v104, (const BOOL *)v125);
  v105 = API::PageConfiguration::Data::LazyInitializedRef<WebKit::WebPreferences,&API::PageConfiguration::Data::createWebPreferences>::get((WebKit::WebPreferences **)(*(_QWORD *)a3 + 40));
  {
    WebKit::WebPreferencesKey::mediaDevicesEnabledKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::mediaDevicesEnabledKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::mediaDevicesEnabledKey(void)::$_0::operator() const(void)::impl;
  }
  if ((WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferences *)((char *)v105 + 40), (WTF::StringImpl **)&WebKit::WebPreferencesKey::mediaDevicesEnabledKey(void)::key, v106) & 1) == 0)
  {
    v107 = API::PageConfiguration::Data::LazyInitializedRef<WebKit::WebPreferences,&API::PageConfiguration::Data::createWebPreferences>::get((WebKit::WebPreferences **)(*(_QWORD *)a3 + 40));
    LOBYTE(v125[0]) = objc_msgSend(self->_configuration.m_ptr, "_mediaCaptureEnabled");
    WebKit::WebPreferences::setMediaDevicesEnabled(v107, (const BOOL *)v125);
  }
  v108 = API::PageConfiguration::Data::LazyInitializedRef<WebKit::WebPreferences,&API::PageConfiguration::Data::createWebPreferences>::get((WebKit::WebPreferences **)(*(_QWORD *)a3 + 40));
  LOBYTE(v125[0]) = objc_msgSend(self->_configuration.m_ptr, "_colorFilterEnabled");
  WebKit::WebPreferences::setColorFilterEnabled(v108, (const BOOL *)v125);
  v109 = API::PageConfiguration::Data::LazyInitializedRef<WebKit::WebPreferences,&API::PageConfiguration::Data::createWebPreferences>::get((WebKit::WebPreferences **)(*(_QWORD *)a3 + 40));
  LOBYTE(v125[0]) = objc_msgSend(self->_configuration.m_ptr, "_undoManagerAPIEnabled");
  WebKit::WebPreferences::setUndoManagerAPIEnabled(v109, (const BOOL *)v125);
  v110 = API::PageConfiguration::Data::LazyInitializedRef<WebKit::WebPreferences,&API::PageConfiguration::Data::createWebPreferences>::get((WebKit::WebPreferences **)(*(_QWORD *)a3 + 40));
  LOBYTE(v125[0]) = objc_msgSend(self->_configuration.m_ptr, "_appHighlightsEnabled");
  WebKit::WebPreferences::setAppHighlightsEnabled(v110, (const BOOL *)v125);
  v111 = API::PageConfiguration::Data::LazyInitializedRef<WebKit::WebPreferences,&API::PageConfiguration::Data::createWebPreferences>::get((WebKit::WebPreferences **)(*(_QWORD *)a3 + 40));
  LOBYTE(v125[0]) = objc_msgSend(self->_configuration.m_ptr, "_legacyEncryptedMediaAPIEnabled");
  WebKit::WebPreferences::setLegacyEncryptedMediaAPIEnabled(v111, (const BOOL *)v125);
  if (((WTF::processHasEntitlement() & 1) == 0 && !WTF::processHasEntitlement()
     || objc_msgSend((id)objc_msgSend(self->_configuration.m_ptr, "preferences"), "_serviceWorkerEntitlementDisabledForTesting"))&& (objc_msgSend(self->_configuration.m_ptr, "limitsNavigationsToAppBoundDomains") & 1) == 0)
  {
    v112 = API::PageConfiguration::Data::LazyInitializedRef<WebKit::WebPreferences,&API::PageConfiguration::Data::createWebPreferences>::get((WebKit::WebPreferences **)(*(_QWORD *)a3 + 40));
    LOBYTE(v125[0]) = 0;
    WebKit::WebPreferences::setServiceWorkersEnabled(v112, (const BOOL *)v125);
  }
  v113 = API::PageConfiguration::Data::LazyInitializedRef<WebKit::WebPreferences,&API::PageConfiguration::Data::createWebPreferences>::get((WebKit::WebPreferences **)(*(_QWORD *)a3 + 40));
  LOBYTE(v125[0]) = objc_msgSend((id)objc_msgSend(self->_configuration.m_ptr, "preferences"), "_serviceWorkerEntitlementDisabledForTesting");
  WebKit::WebPreferences::setServiceWorkerEntitlementDisabledForTesting(v113, (const BOOL *)v125);
  v114 = API::PageConfiguration::Data::LazyInitializedRef<WebKit::WebPreferences,&API::PageConfiguration::Data::createWebPreferences>::get((WebKit::WebPreferences **)(*(_QWORD *)a3 + 40));
  objc_msgSend(self->_configuration.m_ptr, "_sampledPageTopColorMaxDifference");
  v125[0] = v115;
  WebKit::WebPreferences::setSampledPageTopColorMaxDifference(v114, (double *)v125);
  v116 = API::PageConfiguration::Data::LazyInitializedRef<WebKit::WebPreferences,&API::PageConfiguration::Data::createWebPreferences>::get((WebKit::WebPreferences **)(*(_QWORD *)a3 + 40));
  objc_msgSend(self->_configuration.m_ptr, "_sampledPageTopColorMinHeight");
  v125[0] = v117;
  WebKit::WebPreferences::setSampledPageTopColorMinHeight(v116, (double *)v125);
  if ((WTF::linkedOnOrAfterSDKWithBehavior() & 1) == 0)
  {
    v118 = API::PageConfiguration::Data::LazyInitializedRef<WebKit::WebPreferences,&API::PageConfiguration::Data::createWebPreferences>::get((WebKit::WebPreferences **)(*(_QWORD *)a3 + 40));
    LOBYTE(v125[0]) = 0;
    WebKit::WebPreferences::setNeedsSiteSpecificQuirks(v118, (const BOOL *)v125);
  }
  v119 = API::PageConfiguration::Data::LazyInitializedRef<WebKit::WebPreferences,&API::PageConfiguration::Data::createWebPreferences>::get((WebKit::WebPreferences **)(*(_QWORD *)a3 + 40));
  LOBYTE(v125[0]) = PAL::currentUserInterfaceIdiomIsVision(v119);
  WebKit::WebPreferences::setAlternateFormControlDesignEnabled(v119, (const BOOL *)v125);
  v120 = API::PageConfiguration::Data::LazyInitializedRef<WebKit::WebPreferences,&API::PageConfiguration::Data::createWebPreferences>::get((WebKit::WebPreferences **)(*(_QWORD *)a3 + 40));
  LOBYTE(v125[0]) = PAL::currentUserInterfaceIdiomIsVision(v120);
  WebKit::WebPreferences::setVideoFullscreenRequiresElementFullscreen(v120, (const BOOL *)v125);
}

- (void)_initializeWithConfiguration:(id)a3
{
  void *v5;
  void *m_ptr;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  WKContentView *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  WTF::StringImpl *v25;
  WKContentView *v26;
  void *v27;
  WTF::StringImpl *v28;
  uint64_t v29;
  WebPageProxy *v30;
  WebPageProxy *v31;
  WebPageProxy *v32;
  uint64_t v33;
  WTF::StringImpl *v34;
  WTF::StringImpl *v35;
  id v36;
  const __CFString *v37;
  __CFNotificationCenter *DarwinNotifyCenter;
  WTF **v39;
  const WTF::StringImpl *v40;
  WTF::StringImpl *v41;
  WTF::StringImpl *v42;
  WebPageProxy *v43;
  WTF::StringImpl *v44;
  WTF::StringImpl *v45;
  WebKit::NavigationState *v46;
  WebPageProxy *v47;
  uint64_t v48;
  WebKit::UIDelegate *v49;
  WebPageProxy *v50;
  WTF::StringImpl *v51;
  WebPageProxy *v52;
  _QWORD *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  _QWORD *v57;
  _QWORD *v58;
  _QWORD *v59;
  _QWORD *v60;
  _QWORD *v61;
  uint64_t v62;
  WebPageProxy *v63;
  WTF::StringImpl *v64;
  WTF::StringImpl *v65;
  double v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  CFTypeRef *v73;
  WTF::StringImpl *v74;
  CFTypeRef *v75;
  WTF::StringImpl *v76;

  if (!a3)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Configuration cannot be nil"));
  v5 = (void *)objc_msgSend(a3, "copy");
  m_ptr = self->_configuration.m_ptr;
  self->_configuration.m_ptr = v5;
  if (m_ptr)
  {
    CFRelease(m_ptr);
    v5 = self->_configuration.m_ptr;
  }
  v7 = objc_msgSend(v5, "_relatedWebView");
  if (v7)
  {
    v8 = v7;
    v9 = objc_msgSend(self->_configuration.m_ptr, "processPool");
    v10 = objc_msgSend(*(id *)(v8 + 416), "processPool");
    v11 = v10;
    if (v9)
      v12 = v9 == v10;
    else
      v12 = 1;
    if (!v12)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Related web view %@ has process pool %@ but configuration specifies a different process pool %@"), v8, v10, objc_msgSend(a3, "processPool"));
    v13 = objc_msgSend(*(id *)(v8 + 416), "websiteDataStore");
    if (v13 != objc_msgSend(self->_configuration.m_ptr, "websiteDataStore")
      && WTF::linkedOnOrAfterSDKWithBehavior())
    {
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Related web view %@ has data store %@ but configuration specifies a different data store %@"), v8, objc_msgSend(*(id *)(v8 + 416), "websiteDataStore"), objc_msgSend(self->_configuration.m_ptr, "websiteDataStore"));
    }
    objc_msgSend(self->_configuration.m_ptr, "setProcessPool:", v11);
  }
  v14 = objc_msgSend(self->_configuration.m_ptr, "processPool");
  API::PageConfiguration::copy((API::PageConfiguration *)((char *)self->_configuration.m_ptr + 8), (API::PageConfiguration **)&v75);
  -[WKWebView _setupPageConfiguration:](self, "_setupPageConfiguration:", &v75);
  self->_usePlatformFindUI = 1;
  self->_obscuredInsetEdgesAffectedBySafeArea = 11;
  self->_allowsViewportShrinkToFit = 0;
  self->_allowsLinkPreview = WTF::linkedOnOrAfterSDKWithBehavior();
  self->_findInteractionEnabled = 0;
  self->_needsToPresentLockdownModeMessage = 1;
  v15 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults"), "objectForKey:", CFSTR("WebKitFastClickingDisabled"));
  if (v15)
    LOBYTE(v15) = objc_msgSend(v15, "BOOLValue");
  self->_fastClickingIsDisabled = (char)v15;
  self->_dragInteractionPolicy = 0;
  v16 = [WKContentView alloc];
  -[WKWebView bounds](self, "bounds");
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v24 = v23;
  v25 = (WTF::StringImpl *)v75;
  CFRetain(v75[1]);
  v76 = v25;
  v26 = -[WKContentView initWithFrame:processPool:configuration:webView:](v16, "initWithFrame:processPool:configuration:webView:", v14 + 8, &v76, self, v18, v20, v22, v24);
  v27 = self->_contentView.m_ptr;
  self->_contentView.m_ptr = v26;
  if (v27)
    CFRelease(v27);
  v28 = v76;
  v76 = 0;
  if (v28)
    CFRelease(*((CFTypeRef *)v28 + 1));
  v29 = objc_msgSend(self->_contentView.m_ptr, "page");
  v30 = (WebPageProxy *)v29;
  if (v29)
    CFRetain(*(CFTypeRef *)(v29 + 8));
  v31 = self->_page.m_ptr;
  self->_page.m_ptr = v30;
  if (v31)
    CFRelease(*((CFTypeRef *)v31 + 1));
  -[WKWebView _setupScrollAndContentViews](self, "_setupScrollAndContentViews");
  if (-[WKWebView isOpaque](self, "isOpaque") && *((_BYTE *)v75 + 198))
    -[WKWebView _updateScrollViewBackground](self, "_updateScrollViewBackground");
  else
    -[WKWebView _setOpaqueInternal:](self, "_setOpaqueInternal:", 0);
  -[WKWebView _frameOrBoundsMayHaveChanged](self, "_frameOrBoundsMayHaveChanged");
  -[WKWebView _registerForNotifications](self, "_registerForNotifications");
  v32 = self->_page.m_ptr;
  MEMORY[0x19AEABCC8](&v74, -[WKWebView _contentSizeCategory](self, "_contentSizeCategory"));
  v33 = *((_QWORD *)v32 + 26);
  v76 = (WTF::StringImpl *)&v74;
  WebKit::AuxiliaryProcessProxy::send<Messages::WebPage::ContentSizeCategoryDidChange>(v33, (uint64_t **)&v76, *(_QWORD *)(*((_QWORD *)v32 + 4) + 1896), 0);
  v35 = v74;
  v74 = 0;
  if (v35)
  {
    if (*(_DWORD *)v35 == 2)
      WTF::StringImpl::destroy(v35, v34);
    else
      *(_DWORD *)v35 -= 2;
  }
  v36 = objc_alloc(MEMORY[0x1E0CB3940]);
  v37 = (const __CFString *)objc_msgSend(v36, "initWithCString:encoding:", *MEMORY[0x1E0D27C98], 4);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)hardwareKeyboardAvailabilityChangedCallback, v37, 0, (CFNotificationSuspensionBehavior)1026);
  WebKit::WebPageProxy::setForceAlwaysUserScalable((uint64_t)self->_page.m_ptr, objc_msgSend(self->_configuration.m_ptr, "ignoresViewportScaleLimits"));
  if (objc_msgSend(a3, "applicationNameForUserAgent"))
  {
    v39 = (WTF **)self->_page.m_ptr;
    MEMORY[0x19AEABCC8](&v76);
    WebKit::WebPageProxy::setApplicationNameForUserAgent(v39, &v76, v40);
    v42 = v76;
    v76 = 0;
    if (v42)
    {
      if (*(_DWORD *)v42 == 2)
        WTF::StringImpl::destroy(v42, v41);
      else
        *(_DWORD *)v42 -= 2;
    }
  }
  v43 = self->_page.m_ptr;
  MEMORY[0x19AEABCC8](&v76, objc_msgSend(a3, "_applicationNameForDesktopUserAgent"));
  WTF::String::operator=((WTF::StringImpl **)v43 + 40, (WTF::StringImpl *)&v76);
  v45 = v76;
  v76 = 0;
  if (v45)
  {
    if (*(_DWORD *)v45 == 2)
      WTF::StringImpl::destroy(v45, v44);
    else
      *(_DWORD *)v45 -= 2;
  }
  v46 = (WebKit::NavigationState *)WTF::fastMalloc((WTF *)0x60);
  WebKit::NavigationState::NavigationState(v46, self);
  std::unique_ptr<WebKit::NavigationState>::reset[abi:sn180100]((WebKit::NavigationState **)&self->_navigationState, v46);
  v47 = self->_page.m_ptr;
  WebKit::NavigationState::createNavigationClient((WebKit::NavigationState *)self->_navigationState.__ptr_.__value_, &v76);
  v48 = *((_QWORD *)v47 + 9);
  *((_QWORD *)v47 + 9) = v76;
  if (v48)
    (*(void (**)(uint64_t))(*(_QWORD *)v48 + 8))(v48);
  v49 = (WebKit::UIDelegate *)WTF::fastMalloc((WTF *)0x20);
  WebKit::UIDelegate::UIDelegate(v49, self);
  std::unique_ptr<WebKit::UIDelegate>::reset[abi:sn180100]((uint64_t *)&self->_uiDelegate, (uint64_t)v49);
  v50 = self->_page.m_ptr;
  v51 = (WTF::StringImpl *)WTF::fastMalloc((WTF *)0x20);
  *(_QWORD *)v51 = off_1E34C7280;
  *((_QWORD *)v51 + 1) = self;
  *((_QWORD *)v51 + 2) = 0;
  v76 = v51;
  WebKit::WebPageProxy::setFindClient((uint64_t)v50, (_QWORD **)&v76);
  if (v76)
    (*(void (**)(WTF::StringImpl *))(*(_QWORD *)v76 + 8))(v76);
  v52 = self->_page.m_ptr;
  v53 = (_QWORD *)WTF::fastMalloc((WTF *)0x20);
  *v53 = off_1E34C65B8;
  v53[1] = self;
  v53[2] = 0;
  v54 = *((_QWORD *)v52 + 16);
  *((_QWORD *)v52 + 16) = v53;
  if (v54)
    (*(void (**)(uint64_t))(*(_QWORD *)v54 + 8))(v54);
  v55 = WTF::fastMalloc((WTF *)0x18);
  *(_QWORD *)v55 = self;
  *(_QWORD *)(v55 + 8) = 0;
  std::unique_ptr<WebKit::IconLoadingDelegate>::reset[abi:sn180100]((id **)&self->_iconLoadingDelegate, (id *)v55);
  v56 = WTF::fastMalloc((WTF *)0x18);
  *(_QWORD *)v56 = 0;
  objc_initWeak((id *)v56, self);
  *(_QWORD *)(v56 + 8) = 0;
  std::unique_ptr<WebKit::ResourceLoadDelegate>::reset[abi:sn180100]((id **)&self->_resourceLoadDelegate, (id *)v56);
  v57 = v75 + 37;
  v58 = WTF::HashTable<WTF::String,WTF::KeyValuePair<WTF::String,WTF::WallTime>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<WTF::String,WTF::WallTime>>,WTF::DefaultHash<WTF::String>,WTF::HashMap<WTF::String,WTF::WallTime,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::WallTime>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<WTF::String>>::begin((_QWORD **)v75 + 37);
  v59 = v58;
  v61 = v60;
  if (*v57)
    v62 = *v57 + 16 * *(unsigned int *)(*v57 - 4);
  else
    v62 = 0;
  if ((_QWORD *)v62 != v58)
  {
    do
    {
      v63 = self->_page.m_ptr;
      v64 = (WTF::StringImpl *)v59[1];
      ++*((_DWORD *)v64 + 2);
      v76 = v64;
      WebKit::WebPageProxy::setURLSchemeHandlerForScheme(v63, &v76);
      v65 = v76;
      v76 = 0;
      if (v65)
      {
        if (*((_DWORD *)v65 + 2) == 1)
          (*(void (**)(WTF::StringImpl *))(*(_QWORD *)v65 + 8))(v65);
        else
          --*((_DWORD *)v65 + 2);
      }
      while (1)
      {
        v59 += 2;
        if (v59 == v61)
          break;
        if ((unint64_t)(*v59 + 1) > 1)
          goto LABEL_60;
      }
      v59 = v61;
LABEL_60:
      ;
    }
    while (v59 != (_QWORD *)v62);
  }
  objc_storeWeak((id *)(*((_QWORD *)self->_page.m_ptr + 4) + 1984), self);
  WTF::MonotonicTime::now((WTF::MonotonicTime *)objc_msgSend(MEMORY[0x1E0DCDDB8], "installForWebViewIfNeeded:kind:deprecated:", self, CFSTR("WKWebView"), 0));
  self->_timeOfRequestForVisibleContentRectUpdate.m_value = v66;
  self->_timeOfLastVisibleContentRectUpdate.m_value = v66;
  if (!self->_timeOfFirstVisibleContentRectUpdateWithPendingCommit.__engaged_)
    self->_timeOfFirstVisibleContentRectUpdateWithPendingCommit.__engaged_ = 1;
  self->_timeOfFirstVisibleContentRectUpdateWithPendingCommit.var0.__val_.m_value = v66;
  v67 = (void *)objc_msgSend(MEMORY[0x1E0CB3748], "strongToWeakObjectsMapTable");
  v68 = v67;
  if (v67)
    CFRetain(v67);
  v69 = self->_writingToolsSessions.m_ptr;
  self->_writingToolsSessions.m_ptr = v68;
  if (v69)
    CFRelease(v69);
  v70 = (void *)objc_msgSend(MEMORY[0x1E0CB3748], "strongToWeakObjectsMapTable");
  v71 = v70;
  if (v70)
    CFRetain(v70);
  v72 = self->_writingToolsTextSuggestions.m_ptr;
  self->_writingToolsTextSuggestions.m_ptr = v71;
  if (v72)
    CFRelease(v72);
  if (v37)
    CFRelease(v37);
  v73 = v75;
  v75 = 0;
  if (v73)
    CFRelease(v73[1]);
}

- (void)layoutSubviews
{
  void *m_ptr;
  objc_super v4;

  m_ptr = self->_safeBrowsingWarning.m_ptr;
  -[WKWebView bounds](self, "bounds");
  objc_msgSend(m_ptr, "setFrame:");
  v4.receiver = self;
  v4.super_class = (Class)WKWebView;
  -[WKWebView layoutSubviews](&v4, sel_layoutSubviews);
  -[WKWebView _frameOrBoundsMayHaveChanged](self, "_frameOrBoundsMayHaveChanged");
}

- (id)_contentSizeCategory
{
  return (id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication"), "preferredContentSizeCategory");
}

- (void)_setAllowsViewportShrinkToFit:(BOOL)a3
{
  self->_allowsViewportShrinkToFit = a3;
}

- (NSURL)URL
{
  void *v2;
  WTF::StringImpl *v3;
  NSURL *v4;
  WTF::StringImpl *v5;
  WTF::StringImpl *v7;

  v2 = (void *)MEMORY[0x1E0C99E98];
  WebKit::PageLoadState::activeURL((unsigned __int8 *)(*((_QWORD *)self->_page.m_ptr + 4) + 968), &v7);
  v4 = (NSURL *)objc_msgSend(v2, "_web_URLWithWTFString:", &v7);
  v5 = v7;
  v7 = 0;
  if (v5)
  {
    if (*(_DWORD *)v5 == 2)
      WTF::StringImpl::destroy(v5, v3);
    else
      *(_DWORD *)v5 -= 2;
  }
  return v4;
}

- (id)_insertionPointColor
{
  id result;

  result = (id)objc_msgSend(-[WKWebView _textInputTraits](self, "_textInputTraits"), "insertionPointColor");
  if (!result)
    return (id)objc_msgSend(MEMORY[0x1E0CEA478], "insertionPointColor");
  return result;
}

- (id)_textInputTraits
{
  if (-[WKWebView usesStandardContentView](self, "usesStandardContentView"))
    return (id)objc_msgSend(self->_contentView.m_ptr, "textInputTraitsForWebView");
  else
    return 0;
}

- (WKWebViewContentProviderRegistry)_contentProviderRegistry
{
  WKWebViewContentProviderRegistry *result;
  void *m_ptr;

  result = (WKWebViewContentProviderRegistry *)self->_contentProviderRegistry.m_ptr;
  if (!result)
  {
    result = -[WKWebViewContentProviderRegistry initWithConfiguration:]([WKWebViewContentProviderRegistry alloc], "initWithConfiguration:", -[WKWebView configuration](self, "configuration"));
    m_ptr = self->_contentProviderRegistry.m_ptr;
    self->_contentProviderRegistry.m_ptr = result;
    if (m_ptr)
    {
      CFRelease(m_ptr);
      return (WKWebViewContentProviderRegistry *)self->_contentProviderRegistry.m_ptr;
    }
  }
  return result;
}

- (NSURL)_committedURL
{
  return (NSURL *)objc_msgSend(MEMORY[0x1E0C99E98], "_web_URLWithWTFString:", *((_QWORD *)self->_page.m_ptr + 4) + 1000);
}

- (UIFindInteraction)findInteraction
{
  return (UIFindInteraction *)self->_findInteraction.m_ptr;
}

- (BOOL)_isRetainingActiveFocusedState
{
  return self->_focusPreservationCount || self->_activeFocusedStateRetainCount != 0;
}

- (BOOL)_mayAutomaticallyShowVideoPictureInPicture
{
  WebPageProxy *m_ptr;
  WebKit::VideoPresentationManagerProxy *v3;

  m_ptr = self->_page.m_ptr;
  if (m_ptr && (v3 = (WebKit::VideoPresentationManagerProxy *)*((_QWORD *)m_ptr + 48)) != 0)
    return WebKit::VideoPresentationManagerProxy::mayAutomaticallyShowVideoPictureInPicture(v3);
  else
    return 0;
}

- (BOOL)_isShowingVideoPictureInPicture
{
  WebPageProxy *m_ptr;
  WebKit::VideoPresentationManagerProxy *v3;

  m_ptr = self->_page.m_ptr;
  return m_ptr
      && (v3 = (WebKit::VideoPresentationManagerProxy *)*((_QWORD *)m_ptr + 48)) != 0
      && WebKit::VideoPresentationManagerProxy::hasMode(v3, 2);
}

- (int)_webProcessIdentifier
{
  int result;
  WebPageProxy *m_ptr;
  uint64_t v5;

  result = -[WKWebView _isValid](self, "_isValid");
  if (result)
  {
    m_ptr = self->_page.m_ptr;
    if (*((_BYTE *)m_ptr + 729))
      return 0;
    v5 = *(_QWORD *)(*((_QWORD *)m_ptr + 26) + 136);
    if (!v5)
      return 0;
    else
      return *(_DWORD *)(v5 + 108);
  }
  return result;
}

void __76__WKWebView_WKViewInternalIOS___addUpdateVisibleContentRectPreCommitHandler__block_invoke(uint64_t a1)
{
  _BYTE *v1;
  NSObject *v2;
  int v3;
  _BYTE *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v1 = *(_BYTE **)(a1 + 32);
  if ((objc_msgSend(v1, "_isValid") & 1) != 0)
  {
    objc_msgSend(v1, "_updateVisibleContentRects");
    v1[838] = 0;
  }
  else
  {
    v2 = qword_1ECE71A28;
    if (os_log_type_enabled((os_log_t)qword_1ECE71A28, OS_LOG_TYPE_DEFAULT))
    {
      v3 = 134217984;
      v4 = v1;
      _os_log_impl(&dword_196BCC000, v2, OS_LOG_TYPE_DEFAULT, "In CATransaction preCommitHandler, WKWebView %p is invalid", (uint8_t *)&v3, 0xCu);
    }
  }
}

- (BOOL)_isValid
{
  WebPageProxy *m_ptr;

  m_ptr = self->_page.m_ptr;
  return m_ptr && !*((_BYTE *)m_ptr + 729) && *((_BYTE *)m_ptr + 728) != 0;
}

- (void)_updateVisibleContentRects
{
  uint64_t m_storage;
  WTF::MonotonicTime *v4;
  double v5;
  double v6;
  optional<WTF::MonotonicTime> *p_timeOfFirstVisibleContentRectUpdateWithPendingCommit;
  double v8;
  NSObject *v9;
  uint64_t v10;
  unint64_t m_identifier;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  void *m_ptr;
  uint64_t v16;
  NSObject *v17;
  uint32_t v18;
  uint64_t v19;
  uint64_t v20;
  _BOOL4 v21;
  int dynamicViewportUpdateMode;
  _BOOL4 needsResetViewStateAfterCommitLoadForMainFrame;
  int v24;
  int v25;
  _BOOL4 currentlyAdjustingScrollViewInsetsForKeyboard;
  NSObject *v27;
  uint64_t v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  void *v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  CGSize size;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  double v61;
  double v62;
  double v63;
  double v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  void *v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  _BOOL8 v87;
  WebPageProxy *v88;
  WebKit::RemoteScrollingCoordinatorProxyIOS *v89;
  double v90;
  double v91;
  double v92;
  double v93;
  WTF::RunLoop *v94;
  double v95;
  double v96;
  double v97;
  void *v98;
  uint64_t v99;
  uint64_t v100;
  Vector<WTF::BlockPtr<void ()>, 0UL, WTF::CrashOnOverflow, 16UL, WTF::FastMalloc> *p_visibleContentRectUpdateCallbacks;
  uint64_t m_size;
  uint64_t v103;
  void (**v104)(_QWORD);
  uint64_t v105;
  unsigned int v106;
  double v107;
  NSObject *v108;
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  CGFloat right;
  CGFloat bottom;
  CGFloat left;
  CGFloat top;
  double v121;
  double v122;
  double v123;
  double v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  double v129;
  double v130;
  double v131;
  double v132;
  double v133;
  double v134;
  double v135;
  double v136;
  double v137;
  _QWORD v138[2];
  _BYTE v139[16];
  _BYTE buf[34];
  unint64_t v141;
  int v142;
  __int16 v143;
  int v144;
  __int16 v145;
  _BOOL4 v146;
  uint64_t v147;

  v147 = *MEMORY[0x1E0C80C00];
  m_storage = self->_viewStabilityWhenVisibleContentRectUpdateScheduled.m_storage;
  v4 = (WTF::MonotonicTime *)-[WKWebView usesStandardContentView](self, "usesStandardContentView");
  if ((v4 & 1) == 0)
  {
    m_ptr = self->_passwordView.m_ptr;
    -[WKWebView bounds](self, "bounds");
    objc_msgSend(m_ptr, "setFrame:");
    objc_msgSend(self->_customContentView.m_ptr, "web_computedContentInsetDidChange");
    self->_perProcessState.didDeferUpdateVisibleContentRectsForAnyReason = 1;
    v12 = qword_1ECE71A28;
    if (!os_log_type_enabled((os_log_t)qword_1ECE71A28, OS_LOG_TYPE_DEFAULT))
      return;
    v16 = *(_QWORD *)(*((_QWORD *)self->_page.m_ptr + 4) + 744);
    *(_DWORD *)buf = 134218240;
    *(_QWORD *)&buf[4] = self;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = v16;
    v14 = "%p (pageProxyID=%llu) -[WKWebView _updateVisibleContentRects:] - usesStandardContentView is NO, bailing";
    goto LABEL_11;
  }
  WTF::MonotonicTime::now(v4);
  v6 = v5;
  p_timeOfFirstVisibleContentRectUpdateWithPendingCommit = &self->_timeOfFirstVisibleContentRectUpdateWithPendingCommit;
  if (self->_timeOfFirstVisibleContentRectUpdateWithPendingCommit.__engaged_)
  {
    v8 = v5 - p_timeOfFirstVisibleContentRectUpdateWithPendingCommit->var0.__val_.m_value;
    if (v8 > 5.0)
    {
      v9 = qword_1ECE71A28;
      if (os_log_type_enabled((os_log_t)qword_1ECE71A28, OS_LOG_TYPE_DEFAULT))
      {
        v10 = *(_QWORD *)(*((_QWORD *)self->_page.m_ptr + 4) + 744);
        m_identifier = self->_perProcessState.lastTransactionID.m_identifier;
        *(_DWORD *)buf = 134218752;
        *(_QWORD *)&buf[4] = self;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = v10;
        *(_WORD *)&buf[22] = 2048;
        *(double *)&buf[24] = v8;
        *(_WORD *)&buf[32] = 2048;
        v141 = m_identifier;
        _os_log_impl(&dword_196BCC000, v9, OS_LOG_TYPE_DEFAULT, "%p (pageProxyID=%llu) -[WKWebView _updateVisibleContentRects:] - have not received a commit %.2fs after visible content rect update; lastTransactionID %llu",
          buf,
          0x2Au);
      }
    }
  }
  if (self->_perProcessState.invokingUIScrollViewDelegateCallback)
  {
    *(_WORD *)&self->_perProcessState.didDeferUpdateVisibleContentRectsForUIScrollViewDelegateCallback = 257;
    v12 = qword_1ECE71A28;
    if (!os_log_type_enabled((os_log_t)qword_1ECE71A28, OS_LOG_TYPE_DEFAULT))
      return;
    v13 = *(_QWORD *)(*((_QWORD *)self->_page.m_ptr + 4) + 744);
    *(_DWORD *)buf = 134218240;
    *(_QWORD *)&buf[4] = self;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = v13;
    v14 = "%p (pageProxyID=%llu) -[WKWebView _updateVisibleContentRects:] - _invokingUIScrollViewDelegateCallback is YES, bailing";
LABEL_11:
    v17 = v12;
    v18 = 22;
LABEL_12:
    _os_log_impl(&dword_196BCC000, v17, OS_LOG_TYPE_DEFAULT, v14, buf, v18);
    return;
  }
  if (!CGRectIsEmpty(self->_perProcessState.animatedResizeOldBounds))
    -[WKWebView _cancelAnimatedResize](self, "_cancelAnimatedResize");
  if (-[WKWebView _shouldDeferGeometryUpdates](self, "_shouldDeferGeometryUpdates")
    || self->_perProcessState.needsResetViewStateAfterCommitLoadForMainFrame
    && !objc_msgSend(self->_contentView.m_ptr, "sizeChangedSinceLastVisibleContentRectUpdate")
    || (objc_msgSend(self->_scrollView.m_ptr, "isZoomBouncing") & 1) != 0
    || self->_perProcessState.currentlyAdjustingScrollViewInsetsForKeyboard)
  {
    *(_WORD *)&self->_perProcessState.didDeferUpdateVisibleContentRectsForAnyReason = 257;
    v19 = qword_1ECE71A28;
    if (os_log_type_enabled((os_log_t)qword_1ECE71A28, OS_LOG_TYPE_DEFAULT))
    {
      v20 = *(_QWORD *)(*((_QWORD *)self->_page.m_ptr + 4) + 744);
      v21 = -[WKWebView _shouldDeferGeometryUpdates](self, "_shouldDeferGeometryUpdates");
      dynamicViewportUpdateMode = self->_perProcessState.dynamicViewportUpdateMode;
      needsResetViewStateAfterCommitLoadForMainFrame = self->_perProcessState.needsResetViewStateAfterCommitLoadForMainFrame;
      v24 = objc_msgSend(self->_contentView.m_ptr, "sizeChangedSinceLastVisibleContentRectUpdate");
      v25 = objc_msgSend(self->_scrollView.m_ptr, "isZoomBouncing");
      currentlyAdjustingScrollViewInsetsForKeyboard = self->_perProcessState.currentlyAdjustingScrollViewInsetsForKeyboard;
      *(_DWORD *)buf = 134219776;
      *(_QWORD *)&buf[4] = self;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = v20;
      *(_WORD *)&buf[22] = 1024;
      *(_DWORD *)&buf[24] = v21;
      *(_WORD *)&buf[28] = 1024;
      *(_DWORD *)&buf[30] = dynamicViewportUpdateMode;
      LOWORD(v141) = 1024;
      *(_DWORD *)((char *)&v141 + 2) = needsResetViewStateAfterCommitLoadForMainFrame;
      HIWORD(v141) = 1024;
      v142 = v24;
      v143 = 1024;
      v144 = v25;
      v145 = 1024;
      v146 = currentlyAdjustingScrollViewInsetsForKeyboard;
      v14 = "%p (pageProxyID=%llu) -[WKWebView _updateVisibleContentRects:] - scroll view state is non-stable, bailing (s"
            "houldDeferGeometryUpdates %d, dynamicViewportUpdateMode %d, needsResetViewStateAfterCommitLoadForMainFrame %"
            "d, sizeChangedSinceLastVisibleContentRectUpdate %d, [_scrollView isZoomBouncing] %d, currentlyAdjustingScrol"
            "lViewInsetsForKeyboard %d)";
      v17 = v19;
      v18 = 58;
      goto LABEL_12;
    }
  }
  else
  {
    if (self->_perProcessState.didDeferUpdateVisibleContentRectsForAnyReason)
    {
      v27 = qword_1ECE71A28;
      if (os_log_type_enabled((os_log_t)qword_1ECE71A28, OS_LOG_TYPE_DEFAULT))
      {
        v28 = *(_QWORD *)(*((_QWORD *)self->_page.m_ptr + 4) + 744);
        *(_DWORD *)buf = 134218240;
        *(_QWORD *)&buf[4] = self;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = v28;
        _os_log_impl(&dword_196BCC000, v27, OS_LOG_TYPE_DEFAULT, "%p (pageProxyID=%llu) -[WKWebView _updateVisibleContentRects:] - performing first visible content rect update after deferring updates", buf, 0x16u);
      }
    }
    *(_WORD *)&self->_perProcessState.didDeferUpdateVisibleContentRectsForUIScrollViewDelegateCallback = 0;
    self->_perProcessState.didDeferUpdateVisibleContentRectsForUnstableScrollView = 0;
    -[WKWebView _updateScrollViewContentInsetsIfNecessary](self, "_updateScrollViewContentInsetsIfNecessary");
    -[WKWebView _visibleContentRect](self, "_visibleContentRect");
    v134 = v30;
    v135 = v29;
    v132 = v32;
    v133 = v31;
    -[WKWebView _computedObscuredInset](self, "_computedObscuredInset");
    v35 = v34;
    v37 = v36;
    v38 = v33;
    v40 = v39;
    if (!self->_haveSetObscuredInsets)
      v38 = v33 - self->_totalScrollViewBottomInsetAdjustmentForKeyboard;
    v41 = (void *)objc_msgSend(-[WKWebView _currentContentView](self, "_currentContentView"), "layer");
    if (v41)
    {
      objc_msgSend(v41, "affineTransform");
      v42 = *(double *)buf;
    }
    else
    {
      v42 = 0.0;
    }
    v137 = v42;
    -[WKWebView bounds](self, "bounds");
    v130 = v44 - (v37 + v40);
    v131 = v37 + v43;
    v136 = v35 + v45;
    v129 = v46 - (v35 + v38);
    if (self->_perProcessState.frozenUnobscuredContentRect.__engaged_)
    {
      size = self->_perProcessState.frozenUnobscuredContentRect.var0.__val_.size;
      *(_OWORD *)buf = *(_OWORD *)&self->_perProcessState.frozenUnobscuredContentRect.var0.__null_state_;
      *(CGSize *)&buf[16] = size;
    }
    else
    {
      -[WKWebView convertRect:toView:](self, "convertRect:toView:", self->_contentView.m_ptr);
      *(_QWORD *)buf = v48;
      *(_QWORD *)&buf[8] = v49;
      *(_QWORD *)&buf[16] = v50;
      *(_QWORD *)&buf[24] = v51;
    }
    WebCore::FloatRect::FloatRect((WebCore::FloatRect *)v139, (const CGRect *)buf);
    if ((objc_msgSend(self->_contentView.m_ptr, "sizeChangedSinceLastVisibleContentRectUpdate") & 1) == 0)
    {
      -[WKWebView _contentBoundsExtendedForRubberbandingWithScale:](self, "_contentBoundsExtendedForRubberbandingWithScale:", v137);
      *(_QWORD *)buf = v52;
      *(_QWORD *)&buf[8] = v53;
      *(_QWORD *)&buf[16] = v54;
      *(_QWORD *)&buf[24] = v55;
      WebCore::FloatRect::FloatRect((WebCore::FloatRect *)v138, (const CGRect *)buf);
      WebCore::FloatRect::intersect((WebCore::FloatRect *)v139, (const WebCore::FloatRect *)v138);
    }
    -[WKWebView currentlyVisibleContentInsetsWithScale:obscuredInsets:](self, "currentlyVisibleContentInsetsWithScale:obscuredInsets:", v137, v35, v37, v38, v40);
    v127 = v57;
    v128 = v56;
    v125 = v59;
    v126 = v58;
    if (!(_DWORD)m_storage)
    {
      v88 = self->_page.m_ptr;
      v89 = (WebKit::RemoteScrollingCoordinatorProxyIOS *)*((_QWORD *)v88 + 25);
      if (v89)
      {
        if (WebKit::RemoteScrollingCoordinatorProxyIOS::hasActiveSnapPoint(*((WebKit::RemoteScrollingCoordinatorProxyIOS **)v88
                                                                            + 25)))
        {
          objc_msgSend(self->_scrollView.m_ptr, "contentOffset");
          v91 = v90;
          v93 = v92;
          *(double *)buf = v90;
          *(double *)&buf[8] = v92;
          v96 = WebKit::RemoteScrollingCoordinatorProxyIOS::nearestActiveContentInsetAdjustedSnapOffset(v89, v136, (const CGPoint *)buf);
          v97 = v95;
          if (v96 != v91 || v95 != v93)
          {
            v98 = self->_scrollView.m_ptr;
            if (v98)
              v94 = (WTF::RunLoop *)CFRetain(self->_scrollView.m_ptr);
            WTF::RunLoop::main(v94);
            if (v98)
              CFRetain(v98);
            v99 = WTF::fastMalloc((WTF *)0x20);
            *(_QWORD *)v99 = &off_1E34C5C20;
            *(_QWORD *)(v99 + 8) = v98;
            *(double *)(v99 + 16) = v96;
            *(double *)(v99 + 24) = v97;
            v138[0] = v99;
            WTF::RunLoop::dispatch();
            v100 = v138[0];
            v138[0] = 0;
            if (v100)
              (*(void (**)(uint64_t))(*(_QWORD *)v100 + 8))(v100);
            if (v98)
              CFRelease(v98);
          }
        }
      }
    }
    v60 = self->_contentView.m_ptr;
    WebCore::FloatRect::operator CGRect();
    v123 = v62;
    v124 = v61;
    v121 = v64;
    v122 = v63;
    left = self->_obscuredInsets.left;
    top = self->_obscuredInsets.top;
    right = self->_obscuredInsets.right;
    bottom = self->_obscuredInsets.bottom;
    -[WKWebView _computedUnobscuredSafeAreaInset](self, "_computedUnobscuredSafeAreaInset");
    v115 = v66;
    v116 = v65;
    v113 = v68;
    v114 = v67;
    y = self->_inputViewBoundsInWindow.origin.y;
    x = self->_inputViewBoundsInWindow.origin.x;
    height = self->_inputViewBoundsInWindow.size.height;
    width = self->_inputViewBoundsInWindow.size.width;
    objc_msgSend(self->_scrollView.m_ptr, "minimumZoomScale");
    v70 = v69;
    v71 = (void *)-[WKWebView _scroller](self, "_scroller");
    v72 = v71;
    if (v71)
    {
      objc_msgSend(v71, "contentInset");
      v74 = v73;
      v76 = v75;
      v78 = v77;
      v80 = v79;
      objc_msgSend(v72, "contentSize");
      v82 = v81;
      v84 = v83;
      objc_msgSend(v72, "bounds");
      v87 = v78 + v74 + v84 > v86 || v80 + v76 + v82 > v85;
    }
    else
    {
      v87 = 0;
    }
    objc_msgSend(v60, "didUpdateVisibleRect:unobscuredRect:contentInsets:unobscuredRectInScrollViewCoordinates:obscuredInsets:unobscuredSafeAreaInsets:inputViewBounds:scale:minimumScale:viewStability:enclosedInScrollableAncestorView:sendEvenIfUnchanged:", m_storage, v87, self->_alwaysSendNextVisibleContentRectUpdate, v135, v134, v133, v132, v124, v123, v122, v121, v128, v127, v126, v125, *(_QWORD *)&v131,
      *(_QWORD *)&v136,
      *(_QWORD *)&v130,
      *(_QWORD *)&v129,
      *(_QWORD *)&top,
      *(_QWORD *)&left,
      *(_QWORD *)&bottom,
      *(_QWORD *)&right,
      v116,
      v115,
      v114,
      v113,
      *(_QWORD *)&x,
      *(_QWORD *)&y,
      *(_QWORD *)&width,
      *(_QWORD *)&height,
      *(_QWORD *)&v137,
      v70);
    p_visibleContentRectUpdateCallbacks = &self->_visibleContentRectUpdateCallbacks;
    while (1)
    {
      m_size = self->_visibleContentRectUpdateCallbacks.m_size;
      if (!(_DWORD)m_size)
        break;
      v103 = (uint64_t)p_visibleContentRectUpdateCallbacks->m_buffer + 8 * m_size;
      v104 = *(void (***)(_QWORD))(v103 - 8);
      *(_QWORD *)(v103 - 8) = 0;
      v105 = self->_visibleContentRectUpdateCallbacks.m_size;
      if (!(_DWORD)v105)
      {
        __break(0xC471u);
        return;
      }
      v106 = v105 - 1;
      _Block_release(*((const void **)p_visibleContentRectUpdateCallbacks->m_buffer + v105 - 1));
      self->_visibleContentRectUpdateCallbacks.m_size = v106;
      v104[2](v104);
      _Block_release(v104);
    }
    v107 = v6 - self->_timeOfRequestForVisibleContentRectUpdate.m_value;
    if (v107 > 1.0)
    {
      v108 = qword_1ECE71A28;
      if (os_log_type_enabled((os_log_t)qword_1ECE71A28, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        *(_QWORD *)&buf[4] = self;
        *(_WORD *)&buf[12] = 2048;
        *(double *)&buf[14] = v107;
        _os_log_impl(&dword_196BCC000, v108, OS_LOG_TYPE_DEFAULT, "%p -[WKWebView _updateVisibleContentRects:] finally ran %.2fs after being scheduled", buf, 0x16u);
      }
    }
    self->_alwaysSendNextVisibleContentRectUpdate = 0;
    self->_timeOfLastVisibleContentRectUpdate.m_value = v6;
    if (!self->_timeOfFirstVisibleContentRectUpdateWithPendingCommit.__engaged_)
    {
      self->_timeOfFirstVisibleContentRectUpdateWithPendingCommit.__engaged_ = 1;
      p_timeOfFirstVisibleContentRectUpdateWithPendingCommit->var0.__val_.m_value = v6;
    }
  }
}

- (id)_currentContentView
{
  if (self->_customContentView.m_ptr)
    return (id)objc_msgSend(self->_customContentView.m_ptr, "web_contentView");
  else
    return self->_contentView.m_ptr;
}

- (UIEdgeInsets)currentlyVisibleContentInsetsWithScale:(double)a3 obscuredInsets:(UIEdgeInsets)a4
{
  double left;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double Width;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v34;
  double v35;
  double v37;
  double v38;
  double Height;
  double v40;
  double top;
  double v42;
  double v43;
  CGRect v45;
  CGRect v46;
  UIEdgeInsets result;

  left = a4.left;
  top = a4.top;
  objc_msgSend(self->_scrollView.m_ptr, "contentInset", a3, a4.top, a4.left, a4.bottom, a4.right);
  v7 = v6;
  v9 = v8;
  v42 = v11;
  v43 = v10;
  objc_msgSend(self->_scrollView.m_ptr, "bounds");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  objc_msgSend(self->_scrollView.m_ptr, "contentSize");
  v21 = v20;
  v40 = v22;
  v23 = left + v13;
  v45.origin.x = v13;
  v45.origin.y = v15;
  v45.size.width = v17;
  v45.size.height = v19;
  Height = CGRectGetHeight(v45);
  v46.origin.x = v13;
  v46.origin.y = v15;
  v46.size.width = v17;
  v46.size.height = v19;
  Width = CGRectGetWidth(v46);
  v25 = *(double *)(MEMORY[0x1E0CEB4B0] + 8);
  if (v9 <= 0.0)
  {
    v26 = a3;
  }
  else
  {
    v26 = a3;
    if (v23 < 0.0)
    {
      v27 = -v23;
      if (v9 < -v23)
        v27 = v9;
      v25 = v27 / a3;
    }
  }
  v28 = top + v15;
  v29 = v21 - Width;
  v30 = *MEMORY[0x1E0CEB4B0];
  if (v7 > 0.0 && v28 < 0.0)
  {
    v31 = -v28;
    if (v7 < -v28)
      v31 = v7;
    v30 = v31 / v26;
  }
  v32 = v40 - Height;
  if (v42 <= 0.0 || v23 <= v29)
  {
    v34 = *(double *)(MEMORY[0x1E0CEB4B0] + 24);
  }
  else
  {
    v35 = v23 - v29;
    if (v42 < v35)
      v35 = v42;
    v34 = v35 / v26;
  }
  if (v43 <= 0.0 || v28 <= v32)
  {
    v37 = *(double *)(MEMORY[0x1E0CEB4B0] + 16);
  }
  else
  {
    v38 = v28 - v32;
    if (v43 < v38)
      v38 = v43;
    v37 = v38 / v26;
  }
  result.right = v34;
  result.bottom = v37;
  result.left = v25;
  result.top = v30;
  return result;
}

- (CGRect)_visibleContentRect
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v7;
  double v8;
  double v9;
  double v10;
  UIView *v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGRect v20;
  CGRect v21;
  CGRect result;
  CGRect v23;

  if (self->_perProcessState.frozenVisibleContentRect.__engaged_)
  {
    x = self->_perProcessState.frozenVisibleContentRect.var0.__val_.origin.x;
    y = self->_perProcessState.frozenVisibleContentRect.var0.__val_.origin.y;
    width = self->_perProcessState.frozenVisibleContentRect.var0.__val_.size.width;
    height = self->_perProcessState.frozenVisibleContentRect.var0.__val_.size.height;
  }
  else
  {
    -[WKWebView bounds](self, "bounds");
    -[WKWebView convertRect:toView:](self, "convertRect:toView:", self->_contentView.m_ptr);
    x = v7;
    y = v8;
    width = v9;
    height = v10;
    v11 = -[WKWebView _enclosingViewForExposedRectComputation](self, "_enclosingViewForExposedRectComputation");
    if (v11)
    {
      -[WKWebView _visibleRectInEnclosingView:](self, "_visibleRectInEnclosingView:", v11);
      -[WKWebView convertRect:toView:](self, "convertRect:toView:", self->_contentView.m_ptr);
      v23.origin.x = v12;
      v23.origin.y = v13;
      v23.size.width = v14;
      v23.size.height = v15;
      v20.origin.x = x;
      v20.origin.y = y;
      v20.size.width = width;
      v20.size.height = height;
      v21 = CGRectIntersection(v20, v23);
      x = v21.origin.x;
      y = v21.origin.y;
      width = v21.size.width;
      height = v21.size.height;
    }
  }
  v16 = x;
  v17 = y;
  v18 = width;
  v19 = height;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (BOOL)_updateScrollViewContentInsetsIfNecessary
{
  return 0;
}

- (UIEdgeInsets)_computedUnobscuredSafeAreaInset
{
  UIEdgeInsets *p_unobscuredSafeAreaInsets;
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  if (self->_haveSetUnobscuredSafeAreaInsets)
  {
    p_unobscuredSafeAreaInsets = &self->_unobscuredSafeAreaInsets;
  }
  else
  {
    if (!-[WKWebView _safeAreaShouldAffectObscuredInsets](self, "_safeAreaShouldAffectObscuredInsets"))
    {
      -[WKWebView safeAreaInsets](self, "safeAreaInsets");
      goto LABEL_7;
    }
    p_unobscuredSafeAreaInsets = (UIEdgeInsets *)MEMORY[0x1E0CEB4B0];
  }
  top = p_unobscuredSafeAreaInsets->top;
  left = p_unobscuredSafeAreaInsets->left;
  bottom = p_unobscuredSafeAreaInsets->bottom;
  right = p_unobscuredSafeAreaInsets->right;
LABEL_7:
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)_overrideLayoutParametersWithMinimumLayoutSize:(CGSize)a3 minimumUnobscuredSizeOverride:(CGSize)a4 maximumUnobscuredSizeOverride:(CGSize)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat v7;
  CGFloat v8;
  double v9;
  double v10;
  NSObject *v12;
  _BOOL4 engaged;
  CGSize v14;
  __int128 v15;
  double v16;
  double v17;
  WebPageProxy *m_ptr;
  WebPageProxy *v19;
  WebPageProxy *v20;
  uint64_t v21;
  _DWORD v22[2];
  _BYTE buf[32];
  CGSize v24;
  uint64_t v25;
  CGSize v26;

  height = a5.height;
  width = a5.width;
  v7 = a4.height;
  v8 = a4.width;
  v9 = a3.height;
  v10 = a3.width;
  v25 = *MEMORY[0x1E0C80C00];
  if (a3.width < 0.0 || a3.height < 0.0)
  {
    v12 = qword_1ECE71AA0;
    if (os_log_type_enabled((os_log_t)qword_1ECE71AA0, OS_LOG_TYPE_FAULT))
    {
      v26.width = v10;
      v26.height = v9;
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "-[WKWebView(WKPrivateIOS) _overrideLayoutParametersWithMinimumLayoutSize:minimumUnobscuredSiz"
                           "eOverride:maximumUnobscuredSizeOverride:]";
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = NSStringFromCGSize(v26);
      _os_log_fault_impl(&dword_196BCC000, v12, OS_LOG_TYPE_FAULT, "%s: Error: attempting to override layout parameters with negative width or height: %@", buf, 0x16u);
    }
  }
  *(_QWORD *)buf = fmax(v10, 0.0);
  *(_QWORD *)&buf[8] = fmax(v9, 0.0);
  *(CGFloat *)&buf[16] = v8;
  *(CGFloat *)&buf[24] = v7;
  v24.width = width;
  v24.height = height;
  engaged = self->_overriddenLayoutParameters.__engaged_;
  v14 = v24;
  v15 = *(_OWORD *)buf;
  self->_overriddenLayoutParameters.var0.__val_.minimumUnobscuredSize = *(CGSize *)&buf[16];
  self->_overriddenLayoutParameters.var0.__val_.maximumUnobscuredSize = v14;
  *(_OWORD *)&self->_overriddenLayoutParameters.var0.__null_state_ = v15;
  if (!engaged)
    self->_overriddenLayoutParameters.__engaged_ = 1;
  if (!-[WKWebView _shouldDeferGeometryUpdates](self, "_shouldDeferGeometryUpdates"))
  {
    WebCore::FloatSize::FloatSize((WebCore::FloatSize *)v22, (const CGSize *)buf);
    LODWORD(v16) = v22[0];
    LODWORD(v17) = v22[1];
    -[WKWebView _dispatchSetViewLayoutSize:](self, "_dispatchSetViewLayoutSize:", v16, v17);
    m_ptr = self->_page.m_ptr;
    WebCore::FloatSize::FloatSize((WebCore::FloatSize *)&v21, (const CGSize *)&buf[16]);
    WebKit::WebPageProxy::setMinimumUnobscuredSize((uint64_t)m_ptr, (const WebCore::FloatSize *)&v21);
    v19 = self->_page.m_ptr;
    WebCore::FloatSize::FloatSize((WebCore::FloatSize *)&v21, &v24);
    WebKit::WebPageProxy::setDefaultUnobscuredSize((uint64_t)v19, (const WebCore::FloatSize *)&v21);
    v20 = self->_page.m_ptr;
    WebCore::FloatSize::FloatSize((WebCore::FloatSize *)&v21, &v24);
    WebKit::WebPageProxy::setMaximumUnobscuredSize((uint64_t)v20, (const WebCore::FloatSize *)&v21);
  }
}

- (void)_recalculateViewportSizesWithMinimumViewportInset:(UIEdgeInsets)a3 maximumViewportInset:(UIEdgeInsets)a4 throwOnInvalidInput:(BOOL)a5
{
  _BOOL4 v5;
  double right;
  double bottom;
  double left;
  double top;
  double v10;
  double v11;
  double v12;
  double v13;
  uint64_t v15;
  CGFloat v16;
  CGFloat v17;
  float v18;
  float v19;
  float v20;
  float v21;
  void *v22;
  uint64_t v23;
  const __CFString *v24;
  NSObject *v25;
  float v26;
  float v27;
  NSObject *v28;
  uint8_t v29[16];
  uint8_t buf[8];
  _QWORD v31[2];
  CGSize v32;
  uint64_t v33;

  v5 = a5;
  right = a4.right;
  bottom = a4.bottom;
  left = a4.left;
  top = a4.top;
  v10 = a3.right;
  v11 = a3.bottom;
  v12 = a3.left;
  v13 = a3.top;
  -[WKWebView frame](self, "frame");
  v31[1] = v15;
  v32.width = v16;
  v32.height = v17;
  WebCore::FloatSize::FloatSize((WebCore::FloatSize *)&v33, &v32);
  v18 = left + right;
  v19 = bottom + top + 0.0;
  v21 = *((float *)&v33 + 1);
  v20 = *(float *)&v33;
  *(float *)v31 = *(float *)&v33 - v18;
  *((float *)v31 + 1) = *((float *)&v33 + 1) - v19;
  if ((float)(*(float *)&v33 - v18) <= 0.0 || (float)(*((float *)&v33 + 1) - v19) <= 0.0)
  {
    if (v18 > 0.0 && v19 > 0.0)
    {
      if (v5)
      {
        v22 = (void *)MEMORY[0x1E0C99DA0];
        v23 = *MEMORY[0x1E0C99778];
        v24 = CFSTR("maximumViewportInset cannot be larger than frame");
LABEL_16:
        objc_msgSend(v22, "raise:format:", v23, v24);
        return;
      }
      v25 = qword_1ECE71A50;
      if (os_log_type_enabled((os_log_t)qword_1ECE71A50, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_196BCC000, v25, OS_LOG_TYPE_ERROR, "maximumViewportInset cannot be larger than frame", buf, 2u);
      }
    }
    v31[0] = v33;
    v21 = *((float *)&v33 + 1);
    v20 = *(float *)&v33;
  }
  v26 = v12 + v10;
  v27 = v11 + v13 + 0.0;
  *(float *)buf = v20 - v26;
  *(float *)&buf[4] = v21 - v27;
  if ((float)(v20 - v26) <= 0.0 || (float)(v21 - v27) <= 0.0)
  {
    if (v26 > 0.0 && v27 > 0.0)
    {
      if (v5)
      {
        v22 = (void *)MEMORY[0x1E0C99DA0];
        v23 = *MEMORY[0x1E0C99778];
        v24 = CFSTR("minimumViewportInset cannot be larger than frame");
        goto LABEL_16;
      }
      v28 = qword_1ECE71A50;
      if (os_log_type_enabled((os_log_t)qword_1ECE71A50, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v29 = 0;
        _os_log_error_impl(&dword_196BCC000, v28, OS_LOG_TYPE_ERROR, "minimumViewportInset cannot be larger than frame", v29, 2u);
      }
    }
    *(_QWORD *)buf = v33;
  }
  if (!self->_overriddenLayoutParameters.__engaged_)
  {
    WebKit::WebPageProxy::setMinimumUnobscuredSize((uint64_t)self->_page.m_ptr, (const WebCore::FloatSize *)v31);
    WebKit::WebPageProxy::setMaximumUnobscuredSize((uint64_t)self->_page.m_ptr, (const WebCore::FloatSize *)buf);
  }
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  objc_super v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[WKWebView frame](self, "frame");
  if (v9 == width && v8 == height)
  {
    v11.receiver = self;
    v11.super_class = (Class)WKWebView;
    -[WKWebView setFrame:](&v11, sel_setFrame_, x, y, width, height);
  }
  else
  {
    -[WKWebView _frameOrBoundsWillChange](self, "_frameOrBoundsWillChange");
    v11.receiver = self;
    v11.super_class = (Class)WKWebView;
    -[WKWebView setFrame:](&v11, sel_setFrame_, x, y, width, height);
    -[WKWebView _frameOrBoundsMayHaveChanged](self, "_frameOrBoundsMayHaveChanged");
    -[WKWebView _acquireResizeAssertionForReason:](self, "_acquireResizeAssertionForReason:", CFSTR("-[WKWebView setFrame:]"));
  }
}

- (void)_frameOrBoundsMayHaveChanged
{
  CGFloat v3;
  double width;
  CGFloat v5;
  double height;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  WebPageProxy *m_ptr;
  _QWORD v14[6];
  CGSize v15;

  -[WKWebView bounds](self, "bounds");
  width = v3;
  height = v5;
  v14[4] = v7;
  v14[5] = v8;
  v15.width = v3;
  v15.height = v5;
  objc_msgSend(self->_scrollView.m_ptr, "setFrame:");
  -[WKWebView _updateFindOverlayPosition](self, "_updateFindOverlayPosition");
  if (self->_perProcessState.liveResizeParameters.__engaged_)
    -[WKWebView _updateLiveResizeTransform](self, "_updateLiveResizeTransform");
  if (!-[WKWebView _shouldDeferGeometryUpdates](self, "_shouldDeferGeometryUpdates"))
  {
    if (!self->_overriddenLayoutParameters.__engaged_)
    {
      -[WKWebView bounds](self, "bounds");
      v14[0] = v9;
      v14[1] = v10;
      v14[2] = v11;
      v14[3] = v12;
      -[WKWebView activeViewLayoutSize:](self, "activeViewLayoutSize:", v14);
      -[WKWebView _dispatchSetViewLayoutSize:](self, "_dispatchSetViewLayoutSize:");
      m_ptr = self->_page.m_ptr;
      WebCore::FloatSize::FloatSize((WebCore::FloatSize *)v14, &v15);
      WebKit::WebPageProxy::setDefaultUnobscuredSize((uint64_t)m_ptr, (const WebCore::FloatSize *)v14);
    }
    -[WKWebView _recalculateViewportSizesWithMinimumViewportInset:maximumViewportInset:throwOnInvalidInput:](self, "_recalculateViewportSizesWithMinimumViewportInset:maximumViewportInset:throwOnInvalidInput:", 0, self->_minimumViewportInset.top, self->_minimumViewportInset.left, self->_minimumViewportInset.bottom, self->_minimumViewportInset.right, self->_maximumViewportInset.top, self->_maximumViewportInset.left, self->_maximumViewportInset.bottom, self->_maximumViewportInset.right);
    -[WKWebView _updateDrawingAreaSize](self, "_updateDrawingAreaSize");
    width = v15.width;
    height = v15.height;
  }
  objc_msgSend(self->_customContentView.m_ptr, "web_setMinimumSize:", width, height);
  -[WKWebView _scheduleVisibleContentRectUpdate](self, "_scheduleVisibleContentRectUpdate");
  -[WKWebView _updatePageLoadObserverState]((uint64_t)self);
}

- (BOOL)_shouldDeferGeometryUpdates
{
  return self->_perProcessState.liveResizeParameters.__engaged_
      || self->_perProcessState.dynamicViewportUpdateMode
      || self->_perProcessState.isAnimatingFullScreenExit;
}

- (void)_scheduleVisibleContentRectUpdate
{
  -[WKWebView _scheduleVisibleContentRectUpdateAfterScrollInView:](self, "_scheduleVisibleContentRectUpdateAfterScrollInView:", self->_scrollView.m_ptr);
}

- (void)scrollViewDidScroll:(id)a3
{
  WebKit::RemoteLayerTreeScrollingPerformanceData *v5;
  unsigned int v6;
  unsigned int v7;
  int v8;
  unsigned int v9;
  unsigned int v10;
  CALayer v11;

  if (self->_scrollView.m_ptr == a3)
    objc_msgSend(a3, "updateInteractiveScrollVelocity");
  if (!-[WKWebView usesStandardContentView](self, "usesStandardContentView")
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(self->_customContentView.m_ptr, "web_scrollViewDidScroll:", a3);
  }
  -[WKWebView _updateFindOverlayPosition](self, "_updateFindOverlayPosition");
  -[WKWebView _scheduleVisibleContentRectUpdateAfterScrollInView:](self, "_scheduleVisibleContentRectUpdateAfterScrollInView:", a3);
  v5 = (WebKit::RemoteLayerTreeScrollingPerformanceData *)*((_QWORD *)self->_page.m_ptr + 114);
  if (v5)
  {
    -[WKWebView visibleRectInViewCoordinates](self, "visibleRectInViewCoordinates");
    v11.super.isa = (Class)__PAIR64__(v7, v6);
    v11._attr.refcount = v8;
    v11._attr.magic = v9;
    v10 = WebKit::RemoteLayerTreeScrollingPerformanceData::blankPixelCount(v5, &v11);
    WebKit::RemoteLayerTreeScrollingPerformanceData::appendBlankPixelCount(v5, 1, v10);
  }
}

- (BOOL)_isBackground
{
  if (-[WKWebView usesStandardContentView](self, "usesStandardContentView") || (objc_opt_respondsToSelector() & 1) == 0)
    return objc_msgSend(self->_contentView.m_ptr, "isBackground");
  else
    return objc_msgSend(self->_customContentView.m_ptr, "web_isBackground");
}

- (BOOL)_safeAreaShouldAffectObscuredInsets
{
  _BOOL4 v3;

  v3 = -[WKWebView usesStandardContentView](self, "usesStandardContentView");
  if (v3)
    LOBYTE(v3) = self->_perProcessState.avoidsUnsafeArea;
  return v3;
}

- (BOOL)usesStandardContentView
{
  return !self->_customContentView.m_ptr && self->_passwordView.m_ptr == 0;
}

- (void)_dispatchSetViewLayoutSize:(FloatSize)a3
{
  WebPageProxy *m_ptr;
  double v5;
  PerWebProcessState *p_perProcessState;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  BOOL v13;
  FloatSize v14;
  FloatSize v15;

  m_ptr = self->_page.m_ptr;
  v15 = a3;
  v5 = *((double *)m_ptr + 127);
  p_perProcessState = &self->_perProcessState;
  if (!self->_perProcessState.lastSentViewLayoutSize.__engaged_
    || ((WebCore::FloatSize::operator CGSize(), v8 = v7, v10 = v9, WebCore::FloatSize::operator CGSize(), v8 == v12)
      ? (v13 = v10 == v11)
      : (v13 = 0),
        !v13
     || !p_perProcessState->lastSentMinimumEffectiveDeviceWidth.__engaged_
     || p_perProcessState->lastSentMinimumEffectiveDeviceWidth.var0.__val_ != v5))
  {
    WebKit::WebPageProxy::setViewportConfigurationViewLayoutSize((uint64_t)self->_page.m_ptr, (const WebCore::FloatSize *)&v15, *((double *)self->_page.m_ptr + 126), v5);
    v14 = v15;
    if (!p_perProcessState->lastSentViewLayoutSize.__engaged_)
      p_perProcessState->lastSentViewLayoutSize.__engaged_ = 1;
    p_perProcessState->lastSentViewLayoutSize.var0.__val_ = v14;
    p_perProcessState->lastSentMinimumEffectiveDeviceWidth.var0.__val_ = v5;
    p_perProcessState->lastSentMinimumEffectiveDeviceWidth.__engaged_ = 1;
  }
}

- (void)_updateDrawingAreaSize
{
  WebPageProxy *m_ptr;
  int32x2_t *v3;
  int32x2_t v5;
  int32x2_t v6;
  CGFloat v7;
  CGFloat v8;
  double v9;
  int32x4_t v10;
  int32x2_t v11[3];
  CGSize v12;
  IntSize v13;

  m_ptr = self->_page.m_ptr;
  if (m_ptr)
  {
    v3 = (int32x2_t *)*((_QWORD *)m_ptr + 23);
    if (v3)
    {
      -[WKWebView bounds](self, "bounds");
      v11[1] = v5;
      v11[2] = v6;
      v12.width = v7;
      v12.height = v8;
      WebCore::IntSize::IntSize((WebCore::IntSize *)&v13, &v12);
      v11[0] = 0;
      if (WebKit::DrawingAreaProxy::setSize(v3, &v13, v11, v9, v10))
      {
        if (-[WKWebView usesStandardContentView](self, "usesStandardContentView"))
          objc_msgSend(self->_contentView.m_ptr, "setSizeChangedSinceLastVisibleContentRectUpdate:", 1);
      }
    }
  }
}

- (void)_updateScrollViewForTransaction:(const void *)a3
{
  WebPageProxy *m_ptr;
  double v6;
  double v7;
  uint64_t v8;
  optional<OverriddenZoomScaleParameters> *p_overriddenZoomScaleParameters;
  double *p_maximumZoomScale;
  BOOL *p_allowUserScaling;
  double v12;
  uint64_t v13;
  int v14;
  _BOOL8 IsEmpty;
  _BOOL4 v16;
  double v17;
  float v18;
  double v19;
  float v20;
  _BOOL4 v21;
  _BOOL4 v22;
  WebPageProxy *v23;
  float *v24;
  float v25;
  float v26;
  BOOL v27;
  float v28;
  _BOOL4 v29;
  _BOOL4 v30;
  void *v31;
  WebKit *v32;
  double v33;
  float v34;
  double v35;
  double v36;
  double v37;
  CGFloat v38;
  UIScrollView *v39;
  CGFloat v40;
  CGPoint v41;
  int v42;

  m_ptr = self->_page.m_ptr;
  objc_msgSend(self->_contentView.m_ptr, "frame");
  v8 = 692;
  if (!*((_BYTE *)m_ptr + 696))
    v8 = 688;
  objc_msgSend(self->_scrollView.m_ptr, "_setContentSizePreservingContentOffsetDuringRubberband:", floor(v6 * *(float *)((char *)m_ptr + v8)) / *(float *)((char *)m_ptr + v8), floor(v7 * *(float *)((char *)m_ptr + v8)) / *(float *)((char *)m_ptr + v8));
  p_overriddenZoomScaleParameters = (optional<OverriddenZoomScaleParameters> *)((char *)a3 + 200);
  p_maximumZoomScale = (double *)((char *)a3 + 208);
  p_allowUserScaling = (BOOL *)a3 + 259;
  if (self->_overriddenZoomScaleParameters.__engaged_)
  {
    p_allowUserScaling = &self->_overriddenZoomScaleParameters.var0.__val_.allowUserScaling;
    p_maximumZoomScale = &self->_overriddenZoomScaleParameters.var0.__val_.maximumZoomScale;
    p_overriddenZoomScaleParameters = &self->_overriddenZoomScaleParameters;
  }
  v12 = *p_maximumZoomScale;
  v13 = *p_allowUserScaling;
  objc_msgSend(self->_scrollView.m_ptr, "setMinimumZoomScale:", p_overriddenZoomScaleParameters->var0.__val_.minimumZoomScale);
  objc_msgSend(self->_scrollView.m_ptr, "setMaximumZoomScale:", v12);
  objc_msgSend(self->_scrollView.m_ptr, "_setZoomEnabledInternal:", v13);
  LODWORD(v13) = WebCore::ScrollingTree::mainFrameHorizontalOverscrollBehavior(*(WebCore::ScrollingTree **)(*((_QWORD *)self->_page.m_ptr + 25) + 24));
  v14 = WebCore::ScrollingTree::mainFrameVerticalOverscrollBehavior(*(WebCore::ScrollingTree **)(*((_QWORD *)self->_page.m_ptr
                                                                                                 + 25)
                                                                                               + 24));
  WebKit::ScrollingTreeScrollingNodeDelegateIOS::updateScrollViewForOverscrollBehavior(self->_scrollView.m_ptr, v13, v14, 0);
  IsEmpty = CGRectIsEmpty(self->_inputViewBoundsInWindow);
  v16 = IsEmpty;
  v17 = *((double *)a3 + 24);
  v18 = v17;
  v19 = *((double *)a3 + 27);
  v20 = v19;
  v21 = !WebKit::scalesAreEssentiallyEqual((WebKit *)IsEmpty, v18, v20);
  v22 = v17 > v19 && v21;
  v23 = self->_page.m_ptr;
  if (!self->_overriddenLayoutParameters.__engaged_
    || ((v24 = (float *)*((_QWORD *)v23 + 4), v25 = v24[200], v26 = v24[201], v24[207] == v25)
      ? (v27 = v24[208] == v26)
      : (v27 = 0),
        v27))
  {
    v30 = 0;
  }
  else
  {
    v28 = v24[571];
    v29 = v25 == v24[570];
    v30 = v26 == v28 && v29;
  }
  if (WebKit::RemoteScrollingCoordinatorProxy::hasScrollableOrZoomedMainFrame(*((WebKit::RemoteScrollingCoordinatorProxy **)v23
                                                                               + 25))
    || !v16
    || v22
    || v30)
  {
    v31 = self->_scrollViewDefaultAllowedTouchTypes.m_ptr;
  }
  else
  {
    v31 = (void *)MEMORY[0x1E0C9AA60];
  }
  objc_msgSend((id)objc_msgSend(self->_scrollView.m_ptr, "panGestureRecognizer"), "setAllowedTouchTypes:", v31);
  objc_msgSend(self->_scrollView.m_ptr, "_setScrollEnabledInternal:", 1);
  if (!*((_BYTE *)a3 + 258)
    && (objc_msgSend(self->_scrollView.m_ptr, "isZooming") & 1) == 0
    && (objc_msgSend(self->_scrollView.m_ptr, "isZoomBouncing") & 1) == 0
    && (objc_msgSend(self->_scrollView.m_ptr, "_wk_isZoomAnimating") & 1) == 0)
  {
    v32 = (WebKit *)objc_msgSend(self->_scrollView.m_ptr, "zoomScale");
    *(float *)&v33 = v33;
    v34 = *((double *)a3 + 24);
    if (!WebKit::scalesAreEssentiallyEqual(v32, *(float *)&v33, v34))
    {
      objc_msgSend(self->_scrollView.m_ptr, "contentOffset");
      v36 = v35 * *((double *)a3 + 24);
      objc_msgSend(self->_scrollView.m_ptr, "zoomScale");
      v38 = v36 / v37;
      objc_msgSend(self->_scrollView.m_ptr, "setZoomScale:", *((double *)a3 + 24));
      v39 = (UIScrollView *)self->_scrollView.m_ptr;
      -[UIScrollView contentOffset](v39, "contentOffset");
      v41.x = v40;
      v41.y = v38;
      WebCore::FloatPoint::FloatPoint((WebCore::FloatPoint *)&v42, &v41);
      changeContentOffsetBoundedInValidRange(v39);
    }
  }
}

- (void)_scheduleVisibleContentRectUpdateAfterScrollInView:(id)a3
{
  WTF::MonotonicTime *v4;
  double v5;
  double v6;
  double v7;
  NSObject *v8;
  double v9;
  double v10;
  WTF::RunLoop *v11;
  _QWORD *v12;
  uint64_t v13;
  _BYTE v14[12];
  __int16 v15;
  double v16;
  __int16 v17;
  double v18;
  __int16 v19;
  _BOOL4 v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = (WTF::MonotonicTime *)-[WKWebView _viewStabilityState:](self, "_viewStabilityState:", a3);
  self->_viewStabilityWhenVisibleContentRectUpdateScheduled.m_storage = v4;
  if (self->_perProcessState.hasScheduledVisibleRectUpdate)
  {
    WTF::MonotonicTime::now(v4);
    v6 = v5;
    v7 = v5 - self->_timeOfRequestForVisibleContentRectUpdate.m_value;
    if (v7 > 1.0)
    {
      v8 = qword_1ECE71A28;
      if (os_log_type_enabled((os_log_t)qword_1ECE71A28, OS_LOG_TYPE_DEFAULT))
      {
        v9 = v6 - self->_timeOfLastVisibleContentRectUpdate.m_value;
        *(_DWORD *)v14 = 134218752;
        *(_QWORD *)&v14[4] = self;
        v15 = 2048;
        v16 = v7;
        v17 = 2048;
        v18 = v9;
        v19 = 1024;
        v20 = -[WKWebView _isValid](self, "_isValid");
        _os_log_impl(&dword_196BCC000, v8, OS_LOG_TYPE_DEFAULT, "-[WKWebView %p _scheduleVisibleContentRectUpdateAfterScrollInView]: hasScheduledVisibleRectUpdate is true but haven't updated visible content rects for %.2fs (last update was %.2fs ago) - valid %d", v14, 0x26u);
      }
    }
  }
  else
  {
    self->_perProcessState.hasScheduledVisibleRectUpdate = 1;
    WTF::MonotonicTime::now(v4);
    self->_timeOfRequestForVisibleContentRectUpdate.m_value = v10;
    v11 = (WTF::RunLoop *)objc_msgSend(MEMORY[0x1E0CD28B0], "currentPhase");
    if (((_DWORD)v11 + 1) > 1)
    {
      WTF::RunLoop::main(v11);
      CFRetain(self);
      v12 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
      *v12 = &off_1E34C5BF8;
      v12[1] = self;
      *(_QWORD *)v14 = v12;
      WTF::RunLoop::dispatch();
      v13 = *(_QWORD *)v14;
      *(_QWORD *)v14 = 0;
      if (v13)
        (*(void (**)(uint64_t))(*(_QWORD *)v13 + 8))(v13);
    }
    else
    {
      -[WKWebView _addUpdateVisibleContentRectPreCommitHandler](self, "_addUpdateVisibleContentRectPreCommitHandler");
    }
  }
}

- (OptionSet<WebKit::ViewStabilityFlag>)_viewStabilityState:(id)a3
{
  unsigned __int8 v5;
  OptionSet<WebKit::ViewStabilityFlag> v6;
  NSNumber *v7;

  v5 = (objc_msgSend(a3, "isDragging") & 1) != 0 || objc_msgSend(a3, "isZooming");
  if ((objc_msgSend(a3, "isDecelerating") & 1) != 0
    || (objc_msgSend(a3, "_wk_isZoomAnimating") & 1) != 0
    || (objc_msgSend(a3, "_wk_isScrollAnimating") & 1) != 0
    || objc_msgSend(a3, "isZoomBouncing"))
  {
    v5 |= 2u;
  }
  if (self->_scrollView.m_ptr == a3 && self->_isChangingObscuredInsetsInteractively)
    v5 |= 8u;
  if (-[WKWebView _scrollViewIsRubberBanding:](self, "_scrollViewIsRubberBanding:", a3))
    v6.m_storage = v5 | 4;
  else
    v6.m_storage = v5;
  v7 = -[WKWebView _stableStateOverride](self, "_stableStateOverride");
  if (v7)
  {
    if (-[NSNumber BOOLValue](v7, "BOOLValue"))
      return (OptionSet<WebKit::ViewStabilityFlag>)0;
    else
      return (OptionSet<WebKit::ViewStabilityFlag>)(v6.m_storage | 0x10);
  }
  return v6;
}

- (NSNumber)_stableStateOverride
{
  return 0;
}

- (void)_updateFindOverlayPosition
{
  optional<FindOverlays> *p_findOverlaysOutsideContentView;
  void *m_ptr;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  double MinX;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  double MinY;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  void *v42;
  double v43;
  double v44;
  double v45;
  double v46;
  void *v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double MaxX;
  double v53;
  double v54;
  double v55;
  double MaxY;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;
  CGRect v64;
  CGRect v65;
  CGRect v66;
  CGRect v67;
  CGRect v68;

  p_findOverlaysOutsideContentView = &self->_findOverlaysOutsideContentView;
  if (self->_findOverlaysOutsideContentView.__engaged_)
  {
    m_ptr = self->_scrollView.m_ptr;
    objc_msgSend(self->_contentView.m_ptr, "bounds");
    v6 = v5;
    v8 = v7;
    objc_msgSend(self->_contentView.m_ptr, "frame");
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v16 = v15;
    objc_msgSend(m_ptr, "contentOffset");
    v55 = v17;
    objc_msgSend(m_ptr, "contentOffset");
    v19 = v18;
    objc_msgSend(m_ptr, "bounds");
    v21 = v20;
    objc_msgSend(m_ptr, "contentOffset");
    v23 = v21 + v22;
    if (v23 >= v6)
      v6 = v23;
    objc_msgSend(m_ptr, "bounds");
    v25 = v24;
    objc_msgSend(m_ptr, "contentOffset");
    v27 = v25 + v26;
    if (v25 + v26 < v8)
      v27 = v8;
    if (!p_findOverlaysOutsideContentView->__engaged_)
      goto LABEL_36;
    v53 = v27;
    v28 = fmin(v19, 0.0);
    v29 = p_findOverlaysOutsideContentView->var0.__val_.top.m_ptr;
    v57.origin.x = v10;
    v57.origin.y = v12;
    v57.size.width = v14;
    v57.size.height = v16;
    MinX = CGRectGetMinX(v57);
    v58.origin.x = v10;
    v58.origin.y = v12;
    v58.size.width = v14;
    v58.size.height = v16;
    v54 = v6;
    v31 = v6 - CGRectGetMinX(v58);
    v32 = v31 >= 0.0 ? v31 : 0.0;
    v59.origin.x = v10;
    v59.origin.y = v12;
    v59.size.width = v14;
    v59.size.height = v16;
    v33 = CGRectGetMinY(v59) - v28;
    v34 = v33 >= 0.0 ? v33 : 0.0;
    objc_msgSend(v29, "setFrame:", MinX, v28, v32, v34);
    if (!p_findOverlaysOutsideContentView->__engaged_)
      goto LABEL_36;
    v35 = p_findOverlaysOutsideContentView->var0.__val_.right.m_ptr;
    v60.origin.x = v10;
    v60.origin.y = v12;
    v60.size.width = v14;
    v60.size.height = v16;
    MaxX = CGRectGetMaxX(v60);
    v61.origin.x = v10;
    v61.origin.y = v12;
    v61.size.width = v14;
    v61.size.height = v16;
    MinY = CGRectGetMinY(v61);
    v62.origin.x = v10;
    v62.origin.y = v12;
    v62.size.width = v14;
    v62.size.height = v16;
    v37 = v54 - CGRectGetMaxX(v62);
    v38 = v37 >= 0.0 ? v37 : 0.0;
    v63.origin.x = v10;
    v63.origin.y = v12;
    v63.size.width = v14;
    v63.size.height = v16;
    v39 = v53 - CGRectGetMinY(v63);
    v40 = v39 >= 0.0 ? v39 : 0.0;
    objc_msgSend(v35, "setFrame:", MaxX, MinY, v38, v40);
    if (!p_findOverlaysOutsideContentView->__engaged_)
      goto LABEL_36;
    v41 = fmin(v55, 0.0);
    v42 = p_findOverlaysOutsideContentView->var0.__val_.bottom.m_ptr;
    v64.origin.x = v10;
    v64.origin.y = v12;
    v64.size.width = v14;
    v64.size.height = v16;
    MaxY = CGRectGetMaxY(v64);
    v65.origin.x = v10;
    v65.origin.y = v12;
    v65.size.width = v14;
    v65.size.height = v16;
    v43 = CGRectGetMaxX(v65) - v41;
    v44 = v43 >= 0.0 ? v43 : 0.0;
    v66.origin.x = v10;
    v66.origin.y = v12;
    v66.size.width = v14;
    v66.size.height = v16;
    v45 = v53 - CGRectGetMaxY(v66);
    v46 = v45 >= 0.0 ? v45 : 0.0;
    objc_msgSend(v42, "setFrame:", v41, MaxY, v44, v46);
    if (p_findOverlaysOutsideContentView->__engaged_)
    {
      v47 = p_findOverlaysOutsideContentView->var0.__val_.left.m_ptr;
      v67.origin.x = v10;
      v67.origin.y = v12;
      v67.size.width = v14;
      v67.size.height = v16;
      v48 = CGRectGetMinX(v67) - v41;
      if (v48 >= 0.0)
        v49 = v48;
      else
        v49 = 0.0;
      v68.origin.x = v10;
      v68.origin.y = v12;
      v68.size.width = v14;
      v68.size.height = v16;
      v50 = CGRectGetMaxY(v68) - v28;
      if (v50 >= 0.0)
        v51 = v50;
      else
        v51 = 0.0;
      objc_msgSend(v47, "setFrame:", v41, v28, v49, v51);
    }
    else
    {
LABEL_36:
      __break(1u);
    }
  }
}

- (BOOL)_scrollViewIsRubberBanding:(id)a3
{
  WebPageProxy *m_ptr;
  uint64_t v5;
  float v6;
  double x;
  double y;
  double v9;
  double v10;
  CGPoint v12;

  m_ptr = self->_page.m_ptr;
  v5 = 692;
  if (!*((_BYTE *)m_ptr + 696))
    v5 = 688;
  v6 = *(float *)((char *)m_ptr + v5);
  objc_msgSend(a3, "contentOffset");
  x = v12.x;
  y = v12.y;
  contentOffsetBoundedInValidRange((UIScrollView *)a3, v12);
  return fabs(x * v6 - v10 * v6) >= 0.00000011920929 || fabs(y * v6 - v9 * v6) >= 0.00000011920929;
}

- (UIEdgeInsets)_computedObscuredInset
{
  CGFloat top;
  CGFloat left;
  CGFloat bottom;
  CGFloat right;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  _BOOL4 v15;
  UIEdgeInsets result;

  if ((WTF::linkedOnOrAfterSDKWithBehavior() & 1) == 0)
  {
    -[WKWebView _computedContentInset](self, "_computedContentInset");
LABEL_5:
    top = v7;
    left = v8;
    bottom = v9;
    right = v10;
    goto LABEL_6;
  }
  if (!self->_haveSetObscuredInsets)
  {
    v15 = -[WKWebView _safeAreaShouldAffectObscuredInsets](self, "_safeAreaShouldAffectObscuredInsets");
    top = *MEMORY[0x1E0CEB4B0];
    left = *(double *)(MEMORY[0x1E0CEB4B0] + 8);
    bottom = *(double *)(MEMORY[0x1E0CEB4B0] + 16);
    right = *(double *)(MEMORY[0x1E0CEB4B0] + 24);
    if (!v15)
      goto LABEL_6;
    -[WKWebView _scrollViewSystemContentInset](self, "_scrollViewSystemContentInset");
    -[WKWebView _effectiveObscuredInsetEdgesAffectedBySafeArea](self, "_effectiveObscuredInsetEdgesAffectedBySafeArea");
    UIEdgeInsetsAdd();
    goto LABEL_5;
  }
  top = self->_obscuredInsets.top;
  left = self->_obscuredInsets.left;
  bottom = self->_obscuredInsets.bottom;
  right = self->_obscuredInsets.right;
LABEL_6:
  v11 = top;
  v12 = left;
  v13 = bottom;
  v14 = right;
  result.right = v14;
  result.bottom = v13;
  result.left = v12;
  result.top = v11;
  return result;
}

- (FloatSize)activeViewLayoutSize:(const CGRect *)a3
{
  optional<OverriddenLayoutParameters> *p_overriddenLayoutParameters;
  double width;
  double height;
  double v6;
  double v7;
  double v8;
  double v9;
  float v10;
  float v11;
  double v12[2];
  _DWORD v13[2];
  FloatSize result;

  p_overriddenLayoutParameters = &self->_overriddenLayoutParameters;
  if (!self->_overriddenLayoutParameters.__engaged_)
  {
    width = a3->size.width;
    height = a3->size.height;
    -[WKWebView _scrollViewSystemContentInset](self, "_scrollViewSystemContentInset");
    p_overriddenLayoutParameters = (optional<OverriddenLayoutParameters> *)v12;
    v12[0] = width - (v6 + v7);
    v12[1] = height - (v8 + v9);
  }
  WebCore::FloatSize::FloatSize((WebCore::FloatSize *)v13, (const CGSize *)p_overriddenLayoutParameters);
  v10 = *(float *)v13;
  v11 = *(float *)&v13[1];
  result.m_height = v11;
  result.m_width = v10;
  return result;
}

- (UIEdgeInsets)_scrollViewSystemContentInset
{
  double v3;
  double v4;
  double v5;
  double v6;
  UIEdgeInsets result;

  objc_msgSend(self->_scrollView.m_ptr, "_contentScrollInset");
  -[WKWebView safeAreaInsets](self, "safeAreaInsets");
  objc_msgSend(self->_scrollView.m_ptr, "_edgesApplyingSafeAreaInsetsToContentInset");
  UIEdgeInsetsAdd();
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (CGRect)_contentBoundsExtendedForRubberbandingWithScale:(double)a3
{
  double x;
  double y;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGPoint v17;
  CGRect result;

  objc_msgSend(self->_scrollView.m_ptr, "contentOffset");
  x = v17.x;
  y = v17.y;
  contentOffsetBoundedInValidRange((UIScrollView *)self->_scrollView.m_ptr, v17);
  v8 = (x - v7) / a3;
  v10 = (y - v9) / a3;
  objc_msgSend(self->_contentView.m_ptr, "bounds");
  v15 = v8 + v13;
  if (v8 <= 0.0)
    v15 = v13;
  v16 = v13 - v8;
  if (v8 < 0.0)
    v11 = v8 + v11;
  else
    v16 = v15;
  if (v10 >= 0.0)
  {
    if (v10 > 0.0)
      v14 = v10 + v14;
  }
  else
  {
    v12 = v10 + v12;
    v14 = v14 - v10;
  }
  result.size.height = v14;
  result.size.width = v16;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (unint64_t)_effectiveObscuredInsetEdgesAffectedBySafeArea
{
  if (-[WKWebView usesStandardContentView](self, "usesStandardContentView"))
    return self->_obscuredInsetEdgesAffectedBySafeArea;
  else
    return 15;
}

- (CGRect)_visibleRectInEnclosingView:(id)a3
{
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGRect v21;
  CGRect v22;
  CGRect result;
  CGRect v24;
  CGRect v25;

  if (a3)
  {
    objc_msgSend(a3, "bounds");
    objc_msgSend(a3, "convertRect:toView:", self);
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
    -[WKWebView bounds](self, "bounds");
    v24.origin.x = v13;
    v24.origin.y = v14;
    v24.size.width = v15;
    v24.size.height = v16;
    v21.origin.x = v6;
    v21.origin.y = v8;
    v21.size.width = v10;
    v21.size.height = v12;
    if (CGRectIntersectsRect(v21, v24))
    {
      -[WKWebView bounds](self, "bounds");
      v25.origin.x = v17;
      v25.origin.y = v18;
      v25.size.width = v19;
      v25.size.height = v20;
      v22.origin.x = v6;
      v22.origin.y = v8;
      v22.size.width = v10;
      v22.size.height = v12;
      return CGRectIntersection(v22, v25);
    }
    else
    {
      return *(CGRect *)*(_QWORD *)&MEMORY[0x1E0C9D648];
    }
  }
  else
  {
    -[WKWebView bounds](self, "bounds");
  }
  return result;
}

- (BOOL)_contentViewIsFirstResponder
{
  return objc_msgSend(-[WKWebView _currentContentView](self, "_currentContentView"), "isFirstResponder");
}

- (NakedPtr<WebKit::WebPageProxy>)_page
{
  WebPageProxy **v2;

  *v2 = self->_page.m_ptr;
  return (NakedPtr<WebKit::WebPageProxy>)self;
}

- (void)_frameOrBoundsWillChange
{
  pair<CGSize, UIInterfaceOrientation> *p_lastKnownWindowSizeAndOrientation;
  double width;
  int64_t second;

  p_lastKnownWindowSizeAndOrientation = &self->_lastKnownWindowSizeAndOrientation;
  width = self->_lastKnownWindowSizeAndOrientation.first.width;
  second = self->_lastKnownWindowSizeAndOrientation.second;
  -[WKWebView _updateLastKnownWindowSizeAndOrientation](self, "_updateLastKnownWindowSizeAndOrientation");
  if (width != p_lastKnownWindowSizeAndOrientation->first.width
    && second == p_lastKnownWindowSizeAndOrientation->second)
  {
    -[WKWebView _beginAutomaticLiveResizeIfNeeded](self, "_beginAutomaticLiveResizeIfNeeded");
  }
}

- (void)_acquireResizeAssertionForReason:(id)a3
{
  WebPageProxy *m_ptr;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  Vector<WTF::RetainPtr<id<_UIInvalidatable>>, 0UL, WTF::CrashOnOverflow, 16UL, WTF::FastMalloc> *p_resizeAssertions;
  uint64_t v10;
  unsigned int v11;
  WTF *v12;
  void *v13;
  void *v14;
  unsigned int *v15;
  unsigned int v16;
  unsigned int v17;
  WTF::RunLoop *v18;
  unsigned int v19;
  uint64_t v20;
  WTF *v21;
  void *v22;
  unsigned int *v23;
  unsigned int v24;
  unsigned int v25;
  id v26;
  unsigned int *v27;
  unsigned int v28;
  unsigned int v29;
  void *v30;
  unsigned int v31;
  unsigned int v32;
  const void *v33;
  const void *v34;
  unint64_t m_size;
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;
  WTF *m_buffer;
  void *v40;
  WTF *v41;
  uint64_t v42;
  WTF *v43;
  const void *v44;
  const void *v45;
  _QWORD *v46;
  uint64_t v47;
  WTF *v48;
  void *v49;
  WTF::RunLoop::TimerBase *v50;
  id location;
  WTF *v52;
  id to;
  WTF *v54;

  m_ptr = self->_page.m_ptr;
  if (!m_ptr)
    goto LABEL_59;
  v6 = *((_QWORD *)m_ptr + 28);
  {
    WebKit::WebPreferencesKey::automaticLiveResizeEnabledKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::automaticLiveResizeEnabledKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::automaticLiveResizeEnabledKey(void)::$_0::operator() const(void)::impl;
  }
  if ((WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)(v6 + 40), (WTF::StringImpl **)&WebKit::WebPreferencesKey::automaticLiveResizeEnabledKey(void)::key, (const WTF::StringImpl *)a3) & 1) == 0)
  {
LABEL_59:
    v7 = objc_msgSend((id)-[WKWebView window](self, "window"), "windowScene");
    if (v7)
    {
      v8 = (void *)v7;
      p_resizeAssertions = &self->_resizeAssertions;
      if (!self->_resizeAssertions.m_size)
      {
        v10 = WTF::fastMalloc((WTF *)8);
        *(_DWORD *)v10 = 1;
        *(_BYTE *)(v10 + 4) = 0;
        location = 0;
        objc_initWeak(&location, self);
        do
          v11 = __ldaxr((unsigned int *)v10);
        while (__stlxr(v11 + 1, (unsigned int *)v10));
        v52 = (WTF *)v10;
        to = 0;
        objc_moveWeak(&to, &location);
        v12 = v52;
        v52 = 0;
        v54 = v12;
        v13 = malloc_type_malloc(0x30uLL, 0x10E0040DAA130B6uLL);
        *(_QWORD *)v13 = MEMORY[0x1E0C809A0];
        *((_QWORD *)v13 + 1) = 50331650;
        *((_QWORD *)v13 + 2) = WTF::BlockPtr<void ()(void)>::fromCallable<-[WKWebView(WKViewInternalIOS) _acquireResizeAssertionForReason:]::$_1>(-[WKWebView(WKViewInternalIOS) _acquireResizeAssertionForReason:]::$_1)::{lambda(void *)#1}::__invoke;
        *((_QWORD *)v13 + 3) = &WTF::BlockPtr<void ()(void)>::fromCallable<-[WKWebView(WKViewInternalIOS) _acquireResizeAssertionForReason:]::$_1>(-[WKWebView(WKViewInternalIOS) _acquireResizeAssertionForReason:]::$_1)::descriptor;
        *((_QWORD *)v13 + 4) = 0;
        objc_moveWeak((id *)v13 + 4, &to);
        *((_QWORD *)v13 + 5) = v54;
        v54 = 0;
        objc_destroyWeak(&to);
        -[WKWebView _doAfterNextVisibleContentRectUpdate:](self, "_doAfterNextVisibleContentRectUpdate:", v13);
        _Block_release(v13);
        v15 = (unsigned int *)v52;
        v52 = 0;
        if (v15)
        {
          do
          {
            v16 = __ldaxr(v15);
            v17 = v16 - 1;
          }
          while (__stlxr(v17, v15));
          if (!v17)
          {
            atomic_store(1u, v15);
            WTF::fastFree((WTF *)v15, v14);
          }
        }
        objc_destroyWeak(&location);
        WTF::RunLoop::main(v18);
        to = 0;
        objc_initWeak(&to, self);
        do
          v19 = __ldaxr((unsigned int *)v10);
        while (__stlxr(v19 + 1, (unsigned int *)v10));
        v54 = (WTF *)v10;
        v20 = WTF::fastMalloc((WTF *)0x18);
        *(_QWORD *)v20 = off_1E34C5BD0;
        *(_QWORD *)(v20 + 8) = 0;
        objc_moveWeak((id *)(v20 + 8), &to);
        v21 = v54;
        v54 = 0;
        *(_QWORD *)(v20 + 16) = v21;
        location = (id)v20;
        WTF::RunLoop::dispatchAfter();
        if (v50)
        {
          v23 = (unsigned int *)((char *)v50 + 24);
          do
          {
            v24 = __ldaxr(v23);
            v25 = v24 - 1;
          }
          while (__stlxr(v25, v23));
          if (!v25)
          {
            atomic_store(1u, (unsigned int *)v50 + 6);
            v47 = *((_QWORD *)v50 + 4);
            *((_QWORD *)v50 + 4) = 0;
            if (v47)
              (*(void (**)(uint64_t))(*(_QWORD *)v47 + 8))(v47);
            WTF::RunLoop::TimerBase::~TimerBase(v50);
            WTF::fastFree(v48, v49);
          }
        }
        v26 = location;
        location = 0;
        if (v26)
          (*(void (**)(id))(*(_QWORD *)v26 + 8))(v26);
        v27 = (unsigned int *)v54;
        v54 = 0;
        if (v27)
        {
          do
          {
            v28 = __ldaxr(v27);
            v29 = v28 - 1;
          }
          while (__stlxr(v29, v27));
          if (!v29)
          {
            atomic_store(1u, v27);
            WTF::fastFree((WTF *)v27, v22);
          }
        }
        objc_destroyWeak(&to);
        do
        {
          v31 = __ldaxr((unsigned int *)v10);
          v32 = v31 - 1;
        }
        while (__stlxr(v32, (unsigned int *)v10));
        if (!v32)
        {
          atomic_store(1u, (unsigned int *)v10);
          WTF::fastFree((WTF *)v10, v30);
        }
      }
      v33 = (const void *)objc_msgSend(v8, "_holdLiveResizeSnapshotForReason:", a3);
      v34 = v33;
      if (v33)
        CFRetain(v33);
      m_size = p_resizeAssertions->m_size;
      if ((_DWORD)m_size == p_resizeAssertions->m_capacity)
      {
        v36 = m_size + (m_size >> 2);
        if (v36 >= 0x10)
          v37 = v36 + 1;
        else
          v37 = 16;
        if (v37 <= m_size + 1)
          v38 = m_size + 1;
        else
          v38 = v37;
        if (v38 >> 29)
        {
          __break(0xC471u);
          return;
        }
        m_buffer = (WTF *)p_resizeAssertions->m_buffer;
        v41 = (WTF *)WTF::fastMalloc((WTF *)(8 * v38));
        p_resizeAssertions->m_capacity = v38;
        p_resizeAssertions->m_buffer = v41;
        if ((_DWORD)m_size)
        {
          v42 = 8 * m_size;
          v43 = m_buffer;
          do
          {
            v44 = *(const void **)v43;
            *(_QWORD *)v43 = 0;
            *(_QWORD *)v41 = v44;
            v45 = *(const void **)v43;
            *(_QWORD *)v43 = 0;
            if (v45)
              CFRelease(v45);
            v41 = (WTF *)((char *)v41 + 8);
            v43 = (WTF *)((char *)v43 + 8);
            v42 -= 8;
          }
          while (v42);
          v41 = (WTF *)p_resizeAssertions->m_buffer;
        }
        if (m_buffer)
        {
          if (v41 == m_buffer)
          {
            p_resizeAssertions->m_buffer = 0;
            p_resizeAssertions->m_capacity = 0;
          }
          WTF::fastFree(m_buffer, v40);
          v41 = (WTF *)p_resizeAssertions->m_buffer;
        }
        m_size = p_resizeAssertions->m_size;
        v46 = (_QWORD *)((char *)v41 + 8 * m_size);
      }
      else
      {
        v46 = (char *)p_resizeAssertions->m_buffer + 8 * m_size;
      }
      *v46 = v34;
      p_resizeAssertions->m_size = m_size + 1;
    }
  }
}

- (void)didMoveToWindow
{
  WebPageProxy *m_ptr;
  WebPageProxy *v4;
  BOOL v5;

  if (!self->_overridesInterfaceOrientation)
    -[WKWebView _dispatchSetDeviceOrientation:](self, "_dispatchSetDeviceOrientation:", -[WKWebView _deviceOrientationIgnoringOverrides](self, "_deviceOrientationIgnoringOverrides"));
  -[WKWebView _dispatchSetOrientationForMediaCapture:](self, "_dispatchSetOrientationForMediaCapture:", -[WKWebView _deviceOrientationIgnoringOverrides](self, "_deviceOrientationIgnoringOverrides"));
  WebKit::WebPageProxy::activityStateDidChange((uint64_t)self->_page.m_ptr, 1023, 0, 0);
  WebKit::WebPageProxy::webViewDidMoveToWindow((WebKit::WebPageProxy *)self->_page.m_ptr);
  -[WKWebView _presentLockdownModeAlertIfNeeded](self, "_presentLockdownModeAlertIfNeeded");
  m_ptr = self->_page.m_ptr;
  if (!*((_BYTE *)m_ptr + 729) && *((_BYTE *)m_ptr + 728) && -[WKWebView window](self, "window"))
  {
    v4 = self->_page.m_ptr;
    v5 = -[WKWebView _isWindowResizingEnabled](self, "_isWindowResizingEnabled");
    WebKit::AuxiliaryProcessProxy::send<Messages::WebPage::SetIsWindowResizingEnabled>(*((_QWORD *)v4 + 26), &v5, *(_QWORD *)(*((_QWORD *)v4 + 4) + 1896), 0);
  }
  -[WKWebView _invalidateResizeAssertions](self, "_invalidateResizeAssertions");
  -[WKWebView _endLiveResize](self, "_endLiveResize");
  -[WKWebView _updateLastKnownWindowSizeAndOrientation](self, "_updateLastKnownWindowSizeAndOrientation");
}

- (void)_setupScrollAndContentViews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  WKScrollView *v11;
  void *m_ptr;
  void *v13;
  void *v14;
  void *v15;

  -[WKWebView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = -[WKScrollView initWithFrame:]([WKScrollView alloc], "initWithFrame:", v3, v5, v7, v9);
  m_ptr = self->_scrollView.m_ptr;
  self->_scrollView.m_ptr = v11;
  if (m_ptr)
  {
    CFRelease(m_ptr);
    v11 = (WKScrollView *)self->_scrollView.m_ptr;
  }
  -[WKScrollView setInternalDelegate:](v11, "setInternalDelegate:", self);
  objc_msgSend(self->_scrollView.m_ptr, "setBaseScrollViewDelegate:", self);
  objc_msgSend(self->_scrollView.m_ptr, "setBouncesZoom:", 1);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(self->_scrollView.m_ptr, "setTracksImmediatelyWhileDecelerating:", 0);
    objc_msgSend(self->_scrollView.m_ptr, "_setAvoidsJumpOnInterruptedBounce:", 1);
  }
  v13 = (void *)objc_msgSend((id)objc_msgSend(self->_scrollView.m_ptr, "panGestureRecognizer"), "allowedTouchTypes");
  v14 = v13;
  if (v13)
    CFRetain(v13);
  v15 = self->_scrollViewDefaultAllowedTouchTypes.m_ptr;
  self->_scrollViewDefaultAllowedTouchTypes.m_ptr = v14;
  if (v15)
    CFRelease(v15);
  -[WKWebView _updateScrollViewInsetAdjustmentBehavior](self, "_updateScrollViewInsetAdjustmentBehavior");
  -[WKWebView addSubview:](self, "addSubview:", self->_scrollView.m_ptr);
  -[WKWebView _dispatchSetDeviceOrientation:](self, "_dispatchSetDeviceOrientation:", -[WKWebView _deviceOrientationIgnoringOverrides](self, "_deviceOrientationIgnoringOverrides"));
  -[WKWebView _dispatchSetOrientationForMediaCapture:](self, "_dispatchSetOrientationForMediaCapture:", -[WKWebView _deviceOrientationIgnoringOverrides](self, "_deviceOrientationIgnoringOverrides"));
  objc_msgSend((id)objc_msgSend(self->_contentView.m_ptr, "layer"), "setAnchorPoint:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
  objc_msgSend(self->_contentView.m_ptr, "setFrame:", v4, v6, v8, v10);
  objc_msgSend(self->_scrollView.m_ptr, "addSubview:", self->_contentView.m_ptr);
  objc_msgSend(self->_scrollView.m_ptr, "addSubview:", objc_msgSend(self->_contentView.m_ptr, "unscaledView"));
}

- (int)_deviceOrientationIgnoringOverrides
{
  void *v3;
  char *v4;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  if ((objc_msgSend(v3, "_appAdoptsUISceneLifecycle") & 1) != 0)
  {
    v4 = (char *)objc_msgSend((id)-[WKWebView window](self, "window"), "windowScene");
    if (!v4)
      return (int)v4;
    v4 = (char *)objc_msgSend(v4, "interfaceOrientation");
  }
  else
  {
    v4 = (char *)objc_msgSend(v3, "statusBarOrientation");
  }
  if ((unint64_t)(v4 - 2) > 2)
    LODWORD(v4) = 0;
  else
    LODWORD(v4) = dword_1978CFAE8[(_QWORD)(v4 - 2)];
  return (int)v4;
}

- (void)_dispatchSetDeviceOrientation:(int)a3
{
  PerWebProcessState *p_perProcessState;

  p_perProcessState = &self->_perProcessState;
  if (!self->_perProcessState.lastSentDeviceOrientation.__engaged_
    || self->_perProcessState.lastSentDeviceOrientation.var0.__val_ != a3)
  {
    WebKit::WebPageProxy::setDeviceOrientation((WebKit::WebPageProxy *)self->_page.m_ptr, a3);
    p_perProcessState->lastSentDeviceOrientation.var0.__val_ = a3;
    p_perProcessState->lastSentDeviceOrientation.__engaged_ = 1;
  }
}

- (void)_dispatchSetOrientationForMediaCapture:(int)a3
{
  PerWebProcessState *p_perProcessState;

  p_perProcessState = &self->_perProcessState;
  if (!self->_perProcessState.lastSentOrientationForMediaCapture.__engaged_
    || self->_perProcessState.lastSentOrientationForMediaCapture.var0.__val_ != a3)
  {
    WebKit::WebPageProxy::setOrientationForMediaCapture((unsigned int *)self->_page.m_ptr, *(uint64_t *)&a3, *(const WTF::StringImpl **)&a3);
    p_perProcessState->lastSentOrientationForMediaCapture.var0.__val_ = a3;
    p_perProcessState->lastSentOrientationForMediaCapture.__engaged_ = 1;
  }
}

- (BOOL)_isWindowResizingEnabled
{
  return objc_msgSend((id)objc_msgSend((id)-[WKWebView window](self, "window"), "windowScene"), "_enhancedWindowingEnabled");
}

- (void)_updateScrollViewInsetAdjustmentBehavior
{
  void *m_ptr;
  uint64_t v4;

  if ((objc_msgSend(self->_scrollView.m_ptr, "_contentInsetAdjustmentBehaviorWasExternallyOverridden") & 1) == 0)
  {
    m_ptr = self->_scrollView.m_ptr;
    if (-[WKWebView _safeAreaShouldAffectObscuredInsets](self, "_safeAreaShouldAffectObscuredInsets"))
      v4 = 3;
    else
      v4 = 2;
    objc_msgSend(m_ptr, "_setContentInsetAdjustmentBehaviorInternal:", v4);
  }
}

- (void)_invalidateResizeAssertions
{
  CFTypeRef *m_buffer;
  uint64_t m_size;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[2];
  CFTypeRef *v8;
  unsigned int m_capacity;
  int v10;

  m_buffer = (CFTypeRef *)self->_resizeAssertions.m_buffer;
  v8 = m_buffer;
  m_size = self->_resizeAssertions.m_size;
  m_capacity = self->_resizeAssertions.m_capacity;
  v10 = m_size;
  v7[0] = 0;
  self->_resizeAssertions.m_buffer = 0;
  v7[1] = 0;
  *(_QWORD *)&self->_resizeAssertions.m_capacity = 0;
  WTF::Vector<WTF::RetainPtr<__SecCertificate *>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)v7, (void *)a2);
  if ((_DWORD)m_size)
  {
    v5 = 8 * m_size;
    do
    {
      v6 = (void *)*m_buffer;
      if (*m_buffer)
        CFRetain(*m_buffer);
      objc_msgSend(v6, "_invalidate");
      if (v6)
        CFRelease(v6);
      ++m_buffer;
      v5 -= 8;
    }
    while (v5);
  }
  WTF::Vector<WTF::RetainPtr<__SecCertificate *>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v8, v4);
}

- (void)_presentLockdownModeAlertIfNeeded
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__WKWebView_WKViewInternalIOS___presentLockdownModeAlertIfNeeded__block_invoke;
  block[3] = &unk_1E34BAF80;
  block[4] = self;
  if (-[WKWebView(WKViewInternalIOS) _presentLockdownModeAlertIfNeeded]::onceToken != -1)
    dispatch_once(&-[WKWebView(WKViewInternalIOS) _presentLockdownModeAlertIfNeeded]::onceToken, block);
  if (lockdownModeWarningNeeded)
  {
    if (self->_needsToPresentLockdownModeMessage)
    {
      -[WKWebView _presentLockdownMode](self, "_presentLockdownMode");
      self->_needsToPresentLockdownModeMessage = 0;
    }
  }
}

- (BOOL)_haveSetObscuredInsets
{
  return self->_haveSetObscuredInsets;
}

- (NSString)title
{
  uint64_t v2;
  uint64_t v3;

  v2 = *((_QWORD *)self->_page.m_ptr + 4);
  v3 = 1056;
  if (!*(_QWORD *)(v2 + 1056))
    v3 = 1048;
  if (*(_QWORD *)(v2 + v3))
    return (NSString *)WTF::StringImpl::operator NSString *();
  else
    return (NSString *)&stru_1E351F1B8;
}

- (BOOL)isLoading
{
  uint64_t v2;
  _BOOL4 v3;
  unsigned int v4;

  v2 = *((_QWORD *)self->_page.m_ptr + 4);
  if (*(_QWORD *)(v2 + 984))
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    v4 = *(unsigned __int8 *)(v2 + 968);
    if (v4 > 2)
      LOBYTE(v3) = 0;
    else
      return (3u >> (v4 & 7)) & 1;
  }
  return v3;
}

- (void)evaluateJavaScript:(NSString *)javaScriptString completionHandler:(void *)completionHandler
{
  WebPageProxy *m_ptr;

  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((_BYTE *)m_ptr + 1290))
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("The WKWebView is suspended"));
  -[WKWebView _evaluateJavaScript:asAsyncFunction:withSourceURL:withArguments:forceUserGesture:inFrame:inWorld:completionHandler:](self, "_evaluateJavaScript:asAsyncFunction:withSourceURL:withArguments:forceUserGesture:inFrame:inWorld:completionHandler:", javaScriptString, 0, 0, 0, 1, 0, +[WKContentWorld pageWorld](WKContentWorld, "pageWorld"), completionHandler);
}

- (void)_evaluateJavaScript:(id)a3 asAsyncFunction:(BOOL)a4 withSourceURL:(id)a5 withArguments:(id)a6 forceUserGesture:(BOOL)a7 inFrame:(id)a8 inWorld:(id)a9 completionHandler:(id)a10
{
  WTF::RunLoop *v10;
  uint64_t v11;
  _BOOL4 v13;
  WebPageProxy *m_ptr;
  WebKit *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  objc_object *v20;
  WTF::StringImpl *v21;
  const WTF::StringImpl *v22;
  uint64_t v23;
  int v24;
  unsigned int v25;
  unsigned int v26;
  _QWORD *v27;
  uint64_t v28;
  int i;
  unsigned int v30;
  uint64_t v31;
  WTF *v32;
  WTF::StringImpl *v33;
  WTF::StringImpl *v34;
  WTF::StringImpl *v35;
  int v36;
  int v37;
  uint64_t v38;
  unint64_t v39;
  WTF::StringImpl *v40;
  WTF::StringImpl *v41;
  const __CFString *v42;
  WTF::StringImpl *v43;
  void *v44;
  WTF::StringImpl *v45;
  unint64_t v46;
  uint64_t v47;
  char v48;
  char shouldEvaluateJavaScriptWithoutTransientActivation;
  WebPageProxy *v50;
  WTF::StringImpl *v51;
  WTF::StringImpl *v52;
  uint64_t v53;
  _QWORD *v54;
  uint64_t v55;
  WTF::StringImpl *v56;
  WTF::StringImpl *v57;
  WTF::StringImpl *v58;
  WTF::StringImpl *v59;
  uint64_t v60;
  char v61;
  char v62;
  void *v67;
  WTF::RunLoop *v68;
  uint64_t v69;
  _QWORD *v70;
  _QWORD v71[2];
  char v72;
  WTF::StringImpl *v73;
  __int128 v74;
  __int128 v75;
  WTF::StringImpl *v76;
  WTF::StringImpl *v77;
  char v78;
  WTF::StringImpl *v79;
  __int128 v80;
  __int128 v81;
  char v82;
  uint64_t v83;
  char v84;
  char v85;
  char v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  uint64_t v91;
  char v92;
  _BYTE v93[128];
  uint64_t v94;

  HIDWORD(v60) = a7;
  v13 = a4;
  v94 = *MEMORY[0x1E0C80C00];
  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((_BYTE *)m_ptr + 1290))
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("The WKWebView is suspended"));
  v67 = (void *)objc_msgSend(a10, "copy");
  LOBYTE(v91) = 0;
  v92 = 0;
  if (v13)
  {
    v91 = 0;
    v92 = 1;
  }
  LODWORD(v60) = v13;
  v89 = 0u;
  v90 = 0u;
  v87 = 0u;
  v88 = 0u;
  v15 = (WebKit *)objc_msgSend(a6, "countByEnumeratingWithState:objects:count:", &v87, v93, 16, v60);
  if (!v15)
  {
LABEL_62:
    v46 = (unint64_t)a8;
    if (a8)
    {
      v15 = (WebKit *)objc_msgSend(a8, "_handle");
      if (v15)
      {
        v15 = (WebKit *)objc_msgSend(a8, "_handle");
        if (*((_QWORD *)v15 + 3))
        {
          v15 = (WebKit *)objc_msgSend(a8, "_handle");
          v47 = *((_QWORD *)v15 + 3);
          v11 = *((_QWORD *)v15 + 4);
          v46 = v47 & 0xFFFFFFFFFFFFFF00;
          v48 = 1;
LABEL_68:
          shouldEvaluateJavaScriptWithoutTransientActivation = WebKit::shouldEvaluateJavaScriptWithoutTransientActivation(v15);
          v50 = self->_page.m_ptr;
          a6 = v67;
          MEMORY[0x19AEABCC8](&v76, a3);
          MEMORY[0x19AEABB18](&v73, a5);
          v51 = v76;
          v76 = 0;
          v77 = v51;
          v78 = 0;
          v52 = v73;
          v73 = 0;
          v79 = v52;
          v80 = v74;
          v81 = v75;
          LODWORD(v74) = v74 & 0xFFFFFFFE;
          v82 = v61;
          LOBYTE(v83) = 0;
          v84 = 0;
          if (v92)
          {
            v53 = v91;
            v91 = 0;
            v83 = v53;
            v84 = 1;
          }
          v85 = v62;
          v86 = shouldEvaluateJavaScriptWithoutTransientActivation;
          v71[0] = v47 | v46;
          v71[1] = v11;
          v72 = v48;
          if (v67)
            CFRetain(v67);
          v54 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
          *v54 = &off_1E34BD178;
          v54[1] = v67;
          v70 = v54;
          WebKit::WebPageProxy::runJavaScriptInFrameInScriptWorld((uint64_t)v50, (uint64_t *)&v77, (uint64_t)v71, (uint64_t)a9 + 8, (uint64_t *)&v70);
          v55 = (uint64_t)v70;
          v70 = 0;
          if (v55)
            (*(void (**)(uint64_t))(*(_QWORD *)v55 + 8))(v55);
          if (v84 && v83)
            WTF::HashTable<WTF::String,WTF::KeyValuePair<WTF::String,WTF::Vector<unsigned char,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<WTF::String,WTF::Vector<unsigned char,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>>>,WTF::DefaultHash<WTF::String>,WTF::HashMap<WTF::String,WTF::Vector<unsigned char,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Vector<unsigned char,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<WTF::String>>::deallocateTable(v83, v44);
          v56 = v79;
          v79 = 0;
          if (v56)
          {
            if (*(_DWORD *)v56 == 2)
              WTF::StringImpl::destroy(v56, (WTF::StringImpl *)v44);
            else
              *(_DWORD *)v56 -= 2;
          }
          v57 = v77;
          v77 = 0;
          if (v57)
          {
            if (*(_DWORD *)v57 == 2)
              WTF::StringImpl::destroy(v57, (WTF::StringImpl *)v44);
            else
              *(_DWORD *)v57 -= 2;
          }
          v58 = v73;
          v73 = 0;
          if (v58)
          {
            if (*(_DWORD *)v58 == 2)
              WTF::StringImpl::destroy(v58, (WTF::StringImpl *)v44);
            else
              *(_DWORD *)v58 -= 2;
          }
          v59 = v76;
          v76 = 0;
          if (v59)
          {
            if (*(_DWORD *)v59 == 2)
              WTF::StringImpl::destroy(v59, (WTF::StringImpl *)v44);
            else
              *(_DWORD *)v59 -= 2;
          }
          goto LABEL_93;
        }
      }
      v46 = 0;
    }
    LOBYTE(v47) = 0;
    v48 = 0;
    goto LABEL_68;
  }
  v69 = *(_QWORD *)v88;
  v16 = 24;
LABEL_8:
  v68 = v15;
  v17 = 0;
LABEL_9:
  if (*(_QWORD *)v88 != v69)
    objc_enumerationMutation(a6);
  v18 = *(_QWORD *)(*((_QWORD *)&v87 + 1) + 8 * v17);
  v19 = objc_msgSend(a6, "objectForKey:", v18);
  API::SerializedScriptValue::createFromNSObject(v19, v20, &v77);
  if (v77)
  {
    if (!v92)
    {
      __break(1u);
      goto LABEL_100;
    }
    MEMORY[0x19AEABCC8](&v73, v18);
    v23 = *((_QWORD *)v77 + 2);
    v11 = v91;
    if (v91
      || (WTF::HashTable<WTF::String,WTF::KeyValuePair<WTF::String,WTF::Vector<unsigned char,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<WTF::String,WTF::Vector<unsigned char,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>>>,WTF::DefaultHash<WTF::String>,WTF::HashMap<WTF::String,WTF::Vector<unsigned char,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Vector<unsigned char,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<WTF::String>>::expand(&v91, 0), (v11 = v91) != 0))
    {
      v24 = *(_DWORD *)(v11 - 8);
    }
    else
    {
      v24 = 0;
    }
    v25 = *((_DWORD *)v73 + 4);
    if (v25 >= 0x100)
      v26 = v25 >> 8;
    else
      v26 = WTF::StringImpl::hashSlowCase(v73);
    v27 = 0;
    v28 = v23 + 8;
    for (i = 1; ; ++i)
    {
      v30 = v26 & v24;
      v31 = v11 + 24 * (v26 & v24);
      v32 = *(WTF **)v31;
      if (*(_QWORD *)v31 == -1)
      {
        v27 = (_QWORD *)(v11 + 24 * v30);
      }
      else
      {
        if (!v32)
        {
          if (v27)
          {
            *v27 = 0;
            v27[1] = 0;
            v27[2] = 0;
            --*(_DWORD *)(v91 - 16);
            v31 = (uint64_t)v27;
          }
          v33 = v73;
          v73 = 0;
          v34 = *(WTF::StringImpl **)v31;
          *(_QWORD *)v31 = v33;
          v10 = v68;
          if (v34)
          {
            if (*(_DWORD *)v34 == 2)
              WTF::StringImpl::destroy(v34, v21);
            else
              *(_DWORD *)v34 -= 2;
          }
          WTF::Vector<unsigned char,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::operator=((unsigned int *)(v31 + 8), v28);
          if (v91)
            v36 = *(_DWORD *)(v91 - 12) + 1;
          else
            v36 = 1;
          *(_DWORD *)(v91 - 12) = v36;
          if (v91)
            v37 = *(_DWORD *)(v91 - 12);
          else
            v37 = 0;
          v38 = (*(_DWORD *)(v91 - 16) + v37);
          v39 = *(unsigned int *)(v91 - 4);
          if (v39 > 0x400)
          {
            if (v39 <= 2 * v38)
LABEL_40:
              WTF::HashTable<WTF::String,WTF::KeyValuePair<WTF::String,WTF::Vector<unsigned char,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<WTF::String,WTF::Vector<unsigned char,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>>>,WTF::DefaultHash<WTF::String>,WTF::HashMap<WTF::String,WTF::Vector<unsigned char,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Vector<unsigned char,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<WTF::String>>::expand(&v91, v31);
          }
          else if (3 * v39 <= 4 * v38)
          {
            goto LABEL_40;
          }
LABEL_41:
          v40 = v73;
          v73 = 0;
          if (v40)
          {
            if (*(_DWORD *)v40 == 2)
              WTF::StringImpl::destroy(v40, v35);
            else
              *(_DWORD *)v40 -= 2;
          }
          v41 = v77;
          v77 = 0;
          if (v41)
            CFRelease(*((CFTypeRef *)v41 + 1));
          if ((WTF::RunLoop *)++v17 == v10)
          {
            v15 = (WebKit *)objc_msgSend(a6, "countByEnumeratingWithState:objects:count:", &v87, v93, 16);
            if (!v15)
              goto LABEL_62;
            goto LABEL_8;
          }
          goto LABEL_9;
        }
        if (WTF::equal(v32, v73, v22))
        {
          WTF::Vector<unsigned char,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::operator=((unsigned int *)(v11 + 24 * v30 + 8), v28);
          v10 = v68;
          goto LABEL_41;
        }
      }
      v26 = i + v30;
    }
  }
  if (!v67)
    goto LABEL_62;
  v16 = (uint64_t)objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend((id)v16, "setObject:forKey:", localizedDescriptionForErrorCode(WKErrorJavaScriptExceptionOccurred, v42), *MEMORY[0x1E0CB2D50]);
  objc_msgSend((id)v16, "setObject:forKey:", CFSTR("Function argument values must be one of the following types, or contain only the following types: NSNumber, NSNull, NSDate, NSString, NSArray, and NSDictionary"), CFSTR("WKJavaScriptExceptionMessage"));
  a6 = v67;
  v10 = (WTF::RunLoop *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("WKErrorDomain"), 4, v16);
  WTF::RunLoop::main(v10);
  CFRetain(v67);
  if (v10)
    CFRetain(v10);
  v43 = (WTF::StringImpl *)WTF::fastMalloc((WTF *)0x18);
  *(_QWORD *)v43 = &off_1E34BD150;
  *((_QWORD *)v43 + 1) = v67;
  *((_QWORD *)v43 + 2) = v10;
  v77 = v43;
  WTF::RunLoop::dispatch();
  v45 = v77;
  v77 = 0;
  if (v45)
    (*(void (**)(WTF::StringImpl *))(*(_QWORD *)v45 + 8))(v45);
  if (!v10)
  {
    if (!v16)
      goto LABEL_93;
    goto LABEL_61;
  }
LABEL_100:
  CFRelease(v10);
  if (v16)
LABEL_61:
    CFRelease((CFTypeRef)v16);
LABEL_93:
  if (v92 && v91)
    WTF::HashTable<WTF::String,WTF::KeyValuePair<WTF::String,WTF::Vector<unsigned char,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<WTF::String,WTF::Vector<unsigned char,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>>>,WTF::DefaultHash<WTF::String>,WTF::HashMap<WTF::String,WTF::Vector<unsigned char,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Vector<unsigned char,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<WTF::String>>::deallocateTable(v91, v44);
  if (a6)
    CFRelease(a6);
}

- (UIView)_safeBrowsingWarning
{
  return (UIView *)self->_safeBrowsingWarning.m_ptr;
}

- (void)_setUnobscuredSafeAreaInsets:(UIEdgeInsets)a3
{
  self->_haveSetUnobscuredSafeAreaInsets = 1;
  if (self->_unobscuredSafeAreaInsets.left != a3.left
    || self->_unobscuredSafeAreaInsets.top != a3.top
    || self->_unobscuredSafeAreaInsets.right != a3.right
    || self->_unobscuredSafeAreaInsets.bottom != a3.bottom)
  {
    self->_unobscuredSafeAreaInsets = a3;
    -[WKWebView _scheduleVisibleContentRectUpdate](self, "_scheduleVisibleContentRectUpdate");
  }
}

- (void)_layerTreeCommitComplete
{
  self->_perProcessState.commitDidRestoreScrollPosition = 0;
}

- (UIScrollView)scrollView
{
  return (UIScrollView *)self->_scrollView.m_ptr;
}

- (BOOL)_allowsViewportShrinkToFit
{
  return self->_allowsViewportShrinkToFit;
}

- (void)_addUpdateVisibleContentRectPreCommitHandler
{
  void *v3;
  CFTypeRef v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t);
  void *v8;
  CFTypeRef cf;

  if (self)
  {
    CFRetain(self);
    v3 = (void *)MEMORY[0x1E0CD28B0];
    v5 = MEMORY[0x1E0C809B0];
    v6 = 3321888768;
    v7 = __76__WKWebView_WKViewInternalIOS___addUpdateVisibleContentRectPreCommitHandler__block_invoke;
    v8 = &__block_descriptor_40_e8_32c90_ZTSKZ76__WKWebView_WKViewInternalIOS___addUpdateVisibleContentRectPreCommitHandler_E4__11_e5_v8__0l;
    CFRetain(self);
    cf = self;
    CFRetain(self);
  }
  else
  {
    v3 = (void *)MEMORY[0x1E0CD28B0];
    v5 = MEMORY[0x1E0C809B0];
    v6 = 3321888768;
    v7 = __76__WKWebView_WKViewInternalIOS___addUpdateVisibleContentRectPreCommitHandler__block_invoke;
    v8 = &__block_descriptor_40_e8_32c90_ZTSKZ76__WKWebView_WKViewInternalIOS___addUpdateVisibleContentRectPreCommitHandler_E4__11_e5_v8__0l;
    cf = 0;
  }
  objc_msgSend(v3, "addCommitHandler:forPhase:", &v5, 1);
  if (self)
    CFRelease(self);
  v4 = cf;
  cf = 0;
  if (v4)
    CFRelease(v4);
  if (self)
    CFRelease(self);
}

+ (BOOL)handlesURLScheme:(NSString *)urlScheme
{
  const WTF::String *v3;
  WTF::StringImpl *v4;
  char isBuiltinScheme;
  WTF::StringImpl *v6;
  WTF::StringImpl *v8;

  MEMORY[0x19AEABCC8](&v8, urlScheme);
  isBuiltinScheme = WebCore::LegacySchemeRegistry::isBuiltinScheme((WebCore::LegacySchemeRegistry *)&v8, v3);
  v6 = v8;
  v8 = 0;
  if (v6)
  {
    if (*(_DWORD *)v6 == 2)
      WTF::StringImpl::destroy(v6, v4);
    else
      *(_DWORD *)v6 -= 2;
  }
  return isBuiltinScheme;
}

- (void)setAllowsLinkPreview:(BOOL)allowsLinkPreview
{
  _BOOL4 v3;
  WebPageProxy *m_ptr;
  void *v6;

  v3 = allowsLinkPreview;
  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((_BYTE *)m_ptr + 1290))
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("The WKWebView is suspended"));
  if (self->_allowsLinkPreview != v3)
  {
    self->_allowsLinkPreview = v3;
    v6 = self->_contentView.m_ptr;
    if (v3)
      objc_msgSend(v6, "_registerPreview");
    else
      objc_msgSend(v6, "_unregisterPreview");
    objc_msgSend(self->_contentView.m_ptr, "_didChangeLinkPreviewAvailability");
  }
}

- (void)_registerForNotifications
{
  void *v3;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__keyboardWillChangeFrame_, *MEMORY[0x1E0CEB960], 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__keyboardDidChangeFrame_, *MEMORY[0x1E0CEB818], 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__keyboardWillShow_, *MEMORY[0x1E0CEB978], 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__keyboardDidShow_, *MEMORY[0x1E0CEB828], 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__keyboardWillHide_, *MEMORY[0x1E0CEB970], 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__windowDidRotate_, *MEMORY[0x1E0CEBE18], 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__contentSizeCategoryDidChange_, *MEMORY[0x1E0CEB3F0], 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__accessibilitySettingsDidChange_, *MEMORY[0x1E0CEB010], 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__accessibilitySettingsDidChange_, *MEMORY[0x1E0CEB018], 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__accessibilitySettingsDidChange_, *MEMORY[0x1E0CEB090], 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__enhancedWindowingToggled_, *MEMORY[0x1E0CEC390], 0);
}

- (WKVelocityTrackingScrollView)_scrollViewInternal
{
  return (WKVelocityTrackingScrollView *)self->_scrollView.m_ptr;
}

- (BOOL)_isEditable
{
  WebPageProxy *m_ptr;

  m_ptr = self->_page.m_ptr;
  return m_ptr && *((_BYTE *)m_ptr + 616) != 0;
}

- (BOOL)allowsLinkPreview
{
  return self->_allowsLinkPreview;
}

- (unint64_t)_dragInteractionPolicy
{
  return self->_dragInteractionPolicy;
}

- (uint64_t)_evaluateJavaScript:(WTF *)this asAsyncFunction:(void *)a2 withSourceURL:withArguments:forceUserGesture:inFrame:inWorld:completionHandler:
{
  const void *v3;
  const void *v4;

  *(_QWORD *)this = &off_1E34BD150;
  v3 = (const void *)*((_QWORD *)this + 2);
  *((_QWORD *)this + 2) = 0;
  if (v3)
    CFRelease(v3);
  v4 = (const void *)*((_QWORD *)this + 1);
  *((_QWORD *)this + 1) = 0;
  if (v4)
    CFRelease(v4);
  return WTF::fastFree(this, a2);
}

- (void)_evaluateJavaScript:(const OpaqueJSValue *)a3 asAsyncFunction:withSourceURL:withArguments:forceUserGesture:inFrame:inWorld:completionHandler:
{
  uint64_t v3;
  int v5;
  const __CFString *v6;
  id v7;
  unint64_t v8;
  WKErrorCode v9;
  uint64_t v10;
  const __CFString *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const void *v15;
  CFTypeRef v16;
  _Unwind_Exception *v17;
  CFTypeRef v18;
  CFTypeRef cf;

  v3 = *(_QWORD *)(a1 + 8);
  if (v3)
  {
    v5 = *(_DWORD *)(a2 + 32);
    if (v5)
    {
      if (v5 != 1)
      {
        v17 = (_Unwind_Exception *)std::__throw_bad_variant_access[abi:sn180100]();
        v18 = cf;
        cf = 0;
        if (v18)
          CFRelease(v18);
        _Unwind_Resume(v17);
      }
      v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v8 = *(char *)(a2 + 16);
      if (v8 > 2)
        v9 = 0;
      else
        v9 = qword_1978CF618[v8];
      objc_msgSend(v7, "setObject:forKey:", localizedDescriptionForErrorCode(v9, v6), *MEMORY[0x1E0CB2D50]);
      if (*(_QWORD *)a2)
        v11 = (const __CFString *)WTF::StringImpl::operator NSString *();
      else
        v11 = &stru_1E351F1B8;
      objc_msgSend(v7, "setObject:forKey:", v11, CFSTR("WKJavaScriptExceptionMessage"));
      objc_msgSend(v7, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a2 + 8)), CFSTR("WKJavaScriptExceptionLineNumber"));
      objc_msgSend(v7, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a2 + 12)), CFSTR("WKJavaScriptExceptionColumnNumber"));
      v14 = *(_QWORD *)(a2 + 24);
      v13 = a2 + 24;
      v12 = v14;
      if (v14 && *(_DWORD *)(v12 + 4))
        objc_msgSend(v7, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0C99E98], "_web_URLWithWTFString:", v13), CFSTR("WKJavaScriptExceptionSourceURL"));
      v15 = (const void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("WKErrorDomain"), v9, v7);
      if (v7)
        CFRelease(v7);
      (*(void (**)(uint64_t, _QWORD, const void *))(v3 + 16))(v3, 0, v15);
      if (v15)
        CFRelease(v15);
    }
    else if (*(_QWORD *)a2)
    {
      v10 = API::SerializedScriptValue::deserialize(*(API::SerializedScriptValue **)(*(_QWORD *)a2 + 16), 0, a3);
      (*(void (**)(uint64_t, uint64_t, _QWORD))(v3 + 16))(v3, v10, 0);
    }
    else
    {
      createNSError(WKErrorJavaScriptResultTypeIsUnsupported, 0, &cf);
      (*(void (**)(uint64_t, _QWORD, CFTypeRef))(v3 + 16))(v3, 0, cf);
      v16 = cf;
      cf = 0;
      if (v16)
        CFRelease(v16);
    }
  }
}

- (WKWebView)initWithFrame:(CGRect)frame configuration:(WKWebViewConfiguration *)configuration
{
  WKWebView *v5;
  WKWebView *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)WKWebView;
  v5 = -[WKWebView initWithFrame:](&v8, sel_initWithFrame_, frame.origin.x, frame.origin.y, frame.size.width, frame.size.height);
  v6 = v5;
  if (v5)
    -[WKWebView _initializeWithConfiguration:](v5, "_initializeWithConfiguration:", configuration);
  return v6;
}

- (void)setOpaque:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  if (-[WKWebView isOpaque](self, "isOpaque") != a3)
    -[WKWebView _setOpaqueInternal:](self, "_setOpaqueInternal:", v3);
}

- (void)scrollViewDidZoom:(id)a3
{
  if (!-[WKWebView usesStandardContentView](self, "usesStandardContentView")
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(self->_customContentView.m_ptr, "web_scrollViewDidZoom:", a3);
  }
  -[WKWebView _updateScrollViewBackground](self, "_updateScrollViewBackground");
  -[WKWebView _scheduleVisibleContentRectUpdateAfterScrollInView:](self, "_scheduleVisibleContentRectUpdateAfterScrollInView:", a3);
}

- (BOOL)_effectiveUserInterfaceLevelIsElevated
{
  return objc_msgSend((id)-[WKWebView traitCollection](self, "traitCollection"), "userInterfaceLevel") == 1;
}

- (BOOL)_effectiveAppearanceIsDark
{
  return objc_msgSend((id)-[WKWebView traitCollection](self, "traitCollection"), "userInterfaceStyle") == 2;
}

- (void)_setOpaqueInternal:(BOOL)a3
{
  _BOOL8 v3;
  WebPageProxy *m_ptr;
  void *v6;
  uint64_t v7;
  char v8;
  objc_super v9;

  v3 = a3;
  v9.receiver = self;
  v9.super_class = (Class)WKWebView;
  -[WKWebView setOpaque:](&v9, sel_setOpaque_);
  objc_msgSend(self->_contentView.m_ptr, "setOpaque:", v3);
  m_ptr = self->_page.m_ptr;
  if (m_ptr)
  {
    LOBYTE(v7) = 0;
    v8 = 0;
    if (!v3)
    {
      std::optional<WebCore::Color>::operator=[abi:sn180100]<WebCore::Color,void>((uint64_t)&v7);
      m_ptr = self->_page.m_ptr;
    }
    WebKit::WebPageProxy::setBackgroundColor((uint64_t)m_ptr, &v7);
    -[WKWebView _updateScrollViewBackground](self, "_updateScrollViewBackground");
    std::__optional_destruct_base<WebCore::Color,false>::~__optional_destruct_base[abi:sn180100]((uint64_t)&v7, v6);
  }
}

- (void)setBackgroundColor:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WKWebView;
  -[WKWebView setBackgroundColor:](&v5, sel_setBackgroundColor_);
  objc_msgSend(self->_contentView.m_ptr, "setBackgroundColor:", a3);
  -[WKWebView _updateScrollViewBackground](self, "_updateScrollViewBackground");
}

- (UIColor)underPageBackgroundColor
{
  const Color *v2;
  CFTypeRef v3;
  void *v4;
  UIColor *v5;
  CFTypeRef v6;
  unsigned int *v8;
  unsigned int v9;
  unsigned int v10;
  uint64_t v11;
  CFTypeRef cf;

  WebKit::WebPageProxy::underPageBackgroundColor((WebKit::WebPageProxy *)self->_page.m_ptr, &v11);
  WebCore::cocoaColor((WebCore *)&v11, v2);
  v3 = cf;
  cf = 0;
  v5 = (id)CFMakeCollectable(v3);
  v6 = cf;
  cf = 0;
  if (v6)
    CFRelease(v6);
  if ((v11 & 0x8000000000000) != 0)
  {
    v8 = (unsigned int *)(v11 & 0xFFFFFFFFFFFFLL);
    do
    {
      v9 = __ldaxr(v8);
      v10 = v9 - 1;
    }
    while (__stlxr(v10, v8));
    if (!v10)
    {
      atomic_store(1u, v8);
      WTF::fastFree((WTF *)v8, v4);
    }
  }
  return v5;
}

- (void)_didCommitLayerTree:(const void *)a3
{
  int updated;
  int v6;
  NSObject *v7;
  BOOL v8;
  void *m_ptr;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  ViewGestureController *value;
  WebKit::RemoteLayerTreeScrollingPerformanceData *v15;
  unsigned int v16;
  unsigned int v17;
  int v18;
  unsigned int v19;
  unsigned int v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t m_identifier;
  uint64_t v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  CALayer buf;

  buf._attr.layer = (void *)*MEMORY[0x1E0C80C00];
  -[WKWebView _trackTransactionCommit:](self, "_trackTransactionCommit:");
  self->_perProcessState.lastTransactionID.m_identifier = *((_QWORD *)a3 + 30);
  if (-[WKWebView usesStandardContentView](self, "usesStandardContentView"))
  {
    updated = WebKit::WebPageProxy::updateLayoutViewportParameters((WebKit::WebPageProxy *)self->_page.m_ptr, (const WebKit::RemoteLayerTreeTransaction *)a3);
    if (self->_perProcessState.dynamicViewportUpdateMode)
    {
      -[WKWebView _didCommitLayerTreeDuringAnimatedResize:](self, "_didCommitLayerTreeDuringAnimatedResize:", a3);
      return;
    }
    if (!self->_perProcessState.liveResizeParameters.__engaged_)
    {
      v6 = updated;
      if (self->_resizeAnimationView.m_ptr)
      {
        v7 = qword_1ECE71A28;
        if (os_log_type_enabled((os_log_t)qword_1ECE71A28, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(buf.super.isa) = 134217984;
          *(Class *)((char *)&buf.super.isa + 4) = (Class)self;
          _os_log_impl(&dword_196BCC000, v7, OS_LOG_TYPE_DEFAULT, "%p -[WKWebView _didCommitLayerTree:] - dynamicViewportUpdateMode is NotResizing, but still have a live resizeAnimationView (unpaired begin/endAnimatedResize?)", (uint8_t *)&buf, 0xCu);
        }
      }
      -[WKWebView _updateScrollViewForTransaction:](self, "_updateScrollViewForTransaction:", a3);
      *(_WORD *)&self->_perProcessState.viewportMetaTagWidthWasExplicit = *(_WORD *)((char *)a3 + 261);
      *(int8x16_t *)&self->_perProcessState.viewportMetaTagWidth = vextq_s8(*(int8x16_t *)((char *)a3 + 216), *(int8x16_t *)((char *)a3 + 216), 8uLL);
      if (*(_BYTE *)(*((_QWORD *)self->_page.m_ptr + 4) + 2424))
        v8 = 1;
      else
        v8 = *((_BYTE *)a3 + 263) == 0;
      if (!v8 && objc_msgSend(self->_stableStatePresentationUpdateCallbacks.m_ptr, "count"))
      {
        v28 = 0u;
        v29 = 0u;
        v26 = 0u;
        v27 = 0u;
        m_ptr = self->_stableStatePresentationUpdateCallbacks.m_ptr;
        v10 = objc_msgSend(m_ptr, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
        if (v10)
        {
          v11 = *(_QWORD *)v27;
          do
          {
            for (i = 0; i != v10; ++i)
            {
              if (*(_QWORD *)v27 != v11)
                objc_enumerationMutation(m_ptr);
              (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i) + 16))();
            }
            v10 = objc_msgSend(m_ptr, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
          }
          while (v10);
        }
        objc_msgSend(self->_stableStatePresentationUpdateCallbacks.m_ptr, "removeAllObjects");
        v13 = self->_stableStatePresentationUpdateCallbacks.m_ptr;
        self->_stableStatePresentationUpdateCallbacks.m_ptr = 0;
        if (v13)
          CFRelease(v13);
      }
      if ((objc_msgSend(self->_contentView.m_ptr, "_mayDisableDoubleTapGesturesDuringSingleTap") & 1) == 0)
        objc_msgSend(self->_contentView.m_ptr, "_setDoubleTapGesturesEnabled:", -[WKWebView _allowsDoubleTapGestures](self, "_allowsDoubleTapGestures"));
      -[WKWebView _updateScrollViewBackground](self, "_updateScrollViewBackground");
      -[WKWebView _setAvoidsUnsafeArea:](self, "_setAvoidsUnsafeArea:", *((unsigned __int8 *)a3 + 260));
      value = self->_gestureController.__ptr_.__value_;
      if (value)
        WebKit::ViewGestureController::setRenderTreeSize((uint64_t)value, *((_QWORD *)a3 + 29));
      if (self->_perProcessState.needsResetViewStateAfterCommitLoadForMainFrame
        && *((_QWORD *)a3 + 30) >= self->_perProcessState.firstPaintAfterCommitLoadTransactionID.m_identifier)
      {
        self->_perProcessState.needsResetViewStateAfterCommitLoadForMainFrame = 0;
        if (!-[WKWebView _scrollViewIsRubberBandingForRefreshControl](self, "_scrollViewIsRubberBandingForRefreshControl"))-[WKWebView _resetContentOffset](self, "_resetContentOffset");
        if ((self->_observedRenderingProgressEvents & 0x40) != 0)
          WebKit::NavigationState::didFirstPaint((id *)self->_navigationState.__ptr_.__value_);
        -[WKWebView _restoreScrollAndZoomStateForTransaction:](self, "_restoreScrollAndZoomStateForTransaction:", a3);
      }
      else if ((-[WKWebView _restoreScrollAndZoomStateForTransaction:](self, "_restoreScrollAndZoomStateForTransaction:", a3) | v6) != 1)
      {
        goto LABEL_37;
      }
      -[WKWebView _scheduleVisibleContentRectUpdate](self, "_scheduleVisibleContentRectUpdate");
LABEL_37:
      v15 = (WebKit::RemoteLayerTreeScrollingPerformanceData *)*((_QWORD *)self->_page.m_ptr + 114);
      if (v15)
      {
        -[WKWebView visibleRectInViewCoordinates](self, "visibleRectInViewCoordinates");
        buf.super.isa = (Class)__PAIR64__(v17, v16);
        buf._attr.refcount = v18;
        buf._attr.magic = v19;
        v20 = WebKit::RemoteLayerTreeScrollingPerformanceData::blankPixelCount(v15, &buf);
        WebKit::RemoteLayerTreeScrollingPerformanceData::appendBlankPixelCount(v15, 0, v20);
      }
      if (self->_perProcessState.pendingFindLayerID.m_object.m_identifier)
      {
        v21 = *((_QWORD *)self->_page.m_ptr + 23);
        if (*(_BYTE *)(v21 + 32))
        {
          __break(0xC471u);
          JUMPOUT(0x196C7B75CLL);
        }
        v22 = *(_QWORD *)(v21 + 72);
        m_identifier = self->_perProcessState.pendingFindLayerID.m_processIdentifier.m_identifier;
        buf.super.isa = (Class)self->_perProcessState.pendingFindLayerID.m_object.m_identifier;
        *(_QWORD *)&buf._attr.refcount = m_identifier;
        v24 = WTF::HashMap<WebCore::ProcessQualified<WTF::ObjectIdentifierGeneric<WebCore::PlatformLayerIdentifierType,WTF::ObjectIdentifierMainThreadAccessTraits<unsigned long long>,unsigned long long>>,std::unique_ptr<WebKit::RemoteLayerTreeNode>,WTF::DefaultHash<WebCore::ProcessQualified<WTF::ObjectIdentifierGeneric<WebCore::PlatformLayerIdentifierType,WTF::ObjectIdentifierMainThreadAccessTraits<unsigned long long>,unsigned long long>>>,WTF::HashTraits<WebCore::ProcessQualified<WTF::ObjectIdentifierGeneric<WebCore::PlatformLayerIdentifierType,WTF::ObjectIdentifierMainThreadAccessTraits<unsigned long long>,unsigned long long>>>,WTF::HashTraits<std::unique_ptr<WebKit::RemoteLayerTreeNode>>,WTF::HashTableTraits>::get<WTF::IdentityHashTranslator<WTF::HashMap<WebCore::ProcessQualified<WTF::ObjectIdentifierGeneric<WebCore::PlatformLayerIdentifierType,WTF::ObjectIdentifierMainThreadAccessTraits<unsigned long long>,unsigned long long>>,std::unique_ptr<WebKit::RemoteLayerTreeNode>,WTF::DefaultHash<WebCore::ProcessQualified<WTF::ObjectIdentifierGeneric<WebCore::PlatformLayerIdentifierType,WTF::ObjectIdentifierMainThreadAccessTraits<unsigned long long>,unsigned long long>>>,WTF::HashTraits<WebCore::ProcessQualified<WTF::ObjectIdentifierGeneric<WebCore::PlatformLayerIdentifierType,WTF::ObjectIdentifierMainThreadAccessTraits<unsigned long long>,unsigned long long>>>,WTF::HashTraits<std::unique_ptr<WebKit::RemoteLayerTreeNode>>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::DefaultHash<WebCore::ProcessQualified<WTF::ObjectIdentifierGeneric<WebCore::PlatformLayerIdentifierType,WTF::ObjectIdentifierMainThreadAccessTraits<unsigned long long>,unsigned long long>>>>,WebCore::ProcessQualified<WTF::ObjectIdentifierGeneric<WebCore::PlatformLayerIdentifierType,WTF::ObjectIdentifierMainThreadAccessTraits<unsigned long long>,unsigned long long>>>((uint64_t *)(v22 + 16), &buf);
        if (v24)
          v25 = *(void **)(v24 + 40);
        else
          v25 = 0;
        if (objc_msgSend(v25, "superlayer"))
          -[WKWebView _didAddLayerForFindOverlay:](self, "_didAddLayerForFindOverlay:", v25);
      }
    }
  }
}

- (void)_updateScrollViewBackground
{
  const Color *v3;
  unint64_t m_colorAndFlags;
  void *m_ptr;
  CFTypeRef v7;
  void *v8;
  unsigned int *v9;
  unsigned int v10;
  unsigned int v11;
  BOOL v12;
  unint64_t v13;
  unint64_t v14;
  __int128 v15;
  CFTypeRef cf[2];

  scrollViewBackgroundColor(&v14, self, 1);
  m_colorAndFlags = self->_perProcessState.scrollViewBackgroundColor.m_colorAndFlags;
  if ((m_colorAndFlags & 0x8000000000000) != 0)
  {
    if ((v14 & 0x8000000000000) != 0)
    {
      v12 = 0;
      v13 = 0;
      *(_OWORD *)cf = *(_OWORD *)((m_colorAndFlags & 0xFFFFFFFFFFFFLL) + 4);
      v15 = *(_OWORD *)((v14 & 0xFFFFFFFFFFFFLL) + 4);
      do
      {
        if (*((float *)cf + v13) != *((float *)&cf[-2] + v13))
          break;
        v12 = v13++ > 2;
      }
      while (v13 != 4);
      if (v12 && HIBYTE(m_colorAndFlags) == HIBYTE(v14) && BYTE6(m_colorAndFlags) == BYTE6(v14))
        goto LABEL_9;
    }
  }
  else if (m_colorAndFlags == v14 && (v14 & 0x8000000000000) == 0)
  {
    goto LABEL_9;
  }
  m_ptr = self->_scrollView.m_ptr;
  WebCore::cocoaColor((WebCore *)&v14, v3);
  objc_msgSend(m_ptr, "_setBackgroundColorInternal:", cf[0]);
  v7 = cf[0];
  cf[0] = 0;
  if (v7)
    CFRelease(v7);
  WebCore::Color::operator=();
LABEL_9:
  -[WKWebView _updateScrollViewIndicatorStyle](self, "_updateScrollViewIndicatorStyle");
  if ((v14 & 0x8000000000000) != 0)
  {
    v9 = (unsigned int *)(v14 & 0xFFFFFFFFFFFFLL);
    do
    {
      v10 = __ldaxr(v9);
      v11 = v10 - 1;
    }
    while (__stlxr(v11, v9));
    if (!v11)
    {
      atomic_store(1u, v9);
      WTF::fastFree((WTF *)v9, v8);
    }
  }
}

- (void)_updateScrollViewIndicatorStyle
{
  double v3;
  uint64_t v4;
  void *v5;
  unsigned int *v6;
  unsigned int v7;
  unsigned int v8;
  uint64_t v9;

  scrollViewBackgroundColor(&v9, self, 0);
  WebCore::Color::lightness((WebCore::Color *)&v9);
  if (v3 > 0.5)
    goto LABEL_2;
  if ((v9 & 0x8000000000000) != 0)
  {
    if (*(float *)((v9 & 0xFFFFFFFFFFFFLL) + 0x10) <= 0.0)
    {
LABEL_2:
      v4 = 1;
      goto LABEL_8;
    }
  }
  else if (!(_BYTE)v9)
  {
    goto LABEL_2;
  }
  v4 = 2;
LABEL_8:
  objc_msgSend(self->_scrollView.m_ptr, "_setIndicatorStyleInternal:", v4);
  if ((v9 & 0x8000000000000) != 0)
  {
    v6 = (unsigned int *)(v9 & 0xFFFFFFFFFFFFLL);
    do
    {
      v7 = __ldaxr(v6);
      v8 = v7 - 1;
    }
    while (__stlxr(v8, v6));
    if (!v8)
    {
      atomic_store(1u, v6);
      WTF::fastFree((WTF *)v6, v5);
    }
  }
}

- (void)_trackTransactionCommit:(const void *)a3
{
  WKWebView *v4;
  PerWebProcessState *p_perProcessState;
  NSObject *v6;
  uint64_t v7;
  double v8;
  int dynamicViewportUpdateMode;
  _BOOL4 needsResetViewStateAfterCommitLoadForMainFrame;
  unint64_t m_identifier;
  int v12;
  int v13;
  _BOOL4 currentlyAdjustingScrollViewInsetsForKeyboard;
  double v15;
  double v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  WKWebView *v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  double v25;
  __int16 v26;
  _BYTE v27[10];
  __int16 v28;
  unint64_t v29;
  __int16 v30;
  int v31;
  __int16 v32;
  int v33;
  __int16 v34;
  _BOOL4 v35;
  uint64_t v36;

  v4 = self;
  v36 = *MEMORY[0x1E0C80C00];
  p_perProcessState = &self->_perProcessState;
  if (self->_perProcessState.didDeferUpdateVisibleContentRectsForUnstableScrollView)
  {
    v6 = qword_1ECE71A28;
    self = (WKWebView *)os_log_type_enabled((os_log_t)qword_1ECE71A28, OS_LOG_TYPE_DEFAULT);
    if ((_DWORD)self)
    {
      v7 = *(_QWORD *)(*((_QWORD *)v4->_page.m_ptr + 4) + 744);
      v8 = *((double *)a3 + 30);
      dynamicViewportUpdateMode = p_perProcessState->dynamicViewportUpdateMode;
      needsResetViewStateAfterCommitLoadForMainFrame = p_perProcessState->needsResetViewStateAfterCommitLoadForMainFrame;
      m_identifier = p_perProcessState->firstPaintAfterCommitLoadTransactionID.m_identifier;
      v12 = objc_msgSend(v4->_contentView.m_ptr, "sizeChangedSinceLastVisibleContentRectUpdate");
      v13 = objc_msgSend(v4->_scrollView.m_ptr, "isZoomBouncing");
      currentlyAdjustingScrollViewInsetsForKeyboard = p_perProcessState->currentlyAdjustingScrollViewInsetsForKeyboard;
      v20 = 134220032;
      v21 = v4;
      v22 = 2048;
      v23 = v7;
      v24 = 2048;
      v25 = v8;
      v26 = 1024;
      *(_DWORD *)v27 = dynamicViewportUpdateMode;
      *(_WORD *)&v27[4] = 1024;
      *(_DWORD *)&v27[6] = needsResetViewStateAfterCommitLoadForMainFrame;
      v28 = 2048;
      v29 = m_identifier;
      v30 = 1024;
      v31 = v12;
      v32 = 1024;
      v33 = v13;
      v34 = 1024;
      v35 = currentlyAdjustingScrollViewInsetsForKeyboard;
      _os_log_impl(&dword_196BCC000, v6, OS_LOG_TYPE_DEFAULT, "%p (pageProxyID=%llu) -[WKWebView _didCommitLayerTree:] - received a commit (%llu) while deferring visible content rect updates (dynamicViewportUpdateMode %d, needsResetViewStateAfterCommitLoadForMainFrame %d (wants commit %llu), sizeChangedSinceLastVisibleContentRectUpdate %d, [_scrollView isZoomBouncing] %d, currentlyAdjustingScrollViewInsetsForKeyboard %d)", (uint8_t *)&v20, 0x48u);
    }
  }
  if (v4->_timeOfFirstVisibleContentRectUpdateWithPendingCommit.__engaged_)
  {
    WTF::MonotonicTime::now((WTF::MonotonicTime *)self);
    if (!v4->_timeOfFirstVisibleContentRectUpdateWithPendingCommit.__engaged_)
      __break(1u);
    v16 = v15 - v4->_timeOfFirstVisibleContentRectUpdateWithPendingCommit.var0.__val_.m_value;
    if (v16 <= 5.0)
      goto LABEL_9;
    v17 = qword_1ECE71A28;
    if (!os_log_type_enabled((os_log_t)qword_1ECE71A28, OS_LOG_TYPE_DEFAULT))
      goto LABEL_9;
    v18 = *(_QWORD *)(*((_QWORD *)v4->_page.m_ptr + 4) + 744);
    v19 = *((_QWORD *)a3 + 30);
    v20 = 134218752;
    v21 = v4;
    v22 = 2048;
    v23 = v18;
    v24 = 2048;
    v25 = v16;
    v26 = 2048;
    *(_QWORD *)v27 = v19;
    _os_log_impl(&dword_196BCC000, v17, OS_LOG_TYPE_DEFAULT, "%p (pageProxyID=%llu) -[WKWebView _didCommitLayerTree:] - finally received commit %.2fs after visible content rect update request; transactionID %llu",
      (uint8_t *)&v20,
      0x2Au);
    if (v4->_timeOfFirstVisibleContentRectUpdateWithPendingCommit.__engaged_)
LABEL_9:
      v4->_timeOfFirstVisibleContentRectUpdateWithPendingCommit.__engaged_ = 0;
  }
}

- (void)_setAvoidsUnsafeArea:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  _QWORD v10[4];

  if (self->_perProcessState.avoidsUnsafeArea != a3)
  {
    v3 = a3;
    self->_perProcessState.avoidsUnsafeArea = a3;
    if (-[WKWebView _updateScrollViewContentInsetsIfNecessary](self, "_updateScrollViewContentInsetsIfNecessary")
      && !-[WKWebView _shouldDeferGeometryUpdates](self, "_shouldDeferGeometryUpdates")
      && !self->_overriddenLayoutParameters.__engaged_)
    {
      -[WKWebView bounds](self, "bounds");
      v10[0] = v5;
      v10[1] = v6;
      v10[2] = v7;
      v10[3] = v8;
      -[WKWebView activeViewLayoutSize:](self, "activeViewLayoutSize:", v10);
      -[WKWebView _dispatchSetViewLayoutSize:](self, "_dispatchSetViewLayoutSize:");
    }
    -[WKWebView _updateScrollViewInsetAdjustmentBehavior](self, "_updateScrollViewInsetAdjustmentBehavior");
    -[WKWebView _scheduleVisibleContentRectUpdate](self, "_scheduleVisibleContentRectUpdate");
    v9 = -[WKWebView UIDelegate](self, "UIDelegate");
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v9, "_webView:didChangeSafeAreaShouldAffectObscuredInsets:", self, v3);
  }
}

- (BOOL)_restoreScrollAndZoomStateForTransaction:(const void *)a3
{
  PerWebProcessState *p_perProcessState;
  BOOL v4;
  void *v6;
  float v7;
  void *v8;
  float v9;
  float v10;
  double top;
  double left;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  double v18;
  ViewGestureController *value;
  float scaleToRestore;
  WKWebView *v22;
  SEL v23;
  uint64_t v24;
  double v25;
  double v26;
  CGSize v27;

  p_perProcessState = &self->_perProcessState;
  if (!self->_perProcessState.firstTransactionIDAfterPageRestore.__engaged_
    || *((_QWORD *)a3 + 30) < self->_perProcessState.firstTransactionIDAfterPageRestore.var0.__val_.m_identifier)
  {
    return 0;
  }
  self->_perProcessState.firstTransactionIDAfterPageRestore.__engaged_ = 0;
  if (self->_perProcessState.scrollOffsetToRestore.__engaged_
    && !-[WKWebView _scrollViewIsRubberBandingForRefreshControl](self, "_scrollViewIsRubberBandingForRefreshControl"))
  {
    if (!p_perProcessState->scrollOffsetToRestore.__engaged_)
      goto LABEL_25;
    p_perProcessState->scrollOffsetToRestore.__engaged_ = 0;
    v8 = (void *)objc_msgSend(-[WKWebView _currentContentView](self, "_currentContentView"), "layer");
    if (v8)
    {
      v8 = (void *)objc_msgSend(v8, "affineTransform");
      v9 = v25;
    }
    else
    {
      v9 = 0.0;
    }
    scaleToRestore = self->_scaleToRestore;
    v4 = 1;
    if (WebKit::scalesAreEssentiallyEqual((WebKit *)v8, v9, scaleToRestore))
    {
      changeContentOffsetBoundedInValidRange((UIScrollView *)self->_scrollView.m_ptr);
      p_perProcessState->commitDidRestoreScrollPosition = 1;
    }
  }
  else
  {
    v4 = 0;
  }
  if (!p_perProcessState->unobscuredCenterToRestore.__engaged_
    || -[WKWebView _scrollViewIsRubberBandingForRefreshControl](self, "_scrollViewIsRubberBandingForRefreshControl"))
  {
LABEL_19:
    value = self->_gestureController.__ptr_.__value_;
    if (value)
      WebKit::ViewGestureController::SnapshotRemovalTracker::stopWaitingForEvent((WebKit::ViewGestureController::SnapshotRemovalTracker *)((char *)value + 168), (WebKit::ViewGestureController::SnapshotRemovalTracker *)0x20, "outstanding event occurred: ", 29, 1);
    return v4;
  }
  if (p_perProcessState->unobscuredCenterToRestore.__engaged_)
  {
    p_perProcessState->unobscuredCenterToRestore.__engaged_ = 0;
    v6 = (void *)objc_msgSend(-[WKWebView _currentContentView](self, "_currentContentView"), "layer");
    if (v6)
    {
      v6 = (void *)objc_msgSend(v6, "affineTransform");
      v7 = v25;
    }
    else
    {
      v7 = 0.0;
    }
    v10 = self->_scaleToRestore;
    if (WebKit::scalesAreEssentiallyEqual((WebKit *)v6, v7, v10))
    {
      -[WKWebView bounds](self, "bounds");
      top = self->_obscuredInsets.top;
      left = self->_obscuredInsets.left;
      v14 = v13 - (left + self->_obscuredInsets.right);
      v16 = v15 - (top + self->_obscuredInsets.bottom);
      v25 = v17 + left;
      v26 = v18 + top;
      v27.width = v14;
      v27.height = v16;
      WebCore::FloatSize::FloatSize((WebCore::FloatSize *)&v24, &v27);
      changeContentOffsetBoundedInValidRange((UIScrollView *)self->_scrollView.m_ptr);
    }
    v4 = 1;
    goto LABEL_19;
  }
LABEL_25:
  v22 = (WKWebView *)std::__throw_bad_optional_access[abi:sn180100]();
  return -[WKWebView _allowsDoubleTapGestures](v22, v23);
}

- (BOOL)_allowsDoubleTapGestures
{
  int v2;
  double v4;
  double v5;
  double v6;
  double v7;
  float v8;
  WebKit *v9;
  double v10;
  float v11;
  PerWebProcessState *p_perProcessState;
  void *v13;
  float v14;
  float initialScaleFactor;
  double v17;

  if (self->_fastClickingIsDisabled)
    goto LABEL_2;
  v2 = objc_msgSend(self->_scrollView.m_ptr, "isZoomEnabled");
  if (!v2)
    return v2;
  objc_msgSend(self->_scrollView.m_ptr, "minimumZoomScale");
  v5 = v4;
  objc_msgSend(self->_scrollView.m_ptr, "maximumZoomScale");
  if (v5 >= v6
    || (objc_msgSend(self->_scrollView.m_ptr, "minimumZoomScale"),
        v8 = v7,
        v9 = (WebKit *)objc_msgSend(self->_scrollView.m_ptr, "maximumZoomScale"),
        v11 = v10,
        WebKit::scalesAreEssentiallyEqual(v9, v8, v11)))
  {
    LOBYTE(v2) = 0;
    return v2;
  }
  p_perProcessState = &self->_perProcessState;
  if (!self->_perProcessState.viewportMetaTagWidthWasExplicit
    || self->_perProcessState.viewportMetaTagCameFromImageDocument
    || p_perProcessState->viewportMetaTagWidth != -2.0)
  {
LABEL_2:
    LOBYTE(v2) = 1;
  }
  else
  {
    v13 = (void *)objc_msgSend(-[WKWebView _currentContentView](self, "_currentContentView", p_perProcessState->viewportMetaTagWidth), "layer");
    if (v13)
    {
      v13 = (void *)objc_msgSend(v13, "affineTransform");
      v14 = v17;
    }
    else
    {
      v14 = 0.0;
    }
    initialScaleFactor = self->_perProcessState.initialScaleFactor;
    LOBYTE(v2) = !WebKit::scalesAreEssentiallyEqual((WebKit *)v13, v14, initialScaleFactor);
  }
  return v2;
}

- (void)_resetCachedScrollViewBackgroundColor
{
  WebCore::Color::operator=();
}

- (NSURL)_unreachableURL
{
  return (NSURL *)objc_msgSend(MEMORY[0x1E0C99E98], "_web_URLWithWTFString:", *((_QWORD *)self->_page.m_ptr + 4) + 1040);
}

+ (BOOL)automaticallyNotifiesObserversOfUnderPageBackgroundColor
{
  return 0;
}

- (void)_setMinimumEffectiveDeviceWidth:(double)a3
{
  WebPageProxy *m_ptr;
  BOOL v6;
  WebPageProxy *v7;
  uint64_t v8;

  m_ptr = self->_page.m_ptr;
  if (*((_BYTE *)m_ptr + 1290))
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("The WKWebView is suspended"));
    m_ptr = self->_page.m_ptr;
  }
  if (*((double *)m_ptr + 127) != a3)
  {
    v6 = -[WKWebView _shouldDeferGeometryUpdates](self, "_shouldDeferGeometryUpdates");
    v7 = self->_page.m_ptr;
    if (v6)
    {
      *((double *)v7 + 127) = a3;
    }
    else
    {
      v8 = *(_QWORD *)(*((_QWORD *)v7 + 4) + 2116);
      WebKit::WebPageProxy::setViewportConfigurationViewLayoutSize((uint64_t)v7, (const WebCore::FloatSize *)&v8, *((double *)v7 + 126), a3);
    }
  }
}

- (unint64_t)_observedRenderingProgressEvents
{
  return self->_observedRenderingProgressEvents;
}

- (BOOL)canGoForward
{
  _BOOL4 didAccessBackForwardList;

  if (self)
  {
    didAccessBackForwardList = self->_didAccessBackForwardList;
    self->_didAccessBackForwardList = 1;
    if (!didAccessBackForwardList)
      -[WKWebView _updatePageLoadObserverState]((uint64_t)self);
  }
  return *(_BYTE *)(*((_QWORD *)self->_page.m_ptr + 4) + 1105);
}

- (BOOL)canGoBack
{
  _BOOL4 didAccessBackForwardList;

  if (self)
  {
    didAccessBackForwardList = self->_didAccessBackForwardList;
    self->_didAccessBackForwardList = 1;
    if (!didAccessBackForwardList)
      -[WKWebView _updatePageLoadObserverState]((uint64_t)self);
  }
  return *(_BYTE *)(*((_QWORD *)self->_page.m_ptr + 4) + 1104);
}

- (void)_setInterfaceOrientationOverride:(int64_t)a3
{
  unint64_t v4;
  uint64_t v5;

  if (!self->_overridesInterfaceOrientation || self->_interfaceOrientationOverride != a3)
  {
    self->_overridesInterfaceOrientation = 1;
    self->_interfaceOrientationOverride = a3;
    if (!-[WKWebView _shouldDeferGeometryUpdates](self, "_shouldDeferGeometryUpdates"))
    {
      v4 = self->_interfaceOrientationOverride - 2;
      if (v4 > 2)
        v5 = 0;
      else
        v5 = dword_1978CFAE8[v4];
      -[WKWebView _dispatchSetDeviceOrientation:](self, "_dispatchSetDeviceOrientation:", v5);
    }
  }
}

- (void)_setObscuredInsets:(UIEdgeInsets)a3
{
  void *m_ptr;

  self->_haveSetObscuredInsets = 1;
  if (self->_obscuredInsets.left != a3.left
    || self->_obscuredInsets.top != a3.top
    || self->_obscuredInsets.right != a3.right
    || self->_obscuredInsets.bottom != a3.bottom)
  {
    self->_obscuredInsets = a3;
    -[WKWebView _scheduleVisibleContentRectUpdate](self, "_scheduleVisibleContentRectUpdate");
    m_ptr = self->_safeBrowsingWarning.m_ptr;
    -[WKWebView _computedObscuredInsetForSafeBrowsingWarning](self, "_computedObscuredInsetForSafeBrowsingWarning");
    objc_msgSend(m_ptr, "setContentInset:");
  }
}

- (void)safeAreaInsetsDidChange
{
  void *m_ptr;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WKWebView;
  -[WKWebView safeAreaInsetsDidChange](&v4, sel_safeAreaInsetsDidChange);
  -[WKWebView _scheduleVisibleContentRectUpdate](self, "_scheduleVisibleContentRectUpdate");
  m_ptr = self->_safeBrowsingWarning.m_ptr;
  -[WKWebView _computedObscuredInsetForSafeBrowsingWarning](self, "_computedObscuredInsetForSafeBrowsingWarning");
  objc_msgSend(m_ptr, "setContentInset:");
}

- (UIEdgeInsets)_computedObscuredInsetForSafeBrowsingWarning
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  if (self->_haveSetObscuredInsets)
  {
    top = self->_obscuredInsets.top;
    left = self->_obscuredInsets.left;
    bottom = self->_obscuredInsets.bottom;
    right = self->_obscuredInsets.right;
  }
  else
  {
    -[WKWebView _scrollViewSystemContentInset](self, "_scrollViewSystemContentInset");
    -[WKWebView _effectiveObscuredInsetEdgesAffectedBySafeArea](self, "_effectiveObscuredInsetEdgesAffectedBySafeArea");
    UIEdgeInsetsAdd();
  }
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)_willInvokeUIScrollViewDelegateCallback
{
  self->_perProcessState.invokingUIScrollViewDelegateCallback = 1;
}

- (void)_didInvokeUIScrollViewDelegateCallback
{
  self->_perProcessState.invokingUIScrollViewDelegateCallback = 0;
  if (self->_perProcessState.didDeferUpdateVisibleContentRectsForUIScrollViewDelegateCallback)
  {
    self->_perProcessState.didDeferUpdateVisibleContentRectsForUIScrollViewDelegateCallback = 0;
    -[WKWebView _scheduleVisibleContentRectUpdate](self, "_scheduleVisibleContentRectUpdate");
  }
}

- (void)_setObservedRenderingProgressEvents:(unint64_t)a3
{
  self->_observedRenderingProgressEvents = a3;
  WebKit::WebPageProxy::listenForLayoutMilestones((uint64_t)self->_page.m_ptr, a3 & 0x1B7 | (((a3 >> 3) & 1) << 6));
}

- (void)_setAppHighlightDelegate:(id)a3
{
  objc_storeWeak(&self->_appHighlightDelegate.m_weakReference, a3);
}

- (CGSize)scrollView:(id)a3 contentSizeForZoomScale:(double)a4 withProposedSize:(CGSize)a5
{
  WebPageProxy *m_ptr;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  m_ptr = self->_page.m_ptr;
  v6 = 692;
  if (!*((_BYTE *)m_ptr + 696))
    v6 = 688;
  v7 = *(float *)((char *)m_ptr + v6);
  v8 = floor(a5.width * v7) / v7;
  v9 = floor(a5.height * v7) / v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (WKWebViewConfiguration)configuration
{
  return (WKWebViewConfiguration *)(id)CFMakeCollectable((CFTypeRef)objc_msgSend(self->_configuration.m_ptr, "copy"));
}

- (void)_setDiagnosticLoggingDelegate:(id)a3
{
  uint64_t v3;

  v3 = *((_QWORD *)self->_page.m_ptr + 16);
  if (v3)
    WebKit::DiagnosticLoggingClient::setDelegate(v3, a3);
}

- (void)_setFullscreenDelegate:(id)a3
{
  unsigned int (***v4)(_QWORD, uint64_t);

  v4 = (unsigned int (***)(_QWORD, uint64_t))*((_QWORD *)self->_page.m_ptr + 46);
  if ((**v4)(v4, 1))
    WebKit::FullscreenClient::setDelegate((uint64_t)v4, a3);
}

- (id)_remoteObjectRegistry
{
  id result;
  id v4;
  void *m_ptr;
  WebKit::WebProcessPool *v6;
  uint64_t v7;
  uint64_t v8;
  unsigned int *v9;
  _QWORD v10[2];

  result = self->_remoteObjectRegistry.m_ptr;
  if (!result)
  {
    v4 = -[_WKRemoteObjectRegistry _initWithWebPageProxy:]([_WKRemoteObjectRegistry alloc], "_initWithWebPageProxy:", self->_page.m_ptr);
    m_ptr = self->_remoteObjectRegistry.m_ptr;
    self->_remoteObjectRegistry.m_ptr = v4;
    if (m_ptr)
      CFRelease(m_ptr);
    v6 = API::PageConfiguration::Data::LazyInitializedRef<WebKit::WebProcessPool,&API::PageConfiguration::Data::createWebProcessPool>::get((WebKit::WebProcessPool **)(*((_QWORD *)self->_page.m_ptr + 6) + 24));
    v7 = *(_QWORD *)(*((_QWORD *)self->_page.m_ptr + 4) + 744);
    v8 = objc_msgSend(self->_remoteObjectRegistry.m_ptr, "remoteObjectRegistry");
    v10[0] = 105;
    v10[1] = v7;
    WTF::HashMap<std::pair<IPC::ReceiverName,unsigned long long>,WTF::WeakPtr<IPC::MessageReceiver,WTF::DefaultWeakPtrImpl,WTF::RawPtrTraits<WTF::DefaultWeakPtrImpl>>,WTF::DefaultHash<std::pair<IPC::ReceiverName,unsigned long long>>,WTF::PairHashTraits<WTF::StrongEnumHashTraits<IPC::ReceiverName>,WTF::HashTraits<unsigned long long>>,WTF::HashTraits<WTF::WeakPtr<IPC::MessageReceiver,WTF::DefaultWeakPtrImpl,WTF::RawPtrTraits<WTF::DefaultWeakPtrImpl>>>,WTF::HashTableTraits>::inlineSet<std::pair<IPC::ReceiverName,unsigned long long>,IPC::MessageReceiver&>((uint64_t *)v6 + 8, (unsigned __int8 *)v10, v8, &v9);
    return self->_remoteObjectRegistry.m_ptr;
  }
  return result;
}

- (void)setUIDelegate:(id)UIDelegate
{
  WebPageProxy *m_ptr;
  WebKit::UIDelegate::UIClient *v5;

  WebKit::UIDelegate::setDelegate((uint64_t)self->_uiDelegate.__ptr_.__value_, UIDelegate);
  m_ptr = self->_page.m_ptr;
  WebKit::UIDelegate::createUIClient((WebKit::UIDelegate *)self->_uiDelegate.__ptr_.__value_, &v5);
  WebKit::WebPageProxy::setUIClient((uint64_t)m_ptr, (uint64_t *)&v5);
  if (v5)
    (*(void (**)(WebKit::UIDelegate::UIClient *))(*(_QWORD *)v5 + 8))(v5);
}

- (void).cxx_destruct
{
  void *m_ptr;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t m_colorAndFlags;
  void *v16;
  void *v17;
  optional<FindOverlays> *p_findOverlaysOutsideContentView;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  ViewGestureController *value;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  WebPageProxy *v31;
  void *v32;
  unsigned int *v33;
  unsigned int v34;
  unsigned int v35;

  m_ptr = self->_gamepadsRecentlyAccessedState.m_ptr;
  self->_gamepadsRecentlyAccessedState.m_ptr = 0;
  if (m_ptr)
    CFRelease(m_ptr);
  v4 = self->_pendingPageLoadObserverHost.m_ptr;
  self->_pendingPageLoadObserverHost.m_ptr = 0;
  if (v4)
    CFRelease(v4);
  v5 = self->_scrollViewDefaultAllowedTouchTypes.m_ptr;
  self->_scrollViewDefaultAllowedTouchTypes.m_ptr = 0;
  if (v5)
    CFRelease(v5);
  v6 = self->_passwordView.m_ptr;
  self->_passwordView.m_ptr = 0;
  if (v6)
    CFRelease(v6);
  v7 = self->_stableStatePresentationUpdateCallbacks.m_ptr;
  self->_stableStatePresentationUpdateCallbacks.m_ptr = 0;
  if (v7)
    CFRelease(v7);
  WTF::Vector<WTF::Function<void ()(void)>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&self->_callbacksDeferredDuringResize, (void *)a2);
  v9 = self->_enclosingScrollViewScrollTimer.m_ptr;
  self->_enclosingScrollViewScrollTimer.m_ptr = 0;
  if (v9)
    CFRelease(v9);
  v10 = self->_customContentFixedOverlayView.m_ptr;
  self->_customContentFixedOverlayView.m_ptr = 0;
  if (v10)
    CFRelease(v10);
  v11 = self->_customContentView.m_ptr;
  self->_customContentView.m_ptr = 0;
  if (v11)
    CFRelease(v11);
  WTF::Vector<WTF::RetainPtr<__SecCertificate *>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&self->_resizeAssertions, v8);
  v13 = self->_endLiveResizeTimer.m_ptr;
  self->_endLiveResizeTimer.m_ptr = 0;
  if (v13)
    CFRelease(v13);
  v14 = self->_resizeAnimationView.m_ptr;
  self->_resizeAnimationView.m_ptr = 0;
  if (v14)
    CFRelease(v14);
  m_colorAndFlags = self->_perProcessState.scrollViewBackgroundColor.m_colorAndFlags;
  if ((m_colorAndFlags & 0x8000000000000) != 0)
  {
    v33 = (unsigned int *)(m_colorAndFlags & 0xFFFFFFFFFFFFLL);
    do
    {
      v34 = __ldaxr(v33);
      v35 = v34 - 1;
    }
    while (__stlxr(v35, v33));
    if (!v35)
    {
      atomic_store(1u, v33);
      WTF::fastFree((WTF *)v33, v12);
    }
  }
  v16 = self->_remoteObjectRegistry.m_ptr;
  self->_remoteObjectRegistry.m_ptr = 0;
  if (v16)
    CFRelease(v16);
  v17 = self->_findInteraction.m_ptr;
  self->_findInteraction.m_ptr = 0;
  if (v17)
    CFRelease(v17);
  p_findOverlaysOutsideContentView = &self->_findOverlaysOutsideContentView;
  if (self->_findOverlaysOutsideContentView.__engaged_)
  {
    v19 = self->_findOverlaysOutsideContentView.var0.__val_.left.m_ptr;
    self->_findOverlaysOutsideContentView.var0.__val_.left.m_ptr = 0;
    if (v19)
      CFRelease(v19);
    v20 = self->_findOverlaysOutsideContentView.var0.__val_.bottom.m_ptr;
    self->_findOverlaysOutsideContentView.var0.__val_.bottom.m_ptr = 0;
    if (v20)
      CFRelease(v20);
    v21 = self->_findOverlaysOutsideContentView.var0.__val_.right.m_ptr;
    self->_findOverlaysOutsideContentView.var0.__val_.right.m_ptr = 0;
    if (v21)
      CFRelease(v21);
    v22 = p_findOverlaysOutsideContentView->var0.__val_.top.m_ptr;
    p_findOverlaysOutsideContentView->var0.__val_.top.m_ptr = 0;
    if (v22)
      CFRelease(v22);
  }
  v23 = self->_fullScreenWindowController.m_ptr;
  self->_fullScreenWindowController.m_ptr = 0;
  if (v23)
    CFRelease(v23);
  v24 = self->_contentProviderRegistry.m_ptr;
  self->_contentProviderRegistry.m_ptr = 0;
  if (v24)
    CFRelease(v24);
  WTF::Vector<WTF::BlockPtr<void ()(void)>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&self->_visibleContentRectUpdateCallbacks, v12);
  value = self->_gestureController.__ptr_.__value_;
  self->_gestureController.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(ViewGestureController *))(*(_QWORD *)value + 8))(value);
  v26 = self->_contentView.m_ptr;
  self->_contentView.m_ptr = 0;
  if (v26)
    CFRelease(v26);
  v27 = self->_scrollView.m_ptr;
  self->_scrollView.m_ptr = 0;
  if (v27)
    CFRelease(v27);
  v28 = self->_writingToolsSessions.m_ptr;
  self->_writingToolsSessions.m_ptr = 0;
  if (v28)
    CFRelease(v28);
  v29 = self->_writingToolsTextSuggestions.m_ptr;
  self->_writingToolsTextSuggestions.m_ptr = 0;
  if (v29)
    CFRelease(v29);
  v30 = self->_safeBrowsingWarning.m_ptr;
  self->_safeBrowsingWarning.m_ptr = 0;
  if (v30)
    CFRelease(v30);
  objc_destroyWeak(&self->_appHighlightDelegate.m_weakReference);
  objc_destroyWeak(&self->_inputDelegate.m_weakReference);
  objc_destroyWeak(&self->_textManipulationDelegate.m_weakReference);
  std::unique_ptr<WebKit::ResourceLoadDelegate>::reset[abi:sn180100]((id **)&self->_resourceLoadDelegate, 0);
  std::unique_ptr<WebKit::IconLoadingDelegate>::reset[abi:sn180100]((id **)&self->_iconLoadingDelegate, 0);
  std::unique_ptr<WebKit::UIDelegate>::reset[abi:sn180100]((uint64_t *)&self->_uiDelegate, 0);
  std::unique_ptr<WebKit::NavigationState>::reset[abi:sn180100]((WebKit::NavigationState **)&self->_navigationState, 0);
  v31 = self->_page.m_ptr;
  self->_page.m_ptr = 0;
  if (v31)
    CFRelease(*((CFTypeRef *)v31 + 1));
  v32 = self->_configuration.m_ptr;
  self->_configuration.m_ptr = 0;
  if (v32)
    CFRelease(v32);
}

- (id).cxx_construct
{
  __int128 v2;

  *((_QWORD *)self + 52) = 0;
  *((_QWORD *)self + 53) = 0;
  *((_QWORD *)self + 54) = 0;
  *((_QWORD *)self + 55) = 0;
  *((_QWORD *)self + 56) = 0;
  *((_QWORD *)self + 57) = 0;
  *((_QWORD *)self + 58) = 0;
  *((_QWORD *)self + 59) = 0;
  *((_QWORD *)self + 60) = 0;
  *((_QWORD *)self + 61) = 0;
  *((_WORD *)self + 248) = 0;
  *((_QWORD *)self + 74) = 0;
  *((_QWORD *)self + 75) = 0;
  *((_QWORD *)self + 76) = 0;
  *((_QWORD *)self + 77) = 0;
  *((_QWORD *)self + 78) = 0;
  *((_QWORD *)self + 79) = 0;
  *((_QWORD *)self + 80) = 0;
  *((_QWORD *)self + 81) = 0;
  *((_QWORD *)self + 82) = 0;
  *((_BYTE *)self + 672) = 0;
  *((_BYTE *)self + 704) = 0;
  *((_QWORD *)self + 89) = 0;
  *((_QWORD *)self + 90) = 0;
  *(_OWORD *)((char *)self + 728) = xmmword_1978CF590;
  *((_WORD *)self + 372) = 0;
  *((_DWORD *)self + 187) = 0;
  *((_WORD *)self + 376) = 0;
  *((_QWORD *)self + 95) = 0;
  v2 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
  *((_OWORD *)self + 48) = *MEMORY[0x1E0C9D648];
  *((_OWORD *)self + 49) = v2;
  *((_BYTE *)self + 800) = 0;
  *((_BYTE *)self + 808) = 0;
  *((_BYTE *)self + 812) = 0;
  *((_BYTE *)self + 820) = 0;
  *((_QWORD *)self + 103) = 0;
  *((_QWORD *)self + 104) = 0;
  *((_WORD *)self + 420) = 1;
  *((_BYTE *)self + 842) = 0;
  *((_BYTE *)self + 844) = 0;
  *((_BYTE *)self + 852) = 0;
  *((_BYTE *)self + 856) = 0;
  *((_BYTE *)self + 860) = 0;
  *((_BYTE *)self + 864) = 0;
  *((_BYTE *)self + 868) = 0;
  *((_BYTE *)self + 872) = 0;
  *((_BYTE *)self + 880) = 0;
  *((_BYTE *)self + 888) = 0;
  *((_BYTE *)self + 920) = 0;
  *((_BYTE *)self + 928) = 0;
  *((_BYTE *)self + 960) = 0;
  *((_BYTE *)self + 992) = 0;
  *((_BYTE *)self + 1056) = 0;
  *((_QWORD *)self + 121) = 0;
  *((_QWORD *)self + 122) = 0;
  *((_BYTE *)self + 984) = 0;
  *(_OWORD *)((char *)self + 1000) = 0u;
  *(_OWORD *)((char *)self + 1016) = 0u;
  *((_BYTE *)self + 1032) = 0;
  *((_BYTE *)self + 1064) = 0;
  *((_BYTE *)self + 1112) = 0;
  *((_BYTE *)self + 1120) = 0;
  *((_BYTE *)self + 1144) = 0;
  *((_QWORD *)self + 186) = 0;
  *((_QWORD *)self + 189) = 0;
  *((_QWORD *)self + 190) = 0;
  *((_QWORD *)self + 188) = 0;
  *((_QWORD *)self + 191) = 0;
  *((_QWORD *)self + 192) = 0;
  *((_QWORD *)self + 193) = 0;
  *((_QWORD *)self + 195) = 0;
  *((_QWORD *)self + 196) = 0;
  *((_QWORD *)self + 198) = 0;
  *((_QWORD *)self + 199) = 0;
  *((_QWORD *)self + 200) = 0;
  *((_QWORD *)self + 204) = 0;
  *((_QWORD *)self + 205) = 0;
  *((_QWORD *)self + 206) = 0;
  *((_QWORD *)self + 207) = 0;
  *((_BYTE *)self + 1664) = 0;
  *(_WORD *)((char *)self + 1665) = 0;
  *((_QWORD *)self + 211) = 0;
  *((_QWORD *)self + 212) = 0;
  *((_BYTE *)self + 1704) = 0;
  *((_BYTE *)self + 1712) = 0;
  *((_QWORD *)self + 217) = 0;
  *((_QWORD *)self + 219) = 0;
  *((_QWORD *)self + 220) = 0;
  return self;
}

uint64_t __65__WKWebView_WKViewInternalIOS___presentLockdownModeAlertIfNeeded__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_presentLockdownMode");
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1265) = 0;
  return result;
}

- (void)_presentLockdownMode
{
  char v3;
  const __CFString *v4;
  CFTypeRef v5;
  _QWORD *v6;
  CFTypeRef arg;

  if ((WebCore::IOSApplication::isMobileSafari((WebCore::IOSApplication *)self) & 1) != 0
    || !+[WKProcessPool _lockdownModeEnabledGloballyForTesting](WKProcessPool, "_lockdownModeEnabledGloballyForTesting"))
  {
    lockdownModeWarningNeeded = 0;
    return;
  }
  v3 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults"), "BOOLForKey:", CFSTR("WebKitCaptivePortalModeAlertShown"));
  lockdownModeWarningNeeded = v3 ^ 1;
  if ((v3 & 1) != 0)
    return;
  WebCore::copyLocalizedString((WebCore *)CFSTR("Certain experiences and features may not function as expected. You can turn off Lockdown Mode for this app in Settings."), v4);
  if (!arg)
  {
    v5 = 0;
    if (!self)
      goto LABEL_7;
    goto LABEL_6;
  }
  CFAutorelease(arg);
  v5 = arg;
  if (self)
LABEL_6:
    CFRetain(self);
LABEL_7:
  v6 = malloc_type_malloc(0x30uLL, 0x10E004016A945A2uLL);
  *v6 = MEMORY[0x1E0C809A0];
  v6[1] = 50331650;
  v6[2] = WTF::BlockPtr<void ()(WKDialogResult)>::fromCallable<-[WKWebView(WKViewInternalIOS) _presentLockdownMode]::$_3>(-[WKWebView(WKViewInternalIOS) _presentLockdownMode]::$_3)::{lambda(void *,WKDialogResult)#1}::__invoke;
  v6[3] = &WTF::BlockPtr<void ()(WKDialogResult)>::fromCallable<-[WKWebView(WKViewInternalIOS) _presentLockdownMode]::$_3>(-[WKWebView(WKViewInternalIOS) _presentLockdownMode]::$_3)::descriptor;
  v6[4] = v5;
  v6[5] = self;
  -[WKWebView UIDelegate](self, "UIDelegate");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(-[WKWebView UIDelegate](self, "UIDelegate"), "webView:showLockdownModeFirstUseMessage:completionHandler:", self, v5, v6);
  else
    ((void (*)(_QWORD *, uint64_t))v6[2])(v6, 1);
  _Block_release(v6);
}

- (void)_hidePasswordView
{
  void *m_ptr;

  if (self->_passwordView.m_ptr)
  {
    objc_msgSend(-[WKWebView _currentContentView](self, "_currentContentView"), "setHidden:", 0);
    objc_msgSend(self->_passwordView.m_ptr, "hide");
    m_ptr = self->_passwordView.m_ptr;
    self->_passwordView.m_ptr = 0;
    if (m_ptr)
      CFRelease(m_ptr);
    -[WKWebView _didStopRequestingPasswordForDocument](self, "_didStopRequestingPasswordForDocument");
  }
}

- (void)_didStartProvisionalLoadForMainFrame
{
  ViewGestureController *value;

  value = self->_gestureController.__ptr_.__value_;
  if (value)
    WebKit::ViewGestureController::didStartProvisionalOrSameDocumentLoadForMainFrame((uint64_t)value);
}

- (void)_setHistoryDelegate:(id)a3
{
  WebPageProxy *m_ptr;
  uint64_t v6;
  uint64_t v7;

  m_ptr = self->_page.m_ptr;
  WebKit::NavigationState::createHistoryClient((WebKit::NavigationState *)self->_navigationState.__ptr_.__value_, &v7);
  v6 = *((_QWORD *)m_ptr + 10);
  *((_QWORD *)m_ptr + 10) = v7;
  if (v6)
    (*(void (**)(uint64_t))(*(_QWORD *)v6 + 8))(v6);
  WebKit::NavigationState::setHistoryDelegate((uint64_t)self->_navigationState.__ptr_.__value_, a3);
}

- (void)setAllowsBackForwardNavigationGestures:(BOOL)allowsBackForwardNavigationGestures
{
  _BOOL4 v3;
  WebPageProxy *m_ptr;
  WebPageProxy *v6;
  WebKit::ViewGestureController *v7;
  ViewGestureController *value;
  uint64_t v9;
  ViewGestureController *v10;

  v3 = allowsBackForwardNavigationGestures;
  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((_BYTE *)m_ptr + 1290))
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("The WKWebView is suspended"));
  if (self->_allowsBackForwardNavigationGestures != v3)
  {
    self->_allowsBackForwardNavigationGestures = v3;
    if (v3 && !self->_gestureController.__ptr_.__value_)
    {
      v6 = self->_page.m_ptr;
      v7 = (WebKit::ViewGestureController *)WTF::fastMalloc((WTF *)0xF8);
      WebKit::ViewGestureController::ViewGestureController(v7, (WebKit::WebPageProxy *)v6);
      value = self->_gestureController.__ptr_.__value_;
      self->_gestureController.__ptr_.__value_ = (ViewGestureController *)v7;
      if (value)
      {
        (*(void (**)(ViewGestureController *))(*(_QWORD *)value + 8))(value);
        v7 = (WebKit::ViewGestureController *)self->_gestureController.__ptr_.__value_;
      }
      WebKit::ViewGestureController::installSwipeHandler(v7, &self->super, (UIView *)-[WKWebView scrollView](self, "scrollView"));
      v9 = objc_msgSend(self->_configuration.m_ptr, "_alternateWebViewForNavigationGestures");
      if (v9)
        WebKit::ViewGestureController::setAlternateBackForwardListSourcePage((WebKit::ViewGestureController *)self->_gestureController.__ptr_.__value_, *(WebKit::WebPageProxy **)(v9 + 424));
    }
    v10 = self->_gestureController.__ptr_.__value_;
    if (v10)
      *((_BYTE *)v10 + 28) = v3;
    *((_BYTE *)self->_page.m_ptr + 855) = v3;
  }
}

- (void)setFindInteractionEnabled:(BOOL)findInteractionEnabled
{
  _BOOL4 v3;
  void *m_ptr;
  void *v6;
  void *v7;

  if (self->_findInteractionEnabled != findInteractionEnabled)
  {
    v3 = findInteractionEnabled;
    self->_findInteractionEnabled = findInteractionEnabled;
    m_ptr = self->_findInteraction.m_ptr;
    if (v3)
    {
      if (!m_ptr)
      {
        m_ptr = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA5C8]), "initWithSessionDelegate:", self);
        v6 = self->_findInteraction.m_ptr;
        self->_findInteraction.m_ptr = m_ptr;
        if (v6)
        {
          CFRelease(v6);
          m_ptr = self->_findInteraction.m_ptr;
        }
      }
      -[WKWebView addInteraction:](self, "addInteraction:", m_ptr);
    }
    else
    {
      -[WKWebView removeInteraction:](self, "removeInteraction:", m_ptr);
      v7 = self->_findInteraction.m_ptr;
      self->_findInteraction.m_ptr = 0;
      if (v7)
        CFRelease(v7);
    }
  }
}

- (void)_clearSafeBrowsingWarning
{
  void *m_ptr;

  m_ptr = self->_safeBrowsingWarning.m_ptr;
  self->_safeBrowsingWarning.m_ptr = 0;
  objc_msgSend(m_ptr, "removeFromSuperview");
  if (m_ptr)
    CFRelease(m_ptr);
}

- (id)undoManager
{
  id v3;
  objc_super v5;

  v3 = -[WKWebView _currentContentView](self, "_currentContentView");
  if (self->_contentView.m_ptr == v3)
    return (id)objc_msgSend(v3, "undoManagerForWebView");
  v5.receiver = self;
  v5.super_class = (Class)WKWebView;
  return -[WKWebView undoManager](&v5, sel_undoManager);
}

- (void)_endLiveResize
{
  NSObject *v3;
  uint64_t v4;
  void *m_ptr;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  const void *v10;
  _QWORD *v11;
  unsigned int *v12;
  unsigned int v13;
  unsigned int v14;
  uint64_t v15;
  uint64_t v16;
  WTF *v17;
  void *v18;
  WTF::RunLoop::TimerBase *v19;
  id v20;
  _BYTE buf[22];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = qword_1ECE71A28;
  if (os_log_type_enabled((os_log_t)qword_1ECE71A28, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(*((_QWORD *)self->_page.m_ptr + 4) + 744);
    *(_DWORD *)buf = 134218240;
    *(_QWORD *)&buf[4] = self;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = v4;
    _os_log_impl(&dword_196BCC000, v3, OS_LOG_TYPE_DEFAULT, "%p (pageProxyID=%llu) -[WKWebView _endLiveResize]", buf, 0x16u);
  }
  if (self->_perProcessState.liveResizeParameters.__engaged_)
  {
    objc_msgSend(self->_endLiveResizeTimer.m_ptr, "invalidate");
    m_ptr = self->_endLiveResizeTimer.m_ptr;
    self->_endLiveResizeTimer.m_ptr = 0;
    if (m_ptr)
      CFRelease(m_ptr);
    v6 = (void *)-[WKWebView snapshotViewAfterScreenUpdates:](self, "snapshotViewAfterScreenUpdates:", 0);
    v7 = v6;
    if (v6)
      CFRetain(v6);
    -[WKWebView bounds](self, "bounds");
    objc_msgSend(v7, "setFrame:");
    -[WKWebView addSubview:](self, "addSubview:", v7);
    if (self->_perProcessState.liveResizeParameters.__engaged_)
      self->_perProcessState.liveResizeParameters.__engaged_ = 0;
    -[WKWebView _destroyResizeAnimationView](self, "_destroyResizeAnimationView");
    -[WKWebView _didStopDeferringGeometryUpdates](self, "_didStopDeferringGeometryUpdates");
    if (v7)
      CFRetain(v7);
    v20 = 0;
    objc_initWeak(&v20, self);
    *(_QWORD *)buf = v7;
    *(_QWORD *)&buf[8] = 0;
    objc_moveWeak((id *)&buf[8], &v20);
    v8 = malloc_type_malloc(0x30uLL, 0x10E0040A6CB5C9CuLL);
    *(_QWORD *)v8 = MEMORY[0x1E0C809A0];
    *((_QWORD *)v8 + 1) = 50331650;
    *((_QWORD *)v8 + 2) = WTF::BlockPtr<void ()(void)>::fromCallable<-[WKWebView(WKViewInternalIOS) _endLiveResize]::$_2>(-[WKWebView(WKViewInternalIOS) _endLiveResize]::$_2)::{lambda(void *)#1}::__invoke;
    *((_QWORD *)v8 + 3) = &WTF::BlockPtr<void ()(void)>::fromCallable<-[WKWebView(WKViewInternalIOS) _endLiveResize]::$_2>(-[WKWebView(WKViewInternalIOS) _endLiveResize]::$_2)::descriptor;
    v9 = *(_QWORD *)buf;
    *(_QWORD *)buf = 0;
    *((_QWORD *)v8 + 4) = v9;
    *((_QWORD *)v8 + 5) = 0;
    objc_moveWeak((id *)v8 + 5, (id *)&buf[8]);
    objc_destroyWeak((id *)&buf[8]);
    v10 = *(const void **)buf;
    *(_QWORD *)buf = 0;
    if (v10)
      CFRelease(v10);
    -[WKWebView _doAfterNextVisibleContentRectUpdate:](self, "_doAfterNextVisibleContentRectUpdate:", v8);
    _Block_release(v8);
    objc_destroyWeak(&v20);
    WTF::RunLoop::main(0);
    if (v7)
      CFRetain(v7);
    v11 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
    *v11 = &off_1E34C5C48;
    v11[1] = v7;
    *(_QWORD *)buf = v11;
    WTF::RunLoop::dispatchAfter();
    if (v19)
    {
      v12 = (unsigned int *)((char *)v19 + 24);
      do
      {
        v13 = __ldaxr(v12);
        v14 = v13 - 1;
      }
      while (__stlxr(v14, v12));
      if (!v14)
      {
        atomic_store(1u, (unsigned int *)v19 + 6);
        v16 = *((_QWORD *)v19 + 4);
        *((_QWORD *)v19 + 4) = 0;
        if (v16)
          (*(void (**)(uint64_t))(*(_QWORD *)v16 + 8))(v16);
        WTF::RunLoop::TimerBase::~TimerBase(v19);
        WTF::fastFree(v17, v18);
      }
    }
    v15 = *(_QWORD *)buf;
    *(_QWORD *)buf = 0;
    if (v15)
      (*(void (**)(uint64_t))(*(_QWORD *)v15 + 8))(v15);
    if (v7)
      CFRelease(v7);
  }
}

- (void)_setBackgroundExtendsBeyondPage:(BOOL)a3
{
  _BOOL4 v3;
  WebPageProxy *m_ptr;

  v3 = a3;
  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((_BYTE *)m_ptr + 1290))
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("The WKWebView is suspended"));
    m_ptr = self->_page.m_ptr;
  }
  WebKit::WebPageProxy::setBackgroundExtendsBeyondPage((uint64_t)m_ptr, v3);
}

- (void)setInspectable:(BOOL)inspectable
{
  _BOOL4 v3;
  WebPageProxy *m_ptr;

  v3 = inspectable;
  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((_BYTE *)m_ptr + 1290))
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("The WKWebView is suspended"));
    m_ptr = self->_page.m_ptr;
  }
  WebKit::WebPageProxy::setInspectable((WebKit::WebPageProxy *)m_ptr, v3);
}

- (void)setUnderPageBackgroundColor:(UIColor *)underPageBackgroundColor
{
  WebPageProxy *m_ptr;
  CGColor *v4;
  CGColor *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  unsigned int *v9;
  unsigned int v10;
  unsigned int v11;
  uint64_t v12;

  m_ptr = self->_page.m_ptr;
  v4 = -[UIColor CGColor](underPageBackgroundColor, "CGColor");
  v6 = WebCore::roundAndClampToSRGBALossy(v4, v5);
  v7 = bswap32(v6) | 0x1104000000000000;
  if (!BYTE4(v6))
    v7 = 0;
  v12 = v7;
  WebKit::WebPageProxy::setUnderPageBackgroundColorOverride((WebKit::WebPageProxy *)m_ptr, (unint64_t *)&v12);
  if ((v12 & 0x8000000000000) != 0)
  {
    v9 = (unsigned int *)(v12 & 0xFFFFFFFFFFFFLL);
    do
    {
      v10 = __ldaxr(v9);
      v11 = v10 - 1;
    }
    while (__stlxr(v11, v9));
    if (!v11)
    {
      atomic_store(1u, v9);
      WTF::fastFree((WTF *)v9, v8);
    }
  }
}

- (void)dealloc
{
  objc_class *v3;
  WebPageProxy *m_ptr;
  WebKit::WebProcessPool *v5;
  id v6;
  const __CFString *v7;
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v9;

  v3 = (objc_class *)objc_opt_class();
  if ((WebCoreObjCScheduleDeallocateOnMainRunLoop(v3, (objc_object *)self) & 1) == 0)
  {
    objc_msgSend(self->_contentView.m_ptr, "_webViewDestroyed");
    m_ptr = self->_page.m_ptr;
    if (m_ptr)
    {
      if (!self->_remoteObjectRegistry.m_ptr
        || (v5 = API::PageConfiguration::Data::LazyInitializedRef<WebKit::WebProcessPool,&API::PageConfiguration::Data::createWebProcessPool>::get((WebKit::WebProcessPool **)(*((_QWORD *)m_ptr + 6) + 24)),
            IPC::MessageReceiverMap::removeMessageReceiver((uint64_t)v5 + 56, 0x69u, *(_QWORD *)(*((_QWORD *)self->_page.m_ptr + 4) + 744)), (m_ptr = self->_page.m_ptr) != 0))
      {
        WebKit::WebPageProxy::close((unsigned int *)m_ptr);
      }
    }
    objc_msgSend(self->_remoteObjectRegistry.m_ptr, "_invalidate");
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "removeObserver:", self);
    objc_msgSend(self->_scrollView.m_ptr, "setInternalDelegate:", 0);
    v6 = objc_alloc(MEMORY[0x1E0CB3940]);
    v7 = (const __CFString *)objc_msgSend(v6, "initWithCString:encoding:", *MEMORY[0x1E0D27C98], 4);
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, v7, 0);
    -[WKWebView _invalidateResizeAssertions](self, "_invalidateResizeAssertions");
    v9.receiver = self;
    v9.super_class = (Class)WKWebView;
    -[WKWebView dealloc](&v9, sel_dealloc);
    if (v7)
      CFRelease(v7);
  }
}

- (void)setNavigationDelegate:(id)navigationDelegate
{
  WebPageProxy *m_ptr;
  uint64_t v6;
  uint64_t v7;

  m_ptr = self->_page.m_ptr;
  WebKit::NavigationState::createNavigationClient((WebKit::NavigationState *)self->_navigationState.__ptr_.__value_, &v7);
  v6 = *((_QWORD *)m_ptr + 9);
  *((_QWORD *)m_ptr + 9) = v7;
  if (v6)
    (*(void (**)(uint64_t))(*(_QWORD *)v6 + 8))(v6);
  WebKit::NavigationState::setNavigationDelegate((uint64_t)self->_navigationState.__ptr_.__value_, navigationDelegate);
}

- (void)_setInputDelegate:(id)a3
{
  WebPageProxy *m_ptr;
  uint64_t v6;
  _QWORD *v7;

  objc_storeWeak(&self->_inputDelegate.m_weakReference, a3);
  m_ptr = self->_page.m_ptr;
  if (a3)
  {
    v6 = WTF::fastMalloc((WTF *)0x10);
    *(_QWORD *)v6 = off_1E34BCDA0;
    *(_QWORD *)(v6 + 8) = 0;
    objc_initWeak((id *)(v6 + 8), self);
    v7 = (_QWORD *)v6;
  }
  else
  {
    v7 = 0;
  }
  WebKit::WebPageProxy::setFormClient((uint64_t)m_ptr, &v7);
  if (v7)
    (*(void (**)(_QWORD *))(*v7 + 8))(v7);
}

- (void)_setIconLoadingDelegate:(id)a3
{
  WebPageProxy *m_ptr;
  IconLoadingDelegate *value;
  _QWORD *v7;
  _QWORD *v8;

  m_ptr = self->_page.m_ptr;
  value = self->_iconLoadingDelegate.__ptr_.__value_;
  v7 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
  *v7 = off_1E34C7318;
  v7[1] = value;
  v8 = v7;
  WebKit::WebPageProxy::setIconLoadingClient((uint64_t)m_ptr, (uint64_t *)&v8);
  if (v8)
    (*(void (**)(_QWORD *))(*v8 + 8))(v8);
  WebKit::IconLoadingDelegate::setDelegate((uint64_t)self->_iconLoadingDelegate.__ptr_.__value_, a3);
}

- (WKNavigation)loadRequest:(NSURLRequest *)request
{
  WebPageProxy *m_ptr;
  uint64_t v6;
  const void *v7;
  const void *v8;
  WKNavigation *v9;
  uint64_t v10;
  CFTypeRef v11;
  _BYTE v13[192];
  CFTypeRef cf;
  uint64_t v15;

  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((_BYTE *)m_ptr + 1290))
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("The WKWebView is suspended"));
    m_ptr = self->_page.m_ptr;
  }
  if (*((_BYTE *)m_ptr + 1118))
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("The WKWebView was used to load a service worker"));
    m_ptr = self->_page.m_ptr;
  }
  MEMORY[0x19AEAEC20](v13, request);
  WebKit::WebPageProxy::loadRequest((uint64_t)m_ptr, (WebCore::ResourceRequestBase *)v13, 1, 0, &v15);
  v6 = v15;
  if (v15)
  {
    v15 = 0;
    v7 = *(const void **)(v6 + 8);
    if (v7)
    {
      CFRetain(*(CFTypeRef *)(v6 + 8));
      v8 = *(const void **)(v6 + 8);
    }
    else
    {
      v8 = 0;
    }
    CFRelease(v8);
  }
  else
  {
    v7 = 0;
  }
  v9 = (id)CFMakeCollectable(v7);
  v10 = v15;
  v15 = 0;
  if (v10)
    CFRelease(*(CFTypeRef *)(v10 + 8));
  v11 = cf;
  cf = 0;
  if (v11)
    CFRelease(v11);
  WebCore::ResourceRequestBase::~ResourceRequestBase((WebCore::ResourceRequestBase *)v13);
  return v9;
}

- (void)_resizeWhileHidingContentWithUpdates:(id)a3
{
  NSObject *v5;
  uint64_t v6;
  int v7;
  WKWebView *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = qword_1ECE71A28;
  if (os_log_type_enabled((os_log_t)qword_1ECE71A28, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(*((_QWORD *)self->_page.m_ptr + 4) + 744);
    v7 = 134218240;
    v8 = self;
    v9 = 2048;
    v10 = v6;
    _os_log_impl(&dword_196BCC000, v5, OS_LOG_TYPE_DEFAULT, "%p (pageProxyID=%llu) -[WKWebView _resizeWhileHidingContentWithUpdates:]", (uint8_t *)&v7, 0x16u);
  }
  -[WKWebView _beginAnimatedResizeWithUpdates:](self, "_beginAnimatedResizeWithUpdates:", a3);
  if (self->_perProcessState.dynamicViewportUpdateMode == 1)
  {
    objc_msgSend(self->_contentView.m_ptr, "setHidden:", 1);
    self->_perProcessState.dynamicViewportUpdateMode = 2;
    self->_perProcessState.waitingForEndAnimatedResize = 0;
  }
}

- (void)_beginAnimatedResizeWithUpdates:(id)a3
{
  PerWebProcessState *p_perProcessState;
  int dynamicViewportUpdateMode;
  WebPageProxy *m_ptr;
  float *v8;
  float v9;
  float v10;
  float v11;
  float v12;
  BOOL v13;
  char v14;
  NSObject *v15;
  uint64_t v16;
  CGPoint *p_origin;
  double v18;
  double animatedResizeOldMinimumEffectiveDeviceWidth;
  unint64_t v20;
  int *v21;
  CGSize size;
  CGFloat top;
  CGFloat bottom;
  CGFloat right;
  float v26;
  float v27;
  CGSize *p_minimumUnobscuredSize;
  CGSize *p_maximumUnobscuredSize;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  double v34;
  float v35;
  float v36;
  CGSize *p_size;
  CGSize *v38;
  unint64_t v39;
  unint64_t v40;
  unsigned int *v41;
  double *v42;
  double v43;
  double v44;
  double v45;
  CGFloat v46;
  double v47;
  CGFloat v48;
  double v49;
  double v50;
  CGSize v51;
  double v52;
  double v53;
  WebPageProxy *v54;
  WebPageProxy *v55;
  WebPageProxy *v56;
  int32x2_t v57;
  int32x2_t v58;
  _OWORD *v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  void *v66;
  double v67;
  double v68;
  void *v69;
  double v70;
  _BOOL4 v71;
  double v72;
  double v73;
  void *v74;
  double v75;
  void *v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  WebPageProxy *v93;
  uint64_t v94;
  CGFloat v95;
  CGFloat v96;
  CGFloat v97;
  CGFloat v98;
  CGFloat v99;
  CGFloat v100;
  CGFloat v101;
  CGFloat v102;
  double v103;
  float v104;
  double v105;
  float v106;
  double v107;
  float v108;
  double v109;
  float v110;
  WebPageProxy *v111;
  __int128 v112;
  unint64_t v113;
  int32x2_t *v114;
  double v115;
  int32x4_t v116;
  double v117;
  double v118;
  double v119;
  float32x2_t v120;
  float32x2_t v121;
  float v122;
  float v123;
  double v124;
  double v125;
  double v126;
  double v127;
  double v128;
  double v129;
  double v130;
  double v131;
  double v132;
  double v133;
  double left;
  double v135;
  int animatedResizeOldOrientation;
  unsigned int v137;
  float32x2_t v138;
  float32x2_t v139;
  float v140;
  float v141;
  IntSize v142;
  CGRect v143;
  CGRect v144;
  CGAffineTransform v145;
  CGRect v146;
  CGRect v147;
  CGRect v148;
  _BYTE buf[24];
  uint64_t v150;
  uint64_t v151;
  _DWORD v152[8];
  double v153;
  unsigned int v154;
  double v155;
  unint64_t v156;
  uint64_t v157;
  CGRect v158;
  CGRect v159;
  CGRect v160;
  CGRect v161;

  v157 = *MEMORY[0x1E0C80C00];
  p_perProcessState = &self->_perProcessState;
  dynamicViewportUpdateMode = self->_perProcessState.dynamicViewportUpdateMode;
  -[WKWebView bounds](self, "bounds");
  v148.origin.x = v158.origin.x;
  v148.origin.y = v158.origin.y;
  m_ptr = self->_page.m_ptr;
  v148.size.width = v158.size.width;
  v148.size.height = v158.size.height;
  v8 = (float *)*((_QWORD *)m_ptr + 4);
  v9 = v8[568];
  v10 = v8[569];
  v11 = v8[570];
  v12 = v8[571];
  v13 = CGRectIsEmpty(v158) && CGRectIsEmpty(p_perProcessState->animatedResizeOldBounds);
  if (!-[WKWebView usesStandardContentView](self, "usesStandardContentView")
    || (!p_perProcessState->hasCommittedLoadForMainFrame ? (v14 = 1) : (v14 = v13),
        (v14 & 1) != 0 || v11 <= 0.0 || v12 <= 0.0 || p_perProcessState->liveResizeParameters.__engaged_))
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(self->_customContentView.m_ptr, "web_beginAnimatedResizeWithUpdates:", a3);
    else
      (*((void (**)(id))a3 + 2))(a3);
    return;
  }
  v15 = qword_1ECE71A28;
  if (os_log_type_enabled((os_log_t)qword_1ECE71A28, OS_LOG_TYPE_DEFAULT))
  {
    v16 = *(_QWORD *)(*((_QWORD *)self->_page.m_ptr + 4) + 744);
    *(_DWORD *)buf = 134218240;
    *(_QWORD *)&buf[4] = self;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = v16;
    _os_log_impl(&dword_196BCC000, v15, OS_LOG_TYPE_DEFAULT, "%p (pageProxyID=%llu) -[WKWebView _beginAnimatedResizeWithUpdates:]", buf, 0x16u);
  }
  p_origin = &p_perProcessState->animatedResizeOldBounds.origin;
  v159.origin.x = p_perProcessState->animatedResizeOldBounds.origin.x;
  p_perProcessState->dynamicViewportUpdateMode = 1;
  v159.origin.y = p_perProcessState->animatedResizeOldBounds.origin.y;
  v159.size.width = p_perProcessState->animatedResizeOldBounds.size.width;
  v159.size.height = p_perProcessState->animatedResizeOldBounds.size.height;
  if (!CGRectIsEmpty(v159))
  {
    size = p_perProcessState->animatedResizeOldBounds.size;
    v148.origin = *p_origin;
    v148.size = size;
    animatedResizeOldMinimumEffectiveDeviceWidth = self->_animatedResizeOldMinimumEffectiveDeviceWidth;
    animatedResizeOldOrientation = self->_animatedResizeOldOrientation;
    top = self->_animatedResizeOldObscuredInsets.top;
    left = self->_animatedResizeOldObscuredInsets.left;
    bottom = self->_animatedResizeOldObscuredInsets.bottom;
    right = self->_animatedResizeOldObscuredInsets.right;
    *p_origin = 0u;
    p_perProcessState->animatedResizeOldBounds.size = 0u;
    goto LABEL_26;
  }
  -[WKWebView _minimumEffectiveDeviceWidth](self, "_minimumEffectiveDeviceWidth");
  animatedResizeOldMinimumEffectiveDeviceWidth = v18;
  if (self->_overridesInterfaceOrientation)
  {
    v20 = self->_interfaceOrientationOverride - 2;
    if (v20 >= 3)
    {
      animatedResizeOldOrientation = 0;
      goto LABEL_25;
    }
    v21 = &dword_1978CFAE8[v20];
  }
  else
  {
    v21 = (int *)((char *)self->_page.m_ptr + 396);
  }
  animatedResizeOldOrientation = *v21;
LABEL_25:
  top = self->_obscuredInsets.top;
  left = self->_obscuredInsets.left;
  bottom = self->_obscuredInsets.bottom;
  right = self->_obscuredInsets.right;
LABEL_26:
  -[WKWebView activeViewLayoutSize:](self, "activeViewLayoutSize:", &v148);
  v122 = v27;
  v123 = v26;
  if (self->_overriddenLayoutParameters.__engaged_)
    p_minimumUnobscuredSize = &self->_overriddenLayoutParameters.var0.__val_.minimumUnobscuredSize;
  else
    p_minimumUnobscuredSize = &v148.size;
  WebCore::FloatSize::FloatSize((WebCore::FloatSize *)buf, p_minimumUnobscuredSize);
  v121 = *(float32x2_t *)buf;
  if (self->_overriddenLayoutParameters.__engaged_)
    p_maximumUnobscuredSize = &self->_overriddenLayoutParameters.var0.__val_.maximumUnobscuredSize;
  else
    p_maximumUnobscuredSize = &v148.size;
  WebCore::FloatSize::FloatSize((WebCore::FloatSize *)buf, p_maximumUnobscuredSize);
  v120 = *(float32x2_t *)buf;
  (*((void (**)(id))a3 + 2))(a3);
  memset(&v147, 0, sizeof(v147));
  -[WKWebView bounds](self, "bounds");
  v147.origin.x = v30;
  v147.origin.y = v31;
  v147.size.width = v32;
  v147.size.height = v33;
  -[WKWebView _minimumEffectiveDeviceWidth](self, "_minimumEffectiveDeviceWidth");
  v124 = v34;
  -[WKWebView activeViewLayoutSize:](self, "activeViewLayoutSize:", &v147);
  v140 = v36;
  v141 = v35;
  if (self->_overriddenLayoutParameters.__engaged_)
    p_size = &self->_overriddenLayoutParameters.var0.__val_.minimumUnobscuredSize;
  else
    p_size = &v147.size;
  WebCore::FloatSize::FloatSize((WebCore::FloatSize *)buf, p_size);
  v138 = *(float32x2_t *)buf;
  if (self->_overriddenLayoutParameters.__engaged_)
    v38 = &self->_overriddenLayoutParameters.var0.__val_.maximumUnobscuredSize;
  else
    v38 = &v147.size;
  WebCore::FloatSize::FloatSize((WebCore::FloatSize *)buf, v38);
  v135 = animatedResizeOldMinimumEffectiveDeviceWidth;
  v131 = bottom;
  v132 = right;
  v133 = top;
  if (self->_overridesInterfaceOrientation)
  {
    v39 = self->_interfaceOrientationOverride - 2;
    v40 = 0x1EE338000uLL;
    if (v39 >= 3)
    {
      v137 = 0;
      goto LABEL_44;
    }
    v41 = &dword_1978CFAE8[v39];
  }
  else
  {
    v41 = (unsigned int *)((char *)self->_page.m_ptr + 396);
    v40 = 0x1EE338000;
  }
  v137 = *v41;
LABEL_44:
  v139 = *(float32x2_t *)buf;
  v42 = (double *)((char *)self + *(int *)(v40 + 2060));
  v43 = *v42;
  v44 = v42[1];
  v117 = v42[2];
  v119 = v42[3];
  v129 = *v42 + v147.origin.y;
  v130 = v44 + v147.origin.x;
  v146.origin.x = v44 + v147.origin.x;
  v146.origin.y = v129;
  v127 = v147.size.height - (v43 + v117);
  v128 = v147.size.width - (v44 + v119);
  v146.size.width = v128;
  v146.size.height = v127;
  objc_msgSend(self->_contentView.m_ptr, "bounds", *(_QWORD *)&v117);
  v46 = v45;
  v48 = v47;
  v125 = v50;
  v126 = v49;
  if (CGRectIsEmpty(v147))
    goto LABEL_49;
  if (v141 <= 0.0)
    goto LABEL_49;
  if (v140 <= 0.0)
    goto LABEL_49;
  v160.origin.y = v129;
  v160.origin.x = v130;
  v160.size.height = v127;
  v160.size.width = v128;
  if (CGRectIsEmpty(v160)
    || (v161.origin.x = v46, v161.origin.y = v48, v161.size.height = v125, v161.size.width = v126, CGRectIsEmpty(v161)))
  {
LABEL_49:
    if (CGRectIsEmpty(v147))
    {
      v51 = v148.size;
      *p_origin = v148.origin;
      p_perProcessState->animatedResizeOldBounds.size = v51;
      self->_animatedResizeOldMinimumEffectiveDeviceWidth = v135;
      self->_animatedResizeOldOrientation = animatedResizeOldOrientation;
      self->_animatedResizeOldObscuredInsets.top = v133;
      self->_animatedResizeOldObscuredInsets.left = left;
      self->_animatedResizeOldObscuredInsets.bottom = v131;
      self->_animatedResizeOldObscuredInsets.right = v132;
      *(_WORD *)&p_perProcessState->waitingForEndAnimatedResize = 257;
    }
    else
    {
      -[WKWebView _cancelAnimatedResize](self, "_cancelAnimatedResize");
    }
    -[WKWebView _frameOrBoundsMayHaveChanged](self, "_frameOrBoundsMayHaveChanged");
    if (self->_overriddenLayoutParameters.__engaged_)
    {
      *(float *)&v53 = v140;
      *(float *)&v52 = v141;
      -[WKWebView _dispatchSetViewLayoutSize:](self, "_dispatchSetViewLayoutSize:", v52, v53);
      v54 = self->_page.m_ptr;
      *(float32x2_t *)buf = v138;
      WebKit::WebPageProxy::setMinimumUnobscuredSize((uint64_t)v54, (const WebCore::FloatSize *)buf);
      v55 = self->_page.m_ptr;
      *(float32x2_t *)buf = v139;
      WebKit::WebPageProxy::setDefaultUnobscuredSize((uint64_t)v55, (const WebCore::FloatSize *)buf);
      v56 = self->_page.m_ptr;
      *(float32x2_t *)buf = v139;
      WebKit::WebPageProxy::setMaximumUnobscuredSize((uint64_t)v56, (const WebCore::FloatSize *)buf);
    }
    if (self->_overridesInterfaceOrientation)
      -[WKWebView _dispatchSetDeviceOrientation:](self, "_dispatchSetDeviceOrientation:", v137);
  }
  else if (!dynamicViewportUpdateMode
         && CGRectEqualToRect(v148, v147)
         && v123 == v141
         && v122 == v140
         && (v57 = vceq_f32(v121, v138), (v57.i32[0] & v57.i32[1] & 1) != 0)
         && (v58 = vceq_f32(v120, v139), (v58.i8[0] & 1) != 0)
         && (v58.i8[4] & 1) != 0
         && animatedResizeOldOrientation == v137
         && v135 == v124
         && left == v44
         && v133 == v43
         && v132 == v119
         && v131 == v118)
  {
    -[WKWebView _cancelAnimatedResize](self, "_cancelAnimatedResize", v131);
  }
  else
  {
    v59 = (_OWORD *)MEMORY[0x1E0CD2610];
    v60 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 48);
    v62 = *MEMORY[0x1E0CD2610];
    v61 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 16);
    *(_OWORD *)&self->_resizeAnimationTransformAdjustments.m21 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 32);
    *(_OWORD *)&self->_resizeAnimationTransformAdjustments.m23 = v60;
    *(_OWORD *)&self->_resizeAnimationTransformAdjustments.m11 = v62;
    *(_OWORD *)&self->_resizeAnimationTransformAdjustments.m13 = v61;
    v63 = v59[7];
    v65 = v59[4];
    v64 = v59[5];
    *(_OWORD *)&self->_resizeAnimationTransformAdjustments.m41 = v59[6];
    *(_OWORD *)&self->_resizeAnimationTransformAdjustments.m43 = v63;
    *(_OWORD *)&self->_resizeAnimationTransformAdjustments.m31 = v65;
    *(_OWORD *)&self->_resizeAnimationTransformAdjustments.m33 = v64;
    -[WKWebView _ensureResizeAnimationView](self, "_ensureResizeAnimationView");
    v66 = self->_scrollView.m_ptr;
    v67 = v141 / v126;
    objc_msgSend(v66, "minimumZoomScale");
    if (v68 >= v67)
      v68 = v141 / v126;
    objc_msgSend(v66, "setMinimumZoomScale:", v68);
    v69 = self->_scrollView.m_ptr;
    objc_msgSend(v69, "maximumZoomScale");
    if (v67 >= v70)
      v70 = v141 / v126;
    objc_msgSend(v69, "setMaximumZoomScale:", v70);
    v71 = -[WKWebView _isWindowResizingEnabled](self, "_isWindowResizingEnabled");
    if (v126 <= v11)
      v72 = v126;
    else
      v72 = v11;
    if (v71)
      v72 = v126;
    p_perProcessState->animatedResizeOriginalContentWidth = v72;
    v73 = v141 / v72;
    v74 = (void *)objc_msgSend(-[WKWebView _currentContentView](self, "_currentContentView"), "layer");
    if (v74)
    {
      objc_msgSend(v74, "affineTransform");
      v75 = *(double *)buf;
    }
    else
    {
      v75 = 0.0;
    }
    v76 = self->_resizeAnimationView.m_ptr;
    CGAffineTransformMakeScale(&v145, v73 / v75, v73 / v75);
    objc_msgSend(v76, "setTransform:", &v145);
    *(float *)buf = v9 + (float)(v11 * 0.5);
    *(float *)&buf[4] = v10 + (float)(v12 * 0.5);
    WebCore::FloatPoint::operator CGPoint();
    -[WKWebView convertPoint:fromView:](self, "convertPoint:fromView:", self->_contentView.m_ptr);
    v78 = v77;
    v80 = v79;
    objc_msgSend(self->_scrollView.m_ptr, "contentOffset");
    v82 = v78 - (v130 + v128 * 0.5) + v81;
    v84 = v80 - (v129 + v127 * 0.5) + v83;
    v86 = v42[2];
    v85 = v42[3];
    v87 = v125 * v73;
    if (v126 * v73 - v147.size.width + v85 < v82)
      v82 = v126 * v73 - v147.size.width + v85;
    if (v87 - v147.size.height + v86 < v84)
      v84 = v87 - v147.size.height + v86;
    v88 = *v42;
    if (v82 >= -v42[1])
      v89 = v82;
    else
      v89 = -v42[1];
    v90 = -v88;
    if (v84 >= -v88)
      v90 = v84;
    if (v125 + -1.0 >= (float)(v10 + v12))
      v91 = v90;
    else
      v91 = v87 - v147.size.height + v86;
    if (v10 < 1.0)
    {
      -[WKWebView _initialContentOffsetForScrollView](self, "_initialContentOffsetForScrollView");
      v91 = v92;
    }
    v93 = self->_page.m_ptr;
    v94 = 692;
    if (!*((_BYTE *)v93 + 696))
      v94 = 688;
    objc_msgSend(self->_scrollView.m_ptr, "setContentSize:", floor(v126 * v73 * *(float *)((char *)v93 + v94)) / *(float *)((char *)v93 + v94), floor(v87 * *(float *)((char *)v93 + v94)) / *(float *)((char *)v93 + v94));
    objc_msgSend(self->_scrollView.m_ptr, "setContentOffset:", v89, v91);
    -[WKWebView convertRect:toView:](self, "convertRect:toView:", self->_contentView.m_ptr, *(_OWORD *)&v147.origin, v147.size.width, v147.size.height);
    v144.origin.x = v95;
    v144.origin.y = v96;
    v144.size.width = v97;
    v144.size.height = v98;
    -[WKWebView convertRect:toView:](self, "convertRect:toView:", self->_contentView.m_ptr, v130, v129, v128, v127);
    v143.origin.x = v99;
    v143.origin.y = v100;
    v143.size.width = v101;
    v143.size.height = v102;
    -[WKWebView _computedUnobscuredSafeAreaInset](self, "_computedUnobscuredSafeAreaInset");
    v104 = v103;
    v106 = v105;
    v108 = v107;
    v110 = v109;
    if (!p_perProcessState->lastSentViewLayoutSize.__engaged_)
      p_perProcessState->lastSentViewLayoutSize.__engaged_ = 1;
    p_perProcessState->lastSentViewLayoutSize.var0.__val_.m_width = v141;
    p_perProcessState->lastSentViewLayoutSize.var0.__val_.m_height = v140;
    p_perProcessState->lastSentDeviceOrientation.var0.__val_ = v137;
    p_perProcessState->lastSentDeviceOrientation.__engaged_ = 1;
    p_perProcessState->lastSentMinimumEffectiveDeviceWidth.var0.__val_ = v124;
    p_perProcessState->lastSentMinimumEffectiveDeviceWidth.__engaged_ = 1;
    v111 = self->_page.m_ptr;
    *(float *)buf = v141;
    *(float *)&buf[4] = v140;
    *(float32x2_t *)&v112 = v138;
    *((float32x2_t *)&v112 + 1) = v139;
    *(_OWORD *)&buf[8] = v112;
    WebCore::FloatRect::FloatRect((WebCore::FloatRect *)&v150, &v144);
    WebCore::FloatRect::FloatRect((WebCore::FloatRect *)&v151, &v143);
    WebCore::FloatRect::FloatRect((WebCore::FloatRect *)v152, &v146);
    *(float *)&v152[4] = v104;
    *(float *)&v152[5] = v106;
    *(float *)&v152[6] = v108;
    *(float *)&v152[7] = v110;
    v153 = v73;
    v154 = v137;
    v155 = v124;
    v113 = self->_currentDynamicViewportSizeUpdateID + 1;
    self->_currentDynamicViewportSizeUpdateID = v113;
    v156 = v113;
    WebKit::WebPageProxy::dynamicViewportSizeUpdate((WebKit::WebPageProxy *)v111, (uint64_t)buf);
    v114 = (int32x2_t *)*((_QWORD *)self->_page.m_ptr + 23);
    if (v114)
    {
      WebCore::IntSize::IntSize((WebCore::IntSize *)buf, &v147.size);
      v142 = 0;
      WebKit::DrawingAreaProxy::setSize(v114, (const IntSize *)buf, (int32x2_t *)&v142, v115, v116);
    }
    *(_WORD *)&p_perProcessState->waitingForEndAnimatedResize = 257;
  }
}

- (void)_setHasCustomContentView:(BOOL)a3 loadedMIMEType:(const void *)a4
{
  objc_class *v6;
  objc_class *v7;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  const __CFString *v17;
  void *v18;
  void *m_ptr;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  WebPageProxy *v30;
  double v31;
  double v32;
  uint64_t v33;
  void *v34;
  id v35;
  void *v36;

  if (a3
    && (v6 = -[WKWebViewContentProviderRegistry providerForMIMEType:](-[WKWebView _contentProviderRegistry](self, "_contentProviderRegistry"), "providerForMIMEType:", a4)) != 0)
  {
    v7 = v6;
    objc_msgSend(self->_customContentView.m_ptr, "removeFromSuperview");
    objc_msgSend(self->_customContentFixedOverlayView.m_ptr, "removeFromSuperview");
    v8 = [v7 alloc];
    -[WKWebView bounds](self, "bounds");
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v16 = v15;
    if (*(_QWORD *)a4)
      v17 = (const __CFString *)WTF::StringImpl::operator NSString *();
    else
      v17 = &stru_1E351F1B8;
    v18 = (void *)objc_msgSend(v8, "web_initWithFrame:webView:mimeType:", self, v17, v10, v12, v14, v16);
    m_ptr = self->_customContentView.m_ptr;
    self->_customContentView.m_ptr = v18;
    if (m_ptr)
      CFRelease(m_ptr);
    v20 = objc_alloc(MEMORY[0x1E0CEABB0]);
    -[WKWebView bounds](self, "bounds");
    v21 = (void *)objc_msgSend(v20, "initWithFrame:");
    v22 = self->_customContentFixedOverlayView.m_ptr;
    self->_customContentFixedOverlayView.m_ptr = v21;
    if (v22)
    {
      CFRelease(v22);
      v21 = self->_customContentFixedOverlayView.m_ptr;
    }
    objc_msgSend((id)objc_msgSend(v21, "layer"), "setName:", CFSTR("CustomContentFixedOverlay"));
    objc_msgSend(self->_customContentFixedOverlayView.m_ptr, "setUserInteractionEnabled:", 0);
    objc_msgSend((id)objc_msgSend(self->_contentView.m_ptr, "unscaledView"), "removeFromSuperview");
    objc_msgSend(self->_contentView.m_ptr, "removeFromSuperview");
    objc_msgSend(self->_scrollView.m_ptr, "addSubview:", self->_customContentView.m_ptr);
    -[WKWebView addSubview:](self, "addSubview:", self->_customContentFixedOverlayView.m_ptr);
    v23 = self->_customContentView.m_ptr;
    -[WKWebView bounds](self, "bounds");
    objc_msgSend(v23, "web_setMinimumSize:", v24, v25);
    objc_msgSend(self->_customContentView.m_ptr, "web_setFixedOverlayView:", self->_customContentFixedOverlayView.m_ptr);
    WebCore::Color::operator=();
    -[WKWebView _resetContentOffset](self, "_resetContentOffset");
    objc_msgSend((id)objc_msgSend(self->_scrollView.m_ptr, "panGestureRecognizer"), "setAllowedTouchTypes:", self->_scrollViewDefaultAllowedTouchTypes.m_ptr);
    objc_msgSend(self->_scrollView.m_ptr, "_setScrollEnabledInternal:", 1);
    -[WKWebView _setAvoidsUnsafeArea:](self, "_setAvoidsUnsafeArea:", 0);
  }
  else
  {
    v26 = self->_customContentView.m_ptr;
    if (v26)
    {
      objc_msgSend(v26, "removeFromSuperview");
      v27 = self->_customContentView.m_ptr;
      self->_customContentView.m_ptr = 0;
      if (v27)
        CFRelease(v27);
      objc_msgSend(self->_customContentFixedOverlayView.m_ptr, "removeFromSuperview");
      v28 = self->_customContentFixedOverlayView.m_ptr;
      self->_customContentFixedOverlayView.m_ptr = 0;
      if (v28)
        CFRelease(v28);
      objc_msgSend(self->_scrollView.m_ptr, "addSubview:", self->_contentView.m_ptr);
      objc_msgSend(self->_scrollView.m_ptr, "addSubview:", objc_msgSend(self->_contentView.m_ptr, "unscaledView"));
      v29 = self->_scrollView.m_ptr;
      v30 = self->_page.m_ptr;
      objc_msgSend(self->_contentView.m_ptr, "frame");
      v33 = 692;
      if (!*((_BYTE *)v30 + 696))
        v33 = 688;
      objc_msgSend(v29, "setContentSize:", floor(v31 * *(float *)((char *)v30 + v33)) / *(float *)((char *)v30 + v33), floor(v32 * *(float *)((char *)v30 + v33)) / *(float *)((char *)v30 + v33));
      v34 = self->_customContentFixedOverlayView.m_ptr;
      -[WKWebView bounds](self, "bounds");
      objc_msgSend(v34, "setFrame:");
      -[WKWebView addSubview:](self, "addSubview:", self->_customContentFixedOverlayView.m_ptr);
    }
  }
  if (-[WKWebView isFirstResponder](self, "isFirstResponder"))
  {
    v35 = -[WKWebView _currentContentView](self, "_currentContentView");
    v36 = v35;
    if (self->_contentView.m_ptr != v35)
    {
      if (!objc_msgSend(v35, "canBecomeFirstResponder"))
        return;
      goto LABEL_21;
    }
    if ((objc_msgSend(v35, "canBecomeFirstResponderForWebView") & 1) != 0)
LABEL_21:
      objc_msgSend(v36, "becomeFirstResponder");
  }
}

- (BOOL)_scrollViewIsRubberBandingForRefreshControl
{
  double v3;
  double v4;
  double v5;

  if (objc_msgSend(self->_scrollView.m_ptr, "refreshControl")
    && (objc_msgSend(self->_scrollView.m_ptr, "contentOffset"),
        v4 = v3,
        objc_msgSend(self->_scrollView.m_ptr, "adjustedContentInset"),
        v4 < -v5))
  {
    return -[WKWebView _scrollViewIsRubberBanding:](self, "_scrollViewIsRubberBanding:", self->_scrollView.m_ptr);
  }
  else
  {
    return 0;
  }
}

- (unint64_t)_resetFocusPreservationCount
{
  unint64_t focusPreservationCount;

  focusPreservationCount = self->_focusPreservationCount;
  self->_focusPreservationCount = 0;
  return focusPreservationCount;
}

- (void)_resetContentOffset
{
  void *m_ptr;

  m_ptr = self->_scrollView.m_ptr;
  -[WKWebView _initialContentOffsetForScrollView](self, "_initialContentOffsetForScrollView");
  objc_msgSend(m_ptr, "setContentOffset:");
}

- (CGPoint)_initialContentOffsetForScrollView
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  CGPoint result;

  -[WKWebView _computedContentInset](self, "_computedContentInset");
  v3 = -v2;
  v5 = -v4;
  v6 = v3;
  result.y = v5;
  result.x = v6;
  return result;
}

- (void)_didFinishScrolling:(id)a3
{
  uint64_t v4;

  if (self->_scrollView.m_ptr == a3 && -[WKWebView usesStandardContentView](self, "usesStandardContentView"))
  {
    -[WKWebView _scheduleVisibleContentRectUpdate](self, "_scheduleVisibleContentRectUpdate");
    objc_msgSend(self->_contentView.m_ptr, "didFinishScrolling");
    v4 = *((_QWORD *)self->_page.m_ptr + 25);
    if (v4)
      (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)v4 + 120))(v4, 0);
  }
}

- (UIEdgeInsets)_computedContentInset
{
  CGFloat top;
  CGFloat left;
  CGFloat bottom;
  CGFloat right;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  UIEdgeInsets result;

  if (self->_haveSetObscuredInsets)
  {
    top = self->_obscuredInsets.top;
    left = self->_obscuredInsets.left;
    bottom = self->_obscuredInsets.bottom;
    right = self->_obscuredInsets.right;
  }
  else
  {
    objc_msgSend(self->_scrollView.m_ptr, "contentInset");
    top = v7;
    left = v8;
    bottom = v9;
    right = v10;
    if (-[WKWebView _safeAreaShouldAffectObscuredInsets](self, "_safeAreaShouldAffectObscuredInsets"))
    {
      -[WKWebView _scrollViewSystemContentInset](self, "_scrollViewSystemContentInset");
      -[WKWebView _effectiveObscuredInsetEdgesAffectedBySafeArea](self, "_effectiveObscuredInsetEdgesAffectedBySafeArea");
      UIEdgeInsetsAdd();
      top = v11;
      left = v12;
      bottom = v13;
      right = v14;
    }
  }
  v15 = top;
  v16 = left;
  v17 = bottom;
  v18 = right;
  result.right = v18;
  result.bottom = v17;
  result.left = v16;
  result.top = v15;
  return result;
}

- (void)_clearSafeBrowsingWarningIfForMainFrameNavigation
{
  if (objc_msgSend(self->_safeBrowsingWarning.m_ptr, "forMainFrameNavigation"))
    -[WKWebView _clearSafeBrowsingWarning](self, "_clearSafeBrowsingWarning");
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
  if ((v3 & 1) == 0 && (+[WKWebView accessInstanceVariablesDirectly]::didLogFault & 1) == 0)
  {
    +[WKWebView accessInstanceVariablesDirectly]::didLogFault = 1;
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

- (WKWebView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  WKWebViewConfiguration *v8;
  WKWebView *v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = objc_alloc_init(WKWebViewConfiguration);
  v9 = -[WKWebView initWithFrame:configuration:](self, "initWithFrame:configuration:", v8, x, y, width, height);
  if (v8)
    CFRelease(v8);
  return v9;
}

- (WKWebView)initWithCoder:(NSCoder *)coder
{
  WKWebView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WKWebView;
  v4 = -[WKWebView initWithCoder:](&v6, sel_initWithCoder_);
  if (v4)
  {
    -[WKWebView _initializeWithConfiguration:](v4, "_initializeWithConfiguration:", -[NSCoder decodeObjectOfClass:forKey:](coder, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("configuration")));
    -[WKWebView setAllowsBackForwardNavigationGestures:](v4, "setAllowsBackForwardNavigationGestures:", -[NSCoder decodeBoolForKey:](coder, "decodeBoolForKey:", CFSTR("allowsBackForwardNavigationGestures")));
    -[WKWebView setCustomUserAgent:](v4, "setCustomUserAgent:", -[NSCoder decodeObjectOfClass:forKey:](coder, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("customUserAgent")));
    -[WKWebView setAllowsLinkPreview:](v4, "setAllowsLinkPreview:", -[NSCoder decodeBoolForKey:](coder, "decodeBoolForKey:", CFSTR("allowsLinkPreview")));
    -[WKWebView setFindInteractionEnabled:](v4, "setFindInteractionEnabled:", -[NSCoder decodeBoolForKey:](coder, "decodeBoolForKey:", CFSTR("findInteractionEnabled")));
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WKWebView;
  -[WKWebView encodeWithCoder:](&v5, sel_encodeWithCoder_);
  objc_msgSend(a3, "encodeObject:forKey:", self->_configuration.m_ptr, CFSTR("configuration"));
  objc_msgSend(a3, "encodeBool:forKey:", -[WKWebView allowsBackForwardNavigationGestures](self, "allowsBackForwardNavigationGestures"), CFSTR("allowsBackForwardNavigationGestures"));
  objc_msgSend(a3, "encodeObject:forKey:", -[WKWebView customUserAgent](self, "customUserAgent"), CFSTR("customUserAgent"));
  objc_msgSend(a3, "encodeBool:forKey:", -[WKWebView allowsLinkPreview](self, "allowsLinkPreview"), CFSTR("allowsLinkPreview"));
  objc_msgSend(a3, "encodeBool:forKey:", -[WKWebView isFindInteractionEnabled](self, "isFindInteractionEnabled"), CFSTR("findInteractionEnabled"));
}

- (id)valueForUndefinedKey:(id)a3
{
  objc_super v6;

  if (objc_msgSend(a3, "isEqualToString:", CFSTR("serverTrust")))
    return -[WKWebView serverTrust](self, "serverTrust");
  v6.receiver = self;
  v6.super_class = (Class)WKWebView;
  return -[WKWebView valueForUndefinedKey:](&v6, sel_valueForUndefinedKey_, a3);
}

- (WKBackForwardList)backForwardList
{
  _BOOL4 didAccessBackForwardList;

  if (self)
  {
    didAccessBackForwardList = self->_didAccessBackForwardList;
    self->_didAccessBackForwardList = 1;
    if (!didAccessBackForwardList)
      -[WKWebView _updatePageLoadObserverState]((uint64_t)self);
  }
  return *(WKBackForwardList **)(*((_QWORD *)self->_page.m_ptr + 74) + 8);
}

- (id)navigationDelegate
{
  CFTypeRef cf;

  WebKit::NavigationState::navigationDelegate((id *)self->_navigationState.__ptr_.__value_, &cf);
  return (id)(id)CFMakeCollectable(cf);
}

- (id)UIDelegate
{
  CFTypeRef cf;

  WebKit::DiagnosticLoggingClient::delegate((id *)self->_uiDelegate.__ptr_.__value_, &cf);
  return (id)(id)CFMakeCollectable(cf);
}

- (_WKIconLoadingDelegate)_iconLoadingDelegate
{
  CFTypeRef cf;

  WebKit::IconLoadingDelegate::delegate((id *)self->_iconLoadingDelegate.__ptr_.__value_, &cf);
  return (_WKIconLoadingDelegate *)(id)CFMakeCollectable(cf);
}

- (_WKResourceLoadDelegate)_resourceLoadDelegate
{
  CFTypeRef cf;

  WebKit::IconLoadingDelegate::delegate((id *)self->_resourceLoadDelegate.__ptr_.__value_, &cf);
  return (_WKResourceLoadDelegate *)(id)CFMakeCollectable(cf);
}

- (void)_setResourceLoadDelegate:(id)a3
{
  WebPageProxy *m_ptr;
  ResourceLoadDelegate *value;
  _QWORD *v7;
  _QWORD *v8;

  m_ptr = self->_page.m_ptr;
  if (a3)
  {
    value = self->_resourceLoadDelegate.__ptr_.__value_;
    v7 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
    *v7 = off_1E34C9140;
    v7[1] = value;
    v8 = v7;
    WebKit::WebPageProxy::setResourceLoadClient(m_ptr, (uint64_t *)&v8);
    if (v8)
      (*(void (**)(_QWORD *))(*v8 + 8))(v8);
    WebKit::ResourceLoadDelegate::setDelegate((uint64_t)self->_resourceLoadDelegate.__ptr_.__value_, a3);
  }
  else
  {
    v8 = 0;
    WebKit::WebPageProxy::setResourceLoadClient(m_ptr, (uint64_t *)&v8);
    if (v8)
      (*(void (**)(_QWORD *))(*v8 + 8))(v8);
    WebKit::ResourceLoadDelegate::setDelegate((uint64_t)self->_resourceLoadDelegate.__ptr_.__value_, 0);
  }
}

- (WKNavigation)loadFileURL:(NSURL *)URL allowingReadAccessToURL:(NSURL *)readAccessURL
{
  WebPageProxy *m_ptr;
  WebPageProxy *v8;
  uint64_t v9;
  const void *v10;
  const void *v11;
  WTF::StringImpl *v12;
  WKNavigation *v13;
  uint64_t v14;
  WTF::StringImpl *v15;
  WTF::StringImpl *v16;
  WTF::StringImpl *v18;
  WTF::StringImpl *v19;
  uint64_t v20;

  m_ptr = self->_page.m_ptr;
  if (*((_BYTE *)m_ptr + 1290))
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("The WKWebView is suspended"));
    m_ptr = self->_page.m_ptr;
  }
  if (*((_BYTE *)m_ptr + 1118))
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("The WKWebView was used to load a service worker"));
  if (!-[NSURL isFileURL](URL, "isFileURL"))
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%@ is not a file URL"), URL);
  if (!-[NSURL isFileURL](readAccessURL, "isFileURL"))
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%@ is not a file URL"), readAccessURL);
  v8 = self->_page.m_ptr;
  MEMORY[0x19AEABCC8](&v19, -[NSURL absoluteString](-[NSURL filePathURL](URL, "filePathURL"), "absoluteString"));
  MEMORY[0x19AEABCC8](&v18, -[NSURL absoluteString](readAccessURL, "absoluteString"));
  WebKit::WebPageProxy::loadFile((WebKit::WebPageProxy *)v8, &v19, &v18, 0, 1, &v20);
  v9 = v20;
  if (v20)
  {
    v20 = 0;
    v10 = *(const void **)(v9 + 8);
    if (v10)
    {
      CFRetain(*(CFTypeRef *)(v9 + 8));
      v11 = *(const void **)(v9 + 8);
    }
    else
    {
      v11 = 0;
    }
    CFRelease(v11);
  }
  else
  {
    v10 = 0;
  }
  v13 = (id)CFMakeCollectable(v10);
  v14 = v20;
  v20 = 0;
  if (v14)
    CFRelease(*(CFTypeRef *)(v14 + 8));
  v15 = v18;
  v18 = 0;
  if (v15)
  {
    if (*(_DWORD *)v15 == 2)
      WTF::StringImpl::destroy(v15, v12);
    else
      *(_DWORD *)v15 -= 2;
  }
  v16 = v19;
  v19 = 0;
  if (v16)
  {
    if (*(_DWORD *)v16 == 2)
      WTF::StringImpl::destroy(v16, v12);
    else
      *(_DWORD *)v16 -= 2;
  }
  return v13;
}

- (WKNavigation)loadHTMLString:(NSString *)string baseURL:(NSURL *)baseURL
{
  WebPageProxy *m_ptr;

  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((_BYTE *)m_ptr + 1290))
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("The WKWebView is suspended"));
  return -[WKWebView loadData:MIMEType:characterEncodingName:baseURL:](self, "loadData:MIMEType:characterEncodingName:baseURL:", -[NSString dataUsingEncoding:](string, "dataUsingEncoding:", 4), CFSTR("text/html"), CFSTR("UTF-8"), baseURL);
}

- (WKNavigation)loadData:(NSData *)data MIMEType:(NSString *)MIMEType characterEncodingName:(NSString *)characterEncodingName baseURL:(NSURL *)baseURL
{
  WebPageProxy *m_ptr;
  const void *v12;
  uint64_t v13;
  const void *v14;
  const void *v15;
  WTF::StringImpl *v16;
  WKNavigation *v17;
  WTF::StringImpl *v18;
  WTF::StringImpl *v19;
  WTF::StringImpl *v20;
  WTF::StringImpl *v22;
  WTF::StringImpl *v23;
  WTF::StringImpl *v24;
  uint64_t v25;

  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((_BYTE *)m_ptr + 1290))
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("The WKWebView is suspended"));
    m_ptr = self->_page.m_ptr;
  }
  if (*((_BYTE *)m_ptr + 1118))
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("The WKWebView was used to load a service worker"));
    m_ptr = self->_page.m_ptr;
  }
  if (data)
  {
    v12 = -[NSData bytes](data, "bytes");
    data = -[NSData length](data, "length");
  }
  else
  {
    v12 = 0;
  }
  MEMORY[0x19AEABCC8](&v24, MIMEType);
  MEMORY[0x19AEABCC8](&v23, characterEncodingName);
  MEMORY[0x19AEABCC8](&v22, -[NSURL absoluteString](baseURL, "absoluteString"));
  WebKit::WebPageProxy::loadData((uint64_t)m_ptr, (uint64_t)v12, (unint64_t)data, (WTF::StringImpl *)&v24, (WTF::StringImpl *)&v23, (WTF::StringImpl *)&v22, 0, 0, &v25);
  v13 = v25;
  if (v25)
  {
    v14 = *(const void **)(v25 + 8);
    if (v14)
    {
      CFRetain(*(CFTypeRef *)(v25 + 8));
      v15 = *(const void **)(v13 + 8);
    }
    else
    {
      v15 = 0;
    }
    CFRelease(v15);
  }
  else
  {
    v14 = 0;
  }
  v17 = (id)CFMakeCollectable(v14);
  v18 = v22;
  v22 = 0;
  if (v18)
  {
    if (*(_DWORD *)v18 == 2)
      WTF::StringImpl::destroy(v18, v16);
    else
      *(_DWORD *)v18 -= 2;
  }
  v19 = v23;
  v23 = 0;
  if (v19)
  {
    if (*(_DWORD *)v19 == 2)
      WTF::StringImpl::destroy(v19, v16);
    else
      *(_DWORD *)v19 -= 2;
  }
  v20 = v24;
  v24 = 0;
  if (v20)
  {
    if (*(_DWORD *)v20 == 2)
      WTF::StringImpl::destroy(v20, v16);
    else
      *(_DWORD *)v20 -= 2;
  }
  return v17;
}

- (void)startDownloadUsingRequest:(NSURLRequest *)request completionHandler:(void *)completionHandler
{
  WebPageProxy *m_ptr;
  void *v7;
  _QWORD *v8;
  CFTypeRef v9;
  _QWORD *v11;
  _BYTE v12[192];
  CFTypeRef cf;

  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((_BYTE *)m_ptr + 1290))
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("The WKWebView is suspended"));
    m_ptr = self->_page.m_ptr;
  }
  MEMORY[0x19AEAEC20](v12, request);
  v7 = _Block_copy(completionHandler);
  v8 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
  *v8 = off_1E34BCF98;
  v8[1] = v7;
  v11 = v8;
  WebKit::WebPageProxy::downloadRequest((WebKit::WebPageProxy *)m_ptr, (const WebCore::ResourceRequest *)v12, (uint64_t *)&v11);
  if (v11)
    (*(void (**)(_QWORD *))(*v11 + 8))(v11);
  _Block_release(0);
  v9 = cf;
  cf = 0;
  if (v9)
    CFRelease(v9);
  WebCore::ResourceRequestBase::~ResourceRequestBase((WebCore::ResourceRequestBase *)v12);
}

- (void)resumeDownloadFromResumeData:(NSData *)resumeData completionHandler:(void *)completionHandler
{
  WebPageProxy *m_ptr;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  WebPageProxy *v17;
  WebKit *v18;
  void *v19;
  _QWORD *v20;
  WTF::StringImpl *v21;
  WTF::StringImpl *v22;
  WebKit *v23;
  _QWORD *v25;
  WTF::StringImpl *v26;
  CFTypeRef cf;
  WebKit *v28;

  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((_BYTE *)m_ptr + 1290))
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("The WKWebView is suspended"));
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", resumeData, 0);
  objc_msgSend(v7, "setDecodingFailurePolicy:", 0);
  v8 = (void *)MEMORY[0x1E0C99E60];
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  v12 = objc_opt_class();
  v13 = objc_opt_class();
  v14 = objc_opt_class();
  v15 = (void *)objc_msgSend(v7, "decodeObjectOfClasses:forKey:", objc_msgSend(v8, "setWithObjects:", v9, v10, v11, v12, v13, v14, objc_opt_class(), 0), CFSTR("NSKeyedArchiveRootObjectKey"));
  objc_msgSend(v7, "finishDecoding");
  v16 = objc_msgSend(v15, "objectForKey:", CFSTR("NSURLSessionResumeInfoLocalPath"));
  if (!v16)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Invalid resume data"));
  v17 = self->_page.m_ptr;
  cf = resumeData;
  if (resumeData)
    CFRetain(resumeData);
  API::Data::createWithoutCopying((id *)&cf, &v28);
  v18 = v28;
  MEMORY[0x19AEABCC8](&v26, v16);
  v19 = _Block_copy(completionHandler);
  v20 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
  *v20 = off_1E34BCFC0;
  v20[1] = v19;
  v25 = v20;
  WebKit::WebPageProxy::resumeDownload((uint64_t)v17, (uint64_t)v18, (WTF::StringImpl *)&v26, (uint64_t *)&v25);
  if (v25)
    (*(void (**)(_QWORD *))(*v25 + 8))(v25);
  _Block_release(0);
  v22 = v26;
  v26 = 0;
  if (v22)
  {
    if (*(_DWORD *)v22 == 2)
      WTF::StringImpl::destroy(v22, v21);
    else
      *(_DWORD *)v22 -= 2;
  }
  v23 = v28;
  v28 = 0;
  if (v23)
    CFRelease(*((CFTypeRef *)v23 + 1));
  if (cf)
    CFRelease(cf);
  if (v7)
    CFRelease(v7);
}

- (WKNavigation)goToBackForwardListItem:(WKBackForwardListItem *)item
{
  WebPageProxy *m_ptr;
  uint64_t v5;
  const void *v6;
  const void *v7;
  uint64_t v10;

  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((_BYTE *)m_ptr + 1290))
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("The WKWebView is suspended"));
    m_ptr = self->_page.m_ptr;
  }
  WebKit::WebPageProxy::goToBackForwardItem((uint64_t)m_ptr, (uint64_t)-[WKBackForwardListItem _item](item, "_item"), 3u, &v10);
  v5 = v10;
  if (v10)
  {
    v6 = *(const void **)(v10 + 8);
    if (v6)
    {
      CFRetain(*(CFTypeRef *)(v10 + 8));
      v7 = *(const void **)(v5 + 8);
    }
    else
    {
      v7 = 0;
    }
    CFRelease(v7);
  }
  else
  {
    v6 = 0;
  }
  return (WKNavigation *)(id)CFMakeCollectable(v6);
}

- (NSURL)_resourceDirectoryURL
{
  WTF::StringImpl *v2;
  NSURL *v3;
  WTF::StringImpl *v4;
  WTF::StringImpl *v6;

  WebKit::WebPageProxy::currentResourceDirectoryURL((WebKit::WebPageProxy *)self->_page.m_ptr, (uint64_t)&v6);
  v3 = (NSURL *)WTF::URL::operator NSURL *();
  v4 = v6;
  v6 = 0;
  if (v4)
  {
    if (*(_DWORD *)v4 == 2)
      WTF::StringImpl::destroy(v4, v2);
    else
      *(_DWORD *)v4 -= 2;
  }
  return v3;
}

- (double)estimatedProgress
{
  uint64_t v2;
  double result;

  v2 = *((_QWORD *)self->_page.m_ptr + 4);
  result = *(double *)(v2 + 1112);
  if (*(_QWORD *)(v2 + 984))
    return 0.1;
  return result;
}

- (BOOL)hasOnlySecureContent
{
  return WebKit::PageLoadState::hasOnlySecureContent((WebKit::PageLoadState *)(*((_QWORD *)self->_page.m_ptr + 4) + 968), (const Data *)a2);
}

- (SecTrustRef)serverTrust
{
  return *(SecTrustRef *)(*((_QWORD *)self->_page.m_ptr + 4) + 1128);
}

- (WKNavigation)goBack
{
  WebPageProxy *m_ptr;
  _BOOL4 didAccessBackForwardList;
  uint64_t v6;
  const void *v7;
  const void *v8;
  WKNavigation *v9;
  uint64_t v10;
  uint64_t v11;

  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((_BYTE *)m_ptr + 1290))
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("The WKWebView is suspended"));
  didAccessBackForwardList = self->_didAccessBackForwardList;
  self->_didAccessBackForwardList = 1;
  if (!didAccessBackForwardList)
    -[WKWebView _updatePageLoadObserverState]((uint64_t)self);
  if (-[WKWebView _safeBrowsingWarning](self, "_safeBrowsingWarning"))
    return -[WKWebView reload](self, "reload");
  WebKit::WebPageProxy::goBack((WebKit::WebPageProxy *)self->_page.m_ptr, &v11);
  v6 = v11;
  if (v11)
  {
    v11 = 0;
    v7 = *(const void **)(v6 + 8);
    if (v7)
    {
      CFRetain(*(CFTypeRef *)(v6 + 8));
      v8 = *(const void **)(v6 + 8);
    }
    else
    {
      v8 = 0;
    }
    CFRelease(v8);
  }
  else
  {
    v7 = 0;
  }
  v9 = (id)CFMakeCollectable(v7);
  v10 = v11;
  v11 = 0;
  if (v10)
    CFRelease(*(CFTypeRef *)(v10 + 8));
  return v9;
}

- (WKNavigation)goForward
{
  WebPageProxy *m_ptr;
  _BOOL4 didAccessBackForwardList;
  uint64_t v5;
  const void *v6;
  const void *v7;
  WKNavigation *v8;
  uint64_t v9;
  uint64_t v11;

  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((_BYTE *)m_ptr + 1290))
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("The WKWebView is suspended"));
  didAccessBackForwardList = self->_didAccessBackForwardList;
  self->_didAccessBackForwardList = 1;
  if (!didAccessBackForwardList)
    -[WKWebView _updatePageLoadObserverState]((uint64_t)self);
  WebKit::WebPageProxy::goForward((WebKit::WebPageProxy *)self->_page.m_ptr, &v11);
  v5 = v11;
  if (v11)
  {
    v11 = 0;
    v6 = *(const void **)(v5 + 8);
    if (v6)
    {
      CFRetain(*(CFTypeRef *)(v5 + 8));
      v7 = *(const void **)(v5 + 8);
    }
    else
    {
      v7 = 0;
    }
    CFRelease(v7);
  }
  else
  {
    v6 = 0;
  }
  v8 = (id)CFMakeCollectable(v6);
  v9 = v11;
  v11 = 0;
  if (v9)
    CFRelease(*(CFTypeRef *)(v9 + 8));
  return v8;
}

- (WKNavigation)reload
{
  WebPageProxy *m_ptr;
  char v4;
  uint64_t v5;
  const void *v6;
  const void *v7;
  WKNavigation *v8;
  uint64_t v9;
  uint64_t v11;

  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((_BYTE *)m_ptr + 1290))
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("The WKWebView is suspended"));
  v4 = WTF::linkedOnOrAfterSDKWithBehavior();
  WebKit::WebPageProxy::reload((uint64_t)self->_page.m_ptr, v4, &v11);
  v5 = v11;
  if (v11)
  {
    v11 = 0;
    v6 = *(const void **)(v5 + 8);
    if (v6)
    {
      CFRetain(*(CFTypeRef *)(v5 + 8));
      v7 = *(const void **)(v5 + 8);
    }
    else
    {
      v7 = 0;
    }
    CFRelease(v7);
  }
  else
  {
    v6 = 0;
  }
  v8 = (id)CFMakeCollectable(v6);
  v9 = v11;
  v11 = 0;
  if (v9)
    CFRelease(*(CFTypeRef *)(v9 + 8));
  return v8;
}

- (WKNavigation)reloadFromOrigin
{
  WebPageProxy *m_ptr;
  uint64_t v4;
  const void *v5;
  const void *v6;
  WKNavigation *v7;
  uint64_t v8;
  uint64_t v10;

  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((_BYTE *)m_ptr + 1290))
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("The WKWebView is suspended"));
    m_ptr = self->_page.m_ptr;
  }
  WebKit::WebPageProxy::reload((uint64_t)m_ptr, 2, &v10);
  v4 = v10;
  if (v10)
  {
    v10 = 0;
    v5 = *(const void **)(v4 + 8);
    if (v5)
    {
      CFRetain(*(CFTypeRef *)(v4 + 8));
      v6 = *(const void **)(v4 + 8);
    }
    else
    {
      v6 = 0;
    }
    CFRelease(v6);
  }
  else
  {
    v5 = 0;
  }
  v7 = (id)CFMakeCollectable(v5);
  v8 = v10;
  v10 = 0;
  if (v8)
    CFRelease(*(CFTypeRef *)(v8 + 8));
  return v7;
}

- (void)stopLoading
{
  WebPageProxy *m_ptr;

  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((_BYTE *)m_ptr + 1290))
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("The WKWebView is suspended"));
    m_ptr = self->_page.m_ptr;
  }
  WebKit::WebPageProxy::stopLoading((WebKit::WebPageProxy *)m_ptr);
}

- (void)evaluateJavaScript:(NSString *)javaScriptString inFrame:(WKFrameInfo *)frame inContentWorld:(WKContentWorld *)contentWorld completionHandler:(void *)completionHandler
{
  WebPageProxy *m_ptr;

  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((_BYTE *)m_ptr + 1290))
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("The WKWebView is suspended"));
  -[WKWebView _evaluateJavaScript:asAsyncFunction:withSourceURL:withArguments:forceUserGesture:inFrame:inWorld:completionHandler:](self, "_evaluateJavaScript:asAsyncFunction:withSourceURL:withArguments:forceUserGesture:inFrame:inWorld:completionHandler:", javaScriptString, 0, 0, 0, 1, frame, contentWorld, completionHandler);
}

- (void)callAsyncJavaScript:(NSString *)functionBody arguments:(NSDictionary *)arguments inFrame:(WKFrameInfo *)frame inContentWorld:(WKContentWorld *)contentWorld completionHandler:(void *)completionHandler
{
  WebPageProxy *m_ptr;

  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((_BYTE *)m_ptr + 1290))
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("The WKWebView is suspended"));
  -[WKWebView _evaluateJavaScript:asAsyncFunction:withSourceURL:withArguments:forceUserGesture:inFrame:inWorld:completionHandler:](self, "_evaluateJavaScript:asAsyncFunction:withSourceURL:withArguments:forceUserGesture:inFrame:inWorld:completionHandler:", functionBody, 1, 0, arguments, 1, frame, contentWorld, completionHandler);
}

- (void)closeAllMediaPresentations
{
  -[WKWebView closeAllMediaPresentationsWithCompletionHandler:](self, "closeAllMediaPresentationsWithCompletionHandler:", &__block_literal_global_494);
}

- (void)closeAllMediaPresentationsWithCompletionHandler:(void *)completionHandler
{
  WebPageProxy *m_ptr;
  _QWORD *v6;
  uint64_t v7;
  unsigned int *v8;
  WebPageProxy *v9;
  _QWORD *v10;
  unsigned int v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;
  unsigned int v15;
  _QWORD *v16;
  _QWORD *v17;
  unsigned int v18;
  unsigned int v19;
  _QWORD *v20;
  unsigned int *v21;

  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((_BYTE *)m_ptr + 1290))
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("The WKWebView is suspended"));
  v6 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
  *v6 = off_1E34BDB18;
  v6[1] = completionHandler;
  v7 = WTF::fastMalloc((WTF *)0x10);
  v8 = (unsigned int *)v7;
  *(_DWORD *)v7 = 1;
  *(_QWORD *)(v7 + 8) = v6;
  v9 = self->_page.m_ptr;
  v10 = (_QWORD *)*((_QWORD *)v9 + 48);
  if (v10)
  {
    do
      v11 = __ldaxr((unsigned int *)v7);
    while (__stlxr(v11 + 1, (unsigned int *)v7));
    v12 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
    *v12 = off_1E34BCFE8;
    v12[1] = v8;
    v20 = v12;
    WebKit::VideoPresentationManagerProxy::forEachSession(v10, &v20);
    v13 = v20;
    v20 = 0;
    if (v13)
      (*(void (**)(_QWORD *))(*v13 + 8))(v13);
    v9 = self->_page.m_ptr;
  }
  v14 = *((_QWORD *)v9 + 45);
  if (v14 && (*(unsigned int (**)(_QWORD))(**(_QWORD **)(v14 + 32) + 24))(*(_QWORD *)(v14 + 32)))
  {
    do
      v15 = __ldaxr(v8);
    while (__stlxr(v15 + 1, v8));
    v16 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
    *v16 = off_1E34BD038;
    v16[1] = v8;
    v20 = v16;
    WebKit::WebFullScreenManagerProxy::closeWithCallback(v14, (unint64_t)&v20);
    v17 = v20;
    v20 = 0;
    if (v17)
      (*(void (**)(_QWORD *))(*v17 + 8))(v17);
  }
  do
  {
    v18 = __ldaxr(v8);
    v19 = v18 - 1;
  }
  while (__stlxr(v19, v8));
  if (!v19)
  {
    atomic_store(1u, v8);
    v21 = v8;
    WTF::ThreadSafeRefCounted<WTF::CallbackAggregatorOnThread<(WTF::DestructionThread)0>,(WTF::DestructionThread)0>::deref(void)const::{lambda(void)#1}::operator()((uint64_t *)&v21);
  }
}

- (void)pauseAllMediaPlaybackWithCompletionHandler:(void *)completionHandler
{
  WebPageProxy *m_ptr;
  void *v5;
  _QWORD *v6;
  uint64_t v7;
  _QWORD *v9;
  uint64_t v10;
  _QWORD *v11;

  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((_BYTE *)m_ptr + 1290))
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("The WKWebView is suspended"));
    m_ptr = self->_page.m_ptr;
    if (completionHandler)
      goto LABEL_4;
  }
  else if (completionHandler)
  {
LABEL_4:
    v5 = _Block_copy(completionHandler);
    v6 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
    *v6 = off_1E34BDAC8;
    v6[1] = v5;
    v11 = v6;
    WebKit::WebPageProxy::pauseAllMediaPlayback((uint64_t)m_ptr, (uint64_t *)&v11);
    v7 = (uint64_t)v11;
    v11 = 0;
    if (v7)
      (*(void (**)(uint64_t))(*(_QWORD *)v7 + 8))(v7);
    _Block_release(0);
    return;
  }
  v9 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
  *v9 = off_1E34BD060;
  v11 = v9;
  WebKit::WebPageProxy::pauseAllMediaPlayback((uint64_t)m_ptr, (uint64_t *)&v11);
  v10 = (uint64_t)v11;
  v11 = 0;
  if (v10)
    (*(void (**)(uint64_t))(*(_QWORD *)v10 + 8))(v10);
}

- (void)resumeAllMediaPlayback:(void *)completionHandler
{
  -[WKWebView setAllMediaPlaybackSuspended:completionHandler:](self, "setAllMediaPlaybackSuspended:completionHandler:", 0, completionHandler);
}

- (void)suspendAllMediaPlayback:(void *)completionHandler
{
  -[WKWebView setAllMediaPlaybackSuspended:completionHandler:](self, "setAllMediaPlaybackSuspended:completionHandler:", 1, completionHandler);
}

- (void)setAllMediaPlaybackSuspended:(BOOL)suspended completionHandler:(void *)completionHandler
{
  _QWORD *v4;
  _BOOL4 v5;
  WebPageProxy *m_ptr;
  WebPageProxy *v8;
  void *v9;
  _QWORD *v10;
  void *v11;
  _QWORD *v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD v15[5];

  v4 = completionHandler;
  v5 = suspended;
  m_ptr = self->_page.m_ptr;
  if (!m_ptr || !*((_BYTE *)m_ptr + 1290))
  {
    if (completionHandler)
      goto LABEL_5;
    goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("The WKWebView is suspended"));
  if (!v4)
  {
LABEL_4:
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3321888768;
    v15[2] = __60__WKWebView_setAllMediaPlaybackSuspended_completionHandler___block_invoke;
    v15[3] = &__block_descriptor_33_e8_32c74_ZTSKZ60__WKWebView_setAllMediaPlaybackSuspended_completionHandler__E4__17_e5_v8__0l;
    v4 = v15;
  }
LABEL_5:
  v8 = self->_page.m_ptr;
  if (v5)
  {
    v9 = _Block_copy(v4);
    v10 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
    *v10 = off_1E34BDAC8;
    v10[1] = v9;
    v14 = v10;
    WebKit::WebPageProxy::suspendAllMediaPlayback((uint64_t)v8, (uint64_t *)&v14);
  }
  else
  {
    v11 = _Block_copy(v4);
    v12 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
    *v12 = off_1E34BDAC8;
    v12[1] = v11;
    v14 = v12;
    WebKit::WebPageProxy::resumeAllMediaPlayback((uint64_t)v8, (uint64_t *)&v14);
  }
  v13 = (uint64_t)v14;
  v14 = 0;
  if (v13)
    (*(void (**)(uint64_t))(*(_QWORD *)v13 + 8))(v13);
  _Block_release(0);
}

- (void)requestMediaPlaybackStateWithCompletionHandler:(void *)completionHandler
{
  WebPageProxy *m_ptr;
  WebPageProxy *v6;
  void *v7;
  _QWORD *v8;
  uint64_t v9;
  _QWORD *v10;

  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((_BYTE *)m_ptr + 1290))
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("The WKWebView is suspended"));
    if (!completionHandler)
      return;
  }
  else if (!completionHandler)
  {
    return;
  }
  v6 = self->_page.m_ptr;
  v7 = _Block_copy(completionHandler);
  v8 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
  *v8 = off_1E34BD088;
  v8[1] = v7;
  v10 = v8;
  WebKit::WebPageProxy::requestMediaPlaybackState((uint64_t)v6, (uint64_t *)&v10);
  v9 = (uint64_t)v10;
  v10 = 0;
  if (v9)
    (*(void (**)(uint64_t))(*(_QWORD *)v9 + 8))(v9);
  _Block_release(0);
}

- (WKMediaCaptureState)cameraCaptureState
{
  unsigned int v2;

  v2 = *(_DWORD *)(*((_QWORD *)self->_page.m_ptr + 4) + 1672);
  if ((v2 & 0x1000) != 0)
    return 1;
  else
    return (unint64_t)((v2 >> 13) & 2);
}

- (WKMediaCaptureState)microphoneCaptureState
{
  unsigned int v2;

  v2 = *(_DWORD *)(*((_QWORD *)self->_page.m_ptr + 4) + 1672);
  if ((v2 & 0x800) != 0)
    return 1;
  else
    return (unint64_t)((v2 >> 12) & 2);
}

- (void)setMicrophoneCaptureState:(WKMediaCaptureState)state completionHandler:(void *)completionHandler
{
  _QWORD *v4;
  WebPageProxy *m_ptr;
  WebPageProxy *v8;
  unsigned __int8 v9;
  unsigned __int8 v10;
  unsigned __int8 v11;
  void *v12;
  _QWORD *v13;
  void *v14;
  _QWORD *v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD v18[5];

  v4 = completionHandler;
  m_ptr = self->_page.m_ptr;
  if (!m_ptr || !*((_BYTE *)m_ptr + 1290))
  {
    if (completionHandler)
      goto LABEL_5;
    goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("The WKWebView is suspended"));
  if (!v4)
  {
LABEL_4:
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3321888768;
    v18[2] = __57__WKWebView_setMicrophoneCaptureState_completionHandler___block_invoke;
    v18[3] = &__block_descriptor_33_e8_32c71_ZTSKZ57__WKWebView_setMicrophoneCaptureState_completionHandler__E4__19_e5_v8__0l;
    v4 = v18;
  }
LABEL_5:
  v8 = self->_page.m_ptr;
  if (state)
  {
    v9 = *(_BYTE *)(*((_QWORD *)v8 + 4) + 872);
    v10 = v9 | 2;
    if (state == WKMediaCaptureStateActive)
      v9 &= ~2u;
    if (state == WKMediaCaptureStateMuted)
      v11 = v10;
    else
      v11 = v9;
    v12 = _Block_copy(v4);
    v13 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
    *v13 = off_1E34BD0D8;
    v13[1] = v12;
    v17 = v13;
    WebKit::WebPageProxy::setMuted((uint64_t)v8, v11, (uint64_t *)&v17);
  }
  else
  {
    v14 = _Block_copy(v4);
    v15 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
    *v15 = off_1E34BD0B0;
    v15[1] = v14;
    v17 = v15;
    WebKit::WebPageProxy::stopMediaCapture((uint64_t)v8, 0, (uint64_t *)&v17);
  }
  v16 = (uint64_t)v17;
  v17 = 0;
  if (v16)
    (*(void (**)(uint64_t))(*(_QWORD *)v16 + 8))(v16);
  _Block_release(0);
}

- (void)setCameraCaptureState:(WKMediaCaptureState)state completionHandler:(void *)completionHandler
{
  _QWORD *v4;
  WebPageProxy *m_ptr;
  WebPageProxy *v8;
  unsigned __int8 v9;
  unsigned __int8 v10;
  unsigned __int8 v11;
  void *v12;
  _QWORD *v13;
  void *v14;
  _QWORD *v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD v18[5];

  v4 = completionHandler;
  m_ptr = self->_page.m_ptr;
  if (!m_ptr || !*((_BYTE *)m_ptr + 1290))
  {
    if (completionHandler)
      goto LABEL_5;
    goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("The WKWebView is suspended"));
  if (!v4)
  {
LABEL_4:
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3321888768;
    v18[2] = __53__WKWebView_setCameraCaptureState_completionHandler___block_invoke;
    v18[3] = &__block_descriptor_33_e8_32c67_ZTSKZ53__WKWebView_setCameraCaptureState_completionHandler__E4__22_e5_v8__0l;
    v4 = v18;
  }
LABEL_5:
  v8 = self->_page.m_ptr;
  if (state)
  {
    v9 = *(_BYTE *)(*((_QWORD *)v8 + 4) + 872);
    v10 = v9 | 4;
    if (state == WKMediaCaptureStateActive)
      v9 &= ~4u;
    if (state == WKMediaCaptureStateMuted)
      v11 = v10;
    else
      v11 = v9;
    v12 = _Block_copy(v4);
    v13 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
    *v13 = off_1E34BD128;
    v13[1] = v12;
    v17 = v13;
    WebKit::WebPageProxy::setMuted((uint64_t)v8, v11, (uint64_t *)&v17);
  }
  else
  {
    v14 = _Block_copy(v4);
    v15 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
    *v15 = off_1E34BD100;
    v15[1] = v14;
    v17 = v15;
    WebKit::WebPageProxy::stopMediaCapture((uint64_t)v8, 1, (uint64_t *)&v17);
  }
  v16 = (uint64_t)v17;
  v17 = 0;
  if (v16)
    (*(void (**)(uint64_t))(*(_QWORD *)v16 + 8))(v16);
  _Block_release(0);
}

- (void)takeSnapshotWithConfiguration:(WKSnapshotConfiguration *)snapshotConfiguration completionHandler:(void *)completionHandler
{
  WebPageProxy *m_ptr;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  _BOOL8 IsEmpty;
  int v25;
  _QWORD *v26;
  CFTypeRef v27;
  double v28;
  double v29;
  double v30;
  WebPageProxy *v31;
  uint64_t v32;
  _BOOL8 v33;
  void *v34;
  double v35;
  WebPageProxy *v36;
  CFTypeRef v37;
  void *v38;
  void *v39;
  WebPageProxy *v40;
  _QWORD *v41;
  CFTypeRef cf[4];
  void *aBlock;
  double v44;
  CGRect v45;
  CGRect v46;

  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((_BYTE *)m_ptr + 1290))
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("The WKWebView is suspended"));
  kdebug_trace();
  if (snapshotConfiguration)
  {
    -[WKSnapshotConfiguration rect](snapshotConfiguration, "rect");
    if (CGRectIsNull(v45))
      -[WKWebView bounds](self, "bounds");
    else
      -[WKSnapshotConfiguration rect](snapshotConfiguration, "rect");
    v13 = v8;
    v15 = v9;
    v17 = v10;
    v19 = v11;
    -[NSNumber doubleValue](-[WKSnapshotConfiguration snapshotWidth](snapshotConfiguration, "snapshotWidth"), "doubleValue");
    if (v22 == 0.0)
      v21 = v17;
    else
      v21 = v22;
  }
  else
  {
    -[WKWebView bounds](self, "bounds");
    v13 = v12;
    v15 = v14;
    v17 = v16;
    v19 = v18;
    -[WKWebView bounds](self, "bounds");
    v21 = v20;
  }
  v23 = _Block_copy(completionHandler);
  v46.origin.x = v13;
  v46.origin.y = v15;
  v46.size.width = v17;
  v46.size.height = v19;
  IsEmpty = CGRectIsEmpty(v46);
  v25 = v21 == 0.0 || IsEmpty;
  if (v25 != 1)
  {
    if (objc_msgSend((id)objc_opt_class(), "web_requiresCustomSnapshotting"))
    {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen"), "scale");
      v29 = v28;
      v30 = 1.0;
    }
    else
    {
      v31 = self->_page.m_ptr;
      v32 = 692;
      if (!*((_BYTE *)v31 + 696))
        v32 = 688;
      v30 = *(float *)((char *)v31 + v32);
      v29 = v30;
    }
    CFRetain(self);
    if (snapshotConfiguration)
      v33 = -[WKSnapshotConfiguration afterScreenUpdates](snapshotConfiguration, "afterScreenUpdates");
    else
      v33 = 0;
    CFRetain(self);
    v34 = _Block_copy(v23);
    v35 = v21 * v30;
    if ((!snapshotConfiguration
       || -[WKSnapshotConfiguration afterScreenUpdates](snapshotConfiguration, "afterScreenUpdates"))
      && (WTF::linkedOnOrAfterSDKWithBehavior() & 1) != 0)
    {
      v36 = self->_page.m_ptr;
      if (!*((_BYTE *)v36 + 729) && *((_BYTE *)v36 + 728) && *((_QWORD *)v36 + 23))
      {
        v39 = _Block_copy(v23);
        v40 = self->_page.m_ptr;
        CFRetain(*((CFTypeRef *)v40 + 1));
        v41 = (_QWORD *)WTF::fastMalloc((WTF *)0x60);
        *v41 = off_1E34BD1C8;
        v41[1] = self;
        *((_BYTE *)v41 + 16) = v33;
        *((double *)v41 + 3) = v13;
        *((double *)v41 + 4) = v15;
        *((double *)v41 + 5) = v17;
        *((double *)v41 + 6) = v19;
        *((double *)v41 + 7) = v35;
        *((double *)v41 + 8) = v29;
        v41[9] = v34;
        v41[10] = v39;
        v41[11] = v40;
        cf[0] = v41;
        WebKit::WebPageProxy::callAfterNextPresentationUpdate((uint64_t)v36, (uint64_t *)cf);
        if (cf[0])
          (*(void (**)(CFTypeRef))(*(_QWORD *)cf[0] + 8))(cf[0]);
        _Block_release(0);
        _Block_release(0);
        _Block_release(0);
        goto LABEL_35;
      }
      kdebug_trace();
      createNSError(WKErrorUnknown, 0, cf);
      (*((void (**)(void *, _QWORD, CFTypeRef))v23 + 2))(v23, 0, cf[0]);
      v37 = cf[0];
      cf[0] = 0;
      if (v37)
        CFRelease(v37);
    }
    else
    {
      cf[0] = (CFTypeRef)MEMORY[0x1E0C809B0];
      cf[1] = (CFTypeRef)3321888768;
      cf[2] = ___ZZ61__WKWebView_takeSnapshotWithConfiguration_completionHandler__ENK4__28clEv_block_invoke;
      cf[3] = &__block_descriptor_48_e8_32c96_ZTSKZZ61__WKWebView_takeSnapshotWithConfiguration_completionHandler__ENK4__28clEvEUlP7CGImageE__e18_v16__0__CGImage__8l;
      v38 = _Block_copy(v34);
      aBlock = _Block_copy(v38);
      v44 = v29;
      -[WKWebView _snapshotRectAfterScreenUpdates:rectInViewCoordinates:intoImageOfWidth:completionHandler:](self, "_snapshotRectAfterScreenUpdates:rectInViewCoordinates:intoImageOfWidth:completionHandler:", v33, cf, v13, v15, v17, v19, v35);
      _Block_release(v38);
      _Block_release(aBlock);
    }
    _Block_release(v34);
    CFRelease(self);
LABEL_35:
    CFRelease(self);
    goto LABEL_36;
  }
  WTF::RunLoop::main((WTF::RunLoop *)IsEmpty);
  v26 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
  *v26 = off_1E34BD1A0;
  v26[1] = v23;
  cf[0] = v26;
  WTF::RunLoop::dispatch();
  v27 = cf[0];
  cf[0] = 0;
  if (v27)
    (*(void (**)(CFTypeRef))(*(_QWORD *)v27 + 8))(v27);
  _Block_release(0);
  v23 = 0;
LABEL_36:
  _Block_release(v23);
}

- (BOOL)allowsBackForwardNavigationGestures
{
  return self->_allowsBackForwardNavigationGestures;
}

- (NSString)customUserAgent
{
  if (*((_QWORD *)self->_page.m_ptr + 41))
    return (NSString *)WTF::StringImpl::operator NSString *();
  else
    return (NSString *)&stru_1E351F1B8;
}

- (void)setCustomUserAgent:(NSString *)customUserAgent
{
  WebPageProxy *m_ptr;
  const WTF::StringImpl *v5;
  WTF::StringImpl *v6;
  WTF::StringImpl *v7;
  WTF::StringImpl *v9;

  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((_BYTE *)m_ptr + 1290))
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("The WKWebView is suspended"));
    m_ptr = self->_page.m_ptr;
  }
  MEMORY[0x19AEABCC8](&v9, customUserAgent);
  WebKit::WebPageProxy::setCustomUserAgent((WTF **)m_ptr, &v9, v5);
  v7 = v9;
  v9 = 0;
  if (v7)
  {
    if (*(_DWORD *)v7 == 2)
      WTF::StringImpl::destroy(v7, v6);
    else
      *(_DWORD *)v7 -= 2;
  }
}

- (void)setPageZoom:(CGFloat)pageZoom
{
  WebPageProxy *m_ptr;

  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((_BYTE *)m_ptr + 1290))
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("The WKWebView is suspended"));
    m_ptr = self->_page.m_ptr;
  }
  WebKit::WebPageProxy::setPageZoomFactor((uint64_t)m_ptr, pageZoom);
}

- (CGFloat)pageZoom
{
  WebPageProxy *m_ptr;
  uint64_t v3;

  m_ptr = self->_page.m_ptr;
  v3 = 648;
  if (!*((_BYTE *)m_ptr + 857))
    v3 = 632;
  return *(double *)((char *)m_ptr + v3);
}

- (void)findString:(NSString *)string withConfiguration:(WKFindConfiguration *)configuration completionHandler:(void *)completionHandler
{
  WebPageProxy *m_ptr;
  WebPageProxy *v10;
  _BOOL4 v11;
  _BOOL4 v12;
  _BOOL4 v13;
  unsigned int v14;
  const WTF::StringImpl *v15;
  void *v16;
  _QWORD *v17;
  uint64_t v18;
  WTF::StringImpl *v19;
  WTF::StringImpl *v20;
  id v21;
  _QWORD *v22;
  WTF::StringImpl *v23;

  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((_BYTE *)m_ptr + 1290))
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("The WKWebView is suspended"));
  if (-[NSString length](string, "length"))
  {
    v10 = self->_page.m_ptr;
    MEMORY[0x19AEABCC8](&v23, string);
    v11 = -[WKFindConfiguration caseSensitive](configuration, "caseSensitive");
    v12 = -[WKFindConfiguration backwards](configuration, "backwards");
    v13 = -[WKFindConfiguration wraps](configuration, "wraps");
    v14 = !v11;
    if (v12)
      v14 = !v11 | 8;
    if (v13)
      v15 = (const WTF::StringImpl *)(v14 | 0x10);
    else
      v15 = (const WTF::StringImpl *)v14;
    v16 = _Block_copy(completionHandler);
    v17 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
    *v17 = off_1E34BD250;
    v17[1] = v16;
    v22 = v17;
    WebKit::WebPageProxy::findString((uint64_t)v10, &v23, v15, 1, (uint64_t *)&v22);
    v18 = (uint64_t)v22;
    v22 = 0;
    if (v18)
      (*(void (**)(uint64_t))(*(_QWORD *)v18 + 8))(v18);
    _Block_release(0);
    v20 = v23;
    v23 = 0;
    if (v20)
    {
      if (*(_DWORD *)v20 == 2)
        WTF::StringImpl::destroy(v20, v19);
      else
        *(_DWORD *)v20 -= 2;
    }
  }
  else
  {
    v21 = -[WKFindResult _initWithMatchFound:]([WKFindResult alloc], "_initWithMatchFound:", 0);
    (*((void (**)(void *, id))completionHandler + 2))(completionHandler, v21);
    if (v21)
      CFRelease(v21);
  }
}

- (void)setMediaType:(NSString *)mediaType
{
  WebPageProxy *m_ptr;
  WTF::StringImpl *v5;
  WTF::StringImpl *v6;
  WTF::StringImpl *v8;

  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((_BYTE *)m_ptr + 1290))
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("The WKWebView is suspended"));
    m_ptr = self->_page.m_ptr;
  }
  MEMORY[0x19AEABCC8](&v8, mediaType);
  WebKit::WebPageProxy::setOverriddenMediaType((WebKit::WebPageProxy *)m_ptr, (const WTF::String *)&v8);
  v6 = v8;
  v8 = 0;
  if (v6)
  {
    if (*(_DWORD *)v6 == 2)
      WTF::StringImpl::destroy(v6, v5);
    else
      *(_DWORD *)v6 -= 2;
  }
}

- (NSString)mediaType
{
  NSString *result;

  result = (NSString *)*((_QWORD *)self->_page.m_ptr + 150);
  if (result)
    return (NSString *)WTF::StringImpl::operator NSString *();
  return result;
}

- (id)interactionState
{
  WebPageProxy *m_ptr;
  WTF::StringImpl *v3;
  CFTypeRef v4;
  WTF::StringImpl *v5;
  uint64_t v6;
  uint64_t v8;
  _BYTE v9[32];
  WTF::StringImpl *v10;
  CFTypeRef v11;

  m_ptr = self->_page.m_ptr;
  v8 = 0;
  WebKit::WebPageProxy::sessionState((uint64_t)m_ptr, &v8, (uint64_t)v9);
  WebKit::encodeSessionState((WebKit *)v9, &v11);
  v4 = (id)CFMakeCollectable(v11);
  v5 = v10;
  v10 = 0;
  if (v5)
  {
    if (*(_DWORD *)v5 == 2)
      WTF::StringImpl::destroy(v5, v3);
    else
      *(_DWORD *)v5 -= 2;
  }
  WTF::Vector<WebKit::BackForwardListItemState,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)v9, v3);
  v6 = v8;
  v8 = 0;
  if (v6)
    (*(void (**)(uint64_t))(*(_QWORD *)v6 + 8))(v6);
  return (id)v4;
}

- (void)setInteractionState:(id)interactionState
{
  WebPageProxy *m_ptr;
  SessionState *v6;
  WTF::StringImpl *v7;
  WebPageProxy *v8;
  StringImpl *v9;
  WTF::StringImpl *v10;
  uint64_t v11;
  StringImpl *v12;
  WTF::StringImpl *v13;
  SessionState v14;
  uint64_t v15;
  NSData v16;
  uint64_t v17;
  __int128 v18;
  WTF::StringImpl *v19;
  __int128 v20;
  __int128 v21;
  BOOL v22;

  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((_BYTE *)m_ptr + 1290))
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("The WKWebView is suspended"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    BYTE4(v18) = 0;
    v16.super.isa = 0;
    v17 = 0;
    LOBYTE(v18) = 0;
    WTF::URL::URL((WTF::URL *)&v19);
    v22 = 1;
    if ((WebKit::decodeSessionState((WebKit *)interactionState, &v16, v6) & 1) != 0)
    {
      v8 = self->_page.m_ptr;
      WTF::Vector<WebKit::BackForwardListItemState,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::Vector((uint64_t)&v14, (uint64_t)&v16);
      *(_OWORD *)&v14.backForwardListState.currentIndex.var0.__null_state_ = v18;
      v9 = (StringImpl *)v19;
      if (v19)
        *(_DWORD *)v19 += 2;
      v14.provisionalURL.m_string.m_impl.m_ptr = v9;
      *(_OWORD *)((char *)&v14.provisionalURL + 8) = v20;
      *(_OWORD *)&v14.provisionalURL.m_hostEnd = v21;
      v14.isAppInitiated = v22;
      WebKit::WebPageProxy::restoreFromSessionState((WebKit::WebPageProxy *)v8, &v14, 1, &v15);
      v11 = v15;
      v15 = 0;
      if (v11)
        CFRelease(*(CFTypeRef *)(v11 + 8));
      v12 = v14.provisionalURL.m_string.m_impl.m_ptr;
      v14.provisionalURL.m_string.m_impl.m_ptr = 0;
      if (v12)
      {
        if (*(_DWORD *)v12 == 2)
          WTF::StringImpl::destroy((WTF::StringImpl *)v12, v10);
        else
          *(_DWORD *)v12 -= 2;
      }
      WTF::Vector<WebKit::BackForwardListItemState,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v14, v10);
    }
    v13 = v19;
    v19 = 0;
    if (v13)
    {
      if (*(_DWORD *)v13 == 2)
        WTF::StringImpl::destroy(v13, v7);
      else
        *(_DWORD *)v13 -= 2;
    }
    WTF::Vector<WebKit::BackForwardListItemState,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v16, v7);
  }
}

- (BOOL)isInspectable
{
  Inspector::RemoteInspectionTarget *v2;

  v2 = (Inspector::RemoteInspectionTarget *)*((_QWORD *)self->_page.m_ptr + 135);
  if (v2)
    LOBYTE(v2) = Inspector::RemoteInspectionTarget::inspectable(v2);
  return (char)v2;
}

- (BOOL)findInteractionEnabled
{
  return self->_findInteractionEnabled;
}

- (void)_showSafeBrowsingWarning:(const void *)a3 completionHandler:(void *)a4
{
  WKSafeBrowsingWarning *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  WKSafeBrowsingWarning *v19;
  void *m_ptr;
  uint64_t v21;
  uint64_t v22;
  id location;
  uint64_t v24;
  uint64_t v25;

  v7 = [WKSafeBrowsingWarning alloc];
  -[WKWebView bounds](self, "bounds");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  location = 0;
  objc_initWeak(&location, self);
  v16 = *(_QWORD *)a4;
  *(_QWORD *)a4 = 0;
  v24 = v16;
  v17 = WTF::fastMalloc((WTF *)0x18);
  *(_QWORD *)v17 = off_1E34BD278;
  *(_QWORD *)(v17 + 8) = 0;
  objc_moveWeak((id *)(v17 + 8), &location);
  v18 = v24;
  v24 = 0;
  v25 = v17;
  *(_QWORD *)(v17 + 16) = v18;
  v19 = -[WKSafeBrowsingWarning initWithFrame:safeBrowsingWarning:completionHandler:](v7, "initWithFrame:safeBrowsingWarning:completionHandler:", a3, &v25, v9, v11, v13, v15);
  m_ptr = self->_safeBrowsingWarning.m_ptr;
  self->_safeBrowsingWarning.m_ptr = v19;
  if (m_ptr)
    CFRelease(m_ptr);
  v21 = v25;
  v25 = 0;
  if (v21)
    (*(void (**)(uint64_t))(*(_QWORD *)v21 + 8))(v21);
  v22 = v24;
  v24 = 0;
  if (v22)
    (*(void (**)(uint64_t))(*(_QWORD *)v22 + 8))(v22);
  objc_destroyWeak(&location);
  -[WKWebView addSubview:](self, "addSubview:", self->_safeBrowsingWarning.m_ptr);
}

- (void)_internalDoAfterNextPresentationUpdate:(id)a3 withoutWaitingForPainting:(BOOL)a4 withoutWaitingForAnimatedResize:(BOOL)a5
{
  _BOOL4 v6;
  WTF::RunLoop *v9;
  void *v10;
  BOOL v11;
  void *v12;
  _QWORD *v13;
  uint64_t v14;
  WebPageProxy *m_ptr;
  void *v16;
  uint64_t v17;
  _QWORD *v18;

  v6 = a4;
  v9 = (WTF::RunLoop *)-[WKWebView usesStandardContentView](self, "usesStandardContentView");
  if ((v9 & 1) != 0)
  {
    if (v6)
    {
      *((_BYTE *)self->_page.m_ptr + 602) = 1;
      v10 = _Block_copy(a3);
      v11 = self == 0;
    }
    else
    {
      v10 = _Block_copy(a3);
      if (!self)
      {
        v11 = 1;
        goto LABEL_10;
      }
      v11 = 0;
    }
    CFRetain(self);
LABEL_10:
    m_ptr = self->_page.m_ptr;
    v16 = _Block_copy(v10);
    if (!v11)
      CFRetain(self);
    v17 = WTF::fastMalloc((WTF *)0x20);
    *(_QWORD *)v17 = off_1E34BD2D8;
    *(_QWORD *)(v17 + 8) = v16;
    *(_BYTE *)(v17 + 16) = a5;
    *(_QWORD *)(v17 + 24) = self;
    v18 = (_QWORD *)v17;
    WebKit::WebPageProxy::callAfterNextPresentationUpdate((uint64_t)m_ptr, (uint64_t *)&v18);
    if (v18)
      (*(void (**)(_QWORD *))(*v18 + 8))(v18);
    _Block_release(0);
    if (!v11)
      CFRelease(self);
    _Block_release(v10);
    return;
  }
  WTF::RunLoop::main(v9);
  v12 = _Block_copy(a3);
  v13 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
  *v13 = off_1E34BD2B0;
  v13[1] = v12;
  v18 = v13;
  WTF::RunLoop::dispatch();
  v14 = (uint64_t)v18;
  v18 = 0;
  if (v14)
    (*(void (**)(uint64_t))(*(_QWORD *)v14 + 8))(v14);
  _Block_release(0);
}

- (void)_doAfterNextVisibleContentRectAndPresentationUpdate:(id)a3
{
  void *v5;
  _QWORD *v6;

  if (self)
    CFRetain(self);
  v5 = _Block_copy(a3);
  v6 = malloc_type_malloc(0x30uLL, 0x10E0040A6CB5C9CuLL);
  *v6 = MEMORY[0x1E0C809A0];
  v6[1] = 50331650;
  v6[2] = WTF::BlockPtr<void ()(void)>::fromCallable<-[WKWebView _doAfterNextVisibleContentRectAndPresentationUpdate:]::$_10>(-[WKWebView _doAfterNextVisibleContentRectAndPresentationUpdate:]::$_10)::{lambda(void *)#1}::__invoke;
  v6[3] = &WTF::BlockPtr<void ()(void)>::fromCallable<-[WKWebView _doAfterNextVisibleContentRectAndPresentationUpdate:]::$_10>(-[WKWebView _doAfterNextVisibleContentRectAndPresentationUpdate:]::$_10)::descriptor;
  v6[4] = self;
  v6[5] = v5;
  _Block_release(0);
  -[WKWebView _doAfterNextVisibleContentRectUpdate:](self, "_doAfterNextVisibleContentRectUpdate:", v6);
  _Block_release(v6);
  _Block_release(0);
}

- (void)_didInsertAttachment:(void *)a3 withSource:(id)a4
{
  id v7;

  v7 = -[WKWebView UIDelegate](self, "UIDelegate");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v7, "_webView:didInsertAttachment:withSource:", self, *((_QWORD *)a3 + 1), a4);
}

- (void)_didRemoveAttachment:(void *)a3
{
  id v5;

  v5 = -[WKWebView UIDelegate](self, "UIDelegate");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "_webView:didRemoveAttachment:", self, *((_QWORD *)a3 + 1));
}

- (void)_didInvalidateDataForAttachment:(void *)a3
{
  id v5;

  v5 = -[WKWebView UIDelegate](self, "UIDelegate");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "_webView:didInvalidateDataForAttachment:", self, *((_QWORD *)a3 + 1));
}

- (_WKAppHighlightDelegate)_appHighlightDelegate
{
  return (_WKAppHighlightDelegate *)objc_loadWeak(&self->_appHighlightDelegate.m_weakReference);
}

- (void)_storeAppHighlight:(const void *)a3
{
  _WKAppHighlightDelegate *v5;
  _WKAppHighlightDelegate *v6;
  const __CFString *v7;
  _WKAppHighlight *v8;
  void *v9;
  _WKAppHighlight *v10;
  WebCore::SharedBuffer *v11;
  CFTypeRef cf;

  v5 = -[WKWebView _appHighlightDelegate](self, "_appHighlightDelegate");
  if (v5)
  {
    v6 = v5;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      if (*((_BYTE *)a3 + 16))
      {
        if (*((_QWORD *)a3 + 1))
          v7 = (const __CFString *)WTF::StringImpl::operator NSString *();
        else
          v7 = &stru_1E351F1B8;
      }
      else
      {
        v7 = 0;
      }
      v8 = [_WKAppHighlight alloc];
      WebCore::FragmentedSharedBuffer::makeContiguous(*(WebCore::FragmentedSharedBuffer **)a3);
      WebCore::SharedBuffer::createNSData(v11);
      v10 = -[_WKAppHighlight initWithHighlight:text:image:](v8, "initWithHighlight:text:image:", cf, v7, 0);
      if (cf)
        CFRelease(cf);
      if (v11)
        WTF::ThreadSafeRefCounted<WebCore::FragmentedSharedBuffer,(WTF::DestructionThread)0>::deref((unsigned int *)v11, v9);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        -[_WKAppHighlightDelegate _webView:storeAppHighlight:inNewGroup:requestOriginatedInApp:](v6, "_webView:storeAppHighlight:inNewGroup:requestOriginatedInApp:", self, v10, *((unsigned __int8 *)a3 + 24), *((unsigned __int8 *)a3 + 25), 0, 0);
      if (v10)
        CFRelease(v10);
    }
  }
}

- (void)_addTextAnimationForAnimationID:(id)a3 withData:(const TextAnimationData *)a4
{
  void *m_ptr;
  int var0;
  uint64_t v6;

  m_ptr = self->_contentView.m_ptr;
  var0 = a4->var0;
  if (var0 == 2)
    v6 = 2;
  else
    v6 = var0 == 1;
  objc_msgSend(m_ptr, "addTextAnimationForAnimationID:withStyleType:", a3, v6);
}

- (void)_removeTextAnimationForAnimationID:(id)a3
{
  objc_msgSend(self->_contentView.m_ptr, "removeTextAnimationForAnimationID:", a3);
}

- (OpaqueWKPage)_pageForTesting
{
  WebPageProxy *m_ptr;

  m_ptr = self->_page.m_ptr;
  if (m_ptr)
    return (OpaqueWKPage *)*((_QWORD *)m_ptr + 1);
  else
    return 0;
}

- (optional<BOOL>)_resolutionForShareSheetImmediateCompletionForTesting
{
  return self->_resolutionForShareSheetImmediateCompletionForTesting;
}

- (void)createPDFWithConfiguration:(WKPDFConfiguration *)pdfConfiguration completionHandler:(void *)completionHandler
{
  WebPageProxy *m_ptr;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  void *v15;
  _QWORD *v16;
  CGFloat x;
  CGFloat v18;
  CGRect cf;
  uint64_t v20[2];
  char v21;
  CGRect v22;

  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((_BYTE *)m_ptr + 1290))
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("The WKWebView is suspended"));
    m_ptr = self->_page.m_ptr;
  }
  v8 = *((_QWORD *)m_ptr + 35);
  if (v8)
  {
    v9 = *(_QWORD *)(v8 + 272);
    v10 = *(_QWORD *)(v8 + 280);
    LOBYTE(v20[0]) = 0;
    v21 = 0;
    if (pdfConfiguration)
    {
      -[WKPDFConfiguration rect](pdfConfiguration, "rect");
      if (!CGRectIsNull(v22))
      {
        -[WKPDFConfiguration rect](pdfConfiguration, "rect");
        cf.origin.x = v11;
        cf.origin.y = v12;
        cf.size.width = v13;
        cf.size.height = v14;
        WebCore::FloatRect::FloatRect((WebCore::FloatRect *)v20, &cf);
        v21 = 1;
      }
      LOBYTE(pdfConfiguration) = -[WKPDFConfiguration allowTransparentBackground](pdfConfiguration, "allowTransparentBackground");
      m_ptr = self->_page.m_ptr;
    }
    v15 = _Block_copy(completionHandler);
    v16 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
    *v16 = off_1E34BD328;
    v16[1] = v15;
    *(_QWORD *)&cf.origin.x = v16;
    WebKit::WebPageProxy::drawToPDF((uint64_t)m_ptr, v9, v10, v20, (char)pdfConfiguration, (uint64_t *)&cf);
    x = cf.origin.x;
    cf.origin.x = 0.0;
    if (x != 0.0)
      (*(void (**)(CGFloat))(**(_QWORD **)&x + 8))(COERCE_CGFLOAT(*(_QWORD *)&x));
    _Block_release(0);
  }
  else
  {
    createNSError(WKErrorUnknown, 0, &cf);
    (*((void (**)(void *, _QWORD, _QWORD))completionHandler + 2))(completionHandler, 0, *(_QWORD *)&cf.origin.x);
    v18 = cf.origin.x;
    cf.origin.x = 0.0;
    if (v18 != 0.0)
      CFRelease(*(CFTypeRef *)&v18);
  }
}

- (void)createWebArchiveDataWithCompletionHandler:(void *)completionHandler
{
  WebPageProxy *m_ptr;
  void *v5;
  _QWORD *v6;
  uint64_t v7;
  _QWORD *v9;

  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((_BYTE *)m_ptr + 1290))
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("The WKWebView is suspended"));
    m_ptr = self->_page.m_ptr;
  }
  v5 = _Block_copy(completionHandler);
  v6 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
  *v6 = off_1E34BD350;
  v6[1] = v5;
  v9 = v6;
  WebKit::WebPageProxy::getWebArchiveOfFrame((uint64_t)m_ptr, 0, (uint64_t *)&v9);
  v7 = (uint64_t)v9;
  v9 = 0;
  if (v7)
    (*(void (**)(uint64_t))(*(_QWORD *)v7 + 8))(v7);
  _Block_release(0);
}

- (void)_didChangeEditorState
{
  uint64_t v3;
  int v4;
  BOOL v5;
  uint64_t v6;
  unint64_t v7;
  NSString *v8;
  id v9;
  unsigned __int8 *v10;
  unsigned int v11;
  int32x2_t v12;
  int8x16_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const Color *v17;
  const __CFString *v18;
  WTF::StringImpl *v19;
  WTF::StringImpl *v20;
  WTF::StringImpl *v21;
  const __CFString *v22;
  const __CFString *v23;
  const __CFString *v24;
  const __CFString *v25;
  const __CFString *v26;
  const __CFString *v27;
  uint64_t v28;
  int8x16_t v29;
  uint64_t v30;
  uint64_t v31;
  const __CFString *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v3 = *((_QWORD *)self->_page.m_ptr + 4);
  v4 = *(unsigned __int8 *)(v3 + 233);
  v5 = *(_BYTE *)(v3 + 234) == 0;
  v6 = 1;
  if (!v5)
    v6 = 2;
  if (v4)
    v7 = 0;
  else
    v7 = v6;
  if (self->_selectionAttributes != v7)
  {
    v8 = NSStringFromSelector(sel__selectionAttributes);
    -[WKWebView willChangeValueForKey:](self, "willChangeValueForKey:", v8);
    self->_selectionAttributes = v7;
    -[WKWebView didChangeValueForKey:](self, "didChangeValueForKey:", v8);
  }
  v9 = -[WKWebView UIDelegate](self, "UIDelegate");
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v10 = (unsigned __int8 *)*((_QWORD *)self->_page.m_ptr + 4);
    if (v10[560])
    {
      v28 = MEMORY[0x1E0C9AAB0];
      v11 = v10[256];
      v22 = CFSTR("post-layout-data");
      v23 = CFSTR("bold");
      v12 = vceqz_s32((int32x2_t)vand_s8((int8x8_t)vdup_n_s32(v11), (int8x8_t)0x200000001));
      v13.i64[0] = v12.i32[0];
      v13.i64[1] = v12.i32[1];
      v14 = MEMORY[0x1E0C9AAA0];
      v29 = vbslq_s8(v13, (int8x16_t)vdupq_n_s64(MEMORY[0x1E0C9AAA0]), (int8x16_t)vdupq_n_s64(MEMORY[0x1E0C9AAB0]));
      v24 = CFSTR("italic");
      v25 = CFSTR("underline");
      if ((v11 & 4) != 0)
        v14 = MEMORY[0x1E0C9AAB0];
      v30 = v14;
      v26 = CFSTR("text-alignment");
      if ((v10[272] - 1) > 3u)
        v15 = 4;
      else
        v15 = qword_1978CF5B0[(char)(v10[272] - 1)];
      v31 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v15);
      v27 = CFSTR("text-color");
      WebCore::serializationForCSS((WebCore *)(v10 + 280), v17);
      if (v21)
        v18 = (const __CFString *)WTF::StringImpl::operator NSString *();
      else
        v18 = &stru_1E351F1B8;
      v32 = v18;
      v16 = (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v28, &v22, 6);
      v20 = v21;
      v21 = 0;
      if (v20)
      {
        if (*(_DWORD *)v20 == 2)
          WTF::StringImpl::destroy(v20, v19);
        else
          *(_DWORD *)v20 -= 2;
      }
    }
    else
    {
      v16 = &unk_1E356F7F8;
    }
    objc_msgSend(v9, "_webView:editorStateDidChange:", self, v16, v21, v22, v23, v24, v25, v26, v27, v28, *(_OWORD *)&v29, v30, v31);
  }
}

- (WKNavigation)loadSimulatedRequest:(NSURLRequest *)request response:(NSURLResponse *)response responseData:(NSData *)data
{
  WebPageProxy *m_ptr;
  void *v9;
  WTF *v10;
  uint64_t v11;
  const void *v12;
  const void *v13;
  WTF::StringImpl *v14;
  WKNavigation *v15;
  uint64_t v16;
  CFTypeRef v17;
  CFTypeRef v18;
  _BYTE v21[240];
  CFTypeRef cf;
  _BYTE v23[192];
  CFTypeRef v24;
  uint64_t v25;

  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((_BYTE *)m_ptr + 1290))
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("The WKWebView is suspended"));
    m_ptr = self->_page.m_ptr;
  }
  MEMORY[0x19AEAEC20](v23, request);
  WebCore::ResourceResponse::ResourceResponse((WebCore::ResourceResponse *)v21, response);
  if (data)
  {
    v9 = -[NSData bytes](data, "bytes");
    v10 = -[NSData length](data, "length");
  }
  else
  {
    v9 = 0;
    v10 = 0;
  }
  WebKit::WebPageProxy::loadSimulatedRequest((uint64_t)m_ptr, (uint64_t)v23, (uint64_t)v21, (char *)v9, v10, &v25);
  v11 = v25;
  if (v25)
  {
    v25 = 0;
    v12 = *(const void **)(v11 + 8);
    if (v12)
    {
      CFRetain(*(CFTypeRef *)(v11 + 8));
      v13 = *(const void **)(v11 + 8);
    }
    else
    {
      v13 = 0;
    }
    CFRelease(v13);
  }
  else
  {
    v12 = 0;
  }
  v15 = (id)CFMakeCollectable(v12);
  v16 = v25;
  v25 = 0;
  if (v16)
    CFRelease(*(CFTypeRef *)(v16 + 8));
  v17 = cf;
  cf = 0;
  if (v17)
    CFRelease(v17);
  WebCore::ResourceResponseBase::~ResourceResponseBase((WebCore::ResourceResponseBase *)v21, v14);
  v18 = v24;
  v24 = 0;
  if (v18)
    CFRelease(v18);
  WebCore::ResourceRequestBase::~ResourceRequestBase((WebCore::ResourceRequestBase *)v23);
  return v15;
}

- (WKNavigation)loadSimulatedRequest:(NSURLRequest *)request withResponse:(NSURLResponse *)response responseData:(NSData *)data
{
  WebPageProxy *m_ptr;

  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((_BYTE *)m_ptr + 1290))
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("The WKWebView is suspended"));
  return -[WKWebView loadSimulatedRequest:response:responseData:](self, "loadSimulatedRequest:response:responseData:", request, response, data);
}

- (WKNavigation)loadSimulatedRequest:(NSURLRequest *)request responseHTMLString:(NSString *)string
{
  WebPageProxy *m_ptr;
  NSData *v8;
  const void *v9;
  WKNavigation *v10;

  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((_BYTE *)m_ptr + 1290))
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("The WKWebView is suspended"));
  v8 = -[NSString dataUsingEncoding:](string, "dataUsingEncoding:", 4);
  v9 = (const void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C92C88]), "initWithURL:MIMEType:expectedContentLength:textEncodingName:", -[NSURLRequest URL](request, "URL"), CFSTR("text/html"), -[NSString length](string, "length"), CFSTR("UTF-8"));
  v10 = -[WKWebView loadSimulatedRequest:response:responseData:](self, "loadSimulatedRequest:response:responseData:", request, v9, v8);
  if (v9)
    CFRelease(v9);
  return v10;
}

- (WKNavigation)loadSimulatedRequest:(NSURLRequest *)request withResponseHTMLString:(NSString *)string
{
  WebPageProxy *m_ptr;

  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((_BYTE *)m_ptr + 1290))
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("The WKWebView is suspended"));
  return -[WKWebView loadSimulatedRequest:responseHTMLString:](self, "loadSimulatedRequest:responseHTMLString:", request, string);
}

- (WKNavigation)loadFileRequest:(NSURLRequest *)request allowingReadAccessToURL:(NSURL *)readAccessURL
{
  WebPageProxy *m_ptr;
  NSURL *v8;
  NSURLRequestAttribution v9;
  WebPageProxy *v10;
  uint64_t v11;
  const void *v12;
  const void *v13;
  WTF::StringImpl *v14;
  WKNavigation *v15;
  uint64_t v16;
  WTF::StringImpl *v17;
  WTF::StringImpl *v18;
  WTF::StringImpl *v20;
  WTF::StringImpl *v21;
  uint64_t v22;

  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((_BYTE *)m_ptr + 1290))
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("The WKWebView is suspended"));
  v8 = -[NSURLRequest URL](request, "URL");
  if (!-[NSURL isFileURL](v8, "isFileURL"))
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%@ is not a file URL"), v8);
  if (!-[NSURL isFileURL](readAccessURL, "isFileURL"))
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%@ is not a file URL"), readAccessURL);
  v9 = -[NSURLRequest attribution](request, "attribution");
  v10 = self->_page.m_ptr;
  MEMORY[0x19AEABCC8](&v21, -[NSURL absoluteString](v8, "absoluteString"));
  MEMORY[0x19AEABCC8](&v20, -[NSURL absoluteString](readAccessURL, "absoluteString"));
  WebKit::WebPageProxy::loadFile((WebKit::WebPageProxy *)v10, &v21, &v20, 0, v9 == NSURLRequestAttributionDeveloper, &v22);
  v11 = v22;
  if (v22)
  {
    v22 = 0;
    v12 = *(const void **)(v11 + 8);
    if (v12)
    {
      CFRetain(*(CFTypeRef *)(v11 + 8));
      v13 = *(const void **)(v11 + 8);
    }
    else
    {
      v13 = 0;
    }
    CFRelease(v13);
  }
  else
  {
    v12 = 0;
  }
  v15 = (id)CFMakeCollectable(v12);
  v16 = v22;
  v22 = 0;
  if (v16)
    CFRelease(*(CFTypeRef *)(v16 + 8));
  v17 = v20;
  v20 = 0;
  if (v17)
  {
    if (*(_DWORD *)v17 == 2)
      WTF::StringImpl::destroy(v17, v14);
    else
      *(_DWORD *)v17 -= 2;
  }
  v18 = v21;
  v21 = 0;
  if (v18)
  {
    if (*(_DWORD *)v18 == 2)
      WTF::StringImpl::destroy(v18, v14);
    else
      *(_DWORD *)v18 -= 2;
  }
  return v15;
}

- (UIColor)themeColor
{
  const Color *v2;
  CFTypeRef v3;
  void *v4;
  UIColor *v5;
  CFTypeRef v6;
  unsigned int *v8;
  unsigned int v9;
  unsigned int v10;
  uint64_t v11;
  CFTypeRef cf;

  WebCore::Color::Color((WebCore::Color *)&v11, (const Color *)(*((_QWORD *)self->_page.m_ptr + 4) + 1744));
  WebCore::cocoaColorOrNil((WebCore *)&v11, v2);
  v3 = cf;
  cf = 0;
  v5 = (id)CFMakeCollectable(v3);
  v6 = cf;
  cf = 0;
  if (v6)
    CFRelease(v6);
  if ((v11 & 0x8000000000000) != 0)
  {
    v8 = (unsigned int *)(v11 & 0xFFFFFFFFFFFFLL);
    do
    {
      v9 = __ldaxr(v8);
      v10 = v9 - 1;
    }
    while (__stlxr(v10, v8));
    if (!v10)
    {
      atomic_store(1u, v8);
      WTF::fastFree((WTF *)v8, v4);
    }
  }
  return v5;
}

- (WKFullscreenState)fullscreenState
{
  uint64_t v2;
  unsigned int v3;

  v2 = *((_QWORD *)self->_page.m_ptr + 45);
  if (v2 && (v3 = *(unsigned __int8 *)(v2 + 40) - 1, v3 <= 2))
    return v3 + 1;
  else
    return 0;
}

- (void)setMinimumViewportInset:(UIEdgeInsets)minimumViewportInset maximumViewportInset:(UIEdgeInsets)maximumViewportInset
{
  double right;
  double bottom;
  double left;
  double top;
  double v8;
  double v9;
  double v10;
  double v11;
  _QWORD *v13;
  double v14;

  right = maximumViewportInset.right;
  bottom = maximumViewportInset.bottom;
  left = maximumViewportInset.left;
  top = maximumViewportInset.top;
  v8 = minimumViewportInset.right;
  v9 = minimumViewportInset.bottom;
  v10 = minimumViewportInset.left;
  v11 = minimumViewportInset.top;
  v13 = (_QWORD *)MEMORY[0x1E0C99778];
  if (minimumViewportInset.top < 0.0
    || minimumViewportInset.left < 0.0
    || minimumViewportInset.bottom < 0.0
    || minimumViewportInset.right < 0.0)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("minimumViewportInset cannot be negative"));
  }
  if (top < 0.0 || left < 0.0 || bottom < 0.0 || right < 0.0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *v13, CFSTR("maximumViewportInset cannot be negative"));
  v14 = v8 + v10;
  if (v11 + v9 > top + bottom || v14 > right + left)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *v13, CFSTR("minimumViewportInset cannot be larger than maximumViewportInset"), v14);
  -[WKWebView _recalculateViewportSizesWithMinimumViewportInset:maximumViewportInset:throwOnInvalidInput:](self, "_recalculateViewportSizesWithMinimumViewportInset:maximumViewportInset:throwOnInvalidInput:", 1, v11, v10, v9, v8, top, left, bottom, right);
  self->_minimumViewportInset.top = v11;
  self->_minimumViewportInset.left = v10;
  self->_minimumViewportInset.bottom = v9;
  self->_minimumViewportInset.right = v8;
  self->_maximumViewportInset.top = top;
  self->_maximumViewportInset.left = left;
  self->_maximumViewportInset.bottom = bottom;
  self->_maximumViewportInset.right = right;
}

- (BOOL)isWritingToolsActive
{
  return *((_BYTE *)self->_page.m_ptr + 1384);
}

- (unint64_t)allowedWritingToolsResultOptions
{
  uint64_t v2;
  BOOL v3;

  v2 = *((_QWORD *)self->_page.m_ptr + 4);
  if (*(_BYTE *)(v2 + 238))
    v3 = 1;
  else
    v3 = *(_BYTE *)(v2 + 237) == 0;
  if (v3)
    return 15;
  else
    return 1;
}

- (int64_t)writingToolsBehavior
{
  unsigned int v2;

  v2 = WebKit::WebPageProxy::writingToolsBehavior((WebKit::WebPageProxy *)self->_page.m_ptr) - 1;
  if (v2 > 2)
    return -1;
  else
    return qword_1978CF5D0[(char)v2];
}

- (void)willBeginWritingToolsSession:(id)a3 requestContexts:(id)a4
{
  WebPageProxy *m_ptr;
  void *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  _BYTE *v13;
  _BYTE v14[56];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  WebKit::convertToWebSession(a3, (uint64_t)v14);
  if (a3)
  {
    objc_msgSend(self->_writingToolsSessions.m_ptr, "setObject:forKey:", a3, objc_msgSend(a3, "uuid"));
    WebKit::WebPageProxy::setWritingToolsActive((uint64_t)self->_page.m_ptr, 1);
  }
  m_ptr = self->_page.m_ptr;
  v8 = _Block_copy(a4);
  v9 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
  *v9 = off_1E34BD378;
  v9[1] = v8;
  v12 = v9;
  v10 = *((_QWORD *)m_ptr + 26);
  v13 = v14;
  WebKit::AuxiliaryProcessProxy::sendWithAsyncReply<Messages::WebPage::WillBeginWritingToolsSession,WTF::CompletionHandler<void ()(WTF::Vector<WebCore::WritingTools::Context,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc> const&)>>(v10, (uint64_t *)&v13, (uint64_t *)&v12, *(_QWORD *)(*((_QWORD *)m_ptr + 4) + 1896), 0, 1);
  v11 = (uint64_t)v12;
  v12 = 0;
  if (v11)
    (*(void (**)(uint64_t))(*(_QWORD *)v11 + 8))(v11);
  _Block_release(0);
}

- (void)didBeginWritingToolsSession:(id)a3 contexts:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  unsigned int v10;
  _OWORD *v11;
  unsigned int v12;
  uint64_t v13;
  _OWORD *v14;
  uint64_t v15;
  __int128 v16;
  uint64_t v17;
  _OWORD *v18;
  WebPageProxy *m_ptr;
  uint64_t v20;
  WKWebView *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint64_t v26;
  uint64_t v27;
  __int128 v28;
  _BYTE v29[64];
  char v30;
  _BYTE v31[128];
  _BYTE v32[48];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  WebKit::convertToWebSession(a3, (uint64_t)v32);
  if (v32[32])
  {
    v21 = self;
    v26 = 0;
    v27 = 0;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v6 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v22, v31, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v23;
LABEL_4:
      v8 = 0;
      while (1)
      {
        if (*(_QWORD *)v23 != v7)
          objc_enumerationMutation(a4);
        WebKit::convertToWebContext(*(void **)(*((_QWORD *)&v22 + 1) + 8 * v8), (uint64_t)&v28);
        if (!v30)
          break;
        v10 = HIDWORD(v27);
        if (HIDWORD(v27) == (_DWORD)v27)
        {
          v11 = (_OWORD *)WTF::Vector<WebCore::WritingTools::Context,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::expandCapacity<(WTF::FailureAction)0>((uint64_t)&v26, HIDWORD(v27) + 1, (unint64_t)&v28);
          v12 = HIDWORD(v27);
          v13 = v26;
          v14 = (_OWORD *)(v26 + 80 * HIDWORD(v27));
          *v14 = *v11;
          MEMORY[0x19AEAEEB4](v14 + 1, v11 + 1);
          v15 = v13 + 80 * v12;
          v16 = *(_OWORD *)((char *)v11 + 56);
        }
        else
        {
          v17 = v26;
          v18 = (_OWORD *)(v26 + 80 * HIDWORD(v27));
          *v18 = v28;
          MEMORY[0x19AEAEEB4](v18 + 1, v29);
          v15 = v17 + 80 * v10;
          v16 = *(_OWORD *)&v29[40];
        }
        *(_OWORD *)(v15 + 56) = v16;
        ++HIDWORD(v27);
        if (v30)
          MEMORY[0x19AEAEECC](v29);
        if (v6 == ++v8)
        {
          v6 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v22, v31, 16);
          if (v6)
            goto LABEL_4;
          goto LABEL_15;
        }
      }
    }
    else
    {
LABEL_15:
      m_ptr = v21->_page.m_ptr;
      v20 = *((_QWORD *)m_ptr + 26);
      *(_QWORD *)&v28 = v32;
      *((_QWORD *)&v28 + 1) = &v26;
      WebKit::AuxiliaryProcessProxy::send<Messages::WebPage::DidBeginWritingToolsSession>(v20, (uint64_t)&v28, *(_QWORD *)(*((_QWORD *)m_ptr + 4) + 1896), 0);
    }
    WTF::Vector<WebCore::WritingTools::Context,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v26, v9);
  }
}

- (void)proofreadingSession:(id)a3 didReceiveSuggestions:(id)a4 processedRange:(_NSRange)a5 inContext:(id)a6 finished:(BOOL)a7
{
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  unsigned int v15;
  unint64_t v16;
  uint64_t v17;
  _OWORD *v18;
  __int128 v19;
  _DWORD *v20;
  uint64_t v21;
  _BYTE *v22;
  uint64_t *v23;
  uint64_t v24;
  _OWORD *v25;
  __int128 v26;
  WTF::StringImpl *v27;
  uint64_t v28;
  WTF::StringImpl *v29;
  WTF::StringImpl *v30;
  WebPageProxy *m_ptr;
  uint64_t v32;
  void *v33;
  BOOL v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint64_t v39;
  uint64_t v40;
  __int128 v41;
  __int128 v42;
  WTF::StringImpl *v43;
  uint64_t v44;
  char v45;
  _BYTE v46[128];
  _BYTE v47[16];
  uint64_t v48;
  char v49;
  _BYTE v50[48];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  WebKit::convertToWebSession(a3, (uint64_t)v50);
  if (v50[32])
  {
    WebKit::convertToWebContext(a6, (uint64_t)v47);
    if (v49)
    {
      v34 = a7;
      v39 = 0;
      v40 = 0;
      v35 = 0u;
      v36 = 0u;
      v37 = 0u;
      v38 = 0u;
      v11 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v35, v46, 16);
      if (v11)
      {
        v12 = *(_QWORD *)v36;
        do
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v36 != v12)
              objc_enumerationMutation(a4);
            v14 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
            WebKit::convertToWebTextSuggestion(v14, (uint64_t)&v41);
            if (v45)
            {
              v15 = HIDWORD(v40);
              if (HIDWORD(v40) == (_DWORD)v40)
              {
                v16 = WTF::Vector<WebCore::WritingTools::TextSuggestion,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::expandCapacity<(WTF::FailureAction)0>((uint64_t)&v39, HIDWORD(v40) + 1, (unint64_t)&v41);
                v15 = HIDWORD(v40);
                v17 = v39;
                v18 = (_OWORD *)(v39 + 48 * HIDWORD(v40));
                v19 = *(_OWORD *)(v16 + 16);
                *v18 = *(_OWORD *)v16;
                v18[1] = v19;
                v20 = *(_DWORD **)(v16 + 32);
                if (v20)
                  *v20 += 2;
                v21 = v17 + 48 * v15;
                *(_QWORD *)(v21 + 32) = v20;
                v22 = (_BYTE *)(v21 + 40);
                v23 = (uint64_t *)(v16 + 40);
              }
              else
              {
                v24 = v39;
                v25 = (_OWORD *)(v39 + 48 * HIDWORD(v40));
                v26 = v42;
                *v25 = v41;
                v25[1] = v26;
                v27 = v43;
                if (v43)
                  *(_DWORD *)v43 += 2;
                v28 = v24 + 48 * v15;
                *(_QWORD *)(v28 + 32) = v27;
                v22 = (_BYTE *)(v28 + 40);
                v23 = &v44;
              }
              *v22 = *(_BYTE *)v23;
              HIDWORD(v40) = v15 + 1;
              objc_msgSend(self->_writingToolsTextSuggestions.m_ptr, "setObject:forKey:", v14, objc_msgSend(v14, "uuid"));
              if (v45)
              {
                v30 = v43;
                v43 = 0;
                if (v30)
                {
                  if (*(_DWORD *)v30 == 2)
                    WTF::StringImpl::destroy(v30, v29);
                  else
                    *(_DWORD *)v30 -= 2;
                }
              }
            }
          }
          v11 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v35, v46, 16);
        }
        while (v11);
      }
      if (!v49)
        __break(1u);
      m_ptr = self->_page.m_ptr;
      v32 = *((_QWORD *)m_ptr + 26);
      *(_QWORD *)&v41 = v50;
      *((_QWORD *)&v41 + 1) = &v39;
      *(_QWORD *)&v42 = v47;
      BYTE8(v42) = v34;
      WebKit::AuxiliaryProcessProxy::send<Messages::WebPage::ProofreadingSessionDidReceiveSuggestions>(v32, (uint64_t **)&v41, *(_QWORD *)(*((_QWORD *)m_ptr + 4) + 1896), 0);
      WTF::Vector<WebCore::WritingTools::TextSuggestion,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v39, v33);
      if (v49)
        MEMORY[0x19AEAEECC](&v48);
    }
  }
}

- (void)proofreadingSession:(id)a3 didUpdateState:(int64_t)a4 forSuggestionWithUUID:(id)a5 inContext:(id)a6
{
  char v10;
  void *v11;
  WebPageProxy *m_ptr;
  uint64_t v13;
  WTF::StringImpl *v14;
  WTF::StringImpl *v15;
  _BYTE *v16;
  char v17;
  _BYTE *v18;
  _BYTE *v19;
  _BYTE v20[32];
  WTF::StringImpl *v21;
  char v22;
  _BYTE v23[16];
  uint64_t v24;
  char v25;
  _BYTE v26[56];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  WebKit::convertToWebSession(a3, (uint64_t)v26);
  if (v26[32])
  {
    WebKit::convertToWebContext(a6, (uint64_t)v23);
    if (v25)
    {
      if ((unint64_t)a4 >= 5)
        v10 = 3;
      else
        v10 = 0x302030100uLL >> (8 * a4);
      v11 = (void *)objc_msgSend(self->_writingToolsTextSuggestions.m_ptr, "objectForKey:", a5);
      if (v11)
      {
        WebKit::convertToWebTextSuggestion(v11, (uint64_t)v20);
        if (v22)
        {
          if (!v25)
            __break(1u);
          m_ptr = self->_page.m_ptr;
          v13 = *((_QWORD *)m_ptr + 26);
          v16 = v26;
          v17 = v10;
          v18 = v20;
          v19 = v23;
          WebKit::AuxiliaryProcessProxy::send<Messages::WebPage::ProofreadingSessionDidUpdateStateForSuggestion>(v13, (uint64_t)&v16, *(_QWORD *)(*((_QWORD *)m_ptr + 4) + 1896), 0);
          if (v22)
          {
            v15 = v21;
            v21 = 0;
            if (v15)
            {
              if (*(_DWORD *)v15 == 2)
                WTF::StringImpl::destroy(v15, v14);
              else
                *(_DWORD *)v15 -= 2;
            }
          }
        }
      }
      if (v25)
        MEMORY[0x19AEAEECC](&v24);
    }
  }
}

- (void)didEndWritingToolsSession:(id)a3 accepted:(BOOL)a4
{
  WebPageProxy *m_ptr;
  uint64_t v8;
  _BYTE *v9;
  BOOL v10;
  _BYTE v11[56];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  WebKit::convertToWebSession(a3, (uint64_t)v11);
  if (v11[32])
  {
    objc_msgSend(self->_writingToolsSessions.m_ptr, "removeObjectForKey:", objc_msgSend(a3, "uuid"));
    objc_msgSend(self->_writingToolsTextSuggestions.m_ptr, "removeAllObjects");
    WebKit::WebPageProxy::setWritingToolsActive((uint64_t)self->_page.m_ptr, 0);
    m_ptr = self->_page.m_ptr;
    v8 = *((_QWORD *)m_ptr + 26);
    v9 = v11;
    v10 = a4;
    WebKit::AuxiliaryProcessProxy::send<Messages::WebPage::DidEndWritingToolsSession>(v8, (uint64_t)&v9, *(_QWORD *)(*((_QWORD *)m_ptr + 4) + 1896), 0);
  }
}

- (void)compositionSession:(id)a3 didReceiveText:(id)a4 replacementRange:(_NSRange)a5 inContext:(id)a6 finished:(BOOL)a7
{
  NSUInteger length;
  NSUInteger location;
  WebPageProxy *m_ptr;
  uint64_t v14;
  CFTypeRef v15;
  _QWORD v16[2];
  CFTypeRef cf;
  _BYTE v18[40];
  uint64_t *v19[4];
  BOOL v20;
  _BYTE v21[16];
  uint64_t v22;
  char v23;
  _BYTE v24[56];
  uint64_t v25;

  length = a5.length;
  location = a5.location;
  v25 = *MEMORY[0x1E0C80C00];
  WebKit::convertToWebSession(a3, (uint64_t)v24);
  if (v24[32])
  {
    WebKit::convertToWebContext(a6, (uint64_t)v21);
    if (v23)
    {
      m_ptr = self->_page.m_ptr;
      cf = a4;
      if (a4)
        CFRetain(a4);
      WebCore::AttributedString::fromNSAttributedString();
      v16[0] = location;
      v16[1] = length;
      if (!v23)
        __break(1u);
      v14 = *((_QWORD *)m_ptr + 26);
      v19[0] = (uint64_t *)v24;
      v19[1] = (uint64_t *)v18;
      v19[2] = v16;
      v19[3] = (uint64_t *)v21;
      v20 = a7;
      WebKit::AuxiliaryProcessProxy::send<Messages::WebPage::CompositionSessionDidReceiveTextWithReplacementRange>(v14, v19, *(_QWORD *)(*((_QWORD *)m_ptr + 4) + 1896), 0);
      MEMORY[0x19AEAEECC](v18);
      v15 = cf;
      cf = 0;
      if (v15)
        CFRelease(v15);
      if (v23)
        MEMORY[0x19AEAEECC](&v22);
    }
  }
}

- (void)writingToolsSession:(id)a3 didReceiveAction:(int64_t)a4
{
  WebPageProxy *m_ptr;
  char v7;
  uint64_t v8;
  _BYTE *v9;
  char v10;
  _BYTE v11[56];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  WebKit::convertToWebSession(a3, (uint64_t)v11);
  if (v11[32])
  {
    m_ptr = self->_page.m_ptr;
    v7 = a4 == 2;
    if (a4 == 3)
      v7 = 2;
    v8 = *((_QWORD *)m_ptr + 26);
    v9 = v11;
    v10 = v7;
    WebKit::AuxiliaryProcessProxy::send<Messages::WebPage::WritingToolsSessionDidReceiveAction>(v8, (uint64_t)&v9, *(_QWORD *)(*((_QWORD *)m_ptr + 4) + 1896), 0);
  }
}

- (void)_proofreadingSessionWithUUID:(id)a3 showDetailsForSuggestionWithUUID:(id)a4 relativeToRect:(CGRect)a5
{
  double height;
  double width;
  double y;
  double x;
  void *v11;
  void *v12;
  void *v13;
  void *m_ptr;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v11 = (void *)objc_msgSend(self->_writingToolsSessions.m_ptr, "objectForKey:", a3);
  if (v11)
  {
    v12 = v11;
    v13 = (void *)objc_msgSend(v11, "textViewDelegate");
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      m_ptr = self->_contentView.m_ptr;
      if (m_ptr)
        CFRetain(m_ptr);
      objc_msgSend(v13, "proofreadingSessionWithUUID:showDetailsForSuggestionWithUUID:relativeToRect:inView:", objc_msgSend(v12, "uuid"), a4, m_ptr, x, y, width, height);
      if (m_ptr)
        CFRelease(m_ptr);
    }
  }
}

- (void)_proofreadingSessionWithUUID:(id)a3 updateState:(unsigned __int8)a4 forSuggestionWithUUID:(id)a5
{
  int v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;

  v6 = a4;
  v7 = (void *)objc_msgSend(self->_writingToolsSessions.m_ptr, "objectForKey:", a3);
  if (v7)
  {
    v8 = v7;
    v9 = (void *)objc_msgSend(v7, "textViewDelegate");
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v10 = objc_msgSend(v8, "uuid");
      if ((v6 - 1) > 2)
        v11 = 0;
      else
        v11 = qword_1978CF5E8[(char)(v6 - 1)];
      objc_msgSend(v9, "proofreadingSessionWithUUID:updateState:forSuggestionWithUUID:", v10, v11, a5);
    }
  }
}

- (UIEdgeInsets)minimumViewportInset
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_minimumViewportInset.top;
  left = self->_minimumViewportInset.left;
  bottom = self->_minimumViewportInset.bottom;
  right = self->_minimumViewportInset.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (UIEdgeInsets)maximumViewportInset
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_maximumViewportInset.top;
  left = self->_maximumViewportInset.left;
  bottom = self->_maximumViewportInset.bottom;
  right = self->_maximumViewportInset.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (BOOL)isFindInteractionEnabled
{
  return self->_findInteractionEnabled;
}

- (BOOL)_hasActiveNowPlayingSession
{
  return self->__hasActiveNowPlayingSession;
}

- (void)_setHasActiveNowPlayingSession:(BOOL)a3
{
  self->__hasActiveNowPlayingSession = a3;
}

- (void)_alignCenter:(id)a3
{
  if (-[WKWebView usesStandardContentView](self, "usesStandardContentView"))
    objc_msgSend(self->_contentView.m_ptr, "_alignCenterForWebView:", a3);
}

- (void)_alignJustified:(id)a3
{
  if (-[WKWebView usesStandardContentView](self, "usesStandardContentView"))
    objc_msgSend(self->_contentView.m_ptr, "_alignJustifiedForWebView:", a3);
}

- (void)_alignLeft:(id)a3
{
  if (-[WKWebView usesStandardContentView](self, "usesStandardContentView"))
    objc_msgSend(self->_contentView.m_ptr, "_alignLeftForWebView:", a3);
}

- (void)_alignRight:(id)a3
{
  if (-[WKWebView usesStandardContentView](self, "usesStandardContentView"))
    objc_msgSend(self->_contentView.m_ptr, "_alignRightForWebView:", a3);
}

- (void)_indent:(id)a3
{
  if (-[WKWebView usesStandardContentView](self, "usesStandardContentView"))
    objc_msgSend(self->_contentView.m_ptr, "_indentForWebView:", a3);
}

- (void)_outdent:(id)a3
{
  if (-[WKWebView usesStandardContentView](self, "usesStandardContentView"))
    objc_msgSend(self->_contentView.m_ptr, "_outdentForWebView:", a3);
}

- (void)_toggleStrikeThrough:(id)a3
{
  if (-[WKWebView usesStandardContentView](self, "usesStandardContentView"))
    objc_msgSend(self->_contentView.m_ptr, "_toggleStrikeThroughForWebView:", a3);
}

- (void)_insertOrderedList:(id)a3
{
  if (-[WKWebView usesStandardContentView](self, "usesStandardContentView"))
    objc_msgSend(self->_contentView.m_ptr, "_insertOrderedListForWebView:", a3);
}

- (void)_insertUnorderedList:(id)a3
{
  if (-[WKWebView usesStandardContentView](self, "usesStandardContentView"))
    objc_msgSend(self->_contentView.m_ptr, "_insertUnorderedListForWebView:", a3);
}

- (void)_insertNestedOrderedList:(id)a3
{
  if (-[WKWebView usesStandardContentView](self, "usesStandardContentView"))
    objc_msgSend(self->_contentView.m_ptr, "_insertNestedOrderedListForWebView:", a3);
}

- (void)_insertNestedUnorderedList:(id)a3
{
  if (-[WKWebView usesStandardContentView](self, "usesStandardContentView"))
    objc_msgSend(self->_contentView.m_ptr, "_insertNestedUnorderedListForWebView:", a3);
}

- (void)_increaseListLevel:(id)a3
{
  if (-[WKWebView usesStandardContentView](self, "usesStandardContentView"))
    objc_msgSend(self->_contentView.m_ptr, "_increaseListLevelForWebView:", a3);
}

- (void)_decreaseListLevel:(id)a3
{
  if (-[WKWebView usesStandardContentView](self, "usesStandardContentView"))
    objc_msgSend(self->_contentView.m_ptr, "_decreaseListLevelForWebView:", a3);
}

- (void)_changeListType:(id)a3
{
  if (-[WKWebView usesStandardContentView](self, "usesStandardContentView"))
    objc_msgSend(self->_contentView.m_ptr, "_changeListTypeForWebView:", a3);
}

- (void)_pasteAsQuotation:(id)a3
{
  if (-[WKWebView usesStandardContentView](self, "usesStandardContentView"))
    objc_msgSend(self->_contentView.m_ptr, "_pasteAsQuotationForWebView:", a3);
}

- (void)_pasteAndMatchStyle:(id)a3
{
  if (-[WKWebView usesStandardContentView](self, "usesStandardContentView"))
    objc_msgSend(self->_contentView.m_ptr, "_pasteAndMatchStyleForWebView:", a3);
}

- (id)inputAccessoryView
{
  return (id)objc_msgSend(self->_contentView.m_ptr, "inputAccessoryViewForWebView");
}

- (id)inputView
{
  return (id)objc_msgSend(self->_contentView.m_ptr, "inputViewForWebView");
}

- (id)inputAssistantItem
{
  return (id)objc_msgSend(self->_contentView.m_ptr, "inputAssistantItemForWebView");
}

- (unint64_t)_selectionAttributes
{
  return self->_selectionAttributes;
}

- (CGSize)_viewportSizeForCSSViewportUnits
{
  double v2;
  double v3;
  CGSize result;

  WebCore::FloatSize::operator CGSize();
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)_setViewportSizeForCSSViewportUnits:(CGSize)a3
{
  WebPageProxy *m_ptr;
  double v5;
  float v6;
  float v7;
  CGSize v8;

  v8 = a3;
  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((_BYTE *)m_ptr + 1290))
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("The WKWebView is suspended"));
  WebCore::FloatSize::FloatSize((WebCore::FloatSize *)&v6, &v8);
  *(float *)&v5 = v6;
  if (v6 <= 0.0 || (*(float *)&v5 = v7, v7 <= 0.0))
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Viewport size should not be empty"), v5);
  WebKit::WebPageProxy::setViewportSizeForCSSViewportUnits((uint64_t)self->_page.m_ptr, (const WebCore::FloatSize *)&v6);
}

- (BOOL)_isBeingInspected
{
  WebPageProxy *m_ptr;

  m_ptr = self->_page.m_ptr;
  return m_ptr && *((_DWORD *)m_ptr + 207) != 0;
}

- (_WKInspector)_inspector
{
  WebPageProxy *m_ptr;
  uint64_t v4;

  m_ptr = self->_page.m_ptr;
  if (*((_BYTE *)m_ptr + 729))
    return 0;
  v4 = *((_QWORD *)m_ptr + 44);
  if (!v4)
    return 0;
  else
    return *(_WKInspector **)(v4 + 8);
}

- (void)_didEnableBrowserExtensions:(id)a3
{
  WebPageProxy *m_ptr;
  unsigned int v6;
  unsigned int v7;
  uint64_t v8;
  WTF::StringImpl *v9;
  uint64_t v10;
  _QWORD v11[5];
  WTF::StringImpl **v12;

  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((_BYTE *)m_ptr + 1290))
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("The WKWebView is suspended"));
  v6 = WTF::HashTable<WTF::String,WTF::KeyValuePair<WTF::String,WTF::WallTime>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<WTF::String,WTF::WallTime>>,WTF::DefaultHash<WTF::String>,WTF::HashMap<WTF::String,WTF::WallTime,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::WallTime>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<WTF::String>>::computeBestTableSize(objc_msgSend(a3, "count"));
  if (v6 <= 8)
    v7 = 8;
  else
    v7 = v6;
  v8 = WTF::fastZeroedMalloc((WTF *)(16 * v7 + 16));
  v12 = (WTF::StringImpl **)(v8 + 16);
  *(_DWORD *)(v8 + 8) = v7 - 1;
  *(_DWORD *)(v8 + 12) = v7;
  *(_QWORD *)v8 = 0;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3321888768;
  v11[2] = __52__WKWebView_WKPrivate___didEnableBrowserExtensions___block_invoke;
  v11[3] = &__block_descriptor_40_e8_32c66_ZTSKZ52__WKWebView_WKPrivate___didEnableBrowserExtensions__E4__40_e35_v32__0__NSString_8__NSString_16_B24l;
  v11[4] = &v12;
  objc_msgSend(a3, "enumerateKeysAndObjectsUsingBlock:", v11);
  v10 = *(_QWORD *)(*((_QWORD *)self->_page.m_ptr + 134) + 56);
  if (v10)
    WebKit::InspectorBrowserAgent::extensionsEnabled(v10, &v12);
  if (v12)
    WTF::HashTable<WTF::String,WTF::KeyValuePair<WTF::String,WTF::String>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<WTF::String,WTF::String>>,WTF::DefaultHash<WTF::String>,WTF::HashMap<WTF::String,WTF::String,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<WTF::String>>::deallocateTable(v12, v9);
}

WTF::StringImpl *__52__WKWebView_WKPrivate___didEnableBrowserExtensions___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v4;
  WTF::StringImpl *v5;
  const WTF::StringImpl *v6;
  uint64_t v7;
  unsigned int v8;
  unsigned int v9;
  int v10;
  WTF **v11;
  int i;
  uint64_t v13;
  WTF **v14;
  WTF *v15;
  WTF::StringImpl *v16;
  WTF::StringImpl *v17;
  WTF::StringImpl *v18;
  uint64_t v19;
  WTF::StringImpl *v20;
  WTF::StringImpl *v21;
  int v22;
  WTF::StringImpl *v23;
  WTF::StringImpl *v24;
  int v25;
  uint64_t v26;
  int v27;
  uint64_t v28;
  int v29;
  uint64_t v30;
  unint64_t v31;
  WTF::StringImpl *result;
  WTF::StringImpl *v33;
  WTF::StringImpl *v34;

  v4 = *(uint64_t **)(a1 + 32);
  MEMORY[0x19AEABCC8](&v33);
  v7 = *v4;
  if (*v4
    || (WTF::HashTable<WTF::String,WTF::KeyValuePair<WTF::String,WTF::String>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<WTF::String,WTF::String>>,WTF::DefaultHash<WTF::String>,WTF::HashMap<WTF::String,WTF::String,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<WTF::String>>::expand(v4, 0), (v7 = *v4) != 0))
  {
    v8 = *(_DWORD *)(v7 - 8);
  }
  else
  {
    v8 = 0;
  }
  v9 = *((_DWORD *)v33 + 4);
  if (v9 >= 0x100)
    v10 = v9 >> 8;
  else
    v10 = WTF::StringImpl::hashSlowCase(v33);
  v11 = 0;
  for (i = 1; ; ++i)
  {
    v13 = v10 & v8;
    v14 = (WTF **)(v7 + 16 * v13);
    v15 = *v14;
    if (*v14 != (WTF *)-1)
      break;
    v11 = (WTF **)(v7 + 16 * v13);
LABEL_13:
    v10 = i + v13;
  }
  if (!v15)
  {
    if (v11)
    {
      *v11 = 0;
      v11[1] = 0;
      --*(_DWORD *)(*v4 - 16);
      v14 = v11;
    }
    v16 = v33;
    v33 = 0;
    v17 = *v14;
    *v14 = v16;
    if (v17)
    {
      if (*(_DWORD *)v17 == 2)
        WTF::StringImpl::destroy(v17, v5);
      else
        *(_DWORD *)v17 -= 2;
    }
    MEMORY[0x19AEABCC8](&v34, a3);
    v23 = v34;
    v34 = 0;
    v24 = v14[1];
    v14[1] = v23;
    if (v24)
    {
      v25 = *(_DWORD *)v24 - 2;
      if (*(_DWORD *)v24 != 2)
        goto LABEL_29;
      WTF::StringImpl::destroy(v24, v18);
      v24 = v34;
      v34 = 0;
      if (!v24)
        goto LABEL_30;
      v25 = *(_DWORD *)v24 - 2;
      if (*(_DWORD *)v24 == 2)
        WTF::StringImpl::destroy(v24, v18);
      else
LABEL_29:
        *(_DWORD *)v24 = v25;
    }
LABEL_30:
    v26 = *v4;
    if (*v4)
      v27 = *(_DWORD *)(v26 - 12) + 1;
    else
      v27 = 1;
    *(_DWORD *)(v26 - 12) = v27;
    v28 = *v4;
    if (*v4)
      v29 = *(_DWORD *)(v28 - 12);
    else
      v29 = 0;
    v30 = (*(_DWORD *)(v28 - 16) + v29);
    v31 = *(unsigned int *)(v28 - 4);
    if (v31 > 0x400)
    {
      if (v31 > 2 * v30)
        goto LABEL_39;
    }
    else if (3 * v31 > 4 * v30)
    {
      goto LABEL_39;
    }
    WTF::HashTable<WTF::String,WTF::KeyValuePair<WTF::String,WTF::String>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<WTF::String,WTF::String>>,WTF::DefaultHash<WTF::String>,WTF::HashMap<WTF::String,WTF::String,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<WTF::String>>::expand(v4, v14);
    goto LABEL_39;
  }
  if (!WTF::equal(v15, v33, v6))
    goto LABEL_13;
  MEMORY[0x19AEABCC8](&v34, a3);
  v19 = v7 + 16 * v13;
  v20 = v34;
  v34 = 0;
  v21 = *(WTF::StringImpl **)(v19 + 8);
  *(_QWORD *)(v19 + 8) = v20;
  if (v21)
  {
    v22 = *(_DWORD *)v21 - 2;
    if (*(_DWORD *)v21 != 2)
      goto LABEL_23;
    WTF::StringImpl::destroy(v21, v18);
    v21 = v34;
    v34 = 0;
    if (!v21)
      goto LABEL_39;
    v22 = *(_DWORD *)v21 - 2;
    if (*(_DWORD *)v21 == 2)
      WTF::StringImpl::destroy(v21, v18);
    else
LABEL_23:
      *(_DWORD *)v21 = v22;
  }
LABEL_39:
  result = v33;
  v33 = 0;
  if (result)
  {
    if (*(_DWORD *)result == 2)
      return (WTF::StringImpl *)WTF::StringImpl::destroy(result, v18);
    else
      *(_DWORD *)result -= 2;
  }
  return result;
}

- (void)_didDisableBrowserExtensions:(id)a3
{
  WebPageProxy *m_ptr;
  unsigned int v6;
  unsigned int v7;
  uint64_t v8;
  WTF::StringImpl *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  const WTF::StringImpl *v13;
  WTF::StringImpl *v14;
  WTF::StringImpl *v15;
  uint64_t v16;
  WTF::StringImpl *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  WTF::StringImpl **v22;
  _BYTE v23[24];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((_BYTE *)m_ptr + 1290))
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("The WKWebView is suspended"));
  v22 = 0;
  v6 = WTF::HashTable<WTF::String,WTF::String,WTF::IdentityExtractor,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::String>>::computeBestTableSize(objc_msgSend(a3, "count"));
  if (v6 <= 8)
    v7 = 8;
  else
    v7 = v6;
  v8 = WTF::fastZeroedMalloc((WTF *)(8 * v7 + 16));
  v22 = (WTF::StringImpl **)(v8 + 16);
  *(_DWORD *)(v8 + 8) = v7 - 1;
  *(_DWORD *)(v8 + 12) = v7;
  *(_QWORD *)v8 = 0;
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v10 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(a3);
        MEMORY[0x19AEABCC8](&v17, *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i));
        WTF::HashTable<WTF::String,WTF::String,WTF::IdentityExtractor,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::String>>::add((uint64_t *)&v22, &v17, v13, (uint64_t)v23);
        v15 = v17;
        v17 = 0;
        if (v15)
        {
          if (*(_DWORD *)v15 == 2)
            WTF::StringImpl::destroy(v15, v14);
          else
            *(_DWORD *)v15 -= 2;
        }
      }
      v10 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
    }
    while (v10);
  }
  v16 = *(_QWORD *)(*((_QWORD *)self->_page.m_ptr + 134) + 56);
  if (v16)
    WebKit::InspectorBrowserAgent::extensionsDisabled(v16, &v22);
  if (v22)
    WTF::HashTable<WTF::String,WTF::String,WTF::IdentityExtractor,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::String>>::deallocateTable(v22, v9);
}

- (_WKFrameHandle)_mainFrame
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const void *v6;
  _WKFrameHandle *v7;

  v2 = *((_QWORD *)self->_page.m_ptr + 35);
  if (!v2)
    return 0;
  v3 = *(_QWORD *)(v2 + 272);
  v4 = *(_QWORD *)(v2 + 280);
  v5 = API::Object::newObject(0x28uLL, 11);
  *(_QWORD *)v5 = off_1E34CC2A8;
  WebKit::InitializeWebKit2((WebKit *)v5);
  *(_QWORD *)v5 = &off_1E34AD1B8;
  *(_QWORD *)(v5 + 16) = v3;
  *(_QWORD *)(v5 + 24) = v4;
  *(_BYTE *)(v5 + 32) = 0;
  v6 = *(const void **)(v5 + 8);
  if (v6)
    CFRetain(*(CFTypeRef *)(v5 + 8));
  v7 = (id)CFMakeCollectable(v6);
  CFRelease(*(CFTypeRef *)(v5 + 8));
  return v7;
}

- (BOOL)_negotiatedLegacyTLS
{
  return *(_BYTE *)(*((_QWORD *)self->_page.m_ptr + 4) + 970);
}

- (BOOL)_wasPrivateRelayed
{
  return *(_BYTE *)(*((_QWORD *)self->_page.m_ptr + 4) + 971);
}

- (void)_frames:(id)a3
{
  WebPageProxy *m_ptr;
  void *v5;
  WebPageProxy *v6;
  _QWORD *v7;
  uint64_t v8;
  _QWORD *v9;

  m_ptr = self->_page.m_ptr;
  v5 = _Block_copy(a3);
  v6 = self->_page.m_ptr;
  CFRetain(*((CFTypeRef *)v6 + 1));
  v7 = (_QWORD *)WTF::fastMalloc((WTF *)0x18);
  *v7 = off_1E34BD3A0;
  v7[1] = v5;
  v7[2] = v6;
  v9 = v7;
  WebKit::WebPageProxy::getAllFrames((uint64_t)m_ptr, (uint64_t *)&v9);
  v8 = (uint64_t)v9;
  v9 = 0;
  if (v8)
    (*(void (**)(uint64_t))(*(_QWORD *)v8 + 8))(v8);
  _Block_release(0);
}

- (void)_frameTrees:(id)a3
{
  WebPageProxy *m_ptr;
  void *v5;
  WebPageProxy *v6;
  _QWORD *v7;
  _QWORD *v8;

  m_ptr = self->_page.m_ptr;
  v5 = _Block_copy(a3);
  v6 = self->_page.m_ptr;
  CFRetain(*((CFTypeRef *)v6 + 1));
  v7 = (_QWORD *)WTF::fastMalloc((WTF *)0x18);
  *v7 = off_1E34BD3C8;
  v7[1] = v5;
  v7[2] = v6;
  v8 = v7;
  WebKit::WebPageProxy::getAllFrameTrees(m_ptr, (uint64_t *)&v8);
  if (v8)
    (*(void (**)(_QWORD *))(*v8 + 8))(v8);
  _Block_release(0);
}

- (void)_setEditable:(BOOL)a3
{
  int v3;
  WebPageProxy *m_ptr;
  int v6;

  v3 = a3;
  m_ptr = self->_page.m_ptr;
  if (*((_BYTE *)m_ptr + 1290))
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("The WKWebView is suspended"));
    m_ptr = self->_page.m_ptr;
  }
  v6 = *((_BYTE *)m_ptr + 616) != 0;
  WebKit::WebPageProxy::setEditable((uint64_t)m_ptr, v3);
  if (v6 != v3)
    objc_msgSend(self->_contentView.m_ptr, "_didChangeWebViewEditability");
}

- (void)_executeEditCommand:(id)a3 argument:(id)a4 completion:(id)a5
{
  WebPageProxy *m_ptr;
  void *v9;
  _QWORD *v10;
  uint64_t v11;
  WTF::StringImpl *v12;
  WTF::StringImpl *v13;
  WTF::StringImpl *v14;
  _QWORD *v16;
  WTF::StringImpl *v17;
  WTF::StringImpl *v18;

  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((_BYTE *)m_ptr + 1290))
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("The WKWebView is suspended"));
    m_ptr = self->_page.m_ptr;
  }
  MEMORY[0x19AEABCC8](&v18, a3);
  MEMORY[0x19AEABCC8](&v17, a4);
  v9 = _Block_copy(a5);
  v10 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
  *v10 = off_1E34BD3F0;
  v10[1] = v9;
  v16 = v10;
  WebKit::WebPageProxy::executeEditCommand((uint64_t)m_ptr, &v18, (uint64_t *)&v17, (uint64_t *)&v16);
  v11 = (uint64_t)v16;
  v16 = 0;
  if (v11)
    (*(void (**)(uint64_t))(*(_QWORD *)v11 + 8))(v11);
  _Block_release(0);
  v13 = v17;
  v17 = 0;
  if (v13)
  {
    if (*(_DWORD *)v13 == 2)
      WTF::StringImpl::destroy(v13, v12);
    else
      *(_DWORD *)v13 -= 2;
  }
  v14 = v18;
  v18 = 0;
  if (v14)
  {
    if (*(_DWORD *)v14 == 2)
      WTF::StringImpl::destroy(v14, v12);
    else
      *(_DWORD *)v14 -= 2;
  }
}

- (_WKTextManipulationDelegate)_textManipulationDelegate
{
  return (_WKTextManipulationDelegate *)objc_loadWeak(&self->_textManipulationDelegate.m_weakReference);
}

- (void)_setTextManipulationDelegate:(id)a3
{
  objc_storeWeak(&self->_textManipulationDelegate.m_weakReference, a3);
}

- (void)_startTextManipulationsWithConfiguration:(id)a3 completion:(id)a4
{
  WebPageProxy *m_ptr;
  char v8;
  WebPageProxy *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  char v15;
  WTF::AtomStringImpl *v16;
  const __CFString *v17;
  __int128 v18;
  WTF::StringImpl *v19;
  WTF::AtomStringImpl *v20;
  const __CFString *v21;
  _BYTE *v22;
  WTF::StringImpl *v23;
  WTF::StringImpl *v24;
  WTF::AtomStringImpl *v25;
  const __CFString *v26;
  _BYTE *v27;
  WebPageProxy *v28;
  uint64_t v29;
  void *v30;
  _QWORD *v31;
  void *v32;
  void *v33;
  char v34;
  id v35;
  id location[2];
  uint64_t v37;
  __int128 v38;
  int v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((_BYTE *)m_ptr + 1290))
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("The WKWebView is suspended"));
  v8 = objc_msgSend(a3, "includeSubframes");
  if (objc_loadWeak(&self->_textManipulationDelegate.m_weakReference)
    && (v9 = self->_page.m_ptr) != 0
    && *((_QWORD *)v9 + 35))
  {
    v34 = v8;
    v35 = a4;
    v44 = 0;
    v45 = 0;
    if (a3)
    {
      v42 = 0u;
      v43 = 0u;
      v40 = 0u;
      v41 = 0u;
      v10 = (void *)objc_msgSend(a3, "exclusionRules");
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v40, v47, 16);
      if (v11)
      {
        v12 = *(_QWORD *)v41;
        do
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v41 != v12)
              objc_enumerationMutation(v10);
            v14 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
            v15 = objc_msgSend(v14, "isExclusion") ^ 1;
            if (objc_msgSend(v14, "attributeName"))
            {
              LOBYTE(v37) = v15;
              v16 = (WTF::AtomStringImpl *)objc_msgSend(v14, "attributeName");
              WTF::AtomStringImpl::add(v16, v17);
              location[0] = v46;
              MEMORY[0x19AEABCC8](&location[1], objc_msgSend(v14, "attributeValue"));
              v18 = *(_OWORD *)location;
              location[0] = 0;
              location[1] = 0;
              v38 = v18;
              v39 = 1;
              if (HIDWORD(v45) == (_DWORD)v45)
              {
                WTF::Vector<WebCore::TextManipulationControllerExclusionRule,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WebCore::TextManipulationControllerExclusionRule>((uint64_t)&v44, (unint64_t)&v37);
              }
              else
              {
                v22 = (_BYTE *)(v44 + 32 * HIDWORD(v45));
                *v22 = v37;
                std::__variant_detail::__move_constructor<std::__variant_detail::__traits<WebCore::TextManipulationControllerExclusionRule::ElementRule,WebCore::TextManipulationControllerExclusionRule::AttributeRule,WebCore::TextManipulationControllerExclusionRule::ClassRule>,(std::__variant_detail::_Trait)1>::__move_constructor((uint64_t)(v22 + 8), (uint64_t)&v38);
                ++HIDWORD(v45);
              }
              if (v39 != -1)
                ((void (*)(void **, __int128 *))off_1E34BCD68[v39])(&v46, &v38);
              v39 = -1;
              v23 = (WTF::StringImpl *)location[1];
              location[1] = 0;
              if (v23)
              {
                if (*(_DWORD *)v23 == 2)
                  WTF::StringImpl::destroy(v23, v19);
                else
                  *(_DWORD *)v23 -= 2;
              }
              v24 = (WTF::StringImpl *)location[0];
              location[0] = 0;
              if (v24)
              {
                if (*(_DWORD *)v24 == 2)
                  WTF::StringImpl::destroy(v24, v19);
                else
                  *(_DWORD *)v24 -= 2;
              }
              continue;
            }
            if (objc_msgSend(v14, "className"))
            {
              LOBYTE(v37) = v15;
              v20 = (WTF::AtomStringImpl *)objc_msgSend(v14, "className");
              WTF::AtomStringImpl::add(v20, v21);
              *(id *)&v38 = location[0];
              v39 = 2;
              if (HIDWORD(v45) == (_DWORD)v45)
                goto LABEL_18;
            }
            else
            {
              LOBYTE(v37) = v15;
              v25 = (WTF::AtomStringImpl *)objc_msgSend(v14, "elementName");
              WTF::AtomStringImpl::add(v25, v26);
              *(id *)&v38 = location[0];
              v39 = 0;
              if (HIDWORD(v45) == (_DWORD)v45)
              {
LABEL_18:
                WTF::Vector<WebCore::TextManipulationControllerExclusionRule,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WebCore::TextManipulationControllerExclusionRule>((uint64_t)&v44, (unint64_t)&v37);
                goto LABEL_32;
              }
            }
            v27 = (_BYTE *)(v44 + 32 * HIDWORD(v45));
            *v27 = v37;
            std::__variant_detail::__move_constructor<std::__variant_detail::__traits<WebCore::TextManipulationControllerExclusionRule::ElementRule,WebCore::TextManipulationControllerExclusionRule::AttributeRule,WebCore::TextManipulationControllerExclusionRule::ClassRule>,(std::__variant_detail::_Trait)1>::__move_constructor((uint64_t)(v27 + 8), (uint64_t)&v38);
            ++HIDWORD(v45);
LABEL_32:
            if (v39 != -1)
              ((void (*)(id *, __int128 *))off_1E34BCD68[v39])(location, &v38);
          }
          v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v40, v47, 16);
        }
        while (v11);
      }
    }
    v28 = self->_page.m_ptr;
    location[0] = 0;
    objc_initWeak(location, self);
    v29 = WTF::fastMalloc((WTF *)0x10);
    *(_QWORD *)v29 = off_1E34BD418;
    *(_QWORD *)(v29 + 8) = 0;
    objc_moveWeak((id *)(v29 + 8), location);
    v37 = v29;
    v30 = _Block_copy(v35);
    v31 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
    *v31 = off_1E34BD440;
    v31[1] = v30;
    v46 = v31;
    WebKit::WebPageProxy::startTextManipulations((uint64_t)v28, (uint64_t)&v44, v34, &v37, (uint64_t *)&v46);
    v32 = v46;
    v46 = 0;
    if (v32)
      (*(void (**)(void *))(*(_QWORD *)v32 + 8))(v32);
    _Block_release(0);
    if (v37)
      (*(void (**)(uint64_t))(*(_QWORD *)v37 + 8))(v37);
    objc_destroyWeak(location);
    WTF::Vector<WebCore::TextManipulationControllerExclusionRule,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v44, v33);
  }
  else
  {
    (*((void (**)(id))a4 + 2))(a4);
  }
}

- (void)_completeTextManipulation:(id)a3 completion:(id)a4
{
  WebPageProxy *m_ptr;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  unsigned int v13;
  WTF::StringImpl *v14;
  uint64_t v15;
  uint64_t v16;
  WTF::StringImpl *v17;
  WTF::StringImpl *v18;
  WTF::StringImpl *v19;
  uint64_t v20;
  _OWORD *v21;
  __int128 v22;
  void *v23;
  uint64_t v24;
  void *v25;
  WTF::StringImpl *v26;
  WTF::StringImpl *v27;
  void *v28;
  void *v29;
  WKWebView *v30;
  id aBlock;
  _OWORD *v32;
  int v33;
  int v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint64_t v39;
  uint64_t v40;
  NSString v41[2];
  uint64_t v42;
  char v43;
  WTF::StringImpl *v44[2];
  __int128 v45;
  _QWORD v46[6];
  char v47;
  char v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  m_ptr = self->_page.m_ptr;
  if (m_ptr
    && (!*((_BYTE *)m_ptr + 1290)
     || (objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("The WKWebView is suspended")),
         self->_page.m_ptr))
    && (objc_msgSend(a3, "identifier"), coreTextManipulationItemIdentifierFromString(v41), v43))
  {
    v30 = self;
    aBlock = a4;
    v39 = 0;
    v40 = 0;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v8 = (void *)objc_msgSend(a3, "tokens");
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v35, v49, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v36;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v36 != v10)
            objc_enumerationMutation(v8);
          v12 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
          v44[0] = (WTF::StringImpl *)objc_msgSend((id)objc_msgSend(v12, "identifier"), "longLongValue");
          MEMORY[0x19AEABCC8](&v44[1], objc_msgSend(v12, "content"));
          LOBYTE(v45) = 0;
          v47 = 0;
          v48 = 0;
          v13 = HIDWORD(v40);
          if (HIDWORD(v40) == (_DWORD)v40)
          {
            WTF::Vector<WebCore::TextManipulationToken,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WebCore::TextManipulationToken>((uint64_t)&v39, (unint64_t)v44);
          }
          else
          {
            v15 = v39;
            v16 = v39 + 96 * HIDWORD(v40);
            *(WTF::StringImpl **)v16 = v44[0];
            v17 = v44[1];
            v44[1] = 0;
            *(_QWORD *)(v16 + 8) = v17;
            std::__optional_move_base<WebCore::TextManipulationTokenInfo,false>::__optional_move_base[abi:sn180100](v16 + 16, (uint64_t)&v45);
            *(_BYTE *)(v15 + 96 * v13 + 88) = v48;
            ++HIDWORD(v40);
          }
          std::__optional_destruct_base<WebCore::TextManipulationTokenInfo,false>::~__optional_destruct_base[abi:sn180100]((uint64_t)&v45, v14);
          v19 = v44[1];
          v44[1] = 0;
          if (v19)
          {
            if (*(_DWORD *)v19 == 2)
              WTF::StringImpl::destroy(v19, v18);
            else
              *(_DWORD *)v19 -= 2;
          }
        }
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v35, v49, 16);
      }
      while (v9);
    }
    *(_OWORD *)v44 = *(_OWORD *)v41;
    LOWORD(v45) = 0;
    *((_QWORD *)&v45 + 1) = v42;
    v46[0] = v39;
    v20 = v40;
    v39 = 0;
    v40 = 0;
    v46[1] = v20;
    v21 = (_OWORD *)WTF::fastMalloc((WTF *)0x30);
    v33 = 1;
    v32 = v21;
    v22 = v45;
    *v21 = *(_OWORD *)v44;
    v21[1] = v22;
    WTF::Vector<WebCore::TextManipulationToken,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::Vector((uint64_t)(v21 + 2), (uint64_t)v46);
    v34 = 1;
    WTF::Vector<WebCore::TextManipulationToken,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)v46, v23);
    v24 = (uint64_t)v30->_page.m_ptr;
    v25 = _Block_copy(aBlock);
    v26 = (WTF::StringImpl *)WTF::fastMalloc((WTF *)0x10);
    *(_QWORD *)v26 = off_1E34BD468;
    *((_QWORD *)v26 + 1) = v25;
    v44[0] = v26;
    WebKit::WebPageProxy::completeTextManipulation(v24, (WTF *)&v32, (uint64_t *)v44);
    v27 = v44[0];
    v44[0] = 0;
    if (v27)
      (*(void (**)(WTF::StringImpl *))(*(_QWORD *)v27 + 8))(v27);
    _Block_release(0);
    WTF::Vector<WebCore::TextManipulationItem,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v32, v28);
    WTF::Vector<WebCore::TextManipulationToken,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v39, v29);
  }
  else
  {
    (*((void (**)(id, _QWORD))a4 + 2))(a4, 0);
  }
}

- (void)_completeTextManipulationForItems:(id)a3 completion:(id)a4
{
  WebPageProxy *m_ptr;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  unint64_t v12;
  unint64_t v13;
  unsigned int v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  WTF::StringImpl *v20;
  WTF::StringImpl *v21;
  WTF::StringImpl *v22;
  WTF::StringImpl *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  __int128 v28;
  uint64_t v29;
  void *v30;
  const void *v31;
  WebPageProxy *v32;
  void *v33;
  WTF::StringImpl *v34;
  WTF::StringImpl *v35;
  void *v36;
  WTF::StringImpl *v37;
  WKWebView *v38;
  id v39;
  id obj;
  uint64_t v41;
  uint64_t v42;
  __int128 v43;
  NSString v44[2];
  uint64_t v45;
  char v46;
  uint64_t v47;
  uint64_t v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  uint64_t v53;
  uint64_t v54;
  WTF::StringImpl *v55[2];
  __int128 v56;
  uint64_t v57;
  uint64_t v58;
  char v59;
  char v60;
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  m_ptr = self->_page.m_ptr;
  if (!m_ptr
    || *((_BYTE *)m_ptr + 1290)
    && (objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("The WKWebView is suspended")),
        !self->_page.m_ptr))
  {
    makeFailureSetForAllTextManipulationItems(v55, a3);
    v37 = v55[0];
    (*((void (**)(id, WTF::StringImpl *))a4 + 2))(a4, v55[0]);
    if (v37)
      CFRelease(v37);
    return;
  }
  v53 = 0;
  v54 = 0;
  v8 = objc_msgSend(a3, "count");
  if (v8)
  {
    if (v8 >= 0x5555556)
    {
      __break(0xC471u);
      goto LABEL_41;
    }
    LODWORD(v54) = 48 * (int)v8 / 0x30u;
    v53 = WTF::fastMalloc((WTF *)(48 * v8));
  }
  v38 = self;
  v39 = a4;
  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  v9 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v49, v61, 16);
  obj = a3;
  if (!v9)
    goto LABEL_27;
  v41 = *(_QWORD *)v50;
  do
  {
    v10 = 0;
    v42 = v9;
    do
    {
      if (*(_QWORD *)v50 != v41)
        objc_enumerationMutation(obj);
      v11 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * v10);
      v12 = objc_msgSend((id)objc_msgSend(v11, "tokens"), "count");
      v13 = v12;
      v47 = 0;
      v48 = 0;
      if (v12)
      {
        if (v12 < 0x2AAAAAB)
        {
          v14 = 96 * v12;
          v15 = WTF::fastMalloc((WTF *)(96 * v12));
          v16 = 0;
          LODWORD(v48) = v14 / 0x60;
          v47 = v15;
          do
          {
            v17 = (void *)objc_msgSend((id)objc_msgSend(v11, "tokens"), "objectAtIndexedSubscript:", v16);
            v55[0] = (WTF::StringImpl *)objc_msgSend((id)objc_msgSend(v17, "identifier"), "longLongValue");
            MEMORY[0x19AEABCC8](&v55[1], objc_msgSend(v17, "content"));
            LOBYTE(v56) = 0;
            v59 = 0;
            v60 = 0;
            LODWORD(v17) = HIDWORD(v48);
            v18 = v47;
            v19 = v47 + 96 * HIDWORD(v48);
            *(WTF::StringImpl **)v19 = v55[0];
            v20 = v55[1];
            v55[1] = 0;
            *(_QWORD *)(v19 + 8) = v20;
            std::__optional_move_base<WebCore::TextManipulationTokenInfo,false>::__optional_move_base[abi:sn180100](v19 + 16, (uint64_t)&v56);
            *(_BYTE *)(v18 + 96 * v17 + 88) = v60;
            ++HIDWORD(v48);
            std::__optional_destruct_base<WebCore::TextManipulationTokenInfo,false>::~__optional_destruct_base[abi:sn180100]((uint64_t)&v56, v21);
            v23 = v55[1];
            v55[1] = 0;
            if (v23)
            {
              if (*(_DWORD *)v23 == 2)
                WTF::StringImpl::destroy(v23, v22);
              else
                *(_DWORD *)v23 -= 2;
            }
            ++v16;
          }
          while (v13 != v16);
          goto LABEL_19;
        }
        __break(0xC471u);
LABEL_41:
        JUMPOUT(0x1970B9E1CLL);
      }
LABEL_19:
      objc_msgSend(v11, "identifier");
      coreTextManipulationItemIdentifierFromString(v44);
      v43 = 0uLL;
      if (v46)
      {
        v43 = *(_OWORD *)v44;
        v25 = v45;
      }
      else
      {
        v25 = 0;
      }
      *(_OWORD *)v55 = v43;
      LOWORD(v56) = 0;
      *((_QWORD *)&v56 + 1) = v25;
      v57 = v47;
      v26 = v48;
      v47 = 0;
      v48 = 0;
      v58 = v26;
      if (HIDWORD(v54) == (_DWORD)v54)
      {
        WTF::Vector<WebCore::TextManipulationItem,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WebCore::TextManipulationItem>((uint64_t)&v53, (unint64_t)v55);
      }
      else
      {
        v27 = v53 + 48 * HIDWORD(v54);
        v28 = v56;
        *(_OWORD *)v27 = *(_OWORD *)v55;
        *(_OWORD *)(v27 + 16) = v28;
        *(_QWORD *)(v27 + 32) = 0;
        *(_QWORD *)(v27 + 40) = 0;
        v29 = v57;
        v57 = 0;
        *(_QWORD *)(v27 + 32) = v29;
        LODWORD(v29) = v58;
        LODWORD(v58) = 0;
        *(_DWORD *)(v27 + 40) = v29;
        LODWORD(v29) = HIDWORD(v58);
        HIDWORD(v58) = 0;
        *(_DWORD *)(v27 + 44) = v29;
        ++HIDWORD(v54);
      }
      WTF::Vector<WebCore::TextManipulationToken,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v57, v24);
      WTF::Vector<WebCore::TextManipulationToken,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v47, v30);
      ++v10;
    }
    while (v10 != v42);
    a3 = obj;
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v61, 16);
  }
  while (v9);
LABEL_27:
  if (a3)
  {
    CFRetain(a3);
    v31 = v39;
    v32 = v38->_page.m_ptr;
    CFRetain(a3);
  }
  else
  {
    v32 = self->_page.m_ptr;
    v31 = v39;
  }
  v33 = _Block_copy(v31);
  v34 = (WTF::StringImpl *)WTF::fastMalloc((WTF *)0x18);
  *(_QWORD *)v34 = off_1E34BD490;
  *((_QWORD *)v34 + 1) = a3;
  *((_QWORD *)v34 + 2) = v33;
  v55[0] = v34;
  WebKit::WebPageProxy::completeTextManipulation((uint64_t)v32, (WTF *)&v53, (uint64_t *)v55);
  v35 = v55[0];
  v55[0] = 0;
  if (v35)
    (*(void (**)(WTF::StringImpl *))(*(_QWORD *)v35 + 8))(v35);
  _Block_release(0);
  if (a3)
    CFRelease(a3);
  WTF::Vector<WebCore::TextManipulationItem,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v53, v36);
}

- (void)_startImageAnalysis:(id)a3 target:(id)a4
{
  WebPageProxy *m_ptr;
  uint64_t v8;
  NSString *v9;
  WebPageProxy *v10;
  WTF::StringImpl *v11;
  WTF::StringImpl *v12;
  WTF::StringImpl *v13;
  WTF::StringImpl *v14;
  WTF::StringImpl *v15;

  m_ptr = self->_page.m_ptr;
  if (m_ptr)
  {
    if (!*((_BYTE *)m_ptr + 1290)
      || (objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("The WKWebView is suspended")),
          (m_ptr = self->_page.m_ptr) != 0))
    {
      v8 = *((_QWORD *)m_ptr + 28);
      {
        WebKit::WebPreferencesKey::visualTranslationEnabledKey(void)::$_0::operator() const(void)::impl += 2;
        WebKit::WebPreferencesKey::visualTranslationEnabledKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::visualTranslationEnabledKey(void)::$_0::operator() const(void)::impl;
      }
      if (WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)(v8 + 40), (WTF::StringImpl **)&WebKit::WebPreferencesKey::visualTranslationEnabledKey(void)::key, (const WTF::StringImpl *)a3)&& WebKit::languageIdentifierSupportsLiveText((WebKit *)a3, v9))
      {
        v10 = self->_page.m_ptr;
        MEMORY[0x19AEABCC8](&v15, a3);
        MEMORY[0x19AEABCC8](&v14, a4);
        WebKit::WebPageProxy::startVisualTranslation((uint64_t)v10, (const WTF::String *)&v15, (const WTF::String *)&v14);
        v12 = v14;
        v14 = 0;
        if (v12)
        {
          if (*(_DWORD *)v12 == 2)
            WTF::StringImpl::destroy(v12, v11);
          else
            *(_DWORD *)v12 -= 2;
        }
        v13 = v15;
        v15 = 0;
        if (v13)
        {
          if (*(_DWORD *)v13 == 2)
            WTF::StringImpl::destroy(v13, v11);
          else
            *(_DWORD *)v13 -= 2;
        }
      }
    }
  }
}

- (void)_dataTaskWithRequest:(id)a3 runAtForegroundPriority:(BOOL)a4 completionHandler:(id)a5
{
  _BOOL4 v6;
  WebPageProxy *m_ptr;
  void *v8;
  _QWORD *v9;
  uint64_t v10;
  CFTypeRef v11;
  _QWORD *v12;
  _BYTE v13[192];
  CFTypeRef cf;
  _BYTE v15[24];
  int v16;
  char v17;
  uint64_t v18;

  v6 = a4;
  v18 = *MEMORY[0x1E0C80C00];
  m_ptr = self->_page.m_ptr;
  MEMORY[0x19AEAEC20](v13, a3);
  v15[0] = 0;
  v17 = 0;
  v8 = _Block_copy(a5);
  v9 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
  *v9 = off_1E34BD4B8;
  v9[1] = v8;
  v12 = v9;
  WebKit::WebPageProxy::dataTaskWithRequest((uint64_t)m_ptr, (WebCore::ResourceRequestBase *)v13, (uint64_t)v15, v6, (uint64_t *)&v12);
  v10 = (uint64_t)v12;
  v12 = 0;
  if (v10)
    (*(void (**)(uint64_t))(*(_QWORD *)v10 + 8))(v10);
  _Block_release(0);
  if (v17 && v16 != -1)
    ((void (*)(_QWORD **, _BYTE *))off_1E34BCD80[v16])(&v12, v15);
  v11 = cf;
  cf = 0;
  if (v11)
    CFRelease(v11);
  WebCore::ResourceRequestBase::~ResourceRequestBase((WebCore::ResourceRequestBase *)v13);
}

- (void)_dataTaskWithRequest:(id)a3 completionHandler:(id)a4
{
  -[WKWebView _dataTaskWithRequest:runAtForegroundPriority:completionHandler:](self, "_dataTaskWithRequest:runAtForegroundPriority:completionHandler:", a3, 0, a4);
}

- (void)_takeFindStringFromSelection:(id)a3
{
  WebPageProxy *m_ptr;
  WTF::StringImpl *v4;
  WTF::StringImpl *v5;
  WTF::StringImpl *v6;
  WTF::StringImpl *v8;
  WTF::StringImpl *v9;

  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((_BYTE *)m_ptr + 1290))
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("The WKWebView is suspended"));
    m_ptr = self->_page.m_ptr;
  }
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v8 = 0;
  WebKit::WebPageProxy::executeEditCommand((WebKit::WebPageProxy *)m_ptr, &v9, (const WTF::String *)&v8);
  v5 = v8;
  v8 = 0;
  if (v5)
  {
    if (*(_DWORD *)v5 == 2)
      WTF::StringImpl::destroy(v5, v4);
    else
      *(_DWORD *)v5 -= 2;
  }
  v6 = v9;
  v9 = 0;
  if (v6)
  {
    if (*(_DWORD *)v6 == 2)
      WTF::StringImpl::destroy(v6, v4);
    else
      *(_DWORD *)v6 -= 2;
  }
}

+ (NSString)_stringForFind
{
  WTF::StringImpl *v2;
  WTF::StringImpl *v3;
  NSString *v4;

  {
    WebKit::globalStringForFind(void)::string = 0;
    return (NSString *)&stru_1E351F1B8;
  }
  v2 = (WTF::StringImpl *)WebKit::globalStringForFind(void)::string;
  if (!WebKit::globalStringForFind(void)::string)
    return (NSString *)&stru_1E351F1B8;
  *(_DWORD *)WebKit::globalStringForFind(void)::string += 2;
  v4 = (NSString *)WTF::StringImpl::operator NSString *();
  if (*(_DWORD *)v2 == 2)
    WTF::StringImpl::destroy(v2, v3);
  else
    *(_DWORD *)v2 -= 2;
  return v4;
}

+ (void)_setStringForFind:(id)a3
{
  WTF::StringImpl *v3;
  WTF::StringImpl *v4;
  WTF::StringImpl *v5;

  MEMORY[0x19AEABCC8](&v5, a3);
  {
    WebKit::globalStringForFind(void)::string = 0;
  }
  WTF::String::operator=((WTF::StringImpl **)&WebKit::globalStringForFind(void)::string, (WTF::StringImpl *)&v5);
  v4 = v5;
  v5 = 0;
  if (v4)
  {
    if (*(_DWORD *)v4 == 2)
      WTF::StringImpl::destroy(v4, v3);
    else
      *(_DWORD *)v4 -= 2;
  }
}

- (WKBrowsingContextHandle)_handle
{
  return (WKBrowsingContextHandle *)(id)CFMakeCollectable(-[WKBrowsingContextHandle _initWithPageProxy:]([WKBrowsingContextHandle alloc], "_initWithPageProxy:", self->_page.m_ptr));
}

- (WKHistoryDelegatePrivate)_historyDelegate
{
  CFTypeRef cf;

  WebKit::NavigationState::historyDelegate((id *)self->_navigationState.__ptr_.__value_, &cf);
  return (WKHistoryDelegatePrivate *)(id)CFMakeCollectable(cf);
}

- (void)_updateMediaPlaybackControlsManager
{
  WebPageProxy *m_ptr;

  m_ptr = self->_page.m_ptr;
  if (m_ptr)
  {
    if (*((_BYTE *)m_ptr + 1290))
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("The WKWebView is suspended"));
  }
}

- (BOOL)_isSuspended
{
  uint64_t v2;

  v2 = *((_QWORD *)self->_page.m_ptr + 26);
  return *(_BYTE *)(v2 + 389) && *(_QWORD *)(v2 + 224) == 0;
}

- (BOOL)_canTogglePictureInPicture
{
  return 0;
}

- (BOOL)_canToggleInWindow
{
  return 0;
}

- (BOOL)_canEnterFullscreen
{
  uint64_t v2;
  int v3;
  BOOL v4;

  v2 = *((_QWORD *)self->_page.m_ptr + 47);
  if (!v2)
    return 0;
  v3 = *(_DWORD *)(v2 + 16);
  *(_DWORD *)(v2 + 16) = v3 + 1;
  v4 = *(_QWORD *)(v2 + 48) != 0;
  if (v3)
    *(_DWORD *)(v2 + 16) = v3;
  else
    (*(void (**)(uint64_t, SEL))(*(_QWORD *)v2 + 8))(v2, a2);
  return v4;
}

- (BOOL)_isPictureInPictureActive
{
  return 0;
}

- (BOOL)_isInWindowActive
{
  return 0;
}

- (void)_togglePictureInPicture
{
  WebPageProxy *m_ptr;

  m_ptr = self->_page.m_ptr;
  if (m_ptr)
  {
    if (*((_BYTE *)m_ptr + 1290))
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("The WKWebView is suspended"));
  }
}

- (void)_nowPlayingMediaTitleAndArtist:(id)a3
{
  WebPageProxy *m_ptr;

  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((_BYTE *)m_ptr + 1290))
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("The WKWebView is suspended"));
  (*((void (**)(id, _QWORD, _QWORD))a3 + 2))(a3, 0, 0);
}

- (void)_toggleInWindow
{
  WebPageProxy *m_ptr;

  m_ptr = self->_page.m_ptr;
  if (m_ptr)
  {
    if (*((_BYTE *)m_ptr + 1290))
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("The WKWebView is suspended"));
  }
}

- (void)_enterFullscreen
{
  WebPageProxy *m_ptr;

  m_ptr = self->_page.m_ptr;
  if (m_ptr)
  {
    CFRetain(*((CFTypeRef *)m_ptr + 1));
    WebKit::WebPageProxy::enterFullscreen(m_ptr);
    CFRelease(*((CFTypeRef *)m_ptr + 1));
  }
}

- (void)_pauseAllAnimationsWithCompletionHandler:(id)a3
{
  WebPageProxy *m_ptr;
  void *v5;
  _QWORD *v6;
  uint64_t v7;
  _QWORD *v9;
  uint64_t v10;
  _QWORD *v11;

  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((_BYTE *)m_ptr + 1290))
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("The WKWebView is suspended"));
    m_ptr = self->_page.m_ptr;
    if (a3)
      goto LABEL_4;
  }
  else if (a3)
  {
LABEL_4:
    v5 = _Block_copy(a3);
    v6 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
    *v6 = off_1E34BDAC8;
    v6[1] = v5;
    v11 = v6;
    WebKit::WebPageProxy::pauseAllAnimations((uint64_t)m_ptr, (uint64_t *)&v11);
    v7 = (uint64_t)v11;
    v11 = 0;
    if (v7)
      (*(void (**)(uint64_t))(*(_QWORD *)v7 + 8))(v7);
    _Block_release(0);
    return;
  }
  v9 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
  *v9 = off_1E34BD4E0;
  v11 = v9;
  WebKit::WebPageProxy::pauseAllAnimations((uint64_t)m_ptr, (uint64_t *)&v11);
  v10 = (uint64_t)v11;
  v11 = 0;
  if (v10)
    (*(void (**)(uint64_t))(*(_QWORD *)v10 + 8))(v10);
}

- (void)_playAllAnimationsWithCompletionHandler:(id)a3
{
  WebPageProxy *m_ptr;
  void *v5;
  _QWORD *v6;
  uint64_t v7;
  _QWORD *v9;
  uint64_t v10;
  _QWORD *v11;

  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((_BYTE *)m_ptr + 1290))
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("The WKWebView is suspended"));
    m_ptr = self->_page.m_ptr;
    if (a3)
      goto LABEL_4;
  }
  else if (a3)
  {
LABEL_4:
    v5 = _Block_copy(a3);
    v6 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
    *v6 = off_1E34BDAC8;
    v6[1] = v5;
    v11 = v6;
    WebKit::WebPageProxy::playAllAnimations((uint64_t)m_ptr, (uint64_t *)&v11);
    v7 = (uint64_t)v11;
    v11 = 0;
    if (v7)
      (*(void (**)(uint64_t))(*(_QWORD *)v7 + 8))(v7);
    _Block_release(0);
    return;
  }
  v9 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
  *v9 = off_1E34BD508;
  v11 = v9;
  WebKit::WebPageProxy::playAllAnimations((uint64_t)m_ptr, (uint64_t *)&v11);
  v10 = (uint64_t)v11;
  v11 = 0;
  if (v10)
    (*(void (**)(uint64_t))(*(_QWORD *)v10 + 8))(v10);
}

- (BOOL)_allowsAnyAnimationToPlay
{
  WebPageProxy *m_ptr;

  m_ptr = self->_page.m_ptr;
  if (*((_BYTE *)m_ptr + 1290))
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("The WKWebView is suspended"));
    m_ptr = self->_page.m_ptr;
  }
  return *((_BYTE *)m_ptr + 984);
}

- (BOOL)_allowAnimationControls
{
  WebPageProxy *m_ptr;
  unsigned int (*v3)(void);
  void *v4;

  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((_BYTE *)m_ptr + 1290))
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("The WKWebView is suspended"));
  if (byte_1EE341761 == 1)
  {
    v3 = (unsigned int (*)(void))off_1EE341778;
    if (off_1EE341778)
LABEL_6:
      LOBYTE(v3) = v3() == 0;
  }
  else
  {
    if (byte_1EE341762 == 1)
    {
      v4 = (void *)qword_1EE341780;
    }
    else
    {
      v4 = dlopen("/usr/lib/libAccessibility.dylib", 2);
      qword_1EE341780 = (uint64_t)v4;
      byte_1EE341762 = 1;
    }
    v3 = (unsigned int (*)(void))dlsym(v4, "_AXSReduceMotionAutoplayAnimatedImagesEnabled");
    off_1EE341778 = v3;
    byte_1EE341761 = 1;
    if (v3)
      goto LABEL_6;
  }
  return (char)v3;
}

- (void)_setStatisticsCrossSiteLoadWithLinkDecorationForTesting:(id)a3 withToHost:(id)a4 withWasFiltered:(BOOL)a5 withCompletionHandler:(id)a6
{
  uint64_t v6;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  WTF::StringImpl *v13;
  WTF::StringImpl *v14;
  WTF::StringImpl *v15;
  WTF::StringImpl *v16;
  WTF::StringImpl *v17;
  _QWORD *v18;
  WTF::StringImpl *v19;
  WTF::StringImpl *v20[5];
  WTF::StringImpl *v21;
  WTF::StringImpl *v22[5];

  v6 = *((_QWORD *)self->_page.m_ptr + 181);
  if (v6)
  {
    MEMORY[0x19AEABCC8](&v21, a3);
    MEMORY[0x19AEABB0C](v22, &v21, 0);
    MEMORY[0x19AEABCC8](&v19, a4);
    MEMORY[0x19AEABB0C](v20, &v19, 0);
    v10 = _Block_copy(a6);
    v11 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
    *v11 = off_1E34BDAC8;
    v11[1] = v10;
    v18 = v11;
    WebKit::WebPageProxyTesting::setCrossSiteLoadWithLinkDecorationForTesting(v6, (const WTF::URL *)v22, (const WTF::URL *)v20, a5, (uint64_t *)&v18);
    v12 = (uint64_t)v18;
    v18 = 0;
    if (v12)
      (*(void (**)(uint64_t))(*(_QWORD *)v12 + 8))(v12);
    _Block_release(0);
    v14 = v20[0];
    v20[0] = 0;
    if (v14)
    {
      if (*(_DWORD *)v14 == 2)
        WTF::StringImpl::destroy(v14, v13);
      else
        *(_DWORD *)v14 -= 2;
    }
    v15 = v19;
    v19 = 0;
    if (v15)
    {
      if (*(_DWORD *)v15 == 2)
        WTF::StringImpl::destroy(v15, v13);
      else
        *(_DWORD *)v15 -= 2;
    }
    v16 = v22[0];
    v22[0] = 0;
    if (v16)
    {
      if (*(_DWORD *)v16 == 2)
        WTF::StringImpl::destroy(v16, v13);
      else
        *(_DWORD *)v16 -= 2;
    }
    v17 = v21;
    v21 = 0;
    if (v17)
    {
      if (*(_DWORD *)v17 == 2)
        WTF::StringImpl::destroy(v17, v13);
      else
        *(_DWORD *)v17 -= 2;
    }
  }
}

- (unint64_t)_mediaMutedState
{
  unint64_t v2;
  uint64_t v3;

  v2 = *(unsigned __int8 *)(*((_QWORD *)self->_page.m_ptr + 4) + 872);
  v3 = v2 & 1;
  if ((v2 & 6) != 0)
    v3 = v2 & 1 | 2;
  return v3 | (v2 >> 1) & 4;
}

- (void)_closeAllMediaPresentations
{
  WebPageProxy *m_ptr;

  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((_BYTE *)m_ptr + 1290))
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("The WKWebView is suspended"));
  -[WKWebView closeAllMediaPresentationsWithCompletionHandler:](self, "closeAllMediaPresentationsWithCompletionHandler:", &__block_literal_global_990);
}

- (void)_stopMediaCapture
{
  WebPageProxy *m_ptr;

  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((_BYTE *)m_ptr + 1290))
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("The WKWebView is suspended"));
    m_ptr = self->_page.m_ptr;
  }
  WebKit::WebPageProxy::stopMediaCapture((uint64_t)m_ptr, 4);
}

- (void)_stopAllMediaPlayback
{
  WebPageProxy *m_ptr;

  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((_BYTE *)m_ptr + 1290))
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("The WKWebView is suspended"));
  -[WKWebView pauseAllMediaPlaybackWithCompletionHandler:](self, "pauseAllMediaPlaybackWithCompletionHandler:", 0);
}

- (void)_suspendAllMediaPlayback
{
  WebPageProxy *m_ptr;

  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((_BYTE *)m_ptr + 1290))
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("The WKWebView is suspended"));
  -[WKWebView setAllMediaPlaybackSuspended:completionHandler:](self, "setAllMediaPlaybackSuspended:completionHandler:", 1, 0);
}

- (void)_resumeAllMediaPlayback
{
  WebPageProxy *m_ptr;

  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((_BYTE *)m_ptr + 1290))
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("The WKWebView is suspended"));
  -[WKWebView setAllMediaPlaybackSuspended:completionHandler:](self, "setAllMediaPlaybackSuspended:completionHandler:", 0, 0);
}

- (void)_restoreAppHighlights:(id)a3
{
  WebPageProxy *m_ptr;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14[2];
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((_BYTE *)m_ptr + 1290))
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("The WKWebView is suspended"));
  v14[0] = 0;
  v14[1] = 0;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(a3);
        convertAndAddHighlight((uint64_t)v14, *(void **)(*((_QWORD *)&v10 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
    }
    while (v6);
  }
  WebKit::WebPageProxy::restoreAppHighlightsAndScrollToIndex((uint64_t)self->_page.m_ptr, v14, 0);
  WTF::Vector<WTF::Ref<WebCore::SharedMemory,WTF::RawPtrTraits<WebCore::SharedMemory>,WTF::DefaultRefDerefTraits<WebCore::SharedMemory>>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)v14, v9);
}

- (void)_restoreAndScrollToAppHighlight:(id)a3
{
  WebPageProxy *m_ptr;
  void *v6;
  uint64_t v7[2];

  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((_BYTE *)m_ptr + 1290))
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("The WKWebView is suspended"));
  v7[0] = 0;
  v7[1] = 0;
  convertAndAddHighlight((uint64_t)v7, a3);
  WebKit::WebPageProxy::restoreAppHighlightsAndScrollToIndex((uint64_t)self->_page.m_ptr, v7, 0x100000000);
  WTF::Vector<WTF::Ref<WebCore::SharedMemory,WTF::RawPtrTraits<WebCore::SharedMemory>,WTF::DefaultRefDerefTraits<WebCore::SharedMemory>>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)v7, v6);
}

- (void)_addAppHighlight
{
  WebPageProxy *m_ptr;

  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((_BYTE *)m_ptr + 1290))
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("The WKWebView is suspended"));
  -[WKWebView _addAppHighlightInNewGroup:originatedInApp:](self, "_addAppHighlightInNewGroup:originatedInApp:", 0, 1);
}

- (void)_addAppHighlightInNewGroup:(BOOL)a3 originatedInApp:(BOOL)a4
{
  WebPageProxy *m_ptr;

  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((_BYTE *)m_ptr + 1290))
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("The WKWebView is suspended"));
    m_ptr = self->_page.m_ptr;
  }
  WebKit::WebPageProxy::createAppHighlightInSelectedRange((IPC::Encoder *)m_ptr, a3, a4);
}

- (id)_enableSourceTextAnimationAfterElementWithID:(id)a3
{
  WTF::UUID *v5;
  NSUUID *v6;
  WTF::UUID *v7;
  WebPageProxy *m_ptr;
  WTF::StringImpl *v9;
  WTF::StringImpl *v10;
  WTF::UUID *v11;
  WTF::StringImpl *v13;
  _BYTE v14[16];
  char v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = (WTF::UUID *)objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v7 = v5;
  if (v5)
    CFRetain(v5);
  WTF::UUID::fromNSUUID(v7, v6);
  if (v15)
  {
    m_ptr = self->_page.m_ptr;
    MEMORY[0x19AEABCC8](&v13, a3);
    if (!v15)
      __break(1u);
    WebKit::WebPageProxy::enableSourceTextAnimationAfterElementWithID((uint64_t)m_ptr, (const WTF::String *)&v13, (const WTF::UUID *)v14);
    v10 = v13;
    v13 = 0;
    if (v10)
    {
      if (*(_DWORD *)v10 == 2)
        WTF::StringImpl::destroy(v10, v9);
      else
        *(_DWORD *)v10 -= 2;
    }
    objc_msgSend(self->_contentView.m_ptr, "addTextAnimationForAnimationID:withStyleType:", v7, 0);
    v11 = v7;
  }
  else
  {
    v11 = 0;
  }
  if (v7)
    CFRelease(v7);
  return v11;
}

- (id)_enableFinalTextAnimationForElementWithID:(id)a3
{
  WTF::UUID *v5;
  NSUUID *v6;
  WTF::UUID *v7;
  WebPageProxy *m_ptr;
  WTF::StringImpl *v9;
  WTF::StringImpl *v10;
  WTF::UUID *v11;
  WTF::StringImpl *v13;
  _BYTE v14[16];
  char v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = (WTF::UUID *)objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v7 = v5;
  if (v5)
    CFRetain(v5);
  WTF::UUID::fromNSUUID(v7, v6);
  if (v15)
  {
    m_ptr = self->_page.m_ptr;
    MEMORY[0x19AEABCC8](&v13, a3);
    if (!v15)
      __break(1u);
    WebKit::WebPageProxy::enableTextAnimationTypeForElementWithID((uint64_t)m_ptr, (const WTF::String *)&v13, (const WTF::UUID *)v14);
    v10 = v13;
    v13 = 0;
    if (v10)
    {
      if (*(_DWORD *)v10 == 2)
        WTF::StringImpl::destroy(v10, v9);
      else
        *(_DWORD *)v10 -= 2;
    }
    objc_msgSend(self->_contentView.m_ptr, "addTextAnimationForAnimationID:withStyleType:", v7, 2);
    v11 = v7;
  }
  else
  {
    v11 = 0;
  }
  if (v7)
    CFRelease(v7);
  return v11;
}

- (void)_disableTextAnimationWithUUID:(id)a3
{
  objc_msgSend(self->_contentView.m_ptr, "removeTextAnimationForAnimationID:", a3);
}

- (void)_requestTargetedElementInfo:(id)a3 completionHandler:(id)a4
{
  WebPageProxy *m_ptr;
  void *v6;
  _QWORD *v7;
  uint64_t v8;
  _QWORD *v9;

  m_ptr = self->_page.m_ptr;
  v6 = _Block_copy(a4);
  v7 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
  *v7 = off_1E34BD530;
  v7[1] = v6;
  v9 = v7;
  WebKit::WebPageProxy::requestTargetedElement((WebKit::WebPageProxy *)m_ptr, (API::TargetedElementRequest *)((char *)a3 + 8), (uint64_t *)&v9);
  v8 = (uint64_t)v9;
  v9 = 0;
  if (v8)
    (*(void (**)(uint64_t))(*(_QWORD *)v8 + 8))(v8);
  _Block_release(0);
}

- (NSURL)_mainFrameURL
{
  if (*((_QWORD *)self->_page.m_ptr + 35))
    return (NSURL *)WTF::URL::operator NSURL *();
  else
    return 0;
}

- (void)_loadAlternateHTMLString:(id)a3 baseURL:(id)a4 forUnreachableURL:(id)a5
{
  WebPageProxy *m_ptr;
  const void *v10;
  WebPageProxy *v11;
  WTF::StringImpl *v12;
  WTF::StringImpl *v13;
  WTF::StringImpl *v14;
  WTF::StringImpl *v15;
  unsigned int *v16;
  const void *v17;
  WTF::StringImpl *v18[5];
  WTF::StringImpl *v19[5];
  WTF::StringImpl *v20;
  const void *v21;
  unsigned int *v22;

  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((_BYTE *)m_ptr + 1290))
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("The WKWebView is suspended"));
  v10 = (const void *)objc_msgSend(a3, "dataUsingEncoding:", 4);
  if (v10)
  {
    v11 = self->_page.m_ptr;
    v21 = v10;
  }
  else
  {
    v10 = (const void *)objc_msgSend(MEMORY[0x1E0C99D50], "data");
    v11 = self->_page.m_ptr;
    v21 = v10;
    if (!v10)
      goto LABEL_8;
  }
  CFRetain(v10);
LABEL_8:
  WebCore::DataSegment::create();
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v20 = v19[0];
  MEMORY[0x19AEABB18](v19, a4);
  MEMORY[0x19AEABB18](v18, a5);
  WebKit::WebPageProxy::loadAlternateHTML((uint64_t)v11, (uint64_t *)&v22, (WTF::StringImpl *)&v20, (uint64_t)v19, (uint64_t)v18, 0);
  v13 = v18[0];
  v18[0] = 0;
  if (v13)
  {
    if (*(_DWORD *)v13 == 2)
      WTF::StringImpl::destroy(v13, v12);
    else
      *(_DWORD *)v13 -= 2;
  }
  v14 = v19[0];
  v19[0] = 0;
  if (v14)
  {
    if (*(_DWORD *)v14 == 2)
      WTF::StringImpl::destroy(v14, v12);
    else
      *(_DWORD *)v14 -= 2;
  }
  v15 = v20;
  v20 = 0;
  if (v15)
  {
    if (*(_DWORD *)v15 == 2)
      WTF::StringImpl::destroy(v15, v12);
    else
      *(_DWORD *)v15 -= 2;
  }
  v16 = v22;
  v22 = 0;
  if (v16)
    WTF::ThreadSafeRefCounted<WebCore::DataSegment,(WTF::DestructionThread)0>::deref(v16, v12);
  v17 = v21;
  v21 = 0;
  if (v17)
    CFRelease(v17);
}

- (id)_loadData:(id)a3 MIMEType:(id)a4 characterEncodingName:(id)a5 baseURL:(id)a6 userData:(id)a7
{
  id v11;
  WebPageProxy *m_ptr;
  uint64_t v13;
  char isKindOfClass;
  WebKit *v15;
  uint64_t v16;
  const void *v17;
  const void *v18;
  WTF::StringImpl *v19;
  CFTypeRef v20;
  WebKit *v21;
  WTF::StringImpl *v22;
  WTF::StringImpl *v23;
  WTF::StringImpl *v24;
  CFTypeRef cf;
  WebKit *v28;
  WTF::StringImpl *v29;
  WTF::StringImpl *v30;
  WTF::StringImpl *v31;
  uint64_t v32;

  v11 = a3;
  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((_BYTE *)m_ptr + 1290))
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("The WKWebView is suspended"));
    m_ptr = self->_page.m_ptr;
    if (v11)
      goto LABEL_4;
  }
  else if (a3)
  {
LABEL_4:
    v13 = objc_msgSend(v11, "bytes");
    v11 = (id)objc_msgSend(v11, "length");
    goto LABEL_5;
  }
  v13 = 0;
LABEL_5:
  MEMORY[0x19AEABCC8](&v31, a4);
  MEMORY[0x19AEABCC8](&v30, a5);
  MEMORY[0x19AEABCC8](&v29, objc_msgSend(a6, "absoluteString"));
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) != 0)
  {
    cf = a7;
    if (a7)
      CFRetain(a7);
    API::Data::createWithoutCopying((id *)&cf, &v28);
    v15 = v28;
  }
  else
  {
    v15 = 0;
  }
  WebKit::WebPageProxy::loadData((uint64_t)m_ptr, v13, (unint64_t)v11, (WTF::StringImpl *)&v31, (WTF::StringImpl *)&v30, (WTF::StringImpl *)&v29, v15, 0, &v32);
  v16 = v32;
  if (v32)
  {
    v17 = *(const void **)(v32 + 8);
    if (v17)
    {
      CFRetain(*(CFTypeRef *)(v32 + 8));
      v18 = *(const void **)(v16 + 8);
    }
    else
    {
      v18 = 0;
    }
    CFRelease(v18);
  }
  else
  {
    v17 = 0;
  }
  v20 = (id)CFMakeCollectable(v17);
  if ((isKindOfClass & 1) != 0)
  {
    v21 = v28;
    v28 = 0;
    if (v21)
      CFRelease(*((CFTypeRef *)v21 + 1));
    if (cf)
      CFRelease(cf);
  }
  v22 = v29;
  v29 = 0;
  if (v22)
  {
    if (*(_DWORD *)v22 == 2)
      WTF::StringImpl::destroy(v22, v19);
    else
      *(_DWORD *)v22 -= 2;
  }
  v23 = v30;
  v30 = 0;
  if (v23)
  {
    if (*(_DWORD *)v23 == 2)
      WTF::StringImpl::destroy(v23, v19);
    else
      *(_DWORD *)v23 -= 2;
  }
  v24 = v31;
  v31 = 0;
  if (v24)
  {
    if (*(_DWORD *)v24 == 2)
      WTF::StringImpl::destroy(v24, v19);
    else
      *(_DWORD *)v24 -= 2;
  }
  return (id)v20;
}

- (id)_loadRequest:(id)a3 shouldOpenExternalURLs:(BOOL)a4
{
  _BOOL4 v4;
  WebPageProxy *m_ptr;

  v4 = a4;
  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((_BYTE *)m_ptr + 1290))
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("The WKWebView is suspended"));
  return -[WKWebView _loadRequest:shouldOpenExternalURLsPolicy:](self, "_loadRequest:shouldOpenExternalURLsPolicy:", a3, v4);
}

- (id)_loadRequest:(id)a3 shouldOpenExternalURLsPolicy:(int64_t)a4
{
  WebPageProxy *m_ptr;
  char v7;
  uint64_t v8;
  const void *v9;
  const void *v10;
  CFTypeRef v11;
  uint64_t v12;
  CFTypeRef v13;
  _BYTE v16[192];
  CFTypeRef cf;
  uint64_t v18;

  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((_BYTE *)m_ptr + 1290))
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("The WKWebView is suspended"));
    m_ptr = self->_page.m_ptr;
  }
  if (a4 == 2)
    v7 = 1;
  else
    v7 = 2 * (a4 == 1);
  MEMORY[0x19AEAEC20](v16, a3);
  WebKit::WebPageProxy::loadRequest((uint64_t)m_ptr, (WebCore::ResourceRequestBase *)v16, v7, 0, &v18);
  v8 = v18;
  if (v18)
  {
    v18 = 0;
    v9 = *(const void **)(v8 + 8);
    if (v9)
    {
      CFRetain(*(CFTypeRef *)(v8 + 8));
      v10 = *(const void **)(v8 + 8);
    }
    else
    {
      v10 = 0;
    }
    CFRelease(v10);
  }
  else
  {
    v9 = 0;
  }
  v11 = (id)CFMakeCollectable(v9);
  v12 = v18;
  v18 = 0;
  if (v12)
    CFRelease(*(CFTypeRef *)(v12 + 8));
  v13 = cf;
  cf = 0;
  if (v13)
    CFRelease(v13);
  WebCore::ResourceRequestBase::~ResourceRequestBase((WebCore::ResourceRequestBase *)v16);
  return (id)v11;
}

- (void)_loadAndDecodeImage:(id)a3 constrainedToSize:(CGSize)a4 maximumBytesFromNetwork:(unint64_t)a5 completionHandler:(id)a6
{
  int v10;
  uint64_t v11;
  uint64_t v12;
  WTF::StringImpl *v13;
  __int128 v14;
  WebPageProxy *m_ptr;
  _QWORD *v16;
  WTF::StringImpl *v17;
  uint64_t v18;
  WTF::StringImpl *v19;
  CFTypeRef v20;
  WTF::StringImpl *v21;
  CFTypeRef v22;
  void *aBlock;
  WTF::StringImpl *v24;
  __int128 v25;
  __int128 v26;
  _QWORD *v27;
  _BYTE v28[192];
  CFTypeRef cf;
  __int128 v30;
  __int128 v31;
  _QWORD v32[24];
  CFTypeRef v33;
  CGSize v34;

  v34 = a4;
  if (a4.height == 0.0 && a4.width == 0.0)
  {
    v10 = 0;
    v11 = 0;
  }
  else
  {
    WebCore::FloatSize::FloatSize((WebCore::FloatSize *)v32, &v34);
    v10 = 1;
    v11 = v32[0];
  }
  MEMORY[0x19AEAEC20](v32, a3);
  v12 = WebCore::ResourceRequestBase::url((WebCore::ResourceRequestBase *)v32);
  v13 = *(WTF::StringImpl **)v12;
  if (*(_QWORD *)v12)
    *(_DWORD *)v13 += 2;
  v14 = *(_OWORD *)(v12 + 24);
  v30 = *(_OWORD *)(v12 + 8);
  v31 = v14;
  m_ptr = self->_page.m_ptr;
  MEMORY[0x19AEAEC20](v28, a3);
  aBlock = _Block_copy(a6);
  if (v13)
    *(_DWORD *)v13 += 2;
  v24 = v13;
  v25 = v30;
  v26 = v31;
  v16 = (_QWORD *)WTF::fastMalloc((WTF *)0x38);
  *v16 = off_1E34BD558;
  v16[1] = aBlock;
  WTF::URL::URL((uint64_t)(v16 + 2), (uint64_t *)&v24);
  v27 = v16;
  WebKit::WebPageProxy::loadAndDecodeImage((uint64_t)m_ptr, (WTF::StringImpl *)v28, v11, v10, (WTF::StringImpl *)a5, (uint64_t *)&v27);
  v18 = (uint64_t)v27;
  v27 = 0;
  if (v18)
    (*(void (**)(uint64_t))(*(_QWORD *)v18 + 8))(v18);
  v19 = v24;
  v24 = 0;
  if (v19)
  {
    if (*(_DWORD *)v19 == 2)
      WTF::StringImpl::destroy(v19, v17);
    else
      *(_DWORD *)v19 -= 2;
  }
  _Block_release(0);
  v20 = cf;
  cf = 0;
  if (v20)
    CFRelease(v20);
  WebCore::ResourceRequestBase::~ResourceRequestBase((WebCore::ResourceRequestBase *)v28);
  if (v13)
  {
    if (*(_DWORD *)v13 == 2)
      WTF::StringImpl::destroy(v13, v21);
    else
      *(_DWORD *)v13 -= 2;
  }
  v22 = v33;
  v33 = 0;
  if (v22)
    CFRelease(v22);
  WebCore::ResourceRequestBase::~ResourceRequestBase((WebCore::ResourceRequestBase *)v32);
}

- (void)_loadServiceWorker:(id)a3 usingModules:(BOOL)a4 completionHandler:(id)a5
{
  _BOOL4 v6;
  WebPageProxy *m_ptr;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  WTF::StringImpl *v13;
  WTF::StringImpl *v14;
  _QWORD *v15;
  WTF::StringImpl *v16[5];

  v6 = a4;
  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((_BYTE *)m_ptr + 1290))
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("The WKWebView is suspended"));
    m_ptr = self->_page.m_ptr;
  }
  if (*((_BYTE *)m_ptr + 1118))
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("The WKWebView was already used to load a service worker"));
    m_ptr = self->_page.m_ptr;
  }
  MEMORY[0x19AEABB18](v16, a3);
  v10 = _Block_copy(a5);
  v11 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
  *v11 = off_1E34BD590;
  v11[1] = v10;
  v15 = v11;
  WebKit::WebPageProxy::loadServiceWorker((uint64_t)m_ptr, (WTF::URL *)v16, v6, (uint64_t *)&v15);
  v12 = (uint64_t)v15;
  v15 = 0;
  if (v12)
    (*(void (**)(uint64_t))(*(_QWORD *)v12 + 8))(v12);
  _Block_release(0);
  v14 = v16[0];
  v16[0] = 0;
  if (v14)
  {
    if (*(_DWORD *)v14 == 2)
      WTF::StringImpl::destroy(v14, v13);
    else
      *(_DWORD *)v14 -= 2;
  }
}

- (void)_loadServiceWorker:(id)a3 completionHandler:(id)a4
{
  -[WKWebView _loadServiceWorker:usingModules:completionHandler:](self, "_loadServiceWorker:usingModules:completionHandler:", a3, 0, a4);
}

- (void)_grantAccessToAssetServices
{
  WebPageProxy *m_ptr;

  m_ptr = self->_page.m_ptr;
  if (m_ptr)
  {
    if (!*((_BYTE *)m_ptr + 1290)
      || (objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("The WKWebView is suspended")),
          (m_ptr = self->_page.m_ptr) != 0))
    {
      WebKit::WebPageProxy::grantAccessToAssetServices((WebKit::WebPageProxy *)m_ptr);
    }
  }
}

- (void)_revokeAccessToAssetServices
{
  WebPageProxy *m_ptr;
  uint64_t v3;
  char v5;

  m_ptr = self->_page.m_ptr;
  if (m_ptr)
  {
    if (!*((_BYTE *)m_ptr + 1290)
      || (objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("The WKWebView is suspended")),
          (m_ptr = self->_page.m_ptr) != 0))
    {
      v3 = *((_QWORD *)m_ptr + 26);
      v5 = 0;
      WebKit::AuxiliaryProcessProxy::send<Messages::WebProcess::RevokeAccessToAssetServices>(v3, (uint64_t)&v5, 0, 0);
    }
  }
}

- (void)_disableURLSchemeCheckInDataDetectors
{
  WebPageProxy *m_ptr;
  uint64_t v3;
  char v5;

  m_ptr = self->_page.m_ptr;
  if (m_ptr)
  {
    if (!*((_BYTE *)m_ptr + 1290)
      || (objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("The WKWebView is suspended")),
          (m_ptr = self->_page.m_ptr) != 0))
    {
      v3 = *((_QWORD *)m_ptr + 26);
      v5 = 0;
      WebKit::AuxiliaryProcessProxy::send<Messages::WebProcess::DisableURLSchemeCheckInDataDetectors>(v3, (uint64_t)&v5, 0, 0);
    }
  }
}

- (void)_switchFromStaticFontRegistryToUserFontRegistry
{
  WebPageProxy *m_ptr;

  m_ptr = self->_page.m_ptr;
  if (m_ptr)
  {
    if (!*((_BYTE *)m_ptr + 1290)
      || (objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("The WKWebView is suspended")),
          (m_ptr = self->_page.m_ptr) != 0))
    {
      WebKit::WebPageProxy::switchFromStaticFontRegistryToUserFontRegistry((WebKit::WebPageProxy *)m_ptr);
    }
  }
}

- (void)_didLoadAppInitiatedRequest:(id)a3
{
  WebPageProxy *m_ptr;
  void *v5;
  _QWORD *v6;
  uint64_t v7;
  _QWORD *v9;

  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((_BYTE *)m_ptr + 1290))
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("The WKWebView is suspended"));
    m_ptr = self->_page.m_ptr;
  }
  v5 = _Block_copy(a3);
  v6 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
  *v6 = off_1E34BD5B8;
  v6[1] = v5;
  v9 = v6;
  WebKit::WebPageProxy::appPrivacyReportTestingData((uint64_t)m_ptr, (uint64_t *)&v9);
  v7 = (uint64_t)v9;
  v9 = 0;
  if (v7)
    (*(void (**)(uint64_t))(*(_QWORD *)v7 + 8))(v7);
  _Block_release(0);
}

- (void)_didLoadNonAppInitiatedRequest:(id)a3
{
  WebPageProxy *m_ptr;
  void *v5;
  _QWORD *v6;
  uint64_t v7;
  _QWORD *v9;

  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((_BYTE *)m_ptr + 1290))
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("The WKWebView is suspended"));
    m_ptr = self->_page.m_ptr;
  }
  v5 = _Block_copy(a3);
  v6 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
  *v6 = off_1E34BD5E0;
  v6[1] = v5;
  v9 = v6;
  WebKit::WebPageProxy::appPrivacyReportTestingData((uint64_t)m_ptr, (uint64_t *)&v9);
  v7 = (uint64_t)v9;
  v9 = 0;
  if (v7)
    (*(void (**)(uint64_t))(*(_QWORD *)v7 + 8))(v7);
  _Block_release(0);
}

- (void)_suspendPage:(id)a3
{
  WebPageProxy *m_ptr;
  void *v4;
  _QWORD *v5;
  uint64_t v6;
  _QWORD *v7;

  m_ptr = self->_page.m_ptr;
  if (m_ptr)
  {
    v4 = _Block_copy(a3);
    v5 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
    *v5 = off_1E34BD608;
    v5[1] = v4;
    v7 = v5;
    WebKit::WebPageProxy::suspend((uint64_t)m_ptr, (uint64_t *)&v7);
    v6 = (uint64_t)v7;
    v7 = 0;
    if (v6)
      (*(void (**)(uint64_t))(*(_QWORD *)v6 + 8))(v6);
    _Block_release(0);
  }
  else
  {
    (*((void (**)(id, _QWORD))a3 + 2))(a3, 0);
  }
}

- (void)_resumePage:(id)a3
{
  WebPageProxy *m_ptr;
  void *v4;
  _QWORD *v5;
  uint64_t v6;
  _QWORD *v7;

  m_ptr = self->_page.m_ptr;
  if (m_ptr)
  {
    v4 = _Block_copy(a3);
    v5 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
    *v5 = off_1E34BD630;
    v5[1] = v4;
    v7 = v5;
    WebKit::WebPageProxy::resume((uint64_t)m_ptr, (uint64_t *)&v7);
    v6 = (uint64_t)v7;
    v7 = 0;
    if (v6)
      (*(void (**)(uint64_t))(*(_QWORD *)v6 + 8))(v6);
    _Block_release(0);
  }
  else
  {
    (*((void (**)(id, _QWORD))a3 + 2))(a3, 0);
  }
}

- (NSArray)_certificateChain
{
  uint64_t v2;
  NSArray *result;
  NSArray *arg;

  v2 = *((_QWORD *)self->_page.m_ptr + 35);
  if (!v2)
    return 0;
  WebCore::CertificateInfo::certificateChainFromSecTrust(*(WebCore::CertificateInfo **)(v2 + 256), (__SecTrust *)a2);
  result = arg;
  if (arg)
  {
    CFAutorelease(arg);
    return arg;
  }
  return result;
}

- (NSString)_MIMEType
{
  uint64_t v2;

  v2 = *((_QWORD *)self->_page.m_ptr + 35);
  if (!v2)
    return 0;
  if (*(_QWORD *)(v2 + 224))
    return (NSString *)WTF::StringImpl::operator NSString *();
  return (NSString *)&stru_1E351F1B8;
}

- (NSString)_userAgent
{
  if (*((_QWORD *)self->_page.m_ptr + 38))
    return (NSString *)WTF::StringImpl::operator NSString *();
  else
    return (NSString *)&stru_1E351F1B8;
}

- (NSString)_applicationNameForUserAgent
{
  if (*((_QWORD *)self->_page.m_ptr + 39))
    return (NSString *)WTF::StringImpl::operator NSString *();
  else
    return (NSString *)&stru_1E351F1B8;
}

- (void)_setApplicationNameForUserAgent:(id)a3
{
  WebPageProxy *m_ptr;
  const WTF::StringImpl *v6;
  WTF::StringImpl *v7;
  WTF::StringImpl *v8;
  WebPageProxy *v9;
  WTF::StringImpl *v10;
  WTF::StringImpl *v11;
  WTF::StringImpl *v12;

  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((_BYTE *)m_ptr + 1290))
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("The WKWebView is suspended"));
    m_ptr = self->_page.m_ptr;
  }
  MEMORY[0x19AEABCC8](&v12, a3);
  WebKit::WebPageProxy::setApplicationNameForUserAgent((WTF **)m_ptr, &v12, v6);
  v8 = v12;
  v12 = 0;
  if (v8)
  {
    if (*(_DWORD *)v8 == 2)
      WTF::StringImpl::destroy(v8, v7);
    else
      *(_DWORD *)v8 -= 2;
  }
  v9 = self->_page.m_ptr;
  MEMORY[0x19AEABCC8](&v12, a3);
  WTF::String::operator=((WTF::StringImpl **)v9 + 40, (WTF::StringImpl *)&v12);
  v11 = v12;
  v12 = 0;
  if (v11)
  {
    if (*(_DWORD *)v11 == 2)
      WTF::StringImpl::destroy(v11, v10);
    else
      *(_DWORD *)v11 -= 2;
  }
}

- (BOOL)_userContentExtensionsEnabled
{
  return 1;
}

- (int)_provisionalWebProcessIdentifier
{
  int result;
  uint64_t v4;
  uint64_t v5;

  result = -[WKWebView _isValid](self, "_isValid");
  if (result)
  {
    v4 = *((_QWORD *)self->_page.m_ptr + 140);
    if (v4 && (v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v4 + 40) + 16) + 136)) != 0)
      return *(_DWORD *)(v5 + 108);
    else
      return 0;
  }
  return result;
}

- (int)_gpuProcessIdentifier
{
  int result;

  result = -[WKWebView _isValid](self, "_isValid");
  if (result)
    return WebKit::WebPageProxy::gpuProcessID((WebKit::WebPageProxy *)self->_page.m_ptr);
  return result;
}

- (int)_modelProcessIdentifier
{
  -[WKWebView _isValid](self, "_isValid");
  return 0;
}

- (BOOL)_webProcessIsResponsive
{
  uint64_t v2;

  v2 = *((_QWORD *)self->_page.m_ptr + 26);
  return *(_BYTE *)(v2 + 104) && *(_BYTE *)(v2 + 496) != 0;
}

- (void)_killWebContentProcess
{
  WebPageProxy *m_ptr;

  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((_BYTE *)m_ptr + 1290))
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("The WKWebView is suspended"));
  if (-[WKWebView _isValid](self, "_isValid"))
    (*(void (**)(_QWORD))(**((_QWORD **)self->_page.m_ptr + 26) + 80))(*((_QWORD *)self->_page.m_ptr + 26));
}

- (id)_reloadWithoutContentBlockers
{
  WebPageProxy *m_ptr;
  uint64_t v4;
  const void *v5;
  const void *v6;
  CFTypeRef v7;
  uint64_t v8;
  uint64_t v10;

  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((_BYTE *)m_ptr + 1290))
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("The WKWebView is suspended"));
    m_ptr = self->_page.m_ptr;
  }
  WebKit::WebPageProxy::reload((uint64_t)m_ptr, 4, &v10);
  v4 = v10;
  if (v10)
  {
    v10 = 0;
    v5 = *(const void **)(v4 + 8);
    if (v5)
    {
      CFRetain(*(CFTypeRef *)(v4 + 8));
      v6 = *(const void **)(v4 + 8);
    }
    else
    {
      v6 = 0;
    }
    CFRelease(v6);
  }
  else
  {
    v5 = 0;
  }
  v7 = (id)CFMakeCollectable(v5);
  v8 = v10;
  v10 = 0;
  if (v8)
    CFRelease(*(CFTypeRef *)(v8 + 8));
  return (id)v7;
}

- (id)_reloadExpiredOnly
{
  WebPageProxy *m_ptr;
  uint64_t v4;
  const void *v5;
  const void *v6;
  CFTypeRef v7;
  uint64_t v8;
  uint64_t v10;

  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((_BYTE *)m_ptr + 1290))
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("The WKWebView is suspended"));
    m_ptr = self->_page.m_ptr;
  }
  WebKit::WebPageProxy::reload((uint64_t)m_ptr, 1, &v10);
  v4 = v10;
  if (v10)
  {
    v10 = 0;
    v5 = *(const void **)(v4 + 8);
    if (v5)
    {
      CFRetain(*(CFTypeRef *)(v4 + 8));
      v6 = *(const void **)(v4 + 8);
    }
    else
    {
      v6 = 0;
    }
    CFRelease(v6);
  }
  else
  {
    v5 = 0;
  }
  v7 = (id)CFMakeCollectable(v5);
  v8 = v10;
  v10 = 0;
  if (v8)
    CFRelease(*(CFTypeRef *)(v8 + 8));
  return (id)v7;
}

- (void)_killWebContentProcessAndResetState
{
  WebPageProxy *m_ptr;
  unsigned int *v4;
  unsigned int *v5;
  unsigned int v6;
  uint64_t v7;
  unsigned int *v8;
  unsigned int *v9;
  unsigned int v10;

  m_ptr = self->_page.m_ptr;
  if (*((_BYTE *)m_ptr + 1290))
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("The WKWebView is suspended"));
    m_ptr = self->_page.m_ptr;
  }
  v4 = (unsigned int *)*((_QWORD *)m_ptr + 26);
  v5 = v4 + 4;
  do
    v6 = __ldaxr(v5);
  while (__stlxr(v6 + 1, v5));
  WebKit::WebProcessProxy::requestTermination(v4, 2);
  v7 = *((_QWORD *)self->_page.m_ptr + 140);
  if (v7)
  {
    v8 = *(unsigned int **)(*(_QWORD *)(v7 + 40) + 16);
    v9 = v8 + 4;
    do
      v10 = __ldaxr(v9);
    while (__stlxr(v10 + 1, v9));
    WebKit::WebProcessProxy::requestTermination(v8, 2);
    WTF::ThreadSafeRefCounted<WebKit::AuxiliaryProcessProxy,(WTF::DestructionThread)2>::deref(v9);
  }
  if (v4)
    WTF::ThreadSafeRefCounted<WebKit::AuxiliaryProcessProxy,(WTF::DestructionThread)2>::deref(v4 + 4);
}

- (void)_takePDFSnapshotWithConfiguration:(id)a3 completionHandler:(id)a4
{
  WebPageProxy *m_ptr;
  WKPDFConfiguration *v8;

  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((_BYTE *)m_ptr + 1290))
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("The WKWebView is suspended"));
    if (a3)
      goto LABEL_4;
  }
  else if (a3)
  {
LABEL_4:
    v8 = objc_alloc_init(WKPDFConfiguration);
    objc_msgSend(a3, "rect");
    -[WKPDFConfiguration setRect:](v8, "setRect:");
    goto LABEL_7;
  }
  v8 = 0;
LABEL_7:
  -[WKWebView createPDFWithConfiguration:completionHandler:](self, "createPDFWithConfiguration:completionHandler:", v8, a4);
  if (v8)
    CFRelease(v8);
}

- (void)_getPDFFirstPageSizeInFrame:(id)a3 completionHandler:(id)a4
{
  WebPageProxy *m_ptr;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _QWORD *v10;
  uint64_t v11;
  _QWORD *v13;
  uint64_t *v14;
  _QWORD v15[2];

  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((_BYTE *)m_ptr + 1290))
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("The WKWebView is suspended"));
    m_ptr = self->_page.m_ptr;
  }
  v8 = *((_QWORD *)a3 + 3);
  v7 = *((_QWORD *)a3 + 4);
  v9 = _Block_copy(a4);
  v10 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
  *v10 = off_1E34BD658;
  v10[1] = v9;
  v15[0] = v8;
  v15[1] = v7;
  v13 = v10;
  v14 = v15;
  WebKit::AuxiliaryProcessProxy::sendWithAsyncReply<Messages::WebPage::GetPDFFirstPageSize,WTF::CompletionHandler<void ()(WebCore::FloatSize)>>(*((_QWORD *)m_ptr + 26), &v14, (uint64_t *)&v13, *(_QWORD *)(*((_QWORD *)m_ptr + 4) + 1896), 0, 1);
  v11 = (uint64_t)v13;
  v13 = 0;
  if (v11)
    (*(void (**)(uint64_t))(*(_QWORD *)v11 + 8))(v11);
  _Block_release(0);
}

- (NSData)_sessionStateData
{
  WebPageProxy *m_ptr;
  WebKit *v3;
  const void *v4;
  const void *v5;
  WTF::StringImpl *v6;
  NSData *v7;
  WebKit *v8;
  WTF::StringImpl *v9;
  uint64_t v10;
  uint64_t v12;
  _BYTE v13[32];
  WTF::StringImpl *v14;
  WebKit *v15;

  m_ptr = self->_page.m_ptr;
  v12 = 0;
  WebKit::WebPageProxy::sessionState((uint64_t)m_ptr, &v12, (uint64_t)v13);
  WebKit::encodeLegacySessionState((WebKit *)v13, &v15);
  v3 = v15;
  if (v15)
  {
    v15 = 0;
    v4 = (const void *)*((_QWORD *)v3 + 1);
    if (v4)
    {
      CFRetain(*((CFTypeRef *)v3 + 1));
      v5 = (const void *)*((_QWORD *)v3 + 1);
    }
    else
    {
      v5 = 0;
    }
    CFRelease(v5);
  }
  else
  {
    v4 = 0;
  }
  v7 = (id)CFMakeCollectable(v4);
  v8 = v15;
  v15 = 0;
  if (v8)
    CFRelease(*((CFTypeRef *)v8 + 1));
  v9 = v14;
  v14 = 0;
  if (v9)
  {
    if (*(_DWORD *)v9 == 2)
      WTF::StringImpl::destroy(v9, v6);
    else
      *(_DWORD *)v9 -= 2;
  }
  WTF::Vector<WebKit::BackForwardListItemState,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)v13, v6);
  v10 = v12;
  v12 = 0;
  if (v10)
    (*(void (**)(uint64_t))(*(_QWORD *)v10 + 8))(v10);
  return v7;
}

- (_WKSessionState)_sessionState
{
  _WKSessionState *v3;
  WebPageProxy *m_ptr;
  WTF::StringImpl *v5;
  _WKSessionState *v6;
  WTF::StringImpl *v7;
  uint64_t v8;
  uint64_t v10;
  _BYTE v11[32];
  WTF::StringImpl *v12;

  v3 = [_WKSessionState alloc];
  m_ptr = self->_page.m_ptr;
  v10 = 0;
  WebKit::WebPageProxy::sessionState((uint64_t)m_ptr, &v10, (uint64_t)v11);
  v6 = (id)CFMakeCollectable(-[_WKSessionState _initWithSessionState:](v3, "_initWithSessionState:", v11));
  v7 = v12;
  v12 = 0;
  if (v7)
  {
    if (*(_DWORD *)v7 == 2)
      WTF::StringImpl::destroy(v7, v5);
    else
      *(_DWORD *)v7 -= 2;
  }
  WTF::Vector<WebKit::BackForwardListItemState,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)v11, v5);
  v8 = v10;
  v10 = 0;
  if (v8)
    (*(void (**)(uint64_t))(*(_QWORD *)v8 + 8))(v8);
  return v6;
}

- (id)_sessionStateWithFilter:(id)a3
{
  WebPageProxy *m_ptr;
  _QWORD *v5;
  _QWORD *v6;
  _WKSessionState *v7;
  WTF::StringImpl *v8;
  WTF::StringImpl *v9;
  CFTypeRef v10;
  WTF::StringImpl *v11;
  WTF::StringImpl *v12;
  WTF::StringImpl *v13;
  _BYTE v15[16];
  __int128 v16;
  WTF::StringImpl *v17;
  __int128 v18;
  __int128 v19;
  char v20;
  _QWORD *v21;
  _BYTE v22[16];
  __int128 v23;
  WTF::StringImpl *v24;
  __int128 v25;
  __int128 v26;
  char v27;

  m_ptr = self->_page.m_ptr;
  v5 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
  *v5 = off_1E34BD680;
  v5[1] = a3;
  v21 = v5;
  WebKit::WebPageProxy::sessionState((uint64_t)m_ptr, &v21, (uint64_t)v22);
  v6 = v21;
  v21 = 0;
  if (v6)
    (*(void (**)(_QWORD *))(*v6 + 8))(v6);
  v7 = [_WKSessionState alloc];
  WTF::Vector<WebKit::BackForwardListItemState,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::Vector((uint64_t)v15, (uint64_t)v22);
  v16 = v23;
  v8 = v24;
  if (v24)
    *(_DWORD *)v24 += 2;
  v17 = v8;
  v18 = v25;
  v19 = v26;
  v20 = v27;
  v10 = (id)CFMakeCollectable(-[_WKSessionState _initWithSessionState:](v7, "_initWithSessionState:", v15));
  v11 = v17;
  v17 = 0;
  if (v11)
  {
    if (*(_DWORD *)v11 == 2)
      WTF::StringImpl::destroy(v11, v9);
    else
      *(_DWORD *)v11 -= 2;
  }
  WTF::Vector<WebKit::BackForwardListItemState,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)v15, v9);
  v13 = v24;
  v24 = 0;
  if (v13)
  {
    if (*(_DWORD *)v13 == 2)
      WTF::StringImpl::destroy(v13, v12);
    else
      *(_DWORD *)v13 -= 2;
  }
  WTF::Vector<WebKit::BackForwardListItemState,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)v22, v12);
  return (id)v10;
}

- (void)_restoreFromSessionStateData:(id)a3
{
  WebPageProxy *m_ptr;
  uint64_t v6;
  unint64_t v7;
  WTF::StringImpl *v8;
  WebPageProxy *v9;
  uint64_t v10;
  StringImpl *v11;
  WTF::StringImpl *v12;
  uint64_t v13;
  StringImpl *v14;
  WTF::StringImpl *v15;
  SessionState v16;
  uint64_t v17;
  BackForwardListItemState *v18;
  uint64_t v19;
  __int128 v20;
  WTF::StringImpl *v21;
  __int128 v22;
  __int128 v23;
  BOOL v24;

  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((_BYTE *)m_ptr + 1290))
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("The WKWebView is suspended"));
  BYTE4(v20) = 0;
  v18 = 0;
  v19 = 0;
  LOBYTE(v20) = 0;
  WTF::URL::URL((WTF::URL *)&v21);
  v24 = 1;
  if (a3)
  {
    v6 = objc_msgSend(a3, "bytes");
    v7 = objc_msgSend(a3, "length");
  }
  else
  {
    v6 = 0;
    v7 = 0;
  }
  if ((WebKit::decodeLegacySessionState(v6, v7, (uint64_t)&v18) & 1) != 0)
  {
    v9 = self->_page.m_ptr;
    v16.backForwardListState.items.m_buffer = v18;
    v10 = v19;
    v18 = 0;
    v19 = 0;
    *(_QWORD *)&v16.backForwardListState.items.m_capacity = v10;
    *(_OWORD *)&v16.backForwardListState.currentIndex.var0.__null_state_ = v20;
    v11 = (StringImpl *)v21;
    v21 = 0;
    v16.provisionalURL.m_string.m_impl.m_ptr = v11;
    *(_OWORD *)((char *)&v16.provisionalURL + 8) = v22;
    *(_OWORD *)&v16.provisionalURL.m_hostEnd = v23;
    LODWORD(v22) = v22 & 0xFFFFFFFE;
    v16.isAppInitiated = v24;
    WebKit::WebPageProxy::restoreFromSessionState((WebKit::WebPageProxy *)v9, &v16, 1, &v17);
    v13 = v17;
    v17 = 0;
    if (v13)
      CFRelease(*(CFTypeRef *)(v13 + 8));
    v14 = v16.provisionalURL.m_string.m_impl.m_ptr;
    v16.provisionalURL.m_string.m_impl.m_ptr = 0;
    if (v14)
    {
      if (*(_DWORD *)v14 == 2)
        WTF::StringImpl::destroy((WTF::StringImpl *)v14, v12);
      else
        *(_DWORD *)v14 -= 2;
    }
    WTF::Vector<WebKit::BackForwardListItemState,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v16, v12);
  }
  v15 = v21;
  v21 = 0;
  if (v15)
  {
    if (*(_DWORD *)v15 == 2)
      WTF::StringImpl::destroy(v15, v8);
    else
      *(_DWORD *)v15 -= 2;
  }
  WTF::Vector<WebKit::BackForwardListItemState,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v18, v8);
}

- (id)_restoreSessionState:(id)a3 andNavigate:(BOOL)a4
{
  _BOOL4 v4;
  WebPageProxy *m_ptr;
  StringImpl *v7;
  __int128 v8;
  char v9;
  uint64_t v11;
  const void *v12;
  const void *v13;
  WTF::StringImpl *v14;
  CFTypeRef v15;
  uint64_t v16;
  StringImpl *v17;
  SessionState v19;
  uint64_t v20;

  v4 = a4;
  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((_BYTE *)m_ptr + 1290))
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("The WKWebView is suspended"));
    m_ptr = self->_page.m_ptr;
    if (a3)
      goto LABEL_4;
LABEL_8:
    v19.backForwardListState.currentIndex.__engaged_ = 0;
    v19.renderTreeSize = 0;
    memset(&v19, 0, 17);
    WTF::URL::URL((WTF::URL *)&v19.provisionalURL);
    v9 = 1;
    goto LABEL_9;
  }
  if (!a3)
    goto LABEL_8;
LABEL_4:
  WTF::Vector<WebKit::BackForwardListItemState,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::Vector((uint64_t)&v19, (uint64_t)a3 + 8);
  *(_OWORD *)&v19.backForwardListState.currentIndex.var0.__null_state_ = *(_OWORD *)((char *)a3 + 24);
  v7 = (StringImpl *)*((_QWORD *)a3 + 5);
  if (v7)
    *(_DWORD *)v7 += 2;
  v19.provisionalURL.m_string.m_impl.m_ptr = v7;
  v8 = *((_OWORD *)a3 + 4);
  *(_OWORD *)((char *)&v19.provisionalURL + 8) = *((_OWORD *)a3 + 3);
  *(_OWORD *)&v19.provisionalURL.m_hostEnd = v8;
  v9 = *((_BYTE *)a3 + 80);
LABEL_9:
  v19.isAppInitiated = v9;
  WebKit::WebPageProxy::restoreFromSessionState((WebKit::WebPageProxy *)m_ptr, &v19, v4, &v20);
  v11 = v20;
  if (v20)
  {
    v20 = 0;
    v12 = *(const void **)(v11 + 8);
    if (v12)
    {
      CFRetain(*(CFTypeRef *)(v11 + 8));
      v13 = *(const void **)(v11 + 8);
    }
    else
    {
      v13 = 0;
    }
    CFRelease(v13);
  }
  else
  {
    v12 = 0;
  }
  v15 = (id)CFMakeCollectable(v12);
  v16 = v20;
  v20 = 0;
  if (v16)
    CFRelease(*(CFTypeRef *)(v16 + 8));
  v17 = v19.provisionalURL.m_string.m_impl.m_ptr;
  v19.provisionalURL.m_string.m_impl.m_ptr = 0;
  if (v17)
  {
    if (*(_DWORD *)v17 == 2)
      WTF::StringImpl::destroy((WTF::StringImpl *)v17, v14);
    else
      *(_DWORD *)v17 -= 2;
  }
  WTF::Vector<WebKit::BackForwardListItemState,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v19, v14);
  return (id)v15;
}

- (void)_close
{
  WebKit::WebPageProxy::close((unsigned int *)self->_page.m_ptr);
}

- (BOOL)_tryClose
{
  WebPageProxy *m_ptr;

  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((_BYTE *)m_ptr + 1290))
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("The WKWebView is suspended"));
    m_ptr = self->_page.m_ptr;
  }
  return WebKit::WebPageProxy::tryClose((WebKit::WebPageProxy *)m_ptr);
}

- (BOOL)_isClosed
{
  return *((_BYTE *)self->_page.m_ptr + 729);
}

- (id)_insertAttachmentWithFilename:(id)a3 contentType:(id)a4 data:(id)a5 options:(id)a6 completion:(id)a7
{
  WebPageProxy *m_ptr;
  void *v13;
  const void *v14;
  id v15;

  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((_BYTE *)m_ptr + 1290))
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("The WKWebView is suspended"), a5, a6);
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3650]), "initRegularFileWithContents:", a5);
  v14 = v13;
  if (a3)
    objc_msgSend(v13, "setPreferredFilename:", a3);
  v15 = -[WKWebView _insertAttachmentWithFileWrapper:contentType:completion:](self, "_insertAttachmentWithFileWrapper:contentType:completion:", v14, a4, a7);
  if (v14)
    CFRelease(v14);
  return v15;
}

- (id)_insertAttachmentWithFileWrapper:(id)a3 contentType:(id)a4 options:(id)a5 completion:(id)a6
{
  WebPageProxy *m_ptr;

  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((_BYTE *)m_ptr + 1290))
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("The WKWebView is suspended"), a5);
  return -[WKWebView _insertAttachmentWithFileWrapper:contentType:completion:](self, "_insertAttachmentWithFileWrapper:contentType:completion:", a3, a4, a6);
}

- (id)_insertAttachmentWithFileWrapper:(id)a3 contentType:(id)a4 completion:(id)a5
{
  WKWebView *v8;
  WebPageProxy *m_ptr;
  WebKit::WebPageProxy *v10;
  CFTypeRef *v11;
  WTF::StringImpl **v12;
  WebPageProxy *v13;
  void *v14;
  _QWORD *v15;
  uint64_t v16;
  API::Attachment *v17;
  CFTypeRef v18;
  WTF::StringImpl *v19;
  WTF::StringImpl *v20;
  _QWORD *v22;
  CFTypeRef *v23;
  WTF::StringImpl *v24;

  v8 = self;
  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((_BYTE *)m_ptr + 1290))
    self = (WKWebView *)objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("The WKWebView is suspended"));
  WTF::createVersion4UUIDString((WTF *)self);
  v10 = (WebKit::WebPageProxy *)v8->_page.m_ptr;
  v11 = (CFTypeRef *)API::Object::newObject(0x48uLL, 41);
  v12 = (WTF::StringImpl **)API::Attachment::Attachment((API::Attachment *)v11, (const WTF::String *)&v24, v10);
  API::Attachment::setFileWrapperAndUpdateContentType(v12, (NSFileWrapper *)a3, (__CFString *)a4);
  v13 = v8->_page.m_ptr;
  CFRetain(v11[1]);
  v23 = v11;
  v14 = _Block_copy(a5);
  v15 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
  *v15 = off_1E34BD6A8;
  v15[1] = v14;
  v22 = v15;
  WebKit::WebPageProxy::insertAttachment(v13, (API::Attachment **)&v23, (uint64_t *)&v22);
  v16 = (uint64_t)v22;
  v22 = 0;
  if (v16)
    (*(void (**)(uint64_t))(*(_QWORD *)v16 + 8))(v16);
  _Block_release(0);
  v17 = (API::Attachment *)v23;
  v23 = 0;
  if (v17)
    CFRelease(*((CFTypeRef *)v17 + 1));
  v18 = v11[1];
  CFRelease(v18);
  v20 = v24;
  v24 = 0;
  if (v20)
  {
    if (*(_DWORD *)v20 == 2)
      WTF::StringImpl::destroy(v20, v19);
    else
      *(_DWORD *)v20 -= 2;
  }
  return (id)v18;
}

- (id)_attachmentForIdentifier:(id)a3
{
  WebPageProxy *m_ptr;
  const WTF::StringImpl *v5;
  WTF::StringImpl *v6;
  WTF::StringImpl *v7;
  const void *v8;
  WTF::StringImpl *v11;
  uint64_t v12;

  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((_BYTE *)m_ptr + 1290))
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("The WKWebView is suspended"));
    m_ptr = self->_page.m_ptr;
  }
  MEMORY[0x19AEABCC8](&v11, a3);
  WebKit::WebPageProxy::attachmentForIdentifier(m_ptr, &v11, v5, &v12);
  v7 = v11;
  v11 = 0;
  if (v7)
  {
    if (*(_DWORD *)v7 == 2)
      WTF::StringImpl::destroy(v7, v6);
    else
      *(_DWORD *)v7 -= 2;
  }
  if (!v12)
    return 0;
  v8 = *(const void **)(v12 + 8);
  CFRelease(v8);
  return (id)v8;
}

- (void)_simulateDeviceOrientationChangeWithAlpha:(double)a3 beta:(double)a4 gamma:(double)a5
{
  WebPageProxy *m_ptr;
  uint64_t v10[3];

  m_ptr = self->_page.m_ptr;
  if (*((_BYTE *)m_ptr + 1290))
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("The WKWebView is suspended"));
    m_ptr = self->_page.m_ptr;
  }
  *(double *)v10 = a3;
  *(double *)&v10[1] = a4;
  *(double *)&v10[2] = a5;
  WebKit::AuxiliaryProcessProxy::send<Messages::WebPage::SimulateDeviceOrientationChange>(*((_QWORD *)m_ptr + 26), v10, *(_QWORD *)(*((_QWORD *)m_ptr + 4) + 1896), 0);
}

- (void)_launchInitialProcessIfNecessary
{
  WebPageProxy *m_ptr;

  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((_BYTE *)m_ptr + 1290))
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("The WKWebView is suspended"));
    m_ptr = self->_page.m_ptr;
  }
  WebKit::WebPageProxy::launchInitialProcessIfNecessary((WebKit::WebProcessProxy **)m_ptr);
}

- (void)_clearBackForwardCache
{
  WebPageProxy *m_ptr;
  WebKit::WebProcessPool *v4;

  m_ptr = self->_page.m_ptr;
  if (*((_BYTE *)m_ptr + 1290))
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("The WKWebView is suspended"));
    m_ptr = self->_page.m_ptr;
  }
  v4 = API::PageConfiguration::Data::LazyInitializedRef<WebKit::WebProcessPool,&API::PageConfiguration::Data::createWebProcessPool>::get((WebKit::WebProcessPool **)(*((_QWORD *)m_ptr + 6) + 24));
  WebKit::WebBackForwardCache::removeEntriesForPage(*((WebKit::WebBackForwardCache **)v4 + 95), (WebKit::WebPageProxy *)self->_page.m_ptr);
}

+ (BOOL)_handlesSafeBrowsing
{
  return 1;
}

+ (BOOL)_willUpgradeToHTTPS:(id)a3
{
  const WTF::URL *v3;
  WTF::StringImpl *v4;
  char shouldBeMadeSecure;
  WTF::StringImpl *v6;
  WTF::StringImpl *v8[5];

  MEMORY[0x19AEABB18](v8, a3);
  shouldBeMadeSecure = WebCore::ContentExtensions::ContentExtensionsBackend::shouldBeMadeSecure((WebCore::ContentExtensions::ContentExtensionsBackend *)v8, v3);
  v6 = v8[0];
  v8[0] = 0;
  if (v6)
  {
    if (*(_DWORD *)v6 == 2)
      WTF::StringImpl::destroy(v6, v4);
    else
      *(_DWORD *)v6 -= 2;
  }
  return shouldBeMadeSecure;
}

- (void)_showSafeBrowsingWarningWithTitle:(id)a3 warning:(id)a4 details:(id)a5 completionHandler:(id)a6
{
  WebPageProxy *m_ptr;
  _QWORD v12[5];

  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((_BYTE *)m_ptr + 1290))
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("The WKWebView is suspended"));
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __92__WKWebView_WKPrivate___showSafeBrowsingWarningWithTitle_warning_details_completionHandler___block_invoke;
  v12[3] = &unk_1E34BCB98;
  v12[4] = a6;
  -[WKWebView _showSafeBrowsingWarningWithURL:title:warning:detailsWithLinks:completionHandler:](self, "_showSafeBrowsingWarningWithURL:title:warning:detailsWithLinks:completionHandler:", 0, a3, a4, a5, v12);
}

uint64_t __92__WKWebView_WKPrivate___showSafeBrowsingWarningWithTitle_warning_details_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_showSafeBrowsingWarningWithURL:(id)a3 title:(id)a4 warning:(id)a5 details:(id)a6 completionHandler:(id)a7
{
  WebPageProxy *m_ptr;
  _QWORD v13[5];

  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((_BYTE *)m_ptr + 1290))
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("The WKWebView is suspended"));
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __96__WKWebView_WKPrivate___showSafeBrowsingWarningWithURL_title_warning_details_completionHandler___block_invoke;
  v13[3] = &unk_1E34BCB98;
  v13[4] = a7;
  -[WKWebView _showSafeBrowsingWarningWithURL:title:warning:detailsWithLinks:completionHandler:](self, "_showSafeBrowsingWarningWithURL:title:warning:detailsWithLinks:completionHandler:", 0, a4, a5, a6, v13);
}

uint64_t __96__WKWebView_WKPrivate___showSafeBrowsingWarningWithURL_title_warning_details_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_showSafeBrowsingWarningWithURL:(id)a3 title:(id)a4 warning:(id)a5 detailsWithLinks:(id)a6 completionHandler:(id)a7
{
  WebPageProxy *m_ptr;
  WTF *v14;
  WTF::StringImpl *v15;
  WTF::StringImpl *v16;
  WTF::StringImpl *v17;
  WTF::StringImpl *v18;
  void *v19;
  WTF::StringImpl *v20;
  WTF::StringImpl *v21;
  WTF::StringImpl *v22;
  CFTypeRef cf;
  WTF::StringImpl *v24;
  WTF::StringImpl *v25;
  WTF::StringImpl *v26[5];

  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((_BYTE *)m_ptr + 1290))
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("The WKWebView is suspended"));
  MEMORY[0x19AEABB18](v26, a3);
  MEMORY[0x19AEABCC8](&v25, a4);
  MEMORY[0x19AEABCC8](&v24, a5);
  cf = a6;
  if (a6)
    CFRetain(a6);
  v14 = (WTF *)WTF::fastMalloc((WTF *)0x50);
  WebKit::SafeBrowsingWarning::SafeBrowsingWarning((uint64_t)v14, (uint64_t *)v26, (uint64_t *)&v25, (uint64_t *)&v24, (uint64_t *)&cf);
  if (cf)
    CFRelease(cf);
  v16 = v24;
  v24 = 0;
  if (v16)
  {
    if (*(_DWORD *)v16 == 2)
      WTF::StringImpl::destroy(v16, v15);
    else
      *(_DWORD *)v16 -= 2;
  }
  v17 = v25;
  v25 = 0;
  if (v17)
  {
    if (*(_DWORD *)v17 == 2)
      WTF::StringImpl::destroy(v17, v15);
    else
      *(_DWORD *)v17 -= 2;
  }
  v18 = v26[0];
  v26[0] = 0;
  if (v18)
  {
    if (*(_DWORD *)v18 == 2)
      WTF::StringImpl::destroy(v18, v15);
    else
      *(_DWORD *)v18 -= 2;
  }
  v19 = _Block_copy(a7);
  v20 = (WTF::StringImpl *)WTF::fastMalloc((WTF *)0x10);
  *(_QWORD *)v20 = off_1E34BD6D0;
  *((_QWORD *)v20 + 1) = v19;
  v26[0] = v20;
  -[WKWebView _showSafeBrowsingWarning:completionHandler:](self, "_showSafeBrowsingWarning:completionHandler:", v14, v26);
  v21 = v26[0];
  v26[0] = 0;
  if (v21)
    (*(void (**)(WTF::StringImpl *))(*(_QWORD *)v21 + 8))(v21);
  _Block_release(0);
  WTF::RefCounted<WebKit::SafeBrowsingWarning>::deref(v14, v22);
}

- (void)_isJITEnabled:(id)a3
{
  WebPageProxy *m_ptr;
  void *v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v10;
  char v11;

  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((_BYTE *)m_ptr + 1290))
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("The WKWebView is suspended"));
    m_ptr = self->_page.m_ptr;
  }
  v5 = _Block_copy(a3);
  v6 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
  *v6 = off_1E34BD708;
  v6[1] = v5;
  v10 = v6;
  WebKit::WebPageProxy::launchInitialProcessIfNecessary((WebKit::WebProcessProxy **)m_ptr);
  v7 = *((_QWORD *)m_ptr + 26);
  v11 = 0;
  WebKit::AuxiliaryProcessProxy::sendWithAsyncReply<Messages::WebProcess::IsJITEnabled,WTF::CompletionHandler<void ()(BOOL)>>(v7, (uint64_t)&v11, (uint64_t *)&v10, 0, 0, 1);
  v8 = (uint64_t)v10;
  v10 = 0;
  if (v8)
    (*(void (**)(uint64_t))(*(_QWORD *)v8 + 8))(v8);
  _Block_release(0);
}

- (void)_evaluateJavaScriptWithoutUserGesture:(id)a3 completionHandler:(id)a4
{
  WebPageProxy *m_ptr;

  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((_BYTE *)m_ptr + 1290))
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("The WKWebView is suspended"));
  -[WKWebView _evaluateJavaScript:asAsyncFunction:withSourceURL:withArguments:forceUserGesture:inFrame:inWorld:completionHandler:](self, "_evaluateJavaScript:asAsyncFunction:withSourceURL:withArguments:forceUserGesture:inFrame:inWorld:completionHandler:", a3, 0, 0, 0, 0, 0, +[WKContentWorld pageWorld](WKContentWorld, "pageWorld"), a4);
}

- (void)_callAsyncJavaScript:(id)a3 arguments:(id)a4 inFrame:(id)a5 inContentWorld:(id)a6 completionHandler:(id)a7
{
  WebPageProxy *m_ptr;

  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((_BYTE *)m_ptr + 1290))
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("The WKWebView is suspended"));
  -[WKWebView _evaluateJavaScript:asAsyncFunction:withSourceURL:withArguments:forceUserGesture:inFrame:inWorld:completionHandler:](self, "_evaluateJavaScript:asAsyncFunction:withSourceURL:withArguments:forceUserGesture:inFrame:inWorld:completionHandler:", a3, 1, 0, a4, 1, a5, a6, a7);
}

- (BOOL)_allMediaPresentationsClosed
{
  WebPageProxy *m_ptr;
  WebKit::VideoPresentationManagerProxy *v3;
  uint64_t v6;

  m_ptr = self->_page.m_ptr;
  v3 = (WebKit::VideoPresentationManagerProxy *)*((_QWORD *)m_ptr + 48);
  if (v3)
  {
    if (WebKit::VideoPresentationManagerProxy::hasMode(*((WebKit::VideoPresentationManagerProxy **)m_ptr + 48), 2)
      || WebKit::VideoPresentationManagerProxy::hasMode(v3, 1))
    {
      return 0;
    }
    m_ptr = self->_page.m_ptr;
  }
  v6 = *((_QWORD *)m_ptr + 45);
  if (v6)
    return (*(uint64_t (**)(_QWORD, SEL))(**(_QWORD **)(v6 + 32) + 24))(*(_QWORD *)(v6 + 32), a2) ^ 1;
  else
    return 1;
}

- (void)_evaluateJavaScript:(id)a3 inFrame:(id)a4 inContentWorld:(id)a5 completionHandler:(id)a6
{
  WebPageProxy *m_ptr;

  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((_BYTE *)m_ptr + 1290))
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("The WKWebView is suspended"));
  -[WKWebView _evaluateJavaScript:asAsyncFunction:withSourceURL:withArguments:forceUserGesture:inFrame:inWorld:completionHandler:](self, "_evaluateJavaScript:asAsyncFunction:withSourceURL:withArguments:forceUserGesture:inFrame:inWorld:completionHandler:", a3, 0, 0, 0, 1, a4, a5, a6);
}

- (void)_evaluateJavaScript:(id)a3 withSourceURL:(id)a4 inFrame:(id)a5 inContentWorld:(id)a6 completionHandler:(id)a7
{
  WebPageProxy *m_ptr;

  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((_BYTE *)m_ptr + 1290))
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("The WKWebView is suspended"));
  -[WKWebView _evaluateJavaScript:asAsyncFunction:withSourceURL:withArguments:forceUserGesture:inFrame:inWorld:completionHandler:](self, "_evaluateJavaScript:asAsyncFunction:withSourceURL:withArguments:forceUserGesture:inFrame:inWorld:completionHandler:", a3, 0, a4, 0, 1, a5, a6, a7);
}

- (void)_evaluateJavaScript:(id)a3 withSourceURL:(id)a4 inFrame:(id)a5 inContentWorld:(id)a6 withUserGesture:(BOOL)a7 completionHandler:(id)a8
{
  _BOOL8 v9;
  WebPageProxy *m_ptr;

  v9 = a7;
  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((_BYTE *)m_ptr + 1290))
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("The WKWebView is suspended"));
  -[WKWebView _evaluateJavaScript:asAsyncFunction:withSourceURL:withArguments:forceUserGesture:inFrame:inWorld:completionHandler:](self, "_evaluateJavaScript:asAsyncFunction:withSourceURL:withArguments:forceUserGesture:inFrame:inWorld:completionHandler:", a3, 0, a4, 0, v9, a5, a6, a8);
}

- (void)_updateWebpagePreferences:(id)a3
{
  WebPageProxy *m_ptr;
  uint64_t v6;
  _QWORD *v7;
  WTF::StringImpl *v8;
  _BYTE v9[112];

  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((_BYTE *)m_ptr + 1290))
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("The WKWebView is suspended"));
  v6 = objc_msgSend(a3, "_websiteDataStore");
  v7 = (_QWORD *)MEMORY[0x1E0C99778];
  if (v6)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Updating WKWebsiteDataStore is only supported during decidePolicyForNavigationAction."));
  if (objc_msgSend(a3, "_userContentController"))
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *v7, CFSTR("Updating WKUserContentController is only supported during decidePolicyForNavigationAction."));
  API::WebsitePolicies::data((API::WebsitePolicies *)((char *)a3 + 8), (uint64_t)v9);
  WebKit::WebPageProxy::updateWebsitePolicies(self->_page.m_ptr, (uint64_t)v9);
  WebKit::WebsitePoliciesData::~WebsitePoliciesData((WebKit::WebsitePoliciesData *)v9, v8);
}

- (void)_notifyUserScripts
{
  WebPageProxy *m_ptr;
  char v4;

  m_ptr = self->_page.m_ptr;
  if (*((_BYTE *)m_ptr + 1290))
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("The WKWebView is suspended"));
    m_ptr = self->_page.m_ptr;
  }
  *((_BYTE *)m_ptr + 1262) = 1;
  v4 = 0;
  WebKit::AuxiliaryProcessProxy::send<Messages::WebPage::NotifyUserScripts>(*((_QWORD *)m_ptr + 26), (uint64_t)&v4, *(_QWORD *)(*((_QWORD *)m_ptr + 4) + 1896), 0);
}

- (BOOL)_deferrableUserScriptsNeedNotification
{
  WebPageProxy *m_ptr;

  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((_BYTE *)m_ptr + 1290))
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("The WKWebView is suspended"));
    m_ptr = self->_page.m_ptr;
  }
  return *(_BYTE *)(*((_QWORD *)m_ptr + 6) + 329) && *((_BYTE *)m_ptr + 1262) == 0;
}

- (NSString)_remoteInspectionNameOverride
{
  uint64_t v2;
  WTF::StringImpl **v3;
  WTF::StringImpl *v4;
  WTF::StringImpl *v5;
  NSString *v6;

  v2 = *((_QWORD *)self->_page.m_ptr + 135);
  if (v2)
    v3 = (WTF::StringImpl **)(v2 + 48);
  else
    v3 = (WTF::StringImpl **)MEMORY[0x1E0CBF6F0];
  v4 = *v3;
  if (!*v3)
    return (NSString *)&stru_1E351F1B8;
  *(_DWORD *)v4 += 2;
  v6 = (NSString *)WTF::StringImpl::operator NSString *();
  if (*(_DWORD *)v4 == 2)
    WTF::StringImpl::destroy(v4, v5);
  else
    *(_DWORD *)v4 -= 2;
  return v6;
}

- (void)_setRemoteInspectionNameOverride:(id)a3
{
  WebPageProxy *m_ptr;
  WTF::StringImpl *v5;
  WTF::StringImpl *v6;
  WTF::StringImpl *v8;

  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((_BYTE *)m_ptr + 1290))
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("The WKWebView is suspended"));
    m_ptr = self->_page.m_ptr;
  }
  MEMORY[0x19AEABCC8](&v8, a3);
  WebKit::WebPageProxy::setRemoteInspectionNameOverride((uint64_t)m_ptr, (const WTF::String *)&v8);
  v6 = v8;
  v8 = 0;
  if (v6)
  {
    if (*(_DWORD *)v6 == 2)
      WTF::StringImpl::destroy(v6, v5);
    else
      *(_DWORD *)v6 -= 2;
  }
}

- (BOOL)_addsVisitedLinks
{
  return *((_BYTE *)self->_page.m_ptr + 825);
}

- (void)_setAddsVisitedLinks:(BOOL)a3
{
  WebPageProxy *m_ptr;

  m_ptr = self->_page.m_ptr;
  if (*((_BYTE *)m_ptr + 1290))
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("The WKWebView is suspended"));
    m_ptr = self->_page.m_ptr;
  }
  *((_BYTE *)m_ptr + 825) = a3;
}

- (BOOL)_networkRequestsInProgress
{
  return *(_BYTE *)(*((_QWORD *)self->_page.m_ptr + 4) + 1120);
}

- (void)_saveResources:(id)a3 suggestedFileName:(id)a4 completionHandler:(id)a5
{
  WebPageProxy *m_ptr;
  uint64_t v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  WTF::StringImpl *v13;
  WTF::StringImpl *v14;
  WTF::StringImpl *v15;
  _QWORD *v17;
  WTF::StringImpl *v18;
  WTF::StringImpl *v19;
  _QWORD v20[2];

  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((_BYTE *)m_ptr + 1290))
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("The WKWebView is suspended"));
    m_ptr = self->_page.m_ptr;
  }
  v9 = *((_QWORD *)m_ptr + 35);
  v20[0] = 0;
  v20[1] = 0;
  MEMORY[0x19AEABCC8](&v19, objc_msgSend(a3, "path"));
  MEMORY[0x19AEABCC8](&v18, a4);
  v10 = _Block_copy(a5);
  v11 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
  *v11 = off_1E34BD730;
  v11[1] = v10;
  v17 = v11;
  WebKit::WebPageProxy::saveResources((uint64_t)m_ptr, v9, (uint64_t)v20, (_DWORD **)&v19, &v18, (uint64_t *)&v17);
  v12 = (uint64_t)v17;
  v17 = 0;
  if (v12)
    (*(void (**)(uint64_t))(*(_QWORD *)v12 + 8))(v12);
  _Block_release(0);
  v14 = v18;
  v18 = 0;
  if (v14)
  {
    if (*(_DWORD *)v14 == 2)
      WTF::StringImpl::destroy(v14, v13);
    else
      *(_DWORD *)v14 -= 2;
  }
  v15 = v19;
  v19 = 0;
  if (v15)
  {
    if (*(_DWORD *)v15 == 2)
      WTF::StringImpl::destroy(v15, v13);
    else
      *(_DWORD *)v15 -= 2;
  }
  WTF::Vector<WebCore::MarkupExclusionRule,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)v20, v13);
}

- (void)_archiveWithConfiguration:(id)a3 completionHandler:(id)a4
{
  WebPageProxy *m_ptr;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  unsigned int v11;
  WTF::AtomStringImpl *v12;
  uint64_t v13;
  WTF::AtomStringImpl *v14;
  const __CFString *v15;
  const __CFString *v16;
  WTF::StringImpl *v17;
  int v18;
  WTF::StringImpl **v19;
  WTF::StringImpl *v20;
  WTF::StringImpl *v21;
  WTF::StringImpl *v22;
  WTF::StringImpl *v23;
  WTF::AtomStringImpl *v24;
  const __CFString *v25;
  void *v26;
  WTF::StringImpl *v27;
  uint64_t v28;
  uint64_t v29;
  WTF::StringImpl *v30;
  WTF::StringImpl *v31;
  WTF::StringImpl *v32;
  WebPageProxy *v33;
  uint64_t v34;
  void *v35;
  WTF::StringImpl *v36;
  WTF::StringImpl *v37;
  WTF::StringImpl *v38;
  WTF::StringImpl *v39;
  WTF::StringImpl *v40;
  id v43;
  WTF::StringImpl *v44;
  WTF::StringImpl *v45;
  uint64_t v46;
  WTF::StringImpl *v47;
  uint64_t v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  uint64_t v53;
  uint64_t v54;
  WTF::StringImpl *v55;
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  m_ptr = self->_page.m_ptr;
  if (!m_ptr || !*((_BYTE *)m_ptr + 1290))
  {
    if (a3)
      goto LABEL_5;
    goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("The WKWebView is suspended"));
  if (!a3)
LABEL_4:
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Configuration cannot be nil"));
LABEL_5:
  v53 = 0;
  v54 = 0;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v43 = a3;
  v6 = (void *)objc_msgSend(a3, "exclusionRules");
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v49, v56, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v50;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v50 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
        if (objc_msgSend(v10, "elementLocalName")
          || objc_msgSend(v10, "attributeLocalNames")
          && objc_msgSend((id)objc_msgSend(v10, "attributeLocalNames"), "count"))
        {
          v11 = 0;
          v47 = 0;
          v48 = 0;
          while (objc_msgSend((id)objc_msgSend(v10, "attributeLocalNames"), "count") > (unint64_t)v11)
          {
            v12 = (WTF::AtomStringImpl *)objc_msgSend((id)objc_msgSend(v10, "attributeLocalNames"), "objectAtIndex:", v11);
            v13 = objc_msgSend((id)objc_msgSend(v10, "attributeValues"), "objectAtIndex:", v11);
            if (v12)
            {
              v14 = (WTF::AtomStringImpl *)v13;
              if (!-[WTF::AtomStringImpl length](v12, "length"))
              {
                WTF::AtomStringImpl::add(v12, v15);
                v44 = v55;
                WTF::AtomStringImpl::add(v14, v16);
                v45 = v55;
                if (HIDWORD(v48) == (_DWORD)v48)
                {
                  WTF::Vector<std::pair<WTF::String,WTF::RefPtr<WebCore::SharedBuffer,WTF::RawPtrTraits<WebCore::SharedBuffer>,WTF::DefaultRefDerefTraits<WebCore::SharedBuffer>>>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,std::pair<WTF::String,WTF::RefPtr<WebCore::SharedBuffer,WTF::RawPtrTraits<WebCore::SharedBuffer>,WTF::DefaultRefDerefTraits<WebCore::SharedBuffer>>>>((uint64_t)&v47, (unint64_t)&v44);
                }
                else
                {
                  v18 = HIDWORD(v48) + 1;
                  v19 = (WTF::StringImpl **)((char *)v47 + 16 * HIDWORD(v48));
                  v20 = v44;
                  v44 = 0;
                  *v19 = v20;
                  v21 = v45;
                  v45 = 0;
                  v19[1] = v21;
                  HIDWORD(v48) = v18;
                }
                v22 = v45;
                v45 = 0;
                if (v22)
                {
                  if (*(_DWORD *)v22 == 2)
                    WTF::StringImpl::destroy(v22, v17);
                  else
                    *(_DWORD *)v22 -= 2;
                }
                v23 = v44;
                v44 = 0;
                if (v23)
                {
                  if (*(_DWORD *)v23 == 2)
                    WTF::StringImpl::destroy(v23, v17);
                  else
                    *(_DWORD *)v23 -= 2;
                }
              }
            }
            ++v11;
          }
          v24 = (WTF::AtomStringImpl *)objc_msgSend(v10, "elementLocalName");
          WTF::AtomStringImpl::add(v24, v25);
          v27 = v55;
          v44 = v55;
          v45 = v47;
          v28 = v48;
          v47 = 0;
          v48 = 0;
          v46 = v28;
          if (HIDWORD(v54) == (_DWORD)v54)
          {
            WTF::Vector<WebCore::MarkupExclusionRule,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WebCore::MarkupExclusionRule>((uint64_t)&v53, (unint64_t)&v44);
          }
          else
          {
            v29 = v53 + 24 * HIDWORD(v54);
            v44 = 0;
            *(_QWORD *)(v29 + 8) = 0;
            *(_QWORD *)(v29 + 16) = 0;
            *(_QWORD *)v29 = v27;
            v30 = v45;
            v45 = 0;
            *(_QWORD *)(v29 + 8) = v30;
            LODWORD(v30) = v46;
            LODWORD(v46) = 0;
            *(_DWORD *)(v29 + 16) = (_DWORD)v30;
            LODWORD(v30) = HIDWORD(v46);
            HIDWORD(v46) = 0;
            *(_DWORD *)(v29 + 20) = (_DWORD)v30;
            ++HIDWORD(v54);
          }
          WTF::Vector<WebCore::HTTPHeaderField,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v45, v26);
          v32 = v44;
          v44 = 0;
          if (v32)
          {
            if (*(_DWORD *)v32 == 2)
              WTF::StringImpl::destroy(v32, v31);
            else
              *(_DWORD *)v32 -= 2;
          }
          WTF::Vector<WebCore::HTTPHeaderField,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v47, v31);
        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v49, v56, 16);
    }
    while (v7);
  }
  v33 = self->_page.m_ptr;
  v34 = *((_QWORD *)v33 + 35);
  MEMORY[0x19AEABCC8](&v44, objc_msgSend((id)objc_msgSend(v43, "directory"), "path"));
  MEMORY[0x19AEABCC8](&v47, objc_msgSend(v43, "suggestedFileName"));
  v35 = _Block_copy(a4);
  v36 = (WTF::StringImpl *)WTF::fastMalloc((WTF *)0x10);
  *(_QWORD *)v36 = off_1E34BD758;
  *((_QWORD *)v36 + 1) = v35;
  v55 = v36;
  WebKit::WebPageProxy::saveResources((uint64_t)v33, v34, (uint64_t)&v53, (_DWORD **)&v44, &v47, (uint64_t *)&v55);
  v37 = v55;
  v55 = 0;
  if (v37)
    (*(void (**)(WTF::StringImpl *))(*(_QWORD *)v37 + 8))(v37);
  _Block_release(0);
  v39 = v47;
  v47 = 0;
  if (v39)
  {
    if (*(_DWORD *)v39 == 2)
      WTF::StringImpl::destroy(v39, v38);
    else
      *(_DWORD *)v39 -= 2;
  }
  v40 = v44;
  v44 = 0;
  if (v40)
  {
    if (*(_DWORD *)v40 == 2)
      WTF::StringImpl::destroy(v40, v38);
    else
      *(_DWORD *)v40 -= 2;
  }
  WTF::Vector<WebCore::MarkupExclusionRule,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v53, v38);
}

- (void)_getMainResourceDataWithCompletionHandler:(id)a3
{
  WebPageProxy *m_ptr;
  uint64_t v5;
  void *v6;
  _QWORD *v7;
  uint64_t v8;
  _QWORD *v10;

  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((_BYTE *)m_ptr + 1290))
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("The WKWebView is suspended"));
    m_ptr = self->_page.m_ptr;
  }
  v5 = *((_QWORD *)m_ptr + 35);
  v6 = _Block_copy(a3);
  v7 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
  *v7 = off_1E34BD780;
  v7[1] = v6;
  v10 = v7;
  WebKit::WebPageProxy::getMainResourceDataOfFrame((uint64_t)m_ptr, v5, (uint64_t *)&v10);
  v8 = (uint64_t)v10;
  v10 = 0;
  if (v8)
    (*(void (**)(uint64_t))(*(_QWORD *)v8 + 8))(v8);
  _Block_release(0);
}

- (void)_getWebArchiveDataWithCompletionHandler:(id)a3
{
  WebPageProxy *m_ptr;

  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((_BYTE *)m_ptr + 1290))
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("The WKWebView is suspended"));
  -[WKWebView createWebArchiveDataWithCompletionHandler:](self, "createWebArchiveDataWithCompletionHandler:", a3);
}

- (void)_getContentsAsStringWithCompletionHandler:(id)a3
{
  WebPageProxy *m_ptr;
  void *v5;
  _QWORD *v6;
  uint64_t v7;
  _QWORD *v9;
  char v10;

  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((_BYTE *)m_ptr + 1290))
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("The WKWebView is suspended"));
    m_ptr = self->_page.m_ptr;
  }
  v5 = _Block_copy(a3);
  v6 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
  *v6 = off_1E34BD7A8;
  v6[1] = v5;
  v9 = v6;
  v10 = 0;
  WebKit::AuxiliaryProcessProxy::sendWithAsyncReply<Messages::WebPage::GetContentsAsString,WTF::CompletionHandler<void ()(WTF::String const&)>>(*((_QWORD *)m_ptr + 26), &v10, (uint64_t *)&v9, *(_QWORD *)(*((_QWORD *)m_ptr + 4) + 1896), 0, 1);
  v7 = (uint64_t)v9;
  v9 = 0;
  if (v7)
    (*(void (**)(uint64_t))(*(_QWORD *)v7 + 8))(v7);
  _Block_release(0);
}

- (void)_getContentsAsStringWithCompletionHandlerKeepIPCConnectionAliveForTesting:(id)a3
{
  WebPageProxy *m_ptr;
  unsigned __int8 **v6;
  unsigned __int8 *v7;
  int v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;
  __int128 v13;
  uint64_t v14;
  char v15;

  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((_BYTE *)m_ptr + 1290))
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("The WKWebView is suspended"));
    m_ptr = self->_page.m_ptr;
  }
  *(_QWORD *)&v13 = _Block_copy(a3);
  v6 = *(unsigned __int8 ***)(*((_QWORD *)self->_page.m_ptr + 26) + 144);
  if (v6)
  {
    v7 = *v6;
    if (__ldaxr(*v6))
    {
      __clrex();
    }
    else if (!__stxr(1u, v7))
    {
      goto LABEL_9;
    }
    MEMORY[0x19AEABB3C](v7);
LABEL_9:
    ++*((_QWORD *)v7 + 1);
    v9 = __ldxr(v7);
    if (v9 == 1)
    {
      if (!__stlxr(0, v7))
        goto LABEL_14;
    }
    else
    {
      __clrex();
    }
    WTF::Lock::unlockSlow((WTF::Lock *)v7);
  }
LABEL_14:
  *((_QWORD *)&v13 + 1) = v6;
  v10 = WTF::fastMalloc((WTF *)0x18);
  *(_QWORD *)v10 = off_1E34BD7D0;
  v11 = v13;
  v13 = 0uLL;
  *(_OWORD *)(v10 + 8) = v11;
  v14 = v10;
  v15 = 0;
  WebKit::AuxiliaryProcessProxy::sendWithAsyncReply<Messages::WebPage::GetContentsAsString,WTF::CompletionHandler<void ()(WTF::String const&)>>(*((_QWORD *)m_ptr + 26), &v15, &v14, *(_QWORD *)(*((_QWORD *)m_ptr + 4) + 1896), 0, 1);
  v12 = v14;
  v14 = 0;
  if (v12)
    (*(void (**)(uint64_t))(*(_QWORD *)v12 + 8))(v12);
  -[WKWebView(WKPrivate) _getContentsAsStringWithCompletionHandlerKeepIPCConnectionAliveForTesting:]::$_65::~$_65((uint64_t)&v13);
}

- (void)_getContentsOfAllFramesAsStringWithCompletionHandler:(id)a3
{
  WebPageProxy *m_ptr;
  void *v5;
  _QWORD *v6;
  uint64_t v7;
  _QWORD *v9;
  char v10;

  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((_BYTE *)m_ptr + 1290))
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("The WKWebView is suspended"));
    m_ptr = self->_page.m_ptr;
  }
  v5 = _Block_copy(a3);
  v6 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
  *v6 = off_1E34BD7F8;
  v6[1] = v5;
  v9 = v6;
  v10 = 1;
  WebKit::AuxiliaryProcessProxy::sendWithAsyncReply<Messages::WebPage::GetContentsAsString,WTF::CompletionHandler<void ()(WTF::String const&)>>(*((_QWORD *)m_ptr + 26), &v10, (uint64_t *)&v9, *(_QWORD *)(*((_QWORD *)m_ptr + 4) + 1896), 0, 1);
  v7 = (uint64_t)v9;
  v9 = 0;
  if (v7)
    (*(void (**)(uint64_t))(*(_QWORD *)v7 + 8))(v7);
  _Block_release(0);
}

- (void)_getContentsAsAttributedStringWithCompletionHandler:(id)a3
{
  WebPageProxy *m_ptr;
  void *v5;
  _QWORD *v6;
  _QWORD *v8;

  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((_BYTE *)m_ptr + 1290))
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("The WKWebView is suspended"));
    m_ptr = self->_page.m_ptr;
  }
  v5 = _Block_copy(a3);
  v6 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
  *v6 = off_1E34BD820;
  v6[1] = v5;
  v8 = v6;
  WebKit::WebPageProxy::getContentsAsAttributedString((uint64_t)m_ptr, (uint64_t *)&v8);
  if (v8)
    (*(void (**)(_QWORD *))(*v8 + 8))(v8);
  _Block_release(0);
}

- (void)_getApplicationManifestWithCompletionHandler:(id)a3
{
  WebPageProxy *m_ptr;
  void *v5;
  _QWORD *v6;
  uint64_t v7;
  _QWORD *v9;
  char v10;

  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((_BYTE *)m_ptr + 1290))
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("The WKWebView is suspended"));
    m_ptr = self->_page.m_ptr;
  }
  v5 = _Block_copy(a3);
  v6 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
  *v6 = off_1E34BD848;
  v6[1] = v5;
  v9 = v6;
  v10 = 0;
  WebKit::AuxiliaryProcessProxy::sendWithAsyncReply<Messages::WebPage::GetApplicationManifest,WTF::CompletionHandler<void ()(std::optional<WebCore::ApplicationManifest> const&)>>(*((_QWORD *)m_ptr + 26), (uint64_t)&v10, (uint64_t *)&v9, *(_QWORD *)(*((_QWORD *)m_ptr + 4) + 1896), 0, 1);
  v7 = (uint64_t)v9;
  v9 = 0;
  if (v7)
    (*(void (**)(uint64_t))(*(_QWORD *)v7 + 8))(v7);
  _Block_release(0);
}

- (void)_getTextFragmentMatchWithCompletionHandler:(id)a3
{
  WebPageProxy *m_ptr;
  void *v5;
  _QWORD *v6;
  uint64_t v7;
  _QWORD *v9;
  char v10;

  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((_BYTE *)m_ptr + 1290))
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("The WKWebView is suspended"));
    m_ptr = self->_page.m_ptr;
  }
  v5 = _Block_copy(a3);
  v6 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
  *v6 = off_1E34BD870;
  v6[1] = v5;
  v9 = v6;
  v10 = 0;
  WebKit::AuxiliaryProcessProxy::sendWithAsyncReply<Messages::WebPage::GetTextFragmentMatch,WTF::CompletionHandler<void ()(WTF::String const&)>>(*((_QWORD *)m_ptr + 26), (uint64_t)&v10, (uint64_t *)&v9, *(_QWORD *)(*((_QWORD *)m_ptr + 4) + 1896), 0, 1);
  v7 = (uint64_t)v9;
  v9 = 0;
  if (v7)
    (*(void (**)(uint64_t))(*(_QWORD *)v7 + 8))(v7);
  _Block_release(0);
}

- (int64_t)_paginationMode
{
  if (((*((_BYTE *)self->_page.m_ptr + 709) - 1) & 0xFC) != 0)
    return 0;
  else
    return (*((_BYTE *)self->_page.m_ptr + 709) - 1) + 1;
}

- (void)_setPaginationMode:(int64_t)a3
{
  WebPageProxy *m_ptr;

  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((_BYTE *)m_ptr + 1290))
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("The WKWebView is suspended"));
  if ((unint64_t)a3 <= 4)
    WebKit::WebPageProxy::setPaginationMode((uint64_t)self->_page.m_ptr, a3);
}

- (BOOL)_paginationBehavesLikeColumns
{
  return *((_BYTE *)self->_page.m_ptr + 710);
}

- (void)_setPaginationBehavesLikeColumns:(BOOL)a3
{
  _BOOL4 v3;
  WebPageProxy *m_ptr;

  v3 = a3;
  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((_BYTE *)m_ptr + 1290))
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("The WKWebView is suspended"));
    m_ptr = self->_page.m_ptr;
  }
  WebKit::WebPageProxy::setPaginationBehavesLikeColumns((uint64_t)m_ptr, v3);
}

- (double)_pageLength
{
  return *((double *)self->_page.m_ptr + 89);
}

- (void)_setPageLength:(double)a3
{
  WebPageProxy *m_ptr;

  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((_BYTE *)m_ptr + 1290))
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("The WKWebView is suspended"));
    m_ptr = self->_page.m_ptr;
  }
  WebKit::WebPageProxy::setPageLength((uint64_t)m_ptr, a3);
}

- (double)_gapBetweenPages
{
  return *((double *)self->_page.m_ptr + 90);
}

- (void)_setGapBetweenPages:(double)a3
{
  WebPageProxy *m_ptr;

  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((_BYTE *)m_ptr + 1290))
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("The WKWebView is suspended"));
    m_ptr = self->_page.m_ptr;
  }
  WebKit::WebPageProxy::setGapBetweenPages((uint64_t)m_ptr, a3);
}

- (BOOL)_paginationLineGridEnabled
{
  return 0;
}

- (unint64_t)_pageCount
{
  return *((unsigned int *)self->_page.m_ptr + 215);
}

- (BOOL)_supportsTextZoom
{
  uint64_t v2;

  v2 = *((_QWORD *)self->_page.m_ptr + 35);
  if (v2)
    return WebCore::Image::supportsType((WebCore::Image *)(v2 + 224), (const WTF::String *)a2) ^ 1;
  else
    return 0;
}

- (double)_textZoomFactor
{
  return *((double *)self->_page.m_ptr + 78);
}

- (void)_setTextZoomFactor:(double)a3
{
  WebPageProxy *m_ptr;

  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((_BYTE *)m_ptr + 1290))
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("The WKWebView is suspended"));
    m_ptr = self->_page.m_ptr;
  }
  WebKit::WebPageProxy::setTextZoomFactor((uint64_t)m_ptr, a3);
}

- (void)_setPageZoomFactor:(double)a3
{
  WebPageProxy *m_ptr;

  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((_BYTE *)m_ptr + 1290))
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("The WKWebView is suspended"));
  -[WKWebView setPageZoom:](self, "setPageZoom:", a3);
}

- (_WKDiagnosticLoggingDelegate)_diagnosticLoggingDelegate
{
  _WKDiagnosticLoggingDelegate *result;
  CFTypeRef cf;

  result = (_WKDiagnosticLoggingDelegate *)*((_QWORD *)self->_page.m_ptr + 16);
  if (result)
  {
    WebKit::DiagnosticLoggingClient::delegate((id *)result, &cf);
    return (_WKDiagnosticLoggingDelegate *)(id)CFMakeCollectable(cf);
  }
  return result;
}

- (_WKFindDelegate)_findDelegate
{
  CFTypeRef cf;

  WebKit::DiagnosticLoggingClient::delegate(*((id **)self->_page.m_ptr + 14), &cf);
  return (_WKFindDelegate *)(id)CFMakeCollectable(cf);
}

- (void)_setFindDelegate:(id)a3
{
  WebKit::FindClient::setDelegate(*((_QWORD *)self->_page.m_ptr + 14), a3);
}

- (void)_countStringMatches:(id)a3 options:(unint64_t)a4 maxCount:(unint64_t)a5
{
  WebPageProxy *m_ptr;
  void *v10;
  WebPageProxy *v11;
  WTF::StringImpl *v12;
  WTF::StringImpl *v13;
  WTF::StringImpl *v14;

  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((_BYTE *)m_ptr + 1290))
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("The WKWebView is suspended"));
  v10 = self->_customContentView.m_ptr;
  if (v10)
  {
    objc_msgSend(v10, "web_countStringMatches:options:maxCount:", a3, a4, a5);
  }
  else
  {
    v11 = self->_page.m_ptr;
    MEMORY[0x19AEABCC8](&v14, a3);
    WebKit::WebPageProxy::countStringMatches((uint64_t)v11, &v14, a4 | (((a4 >> 8) & 1) << 9) | (a4 >> 1) & 0x100, a5);
    v13 = v14;
    v14 = 0;
    if (v13)
    {
      if (*(_DWORD *)v13 == 2)
        WTF::StringImpl::destroy(v13, v12);
      else
        *(_DWORD *)v13 -= 2;
    }
  }
}

- (void)_findString:(id)a3 options:(unint64_t)a4 maxCount:(unint64_t)a5
{
  WebPageProxy *m_ptr;
  WTF::StringImpl *v10;
  WTF::StringImpl *v11;
  void *v12;
  WebPageProxy *v13;
  WTF::StringImpl *v14;
  WTF::StringImpl *v15;
  WTF::StringImpl *v16;

  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((_BYTE *)m_ptr + 1290))
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("The WKWebView is suspended"));
  MEMORY[0x19AEABCC8](&v16, a3);
  {
    WebKit::globalStringForFind(void)::string = 0;
  }
  WTF::String::operator=((WTF::StringImpl **)&WebKit::globalStringForFind(void)::string, (WTF::StringImpl *)&v16);
  v11 = v16;
  v16 = 0;
  if (v11)
  {
    if (*(_DWORD *)v11 == 2)
      WTF::StringImpl::destroy(v11, v10);
    else
      *(_DWORD *)v11 -= 2;
  }
  v12 = self->_customContentView.m_ptr;
  if (v12)
  {
    objc_msgSend(v12, "web_findString:options:maxCount:", a3, a4, a5);
  }
  else
  {
    v13 = self->_page.m_ptr;
    MEMORY[0x19AEABCC8](&v16, a3);
    WebKit::WebPageProxy::findString((uint64_t)v13, &v16, a4 | (((a4 >> 8) & 1) << 9) | (a4 >> 1) & 0x100, a5);
    v15 = v16;
    v16 = 0;
    if (v15)
    {
      if (*(_DWORD *)v15 == 2)
        WTF::StringImpl::destroy(v15, v14);
      else
        *(_DWORD *)v15 -= 2;
    }
  }
}

- (void)_hideFindUI
{
  WebPageProxy *m_ptr;
  void *v4;
  WebPageProxy *v5;
  char v6;

  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((_BYTE *)m_ptr + 1290))
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("The WKWebView is suspended"));
  v4 = self->_customContentView.m_ptr;
  if (v4)
  {
    objc_msgSend(v4, "web_hideFindUI");
  }
  else
  {
    v5 = self->_page.m_ptr;
    v6 = 0;
    WebKit::AuxiliaryProcessProxy::send<Messages::WebPage::HideFindUI>(*((_QWORD *)v5 + 26), (uint64_t)&v6, *(_QWORD *)(*((_QWORD *)v5 + 4) + 1896), 0);
  }
}

- (void)_saveBackForwardSnapshotForItem:(id)a3
{
  WebPageProxy *m_ptr;
  WebPageProxy *v6;
  WTF::StringImpl **v7;

  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((_BYTE *)m_ptr + 1290))
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("The WKWebView is suspended"));
    if (!a3)
      return;
  }
  else if (!a3)
  {
    return;
  }
  v6 = self->_page.m_ptr;
  v7 = (WTF::StringImpl **)objc_msgSend(a3, "_item");
  if (*((_BYTE *)v6 + 855))
  {
    {
      byte_1ECE738C8 = 0;
      WebKit::ViewSnapshotStore::singleton(void)::store = 0u;
      *(_OWORD *)&qword_1ECE738B8 = 0u;
    }
    WebKit::ViewSnapshotStore::recordSnapshot((WebKit::ViewSnapshot *)&WebKit::ViewSnapshotStore::singleton(void)::store, (WebKit::WebPageProxy *)v6, v7);
  }
}

- (void)_serviceWorkersEnabled:(id)a3
{
  uint64_t v4;
  const WTF::StringImpl *v5;
  uint64_t BoolValueForKey;

  v4 = objc_msgSend(self->_configuration.m_ptr, "preferences");
  {
    WebKit::WebPreferencesKey::serviceWorkersEnabledKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::serviceWorkersEnabledKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::serviceWorkersEnabledKey(void)::$_0::operator() const(void)::impl;
  }
  BoolValueForKey = WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)(v4 + 48), (WTF::StringImpl **)&WebKit::WebPreferencesKey::serviceWorkersEnabledKey(void)::key, v5);
  (*((void (**)(id, uint64_t))a3 + 2))(a3, BoolValueForKey);
}

- (void)_clearServiceWorkerEntitlementOverride:(id)a3
{
  WebPageProxy *m_ptr;
  void *v5;
  _QWORD *v6;
  uint64_t v7;
  _QWORD *v9;

  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((_BYTE *)m_ptr + 1290))
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("The WKWebView is suspended"));
    m_ptr = self->_page.m_ptr;
  }
  v5 = _Block_copy(a3);
  v6 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
  *v6 = off_1E34BD898;
  v6[1] = v5;
  v9 = v6;
  WebKit::WebPageProxy::clearServiceWorkerEntitlementOverride((uint64_t)m_ptr, (uint64_t *)&v9);
  v7 = (uint64_t)v9;
  v9 = 0;
  if (v7)
    (*(void (**)(uint64_t))(*(_QWORD *)v7 + 8))(v7);
  _Block_release(0);
}

- (void)_preconnectToServer:(id)a3
{
  WebPageProxy *m_ptr;
  WTF::StringImpl *v6;
  WTF::StringImpl *v7;
  WTF::StringImpl *v8;
  int v9;
  CFTypeRef v10;
  WTF::StringImpl *v11[5];
  _BYTE v12[192];
  CFTypeRef cf;

  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((_BYTE *)m_ptr + 1290))
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("The WKWebView is suspended"));
  MEMORY[0x19AEABB18](v11, a3);
  WebCore::ResourceRequestBase::ResourceRequestBase((uint64_t)v12, (const WTF::URL *)v11, 0);
  cf = 0;
  v7 = v11[0];
  v11[0] = 0;
  if (v7)
  {
    if (*(_DWORD *)v7 == 2)
      WTF::StringImpl::destroy(v7, v6);
    else
      *(_DWORD *)v7 -= 2;
  }
  v8 = (WTF::StringImpl *)*((_QWORD *)self->_page.m_ptr + 38);
  if (v8)
  {
    v9 = *(_DWORD *)v8;
    *(_DWORD *)v8 += 2;
    v11[0] = v8;
    if (*((_DWORD *)v8 + 1))
    {
      WebCore::ResourceRequestBase::setHTTPUserAgent((WebCore::ResourceRequestBase *)v12, (const WTF::String *)v11);
      v8 = v11[0];
      v11[0] = 0;
      if (!v8)
        goto LABEL_15;
      v9 = *(_DWORD *)v8 - 2;
      if (*(_DWORD *)v8 != 2)
        goto LABEL_12;
    }
    else
    {
      v11[0] = 0;
      if (v9)
      {
LABEL_12:
        *(_DWORD *)v8 = v9;
        goto LABEL_15;
      }
    }
    WTF::StringImpl::destroy(v8, v6);
  }
LABEL_15:
  WebKit::WebPageProxy::preconnectTo((uint64_t)self->_page.m_ptr, (WebCore::ResourceRequestBase *)v12);
  v10 = cf;
  cf = 0;
  if (v10)
    CFRelease(v10);
  WebCore::ResourceRequestBase::~ResourceRequestBase((WebCore::ResourceRequestBase *)v12);
}

- (BOOL)_canUseCredentialStorage
{
  return *((_BYTE *)self->_page.m_ptr + 1264);
}

- (void)_setCanUseCredentialStorage:(BOOL)a3
{
  WebPageProxy *m_ptr;
  BOOL v6;

  m_ptr = self->_page.m_ptr;
  if (*((_BYTE *)m_ptr + 1290))
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("The WKWebView is suspended"));
    m_ptr = self->_page.m_ptr;
  }
  *((_BYTE *)m_ptr + 1264) = a3;
  v6 = a3;
  WebKit::AuxiliaryProcessProxy::send<Messages::WebPage::SetCanUseCredentialStorage>(*((_QWORD *)m_ptr + 26), &v6, *(_QWORD *)(*((_QWORD *)m_ptr + 4) + 1896), 0);
}

- (UIColor)_pageExtendedBackgroundColor
{
  const Color *v2;
  CFTypeRef v3;
  void *v4;
  UIColor *v5;
  CFTypeRef v6;
  unsigned int *v8;
  unsigned int v9;
  unsigned int v10;
  uint64_t v11;
  CFTypeRef cf;

  WebCore::Color::Color((WebCore::Color *)&v11, (const Color *)(*((_QWORD *)self->_page.m_ptr + 4) + 912));
  WebCore::cocoaColorOrNil((WebCore *)&v11, v2);
  v3 = cf;
  cf = 0;
  v5 = (id)CFMakeCollectable(v3);
  v6 = cf;
  cf = 0;
  if (v6)
    CFRelease(v6);
  if ((v11 & 0x8000000000000) != 0)
  {
    v8 = (unsigned int *)(v11 & 0xFFFFFFFFFFFFLL);
    do
    {
      v9 = __ldaxr(v8);
      v10 = v9 - 1;
    }
    while (__stlxr(v10, v8));
    if (!v10)
    {
      atomic_store(1u, v8);
      WTF::fastFree((WTF *)v8, v4);
    }
  }
  return v5;
}

- (UIColor)_sampledPageTopColor
{
  const Color *v2;
  CFTypeRef v3;
  void *v4;
  UIColor *v5;
  CFTypeRef v6;
  unsigned int *v8;
  unsigned int v9;
  unsigned int v10;
  uint64_t v11;
  CFTypeRef cf;

  WebCore::Color::Color((WebCore::Color *)&v11, (const Color *)(*((_QWORD *)self->_page.m_ptr + 4) + 1720));
  WebCore::cocoaColorOrNil((WebCore *)&v11, v2);
  v3 = cf;
  cf = 0;
  v5 = (id)CFMakeCollectable(v3);
  v6 = cf;
  cf = 0;
  if (v6)
    CFRelease(v6);
  if ((v11 & 0x8000000000000) != 0)
  {
    v8 = (unsigned int *)(v11 & 0xFFFFFFFFFFFFLL);
    do
    {
      v9 = __ldaxr(v8);
      v10 = v9 - 1;
    }
    while (__stlxr(v10, v8));
    if (!v10)
    {
      atomic_store(1u, v8);
      WTF::fastFree((WTF *)v8, v4);
    }
  }
  return v5;
}

- (_WKInputDelegate)_inputDelegate
{
  return (_WKInputDelegate *)objc_loadWeak(&self->_inputDelegate.m_weakReference);
}

- (BOOL)_isDisplayingPDF
{
  void *v3;
  WTF *v4;
  char *v5;
  char *v6;
  char *v7;
  WKWebViewContentProviderRegistry *v8;
  WTF::StringImpl *v9;
  WTF::StringImpl *v10;
  char isKindOfClass;
  char v12;
  WTF::StringImpl *v14;
  WTF *v15;

  WebCore::MIMETypeRegistry::pdfMIMETypes((WebCore::MIMETypeRegistry *)self);
  v4 = v15;
  if (v15)
    v5 = (char *)v15 + 8;
  else
    v5 = 0;
  if (v15)
    v6 = (char *)v15 + 16 * *(unsigned int *)v15 + 8;
  else
    v6 = 0;
  if (v5 == v6)
  {
    isKindOfClass = 0;
  }
  else
  {
    v7 = v5 + 16;
    do
    {
      v8 = -[WKWebView _contentProviderRegistry](self, "_contentProviderRegistry", v14);
      MEMORY[0x19AEABCC8](&v14, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", *((_QWORD *)v7 - 2)));
      -[WKWebViewContentProviderRegistry providerForMIMEType:](v8, "providerForMIMEType:", &v14);
      v10 = v14;
      v14 = 0;
      if (v10)
      {
        if (*(_DWORD *)v10 == 2)
          WTF::StringImpl::destroy(v10, v9);
        else
          *(_DWORD *)v10 -= 2;
      }
      isKindOfClass = objc_opt_isKindOfClass();
      v12 = isKindOfClass | (v7 == v6);
      v7 += 16;
    }
    while ((v12 & 1) == 0);
    v4 = v15;
  }
  v15 = 0;
  if (v4)
    WTF::fastFree(v4, v3);
  return isKindOfClass & 1;
}

- (BOOL)_isDisplayingStandaloneImageDocument
{
  uint64_t v2;

  v2 = *((_QWORD *)self->_page.m_ptr + 35);
  if (v2)
    return WebCore::Image::supportsType((WebCore::Image *)(v2 + 224), (const WTF::String *)a2);
  else
    return 0;
}

- (BOOL)_isDisplayingStandaloneMediaDocument
{
  uint64_t v2;

  v2 = *((_QWORD *)self->_page.m_ptr + 35);
  if (v2)
    return WebCore::MIMETypeRegistry::isSupportedMediaMIMEType((WebCore::MIMETypeRegistry *)(v2 + 224), (const WTF::String *)a2);
  else
    return 0;
}

- (BOOL)_isPlayingAudio
{
  return *(_DWORD *)(*((_QWORD *)self->_page.m_ptr + 4) + 808) & 1;
}

- (BOOL)_isShowingNavigationGestureSnapshot
{
  return *((_BYTE *)self->_page.m_ptr + 856);
}

- (unint64_t)_layoutMode
{
  return *((unsigned __int8 *)self->_page.m_ptr + 705);
}

- (void)_setLayoutMode:(unint64_t)a3
{
  WebPageProxy *m_ptr;

  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((_BYTE *)m_ptr + 1290))
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("The WKWebView is suspended"));
    m_ptr = self->_page.m_ptr;
  }
  WebKit::WebPageProxy::setUseFixedLayout((uint64_t)m_ptr, a3 - 1 < 2);
}

- (CGSize)_fixedLayoutSize
{
  double v2;
  double v3;
  CGSize result;

  WebCore::IntSize::operator CGSize();
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)_setFixedLayoutSize:(CGSize)a3
{
  WebPageProxy *m_ptr;
  float v4;
  uint64_t v5;
  uint64_t v6;
  float v7;
  unint64_t v8;
  float v10[2];
  unint64_t v11;
  CGSize v12;

  v12 = a3;
  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((_BYTE *)m_ptr + 1290))
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("The WKWebView is suspended"));
    m_ptr = self->_page.m_ptr;
  }
  WebCore::FloatSize::FloatSize((WebCore::FloatSize *)v10, &v12);
  v4 = ceilf(v10[0]);
  v5 = 0x7FFFFFFFLL;
  v6 = 0x80000000;
  if (v4 > -2147500000.0)
    v6 = (int)v4;
  if (v4 < 2147500000.0)
    v5 = v6;
  v7 = ceilf(v10[1]);
  if (v7 >= 2147500000.0)
  {
    v8 = 0x7FFFFFFF00000000;
  }
  else if (v7 <= -2147500000.0)
  {
    v8 = 0x8000000000000000;
  }
  else
  {
    v8 = (unint64_t)(int)v7 << 32;
  }
  v11 = v8 | v5;
  WebKit::WebPageProxy::setFixedLayoutSize((uint64_t)m_ptr, (const WebCore::IntSize *)&v11);
}

- (BOOL)_backgroundExtendsBeyondPage
{
  return *((_BYTE *)self->_page.m_ptr + 854);
}

- (double)_viewScale
{
  return *((double *)self->_page.m_ptr + 126);
}

- (void)_setViewScale:(double)a3
{
  WebPageProxy *m_ptr;
  double v6;
  WebPageProxy *v8;
  uint64_t v9;

  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((_BYTE *)m_ptr + 1290))
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("The WKWebView is suspended"));
  v6 = fabs(a3);
  if (a3 <= 0.0 || v6 == INFINITY)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("View scale should be a positive number"), v6);
  v8 = self->_page.m_ptr;
  if (*((double *)v8 + 126) != a3)
  {
    v9 = *(_QWORD *)(*((_QWORD *)v8 + 4) + 2116);
    WebKit::WebPageProxy::setViewportConfigurationViewLayoutSize((uint64_t)v8, (const WebCore::FloatSize *)&v9, a3, *((double *)v8 + 127));
  }
}

- (void)_getProcessDisplayNameWithCompletionHandler:(id)a3
{
  WebPageProxy *m_ptr;
  void *v5;
  _QWORD *v6;
  uint64_t v7;
  _QWORD *v9;
  char v10;

  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((_BYTE *)m_ptr + 1290))
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("The WKWebView is suspended"));
    m_ptr = self->_page.m_ptr;
  }
  v5 = _Block_copy(a3);
  v6 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
  *v6 = off_1E34BD8C0;
  v6[1] = v5;
  v9 = v6;
  v10 = 0;
  WebKit::AuxiliaryProcessProxy::sendWithAsyncReply<Messages::WebPage::GetProcessDisplayName,WTF::CompletionHandler<void ()(WTF::String &&)>>(*((_QWORD *)m_ptr + 26), (uint64_t)&v10, (uint64_t *)&v9, *(_QWORD *)(*((_QWORD *)m_ptr + 4) + 1896), 0, 1);
  v7 = (uint64_t)v9;
  v9 = 0;
  if (v7)
    (*(void (**)(uint64_t))(*(_QWORD *)v7 + 8))(v7);
  _Block_release(0);
}

- (double)_minimumEffectiveDeviceWidth
{
  return *((double *)self->_page.m_ptr + 127);
}

- (void)_setScrollPerformanceDataCollectionEnabled:(BOOL)a3
{
  _BOOL4 v3;
  WebPageProxy *m_ptr;

  v3 = a3;
  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((_BYTE *)m_ptr + 1290))
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("The WKWebView is suspended"));
    m_ptr = self->_page.m_ptr;
  }
  WebKit::WebPageProxy::setScrollPerformanceDataCollectionEnabled((uint64_t)m_ptr, v3);
}

- (BOOL)_scrollPerformanceDataCollectionEnabled
{
  return *((_BYTE *)self->_page.m_ptr + 920);
}

- (NSArray)_scrollPerformanceData
{
  NSArray *result;

  result = (NSArray *)*((_QWORD *)self->_page.m_ptr + 114);
  if (result)
    return (NSArray *)WebKit::RemoteLayerTreeScrollingPerformanceData::data((WebKit::RemoteLayerTreeScrollingPerformanceData *)result);
  return result;
}

- (BOOL)_allowsMediaDocumentInlinePlayback
{
  return *((_BYTE *)self->_page.m_ptr + 521);
}

- (void)_setAllowsMediaDocumentInlinePlayback:(BOOL)a3
{
  _BOOL4 v3;
  WebPageProxy *m_ptr;

  v3 = a3;
  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((_BYTE *)m_ptr + 1290))
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("The WKWebView is suspended"));
    m_ptr = self->_page.m_ptr;
  }
  WebKit::WebPageProxy::setAllowsMediaDocumentInlinePlayback((uint64_t)m_ptr, v3);
}

- (_WKFullscreenDelegate)_fullscreenDelegate
{
  id *v2;
  CFTypeRef cf;

  v2 = (id *)*((_QWORD *)self->_page.m_ptr + 46);
  if (!(*(unsigned int (**)(id *, uint64_t))*v2)(v2, 1))
    return 0;
  WebKit::DiagnosticLoggingClient::delegate(v2, &cf);
  return (_WKFullscreenDelegate *)(id)CFMakeCollectable(cf);
}

- (unint64_t)_mediaCaptureState
{
  return ((unint64_t)*(unsigned int *)(*((_QWORD *)self->_page.m_ptr + 4) + 1672) >> 11) & 0xF;
}

- (void)_setMediaCaptureEnabled:(BOOL)a3
{
  WebPageProxy *m_ptr;

  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((_BYTE *)m_ptr + 1290))
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("The WKWebView is suspended"));
    m_ptr = self->_page.m_ptr;
  }
  WebKit::WebPageProxy::setMediaCaptureEnabled(m_ptr, a3);
}

- (BOOL)_mediaCaptureEnabled
{
  return *((_BYTE *)self->_page.m_ptr + 890);
}

- (void)_setPageMuted:(unint64_t)a3
{
  char v3;
  WebPageProxy *m_ptr;
  char v6;

  v3 = a3;
  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((_BYTE *)m_ptr + 1290))
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("The WKWebView is suspended"));
    m_ptr = self->_page.m_ptr;
  }
  if ((v3 & 2) != 0)
    v6 = v3 & 1 | 6;
  else
    v6 = v3 & 1;
  WebKit::WebPageProxy::setMuted((uint64_t)m_ptr, v6 & 0xF7 | (8 * ((v3 & 4) != 0)));
}

- (void)_removeDataDetectedLinks:(id)a3
{
  WebPageProxy *m_ptr;
  void *v6;
  WebPageProxy *v7;
  unsigned int **v8;
  unsigned int *v9;
  unsigned int v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;

  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((_BYTE *)m_ptr + 1290))
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("The WKWebView is suspended"));
    m_ptr = self->_page.m_ptr;
  }
  v6 = _Block_copy(a3);
  v7 = self->_page.m_ptr;
  if (v7)
  {
    v8 = (unsigned int **)((char *)v7 + 24);
    WTF::WeakPtrFactory<IPC::MessageReceiver,WTF::DefaultWeakPtrImpl>::initializeIfNeeded((unsigned int *)v7 + 6, (uint64_t)v7 + 16);
    v9 = *v8;
    if (v9)
    {
      do
        v10 = __ldaxr(v9);
      while (__stlxr(v10 + 1, v9));
    }
  }
  else
  {
    v9 = 0;
  }
  v11 = (_QWORD *)WTF::fastMalloc((WTF *)0x18);
  *v11 = off_1E34BD8E8;
  v11[1] = v6;
  v11[2] = v9;
  v13 = v11;
  WebKit::WebPageProxy::removeDataDetectedLinks((uint64_t)m_ptr, (uint64_t *)&v13);
  v12 = (uint64_t)v13;
  v13 = 0;
  if (v12)
    (*(void (**)(uint64_t))(*(_QWORD *)v12 + 8))(v12);
  _Block_release(0);
}

- (void)_doAfterNextPresentationUpdate:(id)a3
{
  WebPageProxy *m_ptr;

  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((_BYTE *)m_ptr + 1290))
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("The WKWebView is suspended"));
  -[WKWebView _internalDoAfterNextPresentationUpdate:withoutWaitingForPainting:withoutWaitingForAnimatedResize:](self, "_internalDoAfterNextPresentationUpdate:withoutWaitingForPainting:withoutWaitingForAnimatedResize:", a3, 0, 0);
}

- (void)_doAfterNextPresentationUpdateWithoutWaitingForPainting:(id)a3
{
  WebPageProxy *m_ptr;

  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((_BYTE *)m_ptr + 1290))
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("The WKWebView is suspended"));
  -[WKWebView _internalDoAfterNextPresentationUpdate:withoutWaitingForPainting:withoutWaitingForAnimatedResize:](self, "_internalDoAfterNextPresentationUpdate:withoutWaitingForPainting:withoutWaitingForAnimatedResize:", a3, 1, 0);
}

- (void)_doAfterNextVisibleContentRectUpdate:(id)a3
{
  Vector<WTF::BlockPtr<void ()>, 0UL, WTF::CrashOnOverflow, 16UL, WTF::FastMalloc> *p_visibleContentRectUpdateCallbacks;
  void *v5;
  unint64_t m_size;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  const void *v10;
  void *v11;
  _QWORD *m_buffer;
  const void *v13;

  p_visibleContentRectUpdateCallbacks = &self->_visibleContentRectUpdateCallbacks;
  v5 = _Block_copy(a3);
  v13 = v5;
  m_size = p_visibleContentRectUpdateCallbacks->m_size;
  if ((_DWORD)m_size == p_visibleContentRectUpdateCallbacks->m_capacity)
  {
    v7 = (uint64_t *)WTF::Vector<WTF::BlockPtr<void ()(void)>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::expandCapacity<(WTF::FailureAction)0>((uint64_t)p_visibleContentRectUpdateCallbacks, m_size + 1, (unint64_t)&v13);
    v8 = p_visibleContentRectUpdateCallbacks->m_size;
    m_size = (unint64_t)p_visibleContentRectUpdateCallbacks->m_buffer;
    v9 = *v7;
    *v7 = 0;
    *(_QWORD *)(m_size + 8 * v8) = v9;
    LODWORD(m_size) = p_visibleContentRectUpdateCallbacks->m_size;
    v10 = v13;
  }
  else
  {
    v11 = v5;
    v10 = 0;
    m_buffer = p_visibleContentRectUpdateCallbacks->m_buffer;
    v13 = 0;
    m_buffer[m_size] = v11;
  }
  p_visibleContentRectUpdateCallbacks->m_size = m_size + 1;
  _Block_release(v10);
  -[WKWebView _scheduleVisibleContentRectUpdate](self, "_scheduleVisibleContentRectUpdate");
}

- (unint64_t)_displayCaptureSurfaces
{
  int v2;

  v2 = *(_DWORD *)(*((_QWORD *)self->_page.m_ptr + 4) + 1672);
  if ((v2 & 0xE00000) != 0)
    return ((v2 & 0x1C0000) != 0) | 2;
  else
    return (v2 & 0x1C0000) != 0;
}

- (int64_t)_displayCaptureState
{
  int v2;

  v2 = *(_DWORD *)(*((_QWORD *)self->_page.m_ptr + 4) + 1672);
  if ((v2 & 0x240000) != 0)
    return 1;
  else
    return 2 * ((v2 & 0x480000) != 0);
}

- (int64_t)_systemAudioCaptureState
{
  unsigned int v2;

  v2 = *(_DWORD *)(*((_QWORD *)self->_page.m_ptr + 4) + 1672);
  if ((v2 & 0x1000000) != 0)
    return 1;
  else
    return HIBYTE(v2) & 2;
}

- (void)_setDisplayCaptureState:(int64_t)a3 completionHandler:(id)a4
{
  _QWORD *v4;
  WebPageProxy *m_ptr;
  WebPageProxy *v8;
  unsigned __int8 v9;
  unsigned __int8 v10;
  unsigned __int8 v11;
  void *v12;
  _QWORD *v13;
  void *v14;
  _QWORD *v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD v18[5];

  v4 = a4;
  m_ptr = self->_page.m_ptr;
  if (!m_ptr || !*((_BYTE *)m_ptr + 1290))
  {
    if (a4)
      goto LABEL_5;
    goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("The WKWebView is suspended"));
  if (!v4)
  {
LABEL_4:
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3321888768;
    v18[2] = __66__WKWebView_WKPrivate___setDisplayCaptureState_completionHandler___block_invoke;
    v18[3] = &__block_descriptor_33_e8_32c80_ZTSKZ66__WKWebView_WKPrivate___setDisplayCaptureState_completionHandler__E4__73_e5_v8__0l;
    v4 = v18;
  }
LABEL_5:
  v8 = self->_page.m_ptr;
  if (a3)
  {
    v9 = *(_BYTE *)(*((_QWORD *)v8 + 4) + 872);
    v10 = v9 | 0x18;
    if (a3 == 1)
      v9 &= 0xE7u;
    if (a3 == 2)
      v11 = v10;
    else
      v11 = v9;
    v12 = _Block_copy(v4);
    v13 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
    *v13 = off_1E34BD938;
    v13[1] = v12;
    v17 = v13;
    WebKit::WebPageProxy::setMuted((uint64_t)v8, v11, (uint64_t *)&v17);
  }
  else
  {
    v14 = _Block_copy(v4);
    v15 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
    *v15 = off_1E34BD910;
    v15[1] = v14;
    v17 = v15;
    WebKit::WebPageProxy::stopMediaCapture((uint64_t)v8, 2, (uint64_t *)&v17);
  }
  v16 = (uint64_t)v17;
  v17 = 0;
  if (v16)
    (*(void (**)(uint64_t))(*(_QWORD *)v16 + 8))(v16);
  _Block_release(0);
}

- (void)_setSystemAudioCaptureState:(int64_t)a3 completionHandler:(id)a4
{
  _QWORD *v4;
  WebPageProxy *m_ptr;
  WebPageProxy *v8;
  unsigned __int8 v9;
  unsigned __int8 v10;
  unsigned __int8 v11;
  void *v12;
  _QWORD *v13;
  void *v14;
  _QWORD *v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD v18[5];

  v4 = a4;
  m_ptr = self->_page.m_ptr;
  if (!m_ptr || !*((_BYTE *)m_ptr + 1290))
  {
    if (a4)
      goto LABEL_5;
    goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("The WKWebView is suspended"));
  if (!v4)
  {
LABEL_4:
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3321888768;
    v18[2] = __70__WKWebView_WKPrivate___setSystemAudioCaptureState_completionHandler___block_invoke;
    v18[3] = &__block_descriptor_33_e8_32c84_ZTSKZ70__WKWebView_WKPrivate___setSystemAudioCaptureState_completionHandler__E4__76_e5_v8__0l;
    v4 = v18;
  }
LABEL_5:
  v8 = self->_page.m_ptr;
  if (a3)
  {
    v9 = *(_BYTE *)(*((_QWORD *)v8 + 4) + 872);
    v10 = v9 | 0x10;
    if (a3 == 1)
      v9 &= ~0x10u;
    if (a3 == 2)
      v11 = v10;
    else
      v11 = v9;
    v12 = _Block_copy(v4);
    v13 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
    *v13 = off_1E34BD988;
    v13[1] = v12;
    v17 = v13;
    WebKit::WebPageProxy::setMuted((uint64_t)v8, v11, (uint64_t *)&v17);
  }
  else
  {
    v14 = _Block_copy(v4);
    v15 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
    *v15 = off_1E34BD960;
    v15[1] = v14;
    v17 = v15;
    WebKit::WebPageProxy::stopMediaCapture((uint64_t)v8, 3, (uint64_t *)&v17);
  }
  v16 = (uint64_t)v17;
  v17 = 0;
  if (v16)
    (*(void (**)(uint64_t))(*(_QWORD *)v16 + 8))(v16);
  _Block_release(0);
}

- (void)_setOverrideDeviceScaleFactor:(double)a3
{
  float v3;

  v3 = a3;
  WebKit::WebPageProxy::setCustomDeviceScaleFactor((uint64_t)self->_page.m_ptr, v3);
}

- (double)_overrideDeviceScaleFactor
{
  WebPageProxy *m_ptr;
  double result;

  m_ptr = self->_page.m_ptr;
  result = *((float *)m_ptr + 173);
  if (!*((_BYTE *)m_ptr + 696))
    return 0.0;
  return result;
}

+ (void)_permissionChanged:(id)a3 forOrigin:(id)a4
{
  const WTF::String *v5;
  WTF::StringImpl *v6;
  unsigned __int16 v7;
  WTF::StringImpl *v8;
  WTF::StringImpl *v9;

  MEMORY[0x19AEABCC8](&v9, a3);
  v7 = WebCore::Permissions::toPermissionName((WebCore::Permissions *)&v9, v5);
  v8 = v9;
  v9 = 0;
  if (v8)
  {
    if (*(_DWORD *)v8 == 2)
      WTF::StringImpl::destroy(v8, v6);
    else
      *(_DWORD *)v8 -= 2;
  }
  if (v7 >= 0x100u)
    WebKit::WebProcessProxy::permissionChanged(v7, (uint64_t)a4 + 24);
}

- (NSURL)_requiredWebExtensionBaseURL
{
  return (NSURL *)objc_msgSend(self->_configuration.m_ptr, "_requiredWebExtensionBaseURL");
}

- (void)_resetVisibilityAdjustmentsForTargetedElements:(id)a3 completionHandler:(id)a4
{
  WebPageProxy *m_ptr;
  void *v6;
  _QWORD *v7;
  uint64_t v8;
  void *v9;
  _QWORD *v10;
  _BYTE v11[16];

  m_ptr = self->_page.m_ptr;
  elementsFromWKElements((uint64_t)v11, a3);
  v6 = _Block_copy(a4);
  v7 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
  *v7 = off_1E34BD9B0;
  v7[1] = v6;
  v10 = v7;
  WebKit::WebPageProxy::resetVisibilityAdjustmentsForTargetedElements((WTF *)m_ptr, (uint64_t)v11, (uint64_t *)&v10);
  v8 = (uint64_t)v10;
  v10 = 0;
  if (v8)
    (*(void (**)(uint64_t))(*(_QWORD *)v8 + 8))(v8);
  _Block_release(0);
  WTF::Vector<WTF::Ref<WebKit::WebExtensionDataRecord,WTF::RawPtrTraits<WebKit::WebExtensionDataRecord>,WTF::DefaultRefDerefTraits<WebKit::WebExtensionDataRecord>>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)v11, v9);
}

- (void)_adjustVisibilityForTargetedElements:(id)a3 completionHandler:(id)a4
{
  WebPageProxy *m_ptr;
  void *v6;
  _QWORD *v7;
  uint64_t v8;
  void *v9;
  _QWORD *v10;
  _BYTE v11[16];

  m_ptr = self->_page.m_ptr;
  elementsFromWKElements((uint64_t)v11, a3);
  v6 = _Block_copy(a4);
  v7 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
  *v7 = off_1E34BD9D8;
  v7[1] = v6;
  v10 = v7;
  WebKit::WebPageProxy::adjustVisibilityForTargetedElements((uint64_t)m_ptr, (uint64_t)v11, (uint64_t *)&v10);
  v8 = (uint64_t)v10;
  v10 = 0;
  if (v8)
    (*(void (**)(uint64_t))(*(_QWORD *)v8 + 8))(v8);
  _Block_release(0);
  WTF::Vector<WTF::Ref<WebKit::WebExtensionDataRecord,WTF::RawPtrTraits<WebKit::WebExtensionDataRecord>,WTF::DefaultRefDerefTraits<WebKit::WebExtensionDataRecord>>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)v11, v9);
}

- (void)_numberOfVisibilityAdjustmentRectsWithCompletionHandler:(id)a3
{
  WebPageProxy *m_ptr;
  void *v4;
  _QWORD *v5;
  uint64_t v6;
  _QWORD *v7;

  m_ptr = self->_page.m_ptr;
  v4 = _Block_copy(a3);
  v5 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
  *v5 = off_1E34BDA00;
  v5[1] = v4;
  v7 = v5;
  WebKit::WebPageProxy::numberOfVisibilityAdjustmentRects((uint64_t)m_ptr, (uint64_t *)&v7);
  v6 = (uint64_t)v7;
  v7 = 0;
  if (v6)
    (*(void (**)(uint64_t))(*(_QWORD *)v6 + 8))(v6);
  _Block_release(0);
}

- (void)_playPredominantOrNowPlayingMediaSession:(id)a3
{
  WebPageProxy *m_ptr;
  void *v6;
  _QWORD *v7;
  uint64_t v8;
  _QWORD *v9;

  if (-[WKWebView _isValid](self, "_isValid"))
  {
    m_ptr = self->_page.m_ptr;
    v6 = _Block_copy(a3);
    v7 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
    *v7 = off_1E34BDA28;
    v7[1] = v6;
    v9 = v7;
    WebKit::WebPageProxy::playPredominantOrNowPlayingMediaSession((uint64_t)m_ptr, (uint64_t *)&v9);
    v8 = (uint64_t)v9;
    v9 = 0;
    if (v8)
      (*(void (**)(uint64_t))(*(_QWORD *)v8 + 8))(v8);
    _Block_release(0);
  }
  else
  {
    (*((void (**)(id, _QWORD))a3 + 2))(a3, 0);
  }
}

- (void)_pauseNowPlayingMediaSession:(id)a3
{
  uint64_t **m_ptr;
  void *v6;
  _QWORD *v7;
  _QWORD *v8;

  if (-[WKWebView _isValid](self, "_isValid"))
  {
    m_ptr = (uint64_t **)self->_page.m_ptr;
    v6 = _Block_copy(a3);
    v7 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
    *v7 = off_1E34BDA50;
    v7[1] = v6;
    v8 = v7;
    WebKit::WebPageProxy::pauseNowPlayingMediaSession(m_ptr, (uint64_t *)&v8);
    if (v8)
      (*(void (**)(_QWORD *))(*v8 + 8))(v8);
    _Block_release(0);
  }
  else
  {
    (*((void (**)(id, _QWORD))a3 + 2))(a3, 0);
  }
}

- (NSArray)certificateChain
{
  NSArray *v2;
  NSArray *arg;

  WebCore::CertificateInfo::certificateChainFromSecTrust(*(WebCore::CertificateInfo **)(*((_QWORD *)self->_page.m_ptr + 4) + 1128), (__SecTrust *)a2);
  if (arg)
  {
    CFAutorelease(arg);
    v2 = arg;
  }
  else
  {
    v2 = 0;
  }
  if (v2)
    return v2;
  else
    return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (void)_requestTextExtractionForSwift:(id)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  _QWORD *v13;

  objc_msgSend(a3, "rectInWebView");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  if (a3)
    CFRetain(a3);
  v13 = malloc_type_malloc(0x28uLL, 0x10E00401B686A03uLL);
  *v13 = MEMORY[0x1E0C809A0];
  v13[1] = 50331650;
  v13[2] = WTF::BlockPtr<void ()(WKTextExtractionItem *)>::fromCallable<-[WKWebView(WKTextExtraction) _requestTextExtractionForSwift:]::$_84>(-[WKWebView(WKTextExtraction) _requestTextExtractionForSwift:]::$_84)::{lambda(void *,WKTextExtractionItem *)#1}::__invoke;
  v13[3] = &WTF::BlockPtr<void ()(WKTextExtractionItem *)>::fromCallable<-[WKWebView(WKTextExtraction) _requestTextExtractionForSwift:]::$_84>(-[WKWebView(WKTextExtraction) _requestTextExtractionForSwift:]::$_84)::descriptor;
  v13[4] = a3;
  -[WKWebView _requestTextExtraction:completionHandler:](self, "_requestTextExtraction:completionHandler:", v13, v6, v8, v10, v12);
  _Block_release(v13);
}

- (void)_requestTextExtraction:(CGRect)a3 completionHandler:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  const WTF::StringImpl *v10;
  uint64_t v11;
  char v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  WebPageProxy *m_ptr;
  uint64_t v18;
  CGFloat v19;
  uint64_t v20;
  uint64_t v21;
  _BYTE v22[20];
  CGRect aBlock;
  CGRect v24;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (!-[WKWebView _isValid](self, "_isValid"))
    goto LABEL_7;
  v11 = *((_QWORD *)self->_page.m_ptr + 28);
  {
    WebKit::WebPreferencesKey::textExtractionEnabledKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::textExtractionEnabledKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::textExtractionEnabledKey(void)::$_0::operator() const(void)::impl;
  }
  if ((WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)(v11 + 40), (WTF::StringImpl **)&WebKit::WebPreferencesKey::textExtractionEnabledKey(void)::key, v10) & 1) != 0)
  {
    v24.origin.x = x;
    v24.origin.y = y;
    v24.size.width = width;
    v24.size.height = height;
    if (CGRectIsNull(v24))
    {
      v12 = 0;
      v22[0] = 0;
    }
    else
    {
      -[WKWebView convertRect:toView:](self, "convertRect:toView:", self->_contentView.m_ptr, x, y, width, height);
      aBlock.origin.x = v13;
      aBlock.origin.y = v14;
      aBlock.size.width = v15;
      aBlock.size.height = v16;
      WebCore::FloatRect::FloatRect((WebCore::FloatRect *)v22, &aBlock);
      v12 = 1;
    }
    v22[16] = v12;
    m_ptr = self->_page.m_ptr;
    *(_QWORD *)&aBlock.origin.x = _Block_copy(a4);
    aBlock.origin.y = 0.0;
    objc_initWeak((id *)&aBlock.origin.y, self);
    v18 = WTF::fastMalloc((WTF *)0x18);
    *(_QWORD *)v18 = off_1E34BDA78;
    v19 = aBlock.origin.x;
    aBlock.origin.x = 0.0;
    *(CGFloat *)(v18 + 8) = v19;
    *(_QWORD *)(v18 + 16) = 0;
    objc_moveWeak((id *)(v18 + 16), (id *)&aBlock.origin.y);
    v21 = v18;
    WebKit::WebPageProxy::requestTextExtraction((uint64_t)m_ptr, (uint64_t)v22, &v21);
    v20 = v21;
    v21 = 0;
    if (v20)
      (*(void (**)(uint64_t))(*(_QWORD *)v20 + 8))(v20);
    objc_destroyWeak((id *)&aBlock.origin.y);
    _Block_release(*(const void **)&aBlock.origin.x);
  }
  else
  {
LABEL_7:
    (*((void (**)(id, _QWORD))a4 + 2))(a4, 0);
  }
}

- (void)_doAfterNextVisibleContentRectAndPresentationUpdate:
{
  const void *v2;

  _Block_release(*(const void **)(a1 + 40));
  v2 = *(const void **)(a1 + 32);
  *(_QWORD *)(a1 + 32) = 0;
  if (v2)
    CFRelease(v2);
}

- (uint64_t)_doAfterNextVisibleContentRectAndPresentationUpdate:
{
  return objc_msgSend(*(id *)(a1 + 32), "_doAfterNextPresentationUpdate:", *(_QWORD *)(a1 + 40));
}

- (uint64_t)startDownloadUsingRequest:(uint64_t)a1 completionHandler:
{
  *(_QWORD *)a1 = off_1E34BCF98;
  _Block_release(*(const void **)(a1 + 8));
  return a1;
}

- (uint64_t)startDownloadUsingRequest:(const void *)a1 completionHandler:
{
  void *v2;

  *a1 = off_1E34BCF98;
  _Block_release(a1[1]);
  return WTF::fastFree((WTF *)a1, v2);
}

- (uint64_t)startDownloadUsingRequest:(uint64_t)result completionHandler:(uint64_t)a2
{
  if (a2)
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 8) + 16))();
  return result;
}

- (uint64_t)resumeDownloadFromResumeData:(uint64_t)a1 completionHandler:
{
  *(_QWORD *)a1 = off_1E34BCFC0;
  _Block_release(*(const void **)(a1 + 8));
  return a1;
}

- (uint64_t)resumeDownloadFromResumeData:(const void *)a1 completionHandler:
{
  void *v2;

  *a1 = off_1E34BCFC0;
  _Block_release(a1[1]);
  return WTF::fastFree((WTF *)a1, v2);
}

- (uint64_t)resumeDownloadFromResumeData:(uint64_t)result completionHandler:(uint64_t)a2
{
  if (a2)
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 8) + 16))();
  return result;
}

- (uint64_t)closeAllMediaPresentationsWithCompletionHandler:(uint64_t)a1
{
  *(_QWORD *)a1 = off_1E34BD038;
  WTF::Ref<WTF::CallbackAggregatorOnThread<(WTF::DestructionThread)0>,WTF::RawPtrTraits<WTF::CallbackAggregatorOnThread<(WTF::DestructionThread)0>>,WTF::DefaultRefDerefTraits<WTF::CallbackAggregatorOnThread<(WTF::DestructionThread)0>>>::~Ref((unsigned int **)(a1 + 8));
  return a1;
}

- (uint64_t)closeAllMediaPresentationsWithCompletionHandler:(unsigned int *)a1
{
  void *v2;

  *a1 = (unsigned int *)off_1E34BD038;
  WTF::Ref<WTF::CallbackAggregatorOnThread<(WTF::DestructionThread)0>,WTF::RawPtrTraits<WTF::CallbackAggregatorOnThread<(WTF::DestructionThread)0>>,WTF::DefaultRefDerefTraits<WTF::CallbackAggregatorOnThread<(WTF::DestructionThread)0>>>::~Ref(a1 + 1);
  return WTF::fastFree((WTF *)a1, v2);
}

- (uint64_t)requestMediaPlaybackStateWithCompletionHandler:(uint64_t)a1
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 8) + 16))();
}

- (uint64_t)requestMediaPlaybackStateWithCompletionHandler:(const void *)a1
{
  void *v2;

  *a1 = off_1E34BD088;
  _Block_release(a1[1]);
  return WTF::fastFree((WTF *)a1, v2);
}

- (uint64_t)setMicrophoneCaptureState:(uint64_t)a1 completionHandler:
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 8) + 16))();
}

- (uint64_t)setMicrophoneCaptureState:(const void *)a1 completionHandler:
{
  void *v2;

  *a1 = off_1E34BD0D8;
  _Block_release(a1[1]);
  return WTF::fastFree((WTF *)a1, v2);
}

- (uint64_t)setCameraCaptureState:(uint64_t)a1 completionHandler:
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 8) + 16))();
}

- (uint64_t)setCameraCaptureState:(const void *)a1 completionHandler:
{
  void *v2;

  *a1 = off_1E34BD128;
  _Block_release(a1[1]);
  return WTF::fastFree((WTF *)a1, v2);
}

- (_QWORD)_evaluateJavaScript:(_QWORD *)a1 asAsyncFunction:withSourceURL:withArguments:forceUserGesture:inFrame:inWorld:completionHandler:
{
  const void *v2;

  v2 = (const void *)a1[1];
  *a1 = &off_1E34BD178;
  a1[1] = 0;
  if (v2)
    CFRelease(v2);
  return a1;
}

- (uint64_t)_evaluateJavaScript:(uint64_t)a1 asAsyncFunction:withSourceURL:withArguments:forceUserGesture:inFrame:inWorld:completionHandler:
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 8) + 16))(*(_QWORD *)(a1 + 8), 0, *(_QWORD *)(a1 + 16));
}

- (uint64_t)takeSnapshotWithConfiguration:(uint64_t)a1 completionHandler:
{
  uint64_t v2;
  const void *v3;

  *(_QWORD *)a1 = off_1E34BD1C8;
  v2 = *(_QWORD *)(a1 + 88);
  *(_QWORD *)(a1 + 88) = 0;
  if (v2)
    CFRelease(*(CFTypeRef *)(v2 + 8));
  _Block_release(*(const void **)(a1 + 80));
  _Block_release(*(const void **)(a1 + 72));
  v3 = *(const void **)(a1 + 8);
  *(_QWORD *)(a1 + 8) = 0;
  if (v3)
    CFRelease(v3);
  return a1;
}

{
  uint64_t v2;
  void *v3;
  const void *v4;

  *(_QWORD *)a1 = off_1E34BD1C8;
  v2 = *(_QWORD *)(a1 + 88);
  *(_QWORD *)(a1 + 88) = 0;
  if (v2)
    CFRelease(*(CFTypeRef *)(v2 + 8));
  _Block_release(*(const void **)(a1 + 80));
  _Block_release(*(const void **)(a1 + 72));
  v4 = *(const void **)(a1 + 8);
  *(_QWORD *)(a1 + 8) = 0;
  if (v4)
    CFRelease(v4);
  return WTF::fastFree((WTF *)a1, v3);
}

- (uint64_t)takeSnapshotWithConfiguration:(const void *)a1 completionHandler:
{
  void *v2;

  *a1 = off_1E34BD1A0;
  _Block_release(a1[1]);
  return WTF::fastFree((WTF *)a1, v2);
}

- (void)takeSnapshotWithConfiguration:(uint64_t)a1 completionHandler:
{
  uint64_t v2;
  CFTypeRef v3;
  void *v4;
  const void *v5;
  const void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  uint64_t v10;
  _QWORD v11[4];
  CFTypeRef cf;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;
  void *aBlock;

  v2 = *(_QWORD *)(a1 + 88);
  if (*(_BYTE *)(v2 + 729) || !*(_BYTE *)(v2 + 728))
  {
    kdebug_trace();
    createNSError(WKErrorUnknown, 0, v11);
    (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();
    v3 = (CFTypeRef)v11[0];
    v11[0] = 0;
    if (v3)
LABEL_10:
      CFRelease(v3);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CD28B0], "activate");
    v4 = (void *)MEMORY[0x1E0CD28B0];
    v11[1] = 3321888768;
    v11[2] = ___ZZ61__WKWebView_takeSnapshotWithConfiguration_completionHandler__EN4__29clEv_block_invoke;
    v11[3] = &__block_descriptor_104_e8_32c87_ZTSKZZ61__WKWebView_takeSnapshotWithConfiguration_completionHandler__EN4__29clEvEUlvE__e5_v8__0l;
    v5 = *(const void **)(a1 + 72);
    v10 = *(_QWORD *)(a1 + 64);
    v11[0] = MEMORY[0x1E0C809B0];
    v6 = *(const void **)(a1 + 8);
    *(_QWORD *)(a1 + 8) = 0;
    v7 = *(_OWORD *)(a1 + 16);
    v8 = *(_OWORD *)(a1 + 32);
    v9 = *(_OWORD *)(a1 + 48);
    *(_QWORD *)(a1 + 72) = 0;
    cf = v6;
    if (v6)
      CFRetain(v6);
    v13 = v7;
    v14 = v8;
    v15 = v9;
    v16 = v10;
    aBlock = _Block_copy(v5);
    objc_msgSend(v4, "addCommitHandler:forPhase:", v11, 2);
    _Block_release(v5);
    if (v6)
      CFRelease(v6);
    _Block_release(aBlock);
    v3 = cf;
    cf = 0;
    if (v3)
      goto LABEL_10;
  }
}

- (uint64_t)findString:(uint64_t)a1 withConfiguration:completionHandler:
{
  *(_QWORD *)a1 = off_1E34BD250;
  _Block_release(*(const void **)(a1 + 8));
  return a1;
}

- (uint64_t)findString:(const void *)a1 withConfiguration:completionHandler:
{
  void *v2;

  *a1 = off_1E34BD250;
  _Block_release(a1[1]);
  return WTF::fastFree((WTF *)a1, v2);
}

- (void)findString:(uint64_t)a1 withConfiguration:(uint64_t)a2 completionHandler:
{
  id v3;

  v3 = -[WKFindResult _initWithMatchFound:]([WKFindResult alloc], "_initWithMatchFound:", a2);
  (*(void (**)(void))(*(_QWORD *)(a1 + 8) + 16))();
  if (v3)
    CFRelease(v3);
}

- (uint64_t)_showSafeBrowsingWarning:(uint64_t)a1 completionHandler:
{
  uint64_t v2;

  *(_QWORD *)a1 = off_1E34BD278;
  v2 = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 16) = 0;
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  objc_destroyWeak((id *)(a1 + 8));
  return a1;
}

{
  uint64_t v2;
  void *v3;

  *(_QWORD *)a1 = off_1E34BD278;
  v2 = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 16) = 0;
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  objc_destroyWeak((id *)(a1 + 8));
  return WTF::fastFree((WTF *)a1, v3);
}

- (void)_showSafeBrowsingWarning:(uint64_t)a1 completionHandler:(uint64_t)a2
{
  uint64_t v4;
  id WeakRetained;
  id v6;
  uint64_t v7;
  int v8;
  int v9;
  void *v10;
  int v11;
  const void *v12;
  uint64_t v13;
  char v14;
  char *v15;

  v4 = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 16) = 0;
  (*(void (**)(uint64_t))(*(_QWORD *)v4 + 16))(v4);
  (*(void (**)(uint64_t))(*(_QWORD *)v4 + 8))(v4);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
  if (WeakRetained)
  {
    v6 = WeakRetained;
    v7 = *(unsigned int *)(a2 + 40);
    if ((_DWORD)v7 == -1)
    {
      std::__throw_bad_variant_access[abi:sn180100]();
      __break(1u);
      return;
    }
    v15 = &v14;
    v8 = ((uint64_t (*)(char **, uint64_t))off_1E34BD290[v7])(&v15, a2);
    v9 = objc_msgSend(*((id *)v6 + 61), "forMainFrameNavigation");
    if ((v8 & v9 & 1) != 0)
      goto LABEL_13;
    v10 = (void *)*((_QWORD *)v6 + 61);
    if (v10)
      v11 = v8;
    else
      v11 = 1;
    if (((v11 | v9) & 1) != 0)
    {
      *((_QWORD *)v6 + 61) = 0;
      objc_msgSend(v10, "removeFromSuperview");
      if (v10)
      {
        v12 = v10;
LABEL_12:
        CFRelease(v12);
      }
    }
    else
    {
      WebKit::WebPageProxy::goBack(*((WebKit::WebPageProxy **)v6 + 53), (uint64_t *)&v15);
      v13 = (uint64_t)v15;
      v15 = 0;
      if (v13)
      {
        v12 = *(const void **)(v13 + 8);
        goto LABEL_12;
      }
    }
LABEL_13:
    CFRelease(v6);
  }
}

- (uint64_t)_internalDoAfterNextPresentationUpdate:(uint64_t)a1 withoutWaitingForPainting:withoutWaitingForAnimatedResize:
{
  const void *v2;

  *(_QWORD *)a1 = off_1E34BD2D8;
  v2 = *(const void **)(a1 + 24);
  *(_QWORD *)(a1 + 24) = 0;
  if (v2)
    CFRelease(v2);
  _Block_release(*(const void **)(a1 + 8));
  return a1;
}

{
  const void *v2;
  void *v3;

  *(_QWORD *)a1 = off_1E34BD2D8;
  v2 = *(const void **)(a1 + 24);
  *(_QWORD *)(a1 + 24) = 0;
  if (v2)
    CFRelease(v2);
  _Block_release(*(const void **)(a1 + 8));
  return WTF::fastFree((WTF *)a1, v3);
}

- (uint64_t)_internalDoAfterNextPresentationUpdate:(const void *)a1 withoutWaitingForPainting:withoutWaitingForAnimatedResize:
{
  void *v2;

  *a1 = off_1E34BD2B0;
  _Block_release(a1[1]);
  return WTF::fastFree((WTF *)a1, v2);
}

- (void)_internalDoAfterNextPresentationUpdate:(uint64_t)a1 withoutWaitingForPainting:withoutWaitingForAnimatedResize:
{
  void (**v2)(void);
  uint64_t v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  _QWORD *v11;

  v2 = *(void (***)(void))(a1 + 8);
  if (v2)
  {
    if (*(_BYTE *)(a1 + 16) || (v3 = *(_QWORD *)(a1 + 24), !*(_DWORD *)(v3 + 748)))
    {
      v2[2]();
    }
    else
    {
      v4 = v3 + 1632;
      v5 = _Block_copy(v2);
      v6 = *(unsigned int *)(v4 + 12);
      if ((_DWORD)v6 == *(_DWORD *)(v4 + 8))
      {
        v7 = v6 + (v6 >> 2);
        if (v7 >= 0x10)
          v8 = v7 + 1;
        else
          v8 = 16;
        if (v8 <= v6 + 1)
          v9 = v6 + 1;
        else
          v9 = v8;
        WTF::Vector<WTF::Function<void ()(void)>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::reserveCapacity<(WTF::FailureAction)0>(v4, v9);
        v6 = *(unsigned int *)(v4 + 12);
        v10 = *(_QWORD *)v4;
        v11 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
      }
      else
      {
        v10 = *(_QWORD *)v4;
        v11 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
      }
      *v11 = off_1E34BD300;
      v11[1] = v5;
      *(_QWORD *)(v10 + 8 * v6) = v11;
      ++*(_DWORD *)(v4 + 12);
      _Block_release(0);
    }
  }
}

- (uint64_t)_internalDoAfterNextPresentationUpdate:withoutWaitingForPainting:withoutWaitingForAnimatedResize:
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 8) + 16))();
}

- (uint64_t)createPDFWithConfiguration:(uint64_t)a1 completionHandler:
{
  *(_QWORD *)a1 = off_1E34BD328;
  _Block_release(*(const void **)(a1 + 8));
  return a1;
}

- (uint64_t)createPDFWithConfiguration:(const void *)a1 completionHandler:
{
  void *v2;

  *a1 = off_1E34BD328;
  _Block_release(a1[1]);
  return WTF::fastFree((WTF *)a1, v2);
}

- (void)createPDFWithConfiguration:(uint64_t)a1 completionHandler:(WebCore::SharedBuffer *)a2
{
  WebCore::SharedBuffer *v3;
  CFTypeRef v4;
  CFTypeRef cf;

  v3 = *a2;
  if (*a2 && *((_QWORD *)v3 + 6))
  {
    WebCore::SharedBuffer::createCFData(v3);
    (*(void (**)(void))(*(_QWORD *)(a1 + 8) + 16))();
  }
  else
  {
    createNSError(WKErrorUnknown, 0, &cf);
    (*(void (**)(void))(*(_QWORD *)(a1 + 8) + 16))();
  }
  v4 = cf;
  cf = 0;
  if (v4)
    CFRelease(v4);
}

- (uint64_t)createWebArchiveDataWithCompletionHandler:(uint64_t)a1
{
  uint64_t (*v3)(void);

  if (a2)
  {
    v3 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 8) + 16);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("WKErrorDomain"), 1, 0);
    v3 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 8) + 16);
  }
  return v3();
}

- (uint64_t)createWebArchiveDataWithCompletionHandler:(const void *)a1
{
  void *v2;

  *a1 = off_1E34BD350;
  _Block_release(a1[1]);
  return WTF::fastFree((WTF *)a1, v2);
}

- (uint64_t)willBeginWritingToolsSession:(uint64_t)a1 requestContexts:
{
  *(_QWORD *)a1 = off_1E34BD378;
  _Block_release(*(const void **)(a1 + 8));
  return a1;
}

- (uint64_t)willBeginWritingToolsSession:(const void *)a1 requestContexts:
{
  void *v2;

  *a1 = off_1E34BD378;
  _Block_release(a1[1]);
  return WTF::fastFree((WTF *)a1, v2);
}

- (uint64_t)willBeginWritingToolsSession:(uint64_t)a1 requestContexts:(uint64_t)a2
{
  void *v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  CFTypeRef v8;
  CFTypeRef cf;

  v4 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", *(unsigned int *)(a2 + 12));
  v5 = *(unsigned int *)(a2 + 12);
  if ((_DWORD)v5)
  {
    v6 = *(_QWORD **)a2;
    v7 = 80 * v5;
    do
    {
      WebKit::convertToPlatformContext(v6, &cf);
      objc_msgSend(v4, "addObject:", cf);
      v8 = cf;
      cf = 0;
      if (v8)
        CFRelease(v8);
      v6 += 10;
      v7 -= 80;
    }
    while (v7);
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 8) + 16))();
}

- (NSString)_caLayerTreeAsText
{
  WTF::StringImpl *v3;
  const __CFString *v4;
  WTF::StringImpl *v5;
  WTF::StringImpl *v6;
  WTF::StringImpl *v8;
  WTF::StringImpl *v9;
  WTF::StringImpl *v10;
  int v11;
  char v12;
  int v13;
  __int16 v14;
  int v15;

  v9 = 0;
  v10 = 0;
  v11 = 0;
  v12 = 1;
  v13 = 0;
  v14 = 256;
  v15 = 0;
  WTF::TextStream::startGroup((WTF::TextStream *)&v9);
  WTF::TextStream::operator<<();
  dumpCALayer((WTF::TextStream *)&v9, (CALayer *)objc_msgSend(self->_contentView.m_ptr, "layer"));
  WTF::TextStream::endGroup((WTF::TextStream *)&v9);
  WTF::TextStream::release((WTF::TextStream *)&v9);
  if (v8)
  {
    v4 = (const __CFString *)WTF::StringImpl::operator NSString *();
    if (*(_DWORD *)v8 == 2)
      WTF::StringImpl::destroy(v8, v3);
    else
      *(_DWORD *)v8 -= 2;
  }
  else
  {
    v4 = &stru_1E351F1B8;
  }
  v5 = v10;
  v10 = 0;
  if (v5)
  {
    if (*(_DWORD *)v5 == 2)
      WTF::StringImpl::destroy(v5, v3);
    else
      *(_DWORD *)v5 -= 2;
  }
  v6 = v9;
  v9 = 0;
  if (v6)
  {
    if (*(_DWORD *)v6 == 2)
      WTF::StringImpl::destroy(v6, v3);
    else
      *(_DWORD *)v6 -= 2;
  }
  return &v4->isa;
}

- (void)_addEventAttributionWithSourceID:(unsigned __int8)a3 destinationURL:(id)a4 sourceDescription:(id)a5 purchaser:(id)a6 reportEndpoint:(id)a7 optionalNonce:(id)a8 applicationBundleID:(id)a9 ephemeral:(BOOL)a10
{
  WTF::WallTime *v14;
  WTF::StringImpl *v15;
  uint64_t v16;
  WTF::StringImpl *v17;
  WTF::StringImpl *v18;
  WTF::StringImpl *v19;
  int v20;
  WTF::StringImpl *v21;
  WTF::StringImpl *v22;
  WTF::StringImpl *v23;
  WTF::StringImpl *v24;
  WTF::StringImpl *v25;
  WTF::StringImpl *v26;
  WTF::StringImpl *v27;
  WTF::StringImpl *v28[5];
  WTF::StringImpl *v29;
  WTF::StringImpl *v30[5];
  WTF::StringImpl *v31;
  char v32[8];
  WTF::StringImpl *v33;
  WTF::StringImpl *v34;
  uint64_t v35;
  BOOL v36;
  char v37;
  char v38;
  char v39;
  char v40;
  char v41;
  char v42;
  char v43;
  char v44;
  char v45;
  char v46;
  __int128 v47;
  __int128 v48;
  char v49;
  char v50;
  WTF::StringImpl *v51;

  MEMORY[0x19AEABB18](v30, a7, a3, a4, a5, a6);
  WebCore::RegistrableDomain::RegistrableDomain(&v31, (const WTF::URL *)v30);
  MEMORY[0x19AEABB18](v28, a4);
  WebCore::RegistrableDomain::RegistrableDomain(&v29, (const WTF::URL *)v28);
  v14 = (WTF::WallTime *)MEMORY[0x19AEABCC8](&v27, a9);
  WTF::WallTime::now(v14);
  v32[0] = a3;
  v17 = v31;
  if (v31)
    *(_DWORD *)v31 += 2;
  v33 = v17;
  v18 = v29;
  if (v29)
    *(_DWORD *)v29 += 2;
  v34 = v18;
  v35 = v16;
  v36 = a10;
  v37 = 0;
  v38 = 0;
  v39 = 0;
  v40 = 0;
  v41 = 0;
  v42 = 0;
  v43 = 0;
  v44 = 0;
  v45 = 0;
  v46 = 0;
  v50 = 0;
  v47 = 0u;
  v48 = 0u;
  v49 = 0;
  v19 = v27;
  if (v27)
  {
    v20 = *(_DWORD *)v27;
    *(_DWORD *)v27 += 2;
    v51 = v19;
    v27 = 0;
    if (v20)
    {
      *(_DWORD *)v19 = v20;
    }
    else
    {
      WTF::StringImpl::destroy(v19, v15);
      v18 = v29;
    }
  }
  else
  {
    v51 = 0;
  }
  v29 = 0;
  if (v18)
  {
    if (*(_DWORD *)v18 == 2)
      WTF::StringImpl::destroy(v18, v15);
    else
      *(_DWORD *)v18 -= 2;
  }
  v21 = v28[0];
  v28[0] = 0;
  if (v21)
  {
    if (*(_DWORD *)v21 == 2)
      WTF::StringImpl::destroy(v21, v15);
    else
      *(_DWORD *)v21 -= 2;
  }
  v22 = v31;
  v31 = 0;
  if (v22)
  {
    if (*(_DWORD *)v22 == 2)
      WTF::StringImpl::destroy(v22, v15);
    else
      *(_DWORD *)v22 -= 2;
  }
  v23 = v30[0];
  v30[0] = 0;
  if (v23)
  {
    if (*(_DWORD *)v23 == 2)
    {
      WTF::StringImpl::destroy(v23, v15);
      if (!a8)
        goto LABEL_31;
      goto LABEL_27;
    }
    *(_DWORD *)v23 -= 2;
  }
  if (!a8)
    goto LABEL_31;
LABEL_27:
  MEMORY[0x19AEABCC8](v30, a8);
  WebCore::PrivateClickMeasurement::setEphemeralSourceNonce();
  v25 = v30[0];
  v30[0] = 0;
  if (v25)
  {
    if (*(_DWORD *)v25 == 2)
      WTF::StringImpl::destroy(v25, v24);
    else
      *(_DWORD *)v25 -= 2;
  }
LABEL_31:
  WebKit::WebPageProxy::setPrivateClickMeasurement((uint64_t)self->_page.m_ptr, v32);
  WebCore::PrivateClickMeasurement::~PrivateClickMeasurement((WebCore::PrivateClickMeasurement *)v32, v26);
}

- (void)_setPageScale:(double)a3 withOrigin:(CGPoint)a4
{
  WebPageProxy *m_ptr;
  float v6;
  uint64_t v7;
  uint64_t v8;
  float v9;
  uint64_t v10;
  unint64_t v11;
  float v12[2];
  uint64_t v13;
  CGPoint v14;

  v14 = a4;
  m_ptr = self->_page.m_ptr;
  WebCore::FloatPoint::FloatPoint((WebCore::FloatPoint *)v12, &v14);
  v6 = roundf(v12[0]);
  v7 = 0x7FFFFFFFLL;
  v8 = (int)v6;
  if (v6 <= -2147500000.0)
    v8 = 0x80000000;
  if (v6 < 2147500000.0)
    v7 = v8;
  v9 = roundf(v12[1]);
  v10 = 0x7FFFFFFF00000000;
  v11 = 0x8000000000000000;
  if (v9 > -2147500000.0)
    v11 = (unint64_t)(int)v9 << 32;
  if (v9 < 2147500000.0)
    v10 = v11;
  v13 = v10 | v7;
  WebKit::WebPageProxy::scalePage((uint64_t)m_ptr, a3, (const WebCore::IntPoint *)&v13);
}

- (double)_pageScale
{
  WebPageProxy *m_ptr;
  uint64_t v3;

  m_ptr = self->_page.m_ptr;
  v3 = 672;
  if (!*((_BYTE *)m_ptr + 857))
    v3 = 640;
  return *(double *)((char *)m_ptr + v3);
}

- (void)_setContinuousSpellCheckingEnabledForTesting:(BOOL)a3
{
  objc_msgSend(self->_contentView.m_ptr, "setContinuousSpellCheckingEnabled:", a3);
}

- (void)_setGrammarCheckingEnabledForTesting:(BOOL)a3
{
  objc_msgSend(self->_contentView.m_ptr, "setGrammarCheckingEnabled:", a3);
}

- (id)_contentsOfUserInterfaceItem:(id)a3
{
  uint64_t v5;
  WTF::StringImpl **v6;
  WTF::StringImpl *v7;
  double v8;
  const __CFString *v10;
  WTF::StringImpl *v11;
  void *v12;
  _QWORD v13[2];
  _QWORD v14[2];
  id v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(a3, "isEqualToString:", CFSTR("validationBubble")))
    return (id)objc_msgSend(self->_contentView.m_ptr, "_contentsOfUserInterfaceItem:", a3);
  v5 = *((_QWORD *)self->_page.m_ptr + 102);
  v6 = (WTF::StringImpl **)(v5 + 16);
  if (!v5)
    v6 = (WTF::StringImpl **)MEMORY[0x1E0CBF738];
  v7 = *v6;
  if (*v6)
    *(_DWORD *)v7 += 2;
  if (v5)
    v8 = *(double *)(v5 + 24);
  else
    v8 = 0.0;
  v15 = a3;
  v13[0] = CFSTR("message");
  if (v7)
    v10 = (const __CFString *)WTF::StringImpl::operator NSString *();
  else
    v10 = &stru_1E351F1B8;
  v13[1] = CFSTR("fontSize");
  v14[0] = v10;
  v14[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v8);
  v16[0] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v12 = (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
  if (v7)
  {
    if (*(_DWORD *)v7 == 2)
      WTF::StringImpl::destroy(v7, v11);
    else
      *(_DWORD *)v7 -= 2;
  }
  return v12;
}

- (void)_requestActiveNowPlayingSessionInfo:(id)a3
{
  WebPageProxy *m_ptr;
  void *v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  char v9;

  m_ptr = self->_page.m_ptr;
  if (m_ptr)
  {
    v4 = _Block_copy(a3);
    v5 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
    *v5 = off_1E34BF158;
    v5[1] = v4;
    v8 = v5;
    v6 = *((_QWORD *)m_ptr + 26);
    v9 = 0;
    WebKit::AuxiliaryProcessProxy::sendWithAsyncReply<Messages::WebPage::RequestActiveNowPlayingSessionInfo,WTF::CompletionHandler<void ()(BOOL,WebCore::NowPlayingInfo &&)>>(v6, (uint64_t)&v9, (uint64_t *)&v8, *(_QWORD *)(*((_QWORD *)m_ptr + 4) + 1896), 0, 1);
    v7 = (uint64_t)v8;
    v8 = 0;
    if (v7)
      (*(void (**)(uint64_t))(*(_QWORD *)v7 + 8))(v7);
    _Block_release(0);
  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD, const __CFString *, _QWORD, double, double))a3 + 2))(a3, 0, 0, &stru_1E351F1B8, 0, NAN, NAN);
  }
}

- (void)_setNowPlayingMetadataObserver:(id)a3
{
  WebPageProxy *m_ptr;
  void *v5;
  _QWORD *v6;
  _QWORD *v7;
  _QWORD *v8;
  _QWORD *v9;

  m_ptr = self->_page.m_ptr;
  if (m_ptr)
  {
    CFRetain(*((CFTypeRef *)m_ptr + 1));
    if (a3)
    {
      v5 = _Block_copy(a3);
      v6 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
      v7 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
      *v7 = off_1E34BF120;
      v7[1] = v5;
      *v6 = 0;
      v6[1] = v7;
      v9 = v6;
      _Block_release(0);
    }
    else
    {
      v9 = 0;
    }
    WebKit::WebPageProxy::setNowPlayingMetadataObserverForTesting((uint64_t)m_ptr, &v9);
    v8 = v9;
    v9 = 0;
    if (v8)
      std::default_delete<WTF::Observer<void ()(WebCore::NowPlayingMetadata const&)>>::operator()[abi:sn180100]((uint64_t)&v9, (uint64_t)v8);
    CFRelease(*((CFTypeRef *)m_ptr + 1));
  }
}

- (BOOL)_scrollingUpdatesDisabledForTesting
{
  return 0;
}

- (NSString)_scrollingTreeAsText
{
  WebKit::RemoteScrollingCoordinatorProxy *v2;
  WTF::StringImpl *v3;
  NSString *v4;
  WTF::StringImpl *v5;
  WTF::StringImpl *v7;

  v2 = (WebKit::RemoteScrollingCoordinatorProxy *)*((_QWORD *)self->_page.m_ptr + 25);
  if (!v2)
    return (NSString *)&stru_1E351F1B8;
  WebKit::RemoteScrollingCoordinatorProxy::scrollingTreeAsText(v2, &v7);
  if (!v7)
    return (NSString *)&stru_1E351F1B8;
  v4 = (NSString *)WTF::StringImpl::operator NSString *();
  v5 = v7;
  v7 = 0;
  if (v5)
  {
    if (*(_DWORD *)v5 == 2)
      WTF::StringImpl::destroy(v5, v3);
    else
      *(_DWORD *)v5 -= 2;
  }
  return v4;
}

- (int)_networkProcessIdentifier
{
  uint64_t v2;
  uint64_t v3;
  int result;

  v2 = *(_QWORD *)(*((_QWORD *)self->_page.m_ptr + 33) + 408);
  if (v2)
  {
    v3 = *(_QWORD *)(v2 + 136);
    if (v3)
      return *(_DWORD *)(v3 + 108);
    else
      return 0;
  }
  else
  {
    result = 274;
    __break(0xC471u);
  }
  return result;
}

- (unint64_t)_countOfUpdatesWithLayerChanges
{
  uint64_t v2;

  v2 = *((_QWORD *)self->_page.m_ptr + 23);
  if (v2 && !*(_BYTE *)(v2 + 32))
    return *(unsigned int *)(v2 + 200);
  else
    return 0;
}

- (void)_doAfterNextPresentationUpdateWithoutWaitingForAnimatedResizeForTesting:(id)a3
{
  -[WKWebView _internalDoAfterNextPresentationUpdate:withoutWaitingForPainting:withoutWaitingForAnimatedResize:](self, "_internalDoAfterNextPresentationUpdate:withoutWaitingForPainting:withoutWaitingForAnimatedResize:", a3, 0, 1);
}

- (void)_disableBackForwardSnapshotVolatilityForTesting
{
  {
    WebKit::ViewSnapshotStore::singleton(void)::store = 0u;
    *(_OWORD *)&qword_1ECE738B8 = 0u;
  }
  byte_1ECE738C8 = 1;
}

- (BOOL)_beginBackSwipeForTesting
{
  ViewGestureController *value;

  value = self->_gestureController.__ptr_.__value_;
  if (value)
    LOBYTE(value) = WebKit::ViewGestureController::beginSimulatedSwipeInDirectionForTesting((uint64_t)value, 0);
  return (char)value;
}

- (BOOL)_completeBackSwipeForTesting
{
  ViewGestureController *value;

  value = self->_gestureController.__ptr_.__value_;
  if (value)
    objc_msgSend((id)objc_msgSend(*((id *)value + 17), "transitionForDirection:", 0), "_completeStoppedInteractiveTransition");
  return value != 0;
}

- (void)_resetNavigationGestureStateForTesting
{
  id *value;

  value = (id *)self->_gestureController.__ptr_.__value_;
  if (value)
  {
    WebKit::ViewGestureController::removeSwipeSnapshot((id *)self->_gestureController.__ptr_.__value_);
    WebKit::ViewGestureController::resetState(value);
  }
}

- (void)_setDefersLoadingForTesting:(BOOL)a3
{
  WebKit::WebPageProxyTesting *v3;

  v3 = (WebKit::WebPageProxyTesting *)*((_QWORD *)self->_page.m_ptr + 181);
  if (v3)
    WebKit::WebPageProxyTesting::setDefersLoading(v3, a3);
}

- (void)_setShareSheetCompletesImmediatelyWithResolutionForTesting:(BOOL)a3
{
  self->_resolutionForShareSheetImmediateCompletionForTesting = (optional<BOOL>)(a3 | 0x100);
}

- (void)_processWillSuspendForTesting:(id)a3
{
  WebPageProxy *m_ptr;
  uint64_t v4;
  void *v5;
  _QWORD *v6;
  uint64_t v7;
  _QWORD *v8;

  m_ptr = self->_page.m_ptr;
  if (m_ptr)
  {
    v4 = *((_QWORD *)m_ptr + 26);
    v5 = _Block_copy(a3);
    v6 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
    *v6 = off_1E34BF180;
    v6[1] = v5;
    v8 = v6;
    WebKit::WebProcessProxy::sendPrepareToSuspend(v4, 0, (uint64_t *)&v8, 0.0);
    v7 = (uint64_t)v8;
    v8 = 0;
    if (v7)
      (*(void (**)(uint64_t))(*(_QWORD *)v7 + 8))(v7);
    _Block_release(0);
  }
  else
  {
    (*((void (**)(id))a3 + 2))(a3);
  }
}

- (void)_processWillSuspendImminentlyForTesting
{
  WebPageProxy *m_ptr;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  _QWORD *v6;

  m_ptr = self->_page.m_ptr;
  if (m_ptr)
  {
    v3 = *((_QWORD *)m_ptr + 26);
    v4 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
    *v4 = off_1E34BF1A8;
    v6 = v4;
    WebKit::WebProcessProxy::sendPrepareToSuspend(v3, 1, (uint64_t *)&v6, 0.0);
    v5 = (uint64_t)v6;
    v6 = 0;
    if (v5)
      (*(void (**)(uint64_t))(*(_QWORD *)v5 + 8))(v5);
  }
}

- (void)_processDidResumeForTesting
{
  WebPageProxy *m_ptr;

  m_ptr = self->_page.m_ptr;
  if (m_ptr)
    WebKit::WebProcessProxy::sendProcessDidResume(*((WebKit::WebProcessProxy **)m_ptr + 26));
}

- (void)_setThrottleStateForTesting:(int)a3
{
  WebPageProxy *m_ptr;
  uint64_t v4;

  m_ptr = self->_page.m_ptr;
  if (m_ptr)
  {
    v4 = *((_QWORD *)m_ptr + 26);
    *(_BYTE *)(v4 + 680) = 1;
    WebKit::WebProcessProxy::didChangeThrottleState(v4, a3);
    *(_BYTE *)(v4 + 680) = 0;
  }
}

- (BOOL)_hasServiceWorkerBackgroundActivityForTesting
{
  WebPageProxy *m_ptr;
  WebKit::WebProcessPool *v3;

  m_ptr = self->_page.m_ptr;
  if (!m_ptr)
    return 0;
  v3 = API::PageConfiguration::Data::LazyInitializedRef<WebKit::WebProcessPool,&API::PageConfiguration::Data::createWebProcessPool>::get((WebKit::WebProcessPool **)(*((_QWORD *)m_ptr + 6) + 24));
  return WebKit::WebProcessPool::hasServiceWorkerBackgroundActivityForTesting(v3);
}

- (BOOL)_hasServiceWorkerForegroundActivityForTesting
{
  WebPageProxy *m_ptr;
  WebKit::WebProcessPool *v3;

  m_ptr = self->_page.m_ptr;
  if (!m_ptr)
    return 0;
  v3 = API::PageConfiguration::Data::LazyInitializedRef<WebKit::WebProcessPool,&API::PageConfiguration::Data::createWebProcessPool>::get((WebKit::WebProcessPool **)(*((_QWORD *)m_ptr + 6) + 24));
  return WebKit::WebProcessPool::hasServiceWorkerForegroundActivityForTesting(v3);
}

- (void)_denyNextUserMediaRequest
{
  {
    WebKit::UserMediaProcessManager::singleton(void)::manager = (uint64_t)&off_1E34D2148;
    unk_1EE341E10 = 0;
    qword_1EE341E18 = 0;
    unk_1EE341E20 = 0;
    LOBYTE(word_1EE341E28) = 1;
  }
  HIBYTE(word_1EE341E28) = 1;
}

- (void)_setIndexOfGetDisplayMediaDeviceSelectedForTesting:(id)a3
{
  WebPageProxy *m_ptr;
  int v5;
  unsigned int v6;
  int v7;
  uint64_t v8;

  m_ptr = self->_page.m_ptr;
  if (m_ptr)
  {
    if (a3)
    {
      v5 = objc_msgSend(a3, "unsignedIntValue");
      v6 = v5 & 0xFFFFFF00;
      v7 = v5;
      m_ptr = self->_page.m_ptr;
      v8 = 0x100000000;
    }
    else
    {
      v8 = 0;
      v7 = 0;
      v6 = 0;
    }
    if (*((_QWORD *)m_ptr + 181))
    {
      {
        dword_1EE341DD4 = 0;
      }
      WebKit::DisplayCaptureSessionManager::singleton(void)::manager = v8 | v6 | v7;
      byte_1EE341DD0 = BYTE4(v8);
    }
  }
}

- (void)_setSystemCanPromptForGetDisplayMediaForTesting:(BOOL)a3
{
  WebPageProxy *m_ptr;
  int v4;

  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((_QWORD *)m_ptr + 181))
  {
    {
      LOBYTE(WebKit::DisplayCaptureSessionManager::singleton(void)::manager) = 0;
      byte_1EE341DD0 = 0;
    }
    if (a3)
      v4 = 1;
    else
      v4 = 2;
    dword_1EE341DD4 = v4;
  }
}

- (double)_mediaCaptureReportingDelayForTesting
{
  return *((double *)self->_page.m_ptr + 124);
}

- (void)_setMediaCaptureReportingDelayForTesting:(double)a3
{
  *((double *)self->_page.m_ptr + 124) = a3;
}

- (BOOL)_wirelessVideoPlaybackDisabled
{
  WebKit::PlaybackSessionManagerProxy *v2;

  v2 = (WebKit::PlaybackSessionManagerProxy *)*((_QWORD *)self->_page.m_ptr + 47);
  if (v2)
    LOBYTE(v2) = WebKit::PlaybackSessionManagerProxy::wirelessVideoPlaybackDisabled(v2);
  return (char)v2;
}

- (void)_doAfterProcessingAllPendingMouseEvents:(id)a3
{
  uint64_t *m_ptr;
  void *v4;
  _QWORD *v5;
  _QWORD *v6;
  _QWORD *v7;

  m_ptr = (uint64_t *)self->_page.m_ptr;
  v4 = _Block_copy(a3);
  v5 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
  *v5 = off_1E34BF1D0;
  v5[1] = v4;
  v7 = v5;
  WebKit::WebPageProxy::doAfterProcessingAllPendingMouseEvents(m_ptr, &v7);
  v6 = v7;
  v7 = 0;
  if (v6)
    (*(void (**)(_QWORD *))(*v6 + 8))(v6);
  _Block_release(0);
}

+ (void)_setApplicationBundleIdentifier:(id)a3
{
  const WTF::String *v3;
  WTF::StringImpl *v4;
  WTF::StringImpl *v5;
  WTF::StringImpl *v6;

  MEMORY[0x19AEABCC8](&v6, a3);
  WebCore::setApplicationBundleIdentifierOverride((WebCore *)&v6, v3);
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

- (BOOL)_hasSleepDisabler
{
  WebPageProxy *m_ptr;
  uint64_t v3;

  m_ptr = self->_page.m_ptr;
  return m_ptr && (v3 = *(_QWORD *)(*((_QWORD *)m_ptr + 4) + 1968)) != 0 && *(_DWORD *)(v3 - 12) != 0;
}

- (id)_scrollbarStateForScrollingNodeID:(unint64_t)a3 processID:(unint64_t)a4 isVertical:(BOOL)a5
{
  WebPageProxy *m_ptr;
  void *v6;
  WTF::StringImpl *v7;
  WTF::StringImpl *v8;
  WTF::StringImpl *v9;
  WTF::StringImpl *v11;

  m_ptr = self->_page.m_ptr;
  if (!m_ptr)
    return &stru_1E351F1B8;
  if (*((_QWORD *)m_ptr + 25))
  {
    WebKit::RemoteScrollingCoordinatorProxy::scrollbarStateForScrollingNodeID(a5, &v11);
    if (!v11)
      return &stru_1E351F1B8;
  }
  else
  {
    v7 = (WTF::StringImpl *)MEMORY[0x1E0CBEF70];
    *MEMORY[0x1E0CBEF70] += 2;
    v11 = v7;
  }
  v6 = (void *)WTF::StringImpl::operator NSString *();
  v9 = v11;
  v11 = 0;
  if (v9)
  {
    if (*(_DWORD *)v9 == 2)
      WTF::StringImpl::destroy(v9, v8);
    else
      *(_DWORD *)v9 -= 2;
  }
  return v6;
}

- (int)_audioRoutingArbitrationStatus
{
  return 0;
}

- (double)_audioRoutingArbitrationUpdateTime
{
  return 0.0;
}

- (void)_doAfterActivityStateUpdate:(id)a3
{
  WebPageProxy *m_ptr;
  void *v4;
  _QWORD *v5;
  uint64_t v6;
  _QWORD *v7;

  m_ptr = self->_page.m_ptr;
  v4 = _Block_copy(a3);
  v5 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
  *v5 = off_1E34BDAC8;
  v5[1] = v4;
  v7 = v5;
  WebKit::WebPageProxy::addActivityStateUpdateCompletionHandler((unint64_t)m_ptr, (uint64_t *)&v7);
  v6 = (uint64_t)v7;
  v7 = 0;
  if (v6)
    (*(void (**)(uint64_t))(*(_QWORD *)v6 + 8))(v6);
  _Block_release(0);
}

- (id)_suspendMediaPlaybackCounter
{
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", *((_QWORD *)self->_page.m_ptr + 159));
}

- (void)_setPrivateClickMeasurementOverrideTimerForTesting:(BOOL)a3 completionHandler:(id)a4
{
  uint64_t v4;
  void *v6;
  _QWORD *v7;
  uint64_t v8;
  _QWORD *v9;

  v4 = *((_QWORD *)self->_page.m_ptr + 181);
  if (v4)
  {
    v6 = _Block_copy(a4);
    v7 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
    *v7 = off_1E34BF1F8;
    v7[1] = v6;
    v9 = v7;
    WebKit::WebPageProxyTesting::setPrivateClickMeasurementOverrideTimer(v4, a3, (uint64_t *)&v9);
    v8 = (uint64_t)v9;
    v9 = 0;
    if (v8)
      (*(void (**)(uint64_t))(*(_QWORD *)v8 + 8))(v8);
    _Block_release(0);
  }
  else
  {
    (*((void (**)(id))a4 + 2))(a4);
  }
}

- (void)_setPrivateClickMeasurementAttributionReportURLsForTesting:(id)a3 destinationURL:(id)a4 completionHandler:(id)a5
{
  uint64_t v6;
  void *v8;
  _QWORD *v9;
  uint64_t v10;
  WTF::StringImpl *v11;
  WTF::StringImpl *v12;
  WTF::StringImpl *v13;
  _QWORD *v14;
  WTF::StringImpl *v15[5];
  WTF::StringImpl *v16[5];

  v6 = *((_QWORD *)self->_page.m_ptr + 181);
  if (v6)
  {
    MEMORY[0x19AEABB18](v16, a3);
    MEMORY[0x19AEABB18](v15, a4);
    v8 = _Block_copy(a5);
    v9 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
    *v9 = off_1E34BF220;
    v9[1] = v8;
    v14 = v9;
    WebKit::WebPageProxyTesting::setPrivateClickMeasurementAttributionReportURLs(v6, (uint64_t *)v16, (uint64_t *)v15, (uint64_t *)&v14);
    v10 = (uint64_t)v14;
    v14 = 0;
    if (v10)
      (*(void (**)(uint64_t))(*(_QWORD *)v10 + 8))(v10);
    _Block_release(0);
    v12 = v15[0];
    v15[0] = 0;
    if (v12)
    {
      if (*(_DWORD *)v12 == 2)
        WTF::StringImpl::destroy(v12, v11);
      else
        *(_DWORD *)v12 -= 2;
    }
    v13 = v16[0];
    v16[0] = 0;
    if (v13)
    {
      if (*(_DWORD *)v13 == 2)
        WTF::StringImpl::destroy(v13, v11);
      else
        *(_DWORD *)v13 -= 2;
    }
  }
  else
  {
    (*((void (**)(id))a5 + 2))(a5);
  }
}

- (void)_setPrivateClickMeasurementAttributionTokenPublicKeyURLForTesting:(id)a3 completionHandler:(id)a4
{
  uint64_t v5;
  void *v6;
  _QWORD *v7;
  uint64_t v8;
  WTF::StringImpl *v9;
  WTF::StringImpl *v10;
  _QWORD *v11;
  WTF::StringImpl *v12[5];

  v5 = *((_QWORD *)self->_page.m_ptr + 181);
  if (v5)
  {
    MEMORY[0x19AEABB18](v12, a3);
    v6 = _Block_copy(a4);
    v7 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
    *v7 = off_1E34BF248;
    v7[1] = v6;
    v11 = v7;
    WebKit::WebPageProxyTesting::setPrivateClickMeasurementTokenPublicKeyURL(v5, (uint64_t *)v12, (uint64_t *)&v11);
    v8 = (uint64_t)v11;
    v11 = 0;
    if (v8)
      (*(void (**)(uint64_t))(*(_QWORD *)v8 + 8))(v8);
    _Block_release(0);
    v10 = v12[0];
    v12[0] = 0;
    if (v10)
    {
      if (*(_DWORD *)v10 == 2)
        WTF::StringImpl::destroy(v10, v9);
      else
        *(_DWORD *)v10 -= 2;
    }
  }
  else
  {
    (*((void (**)(id))a4 + 2))(a4);
  }
}

- (void)_setPrivateClickMeasurementAttributionTokenSignatureURLForTesting:(id)a3 completionHandler:(id)a4
{
  uint64_t v5;
  void *v6;
  _QWORD *v7;
  uint64_t v8;
  WTF::StringImpl *v9;
  WTF::StringImpl *v10;
  _QWORD *v11;
  WTF::StringImpl *v12[5];

  v5 = *((_QWORD *)self->_page.m_ptr + 181);
  if (v5)
  {
    MEMORY[0x19AEABB18](v12, a3);
    v6 = _Block_copy(a4);
    v7 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
    *v7 = off_1E34BF270;
    v7[1] = v6;
    v11 = v7;
    WebKit::WebPageProxyTesting::setPrivateClickMeasurementTokenSignatureURL(v5, (uint64_t *)v12, (uint64_t *)&v11);
    v8 = (uint64_t)v11;
    v11 = 0;
    if (v8)
      (*(void (**)(uint64_t))(*(_QWORD *)v8 + 8))(v8);
    _Block_release(0);
    v10 = v12[0];
    v12[0] = 0;
    if (v10)
    {
      if (*(_DWORD *)v10 == 2)
        WTF::StringImpl::destroy(v10, v9);
      else
        *(_DWORD *)v10 -= 2;
    }
  }
  else
  {
    (*((void (**)(id))a4 + 2))(a4);
  }
}

- (void)_setPrivateClickMeasurementAppBundleIDForTesting:(id)a3 completionHandler:(id)a4
{
  uint64_t v5;
  void *v6;
  _QWORD *v7;
  uint64_t v8;
  WTF::StringImpl *v9;
  WTF::StringImpl *v10;
  _QWORD *v11;
  WTF::StringImpl *v12;

  v5 = *((_QWORD *)self->_page.m_ptr + 181);
  if (v5)
  {
    MEMORY[0x19AEABCC8](&v12, a3);
    v6 = _Block_copy(a4);
    v7 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
    *v7 = off_1E34BF298;
    v7[1] = v6;
    v11 = v7;
    WebKit::WebPageProxyTesting::setPrivateClickMeasurementAppBundleID(v5, (uint64_t *)&v12, (uint64_t *)&v11);
    v8 = (uint64_t)v11;
    v11 = 0;
    if (v8)
      (*(void (**)(uint64_t))(*(_QWORD *)v8 + 8))(v8);
    _Block_release(0);
    v10 = v12;
    v12 = 0;
    if (v10)
    {
      if (*(_DWORD *)v10 == 2)
        WTF::StringImpl::destroy(v10, v9);
      else
        *(_DWORD *)v10 -= 2;
    }
  }
  else
  {
    (*((void (**)(id))a4 + 2))(a4);
  }
}

- (void)_dumpPrivateClickMeasurement:(id)a3
{
  uint64_t v3;
  void *v4;
  _QWORD *v5;
  uint64_t v6;
  _QWORD *v7;

  v3 = *((_QWORD *)self->_page.m_ptr + 181);
  if (v3)
  {
    v4 = _Block_copy(a3);
    v5 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
    *v5 = off_1E34BF2C0;
    v5[1] = v4;
    v7 = v5;
    WebKit::WebPageProxyTesting::dumpPrivateClickMeasurement(v3, (uint64_t *)&v7);
    v6 = (uint64_t)v7;
    v7 = 0;
    if (v6)
      (*(void (**)(uint64_t))(*(_QWORD *)v6 + 8))(v6);
    _Block_release(0);
  }
  else
  {
    (*((void (**)(id, _QWORD))a3 + 2))(a3, 0);
  }
}

- (BOOL)_shouldBypassGeolocationPromptForTesting
{
  return 0;
}

- (void)_resetInteraction
{
  objc_msgSend(self->_contentView.m_ptr, "cleanUpInteraction");
  objc_msgSend(self->_contentView.m_ptr, "setUpInteraction");
}

- (void)_dismissContactPickerWithContacts:(id)a3
{
  objc_msgSend(self->_contentView.m_ptr, "_dismissContactPickerWithContacts:", a3);
}

- (void)_lastNavigationWasAppInitiated:(id)a3
{
  WebPageProxy *m_ptr;
  void *v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  char v9;

  m_ptr = self->_page.m_ptr;
  v4 = _Block_copy(a3);
  v5 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
  *v5 = off_1E34BF2E8;
  v5[1] = v4;
  v8 = v5;
  v6 = *((_QWORD *)m_ptr + 26);
  v9 = 0;
  WebKit::AuxiliaryProcessProxy::sendWithAsyncReply<Messages::WebPage::LastNavigationWasAppInitiated,WTF::CompletionHandler<void ()(BOOL)>>(v6, (uint64_t)&v9, (uint64_t *)&v8, *(_QWORD *)(*((_QWORD *)m_ptr + 4) + 1896), 0, 1);
  v7 = (uint64_t)v8;
  v8 = 0;
  if (v7)
    (*(void (**)(uint64_t))(*(_QWORD *)v7 + 8))(v7);
  _Block_release(0);
}

- (void)_appPrivacyReportTestingData:(id)a3
{
  WebPageProxy *m_ptr;
  void *v4;
  _QWORD *v5;
  uint64_t v6;
  _QWORD *v7;

  m_ptr = self->_page.m_ptr;
  v4 = _Block_copy(a3);
  v5 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
  *v5 = off_1E34BF310;
  v5[1] = v4;
  v7 = v5;
  WebKit::WebPageProxy::appPrivacyReportTestingData((uint64_t)m_ptr, (uint64_t *)&v7);
  v6 = (uint64_t)v7;
  v7 = 0;
  if (v6)
    (*(void (**)(uint64_t))(*(_QWORD *)v6 + 8))(v6);
  _Block_release(0);
}

- (void)_clearAppPrivacyReportTestingData:(id)a3
{
  WebPageProxy *m_ptr;
  void *v4;
  _QWORD *v5;
  uint64_t v6;
  _QWORD *v7;

  m_ptr = self->_page.m_ptr;
  v4 = _Block_copy(a3);
  v5 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
  *v5 = off_1E34BF338;
  v5[1] = v4;
  v7 = v5;
  WebKit::WebPageProxy::clearAppPrivacyReportTestingData((uint64_t)m_ptr, (uint64_t *)&v7);
  v6 = (uint64_t)v7;
  v7 = 0;
  if (v6)
    (*(void (**)(uint64_t))(*(_QWORD *)v6 + 8))(v6);
  _Block_release(0);
}

- (void)_isLayerTreeFrozenForTesting:(id)a3
{
  uint64_t v3;
  void *v4;
  _QWORD *v5;
  uint64_t v6;
  _QWORD *v7;
  char v8;

  v3 = *((_QWORD *)self->_page.m_ptr + 181);
  if (v3)
  {
    v4 = _Block_copy(a3);
    v5 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
    *v5 = off_1E34BF360;
    v5[1] = v4;
    v7 = v5;
    v8 = 0;
    IPC::MessageSender::sendWithAsyncReply<Messages::WebPageTesting::IsLayerTreeFrozen,WTF::CompletionHandler<void ()(BOOL)>>(v3, (uint64_t)&v8, (uint64_t *)&v7);
    v6 = (uint64_t)v7;
    v7 = 0;
    if (v6)
      (*(void (**)(uint64_t))(*(_QWORD *)v6 + 8))(v6);
    _Block_release(0);
  }
  else
  {
    (*((void (**)(id, _QWORD))a3 + 2))(a3, 0);
  }
}

- (void)_computePagesForPrinting:(id)a3 completionHandler:(id)a4
{
  WebPageProxy *m_ptr;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _QWORD *v8;
  _QWORD *v9;
  _QWORD *v10;
  _QWORD v11[4];

  memset(v11, 0, 29);
  m_ptr = self->_page.m_ptr;
  v5 = *((_QWORD *)a3 + 3);
  v6 = *((_QWORD *)a3 + 4);
  v7 = _Block_copy(a4);
  v8 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
  *v8 = off_1E34BF388;
  v8[1] = v7;
  v10 = v8;
  WebKit::WebPageProxy::computePagesForPrinting((uint64_t)m_ptr, v5, v6, (uint64_t)v11, (uint64_t)&v10);
  v9 = v10;
  v10 = 0;
  if (v9)
    (*(void (**)(_QWORD *))(*v9 + 8))(v9);
  _Block_release(0);
}

- (void)_gpuToWebProcessConnectionCountForTesting:(id)a3
{
  uint64_t v4;
  unsigned int *v5;
  unsigned int v6;
  void *v7;
  _QWORD *v8;
  uint64_t v9;
  _QWORD *v10;
  char v11;

  v4 = *((_QWORD *)API::PageConfiguration::Data::LazyInitializedRef<WebKit::WebProcessPool,&API::PageConfiguration::Data::createWebProcessPool>::get((WebKit::WebProcessPool **)(*((_QWORD *)self->_page.m_ptr + 6) + 24))
       + 22);
  if (v4)
  {
    v5 = (unsigned int *)(v4 + 16);
    do
      v6 = __ldaxr(v5);
    while (__stlxr(v6 + 1, v5));
    v7 = _Block_copy(a3);
    v8 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
    *v8 = off_1E34BF3B0;
    v8[1] = v7;
    v10 = v8;
    v11 = 0;
    WebKit::AuxiliaryProcessProxy::sendWithAsyncReply<Messages::GPUProcess::WebProcessConnectionCountForTesting,WTF::CompletionHandler<void ()(unsigned long long)>>(v4, (uint64_t)&v11, (uint64_t *)&v10, 0, 0, 1);
    v9 = (uint64_t)v10;
    v10 = 0;
    if (v9)
      (*(void (**)(uint64_t))(*(_QWORD *)v9 + 8))(v9);
    _Block_release(0);
    WTF::ThreadSafeRefCounted<WebKit::AuxiliaryProcessProxy,(WTF::DestructionThread)2>::deref((unsigned int *)(v4 + 16));
  }
  else
  {
    (*((void (**)(id, _QWORD))a3 + 2))(a3, 0);
  }
}

- (void)_setSystemPreviewCompletionHandlerForLoadTesting:(id)a3
{
  WebPageProxy *m_ptr;
  void *v4;
  WTF *v5;
  WTF *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  m_ptr = self->_page.m_ptr;
  v4 = _Block_copy(a3);
  v5 = (WTF *)WTF::fastMalloc((WTF *)0x10);
  v6 = v5;
  *(_QWORD *)v5 = off_1E34BF3D8;
  *((_QWORD *)v5 + 1) = v4;
  v7 = *((_QWORD *)m_ptr + 51);
  if (v7)
  {
    v8 = *(_QWORD *)(v7 + 272);
    *(_QWORD *)(v7 + 272) = v6;
    if (v8)
      (*(void (**)(uint64_t))(*(_QWORD *)v8 + 8))(v8);
  }
  else
  {
    *(_QWORD *)v5 = off_1E34BF3D8;
    _Block_release(v4);
    WTF::fastFree(v6, v9);
  }
  _Block_release(0);
}

- (void)_createMediaSessionCoordinatorForTesting:(id)a3 completionHandler:(id)a4
{
  (*((void (**)(id, _QWORD))a4 + 2))(a4, 0);
}

- (void)setBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  BOOL v10;
  void *m_ptr;
  objc_super v12;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[WKWebView bounds](self, "bounds");
  v10 = v9 == height && v8 == width;
  if (!v10)
    -[WKWebView _frameOrBoundsWillChange](self, "_frameOrBoundsWillChange");
  v12.receiver = self;
  v12.super_class = (Class)WKWebView;
  -[WKWebView setBounds:](&v12, sel_setBounds_, x, y, width, height);
  m_ptr = self->_customContentFixedOverlayView.m_ptr;
  -[WKWebView bounds](self, "bounds");
  objc_msgSend(m_ptr, "setFrame:");
  if (!v10)
  {
    -[WKWebView _frameOrBoundsMayHaveChanged](self, "_frameOrBoundsMayHaveChanged");
    -[WKWebView _acquireResizeAssertionForReason:](self, "_acquireResizeAssertionForReason:", CFSTR("-[WKWebView setBounds:]"));
  }
}

- (void)_incrementFocusPreservationCount
{
  ++self->_focusPreservationCount;
}

- (void)_decrementFocusPreservationCount
{
  unint64_t focusPreservationCount;

  focusPreservationCount = self->_focusPreservationCount;
  if (focusPreservationCount)
    self->_focusPreservationCount = focusPreservationCount - 1;
}

- (void)_dynamicUserInterfaceTraitDidChange
{
  WebPageProxy *m_ptr;

  m_ptr = self->_page.m_ptr;
  if (m_ptr)
  {
    WebKit::WebPageProxy::effectiveAppearanceDidChange((uint64_t)m_ptr);
    -[WKWebView _updateScrollViewBackground](self, "_updateScrollViewBackground");
  }
}

- (void)_populateArchivedSubviews:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WKWebView;
  -[WKWebView _populateArchivedSubviews:](&v5, sel__populateArchivedSubviews_);
  if (self->_scrollView.m_ptr)
    objc_msgSend(a3, "removeObject:");
  if (self->_customContentFixedOverlayView.m_ptr)
    objc_msgSend(a3, "removeObject:");
}

- (id)browsingContextController
{
  if ((WTF::linkedOnOrAfterSDKWithBehavior() & 1) != 0)
    return 0;
  else
    return (id)objc_msgSend(self->_contentView.m_ptr, "browsingContextController");
}

- (BOOL)becomeFirstResponder
{
  id v3;
  void *v4;
  objc_super *v5;
  WKWebView *v7;
  objc_super v8;

  v3 = -[WKWebView _currentContentView](self, "_currentContentView");
  v4 = v3;
  if (self->_contentView.m_ptr == v3 && objc_msgSend(v3, "superview"))
  {
    if ((objc_msgSend(self->_contentView.m_ptr, "becomeFirstResponderForWebView") & 1) != 0)
      return 1;
    v8.receiver = self;
    v5 = &v8;
  }
  else
  {
    if ((objc_msgSend(v4, "becomeFirstResponder") & 1) != 0)
      return 1;
    v7 = self;
    v5 = (objc_super *)&v7;
  }
  v5->super_class = (Class)WKWebView;
  return -[objc_super becomeFirstResponder](v5, sel_becomeFirstResponder, v7);
}

- (BOOL)canBecomeFirstResponder
{
  id v3;

  v3 = -[WKWebView _currentContentView](self, "_currentContentView");
  if (self->_contentView.m_ptr == v3)
    return objc_msgSend(v3, "canBecomeFirstResponderForWebView");
  else
    return 1;
}

- (BOOL)resignFirstResponder
{
  objc_super v4;

  if (objc_msgSend(self->_contentView.m_ptr, "isFirstResponder"))
    return objc_msgSend(self->_contentView.m_ptr, "resignFirstResponderForWebView");
  v4.receiver = self;
  v4.super_class = (Class)WKWebView;
  return -[WKWebView resignFirstResponder](&v4, sel_resignFirstResponder);
}

- (void)captureTextFromCamera:(id)a3
{
  if (-[WKWebView usesStandardContentView](self, "usesStandardContentView"))
    objc_msgSend(self->_contentView.m_ptr, "captureTextFromCameraForWebView:", a3);
}

- (void)useSelectionForFind:(id)a3
{
  if (-[WKWebView usesStandardContentView](self, "usesStandardContentView"))
    objc_msgSend(self->_contentView.m_ptr, "useSelectionForFindForWebView:", a3);
}

- (void)findSelected:(id)a3
{
  if (-[WKWebView usesStandardContentView](self, "usesStandardContentView"))
    objc_msgSend(self->_contentView.m_ptr, "findSelectedForWebView:", a3);
}

- (void)_findSelected:(id)a3
{
  if (-[WKWebView usesStandardContentView](self, "usesStandardContentView"))
    objc_msgSend(self->_contentView.m_ptr, "_findSelectedForWebView:", a3);
}

- (void)addShortcut:(id)a3
{
  if (-[WKWebView usesStandardContentView](self, "usesStandardContentView"))
    objc_msgSend(self->_contentView.m_ptr, "addShortcutForWebView:", a3);
}

- (void)_addShortcut:(id)a3
{
  if (-[WKWebView usesStandardContentView](self, "usesStandardContentView"))
    objc_msgSend(self->_contentView.m_ptr, "_addShortcutForWebView:", a3);
}

- (void)define:(id)a3
{
  if (-[WKWebView usesStandardContentView](self, "usesStandardContentView"))
    objc_msgSend(self->_contentView.m_ptr, "defineForWebView:", a3);
}

- (void)_define:(id)a3
{
  if (-[WKWebView usesStandardContentView](self, "usesStandardContentView"))
    objc_msgSend(self->_contentView.m_ptr, "_defineForWebView:", a3);
}

- (void)lookup:(id)a3
{
  if (-[WKWebView usesStandardContentView](self, "usesStandardContentView"))
    objc_msgSend(self->_contentView.m_ptr, "lookupForWebView:", a3);
}

- (void)_lookup:(id)a3
{
  if (-[WKWebView usesStandardContentView](self, "usesStandardContentView"))
    objc_msgSend(self->_contentView.m_ptr, "_lookupForWebView:", a3);
}

- (void)translate:(id)a3
{
  if (-[WKWebView usesStandardContentView](self, "usesStandardContentView"))
    objc_msgSend(self->_contentView.m_ptr, "translateForWebView:", a3);
}

- (void)_translate:(id)a3
{
  if (-[WKWebView usesStandardContentView](self, "usesStandardContentView"))
    objc_msgSend(self->_contentView.m_ptr, "_translateForWebView:", a3);
}

- (void)promptForReplace:(id)a3
{
  if (-[WKWebView usesStandardContentView](self, "usesStandardContentView"))
    objc_msgSend(self->_contentView.m_ptr, "promptForReplaceForWebView:", a3);
}

- (void)_promptForReplace:(id)a3
{
  if (-[WKWebView usesStandardContentView](self, "usesStandardContentView"))
    objc_msgSend(self->_contentView.m_ptr, "_promptForReplaceForWebView:", a3);
}

- (void)share:(id)a3
{
  if (-[WKWebView usesStandardContentView](self, "usesStandardContentView"))
    objc_msgSend(self->_contentView.m_ptr, "shareForWebView:", a3);
}

- (void)_share:(id)a3
{
  if (-[WKWebView usesStandardContentView](self, "usesStandardContentView"))
    objc_msgSend(self->_contentView.m_ptr, "_shareForWebView:", a3);
}

- (void)transliterateChinese:(id)a3
{
  if (-[WKWebView usesStandardContentView](self, "usesStandardContentView"))
    objc_msgSend(self->_contentView.m_ptr, "transliterateChineseForWebView:", a3);
}

- (void)_transliterateChinese:(id)a3
{
  if (-[WKWebView usesStandardContentView](self, "usesStandardContentView"))
    objc_msgSend(self->_contentView.m_ptr, "_transliterateChineseForWebView:", a3);
}

- (void)_nextAccessoryTab:(id)a3
{
  if (-[WKWebView usesStandardContentView](self, "usesStandardContentView"))
    objc_msgSend(self->_contentView.m_ptr, "_nextAccessoryTabForWebView:", a3);
}

- (void)_previousAccessoryTab:(id)a3
{
  if (-[WKWebView usesStandardContentView](self, "usesStandardContentView"))
    objc_msgSend(self->_contentView.m_ptr, "_previousAccessoryTabForWebView:", a3);
}

- (void)copy:(id)a3
{
  if (-[WKWebView usesStandardContentView](self, "usesStandardContentView"))
    objc_msgSend(self->_contentView.m_ptr, "copyForWebView:", a3);
}

- (void)cut:(id)a3
{
  if (-[WKWebView usesStandardContentView](self, "usesStandardContentView"))
    objc_msgSend(self->_contentView.m_ptr, "cutForWebView:", a3);
}

- (void)paste:(id)a3
{
  if (-[WKWebView usesStandardContentView](self, "usesStandardContentView"))
    objc_msgSend(self->_contentView.m_ptr, "pasteForWebView:", a3);
}

- (void)replace:(id)a3
{
  if (-[WKWebView usesStandardContentView](self, "usesStandardContentView"))
    objc_msgSend(self->_contentView.m_ptr, "replaceForWebView:", a3);
}

- (void)select:(id)a3
{
  if (-[WKWebView usesStandardContentView](self, "usesStandardContentView"))
    objc_msgSend(self->_contentView.m_ptr, "selectForWebView:", a3);
}

- (void)selectAll:(id)a3
{
  if (-[WKWebView usesStandardContentView](self, "usesStandardContentView"))
    objc_msgSend(self->_contentView.m_ptr, "selectAllForWebView:", a3);
}

- (void)toggleBoldface:(id)a3
{
  if (-[WKWebView usesStandardContentView](self, "usesStandardContentView"))
    objc_msgSend(self->_contentView.m_ptr, "toggleBoldfaceForWebView:", a3);
}

- (void)toggleItalics:(id)a3
{
  if (-[WKWebView usesStandardContentView](self, "usesStandardContentView"))
    objc_msgSend(self->_contentView.m_ptr, "toggleItalicsForWebView:", a3);
}

- (void)toggleUnderline:(id)a3
{
  if (-[WKWebView usesStandardContentView](self, "usesStandardContentView"))
    objc_msgSend(self->_contentView.m_ptr, "toggleUnderlineForWebView:", a3);
}

- (void)increaseSize:(id)a3
{
  if (-[WKWebView usesStandardContentView](self, "usesStandardContentView"))
    objc_msgSend(self->_contentView.m_ptr, "increaseSizeForWebView:", a3);
}

- (void)decreaseSize:(id)a3
{
  if (-[WKWebView usesStandardContentView](self, "usesStandardContentView"))
    objc_msgSend(self->_contentView.m_ptr, "decreaseSizeForWebView:", a3);
}

- (void)pasteAndMatchStyle:(id)a3
{
  if (-[WKWebView usesStandardContentView](self, "usesStandardContentView"))
    objc_msgSend(self->_contentView.m_ptr, "pasteAndMatchStyleForWebView:", a3);
}

- (void)makeTextWritingDirectionNatural:(id)a3
{
  if (-[WKWebView usesStandardContentView](self, "usesStandardContentView"))
    objc_msgSend(self->_contentView.m_ptr, "makeTextWritingDirectionNaturalForWebView:", a3);
}

- (void)makeTextWritingDirectionLeftToRight:(id)a3
{
  if (-[WKWebView usesStandardContentView](self, "usesStandardContentView"))
    objc_msgSend(self->_contentView.m_ptr, "makeTextWritingDirectionLeftToRightForWebView:", a3);
}

- (void)makeTextWritingDirectionRightToLeft:(id)a3
{
  if (-[WKWebView usesStandardContentView](self, "usesStandardContentView"))
    objc_msgSend(self->_contentView.m_ptr, "makeTextWritingDirectionRightToLeftForWebView:", a3);
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  WKWebView *v6;
  objc_super v8;

  v6 = self;
  if (sel_captureTextFromCamera_ == a3
    || sel_useSelectionForFind_ == a3
    || sel_findSelected_ == a3
    || sel__findSelected_ == a3
    || sel_addShortcut_ == a3
    || sel__addShortcut_ == a3
    || sel_define_ == a3
    || sel__define_ == a3
    || sel_lookup_ == a3
    || sel__lookup_ == a3
    || sel_translate_ == a3
    || sel__translate_ == a3
    || sel_promptForReplace_ == a3
    || sel__promptForReplace_ == a3
    || sel_share_ == a3
    || sel__share_ == a3
    || sel_transliterateChinese_ == a3
    || sel__transliterateChinese_ == a3
    || sel__nextAccessoryTab_ == a3
    || sel__previousAccessoryTab_ == a3
    || sel_copy_ == a3
    || sel_cut_ == a3
    || sel_paste_ == a3
    || sel_replace_ == a3
    || sel_select_ == a3
    || sel_selectAll_ == a3
    || sel_toggleBoldface_ == a3
    || sel_toggleItalics_ == a3
    || sel_toggleUnderline_ == a3
    || sel_increaseSize_ == a3
    || sel_decreaseSize_ == a3
    || sel_pasteAndMatchStyle_ == a3
    || sel_makeTextWritingDirectionNatural_ == a3
    || sel_makeTextWritingDirectionLeftToRight_ == a3
    || sel_makeTextWritingDirectionRightToLeft_ == a3
    || sel__alignCenter_ == a3
    || sel__alignJustified_ == a3
    || sel__alignLeft_ == a3
    || sel__alignRight_ == a3
    || sel__indent_ == a3
    || sel__outdent_ == a3
    || sel__toggleStrikeThrough_ == a3
    || sel__insertOrderedList_ == a3
    || sel__insertUnorderedList_ == a3
    || sel__insertNestedOrderedList_ == a3
    || sel__insertNestedUnorderedList_ == a3
    || sel__increaseListLevel_ == a3
    || sel__decreaseListLevel_ == a3
    || sel__changeListType_ == a3
    || sel__pasteAsQuotation_ == a3
    || sel__pasteAndMatchStyle_ == a3
    || sel__setTextColor_sender_ == a3
    || sel__setFontSize_sender_ == a3
    || sel__setFont_sender_ == a3)
  {
    LODWORD(self) = -[WKWebView usesStandardContentView](self, "usesStandardContentView");
    if ((_DWORD)self)
      LOBYTE(self) = objc_msgSend(v6->_contentView.m_ptr, "canPerformActionForWebView:withSender:", a3, a4);
  }
  else if (sel_find_ == a3 || sel_findNext_ == a3 || sel_findPrevious_ == a3)
  {
    LOBYTE(self) = self->_findInteractionEnabled;
  }
  else if (sel_findAndReplace_ == a3)
  {
    LOBYTE(self) = self->_findInteractionEnabled
                && -[WKWebView supportsTextReplacement](self, "supportsTextReplacement");
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)WKWebView;
    LOBYTE(self) = -[WKWebView canPerformAction:withSender:](&v8, sel_canPerformAction_withSender_, a3, a4);
  }
  return (char)self;
}

- (id)targetForAction:(SEL)a3 withSender:(id)a4
{
  objc_super v8;

  if (sel_captureTextFromCamera_ == a3 && -[WKWebView usesStandardContentView](self, "usesStandardContentView")
    || sel_useSelectionForFind_ == a3 && -[WKWebView usesStandardContentView](self, "usesStandardContentView")
    || sel_findSelected_ == a3 && -[WKWebView usesStandardContentView](self, "usesStandardContentView")
    || sel__findSelected_ == a3 && -[WKWebView usesStandardContentView](self, "usesStandardContentView")
    || sel_addShortcut_ == a3 && -[WKWebView usesStandardContentView](self, "usesStandardContentView")
    || sel__addShortcut_ == a3 && -[WKWebView usesStandardContentView](self, "usesStandardContentView")
    || sel_define_ == a3 && -[WKWebView usesStandardContentView](self, "usesStandardContentView")
    || sel__define_ == a3 && -[WKWebView usesStandardContentView](self, "usesStandardContentView")
    || sel_lookup_ == a3 && -[WKWebView usesStandardContentView](self, "usesStandardContentView")
    || sel__lookup_ == a3 && -[WKWebView usesStandardContentView](self, "usesStandardContentView")
    || sel_translate_ == a3 && -[WKWebView usesStandardContentView](self, "usesStandardContentView")
    || sel__translate_ == a3 && -[WKWebView usesStandardContentView](self, "usesStandardContentView")
    || sel_promptForReplace_ == a3 && -[WKWebView usesStandardContentView](self, "usesStandardContentView")
    || sel__promptForReplace_ == a3 && -[WKWebView usesStandardContentView](self, "usesStandardContentView")
    || sel_share_ == a3 && -[WKWebView usesStandardContentView](self, "usesStandardContentView")
    || sel__share_ == a3 && -[WKWebView usesStandardContentView](self, "usesStandardContentView")
    || sel_transliterateChinese_ == a3 && -[WKWebView usesStandardContentView](self, "usesStandardContentView")
    || sel__transliterateChinese_ == a3 && -[WKWebView usesStandardContentView](self, "usesStandardContentView")
    || sel__nextAccessoryTab_ == a3 && -[WKWebView usesStandardContentView](self, "usesStandardContentView")
    || sel__previousAccessoryTab_ == a3 && -[WKWebView usesStandardContentView](self, "usesStandardContentView")
    || sel_copy_ == a3 && -[WKWebView usesStandardContentView](self, "usesStandardContentView")
    || sel_cut_ == a3 && -[WKWebView usesStandardContentView](self, "usesStandardContentView")
    || sel_paste_ == a3 && -[WKWebView usesStandardContentView](self, "usesStandardContentView")
    || sel_replace_ == a3 && -[WKWebView usesStandardContentView](self, "usesStandardContentView")
    || sel_select_ == a3 && -[WKWebView usesStandardContentView](self, "usesStandardContentView")
    || sel_selectAll_ == a3 && -[WKWebView usesStandardContentView](self, "usesStandardContentView")
    || sel_toggleBoldface_ == a3 && -[WKWebView usesStandardContentView](self, "usesStandardContentView")
    || sel_toggleItalics_ == a3 && -[WKWebView usesStandardContentView](self, "usesStandardContentView")
    || sel_toggleUnderline_ == a3 && -[WKWebView usesStandardContentView](self, "usesStandardContentView")
    || sel_increaseSize_ == a3 && -[WKWebView usesStandardContentView](self, "usesStandardContentView")
    || sel_decreaseSize_ == a3 && -[WKWebView usesStandardContentView](self, "usesStandardContentView")
    || sel_pasteAndMatchStyle_ == a3 && -[WKWebView usesStandardContentView](self, "usesStandardContentView")
    || sel_makeTextWritingDirectionNatural_ == a3
    && -[WKWebView usesStandardContentView](self, "usesStandardContentView")
    || sel_makeTextWritingDirectionLeftToRight_ == a3
    && -[WKWebView usesStandardContentView](self, "usesStandardContentView")
    || sel_makeTextWritingDirectionRightToLeft_ == a3
    && -[WKWebView usesStandardContentView](self, "usesStandardContentView")
    || sel__alignCenter_ == a3 && -[WKWebView usesStandardContentView](self, "usesStandardContentView")
    || sel__alignJustified_ == a3 && -[WKWebView usesStandardContentView](self, "usesStandardContentView")
    || sel__alignLeft_ == a3 && -[WKWebView usesStandardContentView](self, "usesStandardContentView")
    || sel__alignRight_ == a3 && -[WKWebView usesStandardContentView](self, "usesStandardContentView")
    || sel__indent_ == a3 && -[WKWebView usesStandardContentView](self, "usesStandardContentView")
    || sel__outdent_ == a3 && -[WKWebView usesStandardContentView](self, "usesStandardContentView")
    || sel__toggleStrikeThrough_ == a3 && -[WKWebView usesStandardContentView](self, "usesStandardContentView")
    || sel__insertOrderedList_ == a3 && -[WKWebView usesStandardContentView](self, "usesStandardContentView")
    || sel__insertUnorderedList_ == a3 && -[WKWebView usesStandardContentView](self, "usesStandardContentView")
    || sel__insertNestedOrderedList_ == a3 && -[WKWebView usesStandardContentView](self, "usesStandardContentView")
    || sel__insertNestedUnorderedList_ == a3 && -[WKWebView usesStandardContentView](self, "usesStandardContentView")
    || sel__increaseListLevel_ == a3 && -[WKWebView usesStandardContentView](self, "usesStandardContentView")
    || sel__decreaseListLevel_ == a3 && -[WKWebView usesStandardContentView](self, "usesStandardContentView")
    || sel__changeListType_ == a3 && -[WKWebView usesStandardContentView](self, "usesStandardContentView")
    || sel__pasteAsQuotation_ == a3 && -[WKWebView usesStandardContentView](self, "usesStandardContentView")
    || sel__pasteAndMatchStyle_ == a3 && -[WKWebView usesStandardContentView](self, "usesStandardContentView")
    || sel__setTextColor_sender_ == a3 && -[WKWebView usesStandardContentView](self, "usesStandardContentView")
    || sel__setFontSize_sender_ == a3 && -[WKWebView usesStandardContentView](self, "usesStandardContentView")
    || sel__setFont_sender_ == a3 && -[WKWebView usesStandardContentView](self, "usesStandardContentView"))
  {
    return (id)objc_msgSend(self->_contentView.m_ptr, "targetForActionForWebView:withSender:", a3, a4);
  }
  v8.receiver = self;
  v8.super_class = (Class)WKWebView;
  return -[WKWebView targetForAction:withSender:](&v8, sel_targetForAction_withSender_, a3, a4);
}

- (void)find:(id)a3
{
  objc_msgSend(self->_findInteraction.m_ptr, "presentFindNavigatorShowingReplace:", 0);
}

- (void)findNext:(id)a3
{
  objc_msgSend(self->_findInteraction.m_ptr, "findNext", a3);
}

- (void)findPrevious:(id)a3
{
  objc_msgSend(self->_findInteraction.m_ptr, "findPrevious", a3);
}

- (void)findAndReplace:(id)a3
{
  objc_msgSend(self->_findInteraction.m_ptr, "presentFindNavigatorShowingReplace:", 1);
}

- (void)willFinishIgnoringCalloutBarFadeAfterPerformingAction
{
  objc_msgSend(self->_contentView.m_ptr, "willFinishIgnoringCalloutBarFadeAfterPerformingAction");
}

- (id)_wkScrollView
{
  return self->_scrollView.m_ptr;
}

- (int64_t)_selectionGranularity
{
  return objc_msgSend(self->_configuration.m_ptr, "selectionGranularity");
}

- (void)_didFinishLoadingDataForCustomContentProviderWithSuggestedFilename:(const void *)a3 data:(id)a4
{
  void *m_ptr;
  const __CFString *v7;

  m_ptr = self->_customContentView.m_ptr;
  if (*(_QWORD *)a3)
    v7 = (const __CFString *)WTF::StringImpl::operator NSString *();
  else
    v7 = &stru_1E351F1B8;
  objc_msgSend(m_ptr, "web_setContentProviderData:suggestedFilename:", a4, v7);
  WebKit::WebPageProxy::didReachLayoutMilestone((uint64_t)self->_page.m_ptr, 7u);
}

- (BOOL)_tryToHandleKeyEventInCustomContentView:(id)a3
{
  return -[WKWebView isFirstResponder](self, "isFirstResponder")
      && objc_msgSend(a3, "_hidEvent")
      && (objc_opt_respondsToSelector() & 1) != 0
      && (objc_msgSend(self->_customContentView.m_ptr, "web_handleKeyEvent:", a3) & 1) != 0;
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  objc_super v7;

  if (!-[WKWebView _tryToHandleKeyEventInCustomContentView:](self, "_tryToHandleKeyEventInCustomContentView:", a4))
  {
    v7.receiver = self;
    v7.super_class = (Class)WKWebView;
    -[WKWebView pressesBegan:withEvent:](&v7, sel_pressesBegan_withEvent_, a3, a4);
  }
}

- (void)pressesChanged:(id)a3 withEvent:(id)a4
{
  objc_super v7;

  if (!-[WKWebView _tryToHandleKeyEventInCustomContentView:](self, "_tryToHandleKeyEventInCustomContentView:", a4))
  {
    v7.receiver = self;
    v7.super_class = (Class)WKWebView;
    -[WKWebView pressesChanged:withEvent:](&v7, sel_pressesChanged_withEvent_, a3, a4);
  }
}

- (void)pressesEnded:(id)a3 withEvent:(id)a4
{
  objc_super v7;

  if (!-[WKWebView _tryToHandleKeyEventInCustomContentView:](self, "_tryToHandleKeyEventInCustomContentView:", a4))
  {
    v7.receiver = self;
    v7.super_class = (Class)WKWebView;
    -[WKWebView pressesEnded:withEvent:](&v7, sel_pressesEnded_withEvent_, a3, a4);
  }
}

- (void)pressesCancelled:(id)a3 withEvent:(id)a4
{
  objc_super v7;

  if (!-[WKWebView _tryToHandleKeyEventInCustomContentView:](self, "_tryToHandleKeyEventInCustomContentView:", a4))
  {
    v7.receiver = self;
    v7.super_class = (Class)WKWebView;
    -[WKWebView pressesCancelled:withEvent:](&v7, sel_pressesCancelled_withEvent_, a3, a4);
  }
}

- (void)_videoControlsManagerDidChange
{
  void *m_ptr;

  m_ptr = self->_fullScreenWindowController.m_ptr;
  if (m_ptr)
    objc_msgSend(m_ptr, "videoControlsManagerDidChange");
}

- (CGPoint)_contentOffsetAdjustedForObscuredInset:(CGPoint)a3
{
  double y;
  double x;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  -[WKWebView _computedObscuredInset](self, "_computedObscuredInset");
  v6 = x - v5;
  v8 = y - v7;
  v9 = v6;
  result.y = v8;
  result.x = v9;
  return result;
}

- (UIEdgeInsets)_contentInsetsFromSystemMinimumLayoutMargins
{
  UIViewController *v3;
  UIViewController *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  WebPageProxy *m_ptr;
  uint64_t v14;
  uint64_t v15;
  double v16;
  int v17;
  UIView *v18;
  UIView *v19;
  double v20;
  CGFloat v21;
  double v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat y;
  double MinY;
  double MinX;
  double MaxY;
  double MaxX;
  double v33;
  double v34;
  double v35;
  double v36;
  CGFloat height;
  CGFloat width;
  CGFloat v39;
  CGFloat x;
  double v41;
  CGFloat rect;
  double v43;
  double v44;
  double v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  UIEdgeInsets result;

  v3 = -[UIView _wk_viewControllerForFullScreenPresentation](self, "_wk_viewControllerForFullScreenPresentation");
  if (v3)
  {
    v4 = v3;
    -[UIViewController systemMinimumLayoutMargins](v3, "systemMinimumLayoutMargins");
    v7 = v6;
    v8 = v5;
    v10 = v9;
    v12 = v11;
    m_ptr = self->_page.m_ptr;
    if (m_ptr)
    {
      v14 = *((_QWORD *)m_ptr + 5);
      if (v14)
        v15 = *(_QWORD *)(v14 + 8);
      else
        v15 = 0;
      (*(void (**)(uint64_t))(*(_QWORD *)v15 + 1584))(v15);
      v17 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v15 + 1624))(v15);
      (*(void (**)(uint64_t))(*(_QWORD *)v15 + 1592))(v15);
      if (v17)
        v16 = v12;
      else
        v16 = v8;
      if (v17)
        v12 = v8;
    }
    else
    {
      v16 = v5;
    }
    v18 = -[UIViewController viewIfLoaded](v4, "viewIfLoaded");
    if (v18)
    {
      v19 = v18;
      -[UIView bounds](v18, "bounds");
      v21 = v20;
      v41 = v12;
      rect = v22;
      v24 = v23;
      v26 = v25;
      -[WKWebView bounds](self, "bounds");
      -[WKWebView convertRect:toView:](self, "convertRect:toView:", v19);
      v43 = v16;
      x = v46.origin.x;
      height = v46.size.height;
      width = v46.size.width;
      v27 = v46.origin.x;
      y = v46.origin.y;
      v39 = v46.origin.y;
      MinY = CGRectGetMinY(v46);
      v47.origin.x = v21;
      v47.origin.y = v24;
      v47.size.width = v26;
      v47.size.height = rect;
      v45 = fmax(v7 - fmax(MinY - CGRectGetMinY(v47), 0.0), 0.0);
      v48.origin.x = v27;
      v48.origin.y = y;
      v48.size.width = width;
      v48.size.height = height;
      MinX = CGRectGetMinX(v48);
      v49.origin.x = v21;
      v49.origin.y = v24;
      v49.size.width = v26;
      v49.size.height = rect;
      v44 = fmax(v43 - fmax(MinX - CGRectGetMinX(v49), 0.0), 0.0);
      v50.origin.x = v21;
      v50.origin.y = v24;
      v50.size.width = v26;
      v50.size.height = rect;
      MaxY = CGRectGetMaxY(v50);
      v51.origin.x = x;
      v51.origin.y = v39;
      v51.size.width = width;
      v51.size.height = height;
      v10 = fmax(v10 - fmax(MaxY - CGRectGetMaxY(v51), 0.0), 0.0);
      v52.size.width = v26;
      v52.origin.x = v21;
      v52.origin.y = v24;
      v52.size.height = rect;
      MaxX = CGRectGetMaxX(v52);
      v53.origin.x = x;
      v53.origin.y = v39;
      v53.size.width = width;
      v53.size.height = height;
      v16 = v44;
      v7 = v45;
      v12 = fmax(v41 - fmax(MaxX - CGRectGetMaxX(v53), 0.0), 0.0);
    }
  }
  else
  {
    v7 = *MEMORY[0x1E0CEB4B0];
    v16 = *(double *)(MEMORY[0x1E0CEB4B0] + 8);
    v10 = *(double *)(MEMORY[0x1E0CEB4B0] + 16);
    v12 = *(double *)(MEMORY[0x1E0CEB4B0] + 24);
  }
  v33 = v7;
  v34 = v16;
  v35 = v10;
  v36 = v12;
  result.right = v36;
  result.bottom = v35;
  result.left = v34;
  result.top = v33;
  return result;
}

- (void)_processWillSwapOrDidExit
{
  unsigned __int8 *value;
  PerWebProcessState *p_perProcessState;
  __int128 v5;
  _BYTE v6[61];
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  CGSize v14;
  unint64_t v15;
  __int128 v16;
  _BYTE v17[48];
  CGPoint v18;

  -[WKWebView _hidePasswordView](self, "_hidePasswordView");
  -[WKWebView _cancelAnimatedResize](self, "_cancelAnimatedResize");
  -[WKWebView _destroyResizeAnimationView](self, "_destroyResizeAnimationView");
  objc_msgSend(self->_contentView.m_ptr, "setHidden:", 0);
  -[WKWebView _invalidateResizeAssertions](self, "_invalidateResizeAssertions");
  value = (unsigned __int8 *)self->_gestureController.__ptr_.__value_;
  if (value)
    WebKit::ViewGestureController::disconnectFromProcess(value);
  LOWORD(v5) = 0;
  DWORD1(v5) = 0;
  WORD4(v5) = 0;
  *(_QWORD *)v6 = 0;
  *(_OWORD *)&v6[8] = *MEMORY[0x1E0C9D648];
  *(_OWORD *)&v6[24] = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
  v6[40] = 0;
  v6[48] = 0;
  v6[52] = 0;
  v6[60] = 0;
  *(_QWORD *)&v7 = 0;
  WORD4(v7) = 1;
  BYTE10(v7) = 0;
  BYTE12(v7) = 0;
  BYTE4(v8) = 0;
  BYTE8(v8) = 0;
  BYTE12(v8) = 0;
  LOBYTE(v9) = 0;
  BYTE4(v9) = 0;
  BYTE8(v9) = 0;
  LOBYTE(v10) = 0;
  BYTE8(v10) = 0;
  BYTE8(v12) = 0;
  LOBYTE(v13) = 0;
  LOBYTE(v15) = 0;
  v17[0] = 0;
  *(_QWORD *)&v16 = 0;
  BYTE8(v16) = 0;
  memset(&v17[8], 0, 33);
  p_perProcessState = &self->_perProcessState;
  *(_OWORD *)&p_perProcessState->animatedResizeOriginalContentWidth = *(_OWORD *)v6;
  *(_OWORD *)&p_perProcessState->animatedResizeOldBounds.origin.y = *(_OWORD *)&v6[16];
  *(_OWORD *)&p_perProcessState->animatedResizeOldBounds.size.height = *(_OWORD *)&v6[32];
  *(_OWORD *)((char *)&p_perProcessState->scrollOffsetToRestore.var0.__val_.m_y + 1) = *(_OWORD *)&v6[45];
  *(_OWORD *)&p_perProcessState->viewportMetaTagWidth = xmmword_1978CF590;
  *(_OWORD *)&p_perProcessState->hasCommittedLoadForMainFrame = v5;
  WebCore::Color::operator=();
  p_perProcessState->liveResizeParameters.__engaged_ = 0;
  p_perProcessState->frozenUnobscuredContentRect.var0.__val_.size = v14;
  *(_OWORD *)&p_perProcessState->frozenUnobscuredContentRect.__engaged_ = v15;
  *(_OWORD *)&p_perProcessState->lastTransactionID.m_identifier = v16;
  *(_OWORD *)&p_perProcessState->lastSentMinimumEffectiveDeviceWidth.__engaged_ = v10;
  *(_OWORD *)&p_perProcessState->frozenVisibleContentRect.var0.__val_.origin.y = v11;
  *(_OWORD *)&p_perProcessState->frozenVisibleContentRect.var0.__val_.size.height = v12;
  *(_OWORD *)&p_perProcessState->frozenUnobscuredContentRect.var0.__null_state_ = v13;
  *(_OWORD *)&p_perProcessState->isAnimatingFullScreenExit = v7;
  *(_OWORD *)&p_perProcessState->lastSentViewLayoutSize.var0.__val_.m_height = v8;
  *(_OWORD *)&p_perProcessState->lastSentOrientationForMediaCapture.var0.__null_state_ = v9;
  *(_OWORD *)&p_perProcessState->committedFindLayerID.m_processIdentifier.m_identifier = *(_OWORD *)&v17[32];
  p_perProcessState->liveResizeParameters.var0.__val_.initialScrollPosition = v18;
  *(_OWORD *)&p_perProcessState->firstTransactionIDAfterPageRestore.__engaged_ = *(_OWORD *)v17;
  *(_OWORD *)&p_perProcessState->pendingFindLayerID.m_processIdentifier.m_identifier = *(_OWORD *)&v17[16];
}

- (void)_processWillSwap
{
  NSObject *v3;
  int v4;
  WKWebView *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = qword_1ECE71A28;
  if (os_log_type_enabled((os_log_t)qword_1ECE71A28, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 134217984;
    v5 = self;
    _os_log_impl(&dword_196BCC000, v3, OS_LOG_TYPE_DEFAULT, "%p -[WKWebView _processWillSwap]", (uint8_t *)&v4, 0xCu);
  }
  -[WKWebView _processWillSwapOrDidExit](self, "_processWillSwapOrDidExit");
}

- (void)_processDidExit
{
  NSObject *v3;
  void *m_ptr;
  int v5;
  WKWebView *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = qword_1ECE71A28;
  if (os_log_type_enabled((os_log_t)qword_1ECE71A28, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 134217984;
    v6 = self;
    _os_log_impl(&dword_196BCC000, v3, OS_LOG_TYPE_DEFAULT, "%p -[WKWebView _processDidExit]", (uint8_t *)&v5, 0xCu);
  }
  -[WKWebView _processWillSwapOrDidExit](self, "_processWillSwapOrDidExit");
  m_ptr = self->_contentView.m_ptr;
  -[WKWebView bounds](self, "bounds");
  objc_msgSend(m_ptr, "setFrame:");
  objc_msgSend(self->_scrollView.m_ptr, "_setBackgroundColorInternal:", objc_msgSend(self->_contentView.m_ptr, "backgroundColor"));
  -[WKWebView _resetContentOffset](self, "_resetContentOffset");
  objc_msgSend(self->_scrollView.m_ptr, "setZoomScale:", 1.0);
}

- (void)_didRelaunchProcess
{
  NSObject *v3;
  WebPageProxy *m_ptr;
  uint64_t v5;
  unsigned int *value;
  int v7;
  WKWebView *v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = qword_1ECE71A28;
  if (os_log_type_enabled((os_log_t)qword_1ECE71A28, OS_LOG_TYPE_DEFAULT))
  {
    m_ptr = self->_page.m_ptr;
    if (*((_BYTE *)m_ptr + 729))
    {
      LODWORD(v5) = 0;
    }
    else
    {
      v5 = *(_QWORD *)(*((_QWORD *)m_ptr + 26) + 136);
      if (v5)
        LODWORD(v5) = *(_DWORD *)(v5 + 108);
    }
    v7 = 134218240;
    v8 = self;
    v9 = 1024;
    v10 = v5;
    _os_log_impl(&dword_196BCC000, v3, OS_LOG_TYPE_DEFAULT, "%p -[WKWebView _didRelaunchProcess] (pid=%d)", (uint8_t *)&v7, 0x12u);
  }
  self->_perProcessState.hasScheduledVisibleRectUpdate = 0;
  self->_viewStabilityWhenVisibleContentRectUpdateScheduled.m_storage = 0;
  value = (unsigned int *)self->_gestureController.__ptr_.__value_;
  if (value)
    WebKit::ViewGestureController::connectToProcess(value);
}

- (void)_didCommitLoadForMainFrame
{
  uint64_t v2;
  void *v4;
  WTF::StringImpl *v5;
  WTF::StringImpl *v6;
  WTF::StringImpl *v7;
  const __CFString *v8;
  RetainPtr<NSString> *p_pendingPageLoadObserverHost;
  void *m_ptr;
  WTF::StringImpl *v11;
  WTF::StringImpl *v12;
  WTF::StringImpl *v13;
  WTF::StringImpl *v14;
  int v15;

  v2 = *((_QWORD *)self->_page.m_ptr + 23);
  if (*(_BYTE *)(v2 + 32))
  {
    __break(0xC471u);
    JUMPOUT(0x197195C0CLL);
  }
  self->_perProcessState.firstPaintAfterCommitLoadTransactionID.m_identifier = *(_QWORD *)(v2 + 104) + 1;
  *(_WORD *)&self->_perProcessState.hasCommittedLoadForMainFrame = 257;
  if (!-[WKWebView _scrollViewIsRubberBandingForRefreshControl](self, "_scrollViewIsRubberBandingForRefreshControl"))
    objc_msgSend(self->_scrollView.m_ptr, "_wk_stopScrollingAndZooming");
  if (self->_findInteractionEnabled)
  {
    objc_msgSend(self->_findInteraction.m_ptr, "dismissFindNavigator");
    v4 = (void *)objc_msgSend(self->_findInteraction.m_ptr, "activeFindSession");
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (v4)
        objc_msgSend(v4, "setSearchableObject:", -[WKWebView _searchableObject](self, "_searchableObject"));
    }
  }
  WebKit::WebPageProxy::currentURL((WebKit::WebPageProxy *)self->_page.m_ptr, &v13);
  MEMORY[0x19AEABB0C](&v14, &v13, 0);
  v6 = v13;
  v13 = 0;
  if (v6)
  {
    if (*(_DWORD *)v6 == 2)
      WTF::StringImpl::destroy(v6, v5);
    else
      *(_DWORD *)v6 -= 2;
  }
  if ((~v15 & 3) == 0)
  {
    WTF::URL::hostAndPort((WTF::URL *)&v14);
    if (v13)
    {
      v8 = (const __CFString *)WTF::StringImpl::operator NSString *();
      p_pendingPageLoadObserverHost = &self->_pendingPageLoadObserverHost;
      if (!v8)
      {
LABEL_16:
        m_ptr = p_pendingPageLoadObserverHost->m_ptr;
        p_pendingPageLoadObserverHost->m_ptr = (void *)v8;
        if (m_ptr)
          CFRelease(m_ptr);
        v11 = v13;
        v13 = 0;
        if (v11)
        {
          if (*(_DWORD *)v11 == 2)
            WTF::StringImpl::destroy(v11, v7);
          else
            *(_DWORD *)v11 -= 2;
        }
        -[WKWebView _updatePageLoadObserverState]((uint64_t)self);
        goto LABEL_23;
      }
    }
    else
    {
      p_pendingPageLoadObserverHost = &self->_pendingPageLoadObserverHost;
      v8 = &stru_1E351F1B8;
    }
    CFRetain(v8);
    goto LABEL_16;
  }
LABEL_23:
  v12 = v14;
  v14 = 0;
  if (v12)
  {
    if (*(_DWORD *)v12 == 2)
      WTF::StringImpl::destroy(v12, v5);
    else
      *(_DWORD *)v12 -= 2;
  }
}

- (void)_updatePageLoadObserverState
{
  uint64_t v2;
  uint64_t v3;
  const char *v4;
  NSObject *v5;
  uint32_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  NSObject *v14;
  const void *v15;
  uint64_t v16;
  __int128 v17;
  const void *v18;
  CFTypeRef v19;
  uint64_t v20;
  uint64_t v21;
  __int128 *v22;
  __int128 v23;
  _QWORD v24[4];
  CFTypeRef cf;
  __int128 v26;
  __int128 v27;
  int v28;
  _BYTE buf[32];
  int v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v2 = *(_QWORD *)(a1 + 1752);
    if (v2)
    {
      if (*(_BYTE *)(a1 + 1744))
      {
        if ((*(_WORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 424) + 32) + 48) & 4) != 0)
        {
          objc_msgSend((id)a1, "bounds");
          v8 = v7;
          v10 = v9;
          objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)a1, "window"), "screen"), "bounds");
          v13 = v8 * v10 / (v12 * v11);
          if (v12 == 0.0 || v11 == 0.0 || v13 < 0.7)
          {
            v20 = qword_1ECE71550;
            if (os_log_type_enabled((os_log_t)qword_1ECE71550, OS_LOG_TYPE_DEBUG))
            {
              v21 = *(_QWORD *)(a1 + 1752);
              *(_DWORD *)buf = 134218499;
              *(_QWORD *)&buf[4] = a1;
              *(_WORD *)&buf[12] = 2117;
              *(_QWORD *)&buf[14] = v21;
              *(_WORD *)&buf[22] = 2048;
              *(double *)&buf[24] = v13;
              v4 = "_updatePageLoadObserverState(%p): skipping event for host %{sensitive}@, screen area ratio %.2f";
              v5 = v20;
              v6 = 32;
              goto LABEL_10;
            }
          }
          else
          {
            if (qword_1ECE72A18 != -1)
              dispatch_once(&qword_1ECE72A18, &__block_literal_global_1191);
            v14 = qword_1ECE72A20;
            v24[0] = MEMORY[0x1E0C809B0];
            v24[1] = 3321888768;
            v24[2] = __60__WKWebView_WKViewInternalIOS___updatePageLoadObserverState__block_invoke;
            v24[3] = &__block_descriptor_80_e8_32c74_ZTSKZ60__WKWebView_WKViewInternalIOS___updatePageLoadObserverState_E4__20_e5_v8__0l;
            v15 = *(const void **)(a1 + 1752);
            if (v15)
              CFRetain(*(CFTypeRef *)(a1 + 1752));
            v16 = *((_QWORD *)API::PageConfiguration::Data::LazyInitializedRef<WebKit::WebProcessPool,&API::PageConfiguration::Data::createWebProcessPool>::get((WebKit::WebProcessPool **)(*(_QWORD *)(*(_QWORD *)(a1 + 424) + 48) + 24))
                  + 6);
            v17 = *(_OWORD *)(v16 + 116);
            *(_OWORD *)buf = *(_OWORD *)(v16 + 100);
            *(_OWORD *)&buf[16] = v17;
            v30 = *(_DWORD *)(v16 + 132);
            cf = v15;
            if (v15)
            {
              CFRetain(v15);
              v26 = *(_OWORD *)buf;
              v27 = *(_OWORD *)&buf[16];
              v28 = v30;
              dispatch_async(v14, v24);
              CFRelease(v15);
            }
            else
            {
              v22 = (__int128 *)(v16 + 100);
              v23 = v22[1];
              v26 = *v22;
              v27 = v23;
              v28 = *((_DWORD *)v22 + 8);
              dispatch_async(v14, v24);
            }
            v18 = *(const void **)(a1 + 1752);
            *(_QWORD *)(a1 + 1752) = 0;
            if (v18)
              CFRelease(v18);
            v19 = cf;
            cf = 0;
            if (v19)
              CFRelease(v19);
          }
        }
        else
        {
          v3 = qword_1ECE71550;
          if (os_log_type_enabled((os_log_t)qword_1ECE71550, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 134218243;
            *(_QWORD *)&buf[4] = a1;
            *(_WORD *)&buf[12] = 2117;
            *(_QWORD *)&buf[14] = v2;
            v4 = "_updatePageLoadObserverState(%p): skipping event for host %{sensitive}@, not visible";
LABEL_9:
            v5 = v3;
            v6 = 22;
LABEL_10:
            _os_log_debug_impl(&dword_196BCC000, v5, OS_LOG_TYPE_DEBUG, v4, buf, v6);
          }
        }
      }
      else
      {
        v3 = qword_1ECE71550;
        if (os_log_type_enabled((os_log_t)qword_1ECE71550, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 134218243;
          *(_QWORD *)&buf[4] = a1;
          *(_WORD *)&buf[12] = 2117;
          *(_QWORD *)&buf[14] = v2;
          v4 = "_updatePageLoadObserverState(%p): skipping event for host %{sensitive}@, never accessed bflist";
          goto LABEL_9;
        }
      }
    }
  }
}

- (FloatRect)visibleRectInViewCoordinates
{
  CGFloat v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  float32_t v13;
  float32_t v14;
  float v15;
  float v16;
  float32x2_t v17[2];
  CGRect v18;
  float32x2_t v19;
  float v20;
  float v21;
  FloatRect result;

  -[WKWebView bounds](self, "bounds");
  v18.origin.x = v3;
  v18.origin.y = v4;
  v18.size.width = v5;
  v18.size.height = v6;
  WebCore::FloatRect::FloatRect((WebCore::FloatRect *)&v19, &v18);
  objc_msgSend(self->_scrollView.m_ptr, "contentOffset");
  v18.origin.x = v7;
  v18.origin.y = v8;
  WebCore::FloatPoint::FloatPoint((WebCore::FloatPoint *)v17, &v18.origin);
  v19 = vadd_f32(v17[0], v19);
  objc_msgSend(self->_contentView.m_ptr, "bounds");
  v18.origin.x = v9;
  v18.origin.y = v10;
  v18.size.width = v11;
  v18.size.height = v12;
  WebCore::FloatRect::FloatRect((WebCore::FloatRect *)v17, &v18);
  WebCore::FloatRect::intersect((WebCore::FloatRect *)&v19, (const WebCore::FloatRect *)v17);
  v14 = v19.f32[1];
  v13 = v19.f32[0];
  v15 = v20;
  v16 = v21;
  result.m_size.m_height = v16;
  result.m_size.m_width = v15;
  result.m_location.m_y = v14;
  result.m_location.m_x = v13;
  return result;
}

- (void)_didCommitLayerTreeDuringAnimatedResize:(const void *)a3
{
  BOOL v3;
  double v5;
  int v6;
  int v7;
  void *v8;
  double v9;
  double m11;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  void *v26;
  _OWORD v27[8];
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  CATransform3D v36;

  if (*((_BYTE *)a3 + 776))
    v3 = *((_QWORD *)a3 + 96) == self->_currentDynamicViewportSizeUpdateID;
  else
    v3 = 0;
  if (v3)
  {
    v5 = *((double *)a3 + 24);
    v7 = *((_DWORD *)a3 + 40);
    v6 = *((_DWORD *)a3 + 41);
    v8 = (void *)objc_msgSend(self->_resizeAnimationView.m_ptr, "layer");
    v9 = 0.0;
    m11 = 0.0;
    if (v8)
    {
      objc_msgSend(v8, "transform");
      m11 = v36.m11;
    }
    v11 = (void *)objc_msgSend(self->_contentView.m_ptr, "layer");
    if (v11)
    {
      objc_msgSend(v11, "transform");
      v9 = v36.m11;
    }
    CATransform3DMakeScale(&v36, v5 / (m11 * v9), v5 / (m11 * v9), 1.0);
    v12 = *(_OWORD *)&v36.m33;
    *(_OWORD *)&self->_resizeAnimationTransformAdjustments.m31 = *(_OWORD *)&v36.m31;
    *(_OWORD *)&self->_resizeAnimationTransformAdjustments.m33 = v12;
    v13 = *(_OWORD *)&v36.m43;
    *(_OWORD *)&self->_resizeAnimationTransformAdjustments.m41 = *(_OWORD *)&v36.m41;
    *(_OWORD *)&self->_resizeAnimationTransformAdjustments.m43 = v13;
    v14 = *(_OWORD *)&v36.m13;
    *(_OWORD *)&self->_resizeAnimationTransformAdjustments.m11 = *(_OWORD *)&v36.m11;
    *(_OWORD *)&self->_resizeAnimationTransformAdjustments.m13 = v14;
    v15 = *(_OWORD *)&v36.m23;
    *(_OWORD *)&self->_resizeAnimationTransformAdjustments.m21 = *(_OWORD *)&v36.m21;
    *(_OWORD *)&self->_resizeAnimationTransformAdjustments.m23 = v15;
    -[WKWebView _contentOffsetAdjustedForObscuredInset:](self, "_contentOffsetAdjustedForObscuredInset:", v5 * (double)v7, v5 * (double)v6);
    v17 = v16;
    v19 = v18;
    objc_msgSend(self->_scrollView.m_ptr, "contentOffset");
    self->_resizeAnimationTransformAdjustments.m41 = (v20 - v17) / m11;
    self->_resizeAnimationTransformAdjustments.m42 = (v21 - v19) / m11;
    v22 = *(_OWORD *)&self->_resizeAnimationTransformAdjustments.m33;
    v32 = *(_OWORD *)&self->_resizeAnimationTransformAdjustments.m31;
    v33 = v22;
    v23 = *(_OWORD *)&self->_resizeAnimationTransformAdjustments.m13;
    v28 = *(_OWORD *)&self->_resizeAnimationTransformAdjustments.m11;
    v29 = v23;
    v24 = *(_OWORD *)&self->_resizeAnimationTransformAdjustments.m23;
    v30 = *(_OWORD *)&self->_resizeAnimationTransformAdjustments.m21;
    v31 = v24;
    v25 = *(_OWORD *)&self->_resizeAnimationTransformAdjustments.m43;
    v34 = *(_OWORD *)&self->_resizeAnimationTransformAdjustments.m41;
    v35 = v25;
    v26 = (void *)objc_msgSend(self->_resizeAnimationView.m_ptr, "layer");
    v27[4] = v32;
    v27[5] = v33;
    v27[6] = v34;
    v27[7] = v35;
    v27[0] = v28;
    v27[1] = v29;
    v27[2] = v30;
    v27[3] = v31;
    objc_msgSend(v26, "setSublayerTransform:", v27);
    self->_perProcessState.waitingForCommitAfterAnimatedResize = 0;
    if (!self->_perProcessState.waitingForEndAnimatedResize)
      -[WKWebView _didCompleteAnimatedResize](self, "_didCompleteAnimatedResize");
  }
}

- (void)_couldNotRestorePageState
{
  ViewGestureController *value;

  value = self->_gestureController.__ptr_.__value_;
  if (value)
    WebKit::ViewGestureController::SnapshotRemovalTracker::stopWaitingForEvent((WebKit::ViewGestureController::SnapshotRemovalTracker *)((char *)value + 168), (WebKit::ViewGestureController::SnapshotRemovalTracker *)0x20, "outstanding event occurred: ", 29, 1);
}

- (void)_restorePageScrollPosition:(optional<WebCore:(FloatPoint)a4 :(RectEdges<float>)a5 FloatPoint>)a3 scrollOrigin:(double)a6 previousObscuredInset:scale:
{
  float v7;
  float v8;
  float v9;
  float v10;
  float m_y;
  float m_x;
  BOOL engaged;
  float v14;
  float v16;
  uint64_t v17;
  unint64_t v18;
  Vector<WTF::Function<void ()>, 0UL, WTF::CrashOnOverflow, 16UL, WTF::FastMalloc> *p_callbacksDeferredDuringResize;
  unint64_t m_size;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  _QWORD *m_buffer;
  uint64_t v25;
  __int16 v26;
  char v27;

  v7 = a5.m_sides.__elems_[3];
  v8 = a5.m_sides.__elems_[2];
  v9 = a5.m_sides.__elems_[1];
  v10 = a5.m_sides.__elems_[0];
  m_y = a4.m_y;
  m_x = a4.m_x;
  engaged = a3.__engaged_;
  v14 = a3.var0.__val_.m_x;
  v16 = a3.var0.__val_.m_y;
  if (-[WKWebView _shouldDeferGeometryUpdates](self, "_shouldDeferGeometryUpdates"))
  {
    if (self)
    {
      CFRetain(self);
      CFRetain(self);
    }
    p_callbacksDeferredDuringResize = &self->_callbacksDeferredDuringResize;
    m_size = self->_callbacksDeferredDuringResize.m_size;
    if ((_DWORD)m_size == self->_callbacksDeferredDuringResize.m_capacity)
    {
      v21 = m_size + (m_size >> 2);
      if (v21 >= 0x10)
        v22 = v21 + 1;
      else
        v22 = 16;
      if (v22 <= m_size + 1)
        v23 = m_size + 1;
      else
        v23 = v22;
      WTF::Vector<WTF::Function<void ()(void)>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::reserveCapacity<(WTF::FailureAction)0>((uint64_t)&self->_callbacksDeferredDuringResize, v23);
      m_size = self->_callbacksDeferredDuringResize.m_size;
      m_buffer = p_callbacksDeferredDuringResize->m_buffer;
      v25 = WTF::fastMalloc((WTF *)0x40);
      *(_QWORD *)v25 = &off_1E34C5B30;
      *(_QWORD *)(v25 + 8) = self;
      *(float *)(v25 + 16) = v14;
      *(float *)(v25 + 20) = v16;
      *(_BYTE *)(v25 + 24) = engaged;
      *(_WORD *)(v25 + 25) = v26;
      *(_BYTE *)(v25 + 27) = v27;
    }
    else
    {
      m_buffer = p_callbacksDeferredDuringResize->m_buffer;
      v25 = WTF::fastMalloc((WTF *)0x40);
      *(_QWORD *)v25 = &off_1E34C5B30;
      *(_QWORD *)(v25 + 8) = self;
      *(float *)(v25 + 16) = v14;
      *(float *)(v25 + 20) = v16;
      *(_BYTE *)(v25 + 24) = engaged;
      *(_WORD *)(v25 + 25) = v26;
      *(_BYTE *)(v25 + 27) = v27;
    }
    *(_QWORD *)(v25 + 28) = LODWORD(m_x) | ((unint64_t)LODWORD(m_y) << 32);
    *(float *)(v25 + 36) = v10;
    *(float *)(v25 + 40) = v9;
    *(float *)(v25 + 44) = v8;
    *(float *)(v25 + 48) = v7;
    *(double *)(v25 + 56) = a6;
    m_buffer[m_size] = v25;
    ++self->_callbacksDeferredDuringResize.m_size;
    CFRelease(self);
  }
  else if (-[WKWebView usesStandardContentView](self, "usesStandardContentView"))
  {
    v17 = *((_QWORD *)self->_page.m_ptr + 23);
    if (*(_BYTE *)(v17 + 32))
    {
      __break(0xC471u);
    }
    else
    {
      v18 = *(_QWORD *)(v17 + 104) + 1;
      if (!self->_perProcessState.firstTransactionIDAfterPageRestore.__engaged_)
        self->_perProcessState.firstTransactionIDAfterPageRestore.__engaged_ = 1;
      self->_perProcessState.firstTransactionIDAfterPageRestore.var0.__val_.m_identifier = v18;
      if (engaged)
      {
        if (!self->_perProcessState.scrollOffsetToRestore.__engaged_)
          self->_perProcessState.scrollOffsetToRestore.__engaged_ = 1;
        self->_perProcessState.scrollOffsetToRestore.var0.__val_.m_x = m_x + v14;
        self->_perProcessState.scrollOffsetToRestore.var0.__val_.m_y = m_y + v16;
      }
      else if (self->_perProcessState.scrollOffsetToRestore.__engaged_)
      {
        self->_perProcessState.scrollOffsetToRestore.__engaged_ = 0;
      }
      self->_obscuredInsetsWhenSaved.m_sides.__elems_[0] = v10;
      self->_obscuredInsetsWhenSaved.m_sides.__elems_[1] = v9;
      self->_obscuredInsetsWhenSaved.m_sides.__elems_[2] = v8;
      self->_obscuredInsetsWhenSaved.m_sides.__elems_[3] = v7;
      self->_scaleToRestore = a6;
    }
  }
}

- (void)_restorePageStateToUnobscuredCenter:(optional<WebCore:(double)a4 :FloatPoint>)a3 scale:
{
  BOOL engaged;
  $4DB615447E6C969EB1F2329AFDD87565 var0;
  uint64_t v8;
  unint64_t v9;
  Vector<WTF::Function<void ()>, 0UL, WTF::CrashOnOverflow, 16UL, WTF::FastMalloc> *p_callbacksDeferredDuringResize;
  unint64_t m_size;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  _QWORD *m_buffer;
  uint64_t v16;
  _BYTE v17[7];

  engaged = a3.__engaged_;
  var0 = a3.var0;
  if (-[WKWebView _shouldDeferGeometryUpdates](self, "_shouldDeferGeometryUpdates"))
  {
    if (self)
    {
      CFRetain(self);
      CFRetain(self);
    }
    p_callbacksDeferredDuringResize = &self->_callbacksDeferredDuringResize;
    m_size = self->_callbacksDeferredDuringResize.m_size;
    if ((_DWORD)m_size == self->_callbacksDeferredDuringResize.m_capacity)
    {
      v12 = m_size + (m_size >> 2);
      if (v12 >= 0x10)
        v13 = v12 + 1;
      else
        v13 = 16;
      if (v13 <= m_size + 1)
        v14 = m_size + 1;
      else
        v14 = v13;
      WTF::Vector<WTF::Function<void ()(void)>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::reserveCapacity<(WTF::FailureAction)0>((uint64_t)p_callbacksDeferredDuringResize, v14);
      m_size = self->_callbacksDeferredDuringResize.m_size;
      m_buffer = p_callbacksDeferredDuringResize->m_buffer;
      v16 = WTF::fastMalloc((WTF *)0x28);
    }
    else
    {
      m_buffer = p_callbacksDeferredDuringResize->m_buffer;
      v16 = WTF::fastMalloc((WTF *)0x28);
    }
    *(_QWORD *)v16 = &off_1E34C5B58;
    *(_QWORD *)(v16 + 8) = self;
    *($4DB615447E6C969EB1F2329AFDD87565 *)(v16 + 16) = var0;
    *(_BYTE *)(v16 + 24) = engaged;
    *(_DWORD *)(v16 + 25) = *(_DWORD *)v17;
    *(_DWORD *)(v16 + 28) = *(_DWORD *)&v17[3];
    *(double *)(v16 + 32) = a4;
    m_buffer[m_size] = v16;
    ++self->_callbacksDeferredDuringResize.m_size;
    CFRelease(self);
  }
  else if (-[WKWebView usesStandardContentView](self, "usesStandardContentView"))
  {
    v8 = *((_QWORD *)self->_page.m_ptr + 23);
    if (*(_BYTE *)(v8 + 32))
    {
      __break(0xC471u);
    }
    else
    {
      v9 = *(_QWORD *)(v8 + 104) + 1;
      if (!self->_perProcessState.firstTransactionIDAfterPageRestore.__engaged_)
        self->_perProcessState.firstTransactionIDAfterPageRestore.__engaged_ = 1;
      self->_perProcessState.firstTransactionIDAfterPageRestore.var0.__val_.m_identifier = v9;
      self->_perProcessState.unobscuredCenterToRestore.var0 = var0;
      self->_perProcessState.unobscuredCenterToRestore.__engaged_ = engaged;
      self->_scaleToRestore = a4;
    }
  }
}

- (RefPtr<WebKit::ViewSnapshot,)_takeViewSnapshot
{
  WebKit::ViewSnapshot **v2;
  WebKit::ViewSnapshot **v4;
  float v5;
  float v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  WebCore::IOSurface *v11;
  float v12;
  WebCore::Widget *v13;
  WebCore::DestinationColorSpace *v14;
  WTF *v15;
  void *v16;
  WebKit::ViewSnapshot *v17;
  _QWORD *v18;
  _QWORD *v19;
  WebCore::IOSurface *v20;
  WTF *v21;
  void *v22;
  WTF *v23;
  void *v24;
  WebCore::IOSurface *v25;
  _QWORD *v26;
  WebCore::IOSurface *v27;
  WebKit::ViewSnapshot *v28;
  WebCore::IOSurface *v29;
  CATransform3D v30;
  float v31;
  float v32;

  v4 = v2;
  WebCore::screenScaleFactor(0, (UIScreen *)a2);
  v6 = v5;
  -[WKWebView bounds](self, "bounds");
  v30.m11 = v7;
  v30.m12 = v8;
  v30.m13 = v9;
  v30.m14 = v10;
  v11 = (WebCore::IOSurface *)WebCore::FloatSize::FloatSize((WebCore::FloatSize *)&v31, (const CGSize *)&v30.m13);
  v12 = v6 * v32;
  v31 = v6 * v31;
  v32 = v6 * v32;
  if (v31 > 0.0
    && v12 > 0.0
    && (memset(&v30, 0, sizeof(v30)),
        CATransform3DMakeScale(&v30, v6, v6, 1.0),
        v14 = (WebCore::DestinationColorSpace *)WebCore::screenSupportsExtendedColor(0, v13),
        WebCore::DestinationColorSpace::SRGB(v14),
        v11 = (WebCore::IOSurface *)WebCore::IOSurface::create(),
        v29))
  {
    objc_msgSend((id)objc_msgSend((id)-[WKWebView layer](self, "layer"), "context"), "contextId");
    -[WKWebView layer](self, "layer");
    CARenderServerRenderLayerWithTransform();
    if (WebCore::IOSurface::allowConversionFromFormatToFormat())
    {
      v27 = 0;
      WebKit::ViewSnapshot::create(&v27, &v28);
      if (v27)
      {
        WebCore::IOSurface::~IOSurface(v27);
        WTF::fastFree(v15, v16);
      }
      v17 = v28;
      ++*(_DWORD *)v28;
      v18 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
      *v18 = &off_1E34C5B80;
      v18[1] = v17;
      v26 = v18;
      WebCore::IOSurface::convertToFormat();
      v19 = v26;
      v26 = 0;
      if (v19)
        (*(void (**)(_QWORD *))(*v19 + 8))(v19);
      *v4 = v17;
    }
    else
    {
      v20 = v29;
      v29 = 0;
      v25 = v20;
      WebKit::ViewSnapshot::create(&v25, &v28);
      *v4 = v28;
      if (v25)
      {
        WebCore::IOSurface::~IOSurface(v25);
        WTF::fastFree(v21, v22);
      }
    }
    v11 = v29;
    v29 = 0;
    if (v11)
    {
      WebCore::IOSurface::~IOSurface(v11);
      return (RefPtr<WebKit::ViewSnapshot, WTF::RawPtrTraits<WebKit::ViewSnapshot>, WTF::DefaultRefDerefTraits<WebKit::ViewSnapshot>>)WTF::fastFree(v23, v24);
    }
  }
  else
  {
    *v4 = 0;
  }
  return (RefPtr<WebKit::ViewSnapshot, WTF::RawPtrTraits<WebKit::ViewSnapshot>, WTF::DefaultRefDerefTraits<WebKit::ViewSnapshot>>)v11;
}

- (void)_zoomToCenter:(FloatPoint)a3 atScale:(double)a4 animated:(BOOL)a5 honorScrollability:(BOOL)a6
{
  _BOOL4 v6;
  float m_y;
  float m_x;
  void *v12;
  double v13;
  double v14;
  char v15;
  double v16;
  double v17;
  BOOL v18;
  BOOL v19;
  double v20;
  BOOL v21;
  BOOL v22;
  WebPageProxy *m_ptr;
  uint64_t v24;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v29;
  double v30;
  void *v31;
  double v32;
  uint64_t v33;
  _QWORD v34[9];
  double v35[6];
  CGRect v36;
  CGRect v37;

  v6 = a6;
  m_y = a3.m_y;
  m_x = a3.m_x;
  v12 = (void *)objc_msgSend(-[WKWebView _currentContentView](self, "_currentContentView"), "layer");
  if (v12)
  {
    objc_msgSend(v12, "affineTransform");
    v14 = v35[0];
  }
  else
  {
    v14 = 0.0;
  }
  if (v14 == a4)
    goto LABEL_6;
  v16 = vabdd_f64(a4, v14);
  v17 = fabs(a4);
  v18 = v17 < 1.0 && v17 * 1.79769313e308 < v16;
  if (v18
    || (v17 * 2.22507386e-308 > v16 ? (v19 = v17 <= 1.0) : (v19 = 1),
        v19 && v16 / v17 > 2.22044605e-16
     || (v20 = fabs(v14), v20 < 1.0) && v20 * 1.79769313e308 < v16
     || (v20 * 2.22507386e-308 > v16 ? (v21 = v20 <= 1.0) : (v21 = 1),
         (v13 = v16 / v20, v21) ? (v22 = v13 > 2.22044605e-16) : (v22 = 0),
         v22)))
  {
    m_ptr = self->_page.m_ptr;
    v24 = *((_QWORD *)m_ptr + 26);
    LOBYTE(v35[0]) = 0;
    WebKit::AuxiliaryProcessProxy::send<Messages::WebPage::WillStartUserTriggeredZooming>(v24, (uint64_t)v35, *(_QWORD *)(*((_QWORD *)m_ptr + 4) + 1896), 0);
    v15 = 0;
  }
  else
  {
LABEL_6:
    if (v6 && !objc_msgSend(self->_scrollView.m_ptr, "isScrollEnabled"))
      return;
    v15 = 1;
  }
  objc_msgSend(self->_scrollView.m_ptr, "bounds", v13);
  x = v36.origin.x;
  y = v36.origin.y;
  width = v36.size.width;
  height = v36.size.height;
  v29 = CGRectGetWidth(v36) / a4;
  v37.origin.x = x;
  v37.origin.y = y;
  v37.size.width = width;
  v37.size.height = height;
  v30 = CGRectGetHeight(v37) / a4;
  if (a5)
  {
    if ((v15 & 1) != 0)
    {
      v34[0] = MEMORY[0x1E0C809B0];
      v34[1] = 3221225472;
      v34[2] = __82__WKWebView_WKViewInternalIOS___zoomToCenter_atScale_animated_honorScrollability___block_invoke;
      v34[3] = &unk_1E34C55B8;
      v34[4] = self;
      *(double *)&v34[5] = m_x - v29 * 0.5;
      *(double *)&v34[6] = m_y - v30 * 0.5;
      *(double *)&v34[7] = v29;
      *(double *)&v34[8] = v30;
      objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:animations:", v34, 0.25);
      return;
    }
    v31 = self->_scrollView.m_ptr;
    v32 = v29;
    v33 = 1;
  }
  else
  {
    v31 = self->_scrollView.m_ptr;
    v32 = v29;
    v33 = 0;
  }
  objc_msgSend(v31, "zoomToRect:animated:", v33, m_x - v29 * 0.5, m_y - v30 * 0.5, v32);
}

uint64_t __82__WKWebView_WKViewInternalIOS___zoomToCenter_atScale_animated_honorScrollability___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 608), "zoomToRect:animated:", 0, *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (void)_zoomToRect:(FloatRect)a3 atScale:(double)a4 origin:(FloatPoint)a5 animated:(BOOL)a6
{
  _BOOL8 v6;
  void *v9;
  double x;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  float v24;
  float32x2_t v25;
  float32x2_t v26;
  float32x2_t v27;
  float32x2_t v28;
  float32x2_t v29;
  double v30;
  float m_height;
  float v32;
  float v33;
  float m_width;
  float m_y;
  float m_x;
  float32x2_t v37;
  float32x2_t v38;
  float32x2_t v39[2];
  CGRect v40;

  v6 = a6;
  m_y = a5.m_y;
  m_x = a5.m_x;
  m_height = a3.m_size.m_height;
  m_width = a3.m_size.m_width;
  v32 = a3.m_location.m_y;
  v33 = a3.m_location.m_x;
  v9 = (void *)objc_msgSend(-[WKWebView _currentContentView](self, "_currentContentView"), "layer");
  if (v9)
  {
    objc_msgSend(v9, "affineTransform");
    x = v40.origin.x;
  }
  else
  {
    x = 0.0;
  }
  v11 = x / a4;
  -[WKWebView bounds](self, "bounds");
  -[WKWebView convertRect:toView:](self, "convertRect:toView:", -[WKWebView _currentContentView](self, "_currentContentView"), v12, v13, v14, v15);
  v40.origin.x = v16;
  v40.origin.y = v17;
  v40.size.width = v18;
  v40.size.height = v19;
  WebCore::FloatRect::FloatRect((WebCore::FloatRect *)v39, &v40);
  -[WKWebView _contentRectForUserInteraction](self, "_contentRectForUserInteraction");
  v40.origin.x = v20;
  v40.origin.y = v21;
  v40.size.width = v22;
  v40.size.height = v23;
  WebCore::FloatRect::FloatRect((WebCore::FloatRect *)&v37, &v40);
  v24 = v11;
  v25 = vmul_n_f32(vsub_f32(v37, v39[0]), v24);
  v26 = vmul_n_f32(vsub_f32(vadd_f32(v39[0], v39[1]), vadd_f32(v37, v38)), v24);
  v27 = vmul_n_f32(v38, v24);
  v28 = vsub_f32((float32x2_t)vbsl_s8((int8x8_t)vcgt_f32((float32x2_t)__PAIR64__(LODWORD(m_height), LODWORD(m_width)), v27), (int8x8_t)vsub_f32((float32x2_t)__PAIR64__(LODWORD(m_y), LODWORD(m_x)), vmul_f32(v27, (float32x2_t)0x3F0000003F000000)), (int8x8_t)vsub_f32((float32x2_t)__PAIR64__(LODWORD(v32), LODWORD(v33)), vmul_f32(vsub_f32(v27, (float32x2_t)__PAIR64__(LODWORD(m_height), LODWORD(m_width))), (float32x2_t)0x3F0000003F000000))), v25);
  v29 = vadd_f32(v25, v26);
  v30 = COERCE_DOUBLE(vadd_f32(v28, vmul_f32(vadd_f32(v27, v29), (float32x2_t)0x3F0000003F000000)));
  v29.i32[0] = HIDWORD(v30);
  -[WKWebView _zoomToCenter:atScale:animated:honorScrollability:](self, "_zoomToCenter:atScale:animated:honorScrollability:", v6, 1, v30, *(double *)&v29, a4);
}

- (void)_scrollToContentScrollPosition:(FloatPoint)a3 scrollOrigin:(IntPoint)a4 animated:(BOOL)a5
{
  PerWebProcessState *p_perProcessState;
  _BOOL8 v6;
  uint64_t v8;
  double v9;
  float v10;
  WebKit *v11;
  double v12;
  float v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  BOOL v22;
  WebPageProxy *m_ptr;
  uint64_t v24;
  uint64_t v25;
  float v26;
  float v27;
  BOOL v28;
  float v29;
  BOOL v30;
  BOOL v31;
  float v32;
  float v33;
  float m_y;
  float m_x;
  IntPoint v36;
  _QWORD v37[6];
  uint64_t v38;
  CGPoint v39;

  v36 = a4;
  p_perProcessState = &self->_perProcessState;
  if (self->_perProcessState.commitDidRestoreScrollPosition)
    return;
  v6 = a5;
  m_y = a3.m_y;
  m_x = a3.m_x;
  if (-[WKWebView _shouldDeferGeometryUpdates](self, "_shouldDeferGeometryUpdates"))
    return;
  v8 = *(_QWORD *)(*(_QWORD *)(*((_QWORD *)self->_page.m_ptr + 25) + 24) + 16);
  if (!v8 || *(_BYTE *)(v8 + 250) == 1 && *(_BYTE *)(v8 + 251) == 1)
  {
    objc_msgSend(self->_scrollView.m_ptr, "zoomScale");
    v10 = v9;
    v11 = (WebKit *)objc_msgSend(self->_scrollView.m_ptr, "minimumZoomScale");
    v13 = v12;
    if (!WebKit::scalesAreEssentiallyEqual(v11, v10, v13))
    {
      -[WKWebView _scheduleForcedVisibleContentRectUpdate](self, "_scheduleForcedVisibleContentRectUpdate");
      return;
    }
  }
  WebCore::FloatPoint::FloatPoint((WebCore::FloatPoint *)v37, &v36);
  v14 = (void *)objc_msgSend(-[WKWebView _currentContentView](self, "_currentContentView"), "layer");
  if (v14)
    objc_msgSend(v14, "affineTransform");
  WebCore::FloatPoint::operator CGPoint();
  -[WKWebView _contentOffsetAdjustedForObscuredInset:](self, "_contentOffsetAdjustedForObscuredInset:");
  contentOffsetBoundedInValidRange((UIScrollView *)self->_scrollView.m_ptr, v39);
  v16 = v15;
  v18 = v17;
  objc_msgSend(self->_scrollView.m_ptr, "_wk_stopScrollingAndZooming");
  objc_msgSend(self->_scrollView.m_ptr, "contentOffset");
  if (v16 != v19 || v18 != v20)
  {
    if (m_x == 0.0)
    {
      v22 = 1;
    }
    else
    {
      v26 = fabsf(m_x);
      if (v26 >= 1.0 || (float)(v26 * 3.4028e38) >= v26)
      {
        v31 = v26 <= 1.0;
        if ((float)(v26 * 1.1755e-38) <= v26)
          v31 = 1;
        v27 = m_y;
        if ((float)(m_x / m_x) > 0.00000011921 && v31)
        {
          v22 = 0;
        }
        else
        {
          v33 = v26 / 0.0;
          if (m_x < 0.0)
            v33 = 3.4028e38;
          if (m_x > 0.0)
            v33 = 3.4028e38;
          v22 = v33 <= 0.00000011921;
        }
        goto LABEL_22;
      }
      v22 = 0;
    }
    v27 = m_y;
LABEL_22:
    if (v19 >= 0.0 || !v22)
      v19 = v16;
    if (v27 == 0.0)
    {
      v28 = 1;
    }
    else
    {
      v29 = fabsf(v27);
      if (v29 < 1.0 && (float)(v29 * 3.4028e38) < v29)
        goto LABEL_32;
      v30 = v29 <= 1.0;
      if ((float)(v29 * 1.1755e-38) <= v29)
        v30 = 1;
      if ((float)(v27 / v27) > 0.00000011921 && v30)
      {
LABEL_32:
        v28 = 0;
      }
      else
      {
        v32 = v29 / 0.0;
        if (v27 < 0.0)
          v32 = 3.4028e38;
        if (v27 > 0.0)
          v32 = 3.4028e38;
        v28 = v32 <= 0.00000011921;
      }
    }
    if (!v28 || v20 >= 0.0)
      v20 = v18;
    objc_msgSend(self->_scrollView.m_ptr, "setContentOffset:animated:", v6, v19, v20);
    return;
  }
  if (!p_perProcessState->didDeferUpdateVisibleContentRectsForAnyReason)
  {
    m_ptr = self->_page.m_ptr;
    v24 = *((_QWORD *)m_ptr + 26);
    v25 = *((_QWORD *)m_ptr + 4);
    v38 = *(_QWORD *)(v25 + 1896);
    v37[0] = &v38;
    v37[1] = v25 + 2256;
    WebKit::AuxiliaryProcessProxy::send<Messages::ViewUpdateDispatcher::VisibleContentRectUpdate>(v24, (uint64_t)v37, 0, 0);
  }
}

- (float)_adjustScrollRectToAvoidHighlightOverlay:(FloatRect)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  float v17;
  double v23;
  double v24;
  float v25;
  double v26;
  double v27;
  double v28;
  double v29;
  float v30;
  double v31;
  double v32;
  double v33;
  double v34;
  CGRect v36;
  _BYTE v37[4];
  float v38;
  float32x2_t v39;
  FloatRect v40;
  CGRect v41;

  v40 = a3;
  v4 = (void *)*((_QWORD *)self->_page.m_ptr + 164);
  if (v4)
  {
    objc_msgSend(v4, "visibleFrame");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
  }
  else
  {
    v6 = *MEMORY[0x1E0C9D628];
    v8 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v10 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v12 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  }
  -[WKWebView convertRect:fromCoordinateSpace:](self, "convertRect:fromCoordinateSpace:", objc_msgSend((id)objc_msgSend((id)-[WKWebView window](self, "window"), "screen"), "coordinateSpace"), v6, v8, v10, v12);
  v36.origin.x = v13;
  v36.origin.y = v14;
  v36.size.width = v15;
  v36.size.height = v16;
  WebCore::FloatRect::FloatRect((WebCore::FloatRect *)v37, &v36);
  WebCore::FloatRect::operator CGRect();
  v17 = 0.0;
  if (!CGRectIsNull(v41))
  {
    __asm { FMOV            V1.2S, #5.0 }
    v39 = vadd_f32(v39, _D1);
    if (WebCore::FloatRect::intersects((WebCore::FloatRect *)&v40, (const WebCore::FloatRect *)v37))
    {
      v23 = v38;
      -[WKWebView bounds](self, "bounds");
      v25 = v23 - v24;
      -[WKWebView bounds](self, "bounds");
      v27 = v26;
      -[WKWebView bounds](self, "bounds");
      *(float *)&v27 = v27 + v28 - (float)(v38 + v39.f32[1]);
      -[WKWebView center](self, "center");
      v30 = v29;
      -[WKWebView bounds](self, "bounds");
      v31 = v30;
      v33 = v32 + (float)(*(float *)&v27 * 0.5);
      v34 = v32 + (float)(v25 * 0.5);
      if (v25 <= *(float *)&v27)
      {
        v34 = v30;
        v31 = v33;
      }
      return v31 - v34;
    }
  }
  return v17;
}

- (BOOL)_scrollToRect:(FloatRect)a3 origin:(FloatPoint)a4 minimumScrollDistance:(float)a5
{
  float m_y;
  float m_x;
  float m_height;
  float m_width;
  float v10;
  float v11;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  float v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  double v22;
  double v23;
  double v24;
  float v25;
  float v26;
  float v27;
  float v28;
  float left;
  float top;
  float x;
  float v32;
  float v33;
  float v34;
  float v35;
  float v36;
  float v37;
  float v38;
  float v39;
  float v40;
  float v41;
  float v42;
  float v43;
  void *v44;
  float v45;
  float v46;
  float v47;
  double v48;
  double v49;
  double v50;
  double v51;
  CGFloat v52;
  CGFloat v53;
  CGFloat v54;
  CGFloat v55;
  float v56;
  BOOL v57;
  float v58;
  void *m_ptr;
  CGFloat v60;
  CGFloat v61;
  float v63;
  float v64;
  float v65[4];
  float32x2_t v66;
  unint64_t v67;
  float v68;
  float v69;
  unint64_t v70;
  float32x2_t v71;
  _DWORD v72[2];
  float32x2_t v73;
  CGRect v74;

  m_y = a4.m_y;
  m_x = a4.m_x;
  m_height = a3.m_size.m_height;
  m_width = a3.m_size.m_width;
  v10 = a3.m_location.m_y;
  v11 = a3.m_location.m_x;
  if (!objc_msgSend(self->_scrollView.m_ptr, "isScrollEnabled"))
    return 0;
  v63 = a5;
  -[WKWebView _contentRectForUserInteraction](self, "_contentRectForUserInteraction");
  v74.origin.x = v13;
  v74.origin.y = v14;
  v74.size.width = v15;
  v74.size.height = v16;
  WebCore::FloatRect::FloatRect((WebCore::FloatRect *)v72, &v74);
  v17 = *(float *)v72;
  v64 = *(float *)&v72[1];
  objc_msgSend(-[WKWebView _currentContentView](self, "_currentContentView"), "bounds");
  v74.origin.x = v18;
  v74.origin.y = v19;
  v74.size.width = v20;
  v74.size.height = v21;
  WebCore::FloatSize::FloatSize((WebCore::FloatSize *)&v71, &v74.size);
  objc_msgSend(self->_scrollView.m_ptr, "adjustedContentInset");
  v23 = v22;
  v25 = v24;
  v26 = -v25;
  v27 = v23;
  v28 = -v27;
  *(float *)&v70 = -v25;
  *((float *)&v70 + 1) = -v27;
  if (self->_haveSetObscuredInsets)
  {
    left = self->_obscuredInsets.left;
    top = self->_obscuredInsets.top;
    *(float *)&v70 = left - v25;
    *((float *)&v70 + 1) = top - v27;
    v74.origin.x = 0.0;
    WebCore::FloatPoint::constrainedBetween((WebCore::FloatPoint *)&v70, (const WebCore::FloatPoint *)&v70, (const WebCore::FloatPoint *)&v74);
    v70 = __PAIR64__(LODWORD(v28), LODWORD(v26));
  }
  v67 = __PAIR64__(LODWORD(v28), LODWORD(v26));
  x = 0.0;
  if (m_width <= v73.f32[0])
    v32 = m_width;
  else
    v32 = 0.0;
  v33 = v73.f32[0] - v32;
  if (m_width <= v73.f32[0])
    v34 = v11;
  else
    v34 = m_x;
  v35 = v34 - (float)(v33 * 0.5);
  if (m_height <= v73.f32[1])
    v36 = m_height;
  else
    v36 = 0.0;
  v37 = v73.f32[1] - v36;
  if (m_height <= v73.f32[1])
    v38 = v10;
  else
    v38 = m_y;
  *(float *)&v74.origin.x = v35;
  *((float *)&v74.origin.x + 1) = v38 - (float)(v37 * 0.5);
  v66 = vsub_f32(v71, v73);
  WebCore::FloatPoint::constrainedBetween((WebCore::FloatPoint *)&v74, (const WebCore::FloatPoint *)&v67, (const WebCore::FloatPoint *)&v66);
  if (v17 == v39 && v64 == v40)
  {
    v67 = v70;
    if (m_width > v73.f32[0])
      v39 = m_x - (float)(0.5 * v73.f32[0]);
    v41 = m_y - vmuls_lane_f32(0.5, v73, 1);
    if (m_height > v73.f32[1])
      v40 = v41;
    *(_QWORD *)&v74.origin.x = __PAIR64__(LODWORD(v40), LODWORD(v39));
    v66 = vsub_f32(v71, v73);
    WebCore::FloatPoint::constrainedBetween((WebCore::FloatPoint *)&v74, (const WebCore::FloatPoint *)&v67, (const WebCore::FloatPoint *)&v66);
  }
  v42 = v39 - v17;
  v43 = v40 - v64;
  v44 = (void *)objc_msgSend(-[WKWebView _currentContentView](self, "_currentContentView"), "layer");
  if (v44)
  {
    objc_msgSend(v44, "affineTransform");
    x = v74.origin.x;
  }
  v45 = v42 * x;
  v46 = v43 * x;
  v47 = hypotf(v45, v46);
  v67 = __PAIR64__(LODWORD(v10), LODWORD(v11));
  v68 = m_width;
  v69 = m_height;
  WebCore::FloatRect::operator CGRect();
  -[WKWebView convertRect:fromView:](self, "convertRect:fromView:", -[WKWebView _currentContentView](self, "_currentContentView"), v48, v49, v50, v51);
  v74.origin.x = v52;
  v74.origin.y = v53;
  v74.size.width = v54;
  v74.size.height = v55;
  WebCore::FloatRect::FloatRect((WebCore::FloatRect *)&v66, &v74);
  v66.f32[0] = v66.f32[0] - v45;
  v66.f32[1] = v66.f32[1] - v46;
  -[WKWebView _adjustScrollRectToAvoidHighlightOverlay:](self, "_adjustScrollRectToAvoidHighlightOverlay:");
  v57 = v47 >= v63;
  if (v47 >= v63)
  {
    v58 = v46 + v56;
    objc_msgSend(self->_contentView.m_ptr, "willStartZoomOrScroll");
    m_ptr = self->_scrollView.m_ptr;
    objc_msgSend(m_ptr, "contentOffset");
    v74.origin.x = v60;
    v74.origin.y = v61;
    WebCore::FloatPoint::FloatPoint((WebCore::FloatPoint *)v65, &v74.origin);
    v65[2] = (float)(v45 + 0.0) + v65[0];
    v65[3] = v58 + v65[1];
    WebCore::FloatPoint::operator CGPoint();
    objc_msgSend(m_ptr, "setContentOffset:animated:", 1);
  }
  return v57;
}

- (void)_zoomOutWithOrigin:(FloatPoint)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  float m_y;
  float m_x;
  double v8;
  double v9;
  double v10;

  v4 = a4;
  m_y = a3.m_y;
  m_x = a3.m_x;
  objc_msgSend(self->_scrollView.m_ptr, "minimumZoomScale");
  v9 = v8;
  *(float *)&v8 = m_x;
  *(float *)&v10 = m_y;
  -[WKWebView _zoomToCenter:atScale:animated:honorScrollability:](self, "_zoomToCenter:atScale:animated:honorScrollability:", v4, 1, v8, v10, v9);
}

- (void)_zoomToInitialScaleWithOrigin:(FloatPoint)a3 animated:(BOOL)a4
{
  -[WKWebView _zoomToCenter:atScale:animated:honorScrollability:](self, "_zoomToCenter:atScale:animated:honorScrollability:", a4, 1, *(double *)&a3, *(double *)&a3.m_y, self->_perProcessState.initialScaleFactor);
}

- (BOOL)_selectionRectIsFullyVisibleAndNonEmpty
{
  float v3;
  unsigned int v4;
  float v5;
  float v6;
  BOOL result;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGRect v20;
  CGRect v21;

  v3 = WebKit::WebPageProxy::selectionBoundingRectInRootViewCoordinates((WebKit::WebPageProxy *)self->_page.m_ptr);
  result = 0;
  if (v5 > 0.0 && v6 > 0.0)
  {
    -[WKWebView _contentRectForUserInteraction](self, "_contentRectForUserInteraction", __PAIR64__(v4, LODWORD(v3)), __PAIR64__(LODWORD(v6), LODWORD(v5)));
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;
    WebCore::FloatRect::operator CGRect();
    v21.origin.x = v16;
    v21.origin.y = v17;
    v21.size.width = v18;
    v21.size.height = v19;
    v20.origin.x = v9;
    v20.origin.y = v11;
    v20.size.width = v13;
    v20.size.height = v15;
    return CGRectContainsRect(v20, v21);
  }
  return result;
}

- (void)_scrollToAndRevealSelectionIfNeeded
{
  float v3;
  float v4;
  float v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  float v15;
  float v16;
  double v17;
  BOOL v18;
  double v19;
  double v20;
  float v21;
  float v22;
  double v23;
  double v24;
  void *v25;
  double x;
  double v27;
  double v28;
  float v29;
  float v30;
  float v31;
  float v32;
  float v33;
  float v34;
  float v35;
  float v36;
  CGRect v37;

  if (objc_msgSend(self->_scrollView.m_ptr, "isScrollEnabled"))
  {
    v33 = WebKit::WebPageProxy::selectionBoundingRectInRootViewCoordinates((WebKit::WebPageProxy *)self->_page.m_ptr)
        + -4.0;
    v34 = v4 + -4.0;
    v35 = (float)(v3 + 4.0) + 4.0;
    v36 = (float)(v5 + 4.0) + 4.0;
    objc_msgSend(self->_contentView.m_ptr, "bounds");
    v37.origin.x = v6;
    v37.origin.y = v7;
    v37.size.width = v8;
    v37.size.height = v9;
    WebCore::FloatRect::FloatRect((WebCore::FloatRect *)&v29, &v37);
    WebCore::FloatRect::intersect((WebCore::FloatRect *)&v33, (const WebCore::FloatRect *)&v29);
    if (v35 > 0.0)
    {
      *(float *)&v10 = v36;
      if (v36 > 0.0)
      {
        -[WKWebView _contentRectForUserInteraction](self, "_contentRectForUserInteraction", v10);
        v37.origin.x = v11;
        v37.origin.y = v12;
        v37.size.width = v13;
        v37.size.height = v14;
        WebCore::FloatRect::FloatRect((WebCore::FloatRect *)&v29, &v37);
        v15 = v30 + v32;
        v16 = v34 + v36;
        v17 = (float)(v34 - v30);
        if (v30 <= v34)
          v17 = *(double *)(MEMORY[0x1E0C9D820] + 8);
        v18 = v15 < v16;
        v19 = (float)(v16 - v15);
        if (v18)
          v20 = v19;
        else
          v20 = v17;
        v21 = v29 + v31;
        v22 = v33 + v35;
        v23 = (float)(v33 - v29);
        if (v29 <= v33)
          v23 = *MEMORY[0x1E0C9D820];
        if (v21 < v22)
          v24 = (float)(v22 - v21);
        else
          v24 = v23;
        if (v24 != *MEMORY[0x1E0C9D820] || v20 != *(double *)(MEMORY[0x1E0C9D820] + 8))
        {
          v25 = (void *)objc_msgSend(-[WKWebView _currentContentView](self, "_currentContentView"), "layer");
          if (v25)
          {
            objc_msgSend(v25, "affineTransform");
            x = v37.origin.x;
          }
          else
          {
            x = 0.0;
          }
          objc_msgSend(self->_scrollView.m_ptr, "contentOffset");
          objc_msgSend(self->_scrollView.m_ptr, "setContentOffset:animated:", 1, v27 + v24 * x, v28 + v20 * x);
        }
      }
    }
  }
}

- (void)_zoomToFocusRect:(const FloatRect *)a3 selectionRect:(const FloatRect *)a4 fontSize:(float)a5 minimumScale:(double)a6 maximumScale:(double)a7 allowScaling:(BOOL)a8 forceScroll:(BOOL)a9
{
  _BOOL4 v9;
  _BOOL4 v10;
  void *v14;
  UIEdgeInsets *p_obscuredInsets;
  double top;
  double left;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat v34;
  CGFloat v35;
  CGFloat v36;
  CGFloat v37;
  CGFloat v38;
  CGFloat v39;
  CGFloat v40;
  CGFloat v41;
  BOOL IsEmpty;
  CGFloat v43;
  uint64_t v44;
  double v45;
  CGFloat MinY;
  CGFloat v47;
  double v48;
  double MaxY;
  double v50;
  double v52;
  double v53;
  void *v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  float v60;
  CGFloat v61;
  CGFloat v62;
  CGFloat v63;
  CGFloat v64;
  double v65;
  float m_width;
  BOOL v67;
  double v68;
  CGFloat v69;
  CGFloat v70;
  CGFloat v71;
  CGFloat v72;
  CGFloat v73;
  CGFloat v74;
  CGFloat v75;
  CGFloat v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double m_x;
  double v88;
  double m_y;
  double v90;
  CGFloat v91;
  CGFloat v92;
  CGFloat v93;
  CGFloat v94;
  CGFloat v95;
  CGFloat v96;
  CGFloat v97;
  CGFloat v98;
  double v99;
  double v100;
  double v101;
  double v102;
  CGFloat v103;
  CGFloat v104;
  CGFloat v105;
  CGFloat v106;
  double v107;
  double v108;
  double v109;
  double v110;
  double v111;
  double v112;
  CGFloat v113;
  CGFloat v114;
  WebPageProxy *m_ptr;
  uint64_t v116;
  float v117;
  CGFloat v118;
  CGFloat rect;
  double v123;
  double v124;
  CGRect rect1;
  FloatRect v126;
  float32x2_t v127[2];
  FloatRect v128;
  CGRect v129;
  CGRect v130;
  CGRect v131;
  CGRect v132;
  CGRect v133;
  CGRect v134;
  CGRect v135;
  CGRect v136;
  CGRect v137;
  CGRect v138;
  CGRect v139;
  CGRect v140;
  CGRect v141;
  CGRect v142;
  CGRect v143;
  CGRect v144;
  CGRect v145;
  CGRect v146;
  CGRect v147;
  CGRect v148;
  CGRect v149;
  CGRect v150;
  CGRect v151;
  CGRect v152;
  CGRect v153;

  v9 = a9;
  v10 = a8;
  v14 = (void *)objc_msgSend(self->_scrollView.m_ptr, "window");
  -[WKWebView bounds](self, "bounds");
  p_obscuredInsets = &self->_obscuredInsets;
  top = self->_obscuredInsets.top;
  left = self->_obscuredInsets.left;
  v19 = v18 + left;
  v21 = v20 + top;
  v23 = v22 - (left + self->_obscuredInsets.right);
  v25 = v24 - (top + self->_obscuredInsets.bottom);
  objc_msgSend(v14, "bounds");
  objc_msgSend(v14, "convertRect:toView:", self);
  v150.origin.x = v26;
  v150.origin.y = v27;
  v150.size.width = v28;
  v150.size.height = v29;
  v123 = v21;
  rect1.origin.x = v19;
  v130.origin.x = v19;
  v130.origin.y = v21;
  v130.size.width = v23;
  v130.size.height = v25;
  v131 = CGRectIntersection(v130, v150);
  x = v131.origin.x;
  y = v131.origin.y;
  width = v131.size.width;
  height = v131.size.height;
  objc_msgSend(v14, "convertRect:toView:", self, self->_inputViewBoundsInWindow.origin.x, self->_inputViewBoundsInWindow.origin.y, self->_inputViewBoundsInWindow.size.width, self->_inputViewBoundsInWindow.size.height);
  v151.origin.x = v34;
  v151.origin.y = v35;
  v151.size.width = v36;
  v151.size.height = v37;
  v132.origin.x = x;
  rect = y;
  v132.origin.y = y;
  rect1.origin.y = width;
  v132.size.width = width;
  v132.size.height = height;
  v133 = CGRectIntersection(v132, v151);
  v38 = v133.origin.x;
  v39 = v133.origin.y;
  v40 = v133.size.width;
  v41 = v133.size.height;
  IsEmpty = CGRectIsEmpty(v133);
  v43 = 0.0;
  *(double *)&v44 = 0.0;
  v45 = 0.0;
  rect1.size.width = height;
  if (!IsEmpty)
  {
    v134.origin.x = v38;
    v134.origin.y = v39;
    v134.size.width = v40;
    v134.size.height = v41;
    rect1.size.width = CGRectGetMinY(v134);
    v135.origin.x = x;
    v135.origin.y = rect;
    v135.size.width = rect1.origin.y;
    v135.size.height = height;
    MinY = CGRectGetMinY(v135);
    v47 = x;
    v48 = rect1.size.width - MinY;
    v118 = v47;
    v136.origin.x = v47;
    v136.origin.y = rect;
    v136.size.width = rect1.origin.y;
    v136.size.height = height;
    MaxY = CGRectGetMaxY(v136);
    v137.origin.x = v38;
    v137.origin.y = v39;
    v137.size.width = v40;
    v137.size.height = v41;
    v50 = MaxY - CGRectGetMaxY(v137);
    rect1.size.width = v48;
    if (v48 >= 106.0 || v50 < v48)
    {
      *(double *)&v44 = 50.0;
      v45 = 0.0;
    }
    else
    {
      v138.origin.x = v38;
      v138.origin.y = v39;
      v138.size.width = v40;
      v138.size.height = v41;
      v52 = CGRectGetMaxY(v138);
      v139.origin.x = v118;
      v139.origin.y = rect;
      v139.size.width = rect1.origin.y;
      v139.size.height = height;
      v45 = v52 - CGRectGetMinY(v139);
      *(double *)&v44 = 0.0;
      rect1.size.width = v50;
    }
    v43 = 0.0;
  }
  v53 = *(double *)&v44;
  v54 = (void *)objc_msgSend(-[WKWebView _currentContentView](self, "_currentContentView", *(_QWORD *)&v118), "layer");
  if (v54)
  {
    objc_msgSend(v54, "affineTransform");
    v43 = v129.origin.x;
  }
  v55 = v43;
  if (v10)
  {
    v56 = 16.0 / a5;
    v57 = a6;
    if (v56 > a6)
      v57 = 16.0 / a5;
    if (v56 >= a7)
      v55 = a7;
    else
      v55 = v57;
  }
  objc_msgSend(self->_contentView.m_ptr, "bounds");
  v59 = round(v55 * v58) / v58;
  v128 = *a3;
  v60 = v59;
  WebCore::FloatRect::scale((WebCore::FloatRect *)&v128, v60, v60);
  objc_msgSend(self->_contentView.m_ptr, "frame");
  v129.origin.x = v61;
  v129.origin.y = v62;
  v129.size.width = v63;
  v129.size.height = v64;
  WebCore::FloatPoint::FloatPoint((WebCore::FloatPoint *)v127, &v129.origin);
  v65 = COERCE_DOUBLE(vadd_f32(v127[0], (float32x2_t)v128.m_location));
  *(double *)&v128.m_location = v65;
  m_width = a4->m_size.m_width;
  *(float *)&v65 = a4->m_size.m_height;
  if (m_width == 0.0)
    goto LABEL_21;
  if (m_width < 0.0)
    m_width = -m_width;
  if (m_width < 0.00000011921)
  {
LABEL_21:
    if (*(float *)&v65 == 0.0)
    {
      LODWORD(v65) = 0;
    }
    else if (*(float *)&v65 < 0.0)
    {
      *(float *)&v65 = -*(float *)&v65;
    }
    v67 = *(float *)&v65 < 0.00000011921;
    if (!v9)
    {
LABEL_29:
      v68 = rect1.size.width - v53;
      WebCore::FloatRect::operator CGRect();
      -[WKWebView convertRect:fromView:](self, "convertRect:fromView:", self->_contentView.m_ptr);
      v152.origin.x = v69;
      v152.origin.y = v70;
      v152.size.width = v71;
      v152.size.height = v72;
      v140.origin.x = rect1.origin.x;
      v140.origin.y = v123 + v45;
      v140.size.width = rect1.origin.y;
      v140.size.height = v68;
      if (CGRectContainsRect(v140, v152))
        return;
      if (!v67)
      {
        WebCore::FloatRect::operator CGRect();
        -[WKWebView convertRect:fromView:](self, "convertRect:fromView:", self->_contentView.m_ptr);
        v153.origin.x = v73;
        v153.origin.y = v74;
        v153.size.width = v75;
        v153.size.height = v76;
        v141.origin.x = rect1.origin.x;
        v141.origin.y = v123 + v45;
        v141.size.width = rect1.origin.y;
        v141.size.height = v68;
        if (CGRectContainsRect(v141, v153))
          return;
      }
      goto LABEL_32;
    }
  }
  else
  {
    v67 = 0;
    if (!v9)
      goto LABEL_29;
  }
  if (objc_msgSend(self->_contentView.m_ptr, "_shouldAvoidScrollingWhenFocusedContentIsVisible", v65))
    goto LABEL_29;
LABEL_32:
  v124 = v59;
  rect1.origin.x = v43;
  v77 = v45;
  v78 = (rect1.origin.y - v128.m_size.m_width) * 0.5;
  v79 = rect1.size.width - v128.m_size.m_height;
  objc_msgSend(self->_scrollView.m_ptr, "adjustedContentInset");
  v81 = v80;
  v83 = v82;
  objc_msgSend(self->_scrollView.m_ptr, "contentOffset");
  if (self->_haveSetObscuredInsets)
  {
    v84 = v84 + self->_obscuredInsets.left;
    v85 = v85 + p_obscuredInsets->top;
  }
  v86 = v79 * 0.5;
  if (v78 <= 0.0)
  {
    v88 = -v83;
    if (v128.m_location.m_x + rect1.origin.y * -0.5 > -v83)
      v88 = v128.m_location.m_x + rect1.origin.y * -0.5;
    if (v84 > v88)
      v88 = v84;
    if (v84 >= v128.m_location.m_x)
      m_x = v128.m_location.m_x;
    else
      m_x = v88;
  }
  else
  {
    m_x = v128.m_location.m_x - v78;
  }
  if (v86 <= 0.0)
  {
    m_y = -v81;
    if (v128.m_location.m_y + rect1.size.width * -0.5 > -v81)
      m_y = v128.m_location.m_y + rect1.size.width * -0.5;
    if (v85 > m_y)
      m_y = v85;
    if (v85 >= v128.m_location.m_y)
      m_y = v128.m_location.m_y;
  }
  else
  {
    m_y = v128.m_location.m_y - v86;
  }
  v90 = m_y - v77;
  objc_msgSend(self->_contentView.m_ptr, "bounds");
  v129.origin.x = v91;
  v129.origin.y = v92;
  v129.size.width = v93;
  v129.size.height = v94;
  WebCore::FloatRect::FloatRect((WebCore::FloatRect *)v127, &v129);
  WebCore::FloatRect::scale((WebCore::FloatRect *)v127, v60, v60);
  objc_msgSend(self->_contentView.m_ptr, "frame");
  v129.origin.x = v95;
  v129.origin.y = v96;
  v129.size.width = v97;
  v129.size.height = v98;
  WebCore::FloatPoint::FloatPoint((WebCore::FloatPoint *)&v126, &v129.origin);
  v127[0] = vadd_f32((float32x2_t)v126.m_location, v127[0]);
  WebCore::FloatRect::operator CGRect();
  v99 = CGRectGetMaxX(v142) - rect1.origin.y;
  WebCore::FloatRect::operator CGRect();
  v100 = CGRectGetMaxY(v143) - rect1.size.width;
  if (v67)
  {
    v101 = -INFINITY;
    v102 = -INFINITY;
  }
  else
  {
    v126 = *a4;
    WebCore::FloatRect::scale((WebCore::FloatRect *)&v126, v60, v60);
    objc_msgSend(self->_contentView.m_ptr, "frame");
    v129.origin.x = v103;
    v129.origin.y = v104;
    v129.size.width = v105;
    v129.size.height = v106;
    WebCore::FloatPoint::FloatPoint((WebCore::FloatPoint *)&rect1.size.height, &v129.origin);
    v126.m_location = (FloatPoint)vadd_f32(*(float32x2_t *)&rect1.size.height, (float32x2_t)v126.m_location);
    WebCore::FloatRect::operator CGRect();
    v101 = CGRectGetMaxX(v144) + 8.0 - rect1.origin.y;
    WebCore::FloatRect::operator CGRect();
    v102 = CGRectGetMaxY(v145) + 8.0 - rect1.size.width - v77;
    WebCore::FloatRect::operator CGRect();
    v107 = CGRectGetMinX(v146) + -8.0;
    if (v107 < v99)
      v99 = v107;
    WebCore::FloatRect::operator CGRect();
    v108 = CGRectGetMinY(v147) + -8.0 - v77;
    if (v108 < v100)
      v100 = v108;
  }
  if (m_x > v101)
    v109 = m_x;
  else
    v109 = v101;
  if (m_x >= v99)
    v110 = v99;
  else
    v110 = v109;
  if (v90 > v102)
    v111 = v90;
  else
    v111 = v102;
  if (v90 >= v100)
    v112 = v100;
  else
    v112 = v111;
  if (self->_haveSetObscuredInsets)
  {
    v110 = v110 - self->_obscuredInsets.left;
    v112 = v112 - p_obscuredInsets->top;
  }
  -[WKWebView bounds](self, "bounds");
  v113 = v110 + CGRectGetWidth(v148) * 0.5;
  -[WKWebView bounds](self, "bounds");
  v114 = CGRectGetHeight(v149);
  v129.origin.x = v113;
  v129.origin.y = v112 + v114 * 0.5;
  WebCore::FloatPoint::FloatPoint((WebCore::FloatPoint *)&v126, &v129.origin);
  if (v124 != rect1.origin.x)
  {
    m_ptr = self->_page.m_ptr;
    v116 = *((_QWORD *)m_ptr + 26);
    LOBYTE(v129.origin.x) = 0;
    WebKit::AuxiliaryProcessProxy::send<Messages::WebPage::WillStartUserTriggeredZooming>(v116, (uint64_t)&v129, *(_QWORD *)(*((_QWORD *)m_ptr + 4) + 1896), 0);
  }
  v117 = 1.0 / v124;
  v126.m_location.m_x = v126.m_location.m_x * v117;
  v126.m_location.m_y = v126.m_location.m_y * v117;
  -[WKWebView _zoomToCenter:atScale:animated:honorScrollability:](self, "_zoomToCenter:atScale:animated:honorScrollability:", 1, 0);
}

- (double)_initialScaleFactor
{
  return self->_perProcessState.initialScaleFactor;
}

- (double)_contentZoomScale
{
  void *v2;
  double v4;

  v2 = (void *)objc_msgSend(-[WKWebView _currentContentView](self, "_currentContentView"), "layer");
  if (!v2)
    return 0.0;
  objc_msgSend(v2, "affineTransform");
  return v4;
}

- (double)_targetContentZoomScaleForRect:(const FloatRect *)a3 currentScale:(double)a4 fitEntireRect:(BOOL)a5 minimumScale:(double)a6 maximumScale:(double)a7
{
  CGFloat v9;
  CGFloat v10;
  float64x2_t v11;
  float64x2_t v12;
  float64x2_t v13;
  float64x2_t v14;
  int8x16_t v15;
  CGSize v20;
  float32x2_t v21;

  -[WKWebView _contentRectForUserInteraction](self, "_contentRectForUserInteraction");
  v20.width = v9;
  v20.height = v10;
  WebCore::FloatSize::FloatSize((WebCore::FloatSize *)&v21, &v20);
  v11 = vdivq_f64(vmulq_n_f64(vcvtq_f64_f32(v21), a4), vcvtq_f64_f32((float32x2_t)a3->m_size));
  v12 = (float64x2_t)vdupq_lane_s64(*(uint64_t *)&a6, 0);
  v13 = (float64x2_t)vbslq_s8((int8x16_t)vcgtq_f64(v12, v11), (int8x16_t)v12, (int8x16_t)v11);
  v14 = (float64x2_t)vdupq_lane_s64(*(uint64_t *)&a7, 0);
  v15 = vbslq_s8((int8x16_t)vcgtq_f64(v13, v14), (int8x16_t)v14, (int8x16_t)v13);
  if (a5 && *(double *)&v15.i64[1] < *(double *)v15.i64)
    v15.i64[0] = v15.i64[1];
  return *(double *)v15.i64;
}

- (BOOL)_zoomToRect:(FloatRect)a3 withOrigin:(FloatPoint)a4 fitEntireRect:(BOOL)a5 minimumScale:(double)a6 maximumScale:(double)a7 minimumScrollDistance:(float)a8
{
  _BOOL8 v10;
  float m_y;
  float m_x;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  BOOL v24;
  FloatRect v26;
  double v27;

  v10 = a5;
  m_y = a4.m_y;
  m_x = a4.m_x;
  v26 = a3;
  v14 = (void *)objc_msgSend(-[WKWebView _currentContentView](self, "_currentContentView"), "layer");
  if (v14)
  {
    objc_msgSend(v14, "affineTransform");
    v15 = v27;
  }
  else
  {
    v15 = 0.0;
  }
  -[WKWebView _targetContentZoomScaleForRect:currentScale:fitEntireRect:minimumScale:maximumScale:](self, "_targetContentZoomScaleForRect:currentScale:fitEntireRect:minimumScale:maximumScale:", &v26, v10, v15, a6, a7);
  v21 = v20;
  v22 = vabdd_f64(v20, v15);
  HIDWORD(v23) = 1066695393;
  if (v22 >= 0.0199999996)
  {
    if (v21 != v15)
    {
      *(float *)&v22 = v26.m_location.m_x;
      *(float *)&v23 = v26.m_location.m_y;
      *(float *)&v16 = v26.m_size.m_width;
      *(float *)&v17 = v26.m_size.m_height;
      v24 = 1;
      *(float *)&v18 = m_x;
      *(float *)&v19 = m_y;
      -[WKWebView _zoomToRect:atScale:origin:animated:](self, "_zoomToRect:atScale:origin:animated:", 1, v22, v23, v16, v17, v21, v18, v19);
      return v24;
    }
    return 0;
  }
  *(float *)&v19 = a8;
  *(float *)&v22 = v26.m_location.m_x;
  *(float *)&v23 = v26.m_location.m_y;
  *(float *)&v16 = v26.m_size.m_width;
  *(float *)&v17 = v26.m_size.m_height;
  *(float *)&v21 = m_x;
  *(float *)&v18 = m_y;
  return -[WKWebView _scrollToRect:origin:minimumScrollDistance:](self, "_scrollToRect:origin:minimumScrollDistance:", v22, v23, v16, v17, v21, v18, v19);
}

- (void)_updateLastKnownWindowSizeAndOrientation
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  int64_t v8;

  v3 = (void *)objc_msgSend((id)-[WKWebView window](self, "window"), "windowScene");
  objc_msgSend((id)objc_msgSend(v3, "coordinateSpace"), "bounds");
  v5 = v4;
  v7 = v6;
  v8 = objc_msgSend(v3, "interfaceOrientation");
  self->_lastKnownWindowSizeAndOrientation.first.width = v5;
  self->_lastKnownWindowSizeAndOrientation.first.height = v7;
  self->_lastKnownWindowSizeAndOrientation.second = v8;
}

- (void)scrollViewWillBeginZooming:(id)a3 withView:(id)a4
{
  WebPageProxy *m_ptr;
  uint64_t v8;
  char v9;

  if (-[WKWebView usesStandardContentView](self, "usesStandardContentView"))
  {
    if (objc_msgSend((id)objc_msgSend(a3, "pinchGestureRecognizer"), "state") == 1)
    {
      m_ptr = self->_page.m_ptr;
      v8 = *((_QWORD *)m_ptr + 26);
      v9 = 0;
      WebKit::AuxiliaryProcessProxy::send<Messages::WebPage::WillStartUserTriggeredZooming>(v8, (uint64_t)&v9, *(_QWORD *)(*((_QWORD *)m_ptr + 4) + 1896), 0);
      objc_msgSend(self->_contentView.m_ptr, "scrollViewWillStartPanOrPinchGesture");
    }
    objc_msgSend(self->_contentView.m_ptr, "willStartZoomOrScroll");
    objc_msgSend(self->_contentView.m_ptr, "cancelPointersForGestureRecognizer:", objc_msgSend(a3, "pinchGestureRecognizer"));
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(self->_customContentView.m_ptr, "web_scrollViewWillBeginZooming:withView:", a3, a4);
  }
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  WebKit::RemoteScrollingCoordinatorProxyIOS *v5;
  void *m_ptr;
  _BOOL4 shouldSetScrollViewDecelerationRateFast;
  double *v8;

  if (-[WKWebView usesStandardContentView](self, "usesStandardContentView"))
  {
    if (objc_msgSend((id)objc_msgSend(a3, "panGestureRecognizer"), "state") == 1)
      objc_msgSend(self->_contentView.m_ptr, "scrollViewWillStartPanOrPinchGesture");
    objc_msgSend(self->_contentView.m_ptr, "willStartZoomOrScroll");
    v5 = (WebKit::RemoteScrollingCoordinatorProxyIOS *)*((_QWORD *)self->_page.m_ptr + 25);
    if (v5)
    {
      m_ptr = self->_scrollView.m_ptr;
      shouldSetScrollViewDecelerationRateFast = WebKit::RemoteScrollingCoordinatorProxyIOS::shouldSetScrollViewDecelerationRateFast(v5);
      v8 = (double *)MEMORY[0x1E0CEBBA0];
      if (!shouldSetScrollViewDecelerationRateFast)
        v8 = (double *)MEMORY[0x1E0CEBBA8];
      objc_msgSend(m_ptr, "_setDecelerationRateInternal:", *v8);
      WebKit::RemoteScrollingCoordinatorProxyIOS::setRootNodeIsInUserScroll((uint64_t)v5, 1);
    }
  }
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double y;
  double x;
  CGFloat v10;
  CGFloat v11;
  id v12;
  char v13;
  CGFloat v14;
  WebKit::RemoteScrollingCoordinatorProxyIOS *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  id v24;
  double v25;
  double v26;
  double v27;
  double v28;
  CGFloat v29;
  CGFloat v30;
  CGSize v31;
  CGPoint v32;
  CGPoint v33;

  y = a4.y;
  x = a4.x;
  if (objc_msgSend(a3, "isZooming"))
  {
    objc_msgSend(a3, "contentOffset");
    a5->x = v11;
LABEL_12:
    a5->y = v10;
    goto LABEL_13;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v12 = a3;
  else
    v12 = 0;
  v13 = objc_msgSend(v12, "axesToPreventMomentumScrolling");
  if ((objc_msgSend(self->_contentView.m_ptr, "preventsPanningInXAxis") & 1) != 0 || (v13 & 1) != 0)
  {
    objc_msgSend(a3, "contentOffset");
    a5->x = v14;
  }
  if ((objc_msgSend(self->_contentView.m_ptr, "preventsPanningInYAxis") & 1) != 0 || (v13 & 2) != 0)
  {
    objc_msgSend(a3, "contentOffset");
    goto LABEL_12;
  }
LABEL_13:
  v15 = (WebKit::RemoteScrollingCoordinatorProxyIOS *)*((_QWORD *)self->_page.m_ptr + 25);
  if (v15)
  {
    objc_msgSend(a3, "contentSize");
    v17 = v16;
    objc_msgSend(a3, "bounds");
    v19 = v17 - v18;
    objc_msgSend(a3, "contentSize");
    v21 = v20;
    objc_msgSend(a3, "bounds");
    v23 = v21 - v22;
    v24 = -[WKWebView UIDelegate](self, "UIDelegate");
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v24, "_webView:finalObscuredInsetsForScrollView:withVelocity:targetContentOffset:", self, a3, a5, x, y);
    else
      -[WKWebView _computedObscuredInset](self, "_computedObscuredInset");
    v26 = v25;
    -[WKWebView bounds](self, "bounds");
    v28 = v26 + v27;
    objc_msgSend(a3, "contentOffset");
    v33.x = v29;
    v33.y = v30;
    v31.width = v19;
    v31.height = v23;
    v32.x = x;
    v32.y = y;
    WebKit::RemoteScrollingCoordinatorProxyIOS::adjustTargetContentOffsetForSnapping(v15, v31, v32, v28, v33, a5);
  }
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  if (!a4)
    -[WKWebView _didFinishScrolling:](self, "_didFinishScrolling:", a3);
}

- (void)scrollView:(id)a3 handleScrollUpdate:(id)a4 completion:(id)a5
{
  uint64_t v8;
  CGFloat v9;
  CGFloat v10;
  const WebCore::IntPoint *v11;
  float v12;
  uint64_t v13;
  uint64_t v14;
  float v15;
  uint64_t v16;
  unint64_t v17;
  char v18;
  char v19;
  double v20;
  double v21;
  float v22;
  float v23;
  BOOL v24;
  WebPageProxy *m_ptr;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  id v29;
  void *aBlock;
  __int16 v31;
  uint64_t v32;
  CGPoint v33;
  uint64_t v34;

  v8 = objc_msgSend(a3, "isScrollEnabled") ^ 1;
  if (!objc_msgSend(a4, "phase"))
  {
    if (self->_currentScrollGestureState.__engaged_)
      self->_currentScrollGestureState.__engaged_ = 0;
    self->_wheelEventCountInCurrentScrollGesture = 0;
  }
  objc_msgSend(a4, "locationInView:", self->_contentView.m_ptr);
  v33.x = v9;
  v33.y = v10;
  WebCore::FloatPoint::FloatPoint((WebCore::FloatPoint *)&v29, &v33);
  v12 = roundf(*(float *)&v29);
  v13 = 0x7FFFFFFFLL;
  v14 = 0x80000000;
  if (v12 > -2147500000.0)
    v14 = (int)v12;
  if (v12 < 2147500000.0)
    v13 = v14;
  v15 = roundf(*((float *)&v29 + 1));
  v16 = 0x7FFFFFFF00000000;
  v17 = 0x8000000000000000;
  if (v15 > -2147500000.0)
    v17 = (unint64_t)(int)v15 << 32;
  if (v15 < 2147500000.0)
    v16 = v17;
  v34 = v16 | v13;
  v18 = WebKit::eventListenerTypesAtPoint((WebKit *)self->_contentView.m_ptr, (UIView *)&v34, v11);
  if ((v18 & 1) == 0)
    goto LABEL_31;
  v19 = v18;
  objc_msgSend(a4, "translationInView:", self->_contentView.m_ptr);
  v22 = v21;
  if (v22 == 0.0)
    goto LABEL_22;
  if (v22 < 0.0)
    v22 = -v22;
  if (v22 < 0.00000011921)
  {
LABEL_22:
    v23 = v20;
    if (v23 == 0.0)
      goto LABEL_34;
    if (v23 < 0.0)
      v23 = -v23;
    if (v23 < 0.00000011921)
    {
LABEL_34:
      if (objc_msgSend(a4, "phase") != 2)
        goto LABEL_31;
    }
  }
  v24 = (v19 & 2) != 0
     && (!self->_currentScrollGestureState.__engaged_ || self->_currentScrollGestureState.var0.__null_state_ == 0);
  WebKit::WebIOSEventFactory::createWebWheelEvent(a4, (uint64_t)self->_contentView.m_ptr, (self->_wheelEventCountInCurrentScrollGesture == 0) | ((unint64_t)(self->_wheelEventCountInCurrentScrollGesture == 0) << 32), (uint64_t)&v33);
  ++self->_wheelEventCountInCurrentScrollGesture;
  m_ptr = self->_page.m_ptr;
  v29 = 0;
  objc_initWeak(&v29, self);
  aBlock = _Block_copy(a5);
  LOBYTE(v31) = v24;
  HIBYTE(v31) = v8;
  v26 = WTF::fastMalloc((WTF *)0x20);
  *(_QWORD *)v26 = off_1E34C5BA8;
  *(_QWORD *)(v26 + 8) = 0;
  objc_moveWeak((id *)(v26 + 8), &v29);
  v27 = aBlock;
  aBlock = 0;
  *(_QWORD *)(v26 + 16) = v27;
  *(_WORD *)(v26 + 24) = v31;
  v32 = v26;
  WebKit::WebPageProxy::dispatchWheelEventWithoutScrolling(m_ptr, (uint64_t)&v33, &v32);
  v28 = v32;
  v32 = 0;
  if (v28)
    (*(void (**)(uint64_t))(*(_QWORD *)v28 + 8))(v28);
  _Block_release(aBlock);
  objc_destroyWeak(&v29);
  if (!v24)
LABEL_31:
    (*((void (**)(id, uint64_t))a5 + 2))(a5, v8);
}

- (void)scrollViewDidEndZooming:(id)a3 withView:(id)a4 atScale:(double)a5
{
  void *m_ptr;

  if (!-[WKWebView usesStandardContentView](self, "usesStandardContentView")
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(self->_customContentView.m_ptr, "web_scrollViewDidEndZooming:withView:atScale:", a3, a4, a5);
  }
  m_ptr = self->_contentView.m_ptr;
  -[WKWebView bounds](self, "bounds");
  objc_msgSend(m_ptr, "setCenter:");
  -[WKWebView _scheduleVisibleContentRectUpdateAfterScrollInView:](self, "_scheduleVisibleContentRectUpdateAfterScrollInView:", a3);
  objc_msgSend(self->_contentView.m_ptr, "didZoomToScale:", a5);
}

- (void)_scrollViewDidInterruptDecelerating:(id)a3
{
  if (-[WKWebView usesStandardContentView](self, "usesStandardContentView"))
  {
    objc_msgSend(self->_contentView.m_ptr, "didInterruptScrolling");
    -[WKWebView _scheduleVisibleContentRectUpdateAfterScrollInView:](self, "_scheduleVisibleContentRectUpdateAfterScrollInView:", a3);
  }
}

- (void)_didScroll
{
  id v3;
  void *v4;
  void *m_ptr;
  void *v6;

  -[WKWebView _scheduleVisibleContentRectUpdateAfterScrollInView:](self, "_scheduleVisibleContentRectUpdateAfterScrollInView:", -[WKWebView _scroller](self, "_scroller"));
  if (!self->_enclosingScrollViewScrollTimer.m_ptr)
  {
    v3 = objc_alloc(MEMORY[0x1E0C99E88]);
    v4 = (void *)objc_msgSend(v3, "initWithFireDate:interval:target:selector:userInfo:repeats:", objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 0.032), self, sel__enclosingScrollerScrollingEnded_, 0, 1, 0.0);
    m_ptr = self->_enclosingScrollViewScrollTimer.m_ptr;
    self->_enclosingScrollViewScrollTimer.m_ptr = v4;
    if (m_ptr)
      CFRelease(m_ptr);
    v6 = (void *)objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
    objc_msgSend(v6, "addTimer:forMode:", self->_enclosingScrollViewScrollTimer.m_ptr, *MEMORY[0x1E0C99748]);
  }
  self->_didScrollSinceLastTimerFire = 1;
}

- (void)_enclosingScrollerScrollingEnded:(id)a3
{
  void *m_ptr;

  if (self->_didScrollSinceLastTimerFire)
  {
    self->_didScrollSinceLastTimerFire = 0;
  }
  else
  {
    -[WKWebView _scheduleVisibleContentRectUpdate](self, "_scheduleVisibleContentRectUpdate", a3);
    objc_msgSend(self->_enclosingScrollViewScrollTimer.m_ptr, "invalidate");
    m_ptr = self->_enclosingScrollViewScrollTimer.m_ptr;
    self->_enclosingScrollViewScrollTimer.m_ptr = 0;
    if (m_ptr)
      CFRelease(m_ptr);
  }
}

- (void)_beginAutomaticLiveResizeIfNeeded
{
  const WTF::StringImpl *v2;
  WebPageProxy *m_ptr;
  uint64_t v5;
  CGRect v6;

  m_ptr = self->_page.m_ptr;
  if (m_ptr)
  {
    v5 = *((_QWORD *)m_ptr + 28);
    {
      WebKit::WebPreferencesKey::automaticLiveResizeEnabledKey(void)::$_0::operator() const(void)::impl += 2;
      WebKit::WebPreferencesKey::automaticLiveResizeEnabledKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::automaticLiveResizeEnabledKey(void)::$_0::operator() const(void)::impl;
    }
    if (WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)(v5 + 40), (WTF::StringImpl **)&WebKit::WebPreferencesKey::automaticLiveResizeEnabledKey(void)::key, v2))
    {
      if (-[WKWebView usesStandardContentView](self, "usesStandardContentView"))
      {
        if (-[WKWebView window](self, "window"))
        {
          -[WKWebView bounds](self, "bounds");
          if (!CGRectIsEmpty(v6) && !self->_perProcessState.dynamicViewportUpdateMode)
          {
            -[WKWebView _rescheduleEndLiveResizeTimer](self, "_rescheduleEndLiveResizeTimer");
            if (!self->_perProcessState.liveResizeParameters.__engaged_)
              -[WKWebView _beginLiveResize](self, "_beginLiveResize");
          }
        }
      }
    }
  }
}

- (void)_rescheduleEndLiveResizeTimer
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *m_ptr;
  id v8;
  id to;

  objc_msgSend(self->_endLiveResizeTimer.m_ptr, "invalidate");
  v3 = (void *)MEMORY[0x1E0C99E88];
  v8 = 0;
  objc_initWeak(&v8, self);
  to = 0;
  objc_moveWeak(&to, &v8);
  v4 = malloc_type_malloc(0x28uLL, 0x10E004086F20DB1uLL);
  *(_QWORD *)v4 = MEMORY[0x1E0C809A0];
  *((_QWORD *)v4 + 1) = 50331650;
  *((_QWORD *)v4 + 2) = WTF::BlockPtr<void ()(NSTimer *)>::fromCallable<-[WKWebView(WKViewInternalIOS) _rescheduleEndLiveResizeTimer]::$_0>(-[WKWebView(WKViewInternalIOS) _rescheduleEndLiveResizeTimer]::$_0)::{lambda(void *,NSTimer *)#1}::__invoke;
  *((_QWORD *)v4 + 3) = &WTF::BlockPtr<void ()(NSTimer *)>::fromCallable<-[WKWebView(WKViewInternalIOS) _rescheduleEndLiveResizeTimer]::$_0>(-[WKWebView(WKViewInternalIOS) _rescheduleEndLiveResizeTimer]::$_0)::descriptor;
  *((_QWORD *)v4 + 4) = 0;
  objc_moveWeak((id *)v4 + 4, &to);
  objc_destroyWeak(&to);
  v5 = (void *)objc_msgSend(v3, "scheduledTimerWithTimeInterval:repeats:block:", 0, v4, 0.5);
  v6 = v5;
  if (v5)
    CFRetain(v5);
  m_ptr = self->_endLiveResizeTimer.m_ptr;
  self->_endLiveResizeTimer.m_ptr = v6;
  if (m_ptr)
    CFRelease(m_ptr);
  _Block_release(v4);
  objc_destroyWeak(&v8);
}

- (void)_updateLiveResizeTransform
{
  double v3;
  double viewWidth;
  CGFloat v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *m_ptr;
  CGAffineTransform v13;
  CGAffineTransform v14;

  -[WKWebView bounds](self, "bounds");
  if (self->_perProcessState.liveResizeParameters.__engaged_)
  {
    viewWidth = self->_perProcessState.liveResizeParameters.var0.__val_.viewWidth;
    memset(&v14, 0, sizeof(v14));
    v5 = v3 / viewWidth;
    CGAffineTransformMakeScale(&v14, v5, v5);
    -[WKWebView _contentOffsetAdjustedForObscuredInset:](self, "_contentOffsetAdjustedForObscuredInset:", v5 * self->_perProcessState.liveResizeParameters.var0.__val_.initialScrollPosition.x, v5 * self->_perProcessState.liveResizeParameters.var0.__val_.initialScrollPosition.y);
    v7 = v6;
    v9 = v8;
    objc_msgSend(self->_scrollView.m_ptr, "contentOffset");
    v14.tx = v10 - v7;
    v14.ty = v11 - v9;
    m_ptr = self->_resizeAnimationView.m_ptr;
    v13 = v14;
    objc_msgSend(m_ptr, "setTransform:", &v13);
  }
  else
  {
    __break(1u);
  }
}

- (CGRect)_contentRectForUserInteraction
{
  double left;
  double top;
  double right;
  double bottom;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  top = self->_obscuredInsets.top;
  left = self->_obscuredInsets.left;
  right = self->_obscuredInsets.right;
  if (self->_obscuredInsets.bottom >= self->_inputViewBoundsInWindow.size.height)
    bottom = self->_obscuredInsets.bottom;
  else
    bottom = self->_inputViewBoundsInWindow.size.height;
  -[WKWebView bounds](self, "bounds");
  -[WKWebView convertRect:toView:](self, "convertRect:toView:", -[WKWebView _currentContentView](self, "_currentContentView"), left + v7, top + v8, v9 - (left + right), v10 - (top + bottom));
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (void)_scheduleForcedVisibleContentRectUpdate
{
  self->_alwaysSendNextVisibleContentRectUpdate = 1;
  -[WKWebView _scheduleVisibleContentRectUpdate](self, "_scheduleVisibleContentRectUpdate");
}

- (void)_ensureResizeAnimationView
{
  uint64_t v3;
  id v4;
  void *m_ptr;

  if (!self->_resizeAnimationView.m_ptr)
  {
    v3 = objc_msgSend((id)objc_msgSend(self->_scrollView.m_ptr, "subviews"), "indexOfObject:", self->_contentView.m_ptr);
    v4 = objc_alloc_init(MEMORY[0x1E0CEABB0]);
    m_ptr = self->_resizeAnimationView.m_ptr;
    self->_resizeAnimationView.m_ptr = v4;
    if (m_ptr)
    {
      CFRelease(m_ptr);
      v4 = self->_resizeAnimationView.m_ptr;
    }
    objc_msgSend((id)objc_msgSend(v4, "layer"), "setName:", CFSTR("ResizeAnimation"));
    objc_msgSend(self->_scrollView.m_ptr, "insertSubview:atIndex:", self->_resizeAnimationView.m_ptr, v3);
    objc_msgSend(self->_resizeAnimationView.m_ptr, "addSubview:", self->_contentView.m_ptr);
    objc_msgSend(self->_resizeAnimationView.m_ptr, "addSubview:", objc_msgSend(self->_contentView.m_ptr, "unscaledView"));
  }
}

- (void)_destroyResizeAnimationView
{
  uint64_t v3;
  void *m_ptr;

  if (self->_resizeAnimationView.m_ptr)
  {
    v3 = objc_msgSend((id)objc_msgSend(self->_scrollView.m_ptr, "subviews"), "indexOfObject:", self->_resizeAnimationView.m_ptr);
    objc_msgSend(self->_scrollView.m_ptr, "insertSubview:atIndex:", self->_contentView.m_ptr, v3);
    objc_msgSend(self->_scrollView.m_ptr, "insertSubview:atIndex:", objc_msgSend(self->_contentView.m_ptr, "unscaledView"), v3 + 1);
    objc_msgSend(self->_resizeAnimationView.m_ptr, "removeFromSuperview");
    m_ptr = self->_resizeAnimationView.m_ptr;
    self->_resizeAnimationView.m_ptr = 0;
    if (m_ptr)
      CFRelease(m_ptr);
  }
}

- (void)_cancelAnimatedResize
{
  NSObject *v3;
  uint64_t v4;
  int dynamicViewportUpdateMode;
  _OWORD *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  int v13;
  WKWebView *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = qword_1ECE71A28;
  if (os_log_type_enabled((os_log_t)qword_1ECE71A28, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(*((_QWORD *)self->_page.m_ptr + 4) + 744);
    dynamicViewportUpdateMode = self->_perProcessState.dynamicViewportUpdateMode;
    v13 = 134218496;
    v14 = self;
    v15 = 2048;
    v16 = v4;
    v17 = 1024;
    v18 = dynamicViewportUpdateMode;
    _os_log_impl(&dword_196BCC000, v3, OS_LOG_TYPE_DEFAULT, "%p (pageProxyID=%llu) -[WKWebView _cancelAnimatedResize] dynamicViewportUpdateMode %d", (uint8_t *)&v13, 0x1Cu);
  }
  if (self->_perProcessState.dynamicViewportUpdateMode)
  {
    if (!self->_customContentView.m_ptr)
    {
      -[WKWebView _destroyResizeAnimationView](self, "_destroyResizeAnimationView");
      objc_msgSend(self->_contentView.m_ptr, "setHidden:", 0);
      v6 = (_OWORD *)MEMORY[0x1E0CD2610];
      v7 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 48);
      v9 = *MEMORY[0x1E0CD2610];
      v8 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 16);
      *(_OWORD *)&self->_resizeAnimationTransformAdjustments.m21 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 32);
      *(_OWORD *)&self->_resizeAnimationTransformAdjustments.m23 = v7;
      *(_OWORD *)&self->_resizeAnimationTransformAdjustments.m11 = v9;
      *(_OWORD *)&self->_resizeAnimationTransformAdjustments.m13 = v8;
      v10 = v6[7];
      v12 = v6[4];
      v11 = v6[5];
      *(_OWORD *)&self->_resizeAnimationTransformAdjustments.m41 = v6[6];
      *(_OWORD *)&self->_resizeAnimationTransformAdjustments.m43 = v10;
      *(_OWORD *)&self->_resizeAnimationTransformAdjustments.m31 = v12;
      *(_OWORD *)&self->_resizeAnimationTransformAdjustments.m33 = v11;
    }
    self->_perProcessState.dynamicViewportUpdateMode = 0;
    self->_perProcessState.animatedResizeOldBounds.origin = 0u;
    self->_perProcessState.animatedResizeOldBounds.size = 0u;
    -[WKWebView _scheduleVisibleContentRectUpdate](self, "_scheduleVisibleContentRectUpdate");
  }
}

- (void)_didCompleteAnimatedResize
{
  PerWebProcessState *p_perProcessState;
  void *m_ptr;
  NSObject *v5;
  _BOOL4 v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  double m11;
  __int128 *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  void *v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  WebPageProxy *v27;
  double v28;
  double v29;
  uint64_t v30;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _OWORD v38[8];
  double v39;
  _OWORD v40[8];
  uint8_t buf[32];
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  p_perProcessState = &self->_perProcessState;
  if (self->_perProcessState.dynamicViewportUpdateMode)
  {
    objc_msgSend(self->_contentView.m_ptr, "setHidden:", 0);
    m_ptr = self->_resizeAnimationView.m_ptr;
    v5 = qword_1ECE71A28;
    v6 = os_log_type_enabled((os_log_t)qword_1ECE71A28, OS_LOG_TYPE_DEFAULT);
    if (m_ptr)
    {
      if (v6)
      {
        v7 = *(_QWORD *)(*((_QWORD *)self->_page.m_ptr + 4) + 744);
        *(_DWORD *)buf = 134218240;
        *(_QWORD *)&buf[4] = self;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = v7;
        _os_log_impl(&dword_196BCC000, v5, OS_LOG_TYPE_DEFAULT, "%p (pageProxyID=%llu) -[WKWebView _didCompleteAnimatedResize]", buf, 0x16u);
      }
      v8 = objc_msgSend((id)objc_msgSend(self->_scrollView.m_ptr, "subviews"), "indexOfObject:", self->_resizeAnimationView.m_ptr);
      objc_msgSend(self->_scrollView.m_ptr, "insertSubview:atIndex:", self->_contentView.m_ptr, v8);
      objc_msgSend(self->_scrollView.m_ptr, "insertSubview:atIndex:", objc_msgSend(self->_contentView.m_ptr, "unscaledView"), v8 + 1);
      v9 = (void *)objc_msgSend(self->_contentView.m_ptr, "layer");
      m11 = self->_resizeAnimationTransformAdjustments.m11;
      v11 = (__int128 *)MEMORY[0x1E0CD2610];
      v12 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 80);
      v40[4] = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
      v40[5] = v12;
      v13 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 112);
      v40[6] = *(_OWORD *)(MEMORY[0x1E0CD2610] + 96);
      v40[7] = v13;
      v14 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 16);
      v40[0] = *MEMORY[0x1E0CD2610];
      v40[1] = v14;
      v15 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 48);
      v40[2] = *(_OWORD *)(MEMORY[0x1E0CD2610] + 32);
      v40[3] = v15;
      objc_msgSend(v9, "setSublayerTransform:", v40);
      v16 = (void *)objc_msgSend(self->_resizeAnimationView.m_ptr, "layer");
      if (v16)
      {
        objc_msgSend(v16, "transform");
        v17 = *(double *)buf;
      }
      else
      {
        v17 = 0.0;
      }
      v46 = 0u;
      v47 = 0u;
      v44 = 0u;
      v45 = 0u;
      v42 = 0u;
      v43 = 0u;
      memset(buf, 0, sizeof(buf));
      if (v9)
        objc_msgSend(v9, "transform");
      v18 = (void *)objc_msgSend(self->_resizeAnimationView.m_ptr, "layer");
      if (v18)
      {
        objc_msgSend(v18, "transform");
        v19 = v39;
      }
      else
      {
        v19 = 0.0;
      }
      *(double *)buf = m11 * (v19 * *(double *)buf);
      *((_QWORD *)&v42 + 1) = *(_QWORD *)buf;
      v38[4] = v44;
      v38[5] = v45;
      v38[6] = v46;
      v38[7] = v47;
      v38[0] = *(_OWORD *)buf;
      v38[1] = *(_OWORD *)&buf[16];
      v38[2] = v42;
      v38[3] = v43;
      objc_msgSend(v9, "setTransform:", v38);
      objc_msgSend(self->_scrollView.m_ptr, "contentOffset");
      v21 = v20;
      v23 = v22;
      v24 = v17 * self->_resizeAnimationTransformAdjustments.m41;
      v25 = self->_scrollView.m_ptr;
      v26 = v17 * self->_resizeAnimationTransformAdjustments.m42;
      v27 = self->_page.m_ptr;
      objc_msgSend(self->_contentView.m_ptr, "frame");
      v30 = 692;
      if (!*((_BYTE *)v27 + 696))
        v30 = 688;
      objc_msgSend(v25, "setContentSize:", floor(v28 * *(float *)((char *)v27 + v30)) / *(float *)((char *)v27 + v30), floor(v29 * *(float *)((char *)v27 + v30)) / *(float *)((char *)v27 + v30));
      objc_msgSend(self->_scrollView.m_ptr, "setContentOffset:", v21 - v24, v23 - v26);
      objc_msgSend(self->_resizeAnimationView.m_ptr, "removeFromSuperview");
      v31 = self->_resizeAnimationView.m_ptr;
      self->_resizeAnimationView.m_ptr = 0;
      if (v31)
        CFRelease(v31);
      v32 = *v11;
      v33 = v11[1];
      v34 = v11[3];
      *(_OWORD *)&self->_resizeAnimationTransformAdjustments.m21 = v11[2];
      *(_OWORD *)&self->_resizeAnimationTransformAdjustments.m23 = v34;
      *(_OWORD *)&self->_resizeAnimationTransformAdjustments.m11 = v32;
      *(_OWORD *)&self->_resizeAnimationTransformAdjustments.m13 = v33;
      v35 = v11[4];
      v36 = v11[5];
      v37 = v11[7];
      *(_OWORD *)&self->_resizeAnimationTransformAdjustments.m41 = v11[6];
      *(_OWORD *)&self->_resizeAnimationTransformAdjustments.m43 = v37;
      *(_OWORD *)&self->_resizeAnimationTransformAdjustments.m31 = v35;
      *(_OWORD *)&self->_resizeAnimationTransformAdjustments.m33 = v36;
      p_perProcessState->dynamicViewportUpdateMode = 0;
      p_perProcessState->animatedResizeOldBounds.origin = 0u;
      p_perProcessState->animatedResizeOldBounds.size = 0u;
      -[WKWebView _didStopDeferringGeometryUpdates](self, "_didStopDeferringGeometryUpdates");
    }
    else
    {
      if (v6)
      {
        *(_DWORD *)buf = 134217984;
        *(_QWORD *)&buf[4] = self;
        _os_log_impl(&dword_196BCC000, v5, OS_LOG_TYPE_DEFAULT, "%p -[WKWebView _didCompleteAnimatedResize:] - _resizeAnimationView is nil", buf, 0xCu);
      }
      -[WKWebView _cancelAnimatedResize](self, "_cancelAnimatedResize");
    }
  }
}

- (void)_didStopDeferringGeometryUpdates
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  float v7;
  float v8;
  float v9;
  float v10;
  CGSize *p_minimumUnobscuredSize;
  uint64_t v12;
  CGSize *p_maximumUnobscuredSize;
  unint64_t v14;
  unsigned int *v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  double val;
  WebPageProxy *m_ptr;
  WebPageProxy *v22;
  WebPageProxy *v23;
  Vector<WTF::Function<void ()>, 0UL, WTF::CrashOnOverflow, 16UL, WTF::FastMalloc> *p_callbacksDeferredDuringResize;
  uint64_t m_size;
  unsigned int v26;
  uint64_t v27;
  uint64_t v28;
  _Unwind_Exception *v29;
  _QWORD v30[2];
  _QWORD v31[2];
  uint64_t v32;

  -[WKWebView _scheduleVisibleContentRectUpdate](self, "_scheduleVisibleContentRectUpdate");
  -[WKWebView bounds](self, "bounds");
  v30[0] = v3;
  v30[1] = v4;
  v31[0] = v5;
  v31[1] = v6;
  -[WKWebView activeViewLayoutSize:](self, "activeViewLayoutSize:", v30);
  v8 = v7;
  v10 = v9;
  if (self->_overriddenLayoutParameters.__engaged_)
    p_minimumUnobscuredSize = &self->_overriddenLayoutParameters.var0.__val_.minimumUnobscuredSize;
  else
    p_minimumUnobscuredSize = (CGSize *)v31;
  WebCore::FloatSize::FloatSize((WebCore::FloatSize *)&v32, p_minimumUnobscuredSize);
  v12 = v32;
  if (self->_overriddenLayoutParameters.__engaged_)
    p_maximumUnobscuredSize = &self->_overriddenLayoutParameters.var0.__val_.maximumUnobscuredSize;
  else
    p_maximumUnobscuredSize = (CGSize *)v31;
  WebCore::FloatSize::FloatSize((WebCore::FloatSize *)&v32, p_maximumUnobscuredSize);
  if (!self->_overridesInterfaceOrientation)
  {
    v15 = (unsigned int *)((char *)self->_page.m_ptr + 396);
    goto LABEL_11;
  }
  v14 = self->_interfaceOrientationOverride - 2;
  if (v14 < 3)
  {
    v15 = &dword_1978CFAE8[v14];
LABEL_11:
    v16 = *v15;
    goto LABEL_13;
  }
  v16 = 0;
LABEL_13:
  v17 = v32;
  -[WKWebView _minimumEffectiveDeviceWidth](self, "_minimumEffectiveDeviceWidth");
  if (!self->_perProcessState.lastSentViewLayoutSize.__engaged_)
    goto LABEL_21;
  if (v8 != self->_perProcessState.lastSentViewLayoutSize.var0.__val_.m_width
    || v10 != self->_perProcessState.lastSentViewLayoutSize.var0.__val_.m_height)
  {
    goto LABEL_21;
  }
  if (!self->_perProcessState.lastSentMinimumEffectiveDeviceWidth.__engaged_)
  {
    v29 = (_Unwind_Exception *)std::__throw_bad_optional_access[abi:sn180100]();
    (*((void (**)(WKWebView *))self->super.super.super.isa + 1))(self);
    _Unwind_Resume(v29);
  }
  val = self->_perProcessState.lastSentMinimumEffectiveDeviceWidth.var0.__val_;
  if (v18 != val)
  {
LABEL_21:
    *(float *)&v18 = v8;
    *(float *)&val = v10;
    -[WKWebView _dispatchSetViewLayoutSize:](self, "_dispatchSetViewLayoutSize:", v18, val);
  }
  if (self->_overriddenLayoutParameters.__engaged_)
  {
    m_ptr = self->_page.m_ptr;
    v32 = v12;
    WebKit::WebPageProxy::setMinimumUnobscuredSize((uint64_t)m_ptr, (const WebCore::FloatSize *)&v32);
    v22 = self->_page.m_ptr;
    v32 = v17;
    WebKit::WebPageProxy::setDefaultUnobscuredSize((uint64_t)v22, (const WebCore::FloatSize *)&v32);
    v23 = self->_page.m_ptr;
    v32 = v17;
    WebKit::WebPageProxy::setMaximumUnobscuredSize((uint64_t)v23, (const WebCore::FloatSize *)&v32);
  }
  -[WKWebView _recalculateViewportSizesWithMinimumViewportInset:maximumViewportInset:throwOnInvalidInput:](self, "_recalculateViewportSizesWithMinimumViewportInset:maximumViewportInset:throwOnInvalidInput:", 0, self->_minimumViewportInset.top, self->_minimumViewportInset.left, self->_minimumViewportInset.bottom, self->_minimumViewportInset.right, self->_maximumViewportInset.top, self->_maximumViewportInset.left, self->_maximumViewportInset.bottom, self->_maximumViewportInset.right);
  if (!self->_perProcessState.lastSentDeviceOrientation.__engaged_
    || (_DWORD)v16 != self->_perProcessState.lastSentDeviceOrientation.var0.__val_)
  {
    -[WKWebView _dispatchSetDeviceOrientation:](self, "_dispatchSetDeviceOrientation:", v16);
  }
  -[WKWebView _updateDrawingAreaSize](self, "_updateDrawingAreaSize");
  p_callbacksDeferredDuringResize = &self->_callbacksDeferredDuringResize;
  while (1)
  {
    m_size = p_callbacksDeferredDuringResize->m_size;
    if (!(_DWORD)m_size)
      break;
    v26 = m_size - 1;
    v27 = *((_QWORD *)p_callbacksDeferredDuringResize->m_buffer + m_size - 1);
    *((_QWORD *)p_callbacksDeferredDuringResize->m_buffer + m_size - 1) = 0;
    v28 = *((_QWORD *)p_callbacksDeferredDuringResize->m_buffer + m_size - 1);
    *((_QWORD *)p_callbacksDeferredDuringResize->m_buffer + m_size - 1) = 0;
    if (v28)
      (*(void (**)(uint64_t))(*(_QWORD *)v28 + 8))(v28);
    p_callbacksDeferredDuringResize->m_size = v26;
    (*(void (**)(uint64_t))(*(_QWORD *)v27 + 16))(v27);
    (*(void (**)(uint64_t))(*(_QWORD *)v27 + 8))(v27);
  }
}

- (void)_didFinishNavigation:(Navigation *)a3
{
  ViewGestureController *value;

  value = self->_gestureController.__ptr_.__value_;
  if (value)
    WebKit::ViewGestureController::didReachNavigationTerminalState((uint64_t)value, (API::Navigation *)a3);
}

- (void)_didFailNavigation:(Navigation *)a3
{
  ViewGestureController *value;

  value = self->_gestureController.__ptr_.__value_;
  if (value)
    WebKit::ViewGestureController::didReachNavigationTerminalState((uint64_t)value, (API::Navigation *)a3);
}

- (void)_didSameDocumentNavigationForMainFrame:(unsigned __int8)a3
{
  void *m_ptr;
  uint64_t v6;
  ViewGestureController *value;

  m_ptr = self->_customContentView.m_ptr;
  if ((a3 - 1) < 3)
    v6 = (a3 - 1) + 1;
  else
    v6 = 0;
  objc_msgSend(m_ptr, "web_didSameDocumentNavigation:", v6);
  value = self->_gestureController.__ptr_.__value_;
  if (value)
    WebKit::ViewGestureController::didSameDocumentNavigationForMainFrame((uint64_t)value, a3);
}

- (void)_keyboardChangedWithInfo:(id)a3 adjustScrollView:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v7;
  void *v8;
  CGRect *p_inputViewBoundsInWindow;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  _BOOL4 v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  double v31;
  double v32;
  BOOL currentlyAdjustingScrollViewInsetsForKeyboard;
  double v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;

  v4 = a4;
  v7 = objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E0CEB890]);
  if (v7)
  {
    v8 = (void *)v7;
    p_inputViewBoundsInWindow = &self->_inputViewBoundsInWindow;
    x = self->_inputViewBoundsInWindow.origin.x;
    y = self->_inputViewBoundsInWindow.origin.y;
    width = self->_inputViewBoundsInWindow.size.width;
    height = self->_inputViewBoundsInWindow.size.height;
    v14 = -[WKWebView _selectionRectIsFullyVisibleAndNonEmpty](self, "_selectionRectIsFullyVisibleAndNonEmpty");
    if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CEA828], "sharedInstance"), "isUndocked"))
    {
      v15 = *MEMORY[0x1E0C9D648];
      v16 = *(double *)(MEMORY[0x1E0C9D648] + 8);
      v17 = *(double *)(MEMORY[0x1E0C9D648] + 16);
      v18 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    }
    else
    {
      objc_msgSend(v8, "CGRectValue");
      v20 = v19;
      v22 = v21;
      v24 = v23;
      v26 = v25;
      if ((objc_msgSend((id)-[WKWebView window](self, "window"), "_isHostedInAnotherProcess") & 1) == 0)
      {
        objc_msgSend((id)objc_msgSend((id)-[WKWebView window](self, "window"), "screen"), "bounds");
        v40.origin.x = v27;
        v40.origin.y = v28;
        v40.size.width = v29;
        v40.size.height = v30;
        v35.origin.x = v20;
        v35.origin.y = v22;
        v35.size.width = v24;
        v35.size.height = v26;
        v36 = CGRectIntersection(v35, v40);
        v20 = v36.origin.x;
        v22 = v36.origin.y;
        v24 = v36.size.width;
        v26 = v36.size.height;
      }
      objc_msgSend((id)-[WKWebView window](self, "window"), "convertRect:fromCoordinateSpace:", objc_msgSend((id)objc_msgSend((id)-[WKWebView window](self, "window"), "screen"), "coordinateSpace"), v20, v22, v24, v26);
    }
    p_inputViewBoundsInWindow->origin.x = v15;
    self->_inputViewBoundsInWindow.origin.y = v16;
    self->_inputViewBoundsInWindow.size.width = v17;
    self->_inputViewBoundsInWindow.size.height = v18;
    if (v4)
    {
      objc_msgSend(self->_scrollView.m_ptr, "contentInset");
      v32 = v31;
      currentlyAdjustingScrollViewInsetsForKeyboard = self->_perProcessState.currentlyAdjustingScrollViewInsetsForKeyboard;
      self->_perProcessState.currentlyAdjustingScrollViewInsetsForKeyboard = 1;
      objc_msgSend(self->_scrollView.m_ptr, "_adjustForAutomaticKeyboardInfo:animated:lastAdjustment:", a3, 1, &self->_lastAdjustmentForScroller);
      objc_msgSend(self->_scrollView.m_ptr, "contentInset");
      if (v32 != v34)
        self->_totalScrollViewBottomInsetAdjustmentForKeyboard = v34
                                                               - v32
                                                               + self->_totalScrollViewBottomInsetAdjustmentForKeyboard;
      self->_perProcessState.currentlyAdjustingScrollViewInsetsForKeyboard = currentlyAdjustingScrollViewInsetsForKeyboard;
    }
    if (v14)
    {
      if (objc_msgSend(self->_contentView.m_ptr, "_hasFocusedElement"))
      {
        v37.origin.x = x;
        v37.origin.y = y;
        v37.size.width = width;
        v37.size.height = height;
        if (!CGRectIsEmpty(v37))
        {
          v38.origin.x = p_inputViewBoundsInWindow->origin.x;
          v38.origin.y = self->_inputViewBoundsInWindow.origin.y;
          v38.size.width = self->_inputViewBoundsInWindow.size.width;
          v38.size.height = self->_inputViewBoundsInWindow.size.height;
          if (!CGRectIsEmpty(v38))
          {
            v41.origin.x = p_inputViewBoundsInWindow->origin.x;
            v41.origin.y = self->_inputViewBoundsInWindow.origin.y;
            v41.size.width = self->_inputViewBoundsInWindow.size.width;
            v41.size.height = self->_inputViewBoundsInWindow.size.height;
            v39.origin.x = x;
            v39.origin.y = y;
            v39.size.width = width;
            v39.size.height = height;
            if (!CGRectEqualToRect(v39, v41))
              -[WKWebView _scrollToAndRevealSelectionIfNeeded](self, "_scrollToAndRevealSelectionIfNeeded");
          }
        }
      }
    }
    -[WKWebView _scheduleVisibleContentRectUpdate](self, "_scheduleVisibleContentRectUpdate");
  }
}

- (BOOL)_shouldUpdateKeyboardWithInfo:(id)a3
{
  void *v5;

  if ((objc_msgSend(self->_contentView.m_ptr, "isFocusingElement") & 1) != 0
    || (objc_msgSend(self->_findInteraction.m_ptr, "isFindNavigatorVisible") & 1) != 0)
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    v5 = (void *)objc_msgSend(a3, "valueForKey:", *MEMORY[0x1E0CEB8B8]);
    if (v5)
      LOBYTE(v5) = objc_msgSend(v5, "BOOLValue") ^ 1;
  }
  return (char)v5;
}

- (void)_keyboardWillChangeFrame:(id)a3
{
  if (-[WKWebView _shouldUpdateKeyboardWithInfo:](self, "_shouldUpdateKeyboardWithInfo:", objc_msgSend(a3, "userInfo")))
    -[WKWebView _keyboardChangedWithInfo:adjustScrollView:](self, "_keyboardChangedWithInfo:adjustScrollView:", objc_msgSend(a3, "userInfo"), 1);
}

- (void)_keyboardDidChangeFrame:(id)a3
{
  -[WKWebView _keyboardChangedWithInfo:adjustScrollView:](self, "_keyboardChangedWithInfo:adjustScrollView:", objc_msgSend(a3, "userInfo"), 0);
}

- (void)_keyboardWillShow:(id)a3
{
  if (-[WKWebView _shouldUpdateKeyboardWithInfo:](self, "_shouldUpdateKeyboardWithInfo:", objc_msgSend(a3, "userInfo")))
    -[WKWebView _keyboardChangedWithInfo:adjustScrollView:](self, "_keyboardChangedWithInfo:adjustScrollView:", objc_msgSend(a3, "userInfo"), 1);
  *((_BYTE *)self->_page.m_ptr + 401) = 1;
  objc_msgSend(self->_contentView.m_ptr, "_keyboardWillShow");
}

- (void)_keyboardDidShow:(id)a3
{
  *((_BYTE *)self->_page.m_ptr + 401) = 0;
  objc_msgSend(self->_contentView.m_ptr, "_keyboardDidShow", a3);
}

- (void)_keyboardWillHide:(id)a3
{
  if ((objc_msgSend(self->_contentView.m_ptr, "shouldIgnoreKeyboardWillHideNotification") & 1) == 0)
    -[WKWebView _keyboardChangedWithInfo:adjustScrollView:](self, "_keyboardChangedWithInfo:adjustScrollView:", objc_msgSend(a3, "userInfo"), 1);
}

- (void)_windowDidRotate:(id)a3
{
  if (!self->_overridesInterfaceOrientation)
    -[WKWebView _dispatchSetDeviceOrientation:](self, "_dispatchSetDeviceOrientation:", -[WKWebView _deviceOrientationIgnoringOverrides](self, "_deviceOrientationIgnoringOverrides", a3));
  -[WKWebView _dispatchSetOrientationForMediaCapture:](self, "_dispatchSetOrientationForMediaCapture:", -[WKWebView _deviceOrientationIgnoringOverrides](self, "_deviceOrientationIgnoringOverrides", a3));
}

- (void)_contentSizeCategoryDidChange:(id)a3
{
  WebPageProxy *m_ptr;
  uint64_t v4;
  WTF::StringImpl *v5;
  WTF::StringImpl *v6;
  WTF::StringImpl *v7;
  WTF::StringImpl **v8;

  m_ptr = self->_page.m_ptr;
  MEMORY[0x19AEABCC8](&v7, -[WKWebView _contentSizeCategory](self, "_contentSizeCategory", a3));
  v4 = *((_QWORD *)m_ptr + 26);
  v8 = &v7;
  WebKit::AuxiliaryProcessProxy::send<Messages::WebPage::ContentSizeCategoryDidChange>(v4, (uint64_t **)&v8, *(_QWORD *)(*((_QWORD *)m_ptr + 4) + 1896), 0);
  v6 = v7;
  v7 = 0;
  if (v6)
  {
    if (*(_DWORD *)v6 == 2)
      WTF::StringImpl::destroy(v6, v5);
    else
      *(_DWORD *)v6 -= 2;
  }
}

- (void)_accessibilitySettingsDidChange:(id)a3
{
  WebKit::WebPageProxy::accessibilitySettingsDidChange((uint64_t)self->_page.m_ptr);
}

- (BOOL)_isNavigationSwipeGestureRecognizer:(id)a3
{
  ViewGestureController *value;

  value = self->_gestureController.__ptr_.__value_;
  if (value)
    return objc_msgSend(*((id *)value + 17), "isNavigationSwipeGestureRecognizer:", a3);
  else
    return 0;
}

- (void)_navigationGestureDidBegin
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  _BOOL4 engaged;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  _BOOL4 v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;

  -[WKWebView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[WKWebView _computedObscuredInset](self, "_computedObscuredInset");
  v12 = v4 + v11;
  v14 = v6 + v13;
  v16 = v8 - (v11 + v15);
  v18 = v10 - (v13 + v17);
  -[WKWebView convertRect:toView:](self, "convertRect:toView:", self->_contentView.m_ptr, v4, v6, v8, v10);
  engaged = self->_perProcessState.frozenVisibleContentRect.__engaged_;
  self->_perProcessState.frozenVisibleContentRect.var0.__val_.origin.x = v20;
  self->_perProcessState.frozenVisibleContentRect.var0.__val_.origin.y = v21;
  self->_perProcessState.frozenVisibleContentRect.var0.__val_.size.width = v22;
  self->_perProcessState.frozenVisibleContentRect.var0.__val_.size.height = v23;
  if (!engaged)
    self->_perProcessState.frozenVisibleContentRect.__engaged_ = 1;
  -[WKWebView convertRect:toView:](self, "convertRect:toView:", self->_contentView.m_ptr, v12, v14, v16, v18);
  v24 = self->_perProcessState.frozenUnobscuredContentRect.__engaged_;
  self->_perProcessState.frozenUnobscuredContentRect.var0.__val_.origin.x = v25;
  self->_perProcessState.frozenUnobscuredContentRect.var0.__val_.origin.y = v26;
  self->_perProcessState.frozenUnobscuredContentRect.var0.__val_.size.width = v27;
  self->_perProcessState.frozenUnobscuredContentRect.var0.__val_.size.height = v28;
  if (!v24)
    self->_perProcessState.frozenUnobscuredContentRect.__engaged_ = 1;
  self->_contentViewShouldBecomeFirstResponderAfterNavigationGesture = objc_msgSend(self->_contentView.m_ptr, "isFirstResponder");
}

- (void)_navigationGestureDidEnd
{
  if (self->_perProcessState.frozenVisibleContentRect.__engaged_)
    self->_perProcessState.frozenVisibleContentRect.__engaged_ = 0;
  if (self->_perProcessState.frozenUnobscuredContentRect.__engaged_)
    self->_perProcessState.frozenUnobscuredContentRect.__engaged_ = 0;
  if (self->_contentViewShouldBecomeFirstResponderAfterNavigationGesture)
  {
    if (-[WKWebView window](self, "window"))
    {
      if ((objc_msgSend(self->_contentView.m_ptr, "isFirstResponder") & 1) == 0)
        objc_msgSend(self->_contentView.m_ptr, "becomeFirstResponder");
    }
    self->_contentViewShouldBecomeFirstResponderAfterNavigationGesture = 0;
  }
}

- (void)_showPasswordViewWithDocumentName:(id)a3 passwordHandler:(id)a4
{
  WKPasswordView *v7;
  WKPasswordView *v8;
  void *m_ptr;

  v7 = [WKPasswordView alloc];
  -[WKWebView bounds](self, "bounds");
  v8 = -[WKPasswordView initWithFrame:documentName:](v7, "initWithFrame:documentName:", a3);
  m_ptr = self->_passwordView.m_ptr;
  self->_passwordView.m_ptr = v8;
  if (m_ptr)
  {
    CFRelease(m_ptr);
    v8 = (WKPasswordView *)self->_passwordView.m_ptr;
  }
  -[WKPasswordView setUserDidEnterPassword:](v8, "setUserDidEnterPassword:", a4);
  objc_msgSend(self->_passwordView.m_ptr, "showInScrollView:", self->_scrollView.m_ptr);
  objc_msgSend(-[WKWebView _currentContentView](self, "_currentContentView"), "setHidden:", 1);
  -[WKWebView _didRequestPasswordForDocument](self, "_didRequestPasswordForDocument");
}

- (void)_didRequestPasswordForDocument
{
  WebKit::NavigationState::didRequestPasswordForQuickLookDocument((id *)self->_navigationState.__ptr_.__value_);
}

- (void)_didStopRequestingPasswordForDocument
{
  WebKit::NavigationState::didStopRequestingPasswordForQuickLookDocument((id *)self->_navigationState.__ptr_.__value_);
}

- (WKPasswordView)_passwordView
{
  return (WKPasswordView *)self->_passwordView.m_ptr;
}

- (void)_resetScrollViewInsetAdjustmentBehavior
{
  objc_msgSend(self->_scrollView.m_ptr, "_resetContentInsetAdjustmentBehavior");
  -[WKWebView _updateScrollViewInsetAdjustmentBehavior](self, "_updateScrollViewInsetAdjustmentBehavior");
}

- (void)_beginAnimatedFullScreenExit
{
  self->_perProcessState.isAnimatingFullScreenExit = 1;
}

- (void)_endAnimatedFullScreenExit
{
  _BOOL4 isAnimatingFullScreenExit;

  isAnimatingFullScreenExit = self->_perProcessState.isAnimatingFullScreenExit;
  self->_perProcessState.isAnimatingFullScreenExit = 0;
  if (isAnimatingFullScreenExit && !-[WKWebView _shouldDeferGeometryUpdates](self, "_shouldDeferGeometryUpdates"))
    -[WKWebView _didStopDeferringGeometryUpdates](self, "_didStopDeferringGeometryUpdates");
}

- (void)removeFromSuperview
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WKWebView;
  -[WKWebView removeFromSuperview](&v3, sel_removeFromSuperview);
  if (objc_msgSend(self->_fullScreenWindowController.m_ptr, "isFullScreen"))
    objc_msgSend(self->_fullScreenWindowController.m_ptr, "webViewDidRemoveFromSuperviewWhileInFullscreen");
}

- (void)_firePresentationUpdateForPendingStableStatePresentationCallbacks
{
  CFTypeRef v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(WTF::RunLoop *);
  void *v7;
  CFTypeRef cf;

  if (self)
  {
    CFRetain(self);
    v4 = MEMORY[0x1E0C809B0];
    v5 = 3321888768;
    v6 = __97__WKWebView_WKViewInternalIOS___firePresentationUpdateForPendingStableStatePresentationCallbacks__block_invoke;
    v7 = &__block_descriptor_40_e8_32c111_ZTSKZ97__WKWebView_WKViewInternalIOS___firePresentationUpdateForPendingStableStatePresentationCallbacks_E4__15_e5_v8__0l;
    CFRetain(self);
    cf = self;
    CFRetain(self);
  }
  else
  {
    v4 = MEMORY[0x1E0C809B0];
    v5 = 3321888768;
    v6 = __97__WKWebView_WKViewInternalIOS___firePresentationUpdateForPendingStableStatePresentationCallbacks__block_invoke;
    v7 = &__block_descriptor_40_e8_32c111_ZTSKZ97__WKWebView_WKViewInternalIOS___firePresentationUpdateForPendingStableStatePresentationCallbacks_E4__15_e5_v8__0l;
    cf = 0;
  }
  -[WKWebView _doAfterNextPresentationUpdate:](self, "_doAfterNextPresentationUpdate:", &v4);
  if (self)
    CFRelease(self);
  v3 = cf;
  cf = 0;
  if (v3)
    CFRelease(v3);
  if (self)
    CFRelease(self);
}

uint64_t __97__WKWebView_WKViewInternalIOS___firePresentationUpdateForPendingStableStatePresentationCallbacks__block_invoke(WTF::RunLoop *a1)
{
  const void *v2;
  _QWORD *v3;
  uint64_t result;
  _QWORD *v5;

  WTF::RunLoop::main(a1);
  v2 = (const void *)*((_QWORD *)a1 + 4);
  if (v2)
    CFRetain(v2);
  v3 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
  *v3 = &off_1E34C58D0;
  v3[1] = v2;
  v5 = v3;
  WTF::RunLoop::dispatch();
  result = (uint64_t)v5;
  if (v5)
    return (*(uint64_t (**)(_QWORD *))(*v5 + 8))(v5);
  return result;
}

- (void)setSemanticContentAttribute:(int64_t)a3
{
  WebPageProxy *m_ptr;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WKWebView;
  -[WKWebView setSemanticContentAttribute:](&v6, sel_setSemanticContentAttribute_);
  m_ptr = self->_page.m_ptr;
  if (m_ptr)
    WebKit::WebPageProxy::setUserInterfaceLayoutDirection((uint64_t)m_ptr, objc_msgSend(MEMORY[0x1E0CEABB0], "userInterfaceLayoutDirectionForSemanticContentAttribute:", a3) == 1);
}

- (void)buildMenuWithBuilder:(id)a3
{
  objc_super v5;

  if (-[WKWebView usesStandardContentView](self, "usesStandardContentView"))
    objc_msgSend(self->_contentView.m_ptr, "buildMenuForWebViewWithBuilder:", a3);
  v5.receiver = self;
  v5.super_class = (Class)WKWebView;
  -[WKWebView buildMenuWithBuilder:](&v5, sel_buildMenuWithBuilder_, a3);
}

- (BOOL)_shouldAvoidSecurityHeuristicScoreUpdates
{
  return objc_msgSend(self->_contentView.m_ptr, "_shouldAvoidSecurityHeuristicScoreUpdates");
}

- (void)_beginLiveResize
{
  PerWebProcessState *p_perProcessState;
  NSObject *v3;
  const char *v4;
  NSObject *v6;
  uint64_t v7;
  double v8;
  double v9;
  CGFloat v10;
  CGFloat v11;
  int v12;
  WKWebView *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  p_perProcessState = &self->_perProcessState;
  if (self->_perProcessState.liveResizeParameters.__engaged_)
  {
    v3 = qword_1ECE71730;
    if (!os_log_type_enabled((os_log_t)qword_1ECE71730, OS_LOG_TYPE_FAULT))
      return;
    LOWORD(v12) = 0;
    v4 = "Error: _beginLiveResize called with an outstanding live resize.";
LABEL_7:
    _os_log_fault_impl(&dword_196BCC000, v3, OS_LOG_TYPE_FAULT, v4, (uint8_t *)&v12, 2u);
    return;
  }
  if (self->_perProcessState.dynamicViewportUpdateMode)
  {
    v3 = qword_1ECE71730;
    if (!os_log_type_enabled((os_log_t)qword_1ECE71730, OS_LOG_TYPE_FAULT))
      return;
    LOWORD(v12) = 0;
    v4 = "Error: _beginLiveResize called during an animated resize.";
    goto LABEL_7;
  }
  v6 = qword_1ECE71A28;
  if (os_log_type_enabled((os_log_t)qword_1ECE71A28, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(*((_QWORD *)self->_page.m_ptr + 4) + 744);
    v12 = 134218240;
    v13 = self;
    v14 = 2048;
    v15 = v7;
    _os_log_impl(&dword_196BCC000, v6, OS_LOG_TYPE_DEFAULT, "%p (pageProxyID=%llu) -[WKWebView _beginLiveResize]", (uint8_t *)&v12, 0x16u);
  }
  -[WKWebView bounds](self, "bounds");
  v9 = v8;
  -[UIScrollView contentOffset](-[WKWebView scrollView](self, "scrollView"), "contentOffset");
  p_perProcessState->liveResizeParameters.var0.__val_.viewWidth = v9;
  p_perProcessState->liveResizeParameters.var0.__val_.initialScrollPosition.x = v10;
  p_perProcessState->liveResizeParameters.var0.__val_.initialScrollPosition.y = v11;
  p_perProcessState->liveResizeParameters.__engaged_ = 1;
  -[WKWebView _ensureResizeAnimationView](self, "_ensureResizeAnimationView");
}

- (id)_searchableObject
{
  id *p_m_ptr;

  p_m_ptr = &self->_customContentView.m_ptr;
  if ((objc_msgSend(self->_customContentView.m_ptr, "conformsToProtocol:", &unk_1EE36A568) & 1) == 0)
    p_m_ptr = &self->_contentView.m_ptr;
  return *p_m_ptr;
}

- (BOOL)supportsTextReplacement
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return objc_msgSend(self->_customContentView.m_ptr, "supportsTextReplacement");
  else
    return objc_msgSend(self->_contentView.m_ptr, "supportsTextReplacementForWebView");
}

- (id)_animationForFindOverlay:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;

  v3 = a3;
  v4 = (void *)objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("opacity"));
  v5 = v4;
  if (v3)
    v6 = &unk_1E356FCE8;
  else
    v6 = &unk_1E356FD00;
  if (v3)
    v7 = &unk_1E356FD00;
  else
    v7 = &unk_1E356FCE8;
  objc_msgSend(v4, "setFromValue:", v6);
  objc_msgSend(v5, "setToValue:", v7);
  objc_msgSend(v5, "setDuration:", 0.200000003);
  LODWORD(v8) = 1055119114;
  LODWORD(v9) = 1028443341;
  LODWORD(v10) = 1057803469;
  LODWORD(v11) = 1064514355;
  objc_msgSend(v5, "setTimingFunction:", objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v8, v9, v10, v11));
  return v5;
}

- (void)_showFindOverlay
{
  optional<FindOverlays> *p_findOverlaysOutsideContentView;
  CALayer *v4;
  CALayer *v5;
  double v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  id v14;
  void *m_ptr;
  void *v16;
  void *v17;
  void *v18;

  p_findOverlaysOutsideContentView = &self->_findOverlaysOutsideContentView;
  if (!self->_findOverlaysOutsideContentView.__engaged_)
  {
    v7 = objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 0.101960784, 0.101960784, 0.101960784, 0.250980392);
    v8 = objc_alloc_init(MEMORY[0x1E0CEABB0]);
    objc_msgSend(v8, "setBackgroundColor:", v7);
    objc_msgSend(self->_scrollView.m_ptr, "insertSubview:belowSubview:", v8, self->_contentView.m_ptr);
    v9 = objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 0.101960784, 0.101960784, 0.101960784, 0.250980392);
    v10 = objc_alloc_init(MEMORY[0x1E0CEABB0]);
    objc_msgSend(v10, "setBackgroundColor:", v9);
    objc_msgSend(self->_scrollView.m_ptr, "insertSubview:belowSubview:", v10, self->_contentView.m_ptr);
    v11 = objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 0.101960784, 0.101960784, 0.101960784, 0.250980392);
    v12 = objc_alloc_init(MEMORY[0x1E0CEABB0]);
    objc_msgSend(v12, "setBackgroundColor:", v11);
    objc_msgSend(self->_scrollView.m_ptr, "insertSubview:belowSubview:", v12, self->_contentView.m_ptr);
    v13 = objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 0.101960784, 0.101960784, 0.101960784, 0.250980392);
    v14 = objc_alloc_init(MEMORY[0x1E0CEABB0]);
    objc_msgSend(v14, "setBackgroundColor:", v13);
    objc_msgSend(self->_scrollView.m_ptr, "insertSubview:belowSubview:", v14, self->_contentView.m_ptr);
    if (p_findOverlaysOutsideContentView->__engaged_)
    {
      m_ptr = p_findOverlaysOutsideContentView->var0.__val_.top.m_ptr;
      p_findOverlaysOutsideContentView->var0.__val_.top.m_ptr = v8;
      if (m_ptr)
        CFRelease(m_ptr);
      v16 = p_findOverlaysOutsideContentView->var0.__val_.right.m_ptr;
      p_findOverlaysOutsideContentView->var0.__val_.right.m_ptr = v10;
      if (v16)
        CFRelease(v16);
      v17 = p_findOverlaysOutsideContentView->var0.__val_.bottom.m_ptr;
      p_findOverlaysOutsideContentView->var0.__val_.bottom.m_ptr = v12;
      if (v17)
        CFRelease(v17);
      v18 = p_findOverlaysOutsideContentView->var0.__val_.left.m_ptr;
      p_findOverlaysOutsideContentView->var0.__val_.left.m_ptr = v14;
      if (v18)
        CFRelease(v18);
    }
    else
    {
      p_findOverlaysOutsideContentView->var0.__val_.top.m_ptr = v8;
      p_findOverlaysOutsideContentView->var0.__val_.right.m_ptr = v10;
      p_findOverlaysOutsideContentView->var0.__val_.bottom.m_ptr = v12;
      p_findOverlaysOutsideContentView->var0.__val_.left.m_ptr = v14;
      p_findOverlaysOutsideContentView->__engaged_ = 1;
    }
  }
  -[WKWebView _updateFindOverlayPosition](self, "_updateFindOverlayPosition");
  v4 = -[WKWebView _layerForFindOverlay](self, "_layerForFindOverlay");
  if (v4)
  {
    v5 = v4;
    -[WKWebView _updateFindOverlaysOutsideContentView:](self, "_updateFindOverlaysOutsideContentView:", &__block_literal_global_22);
    -[CALayer removeAllAnimations](v5, "removeAllAnimations");
    LODWORD(v6) = 1.0;
    -[CALayer setOpacity:](v5, "setOpacity:", v6);
  }
  else
  {
    -[WKWebView _updateFindOverlaysOutsideContentView:](self, "_updateFindOverlaysOutsideContentView:", &__block_literal_global_585);
    -[WKWebView _addLayerForFindOverlay](self, "_addLayerForFindOverlay");
  }
}

uint64_t __48__WKWebView_WKViewInternalIOS___showFindOverlay__block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend((id)objc_msgSend(a2, "layer"), "removeAllAnimations");
  return objc_msgSend(a2, "setAlpha:", 1.0);
}

uint64_t __48__WKWebView_WKViewInternalIOS___showFindOverlay__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setAlpha:", 0.0);
}

- (void)_hideFindOverlay
{
  unint64_t v3;
  uint64_t v4;
  id v5;
  void *v6;
  uint64_t v7;
  double v8;
  _QWORD v9[5];
  id location;
  _QWORD v11[4];
  id v12;

  v3 = -[WKWebView _layerForFindOverlay](self, "_layerForFindOverlay");
  if (self->_findOverlaysOutsideContentView.__engaged_)
    v4 = objc_msgSend(self->_findOverlaysOutsideContentView.var0.__val_.top.m_ptr, "layer");
  else
    v4 = 0;
  if (v4 | v3)
  {
    if (!objc_msgSend((id)v4, "animationForKey:", CFSTR("findOverlayFadeOut")))
    {
      objc_msgSend((id)v3, "removeAllAnimations");
      -[WKWebView _updateFindOverlaysOutsideContentView:](self, "_updateFindOverlaysOutsideContentView:", &__block_literal_global_588);
      objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
      v5 = -[WKWebView _animationForFindOverlay:](self, "_animationForFindOverlay:", 0);
      v6 = (void *)MEMORY[0x1E0CD28B0];
      v7 = MEMORY[0x1E0C809B0];
      location = 0;
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3321888768;
      v11[2] = __48__WKWebView_WKViewInternalIOS___hideFindOverlay__block_invoke_2;
      v11[3] = &__block_descriptor_40_e8_32c62_ZTSKZ48__WKWebView_WKViewInternalIOS___hideFindOverlay_E4__18_e5_v8__0l;
      objc_initWeak(&location, self);
      v12 = 0;
      objc_copyWeak(&v12, &location);
      objc_msgSend(v6, "setCompletionBlock:", v11);
      objc_destroyWeak(&location);
      objc_msgSend((id)v3, "addAnimation:forKey:", v5, CFSTR("findOverlayFadeOut"));
      v9[0] = v7;
      v9[1] = 3221225472;
      v9[2] = __48__WKWebView_WKViewInternalIOS___hideFindOverlay__block_invoke_590;
      v9[3] = &unk_1E34C56F0;
      v9[4] = v5;
      -[WKWebView _updateFindOverlaysOutsideContentView:](self, "_updateFindOverlaysOutsideContentView:", v9);
      objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
      LODWORD(v8) = 0;
      objc_msgSend((id)v3, "setOpacity:", v8);
      -[WKWebView _updateFindOverlaysOutsideContentView:](self, "_updateFindOverlaysOutsideContentView:", &__block_literal_global_592);
      objc_destroyWeak(&v12);
    }
  }
}

uint64_t __48__WKWebView_WKViewInternalIOS___hideFindOverlay__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend((id)objc_msgSend(a2, "layer"), "removeAllAnimations");
}

void __48__WKWebView_WKViewInternalIOS___hideFindOverlay__block_invoke_2(uint64_t a1)
{
  char *WeakRetained;
  char *v2;
  char *v3;
  int v4;
  double v5;
  const void *v6;
  const void *v7;
  const void *v8;
  id v9;

  WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    v3 = WeakRetained + 672;
    v4 = WeakRetained[704];
    if (!WeakRetained[704] || (objc_msgSend(*(id *)v3, "alpha"), v5 == 0.0))
    {
      objc_msgSend(v2, "_removeLayerForFindOverlay");
      if (v4)
      {
        objc_msgSend(v2, "_updateFindOverlaysOutsideContentView:", &__block_literal_global_1179);
        if (v3[32])
        {
          v6 = (const void *)*((_QWORD *)v3 + 3);
          *((_QWORD *)v3 + 3) = 0;
          if (v6)
            CFRelease(v6);
          v7 = (const void *)*((_QWORD *)v3 + 2);
          *((_QWORD *)v3 + 2) = 0;
          if (v7)
            CFRelease(v7);
          v8 = (const void *)*((_QWORD *)v3 + 1);
          *((_QWORD *)v3 + 1) = 0;
          if (v8)
            CFRelease(v8);
          v9 = *(id *)v3;
          *(_QWORD *)v3 = 0;
          if (v9)
            CFRelease(v9);
          v3[32] = 0;
        }
      }
    }
    CFRelease(v2);
  }
}

uint64_t __48__WKWebView_WKViewInternalIOS___hideFindOverlay__block_invoke_590(uint64_t a1, void *a2)
{
  return objc_msgSend((id)objc_msgSend(a2, "layer"), "addAnimation:forKey:", *(_QWORD *)(a1 + 32), CFSTR("findOverlayFadeOut"));
}

uint64_t __48__WKWebView_WKViewInternalIOS___hideFindOverlay__block_invoke_2_591(uint64_t a1, void *a2)
{
  void *v2;
  double v3;

  v2 = (void *)objc_msgSend(a2, "layer");
  LODWORD(v3) = 0;
  return objc_msgSend(v2, "setOpacity:", v3);
}

- (void)_enhancedWindowingToggled:(id)a3
{
  uint64_t v4;
  WebPageProxy *m_ptr;
  BOOL v6;

  v4 = objc_msgSend(a3, "object");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    v4 = 0;
  if (v4 == objc_msgSend((id)-[WKWebView window](self, "window"), "windowScene"))
  {
    m_ptr = self->_page.m_ptr;
    if (m_ptr)
    {
      if (!*((_BYTE *)m_ptr + 729))
      {
        if (*((_BYTE *)m_ptr + 728))
        {
          v6 = -[WKWebView _isWindowResizingEnabled](self, "_isWindowResizingEnabled");
          WebKit::AuxiliaryProcessProxy::send<Messages::WebPage::SetIsWindowResizingEnabled>(*((_QWORD *)m_ptr + 26), &v6, *(_QWORD *)(*((_QWORD *)m_ptr + 4) + 1896), 0);
        }
      }
    }
  }
}

+ (void)_clearLockdownModeWarningNeeded
{
  lockdownModeWarningNeeded = 1;
}

- (int64_t)_effectiveDataOwner:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) >= 3)
  {
    if (a3)
    {
      return 0;
    }
    else if (objc_msgSend((id)objc_msgSend((id)((uint64_t (*)(WKWebView *, SEL))*MEMORY[0x1E0DCE080])(self, a2), "sharedConnection"), "isURLManaged:", -[WKWebView URL](self, "URL")))
    {
      return 2;
    }
    else
    {
      return 1;
    }
  }
  return a3;
}

- (void)_updateFindOverlaysOutsideContentView:(id)a3
{
  optional<FindOverlays> *p_findOverlaysOutsideContentView;

  p_findOverlaysOutsideContentView = &self->_findOverlaysOutsideContentView;
  if (self->_findOverlaysOutsideContentView.__engaged_)
  {
    (*((void (**)(id, void *))a3 + 2))(a3, p_findOverlaysOutsideContentView->var0.__val_.top.m_ptr);
    if (p_findOverlaysOutsideContentView->__engaged_
      && ((*((void (**)(id, void *))a3 + 2))(a3, p_findOverlaysOutsideContentView->var0.__val_.bottom.m_ptr),
          p_findOverlaysOutsideContentView->__engaged_)
      && ((*((void (**)(id, void *))a3 + 2))(a3, p_findOverlaysOutsideContentView->var0.__val_.left.m_ptr),
          p_findOverlaysOutsideContentView->__engaged_))
    {
      (*((void (**)(id, void *))a3 + 2))(a3, p_findOverlaysOutsideContentView->var0.__val_.right.m_ptr);
    }
    else
    {
      __break(1u);
    }
  }
}

- (void)_didAddLayerForFindOverlay:(id)a3
{
  ProcessQualified<WTF::ObjectIdentifierGeneric<WebCore::PlatformLayerIdentifierType, WTF::ObjectIdentifierMainThreadAccessTraits<uint64_t>, unsigned long long>> pendingFindLayerID;
  id v6;
  double v7;
  _QWORD v8[5];

  pendingFindLayerID = self->_perProcessState.pendingFindLayerID;
  self->_perProcessState.pendingFindLayerID.m_object.m_identifier = 0;
  self->_perProcessState.pendingFindLayerID.m_processIdentifier.m_identifier = 0;
  self->_perProcessState.committedFindLayerID = pendingFindLayerID;
  (*(void (**)(_QWORD))(**((_QWORD **)self->_page.m_ptr + 14) + 40))(*((_QWORD *)self->_page.m_ptr + 14));
  v6 = -[WKWebView _animationForFindOverlay:](self, "_animationForFindOverlay:", 1);
  objc_msgSend(a3, "addAnimation:forKey:", v6, CFSTR("findOverlayFadeIn"));
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __59__WKWebView_WKViewInternalIOS___didAddLayerForFindOverlay___block_invoke;
  v8[3] = &unk_1E34C56F0;
  v8[4] = v6;
  -[WKWebView _updateFindOverlaysOutsideContentView:](self, "_updateFindOverlaysOutsideContentView:", v8);
  LODWORD(v7) = 1.0;
  objc_msgSend(a3, "setOpacity:", v7);
}

uint64_t __59__WKWebView_WKViewInternalIOS___didAddLayerForFindOverlay___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  double v4;

  v3 = (void *)objc_msgSend(a2, "layer");
  objc_msgSend(v3, "addAnimation:forKey:", *(_QWORD *)(a1 + 32), CFSTR("findOverlayFadeIn"));
  LODWORD(v4) = 1.0;
  return objc_msgSend(v3, "setOpacity:", v4);
}

- (void)_didRemoveLayerForFindOverlay
{
  WebPageProxy *m_ptr;

  m_ptr = self->_page.m_ptr;
  if (m_ptr)
    (*(void (**)(_QWORD))(**((_QWORD **)m_ptr + 14) + 48))(*((_QWORD *)m_ptr + 14));
}

- (BOOL)_haveSetUnobscuredSafeAreaInsets
{
  return self->_haveSetUnobscuredSafeAreaInsets;
}

- (void)_resetUnobscuredSafeAreaInsets
{
  self->_haveSetUnobscuredSafeAreaInsets = 0;
  *(_OWORD *)&self->_unobscuredSafeAreaInsets.top = 0u;
  *(_OWORD *)&self->_unobscuredSafeAreaInsets.bottom = 0u;
  -[WKWebView _scheduleVisibleContentRectUpdate](self, "_scheduleVisibleContentRectUpdate");
}

- (BOOL)_hasOverriddenLayoutParameters
{
  return self->_overriddenLayoutParameters.__engaged_;
}

- (void)_resetObscuredInsets
{
  self->_haveSetObscuredInsets = 0;
  *(_OWORD *)&self->_obscuredInsets.top = 0u;
  *(_OWORD *)&self->_obscuredInsets.bottom = 0u;
  -[WKWebView _scheduleVisibleContentRectUpdate](self, "_scheduleVisibleContentRectUpdate");
}

- (unint64_t)axesToPreventScrollingForPanGestureInScrollView:(id)a3
{
  void *v5;
  unint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;

  v5 = (void *)objc_msgSend(a3, "panGestureRecognizer");
  if ((objc_msgSend(self->_contentView.m_ptr, "preventsPanningInXAxis") & 1) == 0
    && !objc_msgSend(self->_contentView.m_ptr, "preventsPanningInYAxis"))
  {
    v6 = 0;
LABEL_11:
    objc_msgSend(self->_contentView.m_ptr, "cancelPointersForGestureRecognizer:", v5);
    return v6;
  }
  v6 = objc_msgSend(self->_contentView.m_ptr, "preventsPanningInXAxis");
  if (objc_msgSend(self->_contentView.m_ptr, "preventsPanningInYAxis"))
    v6 |= 2uLL;
  objc_msgSend(v5, "translationInView:", a3);
  v8 = v7;
  v10 = v9;
  if ((objc_msgSend(self->_contentView.m_ptr, "preventsPanningInXAxis") & 1) == 0 && fabs(v8) > 2.22044605e-16
    || (objc_msgSend(self->_contentView.m_ptr, "preventsPanningInYAxis") & 1) == 0 && fabs(v10) > 2.22044605e-16)
  {
    goto LABEL_11;
  }
  return v6;
}

- (void)_overrideZoomScaleParametersWithMinimumZoomScale:(double)a3 maximumZoomScale:(double)a4 allowUserScaling:(BOOL)a5
{
  _BOOL8 v5;

  v5 = a5;
  if (!self->_overriddenZoomScaleParameters.__engaged_)
    self->_overriddenZoomScaleParameters.__engaged_ = 1;
  self->_overriddenZoomScaleParameters.var0.__val_.minimumZoomScale = a3;
  self->_overriddenZoomScaleParameters.var0.__val_.maximumZoomScale = a4;
  self->_overriddenZoomScaleParameters.var0.__val_.allowUserScaling = a5;
  objc_msgSend(self->_scrollView.m_ptr, "setMinimumZoomScale:");
  objc_msgSend(self->_scrollView.m_ptr, "setMaximumZoomScale:", a4);
  objc_msgSend(self->_scrollView.m_ptr, "_setZoomEnabledInternal:", v5);
}

- (void)_clearOverrideZoomScaleParameters
{
  if (self->_overriddenZoomScaleParameters.__engaged_)
    self->_overriddenZoomScaleParameters.__engaged_ = 0;
}

WTF *__60__WKWebView_WKViewInternalIOS___updatePageLoadObserverState__block_invoke(uint64_t a1)
{
  __int128 *v2;
  uint64_t v3;
  __int128 v4;
  BOOL v5;
  BOOL v6;
  __int128 v8;
  char v9;
  const __CFAllocator *v10;
  __SecTask *v11;
  void *v12;
  __SecTask *v13;
  CFStringRef v14;
  CFStringRef v15;
  const void *v16;
  int v17;
  CFTypeRef v18;
  const void *v19;
  const void *v20;
  const void *v21;
  const void *v22;
  WTF *v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  const __CFString *v31;
  uint64_t v32;
  uint64_t v33;
  NSObject *v34;
  void *v35;
  NSObject *v36;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t i;
  uint64_t v43;
  const __CFString *v44;
  uint64_t v45;
  const void *v46;
  const void *v47;
  uint64_t v48;
  int v49;
  const void *v50;
  __int128 v51;
  __int128 v52;
  int v53;
  _QWORD v54[3];
  _QWORD v55[3];
  audit_token_t buf;
  uint64_t v57;
  audit_token_t token;
  __int128 v59;
  __int128 v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v2 = (__int128 *)(a1 + 40);
  if ((_MergedGlobals_72 & 1) == 0)
  {
    qword_1ECE72A28 = 0;
    _MergedGlobals_72 = 1;
    goto LABEL_18;
  }
  v3 = qword_1ECE72A28;
  if (!qword_1ECE72A28)
    goto LABEL_18;
  v4 = *(_OWORD *)(a1 + 56);
  v51 = *v2;
  v52 = v4;
  v53 = *(_DWORD *)(a1 + 72);
  if (!*(_BYTE *)(qword_1ECE72A28 + 36))
  {
    if ((_BYTE)v53)
      goto LABEL_18;
LABEL_65:
    ++*(_DWORD *)qword_1ECE72A28;
    goto LABEL_46;
  }
  if ((_BYTE)v53)
  {
    v5 = *(_QWORD *)(qword_1ECE72A28 + 4) == (_QWORD)v51 && *(_QWORD *)(qword_1ECE72A28 + 12) == *((_QWORD *)&v51 + 1);
    v6 = v5 && *(_QWORD *)(qword_1ECE72A28 + 20) == (_QWORD)v52;
    if (v6 && *(_QWORD *)(qword_1ECE72A28 + 28) == *((_QWORD *)&v52 + 1))
      goto LABEL_65;
  }
LABEL_18:
  v8 = *(_OWORD *)(a1 + 56);
  *(_OWORD *)buf.val = *v2;
  *(_OWORD *)&buf.val[4] = v8;
  LODWORD(v57) = *(_DWORD *)(a1 + 72);
  v3 = WTF::fastMalloc((WTF *)0x40);
  *(_DWORD *)v3 = 1;
  v9 = v57;
  *(_DWORD *)(v3 + 36) = v57;
  *(audit_token_t *)(v3 + 4) = buf;
  *(_QWORD *)(v3 + 40) = 0;
  *(_DWORD *)(v3 + 48) = 0;
  *(_QWORD *)(v3 + 56) = 0;
  v10 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  if (v9)
  {
    token = buf;
    v11 = SecTaskCreateWithAuditToken(v10, &token);
  }
  else
  {
    v11 = SecTaskCreateFromSelf(v10);
  }
  v13 = v11;
  if (!v11)
    goto LABEL_43;
  v14 = SecTaskCopySigningIdentifier(v11, 0);
  v15 = v14;
  if (v14)
    CFRetain(v14);
  v16 = *(const void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v15;
  if (v16)
    CFRelease(v16);
  if ((WTF::hasEntitlement() & 1) != 0)
  {
    v17 = 1;
LABEL_30:
    *(_DWORD *)(v3 + 48) = v17;
    goto LABEL_31;
  }
  if (objc_msgSend(*(id *)(v3 + 40), "isEqualToString:", CFSTR("com.apple.webapp")))
  {
    v17 = 2;
    goto LABEL_30;
  }
LABEL_31:
  if (*(_BYTE *)(v3 + 36))
    *(_DWORD *)(v3 + 48) = 3;
  v18 = SecTaskCopyValueForEntitlement(v13, CFSTR("com.apple.developer.associated-domains"), 0);
  v19 = WTF::dynamic_cf_cast<__CFArray const*>(v18);
  if (v19)
  {
    v20 = (const void *)objc_msgSend(MEMORY[0x1E0D96E50], "serviceSpecifiersWithEntitlementValue:serviceType:error:", v19, *MEMORY[0x1E0D96E58], 0);
    v21 = v20;
    if (v20)
      CFRetain(v20);
    v22 = *(const void **)(v3 + 56);
    *(_QWORD *)(v3 + 56) = v21;
    if (v22)
      CFRelease(v22);
  }
  if (v18)
    CFRelease(v18);
  if (v15)
    CFRelease(v15);
  CFRelease(v13);
LABEL_43:
  ++*(_DWORD *)v3;
  v23 = (WTF *)qword_1ECE72A28;
  qword_1ECE72A28 = v3;
  if (v23)
  v24 = qword_1ECE71550;
  if (os_log_type_enabled((os_log_t)qword_1ECE71550, OS_LOG_TYPE_DEBUG))
  {
    v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(v3 + 56), "count"));
    v59 = 0u;
    v60 = 0u;
    memset(&token, 0, sizeof(token));
    v39 = *(void **)(v3 + 56);
    v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &token, &buf, 16);
    if (v40)
    {
      v41 = **(_QWORD **)&token.val[4];
      while (2)
      {
        for (i = 0; i != v40; ++i)
        {
          if (**(_QWORD **)&token.val[4] != v41)
            objc_enumerationMutation(v39);
          v43 = objc_msgSend(*(id *)(*(_QWORD *)&token.val[2] + 8 * i), "domain");
          if (v43)
          {
            if ((unint64_t)objc_msgSend(v38, "count") >= 6)
            {
              objc_msgSend(v38, "addObject:", CFSTR("..."));
              goto LABEL_78;
            }
            objc_msgSend(v38, "addObject:", v43);
          }
        }
        v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &token, &buf, 16);
        if (v40)
          continue;
        break;
      }
    }
LABEL_78:
    v44 = *(const __CFString **)(v3 + 40);
    if (!v44)
      v44 = CFSTR("unknown");
    v55[0] = v44;
    v54[0] = CFSTR("bundleID");
    v54[1] = CFSTR("appType");
    v45 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(v3 + 48));
    v54[2] = CFSTR("domains");
    v55[1] = v45;
    v55[2] = v38;
    v46 = (const void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v55, v54, 3);
    v47 = v46;
    if (v46)
      CFRetain(v46);
    if (v38)
      CFRelease(v38);
    v49 = 138739971;
    v50 = v47;
    _os_log_debug_impl(&dword_196BCC000, v24, OS_LOG_TYPE_DEBUG, "Loaded app state: %{sensitive}@", (uint8_t *)&v49, 0xCu);
    if (v47)
      CFRelease(v47);
  }
LABEL_46:
  if (*(_DWORD *)(v3 + 48) == 1)
  {
    v25 = 1;
  }
  else
  {
    v26 = *(_QWORD *)(a1 + 32);
    memset(&token, 0, sizeof(token));
    v59 = 0u;
    v60 = 0u;
    v27 = *(void **)(v3 + 56);
    v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &token, &buf, 16);
    if (v28)
    {
      v29 = **(_QWORD **)&token.val[4];
      while (2)
      {
        for (j = 0; j != v28; ++j)
        {
          if (**(_QWORD **)&token.val[4] != v29)
            objc_enumerationMutation(v27);
          if ((objc_msgSend(*(id *)(*(_QWORD *)&token.val[2] + 8 * j), "domainEncompassesDomain:", v26) & 1) != 0)
          {
            v36 = qword_1ECE71550;
            if (os_log_type_enabled((os_log_t)qword_1ECE71550, OS_LOG_TYPE_DEBUG))
            {
              v48 = *(_QWORD *)(a1 + 32);
              buf.val[0] = 138739971;
              *(_QWORD *)&buf.val[1] = v48;
              _os_log_debug_impl(&dword_196BCC000, v36, OS_LOG_TYPE_DEBUG, "Ignoring event: host %{sensitive}@ matches first party domain", (uint8_t *)&buf, 0xCu);
            }
          }
        }
        v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &token, &buf, 16);
        if (v28)
          continue;
        break;
      }
    }
    v25 = *(unsigned int *)(v3 + 48);
  }
  v31 = *(const __CFString **)(v3 + 40);
  if (!v31)
    v31 = CFSTR("unknown");
  *(_QWORD *)token.val = v31;
  *(_QWORD *)&v51 = CFSTR("bundleID");
  *((_QWORD *)&v51 + 1) = CFSTR("appType");
  v32 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v25);
  *(_QWORD *)&v52 = CFSTR("pageLoadCount");
  *(_QWORD *)&token.val[2] = v32;
  *(_QWORD *)&token.val[4] = &unk_1E356FD00;
  v33 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &token, &v51, 3);
  v34 = qword_1ECE71550;
  if (os_log_type_enabled((os_log_t)qword_1ECE71550, OS_LOG_TYPE_DEBUG))
  {
    buf.val[0] = 138739971;
    *(_QWORD *)&buf.val[1] = v33;
    _os_log_debug_impl(&dword_196BCC000, v34, OS_LOG_TYPE_DEBUG, "Submitting event %{sensitive}@", (uint8_t *)&buf, 0xCu);
  }
  *(_QWORD *)buf.val = MEMORY[0x1E0C809B0];
  *(_QWORD *)&buf.val[2] = 3221225472;
  *(_QWORD *)&buf.val[4] = ___ZL26sendPageLoadAnalyticsEventON3WTF9RetainPtrI8NSStringEENSt3__18optionalI13audit_token_tEE_block_invoke;
  *(_QWORD *)&buf.val[6] = &unk_1E34C59B8;
  v57 = v33;
  AnalyticsSendEventLazy();
}

- (void)_setUIEventAttribution:(id)a3
{
  char v5;
  WTF::StringImpl **v6;
  WTF::WallTime *v7;
  WTF::StringImpl *v8;
  uint64_t v9;
  WTF::StringImpl *v10;
  WTF::StringImpl *v11;
  WTF::StringImpl *v12;
  int v13;
  WTF::StringImpl *v14;
  WTF::StringImpl *v15;
  WTF::StringImpl *v16;
  WebPageProxy *m_ptr;
  WTF::StringImpl *v18;
  WTF::StringImpl *v19;
  WTF::StringImpl *v20;
  WTF::StringImpl *v21;
  WTF::StringImpl *v22;
  WTF::StringImpl *v23;
  WTF::StringImpl *v24[5];
  WTF::StringImpl *v25;
  WTF::StringImpl *v26[5];
  WTF::StringImpl *v27;
  char v28[8];
  WTF::StringImpl *v29;
  WTF::StringImpl *v30;
  uint64_t v31;
  char v32;
  char v33;
  char v34;
  char v35;
  char v36;
  char v37;
  char v38;
  char v39;
  char v40;
  char v41;
  char v42;
  __int128 v43;
  __int128 v44;
  char v45;
  char v46;
  WTF::StringImpl *v47;

  if (a3)
  {
    v5 = objc_msgSend(a3, "sourceIdentifier");
    MEMORY[0x19AEABB18](v26, objc_msgSend(a3, "reportEndpoint"));
    WebCore::RegistrableDomain::RegistrableDomain(&v27, (const WTF::URL *)v26);
    MEMORY[0x19AEABB18](v24, objc_msgSend(a3, "destinationURL"));
    v6 = WebCore::RegistrableDomain::RegistrableDomain(&v25, (const WTF::URL *)v24);
    v7 = (WTF::WallTime *)WebCore::applicationBundleIdentifier((WebCore *)v6);
    WTF::WallTime::now(v7);
    v28[0] = v5;
    v10 = v27;
    if (v27)
      *(_DWORD *)v27 += 2;
    v29 = v10;
    v11 = v25;
    if (v25)
      *(_DWORD *)v25 += 2;
    v30 = v11;
    v31 = v9;
    v32 = 0;
    v33 = 0;
    v34 = 0;
    v35 = 0;
    v36 = 0;
    v37 = 0;
    v38 = 0;
    v39 = 0;
    v40 = 0;
    v41 = 0;
    v42 = 0;
    v46 = 0;
    v43 = 0u;
    v44 = 0u;
    v45 = 0;
    v12 = v23;
    if (v23)
    {
      v13 = *(_DWORD *)v23;
      *(_DWORD *)v23 += 2;
      v47 = v12;
      v23 = 0;
      if (v13)
      {
        *(_DWORD *)v12 = v13;
      }
      else
      {
        WTF::StringImpl::destroy(v12, v8);
        v11 = v25;
      }
    }
    else
    {
      v47 = 0;
    }
    v25 = 0;
    if (v11)
    {
      if (*(_DWORD *)v11 == 2)
        WTF::StringImpl::destroy(v11, v8);
      else
        *(_DWORD *)v11 -= 2;
    }
    v14 = v24[0];
    v24[0] = 0;
    if (v14)
    {
      if (*(_DWORD *)v14 == 2)
        WTF::StringImpl::destroy(v14, v8);
      else
        *(_DWORD *)v14 -= 2;
    }
    v15 = v27;
    v27 = 0;
    if (v15)
    {
      if (*(_DWORD *)v15 == 2)
        WTF::StringImpl::destroy(v15, v8);
      else
        *(_DWORD *)v15 -= 2;
    }
    v16 = v26[0];
    v26[0] = 0;
    if (v16)
    {
      if (*(_DWORD *)v16 == 2)
        WTF::StringImpl::destroy(v16, v8);
      else
        *(_DWORD *)v16 -= 2;
    }
    m_ptr = self->_page.m_ptr;
    MEMORY[0x19AEABCC8](&v22, objc_msgSend(a3, "sourceDescription"));
    MEMORY[0x19AEABCC8](&v21, objc_msgSend(a3, "purchaser"));
    WebKit::WebPageProxy::setPrivateClickMeasurement((uint64_t)m_ptr, v28, &v22, &v21);
    v19 = v21;
    v21 = 0;
    if (v19)
    {
      if (*(_DWORD *)v19 == 2)
        WTF::StringImpl::destroy(v19, v18);
      else
        *(_DWORD *)v19 -= 2;
    }
    v20 = v22;
    v22 = 0;
    if (v20)
    {
      if (*(_DWORD *)v20 == 2)
        WTF::StringImpl::destroy(v20, v18);
      else
        *(_DWORD *)v20 -= 2;
    }
    WebCore::PrivateClickMeasurement::~PrivateClickMeasurement((WebCore::PrivateClickMeasurement *)v28, v18);
  }
  else
  {
    std::__optional_destruct_base<WebKit::PrivateClickMeasurementAndMetadata,false>::reset[abi:sn180100]((WebCore::PrivateClickMeasurement *)(*((_QWORD *)self->_page.m_ptr + 4) + 1336), (WTF::StringImpl *)a2);
  }
}

- (UIEventAttribution)_uiEventAttribution
{
  WTF::StringImpl *v2;
  WTF::StringImpl *v3;
  UIEventAttribution *result;
  WTF::StringImpl *v5;
  WTF::StringImpl *v6;
  UIEventAttribution *v7;
  WTF::StringImpl *v8;
  UIEventAttribution *v9;
  uint64_t v10;
  UIEventAttribution *v11;
  UIEventAttribution *v12;
  const __CFString *v13;
  WTF::StringImpl *v14;
  WTF::StringImpl *v15;
  WTF::StringImpl *v16;
  WTF::StringImpl *v17;
  _BYTE v18[8];
  WTF::StringImpl *v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  uint64_t v23[2];

  WebKit::WebPageProxy::privateClickMeasurementEventAttribution((uint64_t)self->_page.m_ptr, (uint64_t)v18);
  if (!v22)
  {
    v7 = 0;
LABEL_24:
    std::__optional_destruct_base<WebKit::WebPageProxy::EventAttribution,false>::~__optional_destruct_base[abi:sn180100]((uint64_t)v18, v2);
    return v7;
  }
  v3 = v19;
  if (v19)
    *(_DWORD *)v19 += 2;
  v15 = v3;
  v23[0] = (uint64_t)"https://";
  v23[1] = 9;
  result = (UIEventAttribution *)WTF::tryMakeString<WTF::ASCIILiteral,WTF::String>(v23, (uint64_t *)&v15, &v16);
  if (v16)
  {
    MEMORY[0x19AEABB0C](&v17, &v16, 0);
    v6 = v16;
    v16 = 0;
    if (v6)
    {
      if (*(_DWORD *)v6 == 2)
        WTF::StringImpl::destroy(v6, v5);
      else
        *(_DWORD *)v6 -= 2;
    }
    v8 = v15;
    v15 = 0;
    if (v8)
    {
      if (*(_DWORD *)v8 == 2)
        WTF::StringImpl::destroy(v8, v5);
      else
        *(_DWORD *)v8 -= 2;
    }
    result = (UIEventAttribution *)objc_alloc(MEMORY[0x1E0CEA5B8]);
    if (v22)
    {
      v9 = result;
      v10 = v18[0];
      result = (UIEventAttribution *)WTF::URL::operator NSURL *();
      if (v22)
      {
        v11 = result;
        if (!v20)
        {
          v12 = (UIEventAttribution *)&stru_1E351F1B8;
          goto LABEL_18;
        }
        result = (UIEventAttribution *)WTF::StringImpl::operator NSString *();
        v12 = result;
        if (v22)
        {
LABEL_18:
          if (v21)
            v13 = (const __CFString *)WTF::StringImpl::operator NSString *();
          else
            v13 = &stru_1E351F1B8;
          v7 = (id)CFMakeCollectable(-[UIEventAttribution initWithSourceIdentifier:destinationURL:sourceDescription:purchaser:](v9, "initWithSourceIdentifier:destinationURL:sourceDescription:purchaser:", v10, v11, v12, v13, v15, v16));
          v14 = v17;
          v17 = 0;
          if (v14)
          {
            if (*(_DWORD *)v14 == 2)
              WTF::StringImpl::destroy(v14, v2);
            else
              *(_DWORD *)v14 -= 2;
          }
          goto LABEL_24;
        }
      }
    }
  }
  else
  {
    __break(0xC471u);
  }
  __break(1u);
  return result;
}

- (void)_setEphemeralUIEventAttribution:(id)a3
{
  -[WKWebView _setEphemeralUIEventAttribution:forApplicationWithBundleID:](self, "_setEphemeralUIEventAttribution:forApplicationWithBundleID:", a3, CFSTR("com.apple.mobilesafari"));
}

- (void)_setEphemeralUIEventAttribution:(id)a3 forApplicationWithBundleID:(id)a4
{
  char v7;
  WTF::WallTime *v8;
  WTF::StringImpl *v9;
  uint64_t v10;
  WTF::StringImpl *v11;
  WTF::StringImpl *v12;
  WTF::StringImpl *v13;
  int v14;
  WTF::StringImpl *v15;
  WTF::StringImpl *v16;
  WTF::StringImpl *v17;
  WebPageProxy *m_ptr;
  WTF::StringImpl *v19;
  WTF::StringImpl *v20;
  WTF::StringImpl *v21;
  WTF::StringImpl *v22;
  WTF::StringImpl *v23;
  WTF::StringImpl *v24;
  WTF::StringImpl *v25[5];
  WTF::StringImpl *v26;
  WTF::StringImpl *v27[5];
  WTF::StringImpl *v28;
  char v29[8];
  WTF::StringImpl *v30;
  WTF::StringImpl *v31;
  uint64_t v32;
  char v33;
  char v34;
  char v35;
  char v36;
  char v37;
  char v38;
  char v39;
  char v40;
  char v41;
  char v42;
  char v43;
  __int128 v44;
  __int128 v45;
  char v46;
  char v47;
  WTF::StringImpl *v48;

  if (a3)
  {
    v7 = objc_msgSend(a3, "sourceIdentifier");
    MEMORY[0x19AEABB18](v27, objc_msgSend(a3, "reportEndpoint"));
    WebCore::RegistrableDomain::RegistrableDomain(&v28, (const WTF::URL *)v27);
    MEMORY[0x19AEABB18](v25, objc_msgSend(a3, "destinationURL"));
    WebCore::RegistrableDomain::RegistrableDomain(&v26, (const WTF::URL *)v25);
    v8 = (WTF::WallTime *)MEMORY[0x19AEABCC8](&v24, a4);
    WTF::WallTime::now(v8);
    v29[0] = v7;
    v11 = v28;
    if (v28)
      *(_DWORD *)v28 += 2;
    v30 = v11;
    v12 = v26;
    if (v26)
      *(_DWORD *)v26 += 2;
    v31 = v12;
    v32 = v10;
    v33 = 1;
    v34 = 0;
    v35 = 0;
    v36 = 0;
    v37 = 0;
    v38 = 0;
    v39 = 0;
    v40 = 0;
    v41 = 0;
    v42 = 0;
    v43 = 0;
    v47 = 0;
    v44 = 0u;
    v45 = 0u;
    v46 = 0;
    v13 = v24;
    if (v24)
    {
      v14 = *(_DWORD *)v24;
      *(_DWORD *)v24 += 2;
      v48 = v13;
      v24 = 0;
      if (v14)
      {
        *(_DWORD *)v13 = v14;
      }
      else
      {
        WTF::StringImpl::destroy(v13, v9);
        v12 = v26;
      }
    }
    else
    {
      v48 = 0;
    }
    v26 = 0;
    if (v12)
    {
      if (*(_DWORD *)v12 == 2)
        WTF::StringImpl::destroy(v12, v9);
      else
        *(_DWORD *)v12 -= 2;
    }
    v15 = v25[0];
    v25[0] = 0;
    if (v15)
    {
      if (*(_DWORD *)v15 == 2)
        WTF::StringImpl::destroy(v15, v9);
      else
        *(_DWORD *)v15 -= 2;
    }
    v16 = v28;
    v28 = 0;
    if (v16)
    {
      if (*(_DWORD *)v16 == 2)
        WTF::StringImpl::destroy(v16, v9);
      else
        *(_DWORD *)v16 -= 2;
    }
    v17 = v27[0];
    v27[0] = 0;
    if (v17)
    {
      if (*(_DWORD *)v17 == 2)
        WTF::StringImpl::destroy(v17, v9);
      else
        *(_DWORD *)v17 -= 2;
    }
    m_ptr = self->_page.m_ptr;
    MEMORY[0x19AEABCC8](&v23, objc_msgSend(a3, "sourceDescription"));
    MEMORY[0x19AEABCC8](&v22, objc_msgSend(a3, "purchaser"));
    WebKit::WebPageProxy::setPrivateClickMeasurement((uint64_t)m_ptr, v29, &v23, &v22);
    v20 = v22;
    v22 = 0;
    if (v20)
    {
      if (*(_DWORD *)v20 == 2)
        WTF::StringImpl::destroy(v20, v19);
      else
        *(_DWORD *)v20 -= 2;
    }
    v21 = v23;
    v23 = 0;
    if (v21)
    {
      if (*(_DWORD *)v21 == 2)
        WTF::StringImpl::destroy(v21, v19);
      else
        *(_DWORD *)v21 -= 2;
    }
    WebCore::PrivateClickMeasurement::~PrivateClickMeasurement((WebCore::PrivateClickMeasurement *)v29, v19);
  }
  else
  {
    std::__optional_destruct_base<WebKit::PrivateClickMeasurementAndMetadata,false>::reset[abi:sn180100]((WebCore::PrivateClickMeasurement *)(*((_QWORD *)self->_page.m_ptr + 4) + 1336), (WTF::StringImpl *)a2);
  }
}

- (CGRect)_contentVisibleRect
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGRect result;

  -[WKWebView bounds](self, "bounds");
  -[WKWebView convertRect:toView:](self, "convertRect:toView:", -[WKWebView _currentContentView](self, "_currentContentView"), v3, v4, v5, v6);
  result.size.height = v10;
  result.size.width = v9;
  result.origin.y = v8;
  result.origin.x = v7;
  return result;
}

- (CGSize)_minimumLayoutSizeOverride
{
  optional<OverriddenLayoutParameters> *p_overriddenLayoutParameters;
  double width;
  double height;
  CGSize result;

  p_overriddenLayoutParameters = &self->_overriddenLayoutParameters;
  if (!self->_overriddenLayoutParameters.__engaged_)
    p_overriddenLayoutParameters = (optional<OverriddenLayoutParameters> *)MEMORY[0x1E0C9D820];
  width = p_overriddenLayoutParameters->var0.__val_.viewLayoutSize.width;
  height = p_overriddenLayoutParameters->var0.__val_.viewLayoutSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (CGSize)_minimumUnobscuredSizeOverride
{
  CGFloat *p_height;
  CGSize *p_minimumUnobscuredSize;
  double v4;
  double width;
  CGSize result;

  p_height = &self->_overriddenLayoutParameters.var0.__val_.minimumUnobscuredSize.height;
  if (self->_overriddenLayoutParameters.__engaged_)
    p_minimumUnobscuredSize = &self->_overriddenLayoutParameters.var0.__val_.minimumUnobscuredSize;
  else
    p_minimumUnobscuredSize = (CGSize *)MEMORY[0x1E0C9D820];
  if (!self->_overriddenLayoutParameters.__engaged_)
    p_height = (CGFloat *)(MEMORY[0x1E0C9D820] + 8);
  v4 = *p_height;
  width = p_minimumUnobscuredSize->width;
  result.height = v4;
  result.width = width;
  return result;
}

- (CGSize)_maximumUnobscuredSizeOverride
{
  CGFloat *p_height;
  CGSize *p_maximumUnobscuredSize;
  double v4;
  double width;
  CGSize result;

  p_height = &self->_overriddenLayoutParameters.var0.__val_.maximumUnobscuredSize.height;
  if (self->_overriddenLayoutParameters.__engaged_)
    p_maximumUnobscuredSize = &self->_overriddenLayoutParameters.var0.__val_.maximumUnobscuredSize;
  else
    p_maximumUnobscuredSize = (CGSize *)MEMORY[0x1E0C9D820];
  if (!self->_overriddenLayoutParameters.__engaged_)
    p_height = (CGFloat *)(MEMORY[0x1E0C9D820] + 8);
  v4 = *p_height;
  width = p_maximumUnobscuredSize->width;
  result.height = v4;
  result.width = width;
  return result;
}

- (unint64_t)_obscuredInsetEdgesAffectedBySafeArea
{
  return self->_obscuredInsetEdgesAffectedBySafeArea;
}

- (void)_setObscuredInsetEdgesAffectedBySafeArea:(unint64_t)a3
{
  if (self->_obscuredInsetEdgesAffectedBySafeArea != a3)
  {
    self->_obscuredInsetEdgesAffectedBySafeArea = a3;
    -[WKWebView _scheduleVisibleContentRectUpdate](self, "_scheduleVisibleContentRectUpdate");
  }
}

- (UIEdgeInsets)_unobscuredSafeAreaInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_unobscuredSafeAreaInsets.top;
  left = self->_unobscuredSafeAreaInsets.left;
  bottom = self->_unobscuredSafeAreaInsets.bottom;
  right = self->_unobscuredSafeAreaInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (int64_t)_interfaceOrientationOverride
{
  return self->_interfaceOrientationOverride;
}

- (void)_clearInterfaceOrientationOverride
{
  self->_overridesInterfaceOrientation = 0;
  self->_interfaceOrientationOverride = 1;
}

- (NSData)_dataForDisplayedPDF
{
  if (-[WKWebView _isDisplayingPDF](self, "_isDisplayingPDF"))
    return (NSData *)objc_msgSend(self->_customContentView.m_ptr, "web_dataRepresentation");
  else
    return 0;
}

- (NSString)_suggestedFilenameForDisplayedPDF
{
  if (-[WKWebView _isDisplayingPDF](self, "_isDisplayingPDF"))
    return (NSString *)objc_msgSend(self->_customContentView.m_ptr, "web_suggestedFilename");
  else
    return 0;
}

- (void)_setDragInteractionPolicy:(unint64_t)a3
{
  if (self->_dragInteractionPolicy != a3)
  {
    self->_dragInteractionPolicy = a3;
    objc_msgSend(self->_contentView.m_ptr, "_didChangeDragInteractionPolicy");
  }
}

- (BOOL)_shouldAvoidResizingWhenInputViewBoundsChange
{
  return objc_msgSend(self->_contentView.m_ptr, "_shouldAvoidResizingWhenInputViewBoundsChange");
}

- (CGRect)_uiTextCaretRect
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  v2 = *MEMORY[0x1E0C9D648];
  v3 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v4 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (CGPoint)_convertPointFromContentsToView:(CGPoint)a3
{
  double v3;
  double v4;
  CGPoint result;

  -[WKWebView convertPoint:fromView:](self, "convertPoint:fromView:", -[WKWebView _currentContentView](self, "_currentContentView"), a3.x, a3.y);
  result.y = v4;
  result.x = v3;
  return result;
}

- (CGPoint)_convertPointFromViewToContents:(CGPoint)a3
{
  double v3;
  double v4;
  CGPoint result;

  -[WKWebView convertPoint:toView:](self, "convertPoint:toView:", -[WKWebView _currentContentView](self, "_currentContentView"), a3.x, a3.y);
  result.y = v4;
  result.x = v3;
  return result;
}

- (void)_doAfterNextStablePresentationUpdate:(id)a3
{
  WTF::RunLoop *v5;
  void *v6;
  void *m_ptr;
  void *v8;
  _QWORD *v9;
  void *v10;
  void *v11;
  _QWORD *v12;

  v5 = (WTF::RunLoop *)-[WKWebView usesStandardContentView](self, "usesStandardContentView");
  if ((v5 & 1) != 0)
  {
    v6 = _Block_copy(a3);
    m_ptr = self->_stableStatePresentationUpdateCallbacks.m_ptr;
    if (m_ptr)
    {
      objc_msgSend(m_ptr, "addObject:", v6);
    }
    else
    {
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", v6, 0);
      v11 = self->_stableStatePresentationUpdateCallbacks.m_ptr;
      self->_stableStatePresentationUpdateCallbacks.m_ptr = v10;
      if (v11)
        CFRelease(v11);
      -[WKWebView _firePresentationUpdateForPendingStableStatePresentationCallbacks](self, "_firePresentationUpdateForPendingStableStatePresentationCallbacks");
    }
    _Block_release(v6);
  }
  else
  {
    WTF::RunLoop::main(v5);
    v8 = _Block_copy(a3);
    v9 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
    *v9 = off_1E34C5C70;
    v9[1] = v8;
    v12 = v9;
    WTF::RunLoop::dispatch();
    if (v12)
      (*(void (**)(_QWORD *))(*v12 + 8))(v12);
    _Block_release(0);
  }
}

- (void)_setFont:(id)a3 sender:(id)a4
{
  if (-[WKWebView usesStandardContentView](self, "usesStandardContentView"))
    objc_msgSend(self->_contentView.m_ptr, "_setFontForWebView:sender:", a3, a4);
}

- (void)_setFontSize:(double)a3 sender:(id)a4
{
  if (-[WKWebView usesStandardContentView](self, "usesStandardContentView"))
    objc_msgSend(self->_contentView.m_ptr, "_setFontSizeForWebView:sender:", a4, a3);
}

- (void)_setTextColor:(id)a3 sender:(id)a4
{
  if (-[WKWebView usesStandardContentView](self, "usesStandardContentView"))
    objc_msgSend(self->_contentView.m_ptr, "_setTextColorForWebView:sender:", a3, a4);
}

- (void)_detectDataWithTypes:(unint64_t)a3 completionHandler:(id)a4
{
  char v4;
  WebPageProxy *m_ptr;
  void *v7;
  WebPageProxy *v8;
  unsigned int **v9;
  unsigned int *v10;
  unsigned int v11;
  _QWORD *v12;
  uint64_t v13;
  _QWORD *v14;

  v4 = a3;
  m_ptr = self->_page.m_ptr;
  v7 = _Block_copy(a4);
  v8 = self->_page.m_ptr;
  if (v8)
  {
    v9 = (unsigned int **)((char *)v8 + 24);
    WTF::WeakPtrFactory<IPC::MessageReceiver,WTF::DefaultWeakPtrImpl>::initializeIfNeeded((unsigned int *)v8 + 6, (uint64_t)v8 + 16);
    v10 = *v9;
    if (v10)
    {
      do
        v11 = __ldaxr(v10);
      while (__stlxr(v11 + 1, v10));
    }
  }
  else
  {
    v10 = 0;
  }
  v12 = (_QWORD *)WTF::fastMalloc((WTF *)0x18);
  *v12 = off_1E34C5C98;
  v12[1] = v7;
  v12[2] = v10;
  v14 = v12;
  WebKit::WebPageProxy::detectDataInAllFrames((uint64_t)m_ptr, v4 & 0x7F, (uint64_t *)&v14);
  v13 = (uint64_t)v14;
  v14 = 0;
  if (v13)
    (*(void (**)(uint64_t))(*(_QWORD *)v13 + 8))(v13);
  _Block_release(0);
}

- (void)_requestActivatedElementAtPosition:(CGPoint)a3 completionBlock:(id)a4
{
  float v6;
  uint64_t v7;
  uint64_t v8;
  float v9;
  unint64_t v10;
  uint64_t v11;
  void *m_ptr;
  void *v13;
  _QWORD v14[4];
  void *aBlock;
  float v16[2];
  CGPoint v17;

  v17 = a3;
  WebCore::FloatPoint::FloatPoint((WebCore::FloatPoint *)v16, &v17);
  v6 = roundf(v16[0]);
  v7 = 0x80000000;
  if (v6 > -2147500000.0)
    v7 = (int)v6;
  if (v6 < 2147500000.0)
    v8 = v7;
  else
    v8 = 0x7FFFFFFFLL;
  v9 = roundf(v16[1]);
  v10 = 0x8000000000000000;
  if (v9 > -2147500000.0)
    v10 = (unint64_t)(int)v9 << 32;
  if (v9 < 2147500000.0)
    v11 = v10;
  else
    v11 = 0x7FFFFFFF00000000;
  m_ptr = self->_contentView.m_ptr;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3321888768;
  v14[2] = __78__WKWebView_WKPrivateIOS___requestActivatedElementAtPosition_completionBlock___block_invoke;
  v14[3] = &__block_descriptor_40_e8_32c92_ZTSKZ78__WKWebView_WKPrivateIOS___requestActivatedElementAtPosition_completionBlock__E4__24_e4285_v648__0_InteractionInformationAtPosition__InteractionInformationRequest__IntPoint_ii_BBBBBBB_B_optional_BOOL_____cB_B_CBBBBBBBBBBBBB_Markable_WebCore::ProcessQualified_WTF::ObjectIdentifierGeneric_WebCore::ScrollingNodeIDType__WTF::ObjectIdentifierMainThreadAccessTraits_uint64_t___unsigned_long_long____WebCore::ProcessQualified_WTF::ObjectIdentifierGeneric_WebCore::ScrollingNodeIDType__WTF::ObjectIdentifierMainThreadAccessTraits_uint64_t___unsigned_long_long__::MarkableTraits___ProcessQualified_WTF::ObjectIdentifierGeneric_WebCore::ScrollingNodeIDType__WTF::ObjectIdentifierMainThreadAccessTraits_uint64_t___unsigned_long_long____ObjectIdentifierGeneric_WebCore::ScrollingNodeIDType__WTF::ObjectIdentifierMainThreadAccessTraits_uint64_t___unsigned_long_long__Q__ObjectIdentifierGeneric_WebCore::ProcessIdentifierType__WTF::ObjectIdentifierMainThreadAccessTraits_uint64_t___unsigned_long_long__Q___BBBBBB_FloatPoint_ff__URL__String__RefPtr_WTF::StringImpl__WTF::RawPtrTraits_WTF::StringImpl___WTF::DefaultRefDerefTraits_WTF::StringImpl_____StringImpl___b1b1b1b3b26IIIIIII__URL__String__RefPtr_WTF::StringImpl__WTF::RawPtrTraits_WTF::StringImpl___WTF::DefaultRefDerefTraits_WTF::StringImpl_____StringImpl___b1b1b1b3b26IIIIIII__String__RefPtr_WTF::StringImpl__WTF::RawPtrTraits_WTF::StringImpl___WTF::DefaultRefDerefTraits_WTF::StringImpl_____StringImpl____String__RefPtr_WTF::StringImpl__WTF::RawPtrTraits_WTF::StringImpl___WTF::DefaultRefDerefTraits_WTF::StringImpl_____StringImpl____String__RefPtr_WTF::StringImpl__WTF::RawPtrTraits_WTF::StringImpl___WTF::DefaultRefDerefTraits_WTF::StringImpl_____StringImpl____IntRect__IntPoint_ii__IntSize_ii___RefPtr_WebCore::ShareableBitmap__WTF::RawPtrTraits_WebCore::ShareableBitmap___WTF::DefaultRefDerefTraits_WebCore::ShareableBitmap_____ShareableBitmap___String__RefPtr_WTF::StringImpl__WTF::RawPtrTraits_WTF::StringImpl___WTF::DefaultRefDerefTraits_WTF::StringImpl_____StringImpl____String__RefPtr_WTF::StringImpl__WTF::RawPtrTraits_WTF::StringImpl___WTF::DefaultRefDerefTraits_WTF::StringImpl_____StringImpl___f_FloatRect__FloatPoint_ff__FloatSize_ff___optional_WebCore::Cursor_____c_Cursor_C_RefPtr_WebCore::Image__WTF::RawPtrTraits_WebCore::Image___WTF::DefaultRefDerefTraits_WebCore::Image_____Image___IntPoint_ii__v__B__TextIndicatorData__FloatRect__FloatPoint_ff__FloatSize_ff___FloatRect__FloatPoint_ff__FloatSize_ff___FloatRect__FloatPoint_ff__FloatSize_ff___Vector_WebCore::FloatRect__0UL__WTF::CrashOnOverflow__16UL__WTF::FastMalloc____FloatRect_II_f_RefPtr_WebCore::Image__WTF::RawPtrTraits_WebCore::Image___WTF::DefaultRefDerefTraits_WebCore::Image_____Image___RefPtr_WebCore::Image__WTF::RawPtrTraits_WebCore::Image___WTF::DefaultRefDerefTraits_WebCore::Image_____Image___RefPtr_WebCore::Image__WTF::RawPtrTraits_WebCore::Image___WTF::DefaultRefDerefTraits_WebCore::Image_____Image___Color_Q_C_OptionSet_WebCore::TextIndicatorOption__S___String__RefPtr_WTF::StringImpl__WTF::RawPtrTraits_WTF::StringImpl___WTF::DefaultRefDerefTraits_WTF::StringImpl_____StringImpl____RetainPtr_NSArray___v__IntRect__IntPoint_ii__IntSize_ii___optional_WebCore::ElementContext_____c_ElementContext__FloatRect__FloatPoint_ff__FloatSize_ff___ObjectIdentifierGeneric_WebCore::PageIdentifierType__WTF::ObjectIdentifierMainThreadAccessTraits_uint64_t___unsigned_long_long__Q__ProcessQualified_WTF::UUID___UUID_T__ObjectIdentifierGeneric_WebCore::ProcessIdentifierType__WTF::ObjectIdentifierMainThreadAccessTraits_uint64_t___unsigned_long_long__Q___ObjectIdentifierGeneric_WebCore::ElementIdentifierType__WTF::ObjectIdentifierMainThreadAccessTraits_uint64_t___unsigned_long_long__Q___B__optional_WebCore::ElementContext_____c_ElementContext__FloatRect__FloatPoint_ff__FloatSize_ff___ObjectIdentifierGeneric_WebCore::PageIdentifierType__WTF::ObjectIdentifierMainThreadAccessTraits_uint64_t___unsigned_long_long__Q__ProcessQualified_WTF::UUID___UUID_T__ObjectIdentifierGeneric_WebCore::ProcessIdentifierType__WTF::ObjectIdentifierMainThreadAccessTraits_uint64_t___unsigned_long_long__Q___ObjectIdentifierGeneric_WebCore::ElementIdentifierType__WTF::ObjectIdentifierMainThreadAccessTraits_uint64_t___unsigned_long_long__Q___B__Vector_WebCore::ElementAnimationContext__0UL__WTF::CrashOnOverflow__16UL__WTF::FastMalloc____ElementAnimationContext_II__8l;
  v13 = _Block_copy(a4);
  aBlock = _Block_copy(v13);
  objc_msgSend(m_ptr, "doAfterPositionInformationUpdate:forRequest:", v14, v11 | v8, 16777217);
  _Block_release(v13);
  _Block_release(aBlock);
}

uint64_t __78__WKWebView_WKPrivateIOS___requestActivatedElementAtPosition_completionBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  +[_WKActivatedElementInfo activatedElementInfoWithInteractionInformationAtPosition:userInfo:](_WKActivatedElementInfo, "activatedElementInfoWithInteractionInformationAtPosition:userInfo:", a2, 0);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_beginInteractiveObscuredInsetsChange
{
  self->_isChangingObscuredInsetsInteractively = 1;
}

- (void)_endInteractiveObscuredInsetsChange
{
  self->_isChangingObscuredInsetsInteractively = 0;
  -[WKWebView _scheduleVisibleContentRectUpdate](self, "_scheduleVisibleContentRectUpdate");
}

- (void)_hideContentUntilNextUpdate
{
  uint64_t v2;

  v2 = *((_QWORD *)self->_page.m_ptr + 23);
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 176))(v2);
}

- (void)_endAnimatedResize
{
  NSObject *v3;
  uint64_t v4;
  int dynamicViewportUpdateMode;
  int v6;
  WKWebView *v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = qword_1ECE71A28;
  if (os_log_type_enabled((os_log_t)qword_1ECE71A28, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(*((_QWORD *)self->_page.m_ptr + 4) + 744);
    dynamicViewportUpdateMode = self->_perProcessState.dynamicViewportUpdateMode;
    v6 = 134218496;
    v7 = self;
    v8 = 2048;
    v9 = v4;
    v10 = 1024;
    v11 = dynamicViewportUpdateMode;
    _os_log_impl(&dword_196BCC000, v3, OS_LOG_TYPE_DEFAULT, "%p (pageProxyID=%llu) -[WKWebView _endAnimatedResize] dynamicViewportUpdateMode %d", (uint8_t *)&v6, 0x1Cu);
  }
  self->_perProcessState.waitingForEndAnimatedResize = 0;
  if (!self->_perProcessState.waitingForCommitAfterAnimatedResize)
    -[WKWebView _didCompleteAnimatedResize](self, "_didCompleteAnimatedResize");
}

- (void)_setSuppressSoftwareKeyboard:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WKWebView;
  -[WKWebView _setSuppressSoftwareKeyboard:](&v4, sel__setSuppressSoftwareKeyboard_, a3);
  objc_msgSend(self->_contentView.m_ptr, "updateSoftwareKeyboardSuppressionStateFromWebView");
}

- (void)_snapshotRectAfterScreenUpdates:(BOOL)a3 rectInViewCoordinates:(CGRect)a4 intoImageOfWidth:(double)a5 completionHandler:(id)a6
{
  double height;
  double width;
  double y;
  double x;
  _BOOL4 v12;
  void *v14;
  Vector<WTF::Function<void ()>, 0UL, WTF::CrashOnOverflow, 16UL, WTF::FastMalloc> *p_callbacksDeferredDuringResize;
  unint64_t m_size;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  _QWORD *m_buffer;
  uint64_t v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  const CGRect *v32;
  void *m_ptr;
  CGContext *CurrentContext;
  CGImage *v35;
  WebCore::DestinationColorSpace *v36;
  WebCore::IOSurface *v37;
  CGFloat m11;
  CFTypeRef v39;
  CFTypeRef v40;
  WebCore::IOSurface *v41;
  WTF *v42;
  void *v43;
  CGFloat v44;
  WebPageProxy *v45;
  uint64_t v46;
  double v47;
  CGFloat v48;
  float v49;
  uint64_t v50;
  uint64_t v51;
  float v52;
  unint64_t v53;
  uint64_t v54;
  void *v55;
  _QWORD *v56;
  uint64_t v57;
  WebCore::IOSurface *v58;
  WTF *v59;
  void *v60;
  double v61;
  double v62;
  _QWORD *v63;
  CFTypeRef cf;
  WebCore::IOSurface *v65;
  CFTypeRef v66;
  CATransform3D v67;
  CATransform3D v68;
  CATransform3D v69;
  CGSize v70;
  _QWORD v71[4];
  WebCore::IOSurface *v72;
  CGSize v73;
  CGRect v74;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v12 = a3;
  if (-[WKWebView _shouldDeferGeometryUpdates](self, "_shouldDeferGeometryUpdates"))
  {
    if (self)
      CFRetain(self);
    v14 = _Block_copy(a6);
    p_callbacksDeferredDuringResize = &self->_callbacksDeferredDuringResize;
    m_size = self->_callbacksDeferredDuringResize.m_size;
    if ((_DWORD)m_size == self->_callbacksDeferredDuringResize.m_capacity)
    {
      v17 = m_size + (m_size >> 2);
      if (v17 >= 0x10)
        v18 = v17 + 1;
      else
        v18 = 16;
      if (v18 <= m_size + 1)
        v19 = m_size + 1;
      else
        v19 = v18;
      WTF::Vector<WTF::Function<void ()(void)>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::reserveCapacity<(WTF::FailureAction)0>((uint64_t)&self->_callbacksDeferredDuringResize, v19);
      m_size = self->_callbacksDeferredDuringResize.m_size;
      m_buffer = p_callbacksDeferredDuringResize->m_buffer;
      v21 = WTF::fastMalloc((WTF *)0x48);
    }
    else
    {
      m_buffer = p_callbacksDeferredDuringResize->m_buffer;
      v21 = WTF::fastMalloc((WTF *)0x48);
    }
    *(_QWORD *)v21 = off_1E34C5CC0;
    *(_QWORD *)(v21 + 8) = self;
    *(_BYTE *)(v21 + 16) = v12;
    *(double *)(v21 + 24) = x;
    *(double *)(v21 + 32) = y;
    *(double *)(v21 + 40) = width;
    *(double *)(v21 + 48) = height;
    *(double *)(v21 + 56) = a5;
    *(_QWORD *)(v21 + 64) = v14;
    m_buffer[m_size] = v21;
    ++self->_callbacksDeferredDuringResize.m_size;
    _Block_release(0);
  }
  else
  {
    v61 = x;
    v62 = y;
    -[WKWebView convertRect:toView:](self, "convertRect:toView:", -[WKWebView _currentContentView](self, "_currentContentView"), x, y, width, height);
    v23 = v22;
    v25 = v24;
    v27 = v26;
    v29 = v28;
    *(double *)v71 = v22;
    *(double *)&v71[1] = v24;
    *(double *)&v71[2] = v26;
    *(double *)&v71[3] = v28;
    v30 = a5 / v26;
    v31 = v28 * (a5 / v26);
    v70.width = a5;
    v70.height = v31;
    if (objc_msgSend((id)objc_opt_class(), "web_requiresCustomSnapshotting"))
    {
      objc_msgSend(self->_customContentView.m_ptr, "web_snapshotRectInContentViewCoordinates:snapshotWidth:completionHandler:", a6, v23, v25, v27, v29, a5);
    }
    else if (objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)-[WKWebView window](self, "window"), "screen"), "displayConfiguration"), "name")&& (objc_msgSend((id)-[WKWebView window](self, "window"), "isHidden") & 1) == 0)
    {
      kdebug_trace();
      v36 = (WebCore::DestinationColorSpace *)WebCore::FloatSize::FloatSize((WebCore::FloatSize *)&v69, &v70);
      WebCore::DestinationColorSpace::SRGB(v36);
      WebCore::IOSurface::create();
      if (v72)
      {
        if (v12)
          objc_msgSend(MEMORY[0x1E0CD28B0], "synchronize");
        memset(&v69, 0, sizeof(v69));
        CATransform3DMakeScale(&v69, a5 / width, a5 / width, 1.0);
        v67 = v69;
        CATransform3DTranslate(&v68, &v67, -v61, -v62, 0.0);
        v69 = v68;
        objc_msgSend((id)objc_msgSend((id)-[WKWebView layer](self, "layer"), "context"), "contextId");
        -[WKWebView layer](self, "layer");
        CARenderServerRenderDisplayLayerWithTransformAndTimeOffset();
        WebCore::IOSurface::createPlatformContext(v72);
        v37 = v72;
        v72 = 0;
        m11 = v68.m11;
        v68.m11 = 0.0;
        cf = *(CFTypeRef *)&m11;
        v65 = v37;
        WebCore::IOSurface::sinkIntoImage();
        (*((void (**)(id, CFTypeRef))a6 + 2))(a6, v66);
        v39 = v66;
        v66 = 0;
        if (v39)
          CFRelease(v39);
        v40 = cf;
        cf = 0;
        if (v40)
          CFRelease(v40);
        v41 = v65;
        v65 = 0;
        if (v41)
        {
          WebCore::IOSurface::~IOSurface(v41);
          WTF::fastFree(v42, v43);
        }
        v44 = v68.m11;
        v68.m11 = 0.0;
        if (v44 != 0.0)
          CFRelease(*(CFTypeRef *)&v44);
      }
      else
      {
        (*((void (**)(id, _QWORD))a6 + 2))(a6, 0);
      }
      v58 = v72;
      v72 = 0;
      if (v58)
      {
        WebCore::IOSurface::~IOSurface(v58);
        WTF::fastFree(v59, v60);
      }
      kdebug_trace();
    }
    else if (self->_customContentView.m_ptr)
    {
      v73.width = a5;
      v73.height = v31;
      UIGraphicsBeginImageContextWithOptions(v73, 1, 1.0);
      m_ptr = self->_customContentView.m_ptr;
      objc_msgSend((id)objc_msgSend(m_ptr, "backgroundColor"), "set");
      v74.origin.x = 0.0;
      v74.origin.y = 0.0;
      v74.size.width = a5;
      v74.size.height = v31;
      UIRectFill(v74);
      CurrentContext = UIGraphicsGetCurrentContext();
      CGContextTranslateCTM(CurrentContext, -(v23 * v30), -(v25 * v30));
      CGContextScaleCTM(CurrentContext, v30, v30);
      objc_msgSend((id)objc_msgSend(m_ptr, "layer"), "renderInContext:", CurrentContext);
      v35 = -[UIImage CGImage](UIGraphicsGetImageFromCurrentImageContext(), "CGImage");
      (*((void (**)(id, CGImage *))a6 + 2))(a6, v35);
      UIGraphicsEndImageContext();
    }
    else
    {
      v45 = self->_page.m_ptr;
      v46 = WebCore::enclosingIntRect((WebCore *)v71, v32);
      v48 = v47;
      WebCore::FloatSize::FloatSize((WebCore::FloatSize *)&v66, &v70);
      v49 = ceilf(*(float *)&v66);
      v50 = 0x80000000;
      if (v49 > -2147500000.0)
        v50 = (int)v49;
      if (v49 < 2147500000.0)
        v51 = v50;
      else
        v51 = 0x7FFFFFFFLL;
      v52 = ceilf(*((float *)&v66 + 1));
      v53 = 0x8000000000000000;
      if (v52 > -2147500000.0)
        v53 = (unint64_t)(int)v52 << 32;
      if (v52 < 2147500000.0)
        v54 = v53;
      else
        v54 = 0x7FFFFFFF00000000;
      v55 = _Block_copy(a6);
      v56 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
      *v56 = off_1E34C5CE8;
      v56[1] = v55;
      v63 = v56;
      *(_QWORD *)&v68.m11 = v46;
      v68.m12 = v48;
      v72 = (WebCore::IOSurface *)(v54 | v51);
      *(_QWORD *)&v69.m11 = &v68;
      *(_QWORD *)&v69.m12 = &v72;
      LODWORD(v69.m13) = 32;
      WebKit::AuxiliaryProcessProxy::sendWithAsyncReply<Messages::WebPage::TakeSnapshot,WTF::CompletionHandler<void ()(std::optional<WebCore::ShareableBitmapHandle> &&)>>(*((_QWORD *)v45 + 26), (uint64_t **)&v69, (uint64_t *)&v63, *(_QWORD *)(*((_QWORD *)v45 + 4) + 1896), 0, 1);
      v57 = (uint64_t)v63;
      v63 = 0;
      if (v57)
        (*(void (**)(uint64_t))(*(_QWORD *)v57 + 8))(v57);
      _Block_release(0);
    }
  }
}

- (void)_snapshotRect:(CGRect)a3 intoImageOfWidth:(double)a4 completionHandler:(id)a5
{
  -[WKWebView _snapshotRectAfterScreenUpdates:rectInViewCoordinates:intoImageOfWidth:completionHandler:](self, "_snapshotRectAfterScreenUpdates:rectInViewCoordinates:intoImageOfWidth:completionHandler:", 0, a5, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4);
}

- (void)_overrideLayoutParametersWithMinimumLayoutSize:(CGSize)a3 maximumUnobscuredSizeOverride:(CGSize)a4
{
  -[WKWebView _overrideLayoutParametersWithMinimumLayoutSize:minimumUnobscuredSizeOverride:maximumUnobscuredSizeOverride:](self, "_overrideLayoutParametersWithMinimumLayoutSize:minimumUnobscuredSizeOverride:maximumUnobscuredSizeOverride:", a3.width, a3.height, a3.width, a3.height, a4.width, a4.height);
}

- (void)_clearOverrideLayoutParameters
{
  WebPageProxy *m_ptr;
  WebPageProxy *v4;
  WebPageProxy *v5;
  uint64_t v6;

  if (self->_overriddenLayoutParameters.__engaged_)
    self->_overriddenLayoutParameters.__engaged_ = 0;
  m_ptr = self->_page.m_ptr;
  v6 = 0;
  WebKit::WebPageProxy::setMinimumUnobscuredSize((uint64_t)m_ptr, (const WebCore::FloatSize *)&v6);
  v4 = self->_page.m_ptr;
  v6 = 0;
  WebKit::WebPageProxy::setDefaultUnobscuredSize((uint64_t)v4, (const WebCore::FloatSize *)&v6);
  v5 = self->_page.m_ptr;
  v6 = 0;
  WebKit::WebPageProxy::setMaximumUnobscuredSize((uint64_t)v5, (const WebCore::FloatSize *)&v6);
}

- (void)_overrideViewportWithArguments:(id)a3
{
  WebPageProxy *m_ptr;
  _QWORD *v10;
  _OWORD v11[3];
  uint64_t v12;
  char v13;
  _BYTE v14[56];

  m_ptr = self->_page.m_ptr;
  if (m_ptr)
  {
    if (a3)
    {
      v14[0] = 4;
      __asm { FMOV            V0.4S, #-1.0 }
      *(_OWORD *)&v14[4] = _Q0;
      *(_OWORD *)&v14[20] = _Q0;
      *(_OWORD *)&v14[36] = _Q0;
      *(_WORD *)&v14[52] = 0;
      v10 = malloc_type_malloc(0x28uLL, 0x10E0040274B6D37uLL);
      *v10 = MEMORY[0x1E0C809A0];
      v10[1] = 50331650;
      v10[2] = WTF::BlockPtr<void ()(NSString *,NSString *,BOOL *)>::fromCallable<viewportArgumentsFromDictionary(NSDictionary<NSString *,NSString *> *)::$_0>(viewportArgumentsFromDictionary(NSDictionary<NSString *,NSString *> *)::$_0)::{lambda(void *,NSString *,NSString *,BOOL *)#1}::__invoke;
      v10[3] = &WTF::BlockPtr<void ()(NSString *,NSString *,BOOL *)>::fromCallable<viewportArgumentsFromDictionary(NSDictionary<NSString *,NSString *> *)::$_0>(viewportArgumentsFromDictionary(NSDictionary<NSString *,NSString *> *)::$_0)::descriptor;
      v10[4] = v14;
      objc_msgSend(a3, "enumerateKeysAndObjectsUsingBlock:", v10);
      _Block_release(v10);
      v11[0] = *(_OWORD *)v14;
      v11[1] = *(_OWORD *)&v14[16];
      v11[2] = *(_OWORD *)&v14[32];
      v12 = *(_QWORD *)&v14[48];
      v13 = 1;
    }
    else
    {
      LOBYTE(v11[0]) = 0;
      v13 = 0;
    }
    WebKit::WebPageProxy::setOverrideViewportArguments((uint64_t)m_ptr, (uint64_t)v11);
  }
}

- (id)_viewForFindUI
{
  return -[WKWebView viewForZoomingInScrollView:](self, "viewForZoomingInScrollView:", -[WKWebView scrollView](self, "scrollView"));
}

- (void)_setOverlaidAccessoryViewsInset:(CGSize)a3
{
  objc_msgSend(self->_customContentView.m_ptr, "web_setOverlaidAccessoryViewsInset:", a3.width, a3.height);
}

- (id)_retainActiveFocusedState
{
  _QWORD v3[5];

  ++self->_activeFocusedStateRetainCount;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3321888768;
  v3[2] = __52__WKWebView_WKPrivateIOS___retainActiveFocusedState__block_invoke;
  v3[3] = &__block_descriptor_40_e8_32c66_ZTSKZ52__WKWebView_WKPrivateIOS___retainActiveFocusedState_E4__28_e5_v8__0l;
  v3[4] = self;
  return (id)(id)CFMakeCollectable((CFTypeRef)objc_msgSend(v3, "copy"));
}

uint64_t __52__WKWebView_WKPrivateIOS___retainActiveFocusedState__block_invoke(uint64_t result)
{
  --*(_QWORD *)(*(_QWORD *)(result + 32) + 1728);
  return result;
}

- (void)_becomeFirstResponderWithSelectionMovingForward:(BOOL)a3 completionHandler:(id)a4
{
  _BOOL8 v4;
  void *v6;
  void *m_ptr;
  _QWORD v8[5];

  v4 = a3;
  if (a4)
    v6 = _Block_copy(a4);
  else
    v6 = 0;
  m_ptr = self->_contentView.m_ptr;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3321888768;
  v8[2] = __93__WKWebView_WKPrivateIOS___becomeFirstResponderWithSelectionMovingForward_completionHandler___block_invoke;
  v8[3] = &__block_descriptor_40_e8_32c107_ZTSKZ93__WKWebView_WKPrivateIOS___becomeFirstResponderWithSelectionMovingForward_completionHandler__E4__29_e8_v12__0B8l;
  v8[4] = v6;
  objc_msgSend(m_ptr, "_becomeFirstResponderWithSelectionMovingForward:completionHandler:", v4, v8);
}

void __93__WKWebView_WKPrivateIOS___becomeFirstResponderWithSelectionMovingForward_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    (*(void (**)(void))(v2 + 16))();
    _Block_release(*(const void **)(a1 + 32));
  }
}

- (id)_snapshotLayerContentsForBackForwardListItem:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v8;
  WebPageProxy *m_ptr;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  WTF::StringImpl **v13;
  id result;

  v4 = *((_QWORD *)self->_page.m_ptr + 74);
  v5 = *(_QWORD *)(v4 + 16);
  if (!v5 || !*(_QWORD *)(v5 + 8) || !*(_BYTE *)(v4 + 48))
  {
    objc_msgSend(a3, "_item");
    goto LABEL_12;
  }
  v6 = *(_QWORD *)(v4 + 40);
  if (v6 >= *(unsigned int *)(v4 + 36))
    goto LABEL_20;
  v8 = *(_QWORD *)(*(_QWORD *)(v4 + 24) + 8 * v6);
  if (v8 != objc_msgSend(a3, "_item"))
    goto LABEL_12;
  m_ptr = self->_page.m_ptr;
  v10 = *((_QWORD *)m_ptr + 74);
  v11 = *(_QWORD *)(v10 + 16);
  if (v11 && *(_QWORD *)(v11 + 8) && *(_BYTE *)(v10 + 48))
  {
    v12 = *(_QWORD *)(v10 + 40);
    if (v12 < *(unsigned int *)(v10 + 36))
    {
      v13 = *(WTF::StringImpl ***)(*(_QWORD *)(v10 + 24) + 8 * v12);
      goto LABEL_16;
    }
LABEL_20:
    __break(0xC471u);
    JUMPOUT(0x19719D79CLL);
  }
  v13 = 0;
LABEL_16:
  if (*((_BYTE *)m_ptr + 855))
  {
    {
      byte_1ECE738C8 = 0;
      WebKit::ViewSnapshotStore::singleton(void)::store = 0u;
      *(_OWORD *)&qword_1ECE738B8 = 0u;
    }
    WebKit::ViewSnapshotStore::recordSnapshot((WebKit::ViewSnapshot *)&WebKit::ViewSnapshotStore::singleton(void)::store, (WebKit::WebPageProxy *)m_ptr, v13);
  }
LABEL_12:
  result = *(id *)(objc_msgSend(a3, "_item") + 336);
  if (result)
    return (id)WebKit::ViewSnapshot::asLayerContents((WebKit::ViewSnapshot *)result);
  return result;
}

- (id)_dataDetectionResults
{
  return (id)objc_msgSend(self->_contentView.m_ptr, "_dataDetectionResults");
}

- (void)_accessibilityRetrieveRectsAtSelectionOffset:(int64_t)a3 withText:(id)a4 completionHandler:(id)a5
{
  void *m_ptr;
  void *v8;
  _QWORD v9[4];
  void *aBlock;

  m_ptr = self->_contentView.m_ptr;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3321888768;
  v9[2] = __99__WKWebView_WKPrivateIOS___accessibilityRetrieveRectsAtSelectionOffset_withText_completionHandler___block_invoke;
  v9[3] = &__block_descriptor_40_e8_32c113_ZTSKZ99__WKWebView_WKPrivateIOS___accessibilityRetrieveRectsAtSelectionOffset_withText_completionHandler__E4__30_e10_v16__0r_v8l;
  v8 = _Block_copy(a5);
  aBlock = _Block_copy(v8);
  objc_msgSend(m_ptr, "_accessibilityRetrieveRectsAtSelectionOffset:withText:completionHandler:", a3, a4, v9);
  _Block_release(v8);
  _Block_release(aBlock);
}

void __99__WKWebView_WKPrivateIOS___accessibilityRetrieveRectsAtSelectionOffset_withText_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  unsigned int v5;
  WebCore::SelectionGeometry *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  if (*(_QWORD *)(a1 + 32))
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", *(unsigned int *)(a2 + 12));
    v5 = *(_DWORD *)(a2 + 12);
    if (v5)
    {
      v6 = *(WebCore::SelectionGeometry **)a2;
      v7 = 84 * v5;
      do
      {
        v8 = (void *)MEMORY[0x1E0CB3B18];
        v11 = WebCore::SelectionGeometry::rect(v6);
        v12 = v9;
        WebCore::IntRect::operator CGRect();
        v10 = objc_msgSend(v8, "valueWithCGRect:", v11, v12);
        if (v10)
          objc_msgSend(v4, "addObject:", v10);
        v6 = (WebCore::SelectionGeometry *)((char *)v6 + 84);
        v7 -= 84;
      }
      while (v7);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    if (v4)
      CFRelease(v4);
  }
}

- (void)_accessibilityStoreSelection
{
  objc_msgSend(self->_contentView.m_ptr, "_accessibilityStoreSelection");
}

- (void)_accessibilityClearSelection
{
  objc_msgSend(self->_contentView.m_ptr, "_accessibilityClearSelection");
}

- (void)_accessibilityRetrieveSpeakSelectionContent
{
  objc_msgSend(self->_contentView.m_ptr, "accessibilityRetrieveSpeakSelectionContent");
}

- (id)_fullScreenPlaceholderView
{
  return (id)objc_msgSend(self->_fullScreenWindowController.m_ptr, "webViewPlaceholder");
}

- (void)_willOpenAppLink
{
  unsigned int *m_ptr;

  m_ptr = (unsigned int *)self->_page.m_ptr;
  if (m_ptr)
    WebKit::WebPageProxy::willOpenAppLink(m_ptr);
}

- (void)_isNavigatingToAppBoundDomain:(id)a3
{
  WebPageProxy *m_ptr;
  void (**v4)(void *, _BOOL8);
  _QWORD *v5;
  _BOOL8 v6;

  m_ptr = self->_page.m_ptr;
  v4 = (void (**)(void *, _BOOL8))_Block_copy(a3);
  v5 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
  *v5 = off_1E34C5D10;
  v5[1] = v4;
  if (*((_BYTE *)m_ptr + 1257))
    v6 = *((_BYTE *)m_ptr + 1256) != 0;
  else
    v6 = 0;
  v4[2](v4, v6);
  (*(void (**)(_QWORD *))(*v5 + 8))(v5);
  _Block_release(0);
}

- (void)_isForcedIntoAppBoundMode:(id)a3
{
  WebPageProxy *m_ptr;
  void (**v4)(void *, _QWORD);
  _QWORD *v5;

  m_ptr = self->_page.m_ptr;
  v4 = (void (**)(void *, _QWORD))_Block_copy(a3);
  v5 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
  *v5 = off_1E34C5D38;
  v5[1] = v4;
  v4[2](v4, *((unsigned __int8 *)m_ptr + 1261));
  (*(void (**)(_QWORD *))(*v5 + 8))(v5);
  _Block_release(0);
}

- (BOOL)_findInteractionEnabled
{
  return self->_findInteractionEnabled;
}

- (_UIFindInteraction)_findInteraction
{
  return (_UIFindInteraction *)self->_findInteraction.m_ptr;
}

- (UITextRange)selectedTextRange
{
  return 0;
}

- (int64_t)offsetFromPosition:(id)a3 toPosition:(id)a4 inDocument:(id)a5
{
  return objc_msgSend(self->_contentView.m_ptr, "offsetFromPosition:toPosition:inDocument:", a3, a4, a5);
}

- (int64_t)compareFoundRange:(id)a3 toRange:(id)a4 inDocument:(id)a5
{
  return objc_msgSend(self->_contentView.m_ptr, "compareFoundRange:toRange:inDocument:", a3, a4, a5);
}

- (void)performTextSearchWithQueryString:(id)a3 usingOptions:(id)a4 resultAggregator:(id)a5
{
  objc_msgSend(-[WKWebView _searchableObject](self, "_searchableObject"), "performTextSearchWithQueryString:usingOptions:resultAggregator:", a3, a4, a5);
}

- (void)replaceFoundTextInRange:(id)a3 inDocument:(id)a4 withText:(id)a5
{
  objc_msgSend(self->_contentView.m_ptr, "replaceFoundTextInRange:inDocument:withText:", a3, a4, a5);
}

- (void)decorateFoundTextRange:(id)a3 inDocument:(id)a4 usingStyle:(int64_t)a5
{
  objc_msgSend(self->_contentView.m_ptr, "decorateFoundTextRange:inDocument:usingStyle:", a3, a4, a5);
}

- (void)scrollRangeToVisible:(id)a3 inDocument:(id)a4
{
  objc_msgSend(self->_contentView.m_ptr, "scrollRangeToVisible:inDocument:", a3, a4);
}

- (void)clearAllDecoratedFoundText
{
  objc_msgSend(self->_contentView.m_ptr, "clearAllDecoratedFoundText");
}

- (void)didBeginTextSearchOperation
{
  objc_msgSend(self->_contentView.m_ptr, "didBeginTextSearchOperation");
}

- (void)didEndTextSearchOperation
{
  objc_msgSend(self->_contentView.m_ptr, "didEndTextSearchOperation");
}

- (void)_requestRectForFoundTextRange:(id)a3 completionHandler:(id)a4
{
  objc_msgSend(self->_contentView.m_ptr, "requestRectForFoundTextRange:completionHandler:", a3, a4);
}

- (id)findInteraction:(id)a3 sessionForView:(id)a4
{
  return (id)(id)CFMakeCollectable((CFTypeRef)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAB00]), "initWithSearchableObject:", -[WKWebView _searchableObject](self, "_searchableObject")));
}

- (void)findInteraction:(id)a3 didBeginFindSession:(id)a4
{
  id v5;

  v5 = -[WKWebView _searchableObject](self, "_searchableObject", a3, a4);
  if (v5 == self->_contentView.m_ptr)
    objc_msgSend(v5, "didBeginTextSearchOperation");
}

- (void)findInteraction:(id)a3 didEndFindSession:(id)a4
{
  id v5;

  v5 = -[WKWebView _searchableObject](self, "_searchableObject", a3, a4);
  if (v5 == self->_contentView.m_ptr)
    objc_msgSend(v5, "didEndTextSearchOperation");
}

- (void)_addLayerForFindOverlay
{
  WebPageProxy *m_ptr;
  uint64_t v3;
  uint64_t v4;
  id location;
  uint64_t v6;
  char v7;

  m_ptr = self->_page.m_ptr;
  if (m_ptr
    && !self->_perProcessState.pendingFindLayerID.m_object.m_identifier
    && !self->_perProcessState.committedFindLayerID.m_object.m_identifier)
  {
    location = 0;
    objc_initWeak(&location, self);
    v3 = WTF::fastMalloc((WTF *)0x10);
    *(_QWORD *)v3 = off_1E34C5D60;
    *(_QWORD *)(v3 + 8) = 0;
    objc_moveWeak((id *)(v3 + 8), &location);
    v6 = v3;
    v7 = 0;
    WebKit::AuxiliaryProcessProxy::sendWithAsyncReply<Messages::WebPage::AddLayerForFindOverlay,WTF::CompletionHandler<void ()(WebCore::ProcessQualified<WTF::ObjectIdentifierGeneric<WebCore::PlatformLayerIdentifierType,WTF::ObjectIdentifierMainThreadAccessTraits<unsigned long long>,unsigned long long>>)>>(*((_QWORD *)m_ptr + 26), (uint64_t)&v7, &v6, *(_QWORD *)(*((_QWORD *)m_ptr + 4) + 1896), 0, 1);
    v4 = v6;
    v6 = 0;
    if (v4)
      (*(void (**)(uint64_t))(*(_QWORD *)v4 + 8))(v4);
    objc_destroyWeak(&location);
  }
}

- (void)_removeLayerForFindOverlay
{
  WebPageProxy *m_ptr;
  uint64_t v3;
  uint64_t v4;
  id location;
  uint64_t v6;
  char v7;

  if (self->_page.m_ptr
    && (self->_perProcessState.pendingFindLayerID.m_object.m_identifier
     || self->_perProcessState.committedFindLayerID.m_object.m_identifier))
  {
    self->_perProcessState.pendingFindLayerID = 0u;
    self->_perProcessState.committedFindLayerID = 0u;
    m_ptr = self->_page.m_ptr;
    location = 0;
    objc_initWeak(&location, self);
    v3 = WTF::fastMalloc((WTF *)0x10);
    *(_QWORD *)v3 = off_1E34C5D88;
    *(_QWORD *)(v3 + 8) = 0;
    objc_moveWeak((id *)(v3 + 8), &location);
    v6 = v3;
    v7 = 0;
    WebKit::AuxiliaryProcessProxy::sendWithAsyncReply<Messages::WebPage::RemoveLayerForFindOverlay,WTF::CompletionHandler<void ()(void)>>(*((_QWORD *)m_ptr + 26), (uint64_t)&v7, &v6, *(_QWORD *)(*((_QWORD *)m_ptr + 4) + 1896), 0, 1);
    v4 = v6;
    v6 = 0;
    if (v4)
      (*(void (**)(uint64_t))(*(_QWORD *)v4 + 8))(v4);
    objc_destroyWeak(&location);
  }
}

- (CALayer)_layerForFindOverlay
{
  WebPageProxy *m_ptr;
  uint64_t v3;
  uint64_t v4;
  unint64_t m_identifier;
  CALayer *result;
  _QWORD v7[2];

  m_ptr = self->_page.m_ptr;
  if (!m_ptr)
    return 0;
  if (!self->_perProcessState.committedFindLayerID.m_object.m_identifier)
    return 0;
  v3 = *((_QWORD *)m_ptr + 23);
  if (!v3)
    return 0;
  if (*(_BYTE *)(v3 + 32))
  {
    result = (CALayer *)96;
    __break(0xC471u);
  }
  else
  {
    v4 = *(_QWORD *)(v3 + 72);
    m_identifier = self->_perProcessState.committedFindLayerID.m_processIdentifier.m_identifier;
    v7[0] = self->_perProcessState.committedFindLayerID.m_object.m_identifier;
    v7[1] = m_identifier;
    result = (CALayer *)WTF::HashMap<WebCore::ProcessQualified<WTF::ObjectIdentifierGeneric<WebCore::PlatformLayerIdentifierType,WTF::ObjectIdentifierMainThreadAccessTraits<unsigned long long>,unsigned long long>>,std::unique_ptr<WebKit::RemoteLayerTreeNode>,WTF::DefaultHash<WebCore::ProcessQualified<WTF::ObjectIdentifierGeneric<WebCore::PlatformLayerIdentifierType,WTF::ObjectIdentifierMainThreadAccessTraits<unsigned long long>,unsigned long long>>>,WTF::HashTraits<WebCore::ProcessQualified<WTF::ObjectIdentifierGeneric<WebCore::PlatformLayerIdentifierType,WTF::ObjectIdentifierMainThreadAccessTraits<unsigned long long>,unsigned long long>>>,WTF::HashTraits<std::unique_ptr<WebKit::RemoteLayerTreeNode>>,WTF::HashTableTraits>::get<WTF::IdentityHashTranslator<WTF::HashMap<WebCore::ProcessQualified<WTF::ObjectIdentifierGeneric<WebCore::PlatformLayerIdentifierType,WTF::ObjectIdentifierMainThreadAccessTraits<unsigned long long>,unsigned long long>>,std::unique_ptr<WebKit::RemoteLayerTreeNode>,WTF::DefaultHash<WebCore::ProcessQualified<WTF::ObjectIdentifierGeneric<WebCore::PlatformLayerIdentifierType,WTF::ObjectIdentifierMainThreadAccessTraits<unsigned long long>,unsigned long long>>>,WTF::HashTraits<WebCore::ProcessQualified<WTF::ObjectIdentifierGeneric<WebCore::PlatformLayerIdentifierType,WTF::ObjectIdentifierMainThreadAccessTraits<unsigned long long>,unsigned long long>>>,WTF::HashTraits<std::unique_ptr<WebKit::RemoteLayerTreeNode>>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::DefaultHash<WebCore::ProcessQualified<WTF::ObjectIdentifierGeneric<WebCore::PlatformLayerIdentifierType,WTF::ObjectIdentifierMainThreadAccessTraits<unsigned long long>,unsigned long long>>>>,WebCore::ProcessQualified<WTF::ObjectIdentifierGeneric<WebCore::PlatformLayerIdentifierType,WTF::ObjectIdentifierMainThreadAccessTraits<unsigned long long>,unsigned long long>>>((uint64_t *)(v4 + 16), v7);
    if (result)
      return *(CALayer **)&result[1]._attr.refcount;
  }
  return result;
}

- (void)closeFullScreenWindowController
{
  void *m_ptr;
  void *v4;

  m_ptr = self->_fullScreenWindowController.m_ptr;
  if (m_ptr)
  {
    objc_msgSend(m_ptr, "close");
    v4 = self->_fullScreenWindowController.m_ptr;
    self->_fullScreenWindowController.m_ptr = 0;
    if (v4)
      CFRelease(v4);
  }
}

- (id)fullScreenWindowController
{
  id result;
  void *m_ptr;

  result = self->_fullScreenWindowController.m_ptr;
  if (!result)
  {
    result = -[WKFullScreenWindowController initWithWebView:]([WKFullScreenWindowController alloc], "initWithWebView:", self);
    m_ptr = self->_fullScreenWindowController.m_ptr;
    self->_fullScreenWindowController.m_ptr = result;
    if (m_ptr)
    {
      CFRelease(m_ptr);
      return self->_fullScreenWindowController.m_ptr;
    }
  }
  return result;
}

- (Class)_printFormatterClass
{
  return (Class)objc_opt_class();
}

- (_WKWebViewPrintProvider)_printProvider
{
  _WKWebViewPrintProvider *m_ptr;

  m_ptr = (_WKWebViewPrintProvider *)self->_customContentView.m_ptr;
  if (!m_ptr)
    m_ptr = (_WKWebViewPrintProvider *)self->_contentView.m_ptr;
  if (-[_WKWebViewPrintProvider conformsToProtocol:](m_ptr, "conformsToProtocol:", &unk_1EE389180))
    return m_ptr;
  else
    return 0;
}

- (void)_requestTextInputContextsInRect:(CGRect)a3 completionHandler:(id)a4
{
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *m_ptr;
  id v15;
  void *aBlock;
  _QWORD v17[4];
  id v18;
  void *v19;

  -[WKWebView convertRect:toView:](self, "convertRect:toView:", self->_contentView.m_ptr, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  m_ptr = self->_contentView.m_ptr;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3321888768;
  v17[2] = __77__WKWebView_WKTestingIOS___requestTextInputContextsInRect_completionHandler___block_invoke;
  v17[3] = &__block_descriptor_48_e8_32c91_ZTSKZ77__WKWebView_WKTestingIOS___requestTextInputContextsInRect_completionHandler__E4__38_e17_v16__0__NSArray_8l;
  v15 = 0;
  objc_initWeak(&v15, self);
  aBlock = _Block_copy(a4);
  v18 = 0;
  objc_copyWeak(&v18, &v15);
  v19 = _Block_copy(aBlock);
  objc_msgSend(m_ptr, "_requestTextInputContextsInRect:completionHandler:", v17, v7, v9, v11, v13);
  _Block_release(aBlock);
  objc_destroyWeak(&v15);
  _Block_release(v19);
  objc_destroyWeak(&v18);
}

void __77__WKWebView_WKTestingIOS___requestTextInputContextsInRect_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  _QWORD *WeakRetained;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _OWORD *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  id v17;
  CGRect v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _OWORD v24[5];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && objc_msgSend(a2, "count"))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(a2, "count"));
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v6 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v21;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v21 != v7)
            objc_enumerationMutation(a2);
          v9 = (_OWORD *)objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v8), "_textInputContext");
          v24[0] = *v9;
          v10 = v9[1];
          v11 = v9[2];
          v12 = v9[4];
          v24[3] = v9[3];
          v24[4] = v12;
          v24[1] = v10;
          v24[2] = v11;
          WebCore::FloatRect::operator CGRect();
          objc_msgSend(WeakRetained, "convertRect:fromView:", WeakRetained[77]);
          v18.origin.x = v13;
          v18.origin.y = v14;
          v18.size.width = v15;
          v18.size.height = v16;
          WebCore::FloatRect::FloatRect((WebCore::FloatRect *)&v19, &v18);
          v24[0] = v19;
          v17 = -[_WKTextInputContext _initWithTextInputContext:]([_WKTextInputContext alloc], "_initWithTextInputContext:", v24);
          objc_msgSend(v5, "addObject:", v17);
          if (v17)
            CFRelease(v17);
          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
      }
      while (v6);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    if (v5)
      CFRelease(v5);
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    if (!WeakRetained)
      return;
  }
  CFRelease(WeakRetained);
}

- (void)_focusTextInputContext:(id)a3 placeCaretAt:(CGPoint)a4 completionHandler:(id)a5
{
  -[WKWebView convertPoint:toView:](self, "convertPoint:toView:", self->_contentView.m_ptr, a4.x, a4.y);
  objc_msgSend(self->_contentView.m_ptr, "_focusTextInputContext:placeCaretAt:completionHandler:", a3, a5);
}

- (void)_willBeginTextInteractionInTextInputContext:(id)a3
{
  objc_msgSend(self->_contentView.m_ptr, "_willBeginTextInteractionInTextInputContext:", a3);
}

- (void)selectWordBackwardForTesting
{
  objc_msgSend(self->_contentView.m_ptr, "selectWordBackwardForTesting");
}

- (void)_didFinishTextInteractionInTextInputContext:(id)a3
{
  objc_msgSend(self->_contentView.m_ptr, "_didFinishTextInteractionInTextInputContext:", a3);
}

- (BOOL)_mayContainEditableElementsInRect:(CGRect)a3
{
  WebKit *m_ptr;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  const WebCore::FloatRect *v8;
  CGRect v10;
  _BYTE _20[48];

  m_ptr = (WebKit *)self->_contentView.m_ptr;
  -[WKWebView convertRect:toView:](self, "convertRect:toView:", m_ptr, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v10.origin.x = v4;
  v10.origin.y = v5;
  v10.size.width = v6;
  v10.size.height = v7;
  WebCore::FloatRect::FloatRect((WebCore::FloatRect *)_20, &v10);
  return WebKit::mayContainEditableElementsInRect(m_ptr, (UIView *)_20, v8);
}

- (void)keyboardAccessoryBarNext
{
  objc_msgSend(self->_contentView.m_ptr, "accessoryTab:", 1);
}

- (void)keyboardAccessoryBarPrevious
{
  objc_msgSend(self->_contentView.m_ptr, "accessoryTab:", 0);
}

- (void)dismissFormAccessoryView
{
  objc_msgSend(self->_contentView.m_ptr, "dismissFormAccessoryView");
}

- (id)_filePickerAcceptedTypeIdentifiers
{
  return (id)objc_msgSend(self->_contentView.m_ptr, "filePickerAcceptedTypeIdentifiers");
}

- (void)_dismissFilePicker
{
  objc_msgSend(self->_contentView.m_ptr, "dismissFilePicker");
}

- (void)setTimePickerValueToHour:(int64_t)a3 minute:(int64_t)a4
{
  objc_msgSend(self->_contentView.m_ptr, "setTimePickerValueToHour:minute:", a3, a4);
}

- (double)timePickerValueHour
{
  double result;

  objc_msgSend(self->_contentView.m_ptr, "timePickerValueHour");
  return result;
}

- (double)timePickerValueMinute
{
  double result;

  objc_msgSend(self->_contentView.m_ptr, "timePickerValueMinute");
  return result;
}

- (void)selectFormAccessoryPickerRow:(int)a3
{
  objc_msgSend(self->_contentView.m_ptr, "selectFormAccessoryPickerRow:", a3);
}

- (BOOL)selectFormAccessoryHasCheckedItemAtRow:(int64_t)a3
{
  return objc_msgSend(self->_contentView.m_ptr, "selectFormAccessoryHasCheckedItemAtRow:", a3);
}

- (NSString)selectFormPopoverTitle
{
  return (NSString *)objc_msgSend(self->_contentView.m_ptr, "selectFormPopoverTitle");
}

- (void)setSelectedColorForColorPicker:(id)a3
{
  objc_msgSend(self->_contentView.m_ptr, "setSelectedColorForColorPicker:", a3);
}

- (void)_selectDataListOption:(int)a3
{
  objc_msgSend(self->_contentView.m_ptr, "_selectDataListOption:", a3);
}

- (BOOL)_isShowingDataListSuggestions
{
  return objc_msgSend(self->_contentView.m_ptr, "isShowingDataListSuggestions");
}

- (NSString)textContentTypeForTesting
{
  return (NSString *)objc_msgSend(self->_contentView.m_ptr, "textContentTypeForTesting");
}

- (NSString)formInputLabel
{
  return (NSString *)objc_msgSend(self->_contentView.m_ptr, "formInputLabel");
}

- (CGRect)_inputViewBoundsInWindow
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_inputViewBoundsInWindow.origin.x;
  y = self->_inputViewBoundsInWindow.origin.y;
  width = self->_inputViewBoundsInWindow.size.width;
  height = self->_inputViewBoundsInWindow.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (NSString)_uiViewTreeAsText
{
  WTF::StringImpl *v3;
  const __CFString *v4;
  WTF::StringImpl *v5;
  WTF::StringImpl *v6;
  WTF::StringImpl *v8;
  WTF::StringImpl *v9;
  WTF::StringImpl *v10;
  int v11;
  char v12;
  int v13;
  __int16 v14;
  int v15;

  v9 = 0;
  v10 = 0;
  v11 = 0;
  v12 = 1;
  v13 = 0;
  v14 = 256;
  v15 = 0;
  WTF::TextStream::startGroup((WTF::TextStream *)&v9);
  WTF::TextStream::operator<<();
  dumpUIView((WTF::TextStream *)&v9, &self->super);
  WTF::TextStream::endGroup((WTF::TextStream *)&v9);
  WTF::TextStream::release((WTF::TextStream *)&v9);
  if (v8)
  {
    v4 = (const __CFString *)WTF::StringImpl::operator NSString *();
    if (*(_DWORD *)v8 == 2)
      WTF::StringImpl::destroy(v8, v3);
    else
      *(_DWORD *)v8 -= 2;
  }
  else
  {
    v4 = &stru_1E351F1B8;
  }
  v5 = v10;
  v10 = 0;
  if (v5)
  {
    if (*(_DWORD *)v5 == 2)
      WTF::StringImpl::destroy(v5, v3);
    else
      *(_DWORD *)v5 -= 2;
  }
  v6 = v9;
  v9 = 0;
  if (v6)
  {
    if (*(_DWORD *)v6 == 2)
      WTF::StringImpl::destroy(v6, v3);
    else
      *(_DWORD *)v6 -= 2;
  }
  return &v4->isa;
}

- (id)_propertiesOfLayerWithID:(unint64_t)a3
{
  uint64_t v3;
  double v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  uint64_t v8;
  id result;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  double v16;
  void *v17;
  void *v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  double v91[16];
  _QWORD v92[16];
  _QWORD v93[16];
  _QWORD v94[16];
  _QWORD v95[16];
  _QWORD v96[2];
  _QWORD v97[2];
  _QWORD v98[2];
  _QWORD v99[2];
  _QWORD v100[4];
  _QWORD v101[4];
  _QWORD v102[14];
  _QWORD v103[16];

  v3 = MEMORY[0x1E0C80A78](self, a2, a3);
  v103[14] = *MEMORY[0x1E0C80C00];
  v5 = *(_QWORD *)(v3 + 424);
  v6 = *(_QWORD *)(v5 + 184);
  if (*(_BYTE *)(v6 + 32))
  {
    __break(0xC471u);
    JUMPOUT(0x19719F738);
  }
  v7 = *(double *)(*(_QWORD *)(v5 + 208) + 176);
  v8 = *(_QWORD *)(v6 + 72);
  v91[0] = v4;
  v91[1] = v7;
  if (v4 != 0.0)
  {
    result = (id)WTF::HashMap<WebCore::ProcessQualified<WTF::ObjectIdentifierGeneric<WebCore::PlatformLayerIdentifierType,WTF::ObjectIdentifierMainThreadAccessTraits<unsigned long long>,unsigned long long>>,std::unique_ptr<WebKit::RemoteLayerTreeNode>,WTF::DefaultHash<WebCore::ProcessQualified<WTF::ObjectIdentifierGeneric<WebCore::PlatformLayerIdentifierType,WTF::ObjectIdentifierMainThreadAccessTraits<unsigned long long>,unsigned long long>>>,WTF::HashTraits<WebCore::ProcessQualified<WTF::ObjectIdentifierGeneric<WebCore::PlatformLayerIdentifierType,WTF::ObjectIdentifierMainThreadAccessTraits<unsigned long long>,unsigned long long>>>,WTF::HashTraits<std::unique_ptr<WebKit::RemoteLayerTreeNode>>,WTF::HashTableTraits>::get<WTF::IdentityHashTranslator<WTF::HashMap<WebCore::ProcessQualified<WTF::ObjectIdentifierGeneric<WebCore::PlatformLayerIdentifierType,WTF::ObjectIdentifierMainThreadAccessTraits<unsigned long long>,unsigned long long>>,std::unique_ptr<WebKit::RemoteLayerTreeNode>,WTF::DefaultHash<WebCore::ProcessQualified<WTF::ObjectIdentifierGeneric<WebCore::PlatformLayerIdentifierType,WTF::ObjectIdentifierMainThreadAccessTraits<unsigned long long>,unsigned long long>>>,WTF::HashTraits<WebCore::ProcessQualified<WTF::ObjectIdentifierGeneric<WebCore::PlatformLayerIdentifierType,WTF::ObjectIdentifierMainThreadAccessTraits<unsigned long long>,unsigned long long>>>,WTF::HashTraits<std::unique_ptr<WebKit::RemoteLayerTreeNode>>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::DefaultHash<WebCore::ProcessQualified<WTF::ObjectIdentifierGeneric<WebCore::PlatformLayerIdentifierType,WTF::ObjectIdentifierMainThreadAccessTraits<unsigned long long>,unsigned long long>>>>,WebCore::ProcessQualified<WTF::ObjectIdentifierGeneric<WebCore::PlatformLayerIdentifierType,WTF::ObjectIdentifierMainThreadAccessTraits<unsigned long long>,unsigned long long>>>((uint64_t *)(v8 + 16), v91);
    if (!result)
      return result;
    v10 = (void *)*((_QWORD *)result + 5);
    if (v10)
    {
      v102[0] = CFSTR("bounds");
      v100[0] = CFSTR("x");
      v11 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v10, "bounds");
      v101[0] = objc_msgSend(v11, "numberWithDouble:");
      v100[1] = CFSTR("y");
      v12 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v10, "bounds");
      v101[1] = objc_msgSend(v12, "numberWithDouble:");
      v100[2] = CFSTR("width");
      v13 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v10, "bounds");
      v101[2] = objc_msgSend(v13, "numberWithDouble:", v14);
      v100[3] = CFSTR("height");
      v15 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v10, "bounds");
      v101[3] = objc_msgSend(v15, "numberWithDouble:", v16);
      v103[0] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v101, v100, 4);
      v102[1] = CFSTR("position");
      v98[0] = CFSTR("x");
      v17 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v10, "position");
      v99[0] = objc_msgSend(v17, "numberWithDouble:");
      v98[1] = CFSTR("y");
      v18 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v10, "position");
      v99[1] = objc_msgSend(v18, "numberWithDouble:", v19);
      v103[1] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v99, v98, 2);
      v102[2] = CFSTR("zPosition");
      v20 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v10, "zPosition");
      v103[2] = objc_msgSend(v20, "numberWithDouble:");
      v102[3] = CFSTR("anchorPoint");
      v96[0] = CFSTR("x");
      v21 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v10, "anchorPoint");
      v97[0] = objc_msgSend(v21, "numberWithDouble:");
      v96[1] = CFSTR("y");
      v22 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v10, "anchorPoint");
      v97[1] = objc_msgSend(v22, "numberWithDouble:", v23);
      v103[3] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v97, v96, 2);
      v102[4] = CFSTR("anchorPointZ");
      v24 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v10, "anchorPointZ");
      v103[4] = objc_msgSend(v24, "numberWithDouble:");
      v102[5] = CFSTR("transform");
      v94[0] = CFSTR("m11");
      v25 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v10, "transform");
      v95[0] = objc_msgSend(v25, "numberWithDouble:", v91[0]);
      v94[1] = CFSTR("m12");
      v26 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v10, "transform");
      v95[1] = objc_msgSend(v26, "numberWithDouble:", v90);
      v94[2] = CFSTR("m13");
      v27 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v10, "transform");
      v95[2] = objc_msgSend(v27, "numberWithDouble:", v89);
      v94[3] = CFSTR("m14");
      v28 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v10, "transform");
      v95[3] = objc_msgSend(v28, "numberWithDouble:", v88);
      v94[4] = CFSTR("m21");
      v29 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v10, "transform");
      v95[4] = objc_msgSend(v29, "numberWithDouble:", v87);
      v94[5] = CFSTR("m22");
      v30 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v10, "transform");
      v95[5] = objc_msgSend(v30, "numberWithDouble:", v86);
      v94[6] = CFSTR("m23");
      v31 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v10, "transform");
      v95[6] = objc_msgSend(v31, "numberWithDouble:", v85);
      v94[7] = CFSTR("m24");
      v32 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v10, "transform");
      v95[7] = objc_msgSend(v32, "numberWithDouble:", v84);
      v94[8] = CFSTR("m31");
      v33 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v10, "transform");
      v95[8] = objc_msgSend(v33, "numberWithDouble:", v83);
      v94[9] = CFSTR("m32");
      v34 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v10, "transform");
      v95[9] = objc_msgSend(v34, "numberWithDouble:", v82);
      v94[10] = CFSTR("m33");
      v35 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v10, "transform");
      v95[10] = objc_msgSend(v35, "numberWithDouble:", v81);
      v94[11] = CFSTR("m34");
      v36 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v10, "transform");
      v95[11] = objc_msgSend(v36, "numberWithDouble:", v80);
      v94[12] = CFSTR("m41");
      v37 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v10, "transform");
      v95[12] = objc_msgSend(v37, "numberWithDouble:", v79);
      v94[13] = CFSTR("m42");
      v38 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v10, "transform");
      v95[13] = objc_msgSend(v38, "numberWithDouble:", v78);
      v94[14] = CFSTR("m43");
      v39 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v10, "transform");
      v95[14] = objc_msgSend(v39, "numberWithDouble:", v77);
      v94[15] = CFSTR("m44");
      v40 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v10, "transform");
      v95[15] = objc_msgSend(v40, "numberWithDouble:", v76);
      v103[5] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v95, v94, 16);
      v102[6] = CFSTR("sublayerTransform");
      v92[0] = CFSTR("m11");
      v41 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v10, "sublayerTransform");
      v93[0] = objc_msgSend(v41, "numberWithDouble:", v75);
      v92[1] = CFSTR("m12");
      v42 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v10, "sublayerTransform");
      v93[1] = objc_msgSend(v42, "numberWithDouble:", v74);
      v92[2] = CFSTR("m13");
      v43 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v10, "sublayerTransform");
      v93[2] = objc_msgSend(v43, "numberWithDouble:", v73);
      v92[3] = CFSTR("m14");
      v44 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v10, "sublayerTransform");
      v93[3] = objc_msgSend(v44, "numberWithDouble:", v72);
      v92[4] = CFSTR("m21");
      v45 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v10, "sublayerTransform");
      v93[4] = objc_msgSend(v45, "numberWithDouble:", v71);
      v92[5] = CFSTR("m22");
      v46 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v10, "sublayerTransform");
      v93[5] = objc_msgSend(v46, "numberWithDouble:", v70);
      v92[6] = CFSTR("m23");
      v47 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v10, "sublayerTransform");
      v93[6] = objc_msgSend(v47, "numberWithDouble:", v69);
      v92[7] = CFSTR("m24");
      v48 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v10, "sublayerTransform");
      v93[7] = objc_msgSend(v48, "numberWithDouble:", v68);
      v92[8] = CFSTR("m31");
      v49 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v10, "sublayerTransform");
      v93[8] = objc_msgSend(v49, "numberWithDouble:", v67);
      v92[9] = CFSTR("m32");
      v50 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v10, "sublayerTransform");
      v93[9] = objc_msgSend(v50, "numberWithDouble:", v66);
      v92[10] = CFSTR("m33");
      v51 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v10, "sublayerTransform");
      v93[10] = objc_msgSend(v51, "numberWithDouble:", v65);
      v92[11] = CFSTR("m34");
      v52 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v10, "sublayerTransform");
      v93[11] = objc_msgSend(v52, "numberWithDouble:", v64);
      v92[12] = CFSTR("m41");
      v53 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v10, "sublayerTransform");
      v93[12] = objc_msgSend(v53, "numberWithDouble:", v63);
      v92[13] = CFSTR("m42");
      v54 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v10, "sublayerTransform");
      v93[13] = objc_msgSend(v54, "numberWithDouble:", v62);
      v92[14] = CFSTR("m43");
      v55 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v10, "sublayerTransform");
      v93[14] = objc_msgSend(v55, "numberWithDouble:", v61);
      v92[15] = CFSTR("m44");
      v56 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v10, "sublayerTransform");
      v93[15] = objc_msgSend(v56, "numberWithDouble:", v60);
      v103[6] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v93, v92, 16);
      v102[7] = CFSTR("hidden");
      v103[7] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v10, "isHidden"));
      v102[8] = CFSTR("doubleSided");
      v103[8] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v10, "isDoubleSided"));
      v102[9] = CFSTR("masksToBounds");
      v103[9] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v10, "masksToBounds"));
      v102[10] = CFSTR("contentsScale");
      v57 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v10, "contentsScale");
      v103[10] = objc_msgSend(v57, "numberWithDouble:");
      v102[11] = CFSTR("rasterizationScale");
      v58 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v10, "rasterizationScale");
      v103[11] = objc_msgSend(v58, "numberWithDouble:");
      v102[12] = CFSTR("opaque");
      v103[12] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v10, "isOpaque"));
      v102[13] = CFSTR("opacity");
      v59 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v10, "opacity");
      v103[13] = objc_msgSend(v59, "numberWithFloat:");
      return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v103, v102, 14);
    }
  }
  return 0;
}

- (void)_doAfterReceivingEditDragSnapshotForTesting:(id)a3
{
  objc_msgSend(self->_contentView.m_ptr, "_doAfterReceivingEditDragSnapshotForTesting:", a3);
}

- (CGRect)_dragCaretRect
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  WebCore::IntRect::operator CGRect();
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (BOOL)_isAnimatingDragCancel
{
  return objc_msgSend(self->_contentView.m_ptr, "isAnimatingDragCancel");
}

- (CGRect)_tapHighlightViewRect
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  objc_msgSend(self->_contentView.m_ptr, "tapHighlightViewRect");
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (UIGestureRecognizer)_imageAnalysisGestureRecognizer
{
  return (UIGestureRecognizer *)objc_msgSend(self->_contentView.m_ptr, "imageAnalysisGestureRecognizer");
}

- (UITapGestureRecognizer)_singleTapGestureRecognizer
{
  return (UITapGestureRecognizer *)objc_msgSend(self->_contentView.m_ptr, "singleTapGestureRecognizer");
}

- (BOOL)_isKeyboardScrollingAnimationRunning
{
  return objc_msgSend(self->_contentView.m_ptr, "isKeyboardScrollingAnimationRunning");
}

- (void)_simulateElementAction:(int64_t)a3 atLocation:(CGPoint)a4
{
  objc_msgSend(self->_contentView.m_ptr, "_simulateElementAction:atLocation:", a3, a4.x, a4.y);
}

- (void)_simulateLongPressActionAtLocation:(CGPoint)a3
{
  objc_msgSend(self->_contentView.m_ptr, "_simulateLongPressActionAtLocation:", a3.x, a3.y);
}

- (void)_simulateTextEntered:(id)a3
{
  objc_msgSend(self->_contentView.m_ptr, "_simulateTextEntered:", a3);
}

- (void)_triggerSystemPreviewActionOnElement:(unint64_t)a3 document:(id)a4 page:(unint64_t)a5
{
  WebPageProxy *m_ptr;
  WebKit::SystemPreviewController *v6;

  m_ptr = self->_page.m_ptr;
  if (m_ptr)
  {
    v6 = (WebKit::SystemPreviewController *)*((_QWORD *)m_ptr + 51);
    if (v6)
      WebKit::SystemPreviewController::triggerSystemPreviewActionWithTargetForTesting(v6, a3, (NSString *)a4, a5);
  }
}

- (void)_setDeviceOrientationUserPermissionHandlerForTesting:(id)a3
{
  void *v4;
  _QWORD *v5;
  WebPageProxy *m_ptr;
  uint64_t v7;

  if (a3)
  {
    v4 = _Block_copy(a3);
    v5 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
    *v5 = off_1E34C5DB0;
    v5[1] = v4;
    _Block_release(0);
  }
  else
  {
    v5 = 0;
  }
  m_ptr = self->_page.m_ptr;
  v7 = *((_QWORD *)m_ptr + 128);
  *((_QWORD *)m_ptr + 128) = v5;
  if (v7)
    (*(void (**)(uint64_t))(*(_QWORD *)v7 + 8))(v7);
}

- (void)_setDeviceHasAGXCompilerServiceForTesting
{
  if (self->_page.m_ptr)
    WebCore::setDeviceHasAGXCompilerServiceForTesting((WebCore *)self);
}

- (void)_resetObscuredInsetsForTesting
{
  if (-[WKWebView _haveSetObscuredInsets](self, "_haveSetObscuredInsets"))
    -[WKWebView _resetObscuredInsets](self, "_resetObscuredInsets");
}

- (BOOL)_hasResizeAssertion
{
  return self->_resizeAssertions.m_size != 0;
}

- (void)_simulateSelectionStart
{
  objc_msgSend(self->_contentView.m_ptr, "_simulateSelectionStart");
}

- (void)_doAfterNextVisibleContentRectAndStablePresentationUpdate:(id)a3
{
  void *v5;
  _QWORD *v6;

  if (self)
    CFRetain(self);
  v5 = _Block_copy(a3);
  v6 = malloc_type_malloc(0x30uLL, 0x10E0040A6CB5C9CuLL);
  *v6 = MEMORY[0x1E0C809A0];
  v6[1] = 50331650;
  v6[2] = WTF::BlockPtr<void ()(void)>::fromCallable<-[WKWebView(WKTestingIOS) _doAfterNextVisibleContentRectAndStablePresentationUpdate:]::$_35>(-[WKWebView(WKTestingIOS) _doAfterNextVisibleContentRectAndStablePresentationUpdate:]::$_35)::{lambda(void *)#1}::__invoke;
  v6[3] = &WTF::BlockPtr<void ()(void)>::fromCallable<-[WKWebView(WKTestingIOS) _doAfterNextVisibleContentRectAndStablePresentationUpdate:]::$_35>(-[WKWebView(WKTestingIOS) _doAfterNextVisibleContentRectAndStablePresentationUpdate:]::$_35)::descriptor;
  v6[4] = self;
  v6[5] = v5;
  _Block_release(0);
  -[WKWebView _doAfterNextVisibleContentRectUpdate:](self, "_doAfterNextVisibleContentRectUpdate:", v6);
  _Block_release(v6);
  _Block_release(0);
}

@end
