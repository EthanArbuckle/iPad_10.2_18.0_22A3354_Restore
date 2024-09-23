_TtC17HoverTextServices16HoverTextService *HoverTextObjc()
{
  return +[HoverTextService sharedInstance](_TtC17HoverTextServices16HoverTextService, "sharedInstance");
}

uint64_t HoverTextError.message.getter(uint64_t a1)
{
  swift_bridgeObjectRetain();
  return a1;
}

unint64_t HoverTextError.description.getter()
{
  sub_1C88FFF78();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_1C88FFF00();
  swift_bridgeObjectRelease();
  return 0xD000000000000010;
}

unint64_t sub_1C88FC3BC()
{
  return HoverTextError.description.getter();
}

_QWORD *initializeBufferWithCopyOfBuffer for HoverTextError(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for HoverTextError()
{
  return swift_bridgeObjectRelease();
}

_QWORD *assignWithCopy for HoverTextError(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

_QWORD *assignWithTake for HoverTextError(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for HoverTextError(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for HoverTextError(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for HoverTextError()
{
  return &type metadata for HoverTextError;
}

uint64_t sub_1C88FC50C(uint64_t a1)
{
  return sub_1C88FC580(a1, HTLog);
}

uint64_t HTLog.unsafeMutableAddressor()
{
  return sub_1C88FC610(&qword_1ED52A9C8, (uint64_t)HTLog);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t sub_1C88FC560(uint64_t a1)
{
  return sub_1C88FC580(a1, HTLogEvent);
}

uint64_t sub_1C88FC580(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_1C88FFEC4();
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  return sub_1C88FFEB8();
}

uint64_t HTLogEvent.unsafeMutableAddressor()
{
  return sub_1C88FC610(&qword_1EF8FCAE0, (uint64_t)HTLogEvent);
}

uint64_t sub_1C88FC610(_QWORD *a1, uint64_t a2)
{
  uint64_t v3;

  if (*a1 != -1)
    swift_once();
  v3 = sub_1C88FFEC4();
  return __swift_project_value_buffer(v3, a2);
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

uint64_t sub_1C88FC690(void *a1)
{
  id v2;

  v2 = a1;
  sub_1C88FFF00();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED52A9C0);
  sub_1C88FFF9C();

  return 0;
}

uint64_t sub_1C88FC720()
{
  void **v0;

  return sub_1C88FC690(*v0);
}

uint64_t sub_1C88FC734(uint64_t result, void *a2, void (*a3)(void *, uint64_t))
{
  id v5;
  unint64_t v6;
  unint64_t v7;

  if (a3)
  {
    if (a2)
    {
      sub_1C88FC948((uint64_t)a3);
      v5 = a2;
      a3(a2, 1);

      return sub_1C88FC938((uint64_t)a3);
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
        v7 = sub_1C88FC80C(MEMORY[0x1E0DEE9D8]);
      }
      swift_bridgeObjectRetain();
      a3((void *)v7, 0);
      sub_1C88FC938((uint64_t)a3);
      return swift_bridgeObjectRelease();
    }
  }
  return result;
}

unint64_t sub_1C88FC80C(uint64_t a1)
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
    v3 = (_QWORD *)MEMORY[0x1E0DEE9E0];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF8FCAE8);
  v2 = sub_1C88FFFB4();
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
    sub_1C88FC9C8(v6, (uint64_t)v15);
    result = sub_1C88FC998((uint64_t)v15);
    if ((v8 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v9 = v3[6] + 40 * result;
    v10 = v15[0];
    v11 = v15[1];
    *(_QWORD *)(v9 + 32) = v16;
    *(_OWORD *)v9 = v10;
    *(_OWORD *)(v9 + 16) = v11;
    result = (unint64_t)sub_1C88FCA10(&v17, (_OWORD *)(v3[7] + 32 * result));
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

uint64_t sub_1C88FC938(uint64_t result)
{
  if (result)
    return swift_release();
  return result;
}

uint64_t sub_1C88FC948(uint64_t result)
{
  if (result)
    return swift_retain();
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x1CAA36D7C]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

unint64_t sub_1C88FC998(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_1C88FFF54();
  return sub_1C88FCA20(a1, v2);
}

uint64_t sub_1C88FC9C8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF8FCAF0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

_OWORD *sub_1C88FCA10(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

unint64_t sub_1C88FCA20(uint64_t a1, uint64_t a2)
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
      sub_1C88FCAE4(*(_QWORD *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      v7 = MEMORY[0x1CAA36A94](v9, a1);
      sub_1C88FCB20((uint64_t)v9);
      if ((v7 & 1) != 0)
        break;
      v4 = (v4 + 1) & v6;
    }
    while (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

uint64_t sub_1C88FCAE4(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(MEMORY[0x1E0DEC198] - 8) + 16))(a2, a1);
  return a2;
}

uint64_t sub_1C88FCB20(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(MEMORY[0x1E0DEC198] - 8) + 8))();
  return a1;
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

uint64_t sub_1C88FCC84()
{
  return 0;
}

ValueMetadata *type metadata accessor for AXUIError()
{
  return &type metadata for AXUIError;
}

unint64_t sub_1C88FCCA4()
{
  unint64_t result;

  result = qword_1EF8FCAF8;
  if (!qword_1EF8FCAF8)
  {
    result = MEMORY[0x1CAA36D88](&unk_1C89004DC, &type metadata for AXUIError);
    atomic_store(result, (unint64_t *)&qword_1EF8FCAF8);
  }
  return result;
}

uint64_t sub_1C88FCCEC(uint64_t a1, uint64_t a2, void *a3)
{
  void (*v4)(uint64_t, void *);
  uint64_t v5;
  id v6;

  v4 = *(void (**)(uint64_t, void *))(a1 + 32);
  if (a2)
    v5 = sub_1C88FFEDC();
  else
    v5 = 0;
  swift_retain();
  v6 = a3;
  v4(v5, a3);
  swift_release();

  return swift_bridgeObjectRelease();
}

uint64_t HoverTextAXUIServiceMessageID.rawValue.getter(unsigned __int8 a1)
{
  return a1 + 1;
}

BOOL sub_1C88FCD90(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_1C88FCDA4()
{
  sub_1C8900014();
  sub_1C8900020();
  return sub_1C890002C();
}

uint64_t sub_1C88FCDE8()
{
  return sub_1C8900020();
}

uint64_t sub_1C88FCE14()
{
  sub_1C8900014();
  sub_1C8900020();
  return sub_1C890002C();
}

uint64_t sub_1C88FCE54@<X0>(unint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t result;

  result = _s17HoverTextServices0aB20AXUIServiceMessageIDO8rawValueACSgSi_tcfC_0(*a1);
  *a2 = result;
  return result;
}

void sub_1C88FCE7C(_QWORD *a1@<X8>)
{
  unsigned __int8 *v1;

  *a1 = *v1 + 1;
}

id sub_1C88FCEEC()
{
  char *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  objc_super v5;

  v1 = OBJC_IVAR____TtC17HoverTextServices27HoverTextServiceAXUIService__client;
  v2 = *(void **)&v0[OBJC_IVAR____TtC17HoverTextServices27HoverTextServiceAXUIService__client];
  if (v2)
  {
    objc_msgSend(v2, sel_setDelegate_, 0);
    v3 = *(void **)&v0[v1];
  }
  else
  {
    v3 = 0;
  }
  *(_QWORD *)&v0[v1] = 0;

  v5.receiver = v0;
  v5.super_class = (Class)type metadata accessor for HoverTextServiceAXUIService();
  return objc_msgSendSuper2(&v5, sel_dealloc);
}

id sub_1C88FCF8C()
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

  v1 = OBJC_IVAR____TtC17HoverTextServices27HoverTextServiceAXUIService__client;
  v2 = *(void **)(v0 + OBJC_IVAR____TtC17HoverTextServices27HoverTextServiceAXUIService__client);
  if (v2)
  {
    v3 = *(id *)(v0 + OBJC_IVAR____TtC17HoverTextServices27HoverTextServiceAXUIService__client);
LABEL_6:
    v13 = v2;
    return v3;
  }
  v4 = v0;
  v5 = objc_msgSend((id)objc_opt_self(), sel_processInfo);
  objc_msgSend(v5, sel_processIdentifier);

  sub_1C88FFFCC();
  sub_1C88FFF00();
  swift_bridgeObjectRelease();
  v6 = objc_allocWithZone(MEMORY[0x1E0CF4938]);
  v7 = (void *)sub_1C88FFEE8();
  swift_bridgeObjectRelease();
  v8 = (void *)sub_1C88FFEE8();
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

void sub_1C88FD110()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  _QWORD aBlock[6];

  v1 = v0;
  v2 = sub_1C88FFEC4();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = (char *)&aBlock[-1] - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1ED52A9C8 != -1)
    swift_once();
  v6 = __swift_project_value_buffer(v2, (uint64_t)HTLog);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v6, v2);
  v7 = sub_1C88FFEAC();
  v8 = sub_1C88FFF30();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_1C88FA000, v7, v8, "Client requesting HoverText start", v9, 2u);
    MEMORY[0x1CAA36DDC](v9, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  v10 = sub_1C88FCF8C();
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = v1;
  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = sub_1C88FF518;
  *(_QWORD *)(v12 + 24) = v11;
  aBlock[4] = sub_1C88FF5AC;
  aBlock[5] = v12;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1C88FCCEC;
  aBlock[3] = &block_descriptor_41;
  v13 = _Block_copy(aBlock);
  v14 = v1;
  swift_retain();
  swift_release();
  objc_msgSend(v10, sel_sendAsynchronousMessage_withIdentifier_targetAccessQueue_completion_, 0, 1, 0, v13);
  _Block_release(v13);
  swift_release();

}

void sub_1C88FD340()
{
  void *v0;
  void *v1;
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
  id v17;
  uint64_t v18;
  NSObject *v19;
  os_log_type_t v20;
  uint8_t *v21;
  _QWORD aBlock[6];

  v1 = v0;
  v2 = sub_1C88FFEC4();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x1E0C80A78](v2);
  v6 = (char *)&aBlock[-1] - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v4);
  v8 = (char *)&aBlock[-1] - v7;
  if ((*((_BYTE *)v1 + OBJC_IVAR____TtC17HoverTextServices27HoverTextServiceAXUIService_hoverTextEnabled) & 1) != 0)
  {
    if (qword_1ED52A9C8 != -1)
      swift_once();
    v9 = __swift_project_value_buffer(v2, (uint64_t)HTLog);
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v6, v9, v2);
    v10 = sub_1C88FFEAC();
    v11 = sub_1C88FFF30();
    if (os_log_type_enabled(v10, v11))
    {
      v12 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_1C88FA000, v10, v11, "Client requesting HoverText stop", v12, 2u);
      MEMORY[0x1CAA36DDC](v12, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
    v13 = sub_1C88FCF8C();
    v14 = swift_allocObject();
    *(_QWORD *)(v14 + 16) = v1;
    v15 = swift_allocObject();
    *(_QWORD *)(v15 + 16) = sub_1C88FF4DC;
    *(_QWORD *)(v15 + 24) = v14;
    aBlock[4] = sub_1C88FF5AC;
    aBlock[5] = v15;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1C88FCCEC;
    aBlock[3] = &block_descriptor_31;
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
    if (qword_1ED52A9C8 != -1)
      swift_once();
    v18 = __swift_project_value_buffer(v2, (uint64_t)HTLog);
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v8, v18, v2);
    v19 = sub_1C88FFEAC();
    v20 = sub_1C88FFF18();
    if (os_log_type_enabled(v19, v20))
    {
      v21 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v21 = 0;
      _os_log_impl(&dword_1C88FA000, v19, v20, "HoverText was never started, no need to stop", v21, 2u);
      MEMORY[0x1CAA36DDC](v21, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v3 + 8))(v8, v2);
  }
}

void sub_1C88FD674(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint64_t v13;
  uint8_t *v14;
  uint64_t v15;
  uint8_t *v16;
  id v17;
  uint64_t inited;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t aBlock;
  unint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t, void *);
  void *v29;
  uint64_t (*v30)();
  uint64_t v31;

  v3 = v2;
  v6 = sub_1C88FFEC4();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1ED52A9C8 != -1)
    swift_once();
  v10 = __swift_project_value_buffer(v6, (uint64_t)HTLog);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, v10, v6);
  swift_bridgeObjectRetain_n();
  v11 = sub_1C88FFEAC();
  v12 = sub_1C88FFF30();
  if (os_log_type_enabled(v11, v12))
  {
    v23 = v3;
    v13 = swift_slowAlloc();
    v24 = a1;
    v14 = (uint8_t *)v13;
    v15 = swift_slowAlloc();
    aBlock = v15;
    *(_DWORD *)v14 = 136315138;
    swift_bridgeObjectRetain();
    v25 = sub_1C88FEB00(v24, a2, &aBlock);
    sub_1C88FFF3C();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1C88FA000, v11, v12, "Client sending alert to HoverText: %s", v14, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1CAA36DDC](v15, -1, -1);
    v16 = v14;
    a1 = v24;
    MEMORY[0x1CAA36DDC](v16, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  v17 = sub_1C88FCF8C();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF8FCBA8);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1C8900540;
  aBlock = 1954047348;
  v27 = 0xE400000000000000;
  v19 = MEMORY[0x1E0DEA968];
  sub_1C88FFF6C();
  *(_QWORD *)(inited + 96) = v19;
  *(_QWORD *)(inited + 72) = a1;
  *(_QWORD *)(inited + 80) = a2;
  swift_bridgeObjectRetain();
  sub_1C88FC80C(inited);
  v20 = (void *)sub_1C88FFED0();
  v21 = swift_allocObject();
  *(_QWORD *)(v21 + 16) = nullsub_1;
  *(_QWORD *)(v21 + 24) = 0;
  v30 = sub_1C88FF5AC;
  v31 = v21;
  aBlock = MEMORY[0x1E0C809B0];
  v27 = 1107296256;
  v28 = sub_1C88FCCEC;
  v29 = &block_descriptor_21;
  v22 = _Block_copy(&aBlock);
  swift_release();
  objc_msgSend(v17, sel_sendAsynchronousMessage_withIdentifier_targetAccessQueue_completion_, v20, 3, 0, v22);

  _Block_release(v22);
  swift_bridgeObjectRelease();

}

void sub_1C88FDA00()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  _QWORD aBlock[6];

  v1 = v0;
  v2 = sub_1C88FFEC4();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = (char *)&aBlock[-1] - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1ED52A9C8 != -1)
    swift_once();
  v6 = __swift_project_value_buffer(v2, (uint64_t)HTLog);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v6, v2);
  v7 = sub_1C88FFEAC();
  v8 = sub_1C88FFF30();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_1C88FA000, v7, v8, "Client requesting HoverText Typing start", v9, 2u);
    MEMORY[0x1CAA36DDC](v9, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  v10 = sub_1C88FCF8C();
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = v1;
  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = sub_1C88FF49C;
  *(_QWORD *)(v12 + 24) = v11;
  aBlock[4] = sub_1C88FF5AC;
  aBlock[5] = v12;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1C88FCCEC;
  aBlock[3] = &block_descriptor_14;
  v13 = _Block_copy(aBlock);
  v14 = v1;
  swift_retain();
  swift_release();
  objc_msgSend(v10, sel_sendAsynchronousMessage_withIdentifier_targetAccessQueue_completion_, 0, 4, 0, v13);
  _Block_release(v13);
  swift_release();

}

void sub_1C88FDC30()
{
  void *v0;
  void *v1;
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
  id v17;
  uint64_t v18;
  NSObject *v19;
  os_log_type_t v20;
  uint8_t *v21;
  _QWORD aBlock[6];

  v1 = v0;
  v2 = sub_1C88FFEC4();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x1E0C80A78](v2);
  v6 = (char *)&aBlock[-1] - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v4);
  v8 = (char *)&aBlock[-1] - v7;
  if ((*((_BYTE *)v1 + OBJC_IVAR____TtC17HoverTextServices27HoverTextServiceAXUIService_hoverTextTypingEnabled) & 1) != 0)
  {
    if (qword_1ED52A9C8 != -1)
      swift_once();
    v9 = __swift_project_value_buffer(v2, (uint64_t)HTLog);
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v6, v9, v2);
    v10 = sub_1C88FFEAC();
    v11 = sub_1C88FFF30();
    if (os_log_type_enabled(v10, v11))
    {
      v12 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_1C88FA000, v10, v11, "Client requesting HoverText Typing stop", v12, 2u);
      MEMORY[0x1CAA36DDC](v12, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
    v13 = sub_1C88FCF8C();
    v14 = swift_allocObject();
    *(_QWORD *)(v14 + 16) = v1;
    v15 = swift_allocObject();
    *(_QWORD *)(v15 + 16) = sub_1C88FF434;
    *(_QWORD *)(v15 + 24) = v14;
    aBlock[4] = sub_1C88FF470;
    aBlock[5] = v15;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1C88FCCEC;
    aBlock[3] = &block_descriptor;
    v16 = _Block_copy(aBlock);
    v17 = v1;
    swift_retain();
    swift_release();
    objc_msgSend(v13, sel_sendAsynchronousMessage_withIdentifier_targetAccessQueue_completion_, 0, 5, 0, v16);
    _Block_release(v16);
    swift_release();

  }
  else
  {
    if (qword_1ED52A9C8 != -1)
      swift_once();
    v18 = __swift_project_value_buffer(v2, (uint64_t)HTLog);
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v8, v18, v2);
    v19 = sub_1C88FFEAC();
    v20 = sub_1C88FFF18();
    if (os_log_type_enabled(v19, v20))
    {
      v21 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v21 = 0;
      _os_log_impl(&dword_1C88FA000, v19, v20, "HoverText Typing was never started, no need to stop", v21, 2u);
      MEMORY[0x1CAA36DDC](v21, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v3 + 8))(v8, v2);
  }
}

uint64_t sub_1C88FDF64(void *a1, char a2, uint64_t a3, const char *a4, const char *a5, _QWORD *a6, char a7)
{
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  NSObject *v21;
  os_log_type_t v22;
  uint8_t *v23;
  uint64_t result;
  id v25;
  uint64_t v26;
  id v27;
  id v28;
  NSObject *v29;
  os_log_type_t v30;
  uint8_t *v31;
  _QWORD *v32;
  _QWORD *v33;
  id v34;
  uint64_t v35;
  uint8_t *v36;
  const char *v37;
  uint64_t v38;

  v37 = a5;
  v13 = sub_1C88FFEC4();
  v14 = *(_QWORD *)(v13 - 8);
  v15 = ((uint64_t (*)(void))MEMORY[0x1E0C80A78])();
  v17 = (char *)&v36 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v15);
  v19 = (char *)&v36 - v18;
  if ((a2 & 1) != 0)
  {
    v25 = a1;
    if (qword_1ED52A9C8 != -1)
      swift_once();
    v26 = __swift_project_value_buffer(v13, (uint64_t)HTLog);
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))(v17, v26, v13);
    v27 = a1;
    v28 = a1;
    v29 = sub_1C88FFEAC();
    v30 = sub_1C88FFF24();
    if (os_log_type_enabled(v29, v30))
    {
      v37 = a4;
      v31 = (uint8_t *)swift_slowAlloc();
      v32 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v31 = 138412290;
      v36 = v31 + 4;
      sub_1C88FCCA4();
      swift_allocError();
      *v33 = a1;
      v34 = a1;
      v35 = _swift_stdlib_bridgeErrorToNSError();
      v38 = v35;
      sub_1C88FFF3C();
      *v32 = v35;
      sub_1C88FF490(a1, 1);
      sub_1C88FF490(a1, 1);
      _os_log_impl(&dword_1C88FA000, v29, v30, v37, v31, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EF8FCBA0);
      swift_arrayDestroy();
      MEMORY[0x1CAA36DDC](v32, -1, -1);
      MEMORY[0x1CAA36DDC](v31, -1, -1);

      sub_1C88FF490(a1, 1);
    }
    else
    {
      sub_1C88FF490(a1, 1);
      sub_1C88FF490(a1, 1);

    }
    return (*(uint64_t (**)(char *, uint64_t))(v14 + 8))(v17, v13);
  }
  else
  {
    if (qword_1ED52A9C8 != -1)
      swift_once();
    v20 = __swift_project_value_buffer(v13, (uint64_t)HTLog);
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))(v19, v20, v13);
    v21 = sub_1C88FFEAC();
    v22 = sub_1C88FFF30();
    if (os_log_type_enabled(v21, v22))
    {
      v23 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v23 = 0;
      _os_log_impl(&dword_1C88FA000, v21, v22, v37, v23, 2u);
      MEMORY[0x1CAA36DDC](v23, -1, -1);
    }

    result = (*(uint64_t (**)(char *, uint64_t))(v14 + 8))(v19, v13);
    *(_BYTE *)(a3 + *a6) = a7;
  }
  return result;
}

void sub_1C88FE31C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  _BYTE *v14;
  uint64_t v15;
  BOOL v16;
  uint64_t v17;
  NSObject *v18;
  os_log_type_t v19;
  uint8_t *v20;
  void (*v21)(_BYTE *, uint64_t);
  void *v22;
  id v23;
  unsigned int v24;
  NSObject *v25;
  os_log_type_t v26;
  uint8_t *v27;
  id v28;
  unsigned int v29;
  _BYTE *v30;
  NSObject *v31;
  os_log_type_t v32;
  uint8_t *v33;
  _BYTE v34[16];
  _BYTE *v35;
  uint64_t v36;
  uint64_t v37;
  void (*v38)(_BYTE *, uint64_t, uint64_t);

  v3 = sub_1C88FFEC4();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = MEMORY[0x1E0C80A78](v3);
  v6 = MEMORY[0x1E0C80A78](v5);
  v7 = MEMORY[0x1E0C80A78](v6);
  v8 = MEMORY[0x1E0C80A78](v7);
  v10 = &v34[-v9];
  MEMORY[0x1E0C80A78](v8);
  v14 = &v34[-v13];
  v15 = *(_QWORD *)(v1 + OBJC_IVAR____TtC17HoverTextServices27HoverTextServiceAXUIService__client);
  if (a1)
  {
    if (v15)
      v16 = a1 == v15;
    else
      v16 = 0;
    if (!v16)
      return;
  }
  else if (v15)
  {
    return;
  }
  v35 = v12;
  v36 = v11;
  if (qword_1ED52A9C8 != -1)
    swift_once();
  v37 = v1;
  v17 = __swift_project_value_buffer(v3, (uint64_t)HTLog);
  swift_beginAccess();
  v38 = *(void (**)(_BYTE *, uint64_t, uint64_t))(v4 + 16);
  v38(v14, v17, v3);
  v18 = sub_1C88FFEAC();
  v19 = sub_1C88FFF24();
  if (os_log_type_enabled(v18, v19))
  {
    v20 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v20 = 0;
    _os_log_impl(&dword_1C88FA000, v18, v19, "Connection to HoverText UI Service was interrupted", v20, 2u);
    MEMORY[0x1CAA36DDC](v20, -1, -1);
  }

  v21 = *(void (**)(_BYTE *, uint64_t))(v4 + 8);
  v21(v14, v3);
  v22 = (void *)objc_opt_self();
  v23 = objc_msgSend(v22, sel_sharedInstance);
  v24 = objc_msgSend(v23, sel_hoverTextEnabled);

  if (v24)
  {
    v38(v10, v17, v3);
    v25 = sub_1C88FFEAC();
    v26 = sub_1C88FFF18();
    if (os_log_type_enabled(v25, v26))
    {
      v27 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v27 = 0;
      _os_log_impl(&dword_1C88FA000, v25, v26, "HoverText still enabled. Will attempt to relaunch", v27, 2u);
      MEMORY[0x1CAA36DDC](v27, -1, -1);
    }

    v21(v10, v3);
    sub_1C88FD110();
  }
  v28 = objc_msgSend(v22, sel_sharedInstance);
  v29 = objc_msgSend(v28, sel_hoverTextTypingEnabled);

  v30 = v35;
  if (v29)
  {
    v38(v35, v17, v3);
    v31 = sub_1C88FFEAC();
    v32 = sub_1C88FFF18();
    if (os_log_type_enabled(v31, v32))
    {
      v33 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v33 = 0;
      _os_log_impl(&dword_1C88FA000, v31, v32, "HoverText Typing still enabled. Will attempt to relaunch", v33, 2u);
      MEMORY[0x1CAA36DDC](v33, -1, -1);
    }

    v21(v30, v3);
    sub_1C88FDA00();
  }
}

void sub_1C88FEA60()
{
  sub_1C88FD110();
}

void sub_1C88FEA80()
{
  sub_1C88FD340();
}

void sub_1C88FEAA0(uint64_t a1, unint64_t a2)
{
  sub_1C88FD674(a1, a2);
}

void sub_1C88FEAC0()
{
  sub_1C88FDA00();
}

void sub_1C88FEAE0()
{
  sub_1C88FDC30();
}

uint64_t sub_1C88FEB00(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_1C88FEBD0(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_1C88FF3D0((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = MEMORY[0x1E0DEC2B8];
    v12[0] = a1;
    v12[1] = a2;
    v10 = *a3;
    if (*a3)
    {
      sub_1C88FF3D0((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_1C88FEBD0(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_1C88FFF48();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_1C88FED88(a5, a6);
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
  v8 = sub_1C88FFF90();
  if (!v8)
  {
    sub_1C88FFFA8();
    __break(1u);
LABEL_17:
    result = sub_1C88FFFC0();
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

uint64_t sub_1C88FED88(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_1C88FEE1C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_1C88FEFF4(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_1C88FEFF4(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_1C88FEE1C(uint64_t a1, unint64_t a2)
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
      v3 = sub_1C88FEF90(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_1C88FFF84();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_1C88FFFA8();
      __break(1u);
LABEL_10:
      v2 = sub_1C88FFF0C();
      if (!v2)
        return MEMORY[0x1E0DEE9D8];
    }
    sub_1C88FFFC0();
    __break(1u);
LABEL_14:
    result = sub_1C88FFFA8();
    __break(1u);
  }
  else
  {
    return MEMORY[0x1E0DEE9D8];
  }
  return result;
}

_QWORD *sub_1C88FEF90(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  size_t v5;

  if (a2 <= a1)
    v2 = a1;
  else
    v2 = a2;
  if (!v2)
    return (_QWORD *)MEMORY[0x1E0DEE9D8];
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EF8FCB90);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_1C88FEFF4(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EF8FCB90);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    v10 = (char *)MEMORY[0x1E0DEE9D8];
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
  result = sub_1C88FFFC0();
  __break(1u);
  return result;
}

uint64_t _s17HoverTextServices0aB20AXUIServiceMessageIDO8rawValueACSgSi_tcfC_0(unint64_t a1)
{
  if (a1 >= 6)
    return 5;
  else
    return (0x40302010005uLL >> (8 * a1));
}

unint64_t sub_1C88FF168()
{
  unint64_t result;

  result = qword_1EF8FCB00;
  if (!qword_1EF8FCB00)
  {
    result = MEMORY[0x1CAA36D88](&protocol conformance descriptor for HoverTextAXUIServiceMessageID, &type metadata for HoverTextAXUIServiceMessageID);
    atomic_store(result, (unint64_t *)&qword_1EF8FCB00);
  }
  return result;
}

unint64_t sub_1C88FF1AC(uint64_t a1)
{
  unint64_t result;

  result = sub_1C88FF1D0();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t sub_1C88FF1D0()
{
  unint64_t result;

  result = qword_1ED52A9B8;
  if (!qword_1ED52A9B8)
  {
    result = MEMORY[0x1CAA36D88](&protocol conformance descriptor for HoverTextAXUIServiceMessageID, &type metadata for HoverTextAXUIServiceMessageID);
    atomic_store(result, (unint64_t *)&qword_1ED52A9B8);
  }
  return result;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for HoverTextAXUIServiceMessageID(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFC)
    goto LABEL_17;
  if (a2 + 4 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 4) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 4;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 4;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 4;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 5;
  v8 = v6 - 5;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for HoverTextAXUIServiceMessageID(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 4 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 4) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFC)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFB)
    return ((uint64_t (*)(void))((char *)&loc_1C88FF300 + 4 * byte_1C8900555[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_1C88FF334 + 4 * byte_1C8900550[v4]))();
}

uint64_t sub_1C88FF334(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1C88FF33C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1C88FF344);
  return result;
}

uint64_t sub_1C88FF350(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1C88FF358);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_1C88FF35C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1C88FF364(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1C88FF370(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_1C88FF378(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for HoverTextAXUIServiceMessageID()
{
  return &type metadata for HoverTextAXUIServiceMessageID;
}

uint64_t type metadata accessor for HoverTextServiceAXUIService()
{
  return objc_opt_self();
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

uint64_t sub_1C88FF3D0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_1C88FF410()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_1C88FF434(void *a1, char a2)
{
  uint64_t v2;

  return sub_1C88FDF64(a1, a2 & 1, *(_QWORD *)(v2 + 16), "Failed to stop HoverText Typing: %@", "Client received HoverText Typing stop success callback", &OBJC_IVAR____TtC17HoverTextServices27HoverTextServiceAXUIService_hoverTextTypingEnabled, 0);
}

uint64_t sub_1C88FF470(uint64_t a1, void *a2)
{
  uint64_t v2;

  return sub_1C88FC734(a1, a2, *(void (**)(void *, uint64_t))(v2 + 16));
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

void sub_1C88FF490(id a1, char a2)
{
  if ((a2 & 1) != 0)

  else
    swift_bridgeObjectRelease();
}

uint64_t sub_1C88FF49C(void *a1, char a2)
{
  uint64_t v2;

  return sub_1C88FDF64(a1, a2 & 1, *(_QWORD *)(v2 + 16), "Failed to start HoverText Typing: %@", "Client received HoverText Typing start success callback", &OBJC_IVAR____TtC17HoverTextServices27HoverTextServiceAXUIService_hoverTextTypingEnabled, 1);
}

uint64_t sub_1C88FF4DC(void *a1, char a2)
{
  uint64_t v2;

  return sub_1C88FDF64(a1, a2 & 1, *(_QWORD *)(v2 + 16), "Failed to stop HoverText: %@", "Client received HoverText stop success callback", &OBJC_IVAR____TtC17HoverTextServices27HoverTextServiceAXUIService_hoverTextEnabled, 0);
}

uint64_t sub_1C88FF518(void *a1, char a2)
{
  uint64_t v2;

  return sub_1C88FDF64(a1, a2 & 1, *(_QWORD *)(v2 + 16), "Failed to start HoverText: %@", "Client received HoverText start success callback", &OBJC_IVAR____TtC17HoverTextServices27HoverTextServiceAXUIService_hoverTextEnabled, 1);
}

uint64_t objectdestroy_3Tm()
{
  uint64_t v0;

  if (*(_QWORD *)(v0 + 16))
    swift_release();
  return swift_deallocObject();
}

id HoverText.getter()
{
  if (qword_1ED52A950 != -1)
    swift_once();
  return (id)static HoverTextService.sharedInstance;
}

uint64_t *HoverTextService.sharedInstance.unsafeMutableAddressor()
{
  if (qword_1ED52A950 != -1)
    swift_once();
  return &static HoverTextService.sharedInstance;
}

id sub_1C88FF630()
{
  id result;

  result = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for HoverTextService()), sel_init);
  static HoverTextService.sharedInstance = (uint64_t)result;
  return result;
}

id static HoverTextService.sharedInstance.getter()
{
  if (qword_1ED52A950 != -1)
    swift_once();
  return (id)static HoverTextService.sharedInstance;
}

id HoverTextService.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> HoverTextService.startHoverText()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[3];
  uint64_t v4;
  uint64_t v5;

  sub_1C88FF830(v0 + OBJC_IVAR____TtC17HoverTextServices16HoverTextService_serviceImpl, (uint64_t)v3);
  v1 = v4;
  v2 = v5;
  __swift_project_boxed_opaque_existential_1(v3, v4);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v2);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v3);
}

uint64_t sub_1C88FF830(uint64_t a1, uint64_t a2)
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

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> HoverTextService.stopHoverText()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[3];
  uint64_t v4;
  uint64_t v5;

  sub_1C88FF830(v0 + OBJC_IVAR____TtC17HoverTextServices16HoverTextService_serviceImpl, (uint64_t)v3);
  v1 = v4;
  v2 = v5;
  __swift_project_boxed_opaque_existential_1(v3, v4);
  (*(void (**)(uint64_t, uint64_t))(v2 + 16))(v1, v2);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v3);
}

Swift::Void __swiftcall HoverTextService.showAlert(_:)(Swift::String a1)
{
  uint64_t v1;
  void *object;
  uint64_t countAndFlagsBits;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[3];
  uint64_t v7;
  uint64_t v8;

  object = a1._object;
  countAndFlagsBits = a1._countAndFlagsBits;
  sub_1C88FF830(v1 + OBJC_IVAR____TtC17HoverTextServices16HoverTextService_serviceImpl, (uint64_t)v6);
  v4 = v7;
  v5 = v8;
  __swift_project_boxed_opaque_existential_1(v6, v7);
  (*(void (**)(uint64_t, void *, uint64_t, uint64_t))(v5 + 24))(countAndFlagsBits, object, v4, v5);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v6);
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> HoverTextService.startHoverTextTyping()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[3];
  uint64_t v4;
  uint64_t v5;

  sub_1C88FF830(v0 + OBJC_IVAR____TtC17HoverTextServices16HoverTextService_serviceImpl, (uint64_t)v3);
  v1 = v4;
  v2 = v5;
  __swift_project_boxed_opaque_existential_1(v3, v4);
  (*(void (**)(uint64_t, uint64_t))(v2 + 32))(v1, v2);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v3);
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> HoverTextService.stopHoverTextTyping()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[3];
  uint64_t v4;
  uint64_t v5;

  sub_1C88FF830(v0 + OBJC_IVAR____TtC17HoverTextServices16HoverTextService_serviceImpl, (uint64_t)v3);
  v1 = v4;
  v2 = v5;
  __swift_project_boxed_opaque_existential_1(v3, v4);
  (*(void (**)(uint64_t, uint64_t))(v2 + 40))(v1, v2);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v3);
}

uint64_t type metadata accessor for HoverTextService()
{
  return objc_opt_self();
}

uint64_t sub_1C88FFE7C()
{
  return MEMORY[0x1E0CAEB20]();
}

uint64_t sub_1C88FFE88()
{
  return MEMORY[0x1E0CAEB38]();
}

uint64_t sub_1C88FFE94()
{
  return MEMORY[0x1E0CAEB50]();
}

uint64_t sub_1C88FFEA0()
{
  return MEMORY[0x1E0CAF980]();
}

uint64_t sub_1C88FFEAC()
{
  return MEMORY[0x1E0DF2240]();
}

uint64_t sub_1C88FFEB8()
{
  return MEMORY[0x1E0DF2248]();
}

uint64_t sub_1C88FFEC4()
{
  return MEMORY[0x1E0DF2258]();
}

uint64_t sub_1C88FFED0()
{
  return MEMORY[0x1E0CB17D8]();
}

uint64_t sub_1C88FFEDC()
{
  return MEMORY[0x1E0CB1808]();
}

uint64_t sub_1C88FFEE8()
{
  return MEMORY[0x1E0CB1940]();
}

uint64_t sub_1C88FFEF4()
{
  return MEMORY[0x1E0CB1980]();
}

uint64_t sub_1C88FFF00()
{
  return MEMORY[0x1E0DEA800]();
}

uint64_t sub_1C88FFF0C()
{
  return MEMORY[0x1E0DEA850]();
}

uint64_t sub_1C88FFF18()
{
  return MEMORY[0x1E0DF2270]();
}

uint64_t sub_1C88FFF24()
{
  return MEMORY[0x1E0DF2280]();
}

uint64_t sub_1C88FFF30()
{
  return MEMORY[0x1E0DF2290]();
}

uint64_t sub_1C88FFF3C()
{
  return MEMORY[0x1E0DEBC20]();
}

uint64_t sub_1C88FFF48()
{
  return MEMORY[0x1E0DEBC90]();
}

uint64_t sub_1C88FFF54()
{
  return MEMORY[0x1E0DEC168]();
}

uint64_t sub_1C88FFF60()
{
  return MEMORY[0x1E0DEC178]();
}

uint64_t sub_1C88FFF6C()
{
  return MEMORY[0x1E0DEC1B0]();
}

uint64_t sub_1C88FFF78()
{
  return MEMORY[0x1E0DEC2A8]();
}

uint64_t sub_1C88FFF84()
{
  return MEMORY[0x1E0DEC2B0]();
}

uint64_t sub_1C88FFF90()
{
  return MEMORY[0x1E0DEC588]();
}

uint64_t sub_1C88FFF9C()
{
  return MEMORY[0x1E0DEC8E0]();
}

uint64_t sub_1C88FFFA8()
{
  return MEMORY[0x1E0DECBE0]();
}

uint64_t sub_1C88FFFB4()
{
  return MEMORY[0x1E0DECD50]();
}

uint64_t sub_1C88FFFC0()
{
  return MEMORY[0x1E0DECD70]();
}

uint64_t sub_1C88FFFCC()
{
  return MEMORY[0x1E0DED1D0]();
}

uint64_t sub_1C88FFFD8()
{
  return MEMORY[0x1E0CB2650]();
}

uint64_t sub_1C88FFFE4()
{
  return MEMORY[0x1E0DEDB10]();
}

uint64_t sub_1C88FFFF0()
{
  return MEMORY[0x1E0DEDB18]();
}

uint64_t sub_1C88FFFFC()
{
  return MEMORY[0x1E0DEDB20]();
}

uint64_t sub_1C8900008()
{
  return MEMORY[0x1E0DEDB28]();
}

uint64_t sub_1C8900014()
{
  return MEMORY[0x1E0DEDEF8]();
}

uint64_t sub_1C8900020()
{
  return MEMORY[0x1E0DEDF10]();
}

uint64_t sub_1C890002C()
{
  return MEMORY[0x1E0DEDF40]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1E0C80928](aBlock);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x1E0C80958](aBlock);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x1E0DEEA28]();
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1E0C83EE0](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1E0C84098](__dst, __src, __len);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1E0DE7BB0](a1);
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7BD0](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D20](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_self()
{
  return MEMORY[0x1E0DE7D58]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E60](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E68](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

uint64_t swift_allocError()
{
  return MEMORY[0x1E0DEEAA8]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1E0DEEAB0]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x1E0DEEAD8]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x1E0DEEAF8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1E0DEEB08]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x1E0DEEB10]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1E0DEEB18]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x1E0DEEB20]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x1E0DEEB60]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x1E0DEEBF0]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x1E0DEEBF8]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x1E0DEEC50]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x1E0DEECE0]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x1E0DEED38]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1E0DEED50]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x1E0DEED78]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1E0DEEDD0]();
}

uint64_t swift_once()
{
  return MEMORY[0x1E0DEEE00]();
}

uint64_t swift_release()
{
  return MEMORY[0x1E0DEEE30]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1E0DEEE48]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1E0DEEE78]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x1E0DEEE80]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1E0DEEED0]();
}

