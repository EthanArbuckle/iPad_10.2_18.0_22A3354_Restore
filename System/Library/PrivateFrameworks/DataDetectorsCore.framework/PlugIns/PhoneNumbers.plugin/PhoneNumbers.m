uint64_t GetVersion()
{
  return 7;
}

uint64_t (*GetSuffixInitialState())(uint64_t a1)
{
  return state_167899;
}

uint64_t (*GetPrefixInitialState())(uint64_t *a1)
{
  return state_167897;
}

void (*GetResultPostprocessor())()
{
  return DDPhonePostprocessResult;
}

uint64_t state_167897(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  BOOL v9;

  v1 = a1[2];
  v2 = a1[7];
  if (v1 <= v2)
  {
    if (v1 >= v2)
    {
      if (*((_BYTE *)a1 + 120))
      {
        a1[13] = -1;
        a1[14] = (uint64_t)state_167897;
        return 1;
      }
      v4 = v2 + 1;
      a1[7] = v2 + 1;
      goto LABEL_29;
    }
    return 0;
  }
  v3 = *a1;
  v4 = v2 + 1;
  a1[7] = v2 + 1;
  v5 = *(unsigned __int16 *)(v3 + 2 * v2);
  if (v5 > 159)
  {
    v9 = (v5 - 65288) <= 0x12 && ((1 << (v5 - 8)) & 0x40013) != 0 || v5 == 8212;
    if (v9 || v5 == 160)
      goto LABEL_29;
  }
  else if (v5 <= 0x3D && ((1 << v5) & 0x3400100500000600) != 0)
  {
    goto LABEL_29;
  }
  if ((v5 - 39) > 2
    && (v5 - 0x2000) > 0xA
    && (v5 - 12288) > 2
    && (v5 - 12353) > 0xBE
    && (v5 - 13312) >> 1 > 0xCDA
    && (v5 - 19968) > 0x51CB)
  {
    return 0;
  }
LABEL_29:
  a1[6] = v4 + a1[1];
  a1[13] = *(unsigned __int16 *)(a1[3] + 38);
  return DDDFAScannerSimulateState();
}

uint64_t state_167899(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t result;
  uint64_t v7;

  v2 = *(_QWORD *)(a1 + 16);
  v3 = *(_QWORD *)(a1 + 56);
  if (v2 <= v3)
  {
    if (v2 >= v3)
    {
      if (*(_BYTE *)(a1 + 120))
      {
        *(_QWORD *)(a1 + 104) = -1;
        *(_QWORD *)(a1 + 112) = state_167899;
      }
      else
      {
        *(_QWORD *)(a1 + 56) = v3 + 1;
      }
      return 1;
    }
    else
    {
      return 0;
    }
  }
  else
  {
    v4 = *(_QWORD *)a1;
    *(_QWORD *)(a1 + 56) = v3 + 1;
    v5 = *(unsigned __int16 *)(v4 + 2 * v3);
    result = 1;
    if (v5 > 159)
    {
      if (v5 >= 12288)
      {
        if ((v5 - 65288) <= 6 && ((1 << (v5 - 8)) & 0x43) != 0)
          return result;
        if (v5 == 12288 || v5 == 12290)
          return result;
      }
      else
      {
        if (v5 == 160 || v5 == 8212)
          return result;
        if (v5 == 8230)
          return state_167901((uint64_t *)a1);
      }
LABEL_34:
      if ((v5 - 39) >= 3 && (v5 - 0x2000) >= 0xB && (v5 - 12353) >= 0x56)
        return (v5 - 12445) < 3;
      return result;
    }
    v7 = (v5 - 32);
    if (v7 > 0x3F)
      goto LABEL_32;
    if (((1 << (v5 - 32)) & 0x800000008C004002) != 0)
      return state_167901((uint64_t *)a1);
    if (((1 << (v5 - 32)) & 0x40008005) == 0)
    {
      if (v7 == 12)
        return state_167902((uint64_t *)a1);
LABEL_32:
      if ((v5 - 9) < 2)
        return result;
      goto LABEL_34;
    }
  }
  return result;
}

BOOL state_167901(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int v4;
  _BOOL8 result;
  BOOL v8;

  v1 = a1[2];
  v2 = a1[7];
  if (v1 <= v2)
  {
    if (v1 >= v2)
    {
      if (*((_BYTE *)a1 + 120))
      {
        a1[13] = -1;
        a1[14] = (uint64_t)state_167901;
      }
      else
      {
        a1[7] = v2 + 1;
      }
      return 1;
    }
    else
    {
      return 0;
    }
  }
  else
  {
    v3 = *a1;
    a1[7] = v2 + 1;
    v4 = *(unsigned __int16 *)(v3 + 2 * v2);
    result = 1;
    if (v4 > 159)
    {
      v8 = v4 == 160 || v4 == 8230;
      if (!v8 && v4 != 12288)
        return (v4 - 0x2000) < 0xB;
    }
    else if (((v4 - 32) > 0x3F || ((1 << (v4 - 32)) & 0x800000008C005003) == 0)
           && v4 != 10)
    {
      return (v4 - 0x2000) < 0xB;
    }
  }
  return result;
}

BOOL state_167902(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int v4;
  _BOOL8 result;

  v1 = a1[2];
  v2 = a1[7];
  if (v1 > v2)
  {
    v3 = *a1;
    a1[7] = v2 + 1;
    v4 = *(unsigned __int16 *)(v3 + 2 * v2);
    result = 1;
    if (v4 > 94)
    {
      if (v4 > 8229)
      {
        if (v4 == 8230 || v4 == 12288)
          return result;
      }
      else if (v4 == 95 || v4 == 160)
      {
        return result;
      }
    }
    else if (v4 <= 0x3F && ((1 << v4) & 0x8C00500300000408) != 0)
    {
      return result;
    }
    return (v4 - 0x2000) < 0xB;
  }
  if (v1 < v2)
    return 0;
  if (*((_BYTE *)a1 + 120))
  {
    a1[13] = -1;
    a1[14] = (uint64_t)state_167902;
  }
  else
  {
    a1[7] = v2 + 1;
  }
  return 1;
}

void DDPhonePostprocessResult()
{
  const __CFString *Type;
  const void *v1;

  Type = (const __CFString *)DDResultGetType();
  if (CFStringCompare(Type, CFSTR("PhoneNumber"), 0) == kCFCompareEqualTo)
  {
    DDResultGetQueryRange();
    v1 = (const void *)DDResultCreate();
    DDResultAddSubresult();
    CFRelease(v1);
  }
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x24BDBC4D0](theString1, theString2, compareOptions);
}

uint64_t DDDFAScannerSimulateState()
{
  return MEMORY[0x24BE2B248]();
}

uint64_t DDResultAddSubresult()
{
  return MEMORY[0x24BE2B250]();
}

uint64_t DDResultCreate()
{
  return MEMORY[0x24BE2B288]();
}

uint64_t DDResultGetQueryRange()
{
  return MEMORY[0x24BE2B2C0]();
}

