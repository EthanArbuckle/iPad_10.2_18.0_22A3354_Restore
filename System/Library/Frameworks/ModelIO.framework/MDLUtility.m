@implementation MDLUtility

+ (void)convertToUSDZWithURL:(id)a3
{
  MEMORY[0x1E0DE7D20](a1, sel_convertToUSDZ_writeToURL_, a3);
}

+ (void)convertToUSDZ:(id)a3 writeToURL:(id)a4
{
  id v5;
  id v6;
  const char *v7;
  uint64_t v8;
  id v9;
  const char *v10;
  uint64_t v11;
  char *v12;
  const char *v13;
  uint64_t v14;
  id v15;
  const char *v16;
  uint64_t v17;
  char *v18;
  void *__p[2];
  char v20;
  void *v21[2];
  void *v22[2];
  __int128 v23;

  v5 = a3;
  v6 = a4;
  sub_1DCAD5E24();
  *(_OWORD *)v22 = 0u;
  v23 = 0u;
  *(_OWORD *)v21 = 0u;
  objc_msgSend_path(v5, v7, v8);
  v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v12 = (char *)objc_msgSend_UTF8String(v9, v10, v11);
  sub_1DCB0345C(__p, v12);
  MEMORY[0x1DF0D0CC0](v21, __p);
  if (v20 < 0)
    operator delete(__p[0]);

  objc_msgSend_path(v6, v13, v14);
  v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v18 = (char *)objc_msgSend_UTF8String(v15, v16, v17);
  sub_1DCB0345C(__p, v18);
  pxrInternal__aapl__pxrReserved__::UsdUtilsCreateNewARKitUsdzPackage();
  if (v20 < 0)
    operator delete(__p[0]);

  if (SHIBYTE(v23) < 0)
    operator delete(v22[1]);
  if (SHIBYTE(v22[0]) < 0)
    operator delete(v21[0]);

}

@end
