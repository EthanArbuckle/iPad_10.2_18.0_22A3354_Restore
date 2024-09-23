@implementation NSHTTPCookieInternal_Ref

- (HTTPCookie)_inner
{
  return (HTTPCookie *)self->_fromRef;
}

- (void)dealloc
{
  CompactHTTPCookieReference *fromRef;
  objc_super v4;

  fromRef = self->_fromRef;
  if (fromRef)
  {
    (*((void (**)(CompactHTTPCookieReference *, SEL))fromRef->var0 + 1))(fromRef, a2);
    self->_fromRef = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)NSHTTPCookieInternal_Ref;
  -[NSHTTPCookieInternal_Ref dealloc](&v4, sel_dealloc);
}

- (id)_initWithReference:(const CompactCookieArray *)a3 index:(int64_t)a4
{
  int v4;
  NSHTTPCookieInternal_Ref *v6;
  CompactHTTPCookieReference *v7;
  CompactCookieArray *var1;
  const __CFData *v9;
  const UInt8 *BytePtr;
  const UInt8 *v11;
  uint64_t v12;
  const UInt8 *v13;
  objc_super v15;

  v4 = a4;
  v15.receiver = self;
  v15.super_class = (Class)NSHTTPCookieInternal_Ref;
  v6 = -[NSHTTPCookieInternal init](&v15, sel_init);
  if (v6)
  {
    v7 = (CompactHTTPCookieReference *)operator new();
    v7->var0 = (void **)&off_1E14ED960;
    v7->var1 = (CompactCookieArray *)a3;
    CFRetain((char *)a3 - 16);
    var1 = v7->var1;
    v9 = (const __CFData *)*((_QWORD *)var1 + 2);
    if (v9 && CFDataGetBytePtr(v9))
    {
      BytePtr = CFDataGetBytePtr(*((CFDataRef *)var1 + 2));
      v11 = (const UInt8 *)*((_QWORD *)var1 + 2);
      v12 = *(unsigned int *)&BytePtr[4 * v4 + 8];
      if (v11)
        v11 = CFDataGetBytePtr((CFDataRef)v11);
      v13 = &v11[v12];
    }
    else
    {
      v13 = 0;
    }
    v7->var2 = (CompactCookieHeader *)v13;
    v6->_fromRef = v7;
  }
  return v6;
}

- (NSHTTPCookieInternal_Ref)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NSHTTPCookieInternal_Ref;
  return -[NSHTTPCookieInternal init](&v3, sel_init);
}

@end
