ValueMetadata *type metadata accessor for CUPlaceholder()
{
  return &type metadata for CUPlaceholder;
}

uint64_t sub_21D95503C()
{
  uint64_t v0;

  v0 = sub_21D958D9C();
  __swift_allocate_value_buffer(v0, qword_255390738);
  __swift_project_value_buffer(v0, (uint64_t)qword_255390738);
  return sub_21D958D90();
}

void sub_21D955168(uint64_t a1, void *a2)
{
  void (*v3)(void *);
  id v4;

  v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3(a2);
  swift_release();

}

uint64_t sub_21D955250(uint64_t result)
{
  if (result)
    return swift_release();
  return result;
}

void sub_21D9552D4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;

  v1 = OBJC_IVAR___CUFindMyLocateMeDeviceMonitor__monitorTask;
  if (*(_QWORD *)(v0 + OBJC_IVAR___CUFindMyLocateMeDeviceMonitor__monitorTask))
  {
    v2 = v0;
    v3 = qword_255390730;
    swift_retain();
    if (v3 != -1)
      swift_once();
    v4 = sub_21D958D9C();
    __swift_project_value_buffer(v4, (uint64_t)qword_255390738);
    v5 = sub_21D958D84();
    v6 = sub_21D958E50();
    if (os_log_type_enabled(v5, v6))
    {
      v7 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_21D953000, v5, v6, "Session stop", v7, 2u);
      MEMORY[0x220795AAC](v7, -1, -1);
    }

    __swift_instantiateConcreteTypeFromMangledName(&qword_2553906C8);
    sub_21D958E2C();
    swift_release();
    *(_QWORD *)(v2 + v1) = 0;
    swift_release();
  }
}

uint64_t sub_21D9554A8(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2553906D0);
  result = MEMORY[0x24BDAC7A8]();
  v4 = (char *)&v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = OBJC_IVAR___CUFindMyLocateMeDeviceMonitor__monitorTask;
  if (!*(_QWORD *)(a1 + OBJC_IVAR___CUFindMyLocateMeDeviceMonitor__monitorTask))
  {
    v6 = sub_21D958E08();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v4, 1, 1, v6);
    v7 = swift_allocObject();
    swift_unknownObjectWeakInit();
    v8 = (_QWORD *)swift_allocObject();
    v8[2] = 0;
    v8[3] = 0;
    v8[4] = v7;
    *(_QWORD *)(a1 + v5) = sub_21D957528((uint64_t)v4, (uint64_t)&unk_2553906E0, (uint64_t)v8);
    return swift_release();
  }
  return result;
}

uint64_t sub_21D9555A0()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_21D9555C4()
{
  uint64_t v0;

  return sub_21D9554A8(*(_QWORD *)(v0 + 16));
}

uint64_t sub_21D9555CC(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
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
    result = MEMORY[0x220795A4C]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

unint64_t sub_21D955650()
{
  unint64_t result;
  uint64_t v1;

  result = qword_255390650;
  if (!qword_255390650)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255390648);
    result = MEMORY[0x220795A64](MEMORY[0x24BEE12C8], v1);
    atomic_store(result, (unint64_t *)&qword_255390650);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x220795A58](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_21D955730(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;

  v4[13] = a4;
  v5 = sub_21D958EA4();
  v4[14] = v5;
  v4[15] = *(_QWORD *)(v5 - 8);
  v4[16] = swift_task_alloc();
  v4[17] = swift_task_alloc();
  v6 = sub_21D958EBC();
  v4[18] = v6;
  v4[19] = *(_QWORD *)(v6 - 8);
  v4[20] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_21D9557C8()
{
  uint64_t v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t v10;
  _QWORD *v11;

  if ((sub_21D958E38() & 1) != 0)
  {
    if (qword_255390730 != -1)
      swift_once();
    v1 = sub_21D958D9C();
    __swift_project_value_buffer(v1, (uint64_t)qword_255390738);
    v2 = sub_21D958D84();
    v3 = sub_21D958E50();
    if (os_log_type_enabled(v2, v3))
    {
      v4 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_21D953000, v2, v3, "Session exit", v4, 2u);
      MEMORY[0x220795AAC](v4, -1, -1);
    }

    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    if (qword_255390730 != -1)
      swift_once();
    swift_beginAccess();
    v6 = sub_21D958D9C();
    *(_QWORD *)(v0 + 168) = __swift_project_value_buffer(v6, (uint64_t)qword_255390738);
    v7 = sub_21D958D84();
    v8 = sub_21D958E50();
    if (os_log_type_enabled(v7, v8))
    {
      v9 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_21D953000, v7, v8, "Session start", v9, 2u);
      MEMORY[0x220795AAC](v9, -1, -1);
    }

    sub_21D958CE8();
    *(_QWORD *)(v0 + 176) = swift_task_alloc();
    v10 = *(_QWORD *)(sub_21D958CDC() - 8);
    swift_task_alloc();
    (*(void (**)(void))(v10 + 104))();
    sub_21D958CF4();
    swift_task_dealloc();
    sub_21D958D6C();
    swift_allocObject();
    v11 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 184) = v11;
    *v11 = v0;
    v11[1] = sub_21D955A60;
    return sub_21D958D78();
  }
}

uint64_t sub_21D955A60(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 192) = a1;
  swift_task_dealloc();
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_21D955AC4()
{
  _QWORD *v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v4;
  _QWORD *v5;

  v1 = MEMORY[0x220795B18](v0[13] + 16);
  v0[25] = v1;
  if (v1)
  {
    v2 = (_QWORD *)swift_task_alloc();
    v0[26] = v2;
    *v2 = v0;
    v2[1] = sub_21D955B98;
    return sub_21D956CF4(v0[24]);
  }
  else
  {
    v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2553906F0);
    v0[27] = v4;
    v0[28] = *(_QWORD *)(v4 - 8);
    v0[29] = swift_task_alloc();
    v5 = (_QWORD *)swift_task_alloc();
    v0[30] = v5;
    *v5 = v0;
    v5[1] = sub_21D955C40;
    return sub_21D958D60();
  }
}

uint64_t sub_21D955B98()
{
  uint64_t *v0;
  _QWORD *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  v1 = (_QWORD *)*v0;
  v2 = *(void **)(*v0 + 200);
  v3 = *v0;
  swift_task_dealloc();

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2553906F0);
  v1[27] = v4;
  v1[28] = *(_QWORD *)(v4 - 8);
  v1[29] = swift_task_alloc();
  v5 = (_QWORD *)swift_task_alloc();
  v1[30] = v5;
  *v5 = v3;
  v5[1] = sub_21D955C40;
  return sub_21D958D60();
}

uint64_t sub_21D955C40()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 248) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_21D955CA4()
{
  _QWORD *v0;
  uint64_t v1;
  _QWORD *v2;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_255390710);
  v0[32] = v1;
  v0[33] = *(_QWORD *)(v1 - 8);
  v0[34] = swift_task_alloc();
  sub_21D958E14();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255390718);
  v0[35] = swift_task_alloc();
  swift_beginAccess();
  v2 = (_QWORD *)swift_task_alloc();
  v0[36] = v2;
  *v2 = v0;
  v2[1] = sub_21D955D8C;
  return sub_21D958E20();
}

uint64_t sub_21D955D8C()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_21D955DE0()
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
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  os_log_type_t v26;
  uint8_t *v27;
  uint64_t v28;
  NSObject *v29;
  os_log_type_t v30;
  uint8_t *v31;
  uint64_t v32;
  _QWORD *v33;
  NSObject *v34;
  os_log_type_t v35;
  uint8_t *v36;
  _QWORD *v37;
  uint64_t v38;
  void (*v39)(uint64_t, uint64_t, uint64_t);
  uint64_t v40;
  NSObject *v41;
  os_log_type_t v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  void (*v46)(uint64_t, uint64_t);
  uint64_t v47;
  unint64_t v48;
  void (*v49)(uint64_t, uint64_t);
  _QWORD *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;

  v1 = *(_QWORD *)(v0 + 280);
  v2 = sub_21D958D0C();
  *(_QWORD *)(v0 + 296) = v2;
  v3 = *(_QWORD *)(v2 - 8);
  *(_QWORD *)(v0 + 304) = v3;
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v1, 1, v2) == 1)
  {
    v5 = *(_QWORD *)(v0 + 264);
    v4 = *(_QWORD *)(v0 + 272);
    v6 = *(_QWORD *)(v0 + 256);
    v8 = *(_QWORD *)(v0 + 224);
    v7 = *(_QWORD *)(v0 + 232);
    v9 = *(_QWORD *)(v0 + 216);
    swift_release();
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v7, v9);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    if ((sub_21D958E38() & 1) != 0)
    {
      if (qword_255390730 != -1)
        swift_once();
      v10 = sub_21D958D9C();
      __swift_project_value_buffer(v10, (uint64_t)qword_255390738);
      v11 = sub_21D958D84();
      v12 = sub_21D958E50();
      if (os_log_type_enabled(v11, v12))
      {
        v13 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v13 = 0;
        _os_log_impl(&dword_21D953000, v11, v12, "Session exit", v13, 2u);
        MEMORY[0x220795AAC](v13, -1, -1);
      }

      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      return (*(uint64_t (**)(void))(v0 + 8))();
    }
    else
    {
      v28 = sub_21D958D9C();
      *(_QWORD *)(v0 + 168) = __swift_project_value_buffer(v28, (uint64_t)qword_255390738);
      v29 = sub_21D958D84();
      v30 = sub_21D958E50();
      if (os_log_type_enabled(v29, v30))
      {
        v31 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v31 = 0;
        _os_log_impl(&dword_21D953000, v29, v30, "Session start", v31, 2u);
        MEMORY[0x220795AAC](v31, -1, -1);
      }

      sub_21D958CE8();
      *(_QWORD *)(v0 + 176) = swift_task_alloc();
      v32 = *(_QWORD *)(sub_21D958CDC() - 8);
      swift_task_alloc();
      (*(void (**)(void))(v32 + 104))();
      sub_21D958CF4();
      swift_task_dealloc();
      sub_21D958D6C();
      swift_allocObject();
      v33 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 184) = v33;
      *v33 = v0;
      v33[1] = sub_21D955A60;
      return sub_21D958D78();
    }
  }
  v15 = *(_QWORD *)(v0 + 104) + 16;
  *(_QWORD *)(v0 + 312) = swift_task_alloc();
  (*(void (**)(void))(v3 + 32))();
  v16 = MEMORY[0x220795B18](v15);
  *(_QWORD *)(v0 + 320) = v16;
  if (!v16)
  {
LABEL_35:
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 304) + 8))(*(_QWORD *)(v0 + 312), *(_QWORD *)(v0 + 296));
    swift_task_dealloc();
    v50 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 288) = v50;
    *v50 = v0;
    v50[1] = sub_21D955D8C;
    return sub_21D958E20();
  }
  v17 = (void *)v16;
  v18 = swift_task_alloc();
  *(_QWORD *)(v0 + 328) = v18;
  (*(void (**)(void))(v3 + 16))();
  v19 = (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 88))(v18, v2);
  if (MEMORY[0x24BE31F90] && v19 == *MEMORY[0x24BE31F90])
  {
    (*(void (**)(uint64_t, uint64_t))(v3 + 96))(v18, v2);
    __swift_instantiateConcreteTypeFromMangledName(&qword_255390720);
    v20 = swift_task_alloc();
    sub_21D958B00(v18, v20);
    v21 = sub_21D958D48();
    v22 = *(_QWORD *)(v21 - 8);
    v23 = swift_task_alloc();
    v24 = swift_task_alloc();
    sub_21D958B48(v20, v24);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v22 + 48))(v24, 1, v21) == 1)
    {
      sub_21D958B90(v24, &qword_255390720);
      swift_task_dealloc();
      swift_task_dealloc();
      v25 = sub_21D958D84();
      v26 = sub_21D958E50();
      if (os_log_type_enabled(v25, v26))
      {
        v27 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v27 = 0;
        _os_log_impl(&dword_21D953000, v25, v26, "Me device changed: nil", v27, 2u);
        MEMORY[0x220795AAC](v27, -1, -1);
      }

    }
    else
    {
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v22 + 32))(v23, v24, v21);
      swift_task_dealloc();
      v38 = swift_task_alloc();
      v39 = *(void (**)(uint64_t, uint64_t, uint64_t))(v22 + 16);
      v52 = v38;
      v39(v38, v23, v21);
      v40 = swift_task_alloc();
      v39(v40, v23, v21);
      v41 = sub_21D958D84();
      v42 = sub_21D958E50();
      if (os_log_type_enabled(v41, v42))
      {
        v43 = swift_slowAlloc();
        v51 = swift_slowAlloc();
        v53 = v51;
        *(_DWORD *)v43 = 136315394;
        v44 = sub_21D958D18();
        *(_QWORD *)(v43 + 4) = sub_21D9584C0(v44, v45, &v53);
        swift_bridgeObjectRelease();
        v46 = *(void (**)(uint64_t, uint64_t))(v22 + 8);
        v46(v52, v21);
        *(_WORD *)(v43 + 12) = 2080;
        v47 = sub_21D958D30();
        *(_QWORD *)(v43 + 14) = sub_21D9584C0(v47, v48, &v53);
        swift_bridgeObjectRelease();
        v46(v40, v21);
        _os_log_impl(&dword_21D953000, v41, v42, "Me device changed: ids=%s, name=%s", (uint8_t *)v43, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x220795AAC](v51, -1, -1);
        MEMORY[0x220795AAC](v43, -1, -1);

        v46(v23, v21);
        swift_task_dealloc();
        swift_task_dealloc();
      }
      else
      {

        v49 = *(void (**)(uint64_t, uint64_t))(v22 + 8);
        v49(v40, v21);
        swift_task_dealloc();
        v49(v52, v21);
        swift_task_dealloc();
        v49(v23, v21);
      }
      swift_task_dealloc();
    }
    sub_21D9579C0(v20);
    sub_21D958B90(v20, &qword_255390720);

    swift_task_dealloc();
    goto LABEL_34;
  }
  if (MEMORY[0x24BE31F60] && v19 == *MEMORY[0x24BE31F60] || MEMORY[0x24BE31F78] && v19 == *MEMORY[0x24BE31F78])
  {
LABEL_28:

LABEL_34:
    swift_task_dealloc();
    goto LABEL_35;
  }
  if (!MEMORY[0x24BE31F70] || v19 != *MEMORY[0x24BE31F70])
  {
    (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v18, v2);
    goto LABEL_28;
  }
  v34 = sub_21D958D84();
  v35 = sub_21D958E50();
  if (os_log_type_enabled(v34, v35))
  {
    v36 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v36 = 0;
    _os_log_impl(&dword_21D953000, v34, v35, "Session initialized", v36, 2u);
    MEMORY[0x220795AAC](v36, -1, -1);
  }

  v37 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 336) = v37;
  *v37 = v0;
  v37[1] = sub_21D95664C;
  return sub_21D956CF4(*(_QWORD *)(v0 + 192));
}

uint64_t sub_21D95664C()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_21D9566A0()
{
  uint64_t v0;
  _QWORD *v1;

  swift_task_dealloc();
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 304) + 8))(*(_QWORD *)(v0 + 312), *(_QWORD *)(v0 + 296));
  swift_task_dealloc();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 288) = v1;
  *v1 = v0;
  v1[1] = sub_21D955D8C;
  return sub_21D958E20();
}

uint64_t sub_21D956728()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = *v1;
  *(_QWORD *)(*v1 + 360) = v0;
  swift_task_dealloc();
  if (v0)
  {
    (*(void (**)(_QWORD, _QWORD))(v2 + 344))(*(_QWORD *)(v2 + 136), *(_QWORD *)(v2 + 112));
  }
  else
  {
    v4 = *(_QWORD *)(v2 + 152);
    v3 = *(_QWORD *)(v2 + 160);
    v5 = *(_QWORD *)(v2 + 144);
    (*(void (**)(_QWORD, _QWORD))(v2 + 344))(*(_QWORD *)(v2 + 136), *(_QWORD *)(v2 + 112));
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  }
  return swift_task_switch();
}

uint64_t sub_21D9567C8()
{
  uint64_t v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t v10;
  _QWORD *v11;

  if ((sub_21D958E38() & 1) != 0)
  {
    if (qword_255390730 != -1)
      swift_once();
    v1 = sub_21D958D9C();
    __swift_project_value_buffer(v1, (uint64_t)qword_255390738);
    v2 = sub_21D958D84();
    v3 = sub_21D958E50();
    if (os_log_type_enabled(v2, v3))
    {
      v4 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_21D953000, v2, v3, "Session exit", v4, 2u);
      MEMORY[0x220795AAC](v4, -1, -1);
    }

    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    v6 = sub_21D958D9C();
    *(_QWORD *)(v0 + 168) = __swift_project_value_buffer(v6, (uint64_t)qword_255390738);
    v7 = sub_21D958D84();
    v8 = sub_21D958E50();
    if (os_log_type_enabled(v7, v8))
    {
      v9 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_21D953000, v7, v8, "Session start", v9, 2u);
      MEMORY[0x220795AAC](v9, -1, -1);
    }

    sub_21D958CE8();
    *(_QWORD *)(v0 + 176) = swift_task_alloc();
    v10 = *(_QWORD *)(sub_21D958CDC() - 8);
    swift_task_alloc();
    (*(void (**)(void))(v10 + 104))();
    sub_21D958CF4();
    swift_task_dealloc();
    sub_21D958D6C();
    swift_allocObject();
    v11 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 184) = v11;
    *v11 = v0;
    v11[1] = sub_21D955A60;
    return sub_21D958D78();
  }
}

uint64_t sub_21D956A2C()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 248);
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 152) + 8))(*(_QWORD *)(v0 + 160), *(_QWORD *)(v0 + 144));

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_21D956A9C()
{
  uint64_t v0;
  void *v1;
  id v2;
  id v3;
  NSObject *v4;
  os_log_type_t v5;
  _BOOL4 v6;
  void *v7;
  uint64_t v8;
  _QWORD *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t);
  _QWORD *v15;
  uint64_t v17;

  v1 = *(void **)(v0 + 248);
  swift_release();
  swift_task_dealloc();
  v2 = v1;
  v3 = v1;
  v4 = sub_21D958D84();
  v5 = sub_21D958E44();
  v6 = os_log_type_enabled(v4, v5);
  v7 = *(void **)(v0 + 248);
  if (v6)
  {
    v8 = swift_slowAlloc();
    v9 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v8 = 138412290;
    v10 = v7;
    v11 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v8 + 4) = v11;
    *v9 = v11;

    _os_log_impl(&dword_21D953000, v4, v5, "### Session start failed: error=%@", (uint8_t *)v8, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_255390708);
    swift_arrayDestroy();
    MEMORY[0x220795AAC](v9, -1, -1);
    MEMORY[0x220795AAC](v8, -1, -1);
  }
  else
  {

  }
  v12 = *(_QWORD *)(v0 + 128);
  v17 = *(_QWORD *)(v0 + 120);
  v13 = *(_QWORD *)(v0 + 112);

  sub_21D958EB0();
  *(_OWORD *)(v0 + 88) = xmmword_21D9592D0;
  *(_QWORD *)(v0 + 72) = 0;
  *(_QWORD *)(v0 + 64) = 0;
  *(_BYTE *)(v0 + 80) = 1;
  sub_21D958480(&qword_2553906F8, (uint64_t (*)(uint64_t))MEMORY[0x24BEE6E10], MEMORY[0x24BEE6E20]);
  sub_21D958EEC();
  sub_21D958480(&qword_255390700, (uint64_t (*)(uint64_t))MEMORY[0x24BEE6DC8], MEMORY[0x24BEE6E00]);
  sub_21D958EC8();
  v14 = *(void (**)(uint64_t, uint64_t))(v17 + 8);
  *(_QWORD *)(v0 + 344) = v14;
  v14(v12, v13);
  v15 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 352) = v15;
  *v15 = v0;
  v15[1] = sub_21D956728;
  return sub_21D958EF8();
}

uint64_t sub_21D956CF4(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  v2[5] = a1;
  v2[6] = v1;
  v3 = sub_21D958D48();
  v2[7] = v3;
  v4 = *(_QWORD *)(v3 - 8);
  v2[8] = v4;
  v2[9] = *(_QWORD *)(v4 + 64);
  v2[10] = swift_task_alloc();
  v5 = (_QWORD *)swift_task_alloc();
  v2[11] = v5;
  *v5 = v2;
  v5[1] = sub_21D956D84;
  return sub_21D958D54();
}

uint64_t sub_21D956D84()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 96) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_21D956DE8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = *(_QWORD *)(v0 + 80);
  v2 = *(_QWORD *)(v0 + 56);
  v3 = *(_QWORD *)(v0 + 64);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255390720);
  v4 = swift_task_alloc();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v4, v1, v2);
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v3 + 56))(v4, 0, 1, v2);
  sub_21D9579C0(v4);
  sub_21D958B90(v4, &qword_255390720);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_21D956EB0()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  int v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  _QWORD *v11;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  NSObject *v17;
  os_log_type_t v18;
  _BOOL4 v19;
  void *v20;
  uint8_t *v21;
  _QWORD *v22;
  id v23;
  uint64_t v24;

  v1 = *(void **)(v0 + 96);
  swift_task_dealloc();
  *(_QWORD *)(v0 + 16) = v1;
  v2 = sub_21D958D00();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = swift_task_alloc();
  *(_QWORD *)(v0 + 104) = v4;
  v5 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2553906C8);
  if ((swift_dynamicCast() & 1) != 0)
  {
    v6 = (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 88))(v4, v2);
    if (MEMORY[0x24BE31E28] && v6 == *MEMORY[0x24BE31E28])
    {

      if (qword_255390730 != -1)
        swift_once();
      v7 = sub_21D958D9C();
      *(_QWORD *)(v0 + 112) = __swift_project_value_buffer(v7, (uint64_t)qword_255390738);
      v8 = sub_21D958D84();
      v9 = sub_21D958E50();
      if (os_log_type_enabled(v8, v9))
      {
        v10 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v10 = 0;
        _os_log_impl(&dword_21D953000, v8, v9, "Get me device failed: missingMeDevice cached", v10, 2u);
        MEMORY[0x220795AAC](v10, -1, -1);
      }

      *(_QWORD *)(v0 + 120) = swift_task_alloc();
      v11 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 128) = v11;
      *v11 = v0;
      v11[1] = sub_21D957254;
      return sub_21D958D54();
    }
    (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v4, v2);
  }
  swift_task_dealloc();

  if (qword_255390730 != -1)
    swift_once();
  v13 = *(void **)(v0 + 96);
  v14 = sub_21D958D9C();
  __swift_project_value_buffer(v14, (uint64_t)qword_255390738);
  v15 = v13;
  v16 = v13;
  v17 = sub_21D958D84();
  v18 = sub_21D958E44();
  v19 = os_log_type_enabled(v17, v18);
  v20 = *(void **)(v0 + 96);
  if (v19)
  {
    v21 = (uint8_t *)swift_slowAlloc();
    v22 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v21 = 138412290;
    v23 = v20;
    v24 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v0 + 24) = v24;
    sub_21D958E68();
    *v22 = v24;

    _os_log_impl(&dword_21D953000, v17, v18, "### Get me device failed: cached, error=%@", v21, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_255390708);
    swift_arrayDestroy();
    MEMORY[0x220795AAC](v22, -1, -1);
    MEMORY[0x220795AAC](v21, -1, -1);

  }
  else
  {

  }
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_21D957254()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 136) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_21D9572B8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = *(_QWORD *)(v0 + 120);
  v2 = *(_QWORD *)(v0 + 56);
  v3 = *(_QWORD *)(v0 + 64);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255390720);
  v4 = swift_task_alloc();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v4, v1, v2);
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v3 + 56))(v4, 0, 1, v2);
  sub_21D9579C0(v4);
  sub_21D958B90(v4, &qword_255390720);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_21D957390()
{
  uint64_t v0;
  void *v1;
  id v2;
  id v3;
  NSObject *v4;
  os_log_type_t v5;
  void *v6;
  uint8_t *v7;
  _QWORD *v8;
  id v9;
  uint64_t v10;
  void *v11;

  v1 = *(void **)(v0 + 136);
  swift_task_dealloc();
  v2 = v1;
  v3 = v1;
  v4 = sub_21D958D84();
  v5 = sub_21D958E44();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = *(void **)(v0 + 136);
    v7 = (uint8_t *)swift_slowAlloc();
    v8 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v7 = 138412290;
    v9 = v6;
    v10 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v0 + 32) = v10;
    sub_21D958E68();
    *v8 = v10;

    _os_log_impl(&dword_21D953000, v4, v5, "### Get me device failed: uncached, error=%@", v7, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_255390708);
    swift_arrayDestroy();
    MEMORY[0x220795AAC](v8, -1, -1);
    MEMORY[0x220795AAC](v7, -1, -1);

  }
  else
  {
    v11 = *(void **)(v0 + 136);

  }
  swift_task_dealloc();

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_21D957528(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;

  v5 = sub_21D958E08();
  v6 = *(_QWORD *)(v5 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(a1, 1, v5) != 1)
  {
    sub_21D958DFC();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
    if (!*(_QWORD *)(a3 + 16))
      return swift_task_create();
    goto LABEL_3;
  }
  sub_21D958B90(a1, &qword_2553906D0);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_21D958DF0();
    swift_unknownObjectRelease();
  }
  return swift_task_create();
}

uint64_t sub_21D95765C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char *v3;
  uint64_t v6;
  uint64_t (*v7)(uint64_t);
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  void *v15;
  char *v16;
  _QWORD v18[2];
  uint64_t v19;
  uint64_t v20;
  _QWORD aBlock[6];

  v6 = sub_21D958DA8();
  v7 = (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458];
  v19 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8]();
  v9 = (char *)v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_21D958DC0();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8]();
  v13 = (char *)v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18[1] = *(_QWORD *)&v3[OBJC_IVAR___CUFindMyLocateMeDeviceMonitor__dispatchQueue];
  v14 = swift_allocObject();
  *(_QWORD *)(v14 + 16) = v3;
  aBlock[4] = a2;
  aBlock[5] = v14;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_21D9555CC;
  aBlock[3] = a3;
  v15 = _Block_copy(aBlock);
  v16 = v3;
  sub_21D958DB4();
  v20 = MEMORY[0x24BEE4AF8];
  sub_21D958480(&qword_255390640, v7, MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255390648);
  sub_21D955650();
  sub_21D958E80();
  MEMORY[0x2207957D0](0, v13, v9, v15);
  _Block_release(v15);
  (*(void (**)(char *, uint64_t))(v19 + 8))(v9, v6);
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  return swift_release();
}

void sub_21D957830()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;

  v1 = *(_QWORD *)(v0 + 16);
  v2 = OBJC_IVAR___CUFindMyLocateMeDeviceMonitor__monitorTask;
  if (*(_QWORD *)(v1 + OBJC_IVAR___CUFindMyLocateMeDeviceMonitor__monitorTask))
  {
    v3 = qword_255390730;
    swift_retain();
    if (v3 != -1)
      swift_once();
    v4 = sub_21D958D9C();
    __swift_project_value_buffer(v4, (uint64_t)qword_255390738);
    v5 = sub_21D958D84();
    v6 = sub_21D958E50();
    if (os_log_type_enabled(v5, v6))
    {
      v7 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_21D953000, v5, v6, "Session stop", v7, 2u);
      MEMORY[0x220795AAC](v7, -1, -1);
    }

    __swift_instantiateConcreteTypeFromMangledName(&qword_2553906C8);
    sub_21D958E2C();
    swift_release();
    *(_QWORD *)(v1 + v2) = 0;
    swift_release();
  }
}

uint64_t sub_21D9579C0(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  _BYTE *v14;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  id v19;
  uint64_t v20;
  unint64_t v21;
  _BYTE *v22;
  uint64_t (*v23)(_BYTE *, _BYTE *, uint64_t);
  uint64_t v24;
  _BYTE *v25;
  NSObject *v26;
  os_log_type_t v27;
  int v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  void (*v32)(_BYTE *, uint64_t);
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  void (*v36)(_BYTE *, uint64_t);
  char v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  id v44;
  id v45;
  _BYTE *v46;
  _BYTE *v47;
  _BYTE v49[4];
  int v50;
  uint64_t v51;
  _BYTE *v52;
  void (*v53)(_BYTE *, uint64_t);
  _BYTE *v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  _BYTE *v58;
  uint64_t v59;
  uint64_t v60;
  _BYTE *v61;
  uint64_t v62;
  uint64_t aBlock[7];

  v2 = v1;
  v4 = sub_21D958DA8();
  v5 = *(_QWORD *)(v4 - 8);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v61 = &v49[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v7 = sub_21D958DC0();
  v59 = *(_QWORD *)(v7 - 8);
  v60 = v7;
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v58 = &v49[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v9 = sub_21D958D48();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(_QWORD *)(v10 + 64);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v12 = &v49[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_instantiateConcreteTypeFromMangledName(&qword_255390720);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v14 = &v49[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_21D958B48(a1, (uint64_t)v14);
  if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v10 + 48))(v14, 1, v9) == 1)
  {
    sub_21D958B90((uint64_t)v14, &qword_255390720);
    if (qword_255390730 != -1)
      swift_once();
    v15 = sub_21D958D9C();
    __swift_project_value_buffer(v15, (uint64_t)qword_255390738);
    v16 = sub_21D958D84();
    v17 = sub_21D958E50();
    if (os_log_type_enabled(v16, v17))
    {
      v18 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v18 = 0;
      _os_log_impl(&dword_21D953000, v16, v17, "Me device fetched: nil", v18, 2u);
      MEMORY[0x220795AAC](v18, -1, -1);
    }

    v19 = 0;
  }
  else
  {
    v55 = v2;
    v56 = v5;
    v57 = v4;
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v10 + 32))(&v49[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)], v14, v9);
    if (qword_255390730 != -1)
      swift_once();
    v20 = sub_21D958D9C();
    __swift_project_value_buffer(v20, (uint64_t)qword_255390738);
    v54 = v49;
    ((void (*)(void))MEMORY[0x24BDAC7A8])();
    v21 = (v11 + 15) & 0xFFFFFFFFFFFFFFF0;
    v22 = &v49[-v21];
    v23 = *(uint64_t (**)(_BYTE *, _BYTE *, uint64_t))(v10 + 16);
    v24 = v23(&v49[-v21], &v49[-v21], v9);
    v52 = v49;
    MEMORY[0x24BDAC7A8](v24);
    v25 = &v49[-v21];
    v23(&v49[-v21], &v49[-v21], v9);
    v26 = sub_21D958D84();
    v27 = sub_21D958E50();
    v28 = v27;
    if (os_log_type_enabled(v26, v27))
    {
      v29 = swift_slowAlloc();
      v51 = swift_slowAlloc();
      aBlock[0] = v51;
      *(_DWORD *)v29 = 136315394;
      v50 = v28;
      v30 = sub_21D958D18();
      v62 = sub_21D9584C0(v30, v31, aBlock);
      sub_21D958E68();
      swift_bridgeObjectRelease();
      v32 = *(void (**)(_BYTE *, uint64_t))(v10 + 8);
      v32(v22, v9);
      *(_WORD *)(v29 + 12) = 2080;
      v33 = sub_21D958D30();
      v62 = sub_21D9584C0(v33, v34, aBlock);
      sub_21D958E68();
      swift_bridgeObjectRelease();
      v53 = v32;
      v32(v25, v9);
      _os_log_impl(&dword_21D953000, v26, (os_log_type_t)v50, "Me device fetched: ids=%s, name=%s", (uint8_t *)v29, 0x16u);
      v35 = v51;
      swift_arrayDestroy();
      MEMORY[0x220795AAC](v35, -1, -1);
      MEMORY[0x220795AAC](v29, -1, -1);
    }
    else
    {
      v36 = *(void (**)(_BYTE *, uint64_t))(v10 + 8);
      v36(&v49[-v21], v9);
      v53 = v36;
      v36(&v49[-v21], v9);
    }

    sub_21D958D3C();
    sub_21D958D18();
    v37 = sub_21D958D24();
    sub_21D958D30();
    v38 = objc_allocWithZone((Class)CUFindMyLocateMeDevice);
    v39 = (void *)sub_21D958DCC();
    swift_bridgeObjectRelease();
    v40 = (void *)sub_21D958DCC();
    swift_bridgeObjectRelease();
    v41 = (void *)sub_21D958DCC();
    swift_bridgeObjectRelease();
    v19 = objc_msgSend(v38, sel_initWithFindMyIdentifier_idsID_isThisDevice_name_, v39, v40, v37 & 1, v41);

    v53(v12, v9);
    v5 = v56;
    v4 = v57;
    v2 = v55;
  }
  v42 = swift_allocObject();
  *(_QWORD *)(v42 + 16) = v2;
  *(_QWORD *)(v42 + 24) = v19;
  aBlock[4] = (uint64_t)sub_21D958C58;
  aBlock[5] = v42;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_21D9555CC;
  aBlock[3] = (uint64_t)&block_descriptor_32;
  v43 = _Block_copy(aBlock);
  v44 = v19;
  v45 = v2;
  v46 = v58;
  sub_21D958DB4();
  v62 = MEMORY[0x24BEE4AF8];
  sub_21D958480(&qword_255390640, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255390648);
  sub_21D955650();
  v47 = v61;
  sub_21D958E80();
  MEMORY[0x2207957D0](0, v46, v47, v43);
  _Block_release(v43);

  (*(void (**)(_BYTE *, uint64_t))(v5 + 8))(v47, v4);
  (*(void (**)(_BYTE *, uint64_t))(v59 + 8))(v46, v60);
  return swift_release();
}

void CUFindMyLocateMeDeviceMonitor.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id sub_21D9580CC()
{
  void *v0;

  swift_bridgeObjectRetain();
  v0 = (void *)sub_21D958DCC();
  swift_bridgeObjectRelease();
  return v0;
}

id _sSo29CUFindMyLocateMeDeviceMonitorC11CoreUtilsUIEABycfC_0()
{
  return objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
}

void CUFindMyLocateMeDevice.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t type metadata accessor for CUFindMyLocateMeDeviceMonitor(uint64_t a1)
{
  return sub_21D9582D8(a1, &qword_255390750);
}

uint64_t type metadata accessor for CUFindMyLocateMeDevice(uint64_t a1)
{
  return sub_21D9582D8(a1, &qword_255390758);
}

uint64_t sub_21D9582D8(uint64_t a1, unint64_t *a2)
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

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
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

uint64_t sub_21D958368()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

uint64_t sub_21D95838C()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 16) + 16))();
}

uint64_t sub_21D95839C()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

uint64_t sub_21D9583C0()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_21D9583EC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;

  v2 = *(_QWORD *)(v0 + 32);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_21D958438;
  return sub_21D955730((uint64_t)v3, v4, v5, v2);
}

uint64_t sub_21D958438()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_21D958480(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x220795A64](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_21D9584C0(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_21D958590(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_21D958BEC((uint64_t)v12, *a3);
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
      sub_21D958BEC((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_21D958590(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_21D958E74();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_21D958748(a5, a6);
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
  v8 = sub_21D958E98();
  if (!v8)
  {
    sub_21D958ED4();
    __break(1u);
LABEL_17:
    result = sub_21D958EE0();
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

uint64_t sub_21D958748(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_21D9587DC(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_21D9589B4(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_21D9589B4(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_21D9587DC(uint64_t a1, unint64_t a2)
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
      v3 = sub_21D958950(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_21D958E8C();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_21D958ED4();
      __break(1u);
LABEL_10:
      v2 = sub_21D958DE4();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_21D958EE0();
    __break(1u);
LABEL_14:
    result = sub_21D958ED4();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_21D958950(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_255390728);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_21D9589B4(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_255390728);
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
  result = sub_21D958EE0();
  __break(1u);
  return result;
}

uint64_t sub_21D958B00(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255390720);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_21D958B48(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255390720);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_21D958B90(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
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

uint64_t sub_21D958BEC(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_21D958C2C()
{
  uint64_t v0;

  return swift_deallocObject();
}

void sub_21D958C58()
{
  uint64_t v0;
  char *v1;
  uint64_t v2;
  id v3;
  const void *v4;

  v1 = *(char **)(v0 + 16);
  if (*(_QWORD *)&v1[OBJC_IVAR___CUFindMyLocateMeDeviceMonitor__monitorTask])
  {
    v2 = *(_QWORD *)(v0 + 24);
    v3 = objc_msgSend(v1, sel_meDeviceUpdatedHandler);
    if (v3)
    {
      v4 = v3;
      (*((void (**)(id, uint64_t))v3 + 2))(v3, v2);
      _Block_release(v4);
    }
  }
}

uint64_t sub_21D958CDC()
{
  return MEMORY[0x24BE31D90]();
}

uint64_t sub_21D958CE8()
{
  return MEMORY[0x24BE31DC8]();
}

uint64_t sub_21D958CF4()
{
  return MEMORY[0x24BE31DE0]();
}

uint64_t sub_21D958D00()
{
  return MEMORY[0x24BE31E30]();
}

uint64_t sub_21D958D0C()
{
  return MEMORY[0x24BE31FA0]();
}

uint64_t sub_21D958D18()
{
  return MEMORY[0x24BE32008]();
}

uint64_t sub_21D958D24()
{
  return MEMORY[0x24BE32010]();
}

uint64_t sub_21D958D30()
{
  return MEMORY[0x24BE32028]();
}

uint64_t sub_21D958D3C()
{
  return MEMORY[0x24BE32038]();
}

uint64_t sub_21D958D48()
{
  return MEMORY[0x24BE32068]();
}

uint64_t sub_21D958D54()
{
  return MEMORY[0x24BE322C0]();
}

uint64_t sub_21D958D60()
{
  return MEMORY[0x24BE32318]();
}

uint64_t sub_21D958D6C()
{
  return MEMORY[0x24BE32370]();
}

uint64_t sub_21D958D78()
{
  return MEMORY[0x24BE32390]();
}

uint64_t sub_21D958D84()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_21D958D90()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_21D958D9C()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_21D958DA8()
{
  return MEMORY[0x24BEE5458]();
}

uint64_t sub_21D958DB4()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t sub_21D958DC0()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_21D958DCC()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_21D958DD8()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_21D958DE4()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_21D958DF0()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_21D958DFC()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t sub_21D958E08()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t sub_21D958E14()
{
  return MEMORY[0x24BEE6A50]();
}

uint64_t sub_21D958E20()
{
  return MEMORY[0x24BEE6A58]();
}

uint64_t sub_21D958E2C()
{
  return MEMORY[0x24BEE6AD0]();
}

uint64_t sub_21D958E38()
{
  return MEMORY[0x24BEE6B10]();
}

uint64_t sub_21D958E44()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_21D958E50()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_21D958E5C()
{
  return MEMORY[0x24BEE5790]();
}

uint64_t sub_21D958E68()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_21D958E74()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_21D958E80()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_21D958E8C()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_21D958E98()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_21D958EA4()
{
  return MEMORY[0x24BEE6DC8]();
}

uint64_t sub_21D958EB0()
{
  return MEMORY[0x24BEE6E08]();
}

uint64_t sub_21D958EBC()
{
  return MEMORY[0x24BEE6E10]();
}

uint64_t sub_21D958EC8()
{
  return MEMORY[0x24BEE2AE0]();
}

uint64_t sub_21D958ED4()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_21D958EE0()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_21D958EEC()
{
  return MEMORY[0x24BEE7110]();
}

uint64_t sub_21D958EF8()
{
  return MEMORY[0x24BEE7118]();
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

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x24BEE4B38]();
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
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

uint64_t swift_errorRelease()
{
  return MEMORY[0x24BEE4CA0]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x24BEE4CA8]();
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

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x24BEE4E18]();
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

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x24BEE4FC8]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x24BEE4FD0]();
}

