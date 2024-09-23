uint64_t sub_1B5130AF4()
{
  uint64_t result;

  result = sub_1B5130B18(5u);
  byte_1EF0F6F48 = result & 1;
  return result;
}

uint64_t sub_1B5130B18(unsigned __int8 a1)
{
  void *v1;
  uint64_t v2;
  uint64_t result;
  unsigned __int8 v4;

  sub_1B5130BE0(a1);
  v1 = (void *)sub_1B514BEF4();
  swift_bridgeObjectRelease();
  v2 = MGCopyAnswer();

  if (!v2)
    return 0;
  result = swift_dynamicCast();
  if ((_DWORD)result)
    return v4;
  return result;
}

char *sub_1B5130BA0()
{
  if (qword_1EF0F6A50 != -1)
    swift_once();
  return &byte_1EF0F6F48;
}

uint64_t sub_1B5130BE0(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_1B5130C1C + 4 * byte_1B514D760[a1]))(0x726556646C697542, 0xEC0000006E6F6973);
}

uint64_t sub_1B5130C1C()
{
  return 0x4E746375646F7250;
}

uint64_t sub_1B5130C3C()
{
  return 0x54746375646F7250;
}

uint64_t sub_1B5130C60()
{
  return 0x56746375646F7250;
}

uint64_t sub_1B5130C84()
{
  return 0x6F436E6F69676552;
}

uint64_t sub_1B5130CA0()
{
  return 0x6C616E7265746E49;
}

unint64_t sub_1B5130CC4()
{
  return 0xD000000000000015;
}

uint64_t sub_1B5130CE0()
{
  return 0x48746375646F7250;
}

uint64_t sub_1B5130D00()
{
  sub_1B5130BA0();
  return byte_1EF0F6F48;
}

ValueMetadata *type metadata accessor for OSVariant()
{
  return &type metadata for OSVariant;
}

uint64_t sub_1B5130D2C()
{
  uint64_t v0;

  v0 = sub_1B514BE70();
  __swift_allocate_value_buffer(v0, qword_1EF0F6F50);
  __swift_project_value_buffer(v0, (uint64_t)qword_1EF0F6F50);
  return sub_1B514BE64();
}

id sub_1B5130DAC()
{
  void *v0;
  uint64_t (*v1)(uint64_t);
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v8;
  objc_super v9;
  uint64_t v10;

  sub_1B514BF6C();
  v1 = (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF810];
  MEMORY[0x1E0C80A78]();
  v2 = sub_1B514BF78();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78]();
  v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B514BEA0();
  MEMORY[0x1E0C80A78]();
  sub_1B5133FF8(0, &qword_1ED516398);
  v6 = v0;
  sub_1B514BE88();
  (*(void (**)(char *, _QWORD, uint64_t))(v3 + 104))(v5, *MEMORY[0x1E0DEF8D8], v2);
  v10 = MEMORY[0x1E0DEE9D8];
  sub_1B5134030(&qword_1ED516390, v1, MEMORY[0x1E0DEF828]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED516380);
  sub_1B5134070(&qword_1ED516388, &qword_1ED516380);
  sub_1B514BFD8();
  *(_QWORD *)&v6[OBJC_IVAR___FLAutoBugCapture_queue] = sub_1B514BF90();
  *(_QWORD *)&v6[OBJC_IVAR___FLAutoBugCapture_nextTimeToTrigger] = 0;

  v9.receiver = v6;
  v9.super_class = (Class)FLAutoBugCapture;
  return objc_msgSendSuper2(&v9, sel_init);
}

void sub_1B5130FD4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, unint64_t a8)
{
  uint64_t v8;
  id v17;

  v17 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DAFF28]), sel_init);
  sub_1B5133A4C(a1, a2, a3, a4, a5, a6, a7, a8, v17, v8);

}

void sub_1B513117C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, unint64_t a9, uint64_t a10, uint64_t a11)
{
  uint64_t v18;
  uint64_t v19;
  void *v20;

  v18 = a1 + 16;
  swift_beginAccess();
  v19 = MEMORY[0x1B5E47B60](v18);
  if (v19)
  {
    v20 = (void *)v19;
    sub_1B513122C(a2, a3, a4, a5, a6, a7, a8, a9, a10, a11);

  }
}

void sub_1B513122C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, unint64_t a8, uint64_t a9, uint64_t a10)
{
  char *v10;
  char *v11;
  uint64_t ObjectType;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  double v19;
  double v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  NSObject *v25;
  os_log_type_t v26;
  _BOOL4 v27;
  NSObject *v28;
  uint8_t *v29;
  uint64_t v30;
  char *v31;
  NSObject *v32;
  os_log_type_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  id v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  id v44;
  uint64_t v45;
  uint64_t inited;
  unint64_t v47;
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
  id v60;
  os_log_type_t v61;
  uint8_t *v62;
  uint64_t v63;
  id v64;
  uint64_t v65;
  unint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  unint64_t v77;
  uint64_t v78;
  uint64_t v79;
  NSObject *v80;
  uint64_t v81;
  void (*v82)(uint64_t, uint64_t, _QWORD, uint64_t, void (*)(uint64_t), uint64_t, uint64_t, uint64_t, double);
  NSObject *v83;
  __int128 v84;
  uint64_t v85;
  uint64_t v86;
  NSObject *v87;
  unint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  double v95;
  unint64_t v96;
  uint64_t v97;

  v11 = v10;
  v90 = a7;
  v91 = a5;
  v92 = a4;
  v93 = a1;
  v94 = a2;
  ObjectType = swift_getObjectType();
  v15 = sub_1B514BCCC();
  v16 = *(_QWORD *)(v15 - 8);
  MEMORY[0x1E0C80A78]();
  v18 = (char *)&v84 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B514BCC0();
  sub_1B514BCA8();
  v20 = v19;
  (*(void (**)(char *, uint64_t))(v16 + 8))(v18, v15);
  v21 = OBJC_IVAR___FLAutoBugCapture_nextTimeToTrigger;
  if (*(double *)&v11[OBJC_IVAR___FLAutoBugCapture_nextTimeToTrigger] >= v20)
  {
    if (qword_1EF0F6A58 != -1)
      swift_once();
    v30 = sub_1B514BE70();
    __swift_project_value_buffer(v30, (uint64_t)qword_1EF0F6F50);
    v31 = v11;
    v32 = sub_1B514BE58();
    v33 = sub_1B514BF60();
    if (!os_log_type_enabled(v32, v33))
    {

      return;
    }
    v34 = swift_slowAlloc();
    *(_DWORD *)v34 = 134218240;
    v95 = v20;
    sub_1B514BFB4();
    *(_WORD *)(v34 + 12) = 2048;
    v95 = *(double *)&v11[v21];
    sub_1B514BFB4();

    _os_log_impl(&dword_1B512E000, v32, v33, "SymptomDiagnosticReporter throttled since currentTime (%f) <= nextTime (%f)", (uint8_t *)v34, 0x16u);
    MEMORY[0x1B5E47B24](v34, -1, -1);
    goto LABEL_23;
  }
  v85 = a6;
  v86 = ObjectType;
  *(double *)&v11[OBJC_IVAR___FLAutoBugCapture_nextTimeToTrigger] = v20 + 120.0;
  if (qword_1EF0F6A58 != -1)
    swift_once();
  v22 = sub_1B514BE70();
  v23 = __swift_project_value_buffer(v22, (uint64_t)qword_1EF0F6F50);
  v24 = v11;
  v89 = v23;
  v25 = sub_1B514BE58();
  v26 = sub_1B514BF60();
  v27 = os_log_type_enabled(v25, v26);
  v87 = v24;
  v88 = a8;
  if (v27)
  {
    v28 = v24;
    v29 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v29 = 134217984;
    v95 = *(double *)&v11[v21];
    sub_1B514BFB4();

    _os_log_impl(&dword_1B512E000, v25, v26, "SymptomDiagnosticReporter updated nextTimeToTrigger with cooldown %f", v29, 0xCu);
    MEMORY[0x1B5E47B24](v29, -1, -1);
  }
  else
  {

    v25 = v24;
  }

  if (sub_1B514BF24() < 1)
  {
    v35 = 0;
    v36 = 0xE000000000000000;
  }
  else
  {
    v95 = 1.67792004e243;
    v96 = 0xEA0000000000203ALL;
    sub_1B514BF30();
    v35 = *(_QWORD *)&v95;
    v36 = v96;
  }
  v37 = objc_msgSend((id)objc_opt_self(), sel_processInfo);
  v38 = objc_msgSend(v37, sel_processName);

  v39 = sub_1B514BF00();
  v41 = v40;

  v42 = swift_getObjectType();
  v43 = (void *)(*(uint64_t (**)(uint64_t, unint64_t, uint64_t, unint64_t, uint64_t, uint64_t, uint64_t, unint64_t, uint64_t, uint64_t, _QWORD, _QWORD, uint64_t, uint64_t))(a10 + 8))(0x7372615065726F43, 0xEA00000000006365, 0x6B63616264656546, 0xEE00726567676F4CLL, v93, v94, v35, v36, v39, v41, 0, 0, v42, a10);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (!v43
    || (v95 = 0.0, v44 = v43, sub_1B514BEB8(), v44, v45 = *(_QWORD *)&v95, v95 == 0.0))
  {
    v60 = v43;
    v32 = sub_1B514BE58();
    v61 = sub_1B514BF60();
    if (!os_log_type_enabled(v32, v61))
    {

      return;
    }
    v62 = (uint8_t *)swift_slowAlloc();
    v63 = swift_slowAlloc();
    v95 = *(double *)&v63;
    *(_DWORD *)v62 = 136315138;
    v97 = (uint64_t)v43;
    v64 = v60;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF0F6B18);
    v65 = sub_1B514BF0C();
    v97 = sub_1B51331E8(v65, v66, (uint64_t *)&v95);
    sub_1B514BFB4();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1B512E000, v32, v61, "SymptomDiagnosticReporter couldn't parse signature: %s", v62, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1B5E47B24](v63, -1, -1);
    MEMORY[0x1B5E47B24](v62, -1, -1);

LABEL_23:
    return;
  }
  v89 = a9;
  v92 = a10;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF0F6B20);
  inited = swift_initStackObject();
  v84 = xmmword_1B514D800;
  *(_OWORD *)(inited + 16) = xmmword_1B514D800;
  v95 = COERCE_DOUBLE(sub_1B514BF00());
  v96 = v47;
  v48 = MEMORY[0x1E0DEA968];
  sub_1B514BFFC();
  *(_QWORD *)(inited + 96) = MEMORY[0x1E0DEAFA0];
  *(_BYTE *)(inited + 72) = 0;
  v49 = sub_1B514BED0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF0F6B28);
  v50 = swift_allocObject();
  *(_OWORD *)(v50 + 16) = v84;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF0F6B30);
  if (v88 >> 60 == 15)
  {
    v51 = swift_initStackObject();
    *(_OWORD *)(v51 + 16) = xmmword_1B514D820;
    v52 = sub_1B514BF00();
    v53 = MEMORY[0x1E0DEB070];
    *(_QWORD *)(v51 + 32) = v52;
    *(_QWORD *)(v51 + 40) = v54;
    *(_QWORD *)(v51 + 72) = v53;
    *(double *)(v51 + 48) = v20;
    *(_QWORD *)(v51 + 80) = sub_1B514BF00();
    *(_QWORD *)(v51 + 88) = v55;
    *(_QWORD *)(v51 + 120) = v48;
    v56 = v86;
    v57 = v85;
    v58 = v91;
    if (!v85)
    {
      v59 = swift_bridgeObjectRetain();
      v58 = v93;
      v57 = v59;
    }
    *(_QWORD *)(v51 + 96) = v58;
    *(_QWORD *)(v51 + 104) = v57;
  }
  else
  {
    v67 = swift_initStackObject();
    *(_OWORD *)(v67 + 16) = xmmword_1B514D810;
    v68 = sub_1B514BF00();
    v69 = MEMORY[0x1E0DEB070];
    *(_QWORD *)(v67 + 32) = v68;
    *(_QWORD *)(v67 + 40) = v70;
    *(_QWORD *)(v67 + 72) = v69;
    *(double *)(v67 + 48) = v20;
    *(_QWORD *)(v67 + 80) = sub_1B514BF00();
    *(_QWORD *)(v67 + 88) = v71;
    *(_QWORD *)(v67 + 120) = v48;
    v56 = v86;
    v72 = v85;
    v73 = v91;
    if (!v85)
    {
      v74 = swift_bridgeObjectRetain();
      v73 = v93;
      v72 = v74;
    }
    *(_QWORD *)(v67 + 96) = v73;
    *(_QWORD *)(v67 + 104) = v72;
    *(_QWORD *)(v67 + 128) = sub_1B514BF00();
    *(_QWORD *)(v67 + 136) = v75;
    *(_QWORD *)(v67 + 168) = MEMORY[0x1E0CB0338];
    v76 = v90;
    v77 = v88;
    *(_QWORD *)(v67 + 144) = v90;
    *(_QWORD *)(v67 + 152) = v77;
    sub_1B5133080(v76, v77);
  }
  swift_bridgeObjectRetain();
  *(_QWORD *)(v50 + 32) = sub_1B514BED0();
  v78 = sub_1B5131AD4(v50);
  swift_bridgeObjectRelease();
  v79 = swift_allocObject();
  v80 = v87;
  *(_QWORD *)(v79 + 16) = v87;
  *(_QWORD *)(v79 + 24) = v56;
  v81 = v92;
  v82 = *(void (**)(uint64_t, uint64_t, _QWORD, uint64_t, void (*)(uint64_t), uint64_t, uint64_t, uint64_t, double))(v92 + 16);
  v83 = v80;
  v82(v45, v78, 0, v49, sub_1B5133E94, v79, v42, v81, 0.0);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();

  swift_bridgeObjectRelease();
}

uint64_t sub_1B5131AA8(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

uint64_t sub_1B5131AD4(uint64_t a1)
{
  int64_t v1;
  uint64_t v2;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  __int128 v8;
  uint64_t v9;

  v1 = *(_QWORD *)(a1 + 16);
  v2 = MEMORY[0x1E0DEE9D8];
  if (v1)
  {
    v9 = MEMORY[0x1E0DEE9D8];
    sub_1B5133950(0, v1, 0);
    v4 = a1 + 32;
    v2 = v9;
    do
    {
      swift_bridgeObjectRetain();
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EF0F6B58);
      swift_dynamicCast();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_1B5133950(0, *(_QWORD *)(v2 + 16) + 1, 1);
        v2 = v9;
      }
      v6 = *(_QWORD *)(v2 + 16);
      v5 = *(_QWORD *)(v2 + 24);
      if (v6 >= v5 >> 1)
      {
        sub_1B5133950((char *)(v5 > 1), v6 + 1, 1);
        v2 = v9;
      }
      *(_QWORD *)(v2 + 16) = v6 + 1;
      sub_1B5133F84(&v8, (_OWORD *)(v2 + 32 * v6 + 32));
      v4 += 8;
      --v1;
    }
    while (v1);
  }
  return v2;
}

void sub_1B5131C00(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  NSObject *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  os_log_type_t v20;
  uint8_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  unint64_t v27;
  id v28;
  unint64_t v29;
  uint64_t v30;
  id v31;
  id v32;
  uint64_t v33;
  id v34;
  NSObject *v35;
  os_log_type_t v36;
  uint8_t *v37;
  _QWORD *v38;
  id v39;
  unint64_t v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t v43;
  os_log_type_t v44;
  uint64_t v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  Class isa;
  NSObject *v53;
  id v54;
  unint64_t v55;
  uint64_t aBlock[6];
  __int128 v57;
  uint64_t v58;

  v6 = sub_1B514BE7C();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78]();
  v9 = (char *)&v49 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_1B514BEA0();
  isa = v10[-1].isa;
  v53 = v10;
  MEMORY[0x1E0C80A78]();
  v12 = (char *)&v49 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_1B514BCCC();
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x1E0C80A78]();
  v16 = (char *)&v49 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a1)
  {
    if (qword_1EF0F6A58 != -1)
      swift_once();
    v19 = sub_1B514BE70();
    __swift_project_value_buffer(v19, (uint64_t)qword_1EF0F6F50);
    v53 = sub_1B514BE58();
    v20 = sub_1B514BF60();
    if (os_log_type_enabled(v53, v20))
    {
      v21 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v21 = 0;
      _os_log_impl(&dword_1B512E000, v53, v20, "SymptomDiagnosticReporter reporter returned no response", v21, 2u);
      MEMORY[0x1B5E47B24](v21, -1, -1);
    }

    return;
  }
  *(_QWORD *)&v57 = sub_1B514BF00();
  *((_QWORD *)&v57 + 1) = v17;
  sub_1B514BFFC();
  sub_1B51325E4((uint64_t)aBlock, a1, &v57);
  sub_1B5133E9C((uint64_t)aBlock);
  v50 = v7;
  v51 = a1;
  if (v58)
  {
    if (swift_dynamicCast())
    {
      v18 = v54;
      goto LABEL_12;
    }
  }
  else
  {
    sub_1B5133ED0((uint64_t)&v57);
  }
  v18 = 0;
LABEL_12:
  sub_1B514BCC0();
  sub_1B514BCA8();
  v23 = v22;
  (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
  v24 = swift_allocObject();
  v49 = a2;
  swift_unknownObjectWeakInit();
  v25 = swift_allocObject();
  *(_QWORD *)(v25 + 16) = v24;
  *(_BYTE *)(v25 + 24) = v18;
  *(_QWORD *)(v25 + 32) = v23;
  *(_QWORD *)(v25 + 40) = a3;
  aBlock[4] = (uint64_t)sub_1B5133F34;
  aBlock[5] = v25;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_1B5131AA8;
  aBlock[3] = (uint64_t)&block_descriptor_13;
  v26 = _Block_copy(aBlock);
  swift_retain();
  sub_1B514BE94();
  *(_QWORD *)&v57 = MEMORY[0x1E0DEE9D8];
  sub_1B5134030(&qword_1EF0F6B00, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8], MEMORY[0x1E0DEF510]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF0F6B08);
  sub_1B5134070(&qword_1EF0F6B10, &qword_1EF0F6B08);
  sub_1B514BFD8();
  MEMORY[0x1B5E47344](0, v12, v9, v26);
  _Block_release(v26);
  (*(void (**)(char *, uint64_t))(v50 + 8))(v9, v6);
  (*((void (**)(char *, NSObject *))isa + 1))(v12, v53);
  swift_release();
  swift_release();
  if (v18)
  {
    v54 = (id)sub_1B514BF00();
    v55 = v27;
    sub_1B514BFFC();
    sub_1B51325E4((uint64_t)aBlock, v51, &v57);
    sub_1B5133E9C((uint64_t)aBlock);
    if (v58)
    {
      sub_1B5133FF8(0, &qword_1EF0F6B48);
      if (swift_dynamicCast())
      {
        v28 = v54;
LABEL_21:
        if (qword_1EF0F6A58 != -1)
          swift_once();
        v33 = sub_1B514BE70();
        __swift_project_value_buffer(v33, (uint64_t)qword_1EF0F6F50);
        v34 = v28;
        v35 = sub_1B514BE58();
        v36 = sub_1B514BF60();
        if (!os_log_type_enabled(v35, v36))
        {

          return;
        }
        v37 = (uint8_t *)swift_slowAlloc();
        v38 = (_QWORD *)swift_slowAlloc();
        *(_DWORD *)v37 = 138412290;
        aBlock[0] = (uint64_t)v34;
        v39 = v34;
        sub_1B514BFB4();
        *v38 = v34;

        _os_log_impl(&dword_1B512E000, v35, v36, "SymptomDiagnosticReporter snapshot accepted with sessionID %@", v37, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName(&qword_1EF0F6B50);
        swift_arrayDestroy();
        MEMORY[0x1B5E47B24](v38, -1, -1);
        MEMORY[0x1B5E47B24](v37, -1, -1);

        goto LABEL_43;
      }
    }
    else
    {
      sub_1B5133ED0((uint64_t)&v57);
    }
    sub_1B5133FF8(0, &qword_1EF0F6B48);
    v28 = (id)sub_1B514BF9C();
    goto LABEL_21;
  }
  v54 = (id)sub_1B514BF00();
  v55 = v29;
  sub_1B514BFFC();
  v30 = v51;
  sub_1B51325E4((uint64_t)aBlock, v51, &v57);
  sub_1B5133E9C((uint64_t)aBlock);
  if (v58)
  {
    sub_1B5133FF8(0, &qword_1EF0F6B40);
    if ((swift_dynamicCast() & 1) != 0)
    {
      v31 = v54;
      v32 = objc_msgSend(v54, sel_integerValue);

      goto LABEL_28;
    }
  }
  else
  {
    sub_1B5133ED0((uint64_t)&v57);
  }
  v32 = 0;
LABEL_28:
  v54 = (id)sub_1B514BF00();
  v55 = v40;
  sub_1B514BFFC();
  sub_1B51325E4((uint64_t)aBlock, v30, &v57);
  sub_1B5133E9C((uint64_t)aBlock);
  if (!v58)
  {
    sub_1B5133ED0((uint64_t)&v57);
    goto LABEL_32;
  }
  if (!swift_dynamicCast())
  {
LABEL_32:
    v42 = 0;
    v41 = 0xE000000000000000;
    goto LABEL_33;
  }
  v42 = (uint64_t)v54;
  v41 = v55;
LABEL_33:
  if ((sub_1B51327C0((uint64_t)v32) & 1) != 0)
  {
    if (qword_1EF0F6A58 != -1)
      swift_once();
    v43 = sub_1B514BE70();
    __swift_project_value_buffer(v43, (uint64_t)qword_1EF0F6F50);
    swift_bridgeObjectRetain();
    v35 = sub_1B514BE58();
    v44 = sub_1B514BF60();
    if (os_log_type_enabled(v35, v44))
    {
      v45 = swift_slowAlloc();
      v46 = swift_slowAlloc();
      aBlock[0] = v46;
      *(_DWORD *)v45 = 134218242;
      *(_QWORD *)&v57 = v32;
      sub_1B514BFB4();
      *(_WORD *)(v45 + 12) = 2080;
      swift_bridgeObjectRetain();
      *(_QWORD *)&v57 = sub_1B51331E8(v42, v41, aBlock);
      sub_1B514BFB4();
      swift_bridgeObjectRelease_n();
      v47 = "SymptomDiagnosticReporter snapshot rejected with unexpected reason %ld %s";
LABEL_42:
      _os_log_impl(&dword_1B512E000, v35, v44, v47, (uint8_t *)v45, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x1B5E47B24](v46, -1, -1);
      MEMORY[0x1B5E47B24](v45, -1, -1);
LABEL_43:

      return;
    }
  }
  else
  {
    if (qword_1EF0F6A58 != -1)
      swift_once();
    v48 = sub_1B514BE70();
    __swift_project_value_buffer(v48, (uint64_t)qword_1EF0F6F50);
    swift_bridgeObjectRetain();
    v35 = sub_1B514BE58();
    v44 = sub_1B514BF60();
    if (os_log_type_enabled(v35, v44))
    {
      v45 = swift_slowAlloc();
      v46 = swift_slowAlloc();
      aBlock[0] = v46;
      *(_DWORD *)v45 = 134218242;
      *(_QWORD *)&v57 = v32;
      sub_1B514BFB4();
      *(_WORD *)(v45 + 12) = 2080;
      swift_bridgeObjectRetain();
      *(_QWORD *)&v57 = sub_1B51331E8(v42, v41, aBlock);
      sub_1B514BFB4();
      swift_bridgeObjectRelease_n();
      v47 = "SymptomDiagnosticReporter snapshot rejected with expected reason %ld %s";
      goto LABEL_42;
    }
  }

  swift_bridgeObjectRelease_n();
}

double sub_1B51325E4@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  unint64_t v5;
  char v6;
  double result;

  if (*(_QWORD *)(a2 + 16) && (v5 = sub_1B513B9CC(a1), (v6 & 1) != 0))
  {
    sub_1B5133F48(*(_QWORD *)(a2 + 56) + 32 * v5, (uint64_t)a3);
  }
  else
  {
    result = 0.0;
    *a3 = 0u;
    a3[1] = 0u;
  }
  return result;
}

void sub_1B5132634(uint64_t a1, char a2, double a3)
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  double v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;

  v5 = a1 + 16;
  swift_beginAccess();
  v6 = MEMORY[0x1B5E47B60](v5);
  if (v6)
  {
    v7 = (void *)v6;
    v8 = 3600.0;
    if ((a2 & 1) != 0)
      v8 = 86400.0;
    *(double *)(v6 + OBJC_IVAR___FLAutoBugCapture_nextTimeToTrigger) = v8 + a3;
    if (qword_1EF0F6A58 != -1)
      swift_once();
    v9 = sub_1B514BE70();
    __swift_project_value_buffer(v9, (uint64_t)qword_1EF0F6F50);
    v10 = v7;
    v11 = sub_1B514BE58();
    v12 = sub_1B514BF60();
    if (os_log_type_enabled(v11, v12))
    {
      v13 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)v13 = 134217984;
      sub_1B514BFB4();

      _os_log_impl(&dword_1B512E000, v11, v12, "SymptomDiagnosticReporter updated nextTimeToTrigger %f", v13, 0xCu);
      MEMORY[0x1B5E47B24](v13, -1, -1);
    }
    else
    {

      v11 = v10;
    }

  }
}

uint64_t sub_1B51327C0(uint64_t result)
{
  if (result < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
    goto LABEL_19;
  }
  if (result > 0x7FFFFFFF)
  {
LABEL_19:
    __break(1u);
    return result;
  }
  return *MEMORY[0x1E0DAFFA0] != (_DWORD)result
      && *MEMORY[0x1E0DAFFA8] != (_DWORD)result
      && *MEMORY[0x1E0DAFF98] != (_DWORD)result
      && *MEMORY[0x1E0DAFFC0] != (_DWORD)result
      && *MEMORY[0x1E0DAFFC8] != (_DWORD)result;
}

id sub_1B5132848(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, void *a6, uint64_t a7, void *a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  return sub_1B513285C(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12);
}

id sub_1B513285C(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, void *a6, uint64_t a7, void *a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  void *v12;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v15 = a4;
  if (a2)
  {
    v16 = (void *)sub_1B514BEF4();
    if (!v15)
      goto LABEL_4;
    goto LABEL_3;
  }
  v16 = 0;
  if (a4)
LABEL_3:
    v15 = (void *)sub_1B514BEF4();
LABEL_4:
  if (a6)
    a6 = (void *)sub_1B514BEF4();
  if (a8)
    a8 = (void *)sub_1B514BEF4();
  v17 = a12;
  if (!a10)
  {
    v18 = 0;
    if (!a12)
      goto LABEL_11;
    goto LABEL_10;
  }
  v18 = (void *)sub_1B514BEF4();
  if (a12)
LABEL_10:
    v17 = (void *)sub_1B514BEF4();
LABEL_11:
  v19 = objc_msgSend(v12, sel_signatureWithDomain_type_subType_subtypeContext_detectedProcess_triggerThresholdValues_, v16, v15, a6, a8, v18, v17);

  return v19;
}

id sub_1B5132988(uint64_t a1, void *a2, void *a3, void *a4, void *a5, uint64_t a6, double a7)
{
  void *v7;
  void *v12;
  void *v14;
  id v15;
  _QWORD v17[6];

  v12 = a2;
  if (a1)
  {
    v14 = (void *)sub_1B514BEAC();
    if (!v12)
      goto LABEL_4;
    goto LABEL_3;
  }
  v14 = 0;
  if (a2)
LABEL_3:
    v12 = (void *)sub_1B514BF54();
LABEL_4:
  if (a3)
    a3 = (void *)sub_1B514BEAC();
  if (a4)
    a4 = (void *)sub_1B514BEAC();
  if (a5)
  {
    v17[4] = a5;
    v17[5] = a6;
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 1107296256;
    v17[2] = sub_1B5132B0C;
    v17[3] = &block_descriptor_16;
    a5 = _Block_copy(v17);
    swift_retain();
    swift_release();
  }
  v15 = objc_msgSend(v7, sel_snapshotWithSignature_delay_events_payload_actions_reply_, v14, v12, a3, a4, a5, a7);
  _Block_release(a5);

  return v15;
}

uint64_t sub_1B5132B0C(uint64_t a1, uint64_t a2)
{
  void (*v2)(uint64_t);
  uint64_t v3;

  v2 = *(void (**)(uint64_t))(a1 + 32);
  if (a2)
    v3 = sub_1B514BEC4();
  else
    v3 = 0;
  swift_retain();
  v2(v3);
  swift_release();
  return swift_bridgeObjectRelease();
}

id sub_1B5132B84(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  char *v5;
  char *v8;
  char *v9;
  uint64_t v10;
  unint64_t v11;
  id v12;
  id v13;
  objc_super v15;

  v8 = &v5[OBJC_IVAR___FLAutoBugHelper_eventValue];
  *(_OWORD *)v8 = xmmword_1B514D830;
  *(_QWORD *)&v5[OBJC_IVAR___FLAutoBugHelper_autoBugCapture] = a1;
  v9 = &v5[OBJC_IVAR___FLAutoBugHelper_bundleID];
  *(_QWORD *)v9 = a2;
  *((_QWORD *)v9 + 1) = a3;
  v10 = *(_QWORD *)v8;
  v11 = *((_QWORD *)v8 + 1);
  *(_QWORD *)v8 = a4;
  *((_QWORD *)v8 + 1) = a5;
  v12 = a1;
  sub_1B5133080(a4, a5);
  sub_1B5133028(v10, v11);
  v15.receiver = v5;
  v15.super_class = (Class)FLAutoBugHelper;
  v13 = objc_msgSendSuper2(&v15, sel_init);
  sub_1B5133028(a4, a5);

  return v13;
}

void sub_1B5132CE0()
{
  uint64_t v0;
  void *v1;
  id v2;
  void *v3;
  void *v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  uint64_t *v12;
  char v13;
  char v14;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  int v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;

  v2 = *(id *)(v0 + OBJC_IVAR___FLAutoBugHelper_autoBugCapture);
  v3 = (void *)OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_8();
  v4 = (void *)OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_9();
  if (!v14 & v13)
  {
    OUTLINED_FUNCTION_1(v5, sel_triggerABCWithSubtype_bundleID_eventName_eventValue_, v6, v7, v8, v9, v10, v11, v22, 0);
  }
  else
  {
    OUTLINED_FUNCTION_3(v12);
    OUTLINED_FUNCTION_7();
    v15 = OUTLINED_FUNCTION_5();
    OUTLINED_FUNCTION_1(v15, sel_triggerABCWithSubtype_bundleID_eventName_eventValue_, v16, v17, v18, v19, v20, v21, v22, v23);
  }

  OUTLINED_FUNCTION_0(v24);
}

void sub_1B5132DDC(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v4;
  void *v5;
  void *v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  uint64_t *v14;
  char v15;
  char v16;
  int v17;
  int v18;
  int v19;
  int v20;
  int v21;
  int v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;

  v4 = *(id *)(v2 + OBJC_IVAR___FLAutoBugHelper_autoBugCapture);
  v5 = (void *)sub_1B514BEF4();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_8();
  v6 = (void *)OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_9();
  if (!v16 & v15)
  {
    OUTLINED_FUNCTION_1(v7, sel_triggerABCWithSubtype_bundleID_eventName_eventValue_, v8, v9, v10, v11, v12, v13, v24, 0);
  }
  else
  {
    OUTLINED_FUNCTION_3(v14);
    OUTLINED_FUNCTION_7();
    v17 = OUTLINED_FUNCTION_5();
    OUTLINED_FUNCTION_1(v17, sel_triggerABCWithSubtype_bundleID_eventName_eventValue_, v18, v19, v20, v21, v22, v23, v24, v25);
  }

  OUTLINED_FUNCTION_0(v26);
}

void __swiftcall FLAutoBugHelper.init()(FLAutoBugHelper *__return_ptr retstr)
{
  objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
}

void FLAutoBugHelper.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t type metadata accessor for FLAutoBugCapture(uint64_t a1)
{
  return sub_1B5133FF8(a1, &qword_1EF0F6AD8);
}

uint64_t type metadata accessor for FLAutoBugHelper(uint64_t a1)
{
  return sub_1B5133FF8(a1, &qword_1EF0F6AF8);
}

uint64_t sub_1B5132FE4(uint64_t a1, unint64_t a2)
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

uint64_t sub_1B5133028(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_1B513303C(a1, a2);
  return a1;
}

uint64_t sub_1B513303C(uint64_t a1, unint64_t a2)
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

uint64_t sub_1B5133080(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_1B5132FE4(a1, a2);
  return a1;
}

char *sub_1B5133094(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)sub_1B514C02C();
    __break(1u);
  }
  else if (__dst != __src || &__src[32 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 32 * a2);
  }
  return __src;
}

uint64_t sub_1B5133118(unint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t result;

  if ((a2 & 0x8000000000000000) == 0 && (a3 + 32 * a2 <= a1 || a1 + 32 * a2 <= a3))
    return swift_arrayInitWithCopy();
  result = sub_1B514C02C();
  __break(1u);
  return result;
}

uint64_t sub_1B51331E8(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v12[3];
  uint64_t ObjectType;

  v6 = sub_1B51332B8(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_1B5133F48((uint64_t)v12, *a3);
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
      sub_1B5133F48((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_1B51332B8(_QWORD *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  uint64_t v8;
  uint64_t result;
  uint64_t v11;
  _QWORD __src[2];

  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0 && __dst && a3 - (uint64_t)__dst > (uint64_t)(HIBYTE(a6) & 0xF))
    {
      __src[0] = a5;
      __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
      sub_1B513340C((char *)__src, HIBYTE(a6) & 0xF, __dst);
      sub_1B514BFC0();
      result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    result = sub_1B51334D0(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    v8 = sub_1B514C014();
    if (!v8)
    {
      result = sub_1B514C020();
      __break(1u);
      return result;
    }
  }
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0)
    return 0;
  else
    return swift_unknownObjectRetain();
}

void *sub_1B513340C(char *__src, size_t __n, char *__dst)
{
  void *result;

  if ((__n & 0x8000000000000000) == 0 && (&__dst[__n] <= __src || &__src[__n] <= __dst))
    return memcpy(__dst, __src, __n);
  result = (void *)sub_1B514C02C();
  __break(1u);
  return result;
}

uint64_t sub_1B51334D0(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_1B5133564(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = (uint64_t)sub_1B5133738(0, *(_QWORD *)(v2 + 16) + 1, 1, v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = (uint64_t)sub_1B5133738((char *)(v3 > 1), v4 + 1, 1, v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_1B5133564(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  char v6;
  uint64_t result;

  if ((a2 & 0x1000000000000000) != 0)
  {
    v2 = sub_1B514BF3C();
    if (v2)
      goto LABEL_6;
    return MEMORY[0x1E0DEE9D8];
  }
  if ((a2 & 0x2000000000000000) != 0)
    v2 = HIBYTE(a2) & 0xF;
  else
    v2 = a1 & 0xFFFFFFFFFFFFLL;
  if (!v2)
    return MEMORY[0x1E0DEE9D8];
LABEL_6:
  v3 = sub_1B51336D4(v2, 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    v4 = v3;
    v5 = sub_1B514C008();
    if ((v6 & 1) != 0 || v5 != v2)
      goto LABEL_14;
    return (uint64_t)v4;
  }
  sub_1B514C02C();
  __break(1u);
LABEL_14:
  result = sub_1B514C020();
  __break(1u);
  return result;
}

_QWORD *sub_1B51336D4(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF0F6B68);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_1B5133738(char *result, int64_t a2, char a3, uint64_t a4)
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
    v6 = *(_QWORD *)(a4 + 24);
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
  v8 = *(_QWORD *)(a4 + 16);
  if (v7 <= v8)
    v9 = *(_QWORD *)(a4 + 16);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF0F6B68);
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
  v13 = (char *)(a4 + 32);
  if ((v5 & 1) != 0)
  {
    sub_1B51338D0(v13, v8, v12);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_1B513380C(v13, v8, v12);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_1B513380C(char *__src, size_t __n, char *__dst)
{
  void *result;

  if ((__n & 0x8000000000000000) == 0 && (&__dst[__n] <= __src || &__src[__n] <= __dst))
    return memcpy(__dst, __src, __n);
  result = (void *)sub_1B514C02C();
  __break(1u);
  return result;
}

char *sub_1B51338D0(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000) != 0)
  {
    __src = (char *)sub_1B514C02C();
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
}

char *sub_1B5133950(char *a1, int64_t a2, char a3)
{
  uint64_t *v3;
  char *result;

  result = sub_1B513396C(a1, a2, a3, *v3);
  *v3 = (uint64_t)result;
  return result;
}

char *sub_1B513396C(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *(_QWORD *)(a4 + 24);
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
  v8 = *(_QWORD *)(a4 + 16);
  if (v7 <= v8)
    v9 = *(_QWORD *)(a4 + 16);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF0F6B60);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 32);
  }
  else
  {
    v10 = (char *)MEMORY[0x1E0DEE9D8];
  }
  v12 = v10 + 32;
  v13 = (char *)(a4 + 32);
  if ((v5 & 1) != 0)
  {
    sub_1B5133094(v13, v8, v12);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_1B5133118((unint64_t)v13, v8, (unint64_t)v12);
  }
  swift_release();
  return v10;
}

id sub_1B5133A4C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, unint64_t a8, void *a9, uint64_t a10)
{
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  id result;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  void *v29;
  id v30;
  _QWORD v31[2];
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  _QWORD aBlock[6];

  v37 = a7;
  v38 = a8;
  v35 = a5;
  v36 = a4;
  v14 = sub_1B514BE7C();
  v15 = *(_QWORD *)(v14 - 8);
  MEMORY[0x1E0C80A78]();
  v17 = (char *)v31 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = sub_1B514BEA0();
  v19 = *(_QWORD *)(v18 - 8);
  MEMORY[0x1E0C80A78]();
  v21 = (char *)v31 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = objc_msgSend((id)objc_opt_self(), sel_isInternalBuild);
  if ((_DWORD)result)
  {
    v33 = v15;
    v34 = v19;
    v31[1] = *(_QWORD *)(a10 + OBJC_IVAR___FLAutoBugCapture_queue);
    v23 = swift_allocObject();
    v32 = v18;
    v24 = v23;
    swift_unknownObjectWeakInit();
    v25 = (_QWORD *)swift_allocObject();
    v25[2] = v24;
    v25[3] = a1;
    v25[4] = a2;
    v25[5] = a3;
    v26 = v35;
    v25[6] = v36;
    v25[7] = v26;
    v28 = v37;
    v27 = v38;
    v25[8] = a6;
    v25[9] = v28;
    v25[10] = v27;
    v25[11] = a9;
    v25[12] = &off_1E68A2A60;
    aBlock[4] = sub_1B5133D80;
    aBlock[5] = v25;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1B5131AA8;
    aBlock[3] = &block_descriptor;
    v29 = _Block_copy(aBlock);
    swift_bridgeObjectRetain();
    swift_retain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_1B5133080(v28, v27);
    v30 = a9;
    sub_1B514BE94();
    v39 = MEMORY[0x1E0DEE9D8];
    sub_1B5134030(&qword_1EF0F6B00, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8], MEMORY[0x1E0DEF510]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF0F6B08);
    sub_1B5134070(&qword_1EF0F6B10, &qword_1EF0F6B08);
    sub_1B514BFD8();
    MEMORY[0x1B5E47344](0, v21, v17, v29);
    _Block_release(v29);
    (*(void (**)(char *, uint64_t))(v33 + 8))(v17, v14);
    (*(void (**)(char *, uint64_t))(v34 + 8))(v21, v32);
    swift_release();
    return (id)swift_release();
  }
  return result;
}

uint64_t sub_1B5133D00()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

uint64_t sub_1B5133D24()
{
  uint64_t v0;
  unint64_t v1;

  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v1 = *(_QWORD *)(v0 + 80);
  if (v1 >> 60 != 15)
    sub_1B513303C(*(_QWORD *)(v0 + 72), v1);

  return swift_deallocObject();
}

void sub_1B5133D80()
{
  uint64_t v0;

  sub_1B513117C(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32), *(_QWORD *)(v0 + 40), *(_QWORD *)(v0 + 48), *(_QWORD *)(v0 + 56), *(_QWORD *)(v0 + 64), *(_QWORD *)(v0 + 72), *(_QWORD *)(v0 + 80), *(_QWORD *)(v0 + 88), *(_QWORD *)(v0 + 96));
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

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x1B5E47AAC]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x1B5E47AB8](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t sub_1B5133E70()
{
  uint64_t v0;

  return swift_deallocObject();
}

void sub_1B5133E94(uint64_t a1)
{
  uint64_t v1;

  sub_1B5131C00(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t sub_1B5133E9C(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(MEMORY[0x1E0DEC198] - 8) + 8))();
  return a1;
}

uint64_t sub_1B5133ED0(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF0F6B38);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1B5133F10()
{
  swift_release();
  return swift_deallocObject();
}

void sub_1B5133F34()
{
  uint64_t v0;

  sub_1B5132634(*(_QWORD *)(v0 + 16), *(_BYTE *)(v0 + 24), *(double *)(v0 + 32));
}

uint64_t sub_1B5133F48(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

_OWORD *sub_1B5133F84(_OWORD *a1, _OWORD *a2)
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

uint64_t sub_1B5133FF8(uint64_t a1, unint64_t *a2)
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

uint64_t sub_1B5134030(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x1B5E47AC4](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1B5134070(unint64_t *a1, uint64_t *a2)
{
  uint64_t result;
  uint64_t v4;

  result = *a1;
  if (!result)
  {
    v4 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x1B5E47AC4](MEMORY[0x1E0DEAF38], v4);
    atomic_store(result, a1);
  }
  return result;
}

void OUTLINED_FUNCTION_0(id a1)
{

}

id OUTLINED_FUNCTION_1(int a1, const char *a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  return objc_msgSend(v10, a2, v13, v11, v12, a10);
}

uint64_t OUTLINED_FUNCTION_2()
{
  return sub_1B514BEF4();
}

uint64_t OUTLINED_FUNCTION_3@<X0>(uint64_t *a1@<X8>)
{
  unint64_t v1;

  return sub_1B5132FE4(*a1, v1);
}

uint64_t OUTLINED_FUNCTION_4()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_5()
{
  uint64_t v0;
  unint64_t v1;

  return sub_1B5133028(v0, v1);
}

uint64_t OUTLINED_FUNCTION_6()
{
  return sub_1B514BEF4();
}

uint64_t OUTLINED_FUNCTION_7()
{
  return sub_1B514BC84();
}

uint64_t OUTLINED_FUNCTION_8()
{
  return swift_bridgeObjectRelease();
}

id sub_1B5134164(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  double v25;
  double v26;
  id result;
  double v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char v47[16];
  uint64_t v48;
  unint64_t v49;
  uint64_t v50;
  uint64_t v51;

  v44 = a5;
  v40 = a3;
  v41 = a4;
  v42 = type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataEventMessage(0);
  OUTLINED_FUNCTION_2_0();
  ((void (*)(void))MEMORY[0x1E0C80A78])();
  v10 = (uint64_t *)((char *)&v40 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  v11 = sub_1B514BCCC();
  v45 = *(_QWORD *)(v11 - 8);
  v46 = v11;
  ((void (*)(void))MEMORY[0x1E0C80A78])();
  v13 = (char *)&v40 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataEventMetadata(0);
  OUTLINED_FUNCTION_2_0();
  v14 = ((uint64_t (*)(void))MEMORY[0x1E0C80A78])();
  v43 = (uint64_t)&v40 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v14);
  v17 = (char *)&v40 - v16;
  type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataPayloadMessage(0);
  OUTLINED_FUNCTION_2_0();
  v19 = MEMORY[0x1E0C80A78](v18);
  v21 = (char *)&v40 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v19);
  v23 = (char *)&v40 - v22;
  *(_OWORD *)((char *)&v40 - v22 + 32) = xmmword_1B514D890;
  sub_1B514BCF0();
  *((_QWORD *)v23 + 6) = a1;
  *((_QWORD *)v23 + 7) = a2;
  *((_QWORD *)v23 + 2) = v44;
  *((_QWORD *)v23 + 3) = a6;
  *(_QWORD *)v23 = 2;
  v23[8] = 1;
  *(_QWORD *)v17 = 0;
  *((_QWORD *)v17 + 1) = 0xE000000000000000;
  *((_QWORD *)v17 + 2) = 0;
  *((_QWORD *)v17 + 3) = 0;
  *((_OWORD *)v17 + 2) = xmmword_1B514D8A0;
  *((_QWORD *)v17 + 6) = 0xE000000000000000;
  *((_QWORD *)v17 + 7) = 0;
  *((_QWORD *)v17 + 8) = 0xE000000000000000;
  *((_QWORD *)v17 + 9) = 0;
  *((_QWORD *)v17 + 10) = 0xE000000000000000;
  sub_1B5132FE4(a1, a2);
  swift_bridgeObjectRetain();
  v24 = MEMORY[0x1E0DEE9D8];
  *((_QWORD *)v17 + 11) = sub_1B514BED0();
  sub_1B514BCF0();
  sub_1B514BCB4();
  sub_1B514BCA8();
  v26 = v25;
  result = (id)(*(uint64_t (**)(char *, uint64_t))(v45 + 8))(v13, v46);
  v28 = v26 * 1000.0;
  if ((~COERCE__INT64(v26 * 1000.0) & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_7;
  }
  if (v28 <= -9.22337204e18)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  if (v28 >= 9.22337204e18)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  *((_QWORD *)v17 + 2) = (uint64_t)v28;
  *v10 = v24;
  v29 = v42;
  sub_1B514BCF0();
  v30 = (uint64_t)v10 + *(int *)(v29 + 24);
  OUTLINED_FUNCTION_4_0(v30, 1);
  v31 = (uint64_t)v10 + *(int *)(v29 + 28);
  OUTLINED_FUNCTION_5_0(v31, 1);
  sub_1B51348FC((uint64_t)v23, (uint64_t)v21, type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataPayloadMessage);
  sub_1B5134928(v30, &qword_1EF0F6B78);
  sub_1B5134950((uint64_t)v21, v30, type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataPayloadMessage);
  OUTLINED_FUNCTION_4_0(v30, 0);
  v32 = v43;
  sub_1B51348FC((uint64_t)v17, v43, type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataEventMetadata);
  sub_1B5134928(v31, &qword_1EF0F6B80);
  sub_1B5134950(v32, v31, type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataEventMetadata);
  OUTLINED_FUNCTION_5_0(v31, 0);
  sub_1B513497C();
  v33 = sub_1B514BDB0();
  v35 = v34;
  v50 = v40;
  v51 = v41;
  v48 = 0x6C7070612E6D6F63;
  v49 = 0xEA00000000002E65;
  strcpy(v47, "com.apple.dpg.");
  v47[15] = -18;
  sub_1B5134A44();
  v36 = sub_1B514BFCC();
  v38 = v37;
  objc_allocWithZone((Class)FLDPGBatch);
  sub_1B5132FE4(v33, v35);
  result = sub_1B51349BC(v36, v38, v33, v35);
  if (result)
  {
    v39 = result;
    sub_1B513303C(v33, v35);
    sub_1B5134A80((uint64_t)v10, type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataEventMessage);
    sub_1B5134A80((uint64_t)v17, type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataEventMetadata);
    sub_1B5134A80((uint64_t)v23, type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataPayloadMessage);
    return v39;
  }
LABEL_9:
  __break(1u);
  return result;
}

uint64_t sub_1B51346B0()
{
  return sub_1B514BF48();
}

uint64_t sub_1B5134714(uint64_t a1, uint64_t a2)
{
  return sub_1B513473C(a1, a2, (uint64_t)&type metadata for OSVariant, (uint64_t)&off_1E68A2A28) & 1;
}

uint64_t sub_1B513473C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (((*(uint64_t (**)(uint64_t, uint64_t))(a4 + 16))(a3, a4) & 1) != 0 || (sub_1B514BF48() & 1) != 0)
    return 1;
  else
    return sub_1B514BF48();
}

FLDPGBatchFactory __swiftcall FLDPGBatchFactory.init()()
{
  return (FLDPGBatchFactory)objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
}

id FLDPGBatchFactory.init()()
{
  objc_super v1;

  v1.super_class = (Class)FLDPGBatchFactory;
  return objc_msgSendSuper2(&v1, sel_init);
}

unint64_t type metadata accessor for FLDPGBatchFactory()
{
  unint64_t result;

  result = qword_1EF0F6B70;
  if (!qword_1EF0F6B70)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EF0F6B70);
  }
  return result;
}

uint64_t __swift_storeEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a4 - 8) + 56))();
}

void sub_1B51348FC(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v3;

  v3 = OUTLINED_FUNCTION_3_0(a1, a2, a3);
  OUTLINED_FUNCTION_6_0(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16));
  OUTLINED_FUNCTION_1_0();
}

void sub_1B5134928(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_0_0(v2);
  OUTLINED_FUNCTION_1_0();
}

void sub_1B5134950(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v3;

  v3 = OUTLINED_FUNCTION_3_0(a1, a2, a3);
  OUTLINED_FUNCTION_6_0(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 32));
  OUTLINED_FUNCTION_1_0();
}

unint64_t sub_1B513497C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EF0F6B88;
  if (!qword_1EF0F6B88)
  {
    v1 = type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataEventMessage(255);
    result = MEMORY[0x1B5E47AC4]("AHu1p2", v1);
    atomic_store(result, (unint64_t *)&qword_1EF0F6B88);
  }
  return result;
}

id sub_1B51349BC(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  void *v4;
  void *v7;
  void *v8;
  id v9;

  v7 = (void *)sub_1B514BEF4();
  swift_bridgeObjectRelease();
  v8 = (void *)sub_1B514BC84();
  v9 = objc_msgSend(v4, sel_initWithBundleID_payload_, v7, v8);
  sub_1B513303C(a3, a4);

  return v9;
}

unint64_t sub_1B5134A44()
{
  unint64_t result;

  result = qword_1EF0F6B90;
  if (!qword_1EF0F6B90)
  {
    result = MEMORY[0x1B5E47AC4](MEMORY[0x1E0DEA9B8], MEMORY[0x1E0DEA968]);
    atomic_store(result, (unint64_t *)&qword_1EF0F6B90);
  }
  return result;
}

void sub_1B5134A80(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v2;

  v2 = a2(0);
  OUTLINED_FUNCTION_0_0(v2);
  OUTLINED_FUNCTION_1_0();
}

uint64_t OUTLINED_FUNCTION_0_0(uint64_t a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 8))(v1, a1);
}

uint64_t OUTLINED_FUNCTION_3_0(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  return a3(0);
}

uint64_t OUTLINED_FUNCTION_4_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return __swift_storeEnumTagSinglePayload(a1, a2, 1, v2);
}

uint64_t OUTLINED_FUNCTION_5_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return __swift_storeEnumTagSinglePayload(a1, a2, 1, v2);
}

uint64_t OUTLINED_FUNCTION_6_0@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v1, v2);
}

BOOL sub_1B5134B08(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a1 == a3;
}

BOOL sub_1B5134B14(char a1, char a2)
{
  return a1 == a2;
}

void sub_1B5134B24(uint64_t a1, uint64_t a2, void (*a3)(uint64_t))
{
  uint64_t v4;

  v4 = OUTLINED_FUNCTION_76();
  a3(v4);
  OUTLINED_FUNCTION_47();
  OUTLINED_FUNCTION_56();
  OUTLINED_FUNCTION_73();
}

uint64_t sub_1B5134B64()
{
  sub_1B514C044();
  sub_1B51393AC();
  sub_1B514BEDC();
  return sub_1B514C050();
}

uint64_t sub_1B5134BB8()
{
  sub_1B514C044();
  sub_1B51393AC();
  sub_1B514BEDC();
  return sub_1B514C050();
}

void sub_1B5134C08(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t))
{
  uint64_t v5;

  v5 = sub_1B514C044();
  a4(v5);
  OUTLINED_FUNCTION_47();
  OUTLINED_FUNCTION_56();
  OUTLINED_FUNCTION_73();
}

void sub_1B5134C4C(uint64_t a1@<X8>)
{
  uint64_t v1;

  OUTLINED_FUNCTION_45(a1);
  *(_OWORD *)(v1 + 32) = xmmword_1B514D890;
  *(_OWORD *)(v1 + 48) = xmmword_1B514D890;
  OUTLINED_FUNCTION_61();
  OUTLINED_FUNCTION_36();
  OUTLINED_FUNCTION_1_0();
}

void sub_1B5134C7C(uint64_t a1@<X8>)
{
  *(_QWORD *)a1 = 0;
  *(_QWORD *)(a1 + 8) = 0xE000000000000000;
  *(_QWORD *)(a1 + 16) = 0;
  *(_QWORD *)(a1 + 24) = 0;
  *(_OWORD *)(a1 + 32) = xmmword_1B514D8A0;
  *(_QWORD *)(a1 + 48) = 0xE000000000000000;
  *(_QWORD *)(a1 + 56) = 0;
  *(_QWORD *)(a1 + 64) = 0xE000000000000000;
  *(_QWORD *)(a1 + 72) = 0;
  *(_QWORD *)(a1 + 80) = 0xE000000000000000;
  *(_QWORD *)(a1 + 88) = sub_1B514BED0();
  OUTLINED_FUNCTION_60();
  OUTLINED_FUNCTION_36();
  OUTLINED_FUNCTION_1_0();
}

uint64_t sub_1B5134CE8@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  *a1 = MEMORY[0x1E0DEE9D8];
  v2 = type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataEventMessage(0);
  OUTLINED_FUNCTION_36();
  v3 = (uint64_t)a1 + *(int *)(v2 + 24);
  v4 = OUTLINED_FUNCTION_61();
  __swift_storeEnumTagSinglePayload(v3, 1, 1, v4);
  v5 = (uint64_t)a1 + *(int *)(v2 + 28);
  v6 = OUTLINED_FUNCTION_60();
  return OUTLINED_FUNCTION_0_1(v5, 1, 1, v6);
}

void sub_1B5134D60()
{
  OUTLINED_FUNCTION_72();
}

void sub_1B5134D70(uint64_t a1@<X8>)
{
  *(_QWORD *)a1 = 0;
  *(_BYTE *)(a1 + 8) = 1;
}

void sub_1B5134D80(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_1B513503C(a1, a2, a3, (uint64_t (*)(void))sub_1B5134D60);
}

uint64_t sub_1B5134D8C()
{
  uint64_t v0;

  return nullsub_1(*(_QWORD *)v0, *(unsigned __int8 *)(v0 + 8));
}

void sub_1B5134D98(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  sub_1B5135068(a1, a2, a3, (uint64_t (*)(_QWORD))sub_1B5134D60);
}

uint64_t sub_1B5134DA4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t result;

  result = nullsub_1(*(_QWORD *)v1, *(unsigned __int8 *)(v1 + 8));
  *a1 = result;
  return result;
}

void sub_1B5134DD0()
{
  uint64_t v0;

  sub_1B5134B24(*(_QWORD *)v0, *(unsigned __int8 *)(v0 + 8), (void (*)(uint64_t))sub_1B513EB20);
}

uint64_t sub_1B5134DFC()
{
  sub_1B513BE58();
  return sub_1B514BD20();
}

void sub_1B5134E34(uint64_t a1)
{
  uint64_t v1;

  sub_1B5134C08(a1, *(_QWORD *)v1, *(unsigned __int8 *)(v1 + 8), (void (*)(uint64_t))sub_1B513EB20);
}

BOOL sub_1B5134E60(uint64_t a1, uint64_t *a2)
{
  return sub_1B5134B08(*(_QWORD *)a1, *(unsigned __int8 *)(a1 + 8), *a2);
}

void sub_1B5134E7C()
{
  qword_1EF0F6F68 = (uint64_t)&unk_1E68A2748;
}

uint64_t *sub_1B5134E90()
{
  if (qword_1EF0F6A60 != -1)
    swift_once();
  return &qword_1EF0F6F68;
}

uint64_t sub_1B5134ED0@<X0>(_QWORD *a1@<X8>)
{
  sub_1B5134E90();
  *a1 = qword_1EF0F6F68;
  return swift_bridgeObjectRetain();
}

void sub_1B5134EFC()
{
  OUTLINED_FUNCTION_72();
}

void sub_1B5134F08(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_1B513503C(a1, a2, a3, (uint64_t (*)(void))sub_1B5134EFC);
}

void sub_1B5134F14(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  sub_1B5135068(a1, a2, a3, (uint64_t (*)(_QWORD))sub_1B5134EFC);
}

void sub_1B5134F20()
{
  uint64_t v0;

  sub_1B5134B24(*(_QWORD *)v0, *(unsigned __int8 *)(v0 + 8), (void (*)(uint64_t))sub_1B513EAA0);
}

uint64_t sub_1B5134F4C()
{
  sub_1B513BE94();
  return sub_1B514BD20();
}

void sub_1B5134F84(uint64_t a1)
{
  uint64_t v1;

  sub_1B5134C08(a1, *(_QWORD *)v1, *(unsigned __int8 *)(v1 + 8), (void (*)(uint64_t))sub_1B513EAA0);
}

void sub_1B5134FB0()
{
  qword_1EF0F6F70 = (uint64_t)&unk_1E68A2908;
}

uint64_t *sub_1B5134FC4()
{
  if (qword_1EF0F6A68 != -1)
    swift_once();
  return &qword_1EF0F6F70;
}

uint64_t sub_1B5135004@<X0>(_QWORD *a1@<X8>)
{
  sub_1B5134FC4();
  *a1 = qword_1EF0F6F70;
  return swift_bridgeObjectRetain();
}

void sub_1B5135030(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_1B513503C(a1, a2, a3, (uint64_t (*)(void))sub_1B513EB9C);
}

void sub_1B513503C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  uint64_t v4;
  __int16 v5;

  v4 = a4();
  OUTLINED_FUNCTION_68(v4, v5);
  OUTLINED_FUNCTION_1_0();
}

void sub_1B513505C(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  sub_1B5135068(a1, a2, a3, (uint64_t (*)(_QWORD))sub_1B513EB9C);
}

void sub_1B5135068(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(_QWORD))
{
  uint64_t v4;
  __int16 v5;

  v4 = a4(*a1);
  OUTLINED_FUNCTION_68(v4, v5);
  OUTLINED_FUNCTION_1_0();
}

void sub_1B513508C()
{
  uint64_t v0;

  sub_1B5134B24(*(_QWORD *)v0, *(unsigned __int8 *)(v0 + 8), (void (*)(uint64_t))sub_1B513EA20);
}

uint64_t sub_1B51350B8()
{
  sub_1B513BEF0();
  return sub_1B514BD20();
}

void sub_1B51350F0(uint64_t a1)
{
  uint64_t v1;

  sub_1B5134C08(a1, *(_QWORD *)v1, *(unsigned __int8 *)(v1 + 8), (void (*)(uint64_t))sub_1B513EA20);
}

void sub_1B513511C()
{
  qword_1EF0F6F78 = (uint64_t)&unk_1E68A2828;
}

uint64_t *sub_1B5135130()
{
  if (qword_1EF0F6A70 != -1)
    swift_once();
  return &qword_1EF0F6F78;
}

uint64_t sub_1B5135170@<X0>(_QWORD *a1@<X8>)
{
  sub_1B5135130();
  *a1 = qword_1EF0F6F78;
  return swift_bridgeObjectRetain();
}

void sub_1B513519C(uint64_t a1@<X8>)
{
  *(_DWORD *)a1 = 0;
  *(_OWORD *)(a1 + 8) = xmmword_1B514D890;
  *(_QWORD *)(a1 + 24) = 0;
  *(_BYTE *)(a1 + 32) = 1;
  *(_QWORD *)(a1 + 40) = 0;
  *(_QWORD *)(a1 + 48) = 0xE000000000000000;
  type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataEventError(0);
  OUTLINED_FUNCTION_36();
  OUTLINED_FUNCTION_1_0();
}

void sub_1B51351E8(uint64_t a1@<X8>)
{
  *(_QWORD *)a1 = MEMORY[0x1E0DEE9D8];
  *(_OWORD *)(a1 + 8) = xmmword_1B514D890;
  type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_BatchPublishRequest(0);
  OUTLINED_FUNCTION_36();
  OUTLINED_FUNCTION_1_0();
}

void sub_1B5135228(uint64_t a1@<X8>)
{
  uint64_t v1;

  OUTLINED_FUNCTION_45(a1);
  *(_QWORD *)(v1 + 32) = MEMORY[0x1E0DEE9D8];
  type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_BatchPublishResponse(0);
  OUTLINED_FUNCTION_36();
  OUTLINED_FUNCTION_1_0();
}

uint64_t sub_1B513525C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(void);
  char *v11;
  _QWORD *v12;
  char *v13;

  v0 = sub_1B514BE4C();
  __swift_allocate_value_buffer(v0, qword_1EF0F6F80);
  __swift_project_value_buffer(v0, (uint64_t)qword_1EF0F6F80);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF0F6CF8);
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF0F6D00);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(_QWORD *)(v2 + 72);
  v4 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_1B514D810;
  v6 = (_QWORD *)(v5 + v4);
  v7 = v5 + v4 + *(int *)(v1 + 48);
  *v6 = 0;
  *(_QWORD *)v7 = "PAYLOAD_UNKNOWN";
  *(_QWORD *)(v7 + 8) = 15;
  *(_BYTE *)(v7 + 16) = 2;
  v8 = *MEMORY[0x1E0D3EF08];
  v9 = sub_1B514BE34();
  v10 = *(void (**)(void))(*(_QWORD *)(v9 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v10)(v7, v8, v9);
  v11 = (char *)v6 + v3 + *(int *)(v1 + 48);
  *(_QWORD *)((char *)v6 + v3) = 1;
  *(_QWORD *)v11 = "PAYLOAD_AVRO_RECORD";
  *((_QWORD *)v11 + 1) = 19;
  v11[16] = 2;
  v10();
  v12 = (_QWORD *)((char *)v6 + 2 * v3);
  v13 = (char *)v12 + *(int *)(v1 + 48);
  *v12 = 2;
  *(_QWORD *)v13 = "PAYLOAD_PROTO_RECORD";
  *((_QWORD *)v13 + 1) = 20;
  v13[16] = 2;
  v10();
  return sub_1B514BE40();
}

uint64_t sub_1B51353E0(uint64_t a1, uint64_t a2)
{
  return sub_1B5135670(a1, a2, &qword_1EF0F6A78, (uint64_t)qword_1EF0F6F80);
}

uint64_t sub_1B51353FC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(void);
  unint64_t v11;
  _QWORD *v12;
  char *v13;
  _QWORD *v14;
  char *v15;
  _QWORD *v16;
  char *v17;
  _QWORD *v18;
  char *v19;
  _QWORD *v20;
  char *v21;

  v0 = sub_1B514BE4C();
  __swift_allocate_value_buffer(v0, qword_1EF0F6F98);
  __swift_project_value_buffer(v0, (uint64_t)qword_1EF0F6F98);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF0F6CF8);
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF0F6D00);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(_QWORD *)(v2 + 72);
  v4 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_1B514D8C0;
  v6 = v5 + v4;
  v7 = v5 + v4 + *(int *)(v1 + 48);
  *(_QWORD *)(v5 + v4) = 0;
  *(_QWORD *)v7 = "EVENT_HEADERS_INVALID";
  *(_QWORD *)(v7 + 8) = 21;
  *(_BYTE *)(v7 + 16) = 2;
  v8 = *MEMORY[0x1E0D3EF08];
  v9 = sub_1B514BE34();
  v10 = *(void (**)(void))(*(_QWORD *)(v9 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v10)(v7, v8, v9);
  v11 = v6 + v3 + *(int *)(v1 + 48);
  *(_QWORD *)(v6 + v3) = 1;
  *(_QWORD *)v11 = "EVENT_BODY_INVALID";
  *(_QWORD *)(v11 + 8) = 18;
  *(_BYTE *)(v11 + 16) = 2;
  v10();
  v12 = (_QWORD *)(v6 + 2 * v3);
  v13 = (char *)v12 + *(int *)(v1 + 48);
  *v12 = 2;
  *(_QWORD *)v13 = "EVENT_BODY_TOO_LARGE";
  *((_QWORD *)v13 + 1) = 20;
  v13[16] = 2;
  v10();
  v14 = (_QWORD *)(v6 + 3 * v3);
  v15 = (char *)v14 + *(int *)(v1 + 48);
  *v14 = 3;
  *(_QWORD *)v15 = "EVENT_SCHEMA_UNKNOWN";
  *((_QWORD *)v15 + 1) = 20;
  v15[16] = 2;
  v10();
  v16 = (_QWORD *)(v6 + 4 * v3);
  v17 = (char *)v16 + *(int *)(v1 + 48);
  *v16 = 4;
  *(_QWORD *)v17 = "EVENT_UNSUPPORTED";
  *((_QWORD *)v17 + 1) = 17;
  v17[16] = 2;
  v10();
  v18 = (_QWORD *)(v6 + 5 * v3);
  v19 = (char *)v18 + *(int *)(v1 + 48);
  *v18 = 5;
  *(_QWORD *)v19 = "EVENT_TIMEOUT";
  *((_QWORD *)v19 + 1) = 13;
  v19[16] = 2;
  v10();
  v20 = (_QWORD *)(v6 + 6 * v3);
  v21 = (char *)v20 + *(int *)(v1 + 48);
  *v20 = 6;
  *(_QWORD *)v21 = "EVENT_PRODUCER_FAILED";
  *((_QWORD *)v21 + 1) = 21;
  v21[16] = 2;
  v10();
  return sub_1B514BE40();
}

uint64_t sub_1B5135654(uint64_t a1, uint64_t a2)
{
  return sub_1B5135670(a1, a2, &qword_1EF0F6A80, (uint64_t)qword_1EF0F6F98);
}

uint64_t sub_1B5135670(uint64_t a1, uint64_t a2, _QWORD *a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(void);

  sub_1B51383F0(a3, a4);
  OUTLINED_FUNCTION_74();
  v4 = OUTLINED_FUNCTION_29();
  return OUTLINED_FUNCTION_6_1(v4, v5, v6, v7);
}

uint64_t sub_1B51356A4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(void);
  char *v11;
  _QWORD *v12;
  char *v13;

  v0 = sub_1B514BE4C();
  __swift_allocate_value_buffer(v0, qword_1EF0F6FB0);
  __swift_project_value_buffer(v0, (uint64_t)qword_1EF0F6FB0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF0F6CF8);
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF0F6D00);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(_QWORD *)(v2 + 72);
  v4 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_1B514D810;
  v6 = (_QWORD *)(v5 + v4);
  v7 = v5 + v4 + *(int *)(v1 + 48);
  *v6 = 0;
  *(_QWORD *)v7 = "OK";
  *(_QWORD *)(v7 + 8) = 2;
  *(_BYTE *)(v7 + 16) = 2;
  v8 = *MEMORY[0x1E0D3EF08];
  v9 = sub_1B514BE34();
  v10 = *(void (**)(void))(*(_QWORD *)(v9 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v10)(v7, v8, v9);
  v11 = (char *)v6 + v3 + *(int *)(v1 + 48);
  *(_QWORD *)((char *)v6 + v3) = 1;
  *(_QWORD *)v11 = "FAILED_ALL";
  *((_QWORD *)v11 + 1) = 10;
  v11[16] = 2;
  v10();
  v12 = (_QWORD *)((char *)v6 + 2 * v3);
  v13 = (char *)v12 + *(int *)(v1 + 48);
  *v12 = 2;
  *(_QWORD *)v13 = "FAILED_PARTIAL";
  *((_QWORD *)v13 + 1) = 14;
  v13[16] = 2;
  v10();
  return sub_1B514BE40();
}

uint64_t sub_1B5135824(uint64_t a1, uint64_t a2)
{
  return sub_1B5135670(a1, a2, &qword_1EF0F6A88, (uint64_t)qword_1EF0F6FB0);
}

uint64_t sub_1B5135840()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(void);
  char *v11;
  _QWORD *v12;
  char *v13;

  v0 = sub_1B514BE4C();
  __swift_allocate_value_buffer(v0, qword_1EF0F6FC8);
  __swift_project_value_buffer(v0, (uint64_t)qword_1EF0F6FC8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF0F6CF8);
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF0F6D00);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(_QWORD *)(v2 + 72);
  v4 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_1B514D810;
  v6 = (_QWORD *)(v5 + v4);
  v7 = v5 + v4 + *(int *)(v1 + 48);
  *v6 = 4;
  *(_QWORD *)v7 = "payload";
  *(_QWORD *)(v7 + 8) = 7;
  *(_BYTE *)(v7 + 16) = 2;
  v8 = *MEMORY[0x1E0D3EF08];
  v9 = sub_1B514BE34();
  v10 = *(void (**)(void))(*(_QWORD *)(v9 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v10)(v7, v8, v9);
  v11 = (char *)v6 + v3 + *(int *)(v1 + 48);
  *(_QWORD *)((char *)v6 + v3) = 6;
  *(_QWORD *)v11 = "headers";
  *((_QWORD *)v11 + 1) = 7;
  v11[16] = 2;
  v10();
  v12 = (_QWORD *)((char *)v6 + 2 * v3);
  v13 = (char *)v12 + *(int *)(v1 + 48);
  *v12 = 7;
  *(_QWORD *)v13 = "metadata";
  *((_QWORD *)v13 + 1) = 8;
  v13[16] = 2;
  v10();
  return sub_1B514BE40();
}

void sub_1B51359CC()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = OUTLINED_FUNCTION_2_1();
  if (!v0)
  {
    while ((v2 & 1) == 0)
    {
      switch(v1)
      {
        case 7:
          OUTLINED_FUNCTION_3_1();
          sub_1B5135B00();
          break;
        case 6:
          v3 = OUTLINED_FUNCTION_3_1();
          sub_1B5137E6C(v3, v4, v5, v6, (void (*)(_QWORD))type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataPayloadMessage);
          break;
        case 4:
          OUTLINED_FUNCTION_3_1();
          sub_1B5135A6C();
          break;
      }
      v1 = OUTLINED_FUNCTION_20();
    }
  }
  OUTLINED_FUNCTION_27();
}

uint64_t sub_1B5135A6C()
{
  type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataEventMessage(0);
  type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataPayloadMessage(0);
  sub_1B5139270(&qword_1EF0F6C78, type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataPayloadMessage, (uint64_t)&unk_1B514E150);
  return sub_1B514BD98();
}

uint64_t sub_1B5135B00()
{
  type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataEventMessage(0);
  type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataEventMetadata(0);
  sub_1B5139270(&qword_1EF0F6C98, type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataEventMetadata, (uint64_t)&unk_1B514E2B8);
  return sub_1B514BD98();
}

void sub_1B5135B94()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  OUTLINED_FUNCTION_50();
  sub_1B5135C84(v2);
  if (!v1)
  {
    if (*(_QWORD *)(*(_QWORD *)v0 + 16))
    {
      type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataPayloadMessage(0);
      sub_1B5139270(&qword_1EF0F6C78, type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataPayloadMessage, (uint64_t)&unk_1B514E150);
      sub_1B514BE1C();
    }
    OUTLINED_FUNCTION_50();
    sub_1B5135E40(v3);
    type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataEventMessage(0);
    OUTLINED_FUNCTION_67();
    sub_1B514BCE4();
  }
  OUTLINED_FUNCTION_17();
}

void sub_1B5135C84(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  _QWORD v9[2];

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF0F6B78);
  MEMORY[0x1E0C80A78](v2);
  v4 = (char *)v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataPayloadMessage(0);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataEventMessage(0);
  sub_1B5139EE0(a1 + *(int *)(v8 + 24), (uint64_t)v4, &qword_1EF0F6B78);
  if (__swift_getEnumTagSinglePayload((uint64_t)v4, 1, v5) == 1)
  {
    sub_1B5134928((uint64_t)v4, &qword_1EF0F6B78);
  }
  else
  {
    sub_1B5139F0C((uint64_t)v4, (uint64_t)v7, type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataPayloadMessage);
    sub_1B5139270(&qword_1EF0F6C78, type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataPayloadMessage, (uint64_t)&unk_1B514E150);
    sub_1B514BE28();
    sub_1B5134A80((uint64_t)v7, type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataPayloadMessage);
  }
}

uint64_t sub_1B5135DF4(uint64_t a1, unint64_t a2)
{
  return ((uint64_t (*)(void))((char *)sub_1B5135E18 + 4 * byte_1B514D8E0[a2 >> 62]))();
}

BOOL sub_1B5135E18(uint64_t a1, uint64_t a2)
{
  return BYTE6(a2) == 0;
}

void sub_1B5135E40(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  _QWORD v9[2];

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF0F6B80);
  MEMORY[0x1E0C80A78](v2);
  v4 = (char *)v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataEventMetadata(0);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataEventMessage(0);
  sub_1B5139EE0(a1 + *(int *)(v8 + 28), (uint64_t)v4, &qword_1EF0F6B80);
  if (__swift_getEnumTagSinglePayload((uint64_t)v4, 1, v5) == 1)
  {
    sub_1B5134928((uint64_t)v4, &qword_1EF0F6B80);
  }
  else
  {
    sub_1B5139F0C((uint64_t)v4, (uint64_t)v7, type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataEventMetadata);
    sub_1B5139270(&qword_1EF0F6C98, type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataEventMetadata, (uint64_t)&unk_1B514E2B8);
    sub_1B514BE28();
    sub_1B5134A80((uint64_t)v7, type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataEventMetadata);
  }
}

uint64_t sub_1B5135FB0(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3;
  char *v4;
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
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char v38;
  uint64_t *v39;
  uint64_t v40;
  char v41;
  char v42;
  uint64_t *v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  char v52;
  char v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;
  void (*v57)(char *, char *, uint64_t);
  char *v58;
  char *v59;
  char v60;
  void (*v61)(uint64_t, uint64_t);
  uint64_t v63;
  uint64_t v64;
  char *v65;
  char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t *v75;
  uint64_t *v76;

  v76 = a2;
  v3 = OUTLINED_FUNCTION_5_1();
  v67 = *(_QWORD *)(v3 - 8);
  v68 = v3;
  MEMORY[0x1E0C80A78](v3);
  OUTLINED_FUNCTION_71();
  v66 = v4;
  MEMORY[0x1E0C80A78](v5);
  v65 = (char *)&v63 - v6;
  v73 = OUTLINED_FUNCTION_60();
  OUTLINED_FUNCTION_2_0();
  MEMORY[0x1E0C80A78](v7);
  OUTLINED_FUNCTION_70();
  v64 = v8;
  v70 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF0F6D10);
  OUTLINED_FUNCTION_2_0();
  MEMORY[0x1E0C80A78](v9);
  OUTLINED_FUNCTION_70();
  v74 = v10;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF0F6B80);
  OUTLINED_FUNCTION_2_0();
  MEMORY[0x1E0C80A78](v11);
  OUTLINED_FUNCTION_71();
  v69 = v12;
  v14 = MEMORY[0x1E0C80A78](v13);
  v71 = (uint64_t)&v63 - v15;
  MEMORY[0x1E0C80A78](v14);
  v72 = (uint64_t)&v63 - v16;
  v17 = OUTLINED_FUNCTION_61();
  OUTLINED_FUNCTION_2_0();
  MEMORY[0x1E0C80A78](v18);
  v20 = (char *)&v63 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF0F6D18);
  OUTLINED_FUNCTION_2_0();
  MEMORY[0x1E0C80A78](v22);
  v24 = (char *)&v63 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF0F6B78);
  OUTLINED_FUNCTION_2_0();
  v26 = MEMORY[0x1E0C80A78](v25);
  v28 = (char *)&v63 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  v29 = MEMORY[0x1E0C80A78](v26);
  v31 = (char *)&v63 - v30;
  MEMORY[0x1E0C80A78](v29);
  v33 = (char *)&v63 - v32;
  v34 = type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataEventMessage(0);
  v35 = *(int *)(v34 + 24);
  v75 = a1;
  OUTLINED_FUNCTION_62((uint64_t)a1 + v35, (uint64_t)v33);
  v36 = v34;
  OUTLINED_FUNCTION_62((uint64_t)v76 + *(int *)(v34 + 24), (uint64_t)v31);
  v37 = (uint64_t)&v24[*(int *)(v21 + 48)];
  OUTLINED_FUNCTION_62((uint64_t)v33, (uint64_t)v24);
  OUTLINED_FUNCTION_62((uint64_t)v31, v37);
  if (__swift_getEnumTagSinglePayload((uint64_t)v24, 1, v17) == 1)
  {
    OUTLINED_FUNCTION_46((uint64_t)v31);
    OUTLINED_FUNCTION_46((uint64_t)v33);
    OUTLINED_FUNCTION_22();
    if (!v38)
      goto LABEL_8;
    sub_1B5134928((uint64_t)v24, &qword_1EF0F6B78);
  }
  else
  {
    sub_1B5139EE0((uint64_t)v24, (uint64_t)v28, &qword_1EF0F6B78);
    OUTLINED_FUNCTION_22();
    if (v38)
    {
      sub_1B5134928((uint64_t)v31, &qword_1EF0F6B78);
      sub_1B5134928((uint64_t)v33, &qword_1EF0F6B78);
      sub_1B5134A80((uint64_t)v28, type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataPayloadMessage);
LABEL_8:
      v39 = &qword_1EF0F6D18;
      v40 = (uint64_t)v24;
LABEL_9:
      sub_1B5134928(v40, v39);
LABEL_22:
      v60 = 0;
      return v60 & 1;
    }
    sub_1B5139F0C(v37, (uint64_t)v20, type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataPayloadMessage);
    sub_1B5137384();
    v42 = v41;
    sub_1B5134A80((uint64_t)v20, type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataPayloadMessage);
    OUTLINED_FUNCTION_46((uint64_t)v31);
    OUTLINED_FUNCTION_46((uint64_t)v33);
    sub_1B5134A80((uint64_t)v28, type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataPayloadMessage);
    OUTLINED_FUNCTION_46((uint64_t)v24);
    if ((v42 & 1) == 0)
      goto LABEL_22;
  }
  v43 = v75;
  v44 = v76;
  if ((sub_1B513A934(*v75, *v76) & 1) == 0)
    goto LABEL_22;
  v45 = v36;
  v46 = v72;
  OUTLINED_FUNCTION_51((uint64_t)v43 + *(int *)(v36 + 28), v72);
  v47 = v71;
  OUTLINED_FUNCTION_51((uint64_t)v44 + *(int *)(v36 + 28), v71);
  v48 = v74;
  v49 = v74 + *(int *)(v70 + 48);
  OUTLINED_FUNCTION_51(v46, v74);
  OUTLINED_FUNCTION_51(v47, v49);
  if (__swift_getEnumTagSinglePayload(v48, 1, v73) == 1)
  {
    sub_1B5134928(v47, &qword_1EF0F6B80);
    sub_1B5134928(v46, &qword_1EF0F6B80);
    OUTLINED_FUNCTION_22();
    if (!v38)
      goto LABEL_19;
    sub_1B5134928(v48, &qword_1EF0F6B80);
  }
  else
  {
    v50 = v69;
    sub_1B5139EE0(v48, v69, &qword_1EF0F6B80);
    OUTLINED_FUNCTION_22();
    if (v38)
    {
      sub_1B5134928(v47, &qword_1EF0F6B80);
      sub_1B5134928(v46, &qword_1EF0F6B80);
      sub_1B5134A80(v50, type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataEventMetadata);
LABEL_19:
      v39 = &qword_1EF0F6D10;
      v40 = v48;
      goto LABEL_9;
    }
    v51 = v64;
    sub_1B5139F0C(v49, v64, type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataEventMetadata);
    sub_1B5136C84();
    v53 = v52;
    sub_1B5134A80(v51, type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataEventMetadata);
    OUTLINED_FUNCTION_69(v47);
    OUTLINED_FUNCTION_69(v46);
    sub_1B5134A80(v50, type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataEventMetadata);
    OUTLINED_FUNCTION_69(v48);
    if ((v53 & 1) == 0)
      goto LABEL_22;
  }
  v54 = (char *)v43 + *(int *)(v45 + 20);
  v56 = v67;
  v55 = v68;
  v57 = *(void (**)(char *, char *, uint64_t))(v67 + 16);
  v58 = v65;
  v57(v65, v54, v68);
  v59 = v66;
  v57(v66, (char *)v44 + *(int *)(v45 + 20), v55);
  sub_1B5139270(&qword_1EF0F6BB0, (uint64_t (*)(uint64_t))MEMORY[0x1E0D3E998], MEMORY[0x1E0D3E9A8]);
  v60 = sub_1B514BEE8();
  v61 = *(void (**)(uint64_t, uint64_t))(v56 + 8);
  v61((uint64_t)v59, v55);
  v61((uint64_t)v58, v55);
  return v60 & 1;
}

unint64_t sub_1B5136554()
{
  return 0xD00000000000002ELL;
}

uint64_t sub_1B5136574@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;

  v4 = v2 + *(int *)(a1 + 20);
  v5 = sub_1B514BCFC();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, v4, v5);
}

uint64_t sub_1B51365B4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;

  v4 = v2 + *(int *)(a2 + 20);
  v5 = sub_1B514BCFC();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 40))(v4, a1, v5);
}

uint64_t (*sub_1B51365F4())(_QWORD, _QWORD)
{
  return nullsub_1;
}

void sub_1B5136608()
{
  sub_1B51359CC();
}

void sub_1B513661C()
{
  sub_1B5135B94();
}

uint64_t sub_1B5136634()
{
  sub_1B5139270(&qword_1EF0F6D08, type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataEventMessage, (uint64_t)&unk_1B514E3E8);
  return sub_1B514BD14();
}

uint64_t sub_1B5136688(uint64_t a1, uint64_t a2)
{
  return sub_1B5135670(a1, a2, &qword_1EF0F6A90, (uint64_t)qword_1EF0F6FC8);
}

uint64_t sub_1B51366A4()
{
  sub_1B5139270((unint64_t *)&qword_1EF0F6B88, type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataEventMessage, (uint64_t)"AHu1p2");
  return sub_1B514BDBC();
}

uint64_t sub_1B51366E4()
{
  return sub_1B5138FC0((void (*)(_QWORD))type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataEventMessage);
}

uint64_t sub_1B5136710()
{
  sub_1B5139270((unint64_t *)&qword_1EF0F6B88, type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataEventMessage, (uint64_t)"AHu1p2");
  return sub_1B514BDC8();
}

uint64_t sub_1B5136768()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(void);
  unint64_t v11;
  _QWORD *v12;
  char *v13;
  _QWORD *v14;
  char *v15;
  _QWORD *v16;
  char *v17;
  _QWORD *v18;
  char *v19;
  _QWORD *v20;
  char *v21;

  v0 = sub_1B514BE4C();
  __swift_allocate_value_buffer(v0, qword_1EF0F6FE0);
  __swift_project_value_buffer(v0, (uint64_t)qword_1EF0F6FE0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF0F6CF8);
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF0F6D00);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(_QWORD *)(v2 + 72);
  v4 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_1B514D8C0;
  v6 = v5 + v4;
  v7 = v5 + v4 + *(int *)(v1 + 48);
  *(_QWORD *)(v5 + v4) = 1;
  *(_QWORD *)v7 = "fqn";
  *(_QWORD *)(v7 + 8) = 3;
  *(_BYTE *)(v7 + 16) = 2;
  v8 = *MEMORY[0x1E0D3EF08];
  v9 = sub_1B514BE34();
  v10 = *(void (**)(void))(*(_QWORD *)(v9 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v10)(v7, v8, v9);
  v11 = v6 + v3 + *(int *)(v1 + 48);
  *(_QWORD *)(v6 + v3) = 2;
  *(_QWORD *)v11 = "timestamp_ms";
  *(_QWORD *)(v11 + 8) = 12;
  *(_BYTE *)(v11 + 16) = 2;
  v10();
  v12 = (_QWORD *)(v6 + 2 * v3);
  v13 = (char *)v12 + *(int *)(v1 + 48);
  *v12 = 3;
  *(_QWORD *)v13 = "request_id";
  *((_QWORD *)v13 + 1) = 10;
  v13[16] = 2;
  v10();
  v14 = (_QWORD *)(v6 + 3 * v3);
  v15 = (char *)v14 + *(int *)(v1 + 48);
  *v14 = 4;
  *(_QWORD *)v15 = "topic_override";
  *((_QWORD *)v15 + 1) = 14;
  v15[16] = 2;
  v10();
  v16 = (_QWORD *)(v6 + 4 * v3);
  v17 = (char *)v16 + *(int *)(v1 + 48);
  *v16 = 5;
  *(_QWORD *)v17 = "source_cluster";
  *((_QWORD *)v17 + 1) = 14;
  v17[16] = 2;
  v10();
  v18 = (_QWORD *)(v6 + 5 * v3);
  v19 = (char *)v18 + *(int *)(v1 + 48);
  *v18 = 6;
  *(_QWORD *)v19 = "stream";
  *((_QWORD *)v19 + 1) = 6;
  v19[16] = 2;
  v10();
  v20 = (_QWORD *)(v6 + 6 * v3);
  v21 = (char *)v20 + *(int *)(v1 + 48);
  *v20 = 7;
  *(_QWORD *)v21 = "legacyHeaders";
  *((_QWORD *)v21 + 1) = 13;
  v21[16] = 2;
  v10();
  return sub_1B514BE40();
}

void sub_1B51369D0()
{
  uint64_t v0;
  uint64_t v1;
  char v2;

  v1 = OUTLINED_FUNCTION_2_1();
  if (!v0)
  {
    while ((v2 & 1) == 0)
    {
      switch(v1)
      {
        case 1:
        case 4:
        case 5:
        case 6:
          OUTLINED_FUNCTION_32();
          break;
        case 2:
          sub_1B514BD74();
          break;
        case 3:
          OUTLINED_FUNCTION_33();
          break;
        case 7:
          OUTLINED_FUNCTION_3_1();
          sub_1B5136AA4();
          break;
        default:
          break;
      }
      v1 = OUTLINED_FUNCTION_20();
    }
  }
  OUTLINED_FUNCTION_41();
}

uint64_t sub_1B5136AA4()
{
  sub_1B514BCD8();
  return sub_1B514BD2C();
}

void sub_1B5136B14()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_53();
  OUTLINED_FUNCTION_9_0();
  if (!v2 || (OUTLINED_FUNCTION_21(), !v1))
  {
    if (!*(_QWORD *)(v0 + 16) || (OUTLINED_FUNCTION_50(), sub_1B514BE04(), !v1))
    {
      if ((OUTLINED_FUNCTION_26() & 1) != 0 || (OUTLINED_FUNCTION_34(), !v1))
      {
        OUTLINED_FUNCTION_9_0();
        if (!v3 || (OUTLINED_FUNCTION_21(), !v1))
        {
          OUTLINED_FUNCTION_9_0();
          if (!v4 || (OUTLINED_FUNCTION_21(), !v1))
          {
            OUTLINED_FUNCTION_9_0();
            if (!v5 || (OUTLINED_FUNCTION_21(), !v1))
            {
              if (!*(_QWORD *)(*(_QWORD *)(v0 + 88) + 16) || (sub_1B514BCD8(), sub_1B514BDD4(), !v1))
              {
                type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataEventMetadata(0);
                sub_1B514BCE4();
              }
            }
          }
        }
      }
    }
  }
  OUTLINED_FUNCTION_27();
}

void sub_1B5136C84()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  BOOL v7;
  BOOL v8;
  BOOL v9;
  BOOL v10;
  uint64_t v11;

  OUTLINED_FUNCTION_75();
  v2 = v1;
  v4 = v3;
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_18();
  MEMORY[0x1E0C80A78](v5);
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x1E0C80A78](v6);
  OUTLINED_FUNCTION_37();
  v7 = *v4 == *v2 && v4[1] == v2[1];
  if ((v7 || (OUTLINED_FUNCTION_35() & 1) != 0)
    && v4[2] == v2[2]
    && (MEMORY[0x1B5E47050](v4[3], v4[4], v2[3], v2[4]) & 1) != 0)
  {
    v8 = v4[5] == v2[5] && v4[6] == v2[6];
    if (v8 || (OUTLINED_FUNCTION_35() & 1) != 0)
    {
      v9 = v4[7] == v2[7] && v4[8] == v2[8];
      if (v9 || (OUTLINED_FUNCTION_35() & 1) != 0)
      {
        v10 = v4[9] == v2[9] && v4[10] == v2[10];
        if ((v10 || (OUTLINED_FUNCTION_35() & 1) != 0) && (sub_1B513B750(v4[11], v2[11]) & 1) != 0)
        {
          v11 = OUTLINED_FUNCTION_60();
          OUTLINED_FUNCTION_10(*(int *)(v11 + 44));
          OUTLINED_FUNCTION_14(*(int *)(v11 + 44));
          sub_1B5139270(&qword_1EF0F6BB0, (uint64_t (*)(uint64_t))MEMORY[0x1E0D3E998], MEMORY[0x1E0D3E9A8]);
          OUTLINED_FUNCTION_8_0();
          OUTLINED_FUNCTION_13();
          OUTLINED_FUNCTION_30(v0);
        }
      }
    }
  }
  OUTLINED_FUNCTION_66();
  OUTLINED_FUNCTION_7_0();
}

unint64_t sub_1B5136DD4()
{
  return 0xD00000000000002FLL;
}

uint64_t sub_1B5136DF0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;

  v4 = v2 + *(int *)(a1 + 44);
  v5 = sub_1B514BCFC();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, v4, v5);
}

uint64_t sub_1B5136E30(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;

  v4 = v2 + *(int *)(a2 + 44);
  v5 = sub_1B514BCFC();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 40))(v4, a1, v5);
}

uint64_t (*sub_1B5136E70())(_QWORD, _QWORD)
{
  return nullsub_1;
}

void sub_1B5136E84()
{
  sub_1B51369D0();
}

void sub_1B5136E98()
{
  sub_1B5136B14();
}

uint64_t sub_1B5136EAC()
{
  sub_1B5139270(&qword_1EF0F6D20, type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataEventMetadata, (uint64_t)"AJu184");
  return sub_1B514BD14();
}

uint64_t sub_1B5136EFC(uint64_t a1, uint64_t a2)
{
  return sub_1B5135670(a1, a2, &qword_1EF0F6A98, (uint64_t)qword_1EF0F6FE0);
}

uint64_t sub_1B5136F18()
{
  sub_1B5139270(&qword_1EF0F6C98, type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataEventMetadata, (uint64_t)&unk_1B514E2B8);
  return sub_1B514BDBC();
}

uint64_t sub_1B5136F58()
{
  return sub_1B5138FC0((void (*)(_QWORD))type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataEventMetadata);
}

uint64_t sub_1B5136F84()
{
  sub_1B5139270(&qword_1EF0F6C98, type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataEventMetadata, (uint64_t)&unk_1B514E2B8);
  return sub_1B514BDC8();
}

uint64_t sub_1B5136FD8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(void);
  unint64_t v11;
  _QWORD *v12;
  char *v13;
  _QWORD *v14;
  char *v15;

  v0 = sub_1B514BE4C();
  __swift_allocate_value_buffer(v0, qword_1EF0F6FF8);
  __swift_project_value_buffer(v0, (uint64_t)qword_1EF0F6FF8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF0F6CF8);
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF0F6D00);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(_QWORD *)(v2 + 72);
  v4 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_1B514D8D0;
  v6 = v5 + v4;
  v7 = v5 + v4 + *(int *)(v1 + 48);
  *(_QWORD *)(v5 + v4) = 1;
  *(_QWORD *)v7 = "payload_type";
  *(_QWORD *)(v7 + 8) = 12;
  *(_BYTE *)(v7 + 16) = 2;
  v8 = *MEMORY[0x1E0D3EF20];
  v9 = sub_1B514BE34();
  v10 = *(void (**)(void))(*(_QWORD *)(v9 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v10)(v7, v8, v9);
  v11 = v6 + v3 + *(int *)(v1 + 48);
  *(_QWORD *)(v6 + v3) = 2;
  *(_QWORD *)v11 = "schema_name";
  *(_QWORD *)(v11 + 8) = 11;
  *(_BYTE *)(v11 + 16) = 2;
  v10();
  v12 = (_QWORD *)(v6 + 2 * v3);
  v13 = (char *)v12 + *(int *)(v1 + 48);
  *v12 = 3;
  *(_QWORD *)v13 = "schema_fingerprint";
  *((_QWORD *)v13 + 1) = 18;
  v13[16] = 2;
  v10();
  v14 = (_QWORD *)(v6 + 3 * v3);
  v15 = (char *)v14 + *(int *)(v1 + 48);
  *v14 = 4;
  *(_QWORD *)v15 = "body";
  *((_QWORD *)v15 + 1) = 4;
  v15[16] = 2;
  v10();
  return sub_1B514BE40();
}

void sub_1B5137198()
{
  uint64_t v0;
  uint64_t v1;
  char v2;

  v1 = OUTLINED_FUNCTION_2_1();
  if (!v0)
  {
    while ((v2 & 1) == 0)
    {
      switch(v1)
      {
        case 1:
          OUTLINED_FUNCTION_3_1();
          sub_1B5137234();
          break;
        case 2:
          OUTLINED_FUNCTION_32();
          break;
        case 3:
        case 4:
          OUTLINED_FUNCTION_33();
          break;
        default:
          break;
      }
      v1 = OUTLINED_FUNCTION_20();
    }
  }
  OUTLINED_FUNCTION_17();
}

uint64_t sub_1B5137234()
{
  sub_1B513BE58();
  return sub_1B514BD50();
}

void sub_1B5137298()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v2 = v1;
  OUTLINED_FUNCTION_53();
  if (!*v0 || (sub_1B513BE58(), OUTLINED_FUNCTION_59(), (v2 = v1) == 0))
  {
    OUTLINED_FUNCTION_9_0();
    if (!v3 || (OUTLINED_FUNCTION_21(), !v2))
    {
      if ((OUTLINED_FUNCTION_26() & 1) != 0 || (OUTLINED_FUNCTION_34(), !v2))
      {
        if ((OUTLINED_FUNCTION_26() & 1) != 0 || (OUTLINED_FUNCTION_34(), !v2))
        {
          type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataPayloadMessage(0);
          OUTLINED_FUNCTION_28();
        }
      }
    }
  }
  OUTLINED_FUNCTION_42();
}

void sub_1B5137384()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;

  OUTLINED_FUNCTION_75();
  v2 = v1;
  v4 = v3;
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_18();
  MEMORY[0x1E0C80A78](v5);
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x1E0C80A78](v6);
  OUTLINED_FUNCTION_38();
  if (v9)
  {
    if (v8)
    {
      if (v8 == 1)
      {
        if (v7 != 1)
          goto LABEL_20;
      }
      else if (v7 != 2)
      {
        goto LABEL_20;
      }
    }
    else if (v7)
    {
      goto LABEL_20;
    }
  }
  else if (v7 != v8)
  {
    goto LABEL_20;
  }
  v9 = v4[2] == v2[2] && v4[3] == v2[3];
  if ((v9 || (OUTLINED_FUNCTION_35() & 1) != 0)
    && (MEMORY[0x1B5E47050](v4[4], v4[5], v2[4], v2[5]) & 1) != 0
    && (MEMORY[0x1B5E47050](v4[6], v4[7], v2[6], v2[7]) & 1) != 0)
  {
    v10 = OUTLINED_FUNCTION_61();
    OUTLINED_FUNCTION_10(*(int *)(v10 + 32));
    OUTLINED_FUNCTION_14(*(int *)(v10 + 32));
    sub_1B5139270(&qword_1EF0F6BB0, (uint64_t (*)(uint64_t))MEMORY[0x1E0D3E998], MEMORY[0x1E0D3E9A8]);
    OUTLINED_FUNCTION_8_0();
    OUTLINED_FUNCTION_13();
    OUTLINED_FUNCTION_30(v0);
  }
LABEL_20:
  OUTLINED_FUNCTION_66();
  OUTLINED_FUNCTION_7_0();
}

unint64_t sub_1B513749C()
{
  return 0xD000000000000030;
}

uint64_t (*sub_1B51374C0())(_QWORD, _QWORD)
{
  return nullsub_1;
}

void sub_1B51374D4()
{
  sub_1B5137198();
}

void sub_1B51374E8()
{
  sub_1B5137298();
}

uint64_t sub_1B51374FC()
{
  sub_1B5139270(&qword_1EF0F6D28, type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataPayloadMessage, (uint64_t)&unk_1B514E118);
  return sub_1B514BD14();
}

uint64_t sub_1B513754C(uint64_t a1, uint64_t a2)
{
  return sub_1B5135670(a1, a2, &qword_1EF0F6AA0, (uint64_t)qword_1EF0F6FF8);
}

uint64_t sub_1B5137568()
{
  sub_1B5139270(&qword_1EF0F6C78, type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataPayloadMessage, (uint64_t)&unk_1B514E150);
  return sub_1B514BDBC();
}

uint64_t sub_1B51375A8()
{
  return sub_1B5138FC0((void (*)(_QWORD))type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataPayloadMessage);
}

uint64_t sub_1B51375D4()
{
  sub_1B5139270(&qword_1EF0F6C78, type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataPayloadMessage, (uint64_t)&unk_1B514E150);
  return sub_1B514BDC8();
}

uint64_t sub_1B5137628()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(void);
  unint64_t v11;
  _QWORD *v12;
  char *v13;
  _QWORD *v14;
  char *v15;

  v0 = sub_1B514BE4C();
  __swift_allocate_value_buffer(v0, qword_1EF0F7010);
  __swift_project_value_buffer(v0, (uint64_t)qword_1EF0F7010);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF0F6CF8);
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF0F6D00);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(_QWORD *)(v2 + 72);
  v4 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_1B514D8D0;
  v6 = v5 + v4;
  v7 = v5 + v4 + *(int *)(v1 + 48);
  *(_QWORD *)(v5 + v4) = 1;
  *(_QWORD *)v7 = "index";
  *(_QWORD *)(v7 + 8) = 5;
  *(_BYTE *)(v7 + 16) = 2;
  v8 = *MEMORY[0x1E0D3EF08];
  v9 = sub_1B514BE34();
  v10 = *(void (**)(void))(*(_QWORD *)(v9 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v10)(v7, v8, v9);
  v11 = v6 + v3 + *(int *)(v1 + 48);
  *(_QWORD *)(v6 + v3) = 2;
  *(_QWORD *)v11 = "request_id";
  *(_QWORD *)(v11 + 8) = 10;
  *(_BYTE *)(v11 + 16) = 2;
  v10();
  v12 = (_QWORD *)(v6 + 2 * v3);
  v13 = (char *)v12 + *(int *)(v1 + 48);
  *v12 = 3;
  *(_QWORD *)v13 = "code";
  *((_QWORD *)v13 + 1) = 4;
  v13[16] = 2;
  v10();
  v14 = (_QWORD *)(v6 + 3 * v3);
  v15 = (char *)v14 + *(int *)(v1 + 48);
  *v14 = 4;
  *(_QWORD *)v15 = "message";
  *((_QWORD *)v15 + 1) = 7;
  v15[16] = 2;
  v10();
  return sub_1B514BE40();
}

void sub_1B51377E8()
{
  uint64_t v0;
  uint64_t v1;
  char v2;

  v1 = OUTLINED_FUNCTION_2_1();
  if (!v0)
  {
    while ((v2 & 1) == 0)
    {
      switch(v1)
      {
        case 1:
          sub_1B514BD68();
          break;
        case 2:
          OUTLINED_FUNCTION_33();
          break;
        case 3:
          OUTLINED_FUNCTION_3_1();
          sub_1B5137890();
          break;
        case 4:
          OUTLINED_FUNCTION_32();
          break;
        default:
          break;
      }
      v1 = OUTLINED_FUNCTION_20();
    }
  }
  OUTLINED_FUNCTION_27();
}

uint64_t sub_1B5137890()
{
  sub_1B513BE94();
  return sub_1B514BD50();
}

void sub_1B51378F0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v2 = v1;
  OUTLINED_FUNCTION_53();
  if (!*(_DWORD *)v0 || (OUTLINED_FUNCTION_50(), sub_1B514BDF8(), !v1))
  {
    if ((OUTLINED_FUNCTION_26() & 1) != 0 || (OUTLINED_FUNCTION_34(), !v1))
    {
      if (!*(_QWORD *)(v0 + 24) || (sub_1B513BE94(), OUTLINED_FUNCTION_59(), (v2 = v1) == 0))
      {
        OUTLINED_FUNCTION_9_0();
        if (!v3 || (OUTLINED_FUNCTION_21(), !v2))
        {
          type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataEventError(0);
          OUTLINED_FUNCTION_28();
        }
      }
    }
  }
  OUTLINED_FUNCTION_42();
}

void sub_1B51379D4()
{
  _DWORD *v0;
  _DWORD *v1;
  _DWORD *v2;
  _DWORD *v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_75();
  v1 = v0;
  v3 = v2;
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_18();
  MEMORY[0x1E0C80A78](v4);
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x1E0C80A78](v5);
  OUTLINED_FUNCTION_37();
  if (*v3 == *v1)
    OUTLINED_FUNCTION_65();
  OUTLINED_FUNCTION_66();
  OUTLINED_FUNCTION_7_0();
}

unint64_t sub_1B5137AC8()
{
  return 0xD00000000000002CLL;
}

uint64_t sub_1B5137AE4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(void);

  OUTLINED_FUNCTION_5_1();
  v0 = OUTLINED_FUNCTION_29();
  return OUTLINED_FUNCTION_6_1(v0, v1, v2, v3);
}

uint64_t sub_1B5137B0C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(void);

  OUTLINED_FUNCTION_5_1();
  v0 = OUTLINED_FUNCTION_58();
  return OUTLINED_FUNCTION_6_1(v0, v1, v2, v3);
}

void sub_1B5137B34()
{
  sub_1B51377E8();
}

void sub_1B5137B48()
{
  sub_1B51378F0();
}

uint64_t sub_1B5137B5C()
{
  sub_1B5139270(&qword_1EF0F6D38, type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataEventError, (uint64_t)&unk_1B514DFB0);
  return sub_1B514BD14();
}

uint64_t sub_1B5137BAC(uint64_t a1, uint64_t a2)
{
  return sub_1B5135670(a1, a2, &qword_1EF0F6AA8, (uint64_t)qword_1EF0F7010);
}

uint64_t sub_1B5137BC8()
{
  sub_1B5139270(&qword_1EF0F6C58, type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataEventError, (uint64_t)"yLu1 7");
  return sub_1B514BDBC();
}

uint64_t sub_1B5137C08()
{
  return sub_1B5138FC0((void (*)(_QWORD))type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataEventError);
}

uint64_t sub_1B5137C34()
{
  sub_1B5139270(&qword_1EF0F6C58, type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataEventError, (uint64_t)"yLu1 7");
  return sub_1B514BDC8();
}

uint64_t sub_1B5137C88()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(void);
  char *v11;

  v0 = sub_1B514BE4C();
  __swift_allocate_value_buffer(v0, qword_1EF0F7028);
  __swift_project_value_buffer(v0, (uint64_t)qword_1EF0F7028);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF0F6CF8);
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF0F6D00);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(_QWORD *)(v2 + 72);
  v4 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_1B514D820;
  v6 = (_QWORD *)(v5 + v4);
  v7 = v5 + v4 + *(int *)(v1 + 48);
  *v6 = 1;
  *(_QWORD *)v7 = "events";
  *(_QWORD *)(v7 + 8) = 6;
  *(_BYTE *)(v7 + 16) = 2;
  v8 = *MEMORY[0x1E0D3EF08];
  v9 = sub_1B514BE34();
  v10 = *(void (**)(void))(*(_QWORD *)(v9 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v10)(v7, v8, v9);
  v11 = (char *)v6 + v3 + *(int *)(v1 + 48);
  *(_QWORD *)((char *)v6 + v3) = 2;
  *(_QWORD *)v11 = "request_id";
  *((_QWORD *)v11 + 1) = 10;
  v11[16] = 2;
  v10();
  return sub_1B514BE40();
}

void sub_1B5137DE0()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = OUTLINED_FUNCTION_2_1();
  if (!v0)
  {
    while ((v2 & 1) == 0)
    {
      if (v1 == 2)
      {
        OUTLINED_FUNCTION_33();
      }
      else if (v1 == 1)
      {
        v3 = OUTLINED_FUNCTION_3_1();
        sub_1B5137E6C(v3, v4, v5, v6, (void (*)(_QWORD))type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataEventMessage);
      }
      v1 = OUTLINED_FUNCTION_20();
    }
  }
  OUTLINED_FUNCTION_17();
}

void sub_1B5137E6C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(_QWORD))
{
  unint64_t *v5;
  uint64_t (*v6)(uint64_t);
  uint64_t v7;

  a5(0);
  OUTLINED_FUNCTION_67();
  sub_1B5139270(v5, v6, v7);
  sub_1B514BD8C();
  OUTLINED_FUNCTION_41();
}

void sub_1B5137EE8()
{
  uint64_t v0;
  uint64_t v1;

  OUTLINED_FUNCTION_55();
  if (!*(_QWORD *)(*(_QWORD *)v0 + 16)
    || (type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataEventMessage(0),
        sub_1B5139270((unint64_t *)&qword_1EF0F6B88, type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataEventMessage, (uint64_t)"AHu1p2"), OUTLINED_FUNCTION_43(), !v1))
  {
    if ((OUTLINED_FUNCTION_26() & 1) != 0 || (OUTLINED_FUNCTION_57(), sub_1B514BDEC(), !v1))
    {
      type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_BatchPublishRequest(0);
      OUTLINED_FUNCTION_39();
    }
  }
  OUTLINED_FUNCTION_17();
}

void sub_1B5137F94()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_75();
  v1 = v0;
  v3 = v2;
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_18();
  MEMORY[0x1E0C80A78](v4);
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x1E0C80A78](v5);
  OUTLINED_FUNCTION_37();
  if ((sub_1B513A7F8(*v3, *v1) & 1) != 0)
    OUTLINED_FUNCTION_65();
  OUTLINED_FUNCTION_7_0();
}

unint64_t sub_1B5138060()
{
  return 0xD000000000000031;
}

uint64_t sub_1B513807C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;

  v4 = v2 + *(int *)(a1 + 24);
  v5 = sub_1B514BCFC();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, v4, v5);
}

uint64_t sub_1B51380BC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;

  v4 = v2 + *(int *)(a2 + 24);
  v5 = sub_1B514BCFC();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 40))(v4, a1, v5);
}

uint64_t (*sub_1B51380FC())(_QWORD, _QWORD)
{
  return nullsub_1;
}

void sub_1B5138110()
{
  sub_1B5137DE0();
}

void sub_1B5138124()
{
  sub_1B5137EE8();
}

uint64_t sub_1B5138138()
{
  sub_1B5139270(&qword_1EF0F6D48, type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_BatchPublishRequest, (uint64_t)&unk_1B514DE48);
  return sub_1B514BD14();
}

uint64_t sub_1B5138188(uint64_t a1, uint64_t a2)
{
  return sub_1B5135670(a1, a2, &qword_1EF0F6AB0, (uint64_t)qword_1EF0F7028);
}

uint64_t sub_1B51381A4()
{
  sub_1B5139270(&qword_1EF0F6C38, type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_BatchPublishRequest, (uint64_t)&unk_1B514DE80);
  return sub_1B514BDBC();
}

uint64_t sub_1B51381E4()
{
  return sub_1B5138FC0((void (*)(_QWORD))type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_BatchPublishRequest);
}

uint64_t sub_1B5138210()
{
  sub_1B5139270(&qword_1EF0F6C38, type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_BatchPublishRequest, (uint64_t)&unk_1B514DE80);
  return sub_1B514BDC8();
}

uint64_t sub_1B5138264()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(void);
  char *v11;
  _QWORD *v12;
  char *v13;

  v0 = sub_1B514BE4C();
  __swift_allocate_value_buffer(v0, qword_1EF0F7040);
  __swift_project_value_buffer(v0, (uint64_t)qword_1EF0F7040);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF0F6CF8);
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF0F6D00);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(_QWORD *)(v2 + 72);
  v4 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_1B514D810;
  v6 = (_QWORD *)(v5 + v4);
  v7 = v5 + v4 + *(int *)(v1 + 48);
  *v6 = 1;
  *(_QWORD *)v7 = "status";
  *(_QWORD *)(v7 + 8) = 6;
  *(_BYTE *)(v7 + 16) = 2;
  v8 = *MEMORY[0x1E0D3EF08];
  v9 = sub_1B514BE34();
  v10 = *(void (**)(void))(*(_QWORD *)(v9 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v10)(v7, v8, v9);
  v11 = (char *)v6 + v3 + *(int *)(v1 + 48);
  *(_QWORD *)((char *)v6 + v3) = 2;
  *(_QWORD *)v11 = "message";
  *((_QWORD *)v11 + 1) = 7;
  v11[16] = 2;
  v10();
  v12 = (_QWORD *)((char *)v6 + 2 * v3);
  v13 = (char *)v12 + *(int *)(v1 + 48);
  *v12 = 3;
  *(_QWORD *)v13 = "errors";
  *((_QWORD *)v13 + 1) = 6;
  v13[16] = 2;
  v10();
  return sub_1B514BE40();
}

uint64_t sub_1B51383F0(_QWORD *a1, uint64_t a2)
{
  uint64_t v3;

  if (*a1 != -1)
    swift_once();
  v3 = OUTLINED_FUNCTION_74();
  return __swift_project_value_buffer(v3, a2);
}

uint64_t sub_1B513842C()
{
  uint64_t v0;
  uint64_t result;
  char v2;

  result = OUTLINED_FUNCTION_2_1();
  if (!v0)
  {
    while ((v2 & 1) == 0)
    {
      switch(result)
      {
        case 3:
          OUTLINED_FUNCTION_3_1();
          sub_1B5138518();
          break;
        case 2:
          OUTLINED_FUNCTION_32();
          break;
        case 1:
          OUTLINED_FUNCTION_3_1();
          sub_1B51384B4();
          break;
      }
      result = OUTLINED_FUNCTION_20();
    }
  }
  return result;
}

uint64_t sub_1B51384B4()
{
  sub_1B513BEF0();
  return sub_1B514BD50();
}

uint64_t sub_1B5138518()
{
  type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataEventError(0);
  sub_1B5139270(&qword_1EF0F6C58, type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataEventError, (uint64_t)"yLu1 7");
  return sub_1B514BD8C();
}

uint64_t sub_1B5138598()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;

  OUTLINED_FUNCTION_55();
  if (!*v1 || (sub_1B513BEF0(), v2 = v0, result = sub_1B514BDE0(), !v0))
  {
    OUTLINED_FUNCTION_9_0();
    if (!v5 || (OUTLINED_FUNCTION_57(), result = sub_1B514BE10(), !v2))
    {
      if (!*(_QWORD *)(*(_QWORD *)(v3 + 32) + 16)
        || (type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataEventError(0),
            sub_1B5139270(&qword_1EF0F6C58, type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataEventError, (uint64_t)"yLu1 7"), result = OUTLINED_FUNCTION_43(), !v2))
      {
        type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_BatchPublishResponse(0);
        return OUTLINED_FUNCTION_39();
      }
    }
  }
  return result;
}

void sub_1B513869C()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;

  OUTLINED_FUNCTION_75();
  v2 = v1;
  v4 = v3;
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_18();
  MEMORY[0x1E0C80A78](v5);
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x1E0C80A78](v6);
  OUTLINED_FUNCTION_38();
  if (v9)
  {
    if (v8)
    {
      if (v8 == 1)
      {
        if (v7 != 1)
          goto LABEL_19;
      }
      else if (v7 != 2)
      {
        goto LABEL_19;
      }
    }
    else if (v7)
    {
      goto LABEL_19;
    }
  }
  else if (v7 != v8)
  {
    goto LABEL_19;
  }
  v9 = v4[2] == v2[2] && v4[3] == v2[3];
  if ((v9 || (OUTLINED_FUNCTION_35() & 1) != 0) && (sub_1B5139F40(v4[4], v2[4]) & 1) != 0)
  {
    v10 = type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_BatchPublishResponse(0);
    OUTLINED_FUNCTION_10(*(int *)(v10 + 28));
    OUTLINED_FUNCTION_14(*(int *)(v10 + 28));
    sub_1B5139270(&qword_1EF0F6BB0, (uint64_t (*)(uint64_t))MEMORY[0x1E0D3E998], MEMORY[0x1E0D3E9A8]);
    OUTLINED_FUNCTION_8_0();
    OUTLINED_FUNCTION_13();
    OUTLINED_FUNCTION_30(v0);
  }
LABEL_19:
  OUTLINED_FUNCTION_66();
  OUTLINED_FUNCTION_7_0();
}

unint64_t sub_1B51387A8()
{
  return 0xD000000000000032;
}

uint64_t sub_1B51387C4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;

  v4 = v2 + *(int *)(a1 + 28);
  v5 = sub_1B514BCFC();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, v4, v5);
}

uint64_t sub_1B5138804(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;

  v4 = v2 + *(int *)(a2 + 28);
  v5 = sub_1B514BCFC();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 40))(v4, a1, v5);
}

uint64_t (*sub_1B5138844())(_QWORD, _QWORD)
{
  return nullsub_1;
}

uint64_t sub_1B5138858()
{
  return sub_1B513842C();
}

uint64_t sub_1B513886C()
{
  return sub_1B5138598();
}

uint64_t sub_1B5138880()
{
  sub_1B5139270(&qword_1EF0F6D50, type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_BatchPublishResponse, (uint64_t)&unk_1B514DCE0);
  return sub_1B514BD14();
}

uint64_t sub_1B51388D0(uint64_t a1, uint64_t a2)
{
  return sub_1B5135670(a1, a2, &qword_1EF0F6AB8, (uint64_t)qword_1EF0F7040);
}

uint64_t sub_1B51388EC()
{
  sub_1B5139270(&qword_1EF0F6C18, type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_BatchPublishResponse, (uint64_t)"IOu1@:");
  return sub_1B514BDBC();
}

uint64_t sub_1B513892C()
{
  return sub_1B5138FC0((void (*)(_QWORD))type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_BatchPublishResponse);
}

uint64_t sub_1B5138958()
{
  sub_1B5139270(&qword_1EF0F6C18, type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_BatchPublishResponse, (uint64_t)"IOu1@:");
  return sub_1B514BDC8();
}

void Com_Apple_Ve_Common_Headers_IngestEnvironment.buildVariant.getter(_BYTE *a1@<X8>)
{
  uint64_t v1;
  int v3;

  v3 = *(unsigned __int8 *)(v1
                          + *(int *)(type metadata accessor for Com_Apple_Ve_Common_Headers_IngestEnvironment(0) + 20));
  if (v3 == 5)
    LOBYTE(v3) = 0;
  *a1 = v3;
  OUTLINED_FUNCTION_1_0();
}

uint64_t type metadata accessor for Com_Apple_Ve_Common_Headers_IngestEnvironment(uint64_t a1)
{
  return sub_1B5139D84(a1, (uint64_t *)&unk_1EF0F6C00);
}

void sub_1B51389F4(char *a1)
{
  char v1;

  v1 = *a1;
  Com_Apple_Ve_Common_Headers_IngestEnvironment.buildVariant.setter(&v1);
}

void Com_Apple_Ve_Common_Headers_IngestEnvironment.buildVariant.setter(char *a1)
{
  uint64_t v1;
  char v2;

  v2 = *a1;
  *(_BYTE *)(v1 + *(int *)(type metadata accessor for Com_Apple_Ve_Common_Headers_IngestEnvironment(0) + 20)) = v2;
  OUTLINED_FUNCTION_1_0();
}

uint64_t (*Com_Apple_Ve_Common_Headers_IngestEnvironment.buildVariant.modify(uint64_t a1))(uint64_t result)
{
  uint64_t v1;
  uint64_t v3;
  int v4;

  *(_QWORD *)a1 = v1;
  v3 = *(int *)(type metadata accessor for Com_Apple_Ve_Common_Headers_IngestEnvironment(0) + 20);
  v4 = *(unsigned __int8 *)(v1 + v3);
  if (v4 == 5)
    LOBYTE(v4) = 0;
  *(_BYTE *)(a1 + 12) = v4;
  *(_DWORD *)(a1 + 8) = v3;
  return sub_1B5138A9C;
}

uint64_t sub_1B5138A9C(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)result + *(int *)(result + 8)) = *(_BYTE *)(result + 12);
  return result;
}

BOOL Com_Apple_Ve_Common_Headers_IngestEnvironment.hasBuildVariant.getter()
{
  uint64_t v0;

  return *(_BYTE *)(v0 + *(int *)(type metadata accessor for Com_Apple_Ve_Common_Headers_IngestEnvironment(0) + 20)) != 5;
}

Swift::Void __swiftcall Com_Apple_Ve_Common_Headers_IngestEnvironment.clearBuildVariant()()
{
  uint64_t v0;

  *(_BYTE *)(v0 + *(int *)(type metadata accessor for Com_Apple_Ve_Common_Headers_IngestEnvironment(0) + 20)) = 5;
}

uint64_t Com_Apple_Ve_Common_Headers_IngestEnvironment.unknownFields.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(void);

  OUTLINED_FUNCTION_5_1();
  v0 = OUTLINED_FUNCTION_29();
  return OUTLINED_FUNCTION_6_1(v0, v1, v2, v3);
}

uint64_t Com_Apple_Ve_Common_Headers_IngestEnvironment.unknownFields.setter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(void);

  OUTLINED_FUNCTION_5_1();
  v0 = OUTLINED_FUNCTION_58();
  return OUTLINED_FUNCTION_6_1(v0, v1, v2, v3);
}

uint64_t (*Com_Apple_Ve_Common_Headers_IngestEnvironment.unknownFields.modify())(_QWORD, _QWORD)
{
  return nullsub_1;
}

void Com_Apple_Ve_Common_Headers_IngestEnvironment.init()(uint64_t a1@<X8>)
{
  sub_1B514BCF0();
  *(_BYTE *)(a1 + *(int *)(type metadata accessor for Com_Apple_Ve_Common_Headers_IngestEnvironment(0) + 20)) = 5;
  OUTLINED_FUNCTION_1_0();
}

unint64_t static Com_Apple_Ve_Common_Headers_IngestEnvironment.protoMessageName.getter()
{
  return 0xD00000000000002DLL;
}

uint64_t sub_1B5138B98()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v0 = sub_1B514BE4C();
  __swift_allocate_value_buffer(v0, qword_1EF0F6B98);
  __swift_project_value_buffer(v0, (uint64_t)qword_1EF0F6B98);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF0F6CF8);
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF0F6D00);
  v2 = *(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80);
  v3 = (v2 + 32) & ~v2;
  v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_1B514D800;
  v5 = v4 + v3 + *(int *)(v1 + 48);
  *(_QWORD *)(v4 + v3) = 1;
  *(_QWORD *)v5 = "buildVariant";
  *(_QWORD *)(v5 + 8) = 12;
  *(_BYTE *)(v5 + 16) = 2;
  v6 = *MEMORY[0x1E0D3EF08];
  v7 = sub_1B514BE34();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 104))(v5, v6, v7);
  return sub_1B514BE40();
}

uint64_t static Com_Apple_Ve_Common_Headers_IngestEnvironment._protobuf_nameMap.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_1EF0F6AC0 != -1)
    swift_once();
  v2 = OUTLINED_FUNCTION_74();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1EF0F6B98);
  return OUTLINED_FUNCTION_6_1(a1, v3, v2, *(uint64_t (**)(void))(*(_QWORD *)(v2 - 8) + 16));
}

uint64_t Com_Apple_Ve_Common_Headers_IngestEnvironment.decodeMessage<A>(decoder:)()
{
  uint64_t v0;
  uint64_t result;
  char v2;

  while (1)
  {
    result = sub_1B514BD38();
    if (v0 || (v2 & 1) != 0)
      break;
    if (result == 1)
    {
      OUTLINED_FUNCTION_3_1();
      sub_1B5138D68();
    }
  }
  return result;
}

uint64_t sub_1B5138D68()
{
  type metadata accessor for Com_Apple_Ve_Common_Headers_IngestEnvironment(0);
  sub_1B513BF68();
  return sub_1B514BD44();
}

uint64_t Com_Apple_Ve_Common_Headers_IngestEnvironment.traverse<A>(visitor:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t result;

  OUTLINED_FUNCTION_50();
  result = sub_1B5138E28(v1);
  if (!v0)
  {
    OUTLINED_FUNCTION_67();
    return sub_1B514BCE4();
  }
  return result;
}

uint64_t sub_1B5138E28(uint64_t a1)
{
  uint64_t result;

  result = type metadata accessor for Com_Apple_Ve_Common_Headers_IngestEnvironment(0);
  if (*(_BYTE *)(a1 + *(int *)(result + 20)) != 5)
  {
    sub_1B513BF68();
    return sub_1B514BDE0();
  }
  return result;
}

void static Com_Apple_Ve_Common_Headers_IngestEnvironment.== infix(_:_:)()
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
  int v10;
  int v11;
  void (*v12)(uint64_t, uint64_t, uint64_t);

  OUTLINED_FUNCTION_75();
  v3 = v2;
  v5 = v4;
  v6 = OUTLINED_FUNCTION_5_1();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x1E0C80A78](v8);
  OUTLINED_FUNCTION_37();
  v9 = *(int *)(type metadata accessor for Com_Apple_Ve_Common_Headers_IngestEnvironment(0) + 20);
  v10 = *(unsigned __int8 *)(v5 + v9);
  v11 = *(unsigned __int8 *)(v3 + v9);
  if (v10 == 5)
  {
    if (v11 == 5)
    {
LABEL_3:
      v12 = *(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16);
      v12(v1, v5, v6);
      v12(v0, v3, v6);
      sub_1B5139270(&qword_1EF0F6BB0, (uint64_t (*)(uint64_t))MEMORY[0x1E0D3E998], MEMORY[0x1E0D3E9A8]);
      OUTLINED_FUNCTION_8_0();
      OUTLINED_FUNCTION_63(v0);
      OUTLINED_FUNCTION_63(v1);
    }
  }
  else if (v11 != 5 && v10 == v11)
  {
    goto LABEL_3;
  }
  OUTLINED_FUNCTION_7_0();
}

uint64_t Com_Apple_Ve_Common_Headers_IngestEnvironment.hashValue.getter()
{
  return sub_1B5138FC0((void (*)(_QWORD))type metadata accessor for Com_Apple_Ve_Common_Headers_IngestEnvironment);
}

uint64_t sub_1B5138FC0(void (*a1)(_QWORD))
{
  unint64_t *v2;
  uint64_t (*v3)(uint64_t);
  uint64_t v4;

  OUTLINED_FUNCTION_76();
  a1(0);
  OUTLINED_FUNCTION_67();
  sub_1B5139270(v2, v3, v4);
  sub_1B514BEDC();
  return OUTLINED_FUNCTION_56();
}

unint64_t sub_1B5139030()
{
  static Com_Apple_Ve_Common_Headers_IngestEnvironment.protoMessageName.getter();
  return 0xD00000000000002DLL;
}

uint64_t (*sub_1B5139054())(_QWORD, _QWORD)
{
  return nullsub_1;
}

uint64_t sub_1B5139064()
{
  return Com_Apple_Ve_Common_Headers_IngestEnvironment.decodeMessage<A>(decoder:)();
}

uint64_t sub_1B5139078()
{
  return Com_Apple_Ve_Common_Headers_IngestEnvironment.traverse<A>(visitor:)();
}

uint64_t sub_1B513908C()
{
  sub_1B5139270(&qword_1EF0F6D68, type metadata accessor for Com_Apple_Ve_Common_Headers_IngestEnvironment, (uint64_t)&protocol conformance descriptor for Com_Apple_Ve_Common_Headers_IngestEnvironment);
  return sub_1B514BD14();
}

uint64_t sub_1B51390E0()
{
  sub_1B5139270(&qword_1EF0F6BC8, type metadata accessor for Com_Apple_Ve_Common_Headers_IngestEnvironment, (uint64_t)&protocol conformance descriptor for Com_Apple_Ve_Common_Headers_IngestEnvironment);
  return sub_1B514BDBC();
}

uint64_t sub_1B5139124()
{
  sub_1B5139270(&qword_1EF0F6BC8, type metadata accessor for Com_Apple_Ve_Common_Headers_IngestEnvironment, (uint64_t)&protocol conformance descriptor for Com_Apple_Ve_Common_Headers_IngestEnvironment);
  return sub_1B514BDC8();
}

void sub_1B5139174()
{
  sub_1B514C044();
  sub_1B514BEDC();
  OUTLINED_FUNCTION_56();
  OUTLINED_FUNCTION_73();
}

FeedbackLogger::Com_Apple_Ve_Common_BuildVariant __swiftcall Com_Apple_Ve_Common_BuildVariant.init()()
{
  _BYTE *v0;
  FeedbackLogger::Com_Apple_Ve_Common_BuildVariant result;

  *v0 = 0;
  return result;
}

FeedbackLogger::Com_Apple_Ve_Common_BuildVariant_optional __swiftcall Com_Apple_Ve_Common_BuildVariant.init(rawValue:)(Swift::Int rawValue)
{
  char *v1;
  char v2;

  v2 = 5;
  if ((unint64_t)rawValue < 5)
    v2 = rawValue;
  *v1 = v2;
  return (FeedbackLogger::Com_Apple_Ve_Common_BuildVariant_optional)rawValue;
}

uint64_t Com_Apple_Ve_Common_BuildVariant.rawValue.getter()
{
  unsigned __int8 *v0;

  return *v0;
}

BOOL sub_1B51391E4(char *a1, char *a2)
{
  return sub_1B5134B14(*a1, *a2);
}

uint64_t sub_1B51391F0()
{
  return sub_1B5134B64();
}

uint64_t sub_1B51391F8()
{
  sub_1B513BF68();
  return sub_1B514BD20();
}

uint64_t sub_1B5139230()
{
  return sub_1B5134BB8();
}

FeedbackLogger::Com_Apple_Ve_Common_BuildVariant_optional sub_1B5139244(Swift::Int *a1)
{
  return Com_Apple_Ve_Common_BuildVariant.init(rawValue:)(*a1);
}

uint64_t sub_1B513924C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = Com_Apple_Ve_Common_BuildVariant.rawValue.getter();
  *a1 = result;
  return result;
}

void sub_1B5139270(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t v5;

  if (!*a1)
  {
    v5 = a2(255);
    atomic_store(MEMORY[0x1B5E47AC4](a3, v5), a1);
  }
  OUTLINED_FUNCTION_1_0();
}

void *static Com_Apple_Ve_Common_BuildVariant.allCases.getter()
{
  return &unk_1E68A2690;
}

void sub_1B51392B8()
{
  sub_1B5139270(&qword_1EF0F6BC0, type metadata accessor for Com_Apple_Ve_Common_Headers_IngestEnvironment, (uint64_t)&protocol conformance descriptor for Com_Apple_Ve_Common_Headers_IngestEnvironment);
}

void sub_1B51392E4()
{
  sub_1B5139270(&qword_1EF0F6BC8, type metadata accessor for Com_Apple_Ve_Common_Headers_IngestEnvironment, (uint64_t)&protocol conformance descriptor for Com_Apple_Ve_Common_Headers_IngestEnvironment);
}

void sub_1B5139310()
{
  sub_1B5139270(&qword_1EF0F6BB8, type metadata accessor for Com_Apple_Ve_Common_Headers_IngestEnvironment, (uint64_t)&protocol conformance descriptor for Com_Apple_Ve_Common_Headers_IngestEnvironment);
}

void sub_1B513933C()
{
  sub_1B5139270(&qword_1EF0F6BD0, type metadata accessor for Com_Apple_Ve_Common_Headers_IngestEnvironment, (uint64_t)&protocol conformance descriptor for Com_Apple_Ve_Common_Headers_IngestEnvironment);
}

unint64_t sub_1B513936C()
{
  unint64_t result;

  result = qword_1EF0F6BD8;
  if (!qword_1EF0F6BD8)
  {
    result = MEMORY[0x1B5E47AC4](&protocol conformance descriptor for Com_Apple_Ve_Common_BuildVariant, &type metadata for Com_Apple_Ve_Common_BuildVariant);
    atomic_store(result, (unint64_t *)&qword_1EF0F6BD8);
  }
  return result;
}

unint64_t sub_1B51393AC()
{
  unint64_t result;

  result = qword_1EF0F6BE0;
  if (!qword_1EF0F6BE0)
  {
    result = MEMORY[0x1B5E47AC4](&protocol conformance descriptor for Com_Apple_Ve_Common_BuildVariant, &type metadata for Com_Apple_Ve_Common_BuildVariant);
    atomic_store(result, (unint64_t *)&qword_1EF0F6BE0);
  }
  return result;
}

unint64_t sub_1B51393EC()
{
  unint64_t result;

  result = qword_1EF0F6BE8;
  if (!qword_1EF0F6BE8)
  {
    result = MEMORY[0x1B5E47AC4]("QRu1\b;", &type metadata for Com_Apple_Ve_Common_BuildVariant);
    atomic_store(result, (unint64_t *)&qword_1EF0F6BE8);
  }
  return result;
}

void sub_1B5139428()
{
  sub_1B5139EA4(&qword_1EF0F6BF0, &qword_1EF0F6BF8);
}

void sub_1B513944C(_QWORD *a1@<X8>)
{
  *a1 = &unk_1E68A2690;
}

void sub_1B513945C(_BYTE *a1@<X8>)
{
  Com_Apple_Ve_Common_Headers_IngestEnvironment.buildVariant.getter(a1);
  OUTLINED_FUNCTION_1_0();
}

_QWORD *initializeBufferWithCopyOfBuffer for Com_Apple_Ve_Common_Headers_IngestEnvironment(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v8 = *a2;
    *a1 = *a2;
    a1 = (_QWORD *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_1B514BCFC();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    *((_BYTE *)a1 + *(int *)(a3 + 20)) = *((_BYTE *)a2 + *(int *)(a3 + 20));
  }
  return a1;
}

uint64_t destroy for Com_Apple_Ve_Common_Headers_IngestEnvironment(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_1B514BCFC();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
}

uint64_t initializeWithCopy for Com_Apple_Ve_Common_Headers_IngestEnvironment(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = sub_1B514BCFC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  *(_BYTE *)(a1 + *(int *)(a3 + 20)) = *(_BYTE *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t assignWithCopy for Com_Apple_Ve_Common_Headers_IngestEnvironment(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = sub_1B514BCFC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  *(_BYTE *)(a1 + *(int *)(a3 + 20)) = *(_BYTE *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t initializeWithTake for Com_Apple_Ve_Common_Headers_IngestEnvironment(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = sub_1B514BCFC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  *(_BYTE *)(a1 + *(int *)(a3 + 20)) = *(_BYTE *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t assignWithTake for Com_Apple_Ve_Common_Headers_IngestEnvironment(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = sub_1B514BCFC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  *(_BYTE *)(a1 + *(int *)(a3 + 20)) = *(_BYTE *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t getEnumTagSinglePayload for Com_Apple_Ve_Common_Headers_IngestEnvironment()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

void sub_1B51396B4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = OUTLINED_FUNCTION_5_1();
  if (*(_DWORD *)(*(_QWORD *)(v4 - 8) + 84) == (_DWORD)a2)
    OUTLINED_FUNCTION_1_1(a1, a2, v4);
  else
    OUTLINED_FUNCTION_15();
}

uint64_t __swift_getEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a3 - 8) + 48))();
}

uint64_t storeEnumTagSinglePayload for Com_Apple_Ve_Common_Headers_IngestEnvironment()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

void sub_1B5139738(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  char v8;

  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_64();
  if (v8)
  {
    OUTLINED_FUNCTION_0_1(a1, a2, a2, v7);
  }
  else
  {
    *(_BYTE *)(a1 + *(int *)(a4 + 20)) = a2 + 5;
    OUTLINED_FUNCTION_15();
  }
}

uint64_t sub_1B5139790()
{
  uint64_t result;
  unint64_t v1;

  result = sub_1B514BCFC();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for Com_Apple_Ve_Common_BuildVariant(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  int v5;
  unsigned int v6;
  BOOL v7;

  if (!a2)
  {
    v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFC)
  {
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
      if (!v4)
        goto LABEL_17;
    }
    else if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
    }
    else
    {
      v4 = a1[1];
      if (!a1[1])
        goto LABEL_17;
    }
    v5 = (*a1 | (v4 << 8)) - 5;
    return (v5 + 1);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 5;
  v5 = v6 - 5;
  if (!v7)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for Com_Apple_Ve_Common_BuildVariant(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1B51398E4 + 4 * byte_1B514D8F8[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_1B5139918 + 4 * byte_1B514D8F3[v4]))();
}

uint64_t sub_1B5139918(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1B5139920(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1B5139928);
  return result;
}

uint64_t sub_1B5139934(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1B513993CLL);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_1B5139940(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1B5139948(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1B5139954(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_1B513995C(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

void type metadata accessor for Com_Apple_Ve_Common_BuildVariant()
{
  OUTLINED_FUNCTION_54();
}

void sub_1B5139970()
{
  sub_1B5139270(&qword_1EF0F6C10, type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_BatchPublishResponse, (uint64_t)&unk_1B514DC28);
}

uint64_t type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_BatchPublishResponse(uint64_t a1)
{
  return sub_1B5139D84(a1, (uint64_t *)&unk_1EF0F6DD0);
}

void sub_1B51399B0()
{
  sub_1B5139270(&qword_1EF0F6C18, type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_BatchPublishResponse, (uint64_t)"IOu1@:");
}

void sub_1B51399DC()
{
  sub_1B5139270(&qword_1EF0F6C20, type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_BatchPublishResponse, (uint64_t)&unk_1B514DC50);
}

void sub_1B5139A08()
{
  sub_1B5139270(&qword_1EF0F6C28, type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_BatchPublishResponse, (uint64_t)&unk_1B514DC90);
}

void sub_1B5139A34()
{
  sub_1B5139270(&qword_1EF0F6C30, type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_BatchPublishRequest, (uint64_t)&unk_1B514DD90);
}

uint64_t type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_BatchPublishRequest(uint64_t a1)
{
  return sub_1B5139D84(a1, (uint64_t *)&unk_1EF0F6DC0);
}

void sub_1B5139A74()
{
  sub_1B5139270(&qword_1EF0F6C38, type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_BatchPublishRequest, (uint64_t)&unk_1B514DE80);
}

void sub_1B5139AA0()
{
  sub_1B5139270(&qword_1EF0F6C40, type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_BatchPublishRequest, (uint64_t)"IOu1x9");
}

void sub_1B5139ACC()
{
  sub_1B5139270(&qword_1EF0F6C48, type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_BatchPublishRequest, (uint64_t)&unk_1B514DDF8);
}

void sub_1B5139AF8()
{
  sub_1B5139270(&qword_1EF0F6C50, type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataEventError, (uint64_t)&unk_1B514DEF8);
}

uint64_t type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataEventError(uint64_t a1)
{
  return sub_1B5139D84(a1, (uint64_t *)&unk_1EF0F6DB0);
}

void sub_1B5139B38()
{
  sub_1B5139270(&qword_1EF0F6C58, type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataEventError, (uint64_t)"yLu1 7");
}

void sub_1B5139B64()
{
  sub_1B5139270(&qword_1EF0F6C60, type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataEventError, (uint64_t)&unk_1B514DF20);
}

void sub_1B5139B90()
{
  sub_1B5139270(&qword_1EF0F6C68, type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataEventError, (uint64_t)&unk_1B514DF60);
}

void sub_1B5139BBC()
{
  sub_1B5139270(&qword_1EF0F6C70, type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataPayloadMessage, (uint64_t)&unk_1B514E060);
}

uint64_t type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataPayloadMessage(uint64_t a1)
{
  return sub_1B5139D84(a1, (uint64_t *)&unk_1EF0F6DA0);
}

void sub_1B5139BFC()
{
  sub_1B5139270(&qword_1EF0F6C78, type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataPayloadMessage, (uint64_t)&unk_1B514E150);
}

void sub_1B5139C28()
{
  sub_1B5139270(&qword_1EF0F6C80, type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataPayloadMessage, (uint64_t)"yLu1X6");
}

void sub_1B5139C54()
{
  sub_1B5139270(&qword_1EF0F6C88, type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataPayloadMessage, (uint64_t)&unk_1B514E0C8);
}

void sub_1B5139C80()
{
  sub_1B5139270(&qword_1EF0F6C90, type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataEventMetadata, (uint64_t)&unk_1B514E1C8);
}

uint64_t type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataEventMetadata(uint64_t a1)
{
  return sub_1B5139D84(a1, (uint64_t *)&unk_1EF0F6D90);
}

void sub_1B5139CC0()
{
  sub_1B5139270(&qword_1EF0F6C98, type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataEventMetadata, (uint64_t)&unk_1B514E2B8);
}

void sub_1B5139CEC()
{
  sub_1B5139270(&qword_1EF0F6CA0, type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataEventMetadata, (uint64_t)&unk_1B514E1F0);
}

void sub_1B5139D18()
{
  sub_1B5139270(&qword_1EF0F6CA8, type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataEventMetadata, (uint64_t)&unk_1B514E230);
}

void sub_1B5139D44()
{
  sub_1B5139270(&qword_1EF0F6CB0, type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataEventMessage, (uint64_t)&unk_1B514E330);
}

uint64_t type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataEventMessage(uint64_t a1)
{
  return sub_1B5139D84(a1, (uint64_t *)&unk_1EF0F6D70);
}

uint64_t sub_1B5139D84(uint64_t a1, uint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata();
  return result;
}

void sub_1B5139DB4()
{
  sub_1B5139270((unint64_t *)&qword_1EF0F6B88, type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataEventMessage, (uint64_t)"AHu1p2");
}

void sub_1B5139DE0()
{
  sub_1B5139270(&qword_1EF0F6CB8, type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataEventMessage, (uint64_t)&unk_1B514E358);
}

void sub_1B5139E0C()
{
  sub_1B5139270(&qword_1EF0F6CC0, type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataEventMessage, (uint64_t)&unk_1B514E398);
}

void sub_1B5139E38()
{
  sub_1B5139EA4(&qword_1EF0F6CC8, &qword_1EF0F6CD0);
}

void sub_1B5139E5C()
{
  sub_1B5139EA4(&qword_1EF0F6CD8, &qword_1EF0F6CE0);
}

void sub_1B5139E80()
{
  sub_1B5139EA4(&qword_1EF0F6CE8, &qword_1EF0F6CF0);
}

void sub_1B5139EA4(unint64_t *a1, uint64_t *a2)
{
  uint64_t v3;

  if (!*a1)
  {
    v3 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    atomic_store(MEMORY[0x1B5E47AC4](MEMORY[0x1E0DEAF50], v3), a1);
  }
  OUTLINED_FUNCTION_1_0();
}

void sub_1B5139EE0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a3);
  OUTLINED_FUNCTION_40(v3);
  OUTLINED_FUNCTION_1_0();
}

void sub_1B5139F0C(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v5 = OUTLINED_FUNCTION_3_0(a1, a2, a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(v3, v4, v5);
  OUTLINED_FUNCTION_1_0();
}

uint64_t sub_1B5139F40(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  _DWORD *v6;
  uint64_t v7;
  uint64_t v8;
  _DWORD *v9;
  uint64_t v10;
  unint64_t v11;
  _QWORD v13[6];
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v14 = type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataEventError(0);
  v4 = MEMORY[0x1E0C80A78](v14);
  v6 = (_DWORD *)((char *)v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x1E0C80A78](v4);
  v9 = (_DWORD *)((char *)v13 - v8);
  v10 = *(_QWORD *)(a1 + 16);
  if (v10 != *(_QWORD *)(a2 + 16))
    return 0;
  if (v10 && a1 != a2)
  {
    v13[2] = 0;
    v13[3] = a2;
    v11 = (*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
    v13[4] = *(_QWORD *)(v7 + 72);
    v13[5] = a1;
    v15 = v10;
    sub_1B513BED0(a1 + v11, (uint64_t)v13 - v8, type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataEventError);
    sub_1B513BED0(a2 + v11, (uint64_t)v6, type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataEventError);
    if (*v9 == *v6)
      __asm { BR              X8 }
    sub_1B5134A80((uint64_t)v6, type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataEventError);
    sub_1B5134A80((uint64_t)v9, type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataEventError);
    return 0;
  }
  return 1;
}

uint64_t sub_1B513A7F8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  BOOL v17;
  uint64_t v19;

  v4 = type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataEventMessage(0);
  v5 = MEMORY[0x1E0C80A78](v4);
  v7 = (uint64_t *)((char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x1E0C80A78](v5);
  v10 = (uint64_t *)((char *)&v19 - v9);
  v11 = *(_QWORD *)(a1 + 16);
  if (v11 == *(_QWORD *)(a2 + 16))
  {
    if (!v11 || a1 == a2)
    {
      v15 = 1;
    }
    else
    {
      v12 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
      v13 = *(_QWORD *)(v8 + 72);
      v14 = v11 - 1;
      do
      {
        sub_1B513BED0(a1 + v12, (uint64_t)v10, type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataEventMessage);
        sub_1B513BED0(a2 + v12, (uint64_t)v7, type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataEventMessage);
        v15 = sub_1B5135FB0(v10, v7);
        sub_1B5134A80((uint64_t)v7, type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataEventMessage);
        sub_1B5134A80((uint64_t)v10, type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataEventMessage);
        v17 = v14-- != 0;
        if ((v15 & 1) == 0)
          break;
        v12 += v13;
      }
      while (v17);
    }
  }
  else
  {
    v15 = 0;
  }
  return v15 & 1;
}

uint64_t sub_1B513A934(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  BOOL v16;
  char v17;
  _QWORD v19[6];
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v20 = type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataPayloadMessage(0);
  v4 = MEMORY[0x1E0C80A78](v20);
  v6 = (char *)v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v4);
  v9 = (_QWORD *)((char *)v19 - v8);
  v10 = *(_QWORD *)(a1 + 16);
  if (v10 != *(_QWORD *)(a2 + 16))
    goto LABEL_22;
  if (v10 && a1 != a2)
  {
    v19[2] = 0;
    v19[3] = a2;
    v11 = (*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
    v19[4] = *(_QWORD *)(v7 + 72);
    v19[5] = a1;
    v12 = v10 - 1;
    sub_1B513BED0(a1 + v11, (uint64_t)v19 - v8, type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataPayloadMessage);
    sub_1B513BED0(a2 + v11, (uint64_t)v6, type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataPayloadMessage);
    v13 = *v9;
    v14 = *(_QWORD *)v6;
    v15 = v6[8];
    v21 = v12;
    if (v15 == 1)
    {
      if (v14)
      {
        if (v14 == 1)
        {
          if (v13 != 1)
            goto LABEL_21;
        }
        else if (v13 != 2)
        {
LABEL_21:
          sub_1B5134A80((uint64_t)v6, type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataPayloadMessage);
          sub_1B5134A80((uint64_t)v9, type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataPayloadMessage);
LABEL_22:
          v17 = 0;
          return v17 & 1;
        }
      }
      else if (v13)
      {
        goto LABEL_21;
      }
    }
    else if (v13 != v14)
    {
      goto LABEL_21;
    }
    v16 = v9[2] == *((_QWORD *)v6 + 2) && v9[3] == *((_QWORD *)v6 + 3);
    if (v16 || (sub_1B514C038() & 1) != 0)
      __asm { BR              X8 }
    goto LABEL_21;
  }
  v17 = 1;
  return v17 & 1;
}

uint64_t sub_1B513B750(uint64_t result, uint64_t a2)
{
  uint64_t v3;
  int64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  int64_t v11;
  unint64_t v12;
  int64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  char v21;
  char v22;
  _QWORD *v23;
  char v25;
  int64_t v26;

  if (result == a2)
    return 1;
  v3 = result;
  if (*(_QWORD *)(result + 16) != *(_QWORD *)(a2 + 16))
    return 0;
  v4 = 0;
  v5 = result + 64;
  v6 = 1 << *(_BYTE *)(result + 32);
  v7 = -1;
  if (v6 < 64)
    v7 = ~(-1 << v6);
  v8 = v7 & *(_QWORD *)(result + 64);
  v26 = (unint64_t)(v6 + 63) >> 6;
  while (1)
  {
    if (v8)
    {
      v9 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      v10 = v9 | (v4 << 6);
      goto LABEL_24;
    }
    v11 = v4 + 1;
    if (__OFADD__(v4, 1))
    {
      __break(1u);
      goto LABEL_36;
    }
    if (v11 >= v26)
      return 1;
    v12 = *(_QWORD *)(v5 + 8 * v11);
    ++v4;
    if (!v12)
    {
      v4 = v11 + 1;
      if (v11 + 1 >= v26)
        return 1;
      v12 = *(_QWORD *)(v5 + 8 * v4);
      if (!v12)
      {
        v4 = v11 + 2;
        if (v11 + 2 >= v26)
          return 1;
        v12 = *(_QWORD *)(v5 + 8 * v4);
        if (!v12)
        {
          v4 = v11 + 3;
          if (v11 + 3 >= v26)
            return 1;
          v12 = *(_QWORD *)(v5 + 8 * v4);
          if (!v12)
            break;
        }
      }
    }
LABEL_23:
    v8 = (v12 - 1) & v12;
    v10 = __clz(__rbit64(v12)) + (v4 << 6);
LABEL_24:
    v14 = (uint64_t *)(*(_QWORD *)(v3 + 48) + 16 * v10);
    v15 = *v14;
    v16 = v14[1];
    v17 = (uint64_t *)(*(_QWORD *)(v3 + 56) + 16 * v10);
    v19 = *v17;
    v18 = v17[1];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v20 = sub_1B513B968(v15, v16);
    v22 = v21;
    swift_bridgeObjectRelease();
    if ((v22 & 1) == 0)
    {
      swift_bridgeObjectRelease();
      return 0;
    }
    v23 = (_QWORD *)(*(_QWORD *)(a2 + 56) + 16 * v20);
    if (*v23 == v19 && v23[1] == v18)
    {
      result = swift_bridgeObjectRelease();
    }
    else
    {
      v25 = sub_1B514C038();
      result = swift_bridgeObjectRelease();
      if ((v25 & 1) == 0)
        return 0;
    }
  }
  v13 = v11 + 4;
  if (v13 >= v26)
    return 1;
  v12 = *(_QWORD *)(v5 + 8 * v13);
  if (v12)
  {
    v4 = v13;
    goto LABEL_23;
  }
  while (1)
  {
    v4 = v13 + 1;
    if (__OFADD__(v13, 1))
      break;
    if (v4 >= v26)
      return 1;
    v12 = *(_QWORD *)(v5 + 8 * v4);
    ++v13;
    if (v12)
      goto LABEL_23;
  }
LABEL_36:
  __break(1u);
  return result;
}

unint64_t sub_1B513B968(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_1B514C044();
  sub_1B514BF18();
  v4 = sub_1B514C050();
  return sub_1B513B9FC(a1, a2, v4);
}

unint64_t sub_1B513B9CC(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_1B514BFE4();
  return sub_1B513BADC(a1, v2);
}

unint64_t sub_1B513B9FC(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_1B514C038() & 1) == 0)
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
      while (!v14 && (sub_1B514C038() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_1B513BADC(uint64_t a1, uint64_t a2)
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
      sub_1B513BF2C(*(_QWORD *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      v7 = MEMORY[0x1B5E473B0](v9, a1);
      sub_1B5133E9C((uint64_t)v9);
      if ((v7 & 1) != 0)
        break;
      v4 = (v4 + 1) & v6;
    }
    while (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

void sub_1B513BBA0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  __asm { BR              X10 }
}

uint64_t sub_1B513BC00(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, __int16 a10, char __s2, char a12, char a13, char a14, char a15, char a16, char a17, char a18, char a19, char a20,char a21,char a22,char a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35)
{
  BOOL *v35;
  const void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t result;
  uint64_t v40;
  __int16 v41;
  char v42;
  char v43;
  char v44;
  char v45;

  v40 = v37;
  v41 = v38;
  v42 = BYTE2(v38);
  v43 = BYTE3(v38);
  v44 = BYTE4(v38);
  v45 = BYTE5(v38);
  if (!v36)
  {
    __break(1u);
    JUMPOUT(0x1B513BD84);
  }
  result = memcmp(v36, &v40, BYTE6(v38));
  *v35 = (_DWORD)result == 0;
  return result;
}

uint64_t sub_1B513BDBC(uint64_t a1, uint64_t a2, uint64_t a3, const void *a4)
{
  uint64_t result;
  char *v8;
  BOOL v9;
  int64_t v10;
  size_t v11;

  result = sub_1B514BC60();
  v8 = (char *)result;
  if (result)
  {
    result = sub_1B514BC78();
    if (__OFSUB__(a1, result))
    {
LABEL_12:
      __break(1u);
      goto LABEL_13;
    }
    v8 += a1 - result;
  }
  v9 = __OFSUB__(a2, a1);
  v10 = a2 - a1;
  if (v9)
  {
    __break(1u);
    goto LABEL_12;
  }
  result = sub_1B514BC6C();
  if (!a4)
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  if (!v8)
  {
LABEL_14:
    __break(1u);
    return result;
  }
  if (result >= v10)
    v11 = v10;
  else
    v11 = result;
  return memcmp(a4, v8, v11) == 0;
}

unint64_t sub_1B513BE58()
{
  unint64_t result;

  result = qword_1EF0F6D30;
  if (!qword_1EF0F6D30)
  {
    result = MEMORY[0x1B5E47AC4](&unk_1B514EA54, &unk_1E68A27A8);
    atomic_store(result, (unint64_t *)&qword_1EF0F6D30);
  }
  return result;
}

unint64_t sub_1B513BE94()
{
  unint64_t result;

  result = qword_1EF0F6D40;
  if (!qword_1EF0F6D40)
  {
    result = MEMORY[0x1B5E47AC4]("-Cu1L,", &unk_1E68A29A8);
    atomic_store(result, (unint64_t *)&qword_1EF0F6D40);
  }
  return result;
}

void sub_1B513BED0(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v3;

  v3 = OUTLINED_FUNCTION_3_0(a1, a2, a3);
  OUTLINED_FUNCTION_40(v3);
  OUTLINED_FUNCTION_1_0();
}

unint64_t sub_1B513BEF0()
{
  unint64_t result;

  result = qword_1EF0F6D58;
  if (!qword_1EF0F6D58)
  {
    result = MEMORY[0x1B5E47AC4](&unk_1B514E9C4, &unk_1E68A2888);
    atomic_store(result, (unint64_t *)&qword_1EF0F6D58);
  }
  return result;
}

uint64_t sub_1B513BF2C(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(MEMORY[0x1E0DEC198] - 8) + 16))(a2, a1);
  return a2;
}

unint64_t sub_1B513BF68()
{
  unint64_t result;

  result = qword_1EF0F6D60;
  if (!qword_1EF0F6D60)
  {
    result = MEMORY[0x1B5E47AC4]("iRu1P;", &type metadata for Com_Apple_Ve_Common_BuildVariant);
    atomic_store(result, (unint64_t *)&qword_1EF0F6D60);
  }
  return result;
}

uint64_t __swift_memcpy9_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2;

  v2 = *a2;
  *(_BYTE *)(result + 8) = *((_BYTE *)a2 + 8);
  *(_QWORD *)result = v2;
  return result;
}

uint64_t sub_1B513BFB8(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 9))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_1B513BFD8(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)result = 0;
    *(_BYTE *)(result + 8) = 0;
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
  *(_BYTE *)(result + 9) = v3;
  return result;
}

uint64_t sub_1B513C008(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 8))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_1B513C024(uint64_t result, int a2)
{
  char v2;

  if (a2)
  {
    *(_QWORD *)result = (a2 - 1);
    v2 = 1;
  }
  else
  {
    v2 = 0;
  }
  *(_BYTE *)(result + 8) = v2;
  return result;
}

void type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_PayloadType()
{
  OUTLINED_FUNCTION_54();
}

void type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataEventErrorCode()
{
  OUTLINED_FUNCTION_54();
}

void type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_PublishStatus()
{
  OUTLINED_FUNCTION_54();
}

uint64_t *sub_1B513C068(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v3;
  uint64_t v4;
  uint64_t *v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  void (*v12)(char *, char *, uint64_t);
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  _QWORD *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  char *v36;

  v3 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  v4 = *a2;
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    v7 = (uint64_t *)(v4 + ((v3 + 16) & ~(unint64_t)v3));
    swift_retain();
  }
  else
  {
    v7 = a1;
    v8 = a3[5];
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    v11 = sub_1B514BCFC();
    v12 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    v12(v9, v10, v11);
    v13 = a3[6];
    v14 = (uint64_t *)((char *)v7 + v13);
    v15 = (uint64_t *)((char *)a2 + v13);
    v16 = type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataPayloadMessage(0);
    if (__swift_getEnumTagSinglePayload((uint64_t)v15, 1, v16))
    {
      v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF0F6B78);
      memcpy(v14, v15, *(_QWORD *)(*(_QWORD *)(v17 - 8) + 64));
    }
    else
    {
      *v14 = *v15;
      *((_BYTE *)v14 + 8) = *((_BYTE *)v15 + 8);
      v18 = v15[3];
      v14[2] = v15[2];
      v14[3] = v18;
      v19 = v15[4];
      v20 = v15[5];
      swift_bridgeObjectRetain();
      sub_1B5132FE4(v19, v20);
      v14[4] = v19;
      v14[5] = v20;
      v21 = v15[6];
      v22 = v15[7];
      sub_1B5132FE4(v21, v22);
      v14[6] = v21;
      v14[7] = v22;
      v12((char *)v14 + *(int *)(v16 + 32), (char *)v15 + *(int *)(v16 + 32), v11);
      __swift_storeEnumTagSinglePayload((uint64_t)v14, 0, 1, v16);
    }
    v23 = a3[7];
    v24 = (uint64_t *)((char *)v7 + v23);
    v25 = (uint64_t *)((char *)a2 + v23);
    v26 = type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataEventMetadata(0);
    if (__swift_getEnumTagSinglePayload((uint64_t)v25, 1, v26))
    {
      v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF0F6B80);
      memcpy(v24, v25, *(_QWORD *)(*(_QWORD *)(v27 - 8) + 64));
    }
    else
    {
      v28 = v25[1];
      *v24 = *v25;
      v24[1] = v28;
      v29 = v25[3];
      v24[2] = v25[2];
      v30 = v25[4];
      swift_bridgeObjectRetain();
      sub_1B5132FE4(v29, v30);
      v24[3] = v29;
      v24[4] = v30;
      v31 = v25[6];
      v24[5] = v25[5];
      v24[6] = v31;
      v32 = v25[8];
      v24[7] = v25[7];
      v24[8] = v32;
      v33 = v25[10];
      v24[9] = v25[9];
      v24[10] = v33;
      v24[11] = v25[11];
      v34 = *(int *)(v26 + 44);
      v35 = (char *)v24 + v34;
      v36 = (char *)v25 + v34;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v12(v35, v36, v11);
      __swift_storeEnumTagSinglePayload((uint64_t)v24, 0, 1, v26);
    }
  }
  return v7;
}

uint64_t sub_1B513C2B8(uint64_t a1, int *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  void (*v11)(uint64_t, uint64_t);

  swift_bridgeObjectRelease();
  v4 = a1 + a2[5];
  v5 = sub_1B514BCFC();
  v11 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8);
  v11(v4, v5);
  v6 = a1 + a2[6];
  v7 = type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataPayloadMessage(0);
  if (!__swift_getEnumTagSinglePayload(v6, 1, v7))
  {
    swift_bridgeObjectRelease();
    sub_1B513303C(*(_QWORD *)(v6 + 32), *(_QWORD *)(v6 + 40));
    sub_1B513303C(*(_QWORD *)(v6 + 48), *(_QWORD *)(v6 + 56));
    v11(v6 + *(int *)(v7 + 32), v5);
  }
  v8 = a1 + a2[7];
  v9 = type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataEventMetadata(0);
  result = __swift_getEnumTagSinglePayload(v8, 1, v9);
  if (!(_DWORD)result)
  {
    swift_bridgeObjectRelease();
    sub_1B513303C(*(_QWORD *)(v8 + 24), *(_QWORD *)(v8 + 32));
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return ((uint64_t (*)(uint64_t, uint64_t))v11)(v8 + *(int *)(v9 + 44), v5);
  }
  return result;
}

_QWORD *sub_1B513C3F8(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  void (*v10)(char *, char *, uint64_t);
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  char *v34;

  *a1 = *a2;
  v6 = a3[5];
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_1B514BCFC();
  v10 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 16);
  swift_bridgeObjectRetain();
  v10(v7, v8, v9);
  v11 = a3[6];
  v12 = (_QWORD *)((char *)a1 + v11);
  v13 = (_QWORD *)((char *)a2 + v11);
  v14 = type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataPayloadMessage(0);
  if (__swift_getEnumTagSinglePayload((uint64_t)v13, 1, v14))
  {
    v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF0F6B78);
    memcpy(v12, v13, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
  }
  else
  {
    *v12 = *v13;
    *((_BYTE *)v12 + 8) = *((_BYTE *)v13 + 8);
    v16 = v13[3];
    v12[2] = v13[2];
    v12[3] = v16;
    v17 = v13[4];
    v18 = v13[5];
    swift_bridgeObjectRetain();
    sub_1B5132FE4(v17, v18);
    v12[4] = v17;
    v12[5] = v18;
    v19 = v13[6];
    v20 = v13[7];
    sub_1B5132FE4(v19, v20);
    v12[6] = v19;
    v12[7] = v20;
    v10((char *)v12 + *(int *)(v14 + 32), (char *)v13 + *(int *)(v14 + 32), v9);
    __swift_storeEnumTagSinglePayload((uint64_t)v12, 0, 1, v14);
  }
  v21 = a3[7];
  v22 = (_QWORD *)((char *)a1 + v21);
  v23 = (_QWORD *)((char *)a2 + v21);
  v24 = type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataEventMetadata(0);
  if (__swift_getEnumTagSinglePayload((uint64_t)v23, 1, v24))
  {
    v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF0F6B80);
    memcpy(v22, v23, *(_QWORD *)(*(_QWORD *)(v25 - 8) + 64));
  }
  else
  {
    v26 = v23[1];
    *v22 = *v23;
    v22[1] = v26;
    v27 = v23[3];
    v22[2] = v23[2];
    v28 = v23[4];
    swift_bridgeObjectRetain();
    sub_1B5132FE4(v27, v28);
    v22[3] = v27;
    v22[4] = v28;
    v29 = v23[6];
    v22[5] = v23[5];
    v22[6] = v29;
    v30 = v23[8];
    v22[7] = v23[7];
    v22[8] = v30;
    v31 = v23[10];
    v22[9] = v23[9];
    v22[10] = v31;
    v22[11] = v23[11];
    v32 = *(int *)(v24 + 44);
    v33 = (char *)v22 + v32;
    v34 = (char *)v23 + v32;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v10(v33, v34, v9);
    __swift_storeEnumTagSinglePayload((uint64_t)v22, 0, 1, v24);
  }
  return a1;
}

_QWORD *sub_1B513C620(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(char *, char *, uint64_t);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int EnumTagSinglePayload;
  int v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(char *, char *, uint64_t);
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  char *v28;
  uint64_t v29;
  int v30;
  int v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  char *v35;
  char *v36;
  void (*v37)(char *, char *, uint64_t);
  uint64_t v38;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  unint64_t v48;
  uint64_t v49;
  unint64_t v50;
  uint64_t v51;
  unint64_t v52;
  uint64_t v53;
  void (*v54)(char *, char *, uint64_t);

  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = a3[5];
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_1B514BCFC();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(void (**)(char *, char *, uint64_t))(v10 + 24);
  v11(v7, v8, v9);
  v12 = a3[6];
  v13 = (uint64_t)a1 + v12;
  v14 = (uint64_t)a2 + v12;
  v15 = type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataPayloadMessage(0);
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v13, 1, v15);
  v17 = __swift_getEnumTagSinglePayload(v14, 1, v15);
  if (EnumTagSinglePayload)
  {
    if (!v17)
    {
      v18 = *(_QWORD *)v14;
      *(_BYTE *)(v13 + 8) = *(_BYTE *)(v14 + 8);
      *(_QWORD *)v13 = v18;
      *(_QWORD *)(v13 + 16) = *(_QWORD *)(v14 + 16);
      *(_QWORD *)(v13 + 24) = *(_QWORD *)(v14 + 24);
      v53 = v9;
      v19 = v10;
      v20 = v11;
      v21 = *(_QWORD *)(v14 + 32);
      v22 = *(_QWORD *)(v14 + 40);
      swift_bridgeObjectRetain();
      sub_1B5132FE4(v21, v22);
      *(_QWORD *)(v13 + 32) = v21;
      *(_QWORD *)(v13 + 40) = v22;
      v23 = *(_QWORD *)(v14 + 48);
      v24 = *(_QWORD *)(v14 + 56);
      sub_1B5132FE4(v23, v24);
      *(_QWORD *)(v13 + 48) = v23;
      *(_QWORD *)(v13 + 56) = v24;
      v11 = v20;
      v10 = v19;
      v9 = v53;
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 16))(v13 + *(int *)(v15 + 32), v14 + *(int *)(v15 + 32), v53);
      __swift_storeEnumTagSinglePayload(v13, 0, 1, v15);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v17)
  {
    sub_1B5134A80(v13, type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataPayloadMessage);
LABEL_6:
    v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF0F6B78);
    memcpy((void *)v13, (const void *)v14, *(_QWORD *)(*(_QWORD *)(v25 - 8) + 64));
    goto LABEL_7;
  }
  v40 = *(_QWORD *)v14;
  *(_BYTE *)(v13 + 8) = *(_BYTE *)(v14 + 8);
  *(_QWORD *)v13 = v40;
  *(_QWORD *)(v13 + 16) = *(_QWORD *)(v14 + 16);
  *(_QWORD *)(v13 + 24) = *(_QWORD *)(v14 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v54 = v11;
  v41 = *(_QWORD *)(v14 + 32);
  v42 = *(_QWORD *)(v14 + 40);
  sub_1B5132FE4(v41, v42);
  v43 = *(_QWORD *)(v13 + 32);
  v44 = *(_QWORD *)(v13 + 40);
  *(_QWORD *)(v13 + 32) = v41;
  *(_QWORD *)(v13 + 40) = v42;
  sub_1B513303C(v43, v44);
  v45 = *(_QWORD *)(v14 + 48);
  v46 = *(_QWORD *)(v14 + 56);
  sub_1B5132FE4(v45, v46);
  v47 = *(_QWORD *)(v13 + 48);
  v48 = *(_QWORD *)(v13 + 56);
  *(_QWORD *)(v13 + 48) = v45;
  *(_QWORD *)(v13 + 56) = v46;
  v11 = v54;
  sub_1B513303C(v47, v48);
  v54((char *)(v13 + *(int *)(v15 + 32)), (char *)(v14 + *(int *)(v15 + 32)), v9);
LABEL_7:
  v26 = a3[7];
  v27 = (char *)a1 + v26;
  v28 = (char *)a2 + v26;
  v29 = type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataEventMetadata(0);
  v30 = __swift_getEnumTagSinglePayload((uint64_t)v27, 1, v29);
  v31 = __swift_getEnumTagSinglePayload((uint64_t)v28, 1, v29);
  if (!v30)
  {
    if (!v31)
    {
      *(_QWORD *)v27 = *(_QWORD *)v28;
      *((_QWORD *)v27 + 1) = *((_QWORD *)v28 + 1);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *((_QWORD *)v27 + 2) = *((_QWORD *)v28 + 2);
      v49 = *((_QWORD *)v28 + 3);
      v50 = *((_QWORD *)v28 + 4);
      sub_1B5132FE4(v49, v50);
      v51 = *((_QWORD *)v27 + 3);
      v52 = *((_QWORD *)v27 + 4);
      *((_QWORD *)v27 + 3) = v49;
      *((_QWORD *)v27 + 4) = v50;
      sub_1B513303C(v51, v52);
      *((_QWORD *)v27 + 5) = *((_QWORD *)v28 + 5);
      *((_QWORD *)v27 + 6) = *((_QWORD *)v28 + 6);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *((_QWORD *)v27 + 7) = *((_QWORD *)v28 + 7);
      *((_QWORD *)v27 + 8) = *((_QWORD *)v28 + 8);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *((_QWORD *)v27 + 9) = *((_QWORD *)v28 + 9);
      *((_QWORD *)v27 + 10) = *((_QWORD *)v28 + 10);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *((_QWORD *)v27 + 11) = *((_QWORD *)v28 + 11);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      v11(&v27[*(int *)(v29 + 44)], &v28[*(int *)(v29 + 44)], v9);
      return a1;
    }
    sub_1B5134A80((uint64_t)v27, type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataEventMetadata);
    goto LABEL_12;
  }
  if (v31)
  {
LABEL_12:
    v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF0F6B80);
    memcpy(v27, v28, *(_QWORD *)(*(_QWORD *)(v38 - 8) + 64));
    return a1;
  }
  *(_QWORD *)v27 = *(_QWORD *)v28;
  *((_QWORD *)v27 + 1) = *((_QWORD *)v28 + 1);
  *((_QWORD *)v27 + 2) = *((_QWORD *)v28 + 2);
  v32 = *((_QWORD *)v28 + 3);
  v33 = *((_QWORD *)v28 + 4);
  swift_bridgeObjectRetain();
  sub_1B5132FE4(v32, v33);
  *((_QWORD *)v27 + 3) = v32;
  *((_QWORD *)v27 + 4) = v33;
  *((_QWORD *)v27 + 5) = *((_QWORD *)v28 + 5);
  *((_QWORD *)v27 + 6) = *((_QWORD *)v28 + 6);
  *((_QWORD *)v27 + 7) = *((_QWORD *)v28 + 7);
  *((_QWORD *)v27 + 8) = *((_QWORD *)v28 + 8);
  *((_QWORD *)v27 + 9) = *((_QWORD *)v28 + 9);
  *((_QWORD *)v27 + 10) = *((_QWORD *)v28 + 10);
  *((_QWORD *)v27 + 11) = *((_QWORD *)v28 + 11);
  v34 = *(int *)(v29 + 44);
  v35 = &v27[v34];
  v36 = &v28[v34];
  v37 = *(void (**)(char *, char *, uint64_t))(v10 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v37(v35, v36, v9);
  __swift_storeEnumTagSinglePayload((uint64_t)v27, 0, 1, v29);
  return a1;
}

_QWORD *sub_1B513CA54(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  void (*v10)(char *, char *, uint64_t);
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  uint64_t v17;
  _OWORD *v18;
  _OWORD *v19;
  uint64_t v20;
  uint64_t v21;

  *a1 = *a2;
  v6 = a3[5];
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_1B514BCFC();
  v10 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 32);
  v10(v7, v8, v9);
  v11 = a3[6];
  v12 = (_QWORD *)((char *)a1 + v11);
  v13 = (_QWORD *)((char *)a2 + v11);
  v14 = type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataPayloadMessage(0);
  if (__swift_getEnumTagSinglePayload((uint64_t)v13, 1, v14))
  {
    v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF0F6B78);
    memcpy(v12, v13, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
  }
  else
  {
    *v12 = *v13;
    *((_BYTE *)v12 + 8) = *((_BYTE *)v13 + 8);
    v16 = *((_OWORD *)v13 + 2);
    *((_OWORD *)v12 + 1) = *((_OWORD *)v13 + 1);
    *((_OWORD *)v12 + 2) = v16;
    *((_OWORD *)v12 + 3) = *((_OWORD *)v13 + 3);
    v10((char *)v12 + *(int *)(v14 + 32), (char *)v13 + *(int *)(v14 + 32), v9);
    __swift_storeEnumTagSinglePayload((uint64_t)v12, 0, 1, v14);
  }
  v17 = a3[7];
  v18 = (_OWORD *)((char *)a1 + v17);
  v19 = (_OWORD *)((char *)a2 + v17);
  v20 = type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataEventMetadata(0);
  if (__swift_getEnumTagSinglePayload((uint64_t)v19, 1, v20))
  {
    v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF0F6B80);
    memcpy(v18, v19, *(_QWORD *)(*(_QWORD *)(v21 - 8) + 64));
  }
  else
  {
    *v18 = *v19;
    *((_QWORD *)v18 + 2) = *((_QWORD *)v19 + 2);
    *(_OWORD *)((char *)v18 + 24) = *(_OWORD *)((char *)v19 + 24);
    *(_OWORD *)((char *)v18 + 40) = *(_OWORD *)((char *)v19 + 40);
    *(_OWORD *)((char *)v18 + 56) = *(_OWORD *)((char *)v19 + 56);
    *(_OWORD *)((char *)v18 + 72) = *(_OWORD *)((char *)v19 + 72);
    *((_QWORD *)v18 + 11) = *((_QWORD *)v19 + 11);
    v10((char *)v18 + *(int *)(v20 + 44), (char *)v19 + *(int *)(v20 + 44), v9);
    __swift_storeEnumTagSinglePayload((uint64_t)v18, 0, 1, v20);
  }
  return a1;
}

_QWORD *sub_1B513CC14(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(char *, char *, uint64_t);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int EnumTagSinglePayload;
  int v17;
  __int128 v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  int v25;
  uint64_t v26;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;

  *a1 = *a2;
  swift_bridgeObjectRelease();
  v6 = a3[5];
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_1B514BCFC();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(void (**)(char *, char *, uint64_t))(v10 + 40);
  v11(v7, v8, v9);
  v12 = a3[6];
  v13 = (uint64_t)a1 + v12;
  v14 = (uint64_t)a2 + v12;
  v15 = type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataPayloadMessage(0);
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v13, 1, v15);
  v17 = __swift_getEnumTagSinglePayload(v14, 1, v15);
  if (EnumTagSinglePayload)
  {
    if (!v17)
    {
      *(_QWORD *)v13 = *(_QWORD *)v14;
      *(_BYTE *)(v13 + 8) = *(_BYTE *)(v14 + 8);
      v18 = *(_OWORD *)(v14 + 32);
      *(_OWORD *)(v13 + 16) = *(_OWORD *)(v14 + 16);
      *(_OWORD *)(v13 + 32) = v18;
      *(_OWORD *)(v13 + 48) = *(_OWORD *)(v14 + 48);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 32))(v13 + *(int *)(v15 + 32), v14 + *(int *)(v15 + 32), v9);
      __swift_storeEnumTagSinglePayload(v13, 0, 1, v15);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v17)
  {
    sub_1B5134A80(v13, type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataPayloadMessage);
LABEL_6:
    v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF0F6B78);
    memcpy((void *)v13, (const void *)v14, *(_QWORD *)(*(_QWORD *)(v19 - 8) + 64));
    goto LABEL_7;
  }
  *(_QWORD *)v13 = *(_QWORD *)v14;
  *(_BYTE *)(v13 + 8) = *(_BYTE *)(v14 + 8);
  v28 = *(_QWORD *)(v14 + 24);
  *(_QWORD *)(v13 + 16) = *(_QWORD *)(v14 + 16);
  *(_QWORD *)(v13 + 24) = v28;
  swift_bridgeObjectRelease();
  v29 = *(_QWORD *)(v13 + 32);
  v30 = *(_QWORD *)(v13 + 40);
  *(_OWORD *)(v13 + 32) = *(_OWORD *)(v14 + 32);
  sub_1B513303C(v29, v30);
  v31 = *(_QWORD *)(v13 + 48);
  v32 = *(_QWORD *)(v13 + 56);
  *(_OWORD *)(v13 + 48) = *(_OWORD *)(v14 + 48);
  sub_1B513303C(v31, v32);
  v11((char *)(v13 + *(int *)(v15 + 32)), (char *)(v14 + *(int *)(v15 + 32)), v9);
LABEL_7:
  v20 = a3[7];
  v21 = (uint64_t)a1 + v20;
  v22 = (uint64_t)a2 + v20;
  v23 = type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataEventMetadata(0);
  v24 = __swift_getEnumTagSinglePayload(v21, 1, v23);
  v25 = __swift_getEnumTagSinglePayload(v22, 1, v23);
  if (!v24)
  {
    if (!v25)
    {
      v33 = *(_QWORD *)(v22 + 8);
      *(_QWORD *)v21 = *(_QWORD *)v22;
      *(_QWORD *)(v21 + 8) = v33;
      swift_bridgeObjectRelease();
      v34 = *(_QWORD *)(v22 + 32);
      v35 = *(_QWORD *)(v21 + 24);
      v36 = *(_QWORD *)(v21 + 32);
      *(_OWORD *)(v21 + 16) = *(_OWORD *)(v22 + 16);
      *(_QWORD *)(v21 + 32) = v34;
      sub_1B513303C(v35, v36);
      v37 = *(_QWORD *)(v22 + 48);
      *(_QWORD *)(v21 + 40) = *(_QWORD *)(v22 + 40);
      *(_QWORD *)(v21 + 48) = v37;
      swift_bridgeObjectRelease();
      v38 = *(_QWORD *)(v22 + 64);
      *(_QWORD *)(v21 + 56) = *(_QWORD *)(v22 + 56);
      *(_QWORD *)(v21 + 64) = v38;
      swift_bridgeObjectRelease();
      v39 = *(_QWORD *)(v22 + 80);
      *(_QWORD *)(v21 + 72) = *(_QWORD *)(v22 + 72);
      *(_QWORD *)(v21 + 80) = v39;
      swift_bridgeObjectRelease();
      *(_QWORD *)(v21 + 88) = *(_QWORD *)(v22 + 88);
      swift_bridgeObjectRelease();
      v11((char *)(v21 + *(int *)(v23 + 44)), (char *)(v22 + *(int *)(v23 + 44)), v9);
      return a1;
    }
    sub_1B5134A80(v21, type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataEventMetadata);
    goto LABEL_12;
  }
  if (v25)
  {
LABEL_12:
    v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF0F6B80);
    memcpy((void *)v21, (const void *)v22, *(_QWORD *)(*(_QWORD *)(v26 - 8) + 64));
    return a1;
  }
  *(_OWORD *)v21 = *(_OWORD *)v22;
  *(_QWORD *)(v21 + 16) = *(_QWORD *)(v22 + 16);
  *(_OWORD *)(v21 + 24) = *(_OWORD *)(v22 + 24);
  *(_OWORD *)(v21 + 40) = *(_OWORD *)(v22 + 40);
  *(_OWORD *)(v21 + 56) = *(_OWORD *)(v22 + 56);
  *(_OWORD *)(v21 + 72) = *(_OWORD *)(v22 + 72);
  *(_QWORD *)(v21 + 88) = *(_QWORD *)(v22 + 88);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 32))(v21 + *(int *)(v23 + 44), v22 + *(int *)(v23 + 44), v9);
  __swift_storeEnumTagSinglePayload(v21, 0, 1, v23);
  return a1;
}

uint64_t sub_1B513CF1C()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

void sub_1B513CF28()
{
  unint64_t *v0;
  int v1;
  int *v2;
  char v3;
  int *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  OUTLINED_FUNCTION_23();
  if (v3)
  {
    OUTLINED_FUNCTION_12(*v0);
    OUTLINED_FUNCTION_15();
  }
  else
  {
    v4 = v2;
    v5 = v1;
    if (*(_DWORD *)(*(_QWORD *)(OUTLINED_FUNCTION_5_1() - 8) + 84) == v1)
    {
      v6 = v4[5];
    }
    else if (*(_DWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EF0F6B78) - 8) + 84) == v5)
    {
      v6 = v4[6];
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EF0F6B80);
      v6 = v4[7];
    }
    v7 = OUTLINED_FUNCTION_49(v6);
    OUTLINED_FUNCTION_1_1(v7, v8, v9);
  }
}

uint64_t sub_1B513CFC0()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

void sub_1B513CFCC()
{
  int v0;
  _QWORD *v1;
  int *v2;
  int *v3;
  char v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  OUTLINED_FUNCTION_11();
  if (v4)
  {
    *v1 = (v0 - 1);
    OUTLINED_FUNCTION_15();
  }
  else
  {
    v3 = v2;
    OUTLINED_FUNCTION_5_1();
    OUTLINED_FUNCTION_64();
    if (v4)
    {
      v5 = v3[5];
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EF0F6B78);
      OUTLINED_FUNCTION_64();
      if (v6)
      {
        v5 = v3[6];
      }
      else
      {
        __swift_instantiateConcreteTypeFromMangledName(&qword_1EF0F6B80);
        v5 = v3[7];
      }
    }
    v7 = OUTLINED_FUNCTION_24(v5);
    OUTLINED_FUNCTION_0_1(v7, v8, v9, v10);
  }
}

void sub_1B513D054()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;

  sub_1B514BCFC();
  if (v0 <= 0x3F)
  {
    sub_1B513D124(319, &qword_1EF0F6D80, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataPayloadMessage);
    if (v1 <= 0x3F)
    {
      sub_1B513D124(319, &qword_1EF0F6D88, (void (*)(uint64_t))type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataEventMetadata);
      if (v2 <= 0x3F)
        swift_initStructMetadata();
    }
  }
}

void sub_1B513D124(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  unint64_t v4;
  uint64_t v5;

  if (!*a2)
  {
    a3(255);
    v4 = sub_1B514BFA8();
    if (!v5)
      atomic_store(v4, a2);
  }
}

uint64_t *sub_1B513D170(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  void (*v18)(char *, char *, uint64_t);
  uint64_t v19;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v19 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v19 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    v8 = a2[3];
    a1[2] = a2[2];
    v9 = a2[4];
    swift_bridgeObjectRetain();
    sub_1B5132FE4(v8, v9);
    a1[3] = v8;
    a1[4] = v9;
    v10 = a2[6];
    a1[5] = a2[5];
    a1[6] = v10;
    v11 = a2[8];
    a1[7] = a2[7];
    a1[8] = v11;
    v12 = a2[10];
    a1[9] = a2[9];
    a1[10] = v12;
    v13 = a2[11];
    v14 = *(int *)(a3 + 44);
    v15 = (char *)a1 + v14;
    v16 = (char *)a2 + v14;
    a1[11] = v13;
    v17 = sub_1B514BCFC();
    v18 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v17 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v18(v15, v16, v17);
  }
  return a1;
}

uint64_t sub_1B513D27C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  swift_bridgeObjectRelease();
  sub_1B513303C(*(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 44);
  v5 = sub_1B514BCFC();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
}

_QWORD *sub_1B513D2EC(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  void (*v17)(char *, char *, uint64_t);

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  v7 = a2[3];
  a1[2] = a2[2];
  v8 = a2[4];
  swift_bridgeObjectRetain();
  sub_1B5132FE4(v7, v8);
  a1[3] = v7;
  a1[4] = v8;
  v9 = a2[6];
  a1[5] = a2[5];
  a1[6] = v9;
  v10 = a2[8];
  a1[7] = a2[7];
  a1[8] = v10;
  v11 = a2[10];
  a1[9] = a2[9];
  a1[10] = v11;
  v12 = a2[11];
  v13 = *(int *)(a3 + 44);
  v14 = (char *)a1 + v13;
  v15 = (char *)a2 + v13;
  a1[11] = v12;
  v16 = sub_1B514BCFC();
  v17 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v16 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v17(v14, v15, v16);
  return a1;
}

_QWORD *sub_1B513D3CC(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;

  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  v6 = a2[3];
  v7 = a2[4];
  sub_1B5132FE4(v6, v7);
  v8 = a1[3];
  v9 = a1[4];
  a1[3] = v6;
  a1[4] = v7;
  sub_1B513303C(v8, v9);
  a1[5] = a2[5];
  a1[6] = a2[6];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[7] = a2[7];
  a1[8] = a2[8];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[9] = a2[9];
  a1[10] = a2[10];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[11] = a2[11];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v10 = *(int *)(a3 + 44);
  v11 = (char *)a1 + v10;
  v12 = (char *)a2 + v10;
  v13 = sub_1B514BCFC();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 24))(v11, v12, v13);
  return a1;
}

uint64_t sub_1B513D4EC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  v4 = *(int *)(a3 + 44);
  v5 = a2 + v4;
  v6 = a1 + v4;
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  v7 = sub_1B514BCFC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(v6, v5, v7);
  return a1;
}

uint64_t sub_1B513D578(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v6 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v6;
  swift_bridgeObjectRelease();
  v7 = *(_QWORD *)(a2 + 32);
  v8 = *(_QWORD *)(a1 + 24);
  v9 = *(_QWORD *)(a1 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 32) = v7;
  sub_1B513303C(v8, v9);
  v10 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = v10;
  swift_bridgeObjectRelease();
  v11 = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = v11;
  swift_bridgeObjectRelease();
  v12 = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 80) = v12;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  swift_bridgeObjectRelease();
  v13 = *(int *)(a3 + 44);
  v14 = a1 + v13;
  v15 = a2 + v13;
  v16 = sub_1B514BCFC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 40))(v14, v15, v16);
  return a1;
}

uint64_t sub_1B513D63C()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

void sub_1B513D648()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_23();
  if (v2)
  {
    OUTLINED_FUNCTION_12(*(_QWORD *)(v0 + 8));
    OUTLINED_FUNCTION_15();
  }
  else
  {
    v3 = v1;
    OUTLINED_FUNCTION_5_1();
    v4 = OUTLINED_FUNCTION_49(*(int *)(v3 + 44));
    OUTLINED_FUNCTION_1_1(v4, v5, v6);
  }
}

uint64_t sub_1B513D690()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

void sub_1B513D69C()
{
  int v0;
  uint64_t v1;
  uint64_t v2;
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  OUTLINED_FUNCTION_11();
  if (v3)
  {
    *(_QWORD *)(v1 + 8) = (v0 - 1);
    OUTLINED_FUNCTION_15();
  }
  else
  {
    v4 = v2;
    OUTLINED_FUNCTION_5_1();
    v5 = OUTLINED_FUNCTION_24(*(int *)(v4 + 44));
    OUTLINED_FUNCTION_0_1(v5, v6, v7, v8);
  }
}

uint64_t sub_1B513D6E0()
{
  uint64_t result;
  unint64_t v1;

  result = sub_1B514BCFC();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

_QWORD *sub_1B513D780(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  _QWORD *v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v4 = (_QWORD *)a1;
  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v16 = *a2;
    *v4 = *a2;
    v4 = (_QWORD *)(v16 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *(_QWORD *)a1 = *a2;
    *(_BYTE *)(a1 + 8) = *((_BYTE *)a2 + 8);
    v7 = a2[3];
    v4[2] = a2[2];
    v4[3] = v7;
    v8 = a2[4];
    v9 = a2[5];
    swift_bridgeObjectRetain();
    sub_1B5132FE4(v8, v9);
    v4[4] = v8;
    v4[5] = v9;
    v10 = a2[6];
    v11 = a2[7];
    sub_1B5132FE4(v10, v11);
    v4[6] = v10;
    v4[7] = v11;
    v12 = *(int *)(a3 + 32);
    v13 = (char *)v4 + v12;
    v14 = (uint64_t)a2 + v12;
    v15 = sub_1B514BCFC();
    (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 16))(v13, v14, v15);
  }
  return v4;
}

uint64_t sub_1B513D854(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  swift_bridgeObjectRelease();
  sub_1B513303C(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  sub_1B513303C(*(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  v4 = a1 + *(int *)(a2 + 32);
  v5 = sub_1B514BCFC();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
}

uint64_t sub_1B513D8AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  v6 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v6;
  v7 = *(_QWORD *)(a2 + 32);
  v8 = *(_QWORD *)(a2 + 40);
  swift_bridgeObjectRetain();
  sub_1B5132FE4(v7, v8);
  *(_QWORD *)(a1 + 32) = v7;
  *(_QWORD *)(a1 + 40) = v8;
  v9 = *(_QWORD *)(a2 + 48);
  v10 = *(_QWORD *)(a2 + 56);
  sub_1B5132FE4(v9, v10);
  *(_QWORD *)(a1 + 48) = v9;
  *(_QWORD *)(a1 + 56) = v10;
  v11 = *(int *)(a3 + 32);
  v12 = a1 + v11;
  v13 = a2 + v11;
  v14 = sub_1B514BCFC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 16))(v12, v13, v14);
  return a1;
}

uint64_t sub_1B513D954(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v6 = *a2;
  *(_BYTE *)(a1 + 8) = *((_BYTE *)a2 + 8);
  *(_QWORD *)a1 = v6;
  *(_QWORD *)(a1 + 16) = a2[2];
  *(_QWORD *)(a1 + 24) = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v7 = a2[4];
  v8 = a2[5];
  sub_1B5132FE4(v7, v8);
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(_QWORD *)(a1 + 40);
  *(_QWORD *)(a1 + 32) = v7;
  *(_QWORD *)(a1 + 40) = v8;
  sub_1B513303C(v9, v10);
  v11 = a2[6];
  v12 = a2[7];
  sub_1B5132FE4(v11, v12);
  v13 = *(_QWORD *)(a1 + 48);
  v14 = *(_QWORD *)(a1 + 56);
  *(_QWORD *)(a1 + 48) = v11;
  *(_QWORD *)(a1 + 56) = v12;
  sub_1B513303C(v13, v14);
  v15 = *(int *)(a3 + 32);
  v16 = a1 + v15;
  v17 = (uint64_t)a2 + v15;
  v18 = sub_1B514BCFC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 24))(v16, v17, v18);
  return a1;
}

uint64_t sub_1B513DA20(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  v4 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v4;
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  v5 = *(int *)(a3 + 32);
  v6 = a1 + v5;
  v7 = a2 + v5;
  v8 = sub_1B514BCFC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 32))(v6, v7, v8);
  return a1;
}

uint64_t sub_1B513DA94(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  v6 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v6;
  swift_bridgeObjectRelease();
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 40);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  sub_1B513303C(v7, v8);
  v9 = *(_QWORD *)(a1 + 48);
  v10 = *(_QWORD *)(a1 + 56);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  sub_1B513303C(v9, v10);
  v11 = *(int *)(a3 + 32);
  v12 = a1 + v11;
  v13 = a2 + v11;
  v14 = sub_1B514BCFC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 40))(v12, v13, v14);
  return a1;
}

uint64_t sub_1B513DB30()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

void sub_1B513DB3C()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_23();
  if (v2)
  {
    OUTLINED_FUNCTION_12(*(_QWORD *)(v0 + 24));
    OUTLINED_FUNCTION_15();
  }
  else
  {
    v3 = v1;
    OUTLINED_FUNCTION_5_1();
    v4 = OUTLINED_FUNCTION_49(*(int *)(v3 + 32));
    OUTLINED_FUNCTION_1_1(v4, v5, v6);
  }
}

uint64_t sub_1B513DB84()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

void sub_1B513DB90()
{
  int v0;
  uint64_t v1;
  uint64_t v2;
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  OUTLINED_FUNCTION_11();
  if (v3)
  {
    *(_QWORD *)(v1 + 24) = (v0 - 1);
    OUTLINED_FUNCTION_15();
  }
  else
  {
    v4 = v2;
    OUTLINED_FUNCTION_5_1();
    v5 = OUTLINED_FUNCTION_24(*(int *)(v4 + 32));
    OUTLINED_FUNCTION_0_1(v5, v6, v7, v8);
  }
}

uint64_t sub_1B513DBD4()
{
  return sub_1B513E054();
}

_DWORD *sub_1B513DBF4(_DWORD *a1, uint64_t *a2, uint64_t a3)
{
  _DWORD *v4;
  int v5;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(char *, uint64_t, uint64_t);
  uint64_t v16;

  v4 = a1;
  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v16 = *a2;
    *(_QWORD *)v4 = *a2;
    v4 = (_DWORD *)(v16 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *a1 = *(_DWORD *)a2;
    v7 = a2[1];
    v8 = a2[2];
    sub_1B5132FE4(v7, v8);
    *((_QWORD *)v4 + 1) = v7;
    *((_QWORD *)v4 + 2) = v8;
    *((_QWORD *)v4 + 3) = a2[3];
    *((_BYTE *)v4 + 32) = *((_BYTE *)a2 + 32);
    v9 = a2[5];
    v10 = a2[6];
    v11 = *(int *)(a3 + 32);
    v12 = (char *)v4 + v11;
    v13 = (uint64_t)a2 + v11;
    *((_QWORD *)v4 + 5) = v9;
    *((_QWORD *)v4 + 6) = v10;
    v14 = sub_1B514BCFC();
    v15 = *(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 16);
    swift_bridgeObjectRetain();
    v15(v12, v13, v14);
  }
  return v4;
}

uint64_t sub_1B513DCC4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  sub_1B513303C(*(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16));
  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 32);
  v5 = sub_1B514BCFC();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
}

uint64_t sub_1B513DD18(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t, uint64_t);

  *(_DWORD *)a1 = *(_DWORD *)a2;
  v6 = *(_QWORD *)(a2 + 8);
  v7 = *(_QWORD *)(a2 + 16);
  sub_1B5132FE4(v6, v7);
  *(_QWORD *)(a1 + 8) = v6;
  *(_QWORD *)(a1 + 16) = v7;
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  v8 = *(_QWORD *)(a2 + 40);
  v9 = *(_QWORD *)(a2 + 48);
  v10 = *(int *)(a3 + 32);
  v11 = a1 + v10;
  v12 = a2 + v10;
  *(_QWORD *)(a1 + 40) = v8;
  *(_QWORD *)(a1 + 48) = v9;
  v13 = sub_1B514BCFC();
  v14 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 16);
  swift_bridgeObjectRetain();
  v14(v11, v12, v13);
  return a1;
}

uint64_t sub_1B513DDBC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  *(_DWORD *)a1 = *(_DWORD *)a2;
  v6 = *(_QWORD *)(a2 + 8);
  v7 = *(_QWORD *)(a2 + 16);
  sub_1B5132FE4(v6, v7);
  v8 = *(_QWORD *)(a1 + 8);
  v9 = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 8) = v6;
  *(_QWORD *)(a1 + 16) = v7;
  sub_1B513303C(v8, v9);
  v10 = *(_QWORD *)(a2 + 24);
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = v10;
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v11 = *(int *)(a3 + 32);
  v12 = a1 + v11;
  v13 = a2 + v11;
  v14 = sub_1B514BCFC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 24))(v12, v13, v14);
  return a1;
}

uint64_t sub_1B513DE74(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  v4 = *(int *)(a3 + 32);
  v5 = a1 + v4;
  v6 = a2 + v4;
  v7 = sub_1B514BCFC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

uint64_t sub_1B513DEF0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  *(_DWORD *)a1 = *(_DWORD *)a2;
  v6 = *(_QWORD *)(a1 + 8);
  v7 = *(_QWORD *)(a1 + 16);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  sub_1B513303C(v6, v7);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  v8 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = v8;
  swift_bridgeObjectRelease();
  v9 = *(int *)(a3 + 32);
  v10 = a1 + v9;
  v11 = a2 + v9;
  v12 = sub_1B514BCFC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 40))(v10, v11, v12);
  return a1;
}

uint64_t sub_1B513DF88()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

void sub_1B513DF94()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_23();
  if (v2)
  {
    OUTLINED_FUNCTION_12(*(_QWORD *)(v0 + 48));
    OUTLINED_FUNCTION_15();
  }
  else
  {
    v3 = v1;
    OUTLINED_FUNCTION_5_1();
    v4 = OUTLINED_FUNCTION_49(*(int *)(v3 + 32));
    OUTLINED_FUNCTION_1_1(v4, v5, v6);
  }
}

uint64_t sub_1B513DFDC()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

void sub_1B513DFE8()
{
  int v0;
  uint64_t v1;
  uint64_t v2;
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  OUTLINED_FUNCTION_11();
  if (v3)
  {
    *(_QWORD *)(v1 + 48) = (v0 - 1);
    OUTLINED_FUNCTION_15();
  }
  else
  {
    v4 = v2;
    OUTLINED_FUNCTION_5_1();
    v5 = OUTLINED_FUNCTION_24(*(int *)(v4 + 32));
    OUTLINED_FUNCTION_0_1(v5, v6, v7, v8);
  }
}

uint64_t sub_1B513E02C()
{
  return sub_1B513E054();
}

uint64_t sub_1B513E054()
{
  uint64_t result;
  unint64_t v1;

  result = sub_1B514BCFC();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_1B513E0C4(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v4;
  uint64_t v5;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;

  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  v5 = *a2;
  *a1 = *a2;
  if ((v4 & 0x20000) != 0)
  {
    a1 = (uint64_t *)(v5 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    v8 = a2[1];
    v9 = a2[2];
    swift_bridgeObjectRetain();
    sub_1B5132FE4(v8, v9);
    a1[1] = v8;
    a1[2] = v9;
    v10 = *(int *)(a3 + 24);
    v11 = (char *)a1 + v10;
    v12 = (char *)a2 + v10;
    v13 = sub_1B514BCFC();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 16))(v11, v12, v13);
  }
  return a1;
}

uint64_t sub_1B513E16C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  swift_bridgeObjectRelease();
  sub_1B513303C(*(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16));
  v4 = a1 + *(int *)(a2 + 24);
  v5 = sub_1B514BCFC();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
}

_QWORD *sub_1B513E1BC(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;

  v6 = a2[1];
  *a1 = *a2;
  v7 = a2[2];
  swift_bridgeObjectRetain();
  sub_1B5132FE4(v6, v7);
  a1[1] = v6;
  a1[2] = v7;
  v8 = *(int *)(a3 + 24);
  v9 = (char *)a1 + v8;
  v10 = (char *)a2 + v8;
  v11 = sub_1B514BCFC();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(v9, v10, v11);
  return a1;
}

_QWORD *sub_1B513E240(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;

  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = a2[1];
  v7 = a2[2];
  sub_1B5132FE4(v6, v7);
  v8 = a1[1];
  v9 = a1[2];
  a1[1] = v6;
  a1[2] = v7;
  sub_1B513303C(v8, v9);
  v10 = *(int *)(a3 + 24);
  v11 = (char *)a1 + v10;
  v12 = (char *)a2 + v10;
  v13 = sub_1B514BCFC();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 24))(v11, v12, v13);
  return a1;
}

uint64_t sub_1B513E2D8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  v4 = *(int *)(a3 + 24);
  v5 = a1 + v4;
  v6 = a2 + v4;
  v7 = sub_1B514BCFC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

_QWORD *sub_1B513E33C(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;

  *a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease();
  v6 = a1[1];
  v7 = a1[2];
  *(_OWORD *)(a1 + 1) = *(_OWORD *)(a2 + 8);
  sub_1B513303C(v6, v7);
  v8 = *(int *)(a3 + 24);
  v9 = (char *)a1 + v8;
  v10 = a2 + v8;
  v11 = sub_1B514BCFC();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 40))(v9, v10, v11);
  return a1;
}

uint64_t sub_1B513E3B8()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

void sub_1B513E3C4()
{
  unint64_t *v0;
  uint64_t v1;
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_23();
  if (v2)
  {
    OUTLINED_FUNCTION_12(*v0);
    OUTLINED_FUNCTION_15();
  }
  else
  {
    v3 = v1;
    OUTLINED_FUNCTION_5_1();
    v4 = OUTLINED_FUNCTION_49(*(int *)(v3 + 24));
    OUTLINED_FUNCTION_1_1(v4, v5, v6);
  }
}

uint64_t sub_1B513E40C()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

void sub_1B513E418()
{
  int v0;
  _QWORD *v1;
  uint64_t v2;
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  OUTLINED_FUNCTION_11();
  if (v3)
  {
    *v1 = (v0 - 1);
    OUTLINED_FUNCTION_15();
  }
  else
  {
    v4 = v2;
    OUTLINED_FUNCTION_5_1();
    v5 = OUTLINED_FUNCTION_24(*(int *)(v4 + 24));
    OUTLINED_FUNCTION_0_1(v5, v6, v7, v8);
  }
}

uint64_t sub_1B513E45C()
{
  uint64_t result;
  unint64_t v1;

  result = sub_1B514BCFC();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

_QWORD *sub_1B513E4DC(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  _QWORD *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t, uint64_t);
  uint64_t v11;

  v3 = (_QWORD *)a1;
  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    v11 = *a2;
    *v3 = *a2;
    v3 = (_QWORD *)(v11 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    *(_QWORD *)a1 = *a2;
    *(_BYTE *)(a1 + 8) = *((_BYTE *)a2 + 8);
    v5 = a2[3];
    *(_QWORD *)(a1 + 16) = a2[2];
    *(_QWORD *)(a1 + 24) = v5;
    v6 = *(int *)(a3 + 28);
    v7 = a1 + v6;
    v8 = (uint64_t)a2 + v6;
    *(_QWORD *)(a1 + 32) = a2[4];
    v9 = sub_1B514BCFC();
    v10 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v10(v7, v8, v9);
  }
  return v3;
}

uint64_t sub_1B513E5A0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 28);
  v5 = sub_1B514BCFC();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
}

uint64_t sub_1B513E5F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t, uint64_t);

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  v4 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v4;
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  v5 = *(int *)(a3 + 28);
  v6 = a1 + v5;
  v7 = a2 + v5;
  v8 = sub_1B514BCFC();
  v9 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v9(v6, v7, v8);
  return a1;
}

uint64_t sub_1B513E688(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6 = *a2;
  *(_BYTE *)(a1 + 8) = *((_BYTE *)a2 + 8);
  *(_QWORD *)a1 = v6;
  *(_QWORD *)(a1 + 16) = a2[2];
  *(_QWORD *)(a1 + 24) = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 32) = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v7 = *(int *)(a3 + 28);
  v8 = a1 + v7;
  v9 = (uint64_t)a2 + v7;
  v10 = sub_1B514BCFC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 24))(v8, v9, v10);
  return a1;
}

uint64_t sub_1B513E72C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  v4 = *(int *)(a3 + 28);
  v5 = a1 + v4;
  v6 = a2 + v4;
  v7 = sub_1B514BCFC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

uint64_t sub_1B513E7A0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  v6 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v6;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_bridgeObjectRelease();
  v7 = *(int *)(a3 + 28);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_1B514BCFC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 40))(v8, v9, v10);
  return a1;
}

uint64_t sub_1B513E82C()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

void sub_1B513E838()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_23();
  if (v2)
  {
    OUTLINED_FUNCTION_12(*(_QWORD *)(v0 + 24));
    OUTLINED_FUNCTION_15();
  }
  else
  {
    v3 = v1;
    OUTLINED_FUNCTION_5_1();
    v4 = OUTLINED_FUNCTION_49(*(int *)(v3 + 28));
    OUTLINED_FUNCTION_1_1(v4, v5, v6);
  }
}

uint64_t sub_1B513E880()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

void sub_1B513E88C()
{
  int v0;
  uint64_t v1;
  uint64_t v2;
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  OUTLINED_FUNCTION_11();
  if (v3)
  {
    *(_QWORD *)(v1 + 24) = (v0 - 1);
    OUTLINED_FUNCTION_15();
  }
  else
  {
    v4 = v2;
    OUTLINED_FUNCTION_5_1();
    v5 = OUTLINED_FUNCTION_24(*(int *)(v4 + 28));
    OUTLINED_FUNCTION_0_1(v5, v6, v7, v8);
  }
}

uint64_t sub_1B513E8D0()
{
  uint64_t result;
  unint64_t v1;

  result = sub_1B514BCFC();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

unint64_t sub_1B513E960()
{
  unint64_t result;

  result = qword_1EF0F6DE0;
  if (!qword_1EF0F6DE0)
  {
    result = MEMORY[0x1B5E47AC4](&unk_1B514E7E4, &unk_1E68A2888);
    atomic_store(result, (unint64_t *)&qword_1EF0F6DE0);
  }
  return result;
}

unint64_t sub_1B513E9A0()
{
  unint64_t result;

  result = qword_1EF0F6DE8;
  if (!qword_1EF0F6DE8)
  {
    result = MEMORY[0x1B5E47AC4](&unk_1B514E884, &unk_1E68A29A8);
    atomic_store(result, (unint64_t *)&qword_1EF0F6DE8);
  }
  return result;
}

unint64_t sub_1B513E9E0()
{
  unint64_t result;

  result = qword_1EF0F6DF0;
  if (!qword_1EF0F6DF0)
  {
    result = MEMORY[0x1B5E47AC4](&unk_1B514E924, &unk_1E68A27A8);
    atomic_store(result, (unint64_t *)&qword_1EF0F6DF0);
  }
  return result;
}

unint64_t sub_1B513EA20()
{
  unint64_t result;

  result = qword_1EF0F6DF8;
  if (!qword_1EF0F6DF8)
  {
    result = MEMORY[0x1B5E47AC4](&unk_1B514E80C, &unk_1E68A2888);
    atomic_store(result, (unint64_t *)&qword_1EF0F6DF8);
  }
  return result;
}

unint64_t sub_1B513EA60()
{
  unint64_t result;

  result = qword_1EF0F6E00;
  if (!qword_1EF0F6E00)
  {
    result = MEMORY[0x1B5E47AC4](&unk_1B514E84C, &unk_1E68A2888);
    atomic_store(result, (unint64_t *)&qword_1EF0F6E00);
  }
  return result;
}

unint64_t sub_1B513EAA0()
{
  unint64_t result;

  result = qword_1EF0F6E08;
  if (!qword_1EF0F6E08)
  {
    result = MEMORY[0x1B5E47AC4](&unk_1B514E8AC, &unk_1E68A29A8);
    atomic_store(result, (unint64_t *)&qword_1EF0F6E08);
  }
  return result;
}

unint64_t sub_1B513EAE0()
{
  unint64_t result;

  result = qword_1EF0F6E10;
  if (!qword_1EF0F6E10)
  {
    result = MEMORY[0x1B5E47AC4]("}Du1l-", &unk_1E68A29A8);
    atomic_store(result, (unint64_t *)&qword_1EF0F6E10);
  }
  return result;
}

unint64_t sub_1B513EB20()
{
  unint64_t result;

  result = qword_1EF0F6E18;
  if (!qword_1EF0F6E18)
  {
    result = MEMORY[0x1B5E47AC4](&unk_1B514E94C, &unk_1E68A27A8);
    atomic_store(result, (unint64_t *)&qword_1EF0F6E18);
  }
  return result;
}

unint64_t sub_1B513EB60()
{
  unint64_t result;

  result = qword_1EF0F6E20;
  if (!qword_1EF0F6E20)
  {
    result = MEMORY[0x1B5E47AC4](&unk_1B514E98C, &unk_1E68A27A8);
    atomic_store(result, (unint64_t *)&qword_1EF0F6E20);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_0_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_storeEnumTagSinglePayload(a1, a2, a3, a4);
}

uint64_t OUTLINED_FUNCTION_1_1(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return __swift_getEnumTagSinglePayload(a1, a2, a3);
}

uint64_t OUTLINED_FUNCTION_2_1()
{
  return sub_1B514BD38();
}

uint64_t OUTLINED_FUNCTION_3_1()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_5_1()
{
  return sub_1B514BCFC();
}

uint64_t OUTLINED_FUNCTION_6_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  return a4();
}

uint64_t OUTLINED_FUNCTION_8_0()
{
  return sub_1B514BEE8();
}

uint64_t OUTLINED_FUNCTION_10@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v2, v3 + a1, v1);
}

uint64_t OUTLINED_FUNCTION_12@<X0>(unint64_t a1@<X8>)
{
  if (a1 >= 0xFFFFFFFF)
    LODWORD(a1) = -1;
  return (a1 + 1);
}

uint64_t OUTLINED_FUNCTION_13()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v0, v1);
}

uint64_t OUTLINED_FUNCTION_14@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(uint64_t, uint64_t, uint64_t);

  return v4(v1, v3 + a1, v2);
}

uint64_t OUTLINED_FUNCTION_20()
{
  return sub_1B514BD38();
}

uint64_t OUTLINED_FUNCTION_21()
{
  return sub_1B514BE10();
}

uint64_t OUTLINED_FUNCTION_22()
{
  uint64_t v0;
  uint64_t v1;

  return __swift_getEnumTagSinglePayload(v0, 1, v1);
}

uint64_t OUTLINED_FUNCTION_24@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return v1 + a1;
}

uint64_t OUTLINED_FUNCTION_26()
{
  uint64_t v0;
  unint64_t v1;

  return sub_1B5135DF4(v0, v1);
}

uint64_t OUTLINED_FUNCTION_28()
{
  return sub_1B514BCE4();
}

uint64_t OUTLINED_FUNCTION_29()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_30(uint64_t a1)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);

  return v2(a1, v1);
}

uint64_t OUTLINED_FUNCTION_32()
{
  return sub_1B514BD80();
}

uint64_t OUTLINED_FUNCTION_33()
{
  return sub_1B514BD5C();
}

uint64_t OUTLINED_FUNCTION_34()
{
  return sub_1B514BDEC();
}

uint64_t OUTLINED_FUNCTION_35()
{
  return sub_1B514C038();
}

uint64_t OUTLINED_FUNCTION_36()
{
  return sub_1B514BCF0();
}

uint64_t OUTLINED_FUNCTION_39()
{
  return sub_1B514BCE4();
}

uint64_t OUTLINED_FUNCTION_40(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 16))(v1, v2, a1);
}

uint64_t OUTLINED_FUNCTION_43()
{
  return sub_1B514BE1C();
}

void OUTLINED_FUNCTION_45(uint64_t a1@<X8>)
{
  *(_QWORD *)a1 = 0;
  *(_BYTE *)(a1 + 8) = 1;
  *(_QWORD *)(a1 + 16) = 0;
  *(_QWORD *)(a1 + 24) = 0xE000000000000000;
}

void OUTLINED_FUNCTION_46(uint64_t a1)
{
  uint64_t *v1;

  sub_1B5134928(a1, v1);
}

uint64_t OUTLINED_FUNCTION_47()
{
  return sub_1B514BEDC();
}

uint64_t OUTLINED_FUNCTION_49@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return v1 + a1;
}

void OUTLINED_FUNCTION_51(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;

  sub_1B5139EE0(a1, a2, v2);
}

uint64_t OUTLINED_FUNCTION_56()
{
  return sub_1B514C050();
}

uint64_t OUTLINED_FUNCTION_58()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_59()
{
  return sub_1B514BDE0();
}

uint64_t OUTLINED_FUNCTION_60()
{
  return type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataEventMetadata(0);
}

uint64_t OUTLINED_FUNCTION_61()
{
  return type metadata accessor for Com_Apple_Aiml_Dpg_Service_V1_DataPayloadMessage(0);
}

void OUTLINED_FUNCTION_62(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;

  sub_1B5139EE0(a1, a2, v2);
}

uint64_t OUTLINED_FUNCTION_63(uint64_t a1)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);

  return v2(a1, v1);
}

void OUTLINED_FUNCTION_65()
{
  JUMPOUT(0x1B5E47050);
}

uint64_t OUTLINED_FUNCTION_66()
{
  char v0;

  return v0 & 1;
}

uint64_t OUTLINED_FUNCTION_68(uint64_t result, __int16 a2)
{
  uint64_t v2;

  *(_QWORD *)v2 = result;
  *(_BYTE *)(v2 + 8) = a2;
  *(_BYTE *)(v2 + 9) = HIBYTE(a2) & 1;
  return result;
}

void OUTLINED_FUNCTION_69(uint64_t a1)
{
  uint64_t *v1;

  sub_1B5134928(a1, v1);
}

uint64_t OUTLINED_FUNCTION_74()
{
  return sub_1B514BE4C();
}

uint64_t OUTLINED_FUNCTION_76()
{
  return sub_1B514C044();
}

void sub_1B513F59C(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_1B5140010(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B5140240(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B5140BA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B51413B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B5141584(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_list va;

  va_start(va, a10);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B51416A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B5141834(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B5142484(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

void sub_1B5145CD0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id a19)
{
  objc_destroyWeak(location);
  objc_destroyWeak(&a19);
  _Unwind_Resume(a1);
}

void sub_1B5148DF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B5149C04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__411(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__412(uint64_t a1)
{

}

unsigned __int8 *tryGetTextProperty(sqlite3_stmt *a1, int a2)
{
  unsigned __int8 *v2;

  v2 = (unsigned __int8 *)sqlite3_column_text(a1, a2);
  if (v2)
    v2 = (unsigned __int8 *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", v2);
  return v2;
}

id tryGetDateProperty(sqlite3_stmt *a1, int a2)
{
  void *v4;

  if (sqlite3_column_type(a1, a2) == 5)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", (double)sqlite3_column_int64(a1, a2));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

id tryGetDataProperty(sqlite3 *a1, void *a2, sqlite3_stmt *a3, int a4)
{
  NSObject *v7;
  const void *v8;
  int v9;
  void *v10;
  uint8_t v12[16];

  v7 = a2;
  v8 = sqlite3_column_blob(a3, a4);
  if (sqlite3_errcode(a1) == 7)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v12 = 0;
      _os_log_error_impl(&dword_1B512E000, v7, OS_LOG_TYPE_ERROR, "SQLite payload blob iteration OOM", v12, 2u);
    }
    goto LABEL_6;
  }
  v9 = sqlite3_column_bytes(a3, a4);
  if (!v8)
  {
LABEL_6:
    v10 = 0;
    goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:

  return v10;
}

os_log_t flLogForObject(void *a1)
{
  const char *ClassName;

  ClassName = object_getClassName(a1);
  return os_log_create("com.apple.feedbacklogger", ClassName);
}

void FLSignpostLoggingInit()
{
  if (FLSignpostLoggingInit_onceToken != -1)
    dispatch_once(&FLSignpostLoggingInit_onceToken, &__block_literal_global_638);
}

void sub_1B514B09C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

id FLGetBootSessionUUID()
{
  if (FLGetBootSessionUUID_onceToken != -1)
    dispatch_once(&FLGetBootSessionUUID_onceToken, &__block_literal_global_810);
  return (id)FLGetBootSessionUUID_bootSessionUUID;
}

uint64_t sub_1B514BC60()
{
  return MEMORY[0x1E0CAE8D0]();
}

uint64_t sub_1B514BC6C()
{
  return MEMORY[0x1E0CAE8F0]();
}

uint64_t sub_1B514BC78()
{
  return MEMORY[0x1E0CAE8F8]();
}

uint64_t sub_1B514BC84()
{
  return MEMORY[0x1E0CB01F0]();
}

uint64_t sub_1B514BC90()
{
  return MEMORY[0x1E0CB0218]();
}

uint64_t sub_1B514BC9C()
{
  return MEMORY[0x1E0CB0228]();
}

uint64_t sub_1B514BCA8()
{
  return MEMORY[0x1E0CB07C0]();
}

uint64_t sub_1B514BCB4()
{
  return MEMORY[0x1E0CB07F8]();
}

uint64_t sub_1B514BCC0()
{
  return MEMORY[0x1E0CB0860]();
}

uint64_t sub_1B514BCCC()
{
  return MEMORY[0x1E0CB0870]();
}

uint64_t sub_1B514BCD8()
{
  return MEMORY[0x1E0D3E958]();
}

uint64_t sub_1B514BCE4()
{
  return MEMORY[0x1E0D3E988]();
}

uint64_t sub_1B514BCF0()
{
  return MEMORY[0x1E0D3E990]();
}

uint64_t sub_1B514BCFC()
{
  return MEMORY[0x1E0D3E998]();
}

uint64_t sub_1B514BD08()
{
  return MEMORY[0x1E0D3EA80]();
}

uint64_t sub_1B514BD14()
{
  return MEMORY[0x1E0D3EA90]();
}

uint64_t sub_1B514BD20()
{
  return MEMORY[0x1E0D3EA98]();
}

uint64_t sub_1B514BD2C()
{
  return MEMORY[0x1E0D3EAB0]();
}

uint64_t sub_1B514BD38()
{
  return MEMORY[0x1E0D3EAB8]();
}

uint64_t sub_1B514BD44()
{
  return MEMORY[0x1E0D3EAE0]();
}

uint64_t sub_1B514BD50()
{
  return MEMORY[0x1E0D3EAE8]();
}

uint64_t sub_1B514BD5C()
{
  return MEMORY[0x1E0D3EB18]();
}

uint64_t sub_1B514BD68()
{
  return MEMORY[0x1E0D3EB38]();
}

uint64_t sub_1B514BD74()
{
  return MEMORY[0x1E0D3EB48]();
}

uint64_t sub_1B514BD80()
{
  return MEMORY[0x1E0D3EB90]();
}

uint64_t sub_1B514BD8C()
{
  return MEMORY[0x1E0D3EBC0]();
}

uint64_t sub_1B514BD98()
{
  return MEMORY[0x1E0D3EBD8]();
}

uint64_t sub_1B514BDA4()
{
  return MEMORY[0x1E0D3EC48]();
}

uint64_t sub_1B514BDB0()
{
  return MEMORY[0x1E0D3EC58]();
}

uint64_t sub_1B514BDBC()
{
  return MEMORY[0x1E0D3EC68]();
}

uint64_t sub_1B514BDC8()
{
  return MEMORY[0x1E0D3EC80]();
}

uint64_t sub_1B514BDD4()
{
  return MEMORY[0x1E0D3ECB0]();
}

uint64_t sub_1B514BDE0()
{
  return MEMORY[0x1E0D3ED00]();
}

uint64_t sub_1B514BDEC()
{
  return MEMORY[0x1E0D3ED28]();
}

uint64_t sub_1B514BDF8()
{
  return MEMORY[0x1E0D3ED38]();
}

uint64_t sub_1B514BE04()
{
  return MEMORY[0x1E0D3ED40]();
}

uint64_t sub_1B514BE10()
{
  return MEMORY[0x1E0D3ED68]();
}

uint64_t sub_1B514BE1C()
{
  return MEMORY[0x1E0D3ED80]();
}

uint64_t sub_1B514BE28()
{
  return MEMORY[0x1E0D3ED98]();
}

uint64_t sub_1B514BE34()
{
  return MEMORY[0x1E0D3EF28]();
}

uint64_t sub_1B514BE40()
{
  return MEMORY[0x1E0D3EF38]();
}

uint64_t sub_1B514BE4C()
{
  return MEMORY[0x1E0D3EF48]();
}

uint64_t sub_1B514BE58()
{
  return MEMORY[0x1E0DF2240]();
}

uint64_t sub_1B514BE64()
{
  return MEMORY[0x1E0DF2248]();
}

uint64_t sub_1B514BE70()
{
  return MEMORY[0x1E0DF2258]();
}

uint64_t sub_1B514BE7C()
{
  return MEMORY[0x1E0DEF4F8]();
}

uint64_t sub_1B514BE88()
{
  return MEMORY[0x1E0DEF570]();
}

uint64_t sub_1B514BE94()
{
  return MEMORY[0x1E0DEF578]();
}

uint64_t sub_1B514BEA0()
{
  return MEMORY[0x1E0DEF5B0]();
}

uint64_t sub_1B514BEAC()
{
  return MEMORY[0x1E0CB17D8]();
}

uint64_t sub_1B514BEB8()
{
  return MEMORY[0x1E0CB17F8]();
}

uint64_t sub_1B514BEC4()
{
  return MEMORY[0x1E0CB1808]();
}

uint64_t sub_1B514BED0()
{
  return MEMORY[0x1E0DE9E78]();
}

uint64_t sub_1B514BEDC()
{
  return MEMORY[0x1E0DEA1C0]();
}

uint64_t sub_1B514BEE8()
{
  return MEMORY[0x1E0DEA568]();
}

uint64_t sub_1B514BEF4()
{
  return MEMORY[0x1E0CB1940]();
}

uint64_t sub_1B514BF00()
{
  return MEMORY[0x1E0CB1980]();
}

uint64_t sub_1B514BF0C()
{
  return MEMORY[0x1E0DEA5F8]();
}

uint64_t sub_1B514BF18()
{
  return MEMORY[0x1E0DEA758]();
}

uint64_t sub_1B514BF24()
{
  return MEMORY[0x1E0DEA7B8]();
}

uint64_t sub_1B514BF30()
{
  return MEMORY[0x1E0DEA800]();
}

uint64_t sub_1B514BF3C()
{
  return MEMORY[0x1E0DEA850]();
}

uint64_t sub_1B514BF48()
{
  return MEMORY[0x1E0DEA940]();
}

uint64_t sub_1B514BF54()
{
  return MEMORY[0x1E0CB1AC0]();
}

uint64_t sub_1B514BF60()
{
  return MEMORY[0x1E0DF2278]();
}

uint64_t sub_1B514BF6C()
{
  return MEMORY[0x1E0DEF810]();
}

uint64_t sub_1B514BF78()
{
  return MEMORY[0x1E0DEF8E0]();
}

uint64_t sub_1B514BF84()
{
  return MEMORY[0x1E0DEF900]();
}

uint64_t sub_1B514BF90()
{
  return MEMORY[0x1E0DEF910]();
}

uint64_t sub_1B514BF9C()
{
  return MEMORY[0x1E0CB2130]();
}

uint64_t sub_1B514BFA8()
{
  return MEMORY[0x1E0DEB940]();
}

uint64_t sub_1B514BFB4()
{
  return MEMORY[0x1E0DEBC20]();
}

uint64_t sub_1B514BFC0()
{
  return MEMORY[0x1E0DEBC90]();
}

uint64_t sub_1B514BFCC()
{
  return MEMORY[0x1E0CB24A8]();
}

uint64_t sub_1B514BFD8()
{
  return MEMORY[0x1E0DEC060]();
}

uint64_t sub_1B514BFE4()
{
  return MEMORY[0x1E0DEC168]();
}

uint64_t sub_1B514BFF0()
{
  return MEMORY[0x1E0DEC178]();
}

uint64_t sub_1B514BFFC()
{
  return MEMORY[0x1E0DEC1B0]();
}

uint64_t sub_1B514C008()
{
  return MEMORY[0x1E0DEC2B0]();
}

uint64_t sub_1B514C014()
{
  return MEMORY[0x1E0DEC588]();
}

uint64_t sub_1B514C020()
{
  return MEMORY[0x1E0DECBE0]();
}

uint64_t sub_1B514C02C()
{
  return MEMORY[0x1E0DECD70]();
}

uint64_t sub_1B514C038()
{
  return MEMORY[0x1E0DED600]();
}

uint64_t sub_1B514C044()
{
  return MEMORY[0x1E0DEDEF8]();
}

uint64_t sub_1B514C050()
{
  return MEMORY[0x1E0DEDF40]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x1E0D15428]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1E0DE2B20]();
}

uint64_t MKBDeviceUnlockedSinceBoot()
{
  return MEMORY[0x1E0D4E4A0]();
}

uint64_t PBReaderPlaceMark()
{
  return MEMORY[0x1E0D82CE0]();
}

uint64_t PBReaderReadData()
{
  return MEMORY[0x1E0D82CF0]();
}

uint64_t PBReaderSkipValueWithTag()
{
  return MEMORY[0x1E0D82D28]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1E0C80928](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x1E0C80958](aBlock);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81020](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C810D0](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

uint64_t _sqlite3_db_truncate()
{
  return MEMORY[0x1E0DE8530]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1E0DEEA40]();
}

void dispatch_activate(dispatch_object_t object)
{
  MEMORY[0x1E0C82BC0](object);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82BC8](when, queue, block);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x1E0C82BE8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1E0C82D00](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E28](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x1E0C82F10](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1E0C82F20](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x1E0C82F58](source, handler);
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
  MEMORY[0x1E0C82F78](source, start, interval, leeway);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
}

dispatch_time_t dispatch_walltime(const timespec *when, int64_t delta)
{
  return MEMORY[0x1E0C82FC8](when, delta);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1E0C83C50]();
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1E0C83EE0](ptr);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1E0C84078](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1E0C84098](__dst, __src, __len);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x1E0C843F8](name);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1E0DE7BB0](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x1E0DE7BD8](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1E0DE7BE0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x1E0DE7C38](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x1E0DE7C60](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1E0DE7CE0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1E0DE7D08](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D20](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1E0DE7D38]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1E0DE7D48]();
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

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7E58](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E60](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E68](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1E0DE7E70](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7FA0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

const char *__cdecl object_getClassName(id a1)
{
  return (const char *)MEMORY[0x1E0DE8000](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1E0C84920](log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x1E0C84928](log);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x1E0C84970]();
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C84998](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
}

uint64_t os_variant_has_internal_content()
{
  return MEMORY[0x1E0C849F0]();
}

uint64_t sandbox_extension_consume()
{
  return MEMORY[0x1E0C851A0]();
}

uint64_t sandbox_extension_release()
{
  return MEMORY[0x1E0C851F8]();
}

int sqlite3_bind_blob(sqlite3_stmt *a1, int a2, const void *a3, int n, void (__cdecl *a5)(void *))
{
  return MEMORY[0x1E0DE8580](a1, *(_QWORD *)&a2, a3, *(_QWORD *)&n, a5);
}

int sqlite3_bind_int(sqlite3_stmt *a1, int a2, int a3)
{
  return MEMORY[0x1E0DE85A0](a1, *(_QWORD *)&a2, *(_QWORD *)&a3);
}

int sqlite3_bind_int64(sqlite3_stmt *a1, int a2, sqlite3_int64 a3)
{
  return MEMORY[0x1E0DE85A8](a1, *(_QWORD *)&a2, a3);
}

int sqlite3_bind_text(sqlite3_stmt *a1, int a2, const char *a3, int a4, void (__cdecl *a5)(void *))
{
  return MEMORY[0x1E0DE85D8](a1, *(_QWORD *)&a2, a3, *(_QWORD *)&a4, a5);
}

int sqlite3_busy_timeout(sqlite3 *a1, int ms)
{
  return MEMORY[0x1E0DE8638](a1, *(_QWORD *)&ms);
}

int sqlite3_changes(sqlite3 *a1)
{
  return MEMORY[0x1E0DE8640](a1);
}

int sqlite3_close_v2(sqlite3 *a1)
{
  return MEMORY[0x1E0DE8658](a1);
}

const void *__cdecl sqlite3_column_blob(sqlite3_stmt *a1, int iCol)
{
  return (const void *)MEMORY[0x1E0DE8660](a1, *(_QWORD *)&iCol);
}

int sqlite3_column_bytes(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1E0DE8668](a1, *(_QWORD *)&iCol);
}

int sqlite3_column_int(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1E0DE8690](a1, *(_QWORD *)&iCol);
}

sqlite3_int64 sqlite3_column_int64(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1E0DE8698](a1, *(_QWORD *)&iCol);
}

const unsigned __int8 *__cdecl sqlite3_column_text(sqlite3_stmt *a1, int iCol)
{
  return (const unsigned __int8 *)MEMORY[0x1E0DE86B8](a1, *(_QWORD *)&iCol);
}

int sqlite3_column_type(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1E0DE86C8](a1, *(_QWORD *)&iCol);
}

int sqlite3_errcode(sqlite3 *db)
{
  return MEMORY[0x1E0DE8780](db);
}

const char *__cdecl sqlite3_errmsg(sqlite3 *a1)
{
  return (const char *)MEMORY[0x1E0DE8788](a1);
}

int sqlite3_exec(sqlite3 *a1, const char *sql, int (__cdecl *callback)(void *, int, char **, char **), void *a4, char **errmsg)
{
  return MEMORY[0x1E0DE8798](a1, sql, callback, a4, errmsg);
}

int sqlite3_finalize(sqlite3_stmt *pStmt)
{
  return MEMORY[0x1E0DE87C8](pStmt);
}

void sqlite3_free(void *a1)
{
  MEMORY[0x1E0DE87D0](a1);
}

int sqlite3_open_v2(const char *filename, sqlite3 **ppDb, int flags, const char *zVfs)
{
  return MEMORY[0x1E0DE8870](filename, ppDb, *(_QWORD *)&flags, zVfs);
}

int sqlite3_prepare_v2(sqlite3 *db, const char *zSql, int nByte, sqlite3_stmt **ppStmt, const char **pzTail)
{
  return MEMORY[0x1E0DE8880](db, zSql, *(_QWORD *)&nByte, ppStmt, pzTail);
}

int sqlite3_reset(sqlite3_stmt *pStmt)
{
  return MEMORY[0x1E0DE88B0](pStmt);
}

int sqlite3_step(sqlite3_stmt *a1)
{
  return MEMORY[0x1E0DE89A8](a1);
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1E0DEEAB0]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x1E0DEEAD8]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x1E0DEEAE0]();
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

uint64_t swift_deallocObject()
{
  return MEMORY[0x1E0DEEB60]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1E0DEEB80]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x1E0DEEBF0]();
}

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x1E0DEEC48]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x1E0DEECC8]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x1E0DEECD8]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x1E0DEECE0]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x1E0DEECF8]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x1E0DEED38]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x1E0DEED40]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1E0DEED50]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x1E0DEED78]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x1E0DEED88]();
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

uint64_t swift_storeEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x1E0DEEEA0]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1E0DEEED0]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x1E0DEEF38]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x1E0DEEF40]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x1E0DEEF48]();
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1E0C857A0](a1, a2, a3, a4, a5);
}

