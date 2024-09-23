@implementation WKNSArray

- (id)objectAtIndex:(unint64_t)a3
{
  uint64_t v3;
  const void *v4;

  if (*((unsigned int *)self + 9) <= a3)
  {
    __break(0xC471u);
  }
  else
  {
    v3 = *(_QWORD *)(*((_QWORD *)self + 3) + 8 * a3);
    if (v3)
    {
      CFRetain(*(CFTypeRef *)(v3 + 8));
      v4 = *(const void **)(v3 + 8);
      CFRelease(v4);
      return (id)v4;
    }
    else
    {
      return (id)objc_msgSend(MEMORY[0x1E0C99E38], "null");
    }
  }
  return self;
}

- (unint64_t)count
{
  return *(unsigned int *)&self->_array.data.__lx[28];
}

- (Object)_apiObject
{
  return (Object *)&self->_array;
}

- (void)dealloc
{
  objc_class *v3;
  void *v4;
  objc_super v5;

  v3 = (objc_class *)objc_opt_class();
  if ((WebCoreObjCScheduleDeallocateOnMainRunLoop(v3, (objc_object *)self) & 1) == 0)
  {
    WTF::Vector<WTF::Ref<WebKit::WebExtensionDataRecord,WTF::RawPtrTraits<WebKit::WebExtensionDataRecord>,WTF::DefaultRefDerefTraits<WebKit::WebExtensionDataRecord>>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&self->_array.data.__lx[16], v4);
    v5.receiver = self;
    v5.super_class = (Class)WKNSArray;
    -[WKNSArray dealloc](&v5, sel_dealloc);
  }
}

@end
