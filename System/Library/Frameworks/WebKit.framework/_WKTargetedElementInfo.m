@implementation _WKTargetedElementInfo

- (void)dealloc
{
  objc_class *v3;
  void *v4;
  unsigned int *v5;
  unsigned int v6;
  unsigned int v7;
  objc_super v8;

  v3 = (objc_class *)objc_opt_class();
  if ((WebCoreObjCScheduleDeallocateOnMainRunLoop(v3, (objc_object *)self) & 1) == 0)
  {
    v5 = *(unsigned int **)self[3]._info.data.__lx;
    *(_QWORD *)self[3]._info.data.__lx = 0;
    if (v5)
    {
      do
      {
        v6 = __ldaxr(v5);
        v7 = v6 - 1;
      }
      while (__stlxr(v7, v5));
      if (!v7)
      {
        atomic_store(1u, v5);
        WTF::fastFree((WTF *)v5, v4);
      }
    }
    WebCore::TargetedElementInfo::~TargetedElementInfo((WebCore::TargetedElementInfo *)&self->_info.data.__lx[16], (WTF::StringImpl *)v4);
    v8.receiver = self;
    v8.super_class = (Class)_WKTargetedElementInfo;
    -[_WKTargetedElementInfo dealloc](&v8, sel_dealloc);
  }
}

- (Object)_apiObject
{
  return (Object *)&self->_info;
}

- (int64_t)positionType
{
  unsigned int v2;

  v2 = self[2]._info.data.__lx[16] - 1;
  if (v2 > 5)
    return 0;
  else
    return qword_1978CF9D8[(char)v2];
}

- (CGRect)bounds
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  WebCore::FloatRect::operator CGRect();
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (CGRect)boundsInWebView
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  API::TargetedElementInfo::boundsInWebView((API::TargetedElementInfo *)&self->_info);
  WebCore::FloatRect::operator CGRect();
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (CGRect)boundsInClientCoordinates
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  WebCore::FloatRect::operator CGRect();
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (NSArray)selectors
{
  NSArray *v2;
  CFTypeRef v4;
  CFTypeRef v5;
  CFTypeRef cf;

  if (!*(_DWORD *)&self[1]._info.data.__lx[44] || BYTE2(self[3].super.isa))
    return (NSArray *)MEMORY[0x1E0C9AA60];
  WTF::createNSArray<WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc> const&>(*(_QWORD *)&self[1]._info.data.__lx[32], (uint64_t *)&cf);
  v4 = cf;
  cf = 0;
  v2 = (id)CFMakeCollectable(v4);
  v5 = cf;
  cf = 0;
  if (v5)
    CFRelease(v5);
  return v2;
}

- (NSArray)selectorsIncludingShadowHosts
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  const __CFString *v11;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", *(unsigned int *)&self[1]._info.data.__lx[44]);
  v4 = *(unsigned int *)&self[1]._info.data.__lx[44];
  if ((_DWORD)v4)
  {
    v5 = *(_QWORD *)&self[1]._info.data.__lx[32];
    v6 = v5 + 16 * v4;
    do
    {
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", *(unsigned int *)(v5 + 12));
      v8 = *(unsigned int *)(v5 + 12);
      if ((_DWORD)v8)
      {
        v9 = *(_QWORD **)v5;
        v10 = 8 * v8;
        do
        {
          if (*v9)
            v11 = (const __CFString *)WTF::StringImpl::operator NSString *();
          else
            v11 = &stru_1E351F1B8;
          objc_msgSend(v7, "addObject:", v11);
          ++v9;
          v10 -= 8;
        }
        while (v10);
      }
      objc_msgSend(v3, "addObject:", v7);
      if (v7)
        CFRelease(v7);
      v5 += 16;
    }
    while (v5 != v6);
  }
  return (NSArray *)(id)CFMakeCollectable(v3);
}

- (NSString)renderedText
{
  if (*(_QWORD *)&self[1]._info.data.__lx[8])
    return (NSString *)WTF::StringImpl::operator NSString *();
  else
    return (NSString *)&stru_1E351F1B8;
}

- (NSString)searchableText
{
  if (*(_QWORD *)&self[1]._info.data.__lx[16])
    return (NSString *)WTF::StringImpl::operator NSString *();
  else
    return (NSString *)&stru_1E351F1B8;
}

- (NSString)screenReaderText
{
  if (*(_QWORD *)&self[1]._info.data.__lx[24])
    return (NSString *)WTF::StringImpl::operator NSString *();
  else
    return (NSString *)&stru_1E351F1B8;
}

- (unint64_t)offsetEdges
{
  int v2;
  unint64_t v3;

  v2 = *(_DWORD *)self[1]._info.data.__lx;
  v3 = ((v2 & 0xFF000000) != 0) | (2 * ((_BYTE)v2 != 0));
  if ((v2 & 0xFF0000) != 0)
    v3 |= 8uLL;
  if ((v2 & 0xFF00) != 0)
    return v3 | 4;
  else
    return v3;
}

- (void)getChildFrames:(id)a3
{
  void *v4;
  _QWORD *v5;
  uint64_t v6;
  _QWORD *v7;

  v4 = _Block_copy(a3);
  v5 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
  *v5 = off_1E34C36C0;
  v5[1] = v4;
  v7 = v5;
  API::TargetedElementInfo::childFrames((uint64_t)&self->_info, (uint64_t *)&v7);
  v6 = (uint64_t)v7;
  v7 = 0;
  if (v6)
    (*(void (**)(uint64_t))(*(_QWORD *)v6 + 8))(v6);
  _Block_release(0);
}

- (BOOL)isSameElement:(id)a3
{
  return API::TargetedElementInfo::isSameElement(self->_info.data.__lx, (_QWORD *)a3 + 2);
}

- (BOOL)isNearbyTarget
{
  return (BOOL)self[3].super.isa;
}

- (BOOL)isInVisibilityAdjustmentSubtree
{
  return BYTE3(self[3].super.isa);
}

- (BOOL)hasLargeReplacedDescendant
{
  return BYTE4(self[3].super.isa);
}

- (NSSet)mediaAndLinkURLs
{
  void *v3;
  unsigned __int8 *v4;
  WTF **v5;
  WTF **v6;
  WTF **v7;
  WTF **v8;
  uint64_t v9;
  int v10;
  int v11;

  v3 = (void *)objc_opt_new();
  v4 = &self[2]._info.data.__lx[40];
  v5 = WTF::HashTable<WTF::URL,WTF::URL,WTF::IdentityExtractor,WTF::DefaultHash<WTF::URL>,WTF::HashTraits<WTF::URL>,WTF::HashTraits<WTF::URL>>::begin((uint64_t *)&self[2]._info.data.__lx[40]);
  v6 = v5;
  v8 = v7;
  if (*(_QWORD *)v4)
    v9 = *(_QWORD *)v4 + 40 * *(unsigned int *)(*(_QWORD *)v4 - 4);
  else
    v9 = 0;
  if ((WTF **)v9 != v5)
  {
    do
    {
      objc_msgSend(v3, "addObject:", WTF::URL::operator NSURL *());
      while (1)
      {
        v6 += 5;
        if (v6 == v8)
          break;
        v10 = WTF::HashTraitsEmptyValueChecker<WTF::HashTraits<WTF::URL>,false>::isEmptyValue<WTF::URL>(v6);
        if (*v6 == (WTF *)-1)
          v11 = 1;
        else
          v11 = v10;
        if (v11 != 1)
          goto LABEL_13;
      }
      v6 = v8;
LABEL_13:
      ;
    }
    while (v6 != (WTF **)v9);
  }
  return (NSSet *)(id)CFMakeCollectable(v3);
}

- (BOOL)isPseudoElement
{
  return BYTE1(self[3].super.isa);
}

- (BOOL)isInShadowTree
{
  return BYTE2(self[3].super.isa);
}

- (BOOL)hasAudibleMedia
{
  return BYTE5(self[3].super.isa);
}

- (void)takeSnapshotWithCompletionHandler:(id)a3
{
  void *v4;
  _QWORD *v5;
  uint64_t v6;
  _QWORD *v7;

  v4 = _Block_copy(a3);
  v5 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
  *v5 = off_1E34C36E8;
  v5[1] = v4;
  v7 = v5;
  API::TargetedElementInfo::takeSnapshot((uint64_t)&self->_info, (uint64_t *)&v7);
  v6 = (uint64_t)v7;
  v7 = 0;
  if (v6)
    (*(void (**)(uint64_t))(*(_QWORD *)v6 + 8))(v6);
  _Block_release(0);
}

- (NSString)debugDescription
{
  uint64_t v3;
  uint64_t v4;
  WTF::StringImpl *v5;
  float v6;
  float v7;
  float v8;
  float v9;
  void *v10;
  uint64_t v11;
  const __CFString *v12;
  WTF::StringImpl *v13;
  NSString *v14;

  v3 = *(unsigned int *)&self[1]._info.data.__lx[44];
  if ((_DWORD)v3 && (v4 = *(_QWORD *)&self[1]._info.data.__lx[32] + 16 * v3, *(_DWORD *)(v4 - 4)))
  {
    v5 = **(WTF::StringImpl ***)(v4 - 16);
    if (v5)
      *(_DWORD *)v5 += 2;
  }
  else
  {
    v5 = 0;
  }
  v6 = *(float *)&self[2].super.isa;
  v7 = *((float *)&self[2].super.isa + 1);
  v8 = *(float *)self[2]._anon_8;
  v9 = *(float *)&self[2]._anon_8[4];
  v10 = (void *)MEMORY[0x1E0CB3940];
  v11 = objc_opt_class();
  if (v5)
    v12 = (const __CFString *)WTF::StringImpl::operator NSString *();
  else
    v12 = &stru_1E351F1B8;
  v14 = (NSString *)objc_msgSend(v10, "stringWithFormat:", CFSTR("<%@ %p \"%@\" at {{%.0f,%.0f},{%.0f,%.0f}}>"), v11, self, v12, v6, v7, v8, v9);
  if (v5)
  {
    if (*(_DWORD *)v5 == 2)
      WTF::StringImpl::destroy(v5, v13);
    else
      *(_DWORD *)v5 -= 2;
  }
  return v14;
}

- (uint64_t)getChildFrames:(uint64_t)a1
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  CFTypeRef v8;

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", *((unsigned int *)a2 + 3));
  v5 = *((unsigned int *)a2 + 3);
  if ((_DWORD)v5)
  {
    v6 = *a2;
    v7 = 8 * v5;
    do
    {
      if (*(_QWORD *)(*(_QWORD *)v6 + 8))
        objc_msgSend(v4, "addObject:");
      v6 += 8;
      v7 -= 8;
    }
    while (v7);
  }
  v8 = (id)CFMakeCollectable(v4);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 8) + 16))();
}

- (uint64_t)getChildFrames:(const void *)a1
{
  void *v2;

  *a1 = off_1E34C36C0;
  _Block_release(a1[1]);
  return WTF::fastFree((WTF *)a1, v2);
}

- (uint64_t)takeSnapshotWithCompletionHandler:(uint64_t)a1
{
  void *v3;
  CFTypeRef cf;
  WTF *v6;

  if (!*(_BYTE *)(a2 + 64))
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 8) + 16))();
  WebCore::ShareableBitmap::create();
  if (!v6)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 8) + 16))();
  WebCore::ShareableBitmap::makeCGImage();
  (*(void (**)(void))(*(_QWORD *)(a1 + 8) + 16))();
  if (cf)
    CFRelease(cf);
  return WTF::ThreadSafeRefCounted<WebCore::ShareableBitmap,(WTF::DestructionThread)0>::deref((uint64_t)v6, v3);
}

- (uint64_t)takeSnapshotWithCompletionHandler:(const void *)a1
{
  void *v2;

  *a1 = off_1E34C36E8;
  _Block_release(a1[1]);
  return WTF::fastFree((WTF *)a1, v2);
}

@end
