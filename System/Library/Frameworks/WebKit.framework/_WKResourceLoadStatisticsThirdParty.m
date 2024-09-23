@implementation _WKResourceLoadStatisticsThirdParty

- (void)dealloc
{
  objc_class *v3;
  objc_super v4;

  v3 = (objc_class *)objc_opt_class();
  if ((WebCoreObjCScheduleDeallocateOnMainRunLoop(v3, (objc_object *)self) & 1) == 0)
  {
    API::ResourceLoadStatisticsThirdParty::~ResourceLoadStatisticsThirdParty((WTF::StringImpl **)&self->_thirdParty);
    v4.receiver = self;
    v4.super_class = (Class)_WKResourceLoadStatisticsThirdParty;
    -[_WKResourceLoadStatisticsThirdParty dealloc](&v4, sel_dealloc);
  }
}

- (NSString)thirdPartyDomain
{
  if (*(_QWORD *)&self->_thirdParty.data.__lx[16])
    return (NSString *)WTF::StringImpl::operator NSString *();
  else
    return (NSString *)&stru_1E351F1B8;
}

- (NSArray)underFirstParties
{
  WTF::RunLoop *v3;
  WTF::RunLoop *v4;
  unsigned int v5;
  uint64_t v6;
  uint64_t v7;
  WTF::RunLoop *v8;
  uint64_t v9;
  _DWORD *v10;
  const void *v11;
  const void *v12;
  NSArray *result;

  v3 = (WTF::RunLoop *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", *(unsigned int *)&self->_thirdParty.data.__lx[36]);
  v4 = v3;
  v5 = *(_DWORD *)&self->_thirdParty.data.__lx[36];
  if (!v5)
    return (NSArray *)(id)CFMakeCollectable(v4);
  v6 = *(_QWORD *)&self->_thirdParty.data.__lx[24];
  v7 = v6 + 24 * v5;
  while (1)
  {
    v8 = (WTF::RunLoop *)WTF::RunLoop::main(v3);
    if ((WTF::RunLoop::isCurrent(v8) & 1) == 0)
      break;
    v9 = API::Object::newObject(0x28uLL, 95);
    *(_QWORD *)v9 = off_1E34CC2A8;
    WebKit::InitializeWebKit2((WebKit *)v9);
    *(_QWORD *)v9 = &off_1E34AAAB0;
    v10 = *(_DWORD **)v6;
    if (*(_QWORD *)v6)
      *v10 += 2;
    *(_QWORD *)(v9 + 16) = v10;
    *(_OWORD *)(v9 + 24) = *(_OWORD *)(v6 + 8);
    v11 = *(const void **)(v9 + 8);
    if (v11)
    {
      CFRetain(*(CFTypeRef *)(v9 + 8));
      CFRelease(*(CFTypeRef *)(v9 + 8));
      -[WTF::RunLoop addObject:](v4, "addObject:", v11);
      v12 = v11;
    }
    else
    {
      v12 = 0;
    }
    CFRelease(v12);
    v6 += 24;
    if (v6 == v7)
      return (NSArray *)(id)CFMakeCollectable(v4);
  }
  result = (NSArray *)39;
  __break(0xC471u);
  return result;
}

- (Object)_apiObject
{
  return (Object *)&self->_thirdParty;
}

@end
