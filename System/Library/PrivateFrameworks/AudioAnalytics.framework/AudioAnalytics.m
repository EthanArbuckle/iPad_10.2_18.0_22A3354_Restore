void sub_21DBB1560(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_21DBB15F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_21DBB1688(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void AudioAnalyticsCreateSharedClientWithEndpoint(void *a1)
{
  uint64_t v1;
  id v2;
  id v3;
  id v4;
  char *v5;
  id v6;

  v1 = qword_253F3D9E0;
  v2 = a1;
  if (v1 != -1)
    swift_once();
  v3 = objc_allocWithZone((Class)type metadata accessor for ServerClient(0));
  v4 = v2;
  v5 = sub_21DBC1EA8(v2, 0);
  v6 = (id)qword_253F3DC50;
  qword_253F3DC50 = (uint64_t)v5;

}

Swift::Void __swiftcall AudioAnalyticsCreateSharedClient(endpoint:)(NSXPCListenerEndpoint endpoint)
{
  id v2;
  objc_class *v3;
  char *v4;
  void *v5;

  if (qword_253F3D9E0 != -1)
    swift_once();
  v2 = objc_allocWithZone((Class)type metadata accessor for ServerClient(0));
  v3 = endpoint.super.isa;
  v4 = sub_21DBC1EA8(endpoint.super.isa, 0);
  v5 = (void *)qword_253F3DC50;
  qword_253F3DC50 = (uint64_t)v4;

}

void type metadata accessor for CFDictionary(uint64_t a1)
{
  sub_21DBB17F0(a1, &qword_2553A42E8);
}

void type metadata accessor for AudioEventType(uint64_t a1)
{
  sub_21DBB17F0(a1, &qword_2553A42F0);
}

void type metadata accessor for AudioEventCategory(uint64_t a1)
{
  sub_21DBB17F0(a1, &qword_2553A42F8);
}

void type metadata accessor for AudioServiceType(uint64_t a1)
{
  sub_21DBB17F0(a1, qword_2553A3EB8);
}

void sub_21DBB17F0(uint64_t a1, unint64_t *a2)
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

unint64_t sub_21DBB1838()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2553A3E80;
  if (!qword_2553A3E80)
  {
    type metadata accessor for AudioServiceType(255);
    result = MEMORY[0x22079B718](&unk_21DBD3004, v1);
    atomic_store(result, (unint64_t *)&qword_2553A3E80);
  }
  return result;
}

_DWORD *sub_21DBB1880@<X0>(_DWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_DWORD *)a2 = *result;
  *(_BYTE *)(a2 + 4) = 0;
  return result;
}

void sub_21DBB1890(_DWORD *a1@<X8>)
{
  _DWORD *v1;

  *a1 = *v1;
}

_WORD *sub_21DBB189C@<X0>(_WORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_WORD *)a2 = *result;
  *(_BYTE *)(a2 + 2) = 0;
  return result;
}

void sub_21DBB18AC(_WORD *a1@<X8>)
{
  _WORD *v1;

  *a1 = *v1;
}

BOOL sub_21DBB18B8(unsigned __int16 *a1, unsigned __int16 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_21DBB18CC()
{
  sub_21DBD25A8();
  sub_21DBD25C0();
  return sub_21DBD25CC();
}

uint64_t sub_21DBB1910()
{
  return sub_21DBD25C0();
}

uint64_t sub_21DBB1938()
{
  sub_21DBD25A8();
  sub_21DBD25C0();
  return sub_21DBD25CC();
}

uint64_t AudioAnalyticsCreateSharedClient()
{
  uint64_t result;

  if (qword_253F3D9E0 != -1)
    return swift_once();
  return result;
}

Swift::Void __swiftcall AudioAnalyticsCreateSharedClient()()
{
  if (qword_253F3D9E0 != -1)
    swift_once();
}

uint64_t AudioAnalyticsCreateReporter(uint64_t a1, uint64_t a2)
{
  id v2;
  id v3;
  uint64_t v5;

  if (qword_253F3D9E0 != -1)
    a1 = swift_once();
  MEMORY[0x24BDAC7A8](a1, a2);
  v3 = v2;
  sub_21DBD247C();

  return v5;
}

Swift::Int64 __swiftcall AudioAnalyticsCreateReporter()()
{
  uint64_t v0;
  uint64_t v1;
  id v2;
  id v3;
  Swift::Int64 v5;

  if (qword_253F3D9E0 != -1)
    v0 = swift_once();
  MEMORY[0x24BDAC7A8](v0, v1);
  v3 = v2;
  sub_21DBD247C();

  return v5;
}

uint64_t AudioAnalyticsCreateReporterFromSessionID(uint64_t a1, uint64_t a2)
{
  id v2;
  id v3;
  uint64_t v5;

  if (qword_253F3D9E0 != -1)
    a1 = swift_once();
  MEMORY[0x24BDAC7A8](a1, a2);
  v3 = v2;
  sub_21DBD247C();

  return v5;
}

Swift::Int64 __swiftcall AudioAnalyticsCreateReporterFromSessionID(_:)(Swift::UInt32 a1)
{
  uint64_t v1;
  id v2;
  id v3;
  Swift::Int64 v5;

  if (qword_253F3D9E0 != -1)
    *(_QWORD *)&a1 = swift_once();
  MEMORY[0x24BDAC7A8](*(_QWORD *)&a1, v1);
  v3 = v2;
  sub_21DBD247C();

  return v5;
}

Swift::Void __swiftcall AudioAnalyticsStartReporter(_:)(Swift::Int64 a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD v8[6];

  if (qword_253F3DA10 != -1)
    swift_once();
  if (qword_253F3DC38 != a1)
  {
    if (qword_253F3D9E0 != -1)
      swift_once();
    v2 = (void *)qword_253F3DC50;
    v3 = *(NSObject **)(qword_253F3DC50 + OBJC_IVAR____TtC14AudioAnalytics12ServerClient_serialQueue);
    v4 = swift_allocObject();
    *(_QWORD *)(v4 + 16) = v2;
    *(_QWORD *)(v4 + 24) = a1;
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = sub_21DBB3C64;
    *(_QWORD *)(v5 + 24) = v4;
    v8[4] = sub_21DBB3C7C;
    v8[5] = v5;
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 1107296256;
    v8[2] = sub_21DBB3BEC;
    v8[3] = &block_descriptor;
    v6 = _Block_copy(v8);
    v7 = v2;
    swift_retain();
    swift_release();
    dispatch_sync(v3, v6);
    _Block_release(v6);
    LOBYTE(v3) = swift_isEscapingClosureAtFileLocation();

    swift_release();
    swift_release();
    if ((v3 & 1) != 0)
      __break(1u);
  }
}

Swift::Void __swiftcall AudioAnalyticsStopReporter(_:)(Swift::Int64 a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD v8[6];

  if (qword_253F3DA10 != -1)
    swift_once();
  if (qword_253F3DC38 != a1)
  {
    if (qword_253F3D9E0 != -1)
      swift_once();
    v2 = (void *)qword_253F3DC50;
    v3 = *(NSObject **)(qword_253F3DC50 + OBJC_IVAR____TtC14AudioAnalytics12ServerClient_serialQueue);
    v4 = swift_allocObject();
    *(_QWORD *)(v4 + 16) = v2;
    *(_QWORD *)(v4 + 24) = a1;
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = sub_21DBB3CB4;
    *(_QWORD *)(v5 + 24) = v4;
    v8[4] = sub_21DBB4064;
    v8[5] = v5;
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 1107296256;
    v8[2] = sub_21DBB3BEC;
    v8[3] = &block_descriptor_15;
    v6 = _Block_copy(v8);
    v7 = v2;
    swift_retain();
    swift_release();
    dispatch_sync(v3, v6);
    _Block_release(v6);
    LOBYTE(v3) = swift_isEscapingClosureAtFileLocation();

    swift_release();
    swift_release();
    if ((v3 & 1) != 0)
      __break(1u);
  }
}

uint64_t AudioAnalyticsGetAudioServiceType(uint64_t a1, uint64_t a2)
{
  return (unsigned __int16)AudioAnalyticsGetAudioServiceType(_:)(a1, a2);
}

uint64_t AudioAnalyticsGetAudioServiceType(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void *v4;
  id v5;
  unsigned __int16 v6;

  v2 = a1;
  if (qword_253F3DA10 != -1)
    a1 = swift_once();
  if (qword_253F3DC38 == v2)
    return 0xFFFFLL;
  if (qword_253F3D9E0 != -1)
    a1 = swift_once();
  v4 = (void *)qword_253F3DC50;
  MEMORY[0x24BDAC7A8](a1, a2);
  type metadata accessor for AudioServiceType(0);
  v5 = v4;
  sub_21DBD247C();

  return v6;
}

uint64_t AudioAnalyticsSetAudioServiceType(_:_:)(uint64_t result, __int16 a2)
{
  uint64_t v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD v10[6];

  v3 = result;
  if (qword_253F3DA10 != -1)
    result = swift_once();
  if (qword_253F3DC38 != v3)
  {
    if (qword_253F3D9E0 != -1)
      swift_once();
    v4 = (void *)qword_253F3DC50;
    v5 = *(NSObject **)(qword_253F3DC50 + OBJC_IVAR____TtC14AudioAnalytics12ServerClient_serialQueue);
    v6 = swift_allocObject();
    *(_QWORD *)(v6 + 16) = v4;
    *(_WORD *)(v6 + 24) = a2;
    *(_QWORD *)(v6 + 32) = v3;
    v7 = swift_allocObject();
    *(_QWORD *)(v7 + 16) = sub_21DBB3D08;
    *(_QWORD *)(v7 + 24) = v6;
    v10[4] = sub_21DBB4064;
    v10[5] = v7;
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 1107296256;
    v10[2] = sub_21DBB3BEC;
    v10[3] = &block_descriptor_25;
    v8 = _Block_copy(v10);
    v9 = v4;
    swift_retain();
    swift_release();
    dispatch_sync(v5, v8);
    _Block_release(v8);
    LOBYTE(v5) = swift_isEscapingClosureAtFileLocation();

    swift_release();
    result = swift_release();
    if ((v5 & 1) != 0)
      __break(1u);
  }
  return result;
}

uint64_t AudioAnalyticsCopyConfiguration(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  id v4;
  id v5;

  v2 = a1;
  if (qword_253F3DA10 != -1)
    a1 = swift_once();
  if (qword_253F3DC38 == v2)
    return 0;
  if (qword_253F3D9E0 != -1)
    a1 = swift_once();
  MEMORY[0x24BDAC7A8](a1, a2);
  v5 = v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2553A4300);
  sub_21DBD247C();

  v3 = sub_21DBD238C();
  swift_bridgeObjectRelease();
  return v3;
}

void AudioAnalyticsSetConfiguration(Swift::Int64 a1, void *a2)
{
  const __CFDictionary *v3;

  v3 = a2;
  AudioAnalyticsSetConfiguration(_:_:)(a1, v3);

}

Swift::Void __swiftcall AudioAnalyticsSetConfiguration(_:_:)(Swift::Int64 a1, CFDictionaryRef a2)
{
  if (qword_253F3DA10 != -1)
    swift_once();
  if (qword_253F3DC38 != a1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_253F3D900);
    sub_21DBD2398();
  }
}

unint64_t sub_21DBB26B4(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  _OWORD *v6;
  _OWORD *v7;
  uint64_t *v8;
  uint64_t *v9;
  unint64_t result;
  uint64_t *v11;
  uint64_t *v12;
  uint64_t v13;
  _OWORD *v14;
  _OWORD *v15;
  uint64_t *v16;
  _OWORD *v17;
  unint64_t i;
  int64_t v19;
  unint64_t v20;
  int64_t v21;
  int64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  char v29;
  uint64_t *v30;
  uint64_t v31;
  BOOL v32;
  uint64_t v33;
  int64_t v34;
  uint64_t v35;
  int64_t v36;
  uint64_t v37;
  char v38[32];
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  __int128 v42;
  uint64_t v43;
  _OWORD v44[3];
  _OWORD v45[2];
  __int128 v46;
  _OWORD v47[2];

  v1 = a1;
  if (*(_QWORD *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_253F3D8E0);
    v2 = (_QWORD *)sub_21DBD2560();
  }
  else
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
  }
  v35 = v1 + 64;
  v3 = -1 << *(_BYTE *)(v1 + 32);
  if (-v3 < 64)
    v4 = ~(-1 << -(char)v3);
  else
    v4 = -1;
  v5 = v4 & *(_QWORD *)(v1 + 64);
  v34 = (unint64_t)(63 - v3) >> 6;
  v6 = v47;
  v7 = v45;
  v8 = &v41;
  v9 = &v43;
  result = swift_bridgeObjectRetain();
  v36 = 0;
  if (v5)
    goto LABEL_10;
LABEL_11:
  v19 = v36 + 1;
  if (__OFADD__(v36, 1))
    goto LABEL_35;
  if (v19 >= v34)
    goto LABEL_32;
  v20 = *(_QWORD *)(v35 + 8 * v19);
  v21 = v36 + 1;
  if (!v20)
  {
    v21 = v36 + 2;
    if (v36 + 2 >= v34)
      goto LABEL_32;
    v20 = *(_QWORD *)(v35 + 8 * v21);
    if (!v20)
    {
      v21 = v36 + 3;
      if (v36 + 3 >= v34)
        goto LABEL_32;
      v20 = *(_QWORD *)(v35 + 8 * v21);
      if (!v20)
      {
        v21 = v36 + 4;
        if (v36 + 4 >= v34)
          goto LABEL_32;
        v20 = *(_QWORD *)(v35 + 8 * v21);
        if (!v20)
        {
          v22 = v36 + 5;
          if (v36 + 5 < v34)
          {
            v20 = *(_QWORD *)(v35 + 8 * v22);
            if (v20)
            {
              v21 = v36 + 5;
              goto LABEL_26;
            }
            while (1)
            {
              v21 = v22 + 1;
              if (__OFADD__(v22, 1))
                goto LABEL_36;
              if (v21 >= v34)
                break;
              v20 = *(_QWORD *)(v35 + 8 * v21);
              ++v22;
              if (v20)
                goto LABEL_26;
            }
          }
LABEL_32:
          sub_21DBB3F7C();
          return (unint64_t)v2;
        }
      }
    }
  }
LABEL_26:
  v36 = v21;
  v37 = (v20 - 1) & v20;
  for (i = __clz(__rbit64(v20)) + (v21 << 6); ; i = __clz(__rbit64(v5)) | (v36 << 6))
  {
    v23 = (uint64_t *)(*(_QWORD *)(v1 + 48) + 16 * i);
    v25 = *v23;
    v24 = v23[1];
    sub_21DBB3F84(*(_QWORD *)(v1 + 56) + 32 * i, (uint64_t)v6);
    *(_QWORD *)&v46 = v25;
    *((_QWORD *)&v46 + 1) = v24;
    v44[2] = v46;
    v45[0] = v47[0];
    v45[1] = v47[1];
    v39 = v25;
    v40 = v24;
    sub_21DBB3FCC((uint64_t)v7, (uint64_t)v38);
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_253F3D900);
    swift_dynamicCast();
    v27 = v39;
    v26 = v40;
    sub_21DBB3F4C(v8, v9);
    sub_21DBB3F4C(v9, v44);
    sub_21DBB3F4C(v44, &v42);
    result = sub_21DBCF33C(v27, v26);
    v28 = result;
    if ((v29 & 1) != 0)
    {
      v11 = v9;
      v12 = v8;
      v13 = v1;
      v14 = v7;
      v15 = v6;
      v16 = (uint64_t *)(v2[6] + 16 * result);
      swift_bridgeObjectRelease();
      *v16 = v27;
      v16[1] = v26;
      v6 = v15;
      v7 = v14;
      v1 = v13;
      v8 = v12;
      v9 = v11;
      v17 = (_OWORD *)(v2[7] + 32 * v28);
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v17);
      result = (unint64_t)sub_21DBB3F4C(&v42, v17);
      v5 = v37;
      if (!v37)
        goto LABEL_11;
      goto LABEL_10;
    }
    if (v2[2] >= v2[3])
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v30 = (uint64_t *)(v2[6] + 16 * result);
    *v30 = v27;
    v30[1] = v26;
    result = (unint64_t)sub_21DBB3F4C(&v42, (_OWORD *)(v2[7] + 32 * result));
    v31 = v2[2];
    v32 = __OFADD__(v31, 1);
    v33 = v31 + 1;
    if (v32)
      goto LABEL_34;
    v2[2] = v33;
    v5 = v37;
    if (!v37)
      goto LABEL_11;
LABEL_10:
    v37 = (v5 - 1) & v5;
  }
  __break(1u);
LABEL_34:
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
  return result;
}

unint64_t sub_21DBB2A5C(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t *v6;
  uint64_t *v7;
  unint64_t result;
  int64_t i;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  _OWORD *v18;
  unint64_t v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;
  int64_t v23;
  uint64_t *v24;
  unint64_t v25;
  char v26;
  uint64_t *v27;
  uint64_t v28;
  BOOL v29;
  uint64_t v30;
  int64_t v31;
  uint64_t v32;
  int64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  __int128 v38;
  uint64_t v39;
  _OWORD v40[2];

  v1 = a1;
  if (*(_QWORD *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_253F3D8E0);
    v2 = (_QWORD *)sub_21DBD2560();
  }
  else
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
  }
  v32 = v1 + 64;
  v3 = -1 << *(_BYTE *)(v1 + 32);
  if (-v3 < 64)
    v4 = ~(-1 << -(char)v3);
  else
    v4 = -1;
  v5 = v4 & *(_QWORD *)(v1 + 64);
  v31 = (unint64_t)(63 - v3) >> 6;
  v6 = &v37;
  v7 = &v39;
  result = swift_bridgeObjectRetain();
  i = 0;
  v10 = MEMORY[0x24BEE4AD8] + 8;
  v11 = MEMORY[0x24BEE13C8];
  if (v5)
    goto LABEL_10;
LABEL_11:
  v20 = i + 1;
  if (__OFADD__(i, 1))
    goto LABEL_35;
  if (v20 >= v31)
    goto LABEL_32;
  v21 = *(_QWORD *)(v32 + 8 * v20);
  v22 = i + 1;
  if (!v21)
  {
    v22 = i + 2;
    if (i + 2 >= v31)
      goto LABEL_32;
    v21 = *(_QWORD *)(v32 + 8 * v22);
    if (!v21)
    {
      v22 = i + 3;
      if (i + 3 >= v31)
        goto LABEL_32;
      v21 = *(_QWORD *)(v32 + 8 * v22);
      if (!v21)
      {
        v22 = i + 4;
        if (i + 4 >= v31)
          goto LABEL_32;
        v21 = *(_QWORD *)(v32 + 8 * v22);
        if (!v21)
        {
          v23 = i + 5;
          if (i + 5 < v31)
          {
            v21 = *(_QWORD *)(v32 + 8 * v23);
            if (v21)
            {
              v22 = i + 5;
              goto LABEL_26;
            }
            while (1)
            {
              v22 = v23 + 1;
              if (__OFADD__(v23, 1))
                goto LABEL_36;
              if (v22 >= v31)
                break;
              v21 = *(_QWORD *)(v32 + 8 * v22);
              ++v23;
              if (v21)
                goto LABEL_26;
            }
          }
LABEL_32:
          sub_21DBB3F7C();
          return (unint64_t)v2;
        }
      }
    }
  }
LABEL_26:
  v34 = (v21 - 1) & v21;
  v19 = __clz(__rbit64(v21)) + (v22 << 6);
  for (i = v22; ; v19 = __clz(__rbit64(v5)) | (i << 6))
  {
    v24 = (uint64_t *)(*(_QWORD *)(v1 + 48) + 16 * v19);
    v35 = *v24;
    v36 = v24[1];
    swift_bridgeObjectRetain();
    swift_dynamicCast();
    sub_21DBB3F4C(v6, v7);
    sub_21DBB3F4C(v7, v40);
    sub_21DBB3F4C(v40, &v38);
    result = sub_21DBCF33C(v35, v36);
    v25 = result;
    if ((v26 & 1) != 0)
    {
      v33 = i;
      v12 = v7;
      v13 = v6;
      v14 = v1;
      v15 = v11;
      v16 = v10;
      v17 = (uint64_t *)(v2[6] + 16 * result);
      swift_bridgeObjectRelease();
      *v17 = v35;
      v17[1] = v36;
      v10 = v16;
      v11 = v15;
      v1 = v14;
      v6 = v13;
      v7 = v12;
      i = v33;
      v18 = (_OWORD *)(v2[7] + 32 * v25);
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v18);
      result = (unint64_t)sub_21DBB3F4C(&v38, v18);
      v5 = v34;
      if (!v34)
        goto LABEL_11;
      goto LABEL_10;
    }
    if (v2[2] >= v2[3])
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v27 = (uint64_t *)(v2[6] + 16 * result);
    *v27 = v35;
    v27[1] = v36;
    result = (unint64_t)sub_21DBB3F4C(&v38, (_OWORD *)(v2[7] + 32 * result));
    v28 = v2[2];
    v29 = __OFADD__(v28, 1);
    v30 = v28 + 1;
    if (v29)
      goto LABEL_34;
    v2[2] = v30;
    v5 = v34;
    if (!v34)
      goto LABEL_11;
LABEL_10:
    v34 = (v5 - 1) & v5;
  }
  __break(1u);
LABEL_34:
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
  return result;
}

uint64_t sub_21DBB2DB4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t result;
  int64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  int64_t v15;
  int64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  char v23;
  unint64_t v24;
  BOOL v25;
  uint64_t v26;
  int64_t v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;
  _OWORD v32[2];
  __int128 v33;
  __int128 v34;
  uint64_t v35;
  _OWORD v36[2];
  _OWORD v37[3];
  _OWORD v38[2];
  __int128 v39;
  _OWORD v40[2];

  if (*(_QWORD *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2553A4308);
    v2 = sub_21DBD2560();
  }
  else
  {
    v2 = MEMORY[0x24BEE4B00];
  }
  v28 = a1 + 64;
  v3 = -1 << *(_BYTE *)(a1 + 32);
  if (-v3 < 64)
    v4 = ~(-1 << -(char)v3);
  else
    v4 = -1;
  v5 = v4 & *(_QWORD *)(a1 + 64);
  v27 = (unint64_t)(63 - v3) >> 6;
  v6 = v2 + 64;
  swift_bridgeObjectRetain();
  result = swift_retain();
  v8 = 0;
  while (1)
  {
    if (v5)
    {
      v11 = __clz(__rbit64(v5));
      v5 &= v5 - 1;
      v12 = v11 | (v8 << 6);
      goto LABEL_28;
    }
    v13 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    if (v13 >= v27)
      goto LABEL_37;
    v14 = *(_QWORD *)(v28 + 8 * v13);
    v15 = v8 + 1;
    if (!v14)
    {
      v15 = v8 + 2;
      if (v8 + 2 >= v27)
        goto LABEL_37;
      v14 = *(_QWORD *)(v28 + 8 * v15);
      if (!v14)
      {
        v15 = v8 + 3;
        if (v8 + 3 >= v27)
          goto LABEL_37;
        v14 = *(_QWORD *)(v28 + 8 * v15);
        if (!v14)
        {
          v15 = v8 + 4;
          if (v8 + 4 >= v27)
            goto LABEL_37;
          v14 = *(_QWORD *)(v28 + 8 * v15);
          if (!v14)
            break;
        }
      }
    }
LABEL_27:
    v5 = (v14 - 1) & v14;
    v12 = __clz(__rbit64(v14)) + (v15 << 6);
    v8 = v15;
LABEL_28:
    v17 = (uint64_t *)(*(_QWORD *)(a1 + 48) + 16 * v12);
    v19 = *v17;
    v18 = v17[1];
    sub_21DBB4014(*(_QWORD *)(a1 + 56) + 32 * v12, (uint64_t)v40);
    *(_QWORD *)&v39 = v19;
    *((_QWORD *)&v39 + 1) = v18;
    v37[2] = v39;
    v38[0] = v40[0];
    v38[1] = v40[1];
    *(_QWORD *)&v37[0] = v19;
    *((_QWORD *)&v37[0] + 1) = v18;
    swift_bridgeObjectRetain();
    swift_dynamicCast();
    sub_21DBB3F4C(v38, v32);
    v33 = v29;
    v34 = v30;
    v35 = v31;
    sub_21DBB3F4C(v32, v36);
    v29 = v33;
    v30 = v34;
    v31 = v35;
    sub_21DBB3F4C(v36, v37);
    sub_21DBB3F4C(v37, &v33);
    result = sub_21DBD24F4();
    v20 = -1 << *(_BYTE *)(v2 + 32);
    v21 = result & ~v20;
    v22 = v21 >> 6;
    if (((-1 << v21) & ~*(_QWORD *)(v6 + 8 * (v21 >> 6))) != 0)
    {
      v9 = __clz(__rbit64((-1 << v21) & ~*(_QWORD *)(v6 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v23 = 0;
      v24 = (unint64_t)(63 - v20) >> 6;
      do
      {
        if (++v22 == v24 && (v23 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        v25 = v22 == v24;
        if (v22 == v24)
          v22 = 0;
        v23 |= v25;
        v26 = *(_QWORD *)(v6 + 8 * v22);
      }
      while (v26 == -1);
      v9 = __clz(__rbit64(~v26)) + (v22 << 6);
    }
    *(_QWORD *)(v6 + ((v9 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v9;
    v10 = *(_QWORD *)(v2 + 48) + 40 * v9;
    *(_OWORD *)v10 = v29;
    *(_OWORD *)(v10 + 16) = v30;
    *(_QWORD *)(v10 + 32) = v31;
    result = (uint64_t)sub_21DBB3F4C(&v33, (_OWORD *)(*(_QWORD *)(v2 + 56) + 32 * v9));
    ++*(_QWORD *)(v2 + 16);
  }
  v16 = v8 + 5;
  if (v8 + 5 >= v27)
  {
LABEL_37:
    swift_release();
    sub_21DBB3F7C();
    return v2;
  }
  v14 = *(_QWORD *)(v28 + 8 * v16);
  if (v14)
  {
    v15 = v8 + 5;
    goto LABEL_27;
  }
  while (1)
  {
    v15 = v16 + 1;
    if (__OFADD__(v16, 1))
      break;
    if (v15 >= v27)
      goto LABEL_37;
    v14 = *(_QWORD *)(v28 + 8 * v15);
    ++v16;
    if (v14)
      goto LABEL_27;
  }
LABEL_39:
  __break(1u);
  return result;
}

void AudioAnalyticsSendMessage(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  AudioAnalyticsSendMessage(_:_:_:_:)(a1);

}

void AudioAnalyticsSendMessage(_:_:_:_:)(uint64_t a1)
{
  uint64_t v2;
  os_log_type_t v3;
  uint8_t *v4;
  NSObject *oslog;
  uint64_t aBlock;

  if (qword_253F3DA10 != -1)
    swift_once();
  if (qword_253F3DC38 != a1)
  {
    aBlock = 0;
    __swift_instantiateConcreteTypeFromMangledName(&qword_253F3D900);
    sub_21DBD2398();
    if (qword_253F3DA18 != -1)
      swift_once();
    v2 = sub_21DBD2320();
    __swift_project_value_buffer(v2, (uint64_t)qword_253F3DC78);
    oslog = sub_21DBD2308();
    v3 = sub_21DBD2440();
    if (os_log_type_enabled(oslog, v3))
    {
      v4 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)v4 = 134217984;
      aBlock = a1;
      sub_21DBD24AC();
      _os_log_impl(&dword_21DBAF000, oslog, v3, "Discarding message with at least one nil entry. { reporterID=%lld }", v4, 0xCu);
      MEMORY[0x22079B7C0](v4, -1, -1);

    }
    else
    {

    }
  }
}

void AudioAnalyticsSendSessionlessMessage(void *a1)
{
  id v1;

  v1 = a1;
  AudioAnalyticsSendSessionlessMessage(_:_:_:)();

}

void AudioAnalyticsSendSessionlessMessage(_:_:_:)()
{
  uint64_t v0;
  os_log_type_t v1;
  uint8_t *v2;
  NSObject *oslog;
  uint64_t aBlock;

  aBlock = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_253F3D900);
  sub_21DBD2398();
  if (qword_253F3DA18 != -1)
    swift_once();
  v0 = sub_21DBD2320();
  __swift_project_value_buffer(v0, (uint64_t)qword_253F3DC78);
  oslog = sub_21DBD2308();
  v1 = sub_21DBD2440();
  if (os_log_type_enabled(oslog, v1))
  {
    v2 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_21DBAF000, oslog, v1, "Discarding message with at least one nil entry.", v2, 2u);
    MEMORY[0x22079B7C0](v2, -1, -1);
  }

}

Swift::Void __swiftcall AudioAnalyticsDestroyReporter(_:)(Swift::Int64 a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD v8[6];

  if (qword_253F3DA10 != -1)
    swift_once();
  if (qword_253F3DC38 != a1)
  {
    if (qword_253F3D9E0 != -1)
      swift_once();
    v2 = (void *)qword_253F3DC50;
    v3 = *(NSObject **)(qword_253F3DC50 + OBJC_IVAR____TtC14AudioAnalytics12ServerClient_serialQueue);
    v4 = swift_allocObject();
    *(_QWORD *)(v4 + 16) = v2;
    *(_QWORD *)(v4 + 24) = a1;
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = sub_21DBB3EB0;
    *(_QWORD *)(v5 + 24) = v4;
    v8[4] = sub_21DBB4064;
    v8[5] = v5;
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 1107296256;
    v8[2] = sub_21DBB3BEC;
    v8[3] = &block_descriptor_65;
    v6 = _Block_copy(v8);
    v7 = v2;
    swift_retain();
    swift_release();
    dispatch_sync(v3, v6);
    _Block_release(v6);
    LOBYTE(v3) = swift_isEscapingClosureAtFileLocation();

    swift_release();
    swift_release();
    if ((v3 & 1) != 0)
      __break(1u);
  }
}

uint64_t AudioAnalyticsRequestMessage(uint64_t a1, int a2, __int16 a3, void *aBlock)
{
  void *v7;
  uint64_t v8;

  v7 = _Block_copy(aBlock);
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = v7;
  AudioAnalyticsRequestMessage(_:_:_:_:)(a1, a2, a3, (uint64_t)sub_21DBB3EEC, v8);
  return swift_release();
}

uint64_t sub_21DBB39EC(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 16))(a2, a1);
}

uint64_t AudioAnalyticsRequestMessage(_:_:_:_:)(uint64_t result, int a2, __int16 a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  char isEscapingClosureAtFileLocation;
  _QWORD v17[6];

  v9 = result;
  if (qword_253F3DA10 != -1)
    result = swift_once();
  if (qword_253F3DC38 != v9)
  {
    if (qword_253F3D9E0 != -1)
      swift_once();
    v10 = (void *)qword_253F3DC50;
    v11 = *(NSObject **)(qword_253F3DC50 + OBJC_IVAR____TtC14AudioAnalytics12ServerClient_serialQueue);
    v12 = swift_allocObject();
    *(_QWORD *)(v12 + 16) = v10;
    *(_QWORD *)(v12 + 24) = v9;
    *(_QWORD *)(v12 + 32) = a4;
    *(_QWORD *)(v12 + 40) = a5;
    *(_DWORD *)(v12 + 48) = a2;
    *(_WORD *)(v12 + 52) = a3;
    v13 = swift_allocObject();
    *(_QWORD *)(v13 + 16) = sub_21DBB3F28;
    *(_QWORD *)(v13 + 24) = v12;
    v17[4] = sub_21DBB4064;
    v17[5] = v13;
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 1107296256;
    v17[2] = sub_21DBB3BEC;
    v17[3] = &block_descriptor_78;
    v14 = _Block_copy(v17);
    v15 = v10;
    swift_retain();
    swift_retain();
    swift_release();
    dispatch_sync(v11, v14);
    _Block_release(v14);
    isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();

    swift_release();
    result = swift_release();
    if ((isEscapingClosureAtFileLocation & 1) != 0)
      __break(1u);
  }
  return result;
}

uint64_t sub_21DBB3BCC(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_21DBB3BEC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

uint64_t sub_21DBB3C0C@<X0>(uint64_t *a1@<X8>)
{
  return sub_21DBC3628(a1);
}

uint64_t sub_21DBB3C24@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;

  return sub_21DBC36D8(*(_DWORD *)(v1 + 24), a1);
}

uint64_t sub_21DBB3C40()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_21DBB3C64()
{
  uint64_t v0;

  return sub_21DBC38B8(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

uint64_t sub_21DBB3C6C()
{
  return swift_deallocObject();
}

uint64_t sub_21DBB3C7C()
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

uint64_t sub_21DBB3CB4()
{
  uint64_t v0;

  return sub_21DBC3A48(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

uint64_t sub_21DBB3CBC()
{
  return swift_deallocObject();
}

uint64_t sub_21DBB3CCC@<X0>(__int16 *a1@<X8>)
{
  uint64_t v1;

  return sub_21DBC3AAC(*(_QWORD *)(v1 + 24), a1);
}

uint64_t sub_21DBB3CE4()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_21DBB3D08()
{
  uint64_t v0;

  return sub_21DBC3EEC(*(_QWORD *)(v0 + 16), *(unsigned __int16 *)(v0 + 24), *(_QWORD *)(v0 + 32));
}

uint64_t sub_21DBB3D18()
{
  return swift_deallocObject();
}

unint64_t sub_21DBB3D28@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;

  return sub_21DBC3F5C(*(_QWORD *)(v1 + 24), a1);
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x22079B700]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_21DBB3D80()
{
  return objectdestroy_27Tm();
}

uint64_t sub_21DBB3D88()
{
  uint64_t *v0;

  return sub_21DBC44A8(v0[2], v0[3], v0[4]);
}

uint64_t sub_21DBB3D94()
{
  return swift_deallocObject();
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t sub_21DBB3DBC(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

_BYTE **sub_21DBB3DF0(_BYTE **result, uint64_t a2, uint64_t a3, char a4)
{
  _BYTE *v4;

  v4 = *result;
  *v4 = a4;
  *result = v4 + 1;
  return result;
}

uint64_t sub_21DBB3E00()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

void sub_21DBB3E2C()
{
  uint64_t v0;

  sub_21DBC4694(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32), *(_DWORD *)(v0 + 40), *(unsigned __int16 *)(v0 + 44));
}

uint64_t sub_21DBB3E40()
{
  return swift_deallocObject();
}

uint64_t sub_21DBB3E50()
{
  return objectdestroy_27Tm();
}

uint64_t objectdestroy_27Tm()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

void sub_21DBB3E90()
{
  uint64_t v0;

  sub_21DBC4898(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(_DWORD *)(v0 + 32), *(unsigned __int16 *)(v0 + 36));
}

uint64_t sub_21DBB3EA0()
{
  return swift_deallocObject();
}

uint64_t sub_21DBB3EB0()
{
  uint64_t v0;

  return sub_21DBC4A78(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

uint64_t sub_21DBB3EB8()
{
  return swift_deallocObject();
}

uint64_t sub_21DBB3EC8()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

uint64_t sub_21DBB3EEC()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 16) + 16))();
}

uint64_t sub_21DBB3EFC()
{
  uint64_t v0;

  swift_release();
  return swift_deallocObject();
}

uint64_t sub_21DBB3F28()
{
  uint64_t v0;

  return sub_21DBC4C34(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(uint64_t (**)(_QWORD))(v0 + 32), *(_QWORD *)(v0 + 40), *(unsigned int *)(v0 + 48), *(_WORD *)(v0 + 52));
}

uint64_t sub_21DBB3F3C()
{
  return swift_deallocObject();
}

_OWORD *sub_21DBB3F4C(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
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

uint64_t sub_21DBB3F7C()
{
  return swift_release();
}

uint64_t sub_21DBB3F84(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F3D900);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_21DBB3FCC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F3D900);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_21DBB4014(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_21DBB4050@<X0>(uint64_t *a1@<X8>)
{
  return sub_21DBB3C0C(a1);
}

uint64_t sub_21DBB40A8@<X0>(uint64_t *a1@<X8>)
{
  return sub_21DBB3C24(a1);
}

id AudioAnalyticsReporter.init(newReporterID:)()
{
  return sub_21DBB526C((SEL *)&selRef_initWithNewReporterID);
}

{
  void *v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  char *v4;
  id v5;
  id v6;
  objc_super v8;
  uint64_t v9;

  v1 = qword_253F3D9E0;
  v2 = v0;
  v4 = v2;
  if (v1 != -1)
    v2 = (char *)swift_once();
  MEMORY[0x24BDAC7A8](v2, v3);
  v6 = v5;
  sub_21DBD247C();

  *(_QWORD *)&v4[OBJC_IVAR___AudioAnalyticsReporter_reporterID] = v9;
  v8.receiver = v4;
  v8.super_class = (Class)AudioAnalyticsReporter;
  return objc_msgSendSuper2(&v8, sel_init);
}

void __swiftcall AudioAnalyticsReporter.init(reporterID:)(AudioAnalyticsReporter *__return_ptr retstr, Swift::Int64 reporterID)
{
  objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithReporterID_, reporterID);
}

id AudioAnalyticsReporter.init(reporterID:)(uint64_t a1)
{
  uint64_t v1;
  objc_super v3;

  *(_QWORD *)(v1 + OBJC_IVAR___AudioAnalyticsReporter_reporterID) = a1;
  v3.super_class = (Class)AudioAnalyticsReporter;
  return objc_msgSendSuper2(&v3, sel_init);
}

id AudioAnalyticsReporter.init(sessionID:serviceType:)(uint64_t a1, unsigned __int16 a2)
{
  return objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithSessionID_serviceType_, a1, a2);
}

id AudioAnalyticsReporter.init(sessionID:serviceType:)(uint64_t a1, __int16 a2)
{
  void *v2;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  id result;
  objc_super v18;
  _QWORD aBlock[7];

  v4 = qword_253F3D9E0;
  v5 = v2;
  v7 = v5;
  if (v4 != -1)
    v5 = (char *)swift_once();
  MEMORY[0x24BDAC7A8](v5, v6);
  v9 = v8;
  sub_21DBD247C();

  v10 = aBlock[0];
  *(_QWORD *)&v7[OBJC_IVAR___AudioAnalyticsReporter_reporterID] = aBlock[0];
  v11 = (void *)qword_253F3DC50;
  v12 = *(NSObject **)(qword_253F3DC50 + OBJC_IVAR____TtC14AudioAnalytics12ServerClient_serialQueue);
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = v11;
  *(_WORD *)(v13 + 24) = a2;
  *(_QWORD *)(v13 + 32) = v10;
  v14 = swift_allocObject();
  *(_QWORD *)(v14 + 16) = sub_21DBB3D08;
  *(_QWORD *)(v14 + 24) = v13;
  aBlock[4] = sub_21DBB66FC;
  aBlock[5] = v14;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_21DBB3BEC;
  aBlock[3] = &block_descriptor_0;
  v15 = _Block_copy(aBlock);
  v16 = v11;
  swift_retain();
  swift_release();
  dispatch_sync(v12, v15);
  _Block_release(v15);
  LOBYTE(v15) = swift_isEscapingClosureAtFileLocation();

  swift_release();
  result = (id)swift_release();
  if ((v15 & 1) != 0)
  {
    __break(1u);
  }
  else
  {
    v18.receiver = v7;
    v18.super_class = (Class)AudioAnalyticsReporter;
    return objc_msgSendSuper2(&v18, sel_init);
  }
  return result;
}

id sub_21DBB4520()
{
  char *v0;
  char *v1;
  char *v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  char *v8;
  id result;
  _QWORD aBlock[6];
  objc_super v11;

  if (!sub_21DBB46E4(0x74696E696564, 0xE600000000000000))
    goto LABEL_5;
  if (qword_253F3D9E0 != -1)
    swift_once();
  v1 = (char *)qword_253F3DC50;
  v2 = &v0[OBJC_IVAR___AudioAnalyticsReporter_reporterID];
  swift_beginAccess();
  v3 = *(_QWORD *)v2;
  v4 = *(NSObject **)&v1[OBJC_IVAR____TtC14AudioAnalytics12ServerClient_serialQueue];
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v1;
  *(_QWORD *)(v5 + 24) = v3;
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = sub_21DBB3EB0;
  *(_QWORD *)(v6 + 24) = v5;
  aBlock[4] = sub_21DBB6BD4;
  aBlock[5] = v6;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_21DBB3BEC;
  aBlock[3] = &block_descriptor_81;
  v7 = _Block_copy(aBlock);
  v8 = v1;
  swift_retain();
  swift_release();
  dispatch_sync(v4, v7);
  _Block_release(v7);
  LOBYTE(v4) = swift_isEscapingClosureAtFileLocation();

  swift_release();
  result = (id)swift_release();
  if ((v4 & 1) != 0)
  {
    __break(1u);
  }
  else
  {
LABEL_5:
    v11.receiver = v0;
    v11.super_class = (Class)AudioAnalyticsReporter;
    return objc_msgSendSuper2(&v11, sel_dealloc);
  }
  return result;
}

BOOL sub_21DBB46E4(uint64_t a1, unint64_t a2)
{
  void *v2;
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  NSObject *v9;
  os_log_type_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;
  uint64_t v15;

  v5 = objc_msgSend(v2, sel_reporterID);
  if (qword_253F3DA10 != -1)
    swift_once();
  v6 = qword_253F3DC38;
  if (v5 == (id)qword_253F3DC38)
  {
    if (qword_253F3DA18 != -1)
      swift_once();
    v7 = sub_21DBD2320();
    __swift_project_value_buffer(v7, (uint64_t)qword_253F3DC78);
    swift_bridgeObjectRetain_n();
    v8 = v2;
    v9 = sub_21DBD2308();
    v10 = sub_21DBD2440();
    if (os_log_type_enabled(v9, v10))
    {
      v11 = swift_slowAlloc();
      v12 = swift_slowAlloc();
      v15 = v12;
      *(_DWORD *)v11 = 136380931;
      swift_bridgeObjectRetain();
      v14 = sub_21DBCECA4(a1, a2, &v15);
      sub_21DBD24AC();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v11 + 12) = 2048;
      objc_msgSend(v8, sel_reporterID, v14, v15);

      sub_21DBD24AC();
      _os_log_impl(&dword_21DBAF000, v9, v10, "CAReporterID is invalid. Returning early. { function=%{private}s, reporterID=%lld }", (uint8_t *)v11, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x22079B7C0](v12, -1, -1);
      MEMORY[0x22079B7C0](v11, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
  return v5 != (id)v6;
}

uint64_t AudioAnalyticsReporter.reporterID.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___AudioAnalyticsReporter_reporterID;
  swift_beginAccess();
  return *(_QWORD *)v1;
}

uint64_t AudioAnalyticsReporter.reporterID.setter(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t result;

  v3 = (_QWORD *)(v1 + OBJC_IVAR___AudioAnalyticsReporter_reporterID);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t AudioAnalyticsReporter.serviceType.getter()
{
  void *v0;
  id v1;
  id v2;
  uint64_t v3;
  unsigned __int16 v5;

  if (qword_253F3D9E0 != -1)
    swift_once();
  v1 = (id)qword_253F3DC50;
  v2 = objc_msgSend(v0, sel_reporterID);
  MEMORY[0x24BDAC7A8](v2, v3);
  type metadata accessor for AudioServiceType(0);
  sub_21DBD247C();

  return v5;
}

uint64_t AudioAnalyticsReporter.configuration.getter()
{
  void *v0;
  id v1;
  id v2;
  uint64_t v3;
  uint64_t v5;

  if (qword_253F3D9E0 != -1)
    swift_once();
  v1 = (id)qword_253F3DC50;
  v2 = objc_msgSend(v0, sel_reporterID);
  MEMORY[0x24BDAC7A8](v2, v3);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2553A4300);
  sub_21DBD247C();

  return v5;
}

void AudioAnalyticsReporter.configuration.setter(uint64_t a1)
{
  _QWORD *v1;
  SEL *v3;
  unint64_t v4;
  uint64_t v5;
  char *v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  _QWORD *v15;
  _QWORD aBlock[6];

  if (!sub_21DBB46E4(0x72756769666E6F63, 0xED00006E6F697461))
  {
    swift_bridgeObjectRelease();
    return;
  }
  v3 = (SEL *)&selRef_post_arg1_arg2_arg3_arg4_;
  objc_msgSend(v1, sel_reporterID);
  v4 = sub_21DBB5DA4(a1);
  if (v4)
  {
    v5 = v4;
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = sub_21DBB6508(0x72756769666E6F63, 0xED00006E6F697461);
    swift_bridgeObjectRelease();
    if (!v5)
      return;
  }
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_11;
  if (qword_253F3D9E0 != -1)
    swift_once();
  v6 = (char *)(id)qword_253F3DC50;
  v7 = objc_msgSend(v1, sel_reporterID);
  v8 = *(NSObject **)&v6[OBJC_IVAR____TtC14AudioAnalytics12ServerClient_serialQueue];
  v1 = (_QWORD *)swift_allocObject();
  v1[2] = v6;
  v1[3] = v5;
  v1[4] = v7;
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = sub_21DBB3D88;
  *(_QWORD *)(v9 + 24) = v1;
  aBlock[4] = sub_21DBB6BD4;
  aBlock[5] = v9;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_21DBB3BEC;
  aBlock[3] = &block_descriptor_13;
  v3 = (SEL *)_Block_copy(aBlock);
  v10 = v6;
  swift_bridgeObjectRetain();
  swift_retain();
  swift_release();
  dispatch_sync(v8, v3);
  _Block_release(v3);
  LOBYTE(v8) = swift_isEscapingClosureAtFileLocation();
  swift_bridgeObjectRelease();

  swift_release();
  swift_release();
  if ((v8 & 1) != 0)
  {
    __break(1u);
LABEL_11:
    swift_bridgeObjectRelease();
    if (qword_253F3DA18 != -1)
      swift_once();
    v11 = sub_21DBD2320();
    __swift_project_value_buffer(v11, (uint64_t)qword_253F3DC78);
    v15 = v1;
    v12 = sub_21DBD2308();
    v13 = sub_21DBD2440();
    if (os_log_type_enabled(v12, v13))
    {
      v14 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)v14 = 134217984;
      aBlock[0] = objc_msgSend(v15, v3[25]);
      sub_21DBD24AC();

      _os_log_impl(&dword_21DBAF000, v12, v13, "Configuration empty. Returning early. { reporterID=%lld }", v14, 0xCu);
      MEMORY[0x22079B7C0](v14, -1, -1);

    }
    else
    {

    }
  }
}

void sub_21DBB51F4(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v3;
  uint64_t v4;

  v3 = objc_msgSend(*a1, sel_configuration);
  v4 = sub_21DBD23A4();

  *a2 = v4;
}

void __swiftcall AudioAnalyticsReporter.init()(AudioAnalyticsReporter *__return_ptr retstr)
{
  sub_21DBB526C((SEL *)&selRef_init);
}

id sub_21DBB526C(SEL *a1)
{
  return objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), *a1);
}

void AudioAnalyticsReporter.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t AudioAnalyticsReporter.set(serviceType:)(__int16 a1)
{
  void *v1;
  uint64_t result;
  char *v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  char *v10;
  _QWORD v11[6];

  result = sub_21DBB46E4(0xD000000000000011, 0x800000021DBD4A00);
  if ((result & 1) != 0)
  {
    if (qword_253F3D9E0 != -1)
      swift_once();
    v4 = (char *)(id)qword_253F3DC50;
    v5 = objc_msgSend(v1, sel_reporterID);
    v6 = *(NSObject **)&v4[OBJC_IVAR____TtC14AudioAnalytics12ServerClient_serialQueue];
    v7 = swift_allocObject();
    *(_QWORD *)(v7 + 16) = v4;
    *(_WORD *)(v7 + 24) = a1;
    *(_QWORD *)(v7 + 32) = v5;
    v8 = swift_allocObject();
    *(_QWORD *)(v8 + 16) = sub_21DBB6C4C;
    *(_QWORD *)(v8 + 24) = v7;
    v11[4] = sub_21DBB6BD4;
    v11[5] = v8;
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 1107296256;
    v11[2] = sub_21DBB3BEC;
    v11[3] = &block_descriptor_24;
    v9 = _Block_copy(v11);
    v10 = v4;
    swift_retain();
    swift_release();
    dispatch_sync(v6, v9);
    _Block_release(v9);
    LOBYTE(v9) = swift_isEscapingClosureAtFileLocation();

    swift_release();
    result = swift_release();
    if ((v9 & 1) != 0)
      __break(1u);
  }
  return result;
}

Swift::Void __swiftcall AudioAnalyticsReporter.start()()
{
  void *v0;
  char *v1;
  id v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  char *v7;
  _QWORD v8[6];

  if (sub_21DBB46E4(0x29287472617473, 0xE700000000000000))
  {
    if (qword_253F3D9E0 != -1)
      swift_once();
    v1 = (char *)(id)qword_253F3DC50;
    v2 = objc_msgSend(v0, sel_reporterID);
    v3 = *(NSObject **)&v1[OBJC_IVAR____TtC14AudioAnalytics12ServerClient_serialQueue];
    v4 = swift_allocObject();
    *(_QWORD *)(v4 + 16) = v1;
    *(_QWORD *)(v4 + 24) = v2;
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = sub_21DBB3C64;
    *(_QWORD *)(v5 + 24) = v4;
    v8[4] = sub_21DBB6BD4;
    v8[5] = v5;
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 1107296256;
    v8[2] = sub_21DBB3BEC;
    v8[3] = &block_descriptor_34;
    v6 = _Block_copy(v8);
    v7 = v1;
    swift_retain();
    swift_release();
    dispatch_sync(v3, v6);
    _Block_release(v6);
    LOBYTE(v3) = swift_isEscapingClosureAtFileLocation();

    swift_release();
    swift_release();
    if ((v3 & 1) != 0)
      __break(1u);
  }
}

Swift::Void __swiftcall AudioAnalyticsReporter.stop()()
{
  void *v0;
  char *v1;
  id v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  char *v7;
  _QWORD v8[6];

  if (sub_21DBB46E4(0x2928706F7473, 0xE600000000000000))
  {
    if (qword_253F3D9E0 != -1)
      swift_once();
    v1 = (char *)(id)qword_253F3DC50;
    v2 = objc_msgSend(v0, sel_reporterID);
    v3 = *(NSObject **)&v1[OBJC_IVAR____TtC14AudioAnalytics12ServerClient_serialQueue];
    v4 = swift_allocObject();
    *(_QWORD *)(v4 + 16) = v1;
    *(_QWORD *)(v4 + 24) = v2;
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = sub_21DBB3CB4;
    *(_QWORD *)(v5 + 24) = v4;
    v8[4] = sub_21DBB6BD4;
    v8[5] = v5;
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 1107296256;
    v8[2] = sub_21DBB3BEC;
    v8[3] = &block_descriptor_44;
    v6 = _Block_copy(v8);
    v7 = v1;
    swift_retain();
    swift_release();
    dispatch_sync(v3, v6);
    _Block_release(v6);
    LOBYTE(v3) = swift_isEscapingClosureAtFileLocation();

    swift_release();
    swift_release();
    if ((v3 & 1) != 0)
      __break(1u);
  }
}

uint64_t AudioAnalyticsReporter.sendMessage(_:category:type:)(uint64_t a1, int a2, __int16 a3)
{
  void *v3;
  uint64_t result;
  unint64_t v8;
  char *v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  char *v15;
  _QWORD v16[6];

  result = sub_21DBB46E4(0xD00000000000001DLL, 0x800000021DBD4A20);
  if ((result & 1) != 0)
  {
    objc_msgSend(v3, sel_reporterID);
    v8 = sub_21DBB5DA4(a1);
    if (v8 || (result = sub_21DBB6508(0xD00000000000001DLL, 0x800000021DBD4A20), (v8 = result) != 0))
    {
      if (qword_253F3D9E0 != -1)
        swift_once();
      v9 = (char *)(id)qword_253F3DC50;
      v10 = objc_msgSend(v3, sel_reporterID);
      v11 = *(NSObject **)&v9[OBJC_IVAR____TtC14AudioAnalytics12ServerClient_serialQueue];
      v12 = swift_allocObject();
      *(_QWORD *)(v12 + 16) = v9;
      *(_QWORD *)(v12 + 24) = v10;
      *(_QWORD *)(v12 + 32) = v8;
      *(_DWORD *)(v12 + 40) = a2;
      *(_WORD *)(v12 + 44) = a3;
      v13 = swift_allocObject();
      *(_QWORD *)(v13 + 16) = sub_21DBB3E2C;
      *(_QWORD *)(v13 + 24) = v12;
      v16[4] = sub_21DBB6BD4;
      v16[5] = v13;
      v16[0] = MEMORY[0x24BDAC760];
      v16[1] = 1107296256;
      v16[2] = sub_21DBB3BEC;
      v16[3] = &block_descriptor_54;
      v14 = _Block_copy(v16);
      v15 = v9;
      swift_bridgeObjectRetain();
      swift_retain();
      swift_release();
      dispatch_sync(v11, v14);
      _Block_release(v14);
      LOBYTE(v14) = swift_isEscapingClosureAtFileLocation();
      swift_bridgeObjectRelease();

      swift_release();
      result = swift_release();
      if ((v14 & 1) != 0)
        __break(1u);
    }
  }
  return result;
}

uint64_t AudioAnalyticsReporter.requestMessage(for:type:callback:)(int a1, __int16 a2, uint64_t a3, uint64_t a4)
{
  void *v4;
  uint64_t result;
  char *v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  char *v16;
  char isEscapingClosureAtFileLocation;
  _QWORD v18[6];

  result = sub_21DBB46E4(0xD000000000000022, 0x800000021DBD4A40);
  if ((result & 1) != 0)
  {
    if (qword_253F3D9E0 != -1)
      swift_once();
    v10 = (char *)(id)qword_253F3DC50;
    v11 = objc_msgSend(v4, sel_reporterID);
    v12 = *(NSObject **)&v10[OBJC_IVAR____TtC14AudioAnalytics12ServerClient_serialQueue];
    v13 = swift_allocObject();
    *(_QWORD *)(v13 + 16) = v10;
    *(_QWORD *)(v13 + 24) = v11;
    *(_QWORD *)(v13 + 32) = a3;
    *(_QWORD *)(v13 + 40) = a4;
    *(_DWORD *)(v13 + 48) = a1;
    *(_WORD *)(v13 + 52) = a2;
    v14 = swift_allocObject();
    *(_QWORD *)(v14 + 16) = sub_21DBB3F28;
    *(_QWORD *)(v14 + 24) = v13;
    v18[4] = sub_21DBB6BD4;
    v18[5] = v14;
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 1107296256;
    v18[2] = sub_21DBB3BEC;
    v18[3] = &block_descriptor_64;
    v15 = _Block_copy(v18);
    v16 = v10;
    swift_retain();
    swift_retain();
    swift_release();
    dispatch_sync(v12, v15);
    _Block_release(v15);
    isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();

    swift_release();
    result = swift_release();
    if ((isEscapingClosureAtFileLocation & 1) != 0)
      __break(1u);
  }
  return result;
}

unint64_t sub_21DBB5DA4(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t result;
  int64_t v7;
  _OWORD *v8;
  _OWORD *v9;
  uint64_t v10;
  unint64_t v11;
  int64_t v12;
  int64_t v13;
  unint64_t v14;
  int64_t v15;
  __int128 v16;
  unint64_t v17;
  char v18;
  uint64_t v19;
  BOOL v20;
  uint64_t v21;
  int64_t v22;
  uint64_t v23;
  __int128 v24;
  _OWORD v25[2];
  _OWORD v26[2];
  __int128 v27;
  _OWORD v28[2];
  _OWORD v29[2];
  _OWORD v30[2];
  _OWORD v31[2];
  uint64_t v32;
  _OWORD v33[2];
  _OWORD v34[2];
  uint64_t v35;

  if (*(_QWORD *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_253F3D8E0);
    v2 = (_QWORD *)sub_21DBD2560();
  }
  else
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
  }
  v23 = a1 + 64;
  v3 = -1;
  v4 = -1 << *(_BYTE *)(a1 + 32);
  if (-v4 < 64)
    v3 = ~(-1 << -(char)v4);
  v5 = v3 & *(_QWORD *)(a1 + 64);
  v22 = (unint64_t)(63 - v4) >> 6;
  result = swift_bridgeObjectRetain();
  v7 = 0;
  while (1)
  {
    if (v5)
    {
      v10 = (v5 - 1) & v5;
      v11 = __clz(__rbit64(v5)) | (v7 << 6);
      v12 = v7;
    }
    else
    {
      v13 = v7 + 1;
      if (__OFADD__(v7, 1))
        goto LABEL_37;
      if (v13 >= v22)
      {
LABEL_33:
        sub_21DBB3F7C();
        return (unint64_t)v2;
      }
      v14 = *(_QWORD *)(v23 + 8 * v13);
      v12 = v7 + 1;
      if (!v14)
      {
        v12 = v7 + 2;
        if (v7 + 2 >= v22)
          goto LABEL_33;
        v14 = *(_QWORD *)(v23 + 8 * v12);
        if (!v14)
        {
          v12 = v7 + 3;
          if (v7 + 3 >= v22)
            goto LABEL_33;
          v14 = *(_QWORD *)(v23 + 8 * v12);
          if (!v14)
          {
            v12 = v7 + 4;
            if (v7 + 4 >= v22)
              goto LABEL_33;
            v14 = *(_QWORD *)(v23 + 8 * v12);
            if (!v14)
            {
              v15 = v7 + 5;
              if (v7 + 5 >= v22)
                goto LABEL_33;
              v14 = *(_QWORD *)(v23 + 8 * v15);
              if (!v14)
              {
                while (1)
                {
                  v12 = v15 + 1;
                  if (__OFADD__(v15, 1))
                    goto LABEL_38;
                  if (v12 >= v22)
                    goto LABEL_33;
                  v14 = *(_QWORD *)(v23 + 8 * v12);
                  ++v15;
                  if (v14)
                    goto LABEL_26;
                }
              }
              v12 = v7 + 5;
            }
          }
        }
      }
LABEL_26:
      v10 = (v14 - 1) & v14;
      v11 = __clz(__rbit64(v14)) + (v12 << 6);
    }
    sub_21DBB6B5C(*(_QWORD *)(a1 + 48) + 40 * v11, (uint64_t)v33);
    sub_21DBB4014(*(_QWORD *)(a1 + 56) + 32 * v11, (uint64_t)v34 + 8);
    v31[0] = v34[0];
    v31[1] = v34[1];
    v32 = v35;
    v30[0] = v33[0];
    v30[1] = v33[1];
    sub_21DBB6B5C((uint64_t)v30, (uint64_t)v25);
    if (!swift_dynamicCast())
    {
      sub_21DBB6B98((uint64_t)v30, &qword_253F3D828);
      swift_bridgeObjectRelease();
      sub_21DBB3F7C();
      swift_release();
      return 0;
    }
    sub_21DBB4014((uint64_t)v31 + 8, (uint64_t)v25);
    sub_21DBB6B98((uint64_t)v30, &qword_253F3D828);
    sub_21DBB3F4C(v25, v26);
    v27 = v24;
    sub_21DBB3F4C(v26, v28);
    v16 = v27;
    sub_21DBB3F4C(v28, v29);
    sub_21DBB3F4C(v29, &v27);
    result = sub_21DBCF33C(v16, *((uint64_t *)&v16 + 1));
    v17 = result;
    if ((v18 & 1) != 0)
    {
      v8 = (_OWORD *)(v2[6] + 16 * result);
      swift_bridgeObjectRelease();
      *v8 = v16;
      v9 = (_OWORD *)(v2[7] + 32 * v17);
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v9);
      result = (unint64_t)sub_21DBB3F4C(&v27, v9);
      goto LABEL_8;
    }
    if (v2[2] >= v2[3])
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    *(_OWORD *)(v2[6] + 16 * result) = v16;
    result = (unint64_t)sub_21DBB3F4C(&v27, (_OWORD *)(v2[7] + 32 * result));
    v19 = v2[2];
    v20 = __OFADD__(v19, 1);
    v21 = v19 + 1;
    if (v20)
      goto LABEL_36;
    v2[2] = v21;
LABEL_8:
    v7 = v12;
    v5 = v10;
  }
  __break(1u);
LABEL_36:
  __break(1u);
LABEL_37:
  __break(1u);
LABEL_38:
  __break(1u);
  return result;
}

void sub_21DBB6174(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t *v6;
  int64_t v7;
  uint64_t *v8;
  unint64_t *v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  char v29;
  uint64_t *v30;
  uint64_t v31;
  BOOL v32;
  uint64_t v33;
  int64_t v34;
  uint64_t v35;
  uint64_t v36;
  int64_t v37;
  uint64_t v38;
  char v39[32];
  _QWORD v40[2];
  uint64_t v41;

  v1 = a1;
  if (*(_QWORD *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2553A4320);
    v2 = (_QWORD *)sub_21DBD2560();
  }
  else
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
  }
  v35 = v1 + 64;
  v3 = -1;
  v4 = -1 << *(_BYTE *)(v1 + 32);
  if (-v4 < 64)
    v3 = ~(-1 << -(char)v4);
  v5 = v3 & *(_QWORD *)(v1 + 64);
  v6 = &v41;
  v34 = (unint64_t)(63 - v4) >> 6;
  swift_bridgeObjectRetain();
  v7 = 0;
  v8 = &qword_253F3D8E8;
  v9 = &qword_2553A4328;
  v10 = 0x24BEDCDF0uLL;
  while (1)
  {
    if (v5)
    {
      v36 = (v5 - 1) & v5;
      v37 = v7;
      v19 = __clz(__rbit64(v5)) | (v7 << 6);
    }
    else
    {
      v20 = v7 + 1;
      if (__OFADD__(v7, 1))
        goto LABEL_36;
      if (v20 >= v34)
      {
LABEL_33:
        sub_21DBB3F7C();
        return;
      }
      v21 = *(_QWORD *)(v35 + 8 * v20);
      v22 = v7 + 1;
      if (!v21)
      {
        v22 = v7 + 2;
        if (v7 + 2 >= v34)
          goto LABEL_33;
        v21 = *(_QWORD *)(v35 + 8 * v22);
        if (!v21)
        {
          v22 = v7 + 3;
          if (v7 + 3 >= v34)
            goto LABEL_33;
          v21 = *(_QWORD *)(v35 + 8 * v22);
          if (!v21)
          {
            v22 = v7 + 4;
            if (v7 + 4 >= v34)
              goto LABEL_33;
            v21 = *(_QWORD *)(v35 + 8 * v22);
            if (!v21)
            {
              v23 = v7 + 5;
              if (v7 + 5 >= v34)
                goto LABEL_33;
              v21 = *(_QWORD *)(v35 + 8 * v23);
              if (!v21)
              {
                while (1)
                {
                  v22 = v23 + 1;
                  if (__OFADD__(v23, 1))
                    goto LABEL_37;
                  if (v22 >= v34)
                    goto LABEL_33;
                  v21 = *(_QWORD *)(v35 + 8 * v22);
                  ++v23;
                  if (v21)
                    goto LABEL_26;
                }
              }
              v22 = v7 + 5;
            }
          }
        }
      }
LABEL_26:
      v36 = (v21 - 1) & v21;
      v37 = v22;
      v19 = __clz(__rbit64(v21)) + (v22 << 6);
    }
    v24 = (uint64_t *)(*(_QWORD *)(v1 + 48) + 16 * v19);
    v26 = *v24;
    v25 = v24[1];
    sub_21DBB4014(*(_QWORD *)(v1 + 56) + 32 * v19, (uint64_t)v6);
    v40[0] = v26;
    v40[1] = v25;
    sub_21DBB4014((uint64_t)v6, (uint64_t)v39);
    swift_bridgeObjectRetain_n();
    sub_21DBB6B98((uint64_t)v40, v8);
    sub_21DBB6AD0(0, v9);
    if (!swift_dynamicCast())
    {
      swift_bridgeObjectRelease();

      sub_21DBB3F7C();
      swift_release();
      return;
    }
    v27 = sub_21DBCF33C(v26, v25);
    v28 = v27;
    if ((v29 & 1) != 0)
    {
      v11 = v10;
      v12 = v9;
      v13 = v6;
      v14 = v1;
      v15 = v8;
      v16 = (uint64_t *)(v2[6] + 16 * v27);
      swift_bridgeObjectRelease();
      *v16 = v26;
      v16[1] = v25;
      v8 = v15;
      v1 = v14;
      v6 = v13;
      v9 = v12;
      v10 = v11;
      v17 = v2[7];
      v18 = 8 * v28;

      *(_QWORD *)(v17 + v18) = v38;
      goto LABEL_8;
    }
    if (v2[2] >= v2[3])
      break;
    *(_QWORD *)((char *)v2 + ((v27 >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << v27;
    v30 = (uint64_t *)(v2[6] + 16 * v27);
    *v30 = v26;
    v30[1] = v25;
    *(_QWORD *)(v2[7] + 8 * v27) = v38;
    v31 = v2[2];
    v32 = __OFADD__(v31, 1);
    v33 = v31 + 1;
    if (v32)
      goto LABEL_35;
    v2[2] = v33;
LABEL_8:
    v5 = v36;
    v7 = v37;
  }
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
LABEL_37:
  __break(1u);
}

uint64_t sub_21DBB6508(uint64_t a1, unint64_t a2)
{
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;

  if (qword_253F3DA18 != -1)
    swift_once();
  v4 = sub_21DBD2320();
  __swift_project_value_buffer(v4, (uint64_t)qword_253F3DC78);
  swift_bridgeObjectRetain_n();
  v5 = sub_21DBD2308();
  v6 = sub_21DBD2440();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = swift_slowAlloc();
    v8 = swift_slowAlloc();
    v10 = v8;
    *(_DWORD *)v7 = 136380931;
    swift_bridgeObjectRetain();
    sub_21DBCECA4(a1, a2, &v10);
    sub_21DBD24AC();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v7 + 12) = 2048;
    sub_21DBD24AC();
    _os_log_impl(&dword_21DBAF000, v5, v6, "Dictionary is not a string-keyed dictionary. Returning early. { function=%{private}s, reporterID=%lld }", (uint8_t *)v7, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x22079B7C0](v8, -1, -1);
    MEMORY[0x22079B7C0](v7, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  return 0;
}

uint64_t sub_21DBB66C8()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_21DBB66EC()
{
  return swift_deallocObject();
}

uint64_t sub_21DBB66FC()
{
  uint64_t v0;

  return sub_21DBB3BCC(*(uint64_t (**)(void))(v0 + 16));
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

uint64_t sub_21DBB671C()
{
  return objectdestroy_27Tm();
}

uint64_t sub_21DBB6724()
{
  return swift_deallocObject();
}

uint64_t sub_21DBB6734()
{
  return swift_deallocObject();
}

uint64_t sub_21DBB6744()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_21DBB6768()
{
  return swift_deallocObject();
}

uint64_t sub_21DBB6778()
{
  return swift_deallocObject();
}

uint64_t sub_21DBB6788()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_21DBB67B4()
{
  return swift_deallocObject();
}

uint64_t _sSo22AudioAnalyticsReporterC0aB0E22sendSessionlessMessage_8category4typeySDys11AnyHashableVypG_So0A13EventCategoryVSo0aK4TypeVtFZ_0(uint64_t a1, int a2, __int16 a3)
{
  unint64_t v6;
  uint64_t result;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  _QWORD v14[6];

  if (qword_253F3DA10 != -1)
    swift_once();
  v6 = sub_21DBB5DA4(a1);
  if (v6 || (result = sub_21DBB6508(0xD000000000000028, 0x800000021DBD4BA0), (v6 = result) != 0))
  {
    if (qword_253F3D9E0 != -1)
      swift_once();
    v8 = (void *)qword_253F3DC50;
    v9 = *(NSObject **)(qword_253F3DC50 + OBJC_IVAR____TtC14AudioAnalytics12ServerClient_serialQueue);
    v10 = swift_allocObject();
    *(_QWORD *)(v10 + 16) = v8;
    *(_QWORD *)(v10 + 24) = v6;
    *(_DWORD *)(v10 + 32) = a2;
    *(_WORD *)(v10 + 36) = a3;
    v11 = swift_allocObject();
    *(_QWORD *)(v11 + 16) = sub_21DBB3E90;
    *(_QWORD *)(v11 + 24) = v10;
    v14[4] = sub_21DBB6BD4;
    v14[5] = v11;
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 1107296256;
    v14[2] = sub_21DBB3BEC;
    v14[3] = &block_descriptor_91;
    v12 = _Block_copy(v14);
    v13 = v8;
    swift_bridgeObjectRetain();
    swift_retain();
    swift_release();
    dispatch_sync(v9, v12);
    _Block_release(v12);
    LOBYTE(v12) = swift_isEscapingClosureAtFileLocation();
    swift_bridgeObjectRelease();

    swift_release();
    result = swift_release();
    if ((v12 & 1) != 0)
      __break(1u);
  }
  return result;
}

uint64_t sub_21DBB69BC()
{
  uint64_t v0;

  swift_release();
  return swift_deallocObject();
}

uint64_t sub_21DBB69E8()
{
  return swift_deallocObject();
}

char *keypath_get_selector_reporterID()
{
  return sel_reporterID;
}

id sub_21DBB6A04@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_reporterID);
  *a2 = result;
  return result;
}

id sub_21DBB6A34(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setReporterID_, *a1);
}

char *keypath_get_selector_configuration()
{
  return sel_configuration;
}

void sub_21DBB6A58(uint64_t a1, void **a2)
{
  void *v2;
  id v3;

  v2 = *a2;
  v3 = (id)sub_21DBD238C();
  objc_msgSend(v2, sel_setConfiguration_, v3);

}

uint64_t type metadata accessor for AudioAnalyticsReporter(uint64_t a1)
{
  return sub_21DBB6AD0(a1, &qword_2553A4318);
}

uint64_t sub_21DBB6AD0(uint64_t a1, unint64_t *a2)
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

uint64_t sub_21DBB6B08()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

uint64_t sub_21DBB6B2C(uint64_t a1)
{
  uint64_t v1;

  return sub_21DBB39EC(a1, *(_QWORD *)(v1 + 16));
}

uint64_t sub_21DBB6B34()
{
  return swift_deallocObject();
}

uint64_t sub_21DBB6B44()
{
  return objectdestroy_27Tm();
}

uint64_t sub_21DBB6B4C()
{
  return swift_deallocObject();
}

uint64_t sub_21DBB6B5C(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(MEMORY[0x24BEE23D0] - 8) + 16))(a2, a1);
  return a2;
}

uint64_t sub_21DBB6B98(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_21DBB6C24@<X0>(uint64_t *a1@<X8>)
{
  return sub_21DBB3D28(a1);
}

uint64_t sub_21DBB6C38@<X0>(__int16 *a1@<X8>)
{
  return sub_21DBB3CCC(a1);
}

id AudioAnalyticsTestReporter.__allocating_init(newReporterID:)()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_initWithNewReporterID);
}

id AudioAnalyticsTestReporter.init(newReporterID:)()
{
  void *v0;
  id v1;
  objc_super v3;

  v1 = objc_msgSend(v0, sel_initWithNewReporterID);
  v3.receiver = v1;
  v3.super_class = (Class)type metadata accessor for AudioAnalyticsTestReporter();
  objc_msgSendSuper2(&v3, sel_setServiceType_, 11);
  return v1;
}

uint64_t type metadata accessor for AudioAnalyticsTestReporter()
{
  return objc_opt_self();
}

id AudioAnalyticsTestReporter.__allocating_init(reporterID:)(uint64_t a1)
{
  objc_class *v1;

  return objc_msgSend(objc_allocWithZone(v1), sel_initWithReporterID_, a1);
}

id AudioAnalyticsTestReporter.init(reporterID:)(uint64_t a1)
{
  void *v1;
  objc_super v4;

  v4.receiver = v1;
  v4.super_class = (Class)type metadata accessor for AudioAnalyticsTestReporter();
  return objc_msgSendSuper2(&v4, sel_initWithReporterID_, a1);
}

id AudioAnalyticsTestReporter.__allocating_init(sessionID:serviceType:)(uint64_t a1, unsigned __int16 a2)
{
  objc_class *v2;

  return objc_msgSend(objc_allocWithZone(v2), sel_initWithSessionID_serviceType_, a1, a2);
}

id AudioAnalyticsTestReporter.init(sessionID:serviceType:)(uint64_t a1, unsigned __int16 a2)
{
  void *v2;
  objc_super v6;

  v6.receiver = v2;
  v6.super_class = (Class)type metadata accessor for AudioAnalyticsTestReporter();
  return objc_msgSendSuper2(&v6, sel_initWithSessionID_serviceType_, a1, a2);
}

id AudioAnalyticsTestReporter.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AudioAnalyticsTestReporter();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_21DBB6F08(uint64_t a1)
{
  int64_t v2;
  uint64_t result;
  int *v4;
  int v5;
  int v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v2 = *(_QWORD *)(a1 + 16);
  result = MEMORY[0x24BEE4AF8];
  if (v2)
  {
    v9 = MEMORY[0x24BEE4AF8];
    sub_21DBCACF8(0, v2, 0);
    result = v9;
    v4 = (int *)(a1 + 32);
    do
    {
      v6 = *v4++;
      v5 = v6;
      v10 = result;
      v8 = *(_QWORD *)(result + 16);
      v7 = *(_QWORD *)(result + 24);
      if (v8 >= v7 >> 1)
      {
        sub_21DBCACF8(v7 > 1, v8 + 1, 1);
        result = v10;
      }
      *(_QWORD *)(result + 16) = v8 + 1;
      *(_DWORD *)(result + 4 * v8 + 32) = v5;
      --v2;
    }
    while (v2);
  }
  return result;
}

void sub_21DBB6FC4()
{
  qword_253F3DC38 = 0;
}

void sub_21DBB6FD0()
{
  id v0;
  void *v1;
  int internalBuild;
  char v3;
  char v4;
  _BYTE v5[24];
  ValueMetadata *v6;
  unint64_t v7;

  v0 = (id)MobileGestalt_get_current_device();
  if (v0)
  {
    v1 = v0;
    internalBuild = MobileGestalt_get_internalBuild();

    if (internalBuild)
    {
      v6 = &type metadata for AudioAnalytics;
      v7 = sub_21DBB7C74();
      v3 = sub_21DBD22FC();
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v5);
      v4 = v3 ^ 1;
    }
    else
    {
      v4 = 0;
    }
    byte_253F3DC58 = v4 & 1;
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_21DBB7058()
{
  uint64_t result;

  result = os_variant_is_darwinos();
  byte_2553A4BB1 = result;
  return result;
}

uint64_t sub_21DBB7078()
{
  return 1;
}

uint64_t sub_21DBB7080()
{
  sub_21DBD25A8();
  sub_21DBD25B4();
  return sub_21DBD25CC();
}

uint64_t sub_21DBB70C0()
{
  return sub_21DBD25B4();
}

uint64_t sub_21DBB70E4()
{
  sub_21DBD25A8();
  sub_21DBD25B4();
  return sub_21DBD25CC();
}

const char *sub_21DBB7120()
{
  return "AudioAnalytics";
}

const char *sub_21DBB7134()
{
  return "SimulateCustomer";
}

unint64_t AudioEventType.description.getter(unsigned __int16 a1)
{
  int v1;
  unint64_t result;

  v1 = a1;
  result = 0x636972656E6567;
  switch(v1)
  {
    case 0:
      return result;
    case 1:
      result = 0x7472617473;
      break;
    case 2:
      result = 1886352499;
      break;
    case 3:
      result = 0x6574617669746361;
      break;
    case 4:
      result = 0x6176697463616564;
      break;
    case 5:
      result = 0x7075746573;
      break;
    case 6:
      result = 0x726F727265;
      break;
    case 7:
      result = 0x7465446575737369;
      break;
    case 8:
      result = 0x676F4C7265776F70;
      break;
    case 9:
      result = 0x696E556F69647561;
      break;
    case 10:
      result = 0x766972446964696DLL;
      break;
    case 11:
      result = 0x7972616D6D7573;
      break;
    case 12:
      result = 0xD000000000000016;
      break;
    case 13:
      result = 0x7078456F69647561;
      break;
    case 14:
      result = 0xD000000000000014;
      break;
    case 15:
      result = 0x694B726F736E6573;
      break;
    case 16:
      result = 0x656C706D6973;
      break;
    case 17:
      result = 0x6172676F74736968;
      break;
    case 18:
      result = 0x6574617473;
      break;
    case 19:
      result = 0x6F4C79726F6D656DLL;
      break;
    case 20:
      result = 0x6E49646F50726961;
      break;
    case 21:
      result = 0x4955726F66;
      break;
    default:
      result = 0x6E776F6E6B6E75;
      break;
  }
  return result;
}

unint64_t sub_21DBB73F0()
{
  unsigned __int16 *v0;

  return AudioEventType.description.getter(*v0);
}

unint64_t AudioServiceType.description.getter(unsigned __int16 a1)
{
  int v1;
  unint64_t result;

  v1 = a1;
  result = 0x6E6F6870656C6574;
  switch(v1)
  {
    case 0:
      result = 0x636972656E6567;
      break;
    case 1:
      result = 1769105779;
      break;
    case 2:
      return result;
    case 3:
      result = 0x73636974706168;
      break;
    case 4:
      result = 0x736D72616C61;
      break;
    case 5:
      result = 0x6F6C41646E617473;
      break;
    case 6:
      result = 0x747541646E756F73;
      break;
    case 7:
      result = 0x6D726F46676E6F6CLL;
      break;
    case 8:
    case 9:
      result = 0xD000000000000010;
      break;
    case 10:
      result = 0x737472656C61;
      break;
    case 11:
      result = 1953719668;
      break;
    case 12:
      result = 0x6567617355697061;
      break;
    case 13:
      result = 0x6F536D6574737973;
      break;
    case 14:
      result = 0x616E41646E756F73;
      break;
    case 15:
      result = 0x657275636573;
      break;
    default:
      result = 0x6E776F6E6B6E75;
      break;
  }
  return result;
}

unint64_t sub_21DBB75EC()
{
  unsigned __int16 *v0;

  return AudioServiceType.description.getter(*v0);
}

uint64_t AudioEventCategory.description.getter(int a1)
{
  int v1;

  v1 = (unsigned __int16)a1;
  if ((a1 & 0xFFFF0000) == 0)
  {
    if (!(_WORD)a1)
      return 0;
    goto LABEL_4;
  }
  sub_21DBD23D4();
  swift_bridgeObjectRelease();
  if (v1)
  {
    sub_21DBD23D4();
LABEL_4:
    sub_21DBB7770(v1);
    sub_21DBD23D4();
    swift_bridgeObjectRelease();
  }
  return 0;
}

unint64_t sub_21DBB7770(int a1)
{
  int v1;
  unint64_t result;

  v1 = a1 + 1;
  result = 0x636972656E6547;
  switch(v1)
  {
    case 0:
      result = 0x6E776F6E6B6E55;
      break;
    case 2:
      return result;
    case 3:
      result = 0x64726F636552;
      break;
    case 4:
      result = 0x7475706E49;
      break;
    case 5:
      result = 0x6B63616279616C50;
      break;
    case 6:
      result = 0x74757074754FLL;
      break;
    case 7:
      result = 0xD000000000000011;
      break;
    case 8:
      result = 20297;
      break;
    case 9:
      result = 0x7075746553;
      break;
    case 10:
      result = 0x6552746E65696C43;
      break;
    case 11:
      result = 0x6168436574756F52;
      break;
    case 12:
      result = 0x726F727245;
      break;
    case 13:
      result = 0x74726F7065524F49;
      break;
    case 14:
      result = 0x616D726F66726550;
      break;
    case 15:
      result = 0x656D756C6F56;
      break;
    case 16:
      result = 0x65736E61707845;
      break;
    case 17:
      result = 0x48676E6972616548;
      break;
    case 18:
      result = 0x73646F50726941;
      break;
    case 19:
      result = 0x6F72506563696F56;
      break;
    case 21:
      result = 0x6C616974617053;
      break;
    case 22:
      result = 0x556F5478694D5056;
      break;
    default:
      result = 0x656E696665646E55;
      break;
  }
  return result;
}

uint64_t sub_21DBB79C0()
{
  int *v0;

  return AudioEventCategory.description.getter(*v0);
}

uint64_t sub_21DBB79C8(uint64_t a1)
{
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int8x16_t *v5;
  int8x16_t v6;
  uint64_t v7;
  int8x16_t v8;
  int8x16_t v9;
  int8x8_t v10;
  unint64_t v11;
  int *v12;
  int v13;

  v1 = sub_21DBB6F08(a1);
  v2 = *(_QWORD *)(v1 + 16);
  if (!v2)
  {
    v4 = 0;
    goto LABEL_10;
  }
  if (v2 < 8)
  {
    v3 = 0;
    LODWORD(v4) = 0;
LABEL_8:
    v11 = v2 - v3;
    v12 = (int *)(v1 + 4 * v3 + 32);
    do
    {
      v13 = *v12++;
      v4 = v13 | v4;
      --v11;
    }
    while (v11);
    goto LABEL_10;
  }
  v3 = v2 & 0x7FFFFFFFFFFFFFF8;
  v5 = (int8x16_t *)(v1 + 48);
  v6 = 0uLL;
  v7 = v2 & 0x7FFFFFFFFFFFFFF8;
  v8 = 0uLL;
  do
  {
    v6 = vorrq_s8(v5[-1], v6);
    v8 = vorrq_s8(*v5, v8);
    v5 += 2;
    v7 -= 8;
  }
  while (v7);
  v9 = vorrq_s8(v8, v6);
  v10 = vorr_s8(*(int8x8_t *)v9.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v9, v9, 8uLL));
  v4 = (v10.i32[0] | v10.i32[1]);
  if (v2 != v3)
    goto LABEL_8;
LABEL_10:
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_21DBB7A90()
{
  pid_t v0;
  uint64_t v1;
  int v2;
  uint64_t v3;
  size_t v5;
  _BYTE v6[37];
  uint64_t v7;
  int v8;
  __int128 v9;
  __int128 v10;
  int v11;
  __int128 v12;
  __int128 v13;
  int v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  int v18;
  __int128 v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  int v23;
  __int128 v24;
  _BYTE v25[28];
  __int128 v26;
  int v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[28];
  uint64_t v35;
  __int16 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  int v41;
  __int128 v42;
  uint64_t v43;
  int v44;
  __int128 v45;
  __int128 v46;
  __int16 v47;
  uint64_t v48;
  __int128 v49;
  uint64_t v50;
  __int16 v51;
  __int128 v52;
  __int128 v53;
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  v0 = getpid();
  __swift_instantiateConcreteTypeFromMangledName(&qword_253F3DA08);
  v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_21DBD32B0;
  *(_QWORD *)(v1 + 32) = 0xE00000001;
  *(_DWORD *)(v1 + 40) = 1;
  *(_DWORD *)(v1 + 44) = v0;
  memset(v6, 0, sizeof(v6));
  v7 = 0;
  v8 = 0;
  v15 = 0;
  v16 = 0;
  v17 = 0;
  v18 = 0;
  v22 = 0;
  v35 = 0;
  v36 = 0;
  v41 = 0;
  v48 = 0;
  v9 = 0u;
  v10 = 0u;
  v11 = 0;
  v14 = 0;
  v12 = 0u;
  v13 = 0u;
  v20 = 0;
  v21 = 0;
  v19 = 0u;
  v24 = 0u;
  memset(v25, 0, sizeof(v25));
  v26 = 0u;
  v23 = 0;
  v27 = 0;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  memset(v34, 0, sizeof(v34));
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v42 = 0u;
  v44 = 0;
  v43 = 0;
  v45 = 0u;
  v46 = 0u;
  v47 = 0;
  v49 = 0u;
  v51 = 0;
  v50 = 0;
  v52 = 0u;
  v53 = 0u;
  v5 = 648;
  v2 = sysctl((int *)(v1 + 32), 4u, v6, &v5, 0, 0);
  if (v2 == sub_21DBD232C())
  {
    v3 = sub_21DBD23E0();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  return v3;
}

unint64_t sub_21DBB7C74()
{
  unint64_t result;

  result = qword_253F3DA48;
  if (!qword_253F3DA48)
  {
    result = MEMORY[0x22079B718](&unk_21DBD3280, &type metadata for AudioAnalytics);
    atomic_store(result, (unint64_t *)&qword_253F3DA48);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for AudioAnalytics(unsigned int *a1, int a2)
{
  int v2;
  int v3;

  if (!a2)
    return 0;
  if ((a2 + 1) >= 0x10000)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 1) < 0x100)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
    return *a1;
  if (v3 == 2)
    return *(unsigned __int16 *)a1;
  return *(unsigned __int8 *)a1;
}

uint64_t storeEnumTagSinglePayload for AudioAnalytics(uint64_t a1, int a2, int a3)
{
  int v3;
  uint64_t v4;

  if ((a3 + 1) >= 0x10000)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) < 0x100)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3)
    v4 = v4;
  else
    v4 = 0;
  if (a2)
    return ((uint64_t (*)(void))((char *)sub_21DBB7D50 + 4 * byte_21DBD3181[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_21DBB7D70 + 4 * byte_21DBD3186[v4]))();
}

_BYTE *sub_21DBB7D50(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_21DBB7D70(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_21DBB7D78(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_21DBB7D80(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_21DBB7D88(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_21DBB7D90(_DWORD *result)
{
  *result = 0;
  return result;
}

uint64_t sub_21DBB7D9C()
{
  return 0;
}

ValueMetadata *type metadata accessor for AudioAnalytics()
{
  return &type metadata for AudioAnalytics;
}

unint64_t sub_21DBB7DBC()
{
  unint64_t result;

  result = qword_2553A4330;
  if (!qword_2553A4330)
  {
    result = MEMORY[0x22079B718](&unk_21DBD3258, &type metadata for AudioAnalytics);
    atomic_store(result, (unint64_t *)&qword_2553A4330);
  }
  return result;
}

uint64_t sub_21DBB7E00(uint64_t a1)
{
  return sub_21DBB7E28(a1, qword_253F3DC78);
}

uint64_t sub_21DBB7E14(uint64_t a1)
{
  return sub_21DBB7E28(a1, qword_253F3DC60);
}

uint64_t sub_21DBB7E28(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_21DBD2320();
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  return sub_21DBD2314();
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

uint64_t sub_21DBB7ED8(uint64_t a1)
{
  uint64_t active;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  int EnumCaseMultiPayload;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  NSObject *v20;
  os_log_type_t v21;
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
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char isUniquelyReferenced_nonNull_native;
  _QWORD *v39;
  char v40;
  unint64_t v41;
  uint64_t v42;
  _BOOL8 v43;
  uint64_t v44;
  char v45;
  unint64_t v46;
  char v47;
  _QWORD *v48;
  uint64_t v49;
  uint64_t v50;
  BOOL v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  int v56;
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  unint64_t v60;
  char v61;
  uint64_t v62;
  char v63;
  char v64;
  NSObject *v65;
  os_log_type_t v66;
  uint8_t *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  _QWORD *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t result;
  _QWORD v80[3];
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  __int128 v84;
  uint64_t v85;
  __int128 v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  _QWORD *v90;
  _QWORD v91[3];
  uint64_t v92;

  active = type metadata accessor for ActiveReporterState(0);
  v4 = MEMORY[0x24BDAC7A8](active, v3);
  v82 = (uint64_t)v80 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4, v6);
  v8 = (_QWORD *)((char *)v80 - v7);
  v81 = a1;
  sub_21DBB97B0(a1, (uint64_t)v80 - v7);
  v80[2] = active;
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  v10 = *v8;
  if (EnumCaseMultiPayload != 1)
  {
    v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F3D888);
    sub_21DBBA1BC((uint64_t)v8 + *(int *)(v11 + 48), type metadata accessor for StartedReporterData);
  }
  v12 = *(_QWORD *)(v85 + 16);
  v13 = *(_QWORD *)(v12 + 16);
  v83 = v10;
  if (v13)
  {
    v14 = *(_QWORD *)(v10 + 16);
    v15 = v12 + 32;
    v80[1] = v12;
    swift_bridgeObjectRetain();
    *((_QWORD *)&v16 + 1) = 2;
    v86 = xmmword_21DBD32D0;
    *(_QWORD *)&v16 = 134283521;
    v84 = v16;
    v87 = v14;
    do
    {
      sub_21DBB97F4(v15, (uint64_t)v91);
      v18 = *__swift_project_boxed_opaque_existential_1(v91, v92)
          + OBJC_IVAR____TtC14AudioAnalytics26SessionGenericSummaryCache_activeReporters;
      swift_beginAccess();
      if (*(_QWORD *)(*(_QWORD *)v18 + 16) && (sub_21DBCF30C(v14), (v19 & 1) != 0))
      {
        v20 = sub_21DBD2308();
        v21 = sub_21DBD244C();
        if (os_log_type_enabled(v20, v21))
        {
          v22 = swift_slowAlloc();
          *(_DWORD *)v22 = v84;
          *(_QWORD *)(v22 + 4) = v14;
          _os_log_impl(&dword_21DBAF000, v20, v21, "create called for existing reporterID. { reporterID=%{private}lld }", (uint8_t *)v22, 0xCu);
          MEMORY[0x22079B7C0](v22, -1, -1);
        }

      }
      else
      {
        v88 = v13;
        type metadata accessor for ReporterInfo(0);
        v23 = swift_allocObject();
        v24 = v23 + OBJC_IVAR____TtC14AudioAnalytics12ReporterInfo_startTime;
        v25 = sub_21DBD22F0();
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v25 - 8) + 56))(v24, 1, 1, v25);
        v26 = OBJC_IVAR____TtC14AudioAnalytics12ReporterInfo_messageCounts;
        type metadata accessor for MessageCounts();
        v27 = swift_allocObject();
        *(_QWORD *)(v27 + 16) = 0;
        *(_QWORD *)(v27 + 24) = 0;
        v89 = v23;
        *(_QWORD *)(v23 + v26) = v27;
        type metadata accessor for ReporterData();
        v28 = swift_allocObject();
        *(_WORD *)(v28 + 24) = -1;
        v29 = MEMORY[0x24BEE4AF8];
        *(_QWORD *)(v28 + 32) = sub_21DBCC2E0(MEMORY[0x24BEE4AF8]);
        __swift_instantiateConcreteTypeFromMangledName(&qword_253F3DA08);
        v30 = swift_allocObject();
        *(_OWORD *)(v30 + 16) = v86;
        *(_DWORD *)(v30 + 32) = getpid();
        type metadata accessor for PerfCheck();
        v31 = swift_allocObject();
        *(_QWORD *)(v31 + 16) = v29;
        *(_QWORD *)(v31 + 24) = v29;
        *(_QWORD *)(v31 + 32) = 0;
        *(_QWORD *)(v31 + 40) = 0;
        *(_WORD *)(v31 + 50) = -1;
        v32 = OBJC_IVAR____TtC14AudioAnalytics9PerfCheck_logger;
        if (qword_253F3D9E8 != -1)
          swift_once();
        v33 = v31 + v32;
        v34 = sub_21DBD2320();
        v35 = __swift_project_value_buffer(v34, (uint64_t)qword_253F3DC60);
        v36 = *(_QWORD *)(v34 - 8);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v36 + 16))(v33, v35, v34);
        if (qword_253F3DA30 != -1)
          swift_once();
        if (byte_253F3DC58 == 1)
        {
          swift_beginAccess();
          *(_QWORD *)(v31 + 24) = v30;
          swift_bridgeObjectRelease();
          *(_BYTE *)(v31 + 48) = 1;
        }
        else
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          (*(void (**)(uint64_t, uint64_t))(v36 + 8))(v33, v34);
          swift_deallocPartialClassInstance();
          v31 = 0;
        }
        *(_QWORD *)(v28 + 40) = v31;
        v14 = v87;
        *(_QWORD *)(v28 + 16) = v87;
        v37 = v89;
        *(_QWORD *)(v89 + OBJC_IVAR____TtC14AudioAnalytics12ReporterInfo_data) = v28;
        *(_WORD *)(v28 + 24) = -1;
        swift_beginAccess();
        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        v90 = *(_QWORD **)v18;
        v39 = v90;
        *(_QWORD *)v18 = 0x8000000000000000;
        v41 = sub_21DBCF30C(v14);
        v42 = v39[2];
        v43 = (v40 & 1) == 0;
        v44 = v42 + v43;
        if (__OFADD__(v42, v43))
        {
          __break(1u);
LABEL_54:
          __break(1u);
LABEL_55:
          result = sub_21DBD2584();
          __break(1u);
          return result;
        }
        v45 = v40;
        if (v39[3] >= v44)
        {
          if ((isUniquelyReferenced_nonNull_native & 1) == 0)
            sub_21DBD10EC();
        }
        else
        {
          sub_21DBCF8D4(v44, isUniquelyReferenced_nonNull_native);
          v46 = sub_21DBCF30C(v14);
          if ((v45 & 1) != (v47 & 1))
            goto LABEL_55;
          v41 = v46;
        }
        v13 = v88;
        v48 = v90;
        if ((v45 & 1) != 0)
        {
          v17 = v90[7];
          swift_release();
          *(_QWORD *)(v17 + 8 * v41) = v37;
        }
        else
        {
          v90[(v41 >> 6) + 8] |= 1 << v41;
          v49 = 8 * v41;
          *(_QWORD *)(v48[6] + v49) = v14;
          *(_QWORD *)(v48[7] + v49) = v37;
          v50 = v48[2];
          v51 = __OFADD__(v50, 1);
          v52 = v50 + 1;
          if (v51)
            goto LABEL_54;
          v48[2] = v52;
        }
        *(_QWORD *)v18 = v48;
        swift_bridgeObjectRelease();
        swift_endAccess();
      }
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v91);
      v15 += 40;
      --v13;
    }
    while (v13);
    swift_bridgeObjectRelease();
    v53 = *(_QWORD *)(v85 + 16);
    v54 = *(_QWORD *)(v53 + 16);
    v10 = v83;
    if (v54)
    {
      v55 = *(_QWORD *)(v83 + 16);
      v56 = *(unsigned __int16 *)(v83 + 24);
      v57 = v53 + 32;
      v89 = *(_QWORD *)(v85 + 16);
      swift_bridgeObjectRetain();
      do
      {
        sub_21DBB97F4(v57, (uint64_t)v91);
        v58 = (uint64_t *)(*__swift_project_boxed_opaque_existential_1(v91, v92)
                        + OBJC_IVAR____TtC14AudioAnalytics26SessionGenericSummaryCache_activeReporters);
        swift_beginAccess();
        v59 = *v58;
        if (*(_QWORD *)(v59 + 16) && (v60 = sub_21DBCF30C(v55), (v61 & 1) != 0))
        {
          v62 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v59 + 56) + 8 * v60)
                          + OBJC_IVAR____TtC14AudioAnalytics12ReporterInfo_data);
          if (*(unsigned __int16 *)(v62 + 24) != v56)
          {
            sub_21DBCF30C(v55);
            v64 = v63;
            swift_retain();
            if ((v64 & 1) != 0)
              sub_21DBCC9F8(v55);
            swift_retain();
            swift_release();
            *(_WORD *)(v62 + 24) = v56;
            swift_release();
          }
        }
        else
        {
          v65 = sub_21DBD2308();
          v66 = sub_21DBD244C();
          if (os_log_type_enabled(v65, v66))
          {
            v67 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)v67 = 0;
            _os_log_impl(&dword_21DBAF000, v65, v66, "activeReporters should contain reporter already. { function=setServiceType }", v67, 2u);
            MEMORY[0x22079B7C0](v67, -1, -1);
          }

        }
        __swift_destroy_boxed_opaque_existential_0((uint64_t)v91);
        v57 += 40;
        --v54;
      }
      while (v54);
      swift_bridgeObjectRelease();
      v10 = v83;
    }
  }
  swift_beginAccess();
  v68 = *(_QWORD *)(v85 + 16);
  v69 = *(_QWORD *)(v68 + 16);
  if (v69)
  {
    v70 = *(_QWORD *)(v10 + 32);
    v71 = *(_QWORD *)(v10 + 16);
    v72 = (_QWORD *)(v68 + 32);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    do
    {
      __swift_project_boxed_opaque_existential_1(v72, v72[3]);
      sub_21DBCCF14(v70, v71);
      v72 += 5;
      --v69;
    }
    while (v69);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v10 = v83;
  }
  v73 = v82;
  sub_21DBB97B0(v81, v82);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_21DBBA1BC(v73, type metadata accessor for ActiveReporterState);
    return swift_release();
  }
  swift_release();
  v74 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F3D888);
  sub_21DBBA1BC(v73 + *(int *)(v74 + 48), type metadata accessor for StartedReporterData);
  v75 = *(_QWORD *)(v85 + 16);
  v76 = *(_QWORD *)(v75 + 16);
  if (!v76)
    return swift_release();
  v77 = *(_QWORD *)(v10 + 16);
  v78 = v75 + 32;
  swift_bridgeObjectRetain();
  do
  {
    sub_21DBB97F4(v78, (uint64_t)v91);
    __swift_project_boxed_opaque_existential_1(v91, v92);
    sub_21DBCC664(v77);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v91);
    v78 += 40;
    --v76;
  }
  while (v76);
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_21DBB87B0(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  NSObject *v9;
  os_log_type_t v10;
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
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v27;
  char v28;
  unint64_t v29;
  uint64_t v30;
  _BOOL8 v31;
  uint64_t v32;
  char v33;
  unint64_t v34;
  char v35;
  uint64_t v36;
  uint64_t v37;
  BOOL v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  _QWORD *v43;
  _QWORD v44[6];

  result = *(_QWORD *)(v1 + 16);
  v4 = *(_QWORD *)(result + 16);
  if (!v4)
    return result;
  v5 = result + 32;
  swift_bridgeObjectRetain();
  v40 = a1;
  while (1)
  {
    sub_21DBB97F4(v5, (uint64_t)v44);
    v7 = *__swift_project_boxed_opaque_existential_1(v44, v44[3])
       + OBJC_IVAR____TtC14AudioAnalytics26SessionGenericSummaryCache_activeReporters;
    swift_beginAccess();
    if (*(_QWORD *)(*(_QWORD *)v7 + 16))
    {
      sub_21DBCF30C(a1);
      if ((v8 & 1) != 0)
      {
        v9 = sub_21DBD2308();
        v10 = sub_21DBD244C();
        if (os_log_type_enabled(v9, v10))
        {
          v11 = swift_slowAlloc();
          *(_DWORD *)v11 = 134283521;
          *(_QWORD *)(v11 + 4) = a1;
          _os_log_impl(&dword_21DBAF000, v9, v10, "create called for existing reporterID. { reporterID=%{private}lld }", (uint8_t *)v11, 0xCu);
          MEMORY[0x22079B7C0](v11, -1, -1);
        }

        goto LABEL_5;
      }
    }
    v41 = v4;
    type metadata accessor for ReporterInfo(0);
    v12 = swift_allocObject();
    v13 = v12 + OBJC_IVAR____TtC14AudioAnalytics12ReporterInfo_startTime;
    v14 = sub_21DBD22F0();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v13, 1, 1, v14);
    v15 = OBJC_IVAR____TtC14AudioAnalytics12ReporterInfo_messageCounts;
    type metadata accessor for MessageCounts();
    v16 = swift_allocObject();
    *(_QWORD *)(v16 + 16) = 0;
    *(_QWORD *)(v16 + 24) = 0;
    v42 = v12;
    *(_QWORD *)(v12 + v15) = v16;
    type metadata accessor for ReporterData();
    v17 = swift_allocObject();
    *(_WORD *)(v17 + 24) = -1;
    v18 = MEMORY[0x24BEE4AF8];
    *(_QWORD *)(v17 + 32) = sub_21DBCC2E0(MEMORY[0x24BEE4AF8]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_253F3DA08);
    v19 = swift_allocObject();
    *(_OWORD *)(v19 + 16) = xmmword_21DBD32D0;
    *(_DWORD *)(v19 + 32) = getpid();
    type metadata accessor for PerfCheck();
    v20 = swift_allocObject();
    *(_QWORD *)(v20 + 16) = v18;
    *(_QWORD *)(v20 + 24) = v18;
    *(_QWORD *)(v20 + 32) = 0;
    *(_QWORD *)(v20 + 40) = 0;
    *(_WORD *)(v20 + 50) = -1;
    v21 = OBJC_IVAR____TtC14AudioAnalytics9PerfCheck_logger;
    if (qword_253F3D9E8 != -1)
      swift_once();
    v22 = v20 + v21;
    v23 = sub_21DBD2320();
    v24 = __swift_project_value_buffer(v23, (uint64_t)qword_253F3DC60);
    v25 = *(_QWORD *)(v23 - 8);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v25 + 16))(v22, v24, v23);
    if (qword_253F3DA30 != -1)
      swift_once();
    if (byte_253F3DC58 == 1)
    {
      swift_beginAccess();
      *(_QWORD *)(v20 + 24) = v19;
      swift_bridgeObjectRelease();
      *(_BYTE *)(v20 + 48) = 1;
    }
    else
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      (*(void (**)(uint64_t, uint64_t))(v25 + 8))(v22, v23);
      swift_deallocPartialClassInstance();
      v20 = 0;
    }
    *(_QWORD *)(v17 + 40) = v20;
    a1 = v40;
    *(_QWORD *)(v17 + 16) = v40;
    *(_QWORD *)(v42 + OBJC_IVAR____TtC14AudioAnalytics12ReporterInfo_data) = v17;
    *(_WORD *)(v17 + 24) = -1;
    swift_beginAccess();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v27 = *(_QWORD *)v7;
    v43 = *(_QWORD **)v7;
    *(_QWORD *)v7 = 0x8000000000000000;
    v29 = sub_21DBCF30C(v40);
    v30 = *(_QWORD *)(v27 + 16);
    v31 = (v28 & 1) == 0;
    v32 = v30 + v31;
    if (__OFADD__(v30, v31))
      break;
    v33 = v28;
    if (*(_QWORD *)(v27 + 24) >= v32)
    {
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        sub_21DBD10EC();
    }
    else
    {
      sub_21DBCF8D4(v32, isUniquelyReferenced_nonNull_native);
      v34 = sub_21DBCF30C(v40);
      if ((v33 & 1) != (v35 & 1))
        goto LABEL_31;
      v29 = v34;
    }
    v4 = v41;
    if ((v33 & 1) != 0)
    {
      v6 = v43[7];
      swift_release();
      *(_QWORD *)(v6 + 8 * v29) = v42;
    }
    else
    {
      v43[(v29 >> 6) + 8] |= 1 << v29;
      v36 = 8 * v29;
      *(_QWORD *)(v43[6] + v36) = v40;
      *(_QWORD *)(v43[7] + v36) = v42;
      v37 = v43[2];
      v38 = __OFADD__(v37, 1);
      v39 = v37 + 1;
      if (v38)
        goto LABEL_30;
      v43[2] = v39;
    }
    *(_QWORD *)v7 = v43;
    swift_bridgeObjectRelease();
    swift_endAccess();
LABEL_5:
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v44);
    v5 += 40;
    if (!--v4)
      return swift_bridgeObjectRelease();
  }
  __break(1u);
LABEL_30:
  __break(1u);
LABEL_31:
  result = sub_21DBD2584();
  __break(1u);
  return result;
}

uint64_t sub_21DBB8C9C(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  unint64_t v10;
  char v11;
  uint64_t v12;
  char v13;
  char v14;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  _QWORD v18[5];

  v3 = *(_QWORD *)(v2 + 16);
  v4 = *(_QWORD *)(v3 + 16);
  if (v4)
  {
    v6 = (unsigned __int16)result;
    v7 = v3 + 32;
    swift_bridgeObjectRetain();
    do
    {
      sub_21DBB97F4(v7, (uint64_t)v18);
      v8 = (uint64_t *)(*__swift_project_boxed_opaque_existential_1(v18, v18[3])
                     + OBJC_IVAR____TtC14AudioAnalytics26SessionGenericSummaryCache_activeReporters);
      swift_beginAccess();
      v9 = *v8;
      if (*(_QWORD *)(v9 + 16) && (v10 = sub_21DBCF30C(a2), (v11 & 1) != 0))
      {
        v12 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v9 + 56) + 8 * v10)
                        + OBJC_IVAR____TtC14AudioAnalytics12ReporterInfo_data);
        if (*(unsigned __int16 *)(v12 + 24) != v6)
        {
          sub_21DBCF30C(a2);
          v14 = v13;
          swift_retain();
          if ((v14 & 1) != 0)
            sub_21DBCC9F8(a2);
          swift_retain();
          swift_release();
          *(_WORD *)(v12 + 24) = v6;
          swift_release();
        }
      }
      else
      {
        v15 = sub_21DBD2308();
        v16 = sub_21DBD244C();
        if (os_log_type_enabled(v15, v16))
        {
          v17 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v17 = 0;
          _os_log_impl(&dword_21DBAF000, v15, v16, "activeReporters should contain reporter already. { function=setServiceType }", v17, 2u);
          MEMORY[0x22079B7C0](v17, -1, -1);
        }

      }
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v18);
      v7 += 40;
      --v4;
    }
    while (v4);
    return swift_bridgeObjectRelease();
  }
  return result;
}

_QWORD *sub_21DBB8E5C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  BOOL v3;
  BOOL v4;
  _QWORD *v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v15;
  uint64_t v16;
  _UNKNOWN **v17;
  _QWORD v18[5];

  v1 = sub_21DBB7A90();
  v2 = v0;
  if (!*(_QWORD *)"")
  {
    if (!v0)
      goto LABEL_30;
    goto LABEL_10;
  }
  if (v0)
  {
    v3 = *(_QWORD *)"audiomxd" == v1 && *(_QWORD *)"" == v0;
    if (v3 || (sub_21DBD2578() & 1) != 0)
      goto LABEL_28;
LABEL_10:
    if (*(_QWORD *)"od")
    {
      v4 = *(_QWORD *)"coreaudiod" == v1 && *(_QWORD *)"od" == v2;
      if (v4 || (sub_21DBD2578() & 1) != 0)
        goto LABEL_28;
    }
    goto LABEL_18;
  }
  if (!*(_QWORD *)"od")
    goto LABEL_30;
LABEL_18:
  if (!*(_QWORD *)"verd")
  {
    if (v2)
      goto LABEL_25;
LABEL_30:
    __swift_instantiateConcreteTypeFromMangledName(&qword_2553A4338);
    swift_arrayDestroy();
    goto LABEL_31;
  }
  if (!v2)
  {
LABEL_29:
    __swift_instantiateConcreteTypeFromMangledName(&qword_2553A4338);
    swift_arrayDestroy();
    swift_bridgeObjectRelease();
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  if (*(_QWORD *)"mediaserverd" == v1 && *(_QWORD *)"verd" == v2 || (sub_21DBD2578() & 1) != 0)
    goto LABEL_28;
LABEL_25:
  if ((*(_QWORD *)"xctest" != v1 || v2 != 0xE600000000000000) && (sub_21DBD2578() & 1) == 0)
    goto LABEL_29;
LABEL_28:
  swift_bridgeObjectRelease();
LABEL_31:
  v6 = type metadata accessor for SessionGenericSummaryCache(0);
  swift_allocObject();
  v18[3] = v6;
  v18[4] = &off_24E199CB8;
  v18[0] = sub_21DBCDF04();
  v5 = sub_21DBB9968(0, 1, 1, MEMORY[0x24BEE4AF8]);
  v8 = v5[2];
  v7 = v5[3];
  if (v8 >= v7 >> 1)
    v5 = sub_21DBB9968((_QWORD *)(v7 > 1), v8 + 1, 1, v5);
  v9 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v18, v6);
  MEMORY[0x24BDAC7A8](v9, v9);
  v11 = (uint64_t *)((char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v12 + 16))(v11);
  v13 = *v11;
  v16 = v6;
  v17 = &off_24E199CB8;
  *(_QWORD *)&v15 = v13;
  v5[2] = v8 + 1;
  sub_21DBBA220(&v15, (uint64_t)&v5[5 * v8 + 4]);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v18);
  return v5;
}

uint64_t sub_21DBB9120()
{
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for MessageCache()
{
  return objc_opt_self();
}

uint64_t sub_21DBB9378(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t))
{
  swift_retain();
  sub_21DBB949C(a3, a4);
  return swift_release();
}

uint64_t sub_21DBB949C(uint64_t result, void (*a2)(uint64_t))
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[5];

  v3 = *(_QWORD *)(v2 + 16);
  v4 = *(_QWORD *)(v3 + 16);
  if (v4)
  {
    v6 = result;
    v7 = v3 + 32;
    swift_bridgeObjectRetain();
    do
    {
      sub_21DBB97F4(v7, (uint64_t)v8);
      __swift_project_boxed_opaque_existential_1(v8, v8[3]);
      a2(v6);
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v8);
      v7 += 40;
      --v4;
    }
    while (v4);
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_21DBB9538(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  unint64_t v8;
  char v9;
  unint64_t v10;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v12;
  uint64_t v13;
  _QWORD v14[5];

  v2 = *(_QWORD *)(v1 + 16);
  v3 = *(_QWORD *)(v2 + 16);
  if (v3)
  {
    v4 = result;
    v5 = v2 + 32;
    swift_bridgeObjectRetain();
    do
    {
      sub_21DBB97F4(v5, (uint64_t)v14);
      v6 = *__swift_project_boxed_opaque_existential_1(v14, v14[3]);
      sub_21DBCC9F8(v4);
      v7 = (uint64_t *)(v6 + OBJC_IVAR____TtC14AudioAnalytics26SessionGenericSummaryCache_activeReporters);
      swift_beginAccess();
      v8 = sub_21DBCF30C(v4);
      if ((v9 & 1) != 0)
      {
        v10 = v8;
        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        v12 = *v7;
        v13 = *v7;
        *v7 = 0x8000000000000000;
        if (!isUniquelyReferenced_nonNull_native)
        {
          sub_21DBD10EC();
          v12 = v13;
        }
        sub_21DBB9C98(v10, v12);
        *v7 = v12;
        swift_release();
        swift_bridgeObjectRelease();
      }
      swift_endAccess();
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v14);
      v5 += 40;
      --v3;
    }
    while (v3);
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_21DBB967C(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t))
{
  swift_retain();
  a4(a3);
  return swift_release();
}

uint64_t sub_21DBB97B0(uint64_t a1, uint64_t a2)
{
  uint64_t active;

  active = type metadata accessor for ActiveReporterState(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(active - 8) + 16))(a2, a1, active);
  return a2;
}

uint64_t sub_21DBB97F4(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

char *sub_21DBB985C(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;

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
      __swift_instantiateConcreteTypeFromMangledName(&qword_253F3DA08);
      v10 = (char *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v12 = v11 - 32;
      if (v11 < 32)
        v12 = v11 - 29;
      *((_QWORD *)v10 + 2) = v8;
      *((_QWORD *)v10 + 3) = 2 * (v12 >> 2);
      v13 = v10 + 32;
      if ((v5 & 1) != 0)
        goto LABEL_15;
    }
    else
    {
      v10 = (char *)MEMORY[0x24BEE4AF8];
      v13 = (char *)(MEMORY[0x24BEE4AF8] + 32);
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[4 * v8 + 32])
          memmove(v13, a4 + 32, 4 * v8);
        *((_QWORD *)a4 + 2) = 0;
        goto LABEL_24;
      }
    }
    sub_21DBBA348(0, v8, v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

_QWORD *sub_21DBB9968(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_2553A4340);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v10[2] = v8;
      v10[3] = 2 * ((uint64_t)(v11 - 32) / 40);
      v12 = v10 + 4;
      if ((v5 & 1) != 0)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[5 * v8 + 4])
          memmove(v12, a4 + 4, 40 * v8);
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
    sub_21DBBA238(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_21DBB9A88(char a1, int64_t a2, char a3, unint64_t a4)
{
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  _QWORD *v13;
  size_t v14;
  BOOL v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = *(_QWORD *)(a4 + 24);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_29;
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
  v8 = *(_QWORD *)(a4 + 16);
  if (v7 <= v8)
    v9 = *(_QWORD *)(a4 + 16);
  else
    v9 = v7;
  if (!v9)
  {
    v13 = (_QWORD *)MEMORY[0x24BEE4AF8];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_253F3D860);
  v10 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_253F3D8C0) - 8);
  v11 = *(_QWORD *)(v10 + 72);
  v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v13 = (_QWORD *)swift_allocObject();
  v14 = _swift_stdlib_malloc_size(v13);
  if (!v11 || (v14 - v12 == 0x8000000000000000 ? (v15 = v11 == -1) : (v15 = 0), v15))
  {
LABEL_29:
    result = sub_21DBD2530();
    __break(1u);
    return result;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  v16 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_253F3D8C0) - 8);
  v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  v18 = (unint64_t)v13 + v17;
  if ((a1 & 1) != 0)
  {
    if ((unint64_t)v13 < a4 || v18 >= a4 + v17 + *(_QWORD *)(v16 + 72) * v8)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != (_QWORD *)a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_21DBBA430(0, v8, v18, a4);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v13;
}

unint64_t sub_21DBB9C98(unint64_t result, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  unint64_t v11;
  _QWORD *v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;

  v3 = result;
  v4 = a2 + 64;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    result = sub_21DBD24E8();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      do
      {
        v9 = *(_QWORD *)(a2 + 48);
        v10 = (_QWORD *)(v9 + 8 * v6);
        result = sub_21DBD259C();
        v11 = result & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v11 >= v8 && v3 >= (uint64_t)v11)
          {
LABEL_16:
            v14 = (_QWORD *)(v9 + 8 * v3);
            if (v3 != v6 || v14 >= v10 + 1)
              *v14 = *v10;
            v15 = *(_QWORD *)(a2 + 56);
            v16 = (_QWORD *)(v15 + 8 * v3);
            v17 = (_QWORD *)(v15 + 8 * v6);
            if (v3 != v6 || (v3 = v6, v16 >= v17 + 1))
            {
              *v16 = *v17;
              v3 = v6;
            }
          }
        }
        else if (v11 >= v8 || v3 >= (uint64_t)v11)
        {
          goto LABEL_16;
        }
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    v18 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v19 = *v18;
    v20 = (-1 << v3) - 1;
  }
  else
  {
    v18 = (uint64_t *)(v4 + 8 * (result >> 6));
    v20 = *v18;
    v19 = (-1 << result) - 1;
  }
  *v18 = v20 & v19;
  v21 = *(_QWORD *)(a2 + 16);
  v22 = __OFSUB__(v21, 1);
  v23 = v21 - 1;
  if (v22)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v23;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_21DBB9E2C(unint64_t result, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  __int128 v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  _OWORD *v13;
  _OWORD *v14;
  uint64_t v15;
  _OWORD *v16;
  _OWORD *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;

  v3 = result;
  v4 = a2 + 64;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    result = sub_21DBD24E8();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      do
      {
        sub_21DBD25A8();
        swift_bridgeObjectRetain();
        sub_21DBD23C8();
        v10 = sub_21DBD25CC();
        result = swift_bridgeObjectRelease();
        v11 = v10 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v11 < v8)
            goto LABEL_5;
        }
        else if (v11 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v11)
        {
LABEL_11:
          v12 = *(_QWORD *)(a2 + 48);
          v13 = (_OWORD *)(v12 + 16 * v3);
          v14 = (_OWORD *)(v12 + 16 * v6);
          if (v3 != v6 || v13 >= v14 + 1)
            *v13 = *v14;
          v15 = *(_QWORD *)(a2 + 56);
          v16 = (_OWORD *)(v15 + 32 * v3);
          v17 = (_OWORD *)(v15 + 32 * v6);
          if (v3 != v6 || (v3 = v6, v16 >= v17 + 2))
          {
            v9 = v17[1];
            *v16 = *v17;
            v16[1] = v9;
            v3 = v6;
          }
        }
LABEL_5:
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    v18 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v19 = *v18;
    v20 = (-1 << v3) - 1;
  }
  else
  {
    v18 = (uint64_t *)(v4 + 8 * (result >> 6));
    v20 = *v18;
    v19 = (-1 << result) - 1;
  }
  *v18 = v20 & v19;
  v21 = *(_QWORD *)(a2 + 16);
  v22 = __OFSUB__(v21, 1);
  v23 = v21 - 1;
  if (v22)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v23;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_21DBBA000(unint64_t result, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  unint64_t v11;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  int64_t v17;
  int64_t v18;
  unint64_t v19;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  BOOL v25;
  uint64_t v26;

  v3 = result;
  v4 = a2 + 64;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    result = sub_21DBD24E8();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      do
      {
        v9 = *(_QWORD *)(a2 + 48);
        v10 = (_QWORD *)(v9 + 8 * v6);
        result = sub_21DBD259C();
        v11 = result & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v11 < v8 || v3 < (uint64_t)v11)
            goto LABEL_6;
        }
        else if (v11 < v8 && v3 < (uint64_t)v11)
        {
          goto LABEL_6;
        }
        v14 = (_QWORD *)(v9 + 8 * v3);
        if (v3 != v6 || v14 >= v10 + 1)
          *v14 = *v10;
        v15 = *(_QWORD *)(a2 + 56);
        v16 = *(_QWORD *)(*(_QWORD *)(type metadata accessor for ReporterState(0) - 8) + 72);
        v17 = v16 * v3;
        result = v15 + v16 * v3;
        v18 = v16 * v6;
        v19 = v15 + v16 * v6 + v16;
        if (v17 < v18 || result >= v19)
        {
          result = swift_arrayInitWithTakeFrontToBack();
        }
        else
        {
          v3 = v6;
          if (v17 == v18)
            goto LABEL_6;
          result = swift_arrayInitWithTakeBackToFront();
        }
        v3 = v6;
LABEL_6:
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    v21 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v22 = *v21;
    v23 = (-1 << v3) - 1;
  }
  else
  {
    v21 = (uint64_t *)(v4 + 8 * (result >> 6));
    v23 = *v21;
    v22 = (-1 << result) - 1;
  }
  *v21 = v23 & v22;
  v24 = *(_QWORD *)(a2 + 16);
  v25 = __OFSUB__(v24, 1);
  v26 = v24 - 1;
  if (v25)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v26;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

uint64_t sub_21DBBA1BC(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v3;

  v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t __swift_mutable_project_boxed_opaque_existential_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
  {
    swift_makeBoxUnique();
    return v2;
  }
  return result;
}

uint64_t sub_21DBBA220(__int128 *a1, uint64_t a2)
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

uint64_t sub_21DBBA238(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
    v5 = a4 + 40 * a1 + 32;
    v6 = a3 + 40 * v4;
    if (v5 >= v6 || v5 + 40 * v4 <= a3)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_2553A4348);
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  result = sub_21DBD256C();
  __break(1u);
  return result;
}

char *sub_21DBBA348(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
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
    v5 = (char *)(a4 + 4 * a1 + 32);
    v6 = 4 * v4;
    v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }
  result = (char *)sub_21DBD256C();
  __break(1u);
  return result;
}

uint64_t sub_21DBBA430(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v8 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_253F3D8C0) - 8);
    v9 = *(unsigned __int8 *)(v8 + 80);
    v10 = *(_QWORD *)(v8 + 72);
    v11 = a4 + ((v9 + 32) & ~v9) + v10 * a1;
    v12 = v10 * v4;
    v13 = a3 + v12;
    v14 = v11 + v12;
    if (v11 >= v13 || v14 <= a3)
    {
      swift_arrayInitWithCopy();
      return v13;
    }
  }
  result = sub_21DBD256C();
  __break(1u);
  return result;
}

uint64_t sub_21DBBA54C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = MEMORY[0x24BEE4AF8];
  *(_QWORD *)(v1 + 16) = MEMORY[0x24BEE4AF8];
  *(_QWORD *)(v1 + 24) = v3;
  *(_QWORD *)(v1 + 32) = 0;
  *(_QWORD *)(v1 + 40) = 0;
  *(_WORD *)(v1 + 50) = -1;
  v4 = v1 + OBJC_IVAR____TtC14AudioAnalytics9PerfCheck_logger;
  if (qword_253F3D9E8 != -1)
    swift_once();
  v5 = sub_21DBD2320();
  v6 = __swift_project_value_buffer(v5, (uint64_t)qword_253F3DC60);
  v7 = *(_QWORD *)(v5 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(v4, v6, v5);
  if (qword_253F3DA30 != -1)
    swift_once();
  if (byte_253F3DC58 == 1)
  {
    swift_beginAccess();
    *(_QWORD *)(v1 + 24) = a1;
    swift_bridgeObjectRelease();
    *(_BYTE *)(v1 + 48) = 1;
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v4, v5);
    swift_deallocPartialClassInstance();
    return 0;
  }
  return v1;
}

void sub_21DBBA6C4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  unint64_t v11;
  uint64_t inited;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint8_t *v43;
  uint8_t *v44;
  os_log_t v45;
  uint8_t *v46;
  uint8_t *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  os_log_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint8_t *v66;
  NSObject *v67;
  os_log_t v68;
  uint8_t *v69;
  os_log_t v70;
  uint64_t v71;
  uint8_t *v72;
  uint8_t *v73;
  os_log_t v74;
  uint64_t v75;
  uint64_t v76;
  char *v77;
  uint64_t v78;
  uint64_t v79;
  os_log_t v80;
  uint64_t (*v81)();
  uint64_t v82;
  void *v83;
  uint64_t v84;
  uint64_t v85[2];

  v1 = v0;
  v2 = sub_21DBD2320();
  v3 = *(_QWORD *)(v2 - 8);
  v5 = MEMORY[0x24BDAC7A8](v2, v4);
  v7 = (char *)&v71 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5, v8);
  v10 = (char *)&v71 - v9;
  if (*(unsigned __int8 *)(v1 + 48) - 1 >= 2)
  {
    if (qword_253F3DA18 != -1)
      swift_once();
    v25 = __swift_project_value_buffer(v2, (uint64_t)qword_253F3DC78);
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v10, v25, v2);
    v78 = v3;
    v79 = v2;
    v26 = swift_allocObject();
    *(_QWORD *)(v26 + 16) = 0xD00000000000005ALL;
    *(_QWORD *)(v26 + 24) = 0x800000021DBD4F60;
    v27 = swift_allocObject();
    *(_QWORD *)(v27 + 16) = 0x29287472617473;
    *(_QWORD *)(v27 + 24) = 0xE700000000000000;
    v28 = swift_allocObject();
    *(_QWORD *)(v28 + 16) = 31;
    v29 = sub_21DBD2308();
    LODWORD(v80) = sub_21DBD244C();
    v76 = swift_allocObject();
    *(_BYTE *)(v76 + 16) = 32;
    v30 = swift_allocObject();
    v77 = v10;
    v75 = v30;
    *(_BYTE *)(v30 + 16) = 8;
    v31 = swift_allocObject();
    *(_QWORD *)(v31 + 16) = sub_21DBBF664;
    *(_QWORD *)(v31 + 24) = v26;
    v32 = swift_allocObject();
    *(_QWORD *)(v32 + 16) = sub_21DBB6BD4;
    *(_QWORD *)(v32 + 24) = v31;
    v33 = swift_allocObject();
    *(_BYTE *)(v33 + 16) = 32;
    v34 = swift_allocObject();
    *(_BYTE *)(v34 + 16) = 8;
    v35 = swift_allocObject();
    *(_QWORD *)(v35 + 16) = sub_21DBBF668;
    *(_QWORD *)(v35 + 24) = v27;
    v36 = swift_allocObject();
    *(_QWORD *)(v36 + 16) = sub_21DBB6BD4;
    *(_QWORD *)(v36 + 24) = v35;
    v37 = swift_allocObject();
    *(_BYTE *)(v37 + 16) = 0;
    v38 = swift_allocObject();
    *(_BYTE *)(v38 + 16) = 8;
    v39 = swift_allocObject();
    *(_QWORD *)(v39 + 16) = sub_21DBBF754;
    *(_QWORD *)(v39 + 24) = v28;
    v40 = swift_allocObject();
    *(_QWORD *)(v40 + 16) = sub_21DBBF75C;
    *(_QWORD *)(v40 + 24) = v39;
    if (os_log_type_enabled(v29, (os_log_type_t)v80))
    {
      v41 = v32;
      v42 = v75;
      v74 = v29;
      v43 = (uint8_t *)swift_slowAlloc();
      v44 = (uint8_t *)swift_slowAlloc();
      v83 = v44;
      v84 = 0;
      v72 = v43;
      *(_WORD *)v43 = 770;
      v73 = v44;
      v85[0] = (uint64_t)(v43 + 2);
      v81 = sub_21DBBF674;
      v82 = v76;
      sub_21DBB3DBC((uint64_t (**)(uint64_t, uint64_t, uint64_t))&v81, (uint64_t)v85, (uint64_t)&v84, (uint64_t)&v83);
      swift_release();
      v81 = sub_21DBBF674;
      v82 = v42;
      sub_21DBB3DBC((uint64_t (**)(uint64_t, uint64_t, uint64_t))&v81, (uint64_t)v85, (uint64_t)&v84, (uint64_t)&v83);
      swift_release();
      v81 = sub_21DBBF66C;
      v82 = v41;
      sub_21DBB3DBC((uint64_t (**)(uint64_t, uint64_t, uint64_t))&v81, (uint64_t)v85, (uint64_t)&v84, (uint64_t)&v83);
      swift_release();
      v81 = sub_21DBBF674;
      v82 = v33;
      sub_21DBB3DBC((uint64_t (**)(uint64_t, uint64_t, uint64_t))&v81, (uint64_t)v85, (uint64_t)&v84, (uint64_t)&v83);
      swift_release();
      v81 = sub_21DBBF674;
      v82 = v34;
      sub_21DBB3DBC((uint64_t (**)(uint64_t, uint64_t, uint64_t))&v81, (uint64_t)v85, (uint64_t)&v84, (uint64_t)&v83);
      swift_release();
      v81 = sub_21DBBF66C;
      v82 = v36;
      sub_21DBB3DBC((uint64_t (**)(uint64_t, uint64_t, uint64_t))&v81, (uint64_t)v85, (uint64_t)&v84, (uint64_t)&v83);
      swift_release();
      v81 = sub_21DBBF674;
      v82 = v37;
      sub_21DBB3DBC((uint64_t (**)(uint64_t, uint64_t, uint64_t))&v81, (uint64_t)v85, (uint64_t)&v84, (uint64_t)&v83);
      swift_release();
      v81 = sub_21DBBF674;
      v82 = v38;
      sub_21DBB3DBC((uint64_t (**)(uint64_t, uint64_t, uint64_t))&v81, (uint64_t)v85, (uint64_t)&v84, (uint64_t)&v83);
      swift_release();
      v81 = sub_21DBBF670;
      v82 = v40;
      sub_21DBB3DBC((uint64_t (**)(uint64_t, uint64_t, uint64_t))&v81, (uint64_t)v85, (uint64_t)&v84, (uint64_t)&v83);
      swift_release();
      v45 = v74;
      v46 = v72;
      _os_log_impl(&dword_21DBAF000, v74, (os_log_type_t)v80, "PRECONDITION FAILURE { file = %s, function = %s, line = %ld }", v72, 0x20u);
      v47 = v73;
      swift_arrayDestroy();
      MEMORY[0x22079B7C0](v47, -1, -1);
      MEMORY[0x22079B7C0](v46, -1, -1);

    }
    else
    {

      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
    }
    (*(void (**)(char *, uint64_t))(v78 + 8))(v77, v79);
  }
  else
  {
    v11 = *(_QWORD *)(v1 + 16);
    if (v11 >> 62)
    {
      swift_bridgeObjectRetain();
      v48 = sub_21DBD253C();
      swift_bridgeObjectRelease();
      if (!v48)
        goto LABEL_4;
    }
    else if (!*(_QWORD *)((v11 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
LABEL_4:
      __swift_instantiateConcreteTypeFromMangledName(&qword_253F3D868);
      inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_21DBD3330;
      *(_QWORD *)(inited + 32) = 0x705F746E65636572;
      *(_QWORD *)(inited + 40) = 0xEB000000006B6165;
      strcpy((char *)(inited + 48), "kaeptncrpeak_delta");
      *(_BYTE *)(inited + 67) = 0;
      *(_DWORD *)(inited + 68) = -369098752;
      *(_QWORD *)(inited + 72) = *(_QWORD *)"atldkaep__C";
      swift_beginAccess();
      v13 = swift_bridgeObjectRetain();
      v14 = sub_21DBBF0E8(v13, inited);
      swift_bridgeObjectRelease();
      swift_setDeallocating();
      __swift_instantiateConcreteTypeFromMangledName(&qword_253F3D878);
      swift_arrayDestroy();
      *(_QWORD *)(v1 + 16) = v14;
      swift_bridgeObjectRelease();
      swift_retain_n();
      v15 = sub_21DBD2308();
      v16 = sub_21DBD2434();
      if (os_log_type_enabled(v15, v16))
      {
        v17 = swift_slowAlloc();
        v18 = swift_slowAlloc();
        v85[0] = v18;
        *(_DWORD *)v17 = 136315394;
        v19 = swift_bridgeObjectRetain();
        v20 = MEMORY[0x22079B0F4](v19, MEMORY[0x24BEE3F88]);
        v22 = v21;
        swift_bridgeObjectRelease();
        v84 = sub_21DBCECA4(v20, v22, v85);
        sub_21DBD24AC();
        swift_release_n();
        swift_bridgeObjectRelease();
        *(_WORD *)(v17 + 12) = 2048;
        v23 = *(_QWORD *)(v1 + 16);
        if (v23 >> 62)
        {
          swift_bridgeObjectRetain();
          v24 = sub_21DBD253C();
          swift_release();
          swift_bridgeObjectRelease();
        }
        else
        {
          v24 = *(_QWORD *)((v23 & 0xFFFFFFFFFFFFF8) + 0x10);
          swift_release();
        }
        v84 = v24;
        sub_21DBD24AC();
        swift_release();
        _os_log_impl(&dword_21DBAF000, v15, v16, "Begin measuring performance metrics. { pids=%s, pcSessions=%ld }", (uint8_t *)v17, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x22079B7C0](v18, -1, -1);
        MEMORY[0x22079B7C0](v17, -1, -1);

      }
      else
      {

        swift_release_n();
      }
      *(_BYTE *)(v1 + 48) = 0;
      return;
    }
    if (qword_253F3DA18 != -1)
      swift_once();
    v49 = __swift_project_value_buffer(v2, (uint64_t)qword_253F3DC78);
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v7, v49, v2);
    v78 = v3;
    v79 = v2;
    v50 = swift_allocObject();
    *(_QWORD *)(v50 + 16) = 0xD00000000000005ALL;
    *(_QWORD *)(v50 + 24) = 0x800000021DBD4F60;
    v51 = swift_allocObject();
    *(_QWORD *)(v51 + 16) = 0x29287472617473;
    *(_QWORD *)(v51 + 24) = 0xE700000000000000;
    v52 = swift_allocObject();
    *(_QWORD *)(v52 + 16) = 32;
    v80 = (os_log_t)sub_21DBD2308();
    LODWORD(v77) = sub_21DBD244C();
    v76 = swift_allocObject();
    *(_BYTE *)(v76 + 16) = 32;
    v75 = swift_allocObject();
    *(_BYTE *)(v75 + 16) = 8;
    v53 = swift_allocObject();
    *(_QWORD *)(v53 + 16) = sub_21DBBF664;
    *(_QWORD *)(v53 + 24) = v50;
    v54 = swift_allocObject();
    *(_QWORD *)(v54 + 16) = sub_21DBB6BD4;
    *(_QWORD *)(v54 + 24) = v53;
    v55 = swift_allocObject();
    *(_BYTE *)(v55 + 16) = 32;
    v56 = swift_allocObject();
    *(_BYTE *)(v56 + 16) = 8;
    v57 = swift_allocObject();
    *(_QWORD *)(v57 + 16) = sub_21DBBF668;
    *(_QWORD *)(v57 + 24) = v51;
    v58 = swift_allocObject();
    *(_QWORD *)(v58 + 16) = sub_21DBB6BD4;
    *(_QWORD *)(v58 + 24) = v57;
    v59 = swift_allocObject();
    *(_BYTE *)(v59 + 16) = 0;
    v60 = swift_allocObject();
    *(_BYTE *)(v60 + 16) = 8;
    v61 = swift_allocObject();
    *(_QWORD *)(v61 + 16) = sub_21DBBF754;
    *(_QWORD *)(v61 + 24) = v52;
    v62 = v80;
    v63 = swift_allocObject();
    *(_QWORD *)(v63 + 16) = sub_21DBBF75C;
    *(_QWORD *)(v63 + 24) = v61;
    if (os_log_type_enabled(v62, (os_log_type_t)v77))
    {
      v64 = v54;
      v65 = v75;
      v66 = (uint8_t *)swift_slowAlloc();
      v67 = swift_slowAlloc();
      v83 = v67;
      v84 = 0;
      v73 = v66;
      *(_WORD *)v66 = 770;
      v74 = v67;
      v85[0] = (uint64_t)(v66 + 2);
      v81 = sub_21DBBF674;
      v82 = v76;
      sub_21DBB3DBC((uint64_t (**)(uint64_t, uint64_t, uint64_t))&v81, (uint64_t)v85, (uint64_t)&v84, (uint64_t)&v83);
      swift_release();
      v81 = sub_21DBBF674;
      v82 = v65;
      sub_21DBB3DBC((uint64_t (**)(uint64_t, uint64_t, uint64_t))&v81, (uint64_t)v85, (uint64_t)&v84, (uint64_t)&v83);
      swift_release();
      v81 = sub_21DBBF66C;
      v82 = v64;
      sub_21DBB3DBC((uint64_t (**)(uint64_t, uint64_t, uint64_t))&v81, (uint64_t)v85, (uint64_t)&v84, (uint64_t)&v83);
      swift_release();
      v81 = sub_21DBBF674;
      v82 = v55;
      sub_21DBB3DBC((uint64_t (**)(uint64_t, uint64_t, uint64_t))&v81, (uint64_t)v85, (uint64_t)&v84, (uint64_t)&v83);
      swift_release();
      v81 = sub_21DBBF674;
      v82 = v56;
      sub_21DBB3DBC((uint64_t (**)(uint64_t, uint64_t, uint64_t))&v81, (uint64_t)v85, (uint64_t)&v84, (uint64_t)&v83);
      swift_release();
      v81 = sub_21DBBF66C;
      v82 = v58;
      sub_21DBB3DBC((uint64_t (**)(uint64_t, uint64_t, uint64_t))&v81, (uint64_t)v85, (uint64_t)&v84, (uint64_t)&v83);
      swift_release();
      v81 = sub_21DBBF674;
      v82 = v59;
      sub_21DBB3DBC((uint64_t (**)(uint64_t, uint64_t, uint64_t))&v81, (uint64_t)v85, (uint64_t)&v84, (uint64_t)&v83);
      swift_release();
      v81 = sub_21DBBF674;
      v82 = v60;
      sub_21DBB3DBC((uint64_t (**)(uint64_t, uint64_t, uint64_t))&v81, (uint64_t)v85, (uint64_t)&v84, (uint64_t)&v83);
      swift_release();
      v81 = sub_21DBBF670;
      v82 = v63;
      sub_21DBB3DBC((uint64_t (**)(uint64_t, uint64_t, uint64_t))&v81, (uint64_t)v85, (uint64_t)&v84, (uint64_t)&v83);
      swift_release();
      v68 = v80;
      v69 = v73;
      _os_log_impl(&dword_21DBAF000, v80, (os_log_type_t)v77, "PRECONDITION FAILURE { file = %s, function = %s, line = %ld }", v73, 0x20u);
      v70 = v74;
      swift_arrayDestroy();
      MEMORY[0x22079B7C0](v70, -1, -1);
      MEMORY[0x22079B7C0](v69, -1, -1);

    }
    else
    {

      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
    }
    (*(void (**)(char *, uint64_t))(v78 + 8))(v7, v79);
  }
}

unint64_t sub_21DBBB51C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  NSObject *v7;
  os_log_type_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
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
  os_log_type_t v30;
  uint64_t v31;
  uint8_t *v32;
  os_log_t v33;
  uint8_t *v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint8_t *v43;
  int v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  os_log_t v49;
  uint64_t (*v50)();
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint8_t *v54;

  v1 = v0;
  v2 = sub_21DBD2320();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2, v4);
  v6 = (char *)&v39 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(_BYTE *)(v1 + 48))
  {
    if (qword_253F3DA18 != -1)
      swift_once();
    v18 = __swift_project_value_buffer(v2, (uint64_t)qword_253F3DC78);
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v6, v18, v2);
    v19 = swift_allocObject();
    *(_QWORD *)(v19 + 16) = 0xD00000000000005ALL;
    *(_QWORD *)(v19 + 24) = 0x800000021DBD4F60;
    v20 = swift_allocObject();
    *(_QWORD *)(v20 + 16) = 0xD000000000000022;
    *(_QWORD *)(v20 + 24) = 0x800000021DBD4F30;
    v21 = swift_allocObject();
    *(_QWORD *)(v21 + 16) = 52;
    v49 = (os_log_t)sub_21DBD2308();
    v44 = sub_21DBD244C();
    v46 = swift_allocObject();
    *(_BYTE *)(v46 + 16) = 32;
    v45 = swift_allocObject();
    *(_BYTE *)(v45 + 16) = 8;
    v22 = swift_allocObject();
    *(_QWORD *)(v22 + 16) = sub_21DBBECEC;
    *(_QWORD *)(v22 + 24) = v19;
    v23 = swift_allocObject();
    *(_QWORD *)(v23 + 16) = sub_21DBB66FC;
    *(_QWORD *)(v23 + 24) = v22;
    v48 = swift_allocObject();
    *(_BYTE *)(v48 + 16) = 32;
    v47 = swift_allocObject();
    *(_BYTE *)(v47 + 16) = 8;
    v24 = swift_allocObject();
    *(_QWORD *)(v24 + 16) = sub_21DBBECF4;
    *(_QWORD *)(v24 + 24) = v20;
    v25 = swift_allocObject();
    *(_QWORD *)(v25 + 16) = sub_21DBB6BD4;
    *(_QWORD *)(v25 + 24) = v24;
    v26 = swift_allocObject();
    *(_BYTE *)(v26 + 16) = 0;
    v27 = swift_allocObject();
    *(_BYTE *)(v27 + 16) = 8;
    v28 = swift_allocObject();
    *(_QWORD *)(v28 + 16) = sub_21DBBED0C;
    *(_QWORD *)(v28 + 24) = v21;
    v29 = swift_allocObject();
    *(_QWORD *)(v29 + 16) = sub_21DBBED84;
    *(_QWORD *)(v29 + 24) = v28;
    v30 = v44;
    if (os_log_type_enabled(v49, (os_log_type_t)v44))
    {
      v31 = v45;
      v40 = v27;
      v41 = v29;
      v32 = (uint8_t *)swift_slowAlloc();
      v52 = swift_slowAlloc();
      v53 = 0;
      v42 = v52;
      v43 = v32;
      *(_WORD *)v32 = 770;
      v54 = v32 + 2;
      v50 = (uint64_t (*)())sub_21DBBED24;
      v51 = v46;
      sub_21DBB3DBC((uint64_t (**)(uint64_t, uint64_t, uint64_t))&v50, (uint64_t)&v54, (uint64_t)&v53, (uint64_t)&v52);
      swift_release();
      v50 = sub_21DBBF674;
      v51 = v31;
      sub_21DBB3DBC((uint64_t (**)(uint64_t, uint64_t, uint64_t))&v50, (uint64_t)&v54, (uint64_t)&v53, (uint64_t)&v52);
      swift_release();
      v50 = (uint64_t (*)())sub_21DBBED3C;
      v51 = v23;
      sub_21DBB3DBC((uint64_t (**)(uint64_t, uint64_t, uint64_t))&v50, (uint64_t)&v54, (uint64_t)&v53, (uint64_t)&v52);
      swift_release();
      v50 = sub_21DBBF674;
      v51 = v48;
      sub_21DBB3DBC((uint64_t (**)(uint64_t, uint64_t, uint64_t))&v50, (uint64_t)&v54, (uint64_t)&v53, (uint64_t)&v52);
      swift_release();
      v50 = sub_21DBBF674;
      v51 = v47;
      sub_21DBB3DBC((uint64_t (**)(uint64_t, uint64_t, uint64_t))&v50, (uint64_t)&v54, (uint64_t)&v53, (uint64_t)&v52);
      swift_release();
      v50 = sub_21DBBF66C;
      v51 = v25;
      sub_21DBB3DBC((uint64_t (**)(uint64_t, uint64_t, uint64_t))&v50, (uint64_t)&v54, (uint64_t)&v53, (uint64_t)&v52);
      swift_release();
      v50 = sub_21DBBF674;
      v51 = v26;
      sub_21DBB3DBC((uint64_t (**)(uint64_t, uint64_t, uint64_t))&v50, (uint64_t)&v54, (uint64_t)&v53, (uint64_t)&v52);
      swift_release();
      v50 = sub_21DBBF674;
      v51 = v40;
      sub_21DBB3DBC((uint64_t (**)(uint64_t, uint64_t, uint64_t))&v50, (uint64_t)&v54, (uint64_t)&v53, (uint64_t)&v52);
      swift_release();
      v50 = (uint64_t (*)())sub_21DBBED8C;
      v51 = v41;
      sub_21DBB3DBC((uint64_t (**)(uint64_t, uint64_t, uint64_t))&v50, (uint64_t)&v54, (uint64_t)&v53, (uint64_t)&v52);
      swift_release();
      v33 = v49;
      v34 = v43;
      _os_log_impl(&dword_21DBAF000, v49, v30, "PRECONDITION FAILURE { file = %s, function = %s, line = %ld }", v43, 0x20u);
      v35 = v42;
      swift_arrayDestroy();
      MEMORY[0x22079B7C0](v35, -1, -1);
      MEMORY[0x22079B7C0](v34, -1, -1);

LABEL_27:
      (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
      return sub_21DBCC2E0(MEMORY[0x24BEE4AF8]);
    }
LABEL_26:

    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    goto LABEL_27;
  }
  v6 = (char *)(v1 + OBJC_IVAR____TtC14AudioAnalytics9PerfCheck_logger);
  swift_retain_n();
  v7 = sub_21DBD2308();
  v8 = sub_21DBD2434();
  if (os_log_type_enabled(v7, v8))
  {
    v6 = (char *)swift_slowAlloc();
    v9 = swift_slowAlloc();
    v54 = (uint8_t *)v9;
    *(_DWORD *)v6 = 136315394;
    swift_beginAccess();
    v10 = swift_bridgeObjectRetain();
    v11 = MEMORY[0x22079B0F4](v10, MEMORY[0x24BEE3F88]);
    v13 = v12;
    swift_bridgeObjectRelease();
    v53 = sub_21DBCECA4(v11, v13, (uint64_t *)&v54);
    sub_21DBD24AC();
    swift_release_n();
    swift_bridgeObjectRelease();
    *((_WORD *)v6 + 6) = 2048;
    v14 = *(_QWORD *)(v1 + 16);
    if (v14 >> 62)
    {
      swift_bridgeObjectRetain();
      v15 = sub_21DBD253C();
      swift_release();
      swift_bridgeObjectRelease();
    }
    else
    {
      v15 = *(_QWORD *)((v14 & 0xFFFFFFFFFFFFF8) + 0x10);
      swift_release();
    }
    v53 = v15;
    sub_21DBD24AC();
    swift_release();
    _os_log_impl(&dword_21DBAF000, v7, v8, "Collecting performance metrics. { pids=%s, pcSessions=%ld }", (uint8_t *)v6, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x22079B7C0](v9, -1, -1);
    MEMORY[0x22079B7C0](v6, -1, -1);

  }
  else
  {

    swift_release_n();
  }
  v2 = *(_QWORD *)(v1 + 16);
  if ((unint64_t)v2 >> 62)
  {
    if (v2 < 0)
      v6 = *(char **)(v1 + 16);
    else
      v6 = (char *)(v2 & 0xFFFFFFFFFFFFFF8);
    swift_bridgeObjectRetain_n();
    v16 = sub_21DBD253C();
    if (v16)
      goto LABEL_9;
  }
  else
  {
    v16 = *(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain_n();
    if (v16)
    {
LABEL_9:
      if (v16 >= 1)
      {
        for (i = 0; i != v16; ++i)
        {
          if ((v2 & 0xC000000000000001) != 0)
            MEMORY[0x22079B208](i, v2);
          else
            swift_retain();
          sub_21DBBD8E8();
          swift_release();
        }
        goto LABEL_23;
      }
      __break(1u);
      goto LABEL_26;
    }
  }
LABEL_23:
  swift_bridgeObjectRelease_n();
  v36 = *(_QWORD *)(v1 + 16);
  swift_retain();
  swift_bridgeObjectRetain();
  v37 = sub_21DBBF214(MEMORY[0x24BEE4B00], v36, v1);
  swift_bridgeObjectRelease();
  swift_release();
  *(_QWORD *)(v1 + 16) = MEMORY[0x24BEE4AF8];
  swift_bridgeObjectRelease();
  *(_BYTE *)(v1 + 48) = 1;
  return v37;
}

uint64_t sub_21DBBBDD0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v5;
  uint64_t inited;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t result;
  _QWORD v22[4];

  v5 = 0x6E776F6E6B6E75;
  __swift_instantiateConcreteTypeFromMangledName(&qword_253F3D8D0);
  inited = swift_initStackObject();
  v7 = (_QWORD *)inited;
  *(_OWORD *)(inited + 16) = xmmword_21DBD3330;
  *(_QWORD *)(inited + 32) = 0xD000000000000018;
  *(_QWORD *)(inited + 40) = 0x800000021DBD4F10;
  v8 = *(_QWORD *)(a3 + 32);
  v9 = *(_QWORD *)(a3 + 40);
  v10 = MEMORY[0x24BEE0D00];
  if (!v9)
    v8 = 0x6E776F6E6B6E75;
  v11 = 0xE700000000000000;
  if (v9)
    v11 = *(_QWORD *)(a3 + 40);
  *(_QWORD *)(inited + 48) = v8;
  *(_QWORD *)(inited + 56) = v11;
  *(_QWORD *)(inited + 72) = v10;
  *(_QWORD *)(inited + 80) = 0x5465636976726573;
  *(_QWORD *)(inited + 88) = 0xEB00000000657079;
  v12 = AudioServiceType.description.getter(*(_WORD *)(a3 + 50));
  v7[15] = v10;
  v7[12] = v12;
  v7[13] = v13;
  swift_bridgeObjectRetain();
  v14 = sub_21DBCC2E0((uint64_t)v7);
  sub_21DBBE038();
  v16 = sub_21DBB2A5C(v15);
  swift_bridgeObjectRelease();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v22[0] = v14;
  sub_21DBBED94(v16, (uint64_t)sub_21DBCAFE8, 0, isUniquelyReferenced_nonNull_native, (uint64_t)v22);
  if (v3)
  {
    result = swift_bridgeObjectRelease();
    __break(1u);
  }
  else
  {
    v18 = v22[0];
    swift_bridgeObjectRelease();
    if (pc_session_get_procname())
    {
      v5 = sub_21DBD23E0();
      v20 = v19;
    }
    else
    {
      v20 = 0xE700000000000000;
    }
    v22[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_253F3D870);
    v22[0] = v18;
    return sub_21DBC1B2C((uint64_t)v22, v5, v20);
  }
  return result;
}

uint64_t sub_21DBBBF80()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t result;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
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
  uint8_t *v26;
  os_log_t v27;
  uint8_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint8_t *v31;
  uint64_t v32;
  os_log_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  int v39;
  uint64_t (*v40)();
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint8_t *v44;

  v1 = sub_21DBD2320();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1, v3);
  v5 = (char *)&v30 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(unsigned __int8 *)(v0 + 48) >= 2u)
  {
    if (qword_253F3DA18 != -1)
      swift_once();
    v7 = __swift_project_value_buffer(v1, (uint64_t)qword_253F3DC78);
    (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v5, v7, v1);
    v36 = v2;
    v8 = swift_allocObject();
    *(_QWORD *)(v8 + 16) = 0xD00000000000005ALL;
    *(_QWORD *)(v8 + 24) = 0x800000021DBD4F60;
    v9 = swift_allocObject();
    *(_QWORD *)(v9 + 16) = 0x286E6F646E616261;
    *(_QWORD *)(v9 + 24) = 0xE900000000000029;
    v10 = swift_allocObject();
    v38 = v1;
    v11 = v10;
    *(_QWORD *)(v10 + 16) = 75;
    v12 = sub_21DBD2308();
    v39 = sub_21DBD244C();
    v35 = swift_allocObject();
    *(_BYTE *)(v35 + 16) = 32;
    v13 = swift_allocObject();
    v37 = v5;
    v34 = v13;
    *(_BYTE *)(v13 + 16) = 8;
    v14 = swift_allocObject();
    *(_QWORD *)(v14 + 16) = sub_21DBBF664;
    *(_QWORD *)(v14 + 24) = v8;
    v15 = swift_allocObject();
    *(_QWORD *)(v15 + 16) = sub_21DBB6BD4;
    *(_QWORD *)(v15 + 24) = v14;
    v16 = swift_allocObject();
    *(_BYTE *)(v16 + 16) = 32;
    v17 = swift_allocObject();
    *(_BYTE *)(v17 + 16) = 8;
    v18 = swift_allocObject();
    *(_QWORD *)(v18 + 16) = sub_21DBBF668;
    *(_QWORD *)(v18 + 24) = v9;
    v19 = swift_allocObject();
    *(_QWORD *)(v19 + 16) = sub_21DBB6BD4;
    *(_QWORD *)(v19 + 24) = v18;
    v20 = swift_allocObject();
    *(_BYTE *)(v20 + 16) = 0;
    v21 = swift_allocObject();
    *(_BYTE *)(v21 + 16) = 8;
    v22 = swift_allocObject();
    *(_QWORD *)(v22 + 16) = sub_21DBBF754;
    *(_QWORD *)(v22 + 24) = v11;
    v23 = swift_allocObject();
    *(_QWORD *)(v23 + 16) = sub_21DBBF75C;
    *(_QWORD *)(v23 + 24) = v22;
    if (os_log_type_enabled(v12, (os_log_type_t)v39))
    {
      v24 = v15;
      v25 = v34;
      v33 = v12;
      v26 = (uint8_t *)swift_slowAlloc();
      v42 = swift_slowAlloc();
      v43 = 0;
      v31 = v26;
      v32 = v42;
      *(_WORD *)v26 = 770;
      v44 = v26 + 2;
      v40 = sub_21DBBF674;
      v41 = v35;
      sub_21DBB3DBC((uint64_t (**)(uint64_t, uint64_t, uint64_t))&v40, (uint64_t)&v44, (uint64_t)&v43, (uint64_t)&v42);
      swift_release();
      v40 = sub_21DBBF674;
      v41 = v25;
      sub_21DBB3DBC((uint64_t (**)(uint64_t, uint64_t, uint64_t))&v40, (uint64_t)&v44, (uint64_t)&v43, (uint64_t)&v42);
      swift_release();
      v40 = sub_21DBBF66C;
      v41 = v24;
      sub_21DBB3DBC((uint64_t (**)(uint64_t, uint64_t, uint64_t))&v40, (uint64_t)&v44, (uint64_t)&v43, (uint64_t)&v42);
      swift_release();
      v40 = sub_21DBBF674;
      v41 = v16;
      sub_21DBB3DBC((uint64_t (**)(uint64_t, uint64_t, uint64_t))&v40, (uint64_t)&v44, (uint64_t)&v43, (uint64_t)&v42);
      swift_release();
      v40 = sub_21DBBF674;
      v41 = v17;
      sub_21DBB3DBC((uint64_t (**)(uint64_t, uint64_t, uint64_t))&v40, (uint64_t)&v44, (uint64_t)&v43, (uint64_t)&v42);
      swift_release();
      v40 = sub_21DBBF66C;
      v41 = v19;
      sub_21DBB3DBC((uint64_t (**)(uint64_t, uint64_t, uint64_t))&v40, (uint64_t)&v44, (uint64_t)&v43, (uint64_t)&v42);
      swift_release();
      v40 = sub_21DBBF674;
      v41 = v20;
      sub_21DBB3DBC((uint64_t (**)(uint64_t, uint64_t, uint64_t))&v40, (uint64_t)&v44, (uint64_t)&v43, (uint64_t)&v42);
      swift_release();
      v40 = sub_21DBBF674;
      v41 = v21;
      sub_21DBB3DBC((uint64_t (**)(uint64_t, uint64_t, uint64_t))&v40, (uint64_t)&v44, (uint64_t)&v43, (uint64_t)&v42);
      swift_release();
      v40 = sub_21DBBF670;
      v41 = v23;
      sub_21DBB3DBC((uint64_t (**)(uint64_t, uint64_t, uint64_t))&v40, (uint64_t)&v44, (uint64_t)&v43, (uint64_t)&v42);
      swift_release();
      v27 = v33;
      v28 = v31;
      _os_log_impl(&dword_21DBAF000, v33, (os_log_type_t)v39, "PRECONDITION FAILURE { file = %s, function = %s, line = %ld }", v31, 0x20u);
      v29 = v32;
      swift_arrayDestroy();
      MEMORY[0x22079B7C0](v29, -1, -1);
      MEMORY[0x22079B7C0](v28, -1, -1);

    }
    else
    {

      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
    }
    return (*(uint64_t (**)(char *, uint64_t))(v36 + 8))(v37, v38);
  }
  else
  {
    *(_QWORD *)(v0 + 16) = MEMORY[0x24BEE4AF8];
    result = swift_bridgeObjectRelease();
    *(_BYTE *)(v0 + 48) = 2;
  }
  return result;
}

uint64_t sub_21DBBC560(uint64_t result, __int16 a2)
{
  uint64_t v2;
  uint64_t v3;
  char v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE v8[32];

  v3 = result;
  *(_WORD *)(v2 + 50) = a2;
  if (*(_QWORD *)(result + 16))
  {
    result = sub_21DBCF33C(0xD000000000000018, 0x800000021DBD4EF0);
    if ((v4 & 1) != 0)
    {
      sub_21DBB4014(*(_QWORD *)(v3 + 56) + 32 * result, (uint64_t)v8);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2553A4360);
      result = swift_dynamicCast();
      if ((result & 1) != 0)
      {
        swift_beginAccess();
        sub_21DBBC6A4(v6);
        result = swift_endAccess();
      }
    }
  }
  if (*(_QWORD *)(v3 + 16))
  {
    result = sub_21DBCF33C(0xD000000000000018, 0x800000021DBD4F10);
    if ((v5 & 1) != 0)
    {
      sub_21DBB4014(*(_QWORD *)(v3 + 56) + 32 * result, (uint64_t)v8);
      result = swift_dynamicCast();
      if ((result & 1) != 0)
      {
        *(_QWORD *)(v2 + 32) = v6;
        *(_QWORD *)(v2 + 40) = v7;
        return swift_bridgeObjectRelease();
      }
    }
  }
  return result;
}

uint64_t sub_21DBBC6A4(uint64_t a1)
{
  char **v1;
  unint64_t v2;
  char *v3;
  int64_t v4;
  int64_t v5;
  char *isUniquelyReferenced_nonNull_native;
  unint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  int64_t v15;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 16);
  v3 = *v1;
  v4 = *((_QWORD *)*v1 + 2);
  v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
    goto LABEL_21;
  }
  isUniquelyReferenced_nonNull_native = (char *)swift_isUniquelyReferenced_nonNull_native();
  if ((_DWORD)isUniquelyReferenced_nonNull_native && v5 <= *((_QWORD *)v3 + 3) >> 1)
  {
    v8 = *(_QWORD *)(a1 + 16);
    if (v8)
      goto LABEL_5;
LABEL_18:
    if (!v2)
      goto LABEL_19;
    goto LABEL_21;
  }
  if (v4 <= v5)
    v15 = v4 + v2;
  else
    v15 = v4;
  v3 = sub_21DBB985C(isUniquelyReferenced_nonNull_native, v15, 1, v3);
  v8 = *(_QWORD *)(a1 + 16);
  if (!v8)
    goto LABEL_18;
LABEL_5:
  v9 = *((_QWORD *)v3 + 2);
  if ((*((_QWORD *)v3 + 3) >> 1) - v9 < (uint64_t)v8)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  v10 = &v3[4 * v9 + 32];
  if (a1 + 32 < (unint64_t)&v10[4 * v8] && (unint64_t)v10 < a1 + 32 + 4 * v8)
    goto LABEL_24;
  memcpy(v10, (const void *)(a1 + 32), 4 * v8);
  if (v8 < v2)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  v12 = *((_QWORD *)v3 + 2);
  v13 = __OFADD__(v12, v8);
  v14 = v12 + v8;
  if (!v13)
  {
    *((_QWORD *)v3 + 2) = v14;
LABEL_19:
    result = swift_bridgeObjectRelease();
    *v1 = v3;
    return result;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  result = sub_21DBD256C();
  __break(1u);
  return result;
}

uint64_t sub_21DBBC7F4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v1 = v0 + OBJC_IVAR____TtC14AudioAnalytics9PerfCheck_logger;
  v2 = sub_21DBD2320();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return swift_deallocClassInstance();
}

uint64_t sub_21DBBC85C()
{
  return type metadata accessor for PerfCheck();
}

uint64_t type metadata accessor for PerfCheck()
{
  uint64_t result;

  result = qword_253F3DAA8;
  if (!qword_253F3DAA8)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_21DBBC8A0()
{
  uint64_t result;
  unint64_t v1;

  result = sub_21DBD2320();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

char *sub_21DBBC940()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  uint64_t v18;
  char *result;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  NSObject *v23;
  os_log_type_t v24;
  uint8_t *v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  int v31;
  uint64_t v32[2];

  v1 = v0;
  v32[1] = *MEMORY[0x24BDAC8D0];
  v2 = sub_21DBD2320();
  v3 = *(_QWORD *)(v2 - 8);
  v5 = MEMORY[0x24BDAC7A8](v2, v4);
  v7 = (char *)&v29 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5, v8);
  v10 = (char *)&v29 - v9;
  v31 = sub_21DBD232C();
  sub_21DBD2338();
  sub_21DBD2338();
  v11 = pc_session_create();
  if (!v11 || (v12 = v11, v13 = v31, v13 != sub_21DBD232C()))
  {
    if (qword_253F3D9E8 != -1)
      swift_once();
    v14 = __swift_project_value_buffer(v2, (uint64_t)qword_253F3DC60);
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v7, v14, v2);
    v15 = sub_21DBD2308();
    v16 = sub_21DBD2434();
    if (os_log_type_enabled(v15, v16))
    {
      v17 = (uint8_t *)swift_slowAlloc();
      v18 = swift_slowAlloc();
      v32[0] = v18;
      *(_DWORD *)v17 = 136380675;
      swift_beginAccess();
      result = strerror(v31);
      if (!result)
      {
        __break(1u);
        goto LABEL_20;
      }
      v20 = sub_21DBD23E0();
      v30 = sub_21DBCECA4(v20, v21, v32);
      sub_21DBD24AC();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_21DBAF000, v15, v16, "pc_session_create failed. { ret=%{private}s }.", v17, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x22079B7C0](v18, -1, -1);
      MEMORY[0x22079B7C0](v17, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v3 + 8))(v7, v2);
LABEL_11:
    type metadata accessor for PCSession();
    swift_deallocPartialClassInstance();
    return 0;
  }
  v31 = pc_session_set_procpid();
  if (v31 == sub_21DBD232C())
  {
    *(_QWORD *)(v1 + 16) = v12;
    *(_BYTE *)(v1 + 24) = 0;
    return (char *)v1;
  }
  if (qword_253F3D9E8 != -1)
    swift_once();
  v22 = __swift_project_value_buffer(v2, (uint64_t)qword_253F3DC60);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v10, v22, v2);
  v23 = sub_21DBD2308();
  v24 = sub_21DBD2434();
  if (!os_log_type_enabled(v23, v24))
    goto LABEL_18;
  v25 = (uint8_t *)swift_slowAlloc();
  v26 = swift_slowAlloc();
  v32[0] = v26;
  *(_DWORD *)v25 = 136380675;
  swift_beginAccess();
  result = strerror(v31);
  if (result)
  {
    v27 = sub_21DBD23E0();
    v30 = sub_21DBCECA4(v27, v28, v32);
    sub_21DBD24AC();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21DBAF000, v23, v24, "pc_session_set_procpid failed. { ret=%{private}s }.", v25, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x22079B7C0](v26, -1, -1);
    MEMORY[0x22079B7C0](v25, -1, -1);
LABEL_18:

    (*(void (**)(char *, uint64_t))(v3 + 8))(v10, v2);
    goto LABEL_11;
  }
LABEL_20:
  __break(1u);
  return result;
}

char *sub_21DBBCD64()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  int v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  uint64_t v12;
  char *result;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v1 = v0;
  v2 = sub_21DBD2320();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2, v4);
  v6 = (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = pc_session_destroy();
  if (v7 == sub_21DBD232C())
    return (char *)v1;
  if (qword_253F3D9E8 != -1)
    swift_once();
  v8 = __swift_project_value_buffer(v2, (uint64_t)qword_253F3DC60);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v6, v8, v2);
  v9 = sub_21DBD2308();
  v10 = sub_21DBD2434();
  if (!os_log_type_enabled(v9, v10))
  {
LABEL_7:

    (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
    return (char *)v1;
  }
  v11 = (uint8_t *)swift_slowAlloc();
  v12 = swift_slowAlloc();
  v17 = v12;
  *(_DWORD *)v11 = 136380675;
  result = strerror(v7);
  if (result)
  {
    v14 = sub_21DBD23E0();
    v16 = sub_21DBCECA4(v14, v15, &v17);
    sub_21DBD24AC();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21DBAF000, v9, v10, "pc_session_destroy failed, { ret=%{private}s }", v11, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x22079B7C0](v12, -1, -1);
    MEMORY[0x22079B7C0](v11, -1, -1);
    goto LABEL_7;
  }
  __break(1u);
  return result;
}

uint64_t sub_21DBBCF50()
{
  sub_21DBBCD64();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for PCSession()
{
  return objc_opt_self();
}

void sub_21DBBCF8C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  uint64_t v16;
  unint64_t v17;
  int v18;
  NSObject *v19;
  os_log_type_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t, uint64_t);
  uint64_t (*v25)(uint64_t, uint64_t, uint64_t);
  uint64_t v26;
  void *v27;
  uint64_t v28;
  NSObject *v29;
  os_log_type_t v30;
  uint8_t *v31;
  uint64_t (*v32)(uint64_t, uint64_t, uint64_t);
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
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
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  char *v53;
  uint64_t v54;
  uint8_t *v55;
  uint64_t v56;
  void *v57;
  uint8_t *v58;
  uint64_t v59;
  uint8_t *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  char *v66;
  uint64_t v67;
  __int128 v68;
  uint64_t v69;
  uint64_t (*v70)();
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;

  v3 = sub_21DBD2320();
  v4 = *(_QWORD *)(v3 - 8);
  v6 = MEMORY[0x24BDAC7A8](v3, v5);
  v66 = (char *)&v60 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6, v8);
  v10 = (char *)&v60 - v9;
  if (*(_BYTE *)(v1 + 24))
  {
    if (qword_253F3DA18 != -1)
      swift_once();
    v35 = __swift_project_value_buffer(v3, (uint64_t)qword_253F3DC78);
    (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v10, v35, v3);
    v36 = swift_allocObject();
    *(_QWORD *)(v36 + 16) = 0xD00000000000005ALL;
    *(_QWORD *)(v36 + 24) = 0x800000021DBD4F60;
    v37 = swift_allocObject();
    strcpy((char *)(v37 + 16), "begin(with:)");
    *(_BYTE *)(v37 + 29) = 0;
    *(_WORD *)(v37 + 30) = -5120;
    v38 = swift_allocObject();
    *(_QWORD *)(v38 + 16) = 161;
    *(_QWORD *)&v68 = sub_21DBD2308();
    v39 = sub_21DBD244C();
    v40 = swift_allocObject();
    v69 = v3;
    v67 = v40;
    *(_BYTE *)(v40 + 16) = 32;
    v41 = swift_allocObject();
    v65 = v4;
    v66 = (char *)v41;
    *(_BYTE *)(v41 + 16) = 8;
    v42 = swift_allocObject();
    *(_QWORD *)(v42 + 16) = sub_21DBBF664;
    *(_QWORD *)(v42 + 24) = v36;
    v43 = swift_allocObject();
    *(_QWORD *)(v43 + 16) = sub_21DBB6BD4;
    *(_QWORD *)(v43 + 24) = v42;
    v44 = swift_allocObject();
    *(_BYTE *)(v44 + 16) = 32;
    v45 = swift_allocObject();
    *(_BYTE *)(v45 + 16) = 8;
    v46 = swift_allocObject();
    *(_QWORD *)(v46 + 16) = sub_21DBBF668;
    *(_QWORD *)(v46 + 24) = v37;
    v47 = swift_allocObject();
    *(_QWORD *)(v47 + 16) = sub_21DBB6BD4;
    *(_QWORD *)(v47 + 24) = v46;
    v48 = swift_allocObject();
    *(_BYTE *)(v48 + 16) = 0;
    v49 = swift_allocObject();
    *(_BYTE *)(v49 + 16) = 8;
    v50 = swift_allocObject();
    *(_QWORD *)(v50 + 16) = sub_21DBBF754;
    *(_QWORD *)(v50 + 24) = v38;
    v51 = swift_allocObject();
    *(_QWORD *)(v51 + 16) = sub_21DBBF75C;
    *(_QWORD *)(v51 + 24) = v50;
    v52 = (void *)v68;
    LODWORD(v64) = v39;
    if (os_log_type_enabled((os_log_t)v68, (os_log_type_t)v39))
    {
      v53 = v66;
      v61 = v49;
      v62 = v51;
      v54 = v69;
      v55 = (uint8_t *)swift_slowAlloc();
      v56 = swift_slowAlloc();
      v72 = v56;
      v73 = 0;
      v60 = v55;
      *(_WORD *)v55 = 770;
      v63 = v56;
      v74 = (uint64_t)(v55 + 2);
      v70 = sub_21DBBF674;
      v71 = v67;
      sub_21DBB3DBC((uint64_t (**)(uint64_t, uint64_t, uint64_t))&v70, (uint64_t)&v74, (uint64_t)&v73, (uint64_t)&v72);
      swift_release();
      v70 = sub_21DBBF674;
      v71 = (uint64_t)v53;
      sub_21DBB3DBC((uint64_t (**)(uint64_t, uint64_t, uint64_t))&v70, (uint64_t)&v74, (uint64_t)&v73, (uint64_t)&v72);
      swift_release();
      v70 = sub_21DBBF66C;
      v71 = v43;
      sub_21DBB3DBC((uint64_t (**)(uint64_t, uint64_t, uint64_t))&v70, (uint64_t)&v74, (uint64_t)&v73, (uint64_t)&v72);
      swift_release();
      v70 = sub_21DBBF674;
      v71 = v44;
      sub_21DBB3DBC((uint64_t (**)(uint64_t, uint64_t, uint64_t))&v70, (uint64_t)&v74, (uint64_t)&v73, (uint64_t)&v72);
      swift_release();
      v70 = sub_21DBBF674;
      v71 = v45;
      sub_21DBB3DBC((uint64_t (**)(uint64_t, uint64_t, uint64_t))&v70, (uint64_t)&v74, (uint64_t)&v73, (uint64_t)&v72);
      swift_release();
      v70 = sub_21DBBF66C;
      v71 = v47;
      sub_21DBB3DBC((uint64_t (**)(uint64_t, uint64_t, uint64_t))&v70, (uint64_t)&v74, (uint64_t)&v73, (uint64_t)&v72);
      swift_release();
      v70 = sub_21DBBF674;
      v71 = v48;
      sub_21DBB3DBC((uint64_t (**)(uint64_t, uint64_t, uint64_t))&v70, (uint64_t)&v74, (uint64_t)&v73, (uint64_t)&v72);
      swift_release();
      v70 = sub_21DBBF674;
      v71 = v61;
      sub_21DBB3DBC((uint64_t (**)(uint64_t, uint64_t, uint64_t))&v70, (uint64_t)&v74, (uint64_t)&v73, (uint64_t)&v72);
      swift_release();
      v70 = sub_21DBBF670;
      v71 = v62;
      sub_21DBB3DBC((uint64_t (**)(uint64_t, uint64_t, uint64_t))&v70, (uint64_t)&v74, (uint64_t)&v73, (uint64_t)&v72);
      swift_release();
      v57 = (void *)v68;
      v58 = v60;
      _os_log_impl(&dword_21DBAF000, (os_log_t)v68, (os_log_type_t)v64, "PRECONDITION FAILURE { file = %s, function = %s, line = %ld }", v60, 0x20u);
      v59 = v63;
      swift_arrayDestroy();
      MEMORY[0x22079B7C0](v59, -1, -1);
      MEMORY[0x22079B7C0](v58, -1, -1);

      (*(void (**)(char *, uint64_t))(v65 + 8))(v10, v54);
    }
    else
    {

      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      (*(void (**)(char *, uint64_t))(v65 + 8))(v10, v69);
    }
  }
  else
  {
    v11 = *(_QWORD *)(a1 + 16);
    v12 = 0x253F3D000uLL;
    if (v11)
    {
      v64 = v1;
      v65 = v4;
      v13 = *(_QWORD *)(v1 + 16);
      swift_bridgeObjectRetain();
      v63 = a1;
      v14 = a1 + 48;
      *(_QWORD *)&v15 = 136380675;
      v68 = v15;
      v67 = MEMORY[0x24BEE4AD8] + 8;
      v69 = v3;
      do
      {
        v16 = *(_QWORD *)(v14 - 16);
        v17 = *(_QWORD *)(v14 - 8);
        swift_bridgeObjectRetain();
        v18 = pc_session_add_metric();
        if (v18 == sub_21DBD232C())
        {
          swift_bridgeObjectRelease();
        }
        else
        {
          if (*(_QWORD *)(v12 + 2536) != -1)
            swift_once();
          __swift_project_value_buffer(v3, (uint64_t)qword_253F3DC60);
          swift_bridgeObjectRetain();
          v19 = sub_21DBD2308();
          v20 = sub_21DBD2434();
          if (os_log_type_enabled(v19, v20))
          {
            v21 = swift_slowAlloc();
            v22 = v13;
            v23 = v12;
            v24 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))swift_slowAlloc();
            v70 = (uint64_t (*)())v24;
            *(_DWORD *)v21 = v68;
            swift_bridgeObjectRetain();
            *(_QWORD *)(v21 + 4) = sub_21DBCECA4(v16, v17, (uint64_t *)&v70);
            swift_bridgeObjectRelease_n();
            _os_log_impl(&dword_21DBAF000, v19, v20, "pc_session_add_metric failed. { metric=%{private}s }", (uint8_t *)v21, 0xCu);
            swift_arrayDestroy();
            v25 = v24;
            v12 = v23;
            v13 = v22;
            MEMORY[0x22079B7C0](v25, -1, -1);
            v26 = v21;
            v3 = v69;
            MEMORY[0x22079B7C0](v26, -1, -1);

          }
          else
          {

            swift_bridgeObjectRelease_n();
          }
        }
        v14 += 24;
        --v11;
      }
      while (v11);
      swift_bridgeObjectRelease();
      v1 = v64;
      v4 = v65;
    }
    v27 = (void *)pc_session_begin();
    if ((_DWORD)v27 == sub_21DBD232C())
    {
      *(_BYTE *)(v1 + 24) = 1;
      return;
    }
    if (*(_QWORD *)(v12 + 2536) != -1)
      swift_once();
    v28 = __swift_project_value_buffer(v3, (uint64_t)qword_253F3DC60);
    (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v66, v28, v3);
    v29 = sub_21DBD2308();
    v30 = sub_21DBD2434();
    if (!os_log_type_enabled(v29, v30))
      goto LABEL_20;
    v31 = (uint8_t *)swift_slowAlloc();
    v32 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))swift_slowAlloc();
    v70 = (uint64_t (*)())v32;
    *(_DWORD *)v31 = 136380675;
    if (strerror((int)v27))
    {
      v33 = sub_21DBD23E0();
      v74 = sub_21DBCECA4(v33, v34, (uint64_t *)&v70);
      sub_21DBD24AC();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_21DBAF000, v29, v30, "pc_session_begin failed. { ret=%{private}s }", v31, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x22079B7C0](v32, -1, -1);
      MEMORY[0x22079B7C0](v31, -1, -1);
LABEL_20:

      (*(void (**)(char *, uint64_t))(v4 + 8))(v66, v3);
      return;
    }
    __break(1u);

    __break(1u);
  }
}

void sub_21DBBD8E8()
{
  _BYTE *v0;
  _BYTE *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  uint64_t (*v16)(uint64_t, uint64_t, uint64_t);
  uint64_t v17;
  unint64_t v18;
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
  os_log_type_t v31;
  uint64_t v32;
  uint8_t *v33;
  os_log_t v34;
  uint8_t *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint8_t *v40;
  int v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  os_log_t v46;
  uint64_t (*v47)();
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;

  v1 = v0;
  v2 = sub_21DBD2320();
  v3 = *(_QWORD *)(v2 - 8);
  v5 = MEMORY[0x24BDAC7A8](v2, v4);
  v7 = (char *)&v37 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5, v8);
  v10 = (char *)&v37 - v9;
  if (v1[24] == 1)
  {
    v11 = pc_session_end();
    if (v11 == sub_21DBD232C())
    {
LABEL_9:
      v1[24] = 2;
      return;
    }
    if (qword_253F3D9E8 != -1)
      swift_once();
    v12 = __swift_project_value_buffer(v2, (uint64_t)qword_253F3DC60);
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v7, v12, v2);
    v13 = sub_21DBD2308();
    v14 = sub_21DBD2434();
    if (!os_log_type_enabled(v13, v14))
    {
LABEL_8:

      (*(void (**)(char *, uint64_t))(v3 + 8))(v7, v2);
      goto LABEL_9;
    }
    v15 = (uint8_t *)swift_slowAlloc();
    v16 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))swift_slowAlloc();
    v47 = (uint64_t (*)())v16;
    *(_DWORD *)v15 = 136380675;
    if (strerror(v11))
    {
      v17 = sub_21DBD23E0();
      v51 = sub_21DBCECA4(v17, v18, (uint64_t *)&v47);
      sub_21DBD24AC();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_21DBAF000, v13, v14, "pc_session_end failed. { ret=%{private}s }", v15, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x22079B7C0](v16, -1, -1);
      MEMORY[0x22079B7C0](v15, -1, -1);
      goto LABEL_8;
    }
    __break(1u);

    __break(1u);
  }
  else
  {
    if (qword_253F3DA18 != -1)
      swift_once();
    v19 = __swift_project_value_buffer(v2, (uint64_t)qword_253F3DC78);
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v10, v19, v2);
    v20 = swift_allocObject();
    *(_QWORD *)(v20 + 16) = 0xD00000000000005ALL;
    *(_QWORD *)(v20 + 24) = 0x800000021DBD4F60;
    v21 = swift_allocObject();
    *(_QWORD *)(v21 + 16) = 0x2928646E65;
    *(_QWORD *)(v21 + 24) = 0xE500000000000000;
    v22 = swift_allocObject();
    *(_QWORD *)(v22 + 16) = 181;
    v46 = (os_log_t)sub_21DBD2308();
    v41 = sub_21DBD244C();
    v43 = swift_allocObject();
    *(_BYTE *)(v43 + 16) = 32;
    v42 = swift_allocObject();
    *(_BYTE *)(v42 + 16) = 8;
    v23 = swift_allocObject();
    *(_QWORD *)(v23 + 16) = sub_21DBBF664;
    *(_QWORD *)(v23 + 24) = v20;
    v24 = swift_allocObject();
    *(_QWORD *)(v24 + 16) = sub_21DBB6BD4;
    *(_QWORD *)(v24 + 24) = v23;
    v45 = swift_allocObject();
    *(_BYTE *)(v45 + 16) = 32;
    v44 = swift_allocObject();
    *(_BYTE *)(v44 + 16) = 8;
    v25 = swift_allocObject();
    *(_QWORD *)(v25 + 16) = sub_21DBBF668;
    *(_QWORD *)(v25 + 24) = v21;
    v26 = swift_allocObject();
    *(_QWORD *)(v26 + 16) = sub_21DBB6BD4;
    *(_QWORD *)(v26 + 24) = v25;
    v27 = swift_allocObject();
    *(_BYTE *)(v27 + 16) = 0;
    v28 = swift_allocObject();
    *(_BYTE *)(v28 + 16) = 8;
    v29 = swift_allocObject();
    *(_QWORD *)(v29 + 16) = sub_21DBBF754;
    *(_QWORD *)(v29 + 24) = v22;
    v30 = swift_allocObject();
    *(_QWORD *)(v30 + 16) = sub_21DBBF75C;
    *(_QWORD *)(v30 + 24) = v29;
    v31 = v41;
    if (os_log_type_enabled(v46, (os_log_type_t)v41))
    {
      v32 = v42;
      v37 = v28;
      v38 = v30;
      v33 = (uint8_t *)swift_slowAlloc();
      v49 = swift_slowAlloc();
      v50 = 0;
      v39 = v49;
      v40 = v33;
      *(_WORD *)v33 = 770;
      v51 = (uint64_t)(v33 + 2);
      v47 = sub_21DBBF674;
      v48 = v43;
      sub_21DBB3DBC((uint64_t (**)(uint64_t, uint64_t, uint64_t))&v47, (uint64_t)&v51, (uint64_t)&v50, (uint64_t)&v49);
      swift_release();
      v47 = sub_21DBBF674;
      v48 = v32;
      sub_21DBB3DBC((uint64_t (**)(uint64_t, uint64_t, uint64_t))&v47, (uint64_t)&v51, (uint64_t)&v50, (uint64_t)&v49);
      swift_release();
      v47 = sub_21DBBF66C;
      v48 = v24;
      sub_21DBB3DBC((uint64_t (**)(uint64_t, uint64_t, uint64_t))&v47, (uint64_t)&v51, (uint64_t)&v50, (uint64_t)&v49);
      swift_release();
      v47 = sub_21DBBF674;
      v48 = v45;
      sub_21DBB3DBC((uint64_t (**)(uint64_t, uint64_t, uint64_t))&v47, (uint64_t)&v51, (uint64_t)&v50, (uint64_t)&v49);
      swift_release();
      v47 = sub_21DBBF674;
      v48 = v44;
      sub_21DBB3DBC((uint64_t (**)(uint64_t, uint64_t, uint64_t))&v47, (uint64_t)&v51, (uint64_t)&v50, (uint64_t)&v49);
      swift_release();
      v47 = sub_21DBBF66C;
      v48 = v26;
      sub_21DBB3DBC((uint64_t (**)(uint64_t, uint64_t, uint64_t))&v47, (uint64_t)&v51, (uint64_t)&v50, (uint64_t)&v49);
      swift_release();
      v47 = sub_21DBBF674;
      v48 = v27;
      sub_21DBB3DBC((uint64_t (**)(uint64_t, uint64_t, uint64_t))&v47, (uint64_t)&v51, (uint64_t)&v50, (uint64_t)&v49);
      swift_release();
      v47 = sub_21DBBF674;
      v48 = v37;
      sub_21DBB3DBC((uint64_t (**)(uint64_t, uint64_t, uint64_t))&v47, (uint64_t)&v51, (uint64_t)&v50, (uint64_t)&v49);
      swift_release();
      v47 = sub_21DBBF670;
      v48 = v38;
      sub_21DBB3DBC((uint64_t (**)(uint64_t, uint64_t, uint64_t))&v47, (uint64_t)&v51, (uint64_t)&v50, (uint64_t)&v49);
      swift_release();
      v34 = v46;
      v35 = v40;
      _os_log_impl(&dword_21DBAF000, v46, v31, "PRECONDITION FAILURE { file = %s, function = %s, line = %ld }", v40, 0x20u);
      v36 = v39;
      swift_arrayDestroy();
      MEMORY[0x22079B7C0](v36, -1, -1);
      MEMORY[0x22079B7C0](v35, -1, -1);

    }
    else
    {

      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
    }
    (*(void (**)(char *, uint64_t))(v3 + 8))(v10, v2);
  }
}

void sub_21DBBE038()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  _QWORD *v10;
  void *v11;
  int values;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  uint64_t (*v17)(uint64_t, uint64_t, uint64_t);
  uint64_t v18;
  unint64_t v19;
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
  uint64_t v34;
  NSObject *v35;
  uint64_t v36;
  uint64_t v37;
  uint8_t *v38;
  uint8_t *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint8_t *v46;
  os_log_t v47;
  uint64_t v48;
  uint64_t v49;
  int v50;
  uint64_t v51;
  uint64_t (*aBlock)();
  uint64_t v53;
  uint64_t (*v54)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, double);
  void *v55;
  uint64_t (*v56)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, double);
  _QWORD *v57;
  uint64_t v58;
  uint64_t v59;
  _QWORD v60[2];

  v1 = sub_21DBD2320();
  v2 = *(_QWORD *)(v1 - 8);
  v4 = MEMORY[0x24BDAC7A8](v1, v3);
  v6 = (char *)&v41 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4, v7);
  v9 = (char *)&v41 - v8;
  if (*(_BYTE *)(v0 + 24) == 2)
  {
    v10 = (_QWORD *)swift_allocObject();
    v10[2] = sub_21DBCC414(MEMORY[0x24BEE4AF8]);
    v56 = sub_21DBBF4F0;
    v57 = v10;
    aBlock = (uint64_t (*)())MEMORY[0x24BDAC760];
    v53 = 1107296256;
    v54 = sub_21DBBEB70;
    v55 = &block_descriptor_1;
    v11 = _Block_copy(&aBlock);
    swift_retain();
    swift_release();
    values = pc_session_get_values();
    _Block_release(v11);
    if (values == sub_21DBD232C())
    {
LABEL_9:
      swift_beginAccess();
      swift_bridgeObjectRetain();
      swift_release();
      return;
    }
    if (qword_253F3D9E8 != -1)
      swift_once();
    v13 = __swift_project_value_buffer(v1, (uint64_t)qword_253F3DC60);
    (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v6, v13, v1);
    v14 = sub_21DBD2308();
    v15 = sub_21DBD2434();
    if (!os_log_type_enabled(v14, v15))
    {

      (*(void (**)(char *, uint64_t))(v2 + 8))(v6, v1);
      goto LABEL_9;
    }
    v51 = v2;
    v16 = (uint8_t *)swift_slowAlloc();
    v17 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))swift_slowAlloc();
    aBlock = (uint64_t (*)())v17;
    *(_DWORD *)v16 = 136380675;
    if (strerror(values))
    {
      v18 = sub_21DBD23E0();
      v60[0] = sub_21DBCECA4(v18, v19, (uint64_t *)&aBlock);
      sub_21DBD24AC();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_21DBAF000, v14, v15, "pc_session_destroy failed, { ret=%{private}s }", v16, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x22079B7C0](v17, -1, -1);
      MEMORY[0x22079B7C0](v16, -1, -1);

      (*(void (**)(char *, uint64_t))(v51 + 8))(v6, v1);
      goto LABEL_9;
    }
    __break(1u);

    __break(1u);
  }
  else
  {
    if (qword_253F3DA18 != -1)
      swift_once();
    v20 = __swift_project_value_buffer(v1, (uint64_t)qword_253F3DC78);
    (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v9, v20, v1);
    v21 = swift_allocObject();
    *(_QWORD *)(v21 + 16) = 0xD00000000000005ALL;
    *(_QWORD *)(v21 + 24) = 0x800000021DBD4F60;
    v22 = swift_allocObject();
    *(_QWORD *)(v22 + 16) = 0xD000000000000011;
    *(_QWORD *)(v22 + 24) = 0x800000021DBD4FC0;
    v23 = swift_allocObject();
    *(_QWORD *)(v23 + 16) = 195;
    v47 = (os_log_t)sub_21DBD2308();
    v50 = sub_21DBD244C();
    v24 = swift_allocObject();
    v51 = v2;
    v49 = v24;
    *(_BYTE *)(v24 + 16) = 32;
    v48 = swift_allocObject();
    *(_BYTE *)(v48 + 16) = 8;
    v25 = swift_allocObject();
    *(_QWORD *)(v25 + 16) = sub_21DBBF664;
    *(_QWORD *)(v25 + 24) = v21;
    v26 = swift_allocObject();
    *(_QWORD *)(v26 + 16) = sub_21DBB6BD4;
    *(_QWORD *)(v26 + 24) = v25;
    v27 = swift_allocObject();
    *(_BYTE *)(v27 + 16) = 32;
    v28 = swift_allocObject();
    *(_BYTE *)(v28 + 16) = 8;
    v29 = swift_allocObject();
    *(_QWORD *)(v29 + 16) = sub_21DBBF668;
    *(_QWORD *)(v29 + 24) = v22;
    v30 = swift_allocObject();
    *(_QWORD *)(v30 + 16) = sub_21DBB6BD4;
    *(_QWORD *)(v30 + 24) = v29;
    v31 = swift_allocObject();
    *(_BYTE *)(v31 + 16) = 0;
    v32 = swift_allocObject();
    *(_BYTE *)(v32 + 16) = 8;
    v33 = swift_allocObject();
    *(_QWORD *)(v33 + 16) = sub_21DBBF754;
    *(_QWORD *)(v33 + 24) = v23;
    v34 = swift_allocObject();
    *(_QWORD *)(v34 + 16) = sub_21DBBF75C;
    *(_QWORD *)(v34 + 24) = v33;
    v35 = v47;
    if (os_log_type_enabled(v47, (os_log_type_t)v50))
    {
      v41 = v26;
      v42 = v28;
      v36 = v48;
      v43 = v31;
      v44 = v34;
      v37 = v51;
      v38 = (uint8_t *)swift_slowAlloc();
      v58 = swift_slowAlloc();
      v59 = 0;
      v45 = v58;
      v46 = v38;
      *(_WORD *)v38 = 770;
      v60[0] = v38 + 2;
      aBlock = sub_21DBBF674;
      v53 = v49;
      sub_21DBB3DBC((uint64_t (**)(uint64_t, uint64_t, uint64_t))&aBlock, (uint64_t)v60, (uint64_t)&v59, (uint64_t)&v58);
      swift_release();
      aBlock = sub_21DBBF674;
      v53 = v36;
      sub_21DBB3DBC((uint64_t (**)(uint64_t, uint64_t, uint64_t))&aBlock, (uint64_t)v60, (uint64_t)&v59, (uint64_t)&v58);
      swift_release();
      aBlock = sub_21DBBF66C;
      v53 = v41;
      sub_21DBB3DBC((uint64_t (**)(uint64_t, uint64_t, uint64_t))&aBlock, (uint64_t)v60, (uint64_t)&v59, (uint64_t)&v58);
      swift_release();
      aBlock = sub_21DBBF674;
      v53 = v27;
      sub_21DBB3DBC((uint64_t (**)(uint64_t, uint64_t, uint64_t))&aBlock, (uint64_t)v60, (uint64_t)&v59, (uint64_t)&v58);
      swift_release();
      aBlock = sub_21DBBF674;
      v53 = v42;
      sub_21DBB3DBC((uint64_t (**)(uint64_t, uint64_t, uint64_t))&aBlock, (uint64_t)v60, (uint64_t)&v59, (uint64_t)&v58);
      swift_release();
      aBlock = sub_21DBBF66C;
      v53 = v30;
      sub_21DBB3DBC((uint64_t (**)(uint64_t, uint64_t, uint64_t))&aBlock, (uint64_t)v60, (uint64_t)&v59, (uint64_t)&v58);
      swift_release();
      aBlock = sub_21DBBF674;
      v53 = v43;
      sub_21DBB3DBC((uint64_t (**)(uint64_t, uint64_t, uint64_t))&aBlock, (uint64_t)v60, (uint64_t)&v59, (uint64_t)&v58);
      swift_release();
      aBlock = sub_21DBBF674;
      v53 = v32;
      sub_21DBB3DBC((uint64_t (**)(uint64_t, uint64_t, uint64_t))&aBlock, (uint64_t)v60, (uint64_t)&v59, (uint64_t)&v58);
      swift_release();
      aBlock = sub_21DBBF670;
      v53 = v44;
      sub_21DBB3DBC((uint64_t (**)(uint64_t, uint64_t, uint64_t))&aBlock, (uint64_t)v60, (uint64_t)&v59, (uint64_t)&v58);
      swift_release();
      v39 = v46;
      _os_log_impl(&dword_21DBAF000, v35, (os_log_type_t)v50, "PRECONDITION FAILURE { file = %s, function = %s, line = %ld }", v46, 0x20u);
      v40 = v45;
      swift_arrayDestroy();
      MEMORY[0x22079B7C0](v40, -1, -1);
      MEMORY[0x22079B7C0](v39, -1, -1);

      (*(void (**)(char *, uint64_t))(v37 + 8))(v9, v1);
    }
    else
    {

      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      (*(void (**)(char *, uint64_t))(v51 + 8))(v9, v1);
    }
    sub_21DBCC414(MEMORY[0x24BEE4AF8]);
  }
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t sub_21DBBE898(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_21DBBE8A0(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for PCSession.State()
{
  return &type metadata for PCSession.State;
}

uint64_t _s14AudioAnalytics9PCSessionC5StateOwet_0(unsigned __int8 *a1, unsigned int a2)
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

uint64_t _s14AudioAnalytics9PCSessionC5StateOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_21DBBE994 + 4 * byte_21DBD3355[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_21DBBE9C8 + 4 * byte_21DBD3350[v4]))();
}

uint64_t sub_21DBBE9C8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_21DBBE9D0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x21DBBE9D8);
  return result;
}

uint64_t sub_21DBBE9E4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x21DBBE9ECLL);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_21DBBE9F0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_21DBBE9F8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for PerfCheck.State()
{
  return &type metadata for PerfCheck.State;
}

unint64_t sub_21DBBEA18()
{
  unint64_t result;

  result = qword_2553A4350;
  if (!qword_2553A4350)
  {
    result = MEMORY[0x22079B718](&unk_21DBD3430, &type metadata for PerfCheck.State);
    atomic_store(result, (unint64_t *)&qword_2553A4350);
  }
  return result;
}

unint64_t sub_21DBBEA60()
{
  unint64_t result;

  result = qword_2553A4358;
  if (!qword_2553A4358)
  {
    result = MEMORY[0x22079B718](&unk_21DBD3498, &type metadata for PCSession.State);
    atomic_store(result, (unint64_t *)&qword_2553A4358);
  }
  return result;
}

uint64_t sub_21DBBEAA4(double a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v16;

  if (a6)
  {
    v11 = sub_21DBD23E0();
    v13 = v12;
  }
  else
  {
    v13 = 0xE700000000000000;
    v11 = 0x6E776F6E6B6E75;
  }
  swift_beginAccess();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v16 = *(_QWORD *)(a9 + 16);
  *(_QWORD *)(a9 + 16) = 0x8000000000000000;
  sub_21DBD0D90(v11, v13, isUniquelyReferenced_nonNull_native, a1);
  *(_QWORD *)(a9 + 16) = v16;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_endAccess();
}

uint64_t sub_21DBBEB70(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, double a9)
{
  void (*v17)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, double);

  v17 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, double))(a1 + 32);
  swift_retain();
  v17(a2, a3, a4, a5, a6, a7, a8, a9);
  return swift_release();
}

BOOL sub_21DBBEC08(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_21DBBEC1C()
{
  sub_21DBD25A8();
  sub_21DBD25B4();
  return sub_21DBD25CC();
}

uint64_t sub_21DBBEC60()
{
  return sub_21DBD25B4();
}

uint64_t sub_21DBBEC88()
{
  sub_21DBD25A8();
  sub_21DBD25B4();
  return sub_21DBD25CC();
}

uint64_t sub_21DBBECC8()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_21DBBECEC()
{
  uint64_t v0;

  return sub_21DBBF928(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

uint64_t sub_21DBBECF4()
{
  uint64_t v0;

  return sub_21DBBF8F8(*(_QWORD *)(v0 + 16));
}

uint64_t sub_21DBBECFC()
{
  return swift_deallocObject();
}

uint64_t sub_21DBBED0C()
{
  uint64_t v0;

  return nullsub_1(*(_QWORD *)(v0 + 16));
}

uint64_t sub_21DBBED14()
{
  return swift_deallocObject();
}

_BYTE **sub_21DBBED24(_BYTE **a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  return sub_21DBB3DF0(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

uint64_t sub_21DBBED2C()
{
  return swift_deallocObject();
}

uint64_t sub_21DBBED3C(uint64_t *a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;

  return sub_21DBCEC34(a1, a2, a3, *(uint64_t (**)(void))(v3 + 16));
}

uint64_t sub_21DBBED44()
{
  return swift_deallocObject();
}

uint64_t sub_21DBBED54()
{
  return swift_deallocObject();
}

uint64_t sub_21DBBED64()
{
  return swift_deallocObject();
}

uint64_t sub_21DBBED74()
{
  return swift_deallocObject();
}

uint64_t sub_21DBBED84@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;

  return sub_21DBCF2E4(*(uint64_t (**)(void))(v1 + 16), a1);
}

uint64_t sub_21DBBED8C(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  return sub_21DBCEBDC(a1, a2, a3, *(void (**)(uint64_t *__return_ptr))(v3 + 16));
}

uint64_t sub_21DBBED94(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  char v15;
  unint64_t v16;
  uint64_t v17;
  _BOOL8 v18;
  uint64_t v19;
  char v20;
  unint64_t v21;
  char v22;
  _OWORD *v23;
  _QWORD *v24;
  uint64_t *v25;
  uint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t i;
  _OWORD *v30;
  uint64_t v31;
  _QWORD *v32;
  char v33;
  unint64_t v34;
  uint64_t v35;
  _BOOL8 v36;
  uint64_t v37;
  char v38;
  unint64_t v39;
  char v40;
  _QWORD *v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t result;
  _OWORD v46[2];
  _OWORD v47[2];
  __int128 v48;
  _OWORD v49[2];
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;

  v7 = -1 << *(_BYTE *)(a1 + 32);
  v8 = ~v7;
  v9 = *(_QWORD *)(a1 + 64);
  v10 = -v7;
  v50 = a1;
  v51 = a1 + 64;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  else
    v11 = -1;
  v52 = v8;
  v53 = 0;
  v54 = v11 & v9;
  v55 = a2;
  v56 = a3;
  swift_bridgeObjectRetain();
  swift_retain();
  sub_21DBCB118(&v48);
  v12 = *((_QWORD *)&v48 + 1);
  if (!*((_QWORD *)&v48 + 1))
    goto LABEL_27;
  v13 = v48;
  sub_21DBB3F4C(v49, v47);
  v14 = *(_QWORD **)a5;
  v16 = sub_21DBCF33C(v13, v12);
  v17 = v14[2];
  v18 = (v15 & 1) == 0;
  v19 = v17 + v18;
  if (__OFADD__(v17, v18))
  {
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  v20 = v15;
  if (v14[3] >= v19)
  {
    if ((a4 & 1) != 0)
    {
      if ((v15 & 1) != 0)
        goto LABEL_12;
    }
    else
    {
      sub_21DBD144C();
      if ((v20 & 1) != 0)
        goto LABEL_12;
    }
LABEL_14:
    v24 = *(_QWORD **)a5;
    *(_QWORD *)(*(_QWORD *)a5 + 8 * (v16 >> 6) + 64) |= 1 << v16;
    v25 = (uint64_t *)(v24[6] + 16 * v16);
    *v25 = v13;
    v25[1] = v12;
    sub_21DBB3F4C(v47, (_OWORD *)(v24[7] + 32 * v16));
    v26 = v24[2];
    v27 = __OFADD__(v26, 1);
    v28 = v26 + 1;
    if (v27)
    {
LABEL_29:
      __break(1u);
      goto LABEL_30;
    }
    v24[2] = v28;
LABEL_16:
    sub_21DBCB118(&v48);
    for (i = *((_QWORD *)&v48 + 1); *((_QWORD *)&v48 + 1); i = *((_QWORD *)&v48 + 1))
    {
      v31 = v48;
      sub_21DBB3F4C(v49, v47);
      v32 = *(_QWORD **)a5;
      v34 = sub_21DBCF33C(v31, i);
      v35 = v32[2];
      v36 = (v33 & 1) == 0;
      v37 = v35 + v36;
      if (__OFADD__(v35, v36))
        goto LABEL_28;
      v38 = v33;
      if (v32[3] < v37)
      {
        sub_21DBCFEC8(v37, 1);
        v39 = sub_21DBCF33C(v31, i);
        if ((v38 & 1) != (v40 & 1))
          goto LABEL_30;
        v34 = v39;
      }
      if ((v38 & 1) != 0)
      {
        sub_21DBB4014((uint64_t)v47, (uint64_t)v46);
        __swift_destroy_boxed_opaque_existential_0((uint64_t)v47);
        swift_bridgeObjectRelease();
        v30 = (_OWORD *)(*(_QWORD *)(*(_QWORD *)a5 + 56) + 32 * v34);
        __swift_destroy_boxed_opaque_existential_0((uint64_t)v30);
        sub_21DBB3F4C(v46, v30);
      }
      else
      {
        v41 = *(_QWORD **)a5;
        *(_QWORD *)(*(_QWORD *)a5 + 8 * (v34 >> 6) + 64) |= 1 << v34;
        v42 = (uint64_t *)(v41[6] + 16 * v34);
        *v42 = v31;
        v42[1] = i;
        sub_21DBB3F4C(v47, (_OWORD *)(v41[7] + 32 * v34));
        v43 = v41[2];
        v27 = __OFADD__(v43, 1);
        v44 = v43 + 1;
        if (v27)
          goto LABEL_29;
        v41[2] = v44;
      }
      sub_21DBCB118(&v48);
    }
LABEL_27:
    swift_release();
    swift_bridgeObjectRelease();
    sub_21DBB3F7C();
    return swift_release();
  }
  sub_21DBCFEC8(v19, a4 & 1);
  v21 = sub_21DBCF33C(v13, v12);
  if ((v20 & 1) == (v22 & 1))
  {
    v16 = v21;
    if ((v20 & 1) == 0)
      goto LABEL_14;
LABEL_12:
    sub_21DBB4014((uint64_t)v47, (uint64_t)v46);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v47);
    swift_bridgeObjectRelease();
    v23 = (_OWORD *)(*(_QWORD *)(*(_QWORD *)a5 + 56) + 32 * v16);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v23);
    sub_21DBB3F4C(v46, v23);
    goto LABEL_16;
  }
LABEL_30:
  result = sub_21DBD2584();
  __break(1u);
  return result;
}

uint64_t sub_21DBBF0E8(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v4;
  uint64_t i;
  char v7;
  uint64_t v8;

  result = MEMORY[0x24BEE4AF8];
  v8 = MEMORY[0x24BEE4AF8];
  v4 = *(_QWORD *)(a1 + 16);
  if (v4)
  {
    type metadata accessor for PCSession();
    swift_bridgeObjectRetain();
    for (i = 0; i != v4; ++i)
    {
      swift_allocObject();
      if (sub_21DBBC940())
      {
        sub_21DBBCF8C(a2);
        if ((v7 & 1) != 0)
        {
          MEMORY[0x22079B0E8]();
          if (*(_QWORD *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
            sub_21DBD241C();
          sub_21DBD2428();
          sub_21DBD2410();
        }
        else
        {
          swift_release();
        }
      }
    }
    swift_bridgeObjectRelease();
    return v8;
  }
  return result;
}

uint64_t sub_21DBBF214(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;

  v6 = a1;
  v14 = a1;
  if (a2 >> 62)
  {
LABEL_14:
    swift_bridgeObjectRetain();
    v7 = sub_21DBD253C();
    if (v7)
      goto LABEL_3;
  }
  else
  {
    v7 = *(_QWORD *)((a2 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v7)
    {
LABEL_3:
      for (i = 4; ; ++i)
      {
        v9 = i - 4;
        if ((a2 & 0xC000000000000001) != 0)
        {
          v6 = MEMORY[0x22079B208](i - 4, a2);
          v10 = __OFADD__(v9, 1);
          v11 = i - 3;
          if (v10)
            goto LABEL_13;
        }
        else
        {
          v6 = *(_QWORD *)(a2 + 8 * i);
          swift_retain();
          v10 = __OFADD__(v9, 1);
          v11 = i - 3;
          if (v10)
          {
LABEL_13:
            __break(1u);
            goto LABEL_14;
          }
        }
        v13 = v6;
        sub_21DBBBDD0((uint64_t)&v14, (uint64_t)&v13, a3);
        if (v3)
        {
          swift_bridgeObjectRelease();
          swift_release();
          swift_bridgeObjectRelease();
          return v6;
        }
        swift_release();
        if (v11 == v7)
        {
          swift_bridgeObjectRelease();
          return v14;
        }
      }
    }
  }
  swift_bridgeObjectRelease();
  return v6;
}

uint64_t sub_21DBBF358()
{
  return swift_deallocObject();
}

uint64_t sub_21DBBF368()
{
  return swift_deallocObject();
}

uint64_t sub_21DBBF378()
{
  return swift_deallocObject();
}

uint64_t sub_21DBBF388()
{
  return swift_deallocObject();
}

uint64_t sub_21DBBF398()
{
  return swift_deallocObject();
}

uint64_t sub_21DBBF3A8()
{
  return swift_deallocObject();
}

uint64_t sub_21DBBF3B8()
{
  return swift_deallocObject();
}

uint64_t sub_21DBBF3C8()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_21DBBF3EC()
{
  return swift_deallocObject();
}

uint64_t sub_21DBBF3FC()
{
  return swift_deallocObject();
}

uint64_t sub_21DBBF40C()
{
  return swift_deallocObject();
}

uint64_t sub_21DBBF41C()
{
  return swift_deallocObject();
}

uint64_t sub_21DBBF42C()
{
  return swift_deallocObject();
}

uint64_t sub_21DBBF43C()
{
  return swift_deallocObject();
}

uint64_t sub_21DBBF44C()
{
  return swift_deallocObject();
}

uint64_t sub_21DBBF45C()
{
  return swift_deallocObject();
}

uint64_t sub_21DBBF46C()
{
  return swift_deallocObject();
}

uint64_t sub_21DBBF47C()
{
  return swift_deallocObject();
}

uint64_t sub_21DBBF48C()
{
  return swift_deallocObject();
}

uint64_t sub_21DBBF49C()
{
  return swift_deallocObject();
}

uint64_t sub_21DBBF4AC()
{
  return swift_deallocObject();
}

uint64_t sub_21DBBF4BC()
{
  return swift_deallocObject();
}

uint64_t sub_21DBBF4CC()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_21DBBF4F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, double a8)
{
  uint64_t v8;

  return sub_21DBBEAA4(a8, a1, a2, a3, a4, a5, a6, a7, v8);
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

uint64_t sub_21DBBF510()
{
  return swift_deallocObject();
}

uint64_t sub_21DBBF520()
{
  return swift_deallocObject();
}

uint64_t sub_21DBBF530()
{
  return swift_deallocObject();
}

uint64_t sub_21DBBF540()
{
  return swift_deallocObject();
}

uint64_t sub_21DBBF550()
{
  return swift_deallocObject();
}

uint64_t sub_21DBBF560()
{
  return swift_deallocObject();
}

uint64_t sub_21DBBF570()
{
  return swift_deallocObject();
}

uint64_t sub_21DBBF580()
{
  return swift_deallocObject();
}

uint64_t sub_21DBBF590()
{
  return swift_deallocObject();
}

uint64_t sub_21DBBF5A0()
{
  return swift_deallocObject();
}

uint64_t sub_21DBBF5B0()
{
  return swift_deallocObject();
}

uint64_t sub_21DBBF5C0()
{
  return swift_deallocObject();
}

uint64_t sub_21DBBF5D0()
{
  return swift_deallocObject();
}

uint64_t sub_21DBBF5E0()
{
  return swift_deallocObject();
}

uint64_t sub_21DBBF5F0()
{
  return swift_deallocObject();
}

uint64_t sub_21DBBF600()
{
  return swift_deallocObject();
}

uint64_t sub_21DBBF610()
{
  return swift_deallocObject();
}

uint64_t sub_21DBBF620()
{
  return swift_deallocObject();
}

uint64_t sub_21DBBF630()
{
  return swift_deallocObject();
}

uint64_t sub_21DBBF640()
{
  return swift_deallocObject();
}

uint64_t sub_21DBBF650()
{
  return swift_deallocObject();
}

uint64_t sub_21DBBF764(unsigned int a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  char *v8;
  unsigned int v9;
  double v10;
  double v11;
  double v12;
  double v13;
  BOOL v14;
  unsigned int v15;
  int v17;
  int v18;
  BOOL v19;
  unsigned int v20;
  uint64_t v21;

  v2 = v1;
  v4 = sub_21DBD22F0();
  v5 = *(_QWORD *)(v4 - 8);
  result = MEMORY[0x24BDAC7A8]();
  v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *(_DWORD *)(v2 + 24);
  if (v9 < a1)
  {
    sub_21DBD22E4();
    sub_21DBD22CC();
    v11 = v10;
    result = (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v8, v4);
    v12 = (v11 - *(double *)(v2 + 32)) * 32.0;
    v13 = round(v12);
    v14 = v13 >= 4294967300.0 || v13 <= -1.0;
    v15 = vcvtad_u64_f64(v12);
    if (v14)
      v15 = -1;
    v17 = *(_DWORD *)(v2 + 24);
    v18 = v17 + v15;
    if (v17 + v15 >= 0x20)
      v18 = 32;
    v9 = __CFADD__(v17, v15) ? 32 : v18;
    *(_DWORD *)(v2 + 24) = v9;
    *(double *)(v2 + 32) = v11;
    if (v9 < a1)
      return 0;
  }
  v19 = v9 >= a1;
  v20 = v9 - a1;
  if (v19)
  {
    *(_DWORD *)(v2 + 24) = v20;
    return 1;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_21DBBF884()
{
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for RateLimiter()
{
  return objc_opt_self();
}

uint64_t sub_21DBBF8C8()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for TokenBucket()
{
  return objc_opt_self();
}

uint64_t sub_21DBBF8F8(uint64_t a1)
{
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_21DBBF92C@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t active;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  int EnumCaseMultiPayload;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;

  v3 = v2;
  active = type metadata accessor for ActiveReporterState(0);
  v8 = MEMORY[0x24BDAC7A8](active, v7);
  v10 = (uint64_t *)((char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x24BDAC7A8](v8, v11);
  v13 = (uint64_t *)((char *)&v20 - v12);
  type metadata accessor for ReporterData();
  v14 = swift_allocObject();
  *(_WORD *)(v14 + 24) = -1;
  *(_QWORD *)(v14 + 32) = sub_21DBCC2E0(MEMORY[0x24BEE4AF8]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_253F3DA08);
  v15 = swift_allocObject();
  *(_OWORD *)(v15 + 16) = xmmword_21DBD32D0;
  *(_DWORD *)(v15 + 32) = getpid();
  type metadata accessor for PerfCheck();
  swift_allocObject();
  *(_QWORD *)(v14 + 40) = sub_21DBBA54C(v15);
  *(_QWORD *)(v14 + 16) = a1;
  *v13 = v14;
  swift_storeEnumTagMultiPayload();
  if (*(_BYTE *)(v3 + OBJC_IVAR____TtC14AudioAnalytics12ServerClient__isCachingEnabled) == 1)
  {
    sub_21DBC192C((uint64_t)v13, (uint64_t)a2, type metadata accessor for ActiveReporterState);
    type metadata accessor for ReporterState(0);
  }
  else
  {
    sub_21DBC1644((uint64_t)v13, (uint64_t)v10, type metadata accessor for ActiveReporterState);
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    v17 = *v10;
    if (EnumCaseMultiPayload != 1)
    {
      v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F3D888);
      sub_21DBBA1BC((uint64_t)v10 + *(int *)(v18 + 48), type metadata accessor for StartedReporterData);
    }
    sub_21DBBA1BC((uint64_t)v13, type metadata accessor for ActiveReporterState);
    *a2 = v17;
    type metadata accessor for ReporterState(0);
  }
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_21DBBFB10@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t (*v12)(_QWORD);
  int EnumCaseMultiPayload;
  int v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  char *v21;
  int v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  NSObject *v27;
  os_log_type_t v28;
  uint8_t *v29;
  uint64_t v30;
  _QWORD v31[4];

  v4 = type metadata accessor for ReporterState(0);
  v6 = MEMORY[0x24BDAC7A8](v4, v5);
  v8 = (char *)v31 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6, v9);
  v11 = (_QWORD *)((char *)v31 - v10);
  sub_21DBC1644(a1, (uint64_t)v31 - v10, v12);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (!EnumCaseMultiPayload)
  {
    v17 = *v11;
    v18 = (void *)sub_21DBC58F8(a1, 3);
    objc_msgSend(v18, sel_createSessionWith_, *(_QWORD *)(v17 + 16));
    swift_beginAccess();
    swift_bridgeObjectRetain();
    v19 = (void *)sub_21DBD238C();
    swift_bridgeObjectRelease();
    objc_msgSend(v18, sel_setWithConfiguration_for_, v19, *(_QWORD *)(v17 + 16));

    v20 = *(_QWORD *)(v17 + 16);
    objc_msgSend(v18, sel_setWithServiceType_for_, *(unsigned __int16 *)(v17 + 24), v20);
    sub_21DBC60A0(v17);
    objc_msgSend(v18, sel_startSessionFor_, v20);
    v21 = (char *)a2 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_253F3D888) + 48);
    *a2 = v17;
    sub_21DBD22D8();
    swift_unknownObjectRelease();
    *(_DWORD *)&v21[*(int *)(type metadata accessor for StartedReporterData(0) + 20)] = 0;
    type metadata accessor for ActiveReporterState(0);
    goto LABEL_6;
  }
  if (EnumCaseMultiPayload == 1)
  {
    type metadata accessor for ActiveReporterState(0);
    v14 = swift_getEnumCaseMultiPayload();
    v15 = *v11;
    if (v14 == 1)
    {
      sub_21DBC60A0(*v11);
      objc_msgSend((id)sub_21DBC58F8(a1, 3), sel_startSessionFor_, *(_QWORD *)(v15 + 16));
      swift_unknownObjectRelease();
      v16 = (char *)a2 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_253F3D888) + 48);
      *a2 = v15;
      sub_21DBD22D8();
      *(_DWORD *)&v16[*(int *)(type metadata accessor for StartedReporterData(0) + 20)] = 0;
LABEL_6:
      swift_storeEnumTagMultiPayload();
      return swift_storeEnumTagMultiPayload();
    }
  }
  else
  {
    type metadata accessor for ActiveReporterState(0);
    v23 = swift_getEnumCaseMultiPayload();
    v24 = *v11;
    if (v23 == 1)
    {
      sub_21DBC60A0(*v11);
      objc_msgSend((id)sub_21DBC58F8(a1, 3), sel_startSessionFor_, *(_QWORD *)(v24 + 16));
      swift_unknownObjectRelease();
      v25 = (char *)a2 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_253F3D888) + 48);
      *a2 = v24;
      sub_21DBD22D8();
      *(_DWORD *)&v25[*(int *)(type metadata accessor for StartedReporterData(0) + 20)] = 0;
      swift_storeEnumTagMultiPayload();
      return swift_storeEnumTagMultiPayload();
    }
  }
  swift_release();
  v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F3D888);
  sub_21DBBA1BC((uint64_t)v11 + *(int *)(v26 + 48), type metadata accessor for StartedReporterData);
  sub_21DBC1644(a1, (uint64_t)v8, type metadata accessor for ReporterState);
  v27 = sub_21DBD2308();
  v28 = sub_21DBD2434();
  if (os_log_type_enabled(v27, v28))
  {
    v29 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v29 = 134217984;
    v30 = *(_QWORD *)(sub_21DBC7934() + 16);
    swift_release();
    sub_21DBBA1BC((uint64_t)v8, type metadata accessor for ReporterState);
    v31[1] = v30;
    sub_21DBD24AC();
    _os_log_impl(&dword_21DBAF000, v27, v28, "Reporter already started. Returning early. { reporterID=%lld }", v29, 0xCu);
    MEMORY[0x22079B7C0](v29, -1, -1);
  }
  else
  {
    sub_21DBBA1BC((uint64_t)v8, type metadata accessor for ReporterState);
  }

  return sub_21DBC1644(a1, (uint64_t)a2, type metadata accessor for ReporterState);
}

void sub_21DBBFF6C(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t *a5@<X8>)
{
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
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t (*v31)(_QWORD);
  int EnumCaseMultiPayload;
  int v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  int v37;
  uint64_t v38;
  NSObject *v39;
  os_log_type_t v40;
  uint8_t *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t *v46;
  void *v47;
  uint64_t v48;

  v46 = a5;
  v47 = (void *)a3;
  v45 = a2;
  v7 = type metadata accessor for StartedReporterData(0);
  v9 = MEMORY[0x24BDAC7A8](v7, v8);
  v11 = (char *)&v45 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9, v12);
  v14 = (char *)&v45 - v13;
  v15 = type metadata accessor for ReporterState(0);
  v17 = MEMORY[0x24BDAC7A8](v15, v16);
  v19 = (uint64_t *)((char *)&v45 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0));
  v21 = MEMORY[0x24BDAC7A8](v17, v20);
  v23 = (uint64_t *)((char *)&v45 - v22);
  v25 = MEMORY[0x24BDAC7A8](v21, v24);
  v27 = (char *)&v45 - v26;
  MEMORY[0x24BDAC7A8](v25, v28);
  v30 = (uint64_t *)((char *)&v45 - v29);
  sub_21DBC1644(a1, (uint64_t)&v45 - v29, v31);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload)
  {
    if (EnumCaseMultiPayload == 1)
    {
      type metadata accessor for ActiveReporterState(0);
      v33 = swift_getEnumCaseMultiPayload();
      v34 = *v30;
      if (v33 != 1)
      {
        v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F3D888);
        sub_21DBC192C((uint64_t)v30 + *(int *)(v35 + 48), (uint64_t)v14, type metadata accessor for StartedReporterData);
        v36 = v47;
        sub_21DBC6460(v34, (uint64_t)v14, (uint64_t)v47, a4);
        objc_msgSend((id)sub_21DBC58F8(a1, 3), sel_stopSessionFor_, *(_QWORD *)(v34 + 16));
        swift_unknownObjectRelease();
        sub_21DBBA1BC((uint64_t)v14, type metadata accessor for StartedReporterData);
        *v46 = v34;
        swift_storeEnumTagMultiPayload();
        swift_storeEnumTagMultiPayload();
        goto LABEL_11;
      }
    }
    else
    {
      type metadata accessor for ActiveReporterState(0);
      v37 = swift_getEnumCaseMultiPayload();
      v38 = *v30;
      if (v37 != 1)
      {
        v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F3D888);
        sub_21DBC192C((uint64_t)v30 + *(int *)(v43 + 48), (uint64_t)v11, type metadata accessor for StartedReporterData);
        v36 = v47;
        sub_21DBC6460(v38, (uint64_t)v11, (uint64_t)v47, a4);
        v44 = v45;
        objc_msgSend((id)sub_21DBC58F8(a1, 3), sel_stopSessionFor_, *(_QWORD *)(v38 + 16));
        swift_unknownObjectRelease();
        if (*(_BYTE *)(v44 + OBJC_IVAR____TtC14AudioAnalytics12ServerClient__isCachingEnabled) == 1)
        {
          sub_21DBBA1BC((uint64_t)v11, type metadata accessor for StartedReporterData);
          *v46 = v38;
          swift_storeEnumTagMultiPayload();
          swift_storeEnumTagMultiPayload();
        }
        else
        {
          *v19 = v38;
          swift_storeEnumTagMultiPayload();
          swift_storeEnumTagMultiPayload();
          swift_retain();
          sub_21DBC0408((uint64_t)v19, v23);
          sub_21DBBA1BC((uint64_t)v19, type metadata accessor for ReporterState);
          sub_21DBC5758();
          swift_release();
          sub_21DBBA1BC((uint64_t)v11, type metadata accessor for StartedReporterData);
          sub_21DBC192C((uint64_t)v23, (uint64_t)v46, type metadata accessor for ReporterState);
        }
        goto LABEL_11;
      }
    }
  }
  swift_release();
  sub_21DBC1644(a1, (uint64_t)v27, type metadata accessor for ReporterState);
  v39 = sub_21DBD2308();
  v40 = sub_21DBD2434();
  if (os_log_type_enabled(v39, v40))
  {
    v41 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v41 = 134217984;
    v42 = *(_QWORD *)(sub_21DBC7934() + 16);
    swift_release();
    sub_21DBBA1BC((uint64_t)v27, type metadata accessor for ReporterState);
    v48 = v42;
    sub_21DBD24AC();
    _os_log_impl(&dword_21DBAF000, v39, v40, "Reporter disconnected or already stopped. { func=stop, reporterID=%lld }", v41, 0xCu);
    MEMORY[0x22079B7C0](v41, -1, -1);
  }
  else
  {
    sub_21DBBA1BC((uint64_t)v27, type metadata accessor for ReporterState);
  }
  v36 = v47;

  sub_21DBC1644(a1, (uint64_t)v46, type metadata accessor for ReporterState);
LABEL_11:

}

uint64_t sub_21DBC0408@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t (*v14)(_QWORD);
  int EnumCaseMultiPayload;
  uint64_t (*v16)(uint64_t);
  uint64_t v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  os_log_type_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31[3];
  uint64_t v32;

  v3 = v2;
  v6 = type metadata accessor for ReporterState(0);
  v8 = MEMORY[0x24BDAC7A8](v6, v7);
  v10 = (uint64_t *)((char *)v31 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x24BDAC7A8](v8, v11);
  v13 = (uint64_t *)((char *)v31 - v12);
  sub_21DBC1644(a1, (uint64_t)v31 - v12, v14);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (!EnumCaseMultiPayload)
  {
    swift_release();
LABEL_10:
    if (qword_253F3DA18 != -1)
      swift_once();
    v22 = sub_21DBD2320();
    __swift_project_value_buffer(v22, (uint64_t)qword_253F3DC78);
    v23 = sub_21DBD2308();
    v24 = sub_21DBD244C();
    if (os_log_type_enabled(v23, v24))
    {
      v25 = swift_slowAlloc();
      v26 = swift_slowAlloc();
      v31[0] = v26;
      *(_DWORD *)v25 = 136315650;
      v32 = sub_21DBCECA4(0xD00000000000006BLL, 0x800000021DBD50F0, v31);
      sub_21DBD24AC();
      *(_WORD *)(v25 + 12) = 2080;
      v32 = sub_21DBCECA4(0xD00000000000003ELL, 0x800000021DBD5160, v31);
      sub_21DBD24AC();
      *(_WORD *)(v25 + 22) = 2048;
      v32 = 197;
      sub_21DBD24AC();
      _os_log_impl(&dword_21DBAF000, v23, v24, "PRECONDITION FAILURE { file = %s, function = %s, line = %ld }", (uint8_t *)v25, 0x20u);
      swift_arrayDestroy();
      MEMORY[0x22079B7C0](v26, -1, -1);
      MEMORY[0x22079B7C0](v25, -1, -1);
    }

    return sub_21DBC1644(a1, (uint64_t)a2, type metadata accessor for ReporterState);
  }
  if (EnumCaseMultiPayload == 1)
  {
    v16 = type metadata accessor for ReporterState;
    v17 = (uint64_t)v13;
LABEL_9:
    sub_21DBBA1BC(v17, v16);
    goto LABEL_10;
  }
  type metadata accessor for ActiveReporterState(0);
  v18 = swift_getEnumCaseMultiPayload();
  v19 = *v13;
  if (v18 != 1)
  {
    swift_release();
    v17 = (uint64_t)v13 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_253F3D888) + 48);
    v16 = type metadata accessor for StartedReporterData;
    goto LABEL_9;
  }
  v20 = *(_QWORD *)(v19 + 16);
  v21 = OBJC_IVAR____TtC14AudioAnalytics12ServerClient_messageCache;
  if (!*(_QWORD *)(v3 + OBJC_IVAR____TtC14AudioAnalytics12ServerClient_messageCache))
  {
    type metadata accessor for MessageCache();
    v28 = swift_allocObject();
    *(_QWORD *)(v28 + 16) = sub_21DBB8E5C();
    *(_QWORD *)(v3 + v21) = v28;
    swift_retain();
    swift_release();
  }
  swift_retain();
  sub_21DBB9538(v20);
  swift_release();
  *v10 = v19;
  swift_storeEnumTagMultiPayload();
  swift_storeEnumTagMultiPayload();
  swift_retain();
  v29 = (void *)sub_21DBC58F8((uint64_t)v10, 3);
  sub_21DBBA1BC((uint64_t)v10, type metadata accessor for ReporterState);
  objc_msgSend(v29, sel_createSessionWith_, v20);
  objc_msgSend(v29, sel_setWithServiceType_for_, *(unsigned __int16 *)(v19 + 24), v20);
  swift_beginAccess();
  swift_bridgeObjectRetain();
  v30 = (void *)sub_21DBD238C();
  swift_bridgeObjectRelease();
  objc_msgSend(v29, sel_setWithConfiguration_for_, v30, v20);
  swift_unknownObjectRelease();

  *a2 = v19;
  swift_storeEnumTagMultiPayload();
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_21DBC0870(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t (*v6)(_QWORD);
  void *v7;
  uint64_t v8;
  uint64_t v10;

  v2 = type metadata accessor for ReporterState(0);
  MEMORY[0x24BDAC7A8](v2, v3);
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21DBC1644(a1, (uint64_t)v5, v6);
  if (!swift_getEnumCaseMultiPayload())
    return swift_release();
  sub_21DBBA1BC((uint64_t)v5, type metadata accessor for ReporterState);
  v7 = (void *)sub_21DBC58F8(a1, 3);
  v8 = *(_QWORD *)(sub_21DBC7934() + 16);
  swift_release();
  objc_msgSend(v7, sel_destroySessionFor_, v8);
  return swift_unknownObjectRelease();
}

void sub_21DBC094C(uint64_t a1, void (*a2)(uint64_t), uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t active;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  int EnumCaseMultiPayload;
  uint64_t v22;
  NSObject *v23;
  os_log_type_t v24;
  uint8_t *v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD v28[2];
  void (*v29)(uint64_t);
  uint64_t v30;

  v28[0] = a4;
  v28[1] = a3;
  v29 = a2;
  v5 = type metadata accessor for ReporterState(0);
  v7 = MEMORY[0x24BDAC7A8](v5, v6);
  v9 = (char *)v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7, v10);
  v12 = (char *)v28 - v11;
  active = type metadata accessor for ActiveReporterState(0);
  v15 = MEMORY[0x24BDAC7A8](active, v14);
  v17 = (_QWORD *)((char *)v28 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x24BDAC7A8](v15, v18);
  v20 = (char *)v28 - v19;
  sub_21DBC1644(a1, (uint64_t)v12, type metadata accessor for ReporterState);
  if (swift_getEnumCaseMultiPayload())
  {
    sub_21DBC192C((uint64_t)v12, (uint64_t)v20, type metadata accessor for ActiveReporterState);
    sub_21DBC192C((uint64_t)v20, (uint64_t)v17, type metadata accessor for ActiveReporterState);
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    v22 = *v17;
    if (EnumCaseMultiPayload == 1)
    {
      ((void (*)(_QWORD))v28[0])(*v17);
      swift_release();
    }
    else
    {
      v27 = (uint64_t)v17 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_253F3D888) + 48);
      v29(v22);
      swift_release();
      sub_21DBBA1BC(v27, type metadata accessor for StartedReporterData);
    }
  }
  else
  {
    swift_release();
    sub_21DBC1644(a1, (uint64_t)v9, type metadata accessor for ReporterState);
    v23 = sub_21DBD2308();
    v24 = sub_21DBD2434();
    if (os_log_type_enabled(v23, v24))
    {
      v25 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)v25 = 134217984;
      v26 = *(_QWORD *)(sub_21DBC7934() + 16);
      swift_release();
      sub_21DBBA1BC((uint64_t)v9, type metadata accessor for ReporterState);
      v30 = v26;
      sub_21DBD24AC();
      _os_log_impl(&dword_21DBAF000, v23, v24, "Reporter disconnected. { func=setServiceType, reporterID=%lld }", v25, 0xCu);
      MEMORY[0x22079B7C0](v25, -1, -1);
    }
    else
    {
      sub_21DBBA1BC((uint64_t)v9, type metadata accessor for ReporterState);
    }

  }
}

uint64_t sub_21DBC0C00@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
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
  char *v12;
  uint64_t active;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  NSObject *v22;
  os_log_type_t v23;
  uint8_t *v24;
  int EnumCaseMultiPayload;
  uint64_t v26;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t inited;
  unint64_t v34;
  int v35;
  char isUniquelyReferenced_nonNull_native;
  _QWORD *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  _QWORD v41[2];
  uint64_t v42;
  uint64_t v43;
  _QWORD *v44;
  unint64_t v45;
  _OWORD v46[2];
  __int128 v47;
  uint64_t v48;

  v44 = a2;
  v3 = type metadata accessor for StartedReporterData(0);
  v5 = MEMORY[0x24BDAC7A8](v3, v4);
  v43 = (uint64_t)v41 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5, v7);
  v42 = (uint64_t)v41 - v8;
  v9 = type metadata accessor for ReporterState(0);
  MEMORY[0x24BDAC7A8](v9, v10);
  v12 = (char *)v41 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  active = type metadata accessor for ActiveReporterState(0);
  v15 = MEMORY[0x24BDAC7A8](active, v14);
  v17 = (_QWORD *)((char *)v41 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x24BDAC7A8](v15, v18);
  v20 = (char *)v41 - v19;
  if (qword_253F3DA18 != -1)
    swift_once();
  v21 = sub_21DBD2320();
  __swift_project_value_buffer(v21, (uint64_t)qword_253F3DC78);
  v22 = sub_21DBD2308();
  v23 = sub_21DBD2458();
  if (os_log_type_enabled(v22, v23))
  {
    v24 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v24 = 0;
    _os_log_impl(&dword_21DBAF000, v22, v23, "handleXPCInvalidation called.", v24, 2u);
    MEMORY[0x22079B7C0](v24, -1, -1);
  }

  sub_21DBC1644(a1, (uint64_t)v12, type metadata accessor for ReporterState);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_21DBC192C((uint64_t)v12, (uint64_t)v20, type metadata accessor for ActiveReporterState);
    sub_21DBC1644((uint64_t)v20, (uint64_t)v17, type metadata accessor for ActiveReporterState);
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    v26 = *v17;
    if (EnumCaseMultiPayload == 1)
    {
      if (*(_QWORD *)(v26 + 40))
      {
        swift_retain();
        sub_21DBBBF80();
        swift_release();
      }
      sub_21DBBA1BC((uint64_t)v20, type metadata accessor for ActiveReporterState);
      *v44 = v26;
    }
    else
    {
      v41[0] = __swift_instantiateConcreteTypeFromMangledName(&qword_253F3D888);
      v28 = v42;
      sub_21DBC192C((uint64_t)v17 + *(int *)(v41[0] + 48), v42, type metadata accessor for StartedReporterData);
      v29 = *(_QWORD *)(v26 + 16);
      v30 = (void *)sub_21DBC58F8(a1, 3);
      objc_msgSend(v30, sel_createSessionWith_, v29);
      objc_msgSend(v30, sel_setWithServiceType_for_, *(unsigned __int16 *)(v26 + 24), v29);
      swift_beginAccess();
      swift_bridgeObjectRetain();
      v41[1] = MEMORY[0x24BEE4AD8] + 8;
      v31 = (void *)sub_21DBD238C();
      swift_bridgeObjectRelease();
      objc_msgSend(v30, sel_setWithConfiguration_for_, v31, v29);

      v32 = v43;
      sub_21DBD22D8();
      *(_DWORD *)(v32 + *(int *)(v3 + 20)) = 0;
      objc_msgSend(v30, sel_startSessionFor_, v29);
      __swift_instantiateConcreteTypeFromMangledName(&qword_253F3D8D0);
      inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_21DBD32D0;
      *(_QWORD *)(inited + 32) = 0xD000000000000011;
      *(_QWORD *)(inited + 40) = 0x800000021DBD51A0;
      *(_QWORD *)(inited + 72) = MEMORY[0x24BEE1328];
      *(_BYTE *)(inited + 48) = 1;
      v34 = sub_21DBCC2E0(inited);
      v35 = *(_DWORD *)(v28 + *(int *)(v3 + 20));
      if (v35)
      {
        v48 = MEMORY[0x24BEE44F0];
        LODWORD(v47) = v35;
        sub_21DBB3F4C(&v47, v46);
        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        v45 = v34;
        sub_21DBD0C60(v46, 0xD000000000000014, 0x800000021DBD51C0, isUniquelyReferenced_nonNull_native);
        swift_bridgeObjectRelease();
      }
      v37 = v44;
      v38 = (void *)sub_21DBD238C();
      swift_bridgeObjectRelease();
      objc_msgSend(v30, sel_sendWithMessage_with_and_for_, v38, 1, 0, v29);

      if (*(_QWORD *)(v26 + 40) && (swift_retain(), sub_21DBBBF80(), swift_release(), *(_QWORD *)(v26 + 40)))
      {
        swift_retain();
        sub_21DBBA6C4();
        swift_unknownObjectRelease();
        swift_release();
      }
      else
      {
        swift_unknownObjectRelease();
      }
      v39 = v41[0];
      sub_21DBBA1BC(v42, type metadata accessor for StartedReporterData);
      sub_21DBBA1BC((uint64_t)v20, type metadata accessor for ActiveReporterState);
      v40 = (uint64_t)v37 + *(int *)(v39 + 48);
      *v37 = v26;
      sub_21DBC192C(v43, v40, type metadata accessor for StartedReporterData);
      swift_storeEnumTagMultiPayload();
    }
    return swift_storeEnumTagMultiPayload();
  }
  else
  {
    sub_21DBBA1BC((uint64_t)v12, type metadata accessor for ReporterState);
    return sub_21DBC1644(a1, (uint64_t)v44, type metadata accessor for ReporterState);
  }
}

uint64_t sub_21DBC11B0@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t active;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t (*v17)(_QWORD);
  int EnumCaseMultiPayload;
  int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  os_log_type_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;

  active = type metadata accessor for ActiveReporterState(0);
  v7 = MEMORY[0x24BDAC7A8](active, v6);
  v9 = (uint64_t *)((char *)&v34 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x24BDAC7A8](v7, v10);
  v12 = (uint64_t *)((char *)&v34 - v11);
  v13 = type metadata accessor for ReporterState(0);
  MEMORY[0x24BDAC7A8](v13, v14);
  v16 = (uint64_t *)((char *)&v34 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_21DBC1644(a1, (uint64_t)v16, v17);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (!EnumCaseMultiPayload)
  {
    v24 = *v16;
    v25 = OBJC_IVAR____TtC14AudioAnalytics12ServerClient_messageCache;
    if (!*(_QWORD *)(v2 + OBJC_IVAR____TtC14AudioAnalytics12ServerClient_messageCache))
    {
      type metadata accessor for MessageCache();
      v33 = swift_allocObject();
      *(_QWORD *)(v33 + 16) = sub_21DBB8E5C();
      *(_QWORD *)(v2 + v25) = v33;
      swift_retain();
      swift_release();
    }
    *v9 = v24;
    swift_storeEnumTagMultiPayload();
    swift_retain();
    swift_retain();
    sub_21DBB7ED8((uint64_t)v9);
    swift_release();
    sub_21DBBA1BC((uint64_t)v9, type metadata accessor for ActiveReporterState);
    *a2 = v24;
    swift_storeEnumTagMultiPayload();
    return swift_storeEnumTagMultiPayload();
  }
  if (EnumCaseMultiPayload == 1)
  {
    sub_21DBC192C((uint64_t)v16, (uint64_t)a2, type metadata accessor for ActiveReporterState);
    sub_21DBC1644((uint64_t)a2, (uint64_t)v12, type metadata accessor for ActiveReporterState);
    v19 = swift_getEnumCaseMultiPayload();
    v20 = *v12;
    if (v19 != 1)
    {
      v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F3D888);
      sub_21DBBA1BC((uint64_t)v12 + *(int *)(v21 + 48), type metadata accessor for StartedReporterData);
    }
    v22 = *(_QWORD *)(v20 + 16);
    swift_release();
    objc_msgSend((id)sub_21DBC58F8(a1, 3), sel_destroySessionFor_, v22);
    swift_unknownObjectRelease();
    v23 = OBJC_IVAR____TtC14AudioAnalytics12ServerClient_messageCache;
    if (!*(_QWORD *)(v2 + OBJC_IVAR____TtC14AudioAnalytics12ServerClient_messageCache))
    {
      type metadata accessor for MessageCache();
      v32 = swift_allocObject();
      *(_QWORD *)(v32 + 16) = sub_21DBB8E5C();
      *(_QWORD *)(v2 + v23) = v32;
      swift_retain();
      swift_release();
    }
    swift_retain();
    sub_21DBB7ED8((uint64_t)a2);
    swift_release();
    return swift_storeEnumTagMultiPayload();
  }
  if (qword_253F3DA18 != -1)
    swift_once();
  v26 = sub_21DBD2320();
  __swift_project_value_buffer(v26, (uint64_t)qword_253F3DC78);
  v27 = sub_21DBD2308();
  v28 = sub_21DBD244C();
  if (os_log_type_enabled(v27, v28))
  {
    v29 = swift_slowAlloc();
    v30 = swift_slowAlloc();
    v35 = v30;
    *(_DWORD *)v29 = 136315650;
    v34 = sub_21DBCECA4(0xD00000000000006BLL, 0x800000021DBD50F0, &v35);
    sub_21DBD24AC();
    *(_WORD *)(v29 + 12) = 2080;
    v34 = sub_21DBCECA4(0xD00000000000003ELL, 0x800000021DBD50B0, &v35);
    sub_21DBD24AC();
    *(_WORD *)(v29 + 22) = 2048;
    v34 = 175;
    sub_21DBD24AC();
    _os_log_impl(&dword_21DBAF000, v27, v28, "PRECONDITION FAILURE { file = %s, function = %s, line = %ld }", (uint8_t *)v29, 0x20u);
    swift_arrayDestroy();
    MEMORY[0x22079B7C0](v30, -1, -1);
    MEMORY[0x22079B7C0](v29, -1, -1);
  }

  sub_21DBC1644(a1, (uint64_t)a2, type metadata accessor for ReporterState);
  return sub_21DBBA1BC((uint64_t)v16, type metadata accessor for ReporterState);
}

uint64_t sub_21DBC1644(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

void sub_21DBC1688(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t active;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  int EnumCaseMultiPayload;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;

  v5 = type metadata accessor for ReporterState(0);
  MEMORY[0x24BDAC7A8](v5, v6);
  v8 = (uint64_t *)((char *)&v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  active = type metadata accessor for ActiveReporterState(0);
  v11 = MEMORY[0x24BDAC7A8](active, v10);
  v13 = (char *)&v28 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = MEMORY[0x24BDAC7A8](v11, v14);
  v17 = (uint64_t *)((char *)&v28 - v16);
  MEMORY[0x24BDAC7A8](v15, v18);
  v20 = (char *)&v28 - v19;
  sub_21DBC1644(a1, (uint64_t)v8, type metadata accessor for ReporterState);
  if (swift_getEnumCaseMultiPayload())
  {
    sub_21DBC192C((uint64_t)v8, (uint64_t)v20, type metadata accessor for ActiveReporterState);
    sub_21DBC1644((uint64_t)v20, (uint64_t)v17, type metadata accessor for ActiveReporterState);
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    v22 = *v17;
    if (EnumCaseMultiPayload != 1)
    {
      v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F3D888);
      sub_21DBBA1BC((uint64_t)v17 + *(int *)(v23 + 48), type metadata accessor for StartedReporterData);
    }
    sub_21DBC836C(v22, a3);
    swift_release();
    v24 = (void *)sub_21DBC58F8(a1, 3);
    sub_21DBC1644((uint64_t)v20, (uint64_t)v13, type metadata accessor for ActiveReporterState);
    if (swift_getEnumCaseMultiPayload() != 1)
    {
      v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F3D888);
      sub_21DBBA1BC((uint64_t)&v13[*(int *)(v25 + 48)], type metadata accessor for StartedReporterData);
    }
    sub_21DBBA1BC((uint64_t)v20, type metadata accessor for ActiveReporterState);
    swift_beginAccess();
    swift_bridgeObjectRetain();
    swift_release();
    v26 = (void *)sub_21DBD238C();
    swift_bridgeObjectRelease();
    v27 = *(_QWORD *)(sub_21DBC7934() + 16);
    swift_release();
    objc_msgSend(v24, sel_setWithConfiguration_for_, v26, v27);
    swift_unknownObjectRelease();

  }
  else
  {
    sub_21DBC836C(*v8, a3);
    swift_release();
  }
}

uint64_t sub_21DBC192C(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_21DBC1970(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  int64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F3D8C0);
  v4 = *(_QWORD *)(v3 - 8);
  v6 = MEMORY[0x24BDAC7A8](v3, v5);
  v8 = (uint64_t *)((char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x24BDAC7A8](v6, v9);
  v11 = (uint64_t *)((char *)&v22 - v10);
  v12 = *(_QWORD *)(a1 + 16);
  v13 = MEMORY[0x24BEE4AF8];
  if (v12)
  {
    v22 = v1;
    v24 = MEMORY[0x24BEE4AF8];
    sub_21DBCAD14(0, v12, 0);
    v14 = (uint64_t *)(a1 + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80)));
    v23 = *(_QWORD *)(v4 + 72);
    do
    {
      v15 = *(int *)(v3 + 48);
      v16 = (uint64_t)v11 + v15;
      v17 = *v14;
      *v11 = *v14;
      sub_21DBC1644((uint64_t)v14 + v15, (uint64_t)v11 + v15, type metadata accessor for ReporterState);
      v18 = (uint64_t)v8 + *(int *)(v3 + 48);
      *v8 = v17;
      sub_21DBC192C(v16, v18, type metadata accessor for ReporterState);
      sub_21DBB6B98((uint64_t)v8, &qword_253F3D8C0);
      v13 = v24;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_21DBCAD14(0, *(_QWORD *)(v13 + 16) + 1, 1);
        v13 = v24;
      }
      v20 = *(_QWORD *)(v13 + 16);
      v19 = *(_QWORD *)(v13 + 24);
      if (v20 >= v19 >> 1)
      {
        sub_21DBCAD14(v19 > 1, v20 + 1, 1);
        v13 = v24;
      }
      v14 = (uint64_t *)((char *)v14 + v23);
      *(_QWORD *)(v13 + 16) = v20 + 1;
      *(_QWORD *)(v13 + 8 * v20 + 32) = v17;
      --v12;
    }
    while (v12);
  }
  return v13;
}

uint64_t sub_21DBC1B2C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v8;
  _OWORD v9[2];

  if (*(_QWORD *)(a1 + 24))
  {
    sub_21DBB3F4C((_OWORD *)a1, v9);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v8 = *v3;
    *v3 = 0x8000000000000000;
    sub_21DBD0C60(v9, a2, a3, isUniquelyReferenced_nonNull_native);
    *v3 = v8;
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  else
  {
    sub_21DBB6B98(a1, &qword_253F3D900);
    sub_21DBCB028(a2, a3, v9);
    swift_bridgeObjectRelease();
    return sub_21DBB6B98((uint64_t)v9, &qword_253F3D900);
  }
}

uint64_t sub_21DBC1C00(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  unint64_t v15;
  char v16;
  unint64_t v17;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v19;
  uint64_t v20;
  char v21;
  uint64_t v23;
  uint64_t v24;

  v3 = v2;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F3D9F0);
  MEMORY[0x24BDAC7A8](v6, v7);
  v9 = (char *)&v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for ReporterState(0);
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10, v12);
  v14 = (char *)&v23 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v11 + 48))(a1, 1, v10) == 1)
  {
    sub_21DBB6B98(a1, &qword_253F3D9F0);
    v15 = sub_21DBCF30C(a2);
    if ((v16 & 1) != 0)
    {
      v17 = v15;
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v19 = *v3;
      v24 = *v3;
      *v3 = 0x8000000000000000;
      if (!isUniquelyReferenced_nonNull_native)
      {
        sub_21DBD17DC();
        v19 = v24;
      }
      sub_21DBC192C(*(_QWORD *)(v19 + 56) + *(_QWORD *)(v11 + 72) * v17, (uint64_t)v9, type metadata accessor for ReporterState);
      sub_21DBBA000(v17, v19);
      *v3 = v19;
      swift_bridgeObjectRelease();
      v20 = 0;
    }
    else
    {
      v20 = 1;
    }
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v11 + 56))(v9, v20, 1, v10);
    return sub_21DBB6B98((uint64_t)v9, &qword_253F3D9F0);
  }
  else
  {
    sub_21DBC192C(a1, (uint64_t)v14, type metadata accessor for ReporterState);
    v21 = swift_isUniquelyReferenced_nonNull_native();
    v24 = *v3;
    *v3 = 0x8000000000000000;
    sub_21DBD0EE4((uint64_t)v14, a2, v21);
    *v3 = v24;
    return swift_bridgeObjectRelease();
  }
}

char *sub_21DBC1DD8()
{
  id v0;
  char *result;

  v0 = objc_allocWithZone((Class)type metadata accessor for ServerClient(0));
  result = sub_21DBC1EA8(0, 0);
  qword_253F3DC50 = (uint64_t)result;
  return result;
}

char *sub_21DBC1EA8(void *a1, uint64_t a2)
{
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
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
  id v26;
  id v27;
  void *v28;
  objc_class *v29;
  char *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  char *v34;
  id v35;
  id v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  id v41;
  void *v42;
  uint64_t v43;
  void *v44;
  id v45;
  void *v46;
  uint64_t v47;
  void *v48;
  NSObject *v49;
  uint32_t v50;
  NSObject *v51;
  os_log_type_t v52;
  uint64_t v53;
  const char *v54;
  BOOL v55;
  id v56;
  uint64_t v58;
  id v59;
  int v60;
  int out_token;
  objc_super v62;
  uint64_t aBlock;
  uint64_t v64;
  void *v65;
  void *v66;
  void *v67;
  uint64_t v68;
  uint64_t v69;

  v58 = a2;
  v59 = a1;
  v69 = *MEMORY[0x24BDAC8D0];
  v3 = sub_21DBD2464();
  MEMORY[0x24BDAC7A8](v3, v4);
  v5 = sub_21DBD2470();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5, v7);
  v9 = (char *)&v58 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_21DBD2368();
  MEMORY[0x24BDAC7A8](v10, v11);
  v12 = &v2[OBJC_IVAR____TtC14AudioAnalytics12ServerClient_logger];
  v13 = qword_253F3DA18;
  v14 = v2;
  if (v13 != -1)
    swift_once();
  v15 = sub_21DBD2320();
  v16 = __swift_project_value_buffer(v15, (uint64_t)qword_253F3DC78);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 16))(v12, v16, v15);
  v17 = OBJC_IVAR____TtC14AudioAnalytics12ServerClient_halIOCategory;
  *(_DWORD *)&v14[v17] = sub_21DBB79C8((uint64_t)&unk_24E199BB0);
  v18 = OBJC_IVAR____TtC14AudioAnalytics12ServerClient_serialQueue;
  sub_21DBB6AD0(0, (unint64_t *)&qword_253F3DA60);
  sub_21DBD235C();
  (*(void (**)(char *, _QWORD, uint64_t))(v6 + 104))(v9, *MEMORY[0x24BEE5758], v5);
  v19 = MEMORY[0x24BEE4AF8];
  aBlock = MEMORY[0x24BEE4AF8];
  sub_21DBCBE28();
  __swift_instantiateConcreteTypeFromMangledName(&qword_253F3DA00);
  sub_21DBCBE70();
  sub_21DBD24DC();
  *(_QWORD *)&v14[v18] = sub_21DBD2494();
  v20 = OBJC_IVAR____TtC14AudioAnalytics12ServerClient_idGenerator;
  type metadata accessor for ReporterIDGenerator();
  v21 = swift_allocObject();
  *(_DWORD *)(v21 + 16) = 0;
  *(_QWORD *)&v14[v20] = v21;
  v22 = OBJC_IVAR____TtC14AudioAnalytics12ServerClient_messageRateLimiter;
  type metadata accessor for RateLimiter();
  v23 = swift_allocObject();
  type metadata accessor for TokenBucket();
  v24 = swift_allocObject();
  *(_QWORD *)(v24 + 16) = 0x2000000020;
  *(_DWORD *)(v24 + 24) = 0;
  *(_QWORD *)(v24 + 32) = 0;
  *(_QWORD *)(v23 + 16) = v24;
  *(_QWORD *)&v14[v22] = v23;
  v25 = OBJC_IVAR____TtC14AudioAnalytics12ServerClient_clientReporterStates;
  *(_QWORD *)&v14[v25] = sub_21DBD19F0(v19);
  *(_QWORD *)&v14[OBJC_IVAR____TtC14AudioAnalytics12ServerClient_messageCache] = 0;
  v14[OBJC_IVAR____TtC14AudioAnalytics12ServerClient__isCachingEnabled] = 0;
  if (v59)
  {
    v26 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD1988]), sel_initWithListenerEndpoint_, v59);
  }
  else
  {
    v27 = objc_allocWithZone(MEMORY[0x24BDD1988]);
    v28 = (void *)sub_21DBD23BC();
    v26 = objc_msgSend(v27, sel_initWithMachServiceName_options_, v28, 4096);

  }
  *(_QWORD *)&v14[OBJC_IVAR____TtC14AudioAnalytics12ServerClient_xpcConnection] = v26;
  *(_QWORD *)&v14[OBJC_IVAR____TtC14AudioAnalytics12ServerClient_injectedServerProtocol] = v58;
  swift_unknownObjectRetain();

  v29 = (objc_class *)type metadata accessor for ServerClient(0);
  v62.receiver = v14;
  v62.super_class = v29;
  v30 = (char *)objc_msgSendSuper2(&v62, sel_init);
  v31 = OBJC_IVAR____TtC14AudioAnalytics12ServerClient_xpcConnection;
  v32 = *(void **)&v30[OBJC_IVAR____TtC14AudioAnalytics12ServerClient_xpcConnection];
  v33 = (void *)objc_opt_self();
  v34 = v30;
  v35 = v32;
  v36 = objc_msgSend(v33, sel_interfaceWithProtocol_, &unk_2553A6698);
  objc_msgSend(v35, sel_setRemoteObjectInterface_, v36);

  v37 = *(void **)&v30[v31];
  v38 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v67 = sub_21DBCBF24;
  v68 = v38;
  v39 = MEMORY[0x24BDAC760];
  aBlock = MEMORY[0x24BDAC760];
  v64 = 1107296256;
  v65 = sub_21DBC31CC;
  v66 = &block_descriptor_106;
  v40 = _Block_copy(&aBlock);
  v41 = v37;
  swift_release();
  objc_msgSend(v41, sel_setInterruptionHandler_, v40);
  _Block_release(v40);

  v42 = *(void **)&v30[v31];
  v43 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v67 = sub_21DBCBF2C;
  v68 = v43;
  aBlock = v39;
  v64 = 1107296256;
  v65 = sub_21DBC31CC;
  v66 = &block_descriptor_110;
  v44 = _Block_copy(&aBlock);
  v45 = v42;
  swift_release();
  objc_msgSend(v45, sel_setInvalidationHandler_, v44);
  _Block_release(v44);

  out_token = -1;
  v46 = *(void **)&v34[OBJC_IVAR____TtC14AudioAnalytics12ServerClient_serialQueue];
  v47 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v67 = sub_21DBCBF34;
  v68 = v47;
  aBlock = v39;
  v64 = 1107296256;
  v65 = sub_21DBC3510;
  v66 = &block_descriptor_114;
  v48 = _Block_copy(&aBlock);
  v49 = v46;
  swift_release();
  v50 = notify_register_dispatch("com.apple.system.console_mode_changed", &out_token, v49, v48);
  _Block_release(v48);

  if (v50)
  {
    v51 = sub_21DBD2308();
    v52 = sub_21DBD2440();
    if (os_log_type_enabled(v51, v52))
    {
      v53 = swift_slowAlloc();
      *(_DWORD *)v53 = 67174913;
      LODWORD(aBlock) = v50;
      sub_21DBD24AC();
      *(_WORD *)(v53 + 8) = 1024;
      swift_beginAccess();
      v60 = out_token;
      sub_21DBD24AC();
      v54 = "GameMode notifications failed to initialize! Defaulting to off. { result=%{private}u, token=%d }";
LABEL_11:
      _os_log_impl(&dword_21DBAF000, v51, v52, v54, (uint8_t *)v53, 0xEu);
      MEMORY[0x22079B7C0](v53, -1, -1);
    }
  }
  else
  {
    v55 = sub_21DBC9098(out_token);
    sub_21DBC9588(v55);
    v51 = sub_21DBD2308();
    v52 = sub_21DBD2434();
    if (os_log_type_enabled(v51, v52))
    {
      v53 = swift_slowAlloc();
      *(_DWORD *)v53 = 67174913;
      LODWORD(aBlock) = 0;
      sub_21DBD24AC();
      *(_WORD *)(v53 + 8) = 1024;
      swift_beginAccess();
      v60 = out_token;
      sub_21DBD24AC();
      v54 = "Listening for GameMode notifications. { result=%{private}u, token=%d }";
      goto LABEL_11;
    }
  }

  v56 = *(id *)&v30[v31];
  objc_msgSend(v56, sel_resume);

  swift_unknownObjectRelease();
  return v34;
}

uint64_t sub_21DBC2684(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD aBlock[6];

  v1 = a1 + 16;
  swift_beginAccess();
  result = MEMORY[0x22079B814](v1);
  if (result)
  {
    v3 = (void *)result;
    v4 = *(NSObject **)(result + OBJC_IVAR____TtC14AudioAnalytics12ServerClient_serialQueue);
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = v3;
    v6 = swift_allocObject();
    *(_QWORD *)(v6 + 16) = sub_21DBCBF60;
    *(_QWORD *)(v6 + 24) = v5;
    aBlock[4] = sub_21DBB6BD4;
    aBlock[5] = v6;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_21DBB3BEC;
    aBlock[3] = &block_descriptor_124;
    v7 = _Block_copy(aBlock);
    v8 = v3;
    swift_retain();
    swift_release();
    dispatch_sync(v4, v7);

    _Block_release(v7);
    LOBYTE(v4) = swift_isEscapingClosureAtFileLocation();
    swift_release();
    result = swift_release();
    if ((v4 & 1) != 0)
      __break(1u);
  }
  return result;
}

uint64_t sub_21DBC27DC(char *a1)
{
  NSObject *v1;
  os_log_type_t v2;
  uint8_t *v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  unint64_t v9;
  char v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  NSObject *v20;
  os_log_type_t v21;
  uint8_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v32;
  uint64_t v34[2];

  v1 = sub_21DBD2308();
  v2 = sub_21DBD2458();
  if (os_log_type_enabled(v1, v2))
  {
    v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_21DBAF000, v1, v2, "Interruption handler: Server exited or crashed.", v3, 2u);
    MEMORY[0x22079B7C0](v3, -1, -1);
  }

  v4 = (uint64_t *)&a1[OBJC_IVAR____TtC14AudioAnalytics12ServerClient_clientReporterStates];
  swift_beginAccess();
  v5 = swift_bridgeObjectRetain();
  v6 = sub_21DBC2C80(v5);
  v32 = v4;
  if (!*(_QWORD *)(v6 + 16))
    goto LABEL_11;
  sub_21DBCF33C(0x657463656E6E6F63, 0xE900000000000064);
  if ((v7 & 1) != 0)
  {
    v8 = swift_bridgeObjectRetain();
    sub_21DBC1970(v8);
    swift_bridgeObjectRelease();
    if (!*(_QWORD *)(v6 + 16))
      goto LABEL_11;
  }
  else if (!*(_QWORD *)(v6 + 16))
  {
    goto LABEL_11;
  }
  v9 = sub_21DBCF33C(0x656E6E6F63736964, 0xEC00000064657463);
  if ((v10 & 1) != 0)
  {
    v11 = *(_QWORD *)(*(_QWORD *)(v6 + 56) + 8 * v9);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    sub_21DBC1970(v11);
    swift_bridgeObjectRelease();
    goto LABEL_12;
  }
LABEL_11:
  swift_bridgeObjectRelease();
LABEL_12:
  swift_bridgeObjectRetain();
  v12 = sub_21DBD2308();
  v13 = sub_21DBD2458();
  if (os_log_type_enabled(v12, v13))
  {
    v14 = (uint8_t *)swift_slowAlloc();
    v15 = swift_slowAlloc();
    v34[0] = v15;
    *(_DWORD *)v14 = 136446210;
    v16 = swift_bridgeObjectRetain();
    v17 = MEMORY[0x22079B0F4](v16, MEMORY[0x24BEE4008]);
    v19 = v18;
    swift_bridgeObjectRelease();
    sub_21DBCECA4(v17, v19, v34);
    sub_21DBD24AC();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21DBAF000, v12, v13, "Reconnecting started reporters. { reporterIDs=%{public}s }", v14, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x22079B7C0](v15, -1, -1);
    MEMORY[0x22079B7C0](v14, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  swift_bridgeObjectRetain();
  v20 = sub_21DBD2308();
  v21 = sub_21DBD2458();
  if (os_log_type_enabled(v20, v21))
  {
    v22 = (uint8_t *)swift_slowAlloc();
    v23 = swift_slowAlloc();
    v34[0] = v23;
    *(_DWORD *)v22 = 136446210;
    v24 = swift_bridgeObjectRetain();
    v25 = MEMORY[0x22079B0F4](v24, MEMORY[0x24BEE4008]);
    v27 = v26;
    swift_bridgeObjectRelease();
    sub_21DBCECA4(v25, v27, v34);
    sub_21DBD24AC();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21DBAF000, v20, v21, "Disconnecting all other reporters. { reporterIDs=%{public}s }", v22, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x22079B7C0](v23, -1, -1);
    MEMORY[0x22079B7C0](v22, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  v28 = a1;
  v29 = swift_bridgeObjectRetain();
  v30 = sub_21DBCBF78(v29, (uint64_t)v28);
  swift_bridgeObjectRelease();

  *v32 = v30;
  return swift_bridgeObjectRelease();
}

uint64_t sub_21DBC2C80(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  int64_t v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  int64_t v24;
  unint64_t v25;
  int64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t);
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char v39;
  unint64_t v40;
  uint64_t v41;
  _BOOL8 v42;
  uint64_t v43;
  char v44;
  unint64_t v45;
  char v46;
  uint64_t v47;
  unint64_t v48;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v50;
  unint64_t v51;
  unint64_t v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  BOOL v56;
  uint64_t v57;
  uint64_t result;
  uint64_t v59;
  __int128 v60;
  uint64_t v61;
  int64_t v62;
  uint64_t v63;
  uint64_t v64;
  char *v65;
  _QWORD *v66;
  uint64_t v67;
  uint64_t v68;
  _QWORD *v69;

  v67 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F3D8C0);
  v64 = *(_QWORD *)(v67 - 8);
  v3 = MEMORY[0x24BDAC7A8](v67, v2);
  v63 = (uint64_t)&v59 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = MEMORY[0x24BDAC7A8](v3, v5);
  v66 = (uint64_t *)((char *)&v59 - v7);
  v9 = MEMORY[0x24BDAC7A8](v6, v8);
  v11 = (uint64_t *)((char *)&v59 - v10);
  MEMORY[0x24BDAC7A8](v9, v12);
  v65 = (char *)&v59 - v13;
  v14 = 0;
  v15 = (_QWORD *)MEMORY[0x24BEE4B00];
  v69 = (_QWORD *)MEMORY[0x24BEE4B00];
  v68 = a1;
  v18 = *(_QWORD *)(a1 + 64);
  v17 = a1 + 64;
  v16 = v18;
  v19 = 1 << *(_BYTE *)(v17 - 32);
  v20 = -1;
  if (v19 < 64)
    v20 = ~(-1 << v19);
  v21 = v20 & v16;
  v61 = v17;
  v62 = (unint64_t)(v19 + 63) >> 6;
  v60 = xmmword_21DBD32D0;
  while (1)
  {
    if (v21)
    {
      v22 = __clz(__rbit64(v21));
      v21 &= v21 - 1;
      v23 = v22 | (v14 << 6);
    }
    else
    {
      v24 = v14 + 1;
      if (__OFADD__(v14, 1))
        goto LABEL_43;
      if (v24 >= v62)
      {
LABEL_40:
        swift_release();
        return (uint64_t)v15;
      }
      v25 = *(_QWORD *)(v61 + 8 * v24);
      ++v14;
      if (!v25)
      {
        v14 = v24 + 1;
        if (v24 + 1 >= v62)
          goto LABEL_40;
        v25 = *(_QWORD *)(v61 + 8 * v14);
        if (!v25)
        {
          v14 = v24 + 2;
          if (v24 + 2 >= v62)
            goto LABEL_40;
          v25 = *(_QWORD *)(v61 + 8 * v14);
          if (!v25)
          {
            v14 = v24 + 3;
            if (v24 + 3 >= v62)
              goto LABEL_40;
            v25 = *(_QWORD *)(v61 + 8 * v14);
            if (!v25)
            {
              v26 = v24 + 4;
              if (v26 >= v62)
                goto LABEL_40;
              v25 = *(_QWORD *)(v61 + 8 * v26);
              if (!v25)
              {
                while (1)
                {
                  v14 = v26 + 1;
                  if (__OFADD__(v26, 1))
                    goto LABEL_44;
                  if (v14 >= v62)
                    goto LABEL_40;
                  v25 = *(_QWORD *)(v61 + 8 * v14);
                  ++v26;
                  if (v25)
                    goto LABEL_21;
                }
              }
              v14 = v26;
            }
          }
        }
      }
LABEL_21:
      v21 = (v25 - 1) & v25;
      v23 = __clz(__rbit64(v25)) + (v14 << 6);
    }
    v27 = *(_QWORD *)(v68 + 56);
    v28 = *(_QWORD *)(*(_QWORD *)(v68 + 48) + 8 * v23);
    v29 = v27 + *(_QWORD *)(*(_QWORD *)(type metadata accessor for ReporterState(0) - 8) + 72) * v23;
    v30 = v67;
    v31 = v65;
    sub_21DBC1644(v29, (uint64_t)&v65[*(int *)(v67 + 48)], type metadata accessor for ReporterState);
    *v31 = v28;
    sub_21DBCC218((uint64_t)v31, (uint64_t)v11, &qword_253F3D8C0);
    v32 = *(int *)(v30 + 48);
    v33 = (uint64_t)v66 + v32;
    *v66 = *v11;
    sub_21DBC1644((uint64_t)v11 + v32, v33, type metadata accessor for ReporterState);
    if (swift_getEnumCaseMultiPayload() != 1)
    {
      v34 = v33;
      v35 = type metadata accessor for ReporterState;
      goto LABEL_26;
    }
    type metadata accessor for ActiveReporterState(0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v34 = v33;
      v35 = type metadata accessor for ActiveReporterState;
LABEL_26:
      sub_21DBBA1BC(v34, v35);
      v36 = 0x656E6E6F63736964;
      v37 = 0xEC00000064657463;
      goto LABEL_28;
    }
    swift_release();
    v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F3D888);
    sub_21DBBA1BC(v33 + *(int *)(v38 + 48), type metadata accessor for StartedReporterData);
    v37 = 0xE900000000000064;
    v36 = 0x657463656E6E6F63;
LABEL_28:
    v40 = sub_21DBCF33C(v36, v37);
    v41 = v15[2];
    v42 = (v39 & 1) == 0;
    v43 = v41 + v42;
    if (__OFADD__(v41, v42))
      break;
    v44 = v39;
    if (v15[3] < v43)
    {
      sub_21DBD04C8(v43, 1);
      v15 = v69;
      v45 = sub_21DBCF33C(v36, v37);
      if ((v44 & 1) != (v46 & 1))
        goto LABEL_45;
      v40 = v45;
    }
    if ((v44 & 1) != 0)
    {
      swift_bridgeObjectRelease();
      v47 = v15[7];
      sub_21DBCC218((uint64_t)v11, v63, &qword_253F3D8C0);
      v48 = *(_QWORD *)(v47 + 8 * v40);
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      *(_QWORD *)(v47 + 8 * v40) = v48;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        v48 = sub_21DBB9A88(0, *(_QWORD *)(v48 + 16) + 1, 1, v48);
        *(_QWORD *)(v47 + 8 * v40) = v48;
      }
      v51 = *(_QWORD *)(v48 + 16);
      v50 = *(_QWORD *)(v48 + 24);
      if (v51 >= v50 >> 1)
      {
        v48 = sub_21DBB9A88(v50 > 1, v51 + 1, 1, v48);
        *(_QWORD *)(v47 + 8 * v40) = v48;
      }
      *(_QWORD *)(v48 + 16) = v51 + 1;
      sub_21DBCC218(v63, v48+ ((*(unsigned __int8 *)(v64 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v64 + 80))+ *(_QWORD *)(v64 + 72) * v51, &qword_253F3D8C0);
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_253F3D860);
      v52 = (*(unsigned __int8 *)(v64 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v64 + 80);
      v53 = swift_allocObject();
      *(_OWORD *)(v53 + 16) = v60;
      sub_21DBCC218((uint64_t)v11, v53 + v52, &qword_253F3D8C0);
      v15[(v40 >> 6) + 8] |= 1 << v40;
      v54 = (uint64_t *)(v15[6] + 16 * v40);
      *v54 = v36;
      v54[1] = v37;
      *(_QWORD *)(v15[7] + 8 * v40) = v53;
      v55 = v15[2];
      v56 = __OFADD__(v55, 1);
      v57 = v55 + 1;
      if (v56)
        goto LABEL_42;
      v15[2] = v57;
    }
  }
  __break(1u);
LABEL_42:
  __break(1u);
LABEL_43:
  __break(1u);
LABEL_44:
  __break(1u);
LABEL_45:
  result = sub_21DBD2584();
  __break(1u);
  return result;
}

uint64_t sub_21DBC31CC(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

uint64_t sub_21DBC31F8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t result;
  void *v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  uint64_t v12;

  v2 = sub_21DBD2320();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2, v4);
  v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  result = MEMORY[0x22079B814](a1 + 16);
  if (result)
  {
    v8 = (void *)result;
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v6, result + OBJC_IVAR____TtC14AudioAnalytics12ServerClient_logger, v2);

    v9 = sub_21DBD2308();
    v10 = sub_21DBD2434();
    if (os_log_type_enabled(v9, v10))
    {
      v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_21DBAF000, v9, v10, "Invalidation handler: Connection cannot be formed.", v11, 2u);
      MEMORY[0x22079B7C0](v11, -1, -1);
    }

    return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  }
  return result;
}

void sub_21DBC3328(int a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  BOOL v9;
  uint64_t v10;
  os_log_type_t v11;
  uint8_t *v12;

  v3 = a2 + 16;
  swift_beginAccess();
  v4 = MEMORY[0x22079B814](v3);
  if (v4)
  {
    v5 = v4;
    v6 = sub_21DBD2308();
    v7 = sub_21DBD2434();
    if (os_log_type_enabled(v6, v7))
    {
      v8 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)v8 = 67109120;
      sub_21DBD24AC();
      _os_log_impl(&dword_21DBAF000, v6, v7, "Game mode notification received. { token=%d }", v8, 8u);
      MEMORY[0x22079B7C0](v8, -1, -1);
    }

    v9 = sub_21DBC9098(a1);
    sub_21DBC9588(v9);
  }
  else
  {
    if (qword_253F3DA18 != -1)
      swift_once();
    v10 = sub_21DBD2320();
    __swift_project_value_buffer(v10, (uint64_t)qword_253F3DC78);
    v5 = sub_21DBD2308();
    v11 = sub_21DBD2440();
    if (os_log_type_enabled(v5, v11))
    {
      v12 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)v12 = 67109120;
      sub_21DBD24AC();
      _os_log_impl(&dword_21DBAF000, v5, v11, "Game mode notification received, but self is nil. { token=%d }", v12, 8u);
      MEMORY[0x22079B7C0](v12, -1, -1);
    }
  }

}

uint64_t sub_21DBC3510(uint64_t a1, uint64_t a2)
{
  void (*v3)(uint64_t);

  v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);
  return swift_release();
}

uint64_t sub_21DBC3628@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_21DBC71AC(0x100000000);
  *a1 = result;
  return result;
}

uint64_t sub_21DBC36D8@<X0>(unsigned int a1@<W1>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = sub_21DBC71AC(a1);
  *a2 = result;
  return result;
}

uint64_t sub_21DBC378C(uint64_t a1)
{
  char *v1;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  char *v7;
  char isEscapingClosureAtFileLocation;
  uint64_t result;
  _QWORD v10[6];

  v3 = *(NSObject **)&v1[OBJC_IVAR____TtC14AudioAnalytics12ServerClient_serialQueue];
  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = v1;
  *(_QWORD *)(v4 + 24) = a1;
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = sub_21DBCBDF4;
  *(_QWORD *)(v5 + 24) = v4;
  v10[4] = sub_21DBB6BD4;
  v10[5] = v5;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 1107296256;
  v10[2] = sub_21DBB3BEC;
  v10[3] = &block_descriptor_100;
  v6 = _Block_copy(v10);
  v7 = v1;
  swift_retain();
  swift_release();
  dispatch_sync(v3, v6);
  _Block_release(v6);
  isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  swift_release();
  result = swift_release();
  if ((isEscapingClosureAtFileLocation & 1) != 0)
    __break(1u);
  return result;
}

uint64_t sub_21DBC38B8(uint64_t a1, uint64_t a2)
{
  return sub_21DBC5DC0(a2);
}

uint64_t sub_21DBC391C(uint64_t a1)
{
  char *v1;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  char *v7;
  char isEscapingClosureAtFileLocation;
  uint64_t result;
  _QWORD v10[6];

  v3 = *(NSObject **)&v1[OBJC_IVAR____TtC14AudioAnalytics12ServerClient_serialQueue];
  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = v1;
  *(_QWORD *)(v4 + 24) = a1;
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = sub_21DBCBDC0;
  *(_QWORD *)(v5 + 24) = v4;
  v10[4] = sub_21DBB6BD4;
  v10[5] = v5;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 1107296256;
  v10[2] = sub_21DBB3BEC;
  v10[3] = &block_descriptor_90;
  v6 = _Block_copy(v10);
  v7 = v1;
  swift_retain();
  swift_release();
  dispatch_sync(v3, v6);
  _Block_release(v6);
  isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  swift_release();
  result = swift_release();
  if ((isEscapingClosureAtFileLocation & 1) != 0)
    __break(1u);
  return result;
}

uint64_t sub_21DBC3A48(uint64_t a1, uint64_t a2)
{
  return sub_21DBC6170(a2);
}

uint64_t sub_21DBC3AAC@<X0>(uint64_t a1@<X1>, __int16 *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  uint64_t v19;
  uint8_t *v20;
  uint8_t *v21;
  uint64_t result;
  __int16 v23;
  int EnumCaseMultiPayload;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  __int16 *v29;
  uint64_t v30;

  v29 = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F3D9F0);
  MEMORY[0x24BDAC7A8](v3, v4);
  v6 = (char *)&v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for ReporterState(0);
  v8 = *(_QWORD *)(v7 - 8);
  v10 = MEMORY[0x24BDAC7A8](v7, v9);
  v12 = (char *)&v27 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10, v13);
  v15 = (char *)&v27 - v14;
  v16 = sub_21DBD2308();
  v17 = sub_21DBD2434();
  if (os_log_type_enabled(v16, v17))
  {
    v18 = (uint8_t *)swift_slowAlloc();
    v28 = v12;
    v19 = a1;
    v20 = v18;
    *(_DWORD *)v18 = 134217984;
    v30 = v19;
    sub_21DBD24AC();
    _os_log_impl(&dword_21DBAF000, v16, v17, "Get serviceType. { reporterID=%lld }", v20, 0xCu);
    v21 = v20;
    a1 = v19;
    v12 = v28;
    MEMORY[0x22079B7C0](v21, -1, -1);
  }

  sub_21DBC8CF0(a1, 0xD00000000000001BLL, 0x800000021DBD5700, (uint64_t)v6);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
  {
    result = sub_21DBB6B98((uint64_t)v6, &qword_253F3D9F0);
    v23 = -1;
  }
  else
  {
    sub_21DBC192C((uint64_t)v6, (uint64_t)v15, type metadata accessor for ReporterState);
    sub_21DBC192C((uint64_t)v15, (uint64_t)v12, type metadata accessor for ReporterState);
    if (swift_getEnumCaseMultiPayload())
    {
      type metadata accessor for ActiveReporterState(0);
      EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
      v25 = *(_QWORD *)v12;
      if (EnumCaseMultiPayload != 1)
      {
        v26 = (uint64_t)&v12[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_253F3D888) + 48)];
        v23 = *(_WORD *)(v25 + 24);
        swift_release();
        result = sub_21DBBA1BC(v26, type metadata accessor for StartedReporterData);
        goto LABEL_11;
      }
      v23 = *(_WORD *)(v25 + 24);
    }
    else
    {
      v23 = *(_WORD *)(*(_QWORD *)v12 + 24);
    }
    result = swift_release();
  }
LABEL_11:
  *v29 = v23;
  return result;
}

uint64_t sub_21DBC3DB4(__int16 a1, uint64_t a2)
{
  char *v2;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  char *v9;
  char isEscapingClosureAtFileLocation;
  uint64_t result;
  _QWORD v12[6];

  v5 = *(NSObject **)&v2[OBJC_IVAR____TtC14AudioAnalytics12ServerClient_serialQueue];
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = v2;
  *(_WORD *)(v6 + 24) = a1;
  *(_QWORD *)(v6 + 32) = a2;
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = sub_21DBCBD84;
  *(_QWORD *)(v7 + 24) = v6;
  v12[4] = sub_21DBB6BD4;
  v12[5] = v7;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 1107296256;
  v12[2] = sub_21DBB3BEC;
  v12[3] = &block_descriptor_80;
  v8 = _Block_copy(v12);
  v9 = v2;
  swift_retain();
  swift_release();
  dispatch_sync(v5, v8);
  _Block_release(v8);
  isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  swift_release();
  result = swift_release();
  if ((isEscapingClosureAtFileLocation & 1) != 0)
    __break(1u);
  return result;
}

uint64_t sub_21DBC3EEC(uint64_t a1, int a2, uint64_t a3)
{
  return sub_21DBC74A0(a2, a3);
}

unint64_t sub_21DBC3F5C@<X0>(uint64_t a1@<X1>, uint64_t *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  uint8_t *v18;
  unint64_t result;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t);
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  v32 = a1;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F3D9F0);
  MEMORY[0x24BDAC7A8](v3, v4);
  v6 = (char *)&v28 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for ReporterState(0);
  v8 = *(_QWORD *)(v7 - 8);
  v10 = MEMORY[0x24BDAC7A8](v7, v9);
  v12 = (char *)&v28 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10, v13);
  v30 = (uint64_t)&v28 - v14;
  v15 = sub_21DBD2308();
  v16 = sub_21DBD2434();
  if (os_log_type_enabled(v15, v16))
  {
    v17 = (uint8_t *)swift_slowAlloc();
    v29 = a2;
    v18 = v17;
    *(_DWORD *)v17 = 134217984;
    v31 = v32;
    sub_21DBD24AC();
    _os_log_impl(&dword_21DBAF000, v15, v16, "Get configuration. { reporterID=%lld }", v18, 0xCu);
    a2 = v29;
    MEMORY[0x22079B7C0](v18, -1, -1);
  }

  sub_21DBC8CF0(v32, 0xD00000000000001DLL, 0x800000021DBD56E0, (uint64_t)v6);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
  {
    sub_21DBB6B98((uint64_t)v6, &qword_253F3D9F0);
    result = sub_21DBCC524(MEMORY[0x24BEE4AF8]);
    v20 = result;
  }
  else
  {
    v21 = (uint64_t)v6;
    v22 = v30;
    sub_21DBC192C(v21, v30, type metadata accessor for ReporterState);
    sub_21DBC1644(v22, (uint64_t)v12, type metadata accessor for ReporterState);
    if (swift_getEnumCaseMultiPayload()
      && (type metadata accessor for ActiveReporterState(0), swift_getEnumCaseMultiPayload() != 1))
    {
      v26 = &v12[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_253F3D888) + 48)];
      swift_beginAccess();
      v27 = swift_bridgeObjectRetain();
      v20 = sub_21DBB2DB4(v27);
      swift_release();
      swift_bridgeObjectRelease();
      sub_21DBBA1BC(v22, type metadata accessor for ReporterState);
      v24 = type metadata accessor for StartedReporterData;
      v25 = (uint64_t)v26;
    }
    else
    {
      swift_beginAccess();
      v23 = swift_bridgeObjectRetain();
      v20 = sub_21DBB2DB4(v23);
      swift_release();
      swift_bridgeObjectRelease();
      v24 = type metadata accessor for ReporterState;
      v25 = v22;
    }
    result = sub_21DBBA1BC(v25, v24);
  }
  *a2 = v20;
  return result;
}

uint64_t sub_21DBC4364(uint64_t a1, uint64_t a2)
{
  char *v2;
  NSObject *v5;
  _QWORD *v6;
  uint64_t v7;
  void *v8;
  char *v9;
  char isEscapingClosureAtFileLocation;
  uint64_t result;
  _QWORD v12[6];

  v5 = *(NSObject **)&v2[OBJC_IVAR____TtC14AudioAnalytics12ServerClient_serialQueue];
  v6 = (_QWORD *)swift_allocObject();
  v6[2] = v2;
  v6[3] = a1;
  v6[4] = a2;
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = sub_21DBCBD28;
  *(_QWORD *)(v7 + 24) = v6;
  v12[4] = sub_21DBB6BD4;
  v12[5] = v7;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 1107296256;
  v12[2] = sub_21DBB3BEC;
  v12[3] = &block_descriptor_70;
  v8 = _Block_copy(v12);
  v9 = v2;
  swift_bridgeObjectRetain();
  swift_retain();
  swift_release();
  dispatch_sync(v5, v8);
  _Block_release(v8);
  isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  swift_release();
  result = swift_release();
  if ((isEscapingClosureAtFileLocation & 1) != 0)
    __break(1u);
  return result;
}

uint64_t sub_21DBC44A8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_21DBC7FF0(a2, a3);
}

uint64_t sub_21DBC4540(uint64_t a1, uint64_t a2, int a3, __int16 a4)
{
  char *v4;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  char *v13;
  char isEscapingClosureAtFileLocation;
  uint64_t result;
  _QWORD v16[6];

  v9 = *(NSObject **)&v4[OBJC_IVAR____TtC14AudioAnalytics12ServerClient_serialQueue];
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = v4;
  *(_QWORD *)(v10 + 24) = a1;
  *(_QWORD *)(v10 + 32) = a2;
  *(_DWORD *)(v10 + 40) = a3;
  *(_WORD *)(v10 + 44) = a4;
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = sub_21DBCBCD8;
  *(_QWORD *)(v11 + 24) = v10;
  v16[4] = sub_21DBB6BD4;
  v16[5] = v11;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 1107296256;
  v16[2] = sub_21DBB3BEC;
  v16[3] = &block_descriptor_60;
  v12 = _Block_copy(v16);
  v13 = v4;
  swift_bridgeObjectRetain();
  swift_retain();
  swift_release();
  dispatch_sync(v9, v12);
  _Block_release(v12);
  isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  swift_release();
  result = swift_release();
  if ((isEscapingClosureAtFileLocation & 1) != 0)
    __break(1u);
  return result;
}

void sub_21DBC4694(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4, int a5)
{
  sub_21DBC67C4(a2, 0, a3, a4, a5, 1);
}

uint64_t sub_21DBC474C(uint64_t a1, int a2, __int16 a3)
{
  char *v3;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  char *v11;
  char isEscapingClosureAtFileLocation;
  uint64_t result;
  _QWORD v14[6];

  v7 = *(NSObject **)&v3[OBJC_IVAR____TtC14AudioAnalytics12ServerClient_serialQueue];
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = v3;
  *(_QWORD *)(v8 + 24) = a1;
  *(_DWORD *)(v8 + 32) = a2;
  *(_WORD *)(v8 + 36) = a3;
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = sub_21DBCBC64;
  *(_QWORD *)(v9 + 24) = v8;
  v14[4] = sub_21DBB6BD4;
  v14[5] = v9;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 1107296256;
  v14[2] = sub_21DBB3BEC;
  v14[3] = &block_descriptor_50;
  v10 = _Block_copy(v14);
  v11 = v3;
  swift_bridgeObjectRetain();
  swift_retain();
  swift_release();
  dispatch_sync(v7, v10);
  _Block_release(v10);
  isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  swift_release();
  result = swift_release();
  if ((isEscapingClosureAtFileLocation & 1) != 0)
    __break(1u);
  return result;
}

void sub_21DBC4898(uint64_t a1, uint64_t a2, unsigned int a3, int a4)
{
  sub_21DBC67C4(0, 1, a2, a3, a4, 1);
}

uint64_t sub_21DBC494C(uint64_t a1)
{
  char *v1;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  char *v7;
  char isEscapingClosureAtFileLocation;
  uint64_t result;
  _QWORD v10[6];

  v3 = *(NSObject **)&v1[OBJC_IVAR____TtC14AudioAnalytics12ServerClient_serialQueue];
  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = v1;
  *(_QWORD *)(v4 + 24) = a1;
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = sub_21DBCBC28;
  *(_QWORD *)(v5 + 24) = v4;
  v10[4] = sub_21DBB6BD4;
  v10[5] = v5;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 1107296256;
  v10[2] = sub_21DBB3BEC;
  v10[3] = &block_descriptor_40;
  v6 = _Block_copy(v10);
  v7 = v1;
  swift_retain();
  swift_release();
  dispatch_sync(v3, v6);
  _Block_release(v6);
  isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  swift_release();
  result = swift_release();
  if ((isEscapingClosureAtFileLocation & 1) != 0)
    __break(1u);
  return result;
}

uint64_t sub_21DBC4A78(uint64_t a1, uint64_t a2)
{
  return sub_21DBC84E8(a2);
}

uint64_t sub_21DBC4ADC(uint64_t a1, int a2, __int16 a3, uint64_t a4, uint64_t a5)
{
  char *v5;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  char *v15;
  char isEscapingClosureAtFileLocation;
  uint64_t result;
  _QWORD v18[6];

  v11 = *(NSObject **)&v5[OBJC_IVAR____TtC14AudioAnalytics12ServerClient_serialQueue];
  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = v5;
  *(_QWORD *)(v12 + 24) = a1;
  *(_QWORD *)(v12 + 32) = a4;
  *(_QWORD *)(v12 + 40) = a5;
  *(_DWORD *)(v12 + 48) = a2;
  *(_WORD *)(v12 + 52) = a3;
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = sub_21DBB3F28;
  *(_QWORD *)(v13 + 24) = v12;
  v18[4] = sub_21DBB66FC;
  v18[5] = v13;
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 1107296256;
  v18[2] = sub_21DBB3BEC;
  v18[3] = &block_descriptor_30;
  v14 = _Block_copy(v18);
  v15 = v5;
  swift_retain();
  swift_retain();
  swift_release();
  dispatch_sync(v11, v14);
  _Block_release(v14);
  isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  swift_release();
  result = swift_release();
  if ((isEscapingClosureAtFileLocation & 1) != 0)
    __break(1u);
  return result;
}

uint64_t sub_21DBC4C34(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD), uint64_t a4, uint64_t a5, unsigned __int16 a6)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  NSObject *v19;
  os_log_type_t v20;
  uint8_t *v21;
  char *v22;
  unsigned __int16 v23;
  uint64_t v24;
  uint64_t (*v25)(_QWORD);
  uint8_t *v26;
  uint8_t *v27;
  uint64_t v28;
  NSObject *v29;
  os_log_type_t v30;
  uint64_t (*v31)(_QWORD);
  uint8_t *v32;
  uint8_t *v33;
  uint64_t v35;
  void *v36;
  void *v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  _QWORD aBlock[6];

  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F3D9F0);
  MEMORY[0x24BDAC7A8](v11, v12);
  v14 = (char *)&v38 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = type metadata accessor for ReporterState(0);
  v40 = *(_QWORD *)(v15 - 8);
  v41 = v15;
  MEMORY[0x24BDAC7A8](v15, v16);
  v18 = (char *)&v38 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = sub_21DBD2308();
  v20 = sub_21DBD2434();
  if (os_log_type_enabled(v19, v20))
  {
    v21 = (uint8_t *)swift_slowAlloc();
    v39 = v14;
    v22 = v18;
    v23 = a6;
    v24 = a5;
    v25 = a3;
    v26 = v21;
    *(_DWORD *)v21 = 134217984;
    aBlock[0] = a2;
    sub_21DBD24AC();
    _os_log_impl(&dword_21DBAF000, v19, v20, "Requesting message. { reporterID=%lld }", v26, 0xCu);
    v27 = v26;
    a3 = v25;
    a5 = v24;
    a6 = v23;
    v18 = v22;
    v14 = v39;
    MEMORY[0x22079B7C0](v27, -1, -1);
  }

  if (qword_253F3DA10 != -1)
    swift_once();
  if (qword_253F3DC38 == a2)
  {
    if (qword_253F3DA18 != -1)
      swift_once();
    v28 = sub_21DBD2320();
    __swift_project_value_buffer(v28, (uint64_t)qword_253F3DC78);
    v29 = sub_21DBD2308();
    v30 = sub_21DBD2434();
    if (os_log_type_enabled(v29, v30))
    {
      v31 = a3;
      v32 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)v32 = 134217984;
      aBlock[0] = a2;
      sub_21DBD24AC();
      _os_log_impl(&dword_21DBAF000, v29, v30, "requestMessage called with invalidID. { reporterID=%lld }", v32, 0xCu);
      v33 = v32;
      a3 = v31;
      MEMORY[0x22079B7C0](v33, -1, -1);
    }

    return a3(0);
  }
  else
  {
    v35 = swift_allocObject();
    *(_QWORD *)(v35 + 16) = a2;
    *(_DWORD *)(v35 + 24) = a5;
    *(_WORD *)(v35 + 28) = a6;
    *(_QWORD *)(v35 + 32) = a3;
    *(_QWORD *)(v35 + 40) = a4;
    swift_retain();
    sub_21DBC8CF0(a2, 0xD000000000000032, 0x800000021DBD5670, (uint64_t)v14);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v40 + 48))(v14, 1, v41) == 1)
    {
      sub_21DBC5464(a2, (uint64_t)v18);
      sub_21DBB6B98((uint64_t)v14, &qword_253F3D9F0);
    }
    else
    {
      sub_21DBC192C((uint64_t)v14, (uint64_t)v18, type metadata accessor for ReporterState);
    }
    v36 = (void *)sub_21DBC58F8((uint64_t)v18, 1);
    aBlock[4] = sub_21DBCBBB4;
    aBlock[5] = v35;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_21DBC5634;
    aBlock[3] = &block_descriptor_21;
    v37 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    objc_msgSend(v36, sel_requestMessageFor_category_type_reply_, a2, a5, a6, v37);
    _Block_release(v37);
    swift_release();
    swift_unknownObjectRelease();
    return sub_21DBBA1BC((uint64_t)v18, type metadata accessor for ReporterState);
  }
}

void sub_21DBC5058(void *a1, uint64_t a2, uint64_t a3, int a4, unsigned __int16 a5, void (*a6)(void *))
{
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  os_log_type_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v20;
  NSObject *v21;
  os_log_type_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  void *v29;
  NSObject *oslog;
  uint64_t v31;

  if (a1)
  {
    v7 = a1;
    if (qword_253F3DA18 != -1)
      swift_once();
    v8 = sub_21DBD2320();
    __swift_project_value_buffer(v8, (uint64_t)qword_253F3DC78);
    v9 = a1;
    v10 = a1;
    oslog = sub_21DBD2308();
    v11 = sub_21DBD2434();
    if (os_log_type_enabled(oslog, v11))
    {
      v12 = swift_slowAlloc();
      v13 = swift_slowAlloc();
      v31 = v13;
      *(_DWORD *)v12 = 136380931;
      swift_getErrorValue();
      v14 = sub_21DBD2590();
      sub_21DBCECA4(v14, v15, &v31);
      sub_21DBD24AC();
      swift_bridgeObjectRelease();

      *(_WORD *)(v12 + 12) = 2048;
      sub_21DBD24AC();
      _os_log_impl(&dword_21DBAF000, oslog, v11, "Error in requestMessage. { error=%{private}s, reporterID=%lld }", (uint8_t *)v12, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x22079B7C0](v13, -1, -1);
      MEMORY[0x22079B7C0](v12, -1, -1);

    }
    else
    {

    }
  }
  else
  {
    if (qword_253F3DA18 != -1)
      swift_once();
    v20 = sub_21DBD2320();
    __swift_project_value_buffer(v20, (uint64_t)qword_253F3DC78);
    v21 = sub_21DBD2308();
    v22 = sub_21DBD2440();
    if (os_log_type_enabled(v21, v22))
    {
      v23 = swift_slowAlloc();
      v24 = swift_slowAlloc();
      v31 = v24;
      *(_DWORD *)v23 = 134218498;
      sub_21DBD24AC();
      *(_WORD *)(v23 + 12) = 2080;
      v25 = AudioEventCategory.description.getter(a4);
      sub_21DBCECA4(v25, v26, &v31);
      sub_21DBD24AC();
      swift_bridgeObjectRelease();
      *(_WORD *)(v23 + 22) = 2082;
      v27 = AudioEventType.description.getter(a5);
      sub_21DBCECA4(v27, v28, &v31);
      sub_21DBD24AC();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_21DBAF000, v21, v22, "requestMessage received message. Invoking callback. { reporterID=%lld, category=%s, type=%{public}s }", (uint8_t *)v23, 0x20u);
      swift_arrayDestroy();
      MEMORY[0x22079B7C0](v24, -1, -1);
      MEMORY[0x22079B7C0](v23, -1, -1);
    }

    if (a2)
      v29 = (void *)sub_21DBD238C();
    else
      v29 = 0;
    a6(v29);

  }
}

uint64_t sub_21DBC5464@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t active;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;

  active = type metadata accessor for ActiveReporterState(0);
  MEMORY[0x24BDAC7A8](active, v5);
  v7 = (uint64_t *)((char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  v8 = type metadata accessor for StartedReporterData(0);
  MEMORY[0x24BDAC7A8](v8, v9);
  v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21DBD22D8();
  *(_DWORD *)&v11[*(int *)(v8 + 20)] = 0;
  v12 = (uint64_t)v7 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_253F3D888) + 48);
  type metadata accessor for ReporterData();
  v13 = swift_allocObject();
  *(_WORD *)(v13 + 24) = -1;
  *(_QWORD *)(v13 + 32) = sub_21DBCC2E0(MEMORY[0x24BEE4AF8]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_253F3DA08);
  v14 = swift_allocObject();
  *(_OWORD *)(v14 + 16) = xmmword_21DBD32D0;
  *(_DWORD *)(v14 + 32) = getpid();
  type metadata accessor for PerfCheck();
  swift_allocObject();
  *(_QWORD *)(v13 + 40) = sub_21DBBA54C(v14);
  *(_QWORD *)(v13 + 16) = a1;
  *v7 = v13;
  sub_21DBC192C((uint64_t)v11, v12, type metadata accessor for StartedReporterData);
  swift_storeEnumTagMultiPayload();
  sub_21DBC192C((uint64_t)v7, a2, type metadata accessor for ActiveReporterState);
  type metadata accessor for ReporterState(0);
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_21DBC5634(uint64_t a1, void *a2, uint64_t a3)
{
  void (*v4)(void *, uint64_t);
  uint64_t v5;
  id v6;

  v4 = *(void (**)(void *, uint64_t))(a1 + 32);
  if (a3)
    v5 = sub_21DBD23A4();
  else
    v5 = 0;
  swift_retain();
  v6 = a2;
  v4(a2, v5);
  swift_release();

  return swift_bridgeObjectRelease();
}

void sub_21DBC5758()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[3];
  uint64_t v16;

  v1 = OBJC_IVAR____TtC14AudioAnalytics12ServerClient_messageCache;
  v2 = *(_QWORD *)(v0 + OBJC_IVAR____TtC14AudioAnalytics12ServerClient_messageCache);
  if (!v2)
    return;
  v3 = v0;
  v4 = *(_QWORD *)(v2 + 16);
  v5 = *(_QWORD *)(v4 + 16);
  if (!v5)
  {
    swift_retain();
LABEL_12:
    *(_QWORD *)(v3 + v1) = 0;
    swift_release();
    swift_release();
    return;
  }
  v6 = v4 + 32;
  swift_retain();
  swift_bridgeObjectRetain();
  do
  {
    sub_21DBB97F4(v6, (uint64_t)v15);
    __swift_project_boxed_opaque_existential_1(v15, v16);
    sub_21DBCD4E4();
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v15);
    v6 += 40;
    --v5;
  }
  while (v5);
  swift_bridgeObjectRelease();
  v7 = *(_QWORD *)(v2 + 16);
  v8 = *(_QWORD *)(v7 + 16);
  if (!v8)
    goto LABEL_12;
  v9 = v7 + 32;
  swift_bridgeObjectRetain();
  while (1)
  {
    sub_21DBB97F4(v9, (uint64_t)v15);
    v10 = __swift_project_boxed_opaque_existential_1(v15, v16);
    v11 = *v10;
    v12 = *v10 + OBJC_IVAR____TtC14AudioAnalytics26SessionGenericSummaryCache_activeReporters;
    swift_beginAccess();
    if (*(_QWORD *)(*(_QWORD *)v12 + 16))
      break;
    v13 = v11 + OBJC_IVAR____TtC14AudioAnalytics26SessionGenericSummaryCache_messageCache;
    swift_beginAccess();
    v14 = *(_QWORD *)(*(_QWORD *)v13 + 16);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v15);
    if (v14)
      goto LABEL_14;
    v9 += 40;
    if (!--v8)
    {
      swift_bridgeObjectRelease();
      goto LABEL_12;
    }
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v15);
LABEL_14:
  swift_release();
  swift_bridgeObjectRelease();
}

uint64_t sub_21DBC58F8(uint64_t a1, char a2)
{
  char *v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t (*v9)(_QWORD);
  int EnumCaseMultiPayload;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  id v17;
  id v18;
  void *v19;
  uint64_t v20;
  void *v21;
  char *v22;
  _QWORD aBlock[7];

  v5 = type metadata accessor for ReporterState(0);
  MEMORY[0x24BDAC7A8](v5, v6);
  v8 = (_QWORD *)((char *)&aBlock[-1] - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_21DBC1644(a1, (uint64_t)v8, v9);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (!EnumCaseMultiPayload)
  {
    v12 = *v8;
    goto LABEL_6;
  }
  if (EnumCaseMultiPayload == 1)
  {
    type metadata accessor for ActiveReporterState(0);
    v11 = swift_getEnumCaseMultiPayload();
    v12 = *v8;
    if (v11 != 1)
    {
      v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F3D888);
      sub_21DBBA1BC((uint64_t)v8 + *(int *)(v13 + 48), type metadata accessor for StartedReporterData);
    }
LABEL_6:
    v14 = *(_QWORD *)&v2[OBJC_IVAR____TtC14AudioAnalytics12ServerClient_injectedServerProtocol];
    if (v14)
    {
      swift_unknownObjectRetain();
      swift_release();
      return v14;
    }
    if (a2 == 3)
    {
      v16 = *(unsigned __int16 *)(v12 + 24);
      swift_release();
      if (v16 == 11)
        goto LABEL_20;
    }
    else
    {
      swift_release();
      if (a2)
      {
        if (a2 != 1)
        {
LABEL_20:
          v19 = *(void **)&v2[OBJC_IVAR____TtC14AudioAnalytics12ServerClient_xpcConnection];
          v20 = swift_allocObject();
          *(_QWORD *)(v20 + 16) = v2;
          aBlock[4] = sub_21DBCBAD0;
          aBlock[5] = v20;
          aBlock[0] = MEMORY[0x24BDAC760];
          aBlock[1] = 1107296256;
          aBlock[2] = sub_21DBC5D70;
          aBlock[3] = &block_descriptor_12;
          v21 = _Block_copy(aBlock);
          v22 = v2;
          swift_release();
          objc_msgSend(v19, sel_synchronousRemoteObjectProxyWithErrorHandler_, v21);
          _Block_release(v21);
          goto LABEL_21;
        }
        v17 = objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC14AudioAnalytics12ServerClient_xpcConnection], sel_remoteObjectProxy);
LABEL_19:
        v18 = v17;
LABEL_21:
        sub_21DBD24D0();
        swift_unknownObjectRelease();
        __swift_instantiateConcreteTypeFromMangledName(&qword_253F3D9F8);
        swift_dynamicCast();
        return aBlock[6];
      }
    }
    v17 = objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC14AudioAnalytics12ServerClient_xpcConnection], sel__unboostingRemoteObjectProxy);
    goto LABEL_19;
  }
  v15 = OBJC_IVAR____TtC14AudioAnalytics12ServerClient_messageCache;
  if (*(_QWORD *)&v2[OBJC_IVAR____TtC14AudioAnalytics12ServerClient_messageCache])
  {
    v14 = *(_QWORD *)&v2[OBJC_IVAR____TtC14AudioAnalytics12ServerClient_messageCache];
  }
  else
  {
    type metadata accessor for MessageCache();
    v14 = swift_allocObject();
    *(_QWORD *)(v14 + 16) = sub_21DBB8E5C();
    *(_QWORD *)&v2[v15] = v14;
    swift_retain();
    swift_release();
  }
  swift_retain();
  sub_21DBBA1BC((uint64_t)v8, type metadata accessor for ReporterState);
  return v14;
}

void sub_21DBC5BD8(void *a1)
{
  id v2;
  id v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;

  v2 = a1;
  v3 = a1;
  v4 = sub_21DBD2308();
  v5 = sub_21DBD2440();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc();
    v7 = swift_slowAlloc();
    v10 = v7;
    *(_DWORD *)v6 = 136380675;
    swift_getErrorValue();
    v8 = sub_21DBD2590();
    sub_21DBCECA4(v8, v9, &v10);
    sub_21DBD24AC();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_21DBAF000, v4, v5, "Synchronous remote object proxy encountered error. { error=%{private}s }", v6, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x22079B7C0](v7, -1, -1);
    MEMORY[0x22079B7C0](v6, -1, -1);

  }
  else
  {

  }
}

void sub_21DBC5D70(uint64_t a1, void *a2)
{
  void (*v3)(void);
  id v4;

  v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3();
  swift_release();

}

uint64_t sub_21DBC5DC0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  void *v21;
  id v22;
  uint64_t result;
  NSObject *v24;
  os_log_type_t v25;
  uint8_t *v26;
  uint64_t v27;
  uint64_t v28[4];

  v2 = v1;
  v28[0] = a1;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F3D9F0);
  v5 = MEMORY[0x24BDAC7A8](v3, v4);
  v7 = (uint64_t *)((char *)v28 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x24BDAC7A8](v5, v8);
  v10 = (char *)v28 - v9;
  v11 = type metadata accessor for ReporterState(0);
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11, v13);
  v15 = (char *)v28 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = sub_21DBD2374();
  v17 = *(_QWORD *)(v16 - 8);
  MEMORY[0x24BDAC7A8](v16, v18);
  v20 = (uint64_t *)((char *)v28 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0));
  v21 = *(void **)(v2 + OBJC_IVAR____TtC14AudioAnalytics12ServerClient_serialQueue);
  *v20 = v21;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v17 + 104))(v20, *MEMORY[0x24BEE5610], v16);
  v22 = v21;
  LOBYTE(v21) = sub_21DBD2380();
  result = (*(uint64_t (**)(_QWORD *, uint64_t))(v17 + 8))(v20, v16);
  if ((v21 & 1) != 0)
  {
    v24 = sub_21DBD2308();
    v25 = sub_21DBD2434();
    if (os_log_type_enabled(v24, v25))
    {
      v26 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)v26 = 134217984;
      v28[1] = v28[0];
      sub_21DBD24AC();
      _os_log_impl(&dword_21DBAF000, v24, v25, "Starting reporter. { reporterID=%lld }", v26, 0xCu);
      MEMORY[0x22079B7C0](v26, -1, -1);
    }

    v27 = v28[0];
    sub_21DBC8CF0(v28[0], 0xD000000000000019, 0x800000021DBD5600, (uint64_t)v10);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11) == 1)
    {
      return sub_21DBB6B98((uint64_t)v10, &qword_253F3D9F0);
    }
    else
    {
      sub_21DBC192C((uint64_t)v10, (uint64_t)v15, type metadata accessor for ReporterState);
      sub_21DBBFB10((uint64_t)v15, v7);
      (*(void (**)(uint64_t *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v7, 0, 1, v11);
      swift_beginAccess();
      sub_21DBC1C00((uint64_t)v7, v27);
      swift_endAccess();
      return sub_21DBBA1BC((uint64_t)v15, type metadata accessor for ReporterState);
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_21DBC60A0(uint64_t a1)
{
  unint64_t v2;
  id v3;

  v3 = objc_msgSend(objc_allocWithZone((Class)TraceArgs), sel_initWithArg1_arg2_, *(_QWORD *)(a1 + 16), *(unsigned __int16 *)(a1 + 24));
  objc_msgSend((id)objc_opt_self(), sel_post_args_, 4609, v3);
  if (*(_QWORD *)(a1 + 40))
  {
    swift_retain();
    v2 = sub_21DBCC2E0(MEMORY[0x24BEE4AF8]);
    sub_21DBBC560(v2, *(_WORD *)(a1 + 24));
    swift_release();
    swift_bridgeObjectRelease();
    if (*(_QWORD *)(a1 + 40))
    {
      swift_retain();
      sub_21DBBA6C4();
      swift_release();
    }
  }

}

uint64_t sub_21DBC6170(uint64_t a1)
{
  char *v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  void *v21;
  id v22;
  uint64_t result;
  NSObject *v24;
  os_log_type_t v25;
  uint8_t *v26;
  uint64_t v27;
  char *v28;
  uint64_t v29[4];

  v2 = v1;
  v29[0] = a1;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F3D9F0);
  v5 = MEMORY[0x24BDAC7A8](v3, v4);
  v7 = (uint64_t *)((char *)v29 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x24BDAC7A8](v5, v8);
  v10 = (char *)v29 - v9;
  v11 = type metadata accessor for ReporterState(0);
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11, v13);
  v15 = (char *)v29 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = sub_21DBD2374();
  v17 = *(_QWORD *)(v16 - 8);
  MEMORY[0x24BDAC7A8](v16, v18);
  v20 = (uint64_t *)((char *)v29 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0));
  v21 = *(void **)&v2[OBJC_IVAR____TtC14AudioAnalytics12ServerClient_serialQueue];
  *v20 = v21;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v17 + 104))(v20, *MEMORY[0x24BEE5610], v16);
  v22 = v21;
  LOBYTE(v21) = sub_21DBD2380();
  result = (*(uint64_t (**)(_QWORD *, uint64_t))(v17 + 8))(v20, v16);
  if ((v21 & 1) != 0)
  {
    v24 = sub_21DBD2308();
    v25 = sub_21DBD2434();
    if (os_log_type_enabled(v24, v25))
    {
      v26 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)v26 = 134217984;
      v29[1] = v29[0];
      sub_21DBD24AC();
      _os_log_impl(&dword_21DBAF000, v24, v25, "Stopping reporter. { reporterID=%lld }", v26, 0xCu);
      MEMORY[0x22079B7C0](v26, -1, -1);
    }

    v27 = v29[0];
    sub_21DBC8CF0(v29[0], 0xD000000000000018, 0x800000021DBD55C0, (uint64_t)v10);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11) == 1)
    {
      return sub_21DBB6B98((uint64_t)v10, &qword_253F3D9F0);
    }
    else
    {
      sub_21DBC192C((uint64_t)v10, (uint64_t)v15, type metadata accessor for ReporterState);
      v28 = v2;
      sub_21DBBFF6C((uint64_t)v15, (uint64_t)v28, (uint64_t)v28, v27, v7);
      (*(void (**)(uint64_t *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v7, 0, 1, v11);
      swift_beginAccess();
      sub_21DBC1C00((uint64_t)v7, v27);
      swift_endAccess();
      return sub_21DBBA1BC((uint64_t)v15, type metadata accessor for ReporterState);
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_21DBC6460(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v7;
  uint64_t inited;
  double v9;
  unint64_t v10;
  int v11;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  _OWORD v21[2];
  uint64_t v22[3];
  uint64_t v23;

  v7 = objc_msgSend(objc_allocWithZone((Class)TraceArgs), sel_initWithArg1_arg2_, *(_QWORD *)(a1 + 16), *(unsigned __int16 *)(a1 + 24));
  objc_msgSend((id)objc_opt_self(), sel_post_args_, 4610, v7);
  __swift_instantiateConcreteTypeFromMangledName(&qword_253F3D8D0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_21DBD32D0;
  *(_QWORD *)(inited + 32) = 0xD000000000000010;
  *(_QWORD *)(inited + 40) = 0x800000021DBD55E0;
  sub_21DBD22C0();
  *(_QWORD *)(inited + 72) = MEMORY[0x24BEE13C8];
  *(double *)(inited + 48) = -v9;
  v10 = sub_21DBCC2E0(inited);
  v11 = *(_DWORD *)(a2 + *(int *)(type metadata accessor for StartedReporterData(0) + 20));
  if (v11)
  {
    v23 = MEMORY[0x24BEE44F0];
    LODWORD(v22[0]) = v11;
    sub_21DBB3F4C(v22, v21);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    sub_21DBD0C60(v21, 0xD000000000000014, 0x800000021DBD51C0, isUniquelyReferenced_nonNull_native);
    swift_bridgeObjectRelease();
  }
  sub_21DBC67C4(a4, 0, v10, 1u, 0, 0);
  swift_bridgeObjectRelease();
  if (*(_QWORD *)(a1 + 40))
  {
    swift_retain();
    v13 = sub_21DBBB51C();
    swift_release();
    swift_bridgeObjectRetain_n();
    v14 = sub_21DBD2308();
    v15 = sub_21DBD2434();
    if (os_log_type_enabled(v14, v15))
    {
      v16 = swift_slowAlloc();
      v17 = swift_slowAlloc();
      v22[0] = v17;
      *(_DWORD *)v16 = 134218243;
      *(_QWORD *)&v21[0] = a4;
      sub_21DBD24AC();
      *(_WORD *)(v16 + 12) = 2081;
      swift_bridgeObjectRetain();
      v18 = sub_21DBD23B0();
      v20 = v19;
      swift_bridgeObjectRelease();
      *(_QWORD *)&v21[0] = sub_21DBCECA4(v18, v20, v22);
      sub_21DBD24AC();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_21DBAF000, v14, v15, "Gathered performance metrics. { reporterID=%lld, perfMetrics=%{private}s }", (uint8_t *)v16, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x22079B7C0](v17, -1, -1);
      MEMORY[0x22079B7C0](v16, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }

    sub_21DBC67C4(a4, 0, v13, 0xDu, 0, 0);
    swift_bridgeObjectRelease();
  }

}

void sub_21DBC67C4(uint64_t a1, char a2, uint64_t a3, unsigned int a4, int a5, int a6)
{
  uint64_t v6;
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
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  void *v27;
  id v28;
  unsigned __int16 v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t inited;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  id v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  void *v46;
  NSObject *v47;
  os_log_type_t v48;
  uint8_t *v49;
  NSObject *v50;
  os_log_type_t v51;
  uint8_t *v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  char *v58;
  uint64_t v59;
  int v60;
  int v61;
  unsigned int v62;
  _QWORD aBlock[7];

  v60 = a6;
  v61 = a5;
  v62 = a4;
  v59 = a3;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F3D9F0);
  MEMORY[0x24BDAC7A8](v9, v10);
  v55 = (uint64_t)&v54 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v56 = type metadata accessor for ReporterState(0);
  v54 = *(_QWORD *)(v56 - 8);
  v13 = MEMORY[0x24BDAC7A8](v56, v12);
  v57 = (uint64_t)&v54 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13, v15);
  v58 = (char *)&v54 - v16;
  v17 = sub_21DBD22F0();
  v18 = *(_QWORD *)(v17 - 8);
  MEMORY[0x24BDAC7A8](v17, v19);
  v21 = (char *)&v54 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = sub_21DBD2374();
  v23 = *(_QWORD *)(v22 - 8);
  MEMORY[0x24BDAC7A8](v22, v24);
  v26 = (uint64_t *)((char *)&v54 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0));
  v27 = *(void **)(v6 + OBJC_IVAR____TtC14AudioAnalytics12ServerClient_serialQueue);
  *v26 = v27;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v23 + 104))(v26, *MEMORY[0x24BEE5610], v22);
  v28 = v27;
  v29 = sub_21DBD2380();
  (*(void (**)(_QWORD *, uint64_t))(v23 + 8))(v26, v22);
  if ((v29 & 1) == 0)
  {
    __break(1u);
    goto LABEL_29;
  }
  v29 = v61;
  if ((a2 & 1) != 0)
  {
    if (qword_253F3DA10 == -1)
    {
LABEL_4:
      a1 = qword_253F3DC38;
      goto LABEL_5;
    }
LABEL_29:
    swift_once();
    goto LABEL_4;
  }
LABEL_5:
  sub_21DBD22E4();
  sub_21DBD22CC();
  v31 = v30;
  (*(void (**)(char *, uint64_t))(v18 + 8))(v21, v17);
  __swift_instantiateConcreteTypeFromMangledName(&qword_253F3D8D0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_21DBD32D0;
  *(_QWORD *)(inited + 32) = 0xD000000000000015;
  *(_QWORD *)(inited + 40) = 0x800000021DBD5520;
  *(_QWORD *)(inited + 72) = MEMORY[0x24BEE13C8];
  *(_QWORD *)(inited + 48) = v31;
  v33 = v59;
  swift_bridgeObjectRetain();
  v34 = sub_21DBCC2E0(inited);
  v35 = sub_21DBC6F54(v34, v33);
  v36 = v62;
  sub_21DBC91E0(a1, v35, v62, v29);
  v37 = (void *)objc_opt_self();
  v38 = objc_msgSend(objc_allocWithZone((Class)TraceArgs), sel_initWithArg1_, a1);
  objc_msgSend(v37, sel_post_args_, 4612, v38);

  if ((v60 & 1) == 0 || (sub_21DBBF764(1u) & 1) != 0)
  {
    v39 = (uint64_t)v58;
    if ((_DWORD)v36 == 7 && v29 == 6)
    {
      if (qword_2553A3E78 != -1)
        swift_once();
      if (byte_2553A4BB1 == 1)
      {
        v40 = (void *)sub_21DBD23BC();
        v41 = swift_allocObject();
        *(_QWORD *)(v41 + 16) = v35;
        aBlock[4] = sub_21DBCBAB0;
        aBlock[5] = v41;
        aBlock[0] = MEMORY[0x24BDAC760];
        aBlock[1] = 1107296256;
        aBlock[2] = sub_21DBC6FD0;
        aBlock[3] = &block_descriptor_2;
        v42 = _Block_copy(aBlock);
        swift_release();
        AnalyticsSendEventLazy();
        _Block_release(v42);

        return;
      }
    }
    v43 = v55;
    sub_21DBC8CF0(a1, 0xD00000000000003FLL, 0x800000021DBD5540, v55);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v54 + 48))(v43, 1, v56) == 1)
    {
      sub_21DBC7054(a1, v39);
      sub_21DBB6B98(v43, &qword_253F3D9F0);
    }
    else
    {
      sub_21DBC192C(v43, v39, type metadata accessor for ReporterState);
    }
    v44 = v57;
    sub_21DBC1644(v39, v57, type metadata accessor for ReporterState);
    if (!swift_getEnumCaseMultiPayload())
    {
      swift_bridgeObjectRelease();
      swift_release();
      v50 = sub_21DBD2308();
      v51 = sub_21DBD2434();
      if (os_log_type_enabled(v50, v51))
      {
        v52 = (uint8_t *)swift_slowAlloc();
        *(_DWORD *)v52 = 134217984;
        aBlock[0] = a1;
        sub_21DBD24AC();
        _os_log_impl(&dword_21DBAF000, v50, v51, "Reporter disconnected. { function=sendMessage, reporterID=%lld }", v52, 0xCu);
        MEMORY[0x22079B7C0](v52, -1, -1);
      }

      goto LABEL_33;
    }
    sub_21DBBA1BC(v44, type metadata accessor for ReporterState);
    if (qword_253F3DA30 == -1)
    {
      if ((_DWORD)v36 != 7)
        goto LABEL_31;
    }
    else
    {
      swift_once();
      if ((_DWORD)v36 != 7)
        goto LABEL_31;
    }
    if (byte_253F3DC58 && v29 == 6)
    {
      v45 = (void *)sub_21DBC58F8(v39, 1);
      v46 = (void *)sub_21DBD238C();
      swift_bridgeObjectRelease();
      objc_msgSend(v45, sel_sendWithMessage_with_and_for_, v46, 7, 6, a1);
LABEL_32:
      swift_unknownObjectRelease();

LABEL_33:
      sub_21DBBA1BC(v39, type metadata accessor for ReporterState);
      return;
    }
LABEL_31:
    v53 = (void *)sub_21DBC58F8(v39, 3);
    v46 = (void *)sub_21DBD238C();
    swift_bridgeObjectRelease();
    objc_msgSend(v53, sel_sendWithMessage_with_and_for_, v46, v36, v29, a1);
    goto LABEL_32;
  }
  swift_bridgeObjectRelease();
  v47 = sub_21DBD2308();
  v48 = sub_21DBD2440();
  if (os_log_type_enabled(v47, v48))
  {
    v49 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v49 = 134217984;
    aBlock[0] = a1;
    sub_21DBD24AC();
    _os_log_impl(&dword_21DBAF000, v47, v48, "Message send exceeds rate-limit threshold and will be dropped. { reporterID=%lld, rateLimit=32hz }", v49, 0xCu);
    MEMORY[0x22079B7C0](v49, -1, -1);
  }

  sub_21DBC88C0(a1);
}

uint64_t sub_21DBC6F54(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v6;
  uint64_t v8;

  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v8 = a2;
  sub_21DBBED94(a1, (uint64_t)sub_21DBCAFE8, 0, isUniquelyReferenced_nonNull_native, (uint64_t)&v8);
  v6 = v8;
  swift_bridgeObjectRelease();
  if (v2)
    swift_bridgeObjectRelease();
  return v6;
}

id sub_21DBC6FD0(uint64_t a1)
{
  uint64_t (*v1)(uint64_t);
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v1 = *(uint64_t (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v3 = v1(v2);
  swift_release();
  if (v3)
  {
    sub_21DBB6AD0(0, &qword_2553A4328);
    v4 = (void *)sub_21DBD238C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

uint64_t sub_21DBC7054@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t active;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;

  active = type metadata accessor for ActiveReporterState(0);
  MEMORY[0x24BDAC7A8](active, v5);
  v7 = (uint64_t *)((char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  type metadata accessor for ReporterData();
  v8 = swift_allocObject();
  *(_WORD *)(v8 + 24) = -1;
  *(_QWORD *)(v8 + 32) = sub_21DBCC2E0(MEMORY[0x24BEE4AF8]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_253F3DA08);
  v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_21DBD32D0;
  *(_DWORD *)(v9 + 32) = getpid();
  type metadata accessor for PerfCheck();
  swift_allocObject();
  *(_QWORD *)(v8 + 40) = sub_21DBBA54C(v9);
  *(_QWORD *)(v8 + 16) = a1;
  *v7 = v8;
  swift_storeEnumTagMultiPayload();
  sub_21DBC192C((uint64_t)v7, a2, type metadata accessor for ActiveReporterState);
  type metadata accessor for ReporterState(0);
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_21DBC71AC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  BOOL v23;
  int v24;
  uint64_t v25;
  NSObject *v26;
  os_log_type_t v27;
  uint8_t *v28;
  uint64_t result;
  _QWORD v30[4];

  v2 = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F3D9F0);
  MEMORY[0x24BDAC7A8](v4, v5);
  v7 = (char *)v30 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for ReporterState(0);
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8, v10);
  v12 = (_QWORD *)((char *)v30 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  v13 = sub_21DBD2374();
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13, v15);
  v17 = (_QWORD *)((char *)v30 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0));
  v18 = *(void **)(v2 + OBJC_IVAR____TtC14AudioAnalytics12ServerClient_serialQueue);
  *v17 = v18;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v14 + 104))(v17, *MEMORY[0x24BEE5610], v13);
  v19 = v18;
  LOBYTE(v18) = sub_21DBD2380();
  (*(void (**)(_QWORD *, uint64_t))(v14 + 8))(v17, v13);
  if ((v18 & 1) == 0)
  {
    __break(1u);
    goto LABEL_11;
  }
  if ((a1 & 0x100000000) != 0)
  {
    v21 = *(_QWORD *)(v2 + OBJC_IVAR____TtC14AudioAnalytics12ServerClient_idGenerator);
    v22 = *(_DWORD *)(v21 + 16);
    v23 = __CFADD__(v22, 1);
    v24 = v22 + 1;
    if (!v23)
    {
      *(_DWORD *)(v21 + 16) = v24;
      v25 = getpid();
      if ((v25 & 0x80000000) == 0)
      {
        v20 = *(unsigned int *)(v21 + 16) | (unint64_t)(v25 << 32);
        goto LABEL_7;
      }
LABEL_12:
      result = sub_21DBD2530();
      __break(1u);
      return result;
    }
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  v20 = a1;
LABEL_7:
  sub_21DBBF92C(v20, v12);
  sub_21DBC1644((uint64_t)v12, (uint64_t)v7, type metadata accessor for ReporterState);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v9 + 56))(v7, 0, 1, v8);
  swift_beginAccess();
  sub_21DBC1C00((uint64_t)v7, v20);
  swift_endAccess();
  v26 = sub_21DBD2308();
  v27 = sub_21DBD2434();
  if (os_log_type_enabled(v26, v27))
  {
    v28 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v28 = 134217984;
    v30[1] = v20;
    sub_21DBD24AC();
    _os_log_impl(&dword_21DBAF000, v26, v27, "Created new reporting session. { reporterID=%lld }", v28, 0xCu);
    MEMORY[0x22079B7C0](v28, -1, -1);
  }

  sub_21DBBA1BC((uint64_t)v12, type metadata accessor for ReporterState);
  return v20;
}

uint64_t sub_21DBC74A0(int a1, uint64_t a2)
{
  char *v2;
  char *v3;
  uint64_t v4;
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
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  void *v24;
  id v25;
  uint64_t result;
  NSObject *v27;
  os_log_type_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  __int16 v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char *v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  int v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;

  v3 = v2;
  v51 = a2;
  v50 = a1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F3D9F0);
  MEMORY[0x24BDAC7A8](v4, v5);
  v49 = (uint64_t)&v44 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for ReporterState(0);
  v8 = *(_QWORD *)(v7 - 8);
  v9 = *(_QWORD *)(v8 + 64);
  v11 = MEMORY[0x24BDAC7A8](v7, v10);
  v12 = (char *)&v44 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = MEMORY[0x24BDAC7A8](v11, v13);
  v48 = (uint64_t)&v44 - v15;
  MEMORY[0x24BDAC7A8](v14, v16);
  v18 = (char *)&v44 - v17;
  v19 = sub_21DBD2374();
  v20 = *(_QWORD *)(v19 - 8);
  MEMORY[0x24BDAC7A8](v19, v21);
  v23 = (uint64_t *)((char *)&v44 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0));
  v24 = *(void **)&v3[OBJC_IVAR____TtC14AudioAnalytics12ServerClient_serialQueue];
  *v23 = v24;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v20 + 104))(v23, *MEMORY[0x24BEE5610], v19);
  v25 = v24;
  LOBYTE(v24) = sub_21DBD2380();
  result = (*(uint64_t (**)(_QWORD *, uint64_t))(v20 + 8))(v23, v19);
  if ((v24 & 1) != 0)
  {
    v27 = sub_21DBD2308();
    v28 = sub_21DBD2434();
    if (os_log_type_enabled(v27, v28))
    {
      v29 = swift_slowAlloc();
      v30 = swift_slowAlloc();
      v45 = v30;
      v46 = (char *)&v44 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
      *(_DWORD *)v29 = 134218242;
      v52 = v51;
      v53 = v30;
      v47 = v3;
      sub_21DBD24AC();
      *(_WORD *)(v29 + 12) = 2082;
      v31 = AudioServiceType.description.getter(v50);
      v52 = sub_21DBCECA4(v31, v32, &v53);
      v3 = v47;
      sub_21DBD24AC();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_21DBAF000, v27, v28, "Set serviceType. { reporterID=%lld, serviceType=%{public}s }", (uint8_t *)v29, 0x16u);
      v33 = v45;
      swift_arrayDestroy();
      v12 = v46;
      MEMORY[0x22079B7C0](v33, -1, -1);
      MEMORY[0x22079B7C0](v29, -1, -1);
    }

    v34 = v49;
    sub_21DBC8CF0(v51, 0xD000000000000024, 0x800000021DBD54A0, v49);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v8 + 48))(v34, 1, v7) == 1)
    {
      return sub_21DBB6B98(v34, &qword_253F3D9F0);
    }
    else
    {
      sub_21DBC192C(v34, (uint64_t)v18, type metadata accessor for ReporterState);
      v35 = v48;
      sub_21DBC1644((uint64_t)v18, v48, type metadata accessor for ReporterState);
      if (swift_getEnumCaseMultiPayload())
      {
        sub_21DBBA1BC(v35, type metadata accessor for ReporterState);
        sub_21DBC1644((uint64_t)v18, (uint64_t)v12, type metadata accessor for ReporterState);
        v36 = (uint64_t)v12;
        v37 = (*(unsigned __int8 *)(v8 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
        v38 = swift_allocObject();
        v39 = v50;
        *(_WORD *)(v38 + 16) = v50;
        v40 = v51;
        *(_QWORD *)(v38 + 24) = v3;
        *(_QWORD *)(v38 + 32) = v40;
        sub_21DBC192C(v36, v38 + v37, type metadata accessor for ReporterState);
        sub_21DBC1644((uint64_t)v18, v36, type metadata accessor for ReporterState);
        v41 = swift_allocObject();
        *(_WORD *)(v41 + 16) = v39;
        *(_QWORD *)(v41 + 24) = v3;
        *(_QWORD *)(v41 + 32) = v40;
        sub_21DBC192C(v36, v41 + v37, type metadata accessor for ReporterState);
        v42 = v3;
        sub_21DBC094C((uint64_t)v18, (void (*)(uint64_t))sub_21DBCB938, v38, (uint64_t)sub_21DBCBA2C);
        sub_21DBBA1BC((uint64_t)v18, type metadata accessor for ReporterState);
        swift_release();
      }
      else
      {
        swift_release();
        v43 = sub_21DBC7934();
        sub_21DBBA1BC((uint64_t)v18, type metadata accessor for ReporterState);
        *(_WORD *)(v43 + 24) = v50;
      }
      return swift_release();
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_21DBC7934()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t active;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t (*v22)(_QWORD);
  int EnumCaseMultiPayload;
  int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  int v28;
  uint64_t v29;
  uint64_t v31;

  v1 = v0;
  active = type metadata accessor for ActiveReporterState(0);
  v4 = MEMORY[0x24BDAC7A8](active, v3);
  v6 = (uint64_t *)((char *)&v31 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  v8 = MEMORY[0x24BDAC7A8](v4, v7);
  v10 = (char *)&v31 - v9;
  v12 = MEMORY[0x24BDAC7A8](v8, v11);
  v14 = (uint64_t *)((char *)&v31 - v13);
  MEMORY[0x24BDAC7A8](v12, v15);
  v17 = (char *)&v31 - v16;
  v18 = type metadata accessor for ReporterState(0);
  MEMORY[0x24BDAC7A8](v18, v19);
  v21 = (char *)&v31 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21DBC1644(v1, (uint64_t)v21, v22);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (!EnumCaseMultiPayload)
    return *(_QWORD *)v21;
  if (EnumCaseMultiPayload == 1)
  {
    sub_21DBC192C((uint64_t)v21, (uint64_t)v17, type metadata accessor for ActiveReporterState);
    sub_21DBC1644((uint64_t)v17, (uint64_t)v14, type metadata accessor for ActiveReporterState);
    v24 = swift_getEnumCaseMultiPayload();
    v25 = *v14;
    if (v24 != 1)
    {
      v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F3D888);
      sub_21DBBA1BC((uint64_t)v14 + *(int *)(v26 + 48), type metadata accessor for StartedReporterData);
    }
    v27 = (uint64_t)v17;
  }
  else
  {
    sub_21DBC192C((uint64_t)v21, (uint64_t)v10, type metadata accessor for ActiveReporterState);
    sub_21DBC1644((uint64_t)v10, (uint64_t)v6, type metadata accessor for ActiveReporterState);
    v28 = swift_getEnumCaseMultiPayload();
    v25 = *v6;
    if (v28 != 1)
    {
      v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F3D888);
      sub_21DBBA1BC((uint64_t)v6 + *(int *)(v29 + 48), type metadata accessor for StartedReporterData);
    }
    v27 = (uint64_t)v10;
  }
  sub_21DBBA1BC(v27, type metadata accessor for ActiveReporterState);
  return v25;
}

uint64_t sub_21DBC7B48(uint64_t result, unsigned __int16 a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  _QWORD *v10;
  uint8_t *v11;
  NSObject *v12;
  os_log_type_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  NSObject *v19;
  os_log_type_t v20;
  uint8_t *v21;
  uint64_t v22;
  uint64_t v24;

  if (*(unsigned __int16 *)(result + 24) != a2)
  {
    v7 = result;
    v8 = sub_21DBD2308();
    v9 = sub_21DBD2434();
    v10 = &unk_21DBD3000;
    if (os_log_type_enabled(v8, v9))
    {
      v11 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)v11 = 134217984;
      v24 = a4;
      sub_21DBD24AC();
      _os_log_impl(&dword_21DBAF000, v8, v9, "Stopping session while reconfiguring serviceType. { reporterID=%lld }", v11, 0xCu);
      MEMORY[0x22079B7C0](v11, -1, -1);
    }

    sub_21DBC6170(a4);
    swift_retain_n();
    v12 = sub_21DBD2308();
    v13 = sub_21DBD2434();
    if (os_log_type_enabled(v12, v13))
    {
      v14 = swift_slowAlloc();
      v22 = swift_slowAlloc();
      v24 = v22;
      *(_DWORD *)v14 = 134218498;
      sub_21DBD24AC();
      *(_WORD *)(v14 + 12) = 2080;
      v15 = AudioServiceType.description.getter(*(_WORD *)(v7 + 24));
      sub_21DBCECA4(v15, v16, &v24);
      sub_21DBD24AC();
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v14 + 22) = 2080;
      v17 = AudioServiceType.description.getter(a2);
      sub_21DBCECA4(v17, v18, &v24);
      sub_21DBD24AC();
      v10 = (_QWORD *)&unk_21DBD3000;
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_21DBAF000, v12, v13, "Setting new serviceType. { reporterID=%lld, oldServiceType=%s, newServiceType=%s) }", (uint8_t *)v14, 0x20u);
      swift_arrayDestroy();
      MEMORY[0x22079B7C0](v22, -1, -1);
      MEMORY[0x22079B7C0](v14, -1, -1);
    }
    else
    {
      swift_release_n();
    }

    objc_msgSend((id)sub_21DBC58F8(a5, 3), sel_setWithServiceType_for_, a2, a4);
    swift_unknownObjectRelease();
    *(_WORD *)(v7 + 24) = a2;
    v19 = sub_21DBD2308();
    v20 = sub_21DBD2434();
    if (os_log_type_enabled(v19, v20))
    {
      v21 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)v21 = v10[30];
      v24 = a4;
      sub_21DBD24AC();
      _os_log_impl(&dword_21DBAF000, v19, v20, "Restarting session after reconfiguring serviceType. { reporterID=%lld }", v21, 0xCu);
      MEMORY[0x22079B7C0](v21, -1, -1);
    }

    return sub_21DBC5DC0(a4);
  }
  return result;
}

uint64_t sub_21DBC7EBC(uint64_t result, unsigned __int16 a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;

  if (*(unsigned __int16 *)(result + 24) != a2)
  {
    v8 = result;
    v9 = sub_21DBD2308();
    v10 = sub_21DBD2434();
    if (os_log_type_enabled(v9, v10))
    {
      v11 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)v11 = 134217984;
      sub_21DBD24AC();
      _os_log_impl(&dword_21DBAF000, v9, v10, "Setting new serviceType. { reporterID=%lld }", v11, 0xCu);
      MEMORY[0x22079B7C0](v11, -1, -1);
    }

    objc_msgSend((id)sub_21DBC58F8(a5, 3), sel_setWithServiceType_for_, a2, a4);
    result = swift_unknownObjectRelease();
    *(_WORD *)(v8 + 24) = a2;
  }
  return result;
}

uint64_t sub_21DBC7FF0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  void *v19;
  id v20;
  char v21;
  uint64_t result;
  NSObject *v23;
  os_log_type_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  char *v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;

  v3 = v2;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F3D9F0);
  MEMORY[0x24BDAC7A8](v6, v7);
  v9 = (char *)&v32 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for ReporterState(0);
  v36 = *(_QWORD *)(v10 - 8);
  v37 = v10;
  MEMORY[0x24BDAC7A8](v10, v11);
  v13 = (char *)&v32 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_21DBD2374();
  v15 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v14, v16);
  v18 = (uint64_t *)((char *)&v32 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0));
  v19 = *(void **)(v3 + OBJC_IVAR____TtC14AudioAnalytics12ServerClient_serialQueue);
  *v18 = v19;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v15 + 104))(v18, *MEMORY[0x24BEE5610], v14);
  v20 = v19;
  v21 = sub_21DBD2380();
  result = (*(uint64_t (**)(_QWORD *, uint64_t))(v15 + 8))(v18, v14);
  if ((v21 & 1) != 0)
  {
    swift_bridgeObjectRetain_n();
    v23 = sub_21DBD2308();
    v24 = sub_21DBD2434();
    if (os_log_type_enabled(v23, v24))
    {
      v25 = swift_slowAlloc();
      v33 = swift_slowAlloc();
      v38 = a2;
      v39 = v33;
      *(_DWORD *)v25 = 134218243;
      v35 = v3;
      sub_21DBD24AC();
      *(_WORD *)(v25 + 12) = 2081;
      v32 = v25 + 14;
      swift_bridgeObjectRetain();
      v26 = sub_21DBD23B0();
      v34 = a2;
      v27 = v9;
      v28 = v13;
      v30 = v29;
      swift_bridgeObjectRelease();
      v38 = sub_21DBCECA4(v26, v30, &v39);
      v3 = v35;
      sub_21DBD24AC();
      swift_bridgeObjectRelease_n();
      v13 = v28;
      v9 = v27;
      a2 = v34;
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_21DBAF000, v23, v24, "Set configuration. { reporterID=%lld, configuration=%{private}s }", (uint8_t *)v25, 0x16u);
      v31 = v33;
      swift_arrayDestroy();
      MEMORY[0x22079B7C0](v31, -1, -1);
      MEMORY[0x22079B7C0](v25, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }

    sub_21DBC8CF0(a2, 0xD000000000000026, 0x800000021DBD5470, (uint64_t)v9);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v36 + 48))(v9, 1, v37) == 1)
    {
      return sub_21DBB6B98((uint64_t)v9, &qword_253F3D9F0);
    }
    else
    {
      sub_21DBC192C((uint64_t)v9, (uint64_t)v13, type metadata accessor for ReporterState);
      swift_bridgeObjectRetain();
      sub_21DBC1688((uint64_t)v13, v3, a1);
      swift_bridgeObjectRelease();
      return sub_21DBBA1BC((uint64_t)v13, type metadata accessor for ReporterState);
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_21DBC836C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  unint64_t v5;
  char v6;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v8;
  char v9;
  uint64_t result;
  __int16 v11;
  _OWORD v12[2];
  _OWORD v13[2];

  v4 = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  if (v4 && (v5 = sub_21DBCF33C(0xD00000000000001ALL, 0x800000021DBD5410), (v6 & 1) != 0))
  {
    sub_21DBB4014(*(_QWORD *)(a2 + 56) + 32 * v5, (uint64_t)v12);
    sub_21DBB3F4C(v12, v13);
    sub_21DBB4014((uint64_t)v13, (uint64_t)v12);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    sub_21DBD0C60(v12, 0xD000000000000018, 0x800000021DBD4F10, isUniquelyReferenced_nonNull_native);
    v8 = a2;
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v13);
  }
  else
  {
    v8 = a2;
  }
  swift_beginAccess();
  swift_bridgeObjectRetain();
  v9 = swift_isUniquelyReferenced_nonNull_native();
  *(_QWORD *)&v12[0] = *(_QWORD *)(a1 + 32);
  *(_QWORD *)(a1 + 32) = 0x8000000000000000;
  sub_21DBBED94(v8, (uint64_t)sub_21DBCAFE8, 0, v9, (uint64_t)v12);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)&v12[0];
  swift_bridgeObjectRelease();
  swift_endAccess();
  result = swift_bridgeObjectRelease();
  if (*(_QWORD *)(a1 + 40))
  {
    v11 = *(_WORD *)(a1 + 24);
    swift_retain();
    sub_21DBBC560(a2, v11);
    return swift_release();
  }
  return result;
}

uint64_t sub_21DBC84E8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  void *v21;
  id v22;
  uint64_t result;
  NSObject *v24;
  os_log_type_t v25;
  uint8_t *v26;
  uint64_t v27;
  uint64_t v28[4];

  v2 = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F3D9F0);
  v6 = MEMORY[0x24BDAC7A8](v4, v5);
  v28[0] = (uint64_t)v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6, v8);
  v10 = (char *)v28 - v9;
  v11 = type metadata accessor for ReporterState(0);
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11, v13);
  v15 = (char *)v28 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = sub_21DBD2374();
  v17 = *(_QWORD *)(v16 - 8);
  MEMORY[0x24BDAC7A8](v16, v18);
  v20 = (uint64_t *)((char *)v28 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0));
  v21 = *(void **)(v2 + OBJC_IVAR____TtC14AudioAnalytics12ServerClient_serialQueue);
  *v20 = v21;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v17 + 104))(v20, *MEMORY[0x24BEE5610], v16);
  v22 = v21;
  LOBYTE(v21) = sub_21DBD2380();
  result = (*(uint64_t (**)(_QWORD *, uint64_t))(v17 + 8))(v20, v16);
  if ((v21 & 1) != 0)
  {
    v24 = sub_21DBD2308();
    v25 = sub_21DBD2434();
    if (os_log_type_enabled(v24, v25))
    {
      v26 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)v26 = 134217984;
      v28[1] = a1;
      sub_21DBD24AC();
      _os_log_impl(&dword_21DBAF000, v24, v25, "Destroying reporter. { reporterID=%lld }", v26, 0xCu);
      MEMORY[0x22079B7C0](v26, -1, -1);
    }

    sub_21DBC8CF0(a1, 0xD00000000000001BLL, 0x800000021DBD5450, (uint64_t)v10);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11) == 1)
    {
      return sub_21DBB6B98((uint64_t)v10, &qword_253F3D9F0);
    }
    else
    {
      sub_21DBC192C((uint64_t)v10, (uint64_t)v15, type metadata accessor for ReporterState);
      sub_21DBC6170(a1);
      swift_beginAccess();
      v27 = v28[0];
      sub_21DBC87C8(a1, v28[0]);
      sub_21DBB6B98(v27, &qword_253F3D9F0);
      swift_endAccess();
      sub_21DBC0870((uint64_t)v15);
      return sub_21DBBA1BC((uint64_t)v15, type metadata accessor for ReporterState);
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_21DBC87C8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t *v2;
  uint64_t *v3;
  unint64_t v5;
  char v6;
  unint64_t v7;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;
  uint64_t v15;

  v3 = v2;
  v5 = sub_21DBCF30C(a1);
  if ((v6 & 1) != 0)
  {
    v7 = v5;
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v9 = *v2;
    v15 = *v3;
    *v3 = 0x8000000000000000;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      sub_21DBD17DC();
      v9 = v15;
    }
    v10 = *(_QWORD *)(v9 + 56);
    v11 = type metadata accessor for ReporterState(0);
    v12 = *(_QWORD *)(v11 - 8);
    sub_21DBC192C(v10 + *(_QWORD *)(v12 + 72) * v7, a2, type metadata accessor for ReporterState);
    sub_21DBBA000(v7, v9);
    *v3 = v9;
    swift_bridgeObjectRelease();
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v12 + 56))(a2, 0, 1, v11);
  }
  else
  {
    v14 = type metadata accessor for ReporterState(0);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(a2, 1, 1, v14);
  }
}

uint64_t sub_21DBC88C0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t result;
  int EnumCaseMultiPayload;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  int v32;
  BOOL v33;
  int v34;
  uint64_t v35;
  int v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;

  v42 = type metadata accessor for StartedReporterData(0);
  v3 = MEMORY[0x24BDAC7A8](v42, v2);
  v5 = (char *)&v38 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3, v6);
  v8 = (char *)&v38 - v7;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F3D9F0);
  v11 = MEMORY[0x24BDAC7A8](v9, v10);
  v13 = (uint64_t *)((char *)&v38 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x24BDAC7A8](v11, v14);
  v16 = (char *)&v38 - v15;
  v17 = type metadata accessor for ReporterState(0);
  v18 = *(_QWORD *)(v17 - 8);
  v20 = MEMORY[0x24BDAC7A8](v17, v19);
  v22 = (uint64_t *)((char *)&v38 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x24BDAC7A8](v20, v23);
  v25 = (char *)&v38 - v24;
  v41 = a1;
  sub_21DBC8CF0(a1, 0xD00000000000001DLL, 0x800000021DBD5430, (uint64_t)v16);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v16, 1, v17) == 1)
    return sub_21DBB6B98((uint64_t)v16, &qword_253F3D9F0);
  v40 = v5;
  sub_21DBC192C((uint64_t)v16, (uint64_t)v25, type metadata accessor for ReporterState);
  sub_21DBC1644((uint64_t)v25, (uint64_t)v22, type metadata accessor for ReporterState);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (!EnumCaseMultiPayload)
    goto LABEL_9;
  if (EnumCaseMultiPayload == 1)
  {
    type metadata accessor for ActiveReporterState(0);
    if (swift_getEnumCaseMultiPayload() != 1)
    {
      v28 = *v22;
      v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F3D888);
      sub_21DBC192C((uint64_t)v22 + *(int *)(v39 + 48), (uint64_t)v8, type metadata accessor for StartedReporterData);
      v29 = sub_21DBD22F0();
      v30 = (uint64_t)v40;
      result = (*(uint64_t (**)(char *, char *, uint64_t))(*(_QWORD *)(v29 - 8) + 16))(v40, v8, v29);
      v31 = *(int *)(v42 + 20);
      v32 = *(_DWORD *)&v8[v31];
      v33 = __CFADD__(v32, 1);
      v34 = v32 + 1;
      if (!v33)
        goto LABEL_11;
      __break(1u);
      goto LABEL_13;
    }
LABEL_9:
    sub_21DBBA1BC((uint64_t)v25, type metadata accessor for ReporterState);
    return swift_release();
  }
  type metadata accessor for ActiveReporterState(0);
  if (swift_getEnumCaseMultiPayload() == 1)
    goto LABEL_9;
  v28 = *v22;
  v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F3D888);
  sub_21DBC192C((uint64_t)v22 + *(int *)(v39 + 48), (uint64_t)v8, type metadata accessor for StartedReporterData);
  v35 = sub_21DBD22F0();
  v30 = (uint64_t)v40;
  result = (*(uint64_t (**)(char *, char *, uint64_t))(*(_QWORD *)(v35 - 8) + 16))(v40, v8, v35);
  v31 = *(int *)(v42 + 20);
  v36 = *(_DWORD *)&v8[v31];
  v33 = __CFADD__(v36, 1);
  v34 = v36 + 1;
  if (!v33)
  {
LABEL_11:
    *(_DWORD *)(v30 + v31) = v34;
    v37 = (uint64_t)v13 + *(int *)(v39 + 48);
    *v13 = v28;
    sub_21DBC1644(v30, v37, type metadata accessor for StartedReporterData);
    swift_storeEnumTagMultiPayload();
    swift_storeEnumTagMultiPayload();
    (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v18 + 56))(v13, 0, 1, v17);
    swift_beginAccess();
    swift_retain();
    sub_21DBC1C00((uint64_t)v13, v41);
    swift_endAccess();
    swift_release();
    sub_21DBBA1BC(v30, type metadata accessor for StartedReporterData);
    sub_21DBBA1BC((uint64_t)v8, type metadata accessor for StartedReporterData);
    return sub_21DBBA1BC((uint64_t)v25, type metadata accessor for ReporterState);
  }
LABEL_13:
  __break(1u);
  return result;
}

uint64_t sub_21DBC8CF0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  void *v18;
  id v19;
  uint64_t *v21;
  uint64_t v22;
  unint64_t v23;
  char v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;

  v5 = v4;
  v26 = a2;
  v27 = a3;
  v8 = type metadata accessor for ReporterState(0);
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8, v10);
  v12 = (char *)&v25 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_21DBD2374();
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13, v15);
  v17 = (uint64_t *)((char *)&v25 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0));
  v18 = *(void **)(v5 + OBJC_IVAR____TtC14AudioAnalytics12ServerClient_serialQueue);
  *v17 = v18;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v14 + 104))(v17, *MEMORY[0x24BEE5610], v13);
  v19 = v18;
  LOBYTE(v18) = sub_21DBD2380();
  (*(void (**)(_QWORD *, uint64_t))(v14 + 8))(v17, v13);
  if ((v18 & 1) != 0)
  {
    if (qword_253F3DA10 == -1)
      goto LABEL_3;
  }
  else
  {
    __break(1u);
  }
  swift_once();
LABEL_3:
  if (qword_253F3DC38 == a1)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a4, 1, 1, v8);
  v21 = (uint64_t *)(v5 + OBJC_IVAR____TtC14AudioAnalytics12ServerClient_clientReporterStates);
  swift_beginAccess();
  v22 = *v21;
  if (!*(_QWORD *)(v22 + 16))
    return sub_21DBC8EE4(v26, v27, a4);
  v23 = sub_21DBCF30C(a1);
  if ((v24 & 1) == 0)
    return sub_21DBC8EE4(v26, v27, a4);
  sub_21DBC1644(*(_QWORD *)(v22 + 56) + *(_QWORD *)(v9 + 72) * v23, (uint64_t)v12, type metadata accessor for ReporterState);
  sub_21DBC192C((uint64_t)v12, a4, type metadata accessor for ReporterState);
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v9 + 56))(a4, 0, 1, v8);
}

uint64_t sub_21DBC8EE4@<X0>(uint64_t a1@<X1>, unint64_t a2@<X2>, uint64_t a3@<X8>)
{
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;

  swift_bridgeObjectRetain_n();
  v6 = sub_21DBD2308();
  v7 = sub_21DBD2434();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = swift_slowAlloc();
    v9 = swift_slowAlloc();
    v12 = v9;
    *(_DWORD *)v8 = 136380931;
    swift_bridgeObjectRetain();
    sub_21DBCECA4(a1, a2, &v12);
    sub_21DBD24AC();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v8 + 12) = 2048;
    sub_21DBD24AC();
    _os_log_impl(&dword_21DBAF000, v6, v7, "ReporterID not created by client. Returning early. { function=%{private}s, reporterID=%lld }", (uint8_t *)v8, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x22079B7C0](v9, -1, -1);
    MEMORY[0x22079B7C0](v8, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  v10 = type metadata accessor for ReporterState(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(a3, 1, 1, v10);
}

BOOL sub_21DBC9098(int a1)
{
  NSObject *v1;
  os_log_type_t v2;
  uint8_t *v3;
  uint64_t v5[8];

  v5[7] = *MEMORY[0x24BDAC8D0];
  v5[0] = 0;
  notify_get_state(a1, v5);
  v1 = sub_21DBD2308();
  v2 = sub_21DBD2434();
  if (os_log_type_enabled(v1, v2))
  {
    v3 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v3 = 134217984;
    swift_beginAccess();
    v5[4] = v5[0];
    sub_21DBD24AC();
    _os_log_impl(&dword_21DBAF000, v1, v2, "Game mode state retrieved. { value=%llu }", v3, 0xCu);
    MEMORY[0x22079B7C0](v3, -1, -1);
  }

  swift_beginAccess();
  return v5[0] != 0;
}

void sub_21DBC91E0(uint64_t a1, uint64_t a2, int a3, unsigned __int16 a4)
{
  os_log_type_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  os_log_type_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  NSObject *oslog;
  uint64_t v25;

  if (a4 == 6)
  {
    swift_bridgeObjectRetain_n();
    oslog = sub_21DBD2308();
    v5 = sub_21DBD2458();
    if (os_log_type_enabled(oslog, v5))
    {
      v6 = swift_slowAlloc();
      v7 = swift_slowAlloc();
      v25 = v7;
      *(_DWORD *)v6 = 134218754;
      sub_21DBD24AC();
      *(_WORD *)(v6 + 12) = 2082;
      v8 = AudioEventCategory.description.getter(a3);
      sub_21DBCECA4(v8, v9, &v25);
      sub_21DBD24AC();
      swift_bridgeObjectRelease();
      *(_WORD *)(v6 + 22) = 2082;
      v10 = AudioEventType.description.getter(6u);
      sub_21DBCECA4(v10, v11, &v25);
      sub_21DBD24AC();
      swift_bridgeObjectRelease();
      *(_WORD *)(v6 + 32) = 2082;
      swift_bridgeObjectRetain();
      v12 = sub_21DBD23B0();
      v14 = v13;
      swift_bridgeObjectRelease();
      sub_21DBCECA4(v12, v14, &v25);
      sub_21DBD24AC();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_21DBAF000, oslog, v5, "Sending message. { reporterID=%lld, category=%{public}s, type=%{public}s, message=%{public}s }", (uint8_t *)v6, 0x2Au);
      swift_arrayDestroy();
      MEMORY[0x22079B7C0](v7, -1, -1);
      v15 = v6;
LABEL_6:
      MEMORY[0x22079B7C0](v15, -1, -1);

      return;
    }
    swift_bridgeObjectRelease_n();
  }
  else
  {
    oslog = sub_21DBD2308();
    v17 = sub_21DBD2434();
    if (os_log_type_enabled(oslog, v17))
    {
      v18 = swift_slowAlloc();
      v19 = swift_slowAlloc();
      v25 = v19;
      *(_DWORD *)v18 = 134218498;
      sub_21DBD24AC();
      *(_WORD *)(v18 + 12) = 2082;
      v20 = AudioEventCategory.description.getter(a3);
      sub_21DBCECA4(v20, v21, &v25);
      sub_21DBD24AC();
      swift_bridgeObjectRelease();
      *(_WORD *)(v18 + 22) = 2082;
      v22 = AudioEventType.description.getter(a4);
      sub_21DBCECA4(v22, v23, &v25);
      sub_21DBD24AC();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_21DBAF000, oslog, v17, "Sending message. { reporterID=%lld, category=%{public}s, type=%{public}s }", (uint8_t *)v18, 0x20u);
      swift_arrayDestroy();
      MEMORY[0x22079B7C0](v19, -1, -1);
      v15 = v18;
      goto LABEL_6;
    }
  }

}

void sub_21DBC9588(char a1)
{
  char *v1;
  char *v2;
  NSObject *v4;
  os_log_type_t v5;
  _BOOL4 v6;
  uint8_t *v7;
  uint64_t *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t *v12;
  uint64_t *v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;

  if (v1[OBJC_IVAR____TtC14AudioAnalytics12ServerClient__isCachingEnabled] != (a1 & 1))
  {
    v2 = v1;
    v1[OBJC_IVAR____TtC14AudioAnalytics12ServerClient__isCachingEnabled] = a1 & 1;
    v4 = sub_21DBD2308();
    v5 = sub_21DBD2434();
    v6 = os_log_type_enabled(v4, v5);
    if ((a1 & 1) != 0)
    {
      if (v6)
      {
        v7 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v7 = 0;
        _os_log_impl(&dword_21DBAF000, v4, v5, "Entering caching mode.", v7, 2u);
        MEMORY[0x22079B7C0](v7, -1, -1);
      }

      v8 = (uint64_t *)&v2[OBJC_IVAR____TtC14AudioAnalytics12ServerClient_clientReporterStates];
      swift_beginAccess();
      v9 = v2;
      v10 = swift_bridgeObjectRetain();
      v11 = sub_21DBCB2FC(v10, (uint64_t)v9);
      swift_bridgeObjectRelease();

      *v8 = v11;
      swift_bridgeObjectRelease();
    }
    else
    {
      if (v6)
      {
        v12 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v12 = 0;
        _os_log_impl(&dword_21DBAF000, v4, v5, "Leaving caching mode.", v12, 2u);
        MEMORY[0x22079B7C0](v12, -1, -1);
      }

      v13 = (uint64_t *)&v2[OBJC_IVAR____TtC14AudioAnalytics12ServerClient_clientReporterStates];
      swift_beginAccess();
      v14 = v2;
      v15 = swift_bridgeObjectRetain();
      v16 = sub_21DBCB608(v15, (uint64_t)v14);
      swift_bridgeObjectRelease();

      *v13 = v16;
      swift_bridgeObjectRelease();
      sub_21DBC5758();
    }
  }
}

id sub_21DBC9790()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ServerClient(0);
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_21DBC9874()
{
  return type metadata accessor for ServerClient(0);
}

uint64_t type metadata accessor for ServerClient(uint64_t a1)
{
  return sub_21DBCA068(a1, (uint64_t *)&unk_253F3DA70);
}

uint64_t sub_21DBC9890()
{
  uint64_t result;
  unint64_t v1;

  result = sub_21DBD2320();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t sub_21DBC994C()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for ReporterIDGenerator()
{
  return objc_opt_self();
}

uint64_t sub_21DBC997C()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  unint64_t v3;
  char v4;
  uint64_t v6;
  unint64_t v7;
  char v8;
  __int128 v9;
  __int128 v10;
  uint64_t v11;

  v1 = (uint64_t *)(v0 + 32);
  swift_beginAccess();
  v2 = *(_QWORD *)(v0 + 32);
  if (!*(_QWORD *)(v2 + 16))
  {
    v9 = 0u;
    v10 = 0u;
LABEL_9:
    sub_21DBB6B98((uint64_t)&v9, &qword_253F3D900);
    goto LABEL_10;
  }
  swift_bridgeObjectRetain();
  v3 = sub_21DBCF33C(0xD000000000000018, 0x800000021DBD4F10);
  if ((v4 & 1) != 0)
  {
    sub_21DBB4014(*(_QWORD *)(v2 + 56) + 32 * v3, (uint64_t)&v9);
  }
  else
  {
    v9 = 0u;
    v10 = 0u;
  }
  swift_bridgeObjectRelease();
  if (!*((_QWORD *)&v10 + 1))
    goto LABEL_9;
  if ((swift_dynamicCast() & 1) != 0)
    return v11;
LABEL_10:
  v6 = *v1;
  if (!*(_QWORD *)(*v1 + 16))
  {
    v9 = 0u;
    v10 = 0u;
LABEL_19:
    sub_21DBB6B98((uint64_t)&v9, &qword_253F3D900);
    return 0;
  }
  swift_bridgeObjectRetain();
  v7 = sub_21DBCF33C(0xD00000000000001ALL, 0x800000021DBD5410);
  if ((v8 & 1) != 0)
  {
    sub_21DBB4014(*(_QWORD *)(v6 + 56) + 32 * v7, (uint64_t)&v9);
  }
  else
  {
    v9 = 0u;
    v10 = 0u;
  }
  swift_bridgeObjectRelease();
  if (!*((_QWORD *)&v10 + 1))
    goto LABEL_19;
  if (swift_dynamicCast())
    return v11;
  else
    return 0;
}

uint64_t sub_21DBC9B28()
{
  swift_bridgeObjectRelease();
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for ReporterData()
{
  return objc_opt_self();
}

_QWORD *sub_21DBC9B74(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  int v5;
  int EnumCaseMultiPayload;
  int v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) == 0)
  {
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2)
    {
      type metadata accessor for ActiveReporterState(0);
      v9 = swift_getEnumCaseMultiPayload();
      *a1 = *a2;
      swift_retain();
      if (v9 == 1)
        goto LABEL_11;
    }
    else
    {
      if (EnumCaseMultiPayload != 1)
      {
        *a1 = *a2;
        swift_retain();
LABEL_12:
        swift_storeEnumTagMultiPayload();
        return a1;
      }
      type metadata accessor for ActiveReporterState(0);
      v7 = swift_getEnumCaseMultiPayload();
      *a1 = *a2;
      swift_retain();
      if (v7 == 1)
      {
LABEL_11:
        swift_storeEnumTagMultiPayload();
        goto LABEL_12;
      }
    }
    v10 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_253F3D888) + 48);
    v11 = (char *)a1 + v10;
    v12 = (char *)a2 + v10;
    v13 = sub_21DBD22F0();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 16))(v11, v12, v13);
    v14 = type metadata accessor for StartedReporterData(0);
    *(_DWORD *)&v11[*(int *)(v14 + 20)] = *(_DWORD *)&v12[*(int *)(v14 + 20)];
    goto LABEL_11;
  }
  v8 = *a2;
  *a1 = *a2;
  a1 = (_QWORD *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
  swift_retain();
  return a1;
}

uint64_t type metadata accessor for ActiveReporterState(uint64_t a1)
{
  return sub_21DBCA068(a1, (uint64_t *)&unk_253F3DA38);
}

uint64_t type metadata accessor for StartedReporterData(uint64_t a1)
{
  return sub_21DBCA068(a1, (uint64_t *)&unk_253F3D910);
}

uint64_t sub_21DBC9D80(uint64_t a1)
{
  uint64_t result;
  int EnumCaseMultiPayload;
  uint64_t v4;
  uint64_t v5;

  result = swift_getEnumCaseMultiPayload();
  if ((_DWORD)result == 2 || (_DWORD)result == 1)
  {
    type metadata accessor for ActiveReporterState(0);
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    result = swift_release();
    if (EnumCaseMultiPayload != 1)
    {
      v4 = a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_253F3D888) + 48);
      v5 = sub_21DBD22F0();
      return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
    }
  }
  else if (!(_DWORD)result)
  {
    return swift_release();
  }
  return result;
}

_QWORD *sub_21DBC9E24(_QWORD *a1, _QWORD *a2)
{
  int EnumCaseMultiPayload;
  int v5;
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;

  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 2 || EnumCaseMultiPayload == 1)
  {
    type metadata accessor for ActiveReporterState(0);
    v5 = swift_getEnumCaseMultiPayload();
    *a1 = *a2;
    swift_retain();
    if (v5 != 1)
    {
      v6 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_253F3D888) + 48);
      v7 = (char *)a1 + v6;
      v8 = (char *)a2 + v6;
      v9 = sub_21DBD22F0();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 16))(v7, v8, v9);
      v10 = type metadata accessor for StartedReporterData(0);
      *(_DWORD *)&v7[*(int *)(v10 + 20)] = *(_DWORD *)&v8[*(int *)(v10 + 20)];
    }
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    *a1 = *a2;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

_QWORD *sub_21DBC9F30(_QWORD *a1, _QWORD *a2)
{
  int EnumCaseMultiPayload;
  int v5;
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;

  if (a1 != a2)
  {
    sub_21DBBA1BC((uint64_t)a1, type metadata accessor for ReporterState);
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2 || EnumCaseMultiPayload == 1)
    {
      type metadata accessor for ActiveReporterState(0);
      v5 = swift_getEnumCaseMultiPayload();
      *a1 = *a2;
      swift_retain();
      if (v5 != 1)
      {
        v6 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_253F3D888) + 48);
        v7 = (char *)a1 + v6;
        v8 = (char *)a2 + v6;
        v9 = sub_21DBD22F0();
        (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 16))(v7, v8, v9);
        v10 = type metadata accessor for StartedReporterData(0);
        *(_DWORD *)&v7[*(int *)(v10 + 20)] = *(_DWORD *)&v8[*(int *)(v10 + 20)];
      }
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t type metadata accessor for ReporterState(uint64_t a1)
{
  return sub_21DBCA068(a1, (uint64_t *)&unk_253F3DA20);
}

uint64_t sub_21DBCA068(uint64_t a1, uint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata();
  return result;
}

_QWORD *sub_21DBCA09C(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  int EnumCaseMultiPayload;
  uint64_t active;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;

  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 2)
  {
    active = type metadata accessor for ActiveReporterState(0);
    if (swift_getEnumCaseMultiPayload())
    {
LABEL_6:
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(active - 8) + 64));
LABEL_9:
      swift_storeEnumTagMultiPayload();
      return a1;
    }
LABEL_8:
    *a1 = *a2;
    v8 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_253F3D888) + 48);
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    v11 = sub_21DBD22F0();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(v9, v10, v11);
    v12 = type metadata accessor for StartedReporterData(0);
    *(_DWORD *)&v9[*(int *)(v12 + 20)] = *(_DWORD *)&v10[*(int *)(v12 + 20)];
    swift_storeEnumTagMultiPayload();
    goto LABEL_9;
  }
  if (EnumCaseMultiPayload == 1)
  {
    active = type metadata accessor for ActiveReporterState(0);
    if (swift_getEnumCaseMultiPayload())
      goto LABEL_6;
    goto LABEL_8;
  }
  memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  return a1;
}

_QWORD *sub_21DBCA258(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  int EnumCaseMultiPayload;
  uint64_t active;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;

  if (a1 != a2)
  {
    sub_21DBBA1BC((uint64_t)a1, type metadata accessor for ReporterState);
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2)
    {
      active = type metadata accessor for ActiveReporterState(0);
      if (swift_getEnumCaseMultiPayload())
      {
LABEL_7:
        memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(active - 8) + 64));
LABEL_10:
        swift_storeEnumTagMultiPayload();
        return a1;
      }
LABEL_9:
      *a1 = *a2;
      v8 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_253F3D888) + 48);
      v9 = (char *)a1 + v8;
      v10 = (char *)a2 + v8;
      v11 = sub_21DBD22F0();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(v9, v10, v11);
      v12 = type metadata accessor for StartedReporterData(0);
      *(_DWORD *)&v9[*(int *)(v12 + 20)] = *(_DWORD *)&v10[*(int *)(v12 + 20)];
      swift_storeEnumTagMultiPayload();
      goto LABEL_10;
    }
    if (EnumCaseMultiPayload == 1)
    {
      active = type metadata accessor for ActiveReporterState(0);
      if (swift_getEnumCaseMultiPayload())
        goto LABEL_7;
      goto LABEL_9;
    }
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  return a1;
}

uint64_t sub_21DBCA42C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a3 - 8) + 48))();
}

uint64_t sub_21DBCA438(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a4 - 8) + 56))();
}

uint64_t sub_21DBCA448()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_21DBCA458()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for ActiveReporterState(319);
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

uint64_t *sub_21DBCA4CC(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v8 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_21DBD22F0();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    *(_DWORD *)((char *)a1 + *(int *)(a3 + 20)) = *(_DWORD *)((char *)a2 + *(int *)(a3 + 20));
  }
  return a1;
}

uint64_t sub_21DBCA554(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_21DBD22F0();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
}

uint64_t sub_21DBCA588(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = sub_21DBD22F0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  *(_DWORD *)(a1 + *(int *)(a3 + 20)) = *(_DWORD *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t sub_21DBCA5E4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = sub_21DBD22F0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  *(_DWORD *)(a1 + *(int *)(a3 + 20)) = *(_DWORD *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t sub_21DBCA640(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = sub_21DBD22F0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  *(_DWORD *)(a1 + *(int *)(a3 + 20)) = *(_DWORD *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t sub_21DBCA69C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = sub_21DBD22F0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  *(_DWORD *)(a1 + *(int *)(a3 + 20)) = *(_DWORD *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t sub_21DBCA6F8()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_21DBCA704(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_21DBD22F0();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(a1, a2, v4);
}

uint64_t sub_21DBCA740()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_21DBCA74C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_21DBD22F0();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(a1, a2, a2, v4);
}

uint64_t sub_21DBCA78C()
{
  uint64_t result;
  unint64_t v1;

  result = sub_21DBD22F0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_21DBCA800(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  int EnumCaseMultiPayload;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v7 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v7 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    *a1 = *a2;
    swift_retain();
    if (EnumCaseMultiPayload != 1)
    {
      v8 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_253F3D888) + 48);
      v9 = (char *)a1 + v8;
      v10 = (char *)a2 + v8;
      v11 = sub_21DBD22F0();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(v9, v10, v11);
      v12 = type metadata accessor for StartedReporterData(0);
      *(_DWORD *)&v9[*(int *)(v12 + 20)] = *(_DWORD *)&v10[*(int *)(v12 + 20)];
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_21DBCA8EC(uint64_t a1)
{
  int EnumCaseMultiPayload;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;

  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  result = swift_release();
  if (EnumCaseMultiPayload != 1)
  {
    v4 = a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_253F3D888) + 48);
    v5 = sub_21DBD22F0();
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  }
  return result;
}

_QWORD *sub_21DBCA958(_QWORD *a1, _QWORD *a2)
{
  int EnumCaseMultiPayload;
  uint64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;

  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  *a1 = *a2;
  swift_retain();
  if (EnumCaseMultiPayload != 1)
  {
    v5 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_253F3D888) + 48);
    v6 = (char *)a1 + v5;
    v7 = (char *)a2 + v5;
    v8 = sub_21DBD22F0();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(v6, v7, v8);
    v9 = type metadata accessor for StartedReporterData(0);
    *(_DWORD *)&v6[*(int *)(v9 + 20)] = *(_DWORD *)&v7[*(int *)(v9 + 20)];
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

_QWORD *sub_21DBCAA10(_QWORD *a1, _QWORD *a2)
{
  int EnumCaseMultiPayload;
  uint64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;

  if (a1 != a2)
  {
    sub_21DBBA1BC((uint64_t)a1, type metadata accessor for ActiveReporterState);
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    *a1 = *a2;
    swift_retain();
    if (EnumCaseMultiPayload != 1)
    {
      v5 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_253F3D888) + 48);
      v6 = (char *)a1 + v5;
      v7 = (char *)a2 + v5;
      v8 = sub_21DBD22F0();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(v6, v7, v8);
      v9 = type metadata accessor for StartedReporterData(0);
      *(_DWORD *)&v6[*(int *)(v9 + 20)] = *(_DWORD *)&v7[*(int *)(v9 + 20)];
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

_QWORD *sub_21DBCAAE0(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;

  if (swift_getEnumCaseMultiPayload())
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  else
  {
    *a1 = *a2;
    v6 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_253F3D888) + 48);
    v7 = (char *)a1 + v6;
    v8 = (char *)a2 + v6;
    v9 = sub_21DBD22F0();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v7, v8, v9);
    v10 = type metadata accessor for StartedReporterData(0);
    *(_DWORD *)&v7[*(int *)(v10 + 20)] = *(_DWORD *)&v8[*(int *)(v10 + 20)];
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

_QWORD *sub_21DBCAB9C(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;

  if (a1 != a2)
  {
    sub_21DBBA1BC((uint64_t)a1, type metadata accessor for ActiveReporterState);
    if (swift_getEnumCaseMultiPayload())
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    }
    else
    {
      *a1 = *a2;
      v6 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_253F3D888) + 48);
      v7 = (char *)a1 + v6;
      v8 = (char *)a2 + v6;
      v9 = sub_21DBD22F0();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v7, v8, v9);
      v10 = type metadata accessor for StartedReporterData(0);
      *(_DWORD *)&v7[*(int *)(v10 + 20)] = *(_DWORD *)&v8[*(int *)(v10 + 20)];
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

uint64_t sub_21DBCAC70()
{
  uint64_t result;
  unint64_t v1;
  uint64_t v2;
  _QWORD v3[6];

  result = type metadata accessor for StartedReporterData(319);
  if (v1 <= 0x3F)
  {
    v2 = MEMORY[0x24BEE0190] + 64;
    swift_getTupleTypeLayout2();
    v3[4] = v3;
    v3[5] = v2;
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

uint64_t sub_21DBCACF8(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_21DBCAD30(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_21DBCAD14(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_21DBCAE8C(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_21DBCAD30(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
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
        goto LABEL_32;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_253F3D908);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 29;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 2);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[4 * v8])
      memmove(v13, v14, 4 * v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[4 * v8] || v13 >= &v14[4 * v8])
  {
    memcpy(v13, v14, 4 * v8);
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  result = sub_21DBD256C();
  __break(1u);
  return result;
}

uint64_t sub_21DBCAE8C(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
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
        goto LABEL_32;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_253F3D890);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 25;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 3);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[8 * v8])
      memmove(v13, v14, 8 * v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[8 * v8] || v13 >= &v14[8 * v8])
  {
    memcpy(v13, v14, 8 * v8);
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  result = sub_21DBD256C();
  __break(1u);
  return result;
}

uint64_t sub_21DBCAFE8@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;

  v4 = *a1;
  v3 = a1[1];
  sub_21DBB4014((uint64_t)(a1 + 2), (uint64_t)(a2 + 2));
  *a2 = v4;
  a2[1] = v3;
  return swift_bridgeObjectRetain();
}

double sub_21DBCB028@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  uint64_t *v3;
  uint64_t *v4;
  unint64_t v8;
  char v9;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v11;
  double result;
  uint64_t v13;

  v4 = v3;
  swift_bridgeObjectRetain();
  v8 = sub_21DBCF33C(a1, a2);
  LOBYTE(a2) = v9;
  swift_bridgeObjectRelease();
  if ((a2 & 1) != 0)
  {
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v11 = *v4;
    v13 = *v4;
    *v4 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_21DBD144C();
      v11 = v13;
    }
    swift_bridgeObjectRelease();
    sub_21DBB3F4C((_OWORD *)(*(_QWORD *)(v11 + 56) + 32 * v8), a3);
    sub_21DBB9E2C(v8, v11);
    *v4 = v11;
    swift_bridgeObjectRelease();
  }
  else
  {
    result = 0.0;
    *a3 = 0u;
    a3[1] = 0u;
  }
  return result;
}

uint64_t sub_21DBCB118@<X0>(_OWORD *a1@<X8>)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  int64_t v5;
  uint64_t v6;
  int64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  int64_t v14;
  int64_t v15;
  unint64_t v16;
  int64_t v17;
  int64_t v18;
  void (*v19)(_OWORD *);
  uint64_t result;
  _OWORD v21[3];
  _OWORD v22[3];
  __int128 v23;
  _OWORD v24[2];

  v3 = *v1;
  v4 = v1[1];
  v6 = v1[2];
  v5 = v1[3];
  v7 = v5;
  v8 = v1[4];
  if (v8)
  {
    v9 = (v8 - 1) & v8;
    v10 = __clz(__rbit64(v8)) | (v5 << 6);
LABEL_3:
    v11 = (uint64_t *)(*(_QWORD *)(v3 + 48) + 16 * v10);
    v13 = *v11;
    v12 = v11[1];
    sub_21DBB4014(*(_QWORD *)(v3 + 56) + 32 * v10, (uint64_t)v24);
    *(_QWORD *)&v23 = v13;
    *((_QWORD *)&v23 + 1) = v12;
    swift_bridgeObjectRetain();
    goto LABEL_23;
  }
  v14 = v5 + 1;
  if (__OFADD__(v5, 1))
  {
    __break(1u);
    return result;
  }
  v15 = (unint64_t)(v6 + 64) >> 6;
  if (v14 < v15)
  {
    v16 = *(_QWORD *)(v4 + 8 * v14);
    if (v16)
    {
LABEL_7:
      v9 = (v16 - 1) & v16;
      v10 = __clz(__rbit64(v16)) + (v14 << 6);
      v7 = v14;
      goto LABEL_3;
    }
    v17 = v5 + 2;
    v7 = v5 + 1;
    if (v5 + 2 < v15)
    {
      v16 = *(_QWORD *)(v4 + 8 * v17);
      if (v16)
      {
LABEL_10:
        v14 = v17;
        goto LABEL_7;
      }
      v7 = v5 + 2;
      if (v5 + 3 < v15)
      {
        v16 = *(_QWORD *)(v4 + 8 * (v5 + 3));
        if (v16)
        {
          v14 = v5 + 3;
          goto LABEL_7;
        }
        v17 = v5 + 4;
        v7 = v5 + 3;
        if (v5 + 4 < v15)
        {
          v16 = *(_QWORD *)(v4 + 8 * v17);
          if (v16)
            goto LABEL_10;
          v14 = v5 + 5;
          v7 = v5 + 4;
          if (v5 + 5 < v15)
          {
            v16 = *(_QWORD *)(v4 + 8 * v14);
            if (v16)
              goto LABEL_7;
            v7 = v15 - 1;
            v18 = v5 + 6;
            while (v15 != v18)
            {
              v16 = *(_QWORD *)(v4 + 8 * v18++);
              if (v16)
              {
                v14 = v18 - 1;
                goto LABEL_7;
              }
            }
          }
        }
      }
    }
  }
  v9 = 0;
  memset(v24, 0, sizeof(v24));
  v23 = 0u;
LABEL_23:
  *v1 = v3;
  v1[1] = v4;
  v1[2] = v6;
  v1[3] = v7;
  v1[4] = v9;
  v19 = (void (*)(_OWORD *))v1[5];
  result = sub_21DBCC218((uint64_t)&v23, (uint64_t)v22, &qword_253F3D8F0);
  if (*((_QWORD *)&v22[0] + 1))
  {
    v21[0] = v22[0];
    v21[1] = v22[1];
    v21[2] = v22[2];
    v19(v21);
    return sub_21DBB6B98((uint64_t)v21, &qword_253F3D8E8);
  }
  else
  {
    a1[1] = 0u;
    a1[2] = 0u;
    *a1 = 0u;
  }
  return result;
}

uint64_t sub_21DBCB2FC(uint64_t a1, uint64_t a2)
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
  char *v12;
  uint64_t result;
  _QWORD *v14;
  int64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t (*v22)(uint64_t);
  unint64_t v23;
  unint64_t i;
  int64_t v25;
  unint64_t v26;
  int64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t);
  int EnumCaseMultiPayload;
  _QWORD *v34;
  uint64_t v35;
  BOOL v36;
  uint64_t v37;
  _QWORD v38[2];
  uint64_t v39;
  int64_t v40;
  _QWORD *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  int64_t v47;

  v38[1] = a2;
  v3 = type metadata accessor for ReporterState(0);
  v44 = *(_QWORD *)(v3 - 8);
  v45 = v3;
  v5 = MEMORY[0x24BDAC7A8](v3, v4);
  v43 = (uint64_t)v38 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = MEMORY[0x24BDAC7A8](v5, v7);
  v41 = (_QWORD *)((char *)v38 - v9);
  MEMORY[0x24BDAC7A8](v8, v10);
  v12 = (char *)v38 - v11;
  __swift_instantiateConcreteTypeFromMangledName(&qword_253F3D8D8);
  result = sub_21DBD2548();
  v14 = (_QWORD *)result;
  v15 = 0;
  v46 = a1;
  v18 = *(_QWORD *)(a1 + 64);
  v17 = a1 + 64;
  v16 = v18;
  v19 = 1 << *(_BYTE *)(v17 - 32);
  v20 = -1;
  if (v19 < 64)
    v20 = ~(-1 << v19);
  v21 = v20 & v16;
  v39 = v17;
  v40 = (unint64_t)(v19 + 63) >> 6;
  v42 = result + 64;
  v22 = type metadata accessor for ReporterState;
  if ((v20 & v16) == 0)
    goto LABEL_5;
LABEL_4:
  v23 = __clz(__rbit64(v21));
  v21 &= v21 - 1;
  v47 = v15;
  for (i = v23 | (v15 << 6); ; i = __clz(__rbit64(v26)) + (v27 << 6))
  {
    v29 = *(_QWORD *)(*(_QWORD *)(v46 + 48) + 8 * i);
    v30 = *(_QWORD *)(v44 + 72) * i;
    sub_21DBC1644(*(_QWORD *)(v46 + 56) + v30, (uint64_t)v12, v22);
    v31 = v43;
    sub_21DBC1644((uint64_t)v12, v43, v22);
    v32 = v22;
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    sub_21DBBA1BC(v31, v32);
    v34 = v41;
    if (EnumCaseMultiPayload == 2)
      sub_21DBC1644((uint64_t)v12, (uint64_t)v41, v32);
    else
      sub_21DBC11B0((uint64_t)v12, v41);
    v22 = v32;
    sub_21DBBA1BC((uint64_t)v12, v32);
    *(_QWORD *)(v42 + ((i >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << i;
    *(_QWORD *)(v14[6] + 8 * i) = v29;
    result = sub_21DBC192C((uint64_t)v34, v14[7] + v30, v32);
    v35 = v14[2];
    v36 = __OFADD__(v35, 1);
    v37 = v35 + 1;
    if (v36)
    {
      __break(1u);
LABEL_27:
      __break(1u);
      goto LABEL_28;
    }
    v14[2] = v37;
    v15 = v47;
    if (v21)
      goto LABEL_4;
LABEL_5:
    v25 = v15 + 1;
    if (__OFADD__(v15, 1))
      goto LABEL_27;
    if (v25 >= v40)
      return (uint64_t)v14;
    v26 = *(_QWORD *)(v39 + 8 * v25);
    v27 = v15 + 1;
    if (!v26)
    {
      v27 = v15 + 2;
      if (v15 + 2 >= v40)
        return (uint64_t)v14;
      v26 = *(_QWORD *)(v39 + 8 * v27);
      if (!v26)
      {
        v27 = v15 + 3;
        if (v15 + 3 >= v40)
          return (uint64_t)v14;
        v26 = *(_QWORD *)(v39 + 8 * v27);
        if (!v26)
          break;
      }
    }
LABEL_18:
    v21 = (v26 - 1) & v26;
    v47 = v27;
  }
  v28 = v15 + 4;
  if (v15 + 4 >= v40)
    return (uint64_t)v14;
  v26 = *(_QWORD *)(v39 + 8 * v28);
  if (v26)
  {
    v27 = v15 + 4;
    goto LABEL_18;
  }
  while (1)
  {
    v27 = v28 + 1;
    if (__OFADD__(v28, 1))
      break;
    if (v27 >= v40)
      return (uint64_t)v14;
    v26 = *(_QWORD *)(v39 + 8 * v27);
    ++v28;
    if (v26)
      goto LABEL_18;
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_21DBCB608(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t result;
  _QWORD *v15;
  int64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t i;
  int64_t v25;
  unint64_t v26;
  int64_t v27;
  uint64_t v28;
  unint64_t v29;
  int EnumCaseMultiPayload;
  uint64_t v31;
  BOOL v32;
  uint64_t v33;
  _QWORD v34[3];
  uint64_t v35;
  int64_t v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  _QWORD *v42;

  v34[2] = a2;
  v3 = type metadata accessor for ReporterState(0);
  v39 = *(_QWORD *)(v3 - 8);
  v40 = v3;
  v5 = MEMORY[0x24BDAC7A8](v3, v4);
  v7 = (char *)v34 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = MEMORY[0x24BDAC7A8](v5, v8);
  v42 = (_QWORD *)((char *)v34 - v10);
  MEMORY[0x24BDAC7A8](v9, v11);
  v13 = (char *)v34 - v12;
  __swift_instantiateConcreteTypeFromMangledName(&qword_253F3D8D8);
  result = sub_21DBD2548();
  v15 = (_QWORD *)result;
  v16 = 0;
  v41 = a1;
  v19 = *(_QWORD *)(a1 + 64);
  v18 = a1 + 64;
  v17 = v19;
  v20 = 1 << *(_BYTE *)(v18 - 32);
  v21 = -1;
  if (v20 < 64)
    v21 = ~(-1 << v20);
  v22 = v21 & v17;
  v35 = v18;
  v36 = (unint64_t)(v20 + 63) >> 6;
  v37 = v7;
  v38 = result + 64;
  if ((v21 & v17) == 0)
    goto LABEL_5;
LABEL_4:
  v23 = __clz(__rbit64(v22));
  v22 &= v22 - 1;
  for (i = v23 | (v16 << 6); ; i = __clz(__rbit64(v26)) + (v16 << 6))
  {
    v28 = *(_QWORD *)(*(_QWORD *)(v41 + 48) + 8 * i);
    v29 = *(_QWORD *)(v39 + 72) * i;
    sub_21DBC1644(*(_QWORD *)(v41 + 56) + v29, (uint64_t)v13, type metadata accessor for ReporterState);
    sub_21DBC1644((uint64_t)v13, (uint64_t)v7, type metadata accessor for ReporterState);
    if (swift_getEnumCaseMultiPayload() == 2)
    {
      type metadata accessor for ActiveReporterState(0);
      EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
      sub_21DBBA1BC((uint64_t)v7, type metadata accessor for ActiveReporterState);
      if (EnumCaseMultiPayload == 1)
      {
        sub_21DBC0408((uint64_t)v13, v42);
        v7 = v37;
        goto LABEL_24;
      }
    }
    else
    {
      sub_21DBBA1BC((uint64_t)v7, type metadata accessor for ReporterState);
    }
    sub_21DBC1644((uint64_t)v13, (uint64_t)v42, type metadata accessor for ReporterState);
    v7 = v37;
LABEL_24:
    sub_21DBBA1BC((uint64_t)v13, type metadata accessor for ReporterState);
    *(_QWORD *)(v38 + ((i >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << i;
    *(_QWORD *)(v15[6] + 8 * i) = v28;
    result = sub_21DBC192C((uint64_t)v42, v15[7] + v29, type metadata accessor for ReporterState);
    v31 = v15[2];
    v32 = __OFADD__(v31, 1);
    v33 = v31 + 1;
    if (v32)
    {
      __break(1u);
LABEL_29:
      __break(1u);
      goto LABEL_30;
    }
    v15[2] = v33;
    if (v22)
      goto LABEL_4;
LABEL_5:
    v25 = v16 + 1;
    if (__OFADD__(v16, 1))
      goto LABEL_29;
    if (v25 >= v36)
      return (uint64_t)v15;
    v26 = *(_QWORD *)(v35 + 8 * v25);
    ++v16;
    if (!v26)
    {
      v16 = v25 + 1;
      if (v25 + 1 >= v36)
        return (uint64_t)v15;
      v26 = *(_QWORD *)(v35 + 8 * v16);
      if (!v26)
      {
        v16 = v25 + 2;
        if (v25 + 2 >= v36)
          return (uint64_t)v15;
        v26 = *(_QWORD *)(v35 + 8 * v16);
        if (!v26)
          break;
      }
    }
LABEL_18:
    v22 = (v26 - 1) & v26;
  }
  v27 = v25 + 3;
  if (v27 >= v36)
    return (uint64_t)v15;
  v26 = *(_QWORD *)(v35 + 8 * v27);
  if (v26)
  {
    v16 = v27;
    goto LABEL_18;
  }
  while (1)
  {
    v16 = v27 + 1;
    if (__OFADD__(v27, 1))
      break;
    if (v16 >= v36)
      return (uint64_t)v15;
    v26 = *(_QWORD *)(v35 + 8 * v16);
    ++v27;
    if (v26)
      goto LABEL_18;
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_21DBCB938(uint64_t a1)
{
  return sub_21DBCBA38(a1, (uint64_t (*)(uint64_t, _QWORD, _QWORD, _QWORD, uint64_t))sub_21DBC7B48);
}

uint64_t objectdestroyTm()
{
  uint64_t v0;
  uint64_t v1;
  int EnumCaseMultiPayload;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v1 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for ReporterState(0) - 8) + 80);

  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 2 || EnumCaseMultiPayload == 1)
  {
    type metadata accessor for ActiveReporterState(0);
    v3 = swift_getEnumCaseMultiPayload();
    swift_release();
    if (v3 != 1)
    {
      v4 = v0 + ((v1 + 40) & ~v1) + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_253F3D888) + 48);
      v5 = sub_21DBD22F0();
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
    }
  }
  else if (!EnumCaseMultiPayload)
  {
    swift_release();
  }
  return swift_deallocObject();
}

uint64_t sub_21DBCBA2C(uint64_t a1)
{
  return sub_21DBCBA38(a1, (uint64_t (*)(uint64_t, _QWORD, _QWORD, _QWORD, uint64_t))sub_21DBC7EBC);
}

uint64_t sub_21DBCBA38(uint64_t a1, uint64_t (*a2)(uint64_t, _QWORD, _QWORD, _QWORD, uint64_t))
{
  uint64_t v2;
  uint64_t v4;

  v4 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for ReporterState(0) - 8) + 80);
  return a2(a1, *(unsigned __int16 *)(v2 + 16), *(_QWORD *)(v2 + 24), *(_QWORD *)(v2 + 32), v2 + ((v4 + 40) & ~v4));
}

uint64_t sub_21DBCBA8C()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

void sub_21DBCBAB0()
{
  uint64_t v0;

  sub_21DBB6174(*(_QWORD *)(v0 + 16));
}

uint64_t block_copy_helper_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_2()
{
  return swift_release();
}

void sub_21DBCBAD0(void *a1)
{
  sub_21DBC5BD8(a1);
}

uint64_t sub_21DBCBAD8()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

uint64_t sub_21DBCBAFC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t result;

  result = sub_21DBC71AC(*(unsigned int *)(v1 + 24));
  *a1 = result;
  return result;
}

uint64_t sub_21DBCBB48@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_21DBC71AC(0x100000000);
  *a1 = result;
  return result;
}

uint64_t sub_21DBCBB90()
{
  swift_release();
  return swift_deallocObject();
}

void sub_21DBCBBB4(void *a1, uint64_t a2)
{
  uint64_t v2;

  sub_21DBC5058(a1, a2, *(_QWORD *)(v2 + 16), *(_DWORD *)(v2 + 24), *(_WORD *)(v2 + 28), *(void (**)(void *))(v2 + 32));
}

uint64_t sub_21DBCBBC8()
{
  uint64_t v0;

  swift_release();
  return swift_deallocObject();
}

uint64_t sub_21DBCBBF4()
{
  return swift_deallocObject();
}

uint64_t sub_21DBCBC04()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_21DBCBC28()
{
  uint64_t v0;

  return sub_21DBC84E8(*(_QWORD *)(v0 + 24));
}

uint64_t sub_21DBCBC4C()
{
  return swift_deallocObject();
}

uint64_t sub_21DBCBC5C()
{
  return objectdestroy_27Tm();
}

void sub_21DBCBC64()
{
  uint64_t v0;

  sub_21DBC67C4(0, 1, *(_QWORD *)(v0 + 24), *(_DWORD *)(v0 + 32), *(unsigned __int16 *)(v0 + 36), 1);
}

uint64_t sub_21DBCBC9C()
{
  return swift_deallocObject();
}

uint64_t sub_21DBCBCAC()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

void sub_21DBCBCD8()
{
  uint64_t v0;

  sub_21DBC67C4(*(_QWORD *)(v0 + 24), 0, *(_QWORD *)(v0 + 32), *(_DWORD *)(v0 + 40), *(unsigned __int16 *)(v0 + 44), 1);
}

uint64_t sub_21DBCBD10()
{
  return swift_deallocObject();
}

uint64_t sub_21DBCBD20()
{
  return objectdestroy_27Tm();
}

uint64_t sub_21DBCBD28()
{
  uint64_t v0;

  return sub_21DBC7FF0(*(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32));
}

uint64_t sub_21DBCBD50()
{
  return swift_deallocObject();
}

uint64_t sub_21DBCBD60()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_21DBCBD84()
{
  uint64_t v0;

  return sub_21DBC74A0(*(unsigned __int16 *)(v0 + 24), *(_QWORD *)(v0 + 32));
}

uint64_t sub_21DBCBDB0()
{
  return swift_deallocObject();
}

uint64_t sub_21DBCBDC0()
{
  uint64_t v0;

  return sub_21DBC6170(*(_QWORD *)(v0 + 24));
}

uint64_t sub_21DBCBDE4()
{
  return swift_deallocObject();
}

uint64_t sub_21DBCBDF4()
{
  uint64_t v0;

  return sub_21DBC5DC0(*(_QWORD *)(v0 + 24));
}

uint64_t sub_21DBCBE18()
{
  return swift_deallocObject();
}

unint64_t sub_21DBCBE28()
{
  unint64_t result;
  uint64_t v1;

  result = qword_253F3DA58;
  if (!qword_253F3DA58)
  {
    v1 = sub_21DBD2464();
    result = MEMORY[0x22079B718](MEMORY[0x24BEE5698], v1);
    atomic_store(result, (unint64_t *)&qword_253F3DA58);
  }
  return result;
}

unint64_t sub_21DBCBE70()
{
  unint64_t result;
  uint64_t v1;

  result = qword_253F3DA50;
  if (!qword_253F3DA50)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_253F3DA00);
    result = MEMORY[0x22079B718](MEMORY[0x24BEE12C8], v1);
    atomic_store(result, (unint64_t *)&qword_253F3DA50);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x22079B70C](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_21DBCBF00()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

uint64_t sub_21DBCBF24()
{
  uint64_t v0;

  return sub_21DBC2684(v0);
}

uint64_t sub_21DBCBF2C()
{
  uint64_t v0;

  return sub_21DBC31F8(v0);
}

void sub_21DBCBF34(int a1)
{
  uint64_t v1;

  sub_21DBC3328(a1, v1);
}

uint64_t sub_21DBCBF3C()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_21DBCBF60()
{
  uint64_t v0;

  return sub_21DBC27DC(*(char **)(v0 + 16));
}

uint64_t sub_21DBCBF68()
{
  return swift_deallocObject();
}

uint64_t sub_21DBCBF78(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  _QWORD *v10;
  int64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  unint64_t v20;
  unint64_t i;
  int64_t v22;
  unint64_t v23;
  int64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  BOOL v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  int64_t v33;
  _QWORD *v34;
  uint64_t v35;
  char *v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  int64_t v41;

  v40 = a2;
  v3 = type metadata accessor for ReporterState(0);
  v38 = *(_QWORD *)(v3 - 8);
  v5 = MEMORY[0x24BDAC7A8](v3, v4);
  v37 = (char *)&v31 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5, v7);
  v36 = (char *)&v31 - v8;
  __swift_instantiateConcreteTypeFromMangledName(&qword_253F3D8D8);
  result = sub_21DBD2548();
  v10 = (_QWORD *)result;
  v11 = 0;
  v39 = a1;
  v14 = *(_QWORD *)(a1 + 64);
  v13 = a1 + 64;
  v12 = v14;
  v15 = 1 << *(_BYTE *)(v13 - 32);
  v16 = -1;
  if (v15 < 64)
    v16 = ~(-1 << v15);
  v17 = v16 & v12;
  v32 = v13;
  v33 = (unint64_t)(v15 + 63) >> 6;
  v34 = (_QWORD *)result;
  v35 = result + 64;
  v18 = (uint64_t)v36;
  v19 = v37;
  if ((v16 & v12) == 0)
    goto LABEL_5;
LABEL_4:
  v20 = __clz(__rbit64(v17));
  v17 &= v17 - 1;
  v41 = v11;
  for (i = v20 | (v11 << 6); ; i = __clz(__rbit64(v23)) + (v24 << 6))
  {
    v26 = *(_QWORD *)(*(_QWORD *)(v39 + 48) + 8 * i);
    v27 = *(_QWORD *)(v38 + 72) * i;
    sub_21DBC1644(*(_QWORD *)(v39 + 56) + v27, v18, type metadata accessor for ReporterState);
    sub_21DBC0C00(v18, v19);
    sub_21DBBA1BC(v18, type metadata accessor for ReporterState);
    v10 = v34;
    *(_QWORD *)(v35 + ((i >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << i;
    *(_QWORD *)(v10[6] + 8 * i) = v26;
    result = sub_21DBC192C((uint64_t)v19, v10[7] + v27, type metadata accessor for ReporterState);
    v28 = v10[2];
    v29 = __OFADD__(v28, 1);
    v30 = v28 + 1;
    if (v29)
    {
      __break(1u);
LABEL_24:
      __break(1u);
      goto LABEL_25;
    }
    v10[2] = v30;
    v11 = v41;
    if (v17)
      goto LABEL_4;
LABEL_5:
    v22 = v11 + 1;
    if (__OFADD__(v11, 1))
      goto LABEL_24;
    if (v22 >= v33)
      return (uint64_t)v10;
    v23 = *(_QWORD *)(v32 + 8 * v22);
    v24 = v11 + 1;
    if (!v23)
    {
      v24 = v11 + 2;
      if (v11 + 2 >= v33)
        return (uint64_t)v10;
      v23 = *(_QWORD *)(v32 + 8 * v24);
      if (!v23)
      {
        v24 = v11 + 3;
        if (v11 + 3 >= v33)
          return (uint64_t)v10;
        v23 = *(_QWORD *)(v32 + 8 * v24);
        if (!v23)
          break;
      }
    }
LABEL_18:
    v17 = (v23 - 1) & v23;
    v41 = v24;
  }
  v25 = v11 + 4;
  if (v11 + 4 >= v33)
    return (uint64_t)v10;
  v23 = *(_QWORD *)(v32 + 8 * v25);
  if (v23)
  {
    v24 = v11 + 4;
    goto LABEL_18;
  }
  while (1)
  {
    v24 = v25 + 1;
    if (__OFADD__(v25, 1))
      break;
    if (v24 >= v33)
      return (uint64_t)v10;
    v23 = *(_QWORD *)(v32 + 8 * v24);
    ++v25;
    if (v23)
      goto LABEL_18;
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t sub_21DBCC218(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

unint64_t sub_21DBCC2E0(uint64_t a1)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_253F3D8E0);
  v2 = sub_21DBD2560();
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
    sub_21DBD2274(v6, (uint64_t)&v15, &qword_253F3D8C8);
    v7 = v15;
    v8 = v16;
    result = sub_21DBCF33C(v15, v16);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v11 = (uint64_t *)(v3[6] + 16 * result);
    *v11 = v7;
    v11[1] = v8;
    result = (unint64_t)sub_21DBB3F4C(&v17, (_OWORD *)(v3[7] + 32 * result));
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

unint64_t sub_21DBCC414(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t result;
  char v9;
  uint64_t *v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_253F3D880);
  v2 = (_QWORD *)sub_21DBD2560();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (uint64_t *)(a1 + 48);
  while (1)
  {
    v5 = *(v4 - 2);
    v6 = *(v4 - 1);
    v7 = *v4;
    swift_bridgeObjectRetain();
    result = sub_21DBCF33C(v5, v6);
    if ((v9 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v10 = (uint64_t *)(v2[6] + 16 * result);
    *v10 = v5;
    v10[1] = v6;
    *(_QWORD *)(v2[7] + 8 * result) = v7;
    v11 = v2[2];
    v12 = __OFADD__(v11, 1);
    v13 = v11 + 1;
    if (v12)
      goto LABEL_11;
    v2[2] = v13;
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

unint64_t sub_21DBCC524(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t result;
  char v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  _OWORD v15[2];
  uint64_t v16;
  __int128 v17;

  if (!*(_QWORD *)(a1 + 16))
  {
    v3 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2553A4308);
  v2 = sub_21DBD2560();
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
    sub_21DBD2274(v6, (uint64_t)v15, &qword_2553A43A8);
    result = sub_21DBCF474((uint64_t)v15);
    if ((v8 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v9 = v3[6] + 40 * result;
    v10 = v15[0];
    v11 = v15[1];
    *(_QWORD *)(v9 + 32) = v16;
    *(_OWORD *)v9 = v10;
    *(_OWORD *)(v9 + 16) = v11;
    result = (unint64_t)sub_21DBB3F4C(&v17, (_OWORD *)(v3[7] + 32 * result));
    v12 = v3[2];
    v13 = __OFADD__(v12, 1);
    v14 = v12 + 1;
    if (v13)
      goto LABEL_11;
    v3[2] = v14;
    v6 += 72;
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

void sub_21DBCC664(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t *v15;
  uint64_t v16;
  unint64_t v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  NSObject *v24;
  os_log_type_t v25;
  _BOOL4 v26;
  uint8_t *v27;
  NSObject *v28;
  os_log_type_t v29;
  uint8_t *v30;
  uint8_t *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2553A4378);
  v5 = MEMORY[0x24BDAC7A8](v3, v4);
  v7 = (char *)&v32 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = MEMORY[0x24BDAC7A8](v5, v8);
  v11 = (char *)&v32 - v10;
  MEMORY[0x24BDAC7A8](v9, v12);
  v14 = (char *)&v32 - v13;
  v15 = (uint64_t *)(v1 + OBJC_IVAR____TtC14AudioAnalytics26SessionGenericSummaryCache_activeReporters);
  swift_beginAccess();
  v16 = *v15;
  if (*(_QWORD *)(*v15 + 16) && (v17 = sub_21DBCF30C(a1), (v18 & 1) != 0))
  {
    v19 = *(_QWORD *)(*(_QWORD *)(v16 + 56) + 8 * v17);
    v20 = v19 + OBJC_IVAR____TtC14AudioAnalytics12ReporterInfo_startTime;
    swift_beginAccess();
    sub_21DBD2274(v20, (uint64_t)v14, &qword_2553A4378);
    v21 = sub_21DBD22F0();
    v22 = *(_QWORD *)(v21 - 8);
    v23 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v22 + 48))(v14, 1, v21);
    v32 = v19;
    swift_retain();
    sub_21DBCF668((uint64_t)v14);
    v24 = sub_21DBD2308();
    v25 = sub_21DBD2434();
    v26 = os_log_type_enabled(v24, v25);
    if (v23 == 1)
    {
      if (v26)
      {
        v27 = (uint8_t *)swift_slowAlloc();
        *(_DWORD *)v27 = 134283521;
        v33 = a1;
        sub_21DBD24AC();
        _os_log_impl(&dword_21DBAF000, v24, v25, "Setting startTime. { function=start, reporterID=%{private}lld }", v27, 0xCu);
        MEMORY[0x22079B7C0](v27, -1, -1);
      }

      sub_21DBD22E4();
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v22 + 56))(v11, 0, 1, v21);
      sub_21DBD2070((uint64_t)v11, (uint64_t)v7);
      swift_beginAccess();
      sub_21DBCF620((uint64_t)v7, v20);
      swift_endAccess();
      swift_release();
    }
    else
    {
      if (v26)
      {
        v31 = (uint8_t *)swift_slowAlloc();
        *(_DWORD *)v31 = 134283521;
        v33 = a1;
        sub_21DBD24AC();
        _os_log_impl(&dword_21DBAF000, v24, v25, "start called without a stop. Ignoring. { function=start, reporterID=%{private}lld }", v31, 0xCu);
        MEMORY[0x22079B7C0](v31, -1, -1);
      }
      swift_release();

    }
  }
  else
  {
    v28 = sub_21DBD2308();
    v29 = sub_21DBD244C();
    if (os_log_type_enabled(v28, v29))
    {
      v30 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)v30 = 134283521;
      v34 = a1;
      sub_21DBD24AC();
      _os_log_impl(&dword_21DBAF000, v28, v29, "start called for unknown reporterID. { function=start, reporterID=%{private}lld }", v30, 0xCu);
      MEMORY[0x22079B7C0](v30, -1, -1);
    }

  }
}

void sub_21DBCC9F8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t *v21;
  uint64_t v22;
  unint64_t v23;
  char v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  os_log_type_t v28;
  uint8_t *v29;
  uint64_t v30;
  uint64_t v31;
  int v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  char v38;
  uint64_t v39;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v41;
  double v42;
  double v43;
  char *v44;
  void (*v45)(char *, uint64_t);
  double v46;
  int v47;
  int v48;
  BOOL v49;
  int v50;
  int v51;
  int v52;
  int v53;
  NSObject *v54;
  os_log_type_t v55;
  uint8_t *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  int v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;

  v2 = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2553A4378);
  v6 = MEMORY[0x24BDAC7A8](v4, v5);
  v8 = (char *)&v57 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6, v9);
  v11 = (char *)&v57 - v10;
  v12 = sub_21DBD22F0();
  v13 = *(_QWORD *)(v12 - 8);
  v15 = MEMORY[0x24BDAC7A8](v12, v14);
  v17 = (char *)&v57 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v15, v18);
  v20 = (char *)&v57 - v19;
  v21 = (uint64_t *)(v1 + OBJC_IVAR____TtC14AudioAnalytics26SessionGenericSummaryCache_activeReporters);
  swift_beginAccess();
  v22 = *v21;
  if (!*(_QWORD *)(v22 + 16) || (v23 = sub_21DBCF30C(a1), (v24 & 1) == 0))
  {
    v27 = sub_21DBD2308();
    v28 = sub_21DBD244C();
    if (os_log_type_enabled(v27, v28))
    {
      v29 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v29 = 0;
      _os_log_impl(&dword_21DBAF000, v27, v28, "activeReporters should contain reporter already. { function=stop }", v29, 2u);
      MEMORY[0x22079B7C0](v29, -1, -1);
    }

    return;
  }
  v25 = *(_QWORD *)(*(_QWORD *)(v22 + 56) + 8 * v23);
  v26 = v25 + OBJC_IVAR____TtC14AudioAnalytics12ReporterInfo_startTime;
  swift_beginAccess();
  sub_21DBD2274(v26, (uint64_t)v11, &qword_2553A4378);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12) == 1)
  {
    swift_retain();
    sub_21DBCF668((uint64_t)v11);
LABEL_20:
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56))(v8, 1, 1, v12);
    swift_beginAccess();
    sub_21DBCF620((uint64_t)v8, v26);
    swift_endAccess();
    swift_release();
    return;
  }
  (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v20, v11, v12);
  v30 = swift_retain();
  v62 = sub_21DBD1B50(v30);
  v61 = v32;
  if (!v31)
  {
    (*(void (**)(char *, uint64_t))(v13 + 8))(v20, v12);
    goto LABEL_20;
  }
  v33 = v31;
  v59 = v26;
  v60 = v25;
  v34 = (uint64_t *)(v2 + OBJC_IVAR____TtC14AudioAnalytics26SessionGenericSummaryCache_messageCache);
  swift_beginAccess();
  v35 = *v34;
  v36 = *(_QWORD *)(*v34 + 16);
  v58 = a1;
  if (!v36)
    goto LABEL_14;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v37 = sub_21DBCF3E4(v62, v33, v61);
  if ((v38 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
LABEL_14:
    type metadata accessor for MessageCounts();
    v39 = swift_allocObject();
    *(_QWORD *)(v39 + 16) = 0;
    *(_QWORD *)(v39 + 24) = 0;
    swift_beginAccess();
    swift_bridgeObjectRetain();
    swift_retain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v63 = *v34;
    *v34 = 0x8000000000000000;
    sub_21DBD0AE4(v39, v62, v33, v61, isUniquelyReferenced_nonNull_native);
    *v34 = v63;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_endAccess();
    goto LABEL_15;
  }
  v39 = *(_QWORD *)(*(_QWORD *)(v35 + 56) + 8 * v37);
  swift_retain();
  swift_bridgeObjectRelease_n();
LABEL_15:
  swift_bridgeObjectRelease();
  v41 = *(_QWORD *)(v60 + OBJC_IVAR____TtC14AudioAnalytics12ReporterInfo_messageCounts);
  swift_retain();
  sub_21DBD22E4();
  sub_21DBD22CC();
  v43 = v42;
  v44 = v17;
  v45 = *(void (**)(char *, uint64_t))(v13 + 8);
  v45(v44, v12);
  sub_21DBD22CC();
  v47 = *(_DWORD *)(v41 + 16);
  v48 = *(_DWORD *)(v39 + 16);
  v49 = __CFADD__(v48, v47);
  v50 = v48 + v47;
  if (v49)
  {
    __break(1u);
  }
  else
  {
    *(_DWORD *)(v39 + 16) = v50;
    v51 = *(_DWORD *)(v41 + 20);
    v52 = *(_DWORD *)(v39 + 20);
    v49 = __CFADD__(v52, v51);
    v53 = v52 + v51;
    if (!v49)
    {
      *(_DWORD *)(v39 + 20) = v53;
      *(double *)(v39 + 24) = v43 - v46 + *(double *)(v39 + 24);
      swift_release();
      v54 = sub_21DBD2308();
      v55 = sub_21DBD2434();
      if (os_log_type_enabled(v54, v55))
      {
        v56 = (uint8_t *)swift_slowAlloc();
        *(_DWORD *)v56 = 134217984;
        v64 = v58;
        sub_21DBD24AC();
        _os_log_impl(&dword_21DBAF000, v54, v55, "Incremented times. { function=stop, reporterID=%lld }", v56, 0xCu);
        MEMORY[0x22079B7C0](v56, -1, -1);
      }

      swift_release();
      v45(v20, v12);
      v26 = v59;
      goto LABEL_20;
    }
  }
  __break(1u);
}

void sub_21DBCCF14(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t *v5;
  uint64_t v6;
  unint64_t v7;
  char v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  NSObject *v17;
  os_log_type_t v18;
  uint8_t *v19;
  uint64_t v20;
  uint64_t v21[3];

  v5 = (uint64_t *)(v2 + OBJC_IVAR____TtC14AudioAnalytics26SessionGenericSummaryCache_activeReporters);
  swift_beginAccess();
  v6 = *v5;
  if (*(_QWORD *)(v6 + 16) && (v7 = sub_21DBCF30C(a2), (v8 & 1) != 0))
  {
    v9 = *(_QWORD *)(*(_QWORD *)(v6 + 56) + 8 * v7);
    swift_bridgeObjectRetain_n();
    swift_retain();
    v10 = sub_21DBD2308();
    v11 = sub_21DBD2434();
    if (os_log_type_enabled(v10, v11))
    {
      v12 = (uint8_t *)swift_slowAlloc();
      v13 = swift_slowAlloc();
      v21[0] = v13;
      *(_DWORD *)v12 = 136315138;
      swift_bridgeObjectRetain();
      v14 = sub_21DBD23B0();
      v16 = v15;
      swift_bridgeObjectRelease();
      sub_21DBCECA4(v14, v16, v21);
      sub_21DBD24AC();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_21DBAF000, v10, v11, "Setting configuration. { config=%s }", v12, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x22079B7C0](v13, -1, -1);
      MEMORY[0x22079B7C0](v12, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }

    v20 = *(_QWORD *)(v9 + OBJC_IVAR____TtC14AudioAnalytics12ReporterInfo_data);
    swift_retain();
    swift_release();
    swift_beginAccess();
    *(_QWORD *)(v20 + 32) = a1;
    swift_bridgeObjectRetain();
    swift_release();
    swift_bridgeObjectRelease();
  }
  else
  {
    v17 = sub_21DBD2308();
    v18 = sub_21DBD244C();
    if (os_log_type_enabled(v17, v18))
    {
      v19 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v19 = 0;
      _os_log_impl(&dword_21DBAF000, v17, v18, "activeReporters should contain reporter already. { function=setConfiguration }", v19, 2u);
      MEMORY[0x22079B7C0](v19, -1, -1);
    }

  }
}

void sub_21DBCD1D0(uint64_t a1, uint64_t a2, int a3, __int16 a4)
{
  uint64_t v4;
  int v5;
  BOOL v6;
  int v7;
  os_log_type_t v10;
  uint8_t *v11;
  NSObject *oslog;

  v5 = *(_DWORD *)(v4 + OBJC_IVAR____TtC14AudioAnalytics26SessionGenericSummaryCache_messagesReceived);
  v6 = __CFADD__(v5, 1);
  v7 = v5 + 1;
  if (v6)
  {
    __break(1u);
  }
  else
  {
    *(_DWORD *)(v4 + OBJC_IVAR____TtC14AudioAnalytics26SessionGenericSummaryCache_messagesReceived) = v7;
    if ((sub_21DBD1F64(a1, a3, a4) & 1) != 0)
    {
      if (sub_21DBCD338(a2, v4))
      {
        swift_retain();
        sub_21DBCE648(a1);
        swift_release();
        swift_release();
      }
      else
      {
        oslog = sub_21DBD2308();
        v10 = sub_21DBD2434();
        if (os_log_type_enabled(oslog, v10))
        {
          v11 = (uint8_t *)swift_slowAlloc();
          *(_DWORD *)v11 = 134217984;
          sub_21DBD24AC();
          _os_log_impl(&dword_21DBAF000, oslog, v10, "Received message on non-active session. { function=send, reporterID=%lld }", v11, 0xCu);
          MEMORY[0x22079B7C0](v11, -1, -1);

        }
        else
        {

        }
      }
    }
  }
}

uint64_t sub_21DBCD338(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  unint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _BYTE v17[24];

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2553A4378);
  MEMORY[0x24BDAC7A8](v4, v5);
  v7 = &v17[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  if (qword_253F3DA10 != -1)
    swift_once();
  if (qword_253F3DC38 == a1)
  {
    v8 = *(_QWORD *)(a2 + OBJC_IVAR____TtC14AudioAnalytics26SessionGenericSummaryCache_singleMessageSessionReportInfo);
    swift_retain();
  }
  else
  {
    v9 = (uint64_t *)(a2 + OBJC_IVAR____TtC14AudioAnalytics26SessionGenericSummaryCache_activeReporters);
    swift_beginAccess();
    v10 = *v9;
    if (*(_QWORD *)(v10 + 16)
      && (v11 = sub_21DBCF30C(a1), (v12 & 1) != 0)
      && (v8 = *(_QWORD *)(*(_QWORD *)(v10 + 56) + 8 * v11), swift_retain(), v8))
    {
      v13 = v8 + OBJC_IVAR____TtC14AudioAnalytics12ReporterInfo_startTime;
      swift_beginAccess();
      sub_21DBD2274(v13, (uint64_t)v7, &qword_2553A4378);
      v14 = sub_21DBD22F0();
      if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 48))(v7, 1, v14) != 1)
      {
        sub_21DBCF668((uint64_t)v7);
        return v8;
      }
      swift_release();
    }
    else
    {
      v15 = sub_21DBD22F0();
      (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56))(v7, 1, 1, v15);
    }
    sub_21DBCF668((uint64_t)v7);
    return 0;
  }
  return v8;
}

uint64_t sub_21DBCD4E4()
{
  uint64_t v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned __int16 v7;
  _QWORD *v8;
  uint64_t v9;

  v1 = v0;
  swift_retain_n();
  v2 = sub_21DBD2308();
  v3 = sub_21DBD2434();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = swift_slowAlloc();
    *(_DWORD *)v4 = 134218240;
    swift_beginAccess();
    sub_21DBD24AC();
    *(_WORD *)(v4 + 12) = 2048;
    swift_beginAccess();
    swift_release();
    sub_21DBD24AC();
    swift_release();
    _os_log_impl(&dword_21DBAF000, v2, v3, "SessionGenericSummaryCache.process called. { messageCache=%ld, active=%ld }", (uint8_t *)v4, 0x16u);
    MEMORY[0x22079B7C0](v4, -1, -1);
  }
  else
  {
    swift_release_n();
  }

  v5 = *(_QWORD *)(v1 + OBJC_IVAR____TtC14AudioAnalytics26SessionGenericSummaryCache_singleMessageSessionReportInfo);
  v6 = *(_QWORD *)(v5 + OBJC_IVAR____TtC14AudioAnalytics12ReporterInfo_messageCounts);
  if (*(_DWORD *)(v6 + 16))
  {
    v7 = *(_WORD *)(*(_QWORD *)(v5 + OBJC_IVAR____TtC14AudioAnalytics12ReporterInfo_data) + 24);
    swift_retain();
    sub_21DBCD734(0x654D656C676E6973, 0xED00006567617373, v7, v6);
    swift_release();
  }
  sub_21DBCE444();
  v8 = (_QWORD *)(v1 + OBJC_IVAR____TtC14AudioAnalytics26SessionGenericSummaryCache_messageCache);
  swift_beginAccess();
  v9 = swift_bridgeObjectRetain();
  sub_21DBD1DA4(v9, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_21DBCF72C);
  swift_bridgeObjectRelease();
  *v8 = MEMORY[0x24BEE4B00];
  return swift_bridgeObjectRelease();
}

uint64_t sub_21DBCD734(uint64_t a1, unint64_t a2, unsigned __int16 a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t inited;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  void *v34;
  _BYTE *v35;
  _BYTE *v36;
  uint64_t result;
  int v38;
  BOOL v39;
  int v40;
  _BYTE v41[12];
  int v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  _BYTE *v46;
  uint64_t v47;
  uint64_t v48;
  _BYTE *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52[47];

  v5 = v4;
  v10 = sub_21DBD2344();
  v50 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10, v11);
  v49 = &v41[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v13 = sub_21DBD2368();
  v47 = *(_QWORD *)(v13 - 8);
  v48 = v13;
  MEMORY[0x24BDAC7A8](v13, v14);
  v46 = &v41[-((v15 + 15) & 0xFFFFFFFFFFFFFFF0)];
  swift_bridgeObjectRetain_n();
  v16 = sub_21DBD2308();
  v17 = sub_21DBD2434();
  v18 = v17;
  if (os_log_type_enabled(v16, v17))
  {
    v19 = swift_slowAlloc();
    v45 = v10;
    v20 = v19;
    v43 = swift_slowAlloc();
    v52[0] = v43;
    *(_DWORD *)v20 = 136380931;
    v42 = v18;
    swift_bridgeObjectRetain();
    v51 = sub_21DBCECA4(a1, a2, v52);
    v44 = a1;
    sub_21DBD24AC();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v20 + 12) = 2081;
    v21 = AudioServiceType.description.getter(a3);
    v51 = sub_21DBCECA4(v21, v22, v52);
    a1 = v44;
    sub_21DBD24AC();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21DBAF000, v16, (os_log_type_t)v42, "Sending cached message. { appName=%{private}s, serviceType=%{private}s }", (uint8_t *)v20, 0x16u);
    v23 = v43;
    swift_arrayDestroy();
    MEMORY[0x22079B7C0](v23, -1, -1);
    v24 = v20;
    v10 = v45;
    MEMORY[0x22079B7C0](v24, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  __swift_instantiateConcreteTypeFromMangledName(&qword_253F3D8D0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_21DBD3660;
  v26 = MEMORY[0x24BEE1328];
  *(_QWORD *)(inited + 32) = 0x65646F4D656D6167;
  *(_QWORD *)(inited + 40) = 0xE800000000000000;
  *(_BYTE *)(inited + 48) = 1;
  *(_QWORD *)(inited + 72) = v26;
  *(_QWORD *)(inited + 80) = 0xD000000000000011;
  *(_QWORD *)(inited + 88) = 0x800000021DBD5930;
  v27 = MEMORY[0x24BEE13C8];
  *(_QWORD *)(inited + 96) = *(_QWORD *)(a4 + 24);
  *(_QWORD *)(inited + 120) = v27;
  strcpy((char *)(inited + 128), "overload_count");
  *(_BYTE *)(inited + 143) = -18;
  v28 = MEMORY[0x24BEE44F0];
  *(_DWORD *)(inited + 144) = *(_DWORD *)(a4 + 16);
  *(_QWORD *)(inited + 168) = v28;
  *(_QWORD *)(inited + 176) = 0xD000000000000016;
  *(_QWORD *)(inited + 184) = 0x800000021DBD5950;
  *(_DWORD *)(inited + 192) = *(_DWORD *)(a4 + 20);
  *(_QWORD *)(inited + 216) = v28;
  *(_QWORD *)(inited + 224) = 0xD000000000000018;
  v29 = MEMORY[0x24BEE0D00];
  *(_QWORD *)(inited + 232) = 0x800000021DBD4F10;
  *(_QWORD *)(inited + 240) = a1;
  *(_QWORD *)(inited + 248) = a2;
  *(_QWORD *)(inited + 264) = v29;
  *(_QWORD *)(inited + 272) = 0xD000000000000012;
  *(_QWORD *)(inited + 280) = 0x800000021DBD5970;
  v30 = AudioServiceType.description.getter(a3);
  *(_QWORD *)(inited + 312) = v29;
  *(_QWORD *)(inited + 288) = v30;
  *(_QWORD *)(inited + 296) = v31;
  swift_bridgeObjectRetain();
  v32 = sub_21DBCC2E0(inited);
  v33 = swift_allocObject();
  *(_QWORD *)(v33 + 16) = v32;
  *(_DWORD *)(v33 + 24) = 134217729;
  v52[4] = (uint64_t)sub_21DBCF6CC;
  v52[5] = v33;
  v52[0] = MEMORY[0x24BDAC760];
  v52[1] = 1107296256;
  v52[2] = (uint64_t)sub_21DBC31CC;
  v52[3] = (uint64_t)&block_descriptor_3;
  v34 = _Block_copy(v52);
  v35 = v46;
  sub_21DBD2350();
  v51 = MEMORY[0x24BEE4AF8];
  sub_21DBD20F4(&qword_2553A4380, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2553A4388);
  sub_21DBD2134(&qword_2553A4390, &qword_2553A4388);
  v36 = v49;
  sub_21DBD24DC();
  MEMORY[0x22079B178](0, v35, v36, v34);
  _Block_release(v34);
  (*(void (**)(_BYTE *, uint64_t))(v50 + 8))(v36, v10);
  (*(void (**)(_BYTE *, uint64_t))(v47 + 8))(v35, v48);
  result = swift_release();
  v38 = *(_DWORD *)(v5 + OBJC_IVAR____TtC14AudioAnalytics26SessionGenericSummaryCache_messagesSent);
  v39 = __CFADD__(v38, 1);
  v40 = v38 + 1;
  if (v39)
    __break(1u);
  else
    *(_DWORD *)(v5 + OBJC_IVAR____TtC14AudioAnalytics26SessionGenericSummaryCache_messagesSent) = v40;
  return result;
}

uint64_t sub_21DBCDC30(uint64_t a1, int a2)
{
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  char isEscapingClosureAtFileLocation;
  uint64_t result;
  _QWORD v12[6];

  if (qword_253F3D9E0 != -1)
    swift_once();
  v4 = (void *)qword_253F3DC50;
  v5 = *(NSObject **)(qword_253F3DC50 + OBJC_IVAR____TtC14AudioAnalytics12ServerClient_serialQueue);
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = v4;
  *(_QWORD *)(v6 + 24) = a1;
  *(_DWORD *)(v6 + 32) = a2;
  *(_WORD *)(v6 + 36) = 11;
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = sub_21DBB3E90;
  *(_QWORD *)(v7 + 24) = v6;
  v12[4] = sub_21DBB66FC;
  v12[5] = v7;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 1107296256;
  v12[2] = sub_21DBB3BEC;
  v12[3] = &block_descriptor_9;
  v8 = _Block_copy(v12);
  v9 = v4;
  swift_bridgeObjectRetain();
  swift_retain();
  swift_release();
  dispatch_sync(v5, v8);
  _Block_release(v8);
  isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();

  swift_release();
  result = swift_release();
  if ((isEscapingClosureAtFileLocation & 1) != 0)
    __break(1u);
  return result;
}

uint64_t sub_21DBCDDB8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + OBJC_IVAR____TtC14AudioAnalytics26SessionGenericSummaryCache_logger;
  v2 = sub_21DBD2320();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t sub_21DBCDE40()
{
  return type metadata accessor for SessionGenericSummaryCache(0);
}

uint64_t type metadata accessor for SessionGenericSummaryCache(uint64_t a1)
{
  return sub_21DBCA068(a1, (uint64_t *)&unk_2553A3EA8);
}

uint64_t sub_21DBCDE5C()
{
  uint64_t result;
  unint64_t v1;

  result = sub_21DBD2320();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t sub_21DBCDF04()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(uint64_t);
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v14[2];

  v1 = v0;
  sub_21DBD2464();
  v2 = (uint64_t (*)(uint64_t))MEMORY[0x24BEE5688];
  MEMORY[0x24BDAC7A8]();
  v3 = sub_21DBD2470();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8]();
  v6 = (char *)v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21DBD2368();
  MEMORY[0x24BDAC7A8]();
  sub_21DBD20B8();
  sub_21DBD235C();
  (*(void (**)(char *, _QWORD, uint64_t))(v4 + 104))(v6, *MEMORY[0x24BEE5758], v3);
  v14[1] = MEMORY[0x24BEE4AF8];
  sub_21DBD20F4((unint64_t *)&qword_253F3DA58, v2, MEMORY[0x24BEE5698]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_253F3DA00);
  sub_21DBD2134((unint64_t *)&qword_253F3DA50, &qword_253F3DA00);
  sub_21DBD24DC();
  *(_QWORD *)(v0 + 16) = sub_21DBD2494();
  v7 = OBJC_IVAR____TtC14AudioAnalytics26SessionGenericSummaryCache_logger;
  if (qword_253F3DA18 != -1)
    swift_once();
  v8 = sub_21DBD2320();
  v9 = __swift_project_value_buffer(v8, (uint64_t)qword_253F3DC78);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(v1 + v7, v9, v8);
  v10 = MEMORY[0x24BEE4B00];
  *(_QWORD *)(v1 + OBJC_IVAR____TtC14AudioAnalytics26SessionGenericSummaryCache_activeReporters) = MEMORY[0x24BEE4B00];
  *(_QWORD *)(v1 + OBJC_IVAR____TtC14AudioAnalytics26SessionGenericSummaryCache_messageCache) = v10;
  *(_DWORD *)(v1 + OBJC_IVAR____TtC14AudioAnalytics26SessionGenericSummaryCache_messagesReceived) = 0;
  *(_DWORD *)(v1 + OBJC_IVAR____TtC14AudioAnalytics26SessionGenericSummaryCache_messagesSent) = 0;
  v11 = OBJC_IVAR____TtC14AudioAnalytics26SessionGenericSummaryCache_singleMessageSessionReportInfo;
  type metadata accessor for ReporterInfo(0);
  v12 = swift_allocObject();
  sub_21DBCE320(0, 5);
  *(_QWORD *)(v1 + v11) = v12;
  return v1;
}

uint64_t sub_21DBCE190()
{
  sub_21DBD25A8();
  swift_bridgeObjectRetain();
  sub_21DBD23C8();
  swift_bridgeObjectRelease();
  sub_21DBD25C0();
  return sub_21DBD25CC();
}

uint64_t sub_21DBCE200()
{
  swift_bridgeObjectRetain();
  sub_21DBD23C8();
  swift_bridgeObjectRelease();
  return sub_21DBD25C0();
}

uint64_t sub_21DBCE258()
{
  sub_21DBD25A8();
  swift_bridgeObjectRetain();
  sub_21DBD23C8();
  swift_bridgeObjectRelease();
  sub_21DBD25C0();
  return sub_21DBD25CC();
}

BOOL sub_21DBCE2C4(uint64_t a1, uint64_t a2)
{
  int v2;
  int v3;
  char v5;
  _BOOL8 result;

  v2 = *(unsigned __int16 *)(a1 + 16);
  v3 = *(unsigned __int16 *)(a2 + 16);
  if (*(_QWORD *)a1 == *(_QWORD *)a2 && *(_QWORD *)(a1 + 8) == *(_QWORD *)(a2 + 8))
    return v2 == v3;
  v5 = sub_21DBD2578();
  result = 0;
  if ((v5 & 1) != 0)
    return v2 == v3;
  return result;
}

uint64_t sub_21DBCE320(uint64_t a1, __int16 a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v3 = v2;
  v6 = v2 + OBJC_IVAR____TtC14AudioAnalytics12ReporterInfo_startTime;
  v7 = sub_21DBD22F0();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v6, 1, 1, v7);
  v8 = OBJC_IVAR____TtC14AudioAnalytics12ReporterInfo_messageCounts;
  type metadata accessor for MessageCounts();
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = 0;
  *(_QWORD *)(v9 + 24) = 0;
  *(_QWORD *)(v3 + v8) = v9;
  type metadata accessor for ReporterData();
  v10 = swift_allocObject();
  *(_WORD *)(v10 + 24) = -1;
  *(_QWORD *)(v10 + 32) = sub_21DBCC2E0(MEMORY[0x24BEE4AF8]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_253F3DA08);
  v11 = swift_allocObject();
  *(_OWORD *)(v11 + 16) = xmmword_21DBD32D0;
  *(_DWORD *)(v11 + 32) = getpid();
  type metadata accessor for PerfCheck();
  swift_allocObject();
  *(_QWORD *)(v10 + 40) = sub_21DBBA54C(v11);
  *(_QWORD *)(v10 + 16) = a1;
  *(_QWORD *)(v3 + OBJC_IVAR____TtC14AudioAnalytics12ReporterInfo_data) = v10;
  *(_WORD *)(v10 + 24) = a2;
  return v3;
}

uint64_t sub_21DBCE444()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;
  uint64_t v9;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2553A4378);
  MEMORY[0x24BDAC7A8](v1, v2);
  v4 = (char *)&v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_21DBD22F0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56))(v4, 1, 1, v5);
  v6 = v0 + OBJC_IVAR____TtC14AudioAnalytics12ReporterInfo_startTime;
  swift_beginAccess();
  sub_21DBCF620((uint64_t)v4, v6);
  result = swift_endAccess();
  v8 = *(_QWORD *)(v0 + OBJC_IVAR____TtC14AudioAnalytics12ReporterInfo_messageCounts);
  *(_QWORD *)(v8 + 16) = 0;
  *(_QWORD *)(v8 + 24) = 0;
  return result;
}

uint64_t sub_21DBCE50C()
{
  uint64_t v0;

  sub_21DBCF668(v0 + OBJC_IVAR____TtC14AudioAnalytics12ReporterInfo_startTime);
  swift_release();
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t sub_21DBCE55C()
{
  return type metadata accessor for ReporterInfo(0);
}

uint64_t type metadata accessor for ReporterInfo(uint64_t a1)
{
  return sub_21DBCA068(a1, (uint64_t *)&unk_2553A3E90);
}

void sub_21DBCE578()
{
  unint64_t v0;

  sub_21DBCE5F4();
  if (v0 <= 0x3F)
    swift_updateClassMetadata2();
}

void sub_21DBCE5F4()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_2553A3E88)
  {
    sub_21DBD22F0();
    v0 = sub_21DBD24A0();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_2553A3E88);
  }
}

uint64_t sub_21DBCE648(uint64_t result)
{
  uint64_t v1;
  int v2;
  BOOL v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  char v8;
  char v9;
  char v10;
  char v11;
  char v12;
  char v13;
  int v14;
  int v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;

  v2 = *(_DWORD *)(v1 + 16);
  v3 = __CFADD__(v2, 1);
  v4 = v2 + 1;
  if (v3)
  {
    __break(1u);
    goto LABEL_29;
  }
  v5 = v1;
  v6 = result;
  *(_DWORD *)(v1 + 16) = v4;
  if (*(_QWORD *)(result + 16))
  {
    result = sub_21DBCF33C(0x656C6379635F6F69, 0xE800000000000000);
    if ((v7 & 1) != 0)
    {
      sub_21DBB4014(*(_QWORD *)(v6 + 56) + 32 * result, (uint64_t)&v18);
      result = swift_dynamicCast();
      if ((result & 1) != 0 && v16 >= 3)
      {
        if (!*(_QWORD *)(v6 + 16))
          goto LABEL_32;
        result = sub_21DBCF33C(0xD000000000000015, 0x800000021DBD58F0);
        if ((v8 & 1) == 0)
          goto LABEL_32;
        sub_21DBB4014(*(_QWORD *)(v6 + 56) + 32 * result, (uint64_t)&v18);
        result = swift_dynamicCast();
        if ((result & 1) == 0)
          goto LABEL_32;
        v18 = v16;
        v19 = v17;
        sub_21DBCF3A0();
        if ((sub_21DBD24C4() & 1) != 0)
          return swift_bridgeObjectRelease();
        v18 = v16;
        v19 = v17;
        v16 = 5263169;
        v17 = 0xE300000000000000;
        v9 = sub_21DBD24C4();
        result = swift_bridgeObjectRelease();
        if ((v9 & 1) == 0)
        {
LABEL_32:
          if (!*(_QWORD *)(v6 + 16))
            goto LABEL_24;
          result = sub_21DBCF33C(0xD000000000000016, 0x800000021DBD5910);
          if ((v10 & 1) == 0)
            goto LABEL_24;
          sub_21DBB4014(*(_QWORD *)(v6 + 56) + 32 * result, (uint64_t)&v18);
          result = swift_dynamicCast();
          if ((result & 1) == 0)
            goto LABEL_24;
          v18 = v16;
          v19 = v17;
          sub_21DBCF3A0();
          if ((sub_21DBD24C4() & 1) != 0)
            return swift_bridgeObjectRelease();
          v18 = v16;
          v19 = v17;
          LOBYTE(v16) = 72;
          v11 = sub_21DBD24C4();
          result = swift_bridgeObjectRelease();
          if ((v11 & 1) == 0)
          {
LABEL_24:
            if (!*(_QWORD *)(v6 + 16)
              || (result = sub_21DBCF33C(0x61776572705F7369, 0xED0000676E696D72), (v12 & 1) == 0)
              || (sub_21DBB4014(*(_QWORD *)(v6 + 56) + 32 * result, (uint64_t)&v18),
                  result = swift_dynamicCast(),
                  (result & 1) == 0)
              || (v16 & 1) == 0)
            {
              if (!*(_QWORD *)(v6 + 16)
                || (result = sub_21DBCF33C(0x766F6365725F7369, 0xED0000676E697265), (v13 & 1) == 0)
                || (sub_21DBB4014(*(_QWORD *)(v6 + 56) + 32 * result, (uint64_t)&v18),
                    result = swift_dynamicCast(),
                    (result & 1) == 0)
                || (v16 & 1) == 0)
              {
                v14 = *(_DWORD *)(v5 + 20);
                v3 = __CFADD__(v14, 1);
                v15 = v14 + 1;
                if (!v3)
                {
                  *(_DWORD *)(v5 + 20) = v15;
                  return result;
                }
LABEL_29:
                __break(1u);
              }
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t sub_21DBCE9E8()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for MessageCounts()
{
  return objc_opt_self();
}

uint64_t destroy for MessageDimensions()
{
  return swift_bridgeObjectRelease();
}

uint64_t _s14AudioAnalytics17MessageDimensionsVwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_WORD *)(a1 + 16) = *(_WORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for MessageDimensions(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_WORD *)(a1 + 16) = *(_WORD *)(a2 + 16);
  return a1;
}

__n128 __swift_memcpy18_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u16[0] = a2[1].n128_u16[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for MessageDimensions(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_WORD *)(a1 + 16) = *(_WORD *)(a2 + 16);
  return a1;
}

uint64_t getEnumTagSinglePayload for MessageDimensions(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 18))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for MessageDimensions(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_WORD *)(result + 16) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    if (a3 < 0)
      *(_BYTE *)(result + 18) = 1;
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
    *(_BYTE *)(result + 18) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for MessageDimensions()
{
  return &type metadata for MessageDimensions;
}

unint64_t sub_21DBCEB98()
{
  unint64_t result;

  result = qword_2553A4368;
  if (!qword_2553A4368)
  {
    result = MEMORY[0x22079B718](&unk_21DBD36E4, &type metadata for MessageDimensions);
    atomic_store(result, (unint64_t *)&qword_2553A4368);
  }
  return result;
}

uint64_t sub_21DBCEBDC(uint64_t *a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t *__return_ptr))
{
  uint64_t v5;
  uint64_t result;
  uint64_t v7;

  a4(&v7);
  v5 = *a1 + 8;
  result = sub_21DBD24AC();
  *a1 = v5;
  return result;
}

uint64_t sub_21DBCEC34(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t result;

  v6 = a4();
  sub_21DBCECA4(v6, v7, a3);
  v8 = *a1 + 8;
  sub_21DBD24AC();
  result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t sub_21DBCECA4(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_21DBCED74(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_21DBB4014((uint64_t)v12, *a3);
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
      sub_21DBB4014((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_21DBCED74(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_21DBD24B8();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_21DBCEF2C(a5, a6);
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
  v8 = sub_21DBD2524();
  if (!v8)
  {
    sub_21DBD2530();
    __break(1u);
LABEL_17:
    result = sub_21DBD256C();
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

uint64_t sub_21DBCEF2C(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_21DBCEFC0(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_21DBCF198(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_21DBCF198(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_21DBCEFC0(uint64_t a1, unint64_t a2)
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
      v3 = sub_21DBCF134(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_21DBD250C();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_21DBD2530();
      __break(1u);
LABEL_10:
      v2 = sub_21DBD23EC();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_21DBD256C();
    __break(1u);
LABEL_14:
    result = sub_21DBD2530();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_21DBCF134(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_253F3D8F8);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_21DBCF198(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_253F3D8F8);
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
  result = sub_21DBD256C();
  __break(1u);
  return result;
}

uint64_t sub_21DBCF2E4@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = a1();
  *a2 = result;
  return result;
}

unint64_t sub_21DBCF30C(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_21DBD259C();
  return sub_21DBCF4A4(a1, v2);
}

unint64_t sub_21DBCF33C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_21DBD25A8();
  sub_21DBD23C8();
  v4 = sub_21DBD25CC();
  return sub_21DBCF540(a1, a2, v4);
}

unint64_t sub_21DBCF3A0()
{
  unint64_t result;

  result = qword_2553A4370;
  if (!qword_2553A4370)
  {
    result = MEMORY[0x22079B718](MEMORY[0x24BEE0D50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_2553A4370);
  }
  return result;
}

unint64_t sub_21DBCF3E4(uint64_t a1, uint64_t a2, unsigned __int16 a3)
{
  uint64_t v6;

  sub_21DBD25A8();
  swift_bridgeObjectRetain();
  sub_21DBD23C8();
  swift_bridgeObjectRelease();
  sub_21DBD25C0();
  v6 = sub_21DBD25CC();
  return sub_21DBCF730(a1, a2, a3, v6);
}

unint64_t sub_21DBCF474(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_21DBD24F4();
  return sub_21DBCF810(a1, v2);
}

unint64_t sub_21DBCF4A4(uint64_t a1, uint64_t a2)
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

unint64_t sub_21DBCF540(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_21DBD2578() & 1) == 0)
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
      while (!v14 && (sub_21DBD2578() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_21DBCF620(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2553A4378);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_21DBCF668(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2553A4378);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_21DBCF6A8()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_21DBCF6CC()
{
  uint64_t v0;

  return sub_21DBCDC30(*(_QWORD *)(v0 + 16), *(_DWORD *)(v0 + 24));
}

uint64_t block_copy_helper_3(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_3()
{
  return swift_release();
}

uint64_t sub_21DBCF6F0()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_21DBCF71C()
{
  return swift_deallocObject();
}

unint64_t sub_21DBCF730(uint64_t a1, uint64_t a2, unsigned __int16 a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  BOOL v15;

  v5 = v4 + 64;
  v6 = -1 << *(_BYTE *)(v4 + 32);
  v7 = a4 & ~v6;
  if (((*(_QWORD *)(v4 + 64 + ((v7 >> 3) & 0xFFFFFFFFFFFFF8)) >> v7) & 1) != 0)
  {
    v10 = a3;
    v11 = ~v6;
    v12 = *(_QWORD *)(v4 + 48);
    do
    {
      v13 = v12 + 24 * v7;
      v14 = *(unsigned __int16 *)(v13 + 16);
      v15 = *(_QWORD *)v13 == a1 && *(_QWORD *)(v13 + 8) == a2;
      if ((v15 || (sub_21DBD2578() & 1) != 0) && v14 == v10)
        break;
      v7 = (v7 + 1) & v11;
    }
    while (((*(_QWORD *)(v5 + ((v7 >> 3) & 0xFFFFFFFFFFFFF8)) >> v7) & 1) != 0);
  }
  return v7;
}

unint64_t sub_21DBCF810(uint64_t a1, uint64_t a2)
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
      sub_21DBB6B5C(*(_QWORD *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      v7 = MEMORY[0x22079B1F0](v9, a1);
      sub_21DBD2240((uint64_t)v9);
      if ((v7 & 1) != 0)
        break;
      v4 = (v4 + 1) & v6;
    }
    while (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

uint64_t sub_21DBCF8D4(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  int64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  unint64_t v22;
  int64_t v23;
  char v24;
  unint64_t v25;
  BOOL v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  int64_t v33;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2553A43A0);
  result = sub_21DBD2554();
  v7 = result;
  if (*(_QWORD *)(v5 + 16))
  {
    v8 = 0;
    v9 = (uint64_t *)(v5 + 64);
    v10 = 1 << *(_BYTE *)(v5 + 32);
    v31 = -1 << v10;
    v32 = v10;
    if (v10 < 64)
      v11 = ~(-1 << v10);
    else
      v11 = -1;
    v12 = v11 & *(_QWORD *)(v5 + 64);
    v33 = (unint64_t)(v10 + 63) >> 6;
    v13 = result + 64;
    while (1)
    {
      if (v12)
      {
        v19 = __clz(__rbit64(v12));
        v12 &= v12 - 1;
        v20 = v19 | (v8 << 6);
      }
      else
      {
        v21 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          return result;
        }
        if (v21 >= v33)
          goto LABEL_33;
        v22 = v9[v21];
        ++v8;
        if (!v22)
        {
          v8 = v21 + 1;
          if (v21 + 1 >= v33)
            goto LABEL_33;
          v22 = v9[v8];
          if (!v22)
          {
            v23 = v21 + 2;
            if (v23 >= v33)
            {
LABEL_33:
              if ((a2 & 1) != 0)
              {
                if (v32 >= 64)
                  bzero((void *)(v5 + 64), 8 * v33);
                else
                  *v9 = v31;
                *(_QWORD *)(v5 + 16) = 0;
              }
              break;
            }
            v22 = v9[v23];
            if (!v22)
            {
              while (1)
              {
                v8 = v23 + 1;
                if (__OFADD__(v23, 1))
                  goto LABEL_41;
                if (v8 >= v33)
                  goto LABEL_33;
                v22 = v9[v8];
                ++v23;
                if (v22)
                  goto LABEL_30;
              }
            }
            v8 = v23;
          }
        }
LABEL_30:
        v12 = (v22 - 1) & v22;
        v20 = __clz(__rbit64(v22)) + (v8 << 6);
      }
      v28 = 8 * v20;
      v29 = *(_QWORD *)(*(_QWORD *)(v5 + 48) + v28);
      v30 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + v28);
      if ((a2 & 1) == 0)
        swift_retain();
      result = sub_21DBD259C();
      v14 = -1 << *(_BYTE *)(v7 + 32);
      v15 = result & ~v14;
      v16 = v15 >> 6;
      if (((-1 << v15) & ~*(_QWORD *)(v13 + 8 * (v15 >> 6))) != 0)
      {
        v17 = __clz(__rbit64((-1 << v15) & ~*(_QWORD *)(v13 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v24 = 0;
        v25 = (unint64_t)(63 - v14) >> 6;
        do
        {
          if (++v16 == v25 && (v24 & 1) != 0)
          {
            __break(1u);
            goto LABEL_40;
          }
          v26 = v16 == v25;
          if (v16 == v25)
            v16 = 0;
          v24 |= v26;
          v27 = *(_QWORD *)(v13 + 8 * v16);
        }
        while (v27 == -1);
        v17 = __clz(__rbit64(~v27)) + (v16 << 6);
      }
      *(_QWORD *)(v13 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
      v18 = 8 * v17;
      *(_QWORD *)(*(_QWORD *)(v7 + 48) + v18) = v29;
      *(_QWORD *)(*(_QWORD *)(v7 + 56) + v18) = v30;
      ++*(_QWORD *)(v7 + 16);
    }
  }
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_21DBCFB88(uint64_t a1, char a2)
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
  uint64_t v18;
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
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  __int16 v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t *v35;
  int64_t v36;
  uint64_t v37;
  char v38;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2553A4398);
  v38 = a2;
  v6 = sub_21DBD2554();
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
    v29 = *(_QWORD *)(v5 + 48) + 24 * v20;
    v31 = *(_QWORD *)v29;
    v30 = *(_QWORD *)(v29 + 8);
    v32 = *(_WORD *)(v29 + 16);
    v33 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + 8 * v20);
    if ((v38 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_retain();
    }
    sub_21DBD25A8();
    swift_bridgeObjectRetain();
    sub_21DBD23C8();
    swift_bridgeObjectRelease();
    sub_21DBD25C0();
    result = sub_21DBD25CC();
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
    v18 = *(_QWORD *)(v7 + 48) + 24 * v17;
    *(_QWORD *)v18 = v31;
    *(_QWORD *)(v18 + 8) = v30;
    *(_WORD *)(v18 + 16) = v32;
    *(_QWORD *)(*(_QWORD *)(v7 + 56) + 8 * v17) = v33;
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

uint64_t sub_21DBCFEC8(uint64_t a1, char a2)
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
  unint64_t v14;
  _QWORD *v15;
  unint64_t v16;
  unint64_t v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  _OWORD *v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  char v28;
  unint64_t v29;
  BOOL v30;
  uint64_t v31;
  uint64_t v32;
  int64_t v33;
  _QWORD *v34;
  _OWORD v35[2];

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_253F3D8E0);
  v6 = sub_21DBD2554();
  v7 = v6;
  if (*(_QWORD *)(v5 + 16))
  {
    v8 = 1 << *(_BYTE *)(v5 + 32);
    v34 = (_QWORD *)(v5 + 64);
    if (v8 < 64)
      v9 = ~(-1 << v8);
    else
      v9 = -1;
    v10 = v9 & *(_QWORD *)(v5 + 64);
    v33 = (unint64_t)(v8 + 63) >> 6;
    v11 = v6 + 64;
    result = swift_retain();
    v13 = 0;
    while (1)
    {
      if (v10)
      {
        v16 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        v17 = v16 | (v13 << 6);
      }
      else
      {
        v18 = v13 + 1;
        if (__OFADD__(v13, 1))
        {
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          return result;
        }
        if (v18 >= v33)
          goto LABEL_34;
        v19 = v34[v18];
        ++v13;
        if (!v19)
        {
          v13 = v18 + 1;
          if (v18 + 1 >= v33)
            goto LABEL_34;
          v19 = v34[v13];
          if (!v19)
          {
            v20 = v18 + 2;
            if (v20 >= v33)
            {
LABEL_34:
              swift_release();
              v3 = v2;
              if ((a2 & 1) != 0)
              {
                v32 = 1 << *(_BYTE *)(v5 + 32);
                if (v32 >= 64)
                  bzero(v34, ((unint64_t)(v32 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v34 = -1 << v32;
                *(_QWORD *)(v5 + 16) = 0;
              }
              break;
            }
            v19 = v34[v20];
            if (!v19)
            {
              while (1)
              {
                v13 = v20 + 1;
                if (__OFADD__(v20, 1))
                  goto LABEL_41;
                if (v13 >= v33)
                  goto LABEL_34;
                v19 = v34[v13];
                ++v20;
                if (v19)
                  goto LABEL_21;
              }
            }
            v13 = v20;
          }
        }
LABEL_21:
        v10 = (v19 - 1) & v19;
        v17 = __clz(__rbit64(v19)) + (v13 << 6);
      }
      v21 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v17);
      v23 = *v21;
      v22 = v21[1];
      v24 = (_OWORD *)(*(_QWORD *)(v5 + 56) + 32 * v17);
      if ((a2 & 1) != 0)
      {
        sub_21DBB3F4C(v24, v35);
      }
      else
      {
        sub_21DBB4014((uint64_t)v24, (uint64_t)v35);
        swift_bridgeObjectRetain();
      }
      sub_21DBD25A8();
      sub_21DBD23C8();
      result = sub_21DBD25CC();
      v25 = -1 << *(_BYTE *)(v7 + 32);
      v26 = result & ~v25;
      v27 = v26 >> 6;
      if (((-1 << v26) & ~*(_QWORD *)(v11 + 8 * (v26 >> 6))) != 0)
      {
        v14 = __clz(__rbit64((-1 << v26) & ~*(_QWORD *)(v11 + 8 * (v26 >> 6)))) | v26 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v28 = 0;
        v29 = (unint64_t)(63 - v25) >> 6;
        do
        {
          if (++v27 == v29 && (v28 & 1) != 0)
          {
            __break(1u);
            goto LABEL_40;
          }
          v30 = v27 == v29;
          if (v27 == v29)
            v27 = 0;
          v28 |= v30;
          v31 = *(_QWORD *)(v11 + 8 * v27);
        }
        while (v31 == -1);
        v14 = __clz(__rbit64(~v31)) + (v27 << 6);
      }
      *(_QWORD *)(v11 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
      v15 = (_QWORD *)(*(_QWORD *)(v7 + 48) + 16 * v14);
      *v15 = v23;
      v15[1] = v22;
      result = (uint64_t)sub_21DBB3F4C(v35, (_OWORD *)(*(_QWORD *)(v7 + 56) + 32 * v14));
      ++*(_QWORD *)(v7 + 16);
    }
  }
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_21DBD01C4(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  int64_t v11;
  uint64_t v12;
  uint64_t result;
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
  uint64_t *v35;
  uint64_t v36;
  char v37;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_253F3D880);
  v37 = a2;
  v6 = sub_21DBD2554();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_40;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v35 = v2;
  v36 = v5 + 64;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v11 = (unint64_t)(v8 + 63) >> 6;
  v12 = v6 + 64;
  result = swift_retain();
  v14 = 0;
  while (1)
  {
    if (v10)
    {
      v20 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v21 = v20 | (v14 << 6);
      goto LABEL_31;
    }
    v22 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v22 >= v11)
      break;
    v23 = (_QWORD *)(v5 + 64);
    v24 = *(_QWORD *)(v36 + 8 * v22);
    ++v14;
    if (!v24)
    {
      v14 = v22 + 1;
      if (v22 + 1 >= v11)
        goto LABEL_33;
      v24 = *(_QWORD *)(v36 + 8 * v14);
      if (!v24)
      {
        v25 = v22 + 2;
        if (v25 >= v11)
        {
LABEL_33:
          swift_release();
          v3 = v35;
          if ((v37 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v24 = *(_QWORD *)(v36 + 8 * v25);
        if (!v24)
        {
          while (1)
          {
            v14 = v25 + 1;
            if (__OFADD__(v25, 1))
              goto LABEL_42;
            if (v14 >= v11)
              goto LABEL_33;
            v24 = *(_QWORD *)(v36 + 8 * v14);
            ++v25;
            if (v24)
              goto LABEL_30;
          }
        }
        v14 = v25;
      }
    }
LABEL_30:
    v10 = (v24 - 1) & v24;
    v21 = __clz(__rbit64(v24)) + (v14 << 6);
LABEL_31:
    v30 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v21);
    v32 = *v30;
    v31 = v30[1];
    v33 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + 8 * v21);
    if ((v37 & 1) == 0)
      swift_bridgeObjectRetain();
    sub_21DBD25A8();
    sub_21DBD23C8();
    result = sub_21DBD25CC();
    v15 = -1 << *(_BYTE *)(v7 + 32);
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
          goto LABEL_41;
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
    v19 = (_QWORD *)(*(_QWORD *)(v7 + 48) + 16 * v18);
    *v19 = v32;
    v19[1] = v31;
    *(_QWORD *)(*(_QWORD *)(v7 + 56) + 8 * v18) = v33;
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v3 = v35;
  v23 = (_QWORD *)(v5 + 64);
  if ((v37 & 1) == 0)
    goto LABEL_40;
LABEL_36:
  v34 = 1 << *(_BYTE *)(v5 + 32);
  if (v34 >= 64)
    bzero(v23, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v23 = -1 << v34;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_40:
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_21DBD04C8(uint64_t a1, char a2)
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
  uint64_t v32;
  uint64_t v33;
  int64_t v34;
  uint64_t v35;
  char v36;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_253F3D858);
  v36 = a2;
  v6 = sub_21DBD2554();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_40;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v35 = v5 + 64;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v34 = (unint64_t)(v8 + 63) >> 6;
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
    if (v21 >= v34)
      break;
    v22 = (_QWORD *)(v5 + 64);
    v23 = *(_QWORD *)(v35 + 8 * v21);
    ++v13;
    if (!v23)
    {
      v13 = v21 + 1;
      if (v21 + 1 >= v34)
        goto LABEL_33;
      v23 = *(_QWORD *)(v35 + 8 * v13);
      if (!v23)
      {
        v24 = v21 + 2;
        if (v24 >= v34)
        {
LABEL_33:
          swift_release();
          if ((v36 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v23 = *(_QWORD *)(v35 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            v13 = v24 + 1;
            if (__OFADD__(v24, 1))
              goto LABEL_42;
            if (v13 >= v34)
              goto LABEL_33;
            v23 = *(_QWORD *)(v35 + 8 * v13);
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
    v32 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + 8 * v20);
    if ((v36 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    sub_21DBD25A8();
    sub_21DBD23C8();
    result = sub_21DBD25CC();
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
  v22 = (_QWORD *)(v5 + 64);
  if ((v36 & 1) == 0)
    goto LABEL_40;
LABEL_36:
  v33 = 1 << *(_BYTE *)(v5 + 32);
  if (v33 >= 64)
    bzero(v22, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v22 = -1 << v33;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_40:
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_21DBD07DC(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  int64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  unint64_t v22;
  int64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  char v30;
  unint64_t v31;
  BOOL v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t *v35;
  int64_t v36;
  _QWORD *v37;
  uint64_t v38;

  v3 = v2;
  v5 = type metadata accessor for ReporterState(0);
  v38 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5, v6);
  v8 = (char *)&v35 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_253F3D8D8);
  result = sub_21DBD2554();
  v11 = result;
  if (*(_QWORD *)(v9 + 16))
  {
    v12 = 0;
    v13 = *(_QWORD *)(v9 + 64);
    v37 = (_QWORD *)(v9 + 64);
    v14 = 1 << *(_BYTE *)(v9 + 32);
    if (v14 < 64)
      v15 = ~(-1 << v14);
    else
      v15 = -1;
    v16 = v15 & v13;
    v35 = v3;
    v36 = (unint64_t)(v14 + 63) >> 6;
    v17 = result + 64;
    while (1)
    {
      if (v16)
      {
        v19 = __clz(__rbit64(v16));
        v16 &= v16 - 1;
        v20 = v19 | (v12 << 6);
      }
      else
      {
        v21 = v12 + 1;
        if (__OFADD__(v12, 1))
        {
LABEL_42:
          __break(1u);
LABEL_43:
          __break(1u);
          return result;
        }
        result = (uint64_t)v37;
        if (v21 >= v36)
          goto LABEL_34;
        v22 = v37[v21];
        ++v12;
        if (!v22)
        {
          v12 = v21 + 1;
          if (v21 + 1 >= v36)
            goto LABEL_34;
          v22 = v37[v12];
          if (!v22)
          {
            v23 = v21 + 2;
            if (v23 >= v36)
            {
LABEL_34:
              if ((a2 & 1) == 0)
              {
                result = swift_release();
                v3 = v35;
                goto LABEL_41;
              }
              v34 = 1 << *(_BYTE *)(v9 + 32);
              if (v34 >= 64)
                bzero(v37, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
              else
                *v37 = -1 << v34;
              v3 = v35;
              *(_QWORD *)(v9 + 16) = 0;
              break;
            }
            v22 = v37[v23];
            if (!v22)
            {
              while (1)
              {
                v12 = v23 + 1;
                if (__OFADD__(v23, 1))
                  goto LABEL_43;
                if (v12 >= v36)
                  goto LABEL_34;
                v22 = v37[v12];
                ++v23;
                if (v22)
                  goto LABEL_21;
              }
            }
            v12 = v23;
          }
        }
LABEL_21:
        v16 = (v22 - 1) & v22;
        v20 = __clz(__rbit64(v22)) + (v12 << 6);
      }
      v24 = *(_QWORD *)(*(_QWORD *)(v9 + 48) + 8 * v20);
      v25 = *(_QWORD *)(v38 + 72);
      v26 = *(_QWORD *)(v9 + 56) + v25 * v20;
      if ((a2 & 1) != 0)
        sub_21DBD21FC(v26, (uint64_t)v8);
      else
        sub_21DBD21B8(v26, (uint64_t)v8);
      result = sub_21DBD259C();
      v27 = -1 << *(_BYTE *)(v11 + 32);
      v28 = result & ~v27;
      v29 = v28 >> 6;
      if (((-1 << v28) & ~*(_QWORD *)(v17 + 8 * (v28 >> 6))) != 0)
      {
        v18 = __clz(__rbit64((-1 << v28) & ~*(_QWORD *)(v17 + 8 * (v28 >> 6)))) | v28 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v30 = 0;
        v31 = (unint64_t)(63 - v27) >> 6;
        do
        {
          if (++v29 == v31 && (v30 & 1) != 0)
          {
            __break(1u);
            goto LABEL_42;
          }
          v32 = v29 == v31;
          if (v29 == v31)
            v29 = 0;
          v30 |= v32;
          v33 = *(_QWORD *)(v17 + 8 * v29);
        }
        while (v33 == -1);
        v18 = __clz(__rbit64(~v33)) + (v29 << 6);
      }
      *(_QWORD *)(v17 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
      *(_QWORD *)(*(_QWORD *)(v11 + 48) + 8 * v18) = v24;
      result = sub_21DBD21FC((uint64_t)v8, *(_QWORD *)(v11 + 56) + v25 * v18);
      ++*(_QWORD *)(v11 + 16);
    }
  }
  result = swift_release();
LABEL_41:
  *v3 = v11;
  return result;
}

uint64_t sub_21DBD0AE4(uint64_t a1, uint64_t a2, uint64_t a3, unsigned __int16 a4, char a5)
{
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v12;
  char v13;
  unint64_t v14;
  uint64_t v15;
  _BOOL8 v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t result;
  unint64_t v23;
  char v24;
  uint64_t v25;
  uint64_t v26;
  BOOL v27;
  uint64_t v28;

  v6 = v5;
  v12 = *v5;
  v14 = sub_21DBCF3E4(a2, a3, a4);
  v15 = *(_QWORD *)(v12 + 16);
  v16 = (v13 & 1) == 0;
  v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v18 = v13;
  v19 = *(_QWORD *)(v12 + 24);
  if (v19 >= v17 && (a5 & 1) != 0)
    goto LABEL_7;
  if (v19 >= v17 && (a5 & 1) == 0)
  {
    sub_21DBD128C();
LABEL_7:
    v20 = (_QWORD *)*v6;
    if ((v18 & 1) != 0)
    {
LABEL_8:
      v21 = v20[7];
      result = swift_release();
      *(_QWORD *)(v21 + 8 * v14) = a1;
      return result;
    }
LABEL_11:
    v20[(v14 >> 6) + 8] |= 1 << v14;
    v25 = v20[6] + 24 * v14;
    *(_QWORD *)v25 = a2;
    *(_QWORD *)(v25 + 8) = a3;
    *(_WORD *)(v25 + 16) = a4;
    *(_QWORD *)(v20[7] + 8 * v14) = a1;
    v26 = v20[2];
    v27 = __OFADD__(v26, 1);
    v28 = v26 + 1;
    if (!v27)
    {
      v20[2] = v28;
      return swift_bridgeObjectRetain();
    }
    goto LABEL_14;
  }
  sub_21DBCFB88(v17, a5 & 1);
  v23 = sub_21DBCF3E4(a2, a3, a4);
  if ((v18 & 1) == (v24 & 1))
  {
    v14 = v23;
    v20 = (_QWORD *)*v6;
    if ((v18 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  result = sub_21DBD2584();
  __break(1u);
  return result;
}

_OWORD *sub_21DBD0C60(_OWORD *a1, uint64_t a2, uint64_t a3, char a4)
{
  _QWORD *v4;
  _QWORD **v5;
  _QWORD *v10;
  char v11;
  unint64_t v12;
  uint64_t v13;
  _BOOL8 v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  _QWORD *v18;
  _OWORD *v19;
  _OWORD *result;
  unint64_t v21;
  char v22;

  v5 = (_QWORD **)v4;
  v10 = (_QWORD *)*v4;
  v12 = sub_21DBCF33C(a2, a3);
  v13 = v10[2];
  v14 = (v11 & 1) == 0;
  v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
  }
  else
  {
    v16 = v11;
    v17 = v10[3];
    if (v17 >= v15 && (a4 & 1) != 0)
    {
LABEL_7:
      v18 = *v5;
      if ((v16 & 1) != 0)
      {
LABEL_8:
        v19 = (_OWORD *)(v18[7] + 32 * v12);
        __swift_destroy_boxed_opaque_existential_0((uint64_t)v19);
        return sub_21DBB3F4C(a1, v19);
      }
      goto LABEL_11;
    }
    if (v17 >= v15 && (a4 & 1) == 0)
    {
      sub_21DBD144C();
      goto LABEL_7;
    }
    sub_21DBCFEC8(v15, a4 & 1);
    v21 = sub_21DBCF33C(a2, a3);
    if ((v16 & 1) == (v22 & 1))
    {
      v12 = v21;
      v18 = *v5;
      if ((v16 & 1) != 0)
        goto LABEL_8;
LABEL_11:
      sub_21DBD1000(v12, a2, a3, a1, v18);
      return (_OWORD *)swift_bridgeObjectRetain();
    }
  }
  result = (_OWORD *)sub_21DBD2584();
  __break(1u);
  return result;
}

uint64_t sub_21DBD0D90(uint64_t a1, uint64_t a2, char a3, double a4)
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v10;
  char v11;
  unint64_t v12;
  uint64_t v13;
  _BOOL8 v14;
  uint64_t result;
  char v16;
  uint64_t v17;
  _QWORD *v18;
  char v19;
  uint64_t *v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;

  v5 = v4;
  v10 = *v4;
  v12 = sub_21DBCF33C(a1, a2);
  v13 = *(_QWORD *)(v10 + 16);
  v14 = (v11 & 1) == 0;
  result = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v16 = v11;
  v17 = *(_QWORD *)(v10 + 24);
  if (v17 >= result && (a3 & 1) != 0)
    goto LABEL_7;
  if (v17 >= result && (a3 & 1) == 0)
  {
    result = (uint64_t)sub_21DBD1630();
LABEL_7:
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
    {
LABEL_8:
      *(double *)(v18[7] + 8 * v12) = a4;
      return result;
    }
LABEL_11:
    v18[(v12 >> 6) + 8] |= 1 << v12;
    v20 = (uint64_t *)(v18[6] + 16 * v12);
    *v20 = a1;
    v20[1] = a2;
    *(double *)(v18[7] + 8 * v12) = a4;
    v21 = v18[2];
    v22 = __OFADD__(v21, 1);
    v23 = v21 + 1;
    if (!v22)
    {
      v18[2] = v23;
      return swift_bridgeObjectRetain();
    }
    goto LABEL_14;
  }
  sub_21DBD01C4(result, a3 & 1);
  result = sub_21DBCF33C(a1, a2);
  if ((v16 & 1) == (v19 & 1))
  {
    v12 = result;
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  result = sub_21DBD2584();
  __break(1u);
  return result;
}

uint64_t sub_21DBD0EE4(uint64_t a1, uint64_t a2, char a3)
{
  _QWORD *v3;
  _QWORD **v4;
  _QWORD *v8;
  char v9;
  unint64_t v10;
  uint64_t v11;
  _BOOL8 v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t result;
  unint64_t v20;
  char v21;

  v4 = (_QWORD **)v3;
  v8 = (_QWORD *)*v3;
  v10 = sub_21DBCF30C(a2);
  v11 = v8[2];
  v12 = (v9 & 1) == 0;
  v13 = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
  }
  else
  {
    v14 = v9;
    v15 = v8[3];
    if (v15 >= v13 && (a3 & 1) != 0)
    {
LABEL_7:
      v16 = *v4;
      if ((v14 & 1) != 0)
      {
LABEL_8:
        v17 = v16[7];
        v18 = v17 + *(_QWORD *)(*(_QWORD *)(type metadata accessor for ReporterState(0) - 8) + 72) * v10;
        return sub_21DBD2174(a1, v18);
      }
      return sub_21DBD1068(v10, a2, a1, v16);
    }
    if (v15 >= v13 && (a3 & 1) == 0)
    {
      sub_21DBD17DC();
      goto LABEL_7;
    }
    sub_21DBD07DC(v13, a3 & 1);
    v20 = sub_21DBCF30C(a2);
    if ((v14 & 1) == (v21 & 1))
    {
      v10 = v20;
      v16 = *v4;
      if ((v14 & 1) != 0)
        goto LABEL_8;
      return sub_21DBD1068(v10, a2, a1, v16);
    }
  }
  result = sub_21DBD2584();
  __break(1u);
  return result;
}

_OWORD *sub_21DBD1000(unint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4, _QWORD *a5)
{
  _QWORD *v6;
  _OWORD *result;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;

  a5[(a1 >> 6) + 8] |= 1 << a1;
  v6 = (_QWORD *)(a5[6] + 16 * a1);
  *v6 = a2;
  v6[1] = a3;
  result = sub_21DBB3F4C(a4, (_OWORD *)(a5[7] + 32 * a1));
  v8 = a5[2];
  v9 = __OFADD__(v8, 1);
  v10 = v8 + 1;
  if (v9)
    __break(1u);
  else
    a5[2] = v10;
  return result;
}

uint64_t sub_21DBD1068(unint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;

  a4[(a1 >> 6) + 8] |= 1 << a1;
  *(_QWORD *)(a4[6] + 8 * a1) = a2;
  v7 = a4[7];
  v8 = type metadata accessor for ReporterState(0);
  result = sub_21DBD21FC(a3, v7 + *(_QWORD *)(*(_QWORD *)(v8 - 8) + 72) * a1);
  v10 = a4[2];
  v11 = __OFADD__(v10, 1);
  v12 = v10 + 1;
  if (v11)
    __break(1u);
  else
    a4[2] = v12;
  return result;
}

void *sub_21DBD10EC()
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
  uint64_t v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2553A43A0);
  v2 = *v0;
  v3 = sub_21DBD2548();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (void *)swift_release();
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
    v18 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v18 >= v13)
      goto LABEL_26;
    v19 = *(_QWORD *)(v6 + 8 * v18);
    ++v9;
    if (!v19)
    {
      v9 = v18 + 1;
      if (v18 + 1 >= v13)
        goto LABEL_26;
      v19 = *(_QWORD *)(v6 + 8 * v9);
      if (!v19)
        break;
    }
LABEL_25:
    v12 = (v19 - 1) & v19;
    v15 = __clz(__rbit64(v19)) + (v9 << 6);
LABEL_12:
    v16 = 8 * v15;
    v17 = *(_QWORD *)(*(_QWORD *)(v2 + 56) + v16);
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + v16) = *(_QWORD *)(*(_QWORD *)(v2 + 48) + v16);
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v16) = v17;
    result = (void *)swift_retain();
  }
  v20 = v18 + 2;
  if (v20 >= v13)
    goto LABEL_26;
  v19 = *(_QWORD *)(v6 + 8 * v20);
  if (v19)
  {
    v9 = v20;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v20 + 1;
    if (__OFADD__(v20, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v19 = *(_QWORD *)(v6 + 8 * v9);
    ++v20;
    if (v19)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_21DBD128C()
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
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int64_t v23;
  unint64_t v24;
  int64_t v25;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2553A4398);
  v2 = *v0;
  v3 = sub_21DBD2548();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (void *)swift_release();
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
    v23 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v23 >= v13)
      goto LABEL_26;
    v24 = *(_QWORD *)(v6 + 8 * v23);
    ++v9;
    if (!v24)
    {
      v9 = v23 + 1;
      if (v23 + 1 >= v13)
        goto LABEL_26;
      v24 = *(_QWORD *)(v6 + 8 * v9);
      if (!v24)
        break;
    }
LABEL_25:
    v12 = (v24 - 1) & v24;
    v15 = __clz(__rbit64(v24)) + (v9 << 6);
LABEL_12:
    v16 = 24 * v15;
    v17 = *(_QWORD *)(v2 + 48) + 24 * v15;
    v19 = *(_QWORD *)v17;
    v18 = *(_QWORD *)(v17 + 8);
    LOWORD(v17) = *(_WORD *)(v17 + 16);
    v20 = 8 * v15;
    v21 = *(_QWORD *)(*(_QWORD *)(v2 + 56) + v20);
    v22 = *(_QWORD *)(v4 + 48) + v16;
    *(_QWORD *)v22 = v19;
    *(_QWORD *)(v22 + 8) = v18;
    *(_WORD *)(v22 + 16) = v17;
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v20) = v21;
    swift_bridgeObjectRetain();
    result = (void *)swift_retain();
  }
  v25 = v23 + 2;
  if (v25 >= v13)
    goto LABEL_26;
  v24 = *(_QWORD *)(v6 + 8 * v25);
  if (v24)
  {
    v9 = v25;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v25 + 1;
    if (__OFADD__(v25, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v24 = *(_QWORD *)(v6 + 8 * v9);
    ++v25;
    if (v24)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_21DBD144C()
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
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  int64_t v22;
  unint64_t v23;
  int64_t v24;
  uint64_t *v25;
  _OWORD v26[2];

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_253F3D8E0);
  v2 = *v0;
  v3 = sub_21DBD2548();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
    result = (void *)swift_release();
LABEL_28:
    *v1 = v4;
    return result;
  }
  v25 = v1;
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
      goto LABEL_30;
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
    v17 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v19 = *v17;
    v18 = v17[1];
    v20 = 32 * v15;
    sub_21DBB4014(*(_QWORD *)(v2 + 56) + 32 * v15, (uint64_t)v26);
    v21 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v21 = v19;
    v21[1] = v18;
    sub_21DBB3F4C(v26, (_OWORD *)(*(_QWORD *)(v4 + 56) + v20));
    result = (void *)swift_bridgeObjectRetain();
  }
  v24 = v22 + 2;
  if (v24 >= v13)
  {
LABEL_26:
    result = (void *)swift_release();
    v1 = v25;
    goto LABEL_28;
  }
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
LABEL_30:
  __break(1u);
  return result;
}

void *sub_21DBD1630()
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_253F3D880);
  v2 = *v0;
  v3 = sub_21DBD2548();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (void *)swift_release();
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
    result = (void *)swift_bridgeObjectRetain();
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

void *sub_21DBD17DC()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *result;
  uint64_t v10;
  unint64_t v11;
  int64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  int64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  int64_t v23;
  unint64_t v24;
  int64_t v25;
  uint64_t *v26;
  uint64_t v27;

  v1 = v0;
  v2 = type metadata accessor for ReporterState(0);
  v27 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2, v3);
  v5 = (char *)&v26 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_253F3D8D8);
  v6 = *v0;
  v7 = sub_21DBD2548();
  v8 = v7;
  if (!*(_QWORD *)(v6 + 16))
  {
    result = (void *)swift_release();
LABEL_28:
    *v1 = v8;
    return result;
  }
  v26 = v1;
  result = (void *)(v7 + 64);
  v10 = v6 + 64;
  v11 = (unint64_t)((1 << *(_BYTE *)(v8 + 32)) + 63) >> 6;
  if (v8 != v6 || (unint64_t)result >= v6 + 64 + 8 * v11)
    result = memmove(result, (const void *)(v6 + 64), 8 * v11);
  v13 = 0;
  *(_QWORD *)(v8 + 16) = *(_QWORD *)(v6 + 16);
  v14 = 1 << *(_BYTE *)(v6 + 32);
  v15 = -1;
  if (v14 < 64)
    v15 = ~(-1 << v14);
  v16 = v15 & *(_QWORD *)(v6 + 64);
  v17 = (unint64_t)(v14 + 63) >> 6;
  while (1)
  {
    if (v16)
    {
      v18 = __clz(__rbit64(v16));
      v16 &= v16 - 1;
      v19 = v18 | (v13 << 6);
      goto LABEL_12;
    }
    v23 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v23 >= v17)
      goto LABEL_26;
    v24 = *(_QWORD *)(v10 + 8 * v23);
    ++v13;
    if (!v24)
    {
      v13 = v23 + 1;
      if (v23 + 1 >= v17)
        goto LABEL_26;
      v24 = *(_QWORD *)(v10 + 8 * v13);
      if (!v24)
        break;
    }
LABEL_25:
    v16 = (v24 - 1) & v24;
    v19 = __clz(__rbit64(v24)) + (v13 << 6);
LABEL_12:
    v20 = 8 * v19;
    v21 = *(_QWORD *)(*(_QWORD *)(v6 + 48) + 8 * v19);
    v22 = *(_QWORD *)(v27 + 72) * v19;
    sub_21DBD21B8(*(_QWORD *)(v6 + 56) + v22, (uint64_t)v5);
    *(_QWORD *)(*(_QWORD *)(v8 + 48) + v20) = v21;
    result = (void *)sub_21DBD21FC((uint64_t)v5, *(_QWORD *)(v8 + 56) + v22);
  }
  v25 = v23 + 2;
  if (v25 >= v17)
  {
LABEL_26:
    result = (void *)swift_release();
    v1 = v26;
    goto LABEL_28;
  }
  v24 = *(_QWORD *)(v10 + 8 * v25);
  if (v24)
  {
    v13 = v25;
    goto LABEL_25;
  }
  while (1)
  {
    v13 = v25 + 1;
    if (__OFADD__(v25, 1))
      break;
    if (v13 >= v17)
      goto LABEL_26;
    v24 = *(_QWORD *)(v10 + 8 * v13);
    ++v25;
    if (v24)
      goto LABEL_25;
  }
LABEL_30:
  __break(1u);
  return result;
}

unint64_t sub_21DBD19F0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t result;
  char v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  BOOL v19;
  uint64_t v20;
  uint64_t v21;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F3DA68);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2, v4);
  v6 = (uint64_t *)((char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  v7 = *(_QWORD *)(a1 + 16);
  if (v7)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_253F3D8D8);
    v8 = (_QWORD *)sub_21DBD2560();
    v9 = (uint64_t)v6 + *(int *)(v2 + 48);
    v10 = a1 + ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
    v11 = *(_QWORD *)(v3 + 72);
    while (1)
    {
      sub_21DBD2274(v10, (uint64_t)v6, &qword_253F3DA68);
      v12 = *v6;
      result = sub_21DBCF30C(*v6);
      if ((v14 & 1) != 0)
        break;
      v15 = result;
      *(_QWORD *)((char *)v8 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
      *(_QWORD *)(v8[6] + 8 * result) = v12;
      v16 = v8[7];
      v17 = type metadata accessor for ReporterState(0);
      result = sub_21DBD21FC(v9, v16 + *(_QWORD *)(*(_QWORD *)(v17 - 8) + 72) * v15);
      v18 = v8[2];
      v19 = __OFADD__(v18, 1);
      v20 = v18 + 1;
      if (v19)
        goto LABEL_10;
      v8[2] = v20;
      v10 += v11;
      if (!--v7)
        return (unint64_t)v8;
    }
    __break(1u);
LABEL_10:
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4B00];
  }
  return result;
}

uint64_t sub_21DBD1B50(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;

  v1 = *(_QWORD *)(a1 + OBJC_IVAR____TtC14AudioAnalytics12ReporterInfo_data);
  result = sub_21DBC997C();
  if (!v3)
  {
    result = sub_21DBB7A90();
    if (!v3)
      goto LABEL_8;
  }
  v4 = HIBYTE(v3) & 0xF;
  if ((v3 & 0x2000000000000000) == 0)
    v4 = result & 0xFFFFFFFFFFFFLL;
  if (!v4 || *(unsigned __int16 *)(v1 + 24) == 0xFFFF)
  {
    swift_bridgeObjectRelease();
LABEL_8:
    if (qword_253F3DA18 != -1)
      swift_once();
    v5 = sub_21DBD2320();
    __swift_project_value_buffer(v5, (uint64_t)qword_253F3DC78);
    swift_retain_n();
    v6 = sub_21DBD2308();
    v7 = sub_21DBD2440();
    if (os_log_type_enabled(v6, v7))
    {
      v8 = swift_slowAlloc();
      v9 = swift_slowAlloc();
      v15 = v9;
      *(_DWORD *)v8 = 136315394;
      v10 = sub_21DBC997C();
      if (v11)
      {
        v12 = v11;
      }
      else
      {
        v10 = 0;
        v12 = 0xE000000000000000;
      }
      sub_21DBCECA4(v10, v12, &v15);
      sub_21DBD24AC();
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v8 + 12) = 2080;
      v13 = AudioServiceType.description.getter(*(_WORD *)(v1 + 24));
      sub_21DBCECA4(v13, v14, &v15);
      sub_21DBD24AC();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_21DBAF000, v6, v7, "Unable to build MessageDimensions. { appName=%s, serviceType=%s }", (uint8_t *)v8, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x22079B7C0](v9, -1, -1);
      MEMORY[0x22079B7C0](v8, -1, -1);

    }
    else
    {

      swift_release_n();
    }
    return 0;
  }
  return result;
}

uint64_t sub_21DBD1DA4(uint64_t a1, void (*a2)(uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  int64_t v7;
  uint64_t result;
  int64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int64_t v17;
  unint64_t v18;
  int64_t v19;
  uint64_t v20;

  v20 = a1 + 64;
  v4 = 1 << *(_BYTE *)(a1 + 32);
  v5 = -1;
  if (v4 < 64)
    v5 = ~(-1 << v4);
  v6 = v5 & *(_QWORD *)(a1 + 64);
  v7 = (unint64_t)(v4 + 63) >> 6;
  result = swift_bridgeObjectRetain();
  v9 = 0;
  while (1)
  {
    if (v6)
    {
      v10 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      v11 = v10 | (v9 << 6);
      goto LABEL_5;
    }
    v17 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v17 >= v7)
      return swift_release();
    v18 = *(_QWORD *)(v20 + 8 * v17);
    ++v9;
    if (!v18)
    {
      v9 = v17 + 1;
      if (v17 + 1 >= v7)
        return swift_release();
      v18 = *(_QWORD *)(v20 + 8 * v9);
      if (!v18)
      {
        v9 = v17 + 2;
        if (v17 + 2 >= v7)
          return swift_release();
        v18 = *(_QWORD *)(v20 + 8 * v9);
        if (!v18)
        {
          v9 = v17 + 3;
          if (v17 + 3 >= v7)
            return swift_release();
          v18 = *(_QWORD *)(v20 + 8 * v9);
          if (!v18)
            break;
        }
      }
    }
LABEL_22:
    v6 = (v18 - 1) & v18;
    v11 = __clz(__rbit64(v18)) + (v9 << 6);
LABEL_5:
    v12 = *(_QWORD *)(a1 + 48) + 24 * v11;
    v13 = *(_QWORD *)v12;
    v14 = *(_QWORD *)(v12 + 8);
    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8 * v11);
    v16 = *(unsigned __int16 *)(v12 + 16);
    swift_bridgeObjectRetain();
    swift_retain();
    a2(v13, v14, v16, v15);
    swift_release();
    result = swift_bridgeObjectRelease();
  }
  v19 = v17 + 4;
  if (v19 >= v7)
    return swift_release();
  v18 = *(_QWORD *)(v20 + 8 * v19);
  if (v18)
  {
    v9 = v19;
    goto LABEL_22;
  }
  while (1)
  {
    v9 = v19 + 1;
    if (__OFADD__(v19, 1))
      break;
    if (v9 >= v7)
      return swift_release();
    v18 = *(_QWORD *)(v20 + 8 * v9);
    ++v19;
    if (v18)
      goto LABEL_22;
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t sub_21DBD1F64(uint64_t a1, int a2, __int16 a3)
{
  char v3;
  unint64_t v5;
  char v6;
  uint64_t v8;
  uint64_t v9;
  _BYTE v10[32];

  v3 = 0;
  if (a2 == 7 && a3 == 6)
  {
    if (*(_QWORD *)(a1 + 16)
      && (v5 = sub_21DBCF33C(0x79745F6575737369, 0xEA00000000006570), (v6 & 1) != 0)
      && (sub_21DBB4014(*(_QWORD *)(a1 + 56) + 32 * v5, (uint64_t)v10), (swift_dynamicCast() & 1) != 0))
    {
      if (v8 == 0x64616F6C7265766FLL && v9 == 0xE800000000000000)
      {
        swift_bridgeObjectRelease();
        v3 = 1;
      }
      else
      {
        v3 = sub_21DBD2578();
        swift_bridgeObjectRelease();
      }
    }
    else
    {
      v3 = 0;
    }
  }
  return v3 & 1;
}

uint64_t sub_21DBD2070(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2553A4378);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_21DBD20B8()
{
  unint64_t result;

  result = qword_253F3DA60;
  if (!qword_253F3DA60)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_253F3DA60);
  }
  return result;
}

uint64_t sub_21DBD20F4(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x22079B718](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_21DBD2134(unint64_t *a1, uint64_t *a2)
{
  uint64_t result;
  uint64_t v4;

  result = *a1;
  if (!result)
  {
    v4 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x22079B718](MEMORY[0x24BEE12C8], v4);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_21DBD2174(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for ReporterState(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_21DBD21B8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for ReporterState(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_21DBD21FC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for ReporterState(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_21DBD2240(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(MEMORY[0x24BEE23D0] - 8) + 8))();
  return a1;
}

uint64_t sub_21DBD2274(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_21DBD22C0()
{
  return MEMORY[0x24BDCE628]();
}

uint64_t sub_21DBD22CC()
{
  return MEMORY[0x24BDCE780]();
}

uint64_t sub_21DBD22D8()
{
  return MEMORY[0x24BDCE880]();
}

uint64_t sub_21DBD22E4()
{
  return MEMORY[0x24BDCE8F8]();
}

uint64_t sub_21DBD22F0()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_21DBD22FC()
{
  return MEMORY[0x24BE30BE0]();
}

uint64_t sub_21DBD2308()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_21DBD2314()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_21DBD2320()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_21DBD232C()
{
  return MEMORY[0x24BEE5370]();
}

uint64_t sub_21DBD2338()
{
  return MEMORY[0x24BEE76D8]();
}

uint64_t sub_21DBD2344()
{
  return MEMORY[0x24BEE5458]();
}

uint64_t sub_21DBD2350()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t sub_21DBD235C()
{
  return MEMORY[0x24BEE54E0]();
}

uint64_t sub_21DBD2368()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_21DBD2374()
{
  return MEMORY[0x24BEE5618]();
}

uint64_t sub_21DBD2380()
{
  return MEMORY[0x24BEE5648]();
}

uint64_t sub_21DBD238C()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_21DBD2398()
{
  return MEMORY[0x24BDCF828]();
}

uint64_t sub_21DBD23A4()
{
  return MEMORY[0x24BDCF830]();
}

uint64_t sub_21DBD23B0()
{
  return MEMORY[0x24BEE0270]();
}

uint64_t sub_21DBD23BC()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_21DBD23C8()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_21DBD23D4()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_21DBD23E0()
{
  return MEMORY[0x24BEE0BE8]();
}

uint64_t sub_21DBD23EC()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_21DBD23F8()
{
  return MEMORY[0x24BEE1110]();
}

uint64_t sub_21DBD2404()
{
  return MEMORY[0x24BEE1120]();
}

uint64_t sub_21DBD2410()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_21DBD241C()
{
  return MEMORY[0x24BEE1160]();
}

uint64_t sub_21DBD2428()
{
  return MEMORY[0x24BEE11B8]();
}

uint64_t sub_21DBD2434()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t sub_21DBD2440()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_21DBD244C()
{
  return MEMORY[0x24BEE7920]();
}

uint64_t sub_21DBD2458()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_21DBD2464()
{
  return MEMORY[0x24BEE5688]();
}

uint64_t sub_21DBD2470()
{
  return MEMORY[0x24BEE5760]();
}

uint64_t sub_21DBD247C()
{
  return MEMORY[0x24BEE5780]();
}

uint64_t sub_21DBD2488()
{
  return MEMORY[0x24BEE5790]();
}

uint64_t sub_21DBD2494()
{
  return MEMORY[0x24BEE57A0]();
}

uint64_t sub_21DBD24A0()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_21DBD24AC()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_21DBD24B8()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_21DBD24C4()
{
  return MEMORY[0x24BDD0638]();
}

uint64_t sub_21DBD24D0()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_21DBD24DC()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_21DBD24E8()
{
  return MEMORY[0x24BEE22D0]();
}

uint64_t sub_21DBD24F4()
{
  return MEMORY[0x24BEE23A0]();
}

uint64_t sub_21DBD2500()
{
  return MEMORY[0x24BEE23A8]();
}

uint64_t sub_21DBD250C()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_21DBD2518()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_21DBD2524()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_21DBD2530()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_21DBD253C()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_21DBD2548()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_21DBD2554()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_21DBD2560()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_21DBD256C()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_21DBD2578()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_21DBD2584()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_21DBD2590()
{
  return MEMORY[0x24BDD0708]();
}

uint64_t sub_21DBD259C()
{
  return MEMORY[0x24BEE42D8]();
}

uint64_t sub_21DBD25A8()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_21DBD25B4()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_21DBD25C0()
{
  return MEMORY[0x24BEE4308]();
}

uint64_t sub_21DBD25CC()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x24BE1A1C8]();
}

uint64_t MobileGestalt_get_current_device()
{
  return MEMORY[0x24BED8580]();
}

uint64_t MobileGestalt_get_internalBuild()
{
  return MEMORY[0x24BED8610]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
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

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

pid_t getpid(void)
{
  return MEMORY[0x24BDAE6D0]();
}

uint64_t kdebug_trace()
{
  return MEMORY[0x24BDAE958]();
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

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x24BDAF148](*(_QWORD *)&token, state64);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x24BDAF170](name, out_token, queue, handler);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x24BEDCF78](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
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

uint64_t os_variant_is_darwinos()
{
  return MEMORY[0x24BDAF4E8]();
}

uint64_t pc_session_add_metric()
{
  return MEMORY[0x24BEDD5D0]();
}

uint64_t pc_session_begin()
{
  return MEMORY[0x24BEDD5D8]();
}

uint64_t pc_session_create()
{
  return MEMORY[0x24BEDD5E0]();
}

uint64_t pc_session_destroy()
{
  return MEMORY[0x24BEDD5F0]();
}

uint64_t pc_session_end()
{
  return MEMORY[0x24BEDD5F8]();
}

uint64_t pc_session_get_procname()
{
  return MEMORY[0x24BEDD600]();
}

uint64_t pc_session_get_values()
{
  return MEMORY[0x24BEDD610]();
}

uint64_t pc_session_set_procpid()
{
  return MEMORY[0x24BEDD618]();
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x24BDAFF18](*(_QWORD *)&__errnum);
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

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x24BEE4BA8]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x24BEE4BB0]();
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

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x24BEE4C18]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x24BEE4C38]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x24BEE4C98]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x24BEE4CA0]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x24BEE4CA8]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x24BEE4D08]();
}

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4D10]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x24BEE4D18]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x24BEE4D40]();
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

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x24BEE4DD0]();
}

uint64_t swift_getTupleTypeLayout2()
{
  return MEMORY[0x24BEE4DE0]();
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

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x24BEE4E30]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x24BEE4E48]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x24BEE4E58]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x24BEE4E68]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x24BEE4E98]();
}

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x24BEE4EB0]();
}

uint64_t swift_once()
{
  return MEMORY[0x24BEE4EC8]();
}

uint64_t swift_release()
{
  return MEMORY[0x24BEE4EF8]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x24BEE4F00]();
}

uint64_t swift_retain()
{
  return MEMORY[0x24BEE4F08]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x24BEE4F10]();
}

uint64_t swift_setDeallocating()
{
  return MEMORY[0x24BEE4F30]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x24BEE4F38]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x24BEE4F40]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x24BEE4F58]();
}

uint64_t swift_storeEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4F60]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x24BEE4F70]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
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

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x24BEE5008]();
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x24BDB00F8](a1, *(_QWORD *)&a2, a3, a4, a5, a6);
}

