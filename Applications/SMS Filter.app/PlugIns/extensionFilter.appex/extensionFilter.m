id getActiveSimRegions()
{
  id v0;
  void *v1;
  id v2;
  id v3;
  uint64_t i;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  id v14;
  id v15;
  id v16;

  v0 = objc_msgSend(objc_alloc((Class)CoreTelephonyClient), "initWithQueue:", 0);
  v16 = 0;
  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v0, "getActiveContexts:", &v16));
  v2 = v16;
  v3 = objc_alloc_init((Class)NSMutableArray);
  for (i = 1; i != 3; ++i)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "findForSlot:", i));
    v6 = v5;
    if (v5)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "context"));
      if (v7)
      {
        v15 = v2;
        v8 = objc_msgSend(v0, "copyMobileSubscriberCountryCode:error:", v7, &v15);
        v9 = v15;

        if (v8 && !v9)
        {
          v14 = 0;
          v10 = objc_msgSend(v0, "copyMobileSubscriberIsoCountryCode:error:", v8, &v14);
          v11 = v14;
          v9 = v11;
          if (v10 && !v11 && objc_msgSend(v10, "length"))
          {
            v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "lowercaseString"));

            objc_msgSend(v3, "addObject:", v12);
            v10 = (id)v12;
          }

        }
        v2 = v9;
      }

    }
  }

  return v3;
}

id trialLogHandle()
{
  if (trialLogHandle_onceToken != -1)
    dispatch_once(&trialLogHandle_onceToken, &__block_literal_global);
  return (id)trialLogHandle_sLogHandle;
}

void sub_100004A0C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_100004AE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void __trialLogHandle_block_invoke(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.smsFilter", "trialmanager");
  v2 = (void *)trialLogHandle_sLogHandle;
  trialLogHandle_sLogHandle = (uint64_t)v1;

}

Swift::Bool __swiftcall String.isNumber()()
{
  uint64_t v0;
  unint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  unint64_t v10;
  char v11;
  char v12;
  uint64_t (*v13)(char *, uint64_t);
  uint64_t v14;
  char v15;
  Swift::Bool v16;
  uint64_t v18;
  unint64_t v19;

  v2 = v1;
  v3 = v0;
  v4 = type metadata accessor for CharacterSet(0);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = __chkstk_darwin();
  v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = HIBYTE(v2) & 0xF;
  if ((v2 & 0x2000000000000000) == 0)
    v9 = v3 & 0xFFFFFFFFFFFFLL;
  if (!v9)
    return 0;
  v18 = v3;
  v19 = v2;
  static CharacterSet.decimalDigits.getter(v6);
  v10 = lazy protocol witness table accessor for type String and conformance String();
  StringProtocol.rangeOfCharacter(from:options:range:)(v8, 0, 0, 0, 1, &type metadata for String, v10);
  v12 = v11;
  v13 = *(uint64_t (**)(char *, uint64_t))(v5 + 8);
  v14 = v13(v8, v4);
  if ((v12 & 1) != 0)
    return 0;
  v18 = v3;
  v19 = v2;
  static CharacterSet.letters.getter(v14);
  StringProtocol.rangeOfCharacter(from:options:range:)(v8, 0, 0, 0, 1, &type metadata for String, v10);
  v16 = v15 & 1;
  v13(v8, v4);
  return v16;
}

unint64_t lazy protocol witness table accessor for type String and conformance String()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type String and conformance String;
  if (!lazy protocol witness table cache variable for type String and conformance String)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type String and conformance String);
  }
  return result;
}

Swift::Bool __swiftcall String.isAlphanumeric()()
{
  uint64_t v0;
  unint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  Swift::Bool v15;
  void (*v16)(char *, uint64_t);
  _QWORD v18[2];

  v2 = v1;
  v3 = v0;
  v4 = type metadata accessor for CharacterSet(0);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = ((uint64_t (*)(void))__chkstk_darwin)();
  v8 = (char *)v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  v10 = (char *)v18 - v9;
  v11 = HIBYTE(v2) & 0xF;
  if ((v2 & 0x2000000000000000) == 0)
    v11 = v3 & 0xFFFFFFFFFFFFLL;
  if (!v11)
    return 0;
  v12 = CharacterSet.init(charactersIn:)(0xD000000000000041, 0x800000010001B9A0);
  v18[0] = v3;
  v18[1] = v2;
  CharacterSet.inverted.getter(v12);
  v13 = lazy protocol witness table accessor for type String and conformance String();
  StringProtocol.rangeOfCharacter(from:options:range:)(v8, 0, 0, 0, 1, &type metadata for String, v13);
  v15 = v14 & 1;
  v16 = *(void (**)(char *, uint64_t))(v5 + 8);
  v16(v8, v4);
  v16(v10, v4);
  return v15;
}

Swift::Bool __swiftcall String.matches(_:)(Swift::String a1)
{
  uint64_t v1;
  _BOOL8 v2;
  _BOOL8 v3;
  uint64_t v4;
  void *object;
  uint64_t countAndFlagsBits;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  unint64_t v11;
  char v12;
  _QWORD v14[4];

  v3 = v2;
  v4 = v1;
  object = a1._object;
  countAndFlagsBits = a1._countAndFlagsBits;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Locale?);
  __chkstk_darwin(v7);
  v9 = (char *)v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14[2] = v4;
  v14[3] = v3;
  v14[0] = countAndFlagsBits;
  v14[1] = object;
  v10 = type metadata accessor for Locale(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v9, 1, 1, v10);
  v11 = lazy protocol witness table accessor for type String and conformance String();
  StringProtocol.range<A>(of:options:range:locale:)(v14, 1024, 0, 0, 1, v9, &type metadata for String, &type metadata for String, v11, v11);
  LOBYTE(v3) = (v12 & 1) == 0;
  outlined destroy of Locale?((uint64_t)v9);
  return v3;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = swift_getTypeByMangledNameInContext2((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t outlined destroy of Locale?(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Locale?);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

Swift::Bool __swiftcall String.compare(_:)(Swift::String a1)
{
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  Swift::String v5;
  uint64_t v6;
  uint64_t v7;

  v6 = v1;
  v7 = v2;
  v5 = a1;
  v3 = lazy protocol witness table accessor for type String and conformance String();
  return StringProtocol.caseInsensitiveCompare<A>(_:)(&v5, &type metadata for String, &type metadata for String, v3, v3) == 0;
}

uint64_t += infix<A>(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;

  __chkstk_darwin();
  v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v6 + 16))(v5);
  v7 = type metadata accessor for Array(0, a3);
  return Array.append(_:)(v5, v7);
}

uint64_t variable initialization expression of RegionPropertiesReader._regions()
{
  return 0;
}

uint64_t variable initialization expression of SmsFilter._initDone()
{
  return 0;
}

uint64_t variable initialization expression of SmsFilter._regexSubclassificationFilter()
{
  return 1;
}

uint64_t variable initialization expression of SmsFilter._dateCheckpoint@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;

  v2 = type metadata accessor for Date(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 56))(a1, 1, 1, v2);
}

uint64_t variable initialization expression of SmsFilter._region@<X0>(uint64_t a1@<X8>)
{
  _OWORD v3[8];

  _s15extensionFilter6RegionVSgWOi0_(v3);
  return outlined init with take of Region?((uint64_t)v3, a1);
}

double variable initialization expression of SmsFilter._transactionalThreshold()
{
  return 0.5;
}

uint64_t variable initialization expression of SmsFilter._retryTransitionTimerForMainModel()
{
  return 1440;
}

void *variable initialization expression of RegexFilter.templateRegexList()
{
  return &_swiftEmptyArrayStorage;
}

unint64_t variable initialization expression of RegexFilter.regexDict()
{
  uint64_t v0;
  uint64_t inited;
  uint64_t v3;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(String, String)>);
  inited = swift_initStackObject(v0, &v3);
  *(_OWORD *)(inited + 16) = xmmword_100019B50;
  *(_QWORD *)(inited + 32) = 0x246574614424;
  *(_QWORD *)(inited + 40) = 0xE600000000000000;
  *(_QWORD *)(inited + 48) = 0xD0000000000000B0;
  *(_QWORD *)(inited + 56) = 0x800000010001B9F0;
  *(_QWORD *)(inited + 64) = 0x746E756F63634124;
  *(_QWORD *)(inited + 72) = 0xEF247265626D754ELL;
  *(_QWORD *)(inited + 80) = 0xD00000000000005CLL;
  *(_QWORD *)(inited + 88) = 0x800000010001BAB0;
  strcpy((char *)(inited + 96), "$PhoneNumber$");
  *(_WORD *)(inited + 110) = -4864;
  *(_QWORD *)(inited + 112) = 0xD000000000000068;
  *(_QWORD *)(inited + 120) = 0x800000010001BB10;
  *(_QWORD *)(inited + 128) = 0x24746E756F6D4124;
  *(_QWORD *)(inited + 136) = 0xE800000000000000;
  *(_QWORD *)(inited + 144) = 0x100000000000004ALL;
  *(_QWORD *)(inited + 152) = 0x800000010001BB80;
  *(_QWORD *)(inited + 160) = 0x244C525524;
  *(_QWORD *)(inited + 168) = 0xE500000000000000;
  *(_QWORD *)(inited + 176) = 0xD0000000000000C1;
  *(_QWORD *)(inited + 184) = 0x800000010001BBD0;
  return specialized Dictionary.init(dictionaryLiteral:)(inited);
}

double variable initialization expression of RegexMessageReader._regex@<D0>(uint64_t a1@<X8>)
{
  double result;

  *(_QWORD *)(a1 + 32) = 0;
  result = 0.0;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  return result;
}

double _s15extensionFilter6RegionVSgWOi0_(_OWORD *a1)
{
  double result;

  result = 0.0;
  a1[6] = 0u;
  a1[7] = 0u;
  a1[4] = 0u;
  a1[5] = 0u;
  a1[2] = 0u;
  a1[3] = 0u;
  *a1 = 0u;
  a1[1] = 0u;
  return result;
}

uint64_t outlined init with take of Region?(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Region?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void type metadata accessor for ILMessageFilterSubAction(uint64_t a1)
{
  type metadata accessor for ILMessageFilterSubAction(a1, &lazy cache variable for type metadata for ILMessageFilterSubAction, (uint64_t)&unk_100020E00);
}

void type metadata accessor for ILMessageFilterAction(uint64_t a1)
{
  type metadata accessor for ILMessageFilterSubAction(a1, &lazy cache variable for type metadata for ILMessageFilterAction, (uint64_t)&unk_100020E20);
}

uint64_t base witness table accessor for Equatable in ILMessageFilterAction()
{
  return lazy protocol witness table accessor for type ILMessageFilterAction and conformance ILMessageFilterAction(&lazy protocol witness table cache variable for type ILMessageFilterAction and conformance ILMessageFilterAction, (uint64_t (*)(uint64_t))type metadata accessor for ILMessageFilterAction, (uint64_t)&protocol conformance descriptor for ILMessageFilterAction);
}

uint64_t protocol witness for RawRepresentable.rawValue.getter in conformance NLLanguage@<X0>(uint64_t *a1@<X8>)
{
  _QWORD *v1;
  uint64_t result;
  uint64_t v4;

  result = static String._unconditionallyBridgeFromObjectiveC(_:)(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

_QWORD *protocol witness for RawRepresentable.init(rawValue:) in conformance ILMessageFilterAction@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = *result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

void protocol witness for RawRepresentable.rawValue.getter in conformance ILMessageFilterAction(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

void protocol witness for Hashable.hash(into:) in conformance ILMessageFilterAction()
{
  Swift::UInt *v0;

  Hasher._combine(_:)(*v0);
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance ILMessageFilterAction()
{
  Swift::UInt *v0;
  Swift::UInt v1;
  _QWORD v3[9];

  v1 = *v0;
  Hasher.init(_seed:)(v3, 0);
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance ILMessageFilterAction(uint64_t a1)
{
  Swift::UInt *v1;
  Swift::UInt v2;
  _QWORD v4[9];

  v2 = *v1;
  Hasher.init(_seed:)(v4, a1);
  Hasher._combine(_:)(v2);
  return Hasher._finalize()();
}

void protocol witness for SetAlgebra.init() in conformance NSMatchingOptions(_QWORD *a1@<X8>)
{
  *a1 = 0;
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance ILMessageFilterAction(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

uint64_t base witness table accessor for Equatable in ILMessageFilterSubAction()
{
  return lazy protocol witness table accessor for type ILMessageFilterAction and conformance ILMessageFilterAction(&lazy protocol witness table cache variable for type ILMessageFilterSubAction and conformance ILMessageFilterSubAction, (uint64_t (*)(uint64_t))type metadata accessor for ILMessageFilterSubAction, (uint64_t)&protocol conformance descriptor for ILMessageFilterSubAction);
}

uint64_t lazy protocol witness table accessor for type ILMessageFilterAction and conformance ILMessageFilterAction(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = swift_getWitnessTable(a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

_QWORD *protocol witness for OptionSet.init(rawValue:) in conformance NSMatchingOptions@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = *result;
  return result;
}

void type metadata accessor for NSMatchingFlags(uint64_t a1)
{
  type metadata accessor for ILMessageFilterSubAction(a1, &lazy cache variable for type metadata for NSMatchingFlags, (uint64_t)&unk_100020E40);
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for _NSRange(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for _NSRange(uint64_t result, int a2, int a3)
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

void type metadata accessor for _NSRange(uint64_t a1)
{
  type metadata accessor for ILMessageFilterSubAction(a1, &lazy cache variable for type metadata for _NSRange, (uint64_t)&unk_100020EC0);
}

void type metadata accessor for ILMessageFilterSubAction(uint64_t a1, unint64_t *a2, uint64_t a3)
{
  unint64_t ForeignTypeMetadata;
  uint64_t v5;

  if (!*a2)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata(0, a3);
    if (!v5)
      atomic_store(ForeignTypeMetadata, a2);
  }
}

void RegionPropertiesReader._regions.setter()
{
  swift_deletedMethodError();
  __break(1u);
}

uint64_t RegionUtils._region.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  _BYTE v5[24];
  _QWORD v6[16];

  v3 = v1 + 16;
  swift_beginAccess(v3, v5, 0, 0);
  outlined init with take of Region?(v3, (uint64_t)v6);
  outlined retain of Region?(v6, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))outlined copy of Region?);
  return outlined init with take of Region?((uint64_t)v6, a1);
}

uint64_t outlined copy of Region?(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  uint64_t result;

  if (a2)
  {
    swift_bridgeObjectRetain(a2);
    swift_bridgeObjectRetain(a5);
    swift_bridgeObjectRetain(a8);
    swift_bridgeObjectRetain(a9);
    swift_bridgeObjectRetain(a10);
    swift_bridgeObjectRetain(a15);
    return swift_bridgeObjectRetain(a16);
  }
  return result;
}

_QWORD *RegionUtils._region.setter(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  _BYTE v5[24];
  _QWORD v6[16];

  v3 = v1 + 16;
  swift_beginAccess(v3, v5, 1, 0);
  outlined init with take of Region?(v3, (uint64_t)v6);
  outlined init with take of Region?((uint64_t)a1, v3);
  outlined retain of Region?(a1, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))outlined copy of Region?);
  outlined retain of Region?(v6, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))outlined consume of Region?);
  return outlined retain of Region?(a1, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))outlined consume of Region?);
}

_QWORD *outlined retain of Region?(_QWORD *a1, void (*a2)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))
{
  a2(*a1, a1[1], a1[2], a1[3], a1[4], a1[5], a1[6], a1[7], a1[8], a1[9], a1[10], a1[11], a1[12], a1[13], a1[14], a1[15]);
  return a1;
}

uint64_t outlined consume of Region?(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  uint64_t result;

  if (a2)
  {
    swift_bridgeObjectRelease(a2);
    swift_bridgeObjectRelease(a5);
    swift_bridgeObjectRelease(a8);
    swift_bridgeObjectRelease(a9);
    swift_bridgeObjectRelease(a10);
    swift_bridgeObjectRelease(a15);
    return swift_bridgeObjectRelease(a16);
  }
  return result;
}

uint64_t (*RegionUtils._region.modify(uint64_t a1))()
{
  uint64_t v1;

  swift_beginAccess(v1 + 16, a1, 33, 0);
  return RegionUtils._region.modify;
}

uint64_t RegionUtils.__allocating_init(for:)(_OWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  Swift::OpaquePointer v8;
  Swift::OpaquePointer v9;
  _BYTE v11[24];
  _OWORD v12[8];
  _OWORD v13[8];
  _QWORD v14[16];

  v3 = swift_allocObject(v1, 144, 7);
  _s15extensionFilter6RegionVSgWOi0_(v12);
  outlined init with take of Region?((uint64_t)v12, v3 + 16);
  v4 = a1[5];
  v13[4] = a1[4];
  v13[5] = v4;
  v5 = a1[7];
  v13[6] = a1[6];
  v13[7] = v5;
  v6 = a1[1];
  v13[0] = *a1;
  v13[1] = v6;
  v7 = a1[3];
  v13[2] = a1[2];
  v13[3] = v7;
  Regex.subCategories.init(finance:reminders:orders:)((Swift::OpaquePointer)v13, v8, v9);
  swift_beginAccess(v3 + 16, v11, 1, 0);
  outlined init with take of Region?(v3 + 16, (uint64_t)v14);
  outlined init with take of Region?((uint64_t)v13, v3 + 16);
  outlined retain of Region?(v14, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))outlined consume of Region?);
  return v3;
}

uint64_t RegionUtils.init(for:)(_OWORD *a1)
{
  uint64_t v1;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  Swift::OpaquePointer v7;
  Swift::OpaquePointer v8;
  _BYTE v10[24];
  _OWORD v11[8];
  _OWORD v12[8];
  _QWORD v13[18];

  _s15extensionFilter6RegionVSgWOi0_(v11);
  outlined init with take of Region?((uint64_t)v11, v1 + 16);
  v3 = a1[5];
  v12[4] = a1[4];
  v12[5] = v3;
  v4 = a1[7];
  v12[6] = a1[6];
  v12[7] = v4;
  v5 = a1[1];
  v12[0] = *a1;
  v12[1] = v5;
  v6 = a1[3];
  v12[2] = a1[2];
  v12[3] = v6;
  Regex.subCategories.init(finance:reminders:orders:)((Swift::OpaquePointer)v12, v7, v8);
  swift_beginAccess(v1 + 16, v10, 1, 0);
  outlined init with take of Region?(v1 + 16, (uint64_t)v13);
  outlined init with take of Region?((uint64_t)v12, v1 + 16);
  outlined retain of Region?(v13, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))outlined consume of Region?);
  return v1;
}

Swift::Bool __swiftcall RegionUtils.shouldApplyFilter(sender:)(Swift::String sender)
{
  _QWORD *v1;
  _QWORD *v2;
  unint64_t object;
  uint64_t countAndFlagsBits;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  os_log_type_t v21;
  _BOOL4 v22;
  uint64_t v23;
  uint8_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  char v35;
  char v36;
  uint64_t (*v37)(char *, uint64_t);
  uint64_t v38;
  char v39;
  char v40;
  char v41;
  Swift::String v42;
  void *v43;
  Swift::Bool v44;
  unint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  unint64_t v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;
  char v54;
  char v55;
  uint64_t (*v56)(char *, uint64_t);
  uint64_t v57;
  char v58;
  char v59;
  uint64_t v60;
  Swift::String v61;
  uint64_t v62;
  unint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  unint64_t v67;
  unint64_t v68;
  uint64_t v69;
  uint64_t v70;
  unint64_t v71;
  char v72;
  char v73;
  uint64_t (*v74)(char *, uint64_t);
  uint64_t v75;
  char v76;
  char v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  unint64_t v81;
  unint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  char *v90;
  uint64_t v91;
  unint64_t v92;
  char v93;
  char v94;
  void (*v95)(char *, uint64_t);
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  Swift::String v104;
  uint64_t v105;
  uint64_t v106;
  NSObject *v107;
  os_log_type_t v108;
  uint8_t *v109;
  uint64_t v111;
  char *v112;
  uint64_t v113;
  char *v114;
  unint64_t v115;
  _QWORD *v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  void *v122;
  _BYTE v123[128];
  uint64_t v124;
  unint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128[16];
  _BYTE v129[128];
  _BYTE v130[128];
  _BYTE v131[128];
  _BYTE v132[128];
  uint64_t v133;
  _BYTE v134[128];
  _BYTE v135[136];

  v2 = v1;
  object = (unint64_t)sender._object;
  countAndFlagsBits = sender._countAndFlagsBits;
  v5 = type metadata accessor for CharacterSet(0);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = __chkstk_darwin(v5);
  v9 = (char *)&v111 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  v11 = (char *)&v111 - v10;
  v12 = (uint64_t)(v1 + 2);
  swift_beginAccess(v12, &v133, 0, 0);
  outlined init with take of Region?(v12, (uint64_t)v134);
  outlined init with take of Region?((uint64_t)v134, (uint64_t)v135);
  LODWORD(v13) = _s15extensionFilter6RegionVSgWOg((uint64_t)v135);
  if ((_DWORD)v13 == 1)
  {
LABEL_59:
    __break(1u);
    goto LABEL_60;
  }
  v14 = v2[5];
  v122 = (void *)v2[6];
  outlined init with take of Region?(v12, (uint64_t)v131);
  outlined init with take of Region?((uint64_t)v131, (uint64_t)v132);
  LODWORD(v13) = _s15extensionFilter6RegionVSgWOg((uint64_t)v132);
  if ((_DWORD)v13 == 1)
  {
LABEL_60:
    __break(1u);
    goto LABEL_61;
  }
  v118 = v14;
  v115 = v2[7];
  v121 = v12;
  outlined init with take of Region?(v12, (uint64_t)v129);
  outlined init with take of Region?((uint64_t)v129, (uint64_t)v130);
  LODWORD(v13) = _s15extensionFilter6RegionVSgWOg((uint64_t)v130);
  if ((_DWORD)v13 == 1)
  {
LABEL_61:
    __break(1u);
LABEL_62:
    __break(1u);
    goto LABEL_63;
  }
  v15 = v2[10];
  v16 = one-time initialization token for logger;
  swift_bridgeObjectRetain(v122);
  v119 = v15;
  swift_bridgeObjectRetain(v15);
  if (v16 != -1)
    swift_once(&one-time initialization token for logger, one-time initialization function for logger);
  v17 = type metadata accessor for Logger(0);
  v18 = __swift_project_value_buffer(v17, (uint64_t)logger);
  v19 = swift_bridgeObjectRetain_n(object, 2);
  v113 = v18;
  v20 = Logger.logObject.getter(v19);
  v21 = static os_log_type_t.default.getter();
  v22 = os_log_type_enabled(v20, v21);
  v120 = countAndFlagsBits;
  v114 = v9;
  if (v22)
  {
    v117 = v6;
    v23 = swift_slowAlloc(12, -1);
    v112 = v11;
    v24 = (uint8_t *)v23;
    v25 = swift_slowAlloc(32, -1);
    v116 = v2;
    v26 = v25;
    v128[0] = v25;
    *(_DWORD *)v24 = 136315138;
    swift_bridgeObjectRetain(object);
    v11 = v112;
    v126 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(countAndFlagsBits, object, v128);
    v6 = v117;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v126, &v127);
    swift_bridgeObjectRelease_n(object, 3);
    _os_log_impl((void *)&_mh_execute_header, v20, v21, "smsfilter: senderID: %s", v24, 0xCu);
    swift_arrayDestroy(v26, 1, (char *)&type metadata for Any + 8);
    v27 = v26;
    v2 = v116;
    swift_slowDealloc(v27, -1, -1);
    swift_slowDealloc(v24, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n(object, 2);
  }
  v28 = v121;
  outlined init with take of Region?(v121, (uint64_t)&v126);
  outlined init with take of Region?((uint64_t)&v126, (uint64_t)v128);
  LODWORD(v13) = _s15extensionFilter6RegionVSgWOg((uint64_t)v128);
  if ((_DWORD)v13 == 1)
    goto LABEL_62;
  v29 = v2[2];
  v30 = v2[3];
  v31 = v120;
  if (v29 == 28259 && v30 == 0xE200000000000000
    || (_stringCompareWithSmolCheck(_:_:expecting:)(v29, v30, 28259, 0xE200000000000000, 0) & 1) != 0)
  {
    swift_bridgeObjectRelease(v119);
    v32 = swift_bridgeObjectRelease(v122);
    v33 = HIBYTE(object) & 0xF;
    if ((object & 0x2000000000000000) == 0)
      v33 = v31 & 0xFFFFFFFFFFFFLL;
    if (v33)
    {
      v124 = v31;
      v125 = object;
      static CharacterSet.decimalDigits.getter(v32);
      v34 = lazy protocol witness table accessor for type String and conformance String();
      StringProtocol.rangeOfCharacter(from:options:range:)(v11, 0, 0, 0, 1, &type metadata for String, v34);
      v36 = v35;
      v37 = *(uint64_t (**)(char *, uint64_t))(v6 + 8);
      v38 = v37(v11, v5);
      if ((v36 & 1) == 0)
      {
        v124 = v31;
        v125 = object;
        static CharacterSet.letters.getter(v38);
        StringProtocol.rangeOfCharacter(from:options:range:)(v11, 0, 0, 0, 1, &type metadata for String, v34);
        v40 = v39;
        v37(v11, v5);
        if ((v40 & 1) != 0)
        {
          v78 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<String>);
          v79 = swift_allocObject(v78, 48, 7);
          *(_OWORD *)(v79 + 16) = xmmword_100019D50;
          *(_QWORD *)(v79 + 32) = 3551281;
          *(_QWORD *)(v79 + 40) = 0xE300000000000000;
          v124 = v31;
          v125 = object;
          swift_bridgeObjectRetain(object);
          v80 = String.init<A>(_:)(&v124, &type metadata for String, &protocol witness table for String, &protocol witness table for String);
          v82 = v81;
          v83 = specialized Collection.prefix(_:)(3, v80, v81);
          v85 = v84;
          swift_bridgeObjectRelease(v82);
          v86 = static String._fromSubstring(_:)(v83);
          v88 = v87;
          swift_bridgeObjectRelease(v85);
          v41 = specialized Sequence<>.contains(_:)(v86, v88, (_QWORD *)v79);
          swift_bridgeObjectRelease(v88);
          swift_setDeallocating(v79);
          swift_arrayDestroy(v79 + 32, 1, &type metadata for String);
          swift_deallocClassInstance(v79, 32, 7);
          goto LABEL_19;
        }
      }
    }
    goto LABEL_18;
  }
  v42._countAndFlagsBits = v118;
  v43 = v122;
  v42._object = v122;
  v44 = String.hasPrefix(_:)(v42);
  swift_bridgeObjectRelease(v43);
  if (!v44)
  {
    swift_bridgeObjectRelease(v119);
    v61._countAndFlagsBits = 43;
    v61._object = (void *)0xE100000000000000;
    if (String.hasPrefix(_:)(v61))
    {
      v62 = v6;
      swift_bridgeObjectRetain(object);
      v63 = specialized Collection.dropFirst(_:)(1uLL, v31, object);
      v65 = v64;
      swift_bridgeObjectRelease(object);
      v66 = static String._fromSubstring(_:)(v63);
      v68 = v67;
      v69 = swift_bridgeObjectRelease(v65);
      v70 = HIBYTE(v68) & 0xF;
      if ((v68 & 0x2000000000000000) == 0)
        v70 = v66 & 0xFFFFFFFFFFFFLL;
      if (!v70)
        goto LABEL_34;
      v124 = v66;
      v125 = v68;
      static CharacterSet.decimalDigits.getter(v69);
      v71 = lazy protocol witness table accessor for type String and conformance String();
      StringProtocol.rangeOfCharacter(from:options:range:)(v11, 0, 0, 0, 1, &type metadata for String, v71);
      v73 = v72;
      v74 = *(uint64_t (**)(char *, uint64_t))(v62 + 8);
      v75 = v74(v11, v5);
      if ((v73 & 1) != 0
        || (v124 = v66,
            v125 = v68,
            static CharacterSet.letters.getter(v75),
            StringProtocol.rangeOfCharacter(from:options:range:)(v11, 0, 0, 0, 1, &type metadata for String, v71), v77 = v76, v74(v11, v5), (v77 & 1) == 0))
      {
LABEL_34:
        swift_bridgeObjectRelease(v68);
        v41 = 0;
        goto LABEL_19;
      }
      v105 = String.count.getter(v66, v68);
      v106 = swift_bridgeObjectRelease(v68);
      if (v105 >= 11)
      {
        v107 = Logger.logObject.getter(v106);
        v108 = static os_log_type_t.default.getter();
        if (os_log_type_enabled(v107, v108))
        {
          v109 = (uint8_t *)swift_slowAlloc(2, -1);
          *(_WORD *)v109 = 0;
          _os_log_impl((void *)&_mh_execute_header, v107, v108, "this is an international valid sms. so, do not classify", v109, 2u);
          swift_slowDealloc(v109, -1, -1);
        }

        v41 = 0;
        goto LABEL_19;
      }
      goto LABEL_18;
    }
    v89 = HIBYTE(object) & 0xF;
    if ((object & 0x2000000000000000) == 0)
      v89 = v31 & 0xFFFFFFFFFFFFLL;
    if (!v89)
      goto LABEL_18;
    v90 = v114;
    v91 = CharacterSet.init(charactersIn:)(0xD000000000000041, 0x800000010001B9A0);
    v124 = v31;
    v125 = object;
    CharacterSet.inverted.getter(v91);
    v92 = lazy protocol witness table accessor for type String and conformance String();
    StringProtocol.rangeOfCharacter(from:options:range:)(v11, 0, 0, 0, 1, &type metadata for String, v92);
    v94 = v93;
    v95 = *(void (**)(char *, uint64_t))(v6 + 8);
    v95(v11, v5);
    v95(v90, v5);
    if ((v94 & 1) == 0)
    {
LABEL_18:
      v41 = 0;
      goto LABEL_19;
    }
    outlined init with take of Region?(v28, (uint64_t)v123);
    outlined init with take of Region?((uint64_t)v123, (uint64_t)&v124);
    LODWORD(v13) = _s15extensionFilter6RegionVSgWOg((uint64_t)&v124);
    if ((_DWORD)v13 != 1)
    {
      v96 = v2[2];
      v97 = v2[3];
      v41 = (v96 != 29557 || v97 != 0xE200000000000000)
         && (_stringCompareWithSmolCheck(_:_:expecting:)(v96, v97, 29557, 0xE200000000000000, 0) & 1) == 0
         || String.count.getter(v31, object) != 10;
      goto LABEL_19;
    }
LABEL_63:
    __break(1u);
    return v13;
  }
  v116 = v2;
  v117 = v6;
  swift_bridgeObjectRetain(object);
  v45 = specialized Collection.dropFirst(_:)(v115, v31, object);
  v47 = v46;
  swift_bridgeObjectRelease(object);
  v48 = static String._fromSubstring(_:)(v45);
  v50 = v49;
  v51 = swift_bridgeObjectRelease(v47);
  v52 = HIBYTE(v50) & 0xF;
  if ((v50 & 0x2000000000000000) == 0)
    v52 = v48 & 0xFFFFFFFFFFFFLL;
  if (!v52)
    goto LABEL_26;
  v124 = v48;
  v125 = v50;
  static CharacterSet.decimalDigits.getter(v51);
  v53 = lazy protocol witness table accessor for type String and conformance String();
  StringProtocol.rangeOfCharacter(from:options:range:)(v11, 0, 0, 0, 1, &type metadata for String, v53);
  v55 = v54;
  v56 = *(uint64_t (**)(char *, uint64_t))(v117 + 8);
  v57 = v56(v11, v5);
  if ((v55 & 1) != 0)
    goto LABEL_26;
  v124 = v48;
  v125 = v50;
  static CharacterSet.letters.getter(v57);
  StringProtocol.rangeOfCharacter(from:options:range:)(v11, 0, 0, 0, 1, &type metadata for String, v53);
  v59 = v58;
  v56(v11, v5);
  if ((v59 & 1) != 0)
  {
    v98 = v119;
    v99 = *(_QWORD *)(v119 + 16);
    if (v99)
    {
      v100 = *(_QWORD *)(v119 + 32);
      v13 = String.count.getter(v48, v50);
      if (v13 == v100)
      {
LABEL_51:
        swift_bridgeObjectRelease(v50);
        swift_bridgeObjectRelease(v98);
        v104._countAndFlagsBits = v31;
        v104._object = (void *)object;
        v41 = RegionUtils.allowExceptions(sender:)(v104);
        goto LABEL_19;
      }
      v101 = 0;
      v102 = v99 - 1;
      while (v102 != v101)
      {
        if ((unint64_t)(v101 + 1) >= *(_QWORD *)(v98 + 16))
        {
          __break(1u);
          goto LABEL_59;
        }
        v103 = *(_QWORD *)(v98 + 8 * v101 + 40);
        v13 = String.count.getter(v48, v50);
        ++v101;
        if (v13 == v103)
          goto LABEL_51;
      }
    }
    swift_bridgeObjectRelease(v50);
    v60 = v98;
  }
  else
  {
LABEL_26:
    swift_bridgeObjectRelease(v50);
    v60 = v119;
  }
  swift_bridgeObjectRelease(v60);
  v41 = 1;
LABEL_19:
  LOBYTE(v13) = v41 & 1;
  return v13;
}

uint64_t _s15extensionFilter6RegionVSgWOg(uint64_t a1)
{
  unint64_t v1;

  v1 = *(_QWORD *)(a1 + 8);
  if (v1 >= 0xFFFFFFFF)
    LODWORD(v1) = -1;
  return (v1 + 1);
}

uint64_t specialized Sequence<>.contains(_:)(uint64_t a1, uint64_t a2, _QWORD *a3)
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
  result = _stringCompareWithSmolCheck(_:_:expecting:)();
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
    if (v12 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
      return 1;
    result = 0;
    v9 += 2;
    if (v11 == v3)
      return result;
  }
  __break(1u);
  return result;
}

Swift::Bool __swiftcall RegionUtils.allowExceptions(sender:)(Swift::String sender)
{
  uint64_t v1;
  void *object;
  uint64_t countAndFlagsBits;
  int v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  BOOL v9;
  BOOL v10;
  void **v11;
  uint64_t v12;
  void *v13;
  char v16[24];
  _BYTE v17[128];
  _BYTE v18[128];

  object = sender._object;
  countAndFlagsBits = sender._countAndFlagsBits;
  swift_beginAccess(v1 + 16, v16, 0, 0);
  outlined init with take of Region?(v1 + 16, (uint64_t)v17);
  outlined init with take of Region?((uint64_t)v17, (uint64_t)v18);
  v4 = _s15extensionFilter6RegionVSgWOg((uint64_t)v18);
  if (v4 == 1)
  {
    __break(1u);
  }
  else
  {
    v5 = *(_QWORD **)(v1 + 88);
    v6 = v5[2];
    if (v6)
    {
      v7 = v5[4];
      v8 = (void *)v5[5];
      v9 = v7 == countAndFlagsBits && v8 == object;
      if (v9 || (_stringCompareWithSmolCheck(_:_:expecting:)(countAndFlagsBits, object, v7, v8, 0) & 1) != 0)
      {
        v10 = 1;
      }
      else
      {
        v11 = (void **)(v5 + 7);
        do
        {
          v10 = --v6 != 0;
          if (!v6)
            break;
          v12 = (uint64_t)*(v11 - 1);
          v13 = *v11;
          if (v12 == countAndFlagsBits && v13 == object)
            break;
          v11 += 2;
        }
        while ((_stringCompareWithSmolCheck(_:_:expecting:)(countAndFlagsBits, object, v12, v13, 0) & 1) == 0);
      }
    }
    else
    {
      v10 = 0;
    }
    LOBYTE(v4) = v10;
  }
  return v4;
}

Swift::Bool __swiftcall RegionUtils.dominantLanguageOfMessage(message:regionLanguage:)(Swift::String message, NLLanguage regionLanguage)
{
  void *v3;
  NSString v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;
  char v13;

  v3 = (void *)objc_opt_self(NLLanguageRecognizer);
  v4 = String._bridgeToObjectiveC()();
  v5 = objc_msgSend(v3, "dominantLanguageForString:", v4);

  if (v5)
  {
    v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(v5);
    v8 = v7;
    v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(regionLanguage);
    if (v6 == v9 && v8 == v10)
    {
      v13 = 1;
      v12 = v8;
    }
    else
    {
      v12 = v10;
      v13 = _stringCompareWithSmolCheck(_:_:expecting:)(v6, v8, v9, v10, 0);
    }
    swift_bridgeObjectRelease(v8);
    swift_bridgeObjectRelease(v12);

  }
  else
  {
    v13 = 0;
  }
  return v13 & 1;
}

Swift::Bool __swiftcall RegionUtils.dominantLanguageMatch(message:)(Swift::String message)
{
  _QWORD *v1;
  int v2;
  uint64_t v3;
  uint64_t v4;
  BOOL v5;
  uint64_t v6;
  NSString v7;
  void *v8;
  NSString v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  _BYTE v19[128];
  _BYTE v20[128];
  _BYTE v21[24];
  _BYTE v22[128];
  _BYTE v23[128];

  swift_beginAccess(v1 + 2, v21, 0, 0);
  outlined init with take of Region?((uint64_t)(v1 + 2), (uint64_t)v22);
  outlined init with take of Region?((uint64_t)v22, (uint64_t)v23);
  v2 = _s15extensionFilter6RegionVSgWOg((uint64_t)v23);
  if (v2 == 1)
  {
    __break(1u);
    goto LABEL_18;
  }
  v3 = v1[2];
  v4 = v1[3];
  v5 = v3 == 29282 && v4 == 0xE200000000000000;
  if (v5 || (_stringCompareWithSmolCheck(_:_:expecting:)(v3, v4, 29282, 0xE200000000000000, 0) & 1) != 0)
  {
    outlined init with take of Region?((uint64_t)(v1 + 2), (uint64_t)v19);
    outlined init with take of Region?((uint64_t)v19, (uint64_t)v20);
    v2 = _s15extensionFilter6RegionVSgWOg((uint64_t)v20);
    if (v2 != 1)
    {
      v6 = v1[9];
      swift_bridgeObjectRetain(v6);
      v7 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease(v6);
      v8 = (void *)objc_opt_self(NLLanguageRecognizer);
      v9 = String._bridgeToObjectiveC()();
      v10 = objc_msgSend(v8, "dominantLanguageForString:", v9);

      if (v10)
      {
        v11 = static String._unconditionallyBridgeFromObjectiveC(_:)(v10);
        v13 = v12;
        v15 = static String._unconditionallyBridgeFromObjectiveC(_:)(v7);
        v16 = v14;
        if (v11 == v15 && v13 == v14)
        {
          v17 = 1;
          v16 = v13;
        }
        else
        {
          v17 = _stringCompareWithSmolCheck(_:_:expecting:)(v11, v13, v15, v14, 0);
        }
        swift_bridgeObjectRelease(v13);
        swift_bridgeObjectRelease(v16);

      }
      else
      {

        v17 = 0;
      }
      goto LABEL_16;
    }
LABEL_18:
    __break(1u);
    return v2;
  }
  v17 = 1;
LABEL_16:
  LOBYTE(v2) = v17 & 1;
  return v2;
}

uint64_t RegionUtils.deinit()
{
  uint64_t v0;
  _QWORD v2[16];

  outlined init with take of Region?(v0 + 16, (uint64_t)v2);
  outlined retain of Region?(v2, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))outlined consume of Region?);
  return v0;
}

uint64_t RegionUtils.__deallocating_deinit()
{
  uint64_t v0;
  _QWORD v2[16];

  outlined init with take of Region?(v0 + 16, (uint64_t)v2);
  outlined retain of Region?(v2, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))outlined consume of Region?);
  return swift_deallocClassInstance(v0, 144, 7);
}

Swift::OpaquePointer_optional __swiftcall getMySimRegions()()
{
  id v0;
  void *v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void (*v11)(_QWORD *__return_ptr, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  BOOL v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  char *v23;
  Swift::Bool v24;
  uint64_t v25;
  NSObject *v26;
  os_log_type_t v27;
  uint8_t *v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD v32[16];
  _BYTE v33[136];
  Swift::OpaquePointer_optional result;

  v0 = getActiveSimRegions();
  if (!v0)
  {
    if (one-time initialization token for logger != -1)
      goto LABEL_38;
    goto LABEL_31;
  }
  v1 = v0;
  v2 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v0, &type metadata for String);

  v31 = *(_QWORD *)(v2 + 16);
  if (!v31)
  {
    swift_bridgeObjectRelease(v2);
    v5 = (char *)&_swiftEmptyArrayStorage;
    goto LABEL_35;
  }
  v3 = 0;
  v4 = v2 + 32;
  v5 = (char *)&_swiftEmptyArrayStorage;
  v30 = v2;
  while (v3 < *(_QWORD *)(v2 + 16))
  {
    v6 = (uint64_t *)(v4 + 16 * v3);
    v8 = *v6;
    v7 = v6[1];
    v9 = one-time initialization token for sharedRegionProperties;
    swift_bridgeObjectRetain(v7);
    if (v9 != -1)
      swift_once(&one-time initialization token for sharedRegionProperties, one-time initialization function for sharedRegionProperties);
    v10 = static RegionPropertiesReader.sharedRegionProperties;
    v11 = *(void (**)(_QWORD *__return_ptr, uint64_t, uint64_t))(*(_QWORD *)static RegionPropertiesReader.sharedRegionProperties
                                                                        + 136);
    swift_retain(static RegionPropertiesReader.sharedRegionProperties);
    v11(v32, v8, v7);
    swift_release(v10);
    outlined retain of Region?(v32, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))outlined consume of Region?);
    outlined init with take of Region?((uint64_t)v32, (uint64_t)v33);
    if (_s15extensionFilter6RegionVSgWOg((uint64_t)v33) != 1)
    {
      v12 = *((_QWORD *)v5 + 2);
      if (!v12)
        goto LABEL_23;
      v13 = *((_QWORD *)v5 + 4);
      v14 = *((_QWORD *)v5 + 5);
      v2 = v30;
      if ((v13 != v8 || v14 != v7) && (_stringCompareWithSmolCheck(_:_:expecting:)(v13, v14, v8, v7, 0) & 1) == 0)
      {
        if (v12 != 1)
        {
          v15 = (uint64_t *)(v5 + 56);
          v16 = 1;
          while (1)
          {
            v17 = *(v15 - 1);
            v18 = *v15;
            v19 = v17 == v8 && v18 == v7;
            if (v19 || (_stringCompareWithSmolCheck(_:_:expecting:)(v17, v18, v8, v7, 0) & 1) != 0)
              break;
            v20 = v16 + 1;
            if (__OFADD__(v16, 1))
              goto LABEL_37;
            v15 += 2;
            ++v16;
            if (v20 == v12)
              goto LABEL_23;
          }
          swift_bridgeObjectRelease(v7);
          v2 = v30;
          goto LABEL_5;
        }
LABEL_23:
        if ((swift_isUniquelyReferenced_nonNull_native(v5) & 1) == 0)
          v5 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v12 + 1, 1, v5);
        v2 = v30;
        v22 = *((_QWORD *)v5 + 2);
        v21 = *((_QWORD *)v5 + 3);
        if (v22 >= v21 >> 1)
          v5 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v21 > 1), v22 + 1, 1, v5);
        *((_QWORD *)v5 + 2) = v22 + 1;
        v23 = &v5[16 * v22];
        *((_QWORD *)v23 + 4) = v8;
        *((_QWORD *)v23 + 5) = v7;
        goto LABEL_5;
      }
    }
    swift_bridgeObjectRelease(v7);
LABEL_5:
    if (++v3 == v31)
    {
      swift_bridgeObjectRelease(v2);
      goto LABEL_35;
    }
  }
  __break(1u);
LABEL_37:
  __break(1u);
LABEL_38:
  swift_once(&one-time initialization token for logger, one-time initialization function for logger);
LABEL_31:
  v25 = type metadata accessor for Logger(0);
  __swift_project_value_buffer(v25, (uint64_t)logger);
  v26 = Logger.logObject.getter();
  v27 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v26, v27))
  {
    v28 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v28 = 0;
    _os_log_impl((void *)&_mh_execute_header, v26, v27, "smsfilter: no supported active sim-region", v28, 2u);
    swift_slowDealloc(v28, -1, -1);
  }

  v5 = 0;
LABEL_35:
  v29 = v5;
  result.value._rawValue = v29;
  result.is_nil = v24;
  return result;
}

Swift::Bool __swiftcall validSimRegion(currentSimRegion:)(Swift::String currentSimRegion)
{
  void *object;
  uint64_t countAndFlagsBits;
  _QWORD *MySim;
  _QWORD *v4;
  char v5;

  object = currentSimRegion._object;
  countAndFlagsBits = currentSimRegion._countAndFlagsBits;
  MySim = (_QWORD *)getMySimRegions()();
  if (MySim)
  {
    v4 = MySim;
    v5 = specialized Sequence<>.contains(_:)(countAndFlagsBits, (uint64_t)object, MySim);
    swift_bridgeObjectRelease(v4);
    LOBYTE(MySim) = v5 & 1;
  }
  return (char)MySim;
}

Swift::Bool __swiftcall simRegionSupported(for:)(Swift::String a1)
{
  void *object;
  uint64_t countAndFlagsBits;
  void *v3;
  void (*v4)(_QWORD *__return_ptr, uint64_t, void *);
  int v5;
  _QWORD v7[16];
  _BYTE v8[128];

  object = a1._object;
  countAndFlagsBits = a1._countAndFlagsBits;
  if (one-time initialization token for sharedRegionProperties != -1)
    swift_once(&one-time initialization token for sharedRegionProperties, one-time initialization function for sharedRegionProperties);
  v3 = static RegionPropertiesReader.sharedRegionProperties;
  v4 = *(void (**)(_QWORD *__return_ptr, uint64_t, void *))(*(_QWORD *)static RegionPropertiesReader.sharedRegionProperties
                                                                    + 136);
  swift_retain(static RegionPropertiesReader.sharedRegionProperties);
  v4(v7, countAndFlagsBits, object);
  swift_release(v3);
  outlined init with take of Region?((uint64_t)v7, (uint64_t)v8);
  v5 = _s15extensionFilter6RegionVSgWOg((uint64_t)v8);
  if (v5 != 1)
    outlined retain of Region?(v7, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))outlined consume of Region?);
  return v5 != 1;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t serialize(_:at:)(uint64_t result, _BYTE **a2)
{
  _BYTE *v2;

  v2 = *a2;
  *v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t closure #1 in osLogInternal(_:log:type:)(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

char *specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  int64_t v12;
  uint64_t v13;
  char *v14;

  v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    v7 = a2;
    goto LABEL_8;
  }
  v6 = *((_QWORD *)a4 + 3);
  v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2)
    goto LABEL_8;
  if (v7 + 0x4000000000000000 >= 0)
  {
    v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v7 = a2;
LABEL_8:
    v8 = *((_QWORD *)a4 + 2);
    if (v7 <= v8)
      v9 = *((_QWORD *)a4 + 2);
    else
      v9 = v7;
    if (v9)
    {
      v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<String>);
      v11 = (char *)swift_allocObject(v10, 16 * v9 + 32, 7);
      v12 = _swift_stdlib_malloc_size(v11);
      v13 = v12 - 32;
      if (v12 < 32)
        v13 = v12 - 17;
      *((_QWORD *)v11 + 2) = v8;
      *((_QWORD *)v11 + 3) = 2 * (v13 >> 4);
      v14 = v11 + 32;
      if ((v5 & 1) != 0)
        goto LABEL_15;
    }
    else
    {
      v11 = (char *)&_swiftEmptyArrayStorage;
      v14 = (char *)&_swiftEmptyArrayStorage + 32;
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v11 != a4 || v14 >= &a4[16 * v8 + 32])
          memmove(v14, a4 + 32, 16 * v8);
        *((_QWORD *)a4 + 2) = 0;
        goto LABEL_24;
      }
    }
    specialized _ArrayBuffer._copyContents(subRange:initializing:)(0, v8, (unint64_t)v14, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease(a4);
    return v11;
  }
  __break(1u);
  return result;
}

{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  int64_t v12;
  uint64_t v13;
  char *v14;

  v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    v7 = a2;
    goto LABEL_8;
  }
  v6 = *((_QWORD *)a4 + 3);
  v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2)
    goto LABEL_8;
  if (v7 + 0x4000000000000000 >= 0)
  {
    v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v7 = a2;
LABEL_8:
    v8 = *((_QWORD *)a4 + 2);
    if (v7 <= v8)
      v9 = *((_QWORD *)a4 + 2);
    else
      v9 = v7;
    if (v9)
    {
      v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<_NSRange>);
      v11 = (char *)swift_allocObject(v10, 16 * v9 + 32, 7);
      v12 = _swift_stdlib_malloc_size(v11);
      v13 = v12 - 32;
      if (v12 < 32)
        v13 = v12 - 17;
      *((_QWORD *)v11 + 2) = v8;
      *((_QWORD *)v11 + 3) = 2 * (v13 >> 4);
      v14 = v11 + 32;
      if ((v5 & 1) != 0)
        goto LABEL_15;
    }
    else
    {
      v11 = (char *)&_swiftEmptyArrayStorage;
      v14 = (char *)&_swiftEmptyArrayStorage + 32;
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v11 != a4 || v14 >= &a4[16 * v8 + 32])
          memmove(v14, a4 + 32, 16 * v8);
        *((_QWORD *)a4 + 2) = 0;
        goto LABEL_24;
      }
    }
    specialized _ArrayBuffer._copyContents(subRange:initializing:)(0, v8, v14, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease(a4);
    return v11;
  }
  __break(1u);
  return result;
}

uint64_t implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:)(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t closure #1 in OSLogArguments.append(_:)(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;
  uint64_t v12;
  uint64_t v13;

  v6 = a4();
  v8 = v7;
  v9 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v6, v7, a3);
  v10 = *a1 + 8;
  v12 = v9;
  UnsafeMutableRawBufferPointer.copyMemory(from:)(&v12, &v13);
  result = swift_bridgeObjectRelease(v8);
  *a1 = v10;
  return result;
}

uint64_t getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  void *ObjectType;

  v6 = specialized _StringGuts._deconstructUTF8<A>(scratch:)(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = (void *)swift_getObjectType(v6);
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      outlined init with copy of Any((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = &type metadata for _StringGuts;
    v12[0] = a1;
    v12[1] = a2;
    v10 = *a3;
    if (*a3)
    {
      outlined init with copy of Any((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain(a2);
  }
  __swift_destroy_boxed_opaque_existential_0(v12);
  return v7;
}

uint64_t specialized _StringGuts._deconstructUTF8<A>(scratch:)(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  uint64_t v8;
  uint64_t result;
  uint64_t v12;
  uint64_t v13;
  int v14;
  _QWORD __src[2];

  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        v12 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v12)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (_QWORD *)&__dst[v12] || (char *)__src + v12 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            UnsafeMutableRawBufferPointer.subscript.setter(0, HIBYTE(a6) & 0xF, __dst, a3);
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = _StringGuts._allocateForDeconstruct()(a5, a6);
    *a1 = v13;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0)
    goto LABEL_13;
  if ((a5 & 0x1000000000000000) != 0)
  {
    v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  v8 = _StringObject.sharedUTF8.getter(a5, a6);
  if (!v8)
  {
    _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Unexpectedly found nil while unwrapping an Optional value", 57, 2, "Swift/StringTesting.swift", 25, 2, 151, 0);
    __break(1u);
LABEL_17:
    LOBYTE(v14) = 2;
    result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutableRawPointer.initializeMemory overlapping range", 58, 2, "Swift/UnsafeRawPointer.swift", 28, v14, 1173, 0);
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0)
    return 0;
  else
    return swift_unknownObjectRetain(a6 & 0xFFFFFFFFFFFFFFFLL, __dst);
}

uint64_t _StringGuts._allocateForDeconstruct()(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = (uint64_t)specialized _copyCollectionToContiguousArray<A>(_:)(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native(v2) & 1) == 0)
    v2 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

_QWORD *specialized _copyCollectionToContiguousArray<A>(_:)(uint64_t a1, unint64_t a2)
{
  uint64_t v4;
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v7;
  char v8;
  _QWORD *result;
  int v10;

  if ((a2 & 0x1000000000000000) != 0)
    goto LABEL_10;
  if ((a2 & 0x2000000000000000) != 0)
    v4 = HIBYTE(a2) & 0xF;
  else
    v4 = a1 & 0xFFFFFFFFFFFFLL;
  if (v4)
  {
    while (1)
    {
      v5 = specialized _ContiguousArrayBuffer.init(_uninitializedCount:minimumCapacity:)(v4, 0);
      if (v4 < 0)
        break;
      v6 = v5;
      v7 = _StringGuts.copyUTF8(into:)(v5 + 4, v4, a1, a2);
      if ((v8 & 1) != 0)
        goto LABEL_14;
      if (v7 == v4)
        return v6;
      LOBYTE(v10) = 2;
      _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "invalid Collection: less than 'count' elements in collection", 60, 2, "Swift/ContiguousArrayBuffer.swift", 33, v10, 1122, 0);
      __break(1u);
LABEL_10:
      v4 = String.UTF8View._foreignCount()();
      if (!v4)
        return &_swiftEmptyArrayStorage;
    }
    LOBYTE(v10) = 2;
    _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutableBufferPointer with negative count", 46, 2, "Swift/UnsafeBufferPointer.swift", 31, v10, 71, 0);
    __break(1u);
LABEL_14:
    LOBYTE(v10) = 2;
    result = (_QWORD *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Insufficient space allocated to copy string contents", 52, 2, "Swift/StringUTF8View.swift", 26, v10, 430, 0);
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

_QWORD *specialized _ContiguousArrayBuffer.init(_uninitializedCount:minimumCapacity:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  _QWORD *v5;
  size_t v6;

  if (a2 <= a1)
    v2 = a1;
  else
    v2 = a2;
  if (!v2)
    return &_swiftEmptyArrayStorage;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<UInt8>);
  v5 = (_QWORD *)swift_allocObject(v4, v2 + 32, 7);
  v6 = _swift_stdlib_malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

uint64_t specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  uint64_t v10;
  char *v11;
  size_t v12;
  char *v13;
  char *v14;
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
    v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<UInt8>);
    v11 = (char *)swift_allocObject(v10, v9 + 32, 7);
    v12 = _swift_stdlib_malloc_size(v11);
    *((_QWORD *)v11 + 2) = v8;
    *((_QWORD *)v11 + 3) = 2 * v12 - 64;
  }
  else
  {
    v11 = (char *)&_swiftEmptyArrayStorage;
  }
  v13 = v11 + 32;
  v14 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v11 != a4 || v13 >= &v14[v8])
      memmove(v13, v14, v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v14 >= &v13[v8] || v13 >= &v14[v8])
  {
    memcpy(v13, v14, v8);
LABEL_28:
    swift_bridgeObjectRelease(a4);
    return (uint64_t)v11;
  }
LABEL_30:
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
  __break(1u);
  return result;
}

_BYTE **closure #1 in OSLogArguments.append(_:)(_BYTE **result, uint64_t a2, uint64_t a3, char a4)
{
  _BYTE *v4;

  v4 = *result;
  *v4 = a4;
  *result = v4 + 1;
  return result;
}

uint64_t specialized Collection.prefix(_:)(uint64_t result, uint64_t a2, unint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;

  if (result < 0)
  {
    __break(1u);
  }
  else
  {
    v5 = HIBYTE(a3) & 0xF;
    if ((a3 & 0x2000000000000000) == 0)
      v5 = a2;
    v6 = 7;
    if (((a3 >> 60) & ((a2 & 0x800000000000000) == 0)) != 0)
      v6 = 11;
    v7 = v6 | (v5 << 16);
    v8 = String.index(_:offsetBy:limitedBy:)(15, result, v7, a2, a3);
    if ((v9 & 1) != 0)
      v10 = v7;
    else
      v10 = v8;
    return String.subscript.getter(15, v10, a2, a3);
  }
  return result;
}

unint64_t specialized Collection.dropFirst(_:)(unint64_t result, uint64_t a2, unint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  char v8;

  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else
  {
    if ((a3 & 0x2000000000000000) != 0)
      v5 = HIBYTE(a3) & 0xF;
    else
      v5 = a2 & 0xFFFFFFFFFFFFLL;
    v6 = 7;
    if (((a3 >> 60) & ((a2 & 0x800000000000000) == 0)) != 0)
      v6 = 11;
    v7 = v6 | (v5 << 16);
    result = String.index(_:offsetBy:limitedBy:)(15, result, v7, a2, a3);
    if ((v8 & 1) != 0)
      result = v7;
    if (4 * v5 >= result >> 14)
      return String.subscript.getter(result, v7, a2, a3);
  }
  __break(1u);
  return result;
}

uint64_t type metadata accessor for RegionUtils()
{
  return objc_opt_self(_TtC15extensionFilter11RegionUtils);
}

uint64_t specialized _ArrayBuffer._copyContents(subRange:initializing:)(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
  else
  {
    if (v4 < 0)
    {
      result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize with negative count", 51, 2, "Swift/UnsafePointer.swift", 25, 2, 1090, 0);
      goto LABEL_9;
    }
    v5 = a4 + 16 * a1 + 32;
    v6 = a3 + 16 * v4;
    if (v5 >= v6 || v5 + 16 * v4 <= a3)
    {
      swift_arrayInitWithCopy(a3);
      return v6;
    }
  }
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
LABEL_9:
  __break(1u);
  return result;
}

char *specialized _ArrayBuffer._copyContents(subRange:initializing:)(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
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
  else
  {
    if (v4 < 0)
    {
      result = (char *)_fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize with negative count", 51, 2, "Swift/UnsafePointer.swift", 25, 2, 1090, 0);
      goto LABEL_9;
    }
    v5 = (char *)(a4 + 16 * a1 + 32);
    v6 = 16 * v4;
    v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }
  result = (char *)_fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
LABEL_9:
  __break(1u);
  return result;
}

uint64_t __swift_destroy_boxed_opaque_existential_0(_QWORD *a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1[3] - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release(*a1);
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t outlined init with copy of Any(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void *SmsFilter._basicModel.getter()
{
  uint64_t v0;
  void *v1;
  id v2;
  _BYTE v4[24];

  swift_beginAccess(v0 + 16, v4, 0, 0);
  v1 = *(void **)(v0 + 16);
  v2 = v1;
  return v1;
}

void SmsFilter._basicModel.setter(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  _BYTE v4[24];

  swift_beginAccess(v1 + 16, v4, 1, 0);
  v3 = *(void **)(v1 + 16);
  *(_QWORD *)(v1 + 16) = a1;

}

uint64_t (*SmsFilter._basicModel.modify(uint64_t a1))()
{
  uint64_t v1;

  swift_beginAccess(v1 + 16, a1, 33, 0);
  return SmsFilter._basicModel.modify;
}

void *SmsFilter._mainModel.getter()
{
  uint64_t v0;
  void *v1;
  id v2;
  _BYTE v4[24];

  swift_beginAccess(v0 + 24, v4, 0, 0);
  v1 = *(void **)(v0 + 24);
  v2 = v1;
  return v1;
}

void SmsFilter._mainModel.setter(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  _BYTE v4[24];

  swift_beginAccess(v1 + 24, v4, 1, 0);
  v3 = *(void **)(v1 + 24);
  *(_QWORD *)(v1 + 24) = a1;

}

uint64_t (*SmsFilter._mainModel.modify(uint64_t a1))()
{
  uint64_t v1;

  swift_beginAccess(v1 + 24, a1, 33, 0);
  return SmsFilter._basicModel.modify;
}

void *SmsFilter._subClassificationModel.getter()
{
  uint64_t v0;
  void *v1;
  id v2;
  _BYTE v4[24];

  swift_beginAccess(v0 + 32, v4, 0, 0);
  v1 = *(void **)(v0 + 32);
  v2 = v1;
  return v1;
}

void SmsFilter._subClassificationModel.setter(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  _BYTE v4[24];

  swift_beginAccess(v1 + 32, v4, 1, 0);
  v3 = *(void **)(v1 + 32);
  *(_QWORD *)(v1 + 32) = a1;

}

uint64_t (*SmsFilter._subClassificationModel.modify(uint64_t a1))()
{
  uint64_t v1;

  swift_beginAccess(v1 + 32, a1, 33, 0);
  return SmsFilter._basicModel.modify;
}

uint64_t SmsFilter._initDone.getter()
{
  uint64_t v0;
  _BYTE v2[24];

  swift_beginAccess(v0 + 40, v2, 0, 0);
  return *(unsigned __int8 *)(v0 + 40);
}

uint64_t SmsFilter._initDone.setter(char a1)
{
  uint64_t v1;
  uint64_t result;
  _BYTE v4[24];

  result = swift_beginAccess(v1 + 40, v4, 1, 0);
  *(_BYTE *)(v1 + 40) = a1;
  return result;
}

uint64_t (*SmsFilter._initDone.modify(uint64_t a1))()
{
  uint64_t v1;

  swift_beginAccess(v1 + 40, a1, 33, 0);
  return SmsFilter._basicModel.modify;
}

uint64_t SmsFilter._checkForMainModel.getter()
{
  uint64_t v0;
  _BYTE v2[24];

  swift_beginAccess(v0 + 41, v2, 0, 0);
  return *(unsigned __int8 *)(v0 + 41);
}

uint64_t SmsFilter._checkForMainModel.setter(char a1)
{
  uint64_t v1;
  uint64_t result;
  _BYTE v4[24];

  result = swift_beginAccess(v1 + 41, v4, 1, 0);
  *(_BYTE *)(v1 + 41) = a1;
  return result;
}

uint64_t (*SmsFilter._checkForMainModel.modify(uint64_t a1))()
{
  uint64_t v1;

  swift_beginAccess(v1 + 41, a1, 33, 0);
  return SmsFilter._basicModel.modify;
}

uint64_t SmsFilter._regexPromotionalFilter.getter()
{
  uint64_t v0;
  _BYTE v2[24];

  swift_beginAccess(v0 + 48, v2, 0, 0);
  return swift_retain(*(_QWORD *)(v0 + 48));
}

uint64_t SmsFilter._regexPromotionalFilter.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  _BYTE v5[24];

  swift_beginAccess(v1 + 48, v5, 1, 0);
  v3 = *(_QWORD *)(v1 + 48);
  *(_QWORD *)(v1 + 48) = a1;
  return swift_release(v3);
}

uint64_t (*SmsFilter._regexPromotionalFilter.modify(uint64_t a1))()
{
  uint64_t v1;

  swift_beginAccess(v1 + 48, a1, 33, 0);
  return RegionUtils._region.modify;
}

uint64_t SmsFilter._regexTransactionalFilter.getter()
{
  uint64_t v0;
  _BYTE v2[24];

  swift_beginAccess(v0 + 56, v2, 0, 0);
  return swift_retain(*(_QWORD *)(v0 + 56));
}

uint64_t SmsFilter._regexTransactionalFilter.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  _BYTE v5[24];

  swift_beginAccess(v1 + 56, v5, 1, 0);
  v3 = *(_QWORD *)(v1 + 56);
  *(_QWORD *)(v1 + 56) = a1;
  return swift_release(v3);
}

uint64_t (*SmsFilter._regexTransactionalFilter.modify(uint64_t a1))()
{
  uint64_t v1;

  swift_beginAccess(v1 + 56, a1, 33, 0);
  return SmsFilter._basicModel.modify;
}

uint64_t SmsFilter._regexSubclassificationFilter.getter()
{
  _QWORD *v0;
  uint64_t v1;
  _BYTE v3[24];

  swift_beginAccess(v0 + 8, v3, 0, 0);
  v1 = v0[8];
  outlined copy of SmsFilter._regexSubclassification?(v1, v0[9], v0[10]);
  return v1;
}

uint64_t outlined copy of SmsFilter._regexSubclassification?(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v4;

  if (result != 1)
  {
    v4 = result;
    swift_retain(a3);
    swift_retain(v4);
    return swift_retain(a2);
  }
  return result;
}

uint64_t SmsFilter._regexSubclassificationFilter.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE v11[24];

  swift_beginAccess(v3 + 8, v11, 1, 0);
  v7 = v3[8];
  v8 = v3[9];
  v9 = v3[10];
  v3[8] = a1;
  v3[9] = a2;
  v3[10] = a3;
  return outlined consume of SmsFilter._regexSubclassification?(v7, v8, v9);
}

uint64_t outlined consume of SmsFilter._regexSubclassification?(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (result != 1)
  {
    swift_release(result);
    swift_release(a2);
    return swift_release(a3);
  }
  return result;
}

uint64_t (*SmsFilter._regexSubclassificationFilter.modify(uint64_t a1))()
{
  uint64_t v1;

  swift_beginAccess(v1 + 64, a1, 33, 0);
  return SmsFilter._basicModel.modify;
}

uint64_t SmsFilter._dateCheckpoint.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  _BYTE v5[24];

  v3 = v1 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__dateCheckpoint;
  swift_beginAccess(v3, v5, 0, 0);
  return outlined init with copy of Date?(v3, a1);
}

uint64_t outlined init with copy of Date?(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t SmsFilter._dateCheckpoint.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  _BYTE v5[24];

  v3 = v1 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__dateCheckpoint;
  swift_beginAccess(v3, v5, 33, 0);
  outlined assign with take of Date?(a1, v3);
  return swift_endAccess(v5);
}

uint64_t outlined assign with take of Date?(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t (*SmsFilter._dateCheckpoint.modify(uint64_t a1))()
{
  uint64_t v1;

  swift_beginAccess(v1 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__dateCheckpoint, a1, 33, 0);
  return SmsFilter._basicModel.modify;
}

void *SmsFilter._trialManager.getter()
{
  uint64_t v0;
  void **v1;
  void *v2;
  id v3;
  _BYTE v5[24];

  v1 = (void **)(v0 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__trialManager);
  swift_beginAccess(v0 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__trialManager, v5, 0, 0);
  v2 = *v1;
  v3 = v2;
  return v2;
}

void SmsFilter._trialManager.setter(void *a1)
{
  uint64_t v1;
  void **v3;
  void *v4;
  _BYTE v5[24];

  v3 = (void **)(v1 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__trialManager);
  swift_beginAccess(v3, v5, 1, 0);
  v4 = *v3;
  *v3 = a1;

}

uint64_t (*SmsFilter._trialManager.modify(uint64_t a1))()
{
  uint64_t v1;

  swift_beginAccess(v1 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__trialManager, a1, 33, 0);
  return SmsFilter._basicModel.modify;
}

uint64_t SmsFilter._regionUtils.getter()
{
  uint64_t v0;
  _QWORD *v1;
  _BYTE v3[24];

  v1 = (_QWORD *)(v0 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__regionUtils);
  swift_beginAccess(v0 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__regionUtils, v3, 0, 0);
  return swift_retain(*v1);
}

uint64_t SmsFilter._regionUtils.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v3;
  uint64_t v4;
  _BYTE v6[24];

  v3 = (uint64_t *)(v1 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__regionUtils);
  swift_beginAccess(v3, v6, 1, 0);
  v4 = *v3;
  *v3 = a1;
  return swift_release(v4);
}

uint64_t (*SmsFilter._regionUtils.modify(uint64_t a1))()
{
  uint64_t v1;

  swift_beginAccess(v1 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__regionUtils, a1, 33, 0);
  return SmsFilter._basicModel.modify;
}

uint64_t SmsFilter._region.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  _BYTE v5[24];
  _QWORD v6[16];

  v3 = v1 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__region;
  swift_beginAccess(v3, v5, 0, 0);
  outlined init with take of Region?(v3, (uint64_t)v6, &demangling cache variable for type metadata for Region?);
  outlined retain of Region?(v6, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))outlined copy of Region?);
  return outlined init with take of Region?((uint64_t)v6, a1, &demangling cache variable for type metadata for Region?);
}

_QWORD *SmsFilter._region.setter(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  _BYTE v5[24];
  _QWORD v6[16];

  v3 = v1 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__region;
  swift_beginAccess(v3, v5, 1, 0);
  outlined init with take of Region?(v3, (uint64_t)v6, &demangling cache variable for type metadata for Region?);
  outlined init with take of Region?((uint64_t)a1, v3, &demangling cache variable for type metadata for Region?);
  outlined retain of Region?(a1, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))outlined copy of Region?);
  outlined retain of Region?(v6, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))outlined consume of Region?);
  return outlined retain of Region?(a1, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))outlined consume of Region?);
}

uint64_t (*SmsFilter._region.modify(uint64_t a1))()
{
  uint64_t v1;

  swift_beginAccess(v1 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__region, a1, 33, 0);
  return SmsFilter._basicModel.modify;
}

double SmsFilter._promotionalThreshold.getter()
{
  uint64_t v0;
  uint64_t v1;
  _BYTE v3[24];

  v1 = v0 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__promotionalThreshold;
  swift_beginAccess(v0 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__promotionalThreshold, v3, 0, 0);
  return *(double *)v1;
}

uint64_t SmsFilter._promotionalThreshold.setter(double a1)
{
  uint64_t v1;
  double *v3;
  uint64_t result;
  _BYTE v5[24];

  v3 = (double *)(v1 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__promotionalThreshold);
  result = swift_beginAccess(v1 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__promotionalThreshold, v5, 1, 0);
  *v3 = a1;
  return result;
}

uint64_t (*SmsFilter._promotionalThreshold.modify(uint64_t a1))()
{
  uint64_t v1;

  swift_beginAccess(v1 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__promotionalThreshold, a1, 33, 0);
  return SmsFilter._basicModel.modify;
}

double SmsFilter._transactionalThreshold.getter()
{
  uint64_t v0;
  uint64_t v1;
  _BYTE v3[24];

  v1 = v0 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__transactionalThreshold;
  swift_beginAccess(v0 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__transactionalThreshold, v3, 0, 0);
  return *(double *)v1;
}

uint64_t SmsFilter._transactionalThreshold.setter(double a1)
{
  uint64_t v1;
  double *v3;
  uint64_t result;
  _BYTE v5[24];

  v3 = (double *)(v1 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__transactionalThreshold);
  result = swift_beginAccess(v1 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__transactionalThreshold, v5, 1, 0);
  *v3 = a1;
  return result;
}

uint64_t (*SmsFilter._transactionalThreshold.modify(uint64_t a1))()
{
  uint64_t v1;

  swift_beginAccess(v1 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__transactionalThreshold, a1, 33, 0);
  return SmsFilter._basicModel.modify;
}

uint64_t SmsFilter._retryTransitionTimerForMainModel.getter()
{
  uint64_t v0;
  uint64_t v1;
  _BYTE v3[24];

  v1 = v0 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__retryTransitionTimerForMainModel;
  swift_beginAccess(v0 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__retryTransitionTimerForMainModel, v3, 0, 0);
  return *(_QWORD *)v1;
}

uint64_t SmsFilter._retryTransitionTimerForMainModel.setter(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t result;
  _BYTE v5[24];

  v3 = (_QWORD *)(v1 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__retryTransitionTimerForMainModel);
  result = swift_beginAccess(v3, v5, 1, 0);
  *v3 = a1;
  return result;
}

uint64_t (*SmsFilter._retryTransitionTimerForMainModel.modify(uint64_t a1))()
{
  uint64_t v1;

  swift_beginAccess(v1 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__retryTransitionTimerForMainModel, a1, 33, 0);
  return SmsFilter._basicModel.modify;
}

uint64_t SmsFilter._regexSubclassification._regexFilterFinance.setter(uint64_t a1)
{
  _QWORD *v1;
  uint64_t result;

  result = swift_release(*v1);
  *v1 = a1;
  return result;
}

extensionFilter::Regex::subCategories (__swiftcall *Region.TrialParams.trialSupported.modify())(Swift::OpaquePointer finance, Swift::OpaquePointer reminders, Swift::OpaquePointer orders)
{
  return Regex.subCategories.init(finance:reminders:orders:);
}

uint64_t SmsFilter._regexSubclassification._regexFilterReminders.getter(uint64_t a1, uint64_t a2)
{
  return swift_retain(a2);
}

uint64_t SmsFilter._regexSubclassification._regexFilterReminders.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  result = swift_release(*(_QWORD *)(v1 + 8));
  *(_QWORD *)(v1 + 8) = a1;
  return result;
}

extensionFilter::Regex::subCategories (__swiftcall *Region.TrialParams.namespaceId.modify())(Swift::OpaquePointer finance, Swift::OpaquePointer reminders, Swift::OpaquePointer orders)
{
  return Regex.subCategories.init(finance:reminders:orders:);
}

uint64_t SmsFilter._regexSubclassification._regexFilterOrders.getter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_retain(a3);
}

uint64_t SmsFilter._regexSubclassification._regexFilterOrders.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  result = swift_release(*(_QWORD *)(v1 + 16));
  *(_QWORD *)(v1 + 16) = a1;
  return result;
}

extensionFilter::Regex::subCategories (__swiftcall *Region.smsFilterSupported.modify())(Swift::OpaquePointer finance, Swift::OpaquePointer reminders, Swift::OpaquePointer orders)
{
  return Regex.subCategories.init(finance:reminders:orders:);
}

uint64_t SmsFilter._regexSubclassification.init()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = type metadata accessor for RegexFilter();
  swift_allocObject(v0, 32, 7);
  v1 = RegexFilter.init()();
  swift_allocObject(v0, 32, 7);
  swift_retain(v1);
  v2 = RegexFilter.init()();
  swift_allocObject(v0, 32, 7);
  swift_retain(v2);
  RegexFilter.init()();
  swift_release(v2);
  swift_release(v1);
  return v1;
}

void one-time initialization function for kFinance()
{
  static SmsFilter.SubClasses.kFinance = 0x65636E616E6946;
  qword_100026CA8 = 0xE700000000000000;
}

uint64_t *SmsFilter.SubClasses.kFinance.unsafeMutableAddressor()
{
  if (one-time initialization token for kFinance != -1)
    swift_once(&one-time initialization token for kFinance, one-time initialization function for kFinance);
  return &static SmsFilter.SubClasses.kFinance;
}

uint64_t static SmsFilter.SubClasses.kFinance.getter()
{
  return static SmsFilter.SubClasses.kFinance.getter(&one-time initialization token for kFinance, &static SmsFilter.SubClasses.kFinance, &qword_100026CA8);
}

void one-time initialization function for kOrders()
{
  static SmsFilter.SubClasses.kOrders = 0x73726564724FLL;
  qword_100026CB8 = 0xE600000000000000;
}

uint64_t *SmsFilter.SubClasses.kOrders.unsafeMutableAddressor()
{
  if (one-time initialization token for kOrders != -1)
    swift_once(&one-time initialization token for kOrders, one-time initialization function for kOrders);
  return &static SmsFilter.SubClasses.kOrders;
}

uint64_t static SmsFilter.SubClasses.kOrders.getter()
{
  return static SmsFilter.SubClasses.kFinance.getter(&one-time initialization token for kOrders, &static SmsFilter.SubClasses.kOrders, &qword_100026CB8);
}

void one-time initialization function for kReminders()
{
  static SmsFilter.SubClasses.kReminders = 0x7265646E696D6552;
  qword_100026CC8 = 0xE900000000000073;
}

uint64_t *SmsFilter.SubClasses.kReminders.unsafeMutableAddressor()
{
  if (one-time initialization token for kReminders != -1)
    swift_once(&one-time initialization token for kReminders, one-time initialization function for kReminders);
  return &static SmsFilter.SubClasses.kReminders;
}

uint64_t static SmsFilter.SubClasses.kReminders.getter()
{
  return static SmsFilter.SubClasses.kFinance.getter(&one-time initialization token for kReminders, &static SmsFilter.SubClasses.kReminders, &qword_100026CC8);
}

uint64_t static SmsFilter.SubClasses.kFinance.getter(_QWORD *a1, uint64_t *a2, _QWORD *a3)
{
  uint64_t v5;

  if (*a1 != -1)
    swift_once();
  v5 = *a2;
  swift_bridgeObjectRetain(*a3);
  return v5;
}

uint64_t SmsFilter.__allocating_init(for:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;

  v5 = swift_allocObject(v2, *(unsigned int *)(v2 + 48), *(unsigned __int16 *)(v2 + 52));
  SmsFilter.init(for:)(a1, a2);
  return v5;
}

uint64_t SmsFilter.init(for:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  void **v8;
  uint64_t *v9;
  uint64_t v10;
  void *v11;
  void (*v12)(_QWORD *__return_ptr, _QWORD, _QWORD);
  id v13;
  void *v14;
  Swift::OpaquePointer v15;
  Swift::OpaquePointer v16;
  uint64_t result;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  NSObject *v34;
  os_log_type_t v35;
  uint8_t *v36;
  char v37[24];
  char v38[24];
  char v39[24];
  char v40[24];
  char v41[24];
  _QWORD v42[16];
  _QWORD v43[16];
  char v44[24];
  _OWORD v45[8];
  _QWORD v46[16];
  _BYTE v47[128];
  _BYTE v48[128];
  char v49[24];
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _QWORD v58[16];
  _OWORD v59[8];
  _OWORD v60[8];

  v3 = v2;
  *(_QWORD *)(v3 + 48) = 0;
  *(_QWORD *)(v3 + 56) = 0;
  *(_QWORD *)(v3 + 64) = 1;
  *(_QWORD *)(v3 + 16) = 0;
  *(_QWORD *)(v3 + 24) = 0;
  *(_WORD *)(v3 + 40) = 0;
  *(_QWORD *)(v3 + 32) = 0;
  *(_QWORD *)(v3 + 72) = 0;
  *(_QWORD *)(v3 + 80) = 0;
  v6 = v3 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__dateCheckpoint;
  v7 = type metadata accessor for Date(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v6, 1, 1, v7);
  v8 = (void **)(v3 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__trialManager);
  *(_QWORD *)(v3 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__trialManager) = 0;
  v9 = (uint64_t *)(v3 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__regionUtils);
  *(_QWORD *)(v3 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__regionUtils) = 0;
  v10 = v3 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__region;
  _s15extensionFilter6RegionVSgWOi0_(v60);
  outlined init with take of Region?((uint64_t)v60, v10, &demangling cache variable for type metadata for Region?);
  *(_QWORD *)(v3 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__promotionalThreshold) = 0x3FE0000000000000;
  *(_QWORD *)(v3 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__transactionalThreshold) = 0x3FE0000000000000;
  *(_QWORD *)(v3 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__retryTransitionTimerForMainModel) = 1440;
  if (one-time initialization token for sharedRegionProperties != -1)
    swift_once(&one-time initialization token for sharedRegionProperties, one-time initialization function for sharedRegionProperties);
  v11 = static RegionPropertiesReader.sharedRegionProperties;
  v12 = *(void (**)(_QWORD *__return_ptr, _QWORD, _QWORD))(*(_QWORD *)static RegionPropertiesReader.sharedRegionProperties
                                                                    + 136);
  swift_retain(static RegionPropertiesReader.sharedRegionProperties);
  v12(v58, a1, a2);
  swift_release(v11);
  swift_bridgeObjectRelease(a2);
  outlined init with take of Region?((uint64_t)v58, (uint64_t)v59, &demangling cache variable for type metadata for Region?);
  if (_s15extensionFilter6RegionVSgWOg((uint64_t)v59) == 1)
    return v3;
  v55 = v59[5];
  v56 = v59[6];
  v57 = v59[7];
  v50 = v59[0];
  v51 = v59[1];
  v52 = v59[2];
  v53 = v59[3];
  v54 = v59[4];
  v13 = objc_msgSend(objc_allocWithZone((Class)SmsFilterTrialModelManager), "init");
  swift_beginAccess(v8, v49, 1, 0);
  v14 = *v8;
  *v8 = v13;

  if (!*v8)
  {
    outlined retain of Region?(v58, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))outlined consume of Region?);
    if (one-time initialization token for logger != -1)
      swift_once(&one-time initialization token for logger, one-time initialization function for logger);
    v32 = type metadata accessor for Logger(0);
    v33 = __swift_project_value_buffer(v32, (uint64_t)logger);
    v34 = Logger.logObject.getter(v33);
    v35 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v34, v35))
    {
      v36 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v36 = 0;
      _os_log_impl((void *)&_mh_execute_header, v34, v35, "smsfilter: _trialManager failed to init", v36, 2u);
      swift_slowDealloc(v36, -1, -1);
    }

    return v3;
  }
  v45[4] = v54;
  v45[5] = v55;
  v45[6] = v56;
  v45[7] = v57;
  v45[0] = v50;
  v45[1] = v51;
  v45[2] = v52;
  v45[3] = v53;
  Regex.subCategories.init(finance:reminders:orders:)((Swift::OpaquePointer)v45, v15, v16);
  swift_beginAccess(v10, v44, 1, 0);
  outlined init with take of Region?(v10, (uint64_t)v46, &demangling cache variable for type metadata for Region?);
  outlined init with take of Region?((uint64_t)v45, v10, &demangling cache variable for type metadata for Region?);
  outlined retain of Region?(v46, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))outlined consume of Region?);
  outlined init with take of Region?(v10, (uint64_t)v47, &demangling cache variable for type metadata for Region?);
  outlined init with take of Region?((uint64_t)v47, (uint64_t)v48, &demangling cache variable for type metadata for Region?);
  result = _s15extensionFilter6RegionVSgWOg((uint64_t)v48);
  if ((_DWORD)result != 1)
  {
    v18 = type metadata accessor for RegionUtils();
    v19 = swift_allocObject(v18, 144, 7);
    outlined init with take of Region?((uint64_t)v60, v19 + 16, &demangling cache variable for type metadata for Region?);
    swift_beginAccess(v19 + 16, v41, 1, 0);
    outlined init with take of Region?(v19 + 16, (uint64_t)v42, &demangling cache variable for type metadata for Region?);
    outlined init with take of Region?((uint64_t)v47, v19 + 16, &demangling cache variable for type metadata for Region?);
    outlined init with take of Region?((uint64_t)v47, (uint64_t)v43, &demangling cache variable for type metadata for Region?);
    outlined retain of Region(v43);
    outlined retain of Region?(v42, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))outlined consume of Region?);
    swift_beginAccess(v9, v40, 1, 0);
    v20 = *v9;
    *v9 = v19;
    swift_release(v20);
    v21 = type metadata accessor for RegexFilter();
    swift_allocObject(v21, 32, 7);
    v22 = RegexFilter.init()();
    swift_beginAccess(v3 + 48, v39, 1, 0);
    v23 = *(_QWORD *)(v3 + 48);
    *(_QWORD *)(v3 + 48) = v22;
    swift_release(v23);
    swift_allocObject(v21, 32, 7);
    v24 = RegexFilter.init()();
    swift_beginAccess(v3 + 56, v38, 1, 0);
    v25 = *(_QWORD *)(v3 + 56);
    *(_QWORD *)(v3 + 56) = v24;
    swift_release(v25);
    swift_allocObject(v21, 32, 7);
    v26 = RegexFilter.init()();
    swift_allocObject(v21, 32, 7);
    swift_retain(v26);
    v27 = RegexFilter.init()();
    swift_allocObject(v21, 32, 7);
    swift_retain(v27);
    v28 = RegexFilter.init()();
    swift_release(v27);
    swift_release(v26);
    swift_beginAccess(v3 + 64, v37, 1, 0);
    v29 = *(_QWORD *)(v3 + 64);
    v30 = *(_QWORD *)(v3 + 72);
    v31 = *(_QWORD *)(v3 + 80);
    *(_QWORD *)(v3 + 64) = v26;
    *(_QWORD *)(v3 + 72) = v27;
    *(_QWORD *)(v3 + 80) = v28;
    outlined consume of SmsFilter._regexSubclassification?(v29, v30, v31);
    SmsFilter.initSmsFilterModel()();
    return v3;
  }
  __break(1u);
  return result;
}

uint64_t SmsFilter.initSmsFilterModel()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _BYTE *v3;
  uint64_t v4;
  void **v5;
  void *v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  _BYTE v13[128];
  _BYTE v14[128];
  uint64_t v15;
  _BYTE v16[24];
  uint64_t v17;
  _BYTE v18[128];
  _BYTE v19[136];

  v1 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  __chkstk_darwin(v1);
  v3 = &v13[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v4 = v0 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__region;
  swift_beginAccess(v0 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__region, &v17, 0, 0);
  outlined init with take of Region?(v4, (uint64_t)v18, &demangling cache variable for type metadata for Region?);
  outlined init with take of Region?((uint64_t)v18, (uint64_t)v19, &demangling cache variable for type metadata for Region?);
  if (_s15extensionFilter6RegionVSgWOg((uint64_t)v19) == 1)
  {
    __break(1u);
    goto LABEL_12;
  }
  if (*(_BYTE *)(v4 + 88) == 1)
  {
    v5 = (void **)(v0 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__trialManager);
    swift_beginAccess(v0 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__trialManager, &v15, 0, 0);
    v6 = *v5;
    if (v6)
    {
      outlined init with take of Region?(v4, (uint64_t)v13, &demangling cache variable for type metadata for Region?);
      outlined init with take of Region?((uint64_t)v13, (uint64_t)v14, &demangling cache variable for type metadata for Region?);
      if (_s15extensionFilter6RegionVSgWOg((uint64_t)v14) != 1)
      {
        v7 = *(_QWORD *)(v4 + 96);
        if ((v7 & 0x8000000000000000) == 0)
        {
          if (!HIDWORD(v7))
          {
            objc_msgSend(v6, "initializeWithNamespace:");
            SmsFilter.loadTrialMainModelWithThresholds()();
            SmsFilter.loadFallbackModel()();
            SmsFilter.loadTrialSubClassificationModel()();
            SmsFilter.loadRegexFromTrial()();
            goto LABEL_8;
          }
          result = _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Not enough bits to represent the passed value", 45, 2, "Swift/Integers.swift", 20, 2, 3455, 0);
LABEL_16:
          __break(1u);
          return result;
        }
LABEL_14:
        result = _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Negative value is not representable", 35, 2, "Swift/Integers.swift", 20, 2, 3451, 0);
        goto LABEL_16;
      }
LABEL_13:
      __break(1u);
      goto LABEL_14;
    }
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
LABEL_8:
  swift_beginAccess(v0 + 24, v14, 0, 0);
  v8 = *(_QWORD *)(v0 + 24);
  v9 = swift_beginAccess(v0 + 41, v13, 1, 0);
  *(_BYTE *)(v0 + 41) = v8 == 0;
  if (!v8)
  {
    Date.init()(v9);
    v10 = type metadata accessor for Date(0);
    (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v3, 0, 1, v10);
    v11 = v0 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__dateCheckpoint;
    swift_beginAccess(v0 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__dateCheckpoint, v16, 33, 0);
    outlined assign with take of Date?((uint64_t)v3, v11);
    swift_endAccess(v16);
  }
  result = swift_beginAccess(v0 + 40, v16, 1, 0);
  *(_BYTE *)(v0 + 40) = 1;
  return result;
}

Swift::Void __swiftcall SmsFilter.cleanup()()
{
  _QWORD *v0;
  uint64_t v1;
  id *v2;
  void **v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _BYTE v19[24];
  _BYTE v20[24];
  _BYTE v21[24];
  _BYTE v22[24];
  _BYTE v23[24];
  _BYTE v24[24];
  _BYTE v25[24];
  _BYTE v26[24];
  _BYTE v27[24];
  _OWORD v28[8];
  _QWORD v29[16];
  _BYTE v30[24];
  _BYTE v31[128];
  _BYTE v32[136];

  v1 = (uint64_t)v0 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__region;
  swift_beginAccess((char *)v0 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__region, v30, 1, 0);
  outlined init with take of Region?(v1, (uint64_t)v31, &demangling cache variable for type metadata for Region?);
  outlined init with take of Region?((uint64_t)v31, (uint64_t)v32, &demangling cache variable for type metadata for Region?);
  if (_s15extensionFilter6RegionVSgWOg((uint64_t)v32) == 1)
  {
    __break(1u);
    goto LABEL_10;
  }
  if (*(_BYTE *)(v1 + 88) != 1)
  {
LABEL_5:
    v3 = (void **)((char *)v0 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__trialManager);
    swift_beginAccess((char *)v0 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__trialManager, v27, 1, 0);
    v4 = *v3;
    *v3 = 0;

    _s15extensionFilter6RegionVSgWOi0_(v28);
    outlined init with take of Region?(v1, (uint64_t)v29, &demangling cache variable for type metadata for Region?);
    outlined init with take of Region?((uint64_t)v28, v1, &demangling cache variable for type metadata for Region?);
    outlined retain of Region?(v29, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))outlined consume of Region?);
    swift_beginAccess(v0 + 3, v26, 1, 0);
    v5 = (void *)v0[3];
    v0[3] = 0;

    swift_beginAccess(v0 + 2, v25, 1, 0);
    v6 = (void *)v0[2];
    v0[2] = 0;

    swift_beginAccess(v0 + 4, v24, 1, 0);
    v7 = (void *)v0[4];
    v0[4] = 0;

    swift_beginAccess(v0 + 6, v23, 1, 0);
    v8 = v0[6];
    v0[6] = 0;
    swift_release(v8);
    swift_beginAccess(v0 + 7, v22, 1, 0);
    v9 = v0[7];
    v0[7] = 0;
    swift_release(v9);
    v10 = (_QWORD *)((char *)v0 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__regionUtils);
    swift_beginAccess((char *)v0 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__regionUtils, v21, 1, 0);
    v11 = *v10;
    *v10 = 0;
    swift_release(v11);
    v12 = v0 + 8;
    swift_beginAccess(v0 + 8, v20, 1, 0);
    v13 = v0[8];
    if (v13 != 1)
    {
      *v12 = 0;
      swift_release(v13);
      if (*v12 != 1)
      {
        v14 = v0[10];
        v0[10] = 0;
        swift_release(v14);
        if (v0[8] != 1)
        {
          v15 = v0[9];
          v0[9] = 0;
          swift_release(v15);
          v16 = v0[8];
          v17 = v0[9];
          v18 = v0[10];
          v0[9] = 0;
          v0[10] = 0;
          v0[8] = 1;
          outlined consume of SmsFilter._regexSubclassification?(v16, v17, v18);
          return;
        }
        goto LABEL_12;
      }
LABEL_11:
      __break(1u);
LABEL_12:
      __break(1u);
      goto LABEL_13;
    }
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  v2 = (id *)((char *)v0 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__trialManager);
  swift_beginAccess((char *)v0 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__trialManager, v19, 0, 0);
  if (*v2)
  {
    objc_msgSend(*v2, "prepareForTrialParamsUpdate");
    goto LABEL_5;
  }
LABEL_13:
  __break(1u);
}

Swift::Bool __swiftcall SmsFilter.trialSupportEnabled()()
{
  uint64_t v0;
  uint64_t v1;
  int v2;
  _BYTE v4[24];
  _BYTE v5[128];
  _BYTE v6[128];

  v1 = v0 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__region;
  swift_beginAccess(v0 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__region, v4, 0, 0);
  outlined init with take of Region?(v1, (uint64_t)v5, &demangling cache variable for type metadata for Region?);
  outlined init with take of Region?((uint64_t)v5, (uint64_t)v6, &demangling cache variable for type metadata for Region?);
  v2 = _s15extensionFilter6RegionVSgWOg((uint64_t)v6);
  if (v2 == 1)
    __break(1u);
  else
    LOBYTE(v2) = *(_BYTE *)(v1 + 88);
  return v2;
}

void SmsFilter.loadTrialMainModelWithThresholds()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void **v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  os_log_type_t v28;
  uint8_t *v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  os_log_type_t v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t *v36;
  uint64_t v37;
  _BYTE v38[24];
  _BYTE v39[24];
  _BYTE v40[24];
  uint64_t v41;
  uint64_t v42;
  id v43[3];
  _BYTE v44[24];
  _BYTE v45[24];
  _BYTE v46[24];
  _BYTE v47[128];
  _BYTE v48[128];

  v1 = v0;
  v2 = v0 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__region;
  swift_beginAccess(v2, v46, 0, 0);
  outlined init with take of Region?(v2, (uint64_t)v47, &demangling cache variable for type metadata for Region?);
  outlined init with take of Region?((uint64_t)v47, (uint64_t)v48, &demangling cache variable for type metadata for Region?);
  if (_s15extensionFilter6RegionVSgWOg((uint64_t)v48) == 1)
    __break(1u);
  if (*(_BYTE *)(v2 + 88) == 1)
  {
    v3 = (void **)(v1 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__trialManager);
    swift_beginAccess(v1 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__trialManager, v45, 0, 0);
    v4 = *v3;
    if (v4)
    {
      swift_beginAccess(v1 + 16, v44, 1, 0);
      v5 = *(void **)(v1 + 16);
      *(_QWORD *)(v1 + 16) = 0;
      v6 = v4;

      v7 = objc_msgSend(v6, "getMainModel");
      if (v7)
      {
        v8 = (void *)objc_opt_self(NLModel);
        v43[0] = 0;
        v9 = v7;
        v10 = objc_msgSend(v8, "modelWithMLModel:error:", v9, v43);
        v11 = v43[0];
        if (v10)
        {

          swift_beginAccess(v1 + 24, v40, 1, 0);
          v12 = *(void **)(v1 + 24);
          *(_QWORD *)(v1 + 24) = v10;
          v13 = v10;

          if (one-time initialization token for logger != -1)
            swift_once(&one-time initialization token for logger, one-time initialization function for logger);
          v14 = type metadata accessor for Logger(0);
          __swift_project_value_buffer(v14, (uint64_t)logger);
          v15 = ((uint64_t (*)(void))Logger.logObject.getter)();
          v16 = static os_log_type_t.default.getter();
          if (os_log_type_enabled(v15, v16))
          {
            v17 = (uint8_t *)swift_slowAlloc(2, -1);
            *(_WORD *)v17 = 0;
            _os_log_impl((void *)&_mh_execute_header, v15, v16, "smsfilter: mainmodel initialized.", v17, 2u);
            swift_slowDealloc(v17, -1, -1);
          }

          objc_msgSend(v6, "loadPromotionalThreshold");
          v19 = v18;
          v20 = (_QWORD *)(v1 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__promotionalThreshold);
          swift_beginAccess(v1 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__promotionalThreshold, v39, 1, 0);
          *v20 = v19;
          objc_msgSend(v6, "loadTransactionalThreshold");
          v22 = v21;

          v23 = (_QWORD *)(v1 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__transactionalThreshold);
          swift_beginAccess(v1 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__transactionalThreshold, v38, 1, 0);
          *v23 = v22;
        }
        else
        {
          v24 = v11;
          v25 = _convertNSErrorToError(_:)(v11);

          swift_willThrow();
          if (one-time initialization token for logger != -1)
            swift_once(&one-time initialization token for logger, one-time initialization function for logger);
          v26 = type metadata accessor for Logger(0);
          __swift_project_value_buffer(v26, (uint64_t)logger);
          v27 = ((uint64_t (*)(void))Logger.logObject.getter)();
          v28 = static os_log_type_t.error.getter();
          if (os_log_type_enabled(v27, v28))
          {
            v29 = (uint8_t *)swift_slowAlloc(2, -1);
            *(_WORD *)v29 = 0;
            _os_log_impl((void *)&_mh_execute_header, v27, v28, "smsfilter error: trial _mainModel creation failed; missing linguistic-data?",
              v29,
              2u);
            swift_slowDealloc(v29, -1, -1);
          }
          swift_errorRelease(v25);

        }
      }
      if (one-time initialization token for logger != -1)
        swift_once(&one-time initialization token for logger, one-time initialization function for logger);
      v30 = type metadata accessor for Logger(0);
      __swift_project_value_buffer(v30, (uint64_t)logger);
      v31 = swift_retain_n(v1, 4);
      v32 = Logger.logObject.getter(v31);
      v33 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v32, v33))
      {
        v34 = swift_slowAlloc(22, -1);
        *(_DWORD *)v34 = 134218240;
        v35 = (uint64_t *)(v1 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__promotionalThreshold);
        swift_beginAccess(v1 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__promotionalThreshold, v43, 0, 0);
        v41 = *v35;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v41, &v42);
        swift_release_n(v1, 2);
        *(_WORD *)(v34 + 12) = 2048;
        v36 = (uint64_t *)(v1 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__transactionalThreshold);
        swift_beginAccess(v1 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__transactionalThreshold, &v41, 0, 0);
        v37 = *v36;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v37, v38);
        swift_release_n(v1, 2);
        _os_log_impl((void *)&_mh_execute_header, v32, v33, "smsfilter thresholds: promo: %f, trans : %f", (uint8_t *)v34, 0x16u);
        swift_slowDealloc(v34, -1, -1);

      }
      else
      {

        swift_release_n(v1, 4);
        v6 = v7;
      }

    }
  }
}

void SmsFilter.loadFallbackModel()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  id *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  os_log_type_t v18;
  uint8_t *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  os_log_type_t v25;
  uint8_t *v26;
  uint64_t v27;
  uint64_t v28;
  _BYTE v29[24];
  id v30[3];
  _BYTE v31[24];
  _BYTE v32[128];
  _BYTE v33[128];
  _BYTE v34[24];
  _BYTE v35[128];
  _BYTE v36[128];
  _BYTE v37[24];

  v1 = v0;
  swift_beginAccess(v0 + 24, v37, 0, 0);
  if (*(_QWORD *)(v0 + 24))
    return;
  v2 = v0 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__region;
  swift_beginAccess(v0 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__region, v34, 0, 0);
  outlined init with take of Region?(v2, (uint64_t)v35, &demangling cache variable for type metadata for Region?);
  outlined init with take of Region?((uint64_t)v35, (uint64_t)v36, &demangling cache variable for type metadata for Region?);
  if (_s15extensionFilter6RegionVSgWOg((uint64_t)v36) == 1)
  {
    __break(1u);
    goto LABEL_24;
  }
  if ((*(_BYTE *)(v2 + 88) & 1) == 0)
    return;
  outlined init with take of Region?(v2, (uint64_t)v32, &demangling cache variable for type metadata for Region?);
  outlined init with take of Region?((uint64_t)v32, (uint64_t)v33, &demangling cache variable for type metadata for Region?);
  if (_s15extensionFilter6RegionVSgWOg((uint64_t)v33) == 1)
  {
LABEL_24:
    __break(1u);
    return;
  }
  if ((*(_BYTE *)(v2 + 17) & 1) != 0)
  {
    v3 = (id *)(v0 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__trialManager);
    swift_beginAccess(v0 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__trialManager, v31, 0, 0);
    if (*v3)
    {
      v4 = *v3;
      v5 = objc_msgSend(v4, "getBasicModel");
      if (!v5)
      {
LABEL_13:

        return;
      }
      v6 = v5;
      v7 = (void *)objc_opt_self(NLModel);
      v30[0] = 0;
      v8 = v6;
      v9 = objc_msgSend(v7, "modelWithMLModel:error:", v8, v30);
      v10 = v30[0];
      if (v9)
      {

        swift_beginAccess(v1 + 16, v30, 1, 0);
        v11 = *(void **)(v1 + 16);
        *(_QWORD *)(v1 + 16) = v9;
        v12 = v9;

        v13 = objc_msgSend(v4, "loadTransitionTimer");
        v14 = (uint64_t *)(v1 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__retryTransitionTimerForMainModel);
        swift_beginAccess(v1 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__retryTransitionTimerForMainModel, v29, 1, 0);
        *v14 = (uint64_t)v13;
        if (one-time initialization token for logger != -1)
          swift_once(&one-time initialization token for logger, one-time initialization function for logger);
        v15 = type metadata accessor for Logger(0);
        __swift_project_value_buffer(v15, (uint64_t)logger);
        v16 = swift_retain(v1);
        v17 = Logger.logObject.getter(v16);
        v18 = static os_log_type_t.default.getter();
        if (os_log_type_enabled(v17, v18))
        {
          v19 = (uint8_t *)swift_slowAlloc(12, -1);
          *(_DWORD *)v19 = 134217984;
          v27 = *v14;
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v27, &v28);
          swift_release(v1);
          _os_log_impl((void *)&_mh_execute_header, v17, v18, "smsfilter: fallbasck to basic model, transitionTimer : %ld minutes", v19, 0xCu);
          swift_slowDealloc(v19, -1, -1);

          goto LABEL_13;
        }

        swift_release(v1);
      }
      else
      {
        v20 = v10;
        v21 = _convertNSErrorToError(_:)(v10);

        swift_willThrow();
        if (one-time initialization token for logger != -1)
          swift_once(&one-time initialization token for logger, one-time initialization function for logger);
        v22 = type metadata accessor for Logger(0);
        v23 = __swift_project_value_buffer(v22, (uint64_t)logger);
        v24 = Logger.logObject.getter(v23);
        v25 = static os_log_type_t.error.getter();
        if (os_log_type_enabled(v24, v25))
        {
          v26 = (uint8_t *)swift_slowAlloc(2, -1);
          *(_WORD *)v26 = 0;
          _os_log_impl((void *)&_mh_execute_header, v24, v25, "smsfilter: basic-model creation failed", v26, 2u);
          swift_slowDealloc(v26, -1, -1);

          swift_errorRelease(v21);
        }
        else
        {

          swift_errorRelease(v21);
        }

      }
    }
  }
  else
  {
    SmsFilter.loadDefaultBasicModel()();
  }
}

void SmsFilter.loadTrialSubClassificationModel()()
{
  uint64_t v0;
  uint64_t v1;
  id *v2;
  id v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  os_log_type_t v22;
  uint8_t *v23;
  id v24[3];
  _BYTE v25[24];
  _BYTE v26[128];
  _BYTE v27[128];
  _BYTE v28[24];
  _BYTE v29[128];
  _BYTE v30[128];

  v1 = v0 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__region;
  swift_beginAccess(v0 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__region, v28, 0, 0);
  outlined init with take of Region?(v1, (uint64_t)v29, &demangling cache variable for type metadata for Region?);
  outlined init with take of Region?((uint64_t)v29, (uint64_t)v30, &demangling cache variable for type metadata for Region?);
  if (_s15extensionFilter6RegionVSgWOg((uint64_t)v30) == 1)
    __break(1u);
  if (*(_BYTE *)(v1 + 104) == 1)
  {
    outlined init with take of Region?(v1, (uint64_t)v26, &demangling cache variable for type metadata for Region?);
    outlined init with take of Region?((uint64_t)v26, (uint64_t)v27, &demangling cache variable for type metadata for Region?);
    if (_s15extensionFilter6RegionVSgWOg((uint64_t)v27) == 1)
    {
      __break(1u);
    }
    else if ((*(_BYTE *)(v1 + 88) & 1) != 0)
    {
      v2 = (id *)(v0 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__trialManager);
      swift_beginAccess(v0 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__trialManager, v25, 0, 0);
      if (*v2)
      {
        v3 = *v2;
        v4 = objc_msgSend(v3, "getSubClassificationModel");
        if (!v4)
        {
LABEL_12:

          return;
        }
        v5 = v4;
        v6 = (void *)objc_opt_self(NLModel);
        v24[0] = 0;
        v7 = v5;
        v8 = objc_msgSend(v6, "modelWithMLModel:error:", v7, v24);
        v9 = v24[0];
        if (v8)
        {

          swift_beginAccess(v0 + 32, v24, 1, 0);
          v10 = *(void **)(v0 + 32);
          *(_QWORD *)(v0 + 32) = v8;
          v11 = v8;

          if (one-time initialization token for logger != -1)
            swift_once(&one-time initialization token for logger, one-time initialization function for logger);
          v12 = type metadata accessor for Logger(0);
          v13 = __swift_project_value_buffer(v12, (uint64_t)logger);
          v14 = Logger.logObject.getter(v13);
          v15 = static os_log_type_t.default.getter();
          if (os_log_type_enabled(v14, v15))
          {
            v16 = (uint8_t *)swift_slowAlloc(2, -1);
            *(_WORD *)v16 = 0;
            _os_log_impl((void *)&_mh_execute_header, v14, v15, "smsfilter: sub-classification initialized.", v16, 2u);
            swift_slowDealloc(v16, -1, -1);

            goto LABEL_12;
          }

        }
        else
        {
          v17 = v9;
          v18 = _convertNSErrorToError(_:)(v9);

          swift_willThrow();
          if (one-time initialization token for logger != -1)
            swift_once(&one-time initialization token for logger, one-time initialization function for logger);
          v19 = type metadata accessor for Logger(0);
          v20 = __swift_project_value_buffer(v19, (uint64_t)logger);
          v21 = Logger.logObject.getter(v20);
          v22 = static os_log_type_t.error.getter();
          if (os_log_type_enabled(v21, v22))
          {
            v23 = (uint8_t *)swift_slowAlloc(2, -1);
            *(_WORD *)v23 = 0;
            _os_log_impl((void *)&_mh_execute_header, v21, v22, "smsfilter error: trial sub-classification model creation failed; missing linguistic-data?",
              v23,
              2u);
            swift_slowDealloc(v23, -1, -1);

            swift_errorRelease(v18);
          }
          else
          {

            swift_errorRelease(v18);
          }

        }
      }
    }
  }
}

void SmsFilter.loadRegexFromTrial()()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  id *v4;
  id v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  os_log_type_t v18;
  uint8_t *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t inited;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD *v29;
  Swift::OpaquePointer v30;
  NSObject *v31;
  os_log_type_t v32;
  uint8_t *v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  char v42;
  Swift::OpaquePointer v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  char v47;
  Swift::OpaquePointer v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t v51;
  char v52;
  Swift::OpaquePointer v53;
  uint64_t v54;
  id v55;
  _QWORD *v56;
  char v57[24];
  char v58[24];
  char v59[24];
  uint64_t v60;
  uint64_t v61;
  uint64_t v62[16];
  char v63[56];
  char v64[24];
  char v65[24];
  _BYTE v66[40];
  uint64_t v67[5];
  _BYTE v68[128];
  _BYTE v69[136];

  v3 = (uint64_t)v0 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__region;
  swift_beginAccess((char *)v0 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__region, v65, 0, 0);
  outlined init with take of Region?(v3, (uint64_t)v68, &demangling cache variable for type metadata for Region?);
  outlined init with take of Region?((uint64_t)v68, (uint64_t)v69, &demangling cache variable for type metadata for Region?);
  if (_s15extensionFilter6RegionVSgWOg((uint64_t)v69) == 1)
    goto LABEL_56;
  if ((*(_BYTE *)(v3 + 88) & 1) == 0)
  {
    if (one-time initialization token for logger != -1)
      swift_once(&one-time initialization token for logger, one-time initialization function for logger);
    v15 = type metadata accessor for Logger(0);
    v16 = __swift_project_value_buffer(v15, (uint64_t)logger);
    v17 = Logger.logObject.getter(v16);
    v18 = static os_log_type_t.error.getter();
    if (!os_log_type_enabled(v17, v18))
      goto LABEL_17;
    v19 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v19 = 0;
    v20 = "smsfilter: oops trial is not supported";
    goto LABEL_16;
  }
  v4 = (id *)((char *)v0 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__trialManager);
  swift_beginAccess((char *)v0 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__trialManager, v64, 0, 0);
  if (!*v4)
  {
    if (one-time initialization token for logger != -1)
      swift_once(&one-time initialization token for logger, one-time initialization function for logger);
    v21 = type metadata accessor for Logger(0);
    v22 = __swift_project_value_buffer(v21, (uint64_t)logger);
    v17 = Logger.logObject.getter(v22);
    v18 = static os_log_type_t.error.getter();
    if (!os_log_type_enabled(v17, v18))
      goto LABEL_17;
    v19 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v19 = 0;
    v20 = "smsfilter: trial manager is not valid";
LABEL_16:
    _os_log_impl((void *)&_mh_execute_header, v17, v18, v20, v19, 2u);
    swift_slowDealloc(v19, -1, -1);
LABEL_17:

    return;
  }
  v55 = *v4;
  v5 = objc_msgSend(v55, "getRegexFilePath");
  v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(v5);
  v8 = v7;

  if (one-time initialization token for logger != -1)
    swift_once(&one-time initialization token for logger, one-time initialization function for logger);
  v56 = v0;
  v9 = type metadata accessor for Logger(0);
  __swift_project_value_buffer(v9, (uint64_t)logger);
  v10 = swift_bridgeObjectRetain_n(v8, 2);
  v11 = Logger.logObject.getter(v10);
  v12 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v11, v12))
  {
    v13 = (uint8_t *)swift_slowAlloc(12, -1);
    v14 = swift_slowAlloc(32, -1);
    v62[0] = v14;
    *(_DWORD *)v13 = 136315138;
    swift_bridgeObjectRetain(v8);
    v60 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v6, v8, v62);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v60, &v61);
    swift_bridgeObjectRelease_n(v8, 3);
    _os_log_impl((void *)&_mh_execute_header, v11, v12, "smsfilter: loading regex from %s", v13, 0xCu);
    swift_arrayDestroy(v14, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v14, -1, -1);
    swift_slowDealloc(v13, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n(v8, 2);
  }
  v23 = type metadata accessor for RegexMessageReader();
  inited = swift_initStackObject(v23, v63);
  *(_OWORD *)(inited + 32) = 0u;
  *(_QWORD *)(inited + 48) = 0;
  *(_OWORD *)(inited + 16) = 0u;
  specialized RegexMessageReader.processRegexMessages(filePath:)(v6, v8, (uint64_t)v66);
  swift_bridgeObjectRelease(v8);
  v1 = *(_QWORD *)(inited + 16);
  v25 = *(_QWORD *)(inited + 24);
  v2 = *(_QWORD *)(inited + 32);
  v26 = *(_QWORD *)(inited + 40);
  v27 = *(_QWORD *)(inited + 48);
  outlined init with take of Region?((uint64_t)v66, inited + 16, &demangling cache variable for type metadata for Regex?);
  outlined consume of Regex?(v1, v25, v2, v26, v27);
  v28 = outlined init with take of Region?((uint64_t)v66, (uint64_t)v67, &demangling cache variable for type metadata for Regex?);
  v29 = v0;
  if (v67[0])
  {
    v30._rawValue = *(void **)(inited + 16);
    if (!v30._rawValue)
      goto LABEL_29;
  }
  else
  {
    v31 = Logger.logObject.getter(v28);
    v32 = static os_log_type_t.error.getter();
    v1 = v32;
    if (os_log_type_enabled(v31, v32))
    {
      v33 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v33 = 0;
      _os_log_impl((void *)&_mh_execute_header, v31, (os_log_type_t)v1, "smsfiltter: no valid regex found", v33, 2u);
      swift_slowDealloc(v33, -1, -1);
    }

    v30._rawValue = *(void **)(inited + 16);
    if (!v30._rawValue)
      goto LABEL_29;
  }
  v1 = *(_QWORD *)(inited + 24);
  swift_bridgeObjectRetain(v30._rawValue);
  swift_bridgeObjectRetain(v1);
  swift_beginAccess(v56 + 6, v57, 0, 0);
  v34 = v56[6];
  if (!v34)
  {
LABEL_58:
    __break(1u);
    goto LABEL_59;
  }
  swift_retain(v56[6]);
  RegexFilter.initRegexTemplates(initTemplateList:)(v30);
  swift_release(v34);
  swift_bridgeObjectRelease(v30._rawValue);
  if (v1)
  {
    swift_beginAccess(v56 + 7, v58, 0, 0);
    v35 = v56[7];
    if (!v35)
    {
LABEL_59:
      __break(1u);
LABEL_60:
      __break(1u);
      goto LABEL_61;
    }
    swift_retain(v56[7]);
    RegexFilter.initRegexTemplates(initTemplateList:)((Swift::OpaquePointer)v1);
    swift_release(v35);
    swift_bridgeObjectRelease(v1);
  }
LABEL_29:
  outlined init with take of Region?(v3, (uint64_t)&v60, &demangling cache variable for type metadata for Region?);
  outlined init with take of Region?((uint64_t)&v60, (uint64_t)v62, &demangling cache variable for type metadata for Region?);
  if (_s15extensionFilter6RegionVSgWOg((uint64_t)v62) == 1)
  {
LABEL_57:
    __break(1u);
    goto LABEL_58;
  }
  if (*(_BYTE *)(v3 + 104) != 1
    || (v36 = (unint64_t)RegexMessageReader.getRegexMessagesForSubClassification()()) == 0)
  {

    v54 = inited;
    goto LABEL_49;
  }
  v37 = v36;
  v1 = (uint64_t)(v56 + 8);
  swift_beginAccess(v56 + 8, v59, 0, 0);
  v38 = v56[8];
  if (!v38)
    goto LABEL_60;
  if (v38 == 1)
  {
LABEL_61:
    __break(1u);
    goto LABEL_62;
  }
  v39 = one-time initialization token for kFinance;
  swift_retain(v56[8]);
  if (v39 == -1)
  {
    if (*(_QWORD *)(v37 + 16))
      goto LABEL_36;
LABEL_51:
    __break(1u);
    goto LABEL_52;
  }
  swift_once(&one-time initialization token for kFinance, one-time initialization function for kFinance);
  if (!*(_QWORD *)(v37 + 16))
    goto LABEL_51;
LABEL_36:
  v2 = qword_100026CA8;
  v40 = static SmsFilter.SubClasses.kFinance;
  swift_bridgeObjectRetain(qword_100026CA8);
  v41 = specialized __RawDictionaryStorage.find<A>(_:)(v40, v2);
  if ((v42 & 1) == 0)
  {
LABEL_62:
    swift_bridgeObjectRelease(v2);
    __break(1u);
    goto LABEL_63;
  }
  v43._rawValue = *(void **)(*(_QWORD *)(v37 + 56) + 8 * v41);
  swift_bridgeObjectRetain(v43._rawValue);
  swift_bridgeObjectRelease(v2);
  RegexFilter.initRegexTemplates(initTemplateList:)(v43);
  swift_bridgeObjectRelease(v43._rawValue);
  swift_release(v38);
  if (*(_QWORD *)v1 == 1)
  {
LABEL_63:
    __break(1u);
    goto LABEL_64;
  }
  v38 = v56[10];
  if (!v38)
  {
LABEL_64:
    __break(1u);
    goto LABEL_65;
  }
  v44 = one-time initialization token for kOrders;
  swift_retain(v56[10]);
  if (v44 == -1)
  {
    if (*(_QWORD *)(v37 + 16))
      goto LABEL_41;
LABEL_53:
    __break(1u);
    goto LABEL_54;
  }
LABEL_52:
  swift_once(&one-time initialization token for kOrders, one-time initialization function for kOrders);
  if (!*(_QWORD *)(v37 + 16))
    goto LABEL_53;
LABEL_41:
  v2 = qword_100026CB8;
  v45 = static SmsFilter.SubClasses.kOrders;
  swift_bridgeObjectRetain(qword_100026CB8);
  v46 = specialized __RawDictionaryStorage.find<A>(_:)(v45, v2);
  if ((v47 & 1) == 0)
  {
LABEL_65:
    swift_bridgeObjectRelease(v2);
    __break(1u);
    goto LABEL_66;
  }
  v48._rawValue = *(void **)(*(_QWORD *)(v37 + 56) + 8 * v46);
  swift_bridgeObjectRetain(v48._rawValue);
  swift_bridgeObjectRelease(v2);
  RegexFilter.initRegexTemplates(initTemplateList:)(v48);
  swift_bridgeObjectRelease(v48._rawValue);
  swift_release(v38);
  if (*(_QWORD *)v1 == 1)
  {
LABEL_66:
    __break(1u);
    goto LABEL_67;
  }
  v29 = (_QWORD *)v56[9];
  if (!v29)
  {
LABEL_67:
    __break(1u);
    goto LABEL_68;
  }
  v49 = one-time initialization token for kReminders;
  swift_retain(v29);
  if (v49 == -1)
  {
    if (*(_QWORD *)(v37 + 16))
      goto LABEL_46;
    goto LABEL_55;
  }
LABEL_54:
  swift_once(&one-time initialization token for kReminders, one-time initialization function for kReminders);
  if (!*(_QWORD *)(v37 + 16))
  {
LABEL_55:
    __break(1u);
LABEL_56:
    __break(1u);
    goto LABEL_57;
  }
LABEL_46:
  v1 = qword_100026CC8;
  v50 = static SmsFilter.SubClasses.kReminders;
  swift_bridgeObjectRetain(qword_100026CC8);
  v51 = specialized __RawDictionaryStorage.find<A>(_:)(v50, v1);
  if ((v52 & 1) != 0)
  {
    v53._rawValue = *(void **)(*(_QWORD *)(v37 + 56) + 8 * v51);
    swift_bridgeObjectRetain(v53._rawValue);
    swift_bridgeObjectRelease(v1);
    RegexFilter.initRegexTemplates(initTemplateList:)(v53);
    swift_bridgeObjectRelease(v37);
    swift_bridgeObjectRelease(v53._rawValue);

    swift_release(inited);
    v54 = (uint64_t)v29;
LABEL_49:
    swift_release(v54);
    return;
  }
LABEL_68:
  swift_bridgeObjectRelease(v1);
  __break(1u);
}

Swift::Void __swiftcall SmsFilter.update()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  BOOL *v5;
  uint64_t v6;
  id *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _BYTE v30[24];
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _BYTE v36[128];
  _BYTE v37[128];
  _BYTE v38[24];

  v1 = v0;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  __chkstk_darwin(v2);
  v4 = (char *)&v21 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = (BOOL *)(v0 + 41);
  swift_beginAccess(v0 + 41, v38, 1, 0);
  if (*(_BYTE *)(v0 + 41) == 1 && (SmsFilter.retryTransitionTimerForMainModelExpired()() & 1) != 0)
  {
    swift_beginAccess(v0 + 40, &v22, 1, 0);
    *(_BYTE *)(v0 + 40) = 0;
  }
  v6 = v0 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__region;
  swift_beginAccess(v0 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__region, &v35, 0, 0);
  outlined init with take of Region?(v6, (uint64_t)v36, &demangling cache variable for type metadata for Region?);
  outlined init with take of Region?((uint64_t)v36, (uint64_t)v37, &demangling cache variable for type metadata for Region?);
  if (_s15extensionFilter6RegionVSgWOg((uint64_t)v37) == 1)
  {
    __break(1u);
    goto LABEL_26;
  }
  if (*(_BYTE *)(v6 + 88) != 1)
    goto LABEL_10;
  v7 = (id *)(v0 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__trialManager);
  swift_beginAccess(v1 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__trialManager, &v27, 0, 0);
  if (!*v7)
  {
LABEL_26:
    __break(1u);
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  if (objc_msgSend(*v7, "updateAvailable"))
  {
    swift_beginAccess(v1 + 40, &v26, 1, 0);
    *(_BYTE *)(v1 + 40) = 0;
    swift_beginAccess(v1 + 24, &v25, 1, 0);
    v8 = *(void **)(v1 + 24);
    *(_QWORD *)(v1 + 24) = 0;

    swift_beginAccess(v1 + 16, &v24, 1, 0);
    v9 = *(void **)(v1 + 16);
    *(_QWORD *)(v1 + 16) = 0;

    swift_beginAccess(v1 + 32, &v23, 1, 0);
    v10 = *(void **)(v1 + 32);
    *(_QWORD *)(v1 + 32) = 0;

    if (!*v7)
    {
LABEL_28:
      __break(1u);
      return;
    }
    objc_msgSend(*v7, "prepareForTrialParamsUpdate");
  }
LABEL_10:
  v11 = (uint64_t *)(v1 + 24);
  swift_beginAccess(v1 + 24, &v34, 0, 0);
  if (!*(_QWORD *)(v1 + 24))
  {
    swift_beginAccess(v1 + 16, &v29, 0, 0);
    if (!*(_QWORD *)(v1 + 16))
    {
      if (one-time initialization token for logger != -1)
        swift_once(&one-time initialization token for logger, one-time initialization function for logger);
      v12 = type metadata accessor for Logger(0);
      v13 = __swift_project_value_buffer(v12, (uint64_t)logger);
      v14 = Logger.logObject.getter(v13);
      v15 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v14, v15))
      {
        v16 = (uint8_t *)swift_slowAlloc(2, -1);
        *(_WORD *)v16 = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, v15, "smsfilter: both models are nil, try loading them again...", v16, 2u);
        swift_slowDealloc(v16, -1, -1);
      }

      swift_beginAccess(v1 + 40, &v28, 1, 0);
      *(_BYTE *)(v1 + 40) = 0;
    }
  }
  swift_beginAccess(v1 + 40, &v33, 1, 0);
  if ((*(_BYTE *)(v1 + 40) & 1) == 0)
  {
    outlined init with take of Region?(v6, (uint64_t)v31, &demangling cache variable for type metadata for Region?);
    outlined init with take of Region?((uint64_t)v31, (uint64_t)v32, &demangling cache variable for type metadata for Region?);
    v17 = _s15extensionFilter6RegionVSgWOg((uint64_t)v32);
    if ((_DWORD)v17 != 1)
    {
      if (*(_BYTE *)(v6 + 88) == 1)
      {
        SmsFilter.loadTrialMainModelWithThresholds()();
        SmsFilter.loadFallbackModel()();
        SmsFilter.loadTrialSubClassificationModel()();
        SmsFilter.loadRegexFromTrial()();
      }
      v18 = *v11;
      *v5 = *v11 == 0;
      if (!v18)
      {
        Date.init()(v17);
        v19 = type metadata accessor for Date(0);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 56))(v4, 0, 1, v19);
        v20 = v1 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__dateCheckpoint;
        swift_beginAccess(v1 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__dateCheckpoint, v30, 33, 0);
        outlined assign with take of Date?((uint64_t)v4, v20);
        swift_endAccess(v30);
      }
      *(_BYTE *)(v1 + 40) = 1;
      return;
    }
    goto LABEL_27;
  }
}

uint64_t SmsFilter.retryTransitionTimerForMainModelExpired()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t result;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  char v28;
  uint64_t v29;
  void (*v30)(char *, uint64_t);
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  _BYTE v42[24];
  _BYTE v43[24];
  _BYTE v44[24];

  v1 = type metadata accessor for DateComponents(0);
  v39 = *(_QWORD *)(v1 - 8);
  v40 = v1;
  __chkstk_darwin(v1);
  v3 = (char *)&v35 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for Calendar(0);
  v37 = *(_QWORD *)(v4 - 8);
  v38 = v4;
  __chkstk_darwin(v4);
  v6 = (char *)&v35 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  v8 = __chkstk_darwin(v7);
  v36 = (char *)&v35 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  v11 = (char *)&v35 - v10;
  v12 = type metadata accessor for Date(0);
  v13 = *(_QWORD *)(v12 - 8);
  v14 = __chkstk_darwin(v12);
  v16 = (char *)&v35 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  Date.init()(v14);
  v41 = v0;
  v17 = v0 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__dateCheckpoint;
  swift_beginAccess(v17, v44, 0, 0);
  v35 = v17;
  outlined init with copy of Date?(v17, (uint64_t)v11);
  result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12);
  if ((_DWORD)result == 1)
  {
    __break(1u);
    goto LABEL_8;
  }
  static Calendar.current.getter();
  v19 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Calendar.Component>);
  v20 = type metadata accessor for Calendar.Component(0);
  v21 = *(_QWORD *)(v20 - 8);
  v22 = *(unsigned __int8 *)(v21 + 80);
  v23 = (v22 + 32) & ~v22;
  v24 = swift_allocObject(v19, v23 + *(_QWORD *)(v21 + 72), v22 | 7);
  *(_OWORD *)(v24 + 16) = xmmword_100019D50;
  v25 = v24 + v23;
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v21 + 104))(v25, enum case for Calendar.Component.second(_:), v20);
  v26 = specialized Set.init(_nonEmptyArrayLiteral:)(v24);
  swift_setDeallocating(v24);
  swift_arrayDestroy(v25, 1, v20);
  swift_deallocClassInstance(v24, 32, 7);
  Calendar.dateComponents(_:from:to:)(v26, v11, v16);
  v27 = swift_bridgeObjectRelease(v26);
  result = DateComponents.second.getter(v27);
  if ((v28 & 1) != 0)
  {
LABEL_8:
    __break(1u);
    return result;
  }
  v29 = result / 60;
  (*(void (**)(char *, uint64_t))(v39 + 8))(v3, v40);
  (*(void (**)(char *, uint64_t))(v37 + 8))(v6, v38);
  v30 = *(void (**)(char *, uint64_t))(v13 + 8);
  v30(v11, v12);
  v31 = (uint64_t *)(v41 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__retryTransitionTimerForMainModel);
  swift_beginAccess(v41 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__retryTransitionTimerForMainModel, v43, 0, 0);
  v32 = *v31;
  if (v29 < v32)
  {
    v30(v16, v12);
  }
  else
  {
    v33 = (uint64_t)v36;
    (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v36, v16, v12);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v13 + 56))(v33, 0, 1, v12);
    v34 = v35;
    swift_beginAccess(v35, v42, 33, 0);
    outlined assign with take of Date?(v33, v34);
    swift_endAccess(v42);
  }
  return v29 >= v32;
}

Swift::Bool __swiftcall SmsFilter.trialBasicModelAvailable()()
{
  uint64_t v0;
  uint64_t v1;
  int v2;
  _BYTE v4[24];
  _BYTE v5[128];
  _BYTE v6[128];

  v1 = v0 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__region;
  swift_beginAccess(v0 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__region, v4, 0, 0);
  outlined init with take of Region?(v1, (uint64_t)v5, &demangling cache variable for type metadata for Region?);
  outlined init with take of Region?((uint64_t)v5, (uint64_t)v6, &demangling cache variable for type metadata for Region?);
  v2 = _s15extensionFilter6RegionVSgWOg((uint64_t)v6);
  if (v2 == 1)
    __break(1u);
  else
    LOBYTE(v2) = *(_BYTE *)(v1 + 17);
  return v2;
}

Swift::Bool __swiftcall SmsFilter.subClassificationModelAvailable()()
{
  uint64_t v0;
  uint64_t v1;
  int v2;
  _BYTE v4[24];
  _BYTE v5[128];
  _BYTE v6[128];

  v1 = v0 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__region;
  swift_beginAccess(v0 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__region, v4, 0, 0);
  outlined init with take of Region?(v1, (uint64_t)v5, &demangling cache variable for type metadata for Region?);
  outlined init with take of Region?((uint64_t)v5, (uint64_t)v6, &demangling cache variable for type metadata for Region?);
  v2 = _s15extensionFilter6RegionVSgWOg((uint64_t)v6);
  if (v2 == 1)
    __break(1u);
  else
    LOBYTE(v2) = *(_BYTE *)(v1 + 104);
  return v2;
}

uint64_t SmsFilter.getSubActionRegexListPredictionForMessage(messageBody:)(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v6;
  uint64_t result;
  uint64_t v8;
  Swift::String v9;
  Swift::Bool v10;
  uint64_t v11;
  Swift::String v12;
  Swift::Bool v13;
  uint64_t v14;
  Swift::String v15;
  Swift::Bool v16;
  _BYTE v17[24];

  v3 = v2;
  v6 = (_QWORD *)(v2 + 64);
  result = swift_beginAccess(v2 + 64, v17, 0, 0);
  v8 = *(_QWORD *)(v2 + 64);
  if (!v8)
  {
    __break(1u);
    goto LABEL_16;
  }
  if (v8 == 1)
  {
LABEL_16:
    __break(1u);
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  swift_retain(v8);
  v9._countAndFlagsBits = a1;
  v9._object = a2;
  v10 = RegexFilter.isMessageInRegexList(message:)(v9);
  result = swift_release(v8);
  if (v10)
    return 10001;
  if (*v6 == 1)
    goto LABEL_17;
  v11 = *(_QWORD *)(v3 + 72);
  if (!v11)
  {
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  swift_retain(*(_QWORD *)(v3 + 72));
  v12._countAndFlagsBits = a1;
  v12._object = a2;
  v13 = RegexFilter.isMessageInRegexList(message:)(v12);
  result = swift_release(v11);
  if (v13)
    return 10003;
  if (*v6 == 1)
    goto LABEL_19;
  v14 = *(_QWORD *)(v3 + 80);
  if (!v14)
  {
LABEL_20:
    __break(1u);
    return result;
  }
  swift_retain(*(_QWORD *)(v3 + 80));
  v15._countAndFlagsBits = a1;
  v15._object = a2;
  v16 = RegexFilter.isMessageInRegexList(message:)(v15);
  swift_release(v14);
  if (v16)
    return 10002;
  else
    return 0;
}

uint64_t SmsFilter.classifyAction(sender:messageBody:)(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  unint64_t v4;
  unint64_t v5;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  uint64_t v15;
  uint64_t inited;
  unint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t result;
  uint64_t v21;
  Swift::String v22;
  Swift::Bool v23;
  uint64_t v24;
  Swift::String v25;
  Swift::Bool v26;
  uint64_t v27;
  NSObject *v28;
  os_log_type_t v29;
  uint8_t *v30;
  uint64_t v31;
  Swift::String v32;
  Swift::Bool v33;
  Swift::UInt v34;
  uint64_t v35;
  NSObject *v36;
  os_log_type_t v37;
  uint8_t *v38;
  _QWORD *v39;
  char v40;
  uint64_t v41;
  NSString v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  Swift::String v46;
  Swift::Bool v47;
  void *v48;
  uint64_t v49;
  NSObject *v50;
  os_log_type_t v51;
  uint8_t *v52;
  _BYTE v53[24];
  _BYTE v54[24];
  _BYTE v55[128];
  NSString v56;
  uint64_t v57;
  _BYTE v58[32];
  _BYTE v59[24];
  _BYTE v60[24];
  _BYTE v61[24];
  Swift::UInt v62;
  _BYTE v63[160];

  v5 = v4;
  if (one-time initialization token for logger != -1)
    swift_once(&one-time initialization token for logger, one-time initialization function for logger);
  v10 = type metadata accessor for Logger(0);
  v11 = __swift_project_value_buffer(v10, (uint64_t)logger);
  v12 = Logger.logObject.getter(v11);
  v13 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v12, v13))
  {
    v14 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v14 = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, v13, "smsfilter: classifyAction", v14, 2u);
    swift_slowDealloc(v14, -1, -1);
  }

  v15 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(ILMessageFilterAction, String)>);
  inited = swift_initStackObject(v15, v63);
  *(_OWORD *)(inited + 16) = xmmword_100019B50;
  *(_OWORD *)(inited + 32) = xmmword_100019DB0;
  *(_QWORD *)(inited + 48) = 0xE400000000000000;
  *(_OWORD *)(inited + 56) = xmmword_100019DC0;
  *(_QWORD *)(inited + 72) = 0xE500000000000000;
  *(_OWORD *)(inited + 80) = xmmword_100019DD0;
  *(_QWORD *)(inited + 96) = 0xE400000000000000;
  *(_OWORD *)(inited + 104) = xmmword_100019DE0;
  *(_QWORD *)(inited + 120) = 0xEB000000006C616ELL;
  *(_OWORD *)(inited + 128) = xmmword_100019DF0;
  *(_QWORD *)(inited + 144) = 0xED00006C616E6F69;
  v17 = specialized Dictionary.init(dictionaryLiteral:)((_QWORD *)inited, &demangling cache variable for type metadata for _DictionaryStorage<ILMessageFilterAction, String>);
  swift_setDeallocating(inited);
  v18 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (ILMessageFilterAction, String));
  swift_arrayDestroy(inited + 32, 5, v18);
  v62 = 1;
  v19 = (_QWORD *)(v5 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__regionUtils);
  result = swift_beginAccess(v5 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__regionUtils, v61, 0, 0);
  v21 = *v19;
  if (!*v19)
  {
LABEL_38:
    __break(1u);
    goto LABEL_39;
  }
  swift_retain(*v19);
  v22._countAndFlagsBits = a1;
  v22._object = a2;
  v23 = RegionUtils.shouldApplyFilter(sender:)(v22);
  swift_release(v21);
  if (v23)
  {
    result = swift_beginAccess(v5 + 48, v60, 0, 0);
    v24 = *(_QWORD *)(v5 + 48);
    if (!v24)
    {
LABEL_39:
      __break(1u);
      goto LABEL_40;
    }
    swift_retain(*(_QWORD *)(v5 + 48));
    v25._countAndFlagsBits = a3;
    v25._object = a4;
    v26 = RegexFilter.isMessageInRegexList(message:)(v25);
    swift_release(v24);
    if (v26)
    {
      v62 = 3;
LABEL_17:
      v35 = swift_bridgeObjectRetain(v17);
      v36 = Logger.logObject.getter(v35);
      v37 = static os_log_type_t.default.getter();
      if (!os_log_type_enabled(v36, v37))
      {

        swift_bridgeObjectRelease_n(v17, 2);
LABEL_22:
        swift_beginAccess(&v62, v58, 0, 0);
        result = v62;
        if (v62 != 4)
          return result;
        v44 = v5 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__region;
        swift_beginAccess(v5 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__region, v54, 0, 0);
        outlined init with take of Region?(v44, (uint64_t)v55, &demangling cache variable for type metadata for Region?);
        outlined init with take of Region?((uint64_t)v55, (uint64_t)&v56, &demangling cache variable for type metadata for Region?);
        result = _s15extensionFilter6RegionVSgWOg((uint64_t)&v56);
        if ((_DWORD)result != 1)
        {
LABEL_24:
          if (*(_BYTE *)(v44 + 104) == 1)
            SmsFilter.subClassifyAction(messageBody:)(a3, a4);
          return 4;
        }
        goto LABEL_41;
      }
      v38 = (uint8_t *)swift_slowAlloc(12, -1);
      v39 = (_QWORD *)swift_slowAlloc(8, -1);
      *(_DWORD *)v38 = 138543362;
      result = swift_beginAccess(&v62, v53, 0, 0);
      if (*(_QWORD *)(v17 + 16))
      {
        result = specialized __RawDictionaryStorage.find<A>(_:)(v62);
        if ((v40 & 1) != 0)
        {
          v41 = *(_QWORD *)(*(_QWORD *)(v17 + 56) + 16 * result + 8);
          swift_bridgeObjectRetain(v41);
          v42 = String._bridgeToObjectiveC()();
          swift_bridgeObjectRelease(v41);
          v56 = v42;
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v56, &v57);
          *v39 = v42;
          swift_bridgeObjectRelease_n(v17, 2);
          _os_log_impl((void *)&_mh_execute_header, v36, v37, "smsfilter: regexfilter label: %{public}@", v38, 0xCu);
          v43 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
          swift_arrayDestroy(v39, 1, v43);
          swift_slowDealloc(v39, -1, -1);
          swift_slowDealloc(v38, -1, -1);

          goto LABEL_22;
        }
      }
      else
      {
        __break(1u);
      }
      __break(1u);
      goto LABEL_38;
    }
    result = swift_beginAccess(v5 + 56, v59, 0, 0);
    v31 = *(_QWORD *)(v5 + 56);
    if (!v31)
    {
LABEL_40:
      __break(1u);
LABEL_41:
      __break(1u);
      goto LABEL_42;
    }
    swift_retain(*(_QWORD *)(v5 + 56));
    v32._countAndFlagsBits = a3;
    v32._object = a4;
    v33 = RegexFilter.isMessageInRegexList(message:)(v32);
    result = swift_release(v31);
    v34 = 4;
    if (!v33)
      v34 = 1;
    v62 = v34;
    if (v34 - 3 <= 1)
      goto LABEL_17;
    v45 = *v19;
    if (!*v19)
    {
LABEL_42:
      __break(1u);
      return result;
    }
    swift_retain(*v19);
    v46._countAndFlagsBits = a3;
    v46._object = a4;
    v47 = RegionUtils.dominantLanguageMatch(message:)(v46);
    swift_release(v45);
    if (v47)
    {
      v48 = objc_autoreleasePoolPush();
      specialized closure #1 in SmsFilter.classifyAction(sender:messageBody:)(v5, a3, (uint64_t)a4, (uint64_t *)&v62, v17);
      objc_autoreleasePoolPop(v48);
      swift_bridgeObjectRelease(v17);
      swift_beginAccess(&v62, v58, 0, 0);
      result = v62;
      if (v62 != 4)
        return result;
      v44 = v5 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__region;
      swift_beginAccess(v5 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__region, v54, 0, 0);
      outlined init with take of Region?(v44, (uint64_t)v55, &demangling cache variable for type metadata for Region?);
      outlined init with take of Region?((uint64_t)v55, (uint64_t)&v56, &demangling cache variable for type metadata for Region?);
      result = _s15extensionFilter6RegionVSgWOg((uint64_t)&v56);
      if ((_DWORD)result == 1)
      {
        __break(1u);
        return result;
      }
      goto LABEL_24;
    }
    v49 = swift_bridgeObjectRelease(v17);
    v62 = 4;
    v50 = Logger.logObject.getter(v49);
    v51 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v50, v51))
    {
      v52 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v52 = 0;
      _os_log_impl((void *)&_mh_execute_header, v50, v51, "smsfilter: message  doesn't have a dominant language, so label: Transactional", v52, 2u);
      swift_slowDealloc(v52, -1, -1);
    }

    return v62;
  }
  else
  {
    v27 = swift_bridgeObjectRelease(v17);
    v28 = Logger.logObject.getter(v27);
    v29 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v28, v29))
    {
      v30 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v30 = 0;
      _os_log_impl((void *)&_mh_execute_header, v28, v29, "smsfilter: do not apply the smsfilter", v30, 2u);
      swift_slowDealloc(v30, -1, -1);
    }

    return 1;
  }
}

unint64_t specialized Dictionary.init(dictionaryLiteral:)(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t result;
  char v12;
  uint64_t *v13;
  _QWORD *v14;
  uint64_t v15;
  BOOL v16;
  uint64_t v17;

  v2 = *(_QWORD *)(a1 + 16);
  if (!v2)
  {
    v4 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<String, String>);
  v3 = static _DictionaryStorage.allocate(capacity:)(v2);
  v4 = (_QWORD *)v3;
  v5 = *(_QWORD *)(a1 + 16);
  if (!v5)
  {
LABEL_9:
    swift_bridgeObjectRelease(a1);
    return (unint64_t)v4;
  }
  swift_retain(v3);
  v6 = (uint64_t *)(a1 + 56);
  while (1)
  {
    v7 = *(v6 - 3);
    v8 = *(v6 - 2);
    v10 = *(v6 - 1);
    v9 = *v6;
    swift_bridgeObjectRetain(v8);
    swift_bridgeObjectRetain(v9);
    result = specialized __RawDictionaryStorage.find<A>(_:)(v7, v8);
    if ((v12 & 1) != 0)
      break;
    *(_QWORD *)((char *)v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v13 = (uint64_t *)(v4[6] + 16 * result);
    *v13 = v7;
    v13[1] = v8;
    v14 = (_QWORD *)(v4[7] + 16 * result);
    *v14 = v10;
    v14[1] = v9;
    v15 = v4[2];
    v16 = __OFADD__(v15, 1);
    v17 = v15 + 1;
    if (v16)
      goto LABEL_11;
    v6 += 4;
    v4[2] = v17;
    if (!--v5)
    {
      swift_release(v4);
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t SmsFilter.subClassifyAction(messageBody:)(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  uint64_t v11;
  uint64_t inited;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  _QWORD *v19;
  unint64_t result;
  char v21;
  uint64_t v22;
  NSString v23;
  uint64_t v24;
  void *v25;
  _BYTE v26[24];
  NSString v27;
  uint64_t v28;
  Swift::UInt v29;
  _BYTE v30[128];

  v3 = v2;
  if (one-time initialization token for logger != -1)
    swift_once(&one-time initialization token for logger, one-time initialization function for logger);
  v6 = type metadata accessor for Logger(0);
  v7 = __swift_project_value_buffer(v6, (uint64_t)logger);
  v8 = Logger.logObject.getter(v7);
  v9 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "smsfilter: sub-classifyAction", v10, 2u);
    swift_slowDealloc(v10, -1, -1);
  }

  v11 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(ILMessageFilterSubAction, String)>);
  inited = swift_initStackObject(v11, v30);
  *(_OWORD *)(inited + 16) = xmmword_100019E00;
  *(_OWORD *)(inited + 32) = xmmword_100019E10;
  *(_QWORD *)(inited + 48) = 0xE600000000000000;
  *(_OWORD *)(inited + 56) = xmmword_100019E20;
  *(_QWORD *)(inited + 72) = 0xE700000000000000;
  *(_OWORD *)(inited + 80) = xmmword_100019E30;
  *(_QWORD *)(inited + 96) = 0xE600000000000000;
  *(_OWORD *)(inited + 104) = xmmword_100019E40;
  *(_QWORD *)(inited + 120) = 0xE900000000000073;
  v13 = specialized Dictionary.init(dictionaryLiteral:)((_QWORD *)inited, &demangling cache variable for type metadata for _DictionaryStorage<ILMessageFilterSubAction, String>);
  swift_setDeallocating(inited);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (ILMessageFilterSubAction, String));
  swift_arrayDestroy(inited + 32, 4, v14);
  v29 = SmsFilter.getSubActionRegexListPredictionForMessage(messageBody:)(a1, a2);
  if (!v29)
  {
    v25 = objc_autoreleasePoolPush();
    specialized closure #1 in SmsFilter.subClassifyAction(messageBody:)(v3, a1, (uint64_t)a2, (uint64_t *)&v29, v13);
    objc_autoreleasePoolPop(v25);
    swift_bridgeObjectRelease(v13);
    goto LABEL_12;
  }
  v15 = swift_bridgeObjectRetain(v13);
  v16 = Logger.logObject.getter(v15);
  v17 = static os_log_type_t.default.getter();
  if (!os_log_type_enabled(v16, v17))
  {

    swift_bridgeObjectRelease_n(v13, 2);
    goto LABEL_12;
  }
  v18 = (uint8_t *)swift_slowAlloc(12, -1);
  v19 = (_QWORD *)swift_slowAlloc(8, -1);
  *(_DWORD *)v18 = 138543362;
  result = swift_beginAccess(&v29, v26, 0, 0);
  if (*(_QWORD *)(v13 + 16))
  {
    result = specialized __RawDictionaryStorage.find<A>(_:)(v29);
    if ((v21 & 1) != 0)
    {
      v22 = *(_QWORD *)(*(_QWORD *)(v13 + 56) + 16 * result + 8);
      swift_bridgeObjectRetain(v22);
      v23 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease(v22);
      v27 = v23;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v27, &v28);
      *v19 = v23;
      swift_bridgeObjectRelease_n(v13, 2);
      _os_log_impl((void *)&_mh_execute_header, v16, v17, "smsfilter: regexfilter label: %{public}@", v18, 0xCu);
      v24 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      swift_arrayDestroy(v19, 1, v24);
      swift_slowDealloc(v19, -1, -1);
      swift_slowDealloc(v18, -1, -1);

LABEL_12:
      swift_beginAccess(&v29, &v27, 0, 0);
      return v29;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

void specialized closure #1 in SmsFilter.classifyAction(sender:messageBody:)(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v9;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  void *v16;
  id v17;
  unint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  int64_t v23;
  int64_t v24;
  int64_t v25;
  double v26;
  NSObject *j;
  unint64_t v28;
  unint64_t v29;
  int64_t *v30;
  NSObject *v31;
  int64_t v32;
  unint64_t v33;
  int64_t v34;
  BOOL v35;
  int v36;
  double *v37;
  double *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t i;
  unint64_t v48;
  unint64_t v49;
  uint64_t v50;
  uint64_t v51;
  int64_t v52;
  unint64_t v53;
  int64_t v54;
  uint64_t *v55;
  uint64_t v56;
  char *v57;
  uint64_t v58;
  uint64_t v59;
  int64_t v60;
  NSObject *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t *v64;
  unint64_t v65;
  uint64_t v66;
  _BYTE *v67;
  Swift::UInt *v68;
  uint64_t v69;
  unint64_t v70;
  char v71;
  uint64_t v72;
  NSString v73;
  _QWORD *v74;
  os_log_t v75;
  uint64_t v76;
  uint64_t v77;
  unint64_t v78;
  uint64_t v79;
  NSObject *v80;
  os_log_type_t v81;
  uint8_t *v82;
  char v83;
  uint64_t v84;
  char v85;
  uint64_t *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t *v91;
  unint64_t v92;
  uint64_t v93;
  Swift::UInt *v94;
  uint64_t v95;
  unint64_t v96;
  char v97;
  uint64_t v98;
  objc_class *v99;
  os_log_t v100;
  uint64_t v101;
  uint64_t v102;
  _QWORD *v103;
  uint64_t v104;
  os_log_t v105;
  char *v106;
  uint64_t v107;
  uint64_t v108;
  int64_t v109;
  void *v110;
  uint64_t v111;
  uint64_t *v112;
  unint64_t v113;
  objc_class *v114;
  uint64_t v115;
  uint64_t v116[3];
  NSString v117;
  uint64_t v118;
  _BYTE v119[24];
  uint64_t v120;
  _BYTE v121[16];
  uint64_t v122;
  _BYTE v123[16];
  _BYTE v124[128];
  _BYTE v125[128];
  _BYTE v126[24];
  char v127[24];
  uint64_t v128;

  v112 = a4;
  v108 = a3;
  v9 = type metadata accessor for Logger(0);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = __chkstk_darwin(v9);
  v13 = (char *)&v103 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  v15 = (char *)&v103 - v14;
  v128 = 0;
  swift_beginAccess(a1 + 24, v127, 0, 0);
  v16 = *(void **)(a1 + 24);
  v113 = a1;
  if (!v16)
  {
    v40 = a5;
    v41 = v108;
    v106 = v13;
    swift_beginAccess(a1 + 16, v126, 0, 0);
    v42 = *(void **)(a1 + 16);
    if (!v42)
    {
      if (one-time initialization token for logger != -1)
        swift_once(&one-time initialization token for logger, one-time initialization function for logger);
      v79 = __swift_project_value_buffer(v9, (uint64_t)logger);
      v80 = Logger.logObject.getter(v79);
      v81 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v80, v81))
      {
        v82 = (uint8_t *)swift_slowAlloc(2, -1);
        *(_WORD *)v82 = 0;
        _os_log_impl((void *)&_mh_execute_header, v80, v81, "smsfilter: no active smsfilter", v82, 2u);
        swift_slowDealloc(v82, -1, -1);
      }

      return;
    }
    v110 = (void *)v9;
    v111 = v40;
    v109 = v10;
    v107 = v5;
    v19 = v42;
    v43 = NLModel.predictedLabelHypotheses(for:maximumCount:)(a2, v41, 1);

    v44 = v43 + 64;
    v45 = 1 << *(_BYTE *)(v43 + 32);
    v46 = -1;
    if (v45 < 64)
      v46 = ~(-1 << v45);
    v18 = v46 & *(_QWORD *)(v43 + 64);
    v24 = (unint64_t)(v45 + 63) >> 6;
    swift_bridgeObjectRetain(v43);
    j = 0;
    v25 = 0;
    for (i = 0xE000000000000000; ; i = (unint64_t)v19)
    {
      if (v18)
      {
        v48 = __clz(__rbit64(v18));
        v18 &= v18 - 1;
        v49 = v48 | (v25 << 6);
      }
      else
      {
        v52 = v25 + 1;
        if (__OFADD__(v25, 1))
        {
LABEL_98:
          __break(1u);
LABEL_99:
          __break(1u);
          goto LABEL_100;
        }
        if (v52 >= v24)
          goto LABEL_71;
        v53 = *(_QWORD *)(v44 + 8 * v52);
        ++v25;
        if (!v53)
        {
          v25 = v52 + 1;
          if (v52 + 1 >= v24)
            goto LABEL_71;
          v53 = *(_QWORD *)(v44 + 8 * v25);
          if (!v53)
          {
            v25 = v52 + 2;
            if (v52 + 2 >= v24)
              goto LABEL_71;
            v53 = *(_QWORD *)(v44 + 8 * v25);
            if (!v53)
            {
              v54 = v52 + 3;
              if (v54 >= v24)
              {
LABEL_71:
                swift_release(v43);
                if (j == 0x6F69746F6D6F7250 && i == 0xEB000000006C616ELL)
                {
                  swift_bridgeObjectRelease(0xEB000000006C616ELL);
                  v24 = v109;
                  v62 = (uint64_t)v110;
                  v67 = (_BYTE *)v111;
                  v63 = (uint64_t)v106;
                  goto LABEL_81;
                }
                v83 = _stringCompareWithSmolCheck(_:_:expecting:)(j, i, 0x6F69746F6D6F7250, 0xEB000000006C616ELL, 0);
                v24 = v109;
                v67 = (_BYTE *)v111;
                v63 = (uint64_t)v106;
                if ((v83 & 1) != 0)
                {
                  swift_bridgeObjectRelease(i);
                  v62 = (uint64_t)v110;
LABEL_81:
                  v84 = 3;
LABEL_87:
                  v86 = v112;
                  swift_beginAccess(v112, v119, 1, 0);
                  *v86 = v84;
LABEL_88:
                  if (one-time initialization token for logger != -1)
                    goto LABEL_104;
                  goto LABEL_89;
                }
                v62 = (uint64_t)v110;
                if (j == 0x746361736E617254 && i == 0xED00006C616E6F69)
                {
                  swift_bridgeObjectRelease(0xED00006C616E6F69);
                }
                else
                {
                  v85 = _stringCompareWithSmolCheck(_:_:expecting:)(j, i, 0x746361736E617254, 0xED00006C616E6F69, 0);
                  swift_bridgeObjectRelease(i);
                  if ((v85 & 1) == 0)
                    goto LABEL_88;
                }
                v84 = 4;
                goto LABEL_87;
              }
              v53 = *(_QWORD *)(v44 + 8 * v54);
              if (!v53)
              {
                while (1)
                {
                  v25 = v54 + 1;
                  if (__OFADD__(v54, 1))
                    break;
                  if (v25 >= v24)
                    goto LABEL_71;
                  v53 = *(_QWORD *)(v44 + 8 * v25);
                  ++v54;
                  if (v53)
                    goto LABEL_55;
                }
LABEL_100:
                __break(1u);
LABEL_101:
                swift_once(&one-time initialization token for logger, one-time initialization function for logger);
                goto LABEL_64;
              }
              v25 = v54;
            }
          }
        }
LABEL_55:
        v18 = (v53 - 1) & v53;
        v49 = __clz(__rbit64(v53)) + (v25 << 6);
      }
      v50 = *(_QWORD *)(v43 + 48) + 16 * v49;
      j = *(NSObject **)v50;
      v19 = *(id *)(v50 + 8);
      v51 = *(_QWORD *)(*(_QWORD *)(v43 + 56) + 8 * v49);
      swift_bridgeObjectRetain(v19);
      swift_bridgeObjectRelease(i);
      v128 = v51;
    }
  }
  v106 = v15;
  v107 = v5;
  v110 = (void *)v9;
  v111 = a5;
  v109 = v10;
  v17 = v16;
  v18 = NLModel.predictedLabelHypotheses(for:maximumCount:)(a2, v108, 1);

  v19 = (id)(v18 + 64);
  v20 = 1 << *(_BYTE *)(v18 + 32);
  v21 = -1;
  if (v20 < 64)
    v21 = ~(-1 << v20);
  v22 = v21 & *(_QWORD *)(v18 + 64);
  v23 = (unint64_t)(v20 + 63) >> 6;
  swift_bridgeObjectRetain(v18);
  v24 = 0;
  v25 = 0;
  v26 = 0.0;
  for (j = 0xE000000000000000; ; j = v31)
  {
    if (v22)
    {
      v28 = __clz(__rbit64(v22));
      v22 &= v22 - 1;
      v29 = v28 | (v25 << 6);
      goto LABEL_6;
    }
    v32 = v25 + 1;
    if (__OFADD__(v25, 1))
    {
      __break(1u);
      goto LABEL_98;
    }
    if (v32 >= v23)
      break;
    v33 = *((_QWORD *)v19 + v32);
    ++v25;
    if (!v33)
    {
      v25 = v32 + 1;
      if (v32 + 1 >= v23)
        break;
      v33 = *((_QWORD *)v19 + v25);
      if (!v33)
      {
        v25 = v32 + 2;
        if (v32 + 2 >= v23)
          break;
        v33 = *((_QWORD *)v19 + v25);
        if (!v33)
        {
          v34 = v32 + 3;
          if (v34 >= v23)
            break;
          v33 = *((_QWORD *)v19 + v34);
          if (!v33)
          {
            while (1)
            {
              v25 = v34 + 1;
              if (__OFADD__(v34, 1))
                goto LABEL_99;
              if (v25 >= v23)
                goto LABEL_22;
              v33 = *((_QWORD *)v19 + v25);
              ++v34;
              if (v33)
                goto LABEL_21;
            }
          }
          v25 = v34;
        }
      }
    }
LABEL_21:
    v22 = (v33 - 1) & v33;
    v29 = __clz(__rbit64(v33)) + (v25 << 6);
LABEL_6:
    v30 = (int64_t *)(*(_QWORD *)(v18 + 48) + 16 * v29);
    v24 = *v30;
    v31 = v30[1];
    v26 = *(double *)(*(_QWORD *)(v18 + 56) + 8 * v29);
    swift_bridgeObjectRetain(v31);
    swift_bridgeObjectRelease(j);
    v128 = *(_QWORD *)&v26;
  }
LABEL_22:
  swift_release(v18);
  v35 = v24 == 0x6F69746F6D6F7250 && j == 0xEB000000006C616ELL;
  v36 = v35;
  v25 = v109;
  if (!v35
    && (_stringCompareWithSmolCheck(_:_:expecting:)(v24, j, 0x6F69746F6D6F7250, 0xEB000000006C616ELL, 0) & 1) == 0)
  {
LABEL_32:
    if ((_stringCompareWithSmolCheck(_:_:expecting:)(v24, j, 0x6F69746F6D6F7250, 0xEB000000006C616ELL, 0) & 1) != 0)
      goto LABEL_33;
    goto LABEL_56;
  }
  v37 = (double *)(v113 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__promotionalThreshold);
  swift_beginAccess(v113 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__promotionalThreshold, &v114, 0, 0);
  if (*v37 <= v26)
  {
    v39 = 3;
LABEL_61:
    v19 = v110;
LABEL_62:
    v55 = v112;
    swift_beginAccess(v112, v119, 1, 0);
    *v55 = v39;
  }
  else
  {
    if (!v36)
      goto LABEL_32;
LABEL_33:
    v38 = (double *)(v113 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__promotionalThreshold);
    swift_beginAccess(v113 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__promotionalThreshold, v116, 0, 0);
    if (v26 < *v38)
    {
      v39 = 4;
      goto LABEL_61;
    }
LABEL_56:
    v19 = v110;
    if (v24 == 0x746361736E617254 && j == 0xED00006C616E6F69
      || (_stringCompareWithSmolCheck(_:_:expecting:)(v24, j, 0x746361736E617254, 0xED00006C616E6F69, 0) & 1) != 0)
    {
      v39 = 4;
      goto LABEL_62;
    }
  }
  if (one-time initialization token for logger != -1)
    goto LABEL_101;
LABEL_64:
  v56 = __swift_project_value_buffer((uint64_t)v19, (uint64_t)logger);
  v57 = v106;
  (*(void (**)(char *, uint64_t, id))(v25 + 16))(v106, v56, v19);
  swift_retain_n(v113, 2);
  v58 = v111;
  swift_bridgeObjectRetain_n(v111, 2);
  v59 = swift_bridgeObjectRetain(j);
  v60 = v25;
  v61 = Logger.logObject.getter(v59);
  LODWORD(v108) = static os_log_type_t.default.getter();
  if (!os_log_type_enabled(v61, (os_log_type_t)v108))
  {

    swift_bridgeObjectRelease_n(v58, 2);
    swift_bridgeObjectRelease_n(j, 2);
    swift_release_n(v113, 2);
    (*(void (**)(char *, id))(v60 + 8))(v57, v19);
LABEL_70:
    v78 = v18;
LABEL_96:
    swift_bridgeObjectRelease(v78);
    return;
  }
  v105 = v61;
  v62 = swift_slowAlloc(42, -1);
  v103 = (_QWORD *)swift_slowAlloc(8, -1);
  v104 = swift_slowAlloc(64, -1);
  v118 = v104;
  *(_DWORD *)v62 = 136315906;
  v63 = v113;
  v64 = (uint64_t *)(v113 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__region);
  swift_beginAccess(v113 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__region, v126, 0, 0);
  outlined init with take of Region?((uint64_t)v64, (uint64_t)v124, &demangling cache variable for type metadata for Region?);
  outlined init with take of Region?((uint64_t)v124, (uint64_t)v125, &demangling cache variable for type metadata for Region?);
  if (_s15extensionFilter6RegionVSgWOg((uint64_t)v125) == 1)
    goto LABEL_107;
  v43 = v62 + 4;
  v66 = *v64;
  v65 = v64[1];
  swift_bridgeObjectRetain(v65);
  v122 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v66, v65, &v118);
  v67 = v123;
  UnsafeMutableRawBufferPointer.copyMemory(from:)(&v122, v123);
  swift_release_n(v63, 2);
  swift_bridgeObjectRelease(v65);
  *(_WORD *)(v62 + 12) = 2082;
  swift_bridgeObjectRetain(j);
  v122 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v24, (unint64_t)j, &v118);
  UnsafeMutableRawBufferPointer.copyMemory(from:)(&v122, v123);
  swift_bridgeObjectRelease_n(j, 3);
  *(_WORD *)(v62 + 22) = 2048;
  swift_beginAccess(&v128, &v122, 0, 0);
  v120 = v128;
  UnsafeMutableRawBufferPointer.copyMemory(from:)(&v120, v121);
  *(_WORD *)(v62 + 32) = 2114;
  v68 = (Swift::UInt *)v112;
  swift_beginAccess(v112, &v120, 0, 0);
  v69 = v111;
  if (*(_QWORD *)(v111 + 16))
  {
    v70 = specialized __RawDictionaryStorage.find<A>(_:)(*v68);
    if ((v71 & 1) != 0)
    {
      v72 = *(_QWORD *)(*(_QWORD *)(v69 + 56) + 16 * v70 + 8);
      swift_bridgeObjectRetain(v72);
      v73 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease(v72);
      v117 = v73;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v117, &v118);
      v74 = v103;
      *v103 = v73;
      swift_bridgeObjectRelease_n(v69, 2);
      v75 = v105;
      _os_log_impl((void *)&_mh_execute_header, v105, (os_log_type_t)v108, "[%s] smsfilter: mainmodel: (%{public}s, %f, %{public}@)", (uint8_t *)v62, 0x2Au);
      v76 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      swift_arrayDestroy(v74, 1, v76);
      swift_slowDealloc(v74, -1, -1);
      v77 = v104;
      swift_arrayDestroy(v104, 2, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v77, -1, -1);
      swift_slowDealloc(v62, -1, -1);

      (*(void (**)(char *, void *))(v109 + 8))(v106, v110);
      goto LABEL_70;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
LABEL_104:
  swift_once(&one-time initialization token for logger, one-time initialization function for logger);
LABEL_89:
  v87 = __swift_project_value_buffer(v62, (uint64_t)logger);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v24 + 16))(v63, v87, v62);
  v18 = v113;
  swift_retain(v113);
  v88 = swift_bridgeObjectRetain(v67);
  v89 = v63;
  j = Logger.logObject.getter(v88);
  v63 = static os_log_type_t.default.getter();
  if (!os_log_type_enabled(j, (os_log_type_t)v63))
  {

    swift_bridgeObjectRelease(v67);
    swift_release(v18);
    (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v89, v62);
LABEL_95:
    v78 = v43;
    goto LABEL_96;
  }
  v90 = swift_slowAlloc(22, -1);
  v105 = (os_log_t)swift_slowAlloc(8, -1);
  v108 = swift_slowAlloc(32, -1);
  v116[0] = v108;
  *(_DWORD *)v90 = 136315394;
  v91 = (uint64_t *)(v18 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__region);
  swift_beginAccess(v18 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__region, &v122, 0, 0);
  outlined init with take of Region?((uint64_t)v91, (uint64_t)v124, &demangling cache variable for type metadata for Region?);
  outlined init with take of Region?((uint64_t)v124, (uint64_t)v125, &demangling cache variable for type metadata for Region?);
  if (_s15extensionFilter6RegionVSgWOg((uint64_t)v125) != 1)
  {
    v93 = *v91;
    v92 = v91[1];
    swift_bridgeObjectRetain(v92);
    v120 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v93, v92, v116);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v120, v121);
    swift_release(v18);
    swift_bridgeObjectRelease(v92);
    *(_WORD *)(v90 + 12) = 2114;
    v94 = (Swift::UInt *)v112;
    swift_beginAccess(v112, &v120, 0, 0);
    v95 = v111;
    if (*(_QWORD *)(v111 + 16))
    {
      v96 = specialized __RawDictionaryStorage.find<A>(_:)(*v94);
      if ((v97 & 1) != 0)
      {
        v98 = *(_QWORD *)(*(_QWORD *)(v95 + 56) + 16 * v96 + 8);
        swift_bridgeObjectRetain(v98);
        v99 = (objc_class *)String._bridgeToObjectiveC()();
        swift_bridgeObjectRelease(v98);
        v114 = v99;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v114, &v115);
        v100 = v105;
        v105->isa = v99;
        swift_bridgeObjectRelease(v95);
        _os_log_impl((void *)&_mh_execute_header, j, (os_log_type_t)v63, "[%s] smsfilter: basicmodel: (%{public}@)", (uint8_t *)v90, 0x16u);
        v101 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
        swift_arrayDestroy(v100, 1, v101);
        swift_slowDealloc(v100, -1, -1);
        v102 = v108;
        swift_arrayDestroy(v108, 1, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v102, -1, -1);
        swift_slowDealloc(v90, -1, -1);

        (*(void (**)(char *, void *))(v109 + 8))(v106, v110);
        goto LABEL_95;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
LABEL_107:
    swift_release(v63);
    swift_bridgeObjectRelease(j);
    swift_bridgeObjectRelease(v111);
    __break(1u);
  }
  swift_release(v18);
  swift_bridgeObjectRelease(v111);
  __break(1u);
}

Swift::String __swiftcall SmsFilter.getRegion()()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  Swift::String result;
  _BYTE v7[24];
  _BYTE v8[128];
  _BYTE v9[128];

  v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__region);
  swift_beginAccess(v0 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__region, v7, 0, 0);
  outlined init with take of Region?((uint64_t)v1, (uint64_t)v8, &demangling cache variable for type metadata for Region?);
  outlined init with take of Region?((uint64_t)v8, (uint64_t)v9, &demangling cache variable for type metadata for Region?);
  v2 = _s15extensionFilter6RegionVSgWOg((uint64_t)v9);
  if ((_DWORD)v2 == 1)
  {
    __break(1u);
  }
  else
  {
    v5 = *v1;
    v4 = (void *)v1[1];
    swift_bridgeObjectRetain(v4);
    v2 = v5;
    v3 = v4;
  }
  result._object = v3;
  result._countAndFlagsBits = v2;
  return result;
}

uint64_t specialized closure #1 in SmsFilter.subClassifyAction(messageBody:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  int64_t v23;
  uint64_t v24;
  int64_t v25;
  double v26;
  Swift::UInt *i;
  unint64_t v28;
  unint64_t v29;
  uint64_t *v30;
  Swift::UInt *v31;
  int64_t v32;
  unint64_t v33;
  int64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  NSObject *v38;
  os_log_type_t v39;
  uint8_t *v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  uint64_t result;
  uint64_t *v47;
  uint64_t v48;
  unint64_t v49;
  uint64_t v50;
  uint64_t v51;
  NSObject *v52;
  uint64_t v53;
  uint64_t *v54;
  unint64_t v55;
  uint64_t v56;
  uint64_t v57;
  unint64_t v58;
  char v59;
  uint64_t v60;
  NSString v61;
  _QWORD *v62;
  os_log_t v63;
  uint64_t v64;
  uint64_t v65;
  _QWORD *v66;
  uint64_t v67;
  os_log_t v68;
  int v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  unint64_t v73;
  char *v74;
  uint64_t *v75;
  uint64_t v76;
  NSString v77;
  uint64_t v78;
  _BYTE v79[16];
  uint64_t v80[3];
  uint64_t v81;
  _BYTE v82[24];
  _BYTE v83[128];
  _BYTE v84[128];
  char v85[32];

  v75 = a4;
  v10 = type metadata accessor for Logger(0);
  v11 = *(_QWORD *)(v10 - 8);
  v12 = __chkstk_darwin(v10);
  v74 = (char *)&v66 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  v15 = (char *)&v66 - v14;
  swift_beginAccess(a1 + 32, v85, 0, 0);
  v16 = *(void **)(a1 + 32);
  if (v16)
  {
    v70 = a1;
    v71 = a5;
    v72 = v5;
    v73 = v11;
    v76 = v10;
    v17 = v16;
    v18 = NLModel.predictedLabelHypotheses(for:maximumCount:)(a2, a3, 1);

    v19 = v18 + 64;
    v20 = 1 << *(_BYTE *)(v18 + 32);
    v21 = -1;
    if (v20 < 64)
      v21 = ~(-1 << v20);
    v22 = v21 & *(_QWORD *)(v18 + 64);
    v23 = (unint64_t)(v20 + 63) >> 6;
    swift_bridgeObjectRetain(v18);
    v24 = 0;
    v25 = 0;
    v26 = 0.0;
    for (i = (Swift::UInt *)0xE000000000000000; ; i = v31)
    {
      if (v22)
      {
        v28 = __clz(__rbit64(v22));
        v22 &= v22 - 1;
        v29 = v28 | (v25 << 6);
      }
      else
      {
        v32 = v25 + 1;
        if (__OFADD__(v25, 1))
        {
          __break(1u);
          goto LABEL_51;
        }
        if (v32 >= v23)
        {
LABEL_22:
          swift_release(v18);
          if (v26 < 0.6)
          {
            v35 = 0;
            v19 = v76;
            v22 = v73;
            v25 = (int64_t)v74;
            goto LABEL_33;
          }
          v19 = v76;
          v22 = v73;
          v25 = (int64_t)v74;
          if (v24 == 0x7265646E696D6552 && i == (Swift::UInt *)0xE900000000000073
            || (_stringCompareWithSmolCheck(_:_:expecting:)(0x7265646E696D6552, 0xE900000000000073, v24, i, 0) & 1) != 0)
          {
            v35 = 10003;
            goto LABEL_33;
          }
          if (v24 == 0x73726564724FLL && i == (Swift::UInt *)0xE600000000000000
            || (_stringCompareWithSmolCheck(_:_:expecting:)(0x73726564724FLL, 0xE600000000000000, v24, i, 0) & 1) != 0)
          {
            v35 = 10002;
            goto LABEL_33;
          }
          if (v24 == 0x65636E616E6946 && i == (Swift::UInt *)0xE700000000000000
            || (_stringCompareWithSmolCheck(_:_:expecting:)(0x65636E616E6946, 0xE700000000000000, v24, i, 0) & 1) != 0)
          {
            v35 = 10001;
            goto LABEL_33;
          }
LABEL_51:
          v35 = 0;
LABEL_33:
          v47 = v75;
          swift_beginAccess(v75, v82, 1, 0);
          *v47 = v35;
          if (one-time initialization token for logger == -1)
            goto LABEL_34;
LABEL_53:
          swift_once(&one-time initialization token for logger, one-time initialization function for logger);
LABEL_34:
          v48 = __swift_project_value_buffer(v19, (uint64_t)logger);
          (*(void (**)(int64_t, uint64_t, uint64_t))(v22 + 16))(v25, v48, v19);
          v49 = v22;
          v43 = v70;
          swift_retain_n(v70, 2);
          v50 = v71;
          swift_bridgeObjectRetain_n(v71, 2);
          v51 = swift_bridgeObjectRetain(i);
          v52 = Logger.logObject.getter(v51);
          v69 = static os_log_type_t.default.getter();
          if (os_log_type_enabled(v52, (os_log_type_t)v69))
          {
            v68 = v52;
            v53 = swift_slowAlloc(42, -1);
            v66 = (_QWORD *)swift_slowAlloc(8, -1);
            v67 = swift_slowAlloc(64, -1);
            v81 = v67;
            *(_DWORD *)v53 = 136315906;
            v54 = (uint64_t *)(v43 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__region);
            swift_beginAccess(v43 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__region, v80, 0, 0);
            outlined init with take of Region?((uint64_t)v54, (uint64_t)v83, &demangling cache variable for type metadata for Region?);
            outlined init with take of Region?((uint64_t)v83, (uint64_t)v84, &demangling cache variable for type metadata for Region?);
            if (_s15extensionFilter6RegionVSgWOg((uint64_t)v84) != 1)
            {
              v56 = *v54;
              v55 = v54[1];
              swift_bridgeObjectRetain(v55);
              v78 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v56, v55, &v81);
              UnsafeMutableRawBufferPointer.copyMemory(from:)(&v78, v79);
              swift_release_n(v43, 2);
              swift_bridgeObjectRelease(v55);
              *(_WORD *)(v53 + 12) = 2082;
              swift_bridgeObjectRetain(i);
              v78 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v24, (unint64_t)i, &v81);
              UnsafeMutableRawBufferPointer.copyMemory(from:)(&v78, v79);
              swift_bridgeObjectRelease_n(i, 3);
              *(_WORD *)(v53 + 22) = 2048;
              v78 = *(_QWORD *)&v26;
              UnsafeMutableRawBufferPointer.copyMemory(from:)(&v78, v79);
              *(_WORD *)(v53 + 32) = 2114;
              i = (Swift::UInt *)v75;
              swift_beginAccess(v75, &v78, 0, 0);
              v57 = v71;
              if (*(_QWORD *)(v71 + 16))
              {
                v58 = specialized __RawDictionaryStorage.find<A>(_:)(*i);
                if ((v59 & 1) != 0)
                {
                  v60 = *(_QWORD *)(*(_QWORD *)(v57 + 56) + 16 * v58 + 8);
                  swift_bridgeObjectRetain(v60);
                  v61 = String._bridgeToObjectiveC()();
                  swift_bridgeObjectRelease(v60);
                  v77 = v61;
                  UnsafeMutableRawBufferPointer.copyMemory(from:)(&v77, &v78);
                  v62 = v66;
                  *v66 = v61;
                  swift_bridgeObjectRelease_n(v57, 2);
                  v63 = v68;
                  _os_log_impl((void *)&_mh_execute_header, v68, (os_log_type_t)v69, "[%s] smsfilter: sub-classification model: (%{public}s, %f, %{public}@)", (uint8_t *)v53, 0x2Au);
                  v64 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
                  swift_arrayDestroy(v62, 1, v64);
                  swift_slowDealloc(v62, -1, -1);
                  v65 = v67;
                  swift_arrayDestroy(v67, 2, (char *)&type metadata for Any + 8);
                  swift_slowDealloc(v65, -1, -1);
                  swift_slowDealloc(v53, -1, -1);

                  (*(void (**)(char *, uint64_t))(v73 + 8))(v74, v76);
                  return swift_bridgeObjectRelease(v18);
                }
              }
              else
              {
                __break(1u);
              }
              __break(1u);
            }
            swift_release(v43);
            swift_bridgeObjectRelease(i);
            swift_bridgeObjectRelease(v71);
            __break(1u);
LABEL_57:
            result = swift_release(v43);
            __break(1u);
          }
          else
          {

            swift_bridgeObjectRelease_n(v50, 2);
            swift_bridgeObjectRelease_n(i, 2);
            swift_release_n(v43, 2);
            (*(void (**)(int64_t, uint64_t))(v49 + 8))(v25, v76);
            return swift_bridgeObjectRelease(v18);
          }
          return result;
        }
        v33 = *(_QWORD *)(v19 + 8 * v32);
        ++v25;
        if (!v33)
        {
          v25 = v32 + 1;
          if (v32 + 1 >= v23)
            goto LABEL_22;
          v33 = *(_QWORD *)(v19 + 8 * v25);
          if (!v33)
          {
            v25 = v32 + 2;
            if (v32 + 2 >= v23)
              goto LABEL_22;
            v33 = *(_QWORD *)(v19 + 8 * v25);
            if (!v33)
            {
              v34 = v32 + 3;
              if (v34 >= v23)
                goto LABEL_22;
              v33 = *(_QWORD *)(v19 + 8 * v34);
              if (!v33)
              {
                while (1)
                {
                  v25 = v34 + 1;
                  if (__OFADD__(v34, 1))
                    break;
                  if (v25 >= v23)
                    goto LABEL_22;
                  v33 = *(_QWORD *)(v19 + 8 * v25);
                  ++v34;
                  if (v33)
                    goto LABEL_21;
                }
                __break(1u);
                goto LABEL_53;
              }
              v25 = v34;
            }
          }
        }
LABEL_21:
        v22 = (v33 - 1) & v33;
        v29 = __clz(__rbit64(v33)) + (v25 << 6);
      }
      v30 = (uint64_t *)(*(_QWORD *)(v18 + 48) + 16 * v29);
      v24 = *v30;
      v31 = (Swift::UInt *)v30[1];
      v26 = *(double *)(*(_QWORD *)(v18 + 56) + 8 * v29);
      swift_bridgeObjectRetain(v31);
      swift_bridgeObjectRelease(i);
    }
  }
  if (one-time initialization token for logger != -1)
    swift_once(&one-time initialization token for logger, one-time initialization function for logger);
  v36 = __swift_project_value_buffer(v10, (uint64_t)logger);
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v15, v36, v10);
  v37 = swift_retain(a1);
  v38 = Logger.logObject.getter(v37);
  v39 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v38, v39))
  {
    v72 = v5;
    v73 = v11;
    v76 = v10;
    v40 = (uint8_t *)swift_slowAlloc(12, -1);
    v41 = swift_slowAlloc(32, -1);
    v80[0] = v41;
    *(_DWORD *)v40 = 136315138;
    v42 = (uint64_t *)(a1 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__region);
    swift_beginAccess(a1 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__region, v82, 0, 0);
    v43 = a1;
    outlined init with take of Region?((uint64_t)v42, (uint64_t)v83, &demangling cache variable for type metadata for Region?);
    outlined init with take of Region?((uint64_t)v83, (uint64_t)v84, &demangling cache variable for type metadata for Region?);
    if (_s15extensionFilter6RegionVSgWOg((uint64_t)v84) == 1)
      goto LABEL_57;
    v44 = *v42;
    v45 = v42[1];
    swift_bridgeObjectRetain(v45);
    v78 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v44, v45, v80);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v78, v79);
    swift_release(a1);
    swift_bridgeObjectRelease(v45);
    _os_log_impl((void *)&_mh_execute_header, v38, v39, "[%s] smsfilter: no active sub-classification-model", v40, 0xCu);
    swift_arrayDestroy(v41, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v41, -1, -1);
    swift_slowDealloc(v40, -1, -1);

    return (*(uint64_t (**)(char *, uint64_t))(v73 + 8))(v15, v76);
  }
  else
  {

    swift_release(a1);
    return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v15, v10);
  }
}

ILMessageFilterCapabilitiesQueryResponse __swiftcall SmsFilter.subClassificationCapabilities()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  objc_class *v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  int v13;
  uint8_t *v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  ILMessageFilterCapabilitiesQueryResponse result;
  uint64_t v19;
  uint64_t v20;
  int v21;
  ILMessageFilterCapabilitiesQueryResponse v22;
  uint64_t v23;
  uint64_t v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;
  _BYTE v28[128];
  _BYTE v29[136];

  v1 = v0;
  v2 = type metadata accessor for Logger(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)&v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = (objc_class *)objc_msgSend(objc_allocWithZone((Class)ILMessageFilterCapabilitiesQueryResponse), "init");
  v7 = v1 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__region;
  swift_beginAccess(v1 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__region, &v27, 0, 0);
  outlined init with take of Region?(v7, (uint64_t)v28, &demangling cache variable for type metadata for Region?);
  outlined init with take of Region?((uint64_t)v28, (uint64_t)v29, &demangling cache variable for type metadata for Region?);
  if (_s15extensionFilter6RegionVSgWOg((uint64_t)v29) == 1)
  {
    __break(1u);
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  if ((*(_BYTE *)(v7 + 104) & 1) != 0)
  {
    outlined init with take of Region?(v7, (uint64_t)v25, &demangling cache variable for type metadata for Region?);
    outlined init with take of Region?((uint64_t)v25, (uint64_t)v26, &demangling cache variable for type metadata for Region?);
    if (_s15extensionFilter6RegionVSgWOg((uint64_t)v26) != 1)
    {
      v8 = *(_QWORD *)(v7 + 8);
      v9 = *(_QWORD *)v7 == 28265 && v8 == 0xE200000000000000;
      if (v9
        || (_stringCompareWithSmolCheck(_:_:expecting:)(*(_QWORD *)v7, v8, 28265, 0xE200000000000000, 0) & 1) != 0)
      {
        ILMessageFilterCapabilitiesQueryResponse.transactionalSubActions.setter(&outlined read-only object #0 of SmsFilter.subClassificationCapabilities());
      }
      return (ILMessageFilterCapabilitiesQueryResponse)v6;
    }
    goto LABEL_18;
  }
  if (one-time initialization token for logger != -1)
    swift_once(&one-time initialization token for logger, one-time initialization function for logger);
  v10 = __swift_project_value_buffer(v2, (uint64_t)logger);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v10, v2);
  v11 = swift_retain(v1);
  v12 = Logger.logObject.getter(v11);
  v13 = static os_log_type_t.error.getter();
  if (!os_log_type_enabled(v12, (os_log_type_t)v13))
  {

    swift_release(v1);
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    return (ILMessageFilterCapabilitiesQueryResponse)v6;
  }
  v21 = v13;
  v22.super.isa = v6;
  v14 = (uint8_t *)swift_slowAlloc(12, -1);
  v20 = swift_slowAlloc(32, -1);
  v24 = v20;
  *(_DWORD *)v14 = 136315138;
  outlined init with take of Region?(v7, (uint64_t)v25, &demangling cache variable for type metadata for Region?);
  outlined init with take of Region?((uint64_t)v25, (uint64_t)v26, &demangling cache variable for type metadata for Region?);
  if (_s15extensionFilter6RegionVSgWOg((uint64_t)v26) != 1)
  {
    v16 = *(_QWORD *)v7;
    v15 = *(_QWORD *)(v7 + 8);
    swift_bridgeObjectRetain(v15);
    v23 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v16, v15, &v24);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v23, &v24);
    swift_release(v1);
    swift_bridgeObjectRelease(v15);
    _os_log_impl((void *)&_mh_execute_header, v12, (os_log_type_t)v21, "smsfilter: sub-classification-model is not available for %s", v14, 0xCu);
    v17 = v20;
    swift_arrayDestroy(v20, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v17, -1, -1);
    swift_slowDealloc(v14, -1, -1);

    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    return v22;
  }
LABEL_19:
  result.super.isa = (Class)swift_release(v1);
  __break(1u);
  return result;
}

uint64_t SmsFilter.deinit()
{
  uint64_t v0;
  _QWORD v2[16];

  swift_release(*(_QWORD *)(v0 + 48));
  swift_release(*(_QWORD *)(v0 + 56));
  outlined consume of SmsFilter._regexSubclassification?(*(_QWORD *)(v0 + 64), *(_QWORD *)(v0 + 72), *(_QWORD *)(v0 + 80));
  outlined destroy of Date?(v0 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__dateCheckpoint);

  swift_release(*(_QWORD *)(v0 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__regionUtils));
  outlined init with take of Region?(v0 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__region, (uint64_t)v2, &demangling cache variable for type metadata for Region?);
  outlined retain of Region?(v2, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))outlined consume of Region?);
  return v0;
}

uint64_t SmsFilter.__deallocating_deinit()
{
  uint64_t v0;

  SmsFilter.deinit();
  return swift_deallocClassInstance(v0, *(unsigned int *)(*(_QWORD *)v0 + 48), *(unsigned __int16 *)(*(_QWORD *)v0 + 52));
}

_QWORD *outlined retain of Region(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v2 = a1[4];
  v3 = a1[7];
  v4 = a1[8];
  v5 = a1[9];
  v6 = a1[14];
  v7 = a1[15];
  swift_bridgeObjectRetain(a1[1]);
  swift_bridgeObjectRetain(v2);
  swift_bridgeObjectRetain(v3);
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRetain(v5);
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRetain(v7);
  return a1;
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  Swift::Int v5;
  _QWORD v7[9];

  Hasher.init(_seed:)(v7, *(_QWORD *)(v2 + 40));
  String.hash(into:)(v7, a1, a2);
  v5 = Hasher._finalize()();
  return specialized __RawDictionaryStorage.find<A>(_:hashValue:)(a1, a2, v5);
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:)(Swift::UInt a1)
{
  uint64_t v1;
  Swift::Int v3;
  _QWORD v5[9];

  Hasher.init(_seed:)(v5, *(_QWORD *)(v1 + 40));
  Hasher._combine(_:)(a1);
  v3 = Hasher._finalize()();
  return specialized __RawDictionaryStorage.find<A>(_:hashValue:)(a1, v3);
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:hashValue:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  BOOL v16;

  v4 = v3 + 64;
  v5 = -1 << *(_BYTE *)(v3 + 32);
  v6 = a3 & ~v5;
  if (((*(_QWORD *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0)
  {
    v9 = *(_QWORD *)(v3 + 48);
    v10 = (_QWORD *)(v9 + 16 * v6);
    v11 = v10[1];
    v12 = *v10 == a1 && v11 == a2;
    if (!v12 && (_stringCompareWithSmolCheck(_:_:expecting:)(*v10, v11, a1, a2, 0) & 1) == 0)
    {
      v13 = ~v5;
      do
      {
        v6 = (v6 + 1) & v13;
        if (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
          break;
        v14 = (_QWORD *)(v9 + 16 * v6);
        v15 = v14[1];
        v16 = *v14 == a1 && v15 == a2;
      }
      while (!v16 && (_stringCompareWithSmolCheck(_:_:expecting:)(*v14, v15, a1, a2, 0) & 1) == 0);
    }
  }
  return v6;
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:hashValue:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  unint64_t result;
  uint64_t v7;
  uint64_t v8;

  v4 = v2 + 64;
  v5 = -1 << *(_BYTE *)(v2 + 32);
  result = a2 & ~v5;
  if (((*(_QWORD *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0)
  {
    v7 = *(_QWORD *)(v2 + 48);
    if (*(_QWORD *)(v7 + 8 * result) != a1)
    {
      v8 = ~v5;
      for (result = (result + 1) & v8;
            ((*(_QWORD *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            result = (result + 1) & v8)
      {
        if (*(_QWORD *)(v7 + 8 * result) == a1)
          break;
      }
    }
  }
  return result;
}

void *specialized Set.init(_nonEmptyArrayLiteral:)(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  void (*v25)(char *, uint64_t);
  void *result;
  uint64_t v27;
  BOOL v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void (*v34)(char *, uint64_t, uint64_t);
  uint64_t v35;

  v2 = type metadata accessor for Calendar.Component(0);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = __chkstk_darwin(v2);
  v6 = (char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  v8 = (char *)&v30 - v7;
  v9 = *(_QWORD *)(a1 + 16);
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _SetStorage<Calendar.Component>);
    v10 = static _SetStorage.allocate(capacity:)(v9);
    v11 = 0;
    v12 = *(unsigned __int8 *)(v3 + 80);
    v31 = v9;
    v32 = a1 + ((v12 + 32) & ~v12);
    v13 = *(_QWORD *)(v3 + 72);
    v34 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
    v35 = v10 + 56;
    while (1)
    {
      v33 = v11;
      v34(v8, v32 + v13 * v11, v2);
      v14 = *(_QWORD *)(v10 + 40);
      v15 = lazy protocol witness table accessor for type Calendar.Component and conformance Calendar.Component(&lazy protocol witness table cache variable for type Calendar.Component and conformance Calendar.Component, (uint64_t)&protocol conformance descriptor for Calendar.Component);
      v16 = dispatch thunk of Hashable._rawHashValue(seed:)(v14, v2, v15);
      v17 = ~(-1 << *(_BYTE *)(v10 + 32));
      v18 = v16 & v17;
      v19 = (v16 & (unint64_t)v17) >> 6;
      v20 = *(_QWORD *)(v35 + 8 * v19);
      v21 = 1 << (v16 & v17);
      if ((v21 & v20) != 0)
      {
        do
        {
          v34(v6, *(_QWORD *)(v10 + 48) + v18 * v13, v2);
          v22 = lazy protocol witness table accessor for type Calendar.Component and conformance Calendar.Component(&lazy protocol witness table cache variable for type Calendar.Component and conformance Calendar.Component, (uint64_t)&protocol conformance descriptor for Calendar.Component);
          v23 = dispatch thunk of static Equatable.== infix(_:_:)(v6, v8, v2, v22);
          v24 = v3;
          v25 = *(void (**)(char *, uint64_t))(v3 + 8);
          v25(v6, v2);
          if ((v23 & 1) != 0)
          {
            v25(v8, v2);
            v3 = v24;
            v9 = v31;
            goto LABEL_4;
          }
          v18 = (v18 + 1) & v17;
          v19 = v18 >> 6;
          v20 = *(_QWORD *)(v35 + 8 * (v18 >> 6));
          v21 = 1 << v18;
          v3 = v24;
        }
        while ((v20 & (1 << v18)) != 0);
        v9 = v31;
      }
      *(_QWORD *)(v35 + 8 * v19) = v21 | v20;
      result = (void *)(*(uint64_t (**)(unint64_t, char *, uint64_t))(v3 + 32))(*(_QWORD *)(v10 + 48) + v18 * v13, v8, v2);
      v27 = *(_QWORD *)(v10 + 16);
      v28 = __OFADD__(v27, 1);
      v29 = v27 + 1;
      if (v28)
        break;
      *(_QWORD *)(v10 + 16) = v29;
LABEL_4:
      v11 = v33 + 1;
      if (v33 + 1 == v9)
        return (void *)v10;
    }
    __break(1u);
  }
  else
  {
    return &_swiftEmptySetSingleton;
  }
  return result;
}

unint64_t specialized Dictionary.init(dictionaryLiteral:)(_QWORD *a1, uint64_t *a2)
{
  uint64_t v2;
  _QWORD *v4;
  Swift::UInt v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t result;
  char v9;
  uint64_t *v10;
  _QWORD *v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v2 = a1[2];
  if (!v2)
    return (unint64_t)&_swiftEmptyDictionarySingleton;
  __swift_instantiateConcreteTypeFromMangledName(a2);
  v4 = (_QWORD *)static _DictionaryStorage.allocate(capacity:)(v2);
  v5 = a1[4];
  v6 = a1[5];
  v7 = a1[6];
  result = specialized __RawDictionaryStorage.find<A>(_:)(v5);
  if ((v9 & 1) != 0)
  {
LABEL_7:
    __break(1u);
LABEL_8:
    swift_bridgeObjectRetain(v7);
    return (unint64_t)v4;
  }
  v10 = a1 + 9;
  while (1)
  {
    *(_QWORD *)((char *)v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    *(_QWORD *)(v4[6] + 8 * result) = v5;
    v11 = (_QWORD *)(v4[7] + 16 * result);
    *v11 = v6;
    v11[1] = v7;
    v12 = v4[2];
    v13 = __OFADD__(v12, 1);
    v14 = v12 + 1;
    if (v13)
      break;
    v4[2] = v14;
    if (!--v2)
      goto LABEL_8;
    v15 = v10 + 3;
    v5 = *(v10 - 2);
    v6 = *(v10 - 1);
    v16 = *v10;
    swift_bridgeObjectRetain(v7);
    result = specialized __RawDictionaryStorage.find<A>(_:)(v5);
    v10 = v15;
    v7 = v16;
    if ((v17 & 1) != 0)
      goto LABEL_7;
  }
  __break(1u);
  return result;
}

uint64_t outlined destroy of Date?(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t ObjC metadata update function for SmsFilter()
{
  return type metadata accessor for SmsFilter(0);
}

uint64_t type metadata accessor for SmsFilter(uint64_t a1)
{
  uint64_t result;

  result = type metadata singleton initialization cache for SmsFilter;
  if (!type metadata singleton initialization cache for SmsFilter)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for SmsFilter);
  return result;
}

void type metadata completion function for SmsFilter(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  _QWORD v4[15];

  v4[0] = "\b";
  v4[1] = "\b";
  v4[2] = "\b";
  v4[3] = &unk_100019ED0;
  v4[4] = &unk_100019ED0;
  v4[5] = "\b";
  v4[6] = "\b";
  v4[7] = &unk_100019EE8;
  type metadata accessor for Date?(319);
  if (v3 <= 0x3F)
  {
    v4[8] = *(_QWORD *)(v2 - 8) + 64;
    v4[9] = "\b";
    v4[10] = "\b";
    v4[11] = &unk_100019F00;
    v4[12] = (char *)&value witness table for Builtin.Int64 + 64;
    v4[13] = (char *)&value witness table for Builtin.Int64 + 64;
    v4[14] = (char *)&value witness table for Builtin.Int64 + 64;
    swift_updateClassMetadata2(a1, 256, 15, v4, a1 + 80);
  }
}

void type metadata accessor for Date?(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;

  if (!lazy cache variable for type metadata for Date?)
  {
    v2 = type metadata accessor for Date(255);
    v3 = type metadata accessor for Optional(a1, v2);
    if (!v4)
      atomic_store(v3, (unint64_t *)&lazy cache variable for type metadata for Date?);
  }
}

uint64_t destroy for SmsFilter._regexSubclassification(_QWORD *a1)
{
  swift_release(*a1);
  swift_release(a1[1]);
  return swift_release(a1[2]);
}

uint64_t *initializeBufferWithCopyOfBuffer for SmsFilter._regexSubclassification(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *a2;
  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  v5 = a2[2];
  a1[2] = v5;
  swift_retain(v3);
  swift_retain(v4);
  swift_retain(v5);
  return a1;
}

uint64_t *assignWithCopy for SmsFilter._regexSubclassification(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v4 = *a1;
  v5 = *a2;
  *a1 = *a2;
  swift_retain(v5);
  swift_release(v4);
  v6 = a1[1];
  v7 = a2[1];
  a1[1] = v7;
  swift_retain(v7);
  swift_release(v6);
  v8 = a1[2];
  v9 = a2[2];
  a1[2] = v9;
  swift_retain(v9);
  swift_release(v8);
  return a1;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

_QWORD *assignWithTake for SmsFilter._regexSubclassification(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  swift_release(*a1);
  v4 = a1[1];
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release(v4);
  v5 = a1[2];
  a1[2] = *(_QWORD *)(a2 + 16);
  swift_release(v5);
  return a1;
}

uint64_t getEnumTagSinglePayload for SmsFilter._regexSubclassification(uint64_t *a1, unsigned int a2)
{
  uint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *((_BYTE *)a1 + 24))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for SmsFilter._regexSubclassification(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 24) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 24) = 0;
    if (a2)
      *(_QWORD *)result = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for SmsFilter._regexSubclassification()
{
  return &type metadata for SmsFilter._regexSubclassification;
}

ValueMetadata *type metadata accessor for SmsFilter.SubClasses()
{
  return &type metadata for SmsFilter.SubClasses;
}

uint64_t lazy protocol witness table accessor for type Calendar.Component and conformance Calendar.Component(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = type metadata accessor for Calendar.Component(255);
    result = swift_getWitnessTable(a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t outlined init with take of Region?(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t outlined consume of Regex?(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (result)
  {
    swift_bridgeObjectRelease(result);
    swift_bridgeObjectRelease(a2);
    swift_bridgeObjectRelease(a3);
    swift_bridgeObjectRelease(a4);
    return swift_bridgeObjectRelease(a5);
  }
  return result;
}

uint64_t logger.unsafeMutableAddressor()
{
  uint64_t v0;

  if (one-time initialization token for logger != -1)
    swift_once(&one-time initialization token for logger, one-time initialization function for logger);
  v0 = type metadata accessor for Logger(0);
  return __swift_project_value_buffer(v0, (uint64_t)logger);
}

void one-time initialization function for smsfilterVersion()
{
  smsfilterVersion._countAndFlagsBits = 0x322E302E3631;
  smsfilterVersion._object = (void *)0xE600000000000000;
}

Swift::String *smsfilterVersion.unsafeMutableAddressor()
{
  if (one-time initialization token for smsfilterVersion != -1)
    swift_once(&one-time initialization token for smsfilterVersion, one-time initialization function for smsfilterVersion);
  return &smsfilterVersion;
}

uint64_t one-time initialization function for logger()
{
  uint64_t v0;

  v0 = type metadata accessor for Logger(0);
  __swift_allocate_value_buffer(v0, logger);
  __swift_project_value_buffer(v0, (uint64_t)logger);
  return Logger.init(subsystem:category:)(0xD000000000000013, 0x800000010001C170, 0x65746C6966736D73, 0xE900000000000072);
}

uint64_t *__swift_allocate_value_buffer(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(a1 - 8);
  if ((*(_DWORD *)(v3 + 80) & 0x20000) != 0)
  {
    v4 = swift_slowAlloc(*(_QWORD *)(v3 + 64), *(_DWORD *)(v3 + 80));
    *a2 = v4;
    return (uint64_t *)v4;
  }
  return a2;
}

uint64_t RegexFilter.__allocating_init()()
{
  uint64_t v0;
  uint64_t v1;

  v1 = swift_allocObject(v0, 32, 7);
  RegexFilter.init()();
  return v1;
}

Swift::Void __swiftcall RegexFilter.initRegexTemplates(initTemplateList:)(Swift::OpaquePointer initTemplateList)
{
  uint64_t v1;
  char **v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t *v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v15;
  unint64_t v16;
  char *v17;
  void *rawValue;
  _BYTE v19[24];
  _BYTE v20[24];

  v3 = (char **)(v1 + 16);
  swift_beginAccess(v1 + 16, v20, 1, 0);
  v4 = *(_QWORD *)(v1 + 16);
  *(_QWORD *)(v1 + 16) = _swiftEmptyArrayStorage;
  swift_bridgeObjectRelease(v4);
  v5 = *((_QWORD *)initTemplateList._rawValue + 2);
  if (v5)
  {
    swift_bridgeObjectRetain(initTemplateList._rawValue);
    rawValue = initTemplateList._rawValue;
    v6 = (unint64_t *)((char *)initTemplateList._rawValue + 40);
    do
    {
      v8 = *(v6 - 1);
      v7 = *v6;
      swift_bridgeObjectRetain(*v6);
      RegexFilter.replaceText(pattern:input:options:)(0x2D417A2D615B245CLL, 0xED0000245C2A5D5ALL, v8, v7, 16);
      v10 = v9;
      v12 = v11;
      swift_beginAccess(v1 + 16, v19, 33, 0);
      v13 = *(char **)(v1 + 16);
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v13);
      *(_QWORD *)(v1 + 16) = v13;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        v13 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *((_QWORD *)v13 + 2) + 1, 1, v13);
        *v3 = v13;
      }
      v16 = *((_QWORD *)v13 + 2);
      v15 = *((_QWORD *)v13 + 3);
      if (v16 >= v15 >> 1)
      {
        v13 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v15 > 1), v16 + 1, 1, v13);
        *v3 = v13;
      }
      v6 += 2;
      *((_QWORD *)v13 + 2) = v16 + 1;
      v17 = &v13[16 * v16];
      *((_QWORD *)v17 + 4) = v10;
      *((_QWORD *)v17 + 5) = v12;
      swift_endAccess(v19);
      swift_bridgeObjectRelease(v7);
      --v5;
    }
    while (v5);
    swift_bridgeObjectRelease(rawValue);
  }
}

Swift::Bool __swiftcall RegexFilter.isMessageInRegexList(message:)(Swift::String message)
{
  uint64_t v1;
  uint64_t countAndFlagsBits;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  char v16;
  char v17;
  Swift::Bool v18;
  uint64_t v20;
  uint64_t v21;
  void *object;
  _QWORD v23[4];
  _BYTE v24[24];

  object = message._object;
  countAndFlagsBits = message._countAndFlagsBits;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Locale?);
  __chkstk_darwin(v3);
  v5 = (char *)&v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess(v1 + 16, v24, 0, 0);
  v6 = *(_QWORD *)(v1 + 16);
  v7 = *(_QWORD *)(v6 + 16);
  if (!v7)
    return 0;
  v8 = type metadata accessor for Locale(0);
  v9 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56);
  swift_bridgeObjectRetain(v6);
  v10 = v7 - 1;
  v21 = v6;
  v11 = (uint64_t *)(v6 + 40);
  do
  {
    v12 = v10;
    v13 = *(v11 - 1);
    v14 = *v11;
    v23[2] = countAndFlagsBits;
    v23[3] = object;
    v23[0] = v13;
    v23[1] = v14;
    v9(v5, 1, 1, v8);
    v15 = lazy protocol witness table accessor for type String and conformance String();
    swift_bridgeObjectRetain(v14);
    StringProtocol.range<A>(of:options:range:locale:)(v23, 1024, 0, 0, 1, v5, &type metadata for String, &type metadata for String, v15, v15);
    v17 = v16;
    v18 = (v16 & 1) == 0;
    outlined destroy of Locale?((uint64_t)v5);
    swift_bridgeObjectRelease(v14);
    if ((v17 & 1) == 0)
      break;
    v10 = v12 - 1;
    v11 += 2;
  }
  while (v12);
  swift_bridgeObjectRelease(v21);
  return v18;
}

uint64_t RegexFilter.templateRegexList.getter()
{
  uint64_t v0;
  _BYTE v2[24];

  swift_beginAccess(v0 + 16, v2, 0, 0);
  return swift_bridgeObjectRetain(*(_QWORD *)(v0 + 16));
}

uint64_t RegexFilter.templateRegexList.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  _BYTE v5[24];

  swift_beginAccess(v1 + 16, v5, 1, 0);
  v3 = *(_QWORD *)(v1 + 16);
  *(_QWORD *)(v1 + 16) = a1;
  return swift_bridgeObjectRelease(v3);
}

uint64_t RegexFilter.regexDict.getter()
{
  uint64_t v0;

  return swift_bridgeObjectRetain(*(_QWORD *)(v0 + 24));
}

uint64_t RegexFilter.init()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t inited;
  uint64_t v4;

  *(_QWORD *)(v0 + 16) = &_swiftEmptyArrayStorage;
  v1 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(String, String)>);
  inited = swift_initStackObject(v1, &v4);
  *(_OWORD *)(inited + 16) = xmmword_100019B50;
  *(_QWORD *)(inited + 32) = 0x246574614424;
  *(_QWORD *)(inited + 40) = 0xE600000000000000;
  *(_QWORD *)(inited + 48) = 0xD0000000000000B0;
  *(_QWORD *)(inited + 56) = 0x800000010001B9F0;
  *(_QWORD *)(inited + 64) = 0x746E756F63634124;
  *(_QWORD *)(inited + 72) = 0xEF247265626D754ELL;
  *(_QWORD *)(inited + 80) = 0xD00000000000005CLL;
  *(_QWORD *)(inited + 88) = 0x800000010001BAB0;
  strcpy((char *)(inited + 96), "$PhoneNumber$");
  *(_WORD *)(inited + 110) = -4864;
  *(_QWORD *)(inited + 112) = 0xD000000000000068;
  *(_QWORD *)(inited + 120) = 0x800000010001BB10;
  *(_QWORD *)(inited + 128) = 0x24746E756F6D4124;
  *(_QWORD *)(inited + 136) = 0xE800000000000000;
  *(_QWORD *)(inited + 144) = 0x100000000000004ALL;
  *(_QWORD *)(inited + 152) = 0x800000010001BB80;
  *(_QWORD *)(inited + 160) = 0x244C525524;
  *(_QWORD *)(inited + 168) = 0xE500000000000000;
  *(_QWORD *)(inited + 176) = 0xD0000000000000C1;
  *(_QWORD *)(inited + 184) = 0x800000010001BBD0;
  *(_QWORD *)(v0 + 24) = specialized Dictionary.init(dictionaryLiteral:)(inited);
  return v0;
}

void RegexFilter.replaceText(pattern:input:options:)(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5)
{
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  unint64_t v21;
  NSString v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void (*v27)(void *, uint64_t, uint64_t);
  char *v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  char v48;
  uint64_t *v49;
  uint64_t v50;
  unint64_t v51;
  uint64_t v52;
  NSString v53;
  NSString v54;
  id v55;
  unint64_t v56;
  unint64_t v57;
  uint64_t v58;
  BOOL v59;
  uint64_t v60;
  void (*v61)(void *, uint64_t, uint64_t);
  void *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t aBlock;
  uint64_t v68;
  void (*v69)(uint64_t, void *, uint64_t, uint64_t);
  void *v70;
  uint64_t (*v71)();
  uint64_t v72;
  _QWORD v73[3];
  char *v74;

  v74 = (char *)&_swiftEmptyArrayStorage;
  objc_allocWithZone((Class)NSRegularExpression);
  swift_bridgeObjectRetain(a2);
  v10 = @nonobjc NSRegularExpression.init(pattern:options:)(a1, a2, a5);
  v11 = HIBYTE(a4) & 0xF;
  if ((a4 & 0x2000000000000000) == 0)
    v11 = a3;
  v12 = 7;
  if (((a4 >> 60) & ((a3 & 0x800000000000000) == 0)) != 0)
    v12 = 11;
  aBlock = 15;
  v68 = v12 | (v11 << 16);
  v73[0] = a3;
  v73[1] = a4;
  swift_bridgeObjectRetain(a4);
  v13 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Range<String.Index>);
  v14 = lazy protocol witness table accessor for type Range<String.Index> and conformance Range<A>();
  v15 = lazy protocol witness table accessor for type String and conformance String();
  v16 = _NSRange.init<A, B>(_:in:)(&aBlock, v73, v13, &type metadata for String, v14, v15);
  if (v10)
  {
    v18 = v16;
    v19 = v17;
    v20 = v10;
    v21 = a4;
    v22 = String._bridgeToObjectiveC()();
    v23 = swift_allocObject(&unk_100020FE8, 24, 7);
    *(_QWORD *)(v23 + 16) = &v74;
    v24 = swift_allocObject(&unk_100021010, 32, 7);
    *(_QWORD *)(v24 + 16) = partial apply for closure #1 in RegexFilter.replaceText(pattern:input:options:);
    *(_QWORD *)(v24 + 24) = v23;
    v63 = v23;
    v71 = partial apply for thunk for @callee_guaranteed (@guaranteed NSTextCheckingResult?, @unowned NSMatchingFlags, @unowned UnsafeMutablePointer<ObjCBool>) -> ();
    v72 = v24;
    aBlock = (uint64_t)_NSConcreteStackBlock;
    v68 = 1107296256;
    v69 = thunk for @escaping @callee_guaranteed (@guaranteed NSTextCheckingResult?, @unowned NSMatchingFlags, @unowned UnsafeMutablePointer<ObjCBool>) -> ();
    v70 = &block_descriptor;
    v25 = _Block_copy(&aBlock);
    v26 = v72;
    swift_retain(v24);
    swift_release(v26);
    objc_msgSend(v20, "enumerateMatchesInString:options:range:usingBlock:", v22, 0, v18, v19, v25);

    _Block_release(v25);
    LOBYTE(v18) = swift_isEscapingClosureAtFileLocation(v24, "", 107, 55, 79, 1);
    swift_release(v24);
    if ((v18 & 1) != 0)
    {
LABEL_31:
      __break(1u);
LABEL_32:
      __break(1u);
      return;
    }
    v27 = partial apply for closure #1 in RegexFilter.replaceText(pattern:input:options:);
    v28 = v74;
    a4 = v21;
    v29 = *((_QWORD *)v74 + 2);
    if (v29)
    {
LABEL_8:
      v61 = v27;
      v62 = v10;
      v64 = v29 - 1;
      swift_bridgeObjectRetain(a4);
      v30 = 0;
      v31 = 0;
      v32 = 0;
      while (1)
      {
        v33 = *(_QWORD *)&v28[v30 + 32];
        v34 = v33 + v32;
        if (__OFADD__(v33, v32))
          break;
        v35 = *(_QWORD *)&v28[v30 + 40];
        v36 = Range<>.init(_:in:)(v33 + v32, v35, a3, a4);
        if ((v38 & 1) != 0)
          goto LABEL_32;
        v39 = a4;
        v40 = String.subscript.getter(v36, v37, a3, a4);
        v42 = v41;
        v43 = static String._fromSubstring(_:)(v40);
        v45 = v44;
        swift_bridgeObjectRelease(v42);
        v46 = *(_QWORD *)(v65 + 24);
        v66 = v32;
        if (*(_QWORD *)(v46 + 16))
        {
          swift_bridgeObjectRetain(v45);
          v47 = specialized __RawDictionaryStorage.find<A>(_:)(v43, v45);
          if ((v48 & 1) != 0)
          {
            v49 = (uint64_t *)(*(_QWORD *)(v46 + 56) + 16 * v47);
            v50 = *v49;
            v51 = v49[1];
            swift_bridgeObjectRetain(v51);
          }
          else
          {
            v50 = 0;
            v51 = 0xE000000000000000;
          }
          swift_bridgeObjectRelease(v45);
        }
        else
        {
          v50 = 0;
          v51 = 0xE000000000000000;
        }
        swift_bridgeObjectRelease(v45);
        v52 = String.count.getter(v50, v51);
        v53 = String._bridgeToObjectiveC()();
        swift_bridgeObjectRelease(v39);
        v54 = String._bridgeToObjectiveC()();
        swift_bridgeObjectRelease(v51);
        v55 = objc_msgSend(v53, "stringByReplacingCharactersInRange:withString:", v34, v35, v54);

        a3 = static String._unconditionallyBridgeFromObjectiveC(_:)(v55);
        a4 = v56;

        v28 = v74;
        v57 = *((_QWORD *)v74 + 2);
        if (v31 >= v57)
          goto LABEL_28;
        v58 = *(_QWORD *)&v74[v30 + 40];
        v59 = __OFSUB__(v52, v58);
        v60 = v52 - v58;
        if (v59)
          goto LABEL_29;
        v32 = v66 + v60;
        if (__OFADD__(v66, v60))
          goto LABEL_30;
        if (v64 == v31)
          goto LABEL_23;
        ++v31;
        v30 += 16;
        if (v31 >= v57)
        {
          __break(1u);
LABEL_23:

          v27 = v61;
          goto LABEL_26;
        }
      }
      __break(1u);
LABEL_28:
      __break(1u);
LABEL_29:
      __break(1u);
LABEL_30:
      __break(1u);
      goto LABEL_31;
    }
  }
  else
  {
    v27 = 0;
    v63 = 0;
    v28 = (char *)&_swiftEmptyArrayStorage;
    v29 = *((_QWORD *)&_swiftEmptyArrayStorage + 2);
    if (v29)
      goto LABEL_8;
  }

  swift_bridgeObjectRetain(a4);
LABEL_26:
  swift_bridgeObjectRelease(v74);
  outlined consume of (@escaping @callee_guaranteed (@guaranteed NSTextCheckingResult?, @unowned NSMatchingFlags, @unowned UnsafeMutablePointer<ObjCBool>) -> ())?((uint64_t)v27, v63);
}

void closure #1 in RegexFilter.replaceText(pattern:input:options:)(void *a1, uint64_t a2, uint64_t a3, char **a4)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v10;
  unint64_t v11;
  char *v12;
  id v13;

  if (a1)
  {
    v13 = a1;
    v5 = objc_msgSend(v13, "range");
    v7 = v6;
    v8 = *a4;
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*a4);
    *a4 = v8;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      v8 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *((_QWORD *)v8 + 2) + 1, 1, v8);
      *a4 = v8;
    }
    v11 = *((_QWORD *)v8 + 2);
    v10 = *((_QWORD *)v8 + 3);
    if (v11 >= v10 >> 1)
      v8 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v10 > 1), v11 + 1, 1, v8);
    *((_QWORD *)v8 + 2) = v11 + 1;
    v12 = &v8[16 * v11];
    *((_QWORD *)v12 + 4) = v5;
    *((_QWORD *)v12 + 5) = v7;
    *a4 = v8;

  }
}

void thunk for @escaping @callee_guaranteed (@guaranteed NSTextCheckingResult?, @unowned NSMatchingFlags, @unowned UnsafeMutablePointer<ObjCBool>) -> ()(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  void (*v7)(void *, uint64_t, uint64_t);
  id v8;

  v7 = *(void (**)(void *, uint64_t, uint64_t))(a1 + 32);
  v8 = a2;
  v7(a2, a3, a4);

}

uint64_t RegexFilter.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 16));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 24));
  return v0;
}

uint64_t RegexFilter.__deallocating_deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 16));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 24));
  return swift_deallocClassInstance(v0, 32, 7);
}

Swift::Void __swiftcall testRegexTemplate()()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  unint64_t *inited;
  _QWORD *rawValue;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  Swift::String v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t *v12;
  void *v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  char v23;
  uint64_t v24;
  Swift::String v25;
  unint64_t v26;
  unint64_t *v27;
  unint64_t v28;
  _QWORD *v29;
  unint64_t v30;
  __int128 v31;
  char *v32;
  unint64_t *v33;
  uint64_t v34;
  unint64_t v35;
  unint64_t v36;
  _QWORD v37[2];
  unint64_t v38;
  unint64_t v39;
  char v40[24];
  char v41[40];

  v0 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Locale?);
  __chkstk_darwin(v0);
  v2 = (char *)&v27 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = type metadata accessor for RegexFilter();
  inited = (unint64_t *)swift_initStackObject(v3, v41);
  RegexFilter.init()();
  if (one-time initialization token for templateTestRegexList != -1)
    goto LABEL_19;
  while (1)
  {
    RegexFilter.initRegexTemplates(initTemplateList:)(templateTestRegexList);
    if (one-time initialization token for inputSmsList != -1)
      swift_once(&one-time initialization token for inputSmsList, one-time initialization function for inputSmsList);
    rawValue = inputSmsList._rawValue;
    v34 = *((_QWORD *)inputSmsList._rawValue + 2);
    if (!v34)
      break;
    v27 = inited;
    inited += 2;
    v32 = (char *)inputSmsList._rawValue + 32;
    swift_bridgeObjectRetain(inputSmsList._rawValue);
    v33 = inited;
    swift_beginAccess(inited, v40, 0, 0);
    v6 = 0;
    v31 = xmmword_100019D50;
    v30 = 0x800000010001C190;
    v28 = 0x800000010001C1C0;
    v29 = rawValue;
    while (v6 < rawValue[2])
    {
      v12 = (uint64_t *)&v32[16 * v6];
      v14 = *v12;
      v13 = (void *)v12[1];
      v15 = *v33;
      v16 = *(_QWORD *)(*v33 + 16);
      if (v16)
      {
        v36 = v6;
        v17 = type metadata accessor for Locale(0);
        v18 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 56);
        swift_bridgeObjectRetain(v13);
        swift_bridgeObjectRetain(v15);
        v35 = v15;
        v19 = (uint64_t *)(v15 + 40);
        do
        {
          v20 = *(v19 - 1);
          v21 = *v19;
          v38 = v14;
          v39 = (unint64_t)v13;
          v37[0] = v20;
          v37[1] = v21;
          v18(v2, 1, 1, v17);
          v22 = lazy protocol witness table accessor for type String and conformance String();
          swift_bridgeObjectRetain(v21);
          StringProtocol.range<A>(of:options:range:locale:)(v37, 1024, 0, 0, 1, v2, &type metadata for String, &type metadata for String, v22, v22);
          LOBYTE(v22) = v23;
          outlined destroy of Locale?((uint64_t)v2);
          swift_bridgeObjectRelease(v21);
          if ((v22 & 1) == 0)
          {
            swift_bridgeObjectRelease(v35);
            v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Any>);
            v8 = swift_allocObject(v7, 64, 7);
            *(_OWORD *)(v8 + 16) = v31;
            v38 = 0;
            v39 = 0xE000000000000000;
            inited = &v38;
            _StringGuts.grow(_:)(27);
            swift_bridgeObjectRelease(v39);
            v38 = 0xD000000000000019;
            v39 = v28;
            v9._countAndFlagsBits = v14;
            v9._object = v13;
            String.append(_:)(v9);
            swift_bridgeObjectRelease(v13);
            v11 = v38;
            v10 = v39;
            *(_QWORD *)(v8 + 56) = &type metadata for String;
            *(_QWORD *)(v8 + 32) = v11;
            rawValue = v29;
            v6 = v36;
            goto LABEL_7;
          }
          v19 += 2;
          --v16;
        }
        while (v16);
        swift_bridgeObjectRelease(v35);
        rawValue = v29;
        v6 = v36;
      }
      else
      {
        swift_bridgeObjectRetain(v13);
      }
      v24 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Any>);
      v8 = swift_allocObject(v24, 64, 7);
      *(_OWORD *)(v8 + 16) = v31;
      v38 = 0;
      v39 = 0xE000000000000000;
      inited = &v38;
      _StringGuts.grow(_:)(35);
      swift_bridgeObjectRelease(v39);
      v38 = 0xD000000000000021;
      v39 = v30;
      v25._countAndFlagsBits = v14;
      v25._object = v13;
      String.append(_:)(v25);
      swift_bridgeObjectRelease(v13);
      v26 = v38;
      v10 = v39;
      *(_QWORD *)(v8 + 56) = &type metadata for String;
      *(_QWORD *)(v8 + 32) = v26;
LABEL_7:
      ++v6;
      *(_QWORD *)(v8 + 40) = v10;
      print(_:separator:terminator:)(v8, 32, 0xE100000000000000, 10, 0xE100000000000000);
      swift_bridgeObjectRelease(v8);
      if (v6 == v34)
      {
        swift_release(v27);
        swift_bridgeObjectRelease(rawValue);
        return;
      }
    }
    __break(1u);
LABEL_19:
    swift_once(&one-time initialization token for templateTestRegexList, one-time initialization function for templateTestRegexList);
  }
  swift_release(inited);
}

id @nonobjc NSRegularExpression.init(pattern:options:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  NSString v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v12;

  v6 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a2);
  v12 = 0;
  v7 = objc_msgSend(v3, "initWithPattern:options:error:", v6, a3, &v12);

  v8 = v12;
  if (v7)
  {
    v9 = v12;
  }
  else
  {
    v10 = v12;
    _convertNSErrorToError(_:)(v8);

    swift_willThrow();
  }
  return v7;
}

uint64_t type metadata accessor for RegexFilter()
{
  return objc_opt_self(_TtC15extensionFilter11RegexFilter);
}

unint64_t lazy protocol witness table accessor for type Range<String.Index> and conformance Range<A>()
{
  unint64_t result;
  uint64_t v1;

  result = lazy protocol witness table cache variable for type Range<String.Index> and conformance Range<A>;
  if (!lazy protocol witness table cache variable for type Range<String.Index> and conformance Range<A>)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for Range<String.Index>);
    result = swift_getWitnessTable(&protocol conformance descriptor for Range<A>, v1);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Range<String.Index> and conformance Range<A>);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = swift_getTypeByMangledNameInContextInMetadataState2(255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t outlined consume of (@escaping @callee_guaranteed (@guaranteed NSTextCheckingResult?, @unowned NSMatchingFlags, @unowned UnsafeMutablePointer<ObjCBool>) -> ())?(uint64_t result, uint64_t a2)
{
  if (result)
    return swift_release(a2);
  return result;
}

uint64_t sub_10000FE90()
{
  uint64_t v0;

  return swift_deallocObject(v0, 24, 7);
}

void partial apply for closure #1 in RegexFilter.replaceText(pattern:input:options:)(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  closure #1 in RegexFilter.replaceText(pattern:input:options:)(a1, a2, a3, *(char ***)(v3 + 16));
}

uint64_t sub_10000FEA8()
{
  uint64_t v0;

  return swift_deallocObject(v0, 32, 7);
}

uint64_t partial apply for thunk for @callee_guaranteed (@guaranteed NSTextCheckingResult?, @unowned NSMatchingFlags, @unowned UnsafeMutablePointer<ObjCBool>) -> ()()
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
  return swift_retain(v2);
}

uint64_t block_destroy_helper(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

extensionFilter::Region::CodingKeys_optional __swiftcall Region.CodingKeys.init(intValue:)(Swift::Int intValue)
{
  return (extensionFilter::Region::CodingKeys_optional)14;
}

uint64_t Region.TrialParams.CodingKeys.intValue.getter()
{
  return 0;
}

uint64_t Region.CodingKeys.rawValue.getter(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_10000FF40 + 4 * byte_100019F90[a1]))(0xD000000000000013, 0x800000010001B6D0);
}

uint64_t sub_10000FF40()
{
  return 0x614E6E6F69676552;
}

uint64_t sub_10000FF5C(uint64_t a1)
{
  return a1 + 1;
}

uint64_t Region.CodingKeys.stringValue.getter(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_100010054 + 4 * byte_100019F9E[a1]))(0xD000000000000013, 0x800000010001B6D0);
}

uint64_t sub_100010054()
{
  return 0x614E6E6F69676552;
}

uint64_t sub_100010070(uint64_t a1)
{
  return a1 + 1;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance Region.CodingKeys(unsigned __int8 *a1, unsigned __int8 *a2)
{
  unsigned __int8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  char v10;

  v2 = *a2;
  v3 = Region.CodingKeys.rawValue.getter(*a1);
  v5 = v4;
  v6 = Region.CodingKeys.rawValue.getter(v2);
  if (v3 == v6 && v5 == v7)
  {
    v10 = 1;
    v9 = v5;
  }
  else
  {
    v9 = v7;
    v10 = _stringCompareWithSmolCheck(_:_:expecting:)(v3, v5, v6, v7, 0);
  }
  swift_bridgeObjectRelease(v5);
  swift_bridgeObjectRelease(v9);
  return v10 & 1;
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance Region.CodingKeys()
{
  unsigned __int8 *v0;
  unsigned __int8 v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v6[9];

  v1 = *v0;
  Hasher.init(_seed:)(v6, 0);
  v2 = Region.CodingKeys.rawValue.getter(v1);
  v4 = v3;
  String.hash(into:)(v6, v2, v3);
  swift_bridgeObjectRelease(v4);
  return Hasher._finalize()();
}

uint64_t protocol witness for Hashable.hash(into:) in conformance Region.CodingKeys(uint64_t a1)
{
  unsigned __int8 *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = Region.CodingKeys.rawValue.getter(*v1);
  v5 = v4;
  String.hash(into:)(a1, v3, v4);
  return swift_bridgeObjectRelease(v5);
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance Region.CodingKeys(uint64_t a1)
{
  unsigned __int8 *v1;
  unsigned __int8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v7[9];

  v2 = *v1;
  Hasher.init(_seed:)(v7, a1);
  v3 = Region.CodingKeys.rawValue.getter(v2);
  v5 = v4;
  String.hash(into:)(v7, v3, v4);
  swift_bridgeObjectRelease(v5);
  return Hasher._finalize()();
}

unint64_t protocol witness for RawRepresentable.init(rawValue:) in conformance Region.CodingKeys@<X0>(Swift::String *a1@<X0>, _BYTE *a2@<X8>)
{
  unint64_t result;

  result = specialized Region.CodingKeys.init(rawValue:)(*a1);
  *a2 = result;
  return result;
}

uint64_t protocol witness for RawRepresentable.rawValue.getter in conformance Region.CodingKeys@<X0>(uint64_t *a1@<X8>)
{
  unsigned __int8 *v1;
  uint64_t result;
  uint64_t v4;

  result = Region.CodingKeys.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t protocol witness for CodingKey.stringValue.getter in conformance Region.CodingKeys()
{
  unsigned __int8 *v0;

  return Region.CodingKeys.stringValue.getter(*v0);
}

unint64_t protocol witness for CodingKey.init(stringValue:) in conformance Region.CodingKeys@<X0>(Swift::String a1@<X1:X0>, _BYTE *a2@<X8>)
{
  unint64_t result;

  result = specialized Region.CodingKeys.init(rawValue:)(a1);
  *a2 = result;
  return result;
}

void protocol witness for CodingKey.init(intValue:) in conformance Region.CodingKeys(_BYTE *a1@<X8>)
{
  *a1 = 14;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance Region.CodingKeys(uint64_t a1)
{
  unint64_t v2;

  v2 = lazy protocol witness table accessor for type Region.CodingKeys and conformance Region.CodingKeys();
  return CodingKey.description.getter(a1, v2);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance Region.CodingKeys(uint64_t a1)
{
  unint64_t v2;

  v2 = lazy protocol witness table accessor for type Region.CodingKeys and conformance Region.CodingKeys();
  return CodingKey.debugDescription.getter(a1, v2);
}

extensionFilter::Region::TrialParams::CodingKeys_optional __swiftcall Region.TrialParams.CodingKeys.init(rawValue:)(Swift::String rawValue)
{
  void *object;
  Swift::String v2;
  Swift::Int v3;
  extensionFilter::Region::TrialParams::CodingKeys_optional v4;

  object = rawValue._object;
  v2._countAndFlagsBits = rawValue._countAndFlagsBits;
  v2._object = object;
  v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&outlined read-only object #0 of Region.TrialParams.CodingKeys.init(rawValue:), v2);
  swift_bridgeObjectRelease(object);
  if (v3 == 1)
    v4.value = extensionFilter_Region_TrialParams_CodingKeys_namespaceId;
  else
    v4.value = extensionFilter_Region_TrialParams_CodingKeys_unknownDefault;
  if (v3)
    return v4;
  else
    return 0;
}

extensionFilter::Region::TrialParams::CodingKeys_optional __swiftcall Region.TrialParams.CodingKeys.init(intValue:)(Swift::Int intValue)
{
  return (extensionFilter::Region::TrialParams::CodingKeys_optional)2;
}

uint64_t Region.TrialParams.CodingKeys.rawValue.getter(char a1)
{
  if ((a1 & 1) != 0)
    return 0x63617073656D614ELL;
  else
    return 0x7553206C61697254;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance Region.TrialParams.CodingKeys(char *a1, char *a2)
{
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  char v10;

  v2 = *a2;
  v3 = Region.TrialParams.CodingKeys.rawValue.getter(*a1);
  v5 = v4;
  v6 = Region.TrialParams.CodingKeys.rawValue.getter(v2);
  if (v3 == v6 && v5 == v7)
  {
    v10 = 1;
    v9 = v5;
  }
  else
  {
    v9 = v7;
    v10 = _stringCompareWithSmolCheck(_:_:expecting:)(v3, v5, v6, v7, 0);
  }
  swift_bridgeObjectRelease(v5);
  swift_bridgeObjectRelease(v9);
  return v10 & 1;
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance Region.TrialParams.CodingKeys()
{
  char *v0;
  char v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v6[9];

  v1 = *v0;
  Hasher.init(_seed:)(v6, 0);
  v2 = Region.TrialParams.CodingKeys.rawValue.getter(v1);
  v4 = v3;
  String.hash(into:)(v6, v2, v3);
  swift_bridgeObjectRelease(v4);
  return Hasher._finalize()();
}

uint64_t protocol witness for Hashable.hash(into:) in conformance Region.TrialParams.CodingKeys(uint64_t a1)
{
  char *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = Region.TrialParams.CodingKeys.rawValue.getter(*v1);
  v5 = v4;
  String.hash(into:)(a1, v3, v4);
  return swift_bridgeObjectRelease(v5);
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance Region.TrialParams.CodingKeys(uint64_t a1)
{
  char *v1;
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v7[9];

  v2 = *v1;
  Hasher.init(_seed:)(v7, a1);
  v3 = Region.TrialParams.CodingKeys.rawValue.getter(v2);
  v5 = v4;
  String.hash(into:)(v7, v3, v4);
  swift_bridgeObjectRelease(v5);
  return Hasher._finalize()();
}

uint64_t protocol witness for RawRepresentable.init(rawValue:) in conformance Region.TrialParams.CodingKeys@<X0>(uint64_t *a1@<X0>, char *a2@<X8>)
{
  Swift::String v3;
  void *v4;
  Swift::Int v5;
  uint64_t result;
  char v7;

  v3._countAndFlagsBits = *a1;
  v4 = (void *)a1[1];
  v3._object = v4;
  v5 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&outlined read-only object #0 of Region.TrialParams.CodingKeys.init(rawValue:), v3);
  result = swift_bridgeObjectRelease(v4);
  if (v5 == 1)
    v7 = 1;
  else
    v7 = 2;
  if (!v5)
    v7 = 0;
  *a2 = v7;
  return result;
}

uint64_t protocol witness for RawRepresentable.rawValue.getter in conformance Region.TrialParams.CodingKeys@<X0>(uint64_t *a1@<X8>)
{
  char *v1;
  uint64_t result;
  uint64_t v4;

  result = Region.TrialParams.CodingKeys.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t protocol witness for CodingKey.stringValue.getter in conformance Region.TrialParams.CodingKeys()
{
  char *v0;

  return Region.TrialParams.CodingKeys.rawValue.getter(*v0);
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance Region.TrialParams.CodingKeys@<X0>(Swift::String string@<0:X0, 8:X1>, char *a2@<X8>)
{
  void *object;
  Swift::String v3;
  Swift::Int v5;
  uint64_t result;
  char v7;

  object = string._object;
  v3._countAndFlagsBits = string._countAndFlagsBits;
  v3._object = object;
  v5 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&outlined read-only object #0 of Region.TrialParams.CodingKeys.init(rawValue:), v3);
  result = swift_bridgeObjectRelease(object);
  if (v5 == 1)
    v7 = 1;
  else
    v7 = 2;
  if (!v5)
    v7 = 0;
  *a2 = v7;
  return result;
}

void protocol witness for CodingKey.init(intValue:) in conformance Region.TrialParams.CodingKeys(_BYTE *a1@<X8>)
{
  *a1 = 2;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance Region.TrialParams.CodingKeys(uint64_t a1)
{
  unint64_t v2;

  v2 = lazy protocol witness table accessor for type Region.TrialParams.CodingKeys and conformance Region.TrialParams.CodingKeys();
  return CodingKey.description.getter(a1, v2);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance Region.TrialParams.CodingKeys(uint64_t a1)
{
  unint64_t v2;

  v2 = lazy protocol witness table accessor for type Region.TrialParams.CodingKeys and conformance Region.TrialParams.CodingKeys();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t Region.TrialParams.trialSupported.getter(char a1)
{
  return a1 & 1;
}

uint64_t Region.TrialParams.trialSupported.setter(uint64_t result)
{
  _BYTE *v1;

  *v1 = result;
  return result;
}

uint64_t Region.TrialParams.namespaceId.getter(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t Region.TrialParams.namespaceId.setter(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 8) = result;
  return result;
}

uint64_t Region.TrialParams.init(from:)(_QWORD *a1)
{
  return specialized Region.TrialParams.init(from:)(a1) & 1;
}

uint64_t protocol witness for Decodable.init(from:) in conformance Region.TrialParams@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v5;

  result = specialized Region.TrialParams.init(from:)(a1);
  if (!v2)
  {
    *(_BYTE *)a2 = result & 1;
    *(_QWORD *)(a2 + 8) = v5;
  }
  return result;
}

uint64_t Region.regionName.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain(v0[1]);
  return v1;
}

uint64_t Region.regionName.setter(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t result;

  result = swift_bridgeObjectRelease(v2[1]);
  *v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t Region.smsFilterSupported.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 16);
}

uint64_t Region.smsFilterSupported.setter(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 16) = result;
  return result;
}

uint64_t Region.basicModelAvailable.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 17);
}

uint64_t Region.basicModelAvailable.setter(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 17) = result;
  return result;
}

extensionFilter::Regex::subCategories (__swiftcall *Region.basicModelAvailable.modify())(Swift::OpaquePointer finance, Swift::OpaquePointer reminders, Swift::OpaquePointer orders)
{
  return Regex.subCategories.init(finance:reminders:orders:);
}

uint64_t Region.mainModelAvailable.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 18);
}

uint64_t Region.mainModelAvailable.setter(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 18) = result;
  return result;
}

extensionFilter::Regex::subCategories (__swiftcall *Region.mainModelAvailable.modify())(Swift::OpaquePointer finance, Swift::OpaquePointer reminders, Swift::OpaquePointer orders)
{
  return Regex.subCategories.init(finance:reminders:orders:);
}

uint64_t Region.countryCodePrefix.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 24);
  swift_bridgeObjectRetain(*(_QWORD *)(v0 + 32));
  return v1;
}

uint64_t Region.countryCodePrefix.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = swift_bridgeObjectRelease(*(_QWORD *)(v2 + 32));
  *(_QWORD *)(v2 + 24) = a1;
  *(_QWORD *)(v2 + 32) = a2;
  return result;
}

extensionFilter::Regex::subCategories (__swiftcall *Region.countryCodePrefix.modify())(Swift::OpaquePointer finance, Swift::OpaquePointer reminders, Swift::OpaquePointer orders)
{
  return Regex.subCategories.init(finance:reminders:orders:);
}

uint64_t Region.countryCodePrefixLength.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 40);
}

uint64_t Region.countryCodePrefixLength.setter(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 40) = result;
  return result;
}

extensionFilter::Regex::subCategories (__swiftcall *Region.countryCodePrefixLength.modify())(Swift::OpaquePointer finance, Swift::OpaquePointer reminders, Swift::OpaquePointer orders)
{
  return Regex.subCategories.init(finance:reminders:orders:);
}

uint64_t Region.dominantLanguage.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 48);
  swift_bridgeObjectRetain(*(_QWORD *)(v0 + 56));
  return v1;
}

uint64_t Region.dominantLanguage.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = swift_bridgeObjectRelease(*(_QWORD *)(v2 + 56));
  *(_QWORD *)(v2 + 48) = a1;
  *(_QWORD *)(v2 + 56) = a2;
  return result;
}

extensionFilter::Regex::subCategories (__swiftcall *Region.dominantLanguage.modify())(Swift::OpaquePointer finance, Swift::OpaquePointer reminders, Swift::OpaquePointer orders)
{
  return Regex.subCategories.init(finance:reminders:orders:);
}

uint64_t Region.phoneNumberLength.getter()
{
  uint64_t v0;

  return swift_bridgeObjectRetain(*(_QWORD *)(v0 + 64));
}

uint64_t Region.phoneNumberLength.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  result = swift_bridgeObjectRelease(*(_QWORD *)(v1 + 64));
  *(_QWORD *)(v1 + 64) = a1;
  return result;
}

extensionFilter::Regex::subCategories (__swiftcall *Region.phoneNumberLength.modify())(Swift::OpaquePointer finance, Swift::OpaquePointer reminders, Swift::OpaquePointer orders)
{
  return Regex.subCategories.init(finance:reminders:orders:);
}

uint64_t Region.testPhoneNumbers.getter()
{
  uint64_t v0;

  return swift_bridgeObjectRetain(*(_QWORD *)(v0 + 72));
}

uint64_t Region.testPhoneNumbers.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  result = swift_bridgeObjectRelease(*(_QWORD *)(v1 + 72));
  *(_QWORD *)(v1 + 72) = a1;
  return result;
}

extensionFilter::Regex::subCategories (__swiftcall *Region.testPhoneNumbers.modify())(Swift::OpaquePointer finance, Swift::OpaquePointer reminders, Swift::OpaquePointer orders)
{
  return Regex.subCategories.init(finance:reminders:orders:);
}

uint64_t Region.retryTimerInMinutes.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 80);
}

uint64_t Region.retryTimerInMinutes.setter(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 80) = result;
  return result;
}

extensionFilter::Regex::subCategories (__swiftcall *Region.retryTimerInMinutes.modify())(Swift::OpaquePointer finance, Swift::OpaquePointer reminders, Swift::OpaquePointer orders)
{
  return Regex.subCategories.init(finance:reminders:orders:);
}

uint64_t Region.trial.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 88);
}

uint64_t Region.trial.setter(uint64_t result, uint64_t a2)
{
  uint64_t v2;

  *(_BYTE *)(v2 + 88) = result;
  *(_QWORD *)(v2 + 96) = a2;
  return result;
}

extensionFilter::Regex::subCategories (__swiftcall *Region.trial.modify())(Swift::OpaquePointer finance, Swift::OpaquePointer reminders, Swift::OpaquePointer orders)
{
  return Regex.subCategories.init(finance:reminders:orders:);
}

uint64_t Region.subClassificationSupported.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 104);
}

uint64_t Region.subClassificationSupported.setter(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 104) = result;
  return result;
}

extensionFilter::Regex::subCategories (__swiftcall *Region.subClassificationSupported.modify())(Swift::OpaquePointer finance, Swift::OpaquePointer reminders, Swift::OpaquePointer orders)
{
  return Regex.subCategories.init(finance:reminders:orders:);
}

uint64_t Region.transactionalCapabilities.getter()
{
  uint64_t v0;

  return swift_bridgeObjectRetain(*(_QWORD *)(v0 + 112));
}

uint64_t Region.transactionalCapabilities.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  result = swift_bridgeObjectRelease(*(_QWORD *)(v1 + 112));
  *(_QWORD *)(v1 + 112) = a1;
  return result;
}

extensionFilter::Regex::subCategories (__swiftcall *Region.transactionalCapabilities.modify())(Swift::OpaquePointer finance, Swift::OpaquePointer reminders, Swift::OpaquePointer orders)
{
  return Regex.subCategories.init(finance:reminders:orders:);
}

uint64_t Region.promotionalCapabilities.getter()
{
  uint64_t v0;

  return swift_bridgeObjectRetain(*(_QWORD *)(v0 + 120));
}

uint64_t Region.promotionalCapabilities.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  result = swift_bridgeObjectRelease(*(_QWORD *)(v1 + 120));
  *(_QWORD *)(v1 + 120) = a1;
  return result;
}

extensionFilter::Regex::subCategories (__swiftcall *Region.promotionalCapabilities.modify())(Swift::OpaquePointer finance, Swift::OpaquePointer reminders, Swift::OpaquePointer orders)
{
  return Regex.subCategories.init(finance:reminders:orders:);
}

double Region.init(from:)@<D0>(_QWORD *a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v2;
  double result;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  _OWORD v9[2];
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;

  specialized Region.init(from:)(a1, v9);
  if (!v2)
  {
    v5 = v13;
    a2[4] = v12;
    a2[5] = v5;
    v6 = v15;
    a2[6] = v14;
    a2[7] = v6;
    v7 = v9[1];
    *a2 = v9[0];
    a2[1] = v7;
    result = *(double *)&v10;
    v8 = v11;
    a2[2] = v10;
    a2[3] = v8;
  }
  return result;
}

void __swiftcall Region.init(regionName:smsFilterSupported:basicModelAvailable:mainModelAvailable:countryCodePrefix:countryCodePrefixLength:dominantLanguage:phoneNumberLength:testPhoneNumbers:retryTimerInMinutes:trial:subClassificationSupported:transactionalCapabilities:promotionalCapabilities:)(extensionFilter::Region *__return_ptr retstr, Swift::String regionName, Swift::Bool smsFilterSupported, Swift::Bool basicModelAvailable, Swift::Bool mainModelAvailable, Swift::String countryCodePrefix, Swift::Int countryCodePrefixLength, Swift::String dominantLanguage, Swift::OpaquePointer phoneNumberLength, Swift::OpaquePointer testPhoneNumbers, Swift::Int retryTimerInMinutes, extensionFilter::Region::TrialParams trial, Swift::Bool subClassificationSupported, Swift::OpaquePointer transactionalCapabilities, Swift::OpaquePointer promotionalCapabilities)
{
  retstr->regionName = regionName;
  retstr->smsFilterSupported = smsFilterSupported;
  retstr->basicModelAvailable = basicModelAvailable;
  retstr->mainModelAvailable = mainModelAvailable;
  retstr->countryCodePrefix = countryCodePrefix;
  retstr->countryCodePrefixLength = countryCodePrefixLength;
  retstr->dominantLanguage = dominantLanguage;
  *(_OWORD *)&retstr->phoneNumberLength._rawValue = *(_OWORD *)&phoneNumberLength._rawValue;
  retstr->retryTimerInMinutes = retryTimerInMinutes;
  retstr->trial.trialSupported = trial.trialSupported;
  retstr->trial.namespaceId = trial.namespaceId;
  retstr->subClassificationSupported = subClassificationSupported;
  retstr->transactionalCapabilities = transactionalCapabilities;
  retstr->promotionalCapabilities = promotionalCapabilities;
}

_QWORD *one-time initialization function for sharedRegionProperties()
{
  uint64_t v0;
  void *v1;
  _QWORD *result;

  v0 = type metadata accessor for RegionPropertiesReader();
  v1 = (void *)swift_allocObject(v0, 24, 7);
  result = RegionPropertiesReader.init()();
  static RegionPropertiesReader.sharedRegionProperties = v1;
  return result;
}

uint64_t RegionPropertiesReader.__allocating_init()()
{
  uint64_t v0;
  uint64_t v1;

  v1 = swift_allocObject(v0, 24, 7);
  RegionPropertiesReader.init()();
  return v1;
}

uint64_t static RegionPropertiesReader.instance()()
{
  if (one-time initialization token for sharedRegionProperties != -1)
    swift_once(&one-time initialization token for sharedRegionProperties, one-time initialization function for sharedRegionProperties);
  return swift_retain(static RegionPropertiesReader.sharedRegionProperties);
}

_QWORD *RegionPropertiesReader.init()()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;

  v1 = v0;
  v0[2] = 0;
  v2 = (*(uint64_t (**)(void))(*v0 + 128))();
  v3 = v0[2];
  v0[2] = v2;
  v4 = swift_bridgeObjectRelease(v3);
  if (v0[2])
  {
    (*(void (**)(uint64_t))(*v0 + 144))(v4);
  }
  else
  {
    if (one-time initialization token for logger != -1)
      swift_once(&one-time initialization token for logger, one-time initialization function for logger);
    v5 = type metadata accessor for Logger(0);
    __swift_project_value_buffer(v5, (uint64_t)logger);
    v6 = Logger.logObject.getter();
    v7 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v6, v7))
    {
      v8 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, v7, "smsfiltter: no valid region found", v8, 2u);
      swift_slowDealloc(v8, -1, -1);
    }

  }
  return v1;
}

Swift::OpaquePointer_optional __swiftcall RegionPropertiesReader.getRegionProperties()()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  id v10;
  NSString v11;
  NSString v12;
  id v13;
  void (*v14)(char *, char *, uint64_t);
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  void *v22;
  void *v23;
  Swift::Bool v24;
  _QWORD v25[2];
  Swift::OpaquePointer_optional result;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  __chkstk_darwin(v0);
  v2 = (char *)v25 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = type metadata accessor for URL(0);
  v4 = *(_QWORD *)(v3 - 8);
  v5 = __chkstk_darwin(v3);
  v7 = (char *)v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  v9 = (char *)v25 - v8;
  v10 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
  v11 = String._bridgeToObjectiveC()();
  v12 = String._bridgeToObjectiveC()();
  v13 = objc_msgSend(v10, "URLForResource:withExtension:", v11, v12);

  if (!v13)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v4 + 56))(v2, 1, 1, v3);
    goto LABEL_5;
  }
  static URL._unconditionallyBridgeFromObjectiveC(_:)(v13);

  v14 = *(void (**)(char *, char *, uint64_t))(v4 + 32);
  v14(v2, v7, v3);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v4 + 56))(v2, 0, 1, v3);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v4 + 48))(v2, 1, v3) == 1)
  {
LABEL_5:
    outlined destroy of URL?((uint64_t)v2);
    v23 = 0;
    goto LABEL_6;
  }
  v14(v9, v2, v3);
  v15 = Data.init(contentsOf:options:)(v9, 0);
  v17 = v16;
  v18 = type metadata accessor for PropertyListDecoder(0);
  swift_allocObject(v18, *(unsigned int *)(v18 + 48), *(unsigned __int16 *)(v18 + 52));
  v19 = PropertyListDecoder.init()();
  v20 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [Region]);
  v21 = lazy protocol witness table accessor for type [Region] and conformance <A> [A]();
  dispatch thunk of PropertyListDecoder.decode<A>(_:from:)(v25, v20, v15, v17, v20, v21);
  swift_release(v19);
  outlined consume of Data._Representation(v15, v17);
  v23 = (void *)v25[0];
  (*(void (**)(char *, uint64_t))(v4 + 8))(v9, v3);
LABEL_6:
  v22 = v23;
  result.value._rawValue = v22;
  result.is_nil = v24;
  return result;
}

void __swiftcall RegionPropertiesReader.getRegionPropertiesFor(regionName:)(extensionFilter::Region_optional *__return_ptr retstr, Swift::String regionName)
{
  uint64_t v2;
  void *object;
  uint64_t countAndFlagsBits;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 *v14;
  uint64_t i;
  BOOL v16;
  char v17;
  Swift::OpaquePointer v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  os_log_type_t v28;
  uint8_t *v29;
  uint64_t v30;
  __int128 *v31;
  _OWORD v32[8];
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint64_t v41[16];

  object = regionName._object;
  countAndFlagsBits = regionName._countAndFlagsBits;
  v6 = *(_QWORD *)(v2 + 16);
  if (v6 && (v7 = *(_QWORD *)(v6 + 16)) != 0)
  {
    v8 = *(_OWORD *)(v6 + 32);
    v9 = *(_OWORD *)(v6 + 112);
    v37 = *(_OWORD *)(v6 + 96);
    v38 = v9;
    v10 = *(_OWORD *)(v6 + 144);
    v39 = *(_OWORD *)(v6 + 128);
    v40 = v10;
    v11 = *(_OWORD *)(v6 + 48);
    v12 = *(_OWORD *)(v6 + 64);
    v33 = v8;
    v34 = v11;
    v13 = *(_OWORD *)(v6 + 80);
    v35 = v12;
    v36 = v13;
    regionName._object = (void *)*((_QWORD *)&v33 + 1);
    v14 = (__int128 *)(v6 + 160);
    for (i = v7 - 1; ; --i)
    {
      v16 = (_QWORD)v33 == countAndFlagsBits && regionName._object == object;
      if (v16
        || (_stringCompareWithSmolCheck(_:_:expecting:)(v33, regionName._object, countAndFlagsBits, object, 0) & 1) != 0)
      {
        v32[4] = v37;
        v32[5] = v38;
        v32[6] = v39;
        v32[7] = v40;
        v32[0] = v33;
        v32[1] = v34;
        v17 = v34;
        v32[2] = v35;
        v32[3] = v36;
        *(extensionFilter::Regex::subCategories *)&regionName._countAndFlagsBits = Regex.subCategories.init(finance:reminders:orders:)((Swift::OpaquePointer)v32, (Swift::OpaquePointer)regionName._object, v18);
        if ((v17 & 1) != 0)
          break;
      }
      if (!i)
        goto LABEL_12;
      v19 = v14[3];
      v21 = *v14;
      v20 = v14[1];
      v35 = v14[2];
      v36 = v19;
      v33 = v21;
      v34 = v20;
      v22 = v14[4];
      v23 = v14[5];
      v24 = v14[7];
      v39 = v14[6];
      v40 = v24;
      v37 = v22;
      v38 = v23;
      regionName._object = (void *)*((_QWORD *)&v33 + 1);
      v14 += 8;
    }
    outlined retain of Region(&v33);
    v31 = v32;
  }
  else
  {
LABEL_12:
    if (one-time initialization token for logger != -1)
      swift_once(&one-time initialization token for logger, one-time initialization function for logger);
    v25 = type metadata accessor for Logger(0);
    __swift_project_value_buffer(v25, (uint64_t)logger);
    v26 = swift_bridgeObjectRetain_n(object, 2);
    v27 = Logger.logObject.getter(v26);
    v28 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v27, v28))
    {
      v29 = (uint8_t *)swift_slowAlloc(12, -1);
      v30 = swift_slowAlloc(32, -1);
      v41[0] = v30;
      *(_DWORD *)v29 = 136315138;
      swift_bridgeObjectRetain(object);
      *(_QWORD *)&v33 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(countAndFlagsBits, (unint64_t)object, v41);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v33, (char *)&v33 + 8);
      swift_bridgeObjectRelease_n(object, 3);
      _os_log_impl((void *)&_mh_execute_header, v27, v28, "smsfilter: %s region is not supported", v29, 0xCu);
      swift_arrayDestroy(v30, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v30, -1, -1);
      swift_slowDealloc(v29, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n(object, 2);
    }
    _s15extensionFilter6RegionVSgWOi0_(&v33);
    v31 = &v33;
  }
  outlined init with take of Region?((uint64_t)v31, (uint64_t)v41);
  outlined init with take of Region?((uint64_t)v41, (uint64_t)retstr);
}

Swift::Void __swiftcall RegionPropertiesReader.printRegionProperties()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t i;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  _OWORD *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;

  v1 = *(_QWORD *)(v0 + 16);
  if (v1)
  {
    v2 = *(_QWORD *)(v1 + 16);
    if (v2)
    {
      swift_bridgeObjectRetain(v1);
      v3 = v2 - 1;
      for (i = 32; ; i += 128)
      {
        v5 = *(_OWORD *)(v1 + i);
        v6 = *(_OWORD *)(v1 + i + 16);
        v7 = *(_OWORD *)(v1 + i + 48);
        v20 = *(_OWORD *)(v1 + i + 32);
        v21 = v7;
        v18 = v5;
        v19 = v6;
        v8 = *(_OWORD *)(v1 + i + 64);
        v9 = *(_OWORD *)(v1 + i + 80);
        v10 = *(_OWORD *)(v1 + i + 112);
        v24 = *(_OWORD *)(v1 + i + 96);
        v25 = v10;
        v22 = v8;
        v23 = v9;
        v11 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Any>);
        v12 = swift_allocObject(v11, 64, 7);
        *(_OWORD *)(v12 + 16) = xmmword_100019D50;
        *(_QWORD *)(v12 + 56) = &type metadata for Region;
        v13 = (_OWORD *)swift_allocObject(&unk_100021060, 144, 7);
        *(_QWORD *)(v12 + 32) = v13;
        v14 = v23;
        v13[5] = v22;
        v13[6] = v14;
        v15 = v25;
        v13[7] = v24;
        v13[8] = v15;
        v16 = v19;
        v13[1] = v18;
        v13[2] = v16;
        v17 = v21;
        v13[3] = v20;
        v13[4] = v17;
        outlined retain of Region(&v18);
        print(_:separator:terminator:)(v12, 32, 0xE100000000000000, 10, 0xE100000000000000);
        swift_bridgeObjectRelease(v12);
        if (!v3)
          break;
        --v3;
      }
      swift_bridgeObjectRelease(v1);
    }
  }
}

uint64_t RegionPropertiesReader.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 16));
  return v0;
}

uint64_t RegionPropertiesReader.__deallocating_deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 16));
  return swift_deallocClassInstance(v0, 24, 7);
}

unint64_t specialized Region.CodingKeys.init(rawValue:)(Swift::String string)
{
  void *object;
  Swift::String v2;
  unint64_t v3;

  object = string._object;
  v2._countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&outlined read-only object #0 of Region.CodingKeys.init(rawValue:), v2);
  swift_bridgeObjectRelease(object);
  if (v3 >= 0xE)
    return 14;
  else
    return v3;
}

uint64_t specialized Region.TrialParams.init(from:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v11;
  char v12;
  char v13;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<Region.TrialParams.CodingKeys>);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = a1[3];
  v8 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v7);
  v9 = lazy protocol witness table accessor for type Region.TrialParams.CodingKeys and conformance Region.TrialParams.CodingKeys();
  dispatch thunk of Decoder.container<A>(keyedBy:)(&type metadata for Region.TrialParams.CodingKeys, &type metadata for Region.TrialParams.CodingKeys, v9, v7, v8);
  if (!v1)
  {
    v13 = 0;
    LOBYTE(v7) = KeyedDecodingContainer.decode(_:forKey:)(&v13, v3);
    v12 = 1;
    KeyedDecodingContainer.decode(_:forKey:)(&v12, v3);
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }
  __swift_destroy_boxed_opaque_existential_0(a1);
  return v7 & 1;
}

_QWORD *specialized Region.init(from:)@<X0>(_QWORD *a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  void (*v28)(char *, uint64_t);
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD *result;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  int v38;
  int v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  int v49;
  uint64_t v50;
  int v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  uint64_t v63;
  uint64_t v64;
  char v65;
  char v66;
  char v67;
  int v68;
  char v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  char v78;
  _BYTE v79[7];
  uint64_t v80;
  char v81;
  _BYTE v82[7];
  uint64_t v83;
  uint64_t v84;
  char v85;
  uint64_t v86;
  _BYTE v87[7];
  _BYTE v88[20];
  _QWORD *v89;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<Region.CodingKeys>);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v38 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = a1[3];
  v10 = a1[4];
  v89 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v9);
  v11 = lazy protocol witness table accessor for type Region.CodingKeys and conformance Region.CodingKeys();
  dispatch thunk of Decoder.container<A>(keyedBy:)(&type metadata for Region.CodingKeys, &type metadata for Region.CodingKeys, v11, v9, v10);
  if (v2)
    return (_QWORD *)__swift_destroy_boxed_opaque_existential_0(v89);
  v12 = v6;
  LOBYTE(v63) = 0;
  v13 = KeyedDecodingContainer.decode(_:forKey:)(&v63, v5);
  v15 = v14;
  v52 = v13;
  LOBYTE(v63) = 1;
  swift_bridgeObjectRetain(v14);
  v51 = KeyedDecodingContainer.decode(_:forKey:)(&v63, v5);
  LOBYTE(v63) = 2;
  LODWORD(v50) = KeyedDecodingContainer.decode(_:forKey:)(&v63, v5);
  LOBYTE(v63) = 3;
  v49 = KeyedDecodingContainer.decode(_:forKey:)(&v63, v5);
  LOBYTE(v63) = 4;
  v48 = KeyedDecodingContainer.decode(_:forKey:)(&v63, v5);
  LOBYTE(v63) = 5;
  v17 = v16;
  swift_bridgeObjectRetain(v16);
  v18 = KeyedDecodingContainer.decode(_:forKey:)(&v63, v5);
  v54 = v17;
  v47 = v18;
  LOBYTE(v63) = 6;
  v44 = KeyedDecodingContainer.decode(_:forKey:)(&v63, v5);
  v20 = v19;
  v21 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [Int]);
  LOBYTE(v55) = 7;
  v22 = lazy protocol witness table accessor for type [Int] and conformance <A> [A](&lazy protocol witness table cache variable for type [Int] and conformance <A> [A], &demangling cache variable for type metadata for [Int]);
  v53 = v20;
  swift_bridgeObjectRetain(v20);
  v45 = v22;
  v46 = v21;
  KeyedDecodingContainer.decode<A>(_:forKey:)(&v63, v21, &v55, v5, v21, v22);
  v23 = v63;
  v24 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String]);
  LOBYTE(v55) = 8;
  v25 = lazy protocol witness table accessor for type [Int] and conformance <A> [A]((unint64_t *)&lazy protocol witness table cache variable for type [String] and conformance <A> [A], &demangling cache variable for type metadata for [String]);
  swift_bridgeObjectRetain(v23);
  KeyedDecodingContainer.decode<A>(_:forKey:)(&v63, v24, &v55, v5, v24, v25);
  v43 = v23;
  v26 = v63;
  LOBYTE(v63) = 9;
  swift_bridgeObjectRetain(v26);
  v42 = KeyedDecodingContainer.decode(_:forKey:)(&v63, v5);
  LOBYTE(v55) = 10;
  v27 = lazy protocol witness table accessor for type Region.TrialParams and conformance Region.TrialParams();
  KeyedDecodingContainer.decode<A>(_:forKey:)(&v63, &type metadata for Region.TrialParams, &v55, v5, &type metadata for Region.TrialParams, v27);
  v39 = v63;
  v40 = v64;
  LOBYTE(v63) = 11;
  v38 = KeyedDecodingContainer.decode(_:forKey:)(&v63, v5);
  LOBYTE(v55) = 12;
  KeyedDecodingContainer.decode<A>(_:forKey:)(&v63, v46, &v55, v5, v46, v45);
  v85 = 13;
  v41 = v63;
  swift_bridgeObjectRetain(v63);
  KeyedDecodingContainer.decode<A>(_:forKey:)(&v86, v46, &v85, v5, v46, v45);
  LODWORD(v46) = v51 & 1;
  v51 = v50 & 1;
  LOBYTE(v24) = v49 & 1;
  LODWORD(v45) = v49 & 1;
  v28 = *(void (**)(char *, uint64_t))(v12 + 8);
  LOBYTE(v12) = v38 & 1;
  v49 = v38 & 1;
  v28(v8, v5);
  v50 = v86;
  v29 = v53;
  *(_QWORD *)&v55 = v52;
  *((_QWORD *)&v55 + 1) = v15;
  LOBYTE(v56) = v46;
  BYTE1(v56) = v51;
  BYTE2(v56) = v24;
  v30 = v54;
  *((_QWORD *)&v56 + 1) = v48;
  *(_QWORD *)&v57 = v54;
  v31 = v43;
  *((_QWORD *)&v57 + 1) = v47;
  *(_QWORD *)&v58 = v44;
  *((_QWORD *)&v58 + 1) = v53;
  *(_QWORD *)&v59 = v43;
  *((_QWORD *)&v59 + 1) = v26;
  *(_QWORD *)&v60 = v42;
  BYTE8(v60) = v39;
  *(_QWORD *)&v61 = v40;
  BYTE8(v61) = v12;
  v32 = v41;
  *(_QWORD *)&v62 = v41;
  *((_QWORD *)&v62 + 1) = v86;
  outlined retain of Region(&v55);
  swift_bridgeObjectRelease(v15);
  swift_bridgeObjectRelease(v30);
  swift_bridgeObjectRelease(v29);
  swift_bridgeObjectRelease(v31);
  swift_bridgeObjectRelease(v26);
  swift_bridgeObjectRelease(v32);
  __swift_destroy_boxed_opaque_existential_0(v89);
  v63 = v52;
  v64 = v15;
  v65 = v46;
  v66 = v51;
  v67 = v45;
  v68 = *(_DWORD *)&v88[7];
  v69 = v88[11];
  v70 = v48;
  v71 = v30;
  v72 = v47;
  v73 = v44;
  v74 = v29;
  v75 = v31;
  v76 = v26;
  v77 = v42;
  v78 = v39;
  *(_DWORD *)&v79[3] = *(_DWORD *)&v88[3];
  *(_DWORD *)v79 = *(_DWORD *)v88;
  v80 = v40;
  v81 = v49;
  *(_DWORD *)v82 = *(_DWORD *)v87;
  *(_DWORD *)&v82[3] = *(_DWORD *)&v87[3];
  v83 = v32;
  v84 = v50;
  result = outlined release of Region(&v63);
  v34 = v60;
  a2[4] = v59;
  a2[5] = v34;
  v35 = v62;
  a2[6] = v61;
  a2[7] = v35;
  v36 = v56;
  *a2 = v55;
  a2[1] = v36;
  v37 = v58;
  a2[2] = v57;
  a2[3] = v37;
  return result;
}

uint64_t outlined destroy of URL?(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t lazy protocol witness table accessor for type [Region] and conformance <A> [A]()
{
  unint64_t result;
  uint64_t v1;

  result = lazy protocol witness table cache variable for type [Region] and conformance <A> [A];
  if (!lazy protocol witness table cache variable for type [Region] and conformance <A> [A])
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [Region]);
    lazy protocol witness table accessor for type Region and conformance Region();
    result = swift_getWitnessTable(&protocol conformance descriptor for <A> [A], v1);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type [Region] and conformance <A> [A]);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type Region and conformance Region()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type Region and conformance Region;
  if (!lazy protocol witness table cache variable for type Region and conformance Region)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for Region, &type metadata for Region);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Region and conformance Region);
  }
  return result;
}

uint64_t outlined consume of Data._Representation(uint64_t result, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_release(result);
  }
  return swift_release(a2 & 0x3FFFFFFFFFFFFFFFLL);
}

uint64_t sub_100011FE8()
{
  _QWORD *v0;

  swift_bridgeObjectRelease(v0[3]);
  swift_bridgeObjectRelease(v0[6]);
  swift_bridgeObjectRelease(v0[9]);
  swift_bridgeObjectRelease(v0[10]);
  swift_bridgeObjectRelease(v0[11]);
  swift_bridgeObjectRelease(v0[16]);
  swift_bridgeObjectRelease(v0[17]);
  return swift_deallocObject(v0, 144, 7);
}

unint64_t lazy protocol witness table accessor for type Region.CodingKeys and conformance Region.CodingKeys()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type Region.CodingKeys and conformance Region.CodingKeys;
  if (!lazy protocol witness table cache variable for type Region.CodingKeys and conformance Region.CodingKeys)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for Region.CodingKeys, &type metadata for Region.CodingKeys);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Region.CodingKeys and conformance Region.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type Region.CodingKeys and conformance Region.CodingKeys;
  if (!lazy protocol witness table cache variable for type Region.CodingKeys and conformance Region.CodingKeys)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for Region.CodingKeys, &type metadata for Region.CodingKeys);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Region.CodingKeys and conformance Region.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type Region.CodingKeys and conformance Region.CodingKeys;
  if (!lazy protocol witness table cache variable for type Region.CodingKeys and conformance Region.CodingKeys)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for Region.CodingKeys, &type metadata for Region.CodingKeys);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Region.CodingKeys and conformance Region.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type Region.CodingKeys and conformance Region.CodingKeys;
  if (!lazy protocol witness table cache variable for type Region.CodingKeys and conformance Region.CodingKeys)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for Region.CodingKeys, &type metadata for Region.CodingKeys);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Region.CodingKeys and conformance Region.CodingKeys);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type Region.TrialParams.CodingKeys and conformance Region.TrialParams.CodingKeys()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type Region.TrialParams.CodingKeys and conformance Region.TrialParams.CodingKeys;
  if (!lazy protocol witness table cache variable for type Region.TrialParams.CodingKeys and conformance Region.TrialParams.CodingKeys)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for Region.TrialParams.CodingKeys, &type metadata for Region.TrialParams.CodingKeys);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Region.TrialParams.CodingKeys and conformance Region.TrialParams.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type Region.TrialParams.CodingKeys and conformance Region.TrialParams.CodingKeys;
  if (!lazy protocol witness table cache variable for type Region.TrialParams.CodingKeys and conformance Region.TrialParams.CodingKeys)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for Region.TrialParams.CodingKeys, &type metadata for Region.TrialParams.CodingKeys);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Region.TrialParams.CodingKeys and conformance Region.TrialParams.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type Region.TrialParams.CodingKeys and conformance Region.TrialParams.CodingKeys;
  if (!lazy protocol witness table cache variable for type Region.TrialParams.CodingKeys and conformance Region.TrialParams.CodingKeys)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for Region.TrialParams.CodingKeys, &type metadata for Region.TrialParams.CodingKeys);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Region.TrialParams.CodingKeys and conformance Region.TrialParams.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type Region.TrialParams.CodingKeys and conformance Region.TrialParams.CodingKeys;
  if (!lazy protocol witness table cache variable for type Region.TrialParams.CodingKeys and conformance Region.TrialParams.CodingKeys)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for Region.TrialParams.CodingKeys, &type metadata for Region.TrialParams.CodingKeys);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Region.TrialParams.CodingKeys and conformance Region.TrialParams.CodingKeys);
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for Region(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain(v2);
  return v3;
}

uint64_t destroy for Region(_QWORD *a1)
{
  swift_bridgeObjectRelease(a1[1]);
  swift_bridgeObjectRelease(a1[4]);
  swift_bridgeObjectRelease(a1[7]);
  swift_bridgeObjectRelease(a1[8]);
  swift_bridgeObjectRelease(a1[9]);
  swift_bridgeObjectRelease(a1[14]);
  return swift_bridgeObjectRelease(a1[15]);
}

uint64_t initializeWithCopy for Region(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_WORD *)(a1 + 17) = *(_WORD *)(a2 + 17);
  v4 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v4;
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  v5 = *(_QWORD *)(a2 + 56);
  v6 = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 56) = v5;
  *(_QWORD *)(a1 + 64) = v6;
  v8 = *(_QWORD *)(a2 + 72);
  v7 = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 72) = v8;
  *(_QWORD *)(a1 + 80) = v7;
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  *(_BYTE *)(a1 + 104) = *(_BYTE *)(a2 + 104);
  v9 = *(_QWORD *)(a2 + 112);
  v10 = *(_QWORD *)(a2 + 120);
  *(_QWORD *)(a1 + 112) = v9;
  *(_QWORD *)(a1 + 120) = v10;
  swift_bridgeObjectRetain(v3);
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRetain(v5);
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRetain(v8);
  swift_bridgeObjectRetain(v9);
  swift_bridgeObjectRetain(v10);
  return a1;
}

uint64_t assignWithCopy for Region(uint64_t a1, uint64_t a2)
{
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

  *(_QWORD *)a1 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRelease(v5);
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_BYTE *)(a1 + 17) = *(_BYTE *)(a2 + 17);
  *(_BYTE *)(a1 + 18) = *(_BYTE *)(a2 + 18);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  v6 = *(_QWORD *)(a2 + 32);
  v7 = *(_QWORD *)(a1 + 32);
  *(_QWORD *)(a1 + 32) = v6;
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRelease(v7);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  v8 = *(_QWORD *)(a2 + 56);
  v9 = *(_QWORD *)(a1 + 56);
  *(_QWORD *)(a1 + 56) = v8;
  swift_bridgeObjectRetain(v8);
  swift_bridgeObjectRelease(v9);
  v10 = *(_QWORD *)(a2 + 64);
  v11 = *(_QWORD *)(a1 + 64);
  *(_QWORD *)(a1 + 64) = v10;
  swift_bridgeObjectRetain(v10);
  swift_bridgeObjectRelease(v11);
  v12 = *(_QWORD *)(a2 + 72);
  v13 = *(_QWORD *)(a1 + 72);
  *(_QWORD *)(a1 + 72) = v12;
  swift_bridgeObjectRetain(v12);
  swift_bridgeObjectRelease(v13);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_BYTE *)(a1 + 88) = *(_BYTE *)(a2 + 88);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  *(_BYTE *)(a1 + 104) = *(_BYTE *)(a2 + 104);
  v14 = *(_QWORD *)(a2 + 112);
  v15 = *(_QWORD *)(a1 + 112);
  *(_QWORD *)(a1 + 112) = v14;
  swift_bridgeObjectRetain(v14);
  swift_bridgeObjectRelease(v15);
  v16 = *(_QWORD *)(a2 + 120);
  v17 = *(_QWORD *)(a1 + 120);
  *(_QWORD *)(a1 + 120) = v16;
  swift_bridgeObjectRetain(v16);
  swift_bridgeObjectRelease(v17);
  return a1;
}

__n128 __swift_memcpy128_8(uint64_t a1, __int128 *a2)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __n128 result;
  __int128 v6;
  __int128 v7;

  v2 = *a2;
  v3 = a2[1];
  v4 = a2[3];
  *(_OWORD *)(a1 + 32) = a2[2];
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)a1 = v2;
  *(_OWORD *)(a1 + 16) = v3;
  result = (__n128)a2[4];
  v6 = a2[5];
  v7 = a2[7];
  *(_OWORD *)(a1 + 96) = a2[6];
  *(_OWORD *)(a1 + 112) = v7;
  *(__n128 *)(a1 + 64) = result;
  *(_OWORD *)(a1 + 80) = v6;
  return result;
}

uint64_t assignWithTake for Region(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease(v5);
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_BYTE *)(a1 + 17) = *(_BYTE *)(a2 + 17);
  *(_BYTE *)(a1 + 18) = *(_BYTE *)(a2 + 18);
  v6 = *(_QWORD *)(a2 + 32);
  v7 = *(_QWORD *)(a1 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v6;
  swift_bridgeObjectRelease(v7);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  swift_bridgeObjectRelease(*(_QWORD *)(a1 + 56));
  v8 = *(_QWORD *)(a1 + 64);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  swift_bridgeObjectRelease(v8);
  v9 = *(_QWORD *)(a1 + 72);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  swift_bridgeObjectRelease(v9);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_BYTE *)(a1 + 88) = *(_BYTE *)(a2 + 88);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  *(_BYTE *)(a1 + 104) = *(_BYTE *)(a2 + 104);
  swift_bridgeObjectRelease(*(_QWORD *)(a1 + 112));
  v10 = *(_QWORD *)(a1 + 120);
  *(_OWORD *)(a1 + 112) = *(_OWORD *)(a2 + 112);
  swift_bridgeObjectRelease(v10);
  return a1;
}

uint64_t getEnumTagSinglePayload for Region(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 128))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for Region(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 120) = 0;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 128) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 128) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for Region()
{
  return &type metadata for Region;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for Region.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xF3)
    goto LABEL_17;
  if (a2 + 13 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 13) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 13;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 13;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 13;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0xE;
  v8 = v6 - 14;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for Region.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 13 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 13) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xF3)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF2)
    return ((uint64_t (*)(void))((char *)&loc_1000126DC + 4 * byte_100019FB1[v4]))();
  *a1 = a2 + 13;
  return ((uint64_t (*)(void))((char *)sub_100012710 + 4 * byte_100019FAC[v4]))();
}

uint64_t sub_100012710(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_100012718(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x100012720);
  return result;
}

uint64_t sub_10001272C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x100012734);
  *(_BYTE *)result = a2 + 13;
  return result;
}

uint64_t sub_100012738(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_100012740(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t getEnumTag for Region.CodingKeys(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *destructiveInjectEnumTag for Region.CodingKeys(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for Region.CodingKeys()
{
  return &type metadata for Region.CodingKeys;
}

uint64_t getEnumTagSinglePayload for Region.TrialParams(unsigned __int8 *a1, unsigned int a2)
{
  unsigned int v3;
  BOOL v4;
  int v5;

  if (!a2)
    return 0;
  if (a2 >= 0xFF && a1[16])
    return (*(_DWORD *)a1 + 255);
  v3 = *a1;
  v4 = v3 >= 2;
  v5 = (v3 + 2147483646) & 0x7FFFFFFF;
  if (!v4)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for Region.TrialParams(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_QWORD *)result = a2 - 255;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 16) = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 16) = 0;
    if (a2)
      *(_BYTE *)result = a2 + 1;
  }
  return result;
}

ValueMetadata *type metadata accessor for Region.TrialParams()
{
  return &type metadata for Region.TrialParams;
}

uint64_t getEnumTagSinglePayload for Region.TrialParams.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for Region.TrialParams.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1000128EC + 4 * byte_100019FBB[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_100012920 + 4 * byte_100019FB6[v4]))();
}

uint64_t sub_100012920(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_100012928(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x100012930);
  return result;
}

uint64_t sub_10001293C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x100012944);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_100012948(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_100012950(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *destructiveInjectEnumTag for Region.TrialParams.CodingKeys(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for Region.TrialParams.CodingKeys()
{
  return &type metadata for Region.TrialParams.CodingKeys;
}

uint64_t type metadata accessor for RegionPropertiesReader()
{
  return objc_opt_self(_TtC15extensionFilter22RegionPropertiesReader);
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t lazy protocol witness table accessor for type [Int] and conformance <A> [A](unint64_t *a1, uint64_t *a2)
{
  uint64_t result;
  uint64_t v4;

  result = *a1;
  if (!result)
  {
    v4 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = swift_getWitnessTable(&protocol conformance descriptor for <A> [A], v4);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type Region.TrialParams and conformance Region.TrialParams()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type Region.TrialParams and conformance Region.TrialParams;
  if (!lazy protocol witness table cache variable for type Region.TrialParams and conformance Region.TrialParams)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for Region.TrialParams, &type metadata for Region.TrialParams);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Region.TrialParams and conformance Region.TrialParams);
  }
  return result;
}

_QWORD *outlined release of Region(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v2 = a1[1];
  v3 = a1[4];
  v4 = a1[7];
  v5 = a1[8];
  v6 = a1[9];
  v7 = a1[14];
  swift_bridgeObjectRelease(a1[15]);
  swift_bridgeObjectRelease(v7);
  swift_bridgeObjectRelease(v6);
  swift_bridgeObjectRelease(v5);
  swift_bridgeObjectRelease(v4);
  swift_bridgeObjectRelease(v3);
  swift_bridgeObjectRelease(v2);
  return a1;
}

Swift::Void __swiftcall SmsFilter.loadDefaultBasicModel()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  id v19;
  NSString v20;
  NSString v21;
  id v22;
  void (*v23)(char *, char *, uint64_t);
  char *v24;
  id v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  uint64_t v31;
  uint8_t *v32;
  const char *v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  _BYTE v37[128];
  _BYTE v38[136];
  uint64_t v39;
  _BYTE v40[128];
  _BYTE v41[136];

  v1 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  __chkstk_darwin(v1);
  v3 = (char *)&v34 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for URL(0);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = __chkstk_darwin(v4);
  v8 = (char *)&v34 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __chkstk_darwin(v6);
  v11 = (char *)&v34 - v10;
  __chkstk_darwin(v9);
  v13 = (char *)&v34 - v12;
  v14 = v0 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__region;
  swift_beginAccess(v0 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__region, &v39, 0, 0);
  outlined init with take of Region?(v14, (uint64_t)v40);
  outlined init with take of Region?((uint64_t)v40, (uint64_t)v41);
  if (_s15extensionFilter6RegionVSgWOg((uint64_t)v41) == 1)
  {
    __break(1u);
    goto LABEL_23;
  }
  if (*(_BYTE *)(v14 + 88) != 1)
    goto LABEL_5;
  outlined init with take of Region?(v14, (uint64_t)v37);
  outlined init with take of Region?((uint64_t)v37, (uint64_t)v38);
  if (_s15extensionFilter6RegionVSgWOg((uint64_t)v38) == 1)
  {
LABEL_23:
    __break(1u);
    return;
  }
  if ((*(_BYTE *)(v14 + 17) & 1) != 0)
    return;
LABEL_5:
  if (one-time initialization token for logger != -1)
    swift_once(&one-time initialization token for logger, one-time initialization function for logger);
  v35 = v13;
  v36 = v0;
  v15 = type metadata accessor for Logger(0);
  v34 = __swift_project_value_buffer(v15, (uint64_t)logger);
  v16 = Logger.logObject.getter(v34);
  v17 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v16, v17))
  {
    v18 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v18 = 0;
    _os_log_impl((void *)&_mh_execute_header, v16, v17, "smsfilter: trial-basicModel is not available. fallback to default basicModel.", v18, 2u);
    swift_slowDealloc(v18, -1, -1);
  }

  v19 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
  v20 = String._bridgeToObjectiveC()();
  v21 = String._bridgeToObjectiveC()();
  v22 = objc_msgSend(v19, "URLForResource:withExtension:", v20, v21);

  if (!v22)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56))(v3, 1, 1, v4);
    goto LABEL_13;
  }
  static URL._unconditionallyBridgeFromObjectiveC(_:)(v22);

  v23 = *(void (**)(char *, char *, uint64_t))(v5 + 32);
  v23(v3, v11, v4);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v5 + 56))(v3, 0, 1, v4);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4) == 1)
  {
LABEL_13:
    outlined destroy of URL?((uint64_t)v3);
    return;
  }
  v24 = v35;
  v23(v35, v3, v4);
  type metadata accessor for NLModel();
  (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v8, v24, v4);
  v25 = @nonobjc NLModel.__allocating_init(contentsOf:)((uint64_t)v8);
  v26 = v36;
  swift_beginAccess(v36 + 16, v38, 1, 0);
  v27 = *(void **)(v26 + 16);
  *(_QWORD *)(v26 + 16) = v25;

  v29 = *(_QWORD *)(v26 + 16);
  v30 = Logger.logObject.getter(v28);
  if (v29)
  {
    LOBYTE(v31) = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v30, (os_log_type_t)v31))
    {
      v32 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v32 = 0;
      v33 = "smsfilter: init default basic model.";
LABEL_19:
      _os_log_impl((void *)&_mh_execute_header, v30, (os_log_type_t)v31, v33, v32, 2u);
      swift_slowDealloc(v32, -1, -1);
    }
  }
  else
  {
    v31 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v30, (os_log_type_t)v31))
    {
      v32 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v32 = 0;
      v33 = "smsfilter: failed to load default basic model.";
      goto LABEL_19;
    }
  }

  (*(void (**)(char *, uint64_t))(v5 + 8))(v24, v4);
}

unint64_t type metadata accessor for NLModel()
{
  unint64_t result;
  uint64_t v1;

  result = lazy cache variable for type metadata for NLModel;
  if (!lazy cache variable for type metadata for NLModel)
  {
    v1 = objc_opt_self(NLModel);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&lazy cache variable for type metadata for NLModel);
  }
  return result;
}

id @nonobjc NLModel.__allocating_init(contentsOf:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  id v10;
  id v11;
  uint64_t v12;
  id v14;

  v2 = v1;
  URL._bridgeToObjectiveC()(__stack_chk_guard);
  v5 = v4;
  v14 = 0;
  v6 = objc_msgSend((id)swift_getObjCClassFromMetadata(v2), "modelWithContentsOfURL:error:", v4, &v14);

  v7 = v14;
  if (v6)
  {
    v8 = type metadata accessor for URL(0);
    v9 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 8);
    v10 = v7;
    v9(a1, v8);
  }
  else
  {
    v11 = v14;
    _convertNSErrorToError(_:)(v7);

    swift_willThrow();
    v12 = type metadata accessor for URL(0);
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 8))(a1, v12);
  }
  return v6;
}

uint64_t specialized == infix<A>(_:_:)(unsigned __int8 a1, unsigned __int8 a2)
{
  unint64_t v2;
  unint64_t v3;
  int v4;
  unint64_t v5;
  unint64_t v6;
  int v7;
  char v8;

  v2 = 0xD00000000000001ALL;
  v3 = 0x800000010001B8B0;
  v4 = a1;
  if (a1)
  {
    if (a1 == 1)
      v5 = 0xD00000000000001CLL;
    else
      v5 = 0xD000000000000020;
    if (v4 == 1)
      v6 = 0x800000010001B8D0;
    else
      v6 = 0x800000010001B8F0;
    v7 = a2;
    if (!a2)
      goto LABEL_15;
    goto LABEL_9;
  }
  v5 = 0xD00000000000001ALL;
  v6 = 0x800000010001B8B0;
  v7 = a2;
  if (a2)
  {
LABEL_9:
    if (v7 == 1)
      v2 = 0xD00000000000001CLL;
    else
      v2 = 0xD000000000000020;
    if (v7 == 1)
      v3 = 0x800000010001B8D0;
    else
      v3 = 0x800000010001B8F0;
  }
LABEL_15:
  if (v5 == v2 && v6 == v3)
  {
    v8 = 1;
    v3 = v6;
  }
  else
  {
    v8 = _stringCompareWithSmolCheck(_:_:expecting:)(v5, v6, v2, v3, 0);
  }
  swift_bridgeObjectRelease(v6);
  swift_bridgeObjectRelease(v3);
  return v8 & 1;
}

uint64_t RegexMessageReader.__allocating_init(filePath:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  _BYTE v12[40];
  _QWORD v13[5];

  v5 = swift_allocObject(v2, 56, 7);
  *(_OWORD *)(v5 + 32) = 0u;
  *(_QWORD *)(v5 + 48) = 0;
  *(_OWORD *)(v5 + 16) = 0u;
  specialized RegexMessageReader.processRegexMessages(filePath:)(a1, a2, (uint64_t)v12);
  swift_bridgeObjectRelease(a2);
  outlined init with take of Regex?((uint64_t)v12, v5 + 16);
  outlined consume of Regex?(0, 0, 0, 0, 0);
  outlined init with take of Regex?((uint64_t)v12, (uint64_t)v13);
  if (!v13[0])
  {
    if (one-time initialization token for logger != -1)
      swift_once(&one-time initialization token for logger, one-time initialization function for logger);
    v6 = type metadata accessor for Logger(0);
    v7 = __swift_project_value_buffer(v6, (uint64_t)logger);
    v8 = Logger.logObject.getter(v7);
    v9 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v8, v9))
    {
      v10 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, v9, "smsfiltter: no valid regex found", v10, 2u);
      swift_slowDealloc(v10, -1, -1);
    }

  }
  return v5;
}

Swift::Int specialized RawRepresentable<>.hashValue.getter(char a1)
{
  unint64_t v2;
  unint64_t v3;
  _QWORD v5[9];

  v2 = 0xD00000000000001ALL;
  Hasher.init(_seed:)(v5, 0);
  if (a1)
  {
    if (a1 == 1)
      v2 = 0xD00000000000001CLL;
    else
      v2 = 0xD000000000000020;
    if (a1 == 1)
      v3 = 0x800000010001B8D0;
    else
      v3 = 0x800000010001B8F0;
  }
  else
  {
    v3 = 0x800000010001B8B0;
  }
  String.hash(into:)(v5, v2, v3);
  swift_bridgeObjectRelease(v3);
  return Hasher._finalize()();
}

uint64_t specialized RawRepresentable<>.hash(into:)(uint64_t a1, char a2)
{
  unint64_t v3;
  unint64_t v4;

  v3 = 0xD00000000000001ALL;
  if (a2)
  {
    if (a2 == 1)
      v3 = 0xD00000000000001CLL;
    else
      v3 = 0xD000000000000020;
    if (a2 == 1)
      v4 = 0x800000010001B8D0;
    else
      v4 = 0x800000010001B8F0;
  }
  else
  {
    v4 = 0x800000010001B8B0;
  }
  String.hash(into:)(a1, v3, v4);
  return swift_bridgeObjectRelease(v4);
}

Swift::Int specialized RawRepresentable<>._rawHashValue(seed:)(uint64_t a1, char a2)
{
  unint64_t v3;
  unint64_t v4;
  _QWORD v6[9];

  v3 = 0xD00000000000001ALL;
  Hasher.init(_seed:)(v6, a1);
  if (a2)
  {
    if (a2 == 1)
      v3 = 0xD00000000000001CLL;
    else
      v3 = 0xD000000000000020;
    if (a2 == 1)
      v4 = 0x800000010001B8D0;
    else
      v4 = 0x800000010001B8F0;
  }
  else
  {
    v4 = 0x800000010001B8B0;
  }
  String.hash(into:)(v6, v3, v4);
  swift_bridgeObjectRelease(v4);
  return Hasher._finalize()();
}

extensionFilter::Regex::CodingKeys_optional __swiftcall Regex.CodingKeys.init(rawValue:)(Swift::String rawValue)
{
  Swift::OpaquePointer v1;

  v1._rawValue = &outlined read-only object #0 of Regex.CodingKeys.init(rawValue:);
  return (extensionFilter::Regex::CodingKeys_optional)Regex.CodingKeys.init(stringValue:)(rawValue, v1);
}

extensionFilter::Regex::CodingKeys_optional __swiftcall Regex.CodingKeys.init(stringValue:)(Swift::String stringValue)
{
  Swift::OpaquePointer v1;

  v1._rawValue = &outlined read-only object #0 of Regex.CodingKeys.init(rawValue:);
  return (extensionFilter::Regex::CodingKeys_optional)Regex.CodingKeys.init(stringValue:)(stringValue, v1);
}

extensionFilter::Regex::subCategories::CodingKeys_optional __swiftcall Regex.subCategories.CodingKeys.init(intValue:)(Swift::Int intValue)
{
  return (extensionFilter::Regex::subCategories::CodingKeys_optional)3;
}

unint64_t Regex.CodingKeys.rawValue.getter(char a1)
{
  unint64_t result;

  result = 0xD00000000000001ALL;
  if (a1)
  {
    if (a1 == 1)
      return 0xD00000000000001CLL;
    else
      return 0xD000000000000020;
  }
  return result;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance Regex.CodingKeys(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return specialized == infix<A>(_:_:)(*a1, *a2);
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance Regex.CodingKeys()
{
  char *v0;

  return specialized RawRepresentable<>.hashValue.getter(*v0);
}

uint64_t protocol witness for Hashable.hash(into:) in conformance Regex.CodingKeys(uint64_t a1)
{
  char *v1;

  return specialized RawRepresentable<>.hash(into:)(a1, *v1);
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance Regex.CodingKeys(uint64_t a1)
{
  char *v1;

  return specialized RawRepresentable<>._rawHashValue(seed:)(a1, *v1);
}

unint64_t protocol witness for RawRepresentable.init(rawValue:) in conformance Regex.CodingKeys@<X0>(Swift::String *a1@<X0>, _BYTE *a2@<X8>)
{
  Swift::OpaquePointer v3;
  unint64_t result;

  v3._rawValue = &outlined read-only object #0 of Regex.CodingKeys.init(rawValue:);
  result = Regex.CodingKeys.init(stringValue:)(*a1, v3);
  *a2 = result;
  return result;
}

unint64_t protocol witness for RawRepresentable.rawValue.getter in conformance Regex.CodingKeys@<X0>(unint64_t *a1@<X8>)
{
  char *v1;
  unint64_t result;
  unint64_t v4;

  result = Regex.CodingKeys.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

unint64_t protocol witness for CodingKey.stringValue.getter in conformance Regex.CodingKeys()
{
  char *v0;

  return Regex.CodingKeys.rawValue.getter(*v0);
}

unint64_t protocol witness for CodingKey.init(stringValue:) in conformance Regex.CodingKeys@<X0>(Swift::String a1@<X1:X0>, _BYTE *a2@<X8>)
{
  Swift::OpaquePointer v3;
  unint64_t result;

  v3._rawValue = &outlined read-only object #0 of Regex.CodingKeys.init(rawValue:);
  result = Regex.CodingKeys.init(stringValue:)(a1, v3);
  *a2 = result;
  return result;
}

void protocol witness for CodingKey.init(intValue:) in conformance Regex.CodingKeys(_BYTE *a1@<X8>)
{
  *a1 = 3;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance Regex.CodingKeys(uint64_t a1)
{
  unint64_t v2;

  v2 = lazy protocol witness table accessor for type Regex.CodingKeys and conformance Regex.CodingKeys();
  return CodingKey.description.getter(a1, v2);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance Regex.CodingKeys(uint64_t a1)
{
  unint64_t v2;

  v2 = lazy protocol witness table accessor for type Regex.CodingKeys and conformance Regex.CodingKeys();
  return CodingKey.debugDescription.getter(a1, v2);
}

extensionFilter::Regex::subCategories::CodingKeys_optional __swiftcall Regex.subCategories.CodingKeys.init(rawValue:)(Swift::String rawValue)
{
  Swift::OpaquePointer v1;

  v1._rawValue = &outlined read-only object #0 of Regex.subCategories.CodingKeys.init(rawValue:);
  return (extensionFilter::Regex::subCategories::CodingKeys_optional)Regex.CodingKeys.init(stringValue:)(rawValue, v1);
}

extensionFilter::Regex::subCategories::CodingKeys_optional __swiftcall Regex.subCategories.CodingKeys.init(stringValue:)(Swift::String stringValue)
{
  Swift::OpaquePointer v1;

  v1._rawValue = &outlined read-only object #0 of Regex.subCategories.CodingKeys.init(rawValue:);
  return (extensionFilter::Regex::subCategories::CodingKeys_optional)Regex.CodingKeys.init(stringValue:)(stringValue, v1);
}

unint64_t Regex.CodingKeys.init(stringValue:)(Swift::String string, Swift::OpaquePointer cases)
{
  void *object;
  Swift::String v3;
  unint64_t v5;

  object = string._object;
  v3._countAndFlagsBits = string._countAndFlagsBits;
  v3._object = object;
  v5 = _findStringSwitchCase(cases:string:)(cases, v3);
  swift_bridgeObjectRelease(object);
  if (v5 >= 3)
    return 3;
  else
    return v5;
}

uint64_t Regex.subCategories.CodingKeys.rawValue.getter(char a1)
{
  return *(_QWORD *)&aFinance_1[8 * a1];
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance Regex.subCategories.CodingKeys(char *a1, char *a2)
{
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  char v10;

  v2 = *a2;
  v3 = Regex.subCategories.CodingKeys.rawValue.getter(*a1);
  v5 = v4;
  v6 = Regex.subCategories.CodingKeys.rawValue.getter(v2);
  if (v3 == v6 && v5 == v7)
  {
    v10 = 1;
    v9 = v5;
  }
  else
  {
    v9 = v7;
    v10 = _stringCompareWithSmolCheck(_:_:expecting:)(v3, v5, v6, v7, 0);
  }
  swift_bridgeObjectRelease(v5);
  swift_bridgeObjectRelease(v9);
  return v10 & 1;
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance Regex.subCategories.CodingKeys()
{
  char *v0;
  char v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v6[9];

  v1 = *v0;
  Hasher.init(_seed:)(v6, 0);
  v2 = Regex.subCategories.CodingKeys.rawValue.getter(v1);
  v4 = v3;
  String.hash(into:)(v6, v2, v3);
  swift_bridgeObjectRelease(v4);
  return Hasher._finalize()();
}

uint64_t protocol witness for Hashable.hash(into:) in conformance Regex.subCategories.CodingKeys(uint64_t a1)
{
  char *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = Regex.subCategories.CodingKeys.rawValue.getter(*v1);
  v5 = v4;
  String.hash(into:)(a1, v3, v4);
  return swift_bridgeObjectRelease(v5);
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance Regex.subCategories.CodingKeys(uint64_t a1)
{
  char *v1;
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v7[9];

  v2 = *v1;
  Hasher.init(_seed:)(v7, a1);
  v3 = Regex.subCategories.CodingKeys.rawValue.getter(v2);
  v5 = v4;
  String.hash(into:)(v7, v3, v4);
  swift_bridgeObjectRelease(v5);
  return Hasher._finalize()();
}

unint64_t protocol witness for RawRepresentable.init(rawValue:) in conformance Regex.subCategories.CodingKeys@<X0>(Swift::String *a1@<X0>, _BYTE *a2@<X8>)
{
  Swift::OpaquePointer v3;
  unint64_t result;

  v3._rawValue = &outlined read-only object #0 of Regex.subCategories.CodingKeys.init(rawValue:);
  result = Regex.CodingKeys.init(stringValue:)(*a1, v3);
  *a2 = result;
  return result;
}

uint64_t protocol witness for RawRepresentable.rawValue.getter in conformance Regex.subCategories.CodingKeys@<X0>(uint64_t *a1@<X8>)
{
  char *v1;
  uint64_t result;
  uint64_t v4;

  result = Regex.subCategories.CodingKeys.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t protocol witness for CodingKey.stringValue.getter in conformance Regex.subCategories.CodingKeys()
{
  char *v0;

  return Regex.subCategories.CodingKeys.rawValue.getter(*v0);
}

unint64_t protocol witness for CodingKey.init(stringValue:) in conformance Regex.subCategories.CodingKeys@<X0>(Swift::String a1@<X1:X0>, _BYTE *a2@<X8>)
{
  Swift::OpaquePointer v3;
  unint64_t result;

  v3._rawValue = &outlined read-only object #0 of Regex.subCategories.CodingKeys.init(rawValue:);
  result = Regex.CodingKeys.init(stringValue:)(a1, v3);
  *a2 = result;
  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance Regex.subCategories.CodingKeys(uint64_t a1)
{
  unint64_t v2;

  v2 = lazy protocol witness table accessor for type Regex.subCategories.CodingKeys and conformance Regex.subCategories.CodingKeys();
  return CodingKey.description.getter(a1, v2);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance Regex.subCategories.CodingKeys(uint64_t a1)
{
  unint64_t v2;

  v2 = lazy protocol witness table accessor for type Regex.subCategories.CodingKeys and conformance Regex.subCategories.CodingKeys();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t Regex.subCategories.finance.setter(uint64_t a1)
{
  _QWORD *v1;
  uint64_t result;

  result = swift_bridgeObjectRelease(*v1);
  *v1 = a1;
  return result;
}

uint64_t Regex.subCategories.reminders.getter(uint64_t a1, uint64_t a2)
{
  return swift_bridgeObjectRetain(a2);
}

uint64_t Regex.subCategories.reminders.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  result = swift_bridgeObjectRelease(*(_QWORD *)(v1 + 8));
  *(_QWORD *)(v1 + 8) = a1;
  return result;
}

uint64_t Regex.subCategories.orders.getter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_bridgeObjectRetain(a3);
}

uint64_t Regex.subCategories.orders.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  result = swift_bridgeObjectRelease(*(_QWORD *)(v1 + 16));
  *(_QWORD *)(v1 + 16) = a1;
  return result;
}

uint64_t Regex.subCategories.init(from:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t result;
  uint64_t v3;

  result = specialized Regex.subCategories.init(from:)(a1);
  if (v1)
    return v3;
  return result;
}

uint64_t protocol witness for Decodable.init(from:) in conformance Regex.subCategories@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;

  result = specialized Regex.subCategories.init(from:)(a1);
  if (!v2)
  {
    *a2 = result;
    a2[1] = v5;
    a2[2] = v6;
  }
  return result;
}

uint64_t Regex.promoRegex.getter()
{
  _QWORD *v0;

  return swift_bridgeObjectRetain(*v0);
}

uint64_t Regex.transRegex.getter()
{
  uint64_t v0;

  return swift_bridgeObjectRetain(*(_QWORD *)(v0 + 8));
}

uint64_t Regex.subClassificationRegex.getter()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = v0[2];
  v2 = v0[3];
  v3 = v0[4];
  swift_bridgeObjectRetain(v1);
  swift_bridgeObjectRetain(v2);
  swift_bridgeObjectRetain(v3);
  return v1;
}

uint64_t Regex.subClassificationRegex.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t result;

  swift_bridgeObjectRelease(v3[2]);
  swift_bridgeObjectRelease(v3[3]);
  result = swift_bridgeObjectRelease(v3[4]);
  v3[2] = a1;
  v3[3] = a2;
  v3[4] = a3;
  return result;
}

double Regex.init(from:)@<D0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  double result;
  __int128 v5;
  _OWORD v6[2];
  uint64_t v7;

  specialized Regex.init(from:)(a1, v6);
  if (!v2)
  {
    result = *(double *)v6;
    v5 = v6[1];
    *(_OWORD *)a2 = v6[0];
    *(_OWORD *)(a2 + 16) = v5;
    *(_QWORD *)(a2 + 32) = v7;
  }
  return result;
}

void __swiftcall Regex.init(promoRegex:transRegex:subClassificationRegex:)(extensionFilter::Regex *__return_ptr retstr, Swift::OpaquePointer promoRegex, Swift::OpaquePointer transRegex, extensionFilter::Regex::subCategories subClassificationRegex)
{
  retstr->promoRegex = promoRegex;
  retstr->transRegex = transRegex;
  retstr->subClassificationRegex = subClassificationRegex;
}

_QWORD *RegexMessageReader.init(filePath:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  _QWORD v17[5];

  v3 = (_QWORD *)v2;
  *(_QWORD *)(v2 + 48) = 0;
  *(_OWORD *)(v2 + 32) = 0u;
  *(_OWORD *)(v2 + 16) = 0u;
  v5 = (_QWORD *)(v2 + 16);
  (*(void (**)(_QWORD *__return_ptr))(*(_QWORD *)v2 + 120))(v17);
  swift_bridgeObjectRelease(a2);
  v6 = *(_QWORD *)(v2 + 16);
  v7 = v3[3];
  v8 = v3[4];
  v9 = v3[5];
  v10 = v3[6];
  outlined init with take of Regex?((uint64_t)v17, (uint64_t)v5);
  outlined consume of Regex?(v6, v7, v8, v9, v10);
  if (!*v5)
  {
    if (one-time initialization token for logger != -1)
      swift_once(&one-time initialization token for logger, one-time initialization function for logger);
    v11 = type metadata accessor for Logger(0);
    v12 = __swift_project_value_buffer(v11, (uint64_t)logger);
    v13 = Logger.logObject.getter(v12);
    v14 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v13, v14))
    {
      v15 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, v14, "smsfiltter: no valid regex found", v15, 2u);
      swift_slowDealloc(v15, -1, -1);
    }

  }
  return v3;
}

void __swiftcall RegexMessageReader.processRegexMessages(filePath:)(extensionFilter::Regex_optional *__return_ptr retstr, Swift::String filePath)
{
  _BYTE v3[40];

  specialized RegexMessageReader.processRegexMessages(filePath:)(filePath._countAndFlagsBits, (uint64_t)filePath._object, (uint64_t)v3);
  outlined init with take of Regex?((uint64_t)v3, (uint64_t)retstr);
}

Swift::OpaquePointer_optional __swiftcall RegexMessageReader.getRegexMessagesForPromo()()
{
  uint64_t v0;
  void *v1;
  Swift::Bool v2;
  Swift::OpaquePointer_optional result;

  v1 = *(void **)(v0 + 16);
  if (v1)
    v1 = (void *)swift_bridgeObjectRetain(v1);
  result.value._rawValue = v1;
  result.is_nil = v2;
  return result;
}

Swift::OpaquePointer_optional __swiftcall RegexMessageReader.getRegexMessagesForTrans()()
{
  uint64_t v0;
  void *v1;
  Swift::Bool v2;
  Swift::OpaquePointer_optional result;

  if (*(_QWORD *)(v0 + 16))
    v1 = (void *)swift_bridgeObjectRetain(*(_QWORD *)(v0 + 24));
  else
    v1 = 0;
  result.value._rawValue = v1;
  result.is_nil = v2;
  return result;
}

Swift::OpaquePointer_optional __swiftcall RegexMessageReader.getRegexMessagesForSubClassification()()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char isUniquelyReferenced_nonNull_native;
  void *v8;
  Swift::Bool v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  os_log_type_t v26;
  uint8_t *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  uint64_t v34;
  _BYTE v35[24];
  uint64_t v36[3];
  void *v37;
  Swift::OpaquePointer_optional result;

  v1 = v0;
  v2 = v0[2];
  if (!v2)
  {
    v8 = 0;
    goto LABEL_12;
  }
  v4 = v1[5];
  v3 = v1[6];
  v6 = v1[3];
  v5 = v1[4];
  swift_bridgeObjectRetain(v5);
  outlined copy of Regex?(v2, v6, v5, v4, v3);
  swift_bridgeObjectRelease(v3);
  swift_bridgeObjectRelease(v4);
  swift_bridgeObjectRelease(v5);
  swift_bridgeObjectRelease(v6);
  swift_bridgeObjectRelease(v2);
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(&_swiftEmptyDictionarySingleton);
  v36[0] = (uint64_t)&_swiftEmptyDictionarySingleton;
  specialized _NativeDictionary.setValue(_:forKey:isUnique:)(v5, 0x65636E616E6946, 0xE700000000000000, isUniquelyReferenced_nonNull_native);
  v37 = &_swiftEmptyDictionarySingleton;
  v8 = (void *)swift_bridgeObjectRelease(0x8000000000000000);
  v10 = v1[2];
  if (!v10)
  {
    __break(1u);
    goto LABEL_11;
  }
  v12 = v1[5];
  v11 = v1[6];
  v14 = v1[3];
  v13 = v1[4];
  swift_bridgeObjectRetain(v11);
  outlined copy of Regex?(v10, v14, v13, v12, v11);
  swift_bridgeObjectRelease(v11);
  swift_bridgeObjectRelease(v12);
  swift_bridgeObjectRelease(v13);
  swift_bridgeObjectRelease(v14);
  swift_bridgeObjectRelease(v10);
  v15 = swift_isUniquelyReferenced_nonNull_native(&_swiftEmptyDictionarySingleton);
  v36[0] = (uint64_t)&_swiftEmptyDictionarySingleton;
  specialized _NativeDictionary.setValue(_:forKey:isUnique:)(v11, 0x73726564724FLL, 0xE600000000000000, v15);
  v8 = (void *)swift_bridgeObjectRelease(0x8000000000000000);
  v16 = v1[2];
  if (!v16)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  v18 = v1[5];
  v17 = v1[6];
  v21 = v1 + 3;
  v19 = v1[3];
  v20 = v21[1];
  outlined copy of Regex?(v16, v19, v20, v18, v17);
  swift_bridgeObjectRelease(v17);
  swift_bridgeObjectRelease(v20);
  swift_bridgeObjectRelease(v19);
  swift_bridgeObjectRelease(v16);
  v22 = swift_isUniquelyReferenced_nonNull_native(&_swiftEmptyDictionarySingleton);
  v36[0] = (uint64_t)&_swiftEmptyDictionarySingleton;
  specialized _NativeDictionary.setValue(_:forKey:isUnique:)(v18, 0x7265646E696D6552, 0xE900000000000073, v22);
  v37 = &_swiftEmptyDictionarySingleton;
  swift_bridgeObjectRelease(0x8000000000000000);
  if (one-time initialization token for logger != -1)
    swift_once(&one-time initialization token for logger, one-time initialization function for logger);
  v23 = type metadata accessor for Logger(0);
  v24 = __swift_project_value_buffer(v23, (uint64_t)logger);
  v25 = Logger.logObject.getter(v24);
  v26 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v25, v26))
  {
    v27 = (uint8_t *)swift_slowAlloc(12, -1);
    v28 = swift_slowAlloc(32, -1);
    v36[0] = v28;
    *(_DWORD *)v27 = 136315138;
    swift_beginAccess(&v37, v35, 0, 0);
    v29 = v37;
    swift_bridgeObjectRetain(v37);
    v30 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String]);
    v31 = Dictionary.description.getter(v29, &type metadata for String, v30, &protocol witness table for String);
    v33 = v32;
    swift_bridgeObjectRelease(v29);
    v34 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v31, v33, v36);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v34, v35);
    swift_bridgeObjectRelease(v33);
    _os_log_impl((void *)&_mh_execute_header, v25, v26, "SMSfilter: SubRegex: %s", v27, 0xCu);
    swift_arrayDestroy(v28, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v28, -1, -1);
    swift_slowDealloc(v27, -1, -1);
  }

  swift_beginAccess(&v37, v36, 0, 0);
  v8 = v37;
LABEL_12:
  result.value._rawValue = v8;
  result.is_nil = v9;
  return result;
}

uint64_t *RegexMessageReader.deinit()
{
  uint64_t *v0;

  outlined consume of Regex?(v0[2], v0[3], v0[4], v0[5], v0[6]);
  return v0;
}

uint64_t RegexMessageReader.__deallocating_deinit()
{
  uint64_t *v0;

  outlined consume of Regex?(v0[2], v0[3], v0[4], v0[5], v0[6]);
  return swift_deallocClassInstance(v0, 56, 7);
}

Swift::Int specialized _NativeDictionary._copyOrMoveAndResize(capacity:moveElements:)(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  Swift::Int result;
  int64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  _QWORD *v19;
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
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  int64_t v35;
  uint64_t v36;
  char v37;
  _QWORD v38[9];

  v3 = v2;
  v5 = *v2;
  if (*(_QWORD *)(*v2 + 24) <= a1)
    v6 = a1;
  else
    v6 = *(_QWORD *)(*v2 + 24);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<String, [String]>);
  v37 = a2;
  v7 = static _DictionaryStorage.resize(original:capacity:move:)(v5, v6, a2);
  v8 = v7;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_43;
  v9 = 1 << *(_BYTE *)(v5 + 32);
  v36 = v5 + 64;
  if (v9 < 64)
    v10 = ~(-1 << v9);
  else
    v10 = -1;
  v11 = v10 & *(_QWORD *)(v5 + 64);
  v35 = (unint64_t)(v9 + 63) >> 6;
  v12 = v7 + 64;
  result = swift_retain(v5);
  v14 = 0;
  while (1)
  {
    if (v11)
    {
      v20 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      v21 = v20 | (v14 << 6);
      goto LABEL_34;
    }
    v22 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_44:
      __break(1u);
LABEL_45:
      __break(1u);
      return result;
    }
    if (v22 >= v35)
      break;
    v23 = (_QWORD *)(v5 + 64);
    v24 = *(_QWORD *)(v36 + 8 * v22);
    ++v14;
    if (!v24)
    {
      v14 = v22 + 1;
      if (v22 + 1 >= v35)
        goto LABEL_36;
      v24 = *(_QWORD *)(v36 + 8 * v14);
      if (!v24)
      {
        v25 = v22 + 2;
        if (v25 >= v35)
        {
LABEL_36:
          swift_release(v5);
          if ((v37 & 1) == 0)
            goto LABEL_43;
          goto LABEL_39;
        }
        v24 = *(_QWORD *)(v36 + 8 * v25);
        if (!v24)
        {
          while (1)
          {
            v14 = v25 + 1;
            if (__OFADD__(v25, 1))
              goto LABEL_45;
            if (v14 >= v35)
              goto LABEL_36;
            v24 = *(_QWORD *)(v36 + 8 * v14);
            ++v25;
            if (v24)
              goto LABEL_33;
          }
        }
        v14 = v25;
      }
    }
LABEL_33:
    v11 = (v24 - 1) & v24;
    v21 = __clz(__rbit64(v24)) + (v14 << 6);
LABEL_34:
    v30 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v21);
    v32 = *v30;
    v31 = v30[1];
    v33 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + 8 * v21);
    if ((v37 & 1) == 0)
    {
      swift_bridgeObjectRetain(v30[1]);
      swift_bridgeObjectRetain(v33);
    }
    Hasher.init(_seed:)(v38, *(_QWORD *)(v8 + 40));
    String.hash(into:)(v38, v32, v31);
    result = Hasher._finalize()();
    v15 = -1 << *(_BYTE *)(v8 + 32);
    v16 = result & ~v15;
    v17 = v16 >> 6;
    if (((-1 << v16) & ~*(_QWORD *)(v12 + 8 * (v16 >> 6))) != 0)
    {
      v18 = __clz(__rbit64((-1 << v16) & ~*(_QWORD *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
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
          goto LABEL_44;
        }
        v28 = v17 == v27;
        if (v17 == v27)
          v17 = 0;
        v26 |= v28;
        v29 = *(_QWORD *)(v12 + 8 * v17);
      }
      while (v29 == -1);
      v18 = __clz(__rbit64(~v29)) + (v17 << 6);
    }
    *(_QWORD *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    v19 = (_QWORD *)(*(_QWORD *)(v8 + 48) + 16 * v18);
    *v19 = v32;
    v19[1] = v31;
    *(_QWORD *)(*(_QWORD *)(v8 + 56) + 8 * v18) = v33;
    ++*(_QWORD *)(v8 + 16);
  }
  swift_release(v5);
  v23 = (_QWORD *)(v5 + 64);
  if ((v37 & 1) == 0)
    goto LABEL_43;
LABEL_39:
  v34 = 1 << *(_BYTE *)(v5 + 32);
  if (v34 >= 64)
    bzero(v23, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v23 = -1 << v34;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_43:
  result = swift_release(v5);
  *v3 = v8;
  return result;
}

uint64_t specialized _NativeDictionary.setValue(_:forKey:isUnique:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v10;
  char v11;
  unint64_t v12;
  uint64_t v13;
  _BOOL8 v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t result;
  unint64_t v21;
  char v22;
  uint64_t *v23;
  uint64_t v24;
  BOOL v25;
  uint64_t v26;

  v5 = v4;
  v10 = *v4;
  v12 = specialized __RawDictionaryStorage.find<A>(_:)(a2, a3);
  v13 = *(_QWORD *)(v10 + 16);
  v14 = (v11 & 1) == 0;
  v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v16 = v11;
  v17 = *(_QWORD *)(v10 + 24);
  if (v17 >= v15 && (a4 & 1) != 0)
    goto LABEL_7;
  if (v17 >= v15 && (a4 & 1) == 0)
  {
    specialized _NativeDictionary.copy()();
LABEL_7:
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
    {
LABEL_8:
      v19 = v18[7];
      result = swift_bridgeObjectRelease(*(_QWORD *)(v19 + 8 * v12));
      *(_QWORD *)(v19 + 8 * v12) = a1;
      return result;
    }
LABEL_11:
    v18[(v12 >> 6) + 8] |= 1 << v12;
    v23 = (uint64_t *)(v18[6] + 16 * v12);
    *v23 = a2;
    v23[1] = a3;
    *(_QWORD *)(v18[7] + 8 * v12) = a1;
    v24 = v18[2];
    v25 = __OFADD__(v24, 1);
    v26 = v24 + 1;
    if (!v25)
    {
      v18[2] = v26;
      return swift_bridgeObjectRetain(a3);
    }
    goto LABEL_14;
  }
  specialized _NativeDictionary._copyOrMoveAndResize(capacity:moveElements:)(v15, a4 & 1);
  v21 = specialized __RawDictionaryStorage.find<A>(_:)(a2, a3);
  if ((v16 & 1) == (v22 & 1))
  {
    v12 = v21;
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for String);
  __break(1u);
  return result;
}

void *specialized _NativeDictionary.copy()()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *result;
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
  uint64_t v20;
  _QWORD *v21;
  int64_t v22;
  unint64_t v23;
  int64_t v24;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<String, [String]>);
  v2 = *v0;
  v3 = static _DictionaryStorage.copy(original:)(*v0);
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (void *)swift_release(v2);
    *v1 = v4;
    return result;
  }
  result = (void *)(v3 + 64);
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
    v20 = *(_QWORD *)(*(_QWORD *)(v2 + 56) + v19);
    v21 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v21 = *v17;
    v21[1] = v18;
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain(v18);
    result = (void *)swift_bridgeObjectRetain(v20);
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

uint64_t specialized RegexMessageReader.processRegexMessages(filePath:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  NSString v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  os_log_type_t v25;
  uint8_t *v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  void (*v33)(char *, uint64_t);
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  NSObject *v37;
  os_log_type_t v38;
  uint8_t *v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  uint64_t v43;
  unint64_t v44;
  unint64_t v45;
  void (*v46)(char *, uint64_t);
  char *v47;
  uint64_t v48;
  unint64_t v49;
  unint64_t v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;
  uint64_t result;
  __int128 v55;
  __int128 v56;
  uint64_t v57;
  _QWORD v58[2];
  char *v59;
  uint64_t v60;
  _OWORD v61[2];
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;

  v6 = type metadata accessor for URL(0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = __chkstk_darwin(v6);
  v10 = (char *)v58 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __chkstk_darwin(v8);
  v13 = (char *)v58 - v12;
  __chkstk_darwin(v11);
  v15 = (char *)v58 - v14;
  URL.init(fileURLWithPath:)(a1, a2);
  v16 = objc_msgSend((id)objc_opt_self(NSFileManager), "defaultManager");
  URL.path.getter();
  v18 = v17;
  v19 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v18);
  LOBYTE(v18) = objc_msgSend(v16, "fileExistsAtPath:", v19);

  if ((v18 & 1) != 0)
  {
    if (one-time initialization token for logger != -1)
      swift_once(&one-time initialization token for logger, one-time initialization function for logger);
    v20 = type metadata accessor for Logger(0);
    v21 = __swift_project_value_buffer(v20, (uint64_t)logger);
    v22 = (*(uint64_t (**)(char *, char *, uint64_t))(v7 + 16))(v10, v15, v6);
    v23 = Logger.logObject.getter(v22);
    v24 = v6;
    v25 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v23, v25))
    {
      v26 = (uint8_t *)swift_slowAlloc(12, -1);
      v27 = swift_slowAlloc(32, -1);
      v60 = a3;
      v28 = v27;
      *(_QWORD *)&v61[0] = v27;
      v59 = (char *)v21;
      *(_DWORD *)v26 = 136315138;
      v58[1] = v26 + 4;
      v29 = lazy protocol witness table accessor for type URL and conformance URL();
      v30 = dispatch thunk of CustomStringConvertible.description.getter(v24, v29);
      v32 = v31;
      v63 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v30, v31, (uint64_t *)v61);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v63, &v64);
      swift_bridgeObjectRelease(v32);
      v33 = *(void (**)(char *, uint64_t))(v7 + 8);
      v33(v10, v24);
      _os_log_impl((void *)&_mh_execute_header, v23, v25, "smsfilter: regex url: %s", v26, 0xCu);
      swift_arrayDestroy(v28, 1, (char *)&type metadata for Any + 8);
      v34 = v28;
      a3 = v60;
      swift_slowDealloc(v34, -1, -1);
      swift_slowDealloc(v26, -1, -1);
    }
    else
    {
      v33 = *(void (**)(char *, uint64_t))(v7 + 8);
      v33(v10, v24);
    }

    v48 = Data.init(contentsOf:options:)(v15, 0);
    v50 = v49;
    v51 = type metadata accessor for PropertyListDecoder(0);
    swift_allocObject(v51, *(unsigned int *)(v51 + 48), *(unsigned __int16 *)(v51 + 52));
    v52 = PropertyListDecoder.init()();
    v53 = lazy protocol witness table accessor for type Regex and conformance Regex();
    dispatch thunk of PropertyListDecoder.decode<A>(_:from:)(v61, &type metadata for Regex, v48, v50, &type metadata for Regex, v53);
    v33(v15, v24);
    swift_release(v52);
    result = outlined consume of Data._Representation(v48, v50);
    v55 = v61[0];
    v56 = v61[1];
    v57 = v62;
  }
  else
  {
    if (one-time initialization token for logger != -1)
      swift_once(&one-time initialization token for logger, one-time initialization function for logger);
    v35 = type metadata accessor for Logger(0);
    __swift_project_value_buffer(v35, (uint64_t)logger);
    v36 = (*(uint64_t (**)(char *, char *, uint64_t))(v7 + 16))(v13, v15, v6);
    v37 = Logger.logObject.getter(v36);
    v38 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v37, v38))
    {
      v39 = (uint8_t *)swift_slowAlloc(12, -1);
      v40 = swift_slowAlloc(32, -1);
      v59 = v15;
      v41 = v40;
      *(_QWORD *)&v61[0] = v40;
      v60 = a3;
      *(_DWORD *)v39 = 136315138;
      v42 = lazy protocol witness table accessor for type URL and conformance URL();
      v43 = dispatch thunk of CustomStringConvertible.description.getter(v6, v42);
      v45 = v44;
      v63 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v43, v44, (uint64_t *)v61);
      a3 = v60;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v63, &v64);
      swift_bridgeObjectRelease(v45);
      v46 = *(void (**)(char *, uint64_t))(v7 + 8);
      v46(v13, v6);
      _os_log_impl((void *)&_mh_execute_header, v37, v38, "smsfilter: regex file %s doesn't exist.", v39, 0xCu);
      swift_arrayDestroy(v41, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v41, -1, -1);
      swift_slowDealloc(v39, -1, -1);

      v47 = v59;
    }
    else
    {

      v46 = *(void (**)(char *, uint64_t))(v7 + 8);
      v46(v13, v6);
      v47 = v15;
    }
    result = ((uint64_t (*)(char *, uint64_t))v46)(v47, v6);
    v57 = 0;
    v55 = 0uLL;
    v56 = 0uLL;
  }
  *(_OWORD *)a3 = v55;
  *(_OWORD *)(a3 + 16) = v56;
  *(_QWORD *)(a3 + 32) = v57;
  return result;
}

uint64_t outlined init with take of Regex?(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Regex?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t specialized Regex.subCategories.init(from:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v13;
  uint64_t v14;
  char v15;
  uint64_t v16;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<Regex.subCategories.CodingKeys>);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = a1[3];
  v8 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v7);
  v9 = lazy protocol witness table accessor for type Regex.subCategories.CodingKeys and conformance Regex.subCategories.CodingKeys();
  dispatch thunk of Decoder.container<A>(keyedBy:)(&type metadata for Regex.subCategories.CodingKeys, &type metadata for Regex.subCategories.CodingKeys, v9, v7, v8);
  if (v1)
  {
    __swift_destroy_boxed_opaque_existential_0(a1);
  }
  else
  {
    v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String]);
    v15 = 0;
    v11 = lazy protocol witness table accessor for type [String] and conformance <A> [A]();
    KeyedDecodingContainer.decode<A>(_:forKey:)(&v16, v10, &v15, v3, v10, v11);
    v7 = v16;
    v15 = 1;
    swift_bridgeObjectRetain(v16);
    KeyedDecodingContainer.decode<A>(_:forKey:)(&v16, v10, &v15, v3, v10, v11);
    v15 = 2;
    v14 = v16;
    swift_bridgeObjectRetain(v16);
    KeyedDecodingContainer.decode<A>(_:forKey:)(&v16, v10, &v15, v3, v10, v11);
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    v13 = v16;
    swift_bridgeObjectRetain(v16);
    __swift_destroy_boxed_opaque_existential_0(a1);
    swift_bridgeObjectRelease(v13);
    swift_bridgeObjectRelease(v14);
    swift_bridgeObjectRelease(v7);
  }
  return v7;
}

uint64_t specialized Regex.init(from:)@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t result;
  _QWORD *v21;
  _QWORD *v22;
  _QWORD v23[3];
  char v24;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<Regex.CodingKeys>);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v23[-1] - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = a1[3];
  v10 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v9);
  v11 = lazy protocol witness table accessor for type Regex.CodingKeys and conformance Regex.CodingKeys();
  dispatch thunk of Decoder.container<A>(keyedBy:)(&type metadata for Regex.CodingKeys, &type metadata for Regex.CodingKeys, v11, v9, v10);
  if (v2)
    return __swift_destroy_boxed_opaque_existential_0(a1);
  v22 = a2;
  v12 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String]);
  v24 = 0;
  v13 = lazy protocol witness table accessor for type [String] and conformance <A> [A]();
  KeyedDecodingContainer.decode<A>(_:forKey:)(v23, v12, &v24, v5, v12, v13);
  v14 = v23[0];
  v24 = 1;
  swift_bridgeObjectRetain(v23[0]);
  KeyedDecodingContainer.decode<A>(_:forKey:)(v23, v12, &v24, v5, v12, v13);
  v15 = v23[0];
  v24 = 2;
  v16 = lazy protocol witness table accessor for type Regex.subCategories and conformance Regex.subCategories();
  swift_bridgeObjectRetain(v15);
  KeyedDecodingContainer.decode<A>(_:forKey:)(v23, &type metadata for Regex.subCategories, &v24, v5, &type metadata for Regex.subCategories, v16);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  v17 = v23[0];
  v18 = v23[1];
  v19 = v23[2];
  swift_bridgeObjectRetain(v23[0]);
  swift_bridgeObjectRetain(v18);
  swift_bridgeObjectRetain(v19);
  __swift_destroy_boxed_opaque_existential_0(a1);
  swift_bridgeObjectRelease(v19);
  swift_bridgeObjectRelease(v18);
  swift_bridgeObjectRelease(v17);
  swift_bridgeObjectRelease(v15);
  result = swift_bridgeObjectRelease(v14);
  v21 = v22;
  *v22 = v14;
  v21[1] = v15;
  v21[2] = v17;
  v21[3] = v18;
  v21[4] = v19;
  return result;
}

uint64_t outlined copy of Regex?(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (result)
  {
    swift_bridgeObjectRetain(result);
    swift_bridgeObjectRetain(a2);
    swift_bridgeObjectRetain(a3);
    swift_bridgeObjectRetain(a4);
    return swift_bridgeObjectRetain(a5);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type Regex.CodingKeys and conformance Regex.CodingKeys()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type Regex.CodingKeys and conformance Regex.CodingKeys;
  if (!lazy protocol witness table cache variable for type Regex.CodingKeys and conformance Regex.CodingKeys)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for Regex.CodingKeys, &type metadata for Regex.CodingKeys);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Regex.CodingKeys and conformance Regex.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type Regex.CodingKeys and conformance Regex.CodingKeys;
  if (!lazy protocol witness table cache variable for type Regex.CodingKeys and conformance Regex.CodingKeys)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for Regex.CodingKeys, &type metadata for Regex.CodingKeys);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Regex.CodingKeys and conformance Regex.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type Regex.CodingKeys and conformance Regex.CodingKeys;
  if (!lazy protocol witness table cache variable for type Regex.CodingKeys and conformance Regex.CodingKeys)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for Regex.CodingKeys, &type metadata for Regex.CodingKeys);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Regex.CodingKeys and conformance Regex.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type Regex.CodingKeys and conformance Regex.CodingKeys;
  if (!lazy protocol witness table cache variable for type Regex.CodingKeys and conformance Regex.CodingKeys)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for Regex.CodingKeys, &type metadata for Regex.CodingKeys);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Regex.CodingKeys and conformance Regex.CodingKeys);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type Regex.subCategories.CodingKeys and conformance Regex.subCategories.CodingKeys()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type Regex.subCategories.CodingKeys and conformance Regex.subCategories.CodingKeys;
  if (!lazy protocol witness table cache variable for type Regex.subCategories.CodingKeys and conformance Regex.subCategories.CodingKeys)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for Regex.subCategories.CodingKeys, &type metadata for Regex.subCategories.CodingKeys);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Regex.subCategories.CodingKeys and conformance Regex.subCategories.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type Regex.subCategories.CodingKeys and conformance Regex.subCategories.CodingKeys;
  if (!lazy protocol witness table cache variable for type Regex.subCategories.CodingKeys and conformance Regex.subCategories.CodingKeys)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for Regex.subCategories.CodingKeys, &type metadata for Regex.subCategories.CodingKeys);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Regex.subCategories.CodingKeys and conformance Regex.subCategories.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type Regex.subCategories.CodingKeys and conformance Regex.subCategories.CodingKeys;
  if (!lazy protocol witness table cache variable for type Regex.subCategories.CodingKeys and conformance Regex.subCategories.CodingKeys)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for Regex.subCategories.CodingKeys, &type metadata for Regex.subCategories.CodingKeys);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Regex.subCategories.CodingKeys and conformance Regex.subCategories.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type Regex.subCategories.CodingKeys and conformance Regex.subCategories.CodingKeys;
  if (!lazy protocol witness table cache variable for type Regex.subCategories.CodingKeys and conformance Regex.subCategories.CodingKeys)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for Regex.subCategories.CodingKeys, &type metadata for Regex.subCategories.CodingKeys);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Regex.subCategories.CodingKeys and conformance Regex.subCategories.CodingKeys);
  }
  return result;
}

uint64_t destroy for Regex(_QWORD *a1)
{
  swift_bridgeObjectRelease(*a1);
  swift_bridgeObjectRelease(a1[1]);
  swift_bridgeObjectRelease(a1[2]);
  swift_bridgeObjectRelease(a1[3]);
  return swift_bridgeObjectRelease(a1[4]);
}

uint64_t *initializeWithCopy for Regex(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = *a2;
  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  v5 = a2[2];
  v6 = a2[3];
  a1[2] = v5;
  a1[3] = v6;
  v7 = a2[4];
  a1[4] = v7;
  swift_bridgeObjectRetain(v3);
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRetain(v5);
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRetain(v7);
  return a1;
}

uint64_t *assignWithCopy for Regex(uint64_t *a1, uint64_t *a2)
{
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

  v4 = *a2;
  v5 = *a1;
  *a1 = *a2;
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRelease(v5);
  v6 = a2[1];
  v7 = a1[1];
  a1[1] = v6;
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRelease(v7);
  v8 = a2[2];
  v9 = a1[2];
  a1[2] = v8;
  swift_bridgeObjectRetain(v8);
  swift_bridgeObjectRelease(v9);
  v10 = a2[3];
  v11 = a1[3];
  a1[3] = v10;
  swift_bridgeObjectRetain(v10);
  swift_bridgeObjectRelease(v11);
  v12 = a2[4];
  v13 = a1[4];
  a1[4] = v12;
  swift_bridgeObjectRetain(v12);
  swift_bridgeObjectRelease(v13);
  return a1;
}

__n128 __swift_memcpy40_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

_QWORD *assignWithTake for Regex(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  swift_bridgeObjectRelease(*a1);
  v4 = a1[1];
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_bridgeObjectRelease(v4);
  swift_bridgeObjectRelease(a1[2]);
  v5 = a1[3];
  *((_OWORD *)a1 + 1) = *(_OWORD *)(a2 + 16);
  swift_bridgeObjectRelease(v5);
  v6 = a1[4];
  a1[4] = *(_QWORD *)(a2 + 32);
  swift_bridgeObjectRelease(v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for Regex(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 40))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for Regex(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 40) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)result = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 40) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for Regex()
{
  return &type metadata for Regex;
}

ValueMetadata *type metadata accessor for Regex.CodingKeys()
{
  return &type metadata for Regex.CodingKeys;
}

uint64_t destroy for Regex.subCategories(_QWORD *a1)
{
  swift_bridgeObjectRelease(*a1);
  swift_bridgeObjectRelease(a1[1]);
  return swift_bridgeObjectRelease(a1[2]);
}

uint64_t *initializeBufferWithCopyOfBuffer for Regex.subCategories(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *a2;
  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  v5 = a2[2];
  a1[2] = v5;
  swift_bridgeObjectRetain(v3);
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRetain(v5);
  return a1;
}

uint64_t *assignWithCopy for Regex.subCategories(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v4 = *a2;
  v5 = *a1;
  *a1 = *a2;
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRelease(v5);
  v6 = a2[1];
  v7 = a1[1];
  a1[1] = v6;
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRelease(v7);
  v8 = a2[2];
  v9 = a1[2];
  a1[2] = v8;
  swift_bridgeObjectRetain(v8);
  swift_bridgeObjectRelease(v9);
  return a1;
}

_QWORD *assignWithTake for Regex.subCategories(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  swift_bridgeObjectRelease(*a1);
  v4 = a1[1];
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_bridgeObjectRelease(v4);
  v5 = a1[2];
  a1[2] = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRelease(v5);
  return a1;
}

uint64_t getEnumTagSinglePayload for Regex.subCategories(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 24))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for Regex.subCategories(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 24) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)result = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 24) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for Regex.subCategories()
{
  return &type metadata for Regex.subCategories;
}

uint64_t getEnumTagSinglePayload for Regex.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFE)
    goto LABEL_17;
  if (a2 + 2 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 2) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 2;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 2;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 2;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 3;
  v8 = v6 - 3;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for Regex.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 2 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 2) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFE)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFD)
    return ((uint64_t (*)(void))((char *)&loc_100015A34 + 4 * byte_10001A2F5[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_100015A68 + 4 * byte_10001A2F0[v4]))();
}

uint64_t sub_100015A68(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_100015A70(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x100015A78);
  return result;
}

uint64_t sub_100015A84(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x100015A8CLL);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_100015A90(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_100015A98(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for Regex.subCategories.CodingKeys()
{
  return &type metadata for Regex.subCategories.CodingKeys;
}

uint64_t type metadata accessor for RegexMessageReader()
{
  return objc_opt_self(_TtC15extensionFilter18RegexMessageReader);
}

unint64_t lazy protocol witness table accessor for type [String] and conformance <A> [A]()
{
  unint64_t result;
  uint64_t v1;

  result = lazy protocol witness table cache variable for type [String] and conformance <A> [A];
  if (!lazy protocol witness table cache variable for type [String] and conformance <A> [A])
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [String]);
    result = swift_getWitnessTable(&protocol conformance descriptor for <A> [A], v1);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type [String] and conformance <A> [A]);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type Regex.subCategories and conformance Regex.subCategories()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type Regex.subCategories and conformance Regex.subCategories;
  if (!lazy protocol witness table cache variable for type Regex.subCategories and conformance Regex.subCategories)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for Regex.subCategories, &type metadata for Regex.subCategories);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Regex.subCategories and conformance Regex.subCategories);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type URL and conformance URL()
{
  unint64_t result;
  uint64_t v1;

  result = lazy protocol witness table cache variable for type URL and conformance URL;
  if (!lazy protocol witness table cache variable for type URL and conformance URL)
  {
    v1 = type metadata accessor for URL(255);
    result = swift_getWitnessTable(&protocol conformance descriptor for URL, v1);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type URL and conformance URL);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type Regex and conformance Regex()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type Regex and conformance Regex;
  if (!lazy protocol witness table cache variable for type Regex and conformance Regex)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for Regex, &type metadata for Regex);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Regex and conformance Regex);
  }
  return result;
}

_QWORD *__swift_allocate_boxed_opaque_existential_0(_QWORD *a1)
{
  _QWORD *v1;
  uint64_t v2;

  v1 = a1;
  if ((*(_BYTE *)(*(_QWORD *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (_QWORD *)v2;
  }
  return v1;
}

Swift::OpaquePointer *templateTestRegexList.unsafeMutableAddressor()
{
  if (one-time initialization token for templateTestRegexList != -1)
    swift_once(&one-time initialization token for templateTestRegexList, one-time initialization function for templateTestRegexList);
  return &templateTestRegexList;
}

Swift::OpaquePointer *inputSmsList.unsafeMutableAddressor()
{
  if (one-time initialization token for inputSmsList != -1)
    swift_once(&one-time initialization token for inputSmsList, one-time initialization function for inputSmsList);
  return &inputSmsList;
}

void one-time initialization function for promoTestData()
{
  promoTestData._rawValue = &outlined read-only object #0 of one-time initialization function for promoTestData;
}

Swift::OpaquePointer *promoTestData.unsafeMutableAddressor()
{
  if (one-time initialization token for promoTestData != -1)
    swift_once(&one-time initialization token for promoTestData, one-time initialization function for promoTestData);
  return &promoTestData;
}

void one-time initialization function for inputSmsList()
{
  inputSmsList._rawValue = &outlined read-only object #0 of one-time initialization function for inputSmsList;
}

void one-time initialization function for templateTestRegexList()
{
  templateTestRegexList._rawValue = &outlined read-only object #0 of one-time initialization function for templateTestRegexList;
}

void one-time initialization function for _smsfilters()
{
  _smsfilters._rawValue = &_swiftEmptyArrayStorage;
}

id MessageFilterExtension.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), "init");
}

id MessageFilterExtension.init()()
{
  void *v0;
  id v1;
  uint64_t v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  uint64_t countAndFlagsBits;
  void *object;
  unint64_t MySim;
  unint64_t v13;
  uint64_t v14;
  unint64_t *v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  NSObject *v19;
  os_log_type_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  void *rawValue;
  uint64_t v28;
  uint64_t v29;
  os_log_type_t v30;
  uint8_t *v31;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  objc_super v38;

  v38.receiver = v0;
  v38.super_class = (Class)swift_getObjectType(v0);
  v1 = objc_msgSendSuper2(&v38, "init");
  v2 = one-time initialization token for logger;
  v3 = v1;
  if (v2 != -1)
    swift_once(&one-time initialization token for logger, one-time initialization function for logger);
  v4 = type metadata accessor for Logger(0);
  v5 = __swift_project_value_buffer(v4, (uint64_t)logger);
  v6 = Logger.logObject.getter(v5);
  v7 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc(12, -1);
    v9 = swift_slowAlloc(32, -1);
    v35 = v9;
    *(_DWORD *)v8 = 136446210;
    if (one-time initialization token for smsfilterVersion != -1)
      swift_once(&one-time initialization token for smsfilterVersion, one-time initialization function for smsfilterVersion);
    countAndFlagsBits = smsfilterVersion._countAndFlagsBits;
    object = smsfilterVersion._object;
    swift_bridgeObjectRetain(smsfilterVersion._object);
    v37 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(countAndFlagsBits, (unint64_t)object, &v35);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v37, &v38);
    swift_bridgeObjectRelease(object);
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "SMSfilter: init, ver: %{public}s", v8, 0xCu);
    swift_arrayDestroy(v9, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v9, -1, -1);
    swift_slowDealloc(v8, -1, -1);
  }

  MySim = (unint64_t)getMySimRegions()();
  if (MySim)
  {
    v13 = MySim;
    specialized MessageFilterExtension.handleSimRemoval()();
    v14 = *(_QWORD *)(v13 + 16);
    if (v14)
    {
      swift_bridgeObjectRetain(v13);
      v15 = (unint64_t *)(v13 + 40);
      do
      {
        v16 = *(v15 - 1);
        v17 = *v15;
        swift_bridgeObjectRetain(*v15);
        specialized MessageFilterExtension.initSMSFilter(for:)(v16, v17);
        swift_bridgeObjectRelease(v17);
        v15 += 2;
        --v14;
      }
      while (v14);
      swift_bridgeObjectRelease(v13);
    }
    v18 = swift_bridgeObjectRetain(v13);
    v19 = Logger.logObject.getter(v18);
    v20 = static os_log_type_t.error.getter();
    if (!os_log_type_enabled(v19, v20))
    {

      swift_bridgeObjectRelease_n(v13, 2);
      return v3;
    }
    v21 = swift_slowAlloc(22, -1);
    v22 = swift_slowAlloc(32, -1);
    v37 = v22;
    *(_DWORD *)v21 = 136315394;
    v23 = swift_bridgeObjectRetain(v13);
    v24 = Array.description.getter(v23, &type metadata for String);
    v26 = v25;
    swift_bridgeObjectRelease(v13);
    v35 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v24, v26, &v37);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v35, &v36);
    swift_bridgeObjectRelease_n(v13, 2);
    swift_bridgeObjectRelease(v26);
    *(_WORD *)(v21 + 12) = 2048;
    if (one-time initialization token for _smsfilters != -1)
      swift_once(&one-time initialization token for _smsfilters, one-time initialization function for _smsfilters);
    swift_beginAccess(&_smsfilters, &v35, 0, 0);
    rawValue = _smsfilters._rawValue;
    if ((unint64_t)_smsfilters._rawValue >> 62)
    {
      if ((uint64_t)_smsfilters._rawValue < 0)
        v33 = (unint64_t)_smsfilters._rawValue;
      else
        v33 = (unint64_t)_smsfilters._rawValue & 0xFFFFFFFFFFFFFF8;
      swift_bridgeObjectRetain(_smsfilters._rawValue);
      v28 = _CocoaArrayWrapper.endIndex.getter(v33);
      swift_bridgeObjectRelease(rawValue);
    }
    else
    {
      v28 = *(_QWORD *)(((unint64_t)_smsfilters._rawValue & 0xFFFFFFFFFFFFF8) + 0x10);
    }
    v34 = v28;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v34, &v35);
    _os_log_impl((void *)&_mh_execute_header, v19, v20, "SMSfilter: init done, sim-regions = %s, #filters = %ld", (uint8_t *)v21, 0x16u);
    swift_arrayDestroy(v22, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v22, -1, -1);
    v29 = v21;
    goto LABEL_20;
  }
  v19 = Logger.logObject.getter(0);
  v30 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v19, v30))
  {
    v31 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v31 = 0;
    _os_log_impl((void *)&_mh_execute_header, v19, v30, "smsfilter: no supported region", v31, 2u);
    v29 = (uint64_t)v31;
LABEL_20:
    swift_slowDealloc(v29, -1, -1);
  }

  return v3;
}

uint64_t specialized Array.remove(at:)(unint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;
  int isUniquelyReferenced_nonNull_bridgeObject;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t result;
  char v13;

  v3 = *v1;
  isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject(*v1);
  *v1 = v3;
  if (!isUniquelyReferenced_nonNull_bridgeObject || v3 < 0 || (v3 & 0x4000000000000000) != 0)
  {
    v3 = specialized _ArrayBuffer._consumeAndCreateNew()(v3);
    *v1 = v3;
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
      v11 = memmove((void *)(v9 + 32), (const void *)(v9 + 40), 8 * v8);
      *(_QWORD *)(v5 + 16) = v7;
      specialized Array._endMutation()(v11);
      return v10;
    }
  }
  v13 = 2;
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.moveInitialize with negative count", 55, 2, "Swift/UnsafePointer.swift", 25, v13, 1046, 0);
  __break(1u);
  return result;
}

id MessageFilterExtension.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType(v0);
  return objc_msgSendSuper2(&v2, "dealloc");
}

void MessageFilterExtension.handle(_:context:completion:)(uint64_t a1, uint64_t a2, void (*a3)(Class))
{
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  unint64_t rawValue;
  uint64_t v10;
  void (*v11)(Class);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  ILMessageFilterCapabilitiesQueryResponse v16;
  uint64_t v17;
  unint64_t v18;
  NSObject *v19;
  os_log_type_t v20;
  uint8_t *v21;
  _BYTE v22[24];
  _BYTE v23[128];
  _BYTE v24[128];
  _BYTE v25[32];

  if (one-time initialization token for logger == -1)
    goto LABEL_2;
  while (1)
  {
    swift_once(&one-time initialization token for logger, one-time initialization function for logger);
LABEL_2:
    v4 = type metadata accessor for Logger(0);
    v5 = __swift_project_value_buffer(v4, (uint64_t)logger);
    v6 = Logger.logObject.getter(v5);
    v7 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v6, v7))
    {
      v8 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, v7, "smsfilter: capabilitiesQueryRequest", v8, 2u);
      swift_slowDealloc(v8, -1, -1);
    }

    if (one-time initialization token for _smsfilters != -1)
      swift_once(&one-time initialization token for _smsfilters, one-time initialization function for _smsfilters);
    swift_beginAccess(&_smsfilters, v25, 0, 0);
    rawValue = (unint64_t)_smsfilters._rawValue;
    if ((unint64_t)_smsfilters._rawValue >> 62)
      break;
    v10 = *(_QWORD *)(((unint64_t)_smsfilters._rawValue & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain(_smsfilters._rawValue);
    if (!v10)
      goto LABEL_26;
LABEL_8:
    v11 = a3;
    v12 = 4;
    v13 = 0;
    if ((rawValue & 0xC000000000000001) == 0)
    {
LABEL_12:
      v14 = *(_QWORD *)(rawValue + 8 * v12);
      swift_retain(v14);
      a3 = (void (*)(Class))(v13 + 1);
      if (__OFADD__(v13, 1))
        goto LABEL_20;
      goto LABEL_13;
    }
    while (1)
    {
      v14 = specialized _ArrayBuffer._getElementSlowPath(_:)(v13, rawValue);
      a3 = (void (*)(Class))(v13 + 1);
      if (__OFADD__(v13, 1))
        break;
LABEL_13:
      v15 = v14 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__region;
      swift_beginAccess(v14 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__region, v22, 0, 0);
      outlined init with take of Region?(v15, (uint64_t)v23);
      outlined init with take of Region?((uint64_t)v23, (uint64_t)v24);
      if (_s15extensionFilter6RegionVSgWOg((uint64_t)v24) == 1)
      {
        __break(1u);
        return;
      }
      if (*(_BYTE *)(v15 + 104) == 1)
      {
        swift_bridgeObjectRelease(rawValue);
        v16.super.isa = SmsFilter.subClassificationCapabilities()().super.isa;
        swift_release(v14);
        v11(v16.super.isa);
        goto LABEL_30;
      }
      swift_release(v14);
      if (a3 == (void (*)(Class))v10)
      {
        v17 = swift_bridgeObjectRelease(rawValue);
        a3 = v11;
        goto LABEL_27;
      }
      v13 = ++v12 - 4;
      if ((rawValue & 0xC000000000000001) == 0)
        goto LABEL_12;
    }
LABEL_20:
    __break(1u);
  }
  if ((uint64_t)_smsfilters._rawValue < 0)
    v18 = (unint64_t)_smsfilters._rawValue;
  else
    v18 = (unint64_t)_smsfilters._rawValue & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain(_smsfilters._rawValue);
  v10 = _CocoaArrayWrapper.endIndex.getter(v18);
  if (v10)
    goto LABEL_8;
LABEL_26:
  v17 = swift_bridgeObjectRelease(rawValue);
LABEL_27:
  v19 = Logger.logObject.getter(v17);
  v20 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v19, v20))
  {
    v21 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v21 = 0;
    _os_log_impl((void *)&_mh_execute_header, v19, v20, "smsfilter: sub-classification feature is not available", v21, 2u);
    swift_slowDealloc(v21, -1, -1);
  }

  v16.super.isa = (Class)objc_msgSend(objc_allocWithZone((Class)ILMessageFilterCapabilitiesQueryResponse), "init");
  a3(v16.super.isa);
LABEL_30:

}

void MessageFilterExtension.handle(_:context:completion:)(void *a1, uint64_t a2, void (*a3)(id))
{
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  NSObject *v17;
  os_log_type_t v18;
  uint8_t *v19;
  id v20;

  if (one-time initialization token for logger != -1)
    swift_once(&one-time initialization token for logger, one-time initialization function for logger);
  v5 = type metadata accessor for Logger(0);
  v6 = __swift_project_value_buffer(v5, (uint64_t)logger);
  v7 = Logger.logObject.getter(v6);
  v8 = static os_log_type_t.default.getter(v7);
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "smsfilter: queryRequest", v9, 2u);
    swift_slowDealloc(v9, -1, -1);
  }

  v10 = specialized MessageFilterExtension.offlineAction(for:)(a1);
  v12 = v11;
  v20 = objc_msgSend(objc_allocWithZone((Class)ILMessageFilterQueryResponse), "init");
  v13 = objc_msgSend(v20, "setSubAction:", 0);
  if ((unint64_t)(v12 - 10001) >= 3 && v12)
  {
    v17 = Logger.logObject.getter(v13);
    v18 = static os_log_type_t.error.getter(v17);
    if (os_log_type_enabled(v17, v18))
    {
      v19 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v19 = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, v18, "unexpected offline sub-action", v19, 2u);
      swift_slowDealloc(v19, -1, -1);
    }

  }
  else
  {
    objc_msgSend(v20, "setSubAction:", v12);
  }
  if (v10 <= 4 && ((1 << v10) & 0x1A) != 0)
  {
    objc_msgSend(v20, "setAction:", v10);
    a3(v20);
  }
  else
  {
    v14 = Logger.logObject.getter(v20);
    v15 = static os_log_type_t.error.getter(v14);
    if (os_log_type_enabled(v14, v15))
    {
      v16 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v16 = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, v15, "unexpected offline action", v16, 2u);
      swift_slowDealloc(v16, -1, -1);
    }

  }
}

void *closure #1 in serialize<A>(_:at:)(void *__src, uint64_t a2, void *__dst, uint64_t a4)
{
  uint64_t v4;

  if (__src)
    v4 = a2 - (_QWORD)__src;
  else
    v4 = 0;
  if (!__dst)
  {
    if (v4 <= 0)
      return __src;
LABEL_10:
    __src = (void *)_fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutableRawBufferPointer.copyMemory source has too many elements", 69, 2, "Swift/UnsafeRawBufferPointer.swift", 34, 2, 487, 0);
    __break(1u);
    return __src;
  }
  if (a4 - (uint64_t)__dst < v4)
    goto LABEL_10;
  if (__src)
    return memmove(__dst, __src, a2 - (_QWORD)__src);
  return __src;
}

uint64_t thunk for @escaping @callee_guaranteed () -> (@unowned Int)@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = a1();
  *a2 = result;
  return result;
}

uint64_t specialized _ArrayBuffer._consumeAndCreateNew()(uint64_t a1)
{
  uint64_t v2;
  uint64_t v4;

  if ((unint64_t)a1 >> 62)
  {
    if (a1 < 0)
      v4 = a1;
    else
      v4 = a1 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a1);
    v2 = _CocoaArrayWrapper.endIndex.getter(v4);
    swift_bridgeObjectRelease(a1);
  }
  else
  {
    v2 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v2, 0, a1);
}

uint64_t specialized MessageFilterExtension.handleSimRemoval()()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  char *v3;
  unint64_t rawValue;
  uint64_t v5;
  __int128 v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  id v13;
  void *v14;
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void (*v22)(uint64_t *__return_ptr, uint64_t, uint64_t);
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  BOOL v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  char *v33;
  uint64_t v34;
  NSObject *v35;
  os_log_type_t v36;
  uint8_t *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  NSObject *v46;
  os_log_type_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  unint64_t v52;
  uint64_t v53;
  uint64_t v54;
  char v55;
  uint64_t *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  char v62;
  void *v63;
  uint64_t result;
  uint64_t v65;
  char *v66;
  __int128 v67;
  char *v68;
  uint64_t v69;
  unint64_t v70;
  uint64_t v71;
  char *v72;
  uint64_t v73;
  unint64_t v74;
  unint64_t v75;
  uint64_t *v76;
  unint64_t v77;
  uint64_t v78;
  unint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  _BYTE v84[128];
  _BYTE v85[128];
  uint64_t v86;
  _BYTE v87[128];
  _BYTE v88[128];
  uint64_t v89;
  uint64_t v90[16];
  _BYTE v91[136];

  v0 = type metadata accessor for Logger(0);
  v1 = *(_QWORD *)(v0 - 8);
  __chkstk_darwin(v0);
  v3 = (char *)&v65 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (one-time initialization token for _smsfilters != -1)
    goto LABEL_79;
  while (1)
  {
    swift_beginAccess(&_smsfilters, &v89, 0, 0);
    rawValue = (unint64_t)_smsfilters._rawValue;
    if (!((unint64_t)_smsfilters._rawValue >> 62))
    {
      v5 = *(_QWORD *)(((unint64_t)_smsfilters._rawValue & 0xFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain(_smsfilters._rawValue);
      if (!v5)
        return swift_bridgeObjectRelease(rawValue);
      goto LABEL_4;
    }
    v63 = (uint64_t)_smsfilters._rawValue < 0
        ? _smsfilters._rawValue
        : (void *)((unint64_t)_smsfilters._rawValue & 0xFFFFFFFFFFFFFF8);
    swift_bridgeObjectRetain(_smsfilters._rawValue);
    v5 = _CocoaArrayWrapper.endIndex.getter(v63);
    if (!v5)
      return swift_bridgeObjectRelease(rawValue);
LABEL_4:
    v7 = 0;
    v75 = rawValue & 0xC000000000000001;
    v68 = (char *)(rawValue + 32);
    v69 = rawValue & 0xFFFFFFFFFFFFFF8;
    *(_QWORD *)&v6 = 136315138;
    v67 = v6;
    v66 = (char *)&type metadata for Any + 8;
    v73 = v5;
    v74 = rawValue;
    v70 = v1;
    v71 = v0;
    v72 = v3;
    while (1)
    {
      if (v75)
      {
        v9 = specialized _ArrayBuffer._getElementSlowPath(_:)(v7, rawValue);
        v10 = v7 + 1;
        if (__OFADD__(v7, 1))
          goto LABEL_76;
      }
      else
      {
        if (v7 >= *(_QWORD *)(v69 + 16))
          goto LABEL_77;
        v9 = swift_retain(*(_QWORD *)&v68[8 * v7]);
        v10 = v7 + 1;
        if (__OFADD__(v7, 1))
          goto LABEL_76;
      }
      v79 = v10;
      v81 = v9;
      v11 = (uint64_t *)(v9 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__region);
      swift_beginAccess(v9 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__region, &v86, 0, 0);
      outlined init with take of Region?((uint64_t)v11, (uint64_t)v87);
      outlined init with take of Region?((uint64_t)v87, (uint64_t)v88);
      if (_s15extensionFilter6RegionVSgWOg((uint64_t)v88) == 1)
      {
        __break(1u);
LABEL_86:
        result = swift_release(v81);
        __break(1u);
        return result;
      }
      v12 = v11[1];
      v78 = *v11;
      v76 = v11;
      v80 = v12;
      swift_bridgeObjectRetain(v12);
      v13 = getActiveSimRegions();
      v77 = v7;
      if (!v13)
      {
        if (one-time initialization token for logger != -1)
          swift_once(&one-time initialization token for logger, one-time initialization function for logger);
        v34 = __swift_project_value_buffer(v0, (uint64_t)logger);
        v35 = Logger.logObject.getter(v34);
        v36 = static os_log_type_t.error.getter();
        if (os_log_type_enabled(v35, v36))
        {
          v37 = (uint8_t *)swift_slowAlloc(2, -1);
          *(_WORD *)v37 = 0;
          _os_log_impl((void *)&_mh_execute_header, v35, v36, "smsfilter: no supported active sim-region", v37, 2u);
          swift_slowDealloc(v37, -1, -1);
        }
        swift_bridgeObjectRelease(v80);

        goto LABEL_56;
      }
      v14 = v13;
      v15 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v13, &type metadata for String);

      v82 = *(_QWORD *)(v15 + 16);
      if (v82)
        break;
      swift_bridgeObjectRelease(v15);
      v16 = (char *)_swiftEmptyArrayStorage;
LABEL_49:
      v38 = *((_QWORD *)v16 + 2);
      v3 = v72;
      v39 = v80;
      if (v38)
      {
        v40 = *((_QWORD *)v16 + 4);
        v41 = *((_QWORD *)v16 + 5);
        if (v40 == v78 && v41 == v80
          || (v42 = _stringCompareWithSmolCheck(_:_:expecting:)(v40, v41, v78, v80, 0), v39 = v80, (v42 & 1) != 0))
        {
LABEL_53:
          swift_bridgeObjectRelease(v39);
          swift_bridgeObjectRelease(v16);
          v5 = v73;
          rawValue = v74;
          goto LABEL_7;
        }
        if (v38 != 1)
        {
          v53 = *((_QWORD *)v16 + 6);
          v54 = *((_QWORD *)v16 + 7);
          if (v53 == v78 && v54 == v80)
            goto LABEL_53;
          v55 = _stringCompareWithSmolCheck(_:_:expecting:)(v53, v54, v78, v80, 0);
          v39 = v80;
          if ((v55 & 1) != 0)
            goto LABEL_53;
          if (v38 != 2)
          {
            v56 = (uint64_t *)(v16 + 72);
            v57 = 2;
            do
            {
              v58 = v57 + 1;
              if (__OFADD__(v57, 1))
                goto LABEL_78;
              v59 = *(v56 - 1);
              v60 = *v56;
              if (v59 == v78 && v60 == v39)
                goto LABEL_53;
              v62 = _stringCompareWithSmolCheck(_:_:expecting:)(v59, v60, v78, v80, 0);
              v39 = v80;
              if ((v62 & 1) != 0)
                goto LABEL_53;
              v56 += 2;
              ++v57;
            }
            while (v58 != v38);
          }
        }
      }
      swift_bridgeObjectRelease(v39);
      swift_bridgeObjectRelease(v16);
      v5 = v73;
      rawValue = v74;
LABEL_56:
      v43 = v81;
      if (one-time initialization token for logger != -1)
        swift_once(&one-time initialization token for logger, one-time initialization function for logger);
      v44 = __swift_project_value_buffer(v0, (uint64_t)logger);
      (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v3, v44, v0);
      v45 = swift_retain(v43);
      v46 = Logger.logObject.getter(v45);
      v47 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v46, v47))
      {
        v48 = swift_slowAlloc(12, -1);
        v49 = swift_slowAlloc(32, -1);
        v83 = v49;
        *(_DWORD *)v48 = v67;
        v50 = v76;
        outlined init with take of Region?((uint64_t)v76, (uint64_t)v84);
        outlined init with take of Region?((uint64_t)v84, (uint64_t)v85);
        if (_s15extensionFilter6RegionVSgWOg((uint64_t)v85) == 1)
          goto LABEL_86;
        v51 = *v50;
        v52 = v50[1];
        swift_bridgeObjectRetain(v52);
        *(_QWORD *)(v48 + 4) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v51, v52, &v83);
        swift_release(v81);
        swift_bridgeObjectRelease(v52);
        _os_log_impl((void *)&_mh_execute_header, v46, v47, "smsfilter: remove filter instance for (%s)", (uint8_t *)v48, 0xCu);
        swift_arrayDestroy(v49, 1, v66);
        swift_slowDealloc(v49, -1, -1);
        swift_slowDealloc(v48, -1, -1);

        (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
        v5 = v73;
        rawValue = v74;
      }
      else
      {

        swift_release(v43);
        (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
      }
      swift_beginAccess(&_smsfilters, v85, 33, 0);
      v8 = specialized Array.remove(at:)(v77);
      swift_endAccess(v85);
      SmsFilter.cleanup()();
      swift_release(v8);
LABEL_7:
      swift_release(v81);
      v7 = v79;
      if (v79 == v5)
        return swift_bridgeObjectRelease(rawValue);
    }
    v1 = 0;
    v3 = (char *)(v15 + 32);
    v16 = (char *)_swiftEmptyArrayStorage;
    while (v1 < *(_QWORD *)(v15 + 16))
    {
      v17 = &v3[16 * v1];
      v19 = *(_QWORD *)v17;
      v18 = *((_QWORD *)v17 + 1);
      v20 = one-time initialization token for sharedRegionProperties;
      swift_bridgeObjectRetain(v18);
      if (v20 != -1)
        swift_once(&one-time initialization token for sharedRegionProperties, one-time initialization function for sharedRegionProperties);
      v21 = static RegionPropertiesReader.sharedRegionProperties;
      v22 = *(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(*(_QWORD *)static RegionPropertiesReader.sharedRegionProperties
                                                                           + 136);
      swift_retain(static RegionPropertiesReader.sharedRegionProperties);
      v22(v90, v19, v18);
      swift_release(v21);
      outlined release of Region?(v90);
      outlined init with take of Region?((uint64_t)v90, (uint64_t)v91);
      if (_s15extensionFilter6RegionVSgWOg((uint64_t)v91) != 1)
      {
        v23 = *((_QWORD *)v16 + 2);
        if (!v23)
          goto LABEL_37;
        v24 = *((_QWORD *)v16 + 4);
        v25 = *((_QWORD *)v16 + 5);
        if ((v24 != v19 || v25 != v18)
          && (_stringCompareWithSmolCheck(_:_:expecting:)(v24, v25, v19, v18, 0) & 1) == 0)
        {
          if (v23 == 1)
          {
LABEL_37:
            if ((swift_isUniquelyReferenced_nonNull_native(v16) & 1) == 0)
              v16 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v23 + 1, 1, v16);
            v32 = *((_QWORD *)v16 + 2);
            v31 = *((_QWORD *)v16 + 3);
            if (v32 >= v31 >> 1)
              v16 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v31 > 1), v32 + 1, 1, v16);
            *((_QWORD *)v16 + 2) = v32 + 1;
            v33 = &v16[16 * v32];
            *((_QWORD *)v33 + 4) = v19;
            *((_QWORD *)v33 + 5) = v18;
            goto LABEL_19;
          }
          v26 = (uint64_t *)(v16 + 56);
          v0 = 1;
          while (1)
          {
            v27 = *(v26 - 1);
            v28 = *v26;
            v29 = v27 == v19 && v28 == v18;
            if (v29 || (_stringCompareWithSmolCheck(_:_:expecting:)(v27, v28, v19, v18, 0) & 1) != 0)
              break;
            v30 = v0 + 1;
            if (__OFADD__(v0, 1))
              goto LABEL_75;
            v26 += 2;
            ++v0;
            if (v30 == v23)
              goto LABEL_37;
          }
        }
      }
      swift_bridgeObjectRelease(v18);
LABEL_19:
      if (++v1 == v82)
      {
        swift_bridgeObjectRelease(v15);
        v1 = v70;
        v0 = v71;
        goto LABEL_49;
      }
    }
    __break(1u);
LABEL_75:
    __break(1u);
LABEL_76:
    __break(1u);
LABEL_77:
    __break(1u);
LABEL_78:
    __break(1u);
LABEL_79:
    swift_once(&one-time initialization token for _smsfilters, one-time initialization function for _smsfilters);
  }
}

void specialized MessageFilterExtension.initSMSFilter(for:)(uint64_t a1, unint64_t a2)
{
  unint64_t rawValue;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  os_log_type_t v22;
  uint8_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  os_log_type_t v29;
  uint8_t *v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  NSObject *v37;
  os_log_type_t v38;
  uint8_t *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47[3];
  _BYTE v48[24];
  uint64_t v49;
  uint64_t v50;
  uint64_t v51[16];
  _BYTE v52[32];

  if (one-time initialization token for _smsfilters == -1)
    goto LABEL_2;
  while (1)
  {
    swift_once(&one-time initialization token for _smsfilters, one-time initialization function for _smsfilters);
LABEL_2:
    swift_beginAccess(&_smsfilters, v52, 0, 0);
    rawValue = (unint64_t)_smsfilters._rawValue;
    if ((unint64_t)_smsfilters._rawValue >> 62)
    {
      v43 = (uint64_t)_smsfilters._rawValue < 0
          ? _smsfilters._rawValue
          : (void *)((unint64_t)_smsfilters._rawValue & 0xFFFFFFFFFFFFFF8);
      swift_bridgeObjectRetain(_smsfilters._rawValue);
      v5 = _CocoaArrayWrapper.endIndex.getter(v43);
    }
    else
    {
      v5 = *(_QWORD *)(((unint64_t)_smsfilters._rawValue & 0xFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain(_smsfilters._rawValue);
    }
    if (!v5)
      break;
    v6 = 4;
    v7 = 0;
    if ((rawValue & 0xC000000000000001) == 0)
    {
LABEL_9:
      v8 = *(_QWORD *)(rawValue + 8 * v6);
      swift_retain(v8);
      v9 = v7 + 1;
      if (__OFADD__(v7, 1))
        goto LABEL_41;
      goto LABEL_10;
    }
    while (1)
    {
      v8 = specialized _ArrayBuffer._getElementSlowPath(_:)(v7, rawValue);
      v9 = v7 + 1;
      if (__OFADD__(v7, 1))
        break;
LABEL_10:
      v10 = (_QWORD *)(v8 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__region);
      swift_beginAccess(v8 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__region, v48, 0, 0);
      outlined init with take of Region?((uint64_t)v10, (uint64_t)&v49);
      outlined init with take of Region?((uint64_t)&v49, (uint64_t)v51);
      if (_s15extensionFilter6RegionVSgWOg((uint64_t)v51) == 1)
      {
        __break(1u);
        return;
      }
      v11 = v10[1];
      v12 = *v10 == a1 && v11 == a2;
      if (v12 || (_stringCompareWithSmolCheck(_:_:expecting:)(*v10, v11, a1, a2, 0) & 1) != 0)
      {
        swift_bridgeObjectRelease(rawValue);
        if (one-time initialization token for logger != -1)
          swift_once(&one-time initialization token for logger, one-time initialization function for logger);
        v19 = type metadata accessor for Logger(0);
        __swift_project_value_buffer(v19, (uint64_t)logger);
        v20 = swift_bridgeObjectRetain_n(a2, 2);
        v21 = Logger.logObject.getter(v20);
        v22 = static os_log_type_t.default.getter();
        if (os_log_type_enabled(v21, v22))
        {
          v23 = (uint8_t *)swift_slowAlloc(12, -1);
          v24 = swift_slowAlloc(32, -1);
          v47[0] = v24;
          *(_DWORD *)v23 = 136315138;
          swift_bridgeObjectRetain(a2);
          v44 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(a1, a2, v47);
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v44, &v45);
          swift_bridgeObjectRelease_n(a2, 3);
          _os_log_impl((void *)&_mh_execute_header, v21, v22, "smsfilter: found a matching smsfilter, update filter for region: (%s)", v23, 0xCu);
          swift_arrayDestroy(v24, 1, (char *)&type metadata for Any + 8);
          swift_slowDealloc(v24, -1, -1);
          swift_slowDealloc(v23, -1, -1);

        }
        else
        {

          swift_bridgeObjectRelease_n(a2, 2);
        }
        SmsFilter.update()();
        goto LABEL_40;
      }
      swift_release(v8);
      if (v9 == v5)
        goto LABEL_19;
      v7 = ++v6 - 4;
      if ((rawValue & 0xC000000000000001) == 0)
        goto LABEL_9;
    }
LABEL_41:
    __break(1u);
  }
LABEL_19:
  swift_bridgeObjectRelease(rawValue);
  if (one-time initialization token for logger != -1)
    swift_once(&one-time initialization token for logger, one-time initialization function for logger);
  v13 = type metadata accessor for Logger(0);
  __swift_project_value_buffer(v13, (uint64_t)logger);
  v14 = swift_bridgeObjectRetain_n(a2, 2);
  v15 = Logger.logObject.getter(v14);
  v16 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v15, v16))
  {
    v17 = (uint8_t *)swift_slowAlloc(12, -1);
    v18 = swift_slowAlloc(32, -1);
    v51[0] = v18;
    *(_DWORD *)v17 = 136315138;
    swift_bridgeObjectRetain(a2);
    v49 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(a1, a2, v51);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v49, &v50);
    swift_bridgeObjectRelease_n(a2, 3);
    _os_log_impl((void *)&_mh_execute_header, v15, v16, "smsfilter: no matching smsfilter found for simRegion: (%s), so add one!", v17, 0xCu);
    swift_arrayDestroy(v18, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v18, -1, -1);
    swift_slowDealloc(v17, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n(a2, 2);
  }
  v25 = type metadata accessor for SmsFilter(0);
  swift_allocObject(v25, *(unsigned int *)(v25 + 48), *(unsigned __int16 *)(v25 + 52));
  swift_bridgeObjectRetain(a2);
  v8 = SmsFilter.init(for:)(a1, a2);
  v26 = v8 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__region;
  swift_beginAccess(v8 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__region, v47, 0, 0);
  outlined init with take of Region?(v26, (uint64_t)&v49);
  outlined init with take of Region?((uint64_t)&v49, (uint64_t)v51);
  if (_s15extensionFilter6RegionVSgWOg((uint64_t)v51) == 1)
  {
    v27 = swift_bridgeObjectRetain_n(a2, 2);
    v28 = Logger.logObject.getter(v27);
    v29 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v28, v29))
    {
      v30 = (uint8_t *)swift_slowAlloc(12, -1);
      v31 = swift_slowAlloc(32, -1);
      v44 = v31;
      *(_DWORD *)v30 = 136315138;
      swift_bridgeObjectRetain(a2);
      v46 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(a1, a2, &v44);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v46, v47);
      swift_bridgeObjectRelease_n(a2, 3);
      _os_log_impl((void *)&_mh_execute_header, v28, v29, "smsfilter: no active filter for sim region : (%s)", v30, 0xCu);
      swift_arrayDestroy(v31, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v31, -1, -1);
      swift_slowDealloc(v30, -1, -1);
      swift_release(v8);

      return;
    }

    swift_bridgeObjectRelease_n(a2, 2);
  }
  else
  {
    swift_beginAccess(&_smsfilters, &v44, 33, 0);
    v32 = swift_retain(v8);
    specialized Array._makeUniqueAndReserveCapacityIfNotUnique()(v32);
    v34 = *(_QWORD *)(((unint64_t)_smsfilters._rawValue & 0xFFFFFFFFFFFFFF8) + 0x10);
    v33 = *(_QWORD *)(((unint64_t)_smsfilters._rawValue & 0xFFFFFFFFFFFFFF8) + 0x18);
    if (v34 >= v33 >> 1)
      specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v33 > 1, v34 + 1, 1);
    v35 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v34, v8);
    specialized Array._endMutation()(v35);
    swift_endAccess(&v44);
    v36 = swift_bridgeObjectRetain_n(a2, 2);
    v37 = Logger.logObject.getter(v36);
    v38 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v37, v38))
    {
      v39 = (uint8_t *)swift_slowAlloc(12, -1);
      v40 = swift_slowAlloc(32, -1);
      v44 = v40;
      *(_DWORD *)v39 = 136315138;
      swift_bridgeObjectRetain(a2);
      v46 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(a1, a2, &v44);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v46, v47);
      swift_bridgeObjectRelease_n(a2, 3);
      _os_log_impl((void *)&_mh_execute_header, v37, v38, "smsfilter: new filter instance for (%s) created.", v39, 0xCu);
      swift_arrayDestroy(v40, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v40, -1, -1);
      swift_slowDealloc(v39, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n(a2, 2);
    }
    v41 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Any>);
    v42 = swift_allocObject(v41, 64, 7);
    *(_OWORD *)(v42 + 16) = xmmword_100019D50;
    *(_QWORD *)(v42 + 56) = v25;
    *(_QWORD *)(v42 + 32) = v8;
    swift_retain(v8);
    print(_:separator:terminator:)(v42, 32, 0xE100000000000000, 10, 0xE100000000000000);
    swift_bridgeObjectRelease(v42);
  }
LABEL_40:
  swift_release(v8);
}

void specialized MessageFilterExtension.handle(_:context:completion:)(void (**a1)(_QWORD, _QWORD))
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  unint64_t rawValue;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  ILMessageFilterCapabilitiesQueryResponse v14;
  unint64_t v15;
  uint64_t v16;
  NSObject *v17;
  os_log_type_t v18;
  uint8_t *v19;
  _BYTE v20[24];
  _BYTE v21[128];
  _BYTE v22[128];
  _BYTE v23[32];

  if (one-time initialization token for logger == -1)
    goto LABEL_2;
  while (1)
  {
    swift_once(&one-time initialization token for logger, one-time initialization function for logger);
LABEL_2:
    v2 = type metadata accessor for Logger(0);
    v3 = __swift_project_value_buffer(v2, (uint64_t)logger);
    v4 = Logger.logObject.getter(v3);
    v5 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v4, v5))
    {
      v6 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, v5, "smsfilter: capabilitiesQueryRequest", v6, 2u);
      swift_slowDealloc(v6, -1, -1);
    }

    if (one-time initialization token for _smsfilters != -1)
      swift_once(&one-time initialization token for _smsfilters, one-time initialization function for _smsfilters);
    swift_beginAccess(&_smsfilters, v23, 0, 0);
    rawValue = (unint64_t)_smsfilters._rawValue;
    if ((unint64_t)_smsfilters._rawValue >> 62)
      break;
    v8 = *(_QWORD *)(((unint64_t)_smsfilters._rawValue & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain(_smsfilters._rawValue);
    if (!v8)
      goto LABEL_25;
LABEL_8:
    v9 = 4;
    v10 = 0;
    if ((rawValue & 0xC000000000000001) == 0)
    {
LABEL_12:
      v11 = *(_QWORD *)(rawValue + 8 * v9);
      swift_retain(v11);
      v12 = v10 + 1;
      if (__OFADD__(v10, 1))
        goto LABEL_19;
      goto LABEL_13;
    }
    while (1)
    {
      v11 = specialized _ArrayBuffer._getElementSlowPath(_:)(v10, rawValue);
      v12 = v10 + 1;
      if (__OFADD__(v10, 1))
        break;
LABEL_13:
      v13 = v11 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__region;
      swift_beginAccess(v11 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__region, v20, 0, 0);
      outlined init with take of Region?(v13, (uint64_t)v21);
      outlined init with take of Region?((uint64_t)v21, (uint64_t)v22);
      if (_s15extensionFilter6RegionVSgWOg((uint64_t)v22) == 1)
      {
        _Block_release(a1);
        __break(1u);
        return;
      }
      if ((*(_BYTE *)(v13 + 104) & 1) != 0)
      {
        swift_bridgeObjectRelease(rawValue);
        v14.super.isa = SmsFilter.subClassificationCapabilities()().super.isa;
        swift_release(v11);
        goto LABEL_28;
      }
      swift_release(v11);
      if (v12 == v8)
        goto LABEL_25;
      v10 = ++v9 - 4;
      if ((rawValue & 0xC000000000000001) == 0)
        goto LABEL_12;
    }
LABEL_19:
    __break(1u);
  }
  if ((uint64_t)_smsfilters._rawValue < 0)
    v15 = (unint64_t)_smsfilters._rawValue;
  else
    v15 = (unint64_t)_smsfilters._rawValue & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain(_smsfilters._rawValue);
  v8 = _CocoaArrayWrapper.endIndex.getter(v15);
  if (v8)
    goto LABEL_8;
LABEL_25:
  v16 = swift_bridgeObjectRelease(rawValue);
  v17 = Logger.logObject.getter(v16);
  v18 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v17, v18))
  {
    v19 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v19 = 0;
    _os_log_impl((void *)&_mh_execute_header, v17, v18, "smsfilter: sub-classification feature is not available", v19, 2u);
    swift_slowDealloc(v19, -1, -1);
  }

  v14.super.isa = (Class)objc_msgSend(objc_allocWithZone((Class)ILMessageFilterCapabilitiesQueryResponse), "init");
LABEL_28:
  ((void (**)(_QWORD, Class))a1)[2](a1, v14.super.isa);

}

uint64_t specialized MessageFilterExtension.offlineAction(for:)(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  unint64_t rawValue;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  uint64_t result;
  void *v30;
  BOOL v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  NSObject *v36;
  os_log_type_t v37;
  uint8_t *v38;
  uint64_t v39;
  NSObject *v40;
  os_log_type_t v41;
  uint8_t *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  void *v46;
  uint64_t v47;
  char v48[24];
  uint64_t v49;
  uint64_t v50;
  uint64_t v51[16];
  char v52[32];

  if (one-time initialization token for logger == -1)
    goto LABEL_2;
  while (1)
  {
    swift_once(&one-time initialization token for logger, one-time initialization function for logger);
LABEL_2:
    v2 = type metadata accessor for Logger(0);
    v3 = __swift_project_value_buffer(v2, (uint64_t)logger);
    v4 = Logger.logObject.getter(v3);
    v5 = static os_log_type_t.default.getter(v4);
    if (os_log_type_enabled(v4, v5))
    {
      v6 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, v5, "smsfilter: offlineAction", v6, 2u);
      swift_slowDealloc(v6, -1, -1);
    }

    v7 = objc_msgSend(a1, "messageBody");
    if (!v7)
      return 1;
    v8 = v7;
    v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(v7);
    v11 = v10;

    v12 = objc_msgSend(a1, "sender");
    if (!v12)
    {
      v32 = v11;
      goto LABEL_27;
    }
    v13 = v12;
    v14 = static String._unconditionallyBridgeFromObjectiveC(_:)(v12);
    v16 = v15;

    v17 = objc_msgSend(a1, "receiverISOCountryCode");
    if (!v17)
    {
      swift_bridgeObjectRelease(v11);
      v32 = v16;
LABEL_27:
      swift_bridgeObjectRelease(v32);
      return 1;
    }
    v18 = v17;
    v47 = v14;
    v19 = static String._unconditionallyBridgeFromObjectiveC(_:)(v17);
    a1 = v20;

    v21 = one-time initialization token for _smsfilters;
    swift_bridgeObjectRetain(a1);
    if (v21 != -1)
      swift_once(&one-time initialization token for _smsfilters, one-time initialization function for _smsfilters);
    swift_beginAccess(&_smsfilters, v52, 0, 0);
    rawValue = (unint64_t)_smsfilters._rawValue;
    if ((unint64_t)_smsfilters._rawValue >> 62)
      break;
    v23 = *(_QWORD *)(((unint64_t)_smsfilters._rawValue & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain(_smsfilters._rawValue);
    if (!v23)
      goto LABEL_38;
LABEL_11:
    v44 = v9;
    v45 = v16;
    v46 = v11;
    v24 = 4;
    v25 = 0;
    if ((rawValue & 0xC000000000000001) == 0)
    {
LABEL_15:
      v26 = *(_QWORD *)(rawValue + 8 * v24);
      swift_retain(v26);
      v27 = v25 + 1;
      if (__OFADD__(v25, 1))
        goto LABEL_32;
      goto LABEL_16;
    }
    while (1)
    {
      v26 = specialized _ArrayBuffer._getElementSlowPath(_:)(v25, rawValue);
      v27 = v25 + 1;
      if (__OFADD__(v25, 1))
        break;
LABEL_16:
      v28 = (_QWORD *)(v26 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__region);
      swift_beginAccess(v26 + OBJC_IVAR____TtC15extensionFilter9SmsFilter__region, v48, 0, 0);
      outlined init with take of Region?((uint64_t)v28, (uint64_t)&v49);
      outlined init with take of Region?((uint64_t)&v49, (uint64_t)v51);
      result = _s15extensionFilter6RegionVSgWOg((uint64_t)v51);
      if ((_DWORD)result == 1)
      {
        __break(1u);
        return result;
      }
      v30 = (void *)v28[1];
      v31 = *v28 == v19 && v30 == a1;
      if (v31 || (_stringCompareWithSmolCheck(_:_:expecting:)(*v28, v30, v19, a1, 0) & 1) != 0)
      {
        swift_bridgeObjectRelease(rawValue);
        swift_bridgeObjectRelease_n(a1, 2);
        v33 = SmsFilter.classifyAction(sender:messageBody:)(v47, v45, v44, v46);
        swift_bridgeObjectRelease(v45);
        swift_bridgeObjectRelease(v46);
        swift_release(v26);
        return v33;
      }
      swift_release(v26);
      if (v27 == v23)
      {
        v34 = swift_bridgeObjectRelease(rawValue);
        v16 = v45;
        v11 = v46;
        goto LABEL_39;
      }
      v25 = ++v24 - 4;
      if ((rawValue & 0xC000000000000001) == 0)
        goto LABEL_15;
    }
LABEL_32:
    __break(1u);
  }
  if ((uint64_t)_smsfilters._rawValue < 0)
    v35 = (unint64_t)_smsfilters._rawValue;
  else
    v35 = (unint64_t)_smsfilters._rawValue & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain(_smsfilters._rawValue);
  v23 = _CocoaArrayWrapper.endIndex.getter(v35);
  if (v23)
    goto LABEL_11;
LABEL_38:
  v34 = swift_bridgeObjectRelease(rawValue);
LABEL_39:
  v36 = Logger.logObject.getter(v34);
  v37 = static os_log_type_t.error.getter(v36);
  if (os_log_type_enabled(v36, v37))
  {
    v38 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v38 = 0;
    _os_log_impl((void *)&_mh_execute_header, v36, v37, "smsfilter: no smsfilter is found for sim region", v38, 2u);
    swift_slowDealloc(v38, -1, -1);
  }
  swift_bridgeObjectRelease(a1);

  swift_bridgeObjectRelease(v16);
  swift_bridgeObjectRelease(v11);
  v39 = swift_bridgeObjectRetain(a1);
  v40 = Logger.logObject.getter(v39);
  v41 = static os_log_type_t.error.getter(v40);
  if (!os_log_type_enabled(v40, v41))
  {

    swift_bridgeObjectRelease_n(a1, 2);
    return 1;
  }
  v42 = (uint8_t *)swift_slowAlloc(12, -1);
  v43 = swift_slowAlloc(32, -1);
  v51[0] = v43;
  *(_DWORD *)v42 = 136315138;
  swift_bridgeObjectRetain(a1);
  v49 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v19, (unint64_t)a1, v51);
  UnsafeMutableRawBufferPointer.copyMemory(from:)(&v49, &v50);
  swift_bridgeObjectRelease_n(a1, 3);
  _os_log_impl((void *)&_mh_execute_header, v40, v41, "smsfilter: no smsfilter found for - %s", v42, 0xCu);
  v33 = 1;
  swift_arrayDestroy(v43, 1, (char *)&type metadata for Any + 8);
  swift_slowDealloc(v43, -1, -1);
  swift_slowDealloc(v42, -1, -1);

  return v33;
}

uint64_t type metadata accessor for MessageFilterExtension()
{
  return objc_opt_self(_TtC15extensionFilter22MessageFilterExtension);
}

void specialized MessageFilterExtension.handle(_:context:completion:)(void *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  id v19;

  if (one-time initialization token for logger != -1)
    swift_once(&one-time initialization token for logger, one-time initialization function for logger);
  v4 = type metadata accessor for Logger(0);
  v5 = __swift_project_value_buffer(v4, (uint64_t)logger);
  v6 = Logger.logObject.getter(v5);
  v7 = static os_log_type_t.default.getter(v6);
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "smsfilter: queryRequest", v8, 2u);
    swift_slowDealloc(v8, -1, -1);
  }

  v9 = specialized MessageFilterExtension.offlineAction(for:)(a1);
  v11 = v10;
  v19 = objc_msgSend(objc_allocWithZone((Class)ILMessageFilterQueryResponse), "init");
  v12 = objc_msgSend(v19, "setSubAction:", 0);
  if ((unint64_t)(v11 - 10001) >= 3 && v11)
  {
    v16 = Logger.logObject.getter(v12);
    v17 = static os_log_type_t.error.getter(v16);
    if (os_log_type_enabled(v16, v17))
    {
      v18 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v18 = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, v17, "unexpected offline sub-action", v18, 2u);
      swift_slowDealloc(v18, -1, -1);
    }

  }
  else
  {
    objc_msgSend(v19, "setSubAction:", v11);
  }
  if (v9 > 4)
  {
    v13 = Logger.logObject.getter(v19);
    v14 = static os_log_type_t.error.getter(v13);
    if (!os_log_type_enabled(v13, v14))
      goto LABEL_13;
    goto LABEL_12;
  }
  if (((1 << v9) & 0x1A) == 0)
  {
    v13 = Logger.logObject.getter(v19);
    v14 = static os_log_type_t.error.getter(v13);
    if (!os_log_type_enabled(v13, v14))
    {
LABEL_13:

      goto LABEL_14;
    }
LABEL_12:
    v15 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v15 = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, v14, "unexpected offline action", v15, 2u);
    swift_slowDealloc(v15, -1, -1);
    goto LABEL_13;
  }
  objc_msgSend(v19, "setAction:", v9);
  (*(void (**)(uint64_t, id))(a2 + 16))(a2, v19);
LABEL_14:

}

uint64_t *outlined release of Region?(uint64_t *a1)
{
  outlined consume of Region?(*a1, a1[1], a1[2], a1[3], a1[4], a1[5], a1[6], a1[7], a1[8], a1[9], a1[10], a1[11], a1[12], a1[13], a1[14], a1[15]);
  return a1;
}

id objc_msgSend_URLByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLByAppendingPathComponent:");
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "UUID");
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "UUIDString");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addUpdateHandlerForNamespaceName_usingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addUpdateHandlerForNamespaceName:usingBlock:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_basicModel(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "basicModel");
}

id objc_msgSend_bundleForClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleForClass:");
}

id objc_msgSend_clientWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clientWithIdentifier:");
}

id objc_msgSend_compileSpecificationAtURL_toURL_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "compileSpecificationAtURL:toURL:options:error:");
}

id objc_msgSend_context(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "context");
}

id objc_msgSend_copyItemAtPath_toPath_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "copyItemAtPath:toPath:error:");
}

id objc_msgSend_copyMobileSubscriberCountryCode_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "copyMobileSubscriberCountryCode:error:");
}

id objc_msgSend_copyMobileSubscriberIsoCountryCode_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "copyMobileSubscriberIsoCountryCode:error:");
}

id objc_msgSend_createDirectoryAtPath_withIntermediateDirectories_attributes_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:");
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultManager");
}

id objc_msgSend_defaultOptions(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultOptions");
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "doubleValue");
}

id objc_msgSend_experimentIdWithNamespaceName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "experimentIdWithNamespaceName:");
}

id objc_msgSend_fileExistsAtPath_isDirectory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileExistsAtPath:isDirectory:");
}

id objc_msgSend_fileURLWithPathComponents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileURLWithPathComponents:");
}

id objc_msgSend_fileValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileValue");
}

id objc_msgSend_findForSlot_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "findForSlot:");
}

id objc_msgSend_getActiveContexts_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getActiveContexts:");
}

id objc_msgSend_getRegexFileNameWithPath(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getRegexFileNameWithPath");
}

id objc_msgSend_initWithDefaultsDomain_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDefaultsDomain:");
}

id objc_msgSend_initWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFormat:");
}

id objc_msgSend_initWithQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithQueue:");
}

id objc_msgSend_isAbsolutePath(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isAbsolutePath");
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lastPathComponent");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "length");
}

id objc_msgSend_levelForFactor_withNamespaceName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "levelForFactor:withNamespaceName:");
}

id objc_msgSend_loadModelFromPath_deleteExistingFiles_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadModelFromPath:deleteExistingFiles:");
}

id objc_msgSend_loadTrialBasicModelByDeletingExistingModel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadTrialBasicModelByDeletingExistingModel:");
}

id objc_msgSend_loadTrialMainModelByDeletingExistingModel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadTrialMainModelByDeletingExistingModel:");
}

id objc_msgSend_loadTrialModelByDeletingExistingModel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadTrialModelByDeletingExistingModel:");
}

id objc_msgSend_loadTrialModelTransitionTimer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadTrialModelTransitionTimer");
}

id objc_msgSend_loadTrialPromoThreshold(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadTrialPromoThreshold");
}

id objc_msgSend_loadTrialSubClassificationModelByDeletingExistingModel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadTrialSubClassificationModelByDeletingExistingModel:");
}

id objc_msgSend_loadTrialTransThreshold(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadTrialTransThreshold");
}

id objc_msgSend_loadTrialUpdates(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadTrialUpdates");
}

id objc_msgSend_longValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "longValue");
}

id objc_msgSend_lowercaseString(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lowercaseString");
}

id objc_msgSend_mainModel(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mainModel");
}

id objc_msgSend_metadata(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "metadata");
}

id objc_msgSend_modelDescription(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "modelDescription");
}

id objc_msgSend_modelWithContentsOfURL_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "modelWithContentsOfURL:error:");
}

id objc_msgSend_namespaceNameFromId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "namespaceNameFromId:");
}

id objc_msgSend_newTrackingId(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "newTrackingId");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "path");
}

id objc_msgSend_pathForResource_ofType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pathForResource:ofType:");
}

id objc_msgSend_pathWithComponents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pathWithComponents:");
}

id objc_msgSend_prepareForTrialParamsUpdate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "prepareForTrialParamsUpdate");
}

id objc_msgSend_removeItemAtPath_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeItemAtPath:error:");
}

id objc_msgSend_setNewModelUpdateAvailable_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNewModelUpdateAvailable:");
}

id objc_msgSend_stringByAppendingPathExtension_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAppendingPathExtension:");
}

id objc_msgSend_stringByDeletingPathExtension(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByDeletingPathExtension");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_subClassificationModel(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "subClassificationModel");
}

id objc_msgSend_temporaryDirectory(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "temporaryDirectory");
}

id objc_msgSend_treatmentIdWithNamespaceName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "treatmentIdWithNamespaceName:");
}

id objc_msgSend_trialClient(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "trialClient");
}

id objc_msgSend_trialFactor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "trialFactor:");
}

id objc_msgSend_trialManager(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "trialManager");
}

id objc_msgSend_trialNamespaceName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "trialNamespaceName");
}
