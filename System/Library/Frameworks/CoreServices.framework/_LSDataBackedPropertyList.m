@implementation _LSDataBackedPropertyList

- (id).cxx_construct
{
  *((_DWORD *)self + 6) = 0;
  return self;
}

- (void)detach
{
  os_unfair_lock_s *p_lock;
  NSData *v4;
  NSData *rawPlistData;

  p_lock = (os_unfair_lock_s *)&self->_lock;
  os_unfair_lock_lock((os_unfair_lock_t)&self->_lock);
  v4 = (NSData *)-[NSData copy](self->_rawPlistData, "copy");
  rawPlistData = self->_rawPlistData;
  self->_rawPlistData = v4;

  os_unfair_lock_unlock(p_lock);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_plistHint, 0);
  objc_storeStrong((id *)&self->_rawPlistData, 0);
}

- (BOOL)_getPropertyList:(id *)a3
{
  os_unfair_lock_s *p_lock;
  NSData *rawPlistData;
  void *v7;

  p_lock = (os_unfair_lock_s *)&self->_lock;
  os_unfair_lock_lock((os_unfair_lock_t)&self->_lock);
  rawPlistData = self->_rawPlistData;
  -[_LSDataBackedPropertyList _plistHint](self, "_plistHint");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  _LSPlistDataGetDictionary(rawPlistData, (uint64_t)v7);
  *a3 = (id)objc_claimAutoreleasedReturnValue();

  LOBYTE(a3) = *a3 != 0;
  os_unfair_lock_unlock(p_lock);
  return (char)a3;
}

- (BOOL)_getValue:(id *)a3 forPropertyListKey:(id)a4
{
  id v6;
  os_unfair_lock_s *p_lock;
  NSData *rawPlistData;
  void *v9;

  v6 = a4;
  p_lock = (os_unfair_lock_s *)&self->_lock;
  os_unfair_lock_lock((os_unfair_lock_t)&self->_lock);
  rawPlistData = self->_rawPlistData;
  -[_LSDataBackedPropertyList _plistHint](self, "_plistHint");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  _LSPlistDataGetValueForKey(rawPlistData, (uint64_t)v6, (uint64_t)v9);
  *a3 = (id)objc_claimAutoreleasedReturnValue();

  LOBYTE(a3) = *a3 != 0;
  os_unfair_lock_unlock(p_lock);

  return (char)a3;
}

- (id)_plistHint
{
  _LSPlistHint *v3;
  NSData *v4;
  _LSPlistHint *v5;
  _LSPlistHint *plistHint;

  os_unfair_lock_assert_owner((const os_unfair_lock *)&self->_lock);
  v3 = self->_plistHint;
  if (!v3)
  {
    v4 = self->_rawPlistData;
    _LSPlistDataGetHint(v4);
    v5 = (_LSPlistHint *)objc_claimAutoreleasedReturnValue();
    plistHint = self->_plistHint;
    self->_plistHint = v5;

    v3 = self->_plistHint;
  }
  return v3;
}

- (_LSDataBackedPropertyList)initWithPropertyListData:(id)a3
{
  id v5;
  _LSDataBackedPropertyList *v6;
  _LSDataBackedPropertyList *v7;
  _LSPlistHint *plistHint;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_LSDataBackedPropertyList;
  v6 = -[_LSLazyPropertyList init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_rawPlistData, a3);
    plistHint = v7->_plistHint;
    v7->_plistHint = 0;

  }
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)_LSDataBackedPropertyList;
  -[_LSLazyPropertyList encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  os_unfair_lock_lock((os_unfair_lock_t)&self->_lock);
  objc_msgSend(v4, "encodeObject:forKey:", self->_rawPlistData, CFSTR("plistData"));
  os_unfair_lock_unlock((os_unfair_lock_t)&self->_lock);

}

- (_LSDataBackedPropertyList)initWithCoder:(id)a3
{
  id v4;
  _LSDataBackedPropertyList *v5;
  NSData *v6;
  NSData *rawPlistData;
  NSData *v8;
  _LSPlistHint *plistHint;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_LSDataBackedPropertyList;
  v5 = -[_LSLazyPropertyList initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("plistData"));
    v6 = (NSData *)objc_claimAutoreleasedReturnValue();
    rawPlistData = v5->_rawPlistData;
    v5->_rawPlistData = v6;
    v8 = v6;

    plistHint = v5->_plistHint;
    v5->_plistHint = 0;

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  os_unfair_lock_s *p_lock;
  _LSDataBackedPropertyList *v5;
  void *v6;
  _LSDataBackedPropertyList *v7;
  uint64_t v8;
  _LSPlistHint *plistHint;

  p_lock = (os_unfair_lock_s *)&self->_lock;
  os_unfair_lock_lock((os_unfair_lock_t)&self->_lock);
  v5 = [_LSDataBackedPropertyList alloc];
  v6 = (void *)-[NSData copy](self->_rawPlistData, "copy");
  v7 = -[_LSDataBackedPropertyList initWithPropertyListData:](v5, "initWithPropertyListData:", v6);

  if (v7)
  {
    _LSPlistHintCopy(self->_plistHint);
    v8 = objc_claimAutoreleasedReturnValue();
    plistHint = v7->_plistHint;
    v7->_plistHint = (_LSPlistHint *)v8;

  }
  os_unfair_lock_unlock(p_lock);
  return v7;
}

- (id)uncheckedObjectsForKeys:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  NSData *rawPlistData;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  p_lock = (os_unfair_lock_s *)&self->_lock;
  os_unfair_lock_lock((os_unfair_lock_t)&self->_lock);
  rawPlistData = self->_rawPlistData;
  -[_LSDataBackedPropertyList _plistHint](self, "_plistHint");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  _LSPlistDataGetValuesForKeys(rawPlistData, v4, (uint64_t)v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0C9AA70];
  if (v8)
    v9 = v8;
  v10 = v9;
  os_unfair_lock_unlock(p_lock);

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)prewarm
{
  int v3;

  v3 = *a1;
  *(_DWORD *)buf = 67109120;
  *((_DWORD *)buf + 1) = v3;
  _os_log_error_impl(&dword_182882000, log, OS_LOG_TYPE_ERROR, "could not prewarm data backed property list: %d", buf, 8u);
}

@end
