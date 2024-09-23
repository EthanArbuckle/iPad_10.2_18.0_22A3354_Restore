uint64_t CCUIGridSizeClassMaskAll()
{
  return 2015;
}

const __CFString *NSStringFromCCUIGridSizeClass(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 9)
    return CFSTR("CCUIGridSizeClassSmall");
  else
    return off_250A357D8[a1 - 1];
}

void CCUIEnumerateGridSizeClassesWithBlock(_QWORD *a1)
{
  void (*v2)(void);
  _QWORD *v3;

  v2 = (void (*)(void))a1[2];
  v3 = a1;
  v2();
  ((void (*)(id, uint64_t))a1[2])(v3, 1);
  ((void (*)(id, uint64_t))a1[2])(v3, 2);
  ((void (*)(id, uint64_t))a1[2])(v3, 3);
  ((void (*)(id, uint64_t))a1[2])(v3, 4);
  ((void (*)(id, uint64_t))a1[2])(v3, 5);
  ((void (*)(id, uint64_t))a1[2])(v3, 6);
  ((void (*)(id, uint64_t))a1[2])(v3, 7);
  ((void (*)(id, uint64_t))a1[2])(v3, 8);
  ((void (*)(id, uint64_t))a1[2])(v3, 9);
  ((void (*)(id, uint64_t))a1[2])(v3, 10);

}

uint64_t CCUIGridSizeClassMaskForGridSizeClass(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 9)
    return 1;
  else
    return qword_238507BB8[a1 - 1];
}

uint64_t CCUIAdjustGridSizeClassForAccessibility(uint64_t result, int a2)
{
  if (a2)
  {
    if (result == 2)
    {
      return 3;
    }
    else if (result == 4)
    {
      return 5;
    }
  }
  else if (result == 3)
  {
    return 2;
  }
  else if (result == 5)
  {
    return 4;
  }
  return result;
}

uint64_t CCUIDefaultSupportedGridSizeClassesForChronoControls()
{
  return 21;
}

const __CFString *SBHIconGridSizeClassForCCUIGridSizeClass(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 9)
    return CFSTR("CCUIIconGridSizeClassSmall");
  else
    return off_250A35870[a1 - 1];
}

uint64_t CCUIGridSizeClassForSBHIconGridSizeClass(void *a1)
{
  __CFString *v1;
  __CFString *v2;
  uint64_t v3;
  void *v5;
  void *v6;

  v1 = a1;
  v2 = v1;
  if (v1 != CFSTR("CCUIIconGridSizeClassSmall")
    && (-[__CFString isEqualToString:](v1, "isEqualToString:", CFSTR("CCUIIconGridSizeClassSmall")) & 1) == 0)
  {
    if (v2 == CFSTR("CCUIIconGridSizeClassSmallTall")
      || (-[__CFString isEqualToString:](v2, "isEqualToString:", CFSTR("CCUIIconGridSizeClassSmallTall")) & 1) != 0)
    {
      v3 = 1;
      goto LABEL_34;
    }
    if (v2 == CFSTR("CCUIIconGridSizeClassSmallWide")
      || (-[__CFString isEqualToString:](v2, "isEqualToString:", CFSTR("CCUIIconGridSizeClassSmallWide")) & 1) != 0)
    {
      v3 = 2;
      goto LABEL_34;
    }
    if (v2 == CFSTR("CCUIIconGridSizeClassSmallExtraWide")
      || (-[__CFString isEqualToString:](v2, "isEqualToString:", CFSTR("CCUIIconGridSizeClassSmallExtraWide")) & 1) != 0)
    {
      v3 = 3;
      goto LABEL_34;
    }
    if (v2 == CFSTR("CCUIIconGridSizeClassMedium")
      || (-[__CFString isEqualToString:](v2, "isEqualToString:", CFSTR("CCUIIconGridSizeClassMedium")) & 1) != 0)
    {
      v3 = 4;
      goto LABEL_34;
    }
    if (v2 == CFSTR("CCUIIconGridSizeClassMediumWide")
      || (-[__CFString isEqualToString:](v2, "isEqualToString:", CFSTR("CCUIIconGridSizeClassMediumWide")) & 1) != 0)
    {
      v3 = 5;
      goto LABEL_34;
    }
    if (v2 == CFSTR("CCUIIconGridSizeClassLarge")
      || (-[__CFString isEqualToString:](v2, "isEqualToString:", CFSTR("CCUIIconGridSizeClassLarge")) & 1) != 0)
    {
      v3 = 6;
      goto LABEL_34;
    }
    if (v2 == CFSTR("CCUIIconGridSizeClassLargeTall")
      || (-[__CFString isEqualToString:](v2, "isEqualToString:", CFSTR("CCUIIconGridSizeClassLargeTall")) & 1) != 0)
    {
      v3 = 7;
      goto LABEL_34;
    }
    if (v2 == CFSTR("CCUIIconGridSizeClassLargeWide")
      || (-[__CFString isEqualToString:](v2, "isEqualToString:", CFSTR("CCUIIconGridSizeClassLargeWide")) & 1) != 0)
    {
      v3 = 8;
      goto LABEL_34;
    }
    if (v2 == CFSTR("CCUIIconGridSizeClassLargeExtraTall")
      || (-[__CFString isEqualToString:](v2, "isEqualToString:", CFSTR("CCUIIconGridSizeClassLargeExtraTall")) & 1) != 0)
    {
      v3 = 9;
      goto LABEL_34;
    }
    if (v2 == CFSTR("CCUIIconGridSizeClassLargeExtraWide")
      || (-[__CFString isEqualToString:](v2, "isEqualToString:", CFSTR("CCUIIconGridSizeClassLargeExtraWide")) & 1) != 0)
    {
      v3 = 10;
      goto LABEL_34;
    }
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "CCUIGridSizeClass CCUIGridSizeClassForSBHIconGridSizeClass(__strong SBHIconGridSizeClass _Nonnull)");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("CCUIIconTypes.m"), 97, CFSTR("Unimplemented Control Center grid size class: %@"), v2);

  }
  v3 = 0;
LABEL_34:

  return v3;
}

id SBHIconGridSizeClassSetForCCUIGridSizeClassMask(uint64_t a1)
{
  id v2;
  id v3;
  void *v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void *v9;
  id v10;
  uint64_t v11;

  v2 = objc_alloc_init(MEMORY[0x24BEB08F8]);
  v6 = MEMORY[0x24BDAC760];
  v7 = 3221225472;
  v8 = __SBHIconGridSizeClassSetForCCUIGridSizeClassMask_block_invoke;
  v9 = &unk_250A35830;
  v10 = v2;
  v11 = a1;
  v3 = v2;
  CCUIEnumerateGridSizeClassesWithBlock(&v6);
  v4 = (void *)objc_msgSend(v3, "copy", v6, v7, v8, v9);

  return v4;
}

ControlCenterUIServices::ControlsGalleryCustomElementType_optional __swiftcall ControlsGalleryCustomElementType.init(rawValue:)(Swift::Int rawValue)
{
  char *v1;
  char v2;

  if (rawValue == 1)
    v2 = 1;
  else
    v2 = 2;
  if (!rawValue)
    v2 = 0;
  *v1 = v2;
  return (ControlCenterUIServices::ControlsGalleryCustomElementType_optional)rawValue;
}

uint64_t ControlsGalleryCustomElementType.rawValue.getter()
{
  unsigned __int8 *v0;

  return *v0;
}

BOOL sub_2384F06A0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_2384F06B8()
{
  sub_238506E30();
  sub_238506E3C();
  return sub_238506E48();
}

uint64_t sub_2384F06FC()
{
  return sub_238506E3C();
}

uint64_t sub_2384F0724()
{
  sub_238506E30();
  sub_238506E3C();
  return sub_238506E48();
}

_QWORD *sub_2384F0764@<X0>(_QWORD *result@<X0>, char *a2@<X8>)
{
  char v2;
  char v3;

  if (*result == 1)
    v2 = 1;
  else
    v2 = 2;
  if (*result)
    v3 = v2;
  else
    v3 = 0;
  *a2 = v3;
  return result;
}

void sub_2384F0784(_QWORD *a1@<X8>)
{
  unsigned __int8 *v1;

  *a1 = *v1;
}

void sub_2384F0790()
{
  qword_256915C48 = (uint64_t)&unk_250A352B0;
}

uint64_t static ControlsGalleryCustomCollections.legacyModuleIdentifiersToHidePhone.getter()
{
  return sub_2384F07F0(&qword_256915C40);
}

void sub_2384F07C0()
{
  qword_256915C58 = (uint64_t)&unk_250A351B0;
}

uint64_t static ControlsGalleryCustomCollections.legacyModuleIdentifiersToHidePad.getter()
{
  return sub_2384F07F0(&qword_256915C50);
}

uint64_t sub_2384F07F0(_QWORD *a1)
{
  if (*a1 != -1)
    swift_once();
  return swift_bridgeObjectRetain();
}

unint64_t sub_2384F082C()
{
  unint64_t result;

  result = qword_256915C88;
  if (!qword_256915C88)
  {
    result = MEMORY[0x23B8377A4](&protocol conformance descriptor for ControlsGalleryCustomElementType, &type metadata for ControlsGalleryCustomElementType);
    atomic_store(result, (unint64_t *)&qword_256915C88);
  }
  return result;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for ControlsGalleryCustomElementType(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFF)
    goto LABEL_17;
  if (a2 + 1 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 1) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 1;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 1;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 1;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 2;
  v8 = v6 - 2;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for ControlsGalleryCustomElementType(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 1 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFF)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFE)
    return ((uint64_t (*)(void))((char *)&loc_2384F095C + 4 * byte_238507C15[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_2384F0990 + 4 * byte_238507C10[v4]))();
}

uint64_t sub_2384F0990(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2384F0998(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2384F09A0);
  return result;
}

uint64_t sub_2384F09AC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2384F09B4);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_2384F09B8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2384F09C0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2384F09CC(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_2384F09D8(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for ControlsGalleryCustomElementType()
{
  return &type metadata for ControlsGalleryCustomElementType;
}

ValueMetadata *type metadata accessor for ControlsGalleryCustomCollections()
{
  return &type metadata for ControlsGalleryCustomCollections;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_2384F0A10(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_2384F0A30(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)result = (a2 - 1);
    *(_QWORD *)(result + 8) = 0;
    if (!a3)
      return result;
    v3 = 1;
  }
  else
  {
    if (!a3)
      return result;
    v3 = 0;
  }
  *(_BYTE *)(result + 16) = v3;
  return result;
}

void type metadata accessor for CCUIGridGeometryInfo(uint64_t a1)
{
  sub_2384F329C(a1, &qword_256915DB0);
}

__n128 __swift_memcpy32_8(_OWORD *a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t sub_2384F0A78(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 32))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_2384F0A98(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_QWORD *)result = (a2 - 1);
    *(_QWORD *)(result + 8) = 0;
    if (!a3)
      return result;
    v3 = 1;
  }
  else
  {
    if (!a3)
      return result;
    v3 = 0;
  }
  *(_BYTE *)(result + 32) = v3;
  return result;
}

void type metadata accessor for SBIconImageInfo(uint64_t a1)
{
  sub_2384F329C(a1, &qword_256915DB8);
}

void type metadata accessor for CHSControlSize(uint64_t a1)
{
  sub_2384F329C(a1, &qword_256915DC0);
}

uint64_t sub_2384F0AEC(uint64_t a1, uint64_t a2)
{
  return sub_2384F0DD4(a1, a2, (uint64_t (*)(uint64_t))MEMORY[0x24BDCF9E0]);
}

void sub_2384F0B04(_QWORD *a1@<X8>)
{
  *a1 = 0;
}

_QWORD *sub_2384F0B0C@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 | *result;
  return result;
}

_QWORD *sub_2384F0B20@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 ^ *result;
  return result;
}

_QWORD *sub_2384F0B34@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  _QWORD *v2;
  uint64_t v3;

  v3 = *v2 & *result;
  if (v3)
    *v2 &= ~*result;
  *(_QWORD *)a2 = v3;
  *(_BYTE *)(a2 + 8) = v3 == 0;
  return result;
}

uint64_t *sub_2384F0B60@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *result;
  v4 = *v2;
  *v2 |= *result;
  v5 = v4 & v3;
  *(_QWORD *)a2 = v5;
  *(_BYTE *)(a2 + 8) = v5 == 0;
  return result;
}

_QWORD *sub_2384F0B84(_QWORD *result)
{
  _QWORD *v1;

  *v1 ^= *result;
  return result;
}

_QWORD *sub_2384F0B98@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 & ~*result;
  return result;
}

BOOL sub_2384F0BAC(_QWORD *a1)
{
  _QWORD *v1;

  return (*v1 & ~*a1) == 0;
}

BOOL sub_2384F0BC0(_QWORD *a1)
{
  _QWORD *v1;

  return (*v1 & *a1) == 0;
}

BOOL sub_2384F0BD4(_QWORD *a1)
{
  _QWORD *v1;

  return (*a1 & ~*v1) == 0;
}

BOOL sub_2384F0BE8()
{
  _QWORD *v0;

  return *v0 == 0;
}

uint64_t sub_2384F0BF8()
{
  return sub_238506CEC();
}

_QWORD *sub_2384F0C10(_QWORD *result)
{
  _QWORD *v1;

  *v1 &= ~*result;
  return result;
}

uint64_t sub_2384F0C24(uint64_t a1, id *a2)
{
  uint64_t result;

  result = sub_238506B54();
  *a2 = 0;
  return result;
}

uint64_t sub_2384F0C98(uint64_t a1, id *a2)
{
  char v3;

  v3 = sub_238506B60();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_2384F0D14@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  sub_238506B6C();
  v2 = sub_238506B48();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_2384F0D54(uint64_t a1, uint64_t a2)
{
  return sub_2384F0DD4(a1, a2, MEMORY[0x24BEE0CD8]);
}

_QWORD *sub_2384F0D68@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 & *result;
  return result;
}

BOOL sub_2384F0D7C(_QWORD *a1, uint64_t *a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;

  v3 = *a2;
  v4 = *v2 & *a2;
  if (v4 != *a2)
    *v2 |= v3;
  *a1 = v3;
  return v4 != v3;
}

_QWORD *sub_2384F0DAC(_QWORD *result)
{
  _QWORD *v1;

  *v1 |= *result;
  return result;
}

_QWORD *sub_2384F0DC0(_QWORD *result)
{
  _QWORD *v1;

  *v1 &= *result;
  return result;
}

uint64_t sub_2384F0DD4(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4;
  uint64_t v5;

  v4 = sub_238506B6C();
  v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_2384F0E10()
{
  sub_238506B6C();
  sub_238506B78();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2384F0E50()
{
  uint64_t v0;

  sub_238506B6C();
  sub_238506E30();
  sub_238506B78();
  v0 = sub_238506E48();
  swift_bridgeObjectRelease();
  return v0;
}

BOOL sub_2384F0EC0(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

uint64_t sub_2384F0ED4@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;

  v3 = sub_2384F3250(a1);
  result = swift_bridgeObjectRelease();
  *a2 = v3;
  return result;
}

_QWORD *sub_2384F0F14@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = *result;
  return result;
}

uint64_t sub_2384F0F20()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;

  v0 = sub_238506B6C();
  v2 = v1;
  if (v0 == sub_238506B6C() && v2 == v3)
    v5 = 1;
  else
    v5 = sub_238506E18();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

_QWORD *sub_2384F0FA8@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = *result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

void sub_2384F0FB8(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

uint64_t sub_2384F0FC8()
{
  sub_2384F30B0(&qword_256915E50, (uint64_t (*)(uint64_t))type metadata accessor for SBHIconGridSizeClass, (uint64_t)&unk_2385082EC);
  sub_2384F30B0(&qword_256915E58, (uint64_t (*)(uint64_t))type metadata accessor for SBHIconGridSizeClass, (uint64_t)&unk_238507F2C);
  return sub_238506DF4();
}

uint64_t sub_2384F104C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = sub_238506B48();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_2384F1090@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_238506B6C();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_2384F10B8()
{
  sub_2384F30B0(&qword_256915E40, (uint64_t (*)(uint64_t))type metadata accessor for SBIconLocation, (uint64_t)&unk_2385082A8);
  sub_2384F30B0(&qword_256915E48, (uint64_t (*)(uint64_t))type metadata accessor for SBIconLocation, (uint64_t)&unk_238508040);
  return sub_238506DF4();
}

_QWORD *sub_2384F113C()
{
  void *v0;
  void *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  unint64_t v15;
  unint64_t v16;
  _QWORD *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  _QWORD *v34;
  void *v35;
  void *v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  id v42;
  id v43;
  id v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  unint64_t v50;
  _QWORD *v51;
  void *v52;
  void *v53;
  id v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  id v59;
  id v60;
  id v61;
  id v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  unint64_t v66;
  unint64_t v67;
  _QWORD *v68;
  void *v69;
  void *v70;
  id v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  id v76;
  id v77;
  id v78;
  id v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  unint64_t v83;
  unint64_t v84;
  _QWORD *v85;
  void *v86;
  void *v87;
  id v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  void *v92;
  id v93;
  id v94;
  id v95;
  id v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  unint64_t v100;
  unint64_t v101;
  _QWORD *v102;
  void *v103;
  void *v104;
  id v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  void *v109;
  id v110;
  id v111;
  id v112;
  id v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  unint64_t v117;
  unint64_t v118;
  _QWORD *v119;
  void *v120;
  void *v121;
  id v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  void *v126;
  id v127;
  id v128;
  unint64_t v129;
  unint64_t v130;
  char *v131;
  void *v132;
  void *v133;
  id v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  void *v138;
  id v139;
  id v140;
  unint64_t v141;
  unint64_t v142;
  _QWORD *v143;
  void *v144;
  void *v145;
  id v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  void *v150;
  id v151;
  id v152;
  unint64_t v153;
  unint64_t v154;
  _QWORD *v155;
  void *v156;
  void *v157;
  id v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  void *v162;
  id v163;
  id v164;
  unint64_t v165;
  unint64_t v166;
  _QWORD *v167;
  void *v168;
  void *v169;
  id v170;
  uint64_t v171;
  uint64_t v172;
  void *v173;
  id v174;
  id v175;
  id v176;
  id v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  unint64_t v181;
  unint64_t v182;
  _QWORD *v183;
  id v184;
  id v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  unint64_t v189;
  unint64_t v190;
  _QWORD *v191;
  id v192;
  id v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  unint64_t v197;
  unint64_t v198;
  _QWORD *v199;
  id v200;
  id v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t v204;
  unint64_t v205;
  unint64_t v206;
  _QWORD *v207;
  uint64_t v209;
  id v210;
  id v211;
  id v212;
  id v213;
  id v214;
  id v215;
  id v216;
  id v217;
  id v218;
  id v219;
  id v220;
  id v221;
  id v222;
  id v223;
  id v224;
  id v225;
  id v226;
  id v227;
  id v228;
  id v229;
  id v230;
  id v231;
  id v232;
  uint64_t v233;
  void *v234;
  id v235;
  void *v236;

  if (qword_256915C60 != -1)
    swift_once();
  v0 = (void *)qword_256917570;
  v1 = (void *)sub_238506B48();
  v2 = objc_msgSend(v0, sel_localizedStringForKey_value_table_, v1, 0, 0);

  v3 = sub_238506B6C();
  v5 = v4;

  v6 = (void *)sub_238506B48();
  v236 = (void *)objc_opt_self();
  v7 = objc_msgSend(v236, sel_systemImageNamed_, v6);

  v234 = (void *)objc_opt_self();
  v8 = objc_msgSend(v234, sel_systemBlueColor);
  v9 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD1880]), sel_init);
  v10 = objc_msgSend(v9, sel_UUIDString);

  v11 = sub_238506B6C();
  v13 = v12;

  swift_bridgeObjectRetain();
  v232 = v7;
  v231 = v8;
  swift_bridgeObjectRetain();
  v233 = v13;
  swift_bridgeObjectRetain();
  v14 = sub_2384FBB34(0, 1, 1, MEMORY[0x24BEE4AF8]);
  v16 = v14[2];
  v15 = v14[3];
  if (v16 >= v15 >> 1)
    v14 = sub_2384FBB34((_QWORD *)(v15 > 1), v16 + 1, 1, v14);
  v14[2] = v16 + 1;
  v17 = &v14[9 * v16];
  v17[4] = v3;
  v17[5] = v5;
  v17[6] = v7;
  v17[7] = v8;
  v17[8] = &unk_250A350A0;
  v17[9] = 0;
  v17[10] = 0;
  v17[11] = v11;
  v17[12] = v233;
  v18 = (void *)qword_256917570;
  v19 = (void *)sub_238506B48();
  v20 = objc_msgSend(v18, sel_localizedStringForKey_value_table_, v19, 0, 0);

  v21 = sub_238506B6C();
  v23 = v22;

  v24 = (void *)sub_238506B48();
  v25 = objc_msgSend(v236, sel_systemImageNamed_, v24);

  v26 = objc_msgSend(v234, sel_systemGreenColor);
  v27 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD1880]), sel_init);
  v28 = objc_msgSend(v27, sel_UUIDString);

  v29 = sub_238506B6C();
  v31 = v30;

  v33 = v14[2];
  v32 = v14[3];
  swift_bridgeObjectRetain();
  v230 = v25;
  v229 = v26;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v33 >= v32 >> 1)
    v14 = sub_2384FBB34((_QWORD *)(v32 > 1), v33 + 1, 1, v14);
  v14[2] = v33 + 1;
  v34 = &v14[9 * v33];
  v34[4] = v21;
  v34[5] = v23;
  v34[6] = v25;
  v34[7] = v26;
  v34[8] = &unk_250A33650;
  v34[9] = 0;
  v34[10] = 0;
  v34[11] = v29;
  v34[12] = v31;
  v35 = (void *)qword_256917570;
  v36 = (void *)sub_238506B48();
  v37 = objc_msgSend(v35, sel_localizedStringForKey_value_table_, v36, 0, 0);

  v38 = sub_238506B6C();
  v40 = v39;

  v41 = (void *)sub_238506B48();
  v42 = objc_msgSend(v236, sel_systemImageNamed_, v41);

  v43 = objc_msgSend(v234, sel_systemRedColor);
  v44 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD1880]), sel_init);
  v45 = objc_msgSend(v44, sel_UUIDString);

  v46 = sub_238506B6C();
  v48 = v47;

  v50 = v14[2];
  v49 = v14[3];
  swift_bridgeObjectRetain();
  v228 = v42;
  v227 = v43;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v50 >= v49 >> 1)
    v14 = sub_2384FBB34((_QWORD *)(v49 > 1), v50 + 1, 1, v14);
  v14[2] = v50 + 1;
  v51 = &v14[9 * v50];
  v51[4] = v38;
  v51[5] = v40;
  v51[6] = v42;
  v51[7] = v43;
  v51[8] = &unk_250A33B80;
  v51[9] = 0;
  v51[10] = 0;
  v51[11] = v46;
  v51[12] = v48;
  v52 = (void *)qword_256917570;
  v53 = (void *)sub_238506B48();
  v54 = objc_msgSend(v52, sel_localizedStringForKey_value_table_, v53, 0, 0);

  v55 = sub_238506B6C();
  v57 = v56;

  v58 = (void *)sub_238506B48();
  v59 = objc_msgSend(v236, sel__systemImageNamed_, v58);

  v60 = objc_msgSend(v234, sel_systemPinkColor);
  v61 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD1880]), sel_init);
  v62 = objc_msgSend(v61, sel_UUIDString);

  v63 = sub_238506B6C();
  v65 = v64;

  v67 = v14[2];
  v66 = v14[3];
  swift_bridgeObjectRetain();
  v226 = v59;
  v225 = v60;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v67 >= v66 >> 1)
    v14 = sub_2384FBB34((_QWORD *)(v66 > 1), v67 + 1, 1, v14);
  v14[2] = v67 + 1;
  v68 = &v14[9 * v67];
  v68[4] = v55;
  v68[5] = v57;
  v68[6] = v59;
  v68[7] = v60;
  v68[8] = &unk_250A33D30;
  v68[9] = 0;
  v68[10] = 0;
  v68[11] = v63;
  v68[12] = v65;
  v69 = (void *)qword_256917570;
  v70 = (void *)sub_238506B48();
  v71 = objc_msgSend(v69, sel_localizedStringForKey_value_table_, v70, 0, 0);

  v72 = sub_238506B6C();
  v74 = v73;

  v75 = (void *)sub_238506B48();
  v76 = objc_msgSend(v236, sel_systemImageNamed_, v75);

  v77 = objc_msgSend(v234, sel_systemDarkPurpleColor);
  v78 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD1880]), sel_init);
  v79 = objc_msgSend(v78, sel_UUIDString);

  v80 = sub_238506B6C();
  v82 = v81;

  v84 = v14[2];
  v83 = v14[3];
  swift_bridgeObjectRetain();
  v224 = v76;
  v223 = v77;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v84 >= v83 >> 1)
    v14 = sub_2384FBB34((_QWORD *)(v83 > 1), v84 + 1, 1, v14);
  v14[2] = v84 + 1;
  v85 = &v14[9 * v84];
  v85[4] = v72;
  v85[5] = v74;
  v85[6] = v76;
  v85[7] = v77;
  v85[8] = &unk_250A33DA0;
  v85[9] = 0;
  v85[10] = 0;
  v85[11] = v80;
  v85[12] = v82;
  v86 = (void *)qword_256917570;
  v87 = (void *)sub_238506B48();
  v88 = objc_msgSend(v86, sel_localizedStringForKey_value_table_, v87, 0, 0);

  v89 = sub_238506B6C();
  v91 = v90;

  v92 = (void *)sub_238506B48();
  v93 = objc_msgSend(v236, sel_systemImageNamed_, v92);

  v94 = objc_msgSend(v234, sel_systemBlueColor);
  v95 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD1880]), sel_init);
  v96 = objc_msgSend(v95, sel_UUIDString);

  v97 = sub_238506B6C();
  v99 = v98;

  v101 = v14[2];
  v100 = v14[3];
  swift_bridgeObjectRetain();
  v222 = v93;
  v221 = v94;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v101 >= v100 >> 1)
    v14 = sub_2384FBB34((_QWORD *)(v100 > 1), v101 + 1, 1, v14);
  v14[2] = v101 + 1;
  v102 = &v14[9 * v101];
  v102[4] = v89;
  v102[5] = v91;
  v102[6] = v93;
  v102[7] = v94;
  v102[8] = &unk_250A33E10;
  v102[9] = 0;
  v102[10] = 0;
  v102[11] = v97;
  v102[12] = v99;
  v103 = (void *)qword_256917570;
  v104 = (void *)sub_238506B48();
  v105 = objc_msgSend(v103, sel_localizedStringForKey_value_table_, v104, 0, 0);

  v106 = sub_238506B6C();
  v108 = v107;

  v109 = (void *)sub_238506B48();
  v110 = objc_msgSend(v236, sel_systemImageNamed_, v109);

  v111 = objc_msgSend(v234, sel_systemPurpleColor);
  v112 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD1880]), sel_init);
  v113 = objc_msgSend(v112, sel_UUIDString);

  v114 = sub_238506B6C();
  v116 = v115;

  v117 = v14[2];
  v118 = v14[3];
  swift_bridgeObjectRetain();
  v220 = v110;
  v219 = v111;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v117 >= v118 >> 1)
    v14 = sub_2384FBB34((_QWORD *)(v118 > 1), v117 + 1, 1, v14);
  v14[2] = v117 + 1;
  v119 = &v14[9 * v117];
  v119[4] = v106;
  v119[5] = v108;
  v119[6] = v110;
  v119[7] = v111;
  v119[8] = &unk_250A34060;
  v119[9] = 0;
  v119[10] = 0;
  v119[11] = v114;
  v119[12] = v116;
  v120 = (void *)qword_256917570;
  v121 = (void *)sub_238506B48();
  v122 = objc_msgSend(v120, sel_localizedStringForKey_value_table_, v121, 0, 0);

  v123 = sub_238506B6C();
  v125 = v124;

  v126 = (void *)sub_238506B48();
  v127 = objc_msgSend(v236, sel_systemImageNamed_, v126);

  v128 = objc_msgSend(v234, sel_systemBlueColor);
  v129 = v14[2];
  v130 = v14[3];
  swift_bridgeObjectRetain();
  v218 = v127;
  v217 = v128;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v129 >= v130 >> 1)
    v14 = sub_2384FBB34((_QWORD *)(v130 > 1), v129 + 1, 1, v14);
  v14[2] = v129 + 1;
  v131 = (char *)&v14[9 * v129];
  *((_QWORD *)v131 + 4) = v123;
  *((_QWORD *)v131 + 5) = v125;
  *((_QWORD *)v131 + 6) = v127;
  *((_QWORD *)v131 + 7) = v128;
  *((_QWORD *)v131 + 8) = &unk_250A34440;
  *((_QWORD *)v131 + 9) = 0;
  *((_QWORD *)v131 + 10) = 0;
  strcpy(v131 + 88, "ACCESSIBILITY");
  *((_WORD *)v131 + 51) = -4864;
  v132 = (void *)qword_256917570;
  v133 = (void *)sub_238506B48();
  v134 = objc_msgSend(v132, sel_localizedStringForKey_value_table_, v133, 0, 0);

  v135 = sub_238506B6C();
  v137 = v136;

  v138 = (void *)sub_238506B48();
  v139 = objc_msgSend(v236, sel_systemImageNamed_, v138);

  v140 = objc_msgSend(v234, sel_systemBlueColor);
  v141 = v14[2];
  v142 = v14[3];
  swift_bridgeObjectRetain();
  v216 = v139;
  v215 = v140;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v141 >= v142 >> 1)
    v14 = sub_2384FBB34((_QWORD *)(v142 > 1), v141 + 1, 1, v14);
  v14[2] = v141 + 1;
  v143 = &v14[9 * v141];
  v143[4] = v135;
  v143[5] = v137;
  v143[6] = v139;
  v143[7] = v140;
  v143[8] = &unk_250A345F0;
  v143[9] = 0;
  v143[10] = 0;
  v143[11] = 0xD000000000000014;
  v143[12] = 0x800000023850A4F0;
  v144 = (void *)qword_256917570;
  v145 = (void *)sub_238506B48();
  v146 = objc_msgSend(v144, sel_localizedStringForKey_value_table_, v145, 0, 0);

  v147 = sub_238506B6C();
  v149 = v148;

  v150 = (void *)sub_238506B48();
  v151 = objc_msgSend(v236, sel_systemImageNamed_, v150);

  v152 = objc_msgSend(v234, sel_systemBlueColor);
  v154 = v14[2];
  v153 = v14[3];
  swift_bridgeObjectRetain();
  v214 = v151;
  v213 = v152;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v154 >= v153 >> 1)
    v14 = sub_2384FBB34((_QWORD *)(v153 > 1), v154 + 1, 1, v14);
  v14[2] = v154 + 1;
  v155 = &v14[9 * v154];
  v155[4] = v147;
  v155[5] = v149;
  v155[6] = v151;
  v155[7] = v152;
  v155[8] = &unk_250A34B10;
  v155[9] = 0;
  v155[10] = 0;
  v155[11] = 0xD000000000000013;
  v155[12] = 0x800000023850A4D0;
  v156 = (void *)qword_256917570;
  v157 = (void *)sub_238506B48();
  v158 = objc_msgSend(v156, sel_localizedStringForKey_value_table_, v157, 0, 0);

  v159 = sub_238506B6C();
  v161 = v160;

  v162 = (void *)sub_238506B48();
  v163 = objc_msgSend(v236, sel_systemImageNamed_, v162);

  v164 = objc_msgSend(v234, sel_systemBlueColor);
  v166 = v14[2];
  v165 = v14[3];
  swift_bridgeObjectRetain();
  v212 = v163;
  v211 = v164;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v166 >= v165 >> 1)
    v14 = sub_2384FBB34((_QWORD *)(v165 > 1), v166 + 1, 1, v14);
  v14[2] = v166 + 1;
  v167 = &v14[9 * v166];
  v167[4] = v159;
  v167[5] = v161;
  v167[6] = v163;
  v167[7] = v164;
  v167[8] = &unk_250A34D60;
  v167[9] = 0;
  v167[10] = 0;
  v167[11] = 0xD000000000000015;
  v167[12] = 0x800000023850A4B0;
  v168 = (void *)qword_256917570;
  v169 = (void *)sub_238506B48();
  v170 = objc_msgSend(v168, sel_localizedStringForKey_value_table_, v169, 0, 0);

  v209 = sub_238506B6C();
  v172 = v171;

  v173 = (void *)sub_238506B48();
  v174 = objc_msgSend(v236, sel_systemImageNamed_, v173);

  v175 = objc_msgSend(v234, sel_systemBlueColor);
  v176 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD1880]), sel_init);
  v177 = objc_msgSend(v176, sel_UUIDString);

  v178 = sub_238506B6C();
  v180 = v179;

  v181 = v14[2];
  v182 = v14[3];
  swift_bridgeObjectRetain();
  v235 = v174;
  v210 = v175;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v181 >= v182 >> 1)
    v14 = sub_2384FBB34((_QWORD *)(v182 > 1), v181 + 1, 1, v14);
  v14[2] = v181 + 1;
  v183 = &v14[9 * v181];
  v183[4] = v209;
  v183[5] = v172;
  v183[6] = v174;
  v183[7] = v175;
  v183[8] = &unk_250A33800;
  v183[9] = 0;
  v183[10] = 0;
  v183[11] = v178;
  v183[12] = v180;
  v184 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD1880]), sel_init);
  v185 = objc_msgSend(v184, sel_UUIDString);

  v186 = sub_238506B6C();
  v188 = v187;

  v189 = v14[2];
  v190 = v14[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v189 >= v190 >> 1)
    v14 = sub_2384FBB34((_QWORD *)(v190 > 1), v189 + 1, 1, v14);
  v14[2] = v189 + 1;
  v191 = &v14[9 * v189];
  *((_OWORD *)v191 + 2) = 0u;
  *((_OWORD *)v191 + 3) = 0u;
  v191[8] = &unk_250A33910;
  *(_OWORD *)(v191 + 9) = xmmword_238508390;
  v191[11] = v186;
  v191[12] = v188;
  v192 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD1880]), sel_init);
  v193 = objc_msgSend(v192, sel_UUIDString);

  v194 = sub_238506B6C();
  v196 = v195;

  v198 = v14[2];
  v197 = v14[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v198 >= v197 >> 1)
    v14 = sub_2384FBB34((_QWORD *)(v197 > 1), v198 + 1, 1, v14);
  v14[2] = v198 + 1;
  v199 = &v14[9 * v198];
  *((_OWORD *)v199 + 2) = 0u;
  *((_OWORD *)v199 + 3) = 0u;
  v199[8] = &unk_250A33A20;
  v199[9] = 0xD000000000000015;
  v199[10] = 0x8000000238509EB0;
  v199[11] = v194;
  v199[12] = v196;
  v200 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD1880]), sel_init);
  v201 = objc_msgSend(v200, sel_UUIDString);

  v202 = sub_238506B6C();
  v204 = v203;

  v206 = v14[2];
  v205 = v14[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v206 >= v205 >> 1)
    v14 = sub_2384FBB34((_QWORD *)(v205 > 1), v206 + 1, 1, v14);
  v14[2] = v206 + 1;
  v207 = &v14[9 * v206];
  *((_OWORD *)v207 + 2) = 0u;
  *((_OWORD *)v207 + 3) = 0u;
  v207[8] = &unk_250A358C0;
  v207[9] = 0xD000000000000015;
  v207[10] = 0x800000023850A030;
  v207[11] = v202;
  v207[12] = v204;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease_n();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  return v14;
}

void type metadata accessor for CCUIGridSizeClassMask(uint64_t a1)
{
  sub_2384F329C(a1, &qword_256915DC8);
}

void type metadata accessor for SBIconLocation(uint64_t a1)
{
  sub_2384F329C(a1, &qword_256915DD0);
}

_DWORD *__swift_memcpy4_2(_DWORD *result, _DWORD *a2)
{
  *result = *a2;
  return result;
}

uint64_t sub_2384F2A00(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 4))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_2384F2A20(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_DWORD *)result = a2 - 1;
    if (!a3)
      return result;
    v3 = 1;
  }
  else
  {
    if (!a3)
      return result;
    v3 = 0;
  }
  *(_BYTE *)(result + 4) = v3;
  return result;
}

void type metadata accessor for SBHIconGridSize(uint64_t a1)
{
  sub_2384F329C(a1, &qword_256915DD8);
}

void type metadata accessor for SBHIconGridSizeClass(uint64_t a1)
{
  sub_2384F329C(a1, &qword_256915DE0);
}

uint64_t initializeBufferWithCopyOfBuffer for ControlsGalleryCustomControlsSectionCollection(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for ControlsGalleryCustomControlsSectionCollection(uint64_t a1)
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *initializeWithCopy for ControlsGalleryCustomControlsSectionCollection(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  id v9;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = (void *)a2[2];
  v5 = (void *)a2[3];
  a1[2] = v4;
  a1[3] = v5;
  v6 = a2[5];
  a1[4] = a2[4];
  a1[5] = v6;
  v7 = a2[7];
  a1[6] = a2[6];
  a1[7] = v7;
  a1[8] = a2[8];
  swift_bridgeObjectRetain();
  v8 = v4;
  v9 = v5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for ControlsGalleryCustomControlsSectionCollection(_QWORD *a1, _QWORD *a2)
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = (void *)a1[2];
  v5 = (void *)a2[2];
  a1[2] = v5;
  v6 = v5;

  v7 = (void *)a1[3];
  v8 = (void *)a2[3];
  a1[3] = v8;
  v9 = v8;

  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[5] = a2[5];
  a1[6] = a2[6];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[7] = a2[7];
  a1[8] = a2[8];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy72_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  result = *(__n128 *)(a2 + 16);
  v3 = *(_OWORD *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)(a1 + 16) = result;
  return result;
}

uint64_t assignWithTake for ControlsGalleryCustomControlsSectionCollection(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease();
  v4 = *(void **)(a1 + 16);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);

  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_bridgeObjectRelease();
  v5 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = v5;
  swift_bridgeObjectRelease();
  v6 = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = v6;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ControlsGalleryCustomControlsSectionCollection(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 72))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 32);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ControlsGalleryCustomControlsSectionCollection(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 72) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 32) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 72) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for ControlsGalleryCustomControlsSectionCollection()
{
  return &type metadata for ControlsGalleryCustomControlsSectionCollection;
}

uint64_t destroy for ControlsGalleryCustomElement()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for ControlsGalleryCustomElement(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  v3 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v3;
  v4 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = v4;
  v5 = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = v5;
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for ControlsGalleryCustomElement(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy80_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  result = *(__n128 *)(a2 + 16);
  v3 = *(_OWORD *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v4;
  *(__n128 *)(a1 + 16) = result;
  *(_OWORD *)(a1 + 32) = v3;
  return result;
}

uint64_t assignWithTake for ControlsGalleryCustomElement(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRelease();
  v4 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v4;
  swift_bridgeObjectRelease();
  v5 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v5;
  swift_bridgeObjectRelease();
  v6 = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = v6;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ControlsGalleryCustomElement(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 80))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *(_QWORD *)(a1 + 24);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for ControlsGalleryCustomElement(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)(result + 72) = 0;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 80) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 80) = 0;
    if (a2)
      *(_QWORD *)(result + 24) = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for ControlsGalleryCustomElement()
{
  return &type metadata for ControlsGalleryCustomElement;
}

void type metadata accessor for CGSize(uint64_t a1)
{
  sub_2384F329C(a1, &qword_256915DE8);
}

uint64_t sub_2384F3058()
{
  return sub_2384F30B0(&qword_256915DF0, (uint64_t (*)(uint64_t))type metadata accessor for SBHIconGridSizeClass, (uint64_t)&unk_238507EF0);
}

uint64_t sub_2384F3084()
{
  return sub_2384F30B0(&qword_256915DF8, (uint64_t (*)(uint64_t))type metadata accessor for SBHIconGridSizeClass, (uint64_t)&unk_238507EC4);
}

uint64_t sub_2384F30B0(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x23B8377A4](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_2384F30F0()
{
  return sub_2384F30B0(&qword_256915E00, (uint64_t (*)(uint64_t))type metadata accessor for SBIconLocation, (uint64_t)&unk_238508004);
}

uint64_t sub_2384F311C()
{
  return sub_2384F30B0(&qword_256915E08, (uint64_t (*)(uint64_t))type metadata accessor for SBIconLocation, (uint64_t)&unk_238507FD8);
}

uint64_t sub_2384F3148()
{
  return sub_2384F30B0(&qword_256915E10, (uint64_t (*)(uint64_t))type metadata accessor for CCUIGridSizeClassMask, (uint64_t)&unk_238508138);
}

uint64_t sub_2384F3174()
{
  return sub_2384F30B0(&qword_256915E18, (uint64_t (*)(uint64_t))type metadata accessor for CCUIGridSizeClassMask, (uint64_t)&unk_238508104);
}

uint64_t sub_2384F31A0()
{
  return sub_2384F30B0(&qword_256915E20, (uint64_t (*)(uint64_t))type metadata accessor for CCUIGridSizeClassMask, (uint64_t)&unk_238508164);
}

uint64_t sub_2384F31CC()
{
  return sub_2384F30B0(&qword_256915E28, (uint64_t (*)(uint64_t))type metadata accessor for CCUIGridSizeClassMask, (uint64_t)&unk_2385081A0);
}

uint64_t sub_2384F31F8()
{
  return sub_2384F30B0(&qword_256915E30, (uint64_t (*)(uint64_t))type metadata accessor for SBIconLocation, (uint64_t)&unk_238508074);
}

uint64_t sub_2384F3224()
{
  return sub_2384F30B0(&qword_256915E38, (uint64_t (*)(uint64_t))type metadata accessor for SBHIconGridSizeClass, (uint64_t)&unk_238507F60);
}

uint64_t sub_2384F3250(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return 0;
  result = 0;
  v4 = (uint64_t *)(a1 + 32);
  do
  {
    v6 = *v4++;
    v5 = v6;
    if ((v6 & ~result) == 0)
      v5 = 0;
    result |= v5;
    --v1;
  }
  while (v1);
  return result;
}

void type metadata accessor for CCUIGridSizeClass(uint64_t a1)
{
  sub_2384F329C(a1, (unint64_t *)&unk_256915E60);
}

void sub_2384F329C(uint64_t a1, unint64_t *a2)
{
  unint64_t ForeignTypeMetadata;
  uint64_t v4;

  if (!*a2)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4)
      atomic_store(ForeignTypeMetadata, a2);
  }
}

id sub_2384F3318()
{
  uint64_t ObjCClassFromMetadata;
  id result;

  _s2__CMa();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  result = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  qword_256917570 = (uint64_t)result;
  return result;
}

uint64_t sub_2384F336C()
{
  return swift_deallocClassInstance();
}

uint64_t _s2__CMa()
{
  return objc_opt_self();
}

uint64_t CCUISConfiguredControl.description.getter()
{
  void *v0;
  void *v1;
  id v2;
  id v3;

  v1 = v0;
  sub_238506D1C();
  sub_238506B84();
  v2 = objc_msgSend(v0, sel_identity);
  v3 = objc_msgSend(v2, sel_description);
  sub_238506B6C();

  sub_238506B84();
  swift_bridgeObjectRelease();
  sub_238506B84();
  objc_msgSend(v1, sel_type);
  sub_238506C44();
  sub_238506B84();
  swift_bridgeObjectRelease();
  sub_238506B84();
  objc_msgSend(v1, sel_size);
  type metadata accessor for CHSControlSize(0);
  sub_238506D94();
  sub_238506B84();
  return 0;
}

void __swiftcall CCUISConfiguredControl.init()(CCUISConfiguredControl *__return_ptr retstr)
{
  objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
}

void CCUISConfiguredControl.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

unint64_t type metadata accessor for CCUISConfiguredControl()
{
  unint64_t result;

  result = qword_256916188;
  if (!qword_256916188)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_256916188);
  }
  return result;
}

uint64_t CCUIModuleIconElement.moduleIdentifier.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR___CCUIModuleIconElement_moduleIdentifier);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t CCUIModuleIconElement.containerBundleIdentifier.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR___CCUIModuleIconElement_containerBundleIdentifier);
  swift_bridgeObjectRetain();
  return v1;
}

id CCUIModuleIconElement.standardSupportedGridSizeClasses.getter()
{
  uint64_t v0;

  return *(id *)(v0 + OBJC_IVAR___CCUIModuleIconElement_standardSupportedGridSizeClasses);
}

uint64_t CCUIModuleIconElement.expandsGridSizeClassesForAccessibility.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + OBJC_IVAR___CCUIModuleIconElement_expandsGridSizeClassesForAccessibility);
}

id CCUIModuleIconElement.supportedGridSizeClasses.getter()
{
  uint64_t v0;

  return *(id *)(v0 + OBJC_IVAR___CCUIModuleIconElement__supportedGridSizeClasses);
}

id sub_2384F37D4()
{
  void *v0;

  swift_bridgeObjectRetain();
  v0 = (void *)sub_238506B48();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t CCUIModuleIconElement.uniqueIdentifier.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR___CCUIModuleIconElement_uniqueIdentifier);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t CCUIModuleIconElement.displayName.getter()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v1 = (uint64_t *)(v0 + OBJC_IVAR___CCUIModuleIconElement_displayName);
  swift_beginAccess();
  v2 = *v1;
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t CCUIModuleIconElement.displayName.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;

  v5 = (_QWORD *)(v2 + OBJC_IVAR___CCUIModuleIconElement_displayName);
  swift_beginAccess();
  *v5 = a1;
  v5[1] = a2;
  return swift_bridgeObjectRelease();
}

void sub_2384F39F4(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = objc_msgSend(*a1, sel_displayName);
  if (v3)
  {
    v4 = v3;
    v5 = sub_238506B6C();
    v7 = v6;

  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  *a2 = v5;
  a2[1] = v7;
}

void sub_2384F3A58(uint64_t a1, void **a2)
{
  void *v2;
  uint64_t v3;
  id v4;

  v2 = *a2;
  if (*(_QWORD *)(a1 + 8))
    v3 = sub_238506B48();
  else
    v3 = 0;
  v4 = (id)v3;
  objc_msgSend(v2, sel_setDisplayName_);

}

uint64_t CCUIModuleIconElement.preferredGallerySizeClass.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___CCUIModuleIconElement_preferredGallerySizeClass;
  swift_beginAccess();
  return *(_QWORD *)v1;
}

uint64_t CCUIModuleIconElement.preferredGallerySizeClass.setter(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t result;

  v3 = (_QWORD *)(v1 + OBJC_IVAR___CCUIModuleIconElement_preferredGallerySizeClass);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

void sub_2384F3BCC(char a1)
{
  char *v1;
  id v3;
  void *v4;
  id v5;

  if (objc_msgSend(v1, sel_expandsGridSizeClassesForAccessibility))
  {
    if ((a1 & 1) != 0)
      v3 = *(id *)&v1[OBJC_IVAR___CCUIModuleIconElement_accessibilitySupportedGridSizeClasses];
    else
      v3 = objc_msgSend(v1, sel_standardSupportedGridSizeClasses);
    v4 = *(void **)&v1[OBJC_IVAR___CCUIModuleIconElement__supportedGridSizeClasses];
    *(_QWORD *)&v1[OBJC_IVAR___CCUIModuleIconElement__supportedGridSizeClasses] = v3;

    v5 = objc_msgSend((id)objc_opt_self(), sel_sbh_leafIconDataSourceNotificationCenter);
    objc_msgSend(v5, sel_postNotificationName_object_, *MEMORY[0x24BEB09F8], v1);

  }
}

id CCUIModuleIconElement.init(moduleIdentifier:containerBundleIdentifier:standardSupportedGridSizeClasses:expandsGridSizeClassesForAccessibility:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, char a6)
{
  id v8;
  void *v9;
  void *v10;
  id v11;

  v8 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v9 = (void *)sub_238506B48();
  swift_bridgeObjectRelease();
  v10 = (void *)sub_238506B48();
  swift_bridgeObjectRelease();
  v11 = objc_msgSend(v8, sel_initWithModuleIdentifier_containerBundleIdentifier_standardSupportedGridSizeClasses_expandsGridSizeClassesForAccessibility_, v9, v10, a5, a6 & 1);

  return v11;
}

id CCUIModuleIconElement.init(moduleIdentifier:containerBundleIdentifier:standardSupportedGridSizeClasses:expandsGridSizeClassesForAccessibility:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, int a6)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v16;
  id v17;

  HIDWORD(v16) = a6;
  v7 = sub_238506AA0();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8]();
  v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_238506A94();
  sub_238506A88();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  v11 = (void *)sub_238506B48();
  swift_bridgeObjectRelease();
  v12 = (void *)sub_238506B48();
  swift_bridgeObjectRelease();
  v13 = (void *)sub_238506B48();
  swift_bridgeObjectRelease();
  v14 = objc_msgSend(v17, sel_initWithUniqueIdentifier_moduleIdentifier_containerBundleIdentifier_standardSupportedGridSizeClasses_expandsGridSizeClassesForAccessibility_, v11, v12, v13, a5, BYTE4(v16) & 1);

  return v14;
}

id CCUIModuleIconElement.init(uniqueIdentifier:moduleIdentifier:containerBundleIdentifier:standardSupportedGridSizeClasses:expandsGridSizeClassesForAccessibility:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, char a8)
{
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v10 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v11 = (void *)sub_238506B48();
  swift_bridgeObjectRelease();
  v12 = (void *)sub_238506B48();
  swift_bridgeObjectRelease();
  v13 = (void *)sub_238506B48();
  swift_bridgeObjectRelease();
  v14 = objc_msgSend(v10, sel_initWithUniqueIdentifier_moduleIdentifier_containerBundleIdentifier_standardSupportedGridSizeClasses_expandsGridSizeClassesForAccessibility_, v11, v12, v13, a7, a8 & 1);

  return v14;
}

{
  id v9;

  v9 = sub_2384F5A34(a1, a2, a3, a4, a5, a6, a7, a8);

  return v9;
}

void sub_2384F4150(uint64_t a1, void *a2, uint64_t a3)
{
  __CFString *v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = (id)SBHIconGridSizeClassForCCUIGridSizeClass(a1);
  LODWORD(a2) = objc_msgSend(a2, sel_containsGridSizeClass_, v6);

  if ((_DWORD)a2)
  {
    v7 = (_QWORD *)(a3 + 16);
    v8 = CCUIAdjustGridSizeClassForAccessibility(a1, 1);
    v9 = CCUIGridSizeClassMaskForGridSizeClass(v8);
    swift_beginAccess();
    if ((v9 & ~*v7) != 0)
      *v7 |= v9;
  }
}

uint64_t CCUIModuleIconElement.priority(for:)()
{
  return 1;
}

uint64_t CCUIModuleIconElement.icon(_:displayNameForLocation:)()
{
  void *v0;
  id v1;
  void *v2;
  uint64_t v3;

  v1 = objc_msgSend(v0, sel_displayName);
  if (!v1)
    return 0;
  v2 = v1;
  v3 = sub_238506B6C();

  return v3;
}

id CCUIModuleIconElement.supportedGridSizeClasses(for:)()
{
  void *v0;

  return objc_msgSend(v0, sel_supportedGridSizeClasses);
}

char *CCUIModuleIconElement.copyWithUniqueIdentifier()()
{
  char *v0;
  id v1;
  id v2;
  id v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  char *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  swift_getObjectType();
  v1 = objc_msgSend(v0, sel_moduleIdentifier);
  sub_238506B6C();

  v2 = objc_msgSend(v0, sel_containerBundleIdentifier);
  sub_238506B6C();

  v3 = objc_msgSend(v0, sel_standardSupportedGridSizeClasses);
  v4 = objc_msgSend(v0, sel_expandsGridSizeClassesForAccessibility);
  v5 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v6 = (void *)sub_238506B48();
  swift_bridgeObjectRelease();
  v7 = (void *)sub_238506B48();
  swift_bridgeObjectRelease();
  v8 = (char *)objc_msgSend(v5, sel_initWithModuleIdentifier_containerBundleIdentifier_standardSupportedGridSizeClasses_expandsGridSizeClassesForAccessibility_, v6, v7, v3, v4);

  v9 = objc_msgSend(v0, sel_displayName);
  objc_msgSend(v8, sel_setDisplayName_, v9);

  objc_msgSend(v8, sel_setPreferredGallerySizeClass_, objc_msgSend(v0, sel_preferredGallerySizeClass));
  v10 = *(void **)&v0[OBJC_IVAR___CCUIModuleIconElement__supportedGridSizeClasses];
  v11 = *(void **)&v8[OBJC_IVAR___CCUIModuleIconElement__supportedGridSizeClasses];
  *(_QWORD *)&v8[OBJC_IVAR___CCUIModuleIconElement__supportedGridSizeClasses] = v10;
  v12 = v10;

  return v8;
}

unint64_t CCUIModuleIconElement.hash.getter()
{
  void *v0;
  void *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  unint64_t v18;
  uint64_t v20;
  uint64_t v21;

  v1 = v0;
  v2 = objc_msgSend(v0, sel_uniqueIdentifier);
  v3 = sub_238506B6C();
  v5 = v4;

  v20 = v3;
  sub_2384F5C40();
  v6 = sub_238506CD4();
  swift_bridgeObjectRelease();
  v7 = objc_msgSend(v1, sel_moduleIdentifier, v20, v5);
  v8 = sub_238506B6C();
  v10 = v9;

  v21 = v8;
  v11 = sub_238506CD4();
  swift_bridgeObjectRelease();
  v12 = objc_msgSend(v1, sel_containerBundleIdentifier, v21, v10);
  v13 = sub_238506B6C();
  v15 = v14;

  v16 = sub_238506CD4();
  swift_bridgeObjectRelease();
  v17 = objc_msgSend(v1, sel_standardSupportedGridSizeClasses, v13, v15);
  v18 = (unint64_t)objc_msgSend(v17, sel_hash);

  return v11 ^ v6 ^ v16 ^ v18 ^ objc_msgSend(v1, sel_expandsGridSizeClassesForAccessibility);
}

uint64_t CCUIModuleIconElement.isEqual(_:)(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  id v32;
  id v33;
  char v34;
  unsigned int v35;
  unsigned int v36;
  void *v37;
  _BYTE v38[24];
  uint64_t v39;

  v2 = v1;
  v3 = sub_2384F5C84(a1, (uint64_t)v38);
  if (v39)
  {
    type metadata accessor for CCUIModuleIconElement(v3);
    if ((swift_dynamicCast() & 1) != 0)
    {
      if (v37 == v1)
      {

        return 1;
      }
      v4 = objc_msgSend(v1, sel_uniqueIdentifier);
      v5 = sub_238506B6C();
      v7 = v6;

      v8 = objc_msgSend(v37, sel_uniqueIdentifier);
      v9 = sub_238506B6C();
      v11 = v10;

      if (v5 == v9 && v7 == v11)
      {
        swift_bridgeObjectRelease_n();
      }
      else
      {
        v13 = sub_238506E18();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v13 & 1) == 0)
          goto LABEL_20;
      }
      v14 = objc_msgSend(v2, sel_moduleIdentifier);
      v15 = sub_238506B6C();
      v17 = v16;

      v18 = objc_msgSend(v37, sel_moduleIdentifier);
      v19 = sub_238506B6C();
      v21 = v20;

      if (v15 == v19 && v17 == v21)
      {
        swift_bridgeObjectRelease_n();
      }
      else
      {
        v22 = sub_238506E18();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v22 & 1) == 0)
          goto LABEL_20;
      }
      v23 = objc_msgSend(v2, sel_containerBundleIdentifier);
      v24 = sub_238506B6C();
      v26 = v25;

      v27 = objc_msgSend(v37, sel_containerBundleIdentifier);
      v28 = sub_238506B6C();
      v30 = v29;

      if (v24 == v28 && v26 == v30)
      {
        swift_bridgeObjectRelease_n();
        goto LABEL_18;
      }
      v31 = sub_238506E18();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v31 & 1) != 0)
      {
LABEL_18:
        sub_2384F5DDC(0, (unint64_t *)&unk_2569161E0);
        v32 = objc_msgSend(v2, sel_standardSupportedGridSizeClasses);
        v33 = objc_msgSend(v37, sel_standardSupportedGridSizeClasses);
        v34 = sub_238506CA4();

        if ((v34 & 1) != 0)
        {
          v35 = objc_msgSend(v2, sel_expandsGridSizeClassesForAccessibility);
          v36 = objc_msgSend(v37, sel_expandsGridSizeClassesForAccessibility);

          return v35 ^ v36 ^ 1;
        }
      }
LABEL_20:

    }
  }
  else
  {
    sub_2384F5D0C((uint64_t)v38);
  }
  return 0;
}

uint64_t CCUIModuleIconElement.description.getter()
{
  uint64_t v0;
  id v1;
  uint64_t v2;

  v1 = objc_msgSend((id)objc_opt_self(), sel_descriptionForRootObject_, v0);
  v2 = sub_238506B6C();

  return v2;
}

id sub_2384F4C34@<X0>(_QWORD *a1@<X8>)
{
  void *v1;
  void *v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id result;
  uint64_t ObjectType;

  v2 = v1;
  ObjectType = swift_getObjectType();
  v3 = objc_msgSend(v1, sel_uniqueIdentifier);
  sub_238506B6C();

  v4 = objc_msgSend(v1, sel_moduleIdentifier);
  sub_238506B6C();

  v5 = objc_msgSend(v1, sel_containerBundleIdentifier);
  sub_238506B6C();

  v6 = objc_msgSend(v1, sel_standardSupportedGridSizeClasses);
  v7 = objc_msgSend(v1, sel_expandsGridSizeClassesForAccessibility);
  v8 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v9 = (void *)sub_238506B48();
  swift_bridgeObjectRelease();
  v10 = (void *)sub_238506B48();
  swift_bridgeObjectRelease();
  v11 = (void *)sub_238506B48();
  swift_bridgeObjectRelease();
  v12 = objc_msgSend(v8, sel_initWithUniqueIdentifier_moduleIdentifier_containerBundleIdentifier_standardSupportedGridSizeClasses_expandsGridSizeClassesForAccessibility_, v9, v10, v11, v6, v7);

  v13 = objc_msgSend(v2, sel_displayName);
  objc_msgSend(v12, sel_setDisplayName_, v13);

  result = objc_msgSend(v12, sel_setPreferredGallerySizeClass_, objc_msgSend(v2, sel_preferredGallerySizeClass));
  a1[3] = ObjectType;
  *a1 = v12;
  return result;
}

uint64_t CCUIModuleIconElement.appendDescription(to:)(void *a1)
{
  void *v1;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;
  uint64_t result;
  _QWORD v9[6];

  v3 = swift_allocObject();
  *(_QWORD *)(v3 + 16) = a1;
  *(_QWORD *)(v3 + 24) = v1;
  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = sub_2384F5D8C;
  *(_QWORD *)(v4 + 24) = v3;
  v9[4] = sub_2384F5DA4;
  v9[5] = v4;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 1107296256;
  v9[2] = sub_2384F5394;
  v9[3] = &block_descriptor;
  v5 = _Block_copy(v9);
  v6 = a1;
  v7 = v1;
  swift_retain();
  swift_release();
  objc_msgSend(v6, sel_appendProem_block_, v7, v5);
  _Block_release(v5);
  LOBYTE(v7) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  result = swift_release();
  if ((v7 & 1) != 0)
    __break(1u);
  return result;
}

uint64_t sub_2384F4FC8(void *a1, void *a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  char isEscapingClosureAtFileLocation;
  _QWORD v11[6];

  result = (uint64_t)objc_msgSend(a1, sel_hasSuccinctStyle);
  if ((result & 1) == 0)
  {
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = a1;
    *(_QWORD *)(v5 + 24) = a2;
    v6 = swift_allocObject();
    *(_QWORD *)(v6 + 16) = sub_2384F5EBC;
    *(_QWORD *)(v6 + 24) = v5;
    v11[4] = sub_2384F5F18;
    v11[5] = v6;
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 1107296256;
    v11[2] = sub_2384F5394;
    v11[3] = &block_descriptor_16;
    v7 = _Block_copy(v11);
    v8 = a1;
    v9 = a2;
    swift_retain();
    swift_release();
    objc_msgSend(v8, sel_appendBodySectionWithName_block_, 0, v7);
    _Block_release(v7);
    isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
    swift_release();
    result = swift_release();
    if ((isEscapingClosureAtFileLocation & 1) != 0)
      __break(1u);
  }
  return result;
}

void sub_2384F5110(void *a1, id a2)
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  id v13;

  v4 = objc_msgSend(a2, sel_moduleIdentifier);
  if (!v4)
  {
    sub_238506B6C();
    v4 = (id)sub_238506B48();
    swift_bridgeObjectRelease();
  }
  v5 = (void *)sub_238506B48();
  objc_msgSend(a1, sel_appendString_withName_, v4, v5);

  v6 = objc_msgSend(a2, sel_containerBundleIdentifier);
  if (!v6)
  {
    sub_238506B6C();
    v6 = (id)sub_238506B48();
    swift_bridgeObjectRelease();
  }
  v7 = (void *)sub_238506B48();
  objc_msgSend(a1, sel_appendString_withName_, v6, v7);

  v8 = objc_msgSend(a2, sel_supportedGridSizeClasses);
  v9 = (void *)sub_238506B48();

  v10 = objc_msgSend(a2, sel_uniqueIdentifier);
  if (!v10)
  {
    sub_238506B6C();
    v10 = (id)sub_238506B48();
    swift_bridgeObjectRelease();
  }
  v11 = (void *)sub_238506B48();
  objc_msgSend(a1, sel_appendString_withName_, v10, v11);

  v12 = objc_msgSend(a2, sel_displayName);
  v13 = (id)sub_238506B48();
  objc_msgSend(a1, sel_appendString_withName_skipIfEmpty_, v12, v13, 1);

}

uint64_t sub_2384F5374(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_2384F5394(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

void __swiftcall CCUIModuleIconElement.init()(CCUIModuleIconElement *__return_ptr retstr)
{
  objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
}

void CCUIModuleIconElement.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

unint64_t CCUIModuleIconElement.sbh_galleryItemIdentifier.getter()
{
  void *v0;
  id v1;

  sub_238506D1C();
  swift_bridgeObjectRelease();
  v1 = objc_msgSend(v0, sel_uniqueIdentifier);
  sub_238506B6C();

  sub_238506B84();
  swift_bridgeObjectRelease();
  return 0xD00000000000001DLL;
}

uint64_t CCUIModuleIconElement.sbh_appName.getter()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;

  sub_2384F5DDC(0, (unint64_t *)&unk_256916600);
  v1 = objc_msgSend(v0, sel_containerBundleIdentifier);
  v2 = sub_238506B6C();
  v4 = v3;

  v5 = sub_2384F5798(v2, v4, 1);
  v9 = v5;
  if (v5)
  {
    v7 = objc_msgSend(v5, sel_localizedName);
    v8 = sub_238506B6C();

  }
  else
  {
    v6 = objc_msgSend(v0, sel_sbh_widgetName);
    if (!v6)
      return 0;
    v7 = v6;
    v8 = sub_238506B6C();
  }

  return v8;
}

id sub_2384F5798(uint64_t a1, uint64_t a2, char a3)
{
  void *v4;
  id v5;
  id v6;
  id v7;
  id v9[2];

  v9[1] = *(id *)MEMORY[0x24BDAC8D0];
  v4 = (void *)sub_238506B48();
  swift_bridgeObjectRelease();
  v9[0] = 0;
  v5 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_bundleRecordWithBundleIdentifier_allowPlaceholder_error_, v4, a3 & 1, v9);

  if (v5)
  {
    v6 = v9[0];
  }
  else
  {
    v7 = v9[0];
    sub_238506A7C();

    swift_willThrow();
  }
  return v5;
}

uint64_t CCUIModuleIconElement.sbh_widgetName.getter()
{
  void *v0;
  id v1;
  uint64_t v2;

  v1 = objc_msgSend(v0, sel_displayName);
  if (!v1)
    v1 = objc_msgSend(v0, sel_moduleIdentifier);
  v2 = sub_238506B6C();

  return v2;
}

uint64_t CCUIModuleIconElement.sbh_supportedSizeClasses.getter()
{
  return 0;
}

uint64_t CCUIModuleIconElement.sbh_widgetDescription.getter()
{
  return 0;
}

uint64_t CCUIModuleIconElement.sbh_canBeAddedToStack.getter()
{
  return 0;
}

uint64_t CCUIModuleIconElement.sbh_supportsRemovableBackground.getter()
{
  return 0;
}

uint64_t CCUIModuleIconElement.sbh_supportsRemovableBackgroundOrAccessoryFamilies.getter()
{
  return 0;
}

uint64_t CCUIModuleIconElement.backgroundColor.getter()
{
  return 0;
}

uint64_t CCUIModuleIconElement.accentColor.getter()
{
  return 0;
}

uint64_t CCUIModuleIconElement.mostInterestingColor.getter()
{
  return 0;
}

uint64_t CCUIModuleIconElement.sbh_favoredSizeClasses(for:)()
{
  return 0;
}

uint64_t CCUIModuleIconElement.sbh_isLinkedOnOr(after:)()
{
  return 1;
}

id sub_2384F5A34(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, char a8)
{
  char *v8;
  char *v11;
  char *v12;
  char *v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  id v18;
  char *v19;
  id v20;
  id v21;
  id v22;
  char *v23;
  _QWORD v25[6];
  objc_super v26;

  v11 = &v8[OBJC_IVAR___CCUIModuleIconElement_displayName];
  *(_QWORD *)v11 = 0;
  *((_QWORD *)v11 + 1) = 0;
  *(_QWORD *)&v8[OBJC_IVAR___CCUIModuleIconElement_preferredGallerySizeClass] = 0;
  v12 = &v8[OBJC_IVAR___CCUIModuleIconElement_uniqueIdentifier];
  *(_QWORD *)v12 = a1;
  *((_QWORD *)v12 + 1) = a2;
  v13 = &v8[OBJC_IVAR___CCUIModuleIconElement_moduleIdentifier];
  *(_QWORD *)v13 = a3;
  *((_QWORD *)v13 + 1) = a4;
  v14 = &v8[OBJC_IVAR___CCUIModuleIconElement_containerBundleIdentifier];
  *(_QWORD *)v14 = a5;
  *((_QWORD *)v14 + 1) = a6;
  *(_QWORD *)&v8[OBJC_IVAR___CCUIModuleIconElement_standardSupportedGridSizeClasses] = a7;
  if ((a8 & 1) != 0)
  {
    v15 = swift_allocObject();
    *(_QWORD *)(v15 + 16) = 0;
    v16 = swift_allocObject();
    *(_QWORD *)(v16 + 16) = a7;
    *(_QWORD *)(v16 + 24) = v15;
    v25[4] = sub_2384F5F10;
    v25[5] = v16;
    v25[0] = MEMORY[0x24BDAC760];
    v25[1] = 1107296256;
    v25[2] = sub_2384FC1A4;
    v25[3] = &block_descriptor_25;
    v17 = _Block_copy(v25);
    v18 = a7;
    v19 = v8;
    swift_retain();
    swift_release();
    CCUIEnumerateGridSizeClassesWithBlock(v17);
    _Block_release(v17);
    swift_beginAccess();
    v20 = SBHIconGridSizeClassSetForCCUIGridSizeClassMask(*(_QWORD *)(v15 + 16));
    *(_QWORD *)&v19[OBJC_IVAR___CCUIModuleIconElement_accessibilitySupportedGridSizeClasses] = v20;
    v21 = objc_msgSend(v18, sel_gridSizeClassSetByUnioningWithGridSizeClassSet_, v20);
    *(_QWORD *)&v19[OBJC_IVAR___CCUIModuleIconElement__supportedGridSizeClasses] = v21;
    swift_release();
  }
  else
  {
    *(_QWORD *)&v8[OBJC_IVAR___CCUIModuleIconElement_accessibilitySupportedGridSizeClasses] = a7;
    *(_QWORD *)&v8[OBJC_IVAR___CCUIModuleIconElement__supportedGridSizeClasses] = a7;
    v22 = a7;
    v23 = v8;
  }
  v8[OBJC_IVAR___CCUIModuleIconElement_expandsGridSizeClassesForAccessibility] = a8 & 1;

  v26.receiver = v8;
  v26.super_class = (Class)CCUIModuleIconElement;
  return objc_msgSendSuper2(&v26, sel_init);
}

unint64_t sub_2384F5C40()
{
  unint64_t result;

  result = qword_2542CEBB0;
  if (!qword_2542CEBB0)
  {
    result = MEMORY[0x23B8377A4](MEMORY[0x24BEE0D50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_2542CEBB0);
  }
  return result;
}

uint64_t sub_2384F5C84(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569161D8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x23B83778C]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_2384F5D0C(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569161D8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t type metadata accessor for CCUIModuleIconElement(uint64_t a1)
{
  return sub_2384F5DDC(a1, qword_2542CEBD0);
}

uint64_t sub_2384F5D60()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_2384F5D8C()
{
  uint64_t v0;

  return sub_2384F4FC8(*(void **)(v0 + 16), *(void **)(v0 + 24));
}

uint64_t sub_2384F5D94()
{
  return swift_deallocObject();
}

uint64_t sub_2384F5DA4()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

uint64_t sub_2384F5DDC(uint64_t a1, unint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, a2);
  }
  return result;
}

char *keypath_get_selector_displayName()
{
  return sel_displayName;
}

char *keypath_get_selector_preferredGallerySizeClass()
{
  return sel_preferredGallerySizeClass;
}

id sub_2384F5E34@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_preferredGallerySizeClass);
  *a2 = result;
  return result;
}

id sub_2384F5E64(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setPreferredGallerySizeClass_, *a1);
}

_QWORD *__swift_project_boxed_opaque_existential_0(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t __swift_destroy_boxed_opaque_existential_0(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

void sub_2384F5EBC()
{
  uint64_t v0;

  sub_2384F5110(*(void **)(v0 + 16), *(id *)(v0 + 24));
}

uint64_t sub_2384F5EC4()
{
  return swift_deallocObject();
}

uint64_t sub_2384F5ED4()
{
  return swift_deallocObject();
}

uint64_t sub_2384F5EE4()
{
  uint64_t v0;

  swift_release();
  return swift_deallocObject();
}

void sub_2384F5F10(uint64_t a1)
{
  uint64_t v1;

  sub_2384F4150(a1, *(void **)(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t CCUISControlsGalleryResult.description.getter()
{
  void *v0;
  void *v1;
  id v2;
  id v3;

  v1 = v0;
  sub_238506D1C();
  swift_bridgeObjectRelease();
  v2 = objc_msgSend(v0, sel_control);
  v3 = objc_msgSend(v2, sel_description);
  sub_238506B6C();

  sub_238506B84();
  swift_bridgeObjectRelease();
  sub_238506B84();
  objc_msgSend(v1, sel_promptsForUserConfiguration);
  sub_238506B84();
  swift_bridgeObjectRelease();
  sub_238506B84();
  return 0x6C6F72746E6F6328;
}

void __swiftcall CCUISControlsGalleryResult.init()(CCUISControlsGalleryResult *__return_ptr retstr)
{
  objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
}

void CCUISControlsGalleryResult.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

unint64_t type metadata accessor for CCUISControlsGalleryResult()
{
  unint64_t result;

  result = qword_256916390;
  if (!qword_256916390)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_256916390);
  }
  return result;
}

uint64_t sub_2384F6218()
{
  uint64_t v0;
  uint64_t result;

  v0 = sub_238506AE8();
  __swift_allocate_value_buffer(v0, qword_256916398);
  __swift_project_value_buffer(v0, (uint64_t)qword_256916398);
  result = *MEMORY[0x24BE19AA8];
  if (*MEMORY[0x24BE19AA8])
  {
    sub_238506B90();
    return sub_238506ADC();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t static Logger.controlServices.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_256915C68 != -1)
    swift_once();
  v2 = sub_238506AE8();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_256916398);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t *__swift_allocate_value_buffer(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  if ((*(_DWORD *)(*(_QWORD *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

void sub_2384F63D8()
{
  char *v0;
  void *v1;
  void *v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  id v15;
  void *v16;
  objc_super v17;

  v1 = v0;
  v17.receiver = v0;
  v17.super_class = (Class)type metadata accessor for ControlContainerViewController();
  objc_msgSendSuper2(&v17, sel_viewDidLoad);
  v2 = *(void **)&v0[OBJC_IVAR____TtC23ControlCenterUIServices30ControlContainerViewController_controlViewController];
  objc_msgSend(v0, sel_bs_addChildViewController_, v2);
  v3 = objc_msgSend(v2, sel_view);
  if (!v3)
  {
    __break(1u);
    goto LABEL_6;
  }
  v4 = v3;
  v5 = objc_msgSend(v1, sel_view);
  if (!v5)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  v6 = v5;
  objc_msgSend(v5, sel_bounds);
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  objc_msgSend(v4, sel_setFrame_, v8, v10, v12, v14);
  v15 = objc_msgSend(v2, sel_view);
  if (v15)
  {
    v16 = v15;
    objc_msgSend(v15, sel_setAutoresizingMask_, 18);

    return;
  }
LABEL_7:
  __break(1u);
}

id sub_2384F6644()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ControlContainerViewController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for ControlContainerViewController()
{
  return objc_opt_self();
}

char *sub_2384F66A4(void *a1)
{
  char *v1;
  uint64_t v3;
  char *v4;
  char *v5;
  id v6;
  char *v7;
  id v8;
  char *v9;
  char *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  char *v17;
  _QWORD v19[2];
  objc_super v20;

  sub_238506B00();
  MEMORY[0x24BDAC7A8]();
  v4 = (char *)v19 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_unknownObjectWeakInit();
  *(_QWORD *)&v1[OBJC_IVAR___CCUISControlsGalleryViewController_selectedControl] = 0;
  *(_QWORD *)&v1[OBJC_IVAR___CCUISControlsGalleryViewController_addWidgetSheetViewController] = 0;
  *(_QWORD *)&v1[OBJC_IVAR___CCUISControlsGalleryViewController_galleryManager] = 0;
  swift_unknownObjectWeakInit();
  if (a1)
  {
    v5 = v1;
    objc_msgSend(a1, sel_copy);
    sub_238506CE0();
    swift_unknownObjectRelease();
    type metadata accessor for CCUISControlsGalleryConfiguration(0);
    if ((swift_dynamicCast() & 1) != 0)
    {
      v6 = (id)v19[1];
      goto LABEL_6;
    }
  }
  else
  {
    v7 = v1;
  }
  v6 = objc_msgSend(objc_allocWithZone((Class)CCUISControlsGalleryConfiguration), sel_init);
LABEL_6:
  *(_QWORD *)&v1[OBJC_IVAR___CCUISControlsGalleryViewController_configuration] = v6;

  v20.receiver = v1;
  v20.super_class = (Class)CCUISControlsGalleryViewController;
  v8 = objc_msgSendSuper2(&v20, sel_initWithNibName_bundle_, 0, 0);
  objc_allocWithZone((Class)type metadata accessor for ControlsGalleryManager());
  v9 = (char *)v8;
  v10 = sub_2384FEC60(v9);
  v11 = *(void **)&v9[OBJC_IVAR___CCUISControlsGalleryViewController_galleryManager];
  *(_QWORD *)&v9[OBJC_IVAR___CCUISControlsGalleryViewController_galleryManager] = v10;

  v12 = objc_msgSend(v9, sel_sheetPresentationController);
  if (v12)
  {
    v13 = v12;
    sub_238506C98();
    v14 = objc_msgSend(v9, sel_traitCollection);
    v15 = objc_msgSend(v14, sel_userInterfaceIdiom);

    objc_msgSend(v13, sel_setPrefersGrabberVisible_, v15 == 0);
    objc_msgSend(v13, sel__setShouldDismissWhenTappedOutside_, 1);
    v16 = v13;
    MEMORY[0x23B8371EC]();
    sub_238506AF4();
    MEMORY[0x23B8371F8](v4);

  }
  v17 = v9;
  sub_2384F6940();
  objc_msgSend(v17, sel_setPreferredContentSize_);

  return v17;
}

void sub_2384F6940()
{
  void *v0;
  id v1;
  id v2;
  id v3;
  id v4;
  CGRect v5;
  CGRect v6;

  v1 = objc_msgSend(v0, sel_traitCollection);
  v2 = objc_msgSend(v1, sel_userInterfaceIdiom);

  if (v2 == (id)1)
  {
    CCUIReferenceScreenBounds();
    CGRectGetWidth(v5);
    CCUIScreenSafeAreaInsets();
    v3 = objc_msgSend((id)objc_opt_self(), sel_currentDevice);
    v4 = objc_msgSend(v3, sel_userInterfaceIdiom);

    if (v4 != (id)1)
    {
      CCUIReferenceScreenBounds();
      CGRectGetWidth(v6);
    }
  }
}

void __swiftcall CCUISControlsGalleryViewController.init(coder:)(CCUISControlsGalleryViewController_optional *__return_ptr retstr, NSCoder coder)
{
  objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithCoder_, coder.super.isa);

}

Swift::Void __swiftcall CCUISControlsGalleryViewController.viewDidLoad()()
{
  char *v0;
  char *v1;
  id v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  __CFString *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  objc_super v23;

  v1 = v0;
  v23.super_class = (Class)CCUISControlsGalleryViewController;
  objc_msgSendSuper2(&v23, sel_viewDidLoad);
  objc_msgSend(v0, sel_setOverrideUserInterfaceStyle_, 2);
  v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEB0890]), sel_init);
  if (qword_256915C60 != -1)
    swift_once();
  v3 = (void *)qword_256917570;
  v4 = (void *)sub_238506B48();
  v5 = objc_msgSend(v3, sel_localizedStringForKey_value_table_, v4, 0, 0);

  sub_238506B6C();
  v6 = (void *)sub_238506B48();
  swift_bridgeObjectRelease();
  objc_msgSend(v2, sel_setSearchPlaceholderText_, v6);

  v7 = objc_msgSend((id)objc_opt_self(), sel_labelColor);
  objc_msgSend(v2, sel_setSearchTintColor_, v7);

  objc_msgSend(v2, sel_setBackgroundMaterial_, 1);
  objc_msgSend(v2, sel_setApplicationCellIncludesGalleryListView_, 1);
  objc_msgSend(v2, sel_setContentContainsInteractiveUIControls_, 1);
  v8 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for ControlsGalleryIconListLayoutProvider()), sel_init);
  objc_msgSend(v2, sel_setListLayoutProvider_, v8);

  v9 = OBJC_IVAR___CCUISControlsGalleryViewController_galleryManager;
  v10 = *(_QWORD *)&v1[OBJC_IVAR___CCUISControlsGalleryViewController_galleryManager];
  if (!v10)
  {
    __break(1u);
    goto LABEL_12;
  }
  objc_msgSend(v2, sel_setIconViewProvider_, *(_QWORD *)(v10 + OBJC_IVAR____TtC23ControlCenterUIServices22ControlsGalleryManager_iconViewProvider));
  v11 = objc_msgSend((id)objc_opt_self(), sel_controlCenterDomain);
  objc_msgSend(v2, sel_setGridSizeClassDomain_, v11);

  v12 = (id)SBHIconGridSizeClassForCCUIGridSizeClass(3);
  objc_msgSend(v2, sel_setGridSizeClassForContentWidth_, v12);

  objc_msgSend(v2, sel_setWantsCustomApplicationsSection_, 1);
  v13 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEB08A0]), sel_initWithConfiguration_, v2);
  objc_msgSend(v13, sel_setOverrideUserInterfaceStyle_, 2);
  objc_msgSend(v13, sel_setDelegate_, *(_QWORD *)&v1[v9]);
  v14 = v13;
  v15 = objc_msgSend(v1, sel_traitCollection);
  v16 = objc_msgSend(v15, sel_userInterfaceIdiom);

  objc_msgSend(v14, sel_setWantsBottomAttachedPresentation_, v16 == 0);
  objc_msgSend(v1, sel_bs_addChildViewController_, v14);
  v17 = *(void **)&v1[v9];
  if (!v17)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  v18 = v17;
  sub_2384FF1F8();

  v19 = *(_QWORD *)&v1[v9];
  if (!v19)
  {
LABEL_13:
    __break(1u);
LABEL_14:
    __break(1u);
    return;
  }
  if (*(_QWORD *)(v19 + OBJC_IVAR____TtC23ControlCenterUIServices22ControlsGalleryManager_applicationControlCollections))
  {
    sub_2384F5DDC(0, &qword_2569164A0);
    swift_bridgeObjectRetain();
    v20 = (void *)sub_238506BCC();
    swift_bridgeObjectRelease();
    objc_msgSend(v14, sel_setApplicationWidgetCollections_, v20);

    v19 = *(_QWORD *)&v1[v9];
    if (!v19)
      goto LABEL_14;
  }
  if (*(_QWORD *)(v19
                 + OBJC_IVAR____TtC23ControlCenterUIServices22ControlsGalleryManager_galleryApplicationControlCollections))
  {
    sub_2384F5DDC(0, &qword_2569164A0);
    swift_bridgeObjectRetain();
    v21 = (void *)sub_238506BCC();
    swift_bridgeObjectRelease();
    objc_msgSend(v14, sel_setCustomApplicationWidgetCollections_, v21);

  }
  v22 = *(void **)&v1[OBJC_IVAR___CCUISControlsGalleryViewController_addWidgetSheetViewController];
  *(_QWORD *)&v1[OBJC_IVAR___CCUISControlsGalleryViewController_addWidgetSheetViewController] = v14;

}

Swift::Void __swiftcall CCUISControlsGalleryViewController.viewWillAppear(_:)(Swift::Bool a1)
{
  sub_2384F71D0(a1, (SEL *)&selRef_controlsGalleryViewControllerWillPresent_, (SEL *)&selRef_viewWillAppear_);
}

Swift::Void __swiftcall CCUISControlsGalleryViewController.viewIsAppearing(_:)(Swift::Bool a1)
{
  id v1;
  void *v2;
  objc_super v3;

  v3.super_class = (Class)CCUISControlsGalleryViewController;
  objc_msgSendSuper2(&v3, sel_viewIsAppearing_, a1);
  v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE169D0]), sel_init);
  v2 = (void *)sub_238506B48();
  objc_msgSend(v1, sel_userEnteredAddGalleryForHost_, v2);

}

Swift::Void __swiftcall CCUISControlsGalleryViewController.viewDidAppear(_:)(Swift::Bool a1)
{
  sub_2384F71D0(a1, (SEL *)&selRef_controlsGalleryViewControllerDidPresent_, (SEL *)&selRef_viewDidAppear_);
}

Swift::Void __swiftcall CCUISControlsGalleryViewController.viewWillDisappear(_:)(Swift::Bool a1)
{
  sub_2384F71D0(a1, (SEL *)&selRef_controlsGalleryViewControllerWillDismiss_, (SEL *)&selRef_viewWillDisappear_);
}

Swift::Void __swiftcall CCUISControlsGalleryViewController.viewDidDisappear(_:)(Swift::Bool a1)
{
  sub_2384F71D0(a1, (SEL *)&selRef_controlsGalleryViewControllerDidDismiss_, (SEL *)&selRef_viewDidDisappear_);
}

id sub_2384F71D0(char a1, SEL *a2, SEL *a3)
{
  void *v3;
  void *v6;
  id v8;
  void *v9;
  objc_super v11;

  v6 = v3;
  v8 = objc_msgSend(v6, sel_delegate);
  if (v8)
  {
    v9 = v8;
    if ((objc_msgSend(v8, sel_respondsToSelector_, *a2) & 1) != 0)
      objc_msgSend(v9, *a2, v6);
    swift_unknownObjectRelease();
  }
  v11.receiver = v6;
  v11.super_class = (Class)CCUISControlsGalleryViewController;
  return objc_msgSendSuper2(&v11, *a3, a1 & 1);
}

void sub_2384F728C(void *a1, uint64_t a2, uint64_t a3, SEL *a4, SEL *a5)
{
  id v8;
  id v9;
  void *v10;
  objc_super v11;

  v8 = a1;
  v9 = objc_msgSend(v8, sel_delegate);
  if (v9)
  {
    v10 = v9;
    if ((objc_msgSend(v9, sel_respondsToSelector_, *a4) & 1) != 0)
      objc_msgSend(v10, *a4, v8);
    swift_unknownObjectRelease();
  }
  v11.receiver = v8;
  v11.super_class = (Class)CCUISControlsGalleryViewController;
  objc_msgSendSuper2(&v11, *a5, a3);

}

Swift::Void __swiftcall CCUISControlsGalleryViewController.viewWillLayoutSubviews()()
{
  char *v0;
  void *v1;
  id v2;
  void *v3;
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  objc_super v14;

  v14.super_class = (Class)CCUISControlsGalleryViewController;
  objc_msgSendSuper2(&v14, sel_viewWillLayoutSubviews);
  v1 = *(void **)&v0[OBJC_IVAR___CCUISControlsGalleryViewController_addWidgetSheetViewController];
  if (!v1)
  {
    __break(1u);
    goto LABEL_6;
  }
  v2 = objc_msgSend(v1, sel_view);
  if (!v2)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  v3 = v2;
  v4 = objc_msgSend(v0, sel_view);
  if (v4)
  {
    v5 = v4;
    objc_msgSend(v4, sel_bounds);
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;

    objc_msgSend(v3, sel_setFrame_, v7, v9, v11, v13);
    return;
  }
LABEL_7:
  __break(1u);
}

void sub_2384F7458(id a1, uint64_t a2)
{
  void *v2;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;

  v5 = objc_msgSend(v2, sel_delegate);
  if (!v5)
  {
    objc_msgSend(v2, sel_dismissViewControllerAnimated_completion_, 1, 0);
    return;
  }
  v6 = v5;
  if ((objc_msgSend(v5, sel_respondsToSelector_, sel_controlsGalleryViewController_didFinishWithResult_error_) & 1) != 0)
  {
    swift_unknownObjectRetain();
    if (a2)
      v7 = (void *)sub_238506A70();
    else
      v7 = 0;
    objc_msgSend(v6, sel_controlsGalleryViewController_didFinishWithResult_error_, v2, a1, v7);
    swift_unknownObjectRelease();

  }
  if ((objc_msgSend(v6, sel_respondsToSelector_, sel_controlsGalleryViewController_didFinishWithControl_error_) & 1) == 0)
  {
    swift_unknownObjectRelease();
    return;
  }
  if (!a1)
  {
    swift_unknownObjectRetain();
    if (a2)
      goto LABEL_11;
LABEL_14:
    v8 = 0;
    goto LABEL_15;
  }
  swift_unknownObjectRetain();
  a1 = objc_msgSend(a1, sel_control);
  if (!a2)
    goto LABEL_14;
LABEL_11:
  v8 = sub_238506A70();
LABEL_15:
  v9 = (id)v8;
  objc_msgSend(v6, sel_controlsGalleryViewController_didFinishWithControl_error_, v2, a1);

  swift_unknownObjectRelease_n();
}

void __swiftcall CCUISControlsGalleryViewController.init(nibName:bundle:)(CCUISControlsGalleryViewController *__return_ptr retstr, Swift::String_optional nibName, NSBundle_optional bundle)
{
  Class isa;
  void *v4;

  isa = bundle.value.super.isa;
  if (nibName.value._object)
  {
    v4 = (void *)sub_238506B48();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }
  objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithNibName_bundle_, v4, isa);

}

void CCUISControlsGalleryViewController.init(nibName:bundle:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

void _sSo34CCUISControlsGalleryViewControllerC23ControlCenterUIServicesE5coderABSgSo7NSCoderC_tcfc_0()
{
  char *v0;

  swift_unknownObjectWeakInit();
  *(_QWORD *)&v0[OBJC_IVAR___CCUISControlsGalleryViewController_selectedControl] = 0;
  *(_QWORD *)&v0[OBJC_IVAR___CCUISControlsGalleryViewController_addWidgetSheetViewController] = 0;
  *(_QWORD *)&v0[OBJC_IVAR___CCUISControlsGalleryViewController_galleryManager] = 0;
  swift_unknownObjectWeakInit();

  sub_238506DAC();
  __break(1u);
}

uint64_t type metadata accessor for CCUISControlsGalleryViewController(uint64_t a1)
{
  return sub_2384F5DDC(a1, (unint64_t *)&unk_2569164C8);
}

uint64_t sub_2384F7830(uint64_t a1)
{
  swift_unknownObjectWeakDestroy();
  return a1;
}

uint64_t CCUIGridSizeClass.init(controlSize:)(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 2)
    return 0;
  else
    return qword_2385083E0[a1 - 1];
}

id sub_2384F7878()
{
  void *v0;
  id v1;
  uint64_t inited;
  void *v3;
  id v4;
  id v5;
  void *v6;
  id v7;

  v1 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for ControlsGalleryIconListLayout()), sel_init);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256916528);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_238508400;
  v3 = (void *)*MEMORY[0x24BEB09F0];
  *(_QWORD *)(inited + 32) = *MEMORY[0x24BEB09F0];
  *(_QWORD *)(inited + 40) = v1;
  v4 = v3;
  v5 = v1;
  sub_2384FE908(inited);
  type metadata accessor for SBIconLocation(0);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_256916518);
  sub_2384F30B0(&qword_256915E40, (uint64_t (*)(uint64_t))type metadata accessor for SBIconLocation, (uint64_t)&unk_2385082A8);
  v6 = (void *)sub_238506B0C();
  swift_bridgeObjectRelease();
  v7 = objc_msgSend(v0, sel_initWithListLayouts_, v6);

  return v7;
}

id sub_2384F7A9C()
{
  return sub_2384F837C(type metadata accessor for ControlsGalleryIconListLayoutProvider);
}

uint64_t type metadata accessor for ControlsGalleryIconListLayoutProvider()
{
  return objc_opt_self();
}

uint64_t sub_2384F7B90(void *a1, uint64_t a2, uint64_t (*a3)(_QWORD), uint64_t a4, uint64_t a5)
{
  uint64_t *v7;
  int v8;
  int v9;
  unsigned int v10;
  void *v11;
  id v12;
  id v13;
  char isUniquelyReferenced_nonNull_native;
  void *v15;
  uint64_t v17;

  v7 = (uint64_t *)(a5 + 16);
  CCUIGridSizeClassForSBHIconGridSizeClass(a1);
  v8 = CCUINumberOfColumnsForGridSizeClass();
  v9 = CCUINumberOfRowsForGridSizeClass();
  v10 = a3(v8 | (v9 << 16));
  v11 = (void *)objc_opt_self();
  v12 = a1;
  v13 = objc_msgSend(v11, sel_sbh_valueWithSBHIconGridSize_, v10);
  swift_beginAccess();
  if (v13)
  {
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v17 = *v7;
    *v7 = 0x8000000000000000;
    sub_2384F8CF0((uint64_t)v13, v12, isUniquelyReferenced_nonNull_native);
    *v7 = v17;

    swift_bridgeObjectRelease();
  }
  else
  {
    v15 = (void *)sub_2384F8404((uint64_t)v12);

  }
  return swift_endAccess();
}

void sub_2384F7CB4(uint64_t a1, void *a2)
{
  void (*v3)(void);
  id v4;

  v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3();
  swift_release();

}

uint64_t sub_2384F7DDC(uint64_t result)
{
  double v1;
  double v2;

  v1 = ceil((double)(unsigned __int16)result * 0.5);
  v2 = v1 + v1;
  if ((~*(_QWORD *)&v2 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_6;
  }
  if (v2 <= -1.0)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  if (v2 < 65536.0)
    return result & 0xFFFF0000 | (int)v2;
LABEL_7:
  __break(1u);
  return result;
}

double sub_2384F7EB8(void *a1)
{
  uint64_t v1;
  id v3;
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  unsigned __int16 v9;
  double v10;
  id v11;
  double v12;

  v3 = objc_msgSend((id)objc_opt_self(), sel_controlCenterDomain);
  v4 = objc_msgSend(v3, sel_allNonDefaultGridSizeClasses);

  LOBYTE(v3) = objc_msgSend(v4, sel_containsGridSizeClass_, a1);
  if ((v3 & 1) != 0)
  {
    sub_2384F814C();
    v6 = v5;
    v8 = v7;
    v9 = (unsigned __int16)objc_msgSend(*(id *)(v1+ OBJC_IVAR____TtC23ControlCenterUIServices29ControlsGalleryIconListLayout_realIconGridSizeClassSizes), sel_gridSizeForGridSizeClass_, a1);
    v10 = v6 * (double)v9 + v8 * ((double)v9 + -1.0);
    CCUIGridSizeClassForSBHIconGridSizeClass(a1);
    CCUICompactModuleContinuousCornerRadiusForGridSizeClass();
    sub_2384F80CC();
  }
  else
  {
    v11 = sub_2384F8218();
    if ((objc_msgSend(v11, sel_respondsToSelector_, sel_iconImageInfoForGridSizeClass_) & 1) != 0)
    {
      objc_msgSend(v11, sel_iconImageInfoForGridSizeClass_, a1);
    }
    else
    {
      swift_unknownObjectRelease();
      objc_msgSend(sub_2384F8218(), sel_iconImageInfo);
    }
    v10 = v12;
    swift_unknownObjectRelease();
  }
  return v10;
}

double sub_2384F80CC()
{
  uint64_t v0;
  _BYTE *v1;
  id v2;
  double v3;
  double v4;

  v1 = (_BYTE *)(v0
               + OBJC_IVAR____TtC23ControlCenterUIServices29ControlsGalleryIconListLayout____lazy_storage___displayScale);
  if ((v1[8] & 1) == 0)
    return *(double *)v1;
  v2 = objc_msgSend((id)objc_opt_self(), sel_mainScreen);
  objc_msgSend(v2, sel_scale);
  v4 = v3;

  *(double *)v1 = v4;
  v1[8] = 0;
  return v4;
}

void sub_2384F814C()
{
  uint64_t v0;
  uint64_t v1;
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  CGRect v6;

  v1 = v0 + OBJC_IVAR____TtC23ControlCenterUIServices29ControlsGalleryIconListLayout____lazy_storage___gridGeometryInfo;
  if ((*(_BYTE *)(v0
                 + OBJC_IVAR____TtC23ControlCenterUIServices29ControlsGalleryIconListLayout____lazy_storage___gridGeometryInfo
                 + 16) & 1) != 0)
  {
    v2 = objc_msgSend((id)objc_opt_self(), sel_currentDevice);
    v3 = objc_msgSend(v2, sel_userInterfaceIdiom);

    if (v3 != (id)1)
    {
      CCUIReferenceScreenBounds();
      CGRectGetWidth(v6);
    }
    sub_2384F80CC();
    CCUICalculateGridGeometryInfo();
    *(_QWORD *)v1 = v4;
    *(_QWORD *)(v1 + 8) = v5;
    *(_BYTE *)(v1 + 16) = 0;
  }
}

id sub_2384F8218()
{
  uint64_t v0;
  uint64_t v1;
  id v2;
  id v3;
  id result;

  v1 = OBJC_IVAR____TtC23ControlCenterUIServices29ControlsGalleryIconListLayout____lazy_storage___defaultRootListLayout;
  if (*(_QWORD *)(v0
                 + OBJC_IVAR____TtC23ControlCenterUIServices29ControlsGalleryIconListLayout____lazy_storage___defaultRootListLayout))
  {
    v2 = *(id *)(v0
               + OBJC_IVAR____TtC23ControlCenterUIServices29ControlsGalleryIconListLayout____lazy_storage___defaultRootListLayout);
LABEL_5:
    swift_unknownObjectRetain();
    return v2;
  }
  v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEB08C0]), sel_initWithScreenType_, SBHScreenTypeForCurrentDevice());
  result = objc_msgSend(v3, sel_layoutForIconLocation_, *MEMORY[0x24BEB09F0]);
  if (result)
  {
    v2 = result;

    *(_QWORD *)(v0 + v1) = v2;
    swift_unknownObjectRetain();
    swift_unknownObjectRelease();
    goto LABEL_5;
  }
  __break(1u);
  return result;
}

id sub_2384F8370()
{
  return sub_2384F837C(type metadata accessor for ControlsGalleryIconListLayout);
}

id sub_2384F837C(uint64_t (*a1)(void))
{
  void *v1;
  objc_super v3;

  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

uint64_t type metadata accessor for ControlsGalleryIconListLayout()
{
  return objc_opt_self();
}

uint64_t sub_2384F8404(uint64_t a1)
{
  uint64_t *v1;
  uint64_t *v2;
  unint64_t v4;
  char v5;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;

  v2 = v1;
  swift_bridgeObjectRetain();
  v4 = sub_238504160(a1);
  LOBYTE(a1) = v5;
  swift_bridgeObjectRelease();
  if ((a1 & 1) == 0)
    return 0;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v7 = *v2;
  v10 = *v2;
  *v2 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_2384F8FF0();
    v7 = v10;
  }

  v8 = *(_QWORD *)(*(_QWORD *)(v7 + 56) + 8 * v4);
  sub_2384F8B00(v4, v7);
  *v2 = v7;
  swift_bridgeObjectRelease();
  return v8;
}

uint64_t sub_2384F84C8(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t result;
  int64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  _QWORD *v18;
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  _QWORD *v22;
  unint64_t v23;
  int64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t *v35;
  int64_t v36;
  uint64_t v37;
  char v38;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_256916530);
  v38 = a2;
  v6 = sub_238506DD0();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_40;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v37 = v5 + 64;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v35 = v2;
  v36 = (unint64_t)(v8 + 63) >> 6;
  v11 = v6 + 64;
  result = swift_retain();
  v13 = 0;
  while (1)
  {
    if (v10)
    {
      v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v20 = v19 | (v13 << 6);
      goto LABEL_31;
    }
    v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v21 >= v36)
      break;
    v22 = (_QWORD *)(v5 + 64);
    v23 = *(_QWORD *)(v37 + 8 * v21);
    ++v13;
    if (!v23)
    {
      v13 = v21 + 1;
      if (v21 + 1 >= v36)
        goto LABEL_33;
      v23 = *(_QWORD *)(v37 + 8 * v13);
      if (!v23)
      {
        v24 = v21 + 2;
        if (v24 >= v36)
        {
LABEL_33:
          swift_release();
          v3 = v35;
          if ((v38 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v23 = *(_QWORD *)(v37 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            v13 = v24 + 1;
            if (__OFADD__(v24, 1))
              goto LABEL_42;
            if (v13 >= v36)
              goto LABEL_33;
            v23 = *(_QWORD *)(v37 + 8 * v13);
            ++v24;
            if (v23)
              goto LABEL_30;
          }
        }
        v13 = v24;
      }
    }
LABEL_30:
    v10 = (v23 - 1) & v23;
    v20 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_31:
    v29 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v20);
    v31 = *v29;
    v30 = v29[1];
    v32 = *(void **)(*(_QWORD *)(v5 + 56) + 8 * v20);
    if ((v38 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      v33 = v32;
    }
    sub_238506E30();
    sub_238506B78();
    result = sub_238506E48();
    v14 = -1 << *(_BYTE *)(v7 + 32);
    v15 = result & ~v14;
    v16 = v15 >> 6;
    if (((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      v17 = __clz(__rbit64((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v25 = 0;
      v26 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        v27 = v16 == v26;
        if (v16 == v26)
          v16 = 0;
        v25 |= v27;
        v28 = *(_QWORD *)(v11 + 8 * v16);
      }
      while (v28 == -1);
      v17 = __clz(__rbit64(~v28)) + (v16 << 6);
    }
    *(_QWORD *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    v18 = (_QWORD *)(*(_QWORD *)(v7 + 48) + 16 * v17);
    *v18 = v31;
    v18[1] = v30;
    *(_QWORD *)(*(_QWORD *)(v7 + 56) + 8 * v17) = v32;
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v3 = v35;
  v22 = (_QWORD *)(v5 + 64);
  if ((v38 & 1) == 0)
    goto LABEL_40;
LABEL_36:
  v34 = 1 << *(_BYTE *)(v5 + 32);
  if (v34 >= 64)
    bzero(v22, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v22 = -1 << v34;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_40:
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_2384F87D4(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t result;
  int64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  int64_t v22;
  _QWORD *v23;
  unint64_t v24;
  int64_t v25;
  char v26;
  unint64_t v27;
  BOOL v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  uint64_t v35;
  uint64_t *v36;
  int64_t v37;
  uint64_t v38;
  char v39;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256916510);
  v39 = a2;
  v6 = sub_238506DD0();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_40;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v38 = v5 + 64;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v36 = v2;
  v37 = (unint64_t)(v8 + 63) >> 6;
  v11 = v6 + 64;
  result = swift_retain();
  v13 = 0;
  while (1)
  {
    if (v10)
    {
      v20 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v21 = v20 | (v13 << 6);
      goto LABEL_31;
    }
    v22 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v22 >= v37)
      break;
    v23 = (_QWORD *)(v5 + 64);
    v24 = *(_QWORD *)(v38 + 8 * v22);
    ++v13;
    if (!v24)
    {
      v13 = v22 + 1;
      if (v22 + 1 >= v37)
        goto LABEL_33;
      v24 = *(_QWORD *)(v38 + 8 * v13);
      if (!v24)
      {
        v25 = v22 + 2;
        if (v25 >= v37)
        {
LABEL_33:
          swift_release();
          v3 = v36;
          if ((v39 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v24 = *(_QWORD *)(v38 + 8 * v25);
        if (!v24)
        {
          while (1)
          {
            v13 = v25 + 1;
            if (__OFADD__(v25, 1))
              goto LABEL_42;
            if (v13 >= v37)
              goto LABEL_33;
            v24 = *(_QWORD *)(v38 + 8 * v13);
            ++v25;
            if (v24)
              goto LABEL_30;
          }
        }
        v13 = v25;
      }
    }
LABEL_30:
    v10 = (v24 - 1) & v24;
    v21 = __clz(__rbit64(v24)) + (v13 << 6);
LABEL_31:
    v30 = 8 * v21;
    v31 = *(void **)(*(_QWORD *)(v5 + 48) + v30);
    v32 = *(void **)(*(_QWORD *)(v5 + 56) + v30);
    if ((v39 & 1) == 0)
    {
      v33 = v31;
      v34 = v32;
    }
    sub_238506B6C();
    sub_238506E30();
    sub_238506B78();
    v14 = sub_238506E48();
    result = swift_bridgeObjectRelease();
    v15 = -1 << *(_BYTE *)(v7 + 32);
    v16 = v14 & ~v15;
    v17 = v16 >> 6;
    if (((-1 << v16) & ~*(_QWORD *)(v11 + 8 * (v16 >> 6))) != 0)
    {
      v18 = __clz(__rbit64((-1 << v16) & ~*(_QWORD *)(v11 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v26 = 0;
      v27 = (unint64_t)(63 - v15) >> 6;
      do
      {
        if (++v17 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        v28 = v17 == v27;
        if (v17 == v27)
          v17 = 0;
        v26 |= v28;
        v29 = *(_QWORD *)(v11 + 8 * v17);
      }
      while (v29 == -1);
      v18 = __clz(__rbit64(~v29)) + (v17 << 6);
    }
    *(_QWORD *)(v11 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    v19 = 8 * v18;
    *(_QWORD *)(*(_QWORD *)(v7 + 48) + v19) = v31;
    *(_QWORD *)(*(_QWORD *)(v7 + 56) + v19) = v32;
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v3 = v36;
  v23 = (_QWORD *)(v5 + 64);
  if ((v39 & 1) == 0)
    goto LABEL_40;
LABEL_36:
  v35 = 1 << *(_BYTE *)(v5 + 32);
  if (v35 >= 64)
    bzero(v23, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v23 = -1 << v35;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_40:
  result = swift_release();
  *v3 = v7;
  return result;
}

unint64_t sub_2384F8B00(unint64_t result, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;

  v3 = result;
  v4 = a2 + 64;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    result = sub_238506CF8();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      do
      {
        v9 = *(void **)(*(_QWORD *)(a2 + 48) + 8 * v6);
        sub_238506B6C();
        sub_238506E30();
        v10 = v9;
        sub_238506B78();
        v11 = sub_238506E48();

        result = swift_bridgeObjectRelease();
        v12 = v11 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v12 < v8)
            goto LABEL_5;
        }
        else if (v12 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v12)
        {
LABEL_11:
          v13 = *(_QWORD *)(a2 + 48);
          v14 = (_QWORD *)(v13 + 8 * v3);
          v15 = (_QWORD *)(v13 + 8 * v6);
          if (v3 != v6 || v14 >= v15 + 1)
            *v14 = *v15;
          v16 = *(_QWORD *)(a2 + 56);
          v17 = (_QWORD *)(v16 + 8 * v3);
          v18 = (_QWORD *)(v16 + 8 * v6);
          if (v3 != v6 || (v3 = v6, v17 >= v18 + 1))
          {
            *v17 = *v18;
            v3 = v6;
          }
        }
LABEL_5:
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    v19 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v20 = *v19;
    v21 = (-1 << v3) - 1;
  }
  else
  {
    v19 = (uint64_t *)(v4 + 8 * (result >> 6));
    v21 = *v19;
    v20 = (-1 << result) - 1;
  }
  *v19 = v21 & v20;
  v22 = *(_QWORD *)(a2 + 16);
  v23 = __OFSUB__(v22, 1);
  v24 = v22 - 1;
  if (v23)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v24;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

void sub_2384F8CF0(uint64_t a1, void *a2, char a3)
{
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v7;
  char v8;
  unint64_t v9;
  uint64_t v10;
  _BOOL8 v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  unint64_t v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  BOOL v21;
  uint64_t v22;
  id v23;

  v4 = v3;
  v7 = *v3;
  v9 = sub_238504160((uint64_t)a2);
  v10 = *(_QWORD *)(v7 + 16);
  v11 = (v8 & 1) == 0;
  v12 = v10 + v11;
  if (__OFADD__(v10, v11))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v13 = v8;
  v14 = *(_QWORD *)(v7 + 24);
  if (v14 >= v12 && (a3 & 1) != 0)
    goto LABEL_7;
  if (v14 >= v12 && (a3 & 1) == 0)
  {
    sub_2384F8FF0();
LABEL_7:
    v15 = (_QWORD *)*v4;
    if ((v13 & 1) != 0)
    {
LABEL_8:
      v16 = v15[7];

      *(_QWORD *)(v16 + 8 * v9) = a1;
      return;
    }
LABEL_11:
    v15[(v9 >> 6) + 8] |= 1 << v9;
    v19 = 8 * v9;
    *(_QWORD *)(v15[6] + v19) = a2;
    *(_QWORD *)(v15[7] + v19) = a1;
    v20 = v15[2];
    v21 = __OFADD__(v20, 1);
    v22 = v20 + 1;
    if (!v21)
    {
      v15[2] = v22;
      v23 = a2;
      return;
    }
    goto LABEL_14;
  }
  sub_2384F87D4(v12, a3 & 1);
  v17 = sub_238504160((uint64_t)a2);
  if ((v13 & 1) == (v18 & 1))
  {
    v9 = v17;
    v15 = (_QWORD *)*v4;
    if ((v13 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  type metadata accessor for SBHIconGridSizeClass(0);
  sub_238506E24();
  __break(1u);
}

id sub_2384F8E40()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  _QWORD *v21;
  int64_t v22;
  unint64_t v23;
  int64_t v24;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_256916530);
  v2 = *v0;
  v3 = sub_238506DC4();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (id)swift_release();
    *v1 = v4;
    return result;
  }
  result = (id)(v3 + 64);
  v6 = v2 + 64;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 64);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v22 >= v13)
      goto LABEL_26;
    v23 = *(_QWORD *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      v9 = v22 + 1;
      if (v22 + 1 >= v13)
        goto LABEL_26;
      v23 = *(_QWORD *)(v6 + 8 * v9);
      if (!v23)
        break;
    }
LABEL_25:
    v12 = (v23 - 1) & v23;
    v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (_QWORD *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v18 = v17[1];
    v19 = 8 * v15;
    v20 = *(void **)(*(_QWORD *)(v2 + 56) + v19);
    v21 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v21 = *v17;
    v21[1] = v18;
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    result = v20;
  }
  v24 = v22 + 2;
  if (v24 >= v13)
    goto LABEL_26;
  v23 = *(_QWORD *)(v6 + 8 * v24);
  if (v23)
  {
    v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v24 + 1;
    if (__OFADD__(v24, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v23 = *(_QWORD *)(v6 + 8 * v9);
    ++v24;
    if (v23)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

id sub_2384F8FF0()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256916510);
  v2 = *v0;
  v3 = sub_238506DC4();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (id)swift_release();
    *v1 = v4;
    return result;
  }
  result = (id)(v3 + 64);
  v6 = v2 + 64;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 64);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v20 >= v13)
      goto LABEL_26;
    v21 = *(_QWORD *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      v9 = v20 + 1;
      if (v20 + 1 >= v13)
        goto LABEL_26;
      v21 = *(_QWORD *)(v6 + 8 * v9);
      if (!v21)
        break;
    }
LABEL_25:
    v12 = (v21 - 1) & v21;
    v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    v16 = 8 * v15;
    v17 = *(void **)(*(_QWORD *)(v2 + 48) + v16);
    v18 = *(void **)(*(_QWORD *)(v2 + 56) + v16);
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + v16) = v17;
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v16) = v18;
    v19 = v17;
    result = v18;
  }
  v22 = v20 + 2;
  if (v22 >= v13)
    goto LABEL_26;
  v21 = *(_QWORD *)(v6 + 8 * v22);
  if (v21)
  {
    v9 = v22;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v22 + 1;
    if (__OFADD__(v22, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v21 = *(_QWORD *)(v6 + 8 * v9);
    ++v22;
    if (v21)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

id sub_2384F9194(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  id v5;
  id v6;
  _QWORD *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v13[6];

  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = MEMORY[0x24BEE4B00];
  v5 = objc_msgSend((id)objc_opt_self(), sel_controlCenterDomain);
  v6 = objc_msgSend(v5, sel_allNonDefaultGridSizeClasses);

  v7 = (_QWORD *)swift_allocObject();
  v7[2] = a1;
  v7[3] = a2;
  v7[4] = v4;
  v13[4] = sub_2384F93D0;
  v13[5] = v7;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 1107296256;
  v13[2] = sub_2384F7CB4;
  v13[3] = &block_descriptor_0;
  v8 = _Block_copy(v13);
  swift_retain();
  swift_retain();
  swift_release();
  objc_msgSend(v6, sel_enumerateGridSizeClassesUsingBlock_, v8);
  _Block_release(v8);

  swift_beginAccess();
  v9 = objc_allocWithZone(MEMORY[0x24BEB08E0]);
  type metadata accessor for SBHIconGridSizeClass(0);
  sub_2384F93F4();
  sub_2384F30B0(&qword_256915E50, (uint64_t (*)(uint64_t))type metadata accessor for SBHIconGridSizeClass, (uint64_t)&unk_2385082EC);
  swift_bridgeObjectRetain();
  v10 = (void *)sub_238506B0C();
  swift_bridgeObjectRelease();
  v11 = objc_msgSend(v9, sel_initWithGridSizeClassSizes_, v10);
  swift_release();

  return v11;
}

uint64_t sub_2384F9380()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_2384F93A4()
{
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2384F93D0(void *a1, uint64_t a2)
{
  uint64_t v2;

  return sub_2384F7B90(a1, a2, *(uint64_t (**)(_QWORD))(v2 + 16), *(_QWORD *)(v2 + 24), *(_QWORD *)(v2 + 32));
}

uint64_t block_copy_helper_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

unint64_t sub_2384F93F4()
{
  unint64_t result;

  result = qword_256916500;
  if (!qword_256916500)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_256916500);
  }
  return result;
}

void sub_2384F9430()
{
  id v0;
  void *v1;
  id v2;

  v0 = objc_allocWithZone(MEMORY[0x24BDD17C8]);
  v1 = (void *)sub_238506B48();
  v2 = objc_msgSend(v0, sel_initWithString_, v1);

  qword_256917578 = (uint64_t)v2;
}

void *CHSWidgetExtensionProvider.controlDescriptor(for:)(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  void (*v12)(char *, uint64_t, uint64_t, uint64_t);
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  NSObject *v22;
  NSObject *v23;
  os_log_type_t v24;
  uint64_t v25;
  uint8_t *v26;
  NSObject *v27;
  _QWORD *v28;
  uint8_t *v29;
  id v30;
  uint64_t v31;
  char *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  unint64_t v37;
  void *v38;
  uint64_t v40;
  _QWORD *v41;
  void *v42;
  uint64_t v43;
  NSObject *v44;

  v2 = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2542CEBA0);
  MEMORY[0x24BDAC7A8](v4);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542CEB88);
  v6 = MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v40 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v40 - v9;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542CEB80);
  v12 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56);
  v12(v10, 1, 1, v11);
  v13 = objc_msgSend(a1, sel_containerBundleIdentifier);
  if (v13)
  {
    v14 = v13;
    sub_238506B6C();

    sub_238506AB8();
    sub_2384FB04C((uint64_t)v10);
    v12(v8, 0, 1, v11);
    sub_2384FB1B4((uint64_t)v8, (uint64_t)v10);
  }
  sub_238506C5C();
  v15 = objc_msgSend(a1, sel_extensionBundleIdentifier);
  sub_238506B6C();

  sub_238506AB8();
  sub_2384F9964((uint64_t)v10, (uint64_t)v8);
  v16 = (void *)sub_238506C50();
  v17 = objc_msgSend(a1, sel_kind);
  v18 = sub_238506B6C();
  v20 = v19;

  if (qword_256915C68 != -1)
    swift_once();
  v21 = sub_238506AE8();
  __swift_project_value_buffer(v21, (uint64_t)qword_256916398);
  v22 = v2;
  v23 = sub_238506AD0();
  v24 = sub_238506C2C();
  if (os_log_type_enabled(v23, v24))
  {
    v25 = swift_slowAlloc();
    v42 = v16;
    v26 = (uint8_t *)v25;
    v41 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v26 = 138412290;
    v43 = v18;
    v44 = v22;
    v27 = v22;
    v18 = v43;
    sub_238506CBC();
    v28 = v41;
    *v41 = v22;

    _os_log_impl(&dword_2384EE000, v23, v24, "Current widget extension provider is %@", v26, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256916540);
    swift_arrayDestroy();
    MEMORY[0x23B837810](v28, -1, -1);
    v29 = v26;
    v16 = v42;
    MEMORY[0x23B837810](v29, -1, -1);
  }
  else
  {

    v23 = v22;
  }

  v30 = -[NSObject extensions](v22, sel_extensions);
  sub_2384F5DDC(0, &qword_2542CEBB8);
  sub_2384F99AC();
  v31 = sub_238506C08();

  v32 = v16;
  sub_2384FAD3C(v31, v32);
  v34 = v33;
  swift_bridgeObjectRelease();

  if (!v34)
  {
    sub_2384FB04C((uint64_t)v10);
    swift_bridgeObjectRelease();

    return 0;
  }
  v35 = objc_msgSend(v34, sel_orderedControlDescriptors);
  if (!v35)
  {

    swift_bridgeObjectRelease();
    sub_2384FB04C((uint64_t)v10);
    return 0;
  }
  v36 = v35;
  sub_2384F5DDC(0, &qword_2542CEBC8);
  v37 = sub_238506BD8();

  swift_bridgeObjectRetain();
  v38 = sub_2384FB08C(v37, v18, v20);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease_n();
  sub_2384FB04C((uint64_t)v10);
  return v38;
}

uint64_t sub_2384F9964(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542CEB88);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_2384F99AC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2542CEBC0;
  if (!qword_2542CEBC0)
  {
    v1 = sub_2384F5DDC(255, &qword_2542CEBB8);
    result = MEMORY[0x23B8377A4](MEMORY[0x24BEE5BD8], v1);
    atomic_store(result, (unint64_t *)&qword_2542CEBC0);
  }
  return result;
}

uint64_t sub_2384F9A04(id *a1, char *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  char *v29;
  char *v30;
  _QWORD *v31;
  char *v32;
  void (*v33)(char *, char *, uint64_t);
  char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  NSObject *v38;
  os_log_type_t v39;
  int v40;
  _BOOL4 v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  void (*v47)(char *, uint64_t);
  char *v48;
  uint64_t v49;
  unint64_t v50;
  uint64_t v51;
  uint64_t v52;
  char *v53;
  id v54;
  _QWORD *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  unsigned int (*v59)(uint64_t, uint64_t, uint64_t);
  uint64_t v60;
  char *v61;
  uint64_t v62;
  uint64_t v63;
  char *v64;
  void (*v65)(char *, char *, uint64_t);
  NSObject *v66;
  os_log_type_t v67;
  int v68;
  uint64_t v69;
  uint64_t v70;
  unint64_t v71;
  void (*v72)(char *, uint64_t);
  uint64_t v73;
  unint64_t v74;
  char *v75;
  char *v76;
  char *v77;
  void (*v78)(char *, char *, uint64_t);
  char v79;
  void (*v80)(char *, char *, uint64_t);
  char v81;
  uint64_t v82;
  uint64_t v84;
  char *v85;
  int v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  id v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  char *v94;
  uint64_t v95;
  char *v96;
  char *v97;
  char *v98;
  char *v99;
  char *v100;
  char *v101;
  char *v102;
  char *v103;
  uint64_t v104;
  uint64_t v105;
  char *v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109[3];
  uint64_t v110;

  v99 = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2542CEB88);
  v3 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v93 = (uint64_t)&v84 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v92 = (uint64_t)&v84 - v5;
  v88 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542CEB80);
  v95 = *(_QWORD *)(v88 - 8);
  v6 = MEMORY[0x24BDAC7A8](v88);
  v98 = (char *)&v84 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v97 = (char *)&v84 - v9;
  v10 = MEMORY[0x24BDAC7A8](v8);
  v96 = (char *)&v84 - v11;
  v12 = MEMORY[0x24BDAC7A8](v10);
  v94 = (char *)&v84 - v13;
  v14 = MEMORY[0x24BDAC7A8](v12);
  v103 = (char *)&v84 - v15;
  MEMORY[0x24BDAC7A8](v14);
  v102 = (char *)&v84 - v16;
  v17 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2542CEBA0);
  v18 = *(_QWORD *)(v17 - 8);
  v19 = MEMORY[0x24BDAC7A8](v17);
  v21 = (char *)&v84 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = MEMORY[0x24BDAC7A8](v19);
  v24 = (char *)&v84 - v23;
  v25 = MEMORY[0x24BDAC7A8](v22);
  v27 = (char *)&v84 - v26;
  MEMORY[0x24BDAC7A8](v25);
  v29 = (char *)&v84 - v28;
  v90 = *a1;
  v30 = (char *)objc_msgSend(v90, sel_identity);
  v31 = (_QWORD *)MEMORY[0x24BE16910];
  v32 = &v30[*MEMORY[0x24BE16910]];
  swift_beginAccess();
  v89 = v18;
  v33 = *(void (**)(char *, char *, uint64_t))(v18 + 16);
  v33(v29, v32, v17);

  v34 = &v99[*v31];
  swift_beginAccess();
  v110 = v17;
  v33(v27, v34, v17);
  if (qword_256915C68 != -1)
    swift_once();
  v35 = sub_238506AE8();
  v36 = __swift_project_value_buffer(v35, (uint64_t)qword_256916398);
  v100 = v29;
  v37 = v110;
  v33(v24, v29, v110);
  v33(v21, v27, v37);
  v91 = v36;
  v38 = sub_238506AD0();
  v39 = sub_238506C2C();
  v40 = v39;
  v41 = os_log_type_enabled(v38, v39);
  v42 = v21;
  v101 = v27;
  if (v41)
  {
    v43 = swift_slowAlloc();
    v87 = swift_slowAlloc();
    v109[0] = v87;
    *(_DWORD *)v43 = 136315394;
    v44 = v110;
    sub_2384FB288(&qword_256916560, (uint64_t *)&unk_2542CEBA0, MEMORY[0x24BE168B8]);
    v85 = v42;
    v86 = v40;
    v45 = sub_238506E00();
    v108 = sub_2384FA6FC(v45, v46, v109);
    sub_238506CBC();
    swift_bridgeObjectRelease();
    v47 = *(void (**)(char *, uint64_t))(v89 + 8);
    v47(v24, v44);
    *(_WORD *)(v43 + 12) = 2080;
    v48 = v85;
    v49 = sub_238506E00();
    v108 = sub_2384FA6FC(v49, v50, v109);
    sub_238506CBC();
    swift_bridgeObjectRelease();
    v47(v48, v44);
    _os_log_impl(&dword_2384EE000, v38, (os_log_type_t)v86, "Comparing fetched extension bundle identifier %s with my extension bundle identifier %s", (uint8_t *)v43, 0x16u);
    v51 = v87;
    swift_arrayDestroy();
    MEMORY[0x23B837810](v51, -1, -1);
    MEMORY[0x23B837810](v43, -1, -1);
  }
  else
  {
    v47 = *(void (**)(char *, uint64_t))(v89 + 8);
    v52 = v110;
    v47(v24, v110);
    v47(v21, v52);
  }

  v53 = v94;
  v54 = objc_msgSend(v90, sel_identity);
  v55 = (_QWORD *)MEMORY[0x24BE16900];
  v56 = (uint64_t)v54 + *MEMORY[0x24BE16900];
  swift_beginAccess();
  v57 = v92;
  sub_2384F9964(v56, v92);

  v58 = v95;
  v59 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v95 + 48);
  v60 = v88;
  if (v59(v57, 1, v88) == 1)
  {
    sub_238506AAC();
    sub_2384FB04C(v57);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v58 + 32))(v102, v57, v60);
  }
  v61 = &v99[*v55];
  swift_beginAccess();
  v62 = (uint64_t)v61;
  v63 = v93;
  sub_2384F9964(v62, v93);
  if (v59(v63, 1, v60) == 1)
  {
    sub_238506AAC();
    sub_2384FB04C(v63);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v58 + 32))(v103, v63, v60);
  }
  v64 = v96;
  v65 = *(void (**)(char *, char *, uint64_t))(v58 + 16);
  v65(v53, v102, v60);
  v99 = (char *)v65;
  v65(v64, v103, v60);
  v66 = sub_238506AD0();
  v67 = sub_238506C2C();
  v68 = v67;
  if (os_log_type_enabled(v66, v67))
  {
    v69 = swift_slowAlloc();
    v94 = (char *)swift_slowAlloc();
    v106 = v94;
    *(_DWORD *)v69 = 136315394;
    v92 = v69 + 4;
    sub_2384FB288(&qword_256916558, &qword_2542CEB80, MEMORY[0x24BE168B8]);
    LODWORD(v93) = v68;
    v70 = sub_238506E00();
    v104 = sub_2384FA6FC(v70, v71, (uint64_t *)&v106);
    v96 = (char *)v47;
    sub_238506CBC();
    swift_bridgeObjectRelease();
    v72 = *(void (**)(char *, uint64_t))(v58 + 8);
    v72(v53, v60);
    *(_WORD *)(v69 + 12) = 2080;
    v73 = sub_238506E00();
    v104 = sub_2384FA6FC(v73, v74, (uint64_t *)&v106);
    v47 = (void (*)(char *, uint64_t))v96;
    sub_238506CBC();
    swift_bridgeObjectRelease();
    v72(v64, v60);
    _os_log_impl(&dword_2384EE000, v66, (os_log_type_t)v93, "Comparing fetched container bundle identifier %s with my container bundle identifier %s", (uint8_t *)v69, 0x16u);
    v75 = v94;
    swift_arrayDestroy();
    MEMORY[0x23B837810](v75, -1, -1);
    MEMORY[0x23B837810](v69, -1, -1);
  }
  else
  {
    v72 = *(void (**)(char *, uint64_t))(v58 + 8);
    v72(v53, v60);
    v72(v64, v60);
  }

  v76 = v98;
  v77 = v97;
  sub_2384FB288((unint64_t *)&unk_2542CEB90, (uint64_t *)&unk_2542CEBA0, MEMORY[0x24BE168B0]);
  sub_238506BB4();
  sub_238506BB4();
  if (v106 == (char *)v104 && v107 == v105)
  {
    swift_bridgeObjectRelease_n();
    v78 = (void (*)(char *, char *, uint64_t))v99;
    ((void (*)(char *, char *, uint64_t))v99)(v77, v102, v60);
    v78(v76, v103, v60);
  }
  else
  {
    v79 = sub_238506E18();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v80 = (void (*)(char *, char *, uint64_t))v99;
    ((void (*)(char *, char *, uint64_t))v99)(v77, v102, v60);
    v80(v76, v103, v60);
    v81 = 0;
    if ((v79 & 1) == 0)
      goto LABEL_24;
  }
  sub_2384FB288(&qword_256916550, &qword_2542CEB80, MEMORY[0x24BE168B0]);
  sub_238506BB4();
  sub_238506BB4();
  if (v106 == (char *)v104 && v107 == v105)
    v81 = 1;
  else
    v81 = sub_238506E18();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
LABEL_24:
  v72(v76, v60);
  v72(v77, v60);
  v72(v103, v60);
  v72(v102, v60);
  v82 = v110;
  v47(v101, v110);
  v47(v100, v82);
  return v81 & 1;
}

uint64_t sub_2384FA468(id *a1, uint64_t a2, unint64_t a3)
{
  id v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t v16;

  v5 = objc_msgSend(*a1, sel_kind);
  v6 = sub_238506B6C();
  v8 = v7;

  if (qword_256915C68 != -1)
    swift_once();
  v9 = sub_238506AE8();
  __swift_project_value_buffer(v9, (uint64_t)qword_256916398);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  v10 = sub_238506AD0();
  v11 = sub_238506C2C();
  if (os_log_type_enabled(v10, v11))
  {
    v12 = swift_slowAlloc();
    v13 = swift_slowAlloc();
    v16 = v13;
    *(_DWORD *)v12 = 136315394;
    swift_bridgeObjectRetain();
    sub_2384FA6FC(v6, v8, &v16);
    sub_238506CBC();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v12 + 12) = 2080;
    swift_bridgeObjectRetain();
    sub_2384FA6FC(a2, a3, &v16);
    sub_238506CBC();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_2384EE000, v10, v11, "Comparing fetched kind %s with my kind %s", (uint8_t *)v12, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x23B837810](v13, -1, -1);
    MEMORY[0x23B837810](v12, -1, -1);

    if (v6 != a2)
      goto LABEL_9;
  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    if (v6 != a2)
    {
LABEL_9:
      v14 = sub_238506E18();
      goto LABEL_10;
    }
  }
  if (v8 != a3)
    goto LABEL_9;
  v14 = 1;
LABEL_10:
  swift_bridgeObjectRelease();
  return v14 & 1;
}

uint64_t sub_2384FA6FC(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_2384FA7CC(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_2384FB1FC((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = MEMORY[0x24BEE2520];
    v12[0] = a1;
    v12[1] = a2;
    v10 = *a3;
    if (*a3)
    {
      sub_2384FB1FC((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_2384FA7CC(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  uint64_t v8;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  _QWORD __src[2];

  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        v11 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v11)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (_QWORD *)&__dst[v11] || (char *)__src + v11 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            sub_238506CC8();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_2384FA984(a5, a6);
    *a1 = v12;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0)
    goto LABEL_13;
  if ((a5 & 0x1000000000000000) != 0)
  {
    v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  v8 = sub_238506D4C();
  if (!v8)
  {
    sub_238506DA0();
    __break(1u);
LABEL_17:
    result = sub_238506DE8();
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0)
    return 0;
  else
    return swift_unknownObjectRetain();
}

uint64_t sub_2384FA984(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_2384FAA18(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_2384FABF0(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_2384FABF0(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_2384FAA18(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  char v6;
  uint64_t result;

  if ((a2 & 0x1000000000000000) != 0)
    goto LABEL_10;
  if ((a2 & 0x2000000000000000) != 0)
    v2 = HIBYTE(a2) & 0xF;
  else
    v2 = a1 & 0xFFFFFFFFFFFFLL;
  if (v2)
  {
    while (1)
    {
      v3 = sub_2384FAB8C(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_238506D28();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_238506DA0();
      __break(1u);
LABEL_10:
      v2 = sub_238506B9C();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_238506DE8();
    __break(1u);
LABEL_14:
    result = sub_238506DA0();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_2384FAB8C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  size_t v5;

  if (a2 <= a1)
    v2 = a1;
  else
    v2 = a2;
  if (!v2)
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_256916548);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_2384FABF0(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_256916548);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v12 = v10 + 32;
  v13 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v12 >= &v13[v8])
      memmove(v12, v13, v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v8] || v12 >= &v13[v8])
  {
    memcpy(v12, v13, v8);
LABEL_28:
    swift_bridgeObjectRelease();
    return (uint64_t)v10;
  }
LABEL_30:
  result = sub_238506DE8();
  __break(1u);
  return result;
}

void sub_2384FAD3C(uint64_t a1, char *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  int64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  int64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  int64_t v18;
  char v19;
  int64_t v20;
  int64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  int64_t v26;
  unint64_t v27;
  id v28;

  v3 = v2;
  v5 = a1;
  if ((a1 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    sub_238506D04();
    sub_2384F5DDC(0, &qword_2542CEBB8);
    sub_2384F99AC();
    sub_238506C14();
    v5 = v23;
    v22 = v24;
    v6 = v25;
    v7 = v26;
    v8 = v27;
  }
  else
  {
    v9 = -1 << *(_BYTE *)(a1 + 32);
    v22 = a1 + 56;
    v10 = ~v9;
    v11 = -v9;
    if (v11 < 64)
      v12 = ~(-1 << v11);
    else
      v12 = -1;
    v8 = v12 & *(_QWORD *)(a1 + 56);
    swift_bridgeObjectRetain();
    v6 = v10;
    v7 = 0;
  }
  v21 = (unint64_t)(v6 + 64) >> 6;
  if ((v5 & 0x8000000000000000) == 0)
    goto LABEL_11;
LABEL_8:
  if (!sub_238506D10())
    goto LABEL_36;
  sub_2384F5DDC(0, &qword_2542CEBB8);
  swift_unknownObjectRetain();
  swift_dynamicCast();
  v13 = v28;
  swift_unknownObjectRelease();
  v14 = v7;
  v15 = v8;
  if (!v13)
    goto LABEL_36;
  while (1)
  {
    v28 = v13;
    v19 = sub_2384F9A04(&v28, a2);
    if (v3)
    {

      goto LABEL_36;
    }
    if ((v19 & 1) != 0)
      goto LABEL_36;

    v7 = v14;
    v8 = v15;
    if (v5 < 0)
      goto LABEL_8;
LABEL_11:
    if (!v8)
      break;
    v15 = (v8 - 1) & v8;
    v16 = __clz(__rbit64(v8)) | (v7 << 6);
    v14 = v7;
LABEL_24:
    v13 = *(id *)(*(_QWORD *)(v5 + 48) + 8 * v16);
    if (!v13)
      goto LABEL_36;
  }
  v14 = v7 + 1;
  if (__OFADD__(v7, 1))
  {
    __break(1u);
    return;
  }
  if (v14 >= v21)
    goto LABEL_36;
  v17 = *(_QWORD *)(v22 + 8 * v14);
  if (v17)
  {
LABEL_23:
    v15 = (v17 - 1) & v17;
    v16 = __clz(__rbit64(v17)) + (v14 << 6);
    goto LABEL_24;
  }
  v18 = v7 + 2;
  if (v7 + 2 >= v21)
    goto LABEL_36;
  v17 = *(_QWORD *)(v22 + 8 * v18);
  if (v17)
    goto LABEL_22;
  v18 = v7 + 3;
  if (v7 + 3 >= v21)
    goto LABEL_36;
  v17 = *(_QWORD *)(v22 + 8 * v18);
  if (v17)
    goto LABEL_22;
  v18 = v7 + 4;
  if (v7 + 4 >= v21)
    goto LABEL_36;
  v17 = *(_QWORD *)(v22 + 8 * v18);
  if (v17)
  {
LABEL_22:
    v14 = v18;
    goto LABEL_23;
  }
  v14 = v7 + 5;
  if (v7 + 5 >= v21)
    goto LABEL_36;
  v17 = *(_QWORD *)(v22 + 8 * v14);
  if (v17)
    goto LABEL_23;
  v20 = v7 + 6;
  while (v21 != v20)
  {
    v17 = *(_QWORD *)(v22 + 8 * v20++);
    if (v17)
    {
      v14 = v20 - 1;
      goto LABEL_23;
    }
  }
LABEL_36:
  sub_2384FB23C();
}

uint64_t sub_2384FB04C(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542CEB88);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void *sub_2384FB08C(unint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  uint64_t v11;
  char v12;
  id v14;

  if (a1 >> 62)
    goto LABEL_16;
  v7 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v7; v7 = sub_238506DB8())
  {
    v8 = 4;
    while (1)
    {
      v9 = (a1 & 0xC000000000000001) != 0 ? (id)MEMORY[0x23B8372A0](v8 - 4, a1) : *(id *)(a1 + 8 * v8);
      v10 = v9;
      v11 = v8 - 3;
      if (__OFADD__(v8 - 4, 1))
        break;
      v14 = v9;
      v12 = sub_2384FA468(&v14, a2, a3);
      if (v3)
      {
        swift_bridgeObjectRelease();

        return v10;
      }
      if ((v12 & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return v10;
      }

      ++v8;
      if (v11 == v7)
        goto LABEL_11;
    }
    __break(1u);
LABEL_16:
    swift_bridgeObjectRetain();
  }
LABEL_11:
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t sub_2384FB1B4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542CEB88);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_2384FB1FC(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_2384FB23C()
{
  return swift_release();
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x23B837798](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_2384FB288(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x23B8377A4](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

void __swiftcall CCUISControlsGalleryConfiguration.init()(CCUISControlsGalleryConfiguration *__return_ptr retstr)
{
  objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
}

id sub_2384FB340(uint64_t a1, uint64_t a2, _QWORD *a3, unint64_t *a4)
{
  void *v4;

  if (*(_QWORD *)(a1 + *a3))
  {
    sub_2384F5DDC(0, a4);
    swift_bridgeObjectRetain();
    v4 = (void *)sub_238506BCC();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

uint64_t sub_2384FB3BC(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t *a4, uint64_t a5, _QWORD *a6)
{
  uint64_t v8;

  if (a3)
  {
    sub_2384F5DDC(0, a4);
    v8 = sub_238506BD8();
  }
  else
  {
    v8 = 0;
  }
  *(_QWORD *)(a1 + *a6) = v8;
  return swift_bridgeObjectRelease();
}

id sub_2384FB434(uint64_t a1, uint64_t a2, _QWORD *a3, void (*a4)(_QWORD))
{
  void *v4;

  if (*(_QWORD *)(a1 + *a3))
  {
    a4(0);
    swift_bridgeObjectRetain();
    v4 = (void *)sub_238506BCC();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

uint64_t sub_2384FB4A0(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(_QWORD), _QWORD *a5)
{
  uint64_t v7;

  if (a3)
  {
    a4(0);
    v7 = sub_238506BD8();
  }
  else
  {
    v7 = 0;
  }
  *(_QWORD *)(a1 + *a5) = v7;
  return swift_bridgeObjectRelease();
}

uint64_t sub_2384FB524@<X0>(_QWORD *a1@<X8>)
{
  void *v1;
  void *v2;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t result;

  v2 = v1;
  v4 = objc_msgSend(objc_allocWithZone((Class)CCUISControlsGalleryConfiguration), sel_init);
  v5 = objc_msgSend(v2, sel_allowedControlSizes);
  objc_msgSend(v4, sel_setAllowedControlSizes_, v5);

  v6 = objc_msgSend(v2, sel_disallowedExtensionIdentities);
  objc_msgSend(v4, sel_setDisallowedExtensionIdentities_, v6);

  v7 = objc_msgSend(v2, sel_disallowedControlIdentities);
  objc_msgSend(v4, sel_setDisallowedControlIdentities_, v7);

  v8 = objc_msgSend(v2, sel_suggestedControls);
  objc_msgSend(v4, sel_setSuggestedControls_, v8);

  result = type metadata accessor for CCUISControlsGalleryConfiguration(v9);
  a1[3] = result;
  *a1 = v4;
  return result;
}

id CCUISControlsGalleryConfiguration.init()()
{
  uint64_t v0;
  objc_super v2;

  *(_QWORD *)(v0 + OBJC_IVAR___CCUISControlsGalleryConfiguration___allowedControlSizes) = 0;
  *(_QWORD *)(v0 + OBJC_IVAR___CCUISControlsGalleryConfiguration_disallowedControlIdentities) = 0;
  *(_QWORD *)(v0 + OBJC_IVAR___CCUISControlsGalleryConfiguration_disallowedExtensionIdentities) = 0;
  *(_QWORD *)(v0 + OBJC_IVAR___CCUISControlsGalleryConfiguration_suggestedControls) = 0;
  v2.super_class = (Class)CCUISControlsGalleryConfiguration;
  return objc_msgSendSuper2(&v2, sel_init);
}

uint64_t CCUISControlsGalleryConfiguration.allowedControlSizes.getter()
{
  void *v0;
  id v1;
  void *v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t result;
  uint64_t v6;
  _QWORD *v7;
  id v8;
  void *v9;
  id v10;
  unint64_t v11;
  unint64_t v12;

  v1 = objc_msgSend(v0, sel_allowedControlSizes);
  if (!v1)
    return 0;
  v2 = v1;
  sub_2384F5DDC(0, &qword_256916588);
  v3 = sub_238506BD8();

  if (!(v3 >> 62))
  {
    v4 = *(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain();
    if (v4)
      goto LABEL_4;
LABEL_17:
    v7 = (_QWORD *)MEMORY[0x24BEE4AF8];
LABEL_18:
    swift_bridgeObjectRelease_n();
    return (uint64_t)v7;
  }
  swift_bridgeObjectRetain();
  result = sub_238506DB8();
  v4 = result;
  if (!result)
    goto LABEL_17;
LABEL_4:
  if (v4 >= 1)
  {
    v6 = 0;
    v7 = (_QWORD *)MEMORY[0x24BEE4AF8];
    do
    {
      if ((v3 & 0xC000000000000001) != 0)
        v8 = (id)MEMORY[0x23B8372A0](v6, v3);
      else
        v8 = *(id *)(v3 + 8 * v6 + 32);
      v9 = v8;
      v10 = objc_msgSend(v8, sel_unsignedIntegerValue);

      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v7 = sub_2384FBC5C(0, v7[2] + 1, 1, v7);
      v12 = v7[2];
      v11 = v7[3];
      if (v12 >= v11 >> 1)
        v7 = sub_2384FBC5C((_QWORD *)(v11 > 1), v12 + 1, 1, v7);
      ++v6;
      v7[2] = v12 + 1;
      v7[v12 + 4] = v10;
    }
    while (v4 != v6);
    goto LABEL_18;
  }
  __break(1u);
  return result;
}

void CCUISControlsGalleryConfiguration.allowedControlSizes.setter(uint64_t a1)
{
  void *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  id v7;
  uint64_t v8;

  if (a1)
  {
    v3 = *(_QWORD *)(a1 + 16);
    if (v3)
    {
      v8 = MEMORY[0x24BEE4AF8];
      sub_238506D70();
      v4 = 0;
      do
      {
        v5 = v4 + 1;
        objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithUnsignedInteger_, *(_QWORD *)(a1 + 8 * v4 + 32));
        sub_238506D58();
        sub_238506D7C();
        sub_238506D88();
        sub_238506D64();
        v4 = v5;
      }
      while (v3 != v5);
    }
    swift_bridgeObjectRelease();
    sub_2384F5DDC(0, &qword_256916588);
    v7 = (id)sub_238506BCC();
    swift_bridgeObjectRelease();
    objc_msgSend(v1, sel_setAllowedControlSizes_, v7, v7, v8);
  }
  else
  {
    objc_msgSend(v1, sel_setAllowedControlSizes_, 0, 0, v8);
  }

}

void (*CCUISControlsGalleryConfiguration.allowedControlSizes.modify(uint64_t *a1))(uint64_t *a1, char a2)
{
  uint64_t v1;

  a1[1] = v1;
  *a1 = CCUISControlsGalleryConfiguration.allowedControlSizes.getter();
  return sub_2384FBAF0;
}

void sub_2384FBAF0(uint64_t *a1, char a2)
{
  uint64_t v2;

  if ((a2 & 1) != 0)
  {
    v2 = swift_bridgeObjectRetain();
    CCUISControlsGalleryConfiguration.allowedControlSizes.setter(v2);
    swift_bridgeObjectRelease();
  }
  else
  {
    CCUISControlsGalleryConfiguration.allowedControlSizes.setter(*a1);
  }
}

_QWORD *sub_2384FBB34(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  size_t v11;
  _QWORD *v12;

  v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    v7 = a2;
    goto LABEL_8;
  }
  v6 = a4[3];
  v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2)
    goto LABEL_8;
  if (v7 + 0x4000000000000000 >= 0)
  {
    v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v7 = a2;
LABEL_8:
    v8 = a4[2];
    if (v7 <= v8)
      v9 = a4[2];
    else
      v9 = v7;
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_2569165A8);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v10[2] = v8;
      v10[3] = 2 * ((uint64_t)(v11 - 32) / 72);
      v12 = v10 + 4;
      if ((v5 & 1) != 0)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[9 * v8 + 4])
          memmove(v12, a4 + 4, 72 * v8);
        a4[2] = 0;
        goto LABEL_22;
      }
    }
    else
    {
      v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
      v12 = (_QWORD *)(MEMORY[0x24BEE4AF8] + 32);
      if ((result & 1) != 0)
        goto LABEL_13;
    }
    sub_2384FBED8(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

_QWORD *sub_2384FBC5C(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  int64_t v11;
  uint64_t v12;
  _QWORD *v13;

  v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    v7 = a2;
    goto LABEL_8;
  }
  v6 = a4[3];
  v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2)
    goto LABEL_8;
  if (v7 + 0x4000000000000000 >= 0)
  {
    v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v7 = a2;
LABEL_8:
    v8 = a4[2];
    if (v7 <= v8)
      v9 = a4[2];
    else
      v9 = v7;
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_2569165A0);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v12 = v11 - 32;
      if (v11 < 32)
        v12 = v11 - 25;
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 3);
      v13 = v10 + 4;
      if ((v5 & 1) != 0)
        goto LABEL_15;
    }
    else
    {
      v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
      v13 = (_QWORD *)(MEMORY[0x24BEE4AF8] + 32);
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[v8 + 4])
          memmove(v13, a4 + 4, 8 * v8);
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_2384FBFCC(0, v8, (char *)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_2384FBD68@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = CCUISControlsGalleryConfiguration.allowedControlSizes.getter();
  *a1 = result;
  return result;
}

void sub_2384FBD90()
{
  uint64_t v0;

  v0 = swift_bridgeObjectRetain();
  CCUISControlsGalleryConfiguration.allowedControlSizes.setter(v0);
}

uint64_t type metadata accessor for CCUISControlsGalleryConfiguration(uint64_t a1)
{
  return sub_2384F5DDC(a1, &qword_256916590);
}

_QWORD *sub_2384FBDCC(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  int64_t v11;
  uint64_t v12;
  _QWORD *v13;

  v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    v7 = a2;
    goto LABEL_8;
  }
  v6 = a4[3];
  v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2)
    goto LABEL_8;
  if (v7 + 0x4000000000000000 >= 0)
  {
    v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v7 = a2;
LABEL_8:
    v8 = a4[2];
    if (v7 <= v8)
      v9 = a4[2];
    else
      v9 = v7;
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_256916598);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v12 = v11 - 32;
      if (v11 < 32)
        v12 = v11 - 17;
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 4);
      v13 = v10 + 4;
      if ((v5 & 1) != 0)
        goto LABEL_15;
    }
    else
    {
      v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
      v13 = (_QWORD *)(MEMORY[0x24BEE4AF8] + 32);
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[2 * v8 + 4])
          memmove(v13, a4 + 4, 16 * v8);
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_2384FC0B4(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_2384FBED8(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v5 = a4 + 72 * a1 + 32;
    v6 = a3 + 72 * v4;
    if (v5 >= v6 || v5 + 72 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  result = sub_238506DE8();
  __break(1u);
  return result;
}

char *sub_2384FBFCC(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4;
  char *v5;
  size_t v6;
  char *v7;
  char *result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v5 = (char *)(a4 + 8 * a1 + 32);
    v6 = 8 * v4;
    v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }
  result = (char *)sub_238506DE8();
  __break(1u);
  return result;
}

uint64_t sub_2384FC0B4(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v5 = a4 + 16 * a1 + 32;
    v6 = a3 + 16 * v4;
    if (v5 >= v6 || v5 + 16 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  result = sub_238506DE8();
  __break(1u);
  return result;
}

uint64_t sub_2384FC1A4(uint64_t a1, uint64_t a2)
{
  void (*v3)(uint64_t);

  v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);
  return swift_release();
}

uint64_t CCUIControlIconElement.uniqueIdentifier.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR___CCUIControlIconElement_uniqueIdentifier);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t CCUIControlIconElement.kind.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR___CCUIControlIconElement_kind);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t CCUIControlIconElement.controlType.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + OBJC_IVAR___CCUIControlIconElement_controlType);
}

uint64_t CCUIControlIconElement.extensionBundleIdentifier.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR___CCUIControlIconElement_extensionBundleIdentifier);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t CCUIControlIconElement.containerBundleIdentifier.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR___CCUIControlIconElement_containerBundleIdentifier);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t CCUIControlIconElement.displayName.getter()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v1 = (uint64_t *)(v0 + OBJC_IVAR___CCUIControlIconElement_displayName);
  swift_beginAccess();
  v2 = *v1;
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t CCUIControlIconElement.displayName.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;

  v5 = (_QWORD *)(v2 + OBJC_IVAR___CCUIControlIconElement_displayName);
  swift_beginAccess();
  *v5 = a1;
  v5[1] = a2;
  return swift_bridgeObjectRelease();
}

uint64_t CCUIControlIconElement.preferredGallerySizeClass.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___CCUIControlIconElement_preferredGallerySizeClass;
  swift_beginAccess();
  return *(_QWORD *)v1;
}

uint64_t CCUIControlIconElement.preferredGallerySizeClass.setter(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t result;

  v3 = (_QWORD *)(v1 + OBJC_IVAR___CCUIControlIconElement_preferredGallerySizeClass);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

id CCUIControlIconElement.supportedGridSizeClasses.getter()
{
  uint64_t v0;

  return *(id *)(v0 + OBJC_IVAR___CCUIControlIconElement__supportedGridSizeClasses);
}

void sub_2384FC638(char a1)
{
  uint64_t v1;
  uint64_t *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;

  if ((a1 & 1) != 0)
  {
    if (qword_256915C80 != -1)
      swift_once();
    v2 = &qword_2569165B8;
  }
  else
  {
    if (qword_256915C78 != -1)
      swift_once();
    v2 = &qword_2569165B0;
  }
  v3 = (void *)*v2;
  v4 = *(void **)(v1 + OBJC_IVAR___CCUIControlIconElement__supportedGridSizeClasses);
  *(_QWORD *)(v1 + OBJC_IVAR___CCUIControlIconElement__supportedGridSizeClasses) = v3;
  v5 = v3;

  v6 = objc_msgSend((id)objc_opt_self(), sel_sbh_leafIconDataSourceNotificationCenter);
  objc_msgSend(v6, sel_postNotificationName_object_, *MEMORY[0x24BEB09F8], v1);

}

id CCUIControlIconElement.init(kind:controlType:extensionBundleIdentifier:containerBundleIdentifier:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v9 = (void *)sub_238506B48();
  swift_bridgeObjectRelease();
  v10 = (void *)sub_238506B48();
  swift_bridgeObjectRelease();
  if (a7)
  {
    v11 = (void *)sub_238506B48();
    swift_bridgeObjectRelease();
  }
  else
  {
    v11 = 0;
  }
  v12 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithKind_controlType_extensionBundleIdentifier_containerBundleIdentifier_, v9, a3, v10, v11);

  return v12;
}

{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v18[2];
  uint64_t v19;
  id v20;

  v19 = a3;
  v18[1] = a6;
  v8 = sub_238506AA0();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_238506A94();
  sub_238506A88();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  v12 = (void *)sub_238506B48();
  swift_bridgeObjectRelease();
  v13 = (void *)sub_238506B48();
  swift_bridgeObjectRelease();
  v14 = (void *)sub_238506B48();
  swift_bridgeObjectRelease();
  if (a7)
  {
    v15 = (void *)sub_238506B48();
    swift_bridgeObjectRelease();
  }
  else
  {
    v15 = 0;
  }
  v16 = objc_msgSend(v20, sel_initWithUniqueIdentifier_kind_controlType_extensionBundleIdentifier_containerBundleIdentifier_, v12, v13, v19, v14, v15);

  return v16;
}

id CCUIControlIconElement.init(uniqueIdentifier:kind:controlType:extensionBundleIdentifier:containerBundleIdentifier:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return sub_2384FD884(a1, a2, a3, a4, a5, a6, a7, a8, a9);
}

{
  char *v9;
  char *v10;
  char *v11;
  char *v12;
  char *v13;
  char *v14;
  uint64_t v15;
  char *v16;
  void *v17;
  id v18;
  objc_super v20;

  v10 = &v9[OBJC_IVAR___CCUIControlIconElement_displayName];
  *(_QWORD *)v10 = 0;
  *((_QWORD *)v10 + 1) = 0;
  *(_QWORD *)&v9[OBJC_IVAR___CCUIControlIconElement_preferredGallerySizeClass] = 0;
  v11 = &v9[OBJC_IVAR___CCUIControlIconElement_uniqueIdentifier];
  *(_QWORD *)v11 = a1;
  *((_QWORD *)v11 + 1) = a2;
  v12 = &v9[OBJC_IVAR___CCUIControlIconElement_kind];
  *(_QWORD *)v12 = a3;
  *((_QWORD *)v12 + 1) = a4;
  *(_QWORD *)&v9[OBJC_IVAR___CCUIControlIconElement_controlType] = a5;
  v13 = &v9[OBJC_IVAR___CCUIControlIconElement_extensionBundleIdentifier];
  *(_QWORD *)v13 = a6;
  *((_QWORD *)v13 + 1) = a7;
  v14 = &v9[OBJC_IVAR___CCUIControlIconElement_containerBundleIdentifier];
  *(_QWORD *)v14 = a8;
  *((_QWORD *)v14 + 1) = a9;
  v15 = qword_256915C78;
  v16 = v9;
  if (v15 != -1)
    swift_once();
  v17 = (void *)qword_2569165B0;
  if (qword_256915C80 != -1)
    swift_once();
  v18 = objc_msgSend(v17, sel_gridSizeClassSetByUnioningWithGridSizeClassSet_, qword_2569165B8);
  *(_QWORD *)&v16[OBJC_IVAR___CCUIControlIconElement__supportedGridSizeClasses] = v18;

  v20.receiver = v16;
  v20.super_class = (Class)CCUIControlIconElement;
  return objc_msgSendSuper2(&v20, sel_init);
}

uint64_t CCUIControlIconElement.priority(for:)()
{
  return 1;
}

uint64_t CCUIControlIconElement.icon(_:displayNameForLocation:)()
{
  void *v0;
  id v1;
  void *v2;
  uint64_t v3;

  v1 = objc_msgSend(v0, sel_displayName);
  if (!v1)
    return 0;
  v2 = v1;
  v3 = sub_238506B6C();

  return v3;
}

id CCUIControlIconElement.supportedGridSizeClasses(for:)()
{
  void *v0;

  return objc_msgSend(v0, sel_supportedGridSizeClasses);
}

uint64_t CCUIControlIconElement.iconSupportsConfiguration(_:)()
{
  return 1;
}

char *CCUIControlIconElement.copyWithUniqueIdentifier()()
{
  char *v0;
  id v1;
  id v2;
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  char *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;

  swift_getObjectType();
  v1 = objc_msgSend(v0, sel_kind);
  sub_238506B6C();

  v2 = objc_msgSend(v0, sel_controlType);
  v3 = objc_msgSend(v0, sel_extensionBundleIdentifier);
  sub_238506B6C();

  v4 = objc_msgSend(v0, sel_containerBundleIdentifier);
  if (v4)
  {
    v5 = v4;
    sub_238506B6C();
    v7 = v6;

  }
  else
  {
    v7 = 0;
  }
  v8 = (void *)sub_238506B48();
  swift_bridgeObjectRelease();
  v9 = (void *)sub_238506B48();
  swift_bridgeObjectRelease();
  if (v7)
  {
    v10 = (void *)sub_238506B48();
    swift_bridgeObjectRelease();
  }
  else
  {
    v10 = 0;
  }
  v11 = (char *)objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithKind_controlType_extensionBundleIdentifier_containerBundleIdentifier_, v8, v2, v9, v10);

  v12 = objc_msgSend(v0, sel_displayName);
  objc_msgSend(v11, sel_setDisplayName_, v12);

  objc_msgSend(v11, sel_setPreferredGallerySizeClass_, objc_msgSend(v0, sel_preferredGallerySizeClass));
  v13 = *(void **)&v0[OBJC_IVAR___CCUIControlIconElement__supportedGridSizeClasses];
  v14 = *(void **)&v11[OBJC_IVAR___CCUIControlIconElement__supportedGridSizeClasses];
  *(_QWORD *)&v11[OBJC_IVAR___CCUIControlIconElement__supportedGridSizeClasses] = v13;
  v15 = v13;

  return v11;
}

unint64_t CCUIControlIconElement.hash.getter()
{
  void *v0;
  void *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v22;
  uint64_t v23;

  v1 = v0;
  v2 = objc_msgSend(v0, sel_uniqueIdentifier);
  v3 = sub_238506B6C();
  v5 = v4;

  sub_2384F5C40();
  v6 = sub_238506CD4();
  swift_bridgeObjectRelease();
  v7 = objc_msgSend(v1, sel_containerBundleIdentifier, v3, v5);
  if (v7)
  {
    v8 = v7;
    v9 = sub_238506B6C();
    v11 = v10;

    v22 = v9;
    v23 = v11;
    v12 = sub_238506CD4();
    swift_bridgeObjectRelease();
  }
  else
  {
    v12 = 0;
  }
  v13 = objc_msgSend(v1, sel_kind, v22, v23);
  v14 = sub_238506B6C();
  v16 = v15;

  v17 = sub_238506CD4();
  swift_bridgeObjectRelease();
  v18 = (unint64_t)objc_msgSend(v1, sel_controlType, v14, v16);
  v19 = objc_msgSend(v1, sel_extensionBundleIdentifier);
  sub_238506B6C();

  v20 = sub_238506CD4();
  swift_bridgeObjectRelease();
  return v12 ^ v6 ^ v17 ^ v18 ^ v20;
}

uint64_t CCUIControlIconElement.isEqual(_:)(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  char v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  id v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  id v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  _BYTE v44[24];
  uint64_t v45;

  v2 = sub_2384F5C84(a1, (uint64_t)v44);
  if (!v45)
  {
    sub_2384F5D0C((uint64_t)v44);
    goto LABEL_22;
  }
  type metadata accessor for CCUIControlIconElement(v2);
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_22:
    v11 = 0;
    return v11 & 1;
  }
  if (v43 == v1)
  {

    v11 = 1;
    return v11 & 1;
  }
  v3 = objc_msgSend(v1, sel_uniqueIdentifier);
  v4 = sub_238506B6C();
  v6 = v5;

  v7 = objc_msgSend(v43, sel_uniqueIdentifier);
  v8 = sub_238506B6C();
  v10 = v9;

  if (v4 == v8 && v6 == v10)
  {
    swift_bridgeObjectRelease_n();
  }
  else
  {
    v12 = sub_238506E18();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v12 & 1) == 0)
      goto LABEL_21;
  }
  v13 = objc_msgSend(v1, sel_kind);
  v14 = sub_238506B6C();
  v16 = v15;

  v17 = objc_msgSend(v43, sel_kind);
  v18 = sub_238506B6C();
  v20 = v19;

  if (v14 != v18 || v16 != v20)
  {
    v21 = sub_238506E18();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v21 & 1) != 0)
      goto LABEL_14;
LABEL_21:

    goto LABEL_22;
  }
  swift_bridgeObjectRelease_n();
LABEL_14:
  v22 = objc_msgSend(v1, sel_controlType);
  if (v22 != objc_msgSend(v43, sel_controlType))
    goto LABEL_21;
  v23 = objc_msgSend(v1, sel_extensionBundleIdentifier);
  v24 = sub_238506B6C();
  v26 = v25;

  v27 = objc_msgSend(v43, sel_extensionBundleIdentifier);
  v28 = sub_238506B6C();
  v30 = v29;

  if (v24 == v28 && v26 == v30)
  {
    swift_bridgeObjectRelease_n();
    goto LABEL_19;
  }
  v31 = sub_238506E18();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v31 & 1) == 0)
    goto LABEL_21;
LABEL_19:
  v32 = objc_msgSend(v1, sel_containerBundleIdentifier);
  if (v32)
  {
    v33 = v32;
    v34 = sub_238506B6C();
    v36 = v35;

  }
  else
  {
    v34 = 0;
    v36 = 0;
  }
  v38 = objc_msgSend(v43, sel_containerBundleIdentifier);
  if (!v38)
  {
    if (!v36)
    {

      v11 = 1;
      return v11 & 1;
    }
LABEL_32:

    swift_bridgeObjectRelease();
    goto LABEL_22;
  }
  v39 = v38;
  v40 = sub_238506B6C();
  v42 = v41;

  if (!v36)
  {

    if (!v42)
    {
      v11 = 1;
      return v11 & 1;
    }
    swift_bridgeObjectRelease();
    goto LABEL_22;
  }
  if (!v42)
    goto LABEL_32;
  if (v34 == v40 && v36 == v42)
    v11 = 1;
  else
    v11 = sub_238506E18();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return v11 & 1;
}

uint64_t CCUIControlIconElement.description.getter()
{
  uint64_t v0;
  id v1;
  uint64_t v2;

  v1 = objc_msgSend((id)objc_opt_self(), sel_descriptionForRootObject_, v0);
  v2 = sub_238506B6C();

  return v2;
}

id CCUIControlIconElement.copy(with:)@<X0>(_QWORD *a1@<X8>)
{
  void *v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  id v21;
  id result;
  uint64_t v23;
  uint64_t ObjectType;

  v2 = v1;
  ObjectType = swift_getObjectType();
  v3 = objc_msgSend(v1, sel_uniqueIdentifier);
  v23 = sub_238506B6C();
  v5 = v4;

  v6 = objc_msgSend(v1, sel_kind);
  v7 = sub_238506B6C();
  v9 = v8;

  v10 = objc_msgSend(v1, sel_controlType);
  v11 = objc_msgSend(v1, sel_extensionBundleIdentifier);
  v12 = sub_238506B6C();
  v14 = v13;

  v15 = objc_msgSend(v1, sel_containerBundleIdentifier);
  if (v15)
  {
    v16 = v15;
    v17 = sub_238506B6C();
    v19 = v18;

  }
  else
  {
    v17 = 0;
    v19 = 0;
  }
  v20 = sub_2384FD884(v23, v5, v7, v9, (uint64_t)v10, v12, v14, v17, v19);
  v21 = objc_msgSend(v2, sel_displayName);
  objc_msgSend(v20, sel_setDisplayName_, v21);

  result = objc_msgSend(v20, sel_setPreferredGallerySizeClass_, objc_msgSend(v2, sel_preferredGallerySizeClass));
  a1[3] = ObjectType;
  *a1 = v20;
  return result;
}

id sub_2384FD884(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v10 = (void *)sub_238506B48();
  swift_bridgeObjectRelease();
  v11 = (void *)sub_238506B48();
  swift_bridgeObjectRelease();
  v12 = (void *)sub_238506B48();
  swift_bridgeObjectRelease();
  if (a9)
  {
    v13 = (void *)sub_238506B48();
    swift_bridgeObjectRelease();
  }
  else
  {
    v13 = 0;
  }
  v14 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithUniqueIdentifier_kind_controlType_extensionBundleIdentifier_containerBundleIdentifier_, v10, v11, a5, v12, v13);

  return v14;
}

uint64_t CCUIControlIconElement.appendDescription(to:)(void *a1)
{
  void *v1;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;
  uint64_t result;
  _QWORD v9[6];

  v3 = swift_allocObject();
  *(_QWORD *)(v3 + 16) = a1;
  *(_QWORD *)(v3 + 24) = v1;
  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = sub_2384FE6FC;
  *(_QWORD *)(v4 + 24) = v3;
  v9[4] = sub_2384FE714;
  v9[5] = v4;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 1107296256;
  v9[2] = sub_2384F5394;
  v9[3] = &block_descriptor_1;
  v5 = _Block_copy(v9);
  v6 = a1;
  v7 = v1;
  swift_retain();
  swift_release();
  objc_msgSend(v6, sel_appendProem_block_, v7, v5);
  _Block_release(v5);
  LOBYTE(v7) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  result = swift_release();
  if ((v7 & 1) != 0)
    __break(1u);
  return result;
}

uint64_t sub_2384FDB1C(void *a1, void *a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  char isEscapingClosureAtFileLocation;
  _QWORD v11[6];

  result = (uint64_t)objc_msgSend(a1, sel_hasSuccinctStyle);
  if ((result & 1) == 0)
  {
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = a1;
    *(_QWORD *)(v5 + 24) = a2;
    v6 = swift_allocObject();
    *(_QWORD *)(v6 + 16) = sub_2384FE780;
    *(_QWORD *)(v6 + 24) = v5;
    v11[4] = sub_2384FE7D4;
    v11[5] = v6;
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 1107296256;
    v11[2] = sub_2384F5394;
    v11[3] = &block_descriptor_16_0;
    v7 = _Block_copy(v11);
    v8 = a1;
    v9 = a2;
    swift_retain();
    swift_release();
    objc_msgSend(v8, sel_appendBodySectionWithName_block_, 0, v7);
    _Block_release(v7);
    isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
    swift_release();
    result = swift_release();
    if ((isEscapingClosureAtFileLocation & 1) != 0)
      __break(1u);
  }
  return result;
}

void sub_2384FDC64(void *a1, id a2)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  id v17;

  v4 = objc_msgSend(a2, sel_kind);
  if (!v4)
  {
    sub_238506B6C();
    v4 = (id)sub_238506B48();
    swift_bridgeObjectRelease();
  }
  v5 = (void *)sub_238506B48();
  objc_msgSend(a1, sel_appendString_withName_, v4, v5);

  objc_msgSend(a2, sel_controlType);
  sub_238506C44();
  v6 = (void *)sub_238506B48();
  swift_bridgeObjectRelease();
  v7 = (void *)sub_238506B48();
  objc_msgSend(a1, sel_appendString_withName_, v6, v7);

  v8 = objc_msgSend(a2, sel_extensionBundleIdentifier);
  if (!v8)
  {
    sub_238506B6C();
    v8 = (id)sub_238506B48();
    swift_bridgeObjectRelease();
  }
  v9 = (void *)sub_238506B48();
  objc_msgSend(a1, sel_appendString_withName_, v8, v9);

  v10 = objc_msgSend(a2, sel_containerBundleIdentifier);
  v11 = (void *)sub_238506B48();
  objc_msgSend(a1, sel_appendString_withName_, v10, v11);

  v12 = objc_msgSend(a2, sel_supportedGridSizeClasses);
  v13 = (void *)sub_238506B48();

  v14 = objc_msgSend(a2, sel_uniqueIdentifier);
  if (!v14)
  {
    sub_238506B6C();
    v14 = (id)sub_238506B48();
    swift_bridgeObjectRelease();
  }
  v15 = (void *)sub_238506B48();
  objc_msgSend(a1, sel_appendString_withName_, v14, v15);

  v16 = objc_msgSend(a2, sel_displayName);
  v17 = (id)sub_238506B48();
  objc_msgSend(a1, sel_appendString_withName_skipIfEmpty_, v16, v17, 1);

}

id sub_2384FDFD4()
{
  uint64_t v0;
  id result;

  v0 = CCUIDefaultSupportedGridSizeClassesForChronoControls();
  result = SBHIconGridSizeClassSetForCCUIGridSizeClassMask(v0);
  qword_2569165B0 = (uint64_t)result;
  return result;
}

uint64_t sub_2384FDFFC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  id v4;
  uint64_t result;
  _QWORD v6[6];

  v0 = CCUIDefaultSupportedGridSizeClassesForChronoControls();
  v1 = swift_allocObject();
  *(_QWORD *)(v1 + 16) = 0;
  v2 = swift_allocObject();
  *(_QWORD *)(v2 + 16) = v0;
  *(_QWORD *)(v2 + 24) = v1;
  v6[4] = sub_2384FE7CC;
  v6[5] = v2;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 1107296256;
  v6[2] = sub_2384FC1A4;
  v6[3] = &block_descriptor_25_0;
  v3 = _Block_copy(v6);
  swift_retain();
  swift_release();
  CCUIEnumerateGridSizeClassesWithBlock(v3);
  _Block_release(v3);
  swift_beginAccess();
  v4 = SBHIconGridSizeClassSetForCCUIGridSizeClassMask(*(_QWORD *)(v1 + 16));
  result = swift_release();
  qword_2569165B8 = (uint64_t)v4;
  return result;
}

uint64_t type metadata accessor for CCUIControlIconElement(uint64_t a1)
{
  return sub_2384F5DDC(a1, (unint64_t *)&unk_256916610);
}

uint64_t sub_2384FE118(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;

  result = CCUIGridSizeClassMaskForGridSizeClass(a1);
  if ((result & ~a2) == 0)
  {
    v7 = (_QWORD *)(a3 + 16);
    v8 = CCUIAdjustGridSizeClassForAccessibility(a1, 1);
    v9 = CCUIGridSizeClassMaskForGridSizeClass(v8);
    result = swift_beginAccess();
    if ((v9 & ~*v7) != 0)
      *v7 |= v9;
  }
  return result;
}

void __swiftcall CCUIControlIconElement.init()(CCUIControlIconElement *__return_ptr retstr)
{
  objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
}

void CCUIControlIconElement.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

unint64_t CCUIControlIconElement.sbh_galleryItemIdentifier.getter()
{
  void *v0;
  id v1;

  sub_238506D1C();
  swift_bridgeObjectRelease();
  v1 = objc_msgSend(v0, sel_uniqueIdentifier);
  sub_238506B6C();

  sub_238506B84();
  swift_bridgeObjectRelease();
  return 0xD00000000000001ELL;
}

uint64_t CCUIControlIconElement.sbh_appName.getter()
{
  void *v0;
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;

  v1 = v0;
  v2 = objc_msgSend(v0, sel_containerBundleIdentifier);
  if (v2)
  {
    v3 = v2;
    v4 = sub_238506B6C();
    v6 = v5;

    sub_2384F5DDC(0, (unint64_t *)&unk_256916600);
    v7 = sub_2384F5798(v4, v6, 1);
    v11 = v7;
    if (v7)
    {
      v9 = objc_msgSend(v7, sel_localizedName);
      v10 = sub_238506B6C();

      goto LABEL_8;
    }
  }
  v8 = objc_msgSend(v1, sel_sbh_widgetName);
  if (v8)
  {
    v9 = v8;
    v10 = sub_238506B6C();
LABEL_8:

    return v10;
  }
  return 0;
}

uint64_t CCUIControlIconElement.sbh_widgetName.getter()
{
  void *v0;
  id v1;
  uint64_t v2;

  v1 = objc_msgSend(v0, sel_displayName);
  if (!v1)
    v1 = objc_msgSend(v0, sel_kind);
  v2 = sub_238506B6C();

  return v2;
}

uint64_t CCUIControlIconElement.sbh_supportedSizeClasses.getter()
{
  return 0;
}

uint64_t CCUIControlIconElement.sbh_widgetDescription.getter()
{
  return 0;
}

uint64_t CCUIControlIconElement.sbh_canBeAddedToStack.getter()
{
  return 0;
}

uint64_t CCUIControlIconElement.sbh_supportsRemovableBackground.getter()
{
  return 0;
}

uint64_t CCUIControlIconElement.sbh_supportsRemovableBackgroundOrAccessoryFamilies.getter()
{
  return 0;
}

uint64_t CCUIControlIconElement.backgroundColor.getter()
{
  return 0;
}

uint64_t CCUIControlIconElement.accentColor.getter()
{
  return 0;
}

uint64_t CCUIControlIconElement.mostInterestingColor.getter()
{
  return 0;
}

uint64_t CCUIControlIconElement.sbh_favoredSizeClasses(for:)()
{
  return 0;
}

uint64_t CCUIControlIconElement.sbh_isLinkedOnOr(after:)()
{
  return 1;
}

uint64_t sub_2384FE6D0()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_2384FE6FC()
{
  uint64_t v0;

  return sub_2384FDB1C(*(void **)(v0 + 16), *(void **)(v0 + 24));
}

uint64_t sub_2384FE704()
{
  return swift_deallocObject();
}

uint64_t sub_2384FE714()
{
  uint64_t v0;

  return sub_2384F5374(*(uint64_t (**)(void))(v0 + 16));
}

uint64_t block_copy_helper_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_1()
{
  return swift_release();
}

id sub_2384FE73C@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_preferredGallerySizeClass);
  *a2 = result;
  return result;
}

id sub_2384FE76C(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setPreferredGallerySizeClass_, *a1);
}

void sub_2384FE780()
{
  uint64_t v0;

  sub_2384FDC64(*(void **)(v0 + 16), *(id *)(v0 + 24));
}

uint64_t sub_2384FE788()
{
  return swift_deallocObject();
}

uint64_t sub_2384FE798()
{
  return swift_deallocObject();
}

uint64_t sub_2384FE7A8()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2384FE7CC(uint64_t a1)
{
  uint64_t v1;

  return sub_2384FE118(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

unint64_t sub_2384FE7F0(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  void **v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  unint64_t result;
  char v10;
  uint64_t *v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_256916530);
  v2 = (_QWORD *)sub_238506DDC();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (void **)(a1 + 48);
  while (1)
  {
    v5 = (uint64_t)*(v4 - 2);
    v6 = (uint64_t)*(v4 - 1);
    v7 = *v4;
    swift_bridgeObjectRetain();
    v8 = v7;
    result = sub_2385040FC(v5, v6);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v11 = (uint64_t *)(v2[6] + 16 * result);
    *v11 = v5;
    v11[1] = v6;
    *(_QWORD *)(v2[7] + 8 * result) = v8;
    v12 = v2[2];
    v13 = __OFADD__(v12, 1);
    v14 = v12 + 1;
    if (v13)
      goto LABEL_11;
    v2[2] = v14;
    v4 += 3;
    if (!--v3)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_2384FE908(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  id v6;
  unint64_t result;
  char v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_256916938);
  v2 = (_QWORD *)sub_238506DDC();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (uint64_t *)(a1 + 40);
  while (1)
  {
    v5 = *v4;
    v6 = (id)*(v4 - 1);
    swift_unknownObjectRetain();
    result = sub_238504160((uint64_t)v6);
    if ((v8 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v9 = 8 * result;
    *(_QWORD *)(v2[6] + v9) = v6;
    *(_QWORD *)(v2[7] + v9) = v5;
    v10 = v2[2];
    v11 = __OFADD__(v10, 1);
    v12 = v10 + 1;
    if (v11)
      goto LABEL_11;
    v2[2] = v12;
    v4 += 2;
    if (!--v3)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_2384FEA10(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t result;
  char v10;
  uint64_t *v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;

  if (!*(_QWORD *)(a1 + 16))
  {
    v3 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_256916808);
  v2 = sub_238506DDC();
  v3 = (_QWORD *)v2;
  v4 = *(_QWORD *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  v5 = v2 + 64;
  v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_2385066F8(v6, (uint64_t)&v15);
    v7 = v15;
    v8 = v16;
    result = sub_2385040FC(v15, v16);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v11 = (uint64_t *)(v3[6] + 16 * result);
    *v11 = v7;
    v11[1] = v8;
    result = (unint64_t)sub_238506740(&v17, (_OWORD *)(v3[7] + 32 * result));
    v12 = v3[2];
    v13 = __OFADD__(v12, 1);
    v14 = v12 + 1;
    if (v13)
      goto LABEL_11;
    v3[2] = v14;
    v6 += 48;
    if (!--v4)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t sub_2384FEB38(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  uint64_t i;
  uint64_t v4;
  _BOOL8 v5;
  BOOL v6;

  v2 = *(_QWORD *)(a2 + 16);
  if (!v2)
    return 0;
  if (*(_QWORD *)(a2 + 32) == result)
    return 1;
  if (v2 == 1)
    return 0;
  for (i = 5; ; ++i)
  {
    v4 = i - 3;
    if (__OFADD__(i - 4, 1))
      break;
    v6 = *(_QWORD *)(a2 + 8 * i) == result;
    v5 = v6;
    v6 = v6 || v4 == v2;
    if (v6)
      return v5;
  }
  __break(1u);
  return result;
}

uint64_t sub_2384FEB9C(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v3;
  uint64_t result;
  _QWORD *v9;
  uint64_t i;
  uint64_t v11;
  BOOL v12;

  v3 = a3[2];
  if (!v3)
    return 0;
  if (a3[4] == a1 && a3[5] == a2)
    return 1;
  result = sub_238506E18();
  if ((result & 1) != 0)
    return 1;
  if (v3 == 1)
    return 0;
  v9 = a3 + 7;
  for (i = 1; ; ++i)
  {
    v11 = i + 1;
    if (__OFADD__(i, 1))
      break;
    v12 = *(v9 - 1) == a1 && *v9 == a2;
    if (v12 || (sub_238506E18() & 1) != 0)
      return 1;
    result = 0;
    v9 += 2;
    if (v11 == v3)
      return result;
  }
  __break(1u);
  return result;
}

char *sub_2384FEC60(void *a1)
{
  char *v1;
  void *v3;
  char *v4;
  id v5;
  id v6;
  id v7;
  char *v8;
  void *v9;
  char *v10;
  id v11;
  uint64_t v12;
  objc_super v14;

  swift_unknownObjectWeakInit();
  *(_QWORD *)&v1[OBJC_IVAR____TtC23ControlCenterUIServices22ControlsGalleryManager_iconViewProvider] = 0;
  *(_QWORD *)&v1[OBJC_IVAR____TtC23ControlCenterUIServices22ControlsGalleryManager_applicationControlCollections] = 0;
  *(_QWORD *)&v1[OBJC_IVAR____TtC23ControlCenterUIServices22ControlsGalleryManager_galleryApplicationControlCollections] = 0;
  *(_QWORD *)&v1[OBJC_IVAR____TtC23ControlCenterUIServices22ControlsGalleryManager_moduleUniqueIdentifiers] = 0;
  *(_QWORD *)&v1[OBJC_IVAR____TtC23ControlCenterUIServices22ControlsGalleryManager____lazy_storage___moduleContentMetrics] = 0;
  swift_unknownObjectWeakAssign();
  v3 = (void *)objc_opt_self();
  v4 = v1;
  v5 = objc_msgSend(v3, sel_visibleControls);
  v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE16A58]), sel_initWithOptions_, v5);

  *(_QWORD *)&v4[OBJC_IVAR____TtC23ControlCenterUIServices22ControlsGalleryManager_extensionProvider] = v6;
  v7 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEB0898]), sel_initWithWidgetExtensionProvider_, v6);
  *(_QWORD *)&v4[OBJC_IVAR____TtC23ControlCenterUIServices22ControlsGalleryManager_configurationManager] = v7;

  v14.receiver = v4;
  v14.super_class = (Class)type metadata accessor for ControlsGalleryManager();
  v8 = (char *)objc_msgSendSuper2(&v14, sel_init);
  v9 = *(void **)&v8[OBJC_IVAR____TtC23ControlCenterUIServices22ControlsGalleryManager_configurationManager];
  v10 = v8;
  objc_msgSend(v9, sel_setAllowsFakeWidgets_, 0);
  objc_msgSend(v9, sel_setConfigurationManagerDelegate_, v10);
  v11 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEB0908]), sel_initWithDelegate_, v10);

  type metadata accessor for ControlsGalleryManager.IconViewProvider();
  v12 = swift_allocObject();
  swift_unknownObjectWeakInit();
  *(_QWORD *)(v12 + 24) = v11;
  *(_QWORD *)&v10[OBJC_IVAR____TtC23ControlCenterUIServices22ControlsGalleryManager_iconViewProvider] = v12;
  swift_retain();
  swift_unknownObjectRelease();
  swift_unknownObjectWeakAssign();
  swift_release();
  return v10;
}

uint64_t sub_2384FEE54(unint64_t a1)
{
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  id v5;
  BOOL v6;
  id v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t i;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  id v22;
  uint64_t v23;
  uint64_t v24;

  v1 = a1;
  v2 = MEMORY[0x24BEE4AF8];
  v24 = MEMORY[0x24BEE4AF8];
  if (a1 >> 62)
    goto LABEL_35;
  v3 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v3; v3 = sub_238506DB8())
  {
    v4 = 0;
    v20 = v3;
    v21 = v1 & 0xC000000000000001;
    v17 = v1 + 32;
    v18 = v1 & 0xFFFFFFFFFFFFFF8;
    v19 = v1;
    while (v21)
    {
      v5 = (id)MEMORY[0x23B8372A0](v4, v1);
      v6 = __OFADD__(v4++, 1);
      if (v6)
        goto LABEL_32;
LABEL_10:
      v23 = v2;
      v22 = v5;
      v7 = objc_msgSend(v5, sel_widgetDescriptors, v17);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2569168E0);
      v8 = sub_238506BD8();

      if (v8 >> 62)
      {
        swift_bridgeObjectRetain();
        v9 = sub_238506DB8();
        swift_bridgeObjectRelease();
        if (!v9)
        {
LABEL_27:
          swift_bridgeObjectRelease();
          goto LABEL_28;
        }
      }
      else
      {
        v9 = *(_QWORD *)((v8 & 0xFFFFFFFFFFFFF8) + 0x10);
        if (!v9)
          goto LABEL_27;
      }
      if (v9 < 1)
        goto LABEL_33;
      for (i = 0; i != v9; ++i)
      {
        if ((v8 & 0xC000000000000001) != 0)
          MEMORY[0x23B8372A0](i, v8);
        else
          swift_unknownObjectRetain();
        objc_opt_self();
        v12 = (void *)swift_dynamicCastObjCClass();
        if (v12)
        {
          v11 = sub_2385014B8(v12);
          MEMORY[0x23B83712C]();
          if (*(_QWORD *)((v23 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v23 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
            sub_238506BF0();
          sub_238506BFC();
          sub_238506BE4();
          swift_unknownObjectRelease();

        }
        else
        {
          v13 = swift_unknownObjectRetain();
          MEMORY[0x23B83712C](v13);
          if (*(_QWORD *)((v23 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v23 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
            sub_238506BF0();
          sub_238506BFC();
          sub_238506BE4();
          swift_unknownObjectRelease();
        }
      }
      swift_bridgeObjectRelease();
      v1 = v19;
      v2 = MEMORY[0x24BEE4AF8];
LABEL_28:
      v14 = (void *)sub_238506BCC();
      swift_bridgeObjectRelease();
      objc_msgSend(v22, sel_setWidgetDescriptors_, v14);

      v15 = v22;
      MEMORY[0x23B83712C]();
      if (*(_QWORD *)((v24 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v24 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
        sub_238506BF0();
      sub_238506BFC();
      sub_238506BE4();

      if (v4 == v20)
      {
        swift_bridgeObjectRelease();
        return v24;
      }
    }
    if (v4 >= *(_QWORD *)(v18 + 16))
      goto LABEL_34;
    v5 = *(id *)(v17 + 8 * v4);
    v6 = __OFADD__(v4++, 1);
    if (!v6)
      goto LABEL_10;
LABEL_32:
    __break(1u);
LABEL_33:
    __break(1u);
LABEL_34:
    __break(1u);
LABEL_35:
    swift_bridgeObjectRetain();
  }
  swift_bridgeObjectRelease();
  return MEMORY[0x24BEE4AF8];
}

uint64_t sub_2384FF1F8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  unint64_t v7;
  unint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t *v38;
  _QWORD *v39;
  uint64_t v40;
  uint64_t v41;
  id v42;
  id v43;
  void *v44;
  void *v45;
  unint64_t v46;
  uint64_t v47;
  unint64_t v48;
  unint64_t v49;
  id v50;
  BOOL v51;
  unint64_t v52;
  unint64_t v53;
  id v54;
  unint64_t v55;
  uint64_t v56;
  unint64_t v57;
  id v58;
  uint64_t v59;
  _QWORD *v60;
  unint64_t v61;
  uint64_t v62;
  id v63;
  uint64_t v64;
  id v65;
  uint64_t v66;
  id v67;
  void *v68;
  uint64_t v69;
  id v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  id v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  char v79;
  uint64_t v80;
  id v81;
  void *v82;
  id v83;
  id v84;
  unint64_t v85;
  unint64_t v86;
  id v87;
  uint64_t v88;
  char *v89;
  uint64_t v90;
  uint64_t v91;
  char *v92;
  uint64_t v93;
  uint64_t v94;
  _QWORD v96[3];
  uint64_t v97;
  void *v98;
  void *v99;
  id v100;
  char *v101;
  char *v102;
  uint64_t v103;
  uint64_t v104;
  char *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  unint64_t v112;
  uint64_t v113;
  uint64_t v114;
  unint64_t v115;
  unint64_t v116;
  uint64_t v117;
  id v118;
  unint64_t v119;
  unint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  unint64_t v124;
  _QWORD *v125;
  unint64_t v126;
  uint64_t v127;
  _QWORD *v128;
  id v129;
  id v130;
  uint64_t v131;
  unint64_t v132;
  unint64_t v133;
  _QWORD *v134;
  char v135[8];
  _QWORD v136[2];
  void *v137;
  void *v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;

  v1 = v0;
  v104 = sub_238506B3C();
  v103 = *(_QWORD *)(v104 - 8);
  v2 = MEMORY[0x24BDAC7A8](v104);
  v102 = (char *)v96 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v2);
  v101 = (char *)v96 - v4;
  v107 = __swift_instantiateConcreteTypeFromMangledName(&qword_256916940);
  v106 = *(_QWORD *)(v107 - 8);
  MEMORY[0x24BDAC7A8](v107);
  v105 = (char *)v96 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC23ControlCenterUIServices22ControlsGalleryManager_configurationManager), sel_applicationControlCollections);
  sub_2384F5DDC(0, &qword_2569164A0);
  v7 = sub_238506BD8();

  v8 = sub_2384FEE54(v7);
  swift_bridgeObjectRelease();
  sub_238500F80((uint64_t)v135);
  v116 = v8;
  v9 = sub_238502460((uint64_t)v135, v8);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2569168E8);
  v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_238508490;
  *(_QWORD *)(v10 + 32) = v9;
  v136[0] = v10;
  sub_238506BE4();
  *(_QWORD *)(v0 + OBJC_IVAR____TtC23ControlCenterUIServices22ControlsGalleryManager_galleryApplicationControlCollections) = v136[0];
  v100 = v9;
  swift_bridgeObjectRelease();
  v134 = sub_2384F113C();
  v128 = v134;
  v11 = v134[2];
  v122 = v0;
  v127 = v11;
  if (!v11)
  {
    v26 = 0;
    v27 = 0;
    v28 = 0;
    v29 = 0;
    v30 = 0;
    v31 = 0;
    v32 = 0;
    v33 = 0;
    goto LABEL_17;
  }
  swift_bridgeObjectRetain_n();
  v12 = 0;
  v13 = 0;
  v126 = 0x800000023850A510;
  while (1)
  {
    v15 = v128[v12 + 4];
    v16 = v128[v12 + 5];
    v17 = (void *)v128[v12 + 6];
    v18 = (void *)v128[v12 + 7];
    v19 = qword_256915C60;
    swift_bridgeObjectRetain_n();
    v130 = v17;
    v129 = v18;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v19 != -1)
      swift_once();
    v20 = (void *)qword_256917570;
    v21 = (void *)sub_238506B48();
    v22 = objc_msgSend(v20, sel_localizedStringForKey_value_table_, v21, 0, 0);

    v23 = sub_238506B6C();
    v25 = v24;

    if (!v16)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      goto LABEL_4;
    }
    if (v15 == v23 && v16 == v25)
    {
      v34 = &v128[v12 + 5];
      v35 = (uint64_t)&v128[v12 + 10];
      v36 = (uint64_t)&v128[v12 + 12];
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v37 = (uint64_t *)v35;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();

      v38 = (uint64_t *)v36;
      swift_bridgeObjectRelease_n();
      goto LABEL_15;
    }
    v14 = sub_238506E18();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    if ((v14 & 1) != 0)
      break;
LABEL_4:
    ++v13;
    v12 += 9;
    if (v127 == v13)
    {
      swift_bridgeObjectRelease_n();
      v26 = 0;
      v27 = 0;
      v28 = 0;
      v29 = 0;
      v30 = 0;
      v11 = 0;
      v31 = 0;
      v32 = 0;
      v33 = 0;
      goto LABEL_16;
    }
  }
  v34 = &v128[v12 + 5];
  v37 = &v128[v12 + 10];
  v38 = &v128[v12 + 12];
LABEL_15:
  swift_bridgeObjectRelease();
  v39 = &v128[v12];
  v111 = v128[v12 + 4];
  v110 = *v34;
  v28 = (void *)v128[v12 + 6];
  v29 = (void *)v128[v12 + 7];
  v30 = v39[8];
  v109 = v39[9];
  v40 = *v37;
  v108 = v39[11];
  v41 = *v38;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v42 = v28;
  v43 = v29;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  sub_238500160(v13, (uint64_t)v136);
  v44 = v137;
  v45 = v138;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v31 = v40;
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  v33 = v41;
  v32 = v108;
  v11 = v109;
  v27 = v110;
  v26 = v111;
LABEL_16:
  v1 = v122;
LABEL_17:
  v96[1] = v33;
  v108 = v32;
  v111 = v26;
  v136[0] = v26;
  v136[1] = v27;
  v110 = v27;
  v99 = v28;
  v137 = v28;
  v138 = v29;
  v98 = v29;
  v97 = v30;
  v139 = v30;
  v140 = v11;
  v109 = v11;
  v96[2] = v31;
  v141 = v31;
  v142 = v32;
  v143 = v33;
  v132 = MEMORY[0x24BEE4AF8];
  v133 = MEMORY[0x24BEE4AF8];
  v46 = v116;
  if (v116 >> 62)
    goto LABEL_74;
  v47 = *(_QWORD *)((v116 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (!v47)
  {
LABEL_75:
    swift_bridgeObjectRelease();
    v85 = MEMORY[0x24BEE4AF8];
    goto LABEL_76;
  }
  while (2)
  {
    v48 = 0;
    v115 = v46 & 0xC000000000000001;
    v113 = v46 & 0xFFFFFFFFFFFFFF8;
    v112 = v46 + 32;
    v114 = v47;
LABEL_20:
    if (v115)
    {
      v49 = v48;
      v50 = (id)MEMORY[0x23B8372A0](v48, v46);
      v51 = __OFADD__(v49, 1);
      v52 = v49 + 1;
      if (v51)
        goto LABEL_72;
    }
    else
    {
      if (v48 >= *(_QWORD *)(v113 + 16))
        goto LABEL_73;
      v53 = v48;
      v50 = *(id *)(v112 + 8 * v48);
      v51 = __OFADD__(v53, 1);
      v52 = v53 + 1;
      if (v51)
      {
LABEL_72:
        __break(1u);
LABEL_73:
        __break(1u);
LABEL_74:
        swift_bridgeObjectRetain();
        v46 = v116;
        v47 = sub_238506DB8();
        swift_bridgeObjectRelease();
        if (!v47)
          goto LABEL_75;
        continue;
      }
    }
    break;
  }
  v119 = v52;
  v131 = MEMORY[0x24BEE4AF8];
  v118 = v50;
  v54 = objc_msgSend(v50, sel_widgetDescriptors);
  v117 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569168E0);
  v55 = sub_238506BD8();

  if (!(v55 >> 62))
  {
    v56 = *(_QWORD *)((v55 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v56)
      goto LABEL_28;
    goto LABEL_64;
  }
  swift_bridgeObjectRetain();
  v56 = sub_238506DB8();
  swift_bridgeObjectRelease();
  if (!v56)
  {
LABEL_64:
    swift_bridgeObjectRelease();
    v82 = (void *)sub_238506BCC();
    swift_bridgeObjectRelease();
    v83 = v118;
    objc_msgSend(v118, sel_setWidgetDescriptors_, v82);

    v84 = v83;
    MEMORY[0x23B83712C]();
    if (*(_QWORD *)((v132 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v132 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      sub_238506BF0();
    sub_238506BFC();
    sub_238506BE4();

    v48 = v119;
    v46 = v116;
    if (v119 == v114)
      goto LABEL_69;
    goto LABEL_20;
  }
LABEL_28:
  v57 = 0;
  v125 = v134;
  v126 = v55 & 0xC000000000000001;
  v121 = v55 & 0xFFFFFFFFFFFFFF8;
  v120 = v55 + 32;
  v124 = v55;
  v123 = v56;
  while (2)
  {
    if (v126)
    {
      v59 = MEMORY[0x23B8372A0](v57, v55);
      v51 = __OFADD__(v57, 1);
      v60 = (_QWORD *)(v57 + 1);
      if (v51)
        goto LABEL_70;
    }
    else
    {
      if (v57 >= *(_QWORD *)(v121 + 16))
        goto LABEL_71;
      v59 = *(_QWORD *)(v120 + 8 * v57);
      swift_unknownObjectRetain();
      v51 = __OFADD__(v57, 1);
      v60 = (_QWORD *)(v57 + 1);
      if (v51)
      {
LABEL_70:
        __break(1u);
LABEL_71:
        __break(1u);
        goto LABEL_72;
      }
    }
    v128 = v60;
    v61 = v133;
    swift_bridgeObjectRetain();
    v62 = (uint64_t)v125;
    swift_bridgeObjectRetain();
    v63 = sub_238501904(v59, v61, v62);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v130 = v63;
    if (!v63)
    {
      v80 = swift_unknownObjectRetain();
      MEMORY[0x23B83712C](v80);
      if (*(_QWORD *)((v131 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v131 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
        sub_238506BF0();
      sub_238506BFC();
      sub_238506BE4();
      swift_unknownObjectRelease();
      goto LABEL_32;
    }
    v127 = v59;
    if (!(v61 >> 62))
    {
      v64 = *(_QWORD *)((v61 & 0xFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain_n();
      v65 = v130;
      if (v64)
        goto LABEL_42;
LABEL_53:
      swift_bridgeObjectRelease_n();
      v58 = v130;
      MEMORY[0x23B83712C]();
      if (*(_QWORD *)((v133 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v133 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
        sub_238506BF0();
      sub_238506BFC();
      sub_238506BE4();
      swift_unknownObjectRelease();
LABEL_31:

      v1 = v122;
      v55 = v124;
      v56 = v123;
LABEL_32:
      v57 = (unint64_t)v128;
      if (v128 == (_QWORD *)v56)
        goto LABEL_64;
      continue;
    }
    break;
  }
  swift_bridgeObjectRetain_n();
  v81 = v130;
  v64 = sub_238506DB8();
  if (!v64)
    goto LABEL_53;
LABEL_42:
  v129 = (id)(v61 & 0xC000000000000001);
  v66 = 4;
  while (1)
  {
    v1 = v66 - 4;
    v67 = v129 ? (id)MEMORY[0x23B8372A0](v66 - 4, v61) : *(id *)(v61 + 8 * v66);
    v68 = v67;
    v69 = v66 - 3;
    if (__OFADD__(v1, 1))
      break;
    v70 = objc_msgSend(v67, sel_uniqueIdentifier);
    v71 = sub_238506B6C();
    v73 = v72;

    v74 = objc_msgSend(v130, sel_uniqueIdentifier);
    v75 = sub_238506B6C();
    v77 = v76;

    if (v71 == v75 && v73 == v77)
    {
      swift_bridgeObjectRelease_n();

LABEL_30:
      swift_bridgeObjectRelease_n();
      swift_unknownObjectRelease();
      v58 = v130;
      goto LABEL_31;
    }
    v79 = sub_238506E18();

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v79 & 1) != 0)
      goto LABEL_30;
    ++v66;
    if (v69 == v64)
      goto LABEL_53;
  }
  __break(1u);
LABEL_69:
  swift_bridgeObjectRelease();
  v85 = v133;
LABEL_76:
  v86 = sub_238505398(v85, (uint64_t)v134);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v133 = v86;
  sub_238500418(v86);
  v87 = (id)sub_2385005D0((uint64_t *)&v132, (uint64_t)v136);
  MEMORY[0x23B83712C]();
  v88 = v1;
  if (*(_QWORD *)((v132 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v132 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
    sub_238506BF0();
  sub_238506BFC();
  sub_238506BE4();
  swift_getKeyPath();
  v89 = v101;
  sub_238506B30();
  v90 = v103;
  v91 = v104;
  (*(void (**)(char *, char *, uint64_t))(v103 + 16))(v102, v89, v104);
  v92 = v105;
  sub_238506A64();
  (*(void (**)(char *, uint64_t))(v90 + 8))(v89, v91);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256916948);
  sub_2384FB288(&qword_256916950, &qword_256916948, MEMORY[0x24BEE12B8]);
  sub_2384FB288(&qword_256916958, &qword_256916948, MEMORY[0x24BEE12D8]);
  sub_2384FB288((unint64_t *)&unk_256916960, &qword_256916940, MEMORY[0x24BDCBF20]);
  v93 = v107;
  sub_238506B24();
  (*(void (**)(char *, uint64_t))(v106 + 8))(v92, v93);
  v94 = sub_238505984(v132);
  swift_bridgeObjectRelease();
  v132 = v94;
  *(_QWORD *)(v88 + OBJC_IVAR____TtC23ControlCenterUIServices22ControlsGalleryManager_applicationControlCollections) = v94;
  swift_bridgeObjectRelease();
  sub_2385069E0(v111, v110, v99, v98, v97);

  return sub_23850685C((uint64_t)v135);
}

uint64_t sub_238500080(unint64_t a1)
{
  unint64_t *v1;
  unint64_t v3;
  int isUniquelyReferenced_nonNull_bridgeObject;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;

  v3 = *v1;
  isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *v1 = v3;
  if (!isUniquelyReferenced_nonNull_bridgeObject
    || (v3 & 0x8000000000000000) != 0
    || (v3 & 0x4000000000000000) != 0)
  {
    sub_2385045D0(v3);
  }
  v5 = v3 & 0xFFFFFFFFFFFFFF8;
  v6 = *(_QWORD *)(v5 + 16);
  if (v6 <= a1)
  {
    __break(1u);
  }
  else
  {
    v7 = v6 - 1;
    v8 = v6 - 1 - a1;
    if (v8 >= 0)
    {
      v9 = v5 + 8 * a1;
      v10 = *(_QWORD *)(v9 + 32);
      memmove((void *)(v9 + 32), (const void *)(v9 + 40), 8 * v8);
      *(_QWORD *)(v5 + 16) = v7;
      sub_238506BE4();
      return v10;
    }
  }
  result = sub_238506DE8();
  __break(1u);
  return result;
}

uint64_t sub_238500160@<X0>(unint64_t a1@<X0>, uint64_t a2@<X8>)
{
  _QWORD **v2;
  _QWORD *v5;
  unint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  __int128 v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  uint64_t result;

  v5 = *v2;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v5 = sub_238504638(v5);
  v6 = v5[2];
  if (v6 <= a1)
  {
    __break(1u);
  }
  else
  {
    v7 = &v5[9 * a1];
    v9 = *((_OWORD *)v7 + 2);
    v8 = v7 + 4;
    v10 = v8[4];
    v11 = v6 - 1;
    v12 = v8[7];
    v13 = v8[8];
    v14 = *((_OWORD *)v8 + 1);
    *(_OWORD *)a2 = v9;
    *(_OWORD *)(a2 + 16) = v14;
    *(_QWORD *)(a2 + 32) = v10;
    *(_OWORD *)(a2 + 40) = *(_OWORD *)(v8 + 5);
    *(_QWORD *)(a2 + 56) = v12;
    *(_QWORD *)(a2 + 64) = v13;
    if ((uint64_t)(v11 - a1) >= 0)
    {
      result = (uint64_t)memmove(v8, v8 + 9, 72 * (v11 - a1));
      v5[2] = v11;
      *v2 = v5;
      return result;
    }
  }
  result = sub_238506DE8();
  __break(1u);
  return result;
}

uint64_t sub_238500260(unint64_t a1)
{
  unint64_t *v1;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int isUniquelyReferenced_nonNull_bridgeObject;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;

  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    v3 = sub_238506DB8();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v4 = *v1;
  if (*v1 >> 62)
  {
    swift_bridgeObjectRetain();
    v5 = sub_238506DB8();
    swift_bridgeObjectRelease();
    v6 = v5 + v3;
    if (!__OFADD__(v5, v3))
      goto LABEL_5;
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  v5 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
  v6 = v5 + v3;
  if (__OFADD__(v5, v3))
    goto LABEL_23;
LABEL_5:
  v4 = *v1;
  isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *v1 = v4;
  v5 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v4 & 0x8000000000000000) == 0 && (v4 & 0x4000000000000000) == 0)
  {
    v8 = v4 & 0xFFFFFFFFFFFFFF8;
    if (v6 <= *(_QWORD *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      goto LABEL_15;
    v5 = 1;
  }
  if (v4 >> 62)
    goto LABEL_25;
  v9 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    if (v9 <= v6)
      v9 = v6;
    swift_bridgeObjectRetain();
    v4 = MEMORY[0x23B8372AC](v5, v9, 1, v4);
    swift_bridgeObjectRelease();
    *v1 = v4;
    v8 = v4 & 0xFFFFFFFFFFFFFF8;
LABEL_15:
    result = sub_23850464C(v8 + 8 * *(_QWORD *)(v8 + 16) + 32, (*(_QWORD *)(v8 + 24) >> 1) - *(_QWORD *)(v8 + 16), a1);
    if (v11 >= v3)
      break;
LABEL_24:
    __break(1u);
LABEL_25:
    swift_bridgeObjectRetain();
    v9 = sub_238506DB8();
    swift_bridgeObjectRelease();
  }
  if (v11 < 1)
    goto LABEL_19;
  v12 = *(_QWORD *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  v13 = __OFADD__(v12, v11);
  v14 = v12 + v11;
  if (!v13)
  {
    *(_QWORD *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10) = v14;
LABEL_19:
    swift_bridgeObjectRelease();
    return sub_238506BE4();
  }
  __break(1u);
  return result;
}

uint64_t sub_238500418(unint64_t a1)
{
  unint64_t *v1;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int isUniquelyReferenced_nonNull_bridgeObject;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;

  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    v3 = sub_238506DB8();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v4 = *v1;
  if (*v1 >> 62)
  {
    swift_bridgeObjectRetain();
    v5 = sub_238506DB8();
    swift_bridgeObjectRelease();
    v6 = v5 + v3;
    if (!__OFADD__(v5, v3))
      goto LABEL_5;
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  v5 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
  v6 = v5 + v3;
  if (__OFADD__(v5, v3))
    goto LABEL_23;
LABEL_5:
  v4 = *v1;
  isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *v1 = v4;
  v5 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v4 & 0x8000000000000000) == 0 && (v4 & 0x4000000000000000) == 0)
  {
    v8 = v4 & 0xFFFFFFFFFFFFFF8;
    if (v6 <= *(_QWORD *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      goto LABEL_15;
    v5 = 1;
  }
  if (v4 >> 62)
    goto LABEL_25;
  v9 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    if (v9 <= v6)
      v9 = v6;
    swift_bridgeObjectRetain();
    v4 = MEMORY[0x23B8372AC](v5, v9, 1, v4);
    swift_bridgeObjectRelease();
    *v1 = v4;
    v8 = v4 & 0xFFFFFFFFFFFFFF8;
LABEL_15:
    result = sub_23850485C(v8 + 8 * *(_QWORD *)(v8 + 16) + 32, (*(_QWORD *)(v8 + 24) >> 1) - *(_QWORD *)(v8 + 16), a1);
    if (v11 >= v3)
      break;
LABEL_24:
    __break(1u);
LABEL_25:
    swift_bridgeObjectRetain();
    v9 = sub_238506DB8();
    swift_bridgeObjectRelease();
  }
  if (v11 < 1)
    goto LABEL_19;
  v12 = *(_QWORD *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  v13 = __OFADD__(v12, v11);
  v14 = v12 + v11;
  if (!v13)
  {
    *(_QWORD *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10) = v14;
LABEL_19:
    swift_bridgeObjectRelease();
    return sub_238506BE4();
  }
  __break(1u);
  return result;
}

uint64_t sub_2385005D0(uint64_t *a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  id v14;
  id v15;
  unint64_t v16;
  unint64_t v17;
  void *v18;
  id v19;
  void *v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  _QWORD *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  uint64_t v31;
  char v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  unint64_t v41;
  unint64_t v42;
  uint64_t result;
  id v44;
  id v45;
  id v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  _QWORD v51[3];
  uint64_t v52;
  char *v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;
  char *v57;
  uint64_t v58;
  uint64_t v59;
  unint64_t v60;
  id v61;
  int v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  _QWORD *v67;
  unint64_t v68;
  unint64_t v69;
  unint64_t v70;
  id v71;
  uint64_t v72;
  int v73;
  uint64_t v74;
  uint64_t v75;
  unint64_t v76;
  unint64_t v77;
  uint64_t v78;
  unint64_t v79;
  uint64_t v80;
  _QWORD v81[9];
  id v82[9];
  _OWORD v83[2];
  __int128 v84;
  __int128 v85;
  uint64_t v86;
  _OWORD v87[4];
  uint64_t v88;
  char v89[8];
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  unint64_t v93;
  unint64_t v94;
  unint64_t v95;
  unint64_t v96;
  unint64_t v97;
  unint64_t v98;

  v2 = (_QWORD *)a2;
  sub_2385068C0(a2, (uint64_t)v81);
  v51[2] = v81[0];
  v52 = v81[1];
  v61 = (id)v81[3];
  v4 = sub_238506B3C();
  v55 = *(_QWORD *)(v4 - 8);
  v56 = v4;
  v5 = MEMORY[0x24BDAC7A8](v4);
  v54 = (char *)v51 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v53 = (char *)v51 - v7;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256916908);
  v58 = *(_QWORD *)(v8 - 8);
  v59 = v8;
  MEMORY[0x24BDAC7A8](v8);
  v57 = (char *)v51 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v79 = MEMORY[0x24BEE4AF8];
  v80 = MEMORY[0x24BEE4AF8];
  v78 = MEMORY[0x24BEE4AF8];
  v89[0] = 0;
  v92 = 0;
  v93 = 0xD000000000000029;
  v94 = 0x8000000238508970;
  v95 = 0xD000000000000010;
  v96 = 0x80000002385089A0;
  v97 = 0xD000000000000020;
  v98 = 0x80000002385089C0;
  v51[1] = a1;
  v10 = *a1;
  v11 = (unint64_t)*a1 >> 62;
  v90 = 0;
  v91 = 0;
  if (v11)
    goto LABEL_61;
  v12 = *(_QWORD *)((v10 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (v12)
  {
    while (1)
    {
      v62 = 0;
      v13 = 0;
      v72 = OBJC_IVAR____TtC23ControlCenterUIServices22ControlsGalleryManager_extensionProvider;
      v67 = v2;
      v68 = v10 & 0xC000000000000001;
      v63 = v10 + 32;
      v64 = v10 & 0xFFFFFFFFFFFFFF8;
      v60 = -1;
      v65 = v12;
      v66 = v10;
      while (1)
      {
        if (v68)
        {
          v14 = (id)MEMORY[0x23B8372A0](v13, v10);
        }
        else
        {
          if (v13 >= *(_QWORD *)(v64 + 16))
            goto LABEL_60;
          v14 = *(id *)(v63 + 8 * v13);
        }
        v71 = v14;
        if (__OFADD__(v13, 1))
          goto LABEL_58;
        v69 = v13;
        v70 = v13 + 1;
        v15 = objc_msgSend(v71, sel_widgetDescriptors);
        __swift_instantiateConcreteTypeFromMangledName(&qword_2569168E0);
        v16 = sub_238506BD8();

        v17 = v16 >> 62;
        v76 = v16;
        if (!(v16 >> 62))
          break;
        swift_bridgeObjectRetain();
        v33 = sub_238506DB8();
        swift_bridgeObjectRelease();
        v74 = v33;
        if (v33 < 1)
        {
          v73 = 0;
          goto LABEL_21;
        }
        v16 = v76;
        if ((v76 & 0xC000000000000001) != 0)
        {
LABEL_54:
          MEMORY[0x23B8372A0](0, v16);
          goto LABEL_16;
        }
LABEL_14:
        if (!*(_QWORD *)((v16 & 0xFFFFFFFFFFFFF8) + 0x10))
          goto LABEL_59;
        swift_unknownObjectRetain();
LABEL_16:
        objc_opt_self();
        v18 = (void *)swift_dynamicCastObjCClass();
        if (v18 && (v19 = objc_msgSend(v18, sel_containerBundleIdentifier)) != 0)
        {
          v20 = v19;
          sub_238506B6C();

          v73 = sub_238506BA8();
          swift_unknownObjectRelease();
          swift_bridgeObjectRelease();
          if (!v17)
            goto LABEL_24;
        }
        else
        {
          swift_unknownObjectRelease();
          v73 = 0;
          if (!v17)
            goto LABEL_24;
        }
LABEL_21:
        v21 = v76;
        swift_bridgeObjectRetain();
        v22 = sub_238506DB8();
        if (v22)
          goto LABEL_25;
LABEL_5:

        swift_bridgeObjectRelease_n();
        v13 = v70;
        if (v70 == v12)
          goto LABEL_63;
      }
      v74 = *(_QWORD *)((v16 & 0xFFFFFFFFFFFFF8) + 0x10);
      if (v74)
        break;
      v74 = 0;
      v73 = 0;
LABEL_24:
      v21 = v76;
      v22 = *(_QWORD *)((v76 & 0xFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      if (!v22)
        goto LABEL_5;
LABEL_25:
      v23 = 0;
      v77 = v21 & 0xC000000000000001;
      v75 = v21 & 0xFFFFFFFFFFFFFF8;
      while (1)
      {
        if (v77)
        {
          v10 = MEMORY[0x23B8372A0](v23, v21);
          v24 = (_QWORD *)(v23 + 1);
          if (__OFADD__(v23, 1))
            break;
          goto LABEL_34;
        }
        if (v23 >= *(_QWORD *)(v75 + 16))
          goto LABEL_57;
        v10 = *(_QWORD *)(v21 + 8 * v23 + 32);
        swift_unknownObjectRetain();
        v24 = (_QWORD *)(v23 + 1);
        if (__OFADD__(v23, 1))
          break;
LABEL_34:
        v2 = (_QWORD *)v22;
        objc_opt_self();
        v25 = swift_dynamicCastObjCClass();
        if (v25)
        {
          v26 = (void *)v25;
          swift_unknownObjectRetain();
          v27 = CHSWidgetExtensionProvider.controlDescriptor(for:)(v26);
          if (!v27)
          {
            swift_unknownObjectRelease_n();
LABEL_45:
            v21 = v76;
            goto LABEL_27;
          }
          v28 = v27;
          v29 = objc_msgSend(v27, sel_actionMetadata);
          if (!v29)
          {

            swift_unknownObjectRelease_n();
            goto LABEL_45;
          }
          v30 = v29;
          if ((objc_msgSend(v29, sel_isCameraCapture) & 1) == 0)
          {
            swift_unknownObjectRelease_n();

            goto LABEL_45;
          }
          v31 = swift_unknownObjectRetain();
          if ((v73 & 1) != 0)
          {
            MEMORY[0x23B83712C](v31);
            if (*(_QWORD *)((v79 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v79 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
              sub_238506BF0();
          }
          else
          {
            MEMORY[0x23B83712C](v31);
            if (*(_QWORD *)((v78 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v78 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
              sub_238506BF0();
          }
          sub_238506BFC();
          sub_238506BE4();
          swift_unknownObjectRetain();
          v32 = sub_238505680(v26, (uint64_t)v89);

          swift_unknownObjectRelease_n();
          v21 = v76;
          if (v74 != 1 || (v32 & 1) == 0)
            goto LABEL_27;
          v62 = 1;
          v60 = v69;
          v23 = (unint64_t)v24;
          v22 = (uint64_t)v2;
          if (v24 == v2)
          {
            v60 = v69;
LABEL_4:
            v10 = v66;
            v2 = v67;
            v12 = v65;
            goto LABEL_5;
          }
        }
        else
        {
          swift_unknownObjectRelease();
LABEL_27:
          ++v23;
          v22 = (uint64_t)v2;
          if (v24 == v2)
            goto LABEL_4;
        }
      }
      __break(1u);
LABEL_57:
      __break(1u);
LABEL_58:
      __break(1u);
LABEL_59:
      __break(1u);
LABEL_60:
      __break(1u);
LABEL_61:
      swift_bridgeObjectRetain();
      v12 = sub_238506DB8();
      if (!v12)
        goto LABEL_62;
    }
    if ((v16 & 0xC000000000000001) != 0)
      goto LABEL_54;
    goto LABEL_14;
  }
LABEL_62:
  v62 = 0;
  v60 = -1;
LABEL_63:
  swift_bridgeObjectRelease();
  sub_2385068C0((uint64_t)v2, (uint64_t)v83);
  if ((_QWORD)v84)
  {
    v87[2] = v84;
    v87[3] = v85;
    v88 = v86;
    v87[0] = v83[0];
    v87[1] = v83[1];
    v34 = v79;
    sub_238506998(v2, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_238506930);
    v35 = sub_238504C38(v34, (uint64_t)v87);
    sub_238506998(v2, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_2385069E0);
    swift_bridgeObjectRelease();
    v79 = v35;
  }
  swift_getKeyPath();
  v36 = v53;
  sub_238506B30();
  v37 = v55;
  v38 = v56;
  (*(void (**)(char *, char *, uint64_t))(v55 + 16))(v54, v36, v56);
  v39 = v57;
  sub_238506A64();
  (*(void (**)(char *, uint64_t))(v37 + 8))(v36, v38);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256916910);
  sub_2384FB288(&qword_256916918, &qword_256916910, MEMORY[0x24BEE12B8]);
  sub_2384FB288(&qword_256916920, &qword_256916910, MEMORY[0x24BEE12D8]);
  sub_2384FB288(&qword_256916928, &qword_256916908, MEMORY[0x24BDCBF20]);
  v40 = v59;
  sub_238506B24();
  (*(void (**)(char *, uint64_t))(v58 + 8))(v39, v40);
  v41 = swift_bridgeObjectRetain();
  sub_238500260(v41);
  v42 = swift_bridgeObjectRetain();
  sub_238500260(v42);
  if ((v62 & 1) != 0)

  result = sub_2385068C0((uint64_t)v2, (uint64_t)v82);
  if (!v82[4])
  {
    __break(1u);
    goto LABEL_72;
  }
  if (!v61)
  {
LABEL_72:
    __break(1u);
    goto LABEL_73;
  }
  if (v52)
  {
    v44 = v82[2];
    v45 = v61;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v46 = objc_allocWithZone(MEMORY[0x24BEB08A8]);
    v47 = (void *)sub_238506B48();
    swift_bridgeObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2569168E0);
    v48 = (void *)sub_238506BCC();
    swift_bridgeObjectRelease();
    v49 = (void *)sub_238506B48();
    v50 = objc_msgSend(v46, sel_initWithCustomImage_iconBackgroundColor_displayName_galleryItems_vendorName_, v44, v45, v47, v48, v49);

    return (uint64_t)v50;
  }
LABEL_73:
  __break(1u);
  return result;
}

void sub_238500F20(id *a1@<X0>, SEL *a2@<X3>, uint64_t *a3@<X8>)
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = objc_msgSend(*a1, *a2);
  if (v4)
  {
    v5 = v4;
    v6 = sub_238506B6C();
    v8 = v7;

  }
  else
  {
    v6 = 0;
    v8 = 0;
  }
  *a3 = v6;
  a3[1] = v8;
}

void sub_238500F80(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  id v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  unint64_t v18;
  unint64_t v19;
  char *v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  id v33;
  void *v34;
  uint64_t v35;
  unint64_t v36;
  id v37;
  char v38[8];
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  void *v43;
  _QWORD *v44;

  v3 = MEMORY[0x23B837864](v1 + OBJC_IVAR____TtC23ControlCenterUIServices22ControlsGalleryManager_controlsGalleryViewController);
  if (!v3)
    goto LABEL_16;
  v4 = (void *)v3;
  v5 = *(id *)(v3 + OBJC_IVAR___CCUISControlsGalleryViewController_configuration);
  v6 = objc_msgSend(v5, sel_suggestedControls);
  if (!v6)
  {

LABEL_16:
    v21 = objc_msgSend((id)objc_opt_self(), sel_systemPinkColor);
    v22 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD1880]), sel_init);
    v23 = objc_msgSend(v22, sel_UUIDString);

    v24 = sub_238506B6C();
    v26 = v25;
    v11 = &unk_250A32FA0;
LABEL_21:

    *(_OWORD *)a1 = xmmword_2385084A0;
    *(_QWORD *)(a1 + 16) = 0;
    *(_QWORD *)(a1 + 24) = v21;
    *(_QWORD *)(a1 + 32) = v11;
    *(_QWORD *)(a1 + 40) = 0;
    *(_QWORD *)(a1 + 48) = 0;
    *(_QWORD *)(a1 + 56) = v24;
    *(_QWORD *)(a1 + 64) = v26;
    return;
  }
  v7 = v6;
  type metadata accessor for CCUISConfiguredControl();
  v8 = sub_238506BD8();

  if (v8 >> 62)
    goto LABEL_18;
  v9 = *(_QWORD *)((v8 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (!v9)
  {
LABEL_19:
    swift_bridgeObjectRelease();
    v11 = (_QWORD *)MEMORY[0x24BEE4AF8];
LABEL_20:
    v27 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD1880]), sel_init);
    v23 = objc_msgSend(v27, sel_UUIDString);

    v24 = sub_238506B6C();
    v26 = v28;

    v21 = 0;
    goto LABEL_21;
  }
  while (1)
  {
    v44 = (_QWORD *)MEMORY[0x24BEE4AF8];
    sub_238504434(0, v9 & ~(v9 >> 63), 0);
    if (v9 < 0)
      break;
    v33 = v5;
    v34 = v4;
    v10 = 0;
    v11 = v44;
    v35 = a1;
    v36 = v8 & 0xC000000000000001;
    v5 = (id)v8;
    while (v9 != v10)
    {
      if (v36)
        v12 = (id)MEMORY[0x23B8372A0](v10, v8);
      else
        v12 = *(id *)(v8 + 8 * v10 + 32);
      v13 = v12;
      v37 = v12;
      sub_2385012A4(&v37, (uint64_t)v38);

      a1 = v38[0];
      v14 = v39;
      v15 = v40;
      v16 = v41;
      v17 = v42;
      v4 = v43;
      v44 = v11;
      v19 = v11[2];
      v18 = v11[3];
      if (v19 >= v18 >> 1)
      {
        v31 = v40;
        v32 = v39;
        v29 = v42;
        v30 = v41;
        sub_238504434(v18 > 1, v19 + 1, 1);
        v17 = v29;
        v16 = v30;
        v15 = v31;
        v14 = v32;
        v11 = v44;
      }
      v11[2] = v19 + 1;
      v20 = (char *)&v11[10 * v19];
      v20[32] = a1;
      ++v10;
      *(_OWORD *)(v20 + 40) = v14;
      *(_OWORD *)(v20 + 56) = v15;
      *(_OWORD *)(v20 + 72) = v16;
      *(_OWORD *)(v20 + 88) = v17;
      *((_QWORD *)v20 + 13) = v4;
      v8 = (unint64_t)v5;
      if (v9 == v10)
      {
        swift_bridgeObjectRelease();
        v4 = v34;
        a1 = v35;
        v5 = v33;
        goto LABEL_20;
      }
    }
    __break(1u);
LABEL_18:
    swift_bridgeObjectRetain();
    v9 = sub_238506DB8();
    swift_bridgeObjectRelease();
    if (!v9)
      goto LABEL_19;
  }
  __break(1u);
}

void sub_2385012A4(id *a1@<X0>, uint64_t a2@<X8>)
{
  id v3;
  unint64_t v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  char *v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v3 = *a1;
  v4 = (unint64_t)objc_msgSend(*a1, sel_size) - 1;
  if (v4 > 2)
    v5 = objc_msgSend(v3, sel_identity, 0);
  else
    v5 = objc_msgSend(v3, sel_identity, qword_2385085A0[v4]);
  v6 = v5;
  v7 = objc_msgSend(v6, sel_extensionIdentity);

  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2542CEBA0);
  v8 = sub_238506AC4();
  v10 = v9;
  swift_endAccess();

  v11 = objc_msgSend(v3, sel_identity);
  v12 = (char *)objc_msgSend(v11, sel_extensionIdentity);

  v13 = &v12[*MEMORY[0x24BE16900]];
  swift_beginAccess();
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542CEB80);
  v15 = 0;
  v16 = 0;
  if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 48))(v13, 1, v14))
  {
    v15 = sub_238506AC4();
    v16 = v17;
  }
  swift_endAccess();

  v18 = objc_msgSend(v3, sel_identity);
  v19 = objc_msgSend(v18, sel_kind);

  v20 = sub_238506B6C();
  v22 = v21;

  *(_BYTE *)a2 = 0;
  *(_QWORD *)(a2 + 8) = v23;
  *(_QWORD *)(a2 + 16) = 0;
  *(_QWORD *)(a2 + 24) = 0;
  *(_QWORD *)(a2 + 32) = v8;
  *(_QWORD *)(a2 + 40) = v10;
  *(_QWORD *)(a2 + 48) = v15;
  *(_QWORD *)(a2 + 56) = v16;
  *(_QWORD *)(a2 + 64) = v20;
  *(_QWORD *)(a2 + 72) = v22;
}

id sub_2385014B8(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  char *v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  id v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;

  v2 = v1;
  v4 = (char *)objc_msgSend(a1, sel_extensionIdentity);
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2542CEBA0);
  sub_238506AC4();
  swift_endAccess();
  v5 = &v4[*MEMORY[0x24BE16900]];
  swift_beginAccess();
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542CEB80);
  v7 = 0;
  v8 = 0;
  if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 48))(v5, 1, v6))
  {
    v7 = sub_238506AC4();
    v8 = v9;
  }
  swift_endAccess();
  v10 = objc_msgSend(a1, sel_kind);
  sub_238506B6C();

  v11 = objc_msgSend(a1, sel_controlType);
  swift_bridgeObjectRetain();
  v12 = (void *)sub_238506B48();
  swift_bridgeObjectRelease();
  v13 = (void *)sub_238506B48();
  swift_bridgeObjectRelease();
  if (v8)
  {
    v14 = (void *)sub_238506B48();
    swift_bridgeObjectRelease();
  }
  else
  {
    v14 = 0;
  }
  v15 = objc_msgSend(objc_allocWithZone((Class)CCUIControlIconElement), sel_initWithKind_controlType_extensionBundleIdentifier_containerBundleIdentifier_, v12, v11, v13, v14);

  v16 = MEMORY[0x23B837864](v2 + OBJC_IVAR____TtC23ControlCenterUIServices22ControlsGalleryManager_controlsGalleryViewController);
  if (v16)
  {
    v17 = (void *)v16;
    v18 = *(id *)(v16 + OBJC_IVAR___CCUISControlsGalleryViewController_configuration);
    v19 = (char *)objc_msgSend(a1, sel_preferredControlSize);
    v20 = CCUISControlsGalleryConfiguration.allowedControlSizes.getter();
    if (!v20)
      goto LABEL_13;
    v21 = v20;
    if (*(_QWORD *)(v20 + 16) && (sub_2384FEB38((uint64_t)v19, v20) & 1) == 0)
      v19 = *(char **)(v21 + 32);
    swift_bridgeObjectRelease();
    if ((unint64_t)(v19 - 1) < 3)
      v22 = qword_2385085A0[(_QWORD)(v19 - 1)];
    else
LABEL_13:
      v22 = 0;
    v23 = objc_msgSend((id)objc_opt_self(), sel_sharedApplication);
    v24 = objc_msgSend(v23, sel_preferredContentSizeCategory);

    LOBYTE(v23) = sub_238506C68();
    objc_msgSend(v15, sel_setPreferredGallerySizeClass_, CCUIAdjustGridSizeClassForAccessibility(v22, v23 & 1));

  }
  sub_238501810(a1, v7, v8);
  v26 = v25;
  swift_bridgeObjectRelease();
  if (v26)
  {
    v27 = (void *)sub_238506B48();
    swift_bridgeObjectRelease();
  }
  else
  {
    v27 = 0;
  }
  objc_msgSend(v15, sel_setDisplayName_, v27);

  return v15;
}

uint64_t sub_238501810(void *a1, uint64_t a2, uint64_t a3)
{
  id v5;
  id v6;
  id v7;
  void *v9;

  v5 = objc_msgSend(a1, sel_displayName);
  if (v5)
  {
    v6 = v5;
    a2 = sub_238506B6C();
  }
  else
  {
    if (!a3)
      return a2;
    sub_2384F5DDC(0, (unint64_t *)&unk_256916600);
    swift_bridgeObjectRetain();
    v7 = sub_2384F5798(a2, a3, 1);
    v9 = v7;
    if (!v7)
      return 0;
    v6 = objc_msgSend(v7, sel_localizedName);
    a2 = sub_238506B6C();

  }
  return a2;
}

id sub_238501904(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  __int128 *v7;
  __int128 v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char v37;
  id v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  char v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  char v50;
  unint64_t v51;
  id v52;
  id v53;
  id v54;
  id v55;
  uint64_t v56;
  void *v57;
  id v58;
  id v59;
  id v60;
  void *v61;
  void *v62;
  id v63;
  uint64_t v64;
  id v65;
  id v66;
  void *v67;
  void *v68;
  void *v69;
  id v70;
  void *v71;
  uint64_t v72;
  id v73;
  id v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  id v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  id v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  uint64_t v96;
  _QWORD v97[2];

  v3 = *(_QWORD *)(a3 + 16);
  if (!v3)
    return 0;
  v5 = a3 + 32;
  swift_bridgeObjectRetain();
  v6 = 0;
  v81 = v5;
  v82 = v3;
  while (1)
  {
    v7 = (__int128 *)(v5 + 72 * v6);
    v96 = *((_QWORD *)v7 + 8);
    v8 = v7[3];
    v94 = v7[2];
    v95 = v8;
    v9 = v7[1];
    v92 = *v7;
    v93 = v9;
    v10 = v94;
    v97[0] = v94;
    v11 = *(_QWORD *)(v94 + 16);
    if (v11)
      break;
LABEL_4:
    if (++v6 == v3)
    {
      swift_bridgeObjectRelease();
      return 0;
    }
  }
  v84 = v6;
  v83 = v95;
  v12 = v93;
  sub_2385067F8((uint64_t)&v92);
  sub_2385067D0((uint64_t)v97);
  v13 = (_QWORD *)(v10 + 56);
  while (1)
  {
    v14 = *(v13 - 2);
    v15 = *v13;
    v16 = v13[2];
    v17 = v13[4];
    v18 = v13[6];
    if (*((_BYTE *)v13 - 24) == 1)
    {
      v89 = *(v13 - 1);
      objc_opt_self();
      v19 = swift_dynamicCastObjCClass();
      if (v19)
      {
        v20 = (void *)v19;
        v88 = v14;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_unknownObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v21 = a1;
        v22 = objc_msgSend(v20, sel_moduleIdentifier);
        v23 = sub_238506B6C();
        v25 = v24;

        if (v15)
        {
          if (v89 == v23 && v15 == v25)
          {
            v51 = a2;
            v31 = v21;
LABEL_49:
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_unknownObjectRelease();
            goto LABEL_51;
          }
          v27 = sub_238506E18();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          a1 = v21;
          swift_unknownObjectRelease();
          if ((v27 & 1) != 0)
          {
            v51 = a2;
            v31 = v21;
            goto LABEL_51;
          }
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
        }
        else
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_unknownObjectRelease();
          a1 = v21;
        }
      }
      goto LABEL_8;
    }
    v90 = v13[1];
    v86 = v13[3];
    v28 = v13[5];
    objc_opt_self();
    v29 = swift_dynamicCastObjCClass();
    if (!v29)
      goto LABEL_8;
    v30 = (void *)v29;
    v85 = v28;
    v88 = v14;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_unknownObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v87 = v30;
    v31 = a1;
    v32 = objc_msgSend(v30, sel_extensionBundleIdentifier);
    v33 = sub_238506B6C();
    v35 = v34;

    if (!v16)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_unknownObjectRelease();
LABEL_44:
      swift_bridgeObjectRelease();
      a1 = v31;
      goto LABEL_8;
    }
    if (v90 == v33 && v16 == v35)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    else
    {
      v37 = sub_238506E18();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v37 & 1) == 0)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_unknownObjectRelease();
        goto LABEL_8;
      }
    }
    v31 = a1;
    swift_bridgeObjectRetain();
    v38 = objc_msgSend(v87, sel_containerBundleIdentifier);
    if (!v38)
    {
      v43 = v87;
      if (!v17)
        goto LABEL_39;
      goto LABEL_35;
    }
    v39 = v38;
    v40 = sub_238506B6C();
    v42 = v41;

    if (v17)
      break;
    v43 = v87;
    if (!v42)
      goto LABEL_39;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_unknownObjectRelease();
    a1 = v31;
    swift_bridgeObjectRelease();
LABEL_8:
    v13 += 10;
    if (!--v11)
    {
      sub_2385067A8((uint64_t)v97);
      sub_23850685C((uint64_t)&v92);
      v5 = v81;
      v3 = v82;
      v6 = v84;
      goto LABEL_4;
    }
  }
  v43 = v87;
  if (!v42)
  {
LABEL_35:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    a1 = v31;
    swift_unknownObjectRelease();
    swift_bridgeObjectRelease_n();
    goto LABEL_8;
  }
  if (v86 == v40 && v17 == v42)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_39;
  }
  v44 = sub_238506E18();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v44 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_47;
  }
LABEL_39:
  swift_bridgeObjectRetain();
  v45 = objc_msgSend(v43, sel_kind);
  v46 = sub_238506B6C();
  v47 = v18;
  v49 = v48;

  if (!v47)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
LABEL_47:
    swift_bridgeObjectRelease();
    a1 = v31;
    swift_unknownObjectRelease();
    goto LABEL_8;
  }
  if (v85 == v46 && v47 == v49)
  {
    v51 = a2;
    goto LABEL_49;
  }
  v50 = sub_238506E18();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  if ((v50 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_44;
  }
  v51 = a2;
LABEL_51:
  sub_2385067A8((uint64_t)v97);
  v52 = sub_238502D38(v31, v88);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_2385067F8((uint64_t)&v92);
  v53 = sub_2385051F4(v51, (uint64_t)&v92);
  sub_23850685C((uint64_t)&v92);
  swift_bridgeObjectRelease();
  if (v53)
  {
    swift_unknownObjectRetain();
    v54 = v53;
    v55 = objc_msgSend(v54, sel_widgetDescriptors);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2569168E0);
    v56 = sub_238506BD8();

    MEMORY[0x23B83712C]();
    if (*(_QWORD *)((v56 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v56 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      sub_238506BF0();
    sub_238506BFC();
    sub_238506BE4();
    v57 = (void *)sub_238506BCC();
    swift_bridgeObjectRelease();
    objc_msgSend(v54, sel_setWidgetDescriptors_, v57);
    swift_unknownObjectRelease();
    sub_23850685C((uint64_t)&v92);

  }
  else
  {
    if (v83)
    {
      v58 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD1880]), sel_init);
      v59 = objc_msgSend(v58, sel_UUIDString);

      sub_238506B6C();
      v60 = objc_allocWithZone(MEMORY[0x24BEB0968]);
      swift_bridgeObjectRetain();
      v61 = (void *)sub_238506B48();
      swift_bridgeObjectRelease();
      v62 = (void *)sub_238506B48();
      swift_bridgeObjectRelease();
      v63 = objc_msgSend(v60, sel_initWithLeafIdentifier_applicationBundleID_, v61, v62);

      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2569168E8);
      v64 = swift_allocObject();
      *(_OWORD *)(v64 + 16) = xmmword_238508490;
      *(_QWORD *)(v64 + 32) = v52;
      sub_238506BE4();
      v65 = objc_allocWithZone(MEMORY[0x24BEB08A8]);
      v66 = v63;
      swift_unknownObjectRetain();
      swift_bridgeObjectRetain();
      __swift_instantiateConcreteTypeFromMangledName(&qword_2569168E0);
      v67 = (void *)sub_238506BCC();
      swift_bridgeObjectRelease();
      v68 = (void *)sub_238506B48();
      v69 = (void *)sub_238506B48();
      swift_bridgeObjectRelease();
      v53 = objc_msgSend(v65, sel_initWithIcon_galleryItems_vendorName_uniqueIdentifier_, v66, v67, v68, v69);
      swift_unknownObjectRelease();

    }
    else
    {
      if (*((_QWORD *)&v12 + 1))
      {
        v91 = (id)v12;
        v70 = (id)*((_QWORD *)&v12 + 1);
      }
      else
      {
        v71 = (void *)objc_opt_self();
        v91 = (id)v12;
        v70 = objc_msgSend(v71, sel_systemPinkColor);
      }
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2569168E8);
      v72 = swift_allocObject();
      *(_OWORD *)(v72 + 16) = xmmword_238508490;
      *(_QWORD *)(v72 + 32) = v52;
      sub_238506BE4();
      v73 = objc_allocWithZone(MEMORY[0x24BEB08A8]);
      swift_unknownObjectRetain();
      swift_bridgeObjectRetain();
      v74 = *((id *)&v12 + 1);
      swift_bridgeObjectRetain();
      v75 = (void *)sub_238506B48();
      swift_bridgeObjectRelease();
      __swift_instantiateConcreteTypeFromMangledName(&qword_2569168E0);
      v76 = (void *)sub_238506BCC();
      swift_bridgeObjectRelease();
      v77 = (void *)sub_238506B48();
      v78 = (void *)sub_238506B48();
      swift_bridgeObjectRelease();
      v53 = objc_msgSend(v73, sel_initWithCustomImage_iconBackgroundColor_displayName_galleryItems_vendorName_uniqueIdentifier_, v91, v70, v75, v76, v77, v78);
      swift_unknownObjectRelease();

    }
    sub_23850685C((uint64_t)&v92);
  }
  return v53;
}

id sub_238502460(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  id v7;
  BOOL v8;
  unint64_t v9;
  id v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char v38;
  id v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char v49;
  uint64_t v50;
  unint64_t v51;
  id v52;
  id v53;
  void *v54;
  void *v55;
  void *v56;
  id v57;
  uint64_t v60;
  unint64_t v62;
  id v63;
  unint64_t v64;
  uint64_t v65;
  uint64_t v66;
  unint64_t v67;
  uint64_t v68;
  uint64_t v69;
  unint64_t v70;
  unint64_t v71;
  uint64_t v72;
  void *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  unint64_t v79;
  _QWORD v80[2];

  v79 = MEMORY[0x24BEE4AF8];
  if (a2 >> 62)
    goto LABEL_79;
  v2 = *(_QWORD *)((a2 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  v3 = v2;
  if (!v2)
  {
LABEL_80:
    swift_bridgeObjectRelease();
    v51 = MEMORY[0x24BEE4AF8];
    goto LABEL_81;
  }
LABEL_3:
  v4 = 0;
  v5 = a2;
  v60 = v3;
  do
  {
    if ((a2 & 0xC000000000000001) != 0)
    {
      v6 = v4;
      v7 = (id)MEMORY[0x23B8372A0](v4, v5);
    }
    else
    {
      if (v4 >= *(_QWORD *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10))
        goto LABEL_78;
      v6 = v4;
      v7 = *(id *)(a2 + 32 + 8 * v4);
    }
    v63 = v7;
    v8 = __OFADD__(v6, 1);
    v9 = v6 + 1;
    if (v8)
      goto LABEL_77;
    v62 = v9;
    v10 = objc_msgSend(v7, sel_widgetDescriptors);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2569168E0);
    v11 = sub_238506BD8();

    if (v11 >> 62)
    {
      swift_bridgeObjectRetain();
      v12 = sub_238506DB8();
      swift_bridgeObjectRelease();
      if (!v12)
        goto LABEL_4;
LABEL_12:
      v13 = 0;
      v80[0] = *(_QWORD *)(a1 + 32);
      v14 = *(_QWORD *)(v80[0] + 16);
      v70 = v11 & 0xC000000000000001;
      v64 = v11 + 32;
      v65 = v11 & 0xFFFFFFFFFFFFFF8;
      v68 = v14;
      v69 = v80[0] + 56;
      v66 = v12;
      v67 = v11;
LABEL_16:
      if (v70)
      {
        v15 = MEMORY[0x23B8372A0](v13, v11);
        v8 = __OFADD__(v13++, 1);
        if (v8)
          goto LABEL_75;
      }
      else
      {
        if (v13 >= *(_QWORD *)(v65 + 16))
          goto LABEL_76;
        v15 = *(_QWORD *)(v64 + 8 * v13);
        swift_unknownObjectRetain();
        v8 = __OFADD__(v13++, 1);
        if (v8)
        {
LABEL_75:
          __break(1u);
LABEL_76:
          __break(1u);
LABEL_77:
          __break(1u);
LABEL_78:
          __break(1u);
LABEL_79:
          swift_bridgeObjectRetain();
          v3 = sub_238506DB8();
          if (!v3)
            goto LABEL_80;
          goto LABEL_3;
        }
      }
      if (!v14)
        goto LABEL_15;
      v71 = v13;
      swift_bridgeObjectRetain();
      v16 = (_QWORD *)v69;
      while (1)
      {
        v17 = *(v16 - 2);
        v18 = *v16;
        v19 = v16[2];
        v20 = v16[4];
        v21 = v16[6];
        if (*((_BYTE *)v16 - 24) == 1)
        {
          v75 = *(v16 - 1);
          objc_opt_self();
          v22 = swift_dynamicCastObjCClass();
          if (v22)
          {
            v23 = (void *)v22;
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            swift_unknownObjectRetain();
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            v24 = objc_msgSend(v23, sel_moduleIdentifier);
            v25 = sub_238506B6C();
            v27 = v26;

            if (!v18)
              goto LABEL_44;
            if (v75 == v25 && v18 == v27)
            {
              v12 = v66;
              v11 = v67;
LABEL_66:
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              swift_unknownObjectRelease();
              goto LABEL_68;
            }
            v29 = sub_238506E18();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_unknownObjectRelease();
            if ((v29 & 1) != 0)
              goto LABEL_67;
            goto LABEL_34;
          }
        }
        else
        {
          v74 = v16[3];
          v76 = v16[1];
          v30 = v16[5];
          objc_opt_self();
          v31 = swift_dynamicCastObjCClass();
          if (!v31)
            goto LABEL_25;
          v32 = (void *)v31;
          v72 = v30;
          v78 = v17;
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_unknownObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          v73 = v32;
          v33 = objc_msgSend(v32, sel_extensionBundleIdentifier);
          v34 = sub_238506B6C();
          v36 = v35;

          if (v19)
          {
            v77 = v21;
            if (v76 == v34 && v19 == v36)
            {
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
            }
            else
            {
              v38 = sub_238506E18();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              if ((v38 & 1) == 0)
                goto LABEL_43;
            }
            swift_bridgeObjectRetain();
            v39 = objc_msgSend(v73, sel_containerBundleIdentifier);
            if (!v39)
            {
              v17 = v78;
              if (v20)
              {
LABEL_54:
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                swift_unknownObjectRelease();
                swift_bridgeObjectRelease_n();
                goto LABEL_25;
              }
              goto LABEL_58;
            }
            v40 = v39;
            v41 = sub_238506B6C();
            v43 = v42;

            v17 = v78;
            if (v20)
            {
              if (!v43)
                goto LABEL_54;
              if (v74 == v41 && v20 == v43)
              {
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
              }
              else
              {
                v44 = sub_238506E18();
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                if ((v44 & 1) == 0)
                {
LABEL_43:
                  swift_bridgeObjectRelease();
                  swift_bridgeObjectRelease();
                  swift_bridgeObjectRelease();
LABEL_45:
                  swift_bridgeObjectRelease();
                  swift_unknownObjectRelease();
                  goto LABEL_25;
                }
              }
LABEL_58:
              swift_bridgeObjectRetain();
              v45 = objc_msgSend(v73, sel_kind);
              v46 = sub_238506B6C();
              v48 = v47;

              if (!v77)
              {
LABEL_44:
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                goto LABEL_45;
              }
              if (v72 == v46 && v77 == v48)
              {
                v12 = v66;
                v11 = v67;
                goto LABEL_66;
              }
              v49 = sub_238506E18();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              swift_unknownObjectRelease();
              if ((v49 & 1) != 0)
              {
LABEL_67:
                v12 = v66;
                v11 = v67;
LABEL_68:
                sub_2385067A8((uint64_t)v80);
                sub_238502D38(v15, v17);
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                v50 = swift_unknownObjectRetain();
                MEMORY[0x23B83712C](v50);
                if (*(_QWORD *)((v79 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v79 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
                  sub_238506BF0();
                sub_238506BFC();
                sub_238506BE4();
                swift_unknownObjectRelease();
LABEL_14:
                v13 = v71;
                v14 = v68;
LABEL_15:
                swift_unknownObjectRelease();
                if (v13 == v12)
                  goto LABEL_4;
                goto LABEL_16;
              }
LABEL_34:
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
            }
            else
            {
              if (!v43)
                goto LABEL_58;
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              swift_unknownObjectRelease();
            }
            swift_bridgeObjectRelease();
            goto LABEL_25;
          }
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_unknownObjectRelease();
          swift_bridgeObjectRelease();
        }
LABEL_25:
        v16 += 10;
        if (!--v14)
        {
          sub_2385067A8((uint64_t)v80);
          v12 = v66;
          v11 = v67;
          goto LABEL_14;
        }
      }
    }
    v12 = *(_QWORD *)((v11 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v12)
      goto LABEL_12;
LABEL_4:

    swift_bridgeObjectRelease();
    v4 = v62;
    v5 = a2;
  }
  while (v62 != v60);
  swift_bridgeObjectRelease();
  v51 = v79;
LABEL_81:
  sub_238504C38(v51, a1);
  swift_bridgeObjectRelease();
  v52 = objc_msgSend((id)objc_opt_self(), sel_systemPinkColor);
  v53 = objc_allocWithZone(MEMORY[0x24BEB08A8]);
  v54 = (void *)sub_238506B48();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569168E0);
  v55 = (void *)sub_238506BCC();
  swift_bridgeObjectRelease();
  v56 = (void *)sub_238506B48();
  v57 = objc_msgSend(v53, sel_initWithCustomImage_iconBackgroundColor_displayName_galleryItems_vendorName_, 0, v52, v54, v55, v56);

  return v57;
}

id sub_238502D38(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  _QWORD *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  _QWORD *v29;
  unsigned int v30;
  uint64_t v31;
  id v32;
  id v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char v38;
  void *v39;
  void *v40;
  id v41;
  id v42;
  id v43;
  id v45;
  id v46;
  void *v47;

  objc_opt_self();
  v5 = swift_dynamicCastObjCClass();
  if (v5)
  {
    v6 = (void *)v5;
    v7 = OBJC_IVAR____TtC23ControlCenterUIServices22ControlsGalleryManager_moduleUniqueIdentifiers;
    if (*(_QWORD *)(v2 + OBJC_IVAR____TtC23ControlCenterUIServices22ControlsGalleryManager_moduleUniqueIdentifiers))
      v8 = *(_QWORD **)(v2 + OBJC_IVAR____TtC23ControlCenterUIServices22ControlsGalleryManager_moduleUniqueIdentifiers);
    else
      v8 = (_QWORD *)MEMORY[0x24BEE4AF8];
    swift_unknownObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v9 = objc_msgSend(v6, sel_uniqueIdentifier);
    v10 = sub_238506B6C();
    v12 = v11;

    LOBYTE(v9) = sub_2384FEB9C(v10, v12, v8);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v9 & 1) != 0)
    {
      v13 = objc_msgSend(v6, sel_copyWithUniqueIdentifier);
    }
    else
    {
      objc_msgSend(v6, sel_copy);
      sub_238506CE0();
      swift_unknownObjectRelease();
      type metadata accessor for CCUIModuleIconElement(0);
      if (swift_dynamicCast())
      {
        v13 = v47;
      }
      else
      {
        swift_unknownObjectRetain();
        v13 = v6;
      }
    }
    v22 = objc_msgSend(v13, sel_uniqueIdentifier, a1);
    v23 = sub_238506B6C();
    v25 = v24;

    v26 = a2;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v8 = sub_2384FBDCC(0, v8[2] + 1, 1, v8);
    v28 = v8[2];
    v27 = v8[3];
    if (v28 >= v27 >> 1)
      v8 = sub_2384FBDCC((_QWORD *)(v27 > 1), v28 + 1, 1, v8);
    v8[2] = v28 + 1;
    v29 = &v8[2 * v28];
    v29[4] = v23;
    v29[5] = v25;
    *(_QWORD *)(v2 + v7) = v8;
    swift_bridgeObjectRelease();
    v30 = objc_msgSend(v13, sel_expandsGridSizeClassesForAccessibility);
    v31 = v26;
    if (v30)
    {
      v32 = objc_msgSend((id)objc_opt_self(), sel_sharedApplication);
      v33 = objc_msgSend(v32, sel_preferredContentSizeCategory);

      LOBYTE(v32) = sub_238506C68();
      v31 = CCUIAdjustGridSizeClassForAccessibility(v26, v32 & 1);
    }
    objc_msgSend(v13, sel_setPreferredGallerySizeClass_, v31);
    v34 = objc_msgSend(v6, sel_moduleIdentifier);
    v35 = sub_238506B6C();
    v37 = v36;

    if (v35 == 0xD000000000000026 && v37 == 0x8000000238509DF0)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      v38 = sub_238506E18();
      swift_bridgeObjectRelease();
      if ((v38 & 1) == 0)
        goto LABEL_36;
    }
    if (v26 == 2)
    {
      if (qword_256915C60 != -1)
        swift_once();
      v39 = (void *)qword_256917570;
      v40 = (void *)sub_238506B48();
      v41 = objc_msgSend(v39, sel_localizedStringForKey_value_table_, v40, 0, 0);

      sub_238506B6C();
      v17 = (id)sub_238506B48();
      swift_bridgeObjectRelease();
      objc_msgSend(v13, sel_setDisplayName_, v17);
LABEL_35:

    }
LABEL_36:
    swift_unknownObjectRelease();
    return v13;
  }
  objc_opt_self();
  v14 = (void *)swift_dynamicCastObjCClass();
  swift_unknownObjectRetain();
  if (v14)
  {
    v13 = objc_msgSend(v14, sel_copyWithUniqueIdentifier);
    v15 = MEMORY[0x23B837864](v2 + OBJC_IVAR____TtC23ControlCenterUIServices22ControlsGalleryManager_controlsGalleryViewController);
    if (!v15)
    {
      v45 = objc_msgSend((id)objc_opt_self(), sel_sharedApplication);
      v46 = objc_msgSend(v45, sel_preferredContentSizeCategory);

      LOBYTE(v45) = sub_238506C68();
      objc_msgSend(v13, sel_setPreferredGallerySizeClass_, CCUIAdjustGridSizeClassForAccessibility(a2, v45 & 1));
      goto LABEL_36;
    }
    v16 = (void *)v15;
    v17 = *(id *)(v15 + OBJC_IVAR___CCUISControlsGalleryViewController_configuration);
    v18 = sub_238506C38();
    v19 = CCUISControlsGalleryConfiguration.allowedControlSizes.getter();
    if (!v19)
      goto LABEL_33;
    v20 = v19;
    if (*(_QWORD *)(v19 + 16) && (sub_2384FEB38(v18, v19) & 1) == 0)
      v18 = *(_QWORD *)(v20 + 32);
    swift_bridgeObjectRelease();
    if ((unint64_t)(v18 - 1) < 3)
      v21 = qword_2385085A0[v18 - 1];
    else
LABEL_33:
      v21 = 0;
    v42 = objc_msgSend(v16, sel_traitCollection);
    v43 = objc_msgSend(v42, sel_preferredContentSizeCategory);

    LOBYTE(v42) = sub_238506C68();
    objc_msgSend(v13, sel_setPreferredGallerySizeClass_, CCUIAdjustGridSizeClassForAccessibility(v21, v42 & 1));

    goto LABEL_35;
  }
  return (id)a1;
}

id sub_2385032E8()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  uint64_t v4;
  id v5;
  __CFString *v6;
  double v7;
  double v8;
  id v9;
  void *v10;
  id v11;

  v1 = OBJC_IVAR____TtC23ControlCenterUIServices22ControlsGalleryManager____lazy_storage___moduleContentMetrics;
  v2 = *(void **)(v0
                + OBJC_IVAR____TtC23ControlCenterUIServices22ControlsGalleryManager____lazy_storage___moduleContentMetrics);
  if (v2)
  {
    v3 = *(id *)(v0
               + OBJC_IVAR____TtC23ControlCenterUIServices22ControlsGalleryManager____lazy_storage___moduleContentMetrics);
  }
  else
  {
    v4 = v0;
    v5 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for ControlsGalleryIconListLayout()), sel_init);
    v6 = (id)SBHIconGridSizeClassForCCUIGridSizeClass(0);
    v7 = sub_2384F7EB8(v6);

    sub_2384F814C();
    v9 = objc_msgSend((id)objc_opt_self(), sel_defaultMetricsForGridGeometryInfo_, v7, v8);

    v10 = *(void **)(v4 + v1);
    *(_QWORD *)(v4 + v1) = v9;
    v3 = v9;

    v2 = 0;
  }
  v11 = v2;
  return v3;
}

uint64_t sub_238503480()
{
  uint64_t v0;

  sub_2384F7830(v0 + 16);

  return swift_deallocClassInstance();
}

id sub_2385034D8()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ControlsGalleryManager();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for ControlsGalleryManager()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for ControlsGalleryManager.IconViewProvider()
{
  return objc_opt_self();
}

id sub_238503630(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  id v24;
  uint64_t v25;
  id v26;
  objc_class *v27;
  _BYTE *v28;
  _OWORD *v29;
  id v30;
  id v31;
  id result;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  id v39;
  void *v40;
  id v41;
  void *v42;
  objc_super v43;

  v2 = v1;
  v3 = objc_msgSend(a1, sel_icon);
  if (!v3)
    return 0;
  v4 = v3;
  objc_opt_self();
  v5 = swift_dynamicCastObjCClass();
  if (!v5)
  {

    return 0;
  }
  v6 = (void *)v5;
  v7 = v4;
  if (!objc_msgSend(v6, sel_activeDataSource))
  {
LABEL_17:

    return 0;
  }
  objc_opt_self();
  v8 = swift_dynamicCastObjCClass();
  if (v8)
  {
    v9 = (void *)v8;
    swift_unknownObjectRetain();
    v10 = CHSWidgetExtensionProvider.controlDescriptor(for:)(v9);
    if (v10)
    {
      v11 = v10;
      v12 = objc_msgSend(v10, sel_extensionIdentity);
      v13 = objc_msgSend(v11, sel_kind);
      sub_238506B6C();

      v14 = objc_msgSend(v11, sel_defaultIntentReference);
      v15 = objc_allocWithZone(MEMORY[0x24BE169A0]);
      v16 = (void *)sub_238506B48();
      swift_bridgeObjectRelease();
      v17 = objc_msgSend(v15, sel_initWithExtensionIdentity_kind_intentReference_, v12, v16, v14);

      v18 = v17;
      v19 = objc_msgSend(v9, sel_controlType);
      v20 = objc_msgSend(v9, sel_uniqueIdentifier);
      sub_238506B6C();

      v21 = objc_allocWithZone(MEMORY[0x24BE19B48]);
      v22 = (void *)sub_238506B48();
      swift_bridgeObjectRelease();
      v23 = objc_msgSend(v21, sel_initWithIdentity_type_contentType_configurationIdentifier_, v18, v19, 1, v22);

      v24 = objc_msgSend(v7, sel_gridSizeClass);
      v25 = CCUIGridSizeClassForSBHIconGridSizeClass(v24);

      objc_msgSend(v23, sel_setGridSizeClass_, v25);
      v26 = sub_2385032E8();
      objc_msgSend(v23, sel_setContentMetrics_, v26);

      objc_msgSend(v23, sel_setDelegate_, v2);
      v27 = (objc_class *)type metadata accessor for ControlContainerViewController();
      v28 = objc_allocWithZone(v27);
      v28[OBJC_IVAR____TtC23ControlCenterUIServices30ControlContainerViewController_showsSquareCorners] = 0;
      *(_QWORD *)&v28[OBJC_IVAR____TtC23ControlCenterUIServices30ControlContainerViewController_controlViewController] = v23;
      v29 = &v28[OBJC_IVAR____TtC23ControlCenterUIServices30ControlContainerViewController_iconImageInfo];
      *v29 = 0u;
      v29[1] = 0u;
      v43.receiver = v28;
      v43.super_class = v27;
      v30 = v23;
      v31 = objc_msgSendSuper2(&v43, sel_initWithNibName_bundle_, 0, 0);
      result = objc_msgSend(v31, sel_view);
      if (result)
      {
        v33 = result;
        objc_msgSend(result, sel__controlCenterApplyGalleryModuleBackgroundMaterial);

        swift_unknownObjectRelease_n();
LABEL_13:

        return v31;
      }
      __break(1u);
      goto LABEL_21;
    }

    swift_unknownObjectRelease_n();
    return 0;
  }
  v34 = MEMORY[0x23B837864](v1 + OBJC_IVAR____TtC23ControlCenterUIServices22ControlsGalleryManager_controlsGalleryViewController);
  if (!v34)
  {
LABEL_16:
    swift_unknownObjectRelease();
    goto LABEL_17;
  }
  v35 = (void *)v34;
  sub_2384F5DDC(0, &qword_256916818);
  v36 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v37 = swift_allocObject();
  *(_QWORD *)(v37 + 16) = v36;
  *(_QWORD *)(v37 + 24) = v6;
  v7 = v7;
  v38 = (void *)sub_238506CB0();
  v39 = objc_msgSend(v35, sel_customItemsDelegate, 0, 0, 0, sub_2385067A0, v37);
  if (!v39)
  {

    goto LABEL_16;
  }
  v40 = v39;
  v41 = sub_2385032E8();
  v31 = objc_msgSend(v40, sel_controlsGalleryViewController_customImageViewControllerForWidgetIcon_withPrimaryAction_contentMetrics_, v35, v6, v38, v41);
  swift_unknownObjectRelease();

  result = objc_msgSend(v31, sel_view);
  if (result)
  {
    v42 = result;
    objc_msgSend(result, sel__controlCenterApplyGalleryModuleBackgroundMaterial);

    swift_unknownObjectRelease();
    goto LABEL_13;
  }
LABEL_21:
  __break(1u);
  return result;
}

void sub_238503B94(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a2 + 16;
  swift_beginAccess();
  v5 = MEMORY[0x23B837864](v4);
  if (v5)
  {
    v6 = (void *)v5;
    v7 = (void *)MEMORY[0x23B837864](v5 + OBJC_IVAR____TtC23ControlCenterUIServices22ControlsGalleryManager_controlsGalleryViewController);

    if (v7)
    {
      v8 = objc_msgSend(v7, sel_customItemsDelegate);
      if (v8)
      {
        objc_msgSend(v8, sel_controlsGalleryViewController_didFinishWithWidgetIcon_, v7, a3);

        swift_unknownObjectRelease();
      }
      else
      {

      }
    }
  }
}

uint64_t sub_238503C98(void *a1)
{
  uint64_t v1;
  uint64_t v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t inited;
  uint64_t v14;
  id v15;
  uint64_t v16;
  void *v17;
  id v18;

  v3 = MEMORY[0x23B837864](v1 + OBJC_IVAR____TtC23ControlCenterUIServices22ControlsGalleryManager_controlsGalleryViewController);
  if (v3)
  {
    v4 = (void *)v3;
    v5 = objc_msgSend(a1, sel_identity);
    v6 = objc_msgSend(a1, sel_type);
    objc_msgSend(a1, sel_gridSizeClass);
    v7 = objc_msgSend(objc_allocWithZone((Class)CCUISConfiguredControl), sel_initWithIdentity_type_size_, v5, v6, sub_238506C38());

    v8 = *(void **)(v1 + OBJC_IVAR____TtC23ControlCenterUIServices22ControlsGalleryManager_extensionProvider);
    v9 = objc_msgSend(v7, sel_identity);
    v10 = objc_msgSend(v8, sel_controlDescriptorForControl_, v9);

    if (v10)
    {
      v7 = v7;
      v11 = objc_msgSend(objc_allocWithZone((Class)CCUISControlsGalleryResult), sel_initWithControl_promptsForUserConfiguration_, v7, objc_msgSend(v10, sel_promptsForUserConfiguration));

      v12 = v11;
      sub_2384F7458(v11, 0);

    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_256916800);
      inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_238508400;
      *(_QWORD *)(inited + 32) = sub_238506B6C();
      *(_QWORD *)(inited + 40) = v14;
      *(_QWORD *)(inited + 72) = MEMORY[0x24BEE0D00];
      *(_QWORD *)(inited + 48) = 0xD000000000000014;
      *(_QWORD *)(inited + 56) = 0x800000023850BE70;
      sub_2384FEA10(inited);
      v15 = objc_allocWithZone(MEMORY[0x24BDD1540]);
      if (qword_256915C70 != -1)
        swift_once();
      v16 = qword_256917578;
      v17 = (void *)sub_238506B0C();
      swift_bridgeObjectRelease();
      v18 = objc_msgSend(v15, sel_initWithDomain_code_userInfo_, v16, 1001, v17);

      sub_2384F7458(0, (uint64_t)v18);
    }

  }
  return 0;
}

unint64_t sub_2385040FC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_238506E30();
  sub_238506B78();
  v4 = sub_238506E48();
  return sub_2385041E0(a1, a2, v4);
}

unint64_t sub_238504160(uint64_t a1)
{
  uint64_t v2;

  sub_238506B6C();
  sub_238506E30();
  sub_238506B78();
  v2 = sub_238506E48();
  swift_bridgeObjectRelease();
  return sub_2385042C0(a1, v2);
}

unint64_t sub_2385041E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v9;
  _QWORD *v10;
  BOOL v11;
  uint64_t v12;
  _QWORD *v13;
  BOOL v14;

  v4 = v3 + 64;
  v5 = -1 << *(_BYTE *)(v3 + 32);
  v6 = a3 & ~v5;
  if (((*(_QWORD *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0)
  {
    v9 = *(_QWORD *)(v3 + 48);
    v10 = (_QWORD *)(v9 + 16 * v6);
    v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_238506E18() & 1) == 0)
    {
      v12 = ~v5;
      do
      {
        v6 = (v6 + 1) & v12;
        if (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
          break;
        v13 = (_QWORD *)(v9 + 16 * v6);
        v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_238506E18() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_2385042C0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v18;

  v3 = v2 + 64;
  v4 = -1 << *(_BYTE *)(v2 + 32);
  v5 = a2 & ~v4;
  if (((*(_QWORD *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
  {
    v6 = sub_238506B6C();
    v8 = v7;
    if (v6 == sub_238506B6C() && v8 == v9)
    {
LABEL_16:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    v11 = sub_238506E18();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v11 & 1) == 0)
    {
      v12 = ~v4;
      v5 = (v5 + 1) & v12;
      if (((*(_QWORD *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
      {
        while (1)
        {
          v13 = sub_238506B6C();
          v15 = v14;
          if (v13 == sub_238506B6C() && v15 == v16)
            break;
          v18 = sub_238506E18();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v18 & 1) == 0)
          {
            v5 = (v5 + 1) & v12;
            if (((*(_QWORD *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
              continue;
          }
          return v5;
        }
        goto LABEL_16;
      }
    }
  }
  return v5;
}

uint64_t sub_238504434(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_238504450(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_238504450(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2569168F8);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 80);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v12 = v10 + 32;
  v13 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v12 >= &v13[80 * v8])
      memmove(v12, v13, 80 * v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[80 * v8] || v12 >= &v13[80 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  result = sub_238506DE8();
  __break(1u);
  return result;
}

void sub_2385045D0(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    sub_238506DB8();
    swift_bridgeObjectRelease();
  }
  JUMPOUT(0x23B8372ACLL);
}

_QWORD *sub_238504638(_QWORD *a1)
{
  return sub_2384FBB34(0, a1[2], 0, a1);
}

uint64_t sub_23850464C(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t i;
  uint64_t (*v12)();
  uint64_t *v13;
  uint64_t v14;
  uint64_t result;
  uint64_t (*v16[4])();

  v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    v7 = sub_238506DB8();
    swift_bridgeObjectRelease();
    if (!v7)
      return a3;
  }
  else
  {
    v7 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (!v7)
      return a3;
  }
  if (!a1)
    goto LABEL_19;
  v8 = a3 & 0xFFFFFFFFFFFFFF8;
  if (v6)
  {
    swift_bridgeObjectRetain();
    v10 = sub_238506DB8();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_2384FB288(&qword_256916930, &qword_256916910, MEMORY[0x24BEE12E0]);
        swift_bridgeObjectRetain();
        for (i = 0; i != v7; ++i)
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_256916910);
          v12 = sub_238504A78(v16, i, a3);
          v14 = *v13;
          swift_unknownObjectRetain();
          ((void (*)(uint64_t (**)(), _QWORD))v12)(v16, 0);
          *(_QWORD *)(a1 + 8 * i) = v14;
        }
        swift_bridgeObjectRelease();
        return a3;
      }
      goto LABEL_18;
    }
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  v9 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v9 > a2)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v8 + 32 >= a1 + 8 * v9 || v8 + 32 + 8 * v9 <= a1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2569168E0);
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  result = sub_238506DE8();
  __break(1u);
  return result;
}

uint64_t sub_23850485C(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t i;
  uint64_t (*v12)();
  id *v13;
  id v14;
  uint64_t result;
  void (*v16[4])(id *);

  v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    v7 = sub_238506DB8();
    swift_bridgeObjectRelease();
    if (!v7)
      return a3;
  }
  else
  {
    v7 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (!v7)
      return a3;
  }
  if (!a1)
    goto LABEL_19;
  v8 = a3 & 0xFFFFFFFFFFFFFF8;
  if (v6)
  {
    swift_bridgeObjectRetain();
    v10 = sub_238506DB8();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_2384FB288((unint64_t *)&unk_256916970, &qword_256916948, MEMORY[0x24BEE12E0]);
        swift_bridgeObjectRetain();
        for (i = 0; i != v7; ++i)
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_256916948);
          v12 = sub_238504AD0(v16, i, a3);
          v14 = *v13;
          ((void (*)(void (**)(id *), _QWORD))v12)(v16, 0);
          *(_QWORD *)(a1 + 8 * i) = v14;
        }
        swift_bridgeObjectRelease();
        return a3;
      }
      goto LABEL_18;
    }
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  v9 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v9 > a2)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v8 + 32 >= a1 + 8 * v9 || v8 + 32 + 8 * v9 <= a1)
  {
    sub_2384F5DDC(0, &qword_2569164A0);
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  result = sub_238506DE8();
  __break(1u);
  return result;
}

uint64_t (*sub_238504A78(uint64_t (**a1)(), unint64_t a2, uint64_t a3))()
{
  uint64_t (*v6)();

  v6 = (uint64_t (*)())malloc(0x28uLL);
  *a1 = v6;
  *((_QWORD *)v6 + 4) = sub_238504B50(v6, a2, a3);
  return sub_238504ACC;
}

uint64_t (*sub_238504AD0(void (**a1)(id *a1), unint64_t a2, uint64_t a3))()
{
  void (*v6)(id *);

  v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((_QWORD *)v6 + 4) = sub_238504BC4(v6, a2, a3);
  return sub_238504ACC;
}

void sub_238504B24(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD))(*a1 + 32))(*a1);
  free(v1);
}

uint64_t (*sub_238504B50(uint64_t (*result)(), unint64_t a2, uint64_t a3))()
{
  uint64_t *v3;
  uint64_t v4;

  v3 = (uint64_t *)result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    v4 = MEMORY[0x23B8372A0](a2, a3);
    goto LABEL_5;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10) > a2)
  {
    v4 = swift_unknownObjectRetain();
LABEL_5:
    *v3 = v4;
    return sub_238504BBC;
  }
  __break(1u);
  return result;
}

uint64_t sub_238504BBC()
{
  return swift_unknownObjectRelease();
}

void (*sub_238504BC4(void (*result)(id *a1), unint64_t a2, uint64_t a3))(id *a1)
{
  void (*v3)(id *);
  id v4;

  v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    v4 = (id)MEMORY[0x23B8372A0](a2, a3);
    goto LABEL_5;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10) > a2)
  {
    v4 = *(id *)(a3 + 8 * a2 + 32);
LABEL_5:
    *(_QWORD *)v3 = v4;
    return sub_238504C30;
  }
  __break(1u);
  return result;
}

void sub_238504C30(id *a1)
{

}

uint64_t sub_238504C38(unint64_t a1, uint64_t a2)
{
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v21;
  uint64_t v22;
  void *v23;
  unint64_t v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char v30;
  id v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char v41;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  unsigned int v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;
  uint64_t v55;
  uint64_t v56;

  if (a1)
    v2 = a1;
  else
    v2 = MEMORY[0x24BEE4AF8];
  v55 = MEMORY[0x24BEE4AF8];
  v3 = *(_QWORD *)(a2 + 32);
  v56 = v3;
  v4 = *(_QWORD *)(v3 + 16);
  if (v4)
  {
    if (v2 >> 62)
      goto LABEL_67;
    v53 = *(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    sub_2385067D0((uint64_t)&v56);
LABEL_7:
    v5 = 0;
    v43 = v3 + 32;
    v44 = v4;
    v54 = v2 & 0xC000000000000001;
    do
    {
      if (v5 == v4)
      {
        __break(1u);
LABEL_66:
        __break(1u);
LABEL_67:
        swift_bridgeObjectRetain();
        sub_2385067D0((uint64_t)&v56);
        swift_bridgeObjectRetain();
        v53 = sub_238506DB8();
        swift_bridgeObjectRelease();
        goto LABEL_7;
      }
      if (v53)
      {
        if (v53 >= 1)
        {
          v45 = v5;
          v6 = (_QWORD *)(v43 + 80 * v5);
          v3 = *(unsigned __int8 *)v6;
          v7 = v6[3];
          v8 = v6[5];
          v50 = v6[4];
          v51 = v6[2];
          v9 = v6[7];
          v10 = v6[9];
          v46 = v6[6];
          v47 = v6[8];
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          v52 = v9;
          swift_bridgeObjectRetain();
          v48 = v10;
          swift_bridgeObjectRetain();
          v11 = 0;
          v12 = v53;
          v49 = v3;
          while (1)
          {
            if (v54)
            {
              MEMORY[0x23B8372A0](v11, v2);
              if ((_DWORD)v3)
                goto LABEL_22;
            }
            else
            {
              swift_unknownObjectRetain();
              if ((_DWORD)v3)
              {
LABEL_22:
                objc_opt_self();
                v14 = swift_dynamicCastObjCClass();
                if (v14)
                {
                  v15 = (void *)v14;
                  swift_unknownObjectRetain();
                  swift_bridgeObjectRetain();
                  v16 = objc_msgSend(v15, sel_moduleIdentifier);
                  v17 = sub_238506B6C();
                  v19 = v18;

                  if (!v7)
                  {
                    swift_bridgeObjectRelease();
                    swift_unknownObjectRelease_n();
                    goto LABEL_19;
                  }
                  if (v51 == v17 && v7 == v19)
                    goto LABEL_14;
                  v21 = sub_238506E18();
                  swift_bridgeObjectRelease();
                  swift_bridgeObjectRelease();
                  swift_unknownObjectRelease();
                  if ((v21 & 1) != 0)
                    goto LABEL_15;
                }
                goto LABEL_18;
              }
            }
            objc_opt_self();
            v22 = swift_dynamicCastObjCClass();
            if (v22)
            {
              v23 = (void *)v22;
              v24 = v2;
              swift_unknownObjectRetain();
              swift_bridgeObjectRetain();
              v25 = objc_msgSend(v23, sel_extensionBundleIdentifier);
              v26 = sub_238506B6C();
              v28 = v27;

              if (!v8)
              {
                swift_unknownObjectRelease_n();
                swift_bridgeObjectRelease();
                goto LABEL_41;
              }
              if (v50 == v26 && v8 == v28)
              {
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
              }
              else
              {
                v30 = sub_238506E18();
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                if ((v30 & 1) == 0)
                {
                  swift_unknownObjectRelease_n();
LABEL_41:
                  v2 = v24;
                  v12 = v53;
                  goto LABEL_19;
                }
              }
              swift_bridgeObjectRetain();
              v31 = objc_msgSend(v23, sel_containerBundleIdentifier);
              if (v31)
              {
                v32 = v31;
                v33 = sub_238506B6C();
                v35 = v34;

                if (v52)
                {
                  if (!v35)
                    goto LABEL_52;
                  if (v46 == v33 && v52 == v35)
                  {
                    swift_bridgeObjectRelease();
                    swift_bridgeObjectRelease();
                  }
                  else
                  {
                    v36 = sub_238506E18();
                    swift_bridgeObjectRelease();
                    swift_bridgeObjectRelease();
                    if ((v36 & 1) == 0)
                      goto LABEL_59;
                  }
                }
                else if (v35)
                {
LABEL_52:
                  swift_unknownObjectRelease_n();
                  swift_bridgeObjectRelease();
                  goto LABEL_60;
                }
              }
              else if (v52)
              {
                goto LABEL_52;
              }
              swift_bridgeObjectRetain();
              v37 = objc_msgSend(v23, sel_kind);
              v38 = sub_238506B6C();
              v40 = v39;

              if (!v48)
              {
                swift_bridgeObjectRelease();
LABEL_59:
                swift_unknownObjectRelease_n();
LABEL_60:
                v2 = v24;
                v12 = v53;
                v3 = v49;
                goto LABEL_19;
              }
              v2 = v24;
              v3 = v49;
              if (v47 == v38 && v48 == v40)
              {
                v12 = v53;
LABEL_14:
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                swift_unknownObjectRelease();
LABEL_15:
                v13 = swift_unknownObjectRetain();
                MEMORY[0x23B83712C](v13);
                if (*(_QWORD *)((v55 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v55 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
                  sub_238506BF0();
                sub_238506BFC();
                sub_238506BE4();
                goto LABEL_18;
              }
              v41 = sub_238506E18();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              swift_unknownObjectRelease();
              v12 = v53;
              if ((v41 & 1) != 0)
                goto LABEL_15;
            }
LABEL_18:
            swift_unknownObjectRelease();
LABEL_19:
            if (v12 == ++v11)
            {
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              v4 = v44;
              v5 = v45;
              goto LABEL_9;
            }
          }
        }
        goto LABEL_66;
      }
LABEL_9:
      ++v5;
    }
    while (v5 != v4);
    sub_2385067A8((uint64_t)&v56);
    swift_bridgeObjectRelease();
    return v55;
  }
  else
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    return MEMORY[0x24BEE4AF8];
  }
}

void *sub_2385051F4(unint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  BOOL v18;
  char v19;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;

  v3 = v2;
  v5 = a1;
  if (a1 >> 62)
  {
LABEL_20:
    swift_bridgeObjectRetain();
    v6 = sub_238506DB8();
    if (v6)
      goto LABEL_3;
  }
  else
  {
    v6 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v6)
    {
LABEL_3:
      v21 = v3;
      v22 = v5;
      v23 = v5 & 0xC000000000000001;
      v7 = *(_QWORD *)(a2 + 56);
      v8 = *(_QWORD *)(a2 + 64);
      v3 = 4;
      do
      {
        v9 = v3 - 4;
        if (v23)
        {
          v10 = (id)MEMORY[0x23B8372A0](v3 - 4, v5);
          a2 = v3 - 3;
          if (__OFADD__(v9, 1))
            goto LABEL_19;
        }
        else
        {
          v10 = *(id *)(v5 + 8 * v3);
          a2 = v3 - 3;
          if (__OFADD__(v9, 1))
          {
LABEL_19:
            __break(1u);
            goto LABEL_20;
          }
        }
        v11 = v6;
        v12 = v10;
        v13 = v8;
        v14 = objc_msgSend(v10, sel_uniqueIdentifier, v21);
        v15 = sub_238506B6C();
        v17 = v16;

        v8 = v13;
        v18 = v15 == v7 && v17 == v13;
        if (v18)
        {
          swift_bridgeObjectRelease();
LABEL_18:
          swift_bridgeObjectRelease();
          return v12;
        }
        v19 = sub_238506E18();
        swift_bridgeObjectRelease();
        if ((v19 & 1) != 0)
          goto LABEL_18;

        ++v3;
        v6 = v11;
        v18 = a2 == v11;
        v5 = v22;
      }
      while (!v18);
    }
  }
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t sub_238505398(unint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  unint64_t v8;
  id v9;
  void *v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _OWORD v28[3];
  __int128 v29;
  uint64_t v30;

  result = MEMORY[0x24BEE4AF8];
  v27 = MEMORY[0x24BEE4AF8];
  v4 = *(_QWORD *)(a2 + 16);
  if (v4)
  {
    v5 = a2;
    if (a1 >> 62)
    {
LABEL_30:
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v26 = sub_238506DB8();
      swift_bridgeObjectRelease();
    }
    else
    {
      v26 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
    }
    v6 = 0;
    v24 = v4;
    v25 = v5 + 32;
    do
    {
      if (v6 == v4)
        goto LABEL_29;
      v11 = v25 + 72 * v6;
      v12 = *(_OWORD *)(v11 + 48);
      v28[2] = *(_OWORD *)(v11 + 32);
      v29 = v12;
      v30 = *(_QWORD *)(v11 + 64);
      v13 = *(_OWORD *)(v11 + 16);
      v28[0] = *(_OWORD *)v11;
      v28[1] = v13;
      if (v26)
      {
        v15 = *((_QWORD *)&v29 + 1);
        v14 = v30;
        swift_bridgeObjectRetain();
        sub_2385067F8((uint64_t)v28);
        v5 = 4;
        while (1)
        {
          v16 = (a1 & 0xC000000000000001) != 0
              ? (id)MEMORY[0x23B8372A0](v5 - 4, a1)
              : *(id *)(a1 + 8 * v5);
          v17 = v16;
          v4 = v5 - 3;
          if (__OFADD__(v5 - 4, 1))
            break;
          v18 = objc_msgSend(v16, sel_uniqueIdentifier);
          v19 = sub_238506B6C();
          v21 = v20;

          if (v19 == v15 && v21 == v14)
          {
            swift_bridgeObjectRelease();
LABEL_6:
            swift_bridgeObjectRelease();
            v7 = objc_msgSend(v17, sel_widgetDescriptors);
            __swift_instantiateConcreteTypeFromMangledName(&qword_2569168E0);
            v8 = sub_238506BD8();

            sub_238504C38(v8, (uint64_t)v28);
            swift_bridgeObjectRelease();
            v9 = v17;
            v10 = (void *)sub_238506BCC();
            swift_bridgeObjectRelease();
            objc_msgSend(v9, sel_setWidgetDescriptors_, v10);

            MEMORY[0x23B83712C]();
            if (*(_QWORD *)((v27 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v27 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
              sub_238506BF0();
            sub_238506BFC();
            sub_238506BE4();

LABEL_9:
            sub_23850685C((uint64_t)v28);
            v4 = v24;
            goto LABEL_10;
          }
          v23 = sub_238506E18();
          swift_bridgeObjectRelease();
          if ((v23 & 1) != 0)
            goto LABEL_6;

          ++v5;
          if (v4 == v26)
          {
            swift_bridgeObjectRelease();
            goto LABEL_9;
          }
        }
        __break(1u);
LABEL_29:
        __break(1u);
        goto LABEL_30;
      }
LABEL_10:
      ++v6;
    }
    while (v6 != v4);
    swift_bridgeObjectRelease();
    return v27;
  }
  return result;
}

uint64_t sub_238505680(void *a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;

  if (*(_BYTE *)a2 == 1)
  {
    objc_opt_self();
    v4 = swift_dynamicCastObjCClass();
    if (!v4)
    {
LABEL_32:
      LOBYTE(v14) = 0;
      return v14 & 1;
    }
    v5 = (void *)v4;
    v7 = *(_QWORD *)(a2 + 16);
    v6 = *(_QWORD *)(a2 + 24);
    swift_bridgeObjectRetain();
    v8 = a1;
    v9 = objc_msgSend(v5, sel_moduleIdentifier);
    v10 = sub_238506B6C();
    v12 = v11;

    if (v6)
    {
      if (v7 == v10 && v6 == v12)
      {
        LOBYTE(v14) = 1;
        goto LABEL_20;
      }
LABEL_8:
      LOBYTE(v14) = sub_238506E18();
LABEL_20:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();

      return v14 & 1;
    }
    goto LABEL_17;
  }
  objc_opt_self();
  v14 = swift_dynamicCastObjCClass();
  if (v14)
  {
    v16 = *(_QWORD *)(a2 + 32);
    v15 = *(_QWORD *)(a2 + 40);
    swift_bridgeObjectRetain();
    v8 = a1;
    v17 = objc_msgSend((id)v14, sel_extensionBundleIdentifier);
    v18 = sub_238506B6C();
    v20 = v19;

    if (!v15)
      goto LABEL_31;
    if (v16 == v18 && v15 == v20)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    else
    {
      v22 = sub_238506E18();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v22 & 1) == 0)
      {
LABEL_18:

        goto LABEL_32;
      }
    }
    v24 = *(_QWORD *)(a2 + 48);
    v23 = *(_QWORD *)(a2 + 56);
    swift_bridgeObjectRetain();
    v25 = objc_msgSend((id)v14, sel_containerBundleIdentifier);
    if (v25)
    {
      v26 = v25;
      v27 = sub_238506B6C();
      v29 = v28;

      if (v23)
      {
        if (v29)
        {
          if (v24 == v27 && v23 == v29)
          {
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
          }
          else
          {
            v31 = sub_238506E18();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            if ((v31 & 1) == 0)
              goto LABEL_18;
          }
          goto LABEL_35;
        }
LABEL_31:

        swift_bridgeObjectRelease();
        goto LABEL_32;
      }
      if (v29)
        goto LABEL_31;
    }
    else if (v23)
    {
      goto LABEL_31;
    }
LABEL_35:
    v33 = *(_QWORD *)(a2 + 64);
    v32 = *(_QWORD *)(a2 + 72);
    swift_bridgeObjectRetain();
    v34 = objc_msgSend((id)v14, sel_kind);
    v35 = sub_238506B6C();
    v37 = v36;

    if (v32)
    {
      if (v33 == v35 && v32 == v37)
      {
        LOBYTE(v14) = 1;
        goto LABEL_20;
      }
      goto LABEL_8;
    }
LABEL_17:
    swift_bridgeObjectRelease();
    goto LABEL_18;
  }
  return v14 & 1;
}

uint64_t sub_238505984(unint64_t a1)
{
  unint64_t v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  void **p_weak_ivar_lyt;
  BOOL v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  unint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  unint64_t v18;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v20;
  uint64_t v21;
  _BOOL8 v22;
  uint64_t v23;
  unint64_t v24;
  char v25;
  _QWORD *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  BOOL v30;
  uint64_t v31;
  uint64_t i;
  id v33;
  void *v34;
  id v35;
  unint64_t v36;
  unint64_t v37;
  char v38;
  id v39;
  unint64_t v40;
  char v41;
  id v42;
  id v43;
  unint64_t v44;
  char v45;
  id v46;
  id v47;
  unint64_t v48;
  char v49;
  id v50;
  id v51;
  uint64_t result;
  uint64_t v53;
  unint64_t v54;
  unint64_t v55;
  _QWORD *v56;
  unint64_t v57;

  v2 = sub_2384FE7F0(MEMORY[0x24BEE4AF8]);
  if (a1 >> 62)
  {
LABEL_36:
    swift_bridgeObjectRetain();
    v3 = sub_238506DB8();
    if (v3)
      goto LABEL_3;
  }
  else
  {
    v3 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v3)
    {
LABEL_3:
      v4 = (id)(a1 & 0xC000000000000001);
      v5 = 4;
      p_weak_ivar_lyt = &ControlsGalleryManager.IconViewProvider.weak_ivar_lyt;
      v53 = v3;
      v54 = a1 & 0xC000000000000001;
      while (1)
      {
        if (v4)
          v8 = (id)MEMORY[0x23B8372A0](v5 - 4, a1);
        else
          v8 = *(id *)(a1 + 8 * v5);
        v9 = v8;
        v10 = v5 - 3;
        if (__OFADD__(v5 - 4, 1))
        {
          __break(1u);
LABEL_34:
          __break(1u);
LABEL_35:
          __break(1u);
          goto LABEL_36;
        }
        v11 = objc_msgSend(v8, (SEL)p_weak_ivar_lyt[315]);
        sub_238506B6C();

        LOBYTE(v11) = sub_238506BA8();
        swift_bridgeObjectRelease();
        if ((v11 & 1) != 0)
          break;

LABEL_5:
        ++v5;
        v7 = v10 == v3;
        v4 = (id)v54;
        if (v7)
        {
          swift_bridgeObjectRelease();
          v57 = a1;
          v55 = MEMORY[0x24BEE4AF8];
          if (v3 < 1)
          {
            __break(1u);
            goto LABEL_63;
          }
          swift_bridgeObjectRetain_n();
          for (i = 0; i != v3; ++i)
          {
            if (v54)
              v33 = (id)MEMORY[0x23B8372A0](i, a1);
            else
              v33 = *(id *)(a1 + 8 * i + 32);
            v34 = v33;
            v35 = objc_msgSend(v33, (SEL)p_weak_ivar_lyt[315], v53);
            sub_238506B6C();

            LOBYTE(v35) = sub_238506BA8();
            swift_bridgeObjectRelease();
            if ((v35 & 1) != 0)
            {

            }
            else
            {
              sub_238506D58();
              sub_238506D7C();
              sub_238506D88();
              sub_238506D64();
            }
            p_weak_ivar_lyt = &ControlsGalleryManager.IconViewProvider.weak_ivar_lyt;
          }
          swift_bridgeObjectRelease();
          v36 = v55;
          goto LABEL_38;
        }
      }
      v12 = a1;
      v13 = objc_msgSend(v9, (SEL)p_weak_ivar_lyt[315]);
      v14 = sub_238506B6C();
      v16 = v15;

      v17 = v9;
      v18 = v2;
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v56 = (_QWORD *)v2;
      a1 = sub_2385040FC(v14, v16);
      v21 = *(_QWORD *)(v2 + 16);
      v22 = (v20 & 1) == 0;
      v23 = v21 + v22;
      if (__OFADD__(v21, v22))
        goto LABEL_34;
      v2 = v20;
      if (*(_QWORD *)(v18 + 24) < v23)
      {
        sub_2384F84C8(v23, isUniquelyReferenced_nonNull_native);
        v24 = sub_2385040FC(v14, v16);
        if ((v2 & 1) != (v25 & 1))
        {
          result = sub_238506E24();
          __break(1u);
          return result;
        }
        a1 = v24;
        v26 = v56;
        if ((v2 & 1) == 0)
          goto LABEL_20;
LABEL_18:
        v2 = (unint64_t)v26;
        v27 = v26[7];

        *(_QWORD *)(v27 + 8 * a1) = v17;
LABEL_22:

        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        a1 = v12;
        v3 = v53;
        p_weak_ivar_lyt = (void **)(&ControlsGalleryManager.IconViewProvider + 56);
        goto LABEL_5;
      }
      if ((isUniquelyReferenced_nonNull_native & 1) != 0)
      {
        v26 = v56;
        if ((v20 & 1) != 0)
          goto LABEL_18;
      }
      else
      {
        sub_2384F8E40();
        v26 = v56;
        if ((v2 & 1) != 0)
          goto LABEL_18;
      }
LABEL_20:
      v26[(a1 >> 6) + 8] |= 1 << a1;
      v28 = (uint64_t *)(v26[6] + 16 * a1);
      *v28 = v14;
      v28[1] = v16;
      *(_QWORD *)(v26[7] + 8 * a1) = v17;
      v29 = v26[2];
      v30 = __OFADD__(v29, 1);
      v31 = v29 + 1;
      if (v30)
        goto LABEL_35;
      v2 = (unint64_t)v26;
      v26[2] = v31;
      swift_bridgeObjectRetain();
      goto LABEL_22;
    }
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  v36 = MEMORY[0x24BEE4AF8];
LABEL_38:
  swift_bridgeObjectRelease();
  v57 = v36;
  if (*(_QWORD *)(v2 + 16))
  {
    swift_bridgeObjectRetain();
    v37 = sub_2385040FC(*(uint64_t *)"ACCESSIBILITY", *(uint64_t *)"ILITY");
    if ((v38 & 1) != 0)
    {
      v39 = *(id *)(*(_QWORD *)(v2 + 56) + 8 * v37);
      swift_bridgeObjectRelease();
      v4 = v39;
      MEMORY[0x23B83712C]();
      if (*(_QWORD *)((v57 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v57 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
LABEL_63:
        sub_238506BF0();
      sub_238506BFC();
      sub_238506BE4();

    }
    else
    {
      swift_bridgeObjectRelease();
    }
    if (*(_QWORD *)(v2 + 16))
    {
      swift_bridgeObjectRetain();
      v40 = sub_2385040FC(0xD000000000000015, 0x800000023850A4B0);
      if ((v41 & 1) != 0)
      {
        v42 = *(id *)(*(_QWORD *)(v2 + 56) + 8 * v40);
        swift_bridgeObjectRelease();
        v43 = v42;
        MEMORY[0x23B83712C]();
        if (*(_QWORD *)((v57 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v57 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
          sub_238506BF0();
        sub_238506BFC();
        sub_238506BE4();

      }
      else
      {
        swift_bridgeObjectRelease();
      }
      if (*(_QWORD *)(v2 + 16))
      {
        swift_bridgeObjectRetain();
        v44 = sub_2385040FC(0xD000000000000013, 0x800000023850A4D0);
        if ((v45 & 1) != 0)
        {
          v46 = *(id *)(*(_QWORD *)(v2 + 56) + 8 * v44);
          swift_bridgeObjectRelease();
          v47 = v46;
          MEMORY[0x23B83712C]();
          if (*(_QWORD *)((v57 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v57 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
            sub_238506BF0();
          sub_238506BFC();
          sub_238506BE4();

        }
        else
        {
          swift_bridgeObjectRelease();
        }
        if (*(_QWORD *)(v2 + 16))
        {
          swift_bridgeObjectRetain();
          v48 = sub_2385040FC(0xD000000000000014, 0x800000023850A4F0);
          if ((v49 & 1) != 0)
          {
            v50 = *(id *)(*(_QWORD *)(v2 + 56) + 8 * v48);
            swift_bridgeObjectRelease();
            v51 = v50;
            MEMORY[0x23B83712C]();
            if (*(_QWORD *)((v57 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v57 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
              sub_238506BF0();
            sub_238506BFC();
            sub_238506BE4();

          }
          else
          {
            swift_bridgeObjectRelease();
          }
        }
      }
    }
  }
  swift_arrayDestroy();
  swift_bridgeObjectRelease();
  return v57;
}

void sub_238506084()
{
  uint64_t v0;
  void *v1;
  void *v2;
  id v3;
  id v4;

  v1 = (void *)MEMORY[0x23B837864](v0 + OBJC_IVAR____TtC23ControlCenterUIServices22ControlsGalleryManager_controlsGalleryViewController);
  if (v1)
  {
    v2 = v1;
    v3 = objc_msgSend(v1, sel_view);

    if (v3)
    {
      v4 = objc_msgSend(v3, sel_window);

      if (v4)
      {
        if (!swift_dynamicCastObjCProtocolConditional())

      }
    }
    else
    {
      __break(1u);
    }
  }
}

uint64_t sub_23850612C()
{
  uint64_t v0;
  void *v1;
  void *v2;
  id v3;
  uint64_t v4;
  id v5;

  v1 = (void *)MEMORY[0x23B837864](v0 + OBJC_IVAR____TtC23ControlCenterUIServices22ControlsGalleryManager_controlsGalleryViewController);
  if (!v1)
    return 0;
  v2 = v1;
  v3 = objc_msgSend(v1, sel_customItemsDelegate);
  v4 = (uint64_t)v3;
  if (v3)
  {
    v5 = objc_msgSend(v3, sel_customApplicationWidgetCollectionsForControlsGalleryViewController_, v2);
    swift_unknownObjectRelease();
    sub_2384F5DDC(0, &qword_2569164A0);
    v4 = sub_238506BD8();

  }
  return v4;
}

void sub_2385061E4(void *a1)
{
  uint64_t v1;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void **p_weak_ivar_lyt;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t i;
  id v16;
  void *v17;
  unsigned __int8 v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  unint64_t v27;
  uint64_t v28;
  id v29;
  void *v30;
  unsigned __int8 v31;
  void **v32;
  uint64_t v33;
  id v34;

  objc_opt_self();
  v3 = swift_dynamicCastObjCClass();
  if (!v3)
    return;
  v4 = (void *)v3;
  v5 = MEMORY[0x23B837864](v1 + OBJC_IVAR____TtC23ControlCenterUIServices22ControlsGalleryManager_controlsGalleryViewController);
  if (!v5)
    return;
  p_weak_ivar_lyt = (void **)v5;
  v7 = *(void **)(v5 + OBJC_IVAR___CCUISControlsGalleryViewController_configuration);
  v8 = a1;
  v9 = v7;
  v10 = objc_msgSend(v4, sel_extensionIdentity);
  v11 = objc_msgSend(v9, sel_disallowedExtensionIdentities);
  if (!v11)
    goto LABEL_18;
  v12 = v11;
  sub_238506C5C();
  v13 = sub_238506BD8();

  if (v13 >> 62)
  {
    swift_bridgeObjectRetain();
    v14 = sub_238506DB8();
    swift_bridgeObjectRelease();
    if (v14)
      goto LABEL_6;
LABEL_17:
    swift_bridgeObjectRelease();
    goto LABEL_18;
  }
  v14 = *(_QWORD *)((v13 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (!v14)
    goto LABEL_17;
LABEL_6:
  if (v14 >= 1)
  {
    for (i = 0; i != v14; ++i)
    {
      if ((v13 & 0xC000000000000001) != 0)
        v16 = (id)MEMORY[0x23B8372A0](i, v13);
      else
        v16 = *(id *)(v13 + 8 * i + 32);
      v17 = v16;
      v18 = objc_msgSend(v10, sel_isEqual_, v16);

    }
    swift_bridgeObjectRelease();
    if ((v18 & 1) != 0)
    {
      v19 = (id)v8;
      v20 = v9;
      v9 = v10;
LABEL_33:

      return;
    }
LABEL_18:
    v19 = v10;
    v21 = objc_msgSend(v4, sel_kind);
    sub_238506B6C();

    v22 = objc_msgSend(v4, sel_defaultIntentReference);
    v23 = objc_allocWithZone(MEMORY[0x24BE169A0]);
    v24 = (void *)sub_238506B48();
    swift_bridgeObjectRelease();
    v20 = objc_msgSend(v23, sel_initWithExtensionIdentity_kind_intentReference_, v19, v24, v22);

    v25 = objc_msgSend(v9, sel_disallowedControlIdentities);
    if (v25)
    {
      v26 = v25;
      sub_2384F5DDC(0, (unint64_t *)&unk_2569167F0);
      v27 = sub_238506BD8();

      if (v27 >> 62)
        goto LABEL_31;
      v28 = *(_QWORD *)((v27 & 0xFFFFFFFFFFFFF8) + 0x10);
      while (v28)
      {
        v33 = v8;
        v34 = v9;
        v32 = p_weak_ivar_lyt;
        v8 = 4;
        p_weak_ivar_lyt = &ControlsGalleryManager.IconViewProvider.weak_ivar_lyt;
        while (1)
        {
          v29 = (v27 & 0xC000000000000001) != 0
              ? (id)MEMORY[0x23B8372A0](v8 - 4, v27)
              : *(id *)(v27 + 8 * v8);
          v30 = v29;
          v9 = (id)(v8 - 3);
          if (__OFADD__(v8 - 4, 1))
            break;
          v31 = objc_msgSend(v20, sel_matches_, v29);

          if ((v31 & 1) == 0)
          {
            ++v8;
            if (v9 != (id)v28)
              continue;
          }
          p_weak_ivar_lyt = v32;
          v8 = v33;
          v9 = v34;
          goto LABEL_32;
        }
        __break(1u);
LABEL_31:
        swift_bridgeObjectRetain();
        v28 = sub_238506DB8();
        swift_bridgeObjectRelease();
      }
LABEL_32:

      swift_bridgeObjectRelease();
      v19 = v20;
      v20 = (id)v8;
    }
    else
    {

      p_weak_ivar_lyt = (void **)v9;
      v9 = (id)v8;
    }
    goto LABEL_33;
  }
  __break(1u);
}

id sub_2385065B0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  __CFString *v9;
  id v10;

  v3 = MEMORY[0x23B837864](v1 + OBJC_IVAR____TtC23ControlCenterUIServices22ControlsGalleryManager_controlsGalleryViewController);
  if (!v3)
    return 0;
  v4 = (void *)v3;
  objc_opt_self();
  v5 = swift_dynamicCastObjCClass();
  if (!v5)
  {
    v10 = objc_msgSend(v4, sel_customItemsDelegate);
    if (v10)
    {
      v8 = objc_msgSend(v10, sel_controlsGalleryViewController_widgetIconForGalleryItem_, v4, a1);
      swift_unknownObjectRelease();

      return v8;
    }

    return 0;
  }
  v6 = (void *)v5;
  sub_2384F5DDC(0, &qword_2569167E8);
  swift_unknownObjectRetain();
  v7 = (void *)sub_238506C20();
  objc_msgSend(v7, sel_addIconDataSource_, v6);
  v8 = v7;
  v9 = (id)SBHIconGridSizeClassForCCUIGridSizeClass((uint64_t)objc_msgSend(v6, sel_preferredGallerySizeClass));
  objc_msgSend(v8, sel_setGridSizeClass_, v9);

  swift_unknownObjectRelease();
  return v8;
}

uint64_t sub_2385066F8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256916810);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

_OWORD *sub_238506740(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_238506750()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

uint64_t sub_238506774()
{
  uint64_t v0;

  swift_release();

  return swift_deallocObject();
}

void sub_2385067A0(uint64_t a1)
{
  uint64_t v1;

  sub_238503B94(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t sub_2385067A8(uint64_t a1)
{
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_2385067D0(uint64_t a1)
{
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_2385067F8(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;

  v2 = *(void **)(a1 + 16);
  v3 = *(void **)(a1 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v4 = v2;
  v5 = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_23850685C(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 16);
  v3 = *(void **)(a1 + 24);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_2385068C0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256916900);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

char *keypath_get_selector_sbh_appName()
{
  return sel_sbh_appName;
}

void sub_238506914(id *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_238500F20(a1, (SEL *)&selRef_sbh_appName, a2);
}

uint64_t sub_238506930(uint64_t a1, uint64_t a2, void *a3, void *a4, uint64_t a5)
{
  id v7;
  id v8;
  uint64_t result;

  if (a5)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v7 = a3;
    v8 = a4;
    return swift_bridgeObjectRetain();
  }
  return result;
}

_QWORD *sub_238506998(_QWORD *a1, void (*a2)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))
{
  a2(*a1, a1[1], a1[2], a1[3], a1[4], a1[5], a1[6], a1[7], a1[8]);
  return a1;
}

uint64_t sub_2385069E0(uint64_t a1, uint64_t a2, void *a3, void *a4, uint64_t a5)
{
  uint64_t result;

  if (a5)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

    return swift_bridgeObjectRelease();
  }
  return result;
}

void sub_238506A48(id *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_238500F20(a1, (SEL *)&selRef_displayName, a2);
}

uint64_t sub_238506A64()
{
  return MEMORY[0x24BDCBEF0]();
}

uint64_t sub_238506A70()
{
  return MEMORY[0x24BDCD2F0]();
}

uint64_t sub_238506A7C()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_238506A88()
{
  return MEMORY[0x24BDCE9B0]();
}

uint64_t sub_238506A94()
{
  return MEMORY[0x24BDCEA40]();
}

uint64_t sub_238506AA0()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_238506AAC()
{
  return MEMORY[0x24BE16890]();
}

uint64_t sub_238506AB8()
{
  return MEMORY[0x24BE16898]();
}

uint64_t sub_238506AC4()
{
  return MEMORY[0x24BE168A0]();
}

uint64_t sub_238506AD0()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_238506ADC()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_238506AE8()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_238506AF4()
{
  return MEMORY[0x24BEBC108]();
}

uint64_t sub_238506B00()
{
  return MEMORY[0x24BEBC210]();
}

uint64_t sub_238506B0C()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_238506B18()
{
  return MEMORY[0x24BDCF830]();
}

uint64_t sub_238506B24()
{
  return MEMORY[0x24BDCF850]();
}

uint64_t sub_238506B30()
{
  return MEMORY[0x24BDCF9A0]();
}

uint64_t sub_238506B3C()
{
  return MEMORY[0x24BDCF9C8]();
}

uint64_t sub_238506B48()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_238506B54()
{
  return MEMORY[0x24BDCFA08]();
}

uint64_t sub_238506B60()
{
  return MEMORY[0x24BDCFA18]();
}

uint64_t sub_238506B6C()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_238506B78()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_238506B84()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_238506B90()
{
  return MEMORY[0x24BEE0BE8]();
}

uint64_t sub_238506B9C()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_238506BA8()
{
  return MEMORY[0x24BEE0CC8]();
}

uint64_t sub_238506BB4()
{
  return MEMORY[0x24BEE0FD8]();
}

uint64_t sub_238506BC0()
{
  return MEMORY[0x24BEE1110]();
}

uint64_t sub_238506BCC()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_238506BD8()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_238506BE4()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_238506BF0()
{
  return MEMORY[0x24BEE1160]();
}

uint64_t sub_238506BFC()
{
  return MEMORY[0x24BEE11B8]();
}

uint64_t sub_238506C08()
{
  return MEMORY[0x24BDCFCE8]();
}

uint64_t sub_238506C14()
{
  return MEMORY[0x24BEE1678]();
}

uint64_t sub_238506C20()
{
  return MEMORY[0x24BEB0880]();
}

uint64_t sub_238506C2C()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_238506C38()
{
  return MEMORY[0x24BE19A28]();
}

uint64_t sub_238506C44()
{
  return MEMORY[0x24BE168F0]();
}

uint64_t sub_238506C50()
{
  return MEMORY[0x24BE16908]();
}

uint64_t sub_238506C5C()
{
  return MEMORY[0x24BE16918]();
}

uint64_t sub_238506C68()
{
  return MEMORY[0x24BEBCD48]();
}

uint64_t sub_238506C74()
{
  return MEMORY[0x24BEBCD60]();
}

uint64_t sub_238506C80()
{
  return MEMORY[0x24BEBCDC0]();
}

uint64_t sub_238506C8C()
{
  return MEMORY[0x24BEBCDC8]();
}

uint64_t sub_238506C98()
{
  return MEMORY[0x24BEBCE00]();
}

uint64_t sub_238506CA4()
{
  return MEMORY[0x24BEE5BC0]();
}

uint64_t sub_238506CB0()
{
  return MEMORY[0x24BEBD030]();
}

uint64_t sub_238506CBC()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_238506CC8()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_238506CD4()
{
  return MEMORY[0x24BDD05F0]();
}

uint64_t sub_238506CE0()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_238506CEC()
{
  return MEMORY[0x24BEE22B0]();
}

uint64_t sub_238506CF8()
{
  return MEMORY[0x24BEE22D0]();
}

uint64_t sub_238506D04()
{
  return MEMORY[0x24BEE2300]();
}

uint64_t sub_238506D10()
{
  return MEMORY[0x24BEE2358]();
}

uint64_t sub_238506D1C()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_238506D28()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_238506D34()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_238506D40()
{
  return MEMORY[0x24BEE2660]();
}

uint64_t sub_238506D4C()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_238506D58()
{
  return MEMORY[0x24BEE2908]();
}

uint64_t sub_238506D64()
{
  return MEMORY[0x24BEE2938]();
}

uint64_t sub_238506D70()
{
  return MEMORY[0x24BEE2958]();
}

uint64_t sub_238506D7C()
{
  return MEMORY[0x24BEE2980]();
}

uint64_t sub_238506D88()
{
  return MEMORY[0x24BEE2988]();
}

uint64_t sub_238506D94()
{
  return MEMORY[0x24BEE2BE0]();
}

uint64_t sub_238506DA0()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_238506DAC()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_238506DB8()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_238506DC4()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_238506DD0()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_238506DDC()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_238506DE8()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_238506DF4()
{
  return MEMORY[0x24BEE31D0]();
}

uint64_t sub_238506E00()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_238506E0C()
{
  return MEMORY[0x24BEE3A20]();
}

uint64_t sub_238506E18()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_238506E24()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_238506E30()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_238506E3C()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_238506E48()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t BSRectWithSize()
{
  return MEMORY[0x24BE0BCC0]();
}

uint64_t CCUICalculateGridGeometryInfo()
{
  return MEMORY[0x24BE19A40]();
}

uint64_t CCUICompactModuleContinuousCornerRadiusForGridSizeClass()
{
  return MEMORY[0x24BE19A50]();
}

uint64_t CCUINumberOfColumnsForGridSizeClass()
{
  return MEMORY[0x24BE19AB8]();
}

uint64_t CCUINumberOfRowsForGridSizeClass()
{
  return MEMORY[0x24BE19AC0]();
}

uint64_t CCUIReferenceScreenBounds()
{
  return MEMORY[0x24BE19AC8]();
}

uint64_t CCUIScreenSafeAreaInsets()
{
  return MEMORY[0x24BE19AD8]();
}

CGFloat CGRectGetWidth(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF020]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

uint64_t SBHScreenTypeForCurrentDevice()
{
  return MEMORY[0x24BEB09D8]();
}

uint64_t UIEdgeInsetsMakeWithEdges()
{
  return MEMORY[0x24BEBE148]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x24BEE4B38]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x24BDAED08](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x24BDAED60](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x24BEDCF78](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD108](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_self()
{
  return MEMORY[0x24BEDD168]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x24BEE4B98]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x24BEE4BA0]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x24BEE4BB8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x24BEE4BC0]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x24BEE4BC8]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x24BEE4BD0]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x24BEE4BD8]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x24BEE4C00]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x24BEE4C10]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x24BEE4C38]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x24BEE4C60]();
}

uint64_t swift_dynamicCastObjCProtocolConditional()
{
  return MEMORY[0x24BEE4C70]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x24BEE4C98]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x24BEE4CA0]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x24BEE4D40]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x24BEE4D88]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x24BEE4DA0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x24BEE4DB0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x24BEE4DB8]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x24BEE4E10]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x24BEE4E18]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x24BEE4E20]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x24BEE4E48]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x24BEE4E68]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x24BEE4E90]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x24BEE4E98]();
}

uint64_t swift_once()
{
  return MEMORY[0x24BEE4EC8]();
}

uint64_t swift_release()
{
  return MEMORY[0x24BEE4EF8]();
}

uint64_t swift_retain()
{
  return MEMORY[0x24BEE4F08]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x24BEE4F38]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x24BEE4F40]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x24BEE4F70]();
}

uint64_t swift_unknownObjectRelease_n()
{
  return MEMORY[0x24BEE4F78]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x24BEE4FB0]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x24BEE4FC8]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x24BEE4FD0]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x24BEE4FD8]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x24BEE5050]();
}

