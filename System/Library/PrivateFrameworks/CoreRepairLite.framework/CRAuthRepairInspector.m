@implementation CRAuthRepairInspector

+ (unint64_t)getStatus
{
  NSObject *v2;
  unint64_t v3;
  NSObject *v4;
  int v6;
  unint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  sub_22AE246E8(0);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v6) = 0;
    _os_log_impl(&dword_22AE1C000, v2, OS_LOG_TYPE_DEFAULT, "Validating repair status", (uint8_t *)&v6, 2u);
  }

  v3 = +[CRAuthRepairInspector _getStatus](CRAuthRepairInspector, "_getStatus");
  sub_22AE246E8(0);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 134217984;
    v7 = v3;
    _os_log_impl(&dword_22AE1C000, v4, OS_LOG_TYPE_DEFAULT, "Repair status: %llu", (uint8_t *)&v6, 0xCu);
  }

  return v3;
}

+ (unint64_t)_getStatus
{
  void *v2;
  unint64_t v3;
  _BOOL4 v4;
  uint64_t v5;
  char v7;

  v7 = 0;
  +[CRFDRUtils findUnsealedDataWithError:](CRFDRUtils, "findUnsealedDataWithError:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count"))
  {
    v3 = 3;
  }
  else
  {
    v4 = +[CRAuthRepairInspector wasRepaired:](CRAuthRepairInspector, "wasRepaired:", &v7);
    v5 = 1;
    if (v4)
      v5 = 2;
    if (v7)
      v3 = v5;
    else
      v3 = 0;
  }

  return v3;
}

+ (BOOL)wasRepaired:(BOOL *)a3
{
  BOOL result;
  uint64_t v5;

  v5 = 0;
  result = +[CRFDRUtils isDcSignedSealingManifest:](CRFDRUtils, "isDcSignedSealingManifest:", &v5);
  if (a3)
    *a3 = v5 == 0;
  return result;
}

@end
