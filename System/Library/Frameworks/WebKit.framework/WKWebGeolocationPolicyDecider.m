@implementation WKWebGeolocationPolicyDecider

+ (id)sharedPolicyDecider
{
  id result;

  result = (id)+[WKWebGeolocationPolicyDecider sharedPolicyDecider]::policyDecider;
  if (!+[WKWebGeolocationPolicyDecider sharedPolicyDecider]::policyDecider)
  {
    result = objc_alloc_init(WKWebGeolocationPolicyDecider);
    +[WKWebGeolocationPolicyDecider sharedPolicyDecider]::policyDecider = (uint64_t)result;
  }
  return result;
}

- (WKWebGeolocationPolicyDecider)init
{
  WKWebGeolocationPolicyDecider *v2;
  dispatch_queue_t v3;
  void *m_ptr;
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WKWebGeolocationPolicyDecider;
  v2 = -[WKWebGeolocationPolicyDecider init](&v7, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.WebKit.WKWebGeolocationPolicyDecider", 0);
    m_ptr = v2->_diskDispatchQueue.m_ptr;
    v2->_diskDispatchQueue.m_ptr = v3;
    if (m_ptr)
      CFRelease(m_ptr);
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)clearGeolocationCache, CFSTR("com.apple.locationd.appreset"), 0, CFNotificationSuspensionBehaviorCoalesce);
  }
  return v2;
}

- (void)dealloc
{
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v4;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("com.apple.locationd.appreset"), 0);
  v4.receiver = self;
  v4.super_class = (Class)WKWebGeolocationPolicyDecider;
  -[WKWebGeolocationPolicyDecider dealloc](&v4, sel_dealloc);
}

- (void)decidePolicyForGeolocationRequestFromOrigin:(const void *)a3 requestingURL:(id)a4 view:(id)a5 listener:(id)a6
{
  uint64_t v11;
  uint64_t v12;
  const __CFString *v13;
  const void *v14;
  const void *v15;
  const void *v16;
  const void *v17;
  unint64_t m_end;
  unint64_t m_start;
  uint64_t m_capacity;
  uint64_t v21;
  unint64_t v22;
  char *m_buffer;
  unsigned int v24;
  char *v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  void *v30;
  unint64_t v31;

  v11 = WTF::fastMalloc((WTF *)0x28);
  *(_OWORD *)v11 = 0u;
  *(_OWORD *)(v11 + 16) = 0u;
  *(_QWORD *)(v11 + 32) = 0;
  if (objc_msgSend(a4, "isFileURL"))
  {
    v12 = objc_msgSend(a4, "path");
    goto LABEL_5;
  }
  if (*(_QWORD *)WebCore::SecurityOriginData::host((WebCore::SecurityOriginData *)a3))
  {
    v12 = WTF::StringImpl::operator NSString *();
LABEL_5:
    v13 = (const __CFString *)v12;
    if (!v12)
      goto LABEL_7;
    goto LABEL_6;
  }
  v13 = &stru_1E351F1B8;
LABEL_6:
  CFRetain(v13);
LABEL_7:
  v14 = *(const void **)v11;
  *(_QWORD *)v11 = v13;
  if (v14)
    CFRelease(v14);
  if (a4)
    CFRetain(a4);
  v15 = *(const void **)(v11 + 16);
  *(_QWORD *)(v11 + 16) = a4;
  if (v15)
  {
    CFRelease(v15);
    if (!a5)
      goto LABEL_16;
    goto LABEL_15;
  }
  if (a5)
LABEL_15:
    CFRetain(a5);
LABEL_16:
  v16 = *(const void **)(v11 + 24);
  *(_QWORD *)(v11 + 24) = a5;
  if (v16)
    CFRelease(v16);
  if (a6)
    CFRetain(a6);
  v17 = *(const void **)(v11 + 32);
  *(_QWORD *)(v11 + 32) = a6;
  if (v17)
    CFRelease(v17);
  m_start = self->_challenges.m_start;
  m_end = self->_challenges.m_end;
  if (!m_start)
  {
    m_capacity = self->_challenges.m_buffer.m_capacity;
    if (m_end)
    {
      if (m_end != m_capacity - 1)
        goto LABEL_41;
    }
    else if ((_DWORD)m_capacity)
    {
      m_end = 0;
      goto LABEL_41;
    }
LABEL_30:
    v21 = m_capacity;
    v22 = ((unint64_t)m_capacity >> 2) + m_capacity;
    if (v22 <= 0xF)
      v22 = 15;
    if (v22 >= 0x1FFFFFFF)
    {
      __break(0xC471u);
      return;
    }
    m_buffer = (char *)self->_challenges.m_buffer.m_buffer;
    v24 = v22 + 1;
    v25 = (char *)WTF::fastMalloc((WTF *)(8 * (v22 + 1)));
    self->_challenges.m_buffer.m_capacity = v24;
    self->_challenges.m_buffer.m_buffer = v25;
    v26 = self->_challenges.m_start;
    v27 = self->_challenges.m_end;
    if (v26 <= v27)
    {
      memcpy(&v25[8 * v26], &m_buffer[8 * v26], 8 * v27 - 8 * v26);
      if (!m_buffer)
      {
LABEL_40:
        m_end = self->_challenges.m_end;
        goto LABEL_41;
      }
    }
    else
    {
      memcpy(v25, m_buffer, 8 * v27);
      v28 = self->_challenges.m_start;
      v29 = v28 - v21 + self->_challenges.m_buffer.m_capacity;
      memcpy((char *)self->_challenges.m_buffer.m_buffer + 8 * v29, &m_buffer[8 * v28], 8 * v21 - 8 * v28);
      self->_challenges.m_start = v29;
      if (!m_buffer)
        goto LABEL_40;
    }
    if (self->_challenges.m_buffer.m_buffer == m_buffer)
    {
      self->_challenges.m_buffer.m_buffer = 0;
      self->_challenges.m_buffer.m_capacity = 0;
    }
    WTF::fastFree((WTF *)m_buffer, v30);
    goto LABEL_40;
  }
  if (m_end + 1 == m_start)
  {
    LODWORD(m_capacity) = self->_challenges.m_buffer.m_capacity;
    goto LABEL_30;
  }
LABEL_41:
  *((_QWORD *)self->_challenges.m_buffer.m_buffer + m_end) = v11;
  if (m_end == self->_challenges.m_buffer.m_capacity - 1)
    v31 = 0;
  else
    v31 = m_end + 1;
  self->_challenges.m_end = v31;
  -[WKWebGeolocationPolicyDecider _executeNextChallenge](self, "_executeNextChallenge");
}

- (void)_executeNextChallenge
{
  unint64_t m_start;
  _QWORD *m_buffer;
  PermissionRequest *v5;
  _QWORD *v6;
  WTF *v7;
  unint64_t v8;
  PermissionRequest *value;
  _QWORD v10[5];

  m_start = self->_challenges.m_start;
  if (m_start != self->_challenges.m_end && !self->_activeChallenge.__ptr_.__value_)
  {
    m_buffer = self->_challenges.m_buffer.m_buffer;
    v5 = (PermissionRequest *)m_buffer[m_start];
    m_buffer[m_start] = 0;
    v6 = self->_challenges.m_buffer.m_buffer;
    v7 = (WTF *)v6[m_start];
    v6[m_start] = 0;
    if (v7)
    {
      std::default_delete<PermissionRequest>::operator()[abi:sn180100](v7, (void *)a2);
      m_start = self->_challenges.m_start;
    }
    if (m_start == self->_challenges.m_buffer.m_capacity - 1)
      v8 = 0;
    else
      v8 = m_start + 1;
    self->_challenges.m_start = v8;
    value = self->_activeChallenge.__ptr_.__value_;
    self->_activeChallenge.__ptr_.__value_ = v5;
    if (value)
      std::default_delete<PermissionRequest>::operator()[abi:sn180100]((WTF *)value, (void *)a2);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __54__WKWebGeolocationPolicyDecider__executeNextChallenge__block_invoke;
    v10[3] = &unk_1E34BAF80;
    v10[4] = self;
    -[WKWebGeolocationPolicyDecider _loadWithCompletionHandler:](self, "_loadWithCompletionHandler:", v10);
  }
}

void __54__WKWebGeolocationPolicyDecider__executeNextChallenge__block_invoke(uint64_t a1)
{
  int v2;
  _QWORD **v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  WTF::StringImpl *v11;
  WebKit *v12;
  WTF::StringImpl *v13;
  void *v14;
  const __CFString *v15;
  _BOOL4 v16;
  void *v17;
  const __CFString *v18;
  WTF::StringImpl *v19;
  NSString *v20;
  WTF::StringImpl *v21;
  WTF::StringImpl *v22;
  const __CFString *v23;
  WTF::StringImpl *v24;
  WTF::StringImpl *v25;
  const __CFString *v26;
  WTF::StringImpl *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  WTF::StringImpl *v35;
  _QWORD v36[4];
  id v37;
  id location;
  _QWORD v39[4];
  id v40;
  WTF::StringImpl *v41;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 56) + 24), "_shouldBypassGeolocationPromptForTesting");
  v3 = *(_QWORD ***)(a1 + 32);
  if (v2)
    goto LABEL_4;
  v4 = objc_msgSend(v3, "_getChallengeCountFromHistoryForToken:requestingURL:", *v3[7], v3[7][2]);
  if (v4 >= 2)
  {
    v3 = *(_QWORD ***)(a1 + 32);
LABEL_4:
    v5 = 1;
LABEL_5:
    objc_msgSend(v3, "_finishActiveChallenge:", v5);
    return;
  }
  if (v4 <= -2)
  {
    v3 = *(_QWORD ***)(a1 + 32);
    v5 = 0;
    goto LABEL_5;
  }
  v6 = (void *)objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v8 = objc_msgSend(v6, "objectForInfoDictionaryKey:", *MEMORY[0x1E0C9AAC8]);
  if (!v8)
  {
    v8 = objc_msgSend(v6, "objectForInfoDictionaryKey:", *MEMORY[0x1E0C9AE88]);
    if (!v8)
    {
      v8 = objc_msgSend(v6, "objectForInfoDictionaryKey:", *MEMORY[0x1E0C9AE70]);
      if (!v8)
        v8 = objc_msgSend(v6, "bundleIdentifier");
    }
  }
  v9 = (void *)MEMORY[0x1E0CB3940];
  WebCore::localizedString((WebCore *)CFSTR("“%@” would like to use your current location."), v7);
  if (v41)
    v10 = (const __CFString *)WTF::StringImpl::operator NSString *();
  else
    v10 = &stru_1E351F1B8;
  v12 = (WebKit *)objc_msgSend(v9, "stringWithFormat:", v10, **(_QWORD **)(*(_QWORD *)(a1 + 32) + 56));
  v13 = v41;
  v41 = 0;
  if (v13)
  {
    if (*(_DWORD *)v13 == 2)
      WTF::StringImpl::destroy(v13, v11);
    else
      *(_DWORD *)v13 -= 2;
  }
  v14 = (void *)objc_msgSend(objc_alloc((Class)getCLLocationManagerClass()), "init");
  if (objc_msgSend(v14, "authorizationStatus") - 3 > 1)
  {
    v16 = 0;
    if (!v14)
      goto LABEL_23;
    goto LABEL_22;
  }
  v16 = objc_msgSend(v14, "accuracyAuthorization") == 0;
  if (v14)
LABEL_22:
    CFRelease(v14);
LABEL_23:
  v17 = (void *)MEMORY[0x1E0CB3940];
  if (v16)
  {
    WebCore::localizedString((WebCore *)CFSTR("This website will use your precise location because “%@” currently has access to your precise location."), v15);
    if (!v41)
    {
      v18 = &stru_1E351F1B8;
      goto LABEL_28;
    }
  }
  else
  {
    WebCore::localizedString((WebCore *)CFSTR("This website will use your approximate location because “%@” currently has access to your approximate location."), v15);
    if (!v41)
    {
      v18 = &stru_1E351F1B8;
      goto LABEL_28;
    }
  }
  v18 = (const __CFString *)WTF::StringImpl::operator NSString *();
LABEL_28:
  v20 = (NSString *)objc_msgSend(v17, "stringWithFormat:", v18, v8);
  v21 = v41;
  v41 = 0;
  if (v21)
  {
    if (*(_DWORD *)v21 == 2)
      WTF::StringImpl::destroy(v21, v19);
    else
      *(_DWORD *)v21 -= 2;
  }
  WebCore::localizedString((WebCore *)CFSTR("Allow"), (const __CFString *)v19);
  if (v41)
  {
    v23 = (const __CFString *)WTF::StringImpl::operator NSString *();
    v24 = v41;
    v41 = 0;
    if (*(_DWORD *)v24 == 2)
      WTF::StringImpl::destroy(v24, v22);
    else
      *(_DWORD *)v24 -= 2;
  }
  else
  {
    v23 = &stru_1E351F1B8;
  }
  WebCore::localizedString((WebCore *)CFSTR("Don’t Allow (website location dialog)"), (const __CFString *)v22);
  if (v41)
  {
    v26 = (const __CFString *)WTF::StringImpl::operator NSString *();
    v27 = v41;
    v41 = 0;
    if (*(_DWORD *)v27 == 2)
      WTF::StringImpl::destroy(v27, v25);
    else
      *(_DWORD *)v27 -= 2;
  }
  else
  {
    v26 = &stru_1E351F1B8;
  }
  WebKit::createUIAlertController(v12, v20, &v41);
  v28 = (void *)MEMORY[0x1E0CEA2E0];
  v29 = MEMORY[0x1E0C809B0];
  location = 0;
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3321888768;
  v39[2] = __54__WKWebGeolocationPolicyDecider__executeNextChallenge__block_invoke_2;
  v39[3] = &__block_descriptor_40_e8_32c72_ZTSKZZ54__WKWebGeolocationPolicyDecider__executeNextChallenge_EUb_E3__2_e23_v16__0__UIAlertAction_8l;
  objc_initWeak(&location, *(id *)(a1 + 32));
  v40 = 0;
  objc_copyWeak(&v40, &location);
  v30 = objc_msgSend(v28, "actionWithTitle:style:handler:", v26, 0, v39);
  objc_destroyWeak(&location);
  v31 = (void *)MEMORY[0x1E0CEA2E0];
  v36[0] = v29;
  v36[1] = 3321888768;
  v36[2] = __54__WKWebGeolocationPolicyDecider__executeNextChallenge__block_invoke_40;
  v36[3] = &__block_descriptor_40_e8_32c72_ZTSKZZ54__WKWebGeolocationPolicyDecider__executeNextChallenge_EUb_E3__3_e23_v16__0__UIAlertAction_8l;
  v32 = *(void **)(a1 + 32);
  location = 0;
  objc_initWeak(&location, v32);
  v37 = 0;
  objc_copyWeak(&v37, &location);
  v33 = objc_msgSend(v31, "actionWithTitle:style:handler:", v23, 0, v36);
  objc_destroyWeak(&location);
  -[WTF::StringImpl addAction:](v41, "addAction:", v30);
  -[WTF::StringImpl addAction:](v41, "addAction:", v33);
  v34 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 56) + 24), "_wk_viewControllerForFullScreenPresentation");
  objc_msgSend(v34, "presentViewController:animated:completion:", v41, 1, 0);
  objc_destroyWeak(&v37);
  objc_destroyWeak(&v40);
  v35 = v41;
  v41 = 0;
  if (v35)
    CFRelease(v35);
}

void __54__WKWebGeolocationPolicyDecider__executeNextChallenge__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  const void *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_finishActiveChallenge:", 0);
    CFRelease(v2);
  }
}

void __54__WKWebGeolocationPolicyDecider__executeNextChallenge__block_invoke_40(uint64_t a1)
{
  id WeakRetained;
  const void *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_finishActiveChallenge:", 1);
    CFRelease(v2);
  }
}

- (void)_finishActiveChallenge:(BOOL)a3
{
  PermissionRequest *value;
  _BOOL4 v4;
  uint64_t v6;
  void *v7;
  void *v8;
  PermissionRequest *v9;

  value = self->_activeChallenge.__ptr_.__value_;
  if (value)
  {
    v4 = a3;
    if (a3)
      v6 = 1;
    else
      v6 = -1;
    -[WKWebGeolocationPolicyDecider _addChallengeCount:forToken:requestingURL:](self, "_addChallengeCount:forToken:requestingURL:", v6, *(_QWORD *)value, *((_QWORD *)value + 2));
    v7 = (void *)*((_QWORD *)self->_activeChallenge.__ptr_.__value_ + 4);
    if (v4)
      objc_msgSend(v7, "allow");
    else
      objc_msgSend(v7, "deny");
    v9 = self->_activeChallenge.__ptr_.__value_;
    self->_activeChallenge.__ptr_.__value_ = 0;
    if (v9)
      std::default_delete<PermissionRequest>::operator()[abi:sn180100]((WTF *)v9, v8);
    -[WKWebGeolocationPolicyDecider _executeNextChallenge](self, "_executeNextChallenge");
  }
}

- (void)clearCache
{
  void *m_ptr;
  NSObject *v4;
  _QWORD block[5];

  m_ptr = self->_sites.m_ptr;
  self->_sites.m_ptr = 0;
  if (m_ptr)
    CFRelease(m_ptr);
  v4 = self->_diskDispatchQueue.m_ptr;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__WKWebGeolocationPolicyDecider_clearCache__block_invoke;
  block[3] = &unk_1E34BAF80;
  block[4] = self;
  dispatch_async(v4, block);
}

uint64_t __43__WKWebGeolocationPolicyDecider_clearCache__block_invoke(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "_web_removeFileOnlyAtPath:", objc_msgSend(*(id *)(a1 + 32), "_siteFile"));
}

- (id)_siteFileInContainerDirectory:(id)a3 creatingIntermediateDirectoriesIfNecessary:(BOOL)a4
{
  _BOOL4 v4;
  void *v5;

  v4 = a4;
  v5 = (void *)objc_msgSend(a3, "stringByAppendingPathComponent:", CFSTR("Library/WebKit"));
  if (v4)
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "_web_createDirectoryAtPathWithIntermediateDirectories:attributes:", v5, 0);
  return (id)objc_msgSend(v5, "stringByAppendingPathComponent:", CFSTR("GeolocationSitesV2.plist"));
}

- (id)_siteFile
{
  id result;

  result = (id)-[WKWebGeolocationPolicyDecider _siteFile]::sSiteFile;
  if (!-[WKWebGeolocationPolicyDecider _siteFile]::sSiteFile)
  {
    result = -[WKWebGeolocationPolicyDecider _siteFileInContainerDirectory:creatingIntermediateDirectoriesIfNecessary:](self, "_siteFileInContainerDirectory:creatingIntermediateDirectoriesIfNecessary:", NSHomeDirectory(), 1);
    -[WKWebGeolocationPolicyDecider _siteFile]::sSiteFile = (uint64_t)result;
  }
  return result;
}

- (void)_loadWithCompletionHandler:(id)a3
{
  NSObject *m_ptr;
  _QWORD v4[6];

  if (self->_sites.m_ptr)
  {
    (*((void (**)(id))a3 + 2))(a3);
  }
  else
  {
    m_ptr = self->_diskDispatchQueue.m_ptr;
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __60__WKWebGeolocationPolicyDecider__loadWithCompletionHandler___block_invoke;
    v4[3] = &unk_1E34CE300;
    v4[4] = self;
    v4[5] = a3;
    dispatch_async(m_ptr, v4);
  }
}

void __60__WKWebGeolocationPolicyDecider__loadWithCompletionHandler___block_invoke(uint64_t a1)
{
  const void *v2;
  const void *v3;
  void *v4;
  id v5;
  CFTypeRef v6;
  _QWORD block[6];
  CFTypeRef cf;
  uint64_t v9;
  uint64_t v10;

  v2 = (const void *)objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:options:error:", objc_msgSend(*(id *)(a1 + 32), "_siteFile"), 1, 0);
  v3 = v2;
  if (v2)
  {
    CFRetain(v2);
    v9 = 200;
    v10 = 0;
    v4 = (void *)objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v3, 2, &v9, &v10);
    v5 = v4;
    if (v4)
      CFRetain(v4);
  }
  else
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3321888768;
  block[2] = __60__WKWebGeolocationPolicyDecider__loadWithCompletionHandler___block_invoke_2;
  block[3] = &unk_1E34CE2C8;
  block[4] = *(_QWORD *)(a1 + 32);
  cf = v5;
  if (v5)
    CFRetain(v5);
  block[5] = *(_QWORD *)(a1 + 40);
  dispatch_async(MEMORY[0x1E0C80D38], block);
  v6 = cf;
  cf = 0;
  if (v6)
    CFRelease(v6);
  if (v3)
    CFRelease(v3);
  if (v5)
    CFRelease(v5);
}

uint64_t __60__WKWebGeolocationPolicyDecider__loadWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  const void *v4;

  v2 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v2 + 16))
  {
    v3 = *(_QWORD *)(a1 + 48);
    if (v3)
    {
      CFRetain(*(CFTypeRef *)(a1 + 48));
      v4 = *(const void **)(v2 + 16);
      *(_QWORD *)(v2 + 16) = v3;
      if (v4)
        CFRelease(v4);
    }
    else
    {
      *(_QWORD *)(v2 + 16) = 0;
    }
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)_save
{
  uint64_t v3;
  uint64_t v4;
  id v5;
  NSObject *m_ptr;
  _QWORD block[6];
  uint64_t v8;

  if (objc_msgSend(self->_sites.m_ptr, "count"))
  {
    v8 = 0;
    v3 = objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", self->_sites.m_ptr, 200, 0, &v8);
    if (v3)
    {
      v4 = v3;
      v5 = -[WKWebGeolocationPolicyDecider _siteFile](self, "_siteFile");
      m_ptr = self->_diskDispatchQueue.m_ptr;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __38__WKWebGeolocationPolicyDecider__save__block_invoke;
      block[3] = &unk_1E34C8CA8;
      block[4] = v4;
      block[5] = v5;
      dispatch_async(m_ptr, block);
    }
  }
}

uint64_t __38__WKWebGeolocationPolicyDecider__save__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "writeToFile:atomically:", *(_QWORD *)(a1 + 40), 1);
}

- (int64_t)_getChallengeCountFromHistoryForToken:(id)a3 requestingURL:(id)a4
{
  uint64_t v5;
  void *v6;
  void *v7;

  v5 = objc_msgSend(self->_sites.m_ptr, "objectForKey:", a3);
  if (!v5)
    return 0;
  v6 = (void *)v5;
  if ((objc_msgSend((id)objc_msgSend(a4, "scheme"), "isEqualToString:", CFSTR("data")) & 1) != 0)
    return 0;
  v7 = (void *)objc_msgSend((id)objc_msgSend(v6, "objectForKey:", CFSTR("ChallengeDate")), "dateByAddingTimeInterval:", 86400.0);
  if (objc_msgSend(v7, "compare:", objc_msgSend(MEMORY[0x1E0C99D68], "date")) == -1)
    return 0;
  else
    return objc_msgSend((id)objc_msgSend(v6, "objectForKey:", CFSTR("ChallengeCount")), "integerValue");
}

- (void)_addChallengeCount:(int64_t)a3 forToken:(id)a4 requestingURL:(id)a5
{
  int64_t v8;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v8 = -[WKWebGeolocationPolicyDecider _getChallengeCountFromHistoryForToken:requestingURL:](self, "_getChallengeCountFromHistoryForToken:requestingURL:", a4, a5);
  v9[0] = CFSTR("ChallengeCount");
  v9[1] = CFSTR("ChallengeDate");
  v10[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v8 + a3);
  v10[1] = objc_msgSend(MEMORY[0x1E0C99D68], "date");
  objc_msgSend(self->_sites.m_ptr, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2), a4);
  -[WKWebGeolocationPolicyDecider _save](self, "_save");
}

- (void).cxx_destruct
{
  PermissionRequest *value;
  unint64_t m_start;
  unint64_t m_end;
  WTF *m_buffer;
  uint64_t v7;
  WTF *v8;
  uint64_t m_capacity;
  WTF **v10;
  uint64_t v11;
  WTF *v12;
  WTF **v13;
  uint64_t v14;
  WTF *v15;
  void *m_ptr;
  void *v17;

  value = self->_activeChallenge.__ptr_.__value_;
  self->_activeChallenge.__ptr_.__value_ = 0;
  if (value)
    std::default_delete<PermissionRequest>::operator()[abi:sn180100]((WTF *)value, (void *)a2);
  m_start = self->_challenges.m_start;
  m_end = self->_challenges.m_end;
  m_buffer = (WTF *)self->_challenges.m_buffer.m_buffer;
  if (m_start <= m_end)
  {
    if (m_start == m_end)
      goto LABEL_22;
    v13 = (WTF **)((char *)m_buffer + 8 * m_start);
    v14 = 8 * m_end - 8 * m_start;
    do
    {
      v15 = *v13;
      *v13 = 0;
      if (v15)
        std::default_delete<PermissionRequest>::operator()[abi:sn180100](v15, (void *)a2);
      ++v13;
      v14 -= 8;
    }
    while (v14);
  }
  else
  {
    if (m_end)
    {
      v7 = 8 * m_end;
      do
      {
        v8 = *(WTF **)m_buffer;
        *(_QWORD *)m_buffer = 0;
        if (v8)
          std::default_delete<PermissionRequest>::operator()[abi:sn180100](v8, (void *)a2);
        m_buffer = (WTF *)((char *)m_buffer + 8);
        v7 -= 8;
      }
      while (v7);
      m_buffer = (WTF *)self->_challenges.m_buffer.m_buffer;
      m_start = self->_challenges.m_start;
    }
    m_capacity = self->_challenges.m_buffer.m_capacity;
    if (m_start != m_capacity)
    {
      v10 = (WTF **)((char *)m_buffer + 8 * m_start);
      v11 = 8 * m_capacity - 8 * m_start;
      do
      {
        v12 = *v10;
        *v10 = 0;
        if (v12)
          std::default_delete<PermissionRequest>::operator()[abi:sn180100](v12, (void *)a2);
        ++v10;
        v11 -= 8;
      }
      while (v11);
    }
  }
  m_buffer = (WTF *)self->_challenges.m_buffer.m_buffer;
LABEL_22:
  if (m_buffer)
  {
    self->_challenges.m_buffer.m_buffer = 0;
    self->_challenges.m_buffer.m_capacity = 0;
    WTF::fastFree(m_buffer, (void *)a2);
  }
  m_ptr = self->_sites.m_ptr;
  self->_sites.m_ptr = 0;
  if (m_ptr)
    CFRelease(m_ptr);
  v17 = self->_diskDispatchQueue.m_ptr;
  self->_diskDispatchQueue.m_ptr = 0;
  if (v17)
    CFRelease(v17);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 7) = 0;
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

@end
