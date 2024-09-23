@implementation _WKApplicationManifestIcon

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_WKApplicationManifestIcon)initWithCoder:(id)a3
{
  _WKApplicationManifestIcon *v4;
  uint64_t v5;
  void *m_ptr;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v4 = -[_WKApplicationManifestIcon init](self, "init");
  if (v4)
  {
    v5 = objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("src")), "copy");
    m_ptr = v4->_src.m_ptr;
    v4->_src.m_ptr = (void *)v5;
    if (m_ptr)
      CFRelease(m_ptr);
    v7 = (void *)MEMORY[0x1E0C99E60];
    v17[0] = objc_opt_class();
    v17[1] = objc_opt_class();
    v8 = objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v7, "setWithArray:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2)), CFSTR("sizes")), "copy");
    v9 = v4->_sizes.m_ptr;
    v4->_sizes.m_ptr = (void *)v8;
    if (v9)
      CFRelease(v9);
    v10 = objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("type")), "copy");
    v11 = v4->_type.m_ptr;
    v4->_type.m_ptr = (void *)v10;
    if (v11)
      CFRelease(v11);
    v12 = (void *)MEMORY[0x1E0C99E60];
    v16[0] = objc_opt_class();
    v16[1] = objc_opt_class();
    v13 = objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v12, "setWithArray:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2)), CFSTR("purposes")), "copy");
    v14 = v4->_purposes.m_ptr;
    v4->_purposes.m_ptr = (void *)v13;
    if (v14)
      CFRelease(v14);
  }
  return v4;
}

- (_WKApplicationManifestIcon)initWithCoreIcon:(const void *)a3
{
  _WKApplicationManifestIcon *v4;
  _WKApplicationManifestIcon *v5;
  uint64_t v6;
  void *m_ptr;
  void *v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  const __CFString *v12;
  void *v13;
  __CFString *v14;
  uint64_t v15;
  void *v16;
  int v17;
  id v18;
  void *v19;

  v4 = objc_alloc_init(_WKApplicationManifestIcon);
  v5 = v4;
  if (a3 && v4)
  {
    v6 = objc_msgSend((id)WTF::URL::operator NSURL *(), "copy");
    m_ptr = v5->_src.m_ptr;
    v5->_src.m_ptr = (void *)v6;
    if (m_ptr)
      CFRelease(m_ptr);
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", *((unsigned int *)a3 + 13));
    v9 = *((unsigned int *)a3 + 13);
    if ((_DWORD)v9)
    {
      v10 = (_QWORD *)*((_QWORD *)a3 + 5);
      v11 = 8 * v9;
      while (*v10)
      {
        v12 = (const __CFString *)WTF::StringImpl::operator NSString *();
        if (v12)
          goto LABEL_9;
LABEL_10:
        ++v10;
        v11 -= 8;
        if (!v11)
          goto LABEL_13;
      }
      v12 = &stru_1E351F1B8;
LABEL_9:
      objc_msgSend(v8, "addObject:", v12);
      goto LABEL_10;
    }
LABEL_13:
    v13 = v5->_sizes.m_ptr;
    v5->_sizes.m_ptr = v8;
    if (v13)
      CFRelease(v13);
    if (*((_QWORD *)a3 + 7))
      v14 = (__CFString *)WTF::StringImpl::operator NSString *();
    else
      v14 = &stru_1E351F1B8;
    v15 = -[__CFString copy](v14, "copy");
    v16 = v5->_type.m_ptr;
    v5->_type.m_ptr = (void *)v15;
    if (v16)
      CFRelease(v16);
    v17 = *((unsigned __int8 *)a3 + 64);
    v18 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if (v17)
    {
      do
      {
        objc_msgSend(v18, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", (v17 & -(char)v17)));
        v17 &= v17 - 1;
      }
      while ((_BYTE)v17);
    }
    v19 = v5->_purposes.m_ptr;
    v5->_purposes.m_ptr = v18;
    if (v19)
      CFRelease(v19);
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_src.m_ptr, CFSTR("src"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_sizes.m_ptr, CFSTR("sizes"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_type.m_ptr, CFSTR("type"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_purposes.m_ptr, CFSTR("purposes"));
}

- (NSURL)src
{
  return (NSURL *)self->_src.m_ptr;
}

- (NSArray)sizes
{
  return (NSArray *)self->_sizes.m_ptr;
}

- (NSString)type
{
  return (NSString *)self->_type.m_ptr;
}

- (NSArray)purposes
{
  return (NSArray *)self->_purposes.m_ptr;
}

- (void)dealloc
{
  objc_class *v3;
  objc_super v4;

  v3 = (objc_class *)objc_opt_class();
  if ((WebCoreObjCScheduleDeallocateOnMainRunLoop(v3, (objc_object *)self) & 1) == 0)
  {
    v4.receiver = self;
    v4.super_class = (Class)_WKApplicationManifestIcon;
    -[_WKApplicationManifestIcon dealloc](&v4, sel_dealloc);
  }
}

- (void).cxx_destruct
{
  void *m_ptr;
  void *v4;
  void *v5;
  void *v6;

  m_ptr = self->_purposes.m_ptr;
  self->_purposes.m_ptr = 0;
  if (m_ptr)
    CFRelease(m_ptr);
  v4 = self->_type.m_ptr;
  self->_type.m_ptr = 0;
  if (v4)
    CFRelease(v4);
  v5 = self->_sizes.m_ptr;
  self->_sizes.m_ptr = 0;
  if (v5)
    CFRelease(v5);
  v6 = self->_src.m_ptr;
  self->_src.m_ptr = 0;
  if (v6)
    CFRelease(v6);
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

@end
