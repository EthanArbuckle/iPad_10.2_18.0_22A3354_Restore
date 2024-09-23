uint64_t LiveSpeechError.description.getter()
{
  return sub_2409D1F94(19, 0xD000000000000011);
}

uint64_t LiveCaptionsError.message.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

LiveSpeechServices::LiveCaptionsError __swiftcall LiveCaptionsError.init(_:)(LiveSpeechServices::LiveCaptionsError result)
{
  LiveSpeechServices::LiveCaptionsError *v1;

  *v1 = result;
  return result;
}

uint64_t LiveCaptionsError.description.getter()
{
  return sub_2409D1F94(21, 0xD000000000000013);
}

uint64_t sub_2409D1F94(uint64_t a1, uint64_t a2)
{
  sub_2409D8400();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_2409D8358();
  swift_bridgeObjectRelease();
  return a2;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

ValueMetadata *type metadata accessor for LiveSpeechError()
{
  return &type metadata for LiveSpeechError;
}

_QWORD *initializeBufferWithCopyOfBuffer for LiveCaptionsError(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for LiveCaptionsError()
{
  return swift_bridgeObjectRelease();
}

_QWORD *_s18LiveSpeechServices15LiveSpeechErrorVwca_0(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_QWORD *assignWithTake for LiveCaptionsError(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s18LiveSpeechServices15LiveSpeechErrorVwet_0(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 16))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t sub_2409D2128(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    if (a3 < 0)
      *(_BYTE *)(result + 16) = 1;
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
    *(_BYTE *)(result + 16) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for LiveCaptionsError()
{
  return &type metadata for LiveCaptionsError;
}

uint64_t sub_2409D2188(uint64_t a1)
{
  return sub_2409D249C(a1, qword_2543567C8);
}

uint64_t LiveSpeechLog.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_2409D22B4(&qword_2543567E0, (uint64_t)qword_2543567C8, a1);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t LiveSpeechLog.setter(uint64_t a1)
{
  return sub_2409D2358(a1, &qword_2543567E0, (uint64_t)qword_2543567C8);
}

uint64_t (*LiveSpeechLog.modify())()
{
  uint64_t v0;

  if (qword_2543567E0 != -1)
    swift_once();
  v0 = sub_2409D82C8();
  __swift_project_value_buffer(v0, (uint64_t)qword_2543567C8);
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_2409D2274(uint64_t a1)
{
  return sub_2409D249C(a1, qword_254356758);
}

uint64_t LiveCaptionsLog.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_2409D22B4(&qword_254356770, (uint64_t)qword_254356758, a1);
}

uint64_t sub_2409D22B4@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;

  if (*a1 != -1)
    swift_once();
  v5 = sub_2409D82C8();
  v6 = __swift_project_value_buffer(v5, a2);
  swift_beginAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a3, v6, v5);
}

uint64_t LiveCaptionsLog.setter(uint64_t a1)
{
  return sub_2409D2358(a1, &qword_254356770, (uint64_t)qword_254356758);
}

uint64_t sub_2409D2358(uint64_t a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  if (*a2 != -1)
    swift_once();
  v5 = sub_2409D82C8();
  v6 = __swift_project_value_buffer(v5, a3);
  swift_beginAccess();
  v7 = *(_QWORD *)(v5 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 24))(v6, a1, v5);
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 8))(a1, v5);
}

uint64_t (*LiveCaptionsLog.modify())()
{
  uint64_t v0;

  if (qword_254356770 != -1)
    swift_once();
  v0 = sub_2409D82C8();
  __swift_project_value_buffer(v0, (uint64_t)qword_254356758);
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t sub_2409D2478(uint64_t a1)
{
  return sub_2409D249C(a1, qword_257078CC0);
}

uint64_t sub_2409D249C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_2409D82C8();
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  return sub_2409D82BC();
}

uint64_t LSLCCommonLog.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_2409D22B4(&qword_257078CB0, (uint64_t)qword_257078CC0, a1);
}

uint64_t LSLCCommonLog.setter(uint64_t a1)
{
  return sub_2409D2358(a1, &qword_257078CB0, (uint64_t)qword_257078CC0);
}

uint64_t (*LSLCCommonLog.modify())()
{
  uint64_t v0;

  if (qword_257078CB0 != -1)
    swift_once();
  v0 = sub_2409D82C8();
  __swift_project_value_buffer(v0, (uint64_t)qword_257078CC0);
  swift_beginAccess();
  return j_j__swift_endAccess;
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

LiveSpeechServices::LiveSpeechLiveCaptionsUIServiceMessageID_optional __swiftcall LiveSpeechLiveCaptionsUIServiceMessageID.init(rawValue:)(Swift::Int rawValue)
{
  _BYTE *v1;
  unint64_t v2;

  v2 = 0x302010004uLL >> (8 * rawValue);
  if ((unint64_t)rawValue >= 5)
    LOBYTE(v2) = 4;
  *v1 = v2;
  return (LiveSpeechServices::LiveSpeechLiveCaptionsUIServiceMessageID_optional)rawValue;
}

uint64_t LiveSpeechLiveCaptionsUIServiceMessageID.rawValue.getter()
{
  unsigned __int8 *v0;

  return *v0 + 1;
}

BOOL sub_2409D2638(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_2409D264C()
{
  sub_2409D84B4();
  sub_2409D84C0();
  return sub_2409D84CC();
}

uint64_t sub_2409D2690()
{
  return sub_2409D84C0();
}

uint64_t sub_2409D26BC()
{
  sub_2409D84B4();
  sub_2409D84C0();
  return sub_2409D84CC();
}

LiveSpeechServices::LiveSpeechLiveCaptionsUIServiceMessageID_optional sub_2409D26FC(Swift::Int *a1)
{
  return LiveSpeechLiveCaptionsUIServiceMessageID.init(rawValue:)(*a1);
}

void sub_2409D2704(_QWORD *a1@<X8>)
{
  unsigned __int8 *v1;

  *a1 = *v1 + 1;
}

id sub_2409D2714()
{
  id result;

  result = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for LiveSpeechCaptionsClient()), sel_init);
  qword_254356780 = (uint64_t)result;
  return result;
}

id static LiveSpeechCaptionsClient.shared.getter()
{
  if (qword_254356788 != -1)
    swift_once();
  return (id)qword_254356780;
}

id LiveSpeechCaptionsClient.__deallocating_deinit()
{
  void *v0;
  objc_class *ObjectType;
  objc_super v3;

  ObjectType = (objc_class *)swift_getObjectType();
  sub_2409D2864();
  v3.receiver = v0;
  v3.super_class = ObjectType;
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

void sub_2409D2864()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD aBlock[6];

  v1 = v0;
  v2 = sub_2409D82C8();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8]();
  v5 = (char *)&aBlock[-1] - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((*(_BYTE *)(v1 + OBJC_IVAR___LiveSpeechCaptionsClient_isLiveSpeechRunning) & 1) == 0
    && (*(_BYTE *)(v1 + OBJC_IVAR___LiveSpeechCaptionsClient_isLiveCaptionsRunning) & 1) == 0)
  {
    if (qword_2543567E0 != -1)
      swift_once();
    v6 = __swift_project_value_buffer(v2, (uint64_t)qword_2543567C8);
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v6, v2);
    v7 = sub_2409D82B0();
    v8 = sub_2409D83C4();
    if (os_log_type_enabled(v7, v8))
    {
      v9 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_2409D0000, v7, v8, "LiveSpeechLiveCaptionsClient clean up", v9, 2u);
      MEMORY[0x242686134](v9, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    v10 = swift_allocObject();
    v11 = OBJC_IVAR___LiveSpeechCaptionsClient__client;
    v12 = *(void **)(v1 + OBJC_IVAR___LiveSpeechCaptionsClient__client);
    *(_QWORD *)(v10 + 16) = v12;
    *(_QWORD *)(v1 + v11) = 0;
    if (v12)
    {
      aBlock[4] = sub_2409D59D8;
      aBlock[5] = v10;
      aBlock[0] = MEMORY[0x24BDAC760];
      aBlock[1] = 1107296256;
      aBlock[2] = sub_2409D48BC;
      aBlock[3] = &block_descriptor_33;
      v13 = _Block_copy(aBlock);
      v14 = v12;
      swift_retain();
      swift_release();
      objc_msgSend(v14, sel_invalidate_, v13);
      _Block_release(v13);
      swift_release();

    }
    else
    {
      swift_release();
    }
  }
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> LiveSpeechCaptionsClient.startLiveSpeech()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  id v17;
  uint64_t v18;
  void *v19;
  _QWORD aBlock[6];

  v1 = v0;
  v2 = sub_2409D82C8();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&aBlock[-1] - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&aBlock[-1] - v7;
  if (*(_BYTE *)(v1 + OBJC_IVAR___LiveSpeechCaptionsClient_isLiveSpeechRunning) == 1)
  {
    if (qword_2543567E0 != -1)
      swift_once();
    v9 = __swift_project_value_buffer(v2, (uint64_t)qword_2543567C8);
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v8, v9, v2);
    v10 = sub_2409D82B0();
    v11 = sub_2409D83C4();
    if (os_log_type_enabled(v10, v11))
    {
      v12 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_2409D0000, v10, v11, "Already running LiveSpeech, skip", v12, 2u);
      MEMORY[0x242686134](v12, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v3 + 8))(v8, v2);
  }
  else
  {
    *(_BYTE *)(v1 + OBJC_IVAR___LiveSpeechCaptionsClient_isLiveSpeechRunning) = 1;
    if (qword_2543567E0 != -1)
      swift_once();
    v13 = __swift_project_value_buffer(v2, (uint64_t)qword_2543567C8);
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v6, v13, v2);
    v14 = sub_2409D82B0();
    v15 = sub_2409D83C4();
    if (os_log_type_enabled(v14, v15))
    {
      v16 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v16 = 0;
      _os_log_impl(&dword_2409D0000, v14, v15, "Client requesting LiveSpeech start", v16, 2u);
      MEMORY[0x242686134](v16, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
    v17 = sub_2409D2E14();
    v18 = swift_allocObject();
    *(_QWORD *)(v18 + 16) = sub_2409D2FB0;
    *(_QWORD *)(v18 + 24) = 0;
    aBlock[4] = sub_2409D4F10;
    aBlock[5] = v18;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_2409D4F18;
    aBlock[3] = &block_descriptor;
    v19 = _Block_copy(aBlock);
    swift_release();
    objc_msgSend(v17, sel_sendAsynchronousMessage_withIdentifier_targetAccessQueue_completion_, 0, 1, 0, v19);
    _Block_release(v19);

  }
}

id sub_2409D2E14()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  uint64_t v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id result;
  void *v12;
  id v13;

  v1 = OBJC_IVAR___LiveSpeechCaptionsClient__client;
  v2 = *(void **)(v0 + OBJC_IVAR___LiveSpeechCaptionsClient__client);
  if (v2)
  {
    v3 = *(id *)(v0 + OBJC_IVAR___LiveSpeechCaptionsClient__client);
LABEL_6:
    v13 = v2;
    return v3;
  }
  v4 = v0;
  sub_2409D8400();
  swift_bridgeObjectRelease();
  v5 = objc_msgSend((id)objc_opt_self(), sel_processInfo);
  objc_msgSend(v5, sel_processIdentifier);

  sub_2409D8460();
  sub_2409D8358();
  swift_bridgeObjectRelease();
  v6 = objc_allocWithZone(MEMORY[0x24BDFF8F0]);
  v7 = (void *)sub_2409D8328();
  swift_bridgeObjectRelease();
  v8 = (void *)sub_2409D8328();
  v9 = objc_msgSend(v6, sel_initWithIdentifier_serviceBundleName_, v7, v8);

  v10 = *(void **)(v4 + v1);
  *(_QWORD *)(v4 + v1) = v9;

  result = *(id *)(v4 + v1);
  if (result)
  {
    result = objc_msgSend(result, sel_setDelegate_, v4);
    v12 = *(void **)(v4 + v1);
    if (v12)
    {
      v3 = v12;
      v2 = 0;
      goto LABEL_6;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_2409D2FB0(void *a1, char a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  id v15;
  uint64_t v16;
  id v17;
  id v18;
  NSObject *v19;
  os_log_type_t v20;
  uint8_t *v21;
  _QWORD *v22;
  _QWORD *v23;
  id v24;
  uint64_t v25;
  _QWORD v27[3];

  v4 = sub_2409D82C8();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v8 = (char *)v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)v27 - v9;
  if ((a2 & 1) != 0)
  {
    v15 = a1;
    if (qword_2543567E0 != -1)
      swift_once();
    v16 = __swift_project_value_buffer(v4, (uint64_t)qword_2543567C8);
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v8, v16, v4);
    v17 = a1;
    v18 = a1;
    v19 = sub_2409D82B0();
    v20 = sub_2409D83B8();
    if (os_log_type_enabled(v19, v20))
    {
      v21 = (uint8_t *)swift_slowAlloc();
      v22 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v21 = 138412290;
      v27[1] = v21 + 4;
      sub_2409D5974();
      swift_allocError();
      *v23 = a1;
      v24 = a1;
      v25 = _swift_stdlib_bridgeErrorToNSError();
      v27[2] = v25;
      sub_2409D83D0();
      *v22 = v25;
      sub_2409D5968(a1, 1);
      sub_2409D5968(a1, 1);
      _os_log_impl(&dword_2409D0000, v19, v20, "Failed to start LiveSpeech: %@", v21, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_257078D78);
      swift_arrayDestroy();
      MEMORY[0x242686134](v22, -1, -1);
      MEMORY[0x242686134](v21, -1, -1);

      sub_2409D5968(a1, 1);
    }
    else
    {
      sub_2409D5968(a1, 1);
      sub_2409D5968(a1, 1);

    }
    v10 = v8;
  }
  else
  {
    if (qword_2543567E0 != -1)
      swift_once();
    v11 = __swift_project_value_buffer(v4, (uint64_t)qword_2543567C8);
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v10, v11, v4);
    v12 = sub_2409D82B0();
    v13 = sub_2409D83C4();
    if (os_log_type_enabled(v12, v13))
    {
      v14 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_2409D0000, v12, v13, "Client received LiveSpeech start success callback", v14, 2u);
      MEMORY[0x242686134](v14, -1, -1);
    }

  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v10, v4);
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> LiveSpeechCaptionsClient.stopLiveSpeech()()
{
  _BYTE *v0;
  _BYTE *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  _BYTE *v17;
  uint64_t v18;
  NSObject *v19;
  os_log_type_t v20;
  uint8_t *v21;
  _QWORD aBlock[6];

  v1 = v0;
  v2 = sub_2409D82C8();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&aBlock[-1] - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&aBlock[-1] - v7;
  if ((v1[OBJC_IVAR___LiveSpeechCaptionsClient_isLiveSpeechRunning] & 1) != 0)
  {
    v1[OBJC_IVAR___LiveSpeechCaptionsClient_isLiveSpeechRunning] = 0;
    if (qword_2543567E0 != -1)
      swift_once();
    v9 = __swift_project_value_buffer(v2, (uint64_t)qword_2543567C8);
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v6, v9, v2);
    v10 = sub_2409D82B0();
    v11 = sub_2409D83C4();
    if (os_log_type_enabled(v10, v11))
    {
      v12 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_2409D0000, v10, v11, "Client requesting LiveSpeech stop", v12, 2u);
      MEMORY[0x242686134](v12, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
    v13 = sub_2409D2E14();
    v14 = swift_allocObject();
    *(_QWORD *)(v14 + 16) = v1;
    v15 = swift_allocObject();
    *(_QWORD *)(v15 + 16) = sub_2409D4FC4;
    *(_QWORD *)(v15 + 24) = v14;
    aBlock[4] = sub_2409D5B58;
    aBlock[5] = v15;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_2409D4F18;
    aBlock[3] = &block_descriptor_10;
    v16 = _Block_copy(aBlock);
    v17 = v1;
    swift_retain();
    swift_release();
    objc_msgSend(v13, sel_sendAsynchronousMessage_withIdentifier_targetAccessQueue_completion_, 0, 2, 0, v16);
    _Block_release(v16);
    swift_release();

  }
  else
  {
    if (qword_2543567E0 != -1)
      swift_once();
    v18 = __swift_project_value_buffer(v2, (uint64_t)qword_2543567C8);
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v8, v18, v2);
    v19 = sub_2409D82B0();
    v20 = sub_2409D83C4();
    if (os_log_type_enabled(v19, v20))
    {
      v21 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v21 = 0;
      _os_log_impl(&dword_2409D0000, v19, v20, "Can't stop LiveSpeech, not running", v21, 2u);
      MEMORY[0x242686134](v21, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v3 + 8))(v8, v2);
  }
}

void sub_2409D3694(void *a1, char a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  id v15;
  uint64_t v16;
  id v17;
  id v18;
  NSObject *v19;
  os_log_type_t v20;
  uint8_t *v21;
  _QWORD *v22;
  _QWORD *v23;
  id v24;
  uint64_t v25;
  _QWORD v26[3];

  v4 = sub_2409D82C8();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)v26 - v9;
  if ((a2 & 1) != 0)
  {
    v15 = a1;
    if (qword_2543567E0 != -1)
      swift_once();
    v16 = __swift_project_value_buffer(v4, (uint64_t)qword_2543567C8);
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v8, v16, v4);
    v17 = a1;
    v18 = a1;
    v19 = sub_2409D82B0();
    v20 = sub_2409D83B8();
    if (os_log_type_enabled(v19, v20))
    {
      v21 = (uint8_t *)swift_slowAlloc();
      v22 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v21 = 138412290;
      v26[1] = v21 + 4;
      sub_2409D5974();
      swift_allocError();
      *v23 = a1;
      v24 = a1;
      v25 = _swift_stdlib_bridgeErrorToNSError();
      v26[2] = v25;
      sub_2409D83D0();
      *v22 = v25;
      sub_2409D5968(a1, 1);
      sub_2409D5968(a1, 1);
      _os_log_impl(&dword_2409D0000, v19, v20, "Failed to stop LiveSpeech: %@", v21, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_257078D78);
      swift_arrayDestroy();
      MEMORY[0x242686134](v22, -1, -1);
      MEMORY[0x242686134](v21, -1, -1);

      sub_2409D5968(a1, 1);
    }
    else
    {
      sub_2409D5968(a1, 1);
      sub_2409D5968(a1, 1);

    }
    (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
  }
  else
  {
    if (qword_2543567E0 != -1)
      swift_once();
    v11 = __swift_project_value_buffer(v4, (uint64_t)qword_2543567C8);
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v10, v11, v4);
    v12 = sub_2409D82B0();
    v13 = sub_2409D83C4();
    if (os_log_type_enabled(v12, v13))
    {
      v14 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_2409D0000, v12, v13, "Client received LiveSpeech stop success callback", v14, 2u);
      MEMORY[0x242686134](v14, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v4);
    sub_2409D2864();
  }
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> LiveSpeechCaptionsClient.startLiveCaptions()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  id v17;
  uint64_t v18;
  void *v19;
  _QWORD aBlock[6];

  v1 = v0;
  v2 = sub_2409D82C8();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&aBlock[-1] - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&aBlock[-1] - v7;
  if (*(_BYTE *)(v1 + OBJC_IVAR___LiveSpeechCaptionsClient_isLiveCaptionsRunning) == 1)
  {
    if (qword_254356770 != -1)
      swift_once();
    v9 = __swift_project_value_buffer(v2, (uint64_t)qword_254356758);
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v8, v9, v2);
    v10 = sub_2409D82B0();
    v11 = sub_2409D83C4();
    if (os_log_type_enabled(v10, v11))
    {
      v12 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_2409D0000, v10, v11, "Already running LiveCaptions, skip", v12, 2u);
      MEMORY[0x242686134](v12, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v3 + 8))(v8, v2);
  }
  else
  {
    *(_BYTE *)(v1 + OBJC_IVAR___LiveSpeechCaptionsClient_isLiveCaptionsRunning) = 1;
    if (qword_254356770 != -1)
      swift_once();
    v13 = __swift_project_value_buffer(v2, (uint64_t)qword_254356758);
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v6, v13, v2);
    v14 = sub_2409D82B0();
    v15 = sub_2409D83C4();
    if (os_log_type_enabled(v14, v15))
    {
      v16 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v16 = 0;
      _os_log_impl(&dword_2409D0000, v14, v15, "Client requesting LiveCaptions start", v16, 2u);
      MEMORY[0x242686134](v16, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
    v17 = sub_2409D2E14();
    v18 = swift_allocObject();
    *(_QWORD *)(v18 + 16) = sub_2409D3D64;
    *(_QWORD *)(v18 + 24) = 0;
    aBlock[4] = sub_2409D5B58;
    aBlock[5] = v18;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_2409D4F18;
    aBlock[3] = &block_descriptor_17;
    v19 = _Block_copy(aBlock);
    swift_release();
    objc_msgSend(v17, sel_sendAsynchronousMessage_withIdentifier_targetAccessQueue_completion_, 0, 3, 0, v19);
    _Block_release(v19);

  }
}

uint64_t sub_2409D3D64(void *a1, char a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  id v15;
  uint64_t v16;
  id v17;
  id v18;
  NSObject *v19;
  os_log_type_t v20;
  uint8_t *v21;
  _QWORD *v22;
  _QWORD *v23;
  id v24;
  uint64_t v25;
  _QWORD v27[3];

  v4 = sub_2409D82C8();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)v27 - v9;
  if ((a2 & 1) != 0)
  {
    v15 = a1;
    if (qword_254356770 != -1)
      swift_once();
    v16 = __swift_project_value_buffer(v4, (uint64_t)qword_254356758);
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v8, v16, v4);
    v17 = a1;
    v18 = a1;
    v19 = sub_2409D82B0();
    v20 = sub_2409D83B8();
    if (os_log_type_enabled(v19, v20))
    {
      v21 = (uint8_t *)swift_slowAlloc();
      v22 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v21 = 138412290;
      v27[1] = v21 + 4;
      sub_2409D5974();
      swift_allocError();
      *v23 = a1;
      v24 = a1;
      v25 = _swift_stdlib_bridgeErrorToNSError();
      v27[2] = v25;
      sub_2409D83D0();
      *v22 = v25;
      sub_2409D5968(a1, 1);
      sub_2409D5968(a1, 1);
      _os_log_impl(&dword_2409D0000, v19, v20, "Failed to start LiveCaptions: %@", v21, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_257078D78);
      swift_arrayDestroy();
      MEMORY[0x242686134](v22, -1, -1);
      MEMORY[0x242686134](v21, -1, -1);

      sub_2409D5968(a1, 1);
    }
    else
    {
      sub_2409D5968(a1, 1);
      sub_2409D5968(a1, 1);

    }
    v10 = v8;
  }
  else
  {
    if (qword_254356770 != -1)
      swift_once();
    v11 = __swift_project_value_buffer(v4, (uint64_t)qword_254356758);
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v10, v11, v4);
    v12 = sub_2409D82B0();
    v13 = sub_2409D83C4();
    if (os_log_type_enabled(v12, v13))
    {
      v14 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_2409D0000, v12, v13, "Client received LiveCaptions start success callback", v14, 2u);
      MEMORY[0x242686134](v14, -1, -1);
    }

  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v10, v4);
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> LiveSpeechCaptionsClient.stopLiveCaptions()()
{
  _BYTE *v0;
  _BYTE *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  _BYTE *v17;
  uint64_t v18;
  NSObject *v19;
  os_log_type_t v20;
  uint8_t *v21;
  _QWORD aBlock[6];

  v1 = v0;
  v2 = sub_2409D82C8();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&aBlock[-1] - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&aBlock[-1] - v7;
  if ((v1[OBJC_IVAR___LiveSpeechCaptionsClient_isLiveCaptionsRunning] & 1) != 0)
  {
    v1[OBJC_IVAR___LiveSpeechCaptionsClient_isLiveCaptionsRunning] = 0;
    if (qword_254356770 != -1)
      swift_once();
    v9 = __swift_project_value_buffer(v2, (uint64_t)qword_254356758);
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v6, v9, v2);
    v10 = sub_2409D82B0();
    v11 = sub_2409D83C4();
    if (os_log_type_enabled(v10, v11))
    {
      v12 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_2409D0000, v10, v11, "Client requesting LiveCaptions stop", v12, 2u);
      MEMORY[0x242686134](v12, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
    v13 = sub_2409D2E14();
    v14 = swift_allocObject();
    *(_QWORD *)(v14 + 16) = v1;
    v15 = swift_allocObject();
    *(_QWORD *)(v15 + 16) = sub_2409D4FFC;
    *(_QWORD *)(v15 + 24) = v14;
    aBlock[4] = sub_2409D5B58;
    aBlock[5] = v15;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_2409D4F18;
    aBlock[3] = &block_descriptor_27;
    v16 = _Block_copy(aBlock);
    v17 = v1;
    swift_retain();
    swift_release();
    objc_msgSend(v13, sel_sendAsynchronousMessage_withIdentifier_targetAccessQueue_completion_, 0, 4, 0, v16);
    _Block_release(v16);
    swift_release();

  }
  else
  {
    if (qword_254356770 != -1)
      swift_once();
    v18 = __swift_project_value_buffer(v2, (uint64_t)qword_254356758);
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v8, v18, v2);
    v19 = sub_2409D82B0();
    v20 = sub_2409D83C4();
    if (os_log_type_enabled(v19, v20))
    {
      v21 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v21 = 0;
      _os_log_impl(&dword_2409D0000, v19, v20, "Can't stop LiveCaptions, not running", v21, 2u);
      MEMORY[0x242686134](v21, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v3 + 8))(v8, v2);
  }
}

void sub_2409D4448(void *a1, char a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  id v15;
  uint64_t v16;
  id v17;
  id v18;
  NSObject *v19;
  os_log_type_t v20;
  uint8_t *v21;
  _QWORD *v22;
  _QWORD *v23;
  id v24;
  uint64_t v25;
  _QWORD v26[3];

  v4 = sub_2409D82C8();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)v26 - v9;
  if ((a2 & 1) != 0)
  {
    v15 = a1;
    if (qword_254356770 != -1)
      swift_once();
    v16 = __swift_project_value_buffer(v4, (uint64_t)qword_254356758);
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v8, v16, v4);
    v17 = a1;
    v18 = a1;
    v19 = sub_2409D82B0();
    v20 = sub_2409D83B8();
    if (os_log_type_enabled(v19, v20))
    {
      v21 = (uint8_t *)swift_slowAlloc();
      v22 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v21 = 138412290;
      v26[1] = v21 + 4;
      sub_2409D5974();
      swift_allocError();
      *v23 = a1;
      v24 = a1;
      v25 = _swift_stdlib_bridgeErrorToNSError();
      v26[2] = v25;
      sub_2409D83D0();
      *v22 = v25;
      sub_2409D5968(a1, 1);
      sub_2409D5968(a1, 1);
      _os_log_impl(&dword_2409D0000, v19, v20, "Failed to stop LiveCaptions: %@", v21, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_257078D78);
      swift_arrayDestroy();
      MEMORY[0x242686134](v22, -1, -1);
      MEMORY[0x242686134](v21, -1, -1);

      sub_2409D5968(a1, 1);
    }
    else
    {
      sub_2409D5968(a1, 1);
      sub_2409D5968(a1, 1);

    }
    (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
  }
  else
  {
    if (qword_254356770 != -1)
      swift_once();
    v11 = __swift_project_value_buffer(v4, (uint64_t)qword_254356758);
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v10, v11, v4);
    v12 = sub_2409D82B0();
    v13 = sub_2409D83C4();
    if (os_log_type_enabled(v12, v13))
    {
      v14 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_2409D0000, v12, v13, "Client received LiveCaptions stop success callback", v14, 2u);
      MEMORY[0x242686134](v14, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v4);
    sub_2409D2864();
  }
}

unint64_t LiveSpeechCaptionsClient.serviceName.getter()
{
  return 0xD000000000000013;
}

void sub_2409D4848(uint64_t a1)
{
  void **v2;
  void *v3;
  void *v4;

  v2 = (void **)(a1 + 16);
  swift_beginAccess();
  v3 = *(void **)(a1 + 16);
  if (v3)
    objc_msgSend(v3, sel_setDelegate_, 0);
  swift_beginAccess();
  v4 = *v2;
  *v2 = 0;

}

uint64_t sub_2409D48BC(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

id LiveSpeechCaptionsClient.userInterfaceClient(_:accessQueueForProcessingMessageWithIdentifier:)()
{
  return objc_msgSend((id)objc_opt_self(), sel_mainAccessQueue);
}

void LiveSpeechCaptionsClient.connectionWithServiceWasInterrupted(forUserInterfaceClient:)(uint64_t a1)
{
  uint8_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  void (*v16)(char *, uint64_t, uint64_t);
  void (*v17)(char *, uint64_t, uint64_t);
  NSObject *v18;
  os_log_type_t v19;
  char *v20;
  uint8_t *v21;
  uint8_t *v22;
  void (*v23)(char *, uint64_t);
  int v24;
  void (*v25)(char *, uint64_t, uint64_t);
  uint64_t v26;
  NSObject *v27;
  os_log_type_t v28;
  uint8_t *v29;
  void *v30;
  id v31;
  id v32;
  NSObject *v33;
  os_log_type_t v34;
  uint8_t *v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  uint8_t *v40;
  uint64_t v41;
  uint64_t v42;

  v3 = sub_2409D82C8();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)&v39 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = MEMORY[0x24BDAC7A8](v5);
  v10 = (char *)&v39 - v9;
  MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v39 - v11;
  v13 = *(_QWORD *)&v1[OBJC_IVAR___LiveSpeechCaptionsClient__client];
  if (a1)
  {
    if (v13)
      v14 = a1 == v13;
    else
      v14 = 0;
    if (!v14)
      return;
  }
  else if (v13)
  {
    return;
  }
  v40 = v1;
  if (qword_2543567E0 != -1)
    swift_once();
  v15 = __swift_project_value_buffer(v3, (uint64_t)qword_2543567C8);
  swift_beginAccess();
  v16 = *(void (**)(char *, uint64_t, uint64_t))(v4 + 16);
  v39 = v15;
  v17 = v16;
  v16(v12, v15, v3);
  v18 = sub_2409D82B0();
  v19 = sub_2409D83B8();
  if (os_log_type_enabled(v18, v19))
  {
    v20 = v7;
    v21 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v21 = 0;
    _os_log_impl(&dword_2409D0000, v18, v19, "Connection to LiveSpeech UI Service was interrupted", v21, 2u);
    v22 = v21;
    v7 = v20;
    MEMORY[0x242686134](v22, -1, -1);
  }

  v23 = *(void (**)(char *, uint64_t))(v4 + 8);
  v23(v12, v3);
  v24 = _AXSLiveSpeechEnabled();
  v25 = v17;
  v26 = v39;
  if (v24)
  {
    v25(v10, v39, v3);
    v27 = sub_2409D82B0();
    v28 = sub_2409D83AC();
    if (os_log_type_enabled(v27, v28))
    {
      v29 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v29 = 0;
      _os_log_impl(&dword_2409D0000, v27, v28, "LiveSpeech still enabled. Will attempt to relaunch", v29, 2u);
      MEMORY[0x242686134](v29, -1, -1);
    }

    v23(v10, v3);
    LiveSpeechCaptionsClient.startLiveSpeech()();
    if (v30)
    {
      v25(v7, v26, v3);
      v31 = v30;
      v32 = v30;
      v33 = sub_2409D82B0();
      v34 = sub_2409D83B8();
      if (os_log_type_enabled(v33, v34))
      {
        v35 = (uint8_t *)swift_slowAlloc();
        v36 = swift_slowAlloc();
        v42 = v36;
        *(_DWORD *)v35 = 136315138;
        v40 = v35 + 4;
        swift_getErrorValue();
        v37 = sub_2409D8478();
        v41 = sub_2409D5038(v37, v38, &v42);
        sub_2409D83D0();
        swift_bridgeObjectRelease();

        _os_log_impl(&dword_2409D0000, v33, v34, "Error occurred relaunching LiveSpeech Service: %s", v35, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x242686134](v36, -1, -1);
        MEMORY[0x242686134](v35, -1, -1);

      }
      else
      {

      }
      v23(v7, v3);
    }
  }
}

uint64_t sub_2409D4D90(void *a1)
{
  id v2;

  v2 = a1;
  sub_2409D8358();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_257078D80);
  sub_2409D8424();

  return 0;
}

uint64_t sub_2409D4E20()
{
  void **v0;

  return sub_2409D4D90(*v0);
}

uint64_t sub_2409D4E34(uint64_t result, void *a2, void (*a3)(void *, uint64_t))
{
  id v5;
  unint64_t v6;
  unint64_t v7;

  if (a3)
  {
    if (a2)
    {
      sub_2409D59C8((uint64_t)a3);
      v5 = a2;
      a3(a2, 1);

      return sub_2409D59B8((uint64_t)a3);
    }
    else
    {
      v6 = result;
      if (result)
      {
        swift_retain();
        v7 = v6;
      }
      else
      {
        swift_retain();
        v7 = sub_2409D5B5C(MEMORY[0x24BEE4AF8]);
      }
      swift_bridgeObjectRetain();
      a3((void *)v7, 0);
      sub_2409D59B8((uint64_t)a3);
      return swift_bridgeObjectRelease();
    }
  }
  return result;
}

uint64_t sub_2409D4F10(uint64_t a1, void *a2)
{
  uint64_t v2;

  return sub_2409D4E34(a1, a2, *(void (**)(void *, uint64_t))(v2 + 16));
}

uint64_t sub_2409D4F18(uint64_t a1, uint64_t a2, void *a3)
{
  void (*v4)(uint64_t, void *);
  uint64_t v5;
  id v6;

  v4 = *(void (**)(uint64_t, void *))(a1 + 32);
  if (a2)
    v5 = sub_2409D831C();
  else
    v5 = 0;
  swift_retain();
  v6 = a3;
  v4(v5, a3);
  swift_release();

  return swift_bridgeObjectRelease();
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

void sub_2409D4FC4(void *a1, char a2)
{
  sub_2409D3694(a1, a2 & 1);
}

uint64_t sub_2409D4FD8()
{
  uint64_t v0;

  return swift_deallocObject();
}

void sub_2409D4FFC(void *a1, char a2)
{
  sub_2409D4448(a1, a2 & 1);
}

uint64_t objectdestroyTm()
{
  uint64_t v0;

  if (*(_QWORD *)(v0 + 16))
    swift_release();
  return swift_deallocObject();
}

uint64_t sub_2409D5038(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_2409D5358(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_2409D5530((uint64_t)v12, *a3);
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
      sub_2409D5530((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

unint64_t sub_2409D510C()
{
  unint64_t result;

  result = qword_257078CF0;
  if (!qword_257078CF0)
  {
    result = MEMORY[0x2426860E0](&protocol conformance descriptor for LiveSpeechLiveCaptionsUIServiceMessageID, &type metadata for LiveSpeechLiveCaptionsUIServiceMessageID);
    atomic_store(result, (unint64_t *)&qword_257078CF0);
  }
  return result;
}

unint64_t sub_2409D5150(uint64_t a1)
{
  unint64_t result;

  result = sub_2409D5174();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t sub_2409D5174()
{
  unint64_t result;

  result = qword_257078CF8;
  if (!qword_257078CF8)
  {
    result = MEMORY[0x2426860E0](&protocol conformance descriptor for LiveSpeechLiveCaptionsUIServiceMessageID, &type metadata for LiveSpeechLiveCaptionsUIServiceMessageID);
    atomic_store(result, (unint64_t *)&qword_257078CF8);
  }
  return result;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for LiveSpeechLiveCaptionsUIServiceMessageID(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for LiveSpeechLiveCaptionsUIServiceMessageID(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2409D52A4 + 4 * byte_2409D8B65[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_2409D52D8 + 4 * byte_2409D8B60[v4]))();
}

uint64_t sub_2409D52D8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2409D52E0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2409D52E8);
  return result;
}

uint64_t sub_2409D52F4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2409D52FCLL);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_2409D5300(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2409D5308(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2409D5314(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_2409D5320(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for LiveSpeechLiveCaptionsUIServiceMessageID()
{
  return &type metadata for LiveSpeechLiveCaptionsUIServiceMessageID;
}

uint64_t type metadata accessor for LiveSpeechCaptionsClient()
{
  return objc_opt_self();
}

uint64_t sub_2409D5358(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_2409D83DC();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_2409D556C(a5, a6);
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
  v8 = sub_2409D8418();
  if (!v8)
  {
    sub_2409D8430();
    __break(1u);
LABEL_17:
    result = sub_2409D8448();
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

uint64_t __swift_destroy_boxed_opaque_existential_0(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_2409D5530(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_2409D556C(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_2409D5600(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_2409D57D8(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_2409D57D8(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_2409D5600(uint64_t a1, unint64_t a2)
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
      v3 = sub_2409D5774(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_2409D840C();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_2409D8430();
      __break(1u);
LABEL_10:
      v2 = sub_2409D8364();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_2409D8448();
    __break(1u);
LABEL_14:
    result = sub_2409D8430();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_2409D5774(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_257078D68);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_2409D57D8(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_257078D68);
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
  result = sub_2409D8448();
  __break(1u);
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2426860D4]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

void sub_2409D5968(id a1, char a2)
{
  if ((a2 & 1) != 0)

  else
    swift_bridgeObjectRelease();
}

unint64_t sub_2409D5974()
{
  unint64_t result;

  result = qword_257078D70;
  if (!qword_257078D70)
  {
    result = MEMORY[0x2426860E0](&unk_2409D8D48, &type metadata for AXUIError);
    atomic_store(result, (unint64_t *)&qword_257078D70);
  }
  return result;
}

uint64_t sub_2409D59B8(uint64_t result)
{
  if (result)
    return swift_release();
  return result;
}

uint64_t sub_2409D59C8(uint64_t result)
{
  if (result)
    return swift_retain();
  return result;
}

void sub_2409D59D8()
{
  uint64_t v0;

  sub_2409D4848(v0);
}

_QWORD *initializeBufferWithCopyOfBuffer for AXUIError(_QWORD *a1, id *a2)
{
  id v3;
  id v4;

  v3 = *a2;
  v4 = *a2;
  *a1 = v3;
  return a1;
}

void destroy for AXUIError(id *a1)
{

}

void **assignWithCopy for AXUIError(void **a1, id *a2)
{
  id v3;
  id v4;
  void *v5;

  v3 = *a2;
  v4 = *a2;
  v5 = *a1;
  *a1 = v3;

  return a1;
}

_QWORD *__swift_memcpy8_8(_QWORD *result, _QWORD *a2)
{
  *result = *a2;
  return result;
}

void **assignWithTake for AXUIError(void **a1, void **a2)
{
  void *v3;

  v3 = *a1;
  *a1 = *a2;

  return a1;
}

uint64_t getEnumTagSinglePayload for AXUIError(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 8))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AXUIError(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 8) = 1;
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
    *(_BYTE *)(result + 8) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

uint64_t sub_2409D5B10()
{
  return 0;
}

ValueMetadata *type metadata accessor for AXUIError()
{
  return &type metadata for AXUIError;
}

unint64_t sub_2409D5B5C(uint64_t a1)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_257078E08);
  v2 = sub_2409D843C();
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
    sub_2409D6198(v6, (uint64_t)v15);
    result = sub_2409D79F0((uint64_t)v15);
    if ((v8 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v9 = v3[6] + 40 * result;
    v10 = v15[0];
    v11 = v15[1];
    *(_QWORD *)(v9 + 32) = v16;
    *(_OWORD *)v9 = v10;
    *(_OWORD *)(v9 + 16) = v11;
    result = (unint64_t)sub_2409D61E0(&v17, (_OWORD *)(v3[7] + 32 * result));
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

unint64_t sub_2409D5C88(uint64_t a1)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_257078E00);
  v2 = (_QWORD *)sub_2409D843C();
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
    result = sub_2409D7A20(v5, v6);
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

void static LiveSpeechAnalytics.didSpeak(inputMode:mixToUplink:voiceName:language:)(char *a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  char v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  _QWORD v16[6];

  v11 = *a1;
  v12 = (void *)sub_2409D8328();
  v13 = swift_allocObject();
  *(_BYTE *)(v13 + 16) = v11;
  *(_BYTE *)(v13 + 17) = a2;
  *(_QWORD *)(v13 + 24) = a3;
  *(_QWORD *)(v13 + 32) = a4;
  *(_QWORD *)(v13 + 40) = a5;
  *(_QWORD *)(v13 + 48) = a6;
  v14 = swift_allocObject();
  *(_QWORD *)(v14 + 16) = sub_2409D6068;
  *(_QWORD *)(v14 + 24) = v13;
  v16[4] = sub_2409D60A0;
  v16[5] = v14;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 1107296256;
  v16[2] = sub_2409D60C0;
  v16[3] = &block_descriptor_0;
  v15 = _Block_copy(v16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_release();
  AnalyticsSendEventLazy();
  _Block_release(v15);

}

unint64_t sub_2409D5ED0()
{
  uint64_t inited;
  uint64_t v1;

  __swift_instantiateConcreteTypeFromMangledName(&qword_257078DF8);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_2409D8D90;
  *(_QWORD *)(inited + 32) = 0x7079547475706E69;
  *(_QWORD *)(inited + 40) = 0xE900000000000065;
  v1 = sub_2409D8328();
  swift_bridgeObjectRelease();
  *(_QWORD *)(inited + 48) = v1;
  *(_QWORD *)(inited + 56) = 0x6C70556F5478696DLL;
  *(_QWORD *)(inited + 64) = 0xEB000000006B6E69;
  *(_QWORD *)(inited + 72) = sub_2409D83A0();
  *(_QWORD *)(inited + 80) = 0x6D614E6563696F76;
  *(_QWORD *)(inited + 88) = 0xE900000000000065;
  *(_QWORD *)(inited + 96) = sub_2409D8328();
  *(_QWORD *)(inited + 104) = 0x65676175676E616CLL;
  *(_QWORD *)(inited + 112) = 0xE800000000000000;
  *(_QWORD *)(inited + 120) = sub_2409D8328();
  return sub_2409D5C88(inited);
}

uint64_t sub_2409D603C()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

unint64_t sub_2409D6068()
{
  return sub_2409D5ED0();
}

uint64_t sub_2409D607C()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2409D60A0()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

id sub_2409D60C0(uint64_t a1)
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
    sub_2409D615C();
    v4 = (void *)sub_2409D8310();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }
  return v4;
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

ValueMetadata *type metadata accessor for LiveSpeechAnalytics()
{
  return &type metadata for LiveSpeechAnalytics;
}

unint64_t sub_2409D615C()
{
  unint64_t result;

  result = qword_257078DF0;
  if (!qword_257078DF0)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_257078DF0);
  }
  return result;
}

uint64_t sub_2409D6198(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_257078E10);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

_OWORD *sub_2409D61E0(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

void sub_2409D61F0()
{
  void *v0;
  id v1;

  v0 = (void *)sub_2409D8328();
  v1 = objc_msgSend((id)objc_opt_self(), sel_bundleWithIdentifier_, v0);

  qword_257078E18 = (uint64_t)v1;
}

uint64_t _s18LiveSpeechServices0abC9LocStringyS2SF_0(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  if (qword_257078CB8 != -1)
    swift_once();
  if (qword_257078E18)
  {
    v2 = (id)qword_257078E18;
    v3 = (void *)sub_2409D8328();
    v4 = (void *)sub_2409D8328();
    v5 = (void *)sub_2409D8328();
    v6 = objc_msgSend(v2, sel_localizedStringForKey_value_table_, v3, v4, v5);

    a1 = sub_2409D8334();
  }
  else
  {
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_2409D6378(char a1, char a2)
{
  BOOL v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  char v7;

  v2 = (a1 & 1) == 0;
  if ((a1 & 1) != 0)
    v3 = 0x657469726F766166;
  else
    v3 = 0x6472616F6279656BLL;
  if (v2)
    v4 = 0xE800000000000000;
  else
    v4 = 0xEF73657361726850;
  if ((a2 & 1) != 0)
    v5 = 0x657469726F766166;
  else
    v5 = 0x6472616F6279656BLL;
  if ((a2 & 1) != 0)
    v6 = 0xEF73657361726850;
  else
    v6 = 0xE800000000000000;
  if (v3 == v5 && v4 == v6)
    v7 = 1;
  else
    v7 = sub_2409D846C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_2409D6424()
{
  sub_2409D84B4();
  sub_2409D834C();
  swift_bridgeObjectRelease();
  return sub_2409D84CC();
}

uint64_t sub_2409D64B0()
{
  sub_2409D834C();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2409D6514()
{
  sub_2409D84B4();
  sub_2409D834C();
  swift_bridgeObjectRelease();
  return sub_2409D84CC();
}

uint64_t LiveSpeechInputMode.rawValue.getter()
{
  _BYTE *v0;

  if (*v0)
    return 0x657469726F766166;
  else
    return 0x6472616F6279656BLL;
}

uint64_t LiveSpeechInputMode.title.getter()
{
  _BYTE *v0;
  uint64_t v1;
  id v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v1 = 0xD000000000000011;
  if ((*v0 & 1) != 0)
  {
    if (qword_257078CB8 != -1)
      swift_once();
    if (qword_257078E18)
    {
LABEL_9:
      v2 = (id)qword_257078E18;
      v3 = (void *)sub_2409D8328();
      v4 = (void *)sub_2409D8328();
      v5 = (void *)sub_2409D8328();
      v6 = objc_msgSend(v2, sel_localizedStringForKey_value_table_, v3, v4, v5);

      v1 = sub_2409D8334();
    }
  }
  else
  {
    if (qword_257078CB8 != -1)
      swift_once();
    v1 = 0xD000000000000012;
    if (qword_257078E18)
      goto LABEL_9;
  }
  return v1;
}

uint64_t LiveSpeechInputMode.systemImageName.getter()
{
  _BYTE *v0;

  if (*v0)
    return 0x6B72616D6B6F6F62;
  else
    return 0x6472616F6279656BLL;
}

LiveSpeechServices::LiveSpeechInputMode_optional __swiftcall LiveSpeechInputMode.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  uint64_t v3;
  LiveSpeechServices::LiveSpeechInputMode_optional result;
  char v5;

  v2 = v1;
  v3 = sub_2409D8454();
  result.value = swift_bridgeObjectRelease();
  if (v3 == 1)
    v5 = 1;
  else
    v5 = 2;
  if (!v3)
    v5 = 0;
  *v2 = v5;
  return result;
}

uint64_t sub_2409D680C(char *a1, char *a2)
{
  return sub_2409D6378(*a1, *a2);
}

uint64_t sub_2409D6818()
{
  return sub_2409D6424();
}

uint64_t sub_2409D6820()
{
  return sub_2409D64B0();
}

uint64_t sub_2409D6828()
{
  return sub_2409D6514();
}

LiveSpeechServices::LiveSpeechInputMode_optional sub_2409D6830(Swift::String *a1)
{
  return LiveSpeechInputMode.init(rawValue:)(*a1);
}

uint64_t sub_2409D683C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = LiveSpeechInputMode.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_2409D6860()
{
  sub_2409D8168();
  return sub_2409D837C();
}

uint64_t sub_2409D68BC()
{
  sub_2409D8168();
  return sub_2409D8370();
}

id sub_2409D6908()
{
  id result;

  result = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for LiveSpeechService()), sel_init);
  qword_2543567B8 = (uint64_t)result;
  return result;
}

id static LiveSpeechService.shared.getter()
{
  if (qword_2543567C0 != -1)
    swift_once();
  return (id)qword_2543567B8;
}

id LiveSpeechService.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t LiveSpeechService.serviceName.getter()
{
  return 0xD000000000000013;
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> LiveSpeechService.startLiveSpeech()()
{
  sub_2409D6ACC((uint64_t (*)(void))LiveSpeechCaptionsClient.startLiveSpeech());
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> LiveSpeechService.stopLiveSpeech()()
{
  sub_2409D6ACC((uint64_t (*)(void))LiveSpeechCaptionsClient.stopLiveSpeech());
}

uint64_t sub_2409D6ACC(uint64_t (*a1)(void))
{
  if (qword_254356788 != -1)
    swift_once();
  return a1();
}

uint64_t sub_2409D6B38(void *a1, uint64_t a2, uint64_t a3, void (*a4)(void))
{
  uint64_t v5;
  id v6;

  v5 = qword_254356788;
  v6 = a1;
  if (v5 != -1)
    swift_once();
  a4();

  return 1;
}

void LiveSpeechService.inputMode.getter(BOOL *a1@<X8>)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  BOOL v7;

  sub_2409D6D84();
  v3 = v2;
  v4 = (void *)sub_2409D8328();
  v5 = objc_msgSend(v3, sel_stringForKey_, v4);

  if (v5)
  {
    sub_2409D8334();

    v6 = sub_2409D8454();
    swift_bridgeObjectRelease();
    v7 = 0;
    if (v6)
      v7 = v6 == 1;
  }
  else
  {
    v7 = 0;
  }
  *a1 = v7;
}

void LiveSpeechService.inputMode.setter()
{
  void *v0;
  void *v1;
  void *v2;
  id v3;

  sub_2409D6D84();
  v1 = v0;
  v2 = (void *)sub_2409D8328();
  swift_bridgeObjectRelease();
  v3 = (id)sub_2409D8328();
  objc_msgSend(v1, sel_setObject_forKey_, v2, v3);

}

void sub_2409D6D84()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v1 = OBJC_IVAR___LiveSpeechServices____lazy_storage___liveSpeechDefaults;
  v2 = *(void **)(v0 + OBJC_IVAR___LiveSpeechServices____lazy_storage___liveSpeechDefaults);
  if (v2)
    goto LABEL_4;
  sub_2409D82E0();
  v3 = objc_allocWithZone(MEMORY[0x24BDBCF50]);
  v4 = (void *)sub_2409D8328();
  swift_bridgeObjectRelease();
  v5 = objc_msgSend(v3, sel_initWithSuiteName_, v4);

  if (v5)
  {
    v6 = *(void **)(v0 + v1);
    *(_QWORD *)(v0 + v1) = v5;
    v5;

    v2 = 0;
LABEL_4:
    v7 = v2;
    return;
  }
  __break(1u);
}

void (*LiveSpeechService.inputMode.modify(uint64_t a1))()
{
  uint64_t v1;

  *(_QWORD *)a1 = v1;
  LiveSpeechService.inputMode.getter((BOOL *)(a1 + 8));
  return sub_2409D6E70;
}

void sub_2409D6E70()
{
  void *v0;
  void *v1;
  void *v2;
  id v3;

  sub_2409D6D84();
  v3 = v0;
  v1 = (void *)sub_2409D8328();
  swift_bridgeObjectRelease();
  v2 = (void *)sub_2409D8328();
  objc_msgSend(v3, sel_setObject_forKey_, v1, v2);

}

uint64_t LiveSpeechService.liveSpeechPhrases.getter()
{
  return sub_2409D71DC((SEL *)&selRef_liveSpeechPhrases);
}

uint64_t LiveSpeechService.observeFavoriteLiveSpeechPhrasesChanges(_:)(uint64_t a1, uint64_t a2)
{
  return sub_2409D766C(a1, a2);
}

char *keypath_get_selector_liveSpeechPhrases()
{
  return sel_liveSpeechPhrases;
}

void sub_2409D6F78(id *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_2409D7724(a1, (SEL *)&selRef_liveSpeechPhrases, a2);
}

void sub_2409D6F94(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
  sub_2409D7784(a1, a2, a3, a4, (SEL *)&selRef_setLiveSpeechPhrases_);
}

uint64_t sub_2409D6FB0()
{
  swift_release();
  return swift_deallocObject();
}

id sub_2409D70FC(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  void *v3;

  a3();
  v3 = (void *)sub_2409D8328();
  swift_bridgeObjectRelease();
  return v3;
}

id sub_2409D7140(void *a1, uint64_t a2, SEL *a3)
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  v4 = a1;
  sub_2409D6D84();
  v6 = v5;
  v7 = objc_msgSend(v5, *a3);

  __swift_instantiateConcreteTypeFromMangledName(&qword_257078E20);
  sub_2409D8394();

  v8 = (void *)sub_2409D8388();
  swift_bridgeObjectRelease();
  return v8;
}

uint64_t LiveSpeechService.favoritePhrases.getter()
{
  return sub_2409D71DC((SEL *)&selRef_favoritePhrases);
}

uint64_t sub_2409D71DC(SEL *a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;

  sub_2409D6D84();
  v3 = v2;
  v4 = objc_msgSend(v2, *a1);

  __swift_instantiateConcreteTypeFromMangledName(&qword_257078E20);
  v5 = sub_2409D8394();

  return v5;
}

Swift::Void __swiftcall LiveSpeechService.addFavoritePhrase(_:)(Swift::OpaquePointer a1)
{
  void *v2;
  void *v3;
  id v4;
  _QWORD *v5;
  unint64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;

  sub_2409D6D84();
  v3 = v2;
  v4 = objc_msgSend(v2, sel_favoritePhrases);

  __swift_instantiateConcreteTypeFromMangledName(&qword_257078E20);
  v5 = (_QWORD *)sub_2409D8394();

  swift_bridgeObjectRetain();
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v5 = sub_2409D78E4(0, v5[2] + 1, 1, v5);
  v7 = v5[2];
  v6 = v5[3];
  if (v7 >= v6 >> 1)
    v5 = sub_2409D78E4((_QWORD *)(v6 > 1), v7 + 1, 1, v5);
  v5[2] = v7 + 1;
  v5[v7 + 4] = a1._rawValue;
  sub_2409D6D84();
  v9 = v8;
  v10 = (void *)sub_2409D8388();
  swift_bridgeObjectRelease();
  objc_msgSend(v9, sel_setFavoritePhrases_, v10);

  sub_2409D8304();
  v11 = sub_2409D8340();
  swift_bridgeObjectRelease();
  notify_post((const char *)(v11 + 32));
  swift_release();
}

Swift::Void __swiftcall LiveSpeechService.removeFavoritePhrase(_:)(Swift::String a1)
{
  void *v1;
  void *object;
  uint64_t countAndFlagsBits;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  unint64_t v9;
  char v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;

  object = a1._object;
  countAndFlagsBits = a1._countAndFlagsBits;
  sub_2409D6D84();
  v5 = v4;
  v6 = objc_msgSend(v4, sel_favoritePhrases);

  __swift_instantiateConcreteTypeFromMangledName(&qword_257078E20);
  sub_2409D8394();

  v7 = v1;
  swift_bridgeObjectRetain();
  v8 = swift_bridgeObjectRetain();
  v9 = sub_2409D7D44(v8, countAndFlagsBits, (uint64_t)object);
  v11 = v10;
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  if ((v11 & 1) == 0)
  {
    sub_2409D752C(v9);
    swift_bridgeObjectRelease();
  }
  sub_2409D6D84();
  v13 = v12;
  v14 = (void *)sub_2409D8388();
  swift_bridgeObjectRelease();
  objc_msgSend(v13, sel_setFavoritePhrases_, v14);

  sub_2409D8304();
  v15 = sub_2409D8340();
  swift_bridgeObjectRelease();
  notify_post((const char *)(v15 + 32));
  swift_release();
}

uint64_t sub_2409D752C(unint64_t a1)
{
  _QWORD **v1;
  _QWORD *v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t result;

  v3 = *v1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v3 = sub_2409D7C28(v3);
  v4 = v3[2];
  if (v4 <= a1)
  {
    __break(1u);
  }
  else
  {
    v5 = v4 - 1;
    v6 = v4 - 1 - a1;
    if (v6 >= 0)
    {
      v7 = &v3[a1];
      v8 = v7[4];
      memmove(v7 + 4, v7 + 5, 8 * v6);
      v3[2] = v5;
      *v1 = v3;
      return v8;
    }
  }
  result = sub_2409D8448();
  __break(1u);
  return result;
}

uint64_t LiveSpeechService.observeFavoritePhrasesChanges(_:)(uint64_t a1, uint64_t a2)
{
  return sub_2409D766C(a1, a2);
}

uint64_t sub_2409D766C(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v8;

  sub_2409D6D84();
  v8 = v4;
  swift_getKeyPath();
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = a1;
  *(_QWORD *)(v5 + 24) = a2;
  swift_retain();
  v6 = sub_2409D82A4();
  swift_release();
  swift_release();

  return v6;
}

void sub_2409D7724(id *a1@<X0>, SEL *a2@<X3>, uint64_t *a3@<X8>)
{
  id v4;
  uint64_t v5;

  v4 = objc_msgSend(*a1, *a2);
  __swift_instantiateConcreteTypeFromMangledName(&qword_257078E20);
  v5 = sub_2409D8394();

  *a3 = v5;
}

void sub_2409D7784(uint64_t a1, void **a2, uint64_t a3, uint64_t a4, SEL *a5)
{
  void *v6;
  id v7;

  v6 = *a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257078E20);
  v7 = (id)sub_2409D8388();
  objc_msgSend(v6, *a5, v7);

}

_QWORD *sub_2409D78E4(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_257078E48);
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
    sub_2409D7C3C(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

unint64_t sub_2409D79F0(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_2409D83E8();
  return sub_2409D7A84(a1, v2);
}

unint64_t sub_2409D7A20(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_2409D84B4();
  sub_2409D834C();
  v4 = sub_2409D84CC();
  return sub_2409D7B48(a1, a2, v4);
}

unint64_t sub_2409D7A84(uint64_t a1, uint64_t a2)
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
      sub_2409D81EC(*(_QWORD *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      v7 = MEMORY[0x242685D80](v9, a1);
      sub_2409D8228((uint64_t)v9);
      if ((v7 & 1) != 0)
        break;
      v4 = (v4 + 1) & v6;
    }
    while (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

unint64_t sub_2409D7B48(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_2409D846C() & 1) == 0)
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
      while (!v14 && (sub_2409D846C() & 1) == 0);
    }
  }
  return v6;
}

_QWORD *sub_2409D7C28(_QWORD *a1)
{
  return sub_2409D78E4(0, a1[2], 0, a1);
}

uint64_t sub_2409D7C3C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
    v5 = a4 + 8 * a1 + 32;
    v6 = a3 + 8 * v4;
    if (v5 >= v6 || v5 + 8 * v4 <= a3)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_257078E20);
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  result = sub_2409D8448();
  __break(1u);
  return result;
}

uint64_t sub_2409D7D44(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  char v12;
  char v13;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;

  v3 = *(_QWORD *)(a1 + 16);
  if (v3)
  {
    v6 = 0;
    v7 = a1 + 32;
    while (1)
    {
      v8 = *(_QWORD *)(v7 + 8 * v6);
      swift_bridgeObjectRetain();
      v9 = _s18LiveSpeechServices0aB7ServiceC13phraseTextKeySSvg_0();
      if (*(_QWORD *)(v8 + 16) && (v11 = sub_2409D7A20(v9, v10), (v12 & 1) != 0))
      {
        sub_2409D5530(*(_QWORD *)(v8 + 56) + 32 * v11, (uint64_t)&v17);
      }
      else
      {
        v17 = 0u;
        v18 = 0u;
      }
      swift_bridgeObjectRelease();
      if (!*((_QWORD *)&v18 + 1))
        break;
      if ((swift_dynamicCast() & 1) == 0)
        goto LABEL_4;
      if (v15 == a2 && v16 == a3)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        return v6;
      }
      v13 = sub_2409D846C();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v13 & 1) != 0)
        return v6;
LABEL_5:
      if (v3 == ++v6)
        return 0;
    }
    sub_2409D81AC((uint64_t)&v17);
LABEL_4:
    swift_bridgeObjectRelease();
    goto LABEL_5;
  }
  return 0;
}

char *keypath_get_selector_favoritePhrases()
{
  return sel_favoritePhrases;
}

void sub_2409D7EC4(id *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_2409D7724(a1, (SEL *)&selRef_favoritePhrases, a2);
}

void sub_2409D7EE0(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
  sub_2409D7784(a1, a2, a3, a4, (SEL *)&selRef_setFavoritePhrases_);
}

unint64_t sub_2409D7F00()
{
  unint64_t result;

  result = qword_257078E28;
  if (!qword_257078E28)
  {
    result = MEMORY[0x2426860E0](&protocol conformance descriptor for LiveSpeechInputMode, &type metadata for LiveSpeechInputMode);
    atomic_store(result, (unint64_t *)&qword_257078E28);
  }
  return result;
}

void sub_2409D7F44(_BYTE *a1@<X8>)
{
  BOOL v2;

  LiveSpeechService.inputMode.getter(&v2);
  *a1 = v2;
}

void sub_2409D7F7C()
{
  LiveSpeechService.inputMode.setter();
}

uint64_t getEnumTagSinglePayload for LiveSpeechInputMode(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for LiveSpeechInputMode(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2409D808C + 4 * byte_2409D8DC5[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_2409D80C0 + 4 * asc_2409D8DC0[v4]))();
}

uint64_t sub_2409D80C0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2409D80C8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2409D80D0);
  return result;
}

uint64_t sub_2409D80DC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2409D80E4);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_2409D80E8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2409D80F0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_2409D80FC(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for LiveSpeechInputMode()
{
  return &type metadata for LiveSpeechInputMode;
}

uint64_t type metadata accessor for LiveSpeechService()
{
  return objc_opt_self();
}

uint64_t sub_2409D8138()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

uint64_t sub_2409D815C()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 16) + 16))();
}

unint64_t sub_2409D8168()
{
  unint64_t result;

  result = qword_257078E38;
  if (!qword_257078E38)
  {
    result = MEMORY[0x2426860E0](&protocol conformance descriptor for LiveSpeechInputMode, &type metadata for LiveSpeechInputMode);
    atomic_store(result, (unint64_t *)&qword_257078E38);
  }
  return result;
}

uint64_t sub_2409D81AC(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_257078E40);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2409D81EC(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(MEMORY[0x24BEE23D0] - 8) + 16))(a2, a1);
  return a2;
}

uint64_t sub_2409D8228(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(MEMORY[0x24BEE23D0] - 8) + 8))();
  return a1;
}

uint64_t sub_2409D8274()
{
  return MEMORY[0x24BDCBE60]();
}

uint64_t sub_2409D8280()
{
  return MEMORY[0x24BDCBE68]();
}

uint64_t sub_2409D828C()
{
  return MEMORY[0x24BDCBE80]();
}

uint64_t sub_2409D8298()
{
  return MEMORY[0x24BDCD2F0]();
}

uint64_t sub_2409D82A4()
{
  return MEMORY[0x24BDCD5A8]();
}

uint64_t sub_2409D82B0()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_2409D82BC()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_2409D82C8()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t _s18LiveSpeechServices0aB7ServiceC13phraseTextKeySSvg_0()
{
  return MEMORY[0x24BEB63D0]();
}

uint64_t sub_2409D82E0()
{
  return MEMORY[0x24BEB63D8]();
}

uint64_t _s18LiveSpeechServices0aB7ServiceC16phraseInputIDKeySSvg_0()
{
  return MEMORY[0x24BEB63E0]();
}

uint64_t _s18LiveSpeechServices0aB7ServiceC17phraseShortcutKeySSvg_0()
{
  return MEMORY[0x24BEB63E8]();
}

uint64_t sub_2409D8304()
{
  return MEMORY[0x24BEB63F0]();
}

uint64_t sub_2409D8310()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_2409D831C()
{
  return MEMORY[0x24BDCF830]();
}

uint64_t sub_2409D8328()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_2409D8334()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_2409D8340()
{
  return MEMORY[0x24BEE0A30]();
}

uint64_t sub_2409D834C()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_2409D8358()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_2409D8364()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_2409D8370()
{
  return MEMORY[0x24BEE1000]();
}

uint64_t sub_2409D837C()
{
  return MEMORY[0x24BEE1080]();
}

uint64_t sub_2409D8388()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_2409D8394()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_2409D83A0()
{
  return MEMORY[0x24BDCFC08]();
}

uint64_t sub_2409D83AC()
{
  return MEMORY[0x24BEE78F0]();
}

uint64_t sub_2409D83B8()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_2409D83C4()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_2409D83D0()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_2409D83DC()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_2409D83E8()
{
  return MEMORY[0x24BEE23A0]();
}

uint64_t sub_2409D83F4()
{
  return MEMORY[0x24BEE23A8]();
}

uint64_t sub_2409D8400()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_2409D840C()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_2409D8418()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_2409D8424()
{
  return MEMORY[0x24BEE2BE0]();
}

uint64_t sub_2409D8430()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_2409D843C()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_2409D8448()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_2409D8454()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_2409D8460()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_2409D846C()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_2409D8478()
{
  return MEMORY[0x24BDD0708]();
}

uint64_t sub_2409D8484()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_2409D8490()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_2409D849C()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_2409D84A8()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_2409D84B4()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_2409D84C0()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_2409D84CC()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x24BE1A1C8]();
}

uint64_t _AXSLiveSpeechEnabled()
{
  return MEMORY[0x24BED2310]();
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

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x24BEE4B30]();
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

uint32_t notify_post(const char *name)
{
  return MEMORY[0x24BDAF160](name);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x24BEDCF78](a1);
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
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

uint64_t swift_allocError()
{
  return MEMORY[0x24BEE4B68]();
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

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x24BEE4BD0]();
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

uint64_t swift_errorRelease()
{
  return MEMORY[0x24BEE4CA0]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x24BEE4CA8]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x24BEE4D18]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x24BEE4D88]();
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

uint64_t swift_initStackObject()
{
  return MEMORY[0x24BEE4E48]();
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

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
}

