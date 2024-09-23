ALDataTypes::ALBtAdvertisement::BtType_optional __swiftcall ALBtAdvertisement.BtType.init(rawValue:)(Swift::Int rawValue)
{
  char *v1;
  char v2;
  char v3;

  if (rawValue == 18)
    v2 = 2;
  else
    v2 = 3;
  if (rawValue == 7)
    v3 = 1;
  else
    v3 = v2;
  if (!rawValue)
    v3 = 0;
  *v1 = v3;
  return (ALDataTypes::ALBtAdvertisement::BtType_optional)rawValue;
}

uint64_t ALBtAdvertisement.BtType.rawValue.getter()
{
  char *v0;

  return qword_2358C8F30[*v0];
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance ALBtAdvertisement.BtType(char *a1, char *a2)
{
  return qword_2358C8F30[*a1] == qword_2358C8F30[*a2];
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance ALBtAdvertisement.BtType()
{
  char *v0;
  uint64_t v1;

  v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(qword_2358C8F30[v1]);
  return Hasher._finalize()();
}

void protocol witness for Hashable.hash(into:) in conformance ALBtAdvertisement.BtType()
{
  char *v0;

  Hasher._combine(_:)(qword_2358C8F30[*v0]);
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance ALBtAdvertisement.BtType()
{
  char *v0;
  uint64_t v1;

  v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(qword_2358C8F30[v1]);
  return Hasher._finalize()();
}

ALDataTypes::ALBtAdvertisement::BtType_optional protocol witness for RawRepresentable.init(rawValue:) in conformance ALBtAdvertisement.BtType(Swift::Int *a1)
{
  return ALBtAdvertisement.BtType.init(rawValue:)(*a1);
}

void protocol witness for RawRepresentable.rawValue.getter in conformance ALBtAdvertisement.BtType(_QWORD *a1@<X8>)
{
  char *v1;

  *a1 = qword_2358C8F30[*v1];
}

uint64_t ALBtAdvertisement.machContTimeNs.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

uint64_t ALBtAdvertisement.mac.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 16);
}

unint64_t ALBtAdvertisement.rssidB.getter()
{
  uint64_t v0;

  return *(unsigned int *)(v0 + 28) | ((unint64_t)*(unsigned __int8 *)(v0 + 32) << 32);
}

unint64_t ALBtAdvertisement.channel.getter()
{
  uint64_t v0;

  return *(unsigned int *)(v0 + 36) | ((unint64_t)*(unsigned __int8 *)(v0 + 40) << 32);
}

void ALBtAdvertisement.type.getter(_BYTE *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_BYTE *)(v1 + 49);
}

uint64_t ALBtAdvertisement.identifier.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 96);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ALBtAdvertisement.idsDeviceID.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 112);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ALBtAdvertisement.payload.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 128);
  outlined copy of Data?(v1, *(_QWORD *)(v0 + 136));
  return v1;
}

uint64_t outlined copy of Data?(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return outlined copy of Data._Representation(a1, a2);
  return a1;
}

uint64_t outlined copy of Data._Representation(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_retain();
  }
  return swift_retain();
}

uint64_t ALBtAdvertisement.deviceFlags.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 56);
}

uint64_t ALBtAdvertisement.discoveryFlags.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 72);
}

uint64_t ALBtAdvertisement.machContTimeSec.getter()
{
  uint64_t v0;
  uint64_t result;
  double v2;

  if ((*(_BYTE *)(v0 + 8) & 1) != 0)
  {
    *(double *)&result = 0.0;
  }
  else
  {
    v2 = (double)*(unint64_t *)v0;
    *(double *)&result = NsToSec.getter() * v2;
  }
  return result;
}

uint64_t ALBtAdvertisement.cfAbsTimeSec.getter()
{
  uint64_t v0;
  uint64_t result;
  double v2;
  double v3;
  double v4;
  double v5;

  if ((*(_BYTE *)(v0 + 8) & 1) != 0)
  {
    *(double *)&result = 0.0;
  }
  else
  {
    v2 = (double)*(unint64_t *)v0;
    v3 = NsToSec.getter() * v2;
    type metadata accessor for TimesSync();
    static TimesSync.instance.getter();
    dispatch thunk of TimesSync.cfaMinusMctSec.getter();
    v5 = v4;
    swift_release();
    *(double *)&result = v3 + v5;
  }
  return result;
}

uint64_t ALBtAdvertisement.description.getter()
{
  uint64_t v0;
  int v1;
  unint64_t v2;
  char v3;
  int v4;
  int v5;
  int v6;
  unint64_t v7;
  uint64_t v8;
  double v9;
  uint64_t v10;
  Swift::String v11;
  Swift::String v12;
  uint64_t v13;
  uint64_t v14;
  Swift::String v15;
  uint64_t countAndFlagsBits;
  void *object;
  Swift::String v18;
  Swift::String v19;
  int v20;
  Swift::String v21;
  Swift::String v22;
  Swift::String v23;
  int v24;
  Swift::String v25;
  Swift::String v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  Swift::String v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  Swift::String v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  Swift::String v38;
  uint64_t v39;
  uint64_t v40;
  Swift::String v41;
  Swift::String v42;
  Swift::String v43;
  Swift::String v45;
  uint64_t v46;
  Swift::String v47;
  __int16 v48;
  int v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  int v53;
  char v54;
  char v55;
  int v56;
  char v57;
  char v58;
  int v59;
  uint64_t v60;
  Swift::String v61;
  uint64_t v62;
  uint64_t v63;
  Swift::String v64;

  v1 = *(unsigned __int8 *)(v0 + 8);
  v2 = *(_QWORD *)(v0 + 16);
  v3 = *(_BYTE *)(v0 + 24);
  v4 = *(_DWORD *)(v0 + 28);
  v5 = *(unsigned __int8 *)(v0 + 32);
  v6 = *(unsigned __int8 *)(v0 + 40);
  v56 = *(char *)(v0 + 49);
  v50 = *(_QWORD *)(v0 + 56);
  v51 = *(_QWORD *)(v0 + 72);
  v57 = *(_BYTE *)(v0 + 64);
  v58 = *(_BYTE *)(v0 + 80);
  v53 = *(_DWORD *)(v0 + 36);
  v54 = *(_BYTE *)(v0 + 84);
  v48 = *(_WORD *)(v0 + 82);
  v49 = *(_DWORD *)(v0 + 88);
  v55 = *(_BYTE *)(v0 + 92);
  v52 = *(_QWORD *)(v0 + 96);
  v60 = *(_QWORD *)(v0 + 104);
  v59 = *(_DWORD *)(v0 + 149);
  v7 = *(_QWORD *)v0;
  v61._countAndFlagsBits = 980706157;
  v61._object = (void *)0xE400000000000000;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<CVarArg>);
  v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_2358C8C60;
  v9 = (double)v7 * 0.000000001;
  v10 = MEMORY[0x24BEE1448];
  if (v1)
    v9 = 0.0;
  *(_QWORD *)(v8 + 56) = MEMORY[0x24BEE13C8];
  *(_QWORD *)(v8 + 64) = v10;
  *(double *)(v8 + 32) = v9;
  v11._countAndFlagsBits = String.init(format:_:)();
  String.append(_:)(v11);
  swift_bridgeObjectRelease();
  v12 = v61;
  v61._countAndFlagsBits = 0;
  v61._object = (void *)0xE000000000000000;
  _StringGuts.grow(_:)(19);
  swift_bridgeObjectRelease();
  v64._countAndFlagsBits = 0xD000000000000011;
  v64._object = (void *)0x80000002358C9620;
  v13 = swift_allocObject();
  *(_OWORD *)(v13 + 16) = xmmword_2358C8C60;
  if ((v3 & 1) != 0)
  {
    v14 = MEMORY[0x24BEE17F0];
    *(_QWORD *)(v13 + 56) = MEMORY[0x24BEE1768];
    *(_QWORD *)(v13 + 64) = v14;
    *(_QWORD *)(v13 + 32) = 0;
  }
  else
  {
    v62 = MEMORY[0x24BEE4568];
    v63 = MEMORY[0x24BEE45B8];
    v61._countAndFlagsBits = bswap64(v2);
    outlined init with take of CVarArg((__int128 *)&v61._countAndFlagsBits, v13 + 32);
  }
  v15._countAndFlagsBits = String.init(format:_:)();
  String.append(_:)(v15);
  swift_bridgeObjectRelease();
  countAndFlagsBits = v64._countAndFlagsBits;
  object = v64._object;
  v61 = v12;
  swift_bridgeObjectRetain();
  v18._countAndFlagsBits = countAndFlagsBits;
  v18._object = object;
  String.append(_:)(v18);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v19 = v61;
  v61._countAndFlagsBits = 0x3A69737372202CLL;
  v61._object = (void *)0xE700000000000000;
  if (v5)
    v20 = 0;
  else
    v20 = v4;
  LODWORD(v64._countAndFlagsBits) = v20;
  v21._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v21);
  swift_bridgeObjectRelease();
  v22 = v61;
  v61 = v19;
  swift_bridgeObjectRetain();
  String.append(_:)(v22);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v23 = v61;
  v61._countAndFlagsBits = 0x656E6E616863202CLL;
  v61._object = (void *)0xEA00000000003A6CLL;
  v24 = v53;
  if (v6)
    v24 = -1;
  LODWORD(v64._countAndFlagsBits) = v24;
  v25._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v25);
  swift_bridgeObjectRelease();
  v26 = v61;
  v61 = v23;
  swift_bridgeObjectRetain();
  String.append(_:)(v26);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v54 & 1) == 0)
  {
    strcpy((char *)&v64, ", vid:0x");
    BYTE1(v64._object) = 0;
    WORD1(v64._object) = 0;
    HIDWORD(v64._object) = -402653184;
    v27 = swift_allocObject();
    v28 = MEMORY[0x24BEE4478];
    *(_OWORD *)(v27 + 16) = xmmword_2358C8C60;
    v29 = MEMORY[0x24BEE44D8];
    *(_QWORD *)(v27 + 56) = v28;
    *(_QWORD *)(v27 + 64) = v29;
    *(_WORD *)(v27 + 32) = v48;
    v30._countAndFlagsBits = String.init(format:_:)();
    String.append(_:)(v30);
    swift_bridgeObjectRelease();
    String.append(_:)(v64);
    swift_bridgeObjectRelease();
  }
  if ((v55 & 1) == 0)
  {
    strcpy((char *)&v64, ", pid:0x");
    BYTE1(v64._object) = 0;
    WORD1(v64._object) = 0;
    HIDWORD(v64._object) = -402653184;
    v31 = swift_allocObject();
    v32 = MEMORY[0x24BEE44F0];
    *(_OWORD *)(v31 + 16) = xmmword_2358C8C60;
    v33 = MEMORY[0x24BEE4558];
    *(_QWORD *)(v31 + 56) = v32;
    *(_QWORD *)(v31 + 64) = v33;
    *(_DWORD *)(v31 + 32) = v49;
    v34._countAndFlagsBits = String.init(format:_:)();
    String.append(_:)(v34);
    swift_bridgeObjectRelease();
    String.append(_:)(v64);
    swift_bridgeObjectRelease();
  }
  v35 = MEMORY[0x24BEE4568];
  v36 = MEMORY[0x24BEE45B8];
  if (v56 == 3)
  {
    if ((v57 & 1) != 0)
      goto LABEL_17;
  }
  else
  {
    strcpy((char *)&v64, ", type:");
    v64._object = (void *)0xE700000000000000;
    v45._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
    String.append(_:)(v45);
    swift_bridgeObjectRelease();
    String.append(_:)(v64);
    swift_bridgeObjectRelease();
    if ((v57 & 1) != 0)
    {
LABEL_17:
      if ((v58 & 1) != 0)
        goto LABEL_19;
      goto LABEL_18;
    }
  }
  v64._countAndFlagsBits = 0;
  v64._object = (void *)0xE000000000000000;
  _StringGuts.grow(_:)(18);
  swift_bridgeObjectRelease();
  v64._countAndFlagsBits = 0xD000000000000010;
  v64._object = (void *)0x80000002358C9660;
  v46 = swift_allocObject();
  *(_OWORD *)(v46 + 16) = xmmword_2358C8C60;
  *(_QWORD *)(v46 + 56) = v35;
  *(_QWORD *)(v46 + 64) = v36;
  *(_QWORD *)(v46 + 32) = v50;
  v47._countAndFlagsBits = String.init(format:_:)();
  String.append(_:)(v47);
  swift_bridgeObjectRelease();
  String.append(_:)(v64);
  swift_bridgeObjectRelease();
  if ((v58 & 1) == 0)
  {
LABEL_18:
    v64._countAndFlagsBits = 0;
    v64._object = (void *)0xE000000000000000;
    _StringGuts.grow(_:)(21);
    swift_bridgeObjectRelease();
    v64._countAndFlagsBits = 0xD000000000000013;
    v64._object = (void *)0x80000002358C9640;
    v37 = swift_allocObject();
    *(_OWORD *)(v37 + 16) = xmmword_2358C8C60;
    *(_QWORD *)(v37 + 56) = v35;
    *(_QWORD *)(v37 + 64) = v36;
    *(_QWORD *)(v37 + 32) = v51;
    v38._countAndFlagsBits = String.init(format:_:)();
    String.append(_:)(v38);
    swift_bridgeObjectRelease();
    String.append(_:)(v64);
    swift_bridgeObjectRelease();
  }
LABEL_19:
  v39 = v60;
  if (v60)
  {
    strcpy((char *)&v64, ", identifier:");
    HIWORD(v64._object) = -4864;
    v40 = v52;
    String.append(_:)(*(Swift::String *)(&v39 - 1));
    String.append(_:)(v64);
    swift_bridgeObjectRelease();
  }
  if (v59 != 3)
  {
    strcpy((char *)&v64, ", type7:{");
    WORD1(v64._object) = 0;
    HIDWORD(v64._object) = -385875968;
    v41._countAndFlagsBits = ALBtAdvInfoType7.description.getter();
    String.append(_:)(v41);
    swift_bridgeObjectRelease();
    v42._countAndFlagsBits = 125;
    v42._object = (void *)0xE100000000000000;
    String.append(_:)(v42);
    String.append(_:)(v64);
    swift_bridgeObjectRelease();
  }
  v64._countAndFlagsBits = 0x7B20744223;
  v64._object = (void *)0xE500000000000000;
  String.append(_:)(v61);
  swift_bridgeObjectRelease();
  v43._countAndFlagsBits = 125;
  v43._object = (void *)0xE100000000000000;
  String.append(_:)(v43);
  return v64._countAndFlagsBits;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x23B7DA48C]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t ALBtAdvInfoType7.description.getter()
{
  unsigned __int8 *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  Swift::String v7;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  Swift::String v24;
  uint64_t v25;
  unint64_t v26;

  v1 = *v0;
  v2 = v0[1];
  v3 = v0[2];
  v4 = v0[3];
  v5 = v0[4];
  v6 = v0[5];
  v25 = 0;
  v26 = 0xE000000000000000;
  if (v1 == 2)
  {
    if (v2 == 2)
      goto LABEL_3;
  }
  else
  {
    strcpy((char *)&v24, "sameAccount:");
    BYTE5(v24._object) = 0;
    HIWORD(v24._object) = -5120;
    if ((v1 & 1) != 0)
      v9 = 1702195828;
    else
      v9 = 0x65736C6166;
    if ((v1 & 1) != 0)
      v10 = 0xE400000000000000;
    else
      v10 = 0xE500000000000000;
    v11 = v10;
    String.append(_:)(*(Swift::String *)&v9);
    swift_bridgeObjectRelease();
    String.append(_:)(v24);
    swift_bridgeObjectRelease();
    if (v2 == 2)
    {
LABEL_3:
      if (v3 == 2)
        goto LABEL_4;
      goto LABEL_23;
    }
  }
  strcpy((char *)&v24, ",family:");
  BYTE1(v24._object) = 0;
  WORD1(v24._object) = 0;
  HIDWORD(v24._object) = -402653184;
  if ((v2 & 1) != 0)
    v12 = 1702195828;
  else
    v12 = 0x65736C6166;
  if ((v2 & 1) != 0)
    v13 = 0xE400000000000000;
  else
    v13 = 0xE500000000000000;
  v14 = v13;
  String.append(_:)(*(Swift::String *)&v12);
  swift_bridgeObjectRelease();
  String.append(_:)(v24);
  swift_bridgeObjectRelease();
  if (v3 == 2)
  {
LABEL_4:
    if (v4 == 2)
      goto LABEL_5;
    goto LABEL_30;
  }
LABEL_23:
  strcpy((char *)&v24, ",sharedHome:");
  BYTE5(v24._object) = 0;
  HIWORD(v24._object) = -5120;
  if ((v3 & 1) != 0)
    v15 = 1702195828;
  else
    v15 = 0x65736C6166;
  if ((v3 & 1) != 0)
    v16 = 0xE400000000000000;
  else
    v16 = 0xE500000000000000;
  v17 = v16;
  String.append(_:)(*(Swift::String *)&v15);
  swift_bridgeObjectRelease();
  String.append(_:)(v24);
  swift_bridgeObjectRelease();
  if (v4 == 2)
  {
LABEL_5:
    if (v5 == 2)
      goto LABEL_6;
LABEL_37:
    strcpy((char *)&v24, ",inCase:");
    BYTE1(v24._object) = 0;
    WORD1(v24._object) = 0;
    HIDWORD(v24._object) = -402653184;
    if ((v5 & 1) != 0)
      v21 = 1702195828;
    else
      v21 = 0x65736C6166;
    if ((v5 & 1) != 0)
      v22 = 0xE400000000000000;
    else
      v22 = 0xE500000000000000;
    v23 = v22;
    String.append(_:)(*(Swift::String *)&v21);
    swift_bridgeObjectRelease();
    String.append(_:)(v24);
    swift_bridgeObjectRelease();
    if (v6 != 8)
      goto LABEL_7;
    return v25;
  }
LABEL_30:
  v24._countAndFlagsBits = 0x3A7466656C2CLL;
  v24._object = (void *)0xE600000000000000;
  if ((v4 & 1) != 0)
    v18 = 1702195828;
  else
    v18 = 0x65736C6166;
  if ((v4 & 1) != 0)
    v19 = 0xE400000000000000;
  else
    v19 = 0xE500000000000000;
  v20 = v19;
  String.append(_:)(*(Swift::String *)&v18);
  swift_bridgeObjectRelease();
  String.append(_:)(v24);
  swift_bridgeObjectRelease();
  if (v5 != 2)
    goto LABEL_37;
LABEL_6:
  if (v6 != 8)
  {
LABEL_7:
    strcpy((char *)&v24, ",placement:");
    HIDWORD(v24._object) = -352321536;
    v7._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
    String.append(_:)(v7);
    swift_bridgeObjectRelease();
    String.append(_:)(v24);
    swift_bridgeObjectRelease();
  }
  return v25;
}

uint64_t outlined init with take of CVarArg(__int128 *a1, uint64_t a2)
{
  __int128 v2;
  __int128 v3;

  v2 = *a1;
  v3 = a1[1];
  *(_QWORD *)(a2 + 32) = *((_QWORD *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

double ALBtAdvertisement.init()@<D0>(uint64_t a1@<X8>)
{
  double result;

  *(_QWORD *)a1 = 0;
  *(_BYTE *)(a1 + 8) = 1;
  *(_QWORD *)(a1 + 16) = 0;
  *(_BYTE *)(a1 + 24) = 1;
  *(_DWORD *)(a1 + 28) = 0;
  *(_BYTE *)(a1 + 32) = 1;
  *(_DWORD *)(a1 + 36) = 0;
  *(_BYTE *)(a1 + 40) = 1;
  *(_DWORD *)(a1 + 44) = 0;
  *(_WORD *)(a1 + 48) = 769;
  *(_QWORD *)(a1 + 56) = 0;
  *(_BYTE *)(a1 + 64) = 1;
  *(_QWORD *)(a1 + 72) = 0;
  *(_BYTE *)(a1 + 80) = 1;
  *(_WORD *)(a1 + 82) = 0;
  *(_BYTE *)(a1 + 84) = 1;
  *(_DWORD *)(a1 + 88) = 0;
  *(_BYTE *)(a1 + 92) = 1;
  result = 0.0;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_QWORD *)(a1 + 128) = 0;
  *(_QWORD *)(a1 + 136) = 0xF000000000000000;
  *(_DWORD *)(a1 + 144) = 0;
  *(_BYTE *)(a1 + 148) = 1;
  *(_WORD *)(a1 + 153) = 0;
  *(_DWORD *)(a1 + 149) = 3;
  return result;
}

uint64_t variable initialization expression of ALBtAdvertisement._machContTimeNs()
{
  return 0;
}

void variable initialization expression of ALBtAdvertisement._type(_BYTE *a1@<X8>)
{
  *a1 = 3;
}

uint64_t variable initialization expression of ALBtAdvertisement._vendorID()
{
  return 0x10000;
}

uint64_t variable initialization expression of ALBtAdvertisement._productID()
{
  return 0x100000000;
}

uint64_t variable initialization expression of ALBtAdvertisement._identifier()
{
  return 0;
}

uint64_t variable initialization expression of ALBtAdvertisement._payload()
{
  return 0;
}

void variable initialization expression of ALBtAdvertisement._type7Info(uint64_t a1@<X8>)
{
  *(_WORD *)(a1 + 4) = 0;
  *(_DWORD *)a1 = 3;
}

uint64_t ALBtAdvertisement._machContTimeNs.setter(uint64_t result, char a2)
{
  uint64_t v2;

  *(_QWORD *)v2 = result;
  *(_BYTE *)(v2 + 8) = a2 & 1;
  return result;
}

uint64_t (*ALBtAdvertisement._machContTimeNs.modify())()
{
  return ALBtAdvertisement._machContTimeNs.modify;
}

uint64_t ALBtAdvertisement._mac.setter(uint64_t result, char a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 16) = result;
  *(_BYTE *)(v2 + 24) = a2 & 1;
  return result;
}

uint64_t (*ALBtAdvertisement._mac.modify())()
{
  return ALBtAdvertisement._machContTimeNs.modify;
}

uint64_t ALBtAdvertisement._rssidB.setter(uint64_t result)
{
  uint64_t v1;

  *(_DWORD *)(v1 + 28) = result;
  *(_BYTE *)(v1 + 32) = BYTE4(result) & 1;
  return result;
}

uint64_t (*ALBtAdvertisement._rssidB.modify())()
{
  return ALBtAdvertisement._machContTimeNs.modify;
}

uint64_t ALBtAdvertisement._channel.setter(uint64_t result)
{
  uint64_t v1;

  *(_DWORD *)(v1 + 36) = result;
  *(_BYTE *)(v1 + 40) = BYTE4(result) & 1;
  return result;
}

uint64_t (*ALBtAdvertisement._channel.modify())()
{
  return ALBtAdvertisement._machContTimeNs.modify;
}

unint64_t ALBtAdvertisement._antennaIndex.getter()
{
  uint64_t v0;

  return *(unsigned int *)(v0 + 44) | ((unint64_t)*(unsigned __int8 *)(v0 + 48) << 32);
}

uint64_t ALBtAdvertisement._antennaIndex.setter(uint64_t result)
{
  uint64_t v1;

  *(_DWORD *)(v1 + 44) = result;
  *(_BYTE *)(v1 + 48) = BYTE4(result) & 1;
  return result;
}

uint64_t (*ALBtAdvertisement._antennaIndex.modify())()
{
  return ALBtAdvertisement._machContTimeNs.modify;
}

_BYTE *ALBtAdvertisement._type.setter(_BYTE *result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 49) = *result;
  return result;
}

uint64_t (*ALBtAdvertisement._type.modify())()
{
  return ALBtAdvertisement._machContTimeNs.modify;
}

uint64_t ALBtAdvertisement._deviceFlags.setter(uint64_t result, char a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 56) = result;
  *(_BYTE *)(v2 + 64) = a2 & 1;
  return result;
}

uint64_t (*ALBtAdvertisement._deviceFlags.modify())()
{
  return ALBtAdvertisement._machContTimeNs.modify;
}

uint64_t ALBtAdvertisement._discoveryFlags.setter(uint64_t result, char a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 72) = result;
  *(_BYTE *)(v2 + 80) = a2 & 1;
  return result;
}

uint64_t (*ALBtAdvertisement._discoveryFlags.modify())()
{
  return ALBtAdvertisement._machContTimeNs.modify;
}

uint64_t ALBtAdvertisement._vendorID.getter()
{
  uint64_t v0;

  return *(unsigned __int16 *)(v0 + 82) | (*(unsigned __int8 *)(v0 + 84) << 16);
}

uint64_t ALBtAdvertisement._vendorID.setter(uint64_t result)
{
  uint64_t v1;

  *(_WORD *)(v1 + 82) = result;
  *(_BYTE *)(v1 + 84) = BYTE2(result) & 1;
  return result;
}

uint64_t (*ALBtAdvertisement._vendorID.modify())()
{
  return ALBtAdvertisement._machContTimeNs.modify;
}

unint64_t ALBtAdvertisement._productID.getter()
{
  uint64_t v0;

  return *(unsigned int *)(v0 + 88) | ((unint64_t)*(unsigned __int8 *)(v0 + 92) << 32);
}

uint64_t ALBtAdvertisement._productID.setter(uint64_t result)
{
  uint64_t v1;

  *(_DWORD *)(v1 + 88) = result;
  *(_BYTE *)(v1 + 92) = BYTE4(result) & 1;
  return result;
}

uint64_t (*ALBtAdvertisement._productID.modify())()
{
  return ALBtAdvertisement._machContTimeNs.modify;
}

uint64_t ALBtAdvertisement._identifier.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 96) = a1;
  *(_QWORD *)(v2 + 104) = a2;
  return result;
}

uint64_t (*ALBtAdvertisement._identifier.modify())()
{
  return ALBtAdvertisement._machContTimeNs.modify;
}

uint64_t ALBtAdvertisement._idsDeviceID.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 112) = a1;
  *(_QWORD *)(v2 + 120) = a2;
  return result;
}

uint64_t (*ALBtAdvertisement._idsDeviceID.modify())()
{
  return ALBtAdvertisement._machContTimeNs.modify;
}

uint64_t ALBtAdvertisement._payload.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = outlined consume of Data?(*(_QWORD *)(v2 + 128), *(_QWORD *)(v2 + 136));
  *(_QWORD *)(v2 + 128) = a1;
  *(_QWORD *)(v2 + 136) = a2;
  return result;
}

uint64_t (*ALBtAdvertisement._payload.modify())()
{
  return ALBtAdvertisement._machContTimeNs.modify;
}

unint64_t ALBtAdvertisement._deviceInfoKw.getter()
{
  uint64_t v0;

  return *(unsigned int *)(v0 + 144) | ((unint64_t)*(unsigned __int8 *)(v0 + 148) << 32);
}

uint64_t ALBtAdvertisement._deviceInfoKw.setter(uint64_t result)
{
  uint64_t v1;

  *(_DWORD *)(v1 + 144) = result;
  *(_BYTE *)(v1 + 148) = BYTE4(result) & 1;
  return result;
}

uint64_t (*ALBtAdvertisement._deviceInfoKw.modify())()
{
  return ALBtAdvertisement._machContTimeNs.modify;
}

void ALBtAdvertisement._type7Info.getter(uint64_t a1@<X8>)
{
  uint64_t v1;
  int v2;

  v2 = *(_DWORD *)(v1 + 149);
  *(_WORD *)(a1 + 4) = *(_WORD *)(v1 + 153);
  *(_DWORD *)a1 = v2;
}

int *ALBtAdvertisement._type7Info.setter(int *result)
{
  uint64_t v1;
  int v2;

  v2 = *result;
  *(_WORD *)(v1 + 153) = *((_WORD *)result + 2);
  *(_DWORD *)(v1 + 149) = v2;
  return result;
}

uint64_t (*ALBtAdvertisement._type7Info.modify())()
{
  return ALBtAdvertisement._machContTimeNs.modify;
}

uint64_t ALBtNotification.isApOn.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 57);
}

uint64_t ALBtNotification.isScreenOn.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 58);
}

uint64_t ALBtNotification.advertisements.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t ALBtNotification.description.getter()
{
  _BYTE *v0;
  char v1;
  int v2;
  Swift::String v3;
  Swift::String v4;
  Swift::String v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  Swift::String v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  Swift::String v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  Swift::String v17;
  int v19;
  int v20;

  v1 = v0[41];
  v2 = v0[57];
  v19 = v0[58];
  v20 = v0[56];
  v3._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v3);
  swift_bridgeObjectRelease();
  if ((v1 & 1) == 0)
  {
    lazy protocol witness table accessor for type ALTimeStamp and conformance ALTimeStamp();
    v4._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
    String.append(_:)(v4);
    swift_bridgeObjectRelease();
    v5._countAndFlagsBits = 0x3A656D69742CLL;
    v5._object = (void *)0xE600000000000000;
    String.append(_:)(v5);
    swift_bridgeObjectRelease();
  }
  if (v2 != 2)
  {
    if ((v2 & 1) != 0)
      v6 = 1702195828;
    else
      v6 = 0x65736C6166;
    if ((v2 & 1) != 0)
      v7 = 0xE400000000000000;
    else
      v7 = 0xE500000000000000;
    v8 = v7;
    String.append(_:)(*(Swift::String *)&v6);
    swift_bridgeObjectRelease();
    v9._countAndFlagsBits = 0x3A6E4F70612CLL;
    v9._object = (void *)0xE600000000000000;
    String.append(_:)(v9);
    swift_bridgeObjectRelease();
  }
  if (v19 != 2)
  {
    if ((v19 & 1) != 0)
      v10 = 1702195828;
    else
      v10 = 0x65736C6166;
    if ((v19 & 1) != 0)
      v11 = 0xE400000000000000;
    else
      v11 = 0xE500000000000000;
    v12 = v11;
    String.append(_:)(*(Swift::String *)&v10);
    swift_bridgeObjectRelease();
    v13._countAndFlagsBits = 0x4F6E65657263732CLL;
    v13._object = (void *)0xEA00000000003A6ELL;
    String.append(_:)(v13);
    swift_bridgeObjectRelease();
  }
  if (v20 != 2)
  {
    if ((v20 & 1) != 0)
      v14 = 1702195828;
    else
      v14 = 0x65736C6166;
    if ((v20 & 1) != 0)
      v15 = 0xE400000000000000;
    else
      v15 = 0xE500000000000000;
    v16 = v15;
    String.append(_:)(*(Swift::String *)&v14);
    swift_bridgeObjectRelease();
    v17._countAndFlagsBits = 0x74616C756D69732CLL;
    v17._object = (void *)0xEB000000003A6465;
    String.append(_:)(v17);
    swift_bridgeObjectRelease();
  }
  return 0x3A746E756F63;
}

void __swiftcall ALBtNotification.init()(ALDataTypes::ALBtNotification *__return_ptr retstr)
{
  void *v1;

  *(_OWORD *)retstr->_timestamp.value.gap19 = 0u;
  *(_OWORD *)&retstr->_timestamp.value._cfAbsoluteTimeSec.value = 0u;
  *(_OWORD *)&retstr->_timestamp.value._machAbsoluteTimeSec.value = 0u;
  v1 = (void *)MEMORY[0x24BEE4AF8];
  retstr->_timestamp.is_nil = 1;
  retstr->_advertisements._rawValue = v1;
  *(_WORD *)&retstr->_simulated.value = 514;
  retstr->_isScreenOn.value = 2;
}

double variable initialization expression of ALBtNotification._timestamp@<D0>(uint64_t a1@<X8>)
{
  double result;

  result = 0.0;
  *(_OWORD *)(a1 + 25) = 0u;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_BYTE *)(a1 + 41) = 1;
  return result;
}

uint64_t variable initialization expression of ALBtNotification._advertisements()
{
  return MEMORY[0x24BEE4AF8];
}

uint64_t variable initialization expression of ALBtNotification._simulated()
{
  return 2;
}

__n128 ALBtNotification.timestamp.getter@<Q0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  char v3;
  char v4;
  __n128 result;
  __int128 v6;

  v2 = *(_QWORD *)(v1 + 32);
  v3 = *(_BYTE *)(v1 + 40);
  v4 = *(_BYTE *)(v1 + 41);
  result = *(__n128 *)v1;
  v6 = *(_OWORD *)(v1 + 16);
  *(_OWORD *)a1 = *(_OWORD *)v1;
  *(_OWORD *)(a1 + 16) = v6;
  *(_QWORD *)(a1 + 32) = v2;
  *(_BYTE *)(a1 + 40) = v3;
  *(_BYTE *)(a1 + 41) = v4;
  return result;
}

__n128 ALBtNotification._timestamp.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  char v3;
  char v4;
  __n128 result;
  __int128 v6;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_BYTE *)(a1 + 40);
  v4 = *(_BYTE *)(a1 + 41);
  result = *(__n128 *)a1;
  v6 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)v1 = *(_OWORD *)a1;
  *(_OWORD *)(v1 + 16) = v6;
  *(_QWORD *)(v1 + 32) = v2;
  *(_BYTE *)(v1 + 40) = v3;
  *(_BYTE *)(v1 + 41) = v4;
  return result;
}

uint64_t (*ALBtNotification._timestamp.modify())()
{
  return ALBtAdvertisement._machContTimeNs.modify;
}

uint64_t ALBtNotification._advertisements.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 48) = a1;
  return result;
}

uint64_t (*ALBtNotification._advertisements.modify())()
{
  return ALBtAdvertisement._machContTimeNs.modify;
}

uint64_t ALBtNotification._simulated.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 56);
}

uint64_t ALBtNotification._simulated.setter(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 56) = result;
  return result;
}

uint64_t (*ALBtNotification._simulated.modify())()
{
  return ALBtAdvertisement._machContTimeNs.modify;
}

uint64_t ALBtNotification._isApOn.setter(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 57) = result;
  return result;
}

uint64_t (*ALBtNotification._isApOn.modify())()
{
  return ALBtAdvertisement._machContTimeNs.modify;
}

uint64_t ALBtNotification._isScreenOn.setter(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 58) = result;
  return result;
}

uint64_t (*ALBtNotification._isScreenOn.modify())()
{
  return ALBtAdvertisement._machContTimeNs.modify;
}

uint64_t ALBtNotifications.results.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t ALBtNotifications.isLastBatch.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 8);
}

Swift::String __swiftcall ALBtNotifications.description()()
{
  uint64_t v0;
  int v1;
  Swift::String v2;
  Swift::String v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  Swift::String result;
  _QWORD v10[2];

  v1 = *(unsigned __int8 *)(v0 + 8);
  _StringGuts.grow(_:)(24);
  swift_bridgeObjectRelease();
  strcpy((char *)v10, "results,count,");
  HIBYTE(v10[1]) = -18;
  v2._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v2);
  swift_bridgeObjectRelease();
  v3._countAndFlagsBits = 0x2C7473616C2CLL;
  v3._object = (void *)0xE600000000000000;
  String.append(_:)(v3);
  if (v1)
    v4 = 1702195828;
  else
    v4 = 0x65736C6166;
  if (v1)
    v5 = 0xE400000000000000;
  else
    v5 = 0xE500000000000000;
  v6 = v5;
  String.append(_:)(*(Swift::String *)&v4);
  swift_bridgeObjectRelease();
  v7 = v10[0];
  v8 = (void *)v10[1];
  result._object = v8;
  result._countAndFlagsBits = v7;
  return result;
}

ALDataTypes::ALBtNotifications __swiftcall ALBtNotifications.init()()
{
  uint64_t v0;
  ALDataTypes::ALBtNotifications result;

  *(_QWORD *)v0 = MEMORY[0x24BEE4AF8];
  *(_BYTE *)(v0 + 8) = 1;
  return result;
}

uint64_t variable initialization expression of ALBtNotifications._isLastBatch()
{
  return 1;
}

ALDataTypes::ALBtNotifications __swiftcall ALBtNotifications.init(results:isLastBatch:)(Swift::OpaquePointer results, Swift::Bool isLastBatch)
{
  uint64_t v2;
  ALDataTypes::ALBtNotifications result;

  *(Swift::OpaquePointer *)v2 = results;
  *(_BYTE *)(v2 + 8) = isLastBatch;
  result._results = results;
  result._isLastBatch = isLastBatch;
  return result;
}

uint64_t ALBtNotifications._results.setter(uint64_t a1)
{
  _QWORD *v1;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *v1 = a1;
  return result;
}

uint64_t (*ALBtNotifications._results.modify())()
{
  return ALBtAdvertisement._machContTimeNs.modify;
}

uint64_t ALBtNotifications._isLastBatch.setter(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 8) = result;
  return result;
}

uint64_t (*ALBtNotifications._isLastBatch.modify())()
{
  return ALBtAdvertisement._machContTimeNs.modify;
}

ALDataTypes::ALBtAdvInfoType7::Placement_optional __swiftcall ALBtAdvInfoType7.Placement.init(rawValue:)(Swift::Int rawValue)
{
  char *v1;
  char v2;

  v2 = 8;
  if ((unint64_t)rawValue < 8)
    v2 = rawValue;
  *v1 = v2;
  return (ALDataTypes::ALBtAdvInfoType7::Placement_optional)rawValue;
}

uint64_t ALBtAdvInfoType7.Placement.rawValue.getter()
{
  unsigned __int8 *v0;

  return *v0;
}

uint64_t outlined consume of Data?(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return outlined consume of Data._Representation(a1, a2);
  return a1;
}

uint64_t outlined consume of Data._Representation(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_release();
  }
  return swift_release();
}

unint64_t lazy protocol witness table accessor for type ALTimeStamp and conformance ALTimeStamp()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ALTimeStamp and conformance ALTimeStamp;
  if (!lazy protocol witness table cache variable for type ALTimeStamp and conformance ALTimeStamp)
  {
    result = MEMORY[0x23B7DA498](&protocol conformance descriptor for ALTimeStamp, &type metadata for ALTimeStamp);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ALTimeStamp and conformance ALTimeStamp);
  }
  return result;
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance ALBtAdvInfoType7.Placement(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance ALBtAdvInfoType7.Placement()
{
  unsigned __int8 *v0;
  Swift::UInt v1;

  v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void protocol witness for Hashable.hash(into:) in conformance ALBtAdvInfoType7.Placement()
{
  unsigned __int8 *v0;

  Hasher._combine(_:)(*v0);
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance ALBtAdvInfoType7.Placement()
{
  unsigned __int8 *v0;
  Swift::UInt v1;

  v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

ALDataTypes::ALBtAdvInfoType7::Placement_optional protocol witness for RawRepresentable.init(rawValue:) in conformance ALBtAdvInfoType7.Placement(Swift::Int *a1)
{
  return ALBtAdvInfoType7.Placement.init(rawValue:)(*a1);
}

void protocol witness for RawRepresentable.rawValue.getter in conformance ALBtAdvInfoType7.Placement(_QWORD *a1@<X8>)
{
  unsigned __int8 *v1;

  *a1 = *v1;
}

uint64_t ALBtAdvInfoType7.isSameAccount.getter()
{
  unsigned __int8 *v0;

  return *v0;
}

uint64_t ALBtAdvInfoType7.isFamily.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 1);
}

uint64_t ALBtAdvInfoType7.isSharedHome.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 2);
}

uint64_t ALBtAdvInfoType7.isCase.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 4);
}

ALDataTypes::ALBtAdvInfoType7 __swiftcall ALBtAdvInfoType7.init()()
{
  uint64_t v0;
  ALDataTypes::ALBtAdvInfoType7 result;

  *(_DWORD *)v0 = 33686018;
  *(_WORD *)(v0 + 4) = 2050;
  return result;
}

void variable initialization expression of ALBtAdvInfoType7._placement(_BYTE *a1@<X8>)
{
  *a1 = 8;
}

uint64_t ALBtAdvInfoType7._isSameAccount.getter()
{
  unsigned __int8 *v0;

  return *v0;
}

uint64_t ALBtAdvInfoType7._isSameAccount.setter(uint64_t result)
{
  _BYTE *v1;

  *v1 = result;
  return result;
}

uint64_t (*ALBtAdvInfoType7._isSameAccount.modify())()
{
  return ALBtAdvertisement._machContTimeNs.modify;
}

uint64_t ALBtAdvInfoType7._isFamily.setter(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 1) = result;
  return result;
}

uint64_t (*ALBtAdvInfoType7._isFamily.modify())()
{
  return ALBtAdvertisement._machContTimeNs.modify;
}

uint64_t ALBtAdvInfoType7._isSharedHome.setter(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 2) = result;
  return result;
}

uint64_t (*ALBtAdvInfoType7._isSharedHome.modify())()
{
  return ALBtAdvertisement._machContTimeNs.modify;
}

uint64_t ALBtAdvInfoType7._isLeftBud.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 3);
}

uint64_t ALBtAdvInfoType7._isLeftBud.setter(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 3) = result;
  return result;
}

uint64_t (*ALBtAdvInfoType7._isLeftBud.modify())()
{
  return ALBtAdvertisement._machContTimeNs.modify;
}

uint64_t ALBtAdvInfoType7._isCase.setter(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 4) = result;
  return result;
}

uint64_t (*ALBtAdvInfoType7._isCase.modify())()
{
  return ALBtAdvertisement._machContTimeNs.modify;
}

void ALBtAdvInfoType7._placement.getter(_BYTE *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_BYTE *)(v1 + 5);
}

_BYTE *ALBtAdvInfoType7._placement.setter(_BYTE *result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 5) = *result;
  return result;
}

uint64_t (*ALBtAdvInfoType7._placement.modify())()
{
  return ALBtAdvertisement._machContTimeNs.modify;
}

unint64_t lazy protocol witness table accessor for type ALBtAdvertisement.BtType and conformance ALBtAdvertisement.BtType()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ALBtAdvertisement.BtType and conformance ALBtAdvertisement.BtType;
  if (!lazy protocol witness table cache variable for type ALBtAdvertisement.BtType and conformance ALBtAdvertisement.BtType)
  {
    result = MEMORY[0x23B7DA498](&protocol conformance descriptor for ALBtAdvertisement.BtType, &type metadata for ALBtAdvertisement.BtType);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ALBtAdvertisement.BtType and conformance ALBtAdvertisement.BtType);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type ALBtAdvInfoType7.Placement and conformance ALBtAdvInfoType7.Placement()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ALBtAdvInfoType7.Placement and conformance ALBtAdvInfoType7.Placement;
  if (!lazy protocol witness table cache variable for type ALBtAdvInfoType7.Placement and conformance ALBtAdvInfoType7.Placement)
  {
    result = MEMORY[0x23B7DA498](&protocol conformance descriptor for ALBtAdvInfoType7.Placement, &type metadata for ALBtAdvInfoType7.Placement);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ALBtAdvInfoType7.Placement and conformance ALBtAdvInfoType7.Placement);
  }
  return result;
}

uint64_t destroy for ALBtAdvertisement(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;

  swift_bridgeObjectRelease();
  result = swift_bridgeObjectRelease();
  v3 = *(_QWORD *)(a1 + 136);
  if (v3 >> 60 != 15)
    return outlined consume of Data._Representation(*(_QWORD *)(a1 + 128), v3);
  return result;
}

uint64_t initializeWithCopy for ALBtAdvertisement(uint64_t a1, uint64_t a2)
{
  int v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  unint64_t v9;
  uint64_t v10;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  *(_DWORD *)(a1 + 28) = *(_DWORD *)(a2 + 28);
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  *(_DWORD *)(a1 + 36) = *(_DWORD *)(a2 + 36);
  v4 = *(_DWORD *)(a2 + 44);
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  *(_DWORD *)(a1 + 44) = v4;
  *(_BYTE *)(a1 + 49) = *(_BYTE *)(a2 + 49);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_BYTE *)(a1 + 64) = *(_BYTE *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  *(_BYTE *)(a1 + 80) = *(_BYTE *)(a2 + 80);
  *(_WORD *)(a1 + 82) = *(_WORD *)(a2 + 82);
  *(_BYTE *)(a1 + 84) = *(_BYTE *)(a2 + 84);
  v5 = *(_DWORD *)(a2 + 88);
  *(_BYTE *)(a1 + 92) = *(_BYTE *)(a2 + 92);
  *(_DWORD *)(a1 + 88) = v5;
  v6 = *(_QWORD *)(a2 + 104);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 104) = v6;
  v7 = *(_QWORD *)(a2 + 120);
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  *(_QWORD *)(a1 + 120) = v7;
  v8 = (uint64_t *)(a2 + 128);
  v9 = *(_QWORD *)(a2 + 136);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v9 >> 60 == 15)
  {
    *(_OWORD *)(a1 + 128) = *(_OWORD *)v8;
  }
  else
  {
    v10 = *v8;
    outlined copy of Data._Representation(*v8, v9);
    *(_QWORD *)(a1 + 128) = v10;
    *(_QWORD *)(a1 + 136) = v9;
  }
  *(_DWORD *)(a1 + 144) = *(_DWORD *)(a2 + 144);
  *(_BYTE *)(a1 + 148) = *(_BYTE *)(a2 + 148);
  *(_DWORD *)(a1 + 149) = *(_DWORD *)(a2 + 149);
  *(_WORD *)(a1 + 153) = *(_WORD *)(a2 + 153);
  return a1;
}

uint64_t assignWithCopy for ALBtAdvertisement(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  int v14;
  int v15;

  v4 = *a2;
  *(_BYTE *)(a1 + 8) = *((_BYTE *)a2 + 8);
  *(_QWORD *)a1 = v4;
  v5 = a2[2];
  *(_BYTE *)(a1 + 24) = *((_BYTE *)a2 + 24);
  *(_QWORD *)(a1 + 16) = v5;
  LODWORD(v5) = *((_DWORD *)a2 + 7);
  *(_BYTE *)(a1 + 32) = *((_BYTE *)a2 + 32);
  *(_DWORD *)(a1 + 28) = v5;
  LODWORD(v5) = *((_DWORD *)a2 + 9);
  *(_BYTE *)(a1 + 40) = *((_BYTE *)a2 + 40);
  *(_DWORD *)(a1 + 36) = v5;
  LODWORD(v5) = *((_DWORD *)a2 + 11);
  *(_BYTE *)(a1 + 48) = *((_BYTE *)a2 + 48);
  *(_DWORD *)(a1 + 44) = v5;
  *(_BYTE *)(a1 + 49) = *((_BYTE *)a2 + 49);
  v6 = a2[7];
  *(_BYTE *)(a1 + 64) = *((_BYTE *)a2 + 64);
  *(_QWORD *)(a1 + 56) = v6;
  v7 = a2[9];
  *(_BYTE *)(a1 + 80) = *((_BYTE *)a2 + 80);
  *(_QWORD *)(a1 + 72) = v7;
  LOWORD(v7) = *((_WORD *)a2 + 41);
  *(_BYTE *)(a1 + 84) = *((_BYTE *)a2 + 84);
  *(_WORD *)(a1 + 82) = v7;
  LODWORD(v7) = *((_DWORD *)a2 + 22);
  *(_BYTE *)(a1 + 92) = *((_BYTE *)a2 + 92);
  *(_DWORD *)(a1 + 88) = v7;
  *(_QWORD *)(a1 + 96) = a2[12];
  *(_QWORD *)(a1 + 104) = a2[13];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 112) = a2[14];
  *(_QWORD *)(a1 + 120) = a2[15];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v8 = a2 + 16;
  v9 = a2[17];
  if (*(_QWORD *)(a1 + 136) >> 60 != 15)
  {
    if (v9 >> 60 != 15)
    {
      v11 = *v8;
      outlined copy of Data._Representation(*v8, a2[17]);
      v12 = *(_QWORD *)(a1 + 128);
      v13 = *(_QWORD *)(a1 + 136);
      *(_QWORD *)(a1 + 128) = v11;
      *(_QWORD *)(a1 + 136) = v9;
      outlined consume of Data._Representation(v12, v13);
      goto LABEL_8;
    }
    outlined destroy of Data(a1 + 128);
    goto LABEL_6;
  }
  if (v9 >> 60 == 15)
  {
LABEL_6:
    *(_OWORD *)(a1 + 128) = *(_OWORD *)v8;
    goto LABEL_8;
  }
  v10 = *v8;
  outlined copy of Data._Representation(*v8, a2[17]);
  *(_QWORD *)(a1 + 128) = v10;
  *(_QWORD *)(a1 + 136) = v9;
LABEL_8:
  v14 = *((_DWORD *)a2 + 36);
  *(_BYTE *)(a1 + 148) = *((_BYTE *)a2 + 148);
  *(_DWORD *)(a1 + 144) = v14;
  v15 = *(_DWORD *)((char *)a2 + 149);
  *(_WORD *)(a1 + 153) = *(_WORD *)((char *)a2 + 153);
  *(_DWORD *)(a1 + 149) = v15;
  return a1;
}

uint64_t outlined destroy of Data(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(MEMORY[0x24BDCDDE8] - 8) + 8))();
  return a1;
}

__n128 __swift_memcpy155_8(uint64_t a1, uint64_t a2)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __n128 result;
  __int128 v7;
  __int128 v8;

  v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  v3 = *(_OWORD *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 48);
  v5 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v5;
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)(a1 + 48) = v4;
  result = *(__n128 *)(a2 + 96);
  v7 = *(_OWORD *)(a2 + 112);
  v8 = *(_OWORD *)(a2 + 128);
  *(_OWORD *)(a1 + 139) = *(_OWORD *)(a2 + 139);
  *(_OWORD *)(a1 + 112) = v7;
  *(_OWORD *)(a1 + 128) = v8;
  *(__n128 *)(a1 + 96) = result;
  return result;
}

uint64_t assignWithTake for ALBtAdvertisement(uint64_t a1, uint64_t a2)
{
  int v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  *(_DWORD *)(a1 + 28) = *(_DWORD *)(a2 + 28);
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  *(_DWORD *)(a1 + 36) = *(_DWORD *)(a2 + 36);
  v4 = *(_DWORD *)(a2 + 44);
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  *(_DWORD *)(a1 + 44) = v4;
  *(_BYTE *)(a1 + 49) = *(_BYTE *)(a2 + 49);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_BYTE *)(a1 + 64) = *(_BYTE *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  *(_BYTE *)(a1 + 80) = *(_BYTE *)(a2 + 80);
  *(_WORD *)(a1 + 82) = *(_WORD *)(a2 + 82);
  *(_BYTE *)(a1 + 84) = *(_BYTE *)(a2 + 84);
  v5 = *(_DWORD *)(a2 + 88);
  *(_BYTE *)(a1 + 92) = *(_BYTE *)(a2 + 92);
  *(_DWORD *)(a1 + 88) = v5;
  v6 = *(_QWORD *)(a2 + 104);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 104) = v6;
  swift_bridgeObjectRelease();
  v7 = *(_QWORD *)(a2 + 120);
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  *(_QWORD *)(a1 + 120) = v7;
  swift_bridgeObjectRelease();
  v8 = (_QWORD *)(a2 + 128);
  v9 = *(_QWORD *)(a1 + 136);
  if (v9 >> 60 != 15)
  {
    v10 = *(_QWORD *)(a2 + 136);
    if (v10 >> 60 != 15)
    {
      v11 = *(_QWORD *)(a1 + 128);
      *(_QWORD *)(a1 + 128) = *v8;
      *(_QWORD *)(a1 + 136) = v10;
      outlined consume of Data._Representation(v11, v9);
      goto LABEL_6;
    }
    outlined destroy of Data(a1 + 128);
  }
  *(_OWORD *)(a1 + 128) = *(_OWORD *)v8;
LABEL_6:
  *(_DWORD *)(a1 + 144) = *(_DWORD *)(a2 + 144);
  *(_BYTE *)(a1 + 148) = *(_BYTE *)(a2 + 148);
  *(_DWORD *)(a1 + 149) = *(_DWORD *)(a2 + 149);
  *(_WORD *)(a1 + 153) = *(_WORD *)(a2 + 153);
  return a1;
}

uint64_t getEnumTagSinglePayload for ALBtAdvertisement(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 155))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *(_QWORD *)(a1 + 104);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for ALBtAdvertisement(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 154) = 0;
    *(_WORD *)(result + 152) = 0;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 155) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 155) = 0;
    if (a2)
      *(_QWORD *)(result + 104) = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for ALBtAdvertisement()
{
  return &type metadata for ALBtAdvertisement;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for ALBtAdvertisement.BtType(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for ALBtAdvertisement.BtType(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2358C2354 + 4 * byte_2358C8CA5[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_2358C2388 + 4 * byte_2358C8CA0[v4]))();
}

uint64_t sub_2358C2388(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2358C2390(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2358C2398);
  return result;
}

uint64_t sub_2358C23A4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2358C23ACLL);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_2358C23B0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2358C23B8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ALBtAdvertisement.BtType()
{
  return &type metadata for ALBtAdvertisement.BtType;
}

uint64_t initializeBufferWithCopyOfBuffer for ALBtNotification(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for ALBtNotification()
{
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for ALBtNotification(uint64_t a1, uint64_t a2)
{
  __int128 v3;

  v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 26) = *(_OWORD *)(a2 + 26);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
  *(_WORD *)(a1 + 57) = *(_WORD *)(a2 + 57);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for ALBtNotification(uint64_t a1, __int128 *a2)
{
  __int128 v4;
  __int128 v5;

  v4 = *a2;
  v5 = a2[1];
  *(_OWORD *)(a1 + 26) = *(__int128 *)((char *)a2 + 26);
  *(_OWORD *)a1 = v4;
  *(_OWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 48) = *((_QWORD *)a2 + 6);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 56) = *((_BYTE *)a2 + 56);
  *(_BYTE *)(a1 + 57) = *((_BYTE *)a2 + 57);
  *(_BYTE *)(a1 + 58) = *((_BYTE *)a2 + 58);
  return a1;
}

__n128 __swift_memcpy59_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  v4 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 43) = *(_OWORD *)(a2 + 43);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for ALBtNotification(uint64_t a1, uint64_t a2)
{
  __int128 v4;

  v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(_OWORD *)(a1 + 26) = *(_OWORD *)(a2 + 26);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
  *(_WORD *)(a1 + 57) = *(_WORD *)(a2 + 57);
  return a1;
}

uint64_t getEnumTagSinglePayload for ALBtNotification(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 59))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 48);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ALBtNotification(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 58) = 0;
    *(_WORD *)(result + 56) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 59) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 48) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 59) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for ALBtNotification()
{
  return &type metadata for ALBtNotification;
}

uint64_t initializeBufferWithCopyOfBuffer for ALBtNotifications(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for ALBtNotifications()
{
  return swift_bridgeObjectRelease();
}

uint64_t assignWithCopy for ALBtNotifications(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  return a1;
}

uint64_t __swift_memcpy9_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2;

  v2 = *a2;
  *(_BYTE *)(result + 8) = *((_BYTE *)a2 + 8);
  *(_QWORD *)result = v2;
  return result;
}

uint64_t assignWithTake for ALBtNotifications(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  return a1;
}

uint64_t getEnumTagSinglePayload for ALBtNotifications(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 9))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ALBtNotifications(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_BYTE *)(result + 8) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 9) = 1;
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
    *(_BYTE *)(result + 9) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for ALBtNotifications()
{
  return &type metadata for ALBtNotifications;
}

uint64_t __swift_memcpy6_1(uint64_t result, int *a2)
{
  int v2;

  v2 = *a2;
  *(_WORD *)(result + 4) = *((_WORD *)a2 + 2);
  *(_DWORD *)result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for ALBtAdvInfoType7(unsigned __int8 *a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFE && a1[6])
    return (*(_DWORD *)a1 + 254);
  v3 = *a1;
  if (v3 >= 2)
    v4 = ((v3 + 2147483646) & 0x7FFFFFFF) - 1;
  else
    v4 = -2;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for ALBtAdvInfoType7(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(_WORD *)(result + 4) = 0;
    *(_DWORD *)result = a2 - 254;
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 6) = 1;
  }
  else
  {
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 6) = 0;
    if (a2)
      *(_BYTE *)result = a2 + 2;
  }
  return result;
}

ValueMetadata *type metadata accessor for ALBtAdvInfoType7()
{
  return &type metadata for ALBtAdvInfoType7;
}

uint64_t getEnumTagSinglePayload for ALBtAdvInfoType7.Placement(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xF9)
    goto LABEL_17;
  if (a2 + 7 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 7) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 7;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 7;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 7;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 8;
  v8 = v6 - 8;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for ALBtAdvInfoType7.Placement(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 7 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 7) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xF9)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF8)
    return ((uint64_t (*)(void))((char *)&loc_2358C28F4 + 4 * byte_2358C8CAF[v4]))();
  *a1 = a2 + 7;
  return ((uint64_t (*)(void))((char *)sub_2358C2928 + 4 * byte_2358C8CAA[v4]))();
}

uint64_t sub_2358C2928(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2358C2930(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2358C2938);
  return result;
}

uint64_t sub_2358C2944(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2358C294CLL);
  *(_BYTE *)result = a2 + 7;
  return result;
}

uint64_t sub_2358C2950(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2358C2958(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t getEnumTag for ALBtAdvInfoType7.Placement(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *destructiveInjectEnumTag for ALBtAdvInfoType7.Placement(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for ALBtAdvInfoType7.Placement()
{
  return &type metadata for ALBtAdvInfoType7.Placement;
}

float ALResultOptions.intervalSec.getter()
{
  uint64_t v0;
  float result;

  result = *(float *)(v0 + 8);
  if (*(_BYTE *)(v0 + 12))
    return 0.0;
  return result;
}

uint64_t key path getter for ALResultOptions.intervalSec : ALResultOptions@<X0>(uint64_t result@<X0>, float *a2@<X8>)
{
  float v2;

  v2 = *(float *)(result + 8);
  if (*(_BYTE *)(result + 12))
    v2 = 0.0;
  *a2 = v2;
  return result;
}

_DWORD *key path setter for ALResultOptions.intervalSec : ALResultOptions(_DWORD *result, uint64_t a2)
{
  *(_DWORD *)(a2 + 8) = *result;
  *(_BYTE *)(a2 + 12) = 0;
  return result;
}

void ALResultOptions.intervalSec.setter(float a1)
{
  uint64_t v1;

  *(float *)(v1 + 8) = a1;
  *(_BYTE *)(v1 + 12) = 0;
}

uint64_t *(*ALResultOptions.intervalSec.modify(uint64_t a1))(uint64_t *result)
{
  uint64_t v1;
  float v2;

  *(_QWORD *)a1 = v1;
  v2 = *(float *)(v1 + 8);
  if (*(_BYTE *)(v1 + 12))
    v2 = 0.0;
  *(float *)(a1 + 8) = v2;
  return ALResultOptions.intervalSec.modify;
}

uint64_t *ALResultOptions.intervalSec.modify(uint64_t *result)
{
  uint64_t v1;

  v1 = *result;
  *(_DWORD *)(v1 + 8) = *((_DWORD *)result + 2);
  *(_BYTE *)(v1 + 12) = 0;
  return result;
}

void ALResultOptions.init()(uint64_t a1@<X8>)
{
  *(_DWORD *)a1 = 0;
  *(_BYTE *)(a1 + 4) = 1;
  *(_DWORD *)(a1 + 8) = 0;
  *(_BYTE *)(a1 + 12) = 1;
  *(_DWORD *)(a1 + 16) = 0;
  *(_BYTE *)(a1 + 20) = 1;
  *(_QWORD *)(a1 + 24) = 0;
  *(_BYTE *)(a1 + 32) = 1;
  *(_QWORD *)(a1 + 40) = 0;
  *(_BYTE *)(a1 + 48) = 1;
}

unint64_t ALResultOptions._maxBatchSize.getter()
{
  unsigned int *v0;

  return *v0 | ((unint64_t)*((unsigned __int8 *)v0 + 4) << 32);
}

uint64_t ALResultOptions._maxBatchSize.setter(uint64_t result)
{
  uint64_t v1;

  *(_DWORD *)v1 = result;
  *(_BYTE *)(v1 + 4) = BYTE4(result) & 1;
  return result;
}

uint64_t (*ALResultOptions._maxBatchSize.modify())()
{
  return ALBtAdvertisement._machContTimeNs.modify;
}

unint64_t ALResultOptions._intervalSec.getter()
{
  uint64_t v0;

  return *(unsigned int *)(v0 + 8) | ((unint64_t)*(unsigned __int8 *)(v0 + 12) << 32);
}

uint64_t ALResultOptions._intervalSec.setter(uint64_t result)
{
  uint64_t v1;

  *(_DWORD *)(v1 + 8) = result;
  *(_BYTE *)(v1 + 12) = BYTE4(result) & 1;
  return result;
}

uint64_t (*ALResultOptions._intervalSec.modify())()
{
  return ALBtAdvertisement._machContTimeNs.modify;
}

unint64_t ALResultOptions._maxAgeSec.getter()
{
  uint64_t v0;

  return *(unsigned int *)(v0 + 16) | ((unint64_t)*(unsigned __int8 *)(v0 + 20) << 32);
}

uint64_t ALResultOptions._maxAgeSec.setter(uint64_t result)
{
  uint64_t v1;

  *(_DWORD *)(v1 + 16) = result;
  *(_BYTE *)(v1 + 20) = BYTE4(result) & 1;
  return result;
}

uint64_t (*ALResultOptions._maxAgeSec.modify())()
{
  return ALBtAdvertisement._machContTimeNs.modify;
}

uint64_t ALResultOptions._startCfaTimeSec.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 24);
}

uint64_t ALResultOptions._startCfaTimeSec.setter(uint64_t result, char a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 24) = result;
  *(_BYTE *)(v2 + 32) = a2 & 1;
  return result;
}

uint64_t (*ALResultOptions._startCfaTimeSec.modify())()
{
  return ALBtAdvertisement._machContTimeNs.modify;
}

uint64_t ALResultOptions._endCfaTimeSec.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 40);
}

uint64_t ALResultOptions._endCfaTimeSec.setter(uint64_t result, char a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 40) = result;
  *(_BYTE *)(v2 + 48) = a2 & 1;
  return result;
}

uint64_t (*ALResultOptions._endCfaTimeSec.modify())()
{
  return ALBtAdvertisement._machContTimeNs.modify;
}

__n128 __swift_memcpy49_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  v4 = *(_OWORD *)(a2 + 32);
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for ALResultOptions(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 49))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for ALResultOptions(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 48) = 0;
    *(_QWORD *)result = (a2 - 1);
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
  *(_BYTE *)(result + 49) = v3;
  return result;
}

ValueMetadata *type metadata accessor for ALResultOptions()
{
  return &type metadata for ALResultOptions;
}

ALDataTypes::ALWiFiScanSingleAccessPoint::Band_optional __swiftcall ALWiFiScanSingleAccessPoint.Band.init(rawValue:)(Swift::Int rawValue)
{
  char *v1;
  char v2;

  v2 = 4;
  if ((unint64_t)rawValue < 4)
    v2 = rawValue;
  *v1 = v2;
  return (ALDataTypes::ALWiFiScanSingleAccessPoint::Band_optional)rawValue;
}

uint64_t ALWiFiScanSingleAccessPoint.Band.rawValue.getter()
{
  unsigned __int8 *v0;

  return *v0;
}

ALDataTypes::ALWiFiScanSingleAccessPoint::Band_optional protocol witness for RawRepresentable.init(rawValue:) in conformance ALWiFiScanSingleAccessPoint.Band(Swift::Int *a1)
{
  return ALWiFiScanSingleAccessPoint.Band.init(rawValue:)(*a1);
}

uint64_t ALWiFiScanSingleAccessPoint.mac.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

uint64_t ALWiFiScanSingleAccessPoint.ssid.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

unint64_t ALWiFiScanSingleAccessPoint.rssidB.getter()
{
  uint64_t v0;

  return *(unsigned int *)(v0 + 32) | ((unint64_t)*(unsigned __int8 *)(v0 + 36) << 32);
}

void ALWiFiScanSingleAccessPoint.mode.getter(_BYTE *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_BYTE *)(v1 + 37);
}

unint64_t ALWiFiScanSingleAccessPoint.channel.getter()
{
  uint64_t v0;

  return *(unsigned int *)(v0 + 40) | ((unint64_t)*(unsigned __int8 *)(v0 + 44) << 32);
}

unint64_t ALWiFiScanSingleAccessPoint.ageSec.getter()
{
  uint64_t v0;

  return *(unsigned int *)(v0 + 48) | ((unint64_t)*(unsigned __int8 *)(v0 + 52) << 32);
}

uint64_t ALWiFiScanSingleAccessPoint.isAph.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 53);
}

uint64_t ALWiFiScanSingleAccessPoint.isMoving.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 54);
}

void ALWiFiScanSingleAccessPoint.band.getter(_BYTE *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_BYTE *)(v1 + 55);
}

unint64_t ALWiFiScanSingleAccessPoint.frequencyKhz.getter()
{
  uint64_t v0;

  return *(unsigned int *)(v0 + 56) | ((unint64_t)*(unsigned __int8 *)(v0 + 60) << 32);
}

double ALWiFiScanSingleAccessPoint.machContTimeSec.getter()
{
  uint64_t v0;
  double result;

  if ((*(_BYTE *)(v0 + 105) & 1) == 0 && (*(_BYTE *)(v0 + 104) & 1) == 0 && (*(_BYTE *)(v0 + 52) & 1) == 0)
    return *(double *)(v0 + 96) - *(float *)(v0 + 48);
  return result;
}

double ALWiFiScanSingleAccessPoint.cfAbsTimeSec.getter()
{
  uint64_t v0;
  double result;

  if ((*(_BYTE *)(v0 + 105) & 1) == 0 && (*(_QWORD *)(v0 + 72) & 1) == 0 && (*(_BYTE *)(v0 + 52) & 1) == 0)
    return *(double *)(v0 + 64) - *(float *)(v0 + 48);
  return result;
}

uint64_t ALWiFiScanSingleAccessPoint.description.getter()
{
  uint64_t *v0;
  uint64_t v1;
  char v2;
  char v3;
  int v4;
  int v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  Swift::String v10;
  Swift::String v11;
  Swift::String v12;
  Swift::String v13;
  Swift::String v14;
  Swift::String v15;
  Swift::String v16;
  Swift::String v17;
  Swift::String v18;
  Swift::String v19;
  Swift::String v20;
  Swift::String v21;
  Swift::String v22;
  Swift::String v23;
  Swift::String v24;
  Swift::String v25;
  uint64_t v27;
  int v28;

  v1 = *v0;
  v2 = *((_BYTE *)v0 + 36);
  v3 = *((_BYTE *)v0 + 44);
  v4 = *((unsigned __int8 *)v0 + 52);
  v5 = *((unsigned __int8 *)v0 + 55);
  v27 = v0[9];
  v28 = *((unsigned __int8 *)v0 + 104);
  v6 = *((_BYTE *)v0 + 105);
  if ((v0[1] & 1) != 0)
  {
    if ((*((_BYTE *)v0 + 36) & 1) != 0)
      goto LABEL_3;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<CVarArg>);
    v7 = swift_allocObject();
    v8 = MEMORY[0x24BEE4568];
    *(_OWORD *)(v7 + 16) = xmmword_2358C8C60;
    v9 = MEMORY[0x24BEE45B8];
    *(_QWORD *)(v7 + 56) = v8;
    *(_QWORD *)(v7 + 64) = v9;
    *(_QWORD *)(v7 + 32) = v1;
    v10._countAndFlagsBits = String.init(format:_:)();
    String.append(_:)(v10);
    swift_bridgeObjectRelease();
    v11._countAndFlagsBits = 979591533;
    v11._object = (void *)0xE400000000000000;
    String.append(_:)(v11);
    swift_bridgeObjectRelease();
    if ((v2 & 1) != 0)
    {
LABEL_3:
      if (v5 == 4)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  v12._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v12);
  swift_bridgeObjectRelease();
  v13._countAndFlagsBits = 0x3A697373722CLL;
  v13._object = (void *)0xE600000000000000;
  String.append(_:)(v13);
  swift_bridgeObjectRelease();
  if (v5 == 4)
  {
LABEL_4:
    if ((v3 & 1) != 0)
      goto LABEL_5;
    goto LABEL_11;
  }
LABEL_10:
  v14._countAndFlagsBits = 0x3A646E61622CLL;
  v14._object = (void *)0xE600000000000000;
  String.append(_:)(v14);
  _print_unlocked<A, B>(_:_:)();
  v15._countAndFlagsBits = 0;
  v15._object = (void *)0xE000000000000000;
  String.append(_:)(v15);
  swift_bridgeObjectRelease();
  if ((v3 & 1) != 0)
  {
LABEL_5:
    if ((v4 & 1) != 0)
      goto LABEL_6;
LABEL_12:
    v18._countAndFlagsBits = 0x3A6365536567612CLL;
    v18._object = (void *)0xE800000000000000;
    String.append(_:)(v18);
    Float.write<A>(to:)();
    v19._countAndFlagsBits = 0;
    v19._object = (void *)0xE000000000000000;
    String.append(_:)(v19);
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      goto LABEL_17;
    goto LABEL_13;
  }
LABEL_11:
  v16._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v16);
  swift_bridgeObjectRelease();
  v17._countAndFlagsBits = 0x6C656E6E6168632CLL;
  v17._object = (void *)0xE90000000000003ALL;
  String.append(_:)(v17);
  swift_bridgeObjectRelease();
  if ((v4 & 1) == 0)
    goto LABEL_12;
LABEL_6:
  if ((v6 & 1) != 0)
    goto LABEL_17;
LABEL_13:
  if (((v27 | v4) & 1) == 0)
  {
    v20._countAndFlagsBits = 0x3A6166632CLL;
    v20._object = (void *)0xE500000000000000;
    String.append(_:)(v20);
    Double.write<A>(to:)();
    v21._countAndFlagsBits = 0;
    v21._object = (void *)0xE000000000000000;
    String.append(_:)(v21);
    swift_bridgeObjectRelease();
  }
  if (((v28 | v4) & 1) == 0)
  {
    v22._countAndFlagsBits = 0x3A74636D2CLL;
    v22._object = (void *)0xE500000000000000;
    String.append(_:)(v22);
    Double.write<A>(to:)();
    v23._countAndFlagsBits = 0;
    v23._object = (void *)0xE000000000000000;
    String.append(_:)(v23);
    swift_bridgeObjectRelease();
  }
LABEL_17:
  v24._countAndFlagsBits = 0;
  v24._object = (void *)0xE000000000000000;
  String.append(_:)(v24);
  swift_bridgeObjectRelease();
  v25._countAndFlagsBits = 125;
  v25._object = (void *)0xE100000000000000;
  String.append(_:)(v25);
  return 0x7B2069466957;
}

double ALWiFiScanSingleAccessPoint.init()@<D0>(uint64_t a1@<X8>)
{
  double result;

  *(_QWORD *)a1 = 0;
  *(_BYTE *)(a1 + 8) = 1;
  *(_QWORD *)(a1 + 16) = 0;
  *(_QWORD *)(a1 + 24) = 0;
  *(_DWORD *)(a1 + 32) = 0;
  *(_WORD *)(a1 + 36) = 1025;
  *(_DWORD *)(a1 + 40) = 0;
  *(_BYTE *)(a1 + 44) = 1;
  *(_DWORD *)(a1 + 48) = 0;
  *(_BYTE *)(a1 + 52) = 1;
  *(_WORD *)(a1 + 53) = 514;
  *(_BYTE *)(a1 + 55) = 4;
  *(_DWORD *)(a1 + 56) = 0;
  *(_BYTE *)(a1 + 60) = 1;
  result = 0.0;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 89) = 0u;
  *(_BYTE *)(a1 + 105) = 1;
  return result;
}

void variable initialization expression of ALWiFiScanSingleAccessPoint._mode(_BYTE *a1@<X8>)
{
  *a1 = 4;
}

__n128 ALWiFiScanSingleAccessPoint.init(_:)@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  char v3;
  char v4;
  __n128 result;
  __int128 v6;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_BYTE *)(a1 + 40);
  v4 = *(_BYTE *)(a1 + 41);
  *(_QWORD *)a2 = 0;
  *(_BYTE *)(a2 + 8) = 1;
  *(_QWORD *)(a2 + 16) = 0;
  *(_QWORD *)(a2 + 24) = 0;
  *(_DWORD *)(a2 + 32) = 0;
  *(_WORD *)(a2 + 36) = 1025;
  *(_DWORD *)(a2 + 40) = 0;
  *(_BYTE *)(a2 + 44) = 1;
  *(_DWORD *)(a2 + 48) = 0;
  *(_BYTE *)(a2 + 52) = 1;
  *(_WORD *)(a2 + 53) = 514;
  *(_BYTE *)(a2 + 55) = 4;
  *(_DWORD *)(a2 + 56) = 0;
  *(_BYTE *)(a2 + 60) = 1;
  result = *(__n128 *)a1;
  v6 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(a2 + 64) = *(_OWORD *)a1;
  *(_OWORD *)(a2 + 80) = v6;
  *(_QWORD *)(a2 + 96) = v2;
  *(_BYTE *)(a2 + 104) = v3;
  *(_BYTE *)(a2 + 105) = v4;
  return result;
}

uint64_t ALWiFiScanSingleAccessPoint._mac.setter(uint64_t result, char a2)
{
  uint64_t v2;

  *(_QWORD *)v2 = result;
  *(_BYTE *)(v2 + 8) = a2 & 1;
  return result;
}

uint64_t (*ALWiFiScanSingleAccessPoint._mac.modify())()
{
  return ALBtAdvertisement._machContTimeNs.modify;
}

uint64_t ALWiFiScanSingleAccessPoint._ssid.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = a2;
  return result;
}

uint64_t (*ALWiFiScanSingleAccessPoint._ssid.modify())()
{
  return ALBtAdvertisement._machContTimeNs.modify;
}

uint64_t ALWiFiScanSingleAccessPoint._rssidB.setter(uint64_t result)
{
  uint64_t v1;

  *(_DWORD *)(v1 + 32) = result;
  *(_BYTE *)(v1 + 36) = BYTE4(result) & 1;
  return result;
}

uint64_t (*ALWiFiScanSingleAccessPoint._rssidB.modify())()
{
  return ALBtAdvertisement._machContTimeNs.modify;
}

_BYTE *ALWiFiScanSingleAccessPoint._mode.setter(_BYTE *result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 37) = *result;
  return result;
}

uint64_t (*ALWiFiScanSingleAccessPoint._mode.modify())()
{
  return ALBtAdvertisement._machContTimeNs.modify;
}

uint64_t ALWiFiScanSingleAccessPoint._channel.setter(uint64_t result)
{
  uint64_t v1;

  *(_DWORD *)(v1 + 40) = result;
  *(_BYTE *)(v1 + 44) = BYTE4(result) & 1;
  return result;
}

uint64_t (*ALWiFiScanSingleAccessPoint._channel.modify())()
{
  return ALBtAdvertisement._machContTimeNs.modify;
}

uint64_t ALWiFiScanSingleAccessPoint._ageSec.setter(uint64_t result)
{
  uint64_t v1;

  *(_DWORD *)(v1 + 48) = result;
  *(_BYTE *)(v1 + 52) = BYTE4(result) & 1;
  return result;
}

uint64_t (*ALWiFiScanSingleAccessPoint._ageSec.modify())()
{
  return ALBtAdvertisement._machContTimeNs.modify;
}

uint64_t ALWiFiScanSingleAccessPoint._isAph.setter(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 53) = result;
  return result;
}

uint64_t (*ALWiFiScanSingleAccessPoint._isAph.modify())()
{
  return ALBtAdvertisement._machContTimeNs.modify;
}

uint64_t ALWiFiScanSingleAccessPoint._isMoving.setter(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 54) = result;
  return result;
}

uint64_t (*ALWiFiScanSingleAccessPoint._isMoving.modify())()
{
  return ALBtAdvertisement._machContTimeNs.modify;
}

_BYTE *ALWiFiScanSingleAccessPoint._band.setter(_BYTE *result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 55) = *result;
  return result;
}

uint64_t (*ALWiFiScanSingleAccessPoint._band.modify())()
{
  return ALBtAdvertisement._machContTimeNs.modify;
}

uint64_t ALWiFiScanSingleAccessPoint._frequencyKhz.setter(uint64_t result)
{
  uint64_t v1;

  *(_DWORD *)(v1 + 56) = result;
  *(_BYTE *)(v1 + 60) = BYTE4(result) & 1;
  return result;
}

uint64_t (*ALWiFiScanSingleAccessPoint._frequencyKhz.modify())()
{
  return ALBtAdvertisement._machContTimeNs.modify;
}

__n128 ALWiFiScanSingleAccessPoint._scanTimestamp.getter@<Q0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  char v3;
  char v4;
  __n128 result;
  __int128 v6;

  v2 = *(_QWORD *)(v1 + 96);
  v3 = *(_BYTE *)(v1 + 104);
  v4 = *(_BYTE *)(v1 + 105);
  result = *(__n128 *)(v1 + 64);
  v6 = *(_OWORD *)(v1 + 80);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v6;
  *(_QWORD *)(a1 + 32) = v2;
  *(_BYTE *)(a1 + 40) = v3;
  *(_BYTE *)(a1 + 41) = v4;
  return result;
}

uint64_t ALWiFiScanResult.accessPoints.getter()
{
  return swift_bridgeObjectRetain();
}

Swift::Bool __swiftcall ALWiFiScanResult.isOlderThan(timestamp:)(Swift::Double timestamp)
{
  uint64_t v1;

  if ((*(_BYTE *)(v1 + 41) & 1) != 0)
    return 1;
  else
    return *(_BYTE *)(v1 + 40) & 1 | (*(double *)(v1 + 32) < timestamp);
}

uint64_t ALWiFiScanResult.description.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  char v7;
  uint64_t v8;
  Swift::String v9;
  uint64_t v10;
  char v11;
  char v12;
  Swift::String v13;
  Swift::String v14;
  uint64_t v16;
  char v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  unint64_t v23;

  v2 = *(_QWORD *)v0;
  v1 = *(_QWORD *)(v0 + 8);
  v4 = *(_QWORD *)(v0 + 16);
  v3 = *(_QWORD *)(v0 + 24);
  v5 = *(_QWORD *)(v0 + 32);
  v6 = *(_BYTE *)(v0 + 40);
  v7 = *(_BYTE *)(v0 + 41);
  v8 = *(_QWORD *)(v0 + 48);
  v22 = 0;
  v23 = 0xE000000000000000;
  v9._countAndFlagsBits = 745825133;
  v9._object = (void *)0xE400000000000000;
  String.append(_:)(v9);
  if ((v7 & 1) != 0)
  {
    v10 = 0;
    v11 = 1;
  }
  else
  {
    v16 = v2;
    v17 = v1 & 1;
    v18 = v4;
    v19 = v3 & 1;
    v20 = v5;
    v21 = v6 & 1;
    v10 = ALTimeStamp.machContinuousTimeSec.getter();
    v11 = v12 & 1;
  }
  v16 = v10;
  v17 = v11;
  DefaultStringInterpolation.appendInterpolation<A>(_:)((uint64_t)&v16, MEMORY[0x24BEE13C8], MEMORY[0x24BEE1438]);
  v13._countAndFlagsBits = 0x2C746E756F632CLL;
  v13._object = (void *)0xE700000000000000;
  String.append(_:)(v13);
  v16 = *(_QWORD *)(v8 + 16);
  v14._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v14);
  swift_bridgeObjectRelease();
  return v22;
}

void __swiftcall ALWiFiScanResult.init()(ALDataTypes::ALWiFiScanResult *__return_ptr retstr)
{
  *(_OWORD *)retstr->_scanTimestamp.value.gap19 = 0u;
  *(_OWORD *)&retstr->_scanTimestamp.value._cfAbsoluteTimeSec.value = 0u;
  *(_OWORD *)&retstr->_scanTimestamp.value._machAbsoluteTimeSec.value = 0u;
  retstr->_scanTimestamp.is_nil = 1;
  retstr->_accessPoints._rawValue = (void *)MEMORY[0x24BEE4AF8];
}

__n128 ALWiFiScanResult._scanTimestamp.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  char v3;
  char v4;
  __n128 result;
  __int128 v6;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_BYTE *)(a1 + 40);
  v4 = *(_BYTE *)(a1 + 41);
  result = *(__n128 *)a1;
  v6 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)v1 = *(_OWORD *)a1;
  *(_OWORD *)(v1 + 16) = v6;
  *(_QWORD *)(v1 + 32) = v2;
  *(_BYTE *)(v1 + 40) = v3;
  *(_BYTE *)(v1 + 41) = v4;
  return result;
}

uint64_t (*ALWiFiScanResult._scanTimestamp.modify())()
{
  return ALBtAdvertisement._machContTimeNs.modify;
}

uint64_t ALWiFiScanResult._accessPoints.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 48) = a1;
  return result;
}

uint64_t (*ALWiFiScanResult._accessPoints.modify())()
{
  return ALBtAdvertisement._machContTimeNs.modify;
}

BOOL static ALWiFiNotification.NotiType.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

void ALWiFiNotification.NotiType.hash(into:)()
{
  unsigned __int8 *v0;

  Hasher._combine(_:)(*v0);
}

void ALWiFiNotification.type.getter(_BYTE *a1@<X8>)
{
  _BYTE *v1;

  *a1 = *v1;
}

uint64_t ALWiFiNotification.associatedMac.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 112);
}

void ALWiFiNotification.scanType.getter(_BYTE *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_BYTE *)(v1 + 121);
}

uint64_t ALWiFiNotification.power.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 122);
}

uint64_t ALWiFiNotification.isInvoluntaryLinkDown.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 126);
}

uint64_t ALWiFiNotification.description.getter()
{
  unsigned __int8 *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unsigned __int8 v4;
  unsigned __int8 v5;
  Swift::String v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  Swift::String v11;
  char v12;
  Swift::String v13;
  Swift::String v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  Swift::String v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  __int128 v26;
  Swift::String v27;
  uint64_t v28;
  int v29;
  unsigned __int8 v30;
  int v31;
  int v32;
  Swift::String v33;
  __int128 v34;
  uint64_t v35;
  __int16 v36;
  uint64_t v37;
  Swift::String v38;
  uint64_t v39;
  unint64_t v40;

  v2 = *((_QWORD *)v0 + 3);
  v1 = *((_QWORD *)v0 + 4);
  v3 = *((_QWORD *)v0 + 5);
  v4 = v0[48];
  v5 = v0[49];
  v6 = *(Swift::String *)(v0 + 56);
  v7 = *(_OWORD *)(v0 + 72);
  v9 = *((_QWORD *)v0 + 11);
  v8 = *((_QWORD *)v0 + 12);
  v10 = *((_QWORD *)v0 + 13);
  v28 = *((_QWORD *)v0 + 14);
  v29 = *v0;
  v30 = v0[120];
  v31 = v0[123];
  v32 = v0[125];
  v39 = 0;
  v40 = 0xE000000000000000;
  if ((v5 & 1) == 0)
  {
    v38._countAndFlagsBits = 0;
    v38._object = (void *)0xE000000000000000;
    v11._countAndFlagsBits = 0x3A656D6974;
    v11._object = (void *)0xE500000000000000;
    v26 = v7;
    v27 = v6;
    String.append(_:)(v11);
    *(_QWORD *)&v34 = v2;
    BYTE8(v34) = v1 & 1;
    v35 = v3;
    LOBYTE(v36) = v4 & 1;
    v33._countAndFlagsBits = ALTimeStamp.machContinuousTimeSec.getter();
    LOBYTE(v33._object) = v12 & 1;
    DefaultStringInterpolation.appendInterpolation<A>(_:)((uint64_t)&v33, MEMORY[0x24BEE13C8], MEMORY[0x24BEE1438]);
    String.append(_:)(v38);
    swift_bridgeObjectRelease();
    v7 = v26;
    v6 = v27;
  }
  if (v10)
  {
    v38._countAndFlagsBits = 0x3A6E6163732CLL;
    v38._object = (void *)0xE600000000000000;
    v33 = v6;
    v34 = v7;
    v35 = v9;
    v36 = v8 & 0x1FF;
    v37 = v10;
    v13._countAndFlagsBits = ALWiFiScanResult.description.getter();
    String.append(_:)(v13);
    swift_bridgeObjectRelease();
    String.append(_:)(v38);
    swift_bridgeObjectRelease();
  }
  if (v29 != 15)
  {
    v33._countAndFlagsBits = 0;
    v33._object = (void *)0xE000000000000000;
    v14._countAndFlagsBits = 0x70795469746F6E2CLL;
    v14._object = (void *)0xEA00000000003A65;
    String.append(_:)(v14);
    LOBYTE(v38._countAndFlagsBits) = v29;
    _print_unlocked<A, B>(_:_:)();
    String.append(_:)(v33);
    swift_bridgeObjectRelease();
  }
  if ((v30 & 1) == 0)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<CVarArg>);
    v15 = swift_allocObject();
    v16 = MEMORY[0x24BEE4568];
    *(_OWORD *)(v15 + 16) = xmmword_2358C8C60;
    v17 = MEMORY[0x24BEE45B8];
    *(_QWORD *)(v15 + 56) = v16;
    *(_QWORD *)(v15 + 64) = v17;
    *(_QWORD *)(v15 + 32) = v28;
    v18._countAndFlagsBits = String.init(format:_:)();
    String.append(_:)(v18);
    swift_bridgeObjectRelease();
  }
  if (v31 != 2)
  {
    v33._countAndFlagsBits = 0x74616C756D69732CLL;
    v33._object = (void *)0xEB000000003A6465;
    if ((v31 & 1) != 0)
      v19 = 1702195828;
    else
      v19 = 0x65736C6166;
    if ((v31 & 1) != 0)
      v20 = 0xE400000000000000;
    else
      v20 = 0xE500000000000000;
    v21 = v20;
    String.append(_:)(*(Swift::String *)&v19);
    swift_bridgeObjectRelease();
    String.append(_:)(v33);
    swift_bridgeObjectRelease();
  }
  if (v32 != 2)
  {
    v33._countAndFlagsBits = 0x656B61774170612CLL;
    v33._object = (void *)0xE90000000000003ALL;
    if ((v32 & 1) != 0)
      v22 = 1702195828;
    else
      v22 = 0x65736C6166;
    if ((v32 & 1) != 0)
      v23 = 0xE400000000000000;
    else
      v23 = 0xE500000000000000;
    v24 = v23;
    String.append(_:)(*(Swift::String *)&v22);
    swift_bridgeObjectRelease();
    String.append(_:)(v33);
    swift_bridgeObjectRelease();
  }
  return v39;
}

double ALWiFiNotification.init()@<D0>(uint64_t a1@<X8>)
{
  double result;

  *(_BYTE *)a1 = 15;
  result = 0.0;
  *(_OWORD *)(a1 + 8) = 0u;
  *(_OWORD *)(a1 + 24) = 0u;
  *(_OWORD *)(a1 + 33) = 0u;
  *(_BYTE *)(a1 + 49) = 1;
  *(_OWORD *)(a1 + 56) = 0u;
  *(_OWORD *)(a1 + 72) = 0u;
  *(_OWORD *)(a1 + 88) = 0u;
  *(_OWORD *)(a1 + 104) = 0u;
  *(_WORD *)(a1 + 120) = 3841;
  *(_DWORD *)(a1 + 122) = 33686018;
  *(_BYTE *)(a1 + 126) = 2;
  return result;
}

void variable initialization expression of ALWiFiNotification._type(_BYTE *a1@<X8>)
{
  *a1 = 15;
}

double variable initialization expression of ALWiFiNotification._scanResult@<D0>(uint64_t a1@<X8>)
{
  double result;

  *(_QWORD *)(a1 + 48) = 0;
  result = 0.0;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)a1 = 0u;
  return result;
}

_BYTE *ALWiFiNotification._type.setter(_BYTE *result)
{
  _BYTE *v1;

  *v1 = *result;
  return result;
}

uint64_t (*ALWiFiNotification._type.modify())()
{
  return ALBtAdvertisement._machContTimeNs.modify;
}

__n128 ALWiFiNotification.timestamp.getter@<Q0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  char v3;
  char v4;
  __n128 result;
  __int128 v6;

  v2 = *(_QWORD *)(v1 + 40);
  v3 = *(_BYTE *)(v1 + 48);
  v4 = *(_BYTE *)(v1 + 49);
  result = *(__n128 *)(v1 + 8);
  v6 = *(_OWORD *)(v1 + 24);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v6;
  *(_QWORD *)(a1 + 32) = v2;
  *(_BYTE *)(a1 + 40) = v3;
  *(_BYTE *)(a1 + 41) = v4;
  return result;
}

__n128 ALWiFiNotification._timestamp.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  char v3;
  char v4;
  __n128 result;
  __int128 v6;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_BYTE *)(a1 + 40);
  v4 = *(_BYTE *)(a1 + 41);
  result = *(__n128 *)a1;
  v6 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v1 + 8) = *(_OWORD *)a1;
  *(_OWORD *)(v1 + 24) = v6;
  *(_QWORD *)(v1 + 40) = v2;
  *(_BYTE *)(v1 + 48) = v3;
  *(_BYTE *)(v1 + 49) = v4;
  return result;
}

uint64_t (*ALWiFiNotification._timestamp.modify())()
{
  return ALBtAdvertisement._machContTimeNs.modify;
}

uint64_t ALWiFiNotification.scanResult.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  __int128 v3;

  v2 = *(_QWORD *)(v1 + 104);
  v3 = *(_OWORD *)(v1 + 72);
  *(_OWORD *)a1 = *(_OWORD *)(v1 + 56);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(v1 + 88);
  *(_QWORD *)(a1 + 48) = v2;
  return swift_bridgeObjectRetain();
}

__n128 ALWiFiNotification._scanResult.setter(__int128 *a1)
{
  uint64_t v1;
  uint64_t v2;
  __n128 result;
  __n128 v4;
  __int128 v5;
  __int128 v6;

  v5 = a1[1];
  v6 = *a1;
  v4 = (__n128)a1[2];
  v2 = *((_QWORD *)a1 + 6);
  swift_bridgeObjectRelease();
  *(_OWORD *)(v1 + 56) = v6;
  *(_OWORD *)(v1 + 72) = v5;
  result = v4;
  *(__n128 *)(v1 + 88) = v4;
  *(_QWORD *)(v1 + 104) = v2;
  return result;
}

uint64_t (*ALWiFiNotification._scanResult.modify())()
{
  return ALBtAdvertisement._machContTimeNs.modify;
}

uint64_t ALWiFiNotification._associatedMac.setter(uint64_t result, char a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 112) = result;
  *(_BYTE *)(v2 + 120) = a2 & 1;
  return result;
}

uint64_t (*ALWiFiNotification._associatedMac.modify())()
{
  return ALBtAdvertisement._machContTimeNs.modify;
}

_BYTE *ALWiFiNotification._scanType.setter(_BYTE *result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 121) = *result;
  return result;
}

uint64_t (*ALWiFiNotification._scanType.modify())()
{
  return ALBtAdvertisement._machContTimeNs.modify;
}

uint64_t ALWiFiNotification._power.setter(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 122) = result;
  return result;
}

uint64_t (*ALWiFiNotification._power.modify())()
{
  return ALBtAdvertisement._machContTimeNs.modify;
}

uint64_t ALWiFiNotification._simulated.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 123);
}

uint64_t ALWiFiNotification._simulated.setter(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 123) = result;
  return result;
}

uint64_t (*ALWiFiNotification._simulated.modify())()
{
  return ALBtAdvertisement._machContTimeNs.modify;
}

uint64_t ALWiFiNotification._available.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 124);
}

uint64_t ALWiFiNotification._available.setter(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 124) = result;
  return result;
}

uint64_t (*ALWiFiNotification._available.modify())()
{
  return ALBtAdvertisement._machContTimeNs.modify;
}

uint64_t ALWiFiNotification._isApAwake.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 125);
}

uint64_t ALWiFiNotification._isApAwake.setter(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 125) = result;
  return result;
}

uint64_t (*ALWiFiNotification._isApAwake.modify())()
{
  return ALBtAdvertisement._machContTimeNs.modify;
}

uint64_t ALWiFiNotification._isInvoluntaryLinkDown.setter(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 126) = result;
  return result;
}

uint64_t (*ALWiFiNotification._isInvoluntaryLinkDown.modify())()
{
  return ALBtAdvertisement._machContTimeNs.modify;
}

uint64_t ALWiFiNotifications.results.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t ALWiFiNotifications.isLastBatch.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 8);
}

uint64_t ALWiFiNotifications.description.getter()
{
  uint64_t v0;
  int v1;
  Swift::String v2;
  Swift::String v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  _QWORD v8[2];

  v1 = *(unsigned __int8 *)(v0 + 8);
  _StringGuts.grow(_:)(24);
  swift_bridgeObjectRelease();
  strcpy((char *)v8, "results,count,");
  HIBYTE(v8[1]) = -18;
  v2._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v2);
  swift_bridgeObjectRelease();
  v3._countAndFlagsBits = 0x2C7473616C2CLL;
  v3._object = (void *)0xE600000000000000;
  String.append(_:)(v3);
  if (v1)
    v4 = 1702195828;
  else
    v4 = 0x65736C6166;
  if (v1)
    v5 = 0xE400000000000000;
  else
    v5 = 0xE500000000000000;
  v6 = v5;
  String.append(_:)(*(Swift::String *)&v4);
  swift_bridgeObjectRelease();
  return v8[0];
}

ALDataTypes::ALWiFiNotifications __swiftcall ALWiFiNotifications.init()()
{
  uint64_t v0;
  ALDataTypes::ALWiFiNotifications result;

  *(_QWORD *)v0 = MEMORY[0x24BEE4AF8];
  *(_BYTE *)(v0 + 8) = 1;
  return result;
}

ALDataTypes::ALWiFiNotifications __swiftcall ALWiFiNotifications.init(_results:_isLastBatch:)(Swift::OpaquePointer _results, Swift::Bool_optional _isLastBatch)
{
  uint64_t v2;
  ALDataTypes::ALWiFiNotifications result;

  *(Swift::OpaquePointer *)v2 = _results;
  *(_BYTE *)(v2 + 8) = _isLastBatch.value == 2 || _isLastBatch.value;
  result._results = _results;
  result._isLastBatch = _isLastBatch.value;
  return result;
}

uint64_t ALWiFiNotifications._results.setter(uint64_t a1)
{
  _QWORD *v1;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *v1 = a1;
  return result;
}

uint64_t (*ALWiFiNotifications._results.modify())()
{
  return ALBtAdvertisement._machContTimeNs.modify;
}

uint64_t ALWiFiNotifications._isLastBatch.setter(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 8) = result;
  return result;
}

uint64_t (*ALWiFiNotifications._isLastBatch.modify())()
{
  return ALBtAdvertisement._machContTimeNs.modify;
}

unint64_t lazy protocol witness table accessor for type ALWiFiScanSingleAccessPoint.Mode and conformance ALWiFiScanSingleAccessPoint.Mode()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ALWiFiScanSingleAccessPoint.Mode and conformance ALWiFiScanSingleAccessPoint.Mode;
  if (!lazy protocol witness table cache variable for type ALWiFiScanSingleAccessPoint.Mode and conformance ALWiFiScanSingleAccessPoint.Mode)
  {
    result = MEMORY[0x23B7DA498](&protocol conformance descriptor for ALWiFiScanSingleAccessPoint.Mode, &type metadata for ALWiFiScanSingleAccessPoint.Mode);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ALWiFiScanSingleAccessPoint.Mode and conformance ALWiFiScanSingleAccessPoint.Mode);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type ALWiFiScanSingleAccessPoint.Band and conformance ALWiFiScanSingleAccessPoint.Band()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ALWiFiScanSingleAccessPoint.Band and conformance ALWiFiScanSingleAccessPoint.Band;
  if (!lazy protocol witness table cache variable for type ALWiFiScanSingleAccessPoint.Band and conformance ALWiFiScanSingleAccessPoint.Band)
  {
    result = MEMORY[0x23B7DA498](&protocol conformance descriptor for ALWiFiScanSingleAccessPoint.Band, &type metadata for ALWiFiScanSingleAccessPoint.Band);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ALWiFiScanSingleAccessPoint.Band and conformance ALWiFiScanSingleAccessPoint.Band);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type ALWiFiNotification.NotiType and conformance ALWiFiNotification.NotiType()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ALWiFiNotification.NotiType and conformance ALWiFiNotification.NotiType;
  if (!lazy protocol witness table cache variable for type ALWiFiNotification.NotiType and conformance ALWiFiNotification.NotiType)
  {
    result = MEMORY[0x23B7DA498](&protocol conformance descriptor for ALWiFiNotification.NotiType, &type metadata for ALWiFiNotification.NotiType);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ALWiFiNotification.NotiType and conformance ALWiFiNotification.NotiType);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type ALWiFiNotification.ScanType and conformance ALWiFiNotification.ScanType()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ALWiFiNotification.ScanType and conformance ALWiFiNotification.ScanType;
  if (!lazy protocol witness table cache variable for type ALWiFiNotification.ScanType and conformance ALWiFiNotification.ScanType)
  {
    result = MEMORY[0x23B7DA498](&protocol conformance descriptor for ALWiFiNotification.ScanType, &type metadata for ALWiFiNotification.ScanType);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ALWiFiNotification.ScanType and conformance ALWiFiNotification.ScanType);
  }
  return result;
}

uint64_t destroy for ALWiFiScanSingleAccessPoint()
{
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for ALWiFiScanSingleAccessPoint(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  int v4;
  __int128 v5;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  v3 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v3;
  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  *(_WORD *)(a1 + 36) = *(_WORD *)(a2 + 36);
  *(_DWORD *)(a1 + 40) = *(_DWORD *)(a2 + 40);
  *(_BYTE *)(a1 + 44) = *(_BYTE *)(a2 + 44);
  v4 = *(_DWORD *)(a2 + 48);
  *(_BYTE *)(a1 + 52) = *(_BYTE *)(a2 + 52);
  *(_DWORD *)(a1 + 48) = v4;
  *(_BYTE *)(a1 + 53) = *(_BYTE *)(a2 + 53);
  *(_WORD *)(a1 + 54) = *(_WORD *)(a2 + 54);
  *(_DWORD *)(a1 + 56) = *(_DWORD *)(a2 + 56);
  *(_BYTE *)(a1 + 60) = *(_BYTE *)(a2 + 60);
  v5 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v5;
  *(_OWORD *)(a1 + 90) = *(_OWORD *)(a2 + 90);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for ALWiFiScanSingleAccessPoint(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;
  int v5;
  int v6;
  int v7;
  int v8;
  __int128 v9;
  __int128 v10;

  v4 = *a2;
  *(_BYTE *)(a1 + 8) = *((_BYTE *)a2 + 8);
  *(_QWORD *)a1 = v4;
  *(_QWORD *)(a1 + 16) = a2[2];
  *(_QWORD *)(a1 + 24) = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v5 = *((_DWORD *)a2 + 8);
  *(_BYTE *)(a1 + 36) = *((_BYTE *)a2 + 36);
  *(_DWORD *)(a1 + 32) = v5;
  *(_BYTE *)(a1 + 37) = *((_BYTE *)a2 + 37);
  v6 = *((_DWORD *)a2 + 10);
  *(_BYTE *)(a1 + 44) = *((_BYTE *)a2 + 44);
  *(_DWORD *)(a1 + 40) = v6;
  v7 = *((_DWORD *)a2 + 12);
  *(_BYTE *)(a1 + 52) = *((_BYTE *)a2 + 52);
  *(_DWORD *)(a1 + 48) = v7;
  *(_BYTE *)(a1 + 53) = *((_BYTE *)a2 + 53);
  *(_BYTE *)(a1 + 54) = *((_BYTE *)a2 + 54);
  *(_BYTE *)(a1 + 55) = *((_BYTE *)a2 + 55);
  v8 = *((_DWORD *)a2 + 14);
  *(_BYTE *)(a1 + 60) = *((_BYTE *)a2 + 60);
  *(_DWORD *)(a1 + 56) = v8;
  v9 = *((_OWORD *)a2 + 4);
  v10 = *((_OWORD *)a2 + 5);
  *(_OWORD *)(a1 + 90) = *(_OWORD *)((char *)a2 + 90);
  *(_OWORD *)(a1 + 64) = v9;
  *(_OWORD *)(a1 + 80) = v10;
  return a1;
}

__n128 __swift_memcpy106_8(uint64_t a1, __int128 *a2)
{
  __int128 v2;
  __int128 v3;
  __n128 result;
  __int128 v5;
  __int128 v6;

  v2 = *a2;
  v3 = a2[2];
  *(_OWORD *)(a1 + 16) = a2[1];
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)a1 = v2;
  result = (__n128)a2[3];
  v5 = a2[4];
  v6 = a2[5];
  *(_OWORD *)(a1 + 90) = *(__int128 *)((char *)a2 + 90);
  *(_OWORD *)(a1 + 64) = v5;
  *(_OWORD *)(a1 + 80) = v6;
  *(__n128 *)(a1 + 48) = result;
  return result;
}

uint64_t assignWithTake for ALWiFiScanSingleAccessPoint(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  __int128 v5;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  v4 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v4;
  swift_bridgeObjectRelease();
  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  *(_WORD *)(a1 + 36) = *(_WORD *)(a2 + 36);
  *(_DWORD *)(a1 + 40) = *(_DWORD *)(a2 + 40);
  *(_BYTE *)(a1 + 44) = *(_BYTE *)(a2 + 44);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_DWORD *)(a1 + 56) = *(_DWORD *)(a2 + 56);
  *(_BYTE *)(a1 + 60) = *(_BYTE *)(a2 + 60);
  *(_OWORD *)(a1 + 90) = *(_OWORD *)(a2 + 90);
  v5 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v5;
  return a1;
}

uint64_t getEnumTagSinglePayload for ALWiFiScanSingleAccessPoint(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 106))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *(_QWORD *)(a1 + 24);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for ALWiFiScanSingleAccessPoint(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_WORD *)(result + 104) = 0;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 106) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 106) = 0;
    if (a2)
      *(_QWORD *)(result + 24) = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for ALWiFiScanSingleAccessPoint()
{
  return &type metadata for ALWiFiScanSingleAccessPoint;
}

ValueMetadata *type metadata accessor for ALWiFiScanSingleAccessPoint.Mode()
{
  return &type metadata for ALWiFiScanSingleAccessPoint.Mode;
}

uint64_t getEnumTagSinglePayload for ALWiFiScanSingleAccessPoint.Mode(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFD)
    goto LABEL_17;
  if (a2 + 3 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 3) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 3;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 3;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 3;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 4;
  v8 = v6 - 4;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for ALWiFiScanSingleAccessPoint.Mode(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 3 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 3) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFD)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFC)
    return ((uint64_t (*)(void))((char *)&loc_2358C4308 + 4 * byte_2358C8F85[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_2358C433C + 4 * asc_2358C8F80[v4]))();
}

uint64_t sub_2358C433C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2358C4344(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2358C434CLL);
  return result;
}

uint64_t sub_2358C4358(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2358C4360);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_2358C4364(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2358C436C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ALWiFiScanSingleAccessPoint.Band()
{
  return &type metadata for ALWiFiScanSingleAccessPoint.Band;
}

uint64_t initializeWithCopy for ALWiFiScanResult(uint64_t a1, uint64_t a2)
{
  __int128 v3;

  v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 26) = *(_OWORD *)(a2 + 26);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for ALWiFiScanResult(uint64_t a1, __int128 *a2)
{
  __int128 v3;
  __int128 v4;

  v3 = *a2;
  v4 = a2[1];
  *(_OWORD *)(a1 + 26) = *(__int128 *)((char *)a2 + 26);
  *(_OWORD *)a1 = v3;
  *(_OWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 48) = *((_QWORD *)a2 + 6);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy56_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  v4 = *(_OWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for ALWiFiScanResult(uint64_t a1, uint64_t a2)
{
  __int128 v3;

  v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 26) = *(_OWORD *)(a2 + 26);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ALWiFiScanResult(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 56))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 48);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ALWiFiScanResult(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 56) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 48) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 56) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for ALWiFiScanResult()
{
  return &type metadata for ALWiFiScanResult;
}

uint64_t destroy for ALWiFiNotification()
{
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for ALWiFiNotification(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 34) = *(_OWORD *)(a2 + 34);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  *(_OWORD *)(a1 + 82) = *(_OWORD *)(a2 + 82);
  v3 = *(_QWORD *)(a2 + 104);
  v4 = *(_QWORD *)(a2 + 112);
  *(_BYTE *)(a1 + 120) = *(_BYTE *)(a2 + 120);
  *(_QWORD *)(a1 + 104) = v3;
  *(_QWORD *)(a1 + 112) = v4;
  *(_DWORD *)(a1 + 121) = *(_DWORD *)(a2 + 121);
  *(_WORD *)(a1 + 125) = *(_WORD *)(a2 + 125);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for ALWiFiNotification(uint64_t a1, uint64_t a2)
{
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  uint64_t v8;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v4 = *(_OWORD *)(a2 + 8);
  v5 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 34) = *(_OWORD *)(a2 + 34);
  *(_OWORD *)(a1 + 24) = v5;
  *(_OWORD *)(a1 + 8) = v4;
  v6 = *(_OWORD *)(a2 + 56);
  v7 = *(_OWORD *)(a2 + 72);
  *(_OWORD *)(a1 + 82) = *(_OWORD *)(a2 + 82);
  *(_OWORD *)(a1 + 72) = v7;
  *(_OWORD *)(a1 + 56) = v6;
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v8 = *(_QWORD *)(a2 + 112);
  *(_BYTE *)(a1 + 120) = *(_BYTE *)(a2 + 120);
  *(_QWORD *)(a1 + 112) = v8;
  *(_BYTE *)(a1 + 121) = *(_BYTE *)(a2 + 121);
  *(_BYTE *)(a1 + 122) = *(_BYTE *)(a2 + 122);
  *(_BYTE *)(a1 + 123) = *(_BYTE *)(a2 + 123);
  *(_BYTE *)(a1 + 124) = *(_BYTE *)(a2 + 124);
  *(_BYTE *)(a1 + 125) = *(_BYTE *)(a2 + 125);
  *(_BYTE *)(a1 + 126) = *(_BYTE *)(a2 + 126);
  return a1;
}

__n128 __swift_memcpy127_8(uint64_t a1, __int128 *a2)
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
  v7 = a2[6];
  *(_OWORD *)(a1 + 111) = *(__int128 *)((char *)a2 + 111);
  *(_OWORD *)(a1 + 80) = v6;
  *(_OWORD *)(a1 + 96) = v7;
  *(__n128 *)(a1 + 64) = result;
  return result;
}

uint64_t assignWithTake for ALWiFiNotification(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 34) = *(_OWORD *)(a2 + 34);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  *(_OWORD *)(a1 + 82) = *(_OWORD *)(a2 + 82);
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  *(_BYTE *)(a1 + 120) = *(_BYTE *)(a2 + 120);
  *(_DWORD *)(a1 + 121) = *(_DWORD *)(a2 + 121);
  *(_WORD *)(a1 + 125) = *(_WORD *)(a2 + 125);
  return a1;
}

uint64_t getEnumTagSinglePayload for ALWiFiNotification(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 127))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *(_QWORD *)(a1 + 104);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for ALWiFiNotification(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 126) = 0;
    *(_WORD *)(result + 124) = 0;
    *(_DWORD *)(result + 120) = 0;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 127) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 127) = 0;
    if (a2)
      *(_QWORD *)(result + 104) = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for ALWiFiNotification()
{
  return &type metadata for ALWiFiNotification;
}

ValueMetadata *type metadata accessor for ALWiFiNotification.NotiType()
{
  return &type metadata for ALWiFiNotification.NotiType;
}

uint64_t getEnumTagSinglePayload for ALWiFiNotification.NotiType(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xF2)
    goto LABEL_17;
  if (a2 + 14 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 14) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 14;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 14;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 14;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0xF;
  v8 = v6 - 15;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for ALWiFiNotification.NotiType(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 14 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 14) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xF2)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF1)
    return ((uint64_t (*)(void))((char *)&loc_2358C48E0 + 4 * byte_2358C8F8F[v4]))();
  *a1 = a2 + 14;
  return ((uint64_t (*)(void))((char *)sub_2358C4914 + 4 * byte_2358C8F8A[v4]))();
}

uint64_t sub_2358C4914(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2358C491C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2358C4924);
  return result;
}

uint64_t sub_2358C4930(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2358C4938);
  *(_BYTE *)result = a2 + 14;
  return result;
}

uint64_t sub_2358C493C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2358C4944(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ALWiFiNotification.ScanType()
{
  return &type metadata for ALWiFiNotification.ScanType;
}

ValueMetadata *type metadata accessor for ALWiFiNotifications()
{
  return &type metadata for ALWiFiNotifications;
}

uint64_t ALTimeStamp._cfAbsoluteTimeSec.setter(uint64_t result, char a2)
{
  uint64_t v2;

  *(_QWORD *)v2 = result;
  *(_BYTE *)(v2 + 8) = a2 & 1;
  return result;
}

uint64_t (*ALTimeStamp._cfAbsoluteTimeSec.modify())()
{
  return ALBtAdvertisement._machContTimeNs.modify;
}

uint64_t ALTimeStamp._machAbsoluteTimeSec.setter(uint64_t result, char a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 16) = result;
  *(_BYTE *)(v2 + 24) = a2 & 1;
  return result;
}

uint64_t (*ALTimeStamp._machAbsoluteTimeSec.modify())()
{
  return ALBtAdvertisement._machContTimeNs.modify;
}

uint64_t ALTimeStamp._machContinuousTimeSec.setter(uint64_t result, char a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 32) = result;
  *(_BYTE *)(v2 + 40) = a2 & 1;
  return result;
}

uint64_t (*ALTimeStamp._machContinuousTimeSec.modify())()
{
  return ALBtAdvertisement._machContTimeNs.modify;
}

void __swiftcall ALTimeStamp.init()(ALDataTypes::ALTimeStamp *__return_ptr retstr)
{
  retstr->_cfAbsoluteTimeSec.value = 0.0;
  retstr->_cfAbsoluteTimeSec.is_nil = 1;
  retstr->_machAbsoluteTimeSec.value = 0.0;
  retstr->_machAbsoluteTimeSec.is_nil = 1;
  retstr->_machContinuousTimeSec.value = 0.0;
  retstr->_machContinuousTimeSec.is_nil = 1;
}

void __swiftcall ALTimeStamp.init(machContinuousTimeSec:)(ALDataTypes::ALTimeStamp *__return_ptr retstr, Swift::Double machContinuousTimeSec)
{
  uint64_t v4;
  Swift::Double v5;
  double v6;
  double v7;

  type metadata accessor for TimesSync();
  static TimesSync.instance.getter();
  v4 = dispatch thunk of TimesSync.mctMinusMatNs.getter();
  swift_release();
  v5 = machContinuousTimeSec - NsToSec.getter() * (double)(unint64_t)v4;
  static TimesSync.instance.getter();
  dispatch thunk of TimesSync.cfaMinusMctSec.getter();
  v7 = v6;
  swift_release();
  retstr->_cfAbsoluteTimeSec.value = v7 + machContinuousTimeSec;
  retstr->_cfAbsoluteTimeSec.is_nil = 0;
  retstr->_machAbsoluteTimeSec.value = v5;
  retstr->_machAbsoluteTimeSec.is_nil = 0;
  retstr->_machContinuousTimeSec.value = machContinuousTimeSec;
  retstr->_machContinuousTimeSec.is_nil = 0;
}

void __swiftcall ALTimeStamp.init(cfAbsoluteTimeSec:)(ALDataTypes::ALTimeStamp *__return_ptr retstr, Swift::Double cfAbsoluteTimeSec)
{
  double v4;
  double v5;
  Swift::Double v6;
  uint64_t v7;
  double v8;

  type metadata accessor for TimesSync();
  static TimesSync.instance.getter();
  dispatch thunk of TimesSync.cfaMinusMctSec.getter();
  v5 = v4;
  swift_release();
  v6 = cfAbsoluteTimeSec - v5;
  static TimesSync.instance.getter();
  v7 = dispatch thunk of TimesSync.mctMinusMatNs.getter();
  swift_release();
  v8 = NsToSec.getter();
  retstr->_cfAbsoluteTimeSec.value = cfAbsoluteTimeSec;
  retstr->_cfAbsoluteTimeSec.is_nil = 0;
  retstr->_machAbsoluteTimeSec.value = v6 - v8 * (double)(unint64_t)v7;
  retstr->_machAbsoluteTimeSec.is_nil = 0;
  retstr->_machContinuousTimeSec.value = v6;
  retstr->_machContinuousTimeSec.is_nil = 0;
}

uint64_t ALTimeStamp.cfAbsoluteTimeSec.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

uint64_t ALTimeStamp.machContinuousTimeSec.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 32);
}

uint64_t ALTimeStamp.machAbsoluteTimeSec.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 16);
}

double static ALTimeStamp.now()@<D0>(uint64_t a1@<X8>)
{
  double v2;
  uint64_t v3;
  double v4;
  double v5;
  double v6;
  double result;

  v2 = machContTimeSec()();
  type metadata accessor for TimesSync();
  static TimesSync.instance.getter();
  v3 = dispatch thunk of TimesSync.mctMinusMatNs.getter();
  swift_release();
  v4 = v2 - NsToSec.getter() * (double)(unint64_t)v3;
  static TimesSync.instance.getter();
  dispatch thunk of TimesSync.cfaMinusMctSec.getter();
  v6 = v5;
  swift_release();
  result = v2 + v6;
  *(double *)a1 = v2 + v6;
  *(_BYTE *)(a1 + 8) = 0;
  *(double *)(a1 + 16) = v4;
  *(_BYTE *)(a1 + 24) = 0;
  *(double *)(a1 + 32) = v2;
  *(_BYTE *)(a1 + 40) = 0;
  return result;
}

uint64_t ALTimeStamp.description.getter()
{
  uint64_t v0;
  double v1;
  int v2;
  double v3;
  int v4;
  double v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  Swift::String v11;
  Swift::String v12;
  uint64_t v13;
  double v14;
  Swift::String v15;
  Swift::String v16;
  uint64_t v17;
  double v18;
  Swift::String v19;

  v1 = *(double *)v0;
  v2 = *(unsigned __int8 *)(v0 + 8);
  v3 = *(double *)(v0 + 16);
  v4 = *(unsigned __int8 *)(v0 + 24);
  v5 = *(double *)(v0 + 32);
  v6 = *(unsigned __int8 *)(v0 + 40);
  _StringGuts.grow(_:)(22);
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<CVarArg>);
  v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_2358C8C60;
  v8 = MEMORY[0x24BEE13C8];
  v9 = MEMORY[0x24BEE1448];
  *(_QWORD *)(v7 + 56) = MEMORY[0x24BEE13C8];
  *(_QWORD *)(v7 + 64) = v9;
  if (v2)
    v10 = -1.0;
  else
    v10 = v1;
  *(double *)(v7 + 32) = v10;
  v11._countAndFlagsBits = String.init(format:_:)();
  String.append(_:)(v11);
  swift_bridgeObjectRelease();
  v12._countAndFlagsBits = 0x2074616D202CLL;
  v12._object = (void *)0xE600000000000000;
  String.append(_:)(v12);
  v13 = swift_allocObject();
  *(_OWORD *)(v13 + 16) = xmmword_2358C8C60;
  *(_QWORD *)(v13 + 56) = v8;
  *(_QWORD *)(v13 + 64) = v9;
  if (v4)
    v14 = -1.0;
  else
    v14 = v3;
  *(double *)(v13 + 32) = v14;
  v15._countAndFlagsBits = String.init(format:_:)();
  String.append(_:)(v15);
  swift_bridgeObjectRelease();
  v16._countAndFlagsBits = 0x2074636D202CLL;
  v16._object = (void *)0xE600000000000000;
  String.append(_:)(v16);
  v17 = swift_allocObject();
  *(_OWORD *)(v17 + 16) = xmmword_2358C8C60;
  *(_QWORD *)(v17 + 56) = v8;
  *(_QWORD *)(v17 + 64) = v9;
  if (v6)
    v18 = -1.0;
  else
    v18 = v5;
  *(double *)(v17 + 32) = v18;
  v19._countAndFlagsBits = String.init(format:_:)();
  String.append(_:)(v19);
  swift_bridgeObjectRelease();
  return 543254115;
}

__n128 __swift_memcpy41_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 25) = *(_OWORD *)(a2 + 25);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t getEnumTagSinglePayload for ALTimeStamp(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 41))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for ALTimeStamp(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 40) = 0;
    *(_QWORD *)result = (a2 - 1);
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
  *(_BYTE *)(result + 41) = v3;
  return result;
}

ValueMetadata *type metadata accessor for ALTimeStamp()
{
  return &type metadata for ALTimeStamp;
}

Swift::String __swiftcall prettyFunctionName(_:_:)(Swift::String a1, Swift::String a2)
{
  void *object;
  uint64_t countAndFlagsBits;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  Swift::String v9;
  Swift::String v10;
  uint64_t v11;
  void *v12;
  Swift::String result;

  object = a2._object;
  countAndFlagsBits = a2._countAndFlagsBits;
  lazy protocol witness table accessor for type String and conformance String();
  v4 = StringProtocol.components<A>(separatedBy:)();
  v5 = *(_QWORD *)(v4 + 16);
  if (v5)
  {
    v6 = v4 + 16 * v5;
    v8 = *(_QWORD *)(v6 + 16);
    v7 = *(void **)(v6 + 24);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    v9._countAndFlagsBits = 35;
    v9._object = (void *)0xE100000000000000;
    String.append(_:)(v9);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    v10._countAndFlagsBits = countAndFlagsBits;
    v10._object = object;
    String.append(_:)(v10);
    swift_bridgeObjectRelease();
    countAndFlagsBits = v8;
    object = v7;
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
  }
  v11 = countAndFlagsBits;
  v12 = object;
  result._object = v12;
  result._countAndFlagsBits = v11;
  return result;
}

unint64_t lazy protocol witness table accessor for type String and conformance String()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type String and conformance String;
  if (!lazy protocol witness table cache variable for type String and conformance String)
  {
    result = MEMORY[0x23B7DA498](MEMORY[0x24BEE0D50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type String and conformance String);
  }
  return result;
}

uint64_t Logger._fault(_:function:file:line:)(uint64_t (*a1)(void), void *a2, unint64_t a3, uint64_t a4, char a5, unint64_t a6, uint64_t a7, char a8)
{
  uint64_t result;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unsigned int v18;
  void *v19;
  unsigned int v20;
  Swift::String v21;
  void *v22;
  void *v23;
  Swift::String v24;
  Swift::String v25;
  os_log_type_t v26;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  unsigned int v31;
  unsigned int v32;
  unsigned int v33;
  unsigned int v34;
  int v35;
  unsigned int v36;
  unsigned int v37;
  unsigned int v38;
  unsigned int v39;
  uint64_t v40;

  result = a1();
  v15 = result;
  v17 = v16;
  if ((a8 & 1) != 0)
  {
    v14 = HIDWORD(a6);
    if (!HIDWORD(a6))
    {
      if (a6 >> 11 == 27)
      {
LABEL_45:
        __break(1u);
        goto LABEL_46;
      }
      LODWORD(v14) = WORD1(a6);
      if (WORD1(a6) <= 0x10u)
      {
        if ((a6 & 0xFFFFFF80) == 0)
        {
          if (a6 > 0xFF)
          {
LABEL_36:
            __break(1u);
            goto LABEL_37;
          }
          v18 = (a6 + 1);
          goto LABEL_10;
        }
LABEL_28:
        v30 = (a6 & 0x3F) << 8;
        v31 = (v30 | (a6 >> 6)) + 33217;
        v32 = (v30 | (a6 >> 6) & 0x3F) << 8;
        v33 = (((v32 | (a6 >> 12) & 0x3F) << 8) | (a6 >> 18)) - 2122219023;
        v34 = (v32 | (a6 >> 12)) + 8487393;
        if ((_DWORD)v14)
          v18 = v33;
        else
          v18 = v34;
        if (a6 < 0x800)
          v18 = v31;
LABEL_10:
        v40 = (v18 + 0xFEFEFEFEFEFEFFLL) & ~(-1 << (8 * ((4 - (__clz(v18) >> 3)) & 7)));
        goto LABEL_11;
      }
LABEL_27:
      __break(1u);
      goto LABEL_28;
    }
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  if (!a6)
  {
    __break(1u);
    goto LABEL_26;
  }
LABEL_11:
  result = static String._fromUTF8Repairing(_:)();
  a6 = result;
  a2 = v19;
  if ((a5 & 1) == 0)
  {
    if (a3)
      goto LABEL_21;
    __break(1u);
    goto LABEL_35;
  }
  v14 = HIDWORD(a3);
  if (HIDWORD(a3))
  {
LABEL_35:
    __break(1u);
    goto LABEL_36;
  }
  if (a3 >> 11 == 27)
  {
LABEL_46:
    __break(1u);
    return result;
  }
  LODWORD(v14) = WORD1(a3);
  if (WORD1(a3) > 0x10u)
  {
LABEL_37:
    __break(1u);
LABEL_38:
    v35 = (a3 & 0x3F) << 8;
    v36 = (v35 | (a3 >> 6)) + 33217;
    v37 = (v35 | (a3 >> 6) & 0x3F) << 8;
    v38 = (((v37 | (a3 >> 12) & 0x3F) << 8) | (a3 >> 18)) - 2122219023;
    v39 = (v37 | (a3 >> 12)) + 8487393;
    if ((_DWORD)v14)
      v20 = v38;
    else
      v20 = v39;
    if (a3 < 0x800)
      v20 = v36;
    goto LABEL_20;
  }
  if ((a3 & 0xFFFFFF80) != 0)
    goto LABEL_38;
  if (a3 > 0xFF)
  {
    __break(1u);
    goto LABEL_45;
  }
  v20 = (a3 + 1);
LABEL_20:
  v40 = (v20 + 0xFEFEFEFEFEFEFFLL) & ~(-1 << (8 * ((4 - (__clz(v20) >> 3)) & 7)));
LABEL_21:
  v21._countAndFlagsBits = static String._fromUTF8Repairing(_:)();
  v23 = v22;
  v24._countAndFlagsBits = a6;
  v24._object = a2;
  v21._object = v23;
  v25 = prettyFunctionName(_:_:)(v24, v21);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v26 = static os_log_type_t.fault.getter();
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain();
  v27 = Logger.logObject.getter();
  if (os_log_type_enabled(v27, v26))
  {
    v28 = swift_slowAlloc();
    v29 = swift_slowAlloc();
    v40 = v29;
    *(_DWORD *)v28 = 136315394;
    swift_bridgeObjectRetain();
    getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v25._countAndFlagsBits, (unint64_t)v25._object, &v40);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v28 + 12) = 2080;
    swift_bridgeObjectRetain();
    getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v15, v17, &v40);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_2358BF000, v27, v26, "fault,func,%s,message,%s", (uint8_t *)v28, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x23B7DA4F8](v29, -1, -1);
    MEMORY[0x23B7DA4F8](v28, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
  }

  reportBug(type:subType:subTypeContext:fatalCallback:)(0x746C756166, 0xE500000000000000, v25._countAndFlagsBits, (unint64_t)v25._object, 0, 0, 0, 0);
  return swift_bridgeObjectRelease();
}

uint64_t Logger._fatal(_:function:file:line:)(uint64_t (*a1)(void), void *a2, unint64_t a3, uint64_t a4, char a5, unint64_t a6, uint64_t a7, char a8, uint64_t a9)
{
  void *v9;
  uint64_t v10;
  void *v17;
  unint64_t v18;
  unsigned int v19;
  int v20;
  unsigned int v21;
  unsigned int v22;
  unsigned int v23;
  unsigned int v24;
  int v25;
  unsigned int v26;
  unsigned int v27;
  unsigned int v28;
  unsigned int v29;
  unsigned int v30;
  Swift::String v31;
  void *v32;
  void *v33;
  Swift::String v34;
  Swift::String v35;
  NSObject *v36;
  uint64_t v37;
  uint64_t v38;
  Swift::String v39;
  uint64_t v40;
  void *v41;
  Swift::String v42;
  uint64_t result;
  uint64_t v44;
  os_log_type_t type;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;

  v46 = a1();
  if ((a8 & 1) != 0)
  {
    v18 = HIDWORD(a6);
    if (HIDWORD(a6))
      goto LABEL_21;
    if (a6 >> 11 != 27)
    {
      LODWORD(v18) = WORD1(a6);
      if (WORD1(a6) > 0x10u)
        goto LABEL_22;
      if ((a6 & 0xFFFFFF80) != 0)
        goto LABEL_24;
      if (a6 <= 0xFF)
      {
        v9 = v17;
        v19 = (a6 + 1);
        goto LABEL_10;
      }
      __break(1u);
LABEL_31:
      __break(1u);
    }
    __break(1u);
LABEL_33:
    __break(1u);
    goto LABEL_43;
  }
  if (!a6)
    goto LABEL_20;
  v9 = v17;
  while (1)
  {
    v10 = static String._fromUTF8Repairing(_:)();
    a2 = v17;
    if ((a5 & 1) == 0)
    {
      if (a3)
        goto LABEL_43;
      __break(1u);
    }
    v18 = HIDWORD(a3);
    if (HIDWORD(a3))
      goto LABEL_23;
    if (a3 >> 11 == 27)
      goto LABEL_33;
    LODWORD(v18) = WORD1(a3);
    if (WORD1(a3) > 0x10u)
      goto LABEL_31;
    if ((a3 & 0xFFFFFF80) != 0)
      break;
    if (a3 <= 0xFF)
    {
      v30 = (a3 + 1);
      goto LABEL_42;
    }
    __break(1u);
LABEL_20:
    __break(1u);
LABEL_21:
    __break(1u);
LABEL_22:
    __break(1u);
LABEL_23:
    __break(1u);
LABEL_24:
    v9 = v17;
    v20 = (a6 & 0x3F) << 8;
    v21 = (v20 | (a6 >> 6)) + 33217;
    v22 = (v20 | (a6 >> 6) & 0x3F) << 8;
    v23 = (((v22 | (a6 >> 12) & 0x3F) << 8) | (a6 >> 18)) - 2122219023;
    v24 = (v22 | (a6 >> 12)) + 8487393;
    if ((_DWORD)v18)
      v19 = v23;
    else
      v19 = v24;
    if (a6 < 0x800)
      v19 = v21;
LABEL_10:
    v47 = (v19 + 0xFEFEFEFEFEFEFFLL) & ~(-1 << (8 * ((4 - (__clz(v19) >> 3)) & 7)));
  }
  v25 = (a3 & 0x3F) << 8;
  v26 = (v25 | (a3 >> 6)) + 33217;
  v27 = (v25 | (a3 >> 6) & 0x3F) << 8;
  v28 = (((v27 | (a3 >> 12) & 0x3F) << 8) | (a3 >> 18)) - 2122219023;
  v29 = (v27 | (a3 >> 12)) + 8487393;
  if ((_DWORD)v18)
    v30 = v28;
  else
    v30 = v29;
  if (a3 < 0x800)
    v30 = v26;
LABEL_42:
  v47 = (v30 + 0xFEFEFEFEFEFEFFLL) & ~(-1 << (8 * ((4 - (__clz(v30) >> 3)) & 7)));
LABEL_43:
  v31._countAndFlagsBits = static String._fromUTF8Repairing(_:)();
  v33 = v32;
  v34._countAndFlagsBits = v10;
  v34._object = a2;
  v31._object = v33;
  v35 = prettyFunctionName(_:_:)(v34, v31);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  LOBYTE(v33) = static os_log_type_t.error.getter();
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  v36 = Logger.logObject.getter();
  type = v33;
  if (os_log_type_enabled(v36, (os_log_type_t)v33))
  {
    v37 = swift_slowAlloc();
    v44 = swift_slowAlloc();
    v47 = v44;
    *(_DWORD *)v37 = 136315394;
    swift_bridgeObjectRetain();
    getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v35._countAndFlagsBits, (unint64_t)v35._object, &v47);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v37 + 12) = 2080;
    swift_bridgeObjectRetain();
    getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v46, (unint64_t)v9, &v47);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_2358BF000, v36, type, "fatal,func,%s,message,%s", (uint8_t *)v37, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x23B7DA4F8](v44, -1, -1);
    MEMORY[0x23B7DA4F8](v37, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
  }

  v38 = swift_allocObject();
  *(_QWORD *)(v38 + 16) = v46;
  *(_QWORD *)(v38 + 24) = v9;
  *(_QWORD *)(v38 + 32) = a6;
  *(_QWORD *)(v38 + 40) = a7;
  *(_BYTE *)(v38 + 48) = a8;
  *(_QWORD *)(v38 + 56) = a9;
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain();
  reportBug(type:subType:subTypeContext:fatalCallback:)(0x6C61746166, 0xE500000000000000, v35._countAndFlagsBits, (unint64_t)v35._object, v46, v9, (void (*)(_QWORD))partial apply for closure #1 in Logger._fatal(_:function:file:line:), v38);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  objc_msgSend((id)objc_opt_self(), sel_sleepForTimeInterval_, 10.0);
  v47 = 0;
  v48 = 0xE000000000000000;
  _StringGuts.grow(_:)(19);
  v39._object = (void *)0x80000002358C96A0;
  v39._countAndFlagsBits = 0xD000000000000011;
  String.append(_:)(v39);
  Double.write<A>(to:)();
  v40 = v47;
  v41 = (void *)v48;
  v47 = v46;
  v48 = (unint64_t)v9;
  swift_bridgeObjectRetain();
  v42._countAndFlagsBits = v40;
  v42._object = v41;
  String.append(_:)(v42);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

void *ALLogger.subsystem.unsafeMutableAddressor()
{
  return &static ALLogger.subsystem;
}

unint64_t static ALLogger.subsystem.getter()
{
  return 0xD000000000000013;
}

uint64_t one-time initialization function for core(uint64_t a1)
{
  return one-time initialization function for core(a1, static ALLogger.core);
}

uint64_t ALLogger.core.unsafeMutableAddressor()
{
  return ALLogger.core.unsafeMutableAddressor(&one-time initialization token for core, (uint64_t)static ALLogger.core);
}

uint64_t static ALLogger.core.getter@<X0>(uint64_t a1@<X8>)
{
  return static ALLogger.core.getter(&one-time initialization token for core, (uint64_t)static ALLogger.core, a1);
}

uint64_t one-time initialization function for util(uint64_t a1)
{
  return one-time initialization function for core(a1, static ALLogger.util);
}

uint64_t ALLogger.util.unsafeMutableAddressor()
{
  return ALLogger.core.unsafeMutableAddressor(&one-time initialization token for util, (uint64_t)static ALLogger.util);
}

uint64_t static ALLogger.util.getter@<X0>(uint64_t a1@<X8>)
{
  return static ALLogger.core.getter(&one-time initialization token for util, (uint64_t)static ALLogger.util, a1);
}

uint64_t static ALLogger.core.getter@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;

  if (*a1 != -1)
    swift_once();
  v5 = type metadata accessor for Logger();
  v6 = __swift_project_value_buffer(v5, a2);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a3, v6, v5);
}

uint64_t one-time initialization function for xpc(uint64_t a1)
{
  return one-time initialization function for core(a1, static ALLogger.xpc);
}

uint64_t ALLogger.xpc.unsafeMutableAddressor()
{
  return ALLogger.core.unsafeMutableAddressor(&one-time initialization token for xpc, (uint64_t)static ALLogger.xpc);
}

uint64_t static ALLogger.xpc.getter@<X0>(uint64_t a1@<X8>)
{
  return static ALLogger.core.getter(&one-time initialization token for xpc, (uint64_t)static ALLogger.xpc, a1);
}

uint64_t one-time initialization function for rpc(uint64_t a1)
{
  return one-time initialization function for core(a1, static ALLogger.rpc);
}

uint64_t one-time initialization function for core(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = type metadata accessor for Logger();
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  return Logger.init(subsystem:category:)();
}

uint64_t ALLogger.rpc.unsafeMutableAddressor()
{
  return ALLogger.core.unsafeMutableAddressor(&one-time initialization token for rpc, (uint64_t)static ALLogger.rpc);
}

uint64_t static ALLogger.rpc.getter@<X0>(uint64_t a1@<X8>)
{
  return static ALLogger.core.getter(&one-time initialization token for rpc, (uint64_t)static ALLogger.rpc, a1);
}

uint64_t ALLogger.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t ALLogger.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t ALLogger.__allocating_init()()
{
  return swift_allocObject();
}

uint64_t one-time initialization function for corelog(uint64_t a1)
{
  return one-time initialization function for corelog(a1, corelog, &one-time initialization token for core, (uint64_t)static ALLogger.core);
}

uint64_t corelog.unsafeMutableAddressor()
{
  return ALLogger.core.unsafeMutableAddressor(&one-time initialization token for corelog, (uint64_t)corelog);
}

uint64_t corelog.getter@<X0>(uint64_t a1@<X8>)
{
  return static ALLogger.core.getter(&one-time initialization token for corelog, (uint64_t)corelog, a1);
}

uint64_t one-time initialization function for allog(uint64_t a1)
{
  return one-time initialization function for corelog(a1, allog, &one-time initialization token for core, (uint64_t)static ALLogger.core);
}

uint64_t one-time initialization function for corelog(uint64_t a1, uint64_t *a2, _QWORD *a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v7 = type metadata accessor for Logger();
  __swift_allocate_value_buffer(v7, a2);
  v8 = __swift_project_value_buffer(v7, (uint64_t)a2);
  if (*a3 != -1)
    swift_once();
  v9 = __swift_project_value_buffer(v7, a4);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(v8, v9, v7);
}

uint64_t allog.unsafeMutableAddressor()
{
  return ALLogger.core.unsafeMutableAddressor(&one-time initialization token for allog, (uint64_t)allog);
}

uint64_t allog.getter@<X0>(uint64_t a1@<X8>)
{
  return static ALLogger.core.getter(&one-time initialization token for allog, (uint64_t)allog, a1);
}

uint64_t one-time initialization function for rpclog(uint64_t a1)
{
  return one-time initialization function for corelog(a1, rpclog, &one-time initialization token for rpc, (uint64_t)static ALLogger.rpc);
}

uint64_t rpclog.unsafeMutableAddressor()
{
  return ALLogger.core.unsafeMutableAddressor(&one-time initialization token for rpclog, (uint64_t)rpclog);
}

uint64_t rpclog.getter@<X0>(uint64_t a1@<X8>)
{
  return static ALLogger.core.getter(&one-time initialization token for rpclog, (uint64_t)rpclog, a1);
}

uint64_t one-time initialization function for utillog(uint64_t a1)
{
  return one-time initialization function for corelog(a1, utillog, &one-time initialization token for util, (uint64_t)static ALLogger.util);
}

uint64_t utillog.unsafeMutableAddressor()
{
  return ALLogger.core.unsafeMutableAddressor(&one-time initialization token for utillog, (uint64_t)utillog);
}

uint64_t utillog.getter@<X0>(uint64_t a1@<X8>)
{
  return static ALLogger.core.getter(&one-time initialization token for utillog, (uint64_t)utillog, a1);
}

uint64_t one-time initialization function for xpclog(uint64_t a1)
{
  return one-time initialization function for corelog(a1, xpclog, &one-time initialization token for xpc, (uint64_t)static ALLogger.xpc);
}

uint64_t xpclog.unsafeMutableAddressor()
{
  return ALLogger.core.unsafeMutableAddressor(&one-time initialization token for xpclog, (uint64_t)xpclog);
}

uint64_t ALLogger.core.unsafeMutableAddressor(_QWORD *a1, uint64_t a2)
{
  uint64_t v3;

  if (*a1 != -1)
    swift_once();
  v3 = type metadata accessor for Logger();
  return __swift_project_value_buffer(v3, a2);
}

uint64_t xpclog.getter@<X0>(uint64_t a1@<X8>)
{
  return static ALLogger.core.getter(&one-time initialization token for xpclog, (uint64_t)xpclog, a1);
}

uint64_t DefaultStringInterpolation.appendInterpolation<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t *boxed_opaque_existential_1;
  __int128 v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v16[5];

  v6 = type metadata accessor for Optional();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8]();
  v9 = (char *)&v13 - v8;
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)&v13 - v8, a1, v6);
  v10 = *(_QWORD *)(a2 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v9, 1, a2) == 1)
  {
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    v16[3] = MEMORY[0x24BEE0D00];
    v16[4] = MEMORY[0x24BEE0D70];
    v16[0] = 7104878;
    v16[1] = 0xE300000000000000;
  }
  else
  {
    v14 = a2;
    v15 = a3;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v13);
    (*(void (**)(uint64_t *, char *, uint64_t))(v10 + 32))(boxed_opaque_existential_1, v9, a2);
    outlined init with take of CVarArg(&v13, (uint64_t)v16);
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CustomStringConvertible);
  _print_unlocked<A, B>(_:_:)();
  return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v16);
}

uint64_t getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = specialized _StringGuts._deconstructUTF8<A>(scratch:)(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
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
    ObjectType = MEMORY[0x24BEE2520];
    v12[0] = a1;
    v12[1] = a2;
    v10 = *a3;
    if (*a3)
    {
      outlined init with copy of Any((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v12);
  return v7;
}

uint64_t specialized _StringGuts._deconstructUTF8<A>(scratch:)(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            UnsafeMutableRawBufferPointer.subscript.setter();
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
  v8 = _StringObject.sharedUTF8.getter();
  if (!v8)
  {
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
LABEL_17:
    result = _fatalErrorMessage(_:_:file:line:flags:)();
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

uint64_t _StringGuts._allocateForDeconstruct()(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = specialized _copyCollectionToContiguousArray<A>(_:)(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t specialized _copyCollectionToContiguousArray<A>(_:)(uint64_t a1, unint64_t a2)
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
      v3 = specialized _ContiguousArrayBuffer.init(_uninitializedCount:minimumCapacity:)(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = _StringGuts.copyUTF8(into:)();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
LABEL_10:
      v2 = String.UTF8View._foreignCount()();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    _fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
LABEL_14:
    result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *specialized _ContiguousArrayBuffer.init(_uninitializedCount:minimumCapacity:)(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<UInt8>);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<UInt8>);
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
  result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_2358C667C()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

void partial apply for closure #1 in Logger._fatal(_:function:file:line:)()
{
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t *__swift_allocate_boxed_opaque_existential_1(uint64_t *a1)
{
  uint64_t *v1;
  uint64_t v2;

  v1 = a1;
  if ((*(_BYTE *)(*(_QWORD *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t type metadata accessor for ALLogger()
{
  return objc_opt_self();
}

uint64_t method lookup function for ALLogger()
{
  return swift_lookUpClassMethod();
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

uint64_t __swift_destroy_boxed_opaque_existential_1Tm(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
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

void reportBug(type:subType:subTypeContext:fatalCallback:)(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, void *a6, void (*a7)(_QWORD), uint64_t a8)
{
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  Class v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  char *v26;
  double v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  NSObject *v35;
  os_log_type_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  NSObject *v46;
  os_log_type_t v47;
  void (*v48)(_QWORD);
  uint8_t *v49;
  uint8_t *v50;
  uint64_t v51;
  char *v52;
  Class isa;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  void (*v58)(_QWORD);
  int v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  char *v63;
  unint64_t v64;
  unint64_t v65;
  unint64_t v66;
  uint64_t v67;
  char *v68;
  uint64_t v69;
  char *v70;
  uint64_t v71;
  uint64_t aBlock[7];

  v67 = a8;
  v15 = type metadata accessor for Logger();
  v69 = *(_QWORD *)(v15 - 8);
  v16 = MEMORY[0x24BDAC7A8](v15);
  v63 = (char *)&v57 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v16);
  v68 = (char *)&v57 - v18;
  v70 = (char *)objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD1760]), sel_init);
  v19 = (Class)objc_msgSend(objc_allocWithZone(MEMORY[0x24BEB3470]), sel_init);
  v20 = (void *)MEMORY[0x23B7DA138](0xD000000000000010, 0x80000002358C9920);
  v60 = a1;
  v64 = a2;
  v21 = (void *)MEMORY[0x23B7DA138](a1, a2);
  v61 = a3;
  v65 = a4;
  v22 = (void *)MEMORY[0x23B7DA138](a3, a4);
  v66 = (unint64_t)a6;
  v62 = a5;
  v23 = v15;
  if (a6)
    a6 = (void *)MEMORY[0x23B7DA138](a5, a6);
  v24 = objc_msgSend(v70, sel_processName);
  if (!v24)
  {
    v25 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v24 = (id)MEMORY[0x23B7DA138](v25);
    swift_bridgeObjectRelease();
  }
  v26 = (char *)-[objc_class signatureWithDomain:type:subType:subtypeContext:detectedProcess:triggerThresholdValues:](v19, sel_signatureWithDomain_type_subType_subtypeContext_detectedProcess_triggerThresholdValues_, v20, v21, v22, a6, v24, 0);

  if (!v26)
  {
    v43 = utillog.unsafeMutableAddressor();
    v44 = v69;
    v45 = v63;
    (*(void (**)(char *, uint64_t, uint64_t))(v69 + 16))(v63, v43, v23);
    v46 = Logger.logObject.getter();
    v47 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v46, v47))
    {
      v48 = a7;
      v49 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v49 = 0;
      _os_log_impl(&dword_2358BF000, v46, v47, "reportBugBlocking,signature,nil", v49, 2u);
      v50 = v49;
      a7 = v48;
      v44 = v69;
      MEMORY[0x23B7DA4F8](v50, -1, -1);
    }

    v51 = (*(uint64_t (**)(char *, uint64_t))(v44 + 8))(v45, v23);
    if (a7)
      a7(v51);
    goto LABEL_24;
  }
  v63 = v26;
  if (a7)
    v27 = 0.0;
  else
    v27 = 6.0;
  v28 = utillog.unsafeMutableAddressor();
  v29 = v68;
  v30 = v69;
  v31 = v23;
  (*(void (**)(char *, uint64_t, uint64_t))(v69 + 16))(v68, v28, v23);
  v32 = v66;
  swift_bridgeObjectRetain_n();
  v33 = v64;
  swift_bridgeObjectRetain_n();
  v34 = v65;
  swift_bridgeObjectRetain_n();
  v35 = Logger.logObject.getter();
  v36 = static os_log_type_t.default.getter();
  v59 = v36;
  if (os_log_type_enabled(v35, v36))
  {
    v37 = swift_slowAlloc();
    v57 = swift_slowAlloc();
    aBlock[0] = v57;
    *(_DWORD *)v37 = 136315906;
    v58 = a7;
    swift_bridgeObjectRetain();
    v71 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v60, v33, aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    v38 = v30;
    *(_WORD *)(v37 + 12) = 2080;
    swift_bridgeObjectRetain();
    v71 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v61, v34, aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v37 + 22) = 2080;
    if (v32)
      v39 = v62;
    else
      v39 = 45;
    if (v32)
      v40 = v32;
    else
      v40 = 0xE100000000000000;
    v65 = v31;
    swift_bridgeObjectRetain();
    v41 = v39;
    a7 = v58;
    v71 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v41, v40, aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v37 + 32) = 2048;
    v71 = *(_QWORD *)&v27;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl(&dword_2358BF000, v35, (os_log_type_t)v59, "reportBug,type:%s,subtype:%s,context:%s,delay:%f", (uint8_t *)v37, 0x2Au);
    v42 = v57;
    swift_arrayDestroy();
    MEMORY[0x23B7DA4F8](v42, -1, -1);
    MEMORY[0x23B7DA4F8](v37, -1, -1);

    (*(void (**)(char *, unint64_t))(v38 + 8))(v68, v65);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, unint64_t))(v30 + 8))(v29, v31);
  }
  aBlock[0] = 0;
  v52 = v63;
  static Dictionary._forceBridgeFromObjectiveC(_:result:)();
  if (aBlock[0])
  {

    isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    v54 = swift_allocObject();
    v55 = v67;
    *(_QWORD *)(v54 + 16) = a7;
    *(_QWORD *)(v54 + 24) = v55;
    aBlock[4] = (uint64_t)partial apply for closure #1 in reportBug(type:subType:subTypeContext:fatalCallback:);
    aBlock[5] = v54;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)thunk for @escaping @callee_guaranteed (@guaranteed [AnyHashable : Any]?) -> ();
    aBlock[3] = (uint64_t)&block_descriptor;
    v56 = _Block_copy(aBlock);
    outlined copy of (@escaping @callee_guaranteed () -> ())?((uint64_t)a7);
    swift_release();
    -[objc_class snapshotWithSignature:delay:events:payload:actions:reply:](v19, sel_snapshotWithSignature_delay_events_payload_actions_reply_, isa, 0, 0, 0, v56, v27);
    _Block_release(v56);

    v70 = v52;
    v19 = isa;
LABEL_24:

    return;
  }
  __break(1u);
}

uint64_t logginResponse(_:)(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  unint64_t v15;
  unint64_t v16;
  char v17;
  id v18;
  uint64_t v19;
  NSObject *v20;
  os_log_type_t v21;
  uint8_t *v22;
  uint64_t v24;
  NSObject *v25;
  uint64_t v26;
  uint8_t *v27;
  uint64_t v28;
  NSObject *v29;
  os_log_type_t v30;
  uint8_t *v31;
  uint64_t v32;
  NSObject *v33;
  int v34;
  uint8_t *v35;
  unint64_t v36;
  unint64_t v37;
  char v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  int v43;
  uint64_t v44;
  id v45;
  unint64_t v46;
  _QWORD v47[5];
  __int128 v48;
  __int128 v49;

  v2 = type metadata accessor for Logger();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v6 = (char *)&v42 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = MEMORY[0x24BDAC7A8](v4);
  v9 = (char *)&v42 - v8;
  v10 = MEMORY[0x24BDAC7A8](v7);
  v12 = (char *)&v42 - v11;
  MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v42 - v13;
  if (a1)
  {
    v45 = (id)static String._unconditionallyBridgeFromObjectiveC(_:)();
    v46 = v15;
    swift_bridgeObjectRetain();
    AnyHashable.init<A>(_:)();
    if (*(_QWORD *)(a1 + 16) && (v16 = specialized __RawDictionaryStorage.find<A>(_:)((uint64_t)v47), (v17 & 1) != 0))
    {
      outlined init with copy of Any(*(_QWORD *)(a1 + 56) + 32 * v16, (uint64_t)&v48);
    }
    else
    {
      v48 = 0u;
      v49 = 0u;
    }
    outlined destroy of AnyHashable((uint64_t)v47);
    if (*((_QWORD *)&v49 + 1))
    {
      type metadata accessor for NSNumber();
      if ((swift_dynamicCast() & 1) != 0)
      {
        v18 = v45;
        if (objc_msgSend(v45, sel_BOOLValue))
        {
          swift_bridgeObjectRelease();
          v19 = utillog.unsafeMutableAddressor();
          (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v14, v19, v2);
          v20 = Logger.logObject.getter();
          v21 = static os_log_type_t.default.getter();
          if (os_log_type_enabled(v20, v21))
          {
            v22 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)v22 = 0;
            _os_log_impl(&dword_2358BF000, v20, v21, "reportBug,successful", v22, 2u);
            MEMORY[0x23B7DA4F8](v22, -1, -1);
          }

          return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v14, v2);
        }
        v32 = utillog.unsafeMutableAddressor();
        (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v12, v32, v2);
        swift_bridgeObjectRetain();
        v33 = Logger.logObject.getter();
        v34 = static os_log_type_t.default.getter();
        if (!os_log_type_enabled(v33, (os_log_type_t)v34))
        {

          swift_bridgeObjectRelease_n();
LABEL_33:

          return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v12, v2);
        }
        v43 = v34;
        v35 = (uint8_t *)swift_slowAlloc();
        v42 = swift_slowAlloc();
        v44 = v42;
        *(_DWORD *)v35 = 136315138;
        v45 = (id)static String._unconditionallyBridgeFromObjectiveC(_:)();
        v46 = v36;
        AnyHashable.init<A>(_:)();
        if (*(_QWORD *)(a1 + 16)
          && (v37 = specialized __RawDictionaryStorage.find<A>(_:)((uint64_t)v47), (v38 & 1) != 0))
        {
          outlined init with copy of Any(*(_QWORD *)(a1 + 56) + 32 * v37, (uint64_t)&v48);
        }
        else
        {
          v48 = 0u;
          v49 = 0u;
        }
        outlined destroy of AnyHashable((uint64_t)v47);
        if (*((_QWORD *)&v49 + 1))
        {
          if ((swift_dynamicCast() & 1) != 0)
          {
            v39 = (uint64_t)v45;
            v40 = v46;
LABEL_32:
            v47[0] = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v39, v40, &v44);
            UnsafeMutableRawBufferPointer.copyMemory(from:)();
            swift_bridgeObjectRelease_n();
            swift_bridgeObjectRelease();
            _os_log_impl(&dword_2358BF000, v33, (os_log_type_t)v43, "reportBug,failed,reason,%s ", v35, 0xCu);
            v41 = v42;
            swift_arrayDestroy();
            MEMORY[0x23B7DA4F8](v41, -1, -1);
            MEMORY[0x23B7DA4F8](v35, -1, -1);

            goto LABEL_33;
          }
        }
        else
        {
          outlined destroy of Any?((uint64_t)&v48);
        }
        v40 = 0xE700000000000000;
        v39 = 0x6E776F6E6B6E75;
        goto LABEL_32;
      }
      swift_bridgeObjectRelease();
    }
    else
    {
      swift_bridgeObjectRelease();
      outlined destroy of Any?((uint64_t)&v48);
    }
    v28 = utillog.unsafeMutableAddressor();
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v9, v28, v2);
    v29 = Logger.logObject.getter();
    v30 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v29, v30))
    {
      v31 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v31 = 0;
      _os_log_impl(&dword_2358BF000, v29, v30, "reportBug,response,malformed", v31, 2u);
      MEMORY[0x23B7DA4F8](v31, -1, -1);
    }

    return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v9, v2);
  }
  else
  {
    v24 = utillog.unsafeMutableAddressor();
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v6, v24, v2);
    v25 = Logger.logObject.getter();
    v26 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v25, (os_log_type_t)v26))
    {
      v27 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v27 = 0;
      _os_log_impl(&dword_2358BF000, v25, (os_log_type_t)v26, "reportBug,response,nil", v27, 2u);
      MEMORY[0x23B7DA4F8](v27, -1, -1);
    }

    return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  }
}

uint64_t sub_2358C746C()
{
  uint64_t v0;

  if (*(_QWORD *)(v0 + 16))
    swift_release();
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in reportBug(type:subType:subTypeContext:fatalCallback:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t);
  uint64_t result;

  v2 = *(uint64_t (**)(uint64_t))(v1 + 16);
  result = logginResponse(_:)(a1);
  if (v2)
    return v2(result);
  return result;
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

uint64_t outlined copy of (@escaping @callee_guaranteed () -> ())?(uint64_t result)
{
  if (result)
    return swift_retain();
  return result;
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  Swift::Int v4;

  v2 = v1;
  v4 = AnyHashable._rawHashValue(seed:)(*(_QWORD *)(v2 + 40));
  return specialized __RawDictionaryStorage.find<A>(_:hashValue:)(a1, v4);
}

uint64_t outlined destroy of AnyHashable(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(MEMORY[0x24BEE23D0] - 8) + 8))();
  return a1;
}

uint64_t outlined destroy of Any?(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Any?);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t type metadata accessor for NSNumber()
{
  unint64_t result;

  result = lazy cache variable for type metadata for NSNumber;
  if (!lazy cache variable for type metadata for NSNumber)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&lazy cache variable for type metadata for NSNumber);
  }
  return result;
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:hashValue:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v6;
  char v7;
  _BYTE v9[40];

  v3 = -1 << *(_BYTE *)(v2 + 32);
  v4 = a2 & ~v3;
  if (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0)
  {
    v6 = ~v3;
    do
    {
      outlined init with copy of AnyHashable(*(_QWORD *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      v7 = MEMORY[0x23B7DA210](v9, a1);
      outlined destroy of AnyHashable((uint64_t)v9);
      if ((v7 & 1) != 0)
        break;
      v4 = (v4 + 1) & v6;
    }
    while (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

uint64_t outlined init with copy of AnyHashable(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(MEMORY[0x24BEE23D0] - 8) + 16))(a2, a1);
  return a2;
}

Swift::Int *NsInUs.unsafeMutableAddressor()
{
  return &NsInUs;
}

uint64_t NsInUs.getter()
{
  return 1000;
}

Swift::Int *NsInMs.unsafeMutableAddressor()
{
  return &NsInMs;
}

uint64_t NsInMs.getter()
{
  return 1000000;
}

Swift::Int *NsInSec.unsafeMutableAddressor()
{
  return &NsInSec;
}

uint64_t NsInSec.getter()
{
  return 1000000000;
}

Swift::Int *UsInMs.unsafeMutableAddressor()
{
  return &UsInMs;
}

Swift::Int *UsInSec.unsafeMutableAddressor()
{
  return &UsInSec;
}

Swift::Int *MsInSec.unsafeMutableAddressor()
{
  return &MsInSec;
}

Swift::Int *SecInMin.unsafeMutableAddressor()
{
  return &SecInMin;
}

uint64_t SecInMin.getter()
{
  return 60;
}

Swift::Int *SecInHr.unsafeMutableAddressor()
{
  return &SecInHr;
}

uint64_t SecInHr.getter()
{
  return 3600;
}

void one-time initialization function for NsToUs()
{
  NsToUs = 0.001;
}

Swift::Double *NsToUs.unsafeMutableAddressor()
{
  if (one-time initialization token for NsToUs != -1)
    swift_once();
  return &NsToUs;
}

double NsToUs.getter()
{
  return NsToUs.getter(&one-time initialization token for NsToUs, (uint64_t)&NsToUs);
}

void one-time initialization function for NsToMs()
{
  NsToMs = 0.000001;
}

Swift::Double *NsToMs.unsafeMutableAddressor()
{
  if (one-time initialization token for NsToMs != -1)
    swift_once();
  return &NsToMs;
}

double NsToMs.getter()
{
  return NsToUs.getter(&one-time initialization token for NsToMs, (uint64_t)&NsToMs);
}

void one-time initialization function for NsToSec()
{
  NsToSec = 0.000000001;
}

Swift::Double *NsToSec.unsafeMutableAddressor()
{
  if (one-time initialization token for NsToSec != -1)
    swift_once();
  return &NsToSec;
}

double NsToSec.getter()
{
  return NsToUs.getter(&one-time initialization token for NsToSec, (uint64_t)&NsToSec);
}

void one-time initialization function for UsToMs()
{
  UsToMs = 0.001;
}

Swift::Double *UsToMs.unsafeMutableAddressor()
{
  if (one-time initialization token for UsToMs != -1)
    swift_once();
  return &UsToMs;
}

double UsToMs.getter()
{
  return NsToUs.getter(&one-time initialization token for UsToMs, (uint64_t)&UsToMs);
}

void one-time initialization function for UsToSec()
{
  UsToSec = 0.000001;
}

Swift::Double *UsToSec.unsafeMutableAddressor()
{
  if (one-time initialization token for UsToSec != -1)
    swift_once();
  return &UsToSec;
}

double UsToSec.getter()
{
  return NsToUs.getter(&one-time initialization token for UsToSec, (uint64_t)&UsToSec);
}

void one-time initialization function for UsToMin()
{
  UsToMin = 0.0000000166666667;
}

Swift::Double *UsToMin.unsafeMutableAddressor()
{
  if (one-time initialization token for UsToMin != -1)
    swift_once();
  return &UsToMin;
}

double UsToMin.getter()
{
  return NsToUs.getter(&one-time initialization token for UsToMin, (uint64_t)&UsToMin);
}

void one-time initialization function for MsToSec()
{
  MsToSec = 0.001;
}

Swift::Double *MsToSec.unsafeMutableAddressor()
{
  if (one-time initialization token for MsToSec != -1)
    swift_once();
  return &MsToSec;
}

double MsToSec.getter()
{
  return NsToUs.getter(&one-time initialization token for MsToSec, (uint64_t)&MsToSec);
}

double NsToUs.getter(_QWORD *a1, uint64_t a2)
{
  if (*a1 != -1)
    swift_once();
  return *(double *)a2;
}

uint64_t TicksInfo.denominator.getter(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t variable initialization expression of TicksInfo.precisionReductionBits()
{
  return 0;
}

uint64_t TicksInfo.precisionReductionBits.getter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a3;
}

uint64_t ticksInfo()()
{
  if (one-time initialization token for sTicksInfo != -1)
    swift_once();
  return static sTicksInfo in FuncData #1 in ticksInfo();
}

Swift::UInt64 __swiftcall convertTicksToNs(_:)(Swift::UInt64 result)
{
  Swift::UInt64 v1;

  v1 = result;
  if (one-time initialization token for sTicksInfo != -1)
    result = swift_once();
  if (is_mul_ok(v1, static sTicksInfo in FuncData #1 in ticksInfo()))
  {
    if (static sTicksInfo in FuncData #1 in ticksInfo())
      return v1 * static sTicksInfo in FuncData #1 in ticksInfo() / static sTicksInfo in FuncData #1 in ticksInfo();
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

Swift::UInt64 __swiftcall convertNsToTicks(_:)(Swift::UInt64 result)
{
  Swift::UInt64 v1;

  v1 = result;
  if (one-time initialization token for sTicksInfo != -1)
    result = swift_once();
  if (is_mul_ok(v1, static sTicksInfo in FuncData #1 in ticksInfo()))
  {
    if (static sTicksInfo in FuncData #1 in ticksInfo())
      return v1 * static sTicksInfo in FuncData #1 in ticksInfo() / static sTicksInfo in FuncData #1 in ticksInfo();
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

Swift::UInt64 __swiftcall machAbsTimeNs()()
{
  Swift::UInt64 v0;

  v0 = mach_absolute_time();
  return convertTicksToNs(_:)(v0);
}

Swift::Double __swiftcall machAbsTimeSec()()
{
  return machAbsTimeSec()(MEMORY[0x24BDAEB30]);
}

Swift::UInt64 __swiftcall machContTimeNs()()
{
  Swift::UInt64 v0;

  v0 = mach_continuous_time();
  return convertTicksToNs(_:)(v0);
}

Swift::Double __swiftcall machContTimeSec()()
{
  return machAbsTimeSec()(MEMORY[0x24BDAEB48]);
}

Swift::Double machAbsTimeSec()(uint64_t (*a1)(void))
{
  Swift::UInt64 v1;
  Swift::UInt64 v2;

  v1 = a1();
  v2 = convertTicksToNs(_:)(v1);
  if (one-time initialization token for NsToSec != -1)
    swift_once();
  return NsToSec * (double)v2;
}

uint64_t one-time initialization function for instance()
{
  uint64_t result;

  type metadata accessor for TimesSync();
  result = swift_initStaticObject();
  static TimesSync.instance = result;
  return result;
}

uint64_t *TimesSync.instance.unsafeMutableAddressor()
{
  if (one-time initialization token for instance != -1)
    swift_once();
  return &static TimesSync.instance;
}

uint64_t static TimesSync.instance.getter()
{
  type metadata accessor for TimesSync();
  return swift_initStaticObject();
}

double variable initialization expression of TimesSync._cfaMinusMctSec()
{
  return 0.0;
}

Swift::Bool __swiftcall TimesSync.needsSync()()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;

  v1 = (*(uint64_t (**)(void))(*(_QWORD *)v0 + 192))();
  if ((v2 & 1) != 0)
  {
    LOBYTE(v4) = 1;
  }
  else
  {
    v3 = v1;
    v4 = mach_continuous_time();
    v5 = v4;
    if (one-time initialization token for SyncIntervalTicks != -1)
      LOBYTE(v4) = swift_once();
    if (__CFADD__(v3, static TimesSync.SyncIntervalTicks))
      __break(1u);
    else
      LOBYTE(v4) = v3 + static TimesSync.SyncIntervalTicks < v5;
  }
  return v4;
}

uint64_t *TimesSync.SyncIntervalTicks.unsafeMutableAddressor()
{
  if (one-time initialization token for SyncIntervalTicks != -1)
    swift_once();
  return &static TimesSync.SyncIntervalTicks;
}

Swift::Void __swiftcall TimesSync.sync()()
{
  uint64_t v0;
  double v1;
  double v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE *v11;
  Swift::UInt64 v12;
  Swift::UInt64 v13;
  double v14;
  Swift::Double v15;
  Swift::UInt64 v16;
  uint64_t v17;
  void (*v18)(_BYTE *, uint64_t, uint64_t);
  NSObject *v19;
  os_log_type_t v20;
  int v21;
  _DWORD *v22;
  _DWORD *v23;
  void (*v24)(_BYTE *, uint64_t);
  NSObject *v25;
  os_log_type_t v26;
  uint64_t v27;
  uint64_t v28;
  _BYTE v29[4];
  int v30;
  NSObject *v31;
  double v32;
  uint64_t v33;
  uint64_t v34;
  Swift::UInt64 v35;
  Swift::UInt64 v36;
  Swift::UInt64 v37;
  Swift::UInt64 v38;
  uint64_t v39;

  v3 = v0;
  v39 = *MEMORY[0x24BDAC8D0];
  v4 = type metadata accessor for Logger();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = &v29[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v9 = MEMORY[0x24BDAC7A8](v6);
  v11 = &v29[-v10];
  if (((*(uint64_t (**)(uint64_t))(*(_QWORD *)v0 + 112))(v9) & 1) == 0)
    return;
  v35 = 0;
  v36 = 0;
  v33 = 0;
  v34 = 0;
  mach_get_times();
  v12 = v36;
  if (v36 < v35)
  {
    __break(1u);
    goto LABEL_12;
  }
  v13 = convertTicksToNs(_:)(v36 - v35);
  (*(void (**)(Swift::UInt64))(*(_QWORD *)v0 + 152))(v13);
  v1 = (double)v33;
  v2 = (double)v34;
  if (one-time initialization token for NsToSec != -1)
LABEL_12:
    swift_once();
  v14 = NsToSec;
  v15 = NsToSec * v2 + v1;
  v16 = convertTicksToNs(_:)(v12);
  (*(void (**)(double))(*(_QWORD *)v0 + 176))(v15 - v14 * (double)v16 - *MEMORY[0x24BDBD238]);
  (*(void (**)(Swift::UInt64, _QWORD))(*(_QWORD *)v0 + 200))(v12, 0);
  v17 = corelog.unsafeMutableAddressor();
  v18 = *(void (**)(_BYTE *, uint64_t, uint64_t))(v5 + 16);
  v18(v11, v17, v4);
  v19 = Logger.logObject.getter();
  v20 = static os_log_type_t.debug.getter();
  v21 = v20;
  if (os_log_type_enabled(v19, v20))
  {
    v22 = (_DWORD *)swift_slowAlloc();
    v30 = v21;
    v23 = v22;
    *v22 = 134349824;
    swift_beginAccess();
    v38 = v35;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *((_WORD *)v23 + 6) = 2050;
    swift_beginAccess();
    v37 = v36;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *((_WORD *)v23 + 11) = 2050;
    swift_beginAccess();
    v31 = v19;
    v32 = *(double *)&v33;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *((_WORD *)v23 + 16) = 2050;
    v32 = *(double *)&v34;
    v19 = v31;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl(&dword_2358BF000, v19, (os_log_type_t)v30, "TimeSync,mat,%{public}llu,mct,%{public}llu,tp,%{public}ld,%{public}ld", (uint8_t *)v23, 0x2Au);
    MEMORY[0x23B7DA4F8](v23, -1, -1);
  }

  v24 = *(void (**)(_BYTE *, uint64_t))(v5 + 8);
  v24(v11, v4);
  v18(v8, v17, v4);
  swift_retain();
  v25 = Logger.logObject.getter();
  v26 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v25, v26))
  {
    v27 = swift_slowAlloc();
    *(_DWORD *)v27 = 134349312;
    v32 = NsToSec * (double)(unint64_t)(*(uint64_t (**)(void))(*(_QWORD *)v3 + 144))();
    v28 = UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v27 + 12) = 2050;
    v32 = (*(double (**)(uint64_t))(*(_QWORD *)v3 + 168))(v28);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_release();
    _os_log_impl(&dword_2358BF000, v25, v26, "TimeSync,mct-mat,%{public}f,cfa-mct,%{public}f", (uint8_t *)v27, 0x16u);
    MEMORY[0x23B7DA4F8](v27, -1, -1);

  }
  else
  {

    swift_release();
  }
  v24(v8, v4);
}

uint64_t TimesSync.mctMinusMatNs.getter()
{
  uint64_t v0;

  (*(void (**)(void))(*(_QWORD *)v0 + 120))();
  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 144))();
}

uint64_t TimesSync.cfaMinusMctSec.getter()
{
  uint64_t v0;

  (*(void (**)(void))(*(_QWORD *)v0 + 120))();
  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 168))();
}

void *TimesSync.SyncIntervalSec.unsafeMutableAddressor()
{
  return &static TimesSync.SyncIntervalSec;
}

uint64_t static TimesSync.SyncIntervalSec.getter()
{
  return 100;
}

Swift::UInt64 one-time initialization function for SyncIntervalTicks()
{
  Swift::UInt64 result;

  result = convertNsToTicks(_:)(0x174876E800uLL);
  static TimesSync.SyncIntervalTicks = result;
  return result;
}

uint64_t static TimesSync.SyncIntervalTicks.getter()
{
  if (one-time initialization token for SyncIntervalTicks != -1)
    swift_once();
  return static TimesSync.SyncIntervalTicks;
}

uint64_t TimesSync._mctMinusMatNs.getter()
{
  uint64_t v0;

  swift_beginAccess();
  return *(_QWORD *)(v0 + 16);
}

uint64_t TimesSync._mctMinusMatNs.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  result = swift_beginAccess();
  *(_QWORD *)(v1 + 16) = a1;
  return result;
}

uint64_t (*TimesSync._mctMinusMatNs.modify())()
{
  swift_beginAccess();
  return TimesSync._mctMinusMatNs.modify;
}

double TimesSync._cfaMinusMctSec.getter()
{
  uint64_t v0;

  swift_beginAccess();
  return *(double *)(v0 + 24);
}

uint64_t TimesSync._cfaMinusMctSec.setter(double a1)
{
  uint64_t v1;
  uint64_t result;

  result = swift_beginAccess();
  *(double *)(v1 + 24) = a1;
  return result;
}

uint64_t (*TimesSync._cfaMinusMctSec.modify())()
{
  swift_beginAccess();
  return TimesSync._cfaMinusMctSec.modify;
}

uint64_t TimesSync._lastsyncMctTicks.getter()
{
  uint64_t v0;

  swift_beginAccess();
  return *(_QWORD *)(v0 + 32);
}

uint64_t TimesSync._lastsyncMctTicks.setter(uint64_t a1, char a2)
{
  uint64_t v2;
  uint64_t result;

  result = swift_beginAccess();
  *(_QWORD *)(v2 + 32) = a1;
  *(_BYTE *)(v2 + 40) = a2 & 1;
  return result;
}

uint64_t (*TimesSync._lastsyncMctTicks.modify())()
{
  swift_beginAccess();
  return TimesSync._cfaMinusMctSec.modify;
}

uint64_t TimesSync.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t one-time initialization function for sTicksInfo()
{
  uint64_t result;
  uint64_t v1;

  result = closure #1 in variable initialization expression of static sTicksInfo in FuncData #1 in ticksInfo()();
  static sTicksInfo in FuncData #1 in ticksInfo() = result;
  static sTicksInfo in FuncData #1 in ticksInfo() = v1;
  return result;
}

uint64_t type metadata accessor for TimesSync()
{
  return objc_opt_self();
}

uint64_t closure #1 in variable initialization expression of static sTicksInfo in FuncData #1 in ticksInfo()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint64_t v7;
  mach_timebase_info info;
  uint32_t numer;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v0 = type metadata accessor for Logger();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8]();
  v3 = (char *)&info - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  info = (mach_timebase_info)0x100000001;
  if (mach_timebase_info(&info))
  {
    __break(1u);
    goto LABEL_8;
  }
  if (!info.numer)
  {
LABEL_8:
    __break(1u);
LABEL_9:
    __break(1u);
  }
  if (!info.denom)
    goto LABEL_9;
  v4 = utillog.unsafeMutableAddressor();
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v3, v4, v0);
  v5 = Logger.logObject.getter();
  v6 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = swift_slowAlloc();
    *(_DWORD *)v7 = 67109376;
    swift_beginAccess();
    numer = info.numer;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v7 + 8) = 1024;
    numer = info.denom;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl(&dword_2358BF000, v5, v6, "ticksInfo,numer,%u,denom,%u", (uint8_t *)v7, 0xEu);
    MEMORY[0x23B7DA4F8](v7, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  swift_beginAccess();
  return info.numer;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for TicksInfo(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 24))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for TicksInfo(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)result = (a2 - 1);
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
  *(_BYTE *)(result + 24) = v3;
  return result;
}

ValueMetadata *type metadata accessor for TicksInfo()
{
  return &type metadata for TicksInfo;
}

uint64_t method lookup function for TimesSync()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of TimesSync.mctMinusMatNs.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 128))();
}

uint64_t dispatch thunk of TimesSync.cfaMinusMctSec.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 136))();
}

uint64_t Logger.logObject.getter()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t Logger.init(subsystem:category:)()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t type metadata accessor for Logger()
{
  return MEMORY[0x24BEE78D8]();
}

NSDictionary __swiftcall Dictionary._bridgeToObjectiveC()()
{
  return (NSDictionary)MEMORY[0x24BDCF800]();
}

uint64_t static Dictionary._forceBridgeFromObjectiveC(_:result:)()
{
  return MEMORY[0x24BDCF810]();
}

uint64_t static Dictionary._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x24BDCF838]();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)MEMORY[0x24BDCF9E8]();
}

uint64_t static String._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x24BDCFA20]();
}

uint64_t String.init(format:_:)()
{
  return MEMORY[0x24BDCFA78]();
}

uint64_t static String._fromUTF8Repairing(_:)()
{
  return MEMORY[0x24BEE0AD0]();
}

Swift::Void __swiftcall String.append(_:)(Swift::String a1)
{
  MEMORY[0x24BEE0BC0](a1._countAndFlagsBits, a1._object);
}

Swift::Int __swiftcall String.UTF8View._foreignCount()()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t Double.write<A>(to:)()
{
  return MEMORY[0x24BEE13A8]();
}

uint64_t Float.write<A>(to:)()
{
  return MEMORY[0x24BEE14C8]();
}

uint64_t static os_log_type_t.info.getter()
{
  return MEMORY[0x24BEE78F0]();
}

uint64_t static os_log_type_t.debug.getter()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t static os_log_type_t.error.getter()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t static os_log_type_t.fault.getter()
{
  return MEMORY[0x24BEE7920]();
}

uint64_t static os_log_type_t.default.getter()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t type metadata accessor for Optional()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t UnsafeMutableRawBufferPointer.copyMemory(from:)()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t UnsafeMutableRawBufferPointer.subscript.setter()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t StringProtocol.components<A>(separatedBy:)()
{
  return MEMORY[0x24BDD04D0]();
}

Swift::Int __swiftcall AnyHashable._rawHashValue(seed:)(Swift::Int seed)
{
  return MEMORY[0x24BEE23A0](seed);
}

uint64_t static AnyHashable.== infix(_:_:)()
{
  return MEMORY[0x24BEE23A8]();
}

uint64_t AnyHashable.init<A>(_:)()
{
  return MEMORY[0x24BEE23E8]();
}

Swift::Void __swiftcall _StringGuts.grow(_:)(Swift::Int a1)
{
  MEMORY[0x24BEE2510](a1);
}

uint64_t _StringGuts.copyUTF8(into:)()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t _StringObject.sharedUTF8.getter()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t _print_unlocked<A, B>(_:_:)()
{
  return MEMORY[0x24BEE2BE0]();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return MEMORY[0x24BEE2F40]();
}

{
  return MEMORY[0x24BEE2F48]();
}

uint64_t _fatalErrorMessage(_:_:file:line:flags:)()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t dispatch thunk of CustomStringConvertible.description.getter()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t Hasher.init(_seed:)()
{
  return MEMORY[0x24BEE42E0]();
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt a1)
{
  MEMORY[0x24BEE42F8](a1);
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return MEMORY[0x24BEE4328]();
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

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x24BDAEB30]();
}

uint64_t mach_continuous_time(void)
{
  return MEMORY[0x24BDAEB48]();
}

uint64_t mach_get_times()
{
  return MEMORY[0x24BDAEB60]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x24BDAEC68](info);
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

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x24BEDCF78](a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD108](a1, a2);
}

uint64_t objc_opt_self()
{
  return MEMORY[0x24BEDD168]();
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x24BEE4B58]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x24BEE4B98]();
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

uint64_t swift_endAccess()
{
  return MEMORY[0x24BEE4C98]();
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

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x24BEE4E20]();
}

uint64_t swift_initStaticObject()
{
  return MEMORY[0x24BEE4E50]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x24BEE4E98]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x24BEE4EA8]();
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

