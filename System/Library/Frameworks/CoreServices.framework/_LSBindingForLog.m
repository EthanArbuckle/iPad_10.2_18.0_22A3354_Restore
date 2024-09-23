@implementation _LSBindingForLog

- (id).cxx_construct
{
  *((_DWORD *)self + 4) = 0;
  *((_QWORD *)self + 3) = 0;
  *((_DWORD *)self + 8) = 0;
  *((_QWORD *)self + 6) = 0;
  *((_QWORD *)self + 7) = 0;
  *((_QWORD *)self + 5) = 0;
  return self;
}

- (void).cxx_destruct
{

  objc_storeStrong((id *)&self->_db, 0);
}

- (_LSBindingForLog)initWithState:(const void *)a3 binding:(const LSBinding *)a4
{
  _LSBindingForLog *v6;
  _LSBindingForLog *v7;
  __int128 v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_LSBindingForLog;
  v6 = -[_LSBindingForLog init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_db, **(id **)a3);
    v8 = *(_OWORD *)&a4->claim;
    *(_OWORD *)&v7->_binding.bundle = *(_OWORD *)&a4->bundle;
    *(_OWORD *)&v7->_binding.claim = v8;
    objc_storeStrong((id *)&v7->_binding.userInfo, a4->userInfo);
    objc_storeStrong((id *)&v7->_binding.var0, a4->var0);
  }
  return v7;
}

- (id)description
{
  void *v3;
  void *v4;

  v3 = (void *)_CSStringCopyCFString();
  if (!v3)
  {
    v3 = (void *)_CSStringCopyCFString();
    if (!v3)
      v3 = (void *)_CSStringCopyCFString();
  }
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@%@ (B:0x%llx, C:0x%llx)"), v3, &stru_1E10473A0, self->_binding.bundle, self->_binding.claim);

  return v4;
}

- (id)redactedDescription
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("<private>%@ (B:0x%llx, C:0x%llx)"), &stru_1E10473A0, self->_binding.bundle, self->_binding.claim);
}

@end
