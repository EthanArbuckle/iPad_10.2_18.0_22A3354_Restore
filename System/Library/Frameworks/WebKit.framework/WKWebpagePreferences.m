@implementation WKWebpagePreferences

- (BOOL)_captivePortalModeEnabled
{
  return API::WebsitePolicies::lockdownModeEnabled((API::WebsitePolicies *)&self->_websitePolicies);
}

+ (WKWebpagePreferences)defaultPreferences
{
  return (WKWebpagePreferences *)(id)CFMakeCollectable(objc_alloc_init((Class)a1));
}

- (WKWebpagePreferences)init
{
  WKWebpagePreferences *v2;
  WKWebpagePreferences *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WKWebpagePreferences;
  v2 = -[WKWebpagePreferences init](&v5, sel_init);
  v3 = v2;
  if (v2)
    *((_QWORD *)API::WebsitePolicies::WebsitePolicies((API::WebsitePolicies *)-[WKWebpagePreferences _apiObject](v2, "_apiObject"))+ 1) = v2;
  return v3;
}

- (Object)_apiObject
{
  return (Object *)&self->_websitePolicies;
}

- (void)_setNetworkConnectionIntegrityPolicy:(unint64_t)a3
{
  *(_WORD *)&self[1]._websitePolicies.data.__lx[40] = a3 & 0x1FF;
}

- (void)_setApplicationNameForUserAgentWithModernCompatibility:(id)a3
{
  WTF::StringImpl *v4;
  WTF::StringImpl *v5;
  WTF::StringImpl *v6;

  MEMORY[0x19AEABCC8](&v6, a3);
  WTF::String::operator=((WTF::StringImpl **)&self[1]._websitePolicies.data.__lx[32], (WTF::StringImpl *)&v6);
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

- (void)dealloc
{
  objc_class *v3;
  WTF::StringImpl *v4;
  objc_super v5;

  v3 = (objc_class *)objc_opt_class();
  if ((WebCoreObjCScheduleDeallocateOnMainRunLoop(v3, (objc_object *)self) & 1) == 0)
  {
    API::WebsitePolicies::~WebsitePolicies((API::WebsitePolicies *)&self->_websitePolicies, v4);
    v5.receiver = self;
    v5.super_class = (Class)WKWebpagePreferences;
    -[WKWebpagePreferences dealloc](&v5, sel_dealloc);
  }
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
  if ((v3 & 1) == 0 && (+[WKWebpagePreferences accessInstanceVariablesDirectly]::didLogFault & 1) == 0)
  {
    +[WKWebpagePreferences accessInstanceVariablesDirectly]::didLogFault = 1;
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

- (void)_setContentBlockersEnabled:(BOOL)a3
{
  WTF::StringImpl **v4;

  LOBYTE(self[2].super.isa) = a3;
  v4 = *(WTF::StringImpl ***)self[2]._websitePolicies.data.__lx;
  *(_QWORD *)self[2]._websitePolicies.data.__lx = 0;
  if (v4)
    WTF::HashTable<WTF::String,WTF::String,WTF::IdentityExtractor,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::String>>::deallocateTable(v4, (WTF::StringImpl *)a2);
}

- (BOOL)_contentBlockersEnabled
{
  return (BOOL)self[2].super.isa;
}

- (void)_setContentRuleListsEnabled:(BOOL)a3 exceptions:(id)a4
{
  unsigned int v7;
  unsigned int v8;
  uint64_t v9;
  WTF::StringImpl **v10;
  WTF::StringImpl *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  const WTF::StringImpl *v15;
  WTF::StringImpl *v16;
  WTF::StringImpl *v17;
  WTF::StringImpl **v18;
  WTF::StringImpl *v19;
  uint64_t v20;
  WTF::StringImpl *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  WTF::StringImpl **v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v26 = 0;
  v7 = WTF::HashTable<WTF::String,WTF::String,WTF::IdentityExtractor,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::String>>::computeBestTableSize(objc_msgSend(a4, "count"));
  if (v7 <= 8)
    v8 = 8;
  else
    v8 = v7;
  v9 = WTF::fastZeroedMalloc((WTF *)(8 * v8 + 16));
  v10 = (WTF::StringImpl **)(v9 + 16);
  v26 = (WTF::StringImpl **)(v9 + 16);
  *(_DWORD *)(v9 + 8) = v8 - 1;
  *(_DWORD *)(v9 + 12) = v8;
  *(_QWORD *)v9 = 0;
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v12 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v23 != v13)
          objc_enumerationMutation(a4);
        MEMORY[0x19AEABCC8](&v21, *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i));
        WTF::HashTable<WTF::String,WTF::String,WTF::IdentityExtractor,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::String>>::add((uint64_t *)&v26, &v21, v15, (uint64_t)&v20);
        v17 = v21;
        v21 = 0;
        if (v17)
        {
          if (*(_DWORD *)v17 == 2)
            WTF::StringImpl::destroy(v17, v16);
          else
            *(_DWORD *)v17 -= 2;
        }
      }
      v12 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v12);
    v10 = v26;
  }
  v26 = 0;
  LOBYTE(self[2].super.isa) = a3;
  v18 = *(WTF::StringImpl ***)self[2]._websitePolicies.data.__lx;
  *(_QWORD *)self[2]._websitePolicies.data.__lx = v10;
  if (v18)
  {
    WTF::HashTable<WTF::String,WTF::String,WTF::IdentityExtractor,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::String>>::deallocateTable(v18, v11);
    if (v26)
      WTF::HashTable<WTF::String,WTF::String,WTF::IdentityExtractor,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::String>>::deallocateTable(v26, v19);
  }
}

- (void)_setActiveContentRuleListActionPatterns:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  uint64_t (*v13)(uint64_t, void *);
  void *v14;
  uint64_t v15;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3812000000;
  v12 = __Block_byref_object_copy__6;
  v13 = __Block_byref_object_dispose__6;
  v14 = &unk_197A0BBD2;
  v15 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __64__WKWebpagePreferences__setActiveContentRuleListActionPatterns___block_invoke;
  v8[3] = &unk_1E34BEFF8;
  v8[4] = &v9;
  objc_msgSend(a3, "enumerateKeysAndObjectsUsingBlock:", v8);
  v5 = v10[6];
  v10[6] = 0;
  v6 = *(_QWORD *)&self->_websitePolicies.data.__lx[24];
  *(_QWORD *)&self->_websitePolicies.data.__lx[24] = v5;
  if (v6)
    WTF::HashTable<WTF::String,WTF::KeyValuePair<WTF::String,WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<WTF::String,WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>>>,WTF::DefaultHash<WTF::String>,WTF::HashMap<WTF::String,WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<WTF::String>>::deallocateTable(v6, v4);
  _Block_object_dispose(&v9, 8);
  if (v15)
    WTF::HashTable<WTF::String,WTF::KeyValuePair<WTF::String,WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<WTF::String,WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>>>,WTF::DefaultHash<WTF::String>,WTF::HashMap<WTF::String,WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<WTF::String>>::deallocateTable(v15, v7);
}

unint64_t __64__WKWebpagePreferences__setActiveContentRuleListActionPatterns___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  unint64_t result;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  WTF::StringImpl *v11;
  WTF::StringImpl *v12;
  _QWORD v13[3];
  WTF::StringImpl *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;
  uint64_t v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v19 = 0;
  v20 = 0;
  result = objc_msgSend(a3, "count");
  if (result)
  {
    if (result >> 29)
    {
      __break(0xC471u);
      return result;
    }
    LODWORD(v20) = result;
    v19 = WTF::fastMalloc((WTF *)(8 * result));
  }
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(a3);
        v13[0] = 0;
        v13[0] = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        if (HIDWORD(v20) == (_DWORD)v20)
        {
          WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,NSString *&>((uint64_t)&v19, v13);
        }
        else
        {
          MEMORY[0x19AEABCC8](v19 + 8 * HIDWORD(v20));
          ++HIDWORD(v20);
        }
      }
      v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v15, v21, 16, v13[0]);
    }
    while (v7);
  }
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  MEMORY[0x19AEABCC8](&v14, a2);
  WTF::HashMap<WTF::String,WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>>,WTF::HashTableTraits>::add<WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>>((uint64_t *)(v10 + 48), &v14, (const WTF::StringImpl *)&v19, (uint64_t)v13);
  v12 = v14;
  v14 = 0;
  if (v12)
  {
    if (*(_DWORD *)v12 == 2)
      WTF::StringImpl::destroy(v12, v11);
    else
      *(_DWORD *)v12 -= 2;
  }
  return WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v19, v11);
}

- (id)_activeContentRuleListActionPatterns
{
  void *v3;
  _QWORD *v4;
  _QWORD *v5;
  _QWORD *v6;
  _QWORD *v7;
  uint64_t v8;
  _QWORD *v9;
  void *v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  const __CFString *v14;
  const __CFString *v15;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = WTF::HashTable<WTF::String,WTF::KeyValuePair<WTF::String,std::variant<WTF::String,unsigned long long,long long,BOOL,double>>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<WTF::String,std::variant<WTF::String,unsigned long long,long long,BOOL,double>>>,WTF::DefaultHash<WTF::String>,WTF::HashMap<WTF::String,std::variant<WTF::String,unsigned long long,long long,BOOL,double>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<std::variant<WTF::String,unsigned long long,long long,BOOL,double>>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<WTF::String>>::begin((_QWORD **)&self->_websitePolicies.data.__lx[24]);
  v5 = v4;
  v7 = v6;
  v8 = *(_QWORD *)&self->_websitePolicies.data.__lx[24];
  if (v8)
    v9 = (_QWORD *)(v8 + 24 * *(unsigned int *)(v8 - 4));
  else
    v9 = 0;
  if (v9 != v4)
  {
    do
    {
      v10 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v11 = *((unsigned int *)v5 + 5);
      if ((_DWORD)v11)
      {
        v12 = (_QWORD *)v5[1];
        v13 = 8 * v11;
        do
        {
          if (*v12)
            v14 = (const __CFString *)WTF::StringImpl::operator NSString *();
          else
            v14 = &stru_1E351F1B8;
          objc_msgSend(v10, "addObject:", v14);
          ++v12;
          v13 -= 8;
        }
        while (v13);
      }
      if (*v5)
        v15 = (const __CFString *)WTF::StringImpl::operator NSString *();
      else
        v15 = &stru_1E351F1B8;
      objc_msgSend(v3, "setObject:forKey:", v10, v15);
      while (1)
      {
        v5 += 3;
        if (v5 == v7)
          break;
        if ((unint64_t)(*v5 + 1) > 1)
          goto LABEL_19;
      }
      v5 = v7;
LABEL_19:
      ;
    }
    while (v5 != v9);
  }
  return v3;
}

- (void)_setAllowedAutoplayQuirks:(unint64_t)a3
{
  self[1]._websitePolicies.data.__lx[42] = a3 & 0xF;
}

- (unint64_t)_allowedAutoplayQuirks
{
  return self[1]._websitePolicies.data.__lx[42] & 0xF;
}

- (void)_setAutoplayPolicy:(int64_t)a3
{
  if ((unint64_t)a3 <= 3)
    self[2]._websitePolicies.data.__lx[8] = a3;
}

- (int64_t)_autoplayPolicy
{
  if (self[2]._websitePolicies.data.__lx[8] - 1 < 3)
    return (self[2]._websitePolicies.data.__lx[8] - 1) + 1;
  else
    return 0;
}

- (void)_setDeviceOrientationAndMotionAccessPolicy:(unint64_t)a3
{
  unsigned __int8 v3;

  v3 = a3 != 1;
  if (!a3)
    v3 = 2;
  self[2]._websitePolicies.data.__lx[19] = v3;
}

- (unint64_t)_deviceOrientationAndMotionAccessPolicy
{
  unint64_t v2;

  v2 = 1;
  if (self[2]._websitePolicies.data.__lx[19])
    v2 = 2;
  if (self[2]._websitePolicies.data.__lx[19] == 2)
    return 0;
  else
    return v2;
}

- (void)_setPopUpPolicy:(unint64_t)a3
{
  if (a3 <= 2)
    self[2]._websitePolicies.data.__lx[9] = a3;
}

- (unint64_t)_popUpPolicy
{
  int v2;

  v2 = self[2]._websitePolicies.data.__lx[9];
  if (v2 == 2)
    return 2;
  else
    return v2 == 1;
}

- (id)_customHeaderFields
{
  void *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  CFTypeRef *v7;
  CFTypeRef v8;
  const void *v9;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", *(unsigned int *)&self->_websitePolicies.data.__lx[44]);
  v4 = *(unsigned int *)&self->_websitePolicies.data.__lx[44];
  if ((_DWORD)v4)
  {
    v5 = *(uint64_t **)&self->_websitePolicies.data.__lx[32];
    v6 = 32 * v4;
    do
    {
      v7 = (CFTypeRef *)API::Object::newObject(0x30uLL, 53);
      *v7 = off_1E34CC2A8;
      WebKit::InitializeWebKit2((WebKit *)v7);
      *v7 = &off_1E34AAA88;
      WTF::Vector<WebCore::HTTPHeaderField,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::Vector((uint64_t)(v7 + 2), v5);
      WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::Vector((uint64_t)(v7 + 4), (uint64_t)(v5 + 2));
      v8 = v7[1];
      if (v8)
      {
        CFRetain(v7[1]);
        CFRelease(v7[1]);
        objc_msgSend(v3, "addObject:", v8);
        v9 = v8;
      }
      else
      {
        v9 = 0;
      }
      CFRelease(v9);
      v5 += 4;
      v6 -= 32;
    }
    while (v6);
  }
  return (id)(id)CFMakeCollectable(v3);
}

- (void)_setCustomHeaderFields:(id)a3
{
  unint64_t v5;
  void *v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  WTF *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  int v22;
  uint64_t v23;
  int v24;
  int v25;

  v5 = objc_msgSend(a3, "count");
  v7 = v5;
  v18 = 0;
  v19 = 0;
  if (v5)
  {
    if (v5 >> 27)
    {
      __break(0xC471u);
      return;
    }
    v9 = WTF::fastMalloc((WTF *)(32 * v5));
    v8 = 0;
    LODWORD(v19) = v7;
    v18 = v9;
    v12 = v9 + 16;
    do
    {
      v13 = objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", v8, v18, v19), "_apiObject");
      WTF::Vector<WebCore::HTTPHeaderField,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::Vector((uint64_t)&v20, (uint64_t *)(v13 + 16));
      WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::Vector((uint64_t)&v23, v13 + 32);
      v14 = v20;
      v20 = 0;
      *(_QWORD *)(v12 - 16) = v14;
      LODWORD(v14) = v21;
      v21 = 0;
      *(_DWORD *)(v12 - 8) = v14;
      LODWORD(v14) = v22;
      v22 = 0;
      *(_DWORD *)(v12 - 4) = v14;
      *(_QWORD *)(v12 + 8) = 0;
      v15 = v23;
      v23 = 0;
      *(_QWORD *)v12 = v15;
      LODWORD(v15) = v24;
      v24 = 0;
      *(_DWORD *)(v12 + 8) = v15;
      LODWORD(v15) = v25;
      v25 = 0;
      *(_DWORD *)(v12 + 12) = v15;
      HIDWORD(v19) = ++v8;
      WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v23, v16);
      WTF::Vector<WebCore::HTTPHeaderField,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v20, v17);
      v12 += 32;
    }
    while (v7 != v8);
  }
  else
  {
    LODWORD(v8) = 0;
    v9 = 0;
  }
  v10 = *(unsigned int *)&self->_websitePolicies.data.__lx[44];
  if ((_DWORD)v10)
    WTF::VectorDestructor<true,WebCore::CustomHeaderFields>::destruct(*(_QWORD *)&self->_websitePolicies.data.__lx[32], (void *)(*(_QWORD *)&self->_websitePolicies.data.__lx[32] + 32 * v10));
  v11 = *(WTF **)&self->_websitePolicies.data.__lx[32];
  if (v11)
  {
    *(_QWORD *)&self->_websitePolicies.data.__lx[32] = 0;
    *(_DWORD *)&self->_websitePolicies.data.__lx[40] = 0;
    WTF::fastFree(v11, v6);
    v9 = v18;
    LODWORD(v7) = v19;
    LODWORD(v8) = HIDWORD(v19);
  }
  v18 = 0;
  v19 = 0;
  *(_QWORD *)&self->_websitePolicies.data.__lx[32] = v9;
  *(_DWORD *)&self->_websitePolicies.data.__lx[40] = v7;
  *(_DWORD *)&self->_websitePolicies.data.__lx[44] = v8;
  WTF::Vector<WebCore::CustomHeaderFields,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v18, v6);
}

- (id)_websiteDataStore
{
  uint64_t v2;

  v2 = *(_QWORD *)&self[2]._websitePolicies.data.__lx[24];
  if (v2)
    return *(id *)(v2 + 8);
  else
    return 0;
}

- (void)_setWebsiteDataStore:(id)a3
{
  char *v4;
  uint64_t v5;

  v4 = (char *)a3 + 8;
  CFRetain(*((CFTypeRef *)a3 + 2));
  v5 = *(_QWORD *)&self[2]._websitePolicies.data.__lx[24];
  *(_QWORD *)&self[2]._websitePolicies.data.__lx[24] = v4;
  if (v5)
    CFRelease(*(CFTypeRef *)(v5 + 8));
}

- (id)_userContentController
{
  uint64_t v2;

  v2 = *(_QWORD *)&self[2]._websitePolicies.data.__lx[32];
  if (v2)
    return *(id *)(v2 + 8);
  else
    return 0;
}

- (void)_setUserContentController:(id)a3
{
  char *v4;
  uint64_t v5;

  v4 = (char *)a3 + 8;
  if (a3)
    CFRetain(*((CFTypeRef *)a3 + 2));
  v5 = *(_QWORD *)&self[2]._websitePolicies.data.__lx[32];
  *(_QWORD *)&self[2]._websitePolicies.data.__lx[32] = v4;
  if (v5)
    CFRelease(*(CFTypeRef *)(v5 + 8));
}

- (void)_setCustomUserAgent:(id)a3
{
  WTF::StringImpl *v4;
  WTF::StringImpl *v5;
  WTF::StringImpl *v6;

  MEMORY[0x19AEABCC8](&v6, a3);
  WTF::String::operator=((WTF::StringImpl **)&self[1]._websitePolicies.data.__lx[8], (WTF::StringImpl *)&v6);
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

- (id)_customUserAgent
{
  if (*(_QWORD *)&self[1]._websitePolicies.data.__lx[8])
    return (id)WTF::StringImpl::operator NSString *();
  else
    return &stru_1E351F1B8;
}

- (void)_setCustomUserAgentAsSiteSpecificQuirks:(id)a3
{
  WTF::StringImpl *v4;
  WTF::StringImpl *v5;
  WTF::StringImpl *v6;

  MEMORY[0x19AEABCC8](&v6, a3);
  WTF::String::operator=((WTF::StringImpl **)&self[1]._websitePolicies.data.__lx[16], (WTF::StringImpl *)&v6);
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

- (id)_customUserAgentAsSiteSpecificQuirks
{
  if (*(_QWORD *)&self[1]._websitePolicies.data.__lx[16])
    return (id)WTF::StringImpl::operator NSString *();
  else
    return &stru_1E351F1B8;
}

- (void)_setCustomNavigatorPlatform:(id)a3
{
  WTF::StringImpl *v4;
  WTF::StringImpl *v5;
  WTF::StringImpl *v6;

  MEMORY[0x19AEABCC8](&v6, a3);
  WTF::String::operator=((WTF::StringImpl **)&self[1]._websitePolicies.data.__lx[24], (WTF::StringImpl *)&v6);
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

- (id)_customNavigatorPlatform
{
  if (*(_QWORD *)&self[1]._websitePolicies.data.__lx[24])
    return (id)WTF::StringImpl::operator NSString *();
  else
    return &stru_1E351F1B8;
}

- (BOOL)_allowSiteSpecificQuirksToOverrideCompatibilityMode
{
  return self[2]._websitePolicies.data.__lx[22];
}

- (void)_setAllowSiteSpecificQuirksToOverrideCompatibilityMode:(BOOL)a3
{
  self[2]._websitePolicies.data.__lx[22] = a3;
}

- (id)_applicationNameForUserAgentWithModernCompatibility
{
  WTF::StringImpl *v2;
  WTF::StringImpl *v3;
  void *v4;

  v2 = *(WTF::StringImpl **)&self[1]._websitePolicies.data.__lx[32];
  if (!v2)
    return &stru_1E351F1B8;
  *(_DWORD *)v2 += 2;
  v4 = (void *)WTF::StringImpl::operator NSString *();
  if (*(_DWORD *)v2 == 2)
    WTF::StringImpl::destroy(v2, v3);
  else
    *(_DWORD *)v2 -= 2;
  return v4;
}

- (void)setAllowsContentJavaScript:(BOOL)allowsContentJavaScript
{
  self[2]._websitePolicies.data.__lx[14] = allowsContentJavaScript;
}

- (BOOL)allowsContentJavaScript
{
  return self[2]._websitePolicies.data.__lx[14];
}

- (void)_setCaptivePortalModeEnabled:(BOOL)a3
{
  __int16 v3;

  v3 = a3;
  if (!a3 && (WTF::processHasEntitlement() & 1) == 0 && (WTF::processHasEntitlement() & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("The 'com.apple.developer.web-browser' restricted entitlement is required to disable Lockdown mode"));
  *(_WORD *)&self[2]._websitePolicies.data.__lx[40] = v3 | 0x100;
}

- (void)_setAllowPrivacyProxy:(BOOL)a3
{
  self[2]._websitePolicies.data.__lx[21] = a3;
}

- (BOOL)_allowPrivacyProxy
{
  return self[2]._websitePolicies.data.__lx[21];
}

- (unint64_t)_colorSchemePreference
{
  int v2;

  v2 = self[2]._websitePolicies.data.__lx[17];
  if (v2 == 2)
    return 2;
  else
    return v2 == 1;
}

- (void)_setColorSchemePreference:(unint64_t)a3
{
  if (a3 <= 2)
    self[2]._websitePolicies.data.__lx[17] = a3;
}

- (void)setPreferredContentMode:(WKContentMode)preferredContentMode
{
  unsigned __int8 v3;

  v3 = preferredContentMode == WKContentModeMobile;
  if (preferredContentMode == WKContentModeDesktop)
    v3 = 2;
  self[2]._websitePolicies.data.__lx[18] = v3;
}

- (WKContentMode)preferredContentMode
{
  int v2;

  v2 = self[2]._websitePolicies.data.__lx[18];
  if (v2 == 2)
    return 2;
  else
    return (unint64_t)(v2 == 1);
}

- (void)_setMouseEventPolicy:(unint64_t)a3
{
  self[2]._websitePolicies.data.__lx[15] = a3 == 1;
}

- (unint64_t)_mouseEventPolicy
{
  return self[2]._websitePolicies.data.__lx[15] == 1;
}

- (void)_setModalContainerObservationPolicy:(unint64_t)a3
{
  self[2]._websitePolicies.data.__lx[16] = a3 == 1;
}

- (unint64_t)_modalContainerObservationPolicy
{
  return self[2]._websitePolicies.data.__lx[16];
}

- (BOOL)isLockdownModeEnabled
{
  return API::WebsitePolicies::lockdownModeEnabled((API::WebsitePolicies *)&self->_websitePolicies);
}

- (void)setLockdownModeEnabled:(BOOL)lockdownModeEnabled
{
  __int16 v3;

  v3 = lockdownModeEnabled;
  if (!lockdownModeEnabled && (WTF::processHasEntitlement() & 1) == 0 && (WTF::processHasEntitlement() & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("The 'com.apple.developer.web-browser' restricted entitlement is required to disable lockdown mode"));
  *(_WORD *)&self[2]._websitePolicies.data.__lx[40] = v3 | 0x100;
}

- (BOOL)_networkConnectionIntegrityEnabled
{
  return (~*(unsigned __int16 *)&self[1]._websitePolicies.data.__lx[40] & 0x1C1) == 0;
}

- (void)_setNetworkConnectionIntegrityEnabled:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 449;
  else
    v3 = 0;
  *(_WORD *)&self[1]._websitePolicies.data.__lx[40] = *(_WORD *)&self[1]._websitePolicies.data.__lx[40] & 0xFE3E | v3;
}

- (unint64_t)_networkConnectionIntegrityPolicy
{
  return *(_WORD *)&self[1]._websitePolicies.data.__lx[40] & 0x1FF;
}

- (void)_setVisibilityAdjustmentSelectorsIncludingShadowHosts:(id)a3
{
  unint64_t v5;
  WTF::StringImpl *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;
  int v11;
  uint64_t v12;
  WTF::StringImpl *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  unsigned int v18;
  unsigned int v19;
  uint64_t v20;
  WTF::StringImpl *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  const WTF::StringImpl *v25;
  WTF::StringImpl *v26;
  WTF::StringImpl *v27;
  uint64_t v28;
  WTF::StringImpl ***v29;
  uint64_t v30;
  WTF::StringImpl **v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  WTF *v35;
  uint64_t v36;
  Class isa;
  uint64_t v38;
  WKWebpagePreferences *v39;
  id obj;
  uint64_t v41;
  uint64_t v42;
  char v43[24];
  WTF::StringImpl *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  WTF::StringImpl **v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  uint64_t v54;
  uint64_t v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  objc_class *v60;
  uint64_t v61;
  _BYTE v62[128];
  _BYTE v63[128];
  _BYTE v64[128];
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v60 = 0;
  v61 = 0;
  v5 = objc_msgSend(a3, "count");
  if (v5)
  {
    if (v5 >> 28)
    {
      __break(0xC471u);
      goto LABEL_52;
    }
    LODWORD(v61) = v5;
    v60 = (objc_class *)WTF::fastMalloc((WTF *)(16 * v5));
  }
  v58 = 0u;
  v59 = 0u;
  v56 = 0u;
  v57 = 0u;
  v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v56, v64, 16);
  if (!v7)
    goto LABEL_41;
  v42 = *(_QWORD *)v57;
  v39 = self;
  obj = a3;
  do
  {
    v8 = 0;
    v41 = v7;
    do
    {
      if (*(_QWORD *)v57 != v42)
        objc_enumerationMutation(obj);
      v9 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * v8);
      v54 = 0;
      v55 = 0;
      v10 = objc_msgSend(v9, "count", v39);
      v11 = v10;
      if (v10)
      {
        if (!(v10 >> 29))
        {
          v12 = WTF::fastMalloc((WTF *)(8 * v10));
          LODWORD(v55) = v11;
          v54 = v12;
          goto LABEL_10;
        }
        __break(0xC471u);
LABEL_52:
        JUMPOUT(0x1970EC6B4);
      }
LABEL_10:
      v52 = 0u;
      v53 = 0u;
      v50 = 0u;
      v51 = 0u;
      v14 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v50, v63, 16);
      if (v14)
      {
        v15 = *(_QWORD *)v51;
        do
        {
          v16 = 0;
          do
          {
            if (*(_QWORD *)v51 != v15)
              objc_enumerationMutation(v9);
            v17 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * v16);
            v49 = 0;
            v18 = WTF::HashTable<WTF::String,WTF::String,WTF::IdentityExtractor,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::String>>::computeBestTableSize(objc_msgSend(v17, "count"));
            if (v18 <= 8)
              v19 = 8;
            else
              v19 = v18;
            v20 = WTF::fastZeroedMalloc((WTF *)(8 * v19 + 16));
            v49 = (WTF::StringImpl **)(v20 + 16);
            *(_DWORD *)(v20 + 8) = v19 - 1;
            *(_DWORD *)(v20 + 12) = v19;
            *(_DWORD *)v20 = 0;
            *((_DWORD *)v49 - 3) = 0;
            v47 = 0u;
            v48 = 0u;
            v45 = 0u;
            v46 = 0u;
            v22 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v45, v62, 16);
            if (v22)
            {
              v23 = *(_QWORD *)v46;
              do
              {
                for (i = 0; i != v22; ++i)
                {
                  if (*(_QWORD *)v46 != v23)
                    objc_enumerationMutation(v17);
                  MEMORY[0x19AEABCC8](&v44, *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * i));
                  WTF::HashTable<WTF::String,WTF::String,WTF::IdentityExtractor,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::String>>::add((uint64_t *)&v49, &v44, v25, (uint64_t)v43);
                  v27 = v44;
                  v44 = 0;
                  if (v27)
                  {
                    if (*(_DWORD *)v27 == 2)
                      WTF::StringImpl::destroy(v27, v26);
                    else
                      *(_DWORD *)v27 -= 2;
                  }
                }
                v22 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v45, v62, 16);
              }
              while (v22);
            }
            v28 = HIDWORD(v55);
            if (HIDWORD(v55) == (_DWORD)v55)
            {
              v29 = (WTF::StringImpl ***)WTF::Vector<WTF::HashSet<WTF::String,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTableTraits>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::expandCapacity<(WTF::FailureAction)0>((uint64_t)&v54, HIDWORD(v55) + 1, (unint64_t)&v49);
              v28 = HIDWORD(v55);
              v30 = v54;
              *(_QWORD *)(v54 + 8 * HIDWORD(v55)) = 0;
              v31 = *v29;
              *v29 = 0;
            }
            else
            {
              v30 = v54;
              *(_QWORD *)(v54 + 8 * HIDWORD(v55)) = 0;
              v31 = v49;
              v49 = 0;
            }
            *(_QWORD *)(v30 + 8 * v28) = v31;
            ++HIDWORD(v55);
            if (v49)
              WTF::HashTable<WTF::String,WTF::String,WTF::IdentityExtractor,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::String>>::deallocateTable(v49, v21);
            ++v16;
          }
          while (v16 != v14);
          v14 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v50, v63, 16);
        }
        while (v14);
      }
      if (HIDWORD(v61) == (_DWORD)v61)
      {
        WTF::Vector<WTF::Vector<WTF::HashSet<WTF::String,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTableTraits>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WTF::Vector<WTF::HashSet<WTF::String,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTableTraits>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>>((uint64_t)&v60, (unint64_t)&v54);
      }
      else
      {
        v32 = (char *)v60 + 16 * HIDWORD(v61);
        *(_QWORD *)v32 = 0;
        *((_QWORD *)v32 + 1) = 0;
        v33 = v54;
        v54 = 0;
        *(_QWORD *)v32 = v33;
        LODWORD(v33) = v55;
        LODWORD(v55) = 0;
        *((_DWORD *)v32 + 2) = v33;
        LODWORD(v33) = HIDWORD(v55);
        HIDWORD(v55) = 0;
        *((_DWORD *)v32 + 3) = v33;
        ++HIDWORD(v61);
      }
      WTF::Vector<WTF::HashSet<WTF::String,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTableTraits>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v54, v13);
      ++v8;
    }
    while (v8 != v41);
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v64, 16);
    self = v39;
  }
  while (v7);
LABEL_41:
  v34 = *(unsigned int *)&self[1]._websitePolicies.data.__lx[4];
  if ((_DWORD)v34)
  {
    isa = self[1].super.isa;
    v38 = 16 * v34;
    do
    {
      isa = (Class)(WTF::Vector<WTF::HashSet<WTF::String,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTableTraits>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)isa, v6)+ 16);
      v38 -= 16;
    }
    while (v38);
  }
  v35 = self[1].super.isa;
  if (v35)
  {
    self[1].super.isa = 0;
    *(_DWORD *)self[1]._websitePolicies.data.__lx = 0;
    WTF::fastFree(v35, v6);
  }
  self[1].super.isa = v60;
  v36 = v61;
  v60 = 0;
  v61 = 0;
  *(_QWORD *)self[1]._websitePolicies.data.__lx = v36;
  WTF::Vector<WTF::Vector<WTF::HashSet<WTF::String,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTableTraits>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v60, v6);
}

- (id)_visibilityAdjustmentSelectorsIncludingShadowHosts
{
  uint64_t v3;
  Class isa;
  objc_class *v5;
  void *v6;
  uint64_t v7;
  _QWORD **v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  void *v12;
  _QWORD *v13;
  _QWORD *v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t v17;
  const __CFString *v18;
  void *cf;

  cf = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", *(unsigned int *)&self[1]._websitePolicies.data.__lx[4]);
  v3 = *(unsigned int *)&self[1]._websitePolicies.data.__lx[4];
  if ((_DWORD)v3)
  {
    isa = self[1].super.isa;
    v5 = (Class)((char *)isa + 16 * v3);
    do
    {
      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", *((unsigned int *)isa + 3));
      v7 = *((unsigned int *)isa + 3);
      if ((_DWORD)v7)
      {
        v8 = *(_QWORD ***)isa;
        v9 = *(_QWORD *)isa + 8 * v7;
        do
        {
          v10 = objc_alloc(MEMORY[0x1E0C99E20]);
          if (*v8)
            v11 = *((unsigned int *)*v8 - 3);
          else
            v11 = 0;
          v12 = (void *)objc_msgSend(v10, "initWithCapacity:", v11);
          v13 = WTF::HashTable<WTF::String,WTF::String,WTF::IdentityExtractor,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::String>>::begin(v8);
          v14 = v13;
          v16 = v15;
          if (*v8)
            v17 = (uint64_t)&(*v8)[*((unsigned int *)*v8 - 1)];
          else
            v17 = 0;
          if ((_QWORD *)v17 != v13)
          {
            do
            {
              if (*v14)
                v18 = (const __CFString *)WTF::StringImpl::operator NSString *();
              else
                v18 = &stru_1E351F1B8;
              objc_msgSend(v12, "addObject:", v18);
              while (++v14 != v16)
              {
                if ((unint64_t)(*v14 + 1) > 1)
                  goto LABEL_18;
              }
              v14 = v16;
LABEL_18:
              ;
            }
            while (v14 != (_QWORD *)v17);
          }
          objc_msgSend(v6, "addObject:", v12);
          if (v12)
            CFRelease(v12);
          ++v8;
        }
        while (v8 != (_QWORD **)v9);
      }
      objc_msgSend(cf, "addObject:", v6);
      if (v6)
        CFRelease(v6);
      isa = (Class)((char *)isa + 16);
    }
    while (isa != v5);
  }
  return (id)(id)CFMakeCollectable(cf);
}

- (void)_setVisibilityAdjustmentSelectors:(id)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(a3, "count"));
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v9, v14, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(a3);
        v13 = objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8));
        objc_msgSend(v5, "addObject:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v13, 1));
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v9, v14, 16);
    }
    while (v6);
  }
  -[WKWebpagePreferences _setVisibilityAdjustmentSelectorsIncludingShadowHosts:](self, "_setVisibilityAdjustmentSelectorsIncludingShadowHosts:", v5);
  if (v5)
    CFRelease(v5);
}

- (id)_visibilityAdjustmentSelectors
{
  id v3;
  uint64_t v4;
  Class isa;
  objc_class *v6;
  _QWORD *v7;
  _QWORD *v8;
  _QWORD *v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;
  const __CFString *v13;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v4 = *(unsigned int *)&self[1]._websitePolicies.data.__lx[4];
  if ((_DWORD)v4)
  {
    isa = self[1].super.isa;
    v6 = (Class)((char *)isa + 16 * v4);
    do
    {
      if (*((_DWORD *)isa + 3) == 1)
      {
        v7 = *(_QWORD **)isa;
        v8 = WTF::HashTable<WTF::String,WTF::String,WTF::IdentityExtractor,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::String>>::begin(*(_QWORD ***)isa);
        v9 = v8;
        v11 = v10;
        v12 = *v7 ? *v7 + 8 * *(unsigned int *)(*v7 - 4) : 0;
        if ((_QWORD *)v12 != v8)
        {
          do
          {
            if (*v9)
              v13 = (const __CFString *)WTF::StringImpl::operator NSString *();
            else
              v13 = &stru_1E351F1B8;
            objc_msgSend(v3, "addObject:", v13);
            while (++v9 != v11)
            {
              if ((unint64_t)(*v9 + 1) > 1)
                goto LABEL_14;
            }
            v9 = v11;
LABEL_14:
            ;
          }
          while (v9 != (_QWORD *)v12);
        }
      }
      isa = (Class)((char *)isa + 16);
    }
    while (isa != v6);
  }
  return (id)(id)CFMakeCollectable(v3);
}

@end
