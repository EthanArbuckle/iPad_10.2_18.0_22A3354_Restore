@implementation _LSAppToUnregister

- (_QWORD)initWithContext:(uint64_t)a3 bundleUnit:(uint64_t)a4 bundleData:
{
  _QWORD *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  objc_super v13;

  if (!a1)
    return 0;
  v13.receiver = a1;
  v13.super_class = (Class)_LSAppToUnregister;
  v7 = objc_msgSendSuper2(&v13, sel_init);
  if (v7)
  {
    +[LSApplicationProxy applicationProxyWithBundleUnitID:withContext:](LSApplicationProxy, "applicationProxyWithBundleUnitID:withContext:", a3, a2);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v7[1];
    v7[1] = v8;

    v10 = _CSStringCopyCFString();
    v11 = (void *)v7[2];
    v7[2] = v10;

    *((_BYTE *)v7 + 24) = (*(_DWORD *)(a4 + 172) & 0x40000) != 0;
  }
  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_proxy, 0);
}

@end
