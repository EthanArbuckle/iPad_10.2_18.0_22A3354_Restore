@implementation WKSecureCodingURLWrapper

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id).cxx_construct
{
  *((_QWORD *)self + 5) = 0;
  return self;
}

- (WKSecureCodingURLWrapper)initWithURL:(id)a3
{
  WKSecureCodingURLWrapper *v4;
  void *m_ptr;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WKSecureCodingURLWrapper;
  v4 = -[WKSecureCodingURLWrapper initWithString:](&v7, sel_initWithString_, &stru_1E351F1B8);
  if (v4)
  {
    if (a3)
      CFRetain(a3);
    m_ptr = v4->m_wrappedURL.m_ptr;
    v4->m_wrappedURL.m_ptr = a3;
    if (m_ptr)
      CFRelease(m_ptr);
  }
  return v4;
}

- (void).cxx_destruct
{
  void *m_ptr;

  m_ptr = self->m_wrappedURL.m_ptr;
  self->m_wrappedURL.m_ptr = 0;
  if (m_ptr)
    CFRelease(m_ptr);
}

- (NSURL)wrappedURL
{
  return (NSURL *)self->m_wrappedURL.m_ptr;
}

- (WKSecureCodingURLWrapper)initWithCoder:(id)a3
{
  WKSecureCodingURLWrapper *v4;
  const UInt8 *v5;
  CFURLRef v6;
  void *m_ptr;
  CFIndex length;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)WKSecureCodingURLWrapper;
  v4 = -[WKSecureCodingURLWrapper initWithString:](&v10, sel_initWithString_, &stru_1E351F1B8);
  if (v4)
  {
    length = 0;
    v5 = (const UInt8 *)objc_msgSend(a3, "decodeBytesWithReturnedLength:", &length);
    if (v5)
    {
      v6 = CFURLCreateAbsoluteURLWithBytes(0, v5, length, 0x8000100u, 0, 1u);
      m_ptr = v4->m_wrappedURL.m_ptr;
      v4->m_wrappedURL.m_ptr = v6;
      if (m_ptr)
        CFRelease(m_ptr);
    }
    if (!v4->m_wrappedURL.m_ptr)
      WTF::RetainPtr<objc_object *>::operator=((const void **)&v4->m_wrappedURL.m_ptr, (CFTypeRef)objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", &stru_1E351F1B8));
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  void *m_ptr;
  WTF *v5;
  const __CFURL *v6;
  void *v7;
  WTF *v9;
  unsigned int v10;
  uint64_t v11;

  m_ptr = self->m_wrappedURL.m_ptr;
  if (!m_ptr)
  {
    __break(0xC471u);
    JUMPOUT(0x196C89E68);
  }
  v5 = (WTF *)objc_msgSend(m_ptr, "absoluteURL");
  WTF::bytesAsVector(v5, v6);
  objc_msgSend(a3, "encodeBytes:length:", v9, v10);
  if (&v11 != (uint64_t *)v9 && v9 != 0)
    WTF::fastFree(v9, v7);
}

@end
