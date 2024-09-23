@implementation _WKProcessPoolConfiguration

- (Object)_apiObject
{
  return (Object *)&self->_processPoolConfiguration;
}

- (void)setInjectedBundleURL:(id)a3
{
  WTF::StringImpl *v5;
  WTF::StringImpl *v6;
  WTF::StringImpl *v7;

  if (a3 && (objc_msgSend(a3, "isFileURL") & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Injected Bundle URL must be a file URL"));
  MEMORY[0x19AEABCC8](&v7, objc_msgSend(a3, "path"));
  WTF::String::operator=((WTF::StringImpl **)&self->_processPoolConfiguration.data.__lx[16], (WTF::StringImpl *)&v7);
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

- (void)setUsesWebProcessCache:(BOOL)a3
{
  self->_anon_38[43] = a3;
}

- (void)setShouldCaptureAudioInUIProcess:(BOOL)a3
{
  self->_shouldCaptureAudioInUIProcess = a3;
}

- (void)setJITEnabled:(BOOL)a3
{
  self->_anon_38[47] = a3;
}

- (void)setPrewarmsProcessesAutomatically:(BOOL)a3
{
  *(_WORD *)&self->_anon_38[41] = a3 | 0x100;
}

- (void)setShouldTakeUIBackgroundAssertion:(BOOL)a3
{
  self->_anon_38[29] = a3;
}

- (void)dealloc
{
  objc_class *v3;
  void *v4;
  objc_super v5;

  v3 = (objc_class *)objc_opt_class();
  if ((WebCoreObjCScheduleDeallocateOnMainRunLoop(v3, (objc_object *)self) & 1) == 0)
  {
    API::ProcessPoolConfiguration::~ProcessPoolConfiguration((API::ProcessPoolConfiguration *)&self->_processPoolConfiguration, v4);
    v5.receiver = self;
    v5.super_class = (Class)_WKProcessPoolConfiguration;
    -[_WKProcessPoolConfiguration dealloc](&v5, sel_dealloc);
  }
}

- (_WKProcessPoolConfiguration)init
{
  _WKProcessPoolConfiguration *v2;
  _WKProcessPoolConfiguration *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_WKProcessPoolConfiguration;
  v2 = -[_WKProcessPoolConfiguration init](&v5, sel_init);
  v3 = v2;
  if (v2)
    *((_QWORD *)API::ProcessPoolConfiguration::ProcessPoolConfiguration((API::ProcessPoolConfiguration *)-[_WKProcessPoolConfiguration _apiObject](v2, "_apiObject"))
    + 1) = v2;
  return v3;
}

- (void)setCachePartitionedURLSchemes:(id)a3
{
  void *v4;
  uint64_t v5;
  WTF *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  WTF::makeVector<WTF::String>(a3, (uint64_t)&v8);
  v5 = *(unsigned int *)&self->_processPoolConfiguration.data.__lx[36];
  if ((_DWORD)v5)
    WTF::VectorDestructor<true,WTF::String>::destruct(*(WTF::StringImpl **)&self->_processPoolConfiguration.data.__lx[24], (WTF::StringImpl *)(*(_QWORD *)&self->_processPoolConfiguration.data.__lx[24] + 8 * v5));
  v6 = *(WTF **)&self->_processPoolConfiguration.data.__lx[24];
  if (v6)
  {
    *(_QWORD *)&self->_processPoolConfiguration.data.__lx[24] = 0;
    *(_DWORD *)&self->_processPoolConfiguration.data.__lx[32] = 0;
    WTF::fastFree(v6, v4);
  }
  *(_QWORD *)&self->_processPoolConfiguration.data.__lx[24] = v8;
  v7 = v9;
  v8 = 0;
  v9 = 0;
  *(_QWORD *)&self->_processPoolConfiguration.data.__lx[32] = v7;
  WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v8, v4);
}

- (NSURL)injectedBundleURL
{
  void *v2;
  const __CFString *v3;

  v2 = (void *)MEMORY[0x1E0C99E98];
  if (*(_QWORD *)&self->_processPoolConfiguration.data.__lx[16])
    v3 = (const __CFString *)WTF::StringImpl::operator NSString *();
  else
    v3 = &stru_1E351F1B8;
  return (NSURL *)objc_msgSend(v2, "fileURLWithPath:", v3);
}

- (NSSet)customClassesForParameterCoder
{
  return (NSSet *)objc_msgSend(MEMORY[0x1E0C99E60], "set");
}

- (unint64_t)maximumProcessCount
{
  return -1;
}

- (int64_t)diskCacheSizeOverride
{
  return 0;
}

- (BOOL)diskCacheSpeculativeValidationEnabled
{
  return 0;
}

- (BOOL)ignoreSynchronousMessagingTimeoutsForTesting
{
  return self->_anon_38[25];
}

- (void)setIgnoreSynchronousMessagingTimeoutsForTesting:(BOOL)a3
{
  self->_anon_38[25] = a3;
}

- (BOOL)attrStyleEnabled
{
  return self->_anon_38[26];
}

- (void)setAttrStyleEnabled:(BOOL)a3
{
  self->_anon_38[26] = a3;
}

- (BOOL)shouldThrowExceptionForGlobalConstantRedeclaration
{
  return self->_anon_38[27];
}

- (void)setShouldThrowExceptionForGlobalConstantRedeclaration:(BOOL)a3
{
  self->_anon_38[27] = a3;
}

- (NSArray)additionalReadAccessAllowedURLs
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  char *v8;
  void *v9;
  uint64_t v10;
  WTF *v11;
  NSArray *v12;
  uint64_t v14;
  unsigned int v15;
  WTF *v16;

  WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::Vector((uint64_t)&v14, (uint64_t)&self->_anon_38[8]);
  if (v15)
  {
    v3 = objc_alloc(MEMORY[0x1E0C99DE8]);
    v4 = (void *)objc_msgSend(v3, "initWithCapacity:", v15);
    if (v15)
    {
      v5 = v14;
      v6 = 8 * v15;
      while (1)
      {
        v7 = (void *)MEMORY[0x1E0C99E98];
        WTF::String::utf8();
        if (v16)
          v8 = (char *)v16 + 16;
        else
          v8 = 0;
        v10 = objc_msgSend(v7, "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", v8, 0, 0);
        v11 = v16;
        v16 = 0;
        if (!v11)
          goto LABEL_10;
        if (*(_DWORD *)v11 != 1)
          break;
        WTF::fastFree(v11, v9);
        if (v10)
          goto LABEL_13;
LABEL_14:
        v5 += 8;
        v6 -= 8;
        if (!v6)
          goto LABEL_15;
      }
      --*(_DWORD *)v11;
LABEL_10:
      if (!v10)
        goto LABEL_14;
LABEL_13:
      objc_msgSend(v4, "addObject:", v10);
      goto LABEL_14;
    }
LABEL_15:
    v12 = (id)CFMakeCollectable(v4);
  }
  else
  {
    v12 = (NSArray *)MEMORY[0x1E0C9AA60];
  }
  WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v14, v2);
  return v12;
}

- (void)setAdditionalReadAccessAllowedURLs:(id)a3
{
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  WTF::String *v11;
  const char *v12;
  WTF::StringImpl *v13;
  uint64_t v14;
  WTF::StringImpl *v15;
  WTF::StringImpl *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  WTF::StringImpl *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;
  uint64_t v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v27 = 0;
  v28 = 0;
  v5 = objc_msgSend(a3, "count");
  if (v5)
  {
    if (v5 >> 29)
    {
      __break(0xC471u);
      return;
    }
    LODWORD(v28) = v5;
    v27 = WTF::fastMalloc((WTF *)(8 * v5));
  }
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v24;
    v8 = *MEMORY[0x1E0C99778];
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v24 != v7)
          objc_enumerationMutation(a3);
        v10 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v9);
        if ((objc_msgSend(v10, "isFileURL") & 1) == 0)
          objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", v8, CFSTR("%@ is not a file URL"), v10);
        v11 = (WTF::String *)objc_msgSend(v10, "fileSystemRepresentation");
        WTF::String::fromUTF8((uint64_t *)&v22, v11, v12);
        LODWORD(v14) = HIDWORD(v28);
        if (HIDWORD(v28) == (_DWORD)v28)
        {
          v17 = (uint64_t *)WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::expandCapacity<(WTF::FailureAction)0>((uint64_t)&v27, HIDWORD(v28) + 1, (unint64_t)&v22);
          v14 = HIDWORD(v28);
          v18 = v27;
          v19 = *v17;
          *v17 = 0;
          *(_QWORD *)(v18 + 8 * v14) = v19;
        }
        else
        {
          v15 = v22;
          v22 = 0;
          *(_QWORD *)(v27 + 8 * HIDWORD(v28)) = v15;
        }
        HIDWORD(v28) = v14 + 1;
        v16 = v22;
        v22 = 0;
        if (v16)
        {
          if (*(_DWORD *)v16 == 2)
            WTF::StringImpl::destroy(v16, v13);
          else
            *(_DWORD *)v16 -= 2;
        }
        ++v9;
      }
      while (v6 != v9);
      v20 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
      v6 = v20;
    }
    while (v20);
  }
  WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::operator=((unsigned int *)&self->_anon_38[8], (uint64_t)&v27);
  WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v27, v21);
}

- (unint64_t)wirelessContextIdentifier
{
  return 0;
}

- (NSArray)cachePartitionedURLSchemes
{
  CFTypeRef v2;
  NSArray *v3;
  CFTypeRef v4;
  CFTypeRef cf;

  WTF::createNSArray<WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc> const&>((uint64_t)&self->_processPoolConfiguration.data.__lx[24], (uint64_t *)&cf);
  v2 = cf;
  cf = 0;
  v3 = (id)CFMakeCollectable(v2);
  v4 = cf;
  cf = 0;
  if (v4)
    CFRelease(v4);
  return v3;
}

- (NSArray)alwaysRevalidatedURLSchemes
{
  CFTypeRef v2;
  NSArray *v3;
  CFTypeRef v4;
  CFTypeRef cf;

  WTF::createNSArray<WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc> const&>((uint64_t)&self->_processPoolConfiguration.data.__lx[40], (uint64_t *)&cf);
  v2 = cf;
  cf = 0;
  v3 = (id)CFMakeCollectable(v2);
  v4 = cf;
  cf = 0;
  if (v4)
    CFRelease(v4);
  return v3;
}

- (void)setAlwaysRevalidatedURLSchemes:(id)a3
{
  void *v4;
  uint64_t v5;
  WTF *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  WTF::makeVector<WTF::String>(a3, (uint64_t)&v8);
  v5 = *(unsigned int *)&self->_anon_38[4];
  if ((_DWORD)v5)
    WTF::VectorDestructor<true,WTF::String>::destruct(*(WTF::StringImpl **)&self->_processPoolConfiguration.data.__lx[40], (WTF::StringImpl *)(*(_QWORD *)&self->_processPoolConfiguration.data.__lx[40] + 8 * v5));
  v6 = *(WTF **)&self->_processPoolConfiguration.data.__lx[40];
  if (v6)
  {
    *(_QWORD *)&self->_processPoolConfiguration.data.__lx[40] = 0;
    *(_DWORD *)self->_anon_38 = 0;
    WTF::fastFree(v6, v4);
  }
  *(_QWORD *)&self->_processPoolConfiguration.data.__lx[40] = v8;
  v7 = v9;
  v8 = 0;
  v9 = 0;
  *(_QWORD *)self->_anon_38 = v7;
  WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v8, v4);
}

- (NSString)sourceApplicationBundleIdentifier
{
  return 0;
}

- (NSString)sourceApplicationSecondaryIdentifier
{
  return 0;
}

- (void)setPresentingApplicationPID:(int)a3
{
  *(_DWORD *)&self->_anon_38[32] = a3;
}

- (int)presentingApplicationPID
{
  return *(_DWORD *)&self->_anon_38[32];
}

- (void)setPresentingApplicationProcessToken:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)a3->var0;
  *(_OWORD *)&self->_anon_38[68] = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)&self->_anon_38[52] = v3;
  self->_anon_38[84] = 1;
}

- ($115C4C562B26FF47E01F9F4EA65B5887)presentingApplicationProcessToken
{
  __int128 v3;

  if (LOBYTE(self[4].var0[3]))
  {
    v3 = *(_OWORD *)&self[3].var0[7];
    *(_OWORD *)retstr->var0 = *(_OWORD *)&self[3].var0[3];
    *(_OWORD *)&retstr->var0[4] = v3;
  }
  else
  {
    *(_OWORD *)retstr->var0 = 0u;
    *(_OWORD *)&retstr->var0[4] = 0u;
  }
  return self;
}

- (void)setProcessSwapsOnNavigation:(BOOL)a3
{
  *(_WORD *)&self->_anon_38[36] = a3 | 0x100;
}

- (BOOL)processSwapsOnNavigation
{
  uint64_t v2;

  v2 = 92;
  if (!self->_anon_38[37])
    v2 = 94;
  return *((_BYTE *)&self->super.isa + v2);
}

- (BOOL)prewarmsProcessesAutomatically
{
  uint64_t v2;

  v2 = 97;
  if (!self->_anon_38[42])
    v2 = 101;
  return *((_BYTE *)&self->super.isa + v2);
}

- (BOOL)usesWebProcessCache
{
  return self->_anon_38[43];
}

- (void)setAlwaysKeepAndReuseSwappedProcesses:(BOOL)a3
{
  self->_anon_38[39] = a3;
}

- (BOOL)alwaysKeepAndReuseSwappedProcesses
{
  return self->_anon_38[39];
}

- (void)setProcessSwapsOnNavigationWithinSameNonHTTPFamilyProtocol:(BOOL)a3
{
  self->_anon_38[40] = a3;
}

- (BOOL)processSwapsOnNavigationWithinSameNonHTTPFamilyProtocol
{
  return self->_anon_38[40];
}

- (BOOL)pageCacheEnabled
{
  return self->_anon_38[44];
}

- (void)setPageCacheEnabled:(BOOL)a3
{
  self->_anon_38[44] = a3;
}

- (BOOL)usesSingleWebProcess
{
  return self->_anon_38[48];
}

- (void)setUsesSingleWebProcess:(BOOL)a3
{
  self->_anon_38[48] = a3;
}

- (BOOL)isJITEnabled
{
  return self->_anon_38[47];
}

- (BOOL)alwaysRunsAtBackgroundPriority
{
  return self->_anon_38[28];
}

- (void)setAlwaysRunsAtBackgroundPriority:(BOOL)a3
{
  self->_anon_38[28] = a3;
}

- (BOOL)shouldTakeUIBackgroundAssertion
{
  return self->_anon_38[29];
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  uint64_t v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  v5 = (void *)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p"), NSStringFromClass(v4), self);
  v6 = *(_QWORD *)&self->_processPoolConfiguration.data.__lx[16];
  if (v6 && *(_DWORD *)(v6 + 4))
    return (NSString *)objc_msgSend(v5, "stringByAppendingFormat:", CFSTR("; injectedBundleURL: \"%@\">"),
                         -[_WKProcessPoolConfiguration injectedBundleURL](self, "injectedBundleURL"));
  else
    return (NSString *)objc_msgSend(v5, "stringByAppendingString:", CFSTR(">"));
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v3;
  id v4;
  API::ProcessPoolConfiguration *v5;
  API::ProcessPoolConfiguration *v7;

  API::ProcessPoolConfiguration::copy((API::ProcessPoolConfiguration *)&self->_processPoolConfiguration, &v7);
  v3 = (void *)*((_QWORD *)v7 + 1);
  if (v3)
    CFRetain(*((CFTypeRef *)v7 + 1));
  v4 = v3;
  if (v3)
    CFRelease(v3);
  v5 = v7;
  v7 = 0;
  if (v5)
    CFRelease(*((CFTypeRef *)v5 + 1));
  return v4;
}

- (NSString)customWebContentServiceBundleIdentifier
{
  return 0;
}

- (BOOL)configureJSCForTesting
{
  return self->_anon_38[46];
}

- (void)setConfigureJSCForTesting:(BOOL)a3
{
  self->_anon_38[46] = a3;
}

- (NSString)timeZoneOverride
{
  if (*(_QWORD *)&self->_anon_38[88])
    return (NSString *)WTF::StringImpl::operator NSString *();
  else
    return (NSString *)&stru_1E351F1B8;
}

- (void)setTimeZoneOverride:(id)a3
{
  WTF::StringImpl *v4;
  WTF::StringImpl *v5;
  WTF::StringImpl *v6;

  MEMORY[0x19AEABCC8](&v6, a3);
  WTF::String::operator=((WTF::StringImpl **)&self->_anon_38[88], (WTF::StringImpl *)&v6);
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

- (void)setMemoryFootprintPollIntervalForTesting:(double)a3
{
  *(double *)&self->_anon_38[96] = a3;
}

- (double)memoryFootprintPollIntervalForTesting
{
  return *(double *)&self->_anon_38[96];
}

- (NSArray)memoryFootprintNotificationThresholds
{
  void *v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", *(unsigned int *)&self->_anon_38[116]);
  v4 = *(unsigned int *)&self->_anon_38[116];
  if ((_DWORD)v4)
  {
    v5 = *(_QWORD **)&self->_anon_38[104];
    v6 = 8 * v4;
    do
    {
      objc_msgSend(v3, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", *v5++));
      v6 -= 8;
    }
    while (v6);
  }
  return (NSArray *)(id)CFMakeCollectable(v3);
}

- (void)setMemoryFootprintNotificationThresholds:(id)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  _QWORD *v11;
  WTF *v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;
  uint64_t v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v18 = 0;
  v19 = 0;
  WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::reserveCapacity<(WTF::FailureAction)0>((uint64_t)&v18, objc_msgSend(a3, "count"));
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v15;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(a3);
        v9 = objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v8), "unsignedLongLongValue");
        v13 = v9;
        v10 = HIDWORD(v19);
        if (HIDWORD(v19) == (_DWORD)v19)
        {
          v11 = (_QWORD *)WTF::Vector<WTF::Ref<WebCore::SecurityOrigin,WTF::RawPtrTraits<WebCore::SecurityOrigin>,WTF::DefaultRefDerefTraits<WebCore::SecurityOrigin>>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::expandCapacity<(WTF::FailureAction)0>((uint64_t)&v18, HIDWORD(v19) + 1, (unint64_t)&v13);
          v10 = HIDWORD(v19);
          *(_QWORD *)(v18 + 8 * HIDWORD(v19)) = *v11;
        }
        else
        {
          *(_QWORD *)(v18 + 8 * HIDWORD(v19)) = v9;
        }
        HIDWORD(v19) = v10 + 1;
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
    }
    while (v6);
  }
  v12 = *(WTF **)&self->_anon_38[104];
  if (v12)
  {
    *(_QWORD *)&self->_anon_38[104] = 0;
    *(_DWORD *)&self->_anon_38[112] = 0;
    WTF::fastFree(v12, v5);
  }
  *(_QWORD *)&self->_anon_38[104] = v18;
  *(_QWORD *)&self->_anon_38[112] = v19;
}

- (BOOL)shouldCaptureAudioInUIProcess
{
  return self->_shouldCaptureAudioInUIProcess;
}

@end
