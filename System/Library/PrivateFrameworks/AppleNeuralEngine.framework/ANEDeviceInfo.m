@implementation ANEDeviceInfo

void __24___ANEDeviceInfo_hasANE__block_invoke()
{
  +[_ANEDeviceInfo hasANE]::hasANE = 0;
}

void __35___ANEDeviceInfo_aneSubTypeVariant__block_invoke(uint64_t a1, uint64_t a2)
{
  unint64_t v2;
  __int128 v3;
  const __CFString *v4;
  void *v5;

  *((_QWORD *)&v3 + 1) = a2;
  *(_QWORD *)&v3 = a2 - 64;
  v2 = v3 >> 4;
  if (v2 > 0xD)
    v4 = &stru_1E9516758;
  else
    v4 = off_1E9516040[v2];
  v5 = (void *)+[_ANEDeviceInfo aneSubTypeVariant]::aneSubTypeVariantStr;
  +[_ANEDeviceInfo aneSubTypeVariant]::aneSubTypeVariantStr = (uint64_t)v4;

}

void __28___ANEDeviceInfo_aneSubType__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  const __CFString *v4;
  void *v5;
  NSObject *v6;

  if (a2 > 159)
  {
    if (a2 <= 223)
    {
      if (a2 > 191)
      {
        if (a2 != 192)
        {
          if (a2 != 208)
            goto LABEL_36;
          goto LABEL_29;
        }
      }
      else
      {
        if (a2 == 160)
        {
LABEL_20:
          v3 = (void *)+[_ANEDeviceInfo aneSubType]::aneSubtypeStr;
          v4 = CFSTR("h14");
          goto LABEL_35;
        }
        if (a2 != 176)
          goto LABEL_36;
      }
    }
    else
    {
      if (a2 > 255)
      {
        if (a2 != 256 && a2 != 272)
        {
          if (a2 == 512)
          {
            v3 = (void *)+[_ANEDeviceInfo aneSubType]::aneSubtypeStr;
            v4 = CFSTR("h17");
LABEL_35:
            +[_ANEDeviceInfo aneSubType]::aneSubtypeStr = (uint64_t)v4;

            return;
          }
          goto LABEL_36;
        }
LABEL_29:
        v3 = (void *)+[_ANEDeviceInfo aneSubType]::aneSubtypeStr;
        v4 = CFSTR("h16");
        goto LABEL_35;
      }
      if (a2 != 224)
      {
        if (a2 == 240)
        {
          v3 = (void *)+[_ANEDeviceInfo aneSubType]::aneSubtypeStr;
          v4 = CFSTR("m11");
          goto LABEL_35;
        }
        goto LABEL_36;
      }
    }
LABEL_30:
    v3 = (void *)+[_ANEDeviceInfo aneSubType]::aneSubtypeStr;
    v4 = CFSTR("h15");
    goto LABEL_35;
  }
  if (a2 <= 63)
  {
    switch(a2)
    {
      case 1:
      case 4:
        v3 = (void *)+[_ANEDeviceInfo aneSubType]::aneSubtypeStr;
        v4 = CFSTR("h11");
        goto LABEL_35;
      case 2:
        v3 = (void *)+[_ANEDeviceInfo aneSubType]::aneSubtypeStr;
        v4 = CFSTR("m9");
        goto LABEL_35;
      case 3:
      case 5:
      case 6:
      case 7:
        goto LABEL_36;
      case 8:
        v3 = (void *)+[_ANEDeviceInfo aneSubType]::aneSubtypeStr;
        v4 = CFSTR("h12");
        goto LABEL_35;
      default:
        if (a2 == 32)
          goto LABEL_32;
        goto LABEL_36;
    }
  }
  if (a2 > 111)
  {
    if (a2 != 112 && a2 != 128)
    {
      if (a2 != 144)
        goto LABEL_36;
      goto LABEL_30;
    }
    goto LABEL_20;
  }
  if (a2 == 64 || a2 == 96)
  {
LABEL_32:
    v3 = (void *)+[_ANEDeviceInfo aneSubType]::aneSubtypeStr;
    v4 = CFSTR("h13");
    goto LABEL_35;
  }
LABEL_36:
  v5 = (void *)+[_ANEDeviceInfo aneSubType]::aneSubtypeStr;
  +[_ANEDeviceInfo aneSubType]::aneSubtypeStr = (uint64_t)CFSTR("h15");

  +[_ANELog framework](_ANELog, "framework");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(*(SEL *)(a1 + 32));
    objc_claimAutoreleasedReturnValue();
    __28___ANEDeviceInfo_aneSubType__block_invoke_cold_1();
  }

}

uint64_t __33___ANEDeviceInfo_isInternalBuild__block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  +[_ANEDeviceInfo isInternalBuild]::isInternalBuild = result;
  return result;
}

uint64_t __30___ANEDeviceInfo_aneBoardType__block_invoke()
{
  uint64_t result;

  result = MGGetSInt64Answer();
  +[_ANEDeviceInfo aneBoardType]::boardType = result;
  return result;
}

uint64_t __34___ANEDeviceInfo_isVirtualMachine__block_invoke()
{
  uint64_t result;
  size_t v1;
  int v2;

  v2 = 0;
  v1 = 4;
  result = sysctlbyname("kern.hv_vmm_present", &v2, &v1, 0, 0);
  if (!(_DWORD)result)
    +[_ANEDeviceInfo isVirtualMachine]::isVirtualMachine = v2 != 0;
  return result;
}

uint64_t __24___ANEDeviceInfo_hasANE__block_invoke_2()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  +[_ANEDeviceInfo hasANE]::hasANE = result;
  return result;
}

void __37___ANEDeviceInfo_aneArchitectureType__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  v0 = (void *)MEMORY[0x1E0CB3940];
  +[_ANEDeviceInfo aneSubType](_ANEDeviceInfo, "aneSubType");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  +[_ANEDeviceInfo aneSubTypeVariant](_ANEDeviceInfo, "aneSubTypeVariant");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  +[_ANEDeviceInfo aneSubTypeProductVariant](_ANEDeviceInfo, "aneSubTypeProductVariant");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringWithFormat:", CFSTR("%@%@%@"), v5, v1, v2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)+[_ANEDeviceInfo aneArchitectureType]::aneArchitectureTypeStr;
  +[_ANEDeviceInfo aneArchitectureType]::aneArchitectureTypeStr = v3;

}

uint64_t __28___ANEDeviceInfo_aneSubType__block_invoke_36(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __35___ANEDeviceInfo_aneSubTypeVariant__block_invoke_42(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

void __42___ANEDeviceInfo_aneSubTypeProductVariant__block_invoke()
{
  void *v0;

  v0 = (void *)+[_ANEDeviceInfo aneSubTypeProductVariant]::aneSubTypeProductVariantStr;
  +[_ANEDeviceInfo aneSubTypeProductVariant]::aneSubTypeProductVariantStr = (uint64_t)&stru_1E9516758;

}

uint64_t __42___ANEDeviceInfo_aneSubTypeProductVariant__block_invoke_44(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

void __30___ANEDeviceInfo_buildVersion__block_invoke()
{
  uint64_t v0;
  void *v1;

  MGGetStringAnswer();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)+[_ANEDeviceInfo buildVersion]::buildVersionStr;
  +[_ANEDeviceInfo buildVersion]::buildVersionStr = v0;

}

void __29___ANEDeviceInfo_productName__block_invoke()
{
  uint64_t v0;
  void *v1;

  MGGetStringAnswer();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)+[_ANEDeviceInfo productName]::productNameStr;
  +[_ANEDeviceInfo productName]::productNameStr = v0;

}

void __28___ANEDeviceInfo_aneSubType__block_invoke_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t *v6;
  NSObject *v7;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_8(v1, v2, 5.7781e-34);
  *(_WORD *)(v3 + 12) = 2048;
  *(_QWORD *)(v3 + 14) = v4;
  *(_WORD *)(v3 + 22) = 2112;
  *(_QWORD *)(v3 + 24) = v5;
  OUTLINED_FUNCTION_7(&dword_1D3352000, v7, v4, "%@: Unknown kMGQAppleNeuralEngineSubtype=0x%llx using (%@)", v6);

  OUTLINED_FUNCTION_2_0();
}

@end
