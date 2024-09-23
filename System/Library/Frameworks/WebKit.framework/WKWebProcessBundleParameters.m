@implementation WKWebProcessBundleParameters

- (id)valueForKey:(id)a3
{
  return (id)objc_msgSend(self->_parameters.m_ptr, "valueForKey:", a3);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  return self;
}

- (WKWebProcessBundleParameters)initWithDictionary:(id)a3
{
  WKWebProcessBundleParameters *v4;
  uint64_t v5;
  void *m_ptr;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)WKWebProcessBundleParameters;
  v4 = -[WKWebProcessBundleParameters init](&v8, sel_init);
  if (v4)
  {
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:", a3);
    m_ptr = v4->_parameters.m_ptr;
    v4->_parameters.m_ptr = (void *)v5;
    if (m_ptr)
      CFRelease(m_ptr);
  }
  return v4;
}

- (void)setParameter:(id)a3 forKey:(id)a4
{
  -[WKWebProcessBundleParameters willChangeValueForKey:](self, "willChangeValueForKey:", a4);
  objc_msgSend(self->_parameters.m_ptr, "setValue:forKey:", a3, a4);
  -[WKWebProcessBundleParameters didChangeValueForKey:](self, "didChangeValueForKey:", a4);
}

- (id)description
{
  void *v3;
  objc_class *v4;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; parameters = %@>"),
               NSStringFromClass(v4),
               self,
               self->_parameters.m_ptr);
}

- (void)setParametersForKeyWithDictionary:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __66__WKWebProcessBundleParameters_setParametersForKeyWithDictionary___block_invoke;
  v3[3] = &unk_1E34CFC80;
  v3[4] = self;
  objc_msgSend(a3, "enumerateKeysAndObjectsUsingBlock:", v3);
}

uint64_t __66__WKWebProcessBundleParameters_setParametersForKeyWithDictionary___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setParameter:forKey:", a3, a2);
}

- (void).cxx_destruct
{
  void *m_ptr;

  m_ptr = self->_parameters.m_ptr;
  self->_parameters.m_ptr = 0;
  if (m_ptr)
    CFRelease(m_ptr);
}

@end
