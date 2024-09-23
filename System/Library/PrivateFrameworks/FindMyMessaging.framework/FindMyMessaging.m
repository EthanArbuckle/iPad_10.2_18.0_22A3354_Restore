uint64_t QueryController.serviceName.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 120);
  swift_bridgeObjectRetain();
  return v1;
}

_QWORD *QueryController.__allocating_init(serviceName:)(uint64_t a1, uint64_t a2)
{
  _QWORD *v4;
  _QWORD *result;

  v4 = (_QWORD *)swift_allocObject();
  swift_defaultActor_initialize();
  result = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
  if (result)
  {
    v4[14] = result;
    v4[15] = a1;
    v4[16] = a2;
    return v4;
  }
  else
  {
    __break(1u);
  }
  return result;
}

_QWORD *QueryController.init(serviceName:)(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _QWORD *result;

  swift_defaultActor_initialize();
  result = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
  if (result)
  {
    v2[14] = result;
    v2[15] = a1;
    v2[16] = a2;
    return v2;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_23B917E94(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  *(_BYTE *)(v2 + 57) = *(_BYTE *)a1;
  v3 = *(_QWORD *)(a1 + 8);
  v4 = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(v2 + 16) = v1;
  *(_QWORD *)(v2 + 24) = v3;
  *(_QWORD *)(v2 + 32) = v4;
  return swift_task_switch();
}

uint64_t sub_23B917EBC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v4 = *(_QWORD *)(v2 + 24);
  v3 = *(_QWORD *)(v2 + 32);
  v5 = *(_BYTE *)(v2 + 57);
  v6 = *(_QWORD *)(v2 + 16);
  sub_23B91B21C((unint64_t *)&unk_256A55458, a2, (uint64_t (*)(uint64_t))type metadata accessor for QueryController, (uint64_t)&protocol conformance descriptor for QueryController);
  v7 = swift_task_alloc();
  *(_QWORD *)(v2 + 40) = v7;
  *(_QWORD *)(v7 + 16) = v6;
  *(_BYTE *)(v7 + 24) = v5;
  *(_QWORD *)(v7 + 32) = v4;
  *(_QWORD *)(v7 + 40) = v3;
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 48) = v8;
  *v8 = v2;
  v8[1] = sub_23B917FA4;
  return sub_23B958808();
}

uint64_t sub_23B917FA4()
{
  swift_task_dealloc();
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23B918004()
{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(unsigned __int8 *)(v0 + 56));
}

uint64_t type metadata accessor for QueryController()
{
  return objc_opt_self();
}

void sub_23B918030(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  int v28;
  id v29;
  _QWORD aBlock[6];

  v23 = a4;
  v28 = a3;
  v25 = a1;
  v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A554E8);
  v7 = *(_QWORD *)(v24 - 8);
  v8 = *(_QWORD *)(v7 + 64);
  MEMORY[0x24BDAC7A8]();
  v9 = sub_23B958328();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8]();
  v12 = (char *)&v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v29 = *(id *)(a2 + 112);
  swift_bridgeObjectRetain();
  v27 = sub_23B9583D0();
  swift_bridgeObjectRelease();
  v26 = sub_23B9583D0();
  v13 = (void *)sub_23B9583D0();
  sub_23B91B1C0();
  (*(void (**)(char *, _QWORD, uint64_t))(v10 + 104))(v12, *MEMORY[0x24BEE5490], v9);
  v14 = (void *)sub_23B958574();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  v15 = swift_allocObject();
  swift_weakInit();
  v16 = v24;
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v25, v24);
  v17 = (*(unsigned __int8 *)(v7 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  v18 = swift_allocObject();
  *(_QWORD *)(v18 + 16) = v15;
  *(_BYTE *)(v18 + 24) = v28;
  *(_QWORD *)(v18 + 32) = v23;
  *(_QWORD *)(v18 + 40) = a5;
  (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v18 + v17, (char *)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v16);
  aBlock[4] = sub_23B91B3C0;
  aBlock[5] = v18;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_23B9186D8;
  aBlock[3] = &block_descriptor_27;
  v19 = _Block_copy(aBlock);
  swift_bridgeObjectRetain();
  swift_release();
  v21 = (void *)v26;
  v20 = (void *)v27;
  objc_msgSend(v29, sel_currentIDStatusForDestination_service_listenerID_queue_completionBlock_, v27, v26, v13, v14, v19);
  _Block_release(v19);

}

void sub_23B9182A8(uint64_t a1)
{
  uint64_t v1;

  sub_23B918030(a1, *(_QWORD *)(v1 + 16), *(unsigned __int8 *)(v1 + 24), *(_QWORD *)(v1 + 32), *(_QWORD *)(v1 + 40));
}

void sub_23B9182B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t Strong;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  os_log_type_t v19;
  uint8_t *v20;
  uint64_t v21;
  NSObject *v22;
  os_log_type_t v23;
  uint8_t *v24;
  void *v25;
  void *v26;
  void *v27;
  char *v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  void *v32;
  id v33;
  void *v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  _QWORD aBlock[6];

  v38 = a4;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A554E8);
  v9 = *(_QWORD *)(v8 - 8);
  v10 = *(_QWORD *)(v9 + 64);
  MEMORY[0x24BDAC7A8]();
  v39 = (char *)&v35 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_23B958328();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8]();
  v14 = (char *)&v35 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  Strong = swift_weakLoadStrong();
  if (Strong)
  {
    v16 = Strong;
    if (a1)
    {
      if (qword_256A55430 != -1)
        swift_once();
      v17 = sub_23B95831C();
      __swift_project_value_buffer(v17, (uint64_t)qword_256A55CC0);
      v18 = sub_23B958304();
      v19 = sub_23B958568();
      if (os_log_type_enabled(v18, v19))
      {
        v20 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v20 = 0;
        _os_log_impl(&dword_23B916000, v18, v19, "FindMyMessaging: lookup status is valid, no need to refresh", v20, 2u);
        MEMORY[0x242609864](v20, -1, -1);
      }

      LOBYTE(aBlock[0]) = a1 == 1;
      sub_23B9584CC();
      swift_release();
    }
    else
    {
      v36 = a6;
      if (qword_256A55430 != -1)
        swift_once();
      v37 = v8;
      v21 = sub_23B95831C();
      __swift_project_value_buffer(v21, (uint64_t)qword_256A55CC0);
      v22 = sub_23B958304();
      v23 = sub_23B958568();
      if (os_log_type_enabled(v22, v23))
      {
        v24 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v24 = 0;
        _os_log_impl(&dword_23B916000, v22, v23, "FindMyMessaging: lookup status is unknown, refreshing", v24, 2u);
        MEMORY[0x242609864](v24, -1, -1);
      }

      v35 = *(id *)(v16 + 112);
      swift_bridgeObjectRetain();
      v38 = sub_23B9583D0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
      v25 = (void *)sub_23B9583D0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
      v26 = (void *)sub_23B9583D0();
      swift_bridgeObjectRelease();
      sub_23B91B1C0();
      (*(void (**)(char *, _QWORD, uint64_t))(v12 + 104))(v14, *MEMORY[0x24BEE5490], v11);
      v27 = (void *)sub_23B958574();
      (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
      v28 = v39;
      v29 = v37;
      (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v39, v36, v37);
      v30 = (*(unsigned __int8 *)(v9 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
      v31 = swift_allocObject();
      (*(void (**)(unint64_t, char *, uint64_t))(v9 + 32))(v31 + v30, v28, v29);
      aBlock[4] = sub_23B91B470;
      aBlock[5] = v31;
      aBlock[0] = MEMORY[0x24BDAC760];
      aBlock[1] = 1107296256;
      aBlock[2] = sub_23B9186D8;
      aBlock[3] = &block_descriptor_33;
      v32 = _Block_copy(aBlock);
      swift_release();
      v33 = v35;
      v34 = (void *)v38;
      objc_msgSend(v35, sel_refreshIDStatusForDestination_service_listenerID_queue_completionBlock_, v38, v25, v26, v27, v32);
      swift_release();
      _Block_release(v32);

    }
  }
}

uint64_t sub_23B9186D8(uint64_t a1, uint64_t a2)
{
  void (*v3)(uint64_t);

  v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);
  return swift_release();
}

uint64_t sub_23B918714(uint64_t a1, _BYTE *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  *(_BYTE *)(v3 + 136) = *(_BYTE *)a1;
  v4 = *(_QWORD *)(a1 + 8);
  v5 = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(v3 + 80) = v2;
  *(_QWORD *)(v3 + 88) = v4;
  *(_QWORD *)(v3 + 96) = v5;
  *(_BYTE *)(v3 + 137) = *a2;
  return swift_task_switch();
}

uint64_t sub_23B918744()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char v3;
  uint64_t v4;
  uint64_t inited;
  uint64_t v6;
  _QWORD *v7;

  v2 = *(_QWORD *)(v0 + 88);
  v1 = *(_QWORD *)(v0 + 96);
  v3 = *(_BYTE *)(v0 + 136);
  v4 = *(_QWORD *)(v0 + 80);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256A55468);
  inited = swift_initStackObject();
  *(_QWORD *)(v0 + 104) = inited;
  *(_OWORD *)(inited + 16) = xmmword_23B958EB0;
  *(_BYTE *)(inited + 32) = v3;
  *(_QWORD *)(inited + 40) = v2;
  *(_QWORD *)(inited + 48) = v1;
  swift_bridgeObjectRetain();
  v6 = swift_task_alloc();
  *(_QWORD *)(v0 + 112) = v6;
  *(_QWORD *)(v6 + 16) = inited;
  *(_QWORD *)(v6 + 24) = v4;
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 120) = v7;
  __swift_instantiateConcreteTypeFromMangledName(qword_256A55470);
  *v7 = v0;
  v7[1] = sub_23B918838;
  return sub_23B95819C();
}

uint64_t sub_23B918838()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 128) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23B9188AC()
{
  uint64_t v0;
  char v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  int64_t v6;
  unint64_t v7;
  unint64_t v8;
  int64_t v9;
  unint64_t v10;
  int64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  id v17;
  uint64_t v19;
  int64_t v20;
  uint64_t v21;
  int64_t v22;

  v1 = *(_BYTE *)(v0 + 137);
  swift_setDeallocating();
  swift_arrayDestroy();
  v2 = *(_QWORD *)(v0 + 72);
  *(_BYTE *)(swift_task_alloc() + 16) = v1;
  v19 = v2 + 64;
  v3 = -1;
  v4 = -1 << *(_BYTE *)(v2 + 32);
  if (-v4 < 64)
    v3 = ~(-1 << -(char)v4);
  v5 = v3 & *(_QWORD *)(v2 + 64);
  v20 = (unint64_t)(63 - v4) >> 6;
  swift_bridgeObjectRetain();
  v6 = 0;
  v21 = v2;
  while (1)
  {
    if (v5)
    {
      v7 = __clz(__rbit64(v5));
      v5 &= v5 - 1;
      v22 = v6;
      v8 = v7 | (v6 << 6);
      goto LABEL_22;
    }
    v9 = v6 + 1;
    if (__OFADD__(v6, 1))
    {
      __break(1u);
      goto LABEL_32;
    }
    if (v9 >= v20)
      goto LABEL_30;
    v10 = *(_QWORD *)(v19 + 8 * v9);
    v11 = v6 + 1;
    if (!v10)
    {
      v11 = v6 + 2;
      if (v6 + 2 >= v20)
        goto LABEL_30;
      v10 = *(_QWORD *)(v19 + 8 * v11);
      if (!v10)
      {
        v11 = v6 + 3;
        if (v6 + 3 >= v20)
          goto LABEL_30;
        v10 = *(_QWORD *)(v19 + 8 * v11);
        if (!v10)
        {
          v11 = v6 + 4;
          if (v6 + 4 >= v20)
            goto LABEL_30;
          v10 = *(_QWORD *)(v19 + 8 * v11);
          if (!v10)
            break;
        }
      }
    }
LABEL_21:
    v5 = (v10 - 1) & v10;
    v22 = v11;
    v8 = __clz(__rbit64(v10)) + (v11 << 6);
LABEL_22:
    v13 = *(_QWORD *)(*(_QWORD *)(v2 + 56) + 8 * v8);
    if (v13 >> 62)
    {
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain();
      if (sub_23B958730())
      {
LABEL_24:
        if ((v13 & 0xC000000000000001) != 0)
          v15 = (id)MEMORY[0x2426091BC](0, v13);
        else
          v15 = *(id *)(v13 + 32);
        v16 = *(unsigned __int8 *)(v0 + 137);
        v17 = objc_msgSend(v15, sel_capabilities);
        __asm { BR              X8 }
      }
    }
    else
    {
      v14 = *(_QWORD *)((v13 & 0xFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain();
      if (v14)
        goto LABEL_24;
    }
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    v2 = v21;
    v6 = v22;
  }
  v12 = v6 + 5;
  if (v6 + 5 < v20)
  {
    v10 = *(_QWORD *)(v19 + 8 * v12);
    v11 = v6 + 5;
    if (!v10)
    {
      while (1)
      {
        v11 = v12 + 1;
        if (__OFADD__(v12, 1))
          break;
        if (v11 >= v20)
          goto LABEL_30;
        v10 = *(_QWORD *)(v19 + 8 * v11);
        ++v12;
        if (v10)
          goto LABEL_21;
      }
LABEL_32:
      __break(1u);
      JUMPOUT(0x23B918CACLL);
    }
    goto LABEL_21;
  }
LABEL_30:
  swift_release();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(0);
}

uint64_t sub_23B918CC4()
{
  uint64_t v0;

  swift_task_dealloc();
  swift_setDeallocating();
  swift_arrayDestroy();
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(0);
}

uint64_t sub_23B918D1C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  *(_QWORD *)(v4 + 80) = a2;
  *(_QWORD *)(v4 + 88) = a3;
  *(_BYTE *)(v4 + 152) = *(_BYTE *)a1;
  v5 = *(_QWORD *)(a1 + 8);
  v6 = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(v4 + 96) = v3;
  *(_QWORD *)(v4 + 104) = v5;
  *(_QWORD *)(v4 + 112) = v6;
  return swift_task_switch();
}

uint64_t sub_23B918D48()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char v3;
  uint64_t v4;
  uint64_t inited;
  uint64_t v6;
  _QWORD *v7;

  v2 = *(_QWORD *)(v0 + 104);
  v1 = *(_QWORD *)(v0 + 112);
  v3 = *(_BYTE *)(v0 + 152);
  v4 = *(_QWORD *)(v0 + 96);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256A55468);
  inited = swift_initStackObject();
  *(_QWORD *)(v0 + 120) = inited;
  *(_OWORD *)(inited + 16) = xmmword_23B958EB0;
  *(_BYTE *)(inited + 32) = v3;
  *(_QWORD *)(inited + 40) = v2;
  *(_QWORD *)(inited + 48) = v1;
  swift_bridgeObjectRetain();
  v6 = swift_task_alloc();
  *(_QWORD *)(v0 + 128) = v6;
  *(_QWORD *)(v6 + 16) = inited;
  *(_QWORD *)(v6 + 24) = v4;
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 136) = v7;
  __swift_instantiateConcreteTypeFromMangledName(qword_256A55470);
  *v7 = v0;
  v7[1] = sub_23B918E3C;
  return sub_23B95819C();
}

uint64_t sub_23B918E3C()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 144) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23B918EB0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;

  v2 = *(_QWORD *)(v0 + 80);
  v1 = *(_QWORD *)(v0 + 88);
  swift_setDeallocating();
  swift_arrayDestroy();
  v3 = *(_QWORD *)(v0 + 72);
  v4 = swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v2;
  *(_QWORD *)(v4 + 24) = v1;
  v5 = sub_23B91AA1C(v3, (uint64_t (*)(_BYTE *, uint64_t))sub_23B91AC48);
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(v5 & 1);
}

uint64_t sub_23B918F58()
{
  uint64_t v0;

  swift_task_dealloc();
  swift_setDeallocating();
  swift_arrayDestroy();
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(0);
}

BOOL sub_23B918FB0(uint64_t a1, unint64_t a2)
{
  BOOL v3;

  swift_bridgeObjectRetain();
  v3 = sub_23B91B024(a2);
  swift_bridgeObjectRelease();
  return v3;
}

uint64_t sub_23B919010(uint64_t a1, _BYTE *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  *(_BYTE *)(v3 + 153) = *(_BYTE *)a1;
  v4 = *(_QWORD *)(a1 + 8);
  v5 = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(v3 + 80) = v2;
  *(_QWORD *)(v3 + 88) = v4;
  *(_QWORD *)(v3 + 96) = v5;
  *(_BYTE *)(v3 + 154) = *a2;
  return swift_task_switch();
}

uint64_t sub_23B919040(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v4 = *(_QWORD *)(v2 + 88);
  v3 = *(_QWORD *)(v2 + 96);
  v5 = *(_BYTE *)(v2 + 153);
  v6 = *(_QWORD *)(v2 + 80);
  sub_23B91B21C((unint64_t *)&unk_256A55458, a2, (uint64_t (*)(uint64_t))type metadata accessor for QueryController, (uint64_t)&protocol conformance descriptor for QueryController);
  v7 = swift_task_alloc();
  *(_QWORD *)(v2 + 104) = v7;
  *(_QWORD *)(v7 + 16) = v6;
  *(_BYTE *)(v7 + 24) = v5;
  *(_QWORD *)(v7 + 32) = v4;
  *(_QWORD *)(v7 + 40) = v3;
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 112) = v8;
  *v8 = v2;
  v8[1] = sub_23B919128;
  return sub_23B958808();
}

uint64_t sub_23B919128()
{
  swift_task_dealloc();
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23B919188()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char v3;
  uint64_t v4;
  uint64_t inited;
  uint64_t v6;
  _QWORD *v7;
  _BYTE *v9;

  if (*(_BYTE *)(v0 + 152) == 1)
  {
    v2 = *(_QWORD *)(v0 + 88);
    v1 = *(_QWORD *)(v0 + 96);
    v3 = *(_BYTE *)(v0 + 153);
    v4 = *(_QWORD *)(v0 + 80);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256A55468);
    inited = swift_initStackObject();
    *(_QWORD *)(v0 + 120) = inited;
    *(_OWORD *)(inited + 16) = xmmword_23B958EB0;
    *(_BYTE *)(inited + 32) = v3;
    *(_QWORD *)(inited + 40) = v2;
    *(_QWORD *)(inited + 48) = v1;
    swift_bridgeObjectRetain();
    v6 = swift_task_alloc();
    *(_QWORD *)(v0 + 128) = v6;
    *(_QWORD *)(v6 + 16) = inited;
    *(_QWORD *)(v6 + 24) = v4;
    v7 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 136) = v7;
    __swift_instantiateConcreteTypeFromMangledName(qword_256A55470);
    *v7 = v0;
    v7[1] = sub_23B9192E4;
    return sub_23B95819C();
  }
  else
  {
    sub_23B91AC50();
    swift_allocError();
    *v9 = 3;
    swift_willThrow();
    return (*(uint64_t (**)(_QWORD))(v0 + 8))(0);
  }
}

uint64_t sub_23B9192E4()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 144) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23B919358()
{
  uint64_t v0;
  char v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  int64_t v6;
  unint64_t v7;
  unint64_t v8;
  int64_t v9;
  unint64_t v10;
  int64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  id v17;
  uint64_t v19;
  int64_t v20;
  uint64_t v21;
  int64_t v22;

  v1 = *(_BYTE *)(v0 + 154);
  swift_setDeallocating();
  swift_arrayDestroy();
  v2 = *(_QWORD *)(v0 + 72);
  *(_BYTE *)(swift_task_alloc() + 16) = v1;
  v19 = v2 + 64;
  v3 = -1;
  v4 = -1 << *(_BYTE *)(v2 + 32);
  if (-v4 < 64)
    v3 = ~(-1 << -(char)v4);
  v5 = v3 & *(_QWORD *)(v2 + 64);
  v20 = (unint64_t)(63 - v4) >> 6;
  swift_bridgeObjectRetain();
  v6 = 0;
  v21 = v2;
  while (1)
  {
    if (v5)
    {
      v7 = __clz(__rbit64(v5));
      v5 &= v5 - 1;
      v22 = v6;
      v8 = v7 | (v6 << 6);
      goto LABEL_22;
    }
    v9 = v6 + 1;
    if (__OFADD__(v6, 1))
    {
      __break(1u);
      goto LABEL_32;
    }
    if (v9 >= v20)
      goto LABEL_30;
    v10 = *(_QWORD *)(v19 + 8 * v9);
    v11 = v6 + 1;
    if (!v10)
    {
      v11 = v6 + 2;
      if (v6 + 2 >= v20)
        goto LABEL_30;
      v10 = *(_QWORD *)(v19 + 8 * v11);
      if (!v10)
      {
        v11 = v6 + 3;
        if (v6 + 3 >= v20)
          goto LABEL_30;
        v10 = *(_QWORD *)(v19 + 8 * v11);
        if (!v10)
        {
          v11 = v6 + 4;
          if (v6 + 4 >= v20)
            goto LABEL_30;
          v10 = *(_QWORD *)(v19 + 8 * v11);
          if (!v10)
            break;
        }
      }
    }
LABEL_21:
    v5 = (v10 - 1) & v10;
    v22 = v11;
    v8 = __clz(__rbit64(v10)) + (v11 << 6);
LABEL_22:
    v13 = *(_QWORD *)(*(_QWORD *)(v2 + 56) + 8 * v8);
    if (v13 >> 62)
    {
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain();
      if (sub_23B958730())
      {
LABEL_24:
        if ((v13 & 0xC000000000000001) != 0)
          v15 = (id)MEMORY[0x2426091BC](0, v13);
        else
          v15 = *(id *)(v13 + 32);
        v16 = *(unsigned __int8 *)(v0 + 154);
        v17 = objc_msgSend(v15, sel_capabilities);
        __asm { BR              X8 }
      }
    }
    else
    {
      v14 = *(_QWORD *)((v13 & 0xFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain();
      if (v14)
        goto LABEL_24;
    }
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    v2 = v21;
    v6 = v22;
  }
  v12 = v6 + 5;
  if (v6 + 5 < v20)
  {
    v10 = *(_QWORD *)(v19 + 8 * v12);
    v11 = v6 + 5;
    if (!v10)
    {
      while (1)
      {
        v11 = v12 + 1;
        if (__OFADD__(v12, 1))
          break;
        if (v11 >= v20)
          goto LABEL_30;
        v10 = *(_QWORD *)(v19 + 8 * v11);
        ++v12;
        if (v10)
          goto LABEL_21;
      }
LABEL_32:
      __break(1u);
      JUMPOUT(0x23B919758);
    }
    goto LABEL_21;
  }
LABEL_30:
  swift_release();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(0);
}

uint64_t sub_23B919770()
{
  uint64_t v0;

  swift_task_dealloc();
  swift_setDeallocating();
  swift_arrayDestroy();
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(0);
}

uint64_t sub_23B9197C8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  *(_BYTE *)(v2 + 136) = *(_BYTE *)a1;
  v3 = *(_QWORD *)(a1 + 8);
  v4 = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(v2 + 80) = v1;
  *(_QWORD *)(v2 + 88) = v3;
  *(_QWORD *)(v2 + 96) = v4;
  return swift_task_switch();
}

uint64_t sub_23B9197F0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char v3;
  uint64_t v4;
  uint64_t inited;
  uint64_t v6;
  _QWORD *v7;

  v2 = *(_QWORD *)(v0 + 88);
  v1 = *(_QWORD *)(v0 + 96);
  v3 = *(_BYTE *)(v0 + 136);
  v4 = *(_QWORD *)(v0 + 80);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256A55468);
  inited = swift_initStackObject();
  *(_QWORD *)(v0 + 104) = inited;
  *(_OWORD *)(inited + 16) = xmmword_23B958EB0;
  *(_BYTE *)(inited + 32) = v3;
  *(_QWORD *)(inited + 40) = v2;
  *(_QWORD *)(inited + 48) = v1;
  swift_bridgeObjectRetain();
  v6 = swift_task_alloc();
  *(_QWORD *)(v0 + 112) = v6;
  *(_QWORD *)(v6 + 16) = inited;
  *(_QWORD *)(v6 + 24) = v4;
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 120) = v7;
  __swift_instantiateConcreteTypeFromMangledName(qword_256A55470);
  *v7 = v0;
  v7[1] = sub_23B9198E4;
  return sub_23B95819C();
}

uint64_t sub_23B9198E4()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 128) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23B919958()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t result;
  uint64_t v3;
  id v4;
  void *v5;
  id v6;
  uint64_t v7;

  swift_setDeallocating();
  swift_arrayDestroy();
  v1 = sub_23B919AF8(*(_QWORD *)(v0 + 72));
  result = swift_bridgeObjectRelease();
  if (!v1)
  {
    v3 = 0;
    return (*(uint64_t (**)(unint64_t, uint64_t))(v0 + 8))(v1, v3);
  }
  if (!(v1 >> 62))
  {
    v3 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v3)
      goto LABEL_4;
    goto LABEL_12;
  }
  swift_bridgeObjectRetain();
  v3 = sub_23B958730();
  result = swift_bridgeObjectRelease();
  if (!v3)
  {
LABEL_12:
    swift_bridgeObjectRelease();
    v1 = 0;
    return (*(uint64_t (**)(unint64_t, uint64_t))(v0 + 8))(v1, v3);
  }
LABEL_4:
  if ((v1 & 0xC000000000000001) != 0)
  {
    v4 = (id)MEMORY[0x2426091BC](0, v1);
LABEL_7:
    v5 = v4;
    swift_bridgeObjectRelease();
    v6 = objc_msgSend(v5, sel_senderCorrelationIdentifier);

    if (v6)
    {
      v1 = sub_23B9583DC();
      v3 = v7;

    }
    else
    {
      v1 = 0;
      v3 = 0;
    }
    return (*(uint64_t (**)(unint64_t, uint64_t))(v0 + 8))(v1, v3);
  }
  if (*(_QWORD *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    v4 = *(id *)(v1 + 32);
    goto LABEL_7;
  }
  __break(1u);
  return result;
}

uint64_t sub_23B919AA4()
{
  uint64_t v0;

  swift_task_dealloc();
  swift_setDeallocating();
  swift_arrayDestroy();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23B919AF8(uint64_t a1)
{
  uint64_t result;
  int v3;
  char v4;

  result = sub_23B91A994(a1);
  if ((v4 & 1) != 0)
    goto LABEL_7;
  if (*(_DWORD *)(a1 + 36) != v3)
  {
    __break(1u);
LABEL_7:
    __break(1u);
    return result;
  }
  if (result == 1 << *(_BYTE *)(a1 + 32))
    return 0;
  sub_23B91B16C(result, v3, 0, a1);
  return swift_bridgeObjectRetain();
}

uint64_t QueryController.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_defaultActor_destroy();
  return v0;
}

uint64_t QueryController.__deallocating_deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_defaultActor_destroy();
  return swift_defaultActor_deallocate();
}

uint64_t QueryController.unownedExecutor.getter()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_23B919BC0()
{
  uint64_t v0;

  return v0;
}

void sub_23B919BCC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  int64_t v9;
  uint64_t v10;
  uint64_t (**v11)(uint64_t, uint64_t);
  unint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  Swift::String v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t aBlock;
  unint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void *v38;
  void (*v39)(uint64_t);
  uint64_t v40;
  uint64_t v41;

  v34 = a1;
  v5 = sub_23B958328();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8]();
  v8 = (char *)&v30 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *(_QWORD *)(a2 + 16);
  v10 = MEMORY[0x24BEE4AF8];
  if (!v9)
  {
LABEL_12:
    v24 = *(void **)(a3 + 112);
    sub_23B91B4FC(v10);
    swift_bridgeObjectRelease();
    v25 = (void *)sub_23B958478();
    swift_bridgeObjectRelease();
    v26 = (void *)sub_23B9583D0();
    v27 = (void *)sub_23B9583D0();
    sub_23B91B1C0();
    (*(void (**)(char *, _QWORD, uint64_t))(v6 + 104))(v8, *MEMORY[0x24BEE5490], v5);
    v28 = (void *)sub_23B958574();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    v39 = sub_23B91B1FC;
    v40 = v34;
    aBlock = MEMORY[0x24BDAC760];
    v36 = 1107296256;
    v37 = sub_23B91A7C4;
    v38 = &block_descriptor;
    v29 = _Block_copy(&aBlock);
    swift_retain();
    swift_release();
    objc_msgSend(v24, sel_currentRemoteDevicesForDestinations_service_listenerID_queue_completionBlock_, v25, v26, v27, v28, v29);
    _Block_release(v29);

    return;
  }
  v31 = a3;
  v32 = v6;
  v33 = v5;
  v41 = MEMORY[0x24BEE4AF8];
  sub_23B928E3C(0, v9, 0);
  v10 = v41;
  v11 = (uint64_t (**)(uint64_t, uint64_t))(a2 + 48);
  while (1)
  {
    v12 = (unint64_t)*(v11 - 1);
    v13 = *v11;
    if ((*(_BYTE *)(v11 - 2) & 0xFE) != 2)
    {
      swift_bridgeObjectRetain();
      goto LABEL_8;
    }
    swift_bridgeObjectRetain();
    v14 = (void *)sub_23B9583D0();
    v15 = objc_msgSend(v14, sel__stripPotentialTokenURIWithToken_, 0);

    if (!v15)
      break;
    v16 = sub_23B9583DC();
    v18 = v17;

    v19._countAndFlagsBits = v16;
    v19._object = v18;
    Destination.init(stringRepresentation:)(v19);
    v20 = v37;
    if (!v37)
      goto LABEL_14;
    v12 = v36;
    swift_bridgeObjectRelease();
    v13 = v20;
LABEL_8:
    v41 = v10;
    v22 = *(_QWORD *)(v10 + 16);
    v21 = *(_QWORD *)(v10 + 24);
    if (v22 >= v21 >> 1)
    {
      sub_23B928E3C(v21 > 1, v22 + 1, 1);
      v10 = v41;
    }
    v11 += 3;
    *(_QWORD *)(v10 + 16) = v22 + 1;
    v23 = v10 + 16 * v22;
    *(_QWORD *)(v23 + 32) = v12;
    *(_QWORD *)(v23 + 40) = v13;
    if (!--v9)
    {
      v6 = v32;
      v5 = v33;
      a3 = v31;
      goto LABEL_12;
    }
  }
  __break(1u);
LABEL_14:
  aBlock = 0;
  v36 = 0xE000000000000000;
  swift_bridgeObjectRetain();
  sub_23B958688();
  swift_bridgeObjectRelease();
  aBlock = 0xD000000000000012;
  v36 = 0x800000023B95A2D0;
  swift_bridgeObjectRetain();
  sub_23B958400();
  swift_bridgeObjectRelease();
  sub_23B958400();
  sub_23B958724();
  __break(1u);
}

void sub_23B919F64(uint64_t a1)
{
  unint64_t v1;
  unint64_t v2;
  int64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  int64_t v8;
  _QWORD *v9;
  uint64_t v10;
  int64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t i;
  unint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unsigned __int8 v20;
  _QWORD *v21;
  char isUniquelyReferenced_nonNull_native;
  unsigned __int8 v23;
  char v24;
  unint64_t v25;
  uint64_t v26;
  _BOOL8 v27;
  uint64_t v28;
  char v29;
  unint64_t v30;
  char v31;
  _QWORD *v32;
  uint64_t v33;
  uint64_t v34;
  BOOL v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  _QWORD *v39;
  unint64_t v40;
  int64_t v41;
  unint64_t v42;
  _QWORD *v43;

  if (!a1 || (v1 = sub_23B91A400(a1)) == 0)
  {
    v37 = sub_23B95816C();
    sub_23B91B21C(&qword_256A554C8, 255, (uint64_t (*)(uint64_t))MEMORY[0x24BE31808], MEMORY[0x24BE31810]);
    v38 = (void *)swift_allocError();
    *v39 = 0xD000000000000029;
    v39[1] = 0x800000023B95A310;
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v37 - 8) + 104))(v39, *MEMORY[0x24BE31800], v37);
    sub_23B958178();

    return;
  }
  v2 = v1;
  v3 = 0;
  v4 = v1 + 64;
  v5 = 1 << *(_BYTE *)(v1 + 32);
  v6 = -1;
  if (v5 < 64)
    v6 = ~(-1 << v5);
  v7 = v6 & *(_QWORD *)(v1 + 64);
  v8 = (unint64_t)(v5 + 63) >> 6;
  v9 = (_QWORD *)MEMORY[0x24BEE4B00];
  v41 = v8;
  v42 = v1 + 64;
  v40 = v1;
  if (v7)
    goto LABEL_23;
LABEL_9:
  while (2)
  {
    v11 = v3 + 1;
    if (!__OFADD__(v3, 1))
    {
      if (v11 < v8)
      {
        v12 = *(_QWORD *)(v4 + 8 * v11);
        ++v3;
        if (v12)
          goto LABEL_22;
        v3 = v11 + 1;
        if (v11 + 1 >= v8)
          goto LABEL_50;
        v12 = *(_QWORD *)(v4 + 8 * v3);
        if (v12)
          goto LABEL_22;
        v3 = v11 + 2;
        if (v11 + 2 >= v8)
          goto LABEL_50;
        v12 = *(_QWORD *)(v4 + 8 * v3);
        if (v12)
        {
LABEL_22:
          v7 = (v12 - 1) & v12;
          for (i = __clz(__rbit64(v12)) + (v3 << 6); ; i = v15 | (v3 << 6))
          {
            v16 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * i);
            v18 = *v16;
            v17 = v16[1];
            v19 = *(_QWORD *)(*(_QWORD *)(v2 + 56) + 8 * i);
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            if ((sub_23B958418() & 1) != 0)
            {
              v20 = 0;
              goto LABEL_38;
            }
            if ((sub_23B958418() & 1) != 0)
            {
              v20 = 1;
              goto LABEL_38;
            }
            if ((sub_23B958418() & 1) != 0)
            {
              v20 = 2;
              goto LABEL_38;
            }
            if ((sub_23B958418() & 1) != 0)
            {
              v20 = 3;
              goto LABEL_38;
            }
            if ((sub_23B958418() & 1) != 0)
            {
              v20 = 4;
              goto LABEL_38;
            }
            if ((sub_23B958418() & 1) != 0)
              break;
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            if (!v7)
              goto LABEL_9;
LABEL_23:
            v15 = __clz(__rbit64(v7));
            v7 &= v7 - 1;
          }
          v20 = 5;
LABEL_38:
          v21 = v9;
          isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
          v43 = v9;
          v23 = v20;
          v25 = sub_23B93350C(v20, v18, v17);
          v26 = v9[2];
          v27 = (v24 & 1) == 0;
          v28 = v26 + v27;
          if (__OFADD__(v26, v27))
            goto LABEL_52;
          v29 = v24;
          if (v21[3] < v28)
          {
            sub_23B9537B4(v28, isUniquelyReferenced_nonNull_native);
            v30 = sub_23B93350C(v23, v18, v17);
            if ((v29 & 1) != (v31 & 1))
              goto LABEL_55;
            v25 = v30;
            v32 = v43;
            if ((v29 & 1) == 0)
              goto LABEL_45;
LABEL_7:
            v9 = v32;
            v10 = v32[7];
            swift_bridgeObjectRelease();
            *(_QWORD *)(v10 + 8 * v25) = v19;
LABEL_8:
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            v8 = v41;
            v4 = v42;
            v2 = v40;
            if (!v7)
              continue;
            goto LABEL_23;
          }
          if ((isUniquelyReferenced_nonNull_native & 1) != 0)
          {
            v32 = v43;
            if ((v24 & 1) != 0)
              goto LABEL_7;
          }
          else
          {
            sub_23B954B40();
            v32 = v43;
            if ((v29 & 1) != 0)
              goto LABEL_7;
          }
LABEL_45:
          v32[(v25 >> 6) + 8] |= 1 << v25;
          v33 = v32[6] + 24 * v25;
          *(_BYTE *)v33 = v23;
          *(_QWORD *)(v33 + 8) = v18;
          *(_QWORD *)(v33 + 16) = v17;
          *(_QWORD *)(v32[7] + 8 * v25) = v19;
          v34 = v32[2];
          v35 = __OFADD__(v34, 1);
          v36 = v34 + 1;
          if (v35)
            goto LABEL_54;
          v9 = v32;
          v32[2] = v36;
          swift_bridgeObjectRetain();
          goto LABEL_8;
        }
        v13 = v11 + 3;
        if (v13 < v8)
        {
          v12 = *(_QWORD *)(v4 + 8 * v13);
          if (v12)
          {
            v3 = v13;
            goto LABEL_22;
          }
          while (1)
          {
            v3 = v13 + 1;
            if (__OFADD__(v13, 1))
              goto LABEL_53;
            if (v3 >= v8)
              break;
            v12 = *(_QWORD *)(v4 + 8 * v3);
            ++v13;
            if (v12)
              goto LABEL_22;
          }
        }
      }
LABEL_50:
      swift_release();
      sub_23B958184();
      swift_bridgeObjectRelease();
      return;
    }
    break;
  }
  __break(1u);
LABEL_52:
  __break(1u);
LABEL_53:
  __break(1u);
LABEL_54:
  __break(1u);
LABEL_55:
  sub_23B958844();
  __break(1u);
}

unint64_t sub_23B91A400(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  char *v6;
  char *v7;
  unint64_t result;
  int64_t v9;
  char *v10;
  char *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  int64_t v16;
  int64_t v17;
  unint64_t v18;
  int64_t v19;
  unint64_t v20;
  char v21;
  uint64_t *v22;
  uint64_t v23;
  BOOL v24;
  uint64_t v25;
  uint64_t v26;
  int64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _BYTE v31[40];
  _OWORD v32[2];
  _OWORD v33[2];
  uint64_t v34;
  _OWORD v35[2];
  _OWORD v36[2];
  uint64_t v37;

  v1 = a1;
  if (*(_QWORD *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_256A554D0);
    v2 = (_QWORD *)sub_23B958754();
  }
  else
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
  }
  v28 = v1 + 64;
  v3 = -1;
  v4 = -1 << *(_BYTE *)(v1 + 32);
  if (-v4 < 64)
    v3 = ~(-1 << -(char)v4);
  v5 = v3 & *(_QWORD *)(v1 + 64);
  v27 = (unint64_t)(63 - v4) >> 6;
  v6 = (char *)v36 + 8;
  v7 = (char *)v33 + 8;
  result = swift_bridgeObjectRetain();
  v9 = 0;
  v26 = v1;
  while (1)
  {
    if (v5)
    {
      v14 = (v5 - 1) & v5;
      v15 = __clz(__rbit64(v5)) | (v9 << 6);
      v16 = v9;
    }
    else
    {
      v17 = v9 + 1;
      if (__OFADD__(v9, 1))
        goto LABEL_40;
      if (v17 >= v27)
      {
LABEL_36:
        sub_23B91B314();
        return (unint64_t)v2;
      }
      v18 = *(_QWORD *)(v28 + 8 * v17);
      v16 = v9 + 1;
      if (!v18)
      {
        v16 = v9 + 2;
        if (v9 + 2 >= v27)
          goto LABEL_36;
        v18 = *(_QWORD *)(v28 + 8 * v16);
        if (!v18)
        {
          v16 = v9 + 3;
          if (v9 + 3 >= v27)
            goto LABEL_36;
          v18 = *(_QWORD *)(v28 + 8 * v16);
          if (!v18)
          {
            v16 = v9 + 4;
            if (v9 + 4 >= v27)
              goto LABEL_36;
            v18 = *(_QWORD *)(v28 + 8 * v16);
            if (!v18)
            {
              v19 = v9 + 5;
              if (v9 + 5 >= v27)
                goto LABEL_36;
              v18 = *(_QWORD *)(v28 + 8 * v19);
              if (!v18)
              {
                while (1)
                {
                  v16 = v19 + 1;
                  if (__OFADD__(v19, 1))
                    goto LABEL_41;
                  if (v16 >= v27)
                    goto LABEL_36;
                  v18 = *(_QWORD *)(v28 + 8 * v16);
                  ++v19;
                  if (v18)
                    goto LABEL_26;
                }
              }
              v16 = v9 + 5;
            }
          }
        }
      }
LABEL_26:
      v14 = (v18 - 1) & v18;
      v15 = __clz(__rbit64(v18)) + (v16 << 6);
    }
    sub_23B91B25C(*(_QWORD *)(v1 + 48) + 40 * v15, (uint64_t)v35);
    sub_23B91B298(*(_QWORD *)(v1 + 56) + 32 * v15, (uint64_t)v6);
    v33[0] = v36[0];
    v33[1] = v36[1];
    v34 = v37;
    v32[0] = v35[0];
    v32[1] = v35[1];
    sub_23B91B25C((uint64_t)v32, (uint64_t)v31);
    if (!swift_dynamicCast())
    {
      sub_23B91B2D4((uint64_t)v32);
LABEL_35:
      swift_bridgeObjectRelease();
      sub_23B91B314();
      swift_release();
      return 0;
    }
    sub_23B91B298((uint64_t)v7, (uint64_t)v31);
    sub_23B91B2D4((uint64_t)v32);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256A554E0);
    if ((swift_dynamicCast() & 1) == 0)
    {
      swift_bridgeObjectRelease();
      goto LABEL_35;
    }
    result = sub_23B93358C(v29, v30);
    v20 = result;
    if ((v21 & 1) != 0)
    {
      v10 = v7;
      v11 = v6;
      v12 = (uint64_t *)(v2[6] + 16 * result);
      swift_bridgeObjectRelease();
      *v12 = v29;
      v12[1] = v30;
      v13 = v2[7];
      result = swift_bridgeObjectRelease();
      *(_QWORD *)(v13 + 8 * v20) = v29;
      v6 = v11;
      v7 = v10;
      v1 = v26;
      goto LABEL_8;
    }
    if (v2[2] >= v2[3])
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v22 = (uint64_t *)(v2[6] + 16 * result);
    *v22 = v29;
    v22[1] = v30;
    *(_QWORD *)(v2[7] + 8 * result) = v29;
    v23 = v2[2];
    v24 = __OFADD__(v23, 1);
    v25 = v23 + 1;
    if (v24)
      goto LABEL_39;
    v2[2] = v25;
LABEL_8:
    v9 = v16;
    v5 = v14;
  }
  __break(1u);
LABEL_39:
  __break(1u);
LABEL_40:
  __break(1u);
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_23B91A7C4(uint64_t a1, uint64_t a2)
{
  void (*v2)(uint64_t);
  uint64_t v3;

  v2 = *(void (**)(uint64_t))(a1 + 32);
  if (a2)
    v3 = sub_23B95834C();
  else
    v3 = 0;
  swift_retain();
  v2(v3);
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_23B91A83C()
{
  uint64_t v0;

  v0 = sub_23B95831C();
  __swift_allocate_value_buffer(v0, qword_256A55CC0);
  __swift_project_value_buffer(v0, (uint64_t)qword_256A55CC0);
  return sub_23B958310();
}

uint64_t sub_23B91A8BC(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4 = *v1;
  v5 = swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *(_QWORD *)v5 = v2;
  *(_QWORD *)(v5 + 8) = sub_23B91A930;
  *(_BYTE *)(v5 + 136) = *(_BYTE *)a1;
  v6 = *(_QWORD *)(a1 + 8);
  v7 = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(v5 + 80) = v4;
  *(_QWORD *)(v5 + 88) = v6;
  *(_QWORD *)(v5 + 96) = v7;
  return swift_task_switch();
}

uint64_t sub_23B91A930(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = *v3;
  v7 = swift_task_dealloc();
  if (!v2)
  {
    v7 = a1;
    v8 = a2;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(v7, v8);
}

uint64_t sub_23B91A994(uint64_t a1)
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

uint64_t sub_23B91AA1C(uint64_t a1, uint64_t (*a2)(_BYTE *, uint64_t))
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t result;
  int64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  int64_t v17;
  unint64_t v18;
  int64_t v19;
  _BYTE v20[8];
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int64_t v24;

  v4 = a1 + 64;
  v5 = 1 << *(_BYTE *)(a1 + 32);
  v6 = -1;
  if (v5 < 64)
    v6 = ~(-1 << v5);
  v7 = v6 & *(_QWORD *)(a1 + 64);
  v24 = (unint64_t)(v5 + 63) >> 6;
  result = swift_bridgeObjectRetain();
  v9 = 0;
  while (v7)
  {
    v10 = __clz(__rbit64(v7));
    v7 &= v7 - 1;
    v11 = v10 | (v9 << 6);
LABEL_5:
    v12 = *(_QWORD *)(a1 + 48) + 24 * v11;
    v13 = *(_QWORD *)(v12 + 8);
    v14 = *(_QWORD *)(v12 + 16);
    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8 * v11);
    v20[0] = *(_BYTE *)v12;
    v21 = v13;
    v22 = v14;
    v23 = v15;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v16 = a2(v20, v15);
    swift_bridgeObjectRelease();
    result = swift_bridgeObjectRelease();
    if ((v16 & 1) != 0)
    {
      swift_release();
      return 1;
    }
  }
  v17 = v9 + 1;
  if (__OFADD__(v9, 1))
  {
    __break(1u);
    goto LABEL_25;
  }
  if (v17 >= v24)
    goto LABEL_23;
  v18 = *(_QWORD *)(v4 + 8 * v17);
  ++v9;
  if (v18)
    goto LABEL_21;
  v9 = v17 + 1;
  if (v17 + 1 >= v24)
    goto LABEL_23;
  v18 = *(_QWORD *)(v4 + 8 * v9);
  if (v18)
    goto LABEL_21;
  v9 = v17 + 2;
  if (v17 + 2 >= v24)
    goto LABEL_23;
  v18 = *(_QWORD *)(v4 + 8 * v9);
  if (v18)
    goto LABEL_21;
  v9 = v17 + 3;
  if (v17 + 3 >= v24)
    goto LABEL_23;
  v18 = *(_QWORD *)(v4 + 8 * v9);
  if (v18)
    goto LABEL_21;
  v19 = v17 + 4;
  if (v19 >= v24)
  {
LABEL_23:
    swift_release();
    return 0;
  }
  v18 = *(_QWORD *)(v4 + 8 * v19);
  v9 = v19;
  if (v18)
  {
LABEL_21:
    v7 = (v18 - 1) & v18;
    v11 = __clz(__rbit64(v18)) + (v9 << 6);
    goto LABEL_5;
  }
  while (1)
  {
    v9 = v19 + 1;
    if (__OFADD__(v19, 1))
      break;
    if (v9 >= v24)
      goto LABEL_23;
    v18 = *(_QWORD *)(v4 + 8 * v9);
    ++v19;
    if (v18)
      goto LABEL_21;
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x242609798]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

void sub_23B91AC40(uint64_t a1)
{
  uint64_t v1;

  sub_23B919BCC(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

BOOL sub_23B91AC48(uint64_t a1, unint64_t a2)
{
  return sub_23B918FB0(a1, a2);
}

unint64_t sub_23B91AC50()
{
  unint64_t result;

  result = qword_256A55488;
  if (!qword_256A55488)
  {
    result = MEMORY[0x2426097B0](&unk_23B959ED8, &type metadata for MessagingError);
    atomic_store(result, &qword_256A55488);
  }
  return result;
}

uint64_t method lookup function for QueryController()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of QueryController.__allocating_init(serviceName:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t dispatch thunk of QueryController.isRegistered(destination:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))(**(int **)(*(_QWORD *)v1 + 112) + *(_QWORD *)(*(_QWORD *)v1 + 112));
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_23B91AD0C;
  return v6(a1);
}

uint64_t sub_23B91AD0C(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v4;

  v4 = *v1;
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v4 + 8))(a1);
}

uint64_t dispatch thunk of QueryController.destinationHasCapability(destination:capability:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v6;
  uint64_t (*v8)(uint64_t, uint64_t);

  v8 = (uint64_t (*)(uint64_t, uint64_t))(**(int **)(*(_QWORD *)v2 + 120) + *(_QWORD *)(*(_QWORD *)v2 + 120));
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v6;
  *v6 = v3;
  v6[1] = sub_23B91ADCC;
  return v8(a1, a2);
}

uint64_t sub_23B91ADCC(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v4;

  v4 = *v1;
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v4 + 8))(a1);
}

uint64_t dispatch thunk of QueryController.destinationHasCapability(destination:capability:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD *v8;
  uint64_t (*v10)(uint64_t, uint64_t, uint64_t);

  v10 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(**(int **)(*(_QWORD *)v3 + 128)
                                                          + *(_QWORD *)(*(_QWORD *)v3 + 128));
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v8;
  *v8 = v4;
  v8[1] = sub_23B91B4F8;
  return v10(a1, a2, a3);
}

uint64_t dispatch thunk of QueryController.destinationHasCapabilityWithDataReloadIfRequired(destination:capability:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v6;
  uint64_t (*v8)(uint64_t, uint64_t);

  v8 = (uint64_t (*)(uint64_t, uint64_t))(**(int **)(*(_QWORD *)v2 + 136) + *(_QWORD *)(*(_QWORD *)v2 + 136));
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v6;
  *v6 = v3;
  v6[1] = sub_23B91B4F8;
  return v8(a1, a2);
}

uint64_t dispatch thunk of QueryController.correlationIdentifier(destination:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))(**(int **)(*(_QWORD *)v1 + 144) + *(_QWORD *)(*(_QWORD *)v1 + 144));
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_23B91AF6C;
  return v6(a1);
}

uint64_t sub_23B91AF6C(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v6;

  v6 = *v2;
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(a1, a2);
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

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

BOOL sub_23B91B024(unint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  _BOOL8 v10;

  if (a1 >> 62)
    goto LABEL_15;
  v2 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v2; v2 = sub_23B958730())
  {
    v3 = 4;
    while (1)
    {
      v4 = (a1 & 0xC000000000000001) != 0 ? (id)MEMORY[0x2426091BC](v3 - 4, a1) : *(id *)(a1 + 8 * v3);
      v5 = v4;
      v6 = v3 - 3;
      if (__OFADD__(v3 - 4, 1))
        break;
      v7 = objc_msgSend(v4, sel_capabilities);
      v8 = (void *)sub_23B9583D0();
      v9 = objc_msgSend(v7, sel_valueForCapability_, v8);

      v10 = v9 == (id)1;
      ++v3;
      if (v9 == (id)1 || v6 == v2)
        goto LABEL_17;
    }
    __break(1u);
LABEL_15:
    swift_bridgeObjectRetain();
  }
  v10 = 0;
LABEL_17:
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_23B91B16C(uint64_t result, int a2, uint64_t a3, uint64_t a4)
{
  if (result < 0 || 1 << *(_BYTE *)(a4 + 32) <= result)
  {
    __break(1u);
    goto LABEL_7;
  }
  if (((*(_QWORD *)(a4 + (((unint64_t)result >> 3) & 0xFFFFFFFFFFFFF8) + 64) >> result) & 1) == 0)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  if (*(_DWORD *)(a4 + 36) == a2)
    return *(_QWORD *)(*(_QWORD *)(a4 + 56) + 8 * result);
LABEL_8:
  __break(1u);
  return result;
}

unint64_t sub_23B91B1C0()
{
  unint64_t result;

  result = qword_254309858;
  if (!qword_254309858)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_254309858);
  }
  return result;
}

void sub_23B91B1FC(uint64_t a1)
{
  sub_23B919F64(a1);
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

uint64_t sub_23B91B21C(unint64_t *a1, uint64_t a2, uint64_t (*a3)(uint64_t), uint64_t a4)
{
  uint64_t result;
  uint64_t v7;

  result = *a1;
  if (!result)
  {
    v7 = a3(a2);
    result = MEMORY[0x2426097B0](a4, v7);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_23B91B25C(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(MEMORY[0x24BEE23D0] - 8) + 16))(a2, a1);
  return a2;
}

uint64_t sub_23B91B298(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_23B91B2D4(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A554D8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_23B91B314()
{
  return swift_release();
}

uint64_t sub_23B91B31C()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_23B91B340()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A554E8);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_release();
  swift_bridgeObjectRelease();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  return swift_deallocObject();
}

void sub_23B91B3C0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(unsigned __int8 *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256A554E8) - 8) + 80);
  sub_23B9182B8(a1, *(_QWORD *)(v1 + 16), *(unsigned __int8 *)(v1 + 24), *(_QWORD *)(v1 + 32), *(_QWORD *)(v1 + 40), v1 + ((v3 + 48) & ~v3));
}

uint64_t sub_23B91B40C()
{
  uint64_t v0;
  uint64_t v1;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A554E8);
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)), v1);
  return swift_deallocObject();
}

uint64_t sub_23B91B470()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_256A554E8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256A554E8);
  return sub_23B9584CC();
}

uint64_t sub_23B91B4FC(uint64_t a1)
{
  int64_t v1;
  uint64_t v2;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  __int128 v8;
  uint64_t v9;

  v1 = *(_QWORD *)(a1 + 16);
  v2 = MEMORY[0x24BEE4AF8];
  if (v1)
  {
    v9 = MEMORY[0x24BEE4AF8];
    sub_23B928E20(0, v1, 0);
    v2 = v9;
    v4 = a1 + 40;
    do
    {
      swift_bridgeObjectRetain();
      swift_dynamicCast();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_23B928E20(0, *(_QWORD *)(v2 + 16) + 1, 1);
        v2 = v9;
      }
      v6 = *(_QWORD *)(v2 + 16);
      v5 = *(_QWORD *)(v2 + 24);
      if (v6 >= v5 >> 1)
      {
        sub_23B928E20(v5 > 1, v6 + 1, 1);
        v2 = v9;
      }
      v4 += 16;
      *(_QWORD *)(v2 + 16) = v6 + 1;
      sub_23B92DA04(&v8, (_OWORD *)(v2 + 32 * v6 + 32));
      --v1;
    }
    while (v1);
  }
  return v2;
}

uint64_t sub_23B91B620(unint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  uint64_t i;
  unint64_t v6;
  unint64_t v7;
  id *v8;
  id v9;
  unint64_t v10;
  unint64_t v11;
  _OWORD v12[2];
  uint64_t v13;

  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    v2 = sub_23B958730();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v3 = MEMORY[0x24BEE4AF8];
  if (!v2)
    return v3;
  v13 = MEMORY[0x24BEE4AF8];
  result = sub_23B928E20(0, v2 & ~(v2 >> 63), 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    if ((a1 & 0xC000000000000001) != 0)
    {
      for (i = 0; i != v2; ++i)
      {
        MEMORY[0x2426091BC](i, a1);
        sub_23B92D0DC(0, &qword_254309860);
        swift_dynamicCast();
        v3 = v13;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_23B928E20(0, *(_QWORD *)(v3 + 16) + 1, 1);
          v3 = v13;
        }
        v7 = *(_QWORD *)(v3 + 16);
        v6 = *(_QWORD *)(v3 + 24);
        if (v7 >= v6 >> 1)
        {
          sub_23B928E20(v6 > 1, v7 + 1, 1);
          v3 = v13;
        }
        *(_QWORD *)(v3 + 16) = v7 + 1;
        sub_23B92DA04(v12, (_OWORD *)(v3 + 32 * v7 + 32));
      }
    }
    else
    {
      v8 = (id *)(a1 + 32);
      sub_23B92D0DC(0, &qword_254309860);
      do
      {
        v9 = *v8;
        swift_dynamicCast();
        v3 = v13;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_23B928E20(0, *(_QWORD *)(v3 + 16) + 1, 1);
          v3 = v13;
        }
        v11 = *(_QWORD *)(v3 + 16);
        v10 = *(_QWORD *)(v3 + 24);
        if (v11 >= v10 >> 1)
        {
          sub_23B928E20(v10 > 1, v11 + 1, 1);
          v3 = v13;
        }
        *(_QWORD *)(v3 + 16) = v11 + 1;
        sub_23B92DA04(v12, (_OWORD *)(v3 + 32 * v11 + 32));
        ++v8;
        --v2;
      }
      while (v2);
    }
    return v3;
  }
  __break(1u);
  return result;
}

uint64_t sub_23B91B880()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = sub_23B95831C();
  __swift_allocate_value_buffer(v0, qword_254309BD8);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_254309BD8);
  if (qword_254309BB0 != -1)
    swift_once();
  v2 = __swift_project_value_buffer(v0, (uint64_t)qword_254309CF0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 - 8) + 16))(v1, v2, v0);
}

uint64_t sub_23B91B910(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  type metadata accessor for InternetMessaging(255, *(_QWORD *)(v4 + 80), *(_QWORD *)(v4 + 88), a4);
  swift_getMetatypeMetadata();
  return sub_23B9583E8();
}

uint64_t InternetMessaging.serviceName.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 112);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t InternetMessaging.crossAccount.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 128);
}

unint64_t sub_23B91B97C(uint64_t a1)
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

  v2 = __swift_instantiateConcreteTypeFromMangledName(qword_2543097D0);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8]();
  v5 = (char *)v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(_QWORD *)(a1 + 16))
  {
    v7 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_256A55C20);
  v6 = sub_23B958754();
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
    sub_23B9307CC(v12, (uint64_t)v5, qword_2543097D0);
    result = sub_23B9335F0((uint64_t)v5);
    if ((v15 & 1) != 0)
      break;
    v16 = result;
    *(_QWORD *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v17 = v7[6];
    v18 = sub_23B9582F8();
    result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(_QWORD *)(v18 - 8) + 32))(v17 + *(_QWORD *)(*(_QWORD *)(v18 - 8) + 72) * v16, v5, v18);
    *(_QWORD *)(v7[7] + 8 * v16) = *(_QWORD *)&v5[v9];
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

unint64_t sub_23B91BB10(uint64_t a1)
{
  return sub_23B91BB48(a1, &qword_256A556B0, &qword_256A556B8, (uint64_t (*)(uint64_t *, unint64_t))sub_23B92DA04);
}

unint64_t sub_23B91BB2C(uint64_t a1)
{
  return sub_23B91BB48(a1, &qword_256A55BD0, &qword_256A55580, (uint64_t (*)(uint64_t *, unint64_t))sub_23B92DA04);
}

unint64_t sub_23B91BB48(uint64_t a1, uint64_t *a2, uint64_t *a3, uint64_t (*a4)(uint64_t *, unint64_t))
{
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t result;
  char v15;
  uint64_t *v16;
  uint64_t v17;
  BOOL v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  if (!*(_QWORD *)(a1 + 16))
  {
    v8 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(a2);
  v7 = sub_23B958754();
  v8 = (_QWORD *)v7;
  v9 = *(_QWORD *)(a1 + 16);
  if (!v9)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v8;
  }
  v10 = v7 + 64;
  v11 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_23B9307CC(v11, (uint64_t)&v20, a3);
    v12 = v20;
    v13 = v21;
    result = sub_23B93358C(v20, v21);
    if ((v15 & 1) != 0)
      break;
    *(_QWORD *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v16 = (uint64_t *)(v8[6] + 16 * result);
    *v16 = v12;
    v16[1] = v13;
    result = a4(&v22, v8[7] + 32 * result);
    v17 = v8[2];
    v18 = __OFADD__(v17, 1);
    v19 = v17 + 1;
    if (v18)
      goto LABEL_11;
    v8[2] = v19;
    v11 += 48;
    if (!--v9)
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

uint64_t sub_23B91BC80(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  v3 = *(_QWORD *)(v2 + 168);
  *(_QWORD *)(v2 + 168) = a1;
  *(_QWORD *)(v2 + 176) = a2;
  return sub_23B92D238(v3);
}

uint64_t sub_23B91BC94(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  v3 = *(_QWORD *)(v2 + 184);
  *(_QWORD *)(v2 + 184) = a1;
  *(_QWORD *)(v2 + 192) = a2;
  return sub_23B92D238(v3);
}

uint64_t sub_23B91BCA8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  v3 = *(_QWORD *)(v2 + 200);
  *(_QWORD *)(v2 + 200) = a1;
  *(_QWORD *)(v2 + 208) = a2;
  return sub_23B92D238(v3);
}

uint64_t sub_23B91BCBC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  v3 = *(_QWORD *)(v2 + 216);
  *(_QWORD *)(v2 + 216) = a1;
  *(_QWORD *)(v2 + 224) = a2;
  return sub_23B92D238(v3);
}

uint64_t sub_23B91BCD0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  v3 = *(_QWORD *)(v2 + 232);
  *(_QWORD *)(v2 + 232) = a1;
  *(_QWORD *)(v2 + 240) = a2;
  return sub_23B92D238(v3);
}

uint64_t sub_23B91BCE4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  v3 = *(_QWORD *)(v2 + 248);
  *(_QWORD *)(v2 + 248) = a1;
  *(_QWORD *)(v2 + 256) = a2;
  return sub_23B92D238(v3);
}

uint64_t sub_23B91BD0C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char v3;
  char v4;
  uint64_t result;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t v10;
  os_log_type_t v11;
  uint8_t *v12;
  uint64_t v13;
  os_log_type_t v14;
  uint8_t *v15;
  uint64_t v16;
  os_log_type_t v17;
  uint8_t *v18;
  _QWORD *v19;
  _BYTE v20[24];
  uint64_t v21;

  sub_23B9581A8();
  if (!v21)
  {
    sub_23B930790((uint64_t)v20, &qword_256A55700);
LABEL_12:
    if (qword_254309BF0 != -1)
      swift_once();
    v6 = sub_23B95831C();
    __swift_project_value_buffer(v6, (uint64_t)qword_254309BD8);
    v7 = sub_23B958304();
    v8 = sub_23B95855C();
    if (os_log_type_enabled(v7, v8))
    {
      v9 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_23B916000, v7, v8, "Missing com.apple.private.ids.registration entitlement!", v9, 2u);
      MEMORY[0x242609864](v9, -1, -1);
    }
    goto LABEL_31;
  }
  if ((swift_dynamicCast() & 1) == 0 || v19 != 1)
    goto LABEL_12;
  sub_23B9581A8();
  if ((swift_dynamicCast() & 1) == 0 || v19 != 1)
  {
    if (qword_254309BF0 != -1)
      swift_once();
    v10 = sub_23B95831C();
    __swift_project_value_buffer(v10, (uint64_t)qword_254309BD8);
    v7 = sub_23B958304();
    v11 = sub_23B95855C();
    if (os_log_type_enabled(v7, v11))
    {
      v12 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_23B916000, v7, v11, "Missing com.apple.private.ids.remotecredentials entitlement!", v12, 2u);
      MEMORY[0x242609864](v12, -1, -1);
    }
    goto LABEL_31;
  }
  sub_23B9581A8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254309C78);
  if ((swift_dynamicCast() & 1) == 0
    || (v2 = *(_QWORD *)(v0 + 112),
        v1 = *(_QWORD *)(v0 + 120),
        v3 = sub_23B939514(v2, v1, v19),
        swift_bridgeObjectRelease(),
        (v3 & 1) == 0))
  {
    if (qword_254309BF0 != -1)
      swift_once();
    v13 = sub_23B95831C();
    __swift_project_value_buffer(v13, (uint64_t)qword_254309BD8);
    v7 = sub_23B958304();
    v14 = sub_23B95855C();
    if (os_log_type_enabled(v7, v14))
    {
      v15 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_23B916000, v7, v14, "Missing com.apple.private.ids.messaging entitlement!", v15, 2u);
      MEMORY[0x242609864](v15, -1, -1);
    }
    goto LABEL_31;
  }
  sub_23B9581A8();
  if ((swift_dynamicCast() & 1) == 0
    || (v4 = sub_23B939514(v2, v1, v19), result = swift_bridgeObjectRelease(), (v4 & 1) == 0))
  {
    if (qword_254309BF0 != -1)
      swift_once();
    v16 = sub_23B95831C();
    __swift_project_value_buffer(v16, (uint64_t)qword_254309BD8);
    v7 = sub_23B958304();
    v17 = sub_23B95855C();
    if (os_log_type_enabled(v7, v17))
    {
      v18 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v18 = 0;
      _os_log_impl(&dword_23B916000, v7, v17, "Missing com.apple.private.ids.messaging.urgent-priority entitlement!", v18, 2u);
      MEMORY[0x242609864](v18, -1, -1);
    }
LABEL_31:

    result = sub_23B958724();
    __break(1u);
  }
  return result;
}

void InternetMessaging.__allocating_init(serviceName:crossAccount:)(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v3;
  _QWORD *v7;

  swift_allocObject();
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = sub_23B91AD0C;
  InternetMessaging.init(serviceName:crossAccount:)(a1, a2, a3);
}

void InternetMessaging.init(serviceName:crossAccount:)(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t *v3;
  _QWORD *v4;
  uint64_t v8;
  uint64_t (*v9)(uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;

  v4[3] = v3;
  v4[4] = *v3;
  v8 = *v3;
  swift_defaultActor_initialize();
  v3[18] = 0;
  v3[19] = sub_23B91B97C(MEMORY[0x24BEE4AF8]);
  sub_23B9582F8();
  v9 = (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58];
  v10 = *(_QWORD *)(v8 + 80);
  v4[5] = v10;
  v11 = *(_QWORD *)(v8 + 88);
  v4[6] = v11;
  type metadata accessor for Message(255, v10, v11, v12);
  type metadata accessor for MessageContext();
  swift_getTupleTypeMetadata2();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254309C90);
  sub_23B958190();
  swift_getTupleTypeMetadata2();
  sub_23B9584A8();
  sub_23B92F2B8((unint64_t *)&qword_254309B00, v9, MEMORY[0x24BDCEA88]);
  v3[20] = sub_23B958364();
  *(_OWORD *)(v3 + 21) = 0u;
  *(_OWORD *)(v3 + 23) = 0u;
  *(_OWORD *)(v3 + 25) = 0u;
  *(_OWORD *)(v3 + 27) = 0u;
  *(_OWORD *)(v3 + 29) = 0u;
  *(_OWORD *)(v3 + 31) = 0u;
  v3[14] = a1;
  v3[15] = a2;
  *((_BYTE *)v3 + 128) = a3;
  v13 = objc_allocWithZone(MEMORY[0x24BE4FCB8]);
  swift_bridgeObjectRetain();
  v14 = (void *)sub_23B9583D0();
  swift_bridgeObjectRelease();
  v15 = objc_msgSend(v13, sel_initWithService_, v14);

  if (v15)
  {
    v3[17] = (uint64_t)v15;
    swift_task_switch();
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_23B91C49C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  objc_class *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  id v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v21;

  v1 = *(_QWORD *)(v0 + 24);
  v3 = *(_QWORD *)(v0 + 40);
  v2 = *(_QWORD *)(v0 + 48);
  v4 = (objc_class *)type metadata accessor for MessagingDelegateTrampoline();
  v6 = type metadata accessor for InternetMessaging(0, v3, v2, v5);
  v7 = swift_retain();
  v8 = sub_23B955F64(v7, v4, v6, (uint64_t)&off_250CA1C90);
  swift_release();
  v9 = *(void **)(v1 + 144);
  *(_QWORD *)(v1 + 144) = v8;

  sub_23B91BD0C();
  if (qword_254309BF0 != -1)
    swift_once();
  v10 = sub_23B95831C();
  __swift_project_value_buffer(v10, (uint64_t)qword_254309BD8);
  v11 = sub_23B958304();
  v12 = sub_23B958568();
  if (os_log_type_enabled(v11, v12))
  {
    v13 = (uint8_t *)swift_slowAlloc();
    v14 = swift_slowAlloc();
    v21 = v14;
    *(_DWORD *)v13 = 136446210;
    v18 = sub_23B91B910(v14, v15, v16, v17);
    *(_QWORD *)(v0 + 16) = sub_23B9287E0(v18, v19, &v21);
    sub_23B9585A4();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23B916000, v11, v12, "%{public}s: created.", v13, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x242609864](v14, -1, -1);
    MEMORY[0x242609864](v13, -1, -1);
  }

  return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(_QWORD *)(v0 + 24));
}

void sub_23B91C680()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  unint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  os_log_type_t v20;
  uint8_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;

  v1 = v0;
  v2 = sub_23B958328();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8]();
  v5 = (char *)&v28 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE4FE68]), sel_init);
  objc_msgSend(v6, sel_setWantsCrossAccountMessaging_, *(unsigned __int8 *)(v0 + 128));
  v7 = *(void **)(v0 + 136);
  v8 = *(void **)(v0 + 144);
  sub_23B92D0DC(0, (unint64_t *)&qword_254309858);
  (*(void (**)(char *, _QWORD, uint64_t))(v3 + 104))(v5, *MEMORY[0x24BEE5490], v2);
  v9 = v6;
  v10 = v8;
  v11 = (void *)sub_23B958574();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  objc_msgSend(v7, sel_addDelegate_withDelegateProperties_queue_, v10, v9, v11);

  v12 = objc_msgSend(v7, sel_devices);
  if (v12)
  {
    v13 = v12;
    sub_23B92D0DC(0, &qword_254309860);
    v14 = sub_23B958484();

    v15 = *(void **)(v1 + 144);
    if (v15)
    {
      v16 = v15;
      v17 = sub_23B91B620(v14);
      swift_bridgeObjectRelease();
      sub_23B94C5C8(v7, v17);

    }
    swift_bridgeObjectRelease();
  }
  if (qword_254309BF0 != -1)
    swift_once();
  v18 = sub_23B95831C();
  __swift_project_value_buffer(v18, (uint64_t)qword_254309BD8);
  v19 = sub_23B958304();
  v20 = sub_23B958568();
  if (os_log_type_enabled(v19, v20))
  {
    v21 = (uint8_t *)swift_slowAlloc();
    v22 = swift_slowAlloc();
    v29 = v22;
    *(_DWORD *)v21 = 136446210;
    v26 = sub_23B91B910(v22, v23, v24, v25);
    v28 = sub_23B9287E0(v26, v27, &v29);
    sub_23B9585A4();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23B916000, v19, v20, "%{public}s: started.", v21, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x242609864](v22, -1, -1);
    MEMORY[0x242609864](v21, -1, -1);

  }
  else
  {

  }
}

void sub_23B91C990()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int64_t v8;
  int64_t v9;
  uint64_t v10;
  void *v11;
  int64_t v12;
  uint64_t v13;
  int64_t v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t);
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int64_t v22;
  int64_t v23;
  uint64_t v24;
  void *v25;
  int64_t v26;
  uint64_t v27;
  int64_t v28;
  uint64_t v29;
  NSObject *v30;
  os_log_type_t v31;
  uint8_t *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40[13];

  v39 = *v0;
  swift_beginAccess();
  v1 = v0[19];
  v4 = *(_QWORD *)(v1 + 64);
  v3 = v1 + 64;
  v2 = v4;
  v5 = 1 << *(_BYTE *)(v0[19] + 32);
  v6 = -1;
  if (v5 < 64)
    v6 = ~(-1 << v5);
  v7 = v6 & v2;
  v8 = (unint64_t)(v5 + 63) >> 6;
  swift_bridgeObjectRetain();
  v9 = 0;
  v10 = MEMORY[0x24BEE6848];
  while (1)
  {
    if (v7)
    {
      v7 &= v7 - 1;
      goto LABEL_5;
    }
    v12 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
LABEL_48:
      __break(1u);
LABEL_49:
      __break(1u);
      goto LABEL_50;
    }
    if (v12 >= v8)
      goto LABEL_23;
    v13 = *(_QWORD *)(v3 + 8 * v12);
    ++v9;
    if (!v13)
    {
      v9 = v12 + 1;
      if (v12 + 1 >= v8)
        goto LABEL_23;
      v13 = *(_QWORD *)(v3 + 8 * v9);
      if (!v13)
      {
        v9 = v12 + 2;
        if (v12 + 2 >= v8)
          goto LABEL_23;
        v13 = *(_QWORD *)(v3 + 8 * v9);
        if (!v13)
        {
          v9 = v12 + 3;
          if (v12 + 3 >= v8)
            goto LABEL_23;
          v13 = *(_QWORD *)(v3 + 8 * v9);
          if (!v13)
            break;
        }
      }
    }
LABEL_22:
    v7 = (v13 - 1) & v13;
LABEL_5:
    sub_23B9584D8();
    sub_23B92F2B8(&qword_256A55500, (uint64_t (*)(uint64_t))MEMORY[0x24BEE6838], v10);
    v11 = (void *)swift_allocError();
    swift_retain();
    sub_23B958334();
    v40[9] = (uint64_t)v11;
    sub_23B958178();
    swift_release();

  }
  v14 = v12 + 4;
  if (v14 >= v8)
  {
LABEL_23:
    swift_release();
    swift_beginAccess();
    v0[19] = MEMORY[0x24BEE4B00];
    swift_bridgeObjectRelease();
    swift_beginAccess();
    v15 = v0[20];
    sub_23B9582F8();
    v16 = (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58];
    type metadata accessor for Message(255, *(_QWORD *)(v39 + 80), *(_QWORD *)(v39 + 88), v17);
    type metadata accessor for MessageContext();
    swift_getTupleTypeMetadata2();
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254309C90);
    sub_23B958190();
    sub_23B92F2B8((unint64_t *)&qword_254309B00, v16, MEMORY[0x24BDCEA88]);
    v18 = v15 + 64;
    v19 = 1 << *(_BYTE *)(v15 + 32);
    v20 = -1;
    if (v19 < 64)
      v20 = ~(-1 << v19);
    v21 = v20 & *(_QWORD *)(v15 + 64);
    v22 = (unint64_t)(v19 + 63) >> 6;
    swift_bridgeObjectRetain();
    v23 = 0;
    v24 = MEMORY[0x24BEE6848];
    while (1)
    {
      if (v21)
      {
        v21 &= v21 - 1;
      }
      else
      {
        v26 = v23 + 1;
        if (__OFADD__(v23, 1))
          goto LABEL_48;
        if (v26 >= v22)
        {
LABEL_43:
          swift_release();
          swift_beginAccess();
          sub_23B95837C();
          sub_23B958370();
          swift_endAccess();
          objc_msgSend((id)v0[17], sel_removeDelegate_, v0[18]);
          if (qword_254309BF0 != -1)
            goto LABEL_51;
          goto LABEL_44;
        }
        v27 = *(_QWORD *)(v18 + 8 * v26);
        ++v23;
        if (!v27)
        {
          v23 = v26 + 1;
          if (v26 + 1 >= v22)
            goto LABEL_43;
          v27 = *(_QWORD *)(v18 + 8 * v23);
          if (!v27)
          {
            v23 = v26 + 2;
            if (v26 + 2 >= v22)
              goto LABEL_43;
            v27 = *(_QWORD *)(v18 + 8 * v23);
            if (!v27)
            {
              v28 = v26 + 3;
              if (v28 >= v22)
                goto LABEL_43;
              v27 = *(_QWORD *)(v18 + 8 * v28);
              if (!v27)
              {
                while (1)
                {
                  v23 = v28 + 1;
                  if (__OFADD__(v28, 1))
                    goto LABEL_49;
                  if (v23 >= v22)
                    goto LABEL_43;
                  v27 = *(_QWORD *)(v18 + 8 * v23);
                  ++v28;
                  if (v27)
                    goto LABEL_42;
                }
              }
              v23 = v28;
            }
          }
        }
LABEL_42:
        v21 = (v27 - 1) & v27;
      }
      sub_23B9584D8();
      sub_23B92F2B8(&qword_256A55500, (uint64_t (*)(uint64_t))MEMORY[0x24BEE6838], v24);
      v25 = (void *)swift_allocError();
      swift_retain();
      sub_23B958334();
      v40[0] = (uint64_t)v25;
      sub_23B958178();
      swift_release();

    }
  }
  v13 = *(_QWORD *)(v3 + 8 * v14);
  if (v13)
  {
    v9 = v14;
    goto LABEL_22;
  }
  while (1)
  {
    v9 = v14 + 1;
    if (__OFADD__(v14, 1))
      break;
    if (v9 >= v8)
      goto LABEL_23;
    v13 = *(_QWORD *)(v3 + 8 * v9);
    ++v14;
    if (v13)
      goto LABEL_22;
  }
LABEL_50:
  __break(1u);
LABEL_51:
  swift_once();
LABEL_44:
  v29 = sub_23B95831C();
  __swift_project_value_buffer(v29, (uint64_t)qword_254309BD8);
  v30 = sub_23B958304();
  v31 = sub_23B958568();
  if (os_log_type_enabled(v30, v31))
  {
    v32 = (uint8_t *)swift_slowAlloc();
    v33 = swift_slowAlloc();
    v40[0] = v33;
    *(_DWORD *)v32 = 136446210;
    v37 = sub_23B91B910(v33, v34, v35, v36);
    sub_23B9287E0(v37, v38, v40);
    sub_23B9585A4();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23B916000, v30, v31, "%{public}s: stopped.", v32, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x242609864](v33, -1, -1);
    MEMORY[0x242609864](v32, -1, -1);
  }

}

void sub_23B91CF5C(_QWORD *a1@<X8>)
{
  uint64_t v1;
  id v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  Swift::String v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _BYTE v14[8];
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v3 = objc_msgSend(*(id *)(v1 + 136), sel_iCloudAccount);
  if (v3)
  {
    v4 = v3;
    v5 = objc_msgSend(v3, sel_loginID);
    if (!v5)
    {
      __break(1u);
      return;
    }
    v6 = v5;
    v7 = sub_23B9583DC();
    v9 = v8;

    v10._countAndFlagsBits = v7;
    v10._object = v9;
    Destination.init(string:)(v10);
    v11 = v18;
    if (v19)
    {
      sub_23B938278((uint64_t)v14);
      swift_bridgeObjectRelease();

      v12 = v15;
      v13 = v16;
      *a1 = v14[0];
      a1[1] = v12;
      a1[2] = v13;
      return;
    }

    *a1 = v17;
    a1[1] = v11;
  }
  else
  {
    *a1 = 0;
    a1[1] = 0;
  }
  a1[2] = 0;
}

uint64_t sub_23B91D044@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  void *v3;
  void *v4;
  id v5;
  _OWORD *v6;
  _OWORD v8[11];
  _OWORD v9[10];

  v3 = *(void **)(v1 + 136);
  v4 = (void *)sub_23B9583D0();
  v5 = objc_msgSend(v3, sel_deviceForFromID_, v4);

  if (v5)
  {
    sub_23B956C18(v5, (uint64_t)v9);
    v8[6] = v9[6];
    v8[7] = v9[7];
    v8[8] = v9[8];
    v8[9] = v9[9];
    v8[2] = v9[2];
    v8[3] = v9[3];
    v8[4] = v9[4];
    v8[5] = v9[5];
    v8[0] = v9[0];
    v8[1] = v9[1];
    nullsub_1(v8);
    v6 = v8;
  }
  else
  {
    sub_23B92D114(v9);
    v6 = v9;
  }
  return sub_23B92D130((uint64_t)v6, a1);
}

uint64_t sub_23B91D118@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;
  __int128 *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 *v18;
  _OWORD v20[10];
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;

  v2 = sub_23B91D22C();
  v3 = *(_QWORD *)(v2 + 16);
  if (!v3)
  {
LABEL_7:
    swift_bridgeObjectRelease();
    sub_23B92D114(&v21);
    v18 = &v21;
    return sub_23B92D130((uint64_t)v18, a1);
  }
  v4 = *(_OWORD *)(v2 + 144);
  v27 = *(_OWORD *)(v2 + 128);
  v28 = v4;
  v5 = *(_OWORD *)(v2 + 176);
  v29 = *(_OWORD *)(v2 + 160);
  v30 = v5;
  v6 = *(_OWORD *)(v2 + 80);
  v23 = *(_OWORD *)(v2 + 64);
  v24 = v6;
  v7 = *(_OWORD *)(v2 + 112);
  v25 = *(_OWORD *)(v2 + 96);
  v26 = v7;
  v8 = *(_OWORD *)(v2 + 48);
  v21 = *(_OWORD *)(v2 + 32);
  v22 = v8;
  if ((BYTE3(v29) & 1) == 0)
  {
    v9 = 192;
    while (--v3)
    {
      v10 = (__int128 *)(v2 + v9);
      v9 += 160;
      v11 = v10[1];
      v21 = *v10;
      v22 = v11;
      v12 = v10[2];
      v13 = v10[3];
      v14 = v10[5];
      v25 = v10[4];
      v26 = v14;
      v23 = v12;
      v24 = v13;
      v15 = v10[6];
      v16 = v10[7];
      v17 = v10[9];
      v29 = v10[8];
      v30 = v17;
      v27 = v15;
      v28 = v16;
      if ((BYTE3(v29) & 1) != 0)
        goto LABEL_6;
    }
    goto LABEL_7;
  }
LABEL_6:
  sub_23B92D178((uint64_t)&v21);
  swift_bridgeObjectRelease();
  v20[6] = v27;
  v20[7] = v28;
  v20[8] = v29;
  v20[9] = v30;
  v20[2] = v23;
  v20[3] = v24;
  v20[4] = v25;
  v20[5] = v26;
  v20[0] = v21;
  v20[1] = v22;
  nullsub_1(v20);
  v18 = v20;
  return sub_23B92D130((uint64_t)v18, a1);
}

uint64_t sub_23B91D22C()
{
  unint64_t v0;
  uint64_t v1;
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  id i;
  id v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  unint64_t v13;
  unint64_t v14;
  _OWORD *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _OWORD v23[10];
  _OWORD v24[10];
  _OWORD v25[10];
  _BYTE v26[168];

  v0 = (unint64_t)sub_23B91D564();
  if (!(v0 >> 62))
  {
    v1 = *(_QWORD *)((v0 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v1)
      goto LABEL_3;
LABEL_24:
    swift_bridgeObjectRelease();
    v4 = MEMORY[0x24BEE4AF8];
    v9 = *(_QWORD *)(MEMORY[0x24BEE4AF8] + 16);
    if (v9)
    {
LABEL_13:
      v10 = v4 + 32;
      swift_bridgeObjectRetain();
      v11 = v9 - 1;
      v12 = (_QWORD *)MEMORY[0x24BEE4AF8];
      while (1)
      {
        sub_23B92D130(v10, (uint64_t)v25);
        sub_23B92D130((uint64_t)v25, (uint64_t)v26);
        if (sub_23B92D220((uint64_t)v26) != 1)
        {
          sub_23B92D130((uint64_t)v25, (uint64_t)v24);
          sub_23B92D178((uint64_t)v24);
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v12 = sub_23B928270(0, v12[2] + 1, 1, v12);
          v14 = v12[2];
          v13 = v12[3];
          if (v14 >= v13 >> 1)
            v12 = sub_23B928270((_QWORD *)(v13 > 1), v14 + 1, 1, v12);
          sub_23B92D130((uint64_t)v25, (uint64_t)v23);
          v12[2] = v14 + 1;
          v15 = &v12[20 * v14];
          v16 = v23[1];
          v15[2] = v23[0];
          v15[3] = v16;
          v17 = v23[5];
          v19 = v23[2];
          v18 = v23[3];
          v15[6] = v23[4];
          v15[7] = v17;
          v15[4] = v19;
          v15[5] = v18;
          v20 = v23[9];
          v22 = v23[6];
          v21 = v23[7];
          v15[10] = v23[8];
          v15[11] = v20;
          v15[8] = v22;
          v15[9] = v21;
        }
        if (!v11)
          break;
        --v11;
        v10 += 160;
      }
      swift_bridgeObjectRelease_n();
      return (uint64_t)v12;
    }
LABEL_25:
    swift_bridgeObjectRelease();
    return MEMORY[0x24BEE4AF8];
  }
  v1 = sub_23B958730();
  if (!v1)
    goto LABEL_24;
LABEL_3:
  *(_QWORD *)&v23[0] = MEMORY[0x24BEE4AF8];
  result = sub_23B928E58(0, v1 & ~(v1 >> 63), 0);
  if ((v1 & 0x8000000000000000) == 0)
  {
    v3 = 0;
    v4 = *(_QWORD *)&v23[0];
    if ((v0 & 0xC000000000000001) == 0)
      goto LABEL_6;
LABEL_5:
    for (i = (id)MEMORY[0x2426091BC](v3, v0); ; i = *(id *)(v0 + 8 * v3 + 32))
    {
      v6 = i;
      sub_23B956C18(v6, (uint64_t)v25);

      v24[6] = v25[6];
      v24[7] = v25[7];
      v24[8] = v25[8];
      v24[9] = v25[9];
      v24[2] = v25[2];
      v24[3] = v25[3];
      v24[4] = v25[4];
      v24[5] = v25[5];
      v24[0] = v25[0];
      v24[1] = v25[1];
      nullsub_1(v24);
      sub_23B92D130((uint64_t)v24, (uint64_t)v26);
      *(_QWORD *)&v23[0] = v4;
      v8 = *(_QWORD *)(v4 + 16);
      v7 = *(_QWORD *)(v4 + 24);
      if (v8 >= v7 >> 1)
      {
        sub_23B928E58(v7 > 1, v8 + 1, 1);
        v4 = *(_QWORD *)&v23[0];
      }
      *(_QWORD *)(v4 + 16) = v8 + 1;
      sub_23B92D130((uint64_t)v26, v4 + 160 * v8 + 32);
      if (v1 - 1 == v3)
        break;
      ++v3;
      if ((v0 & 0xC000000000000001) != 0)
        goto LABEL_5;
LABEL_6:
      ;
    }
    swift_bridgeObjectRelease();
    v9 = *(_QWORD *)(v4 + 16);
    if (v9)
      goto LABEL_13;
    goto LABEL_25;
  }
  __break(1u);
  return result;
}

id sub_23B91D564()
{
  uint64_t v0;
  id result;
  void *v2;
  uint64_t v3;

  if ((MEMORY[0x242608C70]() & 1) != 0)
    return (id)MEMORY[0x24BEE4AF8];
  result = objc_msgSend(*(id *)(v0 + 136), sel_devices);
  if (result)
  {
    v2 = result;
    sub_23B92D0DC(0, &qword_254309860);
    v3 = sub_23B958484();

    return (id)v3;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t InternetMessaging.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_23B92D238(*(_QWORD *)(v0 + 168));
  sub_23B92D238(*(_QWORD *)(v0 + 184));
  sub_23B92D238(*(_QWORD *)(v0 + 200));
  sub_23B92D238(*(_QWORD *)(v0 + 216));
  sub_23B92D238(*(_QWORD *)(v0 + 232));
  sub_23B92D238(*(_QWORD *)(v0 + 248));
  swift_defaultActor_destroy();
  return v0;
}

uint64_t InternetMessaging.__deallocating_deinit()
{
  InternetMessaging.deinit();
  return swift_defaultActor_deallocate();
}

uint64_t InternetMessaging.unownedExecutor.getter()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_23B91D67C()
{
  return InternetMessaging.unownedExecutor.getter();
}

uint64_t InternetMessaging.send(message:messageOptions:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4[11] = a3;
  v4[12] = v3;
  v4[9] = a1;
  v4[10] = a2;
  v4[13] = *v3;
  v5 = *v3;
  v4[14] = type metadata accessor for MessagingOptions();
  v4[15] = swift_task_alloc();
  v4[16] = swift_task_alloc();
  v7 = type metadata accessor for Message(0, *(_QWORD *)(v5 + 80), *(_QWORD *)(v5 + 88), v6);
  v4[17] = v7;
  v4[18] = *(_QWORD *)(v7 - 8);
  v4[19] = swift_task_alloc();
  v4[20] = swift_task_alloc();
  return swift_task_switch();
}

void sub_23B91D754()
{
  _QWORD *v0;
  uint64_t v1;
  int64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;

  v1 = *(_QWORD *)(v0[11] + *(int *)(v0[14] + 20));
  v2 = *(_QWORD *)(v1 + 16);
  v3 = MEMORY[0x24BEE4AF8];
  if (v2)
  {
    swift_bridgeObjectRetain();
    sub_23B928E3C(0, v2, 0);
    v4 = 0;
    v3 = v16;
    v5 = *(_QWORD *)(v16 + 16);
    v6 = 16 * v5;
    do
    {
      v7 = v1;
      v9 = *(_QWORD *)(v1 + v4 + 40);
      v8 = *(_QWORD *)(v1 + v4 + 48);
      v10 = *(_QWORD *)(v16 + 24);
      swift_bridgeObjectRetain();
      if (v5 >= v10 >> 1)
        sub_23B928E3C(v10 > 1, v5 + 1, 1);
      *(_QWORD *)(v16 + 16) = v5 + 1;
      v11 = v16 + v6;
      *(_QWORD *)(v11 + 32) = v9;
      *(_QWORD *)(v11 + 40) = v8;
      v6 += 16;
      v4 += 24;
      ++v5;
      --v2;
      v1 = v7;
    }
    while (v2);
    swift_bridgeObjectRelease();
    v0 = v15;
  }
  v12 = v0[17];
  v0[21] = sub_23B92D448(v3);
  swift_bridgeObjectRelease();
  sub_23B958214();
  swift_allocObject();
  sub_23B958208();
  MEMORY[0x2426097B0](&protocol conformance descriptor for Message<A>, v12);
  v0[22] = sub_23B9581F0();
  v0[23] = v13;
  v14 = v13;
  swift_release();
  sub_23B958400();
  swift_bridgeObjectRelease();
  __asm { BR              X10 }
}

uint64_t sub_23B91E118()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 208) = v0;
  swift_task_dealloc();
  if (!v0)
  {
    swift_bridgeObjectRelease();
    swift_task_dealloc();
  }
  return swift_task_switch();
}

uint64_t sub_23B91E198()
{
  uint64_t v0;

  sub_23B92D4DC(*(_QWORD *)(v0 + 176), *(_QWORD *)(v0 + 184));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23B91E1FC()
{
  uint64_t v0;

  sub_23B92D4DC(*(_QWORD *)(v0 + 176), *(_QWORD *)(v0 + 184));
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23B91E270(uint64_t a1, _QWORD *a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6, uint64_t a7)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t *v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  _QWORD *v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;

  v38 = a6;
  v39 = a7;
  v36 = a1;
  v37 = a5;
  v31 = a3;
  v32 = a4;
  v35 = a2;
  v7 = *a2;
  v8 = *(_QWORD *)(type metadata accessor for MessagingOptions() - 8);
  v9 = *(_QWORD *)(v8 + 64);
  MEMORY[0x24BDAC7A8]();
  v30 = (uint64_t)&v30 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *(_QWORD *)(v7 + 80);
  v33 = *(_QWORD *)(v7 + 88);
  v12 = type metadata accessor for Message(0, v10, v33, v11);
  v13 = *(_QWORD *)(v12 - 8);
  v14 = *(_QWORD *)(v13 + 64);
  MEMORY[0x24BDAC7A8]();
  v16 = (char *)&v30 - v15;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254309C80);
  MEMORY[0x24BDAC7A8]();
  v18 = (char *)&v30 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v34 = v18;
  v19 = sub_23B9584F0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 56))(v18, 1, 1, v19);
  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))(v16, v31, v12);
  sub_23B92F2F8(v32, (uint64_t)&v30 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(_QWORD))type metadata accessor for MessagingOptions);
  v20 = (*(unsigned __int8 *)(v13 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  v21 = (v14 + *(unsigned __int8 *)(v8 + 80) + v20) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  v22 = (v9 + v21 + 7) & 0xFFFFFFFFFFFFFFF8;
  v23 = (v22 + 23) & 0xFFFFFFFFFFFFFFF8;
  v24 = (char *)swift_allocObject();
  *((_QWORD *)v24 + 2) = 0;
  *((_QWORD *)v24 + 3) = 0;
  v25 = v33;
  *((_QWORD *)v24 + 4) = v10;
  *((_QWORD *)v24 + 5) = v25;
  *((_QWORD *)v24 + 6) = v35;
  (*(void (**)(char *, char *, uint64_t))(v13 + 32))(&v24[v20], v16, v12);
  sub_23B92F378(v30, (uint64_t)&v24[v21], (uint64_t (*)(_QWORD))type metadata accessor for MessagingOptions);
  v26 = (uint64_t *)&v24[v22];
  v28 = v37;
  v27 = v38;
  *v26 = v37;
  v26[1] = v27;
  *(_QWORD *)&v24[v23] = v39;
  *(_QWORD *)&v24[(v23 + 15) & 0xFFFFFFFFFFFFFFF8] = v36;
  swift_retain();
  sub_23B9304B0(v28, v27);
  swift_bridgeObjectRetain();
  swift_retain();
  sub_23B94CA58((uint64_t)v34, (uint64_t)&unk_256A556C8, (uint64_t)v24);
  return swift_release();
}

uint64_t sub_23B91E4B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  _QWORD *v13;
  uint64_t v15;
  uint64_t v16;

  v13 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v8 + 16) = v13;
  *v13 = v8;
  v13[1] = sub_23B930844;
  return sub_23B91E544(a5, a6, a7, a8, v15, v16);
}

uint64_t sub_23B91E544(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t *v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v7[18] = a6;
  v7[19] = v6;
  v7[16] = a4;
  v7[17] = a5;
  v7[14] = a2;
  v7[15] = a3;
  v7[13] = a1;
  v7[20] = *v6;
  v8 = *v6;
  v9 = *(_QWORD *)(*v6 + 80);
  v7[21] = v9;
  v10 = *(_QWORD *)(v8 + 88);
  v7[22] = v10;
  v11 = type metadata accessor for Message(0, v9, v10, a4);
  v7[23] = v11;
  v12 = *(_QWORD *)(v11 - 8);
  v7[24] = v12;
  v7[25] = *(_QWORD *)(v12 + 64);
  v7[26] = swift_task_alloc();
  v7[27] = swift_task_alloc();
  v13 = type metadata accessor for MessagingOptions();
  v7[28] = v13;
  v14 = *(_QWORD *)(v13 - 8);
  v7[29] = v14;
  v7[30] = *(_QWORD *)(v14 + 64);
  v7[31] = swift_task_alloc();
  v7[32] = swift_task_alloc();
  v15 = sub_23B9582F8();
  v7[33] = v15;
  v7[34] = *(_QWORD *)(v15 - 8);
  v7[35] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23B91E644()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char isUniquelyReferenced_nonNull_native;
  void (*v9)(uint64_t, uint64_t, uint64_t);
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v1 = *(_QWORD *)(v0 + 272);
  v2 = *(_QWORD *)(v0 + 280);
  v4 = *(_QWORD *)(v0 + 256);
  v3 = *(_QWORD *)(v0 + 264);
  v16 = *(_QWORD *)(v0 + 216);
  v17 = *(_QWORD *)(v0 + 232);
  v18 = *(_QWORD *)(v0 + 200);
  v19 = *(_QWORD *)(v0 + 240);
  v25 = *(_QWORD *)(v0 + 192);
  v26 = *(_QWORD *)(v0 + 184);
  v5 = *(_QWORD *)(v0 + 152);
  v6 = *(_QWORD *)(v0 + 144);
  v23 = *(_QWORD *)(v0 + 136);
  v24 = *(_QWORD *)(v0 + 160);
  v7 = *(_QWORD *)(v0 + 112);
  v21 = *(_QWORD *)(v0 + 120);
  v22 = *(_QWORD *)(v0 + 128);
  v15 = *(_QWORD *)(v0 + 104);
  v20 = *(_OWORD *)(v0 + 168);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v1 + 16))(v2, v7, v3);
  swift_beginAccess();
  swift_retain();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v27 = *(_QWORD *)(v5 + 152);
  *(_QWORD *)(v5 + 152) = 0x8000000000000000;
  sub_23B936920(v6, v2, isUniquelyReferenced_nonNull_native);
  *(_QWORD *)(v5 + 152) = v27;
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v1 + 8))(v2, v3);
  swift_endAccess();
  sub_23B92F2F8(v7, v4, (uint64_t (*)(_QWORD))type metadata accessor for MessagingOptions);
  v9 = *(void (**)(uint64_t, uint64_t, uint64_t))(v25 + 16);
  *(_QWORD *)(v0 + 288) = v9;
  v9(v16, v15, v26);
  v10 = (*(unsigned __int8 *)(v17 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v17 + 80);
  v11 = (v19 + *(unsigned __int8 *)(v25 + 80) + v10) & ~(unint64_t)*(unsigned __int8 *)(v25 + 80);
  v12 = swift_allocObject();
  *(_QWORD *)(v0 + 296) = v12;
  *(_OWORD *)(v12 + 16) = v20;
  *(_QWORD *)(v12 + 32) = v5;
  *(_QWORD *)(v12 + 40) = v21;
  *(_QWORD *)(v12 + 48) = v22;
  *(_QWORD *)(v12 + 56) = v23;
  sub_23B92F378(v4, v12 + v10, (uint64_t (*)(_QWORD))type metadata accessor for MessagingOptions);
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v25 + 32))(v12 + v11, v16, v26);
  *(_QWORD *)(v12 + ((v18 + v11 + 7) & 0xFFFFFFFFFFFFFFF8)) = v24;
  swift_retain();
  sub_23B9304B0(v21, v22);
  swift_bridgeObjectRetain();
  v13 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 304) = v13;
  *v13 = v0;
  v13[1] = sub_23B91E8AC;
  return sub_23B958160();
}

uint64_t sub_23B91E8AC()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 312) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_release();
  return swift_task_switch();
}

uint64_t sub_23B91E920()
{
  uint64_t v0;

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23B91E980()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  void (*v3)(uint64_t, uint64_t, uint64_t);
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;
  NSObject *v11;
  os_log_type_t v12;
  _BOOL4 v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  void (*v24)(uint64_t, uint64_t);
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  unint64_t v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  uint64_t v37;
  void (*v38)(uint64_t, uint64_t, uint64_t);
  uint64_t v39;
  _QWORD *v40;
  os_log_type_t type;
  uint64_t v42;
  NSObject *log;
  uint64_t v44;

  swift_release();
  if (qword_254309BF0 != -1)
    swift_once();
  v1 = *(_QWORD *)(v0 + 104);
  v2 = *(void **)(v0 + 312);
  v3 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 288);
  v4 = *(_QWORD *)(v0 + 248);
  v5 = *(_QWORD *)(v0 + 208);
  v6 = *(_QWORD *)(v0 + 184);
  v7 = *(_QWORD *)(v0 + 112);
  v8 = sub_23B95831C();
  __swift_project_value_buffer(v8, (uint64_t)qword_254309BD8);
  v3(v5, v1, v6);
  sub_23B92F2F8(v7, v4, (uint64_t (*)(_QWORD))type metadata accessor for MessagingOptions);
  v9 = v2;
  v10 = v2;
  v11 = sub_23B958304();
  v12 = sub_23B958568();
  v13 = os_log_type_enabled(v11, v12);
  v14 = *(void **)(v0 + 312);
  if (v13)
  {
    log = v11;
    v38 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 288);
    v39 = *(_QWORD *)(v0 + 248);
    v15 = *(_QWORD *)(v0 + 208);
    v16 = *(_QWORD *)(v0 + 216);
    v17 = *(_QWORD *)(v0 + 184);
    v37 = *(_QWORD *)(v0 + 192);
    type = v12;
    v18 = swift_slowAlloc();
    v40 = (_QWORD *)swift_slowAlloc();
    v42 = swift_slowAlloc();
    v44 = v42;
    *(_DWORD *)v18 = 136446978;
    v22 = sub_23B91B910(v42, v19, v20, v21);
    *(_QWORD *)(v0 + 72) = sub_23B9287E0(v22, v23, &v44);
    sub_23B9585A4();
    swift_bridgeObjectRelease();
    *(_WORD *)(v18 + 12) = 2082;
    v38(v16, v15, v17);
    v24 = *(void (**)(uint64_t, uint64_t))(v37 + 8);
    v24(v15, v17);
    Message.description.getter(v17);
    v26 = v25;
    v28 = v27;
    v24(v16, v17);
    *(_QWORD *)(v0 + 80) = sub_23B9287E0(v26, v28, &v44);
    sub_23B9585A4();
    swift_bridgeObjectRelease();
    *(_WORD *)(v18 + 22) = 2082;
    sub_23B92F2B8(&qword_256A55510, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAB8]);
    v29 = sub_23B9587F0();
    *(_QWORD *)(v0 + 88) = sub_23B9287E0(v29, v30, &v44);
    sub_23B9585A4();
    swift_bridgeObjectRelease();
    sub_23B92F33C(v39, (uint64_t (*)(_QWORD))type metadata accessor for MessagingOptions);
    *(_WORD *)(v18 + 32) = 2114;
    v31 = v14;
    v32 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v0 + 96) = v32;
    sub_23B9585A4();
    *v40 = v32;

    _os_log_impl(&dword_23B916000, log, type, "%{public}s: Failed to send message (resource) %{public}s. with identifier: %{public}s. Error: %{public}@.", (uint8_t *)v18, 0x2Au);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256A555C8);
    swift_arrayDestroy();
    MEMORY[0x242609864](v40, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x242609864](v42, -1, -1);
    MEMORY[0x242609864](v18, -1, -1);

  }
  else
  {
    v33 = *(_QWORD *)(v0 + 248);
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 192) + 8))(*(_QWORD *)(v0 + 208), *(_QWORD *)(v0 + 184));
    sub_23B92F33C(v33, (uint64_t (*)(_QWORD))type metadata accessor for MessagingOptions);

  }
  v34 = *(void **)(v0 + 312);
  v35 = *(_QWORD *)(v0 + 112);
  *(_QWORD *)(v0 + 64) = v34;
  sub_23B958178();
  swift_beginAccess();
  sub_23B945D2C(v35);
  swift_endAccess();
  swift_release();

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t InternetMessaging.send(message:metadata:messageOptions:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v5[12] = a4;
  v5[13] = v4;
  v5[10] = a2;
  v5[11] = a3;
  v5[9] = a1;
  v5[14] = *v4;
  v6 = *v4;
  v5[15] = type metadata accessor for MessagingOptions();
  v5[16] = swift_task_alloc();
  v5[17] = swift_task_alloc();
  v8 = type metadata accessor for Message(0, *(_QWORD *)(v6 + 80), *(_QWORD *)(v6 + 88), v7);
  v5[18] = v8;
  v5[19] = *(_QWORD *)(v8 - 8);
  v5[20] = swift_task_alloc();
  v5[21] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23B91EEB8()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  os_log_type_t v26;
  _BOOL4 v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  void (*v36)(uint64_t, uint64_t);
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  uint64_t v41;
  unint64_t v42;
  unint64_t v43;
  uint64_t v44;
  unint64_t v45;
  uint64_t v46;
  NSObject *v47;
  os_log_type_t v48;
  _BOOL4 v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  unint64_t v56;
  uint64_t v57;
  unint64_t v58;
  unint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  __int128 v63;
  _QWORD *v64;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  os_log_type_t type;
  NSObject *log;
  void (*v72)(uint64_t, uint64_t, uint64_t);
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  _QWORD *v76;
  uint64_t v77;
  unint64_t v78;

  v1 = v0[15];
  v2 = v0[12];
  v3 = *(_QWORD *)(v2 + *(int *)(v1 + 20));
  v4 = *(_QWORD *)(v3 + 16);
  v5 = MEMORY[0x24BEE4AF8];
  if (v4)
  {
    v77 = MEMORY[0x24BEE4AF8];
    swift_bridgeObjectRetain();
    sub_23B928E3C(0, v4, 0);
    v6 = 0;
    v5 = v77;
    v7 = *(_QWORD *)(v77 + 16);
    v8 = 16 * v7;
    v9 = v3;
    do
    {
      v11 = *(_QWORD *)(v9 + v6 + 40);
      v10 = *(_QWORD *)(v9 + v6 + 48);
      v77 = v5;
      v12 = *(_QWORD *)(v5 + 24);
      swift_bridgeObjectRetain();
      if (v7 >= v12 >> 1)
      {
        sub_23B928E3C(v12 > 1, v7 + 1, 1);
        v5 = v77;
      }
      *(_QWORD *)(v5 + 16) = v7 + 1;
      v13 = v5 + v8;
      *(_QWORD *)(v13 + 32) = v11;
      *(_QWORD *)(v13 + 40) = v10;
      v8 += 16;
      v6 += 24;
      ++v7;
      --v4;
    }
    while (v4);
    swift_bridgeObjectRelease();
    v0 = v76;
    v1 = v76[15];
    v2 = v76[12];
  }
  v14 = sub_23B92D448(v5);
  v0[22] = v14;
  swift_bridgeObjectRelease();
  v15 = 0x6F707365722F7728;
  if (!*(_BYTE *)(v2 + *(int *)(v1 + 24)))
    v15 = 0;
  v16 = 0xE000000000000000;
  if (*(_BYTE *)(v2 + *(int *)(v1 + 24)))
    v16 = 0xED0000202965736ELL;
  v77 = v15;
  v78 = v16;
  sub_23B958400();
  swift_bridgeObjectRelease();
  v17 = v78;
  v73 = v77;
  if (qword_254309BF0 != -1)
    swift_once();
  v18 = v0[21];
  v20 = v0[18];
  v19 = v0[19];
  v21 = v0[17];
  v22 = v0[12];
  v23 = v0[10];
  v24 = sub_23B95831C();
  __swift_project_value_buffer(v24, (uint64_t)qword_254309BD8);
  v72 = *(void (**)(uint64_t, uint64_t, uint64_t))(v19 + 16);
  v72(v18, v23, v20);
  sub_23B92F2F8(v22, v21, (uint64_t (*)(_QWORD))type metadata accessor for MessagingOptions);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain();
  v25 = sub_23B958304();
  v26 = sub_23B958568();
  v27 = os_log_type_enabled(v25, v26);
  v28 = v0[21];
  v75 = v14;
  if (v27)
  {
    log = v25;
    v29 = v0[18];
    v66 = v0[20];
    v67 = v0[19];
    v68 = v0[17];
    type = v26;
    v30 = swift_slowAlloc();
    v69 = swift_slowAlloc();
    v77 = v69;
    *(_DWORD *)v30 = 136316162;
    v34 = sub_23B91B910(v69, v31, v32, v33);
    v76[4] = sub_23B9287E0(v34, v35, &v77);
    sub_23B9585A4();
    swift_bridgeObjectRelease();
    *(_WORD *)(v30 + 12) = 2082;
    swift_bridgeObjectRetain();
    v76[5] = sub_23B9287E0(v73, v17, &v77);
    sub_23B9585A4();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v30 + 22) = 2082;
    v72(v66, v28, v29);
    v36 = *(void (**)(uint64_t, uint64_t))(v67 + 8);
    v36(v28, v29);
    Message.description.getter(v29);
    v38 = v37;
    v40 = v39;
    v36(v66, v29);
    v76[6] = sub_23B9287E0(v38, v40, &v77);
    sub_23B9585A4();
    swift_bridgeObjectRelease();
    *(_WORD *)(v30 + 32) = 2080;
    swift_bridgeObjectRetain();
    v41 = sub_23B958514();
    v43 = v42;
    swift_bridgeObjectRelease();
    v76[7] = sub_23B9287E0(v41, v43, &v77);
    sub_23B9585A4();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v30 + 42) = 2082;
    sub_23B9582F8();
    sub_23B92F2B8(&qword_256A55510, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAB8]);
    v44 = sub_23B9587F0();
    v76[8] = sub_23B9287E0(v44, v45, &v77);
    sub_23B9585A4();
    swift_bridgeObjectRelease();
    sub_23B92F33C(v68, (uint64_t (*)(_QWORD))type metadata accessor for MessagingOptions);
    _os_log_impl(&dword_23B916000, log, type, "%s: Sending (resource) %{public}s: %{public}s to %s with identifier: %{public}s", (uint8_t *)v30, 0x34u);
    swift_arrayDestroy();
    MEMORY[0x242609864](v69, -1, -1);
    v0 = v76;
    MEMORY[0x242609864](v30, -1, -1);

  }
  else
  {
    v46 = v0[17];
    (*(void (**)(uint64_t, _QWORD))(v0[19] + 8))(v28, v0[18]);
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    sub_23B92F33C(v46, (uint64_t (*)(_QWORD))type metadata accessor for MessagingOptions);

  }
  sub_23B92F2F8(v0[12], v0[16], (uint64_t (*)(_QWORD))type metadata accessor for MessagingOptions);
  v47 = sub_23B958304();
  v48 = sub_23B958568();
  v49 = os_log_type_enabled(v47, v48);
  v50 = v0[16];
  if (v49)
  {
    v51 = swift_slowAlloc();
    v74 = swift_slowAlloc();
    v77 = v74;
    *(_DWORD *)v51 = 136446466;
    v55 = sub_23B91B910(v74, v52, v53, v54);
    v0[2] = sub_23B9287E0(v55, v56, &v77);
    sub_23B9585A4();
    swift_bridgeObjectRelease();
    *(_WORD *)(v51 + 12) = 2080;
    MessagingOptions.dictionaryValue.getter();
    v57 = sub_23B958358();
    v59 = v58;
    swift_bridgeObjectRelease();
    v76[3] = sub_23B9287E0(v57, v59, &v77);
    sub_23B9585A4();
    v0 = v76;
    swift_bridgeObjectRelease();
    sub_23B92F33C(v50, (uint64_t (*)(_QWORD))type metadata accessor for MessagingOptions);
    _os_log_impl(&dword_23B916000, v47, v48, "%{public}s: IDSSendMessageOptions: %s", (uint8_t *)v51, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x242609864](v74, -1, -1);
    MEMORY[0x242609864](v51, -1, -1);
  }
  else
  {
    sub_23B92F33C(v0[16], (uint64_t (*)(_QWORD))type metadata accessor for MessagingOptions);
  }

  v60 = v0[12];
  v61 = v0[13];
  v62 = swift_task_alloc();
  v0[23] = v62;
  v63 = *((_OWORD *)v0 + 5);
  *(_QWORD *)(v62 + 16) = v61;
  *(_OWORD *)(v62 + 24) = v63;
  *(_QWORD *)(v62 + 40) = v60;
  *(_QWORD *)(v62 + 48) = v75;
  v64 = (_QWORD *)swift_task_alloc();
  v0[24] = v64;
  sub_23B9582F8();
  *v64 = v0;
  v64[1] = sub_23B91F6C0;
  return sub_23B95819C();
}

uint64_t sub_23B91F6C0()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 200) = v0;
  swift_task_dealloc();
  if (v0)
    return swift_task_switch();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_23B91F780()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23B91F7F4(uint64_t a1, _QWORD *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  _QWORD *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;

  v35 = a1;
  v36 = a6;
  v29 = a3;
  v30 = a5;
  v33 = a2;
  v34 = a4;
  v6 = *a2;
  v7 = *(_QWORD *)(type metadata accessor for MessagingOptions() - 8);
  v8 = *(_QWORD *)(v7 + 64);
  MEMORY[0x24BDAC7A8]();
  v28 = (uint64_t)&v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *(_QWORD *)(v6 + 80);
  v32 = *(_QWORD *)(v6 + 88);
  v11 = type metadata accessor for Message(0, v9, v32, v10);
  v12 = *(_QWORD *)(v11 - 8);
  v13 = *(_QWORD *)(v12 + 64);
  MEMORY[0x24BDAC7A8]();
  v15 = (char *)&v27 - v14;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254309C80);
  MEMORY[0x24BDAC7A8]();
  v17 = (char *)&v27 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v31 = v17;
  v18 = sub_23B9584F0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56))(v17, 1, 1, v18);
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v15, v29, v11);
  sub_23B92F2F8(v30, (uint64_t)&v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(_QWORD))type metadata accessor for MessagingOptions);
  v19 = (*(unsigned __int8 *)(v12 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
  v20 = (v13 + v19 + 7) & 0xFFFFFFFFFFFFFFF8;
  v21 = (*(unsigned __int8 *)(v7 + 80) + v20 + 8) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  v22 = (v8 + v21 + 7) & 0xFFFFFFFFFFFFFFF8;
  v23 = (char *)swift_allocObject();
  *((_QWORD *)v23 + 2) = 0;
  *((_QWORD *)v23 + 3) = 0;
  v24 = v32;
  *((_QWORD *)v23 + 4) = v9;
  *((_QWORD *)v23 + 5) = v24;
  *((_QWORD *)v23 + 6) = v33;
  (*(void (**)(char *, char *, uint64_t))(v12 + 32))(&v23[v19], v15, v11);
  *(_QWORD *)&v23[v20] = v34;
  sub_23B92F378(v28, (uint64_t)&v23[v21], (uint64_t (*)(_QWORD))type metadata accessor for MessagingOptions);
  v25 = v35;
  *(_QWORD *)&v23[v22] = v36;
  *(_QWORD *)&v23[(v22 + 15) & 0xFFFFFFFFFFFFFFF8] = v25;
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  sub_23B94CA58((uint64_t)v31, (uint64_t)&unk_256A55690, (uint64_t)v23);
  return swift_release();
}

uint64_t sub_23B91FA2C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  _QWORD *v13;
  uint64_t v15;

  v13 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v8 + 16) = v13;
  *v13 = v8;
  v13[1] = sub_23B930844;
  return sub_23B91FAB4(a5, a6, a7, a8, v15);
}

uint64_t sub_23B91FAB4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t *v5;
  _QWORD *v6;
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

  v6[18] = a5;
  v6[19] = v5;
  v6[16] = a3;
  v6[17] = a4;
  v6[14] = a1;
  v6[15] = a2;
  v6[20] = *v5;
  v7 = *v5;
  v8 = *(_QWORD *)(*v5 + 80);
  v6[21] = v8;
  v9 = *(_QWORD *)(v7 + 88);
  v6[22] = v9;
  v10 = type metadata accessor for Message(0, v8, v9, a4);
  v6[23] = v10;
  v11 = *(_QWORD *)(v10 - 8);
  v6[24] = v11;
  v6[25] = *(_QWORD *)(v11 + 64);
  v6[26] = swift_task_alloc();
  v6[27] = swift_task_alloc();
  v12 = type metadata accessor for MessagingOptions();
  v6[28] = v12;
  v13 = *(_QWORD *)(v12 - 8);
  v6[29] = v13;
  v6[30] = *(_QWORD *)(v13 + 64);
  v6[31] = swift_task_alloc();
  v6[32] = swift_task_alloc();
  v14 = sub_23B9582F8();
  v6[33] = v14;
  v6[34] = *(_QWORD *)(v14 - 8);
  v6[35] = swift_task_alloc();
  v15 = sub_23B95825C();
  v6[36] = v15;
  v16 = *(_QWORD *)(v15 - 8);
  v6[37] = v16;
  v6[38] = *(_QWORD *)(v16 + 64);
  v6[39] = swift_task_alloc();
  v6[40] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23B91FC20()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSString *v5;
  void (*v6)(uint64_t, uint64_t);
  void (*v7)(uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  __int128 v32;
  uint64_t v33;
  uint64_t v34;
  os_log_t log;
  os_log_type_t type[8];
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;

  v1 = *(_QWORD *)(v0 + 312);
  v37 = *(_QWORD *)(v0 + 296);
  v2 = *(_QWORD *)(v0 + 280);
  v4 = *(_QWORD *)(v0 + 264);
  v3 = *(_QWORD *)(v0 + 272);
  v39 = *(_QWORD *)(v0 + 288);
  v41 = *(_QWORD *)(v0 + 184);
  v5 = NSTemporaryDirectory();
  sub_23B9583DC();

  sub_23B95822C();
  swift_bridgeObjectRelease();
  sub_23B9582EC();
  sub_23B9582D4();
  v6 = *(void (**)(uint64_t, uint64_t))(v3 + 8);
  v6(v2, v4);
  sub_23B958244();
  swift_bridgeObjectRelease();
  v7 = *(void (**)(uint64_t, uint64_t))(v37 + 8);
  *(_QWORD *)(v0 + 328) = v7;
  v7(v1, v39);
  sub_23B958214();
  swift_allocObject();
  sub_23B958208();
  MEMORY[0x2426097B0](&protocol conformance descriptor for Message<A>, v41);
  *(_QWORD *)(v0 + 336) = sub_23B9581F0();
  *(_QWORD *)(v0 + 344) = v8;
  swift_release();
  sub_23B95828C();
  v26 = *(_QWORD *)(v0 + 312);
  v27 = *(_QWORD *)(v0 + 320);
  v29 = *(_QWORD *)(v0 + 304);
  v9 = *(_QWORD *)(v0 + 288);
  *(_QWORD *)type = *(_QWORD *)(v0 + 296);
  v24 = v9;
  v10 = *(_QWORD *)(v0 + 280);
  v11 = *(_QWORD *)(v0 + 264);
  v42 = *(_QWORD *)(v0 + 256);
  v31 = *(_QWORD *)(v0 + 240);
  v28 = *(_QWORD *)(v0 + 232);
  v40 = *(_QWORD *)(v0 + 216);
  v30 = *(_QWORD *)(v0 + 200);
  v38 = *(_QWORD *)(v0 + 192);
  v43 = *(_QWORD *)(v0 + 184);
  v12 = *(_QWORD *)(v0 + 152);
  v13 = *(_QWORD *)(v0 + 144);
  v34 = *(_QWORD *)(v0 + 136);
  log = *(os_log_t *)(v0 + 160);
  v14 = *(_QWORD *)(v0 + 128);
  v33 = *(_QWORD *)(v0 + 120);
  v25 = *(_QWORD *)(v0 + 112);
  v32 = *(_OWORD *)(v0 + 168);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 + 272) + 16))(v10, v14, v11);
  swift_beginAccess();
  swift_retain();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v44 = *(_QWORD *)(v12 + 152);
  *(_QWORD *)(v12 + 152) = 0x8000000000000000;
  sub_23B936920(v13, v10, isUniquelyReferenced_nonNull_native);
  *(_QWORD *)(v12 + 152) = v44;
  swift_bridgeObjectRelease();
  v6(v10, v11);
  swift_endAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)type + 16))(v26, v27, v9);
  sub_23B92F2F8(v14, v42, (uint64_t (*)(_QWORD))type metadata accessor for MessagingOptions);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v38 + 16))(v40, v25, v43);
  v16 = (*(unsigned __int8 *)(*(_QWORD *)type + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)type + 80);
  v17 = (v29 + v16 + 7) & 0xFFFFFFFFFFFFFFF8;
  v18 = (v17 + 15) & 0xFFFFFFFFFFFFFFF8;
  v19 = (*(unsigned __int8 *)(v28 + 80) + v18 + 8) & ~(unint64_t)*(unsigned __int8 *)(v28 + 80);
  v20 = (v31 + *(unsigned __int8 *)(v38 + 80) + v19) & ~(unint64_t)*(unsigned __int8 *)(v38 + 80);
  v21 = swift_allocObject();
  *(_QWORD *)(v0 + 352) = v21;
  *(_OWORD *)(v21 + 16) = v32;
  *(_QWORD *)(v21 + 32) = v12;
  (*(void (**)(unint64_t, uint64_t, uint64_t))(*(_QWORD *)type + 32))(v21 + v16, v26, v24);
  *(_QWORD *)(v21 + v17) = v33;
  *(_QWORD *)(v21 + v18) = v34;
  sub_23B92F378(v42, v21 + v19, (uint64_t (*)(_QWORD))type metadata accessor for MessagingOptions);
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v38 + 32))(v21 + v20, v40, v43);
  *(_QWORD *)(v21 + ((v30 + v20 + 7) & 0xFFFFFFFFFFFFFFF8)) = log;
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v22 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 360) = v22;
  *v22 = v0;
  v22[1] = sub_23B92059C;
  return sub_23B958160();
}

uint64_t sub_23B92059C()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 368) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_release();
  return swift_task_switch();
}

uint64_t sub_23B92065C()
{
  uint64_t v0;
  id v1;
  void *v2;
  unsigned int v3;
  void *v4;
  id v5;
  id v6;
  void *v7;

  sub_23B92D4DC(*(_QWORD *)(v0 + 336), *(_QWORD *)(v0 + 344));
  v1 = objc_msgSend((id)objc_opt_self(), sel_defaultManager);
  v2 = (void *)sub_23B958238();
  *(_QWORD *)(v0 + 64) = 0;
  v3 = objc_msgSend(v1, sel_removeItemAtURL_error_, v2, v0 + 64);

  v4 = *(void **)(v0 + 64);
  if (v3)
  {
    v5 = v4;
  }
  else
  {
    v6 = v4;
    v7 = (void *)sub_23B958220();

    swift_willThrow();
  }
  (*(void (**)(_QWORD, _QWORD))(v0 + 328))(*(_QWORD *)(v0 + 320), *(_QWORD *)(v0 + 288));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23B9207B8()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t, uint64_t);
  id v10;
  id v11;
  NSObject *v12;
  os_log_type_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  void (*v23)(uint64_t, uint64_t);
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  unint64_t v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  void *v35;
  unsigned __int8 v36;
  void *v37;
  id v38;
  id v39;
  void *v40;
  void (*v42)(uint64_t, uint64_t, uint64_t);
  uint64_t v43;
  uint64_t v44;
  _QWORD *v45;
  os_log_type_t type;
  NSObject *log;
  uint64_t v48;
  uint64_t v49[2];

  v49[1] = *MEMORY[0x24BDAC8D0];
  sub_23B92D4DC(*(_QWORD *)(v0 + 336), *(_QWORD *)(v0 + 344));
  swift_release();
  v1 = *(void **)(v0 + 368);
  if (qword_254309BF0 != -1)
    swift_once();
  v2 = *(_QWORD *)(v0 + 112);
  v3 = *(_QWORD *)(v0 + 248);
  v4 = *(_QWORD *)(v0 + 208);
  v5 = *(_QWORD *)(v0 + 184);
  v6 = *(_QWORD *)(v0 + 192);
  v7 = *(_QWORD *)(v0 + 128);
  v8 = sub_23B95831C();
  __swift_project_value_buffer(v8, (uint64_t)qword_254309BD8);
  v9 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16);
  v9(v4, v2, v5);
  sub_23B92F2F8(v7, v3, (uint64_t (*)(_QWORD))type metadata accessor for MessagingOptions);
  v10 = v1;
  v11 = v1;
  v12 = sub_23B958304();
  v13 = sub_23B958568();
  if (os_log_type_enabled(v12, v13))
  {
    v44 = *(_QWORD *)(v0 + 248);
    log = v12;
    v14 = *(_QWORD *)(v0 + 208);
    v15 = *(_QWORD *)(v0 + 216);
    v42 = v9;
    v43 = *(_QWORD *)(v0 + 192);
    v16 = *(_QWORD *)(v0 + 184);
    type = v13;
    v17 = swift_slowAlloc();
    v45 = (_QWORD *)swift_slowAlloc();
    v48 = swift_slowAlloc();
    v49[0] = v48;
    *(_DWORD *)v17 = 136446978;
    v21 = sub_23B91B910(v48, v18, v19, v20);
    *(_QWORD *)(v0 + 72) = sub_23B9287E0(v21, v22, v49);
    sub_23B9585A4();
    swift_bridgeObjectRelease();
    *(_WORD *)(v17 + 12) = 2082;
    v42(v15, v14, v16);
    v23 = *(void (**)(uint64_t, uint64_t))(v43 + 8);
    v23(v14, v16);
    Message.description.getter(v16);
    v25 = v24;
    v27 = v26;
    v23(v15, v16);
    *(_QWORD *)(v0 + 104) = sub_23B9287E0(v25, v27, v49);
    sub_23B9585A4();
    swift_bridgeObjectRelease();
    *(_WORD *)(v17 + 22) = 2082;
    sub_23B92F2B8(&qword_256A55510, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAB8]);
    v28 = sub_23B9587F0();
    *(_QWORD *)(v0 + 88) = sub_23B9287E0(v28, v29, v49);
    sub_23B9585A4();
    swift_bridgeObjectRelease();
    sub_23B92F33C(v44, (uint64_t (*)(_QWORD))type metadata accessor for MessagingOptions);
    *(_WORD *)(v17 + 32) = 2114;
    v30 = v1;
    v31 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v0 + 96) = v31;
    sub_23B9585A4();
    *v45 = v31;

    _os_log_impl(&dword_23B916000, log, type, "%{public}s: Failed to send message (resource) %{public}s. with identifier: %{public}s. Error: %{public}@.", (uint8_t *)v17, 0x2Au);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256A555C8);
    swift_arrayDestroy();
    MEMORY[0x242609864](v45, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x242609864](v48, -1, -1);
    MEMORY[0x242609864](v17, -1, -1);

  }
  else
  {
    v32 = *(_QWORD *)(v0 + 248);
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 192) + 8))(*(_QWORD *)(v0 + 208), *(_QWORD *)(v0 + 184));
    sub_23B92F33C(v32, (uint64_t (*)(_QWORD))type metadata accessor for MessagingOptions);

  }
  v33 = *(_QWORD *)(v0 + 128);
  *(_QWORD *)(v0 + 80) = v1;
  sub_23B958178();
  swift_beginAccess();
  sub_23B945D2C(v33);
  swift_endAccess();
  swift_release();

  v34 = objc_msgSend((id)objc_opt_self(), sel_defaultManager);
  v35 = (void *)sub_23B958238();
  *(_QWORD *)(v0 + 64) = 0;
  v36 = objc_msgSend(v34, sel_removeItemAtURL_error_, v35, v0 + 64);

  v37 = *(void **)(v0 + 64);
  if ((v36 & 1) != 0)
  {
    v38 = v37;
  }
  else
  {
    v39 = v37;
    v40 = (void *)sub_23B958220();

    swift_willThrow();
  }
  (*(void (**)(_QWORD, _QWORD))(v0 + 328))(*(_QWORD *)(v0 + 320), *(_QWORD *)(v0 + 288));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t InternetMessaging.sendWithResponse(message:messageOptions:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v5;

  v5[5] = a4;
  v5[6] = v4;
  v5[3] = a2;
  v5[4] = a3;
  v5[2] = a1;
  v5[7] = type metadata accessor for Message(255, *(_QWORD *)(*(_QWORD *)v4 + 80), *(_QWORD *)(*(_QWORD *)v4 + 88), a4);
  type metadata accessor for MessageContext();
  v5[8] = swift_getTupleTypeMetadata2();
  v5[9] = swift_task_alloc();
  v5[10] = type metadata accessor for MessagingOptions();
  v5[11] = swift_task_alloc();
  v5[12] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23B920DE0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  _BYTE *v11;
  uint64_t v12;

  v1 = *(_QWORD *)(v0 + 88);
  v2 = *(_QWORD *)(v0 + 96);
  v3 = *(_QWORD *)(v0 + 80);
  sub_23B92F2F8(*(_QWORD *)(v0 + 40), v2, (uint64_t (*)(_QWORD))type metadata accessor for MessagingOptions);
  *(_BYTE *)(v2 + *(int *)(v3 + 24)) = 1;
  sub_23B92F2F8(v2, v1, (uint64_t (*)(_QWORD))type metadata accessor for MessagingOptions);
  v4 = *(_QWORD *)(v1 + *(int *)(v3 + 20));
  if (*(_QWORD *)(v4 + 16) == 1 && *(unsigned __int8 *)(v4 + 32) - 2 <= 2)
  {
    v5 = *(_QWORD *)(v0 + 88);
    v6 = *(_QWORD *)(v0 + 48);
    v7 = *(_QWORD *)(v0 + 32);
    v8 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 104) = v8;
    v8[2] = v6;
    v8[3] = v7;
    v8[4] = v5;
    v9 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 112) = v9;
    *v9 = v0;
    v9[1] = sub_23B920F70;
    return sub_23B95819C();
  }
  else
  {
    sub_23B91AC50();
    swift_allocError();
    *v11 = 1;
    swift_willThrow();
    v12 = *(_QWORD *)(v0 + 88);
    sub_23B92F33C(*(_QWORD *)(v0 + 96), (uint64_t (*)(_QWORD))type metadata accessor for MessagingOptions);
    sub_23B92F33C(v12, (uint64_t (*)(_QWORD))type metadata accessor for MessagingOptions);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_23B920F70()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 120) = v0;
  swift_task_dealloc();
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23B920FE4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v1 = *(_QWORD *)(v0 + 88);
  v3 = *(_QWORD *)(v0 + 64);
  v2 = *(_QWORD *)(v0 + 72);
  v4 = *(_QWORD *)(v0 + 56);
  v6 = *(_QWORD *)(v0 + 16);
  v5 = *(_QWORD *)(v0 + 24);
  sub_23B92F33C(*(_QWORD *)(v0 + 96), (uint64_t (*)(_QWORD))type metadata accessor for MessagingOptions);
  sub_23B92F33C(v1, (uint64_t (*)(_QWORD))type metadata accessor for MessagingOptions);
  v7 = v2 + *(int *)(v3 + 48);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(v6, v2, v4);
  sub_23B92F378(v7, v5, (uint64_t (*)(_QWORD))type metadata accessor for MessageContext);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23B9210A4()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 88);
  sub_23B92F33C(*(_QWORD *)(v0 + 96), (uint64_t (*)(_QWORD))type metadata accessor for MessagingOptions);
  sub_23B92F33C(v1, (uint64_t (*)(_QWORD))type metadata accessor for MessagingOptions);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23B921120(uint64_t a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  char *v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  uint64_t v26;

  v22 = a3;
  v23 = a4;
  v25 = a2;
  v26 = a1;
  v4 = *a2;
  v5 = *(_QWORD *)(type metadata accessor for MessagingOptions() - 8);
  v6 = *(_QWORD *)(v5 + 64);
  MEMORY[0x24BDAC7A8]();
  v7 = *(_QWORD *)(v4 + 88);
  v24 = *(_QWORD *)(v4 + 80);
  v9 = type metadata accessor for Message(0, v24, v7, v8);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(_QWORD *)(v10 + 64);
  MEMORY[0x24BDAC7A8]();
  v13 = (char *)&v21 - v12;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254309C80);
  MEMORY[0x24BDAC7A8]();
  v15 = (char *)&v21 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = sub_23B9584F0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(v15, 1, 1, v16);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v13, v22, v9);
  sub_23B92F2F8(v23, (uint64_t)&v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(_QWORD))type metadata accessor for MessagingOptions);
  v17 = (*(unsigned __int8 *)(v10 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v18 = (v11 + *(unsigned __int8 *)(v5 + 80) + v17) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  v19 = (char *)swift_allocObject();
  *((_QWORD *)v19 + 2) = 0;
  *((_QWORD *)v19 + 3) = 0;
  *((_QWORD *)v19 + 4) = v24;
  *((_QWORD *)v19 + 5) = v7;
  *((_QWORD *)v19 + 6) = v25;
  (*(void (**)(char *, char *, uint64_t))(v10 + 32))(&v19[v17], v13, v9);
  sub_23B92F378((uint64_t)&v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t)&v19[v18], (uint64_t (*)(_QWORD))type metadata accessor for MessagingOptions);
  *(_QWORD *)&v19[(v6 + v18 + 7) & 0xFFFFFFFFFFFFFFF8] = v26;
  swift_retain();
  swift_retain();
  sub_23B94CA58((uint64_t)v15, (uint64_t)&unk_256A55668, (uint64_t)v19);
  return swift_release();
}

uint64_t sub_23B92131C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  _QWORD *v11;

  v11 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v7 + 16) = v11;
  *v11 = v7;
  v11[1] = sub_23B930844;
  return sub_23B921388(a5, a6, a7);
}

uint64_t sub_23B921388(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v4[17] = a3;
  v4[18] = v3;
  v4[15] = a1;
  v4[16] = a2;
  v4[19] = *v3;
  v5 = *v3;
  v6 = type metadata accessor for MessagingOptions();
  v4[20] = v6;
  v7 = *(_QWORD *)(v6 - 8);
  v4[21] = v7;
  v4[22] = *(_QWORD *)(v7 + 64);
  v4[23] = swift_task_alloc();
  v4[24] = swift_task_alloc();
  v8 = *(_QWORD *)(v5 + 80);
  v4[25] = v8;
  v9 = *(_QWORD *)(v5 + 88);
  v4[26] = v9;
  v11 = type metadata accessor for Message(0, v8, v9, v10);
  v4[27] = v11;
  v12 = *(_QWORD *)(v11 - 8);
  v4[28] = v12;
  v4[29] = *(_QWORD *)(v12 + 64);
  v4[30] = swift_task_alloc();
  v4[31] = swift_task_alloc();
  v13 = sub_23B9582F8();
  v4[32] = v13;
  v4[33] = *(_QWORD *)(v13 - 8);
  v4[34] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23B921488()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t, uint64_t);
  void (*v7)(uint64_t, uint64_t, uint64_t);
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  uint64_t v21;
  uint64_t v22;

  v1 = *(_QWORD *)(v0 + 272);
  v2 = *(_QWORD *)(v0 + 256);
  v3 = *(_QWORD *)(v0 + 216);
  v14 = *(_QWORD *)(v0 + 224);
  v15 = *(_QWORD *)(v0 + 248);
  v18 = *(_QWORD *)(v0 + 176);
  v19 = *(_QWORD *)(v0 + 232);
  v16 = *(_QWORD *)(v0 + 192);
  v17 = *(_QWORD *)(v0 + 168);
  v4 = *(_QWORD *)(v0 + 136);
  v21 = *(_QWORD *)(v0 + 144);
  v22 = *(_QWORD *)(v0 + 152);
  v5 = *(_QWORD *)(v0 + 128);
  v13 = *(_QWORD *)(v0 + 120);
  v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 + 264) + 16);
  *(_QWORD *)(v0 + 280) = v6;
  v20 = *(_OWORD *)(v0 + 200);
  v6(v1, v5, v2);
  *(_QWORD *)(v0 + 80) = v4;
  swift_beginAccess();
  type metadata accessor for MessageContext();
  swift_retain();
  swift_getTupleTypeMetadata2();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254309C90);
  sub_23B958190();
  sub_23B92F2B8((unint64_t *)&qword_254309B00, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
  *(_QWORD *)(v0 + 288) = sub_23B95837C();
  sub_23B958394();
  swift_endAccess();
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v14 + 16);
  *(_QWORD *)(v0 + 296) = v7;
  v7(v15, v13, v3);
  sub_23B92F2F8(v5, v16, (uint64_t (*)(_QWORD))type metadata accessor for MessagingOptions);
  v8 = (*(unsigned __int8 *)(v14 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80);
  v9 = (v19 + *(unsigned __int8 *)(v17 + 80) + v8) & ~(unint64_t)*(unsigned __int8 *)(v17 + 80);
  v10 = swift_allocObject();
  *(_QWORD *)(v0 + 304) = v10;
  *(_OWORD *)(v10 + 16) = v20;
  *(_QWORD *)(v10 + 32) = v21;
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v14 + 32))(v10 + v8, v15, v3);
  sub_23B92F378(v16, v10 + v9, (uint64_t (*)(_QWORD))type metadata accessor for MessagingOptions);
  *(_QWORD *)(v10 + ((v18 + v9 + 7) & 0xFFFFFFFFFFFFFFF8)) = v22;
  swift_retain();
  v11 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 312) = v11;
  *v11 = v0;
  v11[1] = sub_23B921724;
  return sub_23B958160();
}

uint64_t sub_23B921724()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 320) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_release();
  return swift_task_switch();
}

uint64_t sub_23B921798()
{
  uint64_t v0;

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23B9217F8()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  void (*v3)(uint64_t, uint64_t, uint64_t);
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;
  NSObject *v11;
  os_log_type_t v12;
  _BOOL4 v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  void (*v24)(uint64_t, uint64_t);
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  unint64_t v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void (*v35)(uint64_t, uint64_t, uint64_t);
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v40;
  void (*v41)(uint64_t, uint64_t, uint64_t);
  uint64_t v42;
  _QWORD *v43;
  os_log_type_t type;
  uint64_t v45;
  NSObject *log;
  uint64_t v47;

  swift_release();
  if (qword_254309BF0 != -1)
    swift_once();
  v1 = *(_QWORD *)(v0 + 120);
  v2 = *(void **)(v0 + 320);
  v3 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 296);
  v4 = *(_QWORD *)(v0 + 240);
  v5 = *(_QWORD *)(v0 + 216);
  v6 = *(_QWORD *)(v0 + 184);
  v7 = *(_QWORD *)(v0 + 128);
  v8 = sub_23B95831C();
  __swift_project_value_buffer(v8, (uint64_t)qword_254309BD8);
  v3(v4, v1, v5);
  sub_23B92F2F8(v7, v6, (uint64_t (*)(_QWORD))type metadata accessor for MessagingOptions);
  v9 = v2;
  v10 = v2;
  v11 = sub_23B958304();
  v12 = sub_23B958568();
  v13 = os_log_type_enabled(v11, v12);
  v14 = *(void **)(v0 + 320);
  if (v13)
  {
    log = v11;
    v41 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 296);
    v15 = *(_QWORD *)(v0 + 248);
    v16 = *(_QWORD *)(v0 + 240);
    v17 = *(_QWORD *)(v0 + 216);
    v40 = *(_QWORD *)(v0 + 224);
    v42 = *(_QWORD *)(v0 + 184);
    type = v12;
    v18 = swift_slowAlloc();
    v43 = (_QWORD *)swift_slowAlloc();
    v45 = swift_slowAlloc();
    v47 = v45;
    *(_DWORD *)v18 = 136446978;
    v22 = sub_23B91B910(v45, v19, v20, v21);
    *(_QWORD *)(v0 + 88) = sub_23B9287E0(v22, v23, &v47);
    sub_23B9585A4();
    swift_bridgeObjectRelease();
    *(_WORD *)(v18 + 12) = 2082;
    v41(v15, v16, v17);
    v24 = *(void (**)(uint64_t, uint64_t))(v40 + 8);
    v24(v16, v17);
    Message.description.getter(v17);
    v26 = v25;
    v28 = v27;
    v24(v15, v17);
    *(_QWORD *)(v0 + 96) = sub_23B9287E0(v26, v28, &v47);
    sub_23B9585A4();
    swift_bridgeObjectRelease();
    *(_WORD *)(v18 + 22) = 2082;
    sub_23B92F2B8(&qword_256A55510, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAB8]);
    v29 = sub_23B9587F0();
    *(_QWORD *)(v0 + 104) = sub_23B9287E0(v29, v30, &v47);
    sub_23B9585A4();
    swift_bridgeObjectRelease();
    sub_23B92F33C(v42, (uint64_t (*)(_QWORD))type metadata accessor for MessagingOptions);
    *(_WORD *)(v18 + 32) = 2114;
    v31 = v14;
    v32 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v0 + 112) = v32;
    sub_23B9585A4();
    *v43 = v32;

    _os_log_impl(&dword_23B916000, log, type, "%{public}s: Failed to send message (with response) %{public}s. with identifier: %{public}s. Error: %{public}@.", (uint8_t *)v18, 0x2Au);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256A555C8);
    swift_arrayDestroy();
    MEMORY[0x242609864](v43, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x242609864](v45, -1, -1);
    MEMORY[0x242609864](v18, -1, -1);

  }
  else
  {
    v33 = *(_QWORD *)(v0 + 184);
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 224) + 8))(*(_QWORD *)(v0 + 240), *(_QWORD *)(v0 + 216));
    sub_23B92F33C(v33, (uint64_t (*)(_QWORD))type metadata accessor for MessagingOptions);

  }
  v34 = *(void **)(v0 + 320);
  v35 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 280);
  v36 = *(_QWORD *)(v0 + 272);
  v37 = *(_QWORD *)(v0 + 256);
  v38 = *(_QWORD *)(v0 + 128);
  *(_QWORD *)(v0 + 64) = v34;
  sub_23B958178();
  v35(v36, v38, v37);
  *(_QWORD *)(v0 + 72) = 0;
  swift_beginAccess();
  sub_23B958394();
  swift_endAccess();

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t InternetMessaging.send(dictionary:messageOptions:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  _QWORD *v4;

  v4[9] = a3;
  v4[10] = v3;
  v4[7] = a1;
  v4[8] = a2;
  v4[11] = *v3;
  v4[12] = type metadata accessor for MessagingOptions();
  v4[13] = swift_task_alloc();
  v4[14] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23B921D04()
{
  uint64_t v0;
  uint64_t v1;
  int64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  _BOOL4 v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  unint64_t v29;
  NSObject *v30;
  os_log_type_t v31;
  _BOOL4 v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  unint64_t v41;
  unint64_t v42;
  uint64_t v43;
  uint64_t v44;
  __int128 v45;
  _QWORD *v46;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;

  v1 = *(_QWORD *)(*(_QWORD *)(v0 + 72) + *(int *)(*(_QWORD *)(v0 + 96) + 20));
  v2 = *(_QWORD *)(v1 + 16);
  v3 = MEMORY[0x24BEE4AF8];
  if (v2)
  {
    v51 = MEMORY[0x24BEE4AF8];
    swift_bridgeObjectRetain();
    sub_23B928E3C(0, v2, 0);
    v4 = 0;
    v3 = v51;
    v5 = *(_QWORD *)(v51 + 16);
    v6 = 16 * v5;
    do
    {
      v8 = *(_QWORD *)(v1 + v4 + 40);
      v7 = *(_QWORD *)(v1 + v4 + 48);
      v51 = v3;
      v9 = *(_QWORD *)(v3 + 24);
      swift_bridgeObjectRetain();
      if (v5 >= v9 >> 1)
      {
        sub_23B928E3C(v9 > 1, v5 + 1, 1);
        v3 = v51;
      }
      *(_QWORD *)(v3 + 16) = v5 + 1;
      v10 = v3 + v6;
      *(_QWORD *)(v10 + 32) = v8;
      *(_QWORD *)(v10 + 40) = v7;
      v6 += 16;
      v4 += 24;
      ++v5;
      --v2;
    }
    while (v2);
    swift_bridgeObjectRelease();
  }
  v11 = sub_23B92D448(v3);
  *(_QWORD *)(v50 + 120) = v11;
  swift_bridgeObjectRelease();
  if (qword_254309BF0 != -1)
    swift_once();
  v12 = *(_QWORD *)(v50 + 112);
  v13 = *(_QWORD *)(v50 + 72);
  v14 = sub_23B95831C();
  __swift_project_value_buffer(v14, (uint64_t)qword_254309BD8);
  sub_23B92F2F8(v13, v12, (uint64_t (*)(_QWORD))type metadata accessor for MessagingOptions);
  swift_bridgeObjectRetain_n();
  v15 = sub_23B958304();
  v16 = sub_23B958568();
  v17 = os_log_type_enabled(v15, v16);
  v18 = *(_QWORD *)(v50 + 112);
  if (v17)
  {
    v19 = swift_slowAlloc();
    v48 = swift_slowAlloc();
    v51 = v48;
    *(_DWORD *)v19 = 136315650;
    v23 = sub_23B91B910(v48, v20, v21, v22);
    *(_QWORD *)(v50 + 32) = sub_23B9287E0(v23, v24, &v51);
    sub_23B9585A4();
    swift_bridgeObjectRelease();
    *(_WORD *)(v19 + 12) = 2080;
    swift_bridgeObjectRetain();
    v25 = sub_23B958514();
    v27 = v26;
    swift_bridgeObjectRelease();
    *(_QWORD *)(v50 + 40) = sub_23B9287E0(v25, v27, &v51);
    sub_23B9585A4();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v19 + 22) = 2082;
    sub_23B9582F8();
    sub_23B92F2B8(&qword_256A55510, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAB8]);
    v28 = sub_23B9587F0();
    *(_QWORD *)(v50 + 48) = sub_23B9287E0(v28, v29, &v51);
    sub_23B9585A4();
    swift_bridgeObjectRelease();
    sub_23B92F33C(v18, (uint64_t (*)(_QWORD))type metadata accessor for MessagingOptions);
    _os_log_impl(&dword_23B916000, v15, v16, "%s: Sending raw dictionary to %s with identifier: %{public}s", (uint8_t *)v19, 0x20u);
    swift_arrayDestroy();
    MEMORY[0x242609864](v48, -1, -1);
    MEMORY[0x242609864](v19, -1, -1);

  }
  else
  {
    swift_bridgeObjectRelease_n();
    sub_23B92F33C(v18, (uint64_t (*)(_QWORD))type metadata accessor for MessagingOptions);

  }
  sub_23B92F2F8(*(_QWORD *)(v50 + 72), *(_QWORD *)(v50 + 104), (uint64_t (*)(_QWORD))type metadata accessor for MessagingOptions);
  v30 = sub_23B958304();
  v31 = sub_23B958568();
  v32 = os_log_type_enabled(v30, v31);
  v33 = *(_QWORD *)(v50 + 104);
  if (v32)
  {
    v34 = swift_slowAlloc();
    v49 = swift_slowAlloc();
    v51 = v49;
    *(_DWORD *)v34 = 136446466;
    v38 = sub_23B91B910(v49, v35, v36, v37);
    *(_QWORD *)(v50 + 16) = sub_23B9287E0(v38, v39, &v51);
    sub_23B9585A4();
    swift_bridgeObjectRelease();
    *(_WORD *)(v34 + 12) = 2080;
    MessagingOptions.dictionaryValue.getter();
    v40 = sub_23B958358();
    v42 = v41;
    swift_bridgeObjectRelease();
    *(_QWORD *)(v50 + 24) = sub_23B9287E0(v40, v42, &v51);
    sub_23B9585A4();
    swift_bridgeObjectRelease();
    sub_23B92F33C(v33, (uint64_t (*)(_QWORD))type metadata accessor for MessagingOptions);
    _os_log_impl(&dword_23B916000, v30, v31, "%{public}s: IDSSendMessageOptions: %s", (uint8_t *)v34, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x242609864](v49, -1, -1);
    MEMORY[0x242609864](v34, -1, -1);
  }
  else
  {
    sub_23B92F33C(*(_QWORD *)(v50 + 104), (uint64_t (*)(_QWORD))type metadata accessor for MessagingOptions);
  }

  v43 = *(_QWORD *)(v50 + 80);
  v44 = swift_task_alloc();
  *(_QWORD *)(v50 + 128) = v44;
  v45 = *(_OWORD *)(v50 + 64);
  *(_QWORD *)(v44 + 16) = v43;
  *(_QWORD *)(v44 + 24) = v11;
  *(_OWORD *)(v44 + 32) = v45;
  v46 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v50 + 136) = v46;
  sub_23B9582F8();
  *v46 = v50;
  v46[1] = sub_23B9222EC;
  return sub_23B95819C();
}

uint64_t sub_23B9222EC()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 144) = v0;
  swift_task_dealloc();
  if (v0)
    return swift_task_switch();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_23B92238C()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23B9223E4(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  unint64_t v16;
  _QWORD *v17;
  uint64_t v19;

  v10 = *a2;
  v11 = *(_QWORD *)(type metadata accessor for MessagingOptions() - 8);
  v12 = *(_QWORD *)(v11 + 64);
  MEMORY[0x24BDAC7A8]();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254309C80);
  MEMORY[0x24BDAC7A8]();
  v14 = (char *)&v19 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_23B9584F0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56))(v14, 1, 1, v15);
  sub_23B92F2F8(a5, (uint64_t)&v19 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(_QWORD))type metadata accessor for MessagingOptions);
  v16 = (*(unsigned __int8 *)(v11 + 80) + 72) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  v17 = (_QWORD *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = *(_QWORD *)(v10 + 80);
  v17[5] = *(_QWORD *)(v10 + 88);
  v17[6] = a2;
  v17[7] = a3;
  v17[8] = a4;
  sub_23B92F378((uint64_t)&v19 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t)v17 + v16, (uint64_t (*)(_QWORD))type metadata accessor for MessagingOptions);
  *(_QWORD *)((char *)v17 + ((v12 + v16 + 7) & 0xFFFFFFFFFFFFFFF8)) = a1;
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  sub_23B94CA58((uint64_t)v14, (uint64_t)&unk_256A55640, (uint64_t)v17);
  return swift_release();
}

uint64_t sub_23B922574(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  _QWORD *v13;

  v13 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v8 + 16) = v13;
  *v13 = v8;
  v13[1] = sub_23B930844;
  return sub_23B9225F0(a5, a6, a7, a8);
}

uint64_t sub_23B9225F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v5[15] = a4;
  v5[16] = v4;
  v5[13] = a2;
  v5[14] = a3;
  v5[12] = a1;
  v5[17] = *v4;
  v5[18] = *v4;
  v6 = type metadata accessor for MessagingOptions();
  v5[19] = v6;
  v7 = *(_QWORD *)(v6 - 8);
  v5[20] = v7;
  v5[21] = *(_QWORD *)(v7 + 64);
  v5[22] = swift_task_alloc();
  v5[23] = swift_task_alloc();
  v8 = sub_23B9582F8();
  v5[24] = v8;
  v5[25] = *(_QWORD *)(v8 - 8);
  v5[26] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23B9226A4()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v1 = v0[25];
  v2 = v0[26];
  v3 = v0[24];
  v13 = v0[23];
  v14 = v0[20];
  v4 = v0[18];
  v5 = v0[16];
  v7 = v0[14];
  v6 = v0[15];
  v15 = v0[21];
  v16 = v0[13];
  v17 = v0[12];
  v18 = v0[17];
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v1 + 16))(v2, v7, v3);
  swift_beginAccess();
  swift_retain();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v19 = *(_QWORD *)(v5 + 152);
  *(_QWORD *)(v5 + 152) = 0x8000000000000000;
  sub_23B936920(v6, v2, isUniquelyReferenced_nonNull_native);
  *(_QWORD *)(v5 + 152) = v19;
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v1 + 8))(v2, v3);
  swift_endAccess();
  sub_23B92F2F8(v7, v13, (uint64_t (*)(_QWORD))type metadata accessor for MessagingOptions);
  v9 = (*(unsigned __int8 *)(v14 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80);
  v10 = (_QWORD *)swift_allocObject();
  v0[27] = v10;
  v10[2] = *(_QWORD *)(v4 + 80);
  v10[3] = *(_QWORD *)(v4 + 88);
  v10[4] = v5;
  v10[5] = v16;
  v10[6] = v17;
  sub_23B92F378(v13, (uint64_t)v10 + v9, (uint64_t (*)(_QWORD))type metadata accessor for MessagingOptions);
  *(_QWORD *)((char *)v10 + ((v15 + v9 + 7) & 0xFFFFFFFFFFFFFFF8)) = v18;
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v11 = (_QWORD *)swift_task_alloc();
  v0[28] = v11;
  *v11 = v0;
  v11[1] = sub_23B92289C;
  return sub_23B958160();
}

uint64_t sub_23B92289C()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 232) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_release();
  return swift_task_switch();
}

uint64_t sub_23B922910()
{
  uint64_t v0;

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23B922954()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  id v6;
  NSObject *v7;
  os_log_type_t v8;
  _BOOL4 v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  id v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  _QWORD *v25;
  uint64_t v26;
  uint64_t v27;

  swift_release();
  if (qword_254309BF0 != -1)
    swift_once();
  v1 = *(void **)(v0 + 232);
  v2 = *(_QWORD *)(v0 + 176);
  v3 = *(_QWORD *)(v0 + 112);
  v4 = sub_23B95831C();
  __swift_project_value_buffer(v4, (uint64_t)qword_254309BD8);
  sub_23B92F2F8(v3, v2, (uint64_t (*)(_QWORD))type metadata accessor for MessagingOptions);
  v5 = v1;
  v6 = v1;
  v7 = sub_23B958304();
  v8 = sub_23B958568();
  v9 = os_log_type_enabled(v7, v8);
  v10 = *(void **)(v0 + 232);
  if (v9)
  {
    v11 = *(_QWORD *)(v0 + 176);
    v12 = swift_slowAlloc();
    v25 = (_QWORD *)swift_slowAlloc();
    v26 = swift_slowAlloc();
    v27 = v26;
    *(_DWORD *)v12 = 136446722;
    v16 = sub_23B91B910(v26, v13, v14, v15);
    *(_QWORD *)(v0 + 72) = sub_23B9287E0(v16, v17, &v27);
    sub_23B9585A4();
    swift_bridgeObjectRelease();
    *(_WORD *)(v12 + 12) = 2082;
    sub_23B92F2B8(&qword_256A55510, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAB8]);
    v18 = sub_23B9587F0();
    *(_QWORD *)(v0 + 80) = sub_23B9287E0(v18, v19, &v27);
    sub_23B9585A4();
    swift_bridgeObjectRelease();
    sub_23B92F33C(v11, (uint64_t (*)(_QWORD))type metadata accessor for MessagingOptions);
    *(_WORD *)(v12 + 22) = 2114;
    v20 = v10;
    v21 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v0 + 88) = v21;
    sub_23B9585A4();
    *v25 = v21;

    _os_log_impl(&dword_23B916000, v7, v8, "%{public}s: Failed to send raw dictionary with identifier: %{public}s. Error: %{public}@.", (uint8_t *)v12, 0x20u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256A555C8);
    swift_arrayDestroy();
    MEMORY[0x242609864](v25, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x242609864](v26, -1, -1);
    MEMORY[0x242609864](v12, -1, -1);
  }
  else
  {
    sub_23B92F33C(*(_QWORD *)(v0 + 176), (uint64_t (*)(_QWORD))type metadata accessor for MessagingOptions);

  }
  v22 = *(void **)(v0 + 232);
  v23 = *(_QWORD *)(v0 + 112);
  *(_QWORD *)(v0 + 64) = v22;
  sub_23B958178();
  swift_beginAccess();
  sub_23B945D2C(v23);
  swift_endAccess();
  swift_release();

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23B922CBC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;

  v8[12] = a7;
  v8[13] = a8;
  v8[10] = a5;
  v8[11] = a6;
  v8[8] = a3;
  v8[9] = a4;
  v8[7] = a2;
  v9 = type metadata accessor for Message(0, *(_QWORD *)(*(_QWORD *)a2 + 80), *(_QWORD *)(*(_QWORD *)a2 + 88), a4);
  v8[14] = v9;
  v8[15] = *(_QWORD *)(v9 - 8);
  v8[16] = swift_task_alloc();
  v8[17] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254309A30);
  v8[18] = swift_task_alloc();
  v10 = sub_23B9582F8();
  v8[19] = v10;
  v8[20] = *(_QWORD *)(v10 - 8);
  v8[21] = swift_task_alloc();
  v8[22] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23B922DC8()
{
  _QWORD *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  _BYTE *v17;
  uint64_t (*v18)(void);
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  os_log_type_t v28;
  _BOOL4 v29;
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
  unint64_t v42;
  void (*v43)(uint64_t, uint64_t);
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  unint64_t v47;
  uint64_t v48;
  unint64_t v49;
  void (*v50)(uint64_t, uint64_t);
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void (*type)(uint64_t, uint64_t, uint64_t);
  os_log_type_t typea;
  os_log_t log;
  NSObject *loga;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  uint64_t v64[2];

  v64[1] = *MEMORY[0x24BDAC8D0];
  v1 = v0[10];
  v2 = *(void **)(v0[7] + 136);
  v3 = (void *)sub_23B958274();
  sub_23B939934(v1);
  v4 = (void *)sub_23B9584FC();
  swift_bridgeObjectRelease();
  v5 = MessagingOptions.dictionaryValue.getter();
  sub_23B939C24(v5);
  swift_bridgeObjectRelease();
  v6 = (void *)sub_23B958340();
  swift_bridgeObjectRelease();
  v0[2] = 0;
  v0[3] = 0;
  LODWORD(v2) = objc_msgSend(v2, sel_sendData_toDestinations_priority_options_identifier_error_, v3, v4, 300, v6, v0 + 2, v0 + 3);

  v7 = (void *)v0[3];
  v8 = (void *)v0[2];
  if (!(_DWORD)v2)
  {
    v14 = v7;
    v15 = v8;
    sub_23B958220();

LABEL_8:
    swift_willThrow();

    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    v18 = (uint64_t (*)(void))v0[1];
    return v18();
  }
  if (!v8)
  {
    v16 = v7;
    goto LABEL_7;
  }
  v9 = v0[19];
  v10 = v0[20];
  v11 = v0[18];
  sub_23B9583DC();
  v12 = v7;
  v13 = v8;
  sub_23B9582C8();
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(v11, 1, v9) == 1)
  {
    sub_23B930790(v0[18], &qword_254309A30);
LABEL_7:
    sub_23B91AC50();
    swift_allocError();
    *v17 = 0;
    goto LABEL_8;
  }
  v63 = v13;
  (*(void (**)(_QWORD, _QWORD, _QWORD))(v0[20] + 32))(v0[22], v0[18], v0[19]);
  if (qword_254309BF0 != -1)
    swift_once();
  v20 = v0[20];
  log = (os_log_t)v0[21];
  v61 = v0[22];
  v21 = v0[19];
  v22 = v0[17];
  v24 = v0[14];
  v23 = v0[15];
  v25 = v0[12];
  v26 = sub_23B95831C();
  __swift_project_value_buffer(v26, (uint64_t)qword_254309BD8);
  type = *(void (**)(uint64_t, uint64_t, uint64_t))(v23 + 16);
  type(v22, v25, v24);
  (*(void (**)(os_log_t, uint64_t, uint64_t))(v20 + 16))(log, v61, v21);
  v27 = sub_23B958304();
  v28 = sub_23B958568();
  v29 = os_log_type_enabled(v27, v28);
  v31 = v0[21];
  v30 = v0[22];
  v32 = v0[19];
  v33 = v0[20];
  v34 = v0[17];
  if (v29)
  {
    v54 = v0[19];
    v55 = v0[21];
    loga = v27;
    v62 = v0[22];
    v35 = v0[16];
    v53 = v0[15];
    v36 = v0[14];
    v37 = swift_slowAlloc();
    v56 = swift_slowAlloc();
    v64[0] = v56;
    *(_DWORD *)v37 = 136446722;
    v41 = sub_23B91B910(v56, v38, v39, v40);
    v0[4] = sub_23B9287E0(v41, v42, v64);
    sub_23B9585A4();
    swift_bridgeObjectRelease();
    *(_WORD *)(v37 + 12) = 2082;
    type(v35, v34, v36);
    typea = v28;
    v43 = *(void (**)(uint64_t, uint64_t))(v53 + 8);
    v43(v34, v36);
    Message.description.getter(v36);
    v45 = v44;
    v47 = v46;
    v43(v35, v36);
    v0[5] = sub_23B9287E0(v45, v47, v64);
    sub_23B9585A4();
    swift_bridgeObjectRelease();
    *(_WORD *)(v37 + 22) = 2082;
    sub_23B92F2B8(&qword_256A55510, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAB8]);
    v48 = sub_23B9587F0();
    v0[6] = sub_23B9287E0(v48, v49, v64);
    sub_23B9585A4();
    swift_bridgeObjectRelease();
    v50 = *(void (**)(uint64_t, uint64_t))(v33 + 8);
    v50(v55, v54);
    _os_log_impl(&dword_23B916000, loga, typea, "%{public}s: Sent message %{public}s with identifier: %{public}s", (uint8_t *)v37, 0x20u);
    swift_arrayDestroy();
    MEMORY[0x242609864](v56, -1, -1);
    MEMORY[0x242609864](v37, -1, -1);

    v51 = v62;
    v52 = v54;
  }
  else
  {
    (*(void (**)(_QWORD, _QWORD))(v0[15] + 8))(v0[17], v0[14]);

    v50 = *(void (**)(uint64_t, uint64_t))(v33 + 8);
    v50(v31, v32);
    v51 = v30;
    v52 = v32;
  }
  v50(v51, v52);

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  v18 = (uint64_t (*)(void))v0[1];
  return v18();
}

uint64_t sub_23B923380(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;

  v8[12] = a7;
  v8[13] = a8;
  v8[10] = a5;
  v8[11] = a6;
  v8[8] = a3;
  v8[9] = a4;
  v8[7] = a2;
  v9 = type metadata accessor for Message(0, *(_QWORD *)(*(_QWORD *)a2 + 80), *(_QWORD *)(*(_QWORD *)a2 + 88), a4);
  v8[14] = v9;
  v8[15] = *(_QWORD *)(v9 - 8);
  v8[16] = swift_task_alloc();
  v8[17] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254309A30);
  v8[18] = swift_task_alloc();
  v10 = sub_23B9582F8();
  v8[19] = v10;
  v8[20] = *(_QWORD *)(v10 - 8);
  v8[21] = swift_task_alloc();
  v8[22] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23B92348C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  unsigned int v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  _BYTE *v20;
  uint64_t (*v21)(void);
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  os_log_type_t v32;
  _BOOL4 v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  void (*v47)(uint64_t, uint64_t);
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  unint64_t v51;
  uint64_t v52;
  unint64_t v53;
  void (*v54)(uint64_t, uint64_t);
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  os_log_type_t type;
  void (*v61)(uint64_t, uint64_t, uint64_t);
  uint64_t v62;
  uint64_t v63;
  void *v64;
  uint64_t v65[2];

  v65[1] = *MEMORY[0x24BDAC8D0];
  v1 = v0[10];
  v2 = v0[9];
  v3 = *(void **)(v0[7] + 136);
  v4 = (void *)sub_23B958238();
  sub_23B939FE8(v2);
  v5 = (void *)sub_23B958340();
  swift_bridgeObjectRelease();
  sub_23B939934(v1);
  v6 = (void *)sub_23B9584FC();
  swift_bridgeObjectRelease();
  v7 = MessagingOptions.dictionaryValue.getter();
  sub_23B939C24(v7);
  swift_bridgeObjectRelease();
  v8 = (void *)sub_23B958340();
  swift_bridgeObjectRelease();
  v0[2] = 0;
  v0[3] = 0;
  v9 = objc_msgSend(v3, sel_sendResourceAtURL_metadata_toDestinations_priority_options_identifier_error_, v4, v5, v6, 300, v8, v0 + 2, v0 + 3);

  v10 = (void *)v0[3];
  v11 = (void *)v0[2];
  if (!v9)
  {
    v17 = v10;
    v18 = v11;
    sub_23B958220();

LABEL_8:
    swift_willThrow();

    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    v21 = (uint64_t (*)(void))v0[1];
    return v21();
  }
  if (!v11)
  {
    v19 = v10;
    goto LABEL_7;
  }
  v12 = v0[19];
  v13 = v0[20];
  v14 = v0[18];
  sub_23B9583DC();
  v15 = v10;
  v16 = v11;
  sub_23B9582C8();
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v13 + 48))(v14, 1, v12) == 1)
  {
    sub_23B930790(v0[18], &qword_254309A30);
LABEL_7:
    sub_23B91AC50();
    swift_allocError();
    *v20 = 0;
    goto LABEL_8;
  }
  v64 = v16;
  (*(void (**)(_QWORD, _QWORD, _QWORD))(v0[20] + 32))(v0[22], v0[18], v0[19]);
  if (qword_254309BF0 != -1)
    swift_once();
  v23 = v0[21];
  v62 = v0[22];
  v24 = v0[19];
  v25 = v0[20];
  v26 = v0[17];
  v28 = v0[14];
  v27 = v0[15];
  v29 = v0[12];
  v30 = sub_23B95831C();
  __swift_project_value_buffer(v30, (uint64_t)qword_254309BD8);
  v61 = *(void (**)(uint64_t, uint64_t, uint64_t))(v27 + 16);
  v61(v26, v29, v28);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v25 + 16))(v23, v62, v24);
  v31 = sub_23B958304();
  v32 = sub_23B958568();
  v33 = os_log_type_enabled(v31, v32);
  v35 = v0[21];
  v34 = v0[22];
  v36 = v0[19];
  v37 = v0[20];
  v38 = v0[17];
  if (v33)
  {
    v63 = v0[22];
    v57 = v0[21];
    v58 = v0[20];
    v39 = v0[16];
    v56 = v0[15];
    type = v32;
    v40 = v0[14];
    v41 = swift_slowAlloc();
    v59 = swift_slowAlloc();
    v65[0] = v59;
    *(_DWORD *)v41 = 136446722;
    v45 = sub_23B91B910(v59, v42, v43, v44);
    v0[4] = sub_23B9287E0(v45, v46, v65);
    sub_23B9585A4();
    swift_bridgeObjectRelease();
    *(_WORD *)(v41 + 12) = 2082;
    v61(v39, v38, v40);
    v47 = *(void (**)(uint64_t, uint64_t))(v56 + 8);
    v47(v38, v40);
    Message.description.getter(v40);
    v49 = v48;
    v51 = v50;
    v47(v39, v40);
    v0[5] = sub_23B9287E0(v49, v51, v65);
    sub_23B9585A4();
    swift_bridgeObjectRelease();
    *(_WORD *)(v41 + 22) = 2082;
    sub_23B92F2B8(&qword_256A55510, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAB8]);
    v52 = sub_23B9587F0();
    v0[6] = sub_23B9287E0(v52, v53, v65);
    sub_23B9585A4();
    swift_bridgeObjectRelease();
    v54 = *(void (**)(uint64_t, uint64_t))(v58 + 8);
    v54(v57, v36);
    _os_log_impl(&dword_23B916000, v31, type, "%{public}s: Sent message (resource) %{public}s with identifier: %{public}s", (uint8_t *)v41, 0x20u);
    swift_arrayDestroy();
    MEMORY[0x242609864](v59, -1, -1);
    MEMORY[0x242609864](v41, -1, -1);

    v55 = v63;
  }
  else
  {
    (*(void (**)(_QWORD, _QWORD))(v0[15] + 8))(v0[17], v0[14]);

    v54 = *(void (**)(uint64_t, uint64_t))(v37 + 8);
    v54(v35, v36);
    v55 = v34;
  }
  v54(v55, v36);

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  v21 = (uint64_t (*)(void))v0[1];
  return v21();
}

uint64_t sub_23B923A80(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;

  v5[6] = a4;
  v5[7] = a5;
  v5[5] = a3;
  v8 = *a2;
  type metadata accessor for MessagingOptions();
  v5[8] = swift_task_alloc();
  v10 = type metadata accessor for Message(0, *(_QWORD *)(v8 + 80), *(_QWORD *)(v8 + 88), v9);
  v5[9] = v10;
  v5[10] = *(_QWORD *)(v10 - 8);
  v5[11] = swift_task_alloc();
  v5[12] = swift_task_alloc();
  v11 = sub_23B9582F8();
  v5[13] = v11;
  v5[14] = *(_QWORD *)(v11 - 8);
  v12 = swift_task_alloc();
  v5[15] = v12;
  v13 = (_QWORD *)swift_task_alloc();
  v5[16] = v13;
  *v13 = v5;
  v13[1] = sub_23B923B80;
  return InternetMessaging.send(message:messageOptions:)(v12, a3, a4);
}

uint64_t sub_23B923B80()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  v2 = *(_QWORD **)v1;
  *(_QWORD *)(*(_QWORD *)v1 + 136) = v0;
  swift_task_dealloc();
  if (!v0)
    (*(void (**)(_QWORD, _QWORD))(v2[14] + 8))(v2[15], v2[13]);
  return swift_task_switch();
}

uint64_t sub_23B923BF4()
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
  void (*v9)(uint64_t, uint64_t, uint64_t);
  NSObject *v10;
  os_log_type_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  void (*v21)(uint64_t, uint64_t);
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  os_log_type_t type;
  uint64_t v34;

  if (qword_254309BF0 != -1)
    swift_once();
  v1 = *(_QWORD *)(v0 + 40);
  v2 = *(_QWORD *)(v0 + 96);
  v3 = *(_QWORD *)(v0 + 72);
  v4 = *(_QWORD *)(v0 + 80);
  v5 = *(_QWORD *)(v0 + 64);
  v6 = *(_QWORD *)(v0 + 48);
  v7 = sub_23B95831C();
  __swift_project_value_buffer(v7, (uint64_t)qword_254309BD8);
  v8 = v3;
  v9 = *(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16);
  v9(v2, v1, v8);
  sub_23B92F2F8(v6, v5, (uint64_t (*)(_QWORD))type metadata accessor for MessagingOptions);
  v10 = sub_23B958304();
  v11 = sub_23B958568();
  if (os_log_type_enabled(v10, v11))
  {
    v12 = *(_QWORD *)(v0 + 96);
    v13 = *(_QWORD *)(v0 + 88);
    v30 = *(_QWORD *)(v0 + 80);
    v14 = *(_QWORD *)(v0 + 72);
    v31 = *(_QWORD *)(v0 + 64);
    type = v11;
    v15 = swift_slowAlloc();
    v32 = swift_slowAlloc();
    v34 = v32;
    *(_DWORD *)v15 = 136446722;
    v19 = sub_23B91B910(v32, v16, v17, v18);
    *(_QWORD *)(v0 + 16) = sub_23B9287E0(v19, v20, &v34);
    sub_23B9585A4();
    swift_bridgeObjectRelease();
    *(_WORD *)(v15 + 12) = 2082;
    v9(v13, v12, v14);
    v21 = *(void (**)(uint64_t, uint64_t))(v30 + 8);
    v21(v12, v14);
    Message.description.getter(v14);
    v23 = v22;
    v25 = v24;
    v21(v13, v14);
    *(_QWORD *)(v0 + 24) = sub_23B9287E0(v23, v25, &v34);
    sub_23B9585A4();
    swift_bridgeObjectRelease();
    *(_WORD *)(v15 + 22) = 2082;
    sub_23B92F2B8(&qword_256A55510, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAB8]);
    v26 = sub_23B9587F0();
    *(_QWORD *)(v0 + 32) = sub_23B9287E0(v26, v27, &v34);
    sub_23B9585A4();
    swift_bridgeObjectRelease();
    sub_23B92F33C(v31, (uint64_t (*)(_QWORD))type metadata accessor for MessagingOptions);
    _os_log_impl(&dword_23B916000, v10, type, "%{public}s: Sent message (with response) %{public}s with identifier: %{public}s", (uint8_t *)v15, 0x20u);
    swift_arrayDestroy();
    MEMORY[0x242609864](v32, -1, -1);
    MEMORY[0x242609864](v15, -1, -1);
  }
  else
  {
    v28 = *(_QWORD *)(v0 + 64);
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 80) + 8))(*(_QWORD *)(v0 + 96), *(_QWORD *)(v0 + 72));
    sub_23B92F33C(v28, (uint64_t (*)(_QWORD))type metadata accessor for MessagingOptions);
  }

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23B923F2C()
{
  uint64_t v0;

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23B923F88(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;
  uint64_t v7;

  v6[9] = a5;
  v6[10] = a6;
  v6[7] = a3;
  v6[8] = a4;
  v6[6] = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254309A30);
  v6[11] = swift_task_alloc();
  v7 = sub_23B9582F8();
  v6[12] = v7;
  v6[13] = *(_QWORD *)(v7 - 8);
  v6[14] = swift_task_alloc();
  v6[15] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23B924050()
{
  _QWORD *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  _BYTE *v17;
  uint64_t (*v18)(void);
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  os_log_type_t v26;
  _BOOL4 v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  unint64_t v39;
  void (*v40)(uint64_t, uint64_t);
  uint64_t v41;
  void *v42;
  uint64_t v43[2];

  v43[1] = *MEMORY[0x24BDAC8D0];
  v1 = v0[8];
  v2 = *(void **)(v0[6] + 136);
  sub_23B939FE8(v0[7]);
  v3 = (void *)sub_23B958340();
  swift_bridgeObjectRelease();
  sub_23B939934(v1);
  v4 = (void *)sub_23B9584FC();
  swift_bridgeObjectRelease();
  v5 = MessagingOptions.dictionaryValue.getter();
  sub_23B939C24(v5);
  swift_bridgeObjectRelease();
  v6 = (void *)sub_23B958340();
  swift_bridgeObjectRelease();
  v0[2] = 0;
  v0[3] = 0;
  LODWORD(v2) = objc_msgSend(v2, sel_sendMessage_toDestinations_priority_options_identifier_error_, v3, v4, 300, v6, v0 + 2, v0 + 3);

  v7 = (void *)v0[3];
  v8 = (void *)v0[2];
  if (!(_DWORD)v2)
  {
    v14 = v7;
    v15 = v8;
    sub_23B958220();

LABEL_8:
    swift_willThrow();

    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    v18 = (uint64_t (*)(void))v0[1];
    return v18();
  }
  if (!v8)
  {
    v16 = v7;
    goto LABEL_7;
  }
  v9 = v0[12];
  v10 = v0[13];
  v11 = v0[11];
  sub_23B9583DC();
  v12 = v7;
  v13 = v8;
  sub_23B9582C8();
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(v11, 1, v9) == 1)
  {
    sub_23B930790(v0[11], &qword_254309A30);
LABEL_7:
    sub_23B91AC50();
    swift_allocError();
    *v17 = 0;
    goto LABEL_8;
  }
  v42 = v13;
  (*(void (**)(_QWORD, _QWORD, _QWORD))(v0[13] + 32))(v0[15], v0[11], v0[12]);
  if (qword_254309BF0 != -1)
    swift_once();
  v21 = v0[14];
  v20 = v0[15];
  v22 = v0[12];
  v23 = v0[13];
  v24 = sub_23B95831C();
  __swift_project_value_buffer(v24, (uint64_t)qword_254309BD8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v23 + 16))(v21, v20, v22);
  v25 = sub_23B958304();
  v26 = sub_23B958568();
  v27 = os_log_type_enabled(v25, v26);
  v29 = v0[14];
  v28 = v0[15];
  v31 = v0[12];
  v30 = v0[13];
  if (v27)
  {
    v32 = swift_slowAlloc();
    v41 = swift_slowAlloc();
    v43[0] = v41;
    *(_DWORD *)v32 = 136446466;
    v36 = sub_23B91B910(v41, v33, v34, v35);
    v0[4] = sub_23B9287E0(v36, v37, v43);
    sub_23B9585A4();
    swift_bridgeObjectRelease();
    *(_WORD *)(v32 + 12) = 2082;
    sub_23B92F2B8(&qword_256A55510, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAB8]);
    v38 = sub_23B9587F0();
    v0[5] = sub_23B9287E0(v38, v39, v43);
    sub_23B9585A4();
    swift_bridgeObjectRelease();
    v40 = *(void (**)(uint64_t, uint64_t))(v30 + 8);
    v40(v29, v31);
    _os_log_impl(&dword_23B916000, v25, v26, "%{public}s: Sent raw dictionary to with identifier: %{public}s", (uint8_t *)v32, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x242609864](v41, -1, -1);
    MEMORY[0x242609864](v32, -1, -1);

  }
  else
  {

    v40 = *(void (**)(uint64_t, uint64_t))(v30 + 8);
    v40(v29, v31);
  }
  v40(v28, v31);

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  v18 = (uint64_t (*)(void))v0[1];
  return v18();
}

uint64_t sub_23B92451C(uint64_t a1, uint64_t a2, _QWORD *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  _QWORD *v7;
  uint64_t v8;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t TupleTypeMetadata2;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  *(_QWORD *)(v8 + 352) = a7;
  *(_QWORD *)(v8 + 360) = v7;
  *(_QWORD *)(v8 + 336) = a4;
  *(_QWORD *)(v8 + 344) = a5;
  *(_QWORD *)(v8 + 320) = a1;
  *(_QWORD *)(v8 + 328) = a2;
  *(_QWORD *)(v8 + 368) = *v7;
  v11 = *v7;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254309C80);
  *(_QWORD *)(v8 + 376) = swift_task_alloc();
  v12 = *(_QWORD *)(v11 + 80);
  *(_QWORD *)(v8 + 384) = v12;
  v13 = *(_QWORD *)(v11 + 88);
  *(_QWORD *)(v8 + 392) = v13;
  v15 = type metadata accessor for Message(255, v12, v13, v14);
  *(_QWORD *)(v8 + 400) = v15;
  v16 = type metadata accessor for MessageContext();
  *(_QWORD *)(v8 + 408) = v16;
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  *(_QWORD *)(v8 + 416) = TupleTypeMetadata2;
  *(_QWORD *)(v8 + 424) = *(_QWORD *)(TupleTypeMetadata2 - 8);
  *(_QWORD *)(v8 + 432) = swift_task_alloc();
  v18 = sub_23B9582F8();
  *(_QWORD *)(v8 + 440) = v18;
  *(_QWORD *)(v8 + 448) = *(_QWORD *)(v18 - 8);
  *(_QWORD *)(v8 + 456) = swift_task_alloc();
  *(_QWORD *)(v8 + 464) = swift_task_alloc();
  *(_QWORD *)(v8 + 472) = swift_task_alloc();
  *(_QWORD *)(v8 + 480) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254309A30);
  *(_QWORD *)(v8 + 488) = swift_task_alloc();
  *(_QWORD *)(v8 + 496) = swift_task_alloc();
  *(_QWORD *)(v8 + 504) = type metadata accessor for MessagingOptions();
  *(_QWORD *)(v8 + 512) = swift_task_alloc();
  *(_QWORD *)(v8 + 520) = swift_task_alloc();
  v19 = *(_QWORD *)(v16 - 8);
  *(_QWORD *)(v8 + 528) = v19;
  *(_QWORD *)(v8 + 536) = *(_QWORD *)(v19 + 64);
  *(_QWORD *)(v8 + 544) = swift_task_alloc();
  *(_QWORD *)(v8 + 552) = swift_task_alloc();
  *(_QWORD *)(v8 + 560) = swift_task_alloc();
  v20 = *(_QWORD *)(v15 - 8);
  *(_QWORD *)(v8 + 568) = v20;
  *(_QWORD *)(v8 + 576) = *(_QWORD *)(v20 + 64);
  *(_QWORD *)(v8 + 584) = swift_task_alloc();
  *(_QWORD *)(v8 + 592) = swift_task_alloc();
  *(_QWORD *)(v8 + 600) = swift_task_alloc();
  *(_QWORD *)(v8 + 608) = swift_task_alloc();
  *(_QWORD *)(v8 + 616) = swift_task_alloc();
  *(_QWORD *)(v8 + 624) = swift_task_alloc();
  *(_QWORD *)(v8 + 632) = swift_task_alloc();
  v21 = a3[1];
  *(_QWORD *)(v8 + 640) = *a3;
  *(_QWORD *)(v8 + 648) = v21;
  *(_BYTE *)(v8 + 744) = *(_BYTE *)a6;
  v22 = *(_QWORD *)(a6 + 16);
  *(_QWORD *)(v8 + 656) = *(_QWORD *)(a6 + 8);
  *(_QWORD *)(v8 + 664) = v22;
  return swift_task_switch();
}

uint64_t sub_23B92478C()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  BOOL v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t, uint64_t);
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, uint64_t, uint64_t);
  NSObject *v24;
  os_log_type_t v25;
  _BOOL4 v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  unint64_t v38;
  void (*v39)(uint64_t, uint64_t);
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  unint64_t v43;
  uint64_t v44;
  NSObject *v45;
  os_log_type_t v46;
  unint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  _QWORD *v76;
  uint64_t v77;
  NSObject *v78;
  os_log_type_t v79;
  _BOOL4 v80;
  unint64_t v81;
  uint64_t v82;
  uint64_t v83;
  unint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  unint64_t v90;
  uint64_t v91;
  unint64_t v92;
  uint64_t v93;
  void (*v94)(uint64_t, uint64_t);
  uint64_t v95;
  uint64_t v96;
  unint64_t v97;
  unint64_t v98;
  uint64_t v99;
  unint64_t v100;
  uint64_t v101;
  NSObject *v102;
  os_log_type_t v103;
  _BOOL4 v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint8_t *v108;
  _QWORD *v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  unint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  char v120;
  uint64_t v121;
  unint64_t v122;
  _QWORD *v123;
  uint64_t v124;
  NSObject *v125;
  os_log_type_t v126;
  _BOOL4 v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  _QWORD *v131;
  uint8_t *v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  unint64_t v138;
  uint8_t *v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  void (*v160)(uint64_t, uint64_t, uint64_t);
  NSObject *v161;
  os_log_type_t v162;
  _BOOL4 v163;
  unint64_t v164;
  uint64_t v165;
  unint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  unint64_t v172;
  void (*v173)(uint64_t, uint64_t);
  uint64_t v174;
  uint64_t v175;
  unint64_t v176;
  unint64_t v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  unint64_t v189;
  unint64_t v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  NSObject *log;
  uint64_t loga;
  uint64_t logb;
  os_log_t logc[2];
  os_log_t v205;
  NSObject *v206;
  os_log_type_t type;
  uint64_t v208;
  uint64_t v209;
  void (*v210)(uint64_t, uint64_t, uint64_t);
  uint64_t v211;
  uint64_t v212;
  uint64_t v213;
  uint64_t v214;
  uint64_t v215;
  uint64_t v216;
  uint64_t v217;
  char v218;
  uint64_t v219;
  uint64_t v220;
  uint64_t v221;
  uint64_t v222;
  uint64_t v223;
  uint64_t v224;
  uint64_t v225;
  uint64_t v226;
  uint64_t v227;
  void (*v228)(unint64_t, uint64_t, uint64_t);
  void (*v229)(uint64_t, uint64_t);
  os_log_type_t v230;
  os_log_type_t v231;
  void (*v232)(uint64_t, uint64_t);
  void (*v233)(uint64_t, uint64_t, uint64_t);
  int *v234;
  uint64_t v235;
  void (*v236)(uint64_t, uint64_t, uint64_t);
  uint64_t v237;
  int *v238;
  uint64_t v239;
  _QWORD *v240;
  void (*v241)(uint64_t, uint64_t);
  uint64_t v242[3];

  v1 = v0;
  v2 = v0[45];
  v4 = *(_QWORD *)(v2 + 112);
  v3 = *(_QWORD *)(v2 + 120);
  v5 = v4 == v0[40] && v3 == v0[41];
  if (!v5 && (sub_23B958820() & 1) == 0)
  {
    if (qword_254309BF0 != -1)
      swift_once();
    v44 = sub_23B95831C();
    __swift_project_value_buffer(v44, (uint64_t)qword_254309BD8);
    swift_bridgeObjectRetain_n();
    swift_retain_n();
    v45 = sub_23B958304();
    v46 = sub_23B958550();
    if (os_log_type_enabled(v45, v46))
    {
      v47 = v0[41];
      v227 = v0[40];
      v48 = swift_slowAlloc();
      v235 = swift_slowAlloc();
      v242[0] = v235;
      *(_DWORD *)v48 = 136446722;
      v52 = sub_23B91B910(v235, v49, v50, v51);
      v0[32] = sub_23B9287E0(v52, v53, v242);
      sub_23B9585A4();
      swift_bridgeObjectRelease();
      *(_WORD *)(v48 + 12) = 2082;
      swift_bridgeObjectRetain();
      v0[31] = sub_23B9287E0(v4, v3, v242);
      sub_23B9585A4();
      swift_bridgeObjectRelease();
      swift_release_n();
      *(_WORD *)(v48 + 22) = 2082;
      swift_bridgeObjectRetain();
      v0[23] = sub_23B9287E0(v227, v47, v242);
      sub_23B9585A4();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_23B916000, v45, v46, "%{public}s: Ignoring delegate callback from wrong IDS service! Expected %{public}s, received: %{public}s", (uint8_t *)v48, 0x20u);
      swift_arrayDestroy();
      MEMORY[0x242609864](v235, -1, -1);
      v54 = v48;
      v1 = v0;
      MEMORY[0x242609864](v54, -1, -1);
    }
    else
    {
      swift_release_n();
      swift_bridgeObjectRelease_n();
    }

    goto LABEL_20;
  }
  v6 = v0[50];
  sub_23B9581E4();
  swift_allocObject();
  sub_23B9581D8();
  MEMORY[0x2426097B0](&protocol conformance descriptor for Message<A>, v6);
  sub_23B9581C0();
  v7 = v0[79];
  v8 = v0[78];
  v9 = v0[71];
  v11 = v1[50];
  v10 = v1[51];
  v12 = v1[44];
  swift_release();
  v13 = *(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 32);
  v13(v7, v8, v11);
  if (*(_BYTE *)(v12 + *(int *)(v10 + 36)) != 1)
  {
    v55 = v1[61];
    v56 = v1[55];
    v57 = v1[56];
    sub_23B9307CC(v1[44], v55, &qword_254309A30);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v57 + 48))(v55, 1, v56) == 1)
    {
      sub_23B930790(v1[61], &qword_254309A30);
    }
    else
    {
      v59 = v1[59];
      v60 = v1[55];
      v61 = v1[45];
      (*(void (**)(uint64_t, _QWORD, uint64_t))(v1[56] + 32))(v59, v1[61], v60);
      swift_beginAccess();
      v62 = *(_QWORD *)(v61 + 160);
      swift_bridgeObjectRetain();
      __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254309C90);
      v63 = sub_23B958190();
      v64 = sub_23B92F2B8((unint64_t *)&qword_254309B00, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
      MEMORY[0x242608EA4](v59, v62, v60, v63, v64);
      swift_bridgeObjectRelease();
      if (v1[20])
      {
        if (qword_254309BF0 != -1)
          swift_once();
        v65 = v1[79];
        v66 = v1[74];
        v67 = v1[71];
        v68 = v1[69];
        v69 = v1[58];
        v209 = v1[59];
        v71 = v1[55];
        v70 = v1[56];
        v240 = v1;
        v72 = v1[50];
        v73 = v240[44];
        v74 = sub_23B95831C();
        __swift_project_value_buffer(v74, (uint64_t)qword_254309BD8);
        sub_23B92F2F8(v73, v68, (uint64_t (*)(_QWORD))type metadata accessor for MessageContext);
        v75 = v72;
        v76 = v240;
        v236 = *(void (**)(uint64_t, uint64_t, uint64_t))(v67 + 16);
        v236(v66, v65, v75);
        v77 = v209;
        v210 = *(void (**)(uint64_t, uint64_t, uint64_t))(v70 + 16);
        v210(v69, v77, v71);
        swift_bridgeObjectRetain_n();
        swift_bridgeObjectRetain_n();
        v78 = sub_23B958304();
        v79 = sub_23B958568();
        v80 = os_log_type_enabled(v78, v79);
        v81 = v240[83];
        if (v80)
        {
          v194 = v240[82];
          v195 = v240[74];
          v196 = v240[76];
          v197 = v240[71];
          v82 = v240[69];
          v198 = v240[58];
          loga = v240[56];
          v193 = v240[55];
          v206 = v78;
          v83 = v240[50];
          type = v79;
          v84 = v240[41];
          v192 = v240[40];
          v85 = swift_slowAlloc();
          v199 = swift_slowAlloc();
          v242[0] = v199;
          *(_DWORD *)v85 = 136316418;
          v89 = sub_23B91B910(v199, v86, v87, v88);
          v240[24] = sub_23B9287E0(v89, v90, v242);
          sub_23B9585A4();
          swift_bridgeObjectRelease();
          *(_WORD *)(v85 + 12) = 2080;
          sub_23B92F2B8(&qword_256A55510, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAB8]);
          v91 = sub_23B9587F0();
          v240[25] = sub_23B9287E0(v91, v92, v242);
          sub_23B9585A4();
          swift_bridgeObjectRelease();
          v93 = v82;
          v76 = v240;
          sub_23B92F33C(v93, (uint64_t (*)(_QWORD))type metadata accessor for MessageContext);
          *(_WORD *)(v85 + 22) = 2080;
          swift_bridgeObjectRetain();
          v240[26] = sub_23B9287E0(v192, v84, v242);
          sub_23B9585A4();
          swift_bridgeObjectRelease_n();
          *(_WORD *)(v85 + 32) = 2080;
          swift_bridgeObjectRetain();
          v240[27] = sub_23B9287E0(v194, v81, v242);
          sub_23B9585A4();
          swift_bridgeObjectRelease_n();
          *(_WORD *)(v85 + 42) = 2080;
          v236(v196, v195, v83);
          v94 = *(void (**)(uint64_t, uint64_t))(v197 + 8);
          v94(v195, v83);
          Message.description.getter(v83);
          v96 = v95;
          v98 = v97;
          v232 = v94;
          v94(v196, v83);
          v240[28] = sub_23B9287E0(v96, v98, v242);
          sub_23B9585A4();
          swift_bridgeObjectRelease();
          *(_WORD *)(v85 + 52) = 2080;
          v99 = sub_23B9587F0();
          v240[29] = sub_23B9287E0(v99, v100, v242);
          sub_23B9585A4();
          swift_bridgeObjectRelease();
          v229 = *(void (**)(uint64_t, uint64_t))(loga + 8);
          v229(v198, v193);
          _os_log_impl(&dword_23B916000, v206, type, "%s: Received message %s on %s from %s: %s in response to %s", (uint8_t *)v85, 0x3Eu);
          swift_arrayDestroy();
          MEMORY[0x242609864](v199, -1, -1);
          MEMORY[0x242609864](v85, -1, -1);

        }
        else
        {
          v140 = v240[69];
          v141 = v240[58];
          v142 = v240[55];
          v143 = v240[56];
          v232 = *(void (**)(uint64_t, uint64_t))(v240[71] + 8);
          v232(v240[74], v240[50]);
          sub_23B92F33C(v140, (uint64_t (*)(_QWORD))type metadata accessor for MessageContext);
          swift_bridgeObjectRelease_n();
          swift_bridgeObjectRelease_n();
          v229 = *(void (**)(uint64_t, uint64_t))(v143 + 8);
          v229(v141, v142);

        }
        v144 = v76[79];
        v145 = v76[59];
        v146 = v76[57];
        v148 = v76[54];
        v147 = v76[55];
        v149 = v76[53];
        v150 = v240[52];
        v151 = v240[50];
        v152 = v240[44];
        v153 = v148 + *(int *)(v150 + 48);
        v236(v148, v144, v151);
        sub_23B92F2F8(v152, v153, (uint64_t (*)(_QWORD))type metadata accessor for MessageContext);
        sub_23B958184();
        v154 = v150;
        v1 = v240;
        (*(void (**)(uint64_t, uint64_t))(v149 + 8))(v148, v154);
        v210(v146, v145, v147);
        v240[22] = 0;
        swift_beginAccess();
        sub_23B95837C();
        sub_23B958394();
        swift_endAccess();
        swift_release();
        v229(v145, v147);
        v232(v144, v151);
        goto LABEL_20;
      }
      if (qword_254309BF0 != -1)
        swift_once();
      v124 = sub_23B95831C();
      __swift_project_value_buffer(v124, (uint64_t)qword_254309BD8);
      v125 = sub_23B958304();
      v126 = sub_23B958550();
      v127 = os_log_type_enabled(v125, v126);
      v128 = v1[59];
      v129 = v1[55];
      v130 = v1[56];
      if (v127)
      {
        v220 = v1[56];
        v131 = v1;
        v132 = (uint8_t *)swift_slowAlloc();
        v133 = swift_slowAlloc();
        v242[0] = v133;
        *(_DWORD *)v132 = 136315138;
        v137 = sub_23B91B910(v133, v134, v135, v136);
        v131[21] = sub_23B9287E0(v137, v138, v242);
        sub_23B9585A4();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_23B916000, v125, v126, "%s: Got unexpected response!", v132, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x242609864](v133, -1, -1);
        v139 = v132;
        v1 = v131;
        MEMORY[0x242609864](v139, -1, -1);

        (*(void (**)(uint64_t, uint64_t))(v220 + 8))(v128, v129);
      }
      else
      {

        (*(void (**)(uint64_t, uint64_t))(v130 + 8))(v128, v129);
      }
    }
    v228 = (void (*)(unint64_t, uint64_t, uint64_t))v13;
    if (qword_254309BF0 != -1)
      swift_once();
    v155 = v1[79];
    v156 = v1[73];
    v157 = v1[71];
    v158 = v1[50];
    v159 = sub_23B95831C();
    __swift_project_value_buffer(v159, (uint64_t)qword_254309BD8);
    v160 = *(void (**)(uint64_t, uint64_t, uint64_t))(v157 + 16);
    v160(v156, v155, v158);
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    v161 = sub_23B958304();
    v162 = sub_23B958568();
    v163 = os_log_type_enabled(v161, v162);
    v164 = v1[83];
    v233 = v160;
    if (v163)
    {
      v211 = v1[82];
      v217 = v1[76];
      v215 = v1[73];
      v221 = v1[71];
      v165 = v1[50];
      v230 = v162;
      v166 = v1[41];
      logb = v1[40];
      v167 = swift_slowAlloc();
      v224 = swift_slowAlloc();
      v242[0] = v224;
      *(_DWORD *)v167 = 136316163;
      v171 = sub_23B91B910(v224, v168, v169, v170);
      v1[15] = sub_23B9287E0(v171, v172, v242);
      sub_23B9585A4();
      swift_bridgeObjectRelease();
      *(_WORD *)(v167 + 12) = 2082;
      swift_bridgeObjectRetain();
      v1[16] = sub_23B9287E0(logb, v166, v242);
      sub_23B9585A4();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v167 + 22) = 2160;
      v1[17] = 1752392040;
      sub_23B9585A4();
      *(_WORD *)(v167 + 32) = 2081;
      swift_bridgeObjectRetain();
      v1[18] = sub_23B9287E0(v211, v164, v242);
      sub_23B9585A4();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v167 + 42) = 2082;
      v160(v217, v215, v165);
      v173 = *(void (**)(uint64_t, uint64_t))(v221 + 8);
      v173(v215, v165);
      Message.description.getter(v165);
      v175 = v174;
      v177 = v176;
      v173(v217, v165);
      v1[19] = sub_23B9287E0(v175, v177, v242);
      sub_23B9585A4();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_23B916000, v161, v230, "%s: Received message on %{public}s from %{private,mask.hash}s: %{public}s", (uint8_t *)v167, 0x34u);
      swift_arrayDestroy();
      MEMORY[0x242609864](v224, -1, -1);
      MEMORY[0x242609864](v167, -1, -1);
    }
    else
    {
      v173 = *(void (**)(uint64_t, uint64_t))(v1[71] + 8);
      v173(v1[73], v1[50]);
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
    }

    v178 = v1[45];
    v179 = *(_QWORD *)(v178 + 184);
    if (v179)
    {
      v222 = v1[82];
      v225 = v1[83];
      v218 = *((_BYTE *)v1 + 744);
      v213 = v1[80];
      v216 = v1[81];
      v180 = v1[79];
      v239 = v180;
      v181 = v1[76];
      v212 = v1[72];
      v241 = v173;
      v182 = v1[71];
      v183 = v1[68];
      v200 = v1[66];
      v184 = v1[50];
      v185 = v1[47];
      v186 = v1[44];
      v187 = *(_QWORD *)(v178 + 192);
      v188 = sub_23B9584F0();
      *(_OWORD *)logc = *((_OWORD *)v1 + 24);
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v188 - 8) + 56))(v185, 1, 1, v188);
      v233(v181, v180, v184);
      sub_23B92F2F8(v186, v183, (uint64_t (*)(_QWORD))type metadata accessor for MessageContext);
      v189 = (*(unsigned __int8 *)(v182 + 80) + 104) & ~(unint64_t)*(unsigned __int8 *)(v182 + 80);
      v190 = (v212 + *(unsigned __int8 *)(v200 + 80) + v189) & ~(unint64_t)*(unsigned __int8 *)(v200 + 80);
      v191 = swift_allocObject();
      *(_QWORD *)(v191 + 16) = 0;
      *(_QWORD *)(v191 + 24) = 0;
      *(_OWORD *)(v191 + 32) = *(_OWORD *)logc;
      *(_QWORD *)(v191 + 48) = v179;
      *(_QWORD *)(v191 + 56) = v187;
      *(_QWORD *)(v191 + 64) = v213;
      *(_QWORD *)(v191 + 72) = v216;
      *(_BYTE *)(v191 + 80) = v218;
      *(_QWORD *)(v191 + 88) = v222;
      *(_QWORD *)(v191 + 96) = v225;
      v228(v191 + v189, v181, v184);
      sub_23B92F378(v183, v191 + v190, (uint64_t (*)(_QWORD))type metadata accessor for MessageContext);
      sub_23B92ED9C(v179);
      swift_bridgeObjectRetain();
      sub_23B92ED9C(v179);
      swift_bridgeObjectRetain();
      sub_23B94CA58(v185, (uint64_t)&unk_256A555F8, v191);
      swift_release();
      sub_23B92D238(v179);
      v241(v239, v184);
    }
    else
    {
      v173(v1[79], v1[50]);
    }
LABEL_20:
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
    return ((uint64_t (*)(void))v1[1])();
  }
  v14 = v1[45];
  v15 = *(_QWORD *)(v14 + 248);
  v1[84] = v15;
  v1[85] = *(_QWORD *)(v14 + 256);
  if (!v15)
  {
    if (qword_254309BF0 != -1)
      swift_once();
    v101 = sub_23B95831C();
    __swift_project_value_buffer(v101, (uint64_t)qword_254309BD8);
    v102 = sub_23B958304();
    v103 = sub_23B958550();
    v104 = os_log_type_enabled(v102, v103);
    v105 = v1[79];
    v106 = v1[71];
    v107 = v1[50];
    if (v104)
    {
      v237 = v1[79];
      v108 = (uint8_t *)swift_slowAlloc();
      v109 = v1;
      v110 = swift_slowAlloc();
      v242[0] = v110;
      *(_DWORD *)v108 = 136446210;
      v114 = sub_23B91B910(v110, v111, v112, v113);
      v109[30] = sub_23B9287E0(v114, v115, v242);
      sub_23B9585A4();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_23B916000, v102, v103, "%{public}s: No replyCallback!", v108, 0xCu);
      swift_arrayDestroy();
      v116 = v110;
      v1 = v109;
      MEMORY[0x242609864](v116, -1, -1);
      MEMORY[0x242609864](v108, -1, -1);

      (*(void (**)(uint64_t, uint64_t))(v106 + 8))(v237, v107);
    }
    else
    {

      (*(void (**)(uint64_t, uint64_t))(v106 + 8))(v105, v107);
    }
    goto LABEL_20;
  }
  v234 = (int *)v15;
  sub_23B92ED9C(v15);
  if (qword_254309BF0 != -1)
    swift_once();
  v16 = v1[79];
  v17 = v1[77];
  v18 = v1[71];
  v19 = v1[70];
  v20 = v1[50];
  v21 = v1[44];
  v22 = sub_23B95831C();
  v1[86] = __swift_project_value_buffer(v22, (uint64_t)qword_254309BD8);
  sub_23B92F2F8(v21, v19, (uint64_t (*)(_QWORD))type metadata accessor for MessageContext);
  v23 = *(void (**)(uint64_t, uint64_t, uint64_t))(v18 + 16);
  v23(v17, v16, v20);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  v24 = sub_23B958304();
  v25 = sub_23B958568();
  v26 = os_log_type_enabled(v24, v25);
  v27 = v1[83];
  if (v26)
  {
    v208 = v1[82];
    log = v24;
    v219 = v1[77];
    v214 = v1[76];
    v223 = v1[71];
    v28 = v1[70];
    v29 = v1[50];
    v231 = v25;
    v30 = v1[41];
    v205 = (os_log_t)v1[40];
    v31 = swift_slowAlloc();
    v226 = swift_slowAlloc();
    v242[0] = v226;
    *(_DWORD *)v31 = 136316162;
    v35 = sub_23B91B910(v226, v32, v33, v34);
    v1[35] = sub_23B9287E0(v35, v36, v242);
    sub_23B9585A4();
    swift_bridgeObjectRelease();
    *(_WORD *)(v31 + 12) = 2080;
    sub_23B92F2B8(&qword_256A55510, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAB8]);
    v37 = sub_23B9587F0();
    v1[36] = sub_23B9287E0(v37, v38, v242);
    sub_23B9585A4();
    swift_bridgeObjectRelease();
    sub_23B92F33C(v28, (uint64_t (*)(_QWORD))type metadata accessor for MessageContext);
    *(_WORD *)(v31 + 22) = 2080;
    swift_bridgeObjectRetain();
    v1[37] = sub_23B9287E0((uint64_t)v205, v30, v242);
    sub_23B9585A4();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v31 + 32) = 2080;
    swift_bridgeObjectRetain();
    v1[38] = sub_23B9287E0(v208, v27, v242);
    sub_23B9585A4();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v31 + 42) = 2080;
    v23(v214, v219, v29);
    v39 = *(void (**)(uint64_t, uint64_t))(v223 + 8);
    v39(v219, v29);
    Message.description.getter(v29);
    v41 = v40;
    v43 = v42;
    v39(v214, v29);
    v1[39] = sub_23B9287E0(v41, v43, v242);
    sub_23B9585A4();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23B916000, log, v231, "%s: Received message %s on %s from %s: %s expecting response", (uint8_t *)v31, 0x34u);
    swift_arrayDestroy();
    MEMORY[0x242609864](v226, -1, -1);
    MEMORY[0x242609864](v31, -1, -1);

  }
  else
  {
    v117 = v1[70];
    v39 = *(void (**)(uint64_t, uint64_t))(v1[71] + 8);
    v39(v1[77], v1[50]);
    sub_23B92F33C(v117, (uint64_t (*)(_QWORD))type metadata accessor for MessageContext);
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();

  }
  v1[87] = v39;
  v118 = v1[83];
  v119 = v1[82];
  v120 = *((_BYTE *)v1 + 744);
  v121 = v1[81];
  v1[11] = v1[80];
  v1[12] = v121;
  *((_BYTE *)v1 + 40) = v120;
  v1[6] = v119;
  v1[7] = v118;
  v122 = sub_23B91BB48(MEMORY[0x24BEE4AF8], &qword_256A55BD0, &qword_256A55580, (uint64_t (*)(uint64_t *, unint64_t))sub_23B92DA04);
  v1[88] = v122;
  v238 = (int *)((char *)v234 + *v234);
  v123 = (_QWORD *)swift_task_alloc();
  v1[89] = v123;
  *v123 = v1;
  v123[1] = sub_23B9261EC;
  return ((uint64_t (*)(_QWORD, _QWORD *, _QWORD *, _QWORD, unint64_t, _QWORD))v238)(v1[75], v1 + 11, v1 + 5, v1[79], v122, v1[44]);
}

uint64_t sub_23B9261EC()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 720) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_bridgeObjectRelease();
  return swift_task_switch();
}

uint64_t sub_23B926260()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  int *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  char v19;
  uint64_t v20;
  uint64_t v21;

  v1 = *(_QWORD *)(v0 + 664);
  v19 = *(_BYTE *)(v0 + 744);
  v20 = *(_QWORD *)(v0 + 656);
  v21 = *(_QWORD *)(v0 + 520);
  v3 = *(int **)(v0 + 504);
  v2 = *(_QWORD *)(v0 + 512);
  v4 = *(_QWORD *)(v0 + 496);
  v6 = *(_QWORD *)(v0 + 440);
  v5 = *(_QWORD *)(v0 + 448);
  v7 = *(_QWORD *)(v0 + 408);
  v8 = *(_QWORD *)(v0 + 352);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256A55468);
  v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_23B958EB0;
  *(_BYTE *)(v9 + 32) = v19;
  *(_QWORD *)(v9 + 40) = v20;
  *(_QWORD *)(v9 + 48) = v1;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v4, v8 + *(int *)(v7 + 20), v6);
  v10 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v5 + 56);
  v10(v4, 0, 1, v6);
  swift_bridgeObjectRetain();
  v11 = MEMORY[0x24BEE4AF8];
  v12 = sub_23B92D6F4(MEMORY[0x24BEE4AF8]);
  v13 = sub_23B92D6F4(v11);
  v14 = v2 + v3[7];
  v10(v14, 1, 1, v6);
  sub_23B9582EC();
  *(_QWORD *)(v2 + v3[5]) = v9;
  *(_BYTE *)(v2 + v3[6]) = 0;
  sub_23B92F020(v4, v14);
  v15 = v2 + v3[8];
  *(_QWORD *)v15 = 0;
  *(_BYTE *)(v15 + 8) = 1;
  *(_BYTE *)(v2 + v3[9]) = 0;
  *(_QWORD *)(v2 + v3[10]) = v12;
  *(_QWORD *)(v2 + v3[11]) = v13;
  v16 = (_QWORD *)(v2 + v3[12]);
  *v16 = 0;
  v16[1] = 0;
  sub_23B930790(v4, &qword_254309A30);
  *(_OWORD *)(v2 + v3[13]) = xmmword_23B958F90;
  sub_23B92F378(v2, v21, (uint64_t (*)(_QWORD))type metadata accessor for MessagingOptions);
  v17 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 728) = v17;
  *v17 = v0;
  v17[1] = sub_23B926440;
  return InternetMessaging.send(message:messageOptions:)(*(_QWORD *)(v0 + 480), *(_QWORD *)(v0 + 600), *(_QWORD *)(v0 + 520));
}

uint64_t sub_23B926440()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  v2 = *(_QWORD **)v1;
  *(_QWORD *)(*(_QWORD *)v1 + 736) = v0;
  swift_task_dealloc();
  if (!v0)
    (*(void (**)(_QWORD, _QWORD))(v2[56] + 8))(v2[60], v2[55]);
  return swift_task_switch();
}

uint64_t sub_23B9264BC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t);

  v1 = *(_QWORD *)(v0 + 632);
  v2 = *(_QWORD *)(v0 + 600);
  v3 = *(_QWORD *)(v0 + 568);
  v4 = *(_QWORD *)(v0 + 520);
  v5 = *(_QWORD *)(v0 + 400);
  sub_23B92D238(*(_QWORD *)(v0 + 672));
  sub_23B92F33C(v4, (uint64_t (*)(_QWORD))type metadata accessor for MessagingOptions);
  v6 = *(void (**)(uint64_t, uint64_t))(v3 + 8);
  v6(v2, v5);
  v6(v1, v5);
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

uint64_t sub_23B926650()
{
  uint64_t v0;
  void *v1;
  void (*v2)(uint64_t, uint64_t);
  id v3;
  id v4;
  NSObject *v5;
  os_log_type_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void (*v20)(uint64_t, uint64_t);
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  swift_bridgeObjectRelease();
  v1 = *(void **)(v0 + 720);
  v2 = *(void (**)(uint64_t, uint64_t))(v0 + 696);
  v3 = v1;
  v4 = v1;
  v5 = sub_23B958304();
  v6 = sub_23B958550();
  if (os_log_type_enabled(v5, v6))
  {
    v21 = *(_QWORD *)(v0 + 672);
    v22 = *(_QWORD *)(v0 + 400);
    v23 = *(_QWORD *)(v0 + 632);
    v7 = swift_slowAlloc();
    v20 = v2;
    v8 = (_QWORD *)swift_slowAlloc();
    v9 = swift_slowAlloc();
    v24 = v9;
    *(_DWORD *)v7 = 136446466;
    v13 = sub_23B91B910(v9, v10, v11, v12);
    *(_QWORD *)(v0 + 264) = sub_23B9287E0(v13, v14, &v24);
    sub_23B9585A4();
    swift_bridgeObjectRelease();
    *(_WORD *)(v7 + 12) = 2114;
    v15 = v1;
    v16 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v0 + 272) = v16;
    sub_23B9585A4();
    *v8 = v16;

    _os_log_impl(&dword_23B916000, v5, v6, "%{public}s: Error sending response: %{public}@", (uint8_t *)v7, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256A555C8);
    swift_arrayDestroy();
    MEMORY[0x242609864](v8, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x242609864](v9, -1, -1);
    MEMORY[0x242609864](v7, -1, -1);
    sub_23B92D238(v21);

    v20(v23, v22);
  }
  else
  {
    v17 = *(_QWORD *)(v0 + 632);
    v18 = *(_QWORD *)(v0 + 400);
    sub_23B92D238(*(_QWORD *)(v0 + 672));

    v2(v17, v18);
  }
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

uint64_t sub_23B9269B0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void (*v4)(uint64_t, uint64_t);
  void *v5;
  id v6;
  id v7;
  NSObject *v8;
  os_log_type_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void (*v23)(uint64_t, uint64_t);
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v1 = *(_QWORD *)(v0 + 600);
  v2 = *(_QWORD *)(v0 + 568);
  v3 = *(_QWORD *)(v0 + 400);
  sub_23B92F33C(*(_QWORD *)(v0 + 520), (uint64_t (*)(_QWORD))type metadata accessor for MessagingOptions);
  v4 = *(void (**)(uint64_t, uint64_t))(v2 + 8);
  v4(v1, v3);
  v5 = *(void **)(v0 + 736);
  v6 = v5;
  v7 = v5;
  v8 = sub_23B958304();
  v9 = sub_23B958550();
  if (os_log_type_enabled(v8, v9))
  {
    v24 = *(_QWORD *)(v0 + 672);
    v25 = *(_QWORD *)(v0 + 400);
    v26 = *(_QWORD *)(v0 + 632);
    v10 = swift_slowAlloc();
    v23 = v4;
    v11 = (_QWORD *)swift_slowAlloc();
    v12 = swift_slowAlloc();
    v27 = v12;
    *(_DWORD *)v10 = 136446466;
    v16 = sub_23B91B910(v12, v13, v14, v15);
    *(_QWORD *)(v0 + 264) = sub_23B9287E0(v16, v17, &v27);
    sub_23B9585A4();
    swift_bridgeObjectRelease();
    *(_WORD *)(v10 + 12) = 2114;
    v18 = v5;
    v19 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v0 + 272) = v19;
    sub_23B9585A4();
    *v11 = v19;

    _os_log_impl(&dword_23B916000, v8, v9, "%{public}s: Error sending response: %{public}@", (uint8_t *)v10, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256A555C8);
    swift_arrayDestroy();
    MEMORY[0x242609864](v11, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x242609864](v12, -1, -1);
    MEMORY[0x242609864](v10, -1, -1);
    sub_23B92D238(v24);

    v23(v26, v25);
  }
  else
  {
    v20 = *(_QWORD *)(v0 + 632);
    v21 = *(_QWORD *)(v0 + 400);
    sub_23B92D238(*(_QWORD *)(v0 + 672));

    v4(v20, v21);
  }
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

uint64_t sub_23B926D30(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8)
{
  uint64_t v8;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;

  *(_QWORD *)(v8 + 104) = v11;
  *(_QWORD *)(v8 + 112) = v12;
  *(_OWORD *)(v8 + 88) = v10;
  *(_BYTE *)(v8 + 136) = a8;
  *(_QWORD *)(v8 + 72) = a6;
  *(_QWORD *)(v8 + 80) = a7;
  *(_QWORD *)(v8 + 56) = a4;
  *(_QWORD *)(v8 + 64) = a5;
  return swift_task_switch();
}

uint64_t sub_23B926D64()
{
  uint64_t v0;
  __int128 v1;
  char v2;
  uint64_t v3;
  int *v4;
  unint64_t v5;
  _QWORD *v6;
  int *v8;

  v1 = *(_OWORD *)(v0 + 88);
  v2 = *(_BYTE *)(v0 + 136);
  v3 = *(_QWORD *)(v0 + 80);
  *(_QWORD *)(v0 + 40) = *(_QWORD *)(v0 + 72);
  v4 = *(int **)(v0 + 56);
  *(_QWORD *)(v0 + 48) = v3;
  *(_BYTE *)(v0 + 16) = v2;
  *(_OWORD *)(v0 + 24) = v1;
  v5 = sub_23B91BB48(MEMORY[0x24BEE4AF8], &qword_256A55BD0, &qword_256A55580, (uint64_t (*)(uint64_t *, unint64_t))sub_23B92DA04);
  *(_QWORD *)(v0 + 120) = v5;
  v8 = (int *)((char *)v4 + *v4);
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 128) = v6;
  *v6 = v0;
  v6[1] = sub_23B926E28;
  return ((uint64_t (*)(uint64_t, uint64_t, _QWORD, unint64_t, _QWORD))v8)(v0 + 40, v0 + 16, *(_QWORD *)(v0 + 104), v5, *(_QWORD *)(v0 + 112));
}

uint64_t sub_23B926E28()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

void sub_23B926E78(void (*a1)(char *, uint64_t), unint64_t a2, uint64_t *a3, uint64_t a4, uint64_t a5, unsigned __int8 *a6, uint64_t a7)
{
  _QWORD *v7;
  uint64_t v13;
  uint64_t v14;
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
  uint64_t v25;
  char *v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  BOOL v31;
  unint64_t v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  NSObject *v38;
  os_log_type_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void (*v52)(char *, char *, uint64_t);
  char *v53;
  unint64_t v54;
  NSObject *v55;
  os_log_type_t v56;
  _BOOL4 v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  unint64_t v65;
  uint64_t v66;
  unint64_t v67;
  unint64_t v68;
  char *v69;
  void (*v70)(char *, uint64_t);
  uint64_t v71;
  uint64_t v72;
  unint64_t v73;
  unint64_t v74;
  char *v75;
  void (*v76)(char *, uint64_t);
  os_log_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  unint64_t v84;
  unint64_t v85;
  unint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  unint64_t v90;
  uint64_t v91;
  os_log_t v92;
  uint64_t v93;
  int v94;
  void (*v95)(char *, char *, uint64_t);
  char *v96;
  uint64_t v97;
  int v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  char *v107;
  uint64_t v108;
  unint64_t v109;
  char *v110;
  uint64_t v111;
  char *v112;
  _QWORD *v113;
  uint64_t v114;
  uint64_t v115;
  void (*v116)(char *, uint64_t);
  uint64_t v117;
  uint64_t v118[2];

  v104 = a7;
  v13 = *v7;
  v103 = *(_QWORD *)(type metadata accessor for MessageContext() - 8);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v105 = v14;
  v106 = (uint64_t)&v91 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254309C80);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v16 = (char *)&v91 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = *(_QWORD *)(v13 + 80);
  v18 = *(_QWORD *)(v13 + 88);
  v114 = v13;
  v100 = v18;
  v101 = v17;
  v115 = type metadata accessor for Message(0, v17, v18, v19);
  v111 = *(_QWORD *)(v115 - 8);
  v20 = *(_QWORD *)(v111 + 64);
  v21 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v110 = (char *)&v91 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = MEMORY[0x24BDAC7A8](v21);
  v107 = (char *)&v91 - v23;
  v24 = MEMORY[0x24BDAC7A8](v22);
  v26 = (char *)&v91 - v25;
  MEMORY[0x24BDAC7A8](v24);
  v112 = (char *)&v91 - v27;
  v99 = *a3;
  v102 = a3[1];
  v98 = *a6;
  v28 = *((_QWORD *)a6 + 2);
  v108 = *((_QWORD *)a6 + 1);
  v109 = v28;
  v30 = v7[14];
  v29 = v7[15];
  v113 = v7;
  v116 = a1;
  v31 = v30 == (_QWORD)a1;
  v32 = a2;
  if (v31 && v29 == a2 || (sub_23B958820() & 1) != 0)
  {
    v97 = a5;
    v33 = sub_23B958268();
    v35 = v34;
    v96 = v16;
    sub_23B9581E4();
    swift_allocObject();
    sub_23B9581D8();
    v36 = v115;
    MEMORY[0x2426097B0](&protocol conformance descriptor for Message<A>, v115);
    sub_23B9581C0();
    sub_23B92D4DC(v33, v35);
    swift_release();
    v49 = v111;
    v48 = v112;
    v95 = *(void (**)(char *, char *, uint64_t))(v111 + 32);
    v95(v112, v26, v36);
    v50 = v36;
    if (qword_254309BF0 != -1)
      swift_once();
    v51 = sub_23B95831C();
    __swift_project_value_buffer(v51, (uint64_t)qword_254309BD8);
    v52 = *(void (**)(char *, char *, uint64_t))(v49 + 16);
    v53 = v107;
    v52(v107, v48, v36);
    swift_bridgeObjectRetain_n();
    v54 = v109;
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    v55 = sub_23B958304();
    v56 = sub_23B958568();
    v94 = v56;
    v57 = os_log_type_enabled(v55, v56);
    v58 = (uint64_t)v96;
    if (v57)
    {
      v59 = swift_slowAlloc();
      v60 = swift_slowAlloc();
      v93 = v60;
      v118[0] = v60;
      *(_DWORD *)v59 = 136316419;
      v92 = v55;
      v64 = sub_23B91B910(v60, v61, v62, v63);
      v117 = sub_23B9287E0(v64, v65, v118);
      sub_23B9585A4();
      swift_bridgeObjectRelease();
      *(_WORD *)(v59 + 12) = 2082;
      swift_bridgeObjectRetain();
      v117 = sub_23B9287E0((uint64_t)v116, v32, v118);
      sub_23B9585A4();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v59 + 22) = 2160;
      v117 = 1752392040;
      sub_23B9585A4();
      *(_WORD *)(v59 + 32) = 2081;
      swift_bridgeObjectRetain();
      v117 = sub_23B9287E0(v108, v54, v118);
      sub_23B9585A4();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v59 + 42) = 2080;
      swift_bridgeObjectRetain();
      __swift_instantiateConcreteTypeFromMangledName(&qword_256A555E0);
      v66 = sub_23B958358();
      v68 = v67;
      swift_bridgeObjectRelease();
      v117 = sub_23B9287E0(v66, v68, v118);
      sub_23B9585A4();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v59 + 52) = 2082;
      v69 = v110;
      v52(v110, v53, v115);
      v70 = *(void (**)(char *, uint64_t))(v111 + 8);
      v70(v53, v115);
      Message.description.getter(v115);
      v72 = v71;
      v74 = v73;
      v75 = v69;
      v76 = v70;
      v70(v75, v115);
      v117 = sub_23B9287E0(v72, v74, v118);
      v58 = (uint64_t)v96;
      sub_23B9585A4();
      swift_bridgeObjectRelease();
      v77 = v92;
      _os_log_impl(&dword_23B916000, v92, (os_log_type_t)v94, "%s: Received (resource) message on %{public}s from %{private,mask.hash}s: metadata: %s'; message: %{public}s",
        (uint8_t *)v59,
        0x3Eu);
      v78 = v93;
      swift_arrayDestroy();
      MEMORY[0x242609864](v78, -1, -1);
      v79 = v59;
      v50 = v115;
      MEMORY[0x242609864](v79, -1, -1);

    }
    else
    {
      v76 = *(void (**)(char *, uint64_t))(v49 + 8);
      v76(v53, v50);

      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
    }
    v80 = v113[23];
    if (v80)
    {
      v81 = v113[24];
      v82 = sub_23B9584F0();
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v82 - 8) + 56))(v58, 1, 1, v82);
      v116 = v76;
      v52(v110, v112, v50);
      v83 = v106;
      sub_23B92F2F8(v104, v106, (uint64_t (*)(_QWORD))type metadata accessor for MessageContext);
      v84 = (*(unsigned __int8 *)(v111 + 80) + 104) & ~(unint64_t)*(unsigned __int8 *)(v111 + 80);
      v85 = (v20 + v84 + 7) & 0xFFFFFFFFFFFFFFF8;
      v86 = (*(unsigned __int8 *)(v103 + 80) + v85 + 8) & ~(unint64_t)*(unsigned __int8 *)(v103 + 80);
      v87 = swift_allocObject();
      *(_QWORD *)(v87 + 16) = 0;
      *(_QWORD *)(v87 + 24) = 0;
      v88 = v100;
      *(_QWORD *)(v87 + 32) = v101;
      *(_QWORD *)(v87 + 40) = v88;
      *(_QWORD *)(v87 + 48) = v80;
      *(_QWORD *)(v87 + 56) = v81;
      v89 = v102;
      *(_QWORD *)(v87 + 64) = v99;
      *(_QWORD *)(v87 + 72) = v89;
      *(_BYTE *)(v87 + 80) = v98;
      v90 = v109;
      *(_QWORD *)(v87 + 88) = v108;
      *(_QWORD *)(v87 + 96) = v90;
      v95((char *)(v87 + v84), v110, v50);
      *(_QWORD *)(v87 + v85) = v97;
      sub_23B92F378(v83, v87 + v86, (uint64_t (*)(_QWORD))type metadata accessor for MessageContext);
      sub_23B92ED9C(v80);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_23B92ED9C(v80);
      swift_bridgeObjectRetain();
      sub_23B94CA58((uint64_t)v96, (uint64_t)&unk_256A555D8, v87);
      swift_release();
      sub_23B92D238(v80);
      v116(v112, v50);
    }
    else
    {
      v76(v112, v50);
    }
  }
  else
  {
    if (qword_254309BF0 != -1)
      swift_once();
    v37 = sub_23B95831C();
    __swift_project_value_buffer(v37, (uint64_t)qword_254309BD8);
    swift_bridgeObjectRetain_n();
    swift_retain_n();
    v38 = sub_23B958304();
    v39 = sub_23B958550();
    if (os_log_type_enabled(v38, v39))
    {
      v40 = swift_slowAlloc();
      v41 = swift_slowAlloc();
      v115 = v41;
      v118[0] = v41;
      *(_DWORD *)v40 = 136446722;
      v45 = sub_23B91B910(v41, v42, v43, v44);
      v117 = sub_23B9287E0(v45, v46, v118);
      sub_23B9585A4();
      swift_bridgeObjectRelease();
      *(_WORD *)(v40 + 12) = 2082;
      swift_bridgeObjectRetain();
      v117 = sub_23B9287E0(v30, v29, v118);
      sub_23B9585A4();
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v40 + 22) = 2082;
      swift_bridgeObjectRetain();
      v117 = sub_23B9287E0((uint64_t)v116, a2, v118);
      sub_23B9585A4();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_23B916000, v38, v39, "%{public}s: Ignoring delegate callback from wrong IDS service! Expected %{public}s, received: %{public}s", (uint8_t *)v40, 0x20u);
      v47 = v115;
      swift_arrayDestroy();
      MEMORY[0x242609864](v47, -1, -1);
      MEMORY[0x242609864](v40, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
      swift_release_n();
    }
  }
}

uint64_t sub_23B927A68(uint64_t a1, uint64_t a2, uint64_t a3, int *a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8)
{
  uint64_t v8;
  _QWORD *v9;
  uint64_t (*v11)(uint64_t, uint64_t);
  uint64_t v12;
  uint64_t v13;

  *(_QWORD *)(v8 + 40) = a6;
  *(_BYTE *)(v8 + 16) = a8;
  *(_QWORD *)(v8 + 48) = a7;
  *(_QWORD *)(v8 + 24) = v12;
  *(_QWORD *)(v8 + 32) = v13;
  v11 = (uint64_t (*)(uint64_t, uint64_t))((char *)a4 + *a4);
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v8 + 56) = v9;
  *v9 = v8;
  v9[1] = sub_23B93083C;
  return v11(v8 + 40, v8 + 16);
}

uint64_t sub_23B927B08(uint64_t a1, uint64_t a2, uint64_t a3, int *a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8)
{
  uint64_t v8;
  _QWORD *v9;
  uint64_t (*v11)(uint64_t, uint64_t);
  uint64_t v12;
  uint64_t v13;

  *(_QWORD *)(v8 + 40) = a6;
  *(_BYTE *)(v8 + 16) = a8;
  *(_QWORD *)(v8 + 48) = a7;
  *(_QWORD *)(v8 + 24) = v12;
  *(_QWORD *)(v8 + 32) = v13;
  v11 = (uint64_t (*)(uint64_t, uint64_t))((char *)a4 + *a4);
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v8 + 56) = v9;
  *v9 = v8;
  v9[1] = sub_23B927B9C;
  return v11(v8 + 40, v8 + 16);
}

uint64_t sub_23B927B9C()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_23B927BE4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, uint64_t a6)
{
  uint64_t v6;
  uint64_t v7;

  *(_QWORD *)(v7 + 32) = a6;
  *(_QWORD *)(v7 + 40) = v6;
  *(_BYTE *)(v7 + 48) = a5;
  *(_QWORD *)(v7 + 16) = a3;
  *(_QWORD *)(v7 + 24) = a4;
  return swift_task_switch();
}

uint64_t sub_23B927C04()
{
  uint64_t v0;

  sub_23B92DA58(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(_BYTE *)(v0 + 48), *(void **)(v0 + 32));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23B927C3C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  _QWORD *v9;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t);

  v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&dword_256A55600 + dword_256A55600);
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v5 + 16) = v9;
  *v9 = v5;
  v9[1] = sub_23B930844;
  return v11(a3, a4, a5);
}

uint64_t sub_23B927CB8(uint64_t a1, uint64_t a2, _QWORD *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  _QWORD *v15;

  v15 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v7 + 16) = v15;
  *v15 = v7;
  v15[1] = sub_23B930844;
  return sub_23B92451C(a1, a2, a3, a4, a5, a6, a7);
}

uint64_t sub_23B927D50(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  _QWORD *v8;

  v8[8] = a7;
  v8[9] = v7;
  v8[6] = a5;
  v8[7] = a6;
  v8[4] = a3;
  v8[5] = a4;
  v8[2] = a1;
  v8[3] = a2;
  return swift_task_switch();
}

uint64_t sub_23B927D78()
{
  uint64_t v0;

  sub_23B926E78(*(void (**)(char *, uint64_t))(v0 + 16), *(_QWORD *)(v0 + 24), *(uint64_t **)(v0 + 32), *(_QWORD *)(v0 + 40), *(_QWORD *)(v0 + 48), *(unsigned __int8 **)(v0 + 56), *(_QWORD *)(v0 + 64));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23B927DB4(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  _QWORD *v14;
  uint64_t (*v16)(uint64_t, uint64_t, uint64_t *, uint64_t, uint64_t, uint64_t);

  v16 = (uint64_t (*)(uint64_t, uint64_t, uint64_t *, uint64_t, uint64_t, uint64_t))((char *)&dword_256A555B0
                                                                                       + dword_256A555B0);
  v14 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v7 + 16) = v14;
  *v14 = v7;
  v14[1] = sub_23B930844;
  return v16(a1, a2, a3, a4, a6, a7);
}

uint64_t sub_23B927E54(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v5;
  uint64_t (*v7)(uint64_t);

  v7 = (uint64_t (*)(uint64_t))((char *)&dword_256A555A8 + dword_256A555A8);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v5;
  *v5 = v3;
  v5[1] = sub_23B930844;
  return v7(a3);
}

uint64_t sub_23B927EB8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v5;
  uint64_t (*v7)(uint64_t);

  v7 = (uint64_t (*)(uint64_t))((char *)&dword_256A555A0 + dword_256A555A0);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v5;
  *v5 = v3;
  v5[1] = sub_23B930844;
  return v7(a3);
}

uint64_t sub_23B927F20(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  v3 = *(_QWORD *)(v2 + 168);
  *(_QWORD *)(v2 + 168) = a1;
  *(_QWORD *)(v2 + 176) = a2;
  swift_retain();
  return sub_23B92D238(v3);
}

uint64_t sub_23B927F5C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  v3 = *(_QWORD *)(v2 + 184);
  *(_QWORD *)(v2 + 184) = a1;
  *(_QWORD *)(v2 + 192) = a2;
  swift_retain();
  return sub_23B92D238(v3);
}

uint64_t sub_23B927F98(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  v3 = *(_QWORD *)(v2 + 200);
  *(_QWORD *)(v2 + 200) = a1;
  *(_QWORD *)(v2 + 208) = a2;
  swift_retain();
  return sub_23B92D238(v3);
}

uint64_t sub_23B927FD4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  v3 = *(_QWORD *)(v2 + 216);
  *(_QWORD *)(v2 + 216) = a1;
  *(_QWORD *)(v2 + 224) = a2;
  swift_retain();
  return sub_23B92D238(v3);
}

uint64_t sub_23B928010(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  v3 = *(_QWORD *)(v2 + 232);
  *(_QWORD *)(v2 + 232) = a1;
  *(_QWORD *)(v2 + 240) = a2;
  swift_retain();
  return sub_23B92D238(v3);
}

uint64_t InternetMessaging.setReplyCallback(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  v3 = *(_QWORD *)(v2 + 248);
  *(_QWORD *)(v2 + 248) = a1;
  *(_QWORD *)(v2 + 256) = a2;
  swift_retain();
  return sub_23B92D238(v3);
}

uint64_t InternetMessaging.description.getter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v5 = type metadata accessor for InternetMessaging(0, *(_QWORD *)(*(_QWORD *)v4 + 80), *(_QWORD *)(*(_QWORD *)v4 + 88), a4);
  v6 = MEMORY[0x2426097B0](&protocol conformance descriptor for InternetMessaging<A>, v5);
  sub_23B9587D8();
  sub_23B958400();
  swift_bridgeObjectRelease();
  sub_23B958400();
  MEMORY[0x242609300](v5, v6);
  sub_23B958400();
  swift_bridgeObjectRelease();
  sub_23B958400();
  swift_bridgeObjectRetain();
  sub_23B958400();
  swift_bridgeObjectRelease();
  sub_23B958400();
  return 60;
}

uint64_t sub_23B92818C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return InternetMessaging.description.getter(a1, a2, a3, a4);
}

uint64_t sub_23B9281AC()
{
  uint64_t v0;

  v0 = sub_23B95831C();
  __swift_allocate_value_buffer(v0, qword_254309CF0);
  __swift_project_value_buffer(v0, (uint64_t)qword_254309CF0);
  return sub_23B958310();
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2426097A4](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

_QWORD *sub_23B928270(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_254309CC8);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v10[2] = v8;
      v10[3] = 2 * ((uint64_t)(v11 - 32) / 160);
      v12 = v10 + 4;
      if ((v5 & 1) != 0)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[20 * v8 + 4])
          memmove(v12, a4 + 4, 160 * v8);
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
    sub_23B92D248(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_23B928390(char a1, int64_t a2, char a3, unint64_t a4)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_256A55630);
  v10 = *(_QWORD *)(type metadata accessor for CorrelationIdentifier() - 8);
  v11 = *(_QWORD *)(v10 + 72);
  v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v13 = (_QWORD *)swift_allocObject();
  v14 = _swift_stdlib_malloc_size(v13);
  if (!v11 || (v14 - v12 == 0x8000000000000000 ? (v15 = v11 == -1) : (v15 = 0), v15))
  {
LABEL_29:
    result = sub_23B958718();
    __break(1u);
    return result;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  v16 = *(_QWORD *)(type metadata accessor for CorrelationIdentifier() - 8);
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
    sub_23B92F0AC(0, v8, v18, a4);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v13;
}

_QWORD *sub_23B928598(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_256A55468);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v10[2] = v8;
      v10[3] = 2 * ((uint64_t)(v11 - 32) / 24);
      v12 = v10 + 4;
      if ((v5 & 1) != 0)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[3 * v8 + 4])
          memmove(v12, a4 + 4, 24 * v8);
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
    sub_23B92F1C4(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

_QWORD *sub_23B9286BC(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_256A55588);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v10[2] = v8;
      v10[3] = 2 * ((uint64_t)(v11 - 32) / 48);
      v12 = v10 + 4;
      if ((v5 & 1) != 0)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[6 * v8 + 4])
          memmove(v12, a4 + 4, 48 * v8);
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
    sub_23B92D33C(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_23B9287E0(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_23B9288B0(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_23B91B298((uint64_t)v12, *a3);
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
      sub_23B91B298((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_23B9288B0(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_23B9585B0();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_23B928A68(a5, a6);
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
  v8 = sub_23B9586AC();
  if (!v8)
  {
    sub_23B958718();
    __break(1u);
LABEL_17:
    result = sub_23B958760();
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

uint64_t sub_23B928A68(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_23B928AFC(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_23B928CD4(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_23B928CD4(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_23B928AFC(uint64_t a1, unint64_t a2)
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
      v3 = sub_23B928C70(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_23B958694();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_23B958718();
      __break(1u);
LABEL_10:
      v2 = sub_23B95840C();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_23B958760();
    __break(1u);
LABEL_14:
    result = sub_23B958718();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_23B928C70(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_256A556F8);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_23B928CD4(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_256A556F8);
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
  result = sub_23B958760();
  __break(1u);
  return result;
}

uint64_t sub_23B928E20(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_23B928E90(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_23B928E3C(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_23B928FFC(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_23B928E58(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_23B929164(a1, a2, a3, (_QWORD *)*v3);
  *v3 = result;
  return result;
}

uint64_t sub_23B928E74(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_23B929304(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_23B928E90(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_254309C98);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 1;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 5);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[32 * v8])
      memmove(v13, v14, 32 * v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[32 * v8] || v13 >= &v14[32 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  result = sub_23B958760();
  __break(1u);
  return result;
}

uint64_t sub_23B928FFC(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_256A556F0);
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
  result = sub_23B958760();
  __break(1u);
  return result;
}

uint64_t sub_23B929164(char a1, int64_t a2, char a3, _QWORD *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  size_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = a4[3];
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
  v8 = a4[2];
  if (v7 <= v8)
    v9 = a4[2];
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_254309CD0);
    v10 = (_QWORD *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v10[2] = v8;
    v10[3] = 2 * ((uint64_t)(v11 - 32) / 160);
  }
  else
  {
    v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  v12 = (unint64_t)(v10 + 4);
  v13 = (unint64_t)(a4 + 4);
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v12 >= v13 + 160 * v8)
      memmove(v10 + 4, a4 + 4, 160 * v8);
    a4[2] = 0;
    goto LABEL_28;
  }
  if (v13 >= v12 + 160 * v8 || v12 >= v13 + 160 * v8)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_254309CB0);
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  result = sub_23B958760();
  __break(1u);
  return result;
}

uint64_t sub_23B929304(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_256A55578);
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
  result = sub_23B958760();
  __break(1u);
  return result;
}

uint64_t sub_23B92946C(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  BOOL v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v17;
  _QWORD *v18;
  BOOL v19;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v21;

  v7 = *v3;
  sub_23B958880();
  swift_bridgeObjectRetain();
  sub_23B9583F4();
  v8 = sub_23B9588B0();
  v9 = -1 << *(_BYTE *)(v7 + 32);
  v10 = v8 & ~v9;
  if (((*(_QWORD *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0)
  {
    v11 = *(_QWORD *)(v7 + 48);
    v12 = (_QWORD *)(v11 + 16 * v10);
    v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_23B958820() & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v14 = (uint64_t *)(*(_QWORD *)(*v3 + 48) + 16 * v10);
      v15 = v14[1];
      *a1 = *v14;
      a1[1] = v15;
      swift_bridgeObjectRetain();
      return 0;
    }
    v17 = ~v9;
    while (1)
    {
      v10 = (v10 + 1) & v17;
      if (((*(_QWORD *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) == 0)
        break;
      v18 = (_QWORD *)(v11 + 16 * v10);
      v19 = *v18 == a2 && v18[1] == a3;
      if (v19 || (sub_23B958820() & 1) != 0)
        goto LABEL_7;
    }
  }
  swift_bridgeObjectRelease();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v21 = *v3;
  *v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_23B92B000(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_23B929618(_BYTE *a1, unsigned __int8 *a2)
{
  uint64_t *v2;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  char isUniquelyReferenced_nonNull_native;
  uint64_t result;
  char v12;
  uint64_t v13;

  v4 = *v2;
  v5 = *a2;
  sub_23B958880();
  sub_23B95888C();
  v6 = sub_23B9588B0();
  v7 = -1 << *(_BYTE *)(v4 + 32);
  v8 = v6 & ~v7;
  if (((*(_QWORD *)(v4 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFF8)) >> v8) & 1) != 0)
  {
    v9 = ~v7;
    while (*(unsigned __int8 *)(*(_QWORD *)(v4 + 48) + v8) != v5)
    {
      v8 = (v8 + 1) & v9;
      if (((*(_QWORD *)(v4 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFF8)) >> v8) & 1) == 0)
        goto LABEL_5;
    }
    result = 0;
    LOBYTE(v5) = *(_BYTE *)(*(_QWORD *)(*v2 + 48) + v8);
  }
  else
  {
LABEL_5:
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v12 = v5;
    v13 = *v2;
    *v2 = 0x8000000000000000;
    sub_23B92B198((uint64_t)&v12, v8, isUniquelyReferenced_nonNull_native);
    *v2 = v13;
    swift_bridgeObjectRelease();
    result = 1;
  }
  *a1 = v5;
  return result;
}

uint64_t sub_23B92972C(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
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
  char *v22;
  uint64_t v23;
  int EnumCaseMultiPayload;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  char *v34;
  char *v35;
  char v36;
  void (*v37)(char *, uint64_t);
  char *v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char v45;
  uint64_t *v46;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v48;
  uint64_t v49;
  uint64_t v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  char *v55;
  uint64_t *v56;
  char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  char *v65;
  uint64_t v66;
  uint64_t v67;

  v54 = a1;
  v64 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A55620);
  MEMORY[0x24BDAC7A8](v64);
  v5 = (char *)&v51 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_23B9582F8();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v55 = (char *)&v51 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v51 - v10;
  v12 = type metadata accessor for CorrelationIdentifier();
  v61 = *(_QWORD *)(v12 - 8);
  v13 = MEMORY[0x24BDAC7A8](v12);
  v57 = (char *)&v51 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = MEMORY[0x24BDAC7A8](v13);
  v56 = (uint64_t *)((char *)&v51 - v16);
  v17 = MEMORY[0x24BDAC7A8](v15);
  v65 = (char *)&v51 - v18;
  v19 = MEMORY[0x24BDAC7A8](v17);
  v52 = (uint64_t)&v51 - v20;
  MEMORY[0x24BDAC7A8](v19);
  v22 = (char *)&v51 - v21;
  v53 = v2;
  v23 = *v2;
  sub_23B958880();
  v66 = a2;
  v63 = v12;
  sub_23B92F2F8(a2, (uint64_t)v22, (uint64_t (*)(_QWORD))type metadata accessor for CorrelationIdentifier);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  v59 = v7;
  if (EnumCaseMultiPayload == 1)
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v11, v22, v6);
    sub_23B95888C();
    sub_23B92F2B8((unint64_t *)&qword_254309B00, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
    swift_bridgeObjectRetain();
    sub_23B9583AC();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v11, v6);
  }
  else
  {
    sub_23B95888C();
    swift_bridgeObjectRetain();
    sub_23B9583F4();
    swift_bridgeObjectRelease();
  }
  v25 = v23;
  v26 = sub_23B9588B0();
  v27 = -1 << *(_BYTE *)(v23 + 32);
  v28 = v26 & ~v27;
  v62 = v23 + 56;
  v29 = (uint64_t)v57;
  v30 = (uint64_t)v65;
  if (((*(_QWORD *)(v23 + 56 + ((v28 >> 3) & 0xFFFFFFFFFFFFF8)) >> v28) & 1) == 0)
  {
LABEL_21:
    swift_bridgeObjectRelease();
    v46 = v53;
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v48 = v66;
    v49 = v52;
    sub_23B92F2F8(v66, v52, (uint64_t (*)(_QWORD))type metadata accessor for CorrelationIdentifier);
    v67 = *v46;
    *v46 = 0x8000000000000000;
    sub_23B92B2E0(v49, v28, isUniquelyReferenced_nonNull_native);
    *v46 = v67;
    swift_bridgeObjectRelease();
    sub_23B92F378(v48, v54, (uint64_t (*)(_QWORD))type metadata accessor for CorrelationIdentifier);
    return 1;
  }
  v60 = ~v27;
  v61 = *(_QWORD *)(v61 + 72);
  v58 = v6;
  v31 = v59;
  while (1)
  {
    v32 = v25;
    v33 = v61 * v28;
    sub_23B92F2F8(*(_QWORD *)(v25 + 48) + v61 * v28, v30, (uint64_t (*)(_QWORD))type metadata accessor for CorrelationIdentifier);
    v34 = &v5[*(int *)(v64 + 48)];
    sub_23B92F2F8(v30, (uint64_t)v5, (uint64_t (*)(_QWORD))type metadata accessor for CorrelationIdentifier);
    sub_23B92F2F8(v66, (uint64_t)v34, (uint64_t (*)(_QWORD))type metadata accessor for CorrelationIdentifier);
    if (swift_getEnumCaseMultiPayload() != 1)
      break;
    sub_23B92F2F8((uint64_t)v5, v29, (uint64_t (*)(_QWORD))type metadata accessor for CorrelationIdentifier);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v35 = v55;
      (*(void (**)(char *, char *, uint64_t))(v31 + 32))(v55, v34, v6);
      v36 = sub_23B9582E0();
      v37 = *(void (**)(char *, uint64_t))(v31 + 8);
      v38 = v35;
      v29 = (uint64_t)v57;
      v37(v38, v6);
      v37((char *)v29, v6);
      v30 = (uint64_t)v65;
      if ((v36 & 1) != 0)
        goto LABEL_23;
LABEL_20:
      sub_23B92F33C((uint64_t)v5, (uint64_t (*)(_QWORD))type metadata accessor for CorrelationIdentifier);
      v6 = v58;
      v31 = v59;
      v25 = v32;
      goto LABEL_8;
    }
    (*(void (**)(uint64_t, uint64_t))(v31 + 8))(v29, v6);
LABEL_7:
    v25 = v32;
    v30 = (uint64_t)v65;
    sub_23B930790((uint64_t)v5, &qword_256A55620);
LABEL_8:
    sub_23B92F33C(v30, (uint64_t (*)(_QWORD))type metadata accessor for CorrelationIdentifier);
    v28 = (v28 + 1) & v60;
    if (((*(_QWORD *)(v62 + ((v28 >> 3) & 0xFFFFFFFFFFFFF8)) >> v28) & 1) == 0)
      goto LABEL_21;
  }
  v39 = v56;
  sub_23B92F2F8((uint64_t)v5, (uint64_t)v56, (uint64_t (*)(_QWORD))type metadata accessor for CorrelationIdentifier);
  v41 = *v39;
  v40 = v39[1];
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    swift_bridgeObjectRelease();
    v6 = v58;
    v31 = v59;
    goto LABEL_7;
  }
  v42 = *(_QWORD *)v34;
  v43 = *((_QWORD *)v34 + 1);
  if (v41 != v42 || v40 != v43)
  {
    v45 = sub_23B958820();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v30 = (uint64_t)v65;
    if ((v45 & 1) != 0)
      goto LABEL_23;
    goto LABEL_20;
  }
  swift_bridgeObjectRelease_n();
  v30 = (uint64_t)v65;
LABEL_23:
  sub_23B92F33C((uint64_t)v5, (uint64_t (*)(_QWORD))type metadata accessor for CorrelationIdentifier);
  sub_23B92F33C(v30, (uint64_t (*)(_QWORD))type metadata accessor for CorrelationIdentifier);
  swift_bridgeObjectRelease();
  sub_23B92F33C(v66, (uint64_t (*)(_QWORD))type metadata accessor for CorrelationIdentifier);
  sub_23B92F2F8(*(_QWORD *)(*v53 + 48) + v33, v54, (uint64_t (*)(_QWORD))type metadata accessor for CorrelationIdentifier);
  return 0;
}

uint64_t sub_23B929CE8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t *v4;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unsigned __int8 *v15;
  BOOL v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t result;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v22;

  v9 = *v4;
  sub_23B958880();
  sub_23B95888C();
  swift_bridgeObjectRetain();
  sub_23B9583F4();
  v10 = sub_23B9588B0();
  v11 = -1 << *(_BYTE *)(v9 + 32);
  v12 = v10 & ~v11;
  if (((*(_QWORD *)(v9 + 56 + ((v12 >> 3) & 0xFFFFFFFFFFFFF8)) >> v12) & 1) != 0)
  {
    v13 = ~v11;
    v14 = *(_QWORD *)(v9 + 48);
    while (1)
    {
      v15 = (unsigned __int8 *)(v14 + 24 * v12);
      if (*v15 == a2)
      {
        v16 = *((_QWORD *)v15 + 1) == a3 && *((_QWORD *)v15 + 2) == a4;
        if (v16 || (sub_23B958820() & 1) != 0)
          break;
      }
      v12 = (v12 + 1) & v13;
      if (((*(_QWORD *)(v9 + 56 + ((v12 >> 3) & 0xFFFFFFFFFFFFF8)) >> v12) & 1) == 0)
        goto LABEL_11;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v17 = *(_QWORD *)(*v4 + 48) + 24 * v12;
    v19 = *(_QWORD *)(v17 + 8);
    v18 = *(_QWORD *)(v17 + 16);
    *(_BYTE *)a1 = *(_BYTE *)v17;
    *(_QWORD *)(a1 + 8) = v19;
    *(_QWORD *)(a1 + 16) = v18;
    swift_bridgeObjectRetain();
    return 0;
  }
  else
  {
LABEL_11:
    swift_bridgeObjectRelease();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v22 = *v4;
    *v4 = 0x8000000000000000;
    swift_bridgeObjectRetain();
    sub_23B92B804(a2, a3, a4, v12, isUniquelyReferenced_nonNull_native);
    *v4 = v22;
    swift_bridgeObjectRelease();
    *(_BYTE *)a1 = a2;
    result = 1;
    *(_QWORD *)(a1 + 8) = a3;
    *(_QWORD *)(a1 + 16) = a4;
  }
  return result;
}

uint64_t sub_23B929EAC(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  BOOL v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v17;
  _QWORD *v18;
  BOOL v19;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v21;

  v7 = *v3;
  sub_23B958880();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_23B9583F4();
  swift_bridgeObjectRelease();
  v8 = sub_23B9588B0();
  v9 = -1 << *(_BYTE *)(v7 + 32);
  v10 = v8 & ~v9;
  if (((*(_QWORD *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0)
  {
    v11 = *(_QWORD *)(v7 + 48);
    v12 = (_QWORD *)(v11 + 16 * v10);
    v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_23B958820() & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v14 = (uint64_t *)(*(_QWORD *)(*v3 + 48) + 16 * v10);
      v15 = v14[1];
      *a1 = *v14;
      a1[1] = v15;
      swift_bridgeObjectRetain();
      return 0;
    }
    v17 = ~v9;
    while (1)
    {
      v10 = (v10 + 1) & v17;
      if (((*(_QWORD *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) == 0)
        break;
      v18 = (_QWORD *)(v11 + 16 * v10);
      v19 = *v18 == a2 && v18[1] == a3;
      if (v19 || (sub_23B958820() & 1) != 0)
        goto LABEL_7;
    }
  }
  swift_bridgeObjectRelease();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v21 = *v3;
  *v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_23B92B9A8(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_23B92A068()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  int64_t v8;
  uint64_t v9;
  uint64_t result;
  int64_t v11;
  unint64_t v12;
  _QWORD *v13;
  unint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD *v30;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256A556E8);
  v3 = sub_23B958670();
  v4 = v3;
  if (*(_QWORD *)(v2 + 16))
  {
    v5 = 1 << *(_BYTE *)(v2 + 32);
    v30 = (_QWORD *)(v2 + 56);
    if (v5 < 64)
      v6 = ~(-1 << v5);
    else
      v6 = -1;
    v7 = v6 & *(_QWORD *)(v2 + 56);
    v8 = (unint64_t)(v5 + 63) >> 6;
    v9 = v3 + 56;
    result = swift_retain();
    v11 = 0;
    while (1)
    {
      if (v7)
      {
        v14 = __clz(__rbit64(v7));
        v7 &= v7 - 1;
        v15 = v14 | (v11 << 6);
      }
      else
      {
        v16 = v11 + 1;
        if (__OFADD__(v11, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v16 >= v8)
          goto LABEL_33;
        v17 = v30[v16];
        ++v11;
        if (!v17)
        {
          v11 = v16 + 1;
          if (v16 + 1 >= v8)
            goto LABEL_33;
          v17 = v30[v11];
          if (!v17)
          {
            v11 = v16 + 2;
            if (v16 + 2 >= v8)
              goto LABEL_33;
            v17 = v30[v11];
            if (!v17)
            {
              v18 = v16 + 3;
              if (v18 >= v8)
              {
LABEL_33:
                swift_release();
                v1 = v0;
                v29 = 1 << *(_BYTE *)(v2 + 32);
                if (v29 > 63)
                  bzero(v30, ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v30 = -1 << v29;
                *(_QWORD *)(v2 + 16) = 0;
                break;
              }
              v17 = v30[v18];
              if (!v17)
              {
                while (1)
                {
                  v11 = v18 + 1;
                  if (__OFADD__(v18, 1))
                    goto LABEL_39;
                  if (v11 >= v8)
                    goto LABEL_33;
                  v17 = v30[v11];
                  ++v18;
                  if (v17)
                    goto LABEL_23;
                }
              }
              v11 = v18;
            }
          }
        }
LABEL_23:
        v7 = (v17 - 1) & v17;
        v15 = __clz(__rbit64(v17)) + (v11 << 6);
      }
      v19 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v15);
      v20 = *v19;
      v21 = v19[1];
      sub_23B958880();
      sub_23B9583F4();
      result = sub_23B9588B0();
      v22 = -1 << *(_BYTE *)(v4 + 32);
      v23 = result & ~v22;
      v24 = v23 >> 6;
      if (((-1 << v23) & ~*(_QWORD *)(v9 + 8 * (v23 >> 6))) != 0)
      {
        v12 = __clz(__rbit64((-1 << v23) & ~*(_QWORD *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v25 = 0;
        v26 = (unint64_t)(63 - v22) >> 6;
        do
        {
          if (++v24 == v26 && (v25 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          v27 = v24 == v26;
          if (v24 == v26)
            v24 = 0;
          v25 |= v27;
          v28 = *(_QWORD *)(v9 + 8 * v24);
        }
        while (v28 == -1);
        v12 = __clz(__rbit64(~v28)) + (v24 << 6);
      }
      *(_QWORD *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
      v13 = (_QWORD *)(*(_QWORD *)(v4 + 48) + 16 * v12);
      *v13 = v20;
      v13[1] = v21;
      ++*(_QWORD *)(v4 + 16);
    }
  }
  result = swift_release();
  *v1 = v4;
  return result;
}

uint64_t sub_23B92A344()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  int64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  int64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  int64_t v15;
  unint64_t v16;
  int64_t v17;
  char v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  char v22;
  unint64_t v23;
  BOOL v24;
  uint64_t v25;
  uint64_t v26;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256A55598);
  result = sub_23B958670();
  v4 = result;
  if (*(_QWORD *)(v2 + 16))
  {
    v5 = 0;
    v6 = (_QWORD *)(v2 + 56);
    v7 = 1 << *(_BYTE *)(v2 + 32);
    if (v7 < 64)
      v8 = ~(-1 << v7);
    else
      v8 = -1;
    v9 = v8 & *(_QWORD *)(v2 + 56);
    v10 = (unint64_t)(v7 + 63) >> 6;
    v11 = result + 56;
    while (1)
    {
      if (v9)
      {
        v13 = __clz(__rbit64(v9));
        v9 &= v9 - 1;
        v14 = v13 | (v5 << 6);
      }
      else
      {
        v15 = v5 + 1;
        if (__OFADD__(v5, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v15 >= v10)
          goto LABEL_33;
        v16 = v6[v15];
        ++v5;
        if (!v16)
        {
          v5 = v15 + 1;
          if (v15 + 1 >= v10)
            goto LABEL_33;
          v16 = v6[v5];
          if (!v16)
          {
            v5 = v15 + 2;
            if (v15 + 2 >= v10)
              goto LABEL_33;
            v16 = v6[v5];
            if (!v16)
            {
              v17 = v15 + 3;
              if (v17 >= v10)
              {
LABEL_33:
                v26 = 1 << *(_BYTE *)(v2 + 32);
                if (v26 > 63)
                  bzero((void *)(v2 + 56), ((unint64_t)(v26 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v6 = -1 << v26;
                v1 = v0;
                *(_QWORD *)(v2 + 16) = 0;
                break;
              }
              v16 = v6[v17];
              if (!v16)
              {
                while (1)
                {
                  v5 = v17 + 1;
                  if (__OFADD__(v17, 1))
                    goto LABEL_39;
                  if (v5 >= v10)
                    goto LABEL_33;
                  v16 = v6[v5];
                  ++v17;
                  if (v16)
                    goto LABEL_23;
                }
              }
              v5 = v17;
            }
          }
        }
LABEL_23:
        v9 = (v16 - 1) & v16;
        v14 = __clz(__rbit64(v16)) + (v5 << 6);
      }
      v18 = *(_BYTE *)(*(_QWORD *)(v2 + 48) + v14);
      sub_23B958880();
      sub_23B95888C();
      result = sub_23B9588B0();
      v19 = -1 << *(_BYTE *)(v4 + 32);
      v20 = result & ~v19;
      v21 = v20 >> 6;
      if (((-1 << v20) & ~*(_QWORD *)(v11 + 8 * (v20 >> 6))) != 0)
      {
        v12 = __clz(__rbit64((-1 << v20) & ~*(_QWORD *)(v11 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
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
          v25 = *(_QWORD *)(v11 + 8 * v21);
        }
        while (v25 == -1);
        v12 = __clz(__rbit64(~v25)) + (v21 << 6);
      }
      *(_QWORD *)(v11 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
      *(_BYTE *)(*(_QWORD *)(v4 + 48) + v12) = v18;
      ++*(_QWORD *)(v4 + 16);
    }
  }
  result = swift_release();
  *v1 = v4;
  return result;
}

uint64_t sub_23B92A5EC()
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
  _QWORD *v9;
  uint64_t v10;
  unint64_t v11;
  int64_t v12;
  uint64_t result;
  int64_t v14;
  unint64_t v15;
  unint64_t v16;
  int64_t v17;
  unint64_t v18;
  int64_t v19;
  uint64_t v20;
  uint64_t v21;

  v1 = v0;
  v2 = type metadata accessor for CorrelationIdentifier();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256A55628);
  v7 = sub_23B958670();
  if (*(_QWORD *)(v6 + 16))
  {
    v8 = 1 << *(_BYTE *)(v6 + 32);
    v9 = (_QWORD *)(v6 + 56);
    v10 = -1;
    if (v8 < 64)
      v10 = ~(-1 << v8);
    v11 = v10 & *(_QWORD *)(v6 + 56);
    v12 = (unint64_t)(v8 + 63) >> 6;
    result = swift_retain();
    v14 = 0;
    while (1)
    {
      if (v11)
      {
        v15 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        v16 = v15 | (v14 << 6);
      }
      else
      {
        v17 = v14 + 1;
        if (__OFADD__(v14, 1))
        {
          __break(1u);
LABEL_28:
          __break(1u);
          return result;
        }
        if (v17 >= v12)
          goto LABEL_22;
        v18 = v9[v17];
        ++v14;
        if (!v18)
        {
          v14 = v17 + 1;
          if (v17 + 1 >= v12)
            goto LABEL_22;
          v18 = v9[v14];
          if (!v18)
          {
            v14 = v17 + 2;
            if (v17 + 2 >= v12)
              goto LABEL_22;
            v18 = v9[v14];
            if (!v18)
            {
              v19 = v17 + 3;
              if (v19 >= v12)
              {
LABEL_22:
                swift_release();
                v20 = 1 << *(_BYTE *)(v6 + 32);
                if (v20 > 63)
                  bzero((void *)(v6 + 56), ((unint64_t)(v20 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v9 = -1 << v20;
                *(_QWORD *)(v6 + 16) = 0;
                break;
              }
              v18 = v9[v19];
              if (!v18)
              {
                while (1)
                {
                  v14 = v19 + 1;
                  if (__OFADD__(v19, 1))
                    goto LABEL_28;
                  if (v14 >= v12)
                    goto LABEL_22;
                  v18 = v9[v14];
                  ++v19;
                  if (v18)
                    goto LABEL_21;
                }
              }
              v14 = v19;
            }
          }
        }
LABEL_21:
        v11 = (v18 - 1) & v18;
        v16 = __clz(__rbit64(v18)) + (v14 << 6);
      }
      sub_23B92F378(*(_QWORD *)(v6 + 48) + *(_QWORD *)(v3 + 72) * v16, (uint64_t)v5, (uint64_t (*)(_QWORD))type metadata accessor for CorrelationIdentifier);
      result = sub_23B92AE18((uint64_t)v5, v7);
    }
  }
  result = swift_release();
  *v1 = v7;
  return result;
}

uint64_t sub_23B92A814()
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
  char v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  char v26;
  unint64_t v27;
  BOOL v28;
  uint64_t v29;
  uint64_t v30;
  int64_t v31;
  _QWORD *v32;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256A55610);
  v3 = sub_23B958670();
  v4 = v3;
  if (*(_QWORD *)(v2 + 16))
  {
    v5 = 1 << *(_BYTE *)(v2 + 32);
    v32 = (_QWORD *)(v2 + 56);
    if (v5 < 64)
      v6 = ~(-1 << v5);
    else
      v6 = -1;
    v7 = v6 & *(_QWORD *)(v2 + 56);
    v31 = (unint64_t)(v5 + 63) >> 6;
    v8 = v3 + 56;
    result = swift_retain();
    v10 = 0;
    while (1)
    {
      if (v7)
      {
        v13 = __clz(__rbit64(v7));
        v7 &= v7 - 1;
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
        if (v15 >= v31)
          goto LABEL_33;
        v16 = v32[v15];
        ++v10;
        if (!v16)
        {
          v10 = v15 + 1;
          if (v15 + 1 >= v31)
            goto LABEL_33;
          v16 = v32[v10];
          if (!v16)
          {
            v10 = v15 + 2;
            if (v15 + 2 >= v31)
              goto LABEL_33;
            v16 = v32[v10];
            if (!v16)
            {
              v17 = v15 + 3;
              if (v17 >= v31)
              {
LABEL_33:
                swift_release();
                v1 = v0;
                v30 = 1 << *(_BYTE *)(v2 + 32);
                if (v30 > 63)
                  bzero(v32, ((unint64_t)(v30 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v32 = -1 << v30;
                *(_QWORD *)(v2 + 16) = 0;
                break;
              }
              v16 = v32[v17];
              if (!v16)
              {
                while (1)
                {
                  v10 = v17 + 1;
                  if (__OFADD__(v17, 1))
                    goto LABEL_39;
                  if (v10 >= v31)
                    goto LABEL_33;
                  v16 = v32[v10];
                  ++v17;
                  if (v16)
                    goto LABEL_23;
                }
              }
              v10 = v17;
            }
          }
        }
LABEL_23:
        v7 = (v16 - 1) & v16;
        v14 = __clz(__rbit64(v16)) + (v10 << 6);
      }
      v18 = v2;
      v19 = *(_QWORD *)(v2 + 48) + 24 * v14;
      v20 = *(_BYTE *)v19;
      v21 = *(_QWORD *)(v19 + 8);
      v22 = *(_QWORD *)(v19 + 16);
      sub_23B958880();
      sub_23B95888C();
      sub_23B9583F4();
      result = sub_23B9588B0();
      v23 = -1 << *(_BYTE *)(v4 + 32);
      v24 = result & ~v23;
      v25 = v24 >> 6;
      if (((-1 << v24) & ~*(_QWORD *)(v8 + 8 * (v24 >> 6))) != 0)
      {
        v11 = __clz(__rbit64((-1 << v24) & ~*(_QWORD *)(v8 + 8 * (v24 >> 6)))) | v24 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v26 = 0;
        v27 = (unint64_t)(63 - v23) >> 6;
        do
        {
          if (++v25 == v27 && (v26 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          v28 = v25 == v27;
          if (v25 == v27)
            v25 = 0;
          v26 |= v28;
          v29 = *(_QWORD *)(v8 + 8 * v25);
        }
        while (v29 == -1);
        v11 = __clz(__rbit64(~v29)) + (v25 << 6);
      }
      *(_QWORD *)(v8 + ((v11 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v11;
      v12 = *(_QWORD *)(v4 + 48) + 24 * v11;
      *(_BYTE *)v12 = v20;
      *(_QWORD *)(v12 + 8) = v21;
      *(_QWORD *)(v12 + 16) = v22;
      ++*(_QWORD *)(v4 + 16);
      v2 = v18;
    }
  }
  result = swift_release();
  *v1 = v4;
  return result;
}

uint64_t sub_23B92AB2C()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  int64_t v8;
  uint64_t v9;
  uint64_t result;
  int64_t v11;
  unint64_t v12;
  _QWORD *v13;
  unint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD *v30;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256A55570);
  v3 = sub_23B958670();
  v4 = v3;
  if (*(_QWORD *)(v2 + 16))
  {
    v5 = 1 << *(_BYTE *)(v2 + 32);
    v30 = (_QWORD *)(v2 + 56);
    if (v5 < 64)
      v6 = ~(-1 << v5);
    else
      v6 = -1;
    v7 = v6 & *(_QWORD *)(v2 + 56);
    v8 = (unint64_t)(v5 + 63) >> 6;
    v9 = v3 + 56;
    result = swift_retain();
    v11 = 0;
    while (1)
    {
      if (v7)
      {
        v14 = __clz(__rbit64(v7));
        v7 &= v7 - 1;
        v15 = v14 | (v11 << 6);
      }
      else
      {
        v16 = v11 + 1;
        if (__OFADD__(v11, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v16 >= v8)
          goto LABEL_33;
        v17 = v30[v16];
        ++v11;
        if (!v17)
        {
          v11 = v16 + 1;
          if (v16 + 1 >= v8)
            goto LABEL_33;
          v17 = v30[v11];
          if (!v17)
          {
            v11 = v16 + 2;
            if (v16 + 2 >= v8)
              goto LABEL_33;
            v17 = v30[v11];
            if (!v17)
            {
              v18 = v16 + 3;
              if (v18 >= v8)
              {
LABEL_33:
                swift_release();
                v1 = v0;
                v29 = 1 << *(_BYTE *)(v2 + 32);
                if (v29 > 63)
                  bzero(v30, ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v30 = -1 << v29;
                *(_QWORD *)(v2 + 16) = 0;
                break;
              }
              v17 = v30[v18];
              if (!v17)
              {
                while (1)
                {
                  v11 = v18 + 1;
                  if (__OFADD__(v18, 1))
                    goto LABEL_39;
                  if (v11 >= v8)
                    goto LABEL_33;
                  v17 = v30[v11];
                  ++v18;
                  if (v17)
                    goto LABEL_23;
                }
              }
              v11 = v18;
            }
          }
        }
LABEL_23:
        v7 = (v17 - 1) & v17;
        v15 = __clz(__rbit64(v17)) + (v11 << 6);
      }
      v19 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v15);
      v20 = *v19;
      v21 = v19[1];
      sub_23B958880();
      swift_bridgeObjectRetain();
      sub_23B9583F4();
      swift_bridgeObjectRelease();
      result = sub_23B9588B0();
      v22 = -1 << *(_BYTE *)(v4 + 32);
      v23 = result & ~v22;
      v24 = v23 >> 6;
      if (((-1 << v23) & ~*(_QWORD *)(v9 + 8 * (v23 >> 6))) != 0)
      {
        v12 = __clz(__rbit64((-1 << v23) & ~*(_QWORD *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v25 = 0;
        v26 = (unint64_t)(63 - v22) >> 6;
        do
        {
          if (++v24 == v26 && (v25 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          v27 = v24 == v26;
          if (v24 == v26)
            v24 = 0;
          v25 |= v27;
          v28 = *(_QWORD *)(v9 + 8 * v24);
        }
        while (v28 == -1);
        v12 = __clz(__rbit64(~v28)) + (v24 << 6);
      }
      *(_QWORD *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
      v13 = (_QWORD *)(*(_QWORD *)(v4 + 48) + 16 * v12);
      *v13 = v20;
      v13[1] = v21;
      ++*(_QWORD *)(v4 + 16);
    }
  }
  result = swift_release();
  *v1 = v4;
  return result;
}

uint64_t sub_23B92AE18(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  unint64_t v12;
  uint64_t result;
  uint64_t v14;

  v4 = sub_23B9582F8();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for CorrelationIdentifier();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23B958880();
  sub_23B92F2F8(a1, (uint64_t)v11, (uint64_t (*)(_QWORD))type metadata accessor for CorrelationIdentifier);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v7, v11, v4);
    sub_23B95888C();
    sub_23B92F2B8((unint64_t *)&qword_254309B00, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
    sub_23B9583AC();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  else
  {
    sub_23B95888C();
    sub_23B9583F4();
    swift_bridgeObjectRelease();
  }
  sub_23B9588B0();
  v12 = sub_23B9585E0();
  *(_QWORD *)(a2 + 56 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
  result = sub_23B92F378(a1, *(_QWORD *)(a2 + 48) + *(_QWORD *)(v9 + 72) * v12, (uint64_t (*)(_QWORD))type metadata accessor for CorrelationIdentifier);
  ++*(_QWORD *)(a2 + 16);
  return result;
}

uint64_t sub_23B92B000(uint64_t result, uint64_t a2, unint64_t a3, char a4)
{
  uint64_t *v4;
  uint64_t *v5;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  BOOL v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;

  v5 = v4;
  v8 = result;
  v9 = *(_QWORD *)(*v4 + 16);
  v10 = *(_QWORD *)(*v4 + 24);
  if (v10 > v9 && (a4 & 1) != 0)
    goto LABEL_22;
  if ((a4 & 1) != 0)
  {
    sub_23B92A068();
  }
  else
  {
    if (v10 > v9)
    {
      result = (uint64_t)sub_23B92BB50();
      goto LABEL_22;
    }
    sub_23B92C41C();
  }
  v11 = *v4;
  sub_23B958880();
  sub_23B9583F4();
  result = sub_23B9588B0();
  v12 = -1 << *(_BYTE *)(v11 + 32);
  a3 = result & ~v12;
  v13 = v11 + 56;
  if (((*(_QWORD *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8)) >> a3) & 1) != 0)
  {
    v14 = *(_QWORD *)(v11 + 48);
    v15 = (_QWORD *)(v14 + 16 * a3);
    v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (result = sub_23B958820(), (result & 1) != 0))
    {
LABEL_21:
      result = sub_23B958838();
      __break(1u);
    }
    else
    {
      v17 = ~v12;
      while (1)
      {
        a3 = (a3 + 1) & v17;
        if (((*(_QWORD *)(v13 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8)) >> a3) & 1) == 0)
          break;
        v18 = (_QWORD *)(v14 + 16 * a3);
        if (*v18 != v8 || v18[1] != a2)
        {
          result = sub_23B958820();
          if ((result & 1) == 0)
            continue;
        }
        goto LABEL_21;
      }
    }
  }
LABEL_22:
  v20 = *v5;
  *(_QWORD *)(*v5 + 8 * (a3 >> 6) + 56) |= 1 << a3;
  v21 = (uint64_t *)(*(_QWORD *)(v20 + 48) + 16 * a3);
  *v21 = v8;
  v21[1] = a2;
  v22 = *(_QWORD *)(v20 + 16);
  v23 = __OFADD__(v22, 1);
  v24 = v22 + 1;
  if (v23)
    __break(1u);
  else
    *(_QWORD *)(v20 + 16) = v24;
  return result;
}

uint64_t sub_23B92B198(uint64_t result, unint64_t a2, char a3)
{
  uint64_t *v3;
  _BYTE *v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;

  v5 = (_BYTE *)result;
  v6 = *(_QWORD *)(*v3 + 16);
  v7 = *(_QWORD *)(*v3 + 24);
  if (v7 > v6 && (a3 & 1) != 0)
    goto LABEL_12;
  if ((a3 & 1) != 0)
  {
    sub_23B92A344();
  }
  else
  {
    if (v7 > v6)
    {
      result = (uint64_t)sub_23B92BD00();
      goto LABEL_12;
    }
    sub_23B92C6C8();
  }
  v8 = *v3;
  v9 = *v5;
  sub_23B958880();
  sub_23B95888C();
  result = sub_23B9588B0();
  v10 = -1 << *(_BYTE *)(v8 + 32);
  a2 = result & ~v10;
  if (((*(_QWORD *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0)
  {
    v11 = ~v10;
    while (*(unsigned __int8 *)(*(_QWORD *)(v8 + 48) + a2) != v9)
    {
      a2 = (a2 + 1) & v11;
      if (((*(_QWORD *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) == 0)
        goto LABEL_12;
    }
    goto LABEL_15;
  }
LABEL_12:
  v12 = *v3;
  *(_QWORD *)(*v3 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(_BYTE *)(*(_QWORD *)(v12 + 48) + a2) = *v5;
  v13 = *(_QWORD *)(v12 + 16);
  v14 = __OFADD__(v13, 1);
  v15 = v13 + 1;
  if (!v14)
  {
    *(_QWORD *)(v12 + 16) = v15;
    return result;
  }
  __break(1u);
LABEL_15:
  result = sub_23B958838();
  __break(1u);
  return result;
}

uint64_t sub_23B92B2E0(uint64_t a1, unint64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t *v4;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
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
  uint64_t v21;
  char *v22;
  uint64_t v23;
  char *v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  char *v36;
  char v37;
  void (*v38)(char *, uint64_t);
  char *v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char v46;
  uint64_t v47;
  uint64_t result;
  uint64_t v49;
  BOOL v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  char *v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;

  v4 = v3;
  v63 = a1;
  v62 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A55620);
  MEMORY[0x24BDAC7A8](v62);
  v8 = (char *)&v52 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_23B9582F8();
  v56 = *(_QWORD *)(v9 - 8);
  v57 = v9;
  v10 = MEMORY[0x24BDAC7A8](v9);
  v54 = (char *)&v52 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v52 - v12;
  v14 = type metadata accessor for CorrelationIdentifier();
  v53 = *(_QWORD *)(v14 - 8);
  v15 = MEMORY[0x24BDAC7A8](v14);
  v17 = (char *)&v52 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = MEMORY[0x24BDAC7A8](v15);
  v55 = (uint64_t *)((char *)&v52 - v19);
  v20 = MEMORY[0x24BDAC7A8](v18);
  v22 = (char *)&v52 - v21;
  MEMORY[0x24BDAC7A8](v20);
  v24 = (char *)&v52 - v23;
  v25 = *(_QWORD *)(*v4 + 16);
  v26 = *(_QWORD *)(*v4 + 24);
  v52 = v4;
  if (v26 <= v25 || (a3 & 1) == 0)
  {
    if ((a3 & 1) != 0)
    {
      sub_23B92A5EC();
    }
    else
    {
      if (v26 > v25)
      {
        sub_23B92BE90();
        goto LABEL_28;
      }
      sub_23B92C940();
    }
    v61 = *v4;
    sub_23B958880();
    sub_23B92F2F8(v63, (uint64_t)v24, (uint64_t (*)(_QWORD))type metadata accessor for CorrelationIdentifier);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v27 = v56;
      v28 = v24;
      v29 = v57;
      (*(void (**)(char *, char *, uint64_t))(v56 + 32))(v13, v28, v57);
      sub_23B95888C();
      sub_23B92F2B8((unint64_t *)&qword_254309B00, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
      sub_23B9583AC();
      (*(void (**)(char *, uint64_t))(v27 + 8))(v13, v29);
    }
    else
    {
      sub_23B95888C();
      sub_23B9583F4();
      swift_bridgeObjectRelease();
    }
    v30 = sub_23B9588B0();
    v31 = -1 << *(_BYTE *)(v61 + 32);
    a2 = v30 & ~v31;
    v60 = v61 + 56;
    if (((*(_QWORD *)(v61 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0)
    {
      v59 = ~v31;
      v58 = *(_QWORD *)(v53 + 72);
      do
      {
        sub_23B92F2F8(*(_QWORD *)(v61 + 48) + v58 * a2, (uint64_t)v22, (uint64_t (*)(_QWORD))type metadata accessor for CorrelationIdentifier);
        v32 = &v8[*(int *)(v62 + 48)];
        sub_23B92F2F8((uint64_t)v22, (uint64_t)v8, (uint64_t (*)(_QWORD))type metadata accessor for CorrelationIdentifier);
        sub_23B92F2F8(v63, (uint64_t)v32, (uint64_t (*)(_QWORD))type metadata accessor for CorrelationIdentifier);
        if (swift_getEnumCaseMultiPayload() == 1)
        {
          sub_23B92F2F8((uint64_t)v8, (uint64_t)v17, (uint64_t (*)(_QWORD))type metadata accessor for CorrelationIdentifier);
          if (swift_getEnumCaseMultiPayload() == 1)
          {
            v33 = v56;
            v34 = v57;
            v35 = v17;
            v36 = v54;
            (*(void (**)(char *, char *, uint64_t))(v56 + 32))(v54, v32, v57);
            v37 = sub_23B9582E0();
            v38 = *(void (**)(char *, uint64_t))(v33 + 8);
            v39 = v36;
            v17 = v35;
            v38(v39, v34);
            v38(v35, v34);
            if ((v37 & 1) != 0)
              goto LABEL_32;
LABEL_26:
            sub_23B92F33C((uint64_t)v8, (uint64_t (*)(_QWORD))type metadata accessor for CorrelationIdentifier);
            goto LABEL_15;
          }
          (*(void (**)(char *, uint64_t))(v56 + 8))(v17, v57);
        }
        else
        {
          v40 = v55;
          sub_23B92F2F8((uint64_t)v8, (uint64_t)v55, (uint64_t (*)(_QWORD))type metadata accessor for CorrelationIdentifier);
          v42 = *v40;
          v41 = v40[1];
          if (swift_getEnumCaseMultiPayload() != 1)
          {
            v43 = *(_QWORD *)v32;
            v44 = *((_QWORD *)v32 + 1);
            if (v42 == v43 && v41 == v44)
              goto LABEL_31;
            v46 = sub_23B958820();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            if ((v46 & 1) != 0)
              goto LABEL_32;
            goto LABEL_26;
          }
          swift_bridgeObjectRelease();
        }
        sub_23B930790((uint64_t)v8, &qword_256A55620);
LABEL_15:
        sub_23B92F33C((uint64_t)v22, (uint64_t (*)(_QWORD))type metadata accessor for CorrelationIdentifier);
        a2 = (a2 + 1) & v59;
      }
      while (((*(_QWORD *)(v60 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0);
    }
  }
LABEL_28:
  v47 = *v52;
  *(_QWORD *)(*v52 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  result = sub_23B92F378(v63, *(_QWORD *)(v47 + 48) + *(_QWORD *)(v53 + 72) * a2, (uint64_t (*)(_QWORD))type metadata accessor for CorrelationIdentifier);
  v49 = *(_QWORD *)(v47 + 16);
  v50 = __OFADD__(v49, 1);
  v51 = v49 + 1;
  if (v50)
  {
    __break(1u);
LABEL_31:
    swift_bridgeObjectRelease_n();
LABEL_32:
    sub_23B92F33C((uint64_t)v8, (uint64_t (*)(_QWORD))type metadata accessor for CorrelationIdentifier);
    sub_23B92F33C((uint64_t)v22, (uint64_t (*)(_QWORD))type metadata accessor for CorrelationIdentifier);
    result = sub_23B958838();
    __break(1u);
  }
  else
  {
    *(_QWORD *)(v47 + 16) = v51;
  }
  return result;
}

uint64_t sub_23B92B804(uint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, char a5)
{
  uint64_t *v5;
  uint64_t *v6;
  int v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unsigned __int8 *v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;

  v6 = v5;
  v10 = result;
  v11 = *(_QWORD *)(*v5 + 16);
  v12 = *(_QWORD *)(*v5 + 24);
  if (v12 > v11 && (a5 & 1) != 0)
    goto LABEL_18;
  if ((a5 & 1) != 0)
  {
    sub_23B92A814();
  }
  else
  {
    if (v12 > v11)
    {
      result = (uint64_t)sub_23B92C0B0();
      goto LABEL_18;
    }
    sub_23B92CB34();
  }
  v13 = *v5;
  sub_23B958880();
  sub_23B95888C();
  sub_23B9583F4();
  result = sub_23B9588B0();
  v14 = -1 << *(_BYTE *)(v13 + 32);
  a4 = result & ~v14;
  v15 = v13 + 56;
  if (((*(_QWORD *)(v13 + 56 + ((a4 >> 3) & 0xFFFFFFFFFFFFF8)) >> a4) & 1) != 0)
  {
    v16 = ~v14;
    v17 = *(_QWORD *)(v13 + 48);
    while (1)
    {
      v18 = (unsigned __int8 *)(v17 + 24 * a4);
      if (*v18 == v10)
      {
        if (*((_QWORD *)v18 + 1) == a2 && *((_QWORD *)v18 + 2) == a3)
          break;
        result = sub_23B958820();
        if ((result & 1) != 0)
          break;
      }
      a4 = (a4 + 1) & v16;
      if (((*(_QWORD *)(v15 + ((a4 >> 3) & 0xFFFFFFFFFFFFF8)) >> a4) & 1) == 0)
        goto LABEL_18;
    }
    result = sub_23B958838();
    __break(1u);
  }
LABEL_18:
  v20 = *v6;
  *(_QWORD *)(*v6 + 8 * (a4 >> 6) + 56) |= 1 << a4;
  v21 = *(_QWORD *)(v20 + 48) + 24 * a4;
  *(_BYTE *)v21 = v10;
  *(_QWORD *)(v21 + 8) = a2;
  *(_QWORD *)(v21 + 16) = a3;
  v22 = *(_QWORD *)(v20 + 16);
  v23 = __OFADD__(v22, 1);
  v24 = v22 + 1;
  if (v23)
    __break(1u);
  else
    *(_QWORD *)(v20 + 16) = v24;
  return result;
}

uint64_t sub_23B92B9A8(uint64_t result, uint64_t a2, unint64_t a3, char a4)
{
  uint64_t *v4;
  uint64_t *v5;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  BOOL v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;

  v5 = v4;
  v8 = result;
  v9 = *(_QWORD *)(*v4 + 16);
  v10 = *(_QWORD *)(*v4 + 24);
  if (v10 > v9 && (a4 & 1) != 0)
    goto LABEL_22;
  if ((a4 & 1) != 0)
  {
    sub_23B92AB2C();
  }
  else
  {
    if (v10 > v9)
    {
      result = (uint64_t)sub_23B92C26C();
      goto LABEL_22;
    }
    sub_23B92CE14();
  }
  v11 = *v4;
  sub_23B958880();
  swift_bridgeObjectRetain();
  sub_23B9583F4();
  swift_bridgeObjectRelease();
  result = sub_23B9588B0();
  v12 = -1 << *(_BYTE *)(v11 + 32);
  a3 = result & ~v12;
  v13 = v11 + 56;
  if (((*(_QWORD *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8)) >> a3) & 1) != 0)
  {
    v14 = *(_QWORD *)(v11 + 48);
    v15 = (_QWORD *)(v14 + 16 * a3);
    v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (result = sub_23B958820(), (result & 1) != 0))
    {
LABEL_21:
      result = sub_23B958838();
      __break(1u);
    }
    else
    {
      v17 = ~v12;
      while (1)
      {
        a3 = (a3 + 1) & v17;
        if (((*(_QWORD *)(v13 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8)) >> a3) & 1) == 0)
          break;
        v18 = (_QWORD *)(v14 + 16 * a3);
        if (*v18 != v8 || v18[1] != a2)
        {
          result = sub_23B958820();
          if ((result & 1) == 0)
            continue;
        }
        goto LABEL_21;
      }
    }
  }
LABEL_22:
  v20 = *v5;
  *(_QWORD *)(*v5 + 8 * (a3 >> 6) + 56) |= 1 << a3;
  v21 = (uint64_t *)(*(_QWORD *)(v20 + 48) + 16 * a3);
  *v21 = v8;
  v21[1] = a2;
  v22 = *(_QWORD *)(v20 + 16);
  v23 = __OFADD__(v22, 1);
  v24 = v22 + 1;
  if (v23)
    __break(1u);
  else
    *(_QWORD *)(v20 + 16) = v24;
  return result;
}

void *sub_23B92BB50()
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
  _QWORD *v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256A556E8);
  v2 = *v0;
  v3 = sub_23B958664();
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
    v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v20 >= v13)
      goto LABEL_28;
    v21 = *(_QWORD *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      v9 = v20 + 1;
      if (v20 + 1 >= v13)
        goto LABEL_28;
      v21 = *(_QWORD *)(v6 + 8 * v9);
      if (!v21)
      {
        v9 = v20 + 2;
        if (v20 + 2 >= v13)
          goto LABEL_28;
        v21 = *(_QWORD *)(v6 + 8 * v9);
        if (!v21)
          break;
      }
    }
LABEL_27:
    v12 = (v21 - 1) & v21;
    v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (_QWORD *)(*(_QWORD *)(v2 + 48) + v16);
    v18 = v17[1];
    v19 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v19 = *v17;
    v19[1] = v18;
    result = (void *)swift_bridgeObjectRetain();
  }
  v22 = v20 + 3;
  if (v22 >= v13)
    goto LABEL_28;
  v21 = *(_QWORD *)(v6 + 8 * v22);
  if (v21)
  {
    v9 = v22;
    goto LABEL_27;
  }
  while (1)
  {
    v9 = v22 + 1;
    if (__OFADD__(v22, 1))
      break;
    if (v9 >= v13)
      goto LABEL_28;
    v21 = *(_QWORD *)(v6 + 8 * v9);
    ++v22;
    if (v21)
      goto LABEL_27;
  }
LABEL_30:
  __break(1u);
  return result;
}

void *sub_23B92BD00()
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
  int64_t v16;
  unint64_t v17;
  int64_t v18;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256A55598);
  v2 = *v0;
  v3 = sub_23B958664();
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
    v16 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v16 >= v13)
      goto LABEL_28;
    v17 = *(_QWORD *)(v6 + 8 * v16);
    ++v9;
    if (!v17)
    {
      v9 = v16 + 1;
      if (v16 + 1 >= v13)
        goto LABEL_28;
      v17 = *(_QWORD *)(v6 + 8 * v9);
      if (!v17)
      {
        v9 = v16 + 2;
        if (v16 + 2 >= v13)
          goto LABEL_28;
        v17 = *(_QWORD *)(v6 + 8 * v9);
        if (!v17)
          break;
      }
    }
LABEL_27:
    v12 = (v17 - 1) & v17;
    v15 = __clz(__rbit64(v17)) + (v9 << 6);
LABEL_12:
    *(_BYTE *)(*(_QWORD *)(v4 + 48) + v15) = *(_BYTE *)(*(_QWORD *)(v2 + 48) + v15);
  }
  v18 = v16 + 3;
  if (v18 >= v13)
    goto LABEL_28;
  v17 = *(_QWORD *)(v6 + 8 * v18);
  if (v17)
  {
    v9 = v18;
    goto LABEL_27;
  }
  while (1)
  {
    v9 = v18 + 1;
    if (__OFADD__(v18, 1))
      break;
    if (v9 >= v13)
      goto LABEL_28;
    v17 = *(_QWORD *)(v6 + 8 * v9);
    ++v18;
    if (v17)
      goto LABEL_27;
  }
LABEL_30:
  __break(1u);
  return result;
}

void *sub_23B92BE90()
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
  unint64_t v20;
  int64_t v21;
  unint64_t v22;
  int64_t v23;
  uint64_t v24;
  uint64_t *v25;

  v1 = v0;
  v2 = type metadata accessor for CorrelationIdentifier();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256A55628);
  v6 = *v0;
  v7 = sub_23B958664();
  v8 = v7;
  if (!*(_QWORD *)(v6 + 16))
  {
    result = (void *)swift_release();
LABEL_30:
    *v1 = v8;
    return result;
  }
  v25 = v1;
  result = (void *)(v7 + 56);
  v10 = v6 + 56;
  v11 = (unint64_t)((1 << *(_BYTE *)(v8 + 32)) + 63) >> 6;
  if (v8 != v6 || (unint64_t)result >= v6 + 56 + 8 * v11)
    result = memmove(result, (const void *)(v6 + 56), 8 * v11);
  v13 = 0;
  *(_QWORD *)(v8 + 16) = *(_QWORD *)(v6 + 16);
  v14 = 1 << *(_BYTE *)(v6 + 32);
  v15 = -1;
  if (v14 < 64)
    v15 = ~(-1 << v14);
  v16 = v15 & *(_QWORD *)(v6 + 56);
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
    v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
      __break(1u);
      goto LABEL_32;
    }
    if (v21 >= v17)
      goto LABEL_28;
    v22 = *(_QWORD *)(v10 + 8 * v21);
    ++v13;
    if (!v22)
    {
      v13 = v21 + 1;
      if (v21 + 1 >= v17)
        goto LABEL_28;
      v22 = *(_QWORD *)(v10 + 8 * v13);
      if (!v22)
      {
        v13 = v21 + 2;
        if (v21 + 2 >= v17)
          goto LABEL_28;
        v22 = *(_QWORD *)(v10 + 8 * v13);
        if (!v22)
          break;
      }
    }
LABEL_27:
    v16 = (v22 - 1) & v22;
    v19 = __clz(__rbit64(v22)) + (v13 << 6);
LABEL_12:
    v20 = *(_QWORD *)(v3 + 72) * v19;
    sub_23B92F2F8(*(_QWORD *)(v6 + 48) + v20, (uint64_t)v5, (uint64_t (*)(_QWORD))type metadata accessor for CorrelationIdentifier);
    result = (void *)sub_23B92F378((uint64_t)v5, *(_QWORD *)(v8 + 48) + v20, (uint64_t (*)(_QWORD))type metadata accessor for CorrelationIdentifier);
  }
  v23 = v21 + 3;
  if (v23 >= v17)
  {
LABEL_28:
    result = (void *)swift_release();
    v1 = v25;
    goto LABEL_30;
  }
  v22 = *(_QWORD *)(v10 + 8 * v23);
  if (v22)
  {
    v13 = v23;
    goto LABEL_27;
  }
  while (1)
  {
    v13 = v23 + 1;
    if (__OFADD__(v23, 1))
      break;
    if (v13 >= v17)
      goto LABEL_28;
    v22 = *(_QWORD *)(v10 + 8 * v13);
    ++v23;
    if (v22)
      goto LABEL_27;
  }
LABEL_32:
  __break(1u);
  return result;
}

void *sub_23B92C0B0()
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
  int64_t v21;
  unint64_t v22;
  int64_t v23;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256A55610);
  v2 = *v0;
  v3 = sub_23B958664();
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
    v21 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v21 >= v13)
      goto LABEL_28;
    v22 = *(_QWORD *)(v6 + 8 * v21);
    ++v9;
    if (!v22)
    {
      v9 = v21 + 1;
      if (v21 + 1 >= v13)
        goto LABEL_28;
      v22 = *(_QWORD *)(v6 + 8 * v9);
      if (!v22)
      {
        v9 = v21 + 2;
        if (v21 + 2 >= v13)
          goto LABEL_28;
        v22 = *(_QWORD *)(v6 + 8 * v9);
        if (!v22)
          break;
      }
    }
LABEL_27:
    v12 = (v22 - 1) & v22;
    v15 = __clz(__rbit64(v22)) + (v9 << 6);
LABEL_12:
    v16 = 24 * v15;
    v17 = *(_QWORD *)(v2 + 48) + v16;
    v19 = *(_QWORD *)(v17 + 8);
    v18 = *(_QWORD *)(v17 + 16);
    v20 = *(_QWORD *)(v4 + 48) + v16;
    *(_BYTE *)v20 = *(_BYTE *)v17;
    *(_QWORD *)(v20 + 8) = v19;
    *(_QWORD *)(v20 + 16) = v18;
    result = (void *)swift_bridgeObjectRetain();
  }
  v23 = v21 + 3;
  if (v23 >= v13)
    goto LABEL_28;
  v22 = *(_QWORD *)(v6 + 8 * v23);
  if (v22)
  {
    v9 = v23;
    goto LABEL_27;
  }
  while (1)
  {
    v9 = v23 + 1;
    if (__OFADD__(v23, 1))
      break;
    if (v9 >= v13)
      goto LABEL_28;
    v22 = *(_QWORD *)(v6 + 8 * v9);
    ++v23;
    if (v22)
      goto LABEL_27;
  }
LABEL_30:
  __break(1u);
  return result;
}

void *sub_23B92C26C()
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
  _QWORD *v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256A55570);
  v2 = *v0;
  v3 = sub_23B958664();
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
    v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v20 >= v13)
      goto LABEL_28;
    v21 = *(_QWORD *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      v9 = v20 + 1;
      if (v20 + 1 >= v13)
        goto LABEL_28;
      v21 = *(_QWORD *)(v6 + 8 * v9);
      if (!v21)
      {
        v9 = v20 + 2;
        if (v20 + 2 >= v13)
          goto LABEL_28;
        v21 = *(_QWORD *)(v6 + 8 * v9);
        if (!v21)
          break;
      }
    }
LABEL_27:
    v12 = (v21 - 1) & v21;
    v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (_QWORD *)(*(_QWORD *)(v2 + 48) + v16);
    v18 = v17[1];
    v19 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v19 = *v17;
    v19[1] = v18;
    result = (void *)swift_bridgeObjectRetain();
  }
  v22 = v20 + 3;
  if (v22 >= v13)
    goto LABEL_28;
  v21 = *(_QWORD *)(v6 + 8 * v22);
  if (v21)
  {
    v9 = v22;
    goto LABEL_27;
  }
  while (1)
  {
    v9 = v22 + 1;
    if (__OFADD__(v22, 1))
      break;
    if (v9 >= v13)
      goto LABEL_28;
    v21 = *(_QWORD *)(v6 + 8 * v9);
    ++v22;
    if (v21)
      goto LABEL_27;
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_23B92C41C()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t result;
  int64_t v11;
  unint64_t v12;
  _QWORD *v13;
  unint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  int64_t v29;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256A556E8);
  v3 = sub_23B958670();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
    result = swift_release();
LABEL_35:
    *v1 = v4;
    return result;
  }
  v5 = 1 << *(_BYTE *)(v2 + 32);
  v6 = v2 + 56;
  if (v5 < 64)
    v7 = ~(-1 << v5);
  else
    v7 = -1;
  v8 = v7 & *(_QWORD *)(v2 + 56);
  v29 = (unint64_t)(v5 + 63) >> 6;
  v9 = v3 + 56;
  result = swift_retain();
  v11 = 0;
  while (1)
  {
    if (v8)
    {
      v14 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      v15 = v14 | (v11 << 6);
      goto LABEL_24;
    }
    v16 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v16 >= v29)
      goto LABEL_33;
    v17 = *(_QWORD *)(v6 + 8 * v16);
    ++v11;
    if (!v17)
    {
      v11 = v16 + 1;
      if (v16 + 1 >= v29)
        goto LABEL_33;
      v17 = *(_QWORD *)(v6 + 8 * v11);
      if (!v17)
      {
        v11 = v16 + 2;
        if (v16 + 2 >= v29)
          goto LABEL_33;
        v17 = *(_QWORD *)(v6 + 8 * v11);
        if (!v17)
          break;
      }
    }
LABEL_23:
    v8 = (v17 - 1) & v17;
    v15 = __clz(__rbit64(v17)) + (v11 << 6);
LABEL_24:
    v19 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v20 = *v19;
    v21 = v19[1];
    sub_23B958880();
    swift_bridgeObjectRetain();
    sub_23B9583F4();
    result = sub_23B9588B0();
    v22 = -1 << *(_BYTE *)(v4 + 32);
    v23 = result & ~v22;
    v24 = v23 >> 6;
    if (((-1 << v23) & ~*(_QWORD *)(v9 + 8 * (v23 >> 6))) != 0)
    {
      v12 = __clz(__rbit64((-1 << v23) & ~*(_QWORD *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v25 = 0;
      v26 = (unint64_t)(63 - v22) >> 6;
      do
      {
        if (++v24 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        v27 = v24 == v26;
        if (v24 == v26)
          v24 = 0;
        v25 |= v27;
        v28 = *(_QWORD *)(v9 + 8 * v24);
      }
      while (v28 == -1);
      v12 = __clz(__rbit64(~v28)) + (v24 << 6);
    }
    *(_QWORD *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
    v13 = (_QWORD *)(*(_QWORD *)(v4 + 48) + 16 * v12);
    *v13 = v20;
    v13[1] = v21;
    ++*(_QWORD *)(v4 + 16);
  }
  v18 = v16 + 3;
  if (v18 >= v29)
  {
LABEL_33:
    result = swift_release_n();
    v1 = v0;
    goto LABEL_35;
  }
  v17 = *(_QWORD *)(v6 + 8 * v18);
  if (v17)
  {
    v11 = v18;
    goto LABEL_23;
  }
  while (1)
  {
    v11 = v18 + 1;
    if (__OFADD__(v18, 1))
      break;
    if (v11 >= v29)
      goto LABEL_33;
    v17 = *(_QWORD *)(v6 + 8 * v11);
    ++v18;
    if (v17)
      goto LABEL_23;
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_23B92C6C8()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  int64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  int64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  int64_t v15;
  unint64_t v16;
  int64_t v17;
  char v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  char v22;
  unint64_t v23;
  BOOL v24;
  uint64_t v25;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256A55598);
  result = sub_23B958670();
  v4 = result;
  if (!*(_QWORD *)(v2 + 16))
  {
    result = swift_release();
LABEL_35:
    *v1 = v4;
    return result;
  }
  v5 = 0;
  v6 = v2 + 56;
  v7 = 1 << *(_BYTE *)(v2 + 32);
  if (v7 < 64)
    v8 = ~(-1 << v7);
  else
    v8 = -1;
  v9 = v8 & *(_QWORD *)(v2 + 56);
  v10 = (unint64_t)(v7 + 63) >> 6;
  v11 = result + 56;
  while (1)
  {
    if (v9)
    {
      v13 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      v14 = v13 | (v5 << 6);
      goto LABEL_24;
    }
    v15 = v5 + 1;
    if (__OFADD__(v5, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v15 >= v10)
      goto LABEL_33;
    v16 = *(_QWORD *)(v6 + 8 * v15);
    ++v5;
    if (!v16)
    {
      v5 = v15 + 1;
      if (v15 + 1 >= v10)
        goto LABEL_33;
      v16 = *(_QWORD *)(v6 + 8 * v5);
      if (!v16)
      {
        v5 = v15 + 2;
        if (v15 + 2 >= v10)
          goto LABEL_33;
        v16 = *(_QWORD *)(v6 + 8 * v5);
        if (!v16)
          break;
      }
    }
LABEL_23:
    v9 = (v16 - 1) & v16;
    v14 = __clz(__rbit64(v16)) + (v5 << 6);
LABEL_24:
    v18 = *(_BYTE *)(*(_QWORD *)(v2 + 48) + v14);
    sub_23B958880();
    sub_23B95888C();
    result = sub_23B9588B0();
    v19 = -1 << *(_BYTE *)(v4 + 32);
    v20 = result & ~v19;
    v21 = v20 >> 6;
    if (((-1 << v20) & ~*(_QWORD *)(v11 + 8 * (v20 >> 6))) != 0)
    {
      v12 = __clz(__rbit64((-1 << v20) & ~*(_QWORD *)(v11 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
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
          goto LABEL_36;
        }
        v24 = v21 == v23;
        if (v21 == v23)
          v21 = 0;
        v22 |= v24;
        v25 = *(_QWORD *)(v11 + 8 * v21);
      }
      while (v25 == -1);
      v12 = __clz(__rbit64(~v25)) + (v21 << 6);
    }
    *(_QWORD *)(v11 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
    *(_BYTE *)(*(_QWORD *)(v4 + 48) + v12) = v18;
    ++*(_QWORD *)(v4 + 16);
  }
  v17 = v15 + 3;
  if (v17 >= v10)
  {
LABEL_33:
    result = swift_release();
    v1 = v0;
    goto LABEL_35;
  }
  v16 = *(_QWORD *)(v6 + 8 * v17);
  if (v16)
  {
    v5 = v17;
    goto LABEL_23;
  }
  while (1)
  {
    v5 = v17 + 1;
    if (__OFADD__(v17, 1))
      break;
    if (v5 >= v10)
      goto LABEL_33;
    v16 = *(_QWORD *)(v6 + 8 * v5);
    ++v17;
    if (v16)
      goto LABEL_23;
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_23B92C940()
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
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  int64_t v12;
  uint64_t result;
  int64_t v14;
  unint64_t v15;
  unint64_t v16;
  int64_t v17;
  unint64_t v18;
  int64_t v19;
  uint64_t v20;

  v1 = v0;
  v2 = type metadata accessor for CorrelationIdentifier();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256A55628);
  v7 = sub_23B958670();
  if (!*(_QWORD *)(v6 + 16))
  {
    result = swift_release();
LABEL_24:
    *v1 = v7;
    return result;
  }
  v8 = 1 << *(_BYTE *)(v6 + 32);
  v9 = v6 + 56;
  v10 = -1;
  if (v8 < 64)
    v10 = ~(-1 << v8);
  v11 = v10 & *(_QWORD *)(v6 + 56);
  v12 = (unint64_t)(v8 + 63) >> 6;
  result = swift_retain();
  v14 = 0;
  while (1)
  {
    if (v11)
    {
      v15 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      v16 = v15 | (v14 << 6);
      goto LABEL_6;
    }
    v17 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
      __break(1u);
      goto LABEL_26;
    }
    if (v17 >= v12)
      goto LABEL_22;
    v18 = *(_QWORD *)(v9 + 8 * v17);
    ++v14;
    if (!v18)
    {
      v14 = v17 + 1;
      if (v17 + 1 >= v12)
        goto LABEL_22;
      v18 = *(_QWORD *)(v9 + 8 * v14);
      if (!v18)
      {
        v14 = v17 + 2;
        if (v17 + 2 >= v12)
          goto LABEL_22;
        v18 = *(_QWORD *)(v9 + 8 * v14);
        if (!v18)
          break;
      }
    }
LABEL_21:
    v11 = (v18 - 1) & v18;
    v16 = __clz(__rbit64(v18)) + (v14 << 6);
LABEL_6:
    sub_23B92F2F8(*(_QWORD *)(v6 + 48) + *(_QWORD *)(v3 + 72) * v16, (uint64_t)v5, (uint64_t (*)(_QWORD))type metadata accessor for CorrelationIdentifier);
    result = sub_23B92AE18((uint64_t)v5, v7);
  }
  v19 = v17 + 3;
  if (v19 >= v12)
  {
LABEL_22:
    result = swift_release_n();
    goto LABEL_24;
  }
  v18 = *(_QWORD *)(v9 + 8 * v19);
  if (v18)
  {
    v14 = v19;
    goto LABEL_21;
  }
  while (1)
  {
    v14 = v19 + 1;
    if (__OFADD__(v19, 1))
      break;
    if (v14 >= v12)
      goto LABEL_22;
    v18 = *(_QWORD *)(v9 + 8 * v14);
    ++v19;
    if (v18)
      goto LABEL_21;
  }
LABEL_26:
  __break(1u);
  return result;
}

uint64_t sub_23B92CB34()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t result;
  int64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  int64_t v14;
  unint64_t v15;
  int64_t v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  char v24;
  unint64_t v25;
  BOOL v26;
  uint64_t v27;
  uint64_t v28;
  int64_t v29;

  v1 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256A55610);
  v2 = sub_23B958670();
  v3 = v2;
  if (!*(_QWORD *)(v1 + 16))
  {
    result = swift_release();
LABEL_35:
    *v0 = v3;
    return result;
  }
  v4 = 1 << *(_BYTE *)(v1 + 32);
  v28 = v1 + 56;
  if (v4 < 64)
    v5 = ~(-1 << v4);
  else
    v5 = -1;
  v6 = v5 & *(_QWORD *)(v1 + 56);
  v29 = (unint64_t)(v4 + 63) >> 6;
  v7 = v2 + 56;
  result = swift_retain();
  v9 = 0;
  while (1)
  {
    if (v6)
    {
      v12 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      v13 = v12 | (v9 << 6);
      goto LABEL_24;
    }
    v14 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v14 >= v29)
      goto LABEL_33;
    v15 = *(_QWORD *)(v28 + 8 * v14);
    ++v9;
    if (!v15)
    {
      v9 = v14 + 1;
      if (v14 + 1 >= v29)
        goto LABEL_33;
      v15 = *(_QWORD *)(v28 + 8 * v9);
      if (!v15)
      {
        v9 = v14 + 2;
        if (v14 + 2 >= v29)
          goto LABEL_33;
        v15 = *(_QWORD *)(v28 + 8 * v9);
        if (!v15)
          break;
      }
    }
LABEL_23:
    v6 = (v15 - 1) & v15;
    v13 = __clz(__rbit64(v15)) + (v9 << 6);
LABEL_24:
    v17 = *(_QWORD *)(v1 + 48) + 24 * v13;
    v18 = *(_BYTE *)v17;
    v19 = *(_QWORD *)(v17 + 8);
    v20 = *(_QWORD *)(v17 + 16);
    sub_23B958880();
    sub_23B95888C();
    swift_bridgeObjectRetain();
    sub_23B9583F4();
    result = sub_23B9588B0();
    v21 = -1 << *(_BYTE *)(v3 + 32);
    v22 = result & ~v21;
    v23 = v22 >> 6;
    if (((-1 << v22) & ~*(_QWORD *)(v7 + 8 * (v22 >> 6))) != 0)
    {
      v10 = __clz(__rbit64((-1 << v22) & ~*(_QWORD *)(v7 + 8 * (v22 >> 6)))) | v22 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v24 = 0;
      v25 = (unint64_t)(63 - v21) >> 6;
      do
      {
        if (++v23 == v25 && (v24 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        v26 = v23 == v25;
        if (v23 == v25)
          v23 = 0;
        v24 |= v26;
        v27 = *(_QWORD *)(v7 + 8 * v23);
      }
      while (v27 == -1);
      v10 = __clz(__rbit64(~v27)) + (v23 << 6);
    }
    *(_QWORD *)(v7 + ((v10 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v10;
    v11 = *(_QWORD *)(v3 + 48) + 24 * v10;
    *(_BYTE *)v11 = v18;
    *(_QWORD *)(v11 + 8) = v19;
    *(_QWORD *)(v11 + 16) = v20;
    ++*(_QWORD *)(v3 + 16);
  }
  v16 = v14 + 3;
  if (v16 >= v29)
  {
LABEL_33:
    result = swift_release_n();
    goto LABEL_35;
  }
  v15 = *(_QWORD *)(v28 + 8 * v16);
  if (v15)
  {
    v9 = v16;
    goto LABEL_23;
  }
  while (1)
  {
    v9 = v16 + 1;
    if (__OFADD__(v16, 1))
      break;
    if (v9 >= v29)
      goto LABEL_33;
    v15 = *(_QWORD *)(v28 + 8 * v9);
    ++v16;
    if (v15)
      goto LABEL_23;
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_23B92CE14()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t result;
  int64_t v11;
  unint64_t v12;
  _QWORD *v13;
  unint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  int64_t v29;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256A55570);
  v3 = sub_23B958670();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
    result = swift_release();
LABEL_35:
    *v1 = v4;
    return result;
  }
  v5 = 1 << *(_BYTE *)(v2 + 32);
  v6 = v2 + 56;
  if (v5 < 64)
    v7 = ~(-1 << v5);
  else
    v7 = -1;
  v8 = v7 & *(_QWORD *)(v2 + 56);
  v29 = (unint64_t)(v5 + 63) >> 6;
  v9 = v3 + 56;
  result = swift_retain();
  v11 = 0;
  while (1)
  {
    if (v8)
    {
      v14 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      v15 = v14 | (v11 << 6);
      goto LABEL_24;
    }
    v16 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v16 >= v29)
      goto LABEL_33;
    v17 = *(_QWORD *)(v6 + 8 * v16);
    ++v11;
    if (!v17)
    {
      v11 = v16 + 1;
      if (v16 + 1 >= v29)
        goto LABEL_33;
      v17 = *(_QWORD *)(v6 + 8 * v11);
      if (!v17)
      {
        v11 = v16 + 2;
        if (v16 + 2 >= v29)
          goto LABEL_33;
        v17 = *(_QWORD *)(v6 + 8 * v11);
        if (!v17)
          break;
      }
    }
LABEL_23:
    v8 = (v17 - 1) & v17;
    v15 = __clz(__rbit64(v17)) + (v11 << 6);
LABEL_24:
    v19 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v20 = *v19;
    v21 = v19[1];
    sub_23B958880();
    swift_bridgeObjectRetain_n();
    sub_23B9583F4();
    swift_bridgeObjectRelease();
    result = sub_23B9588B0();
    v22 = -1 << *(_BYTE *)(v4 + 32);
    v23 = result & ~v22;
    v24 = v23 >> 6;
    if (((-1 << v23) & ~*(_QWORD *)(v9 + 8 * (v23 >> 6))) != 0)
    {
      v12 = __clz(__rbit64((-1 << v23) & ~*(_QWORD *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v25 = 0;
      v26 = (unint64_t)(63 - v22) >> 6;
      do
      {
        if (++v24 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        v27 = v24 == v26;
        if (v24 == v26)
          v24 = 0;
        v25 |= v27;
        v28 = *(_QWORD *)(v9 + 8 * v24);
      }
      while (v28 == -1);
      v12 = __clz(__rbit64(~v28)) + (v24 << 6);
    }
    *(_QWORD *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
    v13 = (_QWORD *)(*(_QWORD *)(v4 + 48) + 16 * v12);
    *v13 = v20;
    v13[1] = v21;
    ++*(_QWORD *)(v4 + 16);
  }
  v18 = v16 + 3;
  if (v18 >= v29)
  {
LABEL_33:
    result = swift_release_n();
    v1 = v0;
    goto LABEL_35;
  }
  v17 = *(_QWORD *)(v6 + 8 * v18);
  if (v17)
  {
    v11 = v18;
    goto LABEL_23;
  }
  while (1)
  {
    v11 = v18 + 1;
    if (__OFADD__(v18, 1))
      break;
    if (v11 >= v29)
      goto LABEL_33;
    v17 = *(_QWORD *)(v6 + 8 * v11);
    ++v18;
    if (v17)
      goto LABEL_23;
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t type metadata accessor for InternetMessaging(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for InternetMessaging);
}

uint64_t sub_23B92D0DC(uint64_t a1, unint64_t *a2)
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

double sub_23B92D114(_OWORD *a1)
{
  double result;

  result = 0.0;
  a1[8] = 0u;
  a1[9] = 0u;
  a1[6] = 0u;
  a1[7] = 0u;
  a1[4] = 0u;
  a1[5] = 0u;
  a1[2] = 0u;
  a1[3] = 0u;
  *a1 = 0u;
  a1[1] = 0u;
  return result;
}

uint64_t sub_23B92D130(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254309CB0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_23B92D178(uint64_t a1)
{
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_23B92D220(uint64_t a1)
{
  unint64_t v1;

  v1 = *(_QWORD *)(a1 + 24);
  if (v1 >= 0xFFFFFFFF)
    LODWORD(v1) = -1;
  return (v1 + 1);
}

uint64_t sub_23B92D238(uint64_t result)
{
  if (result)
    return swift_release();
  return result;
}

uint64_t sub_23B92D248(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
    v5 = a4 + 160 * a1 + 32;
    v6 = a3 + 160 * v4;
    if (v5 >= v6 || v5 + 160 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  result = sub_23B958760();
  __break(1u);
  return result;
}

uint64_t sub_23B92D33C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
    v5 = a4 + 48 * a1 + 32;
    v6 = a3 + 48 * v4;
    if (v5 >= v6 || v5 + 48 * v4 <= a3)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_256A55580);
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  result = sub_23B958760();
  __break(1u);
  return result;
}

uint64_t sub_23B92D448(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = *(_QWORD *)(a1 + 16);
  result = sub_23B958520();
  v8 = result;
  if (v2)
  {
    v4 = (uint64_t *)(a1 + 40);
    do
    {
      v5 = *(v4 - 1);
      v6 = *v4;
      swift_bridgeObjectRetain();
      sub_23B92946C(&v7, v5, v6);
      swift_bridgeObjectRelease();
      v4 += 2;
      --v2;
    }
    while (v2);
    return v8;
  }
  return result;
}

uint64_t sub_23B92D4DC(uint64_t a1, unint64_t a2)
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

uint64_t sub_23B92D520(uint64_t a1)
{
  uint64_t v1;

  return sub_23B91E270(a1, *(_QWORD **)(v1 + 16), *(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32), *(_QWORD *)(v1 + 40), *(_QWORD *)(v1 + 48), *(_QWORD *)(v1 + 56));
}

uint64_t sub_23B92D530(uint64_t a1)
{
  uint64_t v1;

  return sub_23B91F7F4(a1, *(_QWORD **)(v1 + 16), *(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32), *(_QWORD *)(v1 + 40), *(_QWORD *)(v1 + 48));
}

uint64_t sub_23B92D540(uint64_t a1)
{
  uint64_t v1;

  return sub_23B921120(a1, *(_QWORD **)(v1 + 16), *(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32));
}

uint64_t sub_23B92D54C(uint64_t a1)
{
  uint64_t v1;

  return sub_23B9223E4(a1, *(uint64_t **)(v1 + 16), *(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32), *(_QWORD *)(v1 + 40));
}

uint64_t sub_23B92D55C()
{
  return swift_initClassMetadata2();
}

uint64_t method lookup function for InternetMessaging()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of InternetMessaging.set(didDeliverCallback:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 416))();
}

uint64_t dispatch thunk of InternetMessaging.set(messageReceivedCallback:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 424))();
}

uint64_t dispatch thunk of InternetMessaging.set(dictionaryReceivedCallback:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 432))();
}

uint64_t dispatch thunk of InternetMessaging.set(accountChangedCallback:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 440))();
}

uint64_t dispatch thunk of InternetMessaging.set(devicesChangedCallback:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 448))();
}

uint64_t dispatch thunk of InternetMessaging.__allocating_init(serviceName:crossAccount:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD *v8;
  uint64_t (*v10)(uint64_t, uint64_t, uint64_t);

  v10 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(**(int **)(v3 + 464) + *(_QWORD *)(v3 + 464));
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v8;
  *v8 = v4;
  v8[1] = sub_23B930840;
  return v10(a1, a2, a3);
}

uint64_t dispatch thunk of InternetMessaging.start()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 472))();
}

uint64_t dispatch thunk of InternetMessaging.stop()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 480))();
}

uint64_t dispatch thunk of InternetMessaging.myAccountScopedDestination.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 488))();
}

uint64_t dispatch thunk of InternetMessaging.device(fromID:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 496))();
}

uint64_t dispatch thunk of InternetMessaging.connectedDevice.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 504))();
}

uint64_t dispatch thunk of InternetMessaging.devices.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 512))();
}

uint64_t sub_23B92D6F4(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  unsigned __int8 *v4;
  unsigned __int8 v5;
  unsigned __int8 v6;
  char v7;
  uint64_t v8;

  v2 = *(_QWORD *)(a1 + 16);
  sub_23B92DA14();
  result = sub_23B958520();
  v8 = result;
  if (v2)
  {
    v4 = (unsigned __int8 *)(a1 + 32);
    do
    {
      v5 = *v4++;
      v6 = v5;
      sub_23B929618(&v7, &v6);
      --v2;
    }
    while (v2);
    return v8;
  }
  return result;
}

uint64_t sub_23B92D76C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t);
  uint64_t result;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v2 = type metadata accessor for CorrelationIdentifier();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v14 - v7;
  v9 = *(_QWORD *)(a1 + 16);
  sub_23B92F2B8(&qword_256A55618, v10, (uint64_t)&protocol conformance descriptor for CorrelationIdentifier);
  result = sub_23B958520();
  v15 = result;
  if (v9)
  {
    v12 = a1 + ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
    v13 = *(_QWORD *)(v3 + 72);
    do
    {
      sub_23B92F2F8(v12, (uint64_t)v6, (uint64_t (*)(_QWORD))type metadata accessor for CorrelationIdentifier);
      sub_23B92972C((uint64_t)v8, (uint64_t)v6);
      sub_23B92F33C((uint64_t)v8, (uint64_t (*)(_QWORD))type metadata accessor for CorrelationIdentifier);
      v12 += v13;
      --v9;
    }
    while (v9);
    return v15;
  }
  return result;
}

uint64_t sub_23B92D88C(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = *(_QWORD *)(a1 + 16);
  sub_23B92F068();
  result = sub_23B958520();
  v9 = result;
  if (v2)
  {
    v4 = (uint64_t *)(a1 + 48);
    do
    {
      v5 = *(v4 - 1);
      v6 = *v4;
      v7 = *((unsigned __int8 *)v4 - 16);
      swift_bridgeObjectRetain();
      sub_23B929CE8((uint64_t)&v8, v7, v5, v6);
      swift_bridgeObjectRelease();
      v4 += 3;
      --v2;
    }
    while (v2);
    return v9;
  }
  return result;
}

uint64_t sub_23B92D928(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = *(_QWORD *)(a1 + 16);
  sub_23B92D9BC();
  result = sub_23B958520();
  v8 = result;
  if (v2)
  {
    v4 = (uint64_t *)(a1 + 40);
    do
    {
      v5 = *(v4 - 1);
      v6 = *v4;
      swift_bridgeObjectRetain();
      sub_23B929EAC(&v7, v5, v6);
      swift_bridgeObjectRelease();
      v4 += 2;
      --v2;
    }
    while (v2);
    return v8;
  }
  return result;
}

unint64_t sub_23B92D9BC()
{
  unint64_t result;

  result = qword_254309CB8;
  if (!qword_254309CB8)
  {
    result = MEMORY[0x2426097B0](&protocol conformance descriptor for Account, &type metadata for Account);
    atomic_store(result, (unint64_t *)&qword_254309CB8);
  }
  return result;
}

_OWORD *sub_23B92DA04(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

unint64_t sub_23B92DA14()
{
  unint64_t result;

  result = qword_256A55590;
  if (!qword_256A55590)
  {
    result = MEMORY[0x2426097B0](&protocol conformance descriptor for MessagingCapability, &type metadata for MessagingCapability);
    atomic_store(result, (unint64_t *)&qword_256A55590);
  }
  return result;
}

void sub_23B92DA58(uint64_t a1, uint64_t a2, char a3, void *a4)
{
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char v12;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t v24;
  void *v25;
  uint64_t v26;
  _QWORD *v27;
  id v28;
  uint64_t v30[3];
  uint64_t v31;

  v8 = sub_23B9582F8();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8]();
  v11 = (char *)&v30[-1] - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  if (*(_QWORD *)(*(_QWORD *)(v4 + 152) + 16))
  {
    swift_bridgeObjectRetain();
    sub_23B9335F0(a2);
    if ((v12 & 1) != 0)
    {
      swift_retain();
      swift_bridgeObjectRelease();
      if ((a3 & 1) != 0)
      {
        sub_23B958184();
      }
      else
      {
        if (a4)
        {
          v25 = a4;
        }
        else
        {
          v26 = sub_23B95816C();
          sub_23B92F2B8(&qword_256A554C8, (uint64_t (*)(uint64_t))MEMORY[0x24BE31808], MEMORY[0x24BE31810]);
          v25 = (void *)swift_allocError();
          *v27 = 0xD00000000000001CLL;
          v27[1] = 0x800000023B95A5F0;
          (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v26 - 8) + 104))(v27, *MEMORY[0x24BE31800], v26);
        }
        v30[0] = (uint64_t)v25;
        v28 = a4;
        sub_23B958178();

      }
      swift_beginAccess();
      sub_23B945D2C(a2);
      swift_endAccess();
      swift_release();
      swift_release();
      return;
    }
    swift_bridgeObjectRelease();
  }
  if (qword_254309BF0 != -1)
    swift_once();
  v13 = sub_23B95831C();
  __swift_project_value_buffer(v13, (uint64_t)qword_254309BD8);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a2, v8);
  v14 = sub_23B958304();
  v15 = sub_23B958550();
  if (os_log_type_enabled(v14, v15))
  {
    v16 = swift_slowAlloc();
    v17 = swift_slowAlloc();
    v30[0] = v17;
    *(_DWORD *)v16 = 136446466;
    v21 = sub_23B91B910(v17, v18, v19, v20);
    v31 = sub_23B9287E0(v21, v22, v30);
    sub_23B9585A4();
    swift_bridgeObjectRelease();
    *(_WORD *)(v16 + 12) = 2082;
    sub_23B92F2B8(&qword_256A55510, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAB8]);
    v23 = sub_23B9587F0();
    v31 = sub_23B9287E0(v23, v24, v30);
    sub_23B9585A4();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    _os_log_impl(&dword_23B916000, v14, v15, "%{public}s: Got didSend callback for unsent message! %{public}s", (uint8_t *)v16, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x242609864](v17, -1, -1);
    MEMORY[0x242609864](v16, -1, -1);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  }

}

uint64_t sub_23B92DE00(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  *(_QWORD *)(v4 + 56) = a2;
  *(_QWORD *)(v4 + 64) = v3;
  v5 = a1[1];
  *(_QWORD *)(v4 + 72) = *a1;
  *(_QWORD *)(v4 + 80) = v5;
  *(_BYTE *)(v4 + 128) = *(_BYTE *)a3;
  v6 = *(_QWORD *)(a3 + 16);
  *(_QWORD *)(v4 + 88) = *(_QWORD *)(a3 + 8);
  *(_QWORD *)(v4 + 96) = v6;
  return swift_task_switch();
}

uint64_t sub_23B92DE30()
{
  uint64_t v0;
  uint64_t v1;
  int *v2;
  __int128 v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  int *v9;

  v1 = *(_QWORD *)(v0 + 64);
  v2 = *(int **)(v1 + 168);
  *(_QWORD *)(v0 + 104) = v2;
  if (!v2)
    return (*(uint64_t (**)(void))(v0 + 8))();
  v3 = *(_OWORD *)(v0 + 88);
  v4 = *(_BYTE *)(v0 + 128);
  v6 = *(_QWORD *)(v0 + 72);
  v5 = *(_QWORD *)(v0 + 80);
  *(_QWORD *)(v0 + 112) = *(_QWORD *)(v1 + 176);
  *(_QWORD *)(v0 + 40) = v6;
  *(_QWORD *)(v0 + 48) = v5;
  *(_BYTE *)(v0 + 16) = v4;
  *(_OWORD *)(v0 + 24) = v3;
  v9 = (int *)((char *)v2 + *v2);
  swift_retain();
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 120) = v7;
  *v7 = v0;
  v7[1] = sub_23B92DEFC;
  return ((uint64_t (*)(uint64_t, _QWORD, uint64_t))v9)(v0 + 40, *(_QWORD *)(v0 + 56), v0 + 16);
}

uint64_t sub_23B92DEFC()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23B92DF54()
{
  uint64_t v0;

  sub_23B92D238(*(_QWORD *)(v0 + 104));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23B92DF84(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;
  uint64_t v7;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  *(_QWORD *)(v7 + 96) = a6;
  *(_QWORD *)(v7 + 104) = v6;
  *(_QWORD *)(v7 + 80) = a2;
  *(_QWORD *)(v7 + 88) = a4;
  *(_QWORD *)(v7 + 72) = a1;
  *(_QWORD *)(v7 + 112) = *v6;
  v10 = *(_QWORD *)(type metadata accessor for MessageContext() - 8);
  *(_QWORD *)(v7 + 120) = v10;
  *(_QWORD *)(v7 + 128) = *(_QWORD *)(v10 + 64);
  *(_QWORD *)(v7 + 136) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254309C80);
  v11 = swift_task_alloc();
  v12 = *a3;
  v13 = a3[1];
  *(_QWORD *)(v7 + 144) = v11;
  *(_QWORD *)(v7 + 152) = v12;
  *(_BYTE *)(v7 + 184) = *(_BYTE *)a5;
  v14 = *(_QWORD *)(a5 + 8);
  v15 = *(_QWORD *)(a5 + 16);
  *(_QWORD *)(v7 + 160) = v13;
  *(_QWORD *)(v7 + 168) = v14;
  *(_QWORD *)(v7 + 176) = v15;
  return swift_task_switch();
}

uint64_t sub_23B92E040()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  BOOL v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  _BOOL4 v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
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
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  os_log_type_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t type;
  uint64_t v49;

  v1 = *(_QWORD *)(v0 + 104);
  v3 = *(_QWORD *)(v1 + 112);
  v2 = *(_QWORD *)(v1 + 120);
  v4 = v3 == *(_QWORD *)(v0 + 72) && v2 == *(_QWORD *)(v0 + 80);
  if (v4 || (sub_23B958820() & 1) != 0)
  {
    if (qword_254309BF0 != -1)
      swift_once();
    v5 = sub_23B95831C();
    __swift_project_value_buffer(v5, (uint64_t)qword_254309BD8);
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    v6 = sub_23B958304();
    v7 = sub_23B958568();
    v8 = os_log_type_enabled(v6, v7);
    v9 = *(_QWORD *)(v0 + 176);
    if (v8)
    {
      v43 = *(_QWORD *)(v0 + 168);
      v10 = *(_QWORD *)(v0 + 80);
      v40 = *(_QWORD *)(v0 + 72);
      v11 = swift_slowAlloc();
      v45 = swift_slowAlloc();
      v49 = v45;
      *(_DWORD *)v11 = 136315907;
      v15 = sub_23B91B910(v45, v12, v13, v14);
      *(_QWORD *)(v0 + 40) = sub_23B9287E0(v15, v16, &v49);
      sub_23B9585A4();
      swift_bridgeObjectRelease();
      *(_WORD *)(v11 + 12) = 2082;
      swift_bridgeObjectRetain();
      *(_QWORD *)(v0 + 48) = sub_23B9287E0(v40, v10, &v49);
      sub_23B9585A4();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v11 + 22) = 2160;
      *(_QWORD *)(v0 + 56) = 1752392040;
      sub_23B9585A4();
      *(_WORD *)(v11 + 32) = 2081;
      swift_bridgeObjectRetain();
      *(_QWORD *)(v0 + 64) = sub_23B9287E0(v43, v9, &v49);
      sub_23B9585A4();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_23B916000, v6, v7, "%s: Received raw dictionary on %{public}s from %{private,mask.hash}s", (uint8_t *)v11, 0x2Au);
      swift_arrayDestroy();
      MEMORY[0x242609864](v45, -1, -1);
      MEMORY[0x242609864](v11, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
    }

    v17 = *(_QWORD *)(v0 + 104);
    v18 = *(_QWORD *)(v17 + 200);
    if (v18)
    {
      v19 = *(_QWORD *)(v0 + 176);
      v44 = *(_BYTE *)(v0 + 184);
      v20 = *(_QWORD *)(v0 + 144);
      v41 = *(_QWORD *)(v0 + 152);
      v42 = *(_QWORD *)(v0 + 160);
      v46 = *(_QWORD *)(v0 + 168);
      v21 = *(_QWORD *)(v0 + 136);
      v22 = *(_QWORD *)(v0 + 120);
      v23 = *(_QWORD *)(v0 + 88);
      v24 = *(_QWORD *)(v0 + 96);
      v25 = *(_QWORD *)(v17 + 208);
      v26 = sub_23B9584F0();
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v26 - 8) + 56))(v20, 1, 1, v26);
      sub_23B92F2F8(v24, v21, (uint64_t (*)(_QWORD))type metadata accessor for MessageContext);
      v27 = (*(unsigned __int8 *)(v22 + 80) + 96) & ~(unint64_t)*(unsigned __int8 *)(v22 + 80);
      v28 = swift_allocObject();
      *(_QWORD *)(v28 + 16) = 0;
      *(_QWORD *)(v28 + 24) = 0;
      *(_QWORD *)(v28 + 32) = v18;
      *(_QWORD *)(v28 + 40) = v25;
      *(_QWORD *)(v28 + 48) = v41;
      *(_QWORD *)(v28 + 56) = v42;
      *(_BYTE *)(v28 + 64) = v44;
      *(_QWORD *)(v28 + 72) = v46;
      *(_QWORD *)(v28 + 80) = v19;
      *(_QWORD *)(v28 + 88) = v23;
      sub_23B92F378(v21, v28 + v27, (uint64_t (*)(_QWORD))type metadata accessor for MessageContext);
      swift_bridgeObjectRetain();
      sub_23B92ED9C(v18);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_23B94CA58(v20, (uint64_t)&unk_256A555C0, v28);
      swift_release();
    }
  }
  else
  {
    if (qword_254309BF0 != -1)
      swift_once();
    v29 = sub_23B95831C();
    __swift_project_value_buffer(v29, (uint64_t)qword_254309BD8);
    swift_bridgeObjectRetain_n();
    swift_retain_n();
    v30 = sub_23B958304();
    v31 = sub_23B958550();
    if (os_log_type_enabled(v30, v31))
    {
      v32 = *(_QWORD *)(v0 + 80);
      v47 = *(_QWORD *)(v0 + 72);
      v33 = swift_slowAlloc();
      type = swift_slowAlloc();
      v49 = type;
      *(_DWORD *)v33 = 136446722;
      v37 = sub_23B91B910(type, v34, v35, v36);
      *(_QWORD *)(v0 + 16) = sub_23B9287E0(v37, v38, &v49);
      sub_23B9585A4();
      swift_bridgeObjectRelease();
      *(_WORD *)(v33 + 12) = 2082;
      swift_bridgeObjectRetain();
      *(_QWORD *)(v0 + 24) = sub_23B9287E0(v3, v2, &v49);
      sub_23B9585A4();
      swift_bridgeObjectRelease();
      swift_release_n();
      *(_WORD *)(v33 + 22) = 2082;
      swift_bridgeObjectRetain();
      *(_QWORD *)(v0 + 32) = sub_23B9287E0(v47, v32, &v49);
      sub_23B9585A4();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_23B916000, v30, v31, "%{public}s: Ignoring delegate callback from wrong IDS service! Expected %{public}s, received: %{public}s", (uint8_t *)v33, 0x20u);
      swift_arrayDestroy();
      MEMORY[0x242609864](type, -1, -1);
      MEMORY[0x242609864](v33, -1, -1);
    }
    else
    {
      swift_release_n();
      swift_bridgeObjectRelease_n();
    }

  }
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23B92E654(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = v1;
  return swift_task_switch();
}

uint64_t sub_23B92E66C()
{
  uint64_t v0;
  uint64_t v1;
  int *v2;
  _QWORD *v3;
  uint64_t (*v5)(_QWORD);

  v1 = *(_QWORD *)(v0 + 24);
  v2 = *(int **)(v1 + 216);
  *(_QWORD *)(v0 + 32) = v2;
  if (!v2)
    return (*(uint64_t (**)(void))(v0 + 8))();
  *(_QWORD *)(v0 + 40) = *(_QWORD *)(v1 + 224);
  v5 = (uint64_t (*)(_QWORD))((char *)v2 + *v2);
  swift_retain();
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 48) = v3;
  *v3 = v0;
  v3[1] = sub_23B92E704;
  return v5(*(_QWORD *)(v0 + 16));
}

uint64_t sub_23B92E704()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23B92E75C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = v1;
  return swift_task_switch();
}

uint64_t sub_23B92E774()
{
  uint64_t v0;
  uint64_t v1;
  int *v2;
  _QWORD *v3;
  uint64_t (*v5)(_QWORD);

  v1 = *(_QWORD *)(v0 + 24);
  v2 = *(int **)(v1 + 232);
  *(_QWORD *)(v0 + 32) = v2;
  if (!v2)
    return (*(uint64_t (**)(void))(v0 + 8))();
  *(_QWORD *)(v0 + 40) = *(_QWORD *)(v1 + 240);
  v5 = (uint64_t (*)(_QWORD))((char *)v2 + *v2);
  swift_retain();
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 48) = v3;
  *v3 = v0;
  v3[1] = sub_23B92E80C;
  return v5(*(_QWORD *)(v0 + 16));
}

uint64_t sub_23B92E80C()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23B92E864()
{
  uint64_t v0;

  sub_23B92D238(*(_QWORD *)(v0 + 32));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23B92E894()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  void (*v8)(uint64_t, uint64_t);
  uint64_t v9;
  uint64_t v10;

  v1 = type metadata accessor for MessageContext();
  v2 = *(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80);
  v3 = (v2 + 96) & ~v2;
  swift_unknownObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v4 = v0 + v3;
  v5 = sub_23B9582F8();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v0 + v3, 1, v5);
  v8 = *(void (**)(uint64_t, uint64_t))(v6 + 8);
  if (!v7)
    v8(v0 + v3, v5);
  v8(v4 + *(int *)(v1 + 20), v5);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v9 = v4 + *(int *)(v1 + 44);
  v10 = sub_23B9582B0();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 8))(v9, v10);
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_23B92E9D0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  int *v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  __int128 v12;

  v2 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for MessageContext() - 8) + 80);
  v3 = *(int **)(v0 + 32);
  v4 = *(_QWORD *)(v0 + 48);
  v5 = *(_QWORD *)(v0 + 56);
  v6 = *(_BYTE *)(v0 + 64);
  v12 = *(_OWORD *)(v0 + 72);
  v7 = *(_QWORD *)(v0 + 88);
  v8 = v0 + ((v2 + 96) & ~v2);
  v9 = swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v9;
  *(_QWORD *)v9 = v1;
  *(_QWORD *)(v9 + 8) = sub_23B930844;
  *(_QWORD *)(v9 + 40) = v4;
  *(_QWORD *)(v9 + 48) = v5;
  *(_BYTE *)(v9 + 16) = v6;
  *(_OWORD *)(v9 + 24) = v12;
  *(_QWORD *)&v12 = (char *)v3 + *v3;
  v10 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v9 + 56) = v10;
  *v10 = v9;
  v10[1] = sub_23B927B9C;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))v12)(v9 + 40, v9 + 16, v7, v8);
}

uint64_t sub_23B92EAC4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  void (*v18)(uint64_t, uint64_t);
  uint64_t v19;
  uint64_t v20;

  v5 = *(_QWORD *)(v4 + 32);
  v6 = type metadata accessor for Message(0, v5, *(_QWORD *)(v4 + 40), a4);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = (*(unsigned __int8 *)(v7 + 80) + 104) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  v9 = (*(_QWORD *)(v7 + 64) + v8 + 7) & 0xFFFFFFFFFFFFFFF8;
  v10 = type metadata accessor for MessageContext();
  v11 = *(unsigned __int8 *)(*(_QWORD *)(v10 - 8) + 80);
  v12 = (v9 + v11 + 8) & ~v11;
  swift_unknownObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v13 = v4 + v8;
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v13, v5);
  sub_23B92D4DC(*(_QWORD *)(v13 + *(int *)(v6 + 40)), *(_QWORD *)(v13 + *(int *)(v6 + 40) + 8));
  swift_bridgeObjectRelease();
  v14 = v4 + v12;
  v15 = sub_23B9582F8();
  v16 = *(_QWORD *)(v15 - 8);
  v17 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v16 + 48))(v4 + v12, 1, v15);
  v18 = *(void (**)(uint64_t, uint64_t))(v16 + 8);
  if (!v17)
    v18(v4 + v12, v15);
  v18(v14 + *(int *)(v10 + 20), v15);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v19 = v14 + *(int *)(v10 + 44);
  v20 = sub_23B9582B0();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 8))(v19, v20);
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_23B92EC6C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int *v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  __int128 v21;

  v6 = *(_QWORD *)(type metadata accessor for Message(0, *(_QWORD *)(v4 + 32), *(_QWORD *)(v4 + 40), a4) - 8);
  v7 = (*(unsigned __int8 *)(v6 + 80) + 104) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  v8 = (*(_QWORD *)(v6 + 64) + v7 + 7) & 0xFFFFFFFFFFFFFFF8;
  v9 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for MessageContext() - 8) + 80);
  v10 = (v8 + v9 + 8) & ~v9;
  v11 = *(int **)(v4 + 48);
  v12 = *(_QWORD *)(v4 + 64);
  v13 = *(_QWORD *)(v4 + 72);
  v14 = *(_BYTE *)(v4 + 80);
  v21 = *(_OWORD *)(v4 + 88);
  v15 = v4 + v7;
  v16 = *(_QWORD *)(v4 + v8);
  v17 = v4 + v10;
  v18 = swift_task_alloc();
  *(_QWORD *)(v5 + 16) = v18;
  *(_QWORD *)v18 = v5;
  *(_QWORD *)(v18 + 8) = sub_23B930844;
  *(_QWORD *)(v18 + 40) = v12;
  *(_QWORD *)(v18 + 48) = v13;
  *(_BYTE *)(v18 + 16) = v14;
  *(_OWORD *)(v18 + 24) = v21;
  *(_QWORD *)&v21 = (char *)v11 + *v11;
  v19 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v18 + 56) = v19;
  *v19 = v18;
  v19[1] = sub_23B93083C;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))v21)(v18 + 40, v18 + 16, v15, v16, v17);
}

uint64_t sub_23B92ED9C(uint64_t result)
{
  if (result)
    return swift_retain();
  return result;
}

uint64_t sub_23B92EDAC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  void (*v18)(unint64_t, uint64_t);
  uint64_t v19;
  uint64_t v20;

  v5 = *(_QWORD *)(v4 + 32);
  v6 = type metadata accessor for Message(0, v5, *(_QWORD *)(v4 + 40), a4);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = (*(unsigned __int8 *)(v7 + 80) + 104) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  v9 = *(_QWORD *)(v7 + 64);
  v10 = type metadata accessor for MessageContext();
  v11 = *(unsigned __int8 *)(*(_QWORD *)(v10 - 8) + 80);
  v12 = (v8 + v9 + v11) & ~v11;
  swift_unknownObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v13 = v4 + v8;
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v13, v5);
  sub_23B92D4DC(*(_QWORD *)(v13 + *(int *)(v6 + 40)), *(_QWORD *)(v13 + *(int *)(v6 + 40) + 8));
  v14 = v4 + v12;
  v15 = sub_23B9582F8();
  v16 = *(_QWORD *)(v15 - 8);
  v17 = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v16 + 48))(v4 + v12, 1, v15);
  v18 = *(void (**)(unint64_t, uint64_t))(v16 + 8);
  if (!v17)
    v18(v4 + v12, v15);
  v18(v14 + *(int *)(v10 + 20), v15);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v19 = v14 + *(int *)(v10 + 44);
  v20 = sub_23B9582B0();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 8))(v19, v20);
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_23B92EF40(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v17;

  v6 = *(_QWORD *)(type metadata accessor for Message(0, *(_QWORD *)(v4 + 32), *(_QWORD *)(v4 + 40), a4) - 8);
  v7 = (*(unsigned __int8 *)(v6 + 80) + 104) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  v8 = *(_QWORD *)(v6 + 64);
  v9 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for MessageContext() - 8) + 80);
  v10 = v7 + v8 + v9;
  v17 = *(_OWORD *)(v4 + 64);
  LOBYTE(v8) = *(_BYTE *)(v4 + 80);
  v11 = *(_QWORD *)(v4 + 88);
  v12 = *(_QWORD *)(v4 + 96);
  v13 = v4 + (v10 & ~v9);
  v14 = swift_task_alloc();
  v15 = *(_OWORD *)(v4 + 48);
  *(_QWORD *)(v5 + 16) = v14;
  *(_QWORD *)v14 = v5;
  *(_QWORD *)(v14 + 8) = sub_23B930844;
  *(_QWORD *)(v14 + 104) = v4 + v7;
  *(_QWORD *)(v14 + 112) = v13;
  *(_QWORD *)(v14 + 88) = v11;
  *(_QWORD *)(v14 + 96) = v12;
  *(_BYTE *)(v14 + 136) = v8;
  *(_OWORD *)(v14 + 72) = v17;
  *(_OWORD *)(v14 + 56) = v15;
  return swift_task_switch();
}

uint64_t sub_23B92F020(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254309A30);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 24))(a2, a1, v4);
  return a2;
}

unint64_t sub_23B92F068()
{
  unint64_t result;

  result = qword_256A55608;
  if (!qword_256A55608)
  {
    result = MEMORY[0x2426097B0](&protocol conformance descriptor for Destination, &type metadata for Destination);
    atomic_store(result, (unint64_t *)&qword_256A55608);
  }
  return result;
}

uint64_t sub_23B92F0AC(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
    v8 = *(_QWORD *)(type metadata accessor for CorrelationIdentifier() - 8);
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
  result = sub_23B958760();
  __break(1u);
  return result;
}

uint64_t sub_23B92F1C4(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
    v5 = a4 + 24 * a1 + 32;
    v6 = a3 + 24 * v4;
    if (v5 >= v6 || v5 + 24 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  result = sub_23B958760();
  __break(1u);
  return result;
}

uint64_t sub_23B92F2B8(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x2426097B0](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_23B92F2F8(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_23B92F33C(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v3;

  v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_23B92F378(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_23B92F3BC()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(unint64_t, uint64_t);
  unint64_t v6;

  v1 = type metadata accessor for MessagingOptions();
  v2 = (*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 72) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80);
  swift_unknownObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v3 = sub_23B9582F8();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = *(void (**)(unint64_t, uint64_t))(v4 + 8);
  v5(v0 + v2, v3);
  swift_bridgeObjectRelease();
  v6 = v0 + v2 + *(int *)(v1 + 28);
  if (!(*(unsigned int (**)(unint64_t, uint64_t, uint64_t))(v4 + 48))(v6, 1, v3))
    v5(v6, v3);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23B92F4E0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;

  v2 = *(_QWORD *)(type metadata accessor for MessagingOptions() - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 72) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = *(_QWORD *)(v0 + 56);
  v5 = *(_QWORD *)(v0 + 64);
  v6 = v0 + v3;
  v7 = *(_QWORD *)(v0 + ((*(_QWORD *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFF8));
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v8;
  *v8 = v1;
  v8[1] = sub_23B930844;
  v9 = (_QWORD *)swift_task_alloc();
  v8[2] = v9;
  *v9 = v8;
  v9[1] = sub_23B930844;
  return sub_23B9225F0(v4, v5, v6, v7);
}

uint64_t sub_23B92F5A0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t);
  uint64_t v7;

  v1 = type metadata accessor for MessagingOptions();
  v2 = *(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v3 = v0 + ((v2 + 56) & ~v2);
  v4 = sub_23B9582F8();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(void (**)(uint64_t, uint64_t))(v5 + 8);
  v6(v3, v4);
  swift_bridgeObjectRelease();
  v7 = v3 + *(int *)(v1 + 28);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(v7, 1, v4))
    v6(v7, v4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_23B92F6B4(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;

  v4 = *(_QWORD *)(type metadata accessor for MessagingOptions() - 8);
  v5 = (*(unsigned __int8 *)(v4 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v6 = v1[4];
  v7 = v1[5];
  v8 = v1[6];
  v9 = (uint64_t)v1 + v5;
  v10 = *(_QWORD *)((char *)v1 + ((*(_QWORD *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFF8));
  v11 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v11;
  *v11 = v2;
  v11[1] = sub_23B930844;
  return sub_23B923F88(a1, v6, v7, v8, v9, v10);
}

uint64_t sub_23B92F760(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(unint64_t, uint64_t);
  unint64_t v16;

  v5 = *(_QWORD *)(v4 + 32);
  v6 = type metadata accessor for Message(0, v5, *(_QWORD *)(v4 + 40), a4);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = (*(unsigned __int8 *)(v7 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  v9 = *(_QWORD *)(v7 + 64);
  v10 = type metadata accessor for MessagingOptions();
  v11 = (v8 + v9 + *(unsigned __int8 *)(*(_QWORD *)(v10 - 8) + 80)) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v10 - 8) + 80);
  swift_unknownObjectRelease();
  swift_release();
  v12 = v4 + v8;
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v12, v5);
  sub_23B92D4DC(*(_QWORD *)(v12 + *(int *)(v6 + 40)), *(_QWORD *)(v12 + *(int *)(v6 + 40) + 8));
  v13 = sub_23B9582F8();
  v14 = *(_QWORD *)(v13 - 8);
  v15 = *(void (**)(unint64_t, uint64_t))(v14 + 8);
  v15(v4 + v11, v13);
  swift_bridgeObjectRelease();
  v16 = v4 + v11 + *(int *)(v10 + 28);
  if (!(*(unsigned int (**)(unint64_t, uint64_t, uint64_t))(v14 + 48))(v16, 1, v13))
    v15(v16, v13);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23B92F8DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;

  v6 = *(_QWORD *)(type metadata accessor for Message(0, *(_QWORD *)(v4 + 32), *(_QWORD *)(v4 + 40), a4) - 8);
  v7 = (*(unsigned __int8 *)(v6 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  v8 = *(_QWORD *)(v6 + 64);
  v9 = *(_QWORD *)(type metadata accessor for MessagingOptions() - 8);
  v10 = (v7 + v8 + *(unsigned __int8 *)(v9 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  v11 = v4 + v7;
  v12 = v4 + v10;
  v13 = *(_QWORD *)(v4 + ((*(_QWORD *)(v9 + 64) + v10 + 7) & 0xFFFFFFFFFFFFF8));
  v14 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v5 + 16) = v14;
  *v14 = v5;
  v14[1] = sub_23B92F9BC;
  v15 = (_QWORD *)swift_task_alloc();
  v14[2] = v15;
  *v15 = v14;
  v15[1] = sub_23B930844;
  return sub_23B921388(v11, v12, v13);
}

uint64_t sub_23B92F9BC()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_23B92FA04(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(unint64_t, uint64_t);
  unint64_t v16;

  v5 = *(_QWORD *)(v4 + 16);
  v6 = type metadata accessor for Message(0, v5, *(_QWORD *)(v4 + 24), a4);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = (*(unsigned __int8 *)(v7 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  v9 = *(_QWORD *)(v7 + 64);
  v10 = type metadata accessor for MessagingOptions();
  v11 = (v8 + v9 + *(unsigned __int8 *)(*(_QWORD *)(v10 - 8) + 80)) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v10 - 8) + 80);
  swift_release();
  v12 = v4 + v8;
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v12, v5);
  sub_23B92D4DC(*(_QWORD *)(v12 + *(int *)(v6 + 40)), *(_QWORD *)(v12 + *(int *)(v6 + 40) + 8));
  v13 = sub_23B9582F8();
  v14 = *(_QWORD *)(v13 - 8);
  v15 = *(void (**)(unint64_t, uint64_t))(v14 + 8);
  v15(v4 + v11, v13);
  swift_bridgeObjectRelease();
  v16 = v4 + v11 + *(int *)(v10 + 28);
  if (!(*(unsigned int (**)(unint64_t, uint64_t, uint64_t))(v14 + 48))(v16, 1, v13))
    v15(v16, v13);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_23B92FB70(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t *v4;
  uint64_t v5;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;

  v7 = *(_QWORD *)(type metadata accessor for Message(0, v4[2], v4[3], a4) - 8);
  v8 = (*(unsigned __int8 *)(v7 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  v9 = *(_QWORD *)(v7 + 64);
  v10 = *(_QWORD *)(type metadata accessor for MessagingOptions() - 8);
  v11 = (v8 + v9 + *(unsigned __int8 *)(v10 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v12 = (uint64_t *)v4[4];
  v13 = (uint64_t)v4 + v8;
  v14 = (uint64_t)v4 + v11;
  v15 = *(uint64_t *)((char *)v4 + ((*(_QWORD *)(v10 + 64) + v11 + 7) & 0xFFFFFFFFFFFFF8));
  v16 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v5 + 16) = v16;
  *v16 = v5;
  v16[1] = sub_23B92F9BC;
  return sub_23B923A80(a1, v12, v13, v14, v15);
}

uint64_t sub_23B92FC3C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(unint64_t, uint64_t);
  unint64_t v16;

  v5 = *(_QWORD *)(v4 + 32);
  v6 = type metadata accessor for Message(0, v5, *(_QWORD *)(v4 + 40), a4);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = (*(unsigned __int8 *)(v7 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  v9 = (*(_QWORD *)(v7 + 64) + v8 + 7) & 0xFFFFFFFFFFFFFFF8;
  v10 = type metadata accessor for MessagingOptions();
  v11 = (v9 + *(unsigned __int8 *)(*(_QWORD *)(v10 - 8) + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v10 - 8) + 80);
  swift_unknownObjectRelease();
  swift_release();
  v12 = v4 + v8;
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v12, v5);
  sub_23B92D4DC(*(_QWORD *)(v12 + *(int *)(v6 + 40)), *(_QWORD *)(v12 + *(int *)(v6 + 40) + 8));
  swift_bridgeObjectRelease();
  v13 = sub_23B9582F8();
  v14 = *(_QWORD *)(v13 - 8);
  v15 = *(void (**)(unint64_t, uint64_t))(v14 + 8);
  v15(v4 + v11, v13);
  swift_bridgeObjectRelease();
  v16 = v4 + v11 + *(int *)(v10 + 28);
  if (!(*(unsigned int (**)(unint64_t, uint64_t, uint64_t))(v14 + 48))(v16, 1, v13))
    v15(v16, v13);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23B92FDDC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;

  v6 = *(_QWORD *)(type metadata accessor for Message(0, *(_QWORD *)(v4 + 32), *(_QWORD *)(v4 + 40), a4) - 8);
  v7 = (*(unsigned __int8 *)(v6 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  v8 = (*(_QWORD *)(v6 + 64) + v7 + 7) & 0xFFFFFFFFFFFFFFF8;
  v9 = *(_QWORD *)(type metadata accessor for MessagingOptions() - 8);
  v10 = (v8 + *(unsigned __int8 *)(v9 + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  v11 = (*(_QWORD *)(v9 + 64) + v10 + 7) & 0xFFFFFFFFFFFFFFF8;
  v12 = v4 + v7;
  v13 = *(_QWORD *)(v4 + v8);
  v14 = v4 + v10;
  v15 = *(_QWORD *)(v4 + v11);
  v16 = *(_QWORD *)(v4 + ((v11 + 15) & 0xFFFFFFFFFFFFF8));
  v17 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v5 + 16) = v17;
  *v17 = v5;
  v17[1] = sub_23B930844;
  v18 = (_QWORD *)swift_task_alloc();
  v17[2] = v18;
  *v18 = v17;
  v18[1] = sub_23B930844;
  return sub_23B91FAB4(v12, v13, v14, v15, v16);
}

uint64_t sub_23B92FEE8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(unint64_t, uint64_t);
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v19;
  uint64_t v20;

  v2 = *(_QWORD *)(v0 + 16);
  v1 = *(_QWORD *)(v0 + 24);
  v3 = sub_23B95825C();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = (*(unsigned __int8 *)(v4 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v6 = (((*(_QWORD *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8;
  v7 = type metadata accessor for MessagingOptions();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = (*(unsigned __int8 *)(v8 + 80) + v6 + 8) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  v19 = *(_QWORD *)(v8 + 64);
  v20 = type metadata accessor for Message(0, v2, v1, v10);
  v11 = *(unsigned __int8 *)(*(_QWORD *)(v20 - 8) + 80);
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v4 + 8))(v0 + v5, v3);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v12 = sub_23B9582F8();
  v13 = *(_QWORD *)(v12 - 8);
  v14 = *(void (**)(unint64_t, uint64_t))(v13 + 8);
  v14(v0 + v9, v12);
  swift_bridgeObjectRelease();
  v15 = v0 + v9 + *(int *)(v7 + 28);
  if (!(*(unsigned int (**)(unint64_t, uint64_t, uint64_t))(v13 + 48))(v15, 1, v12))
    v14(v15, v12);
  v16 = (v19 + v11 + v9) & ~v11;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(unint64_t))(*(_QWORD *)(v2 - 8) + 8))(v0 + v16);
  v17 = v0 + v16 + *(int *)(v20 + 40);
  sub_23B92D4DC(*(_QWORD *)v17, *(_QWORD *)(v17 + 8));
  return swift_deallocObject();
}

uint64_t sub_23B9300D0(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;

  v4 = v1[2];
  v5 = v1[3];
  v6 = *(_QWORD *)(sub_23B95825C() - 8);
  v7 = (*(unsigned __int8 *)(v6 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  v8 = (*(_QWORD *)(v6 + 64) + v7 + 7) & 0xFFFFFFFFFFFFFFF8;
  v9 = (v8 + 15) & 0xFFFFFFFFFFFFFFF8;
  v10 = *(_QWORD *)(type metadata accessor for MessagingOptions() - 8);
  v11 = (*(unsigned __int8 *)(v10 + 80) + v9 + 8) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v12 = *(_QWORD *)(v10 + 64);
  v14 = *(_QWORD *)(type metadata accessor for Message(0, v4, v5, v13) - 8);
  v15 = (v12 + *(unsigned __int8 *)(v14 + 80) + v11) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80);
  v16 = v1[4];
  v17 = (uint64_t)v1 + v7;
  v18 = *(_QWORD *)((char *)v1 + v8);
  v19 = *(_QWORD *)((char *)v1 + v9);
  v20 = (uint64_t)v1 + v11;
  v21 = (uint64_t)v1 + v15;
  v22 = *(_QWORD *)((char *)v1 + ((*(_QWORD *)(v14 + 64) + v15 + 7) & 0xFFFFFFFFFFFFF8));
  v23 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v23;
  *v23 = v2;
  v23[1] = sub_23B930844;
  return sub_23B923380(a1, v16, v17, v18, v19, v20, v21, v22);
}

uint64_t sub_23B930200(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(unint64_t, uint64_t);
  unint64_t v17;
  uint64_t v19;

  v5 = *(_QWORD *)(v4 + 32);
  v6 = type metadata accessor for Message(0, v5, *(_QWORD *)(v4 + 40), a4);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = (*(unsigned __int8 *)(v7 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  v9 = *(_QWORD *)(v7 + 64);
  v10 = type metadata accessor for MessagingOptions();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = (v8 + v9 + *(unsigned __int8 *)(v11 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  v19 = *(_QWORD *)(v11 + 64);
  swift_unknownObjectRelease();
  swift_release();
  v13 = v4 + v8;
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v13, v5);
  sub_23B92D4DC(*(_QWORD *)(v13 + *(int *)(v6 + 40)), *(_QWORD *)(v13 + *(int *)(v6 + 40) + 8));
  v14 = sub_23B9582F8();
  v15 = *(_QWORD *)(v14 - 8);
  v16 = *(void (**)(unint64_t, uint64_t))(v15 + 8);
  v16(v4 + v12, v14);
  swift_bridgeObjectRelease();
  v17 = v4 + v12 + *(int *)(v10 + 28);
  if (!(*(unsigned int (**)(unint64_t, uint64_t, uint64_t))(v15 + 48))(v17, 1, v14))
    v16(v17, v14);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_23B92D4DC(*(_QWORD *)(v4 + ((v19 + v12 + 7) & 0xFFFFFFFFFFFFFFF8)), *(_QWORD *)(v4 + ((v19 + v12 + 7) & 0xFFFFFFFFFFFFFFF8) + 8));
  swift_bridgeObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23B9303A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  _QWORD *v21;

  v6 = *(_QWORD *)(type metadata accessor for Message(0, *(_QWORD *)(v4 + 32), *(_QWORD *)(v4 + 40), a4) - 8);
  v7 = (*(unsigned __int8 *)(v6 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  v8 = *(_QWORD *)(v6 + 64);
  v9 = *(_QWORD *)(type metadata accessor for MessagingOptions() - 8);
  v10 = (v7 + v8 + *(unsigned __int8 *)(v9 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  v11 = (*(_QWORD *)(v9 + 64) + v10 + 7) & 0xFFFFFFFFFFFFFFF8;
  v12 = (v11 + 23) & 0xFFFFFFFFFFFFFFF8;
  v13 = v4 + v7;
  v14 = v4 + v10;
  v15 = (uint64_t *)(v4 + v11);
  v16 = *v15;
  v17 = v15[1];
  v18 = *(_QWORD *)(v4 + v12);
  v19 = *(_QWORD *)(v4 + ((v12 + 15) & 0xFFFFFFFFFFFFF8));
  v20 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v5 + 16) = v20;
  *v20 = v5;
  v20[1] = sub_23B930844;
  v21 = (_QWORD *)swift_task_alloc();
  v20[2] = v21;
  *v21 = v20;
  v21[1] = sub_23B930844;
  return sub_23B91E544(v13, v14, v16, v17, v18, v19);
}

uint64_t sub_23B9304B0(uint64_t a1, unint64_t a2)
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

uint64_t sub_23B9304F4()
{
  char *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(char *, uint64_t);
  char *v11;
  unint64_t v12;
  char *v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v1 = *((_QWORD *)v0 + 2);
  v2 = *((_QWORD *)v0 + 3);
  v3 = type metadata accessor for MessagingOptions();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = (*(unsigned __int8 *)(v4 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v15 = *(_QWORD *)(v4 + 64);
  v17 = v1;
  v16 = type metadata accessor for Message(0, v1, v2, v6);
  v7 = *(unsigned __int8 *)(*(_QWORD *)(v16 - 8) + 80);
  swift_release();
  sub_23B92D4DC(*((_QWORD *)v0 + 5), *((_QWORD *)v0 + 6));
  swift_bridgeObjectRelease();
  v8 = sub_23B9582F8();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = *(void (**)(char *, uint64_t))(v9 + 8);
  v10(&v0[v5], v8);
  swift_bridgeObjectRelease();
  v11 = &v0[v5 + *(int *)(v3 + 28)];
  if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v11, 1, v8))
    v10(v11, v8);
  v12 = (v5 + v15 + v7) & ~v7;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(char *))(*(_QWORD *)(v17 - 8) + 8))(&v0[v12]);
  v13 = &v0[v12 + *(int *)(v16 + 40)];
  sub_23B92D4DC(*(_QWORD *)v13, *((_QWORD *)v13 + 1));
  return swift_deallocObject();
}

uint64_t sub_23B930684(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;

  v4 = v1[2];
  v5 = v1[3];
  v6 = *(_QWORD *)(type metadata accessor for MessagingOptions() - 8);
  v7 = (*(unsigned __int8 *)(v6 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  v8 = v7 + *(_QWORD *)(v6 + 64);
  v10 = *(_QWORD *)(type metadata accessor for Message(0, v4, v5, v9) - 8);
  v11 = (v8 + *(unsigned __int8 *)(v10 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v12 = v1[4];
  v13 = v1[5];
  v14 = v1[6];
  v15 = v1[7];
  v16 = (uint64_t)v1 + v7;
  v17 = (uint64_t)v1 + v11;
  v18 = *(_QWORD *)((char *)v1 + ((*(_QWORD *)(v10 + 64) + v11 + 7) & 0xFFFFFFFFFFFFF8));
  v19 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v19;
  *v19 = v2;
  v19[1] = sub_23B930844;
  return sub_23B922CBC(a1, v12, v13, v14, v15, v16, v17, v18);
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

uint64_t sub_23B930790(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_23B9307CC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t __swift_instantiateGenericMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x242609750](a1, v6, a5);
}

uint64_t sub_23B93084C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = sub_23B95831C();
  __swift_allocate_value_buffer(v0, qword_256A55708);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_256A55708);
  if (qword_256A55430 != -1)
    swift_once();
  v2 = __swift_project_value_buffer(v0, (uint64_t)qword_256A55CC0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 - 8) + 16))(v1, v2, v0);
}

uint64_t CorrelationIdentifierMap.init(serviceName:destinations:disambiguate:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;

  v6[15] = a5;
  v6[16] = a6;
  v6[13] = a3;
  v6[14] = a4;
  v6[11] = a1;
  v6[12] = a2;
  return swift_task_switch();
}

{
  _QWORD *v6;

  v6[15] = a5;
  v6[16] = a6;
  v6[13] = a3;
  v6[14] = a4;
  v6[11] = a1;
  v6[12] = a2;
  return swift_task_switch();
}

id sub_23B9308FC()
{
  _QWORD *v0;
  uint64_t Controller;
  _QWORD *v2;
  id result;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;

  Controller = type metadata accessor for QueryController();
  v2 = (_QWORD *)swift_allocObject();
  v0[17] = v2;
  swift_defaultActor_initialize();
  result = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
  if (result)
  {
    v5 = v0[12];
    v4 = v0[13];
    v2[14] = result;
    v2[15] = v5;
    v2[16] = v4;
    v0[5] = Controller;
    v0[6] = &protocol witness table for QueryController;
    v0[2] = v2;
    swift_retain();
    swift_retain();
    v6 = (_QWORD *)swift_task_alloc();
    v0[18] = v6;
    *v6 = v0;
    v6[1] = sub_23B9309EC;
    return (id)sub_23B930AD8((uint64_t)(v0 + 7), (uint64_t)(v0 + 2), v0[14], v0[15], v0[16]);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_23B9309EC()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 152) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23B930A50()
{
  uint64_t v0;
  _OWORD *v1;
  __int128 v2;

  v1 = *(_OWORD **)(v0 + 88);
  swift_release();
  swift_release();
  v2 = *(_OWORD *)(v0 + 72);
  *v1 = *(_OWORD *)(v0 + 56);
  v1[1] = v2;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23B930A9C()
{
  uint64_t v0;

  swift_release();
  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23B930AD8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;

  v5[35] = a4;
  v5[36] = a5;
  v5[33] = a2;
  v5[34] = a3;
  v5[32] = a1;
  v5[37] = type metadata accessor for CorrelationIdentifier();
  v5[38] = swift_task_alloc();
  v5[39] = swift_task_alloc();
  v5[40] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23B930B58()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t, uint64_t);

  v1 = *(_QWORD *)(v0 + 272);
  v2 = *(_QWORD *)(v1 + 16);
  *(_QWORD *)(v0 + 328) = v2;
  if (v2)
  {
    v3 = *(_QWORD **)(v0 + 264);
    *(_QWORD *)(v0 + 352) = 0;
    v4 = MEMORY[0x24BEE4B00];
    *(_QWORD *)(v0 + 336) = MEMORY[0x24BEE4B00];
    *(_QWORD *)(v0 + 344) = v4;
    v5 = *(_BYTE *)(v1 + 32);
    *(_BYTE *)(v0 + 408) = v5;
    v6 = *(_QWORD *)(v1 + 40);
    *(_QWORD *)(v0 + 360) = v6;
    v7 = *(_QWORD *)(v1 + 48);
    *(_QWORD *)(v0 + 368) = v7;
    v8 = v3[3];
    v9 = v3[4];
    swift_retain();
    __swift_project_boxed_opaque_existential_1(v3, v8);
    *(_BYTE *)(v0 + 16) = v5;
    *(_QWORD *)(v0 + 24) = v6;
    *(_QWORD *)(v0 + 32) = v7;
    v17 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(**(int **)(v9 + 8) + *(_QWORD *)(v9 + 8));
    swift_bridgeObjectRetain();
    v10 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 376) = v10;
    *v10 = v0;
    v10[1] = sub_23B930CD4;
    return v17(v0 + 16, v8, v9);
  }
  else
  {
    swift_bridgeObjectRelease();
    v12 = *(_QWORD *)(v0 + 280);
    v13 = *(_QWORD *)(v0 + 288);
    v14 = *(_QWORD **)(v0 + 256);
    v15 = *(_QWORD *)(v0 + 264);
    v16 = MEMORY[0x24BEE4B00];
    *v14 = MEMORY[0x24BEE4B00];
    v14[1] = v16;
    v14[2] = v12;
    v14[3] = v13;
    swift_bridgeObjectRetain_n();
    swift_retain();
    __swift_destroy_boxed_opaque_existential_0(v15);
    swift_bridgeObjectRelease_n();
    swift_release();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_23B930CD4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;

  v4 = (_QWORD *)*v3;
  v4[48] = a1;
  v4[49] = a2;
  v4[50] = v2;
  swift_task_dealloc();
  if (v2)
    swift_bridgeObjectRelease();
  return swift_task_switch();
}

uint64_t sub_23B930D4C()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  char v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  os_log_type_t v18;
  BOOL v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  uint64_t v26;
  unint64_t v27;
  char v28;
  int v29;
  uint64_t v30;
  unsigned __int8 *v31;
  int v32;
  uint64_t v33;
  unint64_t v34;
  NSObject *v35;
  os_log_type_t v36;
  _BOOL4 v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  _QWORD *v46;
  char v47;
  char v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  unint64_t v57;
  unint64_t v58;
  char isUniquelyReferenced_nonNull_native;
  char v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t *v64;
  uint64_t v65;
  _QWORD *v67;
  uint64_t v68;
  char v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  _QWORD *v74;
  uint64_t v75;
  uint64_t v76;
  char v77;
  void (*v78)(uint64_t, uint64_t);
  char v79;
  uint64_t v80;
  unint64_t v81;
  NSObject *v82;
  os_log_type_t v83;
  _BOOL4 v84;
  unint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  _QWORD *v89;
  char v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  char v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  char v99;
  uint64_t (*v100)(uint64_t, uint64_t, uint64_t);
  uint64_t v101;

  v1 = *(_QWORD *)(v0 + 392);
  if (!v1)
  {
    if (qword_256A55438 != -1)
      swift_once();
    v16 = sub_23B95831C();
    __swift_project_value_buffer(v16, (uint64_t)qword_256A55708);
    swift_bridgeObjectRetain_n();
    v17 = sub_23B958304();
    v18 = sub_23B958550();
    v19 = os_log_type_enabled(v17, v18);
    v20 = *(_QWORD *)(v0 + 368);
    if (v19)
    {
      v21 = *(_QWORD *)(v0 + 360);
      v22 = swift_slowAlloc();
      v23 = swift_slowAlloc();
      v101 = v23;
      *(_DWORD *)v22 = 141558275;
      *(_QWORD *)(v0 + 168) = 1752392040;
      sub_23B9585A4();
      *(_WORD *)(v22 + 12) = 2081;
      swift_bridgeObjectRetain();
      *(_QWORD *)(v0 + 160) = sub_23B9287E0(v21, v20, &v101);
      sub_23B9585A4();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_23B916000, v17, v18, "CorrelationIdentifierMap: No correlationIdentifier for %{private,mask.hash}s!", (uint8_t *)v22, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x242609864](v23, -1, -1);
      MEMORY[0x242609864](v22, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }

    v52 = *(_QWORD *)(v0 + 360);
    v51 = *(_QWORD *)(v0 + 368);
    v53 = *(_QWORD *)(v0 + 336);
    v98 = *(_QWORD *)(v0 + 344);
    v55 = *(_QWORD *)(v0 + 312);
    v54 = *(_QWORD *)(v0 + 320);
    *(_QWORD *)(v0 + 112) = 0;
    *(_QWORD *)(v0 + 120) = 0xE000000000000000;
    v95 = *(_BYTE *)(v0 + 408);
    sub_23B958688();
    swift_bridgeObjectRelease();
    *(_QWORD *)(v0 + 128) = 0xD00000000000001FLL;
    *(_QWORD *)(v0 + 136) = 0x800000023B95AA60;
    swift_bridgeObjectRetain();
    sub_23B958400();
    swift_bridgeObjectRelease();
    sub_23B958400();
    v56 = sub_23B9583C4();
    v58 = v57;
    swift_bridgeObjectRelease();
    *(_QWORD *)(v0 + 144) = v56;
    *(_QWORD *)(v0 + 152) = v58;
    sub_23B9350B0();
    sub_23B9581B4();
    sub_23B92D4DC(v56, v58);
    swift_storeEnumTagMultiPayload();
    sub_23B9338A4(v54, v55);
    swift_bridgeObjectRetain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v101 = v53;
    sub_23B936BF0(v55, v95, v52, v51, isUniquelyReferenced_nonNull_native);
    v9 = v101;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_23B9338A4(v54, v55);
    v60 = swift_isUniquelyReferenced_nonNull_native();
    v101 = v98;
    sub_23B936A7C(v95, v52, v51, v55, v60);
    v49 = v101;
    swift_bridgeObjectRelease();
    sub_23B9337E0(v55);
    v50 = v54;
    goto LABEL_22;
  }
  v3 = *(_QWORD *)(v0 + 360);
  v2 = *(_QWORD *)(v0 + 368);
  v4 = *(_QWORD *)(v0 + 336);
  v6 = *(_QWORD *)(v0 + 312);
  v5 = *(_QWORD **)(v0 + 320);
  v7 = *(_BYTE *)(v0 + 408);
  *v5 = *(_QWORD *)(v0 + 384);
  v5[1] = v1;
  swift_storeEnumTagMultiPayload();
  sub_23B933860((uint64_t)v5, v6);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v8 = swift_isUniquelyReferenced_nonNull_native();
  v101 = v4;
  sub_23B936BF0(v6, v7, v3, v2, v8);
  v9 = v4;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (qword_256A55438 != -1)
    swift_once();
  v10 = sub_23B95831C();
  __swift_project_value_buffer(v10, (uint64_t)qword_256A55708);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  v11 = sub_23B958304();
  v12 = sub_23B958544();
  if (os_log_type_enabled(v11, v12))
  {
    v94 = *(_QWORD *)(v0 + 384);
    v13 = *(_QWORD *)(v0 + 368);
    v92 = *(_QWORD *)(v0 + 360);
    v14 = swift_slowAlloc();
    v15 = swift_slowAlloc();
    v101 = v15;
    *(_DWORD *)v14 = 141558787;
    *(_QWORD *)(v0 + 224) = 1752392040;
    sub_23B9585A4();
    *(_WORD *)(v14 + 12) = 2081;
    swift_bridgeObjectRetain();
    *(_QWORD *)(v0 + 232) = sub_23B9287E0(v92, v13, &v101);
    sub_23B9585A4();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v14 + 22) = 2160;
    *(_QWORD *)(v0 + 240) = 1752392040;
    sub_23B9585A4();
    *(_WORD *)(v14 + 32) = 2081;
    swift_bridgeObjectRetain();
    *(_QWORD *)(v0 + 248) = sub_23B9287E0(v94, v1, &v101);
    sub_23B9585A4();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_23B916000, v11, v12, "CorrelationIdentifierMap: %{private,mask.hash}s -> %{private,mask.hash}s", (uint8_t *)v14, 0x2Au);
    swift_arrayDestroy();
    MEMORY[0x242609864](v15, -1, -1);
    MEMORY[0x242609864](v14, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
  }

  v24 = *(_QWORD *)(v0 + 344);
  v25 = *(_QWORD **)(v0 + 304);
  *v25 = *(_QWORD *)(v0 + 384);
  v25[1] = v1;
  swift_storeEnumTagMultiPayload();
  v26 = *(_QWORD *)(v24 + 16);
  swift_bridgeObjectRetain();
  if (!v26 || (v27 = sub_23B93365C(*(_QWORD *)(v0 + 304)), (v28 & 1) == 0))
  {
    v42 = *(_QWORD *)(v0 + 384);
    v44 = *(_QWORD *)(v0 + 360);
    v43 = *(_QWORD *)(v0 + 368);
    v45 = *(_QWORD *)(v0 + 344);
    v46 = *(_QWORD **)(v0 + 320);
    v47 = *(_BYTE *)(v0 + 408);
    sub_23B9337E0(*(_QWORD *)(v0 + 304));
    *v46 = v42;
    v46[1] = v1;
    swift_storeEnumTagMultiPayload();
    v48 = swift_isUniquelyReferenced_nonNull_native();
    v101 = v45;
    sub_23B936A7C(v47, v44, v43, (uint64_t)v46, v48);
    v49 = v101;
    swift_bridgeObjectRelease();
    v50 = (uint64_t)v46;
LABEL_22:
    sub_23B9337E0(v50);
    goto LABEL_23;
  }
  v97 = v9;
  v29 = *(unsigned __int8 *)(v0 + 408);
  v30 = *(_QWORD *)(v0 + 304);
  v31 = (unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(v0 + 344) + 56) + 24 * v27);
  v32 = *v31;
  v33 = *((_QWORD *)v31 + 1);
  v34 = *((_QWORD *)v31 + 2);
  swift_bridgeObjectRetain();
  sub_23B9337E0(v30);
  if (v32 == v29 && (v33 == *(_QWORD *)(v0 + 360) && v34 == *(_QWORD *)(v0 + 368) || (sub_23B958820() & 1) != 0))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    v35 = sub_23B958304();
    v36 = sub_23B958568();
    v37 = os_log_type_enabled(v35, v36);
    v38 = *(_QWORD *)(v0 + 368);
    if (v37)
    {
      v39 = *(_QWORD *)(v0 + 360);
      v40 = swift_slowAlloc();
      v41 = swift_slowAlloc();
      v101 = v41;
      *(_DWORD *)v40 = 141558275;
      *(_QWORD *)(v40 + 4) = 1752392040;
      *(_WORD *)(v40 + 12) = 2081;
      swift_bridgeObjectRetain();
      *(_QWORD *)(v40 + 14) = sub_23B9287E0(v39, v38, &v101);
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_23B916000, v35, v36, "Duplicate destination: %{private,mask.hash}s", (uint8_t *)v40, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x242609864](v41, -1, -1);
      MEMORY[0x242609864](v40, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }

    v49 = *(_QWORD *)(v0 + 344);
    v9 = v97;
  }
  else
  {
    v75 = *(_QWORD *)(v0 + 360);
    v76 = *(_QWORD *)(v0 + 368);
    v77 = *(_BYTE *)(v0 + 408);
    v78 = *(void (**)(uint64_t, uint64_t))(v0 + 280);
    *(_BYTE *)(v0 + 40) = v32;
    v96 = v33;
    *(_QWORD *)(v0 + 48) = v33;
    *(_QWORD *)(v0 + 56) = v34;
    *(_BYTE *)(v0 + 64) = v77;
    *(_QWORD *)(v0 + 72) = v75;
    *(_QWORD *)(v0 + 80) = v76;
    swift_retain();
    v78(v0 + 40, v0 + 64);
    swift_release();
    v79 = *(_BYTE *)(v0 + 88);
    v80 = *(_QWORD *)(v0 + 96);
    v81 = *(_QWORD *)(v0 + 104);
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v82 = sub_23B958304();
    v83 = sub_23B958568();
    v84 = os_log_type_enabled(v82, v83);
    v85 = *(_QWORD *)(v0 + 368);
    if (v84)
    {
      v91 = *(_QWORD *)(v0 + 360);
      v99 = v79;
      v86 = swift_slowAlloc();
      v93 = swift_slowAlloc();
      v101 = v93;
      *(_DWORD *)v86 = 141559299;
      *(_QWORD *)(v0 + 176) = 1752392040;
      sub_23B9585A4();
      *(_WORD *)(v86 + 12) = 2081;
      swift_bridgeObjectRetain();
      *(_QWORD *)(v0 + 184) = sub_23B9287E0(v96, v34, &v101);
      sub_23B9585A4();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v86 + 22) = 2160;
      *(_QWORD *)(v0 + 192) = 1752392040;
      sub_23B9585A4();
      *(_WORD *)(v86 + 32) = 2081;
      swift_bridgeObjectRetain();
      *(_QWORD *)(v0 + 200) = sub_23B9287E0(v91, v85, &v101);
      sub_23B9585A4();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v86 + 42) = 2160;
      *(_QWORD *)(v0 + 208) = 1752392040;
      sub_23B9585A4();
      *(_WORD *)(v86 + 52) = 2081;
      swift_bridgeObjectRetain();
      *(_QWORD *)(v0 + 216) = sub_23B9287E0(v80, v81, &v101);
      sub_23B9585A4();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_23B916000, v82, v83, "CorrelationIdentifierMap: Disambiguating (%{private,mask.hash}s, %{private,mask.hash}s) to %{private,mask.hash}s", (uint8_t *)v86, 0x3Eu);
      swift_arrayDestroy();
      MEMORY[0x242609864](v93, -1, -1);
      v87 = v86;
      v79 = v99;
      MEMORY[0x242609864](v87, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
    }

    v88 = *(_QWORD *)(v0 + 344);
    v89 = *(_QWORD **)(v0 + 320);
    *v89 = *(_QWORD *)(v0 + 384);
    v89[1] = v1;
    swift_storeEnumTagMultiPayload();
    v90 = swift_isUniquelyReferenced_nonNull_native();
    v101 = v88;
    sub_23B936A7C(v79, v80, v81, (uint64_t)v89, v90);
    v49 = v101;
    swift_bridgeObjectRelease();
    sub_23B9337E0((uint64_t)v89);
    v9 = v97;
  }
LABEL_23:
  v61 = *(_QWORD *)(v0 + 352) + 1;
  if (v61 == *(_QWORD *)(v0 + 328))
  {
    swift_release();
    swift_bridgeObjectRelease();
    v62 = *(_QWORD *)(v0 + 280);
    v63 = *(_QWORD *)(v0 + 288);
    v64 = *(uint64_t **)(v0 + 256);
    v65 = *(_QWORD *)(v0 + 264);
    *v64 = v9;
    v64[1] = v49;
    v64[2] = v62;
    v64[3] = v63;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_retain();
    __swift_destroy_boxed_opaque_existential_0(v65);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_release();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    *(_QWORD *)(v0 + 344) = v49;
    *(_QWORD *)(v0 + 352) = v61;
    *(_QWORD *)(v0 + 336) = v9;
    v67 = *(_QWORD **)(v0 + 264);
    v68 = *(_QWORD *)(v0 + 272) + 24 * v61;
    v69 = *(_BYTE *)(v68 + 32);
    *(_BYTE *)(v0 + 408) = v69;
    v70 = *(_QWORD *)(v68 + 40);
    *(_QWORD *)(v0 + 360) = v70;
    v71 = *(_QWORD *)(v68 + 48);
    *(_QWORD *)(v0 + 368) = v71;
    v72 = v67[3];
    v73 = v67[4];
    __swift_project_boxed_opaque_existential_1(v67, v72);
    *(_BYTE *)(v0 + 16) = v69;
    *(_QWORD *)(v0 + 24) = v70;
    *(_QWORD *)(v0 + 32) = v71;
    v100 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(**(int **)(v73 + 8) + *(_QWORD *)(v73 + 8));
    swift_bridgeObjectRetain();
    v74 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 376) = v74;
    *v74 = v0;
    v74[1] = sub_23B930CD4;
    return v100(v0 + 16, v72, v73);
  }
}

uint64_t sub_23B931A50()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 264);
  swift_release();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_0(v1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

id sub_23B931B14()
{
  _QWORD *v0;
  uint64_t Controller;
  _QWORD *v2;
  id result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;

  Controller = type metadata accessor for QueryController();
  v2 = (_QWORD *)swift_allocObject();
  v0[17] = v2;
  swift_defaultActor_initialize();
  result = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
  if (result)
  {
    v4 = v0[13];
    v5 = v0[14];
    v6 = v0[12];
    v2[14] = result;
    v2[15] = v6;
    v2[16] = v4;
    v0[5] = Controller;
    v0[6] = &protocol witness table for QueryController;
    v0[2] = v2;
    swift_retain();
    v7 = sub_23B9332C4(v5);
    swift_bridgeObjectRelease();
    swift_retain();
    v8 = (_QWORD *)swift_task_alloc();
    v0[18] = v8;
    *v8 = v0;
    v8[1] = sub_23B931C1C;
    return (id)sub_23B930AD8((uint64_t)(v0 + 7), (uint64_t)(v0 + 2), (uint64_t)v7, v0[15], v0[16]);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_23B931C1C()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 152) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

FindMyMessaging::Destination __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> CorrelationIdentifierMap.destination(for:)(Swift::String a1)
{
  uint64_t v1;
  uint64_t v2;
  void *object;
  uint64_t countAndFlagsBits;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  char v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  FindMyMessaging::Destination::DestinationType v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  FindMyMessaging::Destination result;

  object = a1._object;
  countAndFlagsBits = a1._countAndFlagsBits;
  v5 = v1;
  v6 = type metadata accessor for CorrelationIdentifier();
  MEMORY[0x24BDAC7A8](v6);
  v8 = (uint64_t *)((char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  v9 = *(_QWORD *)(v2 + 8);
  *v8 = countAndFlagsBits;
  v8[1] = (uint64_t)object;
  swift_storeEnumTagMultiPayload();
  v10 = *(_QWORD *)(v9 + 16);
  swift_bridgeObjectRetain();
  if (v10 && (v11 = sub_23B93365C((uint64_t)v8), (v12 & 1) != 0))
  {
    v13 = *(_QWORD *)(v9 + 56) + 24 * v11;
    v14 = *(_BYTE *)v13;
    v16 = *(_QWORD *)(v13 + 8);
    v15 = *(_QWORD *)(v13 + 16);
    swift_bridgeObjectRetain();
    v17 = sub_23B9337E0((uint64_t)v8);
    *(_BYTE *)v5 = v14;
    *(_QWORD *)(v5 + 8) = v16;
    *(_QWORD *)(v5 + 16) = v15;
  }
  else
  {
    sub_23B9337E0((uint64_t)v8);
    sub_23B93381C();
    swift_allocError();
    *(_QWORD *)v20 = countAndFlagsBits;
    *(_QWORD *)(v20 + 8) = object;
    *(_QWORD *)(v20 + 16) = 0;
    *(_BYTE *)(v20 + 24) = 0;
    swift_bridgeObjectRetain();
    v17 = swift_willThrow();
  }
  result.destination._object = v19;
  result.destination._countAndFlagsBits = v18;
  result.type = v17;
  return result;
}

Swift::String __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> CorrelationIdentifierMap.correlationIdentifier(for:)(FindMyMessaging::Destination a1)
{
  uint64_t *v1;
  unsigned __int8 *v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  Swift::String result;
  uint64_t v26;
  uint64_t v27;

  v2 = *(unsigned __int8 **)&a1.type;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A55740);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v26 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for CorrelationIdentifier();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = (uint64_t *)((char *)&v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v26 - v11;
  v13 = *v2;
  v15 = *((_QWORD *)v2 + 1);
  v14 = *((_QWORD *)v2 + 2);
  v16 = *v1;
  v17 = *(_QWORD *)(v16 + 16);
  v27 = v13;
  if (!v17)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v7 + 56))(v5, 1, 1, v6);
LABEL_7:
    sub_23B930790((uint64_t)v5, &qword_256A55740);
    sub_23B93381C();
    swift_allocError();
    *(_QWORD *)v21 = v27;
    *(_QWORD *)(v21 + 8) = v15;
    *(_QWORD *)(v21 + 16) = v14;
    *(_BYTE *)(v21 + 24) = 1;
    swift_bridgeObjectRetain();
    v22 = swift_willThrow();
    goto LABEL_11;
  }
  swift_bridgeObjectRetain();
  v18 = sub_23B93350C(v13, v15, v14);
  if ((v19 & 1) != 0)
  {
    sub_23B9338A4(*(_QWORD *)(v16 + 56) + *(_QWORD *)(v7 + 72) * v18, (uint64_t)v5);
    v20 = 0;
  }
  else
  {
    v20 = 1;
  }
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v7 + 56))(v5, v20, 1, v6);
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) == 1)
    goto LABEL_7;
  sub_23B933860((uint64_t)v5, (uint64_t)v12);
  sub_23B9338A4((uint64_t)v12, (uint64_t)v10);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_23B93381C();
    swift_allocError();
    *(_QWORD *)v24 = v27;
    *(_QWORD *)(v24 + 8) = v15;
    *(_QWORD *)(v24 + 16) = v14;
    *(_BYTE *)(v24 + 24) = 1;
    swift_bridgeObjectRetain();
    swift_willThrow();
    sub_23B9337E0((uint64_t)v12);
    v22 = sub_23B9337E0((uint64_t)v10);
  }
  else
  {
    sub_23B9337E0((uint64_t)v12);
    v22 = *v10;
    v23 = (void *)v10[1];
  }
LABEL_11:
  result._object = v23;
  result._countAndFlagsBits = v22;
  return result;
}

uint64_t CorrelationIdentifierMap.map(destinations:)(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  _QWORD *i;
  uint64_t v9;
  uint64_t v10;
  _BYTE v11[8];
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v3 = v2;
  v5 = *v1;
  result = MEMORY[0x24BEE4AF8];
  v14 = MEMORY[0x24BEE4AF8];
  v7 = *(_QWORD *)(a1 + 16);
  if (v7)
  {
    swift_bridgeObjectRetain();
    for (i = (_QWORD *)(a1 + 48); ; i += 3)
    {
      v9 = *(i - 1);
      v10 = *i;
      v11[0] = *((_BYTE *)i - 16);
      v12 = v9;
      v13 = v10;
      swift_bridgeObjectRetain();
      sub_23B9320F4(&v14, (uint64_t)v11, v5);
      if (v3)
        break;
      v3 = 0;
      swift_bridgeObjectRelease();
      if (!--v7)
      {
        swift_bridgeObjectRelease();
        return v14;
      }
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    result = swift_bridgeObjectRelease();
    __break(1u);
  }
  return result;
}

uint64_t sub_23B9320F4(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  unsigned __int8 v17;
  uint64_t v18;
  unint64_t v19;
  char v20;
  uint64_t v21;
  uint64_t *v23;
  unint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  char v28;
  uint64_t v29;
  unint64_t v30;
  NSObject *v31;
  os_log_type_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A55740);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v39 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for CorrelationIdentifier();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v39 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v39 - v14;
  if (!*(_QWORD *)(a3 + 16))
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56))(v8, 1, 1, v9);
    return sub_23B930790((uint64_t)v8, &qword_256A55740);
  }
  v16 = *(_QWORD *)(a2 + 8);
  v17 = *(_BYTE *)a2;
  v18 = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  v40 = v16;
  v19 = sub_23B93350C(v17, v16, v18);
  if ((v20 & 1) != 0)
  {
    sub_23B9338A4(*(_QWORD *)(a3 + 56) + *(_QWORD *)(v10 + 72) * v19, (uint64_t)v8);
    v21 = 0;
  }
  else
  {
    v21 = 1;
  }
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56))(v8, v21, 1, v9);
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) == 1)
    return sub_23B930790((uint64_t)v8, &qword_256A55740);
  v23 = a1;
  v24 = v18;
  v25 = (uint64_t)v8;
  v26 = v15;
  sub_23B933860(v25, (uint64_t)v15);
  v27 = *v23;
  swift_bridgeObjectRetain();
  v28 = sub_23B9395D8((uint64_t)v15, v27);
  swift_bridgeObjectRelease();
  if ((v28 & 1) == 0)
  {
    sub_23B9338A4((uint64_t)v15, (uint64_t)v13);
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v27 = sub_23B928390(0, *(_QWORD *)(v27 + 16) + 1, 1, v27);
    v38 = *(_QWORD *)(v27 + 16);
    v37 = *(_QWORD *)(v27 + 24);
    if (v38 >= v37 >> 1)
      v27 = sub_23B928390(v37 > 1, v38 + 1, 1, v27);
    *(_QWORD *)(v27 + 16) = v38 + 1;
    sub_23B933860((uint64_t)v13, v27+ ((*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80))+ *(_QWORD *)(v10 + 72) * v38);
    *v23 = v27;
    goto LABEL_19;
  }
  if (qword_256A55438 != -1)
    swift_once();
  v29 = sub_23B95831C();
  __swift_project_value_buffer(v29, (uint64_t)qword_256A55708);
  v30 = v24;
  swift_bridgeObjectRetain_n();
  v31 = sub_23B958304();
  v32 = sub_23B958550();
  if (!os_log_type_enabled(v31, v32))
  {
    swift_bridgeObjectRelease_n();

LABEL_19:
    v36 = (uint64_t)v26;
    return sub_23B9337E0(v36);
  }
  v33 = swift_slowAlloc();
  v34 = (uint64_t)v26;
  v35 = swift_slowAlloc();
  v42 = v35;
  *(_DWORD *)v33 = 136315651;
  v41 = sub_23B9287E0(0xD000000000000012, 0x800000023B95AA40, &v42);
  sub_23B9585A4();
  *(_WORD *)(v33 + 12) = 2160;
  v41 = 1752392040;
  sub_23B9585A4();
  *(_WORD *)(v33 + 22) = 2081;
  swift_bridgeObjectRetain();
  v41 = sub_23B9287E0(v40, v30, &v42);
  sub_23B9585A4();
  swift_bridgeObjectRelease_n();
  _os_log_impl(&dword_23B916000, v31, v32, "CorrelationIdentifierMap: Duplicate destination detected during %s: %{private,mask.hash}s", (uint8_t *)v33, 0x20u);
  swift_arrayDestroy();
  MEMORY[0x242609864](v35, -1, -1);
  MEMORY[0x242609864](v33, -1, -1);

  v36 = v34;
  return sub_23B9337E0(v36);
}

uint64_t CorrelationIdentifierMap.map(destinations:)()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  _BYTE v13[8];
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v2 = v1;
  v3 = *v0;
  v4 = swift_bridgeObjectRetain();
  v5 = sub_23B9332C4(v4);
  swift_bridgeObjectRelease();
  v16 = MEMORY[0x24BEE4AF8];
  v6 = v5[2];
  if (v6)
  {
    swift_bridgeObjectRetain();
    v7 = v5 + 6;
    while (1)
    {
      v8 = *(v7 - 1);
      v9 = *v7;
      v13[0] = *((_BYTE *)v7 - 16);
      v14 = v8;
      v15 = v9;
      swift_bridgeObjectRetain();
      sub_23B9320F4(&v16, (uint64_t)v13, v3);
      if (v2)
        break;
      v2 = 0;
      v7 += 3;
      swift_bridgeObjectRelease();
      if (!--v6)
      {
        swift_release_n();
        v10 = v16;
        goto LABEL_7;
      }
    }
    swift_release();
    swift_bridgeObjectRelease();
    result = swift_bridgeObjectRelease();
    __break(1u);
  }
  else
  {
    swift_release();
    v10 = MEMORY[0x24BEE4AF8];
LABEL_7:
    v11 = sub_23B92D76C(v10);
    swift_bridgeObjectRelease();
    return v11;
  }
  return result;
}

_QWORD *CorrelationIdentifierMap.map(correlationIdentifiers:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  unint64_t v10;
  char v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v19;
  uint64_t v20;

  v2 = *(_QWORD *)(a1 + 16);
  if (!v2)
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  v4 = *(_QWORD *)(v1 + 8);
  v5 = *(_QWORD *)(type metadata accessor for CorrelationIdentifier() - 8);
  v6 = a1 + ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));
  swift_bridgeObjectRetain();
  v7 = 0;
  v8 = (_QWORD *)MEMORY[0x24BEE4AF8];
  v20 = v5;
  v19 = v6;
  do
  {
    if (*(_QWORD *)(v4 + 16))
    {
      v10 = sub_23B93365C(v6 + *(_QWORD *)(v5 + 72) * v7);
      if ((v11 & 1) != 0)
      {
        v12 = *(_QWORD *)(v4 + 56) + 24 * v10;
        v13 = *(_BYTE *)v12;
        v15 = *(_QWORD *)(v12 + 8);
        v14 = *(_QWORD *)(v12 + 16);
        swift_bridgeObjectRetain();
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v8 = sub_23B928598(0, v8[2] + 1, 1, v8);
        v17 = v8[2];
        v16 = v8[3];
        if (v17 >= v16 >> 1)
          v8 = sub_23B928598((_QWORD *)(v16 > 1), v17 + 1, 1, v8);
        v8[2] = v17 + 1;
        v9 = &v8[3 * v17];
        *((_BYTE *)v9 + 32) = v13;
        v9[5] = v15;
        v9[6] = v14;
        v5 = v20;
        v6 = v19;
      }
    }
    ++v7;
  }
  while (v2 != v7);
  swift_bridgeObjectRelease();
  return v8;
}

uint64_t CorrelationIdentifierMap.map(correlationIdentifiers:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  size_t v3;
  uint64_t v4;
  uint64_t v5;
  size_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  unint64_t v10;
  char v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  size_t v20;
  uint64_t v21;

  v1 = *(_QWORD *)(v0 + 8);
  v2 = swift_bridgeObjectRetain();
  v3 = sub_23B9333F4(v2);
  swift_bridgeObjectRelease();
  v4 = *(_QWORD *)(v3 + 16);
  if (v4)
  {
    v5 = *(_QWORD *)(type metadata accessor for CorrelationIdentifier() - 8);
    v6 = v3 + ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));
    swift_retain();
    v7 = 0;
    v8 = (_QWORD *)MEMORY[0x24BEE4AF8];
    v20 = v6;
    v21 = v5;
    do
    {
      if (*(_QWORD *)(v1 + 16))
      {
        v10 = sub_23B93365C(v6 + *(_QWORD *)(v5 + 72) * v7);
        if ((v11 & 1) != 0)
        {
          v12 = *(_QWORD *)(v1 + 56) + 24 * v10;
          v13 = *(_BYTE *)v12;
          v15 = *(_QWORD *)(v12 + 8);
          v14 = *(_QWORD *)(v12 + 16);
          swift_bridgeObjectRetain();
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v8 = sub_23B928598(0, v8[2] + 1, 1, v8);
          v17 = v8[2];
          v16 = v8[3];
          if (v17 >= v16 >> 1)
            v8 = sub_23B928598((_QWORD *)(v16 > 1), v17 + 1, 1, v8);
          v8[2] = v17 + 1;
          v9 = &v8[3 * v17];
          *((_BYTE *)v9 + 32) = v13;
          v9[5] = v15;
          v9[6] = v14;
          v5 = v21;
          v6 = v20;
        }
      }
      ++v7;
    }
    while (v4 != v7);
    swift_release_n();
  }
  else
  {
    swift_release();
    v8 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  v18 = sub_23B92D88C((uint64_t)v8);
  swift_bridgeObjectRelease();
  return v18;
}

uint64_t CorrelationIdentifierMap.init(mockLookupHelper:destinations:disambiguate:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;

  v5[14] = a4;
  v5[15] = a5;
  v5[12] = a2;
  v5[13] = a3;
  v5[11] = a1;
  return swift_task_switch();
}

{
  _QWORD *v5;

  v5[19] = a4;
  v5[20] = a5;
  v5[17] = a2;
  v5[18] = a3;
  v5[16] = a1;
  return swift_task_switch();
}

uint64_t sub_23B9329B8()
{
  uint64_t *v0;
  _QWORD *v1;

  sub_23B934774(v0[12], (uint64_t)(v0 + 2));
  swift_retain();
  v1 = (_QWORD *)swift_task_alloc();
  v0[16] = (uint64_t)v1;
  *v1 = v0;
  v1[1] = sub_23B932A3C;
  return sub_23B930AD8((uint64_t)(v0 + 7), (uint64_t)(v0 + 2), v0[13], v0[14], v0[15]);
}

uint64_t sub_23B932A3C()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 136) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23B932AA0()
{
  uint64_t v0;
  _OWORD *v1;
  uint64_t v2;
  __int128 v3;

  v1 = *(_OWORD **)(v0 + 88);
  v2 = *(_QWORD *)(v0 + 96);
  swift_release();
  __swift_destroy_boxed_opaque_existential_0(v2);
  v3 = *(_OWORD *)(v0 + 72);
  *v1 = *(_OWORD *)(v0 + 56);
  v1[1] = v3;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23B932AEC()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 96);
  swift_release();
  __swift_destroy_boxed_opaque_existential_0(v1);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23B932B4C()
{
  uint64_t *v0;
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;

  v1 = v0[18];
  sub_23B934774(v0[17], (uint64_t)(v0 + 2));
  swift_retain();
  sub_23B934774((uint64_t)(v0 + 2), (uint64_t)(v0 + 7));
  v2 = sub_23B9332C4(v1);
  swift_bridgeObjectRelease();
  swift_retain();
  v3 = (_QWORD *)swift_task_alloc();
  v0[21] = (uint64_t)v3;
  *v3 = v0;
  v3[1] = sub_23B932C04;
  return sub_23B930AD8((uint64_t)(v0 + 12), (uint64_t)(v0 + 7), (uint64_t)v2, v0[19], v0[20]);
}

uint64_t sub_23B932C04()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 176) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23B932C68()
{
  uint64_t v0;
  uint64_t v1;
  _OWORD *v2;
  __int128 v4;
  __int128 v5;

  v2 = *(_OWORD **)(v0 + 128);
  v1 = *(_QWORD *)(v0 + 136);
  swift_release();
  __swift_destroy_boxed_opaque_existential_0(v0 + 16);
  v4 = *(_OWORD *)(v0 + 112);
  v5 = *(_OWORD *)(v0 + 96);
  swift_release();
  __swift_destroy_boxed_opaque_existential_0(v1);
  *v2 = v5;
  v2[1] = v4;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23B932CE8()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 136);
  swift_release();
  __swift_destroy_boxed_opaque_existential_0(v0 + 16);
  swift_release();
  __swift_destroy_boxed_opaque_existential_0(v1);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t CorrelationIdentifierMap.description.getter()
{
  _QWORD v1[2];

  sub_23B958688();
  swift_bridgeObjectRelease();
  strcpy((char *)v1, "forwardMap: ");
  type metadata accessor for CorrelationIdentifier();
  sub_23B92F068();
  swift_bridgeObjectRetain();
  sub_23B958358();
  sub_23B958400();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_23B958400();
  sub_23B92F2B8(&qword_256A55618, (uint64_t (*)(uint64_t))type metadata accessor for CorrelationIdentifier, (uint64_t)&protocol conformance descriptor for CorrelationIdentifier);
  swift_bridgeObjectRetain();
  sub_23B958358();
  sub_23B958400();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v1[0];
}

uint64_t CorrelationIdentifier.hash(into:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v9;

  v1 = sub_23B9582F8();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for CorrelationIdentifier();
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23B9338A4(v0, (uint64_t)v7);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    (*(void (**)(char *, char *, uint64_t))(v2 + 32))(v4, v7, v1);
    sub_23B95888C();
    sub_23B92F2B8((unint64_t *)&qword_254309B00, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
    sub_23B9583AC();
    return (*(uint64_t (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  }
  else
  {
    sub_23B95888C();
    sub_23B9583F4();
    return swift_bridgeObjectRelease();
  }
}

uint64_t CorrelationIdentifier.hashValue.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v10;

  v1 = v0;
  v2 = sub_23B9582F8();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for CorrelationIdentifier();
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23B958880();
  sub_23B9338A4(v1, (uint64_t)v8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v5, v8, v2);
    sub_23B95888C();
    sub_23B92F2B8((unint64_t *)&qword_254309B00, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
    sub_23B9583AC();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  else
  {
    sub_23B95888C();
    sub_23B9583F4();
    swift_bridgeObjectRelease();
  }
  return sub_23B9588B0();
}

uint64_t sub_23B933158()
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
  uint64_t v10;

  v1 = v0;
  v2 = sub_23B9582F8();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23B958880();
  sub_23B9338A4(v1, (uint64_t)v8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v6, v8, v2);
    sub_23B95888C();
    sub_23B92F2B8((unint64_t *)&qword_254309B00, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
    sub_23B9583AC();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  }
  else
  {
    sub_23B95888C();
    sub_23B9583F4();
    swift_bridgeObjectRelease();
  }
  return sub_23B9588B0();
}

_QWORD *sub_23B9332C4(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  size_t v4;
  uint64_t v5;
  uint64_t v7;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_256A55468);
  v3 = (_QWORD *)swift_allocObject();
  v4 = _swift_stdlib_malloc_size(v3);
  v3[2] = v1;
  v3[3] = 2 * ((uint64_t)(v4 - 32) / 24);
  v5 = sub_23B93407C((uint64_t)&v7, (uint64_t)(v3 + 4), v1, a1);
  swift_bridgeObjectRetain();
  sub_23B91B314();
  if (v5 != v1)
  {
    __break(1u);
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  return v3;
}

uint64_t type metadata accessor for CorrelationIdentifier()
{
  uint64_t result;

  result = qword_256A557D0;
  if (!qword_256A557D0)
    return swift_getSingletonMetadata();
  return result;
}

size_t sub_23B9333F4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  _QWORD *v6;
  size_t result;
  uint64_t v9;
  uint64_t v10;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return MEMORY[0x24BEE4AF8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_256A55630);
  v3 = *(_QWORD *)(type metadata accessor for CorrelationIdentifier() - 8);
  v4 = *(_QWORD *)(v3 + 72);
  v5 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v6 = (_QWORD *)swift_allocObject();
  result = _swift_stdlib_malloc_size(v6);
  if (v4)
  {
    if (result - v5 != 0x8000000000000000 || v4 != -1)
    {
      v6[2] = v1;
      v6[3] = 2 * ((uint64_t)(result - v5) / v4);
      v9 = sub_23B934288(&v10, (uint64_t)v6 + v5, v1, a1);
      swift_bridgeObjectRetain();
      sub_23B91B314();
      if (v9 == v1)
        return (size_t)v6;
      __break(1u);
      return MEMORY[0x24BEE4AF8];
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

unint64_t sub_23B93350C(unsigned __int8 a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  sub_23B958880();
  sub_23B95888C();
  sub_23B9583F4();
  v6 = sub_23B9588B0();
  return sub_23B933938(a1, a2, a3, v6);
}

unint64_t sub_23B93358C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_23B958880();
  sub_23B9583F4();
  v4 = sub_23B9588B0();
  return sub_23B933A0C(a1, a2, v4);
}

unint64_t sub_23B9335F0(uint64_t a1)
{
  uint64_t v2;

  sub_23B9582F8();
  sub_23B92F2B8((unint64_t *)&qword_254309B00, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
  v2 = sub_23B9583A0();
  return sub_23B933AEC(a1, v2);
}

unint64_t sub_23B93365C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v11;

  v2 = sub_23B9582F8();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for CorrelationIdentifier();
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23B958880();
  sub_23B9338A4(a1, (uint64_t)v8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v5, v8, v2);
    sub_23B95888C();
    sub_23B92F2B8((unint64_t *)&qword_254309B00, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
    sub_23B9583AC();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  else
  {
    sub_23B95888C();
    sub_23B9583F4();
    swift_bridgeObjectRelease();
  }
  v9 = sub_23B9588B0();
  return sub_23B933C2C(a1, v9);
}

uint64_t sub_23B9337E0(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for CorrelationIdentifier();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_23B93381C()
{
  unint64_t result;

  result = qword_256A55738;
  if (!qword_256A55738)
  {
    result = MEMORY[0x2426097B0](&protocol conformance descriptor for CorrelationIdentifierMap.Error, &type metadata for CorrelationIdentifierMap.Error);
    atomic_store(result, (unint64_t *)&qword_256A55738);
  }
  return result;
}

uint64_t sub_23B933860(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for CorrelationIdentifier();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_23B9338A4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for CorrelationIdentifier();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_23B9338E8(uint64_t a1)
{
  uint64_t v2;

  sub_23B95870C();
  v2 = sub_23B9583A0();
  return sub_23B933F54(a1, v2);
}

unint64_t sub_23B933938(unsigned __int8 a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  int v10;
  uint64_t v11;
  uint64_t v12;
  unsigned __int8 *v13;
  BOOL v14;

  v5 = v4 + 64;
  v6 = -1 << *(_BYTE *)(v4 + 32);
  v7 = a4 & ~v6;
  if (((*(_QWORD *)(v4 + 64 + ((v7 >> 3) & 0xFFFFFFFFFFFFF8)) >> v7) & 1) != 0)
  {
    v10 = a1;
    v11 = ~v6;
    v12 = *(_QWORD *)(v4 + 48);
    do
    {
      v13 = (unsigned __int8 *)(v12 + 24 * v7);
      if (*v13 == v10)
      {
        v14 = *((_QWORD *)v13 + 1) == a2 && *((_QWORD *)v13 + 2) == a3;
        if (v14 || (sub_23B958820() & 1) != 0)
          break;
      }
      v7 = (v7 + 1) & v11;
    }
    while (((*(_QWORD *)(v5 + ((v7 >> 3) & 0xFFFFFFFFFFFFF8)) >> v7) & 1) != 0);
  }
  return v7;
}

unint64_t sub_23B933A0C(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_23B958820() & 1) == 0)
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
      while (!v14 && (sub_23B958820() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_23B933AEC(uint64_t a1, uint64_t a2)
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
  v5 = sub_23B9582F8();
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
      sub_23B92F2B8(&qword_256A55810, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA98]);
      v14 = sub_23B9583B8();
      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
      if ((v14 & 1) != 0)
        break;
      v10 = (v10 + 1) & v11;
    }
    while (((*(_QWORD *)(v3 + 64 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0);
  }
  return v10;
}

unint64_t sub_23B933C2C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
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
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  char v25;
  void (*v26)(char *, uint64_t);
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char v33;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;

  v43 = a1;
  v4 = sub_23B9582F8();
  v38 = *(_QWORD *)(v4 - 8);
  v39 = v4;
  MEMORY[0x24BDAC7A8](v4);
  v36 = (char *)&v35 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A55620);
  MEMORY[0x24BDAC7A8](v37);
  v7 = (char *)&v35 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for CorrelationIdentifier();
  v9 = MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v35 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = MEMORY[0x24BDAC7A8](v9);
  v14 = (uint64_t *)((char *)&v35 - v13);
  MEMORY[0x24BDAC7A8](v12);
  v17 = (char *)&v35 - v16;
  v44 = v2;
  v18 = -1 << *(_BYTE *)(v2 + 32);
  v19 = a2 & ~v18;
  v42 = v2 + 64;
  if (((*(_QWORD *)(v2 + 64 + ((v19 >> 3) & 0xFFFFFFFFFFFFF8)) >> v19) & 1) == 0)
    return v19;
  v40 = ~v18;
  v41 = *(_QWORD *)(v15 + 72);
  v20 = v37;
  while (1)
  {
    sub_23B9338A4(*(_QWORD *)(v44 + 48) + v41 * v19, (uint64_t)v17);
    v21 = &v7[*(int *)(v20 + 48)];
    sub_23B9338A4((uint64_t)v17, (uint64_t)v7);
    sub_23B9338A4(v43, (uint64_t)v21);
    if (swift_getEnumCaseMultiPayload() != 1)
      break;
    sub_23B9338A4((uint64_t)v7, (uint64_t)v11);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v22 = v38;
      v23 = v39;
      v24 = v36;
      (*(void (**)(char *, char *, uint64_t))(v38 + 32))(v36, v21, v39);
      v25 = sub_23B9582E0();
      v26 = *(void (**)(char *, uint64_t))(v22 + 8);
      v27 = v24;
      v20 = v37;
      v26(v27, v23);
      v26(v11, v23);
      if ((v25 & 1) != 0)
        goto LABEL_20;
LABEL_16:
      sub_23B9337E0((uint64_t)v7);
      goto LABEL_5;
    }
    (*(void (**)(char *, uint64_t))(v38 + 8))(v11, v39);
LABEL_4:
    sub_23B930790((uint64_t)v7, &qword_256A55620);
LABEL_5:
    sub_23B9337E0((uint64_t)v17);
    v19 = (v19 + 1) & v40;
    if (((*(_QWORD *)(v42 + ((v19 >> 3) & 0xFFFFFFFFFFFFF8)) >> v19) & 1) == 0)
      return v19;
  }
  sub_23B9338A4((uint64_t)v7, (uint64_t)v14);
  v29 = *v14;
  v28 = v14[1];
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    swift_bridgeObjectRelease();
    goto LABEL_4;
  }
  v30 = *(_QWORD *)v21;
  v31 = *((_QWORD *)v21 + 1);
  if (v29 != v30 || v28 != v31)
  {
    v33 = sub_23B958820();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v33 & 1) != 0)
      goto LABEL_20;
    goto LABEL_16;
  }
  swift_bridgeObjectRelease_n();
LABEL_20:
  sub_23B9337E0((uint64_t)v7);
  sub_23B9337E0((uint64_t)v17);
  return v19;
}

unint64_t sub_23B933F54(uint64_t a1, uint64_t a2)
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
  v5 = sub_23B95870C();
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
      v14 = sub_23B9583B8();
      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
      if ((v14 & 1) != 0)
        break;
      v10 = (v10 + 1) & v11;
    }
    while (((*(_QWORD *)(v3 + 64 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0);
  }
  return v10;
}

uint64_t sub_23B93407C(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int64_t v12;
  uint64_t v13;
  int64_t v14;
  unint64_t v15;
  unint64_t v16;
  int64_t v17;
  unint64_t v18;
  int64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v5 = (_QWORD *)result;
  v6 = a4 + 56;
  v7 = -1 << *(_BYTE *)(a4 + 32);
  if (-v7 < 64)
    v8 = ~(-1 << -(char)v7);
  else
    v8 = -1;
  v9 = v8 & *(_QWORD *)(a4 + 56);
  if (!a2)
  {
    v12 = 0;
    v10 = 0;
LABEL_39:
    *v5 = a4;
    v5[1] = v6;
    v5[2] = ~v7;
    v5[3] = v12;
    v5[4] = v9;
    return v10;
  }
  v10 = a3;
  if (!a3)
  {
    v12 = 0;
    goto LABEL_39;
  }
  if (a3 < 0)
    goto LABEL_41;
  v11 = a2;
  v12 = 0;
  v13 = 0;
  v14 = (unint64_t)(63 - v7) >> 6;
  v23 = -1 << *(_BYTE *)(a4 + 32);
  if (!v9)
    goto LABEL_9;
LABEL_8:
  v15 = __clz(__rbit64(v9));
  v9 &= v9 - 1;
  v16 = v15 | (v12 << 6);
  while (1)
  {
    ++v13;
    v20 = *(_QWORD *)(a4 + 48) + 24 * v16;
    v22 = *(_QWORD *)(v20 + 8);
    v21 = *(_QWORD *)(v20 + 16);
    *(_BYTE *)v11 = *(_BYTE *)v20;
    *(_QWORD *)(v11 + 8) = v22;
    *(_QWORD *)(v11 + 16) = v21;
    if (v13 == v10)
    {
      swift_bridgeObjectRetain();
      goto LABEL_38;
    }
    v11 += 24;
    result = swift_bridgeObjectRetain();
    if (v9)
      goto LABEL_8;
LABEL_9:
    v17 = v12 + 1;
    if (__OFADD__(v12, 1))
      break;
    if (v17 >= v14)
      goto LABEL_33;
    v18 = *(_QWORD *)(v6 + 8 * v17);
    if (!v18)
    {
      v12 += 2;
      if (v17 + 1 >= v14)
      {
        v9 = 0;
        v12 = v17;
      }
      else
      {
        v18 = *(_QWORD *)(v6 + 8 * v12);
        if (v18)
          goto LABEL_14;
        v19 = v17 + 2;
        if (v17 + 2 >= v14)
          goto LABEL_33;
        v18 = *(_QWORD *)(v6 + 8 * v19);
        if (v18)
        {
LABEL_17:
          v17 = v19;
          goto LABEL_18;
        }
        v12 = v17 + 3;
        if (v17 + 3 < v14)
        {
          v18 = *(_QWORD *)(v6 + 8 * v12);
          if (v18)
          {
LABEL_14:
            v17 = v12;
            goto LABEL_18;
          }
          v19 = v17 + 4;
          if (v17 + 4 >= v14)
          {
LABEL_33:
            v9 = 0;
            goto LABEL_37;
          }
          v18 = *(_QWORD *)(v6 + 8 * v19);
          if (!v18)
          {
            while (1)
            {
              v17 = v19 + 1;
              if (__OFADD__(v19, 1))
                goto LABEL_42;
              if (v17 >= v14)
              {
                v9 = 0;
                v12 = v14 - 1;
                goto LABEL_37;
              }
              v18 = *(_QWORD *)(v6 + 8 * v17);
              ++v19;
              if (v18)
                goto LABEL_18;
            }
          }
          goto LABEL_17;
        }
        v9 = 0;
        v12 = v17 + 2;
      }
LABEL_37:
      v10 = v13;
LABEL_38:
      v7 = v23;
      goto LABEL_39;
    }
LABEL_18:
    v9 = (v18 - 1) & v18;
    v16 = __clz(__rbit64(v18)) + (v17 << 6);
    v12 = v17;
  }
  __break(1u);
LABEL_41:
  __break(1u);
LABEL_42:
  __break(1u);
  return result;
}

uint64_t sub_23B934288(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t result;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  int64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  int64_t v26;
  unint64_t v27;
  int64_t v28;
  uint64_t v29;
  uint64_t v30;
  int64_t v31;
  uint64_t v32;
  _QWORD *v33;
  int64_t v34;
  uint64_t v35;

  v8 = type metadata accessor for CorrelationIdentifier();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v30 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = MEMORY[0x24BDAC7A8](v10);
  v15 = (char *)&v30 - v14;
  v35 = a4;
  v18 = *(_QWORD *)(a4 + 56);
  v17 = a4 + 56;
  v16 = v18;
  v19 = -1 << *(_BYTE *)(v17 - 24);
  if (-v19 < 64)
    v20 = ~(-1 << -(char)v19);
  else
    v20 = -1;
  v21 = v20 & v16;
  if (!a2)
  {
    v22 = 0;
    a3 = 0;
LABEL_38:
    *a1 = v35;
    a1[1] = v17;
    a1[2] = ~v19;
    a1[3] = v22;
    a1[4] = v21;
    return a3;
  }
  if (!a3)
  {
    v22 = 0;
    goto LABEL_38;
  }
  if (a3 < 0)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  v32 = -1 << *(_BYTE *)(v17 - 24);
  v33 = a1;
  v22 = 0;
  v23 = 0;
  v34 = (unint64_t)(63 - v19) >> 6;
  v31 = v34 - 1;
  if (!v21)
    goto LABEL_9;
LABEL_8:
  v24 = __clz(__rbit64(v21));
  v21 &= v21 - 1;
  v25 = v24 | (v22 << 6);
  while (1)
  {
    ++v23;
    v29 = *(_QWORD *)(v9 + 72);
    sub_23B9338A4(*(_QWORD *)(v35 + 48) + v29 * v25, (uint64_t)v12);
    sub_23B933860((uint64_t)v12, (uint64_t)v15);
    result = sub_23B933860((uint64_t)v15, a2);
    if (v23 == a3)
      goto LABEL_37;
    a2 += v29;
    if (v21)
      goto LABEL_8;
LABEL_9:
    v26 = v22 + 1;
    if (__OFADD__(v22, 1))
    {
      __break(1u);
      goto LABEL_40;
    }
    if (v26 >= v34)
      goto LABEL_32;
    v27 = *(_QWORD *)(v17 + 8 * v26);
    if (!v27)
      break;
LABEL_18:
    v21 = (v27 - 1) & v27;
    v25 = __clz(__rbit64(v27)) + (v26 << 6);
    v22 = v26;
  }
  v22 += 2;
  if (v26 + 1 >= v34)
  {
    v21 = 0;
    v22 = v26;
    goto LABEL_36;
  }
  v27 = *(_QWORD *)(v17 + 8 * v22);
  if (v27)
    goto LABEL_14;
  v28 = v26 + 2;
  if (v26 + 2 >= v34)
    goto LABEL_32;
  v27 = *(_QWORD *)(v17 + 8 * v28);
  if (v27)
    goto LABEL_17;
  v22 = v26 + 3;
  if (v26 + 3 >= v34)
  {
    v21 = 0;
    v22 = v26 + 2;
    goto LABEL_36;
  }
  v27 = *(_QWORD *)(v17 + 8 * v22);
  if (v27)
  {
LABEL_14:
    v26 = v22;
    goto LABEL_18;
  }
  v28 = v26 + 4;
  if (v26 + 4 >= v34)
  {
LABEL_32:
    v21 = 0;
LABEL_36:
    a3 = v23;
LABEL_37:
    v19 = v32;
    a1 = v33;
    goto LABEL_38;
  }
  v27 = *(_QWORD *)(v17 + 8 * v28);
  if (v27)
  {
LABEL_17:
    v26 = v28;
    goto LABEL_18;
  }
  while (1)
  {
    v26 = v28 + 1;
    if (__OFADD__(v28, 1))
      break;
    if (v26 >= v34)
    {
      v21 = 0;
      v22 = v31;
      goto LABEL_36;
    }
    v27 = *(_QWORD *)(v17 + 8 * v26);
    ++v28;
    if (v27)
      goto LABEL_18;
  }
LABEL_41:
  __break(1u);
  return result;
}

uint64_t _s15FindMyMessaging21CorrelationIdentifierO2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  char *v18;
  char v19;
  void (*v20)(char *, uint64_t);
  uint64_t v21;
  uint64_t v22;
  char v24;
  uint64_t v26;

  v4 = sub_23B9582F8();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for CorrelationIdentifier();
  v9 = MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v26 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v13 = (uint64_t *)((char *)&v26 - v12);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A55620);
  v15 = MEMORY[0x24BDAC7A8](v14);
  v17 = (char *)&v26 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = &v17[*(int *)(v15 + 48)];
  sub_23B9338A4(a1, (uint64_t)v17);
  sub_23B9338A4(a2, (uint64_t)v18);
  if (swift_getEnumCaseMultiPayload() != 1)
  {
    sub_23B9338A4((uint64_t)v17, (uint64_t)v13);
    v22 = *v13;
    v21 = v13[1];
    if (swift_getEnumCaseMultiPayload() != 1)
    {
      if (v22 == *(_QWORD *)v18 && v21 == *((_QWORD *)v18 + 1))
      {
        swift_bridgeObjectRelease_n();
      }
      else
      {
        v24 = sub_23B958820();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v24 & 1) == 0)
        {
          sub_23B9337E0((uint64_t)v17);
          goto LABEL_8;
        }
      }
      sub_23B9337E0((uint64_t)v17);
      v19 = 1;
      return v19 & 1;
    }
    swift_bridgeObjectRelease();
LABEL_7:
    sub_23B930790((uint64_t)v17, &qword_256A55620);
LABEL_8:
    v19 = 0;
    return v19 & 1;
  }
  sub_23B9338A4((uint64_t)v17, (uint64_t)v11);
  if (swift_getEnumCaseMultiPayload() != 1)
  {
    (*(void (**)(char *, uint64_t))(v5 + 8))(v11, v4);
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v7, v18, v4);
  v19 = sub_23B9582E0();
  v20 = *(void (**)(char *, uint64_t))(v5 + 8);
  v20(v7, v4);
  v20(v11, v4);
  sub_23B9337E0((uint64_t)v17);
  return v19 & 1;
}

uint64_t sub_23B934774(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_23B9347B8()
{
  return sub_23B92F2B8(&qword_256A55758, (uint64_t (*)(uint64_t))type metadata accessor for CorrelationIdentifier, (uint64_t)&protocol conformance descriptor for CorrelationIdentifier);
}

uint64_t destroy for CorrelationIdentifierMap()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_release();
}

uint64_t initializeWithCopy for CorrelationIdentifierMap(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  v3 = *(_QWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 24) = v3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

_QWORD *assignWithCopy for CorrelationIdentifierMap(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;

  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  swift_retain();
  swift_release();
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

_OWORD *assignWithTake for CorrelationIdentifierMap(_OWORD *a1, _OWORD *a2)
{
  swift_bridgeObjectRelease();
  *a1 = *a2;
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for CorrelationIdentifierMap(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 32))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for CorrelationIdentifierMap(uint64_t result, int a2, int a3)
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
      *(_QWORD *)result = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 32) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for CorrelationIdentifierMap()
{
  return &type metadata for CorrelationIdentifierMap;
}

uint64_t initializeBufferWithCopyOfBuffer for Device(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t sub_23B934A04()
{
  return swift_bridgeObjectRetain();
}

uint64_t destroy for CorrelationIdentifierMap.Error()
{
  return sub_23B934A24();
}

uint64_t sub_23B934A24()
{
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for CorrelationIdentifierMap.Error(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;

  v3 = *a2;
  v4 = a2[1];
  v5 = a2[2];
  v6 = *((_BYTE *)a2 + 24);
  sub_23B934A04();
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_BYTE *)(a1 + 24) = v6;
  return a1;
}

uint64_t assignWithCopy for CorrelationIdentifierMap.Error(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;

  v3 = *a2;
  v4 = a2[1];
  v5 = a2[2];
  v6 = *((_BYTE *)a2 + 24);
  sub_23B934A04();
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_BYTE *)(a1 + 24) = v6;
  sub_23B934A24();
  return a1;
}

__n128 __swift_memcpy25_8(uint64_t a1, uint64_t a2)
{
  __n128 result;

  result = *(__n128 *)a2;
  *(_OWORD *)(a1 + 9) = *(_OWORD *)(a2 + 9);
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for CorrelationIdentifierMap.Error(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  char v4;

  v3 = *(_QWORD *)(a2 + 16);
  v4 = *(_BYTE *)(a2 + 24);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = v3;
  *(_BYTE *)(a1 + 24) = v4;
  sub_23B934A24();
  return a1;
}

uint64_t getEnumTagSinglePayload for CorrelationIdentifierMap.Error(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFF && *(_BYTE *)(a1 + 25))
    return (*(_DWORD *)a1 + 255);
  v3 = *(unsigned __int8 *)(a1 + 24);
  if (v3 <= 1)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for CorrelationIdentifierMap.Error(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_BYTE *)(result + 24) = 0;
    *(_QWORD *)result = a2 - 255;
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 25) = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 25) = 0;
    if (a2)
      *(_BYTE *)(result + 24) = -(char)a2;
  }
  return result;
}

uint64_t sub_23B934BE8(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 24);
}

uint64_t sub_23B934BF0(uint64_t result, char a2)
{
  *(_BYTE *)(result + 24) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for CorrelationIdentifierMap.Error()
{
  return &type metadata for CorrelationIdentifierMap.Error;
}

uint64_t *initializeBufferWithCopyOfBuffer for CorrelationIdentifier(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

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
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v6 = sub_23B9582F8();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
    }
    else
    {
      v8 = a2[1];
      *a1 = *a2;
      a1[1] = v8;
      swift_bridgeObjectRetain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t destroy for CorrelationIdentifier(uint64_t a1)
{
  uint64_t v2;

  if (swift_getEnumCaseMultiPayload() != 1)
    return swift_bridgeObjectRelease();
  v2 = sub_23B9582F8();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
}

_QWORD *initializeWithCopy for CorrelationIdentifier(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;

  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v4 = sub_23B9582F8();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, a2, v4);
  }
  else
  {
    v5 = a2[1];
    *a1 = *a2;
    a1[1] = v5;
    swift_bridgeObjectRetain();
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

_QWORD *assignWithCopy for CorrelationIdentifier(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;

  if (a1 != a2)
  {
    sub_23B9337E0((uint64_t)a1);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v4 = sub_23B9582F8();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, a2, v4);
    }
    else
    {
      *a1 = *a2;
      a1[1] = a2[1];
      swift_bridgeObjectRetain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

void *initializeWithTake for CorrelationIdentifier(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6;

  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v6 = sub_23B9582F8();
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  return a1;
}

void *assignWithTake for CorrelationIdentifier(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6;

  if (a1 != a2)
  {
    sub_23B9337E0((uint64_t)a1);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v6 = sub_23B9582F8();
      (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    }
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for CorrelationIdentifier(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a3 - 8) + 48))();
}

uint64_t storeEnumTagSinglePayload for CorrelationIdentifier(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a4 - 8) + 56))();
}

uint64_t sub_23B934F94()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_23B934FA4()
{
  uint64_t result;
  unint64_t v1;

  result = sub_23B9582F8();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

uint64_t dispatch thunk of CorrelationIdentifierLookup.correlationIdentifier(destination:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v7;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);

  v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(**(int **)(a3 + 8) + *(_QWORD *)(a3 + 8));
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = sub_23B91AF6C;
  return v9(a1, a2, a3);
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_23B9350B0()
{
  unint64_t result;

  result = qword_256A55818;
  if (!qword_256A55818)
  {
    result = MEMORY[0x2426097B0](MEMORY[0x24BDCDDC0], MEMORY[0x24BDCDDE8]);
    atomic_store(result, (unint64_t *)&qword_256A55818);
  }
  return result;
}

uint64_t NullMessageType.init(rawValue:)@<X0>(uint64_t result@<X0>, BOOL *a2@<X8>)
{
  *a2 = (_DWORD)result != 0;
  return result;
}

void *static NullMessageType.allCases.getter()
{
  return &unk_250CA19F0;
}

uint64_t NullMessageType.rawValue.getter()
{
  return 0;
}

uint64_t sub_23B935124()
{
  return 1;
}

unint64_t sub_23B935130()
{
  unint64_t result;

  result = qword_256A55820;
  if (!qword_256A55820)
  {
    result = MEMORY[0x2426097B0](&protocol conformance descriptor for NullMessageType, &type metadata for NullMessageType);
    atomic_store(result, (unint64_t *)&qword_256A55820);
  }
  return result;
}

uint64_t sub_23B935174()
{
  sub_23B958880();
  sub_23B9588A4();
  return sub_23B9588B0();
}

uint64_t sub_23B9351B4()
{
  return sub_23B9588A4();
}

uint64_t sub_23B9351D8()
{
  sub_23B958880();
  sub_23B9588A4();
  return sub_23B9588B0();
}

_DWORD *sub_23B935214@<X0>(_DWORD *result@<X0>, BOOL *a2@<X8>)
{
  *a2 = *result != 0;
  return result;
}

void sub_23B935228(_DWORD *a1@<X8>)
{
  *a1 = 0;
}

unint64_t sub_23B935234()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256A55828;
  if (!qword_256A55828)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256A55830);
    result = MEMORY[0x2426097B0](MEMORY[0x24BEE12E0], v1);
    atomic_store(result, (unint64_t *)&qword_256A55828);
  }
  return result;
}

void sub_23B935280(_QWORD *a1@<X8>)
{
  *a1 = &unk_250CA1A18;
}

unint64_t sub_23B935290(_QWORD *a1)
{
  unint64_t result;

  a1[1] = sub_23B9352C4();
  a1[2] = sub_23B935308();
  result = sub_23B93534C();
  a1[3] = result;
  return result;
}

unint64_t sub_23B9352C4()
{
  unint64_t result;

  result = qword_256A55838;
  if (!qword_256A55838)
  {
    result = MEMORY[0x2426097B0](&protocol conformance descriptor for NullMessageType, &type metadata for NullMessageType);
    atomic_store(result, (unint64_t *)&qword_256A55838);
  }
  return result;
}

unint64_t sub_23B935308()
{
  unint64_t result;

  result = qword_256A55840;
  if (!qword_256A55840)
  {
    result = MEMORY[0x2426097B0](&protocol conformance descriptor for NullMessageType, &type metadata for NullMessageType);
    atomic_store(result, (unint64_t *)&qword_256A55840);
  }
  return result;
}

unint64_t sub_23B93534C()
{
  unint64_t result;

  result = qword_256A55848;
  if (!qword_256A55848)
  {
    result = MEMORY[0x2426097B0](&protocol conformance descriptor for NullMessageType, &type metadata for NullMessageType);
    atomic_store(result, (unint64_t *)&qword_256A55848);
  }
  return result;
}

uint64_t sub_23B935390()
{
  sub_23B93534C();
  return sub_23B95846C();
}

uint64_t sub_23B9353EC()
{
  sub_23B93534C();
  return sub_23B958430();
}

uint64_t getEnumTagSinglePayload for NullMessageType(unsigned int *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for NullMessageType(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_23B9354D0 + 4 * byte_23B9592BC[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_23B9354F0 + 4 * byte_23B9592C1[v4]))();
}

_BYTE *sub_23B9354D0(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_23B9354F0(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23B9354F8(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23B935500(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23B935508(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23B935510(_DWORD *result)
{
  *result = 0;
  return result;
}

uint64_t sub_23B93551C()
{
  return 0;
}

ValueMetadata *type metadata accessor for NullMessageType()
{
  return &type metadata for NullMessageType;
}

BOOL static MessagingCapability.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t MessagingCapability.hash(into:)()
{
  return sub_23B95888C();
}

void *static MessagingCapability.allCases.getter()
{
  return &unk_250CA1A40;
}

uint64_t MessagingCapability.hashValue.getter()
{
  sub_23B958880();
  sub_23B95888C();
  return sub_23B9588B0();
}

BOOL sub_23B9355C0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_23B9355D4()
{
  sub_23B958880();
  sub_23B95888C();
  return sub_23B9588B0();
}

uint64_t sub_23B935618()
{
  return sub_23B95888C();
}

uint64_t sub_23B935640()
{
  sub_23B958880();
  sub_23B95888C();
  return sub_23B9588B0();
}

unint64_t sub_23B935684()
{
  unint64_t result;

  result = qword_256A55850;
  if (!qword_256A55850)
  {
    result = MEMORY[0x2426097B0](&protocol conformance descriptor for MessagingCapability, &type metadata for MessagingCapability);
    atomic_store(result, (unint64_t *)&qword_256A55850);
  }
  return result;
}

unint64_t sub_23B9356CC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256A55858;
  if (!qword_256A55858)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256A55860);
    result = MEMORY[0x2426097B0](MEMORY[0x24BEE12E0], v1);
    atomic_store(result, (unint64_t *)&qword_256A55858);
  }
  return result;
}

void sub_23B935718(_QWORD *a1@<X8>)
{
  *a1 = &unk_250CA1A40;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for Destination.DestinationType(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFB)
    goto LABEL_17;
  if (a2 + 5 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 5) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 5;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 5;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 5;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 6;
  v8 = v6 - 6;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for MessagingCapability(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 5 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 5) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFB)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFA)
    return ((uint64_t (*)(void))((char *)&loc_23B935810 + 4 * byte_23B959435[v4]))();
  *a1 = a2 + 5;
  return ((uint64_t (*)(void))((char *)sub_23B935844 + 4 * asc_23B959430[v4]))();
}

uint64_t sub_23B935844(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23B93584C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23B935854);
  return result;
}

uint64_t sub_23B935860(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23B935868);
  *(_BYTE *)result = a2 + 5;
  return result;
}

uint64_t sub_23B93586C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23B935874(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23B935880(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_23B935888(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for MessagingCapability()
{
  return &type metadata for MessagingCapability;
}

unint64_t MessagingOptions.dictionaryValue.getter()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t inited;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  int *v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char v43;
  unint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char v51;
  unint64_t v52;
  uint64_t v53;
  int64_t v54;
  uint64_t *v55;
  uint64_t *v56;
  uint64_t *v57;
  uint64_t *v58;
  uint64_t *v59;
  uint64_t v60;
  int v61;
  uint64_t v62;
  int64_t v63;
  uint64_t v64;
  int v65;
  unint64_t v67;
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
  _OWORD v78[2];
  __int128 v79;
  uint64_t v80;

  __swift_instantiateConcreteTypeFromMangledName(&qword_254309A30);
  MEMORY[0x24BDAC7A8]();
  v2 = (char *)&v67 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_23B9582F8();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8]();
  v6 = (char *)&v67 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256A55868);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_23B958EB0;
  *(_QWORD *)(inited + 32) = sub_23B9583DC();
  *(_QWORD *)(inited + 40) = v8;
  v9 = MEMORY[0x24BEE1328];
  *(_QWORD *)(inited + 72) = MEMORY[0x24BEE1328];
  *(_BYTE *)(inited + 48) = 1;
  v10 = sub_23B91BB10(inited);
  v11 = sub_23B9583DC();
  v13 = v12;
  v14 = sub_23B9582BC();
  v80 = MEMORY[0x24BDCDDE8];
  *(_QWORD *)&v79 = v14;
  *((_QWORD *)&v79 + 1) = v15;
  sub_23B92DA04(&v79, v78);
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v77 = v10;
  sub_23B93672C(v78, v11, v13, isUniquelyReferenced_nonNull_native);
  v17 = v77;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v68 = type metadata accessor for MessagingOptions();
  v18 = *(int *)(v68 + 24);
  v69 = v0;
  if (*(_BYTE *)(v0 + v18) == 1)
  {
    v19 = sub_23B9583DC();
    v21 = v20;
    v80 = v9;
    LOBYTE(v79) = 1;
    sub_23B92DA04(&v79, v78);
    v22 = swift_isUniquelyReferenced_nonNull_native();
    v77 = v17;
    sub_23B93672C(v78, v19, v21, v22);
    v17 = v77;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  v23 = (int *)v68;
  sub_23B936898(v69 + *(int *)(v68 + 28), (uint64_t)v2);
  v24 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v4 + 48))(v2, 1, v3);
  v25 = MEMORY[0x24BEE0D00];
  if (v24 == 1)
  {
    sub_23B9368E0((uint64_t)v2);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v6, v2, v3);
    v26 = sub_23B9583DC();
    v28 = v27;
    v29 = sub_23B9582D4();
    v80 = v25;
    *(_QWORD *)&v79 = v29;
    *((_QWORD *)&v79 + 1) = v30;
    sub_23B92DA04(&v79, v78);
    v31 = swift_isUniquelyReferenced_nonNull_native();
    v77 = v17;
    sub_23B93672C(v78, v26, v28, v31);
    v17 = v77;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }
  v32 = v69;
  v33 = (uint64_t *)(v69 + v23[8]);
  if ((v33[1] & 1) == 0)
  {
    v34 = *v33;
    v35 = sub_23B9583DC();
    v37 = v36;
    v80 = MEMORY[0x24BEE13C8];
    *(_QWORD *)&v79 = v34;
    sub_23B92DA04(&v79, v78);
    v38 = swift_isUniquelyReferenced_nonNull_native();
    v77 = v17;
    sub_23B93672C(v78, v35, v37, v38);
    v17 = v77;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  v39 = MEMORY[0x24BEE1328];
  if (*(_BYTE *)(v32 + v23[9]) == 1)
  {
    v40 = sub_23B9583DC();
    v42 = v41;
    v80 = v39;
    LOBYTE(v79) = 1;
    sub_23B92DA04(&v79, v78);
    v43 = swift_isUniquelyReferenced_nonNull_native();
    v77 = v17;
    sub_23B93672C(v78, v40, v42, v43);
    v44 = v77;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    v44 = v17;
  }
  v45 = (uint64_t *)(v32 + v23[12]);
  v46 = v45[1];
  if (v46)
  {
    v47 = *v45;
    v48 = sub_23B9583DC();
    v50 = v49;
    v80 = v25;
    *(_QWORD *)&v79 = v47;
    *((_QWORD *)&v79 + 1) = v46;
    sub_23B92DA04(&v79, v78);
    swift_bridgeObjectRetain();
    v51 = swift_isUniquelyReferenced_nonNull_native();
    v77 = v44;
    sub_23B93672C(v78, v48, v50, v51);
    v52 = v77;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    v52 = v44;
  }
  v53 = *(_QWORD *)(v32 + v23[10]);
  v54 = *(_QWORD *)(v53 + 16);
  v55 = (uint64_t *)MEMORY[0x24BE4FDD0];
  v56 = (uint64_t *)MEMORY[0x24BE4FD90];
  v57 = (uint64_t *)MEMORY[0x24BE4FD88];
  v58 = (uint64_t *)MEMORY[0x24BE4FDD8];
  v59 = (uint64_t *)MEMORY[0x24BE4FDC0];
  if (v54)
  {
    v67 = v52;
    *(_QWORD *)&v79 = MEMORY[0x24BEE4AF8];
    swift_bridgeObjectRetain();
    sub_23B928E3C(0, v54, 0);
    v60 = sub_23B937198(v53);
    v76 = v53 + 56;
    v74 = *v55;
    v73 = *v56;
    v72 = *v57;
    v71 = *v58;
    v70 = *MEMORY[0x24BE4FD98];
    v75 = *v59;
    if (v60 < 0 || v60 >= 1 << *(_BYTE *)(v53 + 32))
    {
      __break(1u);
    }
    else if (((*(_QWORD *)(v76 + (((unint64_t)v60 >> 3) & 0xFFFFFFFFFFFFF8)) >> v60) & 1) != 0)
    {
      if (*(_DWORD *)(v53 + 36) == v61)
        __asm { BR              X9 }
      goto LABEL_29;
    }
    __break(1u);
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  v62 = *(_QWORD *)(v32 + v23[11]);
  v63 = *(_QWORD *)(v62 + 16);
  if (v63)
  {
    v67 = v52;
    *(_QWORD *)&v79 = MEMORY[0x24BEE4AF8];
    swift_bridgeObjectRetain();
    sub_23B928E3C(0, v63, 0);
    v64 = sub_23B937198(v62);
    v76 = v62 + 56;
    v74 = *v55;
    v73 = *MEMORY[0x24BE4FD90];
    v72 = *MEMORY[0x24BE4FD88];
    v71 = *v58;
    v70 = *MEMORY[0x24BE4FD98];
    v75 = *v59;
    if ((v64 & 0x8000000000000000) == 0 && v64 < 1 << *(_BYTE *)(v62 + 32))
    {
      if (((*(_QWORD *)(v76 + (((unint64_t)v64 >> 3) & 0xFFFFFFFFFFFFF8)) >> v64) & 1) != 0)
      {
        if (*(_DWORD *)(v62 + 36) == v65)
          __asm { BR              X9 }
LABEL_32:
        __break(1u);
        JUMPOUT(0x23B936270);
      }
LABEL_31:
      __break(1u);
      goto LABEL_32;
    }
LABEL_30:
    __break(1u);
    goto LABEL_31;
  }
  return v52;
}

double MessagingOptions.init(destinations:expectsPeerResponse:responseIdentifier:timeToLive:fireAndForget:requiredCapabilities:lackingCapabilities:queueOneIdentifier:)@<D0>(uint64_t a1@<X0>, char a2@<W1>, uint64_t a3@<X2>, uint64_t a4@<X3>, char a5@<W4>, char a6@<W5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10, uint64_t a11)
{
  int *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  double result;

  v18 = (int *)type metadata accessor for MessagingOptions();
  v19 = a9 + v18[7];
  v20 = sub_23B9582F8();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 56))(v19, 1, 1, v20);
  sub_23B9582EC();
  *(_QWORD *)(a9 + v18[5]) = a1;
  *(_BYTE *)(a9 + v18[6]) = a2;
  sub_23B92F020(a3, v19);
  v21 = a9 + v18[8];
  *(_QWORD *)v21 = a4;
  *(_BYTE *)(v21 + 8) = a5 & 1;
  *(_BYTE *)(a9 + v18[9]) = a6;
  *(_QWORD *)(a9 + v18[10]) = a7;
  *(_QWORD *)(a9 + v18[11]) = a8;
  v22 = (_QWORD *)(a9 + v18[12]);
  *v22 = a10;
  v22[1] = a11;
  sub_23B9368E0(a3);
  result = 3433.05319;
  *(_OWORD *)(a9 + v18[13]) = xmmword_23B958F90;
  return result;
}

uint64_t MessagingOptions.identifier.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_23B9582F8();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v1, v3);
}

uint64_t MessagingOptions.destinations.getter()
{
  type metadata accessor for MessagingOptions();
  return swift_bridgeObjectRetain();
}

uint64_t MessagingOptions.expectsPeerResponse.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for MessagingOptions() + 24));
}

uint64_t MessagingOptions.expectsPeerResponse.setter(char a1)
{
  uint64_t v1;
  uint64_t result;

  result = type metadata accessor for MessagingOptions();
  *(_BYTE *)(v1 + *(int *)(result + 24)) = a1;
  return result;
}

uint64_t (*MessagingOptions.expectsPeerResponse.modify())(_QWORD)
{
  type metadata accessor for MessagingOptions();
  return nullsub_1;
}

uint64_t MessagingOptions.responseIdentifier.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + *(int *)(type metadata accessor for MessagingOptions() + 28);
  return sub_23B936898(v3, a1);
}

uint64_t MessagingOptions.responseIdentifier.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + *(int *)(type metadata accessor for MessagingOptions() + 28);
  return sub_23B93732C(a1, v3);
}

uint64_t (*MessagingOptions.responseIdentifier.modify())(_QWORD)
{
  type metadata accessor for MessagingOptions();
  return nullsub_1;
}

uint64_t MessagingOptions.timeToLive.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + *(int *)(type metadata accessor for MessagingOptions() + 32));
}

uint64_t MessagingOptions.fireAndForget.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for MessagingOptions() + 36));
}

uint64_t MessagingOptions.requiredCapabilities.getter()
{
  type metadata accessor for MessagingOptions();
  return swift_bridgeObjectRetain();
}

uint64_t MessagingOptions.lackingCapabilities.getter()
{
  type metadata accessor for MessagingOptions();
  return swift_bridgeObjectRetain();
}

uint64_t MessagingOptions.queueOneIdentifier.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for MessagingOptions() + 48));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t MessagingOptions.timeout.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + *(int *)(type metadata accessor for MessagingOptions() + 52));
}

uint64_t MessagingOptions.init(destinations:expectsPeerResponse:responseIdentifier:timeToLive:fireAndForget:requiredCapabilities:lackingCapabilities:queueOneIdentifier:timeout:)@<X0>(uint64_t a1@<X0>, char a2@<W1>, uint64_t a3@<X2>, uint64_t a4@<X3>, char a5@<W4>, char a6@<W5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  int *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t result;
  uint64_t v23;
  _QWORD *v24;
  _QWORD *v25;

  v19 = (int *)type metadata accessor for MessagingOptions();
  v20 = a9 + v19[7];
  v21 = sub_23B9582F8();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 56))(v20, 1, 1, v21);
  sub_23B9582EC();
  *(_QWORD *)(a9 + v19[5]) = a1;
  *(_BYTE *)(a9 + v19[6]) = a2;
  result = sub_23B93732C(a3, v20);
  v23 = a9 + v19[8];
  *(_QWORD *)v23 = a4;
  *(_BYTE *)(v23 + 8) = a5 & 1;
  *(_BYTE *)(a9 + v19[9]) = a6;
  *(_QWORD *)(a9 + v19[10]) = a7;
  *(_QWORD *)(a9 + v19[11]) = a8;
  v24 = (_QWORD *)(a9 + v19[12]);
  *v24 = a10;
  v24[1] = a11;
  v25 = (_QWORD *)(a9 + v19[13]);
  *v25 = a12;
  v25[1] = a13;
  return result;
}

_OWORD *sub_23B93672C(_OWORD *a1, uint64_t a2, uint64_t a3, char a4)
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
  v12 = sub_23B93358C(a2, a3);
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
        return sub_23B92DA04(a1, v19);
      }
      goto LABEL_11;
    }
    if (v17 >= v15 && (a4 & 1) == 0)
    {
      sub_23B954D00();
      goto LABEL_7;
    }
    sub_23B953AE4(v15, a4 & 1);
    v21 = sub_23B93358C(a2, a3);
    if ((v16 & 1) == (v22 & 1))
    {
      v12 = v21;
      v18 = *v5;
      if ((v16 & 1) != 0)
        goto LABEL_8;
LABEL_11:
      sub_23B936EBC(v12, a2, a3, a1, v18);
      return (_OWORD *)swift_bridgeObjectRetain();
    }
  }
  result = (_OWORD *)sub_23B958844();
  __break(1u);
  return result;
}

uint64_t type metadata accessor for MessagingOptions()
{
  uint64_t result;

  result = qword_254309A38;
  if (!qword_254309A38)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_23B936898(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254309A30);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_23B9368E0(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_254309A30);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_23B936920(uint64_t a1, uint64_t a2, char a3)
{
  _QWORD *v3;
  _QWORD **v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  _QWORD *v12;
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

  v4 = (_QWORD **)v3;
  v8 = sub_23B9582F8();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8]();
  v11 = (char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = (_QWORD *)*v3;
  v14 = sub_23B9335F0(a2);
  v15 = v12[2];
  v16 = (v13 & 1) == 0;
  v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
    goto LABEL_14;
  }
  v18 = v13;
  v19 = v12[3];
  if (v19 >= v17 && (a3 & 1) != 0)
  {
LABEL_7:
    v20 = *v4;
    if ((v18 & 1) != 0)
    {
LABEL_8:
      v21 = v20[7];
      result = swift_release();
      *(_QWORD *)(v21 + 8 * v14) = a1;
      return result;
    }
    goto LABEL_11;
  }
  if (v19 >= v17 && (a3 & 1) == 0)
  {
    sub_23B954D1C();
    goto LABEL_7;
  }
  sub_23B953B00(v17, a3 & 1);
  v23 = sub_23B9335F0(a2);
  if ((v18 & 1) != (v24 & 1))
  {
LABEL_14:
    result = sub_23B958844();
    __break(1u);
    return result;
  }
  v14 = v23;
  v20 = *v4;
  if ((v18 & 1) != 0)
    goto LABEL_8;
LABEL_11:
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a2, v8);
  return sub_23B936F24(v14, (uint64_t)v11, a1, v20);
}

uint64_t sub_23B936A7C(char a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  _QWORD *v5;
  _QWORD **v6;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  _QWORD *v14;
  char v15;
  unint64_t v16;
  uint64_t v17;
  _BOOL8 v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t result;
  uint64_t v25;
  unint64_t v26;
  char v27;
  uint64_t v28;
  uint64_t v29;

  v6 = (_QWORD **)v5;
  v29 = a3;
  v11 = type metadata accessor for CorrelationIdentifier();
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v28 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = (_QWORD *)*v5;
  v16 = sub_23B93365C(a4);
  v17 = v14[2];
  v18 = (v15 & 1) == 0;
  v19 = v17 + v18;
  if (__OFADD__(v17, v18))
  {
    __break(1u);
    goto LABEL_14;
  }
  v20 = v15;
  v21 = v14[3];
  if (v21 >= v19 && (a5 & 1) != 0)
  {
LABEL_7:
    v22 = *v6;
    if ((v20 & 1) != 0)
    {
LABEL_8:
      v23 = v22[7] + 24 * v16;
      result = swift_bridgeObjectRelease();
      *(_BYTE *)v23 = a1;
      v25 = v29;
      *(_QWORD *)(v23 + 8) = a2;
      *(_QWORD *)(v23 + 16) = v25;
      return result;
    }
    goto LABEL_11;
  }
  if (v21 >= v19 && (a5 & 1) == 0)
  {
    sub_23B954F4C();
    goto LABEL_7;
  }
  sub_23B953E6C(v19, a5 & 1);
  v26 = sub_23B93365C(a4);
  if ((v20 & 1) != (v27 & 1))
  {
LABEL_14:
    result = sub_23B958844();
    __break(1u);
    return result;
  }
  v16 = v26;
  v22 = *v6;
  if ((v20 & 1) != 0)
    goto LABEL_8;
LABEL_11:
  sub_23B9338A4(a4, (uint64_t)v13);
  return sub_23B936FBC(v16, (uint64_t)v13, a1, a2, v29, v22);
}

uint64_t sub_23B936BF0(uint64_t a1, char a2, uint64_t a3, uint64_t a4, char a5)
{
  _QWORD *v5;
  _QWORD **v6;
  _QWORD *v12;
  char v13;
  unint64_t v14;
  uint64_t v15;
  _BOOL8 v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t result;
  unint64_t v24;
  char v25;

  v6 = (_QWORD **)v5;
  v12 = (_QWORD *)*v5;
  v14 = sub_23B93350C(a2, a3, a4);
  v15 = v12[2];
  v16 = (v13 & 1) == 0;
  v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
  }
  else
  {
    v18 = v13;
    v19 = v12[3];
    if (v19 >= v17 && (a5 & 1) != 0)
    {
LABEL_7:
      v20 = *v6;
      if ((v18 & 1) != 0)
      {
LABEL_8:
        v21 = v20[7];
        v22 = v21 + *(_QWORD *)(*(_QWORD *)(type metadata accessor for CorrelationIdentifier() - 8) + 72) * v14;
        return sub_23B937E60(a1, v22);
      }
      goto LABEL_11;
    }
    if (v19 >= v17 && (a5 & 1) == 0)
    {
      sub_23B9551CC();
      goto LABEL_7;
    }
    sub_23B9540F0(v17, a5 & 1);
    v24 = sub_23B93350C(a2, a3, a4);
    if ((v18 & 1) == (v25 & 1))
    {
      v14 = v24;
      v20 = *v6;
      if ((v18 & 1) != 0)
        goto LABEL_8;
LABEL_11:
      sub_23B937068(v14, a2, a3, a4, a1, v20);
      return swift_bridgeObjectRetain();
    }
  }
  result = sub_23B958844();
  __break(1u);
  return result;
}

_OWORD *sub_23B936D40(_OWORD *a1, uint64_t a2, char a3)
{
  _QWORD *v3;
  _QWORD **v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  _QWORD *v12;
  char v13;
  unint64_t v14;
  uint64_t v15;
  _BOOL8 v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  _QWORD *v20;
  _OWORD *v21;
  _OWORD *result;
  unint64_t v23;
  char v24;
  uint64_t v25;

  v4 = (_QWORD **)v3;
  v8 = sub_23B95870C();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = (_QWORD *)*v3;
  v14 = sub_23B9338E8(a2);
  v15 = v12[2];
  v16 = (v13 & 1) == 0;
  v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
  }
  else
  {
    v18 = v13;
    v19 = v12[3];
    if (v19 >= v17 && (a3 & 1) != 0)
    {
LABEL_7:
      v20 = *v4;
      if ((v18 & 1) != 0)
      {
LABEL_8:
        v21 = (_OWORD *)(v20[7] + 32 * v14);
        __swift_destroy_boxed_opaque_existential_0((uint64_t)v21);
        return sub_23B92DA04(a1, v21);
      }
      goto LABEL_11;
    }
    if (v19 >= v17 && (a3 & 1) == 0)
    {
      sub_23B955624();
      goto LABEL_7;
    }
    sub_23B9547BC(v17, a3 & 1);
    v23 = sub_23B9338E8(a2);
    if ((v18 & 1) == (v24 & 1))
    {
      v14 = v23;
      v20 = *v4;
      if ((v18 & 1) != 0)
        goto LABEL_8;
LABEL_11:
      (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a2, v8);
      return sub_23B9370F8(v14, (uint64_t)v11, a1, v20);
    }
  }
  result = (_OWORD *)sub_23B958844();
  __break(1u);
  return result;
}

_OWORD *sub_23B936EBC(unint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4, _QWORD *a5)
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
  result = sub_23B92DA04(a4, (_OWORD *)(a5[7] + 32 * a1));
  v8 = a5[2];
  v9 = __OFADD__(v8, 1);
  v10 = v8 + 1;
  if (v9)
    __break(1u);
  else
    a5[2] = v10;
  return result;
}

uint64_t sub_23B936F24(unint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;

  a4[(a1 >> 6) + 8] |= 1 << a1;
  v8 = a4[6];
  v9 = sub_23B9582F8();
  result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v8 + *(_QWORD *)(*(_QWORD *)(v9 - 8) + 72) * a1, a2, v9);
  *(_QWORD *)(a4[7] + 8 * a1) = a3;
  v11 = a4[2];
  v12 = __OFADD__(v11, 1);
  v13 = v11 + 1;
  if (v12)
    __break(1u);
  else
    a4[2] = v13;
  return result;
}

uint64_t sub_23B936FBC(unint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, _QWORD *a6)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t result;
  uint64_t v15;
  uint64_t v16;
  BOOL v17;
  uint64_t v18;

  a6[(a1 >> 6) + 8] |= 1 << a1;
  v12 = a6[6];
  v13 = type metadata accessor for CorrelationIdentifier();
  result = sub_23B933860(a2, v12 + *(_QWORD *)(*(_QWORD *)(v13 - 8) + 72) * a1);
  v15 = a6[7] + 24 * a1;
  *(_BYTE *)v15 = a3;
  *(_QWORD *)(v15 + 8) = a4;
  *(_QWORD *)(v15 + 16) = a5;
  v16 = a6[2];
  v17 = __OFADD__(v16, 1);
  v18 = v16 + 1;
  if (v17)
    __break(1u);
  else
    a6[2] = v18;
  return result;
}

uint64_t sub_23B937068(unint64_t a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5, _QWORD *a6)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;

  a6[(a1 >> 6) + 8] |= 1 << a1;
  v9 = a6[6] + 24 * a1;
  *(_BYTE *)v9 = a2;
  *(_QWORD *)(v9 + 8) = a3;
  *(_QWORD *)(v9 + 16) = a4;
  v10 = a6[7];
  v11 = type metadata accessor for CorrelationIdentifier();
  result = sub_23B933860(a5, v10 + *(_QWORD *)(*(_QWORD *)(v11 - 8) + 72) * a1);
  v13 = a6[2];
  v14 = __OFADD__(v13, 1);
  v15 = v13 + 1;
  if (v14)
    __break(1u);
  else
    a6[2] = v15;
  return result;
}

_OWORD *sub_23B9370F8(unint64_t a1, uint64_t a2, _OWORD *a3, _QWORD *a4)
{
  uint64_t v8;
  uint64_t v9;
  _OWORD *result;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;

  a4[(a1 >> 6) + 8] |= 1 << a1;
  v8 = a4[6];
  v9 = sub_23B95870C();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v8 + *(_QWORD *)(*(_QWORD *)(v9 - 8) + 72) * a1, a2, v9);
  result = sub_23B92DA04(a3, (_OWORD *)(a4[7] + 32 * a1));
  v11 = a4[2];
  v12 = __OFADD__(v11, 1);
  v13 = v11 + 1;
  if (v12)
    __break(1u);
  else
    a4[2] = v13;
  return result;
}

uint64_t sub_23B937198(uint64_t a1)
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

  v1 = *(_QWORD *)(a1 + 56);
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
  v1 = *(_QWORD *)(a1 + 64);
  if (v1)
  {
    v2 = 64;
    return __clz(__rbit64(v1)) + v2;
  }
  if (v6 < 8)
    return v3;
  v1 = *(_QWORD *)(a1 + 72);
  if (v1)
  {
    v2 = 128;
    return __clz(__rbit64(v1)) + v2;
  }
  v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 3)
    v7 = 3;
  v8 = v7 - 3;
  v9 = (unint64_t *)(a1 + 80);
  v2 = 128;
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

uint64_t sub_23B937238(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t result;

  if ((a3 & 1) != 0)
    return swift_bridgeObjectRelease();
  return result;
}

int64_t sub_23B937248(int64_t result, int a2, char a3, uint64_t a4)
{
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;

  if ((a3 & 1) != 0)
    goto LABEL_20;
  v4 = result;
  if (result < 0 || (result = 1 << *(_BYTE *)(a4 + 32), result <= (uint64_t)v4))
  {
    __break(1u);
    goto LABEL_18;
  }
  v5 = v4 >> 6;
  v6 = a4 + 56;
  v7 = *(_QWORD *)(a4 + 56 + 8 * (v4 >> 6));
  if (((v7 >> v4) & 1) == 0)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  if (*(_DWORD *)(a4 + 36) != a2)
  {
LABEL_19:
    __break(1u);
LABEL_20:
    __break(1u);
    return result;
  }
  v8 = v7 & (-2 << (v4 & 0x3F));
  if (v8)
    return __clz(__rbit64(v8)) | v4 & 0xFFFFFFFFFFFFFFC0;
  v9 = v5 + 1;
  v10 = (unint64_t)(result + 63) >> 6;
  if (v5 + 1 < v10)
  {
    v11 = *(_QWORD *)(v6 + 8 * v9);
    if (v11)
      return __clz(__rbit64(v11)) + (v9 << 6);
    v9 = v5 + 2;
    if (v5 + 2 < v10)
    {
      v11 = *(_QWORD *)(v6 + 8 * v9);
      if (v11)
        return __clz(__rbit64(v11)) + (v9 << 6);
      while (v10 - 3 != v5)
      {
        v11 = *(_QWORD *)(a4 + 80 + 8 * v5++);
        if (v11)
        {
          v9 = v5 + 2;
          return __clz(__rbit64(v11)) + (v9 << 6);
        }
      }
    }
  }
  return result;
}

uint64_t sub_23B93732C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254309A30);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

char *initializeBufferWithCopyOfBuffer for MessagingOptions(char *a1, char *a2, int *a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(char *, char *, uint64_t);
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  unsigned int (*v14)(char *, uint64_t, uint64_t);
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  char *v25;
  uint64_t v26;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v16 = *(_QWORD *)a2;
    *(_QWORD *)a1 = *(_QWORD *)a2;
    a1 = (char *)(v16 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_23B9582F8();
    v8 = *(_QWORD *)(v7 - 8);
    v9 = *(void (**)(char *, char *, uint64_t))(v8 + 16);
    v9(a1, a2, v7);
    v10 = a3[6];
    *(_QWORD *)&a1[a3[5]] = *(_QWORD *)&a2[a3[5]];
    a1[v10] = a2[v10];
    v11 = a3[7];
    v12 = &a1[v11];
    v13 = &a2[v11];
    v14 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48);
    swift_bridgeObjectRetain();
    if (v14(v13, 1, v7))
    {
      v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_254309A30);
      memcpy(v12, v13, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
    }
    else
    {
      v9(v12, v13, v7);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v8 + 56))(v12, 0, 1, v7);
    }
    v17 = a3[8];
    v18 = a3[9];
    v19 = &a1[v17];
    v20 = &a2[v17];
    *(_QWORD *)v19 = *(_QWORD *)v20;
    v19[8] = v20[8];
    a1[v18] = a2[v18];
    v21 = a3[11];
    *(_QWORD *)&a1[a3[10]] = *(_QWORD *)&a2[a3[10]];
    *(_QWORD *)&a1[v21] = *(_QWORD *)&a2[v21];
    v22 = a3[12];
    v23 = a3[13];
    v24 = &a1[v22];
    v25 = &a2[v22];
    v26 = *((_QWORD *)v25 + 1);
    *(_QWORD *)v24 = *(_QWORD *)v25;
    *((_QWORD *)v24 + 1) = v26;
    *(_OWORD *)&a1[v23] = *(_OWORD *)&a2[v23];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t destroy for MessagingOptions(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t);
  uint64_t v7;

  v4 = sub_23B9582F8();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(void (**)(uint64_t, uint64_t))(v5 + 8);
  v6(a1, v4);
  swift_bridgeObjectRelease();
  v7 = a1 + *(int *)(a2 + 28);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(v7, 1, v4))
    v6(v7, v4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

char *initializeWithCopy for MessagingOptions(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  void (*v8)(void *, const void *, uint64_t);
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  unsigned int (*v13)(const void *, uint64_t, uint64_t);
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  char *v23;
  uint64_t v24;

  v6 = sub_23B9582F8();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(void (**)(void *, const void *, uint64_t))(v7 + 16);
  v8(a1, a2, v6);
  v9 = a3[6];
  *(_QWORD *)&a1[a3[5]] = *(_QWORD *)&a2[a3[5]];
  a1[v9] = a2[v9];
  v10 = a3[7];
  v11 = &a1[v10];
  v12 = &a2[v10];
  v13 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v7 + 48);
  swift_bridgeObjectRetain();
  if (v13(v12, 1, v6))
  {
    v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_254309A30);
    memcpy(v11, v12, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
  }
  else
  {
    v8(v11, v12, v6);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(v11, 0, 1, v6);
  }
  v15 = a3[8];
  v16 = a3[9];
  v17 = &a1[v15];
  v18 = &a2[v15];
  *(_QWORD *)v17 = *(_QWORD *)v18;
  v17[8] = v18[8];
  a1[v16] = a2[v16];
  v19 = a3[11];
  *(_QWORD *)&a1[a3[10]] = *(_QWORD *)&a2[a3[10]];
  *(_QWORD *)&a1[v19] = *(_QWORD *)&a2[v19];
  v20 = a3[12];
  v21 = a3[13];
  v22 = &a1[v20];
  v23 = &a2[v20];
  v24 = *((_QWORD *)v23 + 1);
  *(_QWORD *)v22 = *(_QWORD *)v23;
  *((_QWORD *)v22 + 1) = v24;
  *(_OWORD *)&a1[v21] = *(_OWORD *)&a2[v21];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

char *assignWithCopy for MessagingOptions(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  void (*v8)(void *, const void *, uint64_t);
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t (*v12)(const void *, uint64_t, uint64_t);
  int v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  char *v22;
  uint64_t v23;
  char *v24;
  char *v25;

  v6 = sub_23B9582F8();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(void (**)(void *, const void *, uint64_t))(v7 + 24);
  v8(a1, a2, v6);
  *(_QWORD *)&a1[a3[5]] = *(_QWORD *)&a2[a3[5]];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[a3[6]] = a2[a3[6]];
  v9 = a3[7];
  v10 = &a1[v9];
  v11 = &a2[v9];
  v12 = *(uint64_t (**)(const void *, uint64_t, uint64_t))(v7 + 48);
  v13 = v12(&a1[v9], 1, v6);
  v14 = v12(v11, 1, v6);
  if (!v13)
  {
    if (!v14)
    {
      v8(v10, v11, v6);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
    goto LABEL_6;
  }
  if (v14)
  {
LABEL_6:
    v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_254309A30);
    memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v10, v11, v6);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(v10, 0, 1, v6);
LABEL_7:
  v16 = a3[8];
  v17 = &a1[v16];
  v18 = &a2[v16];
  v19 = *(_QWORD *)v18;
  v17[8] = v18[8];
  *(_QWORD *)v17 = v19;
  a1[a3[9]] = a2[a3[9]];
  *(_QWORD *)&a1[a3[10]] = *(_QWORD *)&a2[a3[10]];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)&a1[a3[11]] = *(_QWORD *)&a2[a3[11]];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v20 = a3[12];
  v21 = &a1[v20];
  v22 = &a2[v20];
  *(_QWORD *)v21 = *(_QWORD *)v22;
  *((_QWORD *)v21 + 1) = *((_QWORD *)v22 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v23 = a3[13];
  v24 = &a1[v23];
  v25 = &a2[v23];
  *(_QWORD *)v24 = *(_QWORD *)v25;
  *((_QWORD *)v24 + 1) = *((_QWORD *)v25 + 1);
  return a1;
}

char *initializeWithTake for MessagingOptions(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  void (*v8)(void *, const void *, uint64_t);
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;

  v6 = sub_23B9582F8();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(void (**)(void *, const void *, uint64_t))(v7 + 32);
  v8(a1, a2, v6);
  v9 = a3[6];
  *(_QWORD *)&a1[a3[5]] = *(_QWORD *)&a2[a3[5]];
  a1[v9] = a2[v9];
  v10 = a3[7];
  v11 = &a1[v10];
  v12 = &a2[v10];
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(&a2[v10], 1, v6))
  {
    v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_254309A30);
    memcpy(v11, v12, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
  }
  else
  {
    v8(v11, v12, v6);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(v11, 0, 1, v6);
  }
  v14 = a3[8];
  v15 = a3[9];
  v16 = &a1[v14];
  v17 = &a2[v14];
  *(_QWORD *)v16 = *(_QWORD *)v17;
  v16[8] = v17[8];
  a1[v15] = a2[v15];
  v18 = a3[11];
  *(_QWORD *)&a1[a3[10]] = *(_QWORD *)&a2[a3[10]];
  *(_QWORD *)&a1[v18] = *(_QWORD *)&a2[v18];
  v19 = a3[13];
  *(_OWORD *)&a1[a3[12]] = *(_OWORD *)&a2[a3[12]];
  *(_OWORD *)&a1[v19] = *(_OWORD *)&a2[v19];
  return a1;
}

char *assignWithTake for MessagingOptions(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  void (*v8)(void *, const void *, uint64_t);
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t (*v12)(const void *, uint64_t, uint64_t);
  int v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  char *v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;

  v6 = sub_23B9582F8();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(void (**)(void *, const void *, uint64_t))(v7 + 40);
  v8(a1, a2, v6);
  *(_QWORD *)&a1[a3[5]] = *(_QWORD *)&a2[a3[5]];
  swift_bridgeObjectRelease();
  v9 = a3[7];
  a1[a3[6]] = a2[a3[6]];
  v10 = &a1[v9];
  v11 = &a2[v9];
  v12 = *(uint64_t (**)(const void *, uint64_t, uint64_t))(v7 + 48);
  v13 = v12(&a1[v9], 1, v6);
  v14 = v12(v11, 1, v6);
  if (!v13)
  {
    if (!v14)
    {
      v8(v10, v11, v6);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
    goto LABEL_6;
  }
  if (v14)
  {
LABEL_6:
    v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_254309A30);
    memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v10, v11, v6);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(v10, 0, 1, v6);
LABEL_7:
  v16 = a3[8];
  v17 = a3[9];
  v18 = &a1[v16];
  v19 = &a2[v16];
  *(_QWORD *)v18 = *(_QWORD *)v19;
  v18[8] = v19[8];
  a1[v17] = a2[v17];
  *(_QWORD *)&a1[a3[10]] = *(_QWORD *)&a2[a3[10]];
  swift_bridgeObjectRelease();
  *(_QWORD *)&a1[a3[11]] = *(_QWORD *)&a2[a3[11]];
  swift_bridgeObjectRelease();
  v20 = a3[12];
  v21 = &a1[v20];
  v22 = (uint64_t *)&a2[v20];
  v24 = *v22;
  v23 = v22[1];
  *(_QWORD *)v21 = v24;
  *((_QWORD *)v21 + 1) = v23;
  swift_bridgeObjectRelease();
  *(_OWORD *)&a1[a3[13]] = *(_OWORD *)&a2[a3[13]];
  return a1;
}

uint64_t getEnumTagSinglePayload for MessagingOptions()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23B937BE4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;
  unint64_t v11;

  v6 = sub_23B9582F8();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v6;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    v10 = a1;
    return v9(v10, a2, v8);
  }
  if ((_DWORD)a2 != 0x7FFFFFFF)
  {
    v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_254309A30);
    v10 = a1 + *(int *)(a3 + 28);
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48);
    return v9(v10, a2, v8);
  }
  v11 = *(_QWORD *)(a1 + *(int *)(a3 + 20));
  if (v11 >= 0xFFFFFFFF)
    LODWORD(v11) = -1;
  return (v11 + 1);
}

uint64_t storeEnumTagSinglePayload for MessagingOptions()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23B937C9C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;

  result = sub_23B9582F8();
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = result;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
  }
  else
  {
    if (a3 == 0x7FFFFFFF)
    {
      *(_QWORD *)(a1 + *(int *)(a4 + 20)) = (a2 - 1);
      return result;
    }
    v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_254309A30);
    v12 = a1 + *(int *)(a4 + 28);
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56);
  }
  return v11(v12, a2, a2, v10);
}

void sub_23B937D44()
{
  unint64_t v0;
  unint64_t v1;

  sub_23B9582F8();
  if (v0 <= 0x3F)
  {
    sub_23B937E0C();
    if (v1 <= 0x3F)
      swift_initStructMetadata();
  }
}

void sub_23B937E0C()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_254309B08[0])
  {
    sub_23B9582F8();
    v0 = sub_23B958598();
    if (!v1)
      atomic_store(v0, qword_254309B08);
  }
}

uint64_t sub_23B937E60(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for CorrelationIdentifier();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t Account.uniqueID.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t Account.hash(into:)()
{
  swift_bridgeObjectRetain();
  sub_23B9583F4();
  return swift_bridgeObjectRelease();
}

uint64_t static Account.== infix(_:_:)(_QWORD *a1, _QWORD *a2)
{
  if (*a1 == *a2 && a1[1] == a2[1])
    return 1;
  else
    return sub_23B958820();
}

uint64_t Account.hashValue.getter()
{
  sub_23B958880();
  swift_bridgeObjectRetain();
  sub_23B9583F4();
  swift_bridgeObjectRelease();
  return sub_23B9588B0();
}

uint64_t sub_23B937F9C()
{
  sub_23B958880();
  swift_bridgeObjectRetain();
  sub_23B9583F4();
  swift_bridgeObjectRelease();
  return sub_23B9588B0();
}

uint64_t sub_23B937FF4()
{
  swift_bridgeObjectRetain();
  sub_23B9583F4();
  return swift_bridgeObjectRelease();
}

uint64_t sub_23B938038()
{
  sub_23B958880();
  swift_bridgeObjectRetain();
  sub_23B9583F4();
  swift_bridgeObjectRelease();
  return sub_23B9588B0();
}

unint64_t sub_23B938090()
{
  unint64_t result;

  result = qword_254309CC0;
  if (!qword_254309CC0)
  {
    result = MEMORY[0x2426097B0](&protocol conformance descriptor for Account, &type metadata for Account);
    atomic_store(result, (unint64_t *)&qword_254309CC0);
  }
  return result;
}

uint64_t sub_23B9380D4(_QWORD *a1, _QWORD *a2)
{
  if (*a1 == *a2 && a1[1] == a2[1])
    return 1;
  else
    return sub_23B958820();
}

_QWORD *initializeBufferWithCopyOfBuffer for Account(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for Account()
{
  return swift_bridgeObjectRelease();
}

_QWORD *assignWithCopy for Account(_QWORD *a1, _QWORD *a2)
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

_QWORD *assignWithTake for Account(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for Account(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for Account(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for Account()
{
  return &type metadata for Account;
}

uint64_t Destination.description.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 8);
  swift_bridgeObjectRetain();
  return v1;
}

unsigned __int8 sub_23B938278@<W0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  Swift::String v10;
  unsigned __int8 result;
  char v12;
  uint64_t v13;
  uint64_t v14;

  v4 = *(_QWORD *)(v1 + 8);
  v3 = *(_QWORD *)(v1 + 16);
  if ((*(_BYTE *)v1 & 0xFE) == 2)
  {
    v5 = (void *)sub_23B9583D0();
    v6 = objc_msgSend(v5, sel__stripPotentialTokenURIWithToken_, 0);

    if (v6)
    {
      v7 = sub_23B9583DC();
      v9 = v8;

      v10._countAndFlagsBits = v7;
      v10._object = v9;
      result = Destination.init(stringRepresentation:)(v10);
      if (v14)
      {
        *(_BYTE *)a1 = v12;
        *(_QWORD *)(a1 + 8) = v13;
        *(_QWORD *)(a1 + 16) = v14;
        return result;
      }
    }
    else
    {
      __break(1u);
    }
    swift_bridgeObjectRetain();
    sub_23B958688();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_23B958400();
    swift_bridgeObjectRelease();
    sub_23B958400();
    result = sub_23B958724();
    __break(1u);
  }
  else
  {
    *(_BYTE *)a1 = *(_BYTE *)v1;
    *(_QWORD *)(a1 + 8) = v4;
    *(_QWORD *)(a1 + 16) = v3;
    return swift_bridgeObjectRetain();
  }
  return result;
}

FindMyMessaging::Destination_optional __swiftcall Destination.init(stringRepresentation:)(Swift::String stringRepresentation)
{
  uint64_t *v1;
  void *object;
  uint64_t countAndFlagsBits;
  uint64_t *v4;
  FindMyMessaging::Destination::DestinationType v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  FindMyMessaging::Destination_optional result;

  object = stringRepresentation._object;
  countAndFlagsBits = stringRepresentation._countAndFlagsBits;
  v4 = v1;
  v5 = sub_23B958418();
  if ((v5 & 1) != 0)
  {
    v8 = 0;
  }
  else
  {
    v5 = sub_23B958418();
    if ((v5 & 1) != 0)
    {
      v8 = 1;
    }
    else
    {
      v5 = sub_23B958418();
      if ((v5 & 1) != 0)
      {
        v8 = 2;
      }
      else
      {
        v5 = sub_23B958418();
        if ((v5 & 1) != 0)
        {
          v8 = 3;
        }
        else
        {
          v5 = sub_23B958418();
          if ((v5 & 1) != 0)
          {
            v8 = 4;
          }
          else
          {
            v5 = sub_23B958418();
            if ((v5 & 1) == 0)
            {
              v5 = swift_bridgeObjectRelease();
              *v4 = 0;
              v4[1] = 0;
              v4[2] = 0;
              goto LABEL_15;
            }
            v8 = 5;
          }
        }
      }
    }
  }
  *v4 = v8;
  v4[1] = countAndFlagsBits;
  v4[2] = (uint64_t)object;
LABEL_15:
  result.value.destination._object = v7;
  result.value.destination._countAndFlagsBits = v6;
  result.value.type = v5;
  return result;
}

FindMyMessaging::Destination_optional __swiftcall Destination.init(string:)(Swift::String string)
{
  uint64_t *v1;
  uint64_t *v2;
  char v3;
  void *v4;
  void *v5;
  FindMyMessaging::Destination::DestinationType v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  FindMyMessaging::Destination_optional result;

  v2 = v1;
  sub_23B9387B4();
  v3 = sub_23B9585BC();
  v4 = (void *)sub_23B9583D0();
  swift_bridgeObjectRelease();
  if ((v3 & 1) == 0)
  {
    v5 = (void *)IDSCopyIDForPhoneNumber();

    if (v5)
    {
      v9 = 1;
      goto LABEL_6;
    }
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  v5 = (void *)MEMORY[0x242609414](v4);

  if (!v5)
  {
    __break(1u);
    goto LABEL_8;
  }
  v9 = 0;
LABEL_6:
  v10 = sub_23B9583DC();
  v12 = v11;

  *v2 = v9;
  v2[1] = v10;
  v2[2] = v12;
LABEL_9:
  result.value.destination._object = v8;
  result.value.destination._countAndFlagsBits = v7;
  result.value.type = v6;
  return result;
}

FindMyMessaging::Destination::DestinationType_optional __swiftcall Destination.DestinationType.init(rawValue:)(Swift::Int rawValue)
{
  char *v1;
  char v2;

  v2 = 6;
  if ((unint64_t)rawValue < 6)
    v2 = rawValue;
  *v1 = v2;
  return (FindMyMessaging::Destination::DestinationType_optional)rawValue;
}

uint64_t Destination.DestinationType.rawValue.getter()
{
  unsigned __int8 *v0;

  return *v0;
}

FindMyMessaging::Destination::DestinationType_optional sub_23B938650(Swift::Int *a1)
{
  return Destination.DestinationType.init(rawValue:)(*a1);
}

void sub_23B938658(_QWORD *a1@<X8>)
{
  unsigned __int8 *v1;

  *a1 = *v1;
}

uint64_t sub_23B938664()
{
  sub_23B9394CC();
  return sub_23B958460();
}

uint64_t sub_23B9386C0()
{
  sub_23B9394CC();
  return sub_23B958424();
}

void Destination.type.getter(_BYTE *a1@<X8>)
{
  _BYTE *v1;

  *a1 = *v1;
}

FindMyMessaging::Destination __swiftcall Destination.init(email:)(Swift::String email)
{
  uint64_t v1;
  FindMyMessaging::Destination::DestinationType v2;
  uint64_t v3;
  void *v4;
  FindMyMessaging::Destination result;

  sub_23B938738((uint64_t (*)(void *))MEMORY[0x24BE4F980], 0, v1);
  result.destination._object = v4;
  result.destination._countAndFlagsBits = v3;
  result.type = v2;
  return result;
}

FindMyMessaging::Destination __swiftcall Destination.init(phoneNumber:)(Swift::String phoneNumber)
{
  uint64_t v1;
  FindMyMessaging::Destination::DestinationType v2;
  uint64_t v3;
  void *v4;
  FindMyMessaging::Destination result;

  sub_23B938738((uint64_t (*)(void *))MEMORY[0x24BE4F988], 1, v1);
  result.destination._object = v4;
  result.destination._countAndFlagsBits = v3;
  result.type = v2;
  return result;
}

void sub_23B938738(uint64_t (*a1)(void *)@<X2>, char a2@<W3>, uint64_t a3@<X8>)
{
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6 = (void *)sub_23B9583D0();
  swift_bridgeObjectRelease();
  v7 = (void *)a1(v6);

  if (v7)
  {
    v8 = sub_23B9583DC();
    v10 = v9;

    *(_BYTE *)a3 = a2;
    *(_QWORD *)(a3 + 8) = v8;
    *(_QWORD *)(a3 + 16) = v10;
  }
  else
  {
    __break(1u);
  }
}

unint64_t sub_23B9387B4()
{
  unint64_t result;

  result = qword_256A55878;
  if (!qword_256A55878)
  {
    result = MEMORY[0x2426097B0](MEMORY[0x24BEE0D50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_256A55878);
  }
  return result;
}

uint64_t sub_23B9387F8(char a1)
{
  if ((a1 & 1) != 0)
    return 0x74616E6974736564;
  else
    return 1701869940;
}

BOOL sub_23B938830(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_23B938848()
{
  char *v0;

  return sub_23B9387F8(*v0);
}

uint64_t sub_23B938850@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23B9393E4(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23B938874()
{
  return 0;
}

void sub_23B938880(_BYTE *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_23B93888C()
{
  sub_23B938A18();
  return sub_23B9588D4();
}

uint64_t sub_23B9388B4()
{
  sub_23B938A18();
  return sub_23B9588E0();
}

uint64_t Destination.encode(to:)(_QWORD *a1)
{
  char *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  char v8;
  uint64_t v9;
  _QWORD v11[2];
  char v12;
  char v13;
  char v14;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A55880);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *v1;
  v9 = *((_QWORD *)v1 + 1);
  v11[0] = *((_QWORD *)v1 + 2);
  v11[1] = v9;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23B938A18();
  sub_23B9588C8();
  v14 = v8;
  v13 = 0;
  sub_23B938A5C();
  sub_23B9587C0();
  if (!v2)
  {
    v12 = 1;
    sub_23B9587A8();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

unint64_t sub_23B938A18()
{
  unint64_t result;

  result = qword_256A55888;
  if (!qword_256A55888)
  {
    result = MEMORY[0x2426097B0](&unk_23B959968, &type metadata for Destination.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A55888);
  }
  return result;
}

unint64_t sub_23B938A5C()
{
  unint64_t result;

  result = qword_256A55890;
  if (!qword_256A55890)
  {
    result = MEMORY[0x2426097B0](&protocol conformance descriptor for Destination.DestinationType, &type metadata for Destination.DestinationType);
    atomic_store(result, (unint64_t *)&qword_256A55890);
  }
  return result;
}

uint64_t Destination.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  char v16;
  char v17;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A55898);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23B938A18();
  sub_23B9588BC();
  if (!v2)
  {
    v16 = 0;
    sub_23B938C08();
    sub_23B958790();
    v9 = v17;
    v15 = 1;
    v11 = sub_23B958778();
    v13 = v12;
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *(_BYTE *)a2 = v9;
    *(_QWORD *)(a2 + 8) = v11;
    *(_QWORD *)(a2 + 16) = v13;
  }
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
}

unint64_t sub_23B938C08()
{
  unint64_t result;

  result = qword_256A558A0;
  if (!qword_256A558A0)
  {
    result = MEMORY[0x2426097B0](&protocol conformance descriptor for Destination.DestinationType, &type metadata for Destination.DestinationType);
    atomic_store(result, (unint64_t *)&qword_256A558A0);
  }
  return result;
}

uint64_t sub_23B938C4C@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return Destination.init(from:)(a1, a2);
}

uint64_t sub_23B938C60(_QWORD *a1)
{
  return Destination.encode(to:)(a1);
}

uint64_t sub_23B938C74()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 8);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t Destination.hash(into:)()
{
  sub_23B95888C();
  swift_bridgeObjectRetain();
  sub_23B9583F4();
  return swift_bridgeObjectRelease();
}

uint64_t static Destination.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  if (*a1 != *a2)
    return 0;
  if (*((_QWORD *)a1 + 1) == *((_QWORD *)a2 + 1) && *((_QWORD *)a1 + 2) == *((_QWORD *)a2 + 2))
    return 1;
  else
    return sub_23B958820();
}

uint64_t Destination.hashValue.getter()
{
  sub_23B958880();
  sub_23B95888C();
  sub_23B9583F4();
  return sub_23B9588B0();
}

uint64_t sub_23B938D98()
{
  sub_23B958880();
  sub_23B95888C();
  sub_23B9583F4();
  return sub_23B9588B0();
}

uint64_t sub_23B938DF8()
{
  sub_23B95888C();
  return sub_23B9583F4();
}

uint64_t sub_23B938E38()
{
  sub_23B958880();
  sub_23B95888C();
  sub_23B9583F4();
  return sub_23B9588B0();
}

unint64_t sub_23B938E98()
{
  unint64_t result;

  result = qword_256A558A8;
  if (!qword_256A558A8)
  {
    result = MEMORY[0x2426097B0](&protocol conformance descriptor for Destination.DestinationType, &type metadata for Destination.DestinationType);
    atomic_store(result, (unint64_t *)&qword_256A558A8);
  }
  return result;
}

unint64_t sub_23B938EE0()
{
  unint64_t result;

  result = qword_256A558B0;
  if (!qword_256A558B0)
  {
    result = MEMORY[0x2426097B0](&protocol conformance descriptor for Destination, &type metadata for Destination);
    atomic_store(result, (unint64_t *)&qword_256A558B0);
  }
  return result;
}

uint64_t sub_23B938F24(unsigned __int8 *a1, unsigned __int8 *a2)
{
  if (*a1 != *a2)
    return 0;
  if (*((_QWORD *)a1 + 1) == *((_QWORD *)a2 + 1) && *((_QWORD *)a1 + 2) == *((_QWORD *)a2 + 2))
    return 1;
  else
    return sub_23B958820();
}

uint64_t destroy for Destination()
{
  return swift_bridgeObjectRelease();
}

uint64_t _s15FindMyMessaging11DestinationVwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v3 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for Destination(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for Destination(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v3 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for Destination(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 24))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for Destination(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 24) = 1;
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
    *(_BYTE *)(result + 24) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for Destination()
{
  return &type metadata for Destination;
}

uint64_t storeEnumTagSinglePayload for Destination.DestinationType(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 5 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 5) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFB)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFA)
    return ((uint64_t (*)(void))((char *)&loc_23B939124 + 4 * byte_23B959685[v4]))();
  *a1 = a2 + 5;
  return ((uint64_t (*)(void))((char *)sub_23B939158 + 4 * asc_23B959680[v4]))();
}

uint64_t sub_23B939158(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23B939160(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23B939168);
  return result;
}

uint64_t sub_23B939174(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23B93917CLL);
  *(_BYTE *)result = a2 + 5;
  return result;
}

uint64_t sub_23B939180(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23B939188(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for Destination.DestinationType()
{
  return &type metadata for Destination.DestinationType;
}

uint64_t getEnumTagSinglePayload for Destination.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for Destination.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23B939280 + 4 * byte_23B95968F[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_23B9392B4 + 4 * byte_23B95968A[v4]))();
}

uint64_t sub_23B9392B4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23B9392BC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23B9392C4);
  return result;
}

uint64_t sub_23B9392D0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23B9392D8);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_23B9392DC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23B9392E4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_23B9392F0(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for Destination.CodingKeys()
{
  return &type metadata for Destination.CodingKeys;
}

unint64_t sub_23B939310()
{
  unint64_t result;

  result = qword_256A558B8;
  if (!qword_256A558B8)
  {
    result = MEMORY[0x2426097B0](&unk_23B959940, &type metadata for Destination.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A558B8);
  }
  return result;
}

unint64_t sub_23B939358()
{
  unint64_t result;

  result = qword_256A558C0;
  if (!qword_256A558C0)
  {
    result = MEMORY[0x2426097B0](&unk_23B9598B0, &type metadata for Destination.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A558C0);
  }
  return result;
}

unint64_t sub_23B9393A0()
{
  unint64_t result;

  result = qword_256A558C8;
  if (!qword_256A558C8)
  {
    result = MEMORY[0x2426097B0](&unk_23B9598D8, &type metadata for Destination.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256A558C8);
  }
  return result;
}

uint64_t sub_23B9393E4(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 1701869940 && a2 == 0xE400000000000000;
  if (v3 || (sub_23B958820() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x74616E6974736564 && a2 == 0xEB000000006E6F69)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_23B958820();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

unint64_t sub_23B9394CC()
{
  unint64_t result;

  result = qword_256A558D0;
  if (!qword_256A558D0)
  {
    result = MEMORY[0x2426097B0](&protocol conformance descriptor for Destination.DestinationType, &type metadata for Destination.DestinationType);
    atomic_store(result, (unint64_t *)&qword_256A558D0);
  }
  return result;
}

uint64_t sub_23B939514(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v3;
  uint64_t result;
  _QWORD *v9;
  uint64_t i;
  uint64_t v11;
  BOOL v12;

  v3 = a3[2];
  if (!v3)
    return 0;
  if (a3[4] == a1 && a3[5] == a2)
    return 1;
  result = sub_23B958820();
  if ((result & 1) != 0)
    return 1;
  if (v3 == 1)
    return 0;
  v9 = a3 + 7;
  for (i = 1; ; ++i)
  {
    v11 = i + 1;
    if (__OFADD__(i, 1))
      break;
    v12 = *(v9 - 1) == a1 && *v9 == a2;
    if (v12 || (sub_23B958820() & 1) != 0)
      return 1;
    result = 0;
    v9 += 2;
    if (v11 == v3)
      return result;
  }
  __break(1u);
  return result;
}

uint64_t sub_23B9395D8(uint64_t a1, uint64_t a2)
{
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
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  char v25;
  void (*v26)(char *, uint64_t);
  char *v27;
  char *v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char v35;
  uint64_t v36;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t *v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;

  v47 = a1;
  v3 = sub_23B9582F8();
  v42 = *(_QWORD *)(v3 - 8);
  v43 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v41 = (char *)&v38 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A55620);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v38 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for CorrelationIdentifier();
  v9 = MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v38 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = MEMORY[0x24BDAC7A8](v9);
  v44 = (uint64_t *)((char *)&v38 - v13);
  MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v38 - v15;
  v17 = *(_QWORD *)(a2 + 16);
  if (!v17)
    return 0;
  v18 = a2 + ((*(unsigned __int8 *)(v14 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80));
  v46 = *(_QWORD *)(v14 + 72);
  v38 = a2;
  swift_bridgeObjectRetain();
  v45 = v11;
  v39 = v16;
  v40 = v8;
  while (1)
  {
    sub_23B92F2F8(v18, (uint64_t)v16, (uint64_t (*)(_QWORD))type metadata accessor for CorrelationIdentifier);
    v19 = &v7[*(int *)(v5 + 48)];
    sub_23B92F2F8((uint64_t)v16, (uint64_t)v7, (uint64_t (*)(_QWORD))type metadata accessor for CorrelationIdentifier);
    sub_23B92F2F8(v47, (uint64_t)v19, (uint64_t (*)(_QWORD))type metadata accessor for CorrelationIdentifier);
    if (swift_getEnumCaseMultiPayload() != 1)
      break;
    sub_23B92F2F8((uint64_t)v7, (uint64_t)v11, (uint64_t (*)(_QWORD))type metadata accessor for CorrelationIdentifier);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v20 = v11;
      v21 = v42;
      v22 = v43;
      v23 = v5;
      v24 = v41;
      (*(void (**)(char *, char *, uint64_t))(v42 + 32))(v41, v19, v43);
      v25 = sub_23B9582E0();
      v26 = *(void (**)(char *, uint64_t))(v21 + 8);
      v27 = v24;
      v5 = v23;
      v26(v27, v22);
      v28 = v20;
      v16 = v39;
      v26(v28, v22);
      if ((v25 & 1) != 0)
        goto LABEL_21;
LABEL_16:
      sub_23B92F33C((uint64_t)v7, (uint64_t (*)(_QWORD))type metadata accessor for CorrelationIdentifier);
      v11 = v45;
      goto LABEL_5;
    }
    (*(void (**)(char *, uint64_t))(v42 + 8))(v11, v43);
LABEL_4:
    sub_23B930790((uint64_t)v7, &qword_256A55620);
LABEL_5:
    sub_23B92F33C((uint64_t)v16, (uint64_t (*)(_QWORD))type metadata accessor for CorrelationIdentifier);
    v18 += v46;
    if (!--v17)
    {
      v36 = 0;
      goto LABEL_22;
    }
  }
  v29 = v44;
  sub_23B92F2F8((uint64_t)v7, (uint64_t)v44, (uint64_t (*)(_QWORD))type metadata accessor for CorrelationIdentifier);
  v31 = *v29;
  v30 = v29[1];
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    swift_bridgeObjectRelease();
    v11 = v45;
    goto LABEL_4;
  }
  v32 = *(_QWORD *)v19;
  v33 = *((_QWORD *)v19 + 1);
  if (v31 != v32 || v30 != v33)
  {
    v35 = sub_23B958820();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v35 & 1) != 0)
      goto LABEL_21;
    goto LABEL_16;
  }
  swift_bridgeObjectRelease_n();
LABEL_21:
  sub_23B92F33C((uint64_t)v7, (uint64_t (*)(_QWORD))type metadata accessor for CorrelationIdentifier);
  sub_23B92F33C((uint64_t)v16, (uint64_t (*)(_QWORD))type metadata accessor for CorrelationIdentifier);
  v36 = 1;
LABEL_22:
  swift_bridgeObjectRelease();
  return v36;
}

uint64_t sub_23B939934(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t result;
  int64_t v10;
  unint64_t v11;
  uint64_t v12;
  int64_t v13;
  uint64_t v14;
  int64_t v15;
  int64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  char v20;
  unint64_t v21;
  BOOL v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  uint64_t v26;

  if (*(_QWORD *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_256A559D0);
    v2 = sub_23B95867C();
  }
  else
  {
    v2 = MEMORY[0x24BEE4B08];
  }
  v3 = a1 + 56;
  v4 = -1 << *(_BYTE *)(a1 + 32);
  if (-v4 < 64)
    v5 = ~(-1 << -(char)v4);
  else
    v5 = -1;
  v6 = v5 & *(_QWORD *)(a1 + 56);
  v7 = (unint64_t)(63 - v4) >> 6;
  v8 = v2 + 56;
  swift_bridgeObjectRetain();
  result = swift_retain();
  v10 = 0;
  while (1)
  {
    if (v6)
    {
      v6 &= v6 - 1;
      goto LABEL_28;
    }
    v13 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    if (v13 >= v7)
      goto LABEL_37;
    v14 = *(_QWORD *)(v3 + 8 * v13);
    v15 = v10 + 1;
    if (!v14)
    {
      v15 = v10 + 2;
      if (v10 + 2 >= v7)
        goto LABEL_37;
      v14 = *(_QWORD *)(v3 + 8 * v15);
      if (!v14)
      {
        v15 = v10 + 3;
        if (v10 + 3 >= v7)
          goto LABEL_37;
        v14 = *(_QWORD *)(v3 + 8 * v15);
        if (!v14)
        {
          v15 = v10 + 4;
          if (v10 + 4 >= v7)
            goto LABEL_37;
          v14 = *(_QWORD *)(v3 + 8 * v15);
          if (!v14)
            break;
        }
      }
    }
LABEL_27:
    v6 = (v14 - 1) & v14;
    v10 = v15;
LABEL_28:
    swift_bridgeObjectRetain();
    swift_dynamicCast();
    result = sub_23B958658();
    v17 = -1 << *(_BYTE *)(v2 + 32);
    v18 = result & ~v17;
    v19 = v18 >> 6;
    if (((-1 << v18) & ~*(_QWORD *)(v8 + 8 * (v18 >> 6))) != 0)
    {
      v11 = __clz(__rbit64((-1 << v18) & ~*(_QWORD *)(v8 + 8 * (v18 >> 6)))) | v18 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v20 = 0;
      v21 = (unint64_t)(63 - v17) >> 6;
      do
      {
        if (++v19 == v21 && (v20 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        v22 = v19 == v21;
        if (v19 == v21)
          v19 = 0;
        v20 |= v22;
        v23 = *(_QWORD *)(v8 + 8 * v19);
      }
      while (v23 == -1);
      v11 = __clz(__rbit64(~v23)) + (v19 << 6);
    }
    *(_QWORD *)(v8 + ((v11 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v11;
    v12 = *(_QWORD *)(v2 + 48) + 40 * v11;
    *(_OWORD *)v12 = v24;
    *(_OWORD *)(v12 + 16) = v25;
    *(_QWORD *)(v12 + 32) = v26;
    ++*(_QWORD *)(v2 + 16);
  }
  v16 = v10 + 5;
  if (v10 + 5 >= v7)
  {
LABEL_37:
    swift_release();
    sub_23B91B314();
    return v2;
  }
  v14 = *(_QWORD *)(v3 + 8 * v16);
  if (v14)
  {
    v15 = v10 + 5;
    goto LABEL_27;
  }
  while (1)
  {
    v15 = v16 + 1;
    if (__OFADD__(v16, 1))
      break;
    if (v15 >= v7)
      goto LABEL_37;
    v14 = *(_QWORD *)(v3 + 8 * v15);
    ++v16;
    if (v14)
      goto LABEL_27;
  }
LABEL_39:
  __break(1u);
  return result;
}

uint64_t sub_23B939C24(uint64_t a1)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_256A559C8);
    v2 = sub_23B958754();
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
    sub_23B91B298(*(_QWORD *)(a1 + 56) + 32 * v12, (uint64_t)v40);
    *(_QWORD *)&v39 = v19;
    *((_QWORD *)&v39 + 1) = v18;
    v37[2] = v39;
    v38[0] = v40[0];
    v38[1] = v40[1];
    *(_QWORD *)&v37[0] = v19;
    *((_QWORD *)&v37[0] + 1) = v18;
    swift_bridgeObjectRetain();
    swift_dynamicCast();
    sub_23B92DA04(v38, v32);
    v33 = v29;
    v34 = v30;
    v35 = v31;
    sub_23B92DA04(v32, v36);
    v29 = v33;
    v30 = v34;
    v31 = v35;
    sub_23B92DA04(v36, v37);
    sub_23B92DA04(v37, &v33);
    result = sub_23B958658();
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
    result = (uint64_t)sub_23B92DA04(&v33, (_OWORD *)(*(_QWORD *)(v2 + 56) + 32 * v9));
    ++*(_QWORD *)(v2 + 16);
  }
  v16 = v8 + 5;
  if (v8 + 5 >= v27)
  {
LABEL_37:
    swift_release();
    sub_23B91B314();
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

uint64_t sub_23B939FE8(uint64_t a1)
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
  __int128 v32;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_256A559C8);
    v2 = sub_23B958754();
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
    sub_23B91B298(*(_QWORD *)(a1 + 56) + 32 * v12, (uint64_t)v40);
    *(_QWORD *)&v39 = v19;
    *((_QWORD *)&v39 + 1) = v18;
    v37[2] = v39;
    v38[0] = v40[0];
    v38[1] = v40[1];
    swift_bridgeObjectRetain();
    swift_dynamicCast();
    sub_23B92DA04(v38, v37);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256A555E0);
    swift_dynamicCast();
    v33 = v29;
    v34 = v30;
    v35 = v31;
    sub_23B92DA04(&v32, v36);
    v29 = v33;
    v30 = v34;
    v31 = v35;
    sub_23B92DA04(v36, v37);
    sub_23B92DA04(v37, &v33);
    result = sub_23B958658();
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
    result = (uint64_t)sub_23B92DA04(&v33, (_OWORD *)(*(_QWORD *)(v2 + 56) + 32 * v9));
    ++*(_QWORD *)(v2 + 16);
  }
  v16 = v8 + 5;
  if (v8 + 5 >= v27)
  {
LABEL_37:
    swift_release();
    sub_23B91B314();
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

uint64_t sub_23B93A3DC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = sub_23B95831C();
  __swift_allocate_value_buffer(v0, qword_254309BB8);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_254309BB8);
  if (qword_254309BA8 != -1)
    swift_once();
  v2 = __swift_project_value_buffer(v0, (uint64_t)qword_254309CD8);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 - 8) + 16))(v1, v2, v0);
}

uint64_t sub_23B93A46C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  type metadata accessor for LocalMessaging(255, *(_QWORD *)(v4 + 80), *(_QWORD *)(v4 + 88), a4);
  swift_getMetatypeMetadata();
  return sub_23B9583E8();
}

uint64_t LocalMessaging.serviceName.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 112);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_23B93A4D0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  v3 = *(_QWORD *)(v2 + 160);
  *(_QWORD *)(v2 + 160) = a1;
  *(_QWORD *)(v2 + 168) = a2;
  return sub_23B92D238(v3);
}

uint64_t sub_23B93A4E4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  v3 = *(_QWORD *)(v2 + 176);
  *(_QWORD *)(v2 + 176) = a1;
  *(_QWORD *)(v2 + 184) = a2;
  return sub_23B92D238(v3);
}

uint64_t sub_23B93A4F8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  v3 = *(_QWORD *)(v2 + 192);
  *(_QWORD *)(v2 + 192) = a1;
  *(_QWORD *)(v2 + 200) = a2;
  return sub_23B92D238(v3);
}

uint64_t sub_23B93A50C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  v3 = *(_QWORD *)(v2 + 208);
  *(_QWORD *)(v2 + 208) = a1;
  *(_QWORD *)(v2 + 216) = a2;
  return sub_23B92D238(v3);
}

uint64_t sub_23B93A520(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  v3 = *(_QWORD *)(v2 + 224);
  *(_QWORD *)(v2 + 224) = a1;
  *(_QWORD *)(v2 + 232) = a2;
  return sub_23B92D238(v3);
}

uint64_t sub_23B93A534(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  v3 = *(_QWORD *)(v2 + 240);
  *(_QWORD *)(v2 + 240) = a1;
  *(_QWORD *)(v2 + 248) = a2;
  return sub_23B92D238(v3);
}

uint64_t sub_23B93A560(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  v3 = *(_QWORD *)(v2 + 256);
  *(_QWORD *)(v2 + 256) = a1;
  *(_QWORD *)(v2 + 264) = a2;
  return sub_23B92D238(v3);
}

uint64_t sub_23B93A574()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char v3;
  char v4;
  uint64_t result;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t v10;
  os_log_type_t v11;
  uint8_t *v12;
  uint64_t v13;
  os_log_type_t v14;
  uint8_t *v15;
  uint64_t v16;
  os_log_type_t v17;
  uint8_t *v18;
  _QWORD *v19;
  _BYTE v20[24];
  uint64_t v21;

  sub_23B9581A8();
  if (!v21)
  {
    sub_23B930790((uint64_t)v20, &qword_256A55700);
LABEL_12:
    if (qword_254309BD0 != -1)
      swift_once();
    v6 = sub_23B95831C();
    __swift_project_value_buffer(v6, (uint64_t)qword_254309BB8);
    v7 = sub_23B958304();
    v8 = sub_23B95855C();
    if (os_log_type_enabled(v7, v8))
    {
      v9 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_23B916000, v7, v8, "Missing com.apple.private.ids.registration entitlement!", v9, 2u);
      MEMORY[0x242609864](v9, -1, -1);
    }
    goto LABEL_31;
  }
  if ((swift_dynamicCast() & 1) == 0 || v19 != 1)
    goto LABEL_12;
  sub_23B9581A8();
  if ((swift_dynamicCast() & 1) == 0 || v19 != 1)
  {
    if (qword_254309BD0 != -1)
      swift_once();
    v10 = sub_23B95831C();
    __swift_project_value_buffer(v10, (uint64_t)qword_254309BB8);
    v7 = sub_23B958304();
    v11 = sub_23B95855C();
    if (os_log_type_enabled(v7, v11))
    {
      v12 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_23B916000, v7, v11, "Missing com.apple.private.ids.remotecredentials entitlement!", v12, 2u);
      MEMORY[0x242609864](v12, -1, -1);
    }
    goto LABEL_31;
  }
  sub_23B9581A8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254309C78);
  if ((swift_dynamicCast() & 1) == 0
    || (v2 = *(_QWORD *)(v0 + 112),
        v1 = *(_QWORD *)(v0 + 120),
        v3 = sub_23B939514(v2, v1, v19),
        swift_bridgeObjectRelease(),
        (v3 & 1) == 0))
  {
    if (qword_254309BD0 != -1)
      swift_once();
    v13 = sub_23B95831C();
    __swift_project_value_buffer(v13, (uint64_t)qword_254309BB8);
    v7 = sub_23B958304();
    v14 = sub_23B95855C();
    if (os_log_type_enabled(v7, v14))
    {
      v15 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_23B916000, v7, v14, "Missing com.apple.private.ids.messaging entitlement!", v15, 2u);
      MEMORY[0x242609864](v15, -1, -1);
    }
    goto LABEL_31;
  }
  sub_23B9581A8();
  if ((swift_dynamicCast() & 1) == 0
    || (v4 = sub_23B939514(v2, v1, v19), result = swift_bridgeObjectRelease(), (v4 & 1) == 0))
  {
    if (qword_254309BD0 != -1)
      swift_once();
    v16 = sub_23B95831C();
    __swift_project_value_buffer(v16, (uint64_t)qword_254309BB8);
    v7 = sub_23B958304();
    v17 = sub_23B95855C();
    if (os_log_type_enabled(v7, v17))
    {
      v18 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v18 = 0;
      _os_log_impl(&dword_23B916000, v7, v17, "Missing com.apple.private.ids.messaging.urgent-priority entitlement!", v18, 2u);
      MEMORY[0x242609864](v18, -1, -1);
    }
LABEL_31:

    result = sub_23B958724();
    __break(1u);
  }
  return result;
}

void LocalMessaging.__allocating_init(serviceName:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;

  swift_allocObject();
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_23B91AD0C;
  LocalMessaging.init(serviceName:)(a1, a2);
}

void LocalMessaging.init(serviceName:)(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  _QWORD *v3;
  uint64_t v6;
  uint64_t (*v7)(uint64_t);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;

  v3[3] = v2;
  v3[4] = *v2;
  v6 = *v2;
  swift_defaultActor_initialize();
  v2[17] = 0;
  v2[18] = sub_23B91B97C(MEMORY[0x24BEE4AF8]);
  sub_23B9582F8();
  v7 = (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58];
  v8 = *(_QWORD *)(v6 + 80);
  v3[5] = v8;
  v9 = *(_QWORD *)(v6 + 88);
  v3[6] = v9;
  type metadata accessor for Message(255, v8, v9, v10);
  type metadata accessor for MessageContext();
  swift_getTupleTypeMetadata2();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254309C90);
  sub_23B958190();
  swift_getTupleTypeMetadata2();
  sub_23B9584A8();
  sub_23B92F2B8((unint64_t *)&qword_254309B00, v7, MEMORY[0x24BDCEA88]);
  v2[19] = sub_23B958364();
  *((_OWORD *)v2 + 10) = 0u;
  *((_OWORD *)v2 + 11) = 0u;
  *((_OWORD *)v2 + 12) = 0u;
  *((_OWORD *)v2 + 13) = 0u;
  *((_OWORD *)v2 + 14) = 0u;
  *((_OWORD *)v2 + 15) = 0u;
  *((_OWORD *)v2 + 16) = 0u;
  v2[14] = a1;
  v2[15] = a2;
  v11 = objc_allocWithZone(MEMORY[0x24BE4FCB8]);
  swift_bridgeObjectRetain();
  v12 = (void *)sub_23B9583D0();
  swift_bridgeObjectRelease();
  v13 = objc_msgSend(v11, sel_initWithService_, v12);

  if (v13)
  {
    v2[16] = (uint64_t)v13;
    swift_task_switch();
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_23B93ACEC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  objc_class *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  id v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v21;

  v1 = *(_QWORD *)(v0 + 24);
  v3 = *(_QWORD *)(v0 + 40);
  v2 = *(_QWORD *)(v0 + 48);
  v4 = (objc_class *)type metadata accessor for MessagingDelegateTrampoline();
  v6 = type metadata accessor for LocalMessaging(0, v3, v2, v5);
  v7 = swift_retain();
  v8 = sub_23B955F64(v7, v4, v6, (uint64_t)&off_250CA2698);
  swift_release();
  v9 = *(void **)(v1 + 136);
  *(_QWORD *)(v1 + 136) = v8;

  sub_23B93A574();
  if (qword_254309BD0 != -1)
    swift_once();
  v10 = sub_23B95831C();
  __swift_project_value_buffer(v10, (uint64_t)qword_254309BB8);
  v11 = sub_23B958304();
  v12 = sub_23B958568();
  if (os_log_type_enabled(v11, v12))
  {
    v13 = (uint8_t *)swift_slowAlloc();
    v14 = swift_slowAlloc();
    v21 = v14;
    *(_DWORD *)v13 = 136446210;
    v18 = sub_23B93A46C(v14, v15, v16, v17);
    *(_QWORD *)(v0 + 16) = sub_23B9287E0(v18, v19, &v21);
    sub_23B9585A4();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23B916000, v11, v12, "%{public}s: created.", v13, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x242609864](v14, -1, -1);
    MEMORY[0x242609864](v13, -1, -1);
  }

  return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(_QWORD *)(v0 + 24));
}

void sub_23B93AED0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  unint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  os_log_type_t v20;
  uint8_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;

  v1 = v0;
  v2 = sub_23B958328();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v28 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE4FE68]), sel_init);
  v7 = *(void **)(v0 + 128);
  v8 = *(void **)(v0 + 136);
  sub_23B92D0DC(0, (unint64_t *)&qword_254309858);
  (*(void (**)(char *, _QWORD, uint64_t))(v3 + 104))(v5, *MEMORY[0x24BEE5490], v2);
  v9 = v6;
  v10 = v8;
  v11 = (void *)sub_23B958574();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  objc_msgSend(v7, sel_addDelegate_withDelegateProperties_queue_, v10, v9, v11);

  v12 = objc_msgSend(v7, sel_devices);
  if (v12)
  {
    v13 = v12;
    sub_23B92D0DC(0, &qword_254309860);
    v14 = sub_23B958484();

    v15 = *(void **)(v1 + 136);
    if (v15)
    {
      v16 = v15;
      v17 = sub_23B91B620(v14);
      swift_bridgeObjectRelease();
      sub_23B94C5C8(v7, v17);

    }
    swift_bridgeObjectRelease();
  }
  if (qword_254309BD0 != -1)
    swift_once();
  v18 = sub_23B95831C();
  __swift_project_value_buffer(v18, (uint64_t)qword_254309BB8);
  v19 = sub_23B958304();
  v20 = sub_23B958568();
  if (os_log_type_enabled(v19, v20))
  {
    v21 = (uint8_t *)swift_slowAlloc();
    v22 = swift_slowAlloc();
    v29 = v22;
    *(_DWORD *)v21 = 136446210;
    v26 = sub_23B93A46C(v22, v23, v24, v25);
    v28 = sub_23B9287E0(v26, v27, &v29);
    sub_23B9585A4();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23B916000, v19, v20, "%{public}s: started.", v21, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x242609864](v22, -1, -1);
    MEMORY[0x242609864](v21, -1, -1);

  }
  else
  {

  }
}

void sub_23B93B1D0()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int64_t v8;
  int64_t v9;
  uint64_t v10;
  void *v11;
  int64_t v12;
  uint64_t v13;
  int64_t v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t);
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int64_t v23;
  int64_t v24;
  uint64_t v25;
  void *v26;
  int64_t v27;
  uint64_t v28;
  int64_t v29;
  uint64_t v30;
  NSObject *v31;
  os_log_type_t v32;
  uint8_t *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  _QWORD *v41;
  uint64_t v42[13];

  v40 = *v0;
  swift_beginAccess();
  v41 = v0;
  v1 = v0[18];
  v4 = *(_QWORD *)(v1 + 64);
  v3 = v1 + 64;
  v2 = v4;
  v5 = 1 << *(_BYTE *)(v0[18] + 32);
  v6 = -1;
  if (v5 < 64)
    v6 = ~(-1 << v5);
  v7 = v6 & v2;
  v8 = (unint64_t)(v5 + 63) >> 6;
  swift_bridgeObjectRetain();
  v9 = 0;
  v10 = MEMORY[0x24BEE6848];
  while (1)
  {
    if (v7)
    {
      v7 &= v7 - 1;
      goto LABEL_5;
    }
    v12 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
LABEL_48:
      __break(1u);
LABEL_49:
      __break(1u);
      goto LABEL_50;
    }
    if (v12 >= v8)
      goto LABEL_23;
    v13 = *(_QWORD *)(v3 + 8 * v12);
    ++v9;
    if (!v13)
    {
      v9 = v12 + 1;
      if (v12 + 1 >= v8)
        goto LABEL_23;
      v13 = *(_QWORD *)(v3 + 8 * v9);
      if (!v13)
      {
        v9 = v12 + 2;
        if (v12 + 2 >= v8)
          goto LABEL_23;
        v13 = *(_QWORD *)(v3 + 8 * v9);
        if (!v13)
        {
          v9 = v12 + 3;
          if (v12 + 3 >= v8)
            goto LABEL_23;
          v13 = *(_QWORD *)(v3 + 8 * v9);
          if (!v13)
            break;
        }
      }
    }
LABEL_22:
    v7 = (v13 - 1) & v13;
LABEL_5:
    sub_23B9584D8();
    sub_23B92F2B8(&qword_256A55500, (uint64_t (*)(uint64_t))MEMORY[0x24BEE6838], v10);
    v11 = (void *)swift_allocError();
    swift_retain();
    sub_23B958334();
    v42[9] = (uint64_t)v11;
    sub_23B958178();
    swift_release();

  }
  v14 = v12 + 4;
  if (v14 >= v8)
  {
LABEL_23:
    swift_release();
    swift_beginAccess();
    v0[18] = MEMORY[0x24BEE4B00];
    swift_bridgeObjectRelease();
    swift_beginAccess();
    v15 = v0[19];
    sub_23B9582F8();
    v16 = (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58];
    type metadata accessor for Message(255, *(_QWORD *)(v40 + 80), *(_QWORD *)(v40 + 88), v17);
    type metadata accessor for MessageContext();
    swift_getTupleTypeMetadata2();
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254309C90);
    sub_23B958190();
    sub_23B92F2B8((unint64_t *)&qword_254309B00, v16, MEMORY[0x24BDCEA88]);
    v18 = nullsub_1(v15);
    v19 = v18 + 64;
    v20 = 1 << *(_BYTE *)(v18 + 32);
    v21 = -1;
    if (v20 < 64)
      v21 = ~(-1 << v20);
    v22 = v21 & *(_QWORD *)(v18 + 64);
    v23 = (unint64_t)(v20 + 63) >> 6;
    swift_bridgeObjectRetain();
    v24 = 0;
    v25 = MEMORY[0x24BEE6848];
    while (1)
    {
      if (v22)
      {
        v22 &= v22 - 1;
      }
      else
      {
        v27 = v24 + 1;
        if (__OFADD__(v24, 1))
          goto LABEL_48;
        if (v27 >= v23)
        {
LABEL_43:
          swift_release();
          swift_beginAccess();
          sub_23B95837C();
          sub_23B958370();
          swift_endAccess();
          objc_msgSend((id)v41[16], sel_removeDelegate_, v41[17]);
          if (qword_254309BD0 != -1)
            goto LABEL_51;
          goto LABEL_44;
        }
        v28 = *(_QWORD *)(v19 + 8 * v27);
        ++v24;
        if (!v28)
        {
          v24 = v27 + 1;
          if (v27 + 1 >= v23)
            goto LABEL_43;
          v28 = *(_QWORD *)(v19 + 8 * v24);
          if (!v28)
          {
            v24 = v27 + 2;
            if (v27 + 2 >= v23)
              goto LABEL_43;
            v28 = *(_QWORD *)(v19 + 8 * v24);
            if (!v28)
            {
              v29 = v27 + 3;
              if (v29 >= v23)
                goto LABEL_43;
              v28 = *(_QWORD *)(v19 + 8 * v29);
              if (!v28)
              {
                while (1)
                {
                  v24 = v29 + 1;
                  if (__OFADD__(v29, 1))
                    goto LABEL_49;
                  if (v24 >= v23)
                    goto LABEL_43;
                  v28 = *(_QWORD *)(v19 + 8 * v24);
                  ++v29;
                  if (v28)
                    goto LABEL_42;
                }
              }
              v24 = v29;
            }
          }
        }
LABEL_42:
        v22 = (v28 - 1) & v28;
      }
      sub_23B9584D8();
      sub_23B92F2B8(&qword_256A55500, (uint64_t (*)(uint64_t))MEMORY[0x24BEE6838], v25);
      v26 = (void *)swift_allocError();
      swift_retain();
      sub_23B958334();
      v42[0] = (uint64_t)v26;
      sub_23B958178();
      swift_release();

    }
  }
  v13 = *(_QWORD *)(v3 + 8 * v14);
  if (v13)
  {
    v9 = v14;
    goto LABEL_22;
  }
  while (1)
  {
    v9 = v14 + 1;
    if (__OFADD__(v14, 1))
      break;
    if (v9 >= v8)
      goto LABEL_23;
    v13 = *(_QWORD *)(v3 + 8 * v9);
    ++v14;
    if (v13)
      goto LABEL_22;
  }
LABEL_50:
  __break(1u);
LABEL_51:
  swift_once();
LABEL_44:
  v30 = sub_23B95831C();
  __swift_project_value_buffer(v30, (uint64_t)qword_254309BB8);
  v31 = sub_23B958304();
  v32 = sub_23B958568();
  if (os_log_type_enabled(v31, v32))
  {
    v33 = (uint8_t *)swift_slowAlloc();
    v34 = swift_slowAlloc();
    v42[0] = v34;
    *(_DWORD *)v33 = 136446210;
    v38 = sub_23B93A46C(v34, v35, v36, v37);
    sub_23B9287E0(v38, v39, v42);
    sub_23B9585A4();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23B916000, v31, v32, "%{public}s: stopped.", v33, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x242609864](v34, -1, -1);
    MEMORY[0x242609864](v33, -1, -1);
  }

}

uint64_t sub_23B93B7B4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  void *v3;
  void *v4;
  id v5;
  _OWORD *v6;
  _OWORD v8[11];
  _OWORD v9[10];

  v3 = *(void **)(v1 + 128);
  v4 = (void *)sub_23B9583D0();
  v5 = objc_msgSend(v3, sel_deviceForFromID_, v4);

  if (v5)
  {
    sub_23B956C18(v5, (uint64_t)v9);
    v8[6] = v9[6];
    v8[7] = v9[7];
    v8[8] = v9[8];
    v8[9] = v9[9];
    v8[2] = v9[2];
    v8[3] = v9[3];
    v8[4] = v9[4];
    v8[5] = v9[5];
    v8[0] = v9[0];
    v8[1] = v9[1];
    nullsub_1(v8);
    v6 = v8;
  }
  else
  {
    sub_23B92D114(v9);
    v6 = v9;
  }
  return sub_23B92D130((uint64_t)v6, a1);
}

uint64_t sub_23B93B888@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;
  __int128 *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 *v18;
  _OWORD v20[10];
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;

  v2 = sub_23B93B99C();
  v3 = *(_QWORD *)(v2 + 16);
  if (!v3)
  {
LABEL_7:
    swift_bridgeObjectRelease();
    sub_23B92D114(&v21);
    v18 = &v21;
    return sub_23B92D130((uint64_t)v18, a1);
  }
  v4 = *(_OWORD *)(v2 + 144);
  v27 = *(_OWORD *)(v2 + 128);
  v28 = v4;
  v5 = *(_OWORD *)(v2 + 176);
  v29 = *(_OWORD *)(v2 + 160);
  v30 = v5;
  v6 = *(_OWORD *)(v2 + 80);
  v23 = *(_OWORD *)(v2 + 64);
  v24 = v6;
  v7 = *(_OWORD *)(v2 + 112);
  v25 = *(_OWORD *)(v2 + 96);
  v26 = v7;
  v8 = *(_OWORD *)(v2 + 48);
  v21 = *(_OWORD *)(v2 + 32);
  v22 = v8;
  if ((BYTE3(v29) & 1) == 0)
  {
    v9 = 192;
    while (--v3)
    {
      v10 = (__int128 *)(v2 + v9);
      v9 += 160;
      v11 = v10[1];
      v21 = *v10;
      v22 = v11;
      v12 = v10[2];
      v13 = v10[3];
      v14 = v10[5];
      v25 = v10[4];
      v26 = v14;
      v23 = v12;
      v24 = v13;
      v15 = v10[6];
      v16 = v10[7];
      v17 = v10[9];
      v29 = v10[8];
      v30 = v17;
      v27 = v15;
      v28 = v16;
      if ((BYTE3(v29) & 1) != 0)
        goto LABEL_6;
    }
    goto LABEL_7;
  }
LABEL_6:
  sub_23B92D178((uint64_t)&v21);
  swift_bridgeObjectRelease();
  v20[6] = v27;
  v20[7] = v28;
  v20[8] = v29;
  v20[9] = v30;
  v20[2] = v23;
  v20[3] = v24;
  v20[4] = v25;
  v20[5] = v26;
  v20[0] = v21;
  v20[1] = v22;
  nullsub_1(v20);
  v18 = v20;
  return sub_23B92D130((uint64_t)v18, a1);
}

uint64_t sub_23B93B99C()
{
  unint64_t v0;
  uint64_t v1;
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  id i;
  id v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  unint64_t v13;
  unint64_t v14;
  _OWORD *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _OWORD v23[10];
  _OWORD v24[10];
  _OWORD v25[10];
  _BYTE v26[168];

  v0 = (unint64_t)sub_23B93BCD4();
  if (!(v0 >> 62))
  {
    v1 = *(_QWORD *)((v0 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v1)
      goto LABEL_3;
LABEL_24:
    swift_bridgeObjectRelease();
    v4 = MEMORY[0x24BEE4AF8];
    v9 = *(_QWORD *)(MEMORY[0x24BEE4AF8] + 16);
    if (v9)
    {
LABEL_13:
      v10 = v4 + 32;
      swift_bridgeObjectRetain();
      v11 = v9 - 1;
      v12 = (_QWORD *)MEMORY[0x24BEE4AF8];
      while (1)
      {
        sub_23B92D130(v10, (uint64_t)v25);
        sub_23B92D130((uint64_t)v25, (uint64_t)v26);
        if (sub_23B92D220((uint64_t)v26) != 1)
        {
          sub_23B92D130((uint64_t)v25, (uint64_t)v24);
          sub_23B92D178((uint64_t)v24);
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v12 = sub_23B928270(0, v12[2] + 1, 1, v12);
          v14 = v12[2];
          v13 = v12[3];
          if (v14 >= v13 >> 1)
            v12 = sub_23B928270((_QWORD *)(v13 > 1), v14 + 1, 1, v12);
          sub_23B92D130((uint64_t)v25, (uint64_t)v23);
          v12[2] = v14 + 1;
          v15 = &v12[20 * v14];
          v16 = v23[1];
          v15[2] = v23[0];
          v15[3] = v16;
          v17 = v23[5];
          v19 = v23[2];
          v18 = v23[3];
          v15[6] = v23[4];
          v15[7] = v17;
          v15[4] = v19;
          v15[5] = v18;
          v20 = v23[9];
          v22 = v23[6];
          v21 = v23[7];
          v15[10] = v23[8];
          v15[11] = v20;
          v15[8] = v22;
          v15[9] = v21;
        }
        if (!v11)
          break;
        --v11;
        v10 += 160;
      }
      swift_bridgeObjectRelease_n();
      return (uint64_t)v12;
    }
LABEL_25:
    swift_bridgeObjectRelease();
    return MEMORY[0x24BEE4AF8];
  }
  v1 = sub_23B958730();
  if (!v1)
    goto LABEL_24;
LABEL_3:
  *(_QWORD *)&v23[0] = MEMORY[0x24BEE4AF8];
  result = sub_23B928E58(0, v1 & ~(v1 >> 63), 0);
  if ((v1 & 0x8000000000000000) == 0)
  {
    v3 = 0;
    v4 = *(_QWORD *)&v23[0];
    if ((v0 & 0xC000000000000001) == 0)
      goto LABEL_6;
LABEL_5:
    for (i = (id)MEMORY[0x2426091BC](v3, v0); ; i = *(id *)(v0 + 8 * v3 + 32))
    {
      v6 = i;
      sub_23B956C18(v6, (uint64_t)v25);

      v24[6] = v25[6];
      v24[7] = v25[7];
      v24[8] = v25[8];
      v24[9] = v25[9];
      v24[2] = v25[2];
      v24[3] = v25[3];
      v24[4] = v25[4];
      v24[5] = v25[5];
      v24[0] = v25[0];
      v24[1] = v25[1];
      nullsub_1(v24);
      sub_23B92D130((uint64_t)v24, (uint64_t)v26);
      *(_QWORD *)&v23[0] = v4;
      v8 = *(_QWORD *)(v4 + 16);
      v7 = *(_QWORD *)(v4 + 24);
      if (v8 >= v7 >> 1)
      {
        sub_23B928E58(v7 > 1, v8 + 1, 1);
        v4 = *(_QWORD *)&v23[0];
      }
      *(_QWORD *)(v4 + 16) = v8 + 1;
      sub_23B92D130((uint64_t)v26, v4 + 160 * v8 + 32);
      if (v1 - 1 == v3)
        break;
      ++v3;
      if ((v0 & 0xC000000000000001) != 0)
        goto LABEL_5;
LABEL_6:
      ;
    }
    swift_bridgeObjectRelease();
    v9 = *(_QWORD *)(v4 + 16);
    if (v9)
      goto LABEL_13;
    goto LABEL_25;
  }
  __break(1u);
  return result;
}

id sub_23B93BCD4()
{
  uint64_t v0;
  id result;
  void *v2;
  uint64_t v3;

  if ((MEMORY[0x242608C70]() & 1) != 0)
    return (id)MEMORY[0x24BEE4AF8];
  result = objc_msgSend(*(id *)(v0 + 128), sel_devices);
  if (result)
  {
    v2 = result;
    sub_23B92D0DC(0, &qword_254309860);
    v3 = sub_23B958484();

    return (id)v3;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t LocalMessaging.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_23B92D238(*(_QWORD *)(v0 + 160));
  sub_23B92D238(*(_QWORD *)(v0 + 176));
  sub_23B92D238(*(_QWORD *)(v0 + 192));
  sub_23B92D238(*(_QWORD *)(v0 + 208));
  sub_23B92D238(*(_QWORD *)(v0 + 224));
  sub_23B92D238(*(_QWORD *)(v0 + 240));
  sub_23B92D238(*(_QWORD *)(v0 + 256));
  swift_defaultActor_destroy();
  return v0;
}

uint64_t LocalMessaging.__deallocating_deinit()
{
  LocalMessaging.deinit();
  return swift_defaultActor_deallocate();
}

uint64_t LocalMessaging.unownedExecutor.getter()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_23B93BDF4()
{
  return LocalMessaging.unownedExecutor.getter();
}

uint64_t LocalMessaging.send(message:messageOptions:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4[11] = a3;
  v4[12] = v3;
  v4[9] = a1;
  v4[10] = a2;
  v4[13] = *v3;
  v5 = *v3;
  v4[14] = type metadata accessor for MessagingOptions();
  v4[15] = swift_task_alloc();
  v4[16] = swift_task_alloc();
  v7 = type metadata accessor for Message(0, *(_QWORD *)(v5 + 80), *(_QWORD *)(v5 + 88), v6);
  v4[17] = v7;
  v4[18] = *(_QWORD *)(v7 - 8);
  v4[19] = swift_task_alloc();
  v4[20] = swift_task_alloc();
  return swift_task_switch();
}

void sub_23B93BECC()
{
  _QWORD *v0;
  uint64_t v1;
  int64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;

  v1 = *(_QWORD *)(v0[11] + *(int *)(v0[14] + 20));
  v2 = *(_QWORD *)(v1 + 16);
  v3 = MEMORY[0x24BEE4AF8];
  if (v2)
  {
    swift_bridgeObjectRetain();
    sub_23B928E3C(0, v2, 0);
    v4 = 0;
    v3 = v16;
    v5 = *(_QWORD *)(v16 + 16);
    v6 = 16 * v5;
    do
    {
      v7 = v1;
      v9 = *(_QWORD *)(v1 + v4 + 40);
      v8 = *(_QWORD *)(v1 + v4 + 48);
      v10 = *(_QWORD *)(v16 + 24);
      swift_bridgeObjectRetain();
      if (v5 >= v10 >> 1)
        sub_23B928E3C(v10 > 1, v5 + 1, 1);
      *(_QWORD *)(v16 + 16) = v5 + 1;
      v11 = v16 + v6;
      *(_QWORD *)(v11 + 32) = v9;
      *(_QWORD *)(v11 + 40) = v8;
      v6 += 16;
      v4 += 24;
      ++v5;
      --v2;
      v1 = v7;
    }
    while (v2);
    swift_bridgeObjectRelease();
    v0 = v15;
  }
  v12 = v0[17];
  v0[21] = sub_23B92D448(v3);
  swift_bridgeObjectRelease();
  sub_23B958214();
  swift_allocObject();
  sub_23B958208();
  MEMORY[0x2426097B0](&protocol conformance descriptor for Message<A>, v12);
  v0[22] = sub_23B9581F0();
  v0[23] = v13;
  v14 = v13;
  swift_release();
  sub_23B958400();
  swift_bridgeObjectRelease();
  __asm { BR              X10 }
}

uint64_t sub_23B93C890(uint64_t a1, _QWORD *a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6, uint64_t a7)
{
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
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t *v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  _QWORD *v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;

  v40 = a6;
  v41 = a7;
  v38 = a1;
  v39 = a5;
  v33 = a3;
  v34 = a4;
  v37 = a2;
  v7 = *a2;
  v8 = type metadata accessor for MessagingOptions();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = *(_QWORD *)(v9 + 64);
  MEMORY[0x24BDAC7A8](v8);
  v32 = (uint64_t)&v32 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = *(_QWORD *)(v7 + 80);
  v35 = *(_QWORD *)(v7 + 88);
  v13 = type metadata accessor for Message(0, v11, v35, v12);
  v14 = *(_QWORD *)(v13 - 8);
  v15 = *(_QWORD *)(v14 + 64);
  MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v32 - v16;
  v18 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254309C80);
  MEMORY[0x24BDAC7A8](v18);
  v20 = (char *)&v32 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v36 = v20;
  v21 = sub_23B9584F0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 56))(v20, 1, 1, v21);
  (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))(v17, v33, v13);
  sub_23B92F2F8(v34, (uint64_t)&v32 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(_QWORD))type metadata accessor for MessagingOptions);
  v22 = (*(unsigned __int8 *)(v14 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80);
  v23 = (v15 + *(unsigned __int8 *)(v9 + 80) + v22) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  v24 = (v10 + v23 + 7) & 0xFFFFFFFFFFFFFFF8;
  v25 = (v24 + 23) & 0xFFFFFFFFFFFFFFF8;
  v26 = (char *)swift_allocObject();
  *((_QWORD *)v26 + 2) = 0;
  *((_QWORD *)v26 + 3) = 0;
  v27 = v35;
  *((_QWORD *)v26 + 4) = v11;
  *((_QWORD *)v26 + 5) = v27;
  *((_QWORD *)v26 + 6) = v37;
  (*(void (**)(char *, char *, uint64_t))(v14 + 32))(&v26[v22], v17, v13);
  sub_23B92F378(v32, (uint64_t)&v26[v23], (uint64_t (*)(_QWORD))type metadata accessor for MessagingOptions);
  v28 = (uint64_t *)&v26[v24];
  v30 = v39;
  v29 = v40;
  *v28 = v39;
  v28[1] = v29;
  *(_QWORD *)&v26[v25] = v41;
  *(_QWORD *)&v26[(v25 + 15) & 0xFFFFFFFFFFFFFFF8] = v38;
  swift_retain();
  sub_23B9304B0(v30, v29);
  swift_bridgeObjectRetain();
  swift_retain();
  sub_23B94CA58((uint64_t)v36, (uint64_t)&unk_256A55A30, (uint64_t)v26);
  return swift_release();
}

uint64_t sub_23B93CAD4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  _QWORD *v13;
  uint64_t v15;
  uint64_t v16;

  v13 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v8 + 16) = v13;
  *v13 = v8;
  v13[1] = sub_23B930844;
  return sub_23B93CB64(a5, a6, a7, a8, v15, v16);
}

uint64_t sub_23B93CB64(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t *v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v7[18] = a6;
  v7[19] = v6;
  v7[16] = a4;
  v7[17] = a5;
  v7[14] = a2;
  v7[15] = a3;
  v7[13] = a1;
  v7[20] = *v6;
  v8 = *v6;
  v9 = *(_QWORD *)(*v6 + 80);
  v7[21] = v9;
  v10 = *(_QWORD *)(v8 + 88);
  v7[22] = v10;
  v11 = type metadata accessor for Message(0, v9, v10, a4);
  v7[23] = v11;
  v12 = *(_QWORD *)(v11 - 8);
  v7[24] = v12;
  v7[25] = *(_QWORD *)(v12 + 64);
  v7[26] = swift_task_alloc();
  v7[27] = swift_task_alloc();
  v13 = type metadata accessor for MessagingOptions();
  v7[28] = v13;
  v14 = *(_QWORD *)(v13 - 8);
  v7[29] = v14;
  v7[30] = *(_QWORD *)(v14 + 64);
  v7[31] = swift_task_alloc();
  v7[32] = swift_task_alloc();
  v15 = sub_23B9582F8();
  v7[33] = v15;
  v7[34] = *(_QWORD *)(v15 - 8);
  v7[35] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23B93CC64()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char isUniquelyReferenced_nonNull_native;
  void (*v9)(uint64_t, uint64_t, uint64_t);
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v1 = *(_QWORD *)(v0 + 272);
  v2 = *(_QWORD *)(v0 + 280);
  v4 = *(_QWORD *)(v0 + 256);
  v3 = *(_QWORD *)(v0 + 264);
  v16 = *(_QWORD *)(v0 + 216);
  v17 = *(_QWORD *)(v0 + 232);
  v18 = *(_QWORD *)(v0 + 200);
  v19 = *(_QWORD *)(v0 + 240);
  v25 = *(_QWORD *)(v0 + 192);
  v26 = *(_QWORD *)(v0 + 184);
  v5 = *(_QWORD *)(v0 + 152);
  v6 = *(_QWORD *)(v0 + 144);
  v23 = *(_QWORD *)(v0 + 136);
  v24 = *(_QWORD *)(v0 + 160);
  v7 = *(_QWORD *)(v0 + 112);
  v21 = *(_QWORD *)(v0 + 120);
  v22 = *(_QWORD *)(v0 + 128);
  v15 = *(_QWORD *)(v0 + 104);
  v20 = *(_OWORD *)(v0 + 168);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v1 + 16))(v2, v7, v3);
  swift_beginAccess();
  swift_retain();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v27 = *(_QWORD *)(v5 + 144);
  *(_QWORD *)(v5 + 144) = 0x8000000000000000;
  sub_23B936920(v6, v2, isUniquelyReferenced_nonNull_native);
  *(_QWORD *)(v5 + 144) = v27;
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v1 + 8))(v2, v3);
  swift_endAccess();
  sub_23B92F2F8(v7, v4, (uint64_t (*)(_QWORD))type metadata accessor for MessagingOptions);
  v9 = *(void (**)(uint64_t, uint64_t, uint64_t))(v25 + 16);
  *(_QWORD *)(v0 + 288) = v9;
  v9(v16, v15, v26);
  v10 = (*(unsigned __int8 *)(v17 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v17 + 80);
  v11 = (v19 + *(unsigned __int8 *)(v25 + 80) + v10) & ~(unint64_t)*(unsigned __int8 *)(v25 + 80);
  v12 = swift_allocObject();
  *(_QWORD *)(v0 + 296) = v12;
  *(_OWORD *)(v12 + 16) = v20;
  *(_QWORD *)(v12 + 32) = v5;
  *(_QWORD *)(v12 + 40) = v21;
  *(_QWORD *)(v12 + 48) = v22;
  *(_QWORD *)(v12 + 56) = v23;
  sub_23B92F378(v4, v12 + v10, (uint64_t (*)(_QWORD))type metadata accessor for MessagingOptions);
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v25 + 32))(v12 + v11, v16, v26);
  *(_QWORD *)(v12 + ((v18 + v11 + 7) & 0xFFFFFFFFFFFFFFF8)) = v24;
  swift_retain();
  sub_23B9304B0(v21, v22);
  swift_bridgeObjectRetain();
  v13 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 304) = v13;
  *v13 = v0;
  v13[1] = sub_23B93CECC;
  return sub_23B958160();
}

uint64_t sub_23B93CECC()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 312) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_release();
  return swift_task_switch();
}

uint64_t sub_23B93CF40()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  void (*v3)(uint64_t, uint64_t, uint64_t);
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;
  NSObject *v11;
  os_log_type_t v12;
  _BOOL4 v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  void (*v24)(uint64_t, uint64_t);
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  unint64_t v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  uint64_t v37;
  void (*v38)(uint64_t, uint64_t, uint64_t);
  uint64_t v39;
  _QWORD *v40;
  os_log_type_t type;
  uint64_t v42;
  NSObject *log;
  uint64_t v44;

  swift_release();
  if (qword_254309BD0 != -1)
    swift_once();
  v1 = *(_QWORD *)(v0 + 104);
  v2 = *(void **)(v0 + 312);
  v3 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 288);
  v4 = *(_QWORD *)(v0 + 248);
  v5 = *(_QWORD *)(v0 + 208);
  v6 = *(_QWORD *)(v0 + 184);
  v7 = *(_QWORD *)(v0 + 112);
  v8 = sub_23B95831C();
  __swift_project_value_buffer(v8, (uint64_t)qword_254309BB8);
  v3(v5, v1, v6);
  sub_23B92F2F8(v7, v4, (uint64_t (*)(_QWORD))type metadata accessor for MessagingOptions);
  v9 = v2;
  v10 = v2;
  v11 = sub_23B958304();
  v12 = sub_23B958568();
  v13 = os_log_type_enabled(v11, v12);
  v14 = *(void **)(v0 + 312);
  if (v13)
  {
    log = v11;
    v38 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 288);
    v39 = *(_QWORD *)(v0 + 248);
    v15 = *(_QWORD *)(v0 + 208);
    v16 = *(_QWORD *)(v0 + 216);
    v17 = *(_QWORD *)(v0 + 184);
    v37 = *(_QWORD *)(v0 + 192);
    type = v12;
    v18 = swift_slowAlloc();
    v40 = (_QWORD *)swift_slowAlloc();
    v42 = swift_slowAlloc();
    v44 = v42;
    *(_DWORD *)v18 = 136446978;
    v22 = sub_23B93A46C(v42, v19, v20, v21);
    *(_QWORD *)(v0 + 72) = sub_23B9287E0(v22, v23, &v44);
    sub_23B9585A4();
    swift_bridgeObjectRelease();
    *(_WORD *)(v18 + 12) = 2082;
    v38(v16, v15, v17);
    v24 = *(void (**)(uint64_t, uint64_t))(v37 + 8);
    v24(v15, v17);
    Message.description.getter(v17);
    v26 = v25;
    v28 = v27;
    v24(v16, v17);
    *(_QWORD *)(v0 + 80) = sub_23B9287E0(v26, v28, &v44);
    sub_23B9585A4();
    swift_bridgeObjectRelease();
    *(_WORD *)(v18 + 22) = 2082;
    sub_23B92F2B8(&qword_256A55510, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAB8]);
    v29 = sub_23B9587F0();
    *(_QWORD *)(v0 + 88) = sub_23B9287E0(v29, v30, &v44);
    sub_23B9585A4();
    swift_bridgeObjectRelease();
    sub_23B92F33C(v39, (uint64_t (*)(_QWORD))type metadata accessor for MessagingOptions);
    *(_WORD *)(v18 + 32) = 2114;
    v31 = v14;
    v32 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v0 + 96) = v32;
    sub_23B9585A4();
    *v40 = v32;

    _os_log_impl(&dword_23B916000, log, type, "%{public}s: Failed to send message (resource) %{public}s. with identifier: %{public}s. Error: %{public}@.", (uint8_t *)v18, 0x2Au);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256A555C8);
    swift_arrayDestroy();
    MEMORY[0x242609864](v40, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x242609864](v42, -1, -1);
    MEMORY[0x242609864](v18, -1, -1);

  }
  else
  {
    v33 = *(_QWORD *)(v0 + 248);
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 192) + 8))(*(_QWORD *)(v0 + 208), *(_QWORD *)(v0 + 184));
    sub_23B92F33C(v33, (uint64_t (*)(_QWORD))type metadata accessor for MessagingOptions);

  }
  v34 = *(void **)(v0 + 312);
  v35 = *(_QWORD *)(v0 + 112);
  *(_QWORD *)(v0 + 64) = v34;
  sub_23B958178();
  swift_beginAccess();
  sub_23B945D2C(v35);
  swift_endAccess();
  swift_release();

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t LocalMessaging.send(message:metadata:messageOptions:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v5[12] = a4;
  v5[13] = v4;
  v5[10] = a2;
  v5[11] = a3;
  v5[9] = a1;
  v5[14] = *v4;
  v6 = *v4;
  v5[15] = type metadata accessor for MessagingOptions();
  v5[16] = swift_task_alloc();
  v5[17] = swift_task_alloc();
  v8 = type metadata accessor for Message(0, *(_QWORD *)(v6 + 80), *(_QWORD *)(v6 + 88), v7);
  v5[18] = v8;
  v5[19] = *(_QWORD *)(v8 - 8);
  v5[20] = swift_task_alloc();
  v5[21] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23B93D478()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  os_log_type_t v26;
  _BOOL4 v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  void (*v36)(uint64_t, uint64_t);
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  uint64_t v41;
  unint64_t v42;
  unint64_t v43;
  uint64_t v44;
  unint64_t v45;
  uint64_t v46;
  NSObject *v47;
  os_log_type_t v48;
  _BOOL4 v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  unint64_t v56;
  uint64_t v57;
  unint64_t v58;
  unint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  __int128 v63;
  _QWORD *v64;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  os_log_type_t type;
  NSObject *log;
  void (*v72)(uint64_t, uint64_t, uint64_t);
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  _QWORD *v76;
  uint64_t v77;
  unint64_t v78;

  v1 = v0[15];
  v2 = v0[12];
  v3 = *(_QWORD *)(v2 + *(int *)(v1 + 20));
  v4 = *(_QWORD *)(v3 + 16);
  v5 = MEMORY[0x24BEE4AF8];
  if (v4)
  {
    v77 = MEMORY[0x24BEE4AF8];
    swift_bridgeObjectRetain();
    sub_23B928E3C(0, v4, 0);
    v6 = 0;
    v5 = v77;
    v7 = *(_QWORD *)(v77 + 16);
    v8 = 16 * v7;
    v9 = v3;
    do
    {
      v11 = *(_QWORD *)(v9 + v6 + 40);
      v10 = *(_QWORD *)(v9 + v6 + 48);
      v77 = v5;
      v12 = *(_QWORD *)(v5 + 24);
      swift_bridgeObjectRetain();
      if (v7 >= v12 >> 1)
      {
        sub_23B928E3C(v12 > 1, v7 + 1, 1);
        v5 = v77;
      }
      *(_QWORD *)(v5 + 16) = v7 + 1;
      v13 = v5 + v8;
      *(_QWORD *)(v13 + 32) = v11;
      *(_QWORD *)(v13 + 40) = v10;
      v8 += 16;
      v6 += 24;
      ++v7;
      --v4;
    }
    while (v4);
    swift_bridgeObjectRelease();
    v0 = v76;
    v1 = v76[15];
    v2 = v76[12];
  }
  v14 = sub_23B92D448(v5);
  v0[22] = v14;
  swift_bridgeObjectRelease();
  v15 = 0x6F707365722F7728;
  if (!*(_BYTE *)(v2 + *(int *)(v1 + 24)))
    v15 = 0;
  v16 = 0xE000000000000000;
  if (*(_BYTE *)(v2 + *(int *)(v1 + 24)))
    v16 = 0xED0000202965736ELL;
  v77 = v15;
  v78 = v16;
  sub_23B958400();
  swift_bridgeObjectRelease();
  v17 = v78;
  v73 = v77;
  if (qword_254309BD0 != -1)
    swift_once();
  v18 = v0[21];
  v20 = v0[18];
  v19 = v0[19];
  v21 = v0[17];
  v22 = v0[12];
  v23 = v0[10];
  v24 = sub_23B95831C();
  __swift_project_value_buffer(v24, (uint64_t)qword_254309BB8);
  v72 = *(void (**)(uint64_t, uint64_t, uint64_t))(v19 + 16);
  v72(v18, v23, v20);
  sub_23B92F2F8(v22, v21, (uint64_t (*)(_QWORD))type metadata accessor for MessagingOptions);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain();
  v25 = sub_23B958304();
  v26 = sub_23B958568();
  v27 = os_log_type_enabled(v25, v26);
  v28 = v0[21];
  v75 = v14;
  if (v27)
  {
    log = v25;
    v29 = v0[18];
    v66 = v0[20];
    v67 = v0[19];
    v68 = v0[17];
    type = v26;
    v30 = swift_slowAlloc();
    v69 = swift_slowAlloc();
    v77 = v69;
    *(_DWORD *)v30 = 136316162;
    v34 = sub_23B93A46C(v69, v31, v32, v33);
    v76[4] = sub_23B9287E0(v34, v35, &v77);
    sub_23B9585A4();
    swift_bridgeObjectRelease();
    *(_WORD *)(v30 + 12) = 2082;
    swift_bridgeObjectRetain();
    v76[5] = sub_23B9287E0(v73, v17, &v77);
    sub_23B9585A4();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v30 + 22) = 2082;
    v72(v66, v28, v29);
    v36 = *(void (**)(uint64_t, uint64_t))(v67 + 8);
    v36(v28, v29);
    Message.description.getter(v29);
    v38 = v37;
    v40 = v39;
    v36(v66, v29);
    v76[6] = sub_23B9287E0(v38, v40, &v77);
    sub_23B9585A4();
    swift_bridgeObjectRelease();
    *(_WORD *)(v30 + 32) = 2080;
    swift_bridgeObjectRetain();
    v41 = sub_23B958514();
    v43 = v42;
    swift_bridgeObjectRelease();
    v76[7] = sub_23B9287E0(v41, v43, &v77);
    sub_23B9585A4();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v30 + 42) = 2082;
    sub_23B9582F8();
    sub_23B92F2B8(&qword_256A55510, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAB8]);
    v44 = sub_23B9587F0();
    v76[8] = sub_23B9287E0(v44, v45, &v77);
    sub_23B9585A4();
    swift_bridgeObjectRelease();
    sub_23B92F33C(v68, (uint64_t (*)(_QWORD))type metadata accessor for MessagingOptions);
    _os_log_impl(&dword_23B916000, log, type, "%s: Sending (resource) %{public}s: %{public}s to %s with identifier: %{public}s", (uint8_t *)v30, 0x34u);
    swift_arrayDestroy();
    MEMORY[0x242609864](v69, -1, -1);
    v0 = v76;
    MEMORY[0x242609864](v30, -1, -1);

  }
  else
  {
    v46 = v0[17];
    (*(void (**)(uint64_t, _QWORD))(v0[19] + 8))(v28, v0[18]);
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    sub_23B92F33C(v46, (uint64_t (*)(_QWORD))type metadata accessor for MessagingOptions);

  }
  sub_23B92F2F8(v0[12], v0[16], (uint64_t (*)(_QWORD))type metadata accessor for MessagingOptions);
  v47 = sub_23B958304();
  v48 = sub_23B958568();
  v49 = os_log_type_enabled(v47, v48);
  v50 = v0[16];
  if (v49)
  {
    v51 = swift_slowAlloc();
    v74 = swift_slowAlloc();
    v77 = v74;
    *(_DWORD *)v51 = 136446466;
    v55 = sub_23B93A46C(v74, v52, v53, v54);
    v0[2] = sub_23B9287E0(v55, v56, &v77);
    sub_23B9585A4();
    swift_bridgeObjectRelease();
    *(_WORD *)(v51 + 12) = 2080;
    MessagingOptions.dictionaryValue.getter();
    v57 = sub_23B958358();
    v59 = v58;
    swift_bridgeObjectRelease();
    v76[3] = sub_23B9287E0(v57, v59, &v77);
    sub_23B9585A4();
    v0 = v76;
    swift_bridgeObjectRelease();
    sub_23B92F33C(v50, (uint64_t (*)(_QWORD))type metadata accessor for MessagingOptions);
    _os_log_impl(&dword_23B916000, v47, v48, "%{public}s: IDSSendMessageOptions: %s", (uint8_t *)v51, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x242609864](v74, -1, -1);
    MEMORY[0x242609864](v51, -1, -1);
  }
  else
  {
    sub_23B92F33C(v0[16], (uint64_t (*)(_QWORD))type metadata accessor for MessagingOptions);
  }

  v60 = v0[12];
  v61 = v0[13];
  v62 = swift_task_alloc();
  v0[23] = v62;
  v63 = *((_OWORD *)v0 + 5);
  *(_QWORD *)(v62 + 16) = v61;
  *(_OWORD *)(v62 + 24) = v63;
  *(_QWORD *)(v62 + 40) = v60;
  *(_QWORD *)(v62 + 48) = v75;
  v64 = (_QWORD *)swift_task_alloc();
  v0[24] = v64;
  sub_23B9582F8();
  *v64 = v0;
  v64[1] = sub_23B91F6C0;
  return sub_23B95819C();
}

uint64_t sub_23B93DC80(uint64_t a1, _QWORD *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
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
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  _QWORD *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;

  v37 = a1;
  v38 = a6;
  v31 = a3;
  v32 = a5;
  v35 = a2;
  v36 = a4;
  v6 = *a2;
  v7 = type metadata accessor for MessagingOptions();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = *(_QWORD *)(v8 + 64);
  MEMORY[0x24BDAC7A8](v7);
  v30 = (uint64_t)&v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *(_QWORD *)(v6 + 80);
  v34 = *(_QWORD *)(v6 + 88);
  v12 = type metadata accessor for Message(0, v10, v34, v11);
  v13 = *(_QWORD *)(v12 - 8);
  v14 = *(_QWORD *)(v13 + 64);
  MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v29 - v15;
  v17 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254309C80);
  MEMORY[0x24BDAC7A8](v17);
  v19 = (char *)&v29 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v33 = v19;
  v20 = sub_23B9584F0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 56))(v19, 1, 1, v20);
  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))(v16, v31, v12);
  sub_23B92F2F8(v32, (uint64_t)&v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(_QWORD))type metadata accessor for MessagingOptions);
  v21 = (*(unsigned __int8 *)(v13 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  v22 = (v14 + v21 + 7) & 0xFFFFFFFFFFFFFFF8;
  v23 = (*(unsigned __int8 *)(v8 + 80) + v22 + 8) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  v24 = (v9 + v23 + 7) & 0xFFFFFFFFFFFFFFF8;
  v25 = (char *)swift_allocObject();
  *((_QWORD *)v25 + 2) = 0;
  *((_QWORD *)v25 + 3) = 0;
  v26 = v34;
  *((_QWORD *)v25 + 4) = v10;
  *((_QWORD *)v25 + 5) = v26;
  *((_QWORD *)v25 + 6) = v35;
  (*(void (**)(char *, char *, uint64_t))(v13 + 32))(&v25[v21], v16, v12);
  *(_QWORD *)&v25[v22] = v36;
  sub_23B92F378(v30, (uint64_t)&v25[v23], (uint64_t (*)(_QWORD))type metadata accessor for MessagingOptions);
  v27 = v37;
  *(_QWORD *)&v25[v24] = v38;
  *(_QWORD *)&v25[(v24 + 15) & 0xFFFFFFFFFFFFFFF8] = v27;
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  sub_23B94CA58((uint64_t)v33, (uint64_t)&unk_256A55A08, (uint64_t)v25);
  return swift_release();
}

uint64_t sub_23B93DEB8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  _QWORD *v13;
  uint64_t v15;

  v13 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v8 + 16) = v13;
  *v13 = v8;
  v13[1] = sub_23B930844;
  return sub_23B93DF40(a5, a6, a7, a8, v15);
}

uint64_t sub_23B93DF40(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t *v5;
  _QWORD *v6;
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

  v6[17] = a5;
  v6[18] = v5;
  v6[15] = a3;
  v6[16] = a4;
  v6[13] = a1;
  v6[14] = a2;
  v6[19] = *v5;
  v7 = *v5;
  v8 = *(_QWORD *)(*v5 + 80);
  v6[20] = v8;
  v9 = *(_QWORD *)(v7 + 88);
  v6[21] = v9;
  v10 = type metadata accessor for Message(0, v8, v9, a4);
  v6[22] = v10;
  v11 = *(_QWORD *)(v10 - 8);
  v6[23] = v11;
  v6[24] = *(_QWORD *)(v11 + 64);
  v6[25] = swift_task_alloc();
  v6[26] = swift_task_alloc();
  v12 = type metadata accessor for MessagingOptions();
  v6[27] = v12;
  v13 = *(_QWORD *)(v12 - 8);
  v6[28] = v13;
  v6[29] = *(_QWORD *)(v13 + 64);
  v6[30] = swift_task_alloc();
  v6[31] = swift_task_alloc();
  v14 = sub_23B9582F8();
  v6[32] = v14;
  v6[33] = *(_QWORD *)(v14 - 8);
  v6[34] = swift_task_alloc();
  v15 = sub_23B95825C();
  v6[35] = v15;
  v16 = *(_QWORD *)(v15 - 8);
  v6[36] = v16;
  v6[37] = *(_QWORD *)(v16 + 64);
  v6[38] = swift_task_alloc();
  v6[39] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23B93E078()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSString *v5;
  void (*v6)(uint64_t, uint64_t);
  void (*v7)(uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  __int128 v31;
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
  uint64_t v43;
  uint64_t v44;

  v1 = *(_QWORD *)(v0 + 176);
  sub_23B958214();
  swift_allocObject();
  sub_23B958208();
  MEMORY[0x2426097B0](&protocol conformance descriptor for Message<A>, v1);
  *(_QWORD *)(v0 + 320) = sub_23B9581F0();
  *(_QWORD *)(v0 + 328) = v2;
  v3 = *(_QWORD *)(v0 + 304);
  v40 = *(_QWORD *)(v0 + 288);
  v4 = *(_QWORD *)(v0 + 272);
  v42 = *(_QWORD *)(v0 + 280);
  v35 = *(_QWORD *)(v0 + 264);
  v37 = *(_QWORD *)(v0 + 256);
  swift_release();
  v5 = NSTemporaryDirectory();
  sub_23B9583DC();

  sub_23B95822C();
  swift_bridgeObjectRelease();
  sub_23B9582EC();
  sub_23B9582D4();
  v6 = *(void (**)(uint64_t, uint64_t))(v35 + 8);
  v6(v4, v37);
  sub_23B958244();
  swift_bridgeObjectRelease();
  v7 = *(void (**)(uint64_t, uint64_t))(v40 + 8);
  *(_QWORD *)(v0 + 336) = v7;
  v7(v3, v42);
  sub_23B95828C();
  v25 = *(_QWORD *)(v0 + 304);
  v26 = *(_QWORD *)(v0 + 312);
  v28 = *(_QWORD *)(v0 + 296);
  v8 = *(_QWORD *)(v0 + 280);
  v36 = *(_QWORD *)(v0 + 288);
  v23 = v8;
  v9 = *(_QWORD *)(v0 + 272);
  v10 = *(_QWORD *)(v0 + 256);
  v41 = *(_QWORD *)(v0 + 248);
  v30 = *(_QWORD *)(v0 + 232);
  v27 = *(_QWORD *)(v0 + 224);
  v39 = *(_QWORD *)(v0 + 208);
  v29 = *(_QWORD *)(v0 + 192);
  v38 = *(_QWORD *)(v0 + 184);
  v43 = *(_QWORD *)(v0 + 176);
  v11 = *(_QWORD *)(v0 + 144);
  v12 = *(_QWORD *)(v0 + 136);
  v33 = *(_QWORD *)(v0 + 128);
  v34 = *(_QWORD *)(v0 + 152);
  v13 = *(_QWORD *)(v0 + 120);
  v32 = *(_QWORD *)(v0 + 112);
  v24 = *(_QWORD *)(v0 + 104);
  v31 = *(_OWORD *)(v0 + 160);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 + 264) + 16))(v9, v13, v10);
  swift_beginAccess();
  swift_retain();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v44 = *(_QWORD *)(v11 + 144);
  *(_QWORD *)(v11 + 144) = 0x8000000000000000;
  sub_23B936920(v12, v9, isUniquelyReferenced_nonNull_native);
  *(_QWORD *)(v11 + 144) = v44;
  swift_bridgeObjectRelease();
  v6(v9, v10);
  swift_endAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v36 + 16))(v25, v26, v8);
  sub_23B92F2F8(v13, v41, (uint64_t (*)(_QWORD))type metadata accessor for MessagingOptions);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v38 + 16))(v39, v24, v43);
  v15 = (*(unsigned __int8 *)(v36 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v36 + 80);
  v16 = (v28 + v15 + 7) & 0xFFFFFFFFFFFFFFF8;
  v17 = (v16 + 15) & 0xFFFFFFFFFFFFFFF8;
  v18 = (*(unsigned __int8 *)(v27 + 80) + v17 + 8) & ~(unint64_t)*(unsigned __int8 *)(v27 + 80);
  v19 = (v30 + *(unsigned __int8 *)(v38 + 80) + v18) & ~(unint64_t)*(unsigned __int8 *)(v38 + 80);
  v20 = swift_allocObject();
  *(_QWORD *)(v0 + 344) = v20;
  *(_OWORD *)(v20 + 16) = v31;
  *(_QWORD *)(v20 + 32) = v11;
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v36 + 32))(v20 + v15, v25, v23);
  *(_QWORD *)(v20 + v16) = v32;
  *(_QWORD *)(v20 + v17) = v33;
  sub_23B92F378(v41, v20 + v18, (uint64_t (*)(_QWORD))type metadata accessor for MessagingOptions);
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v38 + 32))(v20 + v19, v39, v43);
  *(_QWORD *)(v20 + ((v29 + v19 + 7) & 0xFFFFFFFFFFFFFFF8)) = v34;
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v21 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 352) = v21;
  *v21 = v0;
  v21[1] = sub_23B93E8F8;
  return sub_23B958160();
}

uint64_t sub_23B93E8F8()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 360) = v0;
  swift_task_dealloc();
  swift_release();
  return swift_task_switch();
}

uint64_t sub_23B93E968()
{
  uint64_t v0;
  void (*v1)(uint64_t, uint64_t);
  uint64_t v2;
  uint64_t v3;

  v1 = *(void (**)(uint64_t, uint64_t))(v0 + 336);
  v2 = *(_QWORD *)(v0 + 312);
  v3 = *(_QWORD *)(v0 + 280);
  sub_23B92D4DC(*(_QWORD *)(v0 + 320), *(_QWORD *)(v0 + 328));
  v1(v2, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23B93EA00()
{
  uint64_t v0;
  void (*v1)(uint64_t, uint64_t);
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t, uint64_t);
  id v13;
  id v14;
  NSObject *v15;
  os_log_type_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  void (*v26)(uint64_t, uint64_t);
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  unint64_t v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v38;
  void (*v39)(uint64_t, uint64_t, uint64_t);
  uint64_t v40;
  NSObject *log;
  _QWORD *v42;
  os_log_type_t type;
  uint64_t v44;
  uint64_t v45;

  v1 = *(void (**)(uint64_t, uint64_t))(v0 + 336);
  v2 = *(_QWORD *)(v0 + 312);
  v3 = *(_QWORD *)(v0 + 280);
  sub_23B92D4DC(*(_QWORD *)(v0 + 320), *(_QWORD *)(v0 + 328));
  v1(v2, v3);
  v4 = *(void **)(v0 + 360);
  if (qword_254309BD0 != -1)
    swift_once();
  v5 = *(_QWORD *)(v0 + 104);
  v6 = *(_QWORD *)(v0 + 240);
  v7 = *(_QWORD *)(v0 + 200);
  v8 = *(_QWORD *)(v0 + 176);
  v9 = *(_QWORD *)(v0 + 184);
  v10 = *(_QWORD *)(v0 + 120);
  v11 = sub_23B95831C();
  __swift_project_value_buffer(v11, (uint64_t)qword_254309BB8);
  v12 = *(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 16);
  v12(v7, v5, v8);
  sub_23B92F2F8(v10, v6, (uint64_t (*)(_QWORD))type metadata accessor for MessagingOptions);
  v13 = v4;
  v14 = v4;
  v15 = sub_23B958304();
  v16 = sub_23B958568();
  if (os_log_type_enabled(v15, v16))
  {
    v40 = *(_QWORD *)(v0 + 240);
    v39 = v12;
    v17 = *(_QWORD *)(v0 + 200);
    v18 = *(_QWORD *)(v0 + 208);
    v19 = *(_QWORD *)(v0 + 176);
    v38 = *(_QWORD *)(v0 + 184);
    type = v16;
    v20 = swift_slowAlloc();
    v42 = (_QWORD *)swift_slowAlloc();
    v44 = swift_slowAlloc();
    v45 = v44;
    *(_DWORD *)v20 = 136446978;
    log = v15;
    v24 = sub_23B93A46C(v44, v21, v22, v23);
    *(_QWORD *)(v0 + 64) = sub_23B9287E0(v24, v25, &v45);
    sub_23B9585A4();
    swift_bridgeObjectRelease();
    *(_WORD *)(v20 + 12) = 2082;
    v39(v18, v17, v19);
    v26 = *(void (**)(uint64_t, uint64_t))(v38 + 8);
    v26(v17, v19);
    Message.description.getter(v19);
    v28 = v27;
    v30 = v29;
    v26(v18, v19);
    *(_QWORD *)(v0 + 96) = sub_23B9287E0(v28, v30, &v45);
    sub_23B9585A4();
    swift_bridgeObjectRelease();
    *(_WORD *)(v20 + 22) = 2082;
    sub_23B92F2B8(&qword_256A55510, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAB8]);
    v31 = sub_23B9587F0();
    *(_QWORD *)(v0 + 80) = sub_23B9287E0(v31, v32, &v45);
    sub_23B9585A4();
    swift_bridgeObjectRelease();
    sub_23B92F33C(v40, (uint64_t (*)(_QWORD))type metadata accessor for MessagingOptions);
    *(_WORD *)(v20 + 32) = 2114;
    v33 = v4;
    v34 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v0 + 88) = v34;
    sub_23B9585A4();
    *v42 = v34;

    _os_log_impl(&dword_23B916000, log, type, "%{public}s: Failed to send message (resource) %{public}s. with identifier: %{public}s. Error: %{public}@.", (uint8_t *)v20, 0x2Au);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256A555C8);
    swift_arrayDestroy();
    MEMORY[0x242609864](v42, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x242609864](v44, -1, -1);
    MEMORY[0x242609864](v20, -1, -1);

  }
  else
  {
    v35 = *(_QWORD *)(v0 + 240);
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 184) + 8))(*(_QWORD *)(v0 + 200), *(_QWORD *)(v0 + 176));
    sub_23B92F33C(v35, (uint64_t (*)(_QWORD))type metadata accessor for MessagingOptions);

  }
  v36 = *(_QWORD *)(v0 + 120);
  *(_QWORD *)(v0 + 72) = v4;
  sub_23B958178();
  swift_beginAccess();
  sub_23B945D2C(v36);
  swift_endAccess();
  swift_release();

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t LocalMessaging.sendWithResponse(message:messageOptions:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v5;

  v5[5] = a4;
  v5[6] = v4;
  v5[3] = a2;
  v5[4] = a3;
  v5[2] = a1;
  v5[7] = type metadata accessor for Message(255, *(_QWORD *)(*(_QWORD *)v4 + 80), *(_QWORD *)(*(_QWORD *)v4 + 88), a4);
  type metadata accessor for MessageContext();
  v5[8] = swift_getTupleTypeMetadata2();
  v5[9] = swift_task_alloc();
  v5[10] = type metadata accessor for MessagingOptions();
  v5[11] = swift_task_alloc();
  v5[12] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23B93EF50()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  _BYTE *v11;
  uint64_t v12;

  v1 = *(_QWORD *)(v0 + 88);
  v2 = *(_QWORD *)(v0 + 96);
  v3 = *(_QWORD *)(v0 + 80);
  sub_23B92F2F8(*(_QWORD *)(v0 + 40), v2, (uint64_t (*)(_QWORD))type metadata accessor for MessagingOptions);
  *(_BYTE *)(v2 + *(int *)(v3 + 24)) = 1;
  sub_23B92F2F8(v2, v1, (uint64_t (*)(_QWORD))type metadata accessor for MessagingOptions);
  v4 = *(_QWORD *)(v1 + *(int *)(v3 + 20));
  if (*(_QWORD *)(v4 + 16) == 1 && *(unsigned __int8 *)(v4 + 32) - 2 <= 2)
  {
    v5 = *(_QWORD *)(v0 + 88);
    v6 = *(_QWORD *)(v0 + 48);
    v7 = *(_QWORD *)(v0 + 32);
    v8 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 104) = v8;
    v8[2] = v6;
    v8[3] = v7;
    v8[4] = v5;
    v9 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 112) = v9;
    *v9 = v0;
    v9[1] = sub_23B920F70;
    return sub_23B95819C();
  }
  else
  {
    sub_23B91AC50();
    swift_allocError();
    *v11 = 1;
    swift_willThrow();
    v12 = *(_QWORD *)(v0 + 88);
    sub_23B92F33C(*(_QWORD *)(v0 + 96), (uint64_t (*)(_QWORD))type metadata accessor for MessagingOptions);
    sub_23B92F33C(v12, (uint64_t (*)(_QWORD))type metadata accessor for MessagingOptions);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_23B93F0E0(uint64_t a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  char *v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  uint64_t v28;

  v24 = a3;
  v25 = a4;
  v27 = a2;
  v28 = a1;
  v4 = *a2;
  v5 = type metadata accessor for MessagingOptions();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(_QWORD *)(v6 + 64);
  MEMORY[0x24BDAC7A8](v5);
  v8 = *(_QWORD *)(v4 + 88);
  v26 = *(_QWORD *)(v4 + 80);
  v10 = type metadata accessor for Message(0, v26, v8, v9);
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(_QWORD *)(v11 + 64);
  MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v23 - v13;
  v15 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254309C80);
  MEMORY[0x24BDAC7A8](v15);
  v17 = (char *)&v23 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = sub_23B9584F0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56))(v17, 1, 1, v18);
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v14, v24, v10);
  sub_23B92F2F8(v25, (uint64_t)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(_QWORD))type metadata accessor for MessagingOptions);
  v19 = (*(unsigned __int8 *)(v11 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  v20 = (v12 + *(unsigned __int8 *)(v6 + 80) + v19) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  v21 = (char *)swift_allocObject();
  *((_QWORD *)v21 + 2) = 0;
  *((_QWORD *)v21 + 3) = 0;
  *((_QWORD *)v21 + 4) = v26;
  *((_QWORD *)v21 + 5) = v8;
  *((_QWORD *)v21 + 6) = v27;
  (*(void (**)(char *, char *, uint64_t))(v11 + 32))(&v21[v19], v14, v10);
  sub_23B92F378((uint64_t)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t)&v21[v20], (uint64_t (*)(_QWORD))type metadata accessor for MessagingOptions);
  *(_QWORD *)&v21[(v7 + v20 + 7) & 0xFFFFFFFFFFFFFFF8] = v28;
  swift_retain();
  swift_retain();
  sub_23B94CA58((uint64_t)v17, (uint64_t)&unk_256A559E0, (uint64_t)v21);
  return swift_release();
}

uint64_t sub_23B93F2DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  _QWORD *v11;

  v11 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v7 + 16) = v11;
  *v11 = v7;
  v11[1] = sub_23B930844;
  return sub_23B93F348(a5, a6, a7);
}

uint64_t sub_23B93F348(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v4[17] = a3;
  v4[18] = v3;
  v4[15] = a1;
  v4[16] = a2;
  v4[19] = *v3;
  v5 = *v3;
  v6 = type metadata accessor for MessagingOptions();
  v4[20] = v6;
  v7 = *(_QWORD *)(v6 - 8);
  v4[21] = v7;
  v4[22] = *(_QWORD *)(v7 + 64);
  v4[23] = swift_task_alloc();
  v4[24] = swift_task_alloc();
  v8 = *(_QWORD *)(v5 + 80);
  v4[25] = v8;
  v9 = *(_QWORD *)(v5 + 88);
  v4[26] = v9;
  v11 = type metadata accessor for Message(0, v8, v9, v10);
  v4[27] = v11;
  v12 = *(_QWORD *)(v11 - 8);
  v4[28] = v12;
  v4[29] = *(_QWORD *)(v12 + 64);
  v4[30] = swift_task_alloc();
  v4[31] = swift_task_alloc();
  v13 = sub_23B9582F8();
  v4[32] = v13;
  v4[33] = *(_QWORD *)(v13 - 8);
  v4[34] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23B93F448()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t, uint64_t);
  void (*v7)(uint64_t, uint64_t, uint64_t);
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  uint64_t v21;
  uint64_t v22;

  v1 = *(_QWORD *)(v0 + 272);
  v2 = *(_QWORD *)(v0 + 256);
  v3 = *(_QWORD *)(v0 + 216);
  v14 = *(_QWORD *)(v0 + 224);
  v15 = *(_QWORD *)(v0 + 248);
  v18 = *(_QWORD *)(v0 + 176);
  v19 = *(_QWORD *)(v0 + 232);
  v16 = *(_QWORD *)(v0 + 192);
  v17 = *(_QWORD *)(v0 + 168);
  v4 = *(_QWORD *)(v0 + 136);
  v21 = *(_QWORD *)(v0 + 144);
  v22 = *(_QWORD *)(v0 + 152);
  v5 = *(_QWORD *)(v0 + 128);
  v13 = *(_QWORD *)(v0 + 120);
  v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 + 264) + 16);
  *(_QWORD *)(v0 + 280) = v6;
  v20 = *(_OWORD *)(v0 + 200);
  v6(v1, v5, v2);
  *(_QWORD *)(v0 + 80) = v4;
  swift_beginAccess();
  type metadata accessor for MessageContext();
  swift_retain();
  swift_getTupleTypeMetadata2();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254309C90);
  sub_23B958190();
  sub_23B92F2B8((unint64_t *)&qword_254309B00, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
  *(_QWORD *)(v0 + 288) = sub_23B95837C();
  sub_23B958394();
  swift_endAccess();
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v14 + 16);
  *(_QWORD *)(v0 + 296) = v7;
  v7(v15, v13, v3);
  sub_23B92F2F8(v5, v16, (uint64_t (*)(_QWORD))type metadata accessor for MessagingOptions);
  v8 = (*(unsigned __int8 *)(v14 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80);
  v9 = (v19 + *(unsigned __int8 *)(v17 + 80) + v8) & ~(unint64_t)*(unsigned __int8 *)(v17 + 80);
  v10 = swift_allocObject();
  *(_QWORD *)(v0 + 304) = v10;
  *(_OWORD *)(v10 + 16) = v20;
  *(_QWORD *)(v10 + 32) = v21;
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v14 + 32))(v10 + v8, v15, v3);
  sub_23B92F378(v16, v10 + v9, (uint64_t (*)(_QWORD))type metadata accessor for MessagingOptions);
  *(_QWORD *)(v10 + ((v18 + v9 + 7) & 0xFFFFFFFFFFFFFFF8)) = v22;
  swift_retain();
  v11 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 312) = v11;
  *v11 = v0;
  v11[1] = sub_23B93F6E4;
  return sub_23B958160();
}

uint64_t sub_23B93F6E4()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 320) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_release();
  return swift_task_switch();
}

uint64_t sub_23B93F758()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  void (*v3)(uint64_t, uint64_t, uint64_t);
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;
  NSObject *v11;
  os_log_type_t v12;
  _BOOL4 v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  void (*v24)(uint64_t, uint64_t);
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  unint64_t v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void (*v35)(uint64_t, uint64_t, uint64_t);
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v40;
  void (*v41)(uint64_t, uint64_t, uint64_t);
  uint64_t v42;
  _QWORD *v43;
  os_log_type_t type;
  uint64_t v45;
  NSObject *log;
  uint64_t v47;

  swift_release();
  if (qword_254309BD0 != -1)
    swift_once();
  v1 = *(_QWORD *)(v0 + 120);
  v2 = *(void **)(v0 + 320);
  v3 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 296);
  v4 = *(_QWORD *)(v0 + 240);
  v5 = *(_QWORD *)(v0 + 216);
  v6 = *(_QWORD *)(v0 + 184);
  v7 = *(_QWORD *)(v0 + 128);
  v8 = sub_23B95831C();
  __swift_project_value_buffer(v8, (uint64_t)qword_254309BB8);
  v3(v4, v1, v5);
  sub_23B92F2F8(v7, v6, (uint64_t (*)(_QWORD))type metadata accessor for MessagingOptions);
  v9 = v2;
  v10 = v2;
  v11 = sub_23B958304();
  v12 = sub_23B958568();
  v13 = os_log_type_enabled(v11, v12);
  v14 = *(void **)(v0 + 320);
  if (v13)
  {
    log = v11;
    v41 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 296);
    v15 = *(_QWORD *)(v0 + 248);
    v16 = *(_QWORD *)(v0 + 240);
    v17 = *(_QWORD *)(v0 + 216);
    v40 = *(_QWORD *)(v0 + 224);
    v42 = *(_QWORD *)(v0 + 184);
    type = v12;
    v18 = swift_slowAlloc();
    v43 = (_QWORD *)swift_slowAlloc();
    v45 = swift_slowAlloc();
    v47 = v45;
    *(_DWORD *)v18 = 136446978;
    v22 = sub_23B93A46C(v45, v19, v20, v21);
    *(_QWORD *)(v0 + 88) = sub_23B9287E0(v22, v23, &v47);
    sub_23B9585A4();
    swift_bridgeObjectRelease();
    *(_WORD *)(v18 + 12) = 2082;
    v41(v15, v16, v17);
    v24 = *(void (**)(uint64_t, uint64_t))(v40 + 8);
    v24(v16, v17);
    Message.description.getter(v17);
    v26 = v25;
    v28 = v27;
    v24(v15, v17);
    *(_QWORD *)(v0 + 96) = sub_23B9287E0(v26, v28, &v47);
    sub_23B9585A4();
    swift_bridgeObjectRelease();
    *(_WORD *)(v18 + 22) = 2082;
    sub_23B92F2B8(&qword_256A55510, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAB8]);
    v29 = sub_23B9587F0();
    *(_QWORD *)(v0 + 104) = sub_23B9287E0(v29, v30, &v47);
    sub_23B9585A4();
    swift_bridgeObjectRelease();
    sub_23B92F33C(v42, (uint64_t (*)(_QWORD))type metadata accessor for MessagingOptions);
    *(_WORD *)(v18 + 32) = 2114;
    v31 = v14;
    v32 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v0 + 112) = v32;
    sub_23B9585A4();
    *v43 = v32;

    _os_log_impl(&dword_23B916000, log, type, "%{public}s: Failed to send message (with response) %{public}s. with identifier: %{public}s. Error: %{public}@.", (uint8_t *)v18, 0x2Au);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256A555C8);
    swift_arrayDestroy();
    MEMORY[0x242609864](v43, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x242609864](v45, -1, -1);
    MEMORY[0x242609864](v18, -1, -1);

  }
  else
  {
    v33 = *(_QWORD *)(v0 + 184);
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 224) + 8))(*(_QWORD *)(v0 + 240), *(_QWORD *)(v0 + 216));
    sub_23B92F33C(v33, (uint64_t (*)(_QWORD))type metadata accessor for MessagingOptions);

  }
  v34 = *(void **)(v0 + 320);
  v35 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 280);
  v36 = *(_QWORD *)(v0 + 272);
  v37 = *(_QWORD *)(v0 + 256);
  v38 = *(_QWORD *)(v0 + 128);
  *(_QWORD *)(v0 + 64) = v34;
  sub_23B958178();
  v35(v36, v38, v37);
  *(_QWORD *)(v0 + 72) = 0;
  swift_beginAccess();
  sub_23B958394();
  swift_endAccess();

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t LocalMessaging.send(dictionary:messageOptions:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  _QWORD *v4;

  v4[9] = a3;
  v4[10] = v3;
  v4[7] = a1;
  v4[8] = a2;
  v4[11] = *v3;
  v4[12] = type metadata accessor for MessagingOptions();
  v4[13] = swift_task_alloc();
  v4[14] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23B93FC64()
{
  uint64_t v0;
  uint64_t v1;
  int64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  _BOOL4 v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  unint64_t v29;
  NSObject *v30;
  os_log_type_t v31;
  _BOOL4 v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  unint64_t v41;
  unint64_t v42;
  uint64_t v43;
  uint64_t v44;
  __int128 v45;
  _QWORD *v46;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;

  v1 = *(_QWORD *)(*(_QWORD *)(v0 + 72) + *(int *)(*(_QWORD *)(v0 + 96) + 20));
  v2 = *(_QWORD *)(v1 + 16);
  v3 = MEMORY[0x24BEE4AF8];
  if (v2)
  {
    v51 = MEMORY[0x24BEE4AF8];
    swift_bridgeObjectRetain();
    sub_23B928E3C(0, v2, 0);
    v4 = 0;
    v3 = v51;
    v5 = *(_QWORD *)(v51 + 16);
    v6 = 16 * v5;
    do
    {
      v8 = *(_QWORD *)(v1 + v4 + 40);
      v7 = *(_QWORD *)(v1 + v4 + 48);
      v51 = v3;
      v9 = *(_QWORD *)(v3 + 24);
      swift_bridgeObjectRetain();
      if (v5 >= v9 >> 1)
      {
        sub_23B928E3C(v9 > 1, v5 + 1, 1);
        v3 = v51;
      }
      *(_QWORD *)(v3 + 16) = v5 + 1;
      v10 = v3 + v6;
      *(_QWORD *)(v10 + 32) = v8;
      *(_QWORD *)(v10 + 40) = v7;
      v6 += 16;
      v4 += 24;
      ++v5;
      --v2;
    }
    while (v2);
    swift_bridgeObjectRelease();
  }
  v11 = sub_23B92D448(v3);
  *(_QWORD *)(v50 + 120) = v11;
  swift_bridgeObjectRelease();
  if (qword_254309BD0 != -1)
    swift_once();
  v12 = *(_QWORD *)(v50 + 112);
  v13 = *(_QWORD *)(v50 + 72);
  v14 = sub_23B95831C();
  __swift_project_value_buffer(v14, (uint64_t)qword_254309BB8);
  sub_23B92F2F8(v13, v12, (uint64_t (*)(_QWORD))type metadata accessor for MessagingOptions);
  swift_bridgeObjectRetain_n();
  v15 = sub_23B958304();
  v16 = sub_23B958568();
  v17 = os_log_type_enabled(v15, v16);
  v18 = *(_QWORD *)(v50 + 112);
  if (v17)
  {
    v19 = swift_slowAlloc();
    v48 = swift_slowAlloc();
    v51 = v48;
    *(_DWORD *)v19 = 136315650;
    v23 = sub_23B93A46C(v48, v20, v21, v22);
    *(_QWORD *)(v50 + 32) = sub_23B9287E0(v23, v24, &v51);
    sub_23B9585A4();
    swift_bridgeObjectRelease();
    *(_WORD *)(v19 + 12) = 2080;
    swift_bridgeObjectRetain();
    v25 = sub_23B958514();
    v27 = v26;
    swift_bridgeObjectRelease();
    *(_QWORD *)(v50 + 40) = sub_23B9287E0(v25, v27, &v51);
    sub_23B9585A4();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v19 + 22) = 2082;
    sub_23B9582F8();
    sub_23B92F2B8(&qword_256A55510, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAB8]);
    v28 = sub_23B9587F0();
    *(_QWORD *)(v50 + 48) = sub_23B9287E0(v28, v29, &v51);
    sub_23B9585A4();
    swift_bridgeObjectRelease();
    sub_23B92F33C(v18, (uint64_t (*)(_QWORD))type metadata accessor for MessagingOptions);
    _os_log_impl(&dword_23B916000, v15, v16, "%s: Sending raw dictionary to %s with identifier: %{public}s", (uint8_t *)v19, 0x20u);
    swift_arrayDestroy();
    MEMORY[0x242609864](v48, -1, -1);
    MEMORY[0x242609864](v19, -1, -1);

  }
  else
  {
    swift_bridgeObjectRelease_n();
    sub_23B92F33C(v18, (uint64_t (*)(_QWORD))type metadata accessor for MessagingOptions);

  }
  sub_23B92F2F8(*(_QWORD *)(v50 + 72), *(_QWORD *)(v50 + 104), (uint64_t (*)(_QWORD))type metadata accessor for MessagingOptions);
  v30 = sub_23B958304();
  v31 = sub_23B958568();
  v32 = os_log_type_enabled(v30, v31);
  v33 = *(_QWORD *)(v50 + 104);
  if (v32)
  {
    v34 = swift_slowAlloc();
    v49 = swift_slowAlloc();
    v51 = v49;
    *(_DWORD *)v34 = 136446466;
    v38 = sub_23B93A46C(v49, v35, v36, v37);
    *(_QWORD *)(v50 + 16) = sub_23B9287E0(v38, v39, &v51);
    sub_23B9585A4();
    swift_bridgeObjectRelease();
    *(_WORD *)(v34 + 12) = 2080;
    MessagingOptions.dictionaryValue.getter();
    v40 = sub_23B958358();
    v42 = v41;
    swift_bridgeObjectRelease();
    *(_QWORD *)(v50 + 24) = sub_23B9287E0(v40, v42, &v51);
    sub_23B9585A4();
    swift_bridgeObjectRelease();
    sub_23B92F33C(v33, (uint64_t (*)(_QWORD))type metadata accessor for MessagingOptions);
    _os_log_impl(&dword_23B916000, v30, v31, "%{public}s: IDSSendMessageOptions: %s", (uint8_t *)v34, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x242609864](v49, -1, -1);
    MEMORY[0x242609864](v34, -1, -1);
  }
  else
  {
    sub_23B92F33C(*(_QWORD *)(v50 + 104), (uint64_t (*)(_QWORD))type metadata accessor for MessagingOptions);
  }

  v43 = *(_QWORD *)(v50 + 80);
  v44 = swift_task_alloc();
  *(_QWORD *)(v50 + 128) = v44;
  v45 = *(_OWORD *)(v50 + 64);
  *(_QWORD *)(v44 + 16) = v43;
  *(_QWORD *)(v44 + 24) = v11;
  *(_OWORD *)(v44 + 32) = v45;
  v46 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v50 + 136) = v46;
  sub_23B9582F8();
  *v46 = v50;
  v46[1] = sub_23B9222EC;
  return sub_23B95819C();
}

uint64_t sub_23B94024C(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  unint64_t v18;
  _QWORD *v19;
  uint64_t v21;

  v10 = *a2;
  v11 = type metadata accessor for MessagingOptions();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = *(_QWORD *)(v12 + 64);
  MEMORY[0x24BDAC7A8](v11);
  v14 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254309C80);
  MEMORY[0x24BDAC7A8](v14);
  v16 = (char *)&v21 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = sub_23B9584F0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 56))(v16, 1, 1, v17);
  sub_23B92F2F8(a5, (uint64_t)&v21 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(_QWORD))type metadata accessor for MessagingOptions);
  v18 = (*(unsigned __int8 *)(v12 + 80) + 72) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
  v19 = (_QWORD *)swift_allocObject();
  v19[2] = 0;
  v19[3] = 0;
  v19[4] = *(_QWORD *)(v10 + 80);
  v19[5] = *(_QWORD *)(v10 + 88);
  v19[6] = a2;
  v19[7] = a3;
  v19[8] = a4;
  sub_23B92F378((uint64_t)&v21 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t)v19 + v18, (uint64_t (*)(_QWORD))type metadata accessor for MessagingOptions);
  *(_QWORD *)((char *)v19 + ((v13 + v18 + 7) & 0xFFFFFFFFFFFFFFF8)) = a1;
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  sub_23B94CA58((uint64_t)v16, (uint64_t)&unk_256A559A8, (uint64_t)v19);
  return swift_release();
}

uint64_t sub_23B9403DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  _QWORD *v13;

  v13 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v8 + 16) = v13;
  *v13 = v8;
  v13[1] = sub_23B930844;
  return sub_23B940458(a5, a6, a7, a8);
}

uint64_t sub_23B940458(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v5[15] = a4;
  v5[16] = v4;
  v5[13] = a2;
  v5[14] = a3;
  v5[12] = a1;
  v5[17] = *v4;
  v5[18] = *v4;
  v6 = type metadata accessor for MessagingOptions();
  v5[19] = v6;
  v7 = *(_QWORD *)(v6 - 8);
  v5[20] = v7;
  v5[21] = *(_QWORD *)(v7 + 64);
  v5[22] = swift_task_alloc();
  v5[23] = swift_task_alloc();
  v8 = sub_23B9582F8();
  v5[24] = v8;
  v5[25] = *(_QWORD *)(v8 - 8);
  v5[26] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23B94050C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v1 = v0[25];
  v2 = v0[26];
  v3 = v0[24];
  v13 = v0[23];
  v14 = v0[20];
  v4 = v0[18];
  v5 = v0[16];
  v7 = v0[14];
  v6 = v0[15];
  v15 = v0[21];
  v16 = v0[13];
  v17 = v0[12];
  v18 = v0[17];
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v1 + 16))(v2, v7, v3);
  swift_beginAccess();
  swift_retain();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v19 = *(_QWORD *)(v5 + 144);
  *(_QWORD *)(v5 + 144) = 0x8000000000000000;
  sub_23B936920(v6, v2, isUniquelyReferenced_nonNull_native);
  *(_QWORD *)(v5 + 144) = v19;
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v1 + 8))(v2, v3);
  swift_endAccess();
  sub_23B92F2F8(v7, v13, (uint64_t (*)(_QWORD))type metadata accessor for MessagingOptions);
  v9 = (*(unsigned __int8 *)(v14 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80);
  v10 = (_QWORD *)swift_allocObject();
  v0[27] = v10;
  v10[2] = *(_QWORD *)(v4 + 80);
  v10[3] = *(_QWORD *)(v4 + 88);
  v10[4] = v5;
  v10[5] = v16;
  v10[6] = v17;
  sub_23B92F378(v13, (uint64_t)v10 + v9, (uint64_t (*)(_QWORD))type metadata accessor for MessagingOptions);
  *(_QWORD *)((char *)v10 + ((v15 + v9 + 7) & 0xFFFFFFFFFFFFFFF8)) = v18;
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v11 = (_QWORD *)swift_task_alloc();
  v0[28] = v11;
  *v11 = v0;
  v11[1] = sub_23B940704;
  return sub_23B958160();
}

uint64_t sub_23B940704()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 232) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_release();
  return swift_task_switch();
}

uint64_t sub_23B940778()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  id v6;
  NSObject *v7;
  os_log_type_t v8;
  _BOOL4 v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  id v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  _QWORD *v25;
  uint64_t v26;
  uint64_t v27;

  swift_release();
  if (qword_254309BD0 != -1)
    swift_once();
  v1 = *(void **)(v0 + 232);
  v2 = *(_QWORD *)(v0 + 176);
  v3 = *(_QWORD *)(v0 + 112);
  v4 = sub_23B95831C();
  __swift_project_value_buffer(v4, (uint64_t)qword_254309BB8);
  sub_23B92F2F8(v3, v2, (uint64_t (*)(_QWORD))type metadata accessor for MessagingOptions);
  v5 = v1;
  v6 = v1;
  v7 = sub_23B958304();
  v8 = sub_23B958568();
  v9 = os_log_type_enabled(v7, v8);
  v10 = *(void **)(v0 + 232);
  if (v9)
  {
    v11 = *(_QWORD *)(v0 + 176);
    v12 = swift_slowAlloc();
    v25 = (_QWORD *)swift_slowAlloc();
    v26 = swift_slowAlloc();
    v27 = v26;
    *(_DWORD *)v12 = 136446722;
    v16 = sub_23B93A46C(v26, v13, v14, v15);
    *(_QWORD *)(v0 + 72) = sub_23B9287E0(v16, v17, &v27);
    sub_23B9585A4();
    swift_bridgeObjectRelease();
    *(_WORD *)(v12 + 12) = 2082;
    sub_23B92F2B8(&qword_256A55510, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAB8]);
    v18 = sub_23B9587F0();
    *(_QWORD *)(v0 + 80) = sub_23B9287E0(v18, v19, &v27);
    sub_23B9585A4();
    swift_bridgeObjectRelease();
    sub_23B92F33C(v11, (uint64_t (*)(_QWORD))type metadata accessor for MessagingOptions);
    *(_WORD *)(v12 + 22) = 2114;
    v20 = v10;
    v21 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v0 + 88) = v21;
    sub_23B9585A4();
    *v25 = v21;

    _os_log_impl(&dword_23B916000, v7, v8, "%{public}s: Failed to send raw dictionary with identifier: %{public}s. Error: %{public}@.", (uint8_t *)v12, 0x20u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256A555C8);
    swift_arrayDestroy();
    MEMORY[0x242609864](v25, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x242609864](v26, -1, -1);
    MEMORY[0x242609864](v12, -1, -1);
  }
  else
  {
    sub_23B92F33C(*(_QWORD *)(v0 + 176), (uint64_t (*)(_QWORD))type metadata accessor for MessagingOptions);

  }
  v22 = *(void **)(v0 + 232);
  v23 = *(_QWORD *)(v0 + 112);
  *(_QWORD *)(v0 + 64) = v22;
  sub_23B958178();
  swift_beginAccess();
  sub_23B945D2C(v23);
  swift_endAccess();
  swift_release();

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23B940AE0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;

  v8[12] = a7;
  v8[13] = a8;
  v8[10] = a5;
  v8[11] = a6;
  v8[8] = a3;
  v8[9] = a4;
  v8[7] = a2;
  v9 = type metadata accessor for Message(0, *(_QWORD *)(*(_QWORD *)a2 + 80), *(_QWORD *)(*(_QWORD *)a2 + 88), a4);
  v8[14] = v9;
  v8[15] = *(_QWORD *)(v9 - 8);
  v8[16] = swift_task_alloc();
  v8[17] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254309A30);
  v8[18] = swift_task_alloc();
  v10 = sub_23B9582F8();
  v8[19] = v10;
  v8[20] = *(_QWORD *)(v10 - 8);
  v8[21] = swift_task_alloc();
  v8[22] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23B940BEC()
{
  _QWORD *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  _BYTE *v17;
  uint64_t (*v18)(void);
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  os_log_type_t v28;
  _BOOL4 v29;
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
  unint64_t v42;
  void (*v43)(uint64_t, uint64_t);
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  unint64_t v47;
  uint64_t v48;
  unint64_t v49;
  void (*v50)(uint64_t, uint64_t);
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void (*type)(uint64_t, uint64_t, uint64_t);
  os_log_type_t typea;
  os_log_t log;
  NSObject *loga;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  uint64_t v64[2];

  v64[1] = *MEMORY[0x24BDAC8D0];
  v1 = v0[10];
  v2 = *(void **)(v0[7] + 128);
  v3 = (void *)sub_23B958274();
  sub_23B939934(v1);
  v4 = (void *)sub_23B9584FC();
  swift_bridgeObjectRelease();
  v5 = MessagingOptions.dictionaryValue.getter();
  sub_23B939C24(v5);
  swift_bridgeObjectRelease();
  v6 = (void *)sub_23B958340();
  swift_bridgeObjectRelease();
  v0[2] = 0;
  v0[3] = 0;
  LODWORD(v2) = objc_msgSend(v2, sel_sendData_toDestinations_priority_options_identifier_error_, v3, v4, 300, v6, v0 + 2, v0 + 3);

  v7 = (void *)v0[3];
  v8 = (void *)v0[2];
  if (!(_DWORD)v2)
  {
    v14 = v7;
    v15 = v8;
    sub_23B958220();

LABEL_8:
    swift_willThrow();

    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    v18 = (uint64_t (*)(void))v0[1];
    return v18();
  }
  if (!v8)
  {
    v16 = v7;
    goto LABEL_7;
  }
  v9 = v0[19];
  v10 = v0[20];
  v11 = v0[18];
  sub_23B9583DC();
  v12 = v7;
  v13 = v8;
  sub_23B9582C8();
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(v11, 1, v9) == 1)
  {
    sub_23B930790(v0[18], &qword_254309A30);
LABEL_7:
    sub_23B91AC50();
    swift_allocError();
    *v17 = 0;
    goto LABEL_8;
  }
  v63 = v13;
  (*(void (**)(_QWORD, _QWORD, _QWORD))(v0[20] + 32))(v0[22], v0[18], v0[19]);
  if (qword_254309BD0 != -1)
    swift_once();
  v20 = v0[20];
  log = (os_log_t)v0[21];
  v61 = v0[22];
  v21 = v0[19];
  v22 = v0[17];
  v24 = v0[14];
  v23 = v0[15];
  v25 = v0[12];
  v26 = sub_23B95831C();
  __swift_project_value_buffer(v26, (uint64_t)qword_254309BB8);
  type = *(void (**)(uint64_t, uint64_t, uint64_t))(v23 + 16);
  type(v22, v25, v24);
  (*(void (**)(os_log_t, uint64_t, uint64_t))(v20 + 16))(log, v61, v21);
  v27 = sub_23B958304();
  v28 = sub_23B958568();
  v29 = os_log_type_enabled(v27, v28);
  v31 = v0[21];
  v30 = v0[22];
  v32 = v0[19];
  v33 = v0[20];
  v34 = v0[17];
  if (v29)
  {
    v54 = v0[19];
    v55 = v0[21];
    loga = v27;
    v62 = v0[22];
    v35 = v0[16];
    v53 = v0[15];
    v36 = v0[14];
    v37 = swift_slowAlloc();
    v56 = swift_slowAlloc();
    v64[0] = v56;
    *(_DWORD *)v37 = 136446722;
    v41 = sub_23B93A46C(v56, v38, v39, v40);
    v0[4] = sub_23B9287E0(v41, v42, v64);
    sub_23B9585A4();
    swift_bridgeObjectRelease();
    *(_WORD *)(v37 + 12) = 2082;
    type(v35, v34, v36);
    typea = v28;
    v43 = *(void (**)(uint64_t, uint64_t))(v53 + 8);
    v43(v34, v36);
    Message.description.getter(v36);
    v45 = v44;
    v47 = v46;
    v43(v35, v36);
    v0[5] = sub_23B9287E0(v45, v47, v64);
    sub_23B9585A4();
    swift_bridgeObjectRelease();
    *(_WORD *)(v37 + 22) = 2082;
    sub_23B92F2B8(&qword_256A55510, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAB8]);
    v48 = sub_23B9587F0();
    v0[6] = sub_23B9287E0(v48, v49, v64);
    sub_23B9585A4();
    swift_bridgeObjectRelease();
    v50 = *(void (**)(uint64_t, uint64_t))(v33 + 8);
    v50(v55, v54);
    _os_log_impl(&dword_23B916000, loga, typea, "%{public}s: Sent message %{public}s with identifier: %{public}s", (uint8_t *)v37, 0x20u);
    swift_arrayDestroy();
    MEMORY[0x242609864](v56, -1, -1);
    MEMORY[0x242609864](v37, -1, -1);

    v51 = v62;
    v52 = v54;
  }
  else
  {
    (*(void (**)(_QWORD, _QWORD))(v0[15] + 8))(v0[17], v0[14]);

    v50 = *(void (**)(uint64_t, uint64_t))(v33 + 8);
    v50(v31, v32);
    v51 = v30;
    v52 = v32;
  }
  v50(v51, v52);

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  v18 = (uint64_t (*)(void))v0[1];
  return v18();
}

uint64_t sub_23B9411A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;

  v8[13] = a7;
  v8[14] = a8;
  v8[11] = a5;
  v8[12] = a6;
  v8[9] = a3;
  v8[10] = a4;
  v8[8] = a2;
  v9 = type metadata accessor for Message(0, *(_QWORD *)(*(_QWORD *)a2 + 80), *(_QWORD *)(*(_QWORD *)a2 + 88), a4);
  v8[15] = v9;
  v8[16] = *(_QWORD *)(v9 - 8);
  v8[17] = swift_task_alloc();
  v8[18] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254309A30);
  v8[19] = swift_task_alloc();
  v10 = sub_23B9582F8();
  v8[20] = v10;
  v8[21] = *(_QWORD *)(v10 - 8);
  v8[22] = swift_task_alloc();
  v8[23] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23B9412B0()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  unsigned int v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _BYTE *v19;
  uint64_t (*v20)(void);
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  os_log_type_t v31;
  _BOOL4 v32;
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
  uint64_t v43;
  unint64_t v44;
  void (*v45)(uint64_t, uint64_t);
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  unint64_t v49;
  uint64_t v50;
  unint64_t v51;
  void (*v52)(uint64_t, uint64_t);
  id v53;
  void *v54;
  unsigned int v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  id v59;
  uint64_t v60;
  id v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  void (*v66)(uint64_t, uint64_t, uint64_t);
  os_log_type_t type[8];
  os_log_type_t typea;
  void *v69;
  uint64_t v70[2];

  v70[1] = *MEMORY[0x24BDAC8D0];
  v1 = v0[11];
  v2 = v0[10];
  v3 = *(void **)(v0[8] + 128);
  v4 = (void *)sub_23B958238();
  sub_23B939FE8(v2);
  v5 = (void *)sub_23B958340();
  swift_bridgeObjectRelease();
  sub_23B939934(v1);
  v6 = (void *)sub_23B9584FC();
  swift_bridgeObjectRelease();
  v7 = MessagingOptions.dictionaryValue.getter();
  sub_23B939C24(v7);
  swift_bridgeObjectRelease();
  v8 = (void *)sub_23B958340();
  swift_bridgeObjectRelease();
  v0[2] = 0;
  v0[3] = 0;
  v9 = objc_msgSend(v3, sel_sendResourceAtURL_metadata_toDestinations_priority_options_identifier_error_, v4, v5, v6, 300, v8, v0 + 2, v0 + 3);

  v10 = (void *)v0[3];
  v11 = (id)v0[2];
  if (!v9)
  {
    v17 = v10;
    v11 = v11;
    sub_23B958220();

LABEL_8:
    swift_willThrow();
    goto LABEL_9;
  }
  if (!v11)
  {
    v18 = v10;
    goto LABEL_7;
  }
  v12 = v0[20];
  v13 = v0[21];
  v14 = v0[19];
  sub_23B9583DC();
  v15 = v10;
  v16 = v11;
  sub_23B9582C8();
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v13 + 48))(v14, 1, v12) == 1)
  {
    sub_23B930790(v0[19], &qword_254309A30);
LABEL_7:
    sub_23B91AC50();
    swift_allocError();
    *v19 = 0;
    goto LABEL_8;
  }
  v69 = v16;
  (*(void (**)(_QWORD, _QWORD, _QWORD))(v0[21] + 32))(v0[23], v0[19], v0[20]);
  if (qword_254309BD0 != -1)
    swift_once();
  v22 = v0[22];
  *(_QWORD *)type = v0[23];
  v23 = v0[20];
  v24 = v0[21];
  v25 = v0[18];
  v27 = v0[15];
  v26 = v0[16];
  v28 = v0[13];
  v29 = sub_23B95831C();
  __swift_project_value_buffer(v29, (uint64_t)qword_254309BB8);
  v66 = *(void (**)(uint64_t, uint64_t, uint64_t))(v26 + 16);
  v66(v25, v28, v27);
  (*(void (**)(uint64_t, os_log_type_t *, uint64_t))(v24 + 16))(v22, *(os_log_type_t **)type, v23);
  v30 = sub_23B958304();
  v31 = sub_23B958568();
  v32 = os_log_type_enabled(v30, v31);
  v34 = v0[21];
  v33 = v0[22];
  v35 = v0[20];
  v36 = v0[18];
  if (v32)
  {
    v63 = v0[22];
    v37 = v0[17];
    v62 = v0[16];
    v64 = v0[21];
    typea = v31;
    v38 = v0[15];
    v39 = swift_slowAlloc();
    v65 = swift_slowAlloc();
    v70[0] = v65;
    *(_DWORD *)v39 = 136446722;
    v43 = sub_23B93A46C(v65, v40, v41, v42);
    v0[5] = sub_23B9287E0(v43, v44, v70);
    sub_23B9585A4();
    swift_bridgeObjectRelease();
    *(_WORD *)(v39 + 12) = 2082;
    v66(v37, v36, v38);
    v45 = *(void (**)(uint64_t, uint64_t))(v62 + 8);
    v45(v36, v38);
    Message.description.getter(v38);
    v47 = v46;
    v49 = v48;
    v45(v37, v38);
    v0[6] = sub_23B9287E0(v47, v49, v70);
    sub_23B9585A4();
    swift_bridgeObjectRelease();
    *(_WORD *)(v39 + 22) = 2082;
    sub_23B92F2B8(&qword_256A55510, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAB8]);
    v50 = sub_23B9587F0();
    v0[7] = sub_23B9287E0(v50, v51, v70);
    sub_23B9585A4();
    swift_bridgeObjectRelease();
    v52 = *(void (**)(uint64_t, uint64_t))(v64 + 8);
    v52(v63, v35);
    _os_log_impl(&dword_23B916000, v30, typea, "%{public}s: Sent message (resource) %{public}s with identifier: %{public}s", (uint8_t *)v39, 0x20u);
    swift_arrayDestroy();
    MEMORY[0x242609864](v65, -1, -1);
    MEMORY[0x242609864](v39, -1, -1);

  }
  else
  {
    (*(void (**)(_QWORD, _QWORD))(v0[16] + 8))(v0[18], v0[15]);
    v52 = *(void (**)(uint64_t, uint64_t))(v34 + 8);
    v52(v33, v35);

  }
  v53 = objc_msgSend((id)objc_opt_self(), sel_defaultManager);
  v54 = (void *)sub_23B958238();
  v0[4] = 0;
  v55 = objc_msgSend(v53, sel_removeItemAtURL_error_, v54, v0 + 4);

  v56 = (void *)v0[4];
  v57 = v0[23];
  if (v55)
  {
    v58 = v0[20];
    v59 = v56;
    v52(v57, v58);

    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    v20 = (uint64_t (*)(void))v0[1];
    return v20();
  }
  v60 = v0[20];
  v61 = v56;
  sub_23B958220();

  swift_willThrow();
  v52(v57, v60);
  v11 = v69;
LABEL_9:

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  v20 = (uint64_t (*)(void))v0[1];
  return v20();
}

uint64_t sub_23B941940(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;

  v5[6] = a4;
  v5[7] = a5;
  v5[5] = a3;
  v8 = *a2;
  type metadata accessor for MessagingOptions();
  v5[8] = swift_task_alloc();
  v10 = type metadata accessor for Message(0, *(_QWORD *)(v8 + 80), *(_QWORD *)(v8 + 88), v9);
  v5[9] = v10;
  v5[10] = *(_QWORD *)(v10 - 8);
  v5[11] = swift_task_alloc();
  v5[12] = swift_task_alloc();
  v11 = sub_23B9582F8();
  v5[13] = v11;
  v5[14] = *(_QWORD *)(v11 - 8);
  v12 = swift_task_alloc();
  v5[15] = v12;
  v13 = (_QWORD *)swift_task_alloc();
  v5[16] = v13;
  *v13 = v5;
  v13[1] = sub_23B941A40;
  return LocalMessaging.send(message:messageOptions:)(v12, a3, a4);
}

uint64_t sub_23B941A40()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  v2 = *(_QWORD **)v1;
  *(_QWORD *)(*(_QWORD *)v1 + 136) = v0;
  swift_task_dealloc();
  if (!v0)
    (*(void (**)(_QWORD, _QWORD))(v2[14] + 8))(v2[15], v2[13]);
  return swift_task_switch();
}

uint64_t sub_23B941AB4()
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
  void (*v9)(uint64_t, uint64_t, uint64_t);
  NSObject *v10;
  os_log_type_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  void (*v21)(uint64_t, uint64_t);
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  os_log_type_t type;
  uint64_t v34;

  if (qword_254309BD0 != -1)
    swift_once();
  v1 = *(_QWORD *)(v0 + 40);
  v2 = *(_QWORD *)(v0 + 96);
  v3 = *(_QWORD *)(v0 + 72);
  v4 = *(_QWORD *)(v0 + 80);
  v5 = *(_QWORD *)(v0 + 64);
  v6 = *(_QWORD *)(v0 + 48);
  v7 = sub_23B95831C();
  __swift_project_value_buffer(v7, (uint64_t)qword_254309BB8);
  v8 = v3;
  v9 = *(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16);
  v9(v2, v1, v8);
  sub_23B92F2F8(v6, v5, (uint64_t (*)(_QWORD))type metadata accessor for MessagingOptions);
  v10 = sub_23B958304();
  v11 = sub_23B958568();
  if (os_log_type_enabled(v10, v11))
  {
    v12 = *(_QWORD *)(v0 + 96);
    v13 = *(_QWORD *)(v0 + 88);
    v30 = *(_QWORD *)(v0 + 80);
    v14 = *(_QWORD *)(v0 + 72);
    v31 = *(_QWORD *)(v0 + 64);
    type = v11;
    v15 = swift_slowAlloc();
    v32 = swift_slowAlloc();
    v34 = v32;
    *(_DWORD *)v15 = 136446722;
    v19 = sub_23B93A46C(v32, v16, v17, v18);
    *(_QWORD *)(v0 + 16) = sub_23B9287E0(v19, v20, &v34);
    sub_23B9585A4();
    swift_bridgeObjectRelease();
    *(_WORD *)(v15 + 12) = 2082;
    v9(v13, v12, v14);
    v21 = *(void (**)(uint64_t, uint64_t))(v30 + 8);
    v21(v12, v14);
    Message.description.getter(v14);
    v23 = v22;
    v25 = v24;
    v21(v13, v14);
    *(_QWORD *)(v0 + 24) = sub_23B9287E0(v23, v25, &v34);
    sub_23B9585A4();
    swift_bridgeObjectRelease();
    *(_WORD *)(v15 + 22) = 2082;
    sub_23B92F2B8(&qword_256A55510, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAB8]);
    v26 = sub_23B9587F0();
    *(_QWORD *)(v0 + 32) = sub_23B9287E0(v26, v27, &v34);
    sub_23B9585A4();
    swift_bridgeObjectRelease();
    sub_23B92F33C(v31, (uint64_t (*)(_QWORD))type metadata accessor for MessagingOptions);
    _os_log_impl(&dword_23B916000, v10, type, "%{public}s: Sent message (with response) %{public}s with identifier: %{public}s", (uint8_t *)v15, 0x20u);
    swift_arrayDestroy();
    MEMORY[0x242609864](v32, -1, -1);
    MEMORY[0x242609864](v15, -1, -1);
  }
  else
  {
    v28 = *(_QWORD *)(v0 + 64);
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 80) + 8))(*(_QWORD *)(v0 + 96), *(_QWORD *)(v0 + 72));
    sub_23B92F33C(v28, (uint64_t (*)(_QWORD))type metadata accessor for MessagingOptions);
  }

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23B941DEC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;
  uint64_t v7;

  v6[9] = a5;
  v6[10] = a6;
  v6[7] = a3;
  v6[8] = a4;
  v6[6] = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254309A30);
  v6[11] = swift_task_alloc();
  v7 = sub_23B9582F8();
  v6[12] = v7;
  v6[13] = *(_QWORD *)(v7 - 8);
  v6[14] = swift_task_alloc();
  v6[15] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23B941EB4()
{
  _QWORD *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  _BYTE *v17;
  uint64_t (*v18)(void);
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  os_log_type_t v26;
  _BOOL4 v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  unint64_t v39;
  void (*v40)(uint64_t, uint64_t);
  uint64_t v41;
  void *v42;
  uint64_t v43[2];

  v43[1] = *MEMORY[0x24BDAC8D0];
  v1 = v0[8];
  v2 = *(void **)(v0[6] + 128);
  sub_23B939FE8(v0[7]);
  v3 = (void *)sub_23B958340();
  swift_bridgeObjectRelease();
  sub_23B939934(v1);
  v4 = (void *)sub_23B9584FC();
  swift_bridgeObjectRelease();
  v5 = MessagingOptions.dictionaryValue.getter();
  sub_23B939C24(v5);
  swift_bridgeObjectRelease();
  v6 = (void *)sub_23B958340();
  swift_bridgeObjectRelease();
  v0[2] = 0;
  v0[3] = 0;
  LODWORD(v2) = objc_msgSend(v2, sel_sendMessage_toDestinations_priority_options_identifier_error_, v3, v4, 300, v6, v0 + 2, v0 + 3);

  v7 = (void *)v0[3];
  v8 = (void *)v0[2];
  if (!(_DWORD)v2)
  {
    v14 = v7;
    v15 = v8;
    sub_23B958220();

LABEL_8:
    swift_willThrow();

    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    v18 = (uint64_t (*)(void))v0[1];
    return v18();
  }
  if (!v8)
  {
    v16 = v7;
    goto LABEL_7;
  }
  v9 = v0[12];
  v10 = v0[13];
  v11 = v0[11];
  sub_23B9583DC();
  v12 = v7;
  v13 = v8;
  sub_23B9582C8();
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(v11, 1, v9) == 1)
  {
    sub_23B930790(v0[11], &qword_254309A30);
LABEL_7:
    sub_23B91AC50();
    swift_allocError();
    *v17 = 0;
    goto LABEL_8;
  }
  v42 = v13;
  (*(void (**)(_QWORD, _QWORD, _QWORD))(v0[13] + 32))(v0[15], v0[11], v0[12]);
  if (qword_254309BD0 != -1)
    swift_once();
  v21 = v0[14];
  v20 = v0[15];
  v22 = v0[12];
  v23 = v0[13];
  v24 = sub_23B95831C();
  __swift_project_value_buffer(v24, (uint64_t)qword_254309BB8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v23 + 16))(v21, v20, v22);
  v25 = sub_23B958304();
  v26 = sub_23B958568();
  v27 = os_log_type_enabled(v25, v26);
  v29 = v0[14];
  v28 = v0[15];
  v31 = v0[12];
  v30 = v0[13];
  if (v27)
  {
    v32 = swift_slowAlloc();
    v41 = swift_slowAlloc();
    v43[0] = v41;
    *(_DWORD *)v32 = 136446466;
    v36 = sub_23B93A46C(v41, v33, v34, v35);
    v0[4] = sub_23B9287E0(v36, v37, v43);
    sub_23B9585A4();
    swift_bridgeObjectRelease();
    *(_WORD *)(v32 + 12) = 2082;
    sub_23B92F2B8(&qword_256A55510, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAB8]);
    v38 = sub_23B9587F0();
    v0[5] = sub_23B9287E0(v38, v39, v43);
    sub_23B9585A4();
    swift_bridgeObjectRelease();
    v40 = *(void (**)(uint64_t, uint64_t))(v30 + 8);
    v40(v29, v31);
    _os_log_impl(&dword_23B916000, v25, v26, "%{public}s: Sent raw dictionary to with identifier: %{public}s", (uint8_t *)v32, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x242609864](v41, -1, -1);
    MEMORY[0x242609864](v32, -1, -1);

  }
  else
  {

    v40 = *(void (**)(uint64_t, uint64_t))(v30 + 8);
    v40(v29, v31);
  }
  v40(v28, v31);

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  v18 = (uint64_t (*)(void))v0[1];
  return v18();
}

uint64_t sub_23B942380(uint64_t a1, uint64_t a2, _QWORD *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  _QWORD *v7;
  uint64_t v8;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t TupleTypeMetadata2;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  *(_QWORD *)(v8 + 352) = a7;
  *(_QWORD *)(v8 + 360) = v7;
  *(_QWORD *)(v8 + 336) = a4;
  *(_QWORD *)(v8 + 344) = a5;
  *(_QWORD *)(v8 + 320) = a1;
  *(_QWORD *)(v8 + 328) = a2;
  *(_QWORD *)(v8 + 368) = *v7;
  v11 = *v7;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254309C80);
  *(_QWORD *)(v8 + 376) = swift_task_alloc();
  v12 = *(_QWORD *)(v11 + 80);
  *(_QWORD *)(v8 + 384) = v12;
  v13 = *(_QWORD *)(v11 + 88);
  *(_QWORD *)(v8 + 392) = v13;
  v15 = type metadata accessor for Message(255, v12, v13, v14);
  *(_QWORD *)(v8 + 400) = v15;
  v16 = type metadata accessor for MessageContext();
  *(_QWORD *)(v8 + 408) = v16;
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  *(_QWORD *)(v8 + 416) = TupleTypeMetadata2;
  *(_QWORD *)(v8 + 424) = *(_QWORD *)(TupleTypeMetadata2 - 8);
  *(_QWORD *)(v8 + 432) = swift_task_alloc();
  v18 = sub_23B9582F8();
  *(_QWORD *)(v8 + 440) = v18;
  *(_QWORD *)(v8 + 448) = *(_QWORD *)(v18 - 8);
  *(_QWORD *)(v8 + 456) = swift_task_alloc();
  *(_QWORD *)(v8 + 464) = swift_task_alloc();
  *(_QWORD *)(v8 + 472) = swift_task_alloc();
  *(_QWORD *)(v8 + 480) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254309A30);
  *(_QWORD *)(v8 + 488) = swift_task_alloc();
  *(_QWORD *)(v8 + 496) = swift_task_alloc();
  *(_QWORD *)(v8 + 504) = type metadata accessor for MessagingOptions();
  *(_QWORD *)(v8 + 512) = swift_task_alloc();
  *(_QWORD *)(v8 + 520) = swift_task_alloc();
  v19 = *(_QWORD *)(v16 - 8);
  *(_QWORD *)(v8 + 528) = v19;
  *(_QWORD *)(v8 + 536) = *(_QWORD *)(v19 + 64);
  *(_QWORD *)(v8 + 544) = swift_task_alloc();
  *(_QWORD *)(v8 + 552) = swift_task_alloc();
  *(_QWORD *)(v8 + 560) = swift_task_alloc();
  v20 = *(_QWORD *)(v15 - 8);
  *(_QWORD *)(v8 + 568) = v20;
  *(_QWORD *)(v8 + 576) = *(_QWORD *)(v20 + 64);
  *(_QWORD *)(v8 + 584) = swift_task_alloc();
  *(_QWORD *)(v8 + 592) = swift_task_alloc();
  *(_QWORD *)(v8 + 600) = swift_task_alloc();
  *(_QWORD *)(v8 + 608) = swift_task_alloc();
  *(_QWORD *)(v8 + 616) = swift_task_alloc();
  *(_QWORD *)(v8 + 624) = swift_task_alloc();
  *(_QWORD *)(v8 + 632) = swift_task_alloc();
  v21 = a3[1];
  *(_QWORD *)(v8 + 640) = *a3;
  *(_QWORD *)(v8 + 648) = v21;
  *(_BYTE *)(v8 + 744) = *(_BYTE *)a6;
  v22 = *(_QWORD *)(a6 + 16);
  *(_QWORD *)(v8 + 656) = *(_QWORD *)(a6 + 8);
  *(_QWORD *)(v8 + 664) = v22;
  return swift_task_switch();
}

uint64_t sub_23B9425F0()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  BOOL v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t, uint64_t);
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, uint64_t, uint64_t);
  NSObject *v24;
  os_log_type_t v25;
  _BOOL4 v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  unint64_t v38;
  void (*v39)(uint64_t, uint64_t);
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  unint64_t v43;
  uint64_t v44;
  NSObject *v45;
  os_log_type_t v46;
  unint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  _QWORD *v76;
  uint64_t v77;
  NSObject *v78;
  os_log_type_t v79;
  _BOOL4 v80;
  unint64_t v81;
  uint64_t v82;
  uint64_t v83;
  unint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  unint64_t v90;
  uint64_t v91;
  unint64_t v92;
  uint64_t v93;
  void (*v94)(uint64_t, uint64_t);
  uint64_t v95;
  uint64_t v96;
  unint64_t v97;
  unint64_t v98;
  uint64_t v99;
  unint64_t v100;
  uint64_t v101;
  NSObject *v102;
  os_log_type_t v103;
  _BOOL4 v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint8_t *v108;
  _QWORD *v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  unint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  char v120;
  uint64_t v121;
  unint64_t v122;
  _QWORD *v123;
  uint64_t v124;
  NSObject *v125;
  os_log_type_t v126;
  _BOOL4 v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  _QWORD *v131;
  uint8_t *v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  unint64_t v138;
  uint8_t *v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  void (*v160)(uint64_t, uint64_t, uint64_t);
  NSObject *v161;
  os_log_type_t v162;
  _BOOL4 v163;
  unint64_t v164;
  uint64_t v165;
  unint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  unint64_t v172;
  void (*v173)(uint64_t, uint64_t);
  uint64_t v174;
  uint64_t v175;
  unint64_t v176;
  unint64_t v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  unint64_t v189;
  unint64_t v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  NSObject *log;
  uint64_t loga;
  uint64_t logb;
  os_log_t logc[2];
  os_log_t v205;
  NSObject *v206;
  os_log_type_t type;
  uint64_t v208;
  uint64_t v209;
  void (*v210)(uint64_t, uint64_t, uint64_t);
  uint64_t v211;
  uint64_t v212;
  uint64_t v213;
  uint64_t v214;
  uint64_t v215;
  uint64_t v216;
  uint64_t v217;
  char v218;
  uint64_t v219;
  uint64_t v220;
  uint64_t v221;
  uint64_t v222;
  uint64_t v223;
  uint64_t v224;
  uint64_t v225;
  uint64_t v226;
  uint64_t v227;
  void (*v228)(unint64_t, uint64_t, uint64_t);
  void (*v229)(uint64_t, uint64_t);
  os_log_type_t v230;
  os_log_type_t v231;
  void (*v232)(uint64_t, uint64_t);
  void (*v233)(uint64_t, uint64_t, uint64_t);
  int *v234;
  uint64_t v235;
  void (*v236)(uint64_t, uint64_t, uint64_t);
  uint64_t v237;
  int *v238;
  uint64_t v239;
  _QWORD *v240;
  void (*v241)(uint64_t, uint64_t);
  uint64_t v242[3];

  v1 = v0;
  v2 = v0[45];
  v4 = *(_QWORD *)(v2 + 112);
  v3 = *(_QWORD *)(v2 + 120);
  v5 = v4 == v0[40] && v3 == v0[41];
  if (!v5 && (sub_23B958820() & 1) == 0)
  {
    if (qword_254309BD0 != -1)
      swift_once();
    v44 = sub_23B95831C();
    __swift_project_value_buffer(v44, (uint64_t)qword_254309BB8);
    swift_bridgeObjectRetain_n();
    swift_retain_n();
    v45 = sub_23B958304();
    v46 = sub_23B958550();
    if (os_log_type_enabled(v45, v46))
    {
      v47 = v0[41];
      v227 = v0[40];
      v48 = swift_slowAlloc();
      v235 = swift_slowAlloc();
      v242[0] = v235;
      *(_DWORD *)v48 = 136446722;
      v52 = sub_23B93A46C(v235, v49, v50, v51);
      v0[32] = sub_23B9287E0(v52, v53, v242);
      sub_23B9585A4();
      swift_bridgeObjectRelease();
      *(_WORD *)(v48 + 12) = 2082;
      swift_bridgeObjectRetain();
      v0[31] = sub_23B9287E0(v4, v3, v242);
      sub_23B9585A4();
      swift_bridgeObjectRelease();
      swift_release_n();
      *(_WORD *)(v48 + 22) = 2082;
      swift_bridgeObjectRetain();
      v0[23] = sub_23B9287E0(v227, v47, v242);
      sub_23B9585A4();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_23B916000, v45, v46, "%{public}s: Ignoring delegate callback from wrong IDS service! Expected %{public}s, received: %{public}s", (uint8_t *)v48, 0x20u);
      swift_arrayDestroy();
      MEMORY[0x242609864](v235, -1, -1);
      v54 = v48;
      v1 = v0;
      MEMORY[0x242609864](v54, -1, -1);
    }
    else
    {
      swift_release_n();
      swift_bridgeObjectRelease_n();
    }

    goto LABEL_20;
  }
  v6 = v0[50];
  sub_23B9581E4();
  swift_allocObject();
  sub_23B9581D8();
  MEMORY[0x2426097B0](&protocol conformance descriptor for Message<A>, v6);
  sub_23B9581C0();
  v7 = v0[79];
  v8 = v0[78];
  v9 = v0[71];
  v11 = v1[50];
  v10 = v1[51];
  v12 = v1[44];
  swift_release();
  v13 = *(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 32);
  v13(v7, v8, v11);
  if (*(_BYTE *)(v12 + *(int *)(v10 + 36)) != 1)
  {
    v55 = v1[61];
    v56 = v1[55];
    v57 = v1[56];
    sub_23B936898(v1[44], v55);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v57 + 48))(v55, 1, v56) == 1)
    {
      sub_23B930790(v1[61], &qword_254309A30);
    }
    else
    {
      v59 = v1[59];
      v60 = v1[55];
      v61 = v1[45];
      (*(void (**)(uint64_t, _QWORD, uint64_t))(v1[56] + 32))(v59, v1[61], v60);
      swift_beginAccess();
      v62 = *(_QWORD *)(v61 + 152);
      swift_bridgeObjectRetain();
      __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254309C90);
      v63 = sub_23B958190();
      v64 = sub_23B92F2B8((unint64_t *)&qword_254309B00, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
      MEMORY[0x242608EA4](v59, v62, v60, v63, v64);
      swift_bridgeObjectRelease();
      if (v1[20])
      {
        if (qword_254309BD0 != -1)
          swift_once();
        v65 = v1[79];
        v66 = v1[74];
        v67 = v1[71];
        v68 = v1[69];
        v69 = v1[58];
        v209 = v1[59];
        v71 = v1[55];
        v70 = v1[56];
        v240 = v1;
        v72 = v1[50];
        v73 = v240[44];
        v74 = sub_23B95831C();
        __swift_project_value_buffer(v74, (uint64_t)qword_254309BB8);
        sub_23B92F2F8(v73, v68, (uint64_t (*)(_QWORD))type metadata accessor for MessageContext);
        v75 = v72;
        v76 = v240;
        v236 = *(void (**)(uint64_t, uint64_t, uint64_t))(v67 + 16);
        v236(v66, v65, v75);
        v77 = v209;
        v210 = *(void (**)(uint64_t, uint64_t, uint64_t))(v70 + 16);
        v210(v69, v77, v71);
        swift_bridgeObjectRetain_n();
        swift_bridgeObjectRetain_n();
        v78 = sub_23B958304();
        v79 = sub_23B958568();
        v80 = os_log_type_enabled(v78, v79);
        v81 = v240[83];
        if (v80)
        {
          v194 = v240[82];
          v195 = v240[74];
          v196 = v240[76];
          v197 = v240[71];
          v82 = v240[69];
          v198 = v240[58];
          loga = v240[56];
          v193 = v240[55];
          v206 = v78;
          v83 = v240[50];
          type = v79;
          v84 = v240[41];
          v192 = v240[40];
          v85 = swift_slowAlloc();
          v199 = swift_slowAlloc();
          v242[0] = v199;
          *(_DWORD *)v85 = 136316418;
          v89 = sub_23B93A46C(v199, v86, v87, v88);
          v240[24] = sub_23B9287E0(v89, v90, v242);
          sub_23B9585A4();
          swift_bridgeObjectRelease();
          *(_WORD *)(v85 + 12) = 2080;
          sub_23B92F2B8(&qword_256A55510, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAB8]);
          v91 = sub_23B9587F0();
          v240[25] = sub_23B9287E0(v91, v92, v242);
          sub_23B9585A4();
          swift_bridgeObjectRelease();
          v93 = v82;
          v76 = v240;
          sub_23B92F33C(v93, (uint64_t (*)(_QWORD))type metadata accessor for MessageContext);
          *(_WORD *)(v85 + 22) = 2080;
          swift_bridgeObjectRetain();
          v240[26] = sub_23B9287E0(v192, v84, v242);
          sub_23B9585A4();
          swift_bridgeObjectRelease_n();
          *(_WORD *)(v85 + 32) = 2080;
          swift_bridgeObjectRetain();
          v240[27] = sub_23B9287E0(v194, v81, v242);
          sub_23B9585A4();
          swift_bridgeObjectRelease_n();
          *(_WORD *)(v85 + 42) = 2080;
          v236(v196, v195, v83);
          v94 = *(void (**)(uint64_t, uint64_t))(v197 + 8);
          v94(v195, v83);
          Message.description.getter(v83);
          v96 = v95;
          v98 = v97;
          v232 = v94;
          v94(v196, v83);
          v240[28] = sub_23B9287E0(v96, v98, v242);
          sub_23B9585A4();
          swift_bridgeObjectRelease();
          *(_WORD *)(v85 + 52) = 2080;
          v99 = sub_23B9587F0();
          v240[29] = sub_23B9287E0(v99, v100, v242);
          sub_23B9585A4();
          swift_bridgeObjectRelease();
          v229 = *(void (**)(uint64_t, uint64_t))(loga + 8);
          v229(v198, v193);
          _os_log_impl(&dword_23B916000, v206, type, "%s: Received message %s on %s from %s: %s in response to %s", (uint8_t *)v85, 0x3Eu);
          swift_arrayDestroy();
          MEMORY[0x242609864](v199, -1, -1);
          MEMORY[0x242609864](v85, -1, -1);

        }
        else
        {
          v140 = v240[69];
          v141 = v240[58];
          v142 = v240[55];
          v143 = v240[56];
          v232 = *(void (**)(uint64_t, uint64_t))(v240[71] + 8);
          v232(v240[74], v240[50]);
          sub_23B92F33C(v140, (uint64_t (*)(_QWORD))type metadata accessor for MessageContext);
          swift_bridgeObjectRelease_n();
          swift_bridgeObjectRelease_n();
          v229 = *(void (**)(uint64_t, uint64_t))(v143 + 8);
          v229(v141, v142);

        }
        v144 = v76[79];
        v145 = v76[59];
        v146 = v76[57];
        v148 = v76[54];
        v147 = v76[55];
        v149 = v76[53];
        v150 = v240[52];
        v151 = v240[50];
        v152 = v240[44];
        v153 = v148 + *(int *)(v150 + 48);
        v236(v148, v144, v151);
        sub_23B92F2F8(v152, v153, (uint64_t (*)(_QWORD))type metadata accessor for MessageContext);
        sub_23B958184();
        v154 = v150;
        v1 = v240;
        (*(void (**)(uint64_t, uint64_t))(v149 + 8))(v148, v154);
        v210(v146, v145, v147);
        v240[22] = 0;
        swift_beginAccess();
        sub_23B95837C();
        sub_23B958394();
        swift_endAccess();
        swift_release();
        v229(v145, v147);
        v232(v144, v151);
        goto LABEL_20;
      }
      if (qword_254309BD0 != -1)
        swift_once();
      v124 = sub_23B95831C();
      __swift_project_value_buffer(v124, (uint64_t)qword_254309BB8);
      v125 = sub_23B958304();
      v126 = sub_23B958550();
      v127 = os_log_type_enabled(v125, v126);
      v128 = v1[59];
      v129 = v1[55];
      v130 = v1[56];
      if (v127)
      {
        v220 = v1[56];
        v131 = v1;
        v132 = (uint8_t *)swift_slowAlloc();
        v133 = swift_slowAlloc();
        v242[0] = v133;
        *(_DWORD *)v132 = 136315138;
        v137 = sub_23B93A46C(v133, v134, v135, v136);
        v131[21] = sub_23B9287E0(v137, v138, v242);
        sub_23B9585A4();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_23B916000, v125, v126, "%s: Got unexpected response!", v132, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x242609864](v133, -1, -1);
        v139 = v132;
        v1 = v131;
        MEMORY[0x242609864](v139, -1, -1);

        (*(void (**)(uint64_t, uint64_t))(v220 + 8))(v128, v129);
      }
      else
      {

        (*(void (**)(uint64_t, uint64_t))(v130 + 8))(v128, v129);
      }
    }
    v228 = (void (*)(unint64_t, uint64_t, uint64_t))v13;
    if (qword_254309BD0 != -1)
      swift_once();
    v155 = v1[79];
    v156 = v1[73];
    v157 = v1[71];
    v158 = v1[50];
    v159 = sub_23B95831C();
    __swift_project_value_buffer(v159, (uint64_t)qword_254309BB8);
    v160 = *(void (**)(uint64_t, uint64_t, uint64_t))(v157 + 16);
    v160(v156, v155, v158);
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    v161 = sub_23B958304();
    v162 = sub_23B958568();
    v163 = os_log_type_enabled(v161, v162);
    v164 = v1[83];
    v233 = v160;
    if (v163)
    {
      v211 = v1[82];
      v217 = v1[76];
      v215 = v1[73];
      v221 = v1[71];
      v165 = v1[50];
      v230 = v162;
      v166 = v1[41];
      logb = v1[40];
      v167 = swift_slowAlloc();
      v224 = swift_slowAlloc();
      v242[0] = v224;
      *(_DWORD *)v167 = 136316163;
      v171 = sub_23B93A46C(v224, v168, v169, v170);
      v1[15] = sub_23B9287E0(v171, v172, v242);
      sub_23B9585A4();
      swift_bridgeObjectRelease();
      *(_WORD *)(v167 + 12) = 2082;
      swift_bridgeObjectRetain();
      v1[16] = sub_23B9287E0(logb, v166, v242);
      sub_23B9585A4();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v167 + 22) = 2160;
      v1[17] = 1752392040;
      sub_23B9585A4();
      *(_WORD *)(v167 + 32) = 2081;
      swift_bridgeObjectRetain();
      v1[18] = sub_23B9287E0(v211, v164, v242);
      sub_23B9585A4();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v167 + 42) = 2082;
      v160(v217, v215, v165);
      v173 = *(void (**)(uint64_t, uint64_t))(v221 + 8);
      v173(v215, v165);
      Message.description.getter(v165);
      v175 = v174;
      v177 = v176;
      v173(v217, v165);
      v1[19] = sub_23B9287E0(v175, v177, v242);
      sub_23B9585A4();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_23B916000, v161, v230, "%s: Received message on %{public}s from %{private,mask.hash}s: %{public}s", (uint8_t *)v167, 0x34u);
      swift_arrayDestroy();
      MEMORY[0x242609864](v224, -1, -1);
      MEMORY[0x242609864](v167, -1, -1);
    }
    else
    {
      v173 = *(void (**)(uint64_t, uint64_t))(v1[71] + 8);
      v173(v1[73], v1[50]);
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
    }

    v178 = v1[45];
    v179 = *(_QWORD *)(v178 + 176);
    if (v179)
    {
      v222 = v1[82];
      v225 = v1[83];
      v218 = *((_BYTE *)v1 + 744);
      v213 = v1[80];
      v216 = v1[81];
      v180 = v1[79];
      v239 = v180;
      v181 = v1[76];
      v212 = v1[72];
      v241 = v173;
      v182 = v1[71];
      v183 = v1[68];
      v200 = v1[66];
      v184 = v1[50];
      v185 = v1[47];
      v186 = v1[44];
      v187 = *(_QWORD *)(v178 + 184);
      v188 = sub_23B9584F0();
      *(_OWORD *)logc = *((_OWORD *)v1 + 24);
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v188 - 8) + 56))(v185, 1, 1, v188);
      v233(v181, v180, v184);
      sub_23B92F2F8(v186, v183, (uint64_t (*)(_QWORD))type metadata accessor for MessageContext);
      v189 = (*(unsigned __int8 *)(v182 + 80) + 104) & ~(unint64_t)*(unsigned __int8 *)(v182 + 80);
      v190 = (v212 + *(unsigned __int8 *)(v200 + 80) + v189) & ~(unint64_t)*(unsigned __int8 *)(v200 + 80);
      v191 = swift_allocObject();
      *(_QWORD *)(v191 + 16) = 0;
      *(_QWORD *)(v191 + 24) = 0;
      *(_OWORD *)(v191 + 32) = *(_OWORD *)logc;
      *(_QWORD *)(v191 + 48) = v179;
      *(_QWORD *)(v191 + 56) = v187;
      *(_QWORD *)(v191 + 64) = v213;
      *(_QWORD *)(v191 + 72) = v216;
      *(_BYTE *)(v191 + 80) = v218;
      *(_QWORD *)(v191 + 88) = v222;
      *(_QWORD *)(v191 + 96) = v225;
      v228(v191 + v189, v181, v184);
      sub_23B92F378(v183, v191 + v190, (uint64_t (*)(_QWORD))type metadata accessor for MessageContext);
      sub_23B92ED9C(v179);
      swift_bridgeObjectRetain();
      sub_23B92ED9C(v179);
      swift_bridgeObjectRetain();
      sub_23B94CA58(v185, (uint64_t)&unk_256A55990, v191);
      swift_release();
      sub_23B92D238(v179);
      v241(v239, v184);
    }
    else
    {
      v173(v1[79], v1[50]);
    }
LABEL_20:
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
    return ((uint64_t (*)(void))v1[1])();
  }
  v14 = v1[45];
  v15 = *(_QWORD *)(v14 + 256);
  v1[84] = v15;
  v1[85] = *(_QWORD *)(v14 + 264);
  if (!v15)
  {
    if (qword_254309BD0 != -1)
      swift_once();
    v101 = sub_23B95831C();
    __swift_project_value_buffer(v101, (uint64_t)qword_254309BB8);
    v102 = sub_23B958304();
    v103 = sub_23B958550();
    v104 = os_log_type_enabled(v102, v103);
    v105 = v1[79];
    v106 = v1[71];
    v107 = v1[50];
    if (v104)
    {
      v237 = v1[79];
      v108 = (uint8_t *)swift_slowAlloc();
      v109 = v1;
      v110 = swift_slowAlloc();
      v242[0] = v110;
      *(_DWORD *)v108 = 136446210;
      v114 = sub_23B93A46C(v110, v111, v112, v113);
      v109[30] = sub_23B9287E0(v114, v115, v242);
      sub_23B9585A4();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_23B916000, v102, v103, "%{public}s: No replyCallback!", v108, 0xCu);
      swift_arrayDestroy();
      v116 = v110;
      v1 = v109;
      MEMORY[0x242609864](v116, -1, -1);
      MEMORY[0x242609864](v108, -1, -1);

      (*(void (**)(uint64_t, uint64_t))(v106 + 8))(v237, v107);
    }
    else
    {

      (*(void (**)(uint64_t, uint64_t))(v106 + 8))(v105, v107);
    }
    goto LABEL_20;
  }
  v234 = (int *)v15;
  sub_23B92ED9C(v15);
  if (qword_254309BD0 != -1)
    swift_once();
  v16 = v1[79];
  v17 = v1[77];
  v18 = v1[71];
  v19 = v1[70];
  v20 = v1[50];
  v21 = v1[44];
  v22 = sub_23B95831C();
  v1[86] = __swift_project_value_buffer(v22, (uint64_t)qword_254309BB8);
  sub_23B92F2F8(v21, v19, (uint64_t (*)(_QWORD))type metadata accessor for MessageContext);
  v23 = *(void (**)(uint64_t, uint64_t, uint64_t))(v18 + 16);
  v23(v17, v16, v20);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  v24 = sub_23B958304();
  v25 = sub_23B958568();
  v26 = os_log_type_enabled(v24, v25);
  v27 = v1[83];
  if (v26)
  {
    v208 = v1[82];
    log = v24;
    v219 = v1[77];
    v214 = v1[76];
    v223 = v1[71];
    v28 = v1[70];
    v29 = v1[50];
    v231 = v25;
    v30 = v1[41];
    v205 = (os_log_t)v1[40];
    v31 = swift_slowAlloc();
    v226 = swift_slowAlloc();
    v242[0] = v226;
    *(_DWORD *)v31 = 136316162;
    v35 = sub_23B93A46C(v226, v32, v33, v34);
    v1[35] = sub_23B9287E0(v35, v36, v242);
    sub_23B9585A4();
    swift_bridgeObjectRelease();
    *(_WORD *)(v31 + 12) = 2080;
    sub_23B92F2B8(&qword_256A55510, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAB8]);
    v37 = sub_23B9587F0();
    v1[36] = sub_23B9287E0(v37, v38, v242);
    sub_23B9585A4();
    swift_bridgeObjectRelease();
    sub_23B92F33C(v28, (uint64_t (*)(_QWORD))type metadata accessor for MessageContext);
    *(_WORD *)(v31 + 22) = 2080;
    swift_bridgeObjectRetain();
    v1[37] = sub_23B9287E0((uint64_t)v205, v30, v242);
    sub_23B9585A4();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v31 + 32) = 2080;
    swift_bridgeObjectRetain();
    v1[38] = sub_23B9287E0(v208, v27, v242);
    sub_23B9585A4();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v31 + 42) = 2080;
    v23(v214, v219, v29);
    v39 = *(void (**)(uint64_t, uint64_t))(v223 + 8);
    v39(v219, v29);
    Message.description.getter(v29);
    v41 = v40;
    v43 = v42;
    v39(v214, v29);
    v1[39] = sub_23B9287E0(v41, v43, v242);
    sub_23B9585A4();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23B916000, log, v231, "%s: Received message %s on %s from %s: %s expecting response", (uint8_t *)v31, 0x34u);
    swift_arrayDestroy();
    MEMORY[0x242609864](v226, -1, -1);
    MEMORY[0x242609864](v31, -1, -1);

  }
  else
  {
    v117 = v1[70];
    v39 = *(void (**)(uint64_t, uint64_t))(v1[71] + 8);
    v39(v1[77], v1[50]);
    sub_23B92F33C(v117, (uint64_t (*)(_QWORD))type metadata accessor for MessageContext);
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();

  }
  v1[87] = v39;
  v118 = v1[83];
  v119 = v1[82];
  v120 = *((_BYTE *)v1 + 744);
  v121 = v1[81];
  v1[11] = v1[80];
  v1[12] = v121;
  *((_BYTE *)v1 + 40) = v120;
  v1[6] = v119;
  v1[7] = v118;
  v122 = sub_23B91BB2C(MEMORY[0x24BEE4AF8]);
  v1[88] = v122;
  v238 = (int *)((char *)v234 + *v234);
  v123 = (_QWORD *)swift_task_alloc();
  v1[89] = v123;
  *v123 = v1;
  v123[1] = sub_23B944028;
  return ((uint64_t (*)(_QWORD, _QWORD *, _QWORD *, _QWORD, unint64_t, _QWORD))v238)(v1[75], v1 + 11, v1 + 5, v1[79], v122, v1[44]);
}

uint64_t sub_23B944028()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 720) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_bridgeObjectRelease();
  return swift_task_switch();
}

uint64_t sub_23B94409C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  int *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  char v19;
  uint64_t v20;
  uint64_t v21;

  v1 = *(_QWORD *)(v0 + 664);
  v19 = *(_BYTE *)(v0 + 744);
  v20 = *(_QWORD *)(v0 + 656);
  v21 = *(_QWORD *)(v0 + 520);
  v3 = *(int **)(v0 + 504);
  v2 = *(_QWORD *)(v0 + 512);
  v4 = *(_QWORD *)(v0 + 496);
  v6 = *(_QWORD *)(v0 + 440);
  v5 = *(_QWORD *)(v0 + 448);
  v7 = *(_QWORD *)(v0 + 408);
  v8 = *(_QWORD *)(v0 + 352);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256A55468);
  v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_23B958EB0;
  *(_BYTE *)(v9 + 32) = v19;
  *(_QWORD *)(v9 + 40) = v20;
  *(_QWORD *)(v9 + 48) = v1;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v4, v8 + *(int *)(v7 + 20), v6);
  v10 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v5 + 56);
  v10(v4, 0, 1, v6);
  swift_bridgeObjectRetain();
  v11 = MEMORY[0x24BEE4AF8];
  v12 = sub_23B92D6F4(MEMORY[0x24BEE4AF8]);
  v13 = sub_23B92D6F4(v11);
  v14 = v2 + v3[7];
  v10(v14, 1, 1, v6);
  sub_23B9582EC();
  *(_QWORD *)(v2 + v3[5]) = v9;
  *(_BYTE *)(v2 + v3[6]) = 0;
  sub_23B92F020(v4, v14);
  v15 = v2 + v3[8];
  *(_QWORD *)v15 = 0;
  *(_BYTE *)(v15 + 8) = 1;
  *(_BYTE *)(v2 + v3[9]) = 0;
  *(_QWORD *)(v2 + v3[10]) = v12;
  *(_QWORD *)(v2 + v3[11]) = v13;
  v16 = (_QWORD *)(v2 + v3[12]);
  *v16 = 0;
  v16[1] = 0;
  sub_23B930790(v4, &qword_254309A30);
  *(_OWORD *)(v2 + v3[13]) = xmmword_23B958F90;
  sub_23B92F378(v2, v21, (uint64_t (*)(_QWORD))type metadata accessor for MessagingOptions);
  v17 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 728) = v17;
  *v17 = v0;
  v17[1] = sub_23B94427C;
  return LocalMessaging.send(message:messageOptions:)(*(_QWORD *)(v0 + 480), *(_QWORD *)(v0 + 600), *(_QWORD *)(v0 + 520));
}

uint64_t sub_23B94427C()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  v2 = *(_QWORD **)v1;
  *(_QWORD *)(*(_QWORD *)v1 + 736) = v0;
  swift_task_dealloc();
  if (!v0)
    (*(void (**)(_QWORD, _QWORD))(v2[56] + 8))(v2[60], v2[55]);
  return swift_task_switch();
}

uint64_t sub_23B9442F8()
{
  uint64_t v0;
  void *v1;
  void (*v2)(uint64_t, uint64_t);
  id v3;
  id v4;
  NSObject *v5;
  os_log_type_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void (*v20)(uint64_t, uint64_t);
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  swift_bridgeObjectRelease();
  v1 = *(void **)(v0 + 720);
  v2 = *(void (**)(uint64_t, uint64_t))(v0 + 696);
  v3 = v1;
  v4 = v1;
  v5 = sub_23B958304();
  v6 = sub_23B958550();
  if (os_log_type_enabled(v5, v6))
  {
    v21 = *(_QWORD *)(v0 + 672);
    v22 = *(_QWORD *)(v0 + 400);
    v23 = *(_QWORD *)(v0 + 632);
    v7 = swift_slowAlloc();
    v20 = v2;
    v8 = (_QWORD *)swift_slowAlloc();
    v9 = swift_slowAlloc();
    v24 = v9;
    *(_DWORD *)v7 = 136446466;
    v13 = sub_23B93A46C(v9, v10, v11, v12);
    *(_QWORD *)(v0 + 264) = sub_23B9287E0(v13, v14, &v24);
    sub_23B9585A4();
    swift_bridgeObjectRelease();
    *(_WORD *)(v7 + 12) = 2114;
    v15 = v1;
    v16 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v0 + 272) = v16;
    sub_23B9585A4();
    *v8 = v16;

    _os_log_impl(&dword_23B916000, v5, v6, "%{public}s: Error sending response: %{public}@", (uint8_t *)v7, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256A555C8);
    swift_arrayDestroy();
    MEMORY[0x242609864](v8, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x242609864](v9, -1, -1);
    MEMORY[0x242609864](v7, -1, -1);
    sub_23B92D238(v21);

    v20(v23, v22);
  }
  else
  {
    v17 = *(_QWORD *)(v0 + 632);
    v18 = *(_QWORD *)(v0 + 400);
    sub_23B92D238(*(_QWORD *)(v0 + 672));

    v2(v17, v18);
  }
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

uint64_t sub_23B944658()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void (*v4)(uint64_t, uint64_t);
  void *v5;
  id v6;
  id v7;
  NSObject *v8;
  os_log_type_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void (*v23)(uint64_t, uint64_t);
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v1 = *(_QWORD *)(v0 + 600);
  v2 = *(_QWORD *)(v0 + 568);
  v3 = *(_QWORD *)(v0 + 400);
  sub_23B92F33C(*(_QWORD *)(v0 + 520), (uint64_t (*)(_QWORD))type metadata accessor for MessagingOptions);
  v4 = *(void (**)(uint64_t, uint64_t))(v2 + 8);
  v4(v1, v3);
  v5 = *(void **)(v0 + 736);
  v6 = v5;
  v7 = v5;
  v8 = sub_23B958304();
  v9 = sub_23B958550();
  if (os_log_type_enabled(v8, v9))
  {
    v24 = *(_QWORD *)(v0 + 672);
    v25 = *(_QWORD *)(v0 + 400);
    v26 = *(_QWORD *)(v0 + 632);
    v10 = swift_slowAlloc();
    v23 = v4;
    v11 = (_QWORD *)swift_slowAlloc();
    v12 = swift_slowAlloc();
    v27 = v12;
    *(_DWORD *)v10 = 136446466;
    v16 = sub_23B93A46C(v12, v13, v14, v15);
    *(_QWORD *)(v0 + 264) = sub_23B9287E0(v16, v17, &v27);
    sub_23B9585A4();
    swift_bridgeObjectRelease();
    *(_WORD *)(v10 + 12) = 2114;
    v18 = v5;
    v19 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v0 + 272) = v19;
    sub_23B9585A4();
    *v11 = v19;

    _os_log_impl(&dword_23B916000, v8, v9, "%{public}s: Error sending response: %{public}@", (uint8_t *)v10, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256A555C8);
    swift_arrayDestroy();
    MEMORY[0x242609864](v11, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x242609864](v12, -1, -1);
    MEMORY[0x242609864](v10, -1, -1);
    sub_23B92D238(v24);

    v23(v26, v25);
  }
  else
  {
    v20 = *(_QWORD *)(v0 + 632);
    v21 = *(_QWORD *)(v0 + 400);
    sub_23B92D238(*(_QWORD *)(v0 + 672));

    v4(v20, v21);
  }
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

uint64_t sub_23B9449D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8)
{
  uint64_t v8;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;

  *(_QWORD *)(v8 + 104) = v11;
  *(_QWORD *)(v8 + 112) = v12;
  *(_OWORD *)(v8 + 88) = v10;
  *(_BYTE *)(v8 + 136) = a8;
  *(_QWORD *)(v8 + 72) = a6;
  *(_QWORD *)(v8 + 80) = a7;
  *(_QWORD *)(v8 + 56) = a4;
  *(_QWORD *)(v8 + 64) = a5;
  return swift_task_switch();
}

uint64_t sub_23B944A0C()
{
  uint64_t v0;
  __int128 v1;
  char v2;
  uint64_t v3;
  int *v4;
  unint64_t v5;
  _QWORD *v6;
  int *v8;

  v1 = *(_OWORD *)(v0 + 88);
  v2 = *(_BYTE *)(v0 + 136);
  v3 = *(_QWORD *)(v0 + 80);
  *(_QWORD *)(v0 + 40) = *(_QWORD *)(v0 + 72);
  v4 = *(int **)(v0 + 56);
  *(_QWORD *)(v0 + 48) = v3;
  *(_BYTE *)(v0 + 16) = v2;
  *(_OWORD *)(v0 + 24) = v1;
  v5 = sub_23B91BB2C(MEMORY[0x24BEE4AF8]);
  *(_QWORD *)(v0 + 120) = v5;
  v8 = (int *)((char *)v4 + *v4);
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 128) = v6;
  *v6 = v0;
  v6[1] = sub_23B926E28;
  return ((uint64_t (*)(uint64_t, uint64_t, _QWORD, unint64_t, _QWORD))v8)(v0 + 40, v0 + 16, *(_QWORD *)(v0 + 104), v5, *(_QWORD *)(v0 + 112));
}

void sub_23B944AB8(void (*a1)(char *, uint64_t), unint64_t a2, uint64_t *a3, uint64_t a4, uint64_t a5, unsigned __int8 *a6, uint64_t a7)
{
  _QWORD *v7;
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
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  BOOL v33;
  unint64_t v34;
  uint64_t v35;
  unint64_t v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  NSObject *v40;
  os_log_type_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  uint64_t v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void (*v54)(char *, char *, uint64_t);
  char *v55;
  unint64_t v56;
  NSObject *v57;
  os_log_type_t v58;
  _BOOL4 v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  unint64_t v67;
  uint64_t v68;
  unint64_t v69;
  unint64_t v70;
  char *v71;
  void (*v72)(char *, uint64_t);
  uint64_t v73;
  uint64_t v74;
  unint64_t v75;
  unint64_t v76;
  char *v77;
  void (*v78)(char *, uint64_t);
  os_log_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  unint64_t v86;
  unint64_t v87;
  unint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  unint64_t v92;
  uint64_t v93;
  os_log_t v94;
  uint64_t v95;
  int v96;
  void (*v97)(char *, char *, uint64_t);
  char *v98;
  uint64_t v99;
  int v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  char *v109;
  uint64_t v110;
  unint64_t v111;
  char *v112;
  uint64_t v113;
  char *v114;
  _QWORD *v115;
  uint64_t v116;
  uint64_t v117;
  void (*v118)(char *, uint64_t);
  uint64_t v119;
  uint64_t v120[2];

  v106 = a7;
  v13 = *v7;
  v14 = type metadata accessor for MessageContext();
  v105 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v14);
  v107 = v15;
  v108 = (uint64_t)&v93 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254309C80);
  MEMORY[0x24BDAC7A8](v16);
  v18 = (char *)&v93 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = *(_QWORD *)(v13 + 80);
  v20 = *(_QWORD *)(v13 + 88);
  v116 = v13;
  v102 = v20;
  v103 = v19;
  v117 = type metadata accessor for Message(0, v19, v20, v21);
  v113 = *(_QWORD *)(v117 - 8);
  v22 = *(_QWORD *)(v113 + 64);
  v23 = MEMORY[0x24BDAC7A8](v117);
  v112 = (char *)&v93 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = MEMORY[0x24BDAC7A8](v23);
  v109 = (char *)&v93 - v25;
  v26 = MEMORY[0x24BDAC7A8](v24);
  v28 = (char *)&v93 - v27;
  MEMORY[0x24BDAC7A8](v26);
  v114 = (char *)&v93 - v29;
  v101 = *a3;
  v104 = a3[1];
  v100 = *a6;
  v30 = *((_QWORD *)a6 + 2);
  v110 = *((_QWORD *)a6 + 1);
  v111 = v30;
  v32 = v7[14];
  v31 = v7[15];
  v115 = v7;
  v118 = a1;
  v33 = v32 == (_QWORD)a1;
  v34 = a2;
  if (v33 && v31 == a2 || (sub_23B958820() & 1) != 0)
  {
    v99 = a5;
    v35 = sub_23B958268();
    v37 = v36;
    v98 = v18;
    sub_23B9581E4();
    swift_allocObject();
    sub_23B9581D8();
    v38 = v117;
    MEMORY[0x2426097B0](&protocol conformance descriptor for Message<A>, v117);
    sub_23B9581C0();
    sub_23B92D4DC(v35, v37);
    swift_release();
    v51 = v113;
    v50 = v114;
    v97 = *(void (**)(char *, char *, uint64_t))(v113 + 32);
    v97(v114, v28, v38);
    v52 = v38;
    if (qword_254309BD0 != -1)
      swift_once();
    v53 = sub_23B95831C();
    __swift_project_value_buffer(v53, (uint64_t)qword_254309BB8);
    v54 = *(void (**)(char *, char *, uint64_t))(v51 + 16);
    v55 = v109;
    v54(v109, v50, v38);
    swift_bridgeObjectRetain_n();
    v56 = v111;
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    v57 = sub_23B958304();
    v58 = sub_23B958568();
    v96 = v58;
    v59 = os_log_type_enabled(v57, v58);
    v60 = (uint64_t)v98;
    if (v59)
    {
      v61 = swift_slowAlloc();
      v62 = swift_slowAlloc();
      v95 = v62;
      v120[0] = v62;
      *(_DWORD *)v61 = 136316419;
      v94 = v57;
      v66 = sub_23B93A46C(v62, v63, v64, v65);
      v119 = sub_23B9287E0(v66, v67, v120);
      sub_23B9585A4();
      swift_bridgeObjectRelease();
      *(_WORD *)(v61 + 12) = 2082;
      swift_bridgeObjectRetain();
      v119 = sub_23B9287E0((uint64_t)v118, v34, v120);
      sub_23B9585A4();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v61 + 22) = 2160;
      v119 = 1752392040;
      sub_23B9585A4();
      *(_WORD *)(v61 + 32) = 2081;
      swift_bridgeObjectRetain();
      v119 = sub_23B9287E0(v110, v56, v120);
      sub_23B9585A4();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v61 + 42) = 2080;
      swift_bridgeObjectRetain();
      __swift_instantiateConcreteTypeFromMangledName(&qword_256A555E0);
      v68 = sub_23B958358();
      v70 = v69;
      swift_bridgeObjectRelease();
      v119 = sub_23B9287E0(v68, v70, v120);
      sub_23B9585A4();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v61 + 52) = 2082;
      v71 = v112;
      v54(v112, v55, v117);
      v72 = *(void (**)(char *, uint64_t))(v113 + 8);
      v72(v55, v117);
      Message.description.getter(v117);
      v74 = v73;
      v76 = v75;
      v77 = v71;
      v78 = v72;
      v72(v77, v117);
      v119 = sub_23B9287E0(v74, v76, v120);
      v60 = (uint64_t)v98;
      sub_23B9585A4();
      swift_bridgeObjectRelease();
      v79 = v94;
      _os_log_impl(&dword_23B916000, v94, (os_log_type_t)v96, "%s: Received (resource) message on %{public}s from %{private,mask.hash}s: metadata: %s'; message: %{public}s",
        (uint8_t *)v61,
        0x3Eu);
      v80 = v95;
      swift_arrayDestroy();
      MEMORY[0x242609864](v80, -1, -1);
      v81 = v61;
      v52 = v117;
      MEMORY[0x242609864](v81, -1, -1);

    }
    else
    {
      v78 = *(void (**)(char *, uint64_t))(v51 + 8);
      v78(v55, v52);

      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
    }
    v82 = v115[22];
    if (v82)
    {
      v83 = v115[23];
      v84 = sub_23B9584F0();
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v84 - 8) + 56))(v60, 1, 1, v84);
      v118 = v78;
      v54(v112, v114, v52);
      v85 = v108;
      sub_23B92F2F8(v106, v108, (uint64_t (*)(_QWORD))type metadata accessor for MessageContext);
      v86 = (*(unsigned __int8 *)(v113 + 80) + 104) & ~(unint64_t)*(unsigned __int8 *)(v113 + 80);
      v87 = (v22 + v86 + 7) & 0xFFFFFFFFFFFFFFF8;
      v88 = (*(unsigned __int8 *)(v105 + 80) + v87 + 8) & ~(unint64_t)*(unsigned __int8 *)(v105 + 80);
      v89 = swift_allocObject();
      *(_QWORD *)(v89 + 16) = 0;
      *(_QWORD *)(v89 + 24) = 0;
      v90 = v102;
      *(_QWORD *)(v89 + 32) = v103;
      *(_QWORD *)(v89 + 40) = v90;
      *(_QWORD *)(v89 + 48) = v82;
      *(_QWORD *)(v89 + 56) = v83;
      v91 = v104;
      *(_QWORD *)(v89 + 64) = v101;
      *(_QWORD *)(v89 + 72) = v91;
      *(_BYTE *)(v89 + 80) = v100;
      v92 = v111;
      *(_QWORD *)(v89 + 88) = v110;
      *(_QWORD *)(v89 + 96) = v92;
      v97((char *)(v89 + v86), v112, v52);
      *(_QWORD *)(v89 + v87) = v99;
      sub_23B92F378(v85, v89 + v88, (uint64_t (*)(_QWORD))type metadata accessor for MessageContext);
      sub_23B92ED9C(v82);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_23B92ED9C(v82);
      swift_bridgeObjectRetain();
      sub_23B94CA58((uint64_t)v98, (uint64_t)&unk_256A55978, v89);
      swift_release();
      sub_23B92D238(v82);
      v118(v114, v52);
    }
    else
    {
      v78(v114, v52);
    }
  }
  else
  {
    if (qword_254309BD0 != -1)
      swift_once();
    v39 = sub_23B95831C();
    __swift_project_value_buffer(v39, (uint64_t)qword_254309BB8);
    swift_bridgeObjectRetain_n();
    swift_retain_n();
    v40 = sub_23B958304();
    v41 = sub_23B958550();
    if (os_log_type_enabled(v40, v41))
    {
      v42 = swift_slowAlloc();
      v43 = swift_slowAlloc();
      v117 = v43;
      v120[0] = v43;
      *(_DWORD *)v42 = 136446722;
      v47 = sub_23B93A46C(v43, v44, v45, v46);
      v119 = sub_23B9287E0(v47, v48, v120);
      sub_23B9585A4();
      swift_bridgeObjectRelease();
      *(_WORD *)(v42 + 12) = 2082;
      swift_bridgeObjectRetain();
      v119 = sub_23B9287E0(v32, v31, v120);
      sub_23B9585A4();
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v42 + 22) = 2082;
      swift_bridgeObjectRetain();
      v119 = sub_23B9287E0((uint64_t)v118, a2, v120);
      sub_23B9585A4();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_23B916000, v40, v41, "%{public}s: Ignoring delegate callback from wrong IDS service! Expected %{public}s, received: %{public}s", (uint8_t *)v42, 0x20u);
      v49 = v117;
      swift_arrayDestroy();
      MEMORY[0x242609864](v49, -1, -1);
      MEMORY[0x242609864](v42, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
      swift_release_n();
    }
  }
}

uint64_t sub_23B9456A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, uint64_t a6)
{
  uint64_t v6;
  uint64_t v7;

  *(_QWORD *)(v7 + 32) = a6;
  *(_QWORD *)(v7 + 40) = v6;
  *(_BYTE *)(v7 + 48) = a5;
  *(_QWORD *)(v7 + 16) = a3;
  *(_QWORD *)(v7 + 24) = a4;
  return swift_task_switch();
}

uint64_t sub_23B9456C8()
{
  uint64_t v0;

  sub_23B9465EC(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(_BYTE *)(v0 + 48), *(void **)(v0 + 32));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23B945700(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  _QWORD *v9;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t);

  v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&dword_256A55998 + dword_256A55998);
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v5 + 16) = v9;
  *v9 = v5;
  v9[1] = sub_23B930844;
  return v11(a3, a4, a5);
}

uint64_t sub_23B94577C(uint64_t a1, uint64_t a2, _QWORD *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  _QWORD *v15;

  v15 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v7 + 16) = v15;
  *v15 = v7;
  v15[1] = sub_23B930844;
  return sub_23B942380(a1, a2, a3, a4, a5, a6, a7);
}

uint64_t sub_23B945814(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  _QWORD *v8;

  v8[8] = a7;
  v8[9] = v7;
  v8[6] = a5;
  v8[7] = a6;
  v8[4] = a3;
  v8[5] = a4;
  v8[2] = a1;
  v8[3] = a2;
  return swift_task_switch();
}

uint64_t sub_23B94583C()
{
  uint64_t v0;

  sub_23B944AB8(*(void (**)(char *, uint64_t))(v0 + 16), *(_QWORD *)(v0 + 24), *(uint64_t **)(v0 + 32), *(_QWORD *)(v0 + 40), *(_QWORD *)(v0 + 48), *(unsigned __int8 **)(v0 + 56), *(_QWORD *)(v0 + 64));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23B945878(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  _QWORD *v14;
  uint64_t (*v16)(uint64_t, uint64_t, uint64_t *, uint64_t, uint64_t, uint64_t);

  v16 = (uint64_t (*)(uint64_t, uint64_t, uint64_t *, uint64_t, uint64_t, uint64_t))((char *)&dword_256A55958
                                                                                       + dword_256A55958);
  v14 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v7 + 16) = v14;
  *v14 = v7;
  v14[1] = sub_23B930844;
  return v16(a1, a2, a3, a4, a6, a7);
}

uint64_t sub_23B945918(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v5;
  uint64_t (*v7)(uint64_t);

  v7 = (uint64_t (*)(uint64_t))((char *)&dword_256A55950 + dword_256A55950);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v5;
  *v5 = v3;
  v5[1] = sub_23B930844;
  return v7(a3);
}

uint64_t sub_23B94597C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v5;
  uint64_t (*v7)(uint64_t);

  v7 = (uint64_t (*)(uint64_t))((char *)&dword_256A55948 + dword_256A55948);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v5;
  *v5 = v3;
  v5[1] = sub_23B930844;
  return v7(a3);
}

uint64_t sub_23B9459E4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  v3 = *(_QWORD *)(v2 + 160);
  *(_QWORD *)(v2 + 160) = a1;
  *(_QWORD *)(v2 + 168) = a2;
  swift_retain();
  return sub_23B92D238(v3);
}

uint64_t sub_23B945A20(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  v3 = *(_QWORD *)(v2 + 176);
  *(_QWORD *)(v2 + 176) = a1;
  *(_QWORD *)(v2 + 184) = a2;
  swift_retain();
  return sub_23B92D238(v3);
}

uint64_t sub_23B945A5C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  v3 = *(_QWORD *)(v2 + 192);
  *(_QWORD *)(v2 + 192) = a1;
  *(_QWORD *)(v2 + 200) = a2;
  swift_retain();
  return sub_23B92D238(v3);
}

uint64_t sub_23B945A98(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  v3 = *(_QWORD *)(v2 + 208);
  *(_QWORD *)(v2 + 208) = a1;
  *(_QWORD *)(v2 + 216) = a2;
  swift_retain();
  return sub_23B92D238(v3);
}

uint64_t sub_23B945AD4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  v3 = *(_QWORD *)(v2 + 224);
  *(_QWORD *)(v2 + 224) = a1;
  *(_QWORD *)(v2 + 232) = a2;
  swift_retain();
  return sub_23B92D238(v3);
}

uint64_t sub_23B945B10(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  v3 = *(_QWORD *)(v2 + 240);
  *(_QWORD *)(v2 + 240) = a1;
  *(_QWORD *)(v2 + 248) = a2;
  swift_retain();
  return sub_23B92D238(v3);
}

uint64_t LocalMessaging.setReplyCallback(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  v3 = *(_QWORD *)(v2 + 256);
  *(_QWORD *)(v2 + 256) = a1;
  *(_QWORD *)(v2 + 264) = a2;
  swift_retain();
  return sub_23B92D238(v3);
}

uint64_t LocalMessaging.description.getter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v5 = type metadata accessor for LocalMessaging(0, *(_QWORD *)(*(_QWORD *)v4 + 80), *(_QWORD *)(*(_QWORD *)v4 + 88), a4);
  v6 = MEMORY[0x2426097B0](&protocol conformance descriptor for LocalMessaging<A>, v5);
  sub_23B9587D8();
  sub_23B958400();
  swift_bridgeObjectRelease();
  sub_23B958400();
  MEMORY[0x242609300](v5, v6);
  sub_23B958400();
  swift_bridgeObjectRelease();
  sub_23B958400();
  swift_bridgeObjectRetain();
  sub_23B958400();
  swift_bridgeObjectRelease();
  sub_23B958400();
  return 60;
}

uint64_t sub_23B945C8C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return LocalMessaging.description.getter(a1, a2, a3, a4);
}

uint64_t sub_23B945CAC()
{
  uint64_t v0;

  v0 = sub_23B95831C();
  __swift_allocate_value_buffer(v0, qword_254309CD8);
  __swift_project_value_buffer(v0, (uint64_t)qword_254309CD8);
  return sub_23B958310();
}

uint64_t sub_23B945D2C(uint64_t a1)
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
  v4 = sub_23B9335F0(a1);
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
    sub_23B954D1C();
    v7 = v12;
  }
  v8 = *(_QWORD *)(v7 + 48);
  v9 = sub_23B9582F8();
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 8))(v8 + *(_QWORD *)(*(_QWORD *)(v9 - 8) + 72) * v4, v9);
  v10 = *(_QWORD *)(*(_QWORD *)(v7 + 56) + 8 * v4);
  sub_23B945F00(v4, v7);
  *v2 = v7;
  swift_bridgeObjectRelease();
  return v10;
}

double sub_23B945E04@<D0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t *v2;
  uint64_t *v3;
  unint64_t v6;
  char v7;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double result;
  uint64_t v13;

  v3 = v2;
  swift_bridgeObjectRetain();
  v6 = sub_23B9338E8(a1);
  LOBYTE(a1) = v7;
  swift_bridgeObjectRelease();
  if ((a1 & 1) != 0)
  {
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v9 = *v3;
    v13 = *v3;
    *v3 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_23B955624();
      v9 = v13;
    }
    v10 = *(_QWORD *)(v9 + 48);
    v11 = sub_23B95870C();
    (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 8))(v10 + *(_QWORD *)(*(_QWORD *)(v11 - 8) + 72) * v6, v11);
    sub_23B92DA04((_OWORD *)(*(_QWORD *)(v9 + 56) + 32 * v6), a2);
    sub_23B9461A0(v6, v9);
    *v3 = v9;
    swift_bridgeObjectRelease();
  }
  else
  {
    result = 0.0;
    *a2 = 0u;
    a2[1] = 0u;
  }
  return result;
}

unint64_t sub_23B945F00(int64_t a1, uint64_t a2)
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
  uint64_t v15;
  int64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  _QWORD *v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  BOOL v30;
  uint64_t v31;
  uint64_t v32;
  void (*v33)(char *, unint64_t, uint64_t);
  unint64_t v34;
  uint64_t v35;

  v4 = sub_23B9582F8();
  v35 = *(_QWORD *)(v4 - 8);
  result = MEMORY[0x24BDAC7A8]();
  v7 = (char *)&v32 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = a2 + 64;
  v9 = -1 << *(_BYTE *)(a2 + 32);
  v10 = (a1 + 1) & ~v9;
  if (((1 << v10) & *(_QWORD *)(a2 + 64 + 8 * (v10 >> 6))) != 0)
  {
    v11 = ~v9;
    result = sub_23B9585D4();
    if ((*(_QWORD *)(v8 + 8 * (v10 >> 6)) & (1 << v10)) != 0)
    {
      v34 = (result + 1) & v11;
      v12 = *(_QWORD *)(v35 + 72);
      v33 = *(void (**)(char *, unint64_t, uint64_t))(v35 + 16);
      v13 = v11;
      do
      {
        v14 = v8;
        v15 = v12;
        v16 = v12 * v10;
        v17 = v13;
        v33(v7, *(_QWORD *)(a2 + 48) + v12 * v10, v4);
        sub_23B92F2B8((unint64_t *)&qword_254309B00, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
        v18 = sub_23B9583A0();
        result = (*(uint64_t (**)(char *, uint64_t))(v35 + 8))(v7, v4);
        v13 = v17;
        v19 = v18 & v17;
        if (a1 >= (uint64_t)v34)
        {
          if (v19 >= v34 && a1 >= (uint64_t)v19)
          {
LABEL_16:
            v22 = *(_QWORD *)(a2 + 48);
            result = v22 + v15 * a1;
            v8 = v14;
            if (v15 * a1 < v16 || (v12 = v15, result >= v22 + v16 + v15))
            {
              result = swift_arrayInitWithTakeFrontToBack();
LABEL_21:
              v13 = v17;
              v12 = v15;
            }
            else if (v15 * a1 != v16)
            {
              result = swift_arrayInitWithTakeBackToFront();
              goto LABEL_21;
            }
            v23 = *(_QWORD *)(a2 + 56);
            v24 = (_QWORD *)(v23 + 8 * a1);
            v25 = (_QWORD *)(v23 + 8 * v10);
            if (a1 != v10 || (a1 = v10, v24 >= v25 + 1))
            {
              *v24 = *v25;
              a1 = v10;
            }
            goto LABEL_5;
          }
        }
        else if (v19 >= v34 || a1 >= (uint64_t)v19)
        {
          goto LABEL_16;
        }
        v8 = v14;
        v12 = v15;
LABEL_5:
        v10 = (v10 + 1) & v13;
      }
      while (((*(_QWORD *)(v8 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0);
    }
    v26 = (uint64_t *)(v8 + 8 * ((unint64_t)a1 >> 6));
    v27 = *v26;
    v28 = (-1 << a1) - 1;
  }
  else
  {
    v26 = (uint64_t *)(v8 + 8 * ((unint64_t)a1 >> 6));
    v28 = *v26;
    v27 = (-1 << a1) - 1;
  }
  *v26 = v28 & v27;
  v29 = *(_QWORD *)(a2 + 16);
  v30 = __OFSUB__(v29, 1);
  v31 = v29 - 1;
  if (v30)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v31;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_23B9461A0(int64_t a1, uint64_t a2)
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
  uint64_t v15;
  int64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v22;
  uint64_t v23;
  _OWORD *v24;
  _OWORD *v25;
  __int128 v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  BOOL v31;
  uint64_t v32;
  uint64_t v33;
  void (*v34)(char *, unint64_t, uint64_t);
  unint64_t v35;
  uint64_t v36;

  v4 = sub_23B95870C();
  v36 = *(_QWORD *)(v4 - 8);
  result = MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v33 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = a2 + 64;
  v9 = -1 << *(_BYTE *)(a2 + 32);
  v10 = (a1 + 1) & ~v9;
  if (((1 << v10) & *(_QWORD *)(a2 + 64 + 8 * (v10 >> 6))) != 0)
  {
    v11 = ~v9;
    result = sub_23B9585D4();
    if ((*(_QWORD *)(v8 + 8 * (v10 >> 6)) & (1 << v10)) != 0)
    {
      v35 = (result + 1) & v11;
      v12 = *(_QWORD *)(v36 + 72);
      v34 = *(void (**)(char *, unint64_t, uint64_t))(v36 + 16);
      v13 = v11;
      do
      {
        v14 = v8;
        v15 = v12;
        v16 = v12 * v10;
        v17 = v13;
        v34(v7, *(_QWORD *)(a2 + 48) + v12 * v10, v4);
        v18 = sub_23B9583A0();
        result = (*(uint64_t (**)(char *, uint64_t))(v36 + 8))(v7, v4);
        v13 = v17;
        v19 = v18 & v17;
        if (a1 >= (uint64_t)v35)
        {
          if (v19 >= v35 && a1 >= (uint64_t)v19)
          {
LABEL_16:
            v22 = *(_QWORD *)(a2 + 48);
            result = v22 + v15 * a1;
            v8 = v14;
            if (v15 * a1 < v16 || (v12 = v15, result >= v22 + v16 + v15))
            {
              result = swift_arrayInitWithTakeFrontToBack();
LABEL_21:
              v12 = v15;
              v13 = v17;
            }
            else if (v15 * a1 != v16)
            {
              result = swift_arrayInitWithTakeBackToFront();
              goto LABEL_21;
            }
            v23 = *(_QWORD *)(a2 + 56);
            v24 = (_OWORD *)(v23 + 32 * a1);
            v25 = (_OWORD *)(v23 + 32 * v10);
            if (a1 != v10 || (a1 = v10, v24 >= v25 + 2))
            {
              v26 = v25[1];
              *v24 = *v25;
              v24[1] = v26;
              a1 = v10;
            }
            goto LABEL_5;
          }
        }
        else if (v19 >= v35 || a1 >= (uint64_t)v19)
        {
          goto LABEL_16;
        }
        v8 = v14;
        v12 = v15;
LABEL_5:
        v10 = (v10 + 1) & v13;
      }
      while (((*(_QWORD *)(v8 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0);
    }
    v27 = (uint64_t *)(v8 + 8 * ((unint64_t)a1 >> 6));
    v28 = *v27;
    v29 = (-1 << a1) - 1;
  }
  else
  {
    v27 = (uint64_t *)(v8 + 8 * ((unint64_t)a1 >> 6));
    v29 = *v27;
    v28 = (-1 << a1) - 1;
  }
  *v27 = v29 & v28;
  v30 = *(_QWORD *)(a2 + 16);
  v31 = __OFSUB__(v30, 1);
  v32 = v30 - 1;
  if (v31)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v32;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

uint64_t type metadata accessor for LocalMessaging(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for LocalMessaging);
}

uint64_t sub_23B946430(uint64_t a1)
{
  uint64_t v1;

  return sub_23B93C890(a1, *(_QWORD **)(v1 + 16), *(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32), *(_QWORD *)(v1 + 40), *(_QWORD *)(v1 + 48), *(_QWORD *)(v1 + 56));
}

uint64_t sub_23B946440(uint64_t a1)
{
  uint64_t v1;

  return sub_23B93DC80(a1, *(_QWORD **)(v1 + 16), *(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32), *(_QWORD *)(v1 + 40), *(_QWORD *)(v1 + 48));
}

uint64_t sub_23B946450(uint64_t a1)
{
  uint64_t v1;

  return sub_23B93F0E0(a1, *(_QWORD **)(v1 + 16), *(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32));
}

uint64_t sub_23B94645C(uint64_t a1)
{
  uint64_t v1;

  return sub_23B94024C(a1, *(uint64_t **)(v1 + 16), *(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32), *(_QWORD *)(v1 + 40));
}

uint64_t sub_23B946468()
{
  return swift_initClassMetadata2();
}

uint64_t method lookup function for LocalMessaging()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of LocalMessaging.set(didDeliverCallback:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 416))();
}

uint64_t dispatch thunk of LocalMessaging.set(messageReceivedCallback:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 424))();
}

uint64_t dispatch thunk of LocalMessaging.set(dictionaryReceivedCallback:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 432))();
}

uint64_t dispatch thunk of LocalMessaging.set(accountChangedCallback:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 440))();
}

uint64_t dispatch thunk of LocalMessaging.set(devicesChangedCallback:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 448))();
}

uint64_t dispatch thunk of LocalMessaging.set(connectedDevicesChangedCallback:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 456))();
}

uint64_t dispatch thunk of LocalMessaging.__allocating_init(serviceName:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v6;
  uint64_t (*v8)(uint64_t, uint64_t);

  v8 = (uint64_t (*)(uint64_t, uint64_t))(**(int **)(v2 + 496) + *(_QWORD *)(v2 + 496));
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v6;
  *v6 = v3;
  v6[1] = sub_23B930840;
  return v8(a1, a2);
}

uint64_t dispatch thunk of LocalMessaging.start()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 504))();
}

uint64_t dispatch thunk of LocalMessaging.stop()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 512))();
}

uint64_t dispatch thunk of LocalMessaging.device(fromID:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 520))();
}

uint64_t dispatch thunk of LocalMessaging.connectedDevice.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 528))();
}

uint64_t dispatch thunk of LocalMessaging.devices.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 536))();
}

void sub_23B9465EC(uint64_t a1, uint64_t a2, char a3, void *a4)
{
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char v12;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t v24;
  void *v25;
  uint64_t v26;
  _QWORD *v27;
  id v28;
  uint64_t v30[3];
  uint64_t v31;

  v8 = sub_23B9582F8();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v30[-1] - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  if (*(_QWORD *)(*(_QWORD *)(v4 + 144) + 16))
  {
    swift_bridgeObjectRetain();
    sub_23B9335F0(a2);
    if ((v12 & 1) != 0)
    {
      swift_retain();
      swift_bridgeObjectRelease();
      if ((a3 & 1) != 0)
      {
        sub_23B958184();
      }
      else
      {
        if (a4)
        {
          v25 = a4;
        }
        else
        {
          v26 = sub_23B95816C();
          sub_23B92F2B8(&qword_256A554C8, (uint64_t (*)(uint64_t))MEMORY[0x24BE31808], MEMORY[0x24BE31810]);
          v25 = (void *)swift_allocError();
          *v27 = 0xD00000000000001CLL;
          v27[1] = 0x800000023B95A5F0;
          (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v26 - 8) + 104))(v27, *MEMORY[0x24BE31800], v26);
        }
        v30[0] = (uint64_t)v25;
        v28 = a4;
        sub_23B958178();

      }
      swift_beginAccess();
      sub_23B945D2C(a2);
      swift_endAccess();
      swift_release();
      swift_release();
      return;
    }
    swift_bridgeObjectRelease();
  }
  if (qword_254309BD0 != -1)
    swift_once();
  v13 = sub_23B95831C();
  __swift_project_value_buffer(v13, (uint64_t)qword_254309BB8);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a2, v8);
  v14 = sub_23B958304();
  v15 = sub_23B958550();
  if (os_log_type_enabled(v14, v15))
  {
    v16 = swift_slowAlloc();
    v17 = swift_slowAlloc();
    v30[0] = v17;
    *(_DWORD *)v16 = 136446466;
    v21 = sub_23B93A46C(v17, v18, v19, v20);
    v31 = sub_23B9287E0(v21, v22, v30);
    sub_23B9585A4();
    swift_bridgeObjectRelease();
    *(_WORD *)(v16 + 12) = 2082;
    sub_23B92F2B8(&qword_256A55510, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAB8]);
    v23 = sub_23B9587F0();
    v31 = sub_23B9287E0(v23, v24, v30);
    sub_23B9585A4();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    _os_log_impl(&dword_23B916000, v14, v15, "%{public}s: Got didSend callback for unsent message! %{public}s", (uint8_t *)v16, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x242609864](v17, -1, -1);
    MEMORY[0x242609864](v16, -1, -1);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  }

}

uint64_t sub_23B946994(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  *(_QWORD *)(v4 + 56) = a2;
  *(_QWORD *)(v4 + 64) = v3;
  v5 = a1[1];
  *(_QWORD *)(v4 + 72) = *a1;
  *(_QWORD *)(v4 + 80) = v5;
  *(_BYTE *)(v4 + 128) = *(_BYTE *)a3;
  v6 = *(_QWORD *)(a3 + 16);
  *(_QWORD *)(v4 + 88) = *(_QWORD *)(a3 + 8);
  *(_QWORD *)(v4 + 96) = v6;
  return swift_task_switch();
}

uint64_t sub_23B9469C4()
{
  uint64_t v0;
  uint64_t v1;
  int *v2;
  __int128 v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  int *v9;

  v1 = *(_QWORD *)(v0 + 64);
  v2 = *(int **)(v1 + 160);
  *(_QWORD *)(v0 + 104) = v2;
  if (!v2)
    return (*(uint64_t (**)(void))(v0 + 8))();
  v3 = *(_OWORD *)(v0 + 88);
  v4 = *(_BYTE *)(v0 + 128);
  v6 = *(_QWORD *)(v0 + 72);
  v5 = *(_QWORD *)(v0 + 80);
  *(_QWORD *)(v0 + 112) = *(_QWORD *)(v1 + 168);
  *(_QWORD *)(v0 + 40) = v6;
  *(_QWORD *)(v0 + 48) = v5;
  *(_BYTE *)(v0 + 16) = v4;
  *(_OWORD *)(v0 + 24) = v3;
  v9 = (int *)((char *)v2 + *v2);
  swift_retain();
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 120) = v7;
  *v7 = v0;
  v7[1] = sub_23B92DEFC;
  return ((uint64_t (*)(uint64_t, _QWORD, uint64_t))v9)(v0 + 40, *(_QWORD *)(v0 + 56), v0 + 16);
}

uint64_t sub_23B946A90(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;
  uint64_t v7;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  *(_QWORD *)(v7 + 96) = a6;
  *(_QWORD *)(v7 + 104) = v6;
  *(_QWORD *)(v7 + 80) = a2;
  *(_QWORD *)(v7 + 88) = a4;
  *(_QWORD *)(v7 + 72) = a1;
  *(_QWORD *)(v7 + 112) = *v6;
  v10 = *(_QWORD *)(type metadata accessor for MessageContext() - 8);
  *(_QWORD *)(v7 + 120) = v10;
  *(_QWORD *)(v7 + 128) = *(_QWORD *)(v10 + 64);
  *(_QWORD *)(v7 + 136) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254309C80);
  v11 = swift_task_alloc();
  v12 = *a3;
  v13 = a3[1];
  *(_QWORD *)(v7 + 144) = v11;
  *(_QWORD *)(v7 + 152) = v12;
  *(_BYTE *)(v7 + 184) = *(_BYTE *)a5;
  v14 = *(_QWORD *)(a5 + 8);
  v15 = *(_QWORD *)(a5 + 16);
  *(_QWORD *)(v7 + 160) = v13;
  *(_QWORD *)(v7 + 168) = v14;
  *(_QWORD *)(v7 + 176) = v15;
  return swift_task_switch();
}

uint64_t sub_23B946B4C()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  BOOL v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  _BOOL4 v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
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
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  os_log_type_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t type;
  uint64_t v49;

  v1 = *(_QWORD *)(v0 + 104);
  v3 = *(_QWORD *)(v1 + 112);
  v2 = *(_QWORD *)(v1 + 120);
  v4 = v3 == *(_QWORD *)(v0 + 72) && v2 == *(_QWORD *)(v0 + 80);
  if (v4 || (sub_23B958820() & 1) != 0)
  {
    if (qword_254309BD0 != -1)
      swift_once();
    v5 = sub_23B95831C();
    __swift_project_value_buffer(v5, (uint64_t)qword_254309BB8);
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    v6 = sub_23B958304();
    v7 = sub_23B958568();
    v8 = os_log_type_enabled(v6, v7);
    v9 = *(_QWORD *)(v0 + 176);
    if (v8)
    {
      v43 = *(_QWORD *)(v0 + 168);
      v10 = *(_QWORD *)(v0 + 80);
      v40 = *(_QWORD *)(v0 + 72);
      v11 = swift_slowAlloc();
      v45 = swift_slowAlloc();
      v49 = v45;
      *(_DWORD *)v11 = 136315907;
      v15 = sub_23B93A46C(v45, v12, v13, v14);
      *(_QWORD *)(v0 + 40) = sub_23B9287E0(v15, v16, &v49);
      sub_23B9585A4();
      swift_bridgeObjectRelease();
      *(_WORD *)(v11 + 12) = 2082;
      swift_bridgeObjectRetain();
      *(_QWORD *)(v0 + 48) = sub_23B9287E0(v40, v10, &v49);
      sub_23B9585A4();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v11 + 22) = 2160;
      *(_QWORD *)(v0 + 56) = 1752392040;
      sub_23B9585A4();
      *(_WORD *)(v11 + 32) = 2081;
      swift_bridgeObjectRetain();
      *(_QWORD *)(v0 + 64) = sub_23B9287E0(v43, v9, &v49);
      sub_23B9585A4();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_23B916000, v6, v7, "%s: Received raw dictionary on %{public}s from %{private,mask.hash}s", (uint8_t *)v11, 0x2Au);
      swift_arrayDestroy();
      MEMORY[0x242609864](v45, -1, -1);
      MEMORY[0x242609864](v11, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
    }

    v17 = *(_QWORD *)(v0 + 104);
    v18 = *(_QWORD *)(v17 + 192);
    if (v18)
    {
      v19 = *(_QWORD *)(v0 + 176);
      v44 = *(_BYTE *)(v0 + 184);
      v20 = *(_QWORD *)(v0 + 144);
      v41 = *(_QWORD *)(v0 + 152);
      v42 = *(_QWORD *)(v0 + 160);
      v46 = *(_QWORD *)(v0 + 168);
      v21 = *(_QWORD *)(v0 + 136);
      v22 = *(_QWORD *)(v0 + 120);
      v23 = *(_QWORD *)(v0 + 88);
      v24 = *(_QWORD *)(v0 + 96);
      v25 = *(_QWORD *)(v17 + 200);
      v26 = sub_23B9584F0();
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v26 - 8) + 56))(v20, 1, 1, v26);
      sub_23B92F2F8(v24, v21, (uint64_t (*)(_QWORD))type metadata accessor for MessageContext);
      v27 = (*(unsigned __int8 *)(v22 + 80) + 96) & ~(unint64_t)*(unsigned __int8 *)(v22 + 80);
      v28 = swift_allocObject();
      *(_QWORD *)(v28 + 16) = 0;
      *(_QWORD *)(v28 + 24) = 0;
      *(_QWORD *)(v28 + 32) = v18;
      *(_QWORD *)(v28 + 40) = v25;
      *(_QWORD *)(v28 + 48) = v41;
      *(_QWORD *)(v28 + 56) = v42;
      *(_BYTE *)(v28 + 64) = v44;
      *(_QWORD *)(v28 + 72) = v46;
      *(_QWORD *)(v28 + 80) = v19;
      *(_QWORD *)(v28 + 88) = v23;
      sub_23B92F378(v21, v28 + v27, (uint64_t (*)(_QWORD))type metadata accessor for MessageContext);
      swift_bridgeObjectRetain();
      sub_23B92ED9C(v18);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_23B94CA58(v20, (uint64_t)&unk_256A55968, v28);
      swift_release();
    }
  }
  else
  {
    if (qword_254309BD0 != -1)
      swift_once();
    v29 = sub_23B95831C();
    __swift_project_value_buffer(v29, (uint64_t)qword_254309BB8);
    swift_bridgeObjectRetain_n();
    swift_retain_n();
    v30 = sub_23B958304();
    v31 = sub_23B958550();
    if (os_log_type_enabled(v30, v31))
    {
      v32 = *(_QWORD *)(v0 + 80);
      v47 = *(_QWORD *)(v0 + 72);
      v33 = swift_slowAlloc();
      type = swift_slowAlloc();
      v49 = type;
      *(_DWORD *)v33 = 136446722;
      v37 = sub_23B93A46C(type, v34, v35, v36);
      *(_QWORD *)(v0 + 16) = sub_23B9287E0(v37, v38, &v49);
      sub_23B9585A4();
      swift_bridgeObjectRelease();
      *(_WORD *)(v33 + 12) = 2082;
      swift_bridgeObjectRetain();
      *(_QWORD *)(v0 + 24) = sub_23B9287E0(v3, v2, &v49);
      sub_23B9585A4();
      swift_bridgeObjectRelease();
      swift_release_n();
      *(_WORD *)(v33 + 22) = 2082;
      swift_bridgeObjectRetain();
      *(_QWORD *)(v0 + 32) = sub_23B9287E0(v47, v32, &v49);
      sub_23B9585A4();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_23B916000, v30, v31, "%{public}s: Ignoring delegate callback from wrong IDS service! Expected %{public}s, received: %{public}s", (uint8_t *)v33, 0x20u);
      swift_arrayDestroy();
      MEMORY[0x242609864](type, -1, -1);
      MEMORY[0x242609864](v33, -1, -1);
    }
    else
    {
      swift_release_n();
      swift_bridgeObjectRelease_n();
    }

  }
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23B947160(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = v1;
  return swift_task_switch();
}

uint64_t sub_23B947178()
{
  uint64_t v0;
  uint64_t v1;
  int *v2;
  _QWORD *v3;
  uint64_t (*v5)(_QWORD);

  v1 = *(_QWORD *)(v0 + 24);
  v2 = *(int **)(v1 + 208);
  *(_QWORD *)(v0 + 32) = v2;
  if (!v2)
    return (*(uint64_t (**)(void))(v0 + 8))();
  *(_QWORD *)(v0 + 40) = *(_QWORD *)(v1 + 216);
  v5 = (uint64_t (*)(_QWORD))((char *)v2 + *v2);
  swift_retain();
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 48) = v3;
  *v3 = v0;
  v3[1] = sub_23B92E704;
  return v5(*(_QWORD *)(v0 + 16));
}

uint64_t sub_23B947210(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = v1;
  return swift_task_switch();
}

uint64_t sub_23B947228()
{
  uint64_t v0;
  uint64_t v1;
  int *v2;
  _QWORD *v3;
  uint64_t (*v5)(_QWORD);

  v1 = *(_QWORD *)(v0 + 24);
  v2 = *(int **)(v1 + 224);
  *(_QWORD *)(v0 + 32) = v2;
  if (!v2)
    return (*(uint64_t (**)(void))(v0 + 8))();
  *(_QWORD *)(v0 + 40) = *(_QWORD *)(v1 + 232);
  v5 = (uint64_t (*)(_QWORD))((char *)v2 + *v2);
  swift_retain();
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 48) = v3;
  *v3 = v0;
  v3[1] = sub_23B92E80C;
  return v5(*(_QWORD *)(v0 + 16));
}

uint64_t sub_23B9472C0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  void (*v8)(uint64_t, uint64_t);
  uint64_t v9;
  uint64_t v10;

  v1 = type metadata accessor for MessageContext();
  v2 = *(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80);
  v3 = (v2 + 96) & ~v2;
  swift_unknownObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v4 = v0 + v3;
  v5 = sub_23B9582F8();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v0 + v3, 1, v5);
  v8 = *(void (**)(uint64_t, uint64_t))(v6 + 8);
  if (!v7)
    v8(v0 + v3, v5);
  v8(v4 + *(int *)(v1 + 20), v5);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v9 = v4 + *(int *)(v1 + 44);
  v10 = sub_23B9582B0();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 8))(v9, v10);
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_23B9473FC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  int *v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  __int128 v12;

  v2 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for MessageContext() - 8) + 80);
  v3 = *(int **)(v0 + 32);
  v4 = *(_QWORD *)(v0 + 48);
  v5 = *(_QWORD *)(v0 + 56);
  v6 = *(_BYTE *)(v0 + 64);
  v12 = *(_OWORD *)(v0 + 72);
  v7 = *(_QWORD *)(v0 + 88);
  v8 = v0 + ((v2 + 96) & ~v2);
  v9 = swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v9;
  *(_QWORD *)v9 = v1;
  *(_QWORD *)(v9 + 8) = sub_23B930844;
  *(_QWORD *)(v9 + 40) = v4;
  *(_QWORD *)(v9 + 48) = v5;
  *(_BYTE *)(v9 + 16) = v6;
  *(_OWORD *)(v9 + 24) = v12;
  *(_QWORD *)&v12 = (char *)v3 + *v3;
  v10 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v9 + 56) = v10;
  *v10 = v9;
  v10[1] = sub_23B927B9C;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))v12)(v9 + 40, v9 + 16, v7, v8);
}

uint64_t sub_23B9474F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  void (*v18)(uint64_t, uint64_t);
  uint64_t v19;
  uint64_t v20;

  v5 = *(_QWORD *)(v4 + 32);
  v6 = type metadata accessor for Message(0, v5, *(_QWORD *)(v4 + 40), a4);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = (*(unsigned __int8 *)(v7 + 80) + 104) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  v9 = (*(_QWORD *)(v7 + 64) + v8 + 7) & 0xFFFFFFFFFFFFFFF8;
  v10 = type metadata accessor for MessageContext();
  v11 = *(unsigned __int8 *)(*(_QWORD *)(v10 - 8) + 80);
  v12 = (v9 + v11 + 8) & ~v11;
  swift_unknownObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v13 = v4 + v8;
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v13, v5);
  sub_23B92D4DC(*(_QWORD *)(v13 + *(int *)(v6 + 40)), *(_QWORD *)(v13 + *(int *)(v6 + 40) + 8));
  swift_bridgeObjectRelease();
  v14 = v4 + v12;
  v15 = sub_23B9582F8();
  v16 = *(_QWORD *)(v15 - 8);
  v17 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v16 + 48))(v4 + v12, 1, v15);
  v18 = *(void (**)(uint64_t, uint64_t))(v16 + 8);
  if (!v17)
    v18(v4 + v12, v15);
  v18(v14 + *(int *)(v10 + 20), v15);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v19 = v14 + *(int *)(v10 + 44);
  v20 = sub_23B9582B0();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 8))(v19, v20);
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_23B947698(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int *v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  __int128 v21;

  v6 = *(_QWORD *)(type metadata accessor for Message(0, *(_QWORD *)(v4 + 32), *(_QWORD *)(v4 + 40), a4) - 8);
  v7 = (*(unsigned __int8 *)(v6 + 80) + 104) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  v8 = (*(_QWORD *)(v6 + 64) + v7 + 7) & 0xFFFFFFFFFFFFFFF8;
  v9 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for MessageContext() - 8) + 80);
  v10 = (v8 + v9 + 8) & ~v9;
  v11 = *(int **)(v4 + 48);
  v12 = *(_QWORD *)(v4 + 64);
  v13 = *(_QWORD *)(v4 + 72);
  v14 = *(_BYTE *)(v4 + 80);
  v21 = *(_OWORD *)(v4 + 88);
  v15 = v4 + v7;
  v16 = *(_QWORD *)(v4 + v8);
  v17 = v4 + v10;
  v18 = swift_task_alloc();
  *(_QWORD *)(v5 + 16) = v18;
  *(_QWORD *)v18 = v5;
  *(_QWORD *)(v18 + 8) = sub_23B930844;
  *(_QWORD *)(v18 + 40) = v12;
  *(_QWORD *)(v18 + 48) = v13;
  *(_BYTE *)(v18 + 16) = v14;
  *(_OWORD *)(v18 + 24) = v21;
  *(_QWORD *)&v21 = (char *)v11 + *v11;
  v19 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v18 + 56) = v19;
  *v19 = v18;
  v19[1] = sub_23B93083C;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))v21)(v18 + 40, v18 + 16, v15, v16, v17);
}

uint64_t sub_23B9477C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  void (*v18)(unint64_t, uint64_t);
  uint64_t v19;
  uint64_t v20;

  v5 = *(_QWORD *)(v4 + 32);
  v6 = type metadata accessor for Message(0, v5, *(_QWORD *)(v4 + 40), a4);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = (*(unsigned __int8 *)(v7 + 80) + 104) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  v9 = *(_QWORD *)(v7 + 64);
  v10 = type metadata accessor for MessageContext();
  v11 = *(unsigned __int8 *)(*(_QWORD *)(v10 - 8) + 80);
  v12 = (v8 + v9 + v11) & ~v11;
  swift_unknownObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v13 = v4 + v8;
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v13, v5);
  sub_23B92D4DC(*(_QWORD *)(v13 + *(int *)(v6 + 40)), *(_QWORD *)(v13 + *(int *)(v6 + 40) + 8));
  v14 = v4 + v12;
  v15 = sub_23B9582F8();
  v16 = *(_QWORD *)(v15 - 8);
  v17 = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v16 + 48))(v4 + v12, 1, v15);
  v18 = *(void (**)(unint64_t, uint64_t))(v16 + 8);
  if (!v17)
    v18(v4 + v12, v15);
  v18(v14 + *(int *)(v10 + 20), v15);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v19 = v14 + *(int *)(v10 + 44);
  v20 = sub_23B9582B0();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 8))(v19, v20);
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_23B94795C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v17;

  v6 = *(_QWORD *)(type metadata accessor for Message(0, *(_QWORD *)(v4 + 32), *(_QWORD *)(v4 + 40), a4) - 8);
  v7 = (*(unsigned __int8 *)(v6 + 80) + 104) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  v8 = *(_QWORD *)(v6 + 64);
  v9 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for MessageContext() - 8) + 80);
  v10 = v7 + v8 + v9;
  v17 = *(_OWORD *)(v4 + 64);
  LOBYTE(v8) = *(_BYTE *)(v4 + 80);
  v11 = *(_QWORD *)(v4 + 88);
  v12 = *(_QWORD *)(v4 + 96);
  v13 = v4 + (v10 & ~v9);
  v14 = swift_task_alloc();
  v15 = *(_OWORD *)(v4 + 48);
  *(_QWORD *)(v5 + 16) = v14;
  *(_QWORD *)v14 = v5;
  *(_QWORD *)(v14 + 8) = sub_23B930844;
  *(_QWORD *)(v14 + 104) = v4 + v7;
  *(_QWORD *)(v14 + 112) = v13;
  *(_QWORD *)(v14 + 88) = v11;
  *(_QWORD *)(v14 + 96) = v12;
  *(_BYTE *)(v14 + 136) = v8;
  *(_OWORD *)(v14 + 72) = v17;
  *(_OWORD *)(v14 + 56) = v15;
  return swift_task_switch();
}

uint64_t sub_23B947A3C()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(unint64_t, uint64_t);
  unint64_t v6;

  v1 = type metadata accessor for MessagingOptions();
  v2 = (*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 72) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80);
  swift_unknownObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v3 = sub_23B9582F8();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = *(void (**)(unint64_t, uint64_t))(v4 + 8);
  v5(v0 + v2, v3);
  swift_bridgeObjectRelease();
  v6 = v0 + v2 + *(int *)(v1 + 28);
  if (!(*(unsigned int (**)(unint64_t, uint64_t, uint64_t))(v4 + 48))(v6, 1, v3))
    v5(v6, v3);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23B947B60()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;

  v2 = *(_QWORD *)(type metadata accessor for MessagingOptions() - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 72) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = *(_QWORD *)(v0 + 56);
  v5 = *(_QWORD *)(v0 + 64);
  v6 = v0 + v3;
  v7 = *(_QWORD *)(v0 + ((*(_QWORD *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFF8));
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v8;
  *v8 = v1;
  v8[1] = sub_23B930844;
  v9 = (_QWORD *)swift_task_alloc();
  v8[2] = v9;
  *v9 = v8;
  v9[1] = sub_23B930844;
  return sub_23B940458(v4, v5, v6, v7);
}

uint64_t sub_23B947C20()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t);
  uint64_t v7;

  v1 = type metadata accessor for MessagingOptions();
  v2 = *(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v3 = v0 + ((v2 + 56) & ~v2);
  v4 = sub_23B9582F8();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(void (**)(uint64_t, uint64_t))(v5 + 8);
  v6(v3, v4);
  swift_bridgeObjectRelease();
  v7 = v3 + *(int *)(v1 + 28);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(v7, 1, v4))
    v6(v7, v4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_23B947D34(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;

  v4 = *(_QWORD *)(type metadata accessor for MessagingOptions() - 8);
  v5 = (*(unsigned __int8 *)(v4 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v6 = v1[4];
  v7 = v1[5];
  v8 = v1[6];
  v9 = (uint64_t)v1 + v5;
  v10 = *(_QWORD *)((char *)v1 + ((*(_QWORD *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFF8));
  v11 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v11;
  *v11 = v2;
  v11[1] = sub_23B930844;
  return sub_23B941DEC(a1, v6, v7, v8, v9, v10);
}

uint64_t sub_23B947DE0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(unint64_t, uint64_t);
  unint64_t v16;

  v5 = *(_QWORD *)(v4 + 32);
  v6 = type metadata accessor for Message(0, v5, *(_QWORD *)(v4 + 40), a4);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = (*(unsigned __int8 *)(v7 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  v9 = *(_QWORD *)(v7 + 64);
  v10 = type metadata accessor for MessagingOptions();
  v11 = (v8 + v9 + *(unsigned __int8 *)(*(_QWORD *)(v10 - 8) + 80)) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v10 - 8) + 80);
  swift_unknownObjectRelease();
  swift_release();
  v12 = v4 + v8;
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v12, v5);
  sub_23B92D4DC(*(_QWORD *)(v12 + *(int *)(v6 + 40)), *(_QWORD *)(v12 + *(int *)(v6 + 40) + 8));
  v13 = sub_23B9582F8();
  v14 = *(_QWORD *)(v13 - 8);
  v15 = *(void (**)(unint64_t, uint64_t))(v14 + 8);
  v15(v4 + v11, v13);
  swift_bridgeObjectRelease();
  v16 = v4 + v11 + *(int *)(v10 + 28);
  if (!(*(unsigned int (**)(unint64_t, uint64_t, uint64_t))(v14 + 48))(v16, 1, v13))
    v15(v16, v13);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23B947F5C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;

  v6 = *(_QWORD *)(type metadata accessor for Message(0, *(_QWORD *)(v4 + 32), *(_QWORD *)(v4 + 40), a4) - 8);
  v7 = (*(unsigned __int8 *)(v6 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  v8 = *(_QWORD *)(v6 + 64);
  v9 = *(_QWORD *)(type metadata accessor for MessagingOptions() - 8);
  v10 = (v7 + v8 + *(unsigned __int8 *)(v9 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  v11 = v4 + v7;
  v12 = v4 + v10;
  v13 = *(_QWORD *)(v4 + ((*(_QWORD *)(v9 + 64) + v10 + 7) & 0xFFFFFFFFFFFFF8));
  v14 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v5 + 16) = v14;
  *v14 = v5;
  v14[1] = sub_23B92F9BC;
  v15 = (_QWORD *)swift_task_alloc();
  v14[2] = v15;
  *v15 = v14;
  v15[1] = sub_23B930844;
  return sub_23B93F348(v11, v12, v13);
}

uint64_t sub_23B94803C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(unint64_t, uint64_t);
  unint64_t v16;

  v5 = *(_QWORD *)(v4 + 16);
  v6 = type metadata accessor for Message(0, v5, *(_QWORD *)(v4 + 24), a4);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = (*(unsigned __int8 *)(v7 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  v9 = *(_QWORD *)(v7 + 64);
  v10 = type metadata accessor for MessagingOptions();
  v11 = (v8 + v9 + *(unsigned __int8 *)(*(_QWORD *)(v10 - 8) + 80)) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v10 - 8) + 80);
  swift_release();
  v12 = v4 + v8;
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v12, v5);
  sub_23B92D4DC(*(_QWORD *)(v12 + *(int *)(v6 + 40)), *(_QWORD *)(v12 + *(int *)(v6 + 40) + 8));
  v13 = sub_23B9582F8();
  v14 = *(_QWORD *)(v13 - 8);
  v15 = *(void (**)(unint64_t, uint64_t))(v14 + 8);
  v15(v4 + v11, v13);
  swift_bridgeObjectRelease();
  v16 = v4 + v11 + *(int *)(v10 + 28);
  if (!(*(unsigned int (**)(unint64_t, uint64_t, uint64_t))(v14 + 48))(v16, 1, v13))
    v15(v16, v13);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_23B9481A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t *v4;
  uint64_t v5;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;

  v7 = *(_QWORD *)(type metadata accessor for Message(0, v4[2], v4[3], a4) - 8);
  v8 = (*(unsigned __int8 *)(v7 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  v9 = *(_QWORD *)(v7 + 64);
  v10 = *(_QWORD *)(type metadata accessor for MessagingOptions() - 8);
  v11 = (v8 + v9 + *(unsigned __int8 *)(v10 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v12 = (uint64_t *)v4[4];
  v13 = (uint64_t)v4 + v8;
  v14 = (uint64_t)v4 + v11;
  v15 = *(uint64_t *)((char *)v4 + ((*(_QWORD *)(v10 + 64) + v11 + 7) & 0xFFFFFFFFFFFFF8));
  v16 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v5 + 16) = v16;
  *v16 = v5;
  v16[1] = sub_23B92F9BC;
  return sub_23B941940(a1, v12, v13, v14, v15);
}

uint64_t sub_23B948274(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(unint64_t, uint64_t);
  unint64_t v16;

  v5 = *(_QWORD *)(v4 + 32);
  v6 = type metadata accessor for Message(0, v5, *(_QWORD *)(v4 + 40), a4);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = (*(unsigned __int8 *)(v7 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  v9 = (*(_QWORD *)(v7 + 64) + v8 + 7) & 0xFFFFFFFFFFFFFFF8;
  v10 = type metadata accessor for MessagingOptions();
  v11 = (v9 + *(unsigned __int8 *)(*(_QWORD *)(v10 - 8) + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v10 - 8) + 80);
  swift_unknownObjectRelease();
  swift_release();
  v12 = v4 + v8;
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v12, v5);
  sub_23B92D4DC(*(_QWORD *)(v12 + *(int *)(v6 + 40)), *(_QWORD *)(v12 + *(int *)(v6 + 40) + 8));
  swift_bridgeObjectRelease();
  v13 = sub_23B9582F8();
  v14 = *(_QWORD *)(v13 - 8);
  v15 = *(void (**)(unint64_t, uint64_t))(v14 + 8);
  v15(v4 + v11, v13);
  swift_bridgeObjectRelease();
  v16 = v4 + v11 + *(int *)(v10 + 28);
  if (!(*(unsigned int (**)(unint64_t, uint64_t, uint64_t))(v14 + 48))(v16, 1, v13))
    v15(v16, v13);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23B948414(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;

  v6 = *(_QWORD *)(type metadata accessor for Message(0, *(_QWORD *)(v4 + 32), *(_QWORD *)(v4 + 40), a4) - 8);
  v7 = (*(unsigned __int8 *)(v6 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  v8 = (*(_QWORD *)(v6 + 64) + v7 + 7) & 0xFFFFFFFFFFFFFFF8;
  v9 = *(_QWORD *)(type metadata accessor for MessagingOptions() - 8);
  v10 = (v8 + *(unsigned __int8 *)(v9 + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  v11 = (*(_QWORD *)(v9 + 64) + v10 + 7) & 0xFFFFFFFFFFFFFFF8;
  v12 = v4 + v7;
  v13 = *(_QWORD *)(v4 + v8);
  v14 = v4 + v10;
  v15 = *(_QWORD *)(v4 + v11);
  v16 = *(_QWORD *)(v4 + ((v11 + 15) & 0xFFFFFFFFFFFFF8));
  v17 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v5 + 16) = v17;
  *v17 = v5;
  v17[1] = sub_23B930844;
  v18 = (_QWORD *)swift_task_alloc();
  v17[2] = v18;
  *v18 = v17;
  v18[1] = sub_23B930844;
  return sub_23B93DF40(v12, v13, v14, v15, v16);
}

uint64_t sub_23B948520()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(unint64_t, uint64_t);
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v19;
  uint64_t v20;

  v2 = *(_QWORD *)(v0 + 16);
  v1 = *(_QWORD *)(v0 + 24);
  v3 = sub_23B95825C();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = (*(unsigned __int8 *)(v4 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v6 = (((*(_QWORD *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8;
  v7 = type metadata accessor for MessagingOptions();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = (*(unsigned __int8 *)(v8 + 80) + v6 + 8) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  v19 = *(_QWORD *)(v8 + 64);
  v20 = type metadata accessor for Message(0, v2, v1, v10);
  v11 = *(unsigned __int8 *)(*(_QWORD *)(v20 - 8) + 80);
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v4 + 8))(v0 + v5, v3);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v12 = sub_23B9582F8();
  v13 = *(_QWORD *)(v12 - 8);
  v14 = *(void (**)(unint64_t, uint64_t))(v13 + 8);
  v14(v0 + v9, v12);
  swift_bridgeObjectRelease();
  v15 = v0 + v9 + *(int *)(v7 + 28);
  if (!(*(unsigned int (**)(unint64_t, uint64_t, uint64_t))(v13 + 48))(v15, 1, v12))
    v14(v15, v12);
  v16 = (v19 + v11 + v9) & ~v11;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(unint64_t))(*(_QWORD *)(v2 - 8) + 8))(v0 + v16);
  v17 = v0 + v16 + *(int *)(v20 + 40);
  sub_23B92D4DC(*(_QWORD *)v17, *(_QWORD *)(v17 + 8));
  return swift_deallocObject();
}

uint64_t sub_23B948708(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;

  v4 = v1[2];
  v5 = v1[3];
  v6 = *(_QWORD *)(sub_23B95825C() - 8);
  v7 = (*(unsigned __int8 *)(v6 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  v8 = (*(_QWORD *)(v6 + 64) + v7 + 7) & 0xFFFFFFFFFFFFFFF8;
  v9 = (v8 + 15) & 0xFFFFFFFFFFFFFFF8;
  v10 = *(_QWORD *)(type metadata accessor for MessagingOptions() - 8);
  v11 = (*(unsigned __int8 *)(v10 + 80) + v9 + 8) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v12 = *(_QWORD *)(v10 + 64);
  v14 = *(_QWORD *)(type metadata accessor for Message(0, v4, v5, v13) - 8);
  v15 = (v12 + *(unsigned __int8 *)(v14 + 80) + v11) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80);
  v16 = v1[4];
  v17 = (uint64_t)v1 + v7;
  v18 = *(_QWORD *)((char *)v1 + v8);
  v19 = *(_QWORD *)((char *)v1 + v9);
  v20 = (uint64_t)v1 + v11;
  v21 = (uint64_t)v1 + v15;
  v22 = *(_QWORD *)((char *)v1 + ((*(_QWORD *)(v14 + 64) + v15 + 7) & 0xFFFFFFFFFFFFF8));
  v23 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v23;
  *v23 = v2;
  v23[1] = sub_23B930844;
  return sub_23B9411A4(a1, v16, v17, v18, v19, v20, v21, v22);
}

uint64_t sub_23B948838(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(unint64_t, uint64_t);
  unint64_t v17;
  uint64_t v19;

  v5 = *(_QWORD *)(v4 + 32);
  v6 = type metadata accessor for Message(0, v5, *(_QWORD *)(v4 + 40), a4);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = (*(unsigned __int8 *)(v7 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  v9 = *(_QWORD *)(v7 + 64);
  v10 = type metadata accessor for MessagingOptions();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = (v8 + v9 + *(unsigned __int8 *)(v11 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  v19 = *(_QWORD *)(v11 + 64);
  swift_unknownObjectRelease();
  swift_release();
  v13 = v4 + v8;
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v13, v5);
  sub_23B92D4DC(*(_QWORD *)(v13 + *(int *)(v6 + 40)), *(_QWORD *)(v13 + *(int *)(v6 + 40) + 8));
  v14 = sub_23B9582F8();
  v15 = *(_QWORD *)(v14 - 8);
  v16 = *(void (**)(unint64_t, uint64_t))(v15 + 8);
  v16(v4 + v12, v14);
  swift_bridgeObjectRelease();
  v17 = v4 + v12 + *(int *)(v10 + 28);
  if (!(*(unsigned int (**)(unint64_t, uint64_t, uint64_t))(v15 + 48))(v17, 1, v14))
    v16(v17, v14);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_23B92D4DC(*(_QWORD *)(v4 + ((v19 + v12 + 7) & 0xFFFFFFFFFFFFFFF8)), *(_QWORD *)(v4 + ((v19 + v12 + 7) & 0xFFFFFFFFFFFFFFF8) + 8));
  swift_bridgeObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23B9489D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  _QWORD *v21;

  v6 = *(_QWORD *)(type metadata accessor for Message(0, *(_QWORD *)(v4 + 32), *(_QWORD *)(v4 + 40), a4) - 8);
  v7 = (*(unsigned __int8 *)(v6 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  v8 = *(_QWORD *)(v6 + 64);
  v9 = *(_QWORD *)(type metadata accessor for MessagingOptions() - 8);
  v10 = (v7 + v8 + *(unsigned __int8 *)(v9 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  v11 = (*(_QWORD *)(v9 + 64) + v10 + 7) & 0xFFFFFFFFFFFFFFF8;
  v12 = (v11 + 23) & 0xFFFFFFFFFFFFFFF8;
  v13 = v4 + v7;
  v14 = v4 + v10;
  v15 = (uint64_t *)(v4 + v11);
  v16 = *v15;
  v17 = v15[1];
  v18 = *(_QWORD *)(v4 + v12);
  v19 = *(_QWORD *)(v4 + ((v12 + 15) & 0xFFFFFFFFFFFFF8));
  v20 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v5 + 16) = v20;
  *v20 = v5;
  v20[1] = sub_23B930844;
  v21 = (_QWORD *)swift_task_alloc();
  v20[2] = v21;
  *v21 = v20;
  v21[1] = sub_23B930844;
  return sub_23B93CB64(v13, v14, v16, v17, v18, v19);
}

uint64_t sub_23B948AE8()
{
  char *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(char *, uint64_t);
  char *v11;
  unint64_t v12;
  char *v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v1 = *((_QWORD *)v0 + 2);
  v2 = *((_QWORD *)v0 + 3);
  v3 = type metadata accessor for MessagingOptions();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = (*(unsigned __int8 *)(v4 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v15 = *(_QWORD *)(v4 + 64);
  v17 = v1;
  v16 = type metadata accessor for Message(0, v1, v2, v6);
  v7 = *(unsigned __int8 *)(*(_QWORD *)(v16 - 8) + 80);
  swift_release();
  sub_23B92D4DC(*((_QWORD *)v0 + 5), *((_QWORD *)v0 + 6));
  swift_bridgeObjectRelease();
  v8 = sub_23B9582F8();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = *(void (**)(char *, uint64_t))(v9 + 8);
  v10(&v0[v5], v8);
  swift_bridgeObjectRelease();
  v11 = &v0[v5 + *(int *)(v3 + 28)];
  if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v11, 1, v8))
    v10(v11, v8);
  v12 = (v5 + v15 + v7) & ~v7;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(char *))(*(_QWORD *)(v17 - 8) + 8))(&v0[v12]);
  v13 = &v0[v12 + *(int *)(v16 + 40)];
  sub_23B92D4DC(*(_QWORD *)v13, *((_QWORD *)v13 + 1));
  return swift_deallocObject();
}

uint64_t sub_23B948C78(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;

  v4 = v1[2];
  v5 = v1[3];
  v6 = *(_QWORD *)(type metadata accessor for MessagingOptions() - 8);
  v7 = (*(unsigned __int8 *)(v6 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  v8 = v7 + *(_QWORD *)(v6 + 64);
  v10 = *(_QWORD *)(type metadata accessor for Message(0, v4, v5, v9) - 8);
  v11 = (v8 + *(unsigned __int8 *)(v10 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v12 = v1[4];
  v13 = v1[5];
  v14 = v1[6];
  v15 = v1[7];
  v16 = (uint64_t)v1 + v7;
  v17 = (uint64_t)v1 + v11;
  v18 = *(_QWORD *)((char *)v1 + ((*(_QWORD *)(v10 + 64) + v11 + 7) & 0xFFFFFFFFFFFFF8));
  v19 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v19;
  *v19 = v2;
  v19[1] = sub_23B930844;
  return sub_23B940AE0(a1, v12, v13, v14, v15, v16, v17, v18);
}

uint64_t sub_23B948D64(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  _OWORD v9[2];

  if (*(_QWORD *)(a1 + 24))
  {
    sub_23B92DA04((_OWORD *)a1, v9);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v8 = *v2;
    *v2 = 0x8000000000000000;
    sub_23B936D40(v9, a2, isUniquelyReferenced_nonNull_native);
    *v2 = v8;
    swift_bridgeObjectRelease();
    v5 = sub_23B95870C();
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(a2, v5);
  }
  else
  {
    sub_23B94A8FC(a1);
    sub_23B945E04(a2, v9);
    v7 = sub_23B95870C();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(a2, v7);
    return sub_23B94A8FC((uint64_t)v9);
  }
}

uint64_t sub_23B948E38()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;

  v0 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254309AE8);
  MEMORY[0x24BDAC7A8](v0);
  v2 = (char *)&v7 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_23B95870C();
  __swift_allocate_value_buffer(v3, qword_254309AC8);
  v4 = __swift_project_value_buffer(v3, (uint64_t)qword_254309AC8);
  sub_23B958700();
  v5 = *(_QWORD *)(v3 - 8);
  result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v5 + 48))(v2, 1, v3);
  if ((_DWORD)result != 1)
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v5 + 32))(v4, v2, v3);
  __break(1u);
  return result;
}

uint64_t static CodingUserInfoKey.messagingCoder.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_254309AE0 != -1)
    swift_once();
  v2 = sub_23B95870C();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_254309AC8);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t sub_23B948F90()
{
  unint64_t v0;

  v0 = sub_23B95876C();
  swift_bridgeObjectRelease();
  if (v0 >= 3)
    return 3;
  else
    return v0;
}

uint64_t sub_23B948FDC(char a1)
{
  return qword_23B959E10[a1];
}

uint64_t sub_23B948FF4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  MEMORY[0x2426097B0](&unk_23B959D20, a3);
  return sub_23B95882C();
}

uint64_t sub_23B949048(uint64_t a1)
{
  MEMORY[0x2426097B0](&unk_23B959D20, a1);
  return sub_23B95843C();
}

uint64_t sub_23B949094()
{
  MEMORY[0x2426097B0](&unk_23B959D20);
  return sub_23B958454();
}

uint64_t sub_23B9490E4()
{
  MEMORY[0x2426097B0](&unk_23B959D20);
  return sub_23B958448();
}

uint64_t sub_23B949134@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_23B948F90();
  *a1 = result;
  return result;
}

uint64_t sub_23B949160@<X0>(uint64_t *a1@<X8>)
{
  char *v1;
  uint64_t result;

  result = sub_23B948FDC(*v1);
  *a1 = result;
  a1[1] = 0xE100000000000000;
  return result;
}

uint64_t sub_23B94918C()
{
  char *v0;

  return sub_23B948FDC(*v0);
}

uint64_t sub_23B9491A8@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_23B948FD8();
  *a1 = result;
  return result;
}

uint64_t sub_23B9491CC@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_23B94A8F4();
  *a1 = result;
  return result;
}

uint64_t sub_23B9491F4(uint64_t a1)
{
  MEMORY[0x2426097B0](&unk_23B959DC0, a1);
  return sub_23B9588D4();
}

uint64_t sub_23B949228(uint64_t a1)
{
  MEMORY[0x2426097B0](&unk_23B959DC0, a1);
  return sub_23B9588E0();
}

BOOL static Message.MessageError.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t Message.MessageError.hash(into:)()
{
  return sub_23B95888C();
}

uint64_t Message.MessageError.hashValue.getter()
{
  sub_23B958880();
  sub_23B95888C();
  return sub_23B9588B0();
}

uint64_t sub_23B9492EC()
{
  sub_23B958880();
  Message.MessageError.hash(into:)();
  return sub_23B9588B0();
}

uint64_t Message.type.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(a1 + 16) - 8) + 16))(a2, v2);
}

uint64_t Message.version.getter(uint64_t a1)
{
  uint64_t v1;

  return *(_QWORD *)(v1 + *(int *)(a1 + 36));
}

uint64_t Message.payloadLength.getter(uint64_t a1)
{
  uint64_t v1;

  return ((uint64_t (*)(_QWORD))((char *)&loc_23B949368
                                         + dword_23B9493AC[*(_QWORD *)(v1 + *(int *)(a1 + 40) + 8) >> 62]))(0);
}

uint64_t sub_23B949378()
{
  uint64_t v0;

  return BYTE6(v0);
}

uint64_t Message.init<A>(type:version:payload:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X7>, uint64_t a8@<X8>)
{
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  void (*v18)(uint64_t, uint64_t, uint64_t);
  uint64_t v19;
  uint64_t v20;
  void (*v21)(char *, _QWORD);
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(uint64_t, uint64_t);
  uint64_t result;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char v40[32];
  _QWORD v41[4];
  uint64_t v42;

  v35 = a7;
  v38 = a3;
  v14 = sub_23B95870C();
  v15 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v14);
  v17 = (char *)&v34 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v37 = *(_QWORD *)(a4 - 8);
  v18 = *(void (**)(uint64_t, uint64_t, uint64_t))(v37 + 16);
  v39 = a1;
  v18(a8, a1, a4);
  v34 = type metadata accessor for Message(0, a4, a6, v19);
  *(_QWORD *)(a8 + *(int *)(v34 + 36)) = a2;
  sub_23B958214();
  swift_allocObject();
  sub_23B958208();
  if (qword_254309AE0 != -1)
    swift_once();
  v20 = __swift_project_value_buffer(v14, (uint64_t)qword_254309AC8);
  (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))(v17, v20, v14);
  v41[3] = MEMORY[0x24BEE1328];
  LOBYTE(v41[0]) = 1;
  v21 = (void (*)(char *, _QWORD))sub_23B9581FC();
  sub_23B948D64((uint64_t)v41, (uint64_t)v17);
  v21(v40, 0);
  sub_23B949F7C(a5, a5);
  v22 = *(_QWORD *)(a5 - 8);
  swift_allocObject();
  v23 = sub_23B95849C();
  v24 = v38;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v22 + 16))(v25, v38, a5);
  v26 = sub_23B9584B4();
  v41[0] = v23;
  v42 = v35;
  MEMORY[0x2426097B0](MEMORY[0x24BEE12A0], v26, &v42);
  v27 = v36;
  v28 = sub_23B9581F0();
  v30 = v29;
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v22 + 8))(v24, a5);
  if (v27)
  {
    v31 = *(void (**)(uint64_t, uint64_t))(v37 + 8);
    v31(v39, a4);
    swift_bridgeObjectRelease();
    return ((uint64_t (*)(uint64_t, uint64_t))v31)(a8, a4);
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t))(v37 + 8))(v39, a4);
    result = swift_bridgeObjectRelease();
    v33 = (uint64_t *)(a8 + *(int *)(v34 + 40));
    *v33 = v28;
    v33[1] = v30;
  }
  return result;
}

uint64_t type metadata accessor for Message(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for Message);
}

uint64_t Message.extract<A>()@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  void (*v14)(_BYTE *, _QWORD);
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _BYTE *v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _BYTE v28[32];
  _QWORD v29[4];
  uint64_t v30;

  v26 = a3;
  v25 = a4;
  v6 = sub_23B958598();
  v23 = *(_QWORD *)(v6 - 8);
  v24 = v6;
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v22 - v7;
  v9 = sub_23B95870C();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23B9581E4();
  swift_allocObject();
  sub_23B9581D8();
  if (qword_254309AE0 != -1)
    swift_once();
  v13 = __swift_project_value_buffer(v9, (uint64_t)qword_254309AC8);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, v13, v9);
  v29[3] = MEMORY[0x24BEE1328];
  LOBYTE(v29[0]) = 1;
  v14 = (void (*)(_BYTE *, _QWORD))sub_23B9581CC();
  sub_23B948D64((uint64_t)v29, (uint64_t)v12);
  v14(v28, 0);
  v15 = sub_23B9584B4();
  v30 = v26;
  MEMORY[0x2426097B0](MEMORY[0x24BEE12D0], v15, &v30);
  v16 = v27;
  sub_23B9581C0();
  if (v16)
    return swift_release();
  MEMORY[0x2426097B0](MEMORY[0x24BEE12E0], v15);
  sub_23B958538();
  swift_bridgeObjectRelease();
  v17 = *(_QWORD *)(a2 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48))(v8, 1, a2) == 1)
  {
    (*(void (**)(char *, uint64_t))(v23 + 8))(v8, v24);
    v19 = type metadata accessor for Message.MessageError(0, *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), v18);
    MEMORY[0x2426097B0](&protocol conformance descriptor for Message<A>.MessageError, v19);
    swift_allocError();
    *v20 = 0;
    swift_willThrow();
    return swift_release();
  }
  swift_release();
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v17 + 32))(v25, v8, a2);
}

uint64_t Message.encode(to:)(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v15[2];
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  char v19;

  v15[0] = a2;
  v5 = *(_QWORD *)(a2 + 24);
  v16 = *(_QWORD *)(a2 + 16);
  v6 = type metadata accessor for Message.CodingKeys(255, v16, v5, a4);
  MEMORY[0x2426097B0](&unk_23B959DC0, v6);
  v7 = sub_23B9587CC();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)v15 - v9;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  v11 = v15[1];
  sub_23B9588C8();
  LOBYTE(v18) = 0;
  v12 = v17;
  sub_23B9587C0();
  if (!v12)
  {
    v13 = v15[0];
    LOBYTE(v18) = 1;
    sub_23B9587B4();
    v18 = *(_OWORD *)(v11 + *(int *)(v13 + 40));
    v19 = 2;
    sub_23B949FE0();
    sub_23B9587C0();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

uint64_t Message.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  __int128 v40;
  char v41;

  v31 = a4;
  v33 = *(_QWORD *)(a2 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v38 = (char *)&v30 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for Message.CodingKeys(255, v8, v9, v10);
  MEMORY[0x2426097B0](&unk_23B959DC0, v11);
  v37 = sub_23B95879C();
  v32 = *(_QWORD *)(v37 - 8);
  MEMORY[0x24BDAC7A8](v37);
  v13 = (char *)&v30 - v12;
  v34 = a3;
  v35 = a2;
  v15 = type metadata accessor for Message(0, a2, a3, v14);
  v16 = *(_QWORD *)(v15 - 8);
  MEMORY[0x24BDAC7A8](v15);
  v18 = (char *)&v30 - v17;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  v36 = v13;
  v19 = v39;
  sub_23B9588BC();
  if (v19)
    return __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  v39 = v16;
  v20 = v15;
  v21 = v18;
  v22 = (uint64_t)a1;
  v24 = v32;
  v23 = v33;
  LOBYTE(v40) = 0;
  v25 = v35;
  v26 = v37;
  v27 = v36;
  sub_23B958790();
  (*(void (**)(char *, char *, uint64_t))(v23 + 32))(v21, v38, v25);
  LOBYTE(v40) = 1;
  *(_QWORD *)&v21[*(int *)(v20 + 36)] = sub_23B958784();
  v41 = 2;
  sub_23B94A024();
  sub_23B958790();
  (*(void (**)(char *, uint64_t))(v24 + 8))(v27, v26);
  *(_OWORD *)&v21[*(int *)(v20 + 40)] = v40;
  v28 = v39;
  (*(void (**)(uint64_t, char *, uint64_t))(v39 + 16))(v31, v21, v20);
  __swift_destroy_boxed_opaque_existential_0(v22);
  return (*(uint64_t (**)(char *, uint64_t))(v28 + 8))(v21, v20);
}

uint64_t sub_23B949D70@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return Message.init(from:)(a1, *(_QWORD *)(a2 + 16), *(_QWORD *)(a2 + 24), a3);
}

uint64_t sub_23B949D8C(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return Message.encode(to:)(a1, a2, a3, a4);
}

void Message.description.getter(uint64_t a1)
{
  sub_23B958688();
  MEMORY[0x2426097B0](&protocol conformance descriptor for Message<A>, a1);
  sub_23B9587D8();
  sub_23B958400();
  swift_bridgeObjectRelease();
  sub_23B958400();
  sub_23B958814();
  sub_23B958400();
  sub_23B9587F0();
  sub_23B958400();
  swift_bridgeObjectRelease();
  sub_23B958400();
  __asm { BR              X13 }
}

uint64_t sub_23B949EE0()
{
  uint64_t v1;

  sub_23B9587F0();
  sub_23B958400();
  swift_bridgeObjectRelease();
  sub_23B958400();
  return v1;
}

uint64_t sub_23B949F7C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  if (swift_isClassType())
    v3 = a2;
  else
    v3 = 0;
  if (v3)
    return __swift_instantiateConcreteTypeFromMangledName(&qword_256A55AD8);
  else
    return sub_23B9587FC();
}

uint64_t type metadata accessor for Message.MessageError(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for Message.MessageError);
}

uint64_t type metadata accessor for Message.CodingKeys(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for Message.CodingKeys);
}

unint64_t sub_23B949FE0()
{
  unint64_t result;

  result = qword_256A55A50[0];
  if (!qword_256A55A50[0])
  {
    result = MEMORY[0x2426097B0](MEMORY[0x24BDCDDF8], MEMORY[0x24BDCDDE8]);
    atomic_store(result, qword_256A55A50);
  }
  return result;
}

unint64_t sub_23B94A024()
{
  unint64_t result;

  result = qword_254309A20;
  if (!qword_254309A20)
  {
    result = MEMORY[0x2426097B0](MEMORY[0x24BDCDE38], MEMORY[0x24BDCDDE8]);
    atomic_store(result, (unint64_t *)&qword_254309A20);
  }
  return result;
}

void sub_23B94A068()
{
  JUMPOUT(0x2426097B0);
}

uint64_t sub_23B94A078()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_23B94A080()
{
  uint64_t result;
  unint64_t v1;

  result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_23B94A104(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  unint64_t v15;

  v4 = a1;
  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v6 = *(_QWORD *)(v5 + 64);
  v7 = *(_DWORD *)(v5 + 80);
  if ((v7 & 0x1000F8) != 0 || ((((v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 16 > 0x18)
  {
    v9 = *a2;
    *v4 = *a2;
    v4 = (uint64_t *)(v9 + ((unsigned __int16)((v7 & 0xF8) + 23) & (unsigned __int16)~(v7 & 0xF8) & 0x1F8));
    swift_retain();
  }
  else
  {
    (*(void (**)(uint64_t *, uint64_t *))(v5 + 16))(a1, a2);
    v10 = (_QWORD *)(((unint64_t)v4 + v6 + 7) & 0xFFFFFFFFFFFFF8);
    v11 = ((unint64_t)a2 + v6 + 7) & 0xFFFFFFFFFFFFF8;
    v12 = *(_QWORD *)v11;
    v11 += 15;
    *v10 = v12;
    v13 = (_QWORD *)(((unint64_t)v10 + 15) & 0xFFFFFFFFFFFFFFF8);
    v14 = *(_QWORD *)(v11 & 0xFFFFFFFFFFFFFFF8);
    v15 = *(_QWORD *)((v11 & 0xFFFFFFFFFFFFFFF8) + 8);
    sub_23B9304B0(v14, v15);
    *v13 = v14;
    v13[1] = v15;
  }
  return v4;
}

uint64_t sub_23B94A1D8(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  unint64_t v4;

  v3 = *(_QWORD *)(*(_QWORD *)(a2 + 16) - 8);
  (*(void (**)(void))(v3 + 8))();
  v4 = (((a1 + *(_QWORD *)(v3 + 64) + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8;
  return sub_23B92D4DC(*(_QWORD *)v4, *(_QWORD *)(v4 + 8));
}

uint64_t sub_23B94A220(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t *v10;
  uint64_t v11;
  unint64_t v12;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v5 + 16))();
  v6 = *(_QWORD *)(v5 + 64) + 7;
  v7 = (_QWORD *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  v8 = (_QWORD *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  *v7 = *v8;
  v9 = (_QWORD *)(((unint64_t)v7 + 15) & 0xFFFFFFFFFFFFFFF8);
  v10 = (uint64_t *)(((unint64_t)v8 + 15) & 0xFFFFFFFFFFFFFFF8);
  v11 = *v10;
  v12 = v10[1];
  sub_23B9304B0(*v10, v12);
  *v9 = v11;
  v9[1] = v12;
  return a1;
}

uint64_t sub_23B94A298(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t *v9;
  uint64_t *v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v5 + 24))();
  v6 = *(_QWORD *)(v5 + 64) + 7;
  v7 = (_QWORD *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  v8 = (_QWORD *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  *v7 = *v8;
  v9 = (uint64_t *)(((unint64_t)v7 + 15) & 0xFFFFFFFFFFFFFFF8);
  v10 = (uint64_t *)(((unint64_t)v8 + 15) & 0xFFFFFFFFFFFFFFF8);
  v11 = *v10;
  v12 = v10[1];
  sub_23B9304B0(*v10, v12);
  v13 = *v9;
  v14 = v9[1];
  *v9 = v11;
  v9[1] = v12;
  sub_23B92D4DC(v13, v14);
  return a1;
}

uint64_t sub_23B94A318(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v5 + 32))();
  v6 = *(_QWORD *)(v5 + 64) + 7;
  v7 = (_QWORD *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  v8 = (_QWORD *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  *v7 = *v8;
  *(_OWORD *)(((unint64_t)v7 + 15) & 0xFFFFFFFFFFFFF8) = *(_OWORD *)(((unint64_t)v8 + 15) & 0xFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_23B94A384(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t *v9;
  uint64_t v10;
  unint64_t v11;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v5 + 40))();
  v6 = *(_QWORD *)(v5 + 64) + 7;
  v7 = (_QWORD *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  v8 = (_QWORD *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  *v7 = *v8;
  v9 = (uint64_t *)(((unint64_t)v7 + 15) & 0xFFFFFFFFFFFFFFF8);
  v10 = *v9;
  v11 = v9[1];
  *(_OWORD *)v9 = *(_OWORD *)(((unint64_t)v8 + 15) & 0xFFFFFFFFFFFFF8);
  sub_23B92D4DC(v10, v11);
  return a1;
}

uint64_t sub_23B94A3F8(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  unsigned int v5;
  unsigned int v6;
  uint64_t v7;
  unsigned int v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v12;

  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v5 = *(_DWORD *)(v4 + 84);
  if (v5 <= 0xC)
    v6 = 12;
  else
    v6 = *(_DWORD *)(v4 + 84);
  if (!a2)
    return 0;
  v7 = *(_QWORD *)(v4 + 64);
  if (v6 >= a2)
  {
    if (v5 < 0xC)
    {
      v12 = *(_QWORD *)(((((a1 + v7 + 7) & 0xFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFF8) + 8) >> 60;
      if (((4 * (_DWORD)v12) & 0xC) != 0)
        return 16 - ((4 * (_DWORD)v12) & 0xC | (v12 >> 2));
      else
        return 0;
    }
    else
    {
      return (*(uint64_t (**)(void))(v4 + 48))();
    }
  }
  else
  {
    if (((((((v7 + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 16) & 0xFFFFFFF8) != 0)
      v8 = 2;
    else
      v8 = a2 - v6 + 1;
    if (v8 >= 0x10000)
      v9 = 4;
    else
      v9 = 2;
    if (v8 < 0x100)
      v9 = 1;
    if (v8 >= 2)
      v10 = v9;
    else
      v10 = 0;
    return ((uint64_t (*)(void))((char *)&loc_23B94A47C + 4 * byte_23B959B00[v10]))();
  }
}

void sub_23B94A514(unsigned int *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v5;
  unsigned int v6;
  unsigned int v7;
  int v8;
  int v9;
  unsigned int v10;

  v5 = *(_QWORD *)(*(_QWORD *)(a4 + 16) - 8);
  if (*(_DWORD *)(v5 + 84) <= 0xCu)
    v6 = 12;
  else
    v6 = *(_DWORD *)(v5 + 84);
  if (v6 >= a3)
  {
    v9 = 0;
    if (a2 <= v6)
      goto LABEL_17;
  }
  else
  {
    if (((((*(_DWORD *)(v5 + 64) + 7) & 0xFFFFFFF8) + 15) & 0xFFFFFFF8) == 0xFFFFFFF0)
      v7 = a3 - v6 + 1;
    else
      v7 = 2;
    if (v7 >= 0x10000)
      v8 = 4;
    else
      v8 = 2;
    if (v7 < 0x100)
      v8 = 1;
    if (v7 >= 2)
      v9 = v8;
    else
      v9 = 0;
    if (a2 <= v6)
LABEL_17:
      __asm { BR              X12 }
  }
  if (((((*(_DWORD *)(v5 + 64) + 7) & 0xFFFFFFF8) + 15) & 0xFFFFFFF8) != 0xFFFFFFF0)
  {
    v10 = ~v6 + a2;
    bzero(a1, ((((*(_QWORD *)(v5 + 64) + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 16);
    *a1 = v10;
  }
  __asm { BR              X10 }
}

void sub_23B94A610()
{
  uint64_t v0;
  uint64_t v1;
  char v2;

  *(_BYTE *)(v0 + v1) = v2;
  JUMPOUT(0x23B94A69CLL);
}

void sub_23B94A618(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t v3;

  *(_DWORD *)(v2 + v3) = 0;
  if (a2)
    JUMPOUT(0x23B94A620);
  JUMPOUT(0x23B94A69CLL);
}

void sub_23B94A678()
{
  uint64_t v0;
  uint64_t v1;
  __int16 v2;

  *(_WORD *)(v0 + v1) = v2;
  JUMPOUT(0x23B94A69CLL);
}

void sub_23B94A680()
{
  uint64_t v0;
  uint64_t v1;
  int v2;

  *(_DWORD *)(v0 + v1) = v2;
  JUMPOUT(0x23B94A69CLL);
}

uint64_t sub_23B94A688(uint64_t a1, unsigned int a2, unsigned int a3)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  *(_WORD *)(v7 + v8) = 0;
  if (!a2)
    goto LABEL_6;
  if (a3 < 0xC)
  {
    v4 = (_QWORD *)((((v7 + v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8);
    if (a2 > 0xC)
      JUMPOUT(0x23B94A694);
    *v4 = 0;
    v4[1] = (unint64_t)(((-a2 >> 2) & 3) - 4 * a2) << 60;
LABEL_6:
    JUMPOUT(0x23B94A69CLL);
  }
  return (*(uint64_t (**)(uint64_t))(v5 + 56))(v7);
}

uint64_t sub_23B94A6B4()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_23B94A6BC(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23B94A708 + 4 * byte_23B959B14[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_23B94A73C + 4 * byte_23B959B0F[v4]))();
}

uint64_t sub_23B94A73C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23B94A744(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23B94A74CLL);
  return result;
}

uint64_t sub_23B94A758(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23B94A760);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_23B94A764(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23B94A76C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23B94A778(unsigned __int8 *a1, unsigned int a2)
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

uint64_t sub_23B94A808(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23B94A854 + 4 * byte_23B959B1E[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_23B94A888 + 4 * byte_23B959B19[v4]))();
}

uint64_t sub_23B94A888(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23B94A890(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23B94A898);
  return result;
}

uint64_t sub_23B94A8A4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23B94A8ACLL);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_23B94A8B0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23B94A8B8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

void sub_23B94A8C4()
{
  JUMPOUT(0x2426097B0);
}

void sub_23B94A8D4()
{
  JUMPOUT(0x2426097B0);
}

void sub_23B94A8E4()
{
  JUMPOUT(0x2426097B0);
}

uint64_t sub_23B94A8F4()
{
  return 3;
}

uint64_t sub_23B94A8FC(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A55700);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t getEnumTagSinglePayload for MessagingError(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for MessagingError(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23B94AA18 + 4 * byte_23B959E2D[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_23B94AA4C + 4 * byte_23B959E28[v4]))();
}

uint64_t sub_23B94AA4C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23B94AA54(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23B94AA5CLL);
  return result;
}

uint64_t sub_23B94AA68(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23B94AA70);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_23B94AA74(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23B94AA7C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for MessagingError()
{
  return &type metadata for MessagingError;
}

unint64_t sub_23B94AA9C()
{
  unint64_t result;

  result = qword_256A55AE0;
  if (!qword_256A55AE0)
  {
    result = MEMORY[0x2426097B0](&unk_23B959E88, &type metadata for MessagingError);
    atomic_store(result, (unint64_t *)&qword_256A55AE0);
  }
  return result;
}

uint64_t sub_23B94AAE0(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_23B94AB18 + 4 * byte_23B959E32[a1]))(0xD000000000000012, 0x800000023B95AB70);
}

uint64_t sub_23B94AB18(uint64_t a1)
{
  return a1 + 20;
}

uint64_t sub_23B94AB5C()
{
  unsigned __int8 *v0;

  return sub_23B94AAE0(*v0);
}

uint64_t MessageContext.incomingResponseIdentifier.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_23B936898(v1, a1);
}

uint64_t MessageContext.outgoingResponseIdentifier.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for MessageContext() + 20);
  v4 = sub_23B9582F8();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t type metadata accessor for MessageContext()
{
  uint64_t result;

  result = qword_254309B90;
  if (!qword_254309B90)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t MessageContext.fromID.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = v1 + *(int *)(type metadata accessor for MessageContext() + 24);
  v5 = *(_QWORD *)(v3 + 8);
  v4 = *(_QWORD *)(v3 + 16);
  *(_BYTE *)a1 = *(_BYTE *)v3;
  *(_QWORD *)(a1 + 8) = v5;
  *(_QWORD *)(a1 + 16) = v4;
  return swift_bridgeObjectRetain();
}

uint64_t MessageContext.toID.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = v1 + *(int *)(type metadata accessor for MessageContext() + 28);
  v5 = *(_QWORD *)(v3 + 8);
  v4 = *(_QWORD *)(v3 + 16);
  *(_BYTE *)a1 = *(_BYTE *)v3;
  *(_QWORD *)(a1 + 8) = v5;
  *(_QWORD *)(a1 + 16) = v4;
  return swift_bridgeObjectRetain();
}

uint64_t MessageContext.serviceIdentifier.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for MessageContext() + 32));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t MessageContext.expectsPeerResponse.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for MessageContext() + 36));
}

uint64_t MessageContext.fromServerStorage.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for MessageContext() + 40));
}

uint64_t MessageContext.serverReceivedTime.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for MessageContext() + 44);
  v4 = sub_23B9582B0();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t MessageContext.senderCorrelationIdentifier.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for MessageContext() + 48));
  swift_bridgeObjectRetain();
  return v1;
}

id sub_23B94AD6C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _BYTE *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _BYTE *v20;
  id v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  id result;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  Swift::String v33;
  uint64_t v34;
  unint64_t v35;
  int v36;
  Swift::String v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  NSObject *v43;
  os_log_type_t v44;
  BOOL v45;
  uint8_t *v46;
  const char *v47;
  uint64_t v48;
  int *v49;
  _BYTE *v50;
  _BYTE *v51;
  id v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  int *v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t *v61;
  id v62;
  void *v63;
  uint64_t v64;
  void (*v65)(_BYTE *, _BYTE *, uint64_t);
  uint64_t v66;
  _BYTE *v67;
  uint64_t v68;
  int v69;
  _BYTE *v70;
  uint64_t v71;
  id v72;
  void *v73;
  uint64_t v74;
  unint64_t v75;
  unint64_t v76;
  uint64_t *v77;
  _BYTE v78[12];
  int v79;
  unint64_t v80;
  int v81;
  unint64_t v82;
  uint64_t v83;
  uint64_t v84;
  _BYTE *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  _BYTE *v89;
  _BYTE *v90;
  uint64_t v91;
  int *v92;
  uint64_t v93;
  unint64_t v94;
  uint64_t v95;
  FindMyMessaging::Destination_optional v96;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254309A28);
  MEMORY[0x24BDAC7A8](v4);
  v90 = &v78[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v91 = sub_23B9582B0();
  v88 = *(_QWORD *)(v91 - 8);
  v6 = MEMORY[0x24BDAC7A8](v91);
  v8 = &v78[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v6);
  v89 = &v78[-v9];
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_254309A30);
  MEMORY[0x24BDAC7A8](v10);
  v12 = &v78[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v13 = sub_23B9582F8();
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13);
  v16 = &v78[-((v15 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v17 = type metadata accessor for MessageContext();
  v18 = *(_QWORD *)(v17 - 8);
  MEMORY[0x24BDAC7A8](v17);
  v20 = &v78[-((v19 + 15) & 0xFFFFFFFFFFFFFFF0)];
  if ((sub_23B94C278(a1) & 1) == 0)
    goto LABEL_24;
  v85 = v16;
  v21 = objc_msgSend(a1, sel_toID);
  v92 = (int *)v17;
  if (v21)
  {
    v22 = v21;
    v83 = v14;
    v86 = v18;
    v87 = a2;
    v23 = sub_23B9583DC();
    v25 = v24;

  }
  else
  {
    v26 = IDSCopyLocalDeviceUniqueID();
    if (!v26)
    {
      if (qword_256A55448 != -1)
        swift_once();
      v54 = sub_23B95831C();
      __swift_project_value_buffer(v54, (uint64_t)qword_256A55CF0);
      v43 = sub_23B958304();
      v44 = sub_23B958550();
      if (!os_log_type_enabled(v43, v44))
        goto LABEL_23;
      v46 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v46 = 0;
      v47 = "Ignoring IDSCopyLocalDeviceUniqueID() failed to return a value!";
      goto LABEL_22;
    }
    v27 = (void *)v26;
    v83 = v14;
    v86 = v18;
    v87 = a2;
    sub_23B9583DC();

    v93 = 0x3A656369766564;
    v94 = 0xE700000000000000;
    sub_23B958400();
    swift_bridgeObjectRelease();
    v23 = v93;
    v25 = (void *)v94;
  }
  v84 = v13;
  result = objc_msgSend(a1, sel_fromID);
  if (!result)
  {
    __break(1u);
LABEL_38:
    __break(1u);
    goto LABEL_39;
  }
  v29 = result;
  v30 = sub_23B9583DC();
  v32 = v31;

  v33._countAndFlagsBits = v30;
  v33._object = v32;
  Destination.init(stringRepresentation:)(v33);
  v34 = v95;
  if (!v95
    || (v35 = v94,
        v36 = v93,
        v37._countAndFlagsBits = v23,
        v37._object = v25,
        v96 = Destination.init(stringRepresentation:)(v37),
        (v38 = v95) == 0))
  {
    swift_bridgeObjectRelease();

    v48 = 1;
    v18 = v86;
    a2 = v87;
    v17 = (uint64_t)v92;
    return (id)(*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v18 + 56))(a2, v48, 1, v17);
  }
  v81 = v36;
  v82 = v35;
  v80 = v94;
  v79 = v93;
  result = objc_msgSend(a1, sel_outgoingResponseIdentifier, v96.value.destination._object);
  if (!result)
    goto LABEL_38;
  v39 = result;
  sub_23B9583DC();

  sub_23B9582C8();
  swift_bridgeObjectRelease();
  v40 = v83;
  v41 = v84;
  if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v83 + 48))(v12, 1, v84) == 1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_23B930790((uint64_t)v12, &qword_254309A30);
    if (qword_256A55448 != -1)
      swift_once();
    v42 = sub_23B95831C();
    __swift_project_value_buffer(v42, (uint64_t)qword_256A55CF0);
    v43 = sub_23B958304();
    v44 = sub_23B958550();
    v45 = os_log_type_enabled(v43, v44);
    v18 = v86;
    a2 = v87;
    v17 = (uint64_t)v92;
    if (!v45)
      goto LABEL_23;
    v46 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v46 = 0;
    v47 = "could not convert outgoingResponseIdentifier to UUID!";
LABEL_22:
    _os_log_impl(&dword_23B916000, v43, v44, v47, v46, 2u);
    MEMORY[0x242609864](v46, -1, -1);
LABEL_23:

LABEL_24:
    v48 = 1;
    return (id)(*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v18 + 56))(a2, v48, 1, v17);
  }
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v40 + 32))(v85, v12, v41);
  v49 = v92;
  v50 = &v20[v92[6]];
  *v50 = v81;
  *((_QWORD *)v50 + 1) = v82;
  *((_QWORD *)v50 + 2) = v34;
  v51 = &v20[v49[7]];
  *v51 = v79;
  *((_QWORD *)v51 + 1) = v80;
  *((_QWORD *)v51 + 2) = v38;
  v52 = objc_msgSend(a1, sel_incomingResponseIdentifier);
  if (v52)
  {
    v53 = v52;
    sub_23B9583DC();

    v41 = v84;
    sub_23B9582C8();
    swift_bridgeObjectRelease();
  }
  else
  {
    (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(v40 + 56))(v20, 1, 1, v41);
  }
  v18 = v86;
  a2 = v87;
  v55 = v40;
  v56 = v92;
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v55 + 16))(&v20[v92[5]], v85, v41);
  result = objc_msgSend(a1, sel_serviceIdentifier);
  if (result)
  {
    v57 = result;
    v58 = sub_23B9583DC();
    v60 = v59;

    v61 = (uint64_t *)&v20[v56[8]];
    *v61 = v58;
    v61[1] = v60;
    v20[v56[9]] = objc_msgSend(a1, sel_expectsPeerResponse);
    v20[v56[10]] = objc_msgSend(a1, sel_fromServerStorage);
    v62 = objc_msgSend(a1, sel_serverReceivedTime);
    if (v62)
    {
      v63 = v62;
      sub_23B9582A4();

      v64 = v88;
      v65 = *(void (**)(_BYTE *, _BYTE *, uint64_t))(v88 + 32);
      v66 = (uint64_t)v90;
      v67 = v8;
      v68 = v91;
      v65(v90, v67, v91);
      (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v64 + 56))(v66, 0, 1, v68);
      v69 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v64 + 48))(v66, 1, v68);
      v70 = v89;
      if (v69 != 1)
      {
        v65(v89, (_BYTE *)v66, v68);
LABEL_33:
        v71 = v84;
        v65(&v20[v92[11]], v70, v68);
        v72 = objc_msgSend(a1, sel_senderCorrelationIdentifier);
        if (v72)
        {
          v73 = v72;
          v74 = sub_23B9583DC();
          v76 = v75;

        }
        else
        {

          v74 = 0;
          v76 = 0xE000000000000000;
        }
        (*(void (**)(_BYTE *, uint64_t))(v55 + 8))(v85, v71);
        v17 = (uint64_t)v92;
        v77 = (uint64_t *)&v20[v92[12]];
        *v77 = v74;
        v77[1] = v76;
        sub_23B94C584((uint64_t)v20, a2);
        v48 = 0;
        return (id)(*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v18 + 56))(a2, v48, 1, v17);
      }
    }
    else
    {
      v64 = v88;
      v66 = (uint64_t)v90;
      v68 = v91;
      (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(v88 + 56))(v90, 1, 1, v91);
      v70 = v89;
    }
    sub_23B958298();
    sub_23B930790(v66, &qword_254309A28);
    v65 = *(void (**)(_BYTE *, _BYTE *, uint64_t))(v64 + 32);
    goto LABEL_33;
  }
LABEL_39:
  __break(1u);
  return result;
}

uint64_t MessageContext.description.getter()
{
  sub_23B958688();
  swift_bridgeObjectRelease();
  type metadata accessor for MessageContext();
  sub_23B94B658();
  sub_23B9587D8();
  sub_23B958400();
  swift_bridgeObjectRelease();
  sub_23B958400();
  swift_bridgeObjectRetain();
  sub_23B958400();
  swift_bridgeObjectRelease();
  sub_23B958400();
  swift_bridgeObjectRetain();
  sub_23B958400();
  swift_bridgeObjectRelease();
  sub_23B958400();
  swift_bridgeObjectRetain();
  sub_23B958400();
  swift_bridgeObjectRelease();
  sub_23B958400();
  return 60;
}

unint64_t sub_23B94B658()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256A55AE8;
  if (!qword_256A55AE8)
  {
    v1 = type metadata accessor for MessageContext();
    result = MEMORY[0x2426097B0](&protocol conformance descriptor for MessageContext, v1);
    atomic_store(result, (unint64_t *)&qword_256A55AE8);
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for MessageContext(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t *, uint64_t *, uint64_t);
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  char *v27;
  uint64_t v28;
  void (*v29)(char *, char *, uint64_t);
  uint64_t v30;
  _QWORD *v31;
  _QWORD *v32;
  uint64_t v33;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v10 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v10 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_23B9582F8();
    v8 = *(_QWORD *)(v7 - 8);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48))(a2, 1, v7))
    {
      v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_254309A30);
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
      (*(void (**)(char *, char *, uint64_t))(v8 + 16))((char *)a1 + a3[5], (char *)a2 + a3[5], v7);
    }
    else
    {
      v11 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16);
      v11(a1, a2, v7);
      (*(void (**)(uint64_t *, _QWORD, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
      v11((uint64_t *)((char *)a1 + a3[5]), (uint64_t *)((char *)a2 + a3[5]), v7);
    }
    v12 = a3[6];
    v13 = a3[7];
    v14 = (char *)a1 + v12;
    v15 = (char *)a2 + v12;
    *v14 = *v15;
    v16 = *((_QWORD *)v15 + 2);
    *((_QWORD *)v14 + 1) = *((_QWORD *)v15 + 1);
    *((_QWORD *)v14 + 2) = v16;
    v17 = (char *)a1 + v13;
    v18 = (char *)a2 + v13;
    *v17 = *v18;
    v19 = *((_QWORD *)v18 + 2);
    *((_QWORD *)v17 + 1) = *((_QWORD *)v18 + 1);
    *((_QWORD *)v17 + 2) = v19;
    v20 = a3[8];
    v21 = a3[9];
    v22 = (uint64_t *)((char *)a1 + v20);
    v23 = (uint64_t *)((char *)a2 + v20);
    v24 = v23[1];
    *v22 = *v23;
    v22[1] = v24;
    *((_BYTE *)a1 + v21) = *((_BYTE *)a2 + v21);
    v25 = a3[11];
    *((_BYTE *)a1 + a3[10]) = *((_BYTE *)a2 + a3[10]);
    v26 = (char *)a1 + v25;
    v27 = (char *)a2 + v25;
    v28 = sub_23B9582B0();
    v29 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v28 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v29(v26, v27, v28);
    v30 = a3[12];
    v31 = (uint64_t *)((char *)a1 + v30);
    v32 = (uint64_t *)((char *)a2 + v30);
    v33 = v32[1];
    *v31 = *v32;
    v31[1] = v33;
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t destroy for MessageContext(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  int v6;
  void (*v7)(uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;

  v4 = sub_23B9582F8();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(a1, 1, v4);
  v7 = *(void (**)(uint64_t, uint64_t))(v5 + 8);
  if (!v6)
    v7(a1, v4);
  v7(a1 + *(int *)(a2 + 20), v4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v8 = a1 + *(int *)(a2 + 44);
  v9 = sub_23B9582B0();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 8))(v8, v9);
  return swift_bridgeObjectRelease();
}

char *initializeWithCopy for MessageContext(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(char *, char *, uint64_t);
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  char *v25;
  uint64_t v26;
  void (*v27)(char *, char *, uint64_t);
  uint64_t v28;
  char *v29;
  char *v30;
  uint64_t v31;

  v6 = sub_23B9582F8();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
  {
    v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_254309A30);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v8 - 8) + 64));
    (*(void (**)(char *, char *, uint64_t))(v7 + 16))(&a1[a3[5]], &a2[a3[5]], v6);
  }
  else
  {
    v9 = *(void (**)(char *, char *, uint64_t))(v7 + 16);
    v9(a1, a2, v6);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
    v9(&a1[a3[5]], &a2[a3[5]], v6);
  }
  v10 = a3[6];
  v11 = a3[7];
  v12 = &a1[v10];
  v13 = &a2[v10];
  *v12 = *v13;
  v14 = *((_QWORD *)v13 + 2);
  *((_QWORD *)v12 + 1) = *((_QWORD *)v13 + 1);
  *((_QWORD *)v12 + 2) = v14;
  v15 = &a1[v11];
  v16 = &a2[v11];
  *v15 = *v16;
  v17 = *((_QWORD *)v16 + 2);
  *((_QWORD *)v15 + 1) = *((_QWORD *)v16 + 1);
  *((_QWORD *)v15 + 2) = v17;
  v18 = a3[8];
  v19 = a3[9];
  v20 = &a1[v18];
  v21 = &a2[v18];
  v22 = *((_QWORD *)v21 + 1);
  *(_QWORD *)v20 = *(_QWORD *)v21;
  *((_QWORD *)v20 + 1) = v22;
  a1[v19] = a2[v19];
  v23 = a3[11];
  a1[a3[10]] = a2[a3[10]];
  v24 = &a1[v23];
  v25 = &a2[v23];
  v26 = sub_23B9582B0();
  v27 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v26 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v27(v24, v25, v26);
  v28 = a3[12];
  v29 = &a1[v28];
  v30 = &a2[v28];
  v31 = *((_QWORD *)v30 + 1);
  *(_QWORD *)v29 = *(_QWORD *)v30;
  *((_QWORD *)v29 + 1) = v31;
  swift_bridgeObjectRetain();
  return a1;
}

char *assignWithCopy for MessageContext(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(char *, uint64_t, uint64_t);
  int v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  char *v19;
  char *v20;
  uint64_t v21;
  char *v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  char *v27;

  v6 = sub_23B9582F8();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 48);
  v9 = v8(a1, 1, v6);
  v10 = v8(a2, 1, v6);
  if (!v9)
  {
    if (!v10)
    {
      (*(void (**)(char *, char *, uint64_t))(v7 + 24))(a1, a2, v6);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v7 + 8))(a1, v6);
    goto LABEL_6;
  }
  if (v10)
  {
LABEL_6:
    v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_254309A30);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(a1, a2, v6);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
LABEL_7:
  (*(void (**)(char *, char *, uint64_t))(v7 + 24))(&a1[a3[5]], &a2[a3[5]], v6);
  v12 = a3[6];
  v13 = &a1[v12];
  v14 = &a2[v12];
  *v13 = *v14;
  *((_QWORD *)v13 + 1) = *((_QWORD *)v14 + 1);
  *((_QWORD *)v13 + 2) = *((_QWORD *)v14 + 2);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v15 = a3[7];
  v16 = &a1[v15];
  v17 = &a2[v15];
  *v16 = *v17;
  *((_QWORD *)v16 + 1) = *((_QWORD *)v17 + 1);
  *((_QWORD *)v16 + 2) = *((_QWORD *)v17 + 2);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v18 = a3[8];
  v19 = &a1[v18];
  v20 = &a2[v18];
  *(_QWORD *)v19 = *(_QWORD *)v20;
  *((_QWORD *)v19 + 1) = *((_QWORD *)v20 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[a3[9]] = a2[a3[9]];
  a1[a3[10]] = a2[a3[10]];
  v21 = a3[11];
  v22 = &a1[v21];
  v23 = &a2[v21];
  v24 = sub_23B9582B0();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v24 - 8) + 24))(v22, v23, v24);
  v25 = a3[12];
  v26 = &a1[v25];
  v27 = &a2[v25];
  *(_QWORD *)v26 = *(_QWORD *)v27;
  *((_QWORD *)v26 + 1) = *((_QWORD *)v27 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

char *initializeWithTake for MessageContext(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(char *, char *, uint64_t);
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  char *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;

  v6 = sub_23B9582F8();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
  {
    v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_254309A30);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v8 - 8) + 64));
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(&a1[a3[5]], &a2[a3[5]], v6);
  }
  else
  {
    v9 = *(void (**)(char *, char *, uint64_t))(v7 + 32);
    v9(a1, a2, v6);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
    v9(&a1[a3[5]], &a2[a3[5]], v6);
  }
  v10 = a3[6];
  v11 = a3[7];
  v12 = &a1[v10];
  v13 = &a2[v10];
  *(_OWORD *)v12 = *(_OWORD *)v13;
  *((_QWORD *)v12 + 2) = *((_QWORD *)v13 + 2);
  v14 = &a1[v11];
  v15 = &a2[v11];
  *(_OWORD *)v14 = *(_OWORD *)v15;
  *((_QWORD *)v14 + 2) = *((_QWORD *)v15 + 2);
  v16 = a3[9];
  *(_OWORD *)&a1[a3[8]] = *(_OWORD *)&a2[a3[8]];
  a1[v16] = a2[v16];
  v17 = a3[11];
  a1[a3[10]] = a2[a3[10]];
  v18 = &a1[v17];
  v19 = &a2[v17];
  v20 = sub_23B9582B0();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v20 - 8) + 32))(v18, v19, v20);
  *(_OWORD *)&a1[a3[12]] = *(_OWORD *)&a2[a3[12]];
  return a1;
}

char *assignWithTake for MessageContext(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(char *, uint64_t, uint64_t);
  int v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;

  v6 = sub_23B9582F8();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 48);
  v9 = v8(a1, 1, v6);
  v10 = v8(a2, 1, v6);
  if (!v9)
  {
    if (!v10)
    {
      (*(void (**)(char *, char *, uint64_t))(v7 + 40))(a1, a2, v6);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v7 + 8))(a1, v6);
    goto LABEL_6;
  }
  if (v10)
  {
LABEL_6:
    v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_254309A30);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 32))(a1, a2, v6);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
LABEL_7:
  (*(void (**)(char *, char *, uint64_t))(v7 + 40))(&a1[a3[5]], &a2[a3[5]], v6);
  v12 = a3[6];
  v13 = &a1[v12];
  v14 = &a2[v12];
  *v13 = *v14;
  v16 = *((_QWORD *)v14 + 1);
  v15 = *((_QWORD *)v14 + 2);
  *((_QWORD *)v13 + 1) = v16;
  *((_QWORD *)v13 + 2) = v15;
  swift_bridgeObjectRelease();
  v17 = a3[7];
  v18 = &a1[v17];
  v19 = &a2[v17];
  *v18 = *v19;
  v21 = *((_QWORD *)v19 + 1);
  v20 = *((_QWORD *)v19 + 2);
  *((_QWORD *)v18 + 1) = v21;
  *((_QWORD *)v18 + 2) = v20;
  swift_bridgeObjectRelease();
  v22 = a3[8];
  v23 = &a1[v22];
  v24 = &a2[v22];
  v26 = *(_QWORD *)v24;
  v25 = *((_QWORD *)v24 + 1);
  *(_QWORD *)v23 = v26;
  *((_QWORD *)v23 + 1) = v25;
  swift_bridgeObjectRelease();
  v27 = a3[10];
  a1[a3[9]] = a2[a3[9]];
  a1[v27] = a2[v27];
  v28 = a3[11];
  v29 = &a1[v28];
  v30 = &a2[v28];
  v31 = sub_23B9582B0();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v31 - 8) + 40))(v29, v30, v31);
  v32 = a3[12];
  v33 = &a1[v32];
  v34 = &a2[v32];
  v36 = *(_QWORD *)v34;
  v35 = *((_QWORD *)v34 + 1);
  *(_QWORD *)v33 = v36;
  *((_QWORD *)v33 + 1) = v35;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for MessageContext()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23B94C008(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_254309A30);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v6;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    v10 = a1;
    return v9(v10, a2, v8);
  }
  v11 = sub_23B9582F8();
  v12 = *(_QWORD *)(v11 - 8);
  if (*(_DWORD *)(v12 + 84) == (_DWORD)a2)
  {
    v8 = v11;
    v13 = a3[5];
LABEL_10:
    v10 = a1 + v13;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    return v9(v10, a2, v8);
  }
  if ((_DWORD)a2 != 0x7FFFFFFF)
  {
    v8 = sub_23B9582B0();
    v12 = *(_QWORD *)(v8 - 8);
    v13 = a3[11];
    goto LABEL_10;
  }
  v14 = *(_QWORD *)(a1 + a3[6] + 16);
  if (v14 >= 0xFFFFFFFF)
    LODWORD(v14) = -1;
  return (v14 + 1);
}

uint64_t storeEnumTagSinglePayload for MessageContext()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23B94C0E8(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t result;
  uint64_t v14;
  uint64_t v15;

  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_254309A30);
  v9 = *(_QWORD *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = v8;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
  }
  else
  {
    result = sub_23B9582F8();
    v14 = *(_QWORD *)(result - 8);
    if (*(_DWORD *)(v14 + 84) == a3)
    {
      v10 = result;
      v15 = a4[5];
    }
    else
    {
      if (a3 == 0x7FFFFFFF)
      {
        *(_QWORD *)(a1 + a4[6] + 16) = (a2 - 1);
        return result;
      }
      v10 = sub_23B9582B0();
      v14 = *(_QWORD *)(v10 - 8);
      v15 = a4[11];
    }
    v12 = a1 + v15;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
  }
  return v11(v12, a2, a2, v10);
}

void sub_23B94C1B8()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;

  sub_23B937E0C();
  if (v0 <= 0x3F)
  {
    sub_23B9582F8();
    if (v1 <= 0x3F)
    {
      sub_23B9582B0();
      if (v2 <= 0x3F)
        swift_initStructMetadata();
    }
  }
}

uint64_t sub_23B94C278(void *a1)
{
  id v2;
  void *v3;
  uint64_t v5;
  id v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  _QWORD *v10;
  id v11;
  const char *v12;
  id v13;
  uint64_t v14;
  id v15;

  v2 = objc_msgSend(a1, sel_fromID);
  if (v2)
  {
    v3 = v2;
    sub_23B9583DC();

    LOBYTE(v3) = sub_23B958418();
    swift_bridgeObjectRelease();
    if ((v3 & 1) != 0)
      return 1;
    v13 = objc_msgSend(a1, sel_senderCorrelationIdentifier);
    if (v13)
    {

      return 1;
    }
    if (qword_256A55448 != -1)
      swift_once();
    v14 = sub_23B95831C();
    __swift_project_value_buffer(v14, (uint64_t)qword_256A55CF0);
    v6 = a1;
    v7 = sub_23B958304();
    v8 = sub_23B958550();
    if (os_log_type_enabled(v7, v8))
    {
      v9 = (uint8_t *)swift_slowAlloc();
      v10 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v9 = 138412290;
      v15 = v6;
      sub_23B9585A4();
      *v10 = v6;

      v12 = "Ignoring IDSMessageContext without a correlationIdentifier: %@";
      goto LABEL_14;
    }
LABEL_15:

    return 0;
  }
  if (qword_256A55448 != -1)
    swift_once();
  v5 = sub_23B95831C();
  __swift_project_value_buffer(v5, (uint64_t)qword_256A55CF0);
  v6 = a1;
  v7 = sub_23B958304();
  v8 = sub_23B958550();
  if (!os_log_type_enabled(v7, v8))
    goto LABEL_15;
  v9 = (uint8_t *)swift_slowAlloc();
  v10 = (_QWORD *)swift_slowAlloc();
  *(_DWORD *)v9 = 138412290;
  v11 = v6;
  sub_23B9585A4();
  *v10 = v6;

  v12 = "Ignoring IDSMessageContext without a fromID: %@";
LABEL_14:
  _os_log_impl(&dword_23B916000, v7, v8, v12, v9, 0xCu);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256A555C8);
  swift_arrayDestroy();
  MEMORY[0x242609864](v10, -1, -1);
  MEMORY[0x242609864](v9, -1, -1);

  return 0;
}

uint64_t sub_23B94C584(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for MessageContext();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_23B94C5C8(void *a1, uint64_t a2)
{
  sub_23B952848(a1, a2, (uint64_t)&unk_250CA2E48, (uint64_t)&unk_256A55C40);
}

uint64_t sub_23B94C5DC(uint64_t a1, const char *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  char *v6;
  uint64_t result;
  int64_t v8;
  _QWORD *v9;
  int64_t v10;
  unint64_t v11;
  int64_t v12;
  unint64_t i;
  uint64_t v14;
  _QWORD *v15;
  uint64_t *boxed_opaque_existential_0;
  char *v17;
  uint64_t v18;
  NSObject *v19;
  os_log_type_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  _OWORD *v27;
  __int128 v28;
  __int128 v29;
  unint64_t v30;
  uint64_t v32;
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _OWORD v41[2];
  _OWORD v42[2];
  uint64_t v43;
  _OWORD v44[2];
  _OWORD v45[2];
  uint64_t v46;
  int64_t v47;

  v2 = a1;
  v33 = a1 + 64;
  v3 = 1 << *(_BYTE *)(a1 + 32);
  v4 = -1;
  if (v3 < 64)
    v4 = ~(-1 << v3);
  v5 = v4 & *(_QWORD *)(a1 + 64);
  v47 = (unint64_t)(v3 + 63) >> 6;
  v6 = (char *)v45 + 8;
  result = swift_bridgeObjectRetain();
  v8 = 0;
  v9 = (_QWORD *)MEMORY[0x24BEE4AF8];
  v32 = result;
  if (v5)
    goto LABEL_36;
LABEL_6:
  v10 = v8 + 1;
  if (!__OFADD__(v8, 1))
  {
    if (v10 < v47)
    {
      v11 = *(_QWORD *)(v33 + 8 * v10);
      ++v8;
      if (v11)
        goto LABEL_21;
      v8 = v10 + 1;
      if (v10 + 1 >= v47)
        goto LABEL_37;
      v11 = *(_QWORD *)(v33 + 8 * v8);
      if (v11)
        goto LABEL_21;
      v8 = v10 + 2;
      if (v10 + 2 >= v47)
        goto LABEL_37;
      v11 = *(_QWORD *)(v33 + 8 * v8);
      if (v11)
        goto LABEL_21;
      v8 = v10 + 3;
      if (v10 + 3 >= v47)
        goto LABEL_37;
      v11 = *(_QWORD *)(v33 + 8 * v8);
      if (v11)
      {
LABEL_21:
        v5 = (v11 - 1) & v11;
        for (i = __clz(__rbit64(v11)) + (v8 << 6); ; i = v30 | (v8 << 6))
        {
          sub_23B91B25C(*(_QWORD *)(v2 + 48) + 40 * i, (uint64_t)v44);
          sub_23B91B298(*(_QWORD *)(v2 + 56) + 32 * i, (uint64_t)v6);
          v42[0] = v45[0];
          v42[1] = v45[1];
          v43 = v46;
          v41[0] = v44[0];
          v41[1] = v44[1];
          sub_23B91B25C((uint64_t)v41, (uint64_t)&v34);
          if (swift_dynamicCast())
          {
            v38 = v37;
            v14 = v43;
            v15 = __swift_project_boxed_opaque_existential_1((_QWORD *)v42 + 1, v43);
            *((_QWORD *)&v40 + 1) = v14;
            boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0((uint64_t *)&v39);
            (*(void (**)(uint64_t *, _QWORD *, uint64_t))(*(_QWORD *)(v14 - 8) + 16))(boxed_opaque_existential_0, v15, v14);
          }
          else
          {
            v17 = v6;
            if (qword_256A55448 != -1)
              swift_once();
            v18 = sub_23B95831C();
            __swift_project_value_buffer(v18, (uint64_t)qword_256A55CF0);
            sub_23B91B25C((uint64_t)v41, (uint64_t)&v34);
            v19 = sub_23B958304();
            v20 = sub_23B958550();
            if (os_log_type_enabled(v19, v20))
            {
              v21 = swift_slowAlloc();
              v22 = swift_slowAlloc();
              *(_QWORD *)&v37 = v22;
              *(_DWORD *)v21 = 136446210;
              v23 = sub_23B95864C();
              *(_QWORD *)(v21 + 4) = sub_23B9287E0(v23, v24, (uint64_t *)&v37);
              swift_bridgeObjectRelease();
              sub_23B9560AC((uint64_t)&v34);
              _os_log_impl(&dword_23B916000, v19, v20, a2, (uint8_t *)v21, 0xCu);
              swift_arrayDestroy();
              MEMORY[0x242609864](v22, -1, -1);
              MEMORY[0x242609864](v21, -1, -1);
            }
            else
            {
              sub_23B9560AC((uint64_t)&v34);
            }

            v38 = 0u;
            v39 = 0u;
            v40 = 0u;
            v6 = v17;
            v2 = v32;
          }
          sub_23B930790((uint64_t)v41, &qword_256A554D8);
          if (*((_QWORD *)&v38 + 1))
          {
            v34 = v38;
            v35 = v39;
            v36 = v40;
            result = swift_isUniquelyReferenced_nonNull_native();
            if ((result & 1) == 0)
            {
              result = (uint64_t)sub_23B9286BC(0, v9[2] + 1, 1, v9);
              v9 = (_QWORD *)result;
            }
            v26 = v9[2];
            v25 = v9[3];
            if (v26 >= v25 >> 1)
            {
              result = (uint64_t)sub_23B9286BC((_QWORD *)(v25 > 1), v26 + 1, 1, v9);
              v9 = (_QWORD *)result;
            }
            v9[2] = v26 + 1;
            v27 = &v9[6 * v26];
            v28 = v34;
            v29 = v36;
            v27[3] = v35;
            v27[4] = v29;
            v27[2] = v28;
            if (!v5)
              goto LABEL_6;
          }
          else
          {
            result = sub_23B930790((uint64_t)&v38, &qword_256A55BF0);
            if (!v5)
              goto LABEL_6;
          }
LABEL_36:
          v30 = __clz(__rbit64(v5));
          v5 &= v5 - 1;
        }
      }
      v12 = v10 + 4;
      if (v12 < v47)
      {
        v11 = *(_QWORD *)(v33 + 8 * v12);
        if (v11)
        {
          v8 = v12;
          goto LABEL_21;
        }
        while (1)
        {
          v8 = v12 + 1;
          if (__OFADD__(v12, 1))
            goto LABEL_39;
          if (v8 >= v47)
            break;
          v11 = *(_QWORD *)(v33 + 8 * v8);
          ++v12;
          if (v11)
            goto LABEL_21;
        }
      }
    }
LABEL_37:
    swift_release();
    return (uint64_t)v9;
  }
  __break(1u);
LABEL_39:
  __break(1u);
  return result;
}

uint64_t sub_23B94CA58(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_23B9584F0();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_23B9584E4();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_23B930790(a1, (uint64_t *)&unk_254309C80);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_23B9584C0();
    swift_unknownObjectRelease();
  }
LABEL_5:
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_23B94CBA4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = sub_23B95831C();
  __swift_allocate_value_buffer(v0, qword_256A55CD8);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_256A55CD8);
  if (qword_256A55448 != -1)
    swift_once();
  v2 = __swift_project_value_buffer(v0, (uint64_t)qword_256A55CF0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 - 8) + 16))(v1, v2, v0);
}

void sub_23B94CC34(void *a1, void *a2, uint64_t a3, unint64_t a4, uint64_t a5, void *a6, void *a7)
{
  char *v7;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  char *v21;
  char *v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  id v26;
  id v27;
  uint64_t v28;
  id v29;
  NSObject *v30;
  os_log_type_t v31;
  uint8_t *v32;
  _QWORD *v33;
  id v34;
  uint64_t v35;
  NSObject *v36;
  os_log_type_t v37;
  uint8_t *v38;
  _QWORD *v39;
  id v40;
  uint64_t v41;
  id v42;
  NSObject *v43;
  os_log_type_t v44;
  uint8_t *v45;
  _QWORD *v46;
  id v47;
  uint64_t v48;
  id v49;
  uint64_t v50;
  id v51;
  os_log_type_t v52;
  uint8_t *v53;
  uint64_t v54;
  _QWORD *v55;
  id v56;
  uint64_t v57;
  Swift::String v58;
  void *v59;
  id v60;
  id v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  id v65;
  id v66;
  id v67;
  id v68;
  uint64_t v69;
  id v70;
  NSObject *v71;
  os_log_type_t v72;
  uint8_t *v73;
  _QWORD *v74;
  id v75;
  uint64_t v76;
  id v77;
  NSObject *v78;
  os_log_type_t v79;
  uint8_t *v80;
  _QWORD *v81;
  id v82;
  uint64_t v83;
  os_log_type_t v84;
  uint8_t *v85;
  _QWORD *v86;
  id v87;
  uint64_t v88;
  unint64_t v89;
  uint64_t v90;
  uint64_t v91;
  id v92;
  unint64_t v93;
  id v94;
  id v95;
  uint64_t v96;
  id v97;
  id v98;
  uint64_t v99;
  uint64_t v100;
  id v101;
  uint64_t v102;
  id v103;
  unint64_t v104;
  id v105;
  id v106;
  id v107;
  void *v108;
  void *v109;

  v101 = a7;
  v102 = a3;
  v103 = a2;
  v104 = a4;
  v105 = a1;
  v10 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254309C80);
  MEMORY[0x24BDAC7A8](v10);
  v100 = (uint64_t)&v96 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2543097C8);
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)&v96 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = type metadata accessor for MessageContext();
  v16 = *(_QWORD *)(v15 - 8);
  v17 = *(_QWORD *)(v16 + 64);
  v18 = MEMORY[0x24BDAC7A8](v15);
  v19 = (char *)&v96 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v18);
  v21 = (char *)&v96 - v20;
  v106 = v7;
  v22 = &v7[OBJC_IVAR____TtC15FindMyMessaging27MessagingDelegateTrampoline_delegate];
  v23 = MEMORY[0x242609900](&v7[OBJC_IVAR____TtC15FindMyMessaging27MessagingDelegateTrampoline_delegate]);
  if (v23)
  {
    if (!v105)
    {
      if (qword_256A55440 != -1)
        swift_once();
      v41 = sub_23B95831C();
      __swift_project_value_buffer(v41, (uint64_t)qword_256A55CD8);
      v42 = v106;
      v43 = sub_23B958304();
      v44 = sub_23B958550();
      if (os_log_type_enabled(v43, v44))
      {
        v45 = (uint8_t *)swift_slowAlloc();
        v46 = (_QWORD *)swift_slowAlloc();
        *(_DWORD *)v45 = 138412290;
        v107 = v42;
        v47 = v42;
        sub_23B9585A4();
        *v46 = v42;

        _os_log_impl(&dword_23B916000, v43, v44, "MessagingDelegateTrampoline: No service for %@", v45, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName(&qword_256A555C8);
        swift_arrayDestroy();
        MEMORY[0x242609864](v46, -1, -1);
        MEMORY[0x242609864](v45, -1, -1);
        swift_unknownObjectRelease();

        return;
      }

LABEL_32:
      swift_unknownObjectRelease();
      return;
    }
    v24 = v103;
    if (!v103)
    {
      v48 = qword_256A55440;
      v49 = v105;
      if (v48 != -1)
        swift_once();
      v50 = sub_23B95831C();
      __swift_project_value_buffer(v50, (uint64_t)qword_256A55CD8);
      v51 = v106;
      v30 = sub_23B958304();
      v52 = sub_23B958550();
      if (os_log_type_enabled(v30, v52))
      {
        v53 = (uint8_t *)swift_slowAlloc();
        v54 = swift_slowAlloc();
        v106 = v49;
        v107 = v51;
        v55 = (_QWORD *)v54;
        *(_DWORD *)v53 = 138412290;
        v56 = v51;
        sub_23B9585A4();
        *v55 = v51;

        _os_log_impl(&dword_23B916000, v30, v52, "MessagingDelegateTrampoline: No account for %@", v53, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName(&qword_256A555C8);
        swift_arrayDestroy();
        MEMORY[0x242609864](v55, -1, -1);
        MEMORY[0x242609864](v53, -1, -1);
        swift_unknownObjectRelease();
        goto LABEL_22;
      }

      goto LABEL_32;
    }
    v99 = v23;
    if (v104 >> 60 == 15)
    {
      v25 = qword_256A55440;
      v26 = v105;
      v27 = v24;
      if (v25 != -1)
        swift_once();
      v28 = sub_23B95831C();
      __swift_project_value_buffer(v28, (uint64_t)qword_256A55CD8);
      v29 = v106;
      v30 = sub_23B958304();
      v31 = sub_23B958550();
      if (os_log_type_enabled(v30, v31))
      {
        v106 = v26;
        v32 = (uint8_t *)swift_slowAlloc();
        v33 = (_QWORD *)swift_slowAlloc();
        *(_DWORD *)v32 = 138412290;
        v107 = v29;
        v34 = v29;
        sub_23B9585A4();
        *v33 = v29;

        _os_log_impl(&dword_23B916000, v30, v31, "MessagingDelegateTrampoline: No data for %@", v32, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName(&qword_256A555C8);
        swift_arrayDestroy();
        MEMORY[0x242609864](v33, -1, -1);
        MEMORY[0x242609864](v32, -1, -1);
        swift_unknownObjectRelease();

LABEL_22:
        return;
      }

      goto LABEL_32;
    }
    if (a6)
    {
      v57 = *((_QWORD *)v22 + 1);
      v98 = v105;
      v97 = v24;
      sub_23B9568D0(v102, v104);
      swift_bridgeObjectRetain();
      v58._countAndFlagsBits = a5;
      v58._object = a6;
      Destination.init(stringRepresentation:)(v58);
      v59 = v109;
      if (v109)
      {
        if (v101)
        {
          v105 = v108;
          LODWORD(v103) = v107;
          v60 = v101;
          v61 = objc_msgSend(v98, sel_serviceIdentifier);
          if (v61)
          {
            v62 = v61;
            v106 = v59;
            v101 = (id)sub_23B9583DC();
            v64 = v63;

            v65 = v60;
            sub_23B94AD6C(v65, (uint64_t)v14);
            if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v14, 1, v15) == 1)
            {

              swift_unknownObjectRelease();
              sub_23B9568BC(v102, v104);
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();

              sub_23B930790((uint64_t)v14, &qword_2543097C8);
            }
            else
            {
              sub_23B92F378((uint64_t)v14, (uint64_t)v21, (uint64_t (*)(_QWORD))type metadata accessor for MessageContext);
              v88 = sub_23B9584F0();
              (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v88 - 8) + 56))(v100, 1, 1, v88);
              sub_23B92F2F8((uint64_t)v21, (uint64_t)v19, (uint64_t (*)(_QWORD))type metadata accessor for MessageContext);
              v89 = (*(unsigned __int8 *)(v16 + 80) + 112) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
              v90 = swift_allocObject();
              *(_QWORD *)(v90 + 16) = 0;
              *(_QWORD *)(v90 + 24) = 0;
              *(_QWORD *)(v90 + 32) = v99;
              *(_QWORD *)(v90 + 40) = v57;
              v91 = v102;
              *(_QWORD *)(v90 + 48) = v101;
              *(_QWORD *)(v90 + 56) = v64;
              v92 = v97;
              *(_QWORD *)(v90 + 64) = v97;
              *(_QWORD *)(v90 + 72) = v91;
              v93 = v104;
              *(_QWORD *)(v90 + 80) = v104;
              *(_BYTE *)(v90 + 88) = (_BYTE)v103;
              v94 = v106;
              *(_QWORD *)(v90 + 96) = v105;
              *(_QWORD *)(v90 + 104) = v94;
              sub_23B92F378((uint64_t)v19, v90 + v89, (uint64_t (*)(_QWORD))type metadata accessor for MessageContext);
              v95 = v92;
              sub_23B9568D0(v91, v93);
              swift_unknownObjectRetain();
              sub_23B94CA58(v100, (uint64_t)&unk_256A55C18, v90);
              swift_release();

              sub_23B9568BC(v91, v93);
              swift_unknownObjectRelease();

              sub_23B9565A4((uint64_t)v21);
            }
            return;
          }
          v105 = v60;
          swift_bridgeObjectRelease();
          if (qword_256A55440 != -1)
            swift_once();
          v83 = sub_23B95831C();
          __swift_project_value_buffer(v83, (uint64_t)qword_256A55CD8);
          v77 = v106;
          v78 = sub_23B958304();
          v84 = sub_23B958550();
          if (os_log_type_enabled(v78, v84))
          {
            v85 = (uint8_t *)swift_slowAlloc();
            v86 = (_QWORD *)swift_slowAlloc();
            *(_DWORD *)v85 = 138412290;
            v107 = v77;
            v87 = v77;
            sub_23B9585A4();
            *v86 = v77;

            _os_log_impl(&dword_23B916000, v78, v84, "MessagingDelegateTrampoline: serviceIdentifier for %@", v85, 0xCu);
            __swift_instantiateConcreteTypeFromMangledName(&qword_256A555C8);
            swift_arrayDestroy();
            MEMORY[0x242609864](v86, -1, -1);
            MEMORY[0x242609864](v85, -1, -1);

            sub_23B9568BC(v102, v104);
            goto LABEL_47;
          }

          swift_unknownObjectRelease();
        }
        else
        {
          swift_bridgeObjectRelease();
          if (qword_256A55440 != -1)
            swift_once();
          v76 = sub_23B95831C();
          __swift_project_value_buffer(v76, (uint64_t)qword_256A55CD8);
          v77 = v106;
          v78 = sub_23B958304();
          v79 = sub_23B958550();
          if (os_log_type_enabled(v78, v79))
          {
            v80 = (uint8_t *)swift_slowAlloc();
            v81 = (_QWORD *)swift_slowAlloc();
            *(_DWORD *)v80 = 138412290;
            v107 = v77;
            v82 = v77;
            sub_23B9585A4();
            *v81 = v77;

            _os_log_impl(&dword_23B916000, v78, v79, "MessagingDelegateTrampoline: No context for %@", v80, 0xCu);
            __swift_instantiateConcreteTypeFromMangledName(&qword_256A555C8);
            swift_arrayDestroy();
            MEMORY[0x242609864](v81, -1, -1);
            MEMORY[0x242609864](v80, -1, -1);

            sub_23B9568BC(v102, v104);
LABEL_47:
            swift_unknownObjectRelease();

            return;
          }

          swift_unknownObjectRelease();
        }
        sub_23B9568BC(v102, v104);

        return;
      }
    }
    else
    {
      v66 = v105;
      v67 = v24;
      sub_23B9568D0(v102, v104);
    }
    v68 = v106;
    if (qword_256A55440 != -1)
      swift_once();
    v69 = sub_23B95831C();
    __swift_project_value_buffer(v69, (uint64_t)qword_256A55CD8);
    v70 = v68;
    v71 = sub_23B958304();
    v72 = sub_23B958550();
    if (os_log_type_enabled(v71, v72))
    {
      v73 = (uint8_t *)swift_slowAlloc();
      v74 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v73 = 138412290;
      v107 = v70;
      v75 = v70;
      sub_23B9585A4();
      *v74 = v70;

      _os_log_impl(&dword_23B916000, v71, v72, "MessagingDelegateTrampoline: No fromID for %@", v73, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_256A555C8);
      swift_arrayDestroy();
      MEMORY[0x242609864](v74, -1, -1);
      MEMORY[0x242609864](v73, -1, -1);

      sub_23B9568BC(v102, v104);
      swift_unknownObjectRelease();

    }
    else
    {

      swift_unknownObjectRelease();
      sub_23B9568BC(v102, v104);

    }
  }
  else
  {
    if (qword_256A55440 != -1)
      swift_once();
    v35 = sub_23B95831C();
    __swift_project_value_buffer(v35, (uint64_t)qword_256A55CD8);
    v106 = v106;
    v36 = sub_23B958304();
    v37 = sub_23B958550();
    if (os_log_type_enabled(v36, v37))
    {
      v38 = (uint8_t *)swift_slowAlloc();
      v39 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v38 = 138412290;
      v107 = v106;
      v40 = v106;
      sub_23B9585A4();
      *v39 = v106;

      _os_log_impl(&dword_23B916000, v36, v37, "MessagingDelegateTrampoline: No delegate for %@", v38, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_256A555C8);
      swift_arrayDestroy();
      MEMORY[0x242609864](v39, -1, -1);
      MEMORY[0x242609864](v38, -1, -1);

    }
    else
    {

    }
  }
}

uint64_t sub_23B94DA84(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  __int128 v10;
  char v11;
  __int128 v12;
  uint64_t v13;

  *(_QWORD *)(v8 + 128) = v13;
  *(_BYTE *)(v8 + 152) = v11;
  *(_OWORD *)(v8 + 96) = v10;
  *(_OWORD *)(v8 + 112) = v12;
  *(_QWORD *)(v8 + 80) = a7;
  *(_QWORD *)(v8 + 88) = a8;
  *(_QWORD *)(v8 + 64) = a5;
  *(_QWORD *)(v8 + 72) = a6;
  *(_QWORD *)(v8 + 56) = a4;
  return swift_task_switch();
}

id sub_23B94DAC4()
{
  uint64_t v0;
  id result;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;

  result = objc_msgSend(*(id *)(v0 + 88), sel_uniqueID);
  if (result)
  {
    v2 = result;
    v4 = *(_QWORD *)(v0 + 112);
    v3 = *(_QWORD *)(v0 + 120);
    v5 = *(_BYTE *)(v0 + 152);
    v6 = *(void **)(v0 + 88);
    v7 = *(_QWORD *)(v0 + 64);
    swift_getObjectType();
    v8 = sub_23B9583DC();
    v10 = v9;

    *(_QWORD *)(v0 + 136) = v10;
    *(_QWORD *)(v0 + 40) = v8;
    *(_QWORD *)(v0 + 48) = v10;
    *(_BYTE *)(v0 + 16) = v5;
    *(_QWORD *)(v0 + 24) = v4;
    *(_QWORD *)(v0 + 32) = v3;
    v12 = **(int **)(v7 + 24) + *(_QWORD *)(v7 + 24);
    v11 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 144) = v11;
    *v11 = v0;
    v11[1] = sub_23B94DBD0;
    __asm { BR              X8 }
  }
  __break(1u);
  return result;
}

uint64_t sub_23B94DBD0()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

void sub_23B94DD34(void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7)
{
  char *v7;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  uint64_t v33;
  id v34;
  NSObject *v35;
  os_log_type_t v36;
  uint8_t *v37;
  _QWORD *v38;
  id v39;
  uint64_t v40;
  NSObject *v41;
  os_log_type_t v42;
  uint8_t *v43;
  _QWORD *v44;
  id v45;
  uint64_t v46;
  id v47;
  NSObject *v48;
  os_log_type_t v49;
  uint8_t *v50;
  _QWORD *v51;
  id v52;
  void (*v53)(char *, char *, uint64_t);
  void *v54;
  id v55;
  id v56;
  void *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  id v61;
  uint64_t v62;
  id v63;
  uint64_t v64;
  id v65;
  NSObject *v66;
  os_log_type_t v67;
  uint8_t *v68;
  _QWORD *v69;
  id v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  id v74;
  uint64_t v75;
  void (*v76)(char *, uint64_t);
  uint64_t v77;
  id v78;
  id v79;
  uint64_t v80;
  id v81;
  NSObject *v82;
  os_log_type_t v83;
  uint64_t v84;
  uint8_t *v85;
  _QWORD *v86;
  id v87;
  uint8_t *v88;
  uint64_t v89;
  id v90;
  NSObject *v91;
  os_log_type_t v92;
  uint8_t *v93;
  _QWORD *v94;
  id v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  id v99;
  uint64_t v100;
  unint64_t v101;
  unint64_t v102;
  unint64_t v103;
  unint64_t v104;
  char *v105;
  uint64_t v106;
  id v107;
  char *v108;
  uint64_t v109;
  char *v110;
  uint64_t v111;
  id v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  void (*v117)(char *, char *, uint64_t);
  id v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  void *v124;
  uint64_t v125;
  id v126;
  uint64_t v127;
  uint64_t v128;
  char *v129;
  uint64_t v130;
  uint64_t v131;
  id v132;
  id v133;

  v126 = a7;
  v127 = a6;
  v121 = a5;
  v124 = a1;
  v125 = a4;
  v10 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254309C80);
  MEMORY[0x24BDAC7A8](v10);
  v123 = (uint64_t)&v116 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2543097C8);
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)&v116 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = type metadata accessor for MessageContext();
  v16 = *(_QWORD *)(v15 - 8);
  v17 = *(_QWORD *)(v16 + 64);
  v18 = MEMORY[0x24BDAC7A8](v15);
  v120 = (uint64_t)&v116 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v18);
  v122 = (uint64_t)&v116 - v19;
  v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A55BF8);
  MEMORY[0x24BDAC7A8](v20);
  v22 = (char *)&v116 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = sub_23B95825C();
  v130 = *(_QWORD *)(v23 - 8);
  v131 = v23;
  v24 = *(_QWORD *)(v130 + 64);
  v25 = MEMORY[0x24BDAC7A8](v23);
  v26 = (char *)&v116 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v25);
  v129 = (char *)&v116 - v27;
  v132 = v7;
  v28 = &v7[OBJC_IVAR____TtC15FindMyMessaging27MessagingDelegateTrampoline_delegate];
  v29 = MEMORY[0x242609900](v28);
  if (v29)
  {
    v128 = v29;
    if (a2)
    {
      v119 = *((_QWORD *)v28 + 1);
      sub_23B9307CC(a3, (uint64_t)v22, &qword_256A55BF8);
      v31 = v130;
      v30 = v131;
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v130 + 48))(v22, 1, v131) == 1)
      {
        v32 = a2;
        sub_23B930790((uint64_t)v22, &qword_256A55BF8);
        if (qword_256A55440 != -1)
          swift_once();
        v33 = sub_23B95831C();
        __swift_project_value_buffer(v33, (uint64_t)qword_256A55CD8);
        v34 = v132;
        v35 = sub_23B958304();
        v36 = sub_23B958550();
        if (os_log_type_enabled(v35, v36))
        {
          v37 = (uint8_t *)swift_slowAlloc();
          v38 = (_QWORD *)swift_slowAlloc();
          *(_DWORD *)v37 = 138412290;
          v133 = v34;
          v39 = v34;
          sub_23B9585A4();
          *v38 = v34;

          _os_log_impl(&dword_23B916000, v35, v36, "MessagingDelegateTrampoline: No resourceURL for %@", v37, 0xCu);
          __swift_instantiateConcreteTypeFromMangledName(&qword_256A555C8);
          swift_arrayDestroy();
          MEMORY[0x242609864](v38, -1, -1);
          MEMORY[0x242609864](v37, -1, -1);
          swift_unknownObjectRelease();

        }
        else
        {

          swift_unknownObjectRelease();
        }
        return;
      }
      v53 = *(void (**)(char *, char *, uint64_t))(v31 + 32);
      v53(v129, v22, v30);
      if (v127)
      {
        if (v126)
        {
          if (v125)
          {
            v117 = v53;
            v54 = v124;
            if (v124)
            {
              v118 = a2;
              v55 = v126;
              swift_bridgeObjectRetain();
              swift_bridgeObjectRetain();
              v56 = objc_msgSend(v54, sel_serviceIdentifier);
              if (v56)
              {
                v57 = v56;
                v58 = sub_23B9583DC();
                v60 = v59;

                v61 = v55;
                sub_23B94AD6C(v61, (uint64_t)v14);
                if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v14, 1, v15) == 1)
                {
                  (*(void (**)(char *, uint64_t))(v130 + 8))(v129, v131);
                  swift_bridgeObjectRelease();
                  swift_bridgeObjectRelease();
                  swift_bridgeObjectRelease();

                  swift_unknownObjectRelease();
                  sub_23B930790((uint64_t)v14, &qword_2543097C8);
                }
                else
                {
                  v132 = v61;
                  v96 = v122;
                  sub_23B92F378((uint64_t)v14, v122, (uint64_t (*)(_QWORD))type metadata accessor for MessageContext);
                  v97 = sub_23B9584F0();
                  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v97 - 8) + 56))(v123, 1, 1, v97);
                  v98 = v130;
                  v99 = v118;
                  (*(void (**)(char *, char *, uint64_t))(v130 + 16))(v26, v129, v131);
                  v126 = v60;
                  v100 = v120;
                  sub_23B92F2F8(v96, v120, (uint64_t (*)(_QWORD))type metadata accessor for MessageContext);
                  v101 = (*(unsigned __int8 *)(v98 + 80) + 72) & ~(unint64_t)*(unsigned __int8 *)(v98 + 80);
                  v102 = (v24 + v101 + 7) & 0xFFFFFFFFFFFFFFF8;
                  v103 = (v102 + 15) & 0xFFFFFFFFFFFFFFF8;
                  v104 = (*(unsigned __int8 *)(v16 + 80) + v103 + 16) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
                  v105 = (char *)swift_allocObject();
                  *((_QWORD *)v105 + 2) = 0;
                  *((_QWORD *)v105 + 3) = 0;
                  v106 = v119;
                  *((_QWORD *)v105 + 4) = v128;
                  *((_QWORD *)v105 + 5) = v106;
                  v107 = v126;
                  *((_QWORD *)v105 + 6) = v58;
                  *((_QWORD *)v105 + 7) = v107;
                  *((_QWORD *)v105 + 8) = v99;
                  v108 = v26;
                  v109 = v131;
                  v117(&v105[v101], v108, v131);
                  *(_QWORD *)&v105[v102] = v125;
                  v110 = &v105[v103];
                  v111 = v127;
                  *(_QWORD *)v110 = v121;
                  *((_QWORD *)v110 + 1) = v111;
                  sub_23B92F378(v100, (uint64_t)&v105[v104], (uint64_t (*)(_QWORD))type metadata accessor for MessageContext);
                  v112 = v99;
                  swift_unknownObjectRetain();
                  sub_23B94CA58(v123, (uint64_t)&unk_256A55C08, (uint64_t)v105);

                  swift_unknownObjectRelease();
                  swift_release();
                  sub_23B9565A4(v122);
                  (*(void (**)(char *, uint64_t))(v130 + 8))(v129, v109);
                }
              }
              else
              {
                v126 = v55;
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                if (qword_256A55440 != -1)
                  swift_once();
                v89 = sub_23B95831C();
                __swift_project_value_buffer(v89, (uint64_t)qword_256A55CD8);
                v90 = v132;
                v91 = sub_23B958304();
                v92 = sub_23B958550();
                if (os_log_type_enabled(v91, v92))
                {
                  v93 = (uint8_t *)swift_slowAlloc();
                  v94 = (_QWORD *)swift_slowAlloc();
                  *(_DWORD *)v93 = 138412290;
                  v133 = v90;
                  v95 = v90;
                  sub_23B9585A4();
                  *v94 = v90;

                  _os_log_impl(&dword_23B916000, v91, v92, "MessagingDelegateTrampoline: serviceIdentifier for %@", v93, 0xCu);
                  __swift_instantiateConcreteTypeFromMangledName(&qword_256A555C8);
                  swift_arrayDestroy();
                  MEMORY[0x242609864](v94, -1, -1);
                  MEMORY[0x242609864](v93, -1, -1);
                }
                else
                {

                }
                v115 = v130;
                v114 = v131;

                swift_unknownObjectRelease();
                (*(void (**)(char *, uint64_t))(v115 + 8))(v129, v114);
              }
            }
            else
            {
              __break(1u);
            }
            return;
          }
          v77 = qword_256A55440;
          v78 = a2;
          v79 = v126;
          if (v77 != -1)
            swift_once();
          v80 = sub_23B95831C();
          __swift_project_value_buffer(v80, (uint64_t)qword_256A55CD8);
          v81 = v132;
          v82 = sub_23B958304();
          v83 = sub_23B958550();
          if (os_log_type_enabled(v82, v83))
          {
            v84 = swift_slowAlloc();
            v132 = v78;
            v85 = (uint8_t *)v84;
            v86 = (_QWORD *)swift_slowAlloc();
            *(_DWORD *)v85 = 138412290;
            v133 = v81;
            v87 = v81;
            sub_23B9585A4();
            *v86 = v81;

            _os_log_impl(&dword_23B916000, v82, v83, "MessagingDelegateTrampoline: No metadata for %@", v85, 0xCu);
            __swift_instantiateConcreteTypeFromMangledName(&qword_256A555C8);
            swift_arrayDestroy();
            MEMORY[0x242609864](v86, -1, -1);
            v88 = v85;
            v78 = v132;
            MEMORY[0x242609864](v88, -1, -1);
          }
          else
          {

          }
          v113 = v130;

          swift_unknownObjectRelease();
          v76 = *(void (**)(char *, uint64_t))(v113 + 8);
LABEL_37:
          v76(v129, v131);
          return;
        }
        v72 = qword_256A55440;
        v63 = a2;
        if (v72 != -1)
          swift_once();
        v73 = sub_23B95831C();
        __swift_project_value_buffer(v73, (uint64_t)qword_256A55CD8);
        v65 = v132;
        v66 = sub_23B958304();
        v67 = sub_23B958550();
        if (os_log_type_enabled(v66, v67))
        {
          v68 = (uint8_t *)swift_slowAlloc();
          v69 = (_QWORD *)swift_slowAlloc();
          *(_DWORD *)v68 = 138412290;
          v133 = v65;
          v74 = v65;
          sub_23B9585A4();
          *v69 = v65;

          v71 = "MessagingDelegateTrampoline: No context for %@";
          goto LABEL_34;
        }
      }
      else
      {
        v62 = qword_256A55440;
        v63 = a2;
        if (v62 != -1)
          swift_once();
        v64 = sub_23B95831C();
        __swift_project_value_buffer(v64, (uint64_t)qword_256A55CD8);
        v65 = v132;
        v66 = sub_23B958304();
        v67 = sub_23B958550();
        if (os_log_type_enabled(v66, v67))
        {
          v68 = (uint8_t *)swift_slowAlloc();
          v69 = (_QWORD *)swift_slowAlloc();
          *(_DWORD *)v68 = 138412290;
          v133 = v65;
          v70 = v65;
          sub_23B9585A4();
          *v69 = v65;

          v71 = "MessagingDelegateTrampoline: No fromID for %@";
LABEL_34:
          _os_log_impl(&dword_23B916000, v66, v67, v71, v68, 0xCu);
          __swift_instantiateConcreteTypeFromMangledName(&qword_256A555C8);
          swift_arrayDestroy();
          MEMORY[0x242609864](v69, -1, -1);
          MEMORY[0x242609864](v68, -1, -1);
LABEL_36:
          v75 = v130;
          swift_unknownObjectRelease();

          v76 = *(void (**)(char *, uint64_t))(v75 + 8);
          goto LABEL_37;
        }
      }

      goto LABEL_36;
    }
    if (qword_256A55440 != -1)
      swift_once();
    v46 = sub_23B95831C();
    __swift_project_value_buffer(v46, (uint64_t)qword_256A55CD8);
    v47 = v132;
    v48 = sub_23B958304();
    v49 = sub_23B958550();
    if (os_log_type_enabled(v48, v49))
    {
      v50 = (uint8_t *)swift_slowAlloc();
      v51 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v50 = 138412290;
      v133 = v47;
      v52 = v47;
      sub_23B9585A4();
      *v51 = v47;

      _os_log_impl(&dword_23B916000, v48, v49, "MessagingDelegateTrampoline: No account for %@", v50, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_256A555C8);
      swift_arrayDestroy();
      MEMORY[0x242609864](v51, -1, -1);
      MEMORY[0x242609864](v50, -1, -1);
      swift_unknownObjectRelease();

    }
    else
    {

      swift_unknownObjectRelease();
    }
  }
  else
  {
    if (qword_256A55440 != -1)
      swift_once();
    v40 = sub_23B95831C();
    __swift_project_value_buffer(v40, (uint64_t)qword_256A55CD8);
    v132 = v132;
    v41 = sub_23B958304();
    v42 = sub_23B958550();
    if (os_log_type_enabled(v41, v42))
    {
      v43 = (uint8_t *)swift_slowAlloc();
      v44 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v43 = 138412290;
      v133 = v132;
      v45 = v132;
      sub_23B9585A4();
      *v44 = v132;

      _os_log_impl(&dword_23B916000, v41, v42, "MessagingDelegateTrampoline: No delegate for %@", v43, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_256A555C8);
      swift_arrayDestroy();
      MEMORY[0x242609864](v44, -1, -1);
      MEMORY[0x242609864](v43, -1, -1);

    }
    else
    {

    }
  }
}

uint64_t sub_23B94EBD0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  uint64_t v12;

  *(_QWORD *)(v8 + 152) = v12;
  *(_OWORD *)(v8 + 136) = v11;
  *(_OWORD *)(v8 + 120) = v10;
  *(_QWORD *)(v8 + 104) = a7;
  *(_QWORD *)(v8 + 112) = a8;
  *(_QWORD *)(v8 + 88) = a5;
  *(_QWORD *)(v8 + 96) = a6;
  *(_QWORD *)(v8 + 80) = a4;
  return swift_task_switch();
}

char sub_23B94EC08()
{
  uint64_t v0;
  id v1;
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  Swift::String v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v19;
  _QWORD v20[14];

  v1 = objc_msgSend(*(id *)(v0 + 112), sel_uniqueID);
  if (v1)
  {
    v2 = v1;
    v3 = *(_QWORD *)(v0 + 128);
    v4 = *(void **)(v0 + 112);
    v5 = sub_23B9583DC();
    v7 = v6;

    *(_QWORD *)(v0 + 160) = v7;
    *(_QWORD *)(v0 + 64) = v5;
    *(_QWORD *)(v0 + 72) = v7;
    if (*(_QWORD *)(sub_23B94C5DC(v3, "Dropping non-String metadata key: %{public}s") + 16))
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_256A55BD0);
      v8 = sub_23B958754();
    }
    else
    {
      v8 = MEMORY[0x24BEE4B00];
    }
    v20[0] = v8;
    v9 = swift_bridgeObjectRetain();
    sub_23B955860(v9, 1, v20);
    v11 = *(_QWORD *)(v0 + 136);
    v10 = *(void **)(v0 + 144);
    swift_bridgeObjectRelease();
    *(_QWORD *)(v0 + 168) = v20[0];
    swift_bridgeObjectRetain();
    v12._countAndFlagsBits = v11;
    v12._object = v10;
    LOBYTE(v1) = Destination.init(stringRepresentation:)(v12);
    v13 = *(_QWORD *)(v0 + 32);
    *(_QWORD *)(v0 + 176) = v13;
    if (v13)
    {
      v14 = *(_QWORD *)(v0 + 88);
      v16 = *(_QWORD *)(v0 + 16);
      v15 = *(_QWORD *)(v0 + 24);
      swift_getObjectType();
      *(_BYTE *)(v0 + 40) = v16;
      *(_QWORD *)(v0 + 48) = v15;
      *(_QWORD *)(v0 + 56) = v13;
      v19 = **(int **)(v14 + 32) + *(_QWORD *)(v14 + 32);
      v17 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 184) = v17;
      *v17 = v0;
      v17[1] = sub_23B94EDEC;
      v20[12] = *(_QWORD *)(v0 + 88);
      __asm { BR              X8 }
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return (char)v1;
}

uint64_t sub_23B94EDEC()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

void sub_23B94EFFC(void *a1, void *a2, uint64_t a3, uint64_t a4, char *a5, void *a6)
{
  char *v6;
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
  char *v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  os_log_type_t v32;
  uint8_t *v33;
  _QWORD *v34;
  char *v35;
  uint64_t v36;
  char *v37;
  NSObject *v38;
  os_log_type_t v39;
  uint8_t *v40;
  _QWORD *v41;
  char *v42;
  uint64_t v43;
  id v44;
  uint64_t v45;
  char *v46;
  NSObject *v47;
  os_log_type_t v48;
  uint8_t *v49;
  _QWORD *v50;
  char *v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  char *v55;
  uint64_t v56;
  uint64_t v57;
  char *v58;
  uint64_t v59;
  char *v60;
  NSObject *v61;
  os_log_type_t v62;
  uint8_t *v63;
  _QWORD *v64;
  char *v65;
  uint64_t v66;
  uint64_t v67;
  id v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  unint64_t v74;
  _QWORD *v75;
  id v76;
  char *v77;
  id v78;
  id v79;
  id v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  char *v84;
  uint64_t v85;
  char *v86;
  uint64_t v87;

  v85 = a4;
  v86 = a5;
  v11 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254309C80);
  MEMORY[0x24BDAC7A8](v11);
  v84 = (char *)&v79 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2543097C8);
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)&v79 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = type metadata accessor for MessageContext();
  v17 = *(_QWORD *)(v16 - 8);
  v18 = *(_QWORD *)(v17 + 64);
  v19 = MEMORY[0x24BDAC7A8](v16);
  v82 = (uint64_t)&v79 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v19);
  v83 = (uint64_t)&v79 - v20;
  v21 = &v6[OBJC_IVAR____TtC15FindMyMessaging27MessagingDelegateTrampoline_delegate];
  v22 = MEMORY[0x242609900](&v6[OBJC_IVAR____TtC15FindMyMessaging27MessagingDelegateTrampoline_delegate]);
  if (v22)
  {
    if (!a2)
    {
      if (qword_256A55440 != -1)
        swift_once();
      v36 = sub_23B95831C();
      __swift_project_value_buffer(v36, (uint64_t)qword_256A55CD8);
      v37 = v6;
      v38 = sub_23B958304();
      v39 = sub_23B958550();
      if (os_log_type_enabled(v38, v39))
      {
        v40 = (uint8_t *)swift_slowAlloc();
        v41 = (_QWORD *)swift_slowAlloc();
        *(_DWORD *)v40 = 138412290;
        v87 = (uint64_t)v37;
        v42 = v37;
        sub_23B9585A4();
        *v41 = v37;

        _os_log_impl(&dword_23B916000, v38, v39, "MessagingDelegateTrampoline: No account for %@", v40, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName(&qword_256A555C8);
        swift_arrayDestroy();
        MEMORY[0x242609864](v41, -1, -1);
        MEMORY[0x242609864](v40, -1, -1);
        swift_unknownObjectRelease();

        return;
      }

      goto LABEL_34;
    }
    v81 = v22;
    if (a3)
    {
      if (v86)
      {
        if (a6)
        {
          if (a1)
          {
            v23 = *((_QWORD *)v21 + 1);
            v80 = a2;
            v79 = a6;
            swift_bridgeObjectRetain();
            v24 = objc_msgSend(a1, sel_serviceIdentifier);
            if (v24)
            {
              v25 = v24;
              v26 = (void *)sub_23B9583DC();
              v28 = v27;

              if (*(_QWORD *)(sub_23B94C5DC(a3, "Dropping non-String message key: %{public}s") + 16))
              {
                __swift_instantiateConcreteTypeFromMangledName(&qword_256A55BD0);
                v29 = sub_23B958754();
              }
              else
              {
                v29 = MEMORY[0x24BEE4B00];
              }
              v87 = v29;
              v66 = swift_bridgeObjectRetain();
              sub_23B955860(v66, 1, &v87);
              swift_bridgeObjectRelease();
              v67 = v87;
              v68 = v79;
              sub_23B94AD6C(v68, (uint64_t)v15);
              if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48))(v15, 1, v16) == 1)
              {
                swift_release();
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();

                swift_unknownObjectRelease();
                sub_23B930790((uint64_t)v15, &qword_2543097C8);
              }
              else
              {
                v79 = v26;
                v69 = v23;
                v70 = v83;
                sub_23B92F378((uint64_t)v15, v83, (uint64_t (*)(_QWORD))type metadata accessor for MessageContext);
                v71 = sub_23B9584F0();
                v72 = (uint64_t)v84;
                (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v71 - 8) + 56))(v84, 1, 1, v71);
                v73 = v82;
                sub_23B92F2F8(v70, v82, (uint64_t (*)(_QWORD))type metadata accessor for MessageContext);
                v74 = (*(unsigned __int8 *)(v17 + 80) + 96) & ~(unint64_t)*(unsigned __int8 *)(v17 + 80);
                v75 = (_QWORD *)swift_allocObject();
                v75[2] = 0;
                v75[3] = 0;
                v75[4] = v81;
                v75[5] = v69;
                v76 = v80;
                v75[6] = v79;
                v75[7] = v28;
                v75[8] = v76;
                v75[9] = v67;
                v77 = v86;
                v75[10] = v85;
                v75[11] = v77;
                sub_23B92F378(v73, (uint64_t)v75 + v74, (uint64_t (*)(_QWORD))type metadata accessor for MessageContext);
                v78 = v76;
                swift_unknownObjectRetain();
                sub_23B94CA58(v72, (uint64_t)&unk_256A55BE0, (uint64_t)v75);

                swift_unknownObjectRelease();
                swift_release();
                sub_23B9565A4(v70);
              }
            }
            else
            {
              swift_bridgeObjectRelease();
              if (qword_256A55440 != -1)
                swift_once();
              v59 = sub_23B95831C();
              __swift_project_value_buffer(v59, (uint64_t)qword_256A55CD8);
              v60 = v6;
              v61 = sub_23B958304();
              v62 = sub_23B958550();
              if (os_log_type_enabled(v61, v62))
              {
                v63 = (uint8_t *)swift_slowAlloc();
                v64 = (_QWORD *)swift_slowAlloc();
                *(_DWORD *)v63 = 138412290;
                v87 = (uint64_t)v60;
                v65 = v60;
                sub_23B9585A4();
                *v64 = v60;

                _os_log_impl(&dword_23B916000, v61, v62, "MessagingDelegateTrampoline: serviceIdentifier for %@", v63, 0xCu);
                __swift_instantiateConcreteTypeFromMangledName(&qword_256A555C8);
                swift_arrayDestroy();
                MEMORY[0x242609864](v64, -1, -1);
                MEMORY[0x242609864](v63, -1, -1);

                swift_unknownObjectRelease();
              }
              else
              {

                swift_unknownObjectRelease();
              }
            }
          }
          else
          {
            __break(1u);
            swift_unexpectedError();
            __break(1u);
          }
          return;
        }
        v56 = qword_256A55440;
        v44 = a2;
        if (v56 != -1)
          swift_once();
        v57 = sub_23B95831C();
        __swift_project_value_buffer(v57, (uint64_t)qword_256A55CD8);
        v46 = v6;
        v47 = sub_23B958304();
        v48 = sub_23B958550();
        if (os_log_type_enabled(v47, v48))
        {
          v49 = (uint8_t *)swift_slowAlloc();
          v50 = (_QWORD *)swift_slowAlloc();
          *(_DWORD *)v49 = 138412290;
          v87 = (uint64_t)v46;
          v58 = v46;
          sub_23B9585A4();
          *v50 = v46;

          v52 = "MessagingDelegateTrampoline: No context for %@";
          goto LABEL_32;
        }
        goto LABEL_33;
      }
      v53 = qword_256A55440;
      v44 = a2;
      if (v53 != -1)
        swift_once();
      v54 = sub_23B95831C();
      __swift_project_value_buffer(v54, (uint64_t)qword_256A55CD8);
      v46 = v6;
      v47 = sub_23B958304();
      v48 = sub_23B958550();
      if (os_log_type_enabled(v47, v48))
      {
        v49 = (uint8_t *)swift_slowAlloc();
        v50 = (_QWORD *)swift_slowAlloc();
        *(_DWORD *)v49 = 138412290;
        v87 = (uint64_t)v46;
        v55 = v46;
        sub_23B9585A4();
        *v50 = v46;

        v52 = "MessagingDelegateTrampoline: No fromID for %@";
        goto LABEL_32;
      }
    }
    else
    {
      v43 = qword_256A55440;
      v44 = a2;
      if (v43 != -1)
        swift_once();
      v45 = sub_23B95831C();
      __swift_project_value_buffer(v45, (uint64_t)qword_256A55CD8);
      v46 = v6;
      v47 = sub_23B958304();
      v48 = sub_23B958550();
      if (os_log_type_enabled(v47, v48))
      {
        v49 = (uint8_t *)swift_slowAlloc();
        v50 = (_QWORD *)swift_slowAlloc();
        *(_DWORD *)v49 = 138412290;
        v87 = (uint64_t)v46;
        v51 = v46;
        sub_23B9585A4();
        *v50 = v46;

        v52 = "MessagingDelegateTrampoline: No message for %@";
LABEL_32:
        _os_log_impl(&dword_23B916000, v47, v48, v52, v49, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName(&qword_256A555C8);
        swift_arrayDestroy();
        MEMORY[0x242609864](v50, -1, -1);
        MEMORY[0x242609864](v49, -1, -1);
        swift_unknownObjectRelease();

        return;
      }
    }
LABEL_33:

LABEL_34:
    swift_unknownObjectRelease();
    return;
  }
  if (qword_256A55440 != -1)
    swift_once();
  v30 = sub_23B95831C();
  __swift_project_value_buffer(v30, (uint64_t)qword_256A55CD8);
  v86 = v6;
  v31 = sub_23B958304();
  v32 = sub_23B958550();
  if (os_log_type_enabled(v31, v32))
  {
    v33 = (uint8_t *)swift_slowAlloc();
    v34 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v33 = 138412290;
    v87 = (uint64_t)v86;
    v35 = v86;
    sub_23B9585A4();
    *v34 = v86;

    _os_log_impl(&dword_23B916000, v31, v32, "MessagingDelegateTrampoline: No delegate for %@", v33, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256A555C8);
    swift_arrayDestroy();
    MEMORY[0x242609864](v34, -1, -1);
    MEMORY[0x242609864](v33, -1, -1);

  }
  else
  {

  }
}

uint64_t sub_23B94FB98(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;

  *(_QWORD *)(v8 + 136) = v11;
  *(_QWORD *)(v8 + 144) = v12;
  *(_OWORD *)(v8 + 120) = v10;
  *(_QWORD *)(v8 + 104) = a7;
  *(_QWORD *)(v8 + 112) = a8;
  *(_QWORD *)(v8 + 88) = a5;
  *(_QWORD *)(v8 + 96) = a6;
  *(_QWORD *)(v8 + 80) = a4;
  return swift_task_switch();
}

char sub_23B94FBCC()
{
  uint64_t v0;
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  Swift::String v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v16;

  v1 = objc_msgSend(*(id *)(v0 + 112), sel_uniqueID);
  if (v1)
  {
    v2 = v1;
    v4 = *(_QWORD *)(v0 + 128);
    v3 = *(void **)(v0 + 136);
    v5 = *(void **)(v0 + 112);
    v6 = sub_23B9583DC();
    v8 = v7;

    *(_QWORD *)(v0 + 152) = v8;
    *(_QWORD *)(v0 + 64) = v6;
    *(_QWORD *)(v0 + 72) = v8;
    *(_QWORD *)(v0 + 160) = sub_23B91BB2C(MEMORY[0x24BEE4AF8]);
    swift_bridgeObjectRetain();
    v9._countAndFlagsBits = v4;
    v9._object = v3;
    LOBYTE(v1) = Destination.init(stringRepresentation:)(v9);
    v10 = *(_QWORD *)(v0 + 32);
    *(_QWORD *)(v0 + 168) = v10;
    if (v10)
    {
      v11 = *(_QWORD *)(v0 + 88);
      v13 = *(_QWORD *)(v0 + 16);
      v12 = *(_QWORD *)(v0 + 24);
      swift_getObjectType();
      *(_BYTE *)(v0 + 40) = v13;
      *(_QWORD *)(v0 + 48) = v12;
      *(_QWORD *)(v0 + 56) = v10;
      v16 = **(int **)(v11 + 40) + *(_QWORD *)(v11 + 40);
      v14 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 176) = v14;
      *v14 = v0;
      v14[1] = sub_23B94FD10;
      __asm { BR              X8 }
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return (char)v1;
}

uint64_t sub_23B94FD10()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

void sub_23B94FE74(void *a1, void *a2, uint64_t a3, unint64_t a4, int a5, void *a6)
{
  char *v6;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  id v23;
  char *v24;
  uint64_t v25;
  char *v26;
  char *v27;
  NSObject *v28;
  os_log_type_t v29;
  uint64_t v30;
  _QWORD *v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  NSObject *v35;
  os_log_type_t v36;
  uint8_t *v37;
  _QWORD *v38;
  char *v39;
  uint64_t v40;
  char *v41;
  NSObject *v42;
  os_log_type_t v43;
  uint8_t *v44;
  _QWORD *v45;
  char *v46;
  uint64_t v47;
  id v48;
  uint64_t v49;
  char *v50;
  NSObject *v51;
  os_log_type_t v52;
  uint8_t *v53;
  _QWORD *v54;
  char *v55;
  void (*v56)(char *, char *, char *);
  id v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  char *v62;
  unint64_t v63;
  uint64_t v64;
  unint64_t v65;
  char *v66;
  uint64_t v67;
  uint64_t v68;
  id v69;
  void *v70;
  id v71;
  id v72;
  uint64_t v73;
  char *v74;
  NSObject *v75;
  os_log_type_t v76;
  uint8_t *v77;
  _QWORD *v78;
  char *v79;
  id v80;
  char *v81;
  uint64_t v82;
  id v83;
  uint64_t v84;
  int v85;
  void *v86;
  uint64_t v87;
  char *v88;
  char *v89;
  uint64_t v90;
  _QWORD *v91;

  v86 = a6;
  v87 = a3;
  v85 = a5;
  v10 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254309C80);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v82 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_254309A30);
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)&v82 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v89 = (char *)sub_23B9582F8();
  v16 = *((_QWORD *)v89 - 1);
  v17 = *(_QWORD *)(v16 + 64);
  v18 = MEMORY[0x24BDAC7A8](v89);
  v19 = (char *)&v82 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v18);
  v88 = (char *)&v82 - v20;
  v21 = &v6[OBJC_IVAR____TtC15FindMyMessaging27MessagingDelegateTrampoline_delegate];
  v22 = MEMORY[0x242609900](&v6[OBJC_IVAR____TtC15FindMyMessaging27MessagingDelegateTrampoline_delegate]);
  if (v22)
  {
    if (a2)
    {
      v84 = v22;
      if (a4)
      {
        v82 = *((_QWORD *)v21 + 1);
        v23 = a2;
        swift_bridgeObjectRetain();
        sub_23B9582C8();
        v24 = v89;
        if ((*(unsigned int (**)(char *, uint64_t, char *))(v16 + 48))(v15, 1, v89) == 1)
        {
          sub_23B930790((uint64_t)v15, &qword_254309A30);
          if (qword_256A55440 != -1)
            swift_once();
          v25 = sub_23B95831C();
          __swift_project_value_buffer(v25, (uint64_t)qword_256A55CD8);
          v26 = v6;
          swift_bridgeObjectRetain();
          v27 = v26;
          v28 = sub_23B958304();
          v29 = sub_23B958550();
          if (os_log_type_enabled(v28, v29))
          {
            v30 = swift_slowAlloc();
            v31 = (_QWORD *)swift_slowAlloc();
            v32 = swift_slowAlloc();
            v91 = (_QWORD *)v32;
            *(_DWORD *)v30 = 136315394;
            v83 = v23;
            swift_bridgeObjectRetain();
            v90 = sub_23B9287E0(v87, a4, (uint64_t *)&v91);
            sub_23B9585A4();
            swift_bridgeObjectRelease_n();
            *(_WORD *)(v30 + 12) = 2112;
            v90 = (uint64_t)v27;
            v33 = v27;
            sub_23B9585A4();
            *v31 = v27;

            _os_log_impl(&dword_23B916000, v28, v29, "MessagingDelegateTrampoline: identifier [%s] is not a valid UUID for %@", (uint8_t *)v30, 0x16u);
            __swift_instantiateConcreteTypeFromMangledName(&qword_256A555C8);
            swift_arrayDestroy();
            MEMORY[0x242609864](v31, -1, -1);
            swift_arrayDestroy();
            MEMORY[0x242609864](v32, -1, -1);
            MEMORY[0x242609864](v30, -1, -1);
            swift_unknownObjectRelease();

          }
          else
          {

            swift_bridgeObjectRelease_n();
            swift_unknownObjectRelease();
          }
        }
        else
        {
          v83 = v23;
          swift_bridgeObjectRelease();
          v56 = *(void (**)(char *, char *, char *))(v16 + 32);
          v56(v88, v15, v24);
          if (a1)
          {
            v57 = objc_msgSend(a1, sel_serviceIdentifier);
            if (v57)
            {
              v58 = v57;
              v59 = sub_23B9583DC();
              v87 = v60;

              v61 = sub_23B9584F0();
              (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v61 - 8) + 56))(v12, 1, 1, v61);
              v62 = v89;
              (*(void (**)(char *, char *, char *))(v16 + 16))(v19, v88, v89);
              v63 = (*(unsigned __int8 *)(v16 + 80) + 72) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
              v64 = v63 + v17;
              v65 = (v63 + v17) & 0xFFFFFFFFFFFFFFF8;
              v66 = (char *)swift_allocObject();
              *((_QWORD *)v66 + 2) = 0;
              *((_QWORD *)v66 + 3) = 0;
              v67 = v82;
              *((_QWORD *)v66 + 4) = v84;
              *((_QWORD *)v66 + 5) = v67;
              v68 = v87;
              *((_QWORD *)v66 + 6) = v59;
              *((_QWORD *)v66 + 7) = v68;
              v69 = v83;
              *((_QWORD *)v66 + 8) = v83;
              v56(&v66[v63], v19, v62);
              v66[v64] = v85 & 1;
              v70 = v86;
              *(_QWORD *)&v66[v65 + 8] = v86;
              v71 = v69;
              swift_unknownObjectRetain();
              v72 = v70;
              sub_23B94CA58((uint64_t)v12, (uint64_t)&unk_256A55BC0, (uint64_t)v66);
              swift_unknownObjectRelease();

              swift_release();
              (*(void (**)(char *, char *))(v16 + 8))(v88, v62);
            }
            else
            {
              if (qword_256A55440 != -1)
                swift_once();
              v73 = sub_23B95831C();
              __swift_project_value_buffer(v73, (uint64_t)qword_256A55CD8);
              v74 = v6;
              v75 = sub_23B958304();
              v76 = sub_23B958550();
              if (os_log_type_enabled(v75, v76))
              {
                v77 = (uint8_t *)swift_slowAlloc();
                v78 = (_QWORD *)swift_slowAlloc();
                *(_DWORD *)v77 = 138412290;
                v91 = v74;
                v79 = v74;
                sub_23B9585A4();
                *v78 = v74;

                _os_log_impl(&dword_23B916000, v75, v76, "MessagingDelegateTrampoline: serviceIdentifier for %@", v77, 0xCu);
                __swift_instantiateConcreteTypeFromMangledName(&qword_256A555C8);
                swift_arrayDestroy();
                MEMORY[0x242609864](v78, -1, -1);
                MEMORY[0x242609864](v77, -1, -1);
              }
              else
              {

              }
              v80 = v83;
              v81 = v89;
              swift_unknownObjectRelease();

              (*(void (**)(char *, char *))(v16 + 8))(v88, v81);
            }
          }
          else
          {
            __break(1u);
          }
        }
        return;
      }
      v47 = qword_256A55440;
      v48 = a2;
      if (v47 != -1)
        swift_once();
      v49 = sub_23B95831C();
      __swift_project_value_buffer(v49, (uint64_t)qword_256A55CD8);
      v50 = v6;
      v51 = sub_23B958304();
      v52 = sub_23B958550();
      if (os_log_type_enabled(v51, v52))
      {
        v53 = (uint8_t *)swift_slowAlloc();
        v54 = (_QWORD *)swift_slowAlloc();
        *(_DWORD *)v53 = 138412290;
        v91 = v50;
        v55 = v50;
        sub_23B9585A4();
        *v54 = v50;

        _os_log_impl(&dword_23B916000, v51, v52, "MessagingDelegateTrampoline: No identifier for %@", v53, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName(&qword_256A555C8);
        swift_arrayDestroy();
        MEMORY[0x242609864](v54, -1, -1);
        MEMORY[0x242609864](v53, -1, -1);
        swift_unknownObjectRelease();

        return;
      }

    }
    else
    {
      if (qword_256A55440 != -1)
        swift_once();
      v40 = sub_23B95831C();
      __swift_project_value_buffer(v40, (uint64_t)qword_256A55CD8);
      v41 = v6;
      v42 = sub_23B958304();
      v43 = sub_23B958550();
      if (os_log_type_enabled(v42, v43))
      {
        v44 = (uint8_t *)swift_slowAlloc();
        v45 = (_QWORD *)swift_slowAlloc();
        *(_DWORD *)v44 = 138412290;
        v91 = v41;
        v46 = v41;
        sub_23B9585A4();
        *v45 = v41;

        _os_log_impl(&dword_23B916000, v42, v43, "MessagingDelegateTrampoline: No account for %@", v44, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName(&qword_256A555C8);
        swift_arrayDestroy();
        MEMORY[0x242609864](v45, -1, -1);
        MEMORY[0x242609864](v44, -1, -1);
        swift_unknownObjectRelease();

        return;
      }

    }
    swift_unknownObjectRelease();
    return;
  }
  if (qword_256A55440 != -1)
    swift_once();
  v34 = sub_23B95831C();
  __swift_project_value_buffer(v34, (uint64_t)qword_256A55CD8);
  v89 = v6;
  v35 = sub_23B958304();
  v36 = sub_23B958550();
  if (os_log_type_enabled(v35, v36))
  {
    v37 = (uint8_t *)swift_slowAlloc();
    v38 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v37 = 138412290;
    v91 = v89;
    v39 = v89;
    sub_23B9585A4();
    *v38 = v89;

    _os_log_impl(&dword_23B916000, v35, v36, "MessagingDelegateTrampoline: No delegate for %@", v37, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256A555C8);
    swift_arrayDestroy();
    MEMORY[0x242609864](v38, -1, -1);
    MEMORY[0x242609864](v37, -1, -1);

  }
  else
  {

  }
}

uint64_t sub_23B950950(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v10;
  char v11;
  uint64_t v12;

  *(_QWORD *)(v8 + 72) = v10;
  *(_QWORD *)(v8 + 80) = v12;
  *(_BYTE *)(v8 + 96) = v11;
  *(_QWORD *)(v8 + 56) = a7;
  *(_QWORD *)(v8 + 64) = a8;
  *(_QWORD *)(v8 + 40) = a5;
  *(_QWORD *)(v8 + 48) = a6;
  *(_QWORD *)(v8 + 32) = a4;
  return swift_task_switch();
}

id sub_23B950988()
{
  uint64_t v0;
  id result;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t ObjectType;
  _QWORD *v6;
  uint64_t (*v7)(_QWORD, _QWORD, uint64_t, _QWORD, _QWORD, _QWORD, uint64_t, _QWORD);

  result = objc_msgSend(*(id *)(v0 + 64), sel_uniqueID);
  if (result)
  {
    v2 = result;
    v3 = *(void **)(v0 + 64);
    v4 = *(_QWORD *)(v0 + 40);
    ObjectType = swift_getObjectType();

    v7 = (uint64_t (*)(_QWORD, _QWORD, uint64_t, _QWORD, _QWORD, _QWORD, uint64_t, _QWORD))(**(int **)(v4 + 8)
                                                                                                  + *(_QWORD *)(v4 + 8));
    v6 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 88) = v6;
    *v6 = v0;
    v6[1] = sub_23B950A4C;
    return (id)v7(*(_QWORD *)(v0 + 48), *(_QWORD *)(v0 + 56), v0 + 16, *(_QWORD *)(v0 + 72), *(unsigned __int8 *)(v0 + 96), *(_QWORD *)(v0 + 80), ObjectType, *(_QWORD *)(v0 + 40));
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_23B950A4C()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

void sub_23B950B54(void *a1, void *a2, void *a3, unint64_t a4, uint64_t a5, unint64_t a6)
{
  char *v6;
  char *v7;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  char *v23;
  char *v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  char *v30;
  char *v31;
  NSObject *v32;
  os_log_type_t v33;
  uint64_t v34;
  _QWORD *v35;
  char *v36;
  char *v37;
  uint64_t v38;
  NSObject *v39;
  os_log_type_t v40;
  uint8_t *v41;
  _QWORD *v42;
  char *v43;
  uint64_t v44;
  char *v45;
  NSObject *v46;
  os_log_type_t v47;
  uint8_t *v48;
  _QWORD *v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  char *v53;
  NSObject *v54;
  os_log_type_t v55;
  uint8_t *v56;
  _QWORD *v57;
  char *v58;
  void (*v59)(char *, char *, uint64_t);
  unint64_t v60;
  void *v61;
  id v62;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  unint64_t v68;
  void (*v69)(char *, char *, uint64_t);
  uint64_t v70;
  char *v71;
  uint64_t v72;
  uint64_t v73;
  id v74;
  uint64_t *v75;
  id v76;
  uint64_t v77;
  void *v78;
  uint64_t v79;
  char *v80;
  NSObject *v81;
  os_log_type_t v82;
  uint8_t *v83;
  _QWORD *v84;
  char *v85;
  id v86;
  uint64_t v87;
  os_log_type_t v88;
  _BOOL4 v89;
  id v90;
  uint8_t *v91;
  uint64_t v92;
  uint64_t v93;
  char *v94;
  uint64_t v95;
  uint64_t v96;
  void *v97;
  id v98;
  uint64_t v99;
  char *v100;
  uint64_t v101;
  unint64_t v102;
  uint64_t v103;

  v7 = v6;
  v96 = a5;
  v97 = a1;
  v98 = a3;
  v11 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254309C80);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v92 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_254309A30);
  MEMORY[0x24BDAC7A8](v14);
  v16 = (char *)&v92 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = sub_23B9582F8();
  v18 = *(char **)(v17 - 8);
  v99 = v17;
  v100 = v18;
  v19 = *((_QWORD *)v18 + 8);
  v20 = MEMORY[0x24BDAC7A8](v17);
  v21 = (char *)&v92 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v20);
  v23 = (char *)&v92 - v22;
  v24 = &v7[OBJC_IVAR____TtC15FindMyMessaging27MessagingDelegateTrampoline_delegate];
  v25 = MEMORY[0x242609900](&v7[OBJC_IVAR____TtC15FindMyMessaging27MessagingDelegateTrampoline_delegate]);
  if (!v25)
  {
    if (qword_256A55440 != -1)
      swift_once();
    v38 = sub_23B95831C();
    __swift_project_value_buffer(v38, (uint64_t)qword_256A55CD8);
    v100 = v7;
    v39 = sub_23B958304();
    v40 = sub_23B958550();
    if (os_log_type_enabled(v39, v40))
    {
      v41 = (uint8_t *)swift_slowAlloc();
      v42 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v41 = 138412290;
      v101 = (uint64_t)v100;
      v43 = v100;
      sub_23B9585A4();
      *v42 = v100;

      _os_log_impl(&dword_23B916000, v39, v40, "MessagingDelegateTrampoline: No delegate for %@", v41, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_256A555C8);
      swift_arrayDestroy();
      MEMORY[0x242609864](v42, -1, -1);
      MEMORY[0x242609864](v41, -1, -1);

      return;
    }

    goto LABEL_28;
  }
  if (a2)
  {
    v95 = v25;
    if (a4)
    {
      v93 = *((_QWORD *)v24 + 1);
      v94 = v23;
      v26 = a2;
      swift_bridgeObjectRetain();
      sub_23B9582C8();
      v27 = v99;
      v28 = v100;
      if ((*((unsigned int (**)(char *, uint64_t, uint64_t))v100 + 6))(v16, 1, v99) == 1)
      {
        sub_23B930790((uint64_t)v16, &qword_254309A30);
        if (qword_256A55440 != -1)
          swift_once();
        v29 = sub_23B95831C();
        __swift_project_value_buffer(v29, (uint64_t)qword_256A55CD8);
        v30 = v7;
        swift_bridgeObjectRetain();
        v31 = v30;
        v32 = sub_23B958304();
        v33 = sub_23B958550();
        if (os_log_type_enabled(v32, v33))
        {
          v34 = swift_slowAlloc();
          v35 = (_QWORD *)swift_slowAlloc();
          v100 = (char *)swift_slowAlloc();
          v101 = (uint64_t)v100;
          *(_DWORD *)v34 = 136315394;
          swift_bridgeObjectRetain();
          v103 = sub_23B9287E0((uint64_t)v98, a4, &v101);
          v98 = v26;
          sub_23B9585A4();
          swift_bridgeObjectRelease_n();
          *(_WORD *)(v34 + 12) = 2112;
          v103 = (uint64_t)v31;
          v36 = v31;
          sub_23B9585A4();
          *v35 = v31;

          _os_log_impl(&dword_23B916000, v32, v33, "MessagingDelegateTrampoline: identifier [%s] is not a valid UUID for %@", (uint8_t *)v34, 0x16u);
          __swift_instantiateConcreteTypeFromMangledName(&qword_256A555C8);
          swift_arrayDestroy();
          MEMORY[0x242609864](v35, -1, -1);
          v37 = v100;
          swift_arrayDestroy();
          MEMORY[0x242609864](v37, -1, -1);
          MEMORY[0x242609864](v34, -1, -1);
          swift_unknownObjectRelease();

        }
        else
        {

          swift_bridgeObjectRelease_n();
          swift_unknownObjectRelease();

        }
        return;
      }
      v98 = v26;
      swift_bridgeObjectRelease();
      v59 = (void (*)(char *, char *, uint64_t))*((_QWORD *)v28 + 4);
      v59(v94, v16, v27);
      if (a6)
      {
        v60 = a6;
        v61 = v97;
        if (v97)
        {
LABEL_24:
          swift_bridgeObjectRetain();
          v62 = objc_msgSend(v61, sel_serviceIdentifier);
          if (v62)
          {
            v63 = v62;
            v64 = sub_23B9583DC();
            v99 = v65;

            v66 = sub_23B9584F0();
            (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v66 - 8) + 56))(v13, 1, 1, v66);
            (*((void (**)(char *, char *, uint64_t))v28 + 2))(v21, v94, v27);
            v67 = v28[80];
            v68 = v60;
            v69 = v59;
            v70 = (v67 + 72) & ~v67;
            v71 = (char *)swift_allocObject();
            *((_QWORD *)v71 + 2) = 0;
            *((_QWORD *)v71 + 3) = 0;
            v72 = v93;
            *((_QWORD *)v71 + 4) = v95;
            *((_QWORD *)v71 + 5) = v72;
            v73 = v99;
            *((_QWORD *)v71 + 6) = v64;
            *((_QWORD *)v71 + 7) = v73;
            v74 = v98;
            *((_QWORD *)v71 + 8) = v98;
            v69(&v71[v70], v21, v27);
            v75 = (uint64_t *)&v71[(v19 + v70 + 7) & 0xFFFFFFFFFFFFFFF8];
            *v75 = v96;
            v75[1] = v68;
            v76 = v74;
            swift_unknownObjectRetain();
            sub_23B94CA58((uint64_t)v13, (uint64_t)&unk_256A55BB0, (uint64_t)v71);
            swift_unknownObjectRelease();

            swift_release();
            (*((void (**)(char *, uint64_t))v100 + 1))(v94, v27);
            return;
          }
          goto LABEL_33;
        }
      }
      else
      {
        v77 = IDSCopyLocalDeviceUniqueID();
        if (!v77)
        {
          if (qword_256A55440 != -1)
            swift_once();
          v87 = sub_23B95831C();
          __swift_project_value_buffer(v87, (uint64_t)qword_256A55CD8);
          v81 = sub_23B958304();
          v88 = sub_23B958550();
          v89 = os_log_type_enabled(v81, v88);
          v90 = v98;
          if (v89)
          {
            v91 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)v91 = 0;
            _os_log_impl(&dword_23B916000, v81, v88, "Ignoring IDSCopyLocalDeviceUniqueID() failed to return a value!", v91, 2u);
            MEMORY[0x242609864](v91, -1, -1);
          }
          swift_unknownObjectRelease();

          goto LABEL_44;
        }
        v78 = (void *)v77;
        sub_23B9583DC();

        v101 = 0x3A656369766564;
        v102 = 0xE700000000000000;
        v27 = v99;
        sub_23B958400();
        v28 = v100;
        swift_bridgeObjectRelease();
        v60 = v102;
        v96 = v101;
        v61 = v97;
        if (v97)
          goto LABEL_24;
      }
      __break(1u);
LABEL_33:
      swift_bridgeObjectRelease();
      if (qword_256A55440 != -1)
        swift_once();
      v79 = sub_23B95831C();
      __swift_project_value_buffer(v79, (uint64_t)qword_256A55CD8);
      v80 = v7;
      v81 = sub_23B958304();
      v82 = sub_23B958550();
      if (os_log_type_enabled(v81, v82))
      {
        v83 = (uint8_t *)swift_slowAlloc();
        v84 = (_QWORD *)swift_slowAlloc();
        *(_DWORD *)v83 = 138412290;
        v101 = (uint64_t)v80;
        v85 = v80;
        v28 = v100;
        sub_23B9585A4();
        *v84 = v80;

        _os_log_impl(&dword_23B916000, v81, v82, "MessagingDelegateTrampoline: serviceIdentifier for %@", v83, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName(&qword_256A555C8);
        swift_arrayDestroy();
        MEMORY[0x242609864](v84, -1, -1);
        MEMORY[0x242609864](v83, -1, -1);
      }
      else
      {

      }
      v86 = v98;
      swift_unknownObjectRelease();

LABEL_44:
      (*((void (**)(char *, uint64_t))v28 + 1))(v94, v99);
      return;
    }
    v51 = qword_256A55440;
    v100 = a2;
    if (v51 != -1)
      swift_once();
    v52 = sub_23B95831C();
    __swift_project_value_buffer(v52, (uint64_t)qword_256A55CD8);
    v53 = v7;
    v54 = sub_23B958304();
    v55 = sub_23B958550();
    if (os_log_type_enabled(v54, v55))
    {
      v56 = (uint8_t *)swift_slowAlloc();
      v57 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v56 = 138412290;
      v101 = (uint64_t)v53;
      v58 = v53;
      sub_23B9585A4();
      *v57 = v53;

      _os_log_impl(&dword_23B916000, v54, v55, "MessagingDelegateTrampoline: No identifier for %@", v56, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_256A555C8);
      swift_arrayDestroy();
      MEMORY[0x242609864](v57, -1, -1);
      MEMORY[0x242609864](v56, -1, -1);
      swift_unknownObjectRelease();

      return;
    }

    swift_unknownObjectRelease();
LABEL_28:

    return;
  }
  if (qword_256A55440 != -1)
    swift_once();
  v44 = sub_23B95831C();
  __swift_project_value_buffer(v44, (uint64_t)qword_256A55CD8);
  v45 = v7;
  v46 = sub_23B958304();
  v47 = sub_23B958550();
  if (os_log_type_enabled(v46, v47))
  {
    v48 = (uint8_t *)swift_slowAlloc();
    v49 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v48 = 138412290;
    v101 = (uint64_t)v45;
    v50 = v45;
    sub_23B9585A4();
    *v49 = v45;

    _os_log_impl(&dword_23B916000, v46, v47, "MessagingDelegateTrampoline: No account for %@", v48, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256A555C8);
    swift_arrayDestroy();
    MEMORY[0x242609864](v49, -1, -1);
    MEMORY[0x242609864](v48, -1, -1);
    swift_unknownObjectRelease();

  }
  else
  {

    swift_unknownObjectRelease();
  }
}

uint64_t sub_23B951758(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  __int128 v10;
  uint64_t v11;

  *(_QWORD *)(v8 + 136) = v11;
  *(_OWORD *)(v8 + 120) = v10;
  *(_QWORD *)(v8 + 104) = a7;
  *(_QWORD *)(v8 + 112) = a8;
  *(_QWORD *)(v8 + 88) = a5;
  *(_QWORD *)(v8 + 96) = a6;
  *(_QWORD *)(v8 + 80) = a4;
  return swift_task_switch();
}

char sub_23B95178C()
{
  uint64_t v0;
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  Swift::String v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t ObjectType;
  _QWORD *v15;
  uint64_t (*v17)(_QWORD, _QWORD, uint64_t, _QWORD, uint64_t, uint64_t, _QWORD);

  v1 = objc_msgSend(*(id *)(v0 + 112), sel_uniqueID);
  if (!v1)
  {
    __break(1u);
    goto LABEL_5;
  }
  v2 = v1;
  v4 = *(_QWORD *)(v0 + 128);
  v3 = *(void **)(v0 + 136);
  v5 = *(void **)(v0 + 112);
  v6 = sub_23B9583DC();
  v8 = v7;

  *(_QWORD *)(v0 + 144) = v8;
  *(_QWORD *)(v0 + 64) = v6;
  *(_QWORD *)(v0 + 72) = v8;
  swift_bridgeObjectRetain();
  v9._countAndFlagsBits = v4;
  v9._object = v3;
  LOBYTE(v1) = Destination.init(stringRepresentation:)(v9);
  v10 = *(_QWORD *)(v0 + 32);
  *(_QWORD *)(v0 + 152) = v10;
  if (!v10)
  {
LABEL_5:
    __break(1u);
    return (char)v1;
  }
  v11 = *(_QWORD *)(v0 + 88);
  v13 = *(_QWORD *)(v0 + 16);
  v12 = *(_QWORD *)(v0 + 24);
  ObjectType = swift_getObjectType();
  *(_BYTE *)(v0 + 40) = v13;
  *(_QWORD *)(v0 + 48) = v12;
  *(_QWORD *)(v0 + 56) = v10;
  v17 = (uint64_t (*)(_QWORD, _QWORD, uint64_t, _QWORD, uint64_t, uint64_t, _QWORD))(**(int **)(v11 + 16)
                                                                                          + *(_QWORD *)(v11 + 16));
  v15 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 160) = v15;
  *v15 = v0;
  v15[1] = sub_23B9518AC;
  LOBYTE(v1) = v17(*(_QWORD *)(v0 + 96), *(_QWORD *)(v0 + 104), v0 + 64, *(_QWORD *)(v0 + 120), v0 + 40, ObjectType, *(_QWORD *)(v0 + 88));
  return (char)v1;
}

uint64_t sub_23B9518AC()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

void sub_23B951A18(void *a1, uint64_t a2)
{
  char *v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unsigned __int8 v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  os_log_type_t v24;
  uint8_t *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  NSObject *v31;
  os_log_type_t v32;
  uint8_t *v33;
  _QWORD *v34;
  char *v35;
  uint64_t v36;
  char v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char v42;
  char v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  void *v48;
  id v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  unint64_t v55;
  unint64_t v56;
  unint64_t v57;
  void (*v58)(uint64_t *, _QWORD);
  uint64_t v59;
  uint64_t v60;
  id v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  _QWORD *v67;
  uint64_t v68;
  char *v69;
  NSObject *v70;
  os_log_type_t v71;
  uint8_t *v72;
  _QWORD *v73;
  char *v74;
  uint64_t v75;
  id v76;
  char *v77;
  char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  char *v82;
  uint64_t v83[4];
  uint64_t v84;
  uint64_t v85;
  unsigned __int8 v86;
  uint64_t v87;

  v5 = sub_23B95831C();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v75 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254309C80);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v75 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = &v2[OBJC_IVAR____TtC15FindMyMessaging27MessagingDelegateTrampoline_delegate];
  v13 = MEMORY[0x242609900](&v2[OBJC_IVAR____TtC15FindMyMessaging27MessagingDelegateTrampoline_delegate]);
  if (v13)
  {
    v76 = a1;
    v77 = v11;
    v78 = v2;
    v79 = v13;
    v80 = v5;
    if (!a2 || (v14 = *((_QWORD *)v12 + 1), (v15 = sub_23B9522C8(a2)) == 0))
    {
      if (qword_256A55440 != -1)
        swift_once();
      v21 = v80;
      v22 = __swift_project_value_buffer(v80, (uint64_t)qword_256A55CD8);
      (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, v22, v21);
      swift_bridgeObjectRetain_n();
      v23 = sub_23B958304();
      v24 = sub_23B958550();
      if (!os_log_type_enabled(v23, v24))
      {

        swift_bridgeObjectRelease_n();
        swift_unknownObjectRelease();
        (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v21);
        return;
      }
      v25 = (uint8_t *)swift_slowAlloc();
      v26 = swift_slowAlloc();
      v83[0] = v26;
      *(_DWORD *)v25 = 136315138;
      if (a2)
      {
        v27 = v26;
        swift_bridgeObjectRetain();
        v28 = sub_23B958514();
        v30 = v29;
        swift_bridgeObjectRelease();
        v84 = sub_23B9287E0(v28, v30, v83);
        sub_23B9585A4();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_23B916000, v23, v24, "MessagingDelegateTrampoline: Unable to convert accounts to Set<IDSAccount> %s", v25, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x242609864](v27, -1, -1);
        MEMORY[0x242609864](v25, -1, -1);
        swift_unknownObjectRelease();

        (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v80);
        return;
      }
      goto LABEL_50;
    }
    v16 = v15;
    v82 = (char *)(v15 & 0xC000000000000001);
    if ((v15 & 0xC000000000000001) != 0)
    {
      v17 = sub_23B95861C();
      v75 = v14;
      if (v17)
      {
LABEL_6:
        v87 = MEMORY[0x24BEE4AF8];
        sub_23B928E74(0, v17 & ~(v17 >> 63), 0);
        if (v82)
        {
          v18 = sub_23B9585EC();
          v20 = 1;
        }
        else
        {
          v18 = sub_23B955EDC(v16);
          v20 = v37 & 1;
        }
        v84 = v18;
        v85 = v19;
        v86 = v20;
        if ((v17 & 0x8000000000000000) == 0)
        {
          v38 = v16 & 0xFFFFFFFFFFFFFF8;
          if (v16 < 0)
            v38 = v16;
          v81 = v38;
          while (1)
          {
            v45 = v84;
            v44 = v85;
            v46 = v86;
            sub_23B955C74(v84, v85, v86, v16);
            v48 = v47;
            v49 = objc_msgSend(v47, sel_uniqueID);
            if (!v49)
              break;
            v50 = v49;
            v51 = sub_23B9583DC();
            v53 = v52;

            v54 = v87;
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            {
              sub_23B928E74(0, *(_QWORD *)(v54 + 16) + 1, 1);
              v54 = v87;
            }
            v56 = *(_QWORD *)(v54 + 16);
            v55 = *(_QWORD *)(v54 + 24);
            if (v56 >= v55 >> 1)
            {
              sub_23B928E74(v55 > 1, v56 + 1, 1);
              v54 = v87;
            }
            *(_QWORD *)(v54 + 16) = v56 + 1;
            v57 = v54 + 16 * v56;
            *(_QWORD *)(v57 + 32) = v51;
            *(_QWORD *)(v57 + 40) = v53;
            if (v82)
            {
              if ((v46 & 1) == 0)
                goto LABEL_48;
              if (sub_23B9585F8())
                swift_isUniquelyReferenced_nonNull_native();
              __swift_instantiateConcreteTypeFromMangledName(&qword_256A55B80);
              v58 = (void (*)(uint64_t *, _QWORD))sub_23B95852C();
              sub_23B958634();
              v58(v83, 0);
              if (!--v17)
              {
LABEL_37:
                sub_23B937238(v84, v85, v86);
                swift_bridgeObjectRelease();
                v36 = v87;
                goto LABEL_38;
              }
            }
            else
            {
              v39 = sub_23B937244(v45, v44, v46, v16);
              v41 = v40;
              v43 = v42;
              sub_23B937238(v45, v44, v46);
              v84 = v39;
              v85 = v41;
              v86 = v43 & 1;
              if (!--v17)
                goto LABEL_37;
            }
          }
          __break(1u);
LABEL_48:
          __break(1u);
          goto LABEL_49;
        }
        __break(1u);
LABEL_46:
        swift_once();
LABEL_42:
        __swift_project_value_buffer(v5, (uint64_t)qword_256A55CD8);
        v69 = v11;
        v70 = sub_23B958304();
        v71 = sub_23B958550();
        if (os_log_type_enabled(v70, v71))
        {
          v72 = (uint8_t *)swift_slowAlloc();
          v73 = (_QWORD *)swift_slowAlloc();
          *(_DWORD *)v72 = 138412290;
          v83[0] = (uint64_t)v69;
          v74 = v69;
          sub_23B9585A4();
          *v73 = v69;

          _os_log_impl(&dword_23B916000, v70, v71, "MessagingDelegateTrampoline: serviceIdentifier for %@", v72, 0xCu);
          __swift_instantiateConcreteTypeFromMangledName(&qword_256A555C8);
          swift_arrayDestroy();
          MEMORY[0x242609864](v73, -1, -1);
          MEMORY[0x242609864](v72, -1, -1);
          swift_unknownObjectRelease();

        }
        else
        {

          swift_unknownObjectRelease();
        }
        return;
      }
    }
    else
    {
      v17 = *(_QWORD *)(v15 + 16);
      v75 = v14;
      if (v17)
        goto LABEL_6;
    }
    swift_bridgeObjectRelease();
    v36 = MEMORY[0x24BEE4AF8];
LABEL_38:
    v59 = sub_23B92D928(v36);
    swift_bridgeObjectRelease();
    v5 = v80;
    v60 = (uint64_t)v77;
    v11 = v78;
    if (!v76)
    {
LABEL_49:
      __break(1u);
LABEL_50:
      __break(1u);
      return;
    }
    v61 = objc_msgSend(v76, sel_serviceIdentifier);
    if (v61)
    {
      v62 = v61;
      v63 = sub_23B9583DC();
      v65 = v64;

      v66 = sub_23B9584F0();
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v66 - 8) + 56))(v60, 1, 1, v66);
      v67 = (_QWORD *)swift_allocObject();
      v67[2] = 0;
      v67[3] = 0;
      v68 = v75;
      v67[4] = v79;
      v67[5] = v68;
      v67[6] = v63;
      v67[7] = v65;
      v67[8] = v59;
      sub_23B94CA58(v60, (uint64_t)&unk_256A55B90, (uint64_t)v67);
      swift_release();
      return;
    }
    swift_bridgeObjectRelease();
    if (qword_256A55440 == -1)
      goto LABEL_42;
    goto LABEL_46;
  }
  if (qword_256A55440 != -1)
    swift_once();
  __swift_project_value_buffer(v5, (uint64_t)qword_256A55CD8);
  v82 = v2;
  v31 = sub_23B958304();
  v32 = sub_23B958550();
  if (os_log_type_enabled(v31, v32))
  {
    v33 = (uint8_t *)swift_slowAlloc();
    v34 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v33 = 138412290;
    v83[0] = (uint64_t)v82;
    v35 = v82;
    sub_23B9585A4();
    *v34 = v82;

    _os_log_impl(&dword_23B916000, v31, v32, "MessagingDelegateTrampoline: No delegate for %@", v33, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256A555C8);
    swift_arrayDestroy();
    MEMORY[0x242609864](v34, -1, -1);
    MEMORY[0x242609864](v33, -1, -1);

  }
  else
  {

  }
}

uint64_t sub_23B9522C8(uint64_t a1)
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
  int64_t v12;
  int64_t v13;
  unint64_t v14;
  int64_t v15;
  void *v16;
  uint64_t v17;
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
  _BYTE v28[40];

  if (*(_QWORD *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_256A55BA0);
    v2 = sub_23B95867C();
  }
  else
  {
    v2 = MEMORY[0x24BEE4B08];
  }
  v27 = a1 + 56;
  v3 = -1 << *(_BYTE *)(a1 + 32);
  if (-v3 < 64)
    v4 = ~(-1 << -(char)v3);
  else
    v4 = -1;
  v5 = v4 & *(_QWORD *)(a1 + 56);
  v26 = (unint64_t)(63 - v3) >> 6;
  v6 = v2 + 56;
  swift_bridgeObjectRetain();
  result = swift_retain();
  v8 = 0;
  while (1)
  {
    if (v5)
    {
      v10 = (v5 - 1) & v5;
      v11 = __clz(__rbit64(v5)) | (v8 << 6);
      v12 = v8;
      goto LABEL_28;
    }
    v13 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
LABEL_41:
      __break(1u);
      goto LABEL_42;
    }
    if (v13 >= v26)
      goto LABEL_39;
    v14 = *(_QWORD *)(v27 + 8 * v13);
    v12 = v8 + 1;
    if (!v14)
    {
      v12 = v8 + 2;
      if (v8 + 2 >= v26)
        goto LABEL_39;
      v14 = *(_QWORD *)(v27 + 8 * v12);
      if (!v14)
      {
        v12 = v8 + 3;
        if (v8 + 3 >= v26)
          goto LABEL_39;
        v14 = *(_QWORD *)(v27 + 8 * v12);
        if (!v14)
        {
          v12 = v8 + 4;
          if (v8 + 4 >= v26)
            goto LABEL_39;
          v14 = *(_QWORD *)(v27 + 8 * v12);
          if (!v14)
            break;
        }
      }
    }
LABEL_27:
    v10 = (v14 - 1) & v14;
    v11 = __clz(__rbit64(v14)) + (v12 << 6);
LABEL_28:
    sub_23B91B25C(*(_QWORD *)(a1 + 48) + 40 * v11, (uint64_t)v28);
    v16 = (void *)sub_23B958640();
    sub_23B9560AC((uint64_t)v28);
    objc_opt_self();
    v17 = swift_dynamicCastObjCClass();
    if (!v17)
    {
      swift_release_n();

      sub_23B91B314();
      return 0;
    }
    v18 = v17;
    result = sub_23B958580();
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
          goto LABEL_41;
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
    *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v9) = v18;
    ++*(_QWORD *)(v2 + 16);
    v8 = v12;
    v5 = v10;
  }
  v15 = v8 + 5;
  if (v8 + 5 >= v26)
  {
LABEL_39:
    swift_release();
    sub_23B91B314();
    return v2;
  }
  v14 = *(_QWORD *)(v27 + 8 * v15);
  if (v14)
  {
    v12 = v8 + 5;
    goto LABEL_27;
  }
  while (1)
  {
    v12 = v15 + 1;
    if (__OFADD__(v15, 1))
      break;
    if (v12 >= v26)
      goto LABEL_39;
    v14 = *(_QWORD *)(v27 + 8 * v12);
    ++v15;
    if (v14)
      goto LABEL_27;
  }
LABEL_42:
  __break(1u);
  return result;
}

uint64_t sub_23B952604(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t ObjectType;
  _QWORD *v14;
  uint64_t (*v16)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);

  ObjectType = swift_getObjectType();
  v16 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(**(int **)(a5 + 48) + *(_QWORD *)(a5 + 48));
  v14 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v8 + 16) = v14;
  *v14 = v8;
  v14[1] = sub_23B930844;
  return v16(a6, a7, a8, ObjectType, a5);
}

uint64_t sub_23B95271C(uint64_t a1)
{
  uint64_t v2;
  uint64_t i;
  _BYTE v5[32];
  uint64_t v6;

  v6 = MEMORY[0x24BEE4AF8];
  v2 = *(_QWORD *)(a1 + 16);
  sub_23B9586D0();
  if (!v2)
    return v6;
  for (i = a1 + 32; ; i += 32)
  {
    sub_23B91B298(i, (uint64_t)v5);
    sub_23B92D0DC(0, &qword_254309860);
    if (!swift_dynamicCast())
      break;
    sub_23B9586B8();
    sub_23B9586DC();
    sub_23B9586E8();
    sub_23B9586C4();
    if (!--v2)
      return v6;
  }
  swift_release();

  return 0;
}

void sub_23B952848(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  char *v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  char *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  NSObject *v28;
  os_log_type_t v29;
  uint8_t *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  unint64_t v36;
  NSObject *v37;
  os_log_type_t v38;
  uint8_t *v39;
  _QWORD *v40;
  char *v41;
  char *v42;
  NSObject *v43;
  os_log_type_t v44;
  uint8_t *v45;
  _QWORD *v46;
  char *v47;
  _QWORD v48[2];
  uint64_t v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;

  v8 = sub_23B95831C();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8]();
  v11 = (char *)v48 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254309C80);
  MEMORY[0x24BDAC7A8]();
  v13 = (char *)v48 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = &v4[OBJC_IVAR____TtC15FindMyMessaging27MessagingDelegateTrampoline_delegate];
  v15 = (char *)MEMORY[0x242609900](&v4[OBJC_IVAR____TtC15FindMyMessaging27MessagingDelegateTrampoline_delegate]);
  if (v15)
  {
    v50 = v15;
    if (a2)
    {
      v49 = *((_QWORD *)v14 + 1);
      v16 = sub_23B95271C(a2);
      if (v16)
      {
        if (a1)
        {
          v17 = v16;
          v18 = objc_msgSend(a1, sel_serviceIdentifier);
          if (v18)
          {
            v19 = v18;
            v20 = sub_23B9583DC();
            v22 = v21;

            v23 = sub_23B9584F0();
            (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 56))(v13, 1, 1, v23);
            v24 = (_QWORD *)swift_allocObject();
            v24[2] = 0;
            v24[3] = 0;
            v25 = v49;
            v26 = v50;
            v24[4] = v17;
            v24[5] = v26;
            v24[6] = v25;
            v24[7] = v20;
            v24[8] = v22;
            swift_bridgeObjectRetain();
            swift_unknownObjectRetain();
            swift_bridgeObjectRetain();
            sub_23B94CA58((uint64_t)v13, a4, (uint64_t)v24);
            swift_unknownObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_release();
          }
          else
          {
            swift_bridgeObjectRelease();
            if (qword_256A55440 != -1)
              swift_once();
            __swift_project_value_buffer(v8, (uint64_t)qword_256A55CD8);
            v42 = v4;
            v43 = sub_23B958304();
            v44 = sub_23B958550();
            if (os_log_type_enabled(v43, v44))
            {
              v45 = (uint8_t *)swift_slowAlloc();
              v46 = (_QWORD *)swift_slowAlloc();
              *(_DWORD *)v45 = 138412290;
              v52 = (uint64_t)v42;
              v47 = v42;
              sub_23B9585A4();
              *v46 = v42;

              _os_log_impl(&dword_23B916000, v43, v44, "MessagingDelegateTrampoline: serviceIdentifier for %@", v45, 0xCu);
              __swift_instantiateConcreteTypeFromMangledName(&qword_256A555C8);
              swift_arrayDestroy();
              MEMORY[0x242609864](v46, -1, -1);
              MEMORY[0x242609864](v45, -1, -1);

            }
            else
            {

            }
            swift_unknownObjectRelease();
          }
          return;
        }
        __break(1u);
LABEL_26:
        __break(1u);
        return;
      }
    }
    if (qword_256A55440 != -1)
      swift_once();
    v27 = __swift_project_value_buffer(v8, (uint64_t)qword_256A55CD8);
    (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, v27, v8);
    swift_bridgeObjectRetain_n();
    v28 = sub_23B958304();
    v29 = sub_23B958550();
    if (os_log_type_enabled(v28, v29))
    {
      v30 = (uint8_t *)swift_slowAlloc();
      v31 = swift_slowAlloc();
      v52 = v31;
      *(_DWORD *)v30 = 136315138;
      if (!a2)
        goto LABEL_26;
      v32 = v31;
      v48[1] = v30 + 4;
      v33 = swift_bridgeObjectRetain();
      v49 = MEMORY[0x24BEE4AD8] + 8;
      v34 = MEMORY[0x242608FAC](v33);
      v36 = v35;
      swift_bridgeObjectRelease();
      v51 = sub_23B9287E0(v34, v36, &v52);
      sub_23B9585A4();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_23B916000, v28, v29, "MessagingDelegateTrampoline: Unable to convert devices to [IDSDevice] %s", v30, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x242609864](v32, -1, -1);
      MEMORY[0x242609864](v30, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    swift_unknownObjectRelease();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    return;
  }
  if (qword_256A55440 != -1)
    swift_once();
  __swift_project_value_buffer(v8, (uint64_t)qword_256A55CD8);
  v50 = v4;
  v37 = sub_23B958304();
  v38 = sub_23B958550();
  if (os_log_type_enabled(v37, v38))
  {
    v39 = (uint8_t *)swift_slowAlloc();
    v40 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v39 = 138412290;
    v52 = (uint64_t)v50;
    v41 = v50;
    sub_23B9585A4();
    *v40 = v50;

    _os_log_impl(&dword_23B916000, v37, v38, "MessagingDelegateTrampoline: No delegate for %@", v39, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256A555C8);
    swift_arrayDestroy();
    MEMORY[0x242609864](v40, -1, -1);
    MEMORY[0x242609864](v39, -1, -1);

  }
  else
  {

  }
}

uint64_t sub_23B952ED0(void *a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v10;
  id v11;
  id v12;

  if (a4)
    v10 = sub_23B958484();
  else
    v10 = 0;
  v11 = a3;
  v12 = a1;
  sub_23B952848(a3, v10, a5, a6);

  return swift_bridgeObjectRelease();
}

uint64_t sub_23B952F60(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v8;

  v8[146] = a8;
  v8[145] = a7;
  v8[144] = a6;
  v8[143] = a5;
  v8[142] = a4;
  return swift_task_switch();
}

uint64_t sub_23B952F88()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  _OWORD *v7;
  id v8;
  id v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _OWORD *v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  unint64_t v24;
  unint64_t v25;
  _OWORD *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint64_t v34;
  uint64_t ObjectType;
  _QWORD *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t (*v39)(_QWORD, _QWORD, _QWORD *, uint64_t, _QWORD);
  uint64_t v40;
  uint64_t v41;
  _OWORD v42[11];

  v1 = *(_QWORD *)(v0 + 1136);
  if (v1 >> 62)
  {
    swift_bridgeObjectRetain();
    v2 = sub_23B958730();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v3 = MEMORY[0x24BEE4AF8];
  if (v2)
  {
    v41 = MEMORY[0x24BEE4AF8];
    result = sub_23B928E58(0, v2 & ~(v2 >> 63), 0);
    if (v2 < 0)
    {
      __break(1u);
      return result;
    }
    v5 = 0;
    v3 = v41;
    v6 = v40 + 16;
    v7 = (_OWORD *)(v40 + 976);
    v37 = *(_QWORD *)(v40 + 1136) + 32;
    do
    {
      if ((v1 & 0xC000000000000001) != 0)
        v8 = (id)MEMORY[0x2426091BC](v5, *(_QWORD *)(v40 + 1136));
      else
        v8 = *(id *)(v37 + 8 * v5);
      v9 = v8;
      sub_23B956C18(v9, (uint64_t)v42);

      v10 = v42[7];
      *(_OWORD *)(v40 + 1072) = v42[6];
      *(_OWORD *)(v40 + 1088) = v10;
      v11 = v42[9];
      *(_OWORD *)(v40 + 1104) = v42[8];
      *(_OWORD *)(v40 + 1120) = v11;
      v12 = v42[3];
      *(_OWORD *)(v40 + 1008) = v42[2];
      *(_OWORD *)(v40 + 1024) = v12;
      v13 = v42[5];
      *(_OWORD *)(v40 + 1040) = v42[4];
      *(_OWORD *)(v40 + 1056) = v13;
      v14 = v42[1];
      *v7 = v42[0];
      *(_OWORD *)(v40 + 992) = v14;
      nullsub_1(v7);
      sub_23B92D130((uint64_t)v7, v6);
      v16 = *(_QWORD *)(v41 + 16);
      v15 = *(_QWORD *)(v41 + 24);
      if (v16 >= v15 >> 1)
        sub_23B928E58(v15 > 1, v16 + 1, 1);
      ++v5;
      *(_QWORD *)(v41 + 16) = v16 + 1;
      sub_23B92D130(v6, v41 + 160 * v16 + 32);
    }
    while (v2 != v5);
  }
  v17 = *(_QWORD *)(v3 + 16);
  if (v17)
  {
    v18 = v40 + 336;
    v19 = v40 + 496;
    v38 = v40 + 656;
    v20 = (_OWORD *)(v40 + 816);
    v21 = v3 + 32;
    swift_bridgeObjectRetain();
    v22 = v17 - 1;
    v23 = (_QWORD *)MEMORY[0x24BEE4AF8];
    while (1)
    {
      sub_23B92D130(v21, v19);
      sub_23B92D130(v19, v18);
      if (sub_23B92D220(v18) != 1)
      {
        sub_23B92D130(v19, v38);
        sub_23B92D178(v38);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v23 = sub_23B928270(0, v23[2] + 1, 1, v23);
        v25 = v23[2];
        v24 = v23[3];
        if (v25 >= v24 >> 1)
          v23 = sub_23B928270((_QWORD *)(v24 > 1), v25 + 1, 1, v23);
        sub_23B92D130(v19, (uint64_t)v20);
        v23[2] = v25 + 1;
        v26 = &v23[20 * v25];
        v27 = *(_OWORD *)(v40 + 832);
        v26[2] = *v20;
        v26[3] = v27;
        v28 = *(_OWORD *)(v40 + 896);
        v30 = *(_OWORD *)(v40 + 848);
        v29 = *(_OWORD *)(v40 + 864);
        v26[6] = *(_OWORD *)(v40 + 880);
        v26[7] = v28;
        v26[4] = v30;
        v26[5] = v29;
        v31 = *(_OWORD *)(v40 + 960);
        v33 = *(_OWORD *)(v40 + 912);
        v32 = *(_OWORD *)(v40 + 928);
        v26[10] = *(_OWORD *)(v40 + 944);
        v26[11] = v31;
        v26[8] = v33;
        v26[9] = v32;
      }
      if (!v22)
        break;
      --v22;
      v21 += 160;
    }
    swift_bridgeObjectRelease_n();
  }
  else
  {
    swift_bridgeObjectRelease();
    v23 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  *(_QWORD *)(v40 + 1176) = v23;
  v34 = *(_QWORD *)(v40 + 1152);
  ObjectType = swift_getObjectType();
  v39 = (uint64_t (*)(_QWORD, _QWORD, _QWORD *, uint64_t, _QWORD))(**(int **)(v34 + 56) + *(_QWORD *)(v34 + 56));
  v36 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v40 + 1184) = v36;
  *v36 = v40;
  v36[1] = sub_23B953310;
  return v39(*(_QWORD *)(v40 + 1160), *(_QWORD *)(v40 + 1168), v23, ObjectType, *(_QWORD *)(v40 + 1152));
}

uint64_t sub_23B953310()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

id sub_23B953390()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for MessagingDelegateTrampoline()
{
  return objc_opt_self();
}

uint64_t sub_23B9533F4(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_23B953458;
  return v6(a1);
}

uint64_t sub_23B953458()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_23B9534A8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  __int128 v4;
  __int128 v6;

  v6 = *(_OWORD *)(v0 + 48);
  v2 = *(_QWORD *)(v0 + 64);
  v3 = swift_task_alloc();
  v4 = *(_OWORD *)(v0 + 32);
  *(_QWORD *)(v1 + 16) = v3;
  *(_QWORD *)v3 = v1;
  *(_QWORD *)(v3 + 8) = sub_23B930844;
  *(_QWORD *)(v3 + 1168) = v2;
  *(_OWORD *)(v3 + 1152) = v6;
  *(_OWORD *)(v3 + 1136) = v4;
  return swift_task_switch();
}

uint64_t sub_23B953528()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23B95354C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_23B92F9BC;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_256A55B70 + dword_256A55B70))(a1, v4);
}

uint64_t sub_23B9535BC(uint64_t a1, char a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  unint64_t v16;
  uint64_t result;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v21 = a3;
  v22 = a4;
  v8 = sub_23B9582F8();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for CorrelationIdentifier();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v20 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23B958880();
  sub_23B92F2F8(a1, (uint64_t)v15, (uint64_t (*)(_QWORD))type metadata accessor for CorrelationIdentifier);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v11, v15, v8);
    sub_23B95888C();
    sub_23B956B10();
    sub_23B9583AC();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  }
  else
  {
    sub_23B95888C();
    sub_23B9583F4();
    swift_bridgeObjectRelease();
  }
  sub_23B9588B0();
  v16 = sub_23B9585E0();
  *(_QWORD *)((char *)a5 + ((v16 >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << v16;
  result = sub_23B92F378(a1, a5[6] + *(_QWORD *)(v13 + 72) * v16, (uint64_t (*)(_QWORD))type metadata accessor for CorrelationIdentifier);
  v18 = a5[7] + 24 * v16;
  *(_BYTE *)v18 = a2;
  v19 = v22;
  *(_QWORD *)(v18 + 8) = v21;
  *(_QWORD *)(v18 + 16) = v19;
  ++a5[2];
  return result;
}

uint64_t sub_23B9537B4(uint64_t a1, char a2)
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
  char v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t *v35;
  int64_t v36;
  uint64_t v37;
  char v38;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256A55C48);
  v38 = a2;
  v6 = sub_23B958748();
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
    v30 = *(_BYTE *)v29;
    v32 = *(_QWORD *)(v29 + 8);
    v31 = *(_QWORD *)(v29 + 16);
    v33 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + 8 * v20);
    if ((v38 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    sub_23B958880();
    sub_23B95888C();
    sub_23B9583F4();
    result = sub_23B9588B0();
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
    *(_BYTE *)v18 = v30;
    *(_QWORD *)(v18 + 8) = v32;
    *(_QWORD *)(v18 + 16) = v31;
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

uint64_t sub_23B953AE4(uint64_t a1, char a2)
{
  return sub_23B954494(a1, a2, &qword_256A556B0, (void (*)(uint64_t, _BYTE *))sub_23B92DA04, (void (*)(uint64_t, _BYTE *))sub_23B91B298);
}

uint64_t sub_23B953B00(uint64_t a1, int a2)
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
  unint64_t v23;
  int64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  char v31;
  unint64_t v32;
  BOOL v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t *v37;
  int64_t v38;
  _QWORD *v39;
  uint64_t i;
  int v41;

  v3 = v2;
  v5 = sub_23B9582F8();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8]();
  v8 = (char *)&v36 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256A55C20);
  v41 = a2;
  v10 = sub_23B958748();
  v11 = v10;
  if (*(_QWORD *)(v9 + 16))
  {
    v37 = v2;
    v12 = 1 << *(_BYTE *)(v9 + 32);
    v13 = *(_QWORD *)(v9 + 64);
    v39 = (_QWORD *)(v9 + 64);
    if (v12 < 64)
      v14 = ~(-1 << v12);
    else
      v14 = -1;
    v15 = v14 & v13;
    v38 = (unint64_t)(v12 + 63) >> 6;
    v16 = v10 + 64;
    result = swift_retain();
    v18 = 0;
    for (i = v9; ; v9 = i)
    {
      if (v15)
      {
        v20 = __clz(__rbit64(v15));
        v15 &= v15 - 1;
        v21 = v20 | (v18 << 6);
      }
      else
      {
        v22 = v18 + 1;
        if (__OFADD__(v18, 1))
        {
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          return result;
        }
        if (v22 >= v38)
          goto LABEL_34;
        v23 = v39[v22];
        ++v18;
        if (!v23)
        {
          v18 = v22 + 1;
          if (v22 + 1 >= v38)
            goto LABEL_34;
          v23 = v39[v18];
          if (!v23)
          {
            v24 = v22 + 2;
            if (v24 >= v38)
            {
LABEL_34:
              swift_release();
              v3 = v37;
              if ((v41 & 1) != 0)
              {
                v35 = 1 << *(_BYTE *)(v9 + 32);
                if (v35 >= 64)
                  bzero(v39, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v39 = -1 << v35;
                *(_QWORD *)(v9 + 16) = 0;
              }
              break;
            }
            v23 = v39[v24];
            if (!v23)
            {
              while (1)
              {
                v18 = v24 + 1;
                if (__OFADD__(v24, 1))
                  goto LABEL_41;
                if (v18 >= v38)
                  goto LABEL_34;
                v23 = v39[v18];
                ++v24;
                if (v23)
                  goto LABEL_21;
              }
            }
            v18 = v24;
          }
        }
LABEL_21:
        v15 = (v23 - 1) & v23;
        v21 = __clz(__rbit64(v23)) + (v18 << 6);
      }
      v25 = *(_QWORD *)(v6 + 72);
      v26 = *(_QWORD *)(v9 + 48) + v25 * v21;
      if ((v41 & 1) != 0)
      {
        (*(void (**)(char *, unint64_t, uint64_t))(v6 + 32))(v8, v26, v5);
        v27 = *(_QWORD *)(*(_QWORD *)(v9 + 56) + 8 * v21);
      }
      else
      {
        (*(void (**)(char *, unint64_t, uint64_t))(v6 + 16))(v8, v26, v5);
        v27 = *(_QWORD *)(*(_QWORD *)(v9 + 56) + 8 * v21);
        swift_retain();
      }
      sub_23B956B10();
      result = sub_23B9583A0();
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
            goto LABEL_40;
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
      result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v6 + 32))(*(_QWORD *)(v11 + 48) + v25 * v19, v8, v5);
      *(_QWORD *)(*(_QWORD *)(v11 + 56) + 8 * v19) = v27;
      ++*(_QWORD *)(v11 + 16);
    }
  }
  result = swift_release();
  *v3 = v11;
  return result;
}

uint64_t sub_23B953E6C(uint64_t a1, char a2)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  int64_t v14;
  uint64_t result;
  int64_t v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  int64_t v23;
  _QWORD *v24;
  unint64_t v25;
  int64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD *v31;
  _QWORD *v32;
  _QWORD *v33;

  v3 = v2;
  v5 = type metadata accessor for CorrelationIdentifier();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v30 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256A55C28);
  v33 = (_QWORD *)sub_23B958748();
  if (*(_QWORD *)(v9 + 16))
  {
    v10 = 1 << *(_BYTE *)(v9 + 32);
    v11 = *(_QWORD *)(v9 + 64);
    v31 = v2;
    v32 = (_QWORD *)(v9 + 64);
    v12 = -1;
    if (v10 < 64)
      v12 = ~(-1 << v10);
    v13 = v12 & v11;
    v14 = (unint64_t)(v10 + 63) >> 6;
    result = swift_retain();
    v16 = 0;
    while (1)
    {
      if (v13)
      {
        v21 = __clz(__rbit64(v13));
        v13 &= v13 - 1;
        v22 = v21 | (v16 << 6);
      }
      else
      {
        v23 = v16 + 1;
        if (__OFADD__(v16, 1))
        {
          __break(1u);
LABEL_32:
          __break(1u);
          return result;
        }
        v24 = v32;
        if (v23 >= v14)
          goto LABEL_23;
        v25 = v32[v23];
        ++v16;
        if (!v25)
        {
          v16 = v23 + 1;
          if (v23 + 1 >= v14)
            goto LABEL_23;
          v25 = v32[v16];
          if (!v25)
          {
            v26 = v23 + 2;
            if (v26 >= v14)
            {
LABEL_23:
              swift_release();
              if ((a2 & 1) == 0)
              {
                result = swift_release();
                v3 = v31;
                goto LABEL_30;
              }
              v29 = 1 << *(_BYTE *)(v9 + 32);
              if (v29 >= 64)
                bzero(v24, ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
              else
                *v24 = -1 << v29;
              v3 = v31;
              *(_QWORD *)(v9 + 16) = 0;
              break;
            }
            v25 = v32[v26];
            if (!v25)
            {
              while (1)
              {
                v16 = v26 + 1;
                if (__OFADD__(v26, 1))
                  goto LABEL_32;
                if (v16 >= v14)
                  goto LABEL_23;
                v25 = v32[v16];
                ++v26;
                if (v25)
                  goto LABEL_20;
              }
            }
            v16 = v26;
          }
        }
LABEL_20:
        v13 = (v25 - 1) & v25;
        v22 = __clz(__rbit64(v25)) + (v16 << 6);
      }
      v27 = *(_QWORD *)(v9 + 48) + *(_QWORD *)(v6 + 72) * v22;
      if ((a2 & 1) != 0)
      {
        sub_23B92F378(v27, (uint64_t)v8, (uint64_t (*)(_QWORD))type metadata accessor for CorrelationIdentifier);
        v28 = *(_QWORD *)(v9 + 56) + 24 * v22;
        v18 = *(_BYTE *)v28;
        v19 = *(_QWORD *)(v28 + 8);
        v20 = *(_QWORD *)(v28 + 16);
      }
      else
      {
        sub_23B92F2F8(v27, (uint64_t)v8, (uint64_t (*)(_QWORD))type metadata accessor for CorrelationIdentifier);
        v17 = *(_QWORD *)(v9 + 56) + 24 * v22;
        v18 = *(_BYTE *)v17;
        v19 = *(_QWORD *)(v17 + 8);
        v20 = *(_QWORD *)(v17 + 16);
        swift_bridgeObjectRetain();
      }
      result = sub_23B9535BC((uint64_t)v8, v18, v19, v20, v33);
    }
  }
  result = swift_release();
LABEL_30:
  *v3 = v33;
  return result;
}

uint64_t sub_23B9540F0(uint64_t a1, int a2)
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
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  _QWORD *v22;
  unint64_t v23;
  int64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  char v36;
  unint64_t v37;
  BOOL v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t *v42;
  int64_t v43;
  _QWORD *v44;
  uint64_t v45;
  int v46;
  uint64_t v47;

  v3 = v2;
  v5 = type metadata accessor for CorrelationIdentifier();
  v45 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v47 = (uint64_t)&v41 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *v2;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_256A55C30);
  v46 = a2;
  v8 = sub_23B958748();
  v9 = v8;
  if (!*(_QWORD *)(v7 + 16))
    goto LABEL_41;
  v10 = 1 << *(_BYTE *)(v7 + 32);
  v11 = *(_QWORD *)(v7 + 64);
  v44 = (_QWORD *)(v7 + 64);
  if (v10 < 64)
    v12 = ~(-1 << v10);
  else
    v12 = -1;
  v13 = v12 & v11;
  v42 = v2;
  v43 = (unint64_t)(v10 + 63) >> 6;
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
      goto LABEL_22;
    }
    v21 = v16 + 1;
    if (__OFADD__(v16, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v21 >= v43)
      break;
    v22 = v44;
    v23 = v44[v21];
    ++v16;
    if (!v23)
    {
      v16 = v21 + 1;
      if (v21 + 1 >= v43)
        goto LABEL_34;
      v23 = v44[v16];
      if (!v23)
      {
        v24 = v21 + 2;
        if (v24 >= v43)
        {
LABEL_34:
          swift_release();
          v3 = v42;
          if ((v46 & 1) == 0)
            goto LABEL_41;
          goto LABEL_37;
        }
        v23 = v44[v24];
        if (!v23)
        {
          while (1)
          {
            v16 = v24 + 1;
            if (__OFADD__(v24, 1))
              goto LABEL_43;
            if (v16 >= v43)
              goto LABEL_34;
            v23 = v44[v16];
            ++v24;
            if (v23)
              goto LABEL_21;
          }
        }
        v16 = v24;
      }
    }
LABEL_21:
    v13 = (v23 - 1) & v23;
    v20 = __clz(__rbit64(v23)) + (v16 << 6);
LABEL_22:
    v25 = *(_QWORD *)(v7 + 56);
    v26 = v7;
    v27 = *(_QWORD *)(v7 + 48) + 24 * v20;
    v28 = *(_BYTE *)v27;
    v30 = *(_QWORD *)(v27 + 8);
    v29 = *(_QWORD *)(v27 + 16);
    v31 = *(_QWORD *)(v45 + 72);
    v32 = v25 + v31 * v20;
    if ((v46 & 1) != 0)
    {
      sub_23B92F378(v32, v47, (uint64_t (*)(_QWORD))type metadata accessor for CorrelationIdentifier);
    }
    else
    {
      sub_23B92F2F8(v32, v47, (uint64_t (*)(_QWORD))type metadata accessor for CorrelationIdentifier);
      swift_bridgeObjectRetain();
    }
    sub_23B958880();
    sub_23B95888C();
    sub_23B9583F4();
    result = sub_23B9588B0();
    v33 = -1 << *(_BYTE *)(v9 + 32);
    v34 = result & ~v33;
    v35 = v34 >> 6;
    if (((-1 << v34) & ~*(_QWORD *)(v14 + 8 * (v34 >> 6))) != 0)
    {
      v17 = __clz(__rbit64((-1 << v34) & ~*(_QWORD *)(v14 + 8 * (v34 >> 6)))) | v34 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v36 = 0;
      v37 = (unint64_t)(63 - v33) >> 6;
      do
      {
        if (++v35 == v37 && (v36 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        v38 = v35 == v37;
        if (v35 == v37)
          v35 = 0;
        v36 |= v38;
        v39 = *(_QWORD *)(v14 + 8 * v35);
      }
      while (v39 == -1);
      v17 = __clz(__rbit64(~v39)) + (v35 << 6);
    }
    *(_QWORD *)(v14 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    v18 = *(_QWORD *)(v9 + 48) + 24 * v17;
    *(_BYTE *)v18 = v28;
    *(_QWORD *)(v18 + 8) = v30;
    *(_QWORD *)(v18 + 16) = v29;
    result = sub_23B92F378(v47, *(_QWORD *)(v9 + 56) + v31 * v17, (uint64_t (*)(_QWORD))type metadata accessor for CorrelationIdentifier);
    ++*(_QWORD *)(v9 + 16);
    v7 = v26;
  }
  swift_release();
  v3 = v42;
  v22 = v44;
  if ((v46 & 1) == 0)
    goto LABEL_41;
LABEL_37:
  v40 = 1 << *(_BYTE *)(v7 + 32);
  if (v40 >= 64)
    bzero(v22, ((unint64_t)(v40 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v22 = -1 << v40;
  *(_QWORD *)(v7 + 16) = 0;
LABEL_41:
  result = swift_release();
  *v3 = v9;
  return result;
}

uint64_t sub_23B954494(uint64_t a1, char a2, uint64_t *a3, void (*a4)(uint64_t, _BYTE *), void (*a5)(uint64_t, _BYTE *))
{
  uint64_t *v5;
  uint64_t *v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t result;
  int64_t v17;
  unint64_t v18;
  _QWORD *v19;
  unint64_t v20;
  unint64_t v21;
  int64_t v22;
  _QWORD *v23;
  unint64_t v24;
  int64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  char v33;
  unint64_t v34;
  BOOL v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t *v38;
  int64_t v39;
  uint64_t v40;
  char v42;
  _BYTE v43[32];

  v7 = v5;
  v9 = *v5;
  __swift_instantiateConcreteTypeFromMangledName(a3);
  v42 = a2;
  v10 = sub_23B958748();
  v11 = v10;
  if (!*(_QWORD *)(v9 + 16))
    goto LABEL_41;
  v12 = 1 << *(_BYTE *)(v9 + 32);
  v40 = v9 + 64;
  if (v12 < 64)
    v13 = ~(-1 << v12);
  else
    v13 = -1;
  v14 = v13 & *(_QWORD *)(v9 + 64);
  v38 = v5;
  v39 = (unint64_t)(v12 + 63) >> 6;
  v15 = v10 + 64;
  result = swift_retain();
  v17 = 0;
  while (1)
  {
    if (v14)
    {
      v20 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      v21 = v20 | (v17 << 6);
      goto LABEL_22;
    }
    v22 = v17 + 1;
    if (__OFADD__(v17, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v22 >= v39)
      break;
    v23 = (_QWORD *)(v9 + 64);
    v24 = *(_QWORD *)(v40 + 8 * v22);
    ++v17;
    if (!v24)
    {
      v17 = v22 + 1;
      if (v22 + 1 >= v39)
        goto LABEL_34;
      v24 = *(_QWORD *)(v40 + 8 * v17);
      if (!v24)
      {
        v25 = v22 + 2;
        if (v25 >= v39)
        {
LABEL_34:
          swift_release();
          v7 = v38;
          if ((v42 & 1) == 0)
            goto LABEL_41;
          goto LABEL_37;
        }
        v24 = *(_QWORD *)(v40 + 8 * v25);
        if (!v24)
        {
          while (1)
          {
            v17 = v25 + 1;
            if (__OFADD__(v25, 1))
              goto LABEL_43;
            if (v17 >= v39)
              goto LABEL_34;
            v24 = *(_QWORD *)(v40 + 8 * v17);
            ++v25;
            if (v24)
              goto LABEL_21;
          }
        }
        v17 = v25;
      }
    }
LABEL_21:
    v14 = (v24 - 1) & v24;
    v21 = __clz(__rbit64(v24)) + (v17 << 6);
LABEL_22:
    v26 = (uint64_t *)(*(_QWORD *)(v9 + 48) + 16 * v21);
    v28 = *v26;
    v27 = v26[1];
    v29 = *(_QWORD *)(v9 + 56) + 32 * v21;
    if ((v42 & 1) != 0)
    {
      a4(v29, v43);
    }
    else
    {
      a5(v29, v43);
      swift_bridgeObjectRetain();
    }
    sub_23B958880();
    sub_23B9583F4();
    result = sub_23B9588B0();
    v30 = -1 << *(_BYTE *)(v11 + 32);
    v31 = result & ~v30;
    v32 = v31 >> 6;
    if (((-1 << v31) & ~*(_QWORD *)(v15 + 8 * (v31 >> 6))) != 0)
    {
      v18 = __clz(__rbit64((-1 << v31) & ~*(_QWORD *)(v15 + 8 * (v31 >> 6)))) | v31 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v33 = 0;
      v34 = (unint64_t)(63 - v30) >> 6;
      do
      {
        if (++v32 == v34 && (v33 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        v35 = v32 == v34;
        if (v32 == v34)
          v32 = 0;
        v33 |= v35;
        v36 = *(_QWORD *)(v15 + 8 * v32);
      }
      while (v36 == -1);
      v18 = __clz(__rbit64(~v36)) + (v32 << 6);
    }
    *(_QWORD *)(v15 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    v19 = (_QWORD *)(*(_QWORD *)(v11 + 48) + 16 * v18);
    *v19 = v28;
    v19[1] = v27;
    result = ((uint64_t (*)(_BYTE *, unint64_t))a4)(v43, *(_QWORD *)(v11 + 56) + 32 * v18);
    ++*(_QWORD *)(v11 + 16);
  }
  swift_release();
  v7 = v38;
  v23 = (_QWORD *)(v9 + 64);
  if ((v42 & 1) == 0)
    goto LABEL_41;
LABEL_37:
  v37 = 1 << *(_BYTE *)(v9 + 32);
  if (v37 >= 64)
    bzero(v23, ((unint64_t)(v37 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v23 = -1 << v37;
  *(_QWORD *)(v9 + 16) = 0;
LABEL_41:
  result = swift_release();
  *v7 = v11;
  return result;
}

uint64_t sub_23B9547BC(uint64_t a1, int a2)
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
  _OWORD v40[2];

  v3 = v2;
  v5 = sub_23B95870C();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v36 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254309AF8);
  v39 = a2;
  v10 = sub_23B958748();
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
      sub_23B92DA04((_OWORD *)(*(_QWORD *)(v9 + 56) + 32 * v21), v40);
    }
    else
    {
      (*(void (**)(char *, unint64_t, uint64_t))(v6 + 16))(v8, v27, v5);
      sub_23B91B298(*(_QWORD *)(v9 + 56) + 32 * v21, (uint64_t)v40);
    }
    result = sub_23B9583A0();
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
    (*(void (**)(unint64_t, char *, uint64_t))(v6 + 32))(*(_QWORD *)(v11 + 48) + v26 * v19, v8, v5);
    result = (uint64_t)sub_23B92DA04(v40, (_OWORD *)(*(_QWORD *)(v11 + 56) + 32 * v19));
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

void *sub_23B954B40()
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_256A55C48);
  v2 = *v0;
  v3 = sub_23B95873C();
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
    v19 = *(_QWORD *)(v17 + 8);
    v18 = *(_QWORD *)(v17 + 16);
    v20 = 8 * v15;
    v21 = *(_QWORD *)(*(_QWORD *)(v2 + 56) + v20);
    v22 = *(_QWORD *)(v4 + 48) + v16;
    *(_BYTE *)v22 = *(_BYTE *)v17;
    *(_QWORD *)(v22 + 8) = v19;
    *(_QWORD *)(v22 + 16) = v18;
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v20) = v21;
    swift_bridgeObjectRetain();
    result = (void *)swift_bridgeObjectRetain();
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

void *sub_23B954D00()
{
  return sub_23B955434(&qword_256A556B0, (void (*)(unint64_t, _BYTE *))sub_23B91B298, (void (*)(_BYTE *, uint64_t))sub_23B92DA04);
}

void *sub_23B954D1C()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *result;
  unint64_t v9;
  int64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  int64_t v26;

  v1 = sub_23B9582F8();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8]();
  v4 = (char *)&v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256A55C20);
  v24 = v0;
  v5 = *v0;
  v6 = sub_23B95873C();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
  {
LABEL_26:
    result = (void *)swift_release();
    *v24 = v7;
    return result;
  }
  result = (void *)(v6 + 64);
  v9 = (unint64_t)((1 << *(_BYTE *)(v7 + 32)) + 63) >> 6;
  if (v7 != v5 || (unint64_t)result >= v5 + 64 + 8 * v9)
    result = memmove(result, (const void *)(v5 + 64), 8 * v9);
  v25 = v5 + 64;
  v11 = 0;
  *(_QWORD *)(v7 + 16) = *(_QWORD *)(v5 + 16);
  v12 = 1 << *(_BYTE *)(v5 + 32);
  v13 = -1;
  if (v12 < 64)
    v13 = ~(-1 << v12);
  v14 = v13 & *(_QWORD *)(v5 + 64);
  v26 = (unint64_t)(v12 + 63) >> 6;
  while (1)
  {
    if (v14)
    {
      v15 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      v16 = v15 | (v11 << 6);
      goto LABEL_12;
    }
    v20 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v20 >= v26)
      goto LABEL_26;
    v21 = *(_QWORD *)(v25 + 8 * v20);
    ++v11;
    if (!v21)
    {
      v11 = v20 + 1;
      if (v20 + 1 >= v26)
        goto LABEL_26;
      v21 = *(_QWORD *)(v25 + 8 * v11);
      if (!v21)
        break;
    }
LABEL_25:
    v14 = (v21 - 1) & v21;
    v16 = __clz(__rbit64(v21)) + (v11 << 6);
LABEL_12:
    v17 = *(_QWORD *)(v2 + 72) * v16;
    (*(void (**)(char *, unint64_t, uint64_t))(v2 + 16))(v4, *(_QWORD *)(v5 + 48) + v17, v1);
    v18 = 8 * v16;
    v19 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + 8 * v16);
    (*(void (**)(unint64_t, char *, uint64_t))(v2 + 32))(*(_QWORD *)(v7 + 48) + v17, v4, v1);
    *(_QWORD *)(*(_QWORD *)(v7 + 56) + v18) = v19;
    result = (void *)swift_retain();
  }
  v22 = v20 + 2;
  if (v22 >= v26)
    goto LABEL_26;
  v21 = *(_QWORD *)(v25 + 8 * v22);
  if (v21)
  {
    v11 = v22;
    goto LABEL_25;
  }
  while (1)
  {
    v11 = v22 + 1;
    if (__OFADD__(v22, 1))
      break;
    if (v11 >= v26)
      goto LABEL_26;
    v21 = *(_QWORD *)(v25 + 8 * v11);
    ++v22;
    if (v21)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_23B954F4C()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *result;
  unint64_t v8;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  int64_t v26;
  unint64_t v27;
  int64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  int64_t v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;

  v1 = type metadata accessor for CorrelationIdentifier();
  v36 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v35 = (char *)&v31 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256A55C28);
  v32 = v0;
  v3 = *v0;
  v4 = sub_23B95873C();
  v5 = *(_QWORD *)(v3 + 16);
  v38 = v4;
  if (!v5)
  {
    result = (void *)swift_release();
    v30 = v38;
    v29 = v32;
LABEL_28:
    *v29 = v30;
    return result;
  }
  v6 = v4;
  result = (void *)(v4 + 64);
  v8 = (unint64_t)((1 << *(_BYTE *)(v6 + 32)) + 63) >> 6;
  if (v6 != v3 || (unint64_t)result >= v3 + 64 + 8 * v8)
  {
    result = memmove(result, (const void *)(v3 + 64), 8 * v8);
    v6 = v38;
  }
  v33 = v3 + 64;
  v10 = 0;
  *(_QWORD *)(v6 + 16) = *(_QWORD *)(v3 + 16);
  v11 = 1 << *(_BYTE *)(v3 + 32);
  v12 = -1;
  if (v11 < 64)
    v12 = ~(-1 << v11);
  v37 = v3;
  v13 = v12 & *(_QWORD *)(v3 + 64);
  v34 = (unint64_t)(v11 + 63) >> 6;
  v14 = (uint64_t)v35;
  while (1)
  {
    if (v13)
    {
      v15 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      v16 = v15 | (v10 << 6);
      v17 = v37;
      goto LABEL_12;
    }
    v26 = v10 + 1;
    v17 = v37;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v26 >= v34)
      goto LABEL_26;
    v27 = *(_QWORD *)(v33 + 8 * v26);
    ++v10;
    if (!v27)
    {
      v10 = v26 + 1;
      if (v26 + 1 >= v34)
        goto LABEL_26;
      v27 = *(_QWORD *)(v33 + 8 * v10);
      if (!v27)
        break;
    }
LABEL_25:
    v13 = (v27 - 1) & v27;
    v16 = __clz(__rbit64(v27)) + (v10 << 6);
LABEL_12:
    v18 = *(_QWORD *)(v36 + 72) * v16;
    sub_23B92F2F8(*(_QWORD *)(v17 + 48) + v18, v14, (uint64_t (*)(_QWORD))type metadata accessor for CorrelationIdentifier);
    v19 = 24 * v16;
    v20 = *(_QWORD *)(v17 + 56) + 24 * v16;
    v21 = *(_BYTE *)v20;
    v22 = *(_QWORD *)(v20 + 8);
    v23 = *(_QWORD *)(v20 + 16);
    v24 = v38;
    sub_23B92F378(v14, *(_QWORD *)(v38 + 48) + v18, (uint64_t (*)(_QWORD))type metadata accessor for CorrelationIdentifier);
    v25 = *(_QWORD *)(v24 + 56) + v19;
    *(_BYTE *)v25 = v21;
    *(_QWORD *)(v25 + 8) = v22;
    *(_QWORD *)(v25 + 16) = v23;
    result = (void *)swift_bridgeObjectRetain();
  }
  v28 = v26 + 2;
  if (v28 >= v34)
  {
LABEL_26:
    result = (void *)swift_release();
    v29 = v32;
    v30 = v38;
    goto LABEL_28;
  }
  v27 = *(_QWORD *)(v33 + 8 * v28);
  if (v27)
  {
    v10 = v28;
    goto LABEL_25;
  }
  while (1)
  {
    v10 = v28 + 1;
    if (__OFADD__(v28, 1))
      break;
    if (v10 >= v34)
      goto LABEL_26;
    v27 = *(_QWORD *)(v33 + 8 * v10);
    ++v28;
    if (v27)
      goto LABEL_25;
  }
LABEL_30:
  __break(1u);
  return result;
}

void *sub_23B9551CC()
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
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
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

  v1 = type metadata accessor for CorrelationIdentifier();
  v34 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)&v30 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_256A55C30);
  v31 = v0;
  v4 = *v0;
  v5 = sub_23B95873C();
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
  while (1)
  {
    if (v14)
    {
      v15 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      v16 = v15 | (v11 << 6);
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
    v16 = __clz(__rbit64(v26)) + (v11 << 6);
LABEL_12:
    v17 = 24 * v16;
    v18 = *(_QWORD *)(v4 + 48) + 24 * v16;
    v19 = *(_BYTE *)v18;
    v21 = *(_QWORD *)(v18 + 8);
    v20 = *(_QWORD *)(v18 + 16);
    v22 = *(_QWORD *)(v34 + 72) * v16;
    sub_23B92F2F8(*(_QWORD *)(v4 + 56) + v22, (uint64_t)v3, (uint64_t (*)(_QWORD))type metadata accessor for CorrelationIdentifier);
    v23 = v35;
    v24 = *(_QWORD *)(v35 + 48) + v17;
    *(_BYTE *)v24 = v19;
    *(_QWORD *)(v24 + 8) = v21;
    *(_QWORD *)(v24 + 16) = v20;
    sub_23B92F378((uint64_t)v3, *(_QWORD *)(v23 + 56) + v22, (uint64_t (*)(_QWORD))type metadata accessor for CorrelationIdentifier);
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

void *sub_23B955434(uint64_t *a1, void (*a2)(unint64_t, _BYTE *), void (*a3)(_BYTE *, uint64_t))
{
  uint64_t *v3;
  uint64_t *v5;
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
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  int64_t v25;
  unint64_t v26;
  int64_t v27;
  uint64_t *v28;
  uint64_t v29;
  _BYTE v31[32];

  v5 = v3;
  __swift_instantiateConcreteTypeFromMangledName(a1);
  v6 = *v3;
  v7 = sub_23B95873C();
  v8 = v7;
  if (!*(_QWORD *)(v6 + 16))
  {
    result = (void *)swift_release();
LABEL_28:
    *v5 = v8;
    return result;
  }
  v28 = v5;
  result = (void *)(v7 + 64);
  v10 = (unint64_t)((1 << *(_BYTE *)(v8 + 32)) + 63) >> 6;
  if (v8 != v6 || (unint64_t)result >= v6 + 64 + 8 * v10)
    result = memmove(result, (const void *)(v6 + 64), 8 * v10);
  v29 = v6 + 64;
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
    v25 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v25 >= v16)
      goto LABEL_26;
    v26 = *(_QWORD *)(v29 + 8 * v25);
    ++v12;
    if (!v26)
    {
      v12 = v25 + 1;
      if (v25 + 1 >= v16)
        goto LABEL_26;
      v26 = *(_QWORD *)(v29 + 8 * v12);
      if (!v26)
        break;
    }
LABEL_25:
    v15 = (v26 - 1) & v26;
    v18 = __clz(__rbit64(v26)) + (v12 << 6);
LABEL_12:
    v19 = 16 * v18;
    v20 = (uint64_t *)(*(_QWORD *)(v6 + 48) + 16 * v18);
    v21 = *v20;
    v22 = v20[1];
    v23 = 32 * v18;
    a2(*(_QWORD *)(v6 + 56) + 32 * v18, v31);
    v24 = (_QWORD *)(*(_QWORD *)(v8 + 48) + v19);
    *v24 = v21;
    v24[1] = v22;
    a3(v31, *(_QWORD *)(v8 + 56) + v23);
    result = (void *)swift_bridgeObjectRetain();
  }
  v27 = v25 + 2;
  if (v27 >= v16)
  {
LABEL_26:
    result = (void *)swift_release();
    v5 = v28;
    goto LABEL_28;
  }
  v26 = *(_QWORD *)(v29 + 8 * v27);
  if (v26)
  {
    v12 = v27;
    goto LABEL_25;
  }
  while (1)
  {
    v12 = v27 + 1;
    if (__OFADD__(v27, 1))
      break;
    if (v12 >= v16)
      goto LABEL_26;
    v26 = *(_QWORD *)(v29 + 8 * v12);
    ++v27;
    if (v26)
      goto LABEL_25;
  }
LABEL_30:
  __break(1u);
  return result;
}

void *sub_23B955624()
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
  int64_t v21;
  unint64_t v22;
  int64_t v23;
  uint64_t *v24;
  uint64_t v25;
  _OWORD v26[2];

  v1 = v0;
  v2 = sub_23B95870C();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_254309AF8);
  v6 = *v0;
  v7 = sub_23B95873C();
  v8 = v7;
  if (!*(_QWORD *)(v6 + 16))
  {
    result = (void *)swift_release();
LABEL_28:
    *v1 = v8;
    return result;
  }
  v24 = v1;
  result = (void *)(v7 + 64);
  v10 = (unint64_t)((1 << *(_BYTE *)(v8 + 32)) + 63) >> 6;
  if (v8 != v6 || (unint64_t)result >= v6 + 64 + 8 * v10)
    result = memmove(result, (const void *)(v6 + 64), 8 * v10);
  v25 = v6 + 64;
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
    v21 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v21 >= v16)
      goto LABEL_26;
    v22 = *(_QWORD *)(v25 + 8 * v21);
    ++v12;
    if (!v22)
    {
      v12 = v21 + 1;
      if (v21 + 1 >= v16)
        goto LABEL_26;
      v22 = *(_QWORD *)(v25 + 8 * v12);
      if (!v22)
        break;
    }
LABEL_25:
    v15 = (v22 - 1) & v22;
    v18 = __clz(__rbit64(v22)) + (v12 << 6);
LABEL_12:
    v19 = *(_QWORD *)(v3 + 72) * v18;
    (*(void (**)(char *, unint64_t, uint64_t))(v3 + 16))(v5, *(_QWORD *)(v6 + 48) + v19, v2);
    v20 = 32 * v18;
    sub_23B91B298(*(_QWORD *)(v6 + 56) + v20, (uint64_t)v26);
    (*(void (**)(unint64_t, char *, uint64_t))(v3 + 32))(*(_QWORD *)(v8 + 48) + v19, v5, v2);
    result = sub_23B92DA04(v26, (_OWORD *)(*(_QWORD *)(v8 + 56) + v20));
  }
  v23 = v21 + 2;
  if (v23 >= v16)
  {
LABEL_26:
    result = (void *)swift_release();
    v1 = v24;
    goto LABEL_28;
  }
  v22 = *(_QWORD *)(v25 + 8 * v23);
  if (v22)
  {
    v12 = v23;
    goto LABEL_25;
  }
  while (1)
  {
    v12 = v23 + 1;
    if (__OFADD__(v23, 1))
      break;
    if (v12 >= v16)
      goto LABEL_26;
    v22 = *(_QWORD *)(v25 + 8 * v12);
    ++v23;
    if (v22)
      goto LABEL_25;
  }
LABEL_30:
  __break(1u);
  return result;
}

void sub_23B955860(uint64_t a1, char a2, _QWORD *a3)
{
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  char v10;
  unint64_t v11;
  uint64_t v12;
  _BOOL8 v13;
  uint64_t v14;
  char v15;
  unint64_t v16;
  char v17;
  void *v18;
  id v19;
  _QWORD *v20;
  uint64_t *v21;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD *v29;
  unint64_t v30;
  char v31;
  uint64_t v32;
  _BOOL8 v33;
  uint64_t v34;
  char v35;
  char v36;
  _QWORD *v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;
  _OWORD v41[2];
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  _OWORD v46[2];
  id v47;

  v4 = *(_QWORD *)(a1 + 16);
  if (!v4)
  {
    swift_bridgeObjectRelease();
    return;
  }
  swift_bridgeObjectRetain();
  sub_23B9307CC(a1 + 32, (uint64_t)&v44, &qword_256A55580);
  v7 = v44;
  v8 = v45;
  v42 = v44;
  v43 = v45;
  sub_23B92DA04(v46, v41);
  v9 = (_QWORD *)*a3;
  v11 = sub_23B93358C(v7, v8);
  v12 = v9[2];
  v13 = (v10 & 1) == 0;
  v14 = v12 + v13;
  if (__OFADD__(v12, v13))
    goto LABEL_23;
  v15 = v10;
  if (v9[3] >= v14)
  {
    if ((a2 & 1) != 0)
    {
      if ((v10 & 1) != 0)
        goto LABEL_10;
    }
    else
    {
      sub_23B955434(&qword_256A55BD0, (void (*)(unint64_t, _BYTE *))sub_23B91B298, (void (*)(_BYTE *, uint64_t))sub_23B92DA04);
      if ((v15 & 1) != 0)
        goto LABEL_10;
    }
LABEL_13:
    v20 = (_QWORD *)*a3;
    *(_QWORD *)(*a3 + 8 * (v11 >> 6) + 64) |= 1 << v11;
    v21 = (uint64_t *)(v20[6] + 16 * v11);
    *v21 = v7;
    v21[1] = v8;
    sub_23B92DA04(v41, (_OWORD *)(v20[7] + 32 * v11));
    v22 = v20[2];
    v23 = __OFADD__(v22, 1);
    v24 = v22 + 1;
    if (v23)
    {
LABEL_24:
      __break(1u);
      goto LABEL_25;
    }
    v20[2] = v24;
    v25 = v4 - 1;
    if (!v25)
    {
LABEL_22:
      swift_bridgeObjectRelease_n();
      return;
    }
    v26 = a1 + 80;
    while (1)
    {
      sub_23B9307CC(v26, (uint64_t)&v44, &qword_256A55580);
      v28 = v44;
      v27 = v45;
      v42 = v44;
      v43 = v45;
      sub_23B92DA04(v46, v41);
      v29 = (_QWORD *)*a3;
      v30 = sub_23B93358C(v28, v27);
      v32 = v29[2];
      v33 = (v31 & 1) == 0;
      v23 = __OFADD__(v32, v33);
      v34 = v32 + v33;
      if (v23)
        break;
      v35 = v31;
      if (v29[3] < v34)
      {
        sub_23B954494(v34, 1, &qword_256A55BD0, (void (*)(uint64_t, _BYTE *))sub_23B92DA04, (void (*)(uint64_t, _BYTE *))sub_23B91B298);
        v30 = sub_23B93358C(v28, v27);
        if ((v35 & 1) != (v36 & 1))
          goto LABEL_25;
      }
      if ((v35 & 1) != 0)
        goto LABEL_10;
      v37 = (_QWORD *)*a3;
      *(_QWORD *)(*a3 + 8 * (v30 >> 6) + 64) |= 1 << v30;
      v38 = (uint64_t *)(v37[6] + 16 * v30);
      *v38 = v28;
      v38[1] = v27;
      sub_23B92DA04(v41, (_OWORD *)(v37[7] + 32 * v30));
      v39 = v37[2];
      v23 = __OFADD__(v39, 1);
      v40 = v39 + 1;
      if (v23)
        goto LABEL_24;
      v37[2] = v40;
      v26 += 48;
      if (!--v25)
        goto LABEL_22;
    }
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  sub_23B954494(v14, a2 & 1, &qword_256A55BD0, (void (*)(uint64_t, _BYTE *))sub_23B92DA04, (void (*)(uint64_t, _BYTE *))sub_23B91B298);
  v16 = sub_23B93358C(v7, v8);
  if ((v15 & 1) == (v17 & 1))
  {
    v11 = v16;
    if ((v15 & 1) == 0)
      goto LABEL_13;
LABEL_10:
    v18 = (void *)swift_allocError();
    swift_willThrow();
    v47 = v18;
    v19 = v18;
    __swift_instantiateConcreteTypeFromMangledName(&qword_254309C90);
    if ((swift_dynamicCast() & 1) == 0)
    {
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v41);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();

      return;
    }
    goto LABEL_26;
  }
LABEL_25:
  sub_23B958844();
  __break(1u);
LABEL_26:
  sub_23B958688();
  sub_23B958400();
  sub_23B9586F4();
  sub_23B958400();
  sub_23B958724();
  __break(1u);
}

void sub_23B955C74(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
  void *v4;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  char v11;
  uint64_t v12;
  id v13;
  char v14;
  id v15;
  void *v16;

  v6 = a1;
  if ((a4 & 0xC000000000000001) == 0)
  {
    if ((a3 & 1) != 0)
      goto LABEL_13;
    if (a1 < 0 || 1 << *(_BYTE *)(a4 + 32) <= a1)
    {
      __break(1u);
    }
    else if (((*(_QWORD *)(a4 + (((unint64_t)a1 >> 3) & 0xFFFFFFFFFFFFF8) + 56) >> a1) & 1) != 0)
    {
      if (*(_DWORD *)(a4 + 36) == (_DWORD)a2)
        goto LABEL_20;
      __break(1u);
LABEL_13:
      if (sub_23B958604() == *(_DWORD *)(a4 + 36))
      {
        sub_23B958610();
        sub_23B92D0DC(0, &qword_256A55B98);
        swift_unknownObjectRetain();
        swift_dynamicCast();
        v4 = v16;
        swift_unknownObjectRelease();
        v8 = sub_23B958580();
        v9 = -1 << *(_BYTE *)(a4 + 32);
        v6 = v8 & ~v9;
        if (((*(_QWORD *)(a4 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0)
        {
          v10 = *(id *)(*(_QWORD *)(a4 + 48) + 8 * v6);
          v11 = sub_23B95858C();

          if ((v11 & 1) == 0)
          {
            v12 = ~v9;
            do
            {
              v6 = (v6 + 1) & v12;
              if (((*(_QWORD *)(a4 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
                goto LABEL_24;
              v13 = *(id *)(*(_QWORD *)(a4 + 48) + 8 * v6);
              v14 = sub_23B95858C();

            }
            while ((v14 & 1) == 0);
          }

LABEL_20:
          v15 = *(id *)(*(_QWORD *)(a4 + 48) + 8 * v6);
          return;
        }
LABEL_24:

        __break(1u);
        goto LABEL_25;
      }
LABEL_23:
      __break(1u);
      goto LABEL_24;
    }
    __break(1u);
    goto LABEL_23;
  }
  if ((a3 & 1) == 0)
  {
LABEL_25:
    __break(1u);
    return;
  }
  if (a4 < 0)
    v7 = a4;
  else
    v7 = a4 & 0xFFFFFFFFFFFFFF8;
  MEMORY[0x242609144](a1, a2, v7);
  sub_23B92D0DC(0, &qword_256A55B98);
  swift_unknownObjectRetain();
  swift_dynamicCast();
  swift_unknownObjectRelease();
}

uint64_t sub_23B955EDC(uint64_t a1)
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

  v1 = *(_QWORD *)(a1 + 56);
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
  v1 = *(_QWORD *)(a1 + 64);
  if (v1)
  {
    v2 = 64;
    return __clz(__rbit64(v1)) + v2;
  }
  v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 2)
    v7 = 2;
  v8 = v7 - 2;
  v9 = (unint64_t *)(a1 + 72);
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

id sub_23B955F64(int a1, Class a2, uint64_t a3, uint64_t a4)
{
  char *v6;
  objc_super v8;

  v6 = (char *)objc_allocWithZone(a2);
  *(_QWORD *)&v6[OBJC_IVAR____TtC15FindMyMessaging27MessagingDelegateTrampoline_delegate + 8] = 0;
  *(_QWORD *)(swift_unknownObjectWeakInit() + 8) = a4;
  swift_unknownObjectWeakAssign();
  v8.receiver = v6;
  v8.super_class = a2;
  return objc_msgSendSuper2(&v8, sel_init);
}

uint64_t sub_23B955FDC()
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_23B956018(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;

  v4 = v1[2];
  v5 = v1[3];
  v6 = v1[4];
  v7 = v1[5];
  v8 = v1[6];
  v9 = v1[7];
  v10 = v1[8];
  v11 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v11;
  *v11 = v2;
  v11[1] = sub_23B930844;
  return sub_23B952604(a1, v4, v5, v6, v7, v8, v9, v10);
}

uint64_t sub_23B9560AC(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(MEMORY[0x24BEE23D0] - 8) + 8))();
  return a1;
}

uint64_t sub_23B9560E0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = sub_23B9582F8();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 72) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();

  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_23B95618C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;

  v2 = *(_QWORD *)(sub_23B9582F8() - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 72) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = *(_QWORD *)(v0 + 48);
  v5 = v0 + v3;
  v6 = (uint64_t *)(v0 + ((*(_QWORD *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8));
  v7 = *v6;
  v8 = v6[1];
  v9 = swift_task_alloc();
  v10 = *(_OWORD *)(v0 + 32);
  v11 = *(_OWORD *)(v0 + 56);
  *(_QWORD *)(v1 + 16) = v9;
  *(_QWORD *)v9 = v1;
  *(_QWORD *)(v9 + 8) = sub_23B930844;
  *(_QWORD *)(v9 + 128) = v7;
  *(_QWORD *)(v9 + 136) = v8;
  *(_QWORD *)(v9 + 120) = v5;
  *(_OWORD *)(v9 + 104) = v11;
  *(_QWORD *)(v9 + 96) = v4;
  *(_OWORD *)(v9 + 80) = v10;
  return swift_task_switch();
}

uint64_t sub_23B956248()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;

  v1 = sub_23B9582F8();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 72) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = ((v3 + *(_QWORD *)(v2 + 64)) & 0xFFFFFFFFFFFFFFF8) + v0;
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();

  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  return swift_deallocObject();
}

uint64_t sub_23B9562F0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;

  v2 = *(_QWORD *)(sub_23B9582F8() - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 72) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = v3 + *(_QWORD *)(v2 + 64);
  v5 = *(_QWORD *)(v0 + 48);
  v6 = v0 + v3;
  v7 = *(_BYTE *)(v0 + v4);
  v8 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + v0 + 8);
  v9 = swift_task_alloc();
  v10 = *(_OWORD *)(v0 + 32);
  v11 = *(_OWORD *)(v0 + 56);
  *(_QWORD *)(v1 + 16) = v9;
  *(_QWORD *)v9 = v1;
  *(_QWORD *)(v9 + 8) = sub_23B930844;
  *(_BYTE *)(v9 + 96) = v7;
  *(_QWORD *)(v9 + 72) = v6;
  *(_QWORD *)(v9 + 80) = v8;
  *(_OWORD *)(v9 + 56) = v11;
  *(_QWORD *)(v9 + 48) = v5;
  *(_OWORD *)(v9 + 32) = v10;
  return swift_task_switch();
}

uint64_t sub_23B9563AC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  void (*v8)(uint64_t, uint64_t);
  uint64_t v9;
  uint64_t v10;

  v1 = type metadata accessor for MessageContext();
  v2 = *(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80);
  v3 = (v2 + 96) & ~v2;
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v4 = v0 + v3;
  v5 = sub_23B9582F8();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v0 + v3, 1, v5);
  v8 = *(void (**)(uint64_t, uint64_t))(v6 + 8);
  if (!v7)
    v8(v0 + v3, v5);
  v8(v4 + *(int *)(v1 + 20), v5);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v9 = v4 + *(int *)(v1 + 44);
  v10 = sub_23B9582B0();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 8))(v9, v10);
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_23B9564F0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v10;

  v2 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for MessageContext() - 8) + 80);
  v3 = *(_QWORD *)(v0 + 48);
  v10 = *(_OWORD *)(v0 + 72);
  v4 = *(_QWORD *)(v0 + 88);
  v5 = v0 + ((v2 + 96) & ~v2);
  v6 = swift_task_alloc();
  v7 = *(_OWORD *)(v0 + 32);
  v8 = *(_OWORD *)(v0 + 56);
  *(_QWORD *)(v1 + 16) = v6;
  *(_QWORD *)v6 = v1;
  *(_QWORD *)(v6 + 8) = sub_23B930844;
  *(_QWORD *)(v6 + 136) = v4;
  *(_QWORD *)(v6 + 144) = v5;
  *(_OWORD *)(v6 + 120) = v10;
  *(_OWORD *)(v6 + 104) = v8;
  *(_QWORD *)(v6 + 96) = v3;
  *(_OWORD *)(v6 + 80) = v7;
  return swift_task_switch();
}

uint64_t sub_23B9565A4(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for MessageContext();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t *__swift_allocate_boxed_opaque_existential_0(uint64_t *a1)
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

uint64_t sub_23B95661C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  void (*v11)(unint64_t, uint64_t);
  uint64_t v12;
  uint64_t v13;

  v1 = sub_23B95825C();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 72) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = (((*(_QWORD *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8;
  v5 = type metadata accessor for MessageContext();
  v6 = (*(unsigned __int8 *)(*(_QWORD *)(v5 - 8) + 80) + v4 + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v5 - 8) + 80);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();

  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v7 = v0 + v6;
  v8 = sub_23B9582F8();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v9 + 48))(v0 + v6, 1, v8);
  v11 = *(void (**)(unint64_t, uint64_t))(v9 + 8);
  if (!v10)
    v11(v0 + v6, v8);
  v11(v7 + *(int *)(v5 + 20), v8);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v12 = v7 + *(int *)(v5 + 44);
  v13 = sub_23B9582B0();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 8))(v12, v13);
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_23B9567C8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;

  v2 = *(_QWORD *)(sub_23B95825C() - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 72) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = (*(_QWORD *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  v5 = (v4 + 15) & 0xFFFFFFFFFFFFFFF8;
  v6 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for MessageContext() - 8) + 80);
  v7 = (v6 + v5 + 16) & ~v6;
  v8 = *(_QWORD *)(v0 + 48);
  v9 = *(_QWORD *)(v0 + v4);
  v10 = v0 + v5;
  v11 = *(_QWORD *)(v0 + v5);
  v12 = *(_QWORD *)(v10 + 8);
  v13 = v0 + v7;
  v14 = swift_task_alloc();
  v15 = *(_OWORD *)(v0 + 32);
  v16 = *(_OWORD *)(v0 + 56);
  *(_QWORD *)(v1 + 16) = v14;
  *(_QWORD *)v14 = v1;
  *(_QWORD *)(v14 + 8) = sub_23B930844;
  *(_QWORD *)(v14 + 144) = v12;
  *(_QWORD *)(v14 + 152) = v13;
  *(_QWORD *)(v14 + 128) = v9;
  *(_QWORD *)(v14 + 136) = v11;
  *(_QWORD *)(v14 + 120) = v0 + v3;
  *(_OWORD *)(v14 + 104) = v16;
  *(_QWORD *)(v14 + 96) = v8;
  *(_OWORD *)(v14 + 80) = v15;
  return swift_task_switch();
}

uint64_t sub_23B9568BC(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_23B92D4DC(a1, a2);
  return a1;
}

uint64_t sub_23B9568D0(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_23B9304B0(a1, a2);
  return a1;
}

uint64_t sub_23B9568E4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  void (*v8)(uint64_t, uint64_t);
  uint64_t v9;
  uint64_t v10;

  v1 = type metadata accessor for MessageContext();
  v2 = *(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80);
  v3 = (v2 + 112) & ~v2;
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();

  sub_23B92D4DC(*(_QWORD *)(v0 + 72), *(_QWORD *)(v0 + 80));
  swift_bridgeObjectRelease();
  v4 = v0 + v3;
  v5 = sub_23B9582F8();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v0 + v3, 1, v5);
  v8 = *(void (**)(uint64_t, uint64_t))(v6 + 8);
  if (!v7)
    v8(v0 + v3, v5);
  v8(v4 + *(int *)(v1 + 20), v5);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v9 = v4 + *(int *)(v1 + 44);
  v10 = sub_23B9582B0();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 8))(v9, v10);
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_23B956A28()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v12;

  v2 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for MessageContext() - 8) + 80);
  v3 = *(_QWORD *)(v0 + 48);
  v12 = *(_OWORD *)(v0 + 72);
  v4 = *(_BYTE *)(v0 + 88);
  v5 = *(_QWORD *)(v0 + 96);
  v6 = *(_QWORD *)(v0 + 104);
  v7 = v0 + ((v2 + 112) & ~v2);
  v8 = swift_task_alloc();
  v9 = *(_OWORD *)(v0 + 32);
  v10 = *(_OWORD *)(v0 + 56);
  *(_QWORD *)(v1 + 16) = v8;
  *(_QWORD *)v8 = v1;
  *(_QWORD *)(v8 + 8) = sub_23B930844;
  *(_QWORD *)(v8 + 120) = v6;
  *(_QWORD *)(v8 + 128) = v7;
  *(_QWORD *)(v8 + 112) = v5;
  *(_BYTE *)(v8 + 152) = v4;
  *(_OWORD *)(v8 + 80) = v10;
  *(_OWORD *)(v8 + 96) = v12;
  *(_QWORD *)(v8 + 72) = v3;
  *(_OWORD *)(v8 + 56) = v9;
  return swift_task_switch();
}

uint64_t sub_23B956AEC(uint64_t a1)
{
  swift_unknownObjectWeakDestroy();
  return a1;
}

unint64_t sub_23B956B10()
{
  unint64_t result;
  uint64_t v1;

  result = qword_254309B00;
  if (!qword_254309B00)
  {
    v1 = sub_23B9582F8();
    result = MEMORY[0x2426097B0](MEMORY[0x24BDCEA88], v1);
    atomic_store(result, (unint64_t *)&qword_254309B00);
  }
  return result;
}

uint64_t objectdestroyTm()
{
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_23B956B98()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  __int128 v4;
  __int128 v6;

  v6 = *(_OWORD *)(v0 + 48);
  v2 = *(_QWORD *)(v0 + 64);
  v3 = swift_task_alloc();
  v4 = *(_OWORD *)(v0 + 32);
  *(_QWORD *)(v1 + 16) = v3;
  *(_QWORD *)v3 = v1;
  *(_QWORD *)(v3 + 8) = sub_23B92F9BC;
  *(_QWORD *)(v3 + 1168) = v2;
  *(_OWORD *)(v3 + 1152) = v6;
  *(_OWORD *)(v3 + 1136) = v4;
  return swift_task_switch();
}

void sub_23B956C18(void *a1@<X0>, uint64_t a2@<X8>)
{
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  id v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  id v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  unsigned __int8 v47;
  unsigned __int8 v48;
  unsigned __int8 v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  unsigned __int8 v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;

  v4 = objc_msgSend(a1, sel_uniqueID);
  if (v4)
  {

    v5 = objc_msgSend(a1, sel_uniqueIDOverride);
    if (v5)
    {

      v6 = objc_msgSend(a1, sel_modelIdentifier);
      if (v6)
      {

        v7 = objc_msgSend(a1, sel_productName);
        if (v7)
        {

          v8 = objc_msgSend(a1, sel_productVersion);
          if (v8)
          {

            v9 = objc_msgSend(a1, sel_productBuildVersion);
            if (v9)
            {

              v10 = objc_msgSend(a1, sel_name);
              if (v10)
              {

                v11 = objc_msgSend(a1, sel_service);
                if (v11)
                {

                  v12 = objc_msgSend(a1, sel_uniqueID);
                  if (v12)
                  {
                    v13 = v12;
                    v71 = sub_23B9583DC();
                    v70 = v14;

                  }
                  else
                  {
                    v71 = 0;
                    v70 = 0;
                  }
                  v19 = objc_msgSend(a1, sel_uniqueIDOverride);
                  if (v19)
                  {
                    v20 = v19;
                    v21 = sub_23B9583DC();
                    v69 = v22;

                    v23 = objc_msgSend(a1, sel_modelIdentifier);
                    if (v23)
                    {
                      v24 = v23;
                      v25 = sub_23B9583DC();
                      v68 = v26;

                      v27 = objc_msgSend(a1, sel_productName);
                      if (v27)
                      {
                        v28 = v27;
                        v29 = sub_23B9583DC();
                        v67 = v30;

                        v31 = objc_msgSend(a1, sel_productVersion);
                        if (v31)
                        {
                          v32 = v31;
                          v33 = sub_23B9583DC();
                          v66 = v34;

                          v35 = objc_msgSend(a1, sel_productBuildVersion);
                          if (v35)
                          {
                            v36 = v35;
                            v37 = sub_23B9583DC();
                            v65 = v38;

                            v39 = objc_msgSend(a1, sel_name);
                            if (v39)
                            {
                              v40 = v39;
                              v62 = v29;
                              v63 = v25;
                              v64 = v21;
                              v41 = sub_23B9583DC();
                              v60 = v42;
                              v61 = v41;

                              v43 = objc_msgSend(a1, sel_service);
                              if (v43)
                              {
                                v44 = v43;
                                v58 = v37;
                                v59 = v33;
                                v45 = sub_23B9583DC();
                                v56 = v46;
                                v57 = v45;

                                v55 = objc_msgSend(a1, sel_isLocallyPaired);
                                v47 = objc_msgSend(a1, sel_isActive);
                                v48 = objc_msgSend(a1, sel_isNearby);
                                v49 = objc_msgSend(a1, sel_isConnected);
                                v50 = IDSCopyIDForDevice();
                                if (v50)
                                {
                                  v51 = (void *)v50;
                                  v52 = sub_23B9583DC();
                                  v54 = v53;

                                  *(_QWORD *)a2 = v71;
                                  *(_QWORD *)(a2 + 8) = v70;
                                  *(_QWORD *)(a2 + 16) = v64;
                                  *(_QWORD *)(a2 + 24) = v69;
                                  *(_QWORD *)(a2 + 32) = v63;
                                  *(_QWORD *)(a2 + 40) = v68;
                                  *(_QWORD *)(a2 + 48) = v62;
                                  *(_QWORD *)(a2 + 56) = v67;
                                  *(_QWORD *)(a2 + 64) = v59;
                                  *(_QWORD *)(a2 + 72) = v66;
                                  *(_QWORD *)(a2 + 80) = v58;
                                  *(_QWORD *)(a2 + 88) = v65;
                                  *(_QWORD *)(a2 + 96) = v61;
                                  *(_QWORD *)(a2 + 104) = v60;
                                  *(_QWORD *)(a2 + 112) = v57;
                                  *(_QWORD *)(a2 + 120) = v56;
                                  *(_BYTE *)(a2 + 128) = v55;
                                  *(_BYTE *)(a2 + 129) = v47;
                                  *(_BYTE *)(a2 + 130) = v48;
                                  *(_BYTE *)(a2 + 131) = v49;
                                  *(_BYTE *)(a2 + 136) = 4;
                                  *(_QWORD *)(a2 + 144) = v52;
                                  *(_QWORD *)(a2 + 152) = v54;
                                  return;
                                }
                                goto LABEL_33;
                              }
LABEL_32:
                              __break(1u);
LABEL_33:
                              __break(1u);
                              return;
                            }
LABEL_31:
                            __break(1u);
                            goto LABEL_32;
                          }
LABEL_30:
                          __break(1u);
                          goto LABEL_31;
                        }
LABEL_29:
                        __break(1u);
                        goto LABEL_30;
                      }
LABEL_28:
                      __break(1u);
                      goto LABEL_29;
                    }
                  }
                  else
                  {
                    __break(1u);
                  }
                  __break(1u);
                  goto LABEL_28;
                }
              }
            }
          }
        }
      }
    }
  }
  if (qword_256A55448 != -1)
    swift_once();
  v15 = sub_23B95831C();
  __swift_project_value_buffer(v15, (uint64_t)qword_256A55CF0);
  v16 = sub_23B958304();
  v17 = sub_23B958550();
  if (os_log_type_enabled(v16, v17))
  {
    v18 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v18 = 0;
    _os_log_impl(&dword_23B916000, v16, v17, "Some IDSDevice Properties are found nil", v18, 2u);
    MEMORY[0x242609864](v18, -1, -1);
  }

  sub_23B9580A8();
  swift_allocError();
  swift_willThrow();

}

uint64_t static DeviceError.== infix(_:_:)()
{
  return 1;
}

uint64_t DeviceError.hash(into:)()
{
  return sub_23B95888C();
}

uint64_t DeviceError.hashValue.getter()
{
  sub_23B958880();
  sub_23B95888C();
  return sub_23B9588B0();
}

uint64_t sub_23B957138()
{
  sub_23B958880();
  sub_23B95888C();
  return sub_23B9588B0();
}

uint64_t sub_23B957178()
{
  return sub_23B95888C();
}

uint64_t sub_23B95719C()
{
  sub_23B958880();
  sub_23B95888C();
  return sub_23B9588B0();
}

uint64_t Device.uniqueID.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t Device.uniqueIDOverride.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t Device.modelIdentifier.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 32);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t Device.productName.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 48);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t Device.productVersion.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 64);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t Device.productBuildVersion.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 80);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t Device.name.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 96);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t Device.service.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 112);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t Device.isLocallyPaired.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 128);
}

uint64_t Device.isActive.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 129);
}

uint64_t Device.isNearby.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 130);
}

uint64_t Device.isConnected.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 131);
}

uint64_t Device.destination.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *(_QWORD *)(v1 + 144);
  v2 = *(_QWORD *)(v1 + 152);
  *(_BYTE *)a1 = *(_BYTE *)(v1 + 136);
  *(_QWORD *)(a1 + 8) = v3;
  *(_QWORD *)(a1 + 16) = v2;
  return swift_bridgeObjectRetain();
}

uint64_t Device.hash(into:)()
{
  uint64_t v0;

  if (*(_QWORD *)(v0 + 8))
  {
    sub_23B958898();
    swift_bridgeObjectRetain();
    sub_23B9583F4();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_23B958898();
  }
  swift_bridgeObjectRetain();
  sub_23B9583F4();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_23B9583F4();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_23B9583F4();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_23B9583F4();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_23B9583F4();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_23B9583F4();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_23B9583F4();
  swift_bridgeObjectRelease();
  sub_23B958898();
  sub_23B958898();
  sub_23B958898();
  sub_23B958898();
  sub_23B95888C();
  swift_bridgeObjectRetain();
  sub_23B9583F4();
  return swift_bridgeObjectRelease();
}

uint64_t Device.hashValue.getter()
{
  sub_23B958880();
  Device.hash(into:)();
  return sub_23B9588B0();
}

uint64_t sub_23B9575F0()
{
  sub_23B958880();
  Device.hash(into:)();
  return sub_23B9588B0();
}

uint64_t sub_23B957630()
{
  sub_23B958880();
  Device.hash(into:)();
  return sub_23B9588B0();
}

uint64_t Device.description.getter()
{
  sub_23B957AC0();
  sub_23B9587D8();
  sub_23B958400();
  swift_bridgeObjectRelease();
  sub_23B958400();
  swift_bridgeObjectRetain();
  sub_23B958400();
  swift_bridgeObjectRelease();
  sub_23B958400();
  return 60;
}

BOOL _s15FindMyMessaging6DeviceV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
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
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  _BOOL8 result;
  char v17;
  char v18;
  char v19;
  char v20;
  char v21;
  char v22;
  int v23;
  char v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  int v29;
  int v30;
  int v31;
  int v32;
  int v33;
  uint64_t v34;
  uint64_t v35;
  int v36;
  int v37;
  int v38;
  int v39;
  int v40;
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
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;

  v3 = *(_QWORD *)(a1 + 8);
  v4 = *(_QWORD *)(a1 + 16);
  v6 = *(_QWORD *)(a1 + 24);
  v5 = *(_QWORD *)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  v55 = *(_QWORD *)(a1 + 56);
  v56 = *(_QWORD *)(a1 + 48);
  v54 = *(_QWORD *)(a1 + 64);
  v52 = *(_QWORD *)(a1 + 72);
  v50 = *(_QWORD *)(a1 + 80);
  v48 = *(_QWORD *)(a1 + 88);
  v46 = *(_QWORD *)(a1 + 96);
  v44 = *(_QWORD *)(a1 + 104);
  v8 = *(_QWORD *)(a2 + 8);
  v9 = *(_QWORD *)(a2 + 16);
  v10 = *(_QWORD *)(a2 + 24);
  v11 = *(_QWORD *)(a2 + 32);
  v13 = *(_QWORD *)(a2 + 40);
  v12 = *(_QWORD *)(a2 + 48);
  v14 = *(_QWORD *)(a2 + 56);
  v53 = *(_QWORD *)(a2 + 64);
  v51 = *(_QWORD *)(a2 + 72);
  v49 = *(_QWORD *)(a2 + 80);
  v47 = *(_QWORD *)(a2 + 88);
  v45 = *(_QWORD *)(a2 + 96);
  v42 = *(_QWORD *)(a2 + 112);
  v43 = *(_QWORD *)(a2 + 104);
  v41 = *(_QWORD *)(a2 + 120);
  v40 = *(unsigned __int8 *)(a2 + 130);
  if (!v3)
  {
    v32 = *(unsigned __int8 *)(a1 + 131);
    v33 = *(unsigned __int8 *)(a1 + 130);
    v36 = *(unsigned __int8 *)(a2 + 128);
    v37 = *(unsigned __int8 *)(a2 + 129);
    v30 = *(unsigned __int8 *)(a1 + 136);
    v31 = *(unsigned __int8 *)(a2 + 131);
    v34 = *(_QWORD *)(a1 + 120);
    v35 = *(_QWORD *)(a1 + 112);
    v29 = *(unsigned __int8 *)(a2 + 136);
    v38 = *(unsigned __int8 *)(a1 + 128);
    v39 = *(unsigned __int8 *)(a1 + 129);
    v25 = *(_QWORD *)(a2 + 152);
    v26 = *(_QWORD *)(a2 + 144);
    v27 = *(_QWORD *)(a1 + 152);
    v28 = *(_QWORD *)(a1 + 144);
    if (v8)
      return 0;
LABEL_10:
    if (v4 == v9 && v6 == v10 || (v17 = sub_23B958820(), result = 0, (v17 & 1) != 0))
    {
      if (v5 == v11 && v7 == v13 || (v18 = sub_23B958820(), result = 0, (v18 & 1) != 0))
      {
        if (v56 == v12 && v55 == v14 || (v19 = sub_23B958820(), result = 0, (v19 & 1) != 0))
        {
          if (v54 == v53 && v52 == v51 || (v20 = sub_23B958820(), result = 0, (v20 & 1) != 0))
          {
            if (v50 == v49 && v48 == v47 || (v21 = sub_23B958820(), result = 0, (v21 & 1) != 0))
            {
              if (v46 == v45 && v44 == v43 || (v22 = sub_23B958820(), result = 0, (v22 & 1) != 0))
              {
                v23 = v33 ^ v40;
                if (v35 == v42 && v34 == v41)
                {
                  result = 0;
                  if (((v38 ^ v36 | v39 ^ v37 | v23) & 1) != 0)
                    return result;
                }
                else
                {
                  v24 = sub_23B958820();
                  result = 0;
                  if ((v38 ^ v36) & 1 | ((v24 & 1) == 0) | (v39 ^ v37 | v23) & 1)
                    return result;
                }
                if (((v32 ^ v31) & 1) != 0)
                  return result;
                return v30 == v29 && (v28 == v26 && v27 == v25 || (sub_23B958820() & 1) != 0);
              }
            }
          }
        }
      }
    }
    return result;
  }
  if (!v8)
    return 0;
  v32 = *(unsigned __int8 *)(a1 + 131);
  v33 = *(unsigned __int8 *)(a1 + 130);
  v36 = *(unsigned __int8 *)(a2 + 128);
  v37 = *(unsigned __int8 *)(a2 + 129);
  v30 = *(unsigned __int8 *)(a1 + 136);
  v31 = *(unsigned __int8 *)(a2 + 131);
  v34 = *(_QWORD *)(a1 + 120);
  v35 = *(_QWORD *)(a1 + 112);
  v29 = *(unsigned __int8 *)(a2 + 136);
  v38 = *(unsigned __int8 *)(a1 + 128);
  v39 = *(unsigned __int8 *)(a1 + 129);
  v25 = *(_QWORD *)(a2 + 152);
  v26 = *(_QWORD *)(a2 + 144);
  v27 = *(_QWORD *)(a1 + 152);
  v28 = *(_QWORD *)(a1 + 144);
  if (*(_QWORD *)a1 == *(_QWORD *)a2 && v3 == v8)
    goto LABEL_10;
  v15 = sub_23B958820();
  result = 0;
  if ((v15 & 1) != 0)
    goto LABEL_10;
  return result;
}

unint64_t sub_23B957AC0()
{
  unint64_t result;

  result = qword_254309CA0;
  if (!qword_254309CA0)
  {
    result = MEMORY[0x2426097B0](&protocol conformance descriptor for Device, &type metadata for Device);
    atomic_store(result, (unint64_t *)&qword_254309CA0);
  }
  return result;
}

unint64_t sub_23B957B08()
{
  unint64_t result;

  result = qword_256A55CB0;
  if (!qword_256A55CB0)
  {
    result = MEMORY[0x2426097B0](&protocol conformance descriptor for DeviceError, &type metadata for DeviceError);
    atomic_store(result, (unint64_t *)&qword_256A55CB0);
  }
  return result;
}

unint64_t sub_23B957B50()
{
  unint64_t result;

  result = qword_254309BA0;
  if (!qword_254309BA0)
  {
    result = MEMORY[0x2426097B0](&protocol conformance descriptor for Device, &type metadata for Device);
    atomic_store(result, (unint64_t *)&qword_254309BA0);
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for DeviceError(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_23B957BD4 + 4 * asc_23B95A01C[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_23B957BF4 + 4 * byte_23B95A021[v4]))();
}

_BYTE *sub_23B957BD4(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_23B957BF4(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23B957BFC(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23B957C04(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23B957C0C(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23B957C14(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for DeviceError()
{
  return &type metadata for DeviceError;
}

uint64_t destroy for Device()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for Device(uint64_t a1, uint64_t a2)
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

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  v4 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v4;
  v5 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v5;
  v6 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v6;
  v7 = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = v7;
  v8 = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 88) = v8;
  v9 = *(_QWORD *)(a2 + 104);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 104) = v9;
  v10 = *(_QWORD *)(a2 + 120);
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  *(_QWORD *)(a1 + 120) = v10;
  *(_DWORD *)(a1 + 128) = *(_DWORD *)(a2 + 128);
  *(_BYTE *)(a1 + 136) = *(_BYTE *)(a2 + 136);
  v11 = *(_QWORD *)(a2 + 152);
  *(_QWORD *)(a1 + 144) = *(_QWORD *)(a2 + 144);
  *(_QWORD *)(a1 + 152) = v11;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for Device(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  *(_QWORD *)(a1 + 120) = *(_QWORD *)(a2 + 120);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 128) = *(_BYTE *)(a2 + 128);
  *(_BYTE *)(a1 + 129) = *(_BYTE *)(a2 + 129);
  *(_BYTE *)(a1 + 130) = *(_BYTE *)(a2 + 130);
  *(_BYTE *)(a1 + 131) = *(_BYTE *)(a2 + 131);
  *(_BYTE *)(a1 + 136) = *(_BYTE *)(a2 + 136);
  *(_QWORD *)(a1 + 144) = *(_QWORD *)(a2 + 144);
  *(_QWORD *)(a1 + 152) = *(_QWORD *)(a2 + 152);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy160_8(uint64_t a1, uint64_t a2)
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
  v8 = *(_OWORD *)(a2 + 144);
  *(_OWORD *)(a1 + 128) = *(_OWORD *)(a2 + 128);
  *(_OWORD *)(a1 + 144) = v8;
  *(__n128 *)(a1 + 96) = result;
  *(_OWORD *)(a1 + 112) = v7;
  return result;
}

uint64_t assignWithTake for Device(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  v5 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  v6 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v6;
  swift_bridgeObjectRelease();
  v7 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v7;
  swift_bridgeObjectRelease();
  v8 = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = v8;
  swift_bridgeObjectRelease();
  v9 = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 88) = v9;
  swift_bridgeObjectRelease();
  v10 = *(_QWORD *)(a2 + 104);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 104) = v10;
  swift_bridgeObjectRelease();
  v11 = *(_QWORD *)(a2 + 120);
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  *(_QWORD *)(a1 + 120) = v11;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 128) = *(_BYTE *)(a2 + 128);
  *(_BYTE *)(a1 + 129) = *(_BYTE *)(a2 + 129);
  *(_BYTE *)(a1 + 130) = *(_BYTE *)(a2 + 130);
  *(_BYTE *)(a1 + 131) = *(_BYTE *)(a2 + 131);
  *(_BYTE *)(a1 + 136) = *(_BYTE *)(a2 + 136);
  v12 = *(_QWORD *)(a2 + 152);
  *(_QWORD *)(a1 + 144) = *(_QWORD *)(a2 + 144);
  *(_QWORD *)(a1 + 152) = v12;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for Device(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 160))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for Device(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 152) = 0;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 160) = 1;
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
    *(_BYTE *)(result + 160) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for Device()
{
  return &type metadata for Device;
}

unint64_t sub_23B9580A8()
{
  unint64_t result;

  result = qword_256A55CB8;
  if (!qword_256A55CB8)
  {
    result = MEMORY[0x2426097B0](&protocol conformance descriptor for DeviceError, &type metadata for DeviceError);
    atomic_store(result, (unint64_t *)&qword_256A55CB8);
  }
  return result;
}

uint64_t sub_23B9580EC()
{
  uint64_t v0;

  v0 = sub_23B95831C();
  __swift_allocate_value_buffer(v0, qword_256A55CF0);
  __swift_project_value_buffer(v0, (uint64_t)qword_256A55CF0);
  return sub_23B958310();
}

uint64_t sub_23B958154()
{
  return MEMORY[0x24BE31780]();
}

uint64_t sub_23B958160()
{
  return MEMORY[0x24BE317E8]();
}

uint64_t sub_23B95816C()
{
  return MEMORY[0x24BE31808]();
}

uint64_t sub_23B958178()
{
  return MEMORY[0x24BE31938]();
}

uint64_t sub_23B958184()
{
  return MEMORY[0x24BE31940]();
}

uint64_t sub_23B958190()
{
  return MEMORY[0x24BE31950]();
}

uint64_t sub_23B95819C()
{
  return MEMORY[0x24BE319A8]();
}

uint64_t sub_23B9581A8()
{
  return MEMORY[0x24BE319E0]();
}

uint64_t sub_23B9581B4()
{
  return MEMORY[0x24BE31A18]();
}

uint64_t sub_23B9581C0()
{
  return MEMORY[0x24BDCCA20]();
}

uint64_t sub_23B9581CC()
{
  return MEMORY[0x24BDCCA30]();
}

uint64_t sub_23B9581D8()
{
  return MEMORY[0x24BDCCA40]();
}

uint64_t sub_23B9581E4()
{
  return MEMORY[0x24BDCCA48]();
}

uint64_t sub_23B9581F0()
{
  return MEMORY[0x24BDCCA60]();
}

uint64_t sub_23B9581FC()
{
  return MEMORY[0x24BDCCA70]();
}

uint64_t sub_23B958208()
{
  return MEMORY[0x24BDCCA88]();
}

uint64_t sub_23B958214()
{
  return MEMORY[0x24BDCCA90]();
}

uint64_t sub_23B958220()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_23B95822C()
{
  return MEMORY[0x24BDCD860]();
}

uint64_t sub_23B958238()
{
  return MEMORY[0x24BDCD8D0]();
}

uint64_t sub_23B958244()
{
  return MEMORY[0x24BDCD928]();
}

uint64_t sub_23B958250()
{
  return MEMORY[0x24BDCD9C0]();
}

uint64_t sub_23B95825C()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_23B958268()
{
  return MEMORY[0x24BDCDB78]();
}

uint64_t sub_23B958274()
{
  return MEMORY[0x24BDCDCA0]();
}

uint64_t sub_23B958280()
{
  return MEMORY[0x24BDCDCE0]();
}

uint64_t sub_23B95828C()
{
  return MEMORY[0x24BDCDD20]();
}

uint64_t sub_23B958298()
{
  return MEMORY[0x24BDCE2D8]();
}

uint64_t sub_23B9582A4()
{
  return MEMORY[0x24BDCE878]();
}

uint64_t sub_23B9582B0()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_23B9582BC()
{
  return MEMORY[0x24BE31A68]();
}

uint64_t sub_23B9582C8()
{
  return MEMORY[0x24BDCE998]();
}

uint64_t sub_23B9582D4()
{
  return MEMORY[0x24BDCE9B0]();
}

uint64_t sub_23B9582E0()
{
  return MEMORY[0x24BDCE9E0]();
}

uint64_t sub_23B9582EC()
{
  return MEMORY[0x24BDCEA40]();
}

uint64_t sub_23B9582F8()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_23B958304()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_23B958310()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_23B95831C()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_23B958328()
{
  return MEMORY[0x24BEE54B0]();
}

uint64_t sub_23B958334()
{
  return MEMORY[0x24BEE67F8]();
}

uint64_t sub_23B958340()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_23B95834C()
{
  return MEMORY[0x24BDCF830]();
}

uint64_t sub_23B958358()
{
  return MEMORY[0x24BEE0270]();
}

uint64_t sub_23B958364()
{
  return MEMORY[0x24BEE02B0]();
}

uint64_t sub_23B958370()
{
  return MEMORY[0x24BEE0458]();
}

uint64_t sub_23B95837C()
{
  return MEMORY[0x24BEE0460]();
}

uint64_t sub_23B958388()
{
  return MEMORY[0x24BEE04A8]();
}

uint64_t sub_23B958394()
{
  return MEMORY[0x24BEE04B0]();
}

uint64_t sub_23B9583A0()
{
  return MEMORY[0x24BEE0610]();
}

uint64_t sub_23B9583AC()
{
  return MEMORY[0x24BEE0618]();
}

uint64_t sub_23B9583B8()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_23B9583C4()
{
  return MEMORY[0x24BE31AA0]();
}

uint64_t sub_23B9583D0()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_23B9583DC()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_23B9583E8()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_23B9583F4()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_23B958400()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_23B95840C()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_23B958418()
{
  return MEMORY[0x24BEE0CC8]();
}

uint64_t sub_23B958424()
{
  return MEMORY[0x24BEE1018]();
}

uint64_t sub_23B958430()
{
  return MEMORY[0x24BEE1038]();
}

uint64_t sub_23B95843C()
{
  return MEMORY[0x24BEE1068]();
}

uint64_t sub_23B958448()
{
  return MEMORY[0x24BEE1070]();
}

uint64_t sub_23B958454()
{
  return MEMORY[0x24BEE1078]();
}

uint64_t sub_23B958460()
{
  return MEMORY[0x24BEE1098]();
}

uint64_t sub_23B95846C()
{
  return MEMORY[0x24BEE10B8]();
}

uint64_t sub_23B958478()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_23B958484()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_23B958490()
{
  return MEMORY[0x24BEE1120]();
}

uint64_t sub_23B95849C()
{
  return MEMORY[0x24BEE1138]();
}

uint64_t sub_23B9584A8()
{
  return MEMORY[0x24BEE1180]();
}

uint64_t sub_23B9584B4()
{
  return MEMORY[0x24BEE1250]();
}

uint64_t sub_23B9584C0()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_23B9584CC()
{
  return MEMORY[0x24BEE6828]();
}

uint64_t sub_23B9584D8()
{
  return MEMORY[0x24BEE6838]();
}

uint64_t sub_23B9584E4()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t sub_23B9584F0()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t sub_23B9584FC()
{
  return MEMORY[0x24BDCFCC0]();
}

uint64_t sub_23B958508()
{
  return MEMORY[0x24BDCFCE8]();
}

uint64_t sub_23B958514()
{
  return MEMORY[0x24BEE1598]();
}

uint64_t sub_23B958520()
{
  return MEMORY[0x24BEE15D8]();
}

uint64_t sub_23B95852C()
{
  return MEMORY[0x24BEE1608]();
}

uint64_t sub_23B958538()
{
  return MEMORY[0x24BEE1980]();
}

uint64_t sub_23B958544()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t sub_23B958550()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_23B95855C()
{
  return MEMORY[0x24BEE7920]();
}

uint64_t sub_23B958568()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_23B958574()
{
  return MEMORY[0x24BEE57B0]();
}

uint64_t sub_23B958580()
{
  return MEMORY[0x24BEE5BB8]();
}

uint64_t sub_23B95858C()
{
  return MEMORY[0x24BEE5BC0]();
}

uint64_t sub_23B958598()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_23B9585A4()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_23B9585B0()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_23B9585BC()
{
  return MEMORY[0x24BDD0638]();
}

uint64_t sub_23B9585C8()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_23B9585D4()
{
  return MEMORY[0x24BEE22D0]();
}

uint64_t sub_23B9585E0()
{
  return MEMORY[0x24BEE22E0]();
}

uint64_t sub_23B9585EC()
{
  return MEMORY[0x24BEE22F8]();
}

uint64_t sub_23B9585F8()
{
  return MEMORY[0x24BEE2308]();
}

uint64_t sub_23B958604()
{
  return MEMORY[0x24BEE2320]();
}

uint64_t sub_23B958610()
{
  return MEMORY[0x24BEE2328]();
}

uint64_t sub_23B95861C()
{
  return MEMORY[0x24BEE2330]();
}

uint64_t sub_23B958628()
{
  return MEMORY[0x24BEE2348]();
}

uint64_t sub_23B958634()
{
  return MEMORY[0x24BEE2370]();
}

uint64_t sub_23B958640()
{
  return MEMORY[0x24BDD0698]();
}

uint64_t sub_23B95864C()
{
  return MEMORY[0x24BEE2398]();
}

uint64_t sub_23B958658()
{
  return MEMORY[0x24BEE23A0]();
}

uint64_t sub_23B958664()
{
  return MEMORY[0x24BEE24B8]();
}

uint64_t sub_23B958670()
{
  return MEMORY[0x24BEE24C0]();
}

uint64_t sub_23B95867C()
{
  return MEMORY[0x24BEE24D0]();
}

uint64_t sub_23B958688()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_23B958694()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_23B9586A0()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_23B9586AC()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_23B9586B8()
{
  return MEMORY[0x24BEE2908]();
}

uint64_t sub_23B9586C4()
{
  return MEMORY[0x24BEE2938]();
}

uint64_t sub_23B9586D0()
{
  return MEMORY[0x24BEE2958]();
}

uint64_t sub_23B9586DC()
{
  return MEMORY[0x24BEE2980]();
}

uint64_t sub_23B9586E8()
{
  return MEMORY[0x24BEE2988]();
}

uint64_t sub_23B9586F4()
{
  return MEMORY[0x24BEE2BE0]();
}

uint64_t sub_23B958700()
{
  return MEMORY[0x24BEE2CB8]();
}

uint64_t sub_23B95870C()
{
  return MEMORY[0x24BEE2CC8]();
}

uint64_t sub_23B958718()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_23B958724()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_23B958730()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_23B95873C()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_23B958748()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_23B958754()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_23B958760()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_23B95876C()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_23B958778()
{
  return MEMORY[0x24BEE3350]();
}

uint64_t sub_23B958784()
{
  return MEMORY[0x24BEE3370]();
}

uint64_t sub_23B958790()
{
  return MEMORY[0x24BEE3380]();
}

uint64_t sub_23B95879C()
{
  return MEMORY[0x24BEE33E0]();
}

uint64_t sub_23B9587A8()
{
  return MEMORY[0x24BEE34A0]();
}

uint64_t sub_23B9587B4()
{
  return MEMORY[0x24BEE34C0]();
}

uint64_t sub_23B9587C0()
{
  return MEMORY[0x24BEE34D0]();
}

uint64_t sub_23B9587CC()
{
  return MEMORY[0x24BEE3520]();
}

uint64_t sub_23B9587D8()
{
  return MEMORY[0x24BE31AF8]();
}

uint64_t sub_23B9587E4()
{
  return MEMORY[0x24BE31B00]();
}

uint64_t sub_23B9587F0()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_23B9587FC()
{
  return MEMORY[0x24BEE3598]();
}

uint64_t sub_23B958808()
{
  return MEMORY[0x24BEE7040]();
}

uint64_t sub_23B958814()
{
  return MEMORY[0x24BEE3930]();
}

uint64_t sub_23B958820()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_23B95882C()
{
  return MEMORY[0x24BEE3BB8]();
}

uint64_t sub_23B958838()
{
  return MEMORY[0x24BEE3ED0]();
}

uint64_t sub_23B958844()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_23B958850()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_23B95885C()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_23B958868()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_23B958874()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_23B958880()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_23B95888C()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_23B958898()
{
  return MEMORY[0x24BEE4300]();
}

uint64_t sub_23B9588A4()
{
  return MEMORY[0x24BEE4310]();
}

uint64_t sub_23B9588B0()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_23B9588BC()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t sub_23B9588C8()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t sub_23B9588D4()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_23B9588E0()
{
  return MEMORY[0x24BEE4A10]();
}

uint64_t IDSCopyIDForDevice()
{
  return MEMORY[0x24BE4F978]();
}

uint64_t IDSCopyIDForEmailAddress()
{
  return MEMORY[0x24BE4F980]();
}

uint64_t IDSCopyIDForPhoneNumber()
{
  return MEMORY[0x24BE4F988]();
}

uint64_t IDSCopyLocalDeviceUniqueID()
{
  return MEMORY[0x24BE4F9A8]();
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x24BDD1280]();
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

uint64_t swift_allocBox()
{
  return MEMORY[0x24BEE4B58]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x24BEE4B68]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
}

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x24BEE4B78]();
}

uint64_t swift_allocateGenericValueMetadata()
{
  return MEMORY[0x24BEE4B80]();
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

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x24BEE4BE0]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x24BEE4C10]();
}

uint64_t swift_defaultActor_deallocate()
{
  return MEMORY[0x24BEE71E0]();
}

uint64_t swift_defaultActor_destroy()
{
  return MEMORY[0x24BEE71E8]();
}

uint64_t swift_defaultActor_initialize()
{
  return MEMORY[0x24BEE71F0]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x24BEE4C38]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x24BEE4C60]();
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

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x24BEE4D80]();
}

uint64_t swift_getMetatypeMetadata()
{
  return MEMORY[0x24BEE4D98]();
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

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x24BEE4DF8]();
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

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x24BEE4E28]();
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

uint64_t swift_isClassType()
{
  return MEMORY[0x24BEE4E60]();
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

uint64_t swift_unexpectedError()
{
  return MEMORY[0x24BEE4F68]();
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

