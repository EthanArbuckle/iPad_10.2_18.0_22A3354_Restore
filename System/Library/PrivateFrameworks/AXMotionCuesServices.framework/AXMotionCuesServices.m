AXMotionCuesService *AXMotionCuesManager()
{
  return +[AXMotionCuesService sharedInstance](AXMotionCuesService, "sharedInstance");
}

uint64_t sub_235CBC488()
{
  uint64_t v0;

  v0 = sub_235CC1660();
  __swift_allocate_value_buffer(v0, qword_2563785A8);
  __swift_project_value_buffer(v0, (uint64_t)qword_2563785A8);
  return sub_235CC1654();
}

uint64_t MCLog.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_2563785A0 != -1)
    swift_once();
  v2 = sub_235CC1660();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_2563785A8);
  swift_beginAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t MCLog.setter(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  if (qword_2563785A0 != -1)
    swift_once();
  v2 = sub_235CC1660();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_2563785A8);
  swift_beginAccess();
  v4 = *(_QWORD *)(v2 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 24))(v3, a1, v2);
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(a1, v2);
}

uint64_t (*MCLog.modify())()
{
  uint64_t v0;

  if (qword_2563785A0 != -1)
    swift_once();
  v0 = sub_235CC1660();
  __swift_project_value_buffer(v0, (uint64_t)qword_2563785A8);
  swift_beginAccess();
  return j__swift_endAccess;
}

id AXMotionCueSharedInstance.getter()
{
  if (qword_254299E40 != -1)
    swift_once();
  return (id)qword_254299E38;
}

id sub_235CBC71C()
{
  id result;

  result = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for AXMotionCuesService()), sel_init);
  qword_254299E38 = (uint64_t)result;
  return result;
}

id static AXMotionCuesService.sharedInstance.getter()
{
  if (qword_254299E40 != -1)
    swift_once();
  return (id)qword_254299E38;
}

unint64_t AXMotionCuesService.serviceName.getter()
{
  return 0xD000000000000012;
}

id sub_235CBC87C()
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

  v1 = OBJC_IVAR___AXMotionCuesService__client;
  v2 = *(void **)(v0 + OBJC_IVAR___AXMotionCuesService__client);
  if (v2)
  {
    v3 = *(id *)(v0 + OBJC_IVAR___AXMotionCuesService__client);
LABEL_6:
    v13 = v2;
    return v3;
  }
  v4 = v0;
  sub_235CC172C();
  swift_bridgeObjectRelease();
  v5 = objc_msgSend((id)objc_opt_self(), sel_processInfo);
  objc_msgSend(v5, sel_processIdentifier);

  sub_235CC1798();
  sub_235CC16A8();
  swift_bridgeObjectRelease();
  v6 = objc_allocWithZone(MEMORY[0x24BDFF8F0]);
  v7 = (void *)sub_235CC169C();
  swift_bridgeObjectRelease();
  v8 = (void *)sub_235CC169C();
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

uint64_t AXMotionCuesService.enable(completionBlock:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  _QWORD aBlock[6];

  v4 = sub_235CC1660();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&aBlock[-1] - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2563785A0 != -1)
    swift_once();
  v8 = __swift_project_value_buffer(v4, (uint64_t)qword_2563785A8);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v8, v4);
  v9 = sub_235CC1648();
  v10 = sub_235CC16D8();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_235CBA000, v9, v10, "Client requested enable for Motion Cues", v11, 2u);
    MEMORY[0x23B7DE8E8](v11, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  v12 = sub_235CBC87C();
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = a1;
  *(_QWORD *)(v13 + 24) = a2;
  v14 = swift_allocObject();
  *(_QWORD *)(v14 + 16) = sub_235CBCC78;
  *(_QWORD *)(v14 + 24) = v13;
  aBlock[4] = sub_235CBF68C;
  aBlock[5] = v14;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_235CBE034;
  aBlock[3] = &block_descriptor;
  v15 = _Block_copy(aBlock);
  swift_retain();
  swift_retain();
  swift_release();
  objc_msgSend(v12, sel_sendAsynchronousMessage_withIdentifier_targetAccessQueue_completion_, 0, 1, 0, v15);
  _Block_release(v15);

  return swift_release();
}

uint64_t sub_235CBCC54()
{
  swift_release();
  return swift_deallocObject();
}

void sub_235CBCC78(void *a1, char a2)
{
  uint64_t v2;

  sub_235CBCF54(a1, a2 & 1, *(void (**)(_QWORD, _QWORD))(v2 + 16), *(_QWORD *)(v2 + 24), "Failed to enable Motion Cues: %@", "Client received success for Motion Cues enable");
}

void sub_235CBCCC0(char a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  id v6;

  if (a2)
    v5 = sub_235CC160C();
  else
    v5 = 0;
  v6 = (id)v5;
  (*(void (**)(uint64_t, _QWORD))(a3 + 16))(a3, a1 & 1);

}

uint64_t AXMotionCuesService.disable(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  _QWORD aBlock[6];

  v4 = sub_235CC1660();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&aBlock[-1] - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2563785A0 != -1)
    swift_once();
  v8 = __swift_project_value_buffer(v4, (uint64_t)qword_2563785A8);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v8, v4);
  v9 = sub_235CC1648();
  v10 = sub_235CC16D8();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_235CBA000, v9, v10, "Client requested disable for Motion Cues", v11, 2u);
    MEMORY[0x23B7DE8E8](v11, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  v12 = sub_235CBC87C();
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = a1;
  *(_QWORD *)(v13 + 24) = a2;
  v14 = swift_allocObject();
  *(_QWORD *)(v14 + 16) = sub_235CBF6AC;
  *(_QWORD *)(v14 + 24) = v13;
  aBlock[4] = sub_235CC15E0;
  aBlock[5] = v14;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_235CBE034;
  aBlock[3] = &block_descriptor_13;
  v15 = _Block_copy(aBlock);
  swift_retain();
  swift_retain();
  swift_release();
  objc_msgSend(v12, sel_sendAsynchronousMessage_withIdentifier_targetAccessQueue_completion_, 0, 2, 0, v15);
  _Block_release(v15);

  return swift_release();
}

void sub_235CBCF54(void *a1, char a2, void (*a3)(_QWORD, _QWORD), uint64_t a4, const char *a5, const char *a6)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  NSObject *v20;
  os_log_type_t v21;
  uint8_t *v22;
  id v23;
  uint64_t v24;
  id v25;
  id v26;
  NSObject *v27;
  os_log_type_t v28;
  uint64_t v29;
  uint8_t *v30;
  uint64_t v31;
  _QWORD *v32;
  _QWORD *v33;
  id v34;
  uint64_t v35;
  void *v36;
  _QWORD *v37;
  id v38;
  uint8_t *v39;
  const char *v40;
  uint64_t v41;
  void (*v42)(_QWORD, _QWORD);
  uint64_t v43;

  v12 = sub_235CC1660();
  v13 = *(_QWORD *)(v12 - 8);
  v14 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v16 = (char *)&v39 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v14);
  v18 = (char *)&v39 - v17;
  if ((a2 & 1) != 0)
  {
    v23 = a1;
    if (qword_2563785A0 != -1)
      swift_once();
    v24 = __swift_project_value_buffer(v12, (uint64_t)qword_2563785A8);
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))(v16, v24, v12);
    v25 = a1;
    v26 = a1;
    v27 = sub_235CC1648();
    v28 = sub_235CC16CC();
    if (os_log_type_enabled(v27, v28))
    {
      v42 = a3;
      v29 = swift_slowAlloc();
      v40 = a5;
      v30 = (uint8_t *)v29;
      v31 = swift_slowAlloc();
      v41 = a4;
      v32 = (_QWORD *)v31;
      *(_DWORD *)v30 = 138412290;
      v39 = v30 + 4;
      sub_235CC13B0();
      swift_allocError();
      *v33 = a1;
      v34 = a1;
      v35 = _swift_stdlib_bridgeErrorToNSError();
      v43 = v35;
      sub_235CC16E4();
      *v32 = v35;
      a3 = v42;
      sub_235CC13A4(a1, 1);
      sub_235CC13A4(a1, 1);
      _os_log_impl(&dword_235CBA000, v27, v28, v40, v30, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2563784F0);
      swift_arrayDestroy();
      MEMORY[0x23B7DE8E8](v32, -1, -1);
      MEMORY[0x23B7DE8E8](v30, -1, -1);
    }
    else
    {
      sub_235CC13A4(a1, 1);
      sub_235CC13A4(a1, 1);
    }

    (*(void (**)(char *, uint64_t))(v13 + 8))(v16, v12);
    sub_235CC13B0();
    v36 = (void *)swift_allocError();
    *v37 = a1;
    v38 = a1;
    a3(0, v36);

    sub_235CC13A4(a1, 1);
  }
  else
  {
    if (qword_2563785A0 != -1)
      swift_once();
    v19 = __swift_project_value_buffer(v12, (uint64_t)qword_2563785A8);
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))(v18, v19, v12);
    v20 = sub_235CC1648();
    v21 = sub_235CC16D8();
    if (os_log_type_enabled(v20, v21))
    {
      v22 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v22 = 0;
      _os_log_impl(&dword_235CBA000, v20, v21, a6, v22, 2u);
      MEMORY[0x23B7DE8E8](v22, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v13 + 8))(v18, v12);
    a3(1, 0);
  }
}

uint64_t sub_235CBD344(void *a1, int a2, void *aBlock, uint64_t a4, uint64_t a5, void (*a6)(uint64_t, uint64_t))
{
  void *v9;
  uint64_t v10;
  id v11;

  v9 = _Block_copy(aBlock);
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = v9;
  v11 = a1;
  a6(a5, v10);

  return swift_release();
}

unint64_t sub_235CBD3C0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t result;
  char v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  BOOL v20;
  uint64_t v21;
  _QWORD v22[2];

  v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254299E20);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8]();
  v5 = (char *)v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(_QWORD *)(a1 + 16))
  {
    v7 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2563784E8);
  v6 = sub_235CC1780();
  v7 = (_QWORD *)v6;
  v8 = *(_QWORD *)(a1 + 16);
  if (!v8)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v7;
  }
  v9 = *(int *)(v2 + 48);
  v10 = v6 + 64;
  v11 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v22[1] = a1;
  v12 = a1 + v11;
  v13 = *(_QWORD *)(v3 + 72);
  swift_retain();
  while (1)
  {
    sub_235CC1350(v12, (uint64_t)v5, (uint64_t *)&unk_254299E20);
    result = sub_235CBFD98((uint64_t)v5);
    if ((v15 & 1) != 0)
      break;
    v16 = result;
    *(_QWORD *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v17 = v7[6];
    v18 = sub_235CC163C();
    result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(_QWORD *)(v18 - 8) + 32))(v17 + *(_QWORD *)(*(_QWORD *)(v18 - 8) + 72) * v16, v5, v18);
    *(_OWORD *)(v7[7] + 16 * v16) = *(_OWORD *)&v5[v9];
    v19 = v7[2];
    v20 = __OFADD__(v19, 1);
    v21 = v19 + 1;
    if (v20)
      goto LABEL_11;
    v7[2] = v21;
    v12 += v13;
    if (!--v8)
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

unint64_t sub_235CBD554(uint64_t a1)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_256378520);
  v2 = sub_235CC1780();
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
    sub_235CC1350(v6, (uint64_t)v15, &qword_256378528);
    result = sub_235CBFDFC((uint64_t)v15);
    if ((v8 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v9 = v3[6] + 40 * result;
    v10 = v15[0];
    v11 = v15[1];
    *(_QWORD *)(v9 + 32) = v16;
    *(_OWORD *)v9 = v10;
    *(_OWORD *)(v9 + 16) = v11;
    result = (unint64_t)sub_235CC1394(&v17, (_OWORD *)(v3[7] + 32 * result));
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

uint64_t AXMotionCuesService.registerMotionCuesMoving(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  uint64_t inited;
  id v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  void (*v23)(unint64_t, char *, uint64_t);
  void *v24;
  _QWORD *v25;
  uint64_t v26;
  void *v27;
  id v28;
  id v29;
  void *v30;
  unint64_t v31;
  uint64_t v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  void *v39;
  uint64_t aBlock;
  unint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t, void *);
  void *v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  uint64_t v45;

  v37 = a2;
  v35 = a1;
  v38 = a3;
  v3 = sub_235CC1660();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v33 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v36 = sub_235CC163C();
  v7 = *(_QWORD *)(v36 - 8);
  v8 = *(_QWORD *)(v7 + 64);
  v9 = MEMORY[0x24BDAC7A8](v36);
  v10 = (char *)&v33 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v33 - v11;
  sub_235CC1630();
  if (qword_2563785A0 != -1)
    swift_once();
  v13 = __swift_project_value_buffer(v3, (uint64_t)qword_2563785A8);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v13, v3);
  v14 = sub_235CC1648();
  v15 = sub_235CC16D8();
  if (os_log_type_enabled(v14, v15))
  {
    v16 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v16 = 0;
    _os_log_impl(&dword_235CBA000, v14, v15, "Attempting to register handler for Motion Cues moving", v16, 2u);
    MEMORY[0x23B7DE8E8](v16, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  v34 = sub_235CBC87C();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2563783F0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_235CC1BE0;
  aBlock = 0x7265747369676572;
  v41 = 0xE800000000000000;
  sub_235CC1720();
  *(_QWORD *)(inited + 96) = MEMORY[0x24BEE1328];
  *(_BYTE *)(inited + 72) = 1;
  sub_235CBD554(inited);
  v33 = sub_235CC166C();
  swift_bridgeObjectRelease();
  v18 = objc_msgSend((id)objc_opt_self(), sel_mainAccessQueue);
  v19 = v36;
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v10, v12, v36);
  v20 = (*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  v21 = (v8 + v20 + 7) & 0xFFFFFFFFFFFFFFF8;
  v22 = swift_allocObject();
  v23 = *(void (**)(unint64_t, char *, uint64_t))(v7 + 32);
  v23(v22 + v20, v10, v19);
  v24 = v39;
  *(_QWORD *)(v22 + v21) = v39;
  v25 = (_QWORD *)(v22 + ((v21 + 15) & 0xFFFFFFFFFFFFFFF8));
  v26 = v37;
  *v25 = v35;
  v25[1] = v26;
  v44 = sub_235CBF74C;
  v45 = v22;
  aBlock = MEMORY[0x24BDAC760];
  v41 = 1107296256;
  v42 = sub_235CBE034;
  v43 = &block_descriptor_19;
  v27 = _Block_copy(&aBlock);
  v28 = v24;
  swift_retain();
  swift_release();
  v29 = v34;
  v30 = (void *)v33;
  objc_msgSend(v34, sel_sendAsynchronousMessage_withIdentifier_targetAccessQueue_completion_, v33, 4, v18, v27);
  _Block_release(v27);

  v31 = v38;
  v23(v38, v12, v19);
  return (*(uint64_t (**)(unint64_t, _QWORD, uint64_t, uint64_t))(v7 + 56))(v31, 0, 1, v19);
}

uint64_t sub_235CBDAB8(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  id v27;
  NSObject *v28;
  os_log_type_t v29;
  uint8_t *v30;
  _QWORD *v31;
  id v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  void (*v40)(char *, uint64_t, uint64_t);
  char *v41;
  NSObject *v42;
  os_log_type_t v43;
  uint8_t *v44;
  uint64_t v45;
  unint64_t v46;
  void (*v47)(char *, uint64_t);
  uint64_t v48;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t *v55;
  char isUniquelyReferenced_nonNull_native;
  _QWORD v57[2];
  uint64_t v58;
  void (*v59)(char *, uint64_t, uint64_t);
  uint64_t v60;
  char *v61;
  uint64_t v62;
  char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68[3];

  v10 = sub_235CC163C();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)v57 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)v57 - v15;
  v17 = sub_235CC1660();
  v65 = *(_QWORD *)(v17 - 8);
  v66 = v17;
  v18 = MEMORY[0x24BDAC7A8](v17);
  v20 = (char *)v57 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v18);
  if (a1)
  {
    v22 = a1;
    if (qword_2563785A0 != -1)
      swift_once();
    v23 = v66;
    v24 = __swift_project_value_buffer(v66, (uint64_t)qword_2563785A8);
    swift_beginAccess();
    v25 = v65;
    (*(void (**)(char *, uint64_t, uint64_t))(v65 + 16))(v20, v24, v23);
    v26 = a1;
    v27 = a1;
    v28 = sub_235CC1648();
    v29 = sub_235CC16CC();
    if (os_log_type_enabled(v28, v29))
    {
      v30 = (uint8_t *)swift_slowAlloc();
      v31 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v30 = 138412290;
      v32 = a1;
      v33 = _swift_stdlib_bridgeErrorToNSError();
      v68[0] = v33;
      sub_235CC16E4();
      *v31 = v33;

      _os_log_impl(&dword_235CBA000, v28, v29, "Failed to register moving handler with error: %@", v30, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2563784F0);
      swift_arrayDestroy();
      MEMORY[0x23B7DE8E8](v31, -1, -1);
      MEMORY[0x23B7DE8E8](v30, -1, -1);

    }
    else
    {

    }
    return (*(uint64_t (**)(char *, uint64_t))(v25 + 8))(v20, v66);
  }
  else
  {
    v61 = v16;
    v62 = a4;
    v34 = (char *)v57 - v21;
    v63 = v14;
    v64 = a5;
    v60 = a3;
    if (qword_2563785A0 != -1)
      swift_once();
    v35 = v66;
    v36 = __swift_project_value_buffer(v66, (uint64_t)qword_2563785A8);
    swift_beginAccess();
    v37 = v65;
    v38 = v34;
    (*(void (**)(char *, uint64_t, uint64_t))(v65 + 16))(v34, v36, v35);
    v39 = v11;
    v40 = *(void (**)(char *, uint64_t, uint64_t))(v11 + 16);
    v41 = v61;
    v59 = v40;
    v40(v61, a2, v10);
    v42 = sub_235CC1648();
    v43 = sub_235CC16D8();
    if (os_log_type_enabled(v42, v43))
    {
      v44 = (uint8_t *)swift_slowAlloc();
      v58 = swift_slowAlloc();
      v68[0] = v58;
      *(_DWORD *)v44 = 136315138;
      v57[1] = v44 + 4;
      sub_235CC1310(&qword_256378500, MEMORY[0x24BDCEAB8]);
      v45 = sub_235CC1798();
      v67 = sub_235CBF758(v45, v46, v68);
      sub_235CC16E4();
      swift_bridgeObjectRelease();
      v47 = *(void (**)(char *, uint64_t))(v39 + 8);
      v47(v41, v10);
      _os_log_impl(&dword_235CBA000, v42, v43, "Motion Cues moving registration handler received: %s", v44, 0xCu);
      v48 = v58;
      swift_arrayDestroy();
      MEMORY[0x23B7DE8E8](v48, -1, -1);
      MEMORY[0x23B7DE8E8](v44, -1, -1);

      (*(void (**)(char *, uint64_t))(v65 + 8))(v38, v66);
    }
    else
    {
      v50 = v37;
      v47 = *(void (**)(char *, uint64_t))(v39 + 8);
      v47(v41, v10);

      (*(void (**)(char *, uint64_t))(v50 + 8))(v38, v66);
    }
    v51 = v62;
    v52 = (uint64_t)v63;
    v59(v63, a2, v10);
    v53 = swift_allocObject();
    v54 = v64;
    *(_QWORD *)(v53 + 16) = v51;
    *(_QWORD *)(v53 + 24) = v54;
    v55 = (uint64_t *)(v60 + OBJC_IVAR___AXMotionCuesService_movingHandlers);
    swift_beginAccess();
    swift_retain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v67 = *v55;
    *v55 = 0x8000000000000000;
    sub_235CC0734((uint64_t)sub_235CC15A8, v53, v52, isUniquelyReferenced_nonNull_native);
    *v55 = v67;
    swift_bridgeObjectRelease();
    v47((char *)v52, v10);
    return swift_endAccess();
  }
}

uint64_t sub_235CBE034(uint64_t a1, uint64_t a2, void *a3)
{
  void (*v4)(uint64_t, void *);
  uint64_t v5;
  id v6;

  v4 = *(void (**)(uint64_t, void *))(a1 + 32);
  if (a2)
    v5 = sub_235CC1678();
  else
    v5 = 0;
  swift_retain();
  v6 = a3;
  v4(v5, a3);
  swift_release();

  return swift_bridgeObjectRelease();
}

uint64_t AXMotionCuesService.unregisterMotionCuesMoving(_:)(uint64_t a1)
{
  return sub_235CBEBD8(a1, &OBJC_IVAR___AXMotionCuesService_movingHandlers);
}

uint64_t AXMotionCuesService.registerMotionCuesVisible(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  uint64_t inited;
  id v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  void (*v23)(unint64_t, char *, uint64_t);
  void *v24;
  _QWORD *v25;
  uint64_t v26;
  void *v27;
  id v28;
  id v29;
  void *v30;
  unint64_t v31;
  uint64_t v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  void *v39;
  uint64_t aBlock;
  unint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t, void *);
  void *v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  uint64_t v45;

  v37 = a2;
  v35 = a1;
  v38 = a3;
  v3 = sub_235CC1660();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v33 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v36 = sub_235CC163C();
  v7 = *(_QWORD *)(v36 - 8);
  v8 = *(_QWORD *)(v7 + 64);
  v9 = MEMORY[0x24BDAC7A8](v36);
  v10 = (char *)&v33 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v33 - v11;
  sub_235CC1630();
  if (qword_2563785A0 != -1)
    swift_once();
  v13 = __swift_project_value_buffer(v3, (uint64_t)qword_2563785A8);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v13, v3);
  v14 = sub_235CC1648();
  v15 = sub_235CC16D8();
  if (os_log_type_enabled(v14, v15))
  {
    v16 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v16 = 0;
    _os_log_impl(&dword_235CBA000, v14, v15, "Attempting to register handler for Motion Cues visible", v16, 2u);
    MEMORY[0x23B7DE8E8](v16, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  v34 = sub_235CBC87C();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2563783F0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_235CC1BE0;
  aBlock = 0x7265747369676572;
  v41 = 0xE800000000000000;
  sub_235CC1720();
  *(_QWORD *)(inited + 96) = MEMORY[0x24BEE1328];
  *(_BYTE *)(inited + 72) = 1;
  sub_235CBD554(inited);
  v33 = sub_235CC166C();
  swift_bridgeObjectRelease();
  v18 = objc_msgSend((id)objc_opt_self(), sel_mainAccessQueue);
  v19 = v36;
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v10, v12, v36);
  v20 = (*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  v21 = (v8 + v20 + 7) & 0xFFFFFFFFFFFFFFF8;
  v22 = swift_allocObject();
  v23 = *(void (**)(unint64_t, char *, uint64_t))(v7 + 32);
  v23(v22 + v20, v10, v19);
  v24 = v39;
  *(_QWORD *)(v22 + v21) = v39;
  v25 = (_QWORD *)(v22 + ((v21 + 15) & 0xFFFFFFFFFFFFFFF8));
  v26 = v37;
  *v25 = v35;
  v25[1] = v26;
  v44 = sub_235CC0C10;
  v45 = v22;
  aBlock = MEMORY[0x24BDAC760];
  v41 = 1107296256;
  v42 = sub_235CBE034;
  v43 = &block_descriptor_25;
  v27 = _Block_copy(&aBlock);
  v28 = v24;
  swift_retain();
  swift_release();
  v29 = v34;
  v30 = (void *)v33;
  objc_msgSend(v34, sel_sendAsynchronousMessage_withIdentifier_targetAccessQueue_completion_, v33, 3, v18, v27);
  _Block_release(v27);

  v31 = v38;
  v23(v38, v12, v19);
  return (*(uint64_t (**)(unint64_t, _QWORD, uint64_t, uint64_t))(v7 + 56))(v31, 0, 1, v19);
}

uint64_t sub_235CBE520(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  id v27;
  NSObject *v28;
  os_log_type_t v29;
  uint8_t *v30;
  _QWORD *v31;
  id v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  void (*v40)(char *, uint64_t, uint64_t);
  char *v41;
  NSObject *v42;
  os_log_type_t v43;
  uint8_t *v44;
  uint64_t v45;
  unint64_t v46;
  void (*v47)(char *, uint64_t);
  uint64_t v48;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t *v55;
  char isUniquelyReferenced_nonNull_native;
  _QWORD v57[2];
  uint64_t v58;
  void (*v59)(char *, uint64_t, uint64_t);
  uint64_t v60;
  char *v61;
  uint64_t v62;
  char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68[3];

  v10 = sub_235CC163C();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)v57 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)v57 - v15;
  v17 = sub_235CC1660();
  v65 = *(_QWORD *)(v17 - 8);
  v66 = v17;
  v18 = MEMORY[0x24BDAC7A8](v17);
  v20 = (char *)v57 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v18);
  if (a1)
  {
    v22 = a1;
    if (qword_2563785A0 != -1)
      swift_once();
    v23 = v66;
    v24 = __swift_project_value_buffer(v66, (uint64_t)qword_2563785A8);
    swift_beginAccess();
    v25 = v65;
    (*(void (**)(char *, uint64_t, uint64_t))(v65 + 16))(v20, v24, v23);
    v26 = a1;
    v27 = a1;
    v28 = sub_235CC1648();
    v29 = sub_235CC16CC();
    if (os_log_type_enabled(v28, v29))
    {
      v30 = (uint8_t *)swift_slowAlloc();
      v31 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v30 = 138412290;
      v32 = a1;
      v33 = _swift_stdlib_bridgeErrorToNSError();
      v68[0] = v33;
      sub_235CC16E4();
      *v31 = v33;

      _os_log_impl(&dword_235CBA000, v28, v29, "Failed to register visible handler with error: %@", v30, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2563784F0);
      swift_arrayDestroy();
      MEMORY[0x23B7DE8E8](v31, -1, -1);
      MEMORY[0x23B7DE8E8](v30, -1, -1);

    }
    else
    {

    }
    return (*(uint64_t (**)(char *, uint64_t))(v25 + 8))(v20, v66);
  }
  else
  {
    v61 = v16;
    v62 = a4;
    v34 = (char *)v57 - v21;
    v63 = v14;
    v64 = a5;
    v60 = a3;
    if (qword_2563785A0 != -1)
      swift_once();
    v35 = v66;
    v36 = __swift_project_value_buffer(v66, (uint64_t)qword_2563785A8);
    swift_beginAccess();
    v37 = v65;
    v38 = v34;
    (*(void (**)(char *, uint64_t, uint64_t))(v65 + 16))(v34, v36, v35);
    v39 = v11;
    v40 = *(void (**)(char *, uint64_t, uint64_t))(v11 + 16);
    v41 = v61;
    v59 = v40;
    v40(v61, a2, v10);
    v42 = sub_235CC1648();
    v43 = sub_235CC16D8();
    if (os_log_type_enabled(v42, v43))
    {
      v44 = (uint8_t *)swift_slowAlloc();
      v58 = swift_slowAlloc();
      v68[0] = v58;
      *(_DWORD *)v44 = 136315138;
      v57[1] = v44 + 4;
      sub_235CC1310(&qword_256378500, MEMORY[0x24BDCEAB8]);
      v45 = sub_235CC1798();
      v67 = sub_235CBF758(v45, v46, v68);
      sub_235CC16E4();
      swift_bridgeObjectRelease();
      v47 = *(void (**)(char *, uint64_t))(v39 + 8);
      v47(v41, v10);
      _os_log_impl(&dword_235CBA000, v42, v43, "Motion cues visible registration handler received %s", v44, 0xCu);
      v48 = v58;
      swift_arrayDestroy();
      MEMORY[0x23B7DE8E8](v48, -1, -1);
      MEMORY[0x23B7DE8E8](v44, -1, -1);

      (*(void (**)(char *, uint64_t))(v65 + 8))(v38, v66);
    }
    else
    {
      v50 = v37;
      v47 = *(void (**)(char *, uint64_t))(v39 + 8);
      v47(v41, v10);

      (*(void (**)(char *, uint64_t))(v50 + 8))(v38, v66);
    }
    v51 = v62;
    v52 = (uint64_t)v63;
    v59(v63, a2, v10);
    v53 = swift_allocObject();
    v54 = v64;
    *(_QWORD *)(v53 + 16) = v51;
    *(_QWORD *)(v53 + 24) = v54;
    v55 = (uint64_t *)(v60 + OBJC_IVAR___AXMotionCuesService_visibleHandlers);
    swift_beginAccess();
    swift_retain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v67 = *v55;
    *v55 = 0x8000000000000000;
    sub_235CC0734((uint64_t)sub_235CC12C8, v53, v52, isUniquelyReferenced_nonNull_native);
    *v55 = v67;
    swift_bridgeObjectRelease();
    v47((char *)v52, v10);
    return swift_endAccess();
  }
}

id sub_235CBEAB8(void *a1, uint64_t a2, const void *a3, uint64_t a4, uint64_t a5, void (*a6)(uint64_t, uint64_t))
{
  uint64_t v10;
  uint64_t v11;
  char *v12;
  void *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v20;

  v10 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2563784D8);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = _Block_copy(a3);
  v14 = swift_allocObject();
  *(_QWORD *)(v14 + 16) = v13;
  v15 = a1;
  a6(a5, v14);

  swift_release();
  v16 = sub_235CC163C();
  v17 = *(_QWORD *)(v16 - 8);
  v18 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48))(v12, 1, v16) != 1)
  {
    v18 = (void *)sub_235CC1618();
    (*(void (**)(char *, uint64_t))(v17 + 8))(v12, v16);
  }
  return v18;
}

uint64_t AXMotionCuesService.unregisterMotionCuesVisible(_:)(uint64_t a1)
{
  return sub_235CBEBD8(a1, &OBJC_IVAR___AXMotionCuesService_visibleHandlers);
}

uint64_t sub_235CBEBD8(uint64_t a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t *v4;
  unint64_t v5;
  char v6;
  char v7;
  uint64_t v8;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;

  v4 = (uint64_t *)(v2 + *a2);
  swift_beginAccess();
  swift_bridgeObjectRetain();
  v5 = sub_235CBFD98(a1);
  v7 = v6;
  swift_bridgeObjectRelease();
  v8 = 0;
  if ((v7 & 1) != 0)
  {
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v10 = *v4;
    v14 = *v4;
    *v4 = 0x8000000000000000;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      sub_235CC0940();
      v10 = v14;
    }
    v11 = *(_QWORD *)(v10 + 48);
    v12 = sub_235CC163C();
    (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 8))(v11 + *(_QWORD *)(*(_QWORD *)(v12 - 8) + 72) * v5, v12);
    v8 = *(_QWORD *)(*(_QWORD *)(v14 + 56) + 16 * v5);
    sub_235CC04A8(v5, v14);
    *v4 = v14;
    swift_bridgeObjectRelease();
  }
  swift_endAccess();
  return sub_235CC13F4(v8);
}

uint64_t sub_235CBECF0(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  id v6;
  uint64_t v7;
  uint64_t v9;

  v2 = sub_235CC163C();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_235CC1624();
  swift_beginAccess();
  v6 = a1;
  v7 = sub_235CC0028((uint64_t)v5);
  swift_endAccess();
  sub_235CC13F4(v7);

  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t AXMotionCuesService.userInterfaceClient(_:processMessageFromServer:withIdentifier:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_235CC0C8C(a2, a3);
}

id AXMotionCuesService.userInterfaceClient(_:accessQueueForProcessingMessageWithIdentifier:)()
{
  return objc_msgSend((id)objc_opt_self(), sel_mainAccessQueue);
}

void AXMotionCuesService.connectionWithServiceWasInterrupted(forUserInterfaceClient:)(id a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  id v9;
  uint64_t v10;
  void (*v11)(char *, uint64_t, uint64_t);
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  void (*v15)(char *, uint64_t);
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  uint64_t v19;

  v2 = sub_235CC1660();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v19 - v7;
  v9 = sub_235CBC87C();

  if (a1 && v9 == a1)
  {
    if (qword_2563785A0 != -1)
      swift_once();
    v10 = __swift_project_value_buffer(v2, (uint64_t)qword_2563785A8);
    swift_beginAccess();
    v11 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
    v11(v8, v10, v2);
    v12 = sub_235CC1648();
    v13 = sub_235CC16CC();
    if (os_log_type_enabled(v12, v13))
    {
      v14 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_235CBA000, v12, v13, "Connection to Motion Cues UI Service was interrupted", v14, 2u);
      MEMORY[0x23B7DE8E8](v14, -1, -1);
    }

    v15 = *(void (**)(char *, uint64_t))(v3 + 8);
    v15(v8, v2);
    if (_AXSMotionCuesEnabled())
    {
      v11(v6, v10, v2);
      v16 = sub_235CC1648();
      v17 = sub_235CC16C0();
      if (os_log_type_enabled(v16, v17))
      {
        v18 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v18 = 0;
        _os_log_impl(&dword_235CBA000, v16, v17, "Motion Cues still enabled. Will attempt to relaunch", v18, 2u);
        MEMORY[0x23B7DE8E8](v18, -1, -1);
      }

      v15(v6, v2);
      AXMotionCuesService.enable(completionBlock:)((uint64_t)sub_235CBF1A4, 0);
    }
  }
}

uint64_t sub_235CBF1A4(char a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  id v9;
  id v10;
  NSObject *v11;
  os_log_type_t v12;
  uint64_t v13;
  _QWORD *v14;
  id v15;
  uint64_t v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = sub_235CC1660();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2563785A0 != -1)
    swift_once();
  v8 = __swift_project_value_buffer(v4, (uint64_t)qword_2563785A8);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v8, v4);
  v9 = a2;
  v10 = a2;
  v11 = sub_235CC1648();
  v12 = sub_235CC16D8();
  if (os_log_type_enabled(v11, v12))
  {
    v13 = swift_slowAlloc();
    v14 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v13 = 67109378;
    LODWORD(v19) = a1 & 1;
    sub_235CC16E4();
    *(_WORD *)(v13 + 8) = 2112;
    if (a2)
    {
      v15 = a2;
      v16 = _swift_stdlib_bridgeErrorToNSError();
      v19 = v16;
      sub_235CC16E4();
    }
    else
    {
      v19 = 0;
      sub_235CC16E4();
      v16 = 0;
    }
    *v14 = v16;

    _os_log_impl(&dword_235CBA000, v11, v12, "Enabled Motion Cues: success %{BOOL}d, error %@", (uint8_t *)v13, 0x12u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2563784F0);
    swift_arrayDestroy();
    MEMORY[0x23B7DE8E8](v14, -1, -1);
    MEMORY[0x23B7DE8E8](v13, -1, -1);
  }
  else
  {

  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

id AXMotionCuesService.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_235CBF4FC(void *a1)
{
  id v2;

  v2 = a1;
  sub_235CC16A8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256378538);
  sub_235CC1750();

  return 0;
}

uint64_t sub_235CBF58C()
{
  void **v0;

  return sub_235CBF4FC(*v0);
}

uint64_t sub_235CBF5B0(uint64_t result, void *a2, void (*a3)(void *, uint64_t))
{
  id v5;
  unint64_t v6;
  unint64_t v7;

  if (a3)
  {
    if (a2)
    {
      sub_235CC1404((uint64_t)a3);
      v5 = a2;
      a3(a2, 1);

      return sub_235CC13F4((uint64_t)a3);
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
        v7 = sub_235CBD554(MEMORY[0x24BEE4AF8]);
      }
      swift_bridgeObjectRetain();
      a3((void *)v7, 0);
      sub_235CC13F4((uint64_t)a3);
      return swift_bridgeObjectRelease();
    }
  }
  return result;
}

uint64_t sub_235CBF68C(uint64_t a1, void *a2)
{
  uint64_t v2;

  return sub_235CBF5B0(a1, a2, *(void (**)(void *, uint64_t))(v2 + 16));
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

void sub_235CBF6AC(void *a1, char a2)
{
  uint64_t v2;

  sub_235CBCF54(a1, a2 & 1, *(void (**)(_QWORD, _QWORD))(v2 + 16), *(_QWORD *)(v2 + 24), "Failed to disable Motion Cues: %@", "Client received success for Motion Cues disable");
}

uint64_t objectdestroy_2Tm()
{
  uint64_t v0;

  if (*(_QWORD *)(v0 + 16))
    swift_release();
  return swift_deallocObject();
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x23B7DE888]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_235CBF74C(uint64_t a1, uint64_t a2)
{
  return sub_235CC0C1C(a1, a2, (uint64_t (*)(uint64_t, unint64_t, _QWORD, _QWORD, _QWORD))sub_235CBDAB8);
}

uint64_t sub_235CBF758(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_235CBF828(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_235CC1250((uint64_t)v12, *a3);
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
      sub_235CC1250((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_235CBF828(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_235CC16F0();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_235CBF9E0(a5, a6);
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
  v8 = sub_235CC1744();
  if (!v8)
  {
    sub_235CC175C();
    __break(1u);
LABEL_17:
    result = sub_235CC178C();
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

uint64_t sub_235CBF9E0(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_235CBFA74(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_235CBFC4C(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_235CBFC4C(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_235CBFA74(uint64_t a1, unint64_t a2)
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
      v3 = sub_235CBFBE8(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_235CC1738();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_235CC175C();
      __break(1u);
LABEL_10:
      v2 = sub_235CC16B4();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_235CC178C();
    __break(1u);
LABEL_14:
    result = sub_235CC175C();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_235CBFBE8(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_256378508);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_235CBFC4C(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_256378508);
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
  result = sub_235CC178C();
  __break(1u);
  return result;
}

unint64_t sub_235CBFD98(uint64_t a1)
{
  uint64_t v2;

  sub_235CC163C();
  sub_235CC1310(&qword_256378510, MEMORY[0x24BDCEA88]);
  v2 = sub_235CC1684();
  return sub_235CBFE2C(a1, v2);
}

unint64_t sub_235CBFDFC(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_235CC1708();
  return sub_235CBFF64(a1, v2);
}

unint64_t sub_235CBFE2C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(char *, unint64_t, uint64_t);
  char v14;
  _QWORD v16[2];

  v3 = v2;
  v16[1] = a1;
  v5 = sub_235CC163C();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8]();
  v8 = (char *)v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = -1 << *(_BYTE *)(v3 + 32);
  v10 = a2 & ~v9;
  if (((*(_QWORD *)(v3 + 64 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0)
  {
    v11 = ~v9;
    v12 = *(_QWORD *)(v6 + 72);
    v13 = *(void (**)(char *, unint64_t, uint64_t))(v6 + 16);
    do
    {
      v13(v8, *(_QWORD *)(v3 + 48) + v12 * v10, v5);
      sub_235CC1310(&qword_256378518, MEMORY[0x24BDCEA98]);
      v14 = sub_235CC1690();
      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
      if ((v14 & 1) != 0)
        break;
      v10 = (v10 + 1) & v11;
    }
    while (((*(_QWORD *)(v3 + 64 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0);
  }
  return v10;
}

unint64_t sub_235CBFF64(uint64_t a1, uint64_t a2)
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
      sub_235CC128C(*(_QWORD *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      v7 = MEMORY[0x23B7DE54C](v9, a1);
      sub_235CC11DC((uint64_t)v9);
      if ((v7 & 1) != 0)
        break;
      v4 = (v4 + 1) & v6;
    }
    while (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

uint64_t sub_235CC0028(uint64_t a1)
{
  uint64_t *v1;
  uint64_t *v2;
  unint64_t v4;
  char v5;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;

  v2 = v1;
  swift_bridgeObjectRetain();
  v4 = sub_235CBFD98(a1);
  LOBYTE(a1) = v5;
  swift_bridgeObjectRelease();
  if ((a1 & 1) == 0)
    return 0;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v7 = *v2;
  v12 = *v2;
  *v2 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_235CC0940();
    v7 = v12;
  }
  v8 = *(_QWORD *)(v7 + 48);
  v9 = sub_235CC163C();
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 8))(v8 + *(_QWORD *)(*(_QWORD *)(v9 - 8) + 72) * v4, v9);
  v10 = *(_QWORD *)(*(_QWORD *)(v7 + 56) + 16 * v4);
  sub_235CC04A8(v4, v7);
  *v2 = v7;
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_235CC0114(uint64_t a1, int a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t result;
  int64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  int64_t v22;
  _QWORD *v23;
  unint64_t v24;
  int64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  char v31;
  unint64_t v32;
  BOOL v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t *v36;
  int64_t v37;
  _QWORD *v38;
  int v39;
  __int128 v40;

  v3 = v2;
  v5 = sub_235CC163C();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v36 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2563784E8);
  v39 = a2;
  v10 = sub_235CC1774();
  v11 = v10;
  if (!*(_QWORD *)(v9 + 16))
    goto LABEL_41;
  v12 = 1 << *(_BYTE *)(v9 + 32);
  v13 = *(_QWORD *)(v9 + 64);
  v38 = (_QWORD *)(v9 + 64);
  if (v12 < 64)
    v14 = ~(-1 << v12);
  else
    v14 = -1;
  v15 = v14 & v13;
  v36 = v2;
  v37 = (unint64_t)(v12 + 63) >> 6;
  v16 = v10 + 64;
  result = swift_retain();
  v18 = 0;
  while (1)
  {
    if (v15)
    {
      v20 = __clz(__rbit64(v15));
      v15 &= v15 - 1;
      v21 = v20 | (v18 << 6);
      goto LABEL_22;
    }
    v22 = v18 + 1;
    if (__OFADD__(v18, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v22 >= v37)
      break;
    v23 = v38;
    v24 = v38[v22];
    ++v18;
    if (!v24)
    {
      v18 = v22 + 1;
      if (v22 + 1 >= v37)
        goto LABEL_34;
      v24 = v38[v18];
      if (!v24)
      {
        v25 = v22 + 2;
        if (v25 >= v37)
        {
LABEL_34:
          swift_release();
          v3 = v36;
          if ((v39 & 1) == 0)
            goto LABEL_41;
          goto LABEL_37;
        }
        v24 = v38[v25];
        if (!v24)
        {
          while (1)
          {
            v18 = v25 + 1;
            if (__OFADD__(v25, 1))
              goto LABEL_43;
            if (v18 >= v37)
              goto LABEL_34;
            v24 = v38[v18];
            ++v25;
            if (v24)
              goto LABEL_21;
          }
        }
        v18 = v25;
      }
    }
LABEL_21:
    v15 = (v24 - 1) & v24;
    v21 = __clz(__rbit64(v24)) + (v18 << 6);
LABEL_22:
    v26 = *(_QWORD *)(v6 + 72);
    v27 = *(_QWORD *)(v9 + 48) + v26 * v21;
    if ((v39 & 1) != 0)
    {
      (*(void (**)(char *, unint64_t, uint64_t))(v6 + 32))(v8, v27, v5);
      v40 = *(_OWORD *)(*(_QWORD *)(v9 + 56) + 16 * v21);
    }
    else
    {
      (*(void (**)(char *, unint64_t, uint64_t))(v6 + 16))(v8, v27, v5);
      v40 = *(_OWORD *)(*(_QWORD *)(v9 + 56) + 16 * v21);
      swift_retain();
    }
    sub_235CC1310(&qword_256378510, MEMORY[0x24BDCEA88]);
    result = sub_235CC1684();
    v28 = -1 << *(_BYTE *)(v11 + 32);
    v29 = result & ~v28;
    v30 = v29 >> 6;
    if (((-1 << v29) & ~*(_QWORD *)(v16 + 8 * (v29 >> 6))) != 0)
    {
      v19 = __clz(__rbit64((-1 << v29) & ~*(_QWORD *)(v16 + 8 * (v29 >> 6)))) | v29 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v31 = 0;
      v32 = (unint64_t)(63 - v28) >> 6;
      do
      {
        if (++v30 == v32 && (v31 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        v33 = v30 == v32;
        if (v30 == v32)
          v30 = 0;
        v31 |= v33;
        v34 = *(_QWORD *)(v16 + 8 * v30);
      }
      while (v34 == -1);
      v19 = __clz(__rbit64(~v34)) + (v30 << 6);
    }
    *(_QWORD *)(v16 + ((v19 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v19;
    result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v6 + 32))(*(_QWORD *)(v11 + 48) + v26 * v19, v8, v5);
    *(_OWORD *)(*(_QWORD *)(v11 + 56) + 16 * v19) = v40;
    ++*(_QWORD *)(v11 + 16);
  }
  swift_release();
  v3 = v36;
  v23 = v38;
  if ((v39 & 1) == 0)
    goto LABEL_41;
LABEL_37:
  v35 = 1 << *(_BYTE *)(v9 + 32);
  if (v35 >= 64)
    bzero(v23, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v23 = -1 << v35;
  *(_QWORD *)(v9 + 16) = 0;
LABEL_41:
  result = swift_release();
  *v3 = v11;
  return result;
}

unint64_t sub_235CC04A8(int64_t a1, uint64_t a2)
{
  uint64_t v4;
  unint64_t result;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v21;
  uint64_t v22;
  _OWORD *v23;
  _OWORD *v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  BOOL v29;
  uint64_t v30;
  uint64_t v31;
  void (*v32)(char *, unint64_t, uint64_t);
  unint64_t v33;
  uint64_t v34;

  v4 = sub_235CC163C();
  v34 = *(_QWORD *)(v4 - 8);
  result = MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v31 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = a2 + 64;
  v9 = -1 << *(_BYTE *)(a2 + 32);
  v10 = (a1 + 1) & ~v9;
  if (((1 << v10) & *(_QWORD *)(a2 + 64 + 8 * (v10 >> 6))) != 0)
  {
    v11 = ~v9;
    result = sub_235CC16FC();
    if ((*(_QWORD *)(v8 + 8 * (v10 >> 6)) & (1 << v10)) != 0)
    {
      v33 = (result + 1) & v11;
      v12 = *(_QWORD *)(v34 + 72);
      v32 = *(void (**)(char *, unint64_t, uint64_t))(v34 + 16);
      v13 = v11;
      do
      {
        v14 = v12;
        v15 = v12 * v10;
        v16 = v13;
        v32(v7, *(_QWORD *)(a2 + 48) + v12 * v10, v4);
        sub_235CC1310(&qword_256378510, MEMORY[0x24BDCEA88]);
        v17 = sub_235CC1684();
        result = (*(uint64_t (**)(char *, uint64_t))(v34 + 8))(v7, v4);
        v13 = v16;
        v18 = v17 & v16;
        if (a1 >= (uint64_t)v33)
        {
          if (v18 >= v33 && a1 >= (uint64_t)v18)
          {
LABEL_17:
            v21 = *(_QWORD *)(a2 + 48);
            result = v21 + v14 * a1;
            if (v14 * a1 < v15 || (v12 = v14, result >= v21 + v15 + v14))
            {
              result = swift_arrayInitWithTakeFrontToBack();
LABEL_22:
              v13 = v16;
              v12 = v14;
            }
            else if (v14 * a1 != v15)
            {
              result = swift_arrayInitWithTakeBackToFront();
              goto LABEL_22;
            }
            v22 = *(_QWORD *)(a2 + 56);
            v23 = (_OWORD *)(v22 + 16 * a1);
            v24 = (_OWORD *)(v22 + 16 * v10);
            if (a1 != v10 || (a1 = v10, v23 >= v24 + 1))
            {
              *v23 = *v24;
              a1 = v10;
            }
            goto LABEL_5;
          }
        }
        else if (v18 >= v33 || a1 >= (uint64_t)v18)
        {
          goto LABEL_17;
        }
        v12 = v14;
LABEL_5:
        v10 = (v10 + 1) & v13;
      }
      while (((*(_QWORD *)(v8 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0);
    }
    v25 = (uint64_t *)(v8 + 8 * ((unint64_t)a1 >> 6));
    v26 = *v25;
    v27 = (-1 << a1) - 1;
  }
  else
  {
    v25 = (uint64_t *)(v8 + 8 * ((unint64_t)a1 >> 6));
    v27 = *v25;
    v26 = (-1 << a1) - 1;
  }
  *v25 = v27 & v26;
  v28 = *(_QWORD *)(a2 + 16);
  v29 = __OFSUB__(v28, 1);
  v30 = v28 - 1;
  if (v29)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v30;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

uint64_t sub_235CC0734(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  _QWORD *v4;
  _QWORD **v5;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  _QWORD *v13;
  char v14;
  unint64_t v15;
  uint64_t v16;
  _BOOL8 v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t *v22;
  uint64_t result;
  uint64_t v24;
  unint64_t v25;
  char v26;
  uint64_t v27;
  uint64_t v28;

  v5 = (_QWORD **)v4;
  v28 = a2;
  v9 = sub_235CC163C();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v27 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = (_QWORD *)*v4;
  v15 = sub_235CBFD98(a3);
  v16 = v13[2];
  v17 = (v14 & 1) == 0;
  v18 = v16 + v17;
  if (__OFADD__(v16, v17))
  {
    __break(1u);
    goto LABEL_14;
  }
  v19 = v14;
  v20 = v13[3];
  if (v20 >= v18 && (a4 & 1) != 0)
  {
LABEL_7:
    v21 = *v5;
    if ((v19 & 1) != 0)
    {
LABEL_8:
      v22 = (uint64_t *)(v21[7] + 16 * v15);
      result = swift_release();
      v24 = v28;
      *v22 = a1;
      v22[1] = v24;
      return result;
    }
    goto LABEL_11;
  }
  if (v20 >= v18 && (a4 & 1) == 0)
  {
    sub_235CC0940();
    goto LABEL_7;
  }
  sub_235CC0114(v18, a4 & 1);
  v25 = sub_235CBFD98(a3);
  if ((v19 & 1) != (v26 & 1))
  {
LABEL_14:
    result = sub_235CC17A4();
    __break(1u);
    return result;
  }
  v15 = v25;
  v21 = *v5;
  if ((v19 & 1) != 0)
    goto LABEL_8;
LABEL_11:
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, a3, v9);
  return sub_235CC08A0(v15, (uint64_t)v12, a1, v28, v21);
}

uint64_t sub_235CC08A0(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  _QWORD *v13;
  uint64_t v14;
  BOOL v15;
  uint64_t v16;

  a5[(a1 >> 6) + 8] |= 1 << a1;
  v10 = a5[6];
  v11 = sub_235CC163C();
  result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(v10 + *(_QWORD *)(*(_QWORD *)(v11 - 8) + 72) * a1, a2, v11);
  v13 = (_QWORD *)(a5[7] + 16 * a1);
  *v13 = a3;
  v13[1] = a4;
  v14 = a5[2];
  v15 = __OFADD__(v14, 1);
  v16 = v14 + 1;
  if (v15)
    __break(1u);
  else
    a5[2] = v16;
  return result;
}

void *sub_235CC0940()
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
  unint64_t v10;
  int64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  void (*v22)(unint64_t, char *, uint64_t);
  int64_t v23;
  unint64_t v24;
  int64_t v25;
  uint64_t *v26;
  uint64_t v27;
  __int128 v28;

  v1 = v0;
  v2 = sub_235CC163C();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v26 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2563784E8);
  v6 = *v0;
  v7 = sub_235CC1768();
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
  v10 = (unint64_t)((1 << *(_BYTE *)(v8 + 32)) + 63) >> 6;
  if (v8 != v6 || (unint64_t)result >= v6 + 64 + 8 * v10)
    result = memmove(result, (const void *)(v6 + 64), 8 * v10);
  v27 = v6 + 64;
  v12 = 0;
  *(_QWORD *)(v8 + 16) = *(_QWORD *)(v6 + 16);
  v13 = 1 << *(_BYTE *)(v6 + 32);
  v14 = -1;
  if (v13 < 64)
    v14 = ~(-1 << v13);
  v15 = v14 & *(_QWORD *)(v6 + 64);
  v16 = (unint64_t)(v13 + 63) >> 6;
  while (1)
  {
    if (v15)
    {
      v17 = __clz(__rbit64(v15));
      v15 &= v15 - 1;
      v18 = v17 | (v12 << 6);
      goto LABEL_12;
    }
    v23 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v23 >= v16)
      goto LABEL_26;
    v24 = *(_QWORD *)(v27 + 8 * v23);
    ++v12;
    if (!v24)
    {
      v12 = v23 + 1;
      if (v23 + 1 >= v16)
        goto LABEL_26;
      v24 = *(_QWORD *)(v27 + 8 * v12);
      if (!v24)
        break;
    }
LABEL_25:
    v15 = (v24 - 1) & v24;
    v18 = __clz(__rbit64(v24)) + (v12 << 6);
LABEL_12:
    v19 = *(_QWORD *)(v3 + 72) * v18;
    (*(void (**)(char *, unint64_t, uint64_t))(v3 + 16))(v5, *(_QWORD *)(v6 + 48) + v19, v2);
    v20 = 16 * v18;
    v21 = *(_QWORD *)(v8 + 48) + v19;
    v22 = *(void (**)(unint64_t, char *, uint64_t))(v3 + 32);
    v28 = *(_OWORD *)(*(_QWORD *)(v6 + 56) + v20);
    v22(v21, v5, v2);
    *(_OWORD *)(*(_QWORD *)(v8 + 56) + v20) = v28;
    result = (void *)swift_retain();
  }
  v25 = v23 + 2;
  if (v25 >= v16)
  {
LABEL_26:
    result = (void *)swift_release();
    v1 = v26;
    goto LABEL_28;
  }
  v24 = *(_QWORD *)(v27 + 8 * v25);
  if (v24)
  {
    v12 = v25;
    goto LABEL_25;
  }
  while (1)
  {
    v12 = v25 + 1;
    if (__OFADD__(v25, 1))
      break;
    if (v12 >= v16)
      goto LABEL_26;
    v24 = *(_QWORD *)(v27 + 8 * v12);
    ++v25;
    if (v24)
      goto LABEL_25;
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t objectdestroy_15Tm()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v1 = sub_235CC163C();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = (*(_QWORD *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);

  swift_release();
  return swift_deallocObject();
}

uint64_t sub_235CC0C10(uint64_t a1, uint64_t a2)
{
  return sub_235CC0C1C(a1, a2, (uint64_t (*)(uint64_t, unint64_t, _QWORD, _QWORD, _QWORD))sub_235CBE520);
}

uint64_t sub_235CC0C1C(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t, unint64_t, _QWORD, _QWORD, _QWORD))
{
  uint64_t v3;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;

  v5 = *(_QWORD *)(sub_235CC163C() - 8);
  v6 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  v7 = (*(_QWORD *)(v5 + 64) + v6 + 7) & 0xFFFFFFFFFFFFFFF8;
  return a3(a2, v3 + v6, *(_QWORD *)(v3 + v7), *(_QWORD *)(v3 + ((v7 + 15) & 0xFFFFFFFFFFFFFFF8)), *(_QWORD *)(v3 + ((v7 + 15) & 0xFFFFFFFFFFFFFFF8) + 8));
}

uint64_t sub_235CC0C8C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  int64_t v9;
  uint64_t result;
  int64_t v11;
  char v12;
  unint64_t v13;
  unint64_t v14;
  int64_t v15;
  unint64_t v16;
  int64_t v17;
  void (*v18)(_BYTE *);
  unint64_t v19;
  char v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  int64_t v26;
  int64_t v27;
  char v28;
  unint64_t v29;
  unint64_t v30;
  int64_t v31;
  unint64_t v32;
  int64_t v33;
  void (*v34)(_BYTE *);
  unint64_t v35;
  char v36;
  uint64_t v37;
  uint64_t v38;
  _BYTE v39[40];
  __int128 v40;
  __int128 v41;
  char v42;

  if (a2 == 6)
  {
    v21 = (uint64_t *)(v2 + OBJC_IVAR___AXMotionCuesService_movingHandlers);
    swift_beginAccess();
    v22 = *v21;
    v38 = *v21 + 64;
    v23 = 1 << *(_BYTE *)(*v21 + 32);
    v24 = -1;
    if (v23 < 64)
      v24 = ~(-1 << v23);
    v25 = v24 & *(_QWORD *)(*v21 + 64);
    v26 = (unint64_t)(v23 + 63) >> 6;
    result = swift_bridgeObjectRetain();
    v27 = 0;
    while (1)
    {
      if (v25)
      {
        v29 = __clz(__rbit64(v25));
        v25 &= v25 - 1;
        v30 = v29 | (v27 << 6);
        if (!a1)
          goto LABEL_74;
      }
      else
      {
        v31 = v27 + 1;
        if (__OFADD__(v27, 1))
        {
LABEL_70:
          __break(1u);
          goto LABEL_71;
        }
        if (v31 >= v26)
          goto LABEL_67;
        v32 = *(_QWORD *)(v38 + 8 * v31);
        ++v27;
        if (!v32)
        {
          v27 = v31 + 1;
          if (v31 + 1 >= v26)
            goto LABEL_67;
          v32 = *(_QWORD *)(v38 + 8 * v27);
          if (!v32)
          {
            v27 = v31 + 2;
            if (v31 + 2 >= v26)
              goto LABEL_67;
            v32 = *(_QWORD *)(v38 + 8 * v27);
            if (!v32)
            {
              v27 = v31 + 3;
              if (v31 + 3 >= v26)
                goto LABEL_67;
              v32 = *(_QWORD *)(v38 + 8 * v27);
              if (!v32)
              {
                v33 = v31 + 4;
                if (v33 >= v26)
                  goto LABEL_67;
                v32 = *(_QWORD *)(v38 + 8 * v33);
                if (!v32)
                {
                  while (1)
                  {
                    v27 = v33 + 1;
                    if (__OFADD__(v33, 1))
                      goto LABEL_72;
                    if (v27 >= v26)
                      break;
                    v32 = *(_QWORD *)(v38 + 8 * v27);
                    ++v33;
                    if (v32)
                      goto LABEL_59;
                  }
LABEL_67:
                  swift_release();
                  return sub_235CBD554(MEMORY[0x24BEE4AF8]);
                }
                v27 = v33;
              }
            }
          }
        }
LABEL_59:
        v25 = (v32 - 1) & v32;
        v30 = __clz(__rbit64(v32)) + (v27 << 6);
        if (!a1)
          goto LABEL_74;
      }
      v34 = *(void (**)(_BYTE *))(*(_QWORD *)(v22 + 56) + 16 * v30);
      *(_QWORD *)&v40 = 0x676E69766F6DLL;
      *((_QWORD *)&v40 + 1) = 0xE600000000000000;
      swift_retain();
      sub_235CC1720();
      if (*(_QWORD *)(a1 + 16) && (v35 = sub_235CBFDFC((uint64_t)v39), (v36 & 1) != 0))
      {
        sub_235CC1250(*(_QWORD *)(a1 + 56) + 32 * v35, (uint64_t)&v40);
      }
      else
      {
        v40 = 0u;
        v41 = 0u;
      }
      sub_235CC11DC((uint64_t)v39);
      if (!*((_QWORD *)&v41 + 1))
        break;
      if (!swift_dynamicCast())
        goto LABEL_39;
      v28 = v42;
LABEL_40:
      v39[0] = v28;
      v34(v39);
      result = swift_release();
    }
    sub_235CC1210((uint64_t)&v40);
LABEL_39:
    v28 = 0;
    goto LABEL_40;
  }
  if (a2 != 5)
    return sub_235CBD554(MEMORY[0x24BEE4AF8]);
  v4 = (uint64_t *)(v2 + OBJC_IVAR___AXMotionCuesService_visibleHandlers);
  swift_beginAccess();
  v5 = *v4;
  v37 = *v4 + 64;
  v6 = 1 << *(_BYTE *)(*v4 + 32);
  v7 = -1;
  if (v6 < 64)
    v7 = ~(-1 << v6);
  v8 = v7 & *(_QWORD *)(*v4 + 64);
  v9 = (unint64_t)(v6 + 63) >> 6;
  result = swift_bridgeObjectRetain();
  v11 = 0;
  while (1)
  {
    if (v8)
    {
      v13 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      v14 = v13 | (v11 << 6);
      if (!a1)
        goto LABEL_73;
      goto LABEL_28;
    }
    v15 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
      __break(1u);
      goto LABEL_70;
    }
    if (v15 >= v9)
      goto LABEL_67;
    v16 = *(_QWORD *)(v37 + 8 * v15);
    ++v11;
    if (!v16)
    {
      v11 = v15 + 1;
      if (v15 + 1 >= v9)
        goto LABEL_67;
      v16 = *(_QWORD *)(v37 + 8 * v11);
      if (!v16)
      {
        v11 = v15 + 2;
        if (v15 + 2 >= v9)
          goto LABEL_67;
        v16 = *(_QWORD *)(v37 + 8 * v11);
        if (!v16)
        {
          v11 = v15 + 3;
          if (v15 + 3 >= v9)
            goto LABEL_67;
          v16 = *(_QWORD *)(v37 + 8 * v11);
          if (!v16)
            break;
        }
      }
    }
LABEL_27:
    v8 = (v16 - 1) & v16;
    v14 = __clz(__rbit64(v16)) + (v11 << 6);
    if (!a1)
      goto LABEL_73;
LABEL_28:
    v18 = *(void (**)(_BYTE *))(*(_QWORD *)(v5 + 56) + 16 * v14);
    *(_QWORD *)&v40 = 0x656C6269736976;
    *((_QWORD *)&v40 + 1) = 0xE700000000000000;
    swift_retain();
    sub_235CC1720();
    if (*(_QWORD *)(a1 + 16) && (v19 = sub_235CBFDFC((uint64_t)v39), (v20 & 1) != 0))
    {
      sub_235CC1250(*(_QWORD *)(a1 + 56) + 32 * v19, (uint64_t)&v40);
    }
    else
    {
      v40 = 0u;
      v41 = 0u;
    }
    sub_235CC11DC((uint64_t)v39);
    if (!*((_QWORD *)&v41 + 1))
    {
      sub_235CC1210((uint64_t)&v40);
LABEL_7:
      v12 = 0;
      goto LABEL_8;
    }
    if (!swift_dynamicCast())
      goto LABEL_7;
    v12 = v42;
LABEL_8:
    v39[0] = v12;
    v18(v39);
    result = swift_release();
  }
  v17 = v15 + 4;
  if (v17 >= v9)
    goto LABEL_67;
  v16 = *(_QWORD *)(v37 + 8 * v17);
  if (v16)
  {
    v11 = v17;
    goto LABEL_27;
  }
  while (1)
  {
    v11 = v17 + 1;
    if (__OFADD__(v17, 1))
      break;
    if (v11 >= v9)
      goto LABEL_67;
    v16 = *(_QWORD *)(v37 + 8 * v11);
    ++v17;
    if (v16)
      goto LABEL_27;
  }
LABEL_71:
  __break(1u);
LABEL_72:
  __break(1u);
LABEL_73:
  __break(1u);
LABEL_74:
  __break(1u);
  return result;
}

uint64_t type metadata accessor for AXMotionCuesService()
{
  return objc_opt_self();
}

uint64_t sub_235CC119C()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

uint64_t sub_235CC11C0(char a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(v1 + 16) + 16))(*(_QWORD *)(v1 + 16), a1 & 1);
}

void sub_235CC11D4(char a1, uint64_t a2)
{
  uint64_t v2;

  sub_235CBCCC0(a1, a2, *(_QWORD *)(v2 + 16));
}

uint64_t sub_235CC11DC(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(MEMORY[0x24BEE23D0] - 8) + 8))();
  return a1;
}

uint64_t sub_235CC1210(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563784F8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_235CC1250(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_235CC128C(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(MEMORY[0x24BEE23D0] - 8) + 16))(a2, a1);
  return a2;
}

uint64_t sub_235CC12C8(unsigned __int8 *a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(_QWORD))(v1 + 16))(*a1);
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

uint64_t sub_235CC1310(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = sub_235CC163C();
    result = MEMORY[0x23B7DE894](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_235CC1350(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

_OWORD *sub_235CC1394(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

void sub_235CC13A4(id a1, char a2)
{
  if ((a2 & 1) != 0)

  else
    swift_bridgeObjectRelease();
}

unint64_t sub_235CC13B0()
{
  unint64_t result;

  result = qword_256378530;
  if (!qword_256378530)
  {
    result = MEMORY[0x23B7DE894](&unk_235CC1CC4, &type metadata for AXUIError);
    atomic_store(result, (unint64_t *)&qword_256378530);
  }
  return result;
}

uint64_t sub_235CC13F4(uint64_t result)
{
  if (result)
    return swift_release();
  return result;
}

uint64_t sub_235CC1404(uint64_t result)
{
  if (result)
    return swift_retain();
  return result;
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

uint64_t sub_235CC1584()
{
  return 0;
}

ValueMetadata *type metadata accessor for AXUIError()
{
  return &type metadata for AXUIError;
}

uint64_t sub_235CC15E8()
{
  return MEMORY[0x24BDCBE60]();
}

uint64_t sub_235CC15F4()
{
  return MEMORY[0x24BDCBE68]();
}

uint64_t sub_235CC1600()
{
  return MEMORY[0x24BDCBE80]();
}

uint64_t sub_235CC160C()
{
  return MEMORY[0x24BDCD2F0]();
}

uint64_t sub_235CC1618()
{
  return MEMORY[0x24BDCE9D0]();
}

uint64_t sub_235CC1624()
{
  return MEMORY[0x24BDCE9F8]();
}

uint64_t sub_235CC1630()
{
  return MEMORY[0x24BDCEA40]();
}

uint64_t sub_235CC163C()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_235CC1648()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_235CC1654()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_235CC1660()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_235CC166C()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_235CC1678()
{
  return MEMORY[0x24BDCF830]();
}

uint64_t sub_235CC1684()
{
  return MEMORY[0x24BEE0610]();
}

uint64_t sub_235CC1690()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_235CC169C()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_235CC16A8()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_235CC16B4()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_235CC16C0()
{
  return MEMORY[0x24BEE78F0]();
}

uint64_t sub_235CC16CC()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_235CC16D8()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_235CC16E4()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_235CC16F0()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_235CC16FC()
{
  return MEMORY[0x24BEE22D0]();
}

uint64_t sub_235CC1708()
{
  return MEMORY[0x24BEE23A0]();
}

uint64_t sub_235CC1714()
{
  return MEMORY[0x24BEE23A8]();
}

uint64_t sub_235CC1720()
{
  return MEMORY[0x24BEE23E8]();
}

uint64_t sub_235CC172C()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_235CC1738()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_235CC1744()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_235CC1750()
{
  return MEMORY[0x24BEE2BE0]();
}

uint64_t sub_235CC175C()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_235CC1768()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_235CC1774()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_235CC1780()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_235CC178C()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_235CC1798()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_235CC17A4()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_235CC17B0()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_235CC17BC()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_235CC17C8()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_235CC17D4()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t _AXSMotionCuesEnabled()
{
  return MEMORY[0x24BED2350]();
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

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
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

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
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

