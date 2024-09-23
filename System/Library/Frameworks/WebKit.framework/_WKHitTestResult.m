@implementation _WKHitTestResult

- (void)dealloc
{
  objc_class *v3;
  objc_super v4;

  v3 = (objc_class *)objc_opt_class();
  if ((WebCoreObjCScheduleDeallocateOnMainRunLoop(v3, (objc_object *)self) & 1) == 0)
  {
    (**(void (***)(ObjectStorage<API::HitTestResult> *))self->_hitTestResult.data.__lx)(&self->_hitTestResult);
    v4.receiver = self;
    v4.super_class = (Class)_WKHitTestResult;
    -[_WKHitTestResult dealloc](&v4, sel_dealloc);
  }
}

- (NSURL)absoluteImageURL
{
  const WTF::String *v2;
  WTF::StringImpl *v3;
  NSURL *v4;

  v2 = *(const WTF::String **)&self->_hitTestResult.data.__lx[16];
  if (v2)
    *(_DWORD *)v2 += 2;
  v4 = (NSURL *)URLFromString(v2);
  if (v2)
  {
    if (*(_DWORD *)v2 == 2)
      WTF::StringImpl::destroy(v2, v3);
    else
      *(_DWORD *)v2 -= 2;
  }
  return v4;
}

- (NSURL)absolutePDFURL
{
  const WTF::String *v2;
  WTF::StringImpl *v3;
  NSURL *v4;

  v2 = *(const WTF::String **)&self->_hitTestResult.data.__lx[24];
  if (v2)
    *(_DWORD *)v2 += 2;
  v4 = (NSURL *)URLFromString(v2);
  if (v2)
  {
    if (*(_DWORD *)v2 == 2)
      WTF::StringImpl::destroy(v2, v3);
    else
      *(_DWORD *)v2 -= 2;
  }
  return v4;
}

- (NSURL)absoluteLinkURL
{
  const WTF::String *v2;
  WTF::StringImpl *v3;
  NSURL *v4;

  v2 = *(const WTF::String **)&self->_hitTestResult.data.__lx[32];
  if (v2)
    *(_DWORD *)v2 += 2;
  v4 = (NSURL *)URLFromString(v2);
  if (v2)
  {
    if (*(_DWORD *)v2 == 2)
      WTF::StringImpl::destroy(v2, v3);
    else
      *(_DWORD *)v2 -= 2;
  }
  return v4;
}

- (BOOL)hasLocalDataForLinkURL
{
  return self[9]._hitTestResult.data.__lx[0];
}

- (NSString)linkLocalDataMIMEType
{
  Class isa;
  WTF::StringImpl *v3;
  NSString *v4;

  isa = self[9].super.isa;
  if (!isa)
    return (NSString *)&stru_1E351F1B8;
  *(_DWORD *)isa += 2;
  v4 = (NSString *)WTF::StringImpl::operator NSString *();
  if (*(_DWORD *)isa == 2)
    WTF::StringImpl::destroy(isa, v3);
  else
    *(_DWORD *)isa -= 2;
  return v4;
}

- (NSURL)absoluteMediaURL
{
  const WTF::String *v2;
  WTF::StringImpl *v3;
  NSURL *v4;

  v2 = *(const WTF::String **)&self->_hitTestResult.data.__lx[40];
  if (v2)
    *(_DWORD *)v2 += 2;
  v4 = (NSURL *)URLFromString(v2);
  if (v2)
  {
    if (*(_DWORD *)v2 == 2)
      WTF::StringImpl::destroy(v2, v3);
    else
      *(_DWORD *)v2 -= 2;
  }
  return v4;
}

- (NSString)linkLabel
{
  Class isa;
  WTF::StringImpl *v3;
  NSString *v4;

  isa = self[1].super.isa;
  if (!isa)
    return (NSString *)&stru_1E351F1B8;
  *(_DWORD *)isa += 2;
  v4 = (NSString *)WTF::StringImpl::operator NSString *();
  if (*(_DWORD *)isa == 2)
    WTF::StringImpl::destroy(isa, v3);
  else
    *(_DWORD *)isa -= 2;
  return v4;
}

- (NSString)linkTitle
{
  WTF::StringImpl *v2;
  WTF::StringImpl *v3;
  NSString *v4;

  v2 = *(WTF::StringImpl **)self[1]._hitTestResult.data.__lx;
  if (!v2)
    return (NSString *)&stru_1E351F1B8;
  *(_DWORD *)v2 += 2;
  v4 = (NSString *)WTF::StringImpl::operator NSString *();
  if (*(_DWORD *)v2 == 2)
    WTF::StringImpl::destroy(v2, v3);
  else
    *(_DWORD *)v2 -= 2;
  return v4;
}

- (NSString)lookupText
{
  WTF::StringImpl *v2;
  WTF::StringImpl *v3;
  NSString *v4;

  v2 = *(WTF::StringImpl **)self[8]._hitTestResult.data.__lx;
  if (!v2)
    return (NSString *)&stru_1E351F1B8;
  *(_DWORD *)v2 += 2;
  v4 = (NSString *)WTF::StringImpl::operator NSString *();
  if (*(_DWORD *)v2 == 2)
    WTF::StringImpl::destroy(v2, v3);
  else
    *(_DWORD *)v2 -= 2;
  return v4;
}

- (NSString)linkSuggestedFilename
{
  WTF::StringImpl *v2;
  WTF::StringImpl *v3;
  NSString *v4;

  v2 = *(WTF::StringImpl **)&self[1]._hitTestResult.data.__lx[8];
  if (!v2)
    return (NSString *)&stru_1E351F1B8;
  *(_DWORD *)v2 += 2;
  v4 = (NSString *)WTF::StringImpl::operator NSString *();
  if (*(_DWORD *)v2 == 2)
    WTF::StringImpl::destroy(v2, v3);
  else
    *(_DWORD *)v2 -= 2;
  return v4;
}

- (NSString)imageSuggestedFilename
{
  WTF::StringImpl *v2;
  WTF::StringImpl *v3;
  NSString *v4;

  v2 = *(WTF::StringImpl **)&self[1]._hitTestResult.data.__lx[16];
  if (!v2)
    return (NSString *)&stru_1E351F1B8;
  *(_DWORD *)v2 += 2;
  v4 = (NSString *)WTF::StringImpl::operator NSString *();
  if (*(_DWORD *)v2 == 2)
    WTF::StringImpl::destroy(v2, v3);
  else
    *(_DWORD *)v2 -= 2;
  return v4;
}

- (NSString)imageMIMEType
{
  WTF::StringImpl *v2;
  WTF::StringImpl *v3;
  NSString *v4;

  v2 = *(WTF::StringImpl **)&self[8]._hitTestResult.data.__lx[40];
  if (!v2)
    return (NSString *)&stru_1E351F1B8;
  *(_DWORD *)v2 += 2;
  v4 = (NSString *)WTF::StringImpl::operator NSString *();
  if (*(_DWORD *)v2 == 2)
    WTF::StringImpl::destroy(v2, v3);
  else
    *(_DWORD *)v2 -= 2;
  return v4;
}

- (BOOL)isContentEditable
{
  return self[1]._hitTestResult.data.__lx[24];
}

- (BOOL)isSelected
{
  return self[1]._hitTestResult.data.__lx[45];
}

- (BOOL)isMediaDownloadable
{
  return (BOOL)self[2].super.isa;
}

- (BOOL)isMediaFullscreen
{
  return BYTE1(self[2].super.isa);
}

- (CGRect)elementBoundingBox
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

- (int64_t)elementType
{
  int v2;

  v2 = BYTE3(self[2].super.isa);
  if (v2 == 2)
    return 2;
  else
    return v2 == 1;
}

- (WKFrameInfo)frameInfo
{
  WTF::StringImpl *v3;
  uint64_t v4;
  uint64_t v5;
  WKFrameInfo *v6;
  uint64_t v7;
  uint64_t v8;
  const void *v9;
  uint64_t v11;
  _BYTE v12[304];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  std::__optional_copy_base<WebKit::FrameInfoData,false>::__optional_copy_base[abi:sn180100]((WebKit::FrameInfoData *)v12, (const WebKit::FrameInfoData *)&self[2]._hitTestResult);
  if (v12[296])
  {
    v4 = *(_QWORD *)&self[12]._hitTestResult.data.__lx[8];
    if (v4)
    {
      v5 = *(_QWORD *)(v4 + 8);
      if (v5)
      {
        CFRetain(*(CFTypeRef *)(v5 - 8));
        v4 = v5 - 16;
      }
      else
      {
        v4 = 0;
      }
    }
    v11 = v4;
    v7 = API::Object::newObject(0x140uLL, 60);
    v8 = API::FrameInfo::FrameInfo(v7, (uint64_t)v12, &v11);
    v9 = *(const void **)(v8 + 8);
    if (v9)
      CFRetain(*(CFTypeRef *)(v8 + 8));
    v6 = (id)CFMakeCollectable(v9);
    CFRelease(*(CFTypeRef *)(v7 + 8));
    if (v11)
      CFRelease(*(CFTypeRef *)(v11 + 8));
  }
  else
  {
    v6 = 0;
  }
  std::__optional_destruct_base<WebKit::FrameInfoData,false>::~__optional_destruct_base[abi:sn180100]((uint64_t)v12, v3);
  return v6;
}

- (Object)_apiObject
{
  return (Object *)&self->_hitTestResult;
}

@end
