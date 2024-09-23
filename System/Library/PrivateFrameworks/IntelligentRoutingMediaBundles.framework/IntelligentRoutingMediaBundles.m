uint64_t sub_24005F3DC()
{
  uint64_t v0;

  v0 = sub_240065C8C();
  __swift_allocate_value_buffer(v0, qword_256FB1CF8);
  __swift_project_value_buffer(v0, (uint64_t)qword_256FB1CF8);
  return sub_240065C80();
}

uint64_t static IRMBManager.query(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v7;

  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = sub_24005F4C4;
  v7[8] = a3;
  v7[9] = 0;
  v7[6] = a1;
  v7[7] = a2;
  return swift_task_switch();
}

uint64_t sub_24005F4C4()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t static IRMBManager.query(_:priorBundle:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;

  v4[8] = a3;
  v4[9] = a4;
  v4[6] = a1;
  v4[7] = a2;
  return swift_task_switch();
}

uint64_t sub_24005F528()
{
  uint64_t v0;
  unint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  int v12;
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
  __int128 v26;
  __int128 v27;

  v1 = sub_240064AE4();
  if (!v1)
    v1 = sub_24005F768(MEMORY[0x24BEE4AF8]);
  v2 = v1;
  if (*(_QWORD *)(v1 + 16))
  {
    v4 = *(_QWORD *)(v0 + 56);
    v3 = *(_QWORD *)(v0 + 64);
    swift_bridgeObjectRetain();
    v5 = sub_2400624FC(v4, v3);
    if ((v6 & 1) != 0)
    {
      v7 = *(_QWORD *)(v2 + 56) + 32 * v5;
      v9 = *(_QWORD *)v7;
      v8 = *(_QWORD *)(v7 + 8);
      v10 = *(unsigned __int8 *)(v7 + 16);
      v11 = *(unsigned __int8 *)(v7 + 17);
      v12 = *(unsigned __int8 *)(v7 + 18);
      v13 = *(_QWORD *)(v7 + 24);
      v14 = 256;
      if (!v11)
        v14 = 0;
      v15 = v14 | v10;
      v16 = 0x10000;
      if (!v12)
        v16 = 0;
      v17 = v15 | v16;
      swift_bridgeObjectRetain();
    }
    else
    {
      v9 = 0;
      v8 = 0;
      v17 = 0;
      v13 = 0;
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    v9 = 0;
    v8 = 0;
    v17 = 0;
    v13 = 0;
  }
  *(_QWORD *)(v0 + 80) = v8;
  v19 = *(_QWORD *)(v0 + 56);
  v18 = *(_QWORD *)(v0 + 64);
  swift_bridgeObjectRelease();
  v20 = sub_240065278(v19, v18);
  v22 = v21;
  *(_QWORD *)(v0 + 88) = v21;
  *(_QWORD *)(v0 + 16) = v9;
  *(_QWORD *)(v0 + 24) = v8;
  *(_QWORD *)(v0 + 32) = v17;
  *(_QWORD *)(v0 + 40) = v13;
  v23 = swift_task_alloc();
  *(_QWORD *)(v0 + 96) = v23;
  *(_QWORD *)v23 = v0;
  *(_QWORD *)(v23 + 8) = sub_24005F694;
  v25 = *(_QWORD *)(v0 + 64);
  v24 = *(_QWORD *)(v0 + 72);
  v26 = *(_OWORD *)(v0 + 48);
  *(_QWORD *)(v23 + 80) = v20;
  *(_QWORD *)(v23 + 88) = v22;
  *(_QWORD *)(v23 + 64) = v25;
  *(_QWORD *)(v23 + 72) = v24;
  *(_OWORD *)(v23 + 48) = v26;
  v27 = *(_OWORD *)(v0 + 32);
  *(_OWORD *)(v23 + 96) = *(_OWORD *)(v0 + 16);
  *(_OWORD *)(v23 + 112) = v27;
  return swift_task_switch();
}

uint64_t sub_24005F694()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 104) = v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  return swift_task_switch();
}

uint64_t sub_24005F700()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_24005F734()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

unint64_t sub_24005F768(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  char v11;
  char v12;
  uint64_t v13;
  unint64_t result;
  char v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  BOOL v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  if (!*(_QWORD *)(a1 + 16))
  {
    v3 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_254351B30);
  v2 = sub_240065DC4();
  v3 = (_QWORD *)v2;
  v4 = *(_QWORD *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  v21 = v2 + 64;
  swift_retain();
  v5 = (_QWORD *)(a1 + 72);
  while (1)
  {
    v22 = v4;
    v6 = *(v5 - 5);
    v7 = *(v5 - 4);
    v9 = *(v5 - 3);
    v8 = *(v5 - 2);
    v10 = *((_BYTE *)v5 - 8);
    v11 = *((_BYTE *)v5 - 7);
    v12 = *((_BYTE *)v5 - 6);
    v13 = *v5;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    result = sub_2400624FC(v6, v7);
    if ((v15 & 1) != 0)
      break;
    *(_QWORD *)(v21 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v16 = (uint64_t *)(v3[6] + 16 * result);
    *v16 = v6;
    v16[1] = v7;
    v17 = v3[7] + 32 * result;
    *(_QWORD *)v17 = v9;
    *(_QWORD *)(v17 + 8) = v8;
    *(_BYTE *)(v17 + 16) = v10;
    *(_BYTE *)(v17 + 17) = v11;
    *(_BYTE *)(v17 + 18) = v12;
    *(_QWORD *)(v17 + 24) = v13;
    v18 = v3[2];
    v19 = __OFADD__(v18, 1);
    v20 = v18 + 1;
    if (v19)
      goto LABEL_11;
    v5 += 6;
    v3[2] = v20;
    v4 = v22 - 1;
    if (v22 == 1)
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

uint64_t sub_24005F8C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _OWORD *a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  __int128 v8;

  *(_QWORD *)(v7 + 80) = a6;
  *(_QWORD *)(v7 + 88) = a7;
  *(_QWORD *)(v7 + 64) = a3;
  *(_QWORD *)(v7 + 72) = a4;
  *(_QWORD *)(v7 + 48) = a1;
  *(_QWORD *)(v7 + 56) = a2;
  v8 = a5[1];
  *(_OWORD *)(v7 + 96) = *a5;
  *(_OWORD *)(v7 + 112) = v8;
  return swift_task_switch();
}

uint64_t sub_24005F8EC()
{
  uint64_t v0;
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;
  unint64_t v24;
  unsigned int v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  int v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  int v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  os_log_type_t v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t (*v46)(void);
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  int v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t result;
  __int128 v56;
  uint64_t v57;
  unint64_t v58;
  uint64_t v59;
  void *v60;

  v1 = *(void **)(v0 + 72);
  if (v1)
  {
    v2 = objc_msgSend(*(id *)(v0 + 72), sel_identifier);
    if (!v2)
      goto LABEL_8;
    v3 = v2;
    v5 = *(_QWORD *)(v0 + 56);
    v4 = *(_QWORD *)(v0 + 64);
    v6 = sub_240065CA4();
    v8 = v7;

    if (v6 == v5 && v8 == v4)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      v10 = sub_240065DDC();
      swift_bridgeObjectRelease();
      if ((v10 & 1) == 0)
      {
LABEL_8:
        v11 = *(_QWORD *)(v0 + 72);
        v57 = 0;
        v58 = 0xE000000000000000;
        sub_240065D7C();
        sub_240065CC8();
        sub_240065CC8();
        sub_240065CC8();
        *(_QWORD *)(v0 + 16) = v11;
        v12 = v1;
        __swift_instantiateConcreteTypeFromMangledName(&qword_256FB1CD0);
        sub_240065CB0();
        sub_240065CC8();
        swift_bridgeObjectRelease();
        v13 = v57;
        v14 = v58;
        if (qword_256FB1C70 != -1)
          swift_once();
        v15 = sub_240065C8C();
        __swift_project_value_buffer(v15, (uint64_t)qword_256FB1CF8);
        swift_bridgeObjectRetain_n();
        v16 = sub_240065C74();
        v17 = sub_240065D1C();
        if (os_log_type_enabled(v16, v17))
        {
          v18 = (uint8_t *)swift_slowAlloc();
          v19 = swift_slowAlloc();
          v57 = v19;
          *(_DWORD *)v18 = 136315138;
          swift_bridgeObjectRetain();
          *(_QWORD *)(v0 + 16) = sub_240061EBC(v13, v14, &v57);
          sub_240065D28();
          swift_bridgeObjectRelease_n();
          _os_log_impl(&dword_24005E000, v16, v17, "%s", v18, 0xCu);
          swift_arrayDestroy();
          v20 = v19;
LABEL_40:
          MEMORY[0x24267C600](v20, -1, -1);
          MEMORY[0x24267C600](v18, -1, -1);
LABEL_42:

          sub_240063F38();
          swift_allocError();
          *v45 = v13;
          v45[1] = v14;
          swift_willThrow();
          v46 = *(uint64_t (**)(void))(v0 + 8);
          return v46();
        }
        goto LABEL_41;
      }
    }
  }
  v21 = *(_QWORD *)(v0 + 104);
  if (v21)
  {
    v22 = *(_QWORD *)(v0 + 96) == *(_QWORD *)(v0 + 56) && v21 == *(_QWORD *)(v0 + 64);
    if (!v22 && (sub_240065DDC() & 1) == 0)
    {
      v41 = *(_QWORD *)(v0 + 112);
      v40 = *(_QWORD *)(v0 + 120);
      v56 = *(_OWORD *)(v0 + 96);
      v57 = 0;
      v58 = 0xE000000000000000;
      sub_240065D7C();
      sub_240065CC8();
      sub_240065CC8();
      sub_240065CC8();
      *(_OWORD *)(v0 + 16) = v56;
      *(_QWORD *)(v0 + 32) = v41;
      *(_QWORD *)(v0 + 40) = v40;
      swift_bridgeObjectRetain();
      __swift_instantiateConcreteTypeFromMangledName(&qword_256FB1CC0);
      sub_240065CB0();
      sub_240065CC8();
      swift_bridgeObjectRelease();
      sub_240065CC8();
      v13 = v57;
      v14 = v58;
      if (qword_256FB1C70 != -1)
        swift_once();
      v42 = sub_240065C8C();
      __swift_project_value_buffer(v42, (uint64_t)qword_256FB1CF8);
      swift_bridgeObjectRetain_n();
      v16 = sub_240065C74();
      v43 = sub_240065D1C();
      if (os_log_type_enabled(v16, v43))
      {
        v18 = (uint8_t *)swift_slowAlloc();
        v44 = swift_slowAlloc();
        v57 = v44;
        *(_DWORD *)v18 = 136315138;
        swift_bridgeObjectRetain();
        *(_QWORD *)(v0 + 16) = sub_240061EBC(v13, v14, &v57);
        sub_240065D28();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_24005E000, v16, v43, "%s", v18, 0xCu);
        swift_arrayDestroy();
        v20 = v44;
        goto LABEL_40;
      }
LABEL_41:
      swift_bridgeObjectRelease_n();
      goto LABEL_42;
    }
  }
  if (v1)
  {
    sub_2400655A0(*(void **)(v0 + 72), *(_QWORD *)(v0 + 80), *(_QWORD *)(v0 + 88), &v57);
    v23 = v57;
    v24 = v58;
    v25 = v59;
    v1 = v60;
    v26 = *(_QWORD *)(v0 + 88);
    if (v21)
      goto LABEL_21;
LABEL_28:
    if (v26)
    {
      v33 = sub_2400653EC(*(_QWORD *)(v0 + 80), v26);
      v35 = *(_QWORD *)(v0 + 56);
      v34 = *(_QWORD *)(v0 + 64);
      v36 = *(_QWORD *)(v0 + 48);
      if (v24)
      {
        swift_bridgeObjectRelease();
        *(_QWORD *)v36 = v35;
        *(_QWORD *)(v36 + 8) = v34;
        *(_BYTE *)(v36 + 16) = v25 & 1;
        *(_BYTE *)(v36 + 17) = BYTE1(v25) & 1;
        v37 = HIWORD(v25) & 1;
      }
      else
      {
        *(_QWORD *)v36 = v35;
        *(_QWORD *)(v36 + 8) = v34;
        *(_WORD *)(v36 + 16) = 257;
        LOBYTE(v37) = 1;
      }
      *(_BYTE *)(v36 + 18) = v37;
      *(_QWORD *)(v36 + 24) = v33;
      goto LABEL_51;
    }
    if (!v24)
    {
      v53 = *(_QWORD *)(v0 + 64);
      v54 = *(_QWORD *)(v0 + 48);
      *(_QWORD *)v54 = *(_QWORD *)(v0 + 56);
      *(_QWORD *)(v54 + 8) = v53;
      *(_WORD *)(v54 + 16) = 0;
      *(_BYTE *)(v54 + 18) = 0;
      *(_QWORD *)(v54 + 24) = 0;
      goto LABEL_51;
    }
    v39 = *(_QWORD *)(v0 + 48);
    *(_QWORD *)v39 = v23;
    *(_QWORD *)(v39 + 8) = v24;
    *(_BYTE *)(v39 + 16) = v25 & 1;
    *(_BYTE *)(v39 + 17) = BYTE1(v25) & 1;
    *(_BYTE *)(v39 + 18) = BYTE2(v25) & 1;
    goto LABEL_46;
  }
  v23 = 0;
  v24 = 0;
  v25 = 0;
  v26 = *(_QWORD *)(v0 + 88);
  if (!v21)
    goto LABEL_28;
LABEL_21:
  if (!v26)
  {
    if (!v24)
    {
      v49 = *(_QWORD *)(v0 + 120);
      v50 = *(_DWORD *)(v0 + 112);
      v51 = *(_QWORD *)(v0 + 104);
      v52 = *(_QWORD *)(v0 + 48);
      *(_QWORD *)v52 = *(_QWORD *)(v0 + 96);
      *(_QWORD *)(v52 + 8) = v51;
      *(_BYTE *)(v52 + 16) = v50 & 1;
      *(_BYTE *)(v52 + 17) = BYTE1(v50) & 1;
      *(_BYTE *)(v52 + 18) = BYTE2(v50) & 1;
      *(_QWORD *)(v52 + 24) = v49;
      goto LABEL_51;
    }
    v38 = *(_QWORD *)(v0 + 112);
    if ((v23 != *(_QWORD *)(v0 + 96) || v24 != *(_QWORD *)(v0 + 104)) && (sub_240065DDC() & 1) == 0)
      goto LABEL_55;
    v39 = *(_QWORD *)(v0 + 48);
    *(_QWORD *)v39 = v23;
    *(_QWORD *)(v39 + 8) = v24;
    *(_BYTE *)(v39 + 16) = v25 & v38 & 1;
    *(_BYTE *)(v39 + 17) = ((unsigned __int16)(v25 & v38) >> 8) & 1;
    *(_BYTE *)(v39 + 18) = ((v25 & v38) >> 16) & 1;
LABEL_46:
    *(_QWORD *)(v39 + 24) = v1;
    goto LABEL_52;
  }
  v27 = sub_2400653EC(*(_QWORD *)(v0 + 80), v26);
  v28 = *(_QWORD *)(v0 + 112);
  if (!v24)
  {
    v47 = *(_QWORD *)(v0 + 64);
    v48 = *(_QWORD *)(v0 + 48);
    *(_QWORD *)v48 = *(_QWORD *)(v0 + 56);
    *(_QWORD *)(v48 + 8) = v47;
    *(_BYTE *)(v48 + 16) = v28 & 1;
    *(_BYTE *)(v48 + 17) = BYTE1(v28) & 1;
    *(_BYTE *)(v48 + 18) = BYTE2(v28) & 1;
    *(_QWORD *)(v48 + 24) = v27;
LABEL_51:
    swift_bridgeObjectRetain();
    goto LABEL_52;
  }
  if (v23 == *(_QWORD *)(v0 + 96) && v24 == *(_QWORD *)(v0 + 104) || (sub_240065DDC() & 1) != 0)
  {
    v30 = *(_QWORD *)(v0 + 56);
    v29 = *(_QWORD *)(v0 + 64);
    v31 = *(_QWORD *)(v0 + 48);
    v32 = v25 & v28;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(_QWORD *)v31 = v30;
    *(_QWORD *)(v31 + 8) = v29;
    *(_BYTE *)(v31 + 16) = v32 & 1;
    *(_BYTE *)(v31 + 17) = BYTE1(v32) & 1;
    *(_BYTE *)(v31 + 18) = BYTE2(v32) & 1;
    *(_QWORD *)(v31 + 24) = v27;
LABEL_52:
    v46 = *(uint64_t (**)(void))(v0 + 8);
    return v46();
  }
  swift_bridgeObjectRelease();
  __break(1u);
LABEL_55:
  result = swift_bridgeObjectRelease();
  __break(1u);
  return result;
}

uint64_t static IRMBManager.mergeBundles(_:)(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 248) = a1;
  return swift_task_switch();
}

uint64_t sub_2400600BC()
{
  uint64_t v0;
  unint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD *v30;
  id v31;
  void *v32;
  id v33;
  void *v34;
  id v35;
  id v36;
  void *v37;
  id v38;
  uint64_t v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  int v47;
  uint64_t v48;
  uint64_t v49;
  __int128 v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;

  v1 = sub_240064AE4();
  if (!v1)
    v1 = sub_24005F768(MEMORY[0x24BEE4AF8]);
  v2 = v1;
  v3 = swift_bridgeObjectRetain();
  sub_24006183C(v3, v0 + 16);
  sub_240061908();
  if (v5)
  {
    v6 = v5;
    v54 = v0 + 160;
    *(_QWORD *)(v0 + 256) = v2;
    while (1)
    {
      *(_QWORD *)(v0 + 264) = v6;
      if ((unint64_t)(0x51EB851EB851EB8 - 0x70A3D70A3D70A3D7 * v4) <= 0xA3D70A3D70A3D70)
      {
        sub_240065CEC();
        *(_QWORD *)(v0 + 272) = 0;
        v30 = (_QWORD *)swift_task_alloc();
        *(_QWORD *)(v0 + 280) = v30;
        *v30 = v0;
        v30[1] = sub_24006062C;
        return sub_240065CF8();
      }
      v7 = objc_msgSend(v6, sel_identifier);
      v8 = *(void **)(v0 + 264);
      if (v7)
        break;

      sub_240061908();
      v6 = v9;
      if (!v9)
        goto LABEL_8;
    }
    v13 = v7;
    v14 = sub_240065CA4();
    v16 = v15;

    *(_QWORD *)(v0 + 288) = v14;
    *(_QWORD *)(v0 + 296) = v16;
    v17 = v8;
    v18 = sub_240064AE4();
    if (!v18)
      v18 = sub_24005F768(MEMORY[0x24BEE4AF8]);
    v19 = v18;
    if (*(_QWORD *)(v18 + 16))
    {
      swift_bridgeObjectRetain();
      v20 = sub_2400624FC(v14, v16);
      if ((v21 & 1) != 0)
      {
        v22 = *(_QWORD *)(v19 + 56) + 32 * v20;
        v23 = *(_QWORD *)(v22 + 8);
        v52 = *(_QWORD *)v22;
        v24 = *(unsigned __int8 *)(v22 + 16);
        v25 = *(unsigned __int8 *)(v22 + 17);
        v26 = *(unsigned __int8 *)(v22 + 18);
        v51 = *(_QWORD *)(v22 + 24);
        v27 = 256;
        if (!v25)
          v27 = 0;
        v28 = v27 | v24;
        v29 = 0x10000;
        if (!v26)
          v29 = 0;
        v53 = v28 | v29;
        swift_bridgeObjectRetain();
      }
      else
      {
        v52 = 0;
        v53 = 0;
        v23 = 0;
        v51 = 0;
      }
      swift_bridgeObjectRelease();
    }
    else
    {
      v52 = 0;
      v53 = 0;
      v23 = 0;
      v51 = 0;
    }
    *(_QWORD *)(v0 + 304) = v23;
    swift_bridgeObjectRelease();
    v31 = objc_allocWithZone(MEMORY[0x24BDC1540]);
    swift_bridgeObjectRetain();
    v32 = (void *)sub_240065C98();
    swift_bridgeObjectRelease();
    *(_QWORD *)(v0 + 240) = 0;
    v33 = objc_msgSend(v31, sel_initWithBundleIdentifier_allowPlaceholder_error_, v32, 0, v0 + 240);

    v34 = *(void **)(v0 + 240);
    if (v33)
    {
      v35 = v34;
      v36 = objc_msgSend(v33, sel_infoDictionary);
      v37 = (void *)sub_240065C98();
      sub_240063E90(0, (unint64_t *)&qword_254351B28);
      v38 = objc_msgSend(v36, sel_objectForKey_ofClass_, v37, swift_getObjCClassFromMetadata());

      if (v38)
      {
        v39 = v0 + 192;
        sub_240065D40();

        swift_unknownObjectRelease();
      }
      else
      {

        v39 = v0 + 192;
        *(_OWORD *)(v0 + 192) = 0u;
        *(_OWORD *)(v0 + 208) = 0u;
      }
      v46 = v51;
      sub_240063B84(v39, v54);
      v44 = v0 + 64;
      v45 = v52;
      if (*(_QWORD *)(v0 + 184))
      {
        v47 = swift_dynamicCast();
        if (v47)
          v42 = *(_QWORD *)(v0 + 224);
        else
          v42 = 0;
        if (v47)
          v43 = *(_QWORD *)(v0 + 232);
        else
          v43 = 0;
      }
      else
      {
        sub_240063C0C(v54);
        v42 = 0;
        v43 = 0;
      }
    }
    else
    {
      v40 = v34;
      v41 = sub_240065C2C();

      swift_willThrow();
      MEMORY[0x24267C564](v41);
      v42 = 0;
      v43 = 0;
      v44 = v0 + 64;
      v46 = v51;
      v45 = v52;
    }
    *(_QWORD *)(v0 + 312) = v43;
    *(_QWORD *)(v0 + 96) = v45;
    *(_QWORD *)(v0 + 104) = v23;
    *(_QWORD *)(v0 + 112) = v53;
    *(_QWORD *)(v0 + 120) = v46;
    v48 = swift_task_alloc();
    *(_QWORD *)(v0 + 320) = v48;
    *(_QWORD *)v48 = v0;
    *(_QWORD *)(v48 + 8) = sub_240060BE4;
    v49 = *(_QWORD *)(v0 + 264);
    *(_QWORD *)(v48 + 80) = v42;
    *(_QWORD *)(v48 + 88) = v43;
    *(_QWORD *)(v48 + 64) = v16;
    *(_QWORD *)(v48 + 72) = v49;
    *(_QWORD *)(v48 + 48) = v44;
    *(_QWORD *)(v48 + 56) = v14;
    v50 = *(_OWORD *)(v0 + 112);
    *(_OWORD *)(v48 + 96) = *(_OWORD *)(v0 + 96);
    *(_OWORD *)(v48 + 112) = v50;
    return swift_task_switch();
  }
  else
  {
LABEL_8:
    sub_240063B7C();
    v10 = swift_bridgeObjectRetain();
    v11 = sub_240061B04(v10);
    swift_bridgeObjectRelease();
    return (*(uint64_t (**)(uint64_t))(v0 + 8))(v11);
  }
}

uint64_t sub_24006062C()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_2400606AC()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD *v29;
  id v30;
  void *v31;
  id v32;
  void *v33;
  id v34;
  id v35;
  void *v36;
  id v37;
  uint64_t v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  int v47;
  uint64_t v48;
  uint64_t v49;
  __int128 v50;
  uint64_t v51;
  uint64_t v52;

  v52 = v0 + 160;
  v1 = *(void **)(v0 + 264);
  v2 = *(_QWORD *)(v0 + 272);
  while (1)
  {
    v3 = objc_msgSend(v1, sel_identifier);
    v4 = *(void **)(v0 + 264);
    if (v3)
      break;

    sub_240061908();
    if (!v6)
    {
      sub_240063B7C();
      v27 = swift_bridgeObjectRetain();
      v28 = sub_240061B04(v27);
      swift_bridgeObjectRelease();
      return (*(uint64_t (**)(uint64_t))(v0 + 8))(v28);
    }
    v1 = v6;
    *(_QWORD *)(v0 + 264) = v6;
    if ((unint64_t)(0x51EB851EB851EB8 - 0x70A3D70A3D70A3D7 * v5) <= 0xA3D70A3D70A3D70)
    {
      sub_240065CEC();
      *(_QWORD *)(v0 + 272) = v2;
      if (v2)
      {
        sub_240063B7C();

        swift_bridgeObjectRelease();
        return (*(uint64_t (**)(void))(v0 + 8))();
      }
      else
      {
        v29 = (_QWORD *)swift_task_alloc();
        *(_QWORD *)(v0 + 280) = v29;
        *v29 = v0;
        v29[1] = sub_24006062C;
        return sub_240065CF8();
      }
    }
  }
  v8 = v3;
  v9 = sub_240065CA4();
  v11 = v10;

  *(_QWORD *)(v0 + 288) = v9;
  *(_QWORD *)(v0 + 296) = v11;
  v12 = v4;
  v13 = sub_240064AE4();
  if (!v13)
    v13 = sub_24005F768(MEMORY[0x24BEE4AF8]);
  v14 = v13;
  if (*(_QWORD *)(v13 + 16))
  {
    swift_bridgeObjectRetain();
    v15 = sub_2400624FC(v9, v11);
    if ((v16 & 1) != 0)
    {
      v17 = *(_QWORD *)(v14 + 56) + 32 * v15;
      v19 = *(_QWORD *)v17;
      v18 = *(_QWORD *)(v17 + 8);
      v20 = *(unsigned __int8 *)(v17 + 16);
      v21 = *(unsigned __int8 *)(v17 + 17);
      v22 = *(unsigned __int8 *)(v17 + 18);
      v23 = *(_QWORD *)(v17 + 24);
      v24 = 256;
      if (!v21)
        v24 = 0;
      v25 = v24 | v20;
      v26 = 0x10000;
      if (!v22)
        v26 = 0;
      v51 = v25 | v26;
      swift_bridgeObjectRetain();
    }
    else
    {
      v19 = 0;
      v18 = 0;
      v51 = 0;
      v23 = 0;
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    v19 = 0;
    v18 = 0;
    v51 = 0;
    v23 = 0;
  }
  *(_QWORD *)(v0 + 304) = v18;
  swift_bridgeObjectRelease();
  v30 = objc_allocWithZone(MEMORY[0x24BDC1540]);
  swift_bridgeObjectRetain();
  v31 = (void *)sub_240065C98();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v0 + 240) = 0;
  v32 = objc_msgSend(v30, sel_initWithBundleIdentifier_allowPlaceholder_error_, v31, 0, v0 + 240);

  v33 = *(void **)(v0 + 240);
  if (v32)
  {
    v34 = v33;
    v35 = objc_msgSend(v32, sel_infoDictionary);
    v36 = (void *)sub_240065C98();
    sub_240063E90(0, (unint64_t *)&qword_254351B28);
    v37 = objc_msgSend(v35, sel_objectForKey_ofClass_, v36, swift_getObjCClassFromMetadata());

    if (v37)
    {
      v38 = v0 + 192;
      sub_240065D40();

      swift_unknownObjectRelease();
    }
    else
    {

      v38 = v0 + 192;
      *(_OWORD *)(v0 + 192) = 0u;
      *(_OWORD *)(v0 + 208) = 0u;
    }
    sub_240063B84(v38, v52);
    v45 = v0 + 64;
    v46 = v51;
    if (*(_QWORD *)(v0 + 184))
    {
      v47 = swift_dynamicCast();
      if (v47)
        v43 = *(_QWORD *)(v0 + 224);
      else
        v43 = 0;
      if (v47)
        v44 = *(_QWORD *)(v0 + 232);
      else
        v44 = 0;
    }
    else
    {
      sub_240063C0C(v52);
      v43 = 0;
      v44 = 0;
    }
  }
  else
  {
    v39 = v33;
    v40 = v19;
    v41 = sub_240065C2C();

    swift_willThrow();
    v42 = v41;
    v19 = v40;
    MEMORY[0x24267C564](v42);
    v43 = 0;
    v44 = 0;
    v45 = v0 + 64;
    v46 = v51;
  }
  *(_QWORD *)(v0 + 312) = v44;
  *(_QWORD *)(v0 + 96) = v19;
  *(_QWORD *)(v0 + 104) = v18;
  *(_QWORD *)(v0 + 112) = v46;
  *(_QWORD *)(v0 + 120) = v23;
  v48 = swift_task_alloc();
  *(_QWORD *)(v0 + 320) = v48;
  *(_QWORD *)v48 = v0;
  *(_QWORD *)(v48 + 8) = sub_240060BE4;
  v49 = *(_QWORD *)(v0 + 264);
  *(_QWORD *)(v48 + 80) = v43;
  *(_QWORD *)(v48 + 88) = v44;
  *(_QWORD *)(v48 + 64) = v11;
  *(_QWORD *)(v48 + 72) = v49;
  *(_QWORD *)(v48 + 48) = v45;
  *(_QWORD *)(v48 + 56) = v9;
  v50 = *(_OWORD *)(v0 + 112);
  *(_OWORD *)(v48 + 96) = *(_OWORD *)(v0 + 96);
  *(_OWORD *)(v48 + 112) = v50;
  return swift_task_switch();
}

uint64_t sub_240060BE4()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 328) = v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  return swift_task_switch();
}

uint64_t sub_240060CA4()
{
  uint64_t v0;
  uint64_t v1;
  int v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  int v8;
  int v9;
  uint64_t v10;
  char isUniquelyReferenced_nonNull_native;
  int v12;
  int v13;
  int v14;
  int v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  char v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  int v39;
  int v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  _QWORD *v44;
  id v45;
  void *v46;
  id v47;
  void *v48;
  id v49;
  id v50;
  void *v51;
  id v52;
  uint64_t v53;
  id v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  int v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  _OWORD *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;

  v1 = v0;
  v71 = *(_QWORD *)(v0 + 288);
  v73 = *(_QWORD *)(v0 + 296);
  v2 = *(unsigned __int8 *)(v0 + 339);
  v3 = *(_QWORD *)(v0 + 256);
  v4 = *(void **)(v0 + 264);

  swift_bridgeObjectRelease();
  v6 = *(_QWORD *)(v0 + 64);
  v5 = v0 + 64;
  v69 = v6;
  v67 = *(_QWORD *)(v5 + 8);
  v7 = *(unsigned __int8 *)(v5 + 16);
  v8 = *(unsigned __int8 *)(v5 + 17);
  v9 = *(unsigned __int8 *)(v5 + 18);
  v10 = *(_QWORD *)(v5 + 24);
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v75 = v3;
  if (v8)
    v12 = 256;
  else
    v12 = 0;
  v13 = v7 | (v2 << 24) | v12;
  if (v9)
    v14 = 0x10000;
  else
    v14 = 0;
  v15 = v13 | v14;
  sub_240063464(v69, v67, v13 | v14, v10, v71, v73, isUniquelyReferenced_nonNull_native, v5 + 64);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_240061908();
  if (v17)
  {
    v18 = v17;
    v70 = (_OWORD *)(v5 + 128);
    v72 = v5 + 96;
    v74 = v5;
    v19 = *(_QWORD *)(v1 + 328);
    *(_DWORD *)(v1 + 336) = v15;
    *(_QWORD *)(v1 + 256) = v75;
    while (1)
    {
      *(_QWORD *)(v1 + 264) = v18;
      if (0x8F5C28F5C28F5C29 * v16 + 0x51EB851EB851EB8 <= 0xA3D70A3D70A3D70)
      {
        sub_240065CEC();
        *(_QWORD *)(v1 + 272) = v19;
        if (v19)
        {
          sub_240063B7C();

          swift_bridgeObjectRelease();
          return (*(uint64_t (**)(void))(v1 + 8))();
        }
        else
        {
          v44 = (_QWORD *)swift_task_alloc();
          *(_QWORD *)(v1 + 280) = v44;
          *v44 = v1;
          v44[1] = sub_24006062C;
          return sub_240065CF8();
        }
      }
      v20 = objc_msgSend(v18, sel_identifier);
      v21 = *(void **)(v1 + 264);
      if (v20)
        break;

      sub_240061908();
      v18 = v22;
      if (!v22)
        goto LABEL_12;
    }
    v26 = v20;
    v27 = sub_240065CA4();
    v29 = v28;

    *(_QWORD *)(v1 + 288) = v27;
    *(_QWORD *)(v1 + 296) = v29;
    v30 = v21;
    v31 = sub_240064AE4();
    if (!v31)
      v31 = sub_24005F768(MEMORY[0x24BEE4AF8]);
    v32 = v31;
    if (*(_QWORD *)(v31 + 16))
    {
      swift_bridgeObjectRetain();
      v33 = sub_2400624FC(v27, v29);
      if ((v34 & 1) != 0)
      {
        v35 = *(_QWORD *)(v32 + 56) + 32 * v33;
        v37 = *(_QWORD *)v35;
        v36 = *(_QWORD *)(v35 + 8);
        v38 = *(unsigned __int8 *)(v35 + 16);
        v39 = *(unsigned __int8 *)(v35 + 17);
        v40 = *(unsigned __int8 *)(v35 + 18);
        v68 = *(_QWORD *)(v35 + 24);
        v41 = 256;
        if (!v39)
          v41 = 0;
        v42 = v41 | v38;
        v43 = 0x10000;
        if (!v40)
          v43 = 0;
        v66 = v42 | v43;
        swift_bridgeObjectRetain();
      }
      else
      {
        v37 = 0;
        v36 = 0;
        v66 = 0;
        v68 = 0;
      }
      swift_bridgeObjectRelease();
    }
    else
    {
      v37 = 0;
      v36 = 0;
      v66 = 0;
      v68 = 0;
    }
    *(_QWORD *)(v1 + 304) = v36;
    swift_bridgeObjectRelease();
    v45 = objc_allocWithZone(MEMORY[0x24BDC1540]);
    swift_bridgeObjectRetain();
    v46 = (void *)sub_240065C98();
    swift_bridgeObjectRelease();
    *(_QWORD *)(v1 + 240) = 0;
    v47 = objc_msgSend(v45, sel_initWithBundleIdentifier_allowPlaceholder_error_, v46, 0, v5 + 176);

    v48 = *(void **)(v1 + 240);
    if (v47)
    {
      v49 = v48;
      v50 = objc_msgSend(v47, sel_infoDictionary);
      v51 = (void *)sub_240065C98();
      sub_240063E90(0, (unint64_t *)&qword_254351B28);
      v52 = objc_msgSend(v50, sel_objectForKey_ofClass_, v51, swift_getObjCClassFromMetadata());

      if (v52)
      {
        v53 = v5 + 128;
        sub_240065D40();

        swift_unknownObjectRelease();
      }
      else
      {

        v53 = v5 + 128;
        *v70 = 0u;
        v70[1] = 0u;
      }
      sub_240063B84(v53, v72);
      v60 = v74;
      v62 = v66;
      v61 = v68;
      if (*(_QWORD *)(v1 + 184))
      {
        v63 = swift_dynamicCast();
        if (v63)
          v58 = *(_QWORD *)(v1 + 224);
        else
          v58 = 0;
        if (v63)
          v59 = *(_QWORD *)(v1 + 232);
        else
          v59 = 0;
      }
      else
      {
        sub_240063C0C(v72);
        v58 = 0;
        v59 = 0;
      }
    }
    else
    {
      v54 = v48;
      v55 = v37;
      v56 = sub_240065C2C();

      swift_willThrow();
      v57 = v56;
      v37 = v55;
      MEMORY[0x24267C564](v57);
      v58 = 0;
      v59 = 0;
      v60 = v74;
      v62 = v66;
      v61 = v68;
    }
    *(_QWORD *)(v1 + 312) = v59;
    *(_QWORD *)(v1 + 96) = v37;
    *(_QWORD *)(v1 + 104) = v36;
    *(_QWORD *)(v1 + 112) = v62;
    *(_QWORD *)(v1 + 120) = v61;
    v64 = swift_task_alloc();
    *(_QWORD *)(v1 + 320) = v64;
    *(_QWORD *)v64 = v1;
    *(_QWORD *)(v64 + 8) = sub_240060BE4;
    v65 = *(_QWORD *)(v1 + 264);
    *(_QWORD *)(v64 + 80) = v58;
    *(_QWORD *)(v64 + 88) = v59;
    *(_QWORD *)(v64 + 64) = v29;
    *(_QWORD *)(v64 + 72) = v65;
    *(_QWORD *)(v64 + 48) = v60;
    *(_QWORD *)(v64 + 56) = v27;
    *(_OWORD *)(v64 + 96) = *(_OWORD *)(v1 + 96);
    *(_OWORD *)(v64 + 112) = *(_OWORD *)(v1 + 112);
    return swift_task_switch();
  }
  else
  {
LABEL_12:
    sub_240063B7C();
    v23 = swift_bridgeObjectRetain();
    v24 = sub_240061B04(v23);
    swift_bridgeObjectRelease();
    return (*(uint64_t (**)(uint64_t))(v1 + 8))(v24);
  }
}

uint64_t sub_2400612C8()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD *v30;
  id v31;
  void *v32;
  id v33;
  void *v34;
  id v35;
  id v36;
  void *v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  int v47;
  uint64_t v48;
  uint64_t v49;
  __int128 v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;

  v1 = *(_QWORD *)(v0 + 328);
  v2 = *(void **)(v0 + 264);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  MEMORY[0x24267C564](v1);
  sub_240061908();
  if (v4)
  {
    v5 = v4;
    v53 = v0 + 160;
    while (1)
    {
      *(_QWORD *)(v0 + 264) = v5;
      if ((unint64_t)(0x51EB851EB851EB8 - 0x70A3D70A3D70A3D7 * v3) <= 0xA3D70A3D70A3D70)
      {
        sub_240065CEC();
        *(_QWORD *)(v0 + 272) = 0;
        v30 = (_QWORD *)swift_task_alloc();
        *(_QWORD *)(v0 + 280) = v30;
        *v30 = v0;
        v30[1] = sub_24006062C;
        return sub_240065CF8();
      }
      v6 = objc_msgSend(v5, sel_identifier);
      v7 = *(void **)(v0 + 264);
      if (v6)
        break;

      sub_240061908();
      v5 = v8;
      if (!v8)
        goto LABEL_6;
    }
    v12 = v6;
    v13 = sub_240065CA4();
    v15 = v14;

    *(_QWORD *)(v0 + 288) = v13;
    *(_QWORD *)(v0 + 296) = v15;
    v16 = v7;
    v17 = sub_240064AE4();
    if (!v17)
      v17 = sub_24005F768(MEMORY[0x24BEE4AF8]);
    v18 = v17;
    if (*(_QWORD *)(v17 + 16))
    {
      swift_bridgeObjectRetain();
      v19 = sub_2400624FC(v13, v15);
      if ((v20 & 1) != 0)
      {
        v21 = *(_QWORD *)(v18 + 56) + 32 * v19;
        v22 = *(_QWORD *)v21;
        v23 = *(_QWORD *)(v21 + 8);
        v24 = *(unsigned __int8 *)(v21 + 16);
        v25 = *(unsigned __int8 *)(v21 + 17);
        v26 = *(unsigned __int8 *)(v21 + 18);
        v51 = *(_QWORD *)(v21 + 24);
        v27 = 256;
        if (!v25)
          v27 = 0;
        v28 = v27 | v24;
        v29 = 0x10000;
        if (!v26)
          v29 = 0;
        v52 = v28 | v29;
        swift_bridgeObjectRetain();
      }
      else
      {
        v22 = 0;
        v23 = 0;
        v51 = 0;
        v52 = 0;
      }
      swift_bridgeObjectRelease();
    }
    else
    {
      v22 = 0;
      v23 = 0;
      v51 = 0;
      v52 = 0;
    }
    *(_QWORD *)(v0 + 304) = v23;
    swift_bridgeObjectRelease();
    v31 = objc_allocWithZone(MEMORY[0x24BDC1540]);
    swift_bridgeObjectRetain();
    v32 = (void *)sub_240065C98();
    swift_bridgeObjectRelease();
    *(_QWORD *)(v0 + 240) = 0;
    v33 = objc_msgSend(v31, sel_initWithBundleIdentifier_allowPlaceholder_error_, v32, 0, v0 + 240);

    v34 = *(void **)(v0 + 240);
    if (v33)
    {
      v35 = v34;
      v36 = objc_msgSend(v33, sel_infoDictionary);
      v37 = (void *)sub_240065C98();
      sub_240063E90(0, (unint64_t *)&qword_254351B28);
      v38 = objc_msgSend(v36, sel_objectForKey_ofClass_, v37, swift_getObjCClassFromMetadata());

      if (v38)
      {
        v39 = v0 + 192;
        sub_240065D40();

        swift_unknownObjectRelease();
      }
      else
      {

        v39 = v0 + 192;
        *(_OWORD *)(v0 + 192) = 0u;
        *(_OWORD *)(v0 + 208) = 0u;
      }
      v46 = v51;
      v40 = v13;
      sub_240063B84(v39, v53);
      v45 = v0 + 64;
      if (*(_QWORD *)(v0 + 184))
      {
        v47 = swift_dynamicCast();
        if (v47)
          v43 = *(_QWORD *)(v0 + 224);
        else
          v43 = 0;
        if (v47)
          v44 = *(_QWORD *)(v0 + 232);
        else
          v44 = 0;
      }
      else
      {
        sub_240063C0C(v53);
        v43 = 0;
        v44 = 0;
      }
    }
    else
    {
      v40 = v13;
      v41 = v34;
      v42 = sub_240065C2C();

      swift_willThrow();
      MEMORY[0x24267C564](v42);
      v43 = 0;
      v44 = 0;
      v45 = v0 + 64;
      v46 = v51;
    }
    *(_QWORD *)(v0 + 312) = v44;
    *(_QWORD *)(v0 + 96) = v22;
    *(_QWORD *)(v0 + 104) = v23;
    *(_QWORD *)(v0 + 112) = v52;
    *(_QWORD *)(v0 + 120) = v46;
    v48 = swift_task_alloc();
    *(_QWORD *)(v0 + 320) = v48;
    *(_QWORD *)v48 = v0;
    *(_QWORD *)(v48 + 8) = sub_240060BE4;
    v49 = *(_QWORD *)(v0 + 264);
    *(_QWORD *)(v48 + 80) = v43;
    *(_QWORD *)(v48 + 88) = v44;
    *(_QWORD *)(v48 + 64) = v15;
    *(_QWORD *)(v48 + 72) = v49;
    *(_QWORD *)(v48 + 48) = v45;
    *(_QWORD *)(v48 + 56) = v40;
    v50 = *(_OWORD *)(v0 + 112);
    *(_OWORD *)(v48 + 96) = *(_OWORD *)(v0 + 96);
    *(_OWORD *)(v48 + 112) = v50;
    return swift_task_switch();
  }
  else
  {
LABEL_6:
    sub_240063B7C();
    v9 = swift_bridgeObjectRetain();
    v10 = sub_240061B04(v9);
    swift_bridgeObjectRelease();
    return (*(uint64_t (**)(uint64_t))(v0 + 8))(v10);
  }
}

uint64_t sub_24006183C@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;

  if ((result & 0xC000000000000001) != 0)
  {
    sub_240065D4C();
    sub_240063E90(0, &qword_256FB1CB0);
    sub_240063EC8();
    sub_240065D10();
    result = v10;
    v3 = v11;
    v4 = v12;
    v5 = v13;
  }
  else
  {
    v6 = -1;
    v7 = -1 << *(_BYTE *)(result + 32);
    v8 = ~v7;
    v3 = result + 56;
    v9 = -v7;
    if (v9 < 64)
      v6 = ~(-1 << v9);
    v5 = v6 & *(_QWORD *)(result + 56);
    v4 = (unint64_t)v8;
  }
  *(_QWORD *)a2 = result;
  *(_QWORD *)(a2 + 8) = v3;
  *(_OWORD *)(a2 + 16) = v4;
  *(_QWORD *)(a2 + 32) = v5;
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_240061908()
{
  _QWORD *v0;
  _QWORD *v1;
  unint64_t v2;
  int64_t v3;
  uint64_t v4;
  unint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  int64_t v9;
  int64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  int64_t v14;
  uint64_t v15;

  v1 = v0;
  if ((*v0 & 0x8000000000000000) != 0)
  {
    if (sub_240065D58())
    {
      sub_240063E90(0, &qword_256FB1CB0);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      swift_unknownObjectRelease();
      if (v15)
        goto LABEL_6;
    }
    return;
  }
  v3 = v0[3];
  v2 = v0[4];
  if (v2)
  {
    v4 = (v2 - 1) & v2;
    v5 = __clz(__rbit64(v2)) | (v3 << 6);
LABEL_4:
    v6 = *(void **)(*(_QWORD *)(*v0 + 48) + 8 * v5);
    v7 = v6;
    goto LABEL_5;
  }
  v9 = v3 + 1;
  if (__OFADD__(v3, 1))
  {
LABEL_35:
    __break(1u);
    return;
  }
  v10 = (unint64_t)(v0[2] + 64) >> 6;
  if (v9 >= v10)
  {
    v6 = 0;
    v4 = 0;
    goto LABEL_5;
  }
  v11 = v0[1];
  v12 = *(_QWORD *)(v11 + 8 * v9);
  if (v12)
  {
LABEL_14:
    v4 = (v12 - 1) & v12;
    v5 = __clz(__rbit64(v12)) + (v9 << 6);
    v3 = v9;
    goto LABEL_4;
  }
  v13 = v3 + 2;
  if (v3 + 2 >= v10)
    goto LABEL_31;
  v12 = *(_QWORD *)(v11 + 8 * v13);
  if (v12)
  {
LABEL_19:
    v9 = v13;
    goto LABEL_14;
  }
  if (v3 + 3 >= v10)
    goto LABEL_32;
  v12 = *(_QWORD *)(v11 + 8 * (v3 + 3));
  if (v12)
  {
    v9 = v3 + 3;
    goto LABEL_14;
  }
  v13 = v3 + 4;
  if (v3 + 4 < v10)
  {
    v12 = *(_QWORD *)(v11 + 8 * v13);
    if (v12)
      goto LABEL_19;
    v9 = v3 + 5;
    if (v3 + 5 < v10)
    {
      v12 = *(_QWORD *)(v11 + 8 * v9);
      if (v12)
        goto LABEL_14;
      v9 = v10 - 1;
      v14 = v3 + 6;
      while (v10 != v14)
      {
        v12 = *(_QWORD *)(v11 + 8 * v14++);
        if (v12)
        {
          v9 = v14 - 1;
          goto LABEL_14;
        }
      }
LABEL_31:
      v6 = 0;
      v4 = 0;
      v3 = v9;
      goto LABEL_5;
    }
LABEL_32:
    v6 = 0;
    v4 = 0;
    v3 = v13;
    goto LABEL_5;
  }
  v6 = 0;
  v4 = 0;
  v3 += 3;
LABEL_5:
  v1[3] = v3;
  v1[4] = v4;
  if (v6)
  {
LABEL_6:
    v8 = v1[5];
    if (!__OFADD__(v8, 1))
    {
      v1[5] = v8 + 1;
      return;
    }
    __break(1u);
    goto LABEL_35;
  }
}

uint64_t sub_240061B04(uint64_t a1)
{
  int v1;
  uint64_t result;
  int64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  int64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  int v16;
  uint64_t v17;
  unsigned int v18;
  int v19;
  int v20;
  int v21;
  int64_t v22;
  unint64_t v23;
  int64_t v24;
  _BYTE v25[8];
  uint64_t v26;

  sub_240063E4C();
  result = sub_240065D04();
  v4 = 0;
  v26 = result;
  v5 = a1 + 64;
  v6 = 1 << *(_BYTE *)(a1 + 32);
  v7 = -1;
  if (v6 < 64)
    v7 = ~(-1 << v6);
  v8 = v7 & *(_QWORD *)(a1 + 64);
  v9 = (unint64_t)(v6 + 63) >> 6;
  while (1)
  {
    if (v8)
    {
      v10 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      v11 = v10 | (v4 << 6);
      goto LABEL_5;
    }
    v22 = v4 + 1;
    if (__OFADD__(v4, 1))
    {
      __break(1u);
      goto LABEL_31;
    }
    if (v22 >= v9)
      goto LABEL_29;
    v23 = *(_QWORD *)(v5 + 8 * v22);
    ++v4;
    if (!v23)
    {
      v4 = v22 + 1;
      if (v22 + 1 >= v9)
        goto LABEL_29;
      v23 = *(_QWORD *)(v5 + 8 * v4);
      if (!v23)
      {
        v4 = v22 + 2;
        if (v22 + 2 >= v9)
          goto LABEL_29;
        v23 = *(_QWORD *)(v5 + 8 * v4);
        if (!v23)
        {
          v4 = v22 + 3;
          if (v22 + 3 >= v9)
            goto LABEL_29;
          v23 = *(_QWORD *)(v5 + 8 * v4);
          if (!v23)
            break;
        }
      }
    }
LABEL_28:
    v8 = (v23 - 1) & v23;
    v11 = __clz(__rbit64(v23)) + (v4 << 6);
LABEL_5:
    v12 = *(_QWORD *)(a1 + 56) + 32 * v11;
    v13 = *(_QWORD *)v12;
    v14 = *(_QWORD *)(v12 + 8);
    v15 = *(unsigned __int8 *)(v12 + 17);
    v16 = *(unsigned __int8 *)(v12 + 18);
    v17 = *(_QWORD *)(v12 + 24);
    v18 = v1 & 0xFF000000 | *(unsigned __int8 *)(v12 + 16);
    if (v15)
      v19 = 256;
    else
      v19 = 0;
    v20 = v18 | v19;
    if (v16)
      v21 = 0x10000;
    else
      v21 = 0;
    v1 = v20 | v21;
    swift_bridgeObjectRetain();
    sub_240062640((uint64_t)v25, v13, v14, v1, v17);
    result = swift_bridgeObjectRelease();
  }
  v24 = v22 + 4;
  if (v24 >= v9)
  {
LABEL_29:
    swift_release();
    return v26;
  }
  v23 = *(_QWORD *)(v5 + 8 * v24);
  if (v23)
  {
    v4 = v24;
    goto LABEL_28;
  }
  while (1)
  {
    v4 = v24 + 1;
    if (__OFADD__(v24, 1))
      break;
    if (v4 >= v9)
      goto LABEL_29;
    v23 = *(_QWORD *)(v5 + 8 * v4);
    ++v24;
    if (v23)
      goto LABEL_28;
  }
LABEL_31:
  __break(1u);
  return result;
}

id sub_240061CF4(uint64_t a1, uint64_t a2, char a3)
{
  void *v3;
  void *v5;
  id v6;
  id v7;
  id v8;
  id v10[2];

  v10[1] = *(id *)MEMORY[0x24BDAC8D0];
  v5 = (void *)sub_240065C98();
  swift_bridgeObjectRelease();
  v10[0] = 0;
  v6 = objc_msgSend(v3, sel_initWithBundleIdentifier_allowPlaceholder_error_, v5, a3 & 1, v10);

  if (v6)
  {
    v7 = v10[0];
  }
  else
  {
    v8 = v10[0];
    sub_240065C2C();

    swift_willThrow();
  }
  return v6;
}

void sub_240061DCC(_QWORD *a1@<X8>)
{
  *a1 = 0;
}

uint64_t sub_240061DD4()
{
  sub_240065E30();
  sub_240065E3C();
  return sub_240065E54();
}

uint64_t sub_240061E18()
{
  return sub_240065E3C();
}

uint64_t sub_240061E40()
{
  sub_240065E30();
  sub_240065E3C();
  return sub_240065E54();
}

_QWORD *sub_240061E80@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = *result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

void sub_240061E90(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

_QWORD *sub_240061E9C@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = *result;
  return result;
}

BOOL sub_240061EA8(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

uint64_t sub_240061EBC(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_240061F8C(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_240063F9C((uint64_t)v12, *a3);
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
      sub_240063F9C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_240061F8C(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_240065D34();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_240062144(a5, a6);
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
  v8 = sub_240065D94();
  if (!v8)
  {
    sub_240065DA0();
    __break(1u);
LABEL_17:
    result = sub_240065DD0();
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

uint64_t sub_240062144(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_2400621D8(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_2400623B0(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_2400623B0(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_2400621D8(uint64_t a1, unint64_t a2)
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
      v3 = sub_24006234C(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_240065D88();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_240065DA0();
      __break(1u);
LABEL_10:
      v2 = sub_240065CD4();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_240065DD0();
    __break(1u);
LABEL_14:
    result = sub_240065DA0();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_24006234C(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_256FB1CD8);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_2400623B0(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_256FB1CD8);
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
  result = sub_240065DD0();
  __break(1u);
  return result;
}

unint64_t sub_2400624FC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_240065E30();
  sub_240065CBC();
  v4 = sub_240065E54();
  return sub_240062560(a1, a2, v4);
}

unint64_t sub_240062560(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_240065DDC() & 1) == 0)
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
      while (!v14 && (sub_240065DDC() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_240062640(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5)
{
  _QWORD *v5;
  _QWORD *v6;
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  int v24;
  uint64_t v25;
  int v26;
  char v28;
  uint64_t v29;
  uint64_t v30;
  char isUniquelyReferenced_nonNull_native;
  uint64_t result;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char v36;
  char v37;
  char v38;
  uint64_t v39;
  int v40;
  _QWORD *v41;
  uint64_t v42;
  uint64_t v43;
  int v44;
  int v45;
  char v46;
  uint64_t v47;
  uint64_t v48;

  v6 = v5;
  v12 = a4 & 1;
  v44 = a4 & 0x10000;
  v45 = a4 & 0x100;
  v13 = *v6;
  sub_240065E30();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_240065CBC();
  v47 = a3;
  swift_bridgeObjectRelease();
  v46 = v12;
  sub_240065E48();
  sub_240065E48();
  sub_240065E48();
  v43 = a5;
  sub_240065E3C();
  v14 = sub_240065E54();
  v15 = -1 << *(_BYTE *)(v13 + 32);
  v16 = v14 & ~v15;
  v17 = v13 + 56;
  v41 = v6;
  v42 = a1;
  v40 = a4;
  if (((*(_QWORD *)(v13 + 56 + ((v16 >> 3) & 0xFFFFFFFFFFFFF8)) >> v16) & 1) != 0)
  {
    v18 = ~v15;
    v19 = *(_QWORD *)(v13 + 48);
    v21 = a2;
    v20 = v47;
    while (1)
    {
      v22 = v19 + 32 * v16;
      v23 = *(unsigned __int8 *)(v22 + 16);
      v24 = *(unsigned __int8 *)(v22 + 17);
      v25 = *(_QWORD *)(v22 + 24);
      v26 = (v44 != 0) ^ *(unsigned __int8 *)(v22 + 18);
      if (*(_QWORD *)v22 == v21 && *(_QWORD *)(v22 + 8) == v20)
      {
        if ((((v12 != 0) ^ v23 | (v45 != 0) ^ v24 | v26) & 1) != 0)
          goto LABEL_5;
      }
      else
      {
        v28 = sub_240065DDC();
        v21 = a2;
        v20 = v47;
        if (((v12 != 0) ^ v23) & 1 | ((v28 & 1) == 0) | (((v45 != 0) ^ v24) | v26) & 1)
          goto LABEL_5;
      }
      if (v25 == v43)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v33 = *(_QWORD *)(*v41 + 48) + 32 * v16;
        v35 = *(_QWORD *)v33;
        v34 = *(_QWORD *)(v33 + 8);
        v36 = *(_BYTE *)(v33 + 16);
        v37 = *(_BYTE *)(v33 + 17);
        v38 = *(_BYTE *)(v33 + 18);
        v39 = *(_QWORD *)(v33 + 24);
        *(_QWORD *)v42 = v35;
        *(_QWORD *)(v42 + 8) = v34;
        *(_BYTE *)(v42 + 16) = v36;
        *(_BYTE *)(v42 + 17) = v37;
        *(_BYTE *)(v42 + 18) = v38;
        *(_QWORD *)(v42 + 24) = v39;
        swift_bridgeObjectRetain();
        return 0;
      }
LABEL_5:
      v16 = (v16 + 1) & v18;
      if (((*(_QWORD *)(v17 + ((v16 >> 3) & 0xFFFFFFFFFFFFF8)) >> v16) & 1) == 0)
        goto LABEL_13;
    }
  }
  v21 = a2;
  v20 = v47;
LABEL_13:
  v29 = v20;
  v30 = v21;
  swift_bridgeObjectRelease();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v48 = *v41;
  *v41 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_240062C9C(v30, v29, v40 & 0x10101, v43, v16, isUniquelyReferenced_nonNull_native);
  *v41 = v48;
  swift_bridgeObjectRelease();
  *(_QWORD *)v42 = v30;
  *(_QWORD *)(v42 + 8) = v29;
  *(_BYTE *)(v42 + 16) = v46;
  *(_BYTE *)(v42 + 17) = BYTE1(v45);
  *(_BYTE *)(v42 + 18) = BYTE2(v44);
  result = 1;
  *(_QWORD *)(v42 + 24) = v43;
  return result;
}

uint64_t sub_240062938()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t result;
  int64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  int64_t v15;
  unint64_t v16;
  int64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  char v23;
  char v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  char v29;
  unint64_t v30;
  BOOL v31;
  uint64_t v32;
  uint64_t v33;
  int64_t v34;
  _QWORD *v35;
  uint64_t v36;
  int64_t v37;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256FB1CA8);
  v3 = sub_240065D70();
  v4 = v3;
  if (*(_QWORD *)(v2 + 16))
  {
    v5 = 1 << *(_BYTE *)(v2 + 32);
    v35 = (_QWORD *)(v2 + 56);
    if (v5 < 64)
      v6 = ~(-1 << v5);
    else
      v6 = -1;
    v7 = v6 & *(_QWORD *)(v2 + 56);
    v34 = (unint64_t)(v5 + 63) >> 6;
    v8 = v3 + 56;
    result = swift_retain();
    v10 = 0;
    v36 = v2;
    while (1)
    {
      if (v7)
      {
        v13 = __clz(__rbit64(v7));
        v7 &= v7 - 1;
        v37 = v10;
        v14 = v13 | (v10 << 6);
      }
      else
      {
        v15 = v10 + 1;
        if (__OFADD__(v10, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v15 >= v34)
          goto LABEL_33;
        v16 = v35[v15];
        v17 = v10 + 1;
        if (!v16)
        {
          v17 = v10 + 2;
          if (v10 + 2 >= v34)
            goto LABEL_33;
          v16 = v35[v17];
          if (!v16)
          {
            v17 = v10 + 3;
            if (v10 + 3 >= v34)
              goto LABEL_33;
            v16 = v35[v17];
            if (!v16)
            {
              v18 = v10 + 4;
              if (v10 + 4 >= v34)
              {
LABEL_33:
                swift_release();
                v1 = v0;
                v33 = 1 << *(_BYTE *)(v2 + 32);
                if (v33 > 63)
                  bzero(v35, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v35 = -1 << v33;
                *(_QWORD *)(v2 + 16) = 0;
                break;
              }
              v16 = v35[v18];
              if (!v16)
              {
                while (1)
                {
                  v17 = v18 + 1;
                  if (__OFADD__(v18, 1))
                    goto LABEL_39;
                  if (v17 >= v34)
                    goto LABEL_33;
                  v16 = v35[v17];
                  ++v18;
                  if (v16)
                    goto LABEL_23;
                }
              }
              v17 = v10 + 4;
            }
          }
        }
LABEL_23:
        v7 = (v16 - 1) & v16;
        v37 = v17;
        v14 = __clz(__rbit64(v16)) + (v17 << 6);
      }
      v19 = *(_QWORD *)(v2 + 48) + 32 * v14;
      v20 = *(_QWORD *)v19;
      v21 = *(_QWORD *)(v19 + 8);
      v22 = *(_BYTE *)(v19 + 16);
      v23 = *(_BYTE *)(v19 + 17);
      v24 = *(_BYTE *)(v19 + 18);
      v25 = *(_QWORD *)(v19 + 24);
      sub_240065E30();
      swift_bridgeObjectRetain();
      sub_240065CBC();
      swift_bridgeObjectRelease();
      sub_240065E48();
      sub_240065E48();
      sub_240065E48();
      sub_240065E3C();
      result = sub_240065E54();
      v26 = -1 << *(_BYTE *)(v4 + 32);
      v27 = result & ~v26;
      v28 = v27 >> 6;
      if (((-1 << v27) & ~*(_QWORD *)(v8 + 8 * (v27 >> 6))) != 0)
      {
        v11 = __clz(__rbit64((-1 << v27) & ~*(_QWORD *)(v8 + 8 * (v27 >> 6)))) | v27 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v29 = 0;
        v30 = (unint64_t)(63 - v26) >> 6;
        do
        {
          if (++v28 == v30 && (v29 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          v31 = v28 == v30;
          if (v28 == v30)
            v28 = 0;
          v29 |= v31;
          v32 = *(_QWORD *)(v8 + 8 * v28);
        }
        while (v32 == -1);
        v11 = __clz(__rbit64(~v32)) + (v28 << 6);
      }
      *(_QWORD *)(v8 + ((v11 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v11;
      v12 = *(_QWORD *)(v4 + 48) + 32 * v11;
      *(_QWORD *)v12 = v20;
      *(_QWORD *)(v12 + 8) = v21;
      *(_BYTE *)(v12 + 16) = v22;
      *(_BYTE *)(v12 + 17) = v23;
      *(_BYTE *)(v12 + 18) = v24;
      *(_QWORD *)(v12 + 24) = v25;
      ++*(_QWORD *)(v4 + 16);
      v2 = v36;
      v10 = v37;
    }
  }
  result = swift_release();
  *v1 = v4;
  return result;
}

uint64_t sub_240062C9C(uint64_t result, uint64_t a2, int a3, uint64_t a4, unint64_t a5, char a6)
{
  uint64_t *v6;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  int v23;
  int v24;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  BOOL v33;
  uint64_t v34;
  unsigned int v35;
  unsigned int v36;
  uint64_t *v37;
  int v38;
  uint64_t v39;
  _BOOL4 v41;
  BOOL v42;

  v8 = a2;
  v9 = result;
  v10 = a3 & 1;
  v11 = a3 & 0x100;
  v12 = a3 & 0x10000;
  v13 = *(_QWORD *)(*v6 + 16);
  v14 = *(_QWORD *)(*v6 + 24);
  v35 = WORD1(v12);
  v36 = v11 >> 8;
  if (v14 <= v13 || (a6 & 1) == 0)
  {
    v39 = result;
    if ((a6 & 1) != 0)
    {
      sub_240062938();
    }
    else
    {
      if (v14 > v13)
      {
        result = (uint64_t)sub_240062F60();
        goto LABEL_21;
      }
      sub_240063130();
    }
    v15 = *v6;
    sub_240065E30();
    swift_bridgeObjectRetain();
    sub_240065CBC();
    swift_bridgeObjectRelease();
    sub_240065E48();
    sub_240065E48();
    sub_240065E48();
    sub_240065E3C();
    result = sub_240065E54();
    v16 = -1 << *(_BYTE *)(v15 + 32);
    a5 = result & ~v16;
    v17 = v15 + 56;
    if (((*(_QWORD *)(v15 + 56 + ((a5 >> 3) & 0xFFFFFFFFFFFFF8)) >> a5) & 1) != 0)
    {
      v18 = ~v16;
      v19 = *(_QWORD *)(v15 + 48);
      v8 = a2;
      v9 = v39;
      v20 = v11;
      v38 = v10;
      while (1)
      {
        v21 = v19 + 32 * a5;
        result = *(_QWORD *)v21;
        v22 = *(unsigned __int8 *)(v21 + 16);
        v23 = *(unsigned __int8 *)(v21 + 17);
        v24 = ((_DWORD)v12 != 0) ^ *(unsigned __int8 *)(v21 + 18);
        if (*(_QWORD *)v21 == v9 && *(_QWORD *)(v21 + 8) == v8)
        {
          if ((((v10 != 0) ^ v22 | ((_DWORD)v20 != 0) ^ v23 | v24) & 1) == 0 && *(_QWORD *)(v21 + 24) == a4)
          {
LABEL_20:
            result = sub_240065DE8();
            __break(1u);
            break;
          }
        }
        else
        {
          v41 = v10 != 0;
          v42 = (_DWORD)v20 != 0;
          v26 = v12;
          v27 = v20;
          v28 = *(_QWORD *)(v21 + 24);
          result = sub_240065DDC();
          v29 = v28;
          v20 = v27;
          v12 = v26;
          v9 = v39;
          v8 = a2;
          v10 = v38;
          if (!((v41 ^ v22) & 1 | ((result & 1) == 0) | ((v42 ^ v23) | v24) & 1)
            && v29 == a4)
          {
            goto LABEL_20;
          }
        }
        a5 = (a5 + 1) & v18;
        if (((*(_QWORD *)(v17 + ((a5 >> 3) & 0xFFFFFFFFFFFFF8)) >> a5) & 1) == 0)
          goto LABEL_22;
      }
    }
LABEL_21:
    v8 = a2;
    v9 = v39;
  }
LABEL_22:
  v30 = *v37;
  *(_QWORD *)(*v37 + 8 * (a5 >> 6) + 56) |= 1 << a5;
  v31 = *(_QWORD *)(v30 + 48) + 32 * a5;
  *(_QWORD *)v31 = v9;
  *(_QWORD *)(v31 + 8) = v8;
  *(_BYTE *)(v31 + 16) = v10;
  *(_BYTE *)(v31 + 17) = v36;
  *(_BYTE *)(v31 + 18) = v35;
  *(_QWORD *)(v31 + 24) = a4;
  v32 = *(_QWORD *)(v30 + 16);
  v33 = __OFADD__(v32, 1);
  v34 = v32 + 1;
  if (v33)
    __break(1u);
  else
    *(_QWORD *)(v30 + 16) = v34;
  return result;
}

void *sub_240062F60()
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
  char v20;
  char v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  int64_t v25;
  unint64_t v26;
  int64_t v27;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256FB1CA8);
  v2 = *v0;
  v3 = sub_240065D64();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_28:
    result = (void *)swift_release();
    *v1 = v4;
    return result;
  }
  result = (void *)(v3 + 56);
  v6 = v2 + 56;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 56);
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
    v25 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v25 >= v13)
      goto LABEL_28;
    v26 = *(_QWORD *)(v6 + 8 * v25);
    ++v9;
    if (!v26)
    {
      v9 = v25 + 1;
      if (v25 + 1 >= v13)
        goto LABEL_28;
      v26 = *(_QWORD *)(v6 + 8 * v9);
      if (!v26)
      {
        v9 = v25 + 2;
        if (v25 + 2 >= v13)
          goto LABEL_28;
        v26 = *(_QWORD *)(v6 + 8 * v9);
        if (!v26)
          break;
      }
    }
LABEL_27:
    v12 = (v26 - 1) & v26;
    v15 = __clz(__rbit64(v26)) + (v9 << 6);
LABEL_12:
    v16 = 32 * v15;
    v17 = *(_QWORD *)(v2 + 48) + v16;
    v19 = *(_QWORD *)v17;
    v18 = *(_QWORD *)(v17 + 8);
    v20 = *(_BYTE *)(v17 + 16);
    v21 = *(_BYTE *)(v17 + 17);
    v22 = *(_BYTE *)(v17 + 18);
    v23 = *(_QWORD *)(v17 + 24);
    v24 = *(_QWORD *)(v4 + 48) + v16;
    *(_QWORD *)v24 = v19;
    *(_QWORD *)(v24 + 8) = v18;
    *(_BYTE *)(v24 + 16) = v20;
    *(_BYTE *)(v24 + 17) = v21;
    *(_BYTE *)(v24 + 18) = v22;
    *(_QWORD *)(v24 + 24) = v23;
    result = (void *)swift_bridgeObjectRetain();
  }
  v27 = v25 + 3;
  if (v27 >= v13)
    goto LABEL_28;
  v26 = *(_QWORD *)(v6 + 8 * v27);
  if (v26)
  {
    v9 = v27;
    goto LABEL_27;
  }
  while (1)
  {
    v9 = v27 + 1;
    if (__OFADD__(v27, 1))
      break;
    if (v9 >= v13)
      goto LABEL_28;
    v26 = *(_QWORD *)(v6 + 8 * v9);
    ++v27;
    if (v26)
      goto LABEL_27;
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_240063130()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t result;
  int64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  int64_t v15;
  unint64_t v16;
  int64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  char v23;
  char v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  char v29;
  unint64_t v30;
  BOOL v31;
  uint64_t v32;
  uint64_t v33;
  int64_t v34;
  uint64_t v35;
  int64_t v36;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256FB1CA8);
  v3 = sub_240065D70();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
    result = swift_release();
LABEL_35:
    *v1 = v4;
    return result;
  }
  v5 = 1 << *(_BYTE *)(v2 + 32);
  v33 = v2 + 56;
  if (v5 < 64)
    v6 = ~(-1 << v5);
  else
    v6 = -1;
  v7 = v6 & *(_QWORD *)(v2 + 56);
  v34 = (unint64_t)(v5 + 63) >> 6;
  v8 = v3 + 56;
  result = swift_retain();
  v10 = 0;
  v35 = v2;
  while (1)
  {
    if (v7)
    {
      v13 = __clz(__rbit64(v7));
      v7 &= v7 - 1;
      v36 = v10;
      v14 = v13 | (v10 << 6);
      goto LABEL_24;
    }
    v15 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v15 >= v34)
      goto LABEL_33;
    v16 = *(_QWORD *)(v33 + 8 * v15);
    v17 = v10 + 1;
    if (!v16)
    {
      v17 = v10 + 2;
      if (v10 + 2 >= v34)
        goto LABEL_33;
      v16 = *(_QWORD *)(v33 + 8 * v17);
      if (!v16)
      {
        v17 = v10 + 3;
        if (v10 + 3 >= v34)
          goto LABEL_33;
        v16 = *(_QWORD *)(v33 + 8 * v17);
        if (!v16)
          break;
      }
    }
LABEL_23:
    v7 = (v16 - 1) & v16;
    v36 = v17;
    v14 = __clz(__rbit64(v16)) + (v17 << 6);
LABEL_24:
    v19 = *(_QWORD *)(v2 + 48) + 32 * v14;
    v20 = *(_QWORD *)v19;
    v21 = *(_QWORD *)(v19 + 8);
    v22 = *(_BYTE *)(v19 + 16);
    v23 = *(_BYTE *)(v19 + 17);
    v24 = *(_BYTE *)(v19 + 18);
    v25 = *(_QWORD *)(v19 + 24);
    sub_240065E30();
    swift_bridgeObjectRetain_n();
    sub_240065CBC();
    swift_bridgeObjectRelease();
    sub_240065E48();
    sub_240065E48();
    sub_240065E48();
    sub_240065E3C();
    result = sub_240065E54();
    v26 = -1 << *(_BYTE *)(v4 + 32);
    v27 = result & ~v26;
    v28 = v27 >> 6;
    if (((-1 << v27) & ~*(_QWORD *)(v8 + 8 * (v27 >> 6))) != 0)
    {
      v11 = __clz(__rbit64((-1 << v27) & ~*(_QWORD *)(v8 + 8 * (v27 >> 6)))) | v27 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v29 = 0;
      v30 = (unint64_t)(63 - v26) >> 6;
      do
      {
        if (++v28 == v30 && (v29 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        v31 = v28 == v30;
        if (v28 == v30)
          v28 = 0;
        v29 |= v31;
        v32 = *(_QWORD *)(v8 + 8 * v28);
      }
      while (v32 == -1);
      v11 = __clz(__rbit64(~v32)) + (v28 << 6);
    }
    *(_QWORD *)(v8 + ((v11 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v11;
    v12 = *(_QWORD *)(v4 + 48) + 32 * v11;
    *(_QWORD *)v12 = v20;
    *(_QWORD *)(v12 + 8) = v21;
    *(_BYTE *)(v12 + 16) = v22;
    *(_BYTE *)(v12 + 17) = v23;
    *(_BYTE *)(v12 + 18) = v24;
    *(_QWORD *)(v12 + 24) = v25;
    ++*(_QWORD *)(v4 + 16);
    v2 = v35;
    v10 = v36;
  }
  v18 = v10 + 4;
  if (v10 + 4 >= v34)
  {
LABEL_33:
    result = swift_release_n();
    v1 = v0;
    goto LABEL_35;
  }
  v16 = *(_QWORD *)(v33 + 8 * v18);
  if (v16)
  {
    v17 = v10 + 4;
    goto LABEL_23;
  }
  while (1)
  {
    v17 = v18 + 1;
    if (__OFADD__(v18, 1))
      break;
    if (v17 >= v34)
      goto LABEL_33;
    v16 = *(_QWORD *)(v33 + 8 * v17);
    ++v18;
    if (v16)
      goto LABEL_23;
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_240063464@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, int a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, char a7@<W6>, uint64_t a8@<X8>)
{
  _QWORD *v8;
  _QWORD **v9;
  _QWORD *v16;
  char v17;
  unint64_t v18;
  uint64_t v19;
  _BOOL8 v20;
  uint64_t result;
  char v22;
  uint64_t v23;
  _QWORD *v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  char v28;
  char v29;
  uint64_t v30;
  char v31;

  v9 = (_QWORD **)v8;
  v16 = (_QWORD *)*v8;
  v18 = sub_2400624FC(a5, a6);
  v19 = v16[2];
  v20 = (v17 & 1) == 0;
  result = v19 + v20;
  if (__OFADD__(v19, v20))
  {
    __break(1u);
  }
  else
  {
    v22 = v17;
    v23 = v16[3];
    if (v23 >= result && (a7 & 1) != 0)
    {
LABEL_7:
      v24 = *v9;
      if ((v22 & 1) != 0)
      {
LABEL_8:
        v25 = v24[7] + 32 * v18;
        v26 = *(_QWORD *)(v25 + 8);
        v27 = *(_BYTE *)(v25 + 16);
        v28 = *(_BYTE *)(v25 + 17);
        v29 = *(_BYTE *)(v25 + 18);
        v30 = *(_QWORD *)(v25 + 24);
        *(_QWORD *)a8 = *(_QWORD *)v25;
        *(_QWORD *)(a8 + 8) = v26;
        *(_BYTE *)(a8 + 16) = v27;
        *(_BYTE *)(a8 + 17) = v28;
        *(_BYTE *)(a8 + 18) = v29;
        *(_QWORD *)(a8 + 24) = v30;
        *(_QWORD *)v25 = a1;
        *(_QWORD *)(v25 + 8) = a2;
        *(_BYTE *)(v25 + 16) = a3 & 1;
        *(_BYTE *)(v25 + 17) = BYTE1(a3) & 1;
        *(_BYTE *)(v25 + 18) = BYTE2(a3) & 1;
        *(_QWORD *)(v25 + 24) = a4;
        return result;
      }
      goto LABEL_11;
    }
    if (v23 >= result && (a7 & 1) == 0)
    {
      result = (uint64_t)sub_2400639B8();
      goto LABEL_7;
    }
    sub_240063610(result, a7 & 1);
    result = sub_2400624FC(a5, a6);
    if ((v22 & 1) == (v31 & 1))
    {
      v18 = result;
      v24 = *v9;
      if ((v22 & 1) != 0)
        goto LABEL_8;
LABEL_11:
      sub_240063950(v18, a5, a6, a1, a2, a3 & 0x10101, a4, v24);
      *(_OWORD *)a8 = 0u;
      *(_OWORD *)(a8 + 16) = 0u;
      return swift_bridgeObjectRetain();
    }
  }
  result = sub_240065DF4();
  __break(1u);
  return result;
}

uint64_t sub_240063610(uint64_t a1, char a2)
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
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  _QWORD *v23;
  unint64_t v24;
  int64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char v32;
  char v33;
  unint64_t v34;
  BOOL v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t *v38;
  int64_t v39;
  _QWORD *v40;
  uint64_t i;
  char v42;
  uint64_t v43;
  char v44;
  char v45;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254351B30);
  v42 = a2;
  v6 = sub_240065DB8();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_38;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v40 = (_QWORD *)(v5 + 64);
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v38 = v2;
  v39 = (unint64_t)(v8 + 63) >> 6;
  v11 = v6 + 64;
  result = swift_retain();
  v13 = 0;
  for (i = v5; ; v5 = i)
  {
    if (v10)
    {
      v20 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v21 = v20 | (v13 << 6);
      goto LABEL_21;
    }
    if (__OFADD__(v13++, 1))
      goto LABEL_40;
    if (v13 >= v39)
      break;
    v23 = v40;
    v24 = v40[v13];
    if (!v24)
    {
      v25 = v13 + 1;
      if (v13 + 1 >= v39)
      {
LABEL_31:
        swift_release();
        v3 = v38;
        if ((v42 & 1) == 0)
          goto LABEL_38;
        goto LABEL_34;
      }
      v24 = v40[v25];
      if (!v24)
      {
        while (1)
        {
          v13 = v25 + 1;
          if (__OFADD__(v25, 1))
            break;
          if (v13 >= v39)
            goto LABEL_31;
          v24 = v40[v13];
          ++v25;
          if (v24)
            goto LABEL_20;
        }
LABEL_39:
        __break(1u);
LABEL_40:
        __break(1u);
        return result;
      }
      ++v13;
    }
LABEL_20:
    v10 = (v24 - 1) & v24;
    v21 = __clz(__rbit64(v24)) + (v13 << 6);
LABEL_21:
    v26 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v21);
    v28 = *v26;
    v27 = v26[1];
    v29 = *(_QWORD *)(v5 + 56) + 32 * v21;
    v30 = *(_QWORD *)v29;
    v31 = *(_QWORD *)(v29 + 8);
    v32 = *(_BYTE *)(v29 + 16);
    v44 = *(_BYTE *)(v29 + 18);
    v45 = *(_BYTE *)(v29 + 17);
    v43 = *(_QWORD *)(v29 + 24);
    if ((v42 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    sub_240065E30();
    sub_240065CBC();
    result = sub_240065E54();
    v14 = -1 << *(_BYTE *)(v7 + 32);
    v15 = result & ~v14;
    v16 = v15 >> 6;
    if (((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      v17 = __clz(__rbit64((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v33 = 0;
      v34 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v34 && (v33 & 1) != 0)
        {
          __break(1u);
          goto LABEL_39;
        }
        v35 = v16 == v34;
        if (v16 == v34)
          v16 = 0;
        v33 |= v35;
        v36 = *(_QWORD *)(v11 + 8 * v16);
      }
      while (v36 == -1);
      v17 = __clz(__rbit64(~v36)) + (v16 << 6);
    }
    *(_QWORD *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    v18 = (_QWORD *)(*(_QWORD *)(v7 + 48) + 16 * v17);
    *v18 = v28;
    v18[1] = v27;
    v19 = *(_QWORD *)(v7 + 56) + 32 * v17;
    *(_QWORD *)v19 = v30;
    *(_QWORD *)(v19 + 8) = v31;
    *(_BYTE *)(v19 + 16) = v32;
    *(_BYTE *)(v19 + 17) = v45;
    *(_BYTE *)(v19 + 18) = v44;
    *(_QWORD *)(v19 + 24) = v43;
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v3 = v38;
  v23 = v40;
  if ((v42 & 1) == 0)
    goto LABEL_38;
LABEL_34:
  v37 = 1 << *(_BYTE *)(v5 + 32);
  if (v37 >= 64)
    bzero(v23, ((unint64_t)(v37 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v23 = -1 << v37;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_38:
  result = swift_release();
  *v3 = v7;
  return result;
}

unint64_t sub_240063950(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, uint64_t a7, _QWORD *a8)
{
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;

  a8[(result >> 6) + 8] |= 1 << result;
  v8 = (_QWORD *)(a8[6] + 16 * result);
  *v8 = a2;
  v8[1] = a3;
  v9 = a8[7] + 32 * result;
  *(_QWORD *)v9 = a4;
  *(_QWORD *)(v9 + 8) = a5;
  *(_BYTE *)(v9 + 16) = a6 & 1;
  *(_BYTE *)(v9 + 17) = BYTE1(a6) & 1;
  *(_BYTE *)(v9 + 18) = BYTE2(a6) & 1;
  *(_QWORD *)(v9 + 24) = a7;
  v10 = a8[2];
  v11 = __OFADD__(v10, 1);
  v12 = v10 + 1;
  if (v11)
    __break(1u);
  else
    a8[2] = v12;
  return result;
}

void *sub_2400639B8()
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
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  char v25;
  char v26;
  uint64_t v27;
  _QWORD *v28;
  uint64_t v29;
  unint64_t v31;
  int64_t v32;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254351B30);
  v2 = *v0;
  v3 = sub_240065DAC();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_24:
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
    if (__OFADD__(v9++, 1))
      goto LABEL_26;
    if (v9 >= v13)
      goto LABEL_24;
    v31 = *(_QWORD *)(v6 + 8 * v9);
    if (!v31)
      break;
LABEL_23:
    v12 = (v31 - 1) & v31;
    v15 = __clz(__rbit64(v31)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v19 = *v17;
    v18 = v17[1];
    v20 = 32 * v15;
    v21 = *(_QWORD *)(v2 + 56) + v20;
    v22 = *(_QWORD *)v21;
    v23 = *(_QWORD *)(v21 + 8);
    v24 = *(_BYTE *)(v21 + 16);
    v25 = *(_BYTE *)(v21 + 17);
    v26 = *(_BYTE *)(v21 + 18);
    v27 = *(_QWORD *)(v21 + 24);
    v28 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v28 = v19;
    v28[1] = v18;
    v29 = *(_QWORD *)(v4 + 56) + v20;
    *(_QWORD *)v29 = v22;
    *(_QWORD *)(v29 + 8) = v23;
    *(_BYTE *)(v29 + 16) = v24;
    *(_BYTE *)(v29 + 17) = v25;
    *(_BYTE *)(v29 + 18) = v26;
    *(_QWORD *)(v29 + 24) = v27;
    swift_bridgeObjectRetain();
    result = (void *)swift_bridgeObjectRetain();
  }
  v32 = v9 + 1;
  if (v9 + 1 >= v13)
    goto LABEL_24;
  v31 = *(_QWORD *)(v6 + 8 * v32);
  if (v31)
  {
    ++v9;
    goto LABEL_23;
  }
  while (1)
  {
    v9 = v32 + 1;
    if (__OFADD__(v32, 1))
      break;
    if (v9 >= v13)
      goto LABEL_24;
    v31 = *(_QWORD *)(v6 + 8 * v9);
    ++v32;
    if (v31)
      goto LABEL_23;
  }
  __break(1u);
LABEL_26:
  __break(1u);
  return result;
}

uint64_t sub_240063B7C()
{
  return swift_release();
}

uint64_t sub_240063B84(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254351B40);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x24267C5A0]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_240063C0C(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_254351B40);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

ValueMetadata *type metadata accessor for IRMBManager()
{
  return &type metadata for IRMBManager;
}

_QWORD *initializeBufferWithCopyOfBuffer for IRMBManagerError(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for IRMBManagerError()
{
  return swift_bridgeObjectRelease();
}

_QWORD *assignWithCopy for IRMBManagerError(_QWORD *a1, _QWORD *a2)
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

_QWORD *assignWithTake for IRMBManagerError(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for IRMBManagerError(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for IRMBManagerError(uint64_t result, int a2, int a3)
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

uint64_t sub_240063D90()
{
  return 0;
}

ValueMetadata *type metadata accessor for IRMBManagerError()
{
  return &type metadata for IRMBManagerError;
}

void type metadata accessor for IRMediaBundleType()
{
  unint64_t ForeignTypeMetadata;
  uint64_t v1;

  if (!qword_256FB1C98)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1)
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_256FB1C98);
  }
}

unint64_t sub_240063E04()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256FB1CA0;
  if (!qword_256FB1CA0)
  {
    type metadata accessor for IRMediaBundleType();
    result = MEMORY[0x24267C5AC](&unk_240066284, v1);
    atomic_store(result, (unint64_t *)&qword_256FB1CA0);
  }
  return result;
}

unint64_t sub_240063E4C()
{
  unint64_t result;

  result = qword_254351B70;
  if (!qword_254351B70)
  {
    result = MEMORY[0x24267C5AC](&protocol conformance descriptor for IRMBBundle, &type metadata for IRMBBundle);
    atomic_store(result, (unint64_t *)&qword_254351B70);
  }
  return result;
}

uint64_t sub_240063E90(uint64_t a1, unint64_t *a2)
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

unint64_t sub_240063EC8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256FB1CB8;
  if (!qword_256FB1CB8)
  {
    v1 = sub_240063E90(255, &qword_256FB1CB0);
    result = MEMORY[0x24267C5AC](MEMORY[0x24BEE5BD8], v1);
    atomic_store(result, (unint64_t *)&qword_256FB1CB8);
  }
  return result;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

unint64_t sub_240063F38()
{
  unint64_t result;

  result = qword_256FB1CC8;
  if (!qword_256FB1CC8)
  {
    result = MEMORY[0x24267C5AC](&protocol conformance descriptor for IRMBManagerError, &type metadata for IRMBManagerError);
    atomic_store(result, (unint64_t *)&qword_256FB1CC8);
  }
  return result;
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

uint64_t sub_240063F9C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
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

void sub_240064020()
{
  qword_254351B60 = 0x646E7542424D5249;
  *(_QWORD *)algn_254351B68 = 0xEB0000000073656CLL;
}

void sub_24006404C()
{
  qword_254351B48 = 0x7473696C70;
  unk_254351B50 = 0xE500000000000000;
}

void sub_24006406C()
{
  qword_254351B98 = 0x707954616964656DLL;
  qword_254351BA0 = 0xE900000000000065;
}

id sub_240064094()
{
  if (qword_254351B80 != -1)
    swift_once();
  qword_254351B90 = qword_254351B88;
  return (id)qword_254351B88;
}

unint64_t sub_2400640DC@<X0>(unint64_t result@<X0>, _QWORD *a2@<X8>)
{
  unint64_t v3;
  char v4;
  unint64_t v5;
  char v6;
  uint64_t v7;
  unint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  char v15;
  uint64_t v16;
  unint64_t v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;

  if (*(_QWORD *)(result + 16))
  {
    v3 = result;
    result = sub_2400624FC(0xD000000000000010, 0x8000000240066780);
    if ((v4 & 1) != 0)
    {
      sub_240063F9C(*(_QWORD *)(v3 + 56) + 32 * result, (uint64_t)&v21);
      result = swift_dynamicCast();
      if ((result & 1) != 0)
      {
        if (*(_QWORD *)(v3 + 16))
        {
          v5 = sub_2400624FC(0xD000000000000019, 0x80000002400667A0);
          if ((v6 & 1) != 0
            && (sub_240063F9C(*(_QWORD *)(v3 + 56) + 32 * v5, (uint64_t)&v21), swift_dynamicCast()))
          {
            v7 = v19;
          }
          else
          {
            v7 = 0;
          }
          if (*(_QWORD *)(v3 + 16))
          {
            v8 = sub_2400624FC(0xD000000000000012, 0x80000002400667C0);
            if ((v9 & 1) != 0
              && (sub_240063F9C(*(_QWORD *)(v3 + 56) + 32 * v8, (uint64_t)&v21), swift_dynamicCast()))
            {
              if ((_BYTE)v19)
                v10 = 256;
              else
                v10 = 0;
            }
            else
            {
              v10 = 0;
            }
            if (*(_QWORD *)(v3 + 16))
            {
              v17 = sub_2400624FC(0xD000000000000015, 0x80000002400667E0);
              if ((v18 & 1) != 0)
              {
                sub_240063F9C(*(_QWORD *)(v3 + 56) + 32 * v17, (uint64_t)&v21);
                if (swift_dynamicCast())
                {
                  if ((_BYTE)v19)
                    v11 = 0x10000;
                  else
                    v11 = 0;
LABEL_20:
                  if (qword_254351B10 == -1)
                  {
                    if (*(_QWORD *)(v3 + 16))
                      goto LABEL_22;
                  }
                  else
                  {
                    swift_once();
                    if (*(_QWORD *)(v3 + 16))
                    {
LABEL_22:
                      v12 = qword_254351BA0;
                      v13 = qword_254351B98;
                      swift_bridgeObjectRetain();
                      v14 = sub_2400624FC(v13, v12);
                      if ((v15 & 1) != 0)
                      {
                        sub_240063F9C(*(_QWORD *)(v3 + 56) + 32 * v14, (uint64_t)&v21);
                      }
                      else
                      {
                        v21 = 0u;
                        v22 = 0u;
                      }
                      swift_bridgeObjectRelease();
                      if (*((_QWORD *)&v22 + 1))
                      {
                        result = swift_dynamicCast();
                        if ((result & 1) != 0)
                        {
                          if (v19 == 1)
                            v16 = 1;
                          else
                            v16 = 2 * (v19 == 2);
                          goto LABEL_41;
                        }
LABEL_40:
                        v16 = 0;
LABEL_41:
                        *a2 = v19;
                        a2[1] = v20;
                        a2[2] = v7 | v10 | v11;
                        a2[3] = v16;
                        return result;
                      }
LABEL_39:
                      result = sub_24006523C((uint64_t)&v21, &qword_254351B40);
                      goto LABEL_40;
                    }
                  }
                  v21 = 0u;
                  v22 = 0u;
                  goto LABEL_39;
                }
              }
            }
LABEL_19:
            v11 = 0;
            goto LABEL_20;
          }
        }
        else
        {
          v7 = 0;
        }
        v10 = 0;
        goto LABEL_19;
      }
    }
  }
  *(_OWORD *)a2 = 0u;
  *((_OWORD *)a2 + 1) = 0u;
  return result;
}

uint64_t sub_2400643CC(uint64_t a1)
{
  int64_t v2;
  uint64_t v3;
  uint64_t i;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;
  _BYTE v11[32];
  uint64_t v12;

  v2 = *(_QWORD *)(a1 + 16);
  v12 = MEMORY[0x24BEE4AF8];
  sub_24006461C(0, v2, 0);
  v3 = v12;
  if (v2)
  {
    for (i = a1 + 32; ; i += 32)
    {
      sub_240063F9C(i, (uint64_t)v11);
      if (!swift_dynamicCast())
        break;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_24006461C(0, *(_QWORD *)(v3 + 16) + 1, 1);
        v3 = v12;
      }
      v6 = *(_QWORD *)(v3 + 16);
      v5 = *(_QWORD *)(v3 + 24);
      if (v6 >= v5 >> 1)
      {
        sub_24006461C(v5 > 1, v6 + 1, 1);
        v3 = v12;
      }
      *(_QWORD *)(v3 + 16) = v6 + 1;
      v7 = v3 + 16 * v6;
      *(_QWORD *)(v7 + 32) = v9;
      *(_QWORD *)(v7 + 40) = v10;
      if (!--v2)
        return v3;
    }
    swift_release();
    swift_bridgeObjectRelease();
    return 0;
  }
  return v3;
}

_QWORD *sub_240064510(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_254351B38);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v12 = v11 - 32;
      if (v11 < 32)
        v12 = v11 - 1;
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 5);
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
        if (v10 != a4 || v13 >= &a4[4 * v8 + 4])
          memmove(v13, a4 + 4, 32 * v8);
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_2400647A0(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_24006461C(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_240064638(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_240064638(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_256FB1CE0);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 17;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8])
      memmove(v13, v14, 16 * v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[16 * v8] || v13 >= &v14[16 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  result = sub_240065DD0();
  __break(1u);
  return result;
}

uint64_t sub_2400647A0(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
    v5 = a4 + 32 * a1 + 32;
    v6 = a3 + 32 * v4;
    if (v5 >= v6 || v5 + 32 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  result = sub_240065DD0();
  __break(1u);
  return result;
}

uint64_t sub_240064890(uint64_t a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t result;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  BOOL v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  _QWORD *v22;
  _QWORD *v23;
  _QWORD *v24;
  uint64_t v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  v2 = *(_QWORD *)(a1 + 16);
  if (v2)
  {
    v4 = a1 + 32;
    swift_bridgeObjectRetain();
    v5 = 0;
    v23 = a2 + 7;
    v6 = (_QWORD *)MEMORY[0x24BEE4AF8];
    while (1)
    {
      v7 = swift_bridgeObjectRetain();
      sub_2400640DC(v7, &v28);
      v8 = v29;
      if (v29)
      {
        v26 = v30;
        v27 = v31;
        v32 = v28;
        if (!a2)
          goto LABEL_22;
        v25 = a2[2];
        if (!v25)
          goto LABEL_22;
        if (a2[4] != v28 || v29 != a2[5])
        {
          result = sub_240065DDC();
          if ((result & 1) == 0)
          {
            v10 = v32;
            if (v25 != 1)
            {
              v11 = v23;
              v12 = 1;
              v24 = v6;
              while (1)
              {
                v13 = v4;
                v14 = v2;
                v15 = a2;
                v16 = v12 + 1;
                if (__OFADD__(v12, 1))
                  break;
                v17 = *(v11 - 1) == v10 && v8 == *v11;
                if (v17 || (result = sub_240065DDC(), (result & 1) != 0))
                {
                  swift_bridgeObjectRelease();
                  swift_bridgeObjectRelease();
                  a2 = v15;
                  v2 = v14;
                  v4 = v13;
                  v6 = v24;
                  goto LABEL_4;
                }
                v11 += 2;
                ++v12;
                v17 = v16 == v25;
                a2 = v15;
                v2 = v14;
                v4 = v13;
                v6 = v24;
                v10 = v32;
                if (v17)
                  goto LABEL_22;
              }
              __break(1u);
              return result;
            }
LABEL_22:
            swift_bridgeObjectRelease();
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
              v6 = sub_240064510(0, v6[2] + 1, 1, v6);
            v19 = v6[2];
            v18 = v6[3];
            v20 = v32;
            if (v19 >= v18 >> 1)
            {
              v22 = sub_240064510((_QWORD *)(v18 > 1), v19 + 1, 1, v6);
              v20 = v32;
              v6 = v22;
            }
            v6[2] = v19 + 1;
            v21 = &v6[4 * v19];
            v21[4] = v20;
            v21[5] = v8;
            *((_BYTE *)v21 + 48) = v26 & 1;
            *((_BYTE *)v21 + 49) = BYTE1(v26) & 1;
            *((_BYTE *)v21 + 50) = BYTE2(v26) & 1;
            v21[7] = v27;
            goto LABEL_4;
          }
        }
        swift_bridgeObjectRelease();
      }
      swift_bridgeObjectRelease();
LABEL_4:
      if (++v5 == v2)
      {
        swift_bridgeObjectRelease();
        return (uint64_t)v6;
      }
    }
  }
  return MEMORY[0x24BEE4AF8];
}

uint64_t sub_240064AE4()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  char **v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t result;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  void *v29;
  _QWORD *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char v38;
  char isUniquelyReferenced_nonNull_native;
  char v40;
  uint64_t v41;
  _BOOL8 v42;
  uint64_t v43;
  char v44;
  unint64_t v45;
  char v46;
  char v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t v50;
  BOOL v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  id v55;
  unint64_t v56;
  uint64_t v57;
  uint64_t v58;
  unint64_t v59;
  uint64_t v60;
  int v61;
  uint64_t v62;
  id v63[5];

  v63[4] = *(id *)MEMORY[0x24BDAC8D0];
  __swift_instantiateConcreteTypeFromMangledName(&qword_254351B00);
  v0 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v2 = (char *)&v53 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v0);
  v4 = (uint64_t *)((char *)&v53 - v3);
  v5 = sub_240065C44();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (unint64_t)&v53 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = objc_allocWithZone(MEMORY[0x24BDD1488]);
  v10 = (void *)sub_240065C98();
  v11 = objc_msgSend(v9, sel_initWithPath_, v10);

  if (!v11)
  {
    (*(void (**)(_QWORD *, uint64_t, uint64_t, uint64_t))(v6 + 56))(v4, 1, 1, v5);
LABEL_11:
    sub_24006523C((uint64_t)v4, &qword_254351B00);
    return 0;
  }
  v12 = qword_254351B18;
  v13 = (char **)v11;
  if (v12 != -1)
LABEL_44:
    swift_once();
  v14 = (void *)sub_240065C98();
  if (qword_254351B58 != -1)
    swift_once();
  v15 = (void *)sub_240065C98();
  v16 = objc_msgSend(v13, sel_URLForResource_withExtension_, v14, v15);

  if (v16)
  {
    sub_240065C38();

    v17 = 0;
  }
  else
  {
    v17 = 1;
  }
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56))(v2, v17, 1, v5);
  sub_2400651B0((uint64_t)v2, (uint64_t)v4);
  if ((*(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1)
  {

    goto LABEL_11;
  }
  (*(void (**)(unint64_t, _QWORD *, uint64_t))(v6 + 32))(v8, v4, v5);
  v19 = sub_240065C50();
  v21 = v20;
  v22 = (void *)objc_opt_self();
  v23 = (void *)sub_240065C5C();
  v63[0] = 0;
  v24 = objc_msgSend(v22, sel_propertyListWithData_options_format_error_, v23, 0, 0, v63);

  if (v24)
  {
    v59 = v21;
    v25 = v63[0];
    sub_240065D40();
    swift_unknownObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_254351B20);
    if (swift_dynamicCast())
      v26 = v62;
    else
      v26 = MEMORY[0x24BEE4AF8];
    if (qword_254351B08 != -1)
      swift_once();
    v29 = (void *)qword_254351B90;
    v30 = 0;
    if ((sub_240065C68() & 1) != 0 && v29)
    {
      v31 = v19;
      v32 = (void *)sub_240065C98();
      v30 = objc_msgSend(v29, sel_arrayForKey_, v32);

      if (v30)
      {
        v33 = sub_240065CE0();

        v30 = (_QWORD *)sub_2400643CC(v33);
        swift_bridgeObjectRelease();
      }
      v19 = v31;
    }
    swift_bridgeObjectRetain();
    v34 = sub_240064890(v26, v30);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    v35 = *(_QWORD *)(v34 + 16);
    if (v35)
    {
      v54 = v19;
      v55 = v13;
      v56 = v8;
      v57 = v6;
      v58 = v5;
      swift_bridgeObjectRetain();
      v53 = v34;
      v13 = (char **)(v34 + 56);
      v4 = (_QWORD *)MEMORY[0x24BEE4B00];
      while (1)
      {
        v60 = v35;
        v6 = (uint64_t)*(v13 - 3);
        v37 = (uint64_t)*(v13 - 2);
        v61 = *((unsigned __int8 *)v13 - 8);
        v5 = *((unsigned __int8 *)v13 - 7);
        v38 = *((_BYTE *)v13 - 6);
        v2 = *v13;
        swift_bridgeObjectRetain_n();
        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        v63[0] = v4;
        v8 = sub_2400624FC(v6, v37);
        v41 = v4[2];
        v42 = (v40 & 1) == 0;
        v43 = v41 + v42;
        if (__OFADD__(v41, v42))
        {
          __break(1u);
LABEL_43:
          __break(1u);
          goto LABEL_44;
        }
        v44 = v40;
        if (v4[3] >= v43)
        {
          if ((isUniquelyReferenced_nonNull_native & 1) == 0)
            sub_2400639B8();
        }
        else
        {
          sub_240063610(v43, isUniquelyReferenced_nonNull_native);
          v45 = sub_2400624FC(v6, v37);
          if ((v44 & 1) != (v46 & 1))
          {
            result = sub_240065DF4();
            __break(1u);
            return result;
          }
          v8 = v45;
        }
        v47 = v61;
        v4 = v63[0];
        if ((v44 & 1) != 0)
        {
          v36 = *((_QWORD *)v63[0] + 7) + 32 * v8;
          *(_QWORD *)v36 = v6;
          *(_QWORD *)(v36 + 8) = v37;
          *(_BYTE *)(v36 + 16) = v47;
          *(_BYTE *)(v36 + 17) = v5;
          *(_BYTE *)(v36 + 18) = v38;
          *(_QWORD *)(v36 + 24) = v2;
          swift_bridgeObjectRelease();
        }
        else
        {
          *((_QWORD *)v63[0] + (v8 >> 6) + 8) |= 1 << v8;
          v48 = (uint64_t *)(v4[6] + 16 * v8);
          *v48 = v6;
          v48[1] = v37;
          v49 = v4[7] + 32 * v8;
          *(_QWORD *)v49 = v6;
          *(_QWORD *)(v49 + 8) = v37;
          *(_BYTE *)(v49 + 16) = v47;
          *(_BYTE *)(v49 + 17) = v5;
          *(_BYTE *)(v49 + 18) = v38;
          *(_QWORD *)(v49 + 24) = v2;
          v50 = v4[2];
          v51 = __OFADD__(v50, 1);
          v52 = v50 + 1;
          if (v51)
            goto LABEL_43;
          v4[2] = v52;
          swift_bridgeObjectRetain();
        }
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v13 += 4;
        v35 = v60 - 1;
        if (v60 == 1)
        {

          swift_bridgeObjectRelease();
          sub_2400651F8(v54, v59);
          (*(void (**)(unint64_t, uint64_t))(v57 + 8))(v56, v58);
          swift_bridgeObjectRelease();
          return (uint64_t)v4;
        }
      }
    }
    (*(void (**)(unint64_t, uint64_t))(v6 + 8))(v8, v5);
    swift_bridgeObjectRelease();

    sub_2400651F8(v19, v59);
  }
  else
  {
    v27 = v63[0];
    v28 = sub_240065C2C();

    swift_willThrow();
    sub_2400651F8(v19, v21);

    MEMORY[0x24267C564](v28);
    (*(void (**)(unint64_t, uint64_t))(v6 + 8))(v8, v5);
  }
  return 0;
}

uint64_t sub_2400651B0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254351B00);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_2400651F8(uint64_t a1, unint64_t a2)
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

uint64_t sub_24006523C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_240065278(uint64_t a1, uint64_t a2)
{
  id v4;
  void *v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  _OWORD v11[2];
  _BYTE v12[24];
  uint64_t v13;

  objc_allocWithZone(MEMORY[0x24BDC1540]);
  swift_bridgeObjectRetain();
  v4 = sub_240061CF4(a1, a2, 0);
  v6 = v4;
  if (!v4)
    return 0;
  v7 = objc_msgSend(v4, sel_infoDictionary);
  v8 = (void *)sub_240065C98();
  sub_2400654E4();
  v9 = objc_msgSend(v7, sel_objectForKey_ofClass_, v8, swift_getObjCClassFromMetadata());

  if (v9)
  {
    sub_240065D40();
    swift_unknownObjectRelease();

  }
  else
  {

    memset(v11, 0, sizeof(v11));
  }
  sub_240063B84((uint64_t)v11, (uint64_t)v12);
  if (!v13)
  {
    sub_240063C0C((uint64_t)v12);
    return 0;
  }
  if (swift_dynamicCast())
    return v10;
  else
    return 0;
}

uint64_t sub_2400653EC(uint64_t a1, uint64_t a2)
{
  if (!a2)
    return 0;
  if (a1 == 0x6D726F46676E6F4CLL && a2 == 0xED00006F69647541 || (sub_240065DDC() & 1) != 0)
    return 1;
  if (a1 == 0x6D726F46676E6F4CLL && a2 == 0xED00006F65646956 || (sub_240065DDC() & 1) != 0)
    return 2;
  else
    return 0;
}

unint64_t sub_2400654E4()
{
  unint64_t result;

  result = qword_254351B28;
  if (!qword_254351B28)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_254351B28);
  }
  return result;
}

void sub_240065520()
{
  id v0;
  void *v1;
  id v2;

  v0 = objc_allocWithZone(MEMORY[0x24BDBCF50]);
  swift_bridgeObjectRetain();
  v1 = (void *)sub_240065C98();
  swift_bridgeObjectRelease();
  v2 = objc_msgSend(v0, sel_initWithSuiteName_, v1);

  qword_254351B88 = (uint64_t)v2;
}

double sub_2400655A0@<D0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  double result;

  v8 = objc_msgSend(a1, sel_identifier);
  if (v8)
  {
    v9 = v8;
    v10 = sub_240065CA4();
    v12 = v11;

    v13 = (uint64_t)objc_msgSend(a1, sel_bundleType);
    if (a3)
    {
      if (a2 == 0x6D726F46676E6F4CLL && a3 == 0xED00006F69647541 || (sub_240065DDC() & 1) != 0)
      {
        v13 = 1;
      }
      else if (a2 == 0x6D726F46676E6F4CLL && a3 == 0xED00006F65646956 || (sub_240065DDC() & 1) != 0)
      {
        v13 = 2;
      }
    }
    *a4 = v10;
    a4[1] = v12;
    a4[2] = 65793;
    a4[3] = v13;
  }
  else
  {
    result = 0.0;
    *(_OWORD *)a4 = 0u;
    *((_OWORD *)a4 + 1) = 0u;
  }
  return result;
}

uint64_t IRMBBundle.bundleIdentifier.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t IRMBBundle.isEligibleForOneTapSuggestion.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 16);
}

uint64_t IRMBBundle.isEligibleForAutoRoute.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 17);
}

uint64_t IRMBBundle.isEligibleForCallToAction.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 18);
}

uint64_t IRMBBundle.mediaType.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 24);
}

uint64_t IRMBBundle.hash(into:)()
{
  swift_bridgeObjectRetain();
  sub_240065CBC();
  swift_bridgeObjectRelease();
  sub_240065E48();
  sub_240065E48();
  sub_240065E48();
  return sub_240065E3C();
}

uint64_t IRMBBundle.hashValue.getter()
{
  sub_240065E30();
  swift_bridgeObjectRetain();
  sub_240065CBC();
  swift_bridgeObjectRelease();
  sub_240065E48();
  sub_240065E48();
  sub_240065E48();
  sub_240065E3C();
  return sub_240065E54();
}

uint64_t sub_240065898()
{
  sub_240065E30();
  swift_bridgeObjectRetain();
  sub_240065CBC();
  swift_bridgeObjectRelease();
  sub_240065E48();
  sub_240065E48();
  sub_240065E48();
  sub_240065E3C();
  return sub_240065E54();
}

BOOL _s30IntelligentRoutingMediaBundles10IRMBBundleV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  int v2;
  int v3;
  uint64_t v4;
  int v5;
  int v6;
  uint64_t v7;
  int v8;
  _BOOL8 result;
  char v10;

  v2 = *(unsigned __int8 *)(a1 + 16);
  v3 = *(unsigned __int8 *)(a1 + 17);
  v4 = *(_QWORD *)(a1 + 24);
  v5 = *(unsigned __int8 *)(a2 + 16);
  v6 = *(unsigned __int8 *)(a2 + 17);
  v7 = *(_QWORD *)(a2 + 24);
  v8 = *(unsigned __int8 *)(a1 + 18) ^ *(unsigned __int8 *)(a2 + 18);
  if (*(_QWORD *)a1 == *(_QWORD *)a2 && *(_QWORD *)(a1 + 8) == *(_QWORD *)(a2 + 8))
  {
    if (((v2 ^ v5 | v3 ^ v6 | v8) & 1) != 0)
      return 0;
  }
  else
  {
    v10 = sub_240065DDC();
    result = 0;
    if ((v2 ^ v5) & 1 | ((v10 & 1) == 0) | (v3 ^ v6 | v8) & 1)
      return result;
  }
  return v4 == v7;
}

unint64_t sub_240065A10()
{
  unint64_t result;

  result = qword_254351B78;
  if (!qword_254351B78)
  {
    result = MEMORY[0x24267C5AC](&protocol conformance descriptor for IRMBBundle, &type metadata for IRMBBundle);
    atomic_store(result, (unint64_t *)&qword_254351B78);
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for IRMBBundle(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t initializeWithCopy for IRMBBundle(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_WORD *)(a1 + 17) = *(_WORD *)(a2 + 17);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for IRMBBundle(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_BYTE *)(a1 + 17) = *(_BYTE *)(a2 + 17);
  *(_BYTE *)(a1 + 18) = *(_BYTE *)(a2 + 18);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
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

uint64_t assignWithTake for IRMBBundle(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_BYTE *)(a1 + 17) = *(_BYTE *)(a2 + 17);
  *(_BYTE *)(a1 + 18) = *(_BYTE *)(a2 + 18);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  return a1;
}

uint64_t getEnumTagSinglePayload for IRMBBundle(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 32))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for IRMBBundle(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 32) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for IRMBBundle()
{
  return &type metadata for IRMBBundle;
}

uint64_t sub_240065C2C()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_240065C38()
{
  return MEMORY[0x24BDCD9C0]();
}

uint64_t sub_240065C44()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_240065C50()
{
  return MEMORY[0x24BDCDB78]();
}

uint64_t sub_240065C5C()
{
  return MEMORY[0x24BDCDCA0]();
}

uint64_t sub_240065C68()
{
  return MEMORY[0x24BE5B330]();
}

uint64_t sub_240065C74()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_240065C80()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_240065C8C()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_240065C98()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_240065CA4()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_240065CB0()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_240065CBC()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_240065CC8()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_240065CD4()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_240065CE0()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_240065CEC()
{
  return MEMORY[0x24BEE6B20]();
}

uint64_t sub_240065CF8()
{
  return MEMORY[0x24BEE6B48]();
}

uint64_t sub_240065D04()
{
  return MEMORY[0x24BEE15D8]();
}

uint64_t sub_240065D10()
{
  return MEMORY[0x24BEE1678]();
}

uint64_t sub_240065D1C()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_240065D28()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_240065D34()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_240065D40()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_240065D4C()
{
  return MEMORY[0x24BEE2300]();
}

uint64_t sub_240065D58()
{
  return MEMORY[0x24BEE2358]();
}

uint64_t sub_240065D64()
{
  return MEMORY[0x24BEE24B8]();
}

uint64_t sub_240065D70()
{
  return MEMORY[0x24BEE24C0]();
}

uint64_t sub_240065D7C()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_240065D88()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_240065D94()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_240065DA0()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_240065DAC()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_240065DB8()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_240065DC4()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_240065DD0()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_240065DDC()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_240065DE8()
{
  return MEMORY[0x24BEE3ED0]();
}

uint64_t sub_240065DF4()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_240065E00()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_240065E0C()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_240065E18()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_240065E24()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_240065E30()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_240065E3C()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_240065E48()
{
  return MEMORY[0x24BEE4300]();
}

uint64_t sub_240065E54()
{
  return MEMORY[0x24BEE4328]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
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

uint64_t objc_opt_self()
{
  return MEMORY[0x24BEDD168]();
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

uint64_t swift_dynamicCast()
{
  return MEMORY[0x24BEE4C38]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x24BEE4CA0]();
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

