uint64_t sub_23B6B50D4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;

  v3[19] = a2;
  v3[20] = v2;
  v3[18] = a1;
  return swift_task_switch();
}

ValueMetadata *type metadata accessor for SystemInfo.DeviceLockState()
{
  return &type metadata for SystemInfo.DeviceLockState;
}

uint64_t sub_23B6B5100()
{
  return XPCClientConnectionPool.unownedExecutor.getter();
}

uint64_t XPCClientConnectionPool.unownedExecutor.getter()
{
  uint64_t v0;

  return v0;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t dispatch thunk of XPCClientConnectionPool.sessions.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 208))();
}

uint64_t dispatch thunk of XPCClientConnectionPool.isEmpty.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 272))();
}

uint64_t sub_23B6B5150(uint64_t a1)
{
  _QWORD *v1;
  _QWORD *v2;

  v2[15] = a1;
  v2[16] = v1;
  v2[17] = *v1;
  return swift_task_switch();
}

uint64_t sub_23B6B5170()
{
  sub_23B6B5184();
  return swift_bridgeObjectRetain();
}

uint64_t sub_23B6B5184()
{
  uint64_t v0;

  swift_beginAccess();
  return *(_QWORD *)(v0 + 160);
}

uint64_t dispatch thunk of XPCClientConnectionPool.add(connection:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))(**(int **)(*(_QWORD *)v1 + 288) + *(_QWORD *)(*(_QWORD *)v1 + 288));
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_23B6B528C;
  return v6(a1);
}

uint64_t sub_23B6B5218(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;

  v4 = *v2;
  *(_QWORD *)(*v2 + 208) = v1;
  swift_task_dealloc();
  if (!v1)
    *(_QWORD *)(v4 + 216) = a1;
  return swift_task_switch();
}

uint64_t sub_23B6B528C(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v4;

  v4 = *v1;
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v4 + 8))(a1);
}

uint64_t sub_23B6B52DC()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23B6B5334(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;

  v4 = *(_QWORD *)(v1 + 32);
  v5 = swift_task_alloc();
  v6 = *(_OWORD *)(v1 + 16);
  *(_QWORD *)(v2 + 16) = v5;
  *(_QWORD *)v5 = v2;
  *(_QWORD *)(v5 + 8) = sub_23B6B514C;
  *(_OWORD *)(v5 + 24) = v6;
  *(_QWORD *)(v5 + 16) = v4;
  *(_QWORD *)(v5 + 40) = *a1;
  return swift_task_switch();
}

_QWORD *_s19FindMyDaemonSupport11APNSManagerC15IncomingMessageVwCP_0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_23B6B53EC()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 88);

  sub_23B6B6A08(v1);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23B6B542C()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t (*v3)(void);

  v0[6] = sub_23B6B54B4();
  v0[7] = sub_23B6E0560();
  v3 = (uint64_t (*)(void))((int)*MEMORY[0x24BE31980] + MEMORY[0x24BE31980]);
  v1 = (_QWORD *)swift_task_alloc();
  v0[8] = v1;
  *v1 = v0;
  v1[1] = sub_23B6B5868;
  return v3();
}

unint64_t sub_23B6B54B4()
{
  unint64_t result;

  result = qword_254300190;
  if (!qword_254300190)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_254300190);
  }
  return result;
}

uint64_t sub_23B6B54F0()
{
  uint64_t v0;
  void *v1;
  NSObject *v2;
  uint64_t v3;
  os_log_type_t v4;
  uint8_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int *v10;
  uint64_t v11;
  _QWORD *v12;
  os_log_t log;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v1 = *(void **)(*(_QWORD *)(v0 + 48) + 16);
  *(_QWORD *)(v0 + 64) = v1;
  if (v1)
  {
    v2 = v1;
    APNSManager.IncomingMessage.init(apsIncomingMessage:)(v2, &v15);
    v6 = *(_QWORD *)(v0 + 56);
    v7 = v15;
    v8 = v16;
    v9 = v17;
    *(_QWORD *)(v0 + 72) = v16;
    *(_QWORD *)(v0 + 80) = v9;
    v10 = *(int **)(v6 + 160);
    *(_QWORD *)(v0 + 88) = v10;
    if (v10)
    {
      v11 = *(_QWORD *)(v6 + 168);
      *(_QWORD *)(v0 + 16) = v7;
      *(_QWORD *)(v0 + 96) = v11;
      *(_QWORD *)(v0 + 24) = v8;
      *(_QWORD *)(v0 + 32) = v9;
      log = (os_log_t)((char *)v10 + *v10);
      swift_retain();
      v12 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 104) = v12;
      *v12 = v0;
      v12[1] = sub_23B6B78E4;
      return ((uint64_t (*)(uint64_t))log)(v0 + 16);
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    if (qword_2543009B0 != -1)
      swift_once();
    v3 = sub_23B6E0668();
    __swift_project_value_buffer(v3, (uint64_t)qword_2543013D8);
    v2 = sub_23B6E0650();
    v4 = sub_23B6E08A8();
    if (os_log_type_enabled(v2, v4))
    {
      v5 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_23B6B3000, v2, v4, "Expected UnsafeSendableBox<APSIncomingMessage> to have contents!", v5, 2u);
      MEMORY[0x23B86B840](v5, -1, -1);
    }
  }

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23B6B581C()
{
  uint64_t v0;
  void *v1;
  char v2;

  v1 = *(void **)(v0 + 72);
  v2 = sub_23B6E08D8();

  return (*(uint64_t (**)(_QWORD))(v0 + 8))(v2 & 1);
}

uint64_t sub_23B6B5868(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 72) = a1;
  swift_task_dealloc();
  swift_release();
  return swift_task_switch();
}

uint64_t sub_23B6B5928()
{
  swift_task_dealloc();
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  return swift_task_switch();
}

uint64_t sub_23B6B5998()
{
  uint64_t v0;

  swift_release();
  swift_release();
  swift_release();
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(_QWORD *)(v0 + 216));
}

unint64_t sub_23B6B59E4(uint64_t a1)
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
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  unint64_t v19;
  char v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;
  int64_t v24;
  uint64_t v25;
  _OWORD v26[2];
  uint64_t v27;
  uint64_t v28;
  _OWORD v29[2];
  _OWORD v30[2];
  __int128 v31;
  _OWORD v32[2];
  _OWORD v33[2];
  _OWORD v34[2];
  _OWORD v35[2];
  uint64_t v36;
  _OWORD v37[2];
  _OWORD v38[2];
  uint64_t v39;

  if (*(_QWORD *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2543005A8);
    v2 = (_QWORD *)sub_23B6E0A28();
  }
  else
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
  }
  v25 = a1 + 64;
  v3 = -1;
  v4 = -1 << *(_BYTE *)(a1 + 32);
  if (-v4 < 64)
    v3 = ~(-1 << -(char)v4);
  v5 = v3 & *(_QWORD *)(a1 + 64);
  v24 = (unint64_t)(63 - v4) >> 6;
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
        goto LABEL_40;
      if (v13 >= v24)
      {
LABEL_36:
        sub_23B6C5B90();
        return (unint64_t)v2;
      }
      v14 = *(_QWORD *)(v25 + 8 * v13);
      v12 = v7 + 1;
      if (!v14)
      {
        v12 = v7 + 2;
        if (v7 + 2 >= v24)
          goto LABEL_36;
        v14 = *(_QWORD *)(v25 + 8 * v12);
        if (!v14)
        {
          v12 = v7 + 3;
          if (v7 + 3 >= v24)
            goto LABEL_36;
          v14 = *(_QWORD *)(v25 + 8 * v12);
          if (!v14)
          {
            v12 = v7 + 4;
            if (v7 + 4 >= v24)
              goto LABEL_36;
            v14 = *(_QWORD *)(v25 + 8 * v12);
            if (!v14)
            {
              v15 = v7 + 5;
              if (v7 + 5 >= v24)
                goto LABEL_36;
              v14 = *(_QWORD *)(v25 + 8 * v15);
              if (!v14)
              {
                while (1)
                {
                  v12 = v15 + 1;
                  if (__OFADD__(v15, 1))
                    goto LABEL_41;
                  if (v12 >= v24)
                    goto LABEL_36;
                  v14 = *(_QWORD *)(v25 + 8 * v12);
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
    sub_23B6B5EC4(*(_QWORD *)(a1 + 48) + 40 * v11, (uint64_t)v37);
    sub_23B6B5E24(*(_QWORD *)(a1 + 56) + 32 * v11, (uint64_t)v38 + 8);
    v35[0] = v38[0];
    v35[1] = v38[1];
    v36 = v39;
    v34[0] = v37[0];
    v34[1] = v37[1];
    sub_23B6B5EC4((uint64_t)v34, (uint64_t)v29);
    if (!swift_dynamicCast())
    {
      v27 = 0;
      v28 = 0;
      sub_23B6B772C((uint64_t)v34, &qword_2543007C0);
      swift_bridgeObjectRelease();
LABEL_35:
      sub_23B6C5B90();
      swift_release();
      return 0;
    }
    v17 = v27;
    v16 = v28;
    sub_23B6B5E24((uint64_t)v35 + 8, (uint64_t)&v27);
    sub_23B6B772C((uint64_t)v34, &qword_2543007C0);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2543005D0);
    if ((swift_dynamicCast() & 1) == 0)
    {
      memset(v26, 0, sizeof(v26));
      swift_bridgeObjectRelease();
      sub_23B6B772C((uint64_t)v26, &qword_256A46DE0);
      goto LABEL_35;
    }
    sub_23B6B5E14(v26, v29);
    sub_23B6B5E14(v29, v30);
    *(_QWORD *)&v31 = v17;
    *((_QWORD *)&v31 + 1) = v16;
    sub_23B6B5E14(v30, v32);
    v18 = v31;
    sub_23B6B5E14(v32, v33);
    sub_23B6B5E14(v33, &v31);
    result = sub_23B6B5E60(v18, *((uint64_t *)&v18 + 1));
    v19 = result;
    if ((v20 & 1) != 0)
    {
      v8 = (_OWORD *)(v2[6] + 16 * result);
      swift_bridgeObjectRelease();
      *v8 = v18;
      v9 = (_OWORD *)(v2[7] + 32 * v19);
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v9);
      result = (unint64_t)sub_23B6B5E14(&v31, v9);
      goto LABEL_8;
    }
    if (v2[2] >= v2[3])
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    *(_OWORD *)(v2[6] + 16 * result) = v18;
    result = (unint64_t)sub_23B6B5E14(&v31, (_OWORD *)(v2[7] + 32 * result));
    v21 = v2[2];
    v22 = __OFADD__(v21, 1);
    v23 = v21 + 1;
    if (v22)
      goto LABEL_39;
    v2[2] = v23;
LABEL_8:
    v7 = v12;
    v5 = v10;
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

_OWORD *sub_23B6B5E14(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_23B6B5E24(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_23B6B5E60(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_23B6E0B00();
  sub_23B6E0710();
  v4 = sub_23B6E0B18();
  return sub_23B6B764C(a1, a2, v4);
}

uint64_t sub_23B6B5EC4(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(MEMORY[0x24BEE23D0] - 8) + 16))(a2, a1);
  return a2;
}

uint64_t sub_23B6B5F00(void *a1)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;

  result = swift_weakLoadStrong();
  if (result)
  {
    v3 = result;
    if (a1)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_2543007B0);
      v4 = swift_allocObject();
      *(_QWORD *)(v4 + 16) = a1;
      sub_23B6E050C();
      v5 = swift_allocObject();
      *(_QWORD *)(v5 + 16) = v3;
      *(_QWORD *)(v5 + 24) = v4;
      swift_retain();
      swift_retain();
      v6 = a1;
      MEMORY[0x23B86AD78]("APNSManager.didReceive", 22, 2, &unk_256A46F40, v5);
      swift_release();
      swift_release();

    }
    return swift_release();
  }
  return result;
}

void APNSManager.IncomingMessage.init(apsIncomingMessage:)(void *a1@<X0>, uint64_t *a2@<X8>)
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  uint64_t v11;
  unint64_t v12;

  v4 = objc_msgSend(a1, sel_topic);
  if (v4)
  {
    v5 = v4;
    v6 = sub_23B6E06EC();
    v8 = v7;

    swift_bridgeObjectRetain();
    v9 = objc_msgSend(a1, sel_userInfo);
    if (v9)
    {
      v10 = v9;
      v11 = sub_23B6E06A4();

      v12 = sub_23B6B59E4(v11);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v12)
      {

        *a2 = v6;
        a2[1] = v8;
        a2[2] = v12;
        return;
      }
    }
    else
    {
      swift_bridgeObjectRelease();
    }
    sub_23B6C544C();
    swift_allocError();
    swift_willThrow();

    swift_bridgeObjectRelease();
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_23B6B6124()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  id v4;
  NSObject *v5;
  os_log_type_t v6;
  _BOOL4 v7;
  NSObject *v8;
  uint8_t *v9;
  _QWORD *v10;
  NSObject *v11;
  void *v12;
  id v13;
  uint64_t v14;
  _QWORD *v15;
  void *v17;
  uint64_t v18;
  id v19;
  NSObject *v20;
  os_log_type_t v21;
  _BOOL4 v22;
  void *v23;
  uint8_t *v24;
  _QWORD *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  v1 = *(_QWORD *)(v0 + 88);
  if (v1)
  {
    if (qword_254300178 != -1)
      swift_once();
    v2 = *(void **)(v0 + 120);
    v3 = sub_23B6E0668();
    __swift_project_value_buffer(v3, (uint64_t)qword_254300700);
    v4 = v2;
    v5 = sub_23B6E0650();
    v6 = sub_23B6E0890();
    v7 = os_log_type_enabled(v5, v6);
    v8 = *(NSObject **)(v0 + 120);
    if (v7)
    {
      v9 = (uint8_t *)swift_slowAlloc();
      v10 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v9 = 138412290;
      *(_QWORD *)(v0 + 112) = v8;
      v11 = v8;
      sub_23B6E0920();
      *v10 = v8;

      _os_log_impl(&dword_23B6B3000, v5, v6, "Already have a session for %@", v9, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2543000D0);
      swift_arrayDestroy();
      MEMORY[0x23B86B840](v10, -1, -1);
      MEMORY[0x23B86B840](v9, -1, -1);
      swift_release();
      swift_release();
    }
    else
    {

      swift_release();
      swift_release();

      v5 = v8;
    }

    return (*(uint64_t (**)(uint64_t))(v0 + 8))(v1);
  }
  else
  {
    v12 = *(void **)(v0 + 120);
    swift_getAssociatedTypeWitness();
    sub_23B6E05C0();
    v13 = v12;
    v14 = sub_23B6E05B4();
    *(_QWORD *)(v0 + 192) = v14;
    if (v14)
    {
      swift_retain();
      v15 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 200) = v15;
      *v15 = v0;
      v15[1] = sub_23B6B5218;
      return sub_23B6E056C();
    }
    else
    {
      if (qword_254300178 != -1)
        swift_once();
      v17 = *(void **)(v0 + 120);
      v18 = sub_23B6E0668();
      __swift_project_value_buffer(v18, (uint64_t)qword_254300700);
      v19 = v17;
      v20 = sub_23B6E0650();
      v21 = sub_23B6E08A8();
      v22 = os_log_type_enabled(v20, v21);
      v23 = *(void **)(v0 + 120);
      if (v22)
      {
        v24 = (uint8_t *)swift_slowAlloc();
        v25 = (_QWORD *)swift_slowAlloc();
        *(_DWORD *)v24 = 138412290;
        *(_QWORD *)(v0 + 104) = v23;
        v26 = v23;
        sub_23B6E0920();
        *v25 = v23;

        _os_log_impl(&dword_23B6B3000, v20, v21, "Failed to make XPCSession from %@", v24, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2543000D0);
        swift_arrayDestroy();
        MEMORY[0x23B86B840](v25, -1, -1);
        MEMORY[0x23B86B840](v24, -1, -1);
      }
      else
      {

        v20 = *(NSObject **)(v0 + 120);
      }
      v28 = *(_QWORD *)(v0 + 168);
      v27 = *(_QWORD *)(v0 + 176);

      v30 = type metadata accessor for XPCClientConnectionPool.Error(0, v28, v27, v29);
      MEMORY[0x23B86B7BC](&unk_23B6E1E00, v30);
      swift_allocError();
      swift_willThrow();
      swift_release();
      swift_release();
      return (*(uint64_t (**)(void))(v0 + 8))();
    }
  }
}

uint64_t sub_23B6B6570()
{
  char v0;

  swift_beginAccess();
  swift_bridgeObjectRetain();
  v0 = sub_23B6E086C();
  swift_bridgeObjectRelease();
  return v0 & 1;
}

uint64_t APNSManager.IncomingMessage.description.getter()
{
  sub_23B6E098C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_23B6E071C();
  swift_bridgeObjectRelease();
  sub_23B6E071C();
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2543005D0);
  sub_23B6E06B0();
  sub_23B6E071C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_23B6E071C();
  return 0x203A6369706F743CLL;
}

uint64_t sub_23B6B66E8()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  _QWORD *v7;
  _QWORD *v8;
  __int128 v10;

  v2 = v0[18];
  v1 = v0[19];
  v3 = (void *)v0[15];
  v4 = swift_allocObject();
  v10 = *(_OWORD *)(v0 + 21);
  swift_weakInit();
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = v10;
  *(_QWORD *)(v5 + 32) = v4;
  *(_QWORD *)(v5 + 40) = v2;
  *(_QWORD *)(v5 + 48) = v1;
  v0[6] = sub_23B6CDF24;
  v0[7] = v5;
  v0[2] = MEMORY[0x24BDAC760];
  v0[3] = 1107296256;
  v0[4] = sub_23B6CD0F4;
  v0[5] = &block_descriptor_1;
  v6 = _Block_copy(v0 + 2);
  swift_retain();
  swift_retain();
  swift_release();
  objc_msgSend(v3, sel_setInvalidationHandler_, v6);
  _Block_release(v6);
  v7 = (_QWORD *)swift_task_alloc();
  v0[28] = v7;
  *v7 = v0;
  v7[1] = sub_23B6B52DC;
  v8 = (_QWORD *)v0[16];
  v7[18] = v0[27];
  v7[19] = v8;
  v7[20] = *v8;
  return swift_task_switch();
}

uint64_t sub_23B6B6834()
{
  _QWORD *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t (*v7)();
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  _QWORD *v15;
  uint64_t v16;

  v1 = (void *)v0[15];
  __swift_instantiateConcreteTypeFromMangledName(&qword_254300670);
  v2 = swift_allocObject();
  v0[18] = v2;
  *(_QWORD *)(v2 + 16) = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254300678);
  v3 = swift_allocObject();
  v0[19] = v3;
  *(_QWORD *)(v3 + 16) = 0;
  *(_QWORD *)(v3 + 24) = 0;
  v4 = objc_msgSend(v1, sel_invalidationHandler);
  if (v4)
  {
    v5 = v4;
    v6 = swift_allocObject();
    *(_QWORD *)(v6 + 16) = v5;
    v4 = (_QWORD *)swift_allocObject();
    v4[2] = sub_23B6CDF60;
    v4[3] = v6;
    v7 = sub_23B6CDF90;
  }
  else
  {
    v7 = 0;
  }
  v8 = v0[16];
  v9 = v0[17];
  v10 = (void *)v0[15];
  *(_QWORD *)(v3 + 16) = v7;
  *(_QWORD *)(v3 + 24) = v4;
  sub_23B6B6A08(0);
  *(_QWORD *)(v2 + 16) = v10;
  swift_beginAccess();
  v0[12] = *(_QWORD *)(v8 + 160);
  v11 = (_QWORD *)swift_task_alloc();
  v0[20] = v11;
  v12 = *(_QWORD *)(v9 + 80);
  v0[21] = v12;
  v11[2] = v12;
  v13 = *(_QWORD *)(v9 + 88);
  v0[22] = v13;
  v11[3] = v13;
  v11[4] = v10;
  swift_bridgeObjectRetain();
  v14 = v10;
  v15 = (_QWORD *)swift_task_alloc();
  v0[23] = v15;
  v16 = sub_23B6E0884();
  MEMORY[0x23B86B7BC](MEMORY[0x24BEE1718], v16);
  *v15 = v0;
  v15[1] = sub_23B6B5928;
  return sub_23B6E074C();
}

uint64_t sub_23B6B6A08(uint64_t result)
{
  if (result)
    return swift_release();
  return result;
}

uint64_t type metadata accessor for Daemon()
{
  return objc_opt_self();
}

uint64_t sub_23B6B6A38()
{
  uint64_t v0;

  swift_unknownObjectRelease();
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(_QWORD *)(v0 + 168));
}

uint64_t sub_23B6B6A70()
{
  uint64_t v0;
  uint64_t result;
  uint64_t v2;
  uint64_t (*v3)(uint64_t);

  result = qword_254300FA8;
  if (qword_254300FA8)
  {
    v3 = *(uint64_t (**)(uint64_t))(v0 + 8);
    v2 = swift_retain();
    return v3(v2);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t daemon.getter()
{
  if (qword_254300F80 != -1)
    swift_once();
  swift_beginAccess();
  return swift_task_switch();
}

uint64_t sub_23B6B6B2C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;

  v3[6] = a2;
  v3[7] = v2;
  v3[5] = a1;
  return swift_task_switch();
}

uint64_t ActorServiceDaemon.getService<A>()(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;

  v5[5] = a4;
  v5[6] = v4;
  v5[3] = a2;
  v5[4] = a3;
  v5[2] = a1;
  v5[7] = sub_23B6E07AC();
  v5[8] = v6;
  return swift_task_switch();
}

{
  uint64_t v4;
  _QWORD *v5;

  v5[5] = a4;
  v5[6] = v4;
  v5[3] = a2;
  v5[4] = a3;
  v5[2] = a1;
  sub_23B6E07AC();
  return swift_task_switch();
}

uint64_t sub_23B6B6B9C()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_23B6B6BA8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int *v9;
  _QWORD *v10;
  uint64_t v12;
  uint64_t (*v13)(void);

  v1 = *(_QWORD *)(v0 + 144);
  swift_beginAccess();
  swift_bridgeObjectRetain();
  v12 = sub_23B6E0848();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v0 + 112) = v1;
  swift_beginAccess();
  sub_23B6E0884();
  swift_unknownObjectRetain();
  sub_23B6E0854();
  swift_endAccess();
  swift_unknownObjectRelease();
  if (qword_254300178 != -1)
    swift_once();
  v2 = sub_23B6E0668();
  __swift_project_value_buffer(v2, (uint64_t)qword_254300700);
  swift_retain();
  v3 = sub_23B6E0650();
  v4 = sub_23B6E0890();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = swift_slowAlloc();
    *(_DWORD *)v5 = 134218240;
    *(_QWORD *)(v0 + 128) = v12;
    sub_23B6E0920();
    *(_WORD *)(v5 + 12) = 2048;
    swift_beginAccess();
    swift_bridgeObjectRetain();
    v6 = sub_23B6E0848();
    swift_bridgeObjectRelease();
    *(_QWORD *)(v0 + 136) = v6;
    sub_23B6E0920();
    swift_release();
    _os_log_impl(&dword_23B6B3000, v3, v4, "Session count: %ld -> %ld", (uint8_t *)v5, 0x16u);
    MEMORY[0x23B86B840](v5, -1, -1);
  }
  else
  {
    swift_release();
  }

  swift_beginAccess();
  swift_bridgeObjectRetain();
  v7 = sub_23B6E0848();
  swift_bridgeObjectRelease();
  if (v7 != 1)
    return (*(uint64_t (**)(void))(v0 + 8))();
  v8 = *(_QWORD *)(v0 + 152);
  v9 = *(int **)(v8 + 112);
  *(_QWORD *)(v0 + 168) = v9;
  if (!v9)
    return (*(uint64_t (**)(void))(v0 + 8))();
  *(_QWORD *)(v0 + 176) = *(_QWORD *)(v8 + 120);
  sub_23B6CDEB0((uint64_t)v9);
  v13 = (uint64_t (*)(void))((char *)v9 + *v9);
  v10 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 184) = v10;
  *v10 = v0;
  v10[1] = sub_23B6CD140;
  return v13();
}

uint64_t sub_23B6B6EDC(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;

  v4 = *v2;
  *(_QWORD *)(v4 + 88) = v1;
  swift_task_dealloc();
  if (v1)
    return swift_task_switch();
  swift_release();
  return (*(uint64_t (**)(uint64_t))(v4 + 8))(a1);
}

uint64_t sub_23B6B6F60()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 200) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_bridgeObjectRelease();
  return swift_task_switch();
}

uint64_t sub_23B6B6FD4()
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
  _QWORD *v9;
  _QWORD *v10;

  v1 = *(_QWORD *)(v0 + 56);
  swift_beginAccess();
  if (*(_QWORD *)(*(_QWORD *)(v1 + 128) + 16))
  {
    v3 = *(_QWORD *)(v0 + 40);
    v2 = *(_QWORD *)(v0 + 48);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_23B6B5E60(v3, v2);
    if ((v4 & 1) != 0)
    {
      v6 = *(_QWORD *)(v0 + 48);
      v5 = *(_QWORD *)(v0 + 56);
      v7 = *(_QWORD *)(v0 + 40);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_23B6B8FBC((unint64_t *)&qword_254301320, v8, (uint64_t (*)(uint64_t))type metadata accessor for ActorServiceCollection, (uint64_t)&protocol conformance descriptor for ActorServiceCollection);
      v9 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 64) = v9;
      v9[2] = v5;
      v9[3] = v7;
      v9[4] = v6;
      v10 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 72) = v10;
      *v10 = v0;
      v10[1] = sub_23B6D4B10;
      return sub_23B6E0A94();
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23B6B712C()
{
  _QWORD *v0;
  _QWORD *v1;

  v0[9] = (*(uint64_t (**)(_QWORD))(v0[4] + 16))(v0[2]);
  v1 = (_QWORD *)swift_task_alloc();
  v0[10] = v1;
  *v1 = v0;
  v1[1] = sub_23B6B6EDC;
  return sub_23B6B50D4(v0[3], v0[5]);
}

uint64_t sub_23B6B7198()
{
  return swift_retain();
}

uint64_t sub_23B6B71A0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t ObjectType;
  uint64_t (*v9)(uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
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
  uint64_t v27;
  uint64_t (*v28)(uint64_t);
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD *v32;
  uint64_t v33;
  __int128 v34;
  uint64_t v35[3];

  v1 = *(_QWORD *)(v0 + 160);
  swift_beginAccess();
  v2 = *(_QWORD *)(v1 + 112);
  v3 = *(_QWORD *)(v2 + 16);
  if (!v3)
    goto LABEL_13;
  swift_bridgeObjectRetain_n();
  v4 = 0;
  while (1)
  {
    v34 = *(_OWORD *)(v2 + 16 * v4 + 32);
    *(_OWORD *)v35 = v34;
    swift_unknownObjectRetain();
    if ((sub_23B6B753C() & 1) != 0)
      break;
    swift_unknownObjectRelease();
    if (v3 == ++v4)
    {
      swift_bridgeObjectRelease_n();
      goto LABEL_13;
    }
  }
  swift_bridgeObjectRelease_n();
  *(_OWORD *)(v0 + 104) = v34;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254300FB0);
  if ((swift_dynamicCast() & 1) != 0)
  {
    *(_QWORD *)(v0 + 168) = *(_QWORD *)(v0 + 120);
    v5 = qword_254301330;
    swift_unknownObjectRetain();
    if (v5 != -1)
      swift_once();
    sub_23B6E0B54();
    if (*(_QWORD *)(v0 + 88))
    {
      v6 = *(_QWORD *)(v0 + 96);
      v7 = *(_QWORD *)(v0 + 160);
      ObjectType = swift_getObjectType();
      v9 = *(uint64_t (**)(uint64_t, uint64_t))(v6 + 24);
      v10 = v9(ObjectType, v6);
      v12 = v11;
      swift_beginAccess();
      if (*(_QWORD *)(*(_QWORD *)(v7 + 128) + 16))
      {
        swift_bridgeObjectRetain();
        sub_23B6B5E60(v10, v12);
        if ((v13 & 1) != 0)
        {
          v14 = *(_QWORD *)(v0 + 152);
          v15 = *(_QWORD *)(v0 + 144);
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          v16 = v9(ObjectType, v6);
          v18 = v17;
          v19 = (*(uint64_t (**)(uint64_t, uint64_t))(v14 + 24))(v15, v14);
          v21 = v20;
          swift_beginAccess();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          sub_23B6DE330(v35, v16, v18, v19, v21);
          swift_endAccess();
          swift_unknownObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
        }
        else
        {
          swift_unknownObjectRelease();
        }
        swift_bridgeObjectRelease();
      }
      else
      {
        swift_unknownObjectRelease();
      }
      swift_bridgeObjectRelease();
    }
    v27 = *(_QWORD *)(v0 + 144);
    v28 = *(uint64_t (**)(uint64_t))(*(_QWORD *)(v0 + 152) + 24);
    *(_QWORD *)(v0 + 176) = v28;
    v29 = v28(v27);
    v31 = v30;
    *(_QWORD *)(v0 + 184) = v30;
    v32 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 192) = v32;
    *v32 = v0;
    v32[1] = sub_23B6B6F60;
    v33 = *(_QWORD *)(v0 + 160);
    v32[6] = v31;
    v32[7] = v33;
    v32[5] = v29;
    return swift_task_switch();
  }
  else
  {
LABEL_13:
    v22 = sub_23B6E0B6C();
    v24 = v23;
    sub_23B6DFE8C();
    swift_allocError();
    *(_QWORD *)v25 = v22;
    *(_QWORD *)(v25 + 8) = v24;
    *(_BYTE *)(v25 + 16) = 0;
    swift_willThrow();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_23B6B753C()
{
  uint64_t v0;

  swift_unknownObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254300FB0);
  v0 = swift_dynamicCast();
  if ((_DWORD)v0)
    swift_unknownObjectRelease();
  return v0;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x23B86B7B0]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
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

uint64_t block_copy_helper_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

unint64_t sub_23B6B764C(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_23B6E0A88() & 1) == 0)
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
      while (!v14 && (sub_23B6E0A88() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_23B6B772C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_23B6B7768()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + *(_QWORD *)(*(_QWORD *)v0 + 88);
  v2 = sub_23B6E0914();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return swift_deallocClassInstance();
}

uint64_t sub_23B6B77BC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v2 = *(_QWORD *)(v0 + 16);
  v3 = *(_QWORD *)(v0 + 24);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v4;
  *v4 = v1;
  v4[1] = sub_23B6B77B8;
  return sub_23B6B780C(v2, v3);
}

uint64_t sub_23B6B780C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;

  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_23B6B77B8;
  v5[6] = a2;
  v5[7] = a1;
  return swift_task_switch();
}

uint64_t destroy for APNSManager.IncomingMessage()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

ValueMetadata *type metadata accessor for APNSManager.IncomingMessage()
{
  return &type metadata for APNSManager.IncomingMessage;
}

uint64_t APNSManager.IncomingMessage.userInfo.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t APNSManager.IncomingMessage.topic.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_23B6B78E4()
{
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_task_switch();
}

void static SystemInfo.lockState.getter(char *a1@<X8>)
{
  int v2;
  char v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;

  v2 = MKBGetDeviceLockState();
  v3 = 5;
  switch(v2)
  {
    case 0:
      v3 = 3;
      break;
    case 1:
      if (MKBDeviceUnlockedSinceBoot())
        v3 = 2;
      else
        v3 = 1;
      break;
    case 2:
      v3 = 4;
      break;
    case 3:
      break;
    default:
      if (qword_256A46C10 != -1)
        swift_once();
      v4 = sub_23B6E0668();
      __swift_project_value_buffer(v4, (uint64_t)qword_256A47AE0);
      v5 = sub_23B6E0650();
      v6 = sub_23B6E08A8();
      if (os_log_type_enabled(v5, v6))
      {
        v7 = (uint8_t *)swift_slowAlloc();
        *(_DWORD *)v7 = 67109120;
        sub_23B6E0920();
        _os_log_impl(&dword_23B6B3000, v5, v6, "MKBGetDeviceLockState() returned %d", v7, 8u);
        MEMORY[0x23B86B840](v7, -1, -1);
      }

      v3 = 0;
      break;
  }
  *a1 = v3;
}

uint64_t sub_23B6B7AC0(unsigned __int8 *a1)
{
  return *a1;
}

void sub_23B6B7AC8(_QWORD *a1@<X8>)
{
  unsigned __int8 *v1;

  *a1 = *v1;
}

uint64_t sub_23B6B7AD4()
{
  sub_23B6B7B20();
  return sub_23B6E0764();
}

unint64_t sub_23B6B7B20()
{
  unint64_t result;

  result = qword_2543005D8;
  if (!qword_2543005D8)
  {
    result = MEMORY[0x23B86B7BC](&protocol conformance descriptor for SystemInfo.DeviceLockState, &type metadata for SystemInfo.DeviceLockState);
    atomic_store(result, (unint64_t *)&qword_2543005D8);
  }
  return result;
}

uint64_t sub_23B6B7B64()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = sub_23B6E0668();
  __swift_allocate_value_buffer(v0, qword_254301378);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_254301378);
  if (qword_2543006C8 != -1)
    swift_once();
  v2 = __swift_project_value_buffer(v0, (uint64_t)qword_254301390);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 - 8) + 16))(v1, v2, v0);
}

uint64_t FirstUnlockService.name.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 112);
  swift_bridgeObjectRetain();
  return v1;
}

_QWORD *FirstUnlockService.__allocating_init()()
{
  _QWORD *v0;

  v0 = (_QWORD *)swift_allocObject();
  swift_defaultActor_initialize();
  v0[14] = 0xD000000000000012;
  v0[15] = 0x800000023B6E1170;
  v0[16] = MEMORY[0x24BEE4AF8];
  return v0;
}

_QWORD *FirstUnlockService.init()()
{
  _QWORD *v0;

  swift_defaultActor_initialize();
  v0[14] = 0xD000000000000012;
  v0[15] = 0x800000023B6E1170;
  v0[16] = MEMORY[0x24BEE4AF8];
  return v0;
}

uint64_t sub_23B6B7CC0()
{
  uint64_t v0;

  return sub_23B6B7CCC(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_23B6B7CCC(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_23B6B7CD4()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = v0;
  return swift_task_switch();
}

uint64_t sub_23B6B7CEC()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  char v7;

  static SystemInfo.lockState.getter(&v7);
  if (v7 == 1)
  {
    v1 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 24) = v1;
    *v1 = v0;
    v1[1] = sub_23B6B7E14;
    return sub_23B6B7E5C();
  }
  else
  {
    if (qword_254300680 != -1)
      swift_once();
    v3 = sub_23B6E0668();
    __swift_project_value_buffer(v3, (uint64_t)qword_254301378);
    v4 = sub_23B6E0650();
    v5 = sub_23B6E08C0();
    if (os_log_type_enabled(v4, v5))
    {
      v6 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_23B6B3000, v4, v5, "Device is already unlocked -- not registering", v6, 2u);
      MEMORY[0x23B86B840](v6, -1, -1);
    }

    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_23B6B7E14()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_23B6B7E5C()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1[2] = v0;
  v2 = sub_23B6E0590();
  v1[3] = v2;
  v1[4] = *(_QWORD *)(v2 - 8);
  v1[5] = swift_task_alloc();
  v1[6] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_256A46CA0);
  v1[7] = swift_task_alloc();
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2543010B0);
  v1[8] = v3;
  v1[9] = *(_QWORD *)(v3 - 8);
  v1[10] = swift_task_alloc();
  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_256A46CB0);
  v1[11] = v4;
  v1[12] = *(_QWORD *)(v4 - 8);
  v1[13] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23B6B7F48()
{
  uint64_t v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;
  _QWORD *v5;

  if (qword_254300680 != -1)
    swift_once();
  v1 = sub_23B6E0668();
  *(_QWORD *)(v0 + 112) = __swift_project_value_buffer(v1, (uint64_t)qword_254301378);
  v2 = sub_23B6E0650();
  v3 = sub_23B6E08C0();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_23B6B3000, v2, v3, "Registering listener for Darwin notification: kMobileKeyBagFirstUnlockNotificationID", v4, 2u);
    MEMORY[0x23B86B840](v4, -1, -1);
  }

  sub_23B6E05A8();
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 120) = v5;
  *v5 = v0;
  v5[1] = sub_23B6B8074;
  return sub_23B6E059C();
}

uint64_t sub_23B6B8074()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23B6B80CC()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  v2 = v0[9];
  v1 = v0[10];
  v3 = v0[8];
  sub_23B6E0800();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  v0[16] = sub_23B6B8FBC(&qword_254300690, v4, (uint64_t (*)(uint64_t))type metadata accessor for FirstUnlockService, (uint64_t)&protocol conformance descriptor for FirstUnlockService);
  v5 = (_QWORD *)swift_task_alloc();
  v0[17] = v5;
  *v5 = v0;
  v5[1] = sub_23B6B8180;
  return sub_23B6E080C();
}

uint64_t sub_23B6B8180()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23B6B81D8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  _BOOL4 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  void (*v17)(uint64_t, uint64_t);
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;

  v1 = *(_QWORD *)(v0 + 56);
  v2 = *(_QWORD *)(v0 + 24);
  v3 = *(_QWORD *)(v0 + 32);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v1, 1, v2) == 1)
  {
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 96) + 8))(*(_QWORD *)(v0 + 104), *(_QWORD *)(v0 + 88));
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    v6 = *(_QWORD *)(v0 + 40);
    v5 = *(_QWORD *)(v0 + 48);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 32))(v5, v1, v2);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v6, v5, v2);
    v7 = sub_23B6E0650();
    v8 = sub_23B6E089C();
    v9 = os_log_type_enabled(v7, v8);
    v11 = *(_QWORD *)(v0 + 32);
    v10 = *(_QWORD *)(v0 + 40);
    v12 = *(_QWORD *)(v0 + 24);
    if (v9)
    {
      v13 = swift_slowAlloc();
      v14 = swift_slowAlloc();
      v21 = v14;
      *(_DWORD *)v13 = 136315138;
      sub_23B6B8FBC(qword_2543005E8, 255, (uint64_t (*)(uint64_t))MEMORY[0x24BE31900], MEMORY[0x24BE31910]);
      v15 = sub_23B6E0A64();
      *(_QWORD *)(v13 + 4) = sub_23B6BE8C4(v15, v16, &v21);
      swift_bridgeObjectRelease();
      v17 = *(void (**)(uint64_t, uint64_t))(v11 + 8);
      v17(v10, v12);
      _os_log_impl(&dword_23B6B3000, v7, v8, "Process first unlock event: %s", (uint8_t *)v13, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x23B86B840](v14, -1, -1);
      MEMORY[0x23B86B840](v13, -1, -1);
    }
    else
    {
      v17 = *(void (**)(uint64_t, uint64_t))(v11 + 8);
      v17(*(_QWORD *)(v0 + 40), *(_QWORD *)(v0 + 24));
    }

    v18 = *(_QWORD *)(v0 + 48);
    v19 = *(_QWORD *)(v0 + 24);
    sub_23B6B8914();
    v17(v18, v19);
    v20 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 136) = v20;
    *v20 = v0;
    v20[1] = sub_23B6B8180;
    return sub_23B6E080C();
  }
}

uint64_t sub_23B6B8450()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = v0;
  return swift_task_switch();
}

uint64_t sub_23B6B8468()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  char v4;

  static SystemInfo.lockState.getter(&v4);
  if (v4 != 1)
    return (*(uint64_t (**)(void))(v0 + 8))();
  sub_23B6B8FBC(&qword_254300690, v1, (uint64_t (*)(uint64_t))type metadata accessor for FirstUnlockService, (uint64_t)&protocol conformance descriptor for FirstUnlockService);
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 24) = v2;
  *v2 = v0;
  v2[1] = sub_23B6B8540;
  return sub_23B6E0A70();
}

uint64_t sub_23B6B8540()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23B6B8594()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23B6B859C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  unint64_t *v8;
  unint64_t v9;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v11;
  unint64_t v12;
  uint64_t v14;

  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254300718);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8]();
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  v8 = (unint64_t *)(a2 + 128);
  swift_beginAccess();
  v9 = *(_QWORD *)(a2 + 128);
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(_QWORD *)(a2 + 128) = v9;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    v9 = sub_23B6C6498(0, *(_QWORD *)(v9 + 16) + 1, 1, v9);
    *v8 = v9;
  }
  v12 = *(_QWORD *)(v9 + 16);
  v11 = *(_QWORD *)(v9 + 24);
  if (v12 >= v11 >> 1)
  {
    v9 = sub_23B6C6498(v11 > 1, v12 + 1, 1, v9);
    *v8 = v9;
  }
  *(_QWORD *)(v9 + 16) = v12 + 1;
  (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v9+ ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80))+ *(_QWORD *)(v5 + 72) * v12, v7, v4);
  return swift_endAccess();
}

uint64_t FirstUnlockService.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_defaultActor_destroy();
  return v0;
}

uint64_t FirstUnlockService.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_defaultActor_destroy();
  return swift_defaultActor_deallocate();
}

uint64_t FirstUnlockService.unownedExecutor.getter()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_23B6B8748()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 112);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_23B6B8774()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v2;
  *v2 = v1;
  v2[1] = sub_23B6B87D0;
  v2[2] = v0;
  return swift_task_switch();
}

uint64_t sub_23B6B87D0()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_23B6B881C()
{
  return sub_23B6B883C();
}

uint64_t sub_23B6B883C()
{
  uint64_t UnlockService;
  uint64_t v1;
  uint64_t v2;

  UnlockService = type metadata accessor for FirstUnlockService();
  v2 = sub_23B6B8FBC(&qword_254300698, v1, (uint64_t (*)(uint64_t))type metadata accessor for FirstUnlockService, (uint64_t)&protocol conformance descriptor for FirstUnlockService);
  sub_23B6E0A4C();
  sub_23B6E071C();
  swift_bridgeObjectRelease();
  sub_23B6E071C();
  MEMORY[0x23B86B2D0](UnlockService, v2);
  sub_23B6E071C();
  swift_bridgeObjectRelease();
  sub_23B6E071C();
  return 60;
}

void sub_23B6B8914()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(char *, uint64_t, uint64_t);
  uint64_t v22;
  os_log_t v23;
  char v24[24];

  v1 = v0;
  v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254300718);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8]();
  v5 = (char *)&v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  static SystemInfo.lockState.getter(v24);
  if (v24[0] == 1)
  {
    if (qword_254300680 != -1)
      swift_once();
    v6 = sub_23B6E0668();
    __swift_project_value_buffer(v6, (uint64_t)qword_254301378);
    v23 = (os_log_t)sub_23B6E0650();
    v7 = sub_23B6E08C0();
    if (os_log_type_enabled(v23, v7))
    {
      v8 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_23B6B3000, v23, v7, "still locked -- keep listening", v8, 2u);
      MEMORY[0x23B86B840](v8, -1, -1);
    }

  }
  else
  {
    if (qword_254300680 != -1)
      swift_once();
    v9 = sub_23B6E0668();
    __swift_project_value_buffer(v9, (uint64_t)qword_254301378);
    v10 = sub_23B6E0650();
    v11 = sub_23B6E08C0();
    if (os_log_type_enabled(v10, v11))
    {
      v12 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_23B6B3000, v10, v11, "*** First Unlock Event ***", v12, 2u);
      MEMORY[0x23B86B840](v12, -1, -1);
    }

    swift_retain();
    v13 = sub_23B6E0650();
    v14 = sub_23B6E08C0();
    if (os_log_type_enabled(v13, v14))
    {
      v15 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)v15 = 134217984;
      swift_beginAccess();
      *(_QWORD *)v24 = *(_QWORD *)(*(_QWORD *)(v1 + 128) + 16);
      sub_23B6E0920();
      swift_release();
      _os_log_impl(&dword_23B6B3000, v13, v14, "Notifying %ld clients of first unlock", v15, 0xCu);
      MEMORY[0x23B86B840](v15, -1, -1);

    }
    else
    {

      swift_release();
    }
    v16 = (_QWORD *)(v1 + 128);
    swift_beginAccess();
    v17 = *(_QWORD *)(v1 + 128);
    v18 = *(_QWORD *)(v17 + 16);
    if (v18)
    {
      v19 = v17 + ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
      v20 = *(_QWORD *)(v3 + 72);
      v21 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
      swift_bridgeObjectRetain();
      do
      {
        v21(v5, v19, v2);
        sub_23B6E07C4();
        (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
        v19 += v20;
        --v18;
      }
      while (v18);
      swift_bridgeObjectRelease();
    }
    *v16 = MEMORY[0x24BEE4AF8];
    swift_bridgeObjectRelease();
  }
}

uint64_t sub_23B6B8C8C()
{
  uint64_t v0;

  v0 = sub_23B6E0668();
  __swift_allocate_value_buffer(v0, qword_254301390);
  __swift_project_value_buffer(v0, (uint64_t)qword_254301390);
  return sub_23B6E065C();
}

uint64_t type metadata accessor for FirstUnlockService()
{
  return objc_opt_self();
}

uint64_t sub_23B6B8D2C(uint64_t a1)
{
  uint64_t v1;

  return sub_23B6B859C(a1, v1);
}

uint64_t sub_23B6B8D34(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t result;

  *(_QWORD *)(a1 + 8) = sub_23B6B8FBC(&qword_254300698, a2, (uint64_t (*)(uint64_t))type metadata accessor for FirstUnlockService, (uint64_t)&protocol conformance descriptor for FirstUnlockService);
  result = sub_23B6B8FBC(&qword_254300690, v3, (uint64_t (*)(uint64_t))type metadata accessor for FirstUnlockService, (uint64_t)&protocol conformance descriptor for FirstUnlockService);
  *(_QWORD *)(a1 + 16) = result;
  return result;
}

uint64_t method lookup function for FirstUnlockService()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of FirstUnlockService.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 128))();
}

uint64_t dispatch thunk of FirstUnlockService.initialLaunchProcessing()()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t (*v4)(void);

  v4 = (uint64_t (*)(void))(**(int **)(*(_QWORD *)v0 + 136) + *(_QWORD *)(*(_QWORD *)v0 + 136));
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v2;
  *v2 = v1;
  v2[1] = sub_23B6B77B8;
  return v4();
}

uint64_t dispatch thunk of FirstUnlockService.migrate(from:to:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v6;
  uint64_t (*v8)(uint64_t, uint64_t);

  v8 = (uint64_t (*)(uint64_t, uint64_t))(**(int **)(*(_QWORD *)v2 + 144) + *(_QWORD *)(*(_QWORD *)v2 + 144));
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v6;
  *v6 = v3;
  v6[1] = sub_23B6B77B8;
  return v8(a1, a2);
}

uint64_t dispatch thunk of FirstUnlockService.firstLaunchSinceReboot()()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t (*v4)(void);

  v4 = (uint64_t (*)(void))(**(int **)(*(_QWORD *)v0 + 152) + *(_QWORD *)(*(_QWORD *)v0 + 152));
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v2;
  *v2 = v1;
  v2[1] = sub_23B6B77B8;
  return v4();
}

uint64_t dispatch thunk of FirstUnlockService.run()()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t (*v4)(void);

  v4 = (uint64_t (*)(void))(**(int **)(*(_QWORD *)v0 + 160) + *(_QWORD *)(*(_QWORD *)v0 + 160));
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v2;
  *v2 = v1;
  v2[1] = sub_23B6B77B8;
  return v4();
}

uint64_t dispatch thunk of FirstUnlockService.waitForFirstUnlock()()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t (*v4)(void);

  v4 = (uint64_t (*)(void))(**(int **)(*(_QWORD *)v0 + 168) + *(_QWORD *)(*(_QWORD *)v0 + 168));
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v2;
  *v2 = v1;
  v2[1] = sub_23B6B8F74;
  return v4();
}

uint64_t sub_23B6B8F74()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_23B6B8FBC(unint64_t *a1, uint64_t a2, uint64_t (*a3)(uint64_t), uint64_t a4)
{
  uint64_t result;
  uint64_t v7;

  result = *a1;
  if (!result)
  {
    v7 = a3(a2);
    result = MEMORY[0x23B86B7BC](a4, v7);
    atomic_store(result, a1);
  }
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

void type metadata accessor for CFDictionary(uint64_t a1)
{
  sub_23B6B908C(a1, &qword_256A46CC0);
}

void type metadata accessor for CFNotificationName(uint64_t a1)
{
  sub_23B6B908C(a1, &qword_256A46CC8);
}

void type metadata accessor for CFNotificationCenter(uint64_t a1)
{
  sub_23B6B908C(a1, &qword_256A46CD0);
}

void type metadata accessor for CFString(uint64_t a1)
{
  sub_23B6B908C(a1, &qword_256A46CD8);
}

void sub_23B6B908C(uint64_t a1, unint64_t *a2)
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

unint64_t SystemInfo.DeviceLockState.init(rawValue:)@<X0>(unint64_t result@<X0>, char *a2@<X8>)
{
  char v2;

  v2 = 6;
  if (result < 6)
    v2 = result;
  *a2 = v2;
  return result;
}

uint64_t SystemInfo.DeviceLockState.rawValue.getter()
{
  unsigned __int8 *v0;

  return *v0;
}

BOOL sub_23B6B90F0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_23B6B9104()
{
  sub_23B6E0B00();
  sub_23B6E0B0C();
  return sub_23B6E0B18();
}

uint64_t sub_23B6B9148()
{
  return sub_23B6E0B0C();
}

uint64_t sub_23B6B9170()
{
  sub_23B6E0B00();
  sub_23B6E0B0C();
  return sub_23B6E0B18();
}

unint64_t sub_23B6B91B0@<X0>(unint64_t *a1@<X0>, char *a2@<X8>)
{
  return SystemInfo.DeviceLockState.init(rawValue:)(*a1, a2);
}

uint64_t sub_23B6B91B8()
{
  sub_23B6B7B20();
  return sub_23B6E077C();
}

unint64_t sub_23B6B9218()
{
  unint64_t result;

  result = qword_256A46D40;
  if (!qword_256A46D40)
  {
    result = MEMORY[0x23B86B7BC](&protocol conformance descriptor for SystemInfo.DeviceLockState, &type metadata for SystemInfo.DeviceLockState);
    atomic_store(result, (unint64_t *)&qword_256A46D40);
  }
  return result;
}

uint64_t _s15DeviceLockStateOwet(unsigned __int8 *a1, unsigned int a2)
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

uint64_t _s15DeviceLockStateOwst(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23B6B9338 + 4 * byte_23B6E1329[v4]))();
  *a1 = a2 + 5;
  return ((uint64_t (*)(void))((char *)sub_23B6B936C + 4 * byte_23B6E1324[v4]))();
}

uint64_t sub_23B6B936C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23B6B9374(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23B6B937CLL);
  return result;
}

uint64_t sub_23B6B9388(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23B6B9390);
  *(_BYTE *)result = a2 + 5;
  return result;
}

uint64_t sub_23B6B9394(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23B6B939C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_23B6B93AC(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

uint64_t SystemVersionNumber.rawValue.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

void __swiftcall SystemVersionNumber.init(rawValue:)(FindMyDaemonSupport::SystemVersionNumber_optional *__return_ptr retstr, Swift::String rawValue)
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  Swift::String_optional suffix;
  FindMyDaemonSupport::SystemVersionNumber_optional v7;

  SystemVersionNumber.init(string:)(&v7, rawValue);
  v3 = *(_OWORD *)&v7.value.baseNumber;
  v4 = *(_OWORD *)&v7.value.baseLetter._object;
  v5 = *(_OWORD *)&v7.value.childType.is_nil;
  suffix = v7.value.suffix;
  retstr->value.rawValue = v7.value.rawValue;
  *(_OWORD *)&retstr->value.baseNumber = v3;
  *(_OWORD *)&retstr->value.baseLetter._object = v4;
  *(_OWORD *)&retstr->value.childType.is_nil = v5;
  retstr->value.suffix = suffix;
}

void __swiftcall SystemVersionNumber.init(string:)(FindMyDaemonSupport::SystemVersionNumber_optional *__return_ptr retstr, Swift::String string)
{
  void *object;
  uint64_t countAndFlagsBits;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  id v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  void (*v13)(char *, uint64_t, uint64_t);
  char v14;
  void (*v15)(char *, uint64_t);
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  char v20;
  char v21;
  unint64_t v22;
  Swift::Int v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  Swift::Int v30;
  Swift::Int v31;
  uint64_t v32;
  Swift::Int v33;
  uint64_t v34;

  object = string._object;
  countAndFlagsBits = string._countAndFlagsBits;
  v5 = sub_23B6E08FC();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8]();
  v8 = (char *)&v31 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = objc_allocWithZone(MEMORY[0x24BDD17A8]);
  swift_bridgeObjectRetain();
  v34 = countAndFlagsBits;
  v10 = sub_23B6E06E0();
  swift_bridgeObjectRelease();
  v11 = objc_msgSend(v9, sel_initWithString_, v10);

  v12 = *MEMORY[0x24BDD0458];
  v13 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 104);
  v13(v8, v12, v5);
  v33 = sub_23B6E0908();
  LOBYTE(v10) = v14;
  v15 = *(void (**)(char *, uint64_t))(v6 + 8);
  v15(v8, v5);
  if ((v10 & 1) != 0 || (v16 = sub_23B6E08F0(), !v17))
  {

    goto LABEL_12;
  }
  v18 = v17;
  v32 = v16;
  v13(v8, v12, v5);
  v19 = sub_23B6E0908();
  v21 = v20;
  v15(v8, v5);
  if ((v21 & 1) != 0)
  {

    swift_bridgeObjectRelease();
    goto LABEL_12;
  }
  v22 = v19 / 0x3E8uLL;
  if (v19 >= 1000)
    v23 = v19 % 0x3E8uLL;
  else
    v23 = v19;
  if (v19 < 1000)
    v22 = 0;
  v31 = v22;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v24 = sub_23B6E08F0();
  v26 = v25;
  v27 = v34;
  swift_bridgeObjectRetain();
  sub_23B6E08E4();
  v28 = sub_23B6E0740();

  if (v28)
  {
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
LABEL_12:
    swift_bridgeObjectRelease();
    *(_OWORD *)&retstr->value.childType.is_nil = 0u;
    retstr->value.suffix = 0u;
    *(_OWORD *)&retstr->value.baseNumber = 0u;
    *(_OWORD *)&retstr->value.baseLetter._object = 0u;
    retstr->value.rawValue = 0u;
    return;
  }
  retstr->value.rawValue._countAndFlagsBits = v27;
  retstr->value.rawValue._object = object;
  v29 = v32;
  retstr->value.baseNumber = v33;
  retstr->value.baseLetter._countAndFlagsBits = v29;
  v30 = v31;
  retstr->value.baseLetter._object = v18;
  retstr->value.childType.value = v30;
  retstr->value.childType.is_nil = v19 < 1000;
  retstr->value.buildNumber = v23;
  retstr->value.suffix.value._countAndFlagsBits = v24;
  retstr->value.suffix.value._object = v26;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

void __swiftcall SystemVersionNumber.init(stringLiteral:)(FindMyDaemonSupport::SystemVersionNumber *__return_ptr retstr, Swift::String stringLiteral)
{
  void *object;
  void *v4;
  Swift::Bool is_nil;
  Swift::Int value;
  void *v7;
  __int128 v8;
  __int128 v9;
  FindMyDaemonSupport::SystemVersionNumber_optional v10;

  SystemVersionNumber.init(string:)(&v10, stringLiteral);
  object = v10.value.rawValue._object;
  if (v10.value.rawValue._object)
  {
    v4 = v10.value.suffix.value._object;
    is_nil = v10.value.childType.is_nil;
    v7 = v10.value.baseLetter._object;
    value = v10.value.childType.value;
    v8 = *(_OWORD *)&v10.value.baseNumber;
    v9 = *(_OWORD *)&v10.value.buildNumber;
    retstr->rawValue._countAndFlagsBits = v10.value.rawValue._countAndFlagsBits;
    retstr->rawValue._object = object;
    *(_OWORD *)&retstr->baseNumber = v8;
    retstr->baseLetter._object = v7;
    retstr->childType.value = value;
    retstr->childType.is_nil = is_nil;
    *(_OWORD *)&retstr->buildNumber = v9;
    retstr->suffix.value._object = v4;
  }
  else
  {
    __break(1u);
  }
}

double sub_23B6B9730@<D0>(Swift::String *a1@<X0>, uint64_t a2@<X8>)
{
  double result;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  Swift::String_optional suffix;
  FindMyDaemonSupport::SystemVersionNumber_optional v8;

  SystemVersionNumber.init(string:)(&v8, *a1);
  result = *(double *)&v8.value.rawValue._countAndFlagsBits;
  v4 = *(_OWORD *)&v8.value.baseNumber;
  v5 = *(_OWORD *)&v8.value.baseLetter._object;
  v6 = *(_OWORD *)&v8.value.childType.is_nil;
  suffix = v8.value.suffix;
  *(Swift::String *)a2 = v8.value.rawValue;
  *(_OWORD *)(a2 + 16) = v4;
  *(_OWORD *)(a2 + 32) = v5;
  *(_OWORD *)(a2 + 48) = v6;
  *(Swift::String_optional *)(a2 + 64) = suffix;
  return result;
}

uint64_t sub_23B6B977C@<X0>(_QWORD *a1@<X8>)
{
  _QWORD *v1;
  uint64_t v2;

  v2 = v1[1];
  *a1 = *v1;
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

uint64_t sub_23B6B9788()
{
  sub_23B6BA42C();
  return sub_23B6E0770();
}

uint64_t sub_23B6B97E4()
{
  sub_23B6BA42C();
  return sub_23B6E0758();
}

void sub_23B6B9834(Swift::String *a1@<X0>, uint64_t a2@<X8>)
{
  void *object;
  void *v4;
  Swift::Bool is_nil;
  Swift::Int value;
  void *v7;
  __int128 v8;
  __int128 v9;
  FindMyDaemonSupport::SystemVersionNumber_optional v10;

  SystemVersionNumber.init(string:)(&v10, *a1);
  object = v10.value.rawValue._object;
  if (v10.value.rawValue._object)
  {
    v4 = v10.value.suffix.value._object;
    is_nil = v10.value.childType.is_nil;
    v7 = v10.value.baseLetter._object;
    value = v10.value.childType.value;
    v8 = *(_OWORD *)&v10.value.baseNumber;
    v9 = *(_OWORD *)&v10.value.buildNumber;
    *(_QWORD *)a2 = v10.value.rawValue._countAndFlagsBits;
    *(_QWORD *)(a2 + 8) = object;
    *(_OWORD *)(a2 + 16) = v8;
    *(_QWORD *)(a2 + 32) = v7;
    *(_QWORD *)(a2 + 40) = value;
    *(_BYTE *)(a2 + 48) = is_nil;
    *(_OWORD *)(a2 + 56) = v9;
    *(_QWORD *)(a2 + 72) = v4;
  }
  else
  {
    __break(1u);
  }
}

BOOL sub_23B6B98B0(_OWORD *a1, __int128 *a2)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  _OWORD v8[5];
  _OWORD v9[5];

  v2 = a1[3];
  v8[2] = a1[2];
  v8[3] = v2;
  v3 = a1[4];
  v4 = a1[1];
  v8[0] = *a1;
  v8[1] = v4;
  v5 = a2[3];
  v9[2] = a2[2];
  v9[3] = v5;
  v9[4] = a2[4];
  v6 = *a2;
  v9[1] = a2[1];
  v8[4] = v3;
  v9[0] = v6;
  return sub_23B6B9908(v8, v9);
}

BOOL sub_23B6B9908(_QWORD *a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  BOOL v4;
  BOOL v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  char v15;

  v2 = a2[2];
  v3 = a1[2];
  v4 = v2 < v3;
  if (v2 == v3)
  {
    v7 = a2[3] == a1[3] && a2[4] == a1[4];
    if (!v7 && (sub_23B6E0A88() & 1) == 0)
    {
      v15 = sub_23B6E0A88();
      return (v15 & 1) == 0;
    }
    v8 = a2[7];
    v9 = a1[7];
    v4 = v8 < v9;
    if (v8 == v9)
    {
      if (a2[9])
      {
        v10 = a2[8];
        v11 = a2[9];
        v12 = a1[9];
        if (v12)
          goto LABEL_10;
      }
      else
      {
        v10 = 0;
        v11 = 0xE000000000000000;
        v12 = a1[9];
        if (v12)
        {
LABEL_10:
          v13 = a1[8];
          v14 = v12;
          if (v10 != v13)
            goto LABEL_20;
LABEL_18:
          if (v11 == v14)
          {
            v15 = 0;
LABEL_21:
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            return (v15 & 1) == 0;
          }
LABEL_20:
          v15 = sub_23B6E0A88();
          goto LABEL_21;
        }
      }
      v14 = 0xE000000000000000;
      if (v10)
        goto LABEL_20;
      goto LABEL_18;
    }
  }
  v15 = v4;
  return (v15 & 1) == 0;
}

BOOL sub_23B6B9A48(_OWORD *a1, __int128 *a2)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  _OWORD v8[5];
  _OWORD v9[5];

  v2 = a1[3];
  v8[2] = a1[2];
  v8[3] = v2;
  v3 = a1[4];
  v4 = a1[1];
  v8[0] = *a1;
  v8[1] = v4;
  v5 = a2[3];
  v9[2] = a2[2];
  v9[3] = v5;
  v9[4] = a2[4];
  v6 = *a2;
  v9[1] = a2[1];
  v8[4] = v3;
  v9[0] = v6;
  return sub_23B6B9AA0(v8, v9);
}

BOOL sub_23B6B9AA0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  BOOL v4;
  BOOL v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  char v15;

  v2 = a1[2];
  v3 = a2[2];
  v4 = v2 < v3;
  if (v2 == v3)
  {
    v7 = a1[3] == a2[3] && a1[4] == a2[4];
    if (!v7 && (sub_23B6E0A88() & 1) == 0)
    {
      v15 = sub_23B6E0A88();
      return (v15 & 1) == 0;
    }
    v8 = a1[7];
    v9 = a2[7];
    v4 = v8 < v9;
    if (v8 == v9)
    {
      if (a1[9])
      {
        v10 = a1[8];
        v11 = a1[9];
        v12 = a2[9];
        if (v12)
          goto LABEL_10;
      }
      else
      {
        v10 = 0;
        v11 = 0xE000000000000000;
        v12 = a2[9];
        if (v12)
        {
LABEL_10:
          v13 = a2[8];
          v14 = v12;
          if (v10 != v13)
            goto LABEL_20;
LABEL_18:
          if (v11 == v14)
          {
            v15 = 0;
LABEL_21:
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            return (v15 & 1) == 0;
          }
LABEL_20:
          v15 = sub_23B6E0A88();
          goto LABEL_21;
        }
      }
      v14 = 0xE000000000000000;
      if (v10)
        goto LABEL_20;
      goto LABEL_18;
    }
  }
  v15 = v4;
  return (v15 & 1) == 0;
}

uint64_t sub_23B6B9BE0(_OWORD *a1, __int128 *a2)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  _OWORD v8[5];
  _OWORD v9[5];

  v2 = a1[3];
  v8[2] = a1[2];
  v8[3] = v2;
  v3 = a1[4];
  v4 = a1[1];
  v8[0] = *a1;
  v8[1] = v4;
  v5 = a2[3];
  v9[2] = a2[2];
  v9[3] = v5;
  v9[4] = a2[4];
  v6 = *a2;
  v9[1] = a2[1];
  v8[4] = v3;
  v9[0] = v6;
  return sub_23B6B9C38(v8, v9) & 1;
}

uint64_t sub_23B6B9C38(_QWORD *a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  BOOL v4;
  BOOL v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  char v15;

  v2 = a2[2];
  v3 = a1[2];
  v4 = v2 < v3;
  if (v2 != v3)
    goto LABEL_12;
  v7 = a2[3] == a1[3] && a2[4] == a1[4];
  if (!v7 && (sub_23B6E0A88() & 1) == 0)
    return sub_23B6E0A88();
  v8 = a2[7];
  v9 = a1[7];
  v4 = v8 < v9;
  if (v8 != v9)
  {
LABEL_12:
    v15 = v4;
    return v15 & 1;
  }
  if (a2[9])
  {
    v10 = a2[8];
    v11 = a2[9];
    v12 = a1[9];
    if (v12)
      goto LABEL_10;
  }
  else
  {
    v10 = 0;
    v11 = 0xE000000000000000;
    v12 = a1[9];
    if (v12)
    {
LABEL_10:
      v13 = a1[8];
      v14 = v12;
      if (v10 != v13)
        goto LABEL_20;
      goto LABEL_18;
    }
  }
  v14 = 0xE000000000000000;
  if (v10)
  {
LABEL_20:
    v15 = sub_23B6E0A88();
    goto LABEL_21;
  }
LABEL_18:
  if (v11 != v14)
    goto LABEL_20;
  v15 = 0;
LABEL_21:
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v15 & 1;
}

uint64_t sub_23B6B9D7C(_QWORD *a1, _QWORD *a2)
{
  if (*a1 == *a2 && a1[1] == a2[1])
    return 1;
  else
    return sub_23B6E0A88();
}

uint64_t SystemVersionNumber.description.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 72);
  if ((*(_BYTE *)(v0 + 48) & 1) == 0)
  {
    sub_23B6E0A64();
    if (!v1)
      goto LABEL_5;
    goto LABEL_3;
  }
  if (v1)
LABEL_3:
    sub_23B6E06C8();
LABEL_5:
  sub_23B6E0A64();
  sub_23B6E071C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_23B6E06C8();
  swift_bridgeObjectRelease();
  sub_23B6E071C();
  swift_bridgeObjectRelease();
  sub_23B6E0A64();
  sub_23B6E071C();
  swift_bridgeObjectRelease();
  sub_23B6E071C();
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t _s19FindMyDaemonSupport19SystemVersionNumberV1loiySbAC_ACtFZ_0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  BOOL v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  char v16;

  v2 = a1[2];
  v3 = a2[2];
  v4 = v2 < v3;
  if (v2 != v3)
    goto LABEL_23;
  v6 = a1[7];
  v5 = a1[8];
  v7 = a1[9];
  v9 = a2[7];
  v8 = a2[8];
  v10 = a2[9];
  if ((a1[3] != a2[3] || a1[4] != a2[4]) && (sub_23B6E0A88() & 1) == 0)
    return sub_23B6E0A88();
  v4 = v6 < v9;
  if (v6 == v9)
  {
    if (v7)
      v11 = v5;
    else
      v11 = 0;
    if (v7)
      v12 = v7;
    else
      v12 = 0xE000000000000000;
    if (v10)
      v13 = v8;
    else
      v13 = 0;
    if (v10)
      v14 = v10;
    else
      v14 = 0xE000000000000000;
    if (v11 == v13 && v12 == v14)
      v16 = 0;
    else
      v16 = sub_23B6E0A88();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
LABEL_23:
    v16 = v4;
  }
  return v16 & 1;
}

unint64_t sub_23B6BA080()
{
  unint64_t result;

  result = qword_256A46D48;
  if (!qword_256A46D48)
  {
    result = MEMORY[0x23B86B7BC](&protocol conformance descriptor for SystemVersionNumber, &type metadata for SystemVersionNumber);
    atomic_store(result, (unint64_t *)&qword_256A46D48);
  }
  return result;
}

uint64_t sub_23B6BA0C4()
{
  return MEMORY[0x24BEE0D80];
}

unint64_t sub_23B6BA0D4()
{
  unint64_t result;

  result = qword_256A46D50;
  if (!qword_256A46D50)
  {
    result = MEMORY[0x23B86B7BC](&protocol conformance descriptor for SystemVersionNumber, &type metadata for SystemVersionNumber);
    atomic_store(result, (unint64_t *)&qword_256A46D50);
  }
  return result;
}

uint64_t sub_23B6BA118()
{
  return MEMORY[0x24BEE0D90];
}

uint64_t sub_23B6BA124()
{
  return MEMORY[0x24BEE0D88];
}

unint64_t sub_23B6BA134()
{
  unint64_t result;

  result = qword_2543007B8;
  if (!qword_2543007B8)
  {
    result = MEMORY[0x23B86B7BC](&protocol conformance descriptor for SystemVersionNumber, &type metadata for SystemVersionNumber);
    atomic_store(result, (unint64_t *)&qword_2543007B8);
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for SystemVersionNumber(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for SystemVersionNumber()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for SystemVersionNumber(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  v4 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v4;
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for SystemVersionNumber(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = *(_QWORD *)(a2 + 40);
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = v4;
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy80_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  result = *(__n128 *)(a2 + 16);
  v3 = *(_OWORD *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v4;
  *(__n128 *)(a1 + 16) = result;
  *(_OWORD *)(a1 + 32) = v3;
  return result;
}

uint64_t assignWithTake for SystemVersionNumber(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for SystemVersionNumber(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 80))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SystemVersionNumber(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 72) = 0;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 80) = 1;
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
    *(_BYTE *)(result + 80) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for SystemVersionNumber()
{
  return &type metadata for SystemVersionNumber;
}

unint64_t sub_23B6BA42C()
{
  unint64_t result;

  result = qword_254300788;
  if (!qword_254300788)
  {
    result = MEMORY[0x23B86B7BC](&protocol conformance descriptor for SystemVersionNumber, &type metadata for SystemVersionNumber);
    atomic_store(result, (unint64_t *)&qword_254300788);
  }
  return result;
}

uint64_t dispatch thunk of APNSConnector.set(enabledTopics:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v7;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);

  v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(**(int **)(a3 + 8) + *(_QWORD *)(a3 + 8));
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = sub_23B6B77B8;
  return v9(a1, a2, a3);
}

uint64_t dispatch thunk of APNSConnector.setDidReceive(block:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v9;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);

  v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(**(int **)(a4 + 16) + *(_QWORD *)(a4 + 16));
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v9;
  *v9 = v4;
  v9[1] = sub_23B6B8F74;
  return v11(a1, a2, a3, a4);
}

uint64_t dispatch thunk of APNSConnector.setDidReceivePublicToken(block:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v9;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);

  v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(**(int **)(a4 + 24) + *(_QWORD *)(a4 + 24));
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v9;
  *v9 = v4;
  v9[1] = sub_23B6B77B8;
  return v11(a1, a2, a3, a4);
}

uint64_t sub_23B6BA5F0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = sub_23B6E0668();
  __swift_allocate_value_buffer(v0, qword_2543006A0);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_2543006A0);
  if (qword_2543006F8 != -1)
    swift_once();
  v2 = __swift_project_value_buffer(v0, (uint64_t)qword_2543006D8);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 - 8) + 16))(v1, v2, v0);
}

unint64_t sub_23B6BA680(uint64_t a1)
{
  return sub_23B6BA6B8(a1, &qword_254301090, &qword_254300778, &qword_2543010B0);
}

unint64_t sub_23B6BA69C(uint64_t a1)
{
  return sub_23B6BA6B8(a1, (uint64_t *)&unk_254301080, (uint64_t *)&unk_254300768, (uint64_t *)&unk_254300730);
}

unint64_t sub_23B6BA6B8(uint64_t a1, uint64_t *a2, uint64_t *a3, uint64_t *a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t result;
  char v21;
  unint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  BOOL v27;
  uint64_t v28;
  _QWORD v29[2];
  uint64_t *v30;
  uint64_t *v31;

  v30 = a4;
  v31 = a2;
  v6 = __swift_instantiateConcreteTypeFromMangledName(a2);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8]();
  v9 = (_QWORD *)((char *)v29 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  if (!*(_QWORD *)(a1 + 16))
  {
    v11 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(a3);
  v10 = sub_23B6E0A28();
  v11 = (_QWORD *)v10;
  v12 = *(_QWORD *)(a1 + 16);
  if (!v12)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v11;
  }
  v13 = (char *)v9 + *(int *)(v6 + 48);
  v14 = v10 + 64;
  v15 = (*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  v29[1] = a1;
  v16 = a1 + v15;
  v17 = *(_QWORD *)(v7 + 72);
  swift_retain();
  while (1)
  {
    sub_23B6BF618(v16, (uint64_t)v9, v31);
    v18 = *v9;
    v19 = v9[1];
    result = sub_23B6B5E60(*v9, v19);
    if ((v21 & 1) != 0)
      break;
    v22 = result;
    *(_QWORD *)(v14 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v23 = (uint64_t *)(v11[6] + 16 * result);
    *v23 = v18;
    v23[1] = v19;
    v24 = v11[7];
    v25 = __swift_instantiateConcreteTypeFromMangledName(v30);
    result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(_QWORD *)(v25 - 8) + 32))(v24 + *(_QWORD *)(*(_QWORD *)(v25 - 8) + 72) * v22, v13, v25);
    v26 = v11[2];
    v27 = __OFADD__(v26, 1);
    v28 = v26 + 1;
    if (v27)
      goto LABEL_11;
    v11[2] = v28;
    v16 += v17;
    if (!--v12)
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

unint64_t sub_23B6BA850(uint64_t a1)
{
  return sub_23B6BA8E4(a1, (uint64_t *)&unk_254300758);
}

unint64_t sub_23B6BA85C(uint64_t a1)
{
  return sub_23B6BA6B8(a1, (uint64_t *)&unk_254300ED8, &qword_254300590, (uint64_t *)&unk_254300F30);
}

unint64_t sub_23B6BA878(uint64_t a1)
{
  return sub_23B6BA6B8(a1, (uint64_t *)&unk_254300EB8, &qword_254300580, (uint64_t *)&unk_254300520);
}

unint64_t sub_23B6BA894(uint64_t a1)
{
  return sub_23B6BA8E4(a1, &qword_254300570);
}

unint64_t sub_23B6BA8A0(uint64_t a1)
{
  return sub_23B6BA6B8(a1, &qword_254300500, (uint64_t *)&unk_254300598, &qword_254300560);
}

unint64_t sub_23B6BA8BC(uint64_t a1)
{
  return sub_23B6BA6B8(a1, (uint64_t *)&unk_2543004F0, &qword_254300588, &qword_254300540);
}

unint64_t sub_23B6BA8D8(uint64_t a1)
{
  return sub_23B6BA8E4(a1, &qword_254300578);
}

unint64_t sub_23B6BA8E4(uint64_t a1, uint64_t *a2)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t result;
  char v10;
  uint64_t *v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;

  if (!*(_QWORD *)(a1 + 16))
  {
    v3 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(a2);
  v3 = (_QWORD *)sub_23B6E0A28();
  v4 = *(_QWORD *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  swift_retain();
  v5 = (uint64_t *)(a1 + 48);
  while (1)
  {
    v6 = *(v5 - 2);
    v7 = *(v5 - 1);
    v8 = *v5;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    result = sub_23B6B5E60(v6, v7);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v11 = (uint64_t *)(v3[6] + 16 * result);
    *v11 = v6;
    v11[1] = v7;
    *(_QWORD *)(v3[7] + 8 * result) = v8;
    v12 = v3[2];
    v13 = __OFADD__(v12, 1);
    v14 = v12 + 1;
    if (v13)
      goto LABEL_11;
    v3[2] = v14;
    v5 += 3;
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

unint64_t sub_23B6BA9F8(uint64_t a1)
{
  return sub_23B6BA6B8(a1, &qword_254300EE8, &qword_254300F60, (uint64_t *)&unk_254300F40);
}

unint64_t sub_23B6BAA14(uint64_t a1)
{
  return sub_23B6BA6B8(a1, (uint64_t *)&unk_254300EC8, (uint64_t *)&unk_254300F50, (uint64_t *)&unk_254300F00);
}

uint64_t (*sub_23B6BAA30())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

_QWORD *DarwinNotificationHandler.__allocating_init(eventStreamHandler:)(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;

  v2 = (_QWORD *)swift_allocObject();
  swift_defaultActor_initialize();
  v3 = MEMORY[0x24BEE4AF8];
  v2[15] = sub_23B6BA6B8(MEMORY[0x24BEE4AF8], &qword_254301090, &qword_254300778, &qword_2543010B0);
  v2[16] = sub_23B6BA6B8(v3, (uint64_t *)&unk_254301080, (uint64_t *)&unk_254300768, (uint64_t *)&unk_254300730);
  v2[17] = sub_23B6BA6B8(v3, &qword_254301090, &qword_254300778, &qword_2543010B0);
  v2[18] = sub_23B6BA6B8(v3, (uint64_t *)&unk_254301080, (uint64_t *)&unk_254300768, (uint64_t *)&unk_254300730);
  v2[19] = sub_23B6BA8E4(v3, (uint64_t *)&unk_254300758);
  v2[14] = a1;
  return v2;
}

_QWORD *DarwinNotificationHandler.init(eventStreamHandler:)(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v3;

  swift_defaultActor_initialize();
  v3 = MEMORY[0x24BEE4AF8];
  v1[15] = sub_23B6BA6B8(MEMORY[0x24BEE4AF8], &qword_254301090, &qword_254300778, &qword_2543010B0);
  v1[16] = sub_23B6BA6B8(v3, (uint64_t *)&unk_254301080, (uint64_t *)&unk_254300768, (uint64_t *)&unk_254300730);
  v1[17] = sub_23B6BA6B8(v3, &qword_254301090, &qword_254300778, &qword_2543010B0);
  v1[18] = sub_23B6BA6B8(v3, (uint64_t *)&unk_254301080, (uint64_t *)&unk_254300768, (uint64_t *)&unk_254300730);
  v1[19] = sub_23B6BA8E4(v3, (uint64_t *)&unk_254300758);
  v1[14] = a1;
  return v1;
}

uint64_t sub_23B6BAC70()
{
  uint64_t v0;
  int v1;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  uint64_t state64;
  int out_token;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  out_token = 0;
  v0 = sub_23B6E0704();
  notify_register_check((const char *)(v0 + 32), &out_token);
  swift_release();
  v1 = out_token;
  if (out_token == -1)
  {
    if (qword_2543006C0 != -1)
      swift_once();
    v3 = sub_23B6E0668();
    __swift_project_value_buffer(v3, (uint64_t)qword_2543006A0);
    v4 = sub_23B6E0650();
    v5 = sub_23B6E08A8();
    if (os_log_type_enabled(v4, v5))
    {
      v6 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_23B6B3000, v4, v5, "Failed notify_register_check.", v6, 2u);
      MEMORY[0x23B86B840](v6, -1, -1);
    }

    return 0;
  }
  else
  {
    state64 = 0;
    notify_get_state(out_token, &state64);
    notify_cancel(v1);
    return state64;
  }
}

uint64_t sub_23B6BADC0@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  char *v3;
  char *v4;
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
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unsigned int *v22;
  unint64_t v23;
  char v24;
  unsigned int *v25;
  uint64_t v26;
  void (*v27)(char *, uint64_t, uint64_t, uint64_t);
  void (*v28)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v29;
  unint64_t v30;
  char v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  NSObject *v35;
  os_log_type_t v36;
  uint8_t *v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  char *v46;
  void (*v47)(char *, char *, uint64_t);
  uint64_t v48;
  uint64_t v49;
  __CFNotificationCenter *v50;
  __CFString *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  unint64_t v55;
  __objc2_class **p_superclass;
  char v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  NSObject *v61;
  os_log_type_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v66;
  void (*v67)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v68;
  _QWORD *v69;
  char *v70;
  char *v71;
  uint64_t v72;
  char *v73;
  uint64_t v74;
  uint64_t v75;
  char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80[3];

  v4 = v3;
  v74 = a3;
  v72 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2543010A0);
  v7 = *(_QWORD *)(v72 - 8);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v73 = (char *)&v66 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254300748);
  v9 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v70 = (char *)&v66 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v66 - v12;
  MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v66 - v14;
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_2543010B0);
  v77 = *(_QWORD *)(v16 - 8);
  v17 = MEMORY[0x24BDAC7A8](v16);
  v71 = (char *)&v66 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v17);
  v76 = (char *)&v66 - v19;
  swift_beginAccess();
  v20 = *((_QWORD *)v3 + 15);
  v21 = *(_QWORD *)(v20 + 16);
  v22 = (unsigned int *)MEMORY[0x24BEE6A10];
  v75 = v16;
  if (v21)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v23 = sub_23B6B5E60(a1, a2);
    if ((v24 & 1) != 0)
    {
      v25 = v22;
      v26 = v77;
      (*(void (**)(char *, unint64_t, uint64_t))(v77 + 16))(v15, *(_QWORD *)(v20 + 56) + *(_QWORD *)(v77 + 72) * v23, v16);
      v27 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v26 + 56);
      v22 = v25;
      v28 = v27;
      v27(v15, 0, 1, v16);
    }
    else
    {
      v28 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v77 + 56);
      v28(v15, 1, 1, v16);
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v77 + 48))(v15, 1, v16) != 1)
    {
      (*(void (**)(char *, char *, uint64_t))(v77 + 32))(v76, v15, v16);
      goto LABEL_21;
    }
  }
  else
  {
    v28 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v77 + 56);
    v28(v15, 1, 1, v16);
  }
  sub_23B6B772C((uint64_t)v15, (uint64_t *)&unk_254300748);
  v69 = v4 + 136;
  swift_beginAccess();
  v29 = *((_QWORD *)v4 + 17);
  if (*(_QWORD *)(v29 + 16))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v30 = sub_23B6B5E60(a1, a2);
    if ((v31 & 1) != 0)
    {
      (*(void (**)(char *, unint64_t, uint64_t))(v77 + 16))(v13, *(_QWORD *)(v29 + 56) + *(_QWORD *)(v77 + 72) * v30, v16);
      v32 = 0;
    }
    else
    {
      v32 = 1;
    }
    v28(v13, v32, 1, v16);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v77 + 48))(v13, 1, v16) == 1)
      goto LABEL_14;
    (*(void (**)(char *, char *, uint64_t))(v77 + 32))(v76, v13, v16);
LABEL_21:
    v43 = v7;
    v44 = v72;
    v39 = v73;
    goto LABEL_22;
  }
  v28(v13, 1, 1, v16);
LABEL_14:
  v33 = a1;
  sub_23B6B772C((uint64_t)v13, (uint64_t *)&unk_254300748);
  if (qword_2543006C0 != -1)
    swift_once();
  v67 = v28;
  v68 = v7;
  v34 = sub_23B6E0668();
  __swift_project_value_buffer(v34, (uint64_t)qword_2543006A0);
  swift_bridgeObjectRetain_n();
  v35 = sub_23B6E0650();
  v36 = sub_23B6E08C0();
  if (os_log_type_enabled(v35, v36))
  {
    v37 = (uint8_t *)swift_slowAlloc();
    v38 = swift_slowAlloc();
    v80[0] = v38;
    *(_DWORD *)v37 = 136315138;
    swift_bridgeObjectRetain();
    v79 = sub_23B6BE8C4(v33, a2, v80);
    sub_23B6E0920();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_23B6B3000, v35, v36, "Creating base AsyncStream for DarwinNotification name: %s", v37, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B86B840](v38, -1, -1);
    MEMORY[0x23B86B840](v37, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  v39 = v73;
  v40 = sub_23B6E0590();
  MEMORY[0x24BDAC7A8](v40);
  *(&v66 - 4) = (uint64_t)v4;
  *(&v66 - 3) = v33;
  *(&v66 - 2) = a2;
  v41 = *MEMORY[0x24BEE6A10];
  v73 = v4;
  v42 = v33;
  v43 = v68;
  v44 = v72;
  (*(void (**)(char *, uint64_t, uint64_t))(v68 + 104))(v39, v41, v72);
  v45 = v71;
  sub_23B6E0818();
  v46 = v76;
  v47 = *(void (**)(char *, char *, uint64_t))(v77 + 16);
  v48 = v75;
  v47(v76, v45, v75);
  v49 = (uint64_t)v70;
  v47(v70, v46, v48);
  v67((char *)v49, 0, 1, v48);
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_23B6BB7F8(v49, v42, a2, (uint64_t *)&unk_254300748, &qword_2543010B0, (void (*)(char *, uint64_t, uint64_t, uint64_t))sub_23B6CFE18, (void (*)(uint64_t, uint64_t))sub_23B6DB724);
  swift_endAccess();
  swift_retain();
  v50 = CFNotificationCenterGetDarwinNotifyCenter();
  v51 = (__CFString *)sub_23B6E06E0();
  CFNotificationCenterAddObserver(v50, v73, (CFNotificationCallback)sub_23B6BDDA0, v51, 0, CFNotificationSuspensionBehaviorDeliverImmediately);

  (*(void (**)(char *, uint64_t))(v77 + 8))(v45, v48);
  a1 = v42;
  v4 = v73;
  v22 = (unsigned int *)MEMORY[0x24BEE6A10];
LABEL_22:
  v52 = sub_23B6E0590();
  MEMORY[0x24BDAC7A8](v52);
  *(&v66 - 4) = (uint64_t)v4;
  *(&v66 - 3) = a1;
  *(&v66 - 2) = a2;
  (*(void (**)(char *, _QWORD, uint64_t))(v43 + 104))(v39, *v22, v44);
  sub_23B6E0818();
  swift_beginAccess();
  v53 = *((_QWORD *)v4 + 19);
  if (*(_QWORD *)(v53 + 16))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v54 = a1;
    v55 = sub_23B6B5E60(a1, a2);
    p_superclass = _TtCC19FindMyDaemonSupport11APNSManagerP33_69672C9E20C2D053F65B88CE8A65B96022PushDelegateTrampoline.superclass;
    if ((v57 & 1) != 0)
    {
      v58 = *(_QWORD *)(*(_QWORD *)(v53 + 56) + 8 * v55);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v59 = *(_QWORD *)(v58 + 16);
    }
    else
    {
      swift_bridgeObjectRelease();
      v59 = 0;
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    v54 = a1;
    v59 = 0;
    p_superclass = (__objc2_class **)(_TtCC19FindMyDaemonSupport11APNSManagerP33_69672C9E20C2D053F65B88CE8A65B96022PushDelegateTrampoline
                                    + 8);
  }
  if (p_superclass[216] != (__objc2_class *)-1)
    swift_once();
  v60 = sub_23B6E0668();
  __swift_project_value_buffer(v60, (uint64_t)qword_2543006A0);
  swift_bridgeObjectRetain_n();
  v61 = sub_23B6E0650();
  v62 = sub_23B6E08C0();
  if (os_log_type_enabled(v61, v62))
  {
    v63 = swift_slowAlloc();
    v64 = swift_slowAlloc();
    v79 = v64;
    *(_DWORD *)v63 = 136315394;
    swift_bridgeObjectRetain();
    v78 = sub_23B6BE8C4(v54, a2, &v79);
    sub_23B6E0920();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v63 + 12) = 2048;
    v78 = v59;
    sub_23B6E0920();
    _os_log_impl(&dword_23B6B3000, v61, v62, "Creating sub AsyncStream for DarwinNotification name: [%s], count: %ld", (uint8_t *)v63, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x23B86B840](v64, -1, -1);
    MEMORY[0x23B86B840](v63, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v77 + 8))(v76, v75);
}

uint64_t sub_23B6BB6D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;

  __swift_instantiateConcreteTypeFromMangledName(&qword_254300740);
  MEMORY[0x24BDAC7A8]();
  v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254300730);
  v10 = *(_QWORD *)(v9 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v8, a1, v9);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v8, 0, 1, v9);
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_23B6BB7F8((uint64_t)v8, a3, a4, &qword_254300740, (uint64_t *)&unk_254300730, (void (*)(char *, uint64_t, uint64_t, uint64_t))sub_23B6CFE3C, (void (*)(uint64_t, uint64_t))sub_23B6DB738);
  return swift_endAccess();
}

uint64_t sub_23B6BB7F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, uint64_t *a5, void (*a6)(char *, uint64_t, uint64_t, uint64_t), void (*a7)(uint64_t, uint64_t))
{
  uint64_t *v7;
  uint64_t *v11;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t isUniquelyReferenced_nonNull_native;
  void (*v23)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v24;

  v23 = a6;
  v11 = v7;
  __swift_instantiateConcreteTypeFromMangledName(a4);
  MEMORY[0x24BDAC7A8]();
  v16 = (char *)&v23 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = __swift_instantiateConcreteTypeFromMangledName(a5);
  v18 = *(_QWORD *)(v17 - 8);
  MEMORY[0x24BDAC7A8]();
  v20 = (char *)&v23 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v18 + 48))(a1, 1, v17) == 1)
  {
    sub_23B6B772C(a1, a4);
    a7(a2, a3);
    swift_bridgeObjectRelease();
    return sub_23B6B772C((uint64_t)v16, a4);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v18 + 32))(v20, a1, v17);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v24 = *v11;
    *v11 = 0x8000000000000000;
    v23(v20, a2, a3, isUniquelyReferenced_nonNull_native);
    *v11 = v24;
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_23B6BB97C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_23B6BB7F8(a1, a2, a3, (uint64_t *)&unk_254300550, (uint64_t *)&unk_254300F30, (void (*)(char *, uint64_t, uint64_t, uint64_t))sub_23B6CFE7C, (void (*)(uint64_t, uint64_t))sub_23B6DB890);
}

uint64_t sub_23B6BB9A0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_23B6BB7F8(a1, a2, a3, (uint64_t *)&unk_254300530, (uint64_t *)&unk_254300520, (void (*)(char *, uint64_t, uint64_t, uint64_t))sub_23B6CFEA0, (void (*)(uint64_t, uint64_t))sub_23B6DB8A4);
}

uint64_t sub_23B6BB9C4(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v3 = v2;
  v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254301300);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2543012F0);
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(a1, 1, v9) == 1)
  {
    sub_23B6B772C(a1, (uint64_t *)&unk_254301300);
    sub_23B6DB8B8(a2, (uint64_t)v8);
    v13 = sub_23B6E0644();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 8))(a2, v13);
    return sub_23B6B772C((uint64_t)v8, (uint64_t *)&unk_254301300);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v10 + 32))(v12, a1, v9);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v18 = *v3;
    *v3 = 0x8000000000000000;
    sub_23B6CFEE0((uint64_t)v12, a2, isUniquelyReferenced_nonNull_native);
    *v3 = v18;
    swift_bridgeObjectRelease();
    v16 = sub_23B6E0644();
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 8))(a2, v16);
  }
}

uint64_t sub_23B6BBB54(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_23B6BB7F8(a1, a2, a3, &qword_254300568, &qword_254300560, (void (*)(char *, uint64_t, uint64_t, uint64_t))sub_23B6D006C, (void (*)(uint64_t, uint64_t))sub_23B6DB9FC);
}

uint64_t sub_23B6BBB78(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_23B6BB7F8(a1, a2, a3, &qword_254300548, &qword_254300540, (void (*)(char *, uint64_t, uint64_t, uint64_t))sub_23B6D0090, (void (*)(uint64_t, uint64_t))sub_23B6DBA10);
}

uint64_t sub_23B6BBB9C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_23B6BB7F8(a1, a2, a3, (uint64_t *)&unk_254300F10, (uint64_t *)&unk_254300F00, (void (*)(char *, uint64_t, uint64_t, uint64_t))sub_23B6D0224, (void (*)(uint64_t, uint64_t))sub_23B6DBAF8);
}

uint64_t sub_23B6BBBC0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  _QWORD *v12;
  char v13;
  char v14;
  uint64_t (*v15)();
  unint64_t *v16;
  uint64_t (*v17)();
  unint64_t *v18;
  unint64_t v19;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v21;
  unint64_t v22;
  unint64_t v24;
  uint64_t v25;
  char v26;
  _QWORD v28[4];
  _BYTE v29[32];

  v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254300730);
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8]();
  v11 = (char *)&v28[-1] - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = (_QWORD *)(a2 + 152);
  swift_beginAccess();
  if (*(_QWORD *)(*(_QWORD *)(a2 + 152) + 16)
    && (swift_bridgeObjectRetain(),
        swift_bridgeObjectRetain(),
        sub_23B6B5E60(a3, a4),
        v14 = v13,
        swift_bridgeObjectRelease(),
        swift_bridgeObjectRelease(),
        (v14 & 1) != 0))
  {
    swift_bridgeObjectRetain();
    v15 = sub_23B6BAA30();
    v17 = sub_23B6C6FC4(v28, a3, a4);
    if (*v16)
    {
      v18 = v16;
      (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a1, v8);
      v19 = *v18;
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      *v18 = v19;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        v19 = sub_23B6C64AC(0, *(_QWORD *)(v19 + 16) + 1, 1, v19);
        *v18 = v19;
      }
      v22 = *(_QWORD *)(v19 + 16);
      v21 = *(_QWORD *)(v19 + 24);
      if (v22 >= v21 >> 1)
      {
        v19 = sub_23B6C64AC(v21 > 1, v22 + 1, 1, v19);
        *v18 = v19;
      }
      *(_QWORD *)(v19 + 16) = v22 + 1;
      (*(void (**)(unint64_t, char *, uint64_t))(v9 + 32))(v19+ ((*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80))+ *(_QWORD *)(v9 + 72) * v22, v11, v8);
    }
    ((void (*)(_QWORD *, _QWORD))v17)(v28, 0);
    swift_bridgeObjectRelease();
    return ((uint64_t (*)(_BYTE *, _QWORD))v15)(v29, 0);
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_254300780);
    v24 = (*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
    v25 = swift_allocObject();
    *(_OWORD *)(v25 + 16) = xmmword_23B6E1680;
    (*(void (**)(unint64_t, uint64_t, uint64_t))(v9 + 16))(v25 + v24, a1, v8);
    swift_beginAccess();
    swift_bridgeObjectRetain();
    v26 = swift_isUniquelyReferenced_nonNull_native();
    v28[0] = *v12;
    *v12 = 0x8000000000000000;
    sub_23B6CFE60(v25, a3, a4, v26);
    *v12 = v28[0];
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_endAccess();
  }
}

uint64_t DarwinNotificationHandler.deinit()
{
  uint64_t v0;

  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_defaultActor_destroy();
  return v0;
}

uint64_t DarwinNotificationHandler.__deallocating_deinit()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_defaultActor_destroy();
  return swift_defaultActor_deallocate();
}

uint64_t DarwinNotificationHandler.unownedExecutor.getter()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_23B6BBF10(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;

  v2[11] = a1;
  v2[12] = v1;
  v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2543010A0);
  v2[13] = v3;
  v2[14] = *(_QWORD *)(v3 - 8);
  v2[15] = swift_task_alloc();
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2543010B0);
  v2[16] = v4;
  v2[17] = *(_QWORD *)(v4 - 8);
  v2[18] = swift_task_alloc();
  v2[19] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23B6BBFB0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
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
  uint64_t v22;
  _QWORD *v23;
  int isUniquelyReferenced_nonNull_native;
  _QWORD *v25;
  char v26;
  unint64_t v27;
  uint64_t v28;
  _BOOL8 v29;
  uint64_t result;
  char v31;
  unint64_t v32;
  char v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  BOOL v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unsigned int v43;
  uint64_t v44;
  unint64_t *v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  _QWORD *v49;

  v1 = *(_QWORD *)(v0 + 88);
  v2 = *(_QWORD *)(v1 + 16);
  if (v2)
  {
    v3 = *(_QWORD *)(v0 + 136);
    v44 = *(_QWORD *)(v0 + 112);
    v4 = *(_QWORD *)(v0 + 96);
    sub_23B6E0590();
    v47 = (uint64_t *)(v4 + 120);
    v43 = *MEMORY[0x24BEE6A10];
    swift_bridgeObjectRetain();
    v5 = (unint64_t *)(v1 + 40);
    v42 = v2;
    v48 = v3;
    while (1)
    {
      v8 = *(v5 - 1);
      v9 = *v5;
      v10 = qword_2543006C0;
      swift_bridgeObjectRetain();
      if (v10 != -1)
        swift_once();
      v11 = sub_23B6E0668();
      __swift_project_value_buffer(v11, (uint64_t)qword_2543006A0);
      swift_bridgeObjectRetain_n();
      v12 = sub_23B6E0650();
      v13 = sub_23B6E08C0();
      v45 = v5;
      v46 = v2;
      if (os_log_type_enabled(v12, v13))
      {
        v14 = swift_slowAlloc();
        v15 = swift_slowAlloc();
        v49 = (_QWORD *)v15;
        *(_DWORD *)v14 = 136446210;
        swift_bridgeObjectRetain();
        *(_QWORD *)(v14 + 4) = sub_23B6BE8C4(v8, v9, (uint64_t *)&v49);
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_23B6B3000, v12, v13, "Creating base AsyncStream for registered Darwin notification name: %{public}s", (uint8_t *)v14, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x23B86B840](v15, -1, -1);
        MEMORY[0x23B86B840](v14, -1, -1);
      }
      else
      {
        swift_bridgeObjectRelease_n();
      }

      v16 = v8;
      v18 = *(_QWORD *)(v0 + 144);
      v17 = *(_QWORD *)(v0 + 152);
      v20 = *(_QWORD *)(v0 + 120);
      v19 = *(_QWORD *)(v0 + 128);
      v22 = *(_QWORD *)(v0 + 96);
      v21 = *(_QWORD *)(v0 + 104);
      v23 = (_QWORD *)swift_task_alloc();
      v23[2] = v22;
      v23[3] = v16;
      v23[4] = v9;
      (*(void (**)(uint64_t, _QWORD, uint64_t))(v44 + 104))(v20, v43, v21);
      sub_23B6E0818();
      swift_task_dealloc();
      swift_beginAccess();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v48 + 16))(v18, v17, v19);
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v49 = (_QWORD *)*v47;
      v25 = v49;
      *v47 = 0x8000000000000000;
      v27 = sub_23B6B5E60(v16, v9);
      v28 = v25[2];
      v29 = (v26 & 1) == 0;
      result = v28 + v29;
      if (__OFADD__(v28, v29))
        break;
      v31 = v26;
      if (v25[3] >= result)
      {
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        {
          sub_23B6DD278();
          v25 = v49;
        }
      }
      else
      {
        sub_23B6DBB0C(result, isUniquelyReferenced_nonNull_native);
        v25 = v49;
        v32 = sub_23B6B5E60(v16, v9);
        if ((v31 & 1) != (v33 & 1))
          return sub_23B6E0AAC();
        v27 = v32;
      }
      v34 = *(_QWORD *)(v0 + 144);
      v35 = *(_QWORD *)(v0 + 128);
      if ((v31 & 1) != 0)
      {
        (*(void (**)(unint64_t, uint64_t, uint64_t))(v48 + 40))(v25[7] + *(_QWORD *)(v48 + 72) * v27, v34, v35);
      }
      else
      {
        v25[(v27 >> 6) + 8] |= 1 << v27;
        v36 = (uint64_t *)(v25[6] + 16 * v27);
        *v36 = v16;
        v36[1] = v9;
        result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v48 + 32))(v25[7] + *(_QWORD *)(v48 + 72) * v27, v34, v35);
        v37 = v25[2];
        v38 = __OFADD__(v37, 1);
        v39 = v37 + 1;
        if (v38)
          goto LABEL_25;
        v25[2] = v39;
        swift_bridgeObjectRetain();
      }
      v6 = *(_QWORD *)(v0 + 152);
      v7 = *(_QWORD *)(v0 + 128);
      *v47 = (uint64_t)v25;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_endAccess();
      (*(void (**)(uint64_t, uint64_t))(v48 + 8))(v6, v7);
      v5 = v45 + 2;
      v2 = v46 - 1;
      if (v46 == 1)
      {
        swift_bridgeObjectRelease();
        v2 = v42;
        goto LABEL_20;
      }
    }
    __break(1u);
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
LABEL_20:
  v40 = *(_QWORD *)(v0 + 96);
  result = swift_beginAccess();
  if (*(_QWORD *)(*(_QWORD *)(v40 + 120) + 16) != v2)
  {
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  v41 = *(_QWORD *)(v0 + 96);
  result = swift_beginAccess();
  if (*(_QWORD *)(*(_QWORD *)(v41 + 128) + 16) == v2)
  {
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
LABEL_27:
  __break(1u);
  return result;
}

uint64_t sub_23B6BC448(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_254300740);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254300730);
  v11 = *(_QWORD *)(v10 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v9, a1, v10);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v9, 0, 1, v10);
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_23B6BB7F8((uint64_t)v9, a3, a4, &qword_254300740, (uint64_t *)&unk_254300730, (void (*)(char *, uint64_t, uint64_t, uint64_t))sub_23B6CFE3C, (void (*)(uint64_t, uint64_t))sub_23B6DB738);
  return swift_endAccess();
}

uint64_t sub_23B6BC56C()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1[14] = v0;
  v2 = sub_23B6E0590();
  v1[15] = v2;
  v1[16] = *(_QWORD *)(v2 - 8);
  v1[17] = swift_task_alloc();
  v1[18] = swift_task_alloc();
  v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254300F20);
  v1[19] = v3;
  v1[20] = *(_QWORD *)(v3 - 8);
  v1[21] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254300990);
  v1[22] = swift_task_alloc();
  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254300F40);
  v1[23] = v4;
  v1[24] = *(_QWORD *)(v4 - 8);
  v1[25] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23B6BC658()
{
  uint64_t v0;

  if ((MEMORY[0x23B86AD48]() & 1) != 0)
  {
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    *(_QWORD *)(v0 + 208) = *(_QWORD *)(*(_QWORD *)(v0 + 112) + 112);
    return swift_task_switch();
  }
}

uint64_t sub_23B6BC6EC()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;

  v1 = v0[26];
  swift_beginAccess();
  v2 = *(_QWORD *)(v1 + 120);
  if (*(_QWORD *)(v2 + 16))
  {
    swift_bridgeObjectRetain();
    v3 = sub_23B6B5E60(0xD00000000000001ALL, 0x800000023B6E1FE0);
    v4 = v0[23];
    v5 = v0[24];
    v6 = v0[22];
    if ((v7 & 1) != 0)
    {
      (*(void (**)(_QWORD, unint64_t, _QWORD))(v5 + 16))(v0[22], *(_QWORD *)(v2 + 56) + *(_QWORD *)(v5 + 72) * v3, v0[23]);
      (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v5 + 56))(v6, 0, 1, v4);
    }
    else
    {
      (*(void (**)(_QWORD, uint64_t, uint64_t, uint64_t))(v5 + 56))(v0[22], 1, 1, v4);
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    (*(void (**)(_QWORD, uint64_t, uint64_t, _QWORD))(v0[24] + 56))(v0[22], 1, 1, v0[23]);
  }
  return swift_task_switch();
}

uint64_t sub_23B6BC7E4()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  _QWORD *v6;

  v1 = v0[23];
  v2 = v0[24];
  v3 = v0[22];
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v3, 1, v1) == 1)
  {
    sub_23B6B772C(v3, &qword_254300990);
    return sub_23B6E0A04();
  }
  else
  {
    (*(void (**)(_QWORD, uint64_t, uint64_t))(v2 + 32))(v0[25], v3, v1);
    sub_23B6E0800();
    v0[27] = sub_23B6B8FBC(&qword_254300820, v5, (uint64_t (*)(uint64_t))type metadata accessor for DarwinNotificationHandler, (uint64_t)&protocol conformance descriptor for DarwinNotificationHandler);
    v6 = (_QWORD *)swift_task_alloc();
    v0[28] = v6;
    *v6 = v0;
    v6[1] = sub_23B6BC94C;
    return sub_23B6E080C();
  }
}

uint64_t sub_23B6BC94C()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23B6BC9A4()
{
  uint64_t v0;
  uint64_t v1;
  _OWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  _BOOL4 v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  void (*v26)(uint64_t, uint64_t);
  uint64_t v27;
  NSObject *v28;
  os_log_type_t v29;
  _BOOL4 v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint8_t *v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v41;
  uint64_t v42;
  _QWORD *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;

  v1 = *(_QWORD *)(v0 + 72);
  if (!v1)
  {
    v9 = *(_QWORD *)(v0 + 192);
    v8 = *(_QWORD *)(v0 + 200);
    v10 = *(_QWORD *)(v0 + 184);
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 160) + 8))(*(_QWORD *)(v0 + 168), *(_QWORD *)(v0 + 152));
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v8, v10);
LABEL_23:
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  v2 = (_OWORD *)(v0 + 16);
  v3 = *(_QWORD *)(v0 + 80);
  if (qword_2543000E0 != -1)
  {
    swift_once();
    if (*(_QWORD *)(v1 + 16))
      goto LABEL_4;
LABEL_10:
    *v2 = 0u;
    *(_OWORD *)(v0 + 32) = 0u;
    goto LABEL_11;
  }
  if (!*(_QWORD *)(v1 + 16))
    goto LABEL_10;
LABEL_4:
  v4 = qword_254301370;
  v5 = qword_254301368;
  swift_bridgeObjectRetain();
  v6 = sub_23B6B5E60(v5, v4);
  if ((v7 & 1) != 0)
  {
    sub_23B6B5E24(*(_QWORD *)(v1 + 56) + 32 * v6, v0 + 16);
  }
  else
  {
    *v2 = 0u;
    *(_OWORD *)(v0 + 32) = 0u;
  }
  swift_bridgeObjectRelease();
LABEL_11:
  swift_bridgeObjectRelease();
  if (!*(_QWORD *)(v0 + 40))
  {
    sub_23B6B772C(v0 + 16, &qword_256A46DE0);
    goto LABEL_18;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2543005D0);
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_18:
    if (qword_2543006C0 != -1)
      swift_once();
    v27 = sub_23B6E0668();
    __swift_project_value_buffer(v27, (uint64_t)qword_2543006A0);
    v28 = sub_23B6E0650();
    v29 = sub_23B6E08A8();
    v30 = os_log_type_enabled(v28, v29);
    v32 = *(_QWORD *)(v0 + 192);
    v31 = *(_QWORD *)(v0 + 200);
    v33 = *(_QWORD *)(v0 + 184);
    v35 = *(_QWORD *)(v0 + 160);
    v34 = *(_QWORD *)(v0 + 168);
    v48 = *(_QWORD *)(v0 + 152);
    if (v30)
    {
      v46 = *(_QWORD *)(v0 + 200);
      v36 = (uint8_t *)swift_slowAlloc();
      v37 = swift_slowAlloc();
      *(_DWORD *)v36 = 136315138;
      v49 = v37;
      v44 = v34;
      v45 = v32;
      v38 = qword_254301368;
      v39 = qword_254301370;
      swift_bridgeObjectRetain();
      *(_QWORD *)(v0 + 104) = sub_23B6BE8C4(v38, v39, &v49);
      sub_23B6E0920();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_23B6B3000, v28, v29, "Event missing \"%s\" key!", v36, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x23B86B840](v37, -1, -1);
      MEMORY[0x23B86B840](v36, -1, -1);

      swift_release();
      (*(void (**)(uint64_t, uint64_t))(v35 + 8))(v44, v48);
      (*(void (**)(uint64_t, uint64_t))(v45 + 8))(v46, v33);
    }
    else
    {

      swift_release();
      (*(void (**)(uint64_t, uint64_t))(v35 + 8))(v34, v48);
      (*(void (**)(uint64_t, uint64_t))(v32 + 8))(v31, v33);
    }
    goto LABEL_23;
  }
  swift_retain();
  v47 = v3;
  sub_23B6E0578();
  if (qword_2543006C0 != -1)
    swift_once();
  v12 = *(_QWORD *)(v0 + 136);
  v11 = *(_QWORD *)(v0 + 144);
  v14 = *(_QWORD *)(v0 + 120);
  v13 = *(_QWORD *)(v0 + 128);
  v15 = sub_23B6E0668();
  __swift_project_value_buffer(v15, (uint64_t)qword_2543006A0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v13 + 16))(v12, v11, v14);
  v16 = sub_23B6E0650();
  v17 = sub_23B6E08C0();
  v18 = os_log_type_enabled(v16, v17);
  v19 = *(_QWORD *)(v0 + 128);
  v20 = *(_QWORD *)(v0 + 136);
  v21 = *(_QWORD *)(v0 + 120);
  if (v18)
  {
    v22 = swift_slowAlloc();
    v23 = swift_slowAlloc();
    v49 = v23;
    *(_DWORD *)v22 = 136446210;
    sub_23B6B8FBC(qword_2543005E8, 255, (uint64_t (*)(uint64_t))MEMORY[0x24BE31900], MEMORY[0x24BE31910]);
    v24 = sub_23B6E0A64();
    *(_QWORD *)(v22 + 4) = sub_23B6BE8C4(v24, v25, &v49);
    swift_bridgeObjectRelease();
    v26 = *(void (**)(uint64_t, uint64_t))(v19 + 8);
    v26(v20, v21);
    _os_log_impl(&dword_23B6B3000, v16, v17, "XPCEventStream notification: %{public}s", (uint8_t *)v22, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B86B840](v23, -1, -1);
    MEMORY[0x23B86B840](v22, -1, -1);
  }
  else
  {
    v26 = *(void (**)(uint64_t, uint64_t))(v19 + 8);
    v26(*(_QWORD *)(v0 + 136), *(_QWORD *)(v0 + 120));
  }

  v41 = *(_QWORD *)(v0 + 144);
  v42 = *(_QWORD *)(v0 + 120);
  sub_23B6BCF2C(v41, v47);
  swift_release();
  v26(v41, v42);
  v43 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 224) = v43;
  *v43 = v0;
  v43[1] = sub_23B6BC94C;
  return sub_23B6E080C();
}

void sub_23B6BCF2C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  os_log_type_t v27;
  uint8_t *v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;

  v33 = a2;
  v34 = sub_23B6E0590();
  v4 = *(_QWORD *)(v34 - 8);
  v5 = *(_QWORD *)(v4 + 64);
  v6 = MEMORY[0x24BDAC7A8](v34);
  v7 = (char *)&v32 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v32 - v8;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_254301350);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v32 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_23B6E0584();
  v15 = v14;
  swift_beginAccess();
  v16 = *(_QWORD *)(v2 + 152);
  if (*(_QWORD *)(v16 + 16))
  {
    swift_bridgeObjectRetain();
    v17 = sub_23B6B5E60(v13, v15);
    if ((v18 & 1) != 0)
    {
      v19 = *(_QWORD *)(*(_QWORD *)(v16 + 56) + 8 * v17);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v20 = sub_23B6E07DC();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 56))(v12, 1, 1, v20);
      v21 = v34;
      (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v9, a1, v34);
      v22 = (*(unsigned __int8 *)(v4 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
      v23 = (char *)swift_allocObject();
      *((_QWORD *)v23 + 2) = 0;
      *((_QWORD *)v23 + 3) = 0;
      *((_QWORD *)v23 + 4) = v33;
      *((_QWORD *)v23 + 5) = v19;
      (*(void (**)(char *, char *, uint64_t))(v4 + 32))(&v23[v22], v9, v21);
      swift_retain();
      sub_23B6C71B0((uint64_t)v12, (uint64_t)&unk_256A46D80, (uint64_t)v23);
      swift_release();
      return;
    }
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  v24 = v34;
  if (qword_2543006C0 != -1)
    swift_once();
  v25 = sub_23B6E0668();
  __swift_project_value_buffer(v25, (uint64_t)qword_2543006A0);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v7, a1, v24);
  v26 = sub_23B6E0650();
  v27 = sub_23B6E08B4();
  if (os_log_type_enabled(v26, v27))
  {
    v28 = (uint8_t *)swift_slowAlloc();
    v29 = swift_slowAlloc();
    v36 = v29;
    *(_DWORD *)v28 = 136446210;
    sub_23B6B8FBC(qword_2543005E8, 255, (uint64_t (*)(uint64_t))MEMORY[0x24BE31900], MEMORY[0x24BE31910]);
    v30 = sub_23B6E0A64();
    v35 = sub_23B6BE8C4(v30, v31, &v36);
    sub_23B6E0920();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v24);
    _os_log_impl(&dword_23B6B3000, v26, v27, "Received notification %{public}s with no subscribers!", v28, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B86B840](v29, -1, -1);
    MEMORY[0x23B86B840](v28, -1, -1);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v24);
  }

}

uint64_t sub_23B6BD2C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;

  v6[13] = a5;
  v6[14] = a6;
  v6[12] = a4;
  v7 = sub_23B6E0590();
  v6[15] = v7;
  v6[16] = *(_QWORD *)(v7 - 8);
  v6[17] = swift_task_alloc();
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_254300728);
  v6[18] = v8;
  v6[19] = *(_QWORD *)(v8 - 8);
  v6[20] = swift_task_alloc();
  if (qword_254300F80 != -1)
    swift_once();
  swift_beginAccess();
  return swift_task_switch();
}

uint64_t sub_23B6BD394()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t result;

  v1 = qword_254300FA8;
  *(_QWORD *)(v0 + 168) = qword_254300FA8;
  if (v1)
  {
    swift_retain();
    return swift_task_switch();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_23B6BD3E4()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 176) = *(_QWORD *)(*(_QWORD *)(v0 + 168) + 128);
  swift_retain();
  return swift_task_switch();
}

uint64_t sub_23B6BD42C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t i;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t ObjectType;
  uint64_t (*v9)(uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v20;

  v1 = v0[22];
  swift_beginAccess();
  v2 = *(_QWORD *)(v1 + 112);
  v0[23] = v2;
  v3 = *(_QWORD *)(v2 + 16);
  v0[24] = v3;
  if (!v3)
  {
LABEL_10:
    swift_release();
    swift_release();
    return swift_task_switch();
  }
  swift_bridgeObjectRetain();
  swift_beginAccess();
  for (i = 0; ; i = v0[25] + 1)
  {
    v0[25] = i;
    v5 = v0[22];
    v6 = v0[23] + 16 * i;
    v0[26] = *(_QWORD *)(v6 + 32);
    v7 = *(_QWORD *)(v6 + 40);
    ObjectType = swift_getObjectType();
    v9 = *(uint64_t (**)(uint64_t, uint64_t))(v7 + 24);
    swift_unknownObjectRetain();
    v10 = v9(ObjectType, v7);
    v12 = v11;
    v0[27] = v11;
    if (!*(_QWORD *)(*(_QWORD *)(v5 + 128) + 16))
      goto LABEL_6;
    v13 = v10;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_23B6B5E60(v13, v12);
    if ((v14 & 1) != 0)
      break;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
LABEL_6:
    swift_bridgeObjectRelease();
    v15 = v0[25];
    v16 = v0[24];
    swift_unknownObjectRelease();
    if (v15 + 1 == v16)
    {
      swift_bridgeObjectRelease();
      goto LABEL_10;
    }
  }
  v18 = v0[22];
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_23B6B8FBC((unint64_t *)&qword_254301320, 255, (uint64_t (*)(uint64_t))type metadata accessor for ActorServiceCollection, (uint64_t)&protocol conformance descriptor for ActorServiceCollection);
  v19 = (_QWORD *)swift_task_alloc();
  v0[28] = v19;
  v19[2] = v18;
  v19[3] = v13;
  v19[4] = v12;
  v20 = (_QWORD *)swift_task_alloc();
  v0[29] = v20;
  *v20 = v0;
  v20[1] = sub_23B6BD7B8;
  return sub_23B6E0A94();
}

uint64_t sub_23B6BD65C()
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
  void (*v10)(_QWORD, _QWORD, _QWORD);
  uint64_t v11;
  uint64_t v12;

  v2 = *(_QWORD *)(v0 + 96);
  v1 = *(_QWORD *)(v0 + 104);
  sub_23B6E050C();
  sub_23B6E04F4();
  *(_QWORD *)(v0 + 88) = v2;
  swift_retain_n();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2543005E0);
  swift_task_localValuePush();
  v3 = *(_QWORD *)(v1 + 16);
  if (v3)
  {
    v4 = *(_QWORD *)(v0 + 152);
    v5 = *(_QWORD *)(v0 + 128);
    v6 = *(_QWORD *)(v0 + 104);
    v7 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254300730) - 8);
    v8 = v6 + ((*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80));
    v9 = *(_QWORD *)(v7 + 72);
    v10 = *(void (**)(_QWORD, _QWORD, _QWORD))(v5 + 16);
    swift_bridgeObjectRetain();
    do
    {
      v11 = *(_QWORD *)(v0 + 160);
      v12 = *(_QWORD *)(v0 + 144);
      v10(*(_QWORD *)(v0 + 136), *(_QWORD *)(v0 + 112), *(_QWORD *)(v0 + 120));
      sub_23B6E07F4();
      (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v11, v12);
      v8 += v9;
      --v3;
    }
    while (v3);
    swift_bridgeObjectRelease();
  }
  swift_task_localValuePop();
  swift_release();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23B6BD7B8()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 240) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23B6BD82C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t ObjectType;
  uint64_t (*v8)(uint64_t, uint64_t);
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;

  while (1)
  {
    do
    {
      swift_bridgeObjectRelease();
      v1 = v0[25];
      v2 = v0[24];
      swift_unknownObjectRelease();
      if (v1 + 1 == v2)
      {
        swift_release();
        swift_bridgeObjectRelease();
        swift_release();
        return swift_task_switch();
      }
      v3 = v0[25] + 1;
      v0[25] = v3;
      v4 = v0[22];
      v5 = v0[23] + 16 * v3;
      v0[26] = *(_QWORD *)(v5 + 32);
      v6 = *(_QWORD *)(v5 + 40);
      ObjectType = swift_getObjectType();
      v8 = *(uint64_t (**)(uint64_t, uint64_t))(v6 + 24);
      swift_unknownObjectRetain();
      v9 = v8(ObjectType, v6);
      v11 = v10;
      v0[27] = v10;
    }
    while (!*(_QWORD *)(*(_QWORD *)(v4 + 128) + 16));
    v12 = v9;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_23B6B5E60(v12, v11);
    if ((v13 & 1) != 0)
      break;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  v15 = v0[22];
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_23B6B8FBC((unint64_t *)&qword_254301320, 255, (uint64_t (*)(uint64_t))type metadata accessor for ActorServiceCollection, (uint64_t)&protocol conformance descriptor for ActorServiceCollection);
  v16 = (_QWORD *)swift_task_alloc();
  v0[28] = v16;
  v16[2] = v15;
  v16[3] = v12;
  v16[4] = v11;
  v17 = (_QWORD *)swift_task_alloc();
  v0[29] = v17;
  *v17 = v0;
  v17[1] = sub_23B6BD7B8;
  return sub_23B6E0A94();
}

uint64_t sub_23B6BDA0C()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_unknownObjectRelease();
  return swift_task_switch();
}

uint64_t sub_23B6BDA70()
{
  swift_release();
  return swift_task_switch();
}

uint64_t sub_23B6BDAAC()
{
  uint64_t v0;

  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23B6BDAF4()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t result;
  uint64_t v6;
  _QWORD aBlock[6];
  uint64_t v8;

  v8 = MEMORY[0x24BEE4AF8];
  v0 = xpc_copy_event();
  if (!v0)
  {
    v6 = MEMORY[0x24BEE4AF8];
    swift_bridgeObjectRelease();
    return v6;
  }
  v1 = (void *)v0;
  v2 = swift_allocObject();
  *(_QWORD *)(v2 + 16) = &v8;
  v3 = swift_allocObject();
  *(_QWORD *)(v3 + 16) = sub_23B6BF1E0;
  *(_QWORD *)(v3 + 24) = v2;
  aBlock[4] = sub_23B6BF1F8;
  aBlock[5] = v3;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_23B6CE590;
  aBlock[3] = &block_descriptor;
  v4 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  xpc_dictionary_apply(v1, v4);
  swift_unknownObjectRelease();
  _Block_release(v4);
  LOBYTE(v1) = swift_isEscapingClosureAtFileLocation();
  result = swift_release();
  if ((v1 & 1) == 0)
  {
    v6 = v8;
    swift_release();
    return v6;
  }
  __break(1u);
  return result;
}

uint64_t sub_23B6BDC58(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;

  v6[2] = a4;
  v6[3] = a6;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254301350);
  v6[4] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23B6BDCB8()
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
  _QWORD *v9;

  if (*(_QWORD *)(v0 + 24))
  {
    v1 = *(_QWORD *)(v0 + 32);
    v2 = *(_QWORD *)(v0 + 16);
    v3 = sub_23B6E06EC();
    v5 = v4;
    v6 = sub_23B6E07DC();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v1, 1, 1, v6);
    v8 = sub_23B6B8FBC(&qword_254300820, v7, (uint64_t (*)(uint64_t))type metadata accessor for DarwinNotificationHandler, (uint64_t)&protocol conformance descriptor for DarwinNotificationHandler);
    v9 = (_QWORD *)swift_allocObject();
    v9[2] = v2;
    v9[3] = v8;
    v9[4] = v3;
    v9[5] = v5;
    v9[6] = v2;
    swift_retain_n();
    sub_23B6CE420(v1, (uint64_t)&unk_256A46DB0, (uint64_t)v9);
    swift_release();
  }
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_23B6BDDA0(void *a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  uint64_t v9;
  char *v10;
  uint64_t v11;
  void (*v12)(char *, uint64_t, uint64_t, uint64_t);
  _QWORD *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;

  __swift_instantiateConcreteTypeFromMangledName(&qword_254301350);
  MEMORY[0x24BDAC7A8]();
  v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
  {
    v11 = sub_23B6E07DC();
    v12 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56);
    swift_retain();
    v12(v10, 1, 1, v11);
    v13 = (_QWORD *)swift_allocObject();
    v13[2] = 0;
    v13[3] = 0;
    v13[4] = a2;
    v13[5] = a1;
    v13[6] = a3;
    v13[7] = a5;
    v14 = a1;
    v15 = a3;
    v16 = a5;
    v17 = v14;
    v18 = v15;
    v19 = v16;
    sub_23B6CE420((uint64_t)v10, (uint64_t)&unk_256A46DA0, (uint64_t)v13);
    swift_release();

  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_23B6BDECC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;

  v6[4] = a5;
  v6[5] = a6;
  v6[2] = a1;
  v6[3] = a4;
  return swift_task_switch();
}

uint64_t sub_23B6BDEE8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  __int128 v3;

  v1 = *(_QWORD *)(v0 + 24);
  sub_23B6E050C();
  v2 = swift_task_alloc();
  v3 = *(_OWORD *)(v0 + 32);
  *(_QWORD *)(v2 + 16) = v1;
  *(_OWORD *)(v2 + 24) = v3;
  sub_23B6E04DC();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23B6BDF88(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  char *v19;
  _QWORD v21[2];

  v21[1] = a2;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_254301350);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_23B6E0590();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = *(_QWORD *)(v9 + 64);
  v11 = MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)v21 - v13;
  swift_bridgeObjectRetain();
  swift_retain();
  sub_23B6E0578();
  v15 = sub_23B6E07DC();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56))(v7, 1, 1, v15);
  (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v12, v14, v8);
  v17 = sub_23B6B8FBC(&qword_254300820, v16, (uint64_t (*)(uint64_t))type metadata accessor for DarwinNotificationHandler, (uint64_t)&protocol conformance descriptor for DarwinNotificationHandler);
  v18 = (*(unsigned __int8 *)(v9 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  v19 = (char *)swift_allocObject();
  *((_QWORD *)v19 + 2) = a4;
  *((_QWORD *)v19 + 3) = v17;
  *((_QWORD *)v19 + 4) = a4;
  (*(void (**)(char *, char *, uint64_t))(v9 + 32))(&v19[v18], v12, v8);
  swift_retain_n();
  sub_23B6CE420((uint64_t)v7, (uint64_t)&unk_256A46DC0, (uint64_t)v19);
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v14, v8);
}

uint64_t sub_23B6BE15C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;

  v5[3] = a4;
  v5[4] = a5;
  v5[2] = a1;
  return swift_task_switch();
}

uint64_t sub_23B6BE178()
{
  uint64_t v0;

  sub_23B6E050C();
  *(_OWORD *)(swift_task_alloc() + 16) = *(_OWORD *)(v0 + 24);
  sub_23B6E04DC();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_23B6BE214(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  os_log_type_t v27;
  uint8_t *v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;

  v33 = a2;
  v34 = sub_23B6E0590();
  v4 = *(_QWORD *)(v34 - 8);
  v5 = *(_QWORD *)(v4 + 64);
  v6 = MEMORY[0x24BDAC7A8](v34);
  v7 = (char *)&v32 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v32 - v8;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_254301350);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v32 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_23B6E0584();
  v15 = v14;
  swift_beginAccess();
  v16 = *(_QWORD *)(v2 + 152);
  if (*(_QWORD *)(v16 + 16))
  {
    swift_bridgeObjectRetain();
    v17 = sub_23B6B5E60(v13, v15);
    if ((v18 & 1) != 0)
    {
      v19 = *(_QWORD *)(*(_QWORD *)(v16 + 56) + 8 * v17);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v20 = sub_23B6E07DC();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 56))(v12, 1, 1, v20);
      v21 = v34;
      (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v9, a1, v34);
      v22 = (*(unsigned __int8 *)(v4 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
      v23 = (char *)swift_allocObject();
      *((_QWORD *)v23 + 2) = 0;
      *((_QWORD *)v23 + 3) = 0;
      *((_QWORD *)v23 + 4) = v33;
      *((_QWORD *)v23 + 5) = v19;
      (*(void (**)(char *, char *, uint64_t))(v4 + 32))(&v23[v22], v9, v21);
      swift_retain();
      sub_23B6CE420((uint64_t)v12, (uint64_t)&unk_256A46DD0, (uint64_t)v23);
      swift_release();
      return;
    }
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  v24 = v34;
  if (qword_2543006C0 != -1)
    swift_once();
  v25 = sub_23B6E0668();
  __swift_project_value_buffer(v25, (uint64_t)qword_2543006A0);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v7, a1, v24);
  v26 = sub_23B6E0650();
  v27 = sub_23B6E08B4();
  if (os_log_type_enabled(v26, v27))
  {
    v28 = (uint8_t *)swift_slowAlloc();
    v29 = swift_slowAlloc();
    v36 = v29;
    *(_DWORD *)v28 = 136315138;
    sub_23B6B8FBC(qword_2543005E8, 255, (uint64_t (*)(uint64_t))MEMORY[0x24BE31900], MEMORY[0x24BE31910]);
    v30 = sub_23B6E0A64();
    v35 = sub_23B6BE8C4(v30, v31, &v36);
    sub_23B6E0920();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v24);
    _os_log_impl(&dword_23B6B3000, v26, v27, "Received unexpected unregistered notification: [%s]", v28, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B86B840](v29, -1, -1);
    MEMORY[0x23B86B840](v28, -1, -1);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v24);
  }

}

uint64_t sub_23B6BE5A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;

  v6[4] = a5;
  v6[5] = a6;
  v6[3] = a4;
  v7 = sub_23B6E0590();
  v6[6] = v7;
  v6[7] = *(_QWORD *)(v7 - 8);
  v6[8] = swift_task_alloc();
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_254300728);
  v6[9] = v8;
  v6[10] = *(_QWORD *)(v8 - 8);
  v6[11] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23B6BE638()
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
  void (*v10)(_QWORD, _QWORD, _QWORD);
  uint64_t v11;
  uint64_t v12;

  v2 = *(_QWORD *)(v0 + 24);
  v1 = *(_QWORD *)(v0 + 32);
  sub_23B6E050C();
  sub_23B6E04F4();
  *(_QWORD *)(v0 + 16) = v2;
  swift_retain_n();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2543005E0);
  swift_task_localValuePush();
  v3 = *(_QWORD *)(v1 + 16);
  if (v3)
  {
    v4 = *(_QWORD *)(v0 + 80);
    v5 = *(_QWORD *)(v0 + 56);
    v6 = *(_QWORD *)(v0 + 32);
    v7 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254300730) - 8);
    v8 = v6 + ((*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80));
    v9 = *(_QWORD *)(v7 + 72);
    v10 = *(void (**)(_QWORD, _QWORD, _QWORD))(v5 + 16);
    swift_bridgeObjectRetain();
    do
    {
      v11 = *(_QWORD *)(v0 + 88);
      v12 = *(_QWORD *)(v0 + 72);
      v10(*(_QWORD *)(v0 + 64), *(_QWORD *)(v0 + 40), *(_QWORD *)(v0 + 48));
      sub_23B6E07F4();
      (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v11, v12);
      v8 += v9;
      --v3;
    }
    while (v3);
    swift_bridgeObjectRelease();
  }
  swift_task_localValuePop();
  swift_release();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23B6BE790()
{
  uint64_t v0;

  v0 = sub_23B6E0668();
  __swift_allocate_value_buffer(v0, qword_2543006D8);
  __swift_project_value_buffer(v0, (uint64_t)qword_2543006D8);
  return sub_23B6E065C();
}

uint64_t sub_23B6BE810(uint64_t a1, uint64_t a2, _QWORD **a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v9;
  unint64_t v10;
  _QWORD *v11;

  v4 = sub_23B6E0728();
  v6 = v5;
  v7 = *a3;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *a3 = v7;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    v7 = sub_23B6C66CC(0, v7[2] + 1, 1, v7);
    *a3 = v7;
  }
  v10 = v7[2];
  v9 = v7[3];
  if (v10 >= v9 >> 1)
  {
    v7 = sub_23B6C66CC((_QWORD *)(v9 > 1), v10 + 1, 1, v7);
    *a3 = v7;
  }
  v7[2] = v10 + 1;
  v11 = &v7[2 * v10];
  v11[4] = v4;
  v11[5] = v6;
  return 1;
}

uint64_t sub_23B6BE8C4(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_23B6BE994(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_23B6B5E24((uint64_t)v12, *a3);
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
      sub_23B6B5E24((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_23B6BE994(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_23B6E092C();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_23B6BEB4C(a5, a6);
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
  v8 = sub_23B6E09A4();
  if (!v8)
  {
    sub_23B6E09F8();
    __break(1u);
LABEL_17:
    result = sub_23B6E0A34();
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

uint64_t sub_23B6BEB4C(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_23B6BEBE0(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_23B6BEDB8(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_23B6BEDB8(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_23B6BEBE0(uint64_t a1, unint64_t a2)
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
      v3 = sub_23B6BED54(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_23B6E0998();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_23B6E09F8();
      __break(1u);
LABEL_10:
      v2 = sub_23B6E0734();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_23B6E0A34();
    __break(1u);
LABEL_14:
    result = sub_23B6E09F8();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_23B6BED54(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_2543010E8);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_23B6BEDB8(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2543010E8);
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
  result = sub_23B6E0A34();
  __break(1u);
  return result;
}

uint64_t sub_23B6BEF04(uint64_t a1)
{
  uint64_t *v1;

  return sub_23B6BB6D4(a1, v1[2], v1[3], v1[4]);
}

uint64_t sub_23B6BEF10(uint64_t a1)
{
  uint64_t *v1;

  return sub_23B6BBBC0(a1, v1[2], v1[3], v1[4]);
}

uint64_t type metadata accessor for DarwinNotificationHandler()
{
  return objc_opt_self();
}

uint64_t method lookup function for DarwinNotificationHandler()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of DarwinNotificationHandler.__allocating_init(eventStreamHandler:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 256))();
}

uint64_t dispatch thunk of DarwinNotificationHandler.currentValue(name:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 264))();
}

uint64_t dispatch thunk of DarwinNotificationHandler.asyncStream(name:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 272))();
}

uint64_t sub_23B6BEF6C(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;

  v4 = *(unsigned __int8 *)(*(_QWORD *)(sub_23B6E0590() - 8) + 80);
  v5 = v1[2];
  v6 = v1[3];
  v7 = v1[4];
  v8 = v1[5];
  v9 = (uint64_t)v1 + ((v4 + 48) & ~v4);
  v10 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v10;
  *v10 = v2;
  v10[1] = sub_23B6B8F74;
  return sub_23B6BD2C0(a1, v5, v6, v7, v8, v9);
}

uint64_t sub_23B6BF004(uint64_t a1)
{
  uint64_t *v1;

  return sub_23B6DAEFC(a1, v1[2], v1[3], v1[4]);
}

unint64_t sub_23B6BF010(uint64_t a1)
{
  uint64_t v2;

  sub_23B6E0644();
  sub_23B6B8FBC(&qword_2543012E0, 255, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
  v2 = sub_23B6E06BC();
  return sub_23B6BF080(a1, v2);
}

unint64_t sub_23B6BF080(uint64_t a1, uint64_t a2)
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
  v5 = sub_23B6E0644();
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
      sub_23B6B8FBC(&qword_254301348, 255, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA98]);
      v14 = sub_23B6E06D4();
      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
      if ((v14 & 1) != 0)
        break;
      v10 = (v10 + 1) & v11;
    }
    while (((*(_QWORD *)(v3 + 64 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0);
  }
  return v10;
}

uint64_t sub_23B6BF1C4(uint64_t a1)
{
  uint64_t *v1;

  return sub_23B6BC448(a1, v1[2], v1[3], v1[4]);
}

uint64_t sub_23B6BF1D0()
{
  return swift_deallocObject();
}

uint64_t sub_23B6BF1E0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_23B6BE810(a1, a2, *(_QWORD ***)(v2 + 16));
}

uint64_t sub_23B6BF1E8()
{
  return swift_deallocObject();
}

uint64_t sub_23B6BF1F8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_23B6CE56C(a1, a2, *(uint64_t (**)(void))(v2 + 16));
}

uint64_t block_destroy_helper()
{
  return swift_release();
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

uint64_t sub_23B6BF22C()
{
  id *v0;

  swift_unknownObjectRelease();
  swift_release();

  return swift_deallocObject();
}

uint64_t sub_23B6BF270(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;

  v4 = v1[2];
  v5 = v1[3];
  v6 = v1[4];
  v7 = v1[5];
  v8 = v1[6];
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v9;
  *v9 = v2;
  v9[1] = sub_23B6B8F74;
  return sub_23B6BDC58(a1, v4, v5, v6, v7, v8);
}

uint64_t sub_23B6BF2FC()
{
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23B6BF330(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;

  v4 = v1[4];
  v5 = v1[5];
  v6 = v1[6];
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_23B6B77B8;
  v7[4] = v5;
  v7[5] = v6;
  v7[2] = a1;
  v7[3] = v4;
  return swift_task_switch();
}

uint64_t sub_23B6BF3A4(uint64_t a1)
{
  uint64_t *v1;

  return sub_23B6BDF88(a1, v1[2], v1[3], v1[4]);
}

uint64_t sub_23B6BF3C0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = sub_23B6E0590();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_unknownObjectRelease();
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  return swift_deallocObject();
}

uint64_t sub_23B6BF43C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;

  v4 = *(unsigned __int8 *)(*(_QWORD *)(sub_23B6E0590() - 8) + 80);
  v5 = *(_QWORD *)(v1 + 32);
  v6 = v1 + ((v4 + 40) & ~v4);
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_23B6B77B8;
  v7[3] = v5;
  v7[4] = v6;
  v7[2] = a1;
  return swift_task_switch();
}

void sub_23B6BF4C8(uint64_t a1)
{
  uint64_t v1;

  sub_23B6BE214(*(_QWORD *)(v1 + 24), a1);
}

uint64_t objectdestroyTm()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = sub_23B6E0590();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_unknownObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  return swift_deallocObject();
}

uint64_t sub_23B6BF580(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;

  v4 = *(unsigned __int8 *)(*(_QWORD *)(sub_23B6E0590() - 8) + 80);
  v5 = v1[2];
  v6 = v1[3];
  v7 = v1[4];
  v8 = v1[5];
  v9 = (uint64_t)v1 + ((v4 + 48) & ~v4);
  v10 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v10;
  *v10 = v2;
  v10[1] = sub_23B6B77B8;
  return sub_23B6BE5A8(a1, v5, v6, v7, v8, v9);
}

uint64_t sub_23B6BF618(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_23B6BF65C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = sub_23B6E0668();
  __swift_allocate_value_buffer(v0, qword_254300470);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_254300470);
  if (qword_2543004E8 != -1)
    swift_once();
  v2 = __swift_project_value_buffer(v0, (uint64_t)qword_2543004C8);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 - 8) + 16))(v1, v2, v0);
}

_QWORD *DistributedNotificationHandler.__allocating_init(eventStreamHandler:)(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;

  v2 = (_QWORD *)swift_allocObject();
  swift_defaultActor_initialize();
  v3 = MEMORY[0x24BEE4AF8];
  v2[15] = sub_23B6BA85C(MEMORY[0x24BEE4AF8]);
  v2[16] = sub_23B6BA878(v3);
  v2[17] = sub_23B6BA85C(v3);
  v2[18] = sub_23B6BA878(v3);
  v2[19] = sub_23B6BA894(v3);
  v2[14] = a1;
  return v2;
}

_QWORD *DistributedNotificationHandler.init(eventStreamHandler:)(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v3;

  swift_defaultActor_initialize();
  v3 = MEMORY[0x24BEE4AF8];
  v1[15] = sub_23B6BA85C(MEMORY[0x24BEE4AF8]);
  v1[16] = sub_23B6BA878(v3);
  v1[17] = sub_23B6BA85C(v3);
  v1[18] = sub_23B6BA878(v3);
  v1[19] = sub_23B6BA894(v3);
  v1[14] = a1;
  return v1;
}

uint64_t sub_23B6BF7EC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unsigned int *v24;
  unint64_t v25;
  char v26;
  unsigned int *v27;
  uint64_t v28;
  void (*v29)(char *, uint64_t, uint64_t, uint64_t);
  void (*v30)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v31;
  unint64_t v32;
  char v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  NSObject *v37;
  os_log_type_t v38;
  uint8_t *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  unsigned int *v45;
  uint64_t v46;
  char *v47;
  char *v48;
  uint64_t v49;
  void (*v50)(char *, char *, uint64_t);
  uint64_t v51;
  uint64_t v52;
  uint64_t (*v53)(char *, uint64_t);
  __objc2_class **p_superclass;
  uint64_t v55;
  uint64_t v56;
  unint64_t v57;
  char v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  NSObject *v62;
  os_log_type_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v67;
  void (*v68)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v69;
  uint64_t v70;
  char *v71;
  char *v72;
  char *v73;
  uint64_t v74;
  uint64_t v75;
  char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81[3];

  v4 = v3;
  v78 = a1;
  v75 = a3;
  v74 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254300EF0);
  v6 = *(_QWORD *)(v74 - 8);
  MEMORY[0x24BDAC7A8](v74);
  v8 = (char *)&v67 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254300550);
  v10 = MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v67 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = MEMORY[0x24BDAC7A8](v10);
  v15 = (char *)&v67 - v14;
  MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v67 - v16;
  v18 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254300F30);
  v77 = *(_QWORD *)(v18 - 8);
  v19 = MEMORY[0x24BDAC7A8](v18);
  v72 = (char *)&v67 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v19);
  v76 = (char *)&v67 - v21;
  swift_beginAccess();
  v22 = *(_QWORD *)(v3 + 120);
  v23 = *(_QWORD *)(v22 + 16);
  v24 = (unsigned int *)MEMORY[0x24BEE6A10];
  v73 = v12;
  if (v23)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v25 = sub_23B6B5E60(v78, a2);
    if ((v26 & 1) != 0)
    {
      v27 = v24;
      v28 = v77;
      (*(void (**)(char *, unint64_t, uint64_t))(v77 + 16))(v17, *(_QWORD *)(v22 + 56) + *(_QWORD *)(v77 + 72) * v25, v18);
      v29 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v28 + 56);
      v24 = v27;
      v30 = v29;
      v29(v17, 0, 1, v18);
    }
    else
    {
      v30 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v77 + 56);
      v30(v17, 1, 1, v18);
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v77 + 48))(v17, 1, v18) != 1)
    {
      v35 = (*(uint64_t (**)(char *, char *, uint64_t))(v77 + 32))(v76, v17, v18);
      goto LABEL_21;
    }
  }
  else
  {
    v30 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v77 + 56);
    v30(v17, 1, 1, v18);
  }
  sub_23B6B772C((uint64_t)v17, (uint64_t *)&unk_254300550);
  swift_beginAccess();
  v31 = *(_QWORD *)(v4 + 136);
  if (*(_QWORD *)(v31 + 16))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v32 = sub_23B6B5E60(v78, a2);
    if ((v33 & 1) != 0)
    {
      (*(void (**)(char *, unint64_t, uint64_t))(v77 + 16))(v15, *(_QWORD *)(v31 + 56) + *(_QWORD *)(v77 + 72) * v32, v18);
      v34 = 0;
    }
    else
    {
      v34 = 1;
    }
    v30(v15, v34, 1, v18);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v77 + 48))(v15, 1, v18) == 1)
      goto LABEL_14;
    v35 = (*(uint64_t (**)(char *, char *, uint64_t))(v77 + 32))(v76, v15, v18);
LABEL_21:
    p_superclass = _TtCC19FindMyDaemonSupport11APNSManagerP33_69672C9E20C2D053F65B88CE8A65B96022PushDelegateTrampoline.superclass;
    v46 = v74;
    goto LABEL_22;
  }
  v30(v15, 1, 1, v18);
LABEL_14:
  v67 = v4 + 136;
  sub_23B6B772C((uint64_t)v15, (uint64_t *)&unk_254300550);
  if (qword_254300490 != -1)
    swift_once();
  v68 = v30;
  v70 = v6;
  v36 = sub_23B6E0668();
  __swift_project_value_buffer(v36, (uint64_t)qword_254300470);
  swift_bridgeObjectRetain_n();
  v37 = sub_23B6E0650();
  v38 = sub_23B6E08C0();
  if (os_log_type_enabled(v37, v38))
  {
    v39 = (uint8_t *)swift_slowAlloc();
    v40 = swift_slowAlloc();
    v71 = v8;
    v41 = v40;
    v81[0] = v40;
    *(_DWORD *)v39 = 136315138;
    swift_bridgeObjectRetain();
    v80 = sub_23B6BE8C4(v78, a2, v81);
    sub_23B6E0920();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_23B6B3000, v37, v38, "Creating base AsyncStream for DistributedNotification name: %s", v39, 0xCu);
    swift_arrayDestroy();
    v42 = v41;
    v8 = v71;
    MEMORY[0x23B86B840](v42, -1, -1);
    MEMORY[0x23B86B840](v39, -1, -1);

  }
  else
  {

    v43 = swift_bridgeObjectRelease_n();
  }
  MEMORY[0x24BDAC7A8](v43);
  v44 = v78;
  *(&v67 - 4) = v4;
  *(&v67 - 3) = v44;
  *(&v67 - 2) = a2;
  v71 = (char *)a2;
  v45 = v24;
  v6 = v70;
  v46 = v74;
  (*(void (**)(char *, _QWORD, uint64_t))(v70 + 104))(v8, *v24, v74);
  v47 = v72;
  sub_23B6E0818();
  v69 = v4;
  v48 = v76;
  v49 = v77;
  v50 = *(void (**)(char *, char *, uint64_t))(v77 + 16);
  v50(v76, v47, v18);
  v51 = (uint64_t)v73;
  v50(v73, v48, v18);
  v68((char *)v51, 0, 1, v18);
  swift_beginAccess();
  swift_bridgeObjectRetain();
  v52 = v51;
  v24 = v45;
  a2 = (uint64_t)v71;
  sub_23B6BB97C(v52, v78, (uint64_t)v71);
  swift_endAccess();
  v53 = *(uint64_t (**)(char *, uint64_t))(v49 + 8);
  v4 = v69;
  v35 = v53(v47, v18);
  p_superclass = (__objc2_class **)(_TtCC19FindMyDaemonSupport11APNSManagerP33_69672C9E20C2D053F65B88CE8A65B96022PushDelegateTrampoline
                                  + 8);
LABEL_22:
  MEMORY[0x24BDAC7A8](v35);
  v55 = v78;
  *(&v67 - 4) = v4;
  *(&v67 - 3) = v55;
  *(&v67 - 2) = a2;
  (*(void (**)(char *, _QWORD, uint64_t))(v6 + 104))(v8, *v24, v46);
  sub_23B6E0818();
  swift_beginAccess();
  v56 = *(_QWORD *)(v4 + 152);
  if (*(_QWORD *)(v56 + 16))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v57 = sub_23B6B5E60(v78, a2);
    if ((v58 & 1) != 0)
    {
      v59 = *(_QWORD *)(*(_QWORD *)(v56 + 56) + 8 * v57);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v60 = *(_QWORD *)(v59 + 16);
      swift_bridgeObjectRelease();
      goto LABEL_27;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  v60 = 0;
LABEL_27:
  if (p_superclass[146] != (__objc2_class *)-1)
    swift_once();
  v61 = sub_23B6E0668();
  __swift_project_value_buffer(v61, (uint64_t)qword_254300470);
  swift_bridgeObjectRetain_n();
  v62 = sub_23B6E0650();
  v63 = sub_23B6E08C0();
  if (os_log_type_enabled(v62, v63))
  {
    v64 = swift_slowAlloc();
    v65 = swift_slowAlloc();
    v80 = v65;
    *(_DWORD *)v64 = 136315394;
    swift_bridgeObjectRetain();
    v79 = sub_23B6BE8C4(v78, a2, &v80);
    sub_23B6E0920();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v64 + 12) = 2048;
    v79 = v60;
    sub_23B6E0920();
    _os_log_impl(&dword_23B6B3000, v62, v63, "Creating sub AsyncStream for DistributedNotification name: [%s], count: %ld", (uint8_t *)v64, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x23B86B840](v65, -1, -1);
    MEMORY[0x23B86B840](v64, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  return (*(uint64_t (**)(char *, uint64_t))(v77 + 8))(v76, v18);
}

uint64_t sub_23B6C006C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;

  v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254300530);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254300520);
  v11 = *(_QWORD *)(v10 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v9, a1, v10);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v9, 0, 1, v10);
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_23B6BB9A0((uint64_t)v9, a3, a4);
  return swift_endAccess();
}

uint64_t sub_23B6C0168(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  _QWORD *v12;
  char v13;
  char v14;
  uint64_t (*v15)();
  unint64_t *v16;
  uint64_t (*v17)();
  unint64_t *v18;
  unint64_t v19;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v21;
  unint64_t v22;
  unint64_t v24;
  uint64_t v25;
  char v26;
  _QWORD v28[4];
  _BYTE v29[32];

  v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254300520);
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v28[-1] - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = (_QWORD *)(a2 + 152);
  swift_beginAccess();
  if (*(_QWORD *)(*(_QWORD *)(a2 + 152) + 16)
    && (swift_bridgeObjectRetain(),
        swift_bridgeObjectRetain(),
        sub_23B6B5E60(a3, a4),
        v14 = v13,
        swift_bridgeObjectRelease(),
        swift_bridgeObjectRelease(),
        (v14 & 1) != 0))
  {
    swift_bridgeObjectRetain();
    v15 = sub_23B6BAA30();
    v17 = sub_23B6C7034(v28, a3, a4);
    if (*v16)
    {
      v18 = v16;
      (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a1, v8);
      v19 = *v18;
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      *v18 = v19;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        v19 = sub_23B6C67D8(0, *(_QWORD *)(v19 + 16) + 1, 1, v19);
        *v18 = v19;
      }
      v22 = *(_QWORD *)(v19 + 16);
      v21 = *(_QWORD *)(v19 + 24);
      if (v22 >= v21 >> 1)
      {
        v19 = sub_23B6C67D8(v21 > 1, v22 + 1, 1, v19);
        *v18 = v19;
      }
      *(_QWORD *)(v19 + 16) = v22 + 1;
      (*(void (**)(unint64_t, char *, uint64_t))(v9 + 32))(v19+ ((*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80))+ *(_QWORD *)(v9 + 72) * v22, v11, v8);
    }
    ((void (*)(_QWORD *, _QWORD))v17)(v28, 0);
    swift_bridgeObjectRelease();
    return ((uint64_t (*)(_BYTE *, _QWORD))v15)(v29, 0);
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2543005B8);
    v24 = (*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
    v25 = swift_allocObject();
    *(_OWORD *)(v25 + 16) = xmmword_23B6E1680;
    (*(void (**)(unint64_t, uint64_t, uint64_t))(v9 + 16))(v25 + v24, a1, v8);
    swift_beginAccess();
    swift_bridgeObjectRetain();
    v26 = swift_isUniquelyReferenced_nonNull_native();
    v28[0] = *v12;
    *v12 = 0x8000000000000000;
    sub_23B6CFEC4(v25, a3, a4, v26);
    *v12 = v28[0];
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_endAccess();
  }
}

uint64_t DistributedNotificationHandler.deinit()
{
  uint64_t v0;

  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_defaultActor_destroy();
  return v0;
}

uint64_t DistributedNotificationHandler.__deallocating_deinit()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_defaultActor_destroy();
  return swift_defaultActor_deallocate();
}

uint64_t DistributedNotificationHandler.unownedExecutor.getter()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_23B6C04B8(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;

  v2[11] = a1;
  v2[12] = v1;
  v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254300EF0);
  v2[13] = v3;
  v2[14] = *(_QWORD *)(v3 - 8);
  v2[15] = swift_task_alloc();
  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254300F30);
  v2[16] = v4;
  v2[17] = *(_QWORD *)(v4 - 8);
  v2[18] = swift_task_alloc();
  v2[19] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23B6C0558()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
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
  _QWORD *v19;
  int isUniquelyReferenced_nonNull_native;
  _QWORD *v21;
  char v22;
  unint64_t v23;
  uint64_t v24;
  _BOOL8 v25;
  uint64_t result;
  char v27;
  unint64_t v28;
  char v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  BOOL v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unsigned int v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t *v42;
  uint64_t v43;
  uint64_t *v44;
  _QWORD *v45;

  v1 = *(_QWORD *)(*(_QWORD *)(v0 + 88) + 16);
  if (v1)
  {
    v41 = *(_QWORD *)(v0 + 136);
    v40 = *(_QWORD *)(v0 + 112);
    v44 = (uint64_t *)(*(_QWORD *)(v0 + 96) + 120);
    v39 = *MEMORY[0x24BEE6A10];
    v2 = (unint64_t *)(swift_bridgeObjectRetain() + 40);
    v38 = v1;
    while (1)
    {
      v5 = *(v2 - 1);
      v6 = *v2;
      v7 = qword_254300490;
      swift_bridgeObjectRetain();
      if (v7 != -1)
        swift_once();
      v8 = sub_23B6E0668();
      __swift_project_value_buffer(v8, (uint64_t)qword_254300470);
      swift_bridgeObjectRetain_n();
      v9 = sub_23B6E0650();
      v10 = sub_23B6E08C0();
      v42 = v2;
      v43 = v1;
      if (os_log_type_enabled(v9, v10))
      {
        v11 = swift_slowAlloc();
        v12 = swift_slowAlloc();
        v45 = (_QWORD *)v12;
        *(_DWORD *)v11 = 136446210;
        swift_bridgeObjectRetain();
        *(_QWORD *)(v11 + 4) = sub_23B6BE8C4(v5, v6, (uint64_t *)&v45);
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_23B6B3000, v9, v10, "Creating base AsyncStream for registered Distributed notification name: %{public}s", (uint8_t *)v11, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x23B86B840](v12, -1, -1);
        MEMORY[0x23B86B840](v11, -1, -1);
      }
      else
      {
        swift_bridgeObjectRelease_n();
      }

      v14 = *(_QWORD *)(v0 + 144);
      v13 = *(_QWORD *)(v0 + 152);
      v16 = *(_QWORD *)(v0 + 120);
      v15 = *(_QWORD *)(v0 + 128);
      v17 = *(_QWORD *)(v0 + 96);
      v18 = *(_QWORD *)(v0 + 104);
      v19 = (_QWORD *)swift_task_alloc();
      v19[2] = v17;
      v19[3] = v5;
      v19[4] = v6;
      (*(void (**)(uint64_t, _QWORD, uint64_t))(v40 + 104))(v16, v39, v18);
      sub_23B6E0818();
      swift_task_dealloc();
      swift_beginAccess();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v41 + 16))(v14, v13, v15);
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v45 = (_QWORD *)*v44;
      v21 = v45;
      *v44 = 0x8000000000000000;
      v23 = sub_23B6B5E60(v5, v6);
      v24 = v21[2];
      v25 = (v22 & 1) == 0;
      result = v24 + v25;
      if (__OFADD__(v24, v25))
        break;
      v27 = v22;
      if (v21[3] >= result)
      {
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        {
          sub_23B6DD2AC();
          v21 = v45;
        }
      }
      else
      {
        sub_23B6DBB40(result, isUniquelyReferenced_nonNull_native);
        v21 = v45;
        v28 = sub_23B6B5E60(v5, v6);
        if ((v27 & 1) != (v29 & 1))
          return sub_23B6E0AAC();
        v23 = v28;
      }
      v30 = *(_QWORD *)(v0 + 144);
      v31 = *(_QWORD *)(v0 + 128);
      if ((v27 & 1) != 0)
      {
        (*(void (**)(unint64_t, uint64_t, uint64_t))(v41 + 40))(v21[7] + *(_QWORD *)(v41 + 72) * v23, v30, v31);
      }
      else
      {
        v21[(v23 >> 6) + 8] |= 1 << v23;
        v32 = (uint64_t *)(v21[6] + 16 * v23);
        *v32 = v5;
        v32[1] = v6;
        result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v41 + 32))(v21[7] + *(_QWORD *)(v41 + 72) * v23, v30, v31);
        v33 = v21[2];
        v34 = __OFADD__(v33, 1);
        v35 = v33 + 1;
        if (v34)
          goto LABEL_25;
        v21[2] = v35;
        swift_bridgeObjectRetain();
      }
      v3 = *(_QWORD *)(v0 + 152);
      v4 = *(_QWORD *)(v0 + 128);
      *v44 = (uint64_t)v21;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_endAccess();
      (*(void (**)(uint64_t, uint64_t))(v41 + 8))(v3, v4);
      v2 = v42 + 2;
      v1 = v43 - 1;
      if (v43 == 1)
      {
        swift_bridgeObjectRelease();
        v1 = v38;
        goto LABEL_20;
      }
    }
    __break(1u);
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
LABEL_20:
  v36 = *(_QWORD *)(v0 + 96);
  result = swift_beginAccess();
  if (*(_QWORD *)(*(_QWORD *)(v36 + 120) + 16) != v1)
  {
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  v37 = *(_QWORD *)(v0 + 96);
  result = swift_beginAccess();
  if (*(_QWORD *)(*(_QWORD *)(v37 + 128) + 16) == v1)
  {
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
LABEL_27:
  __break(1u);
  return result;
}

uint64_t sub_23B6C09DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;

  v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254300530);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254300520);
  v11 = *(_QWORD *)(v10 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v9, a1, v10);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v9, 0, 1, v10);
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_23B6BB9A0((uint64_t)v9, a3, a4);
  return swift_endAccess();
}

uint64_t sub_23B6C0AD8()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  v1[20] = v0;
  v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254300F20);
  v1[21] = v2;
  v1[22] = *(_QWORD *)(v2 - 8);
  v1[23] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254300990);
  v1[24] = swift_task_alloc();
  v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254300F40);
  v1[25] = v3;
  v1[26] = *(_QWORD *)(v3 - 8);
  v1[27] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23B6C0B8C()
{
  uint64_t v0;

  if ((MEMORY[0x23B86AD48]() & 1) != 0)
  {
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    *(_QWORD *)(v0 + 224) = *(_QWORD *)(*(_QWORD *)(v0 + 160) + 112);
    return swift_task_switch();
  }
}

uint64_t sub_23B6C0C00()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;

  v1 = v0[28];
  swift_beginAccess();
  v2 = *(_QWORD *)(v1 + 120);
  if (*(_QWORD *)(v2 + 16))
  {
    swift_bridgeObjectRetain();
    v3 = sub_23B6B5E60(0xD00000000000001CLL, 0x800000023B6E2000);
    v4 = v0[25];
    v5 = v0[26];
    v6 = v0[24];
    if ((v7 & 1) != 0)
    {
      (*(void (**)(_QWORD, unint64_t, _QWORD))(v5 + 16))(v0[24], *(_QWORD *)(v2 + 56) + *(_QWORD *)(v5 + 72) * v3, v0[25]);
      (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v5 + 56))(v6, 0, 1, v4);
    }
    else
    {
      (*(void (**)(_QWORD, uint64_t, uint64_t, uint64_t))(v5 + 56))(v0[24], 1, 1, v4);
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    (*(void (**)(_QWORD, uint64_t, uint64_t, _QWORD))(v0[26] + 56))(v0[24], 1, 1, v0[25]);
  }
  return swift_task_switch();
}

uint64_t sub_23B6C0CF8()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  _QWORD *v6;

  v1 = v0[25];
  v2 = v0[26];
  v3 = v0[24];
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v3, 1, v1) == 1)
  {
    sub_23B6B772C(v3, &qword_254300990);
    sub_23B6E098C();
    swift_bridgeObjectRelease();
    return sub_23B6E0A04();
  }
  else
  {
    (*(void (**)(_QWORD, uint64_t, uint64_t))(v2 + 32))(v0[27], v3, v1);
    sub_23B6E0800();
    v0[29] = sub_23B6B8FBC(&qword_254300828, v5, (uint64_t (*)(uint64_t))type metadata accessor for DistributedNotificationHandler, (uint64_t)&protocol conformance descriptor for DistributedNotificationHandler);
    v6 = (_QWORD *)swift_task_alloc();
    v0[30] = v6;
    *v6 = v0;
    v6[1] = sub_23B6C0E7C;
    return sub_23B6E080C();
  }
}

uint64_t sub_23B6C0E7C()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23B6C0ED4()
{
  uint64_t v0;
  uint64_t v1;
  _OWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  NSObject *v22;
  os_log_type_t v23;
  _BOOL4 v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint8_t *v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  _QWORD *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;

  v1 = *(_QWORD *)(v0 + 120);
  if (!v1)
  {
    v9 = *(_QWORD *)(v0 + 208);
    v8 = *(_QWORD *)(v0 + 216);
    v10 = *(_QWORD *)(v0 + 200);
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 176) + 8))(*(_QWORD *)(v0 + 184), *(_QWORD *)(v0 + 168));
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v8, v10);
LABEL_23:
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  v2 = (_OWORD *)(v0 + 16);
  v3 = *(_QWORD *)(v0 + 128);
  if (qword_2543000E0 != -1)
  {
    swift_once();
    if (*(_QWORD *)(v1 + 16))
      goto LABEL_4;
LABEL_10:
    *v2 = 0u;
    *(_OWORD *)(v0 + 32) = 0u;
    goto LABEL_11;
  }
  if (!*(_QWORD *)(v1 + 16))
    goto LABEL_10;
LABEL_4:
  v4 = qword_254301370;
  v5 = qword_254301368;
  swift_bridgeObjectRetain();
  v6 = sub_23B6B5E60(v5, v4);
  if ((v7 & 1) != 0)
  {
    sub_23B6B5E24(*(_QWORD *)(v1 + 56) + 32 * v6, v0 + 16);
  }
  else
  {
    *v2 = 0u;
    *(_OWORD *)(v0 + 32) = 0u;
  }
  swift_bridgeObjectRelease();
LABEL_11:
  swift_bridgeObjectRelease();
  if (!*(_QWORD *)(v0 + 40))
  {
    sub_23B6B772C(v0 + 16, &qword_256A46DE0);
    goto LABEL_18;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2543005D0);
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_18:
    if (qword_254300490 != -1)
      swift_once();
    v21 = sub_23B6E0668();
    __swift_project_value_buffer(v21, (uint64_t)qword_254300470);
    v22 = sub_23B6E0650();
    v23 = sub_23B6E08A8();
    v24 = os_log_type_enabled(v22, v23);
    v26 = *(_QWORD *)(v0 + 208);
    v25 = *(_QWORD *)(v0 + 216);
    v27 = *(_QWORD *)(v0 + 200);
    v29 = *(_QWORD *)(v0 + 176);
    v28 = *(_QWORD *)(v0 + 184);
    v30 = *(_QWORD *)(v0 + 168);
    if (v24)
    {
      v40 = *(_QWORD *)(v0 + 216);
      v31 = (uint8_t *)swift_slowAlloc();
      v39 = v27;
      v32 = swift_slowAlloc();
      *(_DWORD *)v31 = 136315138;
      v41 = v32;
      v37 = v30;
      v38 = v28;
      v33 = qword_254301368;
      v34 = qword_254301370;
      swift_bridgeObjectRetain();
      *(_QWORD *)(v0 + 152) = sub_23B6BE8C4(v33, v34, &v41);
      sub_23B6E0920();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_23B6B3000, v22, v23, "Event missing \"%s\" key!", v31, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x23B86B840](v32, -1, -1);
      MEMORY[0x23B86B840](v31, -1, -1);

      swift_release();
      (*(void (**)(uint64_t, uint64_t))(v29 + 8))(v38, v37);
      (*(void (**)(uint64_t, uint64_t))(v26 + 8))(v40, v39);
    }
    else
    {

      swift_release();
      (*(void (**)(uint64_t, uint64_t))(v29 + 8))(v28, v30);
      (*(void (**)(uint64_t, uint64_t))(v26 + 8))(v25, v27);
    }
    goto LABEL_23;
  }
  v11 = *(_QWORD *)(v0 + 136);
  v12 = *(_QWORD *)(v0 + 144);
  v13 = qword_254300490;
  swift_retain();
  if (v13 != -1)
    swift_once();
  v14 = sub_23B6E0668();
  __swift_project_value_buffer(v14, (uint64_t)qword_254300470);
  swift_bridgeObjectRetain_n();
  swift_retain_n();
  v15 = sub_23B6E0650();
  v16 = sub_23B6E08C0();
  if (os_log_type_enabled(v15, v16))
  {
    v17 = swift_slowAlloc();
    v18 = swift_slowAlloc();
    v41 = v18;
    *(_DWORD *)v17 = 136446210;
    *(_QWORD *)(v0 + 48) = v11;
    *(_QWORD *)(v0 + 56) = v12;
    *(_QWORD *)(v0 + 64) = v3;
    v19 = DistributedNotification.description.getter();
    *(_QWORD *)(v17 + 4) = sub_23B6BE8C4(v19, v20, &v41);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    swift_release_n();
    _os_log_impl(&dword_23B6B3000, v15, v16, "XPCEventStream notification: %{public}s", (uint8_t *)v17, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B86B840](v18, -1, -1);
    MEMORY[0x23B86B840](v17, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
    swift_release_n();
  }

  *(_QWORD *)(v0 + 96) = v11;
  *(_QWORD *)(v0 + 104) = v12;
  *(_QWORD *)(v0 + 112) = v3;
  sub_23B6C1410((uint64_t *)(v0 + 96), v3);
  swift_release_n();
  swift_bridgeObjectRelease();
  v36 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 240) = v36;
  *v36 = v0;
  v36[1] = sub_23B6C0E7C;
  return sub_23B6E080C();
}

uint64_t DistributedNotification.init(name:transaction:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _QWORD *a4@<X8>)
{
  *a4 = result;
  a4[1] = a2;
  a4[2] = a3;
  return result;
}

void sub_23B6C1410(uint64_t *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  NSObject *v18;
  os_log_type_t v19;
  uint8_t *v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_254301350);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *a1;
  v8 = a1[1];
  v10 = a1[2];
  swift_beginAccess();
  v11 = *(_QWORD *)(v2 + 152);
  if (*(_QWORD *)(v11 + 16))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v12 = sub_23B6B5E60(v9, v8);
    if ((v13 & 1) != 0)
    {
      v14 = *(_QWORD *)(*(_QWORD *)(v11 + 56) + 8 * v12);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v15 = sub_23B6E07DC();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56))(v7, 1, 1, v15);
      v16 = (_QWORD *)swift_allocObject();
      v16[2] = 0;
      v16[3] = 0;
      v16[4] = a2;
      v16[5] = v14;
      v16[6] = v9;
      v16[7] = v8;
      v16[8] = v10;
      swift_retain();
      swift_bridgeObjectRetain();
      swift_retain();
      sub_23B6C71B0((uint64_t)v7, (uint64_t)&unk_256A46DF0, (uint64_t)v16);
      swift_release();
      return;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  if (qword_254300490 != -1)
    swift_once();
  v17 = sub_23B6E0668();
  __swift_project_value_buffer(v17, (uint64_t)qword_254300470);
  swift_bridgeObjectRetain_n();
  swift_retain_n();
  v18 = sub_23B6E0650();
  v19 = sub_23B6E08B4();
  if (os_log_type_enabled(v18, v19))
  {
    v20 = (uint8_t *)swift_slowAlloc();
    v21 = swift_slowAlloc();
    *(_DWORD *)v20 = 136446210;
    v27 = v10;
    v28 = v21;
    v25 = v9;
    v26 = v8;
    v22 = DistributedNotification.description.getter();
    v25 = sub_23B6BE8C4(v22, v23, &v28);
    sub_23B6E0920();
    swift_release_n();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23B6B3000, v18, v19, "Received notification %{public}s with no subscribers!", v20, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B86B840](v21, -1, -1);
    MEMORY[0x23B86B840](v20, -1, -1);

  }
  else
  {

    swift_release_n();
    swift_bridgeObjectRelease_n();
  }
}

uint64_t sub_23B6C1710(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;

  v8[18] = a7;
  v8[19] = a8;
  v8[16] = a5;
  v8[17] = a6;
  v8[15] = a4;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_254300508);
  v8[20] = v9;
  v8[21] = *(_QWORD *)(v9 - 8);
  v8[22] = swift_task_alloc();
  v10 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254300520);
  v8[23] = v10;
  v8[24] = *(_QWORD *)(v10 - 8);
  v8[25] = swift_task_alloc();
  if (qword_254300F80 != -1)
    swift_once();
  swift_beginAccess();
  return swift_task_switch();
}

uint64_t sub_23B6C17EC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t result;

  v1 = qword_254300FA8;
  *(_QWORD *)(v0 + 208) = qword_254300FA8;
  if (v1)
  {
    swift_retain();
    return swift_task_switch();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_23B6C183C()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 216) = *(_QWORD *)(*(_QWORD *)(v0 + 208) + 128);
  swift_retain();
  return swift_task_switch();
}

uint64_t sub_23B6C1884()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t i;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t ObjectType;
  uint64_t (*v9)(uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v20;

  v1 = v0[27];
  swift_beginAccess();
  v2 = *(_QWORD *)(v1 + 112);
  v0[28] = v2;
  v3 = *(_QWORD *)(v2 + 16);
  v0[29] = v3;
  if (!v3)
  {
LABEL_10:
    swift_release();
    swift_release();
    return swift_task_switch();
  }
  swift_bridgeObjectRetain();
  swift_beginAccess();
  for (i = 0; ; i = v0[30] + 1)
  {
    v0[30] = i;
    v5 = v0[27];
    v6 = v0[28] + 16 * i;
    v0[31] = *(_QWORD *)(v6 + 32);
    v7 = *(_QWORD *)(v6 + 40);
    ObjectType = swift_getObjectType();
    v9 = *(uint64_t (**)(uint64_t, uint64_t))(v7 + 24);
    swift_unknownObjectRetain();
    v10 = v9(ObjectType, v7);
    v12 = v11;
    v0[32] = v11;
    if (!*(_QWORD *)(*(_QWORD *)(v5 + 128) + 16))
      goto LABEL_6;
    v13 = v10;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_23B6B5E60(v13, v12);
    if ((v14 & 1) != 0)
      break;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
LABEL_6:
    swift_bridgeObjectRelease();
    v15 = v0[30];
    v16 = v0[29];
    swift_unknownObjectRelease();
    if (v15 + 1 == v16)
    {
      swift_bridgeObjectRelease();
      goto LABEL_10;
    }
  }
  v18 = v0[27];
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_23B6B8FBC((unint64_t *)&qword_254301320, 255, (uint64_t (*)(uint64_t))type metadata accessor for ActorServiceCollection, (uint64_t)&protocol conformance descriptor for ActorServiceCollection);
  v19 = (_QWORD *)swift_task_alloc();
  v0[33] = v19;
  v19[2] = v18;
  v19[3] = v13;
  v19[4] = v12;
  v20 = (_QWORD *)swift_task_alloc();
  v0[34] = v20;
  *v20 = v0;
  v20[1] = sub_23B6C1C4C;
  return sub_23B6E0A94();
}

uint64_t sub_23B6C1AB4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v14)(uint64_t, unint64_t, uint64_t);
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v2 = *(_QWORD *)(v0 + 120);
  v1 = *(_QWORD *)(v0 + 128);
  sub_23B6E050C();
  sub_23B6E04F4();
  *(_QWORD *)(v0 + 112) = v2;
  swift_retain_n();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2543005E0);
  swift_task_localValuePush();
  v3 = *(_QWORD *)(v1 + 16);
  if (v3)
  {
    v4 = *(_QWORD *)(v0 + 192);
    v16 = *(_QWORD *)(v0 + 168);
    v5 = *(_QWORD *)(v0 + 128)
       + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
    v15 = *(_QWORD *)(v4 + 72);
    v17 = v4;
    v14 = *(void (**)(uint64_t, unint64_t, uint64_t))(v4 + 16);
    swift_bridgeObjectRetain();
    do
    {
      v6 = *(_QWORD *)(v0 + 200);
      v8 = *(_QWORD *)(v0 + 176);
      v7 = *(_QWORD *)(v0 + 184);
      v10 = *(_QWORD *)(v0 + 152);
      v9 = *(_QWORD *)(v0 + 160);
      v11 = *(_QWORD *)(v0 + 136);
      v12 = *(_QWORD *)(v0 + 144);
      v14(v6, v5, v7);
      *(_QWORD *)(v0 + 88) = v11;
      *(_QWORD *)(v0 + 96) = v12;
      *(_QWORD *)(v0 + 104) = v10;
      swift_bridgeObjectRetain();
      swift_retain();
      sub_23B6E07F4();
      (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v8, v9);
      (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v6, v7);
      v5 += v15;
      --v3;
    }
    while (v3);
    swift_bridgeObjectRelease();
  }
  swift_task_localValuePop();
  swift_release();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23B6C1C4C()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 280) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23B6C1CC0()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t ObjectType;
  uint64_t (*v8)(uint64_t, uint64_t);
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;

  while (1)
  {
    do
    {
      swift_bridgeObjectRelease();
      v1 = v0[30];
      v2 = v0[29];
      swift_unknownObjectRelease();
      if (v1 + 1 == v2)
      {
        swift_release();
        swift_bridgeObjectRelease();
        swift_release();
        return swift_task_switch();
      }
      v3 = v0[30] + 1;
      v0[30] = v3;
      v4 = v0[27];
      v5 = v0[28] + 16 * v3;
      v0[31] = *(_QWORD *)(v5 + 32);
      v6 = *(_QWORD *)(v5 + 40);
      ObjectType = swift_getObjectType();
      v8 = *(uint64_t (**)(uint64_t, uint64_t))(v6 + 24);
      swift_unknownObjectRetain();
      v9 = v8(ObjectType, v6);
      v11 = v10;
      v0[32] = v10;
    }
    while (!*(_QWORD *)(*(_QWORD *)(v4 + 128) + 16));
    v12 = v9;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_23B6B5E60(v12, v11);
    if ((v13 & 1) != 0)
      break;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  v15 = v0[27];
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_23B6B8FBC((unint64_t *)&qword_254301320, 255, (uint64_t (*)(uint64_t))type metadata accessor for ActorServiceCollection, (uint64_t)&protocol conformance descriptor for ActorServiceCollection);
  v16 = (_QWORD *)swift_task_alloc();
  v0[33] = v16;
  v16[2] = v15;
  v16[3] = v12;
  v16[4] = v11;
  v17 = (_QWORD *)swift_task_alloc();
  v0[34] = v17;
  *v17 = v0;
  v17[1] = sub_23B6C1C4C;
  return sub_23B6E0A94();
}

uint64_t sub_23B6C1EA0()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_unknownObjectRelease();
  return swift_task_switch();
}

uint64_t sub_23B6C1F04()
{
  swift_release();
  return swift_task_switch();
}

uint64_t sub_23B6C1F40()
{
  uint64_t v0;

  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23B6C1F88()
{
  uint64_t v0;

  v0 = sub_23B6E0668();
  __swift_allocate_value_buffer(v0, qword_2543004C8);
  __swift_project_value_buffer(v0, (uint64_t)qword_2543004C8);
  return sub_23B6E065C();
}

uint64_t sub_23B6C2008()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t result;
  uint64_t v6;
  _QWORD aBlock[6];
  uint64_t v8;

  v8 = MEMORY[0x24BEE4AF8];
  v0 = xpc_copy_event();
  if (!v0)
  {
    v6 = MEMORY[0x24BEE4AF8];
    swift_bridgeObjectRelease();
    return v6;
  }
  v1 = (void *)v0;
  v2 = swift_allocObject();
  *(_QWORD *)(v2 + 16) = &v8;
  v3 = swift_allocObject();
  *(_QWORD *)(v3 + 16) = sub_23B6BF1E0;
  *(_QWORD *)(v3 + 24) = v2;
  aBlock[4] = sub_23B6BF1F8;
  aBlock[5] = v3;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_23B6CE590;
  aBlock[3] = &block_descriptor_0;
  v4 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  xpc_dictionary_apply(v1, v4);
  swift_unknownObjectRelease();
  _Block_release(v4);
  LOBYTE(v1) = swift_isEscapingClosureAtFileLocation();
  result = swift_release();
  if ((v1 & 1) == 0)
  {
    v6 = v8;
    swift_release();
    return v6;
  }
  __break(1u);
  return result;
}

uint64_t DistributedNotification.name.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t DistributedNotification.transaction.getter()
{
  return swift_retain();
}

uint64_t DistributedNotification.description.getter()
{
  sub_23B6C22F8();
  sub_23B6E0A4C();
  sub_23B6E071C();
  swift_bridgeObjectRelease();
  sub_23B6E071C();
  swift_bridgeObjectRetain();
  sub_23B6E071C();
  swift_bridgeObjectRelease();
  sub_23B6E071C();
  sub_23B6E050C();
  sub_23B6B8FBC((unint64_t *)&unk_254300430, 255, (uint64_t (*)(uint64_t))MEMORY[0x24BE317C0], MEMORY[0x24BE317D0]);
  swift_retain();
  sub_23B6E0A64();
  sub_23B6E071C();
  swift_release();
  swift_bridgeObjectRelease();
  sub_23B6E071C();
  return 91;
}

uint64_t sub_23B6C22E0(uint64_t a1)
{
  uint64_t *v1;

  return sub_23B6C006C(a1, v1[2], v1[3], v1[4]);
}

uint64_t sub_23B6C22EC(uint64_t a1)
{
  uint64_t *v1;

  return sub_23B6C0168(a1, v1[2], v1[3], v1[4]);
}

unint64_t sub_23B6C22F8()
{
  unint64_t result;

  result = qword_2543000E8[0];
  if (!qword_2543000E8[0])
  {
    result = MEMORY[0x23B86B7BC](&protocol conformance descriptor for DistributedNotification, &type metadata for DistributedNotification);
    atomic_store(result, qword_2543000E8);
  }
  return result;
}

uint64_t type metadata accessor for DistributedNotificationHandler()
{
  return objc_opt_self();
}

uint64_t method lookup function for DistributedNotificationHandler()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of DistributedNotificationHandler.__allocating_init(eventStreamHandler:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 256))();
}

uint64_t dispatch thunk of DistributedNotificationHandler.asyncStream(name:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 264))();
}

uint64_t destroy for DistributedNotification()
{
  swift_bridgeObjectRelease();
  return swift_release();
}

_QWORD *_s19FindMyDaemonSupport23DistributedNotificationVwCP_0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

_QWORD *assignWithCopy for DistributedNotification(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_retain();
  swift_release();
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

uint64_t assignWithTake for DistributedNotification(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for DistributedNotification(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 24))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for DistributedNotification(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 24) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for DistributedNotification()
{
  return &type metadata for DistributedNotification;
}

uint64_t sub_23B6C2538()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23B6C257C(uint64_t a1)
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
  v11[1] = sub_23B6B8F74;
  return sub_23B6C1710(a1, v4, v5, v6, v7, v8, v9, v10);
}

uint64_t sub_23B6C2610(uint64_t a1)
{
  uint64_t *v1;

  return sub_23B6C09DC(a1, v1[2], v1[3], v1[4]);
}

uint64_t sub_23B6C261C()
{
  return swift_deallocObject();
}

uint64_t sub_23B6C262C()
{
  return swift_deallocObject();
}

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

uint64_t sub_23B6C2644(uint64_t a1)
{
  return sub_23B6C4308(a1, qword_2543013D8);
}

uint64_t sub_23B6C2650()
{
  uint64_t v0;

  swift_beginAccess();
  return *(unsigned __int8 *)(v0 + 200);
}

uint64_t sub_23B6C2680(char a1)
{
  uint64_t v1;
  uint64_t result;

  result = swift_beginAccess();
  *(_BYTE *)(v1 + 200) = a1;
  return result;
}

uint64_t (*sub_23B6C26BC())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

void APNSManager.__allocating_init(environmentName:delegatePort:)()
{
  uint64_t v0;
  _QWORD *v1;

  swift_allocObject();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_23B6C5F04;
  APNSManager.init(environmentName:delegatePort:)();
}

void APNSManager.init(environmentName:delegatePort:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v2 = v0;
  *(_QWORD *)(v1 + 32) = v0;
  v3 = sub_23B6E068C();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = swift_task_alloc();
  *(_QWORD *)(v1 + 40) = v5;
  swift_defaultActor_initialize();
  *(_OWORD *)(v0 + 168) = 0u;
  *(_OWORD *)(v0 + 152) = 0u;
  *(_OWORD *)(v0 + 136) = 0u;
  *(_OWORD *)(v0 + 120) = 0u;
  v6 = MEMORY[0x24BEE4B00];
  *(_QWORD *)(v0 + 184) = 0;
  *(_QWORD *)(v0 + 192) = v6;
  *(_BYTE *)(v0 + 200) = 0;
  sub_23B6C58C0(0, qword_2543009E8);
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v4 + 104))(v5, *MEMORY[0x24BEE5490], v3);
  v7 = (void *)sub_23B6E08CC();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v5, v3);
  v8 = objc_allocWithZone(MEMORY[0x24BE08738]);
  v9 = (void *)sub_23B6E06E0();
  swift_bridgeObjectRelease();
  v10 = (void *)sub_23B6E06E0();
  swift_bridgeObjectRelease();
  v11 = objc_msgSend(v8, sel_initWithEnvironmentName_namedDelegatePort_queue_, v9, v10, v7);

  if (v11)
  {
    *(_QWORD *)(v2 + 112) = v11;
    swift_task_switch();
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_23B6C290C()
{
  uint64_t v0;
  uint64_t v1;
  objc_class *v2;
  id v3;
  id v4;
  void *v5;

  v1 = *(_QWORD *)(v0 + 32);
  v2 = (objc_class *)type metadata accessor for APNSManager.PushDelegateTrampoline();
  v3 = objc_allocWithZone(v2);
  swift_weakInit();
  swift_weakAssign();
  *(_QWORD *)(v0 + 16) = v3;
  *(_QWORD *)(v0 + 24) = v2;
  v4 = objc_msgSendSuper2((objc_super *)(v0 + 16), sel_init);
  v5 = *(void **)(v1 + 120);
  *(_QWORD *)(v1 + 120) = v4;

  objc_msgSend(*(id *)(v1 + 112), sel_setDelegate_, *(_QWORD *)(v1 + 120));
  swift_task_dealloc();
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(_QWORD *)(v0 + 32));
}

uint64_t type metadata accessor for APNSManager.PushDelegateTrampoline()
{
  return objc_opt_self();
}

uint64_t sub_23B6C29D0()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = v0;
  return swift_task_switch();
}

id sub_23B6C29E8()
{
  uint64_t v0;
  id result;
  void *v2;
  uint64_t v3;

  result = objc_msgSend(*(id *)(*(_QWORD *)(v0 + 16) + 112), sel_enabledTopics);
  if (result)
  {
    v2 = result;
    v3 = sub_23B6E0794();

    return (id)(*(uint64_t (**)(uint64_t))(v0 + 8))(v3);
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_23B6C2A50()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;

  v1 = v0;
  if (qword_2543009B0 != -1)
    swift_once();
  v2 = sub_23B6E0668();
  __swift_project_value_buffer(v2, (uint64_t)qword_2543013D8);
  swift_bridgeObjectRetain_n();
  v3 = sub_23B6E0650();
  v4 = sub_23B6E08C0();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc();
    v6 = swift_slowAlloc();
    v13 = v6;
    *(_DWORD *)v5 = 136446210;
    v7 = swift_bridgeObjectRetain();
    v8 = MEMORY[0x23B86B018](v7, MEMORY[0x24BEE0D00]);
    v10 = v9;
    swift_bridgeObjectRelease();
    sub_23B6BE8C4(v8, v10, &v13);
    sub_23B6E0920();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23B6B3000, v3, v4, "enabledTopics: %{public}s", v5, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B86B840](v6, -1, -1);
    MEMORY[0x23B86B840](v5, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  v11 = *(void **)(v1 + 112);
  v12 = (void *)sub_23B6E0788();
  objc_msgSend(v11, sel__setEnabledTopics_, v12);

}

uint64_t sub_23B6C2C48()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v5;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_2543009A0);
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_allocObject();
  swift_weakInit();
  (*(void (**)(char *, _QWORD, uint64_t))(v1 + 104))(v3, *MEMORY[0x24BEE6A10], v0);
  sub_23B6E0818();
  return swift_release();
}

uint64_t sub_23B6C2D20(char *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  uint64_t result;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(char *, char *, uint64_t);
  void (*v32)(uint64_t, char *, uint64_t);
  uint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;

  v34 = a1;
  v1 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2543012F0);
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v35 = v3;
  v4 = (char *)&v28 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_254301350);
  MEMORY[0x24BDAC7A8](v5);
  v36 = (uint64_t)&v28 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_23B6E0644();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = *(_QWORD *)(v8 + 64);
  v10 = MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v28 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v28 - v12;
  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    v15 = result;
    sub_23B6E0638();
    v31 = *(void (**)(char *, char *, uint64_t))(v8 + 16);
    v31(v11, v13, v7);
    v28 = v4;
    v29 = v2;
    v16 = *(unsigned __int8 *)(v8 + 80);
    v33 = v8;
    v30 = v16 | 7;
    v17 = swift_allocObject();
    v18 = v1;
    *(_QWORD *)(v17 + 16) = v15;
    v32 = *(void (**)(uint64_t, char *, uint64_t))(v8 + 32);
    v32(v17 + ((v16 + 24) & ~v16), v11, v7);
    swift_retain();
    v19 = v34;
    sub_23B6E07E8();
    v20 = sub_23B6E07DC();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 56))(v36, 1, 1, v20);
    v21 = v28;
    v22 = v29;
    (*(void (**)(char *, char *, uint64_t))(v29 + 16))(v28, v19, v18);
    v31(v11, v13, v7);
    v23 = *(unsigned __int8 *)(v22 + 80);
    v34 = v13;
    v24 = v22;
    v25 = (v23 + 40) & ~v23;
    v26 = (v35 + v16 + v25) & ~v16;
    v27 = (char *)swift_allocObject();
    *((_QWORD *)v27 + 2) = 0;
    *((_QWORD *)v27 + 3) = 0;
    *((_QWORD *)v27 + 4) = v15;
    (*(void (**)(char *, char *, uint64_t))(v24 + 32))(&v27[v25], v21, v18);
    v32((uint64_t)&v27[v26], v11, v7);
    swift_retain();
    sub_23B6CE420(v36, (uint64_t)&unk_256A46F78, (uint64_t)v27);
    swift_release();
    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v33 + 8))(v34, v7);
  }
  return result;
}

uint64_t sub_23B6C2FE8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  unint64_t v12;
  char *v13;
  uint64_t v15;

  v5 = sub_23B6E0644();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(_QWORD *)(v6 + 64);
  MEMORY[0x24BDAC7A8](v5);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_254301350);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_23B6E07DC();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v10, 1, 1, v11);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))((char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), a3, v5);
  v12 = (*(unsigned __int8 *)(v6 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  v13 = (char *)swift_allocObject();
  *((_QWORD *)v13 + 2) = 0;
  *((_QWORD *)v13 + 3) = 0;
  *((_QWORD *)v13 + 4) = a2;
  (*(void (**)(char *, char *, uint64_t))(v6 + 32))(&v13[v12], (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), v5);
  swift_retain();
  sub_23B6CE420((uint64_t)v10, (uint64_t)&unk_256A46F88, (uint64_t)v13);
  return swift_release();
}

uint64_t sub_23B6C312C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;

  *(_QWORD *)(v5 + 16) = a4;
  *(_QWORD *)(v5 + 24) = a5;
  return swift_task_switch();
}

uint64_t sub_23B6C3144()
{
  uint64_t v0;

  sub_23B6C3174(*(_QWORD *)(v0 + 24));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23B6C3174(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint64_t v16;
  uint8_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint8_t *v22;
  uint64_t v23;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  void (*v30)(char *, uint64_t, uint64_t);
  uint64_t v31;
  uint64_t v32[3];

  v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254301300);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_23B6E0644();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v25 - v11;
  if (qword_2543009B0 != -1)
    swift_once();
  v13 = sub_23B6E0668();
  __swift_project_value_buffer(v13, (uint64_t)qword_2543013D8);
  v30 = *(void (**)(char *, uint64_t, uint64_t))(v7 + 16);
  v30(v12, a1, v6);
  v14 = sub_23B6E0650();
  v15 = sub_23B6E0890();
  if (os_log_type_enabled(v14, v15))
  {
    v16 = swift_slowAlloc();
    v27 = a1;
    v17 = (uint8_t *)v16;
    v18 = swift_slowAlloc();
    v29 = v1;
    v19 = v18;
    v32[0] = v18;
    v26 = v10;
    *(_DWORD *)v17 = 136446210;
    v28 = v5;
    sub_23B6C5DC4();
    v20 = sub_23B6E0A64();
    v31 = sub_23B6BE8C4(v20, v21, v32);
    v5 = v28;
    v10 = v26;
    sub_23B6E0920();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v12, v6);
    _os_log_impl(&dword_23B6B3000, v14, v15, "Removing connectionStateContinuation for %{public}s", v17, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B86B840](v19, -1, -1);
    v22 = v17;
    a1 = v27;
    MEMORY[0x23B86B840](v22, -1, -1);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v7 + 8))(v12, v6);
  }

  v30(v10, a1, v6);
  v23 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2543012F0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 56))(v5, 1, 1, v23);
  swift_beginAccess();
  sub_23B6BB9C4((uint64_t)v5, (uint64_t)v10);
  return swift_endAccess();
}

uint64_t sub_23B6C344C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;

  v6[3] = a5;
  v6[4] = a6;
  v6[2] = a4;
  return swift_task_switch();
}

uint64_t sub_23B6C3468()
{
  uint64_t v0;

  sub_23B6C349C(*(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23B6C349C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  uint64_t v18;
  uint8_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint8_t *v24;
  uint64_t v25;
  uint64_t v26;
  char *v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  void (*v32)(char *, uint64_t, uint64_t);
  uint64_t v33;
  uint64_t v34;
  uint64_t v35[3];

  v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254301300);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v28 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_23B6E0644();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v28 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v28 - v13;
  if (qword_2543009B0 != -1)
    swift_once();
  v15 = sub_23B6E0668();
  __swift_project_value_buffer(v15, (uint64_t)qword_2543013D8);
  v32 = *(void (**)(char *, uint64_t, uint64_t))(v9 + 16);
  v33 = a2;
  v32(v14, a2, v8);
  v16 = sub_23B6E0650();
  v17 = sub_23B6E0890();
  if (os_log_type_enabled(v16, v17))
  {
    v18 = swift_slowAlloc();
    v29 = a1;
    v19 = (uint8_t *)v18;
    v20 = swift_slowAlloc();
    v31 = v2;
    v21 = v20;
    v35[0] = v20;
    v28 = v12;
    *(_DWORD *)v19 = 136446210;
    v30 = v7;
    sub_23B6C5DC4();
    v22 = sub_23B6E0A64();
    v34 = sub_23B6BE8C4(v22, v23, v35);
    v7 = v30;
    v12 = v28;
    sub_23B6E0920();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v14, v8);
    _os_log_impl(&dword_23B6B3000, v16, v17, "Storing connectionStateContinuation for %{public}s", v19, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B86B840](v21, -1, -1);
    v24 = v19;
    a1 = v29;
    MEMORY[0x23B86B840](v24, -1, -1);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v9 + 8))(v14, v8);
  }

  v32(v12, v33, v8);
  v25 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2543012F0);
  v26 = *(_QWORD *)(v25 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v26 + 16))(v7, a1, v25);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v26 + 56))(v7, 0, 1, v25);
  swift_beginAccess();
  sub_23B6BB9C4((uint64_t)v7, (uint64_t)v12);
  return swift_endAccess();
}

uint64_t sub_23B6C378C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  v3 = *(_QWORD *)(v2 + 128);
  *(_QWORD *)(v2 + 128) = a1;
  *(_QWORD *)(v2 + 136) = a2;
  swift_retain();
  return sub_23B6B6A08(v3);
}

uint64_t sub_23B6C37C4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  v3 = *(_QWORD *)(v2 + 144);
  *(_QWORD *)(v2 + 144) = a1;
  *(_QWORD *)(v2 + 152) = a2;
  swift_retain();
  return sub_23B6B6A08(v3);
}

uint64_t sub_23B6C37FC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  v3 = *(_QWORD *)(v2 + 160);
  *(_QWORD *)(v2 + 160) = a1;
  *(_QWORD *)(v2 + 168) = a2;
  swift_retain();
  return sub_23B6B6A08(v3);
}

uint64_t sub_23B6C3834(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  v3 = *(_QWORD *)(v2 + 176);
  *(_QWORD *)(v2 + 176) = a1;
  *(_QWORD *)(v2 + 184) = a2;
  swift_retain();
  return sub_23B6B6A08(v3);
}

uint64_t APNSManager.deinit()
{
  uint64_t v0;

  sub_23B6B6A08(*(_QWORD *)(v0 + 128));
  sub_23B6B6A08(*(_QWORD *)(v0 + 144));
  sub_23B6B6A08(*(_QWORD *)(v0 + 160));
  sub_23B6B6A08(*(_QWORD *)(v0 + 176));
  swift_bridgeObjectRelease();
  swift_defaultActor_destroy();
  return v0;
}

uint64_t APNSManager.__deallocating_deinit()
{
  APNSManager.deinit();
  return swift_defaultActor_deallocate();
}

uint64_t APNSManager.unownedExecutor.getter()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_23B6C38E4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = v1;
  return swift_task_switch();
}

uint64_t sub_23B6C38FC()
{
  uint64_t v0;

  sub_23B6C2A50();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23B6C392C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;

  v3[3] = a2;
  v3[4] = v2;
  v3[2] = a1;
  return swift_task_switch();
}

uint64_t sub_23B6C3948()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD *)(v0 + 24);
  v2 = *(_QWORD *)(v0 + 32);
  v3 = *(_QWORD *)(v2 + 160);
  *(_QWORD *)(v2 + 160) = *(_QWORD *)(v0 + 16);
  *(_QWORD *)(v2 + 168) = v1;
  swift_retain();
  sub_23B6B6A08(v3);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23B6C3990(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;

  v3[3] = a2;
  v3[4] = v2;
  v3[2] = a1;
  return swift_task_switch();
}

uint64_t sub_23B6C39AC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD *)(v0 + 24);
  v2 = *(_QWORD *)(v0 + 32);
  v3 = *(_QWORD *)(v2 + 144);
  *(_QWORD *)(v2 + 144) = *(_QWORD *)(v0 + 16);
  *(_QWORD *)(v2 + 152) = v1;
  swift_retain();
  sub_23B6B6A08(v3);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23B6C39F4()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  v1[8] = v0;
  v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2543009D8);
  v1[9] = v2;
  v1[10] = *(_QWORD *)(v2 - 8);
  v1[11] = swift_task_alloc();
  v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2543012F0);
  v1[12] = v3;
  v1[13] = *(_QWORD *)(v3 - 8);
  v1[14] = swift_task_alloc();
  v1[15] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23B6C3A94()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t result;
  int64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  uint64_t v19;
  int *v20;
  _QWORD *v21;
  uint64_t v22;
  int64_t v23;
  uint64_t v24;
  uint64_t (*v25)(void);

  v1 = *(_QWORD *)(v0 + 104);
  v24 = *(_QWORD *)(v0 + 80);
  v2 = *(_QWORD *)(v0 + 64);
  swift_beginAccess();
  *(_BYTE *)(v2 + 200) = 1;
  swift_beginAccess();
  v3 = *(_QWORD *)(v2 + 192);
  v22 = v3 + 64;
  v4 = -1;
  v5 = -1 << *(_BYTE *)(v3 + 32);
  if (-v5 < 64)
    v4 = ~(-1 << -(char)v5);
  v6 = v4 & *(_QWORD *)(v3 + 64);
  v23 = (unint64_t)(63 - v5) >> 6;
  result = swift_bridgeObjectRetain();
  v8 = 0;
  while (1)
  {
    if (v6)
    {
      v9 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      v10 = v9 | (v8 << 6);
      goto LABEL_5;
    }
    v16 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
      __break(1u);
LABEL_27:
      __break(1u);
      return result;
    }
    if (v16 >= v23)
      goto LABEL_23;
    v17 = *(_QWORD *)(v22 + 8 * v16);
    ++v8;
    if (!v17)
    {
      v8 = v16 + 1;
      if (v16 + 1 >= v23)
        goto LABEL_23;
      v17 = *(_QWORD *)(v22 + 8 * v8);
      if (!v17)
      {
        v8 = v16 + 2;
        if (v16 + 2 >= v23)
          goto LABEL_23;
        v17 = *(_QWORD *)(v22 + 8 * v8);
        if (!v17)
        {
          v8 = v16 + 3;
          if (v16 + 3 >= v23)
            goto LABEL_23;
          v17 = *(_QWORD *)(v22 + 8 * v8);
          if (!v17)
            break;
        }
      }
    }
LABEL_22:
    v6 = (v17 - 1) & v17;
    v10 = __clz(__rbit64(v17)) + (v8 << 6);
LABEL_5:
    v12 = *(_QWORD *)(v0 + 112);
    v11 = *(_QWORD *)(v0 + 120);
    v14 = *(_QWORD *)(v0 + 88);
    v13 = *(_QWORD *)(v0 + 96);
    v15 = *(_QWORD *)(v0 + 72);
    (*(void (**)(uint64_t, unint64_t, uint64_t))(v1 + 16))(v11, *(_QWORD *)(v3 + 56) + *(_QWORD *)(v1 + 72) * v10, v13);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v1 + 32))(v12, v11, v13);
    *(_BYTE *)(v0 + 152) = 1;
    sub_23B6E07F4();
    (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v14, v15);
    result = (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8))(v12, v13);
  }
  v18 = v16 + 4;
  if (v18 < v23)
  {
    v17 = *(_QWORD *)(v22 + 8 * v18);
    if (!v17)
    {
      while (1)
      {
        v8 = v18 + 1;
        if (__OFADD__(v18, 1))
          goto LABEL_27;
        if (v8 >= v23)
          goto LABEL_23;
        v17 = *(_QWORD *)(v22 + 8 * v8);
        ++v18;
        if (v17)
          goto LABEL_22;
      }
    }
    v8 = v18;
    goto LABEL_22;
  }
LABEL_23:
  v19 = *(_QWORD *)(v0 + 64);
  swift_release();
  v20 = *(int **)(v19 + 128);
  *(_QWORD *)(v0 + 128) = v20;
  if (v20)
  {
    *(_QWORD *)(v0 + 136) = *(_QWORD *)(*(_QWORD *)(v0 + 64) + 136);
    v25 = (uint64_t (*)(void))((char *)v20 + *v20);
    swift_retain();
    v21 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 144) = v21;
    *v21 = v0;
    v21[1] = sub_23B6C3D80;
    return v25();
  }
  else
  {
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_23B6C3D80()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23B6C3DD8()
{
  uint64_t v0;

  sub_23B6B6A08(*(_QWORD *)(v0 + 128));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23B6C3E24(char a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  *(_QWORD *)(v2 + 64) = v1;
  *(_BYTE *)(v2 + 153) = a1;
  v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2543009D8);
  *(_QWORD *)(v2 + 72) = v3;
  *(_QWORD *)(v2 + 80) = *(_QWORD *)(v3 - 8);
  *(_QWORD *)(v2 + 88) = swift_task_alloc();
  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2543012F0);
  *(_QWORD *)(v2 + 96) = v4;
  *(_QWORD *)(v2 + 104) = *(_QWORD *)(v4 - 8);
  *(_QWORD *)(v2 + 112) = swift_task_alloc();
  *(_QWORD *)(v2 + 120) = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23B6C3EC8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char v3;
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
  uint64_t v16;
  int64_t v17;
  unint64_t v18;
  int64_t v19;
  uint64_t v20;
  int *v21;
  _QWORD *v22;
  uint64_t v23;
  int64_t v24;
  char v25;
  uint64_t v26;
  uint64_t (*v27)(_QWORD);

  v1 = *(_QWORD *)(v0 + 104);
  v26 = *(_QWORD *)(v0 + 80);
  v2 = *(_QWORD *)(v0 + 64);
  v3 = *(_BYTE *)(v0 + 153);
  swift_beginAccess();
  v25 = v3;
  *(_BYTE *)(v2 + 200) = v3;
  swift_beginAccess();
  v4 = *(_QWORD *)(v2 + 192);
  v23 = v4 + 64;
  v5 = -1;
  v6 = -1 << *(_BYTE *)(v4 + 32);
  if (-v6 < 64)
    v5 = ~(-1 << -(char)v6);
  v7 = v5 & *(_QWORD *)(v4 + 64);
  v24 = (unint64_t)(63 - v6) >> 6;
  result = swift_bridgeObjectRetain();
  v9 = 0;
  while (1)
  {
    if (v7)
    {
      v10 = __clz(__rbit64(v7));
      v7 &= v7 - 1;
      v11 = v10 | (v9 << 6);
      goto LABEL_5;
    }
    v17 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
LABEL_27:
      __break(1u);
      return result;
    }
    if (v17 >= v24)
      goto LABEL_23;
    v18 = *(_QWORD *)(v23 + 8 * v17);
    ++v9;
    if (!v18)
    {
      v9 = v17 + 1;
      if (v17 + 1 >= v24)
        goto LABEL_23;
      v18 = *(_QWORD *)(v23 + 8 * v9);
      if (!v18)
      {
        v9 = v17 + 2;
        if (v17 + 2 >= v24)
          goto LABEL_23;
        v18 = *(_QWORD *)(v23 + 8 * v9);
        if (!v18)
        {
          v9 = v17 + 3;
          if (v17 + 3 >= v24)
            goto LABEL_23;
          v18 = *(_QWORD *)(v23 + 8 * v9);
          if (!v18)
            break;
        }
      }
    }
LABEL_22:
    v7 = (v18 - 1) & v18;
    v11 = __clz(__rbit64(v18)) + (v9 << 6);
LABEL_5:
    v13 = *(_QWORD *)(v0 + 112);
    v12 = *(_QWORD *)(v0 + 120);
    v15 = *(_QWORD *)(v0 + 88);
    v14 = *(_QWORD *)(v0 + 96);
    v16 = *(_QWORD *)(v0 + 72);
    (*(void (**)(uint64_t, unint64_t, uint64_t))(v1 + 16))(v12, *(_QWORD *)(v4 + 56) + *(_QWORD *)(v1 + 72) * v11, v14);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v1 + 32))(v13, v12, v14);
    *(_BYTE *)(v0 + 152) = v25;
    sub_23B6E07F4();
    (*(void (**)(uint64_t, uint64_t))(v26 + 8))(v15, v16);
    result = (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8))(v13, v14);
  }
  v19 = v17 + 4;
  if (v19 < v24)
  {
    v18 = *(_QWORD *)(v23 + 8 * v19);
    if (!v18)
    {
      while (1)
      {
        v9 = v19 + 1;
        if (__OFADD__(v19, 1))
          goto LABEL_27;
        if (v9 >= v24)
          goto LABEL_23;
        v18 = *(_QWORD *)(v23 + 8 * v9);
        ++v19;
        if (v18)
          goto LABEL_22;
      }
    }
    v9 = v19;
    goto LABEL_22;
  }
LABEL_23:
  v20 = *(_QWORD *)(v0 + 64);
  swift_release();
  v21 = *(int **)(v20 + 176);
  *(_QWORD *)(v0 + 128) = v21;
  if (v21)
  {
    *(_QWORD *)(v0 + 136) = *(_QWORD *)(*(_QWORD *)(v0 + 64) + 184);
    v27 = (uint64_t (*)(_QWORD))((char *)v21 + *v21);
    swift_retain();
    v22 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 144) = v22;
    *v22 = v0;
    v22[1] = sub_23B6C3D80;
    return v27(*(unsigned __int8 *)(v0 + 153));
  }
  else
  {
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_23B6C41C0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 48) = a1;
  *(_QWORD *)(v2 + 56) = v1;
  return swift_task_switch();
}

uint64_t static APNSManager.Error.== infix(_:_:)()
{
  return 1;
}

uint64_t APNSManager.Error.hash(into:)()
{
  return sub_23B6E0B0C();
}

uint64_t APNSManager.Error.hashValue.getter()
{
  sub_23B6E0B00();
  sub_23B6E0B0C();
  return sub_23B6E0B18();
}

uint64_t sub_23B6C4244()
{
  return 1;
}

uint64_t sub_23B6C424C()
{
  sub_23B6E0B00();
  sub_23B6E0B0C();
  return sub_23B6E0B18();
}

uint64_t sub_23B6C428C()
{
  return sub_23B6E0B0C();
}

uint64_t sub_23B6C42B0()
{
  sub_23B6E0B00();
  sub_23B6E0B0C();
  return sub_23B6E0B18();
}

uint64_t sub_23B6C42FC(uint64_t a1)
{
  return sub_23B6C4308(a1, qword_256A46E00);
}

uint64_t sub_23B6C4308(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = sub_23B6E0668();
  __swift_allocate_value_buffer(v3, a2);
  v4 = __swift_project_value_buffer(v3, (uint64_t)a2);
  if (qword_254301310 != -1)
    swift_once();
  v5 = __swift_project_value_buffer(v3, (uint64_t)qword_254301408);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(v4, v5, v3);
}

id sub_23B6C4394()
{
  void *v0;
  void *v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  objc_super v7;

  v1 = v0;
  if (qword_256A46C08 != -1)
    swift_once();
  v2 = sub_23B6E0668();
  __swift_project_value_buffer(v2, (uint64_t)qword_256A46E00);
  v3 = sub_23B6E0650();
  v4 = sub_23B6E08C0();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_23B6B3000, v3, v4, "APNSManager deinit", v5, 2u);
    MEMORY[0x23B86B840](v5, -1, -1);
  }

  v7.receiver = v1;
  v7.super_class = (Class)type metadata accessor for APNSManager.PushDelegateTrampoline();
  return objc_msgSendSuper2(&v7, sel_dealloc);
}

uint64_t sub_23B6C4590(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;

  v6[3] = a5;
  v6[4] = a6;
  v6[2] = a4;
  return swift_task_switch();
}

uint64_t sub_23B6C45AC()
{
  uint64_t v0;
  uint64_t v1;
  int *v2;
  _QWORD *v3;
  int *v5;

  v1 = *(_QWORD *)(v0 + 16);
  v2 = *(int **)(v1 + 144);
  *(_QWORD *)(v0 + 40) = v2;
  if (!v2)
    return (*(uint64_t (**)(void))(v0 + 8))();
  *(_QWORD *)(v0 + 48) = *(_QWORD *)(v1 + 152);
  v5 = (int *)((char *)v2 + *v2);
  swift_retain();
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 56) = v3;
  *v3 = v0;
  v3[1] = sub_23B6C4644;
  return ((uint64_t (*)(_QWORD, _QWORD))v5)(*(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32));
}

uint64_t sub_23B6C4644()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23B6C469C()
{
  uint64_t v0;

  sub_23B6B6A08(*(_QWORD *)(v0 + 40));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23B6C4FB0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t v5;
  _QWORD *v7;

  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v5 + 16) = v7;
  *v7 = v5;
  v7[1] = sub_23B6B77B8;
  return sub_23B6C3E24(a5);
}

uint64_t sub_23B6C5104()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_23B6B77B8;
  return sub_23B6C39F4();
}

uint64_t sub_23B6C53A4()
{
  uint64_t v0;

  v0 = sub_23B6E0668();
  __swift_allocate_value_buffer(v0, qword_254301408);
  __swift_project_value_buffer(v0, (uint64_t)qword_254301408);
  return sub_23B6E065C();
}

uint64_t sub_23B6C5420()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_23B6C5444(char *a1)
{
  return sub_23B6C2D20(a1);
}

unint64_t sub_23B6C544C()
{
  unint64_t result;

  result = qword_256A46E48;
  if (!qword_256A46E48)
  {
    result = MEMORY[0x23B86B7BC](&protocol conformance descriptor for APNSManager.Error, &type metadata for APNSManager.Error);
    atomic_store(result, (unint64_t *)&qword_256A46E48);
  }
  return result;
}

unint64_t sub_23B6C5494()
{
  unint64_t result;

  result = qword_256A46E70;
  if (!qword_256A46E70)
  {
    result = MEMORY[0x23B86B7BC](&protocol conformance descriptor for APNSManager.Error, &type metadata for APNSManager.Error);
    atomic_store(result, (unint64_t *)&qword_256A46E70);
  }
  return result;
}

uint64_t sub_23B6C54D8@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;

  v3 = *a1;
  result = swift_beginAccess();
  *a2 = *(_BYTE *)(v3 + 200);
  return result;
}

uint64_t sub_23B6C551C(char *a1, uint64_t *a2)
{
  char v2;
  uint64_t v3;
  uint64_t result;

  v2 = *a1;
  v3 = *a2;
  result = swift_beginAccess();
  *(_BYTE *)(v3 + 200) = v2;
  return result;
}

uint64_t type metadata accessor for APNSManager()
{
  return objc_opt_self();
}

uint64_t method lookup function for APNSManager()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of APNSManager.connected.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 296))();
}

uint64_t dispatch thunk of APNSManager.connected.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 304))();
}

uint64_t dispatch thunk of APNSManager.connected.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 312))();
}

uint64_t dispatch thunk of APNSManager.__allocating_init(environmentName:delegatePort:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  _QWORD *v10;
  uint64_t (*v12)(uint64_t, uint64_t, uint64_t, uint64_t);

  v12 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(**(int **)(v4 + 320) + *(_QWORD *)(v4 + 320));
  v10 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v5 + 16) = v10;
  *v10 = v5;
  v10[1] = sub_23B6C5F04;
  return v12(a1, a2, a3, a4);
}

uint64_t dispatch thunk of APNSManager.enabledTopics.getter()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t (*v4)(void);

  v4 = (uint64_t (*)(void))(**(int **)(*(_QWORD *)v0 + 328) + *(_QWORD *)(*(_QWORD *)v0 + 328));
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v2;
  *v2 = v1;
  v2[1] = sub_23B6C5688;
  return v4();
}

uint64_t sub_23B6C5688(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v4;

  v4 = *v1;
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v4 + 8))(a1);
}

uint64_t dispatch thunk of APNSManager.set(enabledTopics:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 336))();
}

uint64_t dispatch thunk of APNSManager.connectionStateStream()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 344))();
}

uint64_t dispatch thunk of APNSManager.setDidReconnect(block:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 352))();
}

uint64_t dispatch thunk of APNSManager.setDidReceivePublicToken(block:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 360))();
}

uint64_t dispatch thunk of APNSManager.setDidReceive(block:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 368))();
}

uint64_t dispatch thunk of APNSManager.setDidChangeConnectionStatus(block:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 376))();
}

uint64_t getEnumTagSinglePayload for APNSManager.Error(unsigned int *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for APNSManager.Error(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_23B6C57B4 + 4 * byte_23B6E1820[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_23B6C57D4 + 4 * byte_23B6E1825[v4]))();
}

_BYTE *sub_23B6C57B4(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_23B6C57D4(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23B6C57DC(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23B6C57E4(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23B6C57EC(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23B6C57F4(_DWORD *result)
{
  *result = 0;
  return result;
}

uint64_t sub_23B6C5800()
{
  return 0;
}

ValueMetadata *type metadata accessor for APNSManager.Error()
{
  return &type metadata for APNSManager.Error;
}

_QWORD *assignWithCopy for APNSManager.IncomingMessage(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for APNSManager.IncomingMessage(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_23B6C58C0(uint64_t a1, unint64_t *a2)
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

uint64_t sub_23B6C58F8()
{
  return objectdestroy_6Tm();
}

uint64_t sub_23B6C5900()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_23B6B77B8;
  v2 = (_QWORD *)swift_task_alloc();
  v1[2] = v2;
  *v2 = v1;
  v2[1] = sub_23B6B77B8;
  return sub_23B6C39F4();
}

uint64_t sub_23B6C5968()
{
  return objectdestroy_6Tm();
}

uint64_t objectdestroy_6Tm()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23B6C59A8()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  _QWORD *v3;
  _QWORD *v4;

  v2 = *(_BYTE *)(v0 + 40);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_23B6B77B8;
  v4 = (_QWORD *)swift_task_alloc();
  v3[2] = v4;
  *v4 = v3;
  v4[1] = sub_23B6B77B8;
  return sub_23B6C3E24(v2);
}

uint64_t sub_23B6C5A24()
{
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23B6C5A50(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_23B6C5A64(a1, a2);
  return a1;
}

uint64_t sub_23B6C5A64(uint64_t a1, unint64_t a2)
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

uint64_t sub_23B6C5AA8()
{
  uint64_t v0;

  swift_unknownObjectRelease();
  swift_release();
  sub_23B6C5A64(*(_QWORD *)(v0 + 40), *(_QWORD *)(v0 + 48));
  return swift_deallocObject();
}

uint64_t sub_23B6C5ADC()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  v2 = v0[4];
  v3 = v0[5];
  v4 = v0[6];
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v5;
  *v5 = v1;
  v5[1] = sub_23B6B77B8;
  v5[3] = v3;
  v5[4] = v4;
  v5[2] = v2;
  return swift_task_switch();
}

uint64_t sub_23B6C5B4C(uint64_t a1, unint64_t a2)
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

uint64_t sub_23B6C5B90()
{
  return swift_release();
}

uint64_t sub_23B6C5B98()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = sub_23B6E0644();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  return swift_deallocObject();
}

uint64_t sub_23B6C5C0C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(unsigned __int8 *)(*(_QWORD *)(sub_23B6E0644() - 8) + 80);
  return sub_23B6C2FE8(a1, *(_QWORD *)(v1 + 16), v1 + ((v3 + 24) & ~v3));
}

uint64_t sub_23B6C5C4C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;

  v1 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2543012F0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = *(_QWORD *)(v2 + 64);
  v5 = sub_23B6E0644();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = (v3 + v4 + *(unsigned __int8 *)(v6 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  swift_unknownObjectRelease();
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  (*(void (**)(unint64_t, uint64_t))(v6 + 8))(v0 + v7, v5);
  return swift_deallocObject();
}

uint64_t sub_23B6C5D14()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;

  v2 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2543012F0) - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = *(_QWORD *)(v2 + 64);
  v5 = *(unsigned __int8 *)(*(_QWORD *)(sub_23B6E0644() - 8) + 80);
  v6 = v3 + v4 + v5;
  v7 = *(_QWORD *)(v0 + 32);
  v8 = v0 + v3;
  v9 = v0 + (v6 & ~v5);
  v10 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v10;
  *v10 = v1;
  v10[1] = sub_23B6B77B8;
  v10[3] = v8;
  v10[4] = v9;
  v10[2] = v7;
  return swift_task_switch();
}

unint64_t sub_23B6C5DC4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2543012E8;
  if (!qword_2543012E8)
  {
    v1 = sub_23B6E0644();
    result = MEMORY[0x23B86B7BC](MEMORY[0x24BDCEAB8], v1);
    atomic_store(result, (unint64_t *)&qword_2543012E8);
  }
  return result;
}

uint64_t sub_23B6C5E0C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = sub_23B6E0644();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_unknownObjectRelease();
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  return swift_deallocObject();
}

uint64_t sub_23B6C5E88()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  v2 = *(unsigned __int8 *)(*(_QWORD *)(sub_23B6E0644() - 8) + 80);
  v3 = *(_QWORD *)(v0 + 32);
  v4 = v0 + ((v2 + 40) & ~v2);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v5;
  *v5 = v1;
  v5[1] = sub_23B6B8F74;
  v5[2] = v3;
  v5[3] = v4;
  return swift_task_switch();
}

uint64_t sub_23B6C5F08()
{
  uint64_t v0;

  return sub_23B6C6230(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t ActorServiceProtocol.description.getter(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  sub_23B6E0A4C();
  sub_23B6E071C();
  swift_bridgeObjectRelease();
  sub_23B6E071C();
  MEMORY[0x23B86B2D0](a1, v3);
  sub_23B6E071C();
  swift_bridgeObjectRelease();
  sub_23B6E071C();
  return 60;
}

uint64_t ActorServiceProtocol.migrate(from:to:)()
{
  uint64_t v0;

  return sub_23B6B7CCC(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t ActorServiceProtocol.firstLaunchSinceReboot()()
{
  uint64_t v0;

  return sub_23B6B7CCC(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t ActorServiceProtocol.run()()
{
  uint64_t v0;

  return sub_23B6C6230(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t dispatch thunk of ActorServiceProtocol.name.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of ActorServiceProtocol.initialLaunchProcessing()(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  uint64_t (*v7)(uint64_t, uint64_t);

  v7 = (uint64_t (*)(uint64_t, uint64_t))(**(int **)(a2 + 32) + *(_QWORD *)(a2 + 32));
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_23B6B77B8;
  return v7(a1, a2);
}

uint64_t dispatch thunk of ActorServiceProtocol.migrate(from:to:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v9;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);

  v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(**(int **)(a4 + 40) + *(_QWORD *)(a4 + 40));
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v9;
  *v9 = v4;
  v9[1] = sub_23B6B77B8;
  return v11(a1, a2, a3, a4);
}

uint64_t dispatch thunk of ActorServiceProtocol.firstLaunchSinceReboot()(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  uint64_t (*v7)(uint64_t, uint64_t);

  v7 = (uint64_t (*)(uint64_t, uint64_t))(**(int **)(a2 + 48) + *(_QWORD *)(a2 + 48));
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_23B6B8F74;
  return v7(a1, a2);
}

uint64_t dispatch thunk of ActorServiceProtocol.startup()(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  uint64_t (*v7)(uint64_t, uint64_t);

  v7 = (uint64_t (*)(uint64_t, uint64_t))(**(int **)(a2 + 56) + *(_QWORD *)(a2 + 56));
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_23B6B77B8;
  return v7(a1, a2);
}

uint64_t dispatch thunk of ActorServiceProtocol.run()(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  uint64_t (*v7)(uint64_t, uint64_t);

  v7 = (uint64_t (*)(uint64_t, uint64_t))(**(int **)(a2 + 64) + *(_QWORD *)(a2 + 64));
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_23B6B8F74;
  return v7(a1, a2);
}

uint64_t sub_23B6C6230(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t withArrayOfCStrings<A>(_:_:)(uint64_t a1, void (*a2)(_QWORD *))
{
  int64_t v2;
  _QWORD *v3;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  char *v8;
  unint64_t v9;
  unint64_t v10;
  int64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  uint64_t v23;

  v2 = *(_QWORD *)(a1 + 16);
  v3 = (_QWORD *)MEMORY[0x24BEE4AF8];
  if (v2)
  {
    v23 = MEMORY[0x24BEE4AF8];
    sub_23B6C6A50(0, v2, 0);
    v5 = v23;
    v6 = a1 + 40;
    do
    {
      v7 = (const char *)(sub_23B6E0704() + 32);
      swift_bridgeObjectRetain();
      v8 = strdup(v7);
      swift_bridgeObjectRelease();
      swift_release();
      v10 = *(_QWORD *)(v23 + 16);
      v9 = *(_QWORD *)(v23 + 24);
      v11 = v10 + 1;
      if (v10 >= v9 >> 1)
        sub_23B6C6A50(v9 > 1, v10 + 1, 1);
      v6 += 16;
      *(_QWORD *)(v23 + 16) = v11;
      *(_QWORD *)(v23 + 8 * v10 + 32) = v8;
      --v2;
    }
    while (v2);
  }
  else
  {
    v11 = *(_QWORD *)(MEMORY[0x24BEE4AF8] + 16);
    v5 = MEMORY[0x24BEE4AF8];
    if (!v11)
      goto LABEL_12;
  }
  sub_23B6C6A2C(0, v11, 0);
  v12 = 0;
  v13 = v3[2];
  do
  {
    v14 = *(_QWORD *)(v5 + 8 * v12 + 32);
    v15 = v3[3];
    if (v13 >= v15 >> 1)
      sub_23B6C6A2C(v15 > 1, v13 + 1, 1);
    ++v12;
    v3[2] = v13 + 1;
    v3[v13++ + 4] = v14;
  }
  while (v11 != v12);
LABEL_12:
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v3 = sub_23B6C67EC(0, v3[2] + 1, 1, v3);
  v17 = v3[2];
  v16 = v3[3];
  if (v17 >= v16 >> 1)
    v3 = sub_23B6C67EC((_QWORD *)(v16 > 1), v17 + 1, 1, v3);
  v3[2] = v17 + 1;
  v3[v17 + 4] = 0;
  a2(v3);
  swift_bridgeObjectRelease();
  v18 = *(_QWORD *)(v5 + 16);
  if (v18)
  {
    swift_bridgeObjectRetain();
    for (i = 0; i != v18; ++i)
    {
      v20 = *(void **)(v5 + 8 * i + 32);
      free(v20);
    }
    swift_bridgeObjectRelease();
  }
  return swift_bridgeObjectRelease();
}

uint64_t sub_23B6C6498(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_23B6C64C0(a1, a2, a3, a4, qword_256A47020, (uint64_t *)&unk_254300718);
}

uint64_t sub_23B6C64AC(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_23B6C64C0(a1, a2, a3, a4, &qword_254300780, (uint64_t *)&unk_254300730);
}

uint64_t sub_23B6C64C0(char a1, int64_t a2, char a3, unint64_t a4, uint64_t *a5, uint64_t *a6)
{
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  _QWORD *v16;
  size_t v17;
  BOOL v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v9 = *(_QWORD *)(a4 + 24);
    v10 = v9 >> 1;
    if ((uint64_t)(v9 >> 1) < a2)
    {
      if (v10 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_29;
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
  v11 = *(_QWORD *)(a4 + 16);
  if (v10 <= v11)
    v12 = *(_QWORD *)(a4 + 16);
  else
    v12 = v10;
  if (!v12)
  {
    v16 = (_QWORD *)MEMORY[0x24BEE4AF8];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(a5);
  v13 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(a6) - 8);
  v14 = *(_QWORD *)(v13 + 72);
  v15 = (*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  v16 = (_QWORD *)swift_allocObject();
  v17 = _swift_stdlib_malloc_size(v16);
  if (!v14 || (v17 - v15 == 0x8000000000000000 ? (v18 = v14 == -1) : (v18 = 0), v18))
  {
LABEL_29:
    result = sub_23B6E09F8();
    __break(1u);
    return result;
  }
  v16[2] = v11;
  v16[3] = 2 * ((uint64_t)(v17 - v15) / v14);
LABEL_19:
  v19 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(a6) - 8);
  v20 = (*(unsigned __int8 *)(v19 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
  v21 = (unint64_t)v16 + v20;
  if ((a1 & 1) != 0)
  {
    if ((unint64_t)v16 < a4 || v21 >= a4 + v20 + *(_QWORD *)(v19 + 72) * v11)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v16 != (_QWORD *)a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_23B6C6EAC(0, v11, v21, a4, a6);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v16;
}

_QWORD *sub_23B6C66CC(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_254300998);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v12 = v11 - 32;
      if (v11 < 32)
        v12 = v11 - 17;
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 4);
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
        if (v10 != a4 || v13 >= &a4[2 * v8 + 4])
          memmove(v13, a4 + 4, 16 * v8);
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_23B6C6BCC(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_23B6C67D8(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_23B6C64C0(a1, a2, a3, a4, &qword_2543005B8, (uint64_t *)&unk_254300520);
}

_QWORD *sub_23B6C67EC(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_256A47010);
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
    sub_23B6C6CBC(0, v8, (char *)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_23B6C68F8(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_23B6C64C0(a1, a2, a3, a4, (uint64_t *)&unk_2543005C0, &qword_254300540);
}

_QWORD *sub_23B6C690C(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_2543010D0);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v12 = v11 - 32;
      if (v11 < 32)
        v12 = v11 - 17;
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 4);
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
        if (v10 != a4 || v13 >= &a4[2 * v8 + 4])
          memmove(v13, a4 + 4, 16 * v8);
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_23B6C6DA4(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_23B6C6A18(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_23B6C64C0(a1, a2, a3, a4, (uint64_t *)&unk_2543010D8, &qword_254301098);
}

uint64_t sub_23B6C6A2C(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_23B6C6A74(a1, a2, a3, *v3, &qword_256A47010);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_23B6C6A50(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_23B6C6A74(a1, a2, a3, *v3, &qword_256A47018);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_23B6C6A74(char a1, int64_t a2, char a3, char *a4, uint64_t *a5)
{
  unint64_t v7;
  int64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  int64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v7 = *((_QWORD *)a4 + 3);
    v8 = v7 >> 1;
    if ((uint64_t)(v7 >> 1) < a2)
    {
      if (v8 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_32;
      }
      v8 = v7 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v7 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v8 = a2;
    }
  }
  else
  {
    v8 = a2;
  }
  v9 = *((_QWORD *)a4 + 2);
  if (v8 <= v9)
    v10 = *((_QWORD *)a4 + 2);
  else
    v10 = v8;
  if (v10)
  {
    __swift_instantiateConcreteTypeFromMangledName(a5);
    v11 = (char *)swift_allocObject();
    v12 = _swift_stdlib_malloc_size(v11);
    v13 = v12 - 32;
    if (v12 < 32)
      v13 = v12 - 25;
    *((_QWORD *)v11 + 2) = v9;
    *((_QWORD *)v11 + 3) = 2 * (v13 >> 3);
  }
  else
  {
    v11 = (char *)MEMORY[0x24BEE4AF8];
  }
  v14 = v11 + 32;
  v15 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v11 != a4 || v14 >= &v15[8 * v9])
      memmove(v14, v15, 8 * v9);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v15 >= &v14[8 * v9] || v14 >= &v15[8 * v9])
  {
    memcpy(v14, v15, 8 * v9);
LABEL_30:
    swift_release();
    return (uint64_t)v11;
  }
LABEL_32:
  result = sub_23B6E0A34();
  __break(1u);
  return result;
}

uint64_t sub_23B6C6BCC(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
    v5 = a4 + 16 * a1 + 32;
    v6 = a3 + 16 * v4;
    if (v5 >= v6 || v5 + 16 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  result = sub_23B6E0A34();
  __break(1u);
  return result;
}

char *sub_23B6C6CBC(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
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
    v5 = (char *)(a4 + 8 * a1 + 32);
    v6 = 8 * v4;
    v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }
  result = (char *)sub_23B6E0A34();
  __break(1u);
  return result;
}

uint64_t sub_23B6C6DA4(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
    v5 = a4 + 16 * a1 + 32;
    v6 = a3 + 16 * v4;
    if (v5 >= v6 || v5 + 16 * v4 <= a3)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_254300FB0);
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  result = sub_23B6E0A34();
  __break(1u);
  return result;
}

uint64_t sub_23B6C6EAC(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t *a5)
{
  uint64_t v5;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t result;

  v5 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v5 & 0x8000000000000000) == 0)
  {
    v9 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(a5) - 8);
    v10 = *(unsigned __int8 *)(v9 + 80);
    v11 = *(_QWORD *)(v9 + 72);
    v12 = a4 + ((v10 + 32) & ~v10) + v11 * a1;
    v13 = v11 * v5;
    v14 = a3 + v13;
    v15 = v12 + v13;
    if (v12 >= v14 || v15 <= a3)
    {
      swift_arrayInitWithCopy();
      return v14;
    }
  }
  result = sub_23B6E0A34();
  __break(1u);
  return result;
}

uint64_t (*sub_23B6C6FC4(_QWORD *a1, uint64_t a2, uint64_t a3))()
{
  _QWORD *v6;

  v6 = malloc(0x30uLL);
  *a1 = v6;
  v6[4] = a3;
  swift_bridgeObjectRetain();
  v6[5] = sub_23B6C9818(v6, a2, a3);
  return sub_23B6C7030;
}

uint64_t (*sub_23B6C7034(_QWORD *a1, uint64_t a2, uint64_t a3))()
{
  _QWORD *v6;

  v6 = malloc(0x30uLL);
  *a1 = v6;
  v6[4] = a3;
  swift_bridgeObjectRetain();
  v6[5] = sub_23B6C98AC(v6, a2, a3);
  return sub_23B6C7030;
}

uint64_t (*sub_23B6C70A0(_QWORD *a1, uint64_t a2, uint64_t a3))()
{
  _QWORD *v6;

  v6 = malloc(0x30uLL);
  *a1 = v6;
  v6[4] = a3;
  swift_bridgeObjectRetain();
  v6[5] = sub_23B6C993C(v6, a2, a3);
  return sub_23B6C7030;
}

uint64_t (*sub_23B6C710C(_QWORD *a1, uint64_t a2, uint64_t a3))()
{
  _QWORD *v6;

  v6 = malloc(0x30uLL);
  *a1 = v6;
  v6[4] = a3;
  swift_bridgeObjectRetain();
  v6[5] = sub_23B6C99CC(v6, a2, a3);
  return sub_23B6C7030;
}

void sub_23B6C7178(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD, _QWORD))(*a1 + 40))(*a1, 0);
  swift_bridgeObjectRelease();
  free(v1);
}

uint64_t sub_23B6C71B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;

  v5 = sub_23B6E07DC();
  v6 = *(_QWORD *)(v5 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(a1, 1, v5) != 1)
  {
    sub_23B6E07D0();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
    if (!*(_QWORD *)(a3 + 16))
      return swift_task_create();
    goto LABEL_3;
  }
  sub_23B6B772C(a1, &qword_254301350);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_23B6E07AC();
    swift_unknownObjectRelease();
  }
  return swift_task_create();
}

uint64_t sub_23B6C72E4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = sub_23B6E0668();
  __swift_allocate_value_buffer(v0, qword_254300448);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_254300448);
  if (qword_2543004B8 != -1)
    swift_once();
  v2 = __swift_project_value_buffer(v0, (uint64_t)qword_254300498);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 - 8) + 16))(v1, v2, v0);
}

void sub_23B6C7374()
{
  qword_254301358 = 0x6C7070612E6D6F63;
  unk_254301360 = 0xEF6D72616C612E65;
}

uint64_t (*sub_23B6C73A4())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

_QWORD *XPCAlarmEventHandler.__allocating_init(eventStreamHandler:)(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;

  v2 = (_QWORD *)swift_allocObject();
  swift_defaultActor_initialize();
  v3 = MEMORY[0x24BEE4AF8];
  v2[14] = MEMORY[0x24BEE4AF8];
  v2[16] = sub_23B6BA8A0(v3);
  v2[17] = sub_23B6BA8BC(v3);
  v2[18] = sub_23B6BA8A0(v3);
  v2[19] = sub_23B6BA8BC(v3);
  v2[20] = sub_23B6BA8D8(v3);
  v2[15] = a1;
  return v2;
}

_QWORD *XPCAlarmEventHandler.init(eventStreamHandler:)(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v3;

  swift_defaultActor_initialize();
  v3 = MEMORY[0x24BEE4AF8];
  v1[14] = MEMORY[0x24BEE4AF8];
  v1[16] = sub_23B6BA8A0(v3);
  v1[17] = sub_23B6BA8BC(v3);
  v1[18] = sub_23B6BA8A0(v3);
  v1[19] = sub_23B6BA8BC(v3);
  v1[20] = sub_23B6BA8D8(v3);
  v1[15] = a1;
  return v1;
}

uint64_t sub_23B6C74E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;

  v4[17] = a3;
  v4[18] = v3;
  v4[15] = a1;
  v4[16] = a2;
  v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254300510);
  v4[19] = v5;
  v4[20] = *(_QWORD *)(v5 - 8);
  v4[21] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254300568);
  v4[22] = swift_task_alloc();
  v4[23] = swift_task_alloc();
  v4[24] = swift_task_alloc();
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_254300560);
  v4[25] = v6;
  v4[26] = *(_QWORD *)(v6 - 8);
  v4[27] = swift_task_alloc();
  v4[28] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23B6C75CC()
{
  uint64_t v0;
  uint64_t v1;
  __objc2_class **p_superclass;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  void (*v10)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v11;
  uint64_t v12;
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
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  os_log_type_t v30;
  _BOOL4 v31;
  unint64_t v32;
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
  _QWORD *v44;
  void (*v45)(uint64_t, uint64_t, uint64_t);
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  _QWORD *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  unint64_t v56;
  char v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  NSObject *v61;
  os_log_type_t v62;
  _BOOL4 v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  unint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  void (*v75)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;

  v1 = *(_QWORD *)(*(_QWORD *)(v0 + 144) + 128);
  p_superclass = _TtCC19FindMyDaemonSupport11APNSManagerP33_69672C9E20C2D053F65B88CE8A65B96022PushDelegateTrampoline.superclass;
  if (*(_QWORD *)(v1 + 16))
  {
    v4 = *(_QWORD *)(v0 + 128);
    v3 = *(_QWORD *)(v0 + 136);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v5 = sub_23B6B5E60(v4, v3);
    v7 = *(_QWORD *)(v0 + 200);
    v6 = *(_QWORD *)(v0 + 208);
    v8 = *(_QWORD *)(v0 + 192);
    if ((v9 & 1) != 0)
    {
      (*(void (**)(_QWORD, unint64_t, _QWORD))(v6 + 16))(*(_QWORD *)(v0 + 192), *(_QWORD *)(v1 + 56) + *(_QWORD *)(v6 + 72) * v5, *(_QWORD *)(v0 + 200));
      v10 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v6 + 56);
      v10(v8, 0, 1, v7);
    }
    else
    {
      v10 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v6 + 56);
      v10(*(_QWORD *)(v0 + 192), 1, 1, v7);
    }
    v12 = *(_QWORD *)(v0 + 200);
    v11 = *(_QWORD *)(v0 + 208);
    v13 = *(_QWORD *)(v0 + 192);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v11 + 48))(v13, 1, v12) != 1)
    {
      v21 = *(_QWORD *)(v0 + 224);
      v22 = *(_QWORD *)(v0 + 200);
      v23 = *(_QWORD *)(v0 + 208);
      v24 = *(_QWORD *)(v0 + 192);
      goto LABEL_21;
    }
  }
  else
  {
    v10 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 + 208) + 56);
    v10(*(_QWORD *)(v0 + 192), 1, 1, *(_QWORD *)(v0 + 200));
  }
  v14 = *(_QWORD *)(v0 + 144);
  sub_23B6B772C(*(_QWORD *)(v0 + 192), &qword_254300568);
  swift_beginAccess();
  v15 = *(_QWORD *)(v14 + 144);
  if (*(_QWORD *)(v15 + 16))
  {
    v17 = *(_QWORD *)(v0 + 128);
    v16 = *(_QWORD *)(v0 + 136);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v18 = sub_23B6B5E60(v17, v16);
    if ((v19 & 1) != 0)
    {
      (*(void (**)(_QWORD, unint64_t, _QWORD))(*(_QWORD *)(v0 + 208) + 16))(*(_QWORD *)(v0 + 184), *(_QWORD *)(v15 + 56) + *(_QWORD *)(*(_QWORD *)(v0 + 208) + 72) * v18, *(_QWORD *)(v0 + 200));
      v20 = 0;
    }
    else
    {
      v20 = 1;
    }
    v26 = *(_QWORD *)(v0 + 200);
    v25 = *(_QWORD *)(v0 + 208);
    v27 = *(_QWORD *)(v0 + 184);
    v10(v27, v20, 1, v26);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v25 + 48))(v27, 1, v26) == 1)
      goto LABEL_14;
    v21 = *(_QWORD *)(v0 + 224);
    v22 = *(_QWORD *)(v0 + 200);
    v23 = *(_QWORD *)(v0 + 208);
    v24 = *(_QWORD *)(v0 + 184);
LABEL_21:
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v23 + 32))(v21, v24, v22);
    goto LABEL_22;
  }
  v10(*(_QWORD *)(v0 + 184), 1, 1, *(_QWORD *)(v0 + 200));
LABEL_14:
  sub_23B6B772C(*(_QWORD *)(v0 + 184), &qword_254300568);
  if (qword_254300468 != -1)
    swift_once();
  v75 = v10;
  v28 = sub_23B6E0668();
  __swift_project_value_buffer(v28, (uint64_t)qword_254300448);
  swift_bridgeObjectRetain_n();
  v29 = sub_23B6E0650();
  v30 = sub_23B6E08C0();
  v31 = os_log_type_enabled(v29, v30);
  v32 = *(_QWORD *)(v0 + 136);
  if (v31)
  {
    v33 = *(_QWORD *)(v0 + 128);
    v34 = swift_slowAlloc();
    v35 = swift_slowAlloc();
    v78 = v35;
    *(_DWORD *)v34 = 141558275;
    *(_QWORD *)(v0 + 104) = 1752392040;
    sub_23B6E0920();
    *(_WORD *)(v34 + 12) = 2081;
    swift_bridgeObjectRetain();
    *(_QWORD *)(v0 + 112) = sub_23B6BE8C4(v33, v32, &v78);
    sub_23B6E0920();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_23B6B3000, v29, v30, "Creating base AsyncStream for XPCAlarm with stream name: %{private,mask.hash}s", (uint8_t *)v34, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x23B86B840](v35, -1, -1);
    MEMORY[0x23B86B840](v34, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  v72 = *(_QWORD *)(v0 + 216);
  v36 = *(_QWORD *)(v0 + 200);
  v73 = *(_QWORD *)(v0 + 208);
  v74 = *(_QWORD *)(v0 + 224);
  v38 = *(_QWORD *)(v0 + 168);
  v37 = *(_QWORD *)(v0 + 176);
  v39 = *(_QWORD *)(v0 + 152);
  v40 = *(_QWORD *)(v0 + 160);
  v42 = *(_QWORD *)(v0 + 136);
  v41 = *(_QWORD *)(v0 + 144);
  v43 = *(_QWORD *)(v0 + 128);
  v44 = (_QWORD *)swift_task_alloc();
  v44[2] = v41;
  v44[3] = v43;
  v44[4] = v42;
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v40 + 104))(v38, *MEMORY[0x24BEE6A10], v39);
  sub_23B6E0818();
  swift_task_dealloc();
  v45 = *(void (**)(uint64_t, uint64_t, uint64_t))(v73 + 16);
  v45(v74, v72, v36);
  v45(v37, v74, v36);
  v75(v37, 0, 1, v36);
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_23B6BBB54(v37, v43, v42);
  swift_endAccess();
  (*(void (**)(uint64_t, uint64_t))(v73 + 8))(v72, v36);
  p_superclass = (__objc2_class **)(_TtCC19FindMyDaemonSupport11APNSManagerP33_69672C9E20C2D053F65B88CE8A65B96022PushDelegateTrampoline
                                  + 8);
LABEL_22:
  v47 = *(_QWORD *)(v0 + 160);
  v46 = *(_QWORD *)(v0 + 168);
  v49 = *(_QWORD *)(v0 + 144);
  v48 = *(_QWORD *)(v0 + 152);
  v51 = *(_QWORD *)(v0 + 128);
  v50 = *(_QWORD *)(v0 + 136);
  v52 = (_QWORD *)swift_task_alloc();
  v52[2] = v49;
  v52[3] = v51;
  v52[4] = v50;
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v47 + 104))(v46, *MEMORY[0x24BEE6A10], v48);
  sub_23B6E0818();
  swift_task_dealloc();
  swift_beginAccess();
  v53 = *(_QWORD *)(v49 + 160);
  if (*(_QWORD *)(v53 + 16))
  {
    v55 = *(_QWORD *)(v0 + 128);
    v54 = *(_QWORD *)(v0 + 136);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v56 = sub_23B6B5E60(v55, v54);
    if ((v57 & 1) != 0)
    {
      v58 = *(_QWORD *)(*(_QWORD *)(v53 + 56) + 8 * v56);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v59 = *(_QWORD *)(v58 + 16);
    }
    else
    {
      swift_bridgeObjectRelease();
      v59 = 0;
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    v59 = 0;
  }
  if (p_superclass[141] != (__objc2_class *)-1)
    swift_once();
  v60 = sub_23B6E0668();
  __swift_project_value_buffer(v60, (uint64_t)qword_254300448);
  swift_bridgeObjectRetain_n();
  v61 = sub_23B6E0650();
  v62 = sub_23B6E08C0();
  v63 = os_log_type_enabled(v61, v62);
  v64 = *(_QWORD *)(v0 + 224);
  v65 = *(_QWORD *)(v0 + 200);
  v66 = *(_QWORD *)(v0 + 208);
  v67 = *(_QWORD *)(v0 + 136);
  if (v63)
  {
    v77 = *(_QWORD *)(v0 + 224);
    v68 = *(_QWORD *)(v0 + 128);
    v76 = *(_QWORD *)(v0 + 208);
    v69 = swift_slowAlloc();
    v70 = swift_slowAlloc();
    v78 = v70;
    *(_DWORD *)v69 = 136315394;
    swift_bridgeObjectRetain();
    *(_QWORD *)(v0 + 88) = sub_23B6BE8C4(v68, v67, &v78);
    sub_23B6E0920();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v69 + 12) = 2048;
    *(_QWORD *)(v0 + 96) = v59;
    sub_23B6E0920();
    _os_log_impl(&dword_23B6B3000, v61, v62, "Creating sub AsyncStream for XPCAlarm name: [%s], count: %ld", (uint8_t *)v69, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x23B86B840](v70, -1, -1);
    MEMORY[0x23B86B840](v69, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v76 + 8))(v77, v65);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    (*(void (**)(uint64_t, uint64_t))(v66 + 8))(v64, v65);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23B6C7DB4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_254300548);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_254300540);
  v11 = *(_QWORD *)(v10 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v9, a1, v10);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v9, 0, 1, v10);
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_23B6BBB78((uint64_t)v9, a3, a4);
  return swift_endAccess();
}

uint64_t sub_23B6C7EB0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  _QWORD *v12;
  char v13;
  char v14;
  uint64_t (*v15)();
  unint64_t *v16;
  uint64_t (*v17)();
  unint64_t *v18;
  unint64_t v19;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v21;
  unint64_t v22;
  unint64_t v24;
  uint64_t v25;
  char v26;
  _QWORD v28[4];
  _BYTE v29[32];

  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_254300540);
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v28[-1] - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = (_QWORD *)(a2 + 160);
  swift_beginAccess();
  if (*(_QWORD *)(*(_QWORD *)(a2 + 160) + 16)
    && (swift_bridgeObjectRetain(),
        swift_bridgeObjectRetain(),
        sub_23B6B5E60(a3, a4),
        v14 = v13,
        swift_bridgeObjectRelease(),
        swift_bridgeObjectRelease(),
        (v14 & 1) != 0))
  {
    swift_bridgeObjectRetain();
    v15 = sub_23B6C73A4();
    v17 = sub_23B6C70A0(v28, a3, a4);
    if (*v16)
    {
      v18 = v16;
      (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a1, v8);
      v19 = *v18;
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      *v18 = v19;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        v19 = sub_23B6C68F8(0, *(_QWORD *)(v19 + 16) + 1, 1, v19);
        *v18 = v19;
      }
      v22 = *(_QWORD *)(v19 + 16);
      v21 = *(_QWORD *)(v19 + 24);
      if (v22 >= v21 >> 1)
      {
        v19 = sub_23B6C68F8(v21 > 1, v22 + 1, 1, v19);
        *v18 = v19;
      }
      *(_QWORD *)(v19 + 16) = v22 + 1;
      (*(void (**)(unint64_t, char *, uint64_t))(v9 + 32))(v19+ ((*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80))+ *(_QWORD *)(v9 + 72) * v22, v11, v8);
    }
    ((void (*)(_QWORD *, _QWORD))v17)(v28, 0);
    swift_bridgeObjectRelease();
    return ((uint64_t (*)(_BYTE *, _QWORD))v15)(v29, 0);
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2543005C0);
    v24 = (*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
    v25 = swift_allocObject();
    *(_OWORD *)(v25 + 16) = xmmword_23B6E1680;
    (*(void (**)(unint64_t, uint64_t, uint64_t))(v9 + 16))(v25 + v24, a1, v8);
    swift_beginAccess();
    swift_bridgeObjectRetain();
    v26 = swift_isUniquelyReferenced_nonNull_native();
    v28[0] = *v12;
    *v12 = 0x8000000000000000;
    sub_23B6D00B4(v25, a3, a4, v26);
    *v12 = v28[0];
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_endAccess();
  }
}

uint64_t sub_23B6C815C(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;

  v2[28] = a1;
  v2[29] = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254301350);
  v2[30] = swift_task_alloc();
  v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254300F20);
  v2[31] = v3;
  v2[32] = *(_QWORD *)(v3 - 8);
  v2[33] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254300990);
  v2[34] = swift_task_alloc();
  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254300F40);
  v2[35] = v4;
  v2[36] = *(_QWORD *)(v4 - 8);
  v2[37] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23B6C8234()
{
  uint64_t v0;
  uint64_t v2;
  uint64_t v3;

  if ((MEMORY[0x23B86AD48]() & 1) != 0)
  {
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    v2 = *(_QWORD *)(v0 + 232);
    *(_QWORD *)(v2 + 112) = *(_QWORD *)(v0 + 224);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(_QWORD *)(v0 + 304) = *(_QWORD *)(v2 + 120);
    if (qword_254300440 != -1)
      swift_once();
    v3 = unk_254301360;
    *(_QWORD *)(v0 + 312) = qword_254301358;
    *(_QWORD *)(v0 + 320) = v3;
    return swift_task_switch();
  }
}

uint64_t sub_23B6C8310()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;

  v1 = v0[38];
  swift_beginAccess();
  v2 = *(_QWORD *)(v1 + 120);
  if (*(_QWORD *)(v2 + 16))
  {
    v4 = v0[39];
    v3 = v0[40];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v5 = sub_23B6B5E60(v4, v3);
    v6 = v0[35];
    v7 = v0[36];
    v8 = v0[34];
    if ((v9 & 1) != 0)
    {
      (*(void (**)(_QWORD, unint64_t, _QWORD))(v7 + 16))(v0[34], *(_QWORD *)(v2 + 56) + *(_QWORD *)(v7 + 72) * v5, v0[35]);
      (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v7 + 56))(v8, 0, 1, v6);
    }
    else
    {
      (*(void (**)(_QWORD, uint64_t, uint64_t, uint64_t))(v7 + 56))(v0[34], 1, 1, v6);
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    (*(void (**)(_QWORD, uint64_t, uint64_t, _QWORD))(v0[36] + 56))(v0[34], 1, 1, v0[35]);
  }
  return swift_task_switch();
}

uint64_t sub_23B6C8418()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;

  v1 = v0[35];
  v2 = v0[36];
  v3 = v0[34];
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v3, 1, v1) == 1)
  {
    sub_23B6B772C(v3, &qword_254300990);
    sub_23B6E098C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = v0[29];
    (*(void (**)(_QWORD, uint64_t, uint64_t))(v2 + 32))(v0[37], v3, v1);
    if (*(_QWORD *)(*(_QWORD *)(v4 + 112) + 16))
    {
      v5 = swift_bridgeObjectRetain();
      v0[41] = sub_23B6CA9F8(v5);
      swift_bridgeObjectRelease();
      sub_23B6E0800();
      v0[42] = sub_23B6B8FBC(&qword_2543007A0, v6, (uint64_t (*)(uint64_t))type metadata accessor for XPCAlarmEventHandler, (uint64_t)&protocol conformance descriptor for XPCAlarmEventHandler);
      v7 = (_QWORD *)swift_task_alloc();
      v0[43] = v7;
      *v7 = v0;
      v7[1] = sub_23B6C85E4;
      return sub_23B6E080C();
    }
  }
  return sub_23B6E0A04();
}

uint64_t sub_23B6C85E4()
{
  swift_task_dealloc();
  return swift_task_switch();
}

void sub_23B6C863C()
{
  _QWORD *v0;
  uint64_t v1;
  _OWORD *v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  int64_t v7;
  _QWORD *v8;
  unint64_t v9;
  unint64_t v10;
  int64_t v11;
  unint64_t v12;
  int64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  int64_t v26;
  int64_t v27;
  unint64_t v28;
  unint64_t v29;
  _QWORD *v30;
  int64_t v31;
  unint64_t v32;
  int64_t v33;
  uint64_t *v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  char v40;
  _QWORD *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  _QWORD *v46;
  uint64_t v47;
  uint64_t v48;
  NSObject *v49;
  os_log_type_t v50;
  uint64_t v51;
  uint64_t v52;
  int64_t v53;
  uint64_t v54;
  unint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  _QWORD *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  _QWORD *v69;
  int64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  int64_t v75;
  uint64_t v76;
  _OWORD *v77;
  unint64_t v78;
  uint64_t v79;
  int64_t v80;
  int64_t v81;
  _QWORD *v82;
  uint64_t v83;

  v1 = v0[24];
  if (!v1)
  {
    v64 = v0[36];
    v63 = v0[37];
    v65 = v0[35];
    v67 = v0[32];
    v66 = v0[33];
    v68 = v0[31];
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v67 + 8))(v66, v68);
    (*(void (**)(uint64_t, uint64_t))(v64 + 8))(v63, v65);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    ((void (*)(void))v0[1])();
    return;
  }
  v69 = v0 + 2;
  v77 = v0 + 10;
  v79 = (uint64_t)(v0 + 6);
  v2 = v0 + 14;
  v3 = v0 + 26;
  v72 = v0[25];
  v73 = v1 + 64;
  v4 = -1;
  v5 = -1 << *(_BYTE *)(v1 + 32);
  if (-v5 < 64)
    v4 = ~(-1 << -(char)v5);
  v6 = v4 & *(_QWORD *)(v1 + 64);
  v75 = (unint64_t)(63 - v5) >> 6;
  swift_bridgeObjectRetain();
  v7 = 0;
  v8 = (_QWORD *)MEMORY[0x24BEE4AF8];
  v82 = v0;
  v76 = v1;
  while (1)
  {
    if (v6)
    {
      v9 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      v10 = v9 | (v7 << 6);
      goto LABEL_25;
    }
    v11 = v7 + 1;
    if (__OFADD__(v7, 1))
    {
      __break(1u);
LABEL_73:
      __break(1u);
LABEL_74:
      __break(1u);
      goto LABEL_75;
    }
    if (v11 >= v75)
      goto LABEL_33;
    v12 = *(_QWORD *)(v73 + 8 * v11);
    ++v7;
    if (!v12)
    {
      v7 = v11 + 1;
      if (v11 + 1 >= v75)
        goto LABEL_33;
      v12 = *(_QWORD *)(v73 + 8 * v7);
      if (!v12)
      {
        v7 = v11 + 2;
        if (v11 + 2 >= v75)
          goto LABEL_33;
        v12 = *(_QWORD *)(v73 + 8 * v7);
        if (!v12)
        {
          v7 = v11 + 3;
          if (v11 + 3 >= v75)
            goto LABEL_33;
          v12 = *(_QWORD *)(v73 + 8 * v7);
          if (!v12)
          {
            v7 = v11 + 4;
            if (v11 + 4 >= v75)
              goto LABEL_33;
            v12 = *(_QWORD *)(v73 + 8 * v7);
            if (!v12)
              break;
          }
        }
      }
    }
LABEL_24:
    v6 = (v12 - 1) & v12;
    v10 = __clz(__rbit64(v12)) + (v7 << 6);
LABEL_25:
    sub_23B6B5E24(*(_QWORD *)(v1 + 56) + 32 * v10, (uint64_t)v77);
    sub_23B6B5E14(v77, v2);
    sub_23B6B5E24((uint64_t)v2, v79);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2543005D0);
    if ((swift_dynamicCast() & 1) == 0)
    {
      *v3 = 0;
      v3[1] = 0;
    }
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v2);
    v14 = v0[27];
    if (v14)
    {
      v15 = v0[26];
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v8 = sub_23B6C66CC(0, v8[2] + 1, 1, v8);
      v17 = v8[2];
      v16 = v8[3];
      if (v17 >= v16 >> 1)
        v8 = sub_23B6C66CC((_QWORD *)(v16 > 1), v17 + 1, 1, v8);
      v8[2] = v17 + 1;
      v18 = &v8[2 * v17];
      v18[4] = v15;
      v18[5] = v14;
      v0 = v82;
      v1 = v76;
    }
  }
  v13 = v11 + 5;
  if (v13 >= v75)
  {
LABEL_33:
    v19 = v0[41];
    swift_release();
    swift_bridgeObjectRelease();
    v20 = sub_23B6CA9F8((uint64_t)v8);
    swift_bridgeObjectRelease();
    v21 = sub_23B6CA0A8(v19, v20);
    v22 = v21 + 56;
    v23 = -1 << *(_BYTE *)(v21 + 32);
    if (-v23 < 64)
      v24 = ~(-1 << -(char)v23);
    else
      v24 = -1;
    v25 = v24 & *(_QWORD *)(v21 + 56);
    swift_beginAccess();
    v26 = 0;
    v27 = (unint64_t)(63 - v23) >> 6;
    v70 = v27;
    v74 = v21;
    v71 = v21 + 56;
    while (1)
    {
      while (1)
      {
        if (v25)
        {
          v28 = __clz(__rbit64(v25));
          v25 &= v25 - 1;
          v29 = v28 | (v26 << 6);
          v30 = v82;
        }
        else
        {
          v31 = v26 + 1;
          v30 = v82;
          if (__OFADD__(v26, 1))
            goto LABEL_73;
          if (v31 >= v27)
          {
LABEL_70:
            swift_release();
            swift_release();
            v62 = (_QWORD *)swift_task_alloc();
            v82[43] = v62;
            *v62 = v82;
            v62[1] = sub_23B6C85E4;
            sub_23B6E080C();
            return;
          }
          v32 = *(_QWORD *)(v22 + 8 * v31);
          ++v26;
          if (!v32)
          {
            v26 = v31 + 1;
            if (v31 + 1 >= v27)
              goto LABEL_70;
            v32 = *(_QWORD *)(v22 + 8 * v26);
            if (!v32)
            {
              v26 = v31 + 2;
              if (v31 + 2 >= v27)
                goto LABEL_70;
              v32 = *(_QWORD *)(v22 + 8 * v26);
              if (!v32)
              {
                v33 = v31 + 3;
                if (v33 >= v27)
                  goto LABEL_70;
                v32 = *(_QWORD *)(v22 + 8 * v33);
                if (!v32)
                {
                  while (1)
                  {
                    v26 = v33 + 1;
                    if (__OFADD__(v33, 1))
                      goto LABEL_74;
                    if (v26 >= v27)
                      goto LABEL_70;
                    v32 = *(_QWORD *)(v22 + 8 * v26);
                    ++v33;
                    if (v32)
                      goto LABEL_53;
                  }
                }
                v26 = v33;
              }
            }
          }
LABEL_53:
          v25 = (v32 - 1) & v32;
          v29 = __clz(__rbit64(v32)) + (v26 << 6);
        }
        v34 = (uint64_t *)(*(_QWORD *)(v21 + 48) + 16 * v29);
        v35 = *v34;
        v36 = v34[1];
        v37 = *(_QWORD *)(v30[29] + 160);
        v38 = *(_QWORD *)(v37 + 16);
        swift_bridgeObjectRetain();
        if (v38)
          break;
LABEL_59:
        if (qword_254300468 != -1)
          swift_once();
        v48 = sub_23B6E0668();
        __swift_project_value_buffer(v48, (uint64_t)qword_254300448);
        swift_bridgeObjectRetain_n();
        v49 = sub_23B6E0650();
        v50 = sub_23B6E08B4();
        if (os_log_type_enabled(v49, v50))
        {
          v81 = v26;
          v51 = swift_slowAlloc();
          v52 = v21;
          v53 = v27;
          v54 = v22;
          v55 = v25;
          v56 = swift_slowAlloc();
          v83 = v56;
          *(_DWORD *)v51 = 136446210;
          swift_bridgeObjectRetain();
          *(_QWORD *)(v51 + 4) = sub_23B6BE8C4(v35, v36, &v83);
          swift_bridgeObjectRelease_n();
          _os_log_impl(&dword_23B6B3000, v49, v50, "Received alarm event for stream%{public}s with no subscribers!", (uint8_t *)v51, 0xCu);
          swift_arrayDestroy();
          v57 = v56;
          v25 = v55;
          v22 = v54;
          v27 = v53;
          v21 = v52;
          MEMORY[0x23B86B840](v57, -1, -1);
          v58 = v51;
          v26 = v81;
          MEMORY[0x23B86B840](v58, -1, -1);

          swift_bridgeObjectRelease();
        }
        else
        {
          swift_bridgeObjectRelease_n();

        }
      }
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v39 = sub_23B6B5E60(v35, v36);
      if ((v40 & 1) == 0)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        goto LABEL_59;
      }
      v78 = v25;
      v80 = v26;
      v41 = v30;
      v42 = v30[30];
      v43 = *(_QWORD *)(*(_QWORD *)(v37 + 56) + 8 * v39);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v44 = sub_23B6E07DC();
      v45 = *(_QWORD *)(v44 - 8);
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v45 + 56))(v42, 1, 1, v44);
      v46 = (_QWORD *)swift_allocObject();
      v46[2] = 0;
      v46[3] = 0;
      v46[4] = v72;
      v46[5] = v43;
      v46[6] = v35;
      v46[7] = v36;
      LODWORD(v42) = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v45 + 48))(v42, 1, v44);
      swift_bridgeObjectRetain();
      swift_retain();
      v47 = v41[30];
      if ((_DWORD)v42 == 1)
      {
        sub_23B6B772C(v41[30], &qword_254301350);
      }
      else
      {
        sub_23B6E07D0();
        (*(void (**)(uint64_t, uint64_t))(v45 + 8))(v47, v44);
      }
      v21 = v74;
      if (v46[2])
      {
        swift_getObjectType();
        swift_unknownObjectRetain();
        v59 = sub_23B6E07AC();
        v61 = v60;
        swift_unknownObjectRelease();
      }
      else
      {
        v59 = 0;
        v61 = 0;
      }
      v27 = v70;
      v22 = v71;
      if (v61 | v59)
      {
        *v69 = 0;
        v69[1] = 0;
        v82[4] = v59;
        v82[5] = v61;
      }
      v26 = v80;
      swift_task_create();
      swift_bridgeObjectRelease();
      swift_release();
      v25 = v78;
    }
  }
  v12 = *(_QWORD *)(v73 + 8 * v13);
  if (v12)
  {
    v7 = v13;
    goto LABEL_24;
  }
  while (1)
  {
    v7 = v13 + 1;
    if (__OFADD__(v13, 1))
      break;
    if (v7 >= v75)
      goto LABEL_33;
    v12 = *(_QWORD *)(v73 + 8 * v7);
    ++v13;
    if (v12)
      goto LABEL_24;
  }
LABEL_75:
  __break(1u);
}

uint64_t sub_23B6C8EAC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;

  v7[16] = a6;
  v7[17] = a7;
  v7[14] = a4;
  v7[15] = a5;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A47058);
  v7[18] = v8;
  v7[19] = *(_QWORD *)(v8 - 8);
  v7[20] = swift_task_alloc();
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_254300540);
  v7[21] = v9;
  v7[22] = *(_QWORD *)(v9 - 8);
  v7[23] = swift_task_alloc();
  if (qword_254300F80 != -1)
    swift_once();
  swift_beginAccess();
  return swift_task_switch();
}

uint64_t sub_23B6C8F84()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t result;

  v1 = qword_254300FA8;
  *(_QWORD *)(v0 + 192) = qword_254300FA8;
  if (v1)
  {
    swift_retain();
    return swift_task_switch();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_23B6C8FD4()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 200) = *(_QWORD *)(*(_QWORD *)(v0 + 192) + 128);
  swift_retain();
  return swift_task_switch();
}

uint64_t sub_23B6C901C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t i;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t ObjectType;
  uint64_t (*v9)(uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v20;

  v1 = v0[25];
  swift_beginAccess();
  v2 = *(_QWORD *)(v1 + 112);
  v0[26] = v2;
  v3 = *(_QWORD *)(v2 + 16);
  v0[27] = v3;
  if (!v3)
  {
LABEL_10:
    swift_release();
    swift_release();
    return swift_task_switch();
  }
  swift_bridgeObjectRetain();
  swift_beginAccess();
  for (i = 0; ; i = v0[28] + 1)
  {
    v0[28] = i;
    v5 = v0[25];
    v6 = v0[26] + 16 * i;
    v0[29] = *(_QWORD *)(v6 + 32);
    v7 = *(_QWORD *)(v6 + 40);
    ObjectType = swift_getObjectType();
    v9 = *(uint64_t (**)(uint64_t, uint64_t))(v7 + 24);
    swift_unknownObjectRetain();
    v10 = v9(ObjectType, v7);
    v12 = v11;
    v0[30] = v11;
    if (!*(_QWORD *)(*(_QWORD *)(v5 + 128) + 16))
      goto LABEL_6;
    v13 = v10;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_23B6B5E60(v13, v12);
    if ((v14 & 1) != 0)
      break;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
LABEL_6:
    swift_bridgeObjectRelease();
    v15 = v0[28];
    v16 = v0[27];
    swift_unknownObjectRelease();
    if (v15 + 1 == v16)
    {
      swift_bridgeObjectRelease();
      goto LABEL_10;
    }
  }
  v18 = v0[25];
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_23B6B8FBC((unint64_t *)&qword_254301320, 255, (uint64_t (*)(uint64_t))type metadata accessor for ActorServiceCollection, (uint64_t)&protocol conformance descriptor for ActorServiceCollection);
  v19 = (_QWORD *)swift_task_alloc();
  v0[31] = v19;
  v19[2] = v18;
  v19[3] = v13;
  v19[4] = v12;
  v20 = (_QWORD *)swift_task_alloc();
  v0[32] = v20;
  *v20 = v0;
  v20[1] = sub_23B6C93D4;
  return sub_23B6E0A94();
}

uint64_t sub_23B6C924C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v14)(uint64_t, unint64_t, uint64_t);
  uint64_t v15;
  uint64_t v16;

  v2 = *(_QWORD *)(v0 + 112);
  v1 = *(_QWORD *)(v0 + 120);
  sub_23B6E050C();
  sub_23B6E04F4();
  *(_QWORD *)(v0 + 104) = v2;
  swift_retain_n();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2543005E0);
  swift_task_localValuePush();
  v3 = *(_QWORD *)(v1 + 16);
  if (v3)
  {
    v4 = *(_QWORD *)(v0 + 176);
    v16 = *(_QWORD *)(v0 + 152);
    v5 = *(_QWORD *)(v0 + 120)
       + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
    v15 = *(_QWORD *)(v4 + 72);
    v6 = v4;
    v14 = *(void (**)(uint64_t, unint64_t, uint64_t))(v4 + 16);
    swift_bridgeObjectRetain();
    do
    {
      v7 = *(_QWORD *)(v0 + 184);
      v9 = *(_QWORD *)(v0 + 160);
      v8 = *(_QWORD *)(v0 + 168);
      v11 = *(_QWORD *)(v0 + 136);
      v10 = *(_QWORD *)(v0 + 144);
      v12 = *(_QWORD *)(v0 + 128);
      v14(v7, v5, v8);
      *(_QWORD *)(v0 + 88) = v12;
      *(_QWORD *)(v0 + 96) = v11;
      swift_bridgeObjectRetain();
      sub_23B6E07F4();
      (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v9, v10);
      (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v7, v8);
      v5 += v15;
      --v3;
    }
    while (v3);
    swift_bridgeObjectRelease();
  }
  swift_task_localValuePop();
  swift_release();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23B6C93D4()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 264) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23B6C9448()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t ObjectType;
  uint64_t (*v8)(uint64_t, uint64_t);
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;

  while (1)
  {
    do
    {
      swift_bridgeObjectRelease();
      v1 = v0[28];
      v2 = v0[27];
      swift_unknownObjectRelease();
      if (v1 + 1 == v2)
      {
        swift_release();
        swift_bridgeObjectRelease();
        swift_release();
        return swift_task_switch();
      }
      v3 = v0[28] + 1;
      v0[28] = v3;
      v4 = v0[25];
      v5 = v0[26] + 16 * v3;
      v0[29] = *(_QWORD *)(v5 + 32);
      v6 = *(_QWORD *)(v5 + 40);
      ObjectType = swift_getObjectType();
      v8 = *(uint64_t (**)(uint64_t, uint64_t))(v6 + 24);
      swift_unknownObjectRetain();
      v9 = v8(ObjectType, v6);
      v11 = v10;
      v0[30] = v10;
    }
    while (!*(_QWORD *)(*(_QWORD *)(v4 + 128) + 16));
    v12 = v9;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_23B6B5E60(v12, v11);
    if ((v13 & 1) != 0)
      break;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  v15 = v0[25];
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_23B6B8FBC((unint64_t *)&qword_254301320, 255, (uint64_t (*)(uint64_t))type metadata accessor for ActorServiceCollection, (uint64_t)&protocol conformance descriptor for ActorServiceCollection);
  v16 = (_QWORD *)swift_task_alloc();
  v0[31] = v16;
  v16[2] = v15;
  v16[3] = v12;
  v16[4] = v11;
  v17 = (_QWORD *)swift_task_alloc();
  v0[32] = v17;
  *v17 = v0;
  v17[1] = sub_23B6C93D4;
  return sub_23B6E0A94();
}

uint64_t sub_23B6C9628()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_unknownObjectRelease();
  return swift_task_switch();
}

uint64_t sub_23B6C968C()
{
  swift_release();
  return swift_task_switch();
}

uint64_t sub_23B6C96C8()
{
  uint64_t v0;

  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t XPCAlarmEventHandler.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_defaultActor_destroy();
  return v0;
}

uint64_t XPCAlarmEventHandler.__deallocating_deinit()
{
  XPCAlarmEventHandler.deinit();
  return swift_defaultActor_deallocate();
}

uint64_t XPCAlarmEventHandler.unownedExecutor.getter()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_23B6C9788()
{
  uint64_t v0;

  v0 = sub_23B6E0668();
  __swift_allocate_value_buffer(v0, qword_254300498);
  __swift_project_value_buffer(v0, (uint64_t)qword_254300498);
  return sub_23B6E065C();
}

uint64_t sub_23B6C9800(uint64_t a1)
{
  uint64_t *v1;

  return sub_23B6C7DB4(a1, v1[2], v1[3], v1[4]);
}

uint64_t sub_23B6C980C(uint64_t a1)
{
  uint64_t *v1;

  return sub_23B6C7EB0(a1, v1[2], v1[3], v1[4]);
}

uint64_t (*sub_23B6C9818(_QWORD *a1, uint64_t a2, uint64_t a3))()
{
  _QWORD *v6;
  char isUniquelyReferenced_nonNull_native;

  v6 = malloc(0x58uLL);
  *a1 = v6;
  v6[8] = a3;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  swift_bridgeObjectRetain();
  v6[9] = sub_23B6C9FB4(v6);
  v6[10] = sub_23B6C9AAC(v6 + 4, a2, a3, isUniquelyReferenced_nonNull_native);
  return sub_23B6C98A8;
}

uint64_t (*sub_23B6C98AC(_QWORD *a1, uint64_t a2, uint64_t a3))()
{
  _QWORD *v6;
  char isUniquelyReferenced_nonNull_native;

  v6 = malloc(0x58uLL);
  *a1 = v6;
  v6[8] = a3;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  swift_bridgeObjectRetain();
  v6[9] = sub_23B6C9FB4(v6);
  v6[10] = sub_23B6C9BEC(v6 + 4, a2, a3, isUniquelyReferenced_nonNull_native);
  return sub_23B6C98A8;
}

uint64_t (*sub_23B6C993C(_QWORD *a1, uint64_t a2, uint64_t a3))()
{
  _QWORD *v6;
  char isUniquelyReferenced_nonNull_native;

  v6 = malloc(0x58uLL);
  *a1 = v6;
  v6[8] = a3;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  swift_bridgeObjectRetain();
  v6[9] = sub_23B6C9FB4(v6);
  v6[10] = sub_23B6C9D5C(v6 + 4, a2, a3, isUniquelyReferenced_nonNull_native);
  return sub_23B6C98A8;
}

uint64_t (*sub_23B6C99CC(_QWORD *a1, uint64_t a2, uint64_t a3))()
{
  _QWORD *v6;
  char isUniquelyReferenced_nonNull_native;

  v6 = malloc(0x58uLL);
  *a1 = v6;
  v6[8] = a3;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  swift_bridgeObjectRetain();
  v6[9] = sub_23B6C9FD4(v6);
  v6[10] = sub_23B6C9E88(v6 + 4, a2, a3, isUniquelyReferenced_nonNull_native);
  return sub_23B6C98A8;
}

void sub_23B6C9A5C(uint64_t a1)
{
  void *v1;
  void (*v2)(void *, _QWORD);

  v1 = *(void **)a1;
  v2 = *(void (**)(void *, _QWORD))(*(_QWORD *)a1 + 72);
  (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)a1 + 80))(*(_QWORD *)a1 + 32, 0);
  swift_bridgeObjectRelease();
  v2(v1, 0);
  free(v1);
}

void (*sub_23B6C9AAC(_QWORD *a1, uint64_t a2, uint64_t a3, char a4))(uint64_t **a1, uint64_t a2)
{
  uint64_t *v4;
  uint64_t *v5;
  _QWORD *v10;
  uint64_t v11;
  char v12;
  unint64_t v13;
  uint64_t v14;
  _BOOL8 v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  char v21;
  void (*result)(uint64_t **, uint64_t);

  v5 = v4;
  v10 = malloc(0x30uLL);
  *a1 = v10;
  v10[2] = a3;
  v10[3] = v5;
  v10[1] = a2;
  v11 = *v5;
  v13 = sub_23B6B5E60(a2, a3);
  *((_BYTE *)v10 + 40) = v12 & 1;
  v14 = *(_QWORD *)(v11 + 16);
  v15 = (v12 & 1) == 0;
  v16 = v14 + v15;
  if (__OFADD__(v14, v15))
  {
    __break(1u);
  }
  else
  {
    v17 = v12;
    v18 = *(_QWORD *)(v11 + 24);
    if (v18 >= v16 && (a4 & 1) != 0)
    {
LABEL_7:
      v10[4] = v13;
      if ((v17 & 1) != 0)
      {
LABEL_8:
        v19 = *(_QWORD *)(*(_QWORD *)(*v5 + 56) + 8 * v13);
LABEL_12:
        *v10 = v19;
        return sub_23B6C9BD8;
      }
LABEL_11:
      v19 = 0;
      goto LABEL_12;
    }
    if (v18 >= v16 && (a4 & 1) == 0)
    {
      sub_23B6DD2A0();
      goto LABEL_7;
    }
    sub_23B6DBB34(v16, a4 & 1);
    v20 = sub_23B6B5E60(a2, a3);
    if ((v17 & 1) == (v21 & 1))
    {
      v13 = v20;
      v10[4] = v20;
      if ((v17 & 1) != 0)
        goto LABEL_8;
      goto LABEL_11;
    }
  }
  result = (void (*)(uint64_t **, uint64_t))sub_23B6E0AAC();
  __break(1u);
  return result;
}

void sub_23B6C9BD8(uint64_t **a1, uint64_t a2)
{
  sub_23B6C9D18(a1, a2, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, _QWORD))sub_23B6DD054, (void (*)(uint64_t, _QWORD))sub_23B6DC980);
}

void (*sub_23B6C9BEC(_QWORD *a1, uint64_t a2, uint64_t a3, char a4))(uint64_t **a1, uint64_t a2)
{
  uint64_t *v4;
  uint64_t *v5;
  _QWORD *v10;
  uint64_t v11;
  char v12;
  unint64_t v13;
  uint64_t v14;
  _BOOL8 v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  char v21;
  void (*result)(uint64_t **, uint64_t);

  v5 = v4;
  v10 = malloc(0x30uLL);
  *a1 = v10;
  v10[2] = a3;
  v10[3] = v5;
  v10[1] = a2;
  v11 = *v5;
  v13 = sub_23B6B5E60(a2, a3);
  *((_BYTE *)v10 + 40) = v12 & 1;
  v14 = *(_QWORD *)(v11 + 16);
  v15 = (v12 & 1) == 0;
  v16 = v14 + v15;
  if (__OFADD__(v14, v15))
  {
    __break(1u);
  }
  else
  {
    v17 = v12;
    v18 = *(_QWORD *)(v11 + 24);
    if (v18 >= v16 && (a4 & 1) != 0)
    {
LABEL_7:
      v10[4] = v13;
      if ((v17 & 1) != 0)
      {
LABEL_8:
        v19 = *(_QWORD *)(*(_QWORD *)(*v5 + 56) + 8 * v13);
LABEL_12:
        *v10 = v19;
        return sub_23B6C9BD8;
      }
LABEL_11:
      v19 = 0;
      goto LABEL_12;
    }
    if (v18 >= v16 && (a4 & 1) == 0)
    {
      sub_23B6DD2D4();
      goto LABEL_7;
    }
    sub_23B6DBB68(v16, a4 & 1);
    v20 = sub_23B6B5E60(a2, a3);
    if ((v17 & 1) == (v21 & 1))
    {
      v13 = v20;
      v10[4] = v20;
      if ((v17 & 1) != 0)
        goto LABEL_8;
      goto LABEL_11;
    }
  }
  result = (void (*)(uint64_t **, uint64_t))sub_23B6E0AAC();
  __break(1u);
  return result;
}

void sub_23B6C9D18(uint64_t **a1, uint64_t a2, void (*a3)(uint64_t, uint64_t, uint64_t, uint64_t, _QWORD), void (*a4)(uint64_t, _QWORD))
{
  uint64_t *v4;

  v4 = *a1;
  sub_23B6CA000(*a1, *((_BYTE *)*a1 + 40), (_QWORD *)(*a1)[3], (*a1)[4], (*a1)[1], (*a1)[2], a3, a4);
  swift_bridgeObjectRelease();
  free(v4);
}

void (*sub_23B6C9D5C(_QWORD *a1, uint64_t a2, uint64_t a3, char a4))(uint64_t **a1, uint64_t a2)
{
  uint64_t *v4;
  uint64_t *v5;
  _QWORD *v10;
  uint64_t v11;
  char v12;
  unint64_t v13;
  uint64_t v14;
  _BOOL8 v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  char v21;
  void (*result)(uint64_t **, uint64_t);

  v5 = v4;
  v10 = malloc(0x30uLL);
  *a1 = v10;
  v10[2] = a3;
  v10[3] = v5;
  v10[1] = a2;
  v11 = *v5;
  v13 = sub_23B6B5E60(a2, a3);
  *((_BYTE *)v10 + 40) = v12 & 1;
  v14 = *(_QWORD *)(v11 + 16);
  v15 = (v12 & 1) == 0;
  v16 = v14 + v15;
  if (__OFADD__(v14, v15))
  {
    __break(1u);
  }
  else
  {
    v17 = v12;
    v18 = *(_QWORD *)(v11 + 24);
    if (v18 >= v16 && (a4 & 1) != 0)
    {
LABEL_7:
      v10[4] = v13;
      if ((v17 & 1) != 0)
      {
LABEL_8:
        v19 = *(_QWORD *)(*(_QWORD *)(*v5 + 56) + 8 * v13);
LABEL_12:
        *v10 = v19;
        return sub_23B6C9BD8;
      }
LABEL_11:
      v19 = 0;
      goto LABEL_12;
    }
    if (v18 >= v16 && (a4 & 1) == 0)
    {
      sub_23B6DD5EC();
      goto LABEL_7;
    }
    sub_23B6DBFA4(v16, a4 & 1);
    v20 = sub_23B6B5E60(a2, a3);
    if ((v17 & 1) == (v21 & 1))
    {
      v13 = v20;
      v10[4] = v20;
      if ((v17 & 1) != 0)
        goto LABEL_8;
      goto LABEL_11;
    }
  }
  result = (void (*)(uint64_t **, uint64_t))sub_23B6E0AAC();
  __break(1u);
  return result;
}

void (*sub_23B6C9E88(_QWORD *a1, uint64_t a2, uint64_t a3, char a4))(uint64_t **a1, uint64_t a2)
{
  uint64_t *v4;
  uint64_t *v5;
  _QWORD *v10;
  uint64_t v11;
  char v12;
  unint64_t v13;
  uint64_t v14;
  _BOOL8 v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  char v21;
  void (*result)(uint64_t **, uint64_t);

  v5 = v4;
  v10 = malloc(0x30uLL);
  *a1 = v10;
  v10[2] = a3;
  v10[3] = v5;
  v10[1] = a2;
  v11 = *v5;
  v13 = sub_23B6B5E60(a2, a3);
  *((_BYTE *)v10 + 40) = v12 & 1;
  v14 = *(_QWORD *)(v11 + 16);
  v15 = (v12 & 1) == 0;
  v16 = v14 + v15;
  if (__OFADD__(v14, v15))
  {
    __break(1u);
  }
  else
  {
    v17 = v12;
    v18 = *(_QWORD *)(v11 + 24);
    if (v18 >= v16 && (a4 & 1) != 0)
    {
LABEL_7:
      v10[4] = v13;
      if ((v17 & 1) != 0)
      {
LABEL_8:
        v19 = *(_QWORD *)(*(_QWORD *)(*v5 + 56) + 8 * v13);
LABEL_12:
        *v10 = v19;
        return sub_23B6C9BD8;
      }
LABEL_11:
      v19 = 0;
      goto LABEL_12;
    }
    if (v18 >= v16 && (a4 & 1) == 0)
    {
      sub_23B6DD60C();
      goto LABEL_7;
    }
    sub_23B6DBFC4(v16, a4 & 1);
    v20 = sub_23B6B5E60(a2, a3);
    if ((v17 & 1) == (v21 & 1))
    {
      v13 = v20;
      v10[4] = v20;
      if ((v17 & 1) != 0)
        goto LABEL_8;
      goto LABEL_11;
    }
  }
  result = (void (*)(uint64_t **, uint64_t))sub_23B6E0AAC();
  __break(1u);
  return result;
}

uint64_t (*sub_23B6C9FB4(_QWORD *a1))()
{
  _QWORD *v1;

  *a1 = *v1;
  a1[1] = v1;
  *v1 = 0x8000000000000000;
  return sub_23B6CAC6C;
}

uint64_t (*sub_23B6C9FD4(_QWORD *a1))(uint64_t result)
{
  _QWORD *v1;

  *a1 = *v1;
  a1[1] = v1;
  *v1 = 0x8000000000000000;
  return sub_23B6C9FF4;
}

uint64_t sub_23B6C9FF4(uint64_t result)
{
  **(_QWORD **)(result + 8) = *(_QWORD *)result;
  return result;
}

uint64_t sub_23B6CA000(uint64_t *a1, char a2, _QWORD *a3, uint64_t a4, uint64_t a5, uint64_t a6, void (*a7)(uint64_t, uint64_t, uint64_t, uint64_t, _QWORD), void (*a8)(uint64_t, _QWORD))
{
  uint64_t v10;

  v10 = *a1;
  if (*a1)
  {
    if ((a2 & 1) != 0)
    {
      *(_QWORD *)(*(_QWORD *)(*a3 + 56) + 8 * a4) = v10;
    }
    else
    {
      a7(a4, a5, a6, v10, *a3);
      swift_bridgeObjectRetain();
    }
  }
  else if ((a2 & 1) != 0)
  {
    swift_arrayDestroy();
    a8(a4, *a3);
  }
  return swift_bridgeObjectRetain();
}

uint64_t sub_23B6CA0A8(uint64_t isStackAllocationSafe, uint64_t a2)
{
  uint64_t v3;
  char v4;
  unint64_t v5;
  size_t v6;
  uint64_t v7;
  void *v8;
  _QWORD v10[2];

  v3 = isStackAllocationSafe;
  v10[1] = *MEMORY[0x24BDAC8D0];
  v4 = *(_BYTE *)(a2 + 32);
  v5 = (unint64_t)((1 << v4) + 63) >> 6;
  v6 = 8 * v5;
  if ((v4 & 0x3Fu) <= 0xD
    || (isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    MEMORY[0x24BDAC7A8](isStackAllocationSafe);
    bzero((char *)v10 - ((v6 + 15) & 0x3FFFFFFFFFFFFFF0), v6);
    v7 = sub_23B6CA228((uint64_t)v10 - ((v6 + 15) & 0x3FFFFFFFFFFFFFF0), v5, a2, v3);
    swift_release();
  }
  else
  {
    v8 = (void *)swift_slowAlloc();
    bzero(v8, v6);
    v7 = sub_23B6CA228((uint64_t)v8, v5, a2, v3);
    swift_release();
    MEMORY[0x23B86B840](v8, -1, -1);
  }
  return v7;
}

uint64_t sub_23B6CA228(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  int64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  int64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  BOOL v27;
  uint64_t v28;
  unint64_t i;
  unint64_t v30;
  _QWORD *v31;
  BOOL v32;
  BOOL v33;
  int64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  int64_t v41;
  unint64_t v42;
  int64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  uint64_t v50;
  _QWORD *v51;
  BOOL v52;
  uint64_t v53;
  _QWORD *v54;
  BOOL v55;
  unint64_t *v57;
  uint64_t v58;
  int64_t v59;
  uint64_t v60;
  uint64_t v61;
  int64_t v62;
  int64_t v63;

  v4 = a4;
  v5 = a3;
  v57 = (unint64_t *)result;
  if (*(_QWORD *)(a4 + 16) < *(_QWORD *)(a3 + 16))
  {
    v6 = 0;
    v58 = a4 + 56;
    v7 = 1 << *(_BYTE *)(a4 + 32);
    if (v7 < 64)
      v8 = ~(-1 << v7);
    else
      v8 = -1;
    v9 = v8 & *(_QWORD *)(a4 + 56);
    v59 = (unint64_t)(v7 + 63) >> 6;
    v61 = 0;
    v10 = a3 + 56;
    while (1)
    {
      while (1)
      {
        if (v9)
        {
          v11 = __clz(__rbit64(v9));
          v9 &= v9 - 1;
          v62 = v6;
          v12 = v11 | (v6 << 6);
        }
        else
        {
          v13 = v6 + 1;
          if (__OFADD__(v6, 1))
          {
            __break(1u);
            goto LABEL_81;
          }
          if (v13 >= v59)
            goto LABEL_79;
          v14 = *(_QWORD *)(v58 + 8 * v13);
          v15 = v6 + 1;
          if (!v14)
          {
            v15 = v6 + 2;
            if (v6 + 2 >= v59)
              goto LABEL_79;
            v14 = *(_QWORD *)(v58 + 8 * v15);
            if (!v14)
            {
              v15 = v6 + 3;
              if (v6 + 3 >= v59)
                goto LABEL_79;
              v14 = *(_QWORD *)(v58 + 8 * v15);
              if (!v14)
              {
                v16 = v6 + 4;
                if (v6 + 4 >= v59)
                  goto LABEL_79;
                v14 = *(_QWORD *)(v58 + 8 * v16);
                if (!v14)
                {
                  while (1)
                  {
                    v15 = v16 + 1;
                    if (__OFADD__(v16, 1))
                      goto LABEL_83;
                    if (v15 >= v59)
                      goto LABEL_79;
                    v14 = *(_QWORD *)(v58 + 8 * v15);
                    ++v16;
                    if (v14)
                      goto LABEL_22;
                  }
                }
                v15 = v6 + 4;
              }
            }
          }
LABEL_22:
          v9 = (v14 - 1) & v14;
          v62 = v15;
          v12 = __clz(__rbit64(v14)) + (v15 << 6);
        }
        v17 = (uint64_t *)(*(_QWORD *)(v4 + 48) + 16 * v12);
        v19 = *v17;
        v18 = v17[1];
        sub_23B6E0B00();
        swift_bridgeObjectRetain();
        sub_23B6E0710();
        v20 = sub_23B6E0B18();
        v21 = -1 << *(_BYTE *)(v5 + 32);
        v22 = v20 & ~v21;
        v23 = v22 >> 6;
        v24 = 1 << v22;
        if (((1 << v22) & *(_QWORD *)(v10 + 8 * (v22 >> 6))) != 0)
          break;
LABEL_6:
        result = swift_bridgeObjectRelease();
        v6 = v62;
        v5 = a3;
        v4 = a4;
      }
      v25 = *(_QWORD *)(a3 + 48);
      v26 = (_QWORD *)(v25 + 16 * v22);
      v27 = *v26 == v19 && v26[1] == v18;
      if (!v27 && (sub_23B6E0A88() & 1) == 0)
      {
        v28 = ~v21;
        for (i = v22 + 1; ; i = v30 + 1)
        {
          v30 = i & v28;
          if (((*(_QWORD *)(v10 + (((i & v28) >> 3) & 0xFFFFFFFFFFFFF8)) >> (i & v28)) & 1) == 0)
            break;
          v31 = (_QWORD *)(v25 + 16 * v30);
          v32 = *v31 == v19 && v31[1] == v18;
          if (v32 || (sub_23B6E0A88() & 1) != 0)
          {
            result = swift_bridgeObjectRelease();
            v23 = v30 >> 6;
            v24 = 1 << v30;
            goto LABEL_38;
          }
        }
        goto LABEL_6;
      }
      result = swift_bridgeObjectRelease();
LABEL_38:
      v6 = v62;
      v5 = a3;
      v57[v23] |= v24;
      v33 = __OFADD__(v61++, 1);
      v4 = a4;
      if (v33)
        goto LABEL_82;
    }
  }
  v34 = 0;
  v60 = a3 + 56;
  v61 = 0;
  v35 = 1 << *(_BYTE *)(a3 + 32);
  if (v35 < 64)
    v36 = ~(-1 << v35);
  else
    v36 = -1;
  v37 = v36 & *(_QWORD *)(a3 + 56);
  v63 = (unint64_t)(v35 + 63) >> 6;
  v38 = a4 + 56;
  while (1)
  {
    if (v37)
    {
      v39 = __clz(__rbit64(v37));
      v37 &= v37 - 1;
      v40 = v39 | (v34 << 6);
      goto LABEL_63;
    }
    v41 = v34 + 1;
    if (__OFADD__(v34, 1))
    {
LABEL_81:
      __break(1u);
LABEL_82:
      __break(1u);
LABEL_83:
      __break(1u);
      goto LABEL_84;
    }
    if (v41 >= v63)
      goto LABEL_79;
    v42 = *(_QWORD *)(v60 + 8 * v41);
    ++v34;
    if (!v42)
    {
      v34 = v41 + 1;
      if (v41 + 1 >= v63)
        goto LABEL_79;
      v42 = *(_QWORD *)(v60 + 8 * v34);
      if (!v42)
      {
        v34 = v41 + 2;
        if (v41 + 2 >= v63)
          goto LABEL_79;
        v42 = *(_QWORD *)(v60 + 8 * v34);
        if (!v42)
          break;
      }
    }
LABEL_62:
    v37 = (v42 - 1) & v42;
    v40 = __clz(__rbit64(v42)) + (v34 << 6);
LABEL_63:
    v44 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v40);
    v46 = *v44;
    v45 = v44[1];
    sub_23B6E0B00();
    swift_bridgeObjectRetain();
    sub_23B6E0710();
    v47 = sub_23B6E0B18();
    v48 = -1 << *(_BYTE *)(v4 + 32);
    v49 = v47 & ~v48;
    if (((*(_QWORD *)(v38 + ((v49 >> 3) & 0xFFFFFFFFFFFFF8)) >> v49) & 1) == 0)
      goto LABEL_46;
    v50 = *(_QWORD *)(a4 + 48);
    v51 = (_QWORD *)(v50 + 16 * v49);
    v52 = *v51 == v46 && v51[1] == v45;
    if (v52 || (sub_23B6E0A88() & 1) != 0)
    {
LABEL_76:
      result = swift_bridgeObjectRelease();
      *(unint64_t *)((char *)v57 + ((v40 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v40;
      v33 = __OFADD__(v61++, 1);
      v5 = a3;
      v4 = a4;
      if (v33)
      {
        __break(1u);
LABEL_79:
        swift_retain();
        return sub_23B6CA764(v57, a2, v61, v5);
      }
    }
    else
    {
      v53 = ~v48;
      while (1)
      {
        v49 = (v49 + 1) & v53;
        if (((*(_QWORD *)(v38 + ((v49 >> 3) & 0xFFFFFFFFFFFFF8)) >> v49) & 1) == 0)
          break;
        v54 = (_QWORD *)(v50 + 16 * v49);
        v55 = *v54 == v46 && v54[1] == v45;
        if (v55 || (sub_23B6E0A88() & 1) != 0)
          goto LABEL_76;
      }
LABEL_46:
      result = swift_bridgeObjectRelease();
      v5 = a3;
      v4 = a4;
    }
  }
  v43 = v41 + 3;
  if (v43 >= v63)
    goto LABEL_79;
  v42 = *(_QWORD *)(v60 + 8 * v43);
  if (v42)
  {
    v34 = v43;
    goto LABEL_62;
  }
  while (1)
  {
    v34 = v43 + 1;
    if (__OFADD__(v43, 1))
      break;
    if (v34 >= v63)
      goto LABEL_79;
    v42 = *(_QWORD *)(v60 + 8 * v34);
    ++v43;
    if (v42)
      goto LABEL_62;
  }
LABEL_84:
  __break(1u);
  return result;
}

uint64_t sub_23B6CA764(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  char v24;
  unint64_t v25;
  BOOL v26;
  uint64_t v27;
  _QWORD *v28;
  uint64_t v30;

  v4 = a4;
  if (!a3)
  {
    v8 = MEMORY[0x24BEE4B08];
LABEL_36:
    swift_release();
    return v8;
  }
  v5 = a3;
  if (*(_QWORD *)(a4 + 16) == a3)
    return v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256A47060);
  result = sub_23B6E0980();
  v8 = result;
  v30 = a2;
  if (a2 < 1)
    v9 = 0;
  else
    v9 = *a1;
  v10 = 0;
  v11 = result + 56;
  while (1)
  {
    if (v9)
    {
      v12 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      v13 = v12 | (v10 << 6);
      goto LABEL_24;
    }
    v14 = v10 + 1;
    if (__OFADD__(v10, 1))
      goto LABEL_39;
    if (v14 >= v30)
      goto LABEL_36;
    v15 = a1[v14];
    ++v10;
    if (!v15)
    {
      v10 = v14 + 1;
      if (v14 + 1 >= v30)
        goto LABEL_36;
      v15 = a1[v10];
      if (!v15)
      {
        v10 = v14 + 2;
        if (v14 + 2 >= v30)
          goto LABEL_36;
        v15 = a1[v10];
        if (!v15)
          break;
      }
    }
LABEL_23:
    v9 = (v15 - 1) & v15;
    v13 = __clz(__rbit64(v15)) + (v10 << 6);
LABEL_24:
    v17 = (uint64_t *)(*(_QWORD *)(v4 + 48) + 16 * v13);
    v18 = *v17;
    v19 = v17[1];
    sub_23B6E0B00();
    swift_bridgeObjectRetain();
    sub_23B6E0710();
    result = sub_23B6E0B18();
    v20 = -1 << *(_BYTE *)(v8 + 32);
    v21 = result & ~v20;
    v22 = v21 >> 6;
    if (((-1 << v21) & ~*(_QWORD *)(v11 + 8 * (v21 >> 6))) != 0)
    {
      v23 = __clz(__rbit64((-1 << v21) & ~*(_QWORD *)(v11 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v24 = 0;
      v25 = (unint64_t)(63 - v20) >> 6;
      do
      {
        if (++v22 == v25 && (v24 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        v26 = v22 == v25;
        if (v22 == v25)
          v22 = 0;
        v24 |= v26;
        v27 = *(_QWORD *)(v11 + 8 * v22);
      }
      while (v27 == -1);
      v23 = __clz(__rbit64(~v27)) + (v22 << 6);
    }
    *(_QWORD *)(v11 + ((v23 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v23;
    v28 = (_QWORD *)(*(_QWORD *)(v8 + 48) + 16 * v23);
    *v28 = v18;
    v28[1] = v19;
    ++*(_QWORD *)(v8 + 16);
    if (__OFSUB__(v5--, 1))
    {
LABEL_38:
      __break(1u);
LABEL_39:
      __break(1u);
      goto LABEL_40;
    }
    if (!v5)
      goto LABEL_36;
  }
  v16 = v14 + 3;
  if (v16 >= v30)
    goto LABEL_36;
  v15 = a1[v16];
  if (v15)
  {
    v10 = v16;
    goto LABEL_23;
  }
  while (1)
  {
    v10 = v16 + 1;
    if (__OFADD__(v16, 1))
      break;
    if (v10 >= v30)
      goto LABEL_36;
    v15 = a1[v10];
    ++v16;
    if (v15)
      goto LABEL_23;
  }
LABEL_40:
  __break(1u);
  return result;
}

uint64_t sub_23B6CA9F8(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = *(_QWORD *)(a1 + 16);
  result = sub_23B6E083C();
  v8 = result;
  if (v2)
  {
    v4 = (uint64_t *)(a1 + 40);
    do
    {
      v5 = *(v4 - 1);
      v6 = *v4;
      swift_bridgeObjectRetain();
      sub_23B6DE184(&v7, v5, v6);
      swift_bridgeObjectRelease();
      v4 += 2;
      --v2;
    }
    while (v2);
    return v8;
  }
  return result;
}

uint64_t type metadata accessor for XPCAlarmEventHandler()
{
  return objc_opt_self();
}

uint64_t sub_23B6CAAAC()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_23B6CAAE8(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;

  v4 = v1[2];
  v5 = v1[3];
  v6 = v1[4];
  v7 = v1[5];
  v9 = v1[6];
  v8 = v1[7];
  v10 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v10;
  *v10 = v2;
  v10[1] = sub_23B6B8F74;
  return sub_23B6C8EAC(a1, v4, v5, v6, v7, v9, v8);
}

uint64_t method lookup function for XPCAlarmEventHandler()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of XPCAlarmEventHandler.__allocating_init(eventStreamHandler:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 288))();
}

uint64_t dispatch thunk of XPCAlarmEventHandler.asyncStream(name:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD *v8;
  uint64_t (*v10)(uint64_t, uint64_t, uint64_t);

  v10 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(**(int **)(*(_QWORD *)v3 + 296)
                                                          + *(_QWORD *)(*(_QWORD *)v3 + 296));
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v8;
  *v8 = v4;
  v8[1] = sub_23B6B8F74;
  return v10(a1, a2, a3);
}

uint64_t dispatch thunk of XPCAlarmEventHandler.processEvents(with:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))(**(int **)(*(_QWORD *)v1 + 304) + *(_QWORD *)(*(_QWORD *)v1 + 304));
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_23B6B77B8;
  return v6(a1);
}

uint64_t sub_23B6CAC70()
{
  uint64_t result;

  result = qword_254300FA8;
  if (qword_254300FA8)
  {
    qword_254300F78 = qword_254300FA8;
    return swift_retain();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t static Daemon.shared.getter()
{
  if (qword_254300F80 != -1)
    swift_once();
  swift_beginAccess();
  return swift_retain();
}

uint64_t static Daemon.shared.setter(uint64_t a1)
{
  if (qword_254300F80 != -1)
    swift_once();
  swift_beginAccess();
  qword_254300F78 = a1;
  return swift_release();
}

uint64_t (*static Daemon.shared.modify())()
{
  if (qword_254300F80 != -1)
    swift_once();
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t Daemon.identifier.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 112);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t Daemon.actorServiceCollection.getter()
{
  return swift_retain();
}

uint64_t Daemon.eventStreamHandler.getter()
{
  return swift_retain();
}

uint64_t Daemon.darwinNotificationHandler.getter()
{
  return swift_retain();
}

uint64_t Daemon.distributedNotificationHandler.getter()
{
  return swift_retain();
}

uint64_t Daemon.xpcAlarmEventHandler.getter()
{
  return swift_retain();
}

uint64_t Daemon.__allocating_init(identifier:profile:services:)(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  _QWORD *v13;
  uint64_t (*v15)(uint64_t, unint64_t, uint64_t, uint64_t, uint64_t, uint64_t);

  *(_QWORD *)(v6 + 16) = a6;
  swift_allocObject();
  v15 = (uint64_t (*)(uint64_t, unint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((char *)&dword_256A47078
                                                                                              + dword_256A47078);
  v13 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v6 + 24) = v13;
  *v13 = v6;
  v13[1] = sub_23B6CC2D0;
  return v15(a1, a2, a3, a4, a5, a6);
}

uint64_t Daemon.init(identifier:profile:services:)(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  _QWORD *v13;
  uint64_t (*v15)(uint64_t, unint64_t, uint64_t, uint64_t, uint64_t, uint64_t);

  *(_QWORD *)(v6 + 16) = a6;
  v15 = (uint64_t (*)(uint64_t, unint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((char *)&dword_256A47078
                                                                                              + dword_256A47078);
  v13 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v6 + 24) = v13;
  *v13 = v6;
  v13[1] = sub_23B6CC2D0;
  return v15(a1, a2, a3, a4, a5, a6);
}

uint64_t Daemon.__allocating_init(identifier:profile:registerAlarmEvent:services:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  _QWORD *v15;
  uint64_t (*v17)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);

  *(_QWORD *)(v7 + 16) = a7;
  swift_allocObject();
  v17 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((char *)&dword_256A47090
                                                                                              + dword_256A47090);
  v15 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v7 + 24) = v15;
  *v15 = v7;
  v15[1] = sub_23B6CB04C;
  return v17(a1, a2, a3, a4, a5, a6, a7);
}

uint64_t sub_23B6CB04C(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;

  v4 = *v2;
  swift_task_dealloc();
  if (v1)
  {
    swift_release();
    return (*(uint64_t (**)(void))(v4 + 8))();
  }
  else
  {
    swift_retain();
    swift_release();
    return (*(uint64_t (**)(uint64_t))(v4 + 8))(a1);
  }
}

uint64_t Daemon.init(identifier:profile:registerAlarmEvent:services:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  _QWORD *v15;
  uint64_t (*v17)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);

  *(_QWORD *)(v7 + 16) = a7;
  v17 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((char *)&dword_256A47090
                                                                                              + dword_256A47090);
  v15 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v7 + 24) = v15;
  *v15 = v7;
  v15[1] = sub_23B6CC2D0;
  return v17(a1, a2, a3, a4, a5, a6, a7);
}

uint64_t sub_23B6CB188()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 48) = v0;
  return swift_task_switch();
}

uint64_t sub_23B6CB1A0()
{
  _QWORD *v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t (*v4)(void);

  v1 = v0[6];
  v0[5] = MEMORY[0x24BEE4AF8];
  v4 = (uint64_t (*)(void))(**(int **)(v1 + 168) + *(_QWORD *)(v1 + 168));
  v2 = (_QWORD *)swift_task_alloc();
  v0[7] = v2;
  *v2 = v0;
  v2[1] = sub_23B6CB204;
  return v4();
}

uint64_t sub_23B6CB204(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 64) = a1;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23B6CB260()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0[6];
  sub_23B6CB310(v0[8]);
  v2 = v0[5];
  v0[9] = *(_QWORD *)(v1 + 128);
  v0[10] = v2;
  return swift_task_switch();
}

uint64_t sub_23B6CB2AC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(v0 + 72);
  v1 = *(_QWORD *)(v0 + 80);
  swift_beginAccess();
  *(_QWORD *)(v2 + 112) = v1;
  swift_bridgeObjectRelease();
  return swift_task_switch();
}

uint64_t sub_23B6CB310(uint64_t a1)
{
  uint64_t v1;
  unint64_t v2;
  _QWORD *v3;
  int64_t v4;
  int64_t v5;
  _QWORD *isUniquelyReferenced_nonNull_native;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  int64_t v15;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 16);
  v3 = *(_QWORD **)v1;
  v4 = *(_QWORD *)(*(_QWORD *)v1 + 16);
  v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
    goto LABEL_21;
  }
  isUniquelyReferenced_nonNull_native = (_QWORD *)swift_isUniquelyReferenced_nonNull_native();
  if ((_DWORD)isUniquelyReferenced_nonNull_native && v5 <= v3[3] >> 1)
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
  v3 = sub_23B6C690C(isUniquelyReferenced_nonNull_native, v15, 1, v3);
  v8 = *(_QWORD *)(a1 + 16);
  if (!v8)
    goto LABEL_18;
LABEL_5:
  v9 = v3[2];
  if ((v3[3] >> 1) - v9 < (uint64_t)v8)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  v10 = (unint64_t)&v3[2 * v9 + 4];
  if (a1 + 32 < v10 + 16 * v8 && v10 < a1 + 32 + 16 * v8)
    goto LABEL_24;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254300FB0);
  swift_arrayInitWithCopy();
  if (v8 < v2)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  v12 = v3[2];
  v13 = __OFADD__(v12, v8);
  v14 = v12 + v8;
  if (!v13)
  {
    v3[2] = v14;
LABEL_19:
    result = swift_bridgeObjectRelease();
    *(_QWORD *)v1 = v3;
    return result;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  result = sub_23B6E0A34();
  __break(1u);
  return result;
}

uint64_t Daemon.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_defaultActor_destroy();
  return v0;
}

uint64_t Daemon.__deallocating_deinit()
{
  Daemon.deinit();
  return swift_defaultActor_deallocate();
}

uint64_t Daemon.unownedExecutor.getter()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_23B6CB4F4()
{
  if (qword_254300F80 != -1)
    swift_once();
  swift_beginAccess();
  return swift_retain();
}

uint64_t sub_23B6CB560()
{
  type metadata accessor for Daemon();
  return sub_23B6E095C();
}

uint64_t sub_23B6CB584()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v2;
  *v2 = v1;
  v2[1] = sub_23B6B77B8;
  v2[6] = v0;
  return swift_task_switch();
}

uint64_t sub_23B6CB5E0()
{
  return swift_retain();
}

uint64_t sub_23B6CB5E8()
{
  return swift_retain();
}

uint64_t sub_23B6CB5F0()
{
  return swift_retain();
}

uint64_t sub_23B6CB5F8()
{
  return sub_23B6CB618();
}

uint64_t sub_23B6CB618()
{
  uint64_t v0;
  uint64_t v1;

  v0 = type metadata accessor for Daemon();
  v1 = sub_23B6CBF24(&qword_254300F98, (uint64_t)&protocol conformance descriptor for Daemon);
  sub_23B6E0A4C();
  sub_23B6E071C();
  swift_bridgeObjectRelease();
  sub_23B6E071C();
  MEMORY[0x23B86B2D0](v0, v1);
  sub_23B6E071C();
  swift_bridgeObjectRelease();
  sub_23B6E071C();
  swift_bridgeObjectRetain();
  sub_23B6E071C();
  swift_bridgeObjectRelease();
  sub_23B6E071C();
  return 60;
}

uint64_t sub_23B6CB720(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;
  uint64_t v7;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t (*v16)(uint64_t);

  *(_QWORD *)(v7 + 16) = v6;
  swift_bridgeObjectRelease();
  swift_defaultActor_initialize();
  type metadata accessor for ActorServiceCollection();
  v12 = swift_allocObject();
  swift_defaultActor_initialize();
  *(_QWORD *)(v12 + 112) = MEMORY[0x24BEE4AF8];
  *(_BYTE *)(v12 + 120) = 0;
  v13 = MEMORY[0x24BEE4B08];
  *(_QWORD *)(v12 + 128) = MEMORY[0x24BEE4B00];
  *(_QWORD *)(v12 + 136) = v13;
  v6[15] = a2;
  v6[16] = v12;
  v6[14] = a1;
  v6[21] = a5;
  v6[22] = a6;
  sub_23B6CBF24(&qword_254300FA0, (uint64_t)&protocol conformance descriptor for Daemon);
  swift_bridgeObjectRetain();
  swift_retain();
  static ActorDaemon.enterSandbox(identifier:)(a1, a2);
  swift_bridgeObjectRelease();
  type metadata accessor for XPCEventStreamHandler();
  swift_allocObject();
  v16 = (uint64_t (*)(uint64_t))((char *)&dword_256A471F0 + dword_256A471F0);
  v14 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v7 + 24) = v14;
  *v14 = v7;
  v14[1] = sub_23B6CB870;
  return v16((uint64_t)&unk_250C8E4F8);
}

uint64_t sub_23B6CB870(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  _QWORD *v6;

  v3 = *(_QWORD **)(*(_QWORD *)v1 + 16);
  swift_task_dealloc();
  v3[17] = a1;
  type metadata accessor for DarwinNotificationHandler();
  v4 = (_QWORD *)swift_allocObject();
  swift_retain();
  swift_defaultActor_initialize();
  v5 = MEMORY[0x24BEE4AF8];
  v4[15] = sub_23B6BA680(MEMORY[0x24BEE4AF8]);
  v4[16] = sub_23B6BA69C(v5);
  v4[17] = sub_23B6BA680(v5);
  v4[18] = sub_23B6BA69C(v5);
  v4[19] = sub_23B6BA850(v5);
  v4[14] = a1;
  v3[18] = v4;
  type metadata accessor for DistributedNotificationHandler();
  v6 = (_QWORD *)swift_allocObject();
  swift_retain();
  swift_defaultActor_initialize();
  v6[15] = sub_23B6BA85C(v5);
  v6[16] = sub_23B6BA878(v5);
  v6[17] = sub_23B6BA85C(v5);
  v6[18] = sub_23B6BA878(v5);
  v6[19] = sub_23B6BA894(v5);
  v6[14] = a1;
  v3[19] = v6;
  v3[20] = 0;
  return swift_task_switch();
}

uint64_t sub_23B6CB9B4()
{
  uint64_t v0;

  qword_254300FA8 = *(_QWORD *)(v0 + 16);
  swift_release();
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(_QWORD *)(v0 + 16));
}

uint64_t sub_23B6CB9F4(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, char a5, uint64_t a6, uint64_t a7)
{
  _QWORD *v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  _QWORD *v23;
  uint64_t (*v25)(uint64_t);

  v9 = v7;
  v8[2] = v9;
  swift_bridgeObjectRelease();
  swift_defaultActor_initialize();
  type metadata accessor for ActorServiceCollection();
  v15 = swift_allocObject();
  swift_defaultActor_initialize();
  *(_QWORD *)(v15 + 112) = MEMORY[0x24BEE4AF8];
  *(_BYTE *)(v15 + 120) = 0;
  v16 = MEMORY[0x24BEE4B08];
  *(_QWORD *)(v15 + 128) = MEMORY[0x24BEE4B00];
  *(_QWORD *)(v15 + 136) = v16;
  v9[15] = a2;
  v9[16] = v15;
  v9[14] = a1;
  v9[21] = a6;
  v9[22] = a7;
  sub_23B6CBF24(&qword_254300FA0, (uint64_t)&protocol conformance descriptor for Daemon);
  swift_bridgeObjectRetain();
  swift_retain();
  static ActorDaemon.enterSandbox(identifier:)(a1, a2);
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254300998);
  v17 = swift_allocObject();
  *(_OWORD *)(v17 + 16) = xmmword_23B6E1AB0;
  *(_QWORD *)(v17 + 32) = 0xD00000000000001ALL;
  *(_QWORD *)(v17 + 40) = 0x800000023B6E1FE0;
  *(_QWORD *)(v17 + 48) = 0xD00000000000001CLL;
  *(_QWORD *)(v17 + 56) = 0x800000023B6E2000;
  if ((a5 & 1) != 0)
  {
    if (qword_254300440 == -1)
    {
      v18 = 2;
      v19 = 4;
    }
    else
    {
      swift_once();
      v18 = *(_QWORD *)(v17 + 16);
      v19 = *(_QWORD *)(v17 + 24);
    }
    v21 = qword_254301358;
    v20 = unk_254301360;
    swift_bridgeObjectRetain();
    if (v18 >= v19 >> 1)
      v17 = (uint64_t)sub_23B6C66CC((_QWORD *)(v19 > 1), v18 + 1, 1, (_QWORD *)v17);
    *(_QWORD *)(v17 + 16) = v18 + 1;
    v22 = v17 + 16 * v18;
    *(_QWORD *)(v22 + 32) = v21;
    *(_QWORD *)(v22 + 40) = v20;
  }
  v8[3] = v17;
  type metadata accessor for XPCEventStreamHandler();
  swift_allocObject();
  v25 = (uint64_t (*)(uint64_t))((char *)&dword_256A471F0 + dword_256A471F0);
  swift_bridgeObjectRetain();
  v23 = (_QWORD *)swift_task_alloc();
  v8[4] = v23;
  *v23 = v8;
  v23[1] = sub_23B6CBC3C;
  return v25(v17);
}

uint64_t sub_23B6CBC3C(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v6;
  _QWORD *v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;

  v3 = *v1;
  v4 = *(_QWORD **)(*v1 + 16);
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  v4[17] = a1;
  type metadata accessor for DarwinNotificationHandler();
  v5 = (_QWORD *)swift_allocObject();
  swift_retain();
  swift_defaultActor_initialize();
  v6 = MEMORY[0x24BEE4AF8];
  v5[15] = sub_23B6BA680(MEMORY[0x24BEE4AF8]);
  v5[16] = sub_23B6BA69C(v6);
  v5[17] = sub_23B6BA680(v6);
  v5[18] = sub_23B6BA69C(v6);
  v5[19] = sub_23B6BA850(v6);
  v5[14] = a1;
  v4[18] = v5;
  type metadata accessor for DistributedNotificationHandler();
  v7 = (_QWORD *)swift_allocObject();
  swift_retain();
  swift_defaultActor_initialize();
  v7[15] = sub_23B6BA85C(v6);
  v7[16] = sub_23B6BA878(v6);
  v7[17] = sub_23B6BA85C(v6);
  v7[18] = sub_23B6BA878(v6);
  v7[19] = sub_23B6BA894(v6);
  v7[14] = a1;
  v4[19] = v7;
  if (qword_254300440 != -1)
    swift_once();
  v8 = sub_23B6CE6B4(qword_254301358, unk_254301360, *(_QWORD **)(v3 + 24));
  swift_bridgeObjectRelease();
  v9 = *(_QWORD *)(v3 + 16);
  if ((v8 & 1) != 0)
  {
    v10 = v4[17];
    type metadata accessor for XPCAlarmEventHandler();
    v11 = (_QWORD *)swift_allocObject();
    swift_retain();
    swift_defaultActor_initialize();
    v11[14] = v6;
    v11[16] = sub_23B6BA8A0(v6);
    v11[17] = sub_23B6BA8BC(v6);
    v11[18] = sub_23B6BA8A0(v6);
    v11[19] = sub_23B6BA8BC(v6);
    v11[20] = sub_23B6BA8D8(v6);
    v11[15] = v10;
    *(_QWORD *)(v9 + 160) = v11;
  }
  else
  {
    *(_QWORD *)(v9 + 160) = 0;
  }
  return swift_task_switch();
}

uint64_t sub_23B6CBE68()
{
  return sub_23B6CBF24(&qword_254300F88, (uint64_t)&protocol conformance descriptor for Daemon);
}

uint64_t sub_23B6CBE8C(uint64_t a1)
{
  uint64_t result;

  result = sub_23B6CBF24(&qword_254300FA0, (uint64_t)&protocol conformance descriptor for Daemon);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t sub_23B6CBEC0(_QWORD *a1)
{
  uint64_t result;

  a1[1] = sub_23B6CBF24(&qword_254300F98, (uint64_t)&protocol conformance descriptor for Daemon);
  a1[2] = sub_23B6CBF24(&qword_254300F88, (uint64_t)&protocol conformance descriptor for Daemon);
  result = sub_23B6CBF24(&qword_254300F90, (uint64_t)&protocol conformance descriptor for Daemon);
  a1[3] = result;
  return result;
}

uint64_t sub_23B6CBF24(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = type metadata accessor for Daemon();
    result = MEMORY[0x23B86B7BC](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t method lookup function for Daemon()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of Daemon.__allocating_init(identifier:profile:services:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v14;
  uint64_t (*v16)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);

  v16 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(**(int **)(v6 + 144)
                                                                                     + *(_QWORD *)(v6 + 144));
  v14 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v7 + 16) = v14;
  *v14 = v7;
  v14[1] = sub_23B6B514C;
  return v16(a1, a2, a3, a4, a5, a6);
}

uint64_t dispatch thunk of Daemon.__allocating_init(identifier:profile:registerAlarmEvent:services:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  uint64_t v8;
  _QWORD *v16;
  uint64_t (*v18)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);

  v18 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(**(int **)(v7 + 152)
                                                                                              + *(_QWORD *)(v7 + 152));
  v16 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v8 + 16) = v16;
  *v16 = v8;
  v16[1] = sub_23B6B528C;
  return v18(a1, a2, a3, a4, a5, a6, a7);
}

uint64_t dispatch thunk of Daemon.populateServices()()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t (*v4)(void);

  v4 = (uint64_t (*)(void))(**(int **)(*(_QWORD *)v0 + 160) + *(_QWORD *)(*(_QWORD *)v0 + 160));
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v2;
  *v2 = v1;
  v2[1] = sub_23B6B8F74;
  return v4();
}

uint64_t sub_23B6CC10C()
{
  return swift_bridgeObjectRetain();
}

uint64_t destroy for Daemon.Error()
{
  return sub_23B6CC124();
}

uint64_t sub_23B6CC124()
{
  return swift_bridgeObjectRelease();
}

uint64_t _s19FindMyDaemonSupport6DaemonC5ErrorOwCP_0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  char v5;

  v3 = *a2;
  v4 = a2[1];
  v5 = *((_BYTE *)a2 + 16);
  sub_23B6CC10C();
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for Daemon.Error(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  char v5;

  v3 = *a2;
  v4 = a2[1];
  v5 = *((_BYTE *)a2 + 16);
  sub_23B6CC10C();
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  sub_23B6CC124();
  return a1;
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for Daemon.Error(uint64_t a1, uint64_t a2)
{
  char v3;

  v3 = *(_BYTE *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_BYTE *)(a1 + 16) = v3;
  sub_23B6CC124();
  return a1;
}

uint64_t getEnumTagSinglePayload for Daemon.Error(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFF && *(_BYTE *)(a1 + 17))
    return (*(_DWORD *)a1 + 255);
  v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 1)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for Daemon.Error(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_BYTE *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 255;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 17) = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 17) = 0;
    if (a2)
      *(_BYTE *)(result + 16) = -(char)a2;
  }
  return result;
}

uint64_t sub_23B6CC2AC(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 16);
}

uint64_t sub_23B6CC2B4(uint64_t result, char a2)
{
  *(_BYTE *)(result + 16) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for Daemon.Error()
{
  return &type metadata for Daemon.Error;
}

uint64_t ActorDaemon.bundleIdentifier.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t ActorDaemon.description.getter(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = *(_QWORD *)(a2 + 8);
  sub_23B6E0A4C();
  sub_23B6E071C();
  swift_bridgeObjectRelease();
  sub_23B6E071C();
  MEMORY[0x23B86B2D0](a1, v4);
  sub_23B6E071C();
  swift_bridgeObjectRelease();
  sub_23B6E071C();
  (*(void (**)(uint64_t, uint64_t))(a2 + 32))(a1, a2);
  sub_23B6E071C();
  swift_bridgeObjectRelease();
  sub_23B6E071C();
  return 60;
}

uint64_t dispatch thunk of ActorDaemon.identifier.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of ActorDaemon.bundleIdentifier.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of ActorDaemon.eventStreamHandler.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t dispatch thunk of ActorDaemon.darwinNotificationHandler.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 56))();
}

uint64_t dispatch thunk of ActorDaemon.distributedNotificationHandler.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 64))();
}

uint64_t dispatch thunk of ActorDaemon.startup()(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  uint64_t (*v7)(uint64_t, uint64_t);

  v7 = (uint64_t (*)(uint64_t, uint64_t))(**(int **)(a2 + 72) + *(_QWORD *)(a2 + 72));
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_23B6B77B8;
  return v7(a1, a2);
}

uint64_t dispatch thunk of ActorDaemon.initialLaunchProcessing()(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  uint64_t (*v7)(uint64_t, uint64_t);

  v7 = (uint64_t (*)(uint64_t, uint64_t))(**(int **)(a2 + 80) + *(_QWORD *)(a2 + 80));
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_23B6B77B8;
  return v7(a1, a2);
}

uint64_t dispatch thunk of ActorDaemon.migrate(from:to:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v9;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);

  v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(**(int **)(a4 + 88) + *(_QWORD *)(a4 + 88));
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v9;
  *v9 = v4;
  v9[1] = sub_23B6B77B8;
  return v11(a1, a2, a3, a4);
}

uint64_t dispatch thunk of ActorDaemon.firstLaunchSinceReboot()(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  uint64_t (*v7)(uint64_t, uint64_t);

  v7 = (uint64_t (*)(uint64_t, uint64_t))(**(int **)(a2 + 96) + *(_QWORD *)(a2 + 96));
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_23B6B8F74;
  return v7(a1, a2);
}

uint64_t dispatch thunk of ActorDaemon.run()(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  uint64_t (*v7)(uint64_t, uint64_t);

  v7 = (uint64_t (*)(uint64_t, uint64_t))(**(int **)(a2 + 104) + *(_QWORD *)(a2 + 104));
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_23B6B8F74;
  return v7(a1, a2);
}

uint64_t sub_23B6CC634()
{
  uint64_t v0;

  v0 = sub_23B6E0668();
  __swift_allocate_value_buffer(v0, qword_2543013C0);
  __swift_project_value_buffer(v0, (uint64_t)qword_2543013C0);
  return sub_23B6E065C();
}

uint64_t sub_23B6CC6A4()
{
  uint64_t v0;

  v0 = sub_23B6E0668();
  __swift_allocate_value_buffer(v0, qword_256A47AE0);
  __swift_project_value_buffer(v0, (uint64_t)qword_256A47AE0);
  return sub_23B6E065C();
}

uint64_t sub_23B6CC70C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = sub_23B6E0668();
  __swift_allocate_value_buffer(v0, qword_254300700);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_254300700);
  if (qword_2543006D0 != -1)
    swift_once();
  v2 = __swift_project_value_buffer(v0, (uint64_t)qword_2543013A8);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 - 8) + 16))(v1, v2, v0);
}

uint64_t sub_23B6CC79C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  v3 = *(_QWORD *)(v2 + 112);
  *(_QWORD *)(v2 + 112) = a1;
  *(_QWORD *)(v2 + 120) = a2;
  return sub_23B6B6A08(v3);
}

uint64_t sub_23B6CC7B0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  v3 = *(_QWORD *)(v2 + 128);
  *(_QWORD *)(v2 + 128) = a1;
  *(_QWORD *)(v2 + 136) = a2;
  return sub_23B6B6A08(v3);
}

uint64_t sub_23B6CC7C4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  v3 = *(_QWORD *)(v2 + 144);
  *(_QWORD *)(v2 + 144) = a1;
  *(_QWORD *)(v2 + 152) = a2;
  return sub_23B6B6A08(v3);
}

uint64_t sub_23B6CC7D8(uint64_t a1)
{
  uint64_t v1;

  swift_beginAccess();
  *(_QWORD *)(v1 + 160) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t sub_23B6CC81C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;

  sub_23B6CDEB0(a1);
  v5 = *(_QWORD *)(v2 + 112);
  *(_QWORD *)(v2 + 112) = a1;
  *(_QWORD *)(v2 + 120) = a2;
  return sub_23B6B6A08(v5);
}

uint64_t sub_23B6CC850(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;

  sub_23B6CDEB0(a1);
  v5 = *(_QWORD *)(v2 + 128);
  *(_QWORD *)(v2 + 128) = a1;
  *(_QWORD *)(v2 + 136) = a2;
  return sub_23B6B6A08(v5);
}

uint64_t sub_23B6CC884(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;

  sub_23B6CDEB0(a1);
  v5 = *(_QWORD *)(v2 + 144);
  *(_QWORD *)(v2 + 144) = a1;
  *(_QWORD *)(v2 + 152) = a2;
  return sub_23B6B6A08(v5);
}

uint64_t XPCClientConnectionPool.__allocating_init()()
{
  uint64_t v0;

  v0 = swift_allocObject();
  swift_defaultActor_initialize();
  *(_OWORD *)(v0 + 128) = 0u;
  *(_OWORD *)(v0 + 144) = 0u;
  *(_OWORD *)(v0 + 112) = 0u;
  *(_QWORD *)(v0 + 160) = sub_23B6E0698();
  return v0;
}

uint64_t XPCClientConnectionPool.init()()
{
  uint64_t v0;

  swift_defaultActor_initialize();
  *(_OWORD *)(v0 + 128) = 0u;
  *(_OWORD *)(v0 + 144) = 0u;
  *(_OWORD *)(v0 + 112) = 0u;
  *(_QWORD *)(v0 + 160) = sub_23B6E0698();
  return v0;
}

uint64_t sub_23B6CC950(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _QWORD *v3;

  v3[12] = a2;
  v3[13] = v2;
  v3[11] = a1;
  v3[14] = *v2;
  return swift_task_switch();
}

uint64_t sub_23B6CC974()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int64_t v17;
  int64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t);

  v1 = *(_QWORD *)(v0 + 104);
  swift_beginAccess();
  v2 = *(_QWORD *)(v1 + 160);
  if ((v2 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    sub_23B6E0944();
    sub_23B6E0878();
    result = *(_QWORD *)(v0 + 16);
    v4 = *(_QWORD *)(v0 + 24);
    v6 = *(_QWORD *)(v0 + 32);
    v5 = *(_QWORD *)(v0 + 40);
    v7 = *(_QWORD *)(v0 + 48);
    *(_QWORD *)(v0 + 128) = v4;
    *(_QWORD *)(v0 + 136) = v6;
    *(_QWORD *)(v0 + 120) = result;
    if (result < 0)
    {
      if (sub_23B6E0950())
      {
        sub_23B6E0A7C();
        swift_unknownObjectRelease();
        v11 = *(_QWORD *)(v0 + 80);
        v10 = v5;
        v8 = v7;
LABEL_6:
        *(_QWORD *)(v0 + 152) = v10;
        *(_QWORD *)(v0 + 160) = v8;
        *(_QWORD *)(v0 + 144) = v11;
        if (v11)
        {
          v21 = (uint64_t (*)(uint64_t))(**(int **)(v0 + 88) + *(_QWORD *)(v0 + 88));
          v12 = (_QWORD *)swift_task_alloc();
          *(_QWORD *)(v0 + 168) = v12;
          *v12 = v0;
          v12[1] = sub_23B6CCBBC;
          return v21(v11);
        }
        goto LABEL_26;
      }
      goto LABEL_26;
    }
    if (v7)
    {
LABEL_4:
      v8 = (v7 - 1) & v7;
      v9 = __clz(__rbit64(v7)) | (v5 << 6);
      v10 = v5;
LABEL_5:
      v11 = *(_QWORD *)(*(_QWORD *)(result + 48) + 8 * v9);
      swift_unknownObjectRetain();
      goto LABEL_6;
    }
  }
  else
  {
    v13 = -1 << *(_BYTE *)(v2 + 32);
    v6 = ~v13;
    v4 = v2 + 56;
    v14 = *(_QWORD *)(v2 + 56);
    v15 = -v13;
    *(_QWORD *)(v0 + 128) = v2 + 56;
    *(_QWORD *)(v0 + 136) = v6;
    if (v15 < 64)
      v16 = ~(-1 << v15);
    else
      v16 = -1;
    v7 = v16 & v14;
    *(_QWORD *)(v0 + 120) = v2;
    result = swift_bridgeObjectRetain();
    v5 = 0;
    if (v7)
      goto LABEL_4;
  }
  v17 = v5 + 1;
  if (!__OFADD__(v5, 1))
  {
    v18 = (unint64_t)(v6 + 64) >> 6;
    if (v17 < v18)
    {
      v19 = *(_QWORD *)(v4 + 8 * v17);
      v10 = v5 + 1;
      if (v19)
      {
LABEL_15:
        v8 = (v19 - 1) & v19;
        v9 = __clz(__rbit64(v19)) + (v10 << 6);
        goto LABEL_5;
      }
      v10 = v5 + 2;
      if (v5 + 2 < v18)
      {
        v19 = *(_QWORD *)(v4 + 8 * v10);
        if (v19)
          goto LABEL_15;
        v10 = v5 + 3;
        if (v5 + 3 < v18)
        {
          v19 = *(_QWORD *)(v4 + 8 * v10);
          if (v19)
            goto LABEL_15;
          v20 = v5 + 4;
          while (v18 != v20)
          {
            v19 = *(_QWORD *)(v4 + 8 * v20++);
            if (v19)
            {
              v10 = v20 - 1;
              goto LABEL_15;
            }
          }
        }
      }
    }
LABEL_26:
    sub_23B6C5B90();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  __break(1u);
  return result;
}

uint64_t sub_23B6CCBBC()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23B6CCC14()
{
  uint64_t v0;
  uint64_t result;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  int64_t v10;
  int64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t);

  result = swift_unknownObjectRelease();
  v2 = *(_QWORD *)(v0 + 152);
  v3 = *(_QWORD *)(v0 + 160);
  v4 = *(_QWORD *)(v0 + 120);
  if (v4 < 0)
  {
    if (sub_23B6E0950())
    {
      sub_23B6E0A7C();
      swift_unknownObjectRelease();
      v8 = *(_QWORD *)(v0 + 80);
      v7 = v2;
      v5 = v3;
LABEL_7:
      *(_QWORD *)(v0 + 152) = v7;
      *(_QWORD *)(v0 + 160) = v5;
      *(_QWORD *)(v0 + 144) = v8;
      if (v8)
      {
        v15 = (uint64_t (*)(uint64_t))(**(int **)(v0 + 88) + *(_QWORD *)(v0 + 88));
        v9 = (_QWORD *)swift_task_alloc();
        *(_QWORD *)(v0 + 168) = v9;
        *v9 = v0;
        v9[1] = sub_23B6CCBBC;
        return v15(v8);
      }
      goto LABEL_21;
    }
    goto LABEL_21;
  }
  if (v3)
  {
    v5 = (v3 - 1) & v3;
    v6 = __clz(__rbit64(v3)) | (v2 << 6);
    v7 = *(_QWORD *)(v0 + 152);
LABEL_4:
    v8 = *(_QWORD *)(*(_QWORD *)(v4 + 48) + 8 * v6);
    swift_unknownObjectRetain();
    goto LABEL_7;
  }
  v10 = v2 + 1;
  if (!__OFADD__(v2, 1))
  {
    v11 = (unint64_t)(*(_QWORD *)(v0 + 136) + 64) >> 6;
    if (v10 < v11)
    {
      v12 = *(_QWORD *)(v0 + 128);
      v13 = *(_QWORD *)(v12 + 8 * v10);
      v7 = v2 + 1;
      if (v13)
      {
LABEL_12:
        v5 = (v13 - 1) & v13;
        v6 = __clz(__rbit64(v13)) + (v7 << 6);
        goto LABEL_4;
      }
      v7 = v2 + 2;
      if (v2 + 2 < v11)
      {
        v13 = *(_QWORD *)(v12 + 8 * v7);
        if (v13)
          goto LABEL_12;
        v7 = v2 + 3;
        if (v2 + 3 < v11)
        {
          v13 = *(_QWORD *)(v12 + 8 * v7);
          if (v13)
            goto LABEL_12;
          v14 = v2 + 4;
          while (v11 != v14)
          {
            v13 = *(_QWORD *)(v12 + 8 * v14++);
            if (v13)
            {
              v7 = v14 - 1;
              goto LABEL_12;
            }
          }
        }
      }
    }
LABEL_21:
    sub_23B6C5B90();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  __break(1u);
  return result;
}

uint64_t sub_23B6CCDCC()
{
  uint64_t v0;

  swift_beginAccess();
  swift_bridgeObjectRetain();
  v0 = sub_23B6E0848();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_23B6CCE3C()
{
  uint64_t v0;

  swift_release();
  swift_release();
  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23B6CCE84(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;

  v4[2] = a2;
  v4[3] = a3;
  v5 = *a1;
  v4[4] = a4;
  v4[5] = v5;
  return swift_task_switch();
}

uint64_t sub_23B6CCEA4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  char *v6;
  uint64_t result;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;

  __swift_instantiateConcreteTypeFromMangledName(&qword_254301350);
  MEMORY[0x24BDAC7A8]();
  v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    v8 = result;
    v9 = sub_23B6E07DC();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v6, 1, 1, v9);
    v10 = (_QWORD *)swift_allocObject();
    v10[2] = 0;
    v10[3] = 0;
    v10[4] = a2;
    v10[5] = v8;
    v10[6] = a3;
    swift_retain();
    swift_retain();
    sub_23B6CE420((uint64_t)v6, (uint64_t)&unk_256A471E0, (uint64_t)v10);
    return swift_release();
  }
  return result;
}

uint64_t sub_23B6CCFB0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;

  v6[3] = a5;
  v6[4] = a6;
  v6[2] = a4;
  return swift_task_switch();
}

uint64_t sub_23B6CCFCC()
{
  uint64_t v0;
  void *v1;
  id v2;
  _QWORD *v3;

  v1 = *(void **)(*(_QWORD *)(v0 + 16) + 16);
  *(_QWORD *)(v0 + 40) = v1;
  if (!v1)
    return (*(uint64_t (**)(void))(v0 + 8))();
  v2 = v1;
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 48) = v3;
  *v3 = v0;
  v3[1] = sub_23B6CD048;
  return sub_23B6CD198((uint64_t)v2);
}

uint64_t sub_23B6CD048()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23B6CD09C()
{
  uint64_t v0;
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(*(_QWORD *)(v0 + 32) + 16);
  if (v1)
  {
    v2 = swift_retain();
    v1(v2);
    sub_23B6B6A08((uint64_t)v1);
  }

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23B6CD0F4(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

uint64_t sub_23B6CD120(uint64_t a1)
{
  _QWORD *v1;
  _QWORD *v2;

  v2[18] = a1;
  v2[19] = v1;
  v2[20] = *v1;
  return swift_task_switch();
}

uint64_t sub_23B6CD140()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v3;

  v1 = *(_QWORD *)(*v0 + 168);
  v3 = *v0;
  swift_task_dealloc();
  sub_23B6B6A08(v1);
  return (*(uint64_t (**)(void))(v3 + 8))();
}

uint64_t sub_23B6CD198(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  _QWORD *v4;

  *(_QWORD *)(v2 + 16) = v1;
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 24) = v4;
  *v4 = v2;
  v4[1] = sub_23B6CD204;
  v4[4] = a1;
  v4[5] = v1;
  v4[6] = *v1;
  return swift_task_switch();
}

uint64_t sub_23B6CD204(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;
  _QWORD *v4;
  _QWORD *v5;

  v3 = *v1;
  *(_QWORD *)(v3 + 32) = a1;
  swift_task_dealloc();
  if (!a1)
    return (*(uint64_t (**)(void))(v3 + 8))();
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 40) = v4;
  *v4 = v3;
  v4[1] = sub_23B6CD2A4;
  v5 = *(_QWORD **)(v3 + 16);
  v4[18] = a1;
  v4[19] = v5;
  v4[20] = *v5;
  return swift_task_switch();
}

uint64_t sub_23B6CD2A4()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23B6CD2FC()
{
  uint64_t v0;

  swift_unknownObjectRelease();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23B6CD32C(uint64_t a1)
{
  _QWORD *v1;
  _QWORD *v2;

  v2[4] = a1;
  v2[5] = v1;
  v2[6] = *v1;
  return swift_task_switch();
}

uint64_t sub_23B6CD34C()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 40);
  swift_beginAccess();
  *(_QWORD *)(v0 + 56) = *(_QWORD *)(v1 + 160);
  swift_bridgeObjectRetain();
  return swift_task_switch();
}

uint64_t sub_23B6CD3A4()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;

  v1 = v0[6];
  v2 = v0[4];
  v0[3] = v0[7];
  v3 = (_QWORD *)swift_task_alloc();
  v0[8] = v3;
  v3[2] = *(_QWORD *)(v1 + 80);
  v3[3] = *(_QWORD *)(v1 + 88);
  v3[4] = v2;
  v4 = (_QWORD *)swift_task_alloc();
  v0[9] = v4;
  v5 = sub_23B6E0884();
  MEMORY[0x23B86B7BC](MEMORY[0x24BEE1718], v5);
  *v4 = v0;
  v4[1] = sub_23B6CD478;
  return sub_23B6E074C();
}

uint64_t sub_23B6CD478()
{
  swift_task_dealloc();
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  return swift_task_switch();
}

uint64_t sub_23B6CD4D8()
{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(_QWORD *)(v0 + 16));
}

uint64_t sub_23B6CD4E0(uint64_t a1)
{
  _QWORD *v1;
  _QWORD *v2;

  v2[18] = a1;
  v2[19] = v1;
  v2[20] = *v1;
  return swift_task_switch();
}

uint64_t sub_23B6CD500()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int *v4;
  _QWORD *v5;
  char v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  uint64_t v17;
  int *v18;
  _QWORD *v19;
  uint64_t (*v20)(_QWORD);
  uint64_t (*v21)(void);

  v2 = *(_QWORD *)(v0 + 152);
  v1 = *(_QWORD *)(v0 + 160);
  v3 = *(_QWORD *)(v0 + 144);
  swift_beginAccess();
  *(_QWORD *)(v0 + 168) = *(_QWORD *)(v1 + 80);
  *(_QWORD *)(v0 + 176) = *(_QWORD *)(*(_QWORD *)(v1 + 88) + 8);
  swift_bridgeObjectRetain();
  *(_QWORD *)(v0 + 184) = sub_23B6E0848();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v0 + 112) = v3;
  swift_beginAccess();
  sub_23B6E0884();
  sub_23B6E0860();
  swift_endAccess();
  swift_unknownObjectRelease();
  v4 = *(int **)(v2 + 144);
  *(_QWORD *)(v0 + 192) = v4;
  if (v4)
  {
    *(_QWORD *)(v0 + 200) = *(_QWORD *)(*(_QWORD *)(v0 + 152) + 152);
    sub_23B6CDEB0((uint64_t)v4);
    v20 = (uint64_t (*)(_QWORD))((char *)v4 + *v4);
    v5 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 208) = v5;
    *v5 = v0;
    v5[1] = sub_23B6CD920;
    return v20(*(_QWORD *)(v0 + 144));
  }
  swift_beginAccess();
  swift_bridgeObjectRetain();
  v7 = sub_23B6E086C();
  swift_bridgeObjectRelease();
  if (qword_254300178 != -1)
    swift_once();
  v8 = sub_23B6E0668();
  __swift_project_value_buffer(v8, (uint64_t)qword_254300700);
  swift_retain();
  v9 = sub_23B6E0650();
  v10 = sub_23B6E0890();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = *(_QWORD *)(v0 + 184);
    v12 = swift_slowAlloc();
    *(_DWORD *)v12 = 134218240;
    *(_QWORD *)(v0 + 128) = v11;
    sub_23B6E0920();
    *(_WORD *)(v12 + 12) = 2048;
    swift_beginAccess();
    swift_bridgeObjectRetain();
    v13 = sub_23B6E0848();
    swift_bridgeObjectRelease();
    *(_QWORD *)(v0 + 136) = v13;
    sub_23B6E0920();
    swift_release();
    _os_log_impl(&dword_23B6B3000, v9, v10, "Session count: %ld -> %ld", (uint8_t *)v12, 0x16u);
    MEMORY[0x23B86B840](v12, -1, -1);

    if ((v7 & 1) == 0)
      return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    swift_release();

    if ((v7 & 1) == 0)
      return (*(uint64_t (**)(void))(v0 + 8))();
  }
  v14 = sub_23B6E0650();
  v15 = sub_23B6E0890();
  if (os_log_type_enabled(v14, v15))
  {
    v16 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v16 = 0;
    _os_log_impl(&dword_23B6B3000, v14, v15, "Final session removed", v16, 2u);
    MEMORY[0x23B86B840](v16, -1, -1);
  }
  v17 = *(_QWORD *)(v0 + 152);

  v18 = *(int **)(v17 + 128);
  *(_QWORD *)(v0 + 216) = v18;
  if (v18)
  {
    *(_QWORD *)(v0 + 224) = *(_QWORD *)(*(_QWORD *)(v0 + 152) + 136);
    sub_23B6CDEB0((uint64_t)v18);
    v21 = (uint64_t (*)(void))((char *)v18 + *v18);
    v19 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 232) = v19;
    *v19 = v0;
    v19[1] = sub_23B6CDC78;
    return v21();
  }
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23B6CD920()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)v0 + 192);
  swift_task_dealloc();
  sub_23B6B6A08(v1);
  return swift_task_switch();
}

uint64_t sub_23B6CD990()
{
  uint64_t v0;
  char v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  uint64_t v11;
  int *v12;
  _QWORD *v13;
  uint64_t (*v15)(void);

  swift_beginAccess();
  swift_bridgeObjectRetain();
  v1 = sub_23B6E086C();
  swift_bridgeObjectRelease();
  if (qword_254300178 != -1)
    swift_once();
  v2 = sub_23B6E0668();
  __swift_project_value_buffer(v2, (uint64_t)qword_254300700);
  swift_retain();
  v3 = sub_23B6E0650();
  v4 = sub_23B6E0890();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = *(_QWORD *)(v0 + 184);
    v6 = swift_slowAlloc();
    *(_DWORD *)v6 = 134218240;
    *(_QWORD *)(v0 + 128) = v5;
    sub_23B6E0920();
    *(_WORD *)(v6 + 12) = 2048;
    swift_beginAccess();
    swift_bridgeObjectRetain();
    v7 = sub_23B6E0848();
    swift_bridgeObjectRelease();
    *(_QWORD *)(v0 + 136) = v7;
    sub_23B6E0920();
    swift_release();
    _os_log_impl(&dword_23B6B3000, v3, v4, "Session count: %ld -> %ld", (uint8_t *)v6, 0x16u);
    MEMORY[0x23B86B840](v6, -1, -1);

    if ((v1 & 1) == 0)
      return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    swift_release();

    if ((v1 & 1) == 0)
      return (*(uint64_t (**)(void))(v0 + 8))();
  }
  v8 = sub_23B6E0650();
  v9 = sub_23B6E0890();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_23B6B3000, v8, v9, "Final session removed", v10, 2u);
    MEMORY[0x23B86B840](v10, -1, -1);
  }
  v11 = *(_QWORD *)(v0 + 152);

  v12 = *(int **)(v11 + 128);
  *(_QWORD *)(v0 + 216) = v12;
  if (v12)
  {
    *(_QWORD *)(v0 + 224) = *(_QWORD *)(*(_QWORD *)(v0 + 152) + 136);
    sub_23B6CDEB0((uint64_t)v12);
    v15 = (uint64_t (*)(void))((char *)v12 + *v12);
    v13 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 232) = v13;
    *v13 = v0;
    v13[1] = sub_23B6CDC78;
    return v15();
  }
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23B6CDC78()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v3;

  v1 = *(_QWORD *)(*v0 + 216);
  v3 = *v0;
  swift_task_dealloc();
  sub_23B6B6A08(v1);
  return (*(uint64_t (**)(void))(v3 + 8))();
}

uint64_t *XPCClientConnectionPool.deinit()
{
  uint64_t *v0;

  sub_23B6B6A08(v0[14]);
  sub_23B6B6A08(v0[16]);
  sub_23B6B6A08(v0[18]);
  swift_bridgeObjectRelease();
  swift_defaultActor_destroy();
  return v0;
}

uint64_t XPCClientConnectionPool.__deallocating_deinit()
{
  XPCClientConnectionPool.deinit();
  return swift_defaultActor_deallocate();
}

uint64_t sub_23B6CDD24(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;

  v4[2] = a2;
  v4[3] = a3;
  v5 = *a1;
  v4[4] = a4;
  v4[5] = v5;
  return swift_task_switch();
}

uint64_t sub_23B6CDD44()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t (*v3)(void);

  v0[6] = sub_23B6B54B4();
  v0[7] = sub_23B6E0560();
  v3 = (uint64_t (*)(void))((int)*MEMORY[0x24BE31980] + MEMORY[0x24BE31980]);
  v1 = (_QWORD *)swift_task_alloc();
  v0[8] = v1;
  *v1 = v0;
  v1[1] = sub_23B6CDDCC;
  return v3();
}

uint64_t sub_23B6CDDCC(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 72) = a1;
  swift_task_dealloc();
  swift_release();
  return swift_task_switch();
}

uint64_t sub_23B6CDE30()
{
  uint64_t v0;

  v0 = sub_23B6E0668();
  __swift_allocate_value_buffer(v0, qword_2543013A8);
  __swift_project_value_buffer(v0, (uint64_t)qword_2543013A8);
  return sub_23B6E065C();
}

uint64_t sub_23B6CDEB0(uint64_t result)
{
  if (result)
    return swift_retain();
  return result;
}

uint64_t type metadata accessor for XPCClientConnectionPool.Error(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for XPCClientConnectionPool.Error);
}

uint64_t sub_23B6CDECC()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_23B6CDEF0()
{
  swift_release();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23B6CDF24()
{
  uint64_t *v0;

  return sub_23B6CCEA4(v0[4], v0[5], v0[6]);
}

uint64_t block_destroy_helper_1()
{
  return swift_release();
}

uint64_t sub_23B6CDF3C()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

uint64_t sub_23B6CDF60()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 16) + 16))();
}

uint64_t sub_23B6CDF6C()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23B6CDF90()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_23B6CDFB0@<X0>(uint64_t *a1@<X8>)
{
  *a1 = sub_23B6B5184();
  return swift_bridgeObjectRetain();
}

uint64_t sub_23B6CDFD8()
{
  uint64_t v0;

  v0 = swift_bridgeObjectRetain();
  return sub_23B6CC7D8(v0);
}

uint64_t sub_23B6CE000()
{
  return 16;
}

__n128 sub_23B6CE00C(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a1;
  *a2 = *a1;
  return result;
}

uint64_t sub_23B6CE01C()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for XPCClientConnectionPool(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for XPCClientConnectionPool);
}

uint64_t method lookup function for XPCClientConnectionPool()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of XPCClientConnectionPool.sessions.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 216))();
}

uint64_t dispatch thunk of XPCClientConnectionPool.sessions.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 224))();
}

uint64_t dispatch thunk of XPCClientConnectionPool.setStartProcessing(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 232))();
}

uint64_t dispatch thunk of XPCClientConnectionPool.setStopProcessing(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 240))();
}

uint64_t dispatch thunk of XPCClientConnectionPool.setRemoveHandler(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 248))();
}

uint64_t dispatch thunk of XPCClientConnectionPool.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 256))();
}

uint64_t dispatch thunk of XPCClientConnectionPool.forEach(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v6;
  uint64_t (*v8)(uint64_t, uint64_t);

  v8 = (uint64_t (*)(uint64_t, uint64_t))(**(int **)(*(_QWORD *)v2 + 264) + *(_QWORD *)(*(_QWORD *)v2 + 264));
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v6;
  *v6 = v3;
  v6[1] = sub_23B6B77B8;
  return v8(a1, a2);
}

uint64_t dispatch thunk of XPCClientConnectionPool.count.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 280))();
}

uint64_t dispatch thunk of XPCClientConnectionPool.remove(connection:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))(**(int **)(*(_QWORD *)v1 + 296) + *(_QWORD *)(*(_QWORD *)v1 + 296));
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_23B6B77B8;
  return v6(a1);
}

uint64_t sub_23B6CE1B4()
{
  uint64_t result;
  unint64_t v1;

  result = sub_23B6E0914();
  if (v1 <= 0x3F)
  {
    result = swift_initClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t type metadata accessor for UnsafeSendableBox(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for UnsafeSendableBox);
}

uint64_t sub_23B6CE230()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_23B6CE238(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_23B6CE278 + 4 * byte_23B6E1C80[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_23B6CE298 + 4 * byte_23B6E1C85[v4]))();
}

_BYTE *sub_23B6CE278(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_23B6CE298(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23B6CE2A0(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23B6CE2A8(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23B6CE2B0(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23B6CE2B8(_DWORD *result)
{
  *result = 0;
  return result;
}

void sub_23B6CE2C4()
{
  JUMPOUT(0x23B86B7BCLL);
}

uint64_t sub_23B6CE2D4(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;

  v4 = *(_QWORD *)(v1 + 32);
  v5 = swift_task_alloc();
  v6 = *(_OWORD *)(v1 + 16);
  *(_QWORD *)(v2 + 16) = v5;
  *(_QWORD *)v5 = v2;
  *(_QWORD *)(v5 + 8) = sub_23B6B528C;
  *(_OWORD *)(v5 + 24) = v6;
  *(_QWORD *)(v5 + 16) = v4;
  *(_QWORD *)(v5 + 40) = *a1;
  return swift_task_switch();
}

uint64_t sub_23B6CE350()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23B6CE38C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  __int128 v4;

  v2 = *(_QWORD *)(v0 + 48);
  v3 = swift_task_alloc();
  v4 = *(_OWORD *)(v0 + 32);
  *(_QWORD *)(v1 + 16) = v3;
  *(_QWORD *)v3 = v1;
  *(_QWORD *)(v3 + 8) = sub_23B6B8F74;
  *(_QWORD *)(v3 + 32) = v2;
  *(_OWORD *)(v3 + 16) = v4;
  return swift_task_switch();
}

uint64_t __swift_instantiateGenericMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x23B86B78C](a1, v6, a5);
}

uint64_t sub_23B6CE420(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_23B6E07DC();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_23B6E07D0();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_23B6B772C(a1, &qword_254301350);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_23B6E07AC();
    swift_unknownObjectRelease();
  }
LABEL_5:
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_23B6CE56C(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  return a3() & 1;
}

uint64_t sub_23B6CE590(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t (*v5)(uint64_t, uint64_t);
  char v6;

  v5 = *(uint64_t (**)(uint64_t, uint64_t))(a1 + 32);
  swift_unknownObjectRetain();
  v6 = v5(a2, a3);
  swift_unknownObjectRelease();
  return v6 & 1;
}

uint64_t XPCEventStreamHandler.__allocating_init(streams:)(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t (*v5)(uint64_t);

  *(_QWORD *)(v1 + 16) = a1;
  swift_allocObject();
  v5 = (uint64_t (*)(uint64_t))((char *)&dword_256A471F0 + dword_256A471F0);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 24) = v3;
  *v3 = v1;
  v3[1] = sub_23B6CE65C;
  return v5(a1);
}

uint64_t sub_23B6CE65C(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v4;

  v4 = *v1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(uint64_t))(v4 + 8))(a1);
}

uint64_t sub_23B6CE6B4(uint64_t a1, uint64_t a2, _QWORD *a3)
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
  result = sub_23B6E0A88();
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
    if (v12 || (sub_23B6E0A88() & 1) != 0)
      return 1;
    result = 0;
    v9 += 2;
    if (v11 == v3)
      return result;
  }
  __break(1u);
  return result;
}

uint64_t sub_23B6CE778()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = sub_23B6E0668();
  __swift_allocate_value_buffer(v0, qword_2543013F0);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_2543013F0);
  if (qword_254301318 != -1)
    swift_once();
  v2 = __swift_project_value_buffer(v0, (uint64_t)qword_2543009C0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 - 8) + 16))(v1, v2, v0);
}

void sub_23B6CE808()
{
  strcpy((char *)&qword_254301368, "XPCEventName");
  BYTE5(qword_254301370) = 0;
  HIWORD(qword_254301370) = -5120;
}

uint64_t XPCEventStreamHandler.init(streams:)(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t (*v5)(uint64_t);

  *(_QWORD *)(v1 + 16) = a1;
  v5 = (uint64_t (*)(uint64_t))((char *)&dword_256A471F0 + dword_256A471F0);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 24) = v3;
  *v3 = v1;
  v3[1] = sub_23B6D0B80;
  return v5(a1);
}

uint64_t sub_23B6CE89C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;

  v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254300F10);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254300F00);
  v11 = *(_QWORD *)(v10 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v9, a1, v10);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v9, 0, 1, v10);
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_23B6BBB9C((uint64_t)v9, a3, a4);
  return swift_endAccess();
}

uint64_t sub_23B6CE998(uint64_t result)
{
  _QWORD *v1;
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  unint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v20;
  unint64_t v21;
  _QWORD *v22;
  _QWORD *v23;
  void *v24;
  uint64_t v25;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v31;
  uint64_t v32;
  uint64_t aBlock[6];

  v2 = *(_QWORD *)(result + 16);
  if (!v2)
    return result;
  v3 = v1;
  v4 = v1 + 17;
  v31 = *v1;
  v32 = result + 32;
  swift_bridgeObjectRetain();
  swift_beginAccess();
  v5 = 0;
  while (1)
  {
    v6 = (uint64_t *)(v32 + 16 * v5);
    v7 = *v6;
    v8 = v6[1];
    v9 = (_QWORD *)*v4;
    v10 = *(_QWORD *)(*v4 + 16);
    if (!v10)
      goto LABEL_16;
    v11 = v9[4] == v7 && v9[5] == v8;
    if (!v11 && (sub_23B6E0A88() & 1) == 0)
    {
      if (v10 == 1)
        goto LABEL_16;
      if (v9[6] != v7 || v9[7] != v8)
      {
        result = sub_23B6E0A88();
        if ((result & 1) == 0)
          break;
      }
    }
LABEL_11:
    v12 = qword_2543009B8;
    swift_bridgeObjectRetain();
    if (v12 != -1)
      swift_once();
    v13 = sub_23B6E0668();
    __swift_project_value_buffer(v13, (uint64_t)qword_2543013F0);
    swift_bridgeObjectRetain();
    v14 = sub_23B6E0650();
    v15 = sub_23B6E08B4();
    if (os_log_type_enabled(v14, v15))
    {
      v16 = swift_slowAlloc();
      v17 = swift_slowAlloc();
      aBlock[0] = v17;
      *(_DWORD *)v16 = 136446210;
      swift_bridgeObjectRetain();
      *(_QWORD *)(v16 + 4) = sub_23B6BE8C4(v7, v8, aBlock);
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_23B6B3000, v14, v15, "Already registered %{public}s!", (uint8_t *)v16, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x23B86B840](v17, -1, -1);
      MEMORY[0x23B86B840](v16, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
LABEL_4:
    if (++v5 == v2)
      return swift_bridgeObjectRelease();
  }
  if (v10 == 2)
  {
LABEL_16:
    swift_beginAccess();
    v18 = (_QWORD *)*v4;
    swift_bridgeObjectRetain_n();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *v4 = v18;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      v18 = sub_23B6C66CC(0, v18[2] + 1, 1, v18);
      *v4 = v18;
    }
    v21 = v18[2];
    v20 = v18[3];
    if (v21 >= v20 >> 1)
    {
      v18 = sub_23B6C66CC((_QWORD *)(v20 > 1), v21 + 1, 1, v18);
      *v4 = v18;
    }
    v18[2] = v21 + 1;
    v22 = &v18[2 * v21];
    v22[4] = v7;
    v22[5] = v8;
    swift_endAccess();
    v23 = (_QWORD *)swift_allocObject();
    v23[2] = v3;
    v23[3] = v7;
    v23[4] = v8;
    v23[5] = v31;
    aBlock[4] = (uint64_t)sub_23B6D0B14;
    aBlock[5] = (uint64_t)v23;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_23B6CF568;
    aBlock[3] = (uint64_t)&block_descriptor_2;
    v24 = _Block_copy(aBlock);
    swift_bridgeObjectRetain();
    swift_retain();
    swift_release();
    v25 = sub_23B6E0704();
    swift_bridgeObjectRelease();
    xpc_set_event_stream_handler((const char *)(v25 + 32), 0, v24);
    swift_release();
    _Block_release(v24);
    goto LABEL_4;
  }
  v27 = v9 + 9;
  v28 = 2;
  while (1)
  {
    v29 = v28 + 1;
    if (__OFADD__(v28, 1))
      break;
    if (*(v27 - 1) == v7 && *v27 == v8)
      goto LABEL_11;
    result = sub_23B6E0A88();
    if ((result & 1) != 0)
      goto LABEL_11;
    v27 += 2;
    ++v28;
    if (v29 == v10)
      goto LABEL_16;
  }
  __break(1u);
  return result;
}

uint64_t sub_23B6CED98(void *a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  char isEscapingClosureAtFileLocation;
  uint64_t result;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22[6];
  uint64_t v23;
  uint64_t v24;

  v24 = MEMORY[0x24BEE4B00];
  v7 = MEMORY[0x23B86B924]();
  if (v7 != sub_23B6E0680())
  {
    if (qword_2543009B8 != -1)
      swift_once();
    v8 = sub_23B6E0668();
    __swift_project_value_buffer(v8, (uint64_t)qword_2543013F0);
    swift_unknownObjectRetain_n();
    v9 = sub_23B6E0650();
    v10 = sub_23B6E08A8();
    if (os_log_type_enabled(v9, v10))
    {
      v11 = (uint8_t *)swift_slowAlloc();
      v12 = swift_slowAlloc();
      v22[0] = v12;
      *(_DWORD *)v11 = 136446210;
      v23 = (uint64_t)a1;
      swift_unknownObjectRetain();
      __swift_instantiateConcreteTypeFromMangledName(&qword_256A472A0);
      v13 = sub_23B6E06F8();
      v23 = sub_23B6BE8C4(v13, v14, v22);
      sub_23B6E0920();
      swift_unknownObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_23B6B3000, v9, v10, "Expected XPC_TYPE_DICTIONARY -- got %{public}s!", v11, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x23B86B840](v12, -1, -1);
      MEMORY[0x23B86B840](v11, -1, -1);

    }
    else
    {

      swift_unknownObjectRelease_n();
    }
    return swift_bridgeObjectRelease();
  }
  v15 = swift_allocObject();
  *(_QWORD *)(v15 + 16) = &v24;
  v16 = swift_allocObject();
  *(_QWORD *)(v16 + 16) = sub_23B6D0B38;
  *(_QWORD *)(v16 + 24) = v15;
  v22[4] = (uint64_t)sub_23B6D0B50;
  v22[5] = v16;
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 1107296256;
  v22[2] = (uint64_t)sub_23B6CE590;
  v22[3] = (uint64_t)&block_descriptor_21;
  v17 = _Block_copy(v22);
  swift_retain();
  swift_release();
  xpc_dictionary_apply(a1, v17);
  _Block_release(v17);
  isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  result = swift_release();
  if ((isEscapingClosureAtFileLocation & 1) == 0)
  {
    v20 = swift_bridgeObjectRetain();
    v21 = sub_23B6CF1FC(v20);
    swift_bridgeObjectRelease();
    sub_23B6CF5B0(v21, a3, a4);
    swift_bridgeObjectRelease();
    swift_release();
    return swift_bridgeObjectRelease();
  }
  __break(1u);
  return result;
}

uint64_t sub_23B6CF0C4(uint64_t a1, void *a2, uint64_t *a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v18;
  uint64_t v19;

  v5 = MEMORY[0x23B86B924](a2);
  if (v5 == sub_23B6E0674() && xpc_string_get_string_ptr(a2))
  {
    v10 = sub_23B6E0728();
    v12 = v11;
    v13 = sub_23B6E0728();
    v15 = v14;
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v19 = *a3;
    *a3 = 0x8000000000000000;
    sub_23B6D03AC(v13, v15, v10, v12, isUniquelyReferenced_nonNull_native);
    *a3 = v19;
  }
  else
  {
    v6 = sub_23B6E0728();
    v8 = v7;
    swift_bridgeObjectRetain();
    v9 = swift_isUniquelyReferenced_nonNull_native();
    v18 = *a3;
    *a3 = 0x8000000000000000;
    sub_23B6D03AC(v6, v8, v6, v8, v9);
    *a3 = v18;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return 1;
}

unint64_t sub_23B6CF1FC(uint64_t a1)
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
  uint64_t *v11;
  uint64_t *v12;
  uint64_t v13;
  int64_t v14;
  uint64_t v15;
  uint64_t *v16;
  _OWORD *v17;
  unint64_t v18;
  int64_t v19;
  unint64_t v20;
  int64_t v21;
  int64_t v22;
  uint64_t *v23;
  unint64_t v24;
  char v25;
  uint64_t *v26;
  uint64_t v27;
  BOOL v28;
  uint64_t v29;
  int64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  __int128 v36;
  uint64_t v37;
  _OWORD v38[2];

  v1 = a1;
  if (*(_QWORD *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2543005A8);
    v2 = (_QWORD *)sub_23B6E0A28();
  }
  else
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
  }
  v31 = v1 + 64;
  v3 = -1 << *(_BYTE *)(v1 + 32);
  if (-v3 < 64)
    v4 = ~(-1 << -(char)v3);
  else
    v4 = -1;
  v5 = v4 & *(_QWORD *)(v1 + 64);
  v30 = (unint64_t)(63 - v3) >> 6;
  v6 = &v35;
  v7 = &v37;
  result = swift_bridgeObjectRetain();
  i = 0;
  v10 = MEMORY[0x24BEE0D00];
  if (v5)
    goto LABEL_10;
LABEL_11:
  v19 = i + 1;
  if (__OFADD__(i, 1))
    goto LABEL_35;
  if (v19 >= v30)
    goto LABEL_32;
  v20 = *(_QWORD *)(v31 + 8 * v19);
  v21 = i + 1;
  if (!v20)
  {
    v21 = i + 2;
    if (i + 2 >= v30)
      goto LABEL_32;
    v20 = *(_QWORD *)(v31 + 8 * v21);
    if (!v20)
    {
      v21 = i + 3;
      if (i + 3 >= v30)
        goto LABEL_32;
      v20 = *(_QWORD *)(v31 + 8 * v21);
      if (!v20)
      {
        v21 = i + 4;
        if (i + 4 >= v30)
          goto LABEL_32;
        v20 = *(_QWORD *)(v31 + 8 * v21);
        if (!v20)
        {
          v22 = i + 5;
          if (i + 5 < v30)
          {
            v20 = *(_QWORD *)(v31 + 8 * v22);
            if (v20)
            {
              v21 = i + 5;
              goto LABEL_26;
            }
            while (1)
            {
              v21 = v22 + 1;
              if (__OFADD__(v22, 1))
                goto LABEL_36;
              if (v21 >= v30)
                break;
              v20 = *(_QWORD *)(v31 + 8 * v21);
              ++v22;
              if (v20)
                goto LABEL_26;
            }
          }
LABEL_32:
          sub_23B6C5B90();
          return (unint64_t)v2;
        }
      }
    }
  }
LABEL_26:
  v32 = (v20 - 1) & v20;
  v18 = __clz(__rbit64(v20)) + (v21 << 6);
  for (i = v21; ; v18 = __clz(__rbit64(v5)) | (i << 6))
  {
    v23 = (uint64_t *)(*(_QWORD *)(v1 + 48) + 16 * v18);
    v33 = *v23;
    v34 = v23[1];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2543005D0);
    swift_dynamicCast();
    sub_23B6B5E14(v6, v7);
    sub_23B6B5E14(v7, v38);
    sub_23B6B5E14(v38, &v36);
    result = sub_23B6B5E60(v33, v34);
    v24 = result;
    if ((v25 & 1) != 0)
    {
      v11 = v7;
      v12 = v6;
      v13 = v1;
      v14 = i;
      v15 = v10;
      v16 = (uint64_t *)(v2[6] + 16 * result);
      swift_bridgeObjectRelease();
      *v16 = v33;
      v16[1] = v34;
      v10 = v15;
      i = v14;
      v1 = v13;
      v6 = v12;
      v7 = v11;
      v17 = (_OWORD *)(v2[7] + 32 * v24);
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v17);
      result = (unint64_t)sub_23B6B5E14(&v36, v17);
      v5 = v32;
      if (!v32)
        goto LABEL_11;
      goto LABEL_10;
    }
    if (v2[2] >= v2[3])
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v26 = (uint64_t *)(v2[6] + 16 * result);
    *v26 = v33;
    v26[1] = v34;
    result = (unint64_t)sub_23B6B5E14(&v36, (_OWORD *)(v2[7] + 32 * result));
    v27 = v2[2];
    v28 = __OFADD__(v27, 1);
    v29 = v27 + 1;
    if (v28)
      goto LABEL_34;
    v2[2] = v29;
    v5 = v32;
    if (!v32)
      goto LABEL_11;
LABEL_10:
    v32 = (v5 - 1) & v5;
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

uint64_t sub_23B6CF568(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v2 = swift_unknownObjectRetain();
  v1(v2);
  swift_release();
  return swift_unknownObjectRelease();
}

uint64_t sub_23B6CF5B0(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  _QWORD *v24;
  _QWORD v26[2];
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;

  v4 = v3;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_254301350);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2543009B8 != -1)
    swift_once();
  v11 = sub_23B6E0668();
  __swift_project_value_buffer(v11, (uint64_t)qword_2543013F0);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  v12 = sub_23B6E0650();
  v13 = sub_23B6E089C();
  if (os_log_type_enabled(v12, v13))
  {
    v14 = swift_slowAlloc();
    v27 = swift_slowAlloc();
    v30 = v27;
    *(_DWORD *)v14 = 136315394;
    swift_bridgeObjectRetain();
    v15 = sub_23B6BE8C4(a2, a3, &v30);
    v28 = v10;
    v29 = v15;
    sub_23B6E0920();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v14 + 12) = 2082;
    v26[1] = v14 + 14;
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2543005D0);
    v16 = sub_23B6E06B0();
    v17 = a2;
    v18 = v4;
    v20 = v19;
    swift_bridgeObjectRelease();
    v29 = sub_23B6BE8C4(v16, v20, &v30);
    v10 = v28;
    sub_23B6E0920();
    swift_bridgeObjectRelease_n();
    v4 = v18;
    a2 = v17;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23B6B3000, v12, v13, "processIncoming stream event for %s: %{public}s", (uint8_t *)v14, 0x16u);
    v21 = v27;
    swift_arrayDestroy();
    MEMORY[0x23B86B840](v21, -1, -1);
    MEMORY[0x23B86B840](v14, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
  }
  v22 = sub_23B6E07DC();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 56))(v10, 1, 1, v22);
  v23 = sub_23B6D0940();
  v24 = (_QWORD *)swift_allocObject();
  v24[2] = v4;
  v24[3] = v23;
  v24[4] = v4;
  v24[5] = a2;
  v24[6] = a3;
  v24[7] = a1;
  swift_retain_n();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_23B6CE420((uint64_t)v10, (uint64_t)&unk_256A47220, (uint64_t)v24);
  return swift_release();
}

uint64_t sub_23B6CF8D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  _QWORD *v7;

  v7[5] = a6;
  v7[6] = a7;
  v7[3] = a4;
  v7[4] = a5;
  v7[2] = a1;
  return swift_task_switch();
}

uint64_t sub_23B6CF8F0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  __int128 v4;

  v2 = *(_QWORD *)(v0 + 24);
  v1 = *(_QWORD *)(v0 + 32);
  sub_23B6E050C();
  v3 = swift_task_alloc();
  v4 = *(_OWORD *)(v0 + 40);
  *(_QWORD *)(v3 + 16) = v2;
  *(_QWORD *)(v3 + 24) = v1;
  *(_OWORD *)(v3 + 32) = v4;
  sub_23B6E04DC();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23B6CF994(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t result;

  sub_23B6E050C();
  sub_23B6E04F4();
  swift_retain_n();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2543005E0);
  swift_task_localValuePush();
  sub_23B6CFA70(a2, a3, a4, a5, a1);
  if (v5)
  {
    result = swift_task_localValuePop();
    __break(1u);
  }
  else
  {
    swift_task_localValuePop();
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t sub_23B6CFA70(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  unint64_t v19;
  char v20;
  uint64_t v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v23 = a4;
  v24 = a5;
  v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_254300188);
  v8 = *(_QWORD *)(v25 - 8);
  MEMORY[0x24BDAC7A8](v25);
  v10 = (char *)&v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254300F10);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254300F00);
  v15 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v14);
  v17 = (char *)&v23 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  v18 = *(_QWORD *)(a1 + 128);
  if (!*(_QWORD *)(v18 + 16))
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v15 + 56))(v13, 1, 1, v14);
    return sub_23B6B772C((uint64_t)v13, (uint64_t *)&unk_254300F10);
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v19 = sub_23B6B5E60(a2, a3);
  if ((v20 & 1) != 0)
  {
    (*(void (**)(char *, unint64_t, uint64_t))(v15 + 16))(v13, *(_QWORD *)(v18 + 56) + *(_QWORD *)(v15 + 72) * v19, v14);
    v21 = 0;
  }
  else
  {
    v21 = 1;
  }
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v15 + 56))(v13, v21, 1, v14);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14) == 1)
    return sub_23B6B772C((uint64_t)v13, (uint64_t *)&unk_254300F10);
  (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v17, v13, v14);
  v26 = v23;
  v27 = v24;
  swift_bridgeObjectRetain();
  swift_retain();
  sub_23B6E07F4();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v25);
  return (*(uint64_t (**)(char *, uint64_t))(v15 + 8))(v17, v14);
}

uint64_t XPCEventStreamHandler.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_defaultActor_destroy();
  return v0;
}

uint64_t XPCEventStreamHandler.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_defaultActor_destroy();
  return swift_defaultActor_deallocate();
}

uint64_t XPCEventStreamHandler.unownedExecutor.getter()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_23B6CFD34()
{
  uint64_t v0;

  v0 = sub_23B6E0668();
  __swift_allocate_value_buffer(v0, qword_2543009C0);
  __swift_project_value_buffer(v0, (uint64_t)qword_2543009C0);
  return sub_23B6E065C();
}

uint64_t sub_23B6CFDB4(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_23B6B87D0;
  return v6(a1);
}

uint64_t sub_23B6CFE18(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  return sub_23B6D0248(a1, a2, a3, a4, (void (*)(uint64_t))sub_23B6DD278, (void (*)(uint64_t))sub_23B6DBB0C, &qword_2543010B0, (void (*)(unint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_23B6DD03C);
}

uint64_t sub_23B6CFE3C(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  return sub_23B6D0248(a1, a2, a3, a4, (void (*)(uint64_t))sub_23B6DD28C, (void (*)(uint64_t))sub_23B6DBB20, (uint64_t *)&unk_254300730, (void (*)(unint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_23B6DD048);
}

uint64_t sub_23B6CFE60(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  return sub_23B6D00D0(a1, a2, a3, a4, (void (*)(void))sub_23B6DD2A0, (void (*)(void))sub_23B6DBB34, (void (*)(unint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_23B6DD054);
}

uint64_t sub_23B6CFE7C(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  return sub_23B6D0248(a1, a2, a3, a4, (void (*)(uint64_t))sub_23B6DD2AC, (void (*)(uint64_t))sub_23B6DBB40, (uint64_t *)&unk_254300F30, (void (*)(unint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_23B6DD058);
}

uint64_t sub_23B6CFEA0(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  return sub_23B6D0248(a1, a2, a3, a4, (void (*)(uint64_t))sub_23B6DD2C0, (void (*)(uint64_t))sub_23B6DBB54, (uint64_t *)&unk_254300520, (void (*)(unint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_23B6DD064);
}

uint64_t sub_23B6CFEC4(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  return sub_23B6D00D0(a1, a2, a3, a4, (void (*)(void))sub_23B6DD2D4, (void (*)(void))sub_23B6DBB68, (void (*)(unint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_23B6DD054);
}

uint64_t sub_23B6CFEE0(uint64_t a1, uint64_t a2, char a3)
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
  uint64_t v22;
  uint64_t result;
  unint64_t v24;
  char v25;
  uint64_t v26;

  v4 = (_QWORD **)v3;
  v8 = sub_23B6E0644();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v26 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = (_QWORD *)*v3;
  v14 = sub_23B6BF010(a2);
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
        v21 = v20[7];
        v22 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2543012F0);
        return (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 40))(v21 + *(_QWORD *)(*(_QWORD *)(v22 - 8) + 72) * v14, a1, v22);
      }
      goto LABEL_11;
    }
    if (v19 >= v17 && (a3 & 1) == 0)
    {
      sub_23B6DD2E0();
      goto LABEL_7;
    }
    sub_23B6DBB74(v17, a3 & 1);
    v24 = sub_23B6BF010(a2);
    if ((v18 & 1) == (v25 & 1))
    {
      v14 = v24;
      v20 = *v4;
      if ((v18 & 1) != 0)
        goto LABEL_8;
LABEL_11:
      (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a2, v8);
      return sub_23B6DD070(v14, (uint64_t)v11, a1, v20);
    }
  }
  result = sub_23B6E0AAC();
  __break(1u);
  return result;
}

uint64_t sub_23B6D006C(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  return sub_23B6D0248(a1, a2, a3, a4, (void (*)(uint64_t))sub_23B6DD5C4, (void (*)(uint64_t))sub_23B6DBF7C, &qword_254300560, (void (*)(unint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_23B6DD12C);
}

uint64_t sub_23B6D0090(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  return sub_23B6D0248(a1, a2, a3, a4, (void (*)(uint64_t))sub_23B6DD5D8, (void (*)(uint64_t))sub_23B6DBF90, &qword_254300540, (void (*)(unint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_23B6DD138);
}

uint64_t sub_23B6D00B4(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  return sub_23B6D00D0(a1, a2, a3, a4, (void (*)(void))sub_23B6DD5EC, (void (*)(void))sub_23B6DBFA4, (void (*)(unint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_23B6DD054);
}

uint64_t sub_23B6D00D0(uint64_t a1, uint64_t a2, uint64_t a3, char a4, void (*a5)(void), void (*a6)(void), void (*a7)(unint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t *v7;
  uint64_t *v10;
  uint64_t v15;
  char v16;
  unint64_t v17;
  uint64_t v18;
  _BOOL8 v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t result;
  unint64_t v26;
  char v27;

  v10 = v7;
  v15 = *v7;
  v17 = sub_23B6B5E60(a2, a3);
  v18 = *(_QWORD *)(v15 + 16);
  v19 = (v16 & 1) == 0;
  v20 = v18 + v19;
  if (__OFADD__(v18, v19))
  {
    __break(1u);
  }
  else
  {
    v21 = v16;
    v22 = *(_QWORD *)(v15 + 24);
    if (v22 >= v20 && (a4 & 1) != 0)
    {
LABEL_7:
      v23 = *v10;
      if ((v21 & 1) != 0)
      {
LABEL_8:
        v24 = *(_QWORD *)(v23 + 56);
        result = swift_bridgeObjectRelease();
        *(_QWORD *)(v24 + 8 * v17) = a1;
        return result;
      }
      goto LABEL_11;
    }
    if (v22 >= v20 && (a4 & 1) == 0)
    {
      a5();
      goto LABEL_7;
    }
    a6();
    v26 = sub_23B6B5E60(a2, a3);
    if ((v21 & 1) == (v27 & 1))
    {
      v17 = v26;
      v23 = *v10;
      if ((v21 & 1) != 0)
        goto LABEL_8;
LABEL_11:
      a7(v17, a2, a3, a1, v23);
      return swift_bridgeObjectRetain();
    }
  }
  result = sub_23B6E0AAC();
  __break(1u);
  return result;
}

uint64_t sub_23B6D0224(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  return sub_23B6D0248(a1, a2, a3, a4, (void (*)(uint64_t))sub_23B6DDAD8, (void (*)(uint64_t))sub_23B6DC2E0, (uint64_t *)&unk_254300F00, (void (*)(unint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_23B6DD18C);
}

uint64_t sub_23B6D0248(uint64_t a1, uint64_t a2, uint64_t a3, char a4, void (*a5)(uint64_t), void (*a6)(uint64_t), uint64_t *a7, void (*a8)(unint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t *v8;
  uint64_t *v11;
  uint64_t v16;
  char v17;
  unint64_t v18;
  uint64_t v19;
  _BOOL8 v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t result;
  unint64_t v28;
  char v29;

  v11 = v8;
  v16 = *v8;
  v18 = sub_23B6B5E60(a2, a3);
  v19 = *(_QWORD *)(v16 + 16);
  v20 = (v17 & 1) == 0;
  v21 = v19 + v20;
  if (__OFADD__(v19, v20))
  {
    __break(1u);
  }
  else
  {
    v22 = v17;
    v23 = *(_QWORD *)(v16 + 24);
    if (v23 >= v21 && (a4 & 1) != 0)
    {
LABEL_7:
      v24 = *v11;
      if ((v22 & 1) != 0)
      {
LABEL_8:
        v25 = *(_QWORD *)(v24 + 56);
        v26 = __swift_instantiateConcreteTypeFromMangledName(a7);
        return (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(_QWORD *)(v26 - 8) + 40))(v25 + *(_QWORD *)(*(_QWORD *)(v26 - 8) + 72) * v18, a1, v26);
      }
      goto LABEL_11;
    }
    if (v23 >= v21 && (a4 & 1) == 0)
    {
      a5(v21);
      goto LABEL_7;
    }
    a6(v21);
    v28 = sub_23B6B5E60(a2, a3);
    if ((v22 & 1) == (v29 & 1))
    {
      v18 = v28;
      v24 = *v11;
      if ((v22 & 1) != 0)
        goto LABEL_8;
LABEL_11:
      a8(v18, a2, a3, a1, v24);
      return swift_bridgeObjectRetain();
    }
  }
  result = sub_23B6E0AAC();
  __break(1u);
  return result;
}

uint64_t sub_23B6D03AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
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
  uint64_t *v21;
  uint64_t result;
  unint64_t v23;
  char v24;

  v6 = (_QWORD **)v5;
  v12 = (_QWORD *)*v5;
  v14 = sub_23B6B5E60(a3, a4);
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
        v21 = (uint64_t *)(v20[7] + 16 * v14);
        result = swift_bridgeObjectRelease();
        *v21 = a1;
        v21[1] = a2;
        return result;
      }
      goto LABEL_11;
    }
    if (v19 >= v17 && (a5 & 1) == 0)
    {
      sub_23B6DDD44();
      goto LABEL_7;
    }
    sub_23B6DC65C(v17, a5 & 1);
    v23 = sub_23B6B5E60(a3, a4);
    if ((v18 & 1) == (v24 & 1))
    {
      v14 = v23;
      v20 = *v6;
      if ((v18 & 1) != 0)
        goto LABEL_8;
LABEL_11:
      sub_23B6DD228(v14, a3, a4, a1, a2, v20);
      return swift_bridgeObjectRetain();
    }
  }
  result = sub_23B6E0AAC();
  __break(1u);
  return result;
}

uint64_t sub_23B6D04EC(uint64_t a1)
{
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2[5] = a1;
  v2[6] = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254300830);
  v2[7] = v4;
  v2[8] = *(_QWORD *)(v4 - 8);
  v2[9] = swift_task_alloc();
  v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254300F40);
  v2[10] = v5;
  v2[11] = *(_QWORD *)(v5 - 8);
  v2[12] = swift_task_alloc();
  v2[13] = swift_task_alloc();
  swift_defaultActor_initialize();
  v6 = MEMORY[0x24BEE4AF8];
  v1[15] = sub_23B6BA9F8(MEMORY[0x24BEE4AF8]);
  v1[16] = sub_23B6BAA14(v6);
  v1[17] = v6;
  v1[14] = a1;
  swift_bridgeObjectRetain();
  return swift_task_switch();
}

uint64_t sub_23B6D05CC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
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
  _QWORD *v16;
  uint64_t v17;
  int isUniquelyReferenced_nonNull_native;
  _QWORD *v19;
  char v20;
  unint64_t v21;
  uint64_t v22;
  _BOOL8 v23;
  uint64_t result;
  char v25;
  unint64_t v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  BOOL v32;
  uint64_t v33;
  unsigned int v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;

  v1 = *(_QWORD *)(v0 + 40);
  v2 = *(_QWORD *)(v1 + 16);
  if (v2)
  {
    v3 = v0 + 16;
    v4 = *(_QWORD *)(v0 + 88);
    v35 = *(_QWORD *)(v0 + 64);
    __swift_instantiateConcreteTypeFromMangledName(&qword_254300EB0);
    v34 = *MEMORY[0x24BEE6A10];
    v5 = (uint64_t *)(v1 + 40);
    while (1)
    {
      v36 = v5;
      v37 = v2;
      v8 = *(_QWORD *)(v0 + 104);
      v9 = *(_QWORD *)(v0 + 72);
      v38 = *(_QWORD *)(v0 + 96);
      v39 = *(_QWORD *)(v0 + 80);
      v10 = v4;
      v11 = v3;
      v13 = *(_QWORD *)(v0 + 48);
      v12 = *(_QWORD *)(v0 + 56);
      v15 = *(v5 - 1);
      v14 = *v5;
      v16 = (_QWORD *)swift_task_alloc();
      v16[2] = v13;
      v16[3] = v15;
      v16[4] = v14;
      v17 = v12;
      v3 = v11;
      (*(void (**)(uint64_t, _QWORD, uint64_t))(v35 + 104))(v9, v34, v17);
      swift_bridgeObjectRetain();
      sub_23B6E0818();
      swift_task_dealloc();
      swift_beginAccess();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 16))(v38, v8, v39);
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v19 = *(_QWORD **)(v13 + 120);
      *(_QWORD *)(v13 + 120) = 0x8000000000000000;
      v21 = sub_23B6B5E60(v15, v14);
      v22 = v19[2];
      v23 = (v20 & 1) == 0;
      result = v22 + v23;
      if (__OFADD__(v22, v23))
        break;
      v25 = v20;
      if (v19[3] >= result)
      {
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
          sub_23B6DD5F8();
      }
      else
      {
        sub_23B6DBFB0(result, isUniquelyReferenced_nonNull_native);
        v26 = sub_23B6B5E60(v15, v14);
        if ((v25 & 1) != (v27 & 1))
          return sub_23B6E0AAC();
        v21 = v26;
      }
      v4 = v10;
      v28 = *(_QWORD *)(v0 + 96);
      v29 = *(_QWORD *)(v0 + 80);
      if ((v25 & 1) != 0)
      {
        (*(void (**)(unint64_t, uint64_t, uint64_t))(v10 + 40))(v19[7] + *(_QWORD *)(v10 + 72) * v21, v28, v29);
      }
      else
      {
        v19[(v21 >> 6) + 8] |= 1 << v21;
        v30 = (uint64_t *)(v19[6] + 16 * v21);
        *v30 = v15;
        v30[1] = v14;
        result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v10 + 32))(v19[7] + *(_QWORD *)(v10 + 72) * v21, v28, v29);
        v31 = v19[2];
        v32 = __OFADD__(v31, 1);
        v33 = v31 + 1;
        if (v32)
          goto LABEL_17;
        v19[2] = v33;
        swift_bridgeObjectRetain();
      }
      v6 = *(_QWORD *)(v0 + 104);
      v7 = *(_QWORD *)(v0 + 80);
      *(_QWORD *)(*(_QWORD *)(v0 + 48) + 120) = v19;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_endAccess();
      (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v6, v7);
      v5 = v36 + 2;
      v2 = v37 - 1;
      if (v37 == 1)
        goto LABEL_14;
    }
    __break(1u);
LABEL_17:
    __break(1u);
  }
  else
  {
LABEL_14:
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(_QWORD *)(v0 + 48));
  }
  return result;
}

uint64_t type metadata accessor for XPCEventStreamHandler()
{
  return objc_opt_self();
}

uint64_t method lookup function for XPCEventStreamHandler()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of XPCEventStreamHandler.__allocating_init(streams:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))(**(int **)(v1 + 216) + *(_QWORD *)(v1 + 216));
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_23B6C5688;
  return v6(a1);
}

unint64_t sub_23B6D0940()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2543007A8;
  if (!qword_2543007A8)
  {
    v1 = type metadata accessor for XPCEventStreamHandler();
    result = MEMORY[0x23B86B7BC](&protocol conformance descriptor for XPCEventStreamHandler, v1);
    atomic_store(result, (unint64_t *)&qword_2543007A8);
  }
  return result;
}

uint64_t sub_23B6D0984()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_23B6D09C0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;

  v4 = *(_QWORD *)(v1 + 32);
  v5 = *(_QWORD *)(v1 + 40);
  v6 = swift_task_alloc();
  v7 = *(_OWORD *)(v1 + 48);
  *(_QWORD *)(v2 + 16) = v6;
  *(_QWORD *)v6 = v2;
  *(_QWORD *)(v6 + 8) = sub_23B6B8F74;
  *(_OWORD *)(v6 + 40) = v7;
  *(_QWORD *)(v6 + 24) = v4;
  *(_QWORD *)(v6 + 32) = v5;
  *(_QWORD *)(v6 + 16) = a1;
  return swift_task_switch();
}

uint64_t sub_23B6D0A38()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23B6D0A5C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_23B6B8F74;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_256A47230 + dword_256A47230))(a1, v4);
}

uint64_t sub_23B6D0ACC(uint64_t a1)
{
  uint64_t *v1;

  return sub_23B6CF994(a1, v1[2], v1[3], v1[4], v1[5]);
}

uint64_t sub_23B6D0AE8()
{
  swift_release();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_23B6D0B14(void *a1)
{
  uint64_t v1;

  return sub_23B6CED98(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32));
}

uint64_t block_destroy_helper_2()
{
  return swift_release();
}

uint64_t sub_23B6D0B28()
{
  return swift_deallocObject();
}

uint64_t sub_23B6D0B38(uint64_t a1, void *a2)
{
  uint64_t v2;

  return sub_23B6CF0C4(a1, a2, *(uint64_t **)(v2 + 16));
}

uint64_t sub_23B6D0B40()
{
  return swift_deallocObject();
}

uint64_t sub_23B6D0B50()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))() & 1;
}

uint64_t sub_23B6D0B74(uint64_t a1)
{
  uint64_t *v1;

  return sub_23B6CE89C(a1, v1[2], v1[3], v1[4]);
}

uint64_t ActorServiceDaemon.startupIsDone()(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;

  v3[9] = a2;
  v3[10] = v2;
  v3[8] = a1;
  v3[11] = sub_23B6E07AC();
  v3[12] = v4;
  return swift_task_switch();
}

uint64_t sub_23B6D0BDC()
{
  _QWORD *v0;

  v0[13] = (*(uint64_t (**)(_QWORD))(v0[9] + 16))(v0[8]);
  return swift_task_switch();
}

uint64_t sub_23B6D0C24()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t i;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t ObjectType;
  uint64_t (*v9)(uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v20;

  v1 = *(_QWORD *)(v0 + 104);
  swift_beginAccess();
  v2 = *(_QWORD *)(v1 + 112);
  *(_QWORD *)(v0 + 112) = v2;
  v3 = *(_QWORD *)(v2 + 16);
  *(_QWORD *)(v0 + 120) = v3;
  if (!v3)
  {
LABEL_10:
    swift_release();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  swift_bridgeObjectRetain();
  swift_beginAccess();
  for (i = 0; ; i = *(_QWORD *)(v0 + 128) + 1)
  {
    *(_QWORD *)(v0 + 128) = i;
    v5 = *(_QWORD *)(v0 + 104);
    v6 = *(_QWORD *)(v0 + 112) + 16 * i;
    *(_QWORD *)(v0 + 136) = *(_QWORD *)(v6 + 32);
    v7 = *(_QWORD *)(v6 + 40);
    ObjectType = swift_getObjectType();
    v9 = *(uint64_t (**)(uint64_t, uint64_t))(v7 + 24);
    swift_unknownObjectRetain();
    v10 = v9(ObjectType, v7);
    v12 = v11;
    *(_QWORD *)(v0 + 144) = v11;
    if (!*(_QWORD *)(*(_QWORD *)(v5 + 128) + 16))
      goto LABEL_6;
    v13 = v10;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_23B6B5E60(v13, v12);
    if ((v14 & 1) != 0)
      break;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
LABEL_6:
    swift_bridgeObjectRelease();
    v15 = *(_QWORD *)(v0 + 128);
    v16 = *(_QWORD *)(v0 + 120);
    swift_unknownObjectRelease();
    if (v15 + 1 == v16)
    {
      swift_bridgeObjectRelease();
      goto LABEL_10;
    }
  }
  v18 = *(_QWORD *)(v0 + 104);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_23B6D3A3C();
  v19 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 152) = v19;
  v19[2] = v18;
  v19[3] = v13;
  v19[4] = v12;
  v20 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 160) = v20;
  *v20 = v0;
  v20[1] = sub_23B6D0E24;
  return sub_23B6E0A94();
}

uint64_t sub_23B6D0E24()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 168) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23B6D0E98()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t ObjectType;
  uint64_t (*v8)(uint64_t, uint64_t);
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;

  while (1)
  {
    do
    {
      swift_bridgeObjectRelease();
      v1 = *(_QWORD *)(v0 + 128);
      v2 = *(_QWORD *)(v0 + 120);
      swift_unknownObjectRelease();
      if (v1 + 1 == v2)
      {
        swift_bridgeObjectRelease();
        swift_release();
        return (*(uint64_t (**)(void))(v0 + 8))();
      }
      v3 = *(_QWORD *)(v0 + 128) + 1;
      *(_QWORD *)(v0 + 128) = v3;
      v4 = *(_QWORD *)(v0 + 104);
      v5 = *(_QWORD *)(v0 + 112) + 16 * v3;
      *(_QWORD *)(v0 + 136) = *(_QWORD *)(v5 + 32);
      v6 = *(_QWORD *)(v5 + 40);
      ObjectType = swift_getObjectType();
      v8 = *(uint64_t (**)(uint64_t, uint64_t))(v6 + 24);
      swift_unknownObjectRetain();
      v9 = v8(ObjectType, v6);
      v11 = v10;
      *(_QWORD *)(v0 + 144) = v10;
    }
    while (!*(_QWORD *)(*(_QWORD *)(v4 + 128) + 16));
    v12 = v9;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_23B6B5E60(v12, v11);
    if ((v13 & 1) != 0)
      break;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  v15 = *(_QWORD *)(v0 + 104);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_23B6D3A3C();
  v16 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 152) = v16;
  v16[2] = v15;
  v16[3] = v12;
  v16[4] = v11;
  v17 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 160) = v17;
  *v17 = v0;
  v17[1] = sub_23B6D0E24;
  return sub_23B6E0A94();
}

uint64_t sub_23B6D1048()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_unknownObjectRelease();
  return swift_task_switch();
}

uint64_t sub_23B6D10A8()
{
  uint64_t v0;

  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23B6D10DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v8;
  uint64_t v9;

  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v8;
  v9 = type metadata accessor for Daemon();
  *v8 = v4;
  v8[1] = sub_23B6C5F04;
  return ActorServiceDaemon.getService<A>()(v9, a1, a4, a2);
}

uint64_t sub_23B6D11A8()
{
  _QWORD *v0;
  _QWORD *v1;

  v0[7] = (*(uint64_t (**)(_QWORD))(v0[4] + 16))(v0[2]);
  v1 = (_QWORD *)swift_task_alloc();
  v0[8] = v1;
  *v1 = v0;
  v1[1] = sub_23B6D1214;
  return sub_23B6D45E0(v0[3], v0[5]);
}

uint64_t sub_23B6D1214(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v4;

  v4 = *v1;
  swift_task_dealloc();
  swift_release();
  return (*(uint64_t (**)(uint64_t))(v4 + 8))(a1);
}

uint64_t sub_23B6D126C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v8;
  uint64_t v9;

  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v8;
  v9 = type metadata accessor for Daemon();
  *v8 = v4;
  v8[1] = sub_23B6D3FC0;
  return ActorServiceDaemon.getService<A>()(v9, a1, a4, a2);
}

uint64_t sub_23B6D12E4()
{
  uint64_t v0;

  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23B6D1318()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t (__cdecl *v3)();

  v3 = (uint64_t (__cdecl *)())((char *)&dword_256A473B0 + dword_256A473B0);
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_23B6B77B8;
  return v3();
}

uint64_t sub_23B6D1370()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 56) = v0;
  return swift_task_switch();
}

uint64_t sub_23B6D1388()
{
  _QWORD *v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t (*v12)(void);
  uint64_t v13;

  if (qword_254301078 != -1)
    swift_once();
  v1 = sub_23B6E0668();
  __swift_project_value_buffer(v1, (uint64_t)qword_2543013C0);
  swift_retain_n();
  v2 = sub_23B6E0650();
  v3 = sub_23B6E08C0();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = (uint8_t *)swift_slowAlloc();
    v5 = swift_slowAlloc();
    v13 = v5;
    *(_DWORD *)v4 = 136315138;
    swift_retain();
    v6 = sub_23B6CB618();
    v8 = v7;
    swift_release();
    v0[6] = sub_23B6BE8C4(v6, v8, &v13);
    sub_23B6E0920();
    swift_bridgeObjectRelease();
    swift_release_n();
    _os_log_impl(&dword_23B6B3000, v2, v3, "Starting daemon: %s", v4, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B86B840](v5, -1, -1);
    MEMORY[0x23B86B840](v4, -1, -1);
  }
  else
  {
    swift_release_n();
  }

  v9 = v0[7];
  v0[5] = MEMORY[0x24BEE4AF8];
  v12 = (uint64_t (*)(void))(**(int **)(v9 + 168) + *(_QWORD *)(v9 + 168));
  v10 = (_QWORD *)swift_task_alloc();
  v0[8] = v10;
  *v10 = v0;
  v10[1] = sub_23B6D1598;
  return v12();
}

uint64_t sub_23B6D1598(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 72) = a1;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23B6D15F4()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0[7];
  sub_23B6CB310(v0[9]);
  v2 = v0[5];
  v0[10] = *(_QWORD *)(v1 + 128);
  v0[11] = v2;
  return swift_task_switch();
}

uint64_t sub_23B6D1640()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(v0 + 80);
  v1 = *(_QWORD *)(v0 + 88);
  swift_beginAccess();
  *(_QWORD *)(v2 + 112) = v1;
  swift_bridgeObjectRelease();
  return swift_task_switch();
}

uint64_t sub_23B6D16A4()
{
  _QWORD *v0;
  uint64_t v1;
  _QWORD *v2;

  v0[12] = *(_QWORD *)(v0[7] + 144);
  swift_retain();
  v1 = sub_23B6BDAF4();
  v0[13] = v1;
  v2 = (_QWORD *)swift_task_alloc();
  v0[14] = v2;
  *v2 = v0;
  v2[1] = sub_23B6D170C;
  return sub_23B6BBF10(v1);
}

uint64_t sub_23B6D170C()
{
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_release();
  return swift_task_switch();
}

uint64_t sub_23B6D1780()
{
  _QWORD *v0;
  uint64_t v1;
  _QWORD *v2;

  v0[15] = *(_QWORD *)(v0[7] + 152);
  swift_retain();
  v1 = sub_23B6C2008();
  v0[16] = v1;
  v2 = (_QWORD *)swift_task_alloc();
  v0[17] = v2;
  *v2 = v0;
  v2[1] = sub_23B6D17E8;
  return sub_23B6C04B8(v1);
}

uint64_t sub_23B6D17E8()
{
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_release();
  return swift_task_switch();
}

uint64_t sub_23B6D185C()
{
  uint64_t v0;
  _QWORD *v1;

  swift_retain();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 144) = v1;
  *v1 = v0;
  v1[1] = sub_23B6D18B0;
  return sub_23B6D4E68();
}

uint64_t sub_23B6D18B0()
{
  swift_task_dealloc();
  swift_release();
  return swift_task_switch();
}

uint64_t sub_23B6D1914()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 152) = *(_QWORD *)(*(_QWORD *)(v0 + 56) + 136);
  swift_retain();
  return swift_task_switch();
}

uint64_t sub_23B6D195C()
{
  uint64_t v0;
  uint64_t v1;

  v1 = swift_bridgeObjectRetain();
  sub_23B6CE998(v1);
  swift_bridgeObjectRelease();
  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t ActorServiceDaemon.startup()(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;

  v3[5] = a2;
  v3[6] = v2;
  v3[4] = a1;
  v3[7] = *(_QWORD *)(a2 + 8);
  v3[8] = sub_23B6E07AC();
  v3[9] = v4;
  return swift_task_switch();
}

uint64_t sub_23B6D1A00()
{
  _QWORD *v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint64_t v4;
  uint8_t *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  _QWORD *v9;
  uint64_t (*v11)(_QWORD, _QWORD);
  uint64_t v12;

  if (qword_254301078 != -1)
    swift_once();
  v1 = sub_23B6E0668();
  __swift_project_value_buffer(v1, (uint64_t)qword_2543013C0);
  swift_unknownObjectRetain_n();
  v2 = sub_23B6E0650();
  v3 = sub_23B6E08C0();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = v0[6];
    v5 = (uint8_t *)swift_slowAlloc();
    v6 = swift_slowAlloc();
    v12 = v6;
    *(_DWORD *)v5 = 136315138;
    v0[2] = v4;
    v7 = sub_23B6E0A64();
    v0[3] = sub_23B6BE8C4(v7, v8, &v12);
    sub_23B6E0920();
    swift_bridgeObjectRelease();
    swift_unknownObjectRelease_n();
    _os_log_impl(&dword_23B6B3000, v2, v3, "Starting daemon: %s", v5, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B86B840](v6, -1, -1);
    MEMORY[0x23B86B840](v5, -1, -1);
  }
  else
  {
    swift_unknownObjectRelease_n();
  }

  v11 = (uint64_t (*)(_QWORD, _QWORD))(**(int **)(v0[5] + 24) + *(_QWORD *)(v0[5] + 24));
  v9 = (_QWORD *)swift_task_alloc();
  v0[10] = v9;
  *v9 = v0;
  v9[1] = sub_23B6D1C08;
  return v11(v0[4], v0[5]);
}

uint64_t sub_23B6D1C08()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23B6D1C54()
{
  _QWORD *v0;
  uint64_t v1;
  _QWORD *v2;

  v0[11] = (*(uint64_t (**)(_QWORD))(v0[7] + 56))(v0[4]);
  v1 = sub_23B6BDAF4();
  v0[12] = v1;
  v2 = (_QWORD *)swift_task_alloc();
  v0[13] = v2;
  *v2 = v0;
  v2[1] = sub_23B6D1CC0;
  return sub_23B6BBF10(v1);
}

uint64_t sub_23B6D1CC0()
{
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_release();
  return swift_task_switch();
}

uint64_t sub_23B6D1D28()
{
  _QWORD *v0;
  uint64_t v1;
  _QWORD *v2;

  v0[14] = (*(uint64_t (**)(_QWORD))(v0[7] + 64))(v0[4]);
  v1 = sub_23B6C2008();
  v0[15] = v1;
  v2 = (_QWORD *)swift_task_alloc();
  v0[16] = v2;
  *v2 = v0;
  v2[1] = sub_23B6D1D94;
  return sub_23B6C04B8(v1);
}

uint64_t sub_23B6D1D94()
{
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_release();
  return swift_task_switch();
}

uint64_t sub_23B6D1DFC()
{
  _QWORD *v0;
  _QWORD *v1;

  v0[17] = (*(uint64_t (**)(_QWORD))(v0[5] + 16))(v0[4]);
  v1 = (_QWORD *)swift_task_alloc();
  v0[18] = v1;
  *v1 = v0;
  v1[1] = sub_23B6D1E58;
  return sub_23B6D4E68();
}

uint64_t sub_23B6D1E58()
{
  swift_task_dealloc();
  swift_release();
  return swift_task_switch();
}

uint64_t sub_23B6D1EAC()
{
  _QWORD *v0;

  v0[19] = (*(uint64_t (**)(_QWORD))(v0[7] + 48))(v0[4]);
  return swift_task_switch();
}

uint64_t sub_23B6D1EF4()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = v0;
  return swift_task_switch();
}

uint64_t sub_23B6D1F0C()
{
  _QWORD *v0;
  _QWORD *v1;

  v0[3] = *(_QWORD *)(v0[2] + 128);
  swift_retain();
  v1 = (_QWORD *)swift_task_alloc();
  v0[4] = v1;
  *v1 = v0;
  v1[1] = sub_23B6D3FC4;
  return sub_23B6D924C();
}

uint64_t ActorServiceDaemon.initialLaunchProcessing()(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;

  v3[3] = a2;
  v3[4] = v2;
  v3[2] = a1;
  sub_23B6E07AC();
  return swift_task_switch();
}

uint64_t sub_23B6D1FB8()
{
  _QWORD *v0;
  _QWORD *v1;

  v0[5] = (*(uint64_t (**)(_QWORD))(v0[3] + 16))(v0[2]);
  v1 = (_QWORD *)swift_task_alloc();
  v0[6] = v1;
  *v1 = v0;
  v1[1] = sub_23B6D3FB0;
  return sub_23B6D924C();
}

uint64_t sub_23B6D2014(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v4 = *a1;
  v5 = a1[1];
  *(_QWORD *)(v3 + 176) = v2;
  *(_QWORD *)(v3 + 184) = v4;
  *(_QWORD *)(v3 + 192) = v5;
  *(_OWORD *)(v3 + 200) = *((_OWORD *)a1 + 1);
  v6 = a1[5];
  *(_QWORD *)(v3 + 216) = a1[4];
  *(_QWORD *)(v3 + 224) = v6;
  *(_BYTE *)(v3 + 344) = *((_BYTE *)a1 + 48);
  *(_OWORD *)(v3 + 232) = *(_OWORD *)(a1 + 7);
  v7 = *a2;
  v8 = a2[1];
  *(_QWORD *)(v3 + 248) = a1[9];
  *(_QWORD *)(v3 + 256) = v7;
  *(_QWORD *)(v3 + 264) = v8;
  *(_OWORD *)(v3 + 272) = *((_OWORD *)a2 + 1);
  v9 = a2[5];
  *(_QWORD *)(v3 + 288) = a2[4];
  *(_QWORD *)(v3 + 296) = v9;
  *(_BYTE *)(v3 + 345) = *((_BYTE *)a2 + 48);
  *(_OWORD *)(v3 + 304) = *(_OWORD *)(a2 + 7);
  *(_QWORD *)(v3 + 320) = a2[9];
  return swift_task_switch();
}

uint64_t sub_23B6D208C()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;

  v1 = *(_QWORD *)(v0 + 320);
  v2 = *(_BYTE *)(v0 + 345);
  v4 = *(_QWORD *)(v0 + 288);
  v3 = *(_QWORD *)(v0 + 296);
  v5 = *(_QWORD *)(v0 + 264);
  v6 = *(_BYTE *)(v0 + 344);
  v8 = *(_QWORD *)(v0 + 216);
  v7 = *(_QWORD *)(v0 + 224);
  v10 = *(_QWORD *)(v0 + 184);
  v9 = *(_QWORD *)(v0 + 192);
  *(_QWORD *)(v0 + 328) = *(_QWORD *)(*(_QWORD *)(v0 + 176) + 128);
  *(_QWORD *)(v0 + 16) = v10;
  *(_QWORD *)(v0 + 24) = v9;
  *(_OWORD *)(v0 + 32) = *(_OWORD *)(v0 + 200);
  *(_QWORD *)(v0 + 48) = v8;
  *(_QWORD *)(v0 + 56) = v7;
  *(_BYTE *)(v0 + 64) = v6;
  *(_OWORD *)(v0 + 72) = *(_OWORD *)(v0 + 232);
  *(_OWORD *)(v0 + 88) = *(_OWORD *)(v0 + 248);
  *(_QWORD *)(v0 + 104) = v5;
  *(_OWORD *)(v0 + 112) = *(_OWORD *)(v0 + 272);
  *(_QWORD *)(v0 + 128) = v4;
  *(_QWORD *)(v0 + 136) = v3;
  *(_BYTE *)(v0 + 144) = v2;
  *(_OWORD *)(v0 + 152) = *(_OWORD *)(v0 + 304);
  *(_QWORD *)(v0 + 168) = v1;
  swift_retain();
  v11 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 336) = v11;
  *v11 = v0;
  v11[1] = sub_23B6D216C;
  return sub_23B6D9794((__int128 *)(v0 + 16), (_OWORD *)(v0 + 96));
}

uint64_t sub_23B6D216C()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  swift_release();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t ActorServiceDaemon.migrate(from:to:)(uint64_t *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  *(_QWORD *)(v5 + 176) = a3;
  *(_QWORD *)(v5 + 184) = a4;
  v6 = *a1;
  v7 = a1[1];
  *(_QWORD *)(v5 + 192) = v4;
  *(_QWORD *)(v5 + 200) = v6;
  *(_QWORD *)(v5 + 208) = v7;
  *(_OWORD *)(v5 + 216) = *((_OWORD *)a1 + 1);
  v8 = a1[5];
  *(_QWORD *)(v5 + 232) = a1[4];
  *(_QWORD *)(v5 + 240) = v8;
  *(_BYTE *)(v5 + 360) = *((_BYTE *)a1 + 48);
  *(_OWORD *)(v5 + 248) = *(_OWORD *)(a1 + 7);
  v9 = *a2;
  v10 = a2[1];
  *(_QWORD *)(v5 + 264) = a1[9];
  *(_QWORD *)(v5 + 272) = v9;
  *(_QWORD *)(v5 + 280) = v10;
  *(_OWORD *)(v5 + 288) = *((_OWORD *)a2 + 1);
  v11 = a2[5];
  *(_QWORD *)(v5 + 304) = a2[4];
  *(_QWORD *)(v5 + 312) = v11;
  *(_BYTE *)(v5 + 361) = *((_BYTE *)a2 + 48);
  *(_OWORD *)(v5 + 320) = *(_OWORD *)(a2 + 7);
  *(_QWORD *)(v5 + 336) = a2[9];
  sub_23B6E07AC();
  return swift_task_switch();
}

uint64_t sub_23B6D2270()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  uint64_t v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;

  v1 = *(_QWORD *)(v0 + 336);
  v2 = *(_BYTE *)(v0 + 361);
  v3 = *(_QWORD *)(v0 + 312);
  v14 = *(_OWORD *)(v0 + 296);
  v15 = *(_OWORD *)(v0 + 320);
  v12 = *(_OWORD *)(v0 + 264);
  v13 = *(_OWORD *)(v0 + 280);
  v4 = *(_BYTE *)(v0 + 360);
  v6 = *(_QWORD *)(v0 + 232);
  v5 = *(_QWORD *)(v0 + 240);
  v10 = *(_OWORD *)(v0 + 216);
  v11 = *(_OWORD *)(v0 + 248);
  v9 = *(_OWORD *)(v0 + 200);
  *(_QWORD *)(v0 + 344) = (*(uint64_t (**)(_QWORD))(*(_QWORD *)(v0 + 184) + 16))(*(_QWORD *)(v0 + 176));
  *(_OWORD *)(v0 + 16) = v9;
  *(_OWORD *)(v0 + 32) = v10;
  *(_QWORD *)(v0 + 48) = v6;
  *(_QWORD *)(v0 + 56) = v5;
  *(_BYTE *)(v0 + 64) = v4;
  *(_OWORD *)(v0 + 72) = v11;
  *(_OWORD *)(v0 + 88) = v12;
  *(_OWORD *)(v0 + 104) = v13;
  *(_OWORD *)(v0 + 120) = v14;
  *(_QWORD *)(v0 + 136) = v3;
  *(_BYTE *)(v0 + 144) = v2;
  *(_OWORD *)(v0 + 152) = v15;
  *(_QWORD *)(v0 + 168) = v1;
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 352) = v7;
  *v7 = v0;
  v7[1] = sub_23B6D2398;
  return sub_23B6D9794((__int128 *)(v0 + 16), (_OWORD *)(v0 + 96));
}

uint64_t sub_23B6D2398()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  swift_release();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_23B6D23E8()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = v0;
  return swift_task_switch();
}

uint64_t sub_23B6D2400()
{
  _QWORD *v0;
  _QWORD *v1;

  v0[3] = *(_QWORD *)(v0[2] + 128);
  swift_retain();
  v1 = (_QWORD *)swift_task_alloc();
  v0[4] = v1;
  *v1 = v0;
  v1[1] = sub_23B6D245C;
  return sub_23B6DA144();
}

uint64_t sub_23B6D245C()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  swift_release();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t ActorServiceDaemon.firstLaunchSinceReboot()(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;

  v3[3] = a2;
  v3[4] = v2;
  v3[2] = a1;
  sub_23B6E07AC();
  return swift_task_switch();
}

uint64_t sub_23B6D24FC()
{
  _QWORD *v0;
  _QWORD *v1;

  v0[5] = (*(uint64_t (**)(_QWORD))(v0[3] + 16))(v0[2]);
  v1 = (_QWORD *)swift_task_alloc();
  v0[6] = v1;
  *v1 = v0;
  v1[1] = sub_23B6D2558;
  return sub_23B6DA144();
}

uint64_t sub_23B6D2558()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  swift_release();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_23B6D25A8()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t (__cdecl *v3)();

  v3 = (uint64_t (__cdecl *)())((char *)&dword_256A47368 + dword_256A47368);
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_23B6B77B8;
  return v3();
}

uint64_t sub_23B6D2600()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 1336) = v0;
  return swift_task_switch();
}

uint64_t sub_23B6D2618()
{
  uint64_t v0;
  _QWORD *v1;

  sub_23B6E050C();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 1384) = v1;
  *v1 = v0;
  v1[1] = sub_23B6D2694;
  return sub_23B6E04E8();
}

uint64_t sub_23B6D2694()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 1432) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23B6D26F8()
{
  _QWORD *v0;
  uint64_t v1;
  _QWORD *v2;

  v1 = v0[167];
  swift_retain_n();
  swift_asyncLet_begin();
  swift_retain();
  swift_asyncLet_begin();
  v0[185] = *(_QWORD *)(v1 + 128);
  swift_retain();
  v2 = (_QWORD *)swift_task_alloc();
  v0[191] = v2;
  *v2 = v0;
  v2[1] = sub_23B6D27BC;
  return sub_23B6D6ED8();
}

uint64_t sub_23B6D27BC()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 1576) = v0;
  swift_task_dealloc();
  if (v0)
    return swift_task_switch();
  swift_release();
  return swift_asyncLet_get();
}

uint64_t sub_23B6D2850()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23B6D285C()
{
  return swift_asyncLet_get();
}

uint64_t sub_23B6D2870()
{
  return swift_asyncLet_finish();
}

uint64_t sub_23B6D2884()
{
  return swift_task_switch();
}

uint64_t sub_23B6D2898()
{
  return swift_asyncLet_finish();
}

uint64_t sub_23B6D28AC()
{
  return swift_task_switch();
}

uint64_t sub_23B6D28C0()
{
  uint64_t v0;

  swift_release_n();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23B6D28F8()
{
  swift_release();
  return swift_asyncLet_finish();
}

uint64_t sub_23B6D293C()
{
  return swift_task_switch();
}

uint64_t sub_23B6D2950()
{
  return swift_asyncLet_finish();
}

uint64_t sub_23B6D2964()
{
  return swift_task_switch();
}

uint64_t sub_23B6D2978()
{
  uint64_t v0;

  swift_release_n();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t ActorServiceDaemon.run()(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;

  v3[179] = v2;
  v3[173] = a2;
  v3[167] = a1;
  v3[185] = sub_23B6E07AC();
  v3[191] = v4;
  return swift_task_switch();
}

uint64_t sub_23B6D2A08()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  _QWORD *v5;

  v1 = v0[179];
  v2 = v0[173];
  v3 = v0[167];
  sub_23B6E050C();
  v4 = (_QWORD *)swift_task_alloc();
  v0[197] = v4;
  v4[2] = v3;
  v4[3] = v2;
  v4[4] = v1;
  v5 = (_QWORD *)swift_task_alloc();
  v0[198] = v5;
  *v5 = v0;
  v5[1] = sub_23B6D2AB8;
  return sub_23B6E04E8();
}

uint64_t sub_23B6D2AB8()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 1592) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23B6D2B2C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  _QWORD *v5;
  _QWORD *v6;

  v1 = v0[179];
  v2 = v0[173];
  v3 = v0[167];
  v4 = (_QWORD *)swift_allocObject();
  v0[200] = v4;
  v4[2] = v3;
  v4[3] = v2;
  v4[4] = v1;
  swift_unknownObjectRetain();
  swift_retain();
  swift_asyncLet_begin();
  v5 = (_QWORD *)swift_allocObject();
  v0[201] = v5;
  v5[2] = v3;
  v5[3] = v2;
  v5[4] = v1;
  swift_unknownObjectRetain();
  swift_retain();
  swift_asyncLet_begin();
  v0[202] = (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 16))(v3, v2);
  v6 = (_QWORD *)swift_task_alloc();
  v0[203] = v6;
  *v6 = v0;
  v6[1] = sub_23B6D2C60;
  return sub_23B6D6ED8();
}

uint64_t sub_23B6D2C60()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 1632) = v0;
  swift_task_dealloc();
  if (v0)
    return swift_task_switch();
  swift_release();
  return swift_asyncLet_get();
}

uint64_t sub_23B6D2CF4()
{
  return swift_asyncLet_get();
}

uint64_t sub_23B6D2D08()
{
  return swift_asyncLet_finish();
}

uint64_t sub_23B6D2D1C()
{
  return swift_task_switch();
}

uint64_t sub_23B6D2D30()
{
  swift_release();
  return swift_asyncLet_finish();
}

uint64_t sub_23B6D2D74()
{
  return swift_task_switch();
}

uint64_t sub_23B6D2D88()
{
  uint64_t v0;

  swift_release_n();
  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23B6D2DCC()
{
  uint64_t v0;

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23B6D2E00()
{
  swift_release();
  return swift_asyncLet_finish();
}

uint64_t sub_23B6D2E44()
{
  return swift_task_switch();
}

uint64_t sub_23B6D2E58()
{
  swift_release();
  return swift_asyncLet_finish();
}

uint64_t sub_23B6D2E9C()
{
  return swift_task_switch();
}

uint64_t sub_23B6D2EB0()
{
  uint64_t v0;

  swift_release_n();
  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23B6D2EF4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v9;

  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v9;
  *v9 = v4;
  v9[1] = sub_23B6C5688;
  return ActorServiceDaemon.getService<A>()(a3, a1, a4, a2);
}

uint64_t sub_23B6D2F68(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v9;

  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v9;
  *v9 = v4;
  v9[1] = sub_23B6D2FDC;
  return ActorServiceDaemon.getService<A>()(a3, a1, a4, a2);
}

uint64_t sub_23B6D2FDC(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;

  v4 = *v2;
  v5 = swift_task_dealloc();
  if (!v1)
    v5 = a1;
  return (*(uint64_t (**)(uint64_t))(v4 + 8))(v5);
}

uint64_t sub_23B6D3030(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;

  v3[4] = a2;
  v3[5] = a3;
  v3[3] = a1;
  return swift_task_switch();
}

uint64_t sub_23B6D304C()
{
  _QWORD *v0;
  uint64_t v1;
  _QWORD *v2;

  v1 = v0[4];
  sub_23B6E050C();
  v0[6] = sub_23B6E04F4();
  v0[2] = v1;
  swift_retain();
  v2 = (_QWORD *)swift_task_alloc();
  v0[7] = v2;
  *v2 = v0;
  v2[1] = sub_23B6D3118;
  return sub_23B6E0B60();
}

uint64_t sub_23B6D3118()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 64) = v0;
  swift_task_dealloc();
  swift_release();
  swift_release();
  if (v0)
    return swift_task_switch();
  else
    return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_23B6D31A4()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23B6D31B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;

  v5[6] = a4;
  v5[7] = a5;
  v5[4] = a2;
  v5[5] = a3;
  v5[3] = a1;
  return swift_task_switch();
}

uint64_t sub_23B6D31D0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  __int128 v6;

  v1 = *(_QWORD *)(v0 + 32);
  v2 = *(_QWORD *)(v0 + 40);
  sub_23B6E050C();
  v6 = *(_OWORD *)(v0 + 48);
  *(_QWORD *)(v0 + 64) = sub_23B6E04F4();
  *(_QWORD *)(v0 + 16) = v1;
  v3 = swift_task_alloc();
  *(_QWORD *)(v0 + 72) = v3;
  *(_OWORD *)(v3 + 16) = v6;
  *(_QWORD *)(v3 + 32) = v2;
  swift_retain();
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 80) = v4;
  *v4 = v0;
  v4[1] = sub_23B6D32C8;
  return sub_23B6E0B60();
}

uint64_t sub_23B6D32C8()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 88) = v0;
  swift_task_dealloc();
  swift_release();
  swift_release();
  swift_task_dealloc();
  if (v0)
    return swift_task_switch();
  else
    return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_23B6D336C()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23B6D3378()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t (__cdecl *v3)();

  v3 = (uint64_t (__cdecl *)())((char *)&dword_256A473B0 + dword_256A473B0);
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_23B6B8F74;
  return v3();
}

uint64_t sub_23B6D33D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v6;
  _QWORD *v7;
  uint64_t (*v9)(uint64_t, uint64_t);

  v6 = *(_QWORD *)(a4 + 8);
  v9 = (uint64_t (*)(uint64_t, uint64_t))(**(int **)(v6 + 72) + *(_QWORD *)(v6 + 72));
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v7;
  *v7 = v4;
  v7[1] = sub_23B6B77B8;
  return v9(a3, v6);
}

uint64_t sub_23B6D3444(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 16) = a2;
  return swift_task_switch();
}

uint64_t sub_23B6D3458()
{
  _QWORD *v0;
  _QWORD *v1;

  v0[3] = *(_QWORD *)(v0[2] + 144);
  swift_retain();
  v1 = (_QWORD *)swift_task_alloc();
  v0[4] = v1;
  *v1 = v0;
  v1[1] = sub_23B6D3FB4;
  return sub_23B6BC56C();
}

uint64_t sub_23B6D34B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;

  v4[2] = a2;
  v4[3] = a3;
  v5 = *(_QWORD *)(a4 + 8);
  v4[4] = v5;
  v4[5] = *(_QWORD *)(v5 + 56);
  sub_23B6E07AC();
  return swift_task_switch();
}

uint64_t sub_23B6D3518()
{
  uint64_t v0;
  _QWORD *v1;

  *(_QWORD *)(v0 + 48) = (*(uint64_t (**)(_QWORD, _QWORD))(v0 + 40))(*(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32));
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 56) = v1;
  *v1 = v0;
  v1[1] = sub_23B6D3FB8;
  return sub_23B6BC56C();
}

uint64_t sub_23B6D3570(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 16) = a2;
  return swift_task_switch();
}

uint64_t sub_23B6D3584()
{
  _QWORD *v0;
  _QWORD *v1;

  v0[3] = *(_QWORD *)(v0[2] + 152);
  swift_retain();
  v1 = (_QWORD *)swift_task_alloc();
  v0[4] = v1;
  *v1 = v0;
  v1[1] = sub_23B6D35E0;
  return sub_23B6C0AD8();
}

uint64_t sub_23B6D35E0()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  swift_release();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_23B6D3634(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;

  v4[2] = a2;
  v4[3] = a3;
  v5 = *(_QWORD *)(a4 + 8);
  v4[4] = v5;
  v4[5] = *(_QWORD *)(v5 + 64);
  sub_23B6E07AC();
  return swift_task_switch();
}

uint64_t sub_23B6D3698()
{
  uint64_t v0;
  _QWORD *v1;

  *(_QWORD *)(v0 + 48) = (*(uint64_t (**)(_QWORD, _QWORD))(v0 + 40))(*(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32));
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 56) = v1;
  *v1 = v0;
  v1[1] = sub_23B6D36F0;
  return sub_23B6C0AD8();
}

uint64_t sub_23B6D36F0()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  swift_release();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t ActorServiceDaemon.runForever()(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3[2] = v2;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A47320);
  v3[3] = v5;
  v3[4] = *(_QWORD *)(v5 - 8);
  v3[5] = swift_task_alloc();
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256A47328);
  v3[6] = v6;
  v3[7] = *(_QWORD *)(v6 - 8);
  v3[8] = swift_task_alloc();
  v3[9] = __swift_instantiateConcreteTypeFromMangledName(&qword_256A47330);
  v3[10] = swift_task_alloc();
  v3[11] = *(_QWORD *)(*(_QWORD *)(a2 + 8) + 16);
  v3[12] = sub_23B6E07AC();
  v3[13] = v7;
  return swift_task_switch();
}

uint64_t sub_23B6D3828()
{
  _QWORD *v0;
  _QWORD *v1;

  (*(void (**)(_QWORD, _QWORD, _QWORD))(v0[7] + 104))(v0[8], *MEMORY[0x24BEE6A10], v0[6]);
  sub_23B6E0818();
  sub_23B6E0800();
  v1 = (_QWORD *)swift_task_alloc();
  v0[14] = v1;
  *v1 = v0;
  v1[1] = sub_23B6D38FC;
  return sub_23B6E080C();
}

uint64_t sub_23B6D38FC()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23B6D3948()
{
  uint64_t v0;
  _QWORD *v2;

  if ((*(_BYTE *)(v0 + 120) & 1) != 0)
  {
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 32) + 8))(*(_QWORD *)(v0 + 40), *(_QWORD *)(v0 + 24));
    return sub_23B6E0A04();
  }
  else
  {
    v2 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 112) = v2;
    *v2 = v0;
    v2[1] = sub_23B6D38FC;
    return sub_23B6E080C();
  }
}

unint64_t sub_23B6D3A3C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_254301320;
  if (!qword_254301320)
  {
    v1 = type metadata accessor for ActorServiceCollection();
    result = MEMORY[0x23B86B7BC](&protocol conformance descriptor for ActorServiceCollection, v1);
    atomic_store(result, (unint64_t *)&qword_254301320);
  }
  return result;
}

uint64_t sub_23B6D3A84(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;

  v6 = *(_QWORD *)(v2 + 32);
  v7 = swift_task_alloc();
  v8 = *(_OWORD *)(v2 + 16);
  *(_QWORD *)(v3 + 16) = v7;
  *(_QWORD *)v7 = v3;
  *(_QWORD *)(v7 + 8) = sub_23B6B77B8;
  *(_OWORD *)(v7 + 48) = v8;
  *(_QWORD *)(v7 + 32) = a2;
  *(_QWORD *)(v7 + 40) = v6;
  *(_QWORD *)(v7 + 24) = a1;
  return swift_task_switch();
}

uint64_t sub_23B6D3B00()
{
  swift_unknownObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_23B6D3B24(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;

  v4 = v1[2];
  v5 = v1[3];
  v6 = v1[4];
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_23B6B77B8;
  return sub_23B6D34B4(a1, v6, v4, v5);
}

uint64_t sub_23B6D3B90(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;

  v4 = v1[2];
  v5 = v1[3];
  v6 = v1[4];
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_23B6B77B8;
  return sub_23B6D3634(a1, v6, v4, v5);
}

uint64_t dispatch thunk of ActorServiceDaemon.actorServiceCollection.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of ActorServiceDaemon.populateServices()(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  uint64_t (*v7)(uint64_t, uint64_t);

  v7 = (uint64_t (*)(uint64_t, uint64_t))(**(int **)(a2 + 24) + *(_QWORD *)(a2 + 24));
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_23B6B8F74;
  return v7(a1, a2);
}

uint64_t dispatch thunk of ActorServiceDaemon.getService<A>()(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v9;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);

  v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(**(int **)(a4 + 32) + *(_QWORD *)(a4 + 32));
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v9;
  *v9 = v4;
  v9[1] = sub_23B6C5F04;
  return v11(a1, a2, a3, a4);
}

{
  uint64_t v4;
  _QWORD *v9;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);

  v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(**(int **)(a4 + 40) + *(_QWORD *)(a4 + 40));
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v9;
  *v9 = v4;
  v9[1] = sub_23B6B528C;
  return v11(a1, a2, a3, a4);
}

uint64_t sub_23B6D3D78(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v6;

  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v6;
  *v6 = v3;
  v6[1] = sub_23B6B8F74;
  v6[4] = a2;
  v6[5] = v2;
  v6[3] = a1;
  return swift_task_switch();
}

uint64_t sub_23B6D3DE8()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v2;
  *v2 = v1;
  v2[1] = sub_23B6B77B8;
  v2[2] = v0;
  return swift_task_switch();
}

uint64_t sub_23B6D3E44()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v2;
  *v2 = v1;
  v2[1] = sub_23B6B77B8;
  v2[2] = v0;
  return swift_task_switch();
}

uint64_t sub_23B6D3EA0()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;
  uint64_t (*v4)(void);

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_23B6B77B8;
  v4 = (uint64_t (*)(void))((char *)&dword_256A473B0 + dword_256A473B0);
  v2 = (_QWORD *)swift_task_alloc();
  v1[2] = v2;
  *v2 = v1;
  v2[1] = sub_23B6B8F74;
  return v4();
}

uint64_t sub_23B6D3F1C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t (*v8)(uint64_t, uint64_t);

  v2 = *(_QWORD *)(v0 + 16);
  v3 = *(_QWORD *)(v0 + 24);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v4;
  *v4 = v1;
  v4[1] = sub_23B6B77B8;
  v5 = *(_QWORD *)(v3 + 8);
  v8 = (uint64_t (*)(uint64_t, uint64_t))(**(int **)(v5 + 72) + *(_QWORD *)(v5 + 72));
  v6 = (_QWORD *)swift_task_alloc();
  v4[2] = v6;
  *v6 = v4;
  v6[1] = sub_23B6B77B8;
  return v8(v2, v5);
}

uint64_t ActorServiceCollection.__allocating_init()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = swift_allocObject();
  swift_defaultActor_initialize();
  *(_QWORD *)(v0 + 112) = MEMORY[0x24BEE4AF8];
  v1 = MEMORY[0x24BEE4B00];
  *(_BYTE *)(v0 + 120) = 0;
  v2 = MEMORY[0x24BEE4B08];
  *(_QWORD *)(v0 + 128) = v1;
  *(_QWORD *)(v0 + 136) = v2;
  return v0;
}

uint64_t static ActorDaemon.enterSandbox(identifier:)(uint64_t a1, unint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  NSString *v11;
  void (*v12)(char *, uint64_t);
  id v13;
  void *v14;
  unsigned int v15;
  id v16;
  id v17;
  void *v18;
  int v19;
  uint64_t v20;
  NSObject *v21;
  os_log_type_t v22;
  uint8_t *v23;
  void *v24;
  void *v25;
  uint64_t result;
  uint64_t v27;
  uint64_t (*v28)(char *, uint64_t);
  uint64_t v29;
  id v30[2];

  v30[1] = *(id *)MEMORY[0x24BDAC8D0];
  v4 = sub_23B6E0608();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v27 - v9;
  v11 = NSTemporaryDirectory();
  sub_23B6E06EC();

  sub_23B6E05E4();
  swift_bridgeObjectRelease();
  sub_23B6E05FC();
  v12 = *(void (**)(char *, uint64_t))(v5 + 8);
  v12(v8, v4);
  v13 = objc_msgSend((id)objc_opt_self(), sel_defaultManager);
  v14 = (void *)sub_23B6E05F0();
  v30[0] = 0;
  v15 = objc_msgSend(v13, sel_createDirectoryAtURL_withIntermediateDirectories_attributes_error_, v14, 1, 0, v30);

  if (v15)
  {
    v16 = v30[0];
  }
  else
  {
    v17 = v30[0];
    v18 = (void *)sub_23B6E05D8();

    swift_willThrow();
  }
  sub_23B6E0704();
  v19 = _set_user_dir_suffix();
  swift_release();
  if (v19)
  {
    if (qword_254301078 != -1)
      swift_once();
    v20 = sub_23B6E0668();
    __swift_project_value_buffer(v20, (uint64_t)qword_2543013C0);
    swift_bridgeObjectRetain_n();
    v21 = sub_23B6E0650();
    v22 = sub_23B6E08C0();
    if (os_log_type_enabled(v21, v22))
    {
      v23 = (uint8_t *)swift_slowAlloc();
      v24 = (void *)swift_slowAlloc();
      v28 = (uint64_t (*)(char *, uint64_t))v12;
      v25 = v24;
      v30[0] = v24;
      *(_DWORD *)v23 = 136315138;
      swift_bridgeObjectRetain();
      v29 = sub_23B6BE8C4(a1, a2, (uint64_t *)v30);
      sub_23B6E0920();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_23B6B3000, v21, v22, "Setting user directory suffix: %s", v23, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x23B86B840](v25, -1, -1);
      MEMORY[0x23B86B840](v23, -1, -1);

      return v28(v10, v4);
    }
    else
    {
      swift_bridgeObjectRelease_n();

      return ((uint64_t (*)(char *, uint64_t))v12)(v10, v4);
    }
  }
  else
  {
    result = sub_23B6E0A04();
    __break(1u);
  }
  return result;
}

uint64_t sub_23B6D43D4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = sub_23B6E0668();
  __swift_allocate_value_buffer(v0, qword_254300FE0);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_254300FE0);
  if (qword_254301078 != -1)
    swift_once();
  v2 = __swift_project_value_buffer(v0, (uint64_t)qword_2543013C0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 - 8) + 16))(v1, v2, v0);
}

uint64_t sub_23B6D4464()
{
  uint64_t v0;

  v0 = sub_23B6E0554();
  __swift_allocate_value_buffer(v0, qword_254300FB8);
  __swift_project_value_buffer(v0, (uint64_t)qword_254300FB8);
  return sub_23B6E0548();
}

uint64_t (*sub_23B6D44BC())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t sub_23B6D44F8()
{
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName(&qword_254301328);
  swift_allocObject();
  result = sub_23B6E0B48();
  qword_254301338 = result;
  return result;
}

uint64_t ActorServiceCollection.init()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  swift_defaultActor_initialize();
  *(_QWORD *)(v0 + 112) = MEMORY[0x24BEE4AF8];
  v1 = MEMORY[0x24BEE4B00];
  *(_BYTE *)(v0 + 120) = 0;
  v2 = MEMORY[0x24BEE4B08];
  *(_QWORD *)(v0 + 128) = v1;
  *(_QWORD *)(v0 + 136) = v2;
  return v0;
}

uint64_t sub_23B6D4588(uint64_t a1)
{
  uint64_t v1;

  swift_beginAccess();
  *(_QWORD *)(v1 + 112) = a1;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_23B6D45E0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;

  v3[11] = a2;
  v3[12] = v2;
  v3[10] = a1;
  return swift_task_switch();
}

uint64_t sub_23B6D45FC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  __int128 v14;

  v1 = *(_QWORD *)(v0 + 96);
  swift_beginAccess();
  v2 = *(_QWORD *)(v1 + 112);
  v3 = *(_QWORD *)(v2 + 16);
  if (!v3)
    return (*(uint64_t (**)(_QWORD))(v0 + 8))(0);
  swift_bridgeObjectRetain_n();
  v4 = 0;
  while (1)
  {
    v14 = *(_OWORD *)(v2 + 16 * v4 + 32);
    swift_unknownObjectRetain();
    if ((sub_23B6B753C() & 1) != 0)
      break;
    swift_unknownObjectRelease();
    if (v3 == ++v4)
    {
      swift_bridgeObjectRelease_n();
      return (*(uint64_t (**)(_QWORD))(v0 + 8))(0);
    }
  }
  swift_bridgeObjectRelease_n();
  *(_OWORD *)(v0 + 40) = v14;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254300FB0);
  if ((swift_dynamicCast() & 1) == 0)
    return (*(uint64_t (**)(_QWORD))(v0 + 8))(0);
  v6 = *(_QWORD *)(v0 + 80);
  v5 = *(_QWORD *)(v0 + 88);
  *(_QWORD *)(v0 + 104) = *(_QWORD *)(v0 + 56);
  v7 = *(uint64_t (**)(uint64_t, uint64_t))(v5 + 24);
  *(_QWORD *)(v0 + 112) = v7;
  swift_unknownObjectRetain();
  v8 = v7(v6, v5);
  v10 = v9;
  *(_QWORD *)(v0 + 120) = v9;
  v11 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 128) = v11;
  *v11 = v0;
  v11[1] = sub_23B6D47AC;
  v12 = *(_QWORD *)(v0 + 96);
  v11[6] = v10;
  v11[7] = v12;
  v11[5] = v8;
  return swift_task_switch();
}

uint64_t sub_23B6D47AC()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 136) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_bridgeObjectRelease();
  return swift_task_switch();
}

uint64_t sub_23B6D4820()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 104);
  swift_unknownObjectRelease();
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v1);
}

uint64_t sub_23B6D4858()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  id v3;
  id v4;
  NSObject *v5;
  os_log_type_t v6;
  _BOOL4 v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t (*v17)(uint64_t, uint64_t);
  uint64_t v18;
  uint64_t v19;

  swift_bridgeObjectRelease();
  if (qword_254300840 != -1)
    swift_once();
  v1 = *(void **)(v0 + 136);
  v2 = sub_23B6E0668();
  __swift_project_value_buffer(v2, (uint64_t)qword_254300FE0);
  swift_unknownObjectRetain();
  v3 = v1;
  swift_unknownObjectRetain();
  v4 = v1;
  v5 = sub_23B6E0650();
  v6 = sub_23B6E08A8();
  v7 = os_log_type_enabled(v5, v6);
  v8 = *(void **)(v0 + 136);
  if (v7)
  {
    v9 = *(_QWORD *)(v0 + 80);
    v17 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 112);
    v10 = *(_QWORD *)(v0 + 88);
    v11 = swift_slowAlloc();
    v12 = (_QWORD *)swift_slowAlloc();
    v18 = swift_slowAlloc();
    v19 = v18;
    *(_DWORD *)v11 = 136446466;
    v13 = v17(v9, v10);
    *(_QWORD *)(v0 + 64) = sub_23B6BE8C4(v13, v14, &v19);
    sub_23B6E0920();
    swift_bridgeObjectRelease();
    swift_unknownObjectRelease_n();
    *(_WORD *)(v11 + 12) = 2114;
    v15 = sub_23B6E05CC();
    *(_QWORD *)(v0 + 72) = v15;
    sub_23B6E0920();
    *v12 = v15;

    _os_log_impl(&dword_23B6B3000, v5, v6, "Error during getService for %{public}s: %{public}@", (uint8_t *)v11, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2543000D0);
    swift_arrayDestroy();
    MEMORY[0x23B86B840](v12, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x23B86B840](v18, -1, -1);
    MEMORY[0x23B86B840](v11, -1, -1);

    swift_unknownObjectRelease_n();
  }
  else
  {
    swift_unknownObjectRelease_n();

    swift_unknownObjectRelease_n();
  }
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(0);
}

uint64_t sub_23B6D4B10()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 80) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23B6D4B80()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23B6D4B8C()
{
  uint64_t v0;

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23B6D4BC0()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  id v3;
  id v4;
  NSObject *v5;
  os_log_type_t v6;
  _BOOL4 v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t (*v16)(uint64_t, uint64_t);
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;

  swift_bridgeObjectRelease();
  if (qword_254300840 != -1)
    swift_once();
  v1 = *(void **)(v0 + 200);
  v2 = sub_23B6E0668();
  __swift_project_value_buffer(v2, (uint64_t)qword_254300FE0);
  swift_unknownObjectRetain();
  v3 = v1;
  swift_unknownObjectRetain();
  v4 = v1;
  v5 = sub_23B6E0650();
  v6 = sub_23B6E08A8();
  v7 = os_log_type_enabled(v5, v6);
  v8 = *(void **)(v0 + 200);
  if (v7)
  {
    v9 = *(_QWORD *)(v0 + 144);
    v16 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 176);
    v10 = *(_QWORD *)(v0 + 152);
    v11 = swift_slowAlloc();
    v17 = (_QWORD *)swift_slowAlloc();
    v18 = swift_slowAlloc();
    v19 = v18;
    *(_DWORD *)v11 = 136446466;
    v12 = v16(v9, v10);
    *(_QWORD *)(v0 + 136) = sub_23B6BE8C4(v12, v13, &v19);
    sub_23B6E0920();
    swift_bridgeObjectRelease();
    swift_unknownObjectRelease_n();
    *(_WORD *)(v11 + 12) = 2114;
    v14 = sub_23B6E05CC();
    *(_QWORD *)(v0 + 128) = v14;
    sub_23B6E0920();
    *v17 = v14;

    _os_log_impl(&dword_23B6B3000, v5, v6, "Error during getService for %{public}s: %{public}@", (uint8_t *)v11, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2543000D0);
    swift_arrayDestroy();
    MEMORY[0x23B86B840](v17, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x23B86B840](v18, -1, -1);
    MEMORY[0x23B86B840](v11, -1, -1);
  }
  else
  {
    swift_unknownObjectRelease_n();

  }
  swift_willThrow();
  swift_unknownObjectRelease_n();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23B6D4E68()
{
  _QWORD *v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 256) = v0;
  *(_QWORD *)(v1 + 264) = *v0;
  return swift_task_switch();
}

int64_t sub_23B6D4E88()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t ObjectType;
  uint64_t (*v9)(uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char isUniquelyReferenced_nonNull_native;
  _QWORD *v14;
  char v15;
  unint64_t v16;
  uint64_t v17;
  _BOOL8 v18;
  int64_t result;
  char v20;
  char v21;
  uint64_t *v22;
  uint64_t v23;
  BOOL v24;
  uint64_t v25;
  _QWORD *v26;
  uint64_t v27;
  _QWORD *v28;

  v1 = *(_QWORD *)(v0 + 256);
  swift_beginAccess();
  v2 = *(_QWORD *)(v1 + 112);
  *(_QWORD *)(v0 + 272) = v2;
  v3 = *(_QWORD *)(v2 + 16);
  if (!v3)
  {
    swift_bridgeObjectRetain();
LABEL_18:
    *(_OWORD *)(v0 + 64) = 0u;
    *(_OWORD *)(v0 + 80) = 0u;
    *(_OWORD *)(v0 + 32) = 0u;
    *(_OWORD *)(v0 + 48) = 0u;
    *(_OWORD *)(v0 + 16) = 0u;
    *(_OWORD *)(v0 + 112) = 0u;
    *(_OWORD *)(v0 + 128) = 0u;
    *(_OWORD *)(v0 + 144) = 0u;
    *(_OWORD *)(v0 + 160) = 0u;
    *(_OWORD *)(v0 + 96) = 0u;
    v26 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 280) = v26;
    *v26 = v0;
    v26[1] = sub_23B6D515C;
    return sub_23B6D798C((_OWORD *)(v0 + 16), (__int128 *)(v0 + 96));
  }
  v27 = v0;
  v4 = (_QWORD *)(*(_QWORD *)(v0 + 256) + 128);
  swift_bridgeObjectRetain_n();
  v5 = (uint64_t *)(v2 + 40);
  while (1)
  {
    v7 = *v5;
    ObjectType = swift_getObjectType();
    v9 = *(uint64_t (**)(uint64_t, uint64_t))(v7 + 24);
    swift_unknownObjectRetain();
    v10 = v9(ObjectType, v7);
    v12 = v11;
    swift_beginAccess();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v14 = (_QWORD *)*v4;
    v28 = (_QWORD *)*v4;
    *v4 = 0x8000000000000000;
    v16 = sub_23B6B5E60(v10, v12);
    v17 = v14[2];
    v18 = (v15 & 1) == 0;
    result = v17 + v18;
    if (__OFADD__(v17, v18))
      break;
    v20 = v15;
    if (v14[3] >= result)
    {
      if ((isUniquelyReferenced_nonNull_native & 1) != 0)
      {
        if ((v15 & 1) != 0)
          goto LABEL_3;
      }
      else
      {
        result = (int64_t)sub_23B6DD618(&qword_2543010C8);
        v14 = v28;
        if ((v20 & 1) != 0)
          goto LABEL_3;
      }
    }
    else
    {
      sub_23B6DBFD0(result, isUniquelyReferenced_nonNull_native, &qword_2543010C8);
      v14 = v28;
      result = sub_23B6B5E60(v10, v12);
      if ((v20 & 1) != (v21 & 1))
        return sub_23B6E0AAC();
      v16 = result;
      if ((v20 & 1) != 0)
      {
LABEL_3:
        v6 = v14[7];
        swift_bridgeObjectRelease();
        *(_QWORD *)(v6 + 8 * v16) = MEMORY[0x24BEE4AF8];
        goto LABEL_4;
      }
    }
    v14[(v16 >> 6) + 8] |= 1 << v16;
    v22 = (uint64_t *)(v14[6] + 16 * v16);
    *v22 = v10;
    v22[1] = v12;
    *(_QWORD *)(v14[7] + 8 * v16) = MEMORY[0x24BEE4AF8];
    v23 = v14[2];
    v24 = __OFADD__(v23, 1);
    v25 = v23 + 1;
    if (v24)
      goto LABEL_21;
    v14[2] = v25;
    swift_bridgeObjectRetain();
LABEL_4:
    *v4 = v14;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_endAccess();
    swift_unknownObjectRelease();
    v5 += 2;
    if (!--v3)
    {
      swift_bridgeObjectRelease();
      v0 = v27;
      goto LABEL_18;
    }
  }
  __break(1u);
LABEL_21:
  __break(1u);
  return result;
}

uint64_t sub_23B6D515C()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23B6D51B4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  __int128 v5;
  _QWORD *v6;

  v3 = *(_QWORD *)(v2 + 272);
  sub_23B6B8FBC((unint64_t *)&qword_254301320, a2, (uint64_t (*)(uint64_t))type metadata accessor for ActorServiceCollection, (uint64_t)&protocol conformance descriptor for ActorServiceCollection);
  v4 = swift_task_alloc();
  *(_QWORD *)(v2 + 288) = v4;
  v5 = *(_OWORD *)(v2 + 256);
  *(_QWORD *)(v4 + 16) = v3;
  *(_OWORD *)(v4 + 24) = v5;
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 296) = v6;
  *v6 = v2;
  v6[1] = sub_23B6D5278;
  return sub_23B6E0A40();
}

uint64_t sub_23B6D5278()
{
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23B6D52EC()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  _BOOL4 v6;
  uint64_t v7;
  uint8_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  uint64_t *v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  NSObject *v24;
  os_log_type_t v25;
  uint64_t v26;
  int64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  int64_t v35;
  uint64_t v36;

  if (qword_254300840 == -1)
    goto LABEL_2;
  while (1)
  {
    swift_once();
LABEL_2:
    v1 = (uint64_t *)(v0 + 256);
    v2 = sub_23B6E0668();
    v3 = v0;
    __swift_project_value_buffer(v2, (uint64_t)qword_254300FE0);
    swift_retain();
    v4 = sub_23B6E0650();
    v5 = sub_23B6E08C0();
    v6 = os_log_type_enabled(v4, v5);
    v7 = *(_QWORD *)(v3 + 256);
    v32 = v3;
    if (v6)
    {
      v8 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)v8 = 134217984;
      *(_QWORD *)(v3 + 248) = *(_QWORD *)(*(_QWORD *)(v7 + 112) + 16);
      sub_23B6E0920();
      swift_release();
      _os_log_impl(&dword_23B6B3000, v4, v5, "%ld services started.", v8, 0xCu);
      MEMORY[0x23B86B840](v8, -1, -1);
    }
    else
    {
      swift_release();
    }

    v0 = *v1;
    *(_BYTE *)(*v1 + 120) = 1;
    swift_beginAccess();
    v9 = *(_QWORD *)(v0 + 136);
    if (!*(_QWORD *)(v9 + 16))
      return (*(uint64_t (**)(void))(v32 + 8))();
    v34 = v9 + 56;
    v10 = -1;
    v11 = -1 << *(_BYTE *)(v9 + 32);
    if (-v11 < 64)
      v10 = ~(-1 << -(char)v11);
    v12 = v10 & *(_QWORD *)(v9 + 56);
    v35 = (unint64_t)(63 - v11) >> 6;
    swift_bridgeObjectRetain();
    v13 = 0;
    v33 = v9;
    while (v12)
    {
      while (1)
      {
        v14 = __clz(__rbit64(v12));
        v12 &= v12 - 1;
        v15 = v14 | (v13 << 6);
LABEL_26:
        v19 = (uint64_t *)(*(_QWORD *)(v9 + 48) + 32 * v15);
        v20 = *v19;
        v21 = v19[1];
        v23 = v19[2];
        v22 = v19[3];
        swift_bridgeObjectRetain_n();
        swift_bridgeObjectRetain_n();
        v24 = sub_23B6E0650();
        v25 = sub_23B6E08C0();
        v0 = v25;
        if (os_log_type_enabled(v24, v25))
          break;
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease_n();

        if (!v12)
          goto LABEL_12;
      }
      v26 = swift_slowAlloc();
      v27 = v13;
      v28 = swift_slowAlloc();
      v36 = v28;
      *(_DWORD *)v26 = 136446466;
      swift_bridgeObjectRetain();
      *(_QWORD *)(v26 + 4) = sub_23B6BE8C4(v20, v21, &v36);
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v26 + 12) = 2082;
      swift_bridgeObjectRetain();
      *(_QWORD *)(v26 + 14) = sub_23B6BE8C4(v23, v22, &v36);
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_23B6B3000, v24, (os_log_type_t)v0, "Startup dependency: %{public}s -> %{public}s", (uint8_t *)v26, 0x16u);
      swift_arrayDestroy();
      v29 = v28;
      v13 = v27;
      MEMORY[0x23B86B840](v29, -1, -1);
      v30 = v26;
      v9 = v33;
      MEMORY[0x23B86B840](v30, -1, -1);

    }
LABEL_12:
    v16 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
      __break(1u);
    }
    else
    {
      if (v16 >= v35)
        goto LABEL_29;
      v17 = *(_QWORD *)(v34 + 8 * v16);
      ++v13;
      if (v17)
        goto LABEL_25;
      v13 = v16 + 1;
      if (v16 + 1 >= v35)
        goto LABEL_29;
      v17 = *(_QWORD *)(v34 + 8 * v13);
      if (v17)
        goto LABEL_25;
      v13 = v16 + 2;
      if (v16 + 2 >= v35)
        goto LABEL_29;
      v17 = *(_QWORD *)(v34 + 8 * v13);
      if (v17)
        goto LABEL_25;
      v18 = v16 + 3;
      if (v18 >= v35)
      {
LABEL_29:
        swift_release();
        return (*(uint64_t (**)(void))(v32 + 8))();
      }
      v17 = *(_QWORD *)(v34 + 8 * v18);
      if (v17)
      {
        v13 = v18;
LABEL_25:
        v12 = (v17 - 1) & v17;
        v15 = __clz(__rbit64(v17)) + (v13 << 6);
        goto LABEL_26;
      }
      while (1)
      {
        v13 = v18 + 1;
        if (__OFADD__(v18, 1))
          break;
        if (v13 >= v35)
          goto LABEL_29;
        v17 = *(_QWORD *)(v34 + 8 * v13);
        ++v18;
        if (v17)
          goto LABEL_25;
      }
    }
    __break(1u);
  }
}

uint64_t sub_23B6D5734(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;

  v5[11] = a4;
  v5[12] = a5;
  v5[9] = a2;
  v5[10] = a3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254301350);
  v5[13] = swift_task_alloc();
  v5[14] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23B6D57A8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  __int128 *v3;
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
  uint64_t v15;
  uint64_t v17;
  void (*v18)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;

  v1 = *(_QWORD *)(v0 + 80);
  v2 = *(_QWORD *)(v1 + 16);
  if (v2)
  {
    v3 = (__int128 *)(v1 + 32);
    v4 = sub_23B6E07DC();
    v5 = *(_QWORD *)(v4 - 8);
    v18 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v5 + 56);
    swift_bridgeObjectRetain();
    v17 = v4;
    v19 = v5;
    do
    {
      v20 = v2;
      v8 = *(_QWORD *)(v0 + 104);
      v7 = *(_QWORD *)(v0 + 112);
      v21 = *v3;
      v22 = *(_OWORD *)(v0 + 88);
      v18(v7, 1, 1, v4);
      v9 = swift_allocObject();
      *(_QWORD *)(v9 + 16) = 0;
      *(_QWORD *)(v9 + 24) = 0;
      *(_OWORD *)(v9 + 32) = v21;
      *(_OWORD *)(v9 + 48) = v22;
      sub_23B6BF618(v7, v8, &qword_254301350);
      LODWORD(v8) = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(v8, 1, v4);
      swift_unknownObjectRetain_n();
      swift_retain();
      v10 = *(_QWORD *)(v0 + 104);
      if ((_DWORD)v8 == 1)
      {
        sub_23B6B772C(*(_QWORD *)(v0 + 104), &qword_254301350);
      }
      else
      {
        sub_23B6E07D0();
        (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v10, v4);
      }
      if (*(_QWORD *)(v9 + 16))
      {
        swift_getObjectType();
        swift_unknownObjectRetain();
        v11 = sub_23B6E07AC();
        v13 = v12;
        swift_unknownObjectRelease();
      }
      else
      {
        v11 = 0;
        v13 = 0;
      }
      v14 = **(_QWORD **)(v0 + 72);
      v15 = v13 | v11;
      if (v13 | v11)
      {
        v15 = v0 + 16;
        *(_QWORD *)(v0 + 16) = 0;
        *(_QWORD *)(v0 + 24) = 0;
        *(_QWORD *)(v0 + 32) = v11;
        *(_QWORD *)(v0 + 40) = v13;
      }
      v6 = *(_QWORD *)(v0 + 112);
      *(_QWORD *)(v0 + 48) = 1;
      *(_QWORD *)(v0 + 56) = v15;
      *(_QWORD *)(v0 + 64) = v14;
      swift_task_create();
      swift_unknownObjectRelease();
      swift_release();
      sub_23B6B772C(v6, &qword_254301350);
      ++v3;
      --v2;
      v5 = v19;
      v4 = v17;
    }
    while (v20 != 1);
    swift_bridgeObjectRelease();
  }
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23B6D5A28(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;

  v6[6] = a5;
  v6[7] = a6;
  v6[4] = a1;
  v6[5] = a4;
  return swift_task_switch();
}

uint64_t sub_23B6D5A44()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  _QWORD *v5;

  if (qword_254301330 != -1)
    swift_once();
  v2 = v0[6];
  v1 = v0[7];
  v3 = v0[5];
  v0[2] = v3;
  v0[3] = v2;
  v4 = (_QWORD *)swift_task_alloc();
  v0[8] = v4;
  v4[2] = v1;
  v4[3] = v3;
  v4[4] = v2;
  swift_unknownObjectRetain();
  v5 = (_QWORD *)swift_task_alloc();
  v0[9] = v5;
  *v5 = v0;
  v5[1] = sub_23B6D5B50;
  return sub_23B6E0B60();
}

uint64_t sub_23B6D5B50()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 80) = v0;
  swift_task_dealloc();
  swift_unknownObjectRelease();
  swift_task_dealloc();
  if (v0)
    return swift_task_switch();
  else
    return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_23B6D5BD8()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23B6D5BE4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v7;

  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v7;
  *v7 = v4;
  v7[1] = sub_23B6B77B8;
  return sub_23B6D5C48(a3, a4);
}

uint64_t sub_23B6D5C48(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3[20] = a2;
  v3[21] = v2;
  v3[19] = a1;
  v3[22] = *v2;
  v4 = sub_23B6E0B3C();
  v3[23] = v4;
  v3[24] = *(_QWORD *)(v4 - 8);
  v3[25] = swift_task_alloc();
  v5 = sub_23B6E09C8();
  v3[26] = v5;
  v3[27] = *(_QWORD *)(v5 - 8);
  v3[28] = swift_task_alloc();
  v3[29] = swift_task_alloc();
  v3[30] = swift_task_alloc();
  v3[31] = swift_task_alloc();
  v3[32] = swift_task_alloc();
  v3[33] = swift_task_alloc();
  v3[34] = swift_task_alloc();
  v3[35] = swift_task_alloc();
  v3[36] = swift_task_alloc();
  v3[37] = swift_task_alloc();
  v6 = sub_23B6E09E0();
  v3[38] = v6;
  v3[39] = *(_QWORD *)(v6 - 8);
  v3[40] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254301350);
  v3[41] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23B6D5D98()
{
  uint64_t v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint64_t v4;
  uint8_t *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  __int128 v19;
  uint64_t v20;

  if (qword_254300840 != -1)
    swift_once();
  v1 = sub_23B6E0668();
  *(_QWORD *)(v0 + 336) = __swift_project_value_buffer(v1, (uint64_t)qword_254300FE0);
  swift_unknownObjectRetain_n();
  v2 = sub_23B6E0650();
  v3 = sub_23B6E08C0();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = *(_QWORD *)(v0 + 152);
    v5 = (uint8_t *)swift_slowAlloc();
    v6 = swift_slowAlloc();
    v20 = v6;
    *(_DWORD *)v5 = 136446210;
    swift_getObjectType();
    *(_QWORD *)(v0 + 136) = v4;
    v7 = sub_23B6E0A64();
    *(_QWORD *)(v0 + 144) = sub_23B6BE8C4(v7, v8, &v20);
    sub_23B6E0920();
    swift_unknownObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23B6B3000, v2, v3, "Starting service: %{public}s", v5, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B86B840](v6, -1, -1);
    MEMORY[0x23B86B840](v5, -1, -1);

  }
  else
  {

    swift_unknownObjectRelease_n();
  }
  v9 = *(_QWORD *)(v0 + 328);
  v10 = *(_QWORD *)(v0 + 152);
  v11 = *(_QWORD *)(v0 + 160);
  v12 = sub_23B6E07DC();
  v19 = *(_OWORD *)(v0 + 168);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v14 = sub_23B6B8FBC((unint64_t *)&qword_254301320, v13, (uint64_t (*)(uint64_t))type metadata accessor for ActorServiceCollection, (uint64_t)&protocol conformance descriptor for ActorServiceCollection);
  v15 = swift_allocObject();
  *(_QWORD *)(v15 + 16) = v19;
  *(_QWORD *)(v15 + 24) = v14;
  *(_OWORD *)(v15 + 32) = xmmword_23B6E1EF0;
  *(_QWORD *)(v15 + 48) = v10;
  *(_QWORD *)(v15 + 56) = v11;
  *(_OWORD *)(v15 + 64) = v19;
  swift_retain_n();
  swift_unknownObjectRetain();
  *(_QWORD *)(v0 + 344) = sub_23B6C71B0(v9, (uint64_t)&unk_256A47480, v15);
  sub_23B6E09D4();
  sub_23B6E09BC();
  v16 = swift_allocObject();
  *(_QWORD *)(v0 + 352) = v16;
  *(_QWORD *)(v16 + 16) = v10;
  *(_QWORD *)(v16 + 24) = v11;
  swift_unknownObjectRetain();
  v17 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 360) = v17;
  *v17 = v0;
  v17[1] = sub_23B6D60B4;
  return sub_23B6E0518();
}

uint64_t sub_23B6D60B4()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 368) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_release();
  return swift_task_switch();
}

uint64_t sub_23B6D6128()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t ObjectType;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v16;
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
  unint64_t v38;
  uint64_t v39;
  unint64_t v40;
  unint64_t v41;
  void (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t, uint64_t);
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void (*v50)(uint64_t, uint64_t, uint64_t);
  NSObject *v51;
  os_log_type_t v52;
  _BOOL4 v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  unint64_t v62;
  uint64_t v63;
  unint64_t v64;
  unint64_t v65;
  void (*v66)(uint64_t, uint64_t);
  void (*v67)(uint64_t, uint64_t);
  uint64_t v69;
  uint64_t v70;
  os_log_t log;
  NSObject *loga;
  uint64_t v73;
  uint64_t v74;
  os_log_type_t v75[8];
  os_log_type_t v76;
  uint64_t v77;
  os_log_type_t type;
  os_log_type_t typea[8];
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  _QWORD *v89;
  uint64_t (*v90)(uint64_t, uint64_t);
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;

  v1 = v0[21];
  __swift_instantiateConcreteTypeFromMangledName(&qword_2543010F0);
  sub_23B6E0824();
  swift_beginAccess();
  v2 = *(_QWORD *)(v1 + 112);
  v3 = *(_QWORD *)(v2 + 16);
  if (v3)
  {
    v4 = v0[20];
    ObjectType = swift_getObjectType();
    v90 = *(uint64_t (**)(uint64_t, uint64_t))(v4 + 24);
    swift_bridgeObjectRetain();
    v6 = (uint64_t *)(v2 + 40);
    v89 = v0;
    while (1)
    {
      v93 = v0[20];
      v7 = *v6;
      v8 = swift_getObjectType();
      v9 = ObjectType;
      v10 = *(uint64_t (**)(uint64_t, uint64_t))(v7 + 24);
      swift_unknownObjectRetain();
      v11 = v10(v8, v7);
      ObjectType = v9;
      v13 = v12;
      if (v11 == v90(v9, v93) && v13 == v14)
        break;
      v16 = sub_23B6E0A88();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_unknownObjectRelease();
      if ((v16 & 1) != 0)
        goto LABEL_14;
      v6 += 2;
      --v3;
      v0 = v89;
      if (!v3)
      {
        swift_bridgeObjectRelease();
        goto LABEL_10;
      }
    }
    swift_bridgeObjectRelease_n();
    swift_unknownObjectRelease();
LABEL_14:
    swift_bridgeObjectRelease();
    v0 = v89;
    v45 = v89[36];
    v81 = v89[35];
    v83 = v89[37];
    v87 = v89[34];
    v46 = v89[26];
    v47 = v89[27];
    v48 = v90(ObjectType, v89[20]);
    sub_23B6DAD58(v48, v49);
    swift_bridgeObjectRelease();
    sub_23B6E09BC();
    v50 = *(void (**)(uint64_t, uint64_t, uint64_t))(v47 + 16);
    v50(v81, v83, v46);
    v50(v87, v45, v46);
    swift_unknownObjectRetain_n();
    v51 = sub_23B6E0650();
    v52 = sub_23B6E08C0();
    v53 = os_log_type_enabled(v51, v52);
    v54 = v89[39];
    v27 = v89[40];
    v29 = v89[38];
    v55 = v89[35];
    v92 = v89[36];
    v95 = v89[37];
    v88 = v89[34];
    v57 = v89[26];
    v56 = v89[27];
    if (v53)
    {
      v82 = v89[38];
      v84 = v89[40];
      v58 = v89[25];
      v69 = v89[24];
      v70 = v89[23];
      v76 = v52;
      v59 = v89[19];
      loga = v51;
      v60 = swift_slowAlloc();
      v74 = swift_slowAlloc();
      v96 = v74;
      *(_DWORD *)v60 = 136446466;
      *(_QWORD *)typea = v54;
      v89[14] = v59;
      v61 = sub_23B6E0A64();
      v89[15] = sub_23B6BE8C4(v61, v62, &v96);
      sub_23B6E0920();
      swift_bridgeObjectRelease();
      swift_unknownObjectRelease_n();
      *(_WORD *)(v60 + 12) = 2082;
      sub_23B6E0B30();
      sub_23B6B8FBC(&qword_2543010B8, 255, (uint64_t (*)(uint64_t))MEMORY[0x24BEE6DC8], MEMORY[0x24BEE6E00]);
      v63 = sub_23B6E0B24();
      v65 = v64;
      (*(void (**)(uint64_t, uint64_t))(v69 + 8))(v58, v70);
      v89[16] = sub_23B6BE8C4(v63, v65, &v96);
      sub_23B6E0920();
      swift_bridgeObjectRelease();
      v66 = *(void (**)(uint64_t, uint64_t))(v56 + 8);
      v66(v55, v57);
      v66(v88, v57);
      _os_log_impl(&dword_23B6B3000, loga, v76, "Service startup complete: %{public}s duration: %{public}s", (uint8_t *)v60, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x23B86B840](v74, -1, -1);
      MEMORY[0x23B86B840](v60, -1, -1);
      swift_release();

      v66(v92, v57);
      v66(v95, v57);
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)typea + 8))(v84, v82);
      goto LABEL_18;
    }
    swift_release();

    v67 = *(void (**)(uint64_t, uint64_t))(v56 + 8);
    v67(v55, v57);
    v67(v88, v57);
    swift_unknownObjectRelease_n();
    v67(v92, v57);
    v67(v95, v57);
    v44 = *(void (**)(uint64_t, uint64_t))(v54 + 8);
LABEL_17:
    v44(v27, v29);
    goto LABEL_18;
  }
LABEL_10:
  v17 = v0[37];
  v19 = v0[32];
  v18 = v0[33];
  v20 = v0[31];
  v21 = v0[26];
  v22 = v0[27];
  sub_23B6E09BC();
  v23 = *(void (**)(uint64_t, uint64_t, uint64_t))(v22 + 16);
  v23(v19, v17, v21);
  v23(v20, v18, v21);
  swift_unknownObjectRetain_n();
  v24 = sub_23B6E0650();
  v25 = sub_23B6E08A8();
  v26 = os_log_type_enabled(v24, v25);
  v28 = v0[39];
  v27 = v0[40];
  v30 = v0[37];
  v29 = v0[38];
  v31 = v0[32];
  v91 = v0[31];
  v94 = v0[33];
  v33 = v0[26];
  v32 = v0[27];
  if (!v26)
  {
    swift_release();

    v43 = *(void (**)(uint64_t, uint64_t))(v32 + 8);
    v43(v31, v33);
    v43(v91, v33);
    swift_unknownObjectRelease_n();
    v43(v94, v33);
    v43(v30, v33);
    v44 = *(void (**)(uint64_t, uint64_t))(v28 + 8);
    goto LABEL_17;
  }
  type = v25;
  *(_QWORD *)v75 = v0[27];
  v34 = v0[25];
  log = (os_log_t)v0[24];
  v73 = v0[23];
  v86 = v0[39];
  v35 = v0[19];
  v85 = v0[38];
  v36 = swift_slowAlloc();
  v77 = swift_slowAlloc();
  v96 = v77;
  *(_DWORD *)v36 = 136446466;
  v80 = v30;
  swift_getObjectType();
  v0[11] = v35;
  v37 = sub_23B6E0A64();
  v0[12] = sub_23B6BE8C4(v37, v38, &v96);
  sub_23B6E0920();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease_n();
  *(_WORD *)(v36 + 12) = 2082;
  sub_23B6E0B30();
  sub_23B6B8FBC(&qword_2543010B8, 255, (uint64_t (*)(uint64_t))MEMORY[0x24BEE6DC8], MEMORY[0x24BEE6E00]);
  v39 = sub_23B6E0B24();
  v41 = v40;
  ((void (*)(uint64_t, uint64_t))log[1].isa)(v34, v73);
  v0[13] = sub_23B6BE8C4(v39, v41, &v96);
  sub_23B6E0920();
  swift_bridgeObjectRelease();
  v42 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)v75 + 8);
  v42(v31, v33);
  v42(v91, v33);
  _os_log_impl(&dword_23B6B3000, v24, type, "Service startup FAILED: %{public}s duration: %{public}s", (uint8_t *)v36, 0x16u);
  swift_arrayDestroy();
  MEMORY[0x23B86B840](v77, -1, -1);
  MEMORY[0x23B86B840](v36, -1, -1);
  swift_release();

  v42(v94, v33);
  v42(v80, v33);
  (*(void (**)(uint64_t, uint64_t))(v86 + 8))(v27, v85);
LABEL_18:
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
  return ((uint64_t (*)(void))v0[1])();
}

uint64_t sub_23B6D6984()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
  int64_t v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t ObjectType;
  uint64_t (*v12)(uint64_t, uint64_t);
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, os_log_t, uint64_t);
  id v16;
  id v17;
  NSObject *v18;
  os_log_type_t v19;
  _BOOL4 v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  void (*v35)(uint64_t, uint64_t);
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
  uint64_t v46;
  uint64_t v47;
  os_log_type_t type[8];
  os_log_type_t typea;
  os_log_t log;
  uint64_t v51;
  uint64_t v52;
  _QWORD *v53;
  uint64_t v54[2];

  v1 = *(_QWORD *)(v0 + 160);
  v2 = *(_QWORD *)(v0 + 168);
  v3 = *(_QWORD *)(v0 + 152);
  swift_release();
  swift_beginAccess();
  swift_unknownObjectRetain();
  v4 = sub_23B6DFA1C(v2 + 112, v3, v1);
  result = swift_unknownObjectRelease();
  v6 = *(_QWORD *)(*(_QWORD *)(v2 + 112) + 16);
  if (v6 < v4)
  {
    __break(1u);
  }
  else
  {
    v7 = *(void **)(v0 + 368);
    log = *(os_log_t *)(v0 + 296);
    v8 = *(NSObject **)(v0 + 240);
    *(_QWORD *)type = *(_QWORD *)(v0 + 232);
    v51 = *(_QWORD *)(v0 + 224);
    v9 = *(_QWORD *)(v0 + 208);
    v10 = *(_QWORD *)(v0 + 160);
    v45 = *(_QWORD *)(v0 + 216);
    sub_23B6DFD1C(v4, v6);
    swift_endAccess();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2543010F0);
    sub_23B6E0824();
    ObjectType = swift_getObjectType();
    v12 = *(uint64_t (**)(uint64_t, uint64_t))(v10 + 24);
    v13 = v12(ObjectType, v10);
    sub_23B6DAB24(v13, v14, v7);
    swift_bridgeObjectRelease();
    sub_23B6E09BC();
    v15 = *(void (**)(uint64_t, os_log_t, uint64_t))(v45 + 16);
    v15(*(_QWORD *)type, log, v9);
    v15(v51, v8, v9);
    swift_unknownObjectRetain();
    v16 = v7;
    swift_unknownObjectRetain();
    v17 = v7;
    v18 = sub_23B6E0650();
    v19 = sub_23B6E08A8();
    v20 = os_log_type_enabled(v18, v19);
    v21 = *(void **)(v0 + 368);
    v22 = *(_QWORD *)(v0 + 224);
    v23 = *(_QWORD *)(v0 + 232);
    v24 = *(_QWORD *)(v0 + 208);
    v25 = *(_QWORD *)(v0 + 216);
    if (v20)
    {
      v43 = *(_QWORD *)(v0 + 232);
      v26 = *(_QWORD *)(v0 + 200);
      v44 = *(_QWORD *)(v0 + 192);
      v46 = *(_QWORD *)(v0 + 184);
      v47 = *(_QWORD *)(v0 + 216);
      v27 = *(_QWORD *)(v0 + 160);
      typea = v19;
      v28 = swift_slowAlloc();
      v53 = (_QWORD *)swift_slowAlloc();
      v52 = swift_slowAlloc();
      v54[0] = v52;
      *(_DWORD *)v28 = 136446722;
      v42 = v22;
      v29 = v12(ObjectType, v27);
      *(_QWORD *)(v0 + 80) = sub_23B6BE8C4(v29, v30, v54);
      sub_23B6E0920();
      swift_bridgeObjectRelease();
      swift_unknownObjectRelease_n();
      *(_WORD *)(v28 + 12) = 2114;
      v31 = sub_23B6E05CC();
      *(_QWORD *)(v0 + 64) = v31;
      sub_23B6E0920();
      *v53 = v31;

      *(_WORD *)(v28 + 22) = 2082;
      sub_23B6E0B30();
      sub_23B6B8FBC(&qword_2543010B8, 255, (uint64_t (*)(uint64_t))MEMORY[0x24BEE6DC8], MEMORY[0x24BEE6E00]);
      v32 = sub_23B6E0B24();
      v34 = v33;
      (*(void (**)(uint64_t, uint64_t))(v44 + 8))(v26, v46);
      *(_QWORD *)(v0 + 72) = sub_23B6BE8C4(v32, v34, v54);
      sub_23B6E0920();
      swift_bridgeObjectRelease();
      v35 = *(void (**)(uint64_t, uint64_t))(v47 + 8);
      v35(v43, v24);
      v35(v42, v24);
      _os_log_impl(&dword_23B6B3000, v18, typea, "Error starting service: %{public}s, error: %{public}@ duration: %{public}s", (uint8_t *)v28, 0x20u);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2543000D0);
      swift_arrayDestroy();
      MEMORY[0x23B86B840](v53, -1, -1);
      swift_arrayDestroy();
      MEMORY[0x23B86B840](v52, -1, -1);
      MEMORY[0x23B86B840](v28, -1, -1);
    }
    else
    {
      swift_unknownObjectRelease_n();

      v35 = *(void (**)(uint64_t, uint64_t))(v25 + 8);
      v35(v23, v24);
      v35(v22, v24);
    }

    v36 = *(_QWORD *)(v0 + 320);
    v37 = *(_QWORD *)(v0 + 304);
    v38 = *(_QWORD *)(v0 + 312);
    v39 = *(_QWORD *)(v0 + 296);
    v40 = *(_QWORD *)(v0 + 240);
    v41 = *(_QWORD *)(v0 + 208);
    swift_willThrow();
    swift_release();
    v35(v40, v41);
    v35(v39, v41);
    (*(void (**)(uint64_t, uint64_t))(v38 + 8))(v36, v37);
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
  return result;
}

uint64_t sub_23B6D6ED8()
{
  _QWORD *v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = v0;
  *(_QWORD *)(v1 + 24) = *v0;
  return swift_task_switch();
}

uint64_t sub_23B6D6EF8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  sub_23B6B8FBC((unint64_t *)&qword_254301320, a2, (uint64_t (*)(uint64_t))type metadata accessor for ActorServiceCollection, (uint64_t)&protocol conformance descriptor for ActorServiceCollection);
  v3 = swift_task_alloc();
  *(_QWORD *)(v2 + 32) = v3;
  *(_OWORD *)(v3 + 16) = *(_OWORD *)(v2 + 16);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 40) = v4;
  *v4 = v2;
  v4[1] = sub_23B6D6FB4;
  return sub_23B6E09B0();
}

uint64_t sub_23B6D6FB4()
{
  swift_task_dealloc();
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23B6D7014(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;

  v4[13] = a3;
  v4[14] = a4;
  v4[12] = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254301350);
  v4[15] = swift_task_alloc();
  v4[16] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23B6D7088()
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
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v19;
  void (*v20)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  __int128 v24;

  v1 = *(_QWORD *)(v0 + 104);
  swift_beginAccess();
  v2 = *(_QWORD *)(v1 + 112);
  v23 = *(_QWORD *)(v2 + 16);
  if (v23)
  {
    v3 = sub_23B6E07DC();
    v21 = *(_QWORD *)(v3 - 8);
    v20 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v21 + 56);
    swift_bridgeObjectRetain();
    v4 = 0;
    v19 = v2;
    v22 = v3;
    while (1)
    {
      v7 = *(_QWORD *)(v0 + 120);
      v6 = *(_QWORD *)(v0 + 128);
      v8 = *(_QWORD *)(v0 + 112);
      v24 = *(_OWORD *)(v2 + 16 * v4 + 32);
      v20(v6, 1, 1, v3);
      v9 = swift_allocObject();
      *(_QWORD *)(v9 + 16) = 0;
      v10 = (_QWORD *)(v9 + 16);
      *(_QWORD *)(v9 + 24) = 0;
      *(_OWORD *)(v9 + 32) = v24;
      *(_QWORD *)(v9 + 48) = v8;
      sub_23B6BF618(v6, v7, &qword_254301350);
      LODWORD(v7) = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v21 + 48))(v7, 1, v3);
      swift_unknownObjectRetain_n();
      v11 = *(_QWORD *)(v0 + 120);
      if ((_DWORD)v7 == 1)
      {
        sub_23B6B772C(*(_QWORD *)(v0 + 120), &qword_254301350);
        if (!*v10)
          goto LABEL_8;
      }
      else
      {
        sub_23B6E07D0();
        (*(void (**)(uint64_t, uint64_t))(v21 + 8))(v11, v3);
        if (!*v10)
        {
LABEL_8:
          v12 = 0;
          v14 = 0;
          goto LABEL_9;
        }
      }
      swift_getObjectType();
      swift_unknownObjectRetain();
      v12 = sub_23B6E07AC();
      v14 = v13;
      swift_unknownObjectRelease();
LABEL_9:
      v15 = **(_QWORD **)(v0 + 96);
      v16 = swift_allocObject();
      *(_QWORD *)(v16 + 16) = &unk_256A474C8;
      *(_QWORD *)(v16 + 24) = v9;
      v17 = v14 | v12;
      if (v14 | v12)
      {
        v17 = v0 + 16;
        *(_QWORD *)(v0 + 16) = 0;
        *(_QWORD *)(v0 + 24) = 0;
        *(_QWORD *)(v0 + 32) = v12;
        *(_QWORD *)(v0 + 40) = v14;
      }
      v2 = v19;
      ++v4;
      v5 = *(_QWORD *)(v0 + 128);
      *(_QWORD *)(v0 + 72) = 1;
      *(_QWORD *)(v0 + 80) = v17;
      *(_QWORD *)(v0 + 88) = v15;
      swift_task_create();
      swift_unknownObjectRelease();
      swift_release();
      sub_23B6B772C(v5, &qword_254301350);
      v3 = v22;
      if (v23 == v4)
      {
        swift_bridgeObjectRelease();
        break;
      }
    }
  }
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23B6D7338(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;

  *(_QWORD *)(v5 + 64) = a4;
  *(_QWORD *)(v5 + 72) = a5;
  return swift_task_switch();
}

uint64_t sub_23B6D7350()
{
  _QWORD *v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint64_t v4;
  uint8_t *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t ObjectType;
  _QWORD *v11;
  uint64_t (*v13)(uint64_t, _QWORD);
  uint64_t v14;

  if (qword_254300840 != -1)
    swift_once();
  v1 = sub_23B6E0668();
  v0[10] = __swift_project_value_buffer(v1, (uint64_t)qword_254300FE0);
  swift_unknownObjectRetain_n();
  v2 = sub_23B6E0650();
  v3 = sub_23B6E08C0();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = v0[8];
    v5 = (uint8_t *)swift_slowAlloc();
    v6 = swift_slowAlloc();
    v14 = v6;
    *(_DWORD *)v5 = 136446210;
    swift_getObjectType();
    v0[6] = v4;
    v7 = sub_23B6E0A64();
    v0[7] = sub_23B6BE8C4(v7, v8, &v14);
    sub_23B6E0920();
    swift_bridgeObjectRelease();
    swift_unknownObjectRelease_n();
    _os_log_impl(&dword_23B6B3000, v2, v3, "Running service: %{public}s", v5, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B86B840](v6, -1, -1);
    MEMORY[0x23B86B840](v5, -1, -1);
  }
  else
  {
    swift_unknownObjectRelease_n();
  }

  v9 = v0[9];
  ObjectType = swift_getObjectType();
  v0[11] = ObjectType;
  v13 = (uint64_t (*)(uint64_t, _QWORD))(**(int **)(v9 + 64) + *(_QWORD *)(v9 + 64));
  v11 = (_QWORD *)swift_task_alloc();
  v0[12] = v11;
  *v11 = v0;
  v11[1] = sub_23B6D7564;
  return v13(ObjectType, v0[9]);
}

uint64_t sub_23B6D7564()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 104) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23B6D75C8()
{
  uint64_t v0;
  NSObject *v1;
  os_log_type_t v2;
  uint64_t v3;
  uint8_t *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v9;

  swift_unknownObjectRetain_n();
  v1 = sub_23B6E0650();
  v2 = sub_23B6E08C0();
  if (os_log_type_enabled(v1, v2))
  {
    v3 = *(_QWORD *)(v0 + 64);
    v4 = (uint8_t *)swift_slowAlloc();
    v5 = swift_slowAlloc();
    *(_DWORD *)v4 = 136446210;
    v9 = v5;
    *(_QWORD *)(v0 + 32) = v3;
    v6 = sub_23B6E0A64();
    *(_QWORD *)(v0 + 40) = sub_23B6BE8C4(v6, v7, &v9);
    sub_23B6E0920();
    swift_bridgeObjectRelease();
    swift_unknownObjectRelease_n();
    _os_log_impl(&dword_23B6B3000, v1, v2, "Done running service: %{public}s", v4, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B86B840](v5, -1, -1);
    MEMORY[0x23B86B840](v4, -1, -1);
  }
  else
  {
    swift_unknownObjectRelease_n();
  }

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23B6D7748()
{
  uint64_t v0;
  void *v1;
  id v2;
  id v3;
  NSObject *v4;
  os_log_type_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  void *v13;
  void *v15;
  uint64_t v16;
  uint64_t v17;

  v1 = *(void **)(v0 + 104);
  swift_unknownObjectRetain();
  v2 = v1;
  swift_unknownObjectRetain();
  v3 = v1;
  v4 = sub_23B6E0650();
  v5 = sub_23B6E08A8();
  if (os_log_type_enabled(v4, v5))
  {
    v15 = *(void **)(v0 + 104);
    v6 = *(_QWORD *)(v0 + 88);
    v7 = *(_QWORD *)(v0 + 72);
    v8 = swift_slowAlloc();
    v9 = (_QWORD *)swift_slowAlloc();
    v16 = swift_slowAlloc();
    v17 = v16;
    *(_DWORD *)v8 = 136446466;
    v10 = (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 24))(v6, v7);
    *(_QWORD *)(v0 + 16) = sub_23B6BE8C4(v10, v11, &v17);
    sub_23B6E0920();
    swift_bridgeObjectRelease();
    swift_unknownObjectRelease_n();
    *(_WORD *)(v8 + 12) = 2114;
    v12 = sub_23B6E05CC();
    *(_QWORD *)(v0 + 24) = v12;
    sub_23B6E0920();
    *v9 = v12;

    _os_log_impl(&dword_23B6B3000, v4, v5, "Uncaught error running service: %{public}s, error: %{public}@", (uint8_t *)v8, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2543000D0);
    swift_arrayDestroy();
    MEMORY[0x23B86B840](v9, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x23B86B840](v16, -1, -1);
    MEMORY[0x23B86B840](v8, -1, -1);

  }
  else
  {
    v13 = *(void **)(v0 + 104);

    swift_unknownObjectRelease_n();
  }
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23B6D798C(_OWORD *a1, __int128 *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;

  *(_QWORD *)(v3 + 296) = v2;
  v6 = sub_23B6E0644();
  *(_QWORD *)(v3 + 304) = v6;
  *(_QWORD *)(v3 + 312) = *(_QWORD *)(v6 - 8);
  *(_QWORD *)(v3 + 320) = swift_task_alloc();
  *(_QWORD *)(v3 + 328) = swift_task_alloc();
  *(_QWORD *)(v3 + 336) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254300F70);
  *(_QWORD *)(v3 + 344) = swift_task_alloc();
  *(_QWORD *)(v3 + 352) = swift_task_alloc();
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_254300F68);
  *(_QWORD *)(v3 + 360) = v7;
  *(_QWORD *)(v3 + 368) = *(_QWORD *)(v7 - 8);
  *(_QWORD *)(v3 + 376) = swift_task_alloc();
  v8 = a1[1];
  *(_OWORD *)(v3 + 384) = *a1;
  *(_OWORD *)(v3 + 400) = v8;
  v9 = a1[3];
  *(_OWORD *)(v3 + 416) = a1[2];
  *(_OWORD *)(v3 + 432) = v9;
  v10 = *a2;
  v11 = a2[1];
  *(_OWORD *)(v3 + 448) = a1[4];
  *(_OWORD *)(v3 + 464) = v10;
  v12 = a2[2];
  v13 = a2[3];
  *(_OWORD *)(v3 + 480) = v11;
  *(_OWORD *)(v3 + 496) = v12;
  v14 = a2[4];
  *(_OWORD *)(v3 + 512) = v13;
  *(_OWORD *)(v3 + 528) = v14;
  return swift_task_switch();
}

uint64_t sub_23B6D7AA4()
{
  uint64_t v0;
  void *object;
  uint64_t v2;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;
  Swift::Int v8;
  Swift::Int v9;
  Swift::Int v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  Swift::Int v15;
  uint64_t v16;
  Swift::Int v17;
  uint64_t v18;
  void *v19;
  Swift::Int v20;
  void *v21;
  char v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  Swift::Bool is_nil;
  _QWORD *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  Swift::String v38;
  uint64_t v39;
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
  NSObject *v50;
  os_log_type_t v51;
  uint8_t *v52;
  _QWORD *v53;
  uint64_t (*v54)();
  void (*v55)(uint64_t, uint64_t);
  uint64_t v56;
  NSObject *v57;
  os_log_type_t v58;
  uint8_t *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  uint64_t v73;
  Swift::Int v74;
  void *v75;
  char v76;
  Swift::Bool v77;
  void *v78;
  uint64_t countAndFlagsBits;
  uint64_t v80;
  Swift::Int baseNumber;
  Swift::Int value;
  Swift::Int buildNumber;
  Swift::String_optional suffix;
  char *v85;
  Swift::Int v86;
  FindMyDaemonSupport::SystemVersionNumber_optional v87;

  object = *(void **)(v0 + 472);
  v2 = *(_QWORD *)(v0 + 392);
  if (v2)
  {
    if (!object)
      return sub_23B6E0A04();
    goto LABEL_5;
  }
  if (object)
  {
LABEL_5:
    v85 = (char *)(v0 + 816);
    v4 = *(void **)(v0 + 496);
    v5 = *(_DWORD *)(v0 + 512) & 1;
    sub_23B6DFED0(*(_QWORD *)(v0 + 384), v2);
    v6 = *(void **)(v0 + 536);
    v7 = *(_QWORD *)(v0 + 528);
    v8 = *(_QWORD *)(v0 + 520);
    v9 = *(_QWORD *)(v0 + 504);
    v10 = *(_QWORD *)(v0 + 480);
    v11 = *(_QWORD *)(v0 + 488);
    v12 = *(void **)(v0 + 456);
    v13 = *(_QWORD *)(v0 + 464);
    v15 = *(_QWORD *)(v0 + 440);
    v14 = *(_QWORD *)(v0 + 448);
    v17 = *(_QWORD *)(v0 + 424);
    v16 = *(_QWORD *)(v0 + 432);
    v18 = *(_QWORD *)(v0 + 408);
    v19 = *(void **)(v0 + 416);
    v21 = *(void **)(v0 + 392);
    v20 = *(_QWORD *)(v0 + 400);
    v22 = 1;
    v23 = *(_QWORD *)(v0 + 384);
    goto LABEL_6;
  }
  v85 = (char *)(v0 + 816);
  v38._countAndFlagsBits = sub_23B6E04B8();
  SystemVersionNumber.init(string:)(&v87, v38);
  object = v87.value.rawValue._object;
  if (!v87.value.rawValue._object)
    goto LABEL_39;
  v28 = v87.value.baseLetter._object;
  baseNumber = v87.value.baseNumber;
  value = v87.value.childType.value;
  buildNumber = v87.value.buildNumber;
  suffix = v87.value.suffix;
  countAndFlagsBits = v87.value.rawValue._countAndFlagsBits;
  v80 = v87.value.baseLetter._countAndFlagsBits;
  is_nil = v87.value.childType.is_nil;
  if (qword_254301018 != -1)
    swift_once();
  v40 = *(_QWORD *)(v0 + 368);
  v39 = *(_QWORD *)(v0 + 376);
  v41 = *(_QWORD *)(v0 + 360);
  v42 = __swift_project_value_buffer(v41, (uint64_t)qword_254300FF8);
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v40 + 16))(v39, v42, v41);
  sub_23B6E0524();
  (*(void (**)(uint64_t, uint64_t))(v40 + 8))(v39, v41);
  v43 = *(_QWORD *)(v0 + 288);
  if (!v43)
  {
    v24 = 0;
    v25 = countAndFlagsBits;
    goto LABEL_13;
  }
  v44 = *(_QWORD *)(v0 + 280);
  SystemVersionNumber.init(string:)(&v87, *(Swift::String *)(&v43 - 1));
  v22 = 0;
  v23 = v87.value.rawValue._countAndFlagsBits;
  v21 = v87.value.rawValue._object;
  v20 = v87.value.baseNumber;
  v18 = v87.value.baseLetter._countAndFlagsBits;
  LOBYTE(v5) = is_nil;
  v4 = v28;
  v19 = v87.value.baseLetter._object;
  v17 = v87.value.childType.value;
  v16 = *(_QWORD *)&v87.value.childType.is_nil;
  v15 = v87.value.buildNumber;
  v14 = v87.value.suffix.value._countAndFlagsBits;
  v12 = v87.value.suffix.value._object;
  v6 = suffix.value._object;
  v7 = suffix.value._countAndFlagsBits;
  v9 = value;
  v8 = buildNumber;
  v11 = v80;
  v10 = baseNumber;
  v13 = countAndFlagsBits;
LABEL_6:
  suffix.value._object = v6;
  *(_QWORD *)(v0 + 688) = v6;
  *(_QWORD *)(v0 + 680) = v7;
  *(_QWORD *)(v0 + 672) = v8;
  v77 = v5;
  v85[1] = v5;
  baseNumber = v10;
  value = v9;
  *(_QWORD *)(v0 + 664) = v9;
  v78 = v4;
  v80 = v11;
  *(_QWORD *)(v0 + 656) = v4;
  *(_QWORD *)(v0 + 648) = v11;
  *(_QWORD *)(v0 + 640) = v10;
  *(_QWORD *)(v0 + 632) = object;
  *(_QWORD *)(v0 + 624) = v13;
  v24 = v22;
  *v85 = v22;
  *(_QWORD *)(v0 + 616) = v12;
  *(_QWORD *)(v0 + 608) = v14;
  *(_QWORD *)(v0 + 600) = v15;
  *(_QWORD *)(v0 + 592) = v16;
  *(_QWORD *)(v0 + 584) = v17;
  *(_QWORD *)(v0 + 576) = v19;
  *(_QWORD *)(v0 + 568) = v18;
  *(_QWORD *)(v0 + 560) = v20;
  *(_QWORD *)(v0 + 552) = v21;
  *(_QWORD *)(v0 + 544) = v23;
  v25 = v13;
  buildNumber = v8;
  suffix.value._countAndFlagsBits = v7;
  if (!v21)
  {
    sub_23B6DFED0(*(_QWORD *)(v0 + 464), *(_QWORD *)(v0 + 472));
    v28 = v78;
    is_nil = v77;
LABEL_13:
    *(Swift::String_optional *)(v0 + 752) = suffix;
    *(_QWORD *)(v0 + 744) = buildNumber;
    v85[3] = is_nil;
    *(_QWORD *)(v0 + 736) = value;
    *(_QWORD *)(v0 + 728) = v28;
    *(_QWORD *)(v0 + 720) = v80;
    *(_QWORD *)(v0 + 712) = baseNumber;
    *(_QWORD *)(v0 + 704) = object;
    *(_QWORD *)(v0 + 696) = v25;
    v85[2] = v24;
    v30 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 768) = v30;
    *v30 = v0;
    v30[1] = sub_23B6D8474;
    v30[2] = *(_QWORD *)(v0 + 296);
    return swift_task_switch();
  }
  v74 = v20;
  v75 = v12;
  v26 = object;
  v27 = v14;
  v76 = v16;
  v86 = v15;
  if (v23 == v13 && v21 == v26 || (sub_23B6E0A88() & 1) != 0)
  {
    sub_23B6DFED0(*(_QWORD *)(v0 + 464), *(_QWORD *)(v0 + 472));
    sub_23B6DFF0C(v23, (uint64_t)v21);
    if ((v24 & 1) != 0)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    else
    {
      v87.value.rawValue._countAndFlagsBits = v25;
      v87.value.rawValue._object = v26;
      v87.value.baseNumber = baseNumber;
      v87.value.baseLetter._countAndFlagsBits = v80;
      v87.value.baseLetter._object = v78;
      v87.value.childType.value = value;
      v87.value.childType.is_nil = v77;
      v87.value.buildNumber = buildNumber;
      v87.value.suffix = suffix;
      v31 = SystemVersionNumber.description.getter();
      v33 = v32;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (qword_254301018 != -1)
        swift_once();
      __swift_project_value_buffer(*(_QWORD *)(v0 + 360), (uint64_t)qword_254300FF8);
      *(_QWORD *)(v0 + 248) = v31;
      *(_QWORD *)(v0 + 256) = v33;
      swift_beginAccess();
      sub_23B6E0530();
      swift_endAccess();
    }
    sub_23B6E04C4();
    if (qword_254301040 != -1)
      swift_once();
    v35 = *(_QWORD *)(v0 + 368);
    v34 = *(_QWORD *)(v0 + 376);
    v36 = *(_QWORD *)(v0 + 360);
    v37 = __swift_project_value_buffer(v36, (uint64_t)qword_254301020);
    swift_beginAccess();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v35 + 16))(v34, v37, v36);
    sub_23B6E0524();
    (*(void (**)(uint64_t, uint64_t))(v35 + 8))(v34, v36);
    if (*(_QWORD *)(v0 + 272))
    {
      sub_23B6E0620();
      swift_bridgeObjectRelease();
    }
    else
    {
      (*(void (**)(_QWORD, uint64_t, uint64_t, _QWORD))(*(_QWORD *)(v0 + 312) + 56))(*(_QWORD *)(v0 + 352), 1, 1, *(_QWORD *)(v0 + 304));
    }
    v45 = *(_QWORD *)(v0 + 344);
    v46 = *(_QWORD *)(v0 + 352);
    v47 = *(_QWORD *)(v0 + 304);
    v48 = *(_QWORD *)(v0 + 312);
    (*(void (**)(_QWORD, _QWORD, uint64_t))(v48 + 16))(*(_QWORD *)(v0 + 328), *(_QWORD *)(v0 + 336), v47);
    sub_23B6BF618(v46, v45, &qword_254300F70);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v48 + 48))(v45, 1, v47) == 1)
    {
      sub_23B6B772C(*(_QWORD *)(v0 + 344), &qword_254300F70);
      if (qword_254300840 != -1)
        swift_once();
      v49 = sub_23B6E0668();
      __swift_project_value_buffer(v49, (uint64_t)qword_254300FE0);
      v50 = sub_23B6E0650();
      v51 = sub_23B6E08C0();
      if (os_log_type_enabled(v50, v51))
      {
        v52 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v52 = 0;
        _os_log_impl(&dword_23B6B3000, v50, v51, "No lastLaunchBootSessionUUID on record", v52, 2u);
        MEMORY[0x23B86B840](v52, -1, -1);
      }

      v53 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 800) = v53;
      v54 = sub_23B6D9134;
      goto LABEL_42;
    }
    (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(v0 + 312) + 32))(*(_QWORD *)(v0 + 320), *(_QWORD *)(v0 + 344), *(_QWORD *)(v0 + 304));
    sub_23B6B8FBC(&qword_254301348, 255, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA98]);
    if ((sub_23B6E06D4() & 1) == 0)
    {
      v53 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 784) = v53;
      v54 = sub_23B6D9008;
LABEL_42:
      *v53 = v0;
      v53[1] = v54;
      v73 = *(_QWORD *)(v0 + 296);
      v53[7] = *(_QWORD *)(v0 + 328);
      v53[8] = v73;
      return swift_task_switch();
    }
    v55 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v0 + 312) + 8);
    v55(*(_QWORD *)(v0 + 328), *(_QWORD *)(v0 + 304));
    if (qword_254300840 != -1)
      swift_once();
    v56 = sub_23B6E0668();
    __swift_project_value_buffer(v56, (uint64_t)qword_254300FE0);
    v57 = sub_23B6E0650();
    v58 = sub_23B6E08C0();
    if (os_log_type_enabled(v57, v58))
    {
      v59 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v59 = 0;
      _os_log_impl(&dword_23B6B3000, v57, v58, "This is *NOT* the first run since reboot", v59, 2u);
      MEMORY[0x23B86B840](v59, -1, -1);
    }

    v60 = *(_QWORD *)(v0 + 352);
    v61 = *(_QWORD *)(v0 + 336);
    v62 = *(_QWORD *)(v0 + 304);
    v55(*(_QWORD *)(v0 + 320), v62);
    v55(v61, v62);
    sub_23B6B772C(v60, &qword_254300F70);
LABEL_39:
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  *(_QWORD *)(v0 + 96) = v23;
  *(_QWORD *)(v0 + 104) = v21;
  *(_QWORD *)(v0 + 112) = v74;
  *(_QWORD *)(v0 + 120) = v18;
  *(_QWORD *)(v0 + 128) = v19;
  *(_QWORD *)(v0 + 136) = v17;
  *(_BYTE *)(v0 + 144) = v76 & 1;
  *(_QWORD *)(v0 + 152) = v86;
  *(_QWORD *)(v0 + 160) = v27;
  *(_QWORD *)(v0 + 168) = v75;
  *(_QWORD *)(v0 + 16) = v25;
  *(_QWORD *)(v0 + 24) = v26;
  *(_QWORD *)(v0 + 32) = baseNumber;
  *(_QWORD *)(v0 + 40) = v80;
  *(_QWORD *)(v0 + 48) = v78;
  *(_QWORD *)(v0 + 56) = value;
  *(_BYTE *)(v0 + 64) = v77;
  v63 = *(_QWORD *)(v0 + 472);
  *(_QWORD *)(v0 + 72) = buildNumber;
  *(_QWORD *)(v0 + 80) = suffix.value._countAndFlagsBits;
  v64 = *(_QWORD *)(v0 + 464);
  *(_QWORD *)(v0 + 88) = suffix.value._object;
  sub_23B6DFED0(v64, v63);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v65 = swift_task_alloc();
  *(_QWORD *)(v0 + 776) = v65;
  *(_QWORD *)v65 = v0;
  *(_QWORD *)(v65 + 8) = sub_23B6D89F0;
  v66 = *(_QWORD *)(v0 + 296);
  *(_QWORD *)(v65 + 216) = v0 + 16;
  *(_QWORD *)(v65 + 224) = v66;
  *(_QWORD *)(v65 + 208) = v0 + 96;
  *(_OWORD *)(v65 + 96) = *(_OWORD *)(v0 + 96);
  v67 = *(_OWORD *)(v0 + 160);
  v69 = *(_OWORD *)(v0 + 112);
  v68 = *(_OWORD *)(v0 + 128);
  *(_OWORD *)(v65 + 144) = *(_OWORD *)(v0 + 144);
  *(_OWORD *)(v65 + 160) = v67;
  *(_OWORD *)(v65 + 112) = v69;
  *(_OWORD *)(v65 + 128) = v68;
  v71 = *(_OWORD *)(v0 + 32);
  v70 = *(_OWORD *)(v0 + 48);
  v72 = *(_OWORD *)(v0 + 80);
  *(_OWORD *)(v65 + 64) = *(_OWORD *)(v0 + 64);
  *(_OWORD *)(v65 + 80) = v72;
  *(_OWORD *)(v65 + 32) = v71;
  *(_OWORD *)(v65 + 48) = v70;
  *(_OWORD *)(v65 + 16) = *(_OWORD *)(v0 + 16);
  return swift_task_switch();
}

uint64_t sub_23B6D8474()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23B6D84CC()
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
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  _QWORD *v16;
  uint64_t (*v17)();
  void (*v18)(uint64_t, uint64_t);
  uint64_t v19;
  NSObject *v20;
  os_log_type_t v21;
  uint8_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v27;

  if (*(_BYTE *)(v0 + 818) == 1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    v1 = SystemVersionNumber.description.getter();
    v3 = v2;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (qword_254301018 != -1)
      swift_once();
    __swift_project_value_buffer(*(_QWORD *)(v0 + 360), (uint64_t)qword_254300FF8);
    *(_QWORD *)(v0 + 248) = v1;
    *(_QWORD *)(v0 + 256) = v3;
    swift_beginAccess();
    sub_23B6E0530();
    swift_endAccess();
  }
  sub_23B6E04C4();
  if (qword_254301040 != -1)
    swift_once();
  v5 = *(_QWORD *)(v0 + 368);
  v4 = *(_QWORD *)(v0 + 376);
  v6 = *(_QWORD *)(v0 + 360);
  v7 = __swift_project_value_buffer(v6, (uint64_t)qword_254301020);
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v4, v7, v6);
  sub_23B6E0524();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
  if (*(_QWORD *)(v0 + 272))
  {
    sub_23B6E0620();
    swift_bridgeObjectRelease();
  }
  else
  {
    (*(void (**)(_QWORD, uint64_t, uint64_t, _QWORD))(*(_QWORD *)(v0 + 312) + 56))(*(_QWORD *)(v0 + 352), 1, 1, *(_QWORD *)(v0 + 304));
  }
  v8 = *(_QWORD *)(v0 + 344);
  v9 = *(_QWORD *)(v0 + 352);
  v10 = *(_QWORD *)(v0 + 304);
  v11 = *(_QWORD *)(v0 + 312);
  (*(void (**)(_QWORD, _QWORD, uint64_t))(v11 + 16))(*(_QWORD *)(v0 + 328), *(_QWORD *)(v0 + 336), v10);
  sub_23B6BF618(v9, v8, &qword_254300F70);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v11 + 48))(v8, 1, v10) == 1)
  {
    sub_23B6B772C(*(_QWORD *)(v0 + 344), &qword_254300F70);
    if (qword_254300840 != -1)
      swift_once();
    v12 = sub_23B6E0668();
    __swift_project_value_buffer(v12, (uint64_t)qword_254300FE0);
    v13 = sub_23B6E0650();
    v14 = sub_23B6E08C0();
    if (os_log_type_enabled(v13, v14))
    {
      v15 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_23B6B3000, v13, v14, "No lastLaunchBootSessionUUID on record", v15, 2u);
      MEMORY[0x23B86B840](v15, -1, -1);
    }

    v16 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 800) = v16;
    v17 = sub_23B6D9134;
    goto LABEL_24;
  }
  (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(v0 + 312) + 32))(*(_QWORD *)(v0 + 320), *(_QWORD *)(v0 + 344), *(_QWORD *)(v0 + 304));
  sub_23B6B8FBC(&qword_254301348, 255, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA98]);
  if ((sub_23B6E06D4() & 1) == 0)
  {
    v16 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 784) = v16;
    v17 = sub_23B6D9008;
LABEL_24:
    *v16 = v0;
    v16[1] = v17;
    v27 = *(_QWORD *)(v0 + 296);
    v16[7] = *(_QWORD *)(v0 + 328);
    v16[8] = v27;
    return swift_task_switch();
  }
  v18 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v0 + 312) + 8);
  v18(*(_QWORD *)(v0 + 328), *(_QWORD *)(v0 + 304));
  if (qword_254300840 != -1)
    swift_once();
  v19 = sub_23B6E0668();
  __swift_project_value_buffer(v19, (uint64_t)qword_254300FE0);
  v20 = sub_23B6E0650();
  v21 = sub_23B6E08C0();
  if (os_log_type_enabled(v20, v21))
  {
    v22 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v22 = 0;
    _os_log_impl(&dword_23B6B3000, v20, v21, "This is *NOT* the first run since reboot", v22, 2u);
    MEMORY[0x23B86B840](v22, -1, -1);
  }

  v23 = *(_QWORD *)(v0 + 352);
  v24 = *(_QWORD *)(v0 + 336);
  v25 = *(_QWORD *)(v0 + 304);
  v18(*(_QWORD *)(v0 + 320), v25);
  v18(v24, v25);
  sub_23B6B772C(v23, &qword_254300F70);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23B6D89F0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(*(_QWORD *)v0 + 552);
  v2 = *(_QWORD *)(*(_QWORD *)v0 + 544);
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_23B6DFF0C(v2, v1);
  return swift_task_switch();
}

uint64_t sub_23B6D8AE4()
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
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  _QWORD *v16;
  uint64_t (*v17)();
  void (*v18)(uint64_t, uint64_t);
  uint64_t v19;
  NSObject *v20;
  os_log_type_t v21;
  uint8_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v27;

  if (*(_BYTE *)(v0 + 816) == 1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    v1 = SystemVersionNumber.description.getter();
    v3 = v2;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (qword_254301018 != -1)
      swift_once();
    __swift_project_value_buffer(*(_QWORD *)(v0 + 360), (uint64_t)qword_254300FF8);
    *(_QWORD *)(v0 + 248) = v1;
    *(_QWORD *)(v0 + 256) = v3;
    swift_beginAccess();
    sub_23B6E0530();
    swift_endAccess();
  }
  sub_23B6E04C4();
  if (qword_254301040 != -1)
    swift_once();
  v5 = *(_QWORD *)(v0 + 368);
  v4 = *(_QWORD *)(v0 + 376);
  v6 = *(_QWORD *)(v0 + 360);
  v7 = __swift_project_value_buffer(v6, (uint64_t)qword_254301020);
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v4, v7, v6);
  sub_23B6E0524();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
  if (*(_QWORD *)(v0 + 272))
  {
    sub_23B6E0620();
    swift_bridgeObjectRelease();
  }
  else
  {
    (*(void (**)(_QWORD, uint64_t, uint64_t, _QWORD))(*(_QWORD *)(v0 + 312) + 56))(*(_QWORD *)(v0 + 352), 1, 1, *(_QWORD *)(v0 + 304));
  }
  v8 = *(_QWORD *)(v0 + 344);
  v9 = *(_QWORD *)(v0 + 352);
  v10 = *(_QWORD *)(v0 + 304);
  v11 = *(_QWORD *)(v0 + 312);
  (*(void (**)(_QWORD, _QWORD, uint64_t))(v11 + 16))(*(_QWORD *)(v0 + 328), *(_QWORD *)(v0 + 336), v10);
  sub_23B6BF618(v9, v8, &qword_254300F70);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v11 + 48))(v8, 1, v10) == 1)
  {
    sub_23B6B772C(*(_QWORD *)(v0 + 344), &qword_254300F70);
    if (qword_254300840 != -1)
      swift_once();
    v12 = sub_23B6E0668();
    __swift_project_value_buffer(v12, (uint64_t)qword_254300FE0);
    v13 = sub_23B6E0650();
    v14 = sub_23B6E08C0();
    if (os_log_type_enabled(v13, v14))
    {
      v15 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_23B6B3000, v13, v14, "No lastLaunchBootSessionUUID on record", v15, 2u);
      MEMORY[0x23B86B840](v15, -1, -1);
    }

    v16 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 800) = v16;
    v17 = sub_23B6D9134;
    goto LABEL_24;
  }
  (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(v0 + 312) + 32))(*(_QWORD *)(v0 + 320), *(_QWORD *)(v0 + 344), *(_QWORD *)(v0 + 304));
  sub_23B6B8FBC(&qword_254301348, 255, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA98]);
  if ((sub_23B6E06D4() & 1) == 0)
  {
    v16 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 784) = v16;
    v17 = sub_23B6D9008;
LABEL_24:
    *v16 = v0;
    v16[1] = v17;
    v27 = *(_QWORD *)(v0 + 296);
    v16[7] = *(_QWORD *)(v0 + 328);
    v16[8] = v27;
    return swift_task_switch();
  }
  v18 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v0 + 312) + 8);
  v18(*(_QWORD *)(v0 + 328), *(_QWORD *)(v0 + 304));
  if (qword_254300840 != -1)
    swift_once();
  v19 = sub_23B6E0668();
  __swift_project_value_buffer(v19, (uint64_t)qword_254300FE0);
  v20 = sub_23B6E0650();
  v21 = sub_23B6E08C0();
  if (os_log_type_enabled(v20, v21))
  {
    v22 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v22 = 0;
    _os_log_impl(&dword_23B6B3000, v20, v21, "This is *NOT* the first run since reboot", v22, 2u);
    MEMORY[0x23B86B840](v22, -1, -1);
  }

  v23 = *(_QWORD *)(v0 + 352);
  v24 = *(_QWORD *)(v0 + 336);
  v25 = *(_QWORD *)(v0 + 304);
  v18(*(_QWORD *)(v0 + 320), v25);
  v18(v24, v25);
  sub_23B6B772C(v23, &qword_254300F70);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23B6D9008()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t);

  v1 = *v0;
  v2 = *(_QWORD *)(*v0 + 328);
  v3 = *(_QWORD *)(*v0 + 304);
  v4 = *(_QWORD *)(*v0 + 312);
  swift_task_dealloc();
  v5 = *(void (**)(uint64_t, uint64_t))(v4 + 8);
  *(_QWORD *)(v1 + 792) = v5;
  v5(v2, v3);
  return swift_task_switch();
}

uint64_t sub_23B6D9088()
{
  uint64_t v0;
  void (*v1)(uint64_t, uint64_t);
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = *(void (**)(uint64_t, uint64_t))(v0 + 792);
  v2 = *(_QWORD *)(v0 + 352);
  v3 = *(_QWORD *)(v0 + 336);
  v4 = *(_QWORD *)(v0 + 304);
  v1(*(_QWORD *)(v0 + 320), v4);
  v1(v3, v4);
  sub_23B6B772C(v2, &qword_254300F70);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23B6D9134()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t);

  v1 = *v0;
  v2 = *(_QWORD *)(*v0 + 328);
  v3 = *(_QWORD *)(*v0 + 304);
  v4 = *(_QWORD *)(*v0 + 312);
  swift_task_dealloc();
  v5 = *(void (**)(uint64_t, uint64_t))(v4 + 8);
  *(_QWORD *)(v1 + 808) = v5;
  v5(v2, v3);
  return swift_task_switch();
}

uint64_t sub_23B6D91B4()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 352);
  (*(void (**)(_QWORD, _QWORD))(v0 + 808))(*(_QWORD *)(v0 + 336), *(_QWORD *)(v0 + 304));
  sub_23B6B772C(v1, &qword_254300F70);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23B6D924C()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = v0;
  return swift_task_switch();
}

uint64_t sub_23B6D9264()
{
  uint64_t v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;
  uint64_t v5;
  _QWORD *v6;

  if (qword_254300840 != -1)
    swift_once();
  v1 = sub_23B6E0668();
  __swift_project_value_buffer(v1, (uint64_t)qword_254300FE0);
  v2 = sub_23B6E0650();
  v3 = sub_23B6E08C0();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_23B6B3000, v2, v3, "Initial launch processing...", v4, 2u);
    MEMORY[0x23B86B840](v4, -1, -1);
  }

  sub_23B6B8FBC((unint64_t *)&qword_254301320, v5, (uint64_t (*)(uint64_t))type metadata accessor for ActorServiceCollection, (uint64_t)&protocol conformance descriptor for ActorServiceCollection);
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 24) = v6;
  *v6 = v0;
  v6[1] = sub_23B6D93B0;
  return sub_23B6E09B0();
}

uint64_t sub_23B6D93B0()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23B6D9404(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;

  v3[12] = a2;
  v3[13] = a3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254301350);
  v3[14] = swift_task_alloc();
  v3[15] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23B6D9474()
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
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void (*v19)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;

  v1 = *(_QWORD *)(v0 + 104);
  swift_beginAccess();
  v2 = *(_QWORD *)(v1 + 112);
  v22 = *(_QWORD *)(v2 + 16);
  if (v22)
  {
    v3 = sub_23B6E07DC();
    v4 = *(_QWORD *)(v3 - 8);
    v19 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v4 + 56);
    swift_bridgeObjectRetain();
    v5 = 0;
    v21 = v2;
    v20 = v4;
    while (1)
    {
      v8 = *(_QWORD *)(v0 + 112);
      v7 = *(_QWORD *)(v0 + 120);
      v23 = *(_OWORD *)(v2 + 16 * v5 + 32);
      v19(v7, 1, 1, v3);
      v9 = swift_allocObject();
      *(_QWORD *)(v9 + 16) = 0;
      v10 = (_QWORD *)(v9 + 16);
      *(_QWORD *)(v9 + 24) = 0;
      *(_OWORD *)(v9 + 32) = v23;
      sub_23B6BF618(v7, v8, &qword_254301350);
      LODWORD(v8) = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 48))(v8, 1, v3);
      swift_unknownObjectRetain_n();
      v11 = *(_QWORD *)(v0 + 112);
      if ((_DWORD)v8 == 1)
      {
        sub_23B6B772C(*(_QWORD *)(v0 + 112), &qword_254301350);
        if (!*v10)
          goto LABEL_8;
      }
      else
      {
        sub_23B6E07D0();
        (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v11, v3);
        if (!*v10)
        {
LABEL_8:
          v12 = 0;
          v14 = 0;
          goto LABEL_9;
        }
      }
      swift_getObjectType();
      swift_unknownObjectRetain();
      v12 = sub_23B6E07AC();
      v14 = v13;
      swift_unknownObjectRelease();
LABEL_9:
      v15 = **(_QWORD **)(v0 + 96);
      v16 = swift_allocObject();
      *(_QWORD *)(v16 + 16) = &unk_256A47540;
      *(_QWORD *)(v16 + 24) = v9;
      v17 = v14 | v12;
      if (v14 | v12)
      {
        v17 = v0 + 16;
        *(_QWORD *)(v0 + 16) = 0;
        *(_QWORD *)(v0 + 24) = 0;
        *(_QWORD *)(v0 + 32) = v12;
        *(_QWORD *)(v0 + 40) = v14;
      }
      ++v5;
      v6 = *(_QWORD *)(v0 + 120);
      *(_QWORD *)(v0 + 72) = 1;
      *(_QWORD *)(v0 + 80) = v17;
      *(_QWORD *)(v0 + 88) = v15;
      swift_task_create();
      swift_unknownObjectRelease();
      swift_release();
      sub_23B6B772C(v6, &qword_254301350);
      v2 = v21;
      v4 = v20;
      if (v22 == v5)
      {
        swift_bridgeObjectRelease();
        break;
      }
    }
  }
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23B6D971C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t ObjectType;
  _QWORD *v8;
  uint64_t (*v10)(uint64_t, uint64_t);

  ObjectType = swift_getObjectType();
  v10 = (uint64_t (*)(uint64_t, uint64_t))(**(int **)(a5 + 32) + *(_QWORD *)(a5 + 32));
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v5 + 16) = v8;
  *v8 = v5;
  v8[1] = sub_23B6B77B8;
  return v10(ObjectType, a5);
}

uint64_t sub_23B6D9794(__int128 *a1, _OWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;

  *(_QWORD *)(v3 + 216) = a2;
  *(_QWORD *)(v3 + 224) = v2;
  *(_QWORD *)(v3 + 208) = a1;
  v4 = a1[2];
  v5 = a1[3];
  v6 = *a1;
  *(_OWORD *)(v3 + 112) = a1[1];
  *(_OWORD *)(v3 + 128) = v4;
  v7 = a1[4];
  *(_OWORD *)(v3 + 144) = v5;
  *(_OWORD *)(v3 + 160) = v7;
  *(_OWORD *)(v3 + 80) = a2[4];
  *(_OWORD *)(v3 + 96) = v6;
  v8 = a2[3];
  *(_OWORD *)(v3 + 48) = a2[2];
  *(_OWORD *)(v3 + 64) = v8;
  v9 = a2[1];
  *(_OWORD *)(v3 + 16) = *a2;
  *(_OWORD *)(v3 + 32) = v9;
  return swift_task_switch();
}

uint64_t sub_23B6D97DC()
{
  _QWORD *v0;
  _OWORD *v1;
  __int128 *v2;
  uint64_t v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  os_log_type_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD *v30;
  _QWORD *v31;
  uint64_t v33;
  _OWORD v34[5];
  _OWORD v35[5];
  uint64_t v36;
  _QWORD *v37;

  v1 = (_OWORD *)v0[26];
  v2 = (__int128 *)v0[27];
  v3 = (uint64_t)(v0 + 2);
  v4 = v1[3];
  v34[2] = v1[2];
  v34[3] = v4;
  v5 = v1[4];
  v6 = v1[1];
  v34[0] = *v1;
  v34[1] = v6;
  v7 = v2[3];
  v35[2] = v2[2];
  v35[3] = v7;
  v35[4] = v2[4];
  v8 = *v2;
  v35[1] = v2[1];
  v34[4] = v5;
  v35[0] = v8;
  if ((_s19FindMyDaemonSupport19SystemVersionNumberV1loiySbAC_ACtFZ_0(v34, v35) & 1) == 0)
  {
    if (qword_254300840 != -1)
      swift_once();
    v19 = sub_23B6E0668();
    __swift_project_value_buffer(v19, (uint64_t)qword_254300FE0);
    sub_23B6E0194((uint64_t)(v0 + 12));
    sub_23B6E0194((uint64_t)(v0 + 2));
    v10 = sub_23B6E0650();
    v20 = sub_23B6E08C0();
    if (os_log_type_enabled(v10, v20))
    {
      v21 = swift_slowAlloc();
      v22 = swift_slowAlloc();
      *(_QWORD *)&v35[0] = v22;
      *(_DWORD *)v21 = 136315394;
      v37 = v0 + 2;
      v23 = v0[12];
      v24 = v0[13];
      swift_bridgeObjectRetain();
      v0[22] = sub_23B6BE8C4(v23, v24, (uint64_t *)v35);
      sub_23B6E0920();
      swift_bridgeObjectRelease();
      sub_23B6E01DC((uint64_t)(v0 + 12));
      *(_WORD *)(v21 + 12) = 2080;
      v25 = v0[2];
      v26 = v0[3];
      swift_bridgeObjectRetain();
      v27 = v25;
      v3 = (uint64_t)v37;
      v0[23] = sub_23B6BE8C4(v27, v26, (uint64_t *)v35);
      sub_23B6E0920();
      swift_bridgeObjectRelease();
      sub_23B6E01DC(v3);
      _os_log_impl(&dword_23B6B3000, v10, v20, "Back-migration from %s to %s", (uint8_t *)v21, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x23B86B840](v22, -1, -1);
      v18 = v21;
      goto LABEL_10;
    }
LABEL_11:
    sub_23B6E01DC((uint64_t)(v0 + 12));
    sub_23B6E01DC((uint64_t)(v0 + 2));
    goto LABEL_12;
  }
  if (qword_254300840 != -1)
    swift_once();
  v9 = sub_23B6E0668();
  __swift_project_value_buffer(v9, (uint64_t)qword_254300FE0);
  sub_23B6E0194((uint64_t)(v0 + 12));
  sub_23B6E0194((uint64_t)(v0 + 2));
  v10 = sub_23B6E0650();
  v11 = sub_23B6E08C0();
  if (!os_log_type_enabled(v10, v11))
    goto LABEL_11;
  v12 = swift_slowAlloc();
  v33 = swift_slowAlloc();
  *(_QWORD *)&v35[0] = v33;
  *(_DWORD *)v12 = 136315394;
  v37 = v0 + 2;
  v14 = v0[12];
  v13 = v0[13];
  swift_bridgeObjectRetain();
  v0[24] = sub_23B6BE8C4(v14, v13, (uint64_t *)v35);
  sub_23B6E0920();
  swift_bridgeObjectRelease();
  sub_23B6E01DC((uint64_t)(v0 + 12));
  *(_WORD *)(v12 + 12) = 2080;
  v15 = v0[2];
  v16 = v0[3];
  swift_bridgeObjectRetain();
  v17 = v15;
  v3 = (uint64_t)v37;
  v0[25] = sub_23B6BE8C4(v17, v16, (uint64_t *)v35);
  sub_23B6E0920();
  swift_bridgeObjectRelease();
  sub_23B6E01DC(v3);
  _os_log_impl(&dword_23B6B3000, v10, v11, "Migrating from %s to %s", (uint8_t *)v12, 0x16u);
  swift_arrayDestroy();
  MEMORY[0x23B86B840](v33, -1, -1);
  v18 = v12;
LABEL_10:
  MEMORY[0x23B86B840](v18, -1, -1);
LABEL_12:

  v28 = v0[28];
  sub_23B6B8FBC((unint64_t *)&qword_254301320, v29, (uint64_t (*)(uint64_t))type metadata accessor for ActorServiceCollection, (uint64_t)&protocol conformance descriptor for ActorServiceCollection);
  v30 = (_QWORD *)swift_task_alloc();
  v0[29] = v30;
  v30[2] = v28;
  v30[3] = v0 + 12;
  v30[4] = v3;
  v31 = (_QWORD *)swift_task_alloc();
  v0[30] = v31;
  *v31 = v0;
  v31[1] = sub_23B6D9C60;
  v36 = MEMORY[0x24BEE4AE0] + 8;
  return sub_23B6E09B0();
}

uint64_t sub_23B6D9C60()
{
  swift_task_dealloc();
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23B6D9CC0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;

  v5[14] = a4;
  v5[15] = a5;
  v5[12] = a2;
  v5[13] = a3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254301350);
  v5[16] = swift_task_alloc();
  v5[17] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23B6D9D34()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _OWORD *v8;
  _OWORD *v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void (*v26)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  __int128 v32;

  v1 = *(_QWORD *)(v0 + 104);
  swift_beginAccess();
  v2 = *(_QWORD *)(v1 + 112);
  v29 = *(_QWORD *)(v2 + 16);
  if (v29)
  {
    v3 = sub_23B6E07DC();
    v27 = *(_QWORD *)(v3 - 8);
    v26 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v27 + 56);
    swift_bridgeObjectRetain();
    v4 = 0;
    v28 = v2;
    v30 = v3;
    do
    {
      v7 = *(_QWORD *)(v0 + 128);
      v6 = *(_QWORD *)(v0 + 136);
      v9 = *(_OWORD **)(v0 + 112);
      v8 = *(_OWORD **)(v0 + 120);
      v31 = v4;
      v32 = *(_OWORD *)(v2 + 16 * v4 + 32);
      v26(v6, 1, 1, v3);
      v10 = v3;
      v11 = swift_allocObject();
      *(_QWORD *)(v11 + 16) = 0;
      *(_QWORD *)(v11 + 24) = 0;
      *(_OWORD *)(v11 + 32) = v32;
      v12 = v9[1];
      v13 = v9[2];
      v14 = v9[4];
      *(_OWORD *)(v11 + 96) = v9[3];
      *(_OWORD *)(v11 + 112) = v14;
      *(_OWORD *)(v11 + 64) = v12;
      *(_OWORD *)(v11 + 80) = v13;
      *(_OWORD *)(v11 + 48) = *v9;
      v16 = v8[1];
      v15 = v8[2];
      v17 = v8[4];
      *(_OWORD *)(v11 + 176) = v8[3];
      *(_OWORD *)(v11 + 192) = v17;
      *(_OWORD *)(v11 + 144) = v16;
      *(_OWORD *)(v11 + 160) = v15;
      *(_OWORD *)(v11 + 128) = *v8;
      sub_23B6BF618(v6, v7, &qword_254301350);
      LODWORD(v6) = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v27 + 48))(v7, 1, v10);
      swift_unknownObjectRetain_n();
      sub_23B6E0194((uint64_t)v9);
      sub_23B6E0194((uint64_t)v8);
      v18 = *(_QWORD *)(v0 + 128);
      if ((_DWORD)v6 == 1)
      {
        sub_23B6B772C(*(_QWORD *)(v0 + 128), &qword_254301350);
      }
      else
      {
        sub_23B6E07D0();
        (*(void (**)(uint64_t, uint64_t))(v27 + 8))(v18, v30);
      }
      if (*(_QWORD *)(v11 + 16))
      {
        swift_getObjectType();
        swift_unknownObjectRetain();
        v19 = sub_23B6E07AC();
        v21 = v20;
        swift_unknownObjectRelease();
      }
      else
      {
        v19 = 0;
        v21 = 0;
      }
      v22 = **(_QWORD **)(v0 + 96);
      v23 = swift_allocObject();
      *(_QWORD *)(v23 + 16) = &unk_256A47518;
      *(_QWORD *)(v23 + 24) = v11;
      v24 = v21 | v19;
      if (v21 | v19)
      {
        v24 = v0 + 16;
        *(_QWORD *)(v0 + 16) = 0;
        *(_QWORD *)(v0 + 24) = 0;
        *(_QWORD *)(v0 + 32) = v19;
        *(_QWORD *)(v0 + 40) = v21;
      }
      v3 = v30;
      v4 = v31 + 1;
      v5 = *(_QWORD *)(v0 + 136);
      *(_QWORD *)(v0 + 72) = 1;
      *(_QWORD *)(v0 + 80) = v24;
      *(_QWORD *)(v0 + 88) = v22;
      swift_task_create();
      swift_unknownObjectRelease();
      swift_release();
      sub_23B6B772C(v5, &qword_254301350);
      v2 = v28;
    }
    while (v29 != v31 + 1);
    swift_bridgeObjectRelease();
  }
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23B6DA02C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, _OWORD *a6, __int128 *a7)
{
  uint64_t v7;
  uint64_t ObjectType;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _QWORD *v17;
  uint64_t (*v19)(uint64_t, uint64_t, uint64_t, uint64_t);

  ObjectType = swift_getObjectType();
  v12 = a6[3];
  *(_OWORD *)(v7 + 48) = a6[2];
  *(_OWORD *)(v7 + 64) = v12;
  v13 = a6[1];
  *(_OWORD *)(v7 + 16) = *a6;
  *(_OWORD *)(v7 + 32) = v13;
  v14 = a7[4];
  *(_OWORD *)(v7 + 144) = a7[3];
  *(_OWORD *)(v7 + 160) = v14;
  v15 = a7[2];
  v16 = *a7;
  *(_OWORD *)(v7 + 112) = a7[1];
  *(_OWORD *)(v7 + 128) = v15;
  *(_OWORD *)(v7 + 80) = a6[4];
  *(_OWORD *)(v7 + 96) = v16;
  v19 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(**(int **)(a5 + 40) + *(_QWORD *)(a5 + 40));
  v17 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v7 + 176) = v17;
  *v17 = v7;
  v17[1] = sub_23B6DA0FC;
  return v19(v7 + 16, v7 + 96, ObjectType, a5);
}

uint64_t sub_23B6DA0FC()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_23B6DA144()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = v0;
  return swift_task_switch();
}

uint64_t sub_23B6DA15C()
{
  uint64_t v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;
  uint64_t v5;
  _QWORD *v6;

  if (qword_254300840 != -1)
    swift_once();
  v1 = sub_23B6E0668();
  __swift_project_value_buffer(v1, (uint64_t)qword_254300FE0);
  v2 = sub_23B6E0650();
  v3 = sub_23B6E08C0();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_23B6B3000, v2, v3, "First launch since reboot...", v4, 2u);
    MEMORY[0x23B86B840](v4, -1, -1);
  }

  sub_23B6B8FBC((unint64_t *)&qword_254301320, v5, (uint64_t (*)(uint64_t))type metadata accessor for ActorServiceCollection, (uint64_t)&protocol conformance descriptor for ActorServiceCollection);
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 24) = v6;
  *v6 = v0;
  v6[1] = sub_23B6B8540;
  return sub_23B6E09B0();
}

uint64_t sub_23B6DA2A8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;

  v3[12] = a2;
  v3[13] = a3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254301350);
  v3[14] = swift_task_alloc();
  v3[15] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23B6DA318()
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
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void (*v19)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;

  v1 = *(_QWORD *)(v0 + 104);
  swift_beginAccess();
  v2 = *(_QWORD *)(v1 + 112);
  v22 = *(_QWORD *)(v2 + 16);
  if (v22)
  {
    v3 = sub_23B6E07DC();
    v4 = *(_QWORD *)(v3 - 8);
    v19 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v4 + 56);
    swift_bridgeObjectRetain();
    v5 = 0;
    v21 = v2;
    v20 = v4;
    while (1)
    {
      v8 = *(_QWORD *)(v0 + 112);
      v7 = *(_QWORD *)(v0 + 120);
      v23 = *(_OWORD *)(v2 + 16 * v5 + 32);
      v19(v7, 1, 1, v3);
      v9 = swift_allocObject();
      *(_QWORD *)(v9 + 16) = 0;
      v10 = (_QWORD *)(v9 + 16);
      *(_QWORD *)(v9 + 24) = 0;
      *(_OWORD *)(v9 + 32) = v23;
      sub_23B6BF618(v7, v8, &qword_254301350);
      LODWORD(v8) = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 48))(v8, 1, v3);
      swift_unknownObjectRetain_n();
      v11 = *(_QWORD *)(v0 + 112);
      if ((_DWORD)v8 == 1)
      {
        sub_23B6B772C(*(_QWORD *)(v0 + 112), &qword_254301350);
        if (!*v10)
          goto LABEL_8;
      }
      else
      {
        sub_23B6E07D0();
        (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v11, v3);
        if (!*v10)
        {
LABEL_8:
          v12 = 0;
          v14 = 0;
          goto LABEL_9;
        }
      }
      swift_getObjectType();
      swift_unknownObjectRetain();
      v12 = sub_23B6E07AC();
      v14 = v13;
      swift_unknownObjectRelease();
LABEL_9:
      v15 = **(_QWORD **)(v0 + 96);
      v16 = swift_allocObject();
      *(_QWORD *)(v16 + 16) = &unk_256A474F0;
      *(_QWORD *)(v16 + 24) = v9;
      v17 = v14 | v12;
      if (v14 | v12)
      {
        v17 = v0 + 16;
        *(_QWORD *)(v0 + 16) = 0;
        *(_QWORD *)(v0 + 24) = 0;
        *(_QWORD *)(v0 + 32) = v12;
        *(_QWORD *)(v0 + 40) = v14;
      }
      ++v5;
      v6 = *(_QWORD *)(v0 + 120);
      *(_QWORD *)(v0 + 72) = 1;
      *(_QWORD *)(v0 + 80) = v17;
      *(_QWORD *)(v0 + 88) = v15;
      swift_task_create();
      swift_unknownObjectRelease();
      swift_release();
      sub_23B6B772C(v6, &qword_254301350);
      v2 = v21;
      v4 = v20;
      if (v22 == v5)
      {
        swift_bridgeObjectRelease();
        break;
      }
    }
  }
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23B6DA5C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t ObjectType;
  _QWORD *v8;
  uint64_t (*v10)(uint64_t, uint64_t);

  ObjectType = swift_getObjectType();
  v10 = (uint64_t (*)(uint64_t, uint64_t))(**(int **)(a5 + 48) + *(_QWORD *)(a5 + 48));
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v5 + 16) = v8;
  *v8 = v5;
  v8[1] = sub_23B6B77B8;
  return v10(ObjectType, a5);
}

uint64_t ActorServiceCollection.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_defaultActor_destroy();
  return v0;
}

uint64_t ActorServiceCollection.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_defaultActor_destroy();
  return swift_defaultActor_deallocate();
}

uint64_t ActorServiceCollection.unownedExecutor.getter()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_23B6DA6AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v8;
  uint64_t v9;

  v8[9] = a7;
  v8[10] = a8;
  v8[7] = a5;
  v8[8] = a6;
  v8[6] = a4;
  v9 = sub_23B6E09E0();
  v8[11] = v9;
  v8[12] = *(_QWORD *)(v9 - 8);
  v8[13] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23B6DA718()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t, uint64_t, char);

  sub_23B6E09D4();
  v3 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, char))((char *)&dword_256A47498 + dword_256A47498);
  v1 = (_QWORD *)swift_task_alloc();
  v0[14] = v1;
  *v1 = v0;
  v1[1] = sub_23B6DA790;
  return v3(v0[6], v0[7], 0, 0, 1);
}

uint64_t sub_23B6DA790()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *(_QWORD *)(*(_QWORD *)v1 + 104);
  v3 = *(_QWORD *)(*(_QWORD *)v1 + 88);
  v4 = *(_QWORD *)(*(_QWORD *)v1 + 96);
  *(_QWORD *)(*(_QWORD *)v1 + 120) = v0;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v2, v3);
  return swift_task_switch();
}

uint64_t sub_23B6DA818()
{
  uint64_t v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint64_t v4;
  uint8_t *v5;
  uint64_t v6;
  uint64_t ObjectType;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t result;
  int64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;

  if ((sub_23B6E0830() & 1) != 0)
    goto LABEL_9;
  if (qword_254300840 != -1)
    swift_once();
  v1 = sub_23B6E0668();
  __swift_project_value_buffer(v1, (uint64_t)qword_254300FE0);
  swift_unknownObjectRetain_n();
  v2 = sub_23B6E0650();
  v3 = sub_23B6E08B4();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = *(_QWORD *)(v0 + 72);
    v5 = (uint8_t *)swift_slowAlloc();
    v6 = swift_slowAlloc();
    v27 = v6;
    *(_DWORD *)v5 = 136446210;
    ObjectType = swift_getObjectType();
    v8 = (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 24))(ObjectType, v4);
    *(_QWORD *)(v0 + 40) = sub_23B6BE8C4(v8, v9, &v27);
    sub_23B6E0920();
    swift_bridgeObjectRelease();
    swift_unknownObjectRelease_n();
    _os_log_impl(&dword_23B6B3000, v2, v3, "*** DEADLOCK *** in startup() for service: %{public}s", v5, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B86B840](v6, -1, -1);
    MEMORY[0x23B86B840](v5, -1, -1);
  }
  else
  {
    swift_unknownObjectRelease_n();
  }

  v10 = *(_QWORD *)(v0 + 72);
  v11 = *(_QWORD *)(v0 + 64);
  v12 = *(_QWORD *)(v0 + 80) + 112;
  swift_beginAccess();
  swift_unknownObjectRetain();
  v13 = sub_23B6DFA1C(v12, v11, v10);
  result = swift_unknownObjectRelease();
  v15 = *(_QWORD *)(*(_QWORD *)v12 + 16);
  if (v15 >= v13)
  {
    v16 = *(_QWORD *)(v0 + 72);
    sub_23B6DFD1C(v13, v15);
    swift_endAccess();
    v17 = swift_getObjectType();
    v18 = *(uint64_t (**)(uint64_t, uint64_t))(v16 + 24);
    v19 = v18(v17, v16);
    v21 = v20;
    v22 = v18(v17, v16);
    v24 = v23;
    sub_23B6DFE8C();
    v25 = (void *)swift_allocError();
    *(_QWORD *)v26 = v22;
    *(_QWORD *)(v26 + 8) = v24;
    *(_BYTE *)(v26 + 16) = 1;
    sub_23B6DAB24(v19, v21, v25);

    swift_bridgeObjectRelease();
LABEL_9:
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  __break(1u);
  return result;
}

uint64_t sub_23B6DAAF0()
{
  uint64_t v0;

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23B6DAB24(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t result;
  uint64_t v13;
  unint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(char *, uint64_t, uint64_t);
  id v22;
  _QWORD v23[3];
  uint64_t v24;
  void *v25;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_254301098);
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = v3 + 128;
  result = swift_beginAccess();
  v13 = *(_QWORD *)(v3 + 128);
  if (*(_QWORD *)(v13 + 16))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v14 = sub_23B6B5E60(a1, a2);
    if ((v15 & 1) != 0)
    {
      v16 = *(_QWORD *)(*(_QWORD *)(v13 + 56) + 8 * v14);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v17 = *(_QWORD *)(v16 + 16);
      if (v17)
      {
        v23[2] = v11;
        v24 = a1;
        v18 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
        v23[1] = v16;
        v19 = v16 + v18;
        v20 = *(_QWORD *)(v8 + 72);
        v21 = *(void (**)(char *, uint64_t, uint64_t))(v8 + 16);
        do
        {
          v21(v10, v19, v7);
          v25 = a3;
          v22 = a3;
          sub_23B6E07B8();
          (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
          v19 += v20;
          --v17;
        }
        while (v17);
        swift_bridgeObjectRelease();
        a1 = v24;
      }
      else
      {
        swift_bridgeObjectRelease();
      }
      swift_beginAccess();
      swift_bridgeObjectRetain();
      sub_23B6DBA24(a1, a2);
      swift_endAccess();
    }
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_23B6DACE0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t ObjectType;
  _QWORD *v6;
  uint64_t (*v8)(uint64_t, uint64_t);

  ObjectType = swift_getObjectType();
  v8 = (uint64_t (*)(uint64_t, uint64_t))(**(int **)(a3 + 56) + *(_QWORD *)(a3 + 56));
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v6;
  *v6 = v3;
  v6[1] = sub_23B6B8F74;
  return v8(ObjectType, a3);
}

uint64_t sub_23B6DAD58(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t result;
  uint64_t v10;
  unint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(char *, uint64_t, uint64_t);
  uint64_t v18;
  uint64_t v19;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_254301098);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = swift_beginAccess();
  v10 = *(_QWORD *)(v2 + 128);
  if (*(_QWORD *)(v10 + 16))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v11 = sub_23B6B5E60(a1, a2);
    if ((v12 & 1) != 0)
    {
      v13 = *(_QWORD *)(*(_QWORD *)(v10 + 56) + 8 * v11);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v14 = *(_QWORD *)(v13 + 16);
      if (v14)
      {
        v18 = v13;
        v19 = a1;
        v15 = v13 + ((*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80));
        v16 = *(_QWORD *)(v6 + 72);
        v17 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 16);
        do
        {
          v17(v8, v15, v5);
          sub_23B6E07C4();
          (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
          v15 += v16;
          --v14;
        }
        while (v14);
        swift_bridgeObjectRelease();
        a1 = v19;
      }
      else
      {
        swift_bridgeObjectRelease();
      }
      swift_beginAccess();
      swift_bridgeObjectRetain();
      sub_23B6DBA24(a1, a2);
      swift_endAccess();
    }
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_23B6DAEFC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t (*v11)();
  unint64_t *v12;
  uint64_t (*v13)();
  unint64_t *v14;
  unint64_t v15;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v17;
  unint64_t v18;
  _QWORD v20[4];
  _BYTE v21[32];

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_254301098);
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8]();
  v10 = (char *)v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_bridgeObjectRetain();
  v11 = sub_23B6D44BC();
  v13 = sub_23B6C710C(v20, a3, a4);
  if (*v12)
  {
    v14 = v12;
    (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, a1, v7);
    v15 = *v14;
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *v14 = v15;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      v15 = sub_23B6C6A18(0, *(_QWORD *)(v15 + 16) + 1, 1, v15);
      *v14 = v15;
    }
    v18 = *(_QWORD *)(v15 + 16);
    v17 = *(_QWORD *)(v15 + 24);
    if (v18 >= v17 >> 1)
    {
      v15 = sub_23B6C6A18(v17 > 1, v18 + 1, 1, v15);
      *v14 = v15;
    }
    *(_QWORD *)(v15 + 16) = v18 + 1;
    (*(void (**)(unint64_t, char *, uint64_t))(v8 + 32))(v15+ ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80))+ *(_QWORD *)(v8 + 72) * v18, v10, v7);
  }
  ((void (*)(_QWORD *, _QWORD))v13)(v20, 0);
  swift_bridgeObjectRelease();
  return ((uint64_t (*)(_BYTE *, _QWORD))v11)(v21, 0);
}

uint64_t sub_23B6DB08C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = sub_23B6E0554();
  __swift_allocate_value_buffer(v0, qword_254301048);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_254301048);
  if (qword_254300FD8 != -1)
    swift_once();
  v2 = __swift_project_value_buffer(v0, (uint64_t)qword_254300FB8);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 - 8) + 16))(v1, v2, v0);
}

uint64_t sub_23B6DB11C(uint64_t a1)
{
  return sub_23B6DB164(a1, qword_254301020);
}

uint64_t sub_23B6DB140(uint64_t a1)
{
  return sub_23B6DB164(a1, qword_254300FF8);
}

uint64_t sub_23B6DB164(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;

  v3 = sub_23B6E0554();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_254300F68);
  __swift_allocate_value_buffer(v7, a2);
  __swift_project_value_buffer(v7, (uint64_t)a2);
  if (qword_254301068 != -1)
    swift_once();
  v8 = __swift_project_value_buffer(v3, (uint64_t)qword_254301048);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v8, v3);
  return sub_23B6E053C();
}

uint64_t sub_23B6DB274()
{
  sub_23B6E0B00();
  swift_bridgeObjectRetain();
  sub_23B6E0710();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_23B6E0710();
  swift_bridgeObjectRelease();
  return sub_23B6E0B18();
}

uint64_t sub_23B6DB2F8()
{
  swift_bridgeObjectRetain();
  sub_23B6E0710();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_23B6E0710();
  return swift_bridgeObjectRelease();
}

uint64_t sub_23B6DB368()
{
  sub_23B6E0B00();
  swift_bridgeObjectRetain();
  sub_23B6E0710();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_23B6E0710();
  swift_bridgeObjectRelease();
  return sub_23B6E0B18();
}

uint64_t sub_23B6DB3E8(_QWORD *a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  BOOL v6;
  char v7;
  uint64_t result;

  v2 = a1[2];
  v3 = a1[3];
  v4 = a2[2];
  v5 = a2[3];
  v6 = *a1 == *a2 && a1[1] == a2[1];
  if (v6 || (v7 = sub_23B6E0A88(), result = 0, (v7 & 1) != 0))
  {
    if (v2 == v4 && v3 == v5)
      return 1;
    else
      return sub_23B6E0A88();
  }
  return result;
}

uint64_t sub_23B6DB478(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v12;

  *(_QWORD *)(v6 + 56) = v5;
  v12 = sub_23B6E09C8();
  *(_QWORD *)(v6 + 64) = v12;
  *(_QWORD *)(v6 + 72) = *(_QWORD *)(v12 - 8);
  *(_QWORD *)(v6 + 80) = swift_task_alloc();
  *(_QWORD *)(v6 + 88) = swift_task_alloc();
  *(_QWORD *)(v6 + 40) = a1;
  *(_QWORD *)(v6 + 48) = a2;
  *(_QWORD *)(v6 + 16) = a3;
  *(_QWORD *)(v6 + 24) = a4;
  *(_BYTE *)(v6 + 32) = a5 & 1;
  return swift_task_switch();
}

uint64_t sub_23B6DB51C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void (*v4)(uint64_t, uint64_t);
  _QWORD *v5;

  v1 = v0[10];
  v2 = v0[8];
  v3 = v0[9];
  sub_23B6E09E0();
  sub_23B6B8FBC(&qword_2543010C0, 255, (uint64_t (*)(uint64_t))MEMORY[0x24BEE6E10], MEMORY[0x24BEE6E20]);
  sub_23B6E0AB8();
  sub_23B6B8FBC(&qword_2543010B8, 255, (uint64_t (*)(uint64_t))MEMORY[0x24BEE6DC8], MEMORY[0x24BEE6E00]);
  sub_23B6E09EC();
  v4 = *(void (**)(uint64_t, uint64_t))(v3 + 8);
  v0[12] = v4;
  v4(v1, v2);
  v5 = (_QWORD *)swift_task_alloc();
  v0[13] = v5;
  *v5 = v0;
  v5[1] = sub_23B6DB63C;
  return sub_23B6E0AC4();
}

uint64_t sub_23B6DB63C()
{
  uint64_t v0;
  uint64_t *v1;
  void (*v2)(uint64_t, uint64_t);
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = *(void (**)(uint64_t, uint64_t))(*v1 + 96);
  v3 = *(_QWORD *)(*v1 + 88);
  v4 = *(_QWORD *)(*v1 + 64);
  v5 = *v1;
  *(_QWORD *)(v5 + 112) = v0;
  swift_task_dealloc();
  v2(v3, v4);
  if (v0)
    return swift_task_switch();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v5 + 8))();
}

uint64_t sub_23B6DB6E8()
{
  uint64_t v0;

  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23B6DB724@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_23B6DB74C(a1, a2, &qword_2543010B0, &qword_254300778, a3);
}

uint64_t sub_23B6DB738@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_23B6DB74C(a1, a2, (uint64_t *)&unk_254300730, (uint64_t *)&unk_254300768, a3);
}

uint64_t sub_23B6DB74C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X2>, uint64_t *a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t *v5;
  uint64_t *v8;
  unint64_t v12;
  char v13;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;
  uint64_t v21;

  v8 = v5;
  swift_bridgeObjectRetain();
  v12 = sub_23B6B5E60(a1, a2);
  LOBYTE(a2) = v13;
  swift_bridgeObjectRelease();
  if ((a2 & 1) != 0)
  {
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v15 = *v8;
    v21 = *v8;
    *v8 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_23B6DDAEC(a3, a4);
      v15 = v21;
    }
    swift_bridgeObjectRelease();
    v16 = *(_QWORD *)(v15 + 56);
    v17 = __swift_instantiateConcreteTypeFromMangledName(a3);
    v18 = *(_QWORD *)(v17 - 8);
    (*(void (**)(uint64_t, unint64_t, uint64_t))(v18 + 32))(a5, v16 + *(_QWORD *)(v18 + 72) * v12, v17);
    sub_23B6DCE34(v12, v15, a3);
    *v8 = v15;
    swift_bridgeObjectRelease();
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v18 + 56))(a5, 0, 1, v17);
  }
  else
  {
    v20 = __swift_instantiateConcreteTypeFromMangledName(a3);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 56))(a5, 1, 1, v20);
  }
}

uint64_t sub_23B6DB890@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_23B6DB74C(a1, a2, (uint64_t *)&unk_254300F30, &qword_254300590, a3);
}

uint64_t sub_23B6DB8A4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_23B6DB74C(a1, a2, (uint64_t *)&unk_254300520, &qword_254300580, a3);
}

uint64_t sub_23B6DB8B8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t *v2;
  uint64_t *v3;
  unint64_t v6;
  char v7;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;
  uint64_t v17;

  v3 = v2;
  swift_bridgeObjectRetain();
  v6 = sub_23B6BF010(a1);
  LOBYTE(a1) = v7;
  swift_bridgeObjectRelease();
  if ((a1 & 1) != 0)
  {
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v9 = *v3;
    v17 = *v3;
    *v3 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_23B6DD2E0();
      v9 = v17;
    }
    v10 = *(_QWORD *)(v9 + 48);
    v11 = sub_23B6E0644();
    (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 8))(v10 + *(_QWORD *)(*(_QWORD *)(v11 - 8) + 72) * v6, v11);
    v12 = *(_QWORD *)(v9 + 56);
    v13 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2543012F0);
    v14 = *(_QWORD *)(v13 - 8);
    (*(void (**)(uint64_t, unint64_t, uint64_t))(v14 + 32))(a2, v12 + *(_QWORD *)(v14 + 72) * v6, v13);
    sub_23B6DC984(v6, v9);
    *v3 = v9;
    swift_bridgeObjectRelease();
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v14 + 56))(a2, 0, 1, v13);
  }
  else
  {
    v16 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2543012F0);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(a2, 1, 1, v16);
  }
}

uint64_t sub_23B6DB9FC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_23B6DB74C(a1, a2, &qword_254300560, (uint64_t *)&unk_254300598, a3);
}

uint64_t sub_23B6DBA10@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_23B6DB74C(a1, a2, &qword_254300540, &qword_254300588, a3);
}

uint64_t sub_23B6DBA24(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t *v3;
  unint64_t v6;
  char v7;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;

  v3 = v2;
  swift_bridgeObjectRetain();
  v6 = sub_23B6B5E60(a1, a2);
  LOBYTE(a2) = v7;
  swift_bridgeObjectRelease();
  if ((a2 & 1) == 0)
    return 0;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v9 = *v3;
  v12 = *v3;
  *v3 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_23B6DD618(&qword_2543010C8);
    v9 = v12;
  }
  swift_bridgeObjectRelease();
  v10 = *(_QWORD *)(*(_QWORD *)(v9 + 56) + 8 * v6);
  sub_23B6DCC60(v6, v9);
  *v3 = v9;
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_23B6DBAF8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_23B6DB74C(a1, a2, (uint64_t *)&unk_254300F00, (uint64_t *)&unk_254300F50, a3);
}

uint64_t sub_23B6DBB0C(uint64_t a1, int a2)
{
  return sub_23B6DC2F4(a1, a2, &qword_2543010B0, &qword_254300778);
}

uint64_t sub_23B6DBB20(uint64_t a1, int a2)
{
  return sub_23B6DC2F4(a1, a2, (uint64_t *)&unk_254300730, (uint64_t *)&unk_254300768);
}

uint64_t sub_23B6DBB34(uint64_t a1, char a2)
{
  return sub_23B6DBFD0(a1, a2, (uint64_t *)&unk_254300758);
}

uint64_t sub_23B6DBB40(uint64_t a1, int a2)
{
  return sub_23B6DC2F4(a1, a2, (uint64_t *)&unk_254300F30, &qword_254300590);
}

uint64_t sub_23B6DBB54(uint64_t a1, int a2)
{
  return sub_23B6DC2F4(a1, a2, (uint64_t *)&unk_254300520, &qword_254300580);
}

uint64_t sub_23B6DBB68(uint64_t a1, char a2)
{
  return sub_23B6DBFD0(a1, a2, &qword_254300570);
}

uint64_t sub_23B6DBB74(uint64_t a1, int a2)
{
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
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
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  int64_t v24;
  _QWORD *v25;
  unint64_t v26;
  int64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  char v35;
  unint64_t v36;
  BOOL v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t v41;
  _BYTE v42[4];
  int v43;
  uint64_t *v44;
  int64_t v45;
  _QWORD *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  _BYTE *v50;
  uint64_t v51;
  uint64_t v52;

  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2543012F0);
  v51 = *(_QWORD *)(v4 - 8);
  v52 = v4;
  MEMORY[0x24BDAC7A8](v4);
  v50 = &v42[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v6 = sub_23B6E0644();
  v49 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v8 = &v42[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v44 = v2;
  v9 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2543009A8);
  v10 = sub_23B6E0A1C();
  v11 = v10;
  if (!*(_QWORD *)(v9 + 16))
  {
    result = swift_release();
    v39 = v44;
LABEL_42:
    *v39 = v11;
    return result;
  }
  v12 = 1 << *(_BYTE *)(v9 + 32);
  v13 = *(_QWORD *)(v9 + 64);
  v46 = (_QWORD *)(v9 + 64);
  if (v12 < 64)
    v14 = ~(-1 << v12);
  else
    v14 = -1;
  v15 = v14 & v13;
  v45 = (unint64_t)(v12 + 63) >> 6;
  v16 = v10 + 64;
  v48 = v9;
  result = swift_retain();
  v18 = 0;
  v43 = a2;
  v19 = 16;
  if ((a2 & 1) != 0)
    v19 = 32;
  v47 = v19;
  v20 = v19;
  while (1)
  {
    if (v15)
    {
      v22 = __clz(__rbit64(v15));
      v15 &= v15 - 1;
      v23 = v22 | (v18 << 6);
      goto LABEL_24;
    }
    v24 = v18 + 1;
    if (__OFADD__(v18, 1))
    {
LABEL_43:
      __break(1u);
      goto LABEL_44;
    }
    if (v24 >= v45)
    {
      v40 = v48;
      swift_release();
      v39 = v44;
      v25 = v46;
      if ((v43 & 1) != 0)
      {
LABEL_37:
        v41 = 1 << *(_BYTE *)(v40 + 32);
        if (v41 >= 64)
          bzero(v25, ((unint64_t)(v41 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
        else
          *v25 = -1 << v41;
        *(_QWORD *)(v40 + 16) = 0;
      }
LABEL_41:
      result = swift_release();
      goto LABEL_42;
    }
    v25 = v46;
    v26 = v46[v24];
    ++v18;
    if (!v26)
    {
      v18 = v24 + 1;
      if (v24 + 1 >= v45)
        goto LABEL_34;
      v26 = v46[v18];
      if (!v26)
        break;
    }
LABEL_23:
    v15 = (v26 - 1) & v26;
    v23 = __clz(__rbit64(v26)) + (v18 << 6);
LABEL_24:
    v28 = v48;
    v29 = *(_QWORD *)(v49 + 72);
    (*(void (**)(_BYTE *, unint64_t, uint64_t))(v49 + v20))(v8, *(_QWORD *)(v48 + 48) + v29 * v23, v6);
    v30 = *(_QWORD *)(v28 + 56);
    v31 = *(_QWORD *)(v51 + 72);
    (*(void (**)(_BYTE *, unint64_t, uint64_t))(v51 + v20))(v50, v30 + v31 * v23, v52);
    sub_23B6B8FBC(&qword_2543012E0, 255, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
    result = sub_23B6E06BC();
    v32 = -1 << *(_BYTE *)(v11 + 32);
    v33 = result & ~v32;
    v34 = v33 >> 6;
    if (((-1 << v33) & ~*(_QWORD *)(v16 + 8 * (v33 >> 6))) != 0)
    {
      v21 = __clz(__rbit64((-1 << v33) & ~*(_QWORD *)(v16 + 8 * (v33 >> 6)))) | v33 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v35 = 0;
      v36 = (unint64_t)(63 - v32) >> 6;
      do
      {
        if (++v34 == v36 && (v35 & 1) != 0)
        {
          __break(1u);
          goto LABEL_43;
        }
        v37 = v34 == v36;
        if (v34 == v36)
          v34 = 0;
        v35 |= v37;
        v38 = *(_QWORD *)(v16 + 8 * v34);
      }
      while (v38 == -1);
      v21 = __clz(__rbit64(~v38)) + (v34 << 6);
    }
    *(_QWORD *)(v16 + ((v21 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v21;
    (*(void (**)(unint64_t, _BYTE *, uint64_t))(v49 + 32))(*(_QWORD *)(v11 + 48) + v29 * v21, v8, v6);
    result = (*(uint64_t (**)(unint64_t, _BYTE *, uint64_t))(v51 + 32))(*(_QWORD *)(v11 + 56) + v31 * v21, v50, v52);
    ++*(_QWORD *)(v11 + 16);
  }
  v27 = v24 + 2;
  if (v27 >= v45)
  {
LABEL_34:
    v40 = v48;
    swift_release();
    v39 = v44;
    if ((v43 & 1) != 0)
      goto LABEL_37;
    goto LABEL_41;
  }
  v26 = v46[v27];
  if (v26)
  {
    v18 = v27;
    goto LABEL_23;
  }
  while (1)
  {
    v18 = v27 + 1;
    if (__OFADD__(v27, 1))
      break;
    if (v18 >= v45)
      goto LABEL_34;
    v26 = v46[v18];
    ++v27;
    if (v26)
      goto LABEL_23;
  }
LABEL_44:
  __break(1u);
  return result;
}

uint64_t sub_23B6DBF7C(uint64_t a1, int a2)
{
  return sub_23B6DC2F4(a1, a2, &qword_254300560, (uint64_t *)&unk_254300598);
}

uint64_t sub_23B6DBF90(uint64_t a1, int a2)
{
  return sub_23B6DC2F4(a1, a2, &qword_254300540, &qword_254300588);
}

uint64_t sub_23B6DBFA4(uint64_t a1, char a2)
{
  return sub_23B6DBFD0(a1, a2, &qword_254300578);
}

uint64_t sub_23B6DBFB0(uint64_t a1, int a2)
{
  return sub_23B6DC2F4(a1, a2, (uint64_t *)&unk_254300F40, &qword_254300F60);
}

uint64_t sub_23B6DBFC4(uint64_t a1, char a2)
{
  return sub_23B6DBFD0(a1, a2, &qword_2543010C8);
}

uint64_t sub_23B6DBFD0(uint64_t a1, char a2, uint64_t *a3)
{
  uint64_t *v3;
  uint64_t *v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
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
  int64_t v35;
  uint64_t v36;
  char v37;

  v4 = v3;
  v6 = *v3;
  __swift_instantiateConcreteTypeFromMangledName(a3);
  v37 = a2;
  v7 = sub_23B6E0A1C();
  v8 = v7;
  if (!*(_QWORD *)(v6 + 16))
    goto LABEL_40;
  v9 = 1 << *(_BYTE *)(v6 + 32);
  v36 = v6 + 64;
  if (v9 < 64)
    v10 = ~(-1 << v9);
  else
    v10 = -1;
  v11 = v10 & *(_QWORD *)(v6 + 64);
  v35 = (unint64_t)(v9 + 63) >> 6;
  v12 = v7 + 64;
  result = swift_retain();
  v14 = 0;
  while (1)
  {
    if (v11)
    {
      v20 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
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
    if (v22 >= v35)
      break;
    v23 = (_QWORD *)(v6 + 64);
    v24 = *(_QWORD *)(v36 + 8 * v22);
    ++v14;
    if (!v24)
    {
      v14 = v22 + 1;
      if (v22 + 1 >= v35)
        goto LABEL_33;
      v24 = *(_QWORD *)(v36 + 8 * v14);
      if (!v24)
      {
        v25 = v22 + 2;
        if (v25 >= v35)
        {
LABEL_33:
          swift_release();
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
            if (v14 >= v35)
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
    v11 = (v24 - 1) & v24;
    v21 = __clz(__rbit64(v24)) + (v14 << 6);
LABEL_31:
    v30 = (uint64_t *)(*(_QWORD *)(v6 + 48) + 16 * v21);
    v32 = *v30;
    v31 = v30[1];
    v33 = *(_QWORD *)(*(_QWORD *)(v6 + 56) + 8 * v21);
    if ((v37 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    sub_23B6E0B00();
    sub_23B6E0710();
    result = sub_23B6E0B18();
    v15 = -1 << *(_BYTE *)(v8 + 32);
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
    v19 = (_QWORD *)(*(_QWORD *)(v8 + 48) + 16 * v18);
    *v19 = v32;
    v19[1] = v31;
    *(_QWORD *)(*(_QWORD *)(v8 + 56) + 8 * v18) = v33;
    ++*(_QWORD *)(v8 + 16);
  }
  swift_release();
  v23 = (_QWORD *)(v6 + 64);
  if ((v37 & 1) == 0)
    goto LABEL_40;
LABEL_36:
  v34 = 1 << *(_BYTE *)(v6 + 32);
  if (v34 >= 64)
    bzero(v23, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v23 = -1 << v34;
  *(_QWORD *)(v6 + 16) = 0;
LABEL_40:
  result = swift_release();
  *v4 = v8;
  return result;
}

uint64_t sub_23B6DC2E0(uint64_t a1, int a2)
{
  return sub_23B6DC2F4(a1, a2, (uint64_t *)&unk_254300F00, (uint64_t *)&unk_254300F50);
}

uint64_t sub_23B6DC2F4(uint64_t a1, int a2, uint64_t *a3, uint64_t *a4)
{
  uint64_t *v4;
  uint64_t *v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t result;
  int64_t v19;
  unint64_t v20;
  _QWORD *v21;
  unint64_t v22;
  unint64_t v23;
  int64_t v24;
  unint64_t v25;
  int64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  unint64_t v36;
  char v37;
  unint64_t v38;
  BOOL v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t *v43;
  int64_t v44;
  _QWORD *v45;
  int v46;
  char *v47;
  uint64_t v48;

  v6 = v4;
  v48 = __swift_instantiateConcreteTypeFromMangledName(a3);
  v8 = *(_QWORD *)(v48 - 8);
  MEMORY[0x24BDAC7A8]();
  v47 = (char *)&v42 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *v4;
  __swift_instantiateConcreteTypeFromMangledName(a4);
  v46 = a2;
  v11 = sub_23B6E0A1C();
  v12 = v11;
  if (*(_QWORD *)(v10 + 16))
  {
    v43 = v4;
    v13 = 1 << *(_BYTE *)(v10 + 32);
    v14 = *(_QWORD *)(v10 + 64);
    v45 = (_QWORD *)(v10 + 64);
    if (v13 < 64)
      v15 = ~(-1 << v13);
    else
      v15 = -1;
    v16 = v15 & v14;
    v44 = (unint64_t)(v13 + 63) >> 6;
    v17 = v11 + 64;
    result = swift_retain();
    v19 = 0;
    while (1)
    {
      if (v16)
      {
        v22 = __clz(__rbit64(v16));
        v16 &= v16 - 1;
        v23 = v22 | (v19 << 6);
      }
      else
      {
        v24 = v19 + 1;
        if (__OFADD__(v19, 1))
        {
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          return result;
        }
        if (v24 >= v44)
          goto LABEL_34;
        v25 = v45[v24];
        ++v19;
        if (!v25)
        {
          v19 = v24 + 1;
          if (v24 + 1 >= v44)
            goto LABEL_34;
          v25 = v45[v19];
          if (!v25)
          {
            v26 = v24 + 2;
            if (v26 >= v44)
            {
LABEL_34:
              swift_release();
              v6 = v43;
              if ((v46 & 1) != 0)
              {
                v41 = 1 << *(_BYTE *)(v10 + 32);
                if (v41 >= 64)
                  bzero(v45, ((unint64_t)(v41 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v45 = -1 << v41;
                *(_QWORD *)(v10 + 16) = 0;
              }
              break;
            }
            v25 = v45[v26];
            if (!v25)
            {
              while (1)
              {
                v19 = v26 + 1;
                if (__OFADD__(v26, 1))
                  goto LABEL_41;
                if (v19 >= v44)
                  goto LABEL_34;
                v25 = v45[v19];
                ++v26;
                if (v25)
                  goto LABEL_21;
              }
            }
            v19 = v26;
          }
        }
LABEL_21:
        v16 = (v25 - 1) & v25;
        v23 = __clz(__rbit64(v25)) + (v19 << 6);
      }
      v27 = *(_QWORD *)(v10 + 56);
      v28 = v10;
      v29 = (uint64_t *)(*(_QWORD *)(v10 + 48) + 16 * v23);
      v31 = *v29;
      v30 = v29[1];
      v32 = *(_QWORD *)(v8 + 72);
      v33 = v27 + v32 * v23;
      if ((v46 & 1) != 0)
      {
        (*(void (**)(char *, uint64_t, uint64_t))(v8 + 32))(v47, v33, v48);
      }
      else
      {
        (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v47, v33, v48);
        swift_bridgeObjectRetain();
      }
      sub_23B6E0B00();
      sub_23B6E0710();
      result = sub_23B6E0B18();
      v34 = -1 << *(_BYTE *)(v12 + 32);
      v35 = result & ~v34;
      v36 = v35 >> 6;
      if (((-1 << v35) & ~*(_QWORD *)(v17 + 8 * (v35 >> 6))) != 0)
      {
        v20 = __clz(__rbit64((-1 << v35) & ~*(_QWORD *)(v17 + 8 * (v35 >> 6)))) | v35 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v37 = 0;
        v38 = (unint64_t)(63 - v34) >> 6;
        do
        {
          if (++v36 == v38 && (v37 & 1) != 0)
          {
            __break(1u);
            goto LABEL_40;
          }
          v39 = v36 == v38;
          if (v36 == v38)
            v36 = 0;
          v37 |= v39;
          v40 = *(_QWORD *)(v17 + 8 * v36);
        }
        while (v40 == -1);
        v20 = __clz(__rbit64(~v40)) + (v36 << 6);
      }
      *(_QWORD *)(v17 + ((v20 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v20;
      v21 = (_QWORD *)(*(_QWORD *)(v12 + 48) + 16 * v20);
      *v21 = v31;
      v21[1] = v30;
      result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v8 + 32))(*(_QWORD *)(v12 + 56) + v32 * v20, v47, v48);
      ++*(_QWORD *)(v12 + 16);
      v10 = v28;
    }
  }
  result = swift_release();
  *v6 = v12;
  return result;
}

uint64_t sub_23B6DC65C(uint64_t a1, char a2)
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
  _QWORD *v19;
  _QWORD *v20;
  unint64_t v21;
  unint64_t v22;
  int64_t v23;
  _QWORD *v24;
  unint64_t v25;
  int64_t v26;
  char v27;
  unint64_t v28;
  BOOL v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t *v39;
  int64_t v40;
  uint64_t v41;
  char v42;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254300198);
  v42 = a2;
  v6 = sub_23B6E0A1C();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_40;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v41 = v5 + 64;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v39 = v2;
  v40 = (unint64_t)(v8 + 63) >> 6;
  v11 = v6 + 64;
  result = swift_retain();
  v13 = 0;
  while (1)
  {
    if (v10)
    {
      v21 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v22 = v21 | (v13 << 6);
      goto LABEL_31;
    }
    v23 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v23 >= v40)
      break;
    v24 = (_QWORD *)(v5 + 64);
    v25 = *(_QWORD *)(v41 + 8 * v23);
    ++v13;
    if (!v25)
    {
      v13 = v23 + 1;
      if (v23 + 1 >= v40)
        goto LABEL_33;
      v25 = *(_QWORD *)(v41 + 8 * v13);
      if (!v25)
      {
        v26 = v23 + 2;
        if (v26 >= v40)
        {
LABEL_33:
          swift_release();
          v3 = v39;
          if ((v42 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v25 = *(_QWORD *)(v41 + 8 * v26);
        if (!v25)
        {
          while (1)
          {
            v13 = v26 + 1;
            if (__OFADD__(v26, 1))
              goto LABEL_42;
            if (v13 >= v40)
              goto LABEL_33;
            v25 = *(_QWORD *)(v41 + 8 * v13);
            ++v26;
            if (v25)
              goto LABEL_30;
          }
        }
        v13 = v26;
      }
    }
LABEL_30:
    v10 = (v25 - 1) & v25;
    v22 = __clz(__rbit64(v25)) + (v13 << 6);
LABEL_31:
    v31 = 16 * v22;
    v32 = (uint64_t *)(*(_QWORD *)(v5 + 48) + v31);
    v34 = *v32;
    v33 = v32[1];
    v35 = (uint64_t *)(*(_QWORD *)(v5 + 56) + v31);
    v36 = *v35;
    v37 = v35[1];
    if ((v42 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    sub_23B6E0B00();
    sub_23B6E0710();
    result = sub_23B6E0B18();
    v14 = -1 << *(_BYTE *)(v7 + 32);
    v15 = result & ~v14;
    v16 = v15 >> 6;
    if (((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      v17 = __clz(__rbit64((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v27 = 0;
      v28 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v28 && (v27 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        v29 = v16 == v28;
        if (v16 == v28)
          v16 = 0;
        v27 |= v29;
        v30 = *(_QWORD *)(v11 + 8 * v16);
      }
      while (v30 == -1);
      v17 = __clz(__rbit64(~v30)) + (v16 << 6);
    }
    *(_QWORD *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    v18 = 16 * v17;
    v19 = (_QWORD *)(*(_QWORD *)(v7 + 48) + v18);
    *v19 = v34;
    v19[1] = v33;
    v20 = (_QWORD *)(*(_QWORD *)(v7 + 56) + v18);
    *v20 = v36;
    v20[1] = v37;
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v3 = v39;
  v24 = (_QWORD *)(v5 + 64);
  if ((v42 & 1) == 0)
    goto LABEL_40;
LABEL_36:
  v38 = 1 << *(_BYTE *)(v5 + 32);
  if (v38 >= 64)
    bzero(v24, ((unint64_t)(v38 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v24 = -1 << v38;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_40:
  result = swift_release();
  *v3 = v7;
  return result;
}

unint64_t sub_23B6DC984(int64_t a1, uint64_t a2)
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
  int64_t v24;
  int64_t v25;
  unint64_t v26;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  BOOL v32;
  uint64_t v33;
  uint64_t v34;
  void (*v35)(char *, unint64_t, uint64_t);
  unint64_t v36;
  uint64_t v37;

  v4 = sub_23B6E0644();
  v37 = *(_QWORD *)(v4 - 8);
  result = MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v34 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = a2 + 64;
  v9 = -1 << *(_BYTE *)(a2 + 32);
  v10 = (a1 + 1) & ~v9;
  if (((1 << v10) & *(_QWORD *)(a2 + 64 + 8 * (v10 >> 6))) != 0)
  {
    v11 = ~v9;
    result = sub_23B6E0938();
    if ((*(_QWORD *)(v8 + 8 * (v10 >> 6)) & (1 << v10)) != 0)
    {
      v36 = (result + 1) & v11;
      v12 = *(_QWORD *)(v37 + 72);
      v35 = *(void (**)(char *, unint64_t, uint64_t))(v37 + 16);
      v13 = v11;
      do
      {
        v14 = v8;
        v15 = v12;
        v16 = v12 * v10;
        v17 = v13;
        v35(v7, *(_QWORD *)(a2 + 48) + v12 * v10, v4);
        sub_23B6B8FBC(&qword_2543012E0, 255, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
        v18 = sub_23B6E06BC();
        result = (*(uint64_t (**)(char *, uint64_t))(v37 + 8))(v7, v4);
        v13 = v17;
        v19 = v18 & v17;
        if (a1 >= (uint64_t)v36)
        {
          if (v19 >= v36 && a1 >= (uint64_t)v19)
          {
LABEL_16:
            v8 = v14;
            if (v15 * a1 < v16
              || *(_QWORD *)(a2 + 48) + v15 * a1 >= (unint64_t)(*(_QWORD *)(a2 + 48) + v16 + v15))
            {
              swift_arrayInitWithTakeFrontToBack();
            }
            else if (v15 * a1 != v16)
            {
              swift_arrayInitWithTakeBackToFront();
            }
            v22 = *(_QWORD *)(a2 + 56);
            v23 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2543012F0) - 8)
                            + 72);
            v24 = v23 * a1;
            result = v22 + v23 * a1;
            v25 = v23 * v10;
            v26 = v22 + v23 * v10 + v23;
            if (v24 < v25 || result >= v26)
            {
              result = swift_arrayInitWithTakeFrontToBack();
              a1 = v10;
              v13 = v17;
            }
            else
            {
              a1 = v10;
              v13 = v17;
              if (v24 != v25)
              {
                result = swift_arrayInitWithTakeBackToFront();
                v13 = v17;
                a1 = v10;
              }
            }
            goto LABEL_5;
          }
        }
        else if (v19 >= v36 || a1 >= (uint64_t)v19)
        {
          goto LABEL_16;
        }
        v8 = v14;
LABEL_5:
        v10 = (v10 + 1) & v13;
        v12 = v15;
      }
      while (((*(_QWORD *)(v8 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0);
    }
    v28 = (uint64_t *)(v8 + 8 * ((unint64_t)a1 >> 6));
    v29 = *v28;
    v30 = (-1 << a1) - 1;
  }
  else
  {
    v28 = (uint64_t *)(v8 + 8 * ((unint64_t)a1 >> 6));
    v30 = *v28;
    v29 = (-1 << a1) - 1;
  }
  *v28 = v30 & v29;
  v31 = *(_QWORD *)(a2 + 16);
  v32 = __OFSUB__(v31, 1);
  v33 = v31 - 1;
  if (v32)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v33;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_23B6DCC60(unint64_t result, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  _OWORD *v12;
  _OWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  BOOL v21;
  uint64_t v22;

  v3 = result;
  v4 = a2 + 64;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    result = sub_23B6E0938();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      do
      {
        sub_23B6E0B00();
        swift_bridgeObjectRetain();
        sub_23B6E0710();
        v9 = sub_23B6E0B18();
        result = swift_bridgeObjectRelease();
        v10 = v9 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v10 < v8)
            goto LABEL_5;
        }
        else if (v10 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v10)
        {
LABEL_11:
          v11 = *(_QWORD *)(a2 + 48);
          v12 = (_OWORD *)(v11 + 16 * v3);
          v13 = (_OWORD *)(v11 + 16 * v6);
          if (v3 != v6 || v12 >= v13 + 1)
            *v12 = *v13;
          v14 = *(_QWORD *)(a2 + 56);
          v15 = (_QWORD *)(v14 + 8 * v3);
          v16 = (_QWORD *)(v14 + 8 * v6);
          if (v3 != v6 || (v3 = v6, v15 >= v16 + 1))
          {
            *v15 = *v16;
            v3 = v6;
          }
        }
LABEL_5:
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    v17 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v18 = *v17;
    v19 = (-1 << v3) - 1;
  }
  else
  {
    v17 = (uint64_t *)(v4 + 8 * (result >> 6));
    v19 = *v17;
    v18 = (-1 << result) - 1;
  }
  *v17 = v19 & v18;
  v20 = *(_QWORD *)(a2 + 16);
  v21 = __OFSUB__(v20, 1);
  v22 = v20 - 1;
  if (v21)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v22;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_23B6DCE34(unint64_t result, uint64_t a2, uint64_t *a3)
{
  int64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  _OWORD *v14;
  _OWORD *v15;
  uint64_t v16;
  uint64_t v17;
  int64_t v18;
  int64_t v19;
  unint64_t v20;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  BOOL v26;
  uint64_t v27;

  v4 = result;
  v5 = a2 + 64;
  v6 = -1 << *(_BYTE *)(a2 + 32);
  v7 = (result + 1) & ~v6;
  if (((1 << v7) & *(_QWORD *)(a2 + 64 + 8 * (v7 >> 6))) != 0)
  {
    v9 = ~v6;
    result = sub_23B6E0938();
    if ((*(_QWORD *)(v5 + 8 * (v7 >> 6)) & (1 << v7)) != 0)
    {
      v10 = (result + 1) & v9;
      while (1)
      {
        sub_23B6E0B00();
        swift_bridgeObjectRetain();
        sub_23B6E0710();
        v11 = sub_23B6E0B18();
        result = swift_bridgeObjectRelease();
        v12 = v11 & v9;
        if (v4 >= (uint64_t)v10)
          break;
        if (v12 < v10)
          goto LABEL_11;
LABEL_12:
        v13 = *(_QWORD *)(a2 + 48);
        v14 = (_OWORD *)(v13 + 16 * v4);
        v15 = (_OWORD *)(v13 + 16 * v7);
        if (v4 != v7 || v14 >= v15 + 1)
          *v14 = *v15;
        v16 = *(_QWORD *)(a2 + 56);
        v17 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(a3) - 8) + 72);
        v18 = v17 * v4;
        result = v16 + v17 * v4;
        v19 = v17 * v7;
        v20 = v16 + v17 * v7 + v17;
        if (v18 < v19 || result >= v20)
        {
          result = swift_arrayInitWithTakeFrontToBack();
        }
        else
        {
          v4 = v7;
          if (v18 == v19)
            goto LABEL_6;
          result = swift_arrayInitWithTakeBackToFront();
        }
        v4 = v7;
LABEL_6:
        v7 = (v7 + 1) & v9;
        if (((*(_QWORD *)(v5 + ((v7 >> 3) & 0xFFFFFFFFFFFFF8)) >> v7) & 1) == 0)
          goto LABEL_21;
      }
      if (v12 < v10)
        goto LABEL_6;
LABEL_11:
      if (v4 < (uint64_t)v12)
        goto LABEL_6;
      goto LABEL_12;
    }
LABEL_21:
    v22 = (uint64_t *)(v5 + 8 * ((unint64_t)v4 >> 6));
    v23 = *v22;
    v24 = (-1 << v4) - 1;
  }
  else
  {
    v22 = (uint64_t *)(v5 + 8 * (result >> 6));
    v24 = *v22;
    v23 = (-1 << result) - 1;
  }
  *v22 = v24 & v23;
  v25 = *(_QWORD *)(a2 + 16);
  v26 = __OFSUB__(v25, 1);
  v27 = v25 - 1;
  if (v26)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v27;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

uint64_t sub_23B6DD03C(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  return sub_23B6DD198(a1, a2, a3, a4, a5, &qword_2543010B0);
}

uint64_t sub_23B6DD048(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  return sub_23B6DD198(a1, a2, a3, a4, a5, (uint64_t *)&unk_254300730);
}

uint64_t sub_23B6DD058(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  return sub_23B6DD198(a1, a2, a3, a4, a5, (uint64_t *)&unk_254300F30);
}

uint64_t sub_23B6DD064(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  return sub_23B6DD198(a1, a2, a3, a4, a5, (uint64_t *)&unk_254300520);
}

uint64_t sub_23B6DD070(unint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;

  a4[(a1 >> 6) + 8] |= 1 << a1;
  v8 = a4[6];
  v9 = sub_23B6E0644();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v8 + *(_QWORD *)(*(_QWORD *)(v9 - 8) + 72) * a1, a2, v9);
  v10 = a4[7];
  v11 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2543012F0);
  result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(v10 + *(_QWORD *)(*(_QWORD *)(v11 - 8) + 72) * a1, a3, v11);
  v13 = a4[2];
  v14 = __OFADD__(v13, 1);
  v15 = v13 + 1;
  if (v14)
    __break(1u);
  else
    a4[2] = v15;
  return result;
}

uint64_t sub_23B6DD12C(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  return sub_23B6DD198(a1, a2, a3, a4, a5, &qword_254300560);
}

uint64_t sub_23B6DD138(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  return sub_23B6DD198(a1, a2, a3, a4, a5, &qword_254300540);
}

unint64_t sub_23B6DD144(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  _QWORD *v5;
  uint64_t v6;
  BOOL v7;
  uint64_t v8;

  a5[(result >> 6) + 8] |= 1 << result;
  v5 = (_QWORD *)(a5[6] + 16 * result);
  *v5 = a2;
  v5[1] = a3;
  *(_QWORD *)(a5[7] + 8 * result) = a4;
  v6 = a5[2];
  v7 = __OFADD__(v6, 1);
  v8 = v6 + 1;
  if (v7)
    __break(1u);
  else
    a5[2] = v8;
  return result;
}

uint64_t sub_23B6DD18C(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  return sub_23B6DD198(a1, a2, a3, a4, a5, (uint64_t *)&unk_254300F00);
}

uint64_t sub_23B6DD198(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5, uint64_t *a6)
{
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;

  a5[(a1 >> 6) + 8] |= 1 << a1;
  v9 = (_QWORD *)(a5[6] + 16 * a1);
  *v9 = a2;
  v9[1] = a3;
  v10 = a5[7];
  v11 = __swift_instantiateConcreteTypeFromMangledName(a6);
  result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(v10 + *(_QWORD *)(*(_QWORD *)(v11 - 8) + 72) * a1, a4, v11);
  v13 = a5[2];
  v14 = __OFADD__(v13, 1);
  v15 = v13 + 1;
  if (v14)
    __break(1u);
  else
    a5[2] = v15;
  return result;
}

unint64_t sub_23B6DD228(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, _QWORD *a6)
{
  _QWORD *v6;
  _QWORD *v7;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;

  a6[(result >> 6) + 8] |= 1 << result;
  v6 = (_QWORD *)(a6[6] + 16 * result);
  *v6 = a2;
  v6[1] = a3;
  v7 = (_QWORD *)(a6[7] + 16 * result);
  *v7 = a4;
  v7[1] = a5;
  v8 = a6[2];
  v9 = __OFADD__(v8, 1);
  v10 = v8 + 1;
  if (v9)
    __break(1u);
  else
    a6[2] = v10;
  return result;
}

void *sub_23B6DD278()
{
  return sub_23B6DDAEC(&qword_2543010B0, &qword_254300778);
}

void *sub_23B6DD28C()
{
  return sub_23B6DDAEC((uint64_t *)&unk_254300730, (uint64_t *)&unk_254300768);
}

void *sub_23B6DD2A0()
{
  return sub_23B6DD618((uint64_t *)&unk_254300758);
}

void *sub_23B6DD2AC()
{
  return sub_23B6DDAEC((uint64_t *)&unk_254300F30, &qword_254300590);
}

void *sub_23B6DD2C0()
{
  return sub_23B6DDAEC((uint64_t *)&unk_254300520, &qword_254300580);
}

void *sub_23B6DD2D4()
{
  return sub_23B6DD618(&qword_254300570);
}

char *sub_23B6DD2E0()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *result;
  char *v8;
  unint64_t v9;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  char *v26;
  int64_t v27;
  unint64_t v28;
  int64_t v29;
  int64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  int64_t v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  int64_t v44;

  v41 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2543012F0);
  v37 = *(_QWORD *)(v41 - 8);
  MEMORY[0x24BDAC7A8](v41);
  v40 = (char *)&v33 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v39 = sub_23B6E0644();
  v36 = *(_QWORD *)(v39 - 8);
  MEMORY[0x24BDAC7A8](v39);
  v38 = (char *)&v33 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2543009A8);
  v33 = v0;
  v3 = *v0;
  v4 = sub_23B6E0A10();
  v5 = *(_QWORD *)(v3 + 16);
  v43 = v4;
  if (!v5)
  {
    result = (char *)swift_release();
    v32 = v43;
    v31 = v33;
LABEL_25:
    *v31 = v32;
    return result;
  }
  v6 = v4;
  result = (char *)(v4 + 64);
  v8 = (char *)(v3 + 64);
  v9 = (unint64_t)((1 << *(_BYTE *)(v6 + 32)) + 63) >> 6;
  v34 = v3 + 64;
  if (v6 != v3 || result >= &v8[8 * v9])
  {
    result = (char *)memmove(result, v8, 8 * v9);
    v6 = v43;
  }
  v10 = 0;
  *(_QWORD *)(v6 + 16) = *(_QWORD *)(v3 + 16);
  v11 = 1 << *(_BYTE *)(v3 + 32);
  v42 = v3;
  v12 = -1;
  if (v11 < 64)
    v12 = ~(-1 << v11);
  v13 = v12 & *(_QWORD *)(v3 + 64);
  v35 = (unint64_t)(v11 + 63) >> 6;
  v14 = v36;
  v15 = v37;
  v17 = v38;
  v16 = v39;
  v18 = v41;
  v19 = v43;
  while (1)
  {
    if (v13)
    {
      v20 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      v44 = v10;
      v21 = v20 | (v10 << 6);
      v22 = v42;
      goto LABEL_9;
    }
    v27 = v10 + 1;
    v22 = v42;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v27 >= v35)
      goto LABEL_23;
    v28 = *(_QWORD *)(v34 + 8 * v27);
    v29 = v10 + 1;
    if (!v28)
    {
      v29 = v27 + 1;
      if (v27 + 1 >= v35)
        goto LABEL_23;
      v28 = *(_QWORD *)(v34 + 8 * v29);
      if (!v28)
        break;
    }
LABEL_22:
    v13 = (v28 - 1) & v28;
    v44 = v29;
    v21 = __clz(__rbit64(v28)) + (v29 << 6);
LABEL_9:
    v23 = *(_QWORD *)(v14 + 72) * v21;
    (*(void (**)(char *, unint64_t, uint64_t))(v14 + 16))(v17, *(_QWORD *)(v22 + 48) + v23, v16);
    v24 = *(_QWORD *)(v15 + 72) * v21;
    v25 = *(_QWORD *)(v22 + 56) + v24;
    v26 = v40;
    (*(void (**)(char *, unint64_t, uint64_t))(v15 + 16))(v40, v25, v18);
    (*(void (**)(unint64_t, char *, uint64_t))(v14 + 32))(*(_QWORD *)(v19 + 48) + v23, v17, v16);
    result = (char *)(*(uint64_t (**)(unint64_t, char *, uint64_t))(v15 + 32))(*(_QWORD *)(v19 + 56) + v24, v26, v18);
    v10 = v44;
  }
  v30 = v27 + 2;
  if (v30 >= v35)
  {
LABEL_23:
    result = (char *)swift_release();
    v31 = v33;
    v32 = v43;
    goto LABEL_25;
  }
  v28 = *(_QWORD *)(v34 + 8 * v30);
  if (v28)
  {
    v29 = v30;
    goto LABEL_22;
  }
  while (1)
  {
    v29 = v30 + 1;
    if (__OFADD__(v30, 1))
      break;
    if (v29 >= v35)
      goto LABEL_23;
    v28 = *(_QWORD *)(v34 + 8 * v29);
    ++v30;
    if (v28)
      goto LABEL_22;
  }
LABEL_27:
  __break(1u);
  return result;
}

void *sub_23B6DD5C4()
{
  return sub_23B6DDAEC(&qword_254300560, (uint64_t *)&unk_254300598);
}

void *sub_23B6DD5D8()
{
  return sub_23B6DDAEC(&qword_254300540, &qword_254300588);
}

void *sub_23B6DD5EC()
{
  return sub_23B6DD618(&qword_254300578);
}

void *sub_23B6DD5F8()
{
  return sub_23B6DDAEC((uint64_t *)&unk_254300F40, &qword_254300F60);
}

void *sub_23B6DD60C()
{
  return sub_23B6DD618(&qword_2543010C8);
}

void *sub_23B6DD618(uint64_t *a1)
{
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *result;
  uint64_t v7;
  unint64_t v8;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  int64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  int64_t v23;
  unint64_t v24;
  int64_t v25;

  v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(a1);
  v3 = *v1;
  v4 = sub_23B6E0A10();
  v5 = v4;
  if (!*(_QWORD *)(v3 + 16))
  {
LABEL_26:
    result = (void *)swift_release();
    *v2 = v5;
    return result;
  }
  result = (void *)(v4 + 64);
  v7 = v3 + 64;
  v8 = (unint64_t)((1 << *(_BYTE *)(v5 + 32)) + 63) >> 6;
  if (v5 != v3 || (unint64_t)result >= v3 + 64 + 8 * v8)
    result = memmove(result, (const void *)(v3 + 64), 8 * v8);
  v10 = 0;
  *(_QWORD *)(v5 + 16) = *(_QWORD *)(v3 + 16);
  v11 = 1 << *(_BYTE *)(v3 + 32);
  v12 = -1;
  if (v11 < 64)
    v12 = ~(-1 << v11);
  v13 = v12 & *(_QWORD *)(v3 + 64);
  v14 = (unint64_t)(v11 + 63) >> 6;
  while (1)
  {
    if (v13)
    {
      v15 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      v16 = v15 | (v10 << 6);
      goto LABEL_12;
    }
    v23 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v23 >= v14)
      goto LABEL_26;
    v24 = *(_QWORD *)(v7 + 8 * v23);
    ++v10;
    if (!v24)
    {
      v10 = v23 + 1;
      if (v23 + 1 >= v14)
        goto LABEL_26;
      v24 = *(_QWORD *)(v7 + 8 * v10);
      if (!v24)
        break;
    }
LABEL_25:
    v13 = (v24 - 1) & v24;
    v16 = __clz(__rbit64(v24)) + (v10 << 6);
LABEL_12:
    v17 = 16 * v16;
    v18 = (_QWORD *)(*(_QWORD *)(v3 + 48) + 16 * v16);
    v19 = v18[1];
    v20 = 8 * v16;
    v21 = *(_QWORD *)(*(_QWORD *)(v3 + 56) + v20);
    v22 = (_QWORD *)(*(_QWORD *)(v5 + 48) + v17);
    *v22 = *v18;
    v22[1] = v19;
    *(_QWORD *)(*(_QWORD *)(v5 + 56) + v20) = v21;
    swift_bridgeObjectRetain();
    result = (void *)swift_bridgeObjectRetain();
  }
  v25 = v23 + 2;
  if (v25 >= v14)
    goto LABEL_26;
  v24 = *(_QWORD *)(v7 + 8 * v25);
  if (v24)
  {
    v10 = v25;
    goto LABEL_25;
  }
  while (1)
  {
    v10 = v25 + 1;
    if (__OFADD__(v25, 1))
      break;
    if (v10 >= v14)
      goto LABEL_26;
    v24 = *(_QWORD *)(v7 + 8 * v10);
    ++v25;
    if (v24)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t type metadata accessor for ActorServiceCollection()
{
  return objc_opt_self();
}

uint64_t sub_23B6DD7E4(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;

  v6 = v2[2];
  v7 = v2[3];
  v8 = v2[4];
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v9;
  *v9 = v3;
  v9[1] = sub_23B6B77B8;
  return sub_23B6D5734(a1, a2, v6, v7, v8);
}

uint64_t method lookup function for ActorServiceCollection()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of ActorServiceCollection.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 216))();
}

uint64_t dispatch thunk of ActorServiceCollection.set(initialServices:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 224))();
}

uint64_t dispatch thunk of ActorServiceCollection.startup()()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t (*v4)(void);

  v4 = (uint64_t (*)(void))(**(int **)(*(_QWORD *)v0 + 248) + *(_QWORD *)(*(_QWORD *)v0 + 248));
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v2;
  *v2 = v1;
  v2[1] = sub_23B6B77B8;
  return v4();
}

uint64_t destroy for StartupDependency()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *initializeWithCopy for StartupDependency(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for StartupDependency(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
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

_QWORD *assignWithTake for StartupDependency(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for StartupDependency(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for StartupDependency(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for StartupDependency()
{
  return &type metadata for StartupDependency;
}

unint64_t sub_23B6DDA94()
{
  unint64_t result;

  result = qword_254300790;
  if (!qword_254300790)
  {
    result = MEMORY[0x23B86B7BC](&unk_23B6E1F94, &type metadata for StartupDependency);
    atomic_store(result, (unint64_t *)&qword_254300790);
  }
  return result;
}

void *sub_23B6DDAD8()
{
  return sub_23B6DDAEC((uint64_t *)&unk_254300F00, (uint64_t *)&unk_254300F50);
}

void *sub_23B6DDAEC(uint64_t *a1, uint64_t *a2)
{
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *result;
  unint64_t v12;
  int64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  int64_t v28;
  unint64_t v29;
  int64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  int64_t v36;
  uint64_t v37;
  uint64_t v38;

  v37 = __swift_instantiateConcreteTypeFromMangledName(a1);
  v4 = *(_QWORD *)(v37 - 8);
  MEMORY[0x24BDAC7A8]();
  v6 = (char *)&v33 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(a2);
  v34 = v2;
  v7 = *v2;
  v8 = sub_23B6E0A10();
  v9 = *(_QWORD *)(v7 + 16);
  v38 = v8;
  if (!v9)
  {
    result = (void *)swift_release();
    v32 = v38;
    v31 = v34;
LABEL_28:
    *v31 = v32;
    return result;
  }
  v10 = v8;
  result = (void *)(v8 + 64);
  v12 = (unint64_t)((1 << *(_BYTE *)(v10 + 32)) + 63) >> 6;
  if (v10 != v7 || (unint64_t)result >= v7 + 64 + 8 * v12)
  {
    result = memmove(result, (const void *)(v7 + 64), 8 * v12);
    v10 = v38;
  }
  v35 = v7 + 64;
  v14 = 0;
  *(_QWORD *)(v10 + 16) = *(_QWORD *)(v7 + 16);
  v15 = 1 << *(_BYTE *)(v7 + 32);
  v16 = -1;
  if (v15 < 64)
    v16 = ~(-1 << v15);
  v17 = v16 & *(_QWORD *)(v7 + 64);
  v36 = (unint64_t)(v15 + 63) >> 6;
  v18 = v37;
  while (1)
  {
    if (v17)
    {
      v19 = __clz(__rbit64(v17));
      v17 &= v17 - 1;
      v20 = v19 | (v14 << 6);
      goto LABEL_12;
    }
    v28 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v28 >= v36)
      goto LABEL_26;
    v29 = *(_QWORD *)(v35 + 8 * v28);
    ++v14;
    if (!v29)
    {
      v14 = v28 + 1;
      if (v28 + 1 >= v36)
        goto LABEL_26;
      v29 = *(_QWORD *)(v35 + 8 * v14);
      if (!v29)
        break;
    }
LABEL_25:
    v17 = (v29 - 1) & v29;
    v20 = __clz(__rbit64(v29)) + (v14 << 6);
LABEL_12:
    v21 = 16 * v20;
    v22 = (uint64_t *)(*(_QWORD *)(v7 + 48) + 16 * v20);
    v24 = *v22;
    v23 = v22[1];
    v25 = *(_QWORD *)(v4 + 72) * v20;
    (*(void (**)(char *, unint64_t, uint64_t))(v4 + 16))(v6, *(_QWORD *)(v7 + 56) + v25, v18);
    v26 = v38;
    v27 = (_QWORD *)(*(_QWORD *)(v38 + 48) + v21);
    *v27 = v24;
    v27[1] = v23;
    (*(void (**)(unint64_t, char *, uint64_t))(v4 + 32))(*(_QWORD *)(v26 + 56) + v25, v6, v18);
    result = (void *)swift_bridgeObjectRetain();
  }
  v30 = v28 + 2;
  if (v30 >= v36)
  {
LABEL_26:
    result = (void *)swift_release();
    v31 = v34;
    v32 = v38;
    goto LABEL_28;
  }
  v29 = *(_QWORD *)(v35 + 8 * v30);
  if (v29)
  {
    v14 = v30;
    goto LABEL_25;
  }
  while (1)
  {
    v14 = v30 + 1;
    if (__OFADD__(v30, 1))
      break;
    if (v14 >= v36)
      goto LABEL_26;
    v29 = *(_QWORD *)(v35 + 8 * v14);
    ++v30;
    if (v29)
      goto LABEL_25;
  }
LABEL_30:
  __break(1u);
  return result;
}

void *sub_23B6DDD44()
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
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  _QWORD *v24;
  int64_t v25;
  unint64_t v26;
  int64_t v27;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254300198);
  v2 = *v0;
  v3 = sub_23B6E0A10();
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
    v25 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v25 >= v13)
      goto LABEL_26;
    v26 = *(_QWORD *)(v6 + 8 * v25);
    ++v9;
    if (!v26)
    {
      v9 = v25 + 1;
      if (v25 + 1 >= v13)
        goto LABEL_26;
      v26 = *(_QWORD *)(v6 + 8 * v9);
      if (!v26)
        break;
    }
LABEL_25:
    v12 = (v26 - 1) & v26;
    v15 = __clz(__rbit64(v26)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (uint64_t *)(*(_QWORD *)(v2 + 48) + v16);
    v19 = *v17;
    v18 = v17[1];
    v20 = (uint64_t *)(*(_QWORD *)(v2 + 56) + v16);
    v21 = *v20;
    v22 = v20[1];
    v23 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v23 = v19;
    v23[1] = v18;
    v24 = (_QWORD *)(*(_QWORD *)(v4 + 56) + v16);
    *v24 = v21;
    v24[1] = v22;
    swift_bridgeObjectRetain();
    result = (void *)swift_bridgeObjectRetain();
  }
  v27 = v25 + 2;
  if (v27 >= v13)
    goto LABEL_26;
  v26 = *(_QWORD *)(v6 + 8 * v27);
  if (v26)
  {
    v9 = v27;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v27 + 1;
    if (__OFADD__(v27, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v26 = *(_QWORD *)(v6 + 8 * v9);
    ++v27;
    if (v26)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_23B6DDEFC()
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23B6DDF30(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;

  v4 = *(_QWORD *)(v1 + 48);
  v5 = swift_task_alloc();
  v6 = *(_OWORD *)(v1 + 32);
  *(_QWORD *)(v2 + 16) = v5;
  *(_QWORD *)v5 = v2;
  *(_QWORD *)(v5 + 8) = sub_23B6B77B8;
  *(_QWORD *)(v5 + 56) = v4;
  *(_OWORD *)(v5 + 40) = v6;
  *(_QWORD *)(v5 + 32) = a1;
  return swift_task_switch();
}

uint64_t sub_23B6DDFA8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  _QWORD *v5;

  v2 = *(_QWORD *)(v0 + 24);
  v3 = *(_QWORD *)(v0 + 32);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v4;
  *v4 = v1;
  v4[1] = sub_23B6B77B8;
  v5 = (_QWORD *)swift_task_alloc();
  v4[2] = v5;
  *v5 = v4;
  v5[1] = sub_23B6B77B8;
  return sub_23B6D5C48(v2, v3);
}

uint64_t sub_23B6DE028()
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23B6DE05C(uint64_t a1)
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
  v11[1] = sub_23B6B8F74;
  return sub_23B6DA6AC(a1, v4, v5, v6, v7, v8, v9, v10);
}

uint64_t sub_23B6DE0FC()
{
  swift_unknownObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_23B6DE120(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;

  v5 = *(_QWORD *)(v1 + 16);
  v4 = *(_QWORD *)(v1 + 24);
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v6;
  *v6 = v2;
  v6[1] = sub_23B6B77B8;
  return sub_23B6DACE0(a1, v5, v4);
}

uint64_t sub_23B6DE184(uint64_t *a1, uint64_t a2, uint64_t a3)
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
  sub_23B6E0B00();
  swift_bridgeObjectRetain();
  sub_23B6E0710();
  v8 = sub_23B6E0B18();
  v9 = -1 << *(_BYTE *)(v7 + 32);
  v10 = v8 & ~v9;
  if (((*(_QWORD *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0)
  {
    v11 = *(_QWORD *)(v7 + 48);
    v12 = (_QWORD *)(v11 + 16 * v10);
    v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_23B6E0A88() & 1) != 0)
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
      if (v19 || (sub_23B6E0A88() & 1) != 0)
        goto LABEL_7;
    }
  }
  swift_bridgeObjectRelease();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v21 = *v3;
  *v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_23B6DEB68(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_23B6DE330(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t *v5;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  BOOL v20;
  BOOL v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t result;
  char isUniquelyReferenced_nonNull_native;
  uint64_t *v28;
  uint64_t v30;

  v10 = *v5;
  sub_23B6E0B00();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_23B6E0710();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_23B6E0710();
  swift_bridgeObjectRelease();
  v11 = sub_23B6E0B18();
  v12 = -1 << *(_BYTE *)(v10 + 32);
  v13 = v11 & ~v12;
  v14 = v10 + 56;
  if (((*(_QWORD *)(v10 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFF8)) >> v13) & 1) != 0)
  {
    v15 = ~v12;
    v16 = *(_QWORD *)(v10 + 48);
    while (1)
    {
      v17 = (_QWORD *)(v16 + 32 * v13);
      v18 = v17[2];
      v19 = v17[3];
      v20 = *v17 == a2 && v17[1] == a3;
      if (v20 || (sub_23B6E0A88() & 1) != 0)
      {
        v21 = v18 == a4 && v19 == a5;
        if (v21 || (sub_23B6E0A88() & 1) != 0)
          break;
      }
      v13 = (v13 + 1) & v15;
      if (((*(_QWORD *)(v14 + ((v13 >> 3) & 0xFFFFFFFFFFFFF8)) >> v13) & 1) == 0)
        goto LABEL_15;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v22 = (uint64_t *)(*(_QWORD *)(*v28 + 48) + 32 * v13);
    v23 = v22[1];
    v24 = v22[2];
    v25 = v22[3];
    *a1 = *v22;
    a1[1] = v23;
    a1[2] = v24;
    a1[3] = v25;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    return 0;
  }
  else
  {
LABEL_15:
    swift_bridgeObjectRelease();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v30 = *v28;
    *v28 = 0x8000000000000000;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_23B6DED00(a2, a3, a4, a5, v13, isUniquelyReferenced_nonNull_native);
    *v28 = v30;
    swift_bridgeObjectRelease();
    *a1 = a2;
    a1[1] = a3;
    result = 1;
    a1[2] = a4;
    a1[3] = a5;
  }
  return result;
}

uint64_t sub_23B6DE554()
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_256A47060);
  v3 = sub_23B6E0974();
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
      sub_23B6E0B00();
      sub_23B6E0710();
      result = sub_23B6E0B18();
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

uint64_t sub_23B6DE830()
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
  _QWORD *v12;
  unint64_t v13;
  unint64_t v14;
  int64_t v15;
  unint64_t v16;
  int64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
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
  int64_t v32;
  _QWORD *v33;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254300798);
  v3 = sub_23B6E0974();
  v4 = v3;
  if (*(_QWORD *)(v2 + 16))
  {
    v5 = 1 << *(_BYTE *)(v2 + 32);
    v33 = (_QWORD *)(v2 + 56);
    if (v5 < 64)
      v6 = ~(-1 << v5);
    else
      v6 = -1;
    v7 = v6 & *(_QWORD *)(v2 + 56);
    v32 = (unint64_t)(v5 + 63) >> 6;
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
        if (v15 >= v32)
          goto LABEL_33;
        v16 = v33[v15];
        ++v10;
        if (!v16)
        {
          v10 = v15 + 1;
          if (v15 + 1 >= v32)
            goto LABEL_33;
          v16 = v33[v10];
          if (!v16)
          {
            v10 = v15 + 2;
            if (v15 + 2 >= v32)
              goto LABEL_33;
            v16 = v33[v10];
            if (!v16)
            {
              v17 = v15 + 3;
              if (v17 >= v32)
              {
LABEL_33:
                swift_release();
                v1 = v0;
                v31 = 1 << *(_BYTE *)(v2 + 32);
                if (v31 > 63)
                  bzero(v33, ((unint64_t)(v31 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v33 = -1 << v31;
                *(_QWORD *)(v2 + 16) = 0;
                break;
              }
              v16 = v33[v17];
              if (!v16)
              {
                while (1)
                {
                  v10 = v17 + 1;
                  if (__OFADD__(v17, 1))
                    goto LABEL_39;
                  if (v10 >= v32)
                    goto LABEL_33;
                  v16 = v33[v10];
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
      v19 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 32 * v14);
      v20 = *v19;
      v21 = v19[1];
      v22 = v19[2];
      v23 = v19[3];
      sub_23B6E0B00();
      swift_bridgeObjectRetain();
      sub_23B6E0710();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
      sub_23B6E0710();
      swift_bridgeObjectRelease();
      result = sub_23B6E0B18();
      v24 = -1 << *(_BYTE *)(v4 + 32);
      v25 = result & ~v24;
      v26 = v25 >> 6;
      if (((-1 << v25) & ~*(_QWORD *)(v8 + 8 * (v25 >> 6))) != 0)
      {
        v11 = __clz(__rbit64((-1 << v25) & ~*(_QWORD *)(v8 + 8 * (v25 >> 6)))) | v25 & 0x7FFFFFFFFFFFFFC0;
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
            goto LABEL_38;
          }
          v29 = v26 == v28;
          if (v26 == v28)
            v26 = 0;
          v27 |= v29;
          v30 = *(_QWORD *)(v8 + 8 * v26);
        }
        while (v30 == -1);
        v11 = __clz(__rbit64(~v30)) + (v26 << 6);
      }
      *(_QWORD *)(v8 + ((v11 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v11;
      v12 = (_QWORD *)(*(_QWORD *)(v4 + 48) + 32 * v11);
      *v12 = v20;
      v12[1] = v21;
      v12[2] = v22;
      v12[3] = v23;
      ++*(_QWORD *)(v4 + 16);
      v2 = v18;
    }
  }
  result = swift_release();
  *v1 = v4;
  return result;
}

uint64_t sub_23B6DEB68(uint64_t result, uint64_t a2, unint64_t a3, char a4)
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
    sub_23B6DE554();
  }
  else
  {
    if (v10 > v9)
    {
      result = (uint64_t)sub_23B6DEEE4();
      goto LABEL_22;
    }
    sub_23B6DF254();
  }
  v11 = *v4;
  sub_23B6E0B00();
  sub_23B6E0710();
  result = sub_23B6E0B18();
  v12 = -1 << *(_BYTE *)(v11 + 32);
  a3 = result & ~v12;
  v13 = v11 + 56;
  if (((*(_QWORD *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8)) >> a3) & 1) != 0)
  {
    v14 = *(_QWORD *)(v11 + 48);
    v15 = (_QWORD *)(v14 + 16 * a3);
    v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (result = sub_23B6E0A88(), (result & 1) != 0))
    {
LABEL_21:
      result = sub_23B6E0AA0();
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
          result = sub_23B6E0A88();
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

uint64_t sub_23B6DED00(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5, char a6)
{
  uint64_t *v6;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t *v29;

  v11 = result;
  v12 = *(_QWORD *)(*v6 + 16);
  v13 = *(_QWORD *)(*v6 + 24);
  if (v13 > v12 && (a6 & 1) != 0)
    goto LABEL_22;
  if ((a6 & 1) != 0)
  {
    sub_23B6DE830();
  }
  else
  {
    if (v13 > v12)
    {
      result = (uint64_t)sub_23B6DF094();
      goto LABEL_22;
    }
    sub_23B6DF500();
  }
  v14 = *v6;
  sub_23B6E0B00();
  swift_bridgeObjectRetain();
  sub_23B6E0710();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_23B6E0710();
  swift_bridgeObjectRelease();
  result = sub_23B6E0B18();
  v15 = -1 << *(_BYTE *)(v14 + 32);
  a5 = result & ~v15;
  v16 = v14 + 56;
  if (((*(_QWORD *)(v14 + 56 + ((a5 >> 3) & 0xFFFFFFFFFFFFF8)) >> a5) & 1) != 0)
  {
    v17 = ~v15;
    v18 = *(_QWORD *)(v14 + 48);
    while (1)
    {
      v19 = (_QWORD *)(v18 + 32 * a5);
      v20 = v19[2];
      v21 = v19[3];
      v22 = *v19 == v11 && v19[1] == a2;
      if (v22 || (result = sub_23B6E0A88(), (result & 1) != 0))
      {
        if (v20 == a3 && v21 == a4)
          break;
        result = sub_23B6E0A88();
        if ((result & 1) != 0)
          break;
      }
      a5 = (a5 + 1) & v17;
      if (((*(_QWORD *)(v16 + ((a5 >> 3) & 0xFFFFFFFFFFFFF8)) >> a5) & 1) == 0)
        goto LABEL_22;
    }
    result = sub_23B6E0AA0();
    __break(1u);
  }
LABEL_22:
  v24 = *v29;
  *(_QWORD *)(*v29 + 8 * (a5 >> 6) + 56) |= 1 << a5;
  v25 = (uint64_t *)(*(_QWORD *)(v24 + 48) + 32 * a5);
  *v25 = v11;
  v25[1] = a2;
  v25[2] = a3;
  v25[3] = a4;
  v26 = *(_QWORD *)(v24 + 16);
  v27 = __OFADD__(v26, 1);
  v28 = v26 + 1;
  if (v27)
    __break(1u);
  else
    *(_QWORD *)(v24 + 16) = v28;
  return result;
}

void *sub_23B6DEEE4()
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_256A47060);
  v2 = *v0;
  v3 = sub_23B6E0968();
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

void *sub_23B6DF094()
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_254300798);
  v2 = *v0;
  v3 = sub_23B6E0968();
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
    v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v22 >= v13)
      goto LABEL_28;
    v23 = *(_QWORD *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      v9 = v22 + 1;
      if (v22 + 1 >= v13)
        goto LABEL_28;
      v23 = *(_QWORD *)(v6 + 8 * v9);
      if (!v23)
      {
        v9 = v22 + 2;
        if (v22 + 2 >= v13)
          goto LABEL_28;
        v23 = *(_QWORD *)(v6 + 8 * v9);
        if (!v23)
          break;
      }
    }
LABEL_27:
    v12 = (v23 - 1) & v23;
    v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    v16 = 32 * v15;
    v17 = (_QWORD *)(*(_QWORD *)(v2 + 48) + v16);
    v18 = v17[1];
    v19 = v17[2];
    v20 = v17[3];
    v21 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v21 = *v17;
    v21[1] = v18;
    v21[2] = v19;
    v21[3] = v20;
    swift_bridgeObjectRetain();
    result = (void *)swift_bridgeObjectRetain();
  }
  v24 = v22 + 3;
  if (v24 >= v13)
    goto LABEL_28;
  v23 = *(_QWORD *)(v6 + 8 * v24);
  if (v23)
  {
    v9 = v24;
    goto LABEL_27;
  }
  while (1)
  {
    v9 = v24 + 1;
    if (__OFADD__(v24, 1))
      break;
    if (v9 >= v13)
      goto LABEL_28;
    v23 = *(_QWORD *)(v6 + 8 * v9);
    ++v24;
    if (v23)
      goto LABEL_27;
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_23B6DF254()
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_256A47060);
  v3 = sub_23B6E0974();
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
    sub_23B6E0B00();
    swift_bridgeObjectRetain();
    sub_23B6E0710();
    result = sub_23B6E0B18();
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

uint64_t sub_23B6DF500()
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
  _QWORD *v12;
  unint64_t v13;
  unint64_t v14;
  int64_t v15;
  unint64_t v16;
  int64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
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

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254300798);
  v3 = sub_23B6E0974();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
    result = swift_release();
LABEL_35:
    *v1 = v4;
    return result;
  }
  v5 = 1 << *(_BYTE *)(v2 + 32);
  v30 = v2 + 56;
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
      goto LABEL_24;
    }
    v15 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v15 >= v31)
      goto LABEL_33;
    v16 = *(_QWORD *)(v30 + 8 * v15);
    ++v10;
    if (!v16)
    {
      v10 = v15 + 1;
      if (v15 + 1 >= v31)
        goto LABEL_33;
      v16 = *(_QWORD *)(v30 + 8 * v10);
      if (!v16)
      {
        v10 = v15 + 2;
        if (v15 + 2 >= v31)
          goto LABEL_33;
        v16 = *(_QWORD *)(v30 + 8 * v10);
        if (!v16)
          break;
      }
    }
LABEL_23:
    v7 = (v16 - 1) & v16;
    v14 = __clz(__rbit64(v16)) + (v10 << 6);
LABEL_24:
    v18 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 32 * v14);
    v19 = *v18;
    v20 = v18[1];
    v21 = v18[2];
    v22 = v18[3];
    sub_23B6E0B00();
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain();
    sub_23B6E0710();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_23B6E0710();
    swift_bridgeObjectRelease();
    result = sub_23B6E0B18();
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
          goto LABEL_36;
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
    v12 = (_QWORD *)(*(_QWORD *)(v4 + 48) + 32 * v11);
    *v12 = v19;
    v12[1] = v20;
    v12[2] = v21;
    v12[3] = v22;
    ++*(_QWORD *)(v4 + 16);
  }
  v17 = v15 + 3;
  if (v17 >= v31)
  {
LABEL_33:
    result = swift_release_n();
    v1 = v0;
    goto LABEL_35;
  }
  v16 = *(_QWORD *)(v30 + 8 * v17);
  if (v16)
  {
    v10 = v17;
    goto LABEL_23;
  }
  while (1)
  {
    v10 = v17 + 1;
    if (__OFADD__(v17, 1))
      break;
    if (v10 >= v31)
      goto LABEL_33;
    v16 = *(_QWORD *)(v30 + 8 * v10);
    ++v17;
    if (v16)
      goto LABEL_23;
  }
LABEL_37:
  __break(1u);
  return result;
}

_QWORD *sub_23B6DF804(_QWORD *a1)
{
  return sub_23B6C690C(0, a1[2], 0, a1);
}

uint64_t sub_23B6DF818(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 56) = a1;
  *(_QWORD *)(v2 + 64) = a2;
  return swift_task_switch();
}

uint64_t sub_23B6DF82C()
{
  _QWORD *v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;

  if (qword_254300840 != -1)
    swift_once();
  v1 = sub_23B6E0668();
  __swift_project_value_buffer(v1, (uint64_t)qword_254300FE0);
  v2 = sub_23B6E0650();
  v3 = sub_23B6E08C0();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_23B6B3000, v2, v3, "This is the first run since reboot", v4, 2u);
    MEMORY[0x23B86B840](v4, -1, -1);
  }

  v5 = sub_23B6E062C();
  v7 = v6;
  if (qword_254301040 != -1)
    swift_once();
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_254300F68);
  __swift_project_value_buffer(v8, (uint64_t)qword_254301020);
  v0[5] = v5;
  v0[6] = v7;
  swift_beginAccess();
  sub_23B6E0530();
  swift_endAccess();
  v9 = (_QWORD *)swift_task_alloc();
  v0[9] = v9;
  *v9 = v0;
  v9[1] = sub_23B6DF9D4;
  v9[2] = v0[8];
  return swift_task_switch();
}

uint64_t sub_23B6DF9D4()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_23B6DFA1C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v16;
  uint64_t result;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v28;
  unint64_t v29;
  __int128 v31;
  __int128 v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  uint64_t ObjectType;

  v3 = *(_QWORD **)a1;
  v4 = *(_QWORD *)(*(_QWORD *)a1 + 16);
  if (!v4)
    return 0;
  swift_bridgeObjectRetain();
  ObjectType = swift_getObjectType();
  v6 = 0;
  v7 = 0;
  v34 = *(uint64_t (**)(uint64_t, uint64_t))(a3 + 24);
  while (1)
  {
    v8 = v3[v6 + 5];
    v9 = swift_getObjectType();
    v10 = *(uint64_t (**)(uint64_t, uint64_t))(v8 + 24);
    swift_unknownObjectRetain();
    v11 = v10(v9, v8);
    v13 = v12;
    if (v11 == v34(ObjectType, a3) && v13 == v14)
      break;
    v16 = sub_23B6E0A88();
    swift_unknownObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v16 & 1) != 0)
      goto LABEL_13;
    ++v7;
    v6 += 2;
    if (v4 == v7)
    {
      swift_bridgeObjectRelease();
      return v3[2];
    }
  }
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
LABEL_13:
  result = swift_bridgeObjectRelease();
  v18 = v7 + 1;
  if (!__OFADD__(v7, 1))
  {
    v19 = v3[2];
    while (v18 != v19)
    {
      if (v18 >= v19)
      {
        __break(1u);
LABEL_36:
        __break(1u);
LABEL_37:
        __break(1u);
LABEL_38:
        __break(1u);
LABEL_39:
        __break(1u);
LABEL_40:
        __break(1u);
        goto LABEL_41;
      }
      v20 = v3[v6 + 7];
      v21 = swift_getObjectType();
      v22 = *(uint64_t (**)(uint64_t, uint64_t))(v20 + 24);
      swift_unknownObjectRetain();
      v23 = v22(v21, v20);
      v25 = v24;
      if (v23 == v34(ObjectType, a3) && v25 == v26)
      {
        swift_unknownObjectRelease();
        result = swift_bridgeObjectRelease_n();
      }
      else
      {
        v28 = sub_23B6E0A88();
        swift_unknownObjectRelease();
        swift_bridgeObjectRelease();
        result = swift_bridgeObjectRelease();
        if ((v28 & 1) == 0)
        {
          if (v18 != v7)
          {
            if ((v7 & 0x8000000000000000) != 0)
              goto LABEL_37;
            v29 = v3[2];
            if (v7 >= v29)
              goto LABEL_38;
            if (v18 >= v29)
              goto LABEL_39;
            v33 = *(_OWORD *)&v3[v6 + 6];
            v31 = *(_OWORD *)&v3[2 * v7 + 4];
            swift_unknownObjectRetain();
            swift_unknownObjectRetain();
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
              v3 = sub_23B6DF804(v3);
            *(_OWORD *)&v3[2 * v7 + 4] = v33;
            result = swift_unknownObjectRelease();
            if (v18 >= v3[2])
              goto LABEL_40;
            *(_OWORD *)&v3[v6 + 6] = v31;
            result = swift_unknownObjectRelease();
            *(_QWORD *)a1 = v3;
          }
          if (__OFADD__(v7++, 1))
            goto LABEL_36;
        }
      }
      ++v18;
      v19 = v3[2];
      v6 += 2;
    }
    return v7;
  }
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_23B6DFD1C(uint64_t a1, int64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  int64_t v5;
  uint64_t v7;
  uint64_t v8;
  int64_t v9;
  _QWORD *isUniquelyReferenced_nonNull_native;
  int64_t v11;
  uint64_t result;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;

  if (a1 < 0)
  {
    __break(1u);
    goto LABEL_22;
  }
  v4 = *(_QWORD **)v2;
  v5 = *(_QWORD *)(*(_QWORD *)v2 + 16);
  if (v5 < a2)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  v7 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  v8 = a1 - a2;
  if (__OFSUB__(0, v7))
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  v9 = v5 - v7;
  if (__OFADD__(v5, v8))
  {
LABEL_25:
    __break(1u);
LABEL_26:
    __break(1u);
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  isUniquelyReferenced_nonNull_native = (_QWORD *)swift_isUniquelyReferenced_nonNull_native();
  if (!(_DWORD)isUniquelyReferenced_nonNull_native || v9 > v4[3] >> 1)
  {
    if (v5 <= v9)
      v11 = v5 + v8;
    else
      v11 = v5;
    v4 = sub_23B6C690C(isUniquelyReferenced_nonNull_native, v11, 1, v4);
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_254300FB0);
  result = swift_arrayDestroy();
  if (!v7)
    goto LABEL_20;
  v13 = v4[2];
  v14 = __OFSUB__(v13, a2);
  v15 = v13 - a2;
  if (v14)
    goto LABEL_26;
  if ((v15 & 0x8000000000000000) == 0)
  {
    v16 = (char *)&v4[2 * a2 + 4];
    if (a1 != a2 || &v4[2 * a1 + 4] >= (_QWORD *)&v16[16 * v15])
      result = (uint64_t)memmove(&v4[2 * a1 + 4], v16, 16 * v15);
    v17 = v4[2];
    v14 = __OFADD__(v17, v8);
    v18 = v17 - v7;
    if (!v14)
    {
      v4[2] = v18;
LABEL_20:
      *(_QWORD *)v2 = v4;
      return result;
    }
    goto LABEL_27;
  }
LABEL_28:
  result = sub_23B6E0A34();
  __break(1u);
  return result;
}

unint64_t sub_23B6DFE8C()
{
  unint64_t result;

  result = qword_2543001A0;
  if (!qword_2543001A0)
  {
    result = MEMORY[0x23B86B7BC](&protocol conformance descriptor for Daemon.Error, &type metadata for Daemon.Error);
    atomic_store(result, (unint64_t *)&qword_2543001A0);
  }
  return result;
}

uint64_t sub_23B6DFED0(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if (a2)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_23B6DFF0C(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if (a2)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_23B6DFF48(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v7 = *(_QWORD *)(v2 + 16);
  v6 = *(_QWORD *)(v2 + 24);
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v8;
  *v8 = v3;
  v8[1] = sub_23B6B77B8;
  return sub_23B6D7014(a1, a2, v7, v6);
}

uint64_t sub_23B6DFFB4()
{
  return objectdestroy_35Tm();
}

uint64_t sub_23B6DFFBC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  __int128 v3;

  v2 = swift_task_alloc();
  v3 = *(_OWORD *)(v0 + 32);
  *(_QWORD *)(v1 + 16) = v2;
  *(_QWORD *)v2 = v1;
  *(_QWORD *)(v2 + 8) = sub_23B6B77B8;
  *(_OWORD *)(v2 + 64) = v3;
  return swift_task_switch();
}

uint64_t sub_23B6E001C()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23B6E0040(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_23B6B77B8;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_256A474C0 + dword_256A474C0))(a1, v4);
}

uint64_t sub_23B6E00B0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v6;

  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v6;
  *v6 = v3;
  v6[1] = sub_23B6B8F74;
  return sub_23B6DA2A8(a1, a2, v2);
}

uint64_t sub_23B6E0114()
{
  return objectdestroy_35Tm();
}

uint64_t sub_23B6E011C(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v4 = v1[2];
  v5 = v1[3];
  v7 = v1[4];
  v6 = v1[5];
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v8;
  *v8 = v2;
  v8[1] = sub_23B6B77B8;
  return sub_23B6DA5C0(a1, v4, v5, v7, v6);
}

uint64_t sub_23B6E0194(uint64_t a1)
{
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_23B6E01DC(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_23B6E0224(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;

  v6 = v2[2];
  v7 = v2[3];
  v8 = v2[4];
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v9;
  *v9 = v3;
  v9[1] = sub_23B6B77B8;
  return sub_23B6D9CC0(a1, a2, v6, v7, v8);
}

uint64_t sub_23B6E02A0()
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_23B6E02FC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v4 = *(_QWORD *)(v1 + 16);
  v5 = *(_QWORD *)(v1 + 24);
  v6 = *(_QWORD *)(v1 + 32);
  v7 = *(_QWORD *)(v1 + 40);
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v8;
  *v8 = v2;
  v8[1] = sub_23B6B77B8;
  return sub_23B6DA02C(a1, v4, v5, v6, v7, (_OWORD *)(v1 + 48), (__int128 *)(v1 + 128));
}

uint64_t sub_23B6E038C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v6;

  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v6;
  *v6 = v3;
  v6[1] = sub_23B6B77B8;
  return sub_23B6D9404(a1, a2, v2);
}

uint64_t sub_23B6E03F0()
{
  return objectdestroy_35Tm();
}

uint64_t objectdestroy_35Tm()
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_23B6E0430(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v4 = v1[2];
  v5 = v1[3];
  v7 = v1[4];
  v6 = v1[5];
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v8;
  *v8 = v2;
  v8[1] = sub_23B6B77B8;
  return sub_23B6D971C(a1, v4, v5, v7, v6);
}

uint64_t sub_23B6E04B8()
{
  return MEMORY[0x24BE31768]();
}

uint64_t sub_23B6E04C4()
{
  return MEMORY[0x24BE31770]();
}

uint64_t sub_23B6E04D0()
{
  return MEMORY[0x24BE31780]();
}

uint64_t sub_23B6E04DC()
{
  return MEMORY[0x24BE31790]();
}

uint64_t sub_23B6E04E8()
{
  return MEMORY[0x24BE31798]();
}

uint64_t sub_23B6E04F4()
{
  return MEMORY[0x24BE317B0]();
}

uint64_t sub_23B6E0500()
{
  return MEMORY[0x24BE317B8]();
}

uint64_t sub_23B6E050C()
{
  return MEMORY[0x24BE317C0]();
}

uint64_t sub_23B6E0518()
{
  return MEMORY[0x24BE317E8]();
}

uint64_t sub_23B6E0524()
{
  return MEMORY[0x24BE31860]();
}

uint64_t sub_23B6E0530()
{
  return MEMORY[0x24BE31868]();
}

uint64_t sub_23B6E053C()
{
  return MEMORY[0x24BE31870]();
}

uint64_t sub_23B6E0548()
{
  return MEMORY[0x24BE31890]();
}

uint64_t sub_23B6E0554()
{
  return MEMORY[0x24BE31898]();
}

uint64_t sub_23B6E0560()
{
  return MEMORY[0x24BE318D0]();
}

uint64_t sub_23B6E056C()
{
  return MEMORY[0x24BE318D8]();
}

uint64_t sub_23B6E0578()
{
  return MEMORY[0x24BE318F0]();
}

uint64_t sub_23B6E0584()
{
  return MEMORY[0x24BE318F8]();
}

uint64_t sub_23B6E0590()
{
  return MEMORY[0x24BE31900]();
}

uint64_t sub_23B6E059C()
{
  return MEMORY[0x24BE31960]();
}

uint64_t sub_23B6E05A8()
{
  return MEMORY[0x24BE31970]();
}

uint64_t sub_23B6E05B4()
{
  return MEMORY[0x24BE31978]();
}

uint64_t sub_23B6E05C0()
{
  return MEMORY[0x24BE31998]();
}

uint64_t sub_23B6E05CC()
{
  return MEMORY[0x24BDCD2F0]();
}

uint64_t sub_23B6E05D8()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_23B6E05E4()
{
  return MEMORY[0x24BDCD860]();
}

uint64_t sub_23B6E05F0()
{
  return MEMORY[0x24BDCD8D0]();
}

uint64_t sub_23B6E05FC()
{
  return MEMORY[0x24BDCD928]();
}

uint64_t sub_23B6E0608()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_23B6E0614()
{
  return MEMORY[0x24BDCDCE0]();
}

uint64_t sub_23B6E0620()
{
  return MEMORY[0x24BDCE998]();
}

uint64_t sub_23B6E062C()
{
  return MEMORY[0x24BDCE9B0]();
}

uint64_t sub_23B6E0638()
{
  return MEMORY[0x24BDCEA40]();
}

uint64_t sub_23B6E0644()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_23B6E0650()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_23B6E065C()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_23B6E0668()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_23B6E0674()
{
  return MEMORY[0x24BEE6488]();
}

uint64_t sub_23B6E0680()
{
  return MEMORY[0x24BEE64B8]();
}

uint64_t sub_23B6E068C()
{
  return MEMORY[0x24BEE54B0]();
}

uint64_t sub_23B6E0698()
{
  return MEMORY[0x24BEE01C0]();
}

uint64_t sub_23B6E06A4()
{
  return MEMORY[0x24BDCF830]();
}

uint64_t sub_23B6E06B0()
{
  return MEMORY[0x24BEE0270]();
}

uint64_t sub_23B6E06BC()
{
  return MEMORY[0x24BEE0610]();
}

uint64_t sub_23B6E06C8()
{
  return MEMORY[0x24BEE06E8]();
}

uint64_t sub_23B6E06D4()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_23B6E06E0()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_23B6E06EC()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_23B6E06F8()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_23B6E0704()
{
  return MEMORY[0x24BEE0A30]();
}

uint64_t sub_23B6E0710()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_23B6E071C()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_23B6E0728()
{
  return MEMORY[0x24BEE0BE8]();
}

uint64_t sub_23B6E0734()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_23B6E0740()
{
  return MEMORY[0x24BEE0C60]();
}

uint64_t sub_23B6E074C()
{
  return MEMORY[0x24BE31AA8]();
}

uint64_t sub_23B6E0758()
{
  return MEMORY[0x24BEE1000]();
}

uint64_t sub_23B6E0764()
{
  return MEMORY[0x24BEE1018]();
}

uint64_t sub_23B6E0770()
{
  return MEMORY[0x24BEE1080]();
}

uint64_t sub_23B6E077C()
{
  return MEMORY[0x24BEE1098]();
}

uint64_t sub_23B6E0788()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_23B6E0794()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_23B6E07A0()
{
  return MEMORY[0x24BEE1120]();
}

uint64_t sub_23B6E07AC()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_23B6E07B8()
{
  return MEMORY[0x24BEE6820]();
}

uint64_t sub_23B6E07C4()
{
  return MEMORY[0x24BEE6828]();
}

uint64_t sub_23B6E07D0()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t sub_23B6E07DC()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t sub_23B6E07E8()
{
  return MEMORY[0x24BEE69F8]();
}

uint64_t sub_23B6E07F4()
{
  return MEMORY[0x24BEE6A30]();
}

uint64_t sub_23B6E0800()
{
  return MEMORY[0x24BEE6A50]();
}

uint64_t sub_23B6E080C()
{
  return MEMORY[0x24BEE6A58]();
}

uint64_t sub_23B6E0818()
{
  return MEMORY[0x24BEE6AA0]();
}

uint64_t sub_23B6E0824()
{
  return MEMORY[0x24BEE6AD0]();
}

uint64_t sub_23B6E0830()
{
  return MEMORY[0x24BEE6B10]();
}

uint64_t sub_23B6E083C()
{
  return MEMORY[0x24BEE15D8]();
}

uint64_t sub_23B6E0848()
{
  return MEMORY[0x24BEE1628]();
}

uint64_t sub_23B6E0854()
{
  return MEMORY[0x24BEE1648]();
}

uint64_t sub_23B6E0860()
{
  return MEMORY[0x24BEE1658]();
}

uint64_t sub_23B6E086C()
{
  return MEMORY[0x24BEE1668]();
}

uint64_t sub_23B6E0878()
{
  return MEMORY[0x24BEE1678]();
}

uint64_t sub_23B6E0884()
{
  return MEMORY[0x24BEE16D8]();
}

uint64_t sub_23B6E0890()
{
  return MEMORY[0x24BEE78F0]();
}

uint64_t sub_23B6E089C()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t sub_23B6E08A8()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_23B6E08B4()
{
  return MEMORY[0x24BEE7920]();
}

uint64_t sub_23B6E08C0()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_23B6E08CC()
{
  return MEMORY[0x24BEE57B0]();
}

uint64_t sub_23B6E08D8()
{
  return MEMORY[0x24BEE5BC0]();
}

uint64_t sub_23B6E08E4()
{
  return MEMORY[0x24BDD0420]();
}

uint64_t sub_23B6E08F0()
{
  return MEMORY[0x24BDD0430]();
}

uint64_t sub_23B6E08FC()
{
  return MEMORY[0x24BDD0460]();
}

uint64_t sub_23B6E0908()
{
  return MEMORY[0x24BDD0468]();
}

uint64_t sub_23B6E0914()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_23B6E0920()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_23B6E092C()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_23B6E0938()
{
  return MEMORY[0x24BEE22D0]();
}

uint64_t sub_23B6E0944()
{
  return MEMORY[0x24BEE2300]();
}

uint64_t sub_23B6E0950()
{
  return MEMORY[0x24BEE2358]();
}

uint64_t sub_23B6E095C()
{
  return MEMORY[0x24BEE6D58]();
}

uint64_t sub_23B6E0968()
{
  return MEMORY[0x24BEE24B8]();
}

uint64_t sub_23B6E0974()
{
  return MEMORY[0x24BEE24C0]();
}

uint64_t sub_23B6E0980()
{
  return MEMORY[0x24BEE24D0]();
}

uint64_t sub_23B6E098C()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_23B6E0998()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_23B6E09A4()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_23B6E09B0()
{
  return MEMORY[0x24BEE6D68]();
}

uint64_t sub_23B6E09BC()
{
  return MEMORY[0x24BEE6D80]();
}

uint64_t sub_23B6E09C8()
{
  return MEMORY[0x24BEE6DC8]();
}

uint64_t sub_23B6E09D4()
{
  return MEMORY[0x24BEE6E08]();
}

uint64_t sub_23B6E09E0()
{
  return MEMORY[0x24BEE6E10]();
}

uint64_t sub_23B6E09EC()
{
  return MEMORY[0x24BEE2AE0]();
}

uint64_t sub_23B6E09F8()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_23B6E0A04()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_23B6E0A10()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_23B6E0A1C()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_23B6E0A28()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_23B6E0A34()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_23B6E0A40()
{
  return MEMORY[0x24BEE6FA8]();
}

uint64_t sub_23B6E0A4C()
{
  return MEMORY[0x24BE31AF8]();
}

uint64_t sub_23B6E0A58()
{
  return MEMORY[0x24BE31B00]();
}

uint64_t sub_23B6E0A64()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_23B6E0A70()
{
  return MEMORY[0x24BEE7040]();
}

uint64_t sub_23B6E0A7C()
{
  return MEMORY[0x24BEE39B0]();
}

uint64_t sub_23B6E0A88()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_23B6E0A94()
{
  return MEMORY[0x24BEE70E0]();
}

uint64_t sub_23B6E0AA0()
{
  return MEMORY[0x24BEE3ED0]();
}

uint64_t sub_23B6E0AAC()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_23B6E0AB8()
{
  return MEMORY[0x24BEE7110]();
}

uint64_t sub_23B6E0AC4()
{
  return MEMORY[0x24BEE7118]();
}

uint64_t sub_23B6E0AD0()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_23B6E0ADC()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_23B6E0AE8()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_23B6E0AF4()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_23B6E0B00()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_23B6E0B0C()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_23B6E0B18()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_23B6E0B24()
{
  return MEMORY[0x24BE31B20]();
}

uint64_t sub_23B6E0B30()
{
  return MEMORY[0x24BDD0A18]();
}

uint64_t sub_23B6E0B3C()
{
  return MEMORY[0x24BDD0A50]();
}

uint64_t sub_23B6E0B48()
{
  return MEMORY[0x24BEE7160]();
}

uint64_t sub_23B6E0B54()
{
  return MEMORY[0x24BEE7168]();
}

uint64_t sub_23B6E0B60()
{
  return MEMORY[0x24BEE7178]();
}

uint64_t sub_23B6E0B6C()
{
  return MEMORY[0x24BEE4A98]();
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
  MEMORY[0x24BDBC040](center, observer, callBack, name, object, suspensionBehavior);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x24BDBC050]();
}

uint64_t MKBDeviceUnlockedSinceBoot()
{
  return MEMORY[0x24BE67140]();
}

uint64_t MKBGetDeviceLockState()
{
  return MEMORY[0x24BE67168]();
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

uint64_t _set_user_dir_suffix()
{
  return MEMORY[0x24BDACC40]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x24BEE4B38]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x24BDAED08](__size);
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

uint32_t notify_cancel(int token)
{
  return MEMORY[0x24BDAF138](*(_QWORD *)&token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x24BDAF148](*(_QWORD *)&token, state64);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return MEMORY[0x24BDAF168](name, out_token);
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

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x24BDAFF10](__s1);
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

uint64_t swift_asyncLet_begin()
{
  return MEMORY[0x24BEE7198]();
}

uint64_t swift_asyncLet_finish()
{
  return MEMORY[0x24BEE71A0]();
}

uint64_t swift_asyncLet_get()
{
  return MEMORY[0x24BEE71A8]();
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

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x24BEE4CD8]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x24BEE4D40]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x24BEE4D80]();
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

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x24BEE4E28]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x24BEE4E68]();
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

uint64_t swift_slowAlloc()
{
  return MEMORY[0x24BEE4F38]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x24BEE4F40]();
}

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return MEMORY[0x24BEE4F48]();
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

uint64_t swift_task_localValuePop()
{
  return MEMORY[0x24BEE7258]();
}

uint64_t swift_task_localValuePush()
{
  return MEMORY[0x24BEE7260]();
}

uint64_t swift_task_switch()
{
  return MEMORY[0x24BEE7278]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x24BEE4F70]();
}

uint64_t swift_unknownObjectRelease_n()
{
  return MEMORY[0x24BEE4F78]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
}

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x24BEE4F88]();
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

uint64_t swift_willThrow()
{
  return MEMORY[0x24BEE5050]();
}

uint64_t xpc_copy_event()
{
  return MEMORY[0x24BDB0840]();
}

BOOL xpc_dictionary_apply(xpc_object_t xdict, xpc_dictionary_applier_t applier)
{
  return MEMORY[0x24BDB08B0](xdict, applier);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x24BDB0A70](object);
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
  MEMORY[0x24BDB0B58](stream, targetq, handler);
}

