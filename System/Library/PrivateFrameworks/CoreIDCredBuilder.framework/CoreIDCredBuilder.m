id CIDCInternalSessionCryptarch.__allocating_init(role:curve:variant:)(uint64_t a1, unint64_t a2, unint64_t a3)
{
  objc_class *v3;
  id v7;

  v7 = objc_allocWithZone(v3);
  return CIDCInternalSessionCryptarch.init(role:curve:variant:)(a1, a2, a3);
}

id CIDCInternalSessionCryptarch.init(role:curve:variant:)(uint64_t a1, unint64_t a2, unint64_t a3)
{
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
  char *v16;
  unsigned int *v17;
  char *v18;
  objc_class *v19;
  id result;
  id v21[2];
  objc_super v22;

  v6 = sub_219C07FE4();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8]();
  v9 = (char *)v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_219C07FF0();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8]();
  v13 = (char *)v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_219C07FCC();
  MEMORY[0x24BDAC7A8]();
  v16 = (char *)v21 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1 == 1)
  {
    v17 = (unsigned int *)MEMORY[0x24BE1D1E0];
  }
  else
  {
    if (a1)
      goto LABEL_8;
    v17 = (unsigned int *)MEMORY[0x24BE1D1E8];
  }
  (*(void (**)(char *, _QWORD))(v14 + 104))(v16, *v17);
  if (a3 < 3)
  {
    (*(void (**)(char *, _QWORD, uint64_t))(v11 + 104))(v13, **((unsigned int **)&unk_24DBC0D00 + a3), v10);
    if (a2 < 5)
    {
      (*(void (**)(char *, _QWORD, uint64_t))(v7 + 104))(v9, **((unsigned int **)&unk_24DBC0D18 + a2), v6);
      sub_219C08008();
      swift_allocObject();
      v18 = (char *)v21[1];
      *(_QWORD *)&v18[OBJC_IVAR____TtC17CoreIDCredBuilder28CIDCInternalSessionCryptarch_sessionCryptarch] = sub_219C07FD8();

      v19 = (objc_class *)type metadata accessor for CIDCInternalSessionCryptarch();
      v22.receiver = v18;
      v22.super_class = v19;
      return objc_msgSendSuper2(&v22, sel_init);
    }
  }
LABEL_8:
  result = (id)sub_219C081B8();
  __break(1u);
  return result;
}

uint64_t type metadata accessor for CIDCInternalSessionCryptarch()
{
  return objc_opt_self();
}

void sub_219C028DC()
{
  void *v0;

  sub_219C07FC0();
  if (v0)
  {
    sub_219C02978();
    sub_219C08134();
    sub_219C08188();
    swift_bridgeObjectRelease();
    swift_willThrow();

  }
}

unint64_t sub_219C02978()
{
  unint64_t result;

  result = qword_2550AF880;
  if (!qword_2550AF880)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2550AF880);
  }
  return result;
}

void sub_219C02AF0()
{
  void *v0;

  sub_219C07FB4();
  if (v0)
  {
    sub_219C02978();
    sub_219C08134();
    sub_219C08188();
    swift_bridgeObjectRelease();
    swift_willThrow();

  }
}

uint64_t sub_219C02D20(uint64_t a1, uint64_t a2)
{
  return sub_219C02D64(a1, a2, MEMORY[0x24BE1D210]);
}

uint64_t sub_219C02D48(uint64_t a1, uint64_t a2)
{
  return sub_219C02D64(a1, a2, MEMORY[0x24BE1D218]);
}

uint64_t sub_219C02D64(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  void *v3;
  uint64_t v4;

  v4 = a3();
  if (v3)
  {
    sub_219C02978();
    sub_219C08134();
    sub_219C08188();
    swift_bridgeObjectRelease();
    swift_willThrow();

  }
  return v4;
}

id sub_219C02E24(void *a1, uint64_t a2, void *a3, uint64_t a4, uint64_t (*a5)(uint64_t, unint64_t))
{
  id v7;
  id v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  void *v15;

  v7 = a3;
  v8 = a1;
  v9 = sub_219C07ED0();
  v11 = v10;

  v12 = a5(v9, v11);
  v14 = v13;

  sub_219C034A4(v9, v11);
  v15 = (void *)sub_219C07EC4();
  sub_219C034A4(v12, v14);
  return v15;
}

uint64_t sub_219C03004()
{
  return sub_219C07FFC();
}

id CIDCInternalSessionCryptarch.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void CIDCInternalSessionCryptarch.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id CIDCInternalSessionCryptarch.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CIDCInternalSessionCryptarch();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_219C030E4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t v16;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2550AF7D8);
  v4 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v6 = (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v16 - v7;
  if (sub_219C0802C() == a1 && v9 == a2)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    v10 = sub_219C081F4();
    swift_bridgeObjectRelease();
    if ((v10 & 1) == 0)
      return -1000;
  }
  sub_219C08014();
  v11 = sub_219C08020();
  v12 = *(_QWORD *)(v11 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v8, 1, v11) != 1)
  {
    sub_219C03568((uint64_t)v8, (uint64_t)v6);
    v13 = (*(uint64_t (**)(char *, uint64_t))(v12 + 88))(v6, v11);
    if (v13 != *MEMORY[0x24BE1D270])
    {
      if (v13 == *MEMORY[0x24BE1D248])
      {
        v14 = 1001;
        goto LABEL_8;
      }
      if (v13 == *MEMORY[0x24BE1D258])
      {
        v14 = 1002;
        goto LABEL_8;
      }
      if (v13 != *MEMORY[0x24BE1D260])
      {
        if (v13 == *MEMORY[0x24BE1D250])
        {
          v14 = -2002;
          goto LABEL_8;
        }
        if (v13 == *MEMORY[0x24BE1D268])
        {
          v14 = -3000;
          goto LABEL_8;
        }
        if (v13 == *MEMORY[0x24BE1D240])
        {
          v14 = -5000;
          goto LABEL_8;
        }
        if (v13 == *MEMORY[0x24BE1D238])
        {
          v14 = -6000;
          goto LABEL_8;
        }
        (*(void (**)(char *, uint64_t))(v12 + 8))(v6, v11);
      }
    }
  }
  v14 = -1000;
LABEL_8:
  sub_219C03528((uint64_t)v8);
  return v14;
}

uint64_t method lookup function for CIDCInternalSessionCryptarch()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of CIDCInternalSessionCryptarch.__allocating_init(role:curve:variant:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t dispatch thunk of CIDCInternalSessionCryptarch.setRemoteKey(_:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x60))();
}

uint64_t dispatch thunk of CIDCInternalSessionCryptarch.deriveSessionKeys(sessionTranscript:ikm:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x68))();
}

uint64_t dispatch thunk of CIDCInternalSessionCryptarch.decrypt(data:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x70))();
}

uint64_t dispatch thunk of CIDCInternalSessionCryptarch.encrypt(data:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x78))();
}

uint64_t dispatch thunk of CIDCInternalSessionCryptarch.publicKey.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x80))();
}

uint64_t sub_219C03490(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_219C034A4(a1, a2);
  return a1;
}

uint64_t sub_219C034A4(uint64_t a1, unint64_t a2)
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

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x220732454]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_219C03528(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550AF7D8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_219C03568(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550AF7D8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

id CIDCInternalPayloadBuilder.__allocating_init(delegate:payloadBuilder:)(uint64_t a1, void *a2)
{
  objc_class *v2;
  objc_class *v3;
  id v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  id v9;
  objc_super v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v3 = v2;
  v5 = objc_allocWithZone(v2);
  v6 = type metadata accessor for CIDCInternalPayloadBuilder.CIDCInternalPayloadBuilderDelegate();
  v7 = swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakAssign();
  swift_unknownObjectWeakAssign();
  v13 = v6;
  v14 = sub_219C07D8C(&qword_2550AF840, (uint64_t (*)(uint64_t))type metadata accessor for CIDCInternalPayloadBuilder.CIDCInternalPayloadBuilderDelegate, (uint64_t)&unk_219C08AF0);
  v12 = v7;
  sub_219C07EE8();
  objc_allocWithZone((Class)sub_219C080A4());
  v8 = (char *)v5;
  *(_QWORD *)&v8[OBJC_IVAR____TtC17CoreIDCredBuilder26CIDCInternalPayloadBuilder_payloadBuilder] = sub_219C08098();

  v11.receiver = v8;
  v11.super_class = v3;
  v9 = objc_msgSendSuper2(&v11, sel_init);
  swift_unknownObjectRelease();

  return v9;
}

id CIDCInternalPayloadBuilder.init(delegate:payloadBuilder:)(uint64_t a1, void *a2)
{
  id v3;

  v3 = sub_219C078A4();
  swift_unknownObjectRelease();

  return v3;
}

uint64_t sub_219C03798(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
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

  v2[2] = a1;
  v2[3] = v1;
  v3 = sub_219C07FA8();
  v2[4] = v3;
  v2[5] = *(_QWORD *)(v3 - 8);
  v2[6] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2550AF858);
  v2[7] = swift_task_alloc();
  v4 = sub_219C08038();
  v2[8] = v4;
  v2[9] = *(_QWORD *)(v4 - 8);
  v2[10] = swift_task_alloc();
  v5 = sub_219C07EE8();
  v2[11] = v5;
  v2[12] = *(_QWORD *)(v5 - 8);
  v2[13] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2550AF860);
  v2[14] = swift_task_alloc();
  v6 = sub_219C0808C();
  v2[15] = v6;
  v2[16] = *(_QWORD *)(v6 - 8);
  v2[17] = swift_task_alloc();
  v7 = sub_219C080EC();
  v2[18] = v7;
  v2[19] = *(_QWORD *)(v7 - 8);
  v2[20] = swift_task_alloc();
  v8 = sub_219C08080();
  v2[21] = v8;
  v2[22] = *(_QWORD *)(v8 - 8);
  v2[23] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2550AF868);
  v2[24] = swift_task_alloc();
  v9 = sub_219C07F6C();
  v2[25] = v9;
  v2[26] = *(_QWORD *)(v9 - 8);
  v2[27] = swift_task_alloc();
  v2[28] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2550AF870);
  v2[29] = swift_task_alloc();
  v10 = sub_219C080D4();
  v2[30] = v10;
  v2[31] = *(_QWORD *)(v10 - 8);
  v2[32] = swift_task_alloc();
  v2[33] = swift_task_alloc();
  v11 = sub_219C07F18();
  v2[34] = v11;
  v2[35] = *(_QWORD *)(v11 - 8);
  v2[36] = swift_task_alloc();
  v2[37] = swift_task_alloc();
  v2[38] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2550AF878);
  v2[39] = swift_task_alloc();
  v12 = sub_219C08050();
  v2[40] = v12;
  v2[41] = *(_QWORD *)(v12 - 8);
  v2[42] = swift_task_alloc();
  v2[43] = swift_task_alloc();
  return swift_task_switch();
}

void sub_219C03A60()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  uint64_t v22;
  int64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t i;
  int64_t v28;
  unint64_t v29;
  int64_t v30;
  uint64_t *v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD *v36;
  id v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  id v44;
  unint64_t v45;
  unint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  _QWORD *v51;
  char isUniquelyReferenced_nonNull_native;
  char v53;
  unint64_t v54;
  uint64_t v55;
  _BOOL8 v56;
  uint64_t v57;
  char v58;
  unint64_t v59;
  char v60;
  uint64_t v61;
  uint64_t *v62;
  uint64_t v63;
  BOOL v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  id v71;
  void *v72;
  id v73;
  id v74;
  void *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  void *v82;
  id v83;
  id v84;
  unsigned int *v85;
  unsigned int *v86;
  uint64_t v87;
  void *v88;
  _QWORD *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  int64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  int64_t v100;
  uint64_t v101;
  unint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  _QWORD *v111;
  uint64_t v112;
  uint64_t v113;
  unint64_t v114;
  unint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  void *v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  void (*v123)(_QWORD);

  v1 = v0[40];
  v2 = v0[41];
  v3 = v0[39];
  objc_msgSend((id)v0[2], sel_format);
  sub_219C08044();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v3, 1, v1) == 1)
  {
    sub_219C07DCC(v0[39], &qword_2550AF878);
    sub_219C07E08(0, (unint64_t *)&qword_2550AF880);
    sub_219C08134();
    sub_219C08194();
    swift_willThrow();
LABEL_53:
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    ((void (*)(void))v0[1])();
    return;
  }
  v4 = (void *)v0[2];
  (*(void (**)(_QWORD, _QWORD, _QWORD))(v0[41] + 32))(v0[43], v0[39], v0[40]);
  sub_219C07F0C();
  swift_allocObject();
  sub_219C07F00();
  v5 = objc_msgSend(v4, sel_deviceKey);
  v6 = sub_219C07ED0();
  v8 = v7;

  sub_219C07D8C(&qword_2550AF888, (uint64_t (*)(uint64_t))MEMORY[0x24BE101F0], MEMORY[0x24BE101F8]);
  sub_219C07EF4();
  sub_219C034A4(v6, v8);
  swift_release();
  v9 = v0[30];
  v10 = v0[31];
  v11 = v0[29];
  v12 = (void *)v0[2];
  (*(void (**)(_QWORD, _QWORD, _QWORD))(v0[35] + 32))(v0[38], v0[37], v0[34]);
  objc_msgSend(v12, sel_signingAlgorithm);
  sub_219C080C8();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(v11, 1, v9) == 1)
  {
    v13 = v0[43];
    v14 = v0[40];
    v15 = v0[41];
    v16 = v0[38];
    v17 = v0[34];
    v18 = v0[35];
    sub_219C07DCC(v0[29], &qword_2550AF870);
    sub_219C07E08(0, (unint64_t *)&qword_2550AF880);
    sub_219C08134();
    sub_219C08194();
    swift_willThrow();
    (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v16, v17);
    (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v13, v14);
    goto LABEL_53;
  }
  v19 = v0[26];
  v108 = v0[22];
  v20 = (void *)v0[2];
  (*(void (**)(_QWORD, _QWORD, _QWORD))(v0[31] + 32))(v0[33], v0[29], v0[30]);
  v102 = sub_219C04E0C(MEMORY[0x24BEE4AF8]);
  v21 = objc_msgSend(v20, sel_elements);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2550AF890);
  v22 = sub_219C08110();

  v23 = 0;
  v91 = v22 + 64;
  v98 = v22;
  v24 = -1;
  v25 = -1 << *(_BYTE *)(v22 + 32);
  if (-v25 < 64)
    v24 = ~(-1 << -(char)v25);
  v26 = v24 & *(_QWORD *)(v22 + 64);
  v93 = (unint64_t)(63 - v25) >> 6;
  v111 = v0;
  if (!v26)
    goto LABEL_9;
LABEL_8:
  v95 = (v26 - 1) & v26;
  for (i = __clz(__rbit64(v26)) | (v23 << 6); ; i = __clz(__rbit64(v29)) + (v23 << 6))
  {
    v100 = v23;
    v31 = (uint64_t *)(*(_QWORD *)(v98 + 48) + 16 * i);
    v32 = v31[1];
    v103 = *v31;
    v33 = *(_QWORD *)(*(_QWORD *)(v98 + 56) + 8 * i);
    if (v33 >> 62)
    {
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain();
      v34 = sub_219C081C4();
      swift_bridgeObjectRelease();
      v106 = v32;
      if (v34)
      {
LABEL_25:
        v35 = 0;
        v115 = v33 & 0xC000000000000001;
        v36 = (_QWORD *)MEMORY[0x24BEE4AF8];
        v112 = v34;
        v114 = v33;
        while (1)
        {
          v37 = v115 ? (id)MEMORY[0x220732124](v35, v33) : *(id *)(v33 + 8 * v35 + 32);
          v38 = v37;
          if (__OFADD__(v35, 1))
            break;
          v121 = v35 + 1;
          v39 = v0[24];
          v40 = v0[25];
          sub_219C051A8(v37, v39);
          if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v19 + 48))(v39, 1, v40) == 1)
          {
            v118 = v0[41];
            v120 = v0[40];
            v122 = v0[43];
            v116 = v0[38];
            v109 = v0[35];
            v113 = v0[34];
            v104 = v0[33];
            v66 = v0[31];
            v96 = v0[30];
            v67 = v0[24];
            v69 = v0[19];
            v68 = v0[20];
            v70 = v0[18];
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            sub_219C07DCC(v67, &qword_2550AF868);
            sub_219C081A0();
            swift_bridgeObjectRelease();
            v71 = objc_msgSend(v38, sel_debugDescription);
            sub_219C08134();

            sub_219C0814C();
            swift_bridgeObjectRelease();
            sub_219C0814C();
            (*(void (**)(uint64_t, _QWORD, uint64_t))(v69 + 104))(v68, *MEMORY[0x24BE1DC40], v70);
            sub_219C06574(MEMORY[0x24BEE4AF8]);
            sub_219C080F8();
            sub_219C07D8C(&qword_2550AF898, (uint64_t (*)(uint64_t))MEMORY[0x24BE1DE60], MEMORY[0x24BE1DE78]);
            swift_allocError();
            sub_219C08104();
            swift_willThrow();

            swift_release();
            (*(void (**)(uint64_t, uint64_t))(v66 + 8))(v104, v96);
            (*(void (**)(uint64_t, uint64_t))(v109 + 8))(v116, v113);
            (*(void (**)(uint64_t, uint64_t))(v118 + 8))(v122, v120);
            goto LABEL_53;
          }
          v41 = v0[27];
          v42 = v0[28];
          v43 = v0[25];
          (*(void (**)(uint64_t, _QWORD, uint64_t))(v19 + 32))(v42, v0[24], v43);
          v119 = v38;
          v44 = objc_msgSend(v38, sel_elementIdentifier);
          sub_219C08134();

          (*(void (**)(uint64_t, uint64_t, uint64_t))(v19 + 16))(v41, v42, v43);
          sub_219C08074();
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v36 = (_QWORD *)sub_219C07730(0, v36[2] + 1, 1, v36, &qword_2550AFA18, (uint64_t (*)(_QWORD))MEMORY[0x24BE1D678]);
          v46 = v36[2];
          v45 = v36[3];
          v0 = v111;
          if (v46 >= v45 >> 1)
            v36 = (_QWORD *)sub_219C07730(v45 > 1, v46 + 1, 1, v36, &qword_2550AFA18, (uint64_t (*)(_QWORD))MEMORY[0x24BE1D678]);
          v47 = v111[28];
          v48 = v111[25];
          v49 = v111[23];
          v50 = v111[21];
          v36[2] = v46 + 1;
          (*(void (**)(unint64_t, uint64_t, uint64_t))(v108 + 32))((unint64_t)v36+ ((*(unsigned __int8 *)(v108 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v108 + 80))+ *(_QWORD *)(v108 + 72) * v46, v49, v50);

          (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v47, v48);
          ++v35;
          v33 = v114;
          if (v121 == v112)
            goto LABEL_39;
        }
        __break(1u);
LABEL_63:
        __break(1u);
LABEL_64:
        __break(1u);
LABEL_65:
        __break(1u);
LABEL_66:
        __break(1u);
        return;
      }
    }
    else
    {
      v34 = *(_QWORD *)((v33 & 0xFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v106 = v32;
      if (v34)
        goto LABEL_25;
    }
    v36 = (_QWORD *)MEMORY[0x24BEE4AF8];
LABEL_39:
    swift_bridgeObjectRelease();
    v51 = (_QWORD *)v102;
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v54 = sub_219C06B60(v103, v106);
    v55 = *(_QWORD *)(v102 + 16);
    v56 = (v53 & 1) == 0;
    v57 = v55 + v56;
    if (__OFADD__(v55, v56))
      goto LABEL_63;
    v58 = v53;
    if (*(_QWORD *)(v102 + 24) >= v57)
    {
      if ((isUniquelyReferenced_nonNull_native & 1) != 0)
      {
        if ((v53 & 1) != 0)
          goto LABEL_46;
      }
      else
      {
        sub_219C0757C();
        v51 = (_QWORD *)v102;
        if ((v58 & 1) != 0)
          goto LABEL_46;
      }
    }
    else
    {
      sub_219C06F2C(v57, isUniquelyReferenced_nonNull_native);
      v59 = sub_219C06B60(v103, v106);
      if ((v58 & 1) != (v60 & 1))
      {
        sub_219C08200();
        return;
      }
      v54 = v59;
      v51 = (_QWORD *)v102;
      if ((v58 & 1) != 0)
      {
LABEL_46:
        v61 = v51[7];
        swift_bridgeObjectRelease();
        *(_QWORD *)(v61 + 8 * v54) = v36;
        goto LABEL_50;
      }
    }
    v51[(v54 >> 6) + 8] |= 1 << v54;
    v62 = (uint64_t *)(v51[6] + 16 * v54);
    *v62 = v103;
    v62[1] = v106;
    *(_QWORD *)(v51[7] + 8 * v54) = v36;
    v63 = v51[2];
    v64 = __OFADD__(v63, 1);
    v65 = v63 + 1;
    if (v64)
      goto LABEL_65;
    v51[2] = v65;
    swift_bridgeObjectRetain();
LABEL_50:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v23 = v100;
    v26 = v95;
    if (v95)
      goto LABEL_8;
LABEL_9:
    v28 = v23 + 1;
    if (__OFADD__(v23, 1))
      goto LABEL_64;
    if (v28 >= v93)
      break;
    v29 = *(_QWORD *)(v91 + 8 * v28);
    ++v23;
    if (v29)
      goto LABEL_22;
    v23 = v28 + 1;
    if (v28 + 1 >= v93)
      break;
    v29 = *(_QWORD *)(v91 + 8 * v23);
    if (v29)
      goto LABEL_22;
    v23 = v28 + 2;
    if (v28 + 2 >= v93)
      break;
    v29 = *(_QWORD *)(v91 + 8 * v23);
    if (v29)
      goto LABEL_22;
    v30 = v28 + 3;
    if (v30 >= v93)
      break;
    v29 = *(_QWORD *)(v91 + 8 * v30);
    if (!v29)
    {
      while (1)
      {
        v23 = v30 + 1;
        if (__OFADD__(v30, 1))
          goto LABEL_66;
        if (v23 >= v93)
          goto LABEL_54;
        v29 = *(_QWORD *)(v91 + 8 * v23);
        ++v30;
        if (v29)
          goto LABEL_22;
      }
    }
    v23 = v30;
LABEL_22:
    v95 = (v29 - 1) & v29;
  }
LABEL_54:
  swift_release();
  v72 = (void *)v0[2];
  (*(void (**)(_QWORD, _QWORD, _QWORD))(v0[41] + 16))(v0[42], v0[43], v0[40]);
  v73 = objc_msgSend(v72, sel_docType);
  sub_219C08134();

  v74 = objc_msgSend(v72, sel_validFrom);
  if (v74)
  {
    v75 = v74;
    sub_219C07EDC();

  }
  v90 = v0[35];
  v92 = v0[36];
  v94 = v0[34];
  v97 = v0[38];
  v76 = v0[32];
  v105 = v0[31];
  v107 = v0[30];
  v110 = v0[33];
  v77 = v0[9];
  v78 = v0[10];
  v80 = v0[7];
  v79 = v0[8];
  v81 = v0[6];
  v99 = v0[5];
  v101 = v0[4];
  v82 = (void *)v0[2];
  v117 = v0[3];
  (*(void (**)(void))(v0[12] + 56))();
  v83 = objc_msgSend(v82, sel_validUntil);
  sub_219C07EDC();

  v84 = objc_msgSend(v82, sel_timePolicy);
  v85 = (unsigned int *)MEMORY[0x24BE1D430];
  v86 = (unsigned int *)MEMORY[0x24BE1D428];
  if (v84 != (id)2)
    v86 = (unsigned int *)MEMORY[0x24BE1D420];
  if (v84 != (id)1)
    v85 = v86;
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v77 + 104))(v78, *v85, v79);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v90 + 16))(v92, v97, v94);
  v87 = sub_219C0805C();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v87 - 8) + 56))(v80, 1, 1, v87);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v105 + 16))(v76, v110, v107);
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v99 + 104))(v81, *MEMORY[0x24BE1D1A8], v101);
  sub_219C08068();
  v88 = *(void **)(v117 + OBJC_IVAR____TtC17CoreIDCredBuilder26CIDCInternalPayloadBuilder_payloadBuilder);
  v0[44] = v88;
  v123 = (void (*)(_QWORD))((int)*MEMORY[0x24BE1D908] + MEMORY[0x24BE1D908]);
  v88;
  v89 = (_QWORD *)swift_task_alloc();
  v0[45] = v89;
  *v89 = v0;
  v89[1] = sub_219C048B4;
  v123(v0[17]);
}

uint64_t sub_219C048B4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t v6;
  void *v7;

  v6 = *v3;
  v7 = *(void **)(*v3 + 352);
  *(_QWORD *)(*v3 + 368) = v2;
  swift_task_dealloc();

  if (!v2)
  {
    *(_QWORD *)(v6 + 376) = a2;
    *(_QWORD *)(v6 + 384) = a1;
  }
  return swift_task_switch();
}

uint64_t sub_219C04938()
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

  v1 = *(_QWORD *)(v0 + 344);
  v2 = *(_QWORD *)(v0 + 320);
  v3 = *(_QWORD *)(v0 + 328);
  v4 = *(_QWORD *)(v0 + 304);
  v5 = *(_QWORD *)(v0 + 280);
  v6 = *(_QWORD *)(v0 + 264);
  v7 = *(_QWORD *)(v0 + 272);
  v8 = *(_QWORD *)(v0 + 248);
  v9 = *(_QWORD *)(v0 + 240);
  (*(void (**)(void))(*(_QWORD *)(v0 + 128) + 8))();
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v6, v9);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v7);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(_QWORD, _QWORD))(v0 + 8))(*(_QWORD *)(v0 + 384), *(_QWORD *)(v0 + 376));
}

uint64_t sub_219C04AD4()
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

  v1 = *(_QWORD *)(v0 + 344);
  v2 = *(_QWORD *)(v0 + 320);
  v3 = *(_QWORD *)(v0 + 328);
  v4 = *(_QWORD *)(v0 + 304);
  v5 = *(_QWORD *)(v0 + 272);
  v6 = *(_QWORD *)(v0 + 280);
  v7 = *(_QWORD *)(v0 + 264);
  v8 = *(_QWORD *)(v0 + 240);
  v9 = *(_QWORD *)(v0 + 248);
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 128) + 8))(*(_QWORD *)(v0 + 136), *(_QWORD *)(v0 + 120));
  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v7, v8);
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

unint64_t sub_219C04C6C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t result;
  char v17;
  unint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;
  _QWORD v25[2];

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550AFA58);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (_QWORD *)((char *)v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  if (!*(_QWORD *)(a1 + 16))
  {
    v7 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2550AFA50);
  v6 = sub_219C081E8();
  v7 = (_QWORD *)v6;
  v8 = *(_QWORD *)(a1 + 16);
  if (!v8)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v7;
  }
  v9 = (char *)v5 + *(int *)(v2 + 48);
  v10 = v6 + 64;
  v11 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v25[1] = a1;
  v12 = a1 + v11;
  v13 = *(_QWORD *)(v3 + 72);
  swift_retain();
  while (1)
  {
    sub_219C07E40(v12, (uint64_t)v5, &qword_2550AFA58);
    v14 = *v5;
    v15 = v5[1];
    result = sub_219C06B60(*v5, v15);
    if ((v17 & 1) != 0)
      break;
    v18 = result;
    *(_QWORD *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v19 = (uint64_t *)(v7[6] + 16 * result);
    *v19 = v14;
    v19[1] = v15;
    v20 = v7[7];
    v21 = sub_219C07F6C();
    result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(_QWORD *)(v21 - 8) + 32))(v20 + *(_QWORD *)(*(_QWORD *)(v21 - 8) + 72) * v18, v9, v21);
    v22 = v7[2];
    v23 = __OFADD__(v22, 1);
    v24 = v22 + 1;
    if (v23)
      goto LABEL_11;
    v7[2] = v24;
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

unint64_t sub_219C04E0C(uint64_t a1)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_2550AFA10);
  v2 = (_QWORD *)sub_219C081E8();
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
    swift_bridgeObjectRetain();
    result = sub_219C06B60(v5, v6);
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

uint64_t sub_219C05054(void *a1, void *aBlock, void *a3)
{
  _QWORD *v3;
  id v6;
  _QWORD *v7;

  v3[2] = a1;
  v3[3] = a3;
  v3[4] = _Block_copy(aBlock);
  v6 = a1;
  a3;
  v7 = (_QWORD *)swift_task_alloc();
  v3[5] = v7;
  *v7 = v3;
  v7[1] = sub_219C050D0;
  return sub_219C03798((uint64_t)v6);
}

uint64_t sub_219C050D0(uint64_t a1, unint64_t a2)
{
  void *v2;
  uint64_t *v3;
  void *v4;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void (**v14)(_QWORD, _QWORD, _QWORD);

  v4 = v2;
  v7 = *v3;
  v9 = *(void **)(*v3 + 16);
  v8 = *(void **)(*v3 + 24);
  v10 = *v3;
  swift_task_dealloc();

  if (v4)
  {
    v11 = sub_219C07EB8();

    v12 = 0;
    v13 = (void *)v11;
  }
  else
  {
    v12 = sub_219C07EC4();
    sub_219C034A4(a1, a2);
    v11 = 0;
    v13 = (void *)v12;
  }
  v14 = *(void (***)(_QWORD, _QWORD, _QWORD))(v7 + 32);
  v14[2](v14, v12, v11);

  _Block_release(v14);
  return (*(uint64_t (**)(void))(v10 + 8))();
}

uint64_t sub_219C051A8@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
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
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  char *v32;
  void *v33;
  id v34;
  void *v35;
  uint64_t v36;
  id v37;
  void *v38;
  uint64_t result;
  id v40;
  unint64_t v41;
  id v42;
  void *v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  void (*v47)(char *, char *, uint64_t);
  uint64_t v48;
  char *v49;
  uint64_t v50;
  id v51;
  void *v52;
  id v53;
  void *v54;
  unint64_t v55;
  uint64_t v56;
  uint64_t v57;
  int64_t v58;
  _QWORD *v59;
  uint64_t v60;
  id v61;
  void *v62;
  int64_t v63;
  void (*v64)(int64_t, uint64_t, id);
  unint64_t v65;
  unint64_t v66;
  BOOL v67;
  uint64_t (*v68)(uint64_t, uint64_t, uint64_t, id);
  uint64_t v69;
  uint64_t v70;
  id v71;
  void *v72;
  uint64_t v73;
  int64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  unint64_t v78;
  uint64_t v79;
  char *v80;
  unint64_t v81;
  void *v82;
  unint64_t v83;
  unint64_t v84;
  int64_t v85;
  unint64_t v86;
  int64_t v87;
  uint64_t *v88;
  uint64_t v89;
  uint64_t v90;
  void *v91;
  void *v92;
  unint64_t v93;
  void (*v94)(unint64_t, uint64_t, void *);
  int isUniquelyReferenced_nonNull_native;
  char v96;
  unint64_t v97;
  uint64_t v98;
  _BOOL8 v99;
  uint64_t v100;
  char v101;
  unint64_t v102;
  char v103;
  _QWORD *v104;
  uint64_t *v105;
  uint64_t v106;
  BOOL v107;
  uint64_t v108;
  char *v109;
  char *v110;
  uint64_t v111;
  char *v112;
  uint64_t v113;
  char *v114;
  int64_t v115;
  char *v116;
  char *v117;
  char *v118;
  char *v119;
  char *v120;
  char *v121;
  uint64_t v122;
  void *v123;
  unint64_t v124;
  _QWORD *v125;

  v122 = a2;
  v3 = sub_219C07F9C();
  MEMORY[0x24BDAC7A8](v3);
  v118 = (char *)&v109 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_219C07F84();
  MEMORY[0x24BDAC7A8](v5);
  v117 = (char *)&v109 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550AF868);
  v8 = MEMORY[0x24BDAC7A8](v7);
  v119 = (char *)&v109 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v121 = (char *)&v109 - v10;
  v11 = sub_219C07F6C();
  v12 = *(_QWORD *)(v11 - 8);
  v123 = (void *)v11;
  v124 = v12;
  v13 = MEMORY[0x24BDAC7A8](v11);
  v120 = (char *)&v109 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v109 - v16;
  v18 = MEMORY[0x24BDAC7A8](v15);
  v20 = (char *)&v109 - v19;
  MEMORY[0x24BDAC7A8](v18);
  v22 = (char *)&v109 - v21;
  v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550AF860);
  MEMORY[0x24BDAC7A8](v23);
  v25 = (char *)&v109 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = sub_219C07EE8();
  v27 = *(_QWORD *)(v26 - 8);
  v28 = MEMORY[0x24BDAC7A8](v26);
  v30 = (char *)&v109 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v28);
  v32 = (char *)&v109 - v31;
  v33 = a1;
  v34 = objc_msgSend(a1, sel_stringValue);
  if (v34)
  {
    v35 = v34;
    sub_219C08134();

    v36 = v122;
    sub_219C07F3C();
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, void *))(v124 + 56))(v36, 0, 1, v123);
  }
  v109 = v32;
  v110 = v30;
  v111 = v27;
  v112 = v25;
  v113 = v26;
  v114 = v17;
  v115 = (int64_t)v22;
  v116 = v20;
  v37 = objc_msgSend(a1, sel_dataValue);
  if (v37)
  {
    v38 = v37;
    sub_219C07ED0();

    v36 = v122;
    sub_219C07F24();
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, void *))(v124 + 56))(v36, 0, 1, v123);
  }
  v40 = objc_msgSend(a1, sel_dateValue);
  v42 = v123;
  v41 = v124;
  if (v40)
  {
    v43 = v40;
    v44 = v110;
    sub_219C07EDC();

    v46 = v111;
    v45 = (uint64_t)v112;
    v47 = *(void (**)(char *, char *, uint64_t))(v111 + 32);
    v48 = v113;
    v47(v112, v44, v113);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v46 + 56))(v45, 0, 1, v48);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v46 + 48))(v45, 1, v48) != 1)
    {
      v49 = v109;
      v47(v109, (char *)v45, v48);
      (*(void (**)(char *, char *, uint64_t))(v46 + 16))(v44, v49, v48);
      v50 = v122;
      sub_219C07F30();
      (*(void (**)(char *, uint64_t))(v46 + 8))(v49, v48);
      goto LABEL_29;
    }
  }
  else
  {
    v45 = (uint64_t)v112;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v111 + 56))(v112, 1, 1, v113);
  }
  sub_219C07DCC(v45, &qword_2550AF860);
  v51 = objc_msgSend(v33, sel_numberValue);
  if (v51)
  {
    v52 = v51;
    objc_msgSend(v51, sel_integerValue);
    v50 = v122;
    sub_219C07F48();

    goto LABEL_29;
  }
  v53 = objc_msgSend(v33, sel_arrayValue);
  if (v53)
  {
    v54 = v53;
    sub_219C07E08(0, &qword_2550AFA40);
    v55 = sub_219C08158();

    if (v55 >> 62)
      goto LABEL_74;
    v56 = *(_QWORD *)((v55 & 0xFFFFFFFFFFFFF8) + 0x10);
    while (1)
    {
      v57 = (uint64_t)v121;
      v58 = v115;
      v59 = (_QWORD *)MEMORY[0x24BEE4AF8];
      if (!v56)
        break;
      v119 = (char *)v55;
      v120 = (char *)(v55 & 0xC000000000000001);
      v60 = 4;
      while (1)
      {
        v61 = v120 ? (id)MEMORY[0x220732124](v60 - 4, v55) : *(id *)(v55 + 8 * v60);
        v62 = v61;
        v55 = v60 - 3;
        if (__OFADD__(v60 - 4, 1))
          break;
        sub_219C051A8(v61);
        if ((*(unsigned int (**)(uint64_t, uint64_t, id))(v41 + 48))(v57, 1, v42) == 1)
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();

          sub_219C07DCC(v57, &qword_2550AF868);
          goto LABEL_67;
        }
        v63 = v58;
        v64 = *(void (**)(int64_t, uint64_t, id))(v41 + 32);
        v64(v63, v57, v42);
        (*(void (**)(char *, int64_t, id))(v41 + 16))(v116, v63, v42);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v59 = (_QWORD *)sub_219C07730(0, v59[2] + 1, 1, v59, &qword_2550AFA48, (uint64_t (*)(_QWORD))MEMORY[0x24BE1CA28]);
        v66 = v59[2];
        v65 = v59[3];
        if (v66 >= v65 >> 1)
          v59 = (_QWORD *)sub_219C07730(v65 > 1, v66 + 1, 1, v59, &qword_2550AFA48, (uint64_t (*)(_QWORD))MEMORY[0x24BE1CA28]);
        v59[2] = v66 + 1;
        v64((int64_t)v59+ ((*(unsigned __int8 *)(v41 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v41 + 80))+ *(_QWORD *)(v41 + 72) * v66, (uint64_t)v116, v42);

        v58 = v115;
        (*(void (**)(int64_t, id))(v41 + 8))(v115, v42);
        ++v60;
        v67 = v55 == v56;
        v57 = (uint64_t)v121;
        v55 = (unint64_t)v119;
        if (v67)
          goto LABEL_28;
      }
      __break(1u);
LABEL_71:
      __break(1u);
LABEL_72:
      __break(1u);
LABEL_73:
      __break(1u);
LABEL_74:
      swift_bridgeObjectRetain();
      v56 = sub_219C081C4();
      swift_bridgeObjectRelease();
    }
LABEL_28:
    swift_bridgeObjectRelease();
    sub_219C07F78();
    v50 = v122;
    sub_219C07F60();
LABEL_29:
    v68 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, id))(v41 + 56);
LABEL_30:
    v69 = v50;
    v70 = 0;
    return v68(v69, v70, 1, v42);
  }
  v71 = objc_msgSend(v33, sel_dictionaryValue);
  if (!v71)
  {
LABEL_67:
    v68 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, id))(v41 + 56);
    v69 = v122;
    v70 = 1;
    return v68(v69, v70, 1, v42);
  }
  v72 = v71;
  sub_219C07E08(0, &qword_2550AFA40);
  v73 = sub_219C08110();

  v41 = sub_219C04C6C(MEMORY[0x24BEE4AF8]);
  v74 = 0;
  v75 = *(_QWORD *)(v73 + 64);
  v113 = v73 + 64;
  v76 = 1 << *(_BYTE *)(v73 + 32);
  v77 = -1;
  if (v76 < 64)
    v77 = ~(-1 << v76);
  v78 = v77 & v75;
  v115 = (unint64_t)(v76 + 63) >> 6;
  v116 = (char *)v73;
  v79 = (uint64_t)v119;
  v80 = v120;
  v55 = (unint64_t)v114;
  while (1)
  {
    if (v78)
    {
      v121 = (char *)((v78 - 1) & v78);
      v84 = __clz(__rbit64(v78)) | (v74 << 6);
      goto LABEL_54;
    }
    v85 = v74 + 1;
    if (__OFADD__(v74, 1))
      goto LABEL_73;
    v50 = v122;
    if (v85 >= v115)
    {
LABEL_69:
      swift_release();
      sub_219C07F78();
      sub_219C07F54();
      v68 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, id))(v124 + 56);
      goto LABEL_30;
    }
    v86 = *(_QWORD *)(v113 + 8 * v85);
    ++v74;
    if (!v86)
    {
      v74 = v85 + 1;
      if (v85 + 1 >= v115)
        goto LABEL_69;
      v86 = *(_QWORD *)(v113 + 8 * v74);
      if (!v86)
      {
        v74 = v85 + 2;
        if (v85 + 2 >= v115)
          goto LABEL_69;
        v86 = *(_QWORD *)(v113 + 8 * v74);
        if (!v86)
          break;
      }
    }
LABEL_53:
    v121 = (char *)((v86 - 1) & v86);
    v84 = __clz(__rbit64(v86)) + (v74 << 6);
LABEL_54:
    v88 = (uint64_t *)(*((_QWORD *)v116 + 6) + 16 * v84);
    v89 = *v88;
    v90 = v88[1];
    v91 = *(void **)(*((_QWORD *)v116 + 7) + 8 * v84);
    swift_bridgeObjectRetain();
    v42 = v91;
    ((void (*)(void))sub_219C051A8)();
    v92 = v123;
    v93 = v124;
    if ((*(unsigned int (**)(uint64_t, uint64_t, void *))(v124 + 48))(v79, 1, v123) == 1)
    {
      swift_bridgeObjectRelease();
      swift_release();
      swift_bridgeObjectRelease();

      sub_219C07DCC(v79, &qword_2550AF868);
      return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, void *))(v93 + 56))(v122, 1, 1, v92);
    }
    v117 = (char *)v74;
    v94 = *(void (**)(unint64_t, uint64_t, void *))(v93 + 32);
    v94(v55, v79, v92);
    (*(void (**)(char *, unint64_t, void *))(v93 + 16))(v80, v55, v92);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v125 = (_QWORD *)v41;
    v97 = sub_219C06B60(v89, v90);
    v98 = *(_QWORD *)(v41 + 16);
    v99 = (v96 & 1) == 0;
    v100 = v98 + v99;
    if (__OFADD__(v98, v99))
      goto LABEL_71;
    v101 = v96;
    if (*(_QWORD *)(v41 + 24) >= v100)
    {
      v41 = v124;
      if ((isUniquelyReferenced_nonNull_native & 1) != 0)
      {
        v104 = v125;
        if ((v96 & 1) != 0)
          goto LABEL_36;
      }
      else
      {
        sub_219C07320();
        v104 = v125;
        if ((v101 & 1) != 0)
          goto LABEL_36;
      }
    }
    else
    {
      sub_219C06BC4(v100, isUniquelyReferenced_nonNull_native);
      v102 = sub_219C06B60(v89, v90);
      v41 = v124;
      if ((v101 & 1) != (v103 & 1))
        goto LABEL_76;
      v97 = v102;
      v104 = v125;
      if ((v101 & 1) != 0)
      {
LABEL_36:
        v81 = v104[7] + *(_QWORD *)(v41 + 72) * v97;
        v80 = v120;
        v82 = v123;
        (*(void (**)(unint64_t, char *, void *))(v41 + 40))(v81, v120, v123);
        v83 = v41;
        goto LABEL_37;
      }
    }
    v104[(v97 >> 6) + 8] |= 1 << v97;
    v105 = (uint64_t *)(v104[6] + 16 * v97);
    *v105 = v89;
    v105[1] = v90;
    v80 = v120;
    v94(v104[7] + *(_QWORD *)(v41 + 72) * v97, (uint64_t)v120, v123);
    v106 = v104[2];
    v107 = __OFADD__(v106, 1);
    v108 = v106 + 1;
    if (v107)
      goto LABEL_72;
    v104[2] = v108;
    swift_bridgeObjectRetain();
    v82 = v123;
    v83 = v124;
LABEL_37:
    v79 = (uint64_t)v119;
    v55 = (unint64_t)v114;
    v74 = (int64_t)v117;
    v78 = (unint64_t)v121;
    v41 = (unint64_t)v125;

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    (*(void (**)(unint64_t, void *))(v83 + 8))(v55, v82);
    v42 = v82;
  }
  v87 = v85 + 3;
  if (v87 >= v115)
    goto LABEL_69;
  v86 = *(_QWORD *)(v113 + 8 * v87);
  if (v86)
  {
    v74 = v87;
    goto LABEL_53;
  }
  while (1)
  {
    v74 = v87 + 1;
    if (__OFADD__(v87, 1))
      break;
    if (v74 >= v115)
      goto LABEL_69;
    v86 = *(_QWORD *)(v113 + 8 * v74);
    ++v87;
    if (v86)
      goto LABEL_53;
  }
  __break(1u);
LABEL_76:
  result = sub_219C08200();
  __break(1u);
  return result;
}

uint64_t sub_219C05C7C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;

  v5[18] = a4;
  v5[19] = v4;
  v5[16] = a1;
  v5[17] = a3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2550AF870);
  v5[20] = swift_task_alloc();
  v6 = sub_219C080D4();
  v5[21] = v6;
  v5[22] = *(_QWORD *)(v6 - 8);
  v5[23] = swift_task_alloc();
  v5[24] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_219C05D14()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;

  v1 = MEMORY[0x220732508](*(_QWORD *)(v0 + 152) + 16);
  *(_QWORD *)(v0 + 200) = v1;
  if (v1)
  {
    v2 = (void *)v1;
    v3 = MEMORY[0x220732508](*(_QWORD *)(v0 + 152) + 24);
    *(_QWORD *)(v0 + 208) = v3;
    if (v3)
    {
      v4 = v3;
      v5 = sub_219C07EC4();
      *(_QWORD *)(v0 + 216) = v5;
      *(_QWORD *)(v0 + 56) = v0 + 120;
      *(_QWORD *)(v0 + 16) = v0;
      *(_QWORD *)(v0 + 24) = sub_219C05F04;
      v6 = swift_continuation_init();
      *(_QWORD *)(v0 + 80) = MEMORY[0x24BDAC760];
      v7 = (_QWORD *)(v0 + 80);
      v7[1] = 0x40000000;
      v7[2] = sub_219C06340;
      v7[3] = &block_descriptor;
      v7[4] = v6;
      objc_msgSend(v2, sel_signPayloadWithBuilder_data_completion_, v4, v5, v7);
      return swift_continuation_await();
    }
    sub_219C07E08(0, (unint64_t *)&qword_2550AF880);
    sub_219C08134();
    sub_219C08194();
    swift_willThrow();
    swift_unknownObjectRelease();
  }
  else
  {
    sub_219C07E08(0, (unint64_t *)&qword_2550AF880);
    sub_219C08134();
    sub_219C08194();
    swift_willThrow();
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_219C05F04()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)v0 + 224) = *(_QWORD *)(*(_QWORD *)v0 + 48);
  return swift_task_switch();
}

uint64_t sub_219C05F64()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t (*v6)(void);
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  v1 = *(_QWORD *)(v0 + 168);
  v2 = *(_QWORD *)(v0 + 176);
  v3 = *(_QWORD *)(v0 + 160);
  v4 = *(void **)(v0 + 120);

  objc_msgSend(v4, sel_signingAlgorithm);
  sub_219C080C8();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v3, 1, v1) != 1)
  {
    (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(v0 + 176) + 32))(*(_QWORD *)(v0 + 192), *(_QWORD *)(v0 + 160), *(_QWORD *)(v0 + 168));
    v7 = objc_msgSend(v4, sel_issuerCertificate);
    if (v7)
    {
      v8 = v7;
      v10 = *(_QWORD *)(v0 + 184);
      v9 = *(_QWORD *)(v0 + 192);
      v11 = *(_QWORD *)(v0 + 168);
      v12 = *(_QWORD *)(v0 + 176);
      sub_219C08158();

      (*(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 16))(v10, v9, v11);
      v13 = objc_msgSend(v4, sel_signature);
      sub_219C07ED0();

      sub_219C080B0();
    }
    else
    {
      v14 = objc_msgSend(v4, sel_issuerKey);
      if (!v14)
      {
        v26 = *(void **)(v0 + 208);
        v27 = *(_QWORD *)(v0 + 192);
        v28 = *(_QWORD *)(v0 + 168);
        v29 = *(_QWORD *)(v0 + 176);
        sub_219C07E08(0, (unint64_t *)&qword_2550AF880);
        sub_219C08134();
        sub_219C08194();
        swift_willThrow();

        swift_unknownObjectRelease();
        (*(void (**)(uint64_t, uint64_t))(v29 + 8))(v27, v28);
        goto LABEL_3;
      }
      v15 = v14;
      v17 = *(_QWORD *)(v0 + 184);
      v16 = *(_QWORD *)(v0 + 192);
      v18 = *(_QWORD *)(v0 + 168);
      v19 = *(_QWORD *)(v0 + 176);
      sub_219C07ED0();

      (*(void (**)(uint64_t, uint64_t, uint64_t))(v19 + 16))(v17, v16, v18);
      v20 = objc_msgSend(v4, sel_signature);
      sub_219C07ED0();

      sub_219C080BC();
    }
    v21 = *(void **)(v0 + 208);
    v22 = *(_QWORD *)(v0 + 192);
    v23 = *(_QWORD *)(v0 + 168);
    v24 = *(_QWORD *)(v0 + 176);

    swift_unknownObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v22, v23);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    v6 = *(uint64_t (**)(void))(v0 + 8);
    return v6();
  }
  v5 = *(void **)(v0 + 208);
  sub_219C07DCC(*(_QWORD *)(v0 + 160), &qword_2550AF870);
  sub_219C07E08(0, (unint64_t *)&qword_2550AF880);
  sub_219C08134();
  sub_219C08194();
  swift_willThrow();

  swift_unknownObjectRelease();
LABEL_3:
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  v6 = *(uint64_t (**)(void))(v0 + 8);
  return v6();
}

uint64_t sub_219C062CC()
{
  uint64_t v0;
  void *v1;
  void *v2;

  v1 = *(void **)(v0 + 216);
  v2 = *(void **)(v0 + 208);
  swift_willThrow();

  swift_unknownObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_219C06340(uint64_t result, void *a2, void *a3)
{
  _QWORD *v4;
  id v5;
  id v6;

  if (a3)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2550AF9C0);
    swift_allocError();
    *v4 = a3;
    v5 = a3;
    return swift_continuation_throwingResumeWithError();
  }
  else if (a2)
  {
    **(_QWORD **)(*(_QWORD *)(*(_QWORD *)(result + 32) + 64) + 40) = a2;
    v6 = a2;
    return swift_continuation_throwingResume();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_219C063CC()
{
  uint64_t v0;

  sub_219C07AF0(v0 + 16);
  swift_unknownObjectWeakDestroy();
  return swift_deallocClassInstance();
}

uint64_t sub_219C063F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v9;

  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v9;
  *v9 = v4;
  v9[1] = sub_219C06474;
  return sub_219C05C7C(a1, a2, a3, a4);
}

uint64_t sub_219C06474()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

id CIDCInternalPayloadBuilder.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void CIDCInternalPayloadBuilder.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id CIDCInternalPayloadBuilder.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CIDCInternalPayloadBuilder();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t sub_219C06574(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  char *v9;
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

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550AFA20);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(_QWORD *)(a1 + 16))
  {
    v7 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2550AFA28);
  v6 = sub_219C081E8();
  v7 = (_QWORD *)v6;
  v8 = *(_QWORD *)(a1 + 16);
  if (!v8)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v7;
  }
  v9 = &v5[*(int *)(v2 + 48)];
  v10 = v6 + 64;
  v11 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v22[1] = a1;
  v12 = a1 + v11;
  v13 = *(_QWORD *)(v3 + 72);
  swift_retain();
  while (1)
  {
    sub_219C07E40(v12, (uint64_t)v5, &qword_2550AFA20);
    result = sub_219C06710((uint64_t)v5);
    if ((v15 & 1) != 0)
      break;
    v16 = result;
    *(_QWORD *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v17 = v7[6];
    v18 = sub_219C080E0();
    (*(void (**)(unint64_t, char *, uint64_t))(*(_QWORD *)(v18 - 8) + 32))(v17 + *(_QWORD *)(*(_QWORD *)(v18 - 8) + 72) * v16, v5, v18);
    result = (unint64_t)sub_219C07D7C(v9, (_OWORD *)(v7[7] + 32 * v16));
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

unint64_t sub_219C06710(uint64_t a1)
{
  uint64_t v2;

  sub_219C080E0();
  sub_219C07D8C(&qword_2550AFA30, (uint64_t (*)(uint64_t))MEMORY[0x24BE1DC18], MEMORY[0x24BE1DC28]);
  v2 = sub_219C0811C();
  return sub_219C0677C(a1, v2);
}

unint64_t sub_219C0677C(uint64_t a1, uint64_t a2)
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
  v5 = sub_219C080E0();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
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
      sub_219C07D8C(&qword_2550AFA38, (uint64_t (*)(uint64_t))MEMORY[0x24BE1DC18], MEMORY[0x24BE1DC30]);
      v14 = sub_219C08128();
      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
      if ((v14 & 1) != 0)
        break;
      v10 = (v10 + 1) & v11;
    }
    while (((*(_QWORD *)(v3 + 64 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0);
  }
  return v10;
}

uint64_t sub_219C068BC(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t (*v6)(void);

  v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v4;
  *v4 = v3;
  v4[1] = sub_219C07E84;
  return v6();
}

uint64_t sub_219C06910(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t (*v7)(void);

  v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v5;
  *v5 = v4;
  v5[1] = sub_219C07E84;
  return v7();
}

uint64_t sub_219C06964(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_219C0817C();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_219C08170();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_219C07DCC(a1, &qword_2550AF9C8);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_219C08164();
    swift_unknownObjectRelease();
  }
LABEL_5:
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_219C06AB0(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_219C06B14;
  return v6(a1);
}

uint64_t sub_219C06B14()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

unint64_t sub_219C06B60(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_219C0820C();
  sub_219C08140();
  v4 = sub_219C08218();
  return sub_219C07240(a1, a2, v4);
}

uint64_t sub_219C06BC4(uint64_t a1, int a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t result;
  int64_t v16;
  unint64_t v17;
  _QWORD *v18;
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  unint64_t v22;
  int64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  char v34;
  unint64_t v35;
  BOOL v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t *v40;
  int64_t v41;
  _QWORD *v42;
  int v43;
  char *v44;
  uint64_t v45;

  v3 = v2;
  v45 = sub_219C07F6C();
  v5 = *(_QWORD *)(v45 - 8);
  MEMORY[0x24BDAC7A8](v45);
  v44 = (char *)&v39 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2550AFA50);
  v43 = a2;
  v8 = sub_219C081DC();
  v9 = v8;
  if (*(_QWORD *)(v7 + 16))
  {
    v40 = v2;
    v10 = 1 << *(_BYTE *)(v7 + 32);
    v11 = *(_QWORD *)(v7 + 64);
    v42 = (_QWORD *)(v7 + 64);
    if (v10 < 64)
      v12 = ~(-1 << v10);
    else
      v12 = -1;
    v13 = v12 & v11;
    v41 = (unint64_t)(v10 + 63) >> 6;
    v14 = v8 + 64;
    result = swift_retain();
    v16 = 0;
    while (1)
    {
      if (v13)
      {
        v19 = __clz(__rbit64(v13));
        v13 &= v13 - 1;
        v20 = v19 | (v16 << 6);
      }
      else
      {
        v21 = v16 + 1;
        if (__OFADD__(v16, 1))
        {
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          return result;
        }
        if (v21 >= v41)
          goto LABEL_34;
        v22 = v42[v21];
        ++v16;
        if (!v22)
        {
          v16 = v21 + 1;
          if (v21 + 1 >= v41)
            goto LABEL_34;
          v22 = v42[v16];
          if (!v22)
          {
            v23 = v21 + 2;
            if (v23 >= v41)
            {
LABEL_34:
              swift_release();
              v3 = v40;
              if ((v43 & 1) != 0)
              {
                v38 = 1 << *(_BYTE *)(v7 + 32);
                if (v38 >= 64)
                  bzero(v42, ((unint64_t)(v38 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v42 = -1 << v38;
                *(_QWORD *)(v7 + 16) = 0;
              }
              break;
            }
            v22 = v42[v23];
            if (!v22)
            {
              while (1)
              {
                v16 = v23 + 1;
                if (__OFADD__(v23, 1))
                  goto LABEL_41;
                if (v16 >= v41)
                  goto LABEL_34;
                v22 = v42[v16];
                ++v23;
                if (v22)
                  goto LABEL_21;
              }
            }
            v16 = v23;
          }
        }
LABEL_21:
        v13 = (v22 - 1) & v22;
        v20 = __clz(__rbit64(v22)) + (v16 << 6);
      }
      v24 = *(_QWORD *)(v7 + 56);
      v25 = v7;
      v26 = (uint64_t *)(*(_QWORD *)(v7 + 48) + 16 * v20);
      v28 = *v26;
      v27 = v26[1];
      v29 = *(_QWORD *)(v5 + 72);
      v30 = v24 + v29 * v20;
      if ((v43 & 1) != 0)
      {
        (*(void (**)(char *, uint64_t, uint64_t))(v5 + 32))(v44, v30, v45);
      }
      else
      {
        (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v44, v30, v45);
        swift_bridgeObjectRetain();
      }
      sub_219C0820C();
      sub_219C08140();
      result = sub_219C08218();
      v31 = -1 << *(_BYTE *)(v9 + 32);
      v32 = result & ~v31;
      v33 = v32 >> 6;
      if (((-1 << v32) & ~*(_QWORD *)(v14 + 8 * (v32 >> 6))) != 0)
      {
        v17 = __clz(__rbit64((-1 << v32) & ~*(_QWORD *)(v14 + 8 * (v32 >> 6)))) | v32 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v34 = 0;
        v35 = (unint64_t)(63 - v31) >> 6;
        do
        {
          if (++v33 == v35 && (v34 & 1) != 0)
          {
            __break(1u);
            goto LABEL_40;
          }
          v36 = v33 == v35;
          if (v33 == v35)
            v33 = 0;
          v34 |= v36;
          v37 = *(_QWORD *)(v14 + 8 * v33);
        }
        while (v37 == -1);
        v17 = __clz(__rbit64(~v37)) + (v33 << 6);
      }
      *(_QWORD *)(v14 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
      v18 = (_QWORD *)(*(_QWORD *)(v9 + 48) + 16 * v17);
      *v18 = v28;
      v18[1] = v27;
      result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v5 + 32))(*(_QWORD *)(v9 + 56) + v29 * v17, v44, v45);
      ++*(_QWORD *)(v9 + 16);
      v7 = v25;
    }
  }
  result = swift_release();
  *v3 = v9;
  return result;
}

uint64_t sub_219C06F2C(uint64_t a1, char a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_2550AFA10);
  v36 = a2;
  v6 = sub_219C081DC();
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
    sub_219C0820C();
    sub_219C08140();
    result = sub_219C08218();
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

unint64_t sub_219C07240(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_219C081F4() & 1) == 0)
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
      while (!v14 && (sub_219C081F4() & 1) == 0);
    }
  }
  return v6;
}

void *sub_219C07320()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *result;
  unint64_t v9;
  int64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  int64_t v25;
  unint64_t v26;
  int64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  int64_t v33;
  uint64_t v34;
  uint64_t v35;

  v34 = sub_219C07F6C();
  v1 = *(_QWORD *)(v34 - 8);
  MEMORY[0x24BDAC7A8](v34);
  v3 = (char *)&v30 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2550AFA50);
  v31 = v0;
  v4 = *v0;
  v5 = sub_219C081D0();
  v6 = *(_QWORD *)(v4 + 16);
  v35 = v5;
  if (!v6)
  {
    result = (void *)swift_release();
    v29 = v35;
    v28 = v31;
LABEL_28:
    *v28 = v29;
    return result;
  }
  v7 = v5;
  result = (void *)(v5 + 64);
  v9 = (unint64_t)((1 << *(_BYTE *)(v7 + 32)) + 63) >> 6;
  if (v7 != v4 || (unint64_t)result >= v4 + 64 + 8 * v9)
  {
    result = memmove(result, (const void *)(v4 + 64), 8 * v9);
    v7 = v35;
  }
  v32 = v4 + 64;
  v11 = 0;
  *(_QWORD *)(v7 + 16) = *(_QWORD *)(v4 + 16);
  v12 = 1 << *(_BYTE *)(v4 + 32);
  v13 = -1;
  if (v12 < 64)
    v13 = ~(-1 << v12);
  v14 = v13 & *(_QWORD *)(v4 + 64);
  v33 = (unint64_t)(v12 + 63) >> 6;
  v15 = v34;
  while (1)
  {
    if (v14)
    {
      v16 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      v17 = v16 | (v11 << 6);
      goto LABEL_12;
    }
    v25 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v25 >= v33)
      goto LABEL_26;
    v26 = *(_QWORD *)(v32 + 8 * v25);
    ++v11;
    if (!v26)
    {
      v11 = v25 + 1;
      if (v25 + 1 >= v33)
        goto LABEL_26;
      v26 = *(_QWORD *)(v32 + 8 * v11);
      if (!v26)
        break;
    }
LABEL_25:
    v14 = (v26 - 1) & v26;
    v17 = __clz(__rbit64(v26)) + (v11 << 6);
LABEL_12:
    v18 = 16 * v17;
    v19 = (uint64_t *)(*(_QWORD *)(v4 + 48) + 16 * v17);
    v21 = *v19;
    v20 = v19[1];
    v22 = *(_QWORD *)(v1 + 72) * v17;
    (*(void (**)(char *, unint64_t, uint64_t))(v1 + 16))(v3, *(_QWORD *)(v4 + 56) + v22, v15);
    v23 = v35;
    v24 = (_QWORD *)(*(_QWORD *)(v35 + 48) + v18);
    *v24 = v21;
    v24[1] = v20;
    (*(void (**)(unint64_t, char *, uint64_t))(v1 + 32))(*(_QWORD *)(v23 + 56) + v22, v3, v15);
    result = (void *)swift_bridgeObjectRetain();
  }
  v27 = v25 + 2;
  if (v27 >= v33)
  {
LABEL_26:
    result = (void *)swift_release();
    v28 = v31;
    v29 = v35;
    goto LABEL_28;
  }
  v26 = *(_QWORD *)(v32 + 8 * v27);
  if (v26)
  {
    v11 = v27;
    goto LABEL_25;
  }
  while (1)
  {
    v11 = v27 + 1;
    if (__OFADD__(v27, 1))
      break;
    if (v11 >= v33)
      goto LABEL_26;
    v26 = *(_QWORD *)(v32 + 8 * v11);
    ++v27;
    if (v26)
      goto LABEL_25;
  }
LABEL_30:
  __break(1u);
  return result;
}

void *sub_219C0757C()
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_2550AFA10);
  v2 = *v0;
  v3 = sub_219C081D0();
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
    swift_bridgeObjectRetain();
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

size_t sub_219C07730(size_t result, int64_t a2, char a3, _QWORD *a4, uint64_t *a5, uint64_t (*a6)(_QWORD))
{
  char v8;
  unint64_t v9;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  _QWORD *v16;
  uint64_t v18;
  unint64_t v19;

  v8 = result;
  if ((a3 & 1) != 0)
  {
    v9 = a4[3];
    v10 = v9 >> 1;
    if ((uint64_t)(v9 >> 1) < a2)
    {
      if (v10 + 0x4000000000000000 < 0)
      {
LABEL_30:
        __break(1u);
        return result;
      }
      v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v9 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v10 = a2;
    }
  }
  else
  {
    v10 = a2;
  }
  v11 = a4[2];
  if (v10 <= v11)
    v12 = a4[2];
  else
    v12 = v10;
  if (!v12)
  {
    v16 = (_QWORD *)MEMORY[0x24BEE4AF8];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(a5);
  v13 = *(_QWORD *)(a6(0) - 8);
  v14 = *(_QWORD *)(v13 + 72);
  v15 = (*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  v16 = (_QWORD *)swift_allocObject();
  result = _swift_stdlib_malloc_size(v16);
  if (!v14)
  {
    __break(1u);
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  if (result - v15 == 0x8000000000000000 && v14 == -1)
    goto LABEL_29;
  v16[2] = v11;
  v16[3] = 2 * ((uint64_t)(result - v15) / v14);
LABEL_19:
  v18 = *(_QWORD *)(a6(0) - 8);
  if ((v8 & 1) != 0)
  {
    if (v16 < a4
      || (v19 = (*(unsigned __int8 *)(v18 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v18 + 80),
          (char *)v16 + v19 >= (char *)a4 + v19 + *(_QWORD *)(v18 + 72) * v11))
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v16 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return (size_t)v16;
}

id sub_219C078A4()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  objc_super v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v1 = type metadata accessor for CIDCInternalPayloadBuilder.CIDCInternalPayloadBuilderDelegate();
  v2 = swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakAssign();
  swift_unknownObjectWeakAssign();
  v7 = v1;
  v8 = sub_219C07D8C(&qword_2550AF840, (uint64_t (*)(uint64_t))type metadata accessor for CIDCInternalPayloadBuilder.CIDCInternalPayloadBuilderDelegate, (uint64_t)&unk_219C08AF0);
  v6 = v2;
  sub_219C07EE8();
  objc_allocWithZone((Class)sub_219C080A4());
  v3 = v0;
  *(_QWORD *)&v3[OBJC_IVAR____TtC17CoreIDCredBuilder26CIDCInternalPayloadBuilder_payloadBuilder] = sub_219C08098();

  v5.receiver = v3;
  v5.super_class = (Class)type metadata accessor for CIDCInternalPayloadBuilder();
  return objc_msgSendSuper2(&v5, sel_init);
}

uint64_t type metadata accessor for CIDCInternalPayloadBuilder.CIDCInternalPayloadBuilderDelegate()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for CIDCInternalPayloadBuilder()
{
  return objc_opt_self();
}

uint64_t method lookup function for CIDCInternalPayloadBuilder()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of CIDCInternalPayloadBuilder.__allocating_init(delegate:payloadBuilder:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t dispatch thunk of CIDCInternalPayloadBuilder.buildPayload(details:)(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;
  uint64_t (*v7)(uint64_t);

  v4 = *(int **)((*MEMORY[0x24BEE4EA0] & *v1) + 0x78);
  v7 = (uint64_t (*)(uint64_t))((char *)v4 + *v4);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_219C07A90;
  return v7(a1);
}

uint64_t sub_219C07A90(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v6;

  v6 = *v2;
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(a1, a2);
}

uint64_t sub_219C07AF0(uint64_t a1)
{
  swift_unknownObjectWeakDestroy();
  return a1;
}

uint64_t sub_219C07B14()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 24));
  return swift_deallocObject();
}

uint64_t sub_219C07B48()
{
  _QWORD *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  _QWORD *v5;

  v2 = (void *)v0[2];
  v3 = (void *)v0[3];
  v4 = (void *)v0[4];
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v5;
  *v5 = v1;
  v5[1] = sub_219C06474;
  return ((uint64_t (*)(void *, void *, void *))((char *)&dword_2550AF9D0 + dword_2550AF9D0))(v2, v3, v4);
}

uint64_t sub_219C07BB8()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int *v4;
  _QWORD *v5;

  v2 = v0[2];
  v3 = v0[3];
  v4 = (int *)v0[4];
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v5;
  *v5 = v1;
  v5[1] = sub_219C07E84;
  return ((uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_2550AF9E0 + dword_2550AF9E0))(v2, v3, v4);
}

uint64_t objectdestroy_9Tm()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_219C07C60(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  int *v6;
  _QWORD *v7;

  v4 = v1[2];
  v5 = v1[3];
  v6 = (int *)v1[4];
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_219C07E84;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_2550AF9F0 + dword_2550AF9F0))(a1, v4, v5, v6);
}

uint64_t sub_219C07CE4()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_219C07D08(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_219C06474;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_2550AFA00 + dword_2550AFA00))(a1, v4);
}

_OWORD *sub_219C07D7C(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_219C07D8C(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x220732460](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_219C07DCC(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_219C07E08(uint64_t a1, unint64_t *a2)
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

uint64_t sub_219C07E40(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_219C07E88()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for BundleToken()
{
  return objc_opt_self();
}

uint64_t sub_219C07EB8()
{
  return MEMORY[0x24BDCD2F0]();
}

uint64_t sub_219C07EC4()
{
  return MEMORY[0x24BDCDCA0]();
}

uint64_t sub_219C07ED0()
{
  return MEMORY[0x24BDCDCE0]();
}

uint64_t sub_219C07EDC()
{
  return MEMORY[0x24BDCE878]();
}

uint64_t sub_219C07EE8()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_219C07EF4()
{
  return MEMORY[0x24BE10160]();
}

uint64_t sub_219C07F00()
{
  return MEMORY[0x24BE10170]();
}

uint64_t sub_219C07F0C()
{
  return MEMORY[0x24BE10178]();
}

uint64_t sub_219C07F18()
{
  return MEMORY[0x24BE101F0]();
}

uint64_t sub_219C07F24()
{
  return MEMORY[0x24BE1C9F8]();
}

uint64_t sub_219C07F30()
{
  return MEMORY[0x24BE1CA00]();
}

uint64_t sub_219C07F3C()
{
  return MEMORY[0x24BE1CA08]();
}

uint64_t sub_219C07F48()
{
  return MEMORY[0x24BE1CA10]();
}

uint64_t sub_219C07F54()
{
  return MEMORY[0x24BE1CA18]();
}

uint64_t sub_219C07F60()
{
  return MEMORY[0x24BE1CA20]();
}

uint64_t sub_219C07F6C()
{
  return MEMORY[0x24BE1CA28]();
}

uint64_t sub_219C07F78()
{
  return MEMORY[0x24BE1CCC8]();
}

uint64_t sub_219C07F84()
{
  return MEMORY[0x24BE1CCD0]();
}

uint64_t sub_219C07F90()
{
  return MEMORY[0x24BE1CE58]();
}

uint64_t sub_219C07F9C()
{
  return MEMORY[0x24BE1CE60]();
}

uint64_t sub_219C07FA8()
{
  return MEMORY[0x24BE1D1B0]();
}

uint64_t sub_219C07FB4()
{
  return MEMORY[0x24BE1D1D0]();
}

uint64_t sub_219C07FC0()
{
  return MEMORY[0x24BE1D1D8]();
}

uint64_t sub_219C07FCC()
{
  return MEMORY[0x24BE1D1F0]();
}

uint64_t sub_219C07FD8()
{
  return MEMORY[0x24BE1D1F8]();
}

uint64_t sub_219C07FE4()
{
  return MEMORY[0x24BE1D200]();
}

uint64_t sub_219C07FF0()
{
  return MEMORY[0x24BE1D208]();
}

uint64_t sub_219C07FFC()
{
  return MEMORY[0x24BE1D220]();
}

uint64_t sub_219C08008()
{
  return MEMORY[0x24BE1D228]();
}

uint64_t sub_219C08014()
{
  return MEMORY[0x24BE1D278]();
}

uint64_t sub_219C08020()
{
  return MEMORY[0x24BE1D280]();
}

uint64_t sub_219C0802C()
{
  return MEMORY[0x24BE1D418]();
}

uint64_t sub_219C08038()
{
  return MEMORY[0x24BE1D438]();
}

uint64_t sub_219C08044()
{
  return MEMORY[0x24BE1D640]();
}

uint64_t sub_219C08050()
{
  return MEMORY[0x24BE1D648]();
}

uint64_t sub_219C0805C()
{
  return MEMORY[0x24BE1D658]();
}

uint64_t sub_219C08068()
{
  return MEMORY[0x24BE1D668]();
}

uint64_t sub_219C08074()
{
  return MEMORY[0x24BE1D670]();
}

uint64_t sub_219C08080()
{
  return MEMORY[0x24BE1D678]();
}

uint64_t sub_219C0808C()
{
  return MEMORY[0x24BE1D688]();
}

uint64_t sub_219C08098()
{
  return MEMORY[0x24BE1D910]();
}

uint64_t sub_219C080A4()
{
  return MEMORY[0x24BE1D918]();
}

uint64_t sub_219C080B0()
{
  return MEMORY[0x24BE1D940]();
}

uint64_t sub_219C080BC()
{
  return MEMORY[0x24BE1D948]();
}

uint64_t sub_219C080C8()
{
  return MEMORY[0x24BE1D990]();
}

uint64_t sub_219C080D4()
{
  return MEMORY[0x24BE1D998]();
}

uint64_t sub_219C080E0()
{
  return MEMORY[0x24BE1DC18]();
}

uint64_t sub_219C080EC()
{
  return MEMORY[0x24BE1DE48]();
}

uint64_t sub_219C080F8()
{
  return MEMORY[0x24BE1DE60]();
}

uint64_t sub_219C08104()
{
  return MEMORY[0x24BE1DE70]();
}

uint64_t sub_219C08110()
{
  return MEMORY[0x24BDCF830]();
}

uint64_t sub_219C0811C()
{
  return MEMORY[0x24BEE0610]();
}

uint64_t sub_219C08128()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_219C08134()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_219C08140()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_219C0814C()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_219C08158()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_219C08164()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_219C08170()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t sub_219C0817C()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t sub_219C08188()
{
  return MEMORY[0x24BE1DED0]();
}

uint64_t sub_219C08194()
{
  return MEMORY[0x24BE1DED8]();
}

uint64_t sub_219C081A0()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_219C081AC()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_219C081B8()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_219C081C4()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_219C081D0()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_219C081DC()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_219C081E8()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_219C081F4()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_219C08200()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_219C0820C()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_219C08218()
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

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x24BEE4B38]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x24BDAED60](ptr);
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

uint64_t swift_allocError()
{
  return MEMORY[0x24BEE4B68]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
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

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x24BEE4BC0]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x24BEE4BD0]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x24BEE4BD8]();
}

uint64_t swift_continuation_await()
{
  return MEMORY[0x24BEE71B8]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x24BEE71C0]();
}

uint64_t swift_continuation_throwingResume()
{
  return MEMORY[0x24BEE71D0]();
}

uint64_t swift_continuation_throwingResumeWithError()
{
  return MEMORY[0x24BEE71D8]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x24BEE4C00]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x24BEE4C10]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x24BEE4CA0]();
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

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x24BEE4E98]();
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

uint64_t swift_task_alloc()
{
  return MEMORY[0x24BEE7228]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x24BEE7230]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x24BEE7238]();
}

uint64_t swift_task_switch()
{
  return MEMORY[0x24BEE7278]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x24BEE4F70]();
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

