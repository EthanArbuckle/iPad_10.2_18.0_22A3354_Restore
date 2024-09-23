@implementation ZN8Security11CodeSigning13SecStaticCode17validateResourcesEj

const void **___ZN8Security11CodeSigning13SecStaticCode17validateResourcesEj_block_invoke_30(uint64_t a1)
{
  void **v1;
  void *__p[2];
  char v4;
  _DWORD v5[2];
  const __CFURL *v6;

  v6 = *(const __CFURL **)(a1 + 40);
  v5[1] = -1431655766;
  Security::cfString((Security *)__p, v6);
  v5[0] = -1;
  if (v4 >= 0)
    v1 = __p;
  else
    v1 = (void **)__p[0];
  Security::UnixPlusPlus::FileDesc::open((Security::UnixPlusPlus::FileDesc *)v5, (const char *)v1, 0, 4096);
  if (v4 < 0)
    operator delete(__p[0]);
  Security::UnixPlusPlus::FileDesc::closeAndLog((Security::UnixPlusPlus::FileDesc *)v5);
  return Security::CFRef<__CFURL const*>::~CFRef((const void **)&v6);
}

@end
