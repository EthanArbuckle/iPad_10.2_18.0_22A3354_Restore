@implementation WKSecureCodingCGColorWrapper

- (CGColor)wrappedColor
{
  return (CGColor *)self->m_wrappedColor.m_ptr;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  if (self->m_wrappedColor.m_ptr)
    objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(MEMORY[0x1E0CEA478], "colorWithCGColor:"), CFSTR("WK.CocoaColor"));
  else
    __break(0xC471u);
}

- (WKSecureCodingCGColorWrapper)initWithCoder:(id)a3
{
  WKSecureCodingCGColorWrapper *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *m_ptr;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)WKSecureCodingCGColorWrapper;
  v4 = -[WKSecureCodingCGColorWrapper init](&v11, sel_init);
  if (v4)
  {
    v5 = (void *)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WK.CocoaColor"));
    v6 = v5;
    if (v5)
      CFRetain(v5);
    v7 = (void *)objc_msgSend(v6, "CGColor");
    v8 = v7;
    if (v7)
      CFRetain(v7);
    m_ptr = v4->m_wrappedColor.m_ptr;
    v4->m_wrappedColor.m_ptr = v8;
    if (m_ptr)
      CFRelease(m_ptr);
    if (v6)
      CFRelease(v6);
  }
  return v4;
}

- (WKSecureCodingCGColorWrapper)initWithCGColor:(CGColor *)a3
{
  WKSecureCodingCGColorWrapper *v4;
  void *m_ptr;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WKSecureCodingCGColorWrapper;
  v4 = -[WKSecureCodingCGColorWrapper init](&v7, sel_init);
  if (v4)
  {
    if (a3)
      CFRetain(a3);
    m_ptr = v4->m_wrappedColor.m_ptr;
    v4->m_wrappedColor.m_ptr = a3;
    if (m_ptr)
      CFRelease(m_ptr);
  }
  return v4;
}

- (void).cxx_destruct
{
  void *m_ptr;

  m_ptr = self->m_wrappedColor.m_ptr;
  self->m_wrappedColor.m_ptr = 0;
  if (m_ptr)
    CFRelease(m_ptr);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  return self;
}

@end
