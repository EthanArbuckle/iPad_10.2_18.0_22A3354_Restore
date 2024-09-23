@implementation _WKApplicationManifestShortcut

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_WKApplicationManifestShortcut)initWithCoder:(id)a3
{
  _WKApplicationManifestShortcut *v4;
  uint64_t v5;
  void *m_ptr;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = -[_WKApplicationManifestShortcut init](self, "init");
  if (v4)
  {
    v5 = objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name")), "copy");
    m_ptr = v4->_name.m_ptr;
    v4->_name.m_ptr = (void *)v5;
    if (m_ptr)
      CFRelease(m_ptr);
    v7 = objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("url")), "copy");
    v8 = v4->_url.m_ptr;
    v4->_url.m_ptr = (void *)v7;
    if (v8)
      CFRelease(v8);
    v9 = (void *)MEMORY[0x1E0C99E60];
    v14 = objc_opt_class();
    v15 = objc_opt_class();
    v16 = objc_opt_class();
    v10 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v14, 3);
    v11 = objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v9, "setWithArray:", v10, v14, v15), CFSTR("icons")), "copy");
    v12 = v4->_icons.m_ptr;
    v4->_icons.m_ptr = (void *)v11;
    if (v12)
      CFRelease(v12);
  }
  return v4;
}

- (NSString)name
{
  return (NSString *)self->_name.m_ptr;
}

- (NSURL)url
{
  return (NSURL *)self->_url.m_ptr;
}

- (NSArray)icons
{
  return (NSArray *)self->_icons.m_ptr;
}

- (_WKApplicationManifestShortcut)initWithCoreShortcut:(const void *)a3
{
  _WKApplicationManifestShortcut *v4;
  _WKApplicationManifestShortcut *v5;
  __CFString *v6;
  uint64_t v7;
  void *m_ptr;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _WKApplicationManifestIcon *v15;
  void *v16;

  v4 = objc_alloc_init(_WKApplicationManifestShortcut);
  v5 = v4;
  if (a3 && v4)
  {
    if (*(_QWORD *)a3)
      v6 = (__CFString *)WTF::StringImpl::operator NSString *();
    else
      v6 = &stru_1E351F1B8;
    v7 = -[__CFString copy](v6, "copy");
    m_ptr = v5->_name.m_ptr;
    v5->_name.m_ptr = (void *)v7;
    if (m_ptr)
      CFRelease(m_ptr);
    v9 = objc_msgSend((id)WTF::URL::operator NSURL *(), "copy");
    v10 = v5->_url.m_ptr;
    v5->_url.m_ptr = (void *)v9;
    if (v10)
      CFRelease(v10);
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", *((unsigned int *)a3 + 15));
    v12 = *((unsigned int *)a3 + 15);
    if ((_DWORD)v12)
    {
      v13 = *((_QWORD *)a3 + 6);
      v14 = 72 * v12;
      do
      {
        v15 = -[_WKApplicationManifestIcon initWithCoreIcon:]([_WKApplicationManifestIcon alloc], "initWithCoreIcon:", v13);
        if (v15)
        {
          objc_msgSend(v11, "addObject:", v15);
          CFRelease(v15);
        }
        v13 += 72;
        v14 -= 72;
      }
      while (v14);
    }
    v16 = v5->_icons.m_ptr;
    v5->_icons.m_ptr = v11;
    if (v16)
      CFRelease(v16);
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_name.m_ptr, CFSTR("name"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_url.m_ptr, CFSTR("url"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_icons.m_ptr, CFSTR("icons"));
}

- (void)dealloc
{
  objc_class *v3;
  objc_super v4;

  v3 = (objc_class *)objc_opt_class();
  if ((WebCoreObjCScheduleDeallocateOnMainRunLoop(v3, (objc_object *)self) & 1) == 0)
  {
    v4.receiver = self;
    v4.super_class = (Class)_WKApplicationManifestShortcut;
    -[_WKApplicationManifestShortcut dealloc](&v4, sel_dealloc);
  }
}

- (void).cxx_destruct
{
  void *m_ptr;
  void *v4;
  void *v5;

  m_ptr = self->_icons.m_ptr;
  self->_icons.m_ptr = 0;
  if (m_ptr)
    CFRelease(m_ptr);
  v4 = self->_url.m_ptr;
  self->_url.m_ptr = 0;
  if (v4)
    CFRelease(v4);
  v5 = self->_name.m_ptr;
  self->_name.m_ptr = 0;
  if (v5)
    CFRelease(v5);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 3) = 0;
  return self;
}

@end
