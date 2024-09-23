BOOL static EXFDRDecodeClient.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t EXFDRDecodeClient.hash(into:)()
{
  return sub_23A955EE4();
}

uint64_t EXFDRDecodeClient.hashValue.getter()
{
  sub_23A955ED8();
  sub_23A955EE4();
  return sub_23A955EF0();
}

BOOL sub_23A952AD4(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_23A952AEC()
{
  sub_23A955ED8();
  sub_23A955EE4();
  return sub_23A955EF0();
}

uint64_t sub_23A952B30()
{
  return sub_23A955EE4();
}

uint64_t sub_23A952B58()
{
  sub_23A955ED8();
  sub_23A955EE4();
  return sub_23A955EF0();
}

uint64_t EXFDRDecodeOption.rawValue.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

uint64_t sub_23A952BA8()
{
  return sub_23A955E6C();
}

uint64_t sub_23A952BC0@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  return sub_23A952BD4(a1, a2);
}

uint64_t sub_23A952BD4@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;

  v3 = *(_QWORD *)(a1 + 16);
  if (v3)
  {
    v4 = 0;
    v5 = (uint64_t *)(a1 + 32);
    do
    {
      v7 = *v5++;
      v6 = v7;
      if ((v7 & ~v4) == 0)
        v6 = 0;
      v4 |= v6;
      --v3;
    }
    while (v3);
  }
  else
  {
    v4 = 0;
  }
  result = swift_bridgeObjectRelease();
  *a2 = v4;
  return result;
}

uint64_t EXFDRDecodeError.rawValue.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

uint64_t EXFDRDecodeError.init(rawValue:)@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = result;
  return result;
}

void static EXFDRDecodeError.kExclaveFDRDecodeErrorNone.getter(_QWORD *a1@<X8>)
{
  *a1 = 0;
}

void static EXFDRDecodeError.kExclaveFDRDecodeErrorBadParameter.getter(_QWORD *a1@<X8>)
{
  *a1 = 1;
}

void static EXFDRDecodeError.kExclaveFDRDecodeErrorRawDataNotFound.getter(_QWORD *a1@<X8>)
{
  *a1 = 2;
}

void static EXFDRDecodeError.kExclaveFDRDecodeErrorRawDataMalformed.getter(_QWORD *a1@<X8>)
{
  *a1 = 4;
}

void static EXFDRDecodeError.kExclaveFDRDecodeErrorInvalidTrustObject.getter(_QWORD *a1@<X8>)
{
  *a1 = 8;
}

void static EXFDRDecodeError.kExclaveFDRDecodeErrorInvalidSealingManifest.getter(_QWORD *a1@<X8>)
{
  *a1 = 16;
}

void static EXFDRDecodeError.kExclaveFDRDecodeErrorRawDataNotTrusted.getter(_QWORD *a1@<X8>)
{
  *a1 = 32;
}

void static EXFDRDecodeError.kExclaveFDRDecodeErrorGeneric.getter(_QWORD *a1@<X8>)
{
  *a1 = 0x8000000000000000;
}

_QWORD *sub_23A952C94@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = *result;
  return result;
}

uint64_t sub_23A952CA4()
{
  sub_23A953068();
  sub_23A953A90();
  return sub_23A955EC0();
}

void sub_23A952CF0(_QWORD *a1@<X8>)
{
  *a1 = 0;
}

_QWORD *sub_23A952CF8@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 | *result;
  return result;
}

_QWORD *sub_23A952D0C@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 & *result;
  return result;
}

_QWORD *sub_23A952D20@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 ^ *result;
  return result;
}

BOOL sub_23A952D34(_QWORD *a1, uint64_t *a2)
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

_QWORD *sub_23A952D64@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
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

uint64_t *sub_23A952D90@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
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

_QWORD *sub_23A952DB4(_QWORD *result)
{
  _QWORD *v1;

  *v1 |= *result;
  return result;
}

_QWORD *sub_23A952DC8(_QWORD *result)
{
  _QWORD *v1;

  *v1 &= *result;
  return result;
}

_QWORD *sub_23A952DDC(_QWORD *result)
{
  _QWORD *v1;

  *v1 ^= *result;
  return result;
}

_QWORD *sub_23A952DF0@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 & ~*result;
  return result;
}

BOOL sub_23A952E04(_QWORD *a1)
{
  _QWORD *v1;

  return (*v1 & ~*a1) == 0;
}

BOOL sub_23A952E18(_QWORD *a1)
{
  _QWORD *v1;

  return (*v1 & *a1) == 0;
}

BOOL sub_23A952E2C(_QWORD *a1)
{
  _QWORD *v1;

  return (*a1 & ~*v1) == 0;
}

BOOL sub_23A952E40()
{
  _QWORD *v0;

  return *v0 == 0;
}

_QWORD *sub_23A952E50(_QWORD *result)
{
  _QWORD *v1;

  *v1 &= ~*result;
  return result;
}

_QWORD *sub_23A952E64@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = *result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

void sub_23A952E74(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

BOOL sub_23A952E80(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

uint64_t EXFDRDecodeDataCtx.init(dataClass:uniqueID:uniqueIDLength:subCC:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, int a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  *(_QWORD *)a5 = result;
  *(_QWORD *)(a5 + 8) = a2;
  *(_DWORD *)(a5 + 16) = a3;
  *(_QWORD *)(a5 + 24) = a4;
  return result;
}

uint64_t EXFDRDecodeTransferRawDataCtx.init(data:dataLength:clientExclave:)@<X0>(uint64_t result@<X0>, int a2@<W1>, char *a3@<X2>, uint64_t a4@<X8>)
{
  char v4;

  v4 = *a3;
  *(_QWORD *)a4 = result;
  *(_DWORD *)(a4 + 8) = a2;
  *(_BYTE *)(a4 + 12) = v4;
  return result;
}

__n128 EXFDRDecodeGetTrustedDataCtx.init(clientExclave:dataCtx:decodeOptions:)@<Q0>(_BYTE *a1@<X0>, __n128 *a2@<X1>, uint64_t *a3@<X2>, uint64_t a4@<X8>)
{
  unsigned __int32 v4;
  unint64_t v5;
  uint64_t v6;
  __n128 result;

  v4 = a2[1].n128_u32[0];
  v5 = a2[1].n128_u64[1];
  v6 = *a3;
  *(_BYTE *)a4 = *a1;
  result = *a2;
  *(__n128 *)(a4 + 8) = *a2;
  *(_DWORD *)(a4 + 24) = v4;
  *(_QWORD *)(a4 + 32) = v5;
  *(_QWORD *)(a4 + 40) = v6;
  return result;
}

void EXFDRDecodeGetTrustedDataResponseCtx.decodeError.getter(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

uint64_t EXFDRDecodeGetTrustedDataResponseCtx.trustedData.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t EXFDRDecodeGetTrustedDataResponseCtx.trustedDataLength.getter()
{
  uint64_t v0;

  return *(unsigned int *)(v0 + 16);
}

unint64_t sub_23A952F00()
{
  unint64_t result;

  result = qword_2569CB890;
  if (!qword_2569CB890)
  {
    result = MEMORY[0x23B85C528](&protocol conformance descriptor for EXFDRDecodeClient, &type metadata for EXFDRDecodeClient);
    atomic_store(result, (unint64_t *)&qword_2569CB890);
  }
  return result;
}

unint64_t sub_23A952F48()
{
  unint64_t result;

  result = qword_2569CB898;
  if (!qword_2569CB898)
  {
    result = MEMORY[0x23B85C528](&protocol conformance descriptor for EXFDRDecodeOption, &type metadata for EXFDRDecodeOption);
    atomic_store(result, (unint64_t *)&qword_2569CB898);
  }
  return result;
}

unint64_t sub_23A952F90()
{
  unint64_t result;

  result = qword_2569CB8A0;
  if (!qword_2569CB8A0)
  {
    result = MEMORY[0x23B85C528](&protocol conformance descriptor for EXFDRDecodeOption, &type metadata for EXFDRDecodeOption);
    atomic_store(result, (unint64_t *)&qword_2569CB8A0);
  }
  return result;
}

unint64_t sub_23A952FD8()
{
  unint64_t result;

  result = qword_2569CB8A8;
  if (!qword_2569CB8A8)
  {
    result = MEMORY[0x23B85C528](&protocol conformance descriptor for EXFDRDecodeOption, &type metadata for EXFDRDecodeOption);
    atomic_store(result, (unint64_t *)&qword_2569CB8A8);
  }
  return result;
}

unint64_t sub_23A953020()
{
  unint64_t result;

  result = qword_2569CB8B0;
  if (!qword_2569CB8B0)
  {
    result = MEMORY[0x23B85C528](&protocol conformance descriptor for EXFDRDecodeOption, &type metadata for EXFDRDecodeOption);
    atomic_store(result, (unint64_t *)&qword_2569CB8B0);
  }
  return result;
}

unint64_t sub_23A953068()
{
  unint64_t result;

  result = qword_2569CB8B8;
  if (!qword_2569CB8B8)
  {
    result = MEMORY[0x23B85C528](&protocol conformance descriptor for EXFDRDecodeError, &type metadata for EXFDRDecodeError);
    atomic_store(result, (unint64_t *)&qword_2569CB8B8);
  }
  return result;
}

unint64_t sub_23A9530B0()
{
  unint64_t result;

  result = qword_2569CB8C0;
  if (!qword_2569CB8C0)
  {
    result = MEMORY[0x23B85C528](&protocol conformance descriptor for EXFDRDecodeError, &type metadata for EXFDRDecodeError);
    atomic_store(result, (unint64_t *)&qword_2569CB8C0);
  }
  return result;
}

unint64_t sub_23A9530F8()
{
  unint64_t result;

  result = qword_2569CB8C8;
  if (!qword_2569CB8C8)
  {
    result = MEMORY[0x23B85C528](&protocol conformance descriptor for EXFDRDecodeError, &type metadata for EXFDRDecodeError);
    atomic_store(result, (unint64_t *)&qword_2569CB8C8);
  }
  return result;
}

unint64_t sub_23A953140()
{
  unint64_t result;

  result = qword_2569CB8D0;
  if (!qword_2569CB8D0)
  {
    result = MEMORY[0x23B85C528](&protocol conformance descriptor for EXFDRDecodeError, &type metadata for EXFDRDecodeError);
    atomic_store(result, (unint64_t *)&qword_2569CB8D0);
  }
  return result;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for EXFDRDecodeClient(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for EXFDRDecodeClient(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23A953270 + 4 * byte_23A956025[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_23A9532A4 + 4 * byte_23A956020[v4]))();
}

uint64_t sub_23A9532A4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A9532AC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23A9532B4);
  return result;
}

uint64_t sub_23A9532C0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23A9532C8);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_23A9532CC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A9532D4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A9532E0(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_23A9532EC(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for EXFDRDecodeClient()
{
  return &type metadata for EXFDRDecodeClient;
}

ValueMetadata *type metadata accessor for EXFDRDecodeOption()
{
  return &type metadata for EXFDRDecodeOption;
}

ValueMetadata *type metadata accessor for EXFDRDecodeError()
{
  return &type metadata for EXFDRDecodeError;
}

uint64_t initializeBufferWithCopyOfBuffer for EXFDRDecodeDataCtx(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for EXFDRDecodeDataCtx()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for EXFDRDecodeDataCtx(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for EXFDRDecodeDataCtx(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
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

uint64_t assignWithTake for EXFDRDecodeDataCtx(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_bridgeObjectRelease();
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for EXFDRDecodeDataCtx(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 32))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for EXFDRDecodeDataCtx(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    if (a3 < 0)
      *(_BYTE *)(result + 32) = 1;
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
    *(_BYTE *)(result + 32) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for EXFDRDecodeDataCtx()
{
  return &type metadata for EXFDRDecodeDataCtx;
}

uint64_t destroy for EXFDRDecodeTransferRawDataCtx()
{
  return swift_bridgeObjectRelease();
}

uint64_t _s16ExclaveFDRDecode29EXFDRDecodeTransferRawDataCtxVwCP_0(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_DWORD *)(a1 + 8) = *(_DWORD *)(a2 + 8);
  *(_BYTE *)(a1 + 12) = *(_BYTE *)(a2 + 12);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for EXFDRDecodeTransferRawDataCtx(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_DWORD *)(a1 + 8) = *(_DWORD *)(a2 + 8);
  *(_BYTE *)(a1 + 12) = *(_BYTE *)(a2 + 12);
  return a1;
}

_QWORD *__swift_memcpy13_8(_QWORD *result, uint64_t *a2)
{
  uint64_t v2;

  v2 = *a2;
  *(_QWORD *)((char *)result + 5) = *(uint64_t *)((char *)a2 + 5);
  *result = v2;
  return result;
}

uint64_t assignWithTake for EXFDRDecodeTransferRawDataCtx(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease();
  *(_DWORD *)(a1 + 8) = *(_DWORD *)(a2 + 8);
  *(_BYTE *)(a1 + 12) = *(_BYTE *)(a2 + 12);
  return a1;
}

uint64_t getEnumTagSinglePayload for EXFDRDecodeTransferRawDataCtx(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 13))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for EXFDRDecodeTransferRawDataCtx(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_BYTE *)(result + 12) = 0;
    *(_DWORD *)(result + 8) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 13) = 1;
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
    *(_BYTE *)(result + 13) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for EXFDRDecodeTransferRawDataCtx()
{
  return &type metadata for EXFDRDecodeTransferRawDataCtx;
}

uint64_t destroy for EXFDRDecodeGetTrustedDataCtx()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for EXFDRDecodeGetTrustedDataCtx(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v3 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v3;
  *(_DWORD *)(a1 + 24) = *(_DWORD *)(a2 + 24);
  v4 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for EXFDRDecodeGetTrustedDataCtx(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_DWORD *)(a1 + 24) = *(_DWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  return a1;
}

__n128 __swift_memcpy48_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for EXFDRDecodeGetTrustedDataCtx(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)a1 = *(_BYTE *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  *(_DWORD *)(a1 + 24) = *(_DWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  return a1;
}

uint64_t getEnumTagSinglePayload for EXFDRDecodeGetTrustedDataCtx(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 48))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for EXFDRDecodeGetTrustedDataCtx(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 48) = 1;
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
    *(_BYTE *)(result + 48) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for EXFDRDecodeGetTrustedDataCtx()
{
  return &type metadata for EXFDRDecodeGetTrustedDataCtx;
}

uint64_t destroy for EXFDRDecodeGetTrustedDataResponseCtx()
{
  return swift_bridgeObjectRelease();
}

uint64_t _s16ExclaveFDRDecode36EXFDRDecodeGetTrustedDataResponseCtxVwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for EXFDRDecodeGetTrustedDataResponseCtx(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  return a1;
}

__n128 __swift_memcpy20_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u32[0] = a2[1].n128_u32[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for EXFDRDecodeGetTrustedDataResponseCtx(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  return a1;
}

uint64_t getEnumTagSinglePayload for EXFDRDecodeGetTrustedDataResponseCtx(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 20))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for EXFDRDecodeGetTrustedDataResponseCtx(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_DWORD *)(result + 16) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    if (a3 < 0)
      *(_BYTE *)(result + 20) = 1;
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
    *(_BYTE *)(result + 20) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for EXFDRDecodeGetTrustedDataResponseCtx()
{
  return &type metadata for EXFDRDecodeGetTrustedDataResponseCtx;
}

unint64_t sub_23A953A90()
{
  unint64_t result;

  result = qword_2569CB8D8;
  if (!qword_2569CB8D8)
  {
    result = MEMORY[0x23B85C528](MEMORY[0x24BEE45A8], MEMORY[0x24BEE4568]);
    atomic_store(result, (unint64_t *)&qword_2569CB8D8);
  }
  return result;
}

uint64_t sub_23A953AD4(uint64_t a1)
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

uint64_t sub_23A953B6C()
{
  uint64_t v0;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2569CB9B0);
  v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_23A956520;
  sub_23A955E78();
  swift_bridgeObjectRelease();
  sub_23A955E60();
  *(_QWORD *)(v0 + 56) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v0 + 32) = 0xD000000000000028;
  *(_QWORD *)(v0 + 40) = 0x800000023A9576A0;
  sub_23A955ECC();
  return swift_bridgeObjectRelease();
}

uint64_t ExclaveFDRDecodeRawDataStoreKitClient.__allocating_init(conclaveID:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v3;

  v1 = swift_allocObject();
  type metadata accessor for ExclaveFDRDecodeRawDataStoreKitService.Service();
  sub_23A953E88();
  sub_23A955E48();
  swift_bridgeObjectRelease();
  if (v0)
  {
    MEMORY[0x23B85C510](v0);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2569CB8E8);
    sub_23A955E54();
    sub_23A955E60();
    swift_bridgeObjectRelease();
    sub_23A953B6C();
    swift_bridgeObjectRelease();
    swift_willThrow();
    swift_deallocPartialClassInstance();
  }
  else
  {
    *(_QWORD *)(v1 + 16) = v3;
  }
  return v1;
}

uint64_t ExclaveFDRDecodeRawDataStoreKitClient.init(conclaveID:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v3;

  type metadata accessor for ExclaveFDRDecodeRawDataStoreKitService.Service();
  sub_23A953E88();
  sub_23A955E48();
  swift_bridgeObjectRelease();
  if (v1)
  {
    MEMORY[0x23B85C510](v1);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2569CB8E8);
    sub_23A955E54();
    sub_23A955E60();
    swift_bridgeObjectRelease();
    sub_23A953B6C();
    swift_bridgeObjectRelease();
    swift_willThrow();
    type metadata accessor for ExclaveFDRDecodeRawDataStoreKitClient();
    swift_deallocPartialClassInstance();
  }
  else
  {
    *(_QWORD *)(v0 + 16) = v3;
  }
  return v0;
}

unint64_t sub_23A953E88()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2569CB8E0;
  if (!qword_2569CB8E0)
  {
    v1 = type metadata accessor for ExclaveFDRDecodeRawDataStoreKitService.Service();
    result = MEMORY[0x23B85C528](&unk_23A956820, v1);
    atomic_store(result, (unint64_t *)&qword_2569CB8E0);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x23B85C51C]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t type metadata accessor for ExclaveFDRDecodeRawDataStoreKitClient()
{
  return objc_opt_self();
}

uint64_t sub_23A953F30()
{
  uint64_t v0;

  swift_retain();
  v0 = swift_bridgeObjectRetain();
  sub_23A954020(v0);
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t ExclaveFDRDecodeRawDataStoreKitClient.deinit()
{
  uint64_t v0;

  swift_release();
  return v0;
}

uint64_t ExclaveFDRDecodeRawDataStoreKitClient.__deallocating_deinit()
{
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t method lookup function for ExclaveFDRDecodeRawDataStoreKitClient()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of ExclaveFDRDecodeRawDataStoreKitClient.__allocating_init(conclaveID:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t dispatch thunk of ExclaveFDRDecodeRawDataStoreKitClient.transferRawData(ctx:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 120))();
}

uint64_t sub_23A954020(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t result;
  uint64_t i;
  int v13;
  uint64_t v14;
  uint64_t *v15;
  _QWORD v16[2];
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v3 = sub_23A955DB8();
  v18 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8]();
  v5 = (char *)v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_23A955DF4();
  MEMORY[0x24BDAC7A8]();
  v9 = (char *)v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *(_QWORD *)(a1 + 16);
  if (__OFADD__(v10, 8))
  {
    __break(1u);
    goto LABEL_16;
  }
  if (__OFADD__(v10 + 8, 4))
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  if (__OFADD__(v10 + 12, 8))
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  if (__OFADD__(v10 + 20, 8))
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  v19 = v7;
  v17 = v3;
  result = sub_23A955E18();
  if (v1)
    return result;
  v16[1] = result;
  sub_23A955E00();
  sub_23A955DDC();
  sub_23A955DDC();
  if (v10)
  {
    v16[0] = v6;
    swift_bridgeObjectRetain();
    for (i = 0; i != v10; ++i)
      sub_23A955DC4();
    swift_bridgeObjectRelease();
    v6 = v16[0];
  }
  sub_23A955DD0();
  sub_23A955DDC();
  sub_23A955DE8();
  sub_23A955E24();
  swift_release();
  swift_retain();
  sub_23A955DAC();
  v13 = sub_23A955D7C();
  if (v13)
  {
    if (v13 == 1)
    {
      v14 = sub_23A955D94();
      sub_23A955C04();
      swift_allocError();
      *v15 = v14;
      swift_willThrow();
      goto LABEL_13;
    }
LABEL_19:
    result = sub_23A955E84();
    __break(1u);
    return result;
  }
LABEL_13:
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v18 + 8))(v5, v17);
  return (*(uint64_t (**)(char *, uint64_t))(v19 + 8))(v9, v6);
}

uint64_t sub_23A954318()
{
  sub_23A955CEC();
  sub_23A953A90();
  return sub_23A955EC0();
}

uint64_t sub_23A95435C@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;

  v3 = sub_23A953AD4(a1);
  result = swift_bridgeObjectRelease();
  *a2 = v3;
  return result;
}

uint64_t sub_23A9543A0(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unsigned int v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  unsigned int (*v25)(char *, uint64_t, uint64_t);
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t result;
  uint64_t v31;
  char *v32;
  void (*v33)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;

  v3 = v1;
  v5 = sub_23A955DF4();
  v6 = *(_QWORD *)(v5 - 8);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v32 = (char *)&v31 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569CBF70);
  v8 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v36 = (char *)&v31 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v31 - v10;
  v12 = sub_23A955DB8();
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)&v31 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v37 = v16;
  v38 = v15;
  (*(void (**)(char *, uint64_t))(v16 + 16))(v14, a1);
  v34 = v6;
  v35 = v5;
  v33 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56);
  v33(v11, 1, 1, v5);
  sub_23A955760();
  v18 = v3[6];
  v17 = v3[7];
  __swift_project_boxed_opaque_existential_1(v3 + 3, v18);
  v19 = sub_23A955D94();
  v20 = sub_23A955450(0, v19);
  v21 = sub_23A955D88();
  v22 = sub_23A955868();
  (*(void (**)(unint64_t, unint64_t, uint64_t, uint64_t))(v17 + 8))(v20, v21 | ((unint64_t)(v22 & 1) << 32), v18, v17);
  if (v2)
  {
    swift_bridgeObjectRelease();
    v39 = v2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2569CB8E8);
    if (!swift_dynamicCast())
    {
      MEMORY[0x23B85C504](v39);
      result = sub_23A955E84();
      __break(1u);
      return result;
    }
    MEMORY[0x23B85C504](v39);
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  v23 = (uint64_t)v36;
  sub_23A955DA0();
  v24 = v35;
  v33((char *)v23, 0, 1, v35);
  sub_23A9559AC(v23, (uint64_t)v11);
  v25 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v34 + 48);
  if (!v25(v11, 1, v24))
  {
    sub_23A955DC4();
    v24 = v35;
  }
  if (v25(v11, 1, v24))
  {
    (*(void (**)(char *, uint64_t))(v37 + 8))(v14, v38);
    v26 = 0;
  }
  else
  {
    v27 = v34;
    v28 = v32;
    (*(void (**)(char *, char *, uint64_t))(v34 + 16))(v32, v11, v24);
    v29 = v24;
    v26 = sub_23A955DE8();
    (*(void (**)(char *, uint64_t))(v27 + 8))(v28, v29);
    (*(void (**)(char *, uint64_t))(v37 + 8))(v14, v38);
  }
  sub_23A95596C((uint64_t)v11);
  return v26;
}

uint64_t sub_23A954754(uint64_t a1)
{
  return sub_23A9543A0(a1);
}

uint64_t type metadata accessor for ExclaveFDRDecodeRawDataStoreKitService()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for ExclaveFDRDecodeRawDataStoreKitService.Service()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for ExclaveFDRDecodeRawDataStoreKitService.Server()
{
  return objc_opt_self();
}

uint64_t sub_23A9547D4(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, _QWORD, uint64_t, uint64_t);
  uint64_t v23;
  uint64_t v24;
  char *v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  char *v29;
  char v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  BOOL v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  unint64_t v42;
  unsigned int v43;
  char v44;
  uint64_t v45;
  unsigned int (*v46)(uint64_t, uint64_t, uint64_t);
  uint64_t v47;
  uint64_t i;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  char *v52;
  uint64_t v53;
  uint64_t result;
  uint64_t v55;
  char *v56;
  char *v57;
  void (*v58)(uint64_t, _QWORD, uint64_t, uint64_t);
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  char *v63;
  uint64_t v64;

  v3 = v1;
  v5 = sub_23A955DF4();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v57 = (char *)&v55 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569CBF70);
  v9 = MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v55 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = MEMORY[0x24BDAC7A8](v9);
  v14 = (char *)&v55 - v13;
  MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v55 - v15;
  v17 = sub_23A955DB8();
  MEMORY[0x24BDAC7A8](v17);
  v19 = (char *)&v55 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v61 = v21;
  v62 = v20;
  (*(void (**)(char *, uint64_t))(v21 + 16))(v19, a1);
  v59 = v6;
  v60 = v5;
  v22 = *(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v6 + 56);
  v63 = v16;
  v58 = v22;
  v22((uint64_t)v16, 1, 1, v5);
  LOBYTE(a1) = sub_23A9559F8();
  v23 = v3[6];
  v24 = v3[7];
  __swift_project_boxed_opaque_existential_1(v3 + 3, v23);
  if ((a1 & 1) == 0)
  {
    v56 = v11;
    v25 = sub_23A955568(0, 4);
    v26 = sub_23A955D94();
    v27 = sub_23A955450(0, v26);
    v28 = sub_23A955D88();
    v29 = sub_23A955568(0, 4);
    v55 = v2;
    v30 = sub_23A955868();
    (*(void (**)(char *, unint64_t, uint64_t, char *, _QWORD, uint64_t, uint64_t))(v24 + 16))(v25, v27, v28, v29, v30 & 1, v23, v24);
    v32 = v31;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v33 = *(_QWORD *)(v32 + 16);
    v34 = __OFADD__(v33, 8);
    v35 = v33 + 8;
    if (v34)
    {
      __break(1u);
    }
    else
    {
      v34 = __OFADD__(v35, 8);
      v36 = v35 + 8;
      if (!v34)
      {
        if (!__OFADD__(v36, 4))
        {
          v38 = v55;
          v37 = (uint64_t)v56;
          v39 = (uint64_t)v19;
          sub_23A955DA0();
          if (v38)
          {
            (*(void (**)(char *, uint64_t))(v61 + 8))(v19, v62);
            swift_bridgeObjectRelease();
            v40 = (uint64_t)v63;
LABEL_24:
            sub_23A95596C(v40);
            return v39;
          }
          v45 = v60;
          v58(v37, 0, 1, v60);
          v40 = (uint64_t)v63;
          sub_23A9559AC(v37, (uint64_t)v63);
          v46 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v59 + 48);
          if (v46(v40, 1, v45))
          {
            swift_bridgeObjectRelease();
            goto LABEL_21;
          }
          sub_23A955DDC();
          v47 = *(_QWORD *)(v32 + 16);
          sub_23A955DDC();
          if (v47)
          {
            swift_bridgeObjectRetain();
            for (i = 0; i != v47; ++i)
              sub_23A955DC4();
            swift_bridgeObjectRelease();
          }
          sub_23A955DD0();
          swift_bridgeObjectRelease();
LABEL_20:
          v45 = v60;
LABEL_21:
          v50 = v61;
          v49 = v62;
          if (v46(v40, 1, v45))
          {
            (*(void (**)(char *, uint64_t))(v50 + 8))(v19, v49);
            v39 = 0;
          }
          else
          {
            v51 = v59;
            v52 = v57;
            (*(void (**)(char *, uint64_t, uint64_t))(v59 + 16))(v57, v40, v45);
            v53 = v45;
            v39 = sub_23A955DE8();
            (*(void (**)(char *, uint64_t))(v51 + 8))(v52, v53);
            (*(void (**)(char *, uint64_t))(v50 + 8))(v19, v49);
          }
          goto LABEL_24;
        }
        goto LABEL_27;
      }
    }
    __break(1u);
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  v41 = sub_23A955D94();
  v42 = sub_23A955450(0, v41);
  v43 = sub_23A955D88();
  v44 = sub_23A955868();
  (*(void (**)(unint64_t, unint64_t, uint64_t, uint64_t))(v24 + 8))(v42, v43 | ((unint64_t)(v44 & 1) << 32), v23, v24);
  if (!v2)
  {
    swift_bridgeObjectRelease();
    goto LABEL_11;
  }
  swift_bridgeObjectRelease();
  v64 = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569CB8E8);
  if (swift_dynamicCast())
  {
    MEMORY[0x23B85C504](v64);
LABEL_11:
    v40 = (uint64_t)v63;
    sub_23A955DA0();
    v45 = v60;
    v58((uint64_t)v14, 0, 1, v60);
    sub_23A9559AC((uint64_t)v14, v40);
    v46 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v59 + 48);
    if (v46(v40, 1, v45))
      goto LABEL_21;
    sub_23A955DC4();
    goto LABEL_20;
  }
LABEL_28:
  MEMORY[0x23B85C504](v64);
  result = sub_23A955E84();
  __break(1u);
  return result;
}

uint64_t sub_23A954D94(uint64_t a1)
{
  return sub_23A9547D4(a1);
}

uint64_t sub_23A954DB4()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for ExclaveFDRDecodeRawDataStoreService()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for ExclaveFDRDecodeRawDataStoreService.Service()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for ExclaveFDRDecodeRawDataStoreService.Server()
{
  return objc_opt_self();
}

uint64_t sub_23A954E24()
{
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t sub_23A954E48@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;

  v4 = sub_23A955E0C();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = swift_allocObject();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  sub_23A955E3C();
  swift_allocObject();
  v9 = sub_23A955E30();
  result = (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(a1, v4);
  *(_QWORD *)(v8 + 16) = v9;
  *a2 = v8;
  return result;
}

uint64_t sub_23A954F20(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(char *, _QWORD, uint64_t, uint64_t);
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  unint64_t v23;
  unint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  int v29;
  int v30;
  uint64_t result;
  uint64_t v32;
  BOOL v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unsigned int (*v41)(uint64_t, uint64_t, uint64_t);
  uint64_t v42;
  uint64_t i;
  uint64_t v44;
  char *v45;
  char *v46;
  void (*v47)(char *, _QWORD, uint64_t, uint64_t);
  uint64_t v48;
  uint64_t v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  char *v53;
  _QWORD *v54;
  char v55[8];
  char *v56;
  unint64_t v57;
  int v58;
  char *v59;
  uint64_t v60;

  v3 = v1;
  v5 = sub_23A955DF4();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v46 = (char *)&v46 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569CBF70);
  v9 = MEMORY[0x24BDAC7A8](v8);
  v50 = (char *)&v46 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v46 - v11;
  v13 = sub_23A955DB8();
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)&v46 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v51 = v17;
  v52 = v16;
  (*(void (**)(char *, uint64_t))(v17 + 16))(v15, a1);
  v48 = v5;
  v49 = v6;
  v18 = *(void (**)(char *, _QWORD, uint64_t, uint64_t))(v6 + 56);
  v53 = v12;
  v47 = v18;
  v18(v12, 1, 1, v5);
  sub_23A955B00();
  v19 = v3 + 3;
  v21 = v3[6];
  v20 = v3[7];
  v54 = __swift_project_boxed_opaque_existential_1(v19, v21);
  LOBYTE(v12) = sub_23A955868() & 1;
  v22 = sub_23A955568(0, 4);
  v23 = sub_23A955D94();
  v24 = sub_23A955450(0, v23);
  LODWORD(v6) = sub_23A955D88();
  v25 = sub_23A955568(0, 4);
  v26 = sub_23A955D94();
  v55[0] = (char)v12;
  v56 = v22;
  v57 = v24;
  v58 = v6;
  v59 = v25;
  v60 = v26;
  (*(void (**)(char *, uint64_t, uint64_t))(v20 + 8))(v55, v21, v20);
  v28 = v27;
  v30 = v29;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  result = swift_bridgeObjectRelease();
  v32 = *(_QWORD *)(v28 + 16);
  v33 = __OFADD__(v32, 8);
  v34 = v32 + 8;
  if (v33)
  {
    __break(1u);
    goto LABEL_18;
  }
  v33 = __OFADD__(v34, 8);
  v35 = v34 + 8;
  if (v33)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  result = v35 + 4;
  if (__OFADD__(v35, 4))
  {
LABEL_19:
    __break(1u);
    return result;
  }
  LODWORD(v54) = v30;
  v36 = v50;
  v37 = (uint64_t)v15;
  sub_23A955DA0();
  if (v2)
  {
    (*(void (**)(char *, uint64_t))(v51 + 8))(v15, v52);
    swift_bridgeObjectRelease();
    sub_23A95596C((uint64_t)v53);
  }
  else
  {
    v38 = v48;
    v47(v36, 0, 1, v48);
    v39 = (uint64_t)v36;
    v40 = (uint64_t)v53;
    sub_23A9559AC(v39, (uint64_t)v53);
    v41 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v49 + 48);
    if (!v41(v40, 1, v38))
    {
      sub_23A955DDC();
      v42 = *(_QWORD *)(v28 + 16);
      sub_23A955DDC();
      if (v42)
      {
        swift_bridgeObjectRetain();
        for (i = 0; i != v42; ++i)
          sub_23A955DC4();
        swift_bridgeObjectRelease();
      }
      sub_23A955DD0();
    }
    swift_bridgeObjectRelease();
    if (v41(v40, 1, v38))
    {
      (*(void (**)(char *, uint64_t))(v51 + 8))(v15, v52);
      v37 = 0;
    }
    else
    {
      v44 = v49;
      v45 = v46;
      (*(void (**)(char *, uint64_t, uint64_t))(v49 + 16))(v46, v40, v38);
      v37 = sub_23A955DE8();
      (*(void (**)(char *, uint64_t))(v44 + 8))(v45, v38);
      (*(void (**)(char *, uint64_t))(v51 + 8))(v15, v52);
    }
    sub_23A95596C(v40);
  }
  return v37;
}

uint64_t sub_23A9552E4()
{
  uint64_t v0;

  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v0 + 24);
  return swift_deallocClassInstance();
}

uint64_t sub_23A955310(uint64_t a1)
{
  return sub_23A954F20(a1);
}

uint64_t type metadata accessor for ExclaveFDRDecodeTrustEvaluationService()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for ExclaveFDRDecodeTrustEvaluationService.Service()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for ExclaveFDRDecodeTrustEvaluationService.Server()
{
  return objc_opt_self();
}

uint64_t sub_23A955390()
{
  return sub_23A955414(&qword_2569CBF58, type metadata accessor for ExclaveFDRDecodeTrustEvaluationService.Server, (uint64_t)&unk_23A9566E0);
}

uint64_t sub_23A9553BC()
{
  return sub_23A955414(&qword_2569CBF60, type metadata accessor for ExclaveFDRDecodeRawDataStoreService.Server, (uint64_t)&unk_23A956758);
}

uint64_t sub_23A9553E8()
{
  return sub_23A955414(&qword_2569CBF68, type metadata accessor for ExclaveFDRDecodeRawDataStoreKitService.Server, (uint64_t)&unk_23A9567D0);
}

uint64_t sub_23A955414(unint64_t *a1, uint64_t (*a2)(void), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2();
    result = MEMORY[0x23B85C528](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_23A955450(unint64_t result, unint64_t a2)
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;

  v3 = result;
  v4 = a2 - result;
  if (a2 < result)
  {
    if ((uint64_t)(result - a2) < 0)
    {
LABEL_16:
      __break(1u);
      goto LABEL_17;
    }
    v4 = a2 - result;
LABEL_5:
    v5 = MEMORY[0x24BEE4AF8];
    if (!v4)
      return v5;
    v10 = MEMORY[0x24BEE4AF8];
    result = (unint64_t)sub_23A95565C(0, v4 & ~(v4 >> 63), 0);
    v6 = a2 - v3;
    if (a2 >= v3 && (v4 & 0x8000000000000000) == 0)
    {
      v5 = v10;
      while (1)
      {
        result = sub_23A955D7C();
        v7 = result;
        v9 = *(_QWORD *)(v10 + 16);
        v8 = *(_QWORD *)(v10 + 24);
        if (v9 >= v8 >> 1)
          result = (unint64_t)sub_23A95565C((char *)(v8 > 1), v9 + 1, 1);
        *(_QWORD *)(v10 + 16) = v9 + 1;
        *(_BYTE *)(v10 + v9 + 32) = v7;
        if (!v6)
          break;
        --v6;
        if (!--v4)
          return v5;
      }
      __break(1u);
    }
    __break(1u);
    goto LABEL_16;
  }
  if ((uint64_t)(a2 - result) >= 0)
    goto LABEL_5;
LABEL_17:
  __break(1u);
  return result;
}

char *sub_23A955568(char *result, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  char *v5;
  char v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;

  v2 = a2 - (_QWORD)result;
  if (__OFSUB__(a2, result))
  {
    __break(1u);
  }
  else
  {
    v3 = MEMORY[0x24BEE4AF8];
    if (!v2)
      return (char *)v3;
    v5 = result;
    v9 = MEMORY[0x24BEE4AF8];
    result = sub_23A95565C(0, v2 & ~(v2 >> 63), 0);
    if (a2 >= (uint64_t)v5 && (v2 & 0x8000000000000000) == 0)
    {
      v3 = v9;
      do
      {
        v6 = sub_23A955D7C();
        v8 = *(_QWORD *)(v9 + 16);
        v7 = *(_QWORD *)(v9 + 24);
        if (v8 >= v7 >> 1)
          sub_23A95565C((char *)(v7 > 1), v8 + 1, 1);
        *(_QWORD *)(v9 + 16) = v8 + 1;
        *(_BYTE *)(v9 + v8 + 32) = v6;
        --v2;
      }
      while (v2);
      return (char *)v3;
    }
  }
  __break(1u);
  return result;
}

char *sub_23A95565C(char *a1, int64_t a2, char a3)
{
  char **v3;
  char *result;

  result = sub_23A955678(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

char *sub_23A955678(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2569CBF78);
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
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v12 >= &v13[v8])
      memmove(v12, v13, v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v12, v13, v8);
  }
  swift_release();
  return v10;
}

uint64_t sub_23A955760()
{
  uint64_t result;

  result = sub_23A955D94();
  if (result != 0xD1E1F592CBAABCE3)
  {
    sub_23A955E78();
    sub_23A955E60();
    sub_23A955E90();
    sub_23A955E60();
    swift_bridgeObjectRelease();
    result = sub_23A955E84();
    __break(1u);
  }
  return result;
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_23A955868()
{
  uint64_t v0;
  uint64_t result;

  v0 = sub_23A955D94();
  if (v0 == 0xBE6B44F35C5CA9B9)
    return 1;
  if (v0 == 0xE6C698D5A150ECB8)
    return 0;
  sub_23A955E78();
  swift_bridgeObjectRelease();
  sub_23A955E90();
  sub_23A955E60();
  swift_bridgeObjectRelease();
  result = sub_23A955E84();
  __break(1u);
  return result;
}

uint64_t sub_23A95596C(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569CBF70);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_23A9559AC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569CBF70);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_23A9559F8()
{
  uint64_t v0;
  uint64_t result;

  v0 = sub_23A955D94();
  if (v0 == 0xF8BE6A6F727628E8)
    return 0;
  if (v0 == 0x85CCB4C7D58863A4)
    return 1;
  sub_23A955E78();
  sub_23A955E60();
  sub_23A955E90();
  sub_23A955E60();
  swift_bridgeObjectRelease();
  result = sub_23A955E84();
  __break(1u);
  return result;
}

uint64_t sub_23A955B00()
{
  uint64_t result;

  result = sub_23A955D94();
  if (result != 0x3CABAAF6E5F14886)
  {
    sub_23A955E78();
    sub_23A955E60();
    sub_23A955E90();
    sub_23A955E60();
    swift_bridgeObjectRelease();
    result = sub_23A955E84();
    __break(1u);
  }
  return result;
}

uint64_t __swift_destroy_boxed_opaque_existential_1(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

unint64_t sub_23A955C04()
{
  unint64_t result;

  result = qword_2569CBF80;
  if (!qword_2569CBF80)
  {
    result = MEMORY[0x23B85C528](&unk_23A9569F8, &type metadata for ExclaveFDRDecodeError);
    atomic_store(result, (unint64_t *)&qword_2569CBF80);
  }
  return result;
}

ValueMetadata *type metadata accessor for ExclaveFDRDecodeError()
{
  return &type metadata for ExclaveFDRDecodeError;
}

unint64_t sub_23A955C5C()
{
  unint64_t result;

  result = qword_2569CBF88;
  if (!qword_2569CBF88)
  {
    result = MEMORY[0x23B85C528](&unk_23A956898, &type metadata for ExclaveFDRDecodeError);
    atomic_store(result, (unint64_t *)&qword_2569CBF88);
  }
  return result;
}

unint64_t sub_23A955CA4()
{
  unint64_t result;

  result = qword_2569CBF90;
  if (!qword_2569CBF90)
  {
    result = MEMORY[0x23B85C528](&unk_23A956868, &type metadata for ExclaveFDRDecodeError);
    atomic_store(result, (unint64_t *)&qword_2569CBF90);
  }
  return result;
}

unint64_t sub_23A955CEC()
{
  unint64_t result;

  result = qword_2569CBF98;
  if (!qword_2569CBF98)
  {
    result = MEMORY[0x23B85C528](&unk_23A9568C0, &type metadata for ExclaveFDRDecodeError);
    atomic_store(result, (unint64_t *)&qword_2569CBF98);
  }
  return result;
}

unint64_t sub_23A955D34()
{
  unint64_t result;

  result = qword_2569CBFA0;
  if (!qword_2569CBFA0)
  {
    result = MEMORY[0x23B85C528](&unk_23A9568F8, &type metadata for ExclaveFDRDecodeError);
    atomic_store(result, (unint64_t *)&qword_2569CBFA0);
  }
  return result;
}

uint64_t sub_23A955D7C()
{
  return MEMORY[0x24BEB6E20]();
}

uint64_t sub_23A955D88()
{
  return MEMORY[0x24BEB6E30]();
}

uint64_t sub_23A955D94()
{
  return MEMORY[0x24BEB6E38]();
}

uint64_t sub_23A955DA0()
{
  return MEMORY[0x24BEB6E50]();
}

uint64_t sub_23A955DAC()
{
  return MEMORY[0x24BEB6E58]();
}

uint64_t sub_23A955DB8()
{
  return MEMORY[0x24BEB6E68]();
}

uint64_t sub_23A955DC4()
{
  return MEMORY[0x24BEB6E88]();
}

uint64_t sub_23A955DD0()
{
  return MEMORY[0x24BEB6E90]();
}

uint64_t sub_23A955DDC()
{
  return MEMORY[0x24BEB6EA8]();
}

uint64_t sub_23A955DE8()
{
  return MEMORY[0x24BEB6EB0]();
}

uint64_t sub_23A955DF4()
{
  return MEMORY[0x24BEB6EC0]();
}

uint64_t sub_23A955E00()
{
  return MEMORY[0x24BEB6EE0]();
}

uint64_t sub_23A955E0C()
{
  return MEMORY[0x24BEB6EF0]();
}

uint64_t sub_23A955E18()
{
  return MEMORY[0x24BEB6EF8]();
}

uint64_t sub_23A955E24()
{
  return MEMORY[0x24BEB6F00]();
}

uint64_t sub_23A955E30()
{
  return MEMORY[0x24BEB6F10]();
}

uint64_t sub_23A955E3C()
{
  return MEMORY[0x24BEB6F20]();
}

uint64_t sub_23A955E48()
{
  return MEMORY[0x24BEB6F60]();
}

uint64_t sub_23A955E54()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_23A955E60()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_23A955E6C()
{
  return MEMORY[0x24BEE22B0]();
}

uint64_t sub_23A955E78()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_23A955E84()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_23A955E90()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_23A955E9C()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_23A955EA8()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_23A955EB4()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_23A955EC0()
{
  return MEMORY[0x24BEE3F18]();
}

uint64_t sub_23A955ECC()
{
  return MEMORY[0x24BEE42C0]();
}

uint64_t sub_23A955ED8()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_23A955EE4()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_23A955EF0()
{
  return MEMORY[0x24BEE4328]();
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

uint64_t objc_opt_self()
{
  return MEMORY[0x24BEDD168]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x24BEE4B68]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x24BEE4BC0]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x24BEE4BD0]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x24BEE4C00]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x24BEE4C18]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x24BEE4C38]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x24BEE4CA0]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x24BEE4CA8]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x24BEE4E10]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x24BEE4E20]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x24BEE4EA8]();
}

uint64_t swift_release()
{
  return MEMORY[0x24BEE4EF8]();
}

uint64_t swift_retain()
{
  return MEMORY[0x24BEE4F08]();
}

