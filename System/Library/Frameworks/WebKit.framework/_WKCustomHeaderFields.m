@implementation _WKCustomHeaderFields

- (_WKCustomHeaderFields)init
{
  _WKCustomHeaderFields *v2;
  _WKCustomHeaderFields *v3;
  uint64_t v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_WKCustomHeaderFields;
  v2 = -[_WKCustomHeaderFields init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v4 = -[_WKCustomHeaderFields _apiObject](v2, "_apiObject");
    *(_OWORD *)(v4 + 8) = 0u;
    *(_OWORD *)(v4 + 24) = 0u;
    *(_QWORD *)(v4 + 40) = 0;
    *(_QWORD *)v4 = off_1E34CC2A8;
    WebKit::InitializeWebKit2((WebKit *)v4);
    *(_OWORD *)(v4 + 16) = 0u;
    *(_OWORD *)(v4 + 32) = 0u;
    *(_QWORD *)v4 = &off_1E34AAA88;
    *(_QWORD *)(v4 + 8) = v3;
  }
  return v3;
}

- (void)dealloc
{
  objc_class *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v3 = (objc_class *)objc_opt_class();
  if ((WebCoreObjCScheduleDeallocateOnMainRunLoop(v3, (objc_object *)self) & 1) == 0)
  {
    WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&self->_fields.data.__lx[32], v4);
    WTF::Vector<WebCore::HTTPHeaderField,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&self->_fields.data.__lx[16], v5);
    v6.receiver = self;
    v6.super_class = (Class)_WKCustomHeaderFields;
    -[_WKCustomHeaderFields dealloc](&v6, sel_dealloc);
  }
}

- (NSDictionary)fields
{
  NSDictionary *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  const __CFString *v7;
  const __CFString *v8;

  v3 = (NSDictionary *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", *(unsigned int *)&self->_fields.data.__lx[28]);
  v4 = *(unsigned int *)&self->_fields.data.__lx[28];
  if ((_DWORD)v4)
  {
    v5 = 16 * v4;
    v6 = (_QWORD *)(*(_QWORD *)&self->_fields.data.__lx[16] + 8);
    do
    {
      if (*v6)
        v7 = (const __CFString *)WTF::StringImpl::operator NSString *();
      else
        v7 = &stru_1E351F1B8;
      if (*(v6 - 1))
        v8 = (const __CFString *)WTF::StringImpl::operator NSString *();
      else
        v8 = &stru_1E351F1B8;
      -[NSDictionary setObject:forKey:](v3, "setObject:forKey:", v7, v8);
      v6 += 2;
      v5 -= 16;
    }
    while (v5);
  }
  return v3;
}

- (void)setFields:(id)a3
{
  unint64_t v5;
  _QWORD *v6;
  void *v7;
  uint64_t v8;
  WTF *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v11 = 0;
  v12 = 0;
  v5 = objc_msgSend(a3, "count");
  if (v5)
  {
    if (v5 >> 28)
    {
      __break(0xC471u);
      return;
    }
    LODWORD(v12) = v5;
    v11 = WTF::fastMalloc((WTF *)(16 * v5));
  }
  v6 = malloc_type_malloc(0x28uLL, 0x10E0040274B6D37uLL);
  *v6 = MEMORY[0x1E0C809A0];
  v6[1] = 50331650;
  v6[2] = WTF::BlockPtr<void ()(objc_object *,objc_object *,BOOL *)>::fromCallable<-[_WKCustomHeaderFields setFields:]::$_0>(-[_WKCustomHeaderFields setFields:]::$_0)::{lambda(void *,objc_object *,objc_object *,BOOL *)#1}::__invoke;
  v6[3] = &WTF::BlockPtr<void ()(objc_object *,objc_object *,BOOL *)>::fromCallable<-[_WKCustomHeaderFields setFields:]::$_0>(-[_WKCustomHeaderFields setFields:]::$_0)::descriptor;
  v6[4] = &v11;
  objc_msgSend(a3, "enumerateKeysAndObjectsUsingBlock:", v6);
  _Block_release(v6);
  v8 = *(unsigned int *)&self->_fields.data.__lx[28];
  if ((_DWORD)v8)
    WTF::VectorDestructor<true,WebCore::HTTPHeaderField>::destruct(*(WTF::StringImpl **)&self->_fields.data.__lx[16], (WTF::StringImpl *)(*(_QWORD *)&self->_fields.data.__lx[16] + 16 * v8));
  v9 = *(WTF **)&self->_fields.data.__lx[16];
  if (v9)
  {
    *(_QWORD *)&self->_fields.data.__lx[16] = 0;
    *(_DWORD *)&self->_fields.data.__lx[24] = 0;
    WTF::fastFree(v9, v7);
  }
  *(_QWORD *)&self->_fields.data.__lx[16] = v11;
  v10 = v12;
  v11 = 0;
  v12 = 0;
  *(_QWORD *)&self->_fields.data.__lx[24] = v10;
  WTF::Vector<WebCore::HTTPHeaderField,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v11, v7);
}

- (NSArray)thirdPartyDomains
{
  id v2;
  const WTF::String *v3;
  void *v4;
  WTF *v5;
  uint64_t v6;
  CFTypeRef v7;
  NSArray *v8;
  void *v9;
  WTF *v11;
  unsigned int v12;
  CFTypeRef cf;

  WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::Vector((uint64_t)&v11, (uint64_t)&self->_fields.data.__lx[32]);
  v2 = objc_alloc(MEMORY[0x1E0C99DE8]);
  v4 = (void *)objc_msgSend(v2, "initWithCapacity:", v12);
  if (v12)
  {
    v5 = v11;
    v6 = 8 * v12;
    do
    {
      WTF::makeNSArrayElement(v5, v3);
      if (cf)
      {
        objc_msgSend(v4, "addObject:");
        v7 = cf;
        cf = 0;
        if (v7)
          CFRelease(v7);
      }
      v5 = (WTF *)((char *)v5 + 8);
      v6 -= 8;
    }
    while (v6);
  }
  v8 = (id)CFMakeCollectable(v4);
  WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v11, v9);
  return v8;
}

- (void)setThirdPartyDomains:(id)a3
{
  void *v4;
  uint64_t v5;
  WTF *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  WTF::makeVector<WTF::String>(a3, (uint64_t)&v8);
  v5 = *(unsigned int *)&self->_fields.data.__lx[44];
  if ((_DWORD)v5)
    WTF::VectorDestructor<true,WTF::String>::destruct(*(WTF::StringImpl **)&self->_fields.data.__lx[32], (WTF::StringImpl *)(*(_QWORD *)&self->_fields.data.__lx[32] + 8 * v5));
  v6 = *(WTF **)&self->_fields.data.__lx[32];
  if (v6)
  {
    *(_QWORD *)&self->_fields.data.__lx[32] = 0;
    *(_DWORD *)&self->_fields.data.__lx[40] = 0;
    WTF::fastFree(v6, v4);
  }
  *(_QWORD *)&self->_fields.data.__lx[32] = v8;
  v7 = v9;
  v8 = 0;
  v9 = 0;
  *(_QWORD *)&self->_fields.data.__lx[40] = v7;
  WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v8, v4);
}

- (Object)_apiObject
{
  return (Object *)&self->_fields;
}

- (uint64_t)setFields:
{
  WTF::StringImpl *v5;
  WTF::StringImpl *v6;
  WTF::StringImpl *v7;
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  int v11;
  _BOOL8 *v12;
  _BOOL8 v13;
  _BOOL8 v14;
  WTF::StringImpl *v15;
  WTF::StringImpl *v16;
  _BOOL8 v17;
  _BOOL8 v18;
  char v19;

  MEMORY[0x19AEABCC8](&v16);
  MEMORY[0x19AEABCC8](&v15, a3);
  WebCore::HTTPHeaderField::create();
  v6 = v15;
  v15 = 0;
  if (v6)
  {
    if (*(_DWORD *)v6 == 2)
      WTF::StringImpl::destroy(v6, v5);
    else
      *(_DWORD *)v6 -= 2;
  }
  v7 = v16;
  v16 = 0;
  if (v7)
  {
    if (*(_DWORD *)v7 == 2)
      WTF::StringImpl::destroy(v7, v5);
    else
      *(_DWORD *)v7 -= 2;
  }
  if (!v19)
    return std::__optional_destruct_base<WebCore::HTTPHeaderField,false>::~__optional_destruct_base[abi:sn180100]((uint64_t)&v17, v5);
  if (!v17)
    return std::__optional_destruct_base<WebCore::HTTPHeaderField,false>::~__optional_destruct_base[abi:sn180100]((uint64_t)&v17, v5);
  result = WTF::startsWithLettersIgnoringASCIICaseCommon<WTF::StringImpl>(v17, (uint64_t)"x-", 2uLL);
  if (!(_DWORD)result)
    return std::__optional_destruct_base<WebCore::HTTPHeaderField,false>::~__optional_destruct_base[abi:sn180100]((uint64_t)&v17, v5);
  if (v19)
  {
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(unsigned int *)(v9 + 12);
    if ((_DWORD)v10 == *(_DWORD *)(v9 + 8))
    {
      WTF::Vector<WebCore::HTTPHeaderField,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WebCore::HTTPHeaderField>(v9, (unint64_t)&v17);
    }
    else
    {
      v11 = v10 + 1;
      v12 = (_BOOL8 *)(*(_QWORD *)v9 + 16 * v10);
      v13 = v17;
      v17 = 0;
      *v12 = v13;
      v14 = v18;
      v18 = 0;
      v12[1] = v14;
      *(_DWORD *)(v9 + 12) = v11;
    }
    return std::__optional_destruct_base<WebCore::HTTPHeaderField,false>::~__optional_destruct_base[abi:sn180100]((uint64_t)&v17, v5);
  }
  __break(1u);
  return result;
}

@end
