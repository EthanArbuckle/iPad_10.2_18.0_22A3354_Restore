uint64_t sub_2158F1E78(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *(_BYTE *)(v5 + 120) = a4;
  *(_QWORD *)(v5 + 32) = a3;
  *(_QWORD *)(v5 + 40) = a5;
  *(_QWORD *)(v5 + 16) = a1;
  *(_QWORD *)(v5 + 24) = a2;
  v6 = sub_2158FEEAC();
  *(_QWORD *)(v5 + 48) = v6;
  *(_QWORD *)(v5 + 56) = *(_QWORD *)(v6 - 8);
  *(_QWORD *)(v5 + 64) = swift_task_alloc();
  v7 = sub_2158FEED0();
  *(_QWORD *)(v5 + 72) = v7;
  *(_QWORD *)(v5 + 80) = *(_QWORD *)(v7 - 8);
  *(_QWORD *)(v5 + 88) = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_2158F1F08()
{
  uint64_t v0;
  id v1;
  unsigned int v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  char v20;
  uint64_t (*v21)(uint64_t, uint64_t, char, uint64_t, uint64_t, uint64_t);

  v1 = objc_msgSend((id)objc_opt_self(), sel_processInfo);
  v2 = objc_msgSend(v1, sel_isiOSAppOnMac);

  if (!v2)
    goto LABEL_8;
  if (qword_254DE9D60 != -1)
    swift_once();
  v3 = sub_2158FEF30();
  __swift_project_value_buffer(v3, (uint64_t)qword_254DE9D68);
  v4 = sub_2158FEF18();
  v5 = sub_2158FF050();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_2158F0000, v4, v5, "This feature is not supported on this platform", v6, 2u);
    MEMORY[0x2199E7E50](v6, -1, -1);
  }

  sub_2158FA180();
  v7 = swift_allocError();
  *v8 = 12;
  swift_willThrow();
  if (v7)
  {
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
LABEL_8:
    if (qword_254DE9D80 != -1)
      swift_once();
    v11 = *(_QWORD *)(v0 + 80);
    v10 = *(_QWORD *)(v0 + 88);
    v12 = *(_QWORD *)(v0 + 72);
    v20 = *(_BYTE *)(v0 + 120);
    v14 = *(_QWORD *)(v0 + 32);
    v13 = *(_QWORD *)(v0 + 40);
    v15 = *(_QWORD *)(v0 + 16);
    v16 = *(_QWORD *)(v0 + 24);
    v17 = __swift_project_value_buffer(v12, (uint64_t)qword_254DE9D88);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 16))(v10, v17, v12);
    sub_2158FEEC4();
    sub_2158FEE94();
    v18 = swift_task_alloc();
    *(_QWORD *)(v0 + 96) = v18;
    *(_QWORD *)(v18 + 16) = v13;
    *(_QWORD *)(v18 + 24) = v15;
    *(_QWORD *)(v18 + 32) = v16;
    *(_QWORD *)(v18 + 40) = v14;
    *(_BYTE *)(v18 + 48) = v20 & 1;
    v21 = (uint64_t (*)(uint64_t, uint64_t, char, uint64_t, uint64_t, uint64_t))((char *)&dword_254DE96A8
                                                                                    + dword_254DE96A8);
    v19 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 104) = v19;
    *v19 = v0;
    v19[1] = sub_2158F2198;
    return v21((uint64_t)"Start Session", 13, 2, *(_QWORD *)(v0 + 64), (uint64_t)&unk_254DE96A0, v18);
  }
}

uint64_t sub_2158F2198(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v4 = *v2;
  *(_QWORD *)(v4 + 112) = v1;
  swift_task_dealloc();
  v5 = *(_QWORD *)(v4 + 88);
  v6 = *(_QWORD *)(v4 + 72);
  v7 = *(_QWORD *)(v4 + 80);
  v9 = *(_QWORD *)(v4 + 56);
  v8 = *(_QWORD *)(v4 + 64);
  v10 = *(_QWORD *)(v4 + 48);
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v8, v10);
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v5, v6);
  if (v1)
    return swift_task_switch();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v4 + 8))(a1);
}

uint64_t sub_2158F2274()
{
  uint64_t v0;

  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2158F22B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  uint64_t v6;
  uint64_t v7;

  *(_BYTE *)(v6 + 200) = a6;
  *(_QWORD *)(v6 + 104) = a4;
  *(_QWORD *)(v6 + 112) = a5;
  *(_QWORD *)(v6 + 88) = a2;
  *(_QWORD *)(v6 + 96) = a3;
  *(_QWORD *)(v6 + 80) = a1;
  v7 = sub_2158FF068();
  *(_QWORD *)(v6 + 120) = v7;
  *(_QWORD *)(v6 + 128) = *(_QWORD *)(v7 - 8);
  *(_QWORD *)(v6 + 136) = swift_task_alloc();
  *(_QWORD *)(v6 + 144) = sub_2158FF05C();
  *(_QWORD *)(v6 + 152) = swift_task_alloc();
  sub_2158FEF54();
  *(_QWORD *)(v6 + 160) = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_2158F2364()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  _QWORD *v13;
  uint64_t v15;

  v1 = *(void **)(v0 + 88);
  if (v1)
  {
    v2 = *(void **)(v0 + 88);
  }
  else
  {
    v3 = *(_QWORD *)(v0 + 136);
    v4 = *(_QWORD *)(v0 + 128);
    v15 = *(_QWORD *)(v0 + 120);
    sub_2158FECC0(0, &qword_254DE9CE0);
    sub_2158FEF48();
    *(_QWORD *)(v0 + 56) = MEMORY[0x24BEE4AF8];
    sub_2158FECF8(&qword_254DE9CE8, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5688], MEMORY[0x24BEE5698]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_254DE9CF0);
    sub_2158FED38(&qword_254DE9CF8, &qword_254DE9CF0);
    sub_2158FF0D4();
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v4 + 104))(v3, *MEMORY[0x24BEE5750], v15);
    v2 = (void *)sub_2158FF080();
    v1 = 0;
  }
  *(_QWORD *)(v0 + 168) = v2;
  v5 = *(_BYTE *)(v0 + 200);
  v7 = *(_QWORD *)(v0 + 104);
  v6 = *(_QWORD *)(v0 + 112);
  sub_2158FED78(*(_QWORD *)(v0 + 96), v0 + 16);
  type metadata accessor for CarKeyRemoteControlSession();
  v8 = swift_allocObject();
  *(_QWORD *)(v0 + 176) = v8;
  *(_QWORD *)(v8 + 88) = 0;
  *(_QWORD *)(v8 + 96) = 0;
  sub_2158FEDBC((__int128 *)(v0 + 16), v8 + 40);
  *(_QWORD *)(v8 + 16) = v7;
  *(_QWORD *)(v8 + 24) = v6;
  *(_BYTE *)(v8 + 32) = v5 & 1;
  *(_QWORD *)(v8 + 80) = v2;
  v9 = *(void **)(v8 + 96);
  *(_QWORD *)(v8 + 96) = 0;
  v10 = v1;
  v11 = v2;

  v12 = *(void **)(v8 + 88);
  *(_QWORD *)(v8 + 88) = 0;

  v13 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 184) = v13;
  *v13 = v0;
  v13[1] = sub_2158F255C;
  v13[14] = v8;
  return swift_task_switch();
}

uint64_t sub_2158F255C()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 192) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_2158F25C0()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  v1 = *(_QWORD *)(v0 + 176);
  v2 = *(_QWORD **)(v0 + 80);

  *v2 = v1;
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2158F262C()
{
  uint64_t v0;
  void *v1;
  id v2;
  void *v3;
  void *v4;
  char *v5;
  char v6;
  void *v7;
  void *v8;
  _BYTE *v9;

  v1 = *(void **)(v0 + 192);
  *(_QWORD *)(v0 + 64) = v1;
  v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254DE96F0);
  sub_2158FECC0(0, &qword_254DE96F8);
  if (!swift_dynamicCast())
    goto LABEL_8;
  v3 = *(void **)(v0 + 72);
  if (objc_msgSend(v3, sel_code) != (id)5)
  {
    if (objc_msgSend(v3, sel_code) == (id)17)
    {
      v4 = *(void **)(v0 + 168);

      sub_2158FA180();
      swift_allocError();
      v6 = 11;
      goto LABEL_6;
    }

LABEL_8:
    v7 = *(void **)(v0 + 192);
    v8 = *(void **)(v0 + 168);

    sub_2158FA180();
    swift_allocError();
    *v9 = 0;
    swift_willThrow();

    swift_release();
    goto LABEL_9;
  }
  v4 = *(void **)(v0 + 168);

  sub_2158FA180();
  swift_allocError();
  v6 = 5;
LABEL_6:
  *v5 = v6;
  swift_willThrow();

  swift_release();
LABEL_9:
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2158F27EC(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  *(_QWORD *)(v7 + 64) = a6;
  *(_QWORD *)(v7 + 72) = v6;
  *(_QWORD *)(v7 + 48) = a4;
  *(_QWORD *)(v7 + 56) = a5;
  *(_BYTE *)(v7 + 128) = a3;
  *(_QWORD *)(v7 + 32) = a1;
  *(_QWORD *)(v7 + 40) = a2;
  v8 = sub_2158FEEAC();
  *(_QWORD *)(v7 + 80) = v8;
  *(_QWORD *)(v7 + 88) = *(_QWORD *)(v8 - 8);
  *(_QWORD *)(v7 + 96) = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_2158F2858()
{
  uint64_t v0;
  NSObject *v1;
  os_signpost_type_t v2;
  uint64_t result;
  const char *v4;
  uint64_t v5;
  void (*v6)(uint64_t, _QWORD, uint64_t);
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t *v10;
  os_signpost_id_t v11;
  int *v12;
  _QWORD *v13;
  uint64_t (*v14)(uint64_t);

  v1 = sub_2158FEEC4();
  v2 = sub_2158FF098();
  result = sub_2158FF0A4();
  if ((result & 1) == 0)
    goto LABEL_5;
  v4 = *(const char **)(v0 + 32);
  if ((*(_BYTE *)(v0 + 128) & 1) == 0)
  {
    if (!v4)
    {
      __break(1u);
LABEL_5:
      v5 = *(_QWORD *)(v0 + 88);

      v6 = *(void (**)(uint64_t, _QWORD, uint64_t))(v5 + 16);
LABEL_11:
      v12 = *(int **)(v0 + 56);
      v6(*(_QWORD *)(v0 + 96), *(_QWORD *)(v0 + 48), *(_QWORD *)(v0 + 80));
      sub_2158FEF00();
      swift_allocObject();
      *(_QWORD *)(v0 + 104) = sub_2158FEEF4();
      v14 = (uint64_t (*)(uint64_t))((char *)v12 + *v12);
      v13 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 112) = v13;
      *v13 = v0;
      v13[1] = sub_2158F2A0C;
      return v14(v0 + 24);
    }
LABEL_10:
    v8 = *(_QWORD *)(v0 + 88);
    v7 = *(_QWORD *)(v0 + 96);
    v9 = *(_QWORD *)(v0 + 80);
    v6 = *(void (**)(uint64_t, _QWORD, uint64_t))(v8 + 16);
    v6(v7, *(_QWORD *)(v0 + 48), v9);
    v10 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v10 = 0;
    v11 = sub_2158FEEA0();
    _os_signpost_emit_with_name_impl(&dword_2158F0000, v1, v2, v11, v4, "", v10, 2u);
    MEMORY[0x2199E7E50](v10, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v7, v9);
    goto LABEL_11;
  }
  if ((unint64_t)v4 >> 32)
  {
    __break(1u);
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  if (v4 >> 11 != 27)
  {
    if (v4 >> 16 <= 0x10)
    {
      v4 = (const char *)(v0 + 16);
      goto LABEL_10;
    }
    goto LABEL_13;
  }
LABEL_14:
  __break(1u);
  return result;
}

uint64_t sub_2158F2A0C()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 120) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_2158F2A70()
{
  uint64_t v0;
  uint64_t v1;

  sub_2158F9F2C(*(_QWORD *)(v0 + 72), *(const char **)(v0 + 32), *(unsigned __int8 *)(v0 + 128));
  swift_release();
  v1 = *(_QWORD *)(v0 + 24);
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v1);
}

uint64_t sub_2158F2ACC()
{
  uint64_t v0;

  sub_2158F9F2C(*(_QWORD *)(v0 + 72), *(const char **)(v0 + 32), *(unsigned __int8 *)(v0 + 128));
  swift_release();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2158F2B20(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  uint64_t v8;

  *(_QWORD *)(v7 + 56) = a6;
  *(_QWORD *)(v7 + 64) = a7;
  *(_BYTE *)(v7 + 120) = a4;
  *(_QWORD *)(v7 + 40) = a3;
  *(_QWORD *)(v7 + 48) = a5;
  *(_QWORD *)(v7 + 24) = a1;
  *(_QWORD *)(v7 + 32) = a2;
  v8 = sub_2158FEEAC();
  *(_QWORD *)(v7 + 72) = v8;
  *(_QWORD *)(v7 + 80) = *(_QWORD *)(v8 - 8);
  *(_QWORD *)(v7 + 88) = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_2158F2B8C()
{
  uint64_t v0;
  NSObject *v1;
  os_signpost_type_t v2;
  uint64_t result;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, _QWORD, uint64_t);
  uint8_t *v10;
  os_signpost_id_t v11;
  _QWORD *v12;
  uint64_t v13;

  v1 = sub_2158FEEC4();
  v2 = sub_2158FF098();
  result = sub_2158FF0A4();
  if ((result & 1) == 0)
    goto LABEL_5;
  v4 = *(const char **)(v0 + 32);
  if ((*(_BYTE *)(v0 + 120) & 1) == 0)
  {
    if (!v4)
    {
      __break(1u);
LABEL_5:
      v5 = *(_QWORD *)(v0 + 80);

      (*(void (**)(_QWORD, _QWORD, _QWORD))(v5 + 16))(*(_QWORD *)(v0 + 88), *(_QWORD *)(v0 + 48), *(_QWORD *)(v0 + 72));
LABEL_11:
      sub_2158FEF00();
      swift_allocObject();
      *(_QWORD *)(v0 + 96) = sub_2158FEEF4();
      v12 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 104) = v12;
      *v12 = v0;
      v12[1] = sub_2158F2D40;
      v13 = *(_QWORD *)(v0 + 64);
      v12[4] = *(_QWORD *)(v0 + 24);
      v12[5] = v13;
      return swift_task_switch();
    }
LABEL_10:
    v7 = *(_QWORD *)(v0 + 80);
    v6 = *(_QWORD *)(v0 + 88);
    v8 = *(_QWORD *)(v0 + 72);
    v9 = *(void (**)(uint64_t, _QWORD, uint64_t))(v7 + 16);
    v9(v6, *(_QWORD *)(v0 + 48), v8);
    v10 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v10 = 0;
    v11 = sub_2158FEEA0();
    _os_signpost_emit_with_name_impl(&dword_2158F0000, v1, v2, v11, v4, "", v10, 2u);
    MEMORY[0x2199E7E50](v10, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v6, v8);
    v9(*(_QWORD *)(v0 + 88), *(_QWORD *)(v0 + 48), *(_QWORD *)(v0 + 72));
    goto LABEL_11;
  }
  if ((unint64_t)v4 >> 32)
  {
    __break(1u);
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  if (v4 >> 11 != 27)
  {
    if (v4 >> 16 <= 0x10)
    {
      v4 = (const char *)(v0 + 16);
      goto LABEL_10;
    }
    goto LABEL_13;
  }
LABEL_14:
  __break(1u);
  return result;
}

uint64_t sub_2158F2D40()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 112) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_2158F2DA4()
{
  uint64_t v0;

  sub_2158F9F2C(*(_QWORD *)(v0 + 56), *(const char **)(v0 + 32), *(unsigned __int8 *)(v0 + 120));
  swift_release();
  swift_release();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2158F2E08()
{
  uint64_t v0;

  sub_2158F9F2C(*(_QWORD *)(v0 + 56), *(const char **)(v0 + 32), *(unsigned __int8 *)(v0 + 120));
  swift_release();
  swift_release();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2158F2E6C(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  uint64_t v8;

  *(_QWORD *)(v7 + 56) = a6;
  *(_QWORD *)(v7 + 64) = a7;
  *(_BYTE *)(v7 + 120) = a4;
  *(_QWORD *)(v7 + 40) = a3;
  *(_QWORD *)(v7 + 48) = a5;
  *(_QWORD *)(v7 + 24) = a1;
  *(_QWORD *)(v7 + 32) = a2;
  v8 = sub_2158FEEAC();
  *(_QWORD *)(v7 + 72) = v8;
  *(_QWORD *)(v7 + 80) = *(_QWORD *)(v8 - 8);
  *(_QWORD *)(v7 + 88) = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_2158F2ED8()
{
  uint64_t v0;
  NSObject *v1;
  os_signpost_type_t v2;
  uint64_t result;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, _QWORD, uint64_t);
  uint8_t *v10;
  os_signpost_id_t v11;
  _QWORD *v12;
  uint64_t v13;

  v1 = sub_2158FEEC4();
  v2 = sub_2158FF098();
  result = sub_2158FF0A4();
  if ((result & 1) == 0)
    goto LABEL_5;
  v4 = *(const char **)(v0 + 32);
  if ((*(_BYTE *)(v0 + 120) & 1) == 0)
  {
    if (!v4)
    {
      __break(1u);
LABEL_5:
      v5 = *(_QWORD *)(v0 + 80);

      (*(void (**)(_QWORD, _QWORD, _QWORD))(v5 + 16))(*(_QWORD *)(v0 + 88), *(_QWORD *)(v0 + 48), *(_QWORD *)(v0 + 72));
LABEL_11:
      sub_2158FEF00();
      swift_allocObject();
      *(_QWORD *)(v0 + 96) = sub_2158FEEF4();
      v12 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 104) = v12;
      *v12 = v0;
      v12[1] = sub_2158F308C;
      v13 = *(_QWORD *)(v0 + 64);
      v12[4] = *(_QWORD *)(v0 + 24);
      v12[5] = v13;
      return swift_task_switch();
    }
LABEL_10:
    v7 = *(_QWORD *)(v0 + 80);
    v6 = *(_QWORD *)(v0 + 88);
    v8 = *(_QWORD *)(v0 + 72);
    v9 = *(void (**)(uint64_t, _QWORD, uint64_t))(v7 + 16);
    v9(v6, *(_QWORD *)(v0 + 48), v8);
    v10 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v10 = 0;
    v11 = sub_2158FEEA0();
    _os_signpost_emit_with_name_impl(&dword_2158F0000, v1, v2, v11, v4, "", v10, 2u);
    MEMORY[0x2199E7E50](v10, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v6, v8);
    v9(*(_QWORD *)(v0 + 88), *(_QWORD *)(v0 + 48), *(_QWORD *)(v0 + 72));
    goto LABEL_11;
  }
  if ((unint64_t)v4 >> 32)
  {
    __break(1u);
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  if (v4 >> 11 != 27)
  {
    if (v4 >> 16 <= 0x10)
    {
      v4 = (const char *)(v0 + 16);
      goto LABEL_10;
    }
    goto LABEL_13;
  }
LABEL_14:
  __break(1u);
  return result;
}

uint64_t sub_2158F308C()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 112) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_2158F30F0()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 64);
  sub_2158F9F2C(*(_QWORD *)(v0 + 56), *(const char **)(v0 + 32), *(unsigned __int8 *)(v0 + 120));
  swift_release();

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2158F3150()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 64);
  sub_2158F9F2C(*(_QWORD *)(v0 + 56), *(const char **)(v0 + 32), *(unsigned __int8 *)(v0 + 120));
  swift_release();

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2158F31B0(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  uint64_t v8;

  *(_QWORD *)(v7 + 56) = a6;
  *(_QWORD *)(v7 + 64) = a7;
  *(_BYTE *)(v7 + 120) = a4;
  *(_QWORD *)(v7 + 40) = a3;
  *(_QWORD *)(v7 + 48) = a5;
  *(_QWORD *)(v7 + 24) = a1;
  *(_QWORD *)(v7 + 32) = a2;
  v8 = sub_2158FEEAC();
  *(_QWORD *)(v7 + 72) = v8;
  *(_QWORD *)(v7 + 80) = *(_QWORD *)(v8 - 8);
  *(_QWORD *)(v7 + 88) = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_2158F321C()
{
  uint64_t v0;
  NSObject *v1;
  os_signpost_type_t v2;
  uint64_t result;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, _QWORD, uint64_t);
  uint8_t *v10;
  os_signpost_id_t v11;
  _QWORD *v12;
  uint64_t v13;

  v1 = sub_2158FEEC4();
  v2 = sub_2158FF098();
  result = sub_2158FF0A4();
  if ((result & 1) == 0)
    goto LABEL_5;
  v4 = *(const char **)(v0 + 32);
  if ((*(_BYTE *)(v0 + 120) & 1) == 0)
  {
    if (!v4)
    {
      __break(1u);
LABEL_5:
      v5 = *(_QWORD *)(v0 + 80);

      (*(void (**)(_QWORD, _QWORD, _QWORD))(v5 + 16))(*(_QWORD *)(v0 + 88), *(_QWORD *)(v0 + 48), *(_QWORD *)(v0 + 72));
LABEL_11:
      sub_2158FEF00();
      swift_allocObject();
      *(_QWORD *)(v0 + 96) = sub_2158FEEF4();
      v12 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 104) = v12;
      *v12 = v0;
      v12[1] = sub_2158F33D0;
      v13 = *(_QWORD *)(v0 + 64);
      v12[4] = *(_QWORD *)(v0 + 24);
      v12[5] = v13;
      return swift_task_switch();
    }
LABEL_10:
    v7 = *(_QWORD *)(v0 + 80);
    v6 = *(_QWORD *)(v0 + 88);
    v8 = *(_QWORD *)(v0 + 72);
    v9 = *(void (**)(uint64_t, _QWORD, uint64_t))(v7 + 16);
    v9(v6, *(_QWORD *)(v0 + 48), v8);
    v10 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v10 = 0;
    v11 = sub_2158FEEA0();
    _os_signpost_emit_with_name_impl(&dword_2158F0000, v1, v2, v11, v4, "", v10, 2u);
    MEMORY[0x2199E7E50](v10, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v6, v8);
    v9(*(_QWORD *)(v0 + 88), *(_QWORD *)(v0 + 48), *(_QWORD *)(v0 + 72));
    goto LABEL_11;
  }
  if ((unint64_t)v4 >> 32)
  {
    __break(1u);
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  if (v4 >> 11 != 27)
  {
    if (v4 >> 16 <= 0x10)
    {
      v4 = (const char *)(v0 + 16);
      goto LABEL_10;
    }
    goto LABEL_13;
  }
LABEL_14:
  __break(1u);
  return result;
}

uint64_t sub_2158F33D0()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 112) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t CarKeyRemoteControl.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t CarKeyRemoteControl.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t sub_2158F344C(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

id sub_2158F36F0()
{
  return sub_2158F9AD4(type metadata accessor for RKESessionDelegate);
}

id sub_2158F370C()
{
  _QWORD *v0;
  void *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint8_t *v11;
  NSObject *v12;
  os_signpost_type_t v13;
  os_signpost_id_t v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  _BYTE *v24;
  id v25;
  id v26;
  uint64_t v27;
  _BYTE *v28;
  os_signpost_type_t v29;
  os_signpost_id_t v30;
  uint64_t v31;
  _BYTE *v32;
  uint64_t v34;
  NSObject *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  id v40;

  v2 = v0;
  v3 = sub_2158FEEAC();
  v37 = *(_QWORD *)(v3 - 8);
  v38 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v34 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_2158FEED0();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v34 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_254DE9D80 != -1)
    swift_once();
  v10 = __swift_project_value_buffer(v6, (uint64_t)qword_254DE9D88);
  v36 = v7;
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, v10, v6);
  sub_2158FEEC4();
  sub_2158FEE94();
  v11 = (uint8_t *)swift_slowAlloc();
  *(_WORD *)v11 = 0;
  v12 = sub_2158FEEC4();
  v13 = sub_2158FF098();
  v14 = sub_2158FEEA0();
  _os_signpost_emit_with_name_impl(&dword_2158F0000, v12, v13, v14, "Get Vehicle Reports", "", v11, 2u);
  v15 = (void *)v0[12];
  if (v15)
  {
    v40 = 0;
    v16 = v15;
    v17 = objc_msgSend(v16, sel_getVehicleReports_, &v40);
    v18 = v40;
    if (!v17)
    {
      v25 = v40;
      v22 = (void *)sub_2158FEE70();

      swift_willThrow();
LABEL_10:
      v40 = v22;
      v26 = v22;
      __swift_instantiateConcreteTypeFromMangledName(&qword_254DE96F0);
      sub_2158FECC0(0, &qword_254DE96F8);
      if (swift_dynamicCast())
      {
        v2 = v39;
        if (objc_msgSend(v39, sel_code) == (id)12)
        {

          sub_2158FA180();
          v27 = swift_allocError();
          *v28 = 3;
          swift_willThrow();

          if (!v27)
            goto LABEL_15;
LABEL_18:

          (*(void (**)(char *, uint64_t))(v37 + 8))(v5, v38);
          (*(void (**)(char *, uint64_t))(v36 + 8))(v9, v6);
          return v2;
        }

      }
      sub_2158FA180();
      v31 = swift_allocError();
      *v32 = 0;
      swift_willThrow();

      if (!v31)
        goto LABEL_15;
      goto LABEL_18;
    }
    v2 = v17;
    v35 = v12;
    sub_2158FECC0(0, &qword_254DE9CB0);
    v19 = sub_2158FEF6C();
    v20 = v18;

    v21 = sub_2158F3B54(v19);
    v22 = v1;
    if (v1)
    {
      swift_bridgeObjectRelease();
      v12 = v35;
      goto LABEL_10;
    }
    v2 = (id)v21;

    swift_bridgeObjectRelease();
    v12 = v35;
  }
  else
  {
    sub_2158FA180();
    v23 = swift_allocError();
    *v24 = 3;
    swift_willThrow();
    if (v23)
      goto LABEL_18;
  }
LABEL_15:
  v29 = sub_2158FF08C();
  v30 = sub_2158FEEA0();
  _os_signpost_emit_with_name_impl(&dword_2158F0000, v12, v29, v30, "Get Vehicle Reports", "", v11, 2u);

  MEMORY[0x2199E7E50](v11, -1, -1);
  (*(void (**)(char *, uint64_t))(v37 + 8))(v5, v38);
  (*(void (**)(char *, uint64_t))(v36 + 8))(v9, v6);
  return v2;
}

uint64_t sub_2158F3B54(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int64_t v11;
  int64_t v12;
  unint64_t v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  id v20;
  unint64_t v21;
  id v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  uint64_t v35;
  int64_t v36;
  int v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char v46;
  uint64_t v47;
  unint64_t v48;
  unint64_t v49;
  uint64_t v50;

  v2 = v1;
  v3 = *(_QWORD *)(a1 + 16);
  v4 = MEMORY[0x24BEE4AF8];
  if (!v3)
    return v4;
  v5 = a1;
  v50 = MEMORY[0x24BEE4AF8];
  sub_2158FC128(0, v3, 0);
  v4 = v50;
  result = sub_2158FCD1C(v5);
  v8 = result;
  v9 = 0;
  v10 = v5 + 64;
  v35 = v5 + 80;
  v36 = v3;
  v37 = v7;
  v38 = v5 + 64;
  v39 = v5;
  while ((v8 & 0x8000000000000000) == 0 && v8 < 1 << *(_BYTE *)(v5 + 32))
  {
    v13 = (unint64_t)v8 >> 6;
    if ((*(_QWORD *)(v10 + 8 * ((unint64_t)v8 >> 6)) & (1 << v8)) == 0)
      goto LABEL_23;
    if (*(_DWORD *)(v5 + 36) != v7)
      goto LABEL_24;
    v40 = v9;
    v14 = *(id *)(*(_QWORD *)(v5 + 56) + 8 * v8);
    swift_bridgeObjectRetain();
    v15 = objc_msgSend(v14, sel_readerIdentifier);
    v16 = sub_2158FEF84();
    v18 = v17;

    v44 = v16;
    v45 = v18;
    v46 = 0;
    v19 = (_QWORD *)MEMORY[0x24BEE4AF8];
    v47 = MEMORY[0x24BEE4AF8];
    v48 = sub_2158FD20C(MEMORY[0x24BEE4AF8]);
    v49 = sub_2158FD2E0(v19);
    v20 = objc_msgSend(v14, sel_getSupportedRKEFunctions);
    sub_2158FECC0(0, &qword_254DE9CB8);
    v21 = sub_2158FEFA8();

    v22 = v14;
    v43 = sub_2158FD3E0(v21, v22, (uint64_t)&v44);
    v41 = v2;
    swift_bridgeObjectRelease();

    swift_bridgeObjectRelease();
    v23 = v48;
    v42 = *(_QWORD *)(v48 + 16);

    result = swift_bridgeObjectRelease();
    v25 = v44;
    v24 = v45;
    v26 = v49;
    v50 = v4;
    v28 = *(_QWORD *)(v4 + 16);
    v27 = *(_QWORD *)(v4 + 24);
    if (v28 >= v27 >> 1)
    {
      result = sub_2158FC128(v27 > 1, v28 + 1, 1);
      v4 = v50;
    }
    *(_QWORD *)(v4 + 16) = v28 + 1;
    v29 = v4 + 48 * v28;
    *(_QWORD *)(v29 + 32) = v25;
    *(_QWORD *)(v29 + 40) = v24;
    *(_BYTE *)(v29 + 48) = v42 != 0;
    *(_QWORD *)(v29 + 56) = v43;
    *(_QWORD *)(v29 + 64) = v23;
    *(_QWORD *)(v29 + 72) = v26;
    v5 = v39;
    v11 = 1 << *(_BYTE *)(v39 + 32);
    if (v8 >= v11)
      goto LABEL_25;
    v10 = v38;
    v30 = *(_QWORD *)(v38 + 8 * v13);
    if ((v30 & (1 << v8)) == 0)
      goto LABEL_26;
    v7 = v37;
    if (*(_DWORD *)(v39 + 36) != v37)
      goto LABEL_27;
    v31 = v30 & (-2 << (v8 & 0x3F));
    if (v31)
    {
      v11 = __clz(__rbit64(v31)) | v8 & 0xFFFFFFFFFFFFFFC0;
      v2 = v41;
      v12 = v36;
    }
    else
    {
      v32 = v13 + 1;
      v33 = (unint64_t)(v11 + 63) >> 6;
      v2 = v41;
      v12 = v36;
      if (v13 + 1 < v33)
      {
        v34 = *(_QWORD *)(v38 + 8 * v32);
        if (v34)
        {
LABEL_20:
          v11 = __clz(__rbit64(v34)) + (v32 << 6);
        }
        else
        {
          while (v33 - 2 != v13)
          {
            v34 = *(_QWORD *)(v35 + 8 * v13++);
            if (v34)
            {
              v32 = v13 + 1;
              goto LABEL_20;
            }
          }
        }
      }
    }
    v9 = v40 + 1;
    v8 = v11;
    if (v40 + 1 == v12)
      return v4;
  }
  __break(1u);
LABEL_23:
  __break(1u);
LABEL_24:
  __break(1u);
LABEL_25:
  __break(1u);
LABEL_26:
  __break(1u);
LABEL_27:
  __break(1u);
  return result;
}

uint64_t sub_2158F3EA4()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 112) = v0;
  return swift_task_switch();
}

uint64_t sub_2158F3EBC()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t inited;
  uint64_t v6;
  _QWORD *v7;

  v0[12] = 0;
  v1 = v0[14];
  if ((*(_BYTE *)(v1 + 32) & 1) == 0)
  {
    v4 = v1 + 16;
    v3 = *(_QWORD *)(v1 + 16);
    v2 = *(_QWORD *)(v4 + 8);
    __swift_instantiateConcreteTypeFromMangledName(&qword_254DE9C50);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_2158FF700;
    *(_QWORD *)(inited + 32) = 0x61745365676E6172;
    *(_QWORD *)(inited + 40) = 0xEA00000000007472;
    *(_QWORD *)(inited + 48) = v3;
    *(_QWORD *)(inited + 56) = 0x646E4565676E6172;
    *(_QWORD *)(inited + 64) = 0xE800000000000000;
    *(_QWORD *)(inited + 72) = v2;
    v0[12] = sub_2158F40E0(inited);
    v1 = v0[14];
  }
  v6 = swift_task_alloc();
  v0[15] = v6;
  *(_QWORD *)(v6 + 16) = v0 + 12;
  *(_QWORD *)(v6 + 24) = v1;
  v7 = (_QWORD *)swift_task_alloc();
  v0[16] = v7;
  sub_2158FECC0(0, &qword_254DE9C48);
  *v7 = v0;
  v7[1] = sub_2158F3FF4;
  return sub_2158FF188();
}

uint64_t sub_2158F3FF4()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 136) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_2158F4060()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(v0 + 112);
  v2 = *(void **)(v1 + 96);
  *(_QWORD *)(v1 + 96) = *(_QWORD *)(v0 + 104);

  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2158F40A4()
{
  uint64_t v0;

  swift_task_dealloc();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

unint64_t sub_2158F40E0(uint64_t a1)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_254DE9C58);
  v2 = (_QWORD *)sub_2158FF164();
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
    result = sub_2158FBDFC(v5, v6);
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
    v4 += 3;
    v2[2] = v13;
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

void sub_2158F41F0(uint64_t a1, void **a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  _QWORD aBlock[6];

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DE9C60);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(_QWORD *)(v7 + 64);
  MEMORY[0x24BDAC7A8](v6);
  v9 = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
  v10 = *a2;
  if (v10)
  {
    v11 = swift_bridgeObjectRetain();
    sub_2158F43DC(v11);
    swift_bridgeObjectRelease();
    v10 = (void *)sub_2158FEF60();
    swift_bridgeObjectRelease();
  }
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)aBlock - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v6);
  v12 = (*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  v13 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v13 + v12, (char *)aBlock - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v6);
  *(_QWORD *)(v13 + ((v8 + v12 + 7) & 0xFFFFFFFFFFFFFFF8)) = a3;
  aBlock[4] = sub_2158FE3D0;
  aBlock[5] = v13;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_2158F4780;
  aBlock[3] = &block_descriptor;
  v14 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  v15 = objc_msgSend(v9, sel_startRKESessionWithOptions_startCallback_, v10, v14);
  _Block_release(v14);
  swift_unknownObjectRelease();

}

uint64_t sub_2158F43DC(uint64_t a1)
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
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  char v22;
  unint64_t v23;
  BOOL v24;
  uint64_t v25;
  int64_t v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint64_t v34;
  _OWORD v35[2];
  _OWORD v36[2];

  if (*(_QWORD *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_254DE9C68);
    v2 = sub_2158FF164();
  }
  else
  {
    v2 = MEMORY[0x24BEE4B00];
  }
  v27 = a1 + 64;
  v3 = -1 << *(_BYTE *)(a1 + 32);
  if (-v3 < 64)
    v4 = ~(-1 << -(char)v3);
  else
    v4 = -1;
  v5 = v4 & *(_QWORD *)(a1 + 64);
  v26 = (unint64_t)(63 - v3) >> 6;
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
    if (v13 >= v26)
      goto LABEL_37;
    v14 = *(_QWORD *)(v27 + 8 * v13);
    v15 = v8 + 1;
    if (!v14)
    {
      v15 = v8 + 2;
      if (v8 + 2 >= v26)
        goto LABEL_37;
      v14 = *(_QWORD *)(v27 + 8 * v15);
      if (!v14)
      {
        v15 = v8 + 3;
        if (v8 + 3 >= v26)
          goto LABEL_37;
        v14 = *(_QWORD *)(v27 + 8 * v15);
        if (!v14)
        {
          v15 = v8 + 4;
          if (v8 + 4 >= v26)
            goto LABEL_37;
          v14 = *(_QWORD *)(v27 + 8 * v15);
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
    v17 = (_QWORD *)(*(_QWORD *)(a1 + 48) + 16 * v12);
    v18 = v17[1];
    *(_QWORD *)&v36[0] = *v17;
    *((_QWORD *)&v36[0] + 1) = v18;
    swift_bridgeObjectRetain();
    swift_dynamicCast();
    swift_dynamicCast();
    v32 = v28;
    v33 = v29;
    v34 = v30;
    sub_2158FE54C(&v31, v35);
    v28 = v32;
    v29 = v33;
    v30 = v34;
    sub_2158FE54C(v35, v36);
    sub_2158FE54C(v36, &v32);
    result = sub_2158FF0E0();
    v19 = -1 << *(_BYTE *)(v2 + 32);
    v20 = result & ~v19;
    v21 = v20 >> 6;
    if (((-1 << v20) & ~*(_QWORD *)(v6 + 8 * (v20 >> 6))) != 0)
    {
      v9 = __clz(__rbit64((-1 << v20) & ~*(_QWORD *)(v6 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v22 = 0;
      v23 = (unint64_t)(63 - v19) >> 6;
      do
      {
        if (++v21 == v23 && (v22 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        v24 = v21 == v23;
        if (v21 == v23)
          v21 = 0;
        v22 |= v24;
        v25 = *(_QWORD *)(v6 + 8 * v21);
      }
      while (v25 == -1);
      v9 = __clz(__rbit64(~v25)) + (v21 << 6);
    }
    *(_QWORD *)(v6 + ((v9 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v9;
    v10 = *(_QWORD *)(v2 + 48) + 40 * v9;
    *(_OWORD *)v10 = v28;
    *(_OWORD *)(v10 + 16) = v29;
    *(_QWORD *)(v10 + 32) = v30;
    result = (uint64_t)sub_2158FE54C(&v32, (_OWORD *)(*(_QWORD *)(v2 + 56) + 32 * v9));
    ++*(_QWORD *)(v2 + 16);
  }
  v16 = v8 + 5;
  if (v8 + 5 >= v26)
  {
LABEL_37:
    swift_release();
    sub_2158FE55C();
    return v2;
  }
  v14 = *(_QWORD *)(v27 + 8 * v16);
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
    if (v15 >= v26)
      goto LABEL_37;
    v14 = *(_QWORD *)(v27 + 8 * v15);
    ++v16;
    if (v14)
      goto LABEL_27;
  }
LABEL_39:
  __break(1u);
  return result;
}

void sub_2158F4780(uint64_t a1, void *a2, void *a3)
{
  void (*v5)(void *, void *);
  id v6;
  id v7;

  v5 = *(void (**)(void *, void *))(a1 + 32);
  swift_retain();
  v7 = a2;
  v6 = a3;
  v5(a2, a3);
  swift_release();

}

uint64_t sub_2158F47F4()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint8_t *v8;
  NSObject *v9;
  os_signpost_type_t v10;
  os_signpost_id_t v11;
  void *v12;
  os_signpost_type_t v13;
  os_signpost_id_t v14;
  _BYTE *v16;
  _QWORD v17[2];
  uint64_t v18;

  v18 = sub_2158FEEAC();
  v0 = *(_QWORD *)(v18 - 8);
  MEMORY[0x24BDAC7A8](v18);
  v2 = (char *)v17 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_2158FEED0();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_254DE9D80 != -1)
    swift_once();
  v7 = __swift_project_value_buffer(v3, (uint64_t)qword_254DE9D88);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v7, v3);
  sub_2158FEEC4();
  sub_2158FEE94();
  v8 = (uint8_t *)swift_slowAlloc();
  *(_WORD *)v8 = 0;
  v9 = sub_2158FEEC4();
  v10 = sub_2158FF098();
  v11 = sub_2158FEEA0();
  _os_signpost_emit_with_name_impl(&dword_2158F0000, v9, v10, v11, "End Session", "", v8, 2u);
  v12 = *(void **)(v17[1] + 96);
  if (v12)
  {
    objc_msgSend(v12, sel_endSession);
    v13 = sub_2158FF08C();
    v14 = sub_2158FEEA0();
    _os_signpost_emit_with_name_impl(&dword_2158F0000, v9, v13, v14, "End Session", "", v8, 2u);

    MEMORY[0x2199E7E50](v8, -1, -1);
  }
  else
  {
    sub_2158FA180();
    swift_allocError();
    *v16 = 3;
    swift_willThrow();

  }
  (*(void (**)(char *, uint64_t))(v0 + 8))(v2, v18);
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t sub_2158F4A50(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint8_t *v14;
  uint64_t v15;
  NSObject *v16;
  os_signpost_type_t v17;
  os_signpost_id_t v18;
  void *v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  os_signpost_type_t v26;
  os_signpost_id_t v27;
  _BYTE *v28;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DE96B8);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v30 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v37 = sub_2158FEEAC();
  v36 = *(_QWORD *)(v37 - 8);
  MEMORY[0x24BDAC7A8](v37);
  v6 = (char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_2158FEED0();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v30 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = *a1;
  v32 = a1[1];
  v33 = v11;
  v12 = a1[3];
  v31 = a1[2];
  if (qword_254DE9D80 != -1)
    swift_once();
  v13 = __swift_project_value_buffer(v7, (uint64_t)qword_254DE9D88);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, v13, v7);
  sub_2158FEEC4();
  sub_2158FEE94();
  v14 = (uint8_t *)swift_slowAlloc();
  *(_WORD *)v14 = 0;
  v15 = sub_2158FEEC4();
  v35 = v8;
  v16 = v15;
  v17 = sub_2158FF098();
  v18 = sub_2158FEEA0();
  _os_signpost_emit_with_name_impl(&dword_2158F0000, v16, v17, v18, "Perform Remote Keyless Entry Action", "", v14, 2u);
  v19 = *(void **)(v34 + 96);
  if (v19)
  {
    v20 = sub_2158FEFE4();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 56))(v4, 1, 1, v20);
    v21 = (_QWORD *)swift_allocObject();
    v21[2] = 0;
    v21[3] = 0;
    v22 = v33;
    v21[4] = v19;
    v21[5] = v22;
    v23 = v31;
    v21[6] = v32;
    v21[7] = v23;
    v21[8] = v12;
    v24 = v19;
    swift_bridgeObjectRetain();
    v25 = sub_2158F4FA8((uint64_t)v4, (uint64_t)&unk_254DE96C8, (uint64_t)v21);
    type metadata accessor for RemoteKeylessEntryAction.ExecutionRequest();
    v12 = swift_allocObject();
    *(_QWORD *)(v12 + 16) = v25;
    v26 = sub_2158FF08C();
    v27 = sub_2158FEEA0();
    _os_signpost_emit_with_name_impl(&dword_2158F0000, v16, v26, v27, "Perform Remote Keyless Entry Action", "", v14, 2u);

    MEMORY[0x2199E7E50](v14, -1, -1);
  }
  else
  {
    sub_2158FA180();
    swift_allocError();
    *v28 = 3;
    swift_willThrow();

  }
  (*(void (**)(char *, uint64_t))(v36 + 8))(v6, v37);
  (*(void (**)(char *, uint64_t))(v35 + 8))(v10, v7);
  return v12;
}

uint64_t sub_2158F4DA0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v8;

  v8[20] = a7;
  v8[21] = a8;
  v8[18] = a5;
  v8[19] = a6;
  v8[16] = a1;
  v8[17] = a4;
  return swift_task_switch();
}

uint64_t sub_2158F4DC0()
{
  _QWORD *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;

  v1 = (void *)v0[17];
  v2 = sub_2158FF02C();
  v0[22] = v2;
  v3 = sub_2158FF02C();
  v0[23] = v3;
  v4 = sub_2158FEF78();
  v0[24] = v4;
  v0[7] = v0 + 15;
  v0[2] = v0;
  v0[3] = sub_2158F4EBC;
  v5 = swift_continuation_init();
  v0[10] = MEMORY[0x24BDAC760];
  v6 = v0 + 10;
  v6[1] = 0x40000000;
  v6[2] = sub_2158F4F1C;
  v6[3] = &block_descriptor_67;
  v6[4] = v5;
  objc_msgSend(v1, sel_sendRKEFunction_action_readerIdentifier_authorization_isEnduring_isHandlingExternal_completion_, v2, v3, v4, 0, 0, 0, v6);
  return swift_continuation_await();
}

uint64_t sub_2158F4EBC()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)v0 + 200) = *(_QWORD *)(*(_QWORD *)v0 + 48);
  return swift_task_switch();
}

uint64_t sub_2158F4F1C(uint64_t result, void *a2, void *a3)
{
  _QWORD *v4;
  id v5;
  id v6;

  if (a3)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_254DE96F0);
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

uint64_t sub_2158F4FA8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;

  v5 = sub_2158FEFE4();
  v6 = *(_QWORD *)(v5 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(a1, 1, v5) != 1)
  {
    sub_2158FEFD8();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
    if (!*(_QWORD *)(a3 + 16))
      return swift_task_create();
    goto LABEL_3;
  }
  sub_2158FEC84(a1, &qword_254DE96B8);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_2158FEFB4();
    swift_unknownObjectRelease();
  }
  return swift_task_create();
}

char *sub_2158F50D8(uint64_t *a1, unsigned __int8 *a2)
{
  uint64_t v2;
  uint64_t v3;
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
  uint8_t *v17;
  uint8_t *v18;
  NSObject *v19;
  os_signpost_type_t v20;
  os_signpost_id_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  char *v30;
  objc_class *ObjectType;
  char *v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  char *v36;
  objc_class *v37;
  char *v38;
  char *v39;
  id v40;
  char *v41;
  id v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  char *v46;
  os_signpost_id_t v47;
  os_signpost_type_t v48;
  NSObject *v49;
  uint8_t *v50;
  _BYTE *v51;
  uint64_t v53;
  char *v54;
  uint8_t *v55;
  int v56;
  uint64_t v57;
  uint64_t v58;
  NSObject *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  char *v63;
  _BYTE v64[40];
  _QWORD v65[5];
  objc_super v66;
  objc_super v67;
  uint64_t v68;

  v3 = v2;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DE96B8);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v53 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_2158FEEAC();
  v61 = *(_QWORD *)(v9 - 8);
  v62 = v9;
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v53 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_2158FEED0();
  v68 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v63 = (char *)&v53 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = *a1;
  v58 = a1[1];
  v15 = a1[3];
  v57 = a1[2];
  v56 = *a2;
  if (qword_254DE9D80 != -1)
    swift_once();
  v16 = __swift_project_value_buffer(v12, (uint64_t)qword_254DE9D88);
  (*(void (**)(char *, uint64_t, uint64_t))(v68 + 16))(v63, v16, v12);
  sub_2158FEEC4();
  sub_2158FEE94();
  v17 = (uint8_t *)swift_slowAlloc();
  v60 = v12;
  v18 = v17;
  *(_WORD *)v17 = 0;
  v19 = sub_2158FEEC4();
  v20 = sub_2158FF098();
  v21 = sub_2158FEEA0();
  v59 = v19;
  _os_signpost_emit_with_name_impl(&dword_2158F0000, v19, v20, v21, "Perform Remote Keyless Entry Enduring Action", "", v18, 2u);
  v22 = *(void **)(v3 + 96);
  if (v22)
  {
    v23 = sub_2158FEFE4();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 56))(v8, 1, 1, v23);
    v24 = swift_allocObject();
    *(_QWORD *)(v24 + 16) = 0;
    *(_QWORD *)(v24 + 24) = 0;
    *(_QWORD *)(v24 + 32) = v22;
    *(_QWORD *)(v24 + 40) = v14;
    v25 = v14;
    v55 = v18;
    v26 = v58;
    v54 = v11;
    v27 = v57;
    *(_QWORD *)(v24 + 48) = v58;
    *(_QWORD *)(v24 + 56) = v27;
    *(_QWORD *)(v24 + 64) = v15;
    *(_BYTE *)(v24 + 72) = v56;
    v28 = v22;
    swift_bridgeObjectRetain();
    v29 = sub_2158F4FA8((uint64_t)v8, (uint64_t)&unk_254DE96D8, v24);
    v30 = (char *)objc_allocWithZone((Class)type metadata accessor for RemoteKeylessEntryConfigurableEnduringAction.EnduringExecutionRequest());
    swift_bridgeObjectRetain();
    ObjectType = (objc_class *)swift_getObjectType();
    v32 = &v30[OBJC_IVAR____TtCV6CarKey44RemoteKeylessEntryConfigurableEnduringAction24EnduringExecutionRequest_currentEventStream];
    v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DE9730);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v33 - 8) + 56))(v32, 1, 1, v33);
    v34 = &v30[OBJC_IVAR____TtCV6CarKey44RemoteKeylessEntryConfigurableEnduringAction24EnduringExecutionRequest_currentEventStreamContinuation];
    v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DE9720);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v35 - 8) + 56))(v34, 1, 1, v35);
    v36 = &v30[OBJC_IVAR____TtCV6CarKey44RemoteKeylessEntryConfigurableEnduringAction24EnduringExecutionRequest_action];
    *(_QWORD *)v36 = v25;
    *((_QWORD *)v36 + 1) = v26;
    *((_QWORD *)v36 + 2) = v27;
    *((_QWORD *)v36 + 3) = v15;
    *(_QWORD *)&v30[OBJC_IVAR____TtCV6CarKey44RemoteKeylessEntryConfigurableEnduringAction24EnduringExecutionRequest_session] = v28;
    *(_QWORD *)&v30[OBJC_IVAR____TtCV6CarKey44RemoteKeylessEntryConfigurableEnduringAction24EnduringExecutionRequest_task] = v29;
    v37 = (objc_class *)type metadata accessor for SESRKESessionContinuationDelegateHandler();
    v38 = (char *)objc_allocWithZone(v37);
    v39 = &v38[OBJC_IVAR____TtC6CarKeyP33_86CE746C1DFB40AB47D6F76682ACEEE140SESRKESessionContinuationDelegateHandler_delegate];
    *(_OWORD *)v39 = 0u;
    *((_OWORD *)v39 + 1) = 0u;
    *((_QWORD *)v39 + 4) = 0;
    *(_QWORD *)&v38[OBJC_IVAR____TtC6CarKeyP33_86CE746C1DFB40AB47D6F76682ACEEE140SESRKESessionContinuationDelegateHandler_session] = v28;
    v67.receiver = v38;
    v67.super_class = v37;
    v40 = v28;
    v41 = v30;
    swift_retain();
    v42 = objc_msgSendSuper2(&v67, sel_init);
    objc_msgSend(v40, sel_setContinuationDelegate_, v42);
    *(_QWORD *)&v41[OBJC_IVAR____TtCV6CarKey44RemoteKeylessEntryConfigurableEnduringAction24EnduringExecutionRequest_continuationDelegateHandler] = v42;

    v66.receiver = v41;
    v66.super_class = ObjectType;
    v43 = (char *)objc_msgSendSuper2(&v66, sel_init);
    v44 = *(_QWORD *)&v43[OBJC_IVAR____TtCV6CarKey44RemoteKeylessEntryConfigurableEnduringAction24EnduringExecutionRequest_continuationDelegateHandler];
    v65[3] = ObjectType;
    v65[4] = &off_24D3B40D0;
    v65[0] = v43;
    sub_2158FED78((uint64_t)v65, (uint64_t)v64);
    v45 = v44
        + OBJC_IVAR____TtC6CarKeyP33_86CE746C1DFB40AB47D6F76682ACEEE140SESRKESessionContinuationDelegateHandler_delegate;
    swift_beginAccess();
    v8 = v43;
    sub_2158FEC40((uint64_t)v64, v45, &qword_254DE9C38);
    swift_endAccess();
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v65);
    swift_release();

    LOBYTE(v40) = sub_2158FF08C();
    v46 = v54;
    v47 = sub_2158FEEA0();
    v48 = v40;
    v49 = v59;
    v50 = v55;
    _os_signpost_emit_with_name_impl(&dword_2158F0000, v59, v48, v47, "Perform Remote Keyless Entry Enduring Action", "", v55, 2u);

    MEMORY[0x2199E7E50](v50, -1, -1);
    (*(void (**)(char *, uint64_t))(v61 + 8))(v46, v62);
  }
  else
  {
    sub_2158FA180();
    swift_allocError();
    *v51 = 3;
    swift_willThrow();

    (*(void (**)(char *, uint64_t))(v61 + 8))(v11, v62);
  }
  (*(void (**)(char *, uint64_t))(v68 + 8))(v63, v60);
  return v8;
}

uint64_t sub_2158F565C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  char v10;

  *(_BYTE *)(v8 + 208) = v10;
  *(_QWORD *)(v8 + 160) = a7;
  *(_QWORD *)(v8 + 168) = a8;
  *(_QWORD *)(v8 + 144) = a5;
  *(_QWORD *)(v8 + 152) = a6;
  *(_QWORD *)(v8 + 128) = a1;
  *(_QWORD *)(v8 + 136) = a4;
  return swift_task_switch();
}

uint64_t sub_2158F5688()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;

  v1 = *(void **)(v0 + 136);
  v2 = *(_BYTE *)(v0 + 208) & 1;
  v3 = sub_2158FF02C();
  *(_QWORD *)(v0 + 176) = v3;
  v4 = sub_2158FF02C();
  *(_QWORD *)(v0 + 184) = v4;
  v5 = sub_2158FEF78();
  *(_QWORD *)(v0 + 192) = v5;
  *(_QWORD *)(v0 + 56) = v0 + 120;
  *(_QWORD *)(v0 + 16) = v0;
  *(_QWORD *)(v0 + 24) = sub_2158F5794;
  v6 = swift_continuation_init();
  *(_QWORD *)(v0 + 80) = MEMORY[0x24BDAC760];
  v7 = (_QWORD *)(v0 + 80);
  v7[1] = 0x40000000;
  v7[2] = sub_2158F4F1C;
  v7[3] = &block_descriptor_65;
  v7[4] = v6;
  objc_msgSend(v1, sel_sendRKEFunction_action_readerIdentifier_authorization_isEnduring_isHandlingExternal_completion_, v3, v4, v5, 0, 1, v2, v7);
  return swift_continuation_await();
}

uint64_t sub_2158F5794()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)v0 + 200) = *(_QWORD *)(*(_QWORD *)v0 + 48);
  return swift_task_switch();
}

uint64_t sub_2158F57F4()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t *v4;
  uint64_t v5;

  v1 = *(void **)(v0 + 184);
  v2 = *(void **)(v0 + 176);
  v3 = *(void **)(v0 + 120);
  v4 = *(uint64_t **)(v0 + 128);

  v5 = sub_2158FF020();
  *v4 = v5;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2158F5854()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;

  v1 = *(void **)(v0 + 192);
  v3 = *(void **)(v0 + 176);
  v2 = *(void **)(v0 + 184);
  swift_willThrow();

  return (*(uint64_t (**)(void))(v0 + 8))();
}

BOOL static CarKeyRemoteControlSession.ContinuationStrategy.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

_QWORD *sub_2158F58C0(uint64_t *a1)
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
  uint64_t v14;
  uint8_t *v15;
  uint64_t v16;
  NSObject *v17;
  os_signpost_type_t v18;
  os_signpost_type_t v19;
  os_signpost_id_t v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD *v29;
  id v30;
  uint64_t v31;
  char *v32;
  os_signpost_id_t v33;
  os_log_t v34;
  _BYTE *v35;
  uint64_t v37;
  char *v38;
  os_log_t v39;
  uint64_t v40;
  char *v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DE96B8);
  MEMORY[0x24BDAC7A8](v3);
  v42 = (char *)&v37 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_2158FEEAC();
  v48 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v37 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_2158FEED0();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v37 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = *a1;
  v44 = a1[1];
  v45 = v12;
  v13 = a1[3];
  v43 = a1[2];
  if (qword_254DE9D80 != -1)
    swift_once();
  v14 = __swift_project_value_buffer(v8, (uint64_t)qword_254DE9D88);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, v14, v8);
  sub_2158FEEC4();
  sub_2158FEE94();
  v15 = (uint8_t *)swift_slowAlloc();
  *(_WORD *)v15 = 0;
  v16 = sub_2158FEEC4();
  v46 = v9;
  v17 = v16;
  v18 = sub_2158FF098();
  v47 = v8;
  v19 = v18;
  v20 = sub_2158FEEA0();
  _os_signpost_emit_with_name_impl(&dword_2158F0000, v17, v19, v20, "Perform Remote Keyless Entry Enduring Action", "", v15, 2u);
  v21 = *(_QWORD **)(v1 + 96);
  if (v21)
  {
    v22 = sub_2158FEFE4();
    v23 = (uint64_t)v42;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 56))(v42, 1, 1, v22);
    v24 = (_QWORD *)swift_allocObject();
    v24[2] = 0;
    v24[3] = 0;
    v41 = v11;
    v25 = v45;
    v24[4] = v21;
    v24[5] = v25;
    v38 = v7;
    v39 = v17;
    v26 = v13;
    v27 = v43;
    v28 = v44;
    v24[6] = v44;
    v24[7] = v27;
    v24[8] = v26;
    v29 = v21;
    v40 = v5;
    v30 = v29;
    swift_bridgeObjectRetain();
    v31 = sub_2158F4FA8(v23, (uint64_t)&unk_254DE96E8, (uint64_t)v24);
    type metadata accessor for RemoteKeylessEntryEnduringAction.EnduringExecutionRequest();
    v21 = (_QWORD *)swift_allocObject();
    v21[2] = v25;
    v21[3] = v28;
    v21[4] = v27;
    v21[5] = v26;
    v21[6] = v31;
    v21[7] = v30;
    swift_bridgeObjectRetain();
    LOBYTE(v30) = sub_2158FF08C();
    v32 = v38;
    v33 = sub_2158FEEA0();
    v34 = v39;
    _os_signpost_emit_with_name_impl(&dword_2158F0000, v39, (os_signpost_type_t)v30, v33, "Perform Remote Keyless Entry Enduring Action", "", v15, 2u);

    MEMORY[0x2199E7E50](v15, -1, -1);
    (*(void (**)(char *, uint64_t))(v48 + 8))(v32, v40);
    (*(void (**)(char *, uint64_t))(v46 + 8))(v41, v47);
  }
  else
  {
    sub_2158FA180();
    swift_allocError();
    *v35 = 3;
    swift_willThrow();

    (*(void (**)(char *, uint64_t))(v48 + 8))(v7, v5);
    (*(void (**)(char *, uint64_t))(v46 + 8))(v11, v47);
  }
  return v21;
}

uint64_t sub_2158F5C40(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v8;

  v8[20] = a7;
  v8[21] = a8;
  v8[18] = a5;
  v8[19] = a6;
  v8[16] = a1;
  v8[17] = a4;
  return swift_task_switch();
}

uint64_t sub_2158F5C60()
{
  _QWORD *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;

  v1 = (void *)v0[17];
  v2 = sub_2158FF02C();
  v0[22] = v2;
  v3 = sub_2158FF02C();
  v0[23] = v3;
  v4 = sub_2158FEF78();
  v0[24] = v4;
  v0[7] = v0 + 15;
  v0[2] = v0;
  v0[3] = sub_2158F4EBC;
  v5 = swift_continuation_init();
  v0[10] = MEMORY[0x24BDAC760];
  v6 = v0 + 10;
  v6[1] = 0x40000000;
  v6[2] = sub_2158F4F1C;
  v6[3] = &block_descriptor_63;
  v6[4] = v5;
  objc_msgSend(v1, sel_sendRKEFunction_action_readerIdentifier_authorization_isEnduring_isHandlingExternal_completion_, v2, v3, v4, 0, 1, 0, v6);
  return swift_continuation_await();
}

uint64_t sub_2158F5D5C(uint64_t a1, uint64_t a2, uint8_t *a3, uint8_t *a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  void (*v15)(char *, uint64_t, uint64_t);
  uint8_t *v16;
  NSObject *v17;
  os_signpost_type_t v18;
  os_signpost_id_t v19;
  void *v20;
  char *v21;
  id v22;
  void *v23;
  void *v24;
  unsigned __int8 v25;
  id v26;
  _BYTE *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  os_signpost_type_t v33;
  os_signpost_id_t v34;
  os_signpost_type_t v35;
  NSObject *v36;
  uint8_t *v37;
  id v39;
  void *v40;
  id v41;
  id v42;
  _BYTE *v43;
  _BYTE *v44;
  id v45;
  char *v46;
  char v47;
  id v48;
  uint8_t *v49[3];
  char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  NSObject *v55;
  id v56;
  id v57;

  v6 = v5;
  v49[1] = a3;
  v49[2] = a4;
  v7 = sub_2158FEEAC();
  v52 = *(_QWORD *)(v7 - 8);
  v53 = v7;
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)v49 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_2158FEED0();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)v49 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_254DE9D80 != -1)
    swift_once();
  v14 = __swift_project_value_buffer(v10, (uint64_t)qword_254DE9D88);
  v51 = v11;
  v15 = *(void (**)(char *, uint64_t, uint64_t))(v11 + 16);
  v54 = v10;
  v15(v13, v14, v10);
  sub_2158FEEC4();
  sub_2158FEE94();
  v16 = (uint8_t *)swift_slowAlloc();
  *(_WORD *)v16 = 0;
  v50 = v13;
  v17 = sub_2158FEEC4();
  v18 = sub_2158FF098();
  v19 = sub_2158FEEA0();
  v55 = v17;
  v49[0] = v16;
  _os_signpost_emit_with_name_impl(&dword_2158F0000, v17, v18, v19, "Send Passthrough Data", "", v16, 2u);
  v20 = *(void **)(v4 + 96);
  v21 = v9;
  if (!v20)
  {
    sub_2158FA180();
    v6 = swift_allocError();
    *v27 = 3;
    swift_willThrow();
    goto LABEL_7;
  }
  v22 = v20;
  v23 = (void *)sub_2158FEE7C();
  v24 = (void *)sub_2158FEF78();
  v57 = 0;
  v25 = objc_msgSend(v22, sel_sendPassthroughMessage_readerIdentifier_error_, v23, v24, &v57);

  if ((v25 & 1) != 0)
  {
    v26 = v57;

LABEL_7:
    v28 = v53;
    v29 = v54;
    goto LABEL_8;
  }
  v39 = v57;
  v40 = (void *)sub_2158FEE70();

  swift_willThrow();
  v57 = v40;
  v41 = v40;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254DE96F0);
  sub_2158FECC0(0, &qword_254DE96F8);
  if ((swift_dynamicCast() & 1) == 0)
  {
    v28 = v53;
    v29 = v54;
    goto LABEL_16;
  }
  v42 = v56;
  if (objc_msgSend(v42, sel_code) == (id)19)
  {

    sub_2158FA180();
    v6 = swift_allocError();
    *v43 = 6;
    swift_willThrow();

    goto LABEL_7;
  }
  v45 = objc_msgSend(v42, sel_code);
  v29 = v54;
  if (v45 != (id)12)
  {
    v48 = objc_msgSend(v42, sel_code);

    if (v48 == (id)1)
    {

      sub_2158FA180();
      v6 = swift_allocError();
      v47 = 7;
      goto LABEL_23;
    }
    if (objc_msgSend(v42, sel_code) == (id)13)
    {

      sub_2158FA180();
      v6 = swift_allocError();
      v47 = 1;
      goto LABEL_23;
    }

    v28 = v53;
LABEL_16:

    sub_2158FA180();
    v6 = swift_allocError();
    *v44 = 0;
    swift_willThrow();

    goto LABEL_8;
  }

  sub_2158FA180();
  v6 = swift_allocError();
  v47 = 3;
LABEL_23:
  *v46 = v47;
  swift_willThrow();

  v28 = v53;
LABEL_8:
  v31 = v51;
  v30 = v52;
  v32 = v50;
  if (v6)
  {

  }
  else
  {
    v33 = sub_2158FF08C();
    v34 = sub_2158FEEA0();
    v35 = v33;
    v36 = v55;
    v37 = v49[0];
    _os_signpost_emit_with_name_impl(&dword_2158F0000, v55, v35, v34, "Send Passthrough Data", "", v49[0], 2u);

    MEMORY[0x2199E7E50](v37, -1, -1);
  }
  (*(void (**)(char *, uint64_t))(v30 + 8))(v21, v28);
  return (*(uint64_t (**)(char *, uint64_t))(v31 + 8))(v32, v29);
}

uint64_t sub_2158F625C(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void (*v12)(char *, uint64_t, uint64_t);
  char *v13;
  char *v14;
  uint64_t v15;
  uint8_t *v16;
  NSObject *v17;
  os_signpost_id_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  void *v22;
  unsigned int v23;
  id v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  _BYTE *v28;
  char *v29;
  uint64_t v30;
  id v31;
  char v32;
  id v33;
  uint64_t v34;
  _BYTE *v35;
  uint64_t v36;
  _BYTE *v37;
  _BYTE *v38;
  os_signpost_type_t v39;
  os_signpost_id_t v40;
  os_signpost_type_t v41;
  uint8_t *v42;
  uint8_t *v44;
  id v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  char v50;
  id v51;
  id v52;

  v4 = v3;
  v5 = v2;
  v45 = a2;
  v47 = sub_2158FEEAC();
  v49 = *(_QWORD *)(v47 - 8);
  MEMORY[0x24BDAC7A8](v47);
  v7 = (char *)&v44 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_2158FEED0();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v44 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_254DE9D80 != -1)
    swift_once();
  v19 = __swift_project_value_buffer(v8, (uint64_t)qword_254DE9D88);
  v48 = v9;
  v12 = *(void (**)(char *, uint64_t, uint64_t))(v9 + 16);
  v13 = v11;
  v14 = v11;
  v15 = v8;
  v12(v13, v19, v8);
  sub_2158FEEC4();
  sub_2158FEE94();
  v16 = (uint8_t *)swift_slowAlloc();
  *(_WORD *)v16 = 0;
  v46 = v14;
  v17 = sub_2158FEEC4();
  LOBYTE(v14) = sub_2158FF098();
  v18 = sub_2158FEEA0();
  LOBYTE(v19) = (_BYTE)v17;
  v44 = v16;
  _os_signpost_emit_with_name_impl(&dword_2158F0000, v17, (os_signpost_type_t)v14, v18, "Querying Passive Entry Availability", "", v16, 2u);
  v20 = *(void **)(v5 + 96);
  if (!v20)
  {
    sub_2158FA180();
    v27 = swift_allocError();
    *v28 = 3;
    swift_willThrow();
    v26 = v15;
    v29 = v46;
    v30 = v47;
    if (!v27)
      goto LABEL_20;
    goto LABEL_15;
  }
  v21 = v20;
  LOBYTE(v51) = 0;
  v22 = (void *)sub_2158FEF78();
  v52 = 0;
  v23 = objc_msgSend(v21, sel_isPassiveEntryAvailable_isAvailable_error_, v22, &v51, &v52);

  if (v23)
  {
    LOBYTE(v24) = (_BYTE)v51;
    v25 = v52;
    v26 = v15;
    if (!v3)
      goto LABEL_16;
  }
  else
  {
    v24 = v52;
    v4 = (void *)sub_2158FEE70();

    swift_willThrow();
    v26 = v15;
    if (!v4)
    {
LABEL_16:
      v29 = v46;

      v50 = v24 & 1;
      v30 = v47;
      goto LABEL_20;
    }
  }
  v52 = v4;
  v31 = v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254DE96F0);
  sub_2158FECC0(0, &qword_254DE96F8);
  v32 = swift_dynamicCast();
  v29 = v46;
  if ((v32 & 1) != 0)
  {
    v45 = v51;
    v33 = objc_msgSend(v51, sel_code);
    v30 = v47;
    if (v33 == (id)19)
    {

      sub_2158FA180();
      v34 = swift_allocError();
      *v35 = 6;
      swift_willThrow();

      goto LABEL_19;
    }
    v19 = (uint64_t)v45;
    if (objc_msgSend(v45, sel_code) == (id)12)
    {

      sub_2158FA180();
      v34 = swift_allocError();
      *v38 = 3;
      swift_willThrow();

LABEL_19:
      if (!v34)
        goto LABEL_20;
      goto LABEL_15;
    }

  }
  else
  {
    v30 = v47;
  }

  sub_2158FA180();
  v36 = swift_allocError();
  *v37 = 0;
  swift_willThrow();

  if (!v36)
  {
LABEL_20:
    v39 = sub_2158FF08C();
    v40 = sub_2158FEEA0();
    v41 = v39;
    v42 = v44;
    _os_signpost_emit_with_name_impl(&dword_2158F0000, v17, v41, v40, "Querying Passive Entry Availability", "", v44, 2u);

    LOBYTE(v19) = v50;
    MEMORY[0x2199E7E50](v42, -1, -1);
    (*(void (**)(char *, uint64_t))(v49 + 8))(v7, v30);
    (*(void (**)(char *, uint64_t))(v48 + 8))(v29, v26);
    return v19 & 1;
  }
LABEL_15:

  (*(void (**)(char *, uint64_t))(v49 + 8))(v7, v30);
  (*(void (**)(char *, uint64_t))(v48 + 8))(v29, v26);
  return v19 & 1;
}

void sub_2158F6720(uint64_t *a1@<X8>)
{
  uint64_t v1;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _BYTE *v23;
  id v24;
  void *v25;
  id v26;
  id v27;
  char *v28;
  char v29;
  _BYTE *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  id v36[2];

  v36[1] = *(id *)MEMORY[0x24BDAC8D0];
  v3 = *(void **)(v1 + 96);
  if (!v3)
  {
    sub_2158FA180();
    swift_allocError();
    *v23 = 3;
    swift_willThrow();
    return;
  }
  v4 = v3;
  v5 = (void *)sub_2158FEE7C();
  v6 = (void *)sub_2158FEF78();
  v36[0] = 0;
  v7 = objc_msgSend(v4, sel_sign_readerIdentifier_error_, v5, v6, v36);

  if (v7)
  {
    v8 = v36[0];
    v9 = objc_msgSend(v7, sel_appBundleID);
    v10 = sub_2158FEF84();
    v33 = v11;
    v34 = v10;

    v12 = objc_msgSend(v7, sel_nonce);
    v13 = sub_2158FEE88();
    v31 = v14;
    v32 = v13;

    v15 = objc_msgSend(v7, sel_signedData);
    v16 = sub_2158FEE88();
    v18 = v17;

    v19 = objc_msgSend(v7, sel_signature);
    v20 = sub_2158FEE88();
    v22 = v21;

    *a1 = v34;
    a1[1] = v33;
    a1[2] = v32;
    a1[3] = v31;
    a1[4] = v16;
    a1[5] = v18;
    a1[6] = v20;
    a1[7] = v22;
    return;
  }
  v24 = v36[0];
  v25 = (void *)sub_2158FEE70();

  swift_willThrow();
  v36[0] = v25;
  v26 = v25;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254DE96F0);
  sub_2158FECC0(0, &qword_254DE96F8);
  if (swift_dynamicCast())
  {
    v27 = v35;
    if (objc_msgSend(v27, sel_code) == (id)12)
    {

      sub_2158FA180();
      swift_allocError();
      v29 = 3;
LABEL_12:
      *v28 = v29;
      swift_willThrow();

      return;
    }
    if (objc_msgSend(v27, sel_code) == (id)17)
    {

      sub_2158FA180();
      swift_allocError();
      v29 = 11;
      goto LABEL_12;
    }

    if (objc_msgSend(v27, sel_code) == (id)19)
    {

      sub_2158FA180();
      swift_allocError();
      v29 = 6;
      goto LABEL_12;
    }

  }
  sub_2158FA180();
  swift_allocError();
  *v30 = 0;
  swift_willThrow();

}

uint64_t CarKeyRemoteControlSession.Attestation.appBundleIdentifier.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t CarKeyRemoteControlSession.Attestation.nonce.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  sub_2158FA484(v1, *(_QWORD *)(v0 + 24));
  return v1;
}

uint64_t CarKeyRemoteControlSession.Attestation.signedData.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 32);
  sub_2158FA484(v1, *(_QWORD *)(v0 + 40));
  return v1;
}

uint64_t CarKeyRemoteControlSession.Attestation.signature.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 48);
  sub_2158FA484(v1, *(_QWORD *)(v0 + 56));
  return v1;
}

uint64_t CarKeyRemoteControlSession.ContinuationStrategy.hash(into:)()
{
  return sub_2158FF1E8();
}

uint64_t CarKeyRemoteControlSession.ContinuationStrategy.hashValue.getter()
{
  sub_2158FF1DC();
  sub_2158FF1E8();
  return sub_2158FF1F4();
}

BOOL sub_2158F6BFC(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_2158F6C14()
{
  sub_2158FF1DC();
  sub_2158FF1E8();
  return sub_2158FF1F4();
}

uint64_t sub_2158F6C58()
{
  return sub_2158FF1E8();
}

uint64_t sub_2158F6C80()
{
  sub_2158FF1DC();
  sub_2158FF1E8();
  return sub_2158FF1F4();
}

id *CarKeyRemoteControlSession.deinit()
{
  id *v0;

  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)(v0 + 5));

  return v0;
}

uint64_t CarKeyRemoteControlSession.__deallocating_deinit()
{
  id *v0;

  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)(v0 + 5));

  return swift_deallocClassInstance();
}

uint64_t VehicleReport.identifier.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t VehicleReport.isConnected.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 16);
}

uint64_t VehicleReport.supportedFunctions.getter()
{
  return swift_bridgeObjectRetain();
}

CarKey::FunctionStatus_optional __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> VehicleReport.status(for:)(CarKey::FunctionIdentifier a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(char *, uint64_t, uint64_t);
  uint8_t *v16;
  NSObject *v17;
  os_signpost_type_t v18;
  os_signpost_id_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  os_log_type_t v25;
  _BOOL4 v26;
  uint64_t v27;
  uint8_t *v28;
  uint64_t v29;
  _BYTE *v30;
  uint64_t v31;
  unint64_t v32;
  char v33;
  os_signpost_type_t v34;
  os_signpost_id_t v35;
  os_signpost_type_t v36;
  NSObject *v37;
  uint64_t *v38;
  Swift::Int v39;
  Swift::Bool v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  NSObject *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char v48;
  uint64_t v49;
  CarKey::FunctionStatus_optional result;

  v42 = v1;
  v5 = sub_2158FEEAC();
  v46 = *(_QWORD *)(v5 - 8);
  v47 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v41 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_2158FEED0();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v41 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = *(_QWORD *)a1.rawValue;
  v13 = *(_QWORD *)(v2 + 24);
  v41 = *(_QWORD *)(v2 + 32);
  if (qword_254DE9D80 != -1)
    swift_once();
  v14 = __swift_project_value_buffer(v8, (uint64_t)qword_254DE9D88);
  v45 = v9;
  v15 = *(void (**)(char *, uint64_t, uint64_t))(v9 + 16);
  v43 = v8;
  v15(v11, v14, v8);
  sub_2158FEEC4();
  sub_2158FEE94();
  v16 = (uint8_t *)swift_slowAlloc();
  *(_WORD *)v16 = 0;
  v17 = sub_2158FEEC4();
  v18 = sub_2158FF098();
  v19 = sub_2158FEEA0();
  v44 = v17;
  _os_signpost_emit_with_name_impl(&dword_2158F0000, v17, v18, v19, "Getting Function Status", "", v16, 2u);
  v20 = *(_QWORD *)(v13 + 16);
  if (!v20)
  {
LABEL_7:
    if (qword_254DE9D60 != -1)
      swift_once();
    v23 = sub_2158FEF30();
    __swift_project_value_buffer(v23, (uint64_t)qword_254DE9D68);
    v24 = sub_2158FEF18();
    v25 = sub_2158FF050();
    v26 = os_log_type_enabled(v24, v25);
    v27 = v43;
    if (v26)
    {
      v28 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)v28 = 134217984;
      v49 = v12;
      sub_2158FF0BC();
      _os_log_impl(&dword_2158F0000, v24, v25, "Unknown function %ld", v28, 0xCu);
      MEMORY[0x2199E7E50](v28, -1, -1);
    }

    sub_2158FA180();
    v29 = swift_allocError();
    *v30 = 4;
    swift_willThrow();
    if (!v29)
      goto LABEL_20;
    goto LABEL_18;
  }
  v21 = (uint64_t *)(v13 + 32);
  while (1)
  {
    v22 = *v21++;
    if (v22 == v12)
      break;
    if (!--v20)
      goto LABEL_7;
  }
  v31 = v41;
  if (!*(_QWORD *)(v41 + 16))
  {
    v12 = 0;
    v48 = 1;
    v27 = v43;
    if (v3)
      goto LABEL_18;
LABEL_20:
    v34 = sub_2158FF08C();
    v35 = sub_2158FEEA0();
    v36 = v34;
    v37 = v44;
    _os_signpost_emit_with_name_impl(&dword_2158F0000, v44, v36, v35, "Getting Function Status", "", v16, 2u);

    LOBYTE(v37) = v48;
    MEMORY[0x2199E7E50](v16, -1, -1);
    v38 = v42;
    *v42 = v12;
    *((_BYTE *)v38 + 8) = (_BYTE)v37;
    goto LABEL_21;
  }
  v32 = sub_2158FBE90(v12);
  v27 = v43;
  if ((v33 & 1) == 0)
  {
    v12 = 0;
    v48 = 1;
    if (v3)
      goto LABEL_18;
    goto LABEL_20;
  }
  v12 = *(_QWORD *)(*(_QWORD *)(v31 + 56) + 8 * v32);
  v48 = 0;
  if (!v3)
    goto LABEL_20;
LABEL_18:

LABEL_21:
  (*(void (**)(char *, uint64_t))(v46 + 8))(v7, v47);
  v39 = (*(uint64_t (**)(char *, uint64_t))(v45 + 8))(v11, v27);
  result.value.rawValue = v39;
  result.is_nil = v40;
  return result;
}

uint64_t VehicleReport.proprietaryData(for:)(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(char *, uint64_t, uint64_t);
  uint8_t *v15;
  NSObject *v16;
  os_signpost_type_t v17;
  os_signpost_id_t v18;
  NSObject *v19;
  uint8_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  os_log_type_t v26;
  _BOOL4 v27;
  uint64_t v28;
  uint8_t *v29;
  uint64_t v30;
  _BYTE *v31;
  uint64_t v32;
  unint64_t v33;
  char v34;
  uint64_t v35;
  os_signpost_type_t v36;
  os_signpost_id_t v37;
  os_signpost_type_t v38;
  NSObject *v39;
  uint64_t v41;
  uint64_t v42;
  NSObject *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;

  v4 = sub_2158FEEAC();
  v45 = *(_QWORD *)(v4 - 8);
  v46 = v4;
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v41 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_2158FEED0();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v41 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = *a1;
  v12 = *(_QWORD *)(v1 + 24);
  v41 = *(_QWORD *)(v1 + 40);
  if (qword_254DE9D80 != -1)
    swift_once();
  v13 = __swift_project_value_buffer(v7, (uint64_t)qword_254DE9D88);
  v44 = v8;
  v14 = *(void (**)(char *, uint64_t, uint64_t))(v8 + 16);
  v42 = v7;
  v14(v10, v13, v7);
  sub_2158FEEC4();
  sub_2158FEE94();
  v15 = (uint8_t *)swift_slowAlloc();
  *(_WORD *)v15 = 0;
  v16 = sub_2158FEEC4();
  v17 = sub_2158FF098();
  v18 = sub_2158FEEA0();
  v43 = v16;
  v19 = v16;
  v20 = v15;
  _os_signpost_emit_with_name_impl(&dword_2158F0000, v19, v17, v18, "Getting Function Proprietary Data", "", v15, 2u);
  v21 = *(_QWORD *)(v12 + 16);
  if (!v21)
  {
LABEL_7:
    if (qword_254DE9D60 != -1)
      swift_once();
    v24 = sub_2158FEF30();
    __swift_project_value_buffer(v24, (uint64_t)qword_254DE9D68);
    v25 = sub_2158FEF18();
    v26 = sub_2158FF050();
    v27 = os_log_type_enabled(v25, v26);
    v28 = v42;
    if (v27)
    {
      v12 = 12;
      v29 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)v29 = 134217984;
      v47 = v11;
      sub_2158FF0BC();
      _os_log_impl(&dword_2158F0000, v25, v26, "Unknown function %ld", v29, 0xCu);
      MEMORY[0x2199E7E50](v29, -1, -1);
    }

    sub_2158FA180();
    v30 = swift_allocError();
    *v31 = 4;
    swift_willThrow();
    if (!v30)
      goto LABEL_20;
    goto LABEL_18;
  }
  v22 = (uint64_t *)(v12 + 32);
  while (1)
  {
    v23 = *v22++;
    if (v23 == v11)
      break;
    if (!--v21)
      goto LABEL_7;
  }
  v32 = v41;
  if (!*(_QWORD *)(v41 + 16))
  {
    v12 = 0;
    v28 = v42;
    if (v2)
      goto LABEL_18;
LABEL_20:
    v36 = sub_2158FF08C();
    v37 = sub_2158FEEA0();
    v38 = v36;
    v39 = v43;
    _os_signpost_emit_with_name_impl(&dword_2158F0000, v43, v38, v37, "Getting Function Proprietary Data", "", v20, 2u);

    MEMORY[0x2199E7E50](v20, -1, -1);
    (*(void (**)(char *, uint64_t))(v45 + 8))(v6, v46);
    (*(void (**)(char *, uint64_t))(v44 + 8))(v10, v28);
    return v12;
  }
  v33 = sub_2158FBE90(v11);
  v28 = v42;
  if ((v34 & 1) == 0)
  {
    v12 = 0;
    if (v2)
      goto LABEL_18;
    goto LABEL_20;
  }
  v35 = *(_QWORD *)(v32 + 56) + 16 * v33;
  v12 = *(_QWORD *)v35;
  sub_2158FA484(*(_QWORD *)v35, *(_QWORD *)(v35 + 8));
  if (!v2)
    goto LABEL_20;
LABEL_18:

  (*(void (**)(char *, uint64_t))(v45 + 8))(v6, v46);
  (*(void (**)(char *, uint64_t))(v44 + 8))(v10, v28);
  return v12;
}

void RemoteKeylessEntryAction.functionID.getter(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

void RemoteKeylessEntryAction.actionID.getter(_QWORD *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_QWORD *)(v1 + 8);
}

uint64_t RemoteKeylessEntryAction.recipientVehicleID.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

CarKey::RemoteKeylessEntryAction __swiftcall RemoteKeylessEntryAction.init(functionID:actionID:vehicleID:)(CarKey::FunctionIdentifier functionID, CarKey::ActionIdentifier actionID, Swift::String vehicleID)
{
  Swift::String *v3;
  void *v4;
  CarKey::RemoteKeylessEntryAction result;

  v4 = *(void **)actionID.rawValue;
  v3->_countAndFlagsBits = *(_QWORD *)functionID.rawValue;
  v3->_object = v4;
  v3[1] = vehicleID;
  result.recipientVehicleID = vehicleID;
  result.actionID = actionID;
  result.functionID = functionID;
  return result;
}

uint64_t RemoteKeylessEntryAction.ExecutionRequest.results()(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;

  v2[2] = a1;
  v2[3] = v1;
  v3 = sub_2158FEEAC();
  v2[4] = v3;
  v2[5] = *(_QWORD *)(v3 - 8);
  v2[6] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_2158F75B0()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t (*v5)(uint64_t, uint64_t, uint64_t, char, uint64_t, uint64_t, uint64_t);

  if (qword_254DE9D80 != -1)
    swift_once();
  v1 = sub_2158FEED0();
  v2 = __swift_project_value_buffer(v1, (uint64_t)qword_254DE9D88);
  sub_2158FEEC4();
  sub_2158FEE94();
  v5 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, char, uint64_t, uint64_t, uint64_t))((char *)&dword_254DE9708
                                                                                          + dword_254DE9708);
  swift_retain();
  v3 = (_QWORD *)swift_task_alloc();
  v0[7] = v3;
  *v3 = v0;
  v3[1] = sub_2158F7690;
  return v5(v0[2], (uint64_t)" Waiting for Remote Keyless Entry Action Results", 48, 2, v0[6], v2, v0[3]);
}

uint64_t sub_2158F7690()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = *(_QWORD *)(*v1 + 48);
  v3 = *(_QWORD *)(*v1 + 32);
  v4 = *(_QWORD *)(*v1 + 40);
  v5 = *v1;
  *(_QWORD *)(v5 + 64) = v0;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v2, v3);
  if (v0)
    return swift_task_switch();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v5 + 8))();
}

uint64_t sub_2158F7730()
{
  uint64_t v0;

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2158F7764(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 32) = a1;
  *(_QWORD *)(v2 + 40) = a2;
  return swift_task_switch();
}

uint64_t sub_2158F777C()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 48) = v1;
  *(_QWORD *)(v0 + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_254DE96F0);
  *v1 = v0;
  v1[1] = sub_2158F77FC;
  return sub_2158FF014();
}

uint64_t sub_2158F77FC()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 64) = v0;
  swift_task_dealloc();
  if (v0)
    return swift_task_switch();
  else
    return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_2158F7868()
{
  uint64_t v0;
  void *v1;
  id v2;
  id v3;
  void *v4;
  char *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  _BYTE *v13;

  v1 = *(void **)(v0 + 64);
  *(_QWORD *)(v0 + 16) = v1;
  v2 = v1;
  sub_2158FECC0(0, &qword_254DE96F8);
  if (!swift_dynamicCast())
    goto LABEL_16;
  v3 = *(id *)(v0 + 24);
  if (objc_msgSend(v3, sel_code) != (id)19)
  {
    if (objc_msgSend(v3, sel_code) == (id)12)
    {
      v7 = *(void **)(v0 + 64);

      sub_2158FA180();
      swift_allocError();
      v6 = 3;
      goto LABEL_14;
    }
    if (objc_msgSend(v3, sel_code) == (id)13)
    {
      v8 = *(void **)(v0 + 64);

      sub_2158FA180();
      swift_allocError();
      v6 = 1;
      goto LABEL_14;
    }
    if (objc_msgSend(v3, sel_code) == (id)18)
    {
      v9 = *(void **)(v0 + 64);

      sub_2158FA180();
      swift_allocError();
      v6 = 2;
      goto LABEL_14;
    }
    v10 = objc_msgSend(v3, sel_code);

    if (v10 == (id)14)
    {

      sub_2158FA180();
      swift_allocError();
      v6 = 8;
      goto LABEL_14;
    }
    if (objc_msgSend(v3, sel_code) == (id)15)
    {

      sub_2158FA180();
      swift_allocError();
      v6 = 9;
      goto LABEL_14;
    }

LABEL_16:
    v12 = *(void **)(v0 + 64);

    sub_2158FA180();
    swift_allocError();
    *v13 = 0;
    swift_willThrow();
    v11 = v12;
    goto LABEL_17;
  }
  v4 = *(void **)(v0 + 64);

  sub_2158FA180();
  swift_allocError();
  v6 = 6;
LABEL_14:
  *v5 = v6;
  swift_willThrow();

  v11 = *(void **)(v0 + 16);
LABEL_17:

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t RemoteKeylessEntryAction.ExecutionRequest.deinit()
{
  uint64_t v0;

  swift_release();
  return v0;
}

uint64_t RemoteKeylessEntryAction.ExecutionRequest.__deallocating_deinit()
{
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t RemoteKeylessEntryConfigurableEnduringAction.EnduringExecutionRequest.eventStream.getter@<X0>(uint64_t a1@<X8>)
{
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
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;

  v31 = a1;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DE9710);
  MEMORY[0x24BDAC7A8](v2);
  v29 = (char *)&v26 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DE9718);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DE9720);
  v27 = *(_QWORD *)(v8 - 8);
  v28 = v8;
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DE9728);
  v12 = MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v26 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v26 - v15;
  v30 = v1;
  v17 = v1
      + OBJC_IVAR____TtCV6CarKey44RemoteKeylessEntryConfigurableEnduringAction24EnduringExecutionRequest_currentEventStream;
  swift_beginAccess();
  sub_2158FE2CC(v17, (uint64_t)v16, &qword_254DE9728);
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DE9730);
  v19 = *(_QWORD *)(v18 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48))(v16, 1, v18) != 1)
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v19 + 32))(v31, v16, v18);
  sub_2158FEC84((uint64_t)v16, &qword_254DE9728);
  (*(void (**)(char *, _QWORD, uint64_t))(v5 + 104))(v7, *MEMORY[0x24BEE6A10], v4);
  v20 = v31;
  sub_2158F7E38(v31, (uint64_t)v10, (uint64_t)v7);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  (*(void (**)(char *, uint64_t, uint64_t))(v19 + 16))(v14, v20, v18);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v19 + 56))(v14, 0, 1, v18);
  swift_beginAccess();
  sub_2158FEC40((uint64_t)v14, v17, &qword_254DE9728);
  swift_endAccess();
  v22 = v27;
  v21 = v28;
  v23 = (uint64_t)v29;
  (*(void (**)(char *, char *, uint64_t))(v27 + 32))(v29, v10, v28);
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v22 + 56))(v23, 0, 1, v21);
  v24 = v30
      + OBJC_IVAR____TtCV6CarKey44RemoteKeylessEntryConfigurableEnduringAction24EnduringExecutionRequest_currentEventStreamContinuation;
  swift_beginAccess();
  sub_2158FEC40(v23, v24, &qword_254DE9710);
  return swift_endAccess();
}

uint64_t sub_2158F7E38(uint64_t a1, uint64_t a2, uint64_t a3)
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
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t result;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;

  v21 = a2;
  v22 = a3;
  v23 = a1;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DE9718);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DE9730);
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DE9710);
  v12 = MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v20 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v20 - v15;
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DE9720);
  v18 = *(_QWORD *)(v17 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v18 + 56))(v16, 1, 1, v17);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v22, v3);
  v24 = v16;
  sub_2158FF008();
  (*(void (**)(uint64_t, char *, uint64_t))(v8 + 16))(v23, v10, v7);
  sub_2158FE2CC((uint64_t)v16, (uint64_t)v14, &qword_254DE9710);
  result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v18 + 48))(v14, 1, v17);
  if ((_DWORD)result == 1)
  {
    __break(1u);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
    (*(void (**)(uint64_t, char *, uint64_t))(v18 + 32))(v21, v14, v17);
    return sub_2158FEC84((uint64_t)v16, &qword_254DE9710);
  }
  return result;
}

uint64_t sub_2158F8030@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
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
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;

  v29 = a1;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DE9728);
  MEMORY[0x24BDAC7A8](v2);
  v27 = (char *)&v24 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DE9718);
  v4 = *(_QWORD *)(v25 - 8);
  MEMORY[0x24BDAC7A8](v25);
  v6 = (char *)&v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DE9730);
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DE9710);
  v12 = MEMORY[0x24BDAC7A8](v11);
  v26 = (char *)&v24 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v24 - v14;
  v28 = v1;
  v16 = v1
      + OBJC_IVAR____TtCV6CarKey44RemoteKeylessEntryConfigurableEnduringAction24EnduringExecutionRequest_currentEventStreamContinuation;
  swift_beginAccess();
  sub_2158FE2CC(v16, (uint64_t)v15, &qword_254DE9710);
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DE9720);
  v18 = *(_QWORD *)(v17 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v15, 1, v17) != 1)
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v18 + 32))(v29, v15, v17);
  sub_2158FEC84((uint64_t)v15, &qword_254DE9710);
  v19 = v25;
  (*(void (**)(char *, _QWORD, uint64_t))(v4 + 104))(v6, *MEMORY[0x24BEE6A10], v25);
  sub_2158F7E38((uint64_t)v10, v29, (uint64_t)v6);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v19);
  v20 = (uint64_t)v27;
  (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v27, v10, v7);
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v8 + 56))(v20, 0, 1, v7);
  v21 = v28
      + OBJC_IVAR____TtCV6CarKey44RemoteKeylessEntryConfigurableEnduringAction24EnduringExecutionRequest_currentEventStream;
  swift_beginAccess();
  sub_2158FEC40(v20, v21, &qword_254DE9728);
  swift_endAccess();
  v22 = (uint64_t)v26;
  (*(void (**)(char *, uint64_t, uint64_t))(v18 + 16))(v26, v29, v17);
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v18 + 56))(v22, 0, 1, v17);
  swift_beginAccess();
  sub_2158FEC40(v22, v16, &qword_254DE9710);
  return swift_endAccess();
}

uint64_t sub_2158F8320(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  char *v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint8_t *v22;
  uint8_t *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  uint64_t v29;
  uint64_t v30;
  __int128 v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;

  v3 = v2;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DE9C40);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v29 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DE9720);
  v30 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v29 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_254DE9D60 != -1)
    swift_once();
  v13 = sub_2158FEF30();
  __swift_project_value_buffer(v13, (uint64_t)qword_254DE9D68);
  v14 = sub_2158FEF18();
  v15 = sub_2158FF044();
  if (os_log_type_enabled(v14, v15))
  {
    v16 = (uint8_t *)swift_slowAlloc();
    v29 = v10;
    v17 = v9;
    v18 = a1;
    v19 = a2;
    v20 = v7;
    v21 = v6;
    v22 = v16;
    *(_WORD *)v16 = 0;
    _os_log_impl(&dword_2158F0000, v14, v15, "Sending ContinuationRequest over the AsyncStream", v16, 2u);
    v23 = v22;
    v6 = v21;
    v7 = v20;
    a2 = v19;
    a1 = v18;
    v9 = v17;
    v10 = v29;
    MEMORY[0x2199E7E50](v23, -1, -1);
  }

  sub_2158F8030((uint64_t)v12);
  v24 = *(void **)(v3
                 + OBJC_IVAR____TtCV6CarKey44RemoteKeylessEntryConfigurableEnduringAction24EnduringExecutionRequest_session);
  v25 = *(_QWORD *)(v3
                  + OBJC_IVAR____TtCV6CarKey44RemoteKeylessEntryConfigurableEnduringAction24EnduringExecutionRequest_action
                  + 16);
  v26 = *(_QWORD *)(v3
                  + OBJC_IVAR____TtCV6CarKey44RemoteKeylessEntryConfigurableEnduringAction24EnduringExecutionRequest_action
                  + 24);
  v31 = *(_OWORD *)(v3
                  + OBJC_IVAR____TtCV6CarKey44RemoteKeylessEntryConfigurableEnduringAction24EnduringExecutionRequest_action);
  v32 = v24;
  v33 = v25;
  v34 = v26;
  v35 = a1;
  v36 = a2;
  v27 = v24;
  sub_2158FA4C8(a1, a2);
  swift_bridgeObjectRetain();
  sub_2158FEFF0();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return (*(uint64_t (**)(char *, uint64_t))(v30 + 8))(v12, v10);
}

uint64_t RemoteKeylessEntryConfigurableEnduringAction.EnduringExecutionRequest.results()(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;

  v2[2] = a1;
  v2[3] = v1;
  v3 = sub_2158FEEAC();
  v2[4] = v3;
  v2[5] = *(_QWORD *)(v3 - 8);
  v2[6] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_2158F85B0()
{
  _QWORD *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  id v4;
  _QWORD *v5;
  uint64_t (*v7)(uint64_t, uint64_t, uint64_t, char, uint64_t, uint64_t, uint64_t);

  if (qword_254DE9D80 != -1)
    swift_once();
  v1 = (void *)v0[3];
  v2 = sub_2158FEED0();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_254DE9D88);
  sub_2158FEEC4();
  sub_2158FEE94();
  v7 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, char, uint64_t, uint64_t, uint64_t))((char *)&dword_254DE9740
                                                                                          + dword_254DE9740);
  v4 = v1;
  v5 = (_QWORD *)swift_task_alloc();
  v0[7] = v5;
  *v5 = v0;
  v5[1] = sub_2158F868C;
  return v7(v0[2], (uint64_t)" Waiting for Remote Keyless Entry Enduring Action Results", 57, 2, v0[6], v3, v0[3]);
}

uint64_t sub_2158F868C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *(_QWORD *)(*(_QWORD *)v1 + 48);
  v3 = *(_QWORD *)(*(_QWORD *)v1 + 32);
  v4 = *(_QWORD *)(*(_QWORD *)v1 + 40);
  *(_QWORD *)(*(_QWORD *)v1 + 64) = v0;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v2, v3);
  return swift_task_switch();
}

uint64_t sub_2158F870C()
{
  uint64_t v0;

  sub_2158F8B9C(*(_QWORD *)(v0 + 24));
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2158F874C()
{
  uint64_t v0;

  sub_2158F8B9C(*(_QWORD *)(v0 + 24));
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2158F878C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 32) = a1;
  *(_QWORD *)(v2 + 40) = a2;
  return swift_task_switch();
}

uint64_t sub_2158F87A4()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 48) = v1;
  *(_QWORD *)(v0 + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_254DE96F0);
  *v1 = v0;
  v1[1] = sub_2158F882C;
  return sub_2158FF014();
}

uint64_t sub_2158F882C()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 64) = v0;
  swift_task_dealloc();
  if (v0)
    return swift_task_switch();
  else
    return (*(uint64_t (**)(void))(v2 + 8))();
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> RemoteKeylessEntryConfigurableEnduringAction.EnduringExecutionRequest.stop()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint8_t *v10;
  NSObject *v11;
  os_signpost_type_t v12;
  os_signpost_id_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  char *v20;
  char v21;
  uint64_t v22;
  _BYTE *v23;
  uint64_t v24;
  os_signpost_type_t v25;
  os_signpost_id_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  v2 = v0;
  v28 = sub_2158FEEAC();
  v30 = *(_QWORD *)(v28 - 8);
  MEMORY[0x24BDAC7A8](v28);
  v4 = (char *)&v27 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_2158FEED0();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_254DE9D80 != -1)
    swift_once();
  v9 = __swift_project_value_buffer(v5, (uint64_t)qword_254DE9D88);
  v29 = v6;
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, v9, v5);
  sub_2158FEEC4();
  sub_2158FEE94();
  v10 = (uint8_t *)swift_slowAlloc();
  *(_WORD *)v10 = 0;
  v11 = sub_2158FEEC4();
  v12 = sub_2158FF098();
  v13 = sub_2158FEEA0();
  _os_signpost_emit_with_name_impl(&dword_2158F0000, v11, v12, v13, " Waiting for Remote Keyless Entry Action Results", "", v10, 2u);
  v14 = *(void **)(v0
                 + OBJC_IVAR____TtCV6CarKey44RemoteKeylessEntryConfigurableEnduringAction24EnduringExecutionRequest_session);
  v31 = v2;
  v15 = (void *)sub_2158FF02C();
  v16 = (void *)sub_2158FEF78();
  v17 = objc_msgSend(v14, sel_cancelRKEFunction_readerIdentifier_, v15, v16);

  if (v17)
  {
    v18 = v17;
    v19 = (void *)sub_2158FEE64();
    v20 = (char *)objc_msgSend(v19, sel_code);

    if ((unint64_t)(v20 - 12) >= 8)
      v21 = 0;
    else
      v21 = 0x600000A00000003uLL >> (8 * (v20 - 12));
    sub_2158FA180();
    v22 = swift_allocError();
    *v23 = v21;
    swift_willThrow();

    if (v22)
      goto LABEL_8;
LABEL_10:
    v24 = v28;
    v25 = sub_2158FF08C();
    v26 = sub_2158FEEA0();
    _os_signpost_emit_with_name_impl(&dword_2158F0000, v11, v25, v26, " Waiting for Remote Keyless Entry Action Results", "", v10, 2u);

    MEMORY[0x2199E7E50](v10, -1, -1);
    (*(void (**)(char *, uint64_t))(v30 + 8))(v4, v24);
    goto LABEL_11;
  }
  if (!v1)
    goto LABEL_10;
LABEL_8:

  (*(void (**)(char *, uint64_t))(v30 + 8))(v4, v28);
LABEL_11:
  (*(void (**)(char *, uint64_t))(v29 + 8))(v8, v5);
  sub_2158F8B9C(v31);
}

uint64_t sub_2158F8B9C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _BYTE *v14;
  uint64_t v15;
  uint64_t v17;
  NSObject *v18;
  os_log_type_t v19;
  uint8_t *v20;
  uint64_t v21;
  uint64_t v22;
  _BYTE v23[24];

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DE9728);
  MEMORY[0x24BDAC7A8](v2);
  v4 = &v23[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DE9710);
  v6 = MEMORY[0x24BDAC7A8](v5);
  v8 = &v23[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v6);
  v10 = &v23[-v9];
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DE9720);
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v14 = &v23[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v15 = a1
      + OBJC_IVAR____TtCV6CarKey44RemoteKeylessEntryConfigurableEnduringAction24EnduringExecutionRequest_currentEventStreamContinuation;
  swift_beginAccess();
  sub_2158FE2CC(v15, (uint64_t)v10, &qword_254DE9710);
  if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11) == 1)
    return sub_2158FEC84((uint64_t)v10, &qword_254DE9710);
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v12 + 32))(v14, v10, v11);
  if (qword_254DE9D60 != -1)
    swift_once();
  v17 = sub_2158FEF30();
  __swift_project_value_buffer(v17, (uint64_t)qword_254DE9D68);
  v18 = sub_2158FEF18();
  v19 = sub_2158FF044();
  if (os_log_type_enabled(v18, v19))
  {
    v20 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v20 = 0;
    _os_log_impl(&dword_2158F0000, v18, v19, "Finishing event stream", v20, 2u);
    MEMORY[0x2199E7E50](v20, -1, -1);
  }

  sub_2158FEFFC();
  (*(void (**)(_BYTE *, uint64_t))(v12 + 8))(v14, v11);
  (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(v12 + 56))(v8, 1, 1, v11);
  swift_beginAccess();
  sub_2158FEC40((uint64_t)v8, v15, &qword_254DE9710);
  swift_endAccess();
  v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DE9730);
  (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 56))(v4, 1, 1, v21);
  v22 = a1
      + OBJC_IVAR____TtCV6CarKey44RemoteKeylessEntryConfigurableEnduringAction24EnduringExecutionRequest_currentEventStream;
  swift_beginAccess();
  sub_2158FEC40((uint64_t)v4, v22, &qword_254DE9728);
  return swift_endAccess();
}

uint64_t RemoteKeylessEntryConfigurableEnduringAction.EnduringExecutionRequest.ContinuationRequest.data.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 40);
  sub_2158FA4C8(v1, *(_QWORD *)(v0 + 48));
  return v1;
}

id RemoteKeylessEntryConfigurableEnduringAction.EnduringExecutionRequest.ContinuationRequest.confirm(_:)(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  id v11;
  id v12[2];

  v12[1] = *(id *)MEMORY[0x24BDAC8D0];
  v4 = *(void **)(v2 + 16);
  v5 = (void *)sub_2158FF02C();
  v6 = (void *)sub_2158FF02C();
  if (a2 >> 60 == 15)
    v7 = 0;
  else
    v7 = (void *)sub_2158FEE7C();
  v8 = (void *)sub_2158FEF78();
  v12[0] = 0;
  v9 = objc_msgSend(v4, sel_continueExecutingRKEFunction_action_arbitraryData_readerIdentifier_error_, v5, v6, v7, v8, v12);

  if (v9)
    return v12[0];
  v11 = v12[0];
  sub_2158FEE70();

  return (id)swift_willThrow();
}

id RemoteKeylessEntryConfigurableEnduringAction.EnduringExecutionRequest.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void RemoteKeylessEntryConfigurableEnduringAction.EnduringExecutionRequest.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id RemoteKeylessEntryConfigurableEnduringAction.EnduringExecutionRequest.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t RemoteKeylessEntryEnduringAction.EnduringExecutionRequest.results()(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;

  v2[2] = a1;
  v2[3] = v1;
  v3 = sub_2158FEEAC();
  v2[4] = v3;
  v2[5] = *(_QWORD *)(v3 - 8);
  v2[6] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_2158F919C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t (*v5)(uint64_t, uint64_t, uint64_t, char, uint64_t, uint64_t, uint64_t);

  if (qword_254DE9D80 != -1)
    swift_once();
  v1 = sub_2158FEED0();
  v2 = __swift_project_value_buffer(v1, (uint64_t)qword_254DE9D88);
  sub_2158FEEC4();
  sub_2158FEE94();
  v5 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, char, uint64_t, uint64_t, uint64_t))((char *)&dword_254DE9750
                                                                                          + dword_254DE9750);
  swift_retain();
  v3 = (_QWORD *)swift_task_alloc();
  v0[7] = v3;
  *v3 = v0;
  v3[1] = sub_2158F927C;
  return v5(v0[2], (uint64_t)" Waiting for Remote Keyless Entry Enduring Action Results", 57, 2, v0[6], v2, v0[3]);
}

uint64_t sub_2158F927C()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = *(_QWORD *)(*v1 + 48);
  v3 = *(_QWORD *)(*v1 + 32);
  v4 = *(_QWORD *)(*v1 + 40);
  v5 = *v1;
  *(_QWORD *)(v5 + 64) = v0;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v2, v3);
  if (v0)
    return swift_task_switch();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v5 + 8))();
}

uint64_t sub_2158F931C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 32) = a1;
  *(_QWORD *)(v2 + 40) = a2;
  return swift_task_switch();
}

uint64_t sub_2158F9334()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 48) = v1;
  *(_QWORD *)(v0 + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_254DE96F0);
  *v1 = v0;
  v1[1] = sub_2158F93B4;
  return sub_2158FF014();
}

uint64_t sub_2158F93B4()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 64) = v0;
  swift_task_dealloc();
  if (v0)
    return swift_task_switch();
  else
    return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_2158F9420()
{
  uint64_t v0;
  void *v1;
  id v2;
  id v3;
  void *v4;
  char *v5;
  char v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  _BYTE *v12;

  v1 = *(void **)(v0 + 64);
  *(_QWORD *)(v0 + 16) = v1;
  v2 = v1;
  sub_2158FECC0(0, &qword_254DE96F8);
  if (!swift_dynamicCast())
    goto LABEL_14;
  v3 = *(id *)(v0 + 24);
  if (objc_msgSend(v3, sel_code) != (id)19)
  {
    if (objc_msgSend(v3, sel_code) == (id)12)
    {
      v7 = *(void **)(v0 + 64);

      sub_2158FA180();
      swift_allocError();
      v6 = 3;
      goto LABEL_12;
    }
    if (objc_msgSend(v3, sel_code) == (id)13)
    {
      v8 = *(void **)(v0 + 64);

      sub_2158FA180();
      swift_allocError();
      v6 = 1;
      goto LABEL_12;
    }
    v9 = objc_msgSend(v3, sel_code);

    if (v9 == (id)18)
    {

      sub_2158FA180();
      swift_allocError();
      v6 = 2;
      goto LABEL_12;
    }
    if (objc_msgSend(v3, sel_code) == (id)14)
    {

      sub_2158FA180();
      swift_allocError();
      v6 = 8;
      goto LABEL_12;
    }

LABEL_14:
    v11 = *(void **)(v0 + 64);

    sub_2158FA180();
    swift_allocError();
    *v12 = 0;
    swift_willThrow();
    v10 = v11;
    goto LABEL_15;
  }
  v4 = *(void **)(v0 + 64);

  sub_2158FA180();
  swift_allocError();
  v6 = 6;
LABEL_12:
  *v5 = v6;
  swift_willThrow();

  v10 = *(void **)(v0 + 16);
LABEL_15:

  return (*(uint64_t (**)(void))(v0 + 8))();
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> RemoteKeylessEntryEnduringAction.EnduringExecutionRequest.stop()()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint8_t *v8;
  NSObject *v9;
  os_signpost_type_t v10;
  os_signpost_id_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  char *v18;
  char v19;
  uint64_t v20;
  _BYTE *v21;
  uint64_t v22;
  os_signpost_type_t v23;
  os_signpost_id_t v24;
  _QWORD v25[2];
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v26 = sub_2158FEEAC();
  v28 = *(_QWORD *)(v26 - 8);
  MEMORY[0x24BDAC7A8](v26);
  v2 = (char *)v25 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_2158FEED0();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_254DE9D80 != -1)
    swift_once();
  v7 = __swift_project_value_buffer(v3, (uint64_t)qword_254DE9D88);
  v27 = v4;
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v7, v3);
  sub_2158FEEC4();
  sub_2158FEE94();
  v8 = (uint8_t *)swift_slowAlloc();
  *(_WORD *)v8 = 0;
  v9 = sub_2158FEEC4();
  v10 = sub_2158FF098();
  v11 = sub_2158FEEA0();
  _os_signpost_emit_with_name_impl(&dword_2158F0000, v9, v10, v11, " Waiting for Remote Keyless Entry Action Results", "", v8, 2u);
  v12 = *(void **)(v0 + 56);
  v13 = (void *)sub_2158FF02C();
  v14 = (void *)sub_2158FEF78();
  v15 = objc_msgSend(v12, sel_cancelRKEFunction_readerIdentifier_, v13, v14);

  if (v15)
  {
    v16 = v15;
    v17 = (void *)sub_2158FEE64();
    v18 = (char *)objc_msgSend(v17, sel_code);

    if ((unint64_t)(v18 - 12) >= 8)
      v19 = 0;
    else
      v19 = 0x600000A00000003uLL >> (8 * (v18 - 12));
    sub_2158FA180();
    v20 = swift_allocError();
    *v21 = v19;
    swift_willThrow();

    if (v20)
      goto LABEL_8;
LABEL_10:
    v22 = v26;
    v23 = sub_2158FF08C();
    v24 = sub_2158FEEA0();
    _os_signpost_emit_with_name_impl(&dword_2158F0000, v9, v23, v24, " Waiting for Remote Keyless Entry Action Results", "", v8, 2u);

    MEMORY[0x2199E7E50](v8, -1, -1);
    (*(void (**)(char *, uint64_t))(v28 + 8))(v2, v22);
    goto LABEL_11;
  }
  if (!v25[1])
    goto LABEL_10;
LABEL_8:

  (*(void (**)(char *, uint64_t))(v28 + 8))(v2, v26);
LABEL_11:
  (*(void (**)(char *, uint64_t))(v27 + 8))(v6, v3);
}

uint64_t RemoteKeylessEntryEnduringAction.EnduringExecutionRequest.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_release();

  return v0;
}

uint64_t RemoteKeylessEntryEnduringAction.EnduringExecutionRequest.__deallocating_deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_release();

  return swift_deallocClassInstance();
}

id sub_2158F9AC8()
{
  return sub_2158F9AD4(type metadata accessor for SESRKESessionContinuationDelegateHandler);
}

id sub_2158F9AD4(uint64_t (*a1)(void))
{
  void *v1;
  objc_super v3;

  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

uint64_t FunctionIdentifier.rawValue.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

uint64_t ActionIdentifier.rawValue.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

uint64_t ExecutionStatus.rawValue.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

uint64_t FunctionStatus.rawValue.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

CarKey::FunctionStatus __swiftcall FunctionStatus.init(rawValue:)(CarKey::FunctionStatus rawValue)
{
  CarKey::FunctionStatus *v1;

  v1->rawValue = rawValue.rawValue;
  return rawValue;
}

_QWORD *sub_2158F9B74@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = *result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

void sub_2158F9B84(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

uint64_t sub_2158F9B90()
{
  sub_2158FF1DC();
  sub_2158FF1E8();
  return sub_2158FF1F4();
}

uint64_t sub_2158F9BD4()
{
  return sub_2158FF1E8();
}

uint64_t sub_2158F9BFC()
{
  sub_2158FF1DC();
  sub_2158FF1E8();
  return sub_2158FF1F4();
}

BOOL sub_2158F9C3C(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

BOOL static CarKeyErrorCode.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t CarKeyErrorCode.hash(into:)()
{
  return sub_2158FF1E8();
}

uint64_t CarKeyErrorCode.hashValue.getter()
{
  sub_2158FF1DC();
  sub_2158FF1E8();
  return sub_2158FF1F4();
}

BOOL sub_2158F9CD0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_2158F9CF4()
{
  uint64_t v0;

  v0 = sub_2158FEF30();
  __swift_allocate_value_buffer(v0, qword_254DE9D68);
  __swift_project_value_buffer(v0, (uint64_t)qword_254DE9D68);
  return sub_2158FEF24();
}

uint64_t sub_2158F9D64()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;

  v0 = sub_2158FEF30();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_2158FEED0();
  __swift_allocate_value_buffer(v4, qword_254DE9D88);
  __swift_project_value_buffer(v4, (uint64_t)qword_254DE9D88);
  if (qword_254DE9D60 != -1)
    swift_once();
  v5 = __swift_project_value_buffer(v0, (uint64_t)qword_254DE9D68);
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v3, v5, v0);
  return sub_2158FEEB8();
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t sub_2158F9E64(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  _QWORD *v9;

  v4 = *(_QWORD *)(v1 + 16);
  v5 = *(_QWORD *)(v1 + 24);
  v6 = *(_QWORD *)(v1 + 32);
  v7 = *(_QWORD *)(v1 + 40);
  v8 = *(_BYTE *)(v1 + 48);
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v9;
  *v9 = v2;
  v9[1] = sub_2158F9EE4;
  return sub_2158F22B4(a1, v4, v5, v6, v7, v8);
}

uint64_t sub_2158F9EE4()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_2158F9F2C(uint64_t a1, const char *a2, int a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  NSObject *v14;
  uint64_t result;
  const char *v16;
  uint8_t *v17;
  os_signpost_id_t v18;
  void (*v19)(char *, uint64_t);
  uint64_t v20;
  int v21;
  int v22;
  char *v23;
  char v24;

  v22 = a3;
  v23 = (char *)a2;
  v3 = sub_2158FEEDC();
  v4 = *(_QWORD *)(v3 - 8);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v6 = (char *)&v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_2158FEEAC();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v20 - v12;
  v14 = sub_2158FEEC4();
  sub_2158FEEE8();
  v21 = sub_2158FF08C();
  result = sub_2158FF0A4();
  if ((result & 1) == 0)
    goto LABEL_5;
  if ((v22 & 1) == 0)
  {
    if (!v23)
    {
      __break(1u);
LABEL_5:

      return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v13, v7);
    }
    goto LABEL_10;
  }
  if ((unint64_t)v23 >> 32)
  {
    __break(1u);
    goto LABEL_16;
  }
  if (v23 >> 11 == 27)
  {
LABEL_17:
    __break(1u);
    return result;
  }
  if (v23 >> 16 > 0x10)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v23 = &v24;
LABEL_10:
  swift_retain();
  sub_2158FEF0C();
  swift_release();
  if ((*(unsigned int (**)(char *, uint64_t))(v4 + 88))(v6, v3) == *MEMORY[0x24BEE7810])
  {
    v16 = "[Error] Interval already ended";
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    v16 = "";
  }
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v11, v13, v7);
  v17 = (uint8_t *)swift_slowAlloc();
  *(_WORD *)v17 = 0;
  v18 = sub_2158FEEA0();
  _os_signpost_emit_with_name_impl(&dword_2158F0000, v14, (os_signpost_type_t)v21, v18, v23, v16, v17, 2u);
  MEMORY[0x2199E7E50](v17, -1, -1);

  v19 = *(void (**)(char *, uint64_t))(v8 + 8);
  v19(v13, v7);
  return ((uint64_t (*)(char *, uint64_t))v19)(v11, v7);
}

unint64_t sub_2158FA180()
{
  unint64_t result;

  result = qword_254DE96B0;
  if (!qword_254DE96B0)
  {
    result = MEMORY[0x2199E7DF0](&protocol conformance descriptor for CarKeyErrorCode, &type metadata for CarKeyErrorCode);
    atomic_store(result, (unint64_t *)&qword_254DE96B0);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2199E7DD8]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_2158FA204()
{
  return objectdestroyTm();
}

uint64_t sub_2158FA20C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  __int128 v7;
  __int128 v8;

  v7 = *(_OWORD *)(v1 + 48);
  v8 = *(_OWORD *)(v1 + 32);
  v4 = *(_QWORD *)(v1 + 64);
  v5 = swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *(_QWORD *)v5 = v2;
  *(_QWORD *)(v5 + 8) = sub_2158FEDF0;
  *(_QWORD *)(v5 + 168) = v4;
  *(_OWORD *)(v5 + 152) = v7;
  *(_OWORD *)(v5 + 136) = v8;
  *(_QWORD *)(v5 + 128) = a1;
  return swift_task_switch();
}

uint64_t type metadata accessor for RemoteKeylessEntryAction.ExecutionRequest()
{
  return objc_opt_self();
}

uint64_t sub_2158FA2B8()
{
  return objectdestroyTm();
}

uint64_t sub_2158FA2C0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  char v5;
  uint64_t v6;
  __int128 v8;
  __int128 v9;

  v8 = *(_OWORD *)(v1 + 48);
  v9 = *(_OWORD *)(v1 + 32);
  v4 = *(_QWORD *)(v1 + 64);
  v5 = *(_BYTE *)(v1 + 72);
  v6 = swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v6;
  *(_QWORD *)v6 = v2;
  *(_QWORD *)(v6 + 8) = sub_2158FEDF0;
  *(_BYTE *)(v6 + 208) = v5;
  *(_QWORD *)(v6 + 168) = v4;
  *(_OWORD *)(v6 + 152) = v8;
  *(_OWORD *)(v6 + 136) = v9;
  *(_QWORD *)(v6 + 128) = a1;
  return swift_task_switch();
}

uint64_t type metadata accessor for RemoteKeylessEntryConfigurableEnduringAction.EnduringExecutionRequest()
{
  uint64_t result;

  result = qword_254DEA530;
  if (!qword_254DEA530)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_2158FA390()
{
  return objectdestroyTm();
}

uint64_t objectdestroyTm()
{
  uint64_t v0;

  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_2158FA3D8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  __int128 v7;
  __int128 v8;

  v7 = *(_OWORD *)(v1 + 48);
  v8 = *(_OWORD *)(v1 + 32);
  v4 = *(_QWORD *)(v1 + 64);
  v5 = swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *(_QWORD *)v5 = v2;
  *(_QWORD *)(v5 + 8) = sub_2158FEDF0;
  *(_QWORD *)(v5 + 168) = v4;
  *(_OWORD *)(v5 + 152) = v7;
  *(_OWORD *)(v5 + 136) = v8;
  *(_QWORD *)(v5 + 128) = a1;
  return swift_task_switch();
}

uint64_t type metadata accessor for RemoteKeylessEntryEnduringAction.EnduringExecutionRequest()
{
  return objc_opt_self();
}

uint64_t sub_2158FA484(uint64_t a1, unint64_t a2)
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

uint64_t sub_2158FA4C8(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_2158FA484(a1, a2);
  return a1;
}

unint64_t sub_2158FA4E0()
{
  unint64_t result;

  result = qword_254DE9758;
  if (!qword_254DE9758)
  {
    result = MEMORY[0x2199E7DF0](&protocol conformance descriptor for CarKeyRemoteControlSession.ContinuationStrategy, &type metadata for CarKeyRemoteControlSession.ContinuationStrategy);
    atomic_store(result, (unint64_t *)&qword_254DE9758);
  }
  return result;
}

unint64_t sub_2158FA528()
{
  unint64_t result;

  result = qword_254DE9760;
  if (!qword_254DE9760)
  {
    result = MEMORY[0x2199E7DF0](&protocol conformance descriptor for FunctionIdentifier, &type metadata for FunctionIdentifier);
    atomic_store(result, (unint64_t *)&qword_254DE9760);
  }
  return result;
}

unint64_t sub_2158FA570()
{
  unint64_t result;

  result = qword_254DE9768;
  if (!qword_254DE9768)
  {
    result = MEMORY[0x2199E7DF0](&protocol conformance descriptor for ActionIdentifier, &type metadata for ActionIdentifier);
    atomic_store(result, (unint64_t *)&qword_254DE9768);
  }
  return result;
}

unint64_t sub_2158FA5B8()
{
  unint64_t result;

  result = qword_254DE9770;
  if (!qword_254DE9770)
  {
    result = MEMORY[0x2199E7DF0](&protocol conformance descriptor for FunctionStatus, &type metadata for FunctionStatus);
    atomic_store(result, (unint64_t *)&qword_254DE9770);
  }
  return result;
}

unint64_t sub_2158FA600()
{
  unint64_t result;

  result = qword_254DE9778;
  if (!qword_254DE9778)
  {
    result = MEMORY[0x2199E7DF0](&protocol conformance descriptor for CarKeyErrorCode, &type metadata for CarKeyErrorCode);
    atomic_store(result, (unint64_t *)&qword_254DE9778);
  }
  return result;
}

uint64_t type metadata accessor for CarKeyRemoteControl()
{
  return objc_opt_self();
}

uint64_t method lookup function for CarKeyRemoteControl()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of static CarKeyRemoteControl.start(delegate:subscriptionRange:with:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v11;
  _QWORD *v12;
  uint64_t (*v14)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);

  v11 = a4 & 1;
  v14 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(**(int **)(v5 + 80) + *(_QWORD *)(v5 + 80));
  v12 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v6 + 16) = v12;
  *v12 = v6;
  v12[1] = sub_2158FA700;
  return v14(a1, a2, a3, v11, a5);
}

uint64_t sub_2158FA700(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v4;

  v4 = *v1;
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v4 + 8))(a1);
}

uint64_t type metadata accessor for RKESessionDelegate()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for CarKeyRemoteControlSession()
{
  return objc_opt_self();
}

uint64_t method lookup function for CarKeyRemoteControlSession()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of CarKeyRemoteControlSession.vehicleReports.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 120))();
}

uint64_t dispatch thunk of CarKeyRemoteControlSession.end()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 192))();
}

uint64_t dispatch thunk of CarKeyRemoteControlSession.perform(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 200))();
}

{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 216))();
}

uint64_t dispatch thunk of CarKeyRemoteControlSession.perform(_:continuationStrategy:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 208))();
}

uint64_t dispatch thunk of CarKeyRemoteControlSession.sendPassthroughData(_:toVehicle:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 224))();
}

uint64_t dispatch thunk of CarKeyRemoteControlSession.isPassiveEntryAvailable(forVehicle:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 232))() & 1;
}

uint64_t dispatch thunk of CarKeyRemoteControlSession.sign(data:forVehicle:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 240))();
}

uint64_t initializeBufferWithCopyOfBuffer for CarKeyRemoteControlSession.Attestation(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for CarKeyRemoteControlSession.Attestation(uint64_t a1)
{
  swift_bridgeObjectRelease();
  sub_2158FA8E8(*(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24));
  sub_2158FA8E8(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  return sub_2158FA8E8(*(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

uint64_t sub_2158FA8E8(uint64_t a1, unint64_t a2)
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

_QWORD *initializeWithCopy for CarKeyRemoteControlSession.Attestation(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  v5 = a2[2];
  v6 = a2[3];
  swift_bridgeObjectRetain();
  sub_2158FA484(v5, v6);
  a1[2] = v5;
  a1[3] = v6;
  v7 = a2[4];
  v8 = a2[5];
  sub_2158FA484(v7, v8);
  a1[4] = v7;
  a1[5] = v8;
  v10 = a2[6];
  v9 = a2[7];
  sub_2158FA484(v10, v9);
  a1[6] = v10;
  a1[7] = v9;
  return a1;
}

_QWORD *assignWithCopy for CarKeyRemoteControlSession.Attestation(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;

  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = a2[2];
  v5 = a2[3];
  sub_2158FA484(v4, v5);
  v6 = a1[2];
  v7 = a1[3];
  a1[2] = v4;
  a1[3] = v5;
  sub_2158FA8E8(v6, v7);
  v8 = a2[4];
  v9 = a2[5];
  sub_2158FA484(v8, v9);
  v10 = a1[4];
  v11 = a1[5];
  a1[4] = v8;
  a1[5] = v9;
  sub_2158FA8E8(v10, v11);
  v13 = a2[6];
  v12 = a2[7];
  sub_2158FA484(v13, v12);
  v14 = a1[6];
  v15 = a1[7];
  a1[6] = v13;
  a1[7] = v12;
  sub_2158FA8E8(v14, v15);
  return a1;
}

__n128 __swift_memcpy64_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

_QWORD *assignWithTake for CarKeyRemoteControlSession.Attestation(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;

  v4 = *(_QWORD *)(a2 + 8);
  *a1 = *(_QWORD *)a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  v5 = a1[2];
  v6 = a1[3];
  *((_OWORD *)a1 + 1) = *(_OWORD *)(a2 + 16);
  sub_2158FA8E8(v5, v6);
  v7 = a1[4];
  v8 = a1[5];
  *((_OWORD *)a1 + 2) = *(_OWORD *)(a2 + 32);
  sub_2158FA8E8(v7, v8);
  v9 = a1[6];
  v10 = a1[7];
  *((_OWORD *)a1 + 3) = *(_OWORD *)(a2 + 48);
  sub_2158FA8E8(v9, v10);
  return a1;
}

uint64_t getEnumTagSinglePayload for CarKeyRemoteControlSession.Attestation(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 64))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for CarKeyRemoteControlSession.Attestation(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 64) = 1;
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
    *(_BYTE *)(result + 64) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for CarKeyRemoteControlSession.Attestation()
{
  return &type metadata for CarKeyRemoteControlSession.Attestation;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for CarKeyRemoteControlSession.ContinuationStrategy(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for CarKeyRemoteControlSession.ContinuationStrategy(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2158FAC4C + 4 * byte_2158FF735[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_2158FAC80 + 4 * byte_2158FF730[v4]))();
}

uint64_t sub_2158FAC80(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2158FAC88(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2158FAC90);
  return result;
}

uint64_t sub_2158FAC9C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2158FACA4);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_2158FACA8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2158FACB0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2158FACBC(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_2158FACC4(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for CarKeyRemoteControlSession.ContinuationStrategy()
{
  return &type metadata for CarKeyRemoteControlSession.ContinuationStrategy;
}

uint64_t dispatch thunk of CarKeyRemoteControlSessionDelegate.remoteControlSession(_:didInvalidateWithError:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 8))();
}

uint64_t dispatch thunk of CarKeyRemoteControlSessionDelegate.remoteControlSession(_:didCreateKey:forVehicle:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return (*(uint64_t (**)(void))(a7 + 16))();
}

uint64_t dispatch thunk of CarKeyRemoteControlSessionDelegate.remoteControlSession(_:vehicleDidUpdateReport:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 24))();
}

uint64_t dispatch thunk of CarKeyRemoteControlSessionDelegate.remoteControlSession(_:didReceivePassthroughData:fromVehicle:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return (*(uint64_t (**)(void))(a7 + 32))();
}

uint64_t destroy for VehicleReport()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for VehicleReport(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  v4 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v4;
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for VehicleReport(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
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

uint64_t assignWithTake for VehicleReport(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for VehicleReport(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for VehicleReport(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for VehicleReport()
{
  return &type metadata for VehicleReport;
}

uint64_t destroy for RemoteKeylessEntryAction()
{
  return swift_bridgeObjectRelease();
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

ValueMetadata *type metadata accessor for RemoteKeylessEntryAction()
{
  return &type metadata for RemoteKeylessEntryAction;
}

uint64_t method lookup function for RemoteKeylessEntryAction.ExecutionRequest()
{
  return swift_lookUpClassMethod();
}

ValueMetadata *type metadata accessor for RemoteKeylessEntryConfigurableEnduringAction()
{
  return &type metadata for RemoteKeylessEntryConfigurableEnduringAction;
}

uint64_t sub_2158FAFA8()
{
  return type metadata accessor for RemoteKeylessEntryConfigurableEnduringAction.EnduringExecutionRequest();
}

void sub_2158FAFB0()
{
  unint64_t v0;
  unint64_t v1;

  sub_2158FB0CC(319, &qword_254DE9AE0, &qword_254DE9730);
  if (v0 <= 0x3F)
  {
    sub_2158FB0CC(319, &qword_254DE9AE8, &qword_254DE9720);
    if (v1 <= 0x3F)
      swift_updateClassMetadata2();
  }
}

uint64_t method lookup function for RemoteKeylessEntryConfigurableEnduringAction.EnduringExecutionRequest()
{
  return swift_lookUpClassMethod();
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2199E7DE4](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

void sub_2158FB0CC(uint64_t a1, unint64_t *a2, uint64_t *a3)
{
  unint64_t v4;
  uint64_t v5;

  if (!*a2)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a3);
    v4 = sub_2158FF0B0();
    if (!v5)
      atomic_store(v4, a2);
  }
}

uint64_t sub_2158FB124(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(MEMORY[0x24BDCDDE8] - 8) + 8))();
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

ValueMetadata *type metadata accessor for RemoteKeylessEntryConfigurableEnduringAction.EnduringExecutionRequest.ContinuationRequest()
{
  return &type metadata for RemoteKeylessEntryConfigurableEnduringAction.EnduringExecutionRequest.ContinuationRequest;
}

uint64_t _s6CarKey44RemoteKeylessEntryConfigurableEnduringActionV24EnduringExecutionRequestC19ContinuationRequestVwxx_0(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;

  result = swift_bridgeObjectRelease();
  v3 = *(_QWORD *)(a1 + 48);
  if (v3 >> 60 != 15)
    return sub_2158FA8E8(*(_QWORD *)(a1 + 40), v3);
  return result;
}

uint64_t _s6CarKey44RemoteKeylessEntryConfigurableEnduringActionV24EnduringExecutionRequestC19ContinuationRequestVwcp_0(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  uint64_t *v5;
  unint64_t v6;
  id v7;
  uint64_t v8;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  v3 = *(void **)(a2 + 16);
  v4 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = v3;
  *(_QWORD *)(a1 + 24) = v4;
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  v5 = (uint64_t *)(a2 + 40);
  v6 = *(_QWORD *)(a2 + 48);
  v7 = v3;
  swift_bridgeObjectRetain();
  if (v6 >> 60 == 15)
  {
    *(_OWORD *)(a1 + 40) = *(_OWORD *)v5;
  }
  else
  {
    v8 = *v5;
    sub_2158FA484(*v5, v6);
    *(_QWORD *)(a1 + 40) = v8;
    *(_QWORD *)(a1 + 48) = v6;
  }
  return a1;
}

_QWORD *_s6CarKey44RemoteKeylessEntryConfigurableEnduringActionV24EnduringExecutionRequestC19ContinuationRequestVwca_0(_QWORD *a1, _QWORD *a2)
{
  void *v4;
  void *v5;
  id v6;
  uint64_t *v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;

  *a1 = *a2;
  a1[1] = a2[1];
  v4 = (void *)a2[2];
  v5 = (void *)a1[2];
  a1[2] = v4;
  v6 = v4;

  a1[3] = a2[3];
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v7 = a2 + 5;
  v8 = a2[6];
  if (a1[6] >> 60 != 15)
  {
    if (v8 >> 60 != 15)
    {
      v10 = *v7;
      sub_2158FA484(*v7, v8);
      v11 = a1[5];
      v12 = a1[6];
      a1[5] = v10;
      a1[6] = v8;
      sub_2158FA8E8(v11, v12);
      return a1;
    }
    sub_2158FB124((uint64_t)(a1 + 5));
    goto LABEL_6;
  }
  if (v8 >> 60 == 15)
  {
LABEL_6:
    *(_OWORD *)(a1 + 5) = *(_OWORD *)v7;
    return a1;
  }
  v9 = *v7;
  sub_2158FA484(*v7, v8);
  a1[5] = v9;
  a1[6] = v8;
  return a1;
}

uint64_t _s6CarKey44RemoteKeylessEntryConfigurableEnduringActionV24EnduringExecutionRequestC19ContinuationRequestVwta_0(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  _QWORD *v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  v4 = *(void **)(a1 + 16);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);

  v5 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v5;
  swift_bridgeObjectRelease();
  v6 = (_QWORD *)(a2 + 40);
  v7 = *(_QWORD *)(a1 + 48);
  if (v7 >> 60 != 15)
  {
    v8 = *(_QWORD *)(a2 + 48);
    if (v8 >> 60 != 15)
    {
      v9 = *(_QWORD *)(a1 + 40);
      *(_QWORD *)(a1 + 40) = *v6;
      *(_QWORD *)(a1 + 48) = v8;
      sub_2158FA8E8(v9, v7);
      return a1;
    }
    sub_2158FB124(a1 + 40);
  }
  *(_OWORD *)(a1 + 40) = *(_OWORD *)v6;
  return a1;
}

uint64_t _s6CarKey44RemoteKeylessEntryConfigurableEnduringActionV24EnduringExecutionRequestC19ContinuationRequestVwet_0(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 56))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t sub_2158FB434(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 16) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 56) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

uint64_t sub_2158FB480()
{
  return 0;
}

ValueMetadata *type metadata accessor for RemoteKeylessEntryConfigurableEnduringAction.EnduringExecutionRequest.Event()
{
  return &type metadata for RemoteKeylessEntryConfigurableEnduringAction.EnduringExecutionRequest.Event;
}

uint64_t _s6CarKey24RemoteKeylessEntryActionVwcp_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  v3 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v3;
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *_s6CarKey24RemoteKeylessEntryActionVwca_0(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s6CarKey24RemoteKeylessEntryActionVwta_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  v3 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s6CarKey24RemoteKeylessEntryActionVwet_0(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 32))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t sub_2158FB59C(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 24) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 32) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for RemoteKeylessEntryEnduringAction()
{
  return &type metadata for RemoteKeylessEntryEnduringAction;
}

uint64_t method lookup function for RemoteKeylessEntryEnduringAction.EnduringExecutionRequest()
{
  return swift_lookUpClassMethod();
}

uint64_t type metadata accessor for SESRKESessionContinuationDelegateHandler()
{
  return objc_opt_self();
}

ValueMetadata *type metadata accessor for FunctionIdentifier()
{
  return &type metadata for FunctionIdentifier;
}

ValueMetadata *type metadata accessor for ActionIdentifier()
{
  return &type metadata for ActionIdentifier;
}

ValueMetadata *type metadata accessor for ExecutionStatus()
{
  return &type metadata for ExecutionStatus;
}

ValueMetadata *type metadata accessor for FunctionStatus()
{
  return &type metadata for FunctionStatus;
}

uint64_t getEnumTagSinglePayload for CarKeyErrorCode(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xF4)
    goto LABEL_17;
  if (a2 + 12 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 12) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 12;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 12;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 12;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0xD;
  v8 = v6 - 13;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for CarKeyErrorCode(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 12 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 12) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xF4)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF3)
    return ((uint64_t (*)(void))((char *)&loc_2158FB734 + 4 * byte_2158FF73F[v4]))();
  *a1 = a2 + 12;
  return ((uint64_t (*)(void))((char *)sub_2158FB768 + 4 * byte_2158FF73A[v4]))();
}

uint64_t sub_2158FB768(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2158FB770(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2158FB778);
  return result;
}

uint64_t sub_2158FB784(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2158FB78CLL);
  *(_BYTE *)result = a2 + 12;
  return result;
}

uint64_t sub_2158FB790(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2158FB798(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_2158FB7A4(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for CarKeyErrorCode()
{
  return &type metadata for CarKeyErrorCode;
}

uint64_t sub_2158FB7BC(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_2158FB88C(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_2158FE8A4((uint64_t)v12, *a3);
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
      sub_2158FE8A4((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v12);
  return v7;
}

uint64_t sub_2158FB88C(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_2158FF0C8();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_2158FBA44(a5, a6);
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
  v8 = sub_2158FF11C();
  if (!v8)
  {
    sub_2158FF128();
    __break(1u);
LABEL_17:
    result = sub_2158FF170();
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

uint64_t sub_2158FBA44(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_2158FBAD8(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_2158FBCB0(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_2158FBCB0(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_2158FBAD8(uint64_t a1, unint64_t a2)
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
      v3 = sub_2158FBC4C(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_2158FF104();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_2158FF128();
      __break(1u);
LABEL_10:
      v2 = sub_2158FEF9C();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_2158FF170();
    __break(1u);
LABEL_14:
    result = sub_2158FF128();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_2158FBC4C(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_254DE9C90);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_2158FBCB0(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_254DE9C90);
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
  result = sub_2158FF170();
  __break(1u);
  return result;
}

unint64_t sub_2158FBDFC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_2158FF1DC();
  sub_2158FEF90();
  v4 = sub_2158FF1F4();
  return sub_2158FBEE8(a1, a2, v4);
}

unint64_t sub_2158FBE60(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_2158FF0E0();
  return sub_2158FBFC8(a1, v2);
}

unint64_t sub_2158FBE90(uint64_t a1)
{
  uint64_t v2;

  sub_2158FF1DC();
  sub_2158FF1E8();
  v2 = sub_2158FF1F4();
  return sub_2158FC08C(a1, v2);
}

unint64_t sub_2158FBEE8(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_2158FF17C() & 1) == 0)
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
      while (!v14 && (sub_2158FF17C() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_2158FBFC8(uint64_t a1, uint64_t a2)
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
      sub_2158FE904(*(_QWORD *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      v7 = MEMORY[0x2199E79B8](v9, a1);
      sub_2158FE6B8((uint64_t)v9);
      if ((v7 & 1) != 0)
        break;
      v4 = (v4 + 1) & v6;
    }
    while (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

unint64_t sub_2158FC08C(uint64_t a1, uint64_t a2)
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

uint64_t sub_2158FC128(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_2158FC160(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_2158FC144(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_2158FC2E4(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_2158FC160(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_254DE9CD8);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 48);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v12 = v10 + 32;
  v13 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v12 >= &v13[48 * v8])
      memmove(v12, v13, 48 * v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[48 * v8] || v12 >= &v13[48 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  result = sub_2158FF170();
  __break(1u);
  return result;
}

uint64_t sub_2158FC2E4(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_254DE9CD0);
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
  result = sub_2158FF170();
  __break(1u);
  return result;
}

uint64_t sub_2158FC440(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  int64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  int64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;
  char v23;
  unint64_t v24;
  BOOL v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD *v29;
  __int128 v30;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254DE9CC8);
  result = sub_2158FF158();
  v7 = result;
  if (*(_QWORD *)(v5 + 16))
  {
    v8 = 0;
    v29 = (_QWORD *)(v5 + 64);
    v9 = 1 << *(_BYTE *)(v5 + 32);
    if (v9 < 64)
      v10 = ~(-1 << v9);
    else
      v10 = -1;
    v11 = v10 & *(_QWORD *)(v5 + 64);
    v12 = (unint64_t)(v9 + 63) >> 6;
    v13 = result + 64;
    while (1)
    {
      if (v11)
      {
        v18 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        v19 = v18 | (v8 << 6);
      }
      else
      {
        v20 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
LABEL_41:
          __break(1u);
LABEL_42:
          __break(1u);
          return result;
        }
        result = v5 + 64;
        if (v20 >= v12)
          goto LABEL_33;
        v21 = v29[v20];
        ++v8;
        if (!v21)
        {
          v8 = v20 + 1;
          if (v20 + 1 >= v12)
            goto LABEL_33;
          v21 = v29[v8];
          if (!v21)
          {
            v22 = v20 + 2;
            if (v22 >= v12)
            {
LABEL_33:
              if ((a2 & 1) == 0)
              {
                result = swift_release();
                v3 = v2;
                goto LABEL_40;
              }
              v28 = 1 << *(_BYTE *)(v5 + 32);
              if (v28 >= 64)
                bzero(v29, ((unint64_t)(v28 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
              else
                *v29 = -1 << v28;
              v3 = v2;
              *(_QWORD *)(v5 + 16) = 0;
              break;
            }
            v21 = v29[v22];
            if (!v21)
            {
              while (1)
              {
                v8 = v22 + 1;
                if (__OFADD__(v22, 1))
                  goto LABEL_42;
                if (v8 >= v12)
                  goto LABEL_33;
                v21 = v29[v8];
                ++v22;
                if (v21)
                  goto LABEL_30;
              }
            }
            v8 = v22;
          }
        }
LABEL_30:
        v11 = (v21 - 1) & v21;
        v19 = __clz(__rbit64(v21)) + (v8 << 6);
      }
      v27 = *(_QWORD *)(*(_QWORD *)(v5 + 48) + 8 * v19);
      v30 = *(_OWORD *)(*(_QWORD *)(v5 + 56) + 16 * v19);
      if ((a2 & 1) == 0)
        sub_2158FA484(v30, *((unint64_t *)&v30 + 1));
      sub_2158FF1DC();
      sub_2158FF1E8();
      result = sub_2158FF1F4();
      v14 = -1 << *(_BYTE *)(v7 + 32);
      v15 = result & ~v14;
      v16 = v15 >> 6;
      if (((-1 << v15) & ~*(_QWORD *)(v13 + 8 * (v15 >> 6))) != 0)
      {
        v17 = __clz(__rbit64((-1 << v15) & ~*(_QWORD *)(v13 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v23 = 0;
        v24 = (unint64_t)(63 - v14) >> 6;
        do
        {
          if (++v16 == v24 && (v23 & 1) != 0)
          {
            __break(1u);
            goto LABEL_41;
          }
          v25 = v16 == v24;
          if (v16 == v24)
            v16 = 0;
          v23 |= v25;
          v26 = *(_QWORD *)(v13 + 8 * v16);
        }
        while (v26 == -1);
        v17 = __clz(__rbit64(~v26)) + (v16 << 6);
      }
      *(_QWORD *)(v13 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
      *(_QWORD *)(*(_QWORD *)(v7 + 48) + 8 * v17) = v27;
      *(_OWORD *)(*(_QWORD *)(v7 + 56) + 16 * v17) = v30;
      ++*(_QWORD *)(v7 + 16);
    }
  }
  result = swift_release();
LABEL_40:
  *v3 = v7;
  return result;
}

uint64_t sub_2158FC718(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  int64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  int64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  char v27;
  unint64_t v28;
  BOOL v29;
  uint64_t v30;
  uint64_t v31;
  char v32;
  _QWORD *v33;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254DE9CC0);
  result = sub_2158FF158();
  v7 = result;
  if (*(_QWORD *)(v5 + 16))
  {
    v32 = a2;
    v8 = 0;
    v33 = (_QWORD *)(v5 + 64);
    v9 = 1 << *(_BYTE *)(v5 + 32);
    if (v9 < 64)
      v10 = ~(-1 << v9);
    else
      v10 = -1;
    v11 = v10 & *(_QWORD *)(v5 + 64);
    v12 = (unint64_t)(v9 + 63) >> 6;
    v13 = result + 64;
    while (1)
    {
      if (v11)
      {
        v16 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        v17 = v16 | (v8 << 6);
      }
      else
      {
        v18 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
LABEL_39:
          __break(1u);
LABEL_40:
          __break(1u);
          return result;
        }
        result = v5 + 64;
        if (v18 >= v12)
          goto LABEL_31;
        v19 = v33[v18];
        ++v8;
        if (!v19)
        {
          v8 = v18 + 1;
          if (v18 + 1 >= v12)
            goto LABEL_31;
          v19 = v33[v8];
          if (!v19)
          {
            v20 = v18 + 2;
            if (v20 >= v12)
            {
LABEL_31:
              if ((v32 & 1) == 0)
              {
                result = swift_release();
                v3 = v2;
                goto LABEL_38;
              }
              v31 = 1 << *(_BYTE *)(v5 + 32);
              if (v31 >= 64)
                bzero(v33, ((unint64_t)(v31 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
              else
                *v33 = -1 << v31;
              v3 = v2;
              *(_QWORD *)(v5 + 16) = 0;
              break;
            }
            v19 = v33[v20];
            if (!v19)
            {
              while (1)
              {
                v8 = v20 + 1;
                if (__OFADD__(v20, 1))
                  goto LABEL_40;
                if (v8 >= v12)
                  goto LABEL_31;
                v19 = v33[v8];
                ++v20;
                if (v19)
                  goto LABEL_21;
              }
            }
            v8 = v20;
          }
        }
LABEL_21:
        v11 = (v19 - 1) & v19;
        v17 = __clz(__rbit64(v19)) + (v8 << 6);
      }
      v21 = 8 * v17;
      v22 = *(_QWORD *)(*(_QWORD *)(v5 + 48) + v21);
      v23 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + v21);
      sub_2158FF1DC();
      sub_2158FF1E8();
      result = sub_2158FF1F4();
      v24 = -1 << *(_BYTE *)(v7 + 32);
      v25 = result & ~v24;
      v26 = v25 >> 6;
      if (((-1 << v25) & ~*(_QWORD *)(v13 + 8 * (v25 >> 6))) != 0)
      {
        v14 = __clz(__rbit64((-1 << v25) & ~*(_QWORD *)(v13 + 8 * (v25 >> 6)))) | v25 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v27 = 0;
        v28 = (unint64_t)(63 - v24) >> 6;
        do
        {
          if (++v26 == v28 && (v27 & 1) != 0)
          {
            __break(1u);
            goto LABEL_39;
          }
          v29 = v26 == v28;
          if (v26 == v28)
            v26 = 0;
          v27 |= v29;
          v30 = *(_QWORD *)(v13 + 8 * v26);
        }
        while (v30 == -1);
        v14 = __clz(__rbit64(~v30)) + (v26 << 6);
      }
      *(_QWORD *)(v13 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
      v15 = 8 * v14;
      *(_QWORD *)(*(_QWORD *)(v7 + 48) + v15) = v22;
      *(_QWORD *)(*(_QWORD *)(v7 + 56) + v15) = v23;
      ++*(_QWORD *)(v7 + 16);
    }
  }
  result = swift_release();
LABEL_38:
  *v3 = v7;
  return result;
}

void *sub_2158FC9E4()
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
  __int128 v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254DE9CC8);
  v2 = *v0;
  v3 = sub_2158FF14C();
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
    v17 = *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v15);
    v18 = 16 * v15;
    v19 = *(_OWORD *)(*(_QWORD *)(v2 + 56) + v18);
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + v16) = v17;
    *(_OWORD *)(*(_QWORD *)(v4 + 56) + v18) = v19;
    result = (void *)sub_2158FA484(v19, *((unint64_t *)&v19 + 1));
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

void *sub_2158FCB90()
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
  unint64_t v21;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254DE9CC0);
  v2 = *v0;
  v3 = sub_2158FF14C();
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
    v21 = __clz(__rbit64(v19));
    v12 = (v19 - 1) & v19;
    v15 = v21 + (v9 << 6);
LABEL_12:
    v16 = 8 * v15;
    v17 = *(_QWORD *)(*(_QWORD *)(v2 + 56) + v16);
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + v16) = *(_QWORD *)(*(_QWORD *)(v2 + 48) + v16);
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v16) = v17;
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

uint64_t sub_2158FCD1C(uint64_t a1)
{
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;
  unsigned int v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t *v9;
  unint64_t v10;

  v1 = *(_QWORD *)(a1 + 64);
  if (v1)
  {
    v2 = 0;
    return __clz(__rbit64(v1)) + v2;
  }
  v5 = *(_BYTE *)(a1 + 32);
  v6 = v5 & 0x3F;
  v3 = 1 << v5;
  if (v6 < 7)
    return v3;
  v1 = *(_QWORD *)(a1 + 72);
  if (v1)
  {
    v2 = 64;
    return __clz(__rbit64(v1)) + v2;
  }
  v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 2)
    v7 = 2;
  v8 = v7 - 2;
  v9 = (unint64_t *)(a1 + 80);
  v2 = 64;
  while (v8)
  {
    v10 = *v9++;
    v1 = v10;
    --v8;
    v2 += 64;
    if (v10)
      return __clz(__rbit64(v1)) + v2;
  }
  return v3;
}

uint64_t sub_2158FCDA4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t result;
  uint64_t v9;
  void *v10;
  id v11;
  char v12;
  uint64_t v13;
  void *v14;
  const void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD aBlock[6];

  v0 = sub_2158FEF3C();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v16 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_2158FEF54();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = swift_weakLoadStrong();
  if (result)
  {
    v9 = result;
    v10 = (void *)sub_2158FEE64();
    v11 = objc_msgSend(v10, sel_code);

    if (v11 == (id)17)
      v12 = 11;
    else
      v12 = 0;
    v18 = *(_QWORD *)(v9 + 80);
    v13 = swift_allocObject();
    *(_QWORD *)(v13 + 16) = v9;
    *(_BYTE *)(v13 + 24) = v12;
    aBlock[4] = sub_2158FEAB8;
    aBlock[5] = v13;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_2158F344C;
    aBlock[3] = &block_descriptor_50;
    v14 = _Block_copy(aBlock);
    v17 = v1;
    v15 = v14;
    swift_retain();
    sub_2158FEF48();
    v19 = MEMORY[0x24BEE4AF8];
    sub_2158FECF8(&qword_254DE9C70, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_254DE9C78);
    sub_2158FED38(&qword_254DE9C80, &qword_254DE9C78);
    sub_2158FF0D4();
    MEMORY[0x2199E7940](0, v7, v3, v15);
    _Block_release(v15);
    (*(void (**)(char *, uint64_t))(v17 + 8))(v3, v0);
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t sub_2158FCFE0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t result;
  uint64_t v15;
  _QWORD *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD aBlock[6];

  v8 = sub_2158FEF3C();
  v20 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = sub_2158FEF54();
  v11 = *(_QWORD *)(v19 - 8);
  MEMORY[0x24BDAC7A8](v19);
  v13 = (char *)&v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = swift_weakLoadStrong();
  if (result)
  {
    v15 = result;
    v18 = *(_QWORD *)(result + 80);
    v16 = (_QWORD *)swift_allocObject();
    v16[2] = v15;
    v16[3] = a1;
    v16[4] = a2;
    v16[5] = a3;
    v16[6] = a4;
    aBlock[4] = sub_2158FE974;
    aBlock[5] = v16;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_2158F344C;
    aBlock[3] = &block_descriptor_44;
    v17 = _Block_copy(aBlock);
    swift_retain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_2158FEF48();
    v21 = MEMORY[0x24BEE4AF8];
    sub_2158FECF8(&qword_254DE9C70, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_254DE9C78);
    sub_2158FED38(&qword_254DE9C80, &qword_254DE9C78);
    sub_2158FF0D4();
    MEMORY[0x2199E7940](0, v13, v10, v17);
    _Block_release(v17);
    (*(void (**)(char *, uint64_t))(v20 + 8))(v10, v8);
    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v19);
    swift_release();
    return swift_release();
  }
  return result;
}

unint64_t sub_2158FD20C(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t *i;
  uint64_t v5;
  uint64_t v6;
  unint64_t result;
  char v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;

  v1 = *(_QWORD *)(a1 + 16);
  if (v1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_254DE9CC0);
    v3 = (_QWORD *)sub_2158FF164();
    for (i = (uint64_t *)(a1 + 40); ; i += 2)
    {
      v5 = *(i - 1);
      v6 = *i;
      result = sub_2158FBE90(v5);
      if ((v8 & 1) != 0)
        break;
      *(_QWORD *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
      v9 = 8 * result;
      *(_QWORD *)(v3[6] + v9) = v5;
      *(_QWORD *)(v3[7] + v9) = v6;
      v10 = v3[2];
      v11 = __OFADD__(v10, 1);
      v12 = v10 + 1;
      if (v11)
        goto LABEL_10;
      v3[2] = v12;
      if (!--v1)
        return (unint64_t)v3;
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

unint64_t sub_2158FD2E0(_QWORD *a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t result;
  char v8;
  unint64_t *v9;
  uint64_t *v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  char v14;

  v1 = a1[2];
  if (!v1)
    return MEMORY[0x24BEE4B00];
  __swift_instantiateConcreteTypeFromMangledName(&qword_254DE9CC8);
  v3 = (_QWORD *)sub_2158FF164();
  v5 = a1[4];
  v4 = a1[5];
  v6 = a1[6];
  result = sub_2158FBE90(v5);
  if ((v8 & 1) != 0)
  {
LABEL_7:
    __break(1u);
    return MEMORY[0x24BEE4B00];
  }
  v9 = a1 + 9;
  while (1)
  {
    *(_QWORD *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    *(_QWORD *)(v3[6] + 8 * result) = v5;
    v10 = (uint64_t *)(v3[7] + 16 * result);
    *v10 = v4;
    v10[1] = v6;
    v11 = v3[2];
    v12 = __OFADD__(v11, 1);
    v13 = v11 + 1;
    if (v12)
      break;
    v3[2] = v13;
    sub_2158FA484(v4, v6);
    if (!--v1)
      return (unint64_t)v3;
    v5 = *(v9 - 2);
    v4 = *(v9 - 1);
    v6 = *v9;
    result = sub_2158FBE90(v5);
    v9 += 3;
    if ((v14 & 1) != 0)
      goto LABEL_7;
  }
  __break(1u);
  return result;
}

uint64_t sub_2158FD3E0(unint64_t a1, void *a2, uint64_t a3)
{
  void *v3;
  void *v4;
  unint64_t v6;
  uint64_t v7;
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  id v14;
  char v15;
  _QWORD *v16;
  char v17;
  unint64_t v18;
  uint64_t v19;
  _BOOL8 v20;
  uint64_t v21;
  char v22;
  unint64_t v23;
  char v24;
  _QWORD *v25;
  uint64_t v26;
  uint64_t v27;
  BOOL v28;
  uint64_t v29;
  id v30;
  void *v31;
  uint64_t v32;
  unint64_t v33;
  char isUniquelyReferenced_nonNull_native;
  _QWORD *v35;
  char v36;
  unint64_t v37;
  uint64_t v38;
  _BOOL8 v39;
  uint64_t v40;
  char v41;
  unint64_t v42;
  char v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  unint64_t v49;
  uint64_t v50;
  void *v51;
  unint64_t v52;
  unint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v58;

  v4 = v3;
  v6 = a1;
  if (a1 >> 62)
    goto LABEL_45;
  v7 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
LABEL_3:
  result = MEMORY[0x24BEE4AF8];
  if (v7)
  {
    v58 = MEMORY[0x24BEE4AF8];
    v54 = v7;
    sub_2158FC144(0, v7 & ~(v7 >> 63), 0);
    v9 = v54;
    if ((v54 & 0x8000000000000000) == 0)
    {
      v51 = v4;
      v52 = v6;
      v10 = 0;
      v53 = v6 & 0xC000000000000001;
      result = v58;
      v55 = a3;
      while (1)
      {
        if (v9 == v10)
        {
          __break(1u);
LABEL_41:
          __break(1u);
LABEL_42:
          __break(1u);
LABEL_43:
          __break(1u);
LABEL_44:
          __break(1u);
LABEL_45:
          swift_bridgeObjectRetain();
          v50 = sub_2158FF140();
          swift_bridgeObjectRelease();
          v7 = v50;
          goto LABEL_3;
        }
        v56 = result;
        v11 = v53 ? (id)MEMORY[0x2199E79DC](v10, v6) : *(id *)(v6 + 8 * v10 + 32);
        v4 = v11;
        v12 = objc_msgSend(v11, sel_integerValue, v51);
        v13 = objc_msgSend(a2, sel_getStatusForRKEFunction_, v4);
        if (v13)
          break;
LABEL_23:
        v30 = objc_msgSend(a2, sel_getProprietaryDataForRKEFunction_, v4);
        if (v30)
        {
          v31 = v30;
          v32 = sub_2158FEE88();
          v6 = v33;

          sub_2158FA484(v32, v6);
          isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
          v35 = *(_QWORD **)(a3 + 40);
          *(_QWORD *)(a3 + 40) = 0x8000000000000000;
          a3 = (uint64_t)v12;
          v37 = sub_2158FBE90((uint64_t)v12);
          v38 = v35[2];
          v39 = (v36 & 1) == 0;
          v40 = v38 + v39;
          if (__OFADD__(v38, v39))
            goto LABEL_42;
          v41 = v36;
          if (v35[3] >= v40)
          {
            if ((isUniquelyReferenced_nonNull_native & 1) != 0)
            {
              if ((v36 & 1) == 0)
                goto LABEL_33;
            }
            else
            {
              sub_2158FC9E4();
              if ((v41 & 1) == 0)
                goto LABEL_33;
            }
          }
          else
          {
            sub_2158FC440(v40, isUniquelyReferenced_nonNull_native);
            v42 = sub_2158FBE90(a3);
            if ((v41 & 1) != (v43 & 1))
              goto LABEL_47;
            v37 = v42;
            if ((v41 & 1) == 0)
            {
LABEL_33:
              v35[(v37 >> 6) + 8] |= 1 << v37;
              *(_QWORD *)(v35[6] + 8 * v37) = a3;
              v45 = (uint64_t *)(v35[7] + 16 * v37);
              *v45 = v32;
              v45[1] = v6;
              v46 = v35[2];
              v28 = __OFADD__(v46, 1);
              v47 = v46 + 1;
              if (v28)
                goto LABEL_44;
              v12 = (id)a3;
              v35[2] = v47;
              goto LABEL_35;
            }
          }
          v44 = v35[7] + 16 * v37;
          sub_2158FA8E8(*(_QWORD *)v44, *(_QWORD *)(v44 + 8));
          *(_QWORD *)v44 = v32;
          *(_QWORD *)(v44 + 8) = v6;
          v12 = (id)a3;
LABEL_35:
          a3 = v55;
          *(_QWORD *)(v55 + 40) = v35;
          swift_bridgeObjectRelease();
          sub_2158FA8E8(v32, v6);
        }

        result = v56;
        v49 = *(_QWORD *)(v56 + 16);
        v48 = *(_QWORD *)(v56 + 24);
        v4 = (void *)(v49 + 1);
        if (v49 >= v48 >> 1)
        {
          sub_2158FC144(v48 > 1, v49 + 1, 1);
          result = v56;
        }
        ++v10;
        *(_QWORD *)(result + 16) = v4;
        *(_QWORD *)(result + 8 * v49 + 32) = v12;
        v9 = v54;
        v6 = v52;
        if (v54 == v10)
          return result;
      }
      v6 = (unint64_t)v13;
      v14 = objc_msgSend(v13, sel_integerValue);
      v15 = swift_isUniquelyReferenced_nonNull_native();
      v16 = *(_QWORD **)(a3 + 32);
      *(_QWORD *)(a3 + 32) = 0x8000000000000000;
      a3 = (uint64_t)v12;
      v18 = sub_2158FBE90((uint64_t)v12);
      v19 = v16[2];
      v20 = (v17 & 1) == 0;
      v21 = v19 + v20;
      if (__OFADD__(v19, v20))
        goto LABEL_41;
      v22 = v17;
      if (v16[3] < v21)
      {
        sub_2158FC718(v21, v15);
        v23 = sub_2158FBE90(a3);
        if ((v22 & 1) != (v24 & 1))
          goto LABEL_47;
        v18 = v23;
        v25 = v16;
        if ((v22 & 1) == 0)
          goto LABEL_20;
LABEL_18:
        *(_QWORD *)(v25[7] + 8 * v18) = v14;
        v12 = (id)a3;
LABEL_22:
        a3 = v55;
        *(_QWORD *)(v55 + 32) = v25;

        swift_bridgeObjectRelease();
        goto LABEL_23;
      }
      if ((v15 & 1) != 0)
      {
        v25 = v16;
        if ((v17 & 1) != 0)
          goto LABEL_18;
      }
      else
      {
        sub_2158FCB90();
        v25 = v16;
        if ((v22 & 1) != 0)
          goto LABEL_18;
      }
LABEL_20:
      v25[(v18 >> 6) + 8] |= 1 << v18;
      v26 = 8 * v18;
      *(_QWORD *)(v25[6] + v26) = a3;
      *(_QWORD *)(v25[7] + v26) = v14;
      v27 = v25[2];
      v28 = __OFADD__(v27, 1);
      v29 = v27 + 1;
      if (v28)
        goto LABEL_43;
      v12 = (id)a3;
      v25[2] = v29;
      goto LABEL_22;
    }
    __break(1u);
LABEL_47:
    result = sub_2158FF194();
    __break(1u);
  }
  return result;
}

void sub_2158FD830(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t Strong;
  uint64_t v14;
  unint64_t v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  os_log_type_t v21;
  uint8_t *v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  BOOL v28;
  uint64_t v29;
  uint64_t v30;
  __int128 v31;
  void *v32;
  char v33;
  _QWORD v34[2];
  uint64_t v35;
  uint64_t v36;
  __int128 aBlock;
  __int128 v38;
  uint64_t (*v39)();
  uint64_t v40;
  _QWORD v41[2];
  __int128 v42;
  __int128 v43;
  __int128 v44;

  v6 = sub_2158FEF3C();
  v36 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)v34 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_2158FEF54();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)v34 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  Strong = swift_weakLoadStrong();
  if (Strong)
  {
    v14 = Strong;
    strcpy((char *)v41, "xpcEventName");
    BYTE5(v41[1]) = 0;
    HIWORD(v41[1]) = -5120;
    sub_2158FF0F8();
    if (*(_QWORD *)(a1 + 16) && (v15 = sub_2158FBE60((uint64_t)&v42), (v16 & 1) != 0))
    {
      sub_2158FE8A4(*(_QWORD *)(a1 + 56) + 32 * v15, (uint64_t)&aBlock);
    }
    else
    {
      aBlock = 0u;
      v38 = 0u;
    }
    sub_2158FE6B8((uint64_t)&v42);
    if (*((_QWORD *)&v38 + 1))
    {
      if ((swift_dynamicCast() & 1) != 0)
      {
        v35 = v14;
        v18 = v41[0];
        v17 = v41[1];
        if (v41[0] == 0xD000000000000042 && v41[1] == 0x8000000215900410
          || (sub_2158FF17C() & 1) != 0
          || v18 == 0xD00000000000003FLL && v17 == 0x8000000215900460)
        {
          swift_bridgeObjectRelease();
LABEL_23:
          v23 = sub_2158F370C();
          v24 = v23[2];
          if (!v24)
          {
LABEL_33:
            swift_release();
            swift_bridgeObjectRelease();
            return;
          }
          v25 = 4;
          while (1)
          {
            v26 = *(_OWORD *)&v23[v25 + 4];
            v27 = *(_OWORD *)&v23[v25];
            v43 = *(_OWORD *)&v23[v25 + 2];
            v44 = v26;
            v42 = v27;
            v28 = (_QWORD)v27 == a2 && *((_QWORD *)&v27 + 1) == a3;
            if (v28 || (sub_2158FF17C() & 1) != 0)
              break;
            v25 += 6;
            if (!--v24)
              goto LABEL_33;
          }
          sub_2158FE6EC((uint64_t)&v42);
          swift_bridgeObjectRelease();
          v29 = v35;
          v34[1] = *(_QWORD *)(v35 + 80);
          v30 = swift_allocObject();
          v31 = v43;
          *(_OWORD *)(v30 + 24) = v42;
          *(_QWORD *)(v30 + 16) = v29;
          *(_OWORD *)(v30 + 40) = v31;
          *(_OWORD *)(v30 + 56) = v44;
          v39 = sub_2158FE780;
          v40 = v30;
          *(_QWORD *)&aBlock = MEMORY[0x24BDAC760];
          *((_QWORD *)&aBlock + 1) = 1107296256;
          *(_QWORD *)&v38 = sub_2158F344C;
          *((_QWORD *)&v38 + 1) = &block_descriptor_38;
          v32 = _Block_copy(&aBlock);
          swift_retain();
          sub_2158FEF48();
          v41[0] = MEMORY[0x24BEE4AF8];
          sub_2158FECF8(&qword_254DE9C70, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
          __swift_instantiateConcreteTypeFromMangledName(&qword_254DE9C78);
          sub_2158FED38(&qword_254DE9C80, &qword_254DE9C78);
          sub_2158FF0D4();
          MEMORY[0x2199E7940](0, v12, v8, v32);
          _Block_release(v32);
          (*(void (**)(char *, uint64_t))(v36 + 8))(v8, v6);
          (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
          swift_release();
          goto LABEL_17;
        }
        v33 = sub_2158FF17C();
        swift_bridgeObjectRelease();
        if ((v33 & 1) != 0)
          goto LABEL_23;
LABEL_17:
        swift_release();
        return;
      }
    }
    else
    {
      sub_2158FEC84((uint64_t)&aBlock, &qword_254DE9C88);
    }
    if (qword_254DE9D60 != -1)
      swift_once();
    v19 = sub_2158FEF30();
    __swift_project_value_buffer(v19, (uint64_t)qword_254DE9D68);
    v20 = sub_2158FEF18();
    v21 = sub_2158FF038();
    if (os_log_type_enabled(v20, v21))
    {
      v22 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v22 = 0;
      _os_log_impl(&dword_2158F0000, v20, v21, "Unable to convert event name to string, dropping event", v22, 2u);
      MEMORY[0x2199E7E50](v22, -1, -1);
      swift_release();

      return;
    }

    goto LABEL_17;
  }
}

uint64_t sub_2158FDEEC(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t result;
  uint64_t v15;
  _QWORD *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD aBlock[6];

  v8 = sub_2158FEF3C();
  v20 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = sub_2158FEF54();
  v11 = *(_QWORD *)(v19 - 8);
  MEMORY[0x24BDAC7A8](v19);
  v13 = (char *)&v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = swift_weakLoadStrong();
  if (result)
  {
    v15 = result;
    v18 = *(_QWORD *)(result + 80);
    v16 = (_QWORD *)swift_allocObject();
    v16[2] = v15;
    v16[3] = a1;
    v16[4] = a2;
    v16[5] = a3;
    v16[6] = a4;
    aBlock[4] = sub_2158FE598;
    aBlock[5] = v16;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_2158F344C;
    aBlock[3] = &block_descriptor_32;
    v17 = _Block_copy(aBlock);
    swift_retain();
    sub_2158FA484(a1, a2);
    swift_bridgeObjectRetain();
    sub_2158FEF48();
    v21 = MEMORY[0x24BEE4AF8];
    sub_2158FECF8(&qword_254DE9C70, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_254DE9C78);
    sub_2158FED38(&qword_254DE9C80, &qword_254DE9C78);
    sub_2158FF0D4();
    MEMORY[0x2199E7940](0, v13, v10, v17);
    _Block_release(v17);
    (*(void (**)(char *, uint64_t))(v20 + 8))(v10, v8);
    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v19);
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t sub_2158FE11C(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t v10;
  _QWORD v12[5];
  _BYTE v13[24];
  uint64_t v14;

  v3 = v2;
  if (qword_254DE9D60 != -1)
    swift_once();
  v6 = sub_2158FEF30();
  __swift_project_value_buffer(v6, (uint64_t)qword_254DE9D68);
  v7 = sub_2158FEF18();
  v8 = sub_2158FF044();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_2158F0000, v7, v8, "Received continuation request", v9, 2u);
    MEMORY[0x2199E7E50](v9, -1, -1);
  }

  v10 = v3
      + OBJC_IVAR____TtC6CarKeyP33_86CE746C1DFB40AB47D6F76682ACEEE140SESRKESessionContinuationDelegateHandler_delegate;
  swift_beginAccess();
  sub_2158FE2CC(v10, (uint64_t)v13, &qword_254DE9C38);
  if (!v14)
    return sub_2158FEC84((uint64_t)v13, &qword_254DE9C38);
  sub_2158FED78((uint64_t)v13, (uint64_t)v12);
  sub_2158FEC84((uint64_t)v13, &qword_254DE9C38);
  __swift_project_boxed_opaque_existential_1(v12, v12[3]);
  sub_2158F8320(a1, a2);
  return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v12);
}

uint64_t sub_2158FE294(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_2158FA8E8(a1, a2);
  return a1;
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_2158FE2CC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
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

void sub_2158FE350(uint64_t a1)
{
  uint64_t v1;

  sub_2158F41F0(a1, *(void ***)(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t sub_2158FE358()
{
  uint64_t v0;
  uint64_t v1;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DE9C60);
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)), v1);
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2158FE3D0(void *a1, void *a2)
{
  uint64_t v2;
  uint64_t v5;
  id v6;
  uint64_t result;
  uint64_t v8;
  objc_class *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  objc_super v14;

  v5 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_254DE9C60) - 8);
  if (a2)
  {
    v14.receiver = a2;
    v6 = a2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_254DE9C60);
    return sub_2158FEFC0();
  }
  else if (a1)
  {
    v8 = *(_QWORD *)(v2
                   + ((*(_QWORD *)(v5 + 64)
                     + ((*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80))
                     + 7) & 0xFFFFFFFFFFFFF8));
    v9 = (objc_class *)type metadata accessor for RKESessionDelegate();
    v10 = objc_allocWithZone(v9);
    swift_weakInit();
    swift_weakAssign();
    v14.receiver = v10;
    v14.super_class = v9;
    v11 = a1;
    v12 = objc_msgSendSuper2(&v14, sel_init);
    v13 = *(void **)(v8 + 88);
    *(_QWORD *)(v8 + 88) = v12;

    objc_msgSend(v11, sel_setDelegate_, *(_QWORD *)(v8 + 88));
    __swift_instantiateConcreteTypeFromMangledName(&qword_254DE9C60);
    return sub_2158FEFCC();
  }
  else
  {
    result = sub_2158FF134();
    __break(1u);
  }
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

_OWORD *sub_2158FE54C(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_2158FE55C()
{
  return swift_release();
}

uint64_t sub_2158FE564()
{
  uint64_t v0;

  swift_release();
  sub_2158FA8E8(*(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32));
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_2158FE598()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t v10;
  uint64_t v11;

  v1 = (_QWORD *)v0[2];
  v2 = v0[3];
  v3 = v0[4];
  v4 = v0[5];
  v5 = v0[6];
  if (qword_254DE9D60 != -1)
    swift_once();
  v6 = sub_2158FEF30();
  __swift_project_value_buffer(v6, (uint64_t)qword_254DE9D68);
  v7 = sub_2158FEF18();
  v8 = sub_2158FF038();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_2158F0000, v7, v8, "Calling delegate didReceivePassthroughData", v9, 2u);
    MEMORY[0x2199E7E50](v9, -1, -1);
  }

  v10 = v1[8];
  v11 = v1[9];
  __swift_project_boxed_opaque_existential_1(v1 + 5, v10);
  return (*(uint64_t (**)(_QWORD *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v11 + 32))(v1, v2, v3, v4, v5, v10, v11);
}

uint64_t sub_2158FE6B8(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(MEMORY[0x24BEE23D0] - 8) + 8))();
  return a1;
}

uint64_t sub_2158FE6EC(uint64_t a1)
{
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_2158FE73C()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_2158FE780()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  _OWORD v11[3];

  v1 = v0;
  v2 = *(_QWORD **)(v0 + 16);
  if (qword_254DE9D60 != -1)
    swift_once();
  v3 = sub_2158FEF30();
  __swift_project_value_buffer(v3, (uint64_t)qword_254DE9D68);
  v4 = sub_2158FEF18();
  v5 = sub_2158FF038();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_2158F0000, v4, v5, "Calling delegate vehicleDidUpdateReport", v6, 2u);
    MEMORY[0x2199E7E50](v6, -1, -1);
  }

  v7 = v2[8];
  v8 = v2[9];
  __swift_project_boxed_opaque_existential_1(v2 + 5, v7);
  v9 = *(_OWORD *)(v1 + 40);
  v11[0] = *(_OWORD *)(v1 + 24);
  v11[1] = v9;
  v11[2] = *(_OWORD *)(v1 + 56);
  return (*(uint64_t (**)(_QWORD *, _OWORD *, uint64_t, uint64_t))(v8 + 24))(v2, v11, v7, v8);
}

uint64_t sub_2158FE8A4(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
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

uint64_t sub_2158FE904(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(MEMORY[0x24BEE23D0] - 8) + 16))(a2, a1);
  return a2;
}

uint64_t sub_2158FE940()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_2158FE974()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t v10;
  uint64_t v11;

  v1 = (_QWORD *)v0[2];
  v2 = v0[3];
  v3 = v0[4];
  v4 = v0[5];
  v5 = v0[6];
  if (qword_254DE9D60 != -1)
    swift_once();
  v6 = sub_2158FEF30();
  __swift_project_value_buffer(v6, (uint64_t)qword_254DE9D68);
  v7 = sub_2158FEF18();
  v8 = sub_2158FF038();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_2158F0000, v7, v8, "Calling delegate didCreateKey", v9, 2u);
    MEMORY[0x2199E7E50](v9, -1, -1);
  }

  v10 = v1[8];
  v11 = v1[9];
  __swift_project_boxed_opaque_existential_1(v1 + 5, v10);
  return (*(uint64_t (**)(_QWORD *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v11 + 16))(v1, v2, v3, v4, v5, v10, v11);
}

uint64_t sub_2158FEA94()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2158FEAB8()
{
  uint64_t v0;
  _QWORD *v1;
  char v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  uint64_t v7;
  uint64_t v8;
  char v10;

  v1 = *(_QWORD **)(v0 + 16);
  v2 = *(_BYTE *)(v0 + 24);
  if (qword_254DE9D60 != -1)
    swift_once();
  v3 = sub_2158FEF30();
  __swift_project_value_buffer(v3, (uint64_t)qword_254DE9D68);
  v4 = sub_2158FEF18();
  v5 = sub_2158FF038();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_2158F0000, v4, v5, "Calling delegate didInvalidateWithError", v6, 2u);
    MEMORY[0x2199E7E50](v6, -1, -1);
  }

  v7 = v1[8];
  v8 = v1[9];
  __swift_project_boxed_opaque_existential_1(v1 + 5, v7);
  v10 = v2;
  return (*(uint64_t (**)(_QWORD *, char *, uint64_t, uint64_t))(v8 + 8))(v1, &v10, v7, v8);
}

uint64_t sub_2158FEBCC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *(_QWORD *)(v1 + 16);
  sub_2158FEC84(v3, &qword_254DE9710);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DE9720);
  v5 = *(_QWORD *)(v4 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v3, a1, v4);
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v5 + 56))(v3, 0, 1, v4);
}

uint64_t sub_2158FEC40(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 40))(a2, a1, v5);
  return a2;
}

uint64_t sub_2158FEC84(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_2158FECC0(uint64_t a1, unint64_t *a2)
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

uint64_t sub_2158FECF8(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x2199E7DF0](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_2158FED38(unint64_t *a1, uint64_t *a2)
{
  uint64_t result;
  uint64_t v4;

  result = *a1;
  if (!result)
  {
    v4 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x2199E7DF0](MEMORY[0x24BEE12C8], v4);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_2158FED78(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_2158FEDBC(__int128 *a1, uint64_t a2)
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

uint64_t sub_2158FEE64()
{
  return MEMORY[0x24BDCD2F0]();
}

uint64_t sub_2158FEE70()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_2158FEE7C()
{
  return MEMORY[0x24BDCDCA0]();
}

uint64_t sub_2158FEE88()
{
  return MEMORY[0x24BDCDCE0]();
}

uint64_t sub_2158FEE94()
{
  return MEMORY[0x24BEE7718]();
}

uint64_t sub_2158FEEA0()
{
  return MEMORY[0x24BEE7738]();
}

uint64_t sub_2158FEEAC()
{
  return MEMORY[0x24BEE7758]();
}

uint64_t sub_2158FEEB8()
{
  return MEMORY[0x24BEE7790]();
}

uint64_t sub_2158FEEC4()
{
  return MEMORY[0x24BEE77C0]();
}

uint64_t sub_2158FEED0()
{
  return MEMORY[0x24BEE77F0]();
}

uint64_t sub_2158FEEDC()
{
  return MEMORY[0x24BEE7818]();
}

uint64_t sub_2158FEEE8()
{
  return MEMORY[0x24BEE7848]();
}

uint64_t sub_2158FEEF4()
{
  return MEMORY[0x24BEE7868]();
}

uint64_t sub_2158FEF00()
{
  return MEMORY[0x24BEE7870]();
}

uint64_t sub_2158FEF0C()
{
  return MEMORY[0x24BEE78A0]();
}

uint64_t sub_2158FEF18()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_2158FEF24()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_2158FEF30()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_2158FEF3C()
{
  return MEMORY[0x24BEE5458]();
}

uint64_t sub_2158FEF48()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t sub_2158FEF54()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_2158FEF60()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_2158FEF6C()
{
  return MEMORY[0x24BDCF830]();
}

uint64_t sub_2158FEF78()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_2158FEF84()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_2158FEF90()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_2158FEF9C()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_2158FEFA8()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_2158FEFB4()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_2158FEFC0()
{
  return MEMORY[0x24BEE6820]();
}

uint64_t sub_2158FEFCC()
{
  return MEMORY[0x24BEE6828]();
}

uint64_t sub_2158FEFD8()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t sub_2158FEFE4()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t sub_2158FEFF0()
{
  return MEMORY[0x24BEE6A30]();
}

uint64_t sub_2158FEFFC()
{
  return MEMORY[0x24BEE6A38]();
}

uint64_t sub_2158FF008()
{
  return MEMORY[0x24BEE6AA0]();
}

uint64_t sub_2158FF014()
{
  return MEMORY[0x24BEE6AC0]();
}

uint64_t sub_2158FF020()
{
  return MEMORY[0x24BDCFD18]();
}

uint64_t sub_2158FF02C()
{
  return MEMORY[0x24BDCFD28]();
}

uint64_t sub_2158FF038()
{
  return MEMORY[0x24BEE78F0]();
}

uint64_t sub_2158FF044()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t sub_2158FF050()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_2158FF05C()
{
  return MEMORY[0x24BEE5688]();
}

uint64_t sub_2158FF068()
{
  return MEMORY[0x24BEE5760]();
}

uint64_t sub_2158FF074()
{
  return MEMORY[0x24BEE5790]();
}

uint64_t sub_2158FF080()
{
  return MEMORY[0x24BEE57A0]();
}

uint64_t sub_2158FF08C()
{
  return MEMORY[0x24BEE7940]();
}

uint64_t sub_2158FF098()
{
  return MEMORY[0x24BEE7948]();
}

uint64_t sub_2158FF0A4()
{
  return MEMORY[0x24BEE7968]();
}

uint64_t sub_2158FF0B0()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_2158FF0BC()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_2158FF0C8()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_2158FF0D4()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_2158FF0E0()
{
  return MEMORY[0x24BEE23A0]();
}

uint64_t sub_2158FF0EC()
{
  return MEMORY[0x24BEE23A8]();
}

uint64_t sub_2158FF0F8()
{
  return MEMORY[0x24BEE23E8]();
}

uint64_t sub_2158FF104()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_2158FF110()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_2158FF11C()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_2158FF128()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_2158FF134()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_2158FF140()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_2158FF14C()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_2158FF158()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_2158FF164()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_2158FF170()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_2158FF17C()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_2158FF188()
{
  return MEMORY[0x24BEE70E0]();
}

uint64_t sub_2158FF194()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_2158FF1A0()
{
  return MEMORY[0x24BDD0708]();
}

uint64_t sub_2158FF1AC()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_2158FF1B8()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_2158FF1C4()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_2158FF1D0()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_2158FF1DC()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_2158FF1E8()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_2158FF1F4()
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

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACC10](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
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

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x24BEE5008]();
}

uint64_t swift_weakAssign()
{
  return MEMORY[0x24BEE5010]();
}

uint64_t swift_weakDestroy()
{
  return MEMORY[0x24BEE5028]();
}

uint64_t swift_weakInit()
{
  return MEMORY[0x24BEE5030]();
}

uint64_t swift_weakLoadStrong()
{
  return MEMORY[0x24BEE5038]();
}

