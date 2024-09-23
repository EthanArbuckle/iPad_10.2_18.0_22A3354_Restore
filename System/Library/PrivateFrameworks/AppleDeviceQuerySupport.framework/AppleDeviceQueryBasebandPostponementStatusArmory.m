@implementation AppleDeviceQueryBasebandPostponementStatusArmory

+ (id)query:(id)a3 isCachable:(BOOL)a4 withError:(id *)a5
{
  _BOOL8 v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  +[AppleDeviceQuerySingletonArmory sharedInstance](AppleDeviceQueryBasebandPostponementStatusArmory, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "query:isCachable:withError:", v7, v6, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)loadPostponementStatus:(id *)a3
{
  __CTServerConnection *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __CTServerConnection *v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v19;
  uint64_t v20;
  CFTypeRef cf;

  cf = 0;
  v5 = +[AppleDeviceQueryBasebandConnectionArmory getCTServerConnection](AppleDeviceQueryBasebandConnectionArmory, "getCTServerConnection");
  if (v5)
  {
    v9 = v5;
    v10 = _CTServerConnectionCopyPostponementStatus();
    v20 = v10;
    v11 = (_DWORD)v10 == 0;
    if ((_DWORD)v10)
    {
      CTError_error_string(&v20);
      ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeCommon/ZhuGeBaseband.m", "-[AppleDeviceQueryBasebandPostponementStatusArmory loadPostponementStatus:]", 448, CFSTR("Failed to get postponementStatus: %d:%d(%s)"), v12, v13, v14, v10);
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithZhuGeErrorCode:underlyingError:", 4, 0);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[AppleDeviceQueryBasebandPostponementStatusArmory setPostponementStatus:](self, "setPostponementStatus:", cf);

      cf = 0;
      ZhuGeLog(262400, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeCommon/ZhuGeBaseband.m", "-[AppleDeviceQueryBasebandPostponementStatusArmory loadPostponementStatus:]", 456, CFSTR("postponementStatus is reloaded"), v15, v16, v17, v19);
    }
    CFRelease(v9);
    if (cf)
      CFRelease(cf);
  }
  else
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeCommon/ZhuGeBaseband.m", "-[AppleDeviceQueryBasebandPostponementStatusArmory loadPostponementStatus:]", 441, CFSTR("Failed to get CTServerConnection instance"), v6, v7, v8, v19);
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithZhuGeErrorCode:underlyingError:", 39, 0);
    v11 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v11;
}

- (id)query:(id)a3 isCachable:(BOOL)a4 withError:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v8 = a3;
  -[AppleDeviceQueryBasebandPostponementStatusArmory postponementStatus](self, "postponementStatus");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9 && a4
    || -[AppleDeviceQueryBasebandPostponementStatusArmory loadPostponementStatus:](self, "loadPostponementStatus:", a5))
  {
    -[AppleDeviceQueryBasebandPostponementStatusArmory postponementStatus](self, "postponementStatus");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
    {
      ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeCommon/ZhuGeBaseband.m", "-[AppleDeviceQueryBasebandPostponementStatusArmory query:isCachable:withError:]", 494, CFSTR("key %@ does not exist in postponementStatus"), v12, v13, v14, (uint64_t)v8);
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithZhuGeErrorCode:underlyingError:", 29, 0);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (id)convertToPostponementKey:(id)a3
{
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("kCTPostponementStatus")))
    return (id)*MEMORY[0x24BDC2AF8];
  else
    return 0;
}

- (NSDictionary)postponementStatus
{
  return (NSDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setPostponementStatus:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_postponementStatus, 0);
}

@end
