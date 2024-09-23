uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x23B82E4DC]((char *)a1 + (int)result, -(result >> 32), 0, 0);
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

uint64_t block_destroy_helper()
{
  return swift_release();
}

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

uint64_t block_destroy_helper_1()
{
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

uint64_t sub_2381AD234(uint64_t a1)
{
  uint64_t v2;

  v2 = swift_allocObject();
  swift_defaultActor_initialize();
  *(_QWORD *)(v2 + 112) = a1;
  return v2;
}

uint64_t sub_2381AD270()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 40) = v0;
  return swift_task_switch();
}

uint64_t sub_2381AD288()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t result;
  uint64_t v3;
  xpc_object_t v4;
  uint64_t v5;
  char v6;
  char v7;
  _QWORD *v8;

  v1 = *(_QWORD *)(v0[5] + 112);
  result = swift_beginAccess();
  v3 = *(_QWORD *)(v1 + 40);
  v0[6] = v3;
  if (v3)
  {
    swift_retain();
    v4 = XPCDictionary.init()();
    v5 = XPCMessage.init(ty:payload:)(2u, (uint64_t)v4);
    v7 = v6;
    v0[7] = v5;
    v8 = (_QWORD *)swift_task_alloc();
    v0[8] = v8;
    *v8 = v0;
    v8[1] = sub_2381AD330;
    return XPCConnection.sendWithReply(_:)(v5, v7);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_2381AD330()
{
  void *v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  swift_task_dealloc();
  swift_unknownObjectRelease();
  swift_release();
  if (v0)

  else
    swift_unknownObjectRelease();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_2381AD3B0()
{
  swift_release();
  swift_defaultActor_destroy();
  return swift_defaultActor_deallocate();
}

uint64_t sub_2381AD3D4()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_2381AD3E0()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t (*v4)(void);

  v4 = (uint64_t (*)(void))(**(int **)(*(_QWORD *)v0 + 104) + *(_QWORD *)(*(_QWORD *)v0 + 104));
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v2;
  *v2 = v1;
  v2[1] = sub_2381AD438;
  return v4();
}

uint64_t sub_2381AD438()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_2381AD480()
{
  PostInstallActivityConfig.activityFlags.unsafeMutableAddressor();
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

uint64_t sub_2381AD4C0()
{
  uint64_t v0;

  v0 = *(_QWORD *)PostInstallActivityConfig.identifier.unsafeMutableAddressor();
  swift_bridgeObjectRetain();
  return v0;
}

unint64_t sub_2381AD4F0(uint64_t a1)
{
  unint64_t result;

  result = sub_2381AD514();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t sub_2381AD514()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2542CA5F0;
  if (!qword_2542CA5F0)
  {
    v1 = type metadata accessor for PostInstallActivity();
    result = MEMORY[0x23B82E4F4](&unk_2381C11B0, v1);
    atomic_store(result, (unint64_t *)&qword_2542CA5F0);
  }
  return result;
}

uint64_t type metadata accessor for PostInstallActivity()
{
  return objc_opt_self();
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

uint64_t type metadata accessor for EventValue()
{
  uint64_t result;

  result = qword_2542CA6F0;
  if (!qword_2542CA6F0)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_2381AD5F4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for EventValue();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t EventValue.init(integerLiteral:)@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  *a2 = a1;
  type metadata accessor for EventValue();
  return swift_storeEnumTagMultiPayload();
}

uint64_t EventValue.init(floatLiteral:)@<X0>(double *a1@<X8>, double a2@<D0>)
{
  *a1 = a2;
  type metadata accessor for EventValue();
  return swift_storeEnumTagMultiPayload();
}

uint64_t _s14CloudTelemetry10EventValueO13stringLiteralACSS_tcfC_0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  *a3 = a1;
  a3[1] = a2;
  type metadata accessor for EventValue();
  return swift_storeEnumTagMultiPayload();
}

uint64_t _s14CloudTelemetry10EventValueO14BOOLeanLiteralACSb_tcfC_0@<X0>(char a1@<W0>, _BYTE *a2@<X8>)
{
  *a2 = a1;
  type metadata accessor for EventValue();
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_2381AD718@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  *a2 = *a1;
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_2381AD730@<X0>(_BYTE *a1@<X0>, _BYTE *a2@<X8>)
{
  *a2 = *a1;
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_2381AD744@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  *a2 = *a1;
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_2381AD758@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return swift_storeEnumTagMultiPayload();
}

xpc_object_t sub_2381AD770(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  char *v13;
  xpc_object_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  _QWORD v32[2];
  _QWORD *v33;
  int64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  xpc_object_t v38;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542CA000);
  MEMORY[0x24BDAC7A8](v2);
  v37 = type metadata accessor for EventValue();
  v35 = *(_QWORD *)(v37 - 8);
  v3 = MEMORY[0x24BDAC7A8](v37);
  v5 = (char *)v32 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)v32 - v6;
  v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2542C9E48);
  v9 = MEMORY[0x24BDAC7A8](v8);
  v11 = (_QWORD *)((char *)v32 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)v32 - v12;
  v14 = XPCDictionary.init()();
  v15 = *(_QWORD *)(a1 + 64);
  v33 = (_QWORD *)(a1 + 64);
  v38 = v14;
  v16 = 1 << *(_BYTE *)(a1 + 32);
  v17 = -1;
  if (v16 < 64)
    v17 = ~(-1 << v16);
  v18 = v17 & v15;
  v34 = (unint64_t)(v16 + 63) >> 6;
  v32[1] = v34 - 1;
  v36 = a1;
  swift_bridgeObjectRetain();
  if (v18)
  {
    v19 = __clz(__rbit64(v18));
LABEL_5:
    v20 = *(_QWORD *)(v36 + 56);
    v21 = (_QWORD *)(*(_QWORD *)(v36 + 48) + 16 * v19);
    v22 = v21[1];
    *v11 = *v21;
    v11[1] = v22;
    v23 = v20 + *(_QWORD *)(v35 + 72) * v19;
    v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542C9E40);
    sub_2381AD5F4(v23, (uint64_t)v11 + *(int *)(v24 + 48));
    (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 56))(v11, 0, 1, v24);
    swift_bridgeObjectRetain();
    goto LABEL_22;
  }
  v25 = 1;
  if (v34 > 1)
  {
    v26 = v33[1];
    if (v26)
    {
LABEL_8:
      v19 = __clz(__rbit64(v26)) + (v25 << 6);
      goto LABEL_5;
    }
    v27 = 2;
    if (v34 > 2)
    {
      v26 = v33[2];
      if (v26)
      {
LABEL_11:
        v25 = v27;
        goto LABEL_8;
      }
      if (v34 > 3)
      {
        v26 = v33[3];
        if (v26)
        {
          v25 = 3;
          goto LABEL_8;
        }
        v27 = 4;
        if (v34 > 4)
        {
          v26 = v33[4];
          if (v26)
            goto LABEL_11;
          while (1)
          {
            v25 = v27 + 1;
            if (__OFADD__(v27, 1))
            {
              __break(1u);
              JUMPOUT(0x2381ADC44);
            }
            if (v25 >= v34)
              break;
            v26 = v33[v25];
            ++v27;
            if (v26)
              goto LABEL_8;
          }
        }
      }
    }
  }
  v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542C9E40);
  (*(void (**)(_QWORD *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v28 - 8) + 56))(v11, 1, 1, v28);
LABEL_22:
  sub_2381AE8E8((uint64_t)v11, (uint64_t)v13);
  v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542C9E40);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v29 - 8) + 48))(v13, 1, v29) != 1)
  {
    sub_2381ADD70((uint64_t)&v13[*(int *)(v29 + 48)], (uint64_t)v7);
    sub_2381AD5F4((uint64_t)v7, (uint64_t)v5);
    v30 = (char *)&loc_2381ADB4C + dword_2381ADC44[swift_getEnumCaseMultiPayload()];
    __asm { BR              X9 }
  }
  swift_release();
  return v38;
}

uint64_t sub_2381ADC5C@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
  uint64_t v6;

  if (*(_QWORD *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2568E6220);
    v3 = sub_2381C0934();
  }
  else
  {
    v3 = MEMORY[0x24BEE4B00];
  }
  v6 = v3;
  v4 = swift_bridgeObjectRetain();
  sub_2381ADED0(v4, 1, &v6);
  result = swift_bridgeObjectRelease();
  *a2 = v6;
  return result;
}

unint64_t sub_2381ADD0C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_2381C09DC();
  sub_2381C0760();
  v4 = sub_2381C0A00();
  return sub_2381ADDF0(a1, a2, v4);
}

uint64_t sub_2381ADD70(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for EventValue();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_2381ADDB4(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for EventValue();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_2381ADDF0(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_2381C0958() & 1) == 0)
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
      while (!v14 && (sub_2381C0958() & 1) == 0);
    }
  }
  return v6;
}

void sub_2381ADED0(uint64_t a1, char a2, _QWORD *a3)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  char v23;
  unint64_t v24;
  uint64_t v25;
  _BOOL8 v26;
  uint64_t v27;
  char v28;
  unint64_t v29;
  char v30;
  void *v31;
  id v32;
  _QWORD *v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;
  BOOL v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  _QWORD *v43;
  unint64_t v44;
  char v45;
  uint64_t v46;
  _BOOL8 v47;
  uint64_t v48;
  char v49;
  char v50;
  _QWORD *v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  unint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  unint64_t v64;
  uint64_t v65;
  uint64_t v66;
  id v67;

  v7 = type metadata accessor for EventValue();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v55 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(qword_2568E6010);
  v12 = MEMORY[0x24BDAC7A8](v11);
  v15 = (uint64_t *)((char *)&v55 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  v16 = *(_QWORD *)(a1 + 16);
  if (!v16)
  {
    swift_bridgeObjectRelease();
    return;
  }
  v59 = a1;
  v60 = v8;
  v17 = a2;
  v57 = v3;
  v58 = v16;
  v18 = (uint64_t)v15 + *(int *)(v12 + 48);
  v56 = (*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  v19 = a1 + v56;
  v62 = *(_QWORD *)(v13 + 72);
  swift_bridgeObjectRetain();
  sub_2381AF1F8(v19, (uint64_t)v15, qword_2568E6010);
  v20 = v15[1];
  v65 = *v15;
  v21 = v65;
  v66 = v20;
  v61 = v18;
  sub_2381ADD70(v18, (uint64_t)v10);
  v22 = (_QWORD *)*a3;
  v24 = sub_2381ADD0C(v21, v20);
  v25 = v22[2];
  v26 = (v23 & 1) == 0;
  v27 = v25 + v26;
  if (__OFADD__(v25, v26))
    goto LABEL_23;
  v28 = v23;
  if (v22[3] >= v27)
  {
    if ((v17 & 1) != 0)
    {
      if ((v23 & 1) != 0)
        goto LABEL_10;
    }
    else
    {
      sub_2381AE354();
      if ((v28 & 1) != 0)
        goto LABEL_10;
    }
LABEL_13:
    v33 = (_QWORD *)*a3;
    *(_QWORD *)(*a3 + 8 * (v24 >> 6) + 64) |= 1 << v24;
    v34 = (uint64_t *)(v33[6] + 16 * v24);
    *v34 = v21;
    v34[1] = v20;
    v35 = v33[7];
    v60 = *(_QWORD *)(v60 + 72);
    sub_2381ADD70((uint64_t)v10, v35 + v60 * v24);
    v36 = v33[2];
    v37 = __OFADD__(v36, 1);
    v38 = v36 + 1;
    if (v37)
    {
LABEL_24:
      __break(1u);
      goto LABEL_25;
    }
    v33[2] = v38;
    v39 = v58 - 1;
    if (v58 == 1)
    {
LABEL_22:
      swift_bridgeObjectRelease_n();
      return;
    }
    v40 = v59 + v62 + v56;
    while (1)
    {
      sub_2381AF1F8(v40, (uint64_t)v15, qword_2568E6010);
      v42 = v15[1];
      v65 = *v15;
      v41 = v65;
      v66 = v42;
      sub_2381ADD70(v61, (uint64_t)v10);
      v43 = (_QWORD *)*a3;
      v44 = sub_2381ADD0C(v41, v42);
      v46 = v43[2];
      v47 = (v45 & 1) == 0;
      v37 = __OFADD__(v46, v47);
      v48 = v46 + v47;
      if (v37)
        break;
      v49 = v45;
      if (v43[3] < v48)
      {
        sub_2381AE580(v48, 1);
        v44 = sub_2381ADD0C(v41, v42);
        if ((v49 & 1) != (v50 & 1))
          goto LABEL_25;
      }
      if ((v49 & 1) != 0)
        goto LABEL_10;
      v51 = (_QWORD *)*a3;
      *(_QWORD *)(*a3 + 8 * (v44 >> 6) + 64) |= 1 << v44;
      v52 = (uint64_t *)(v51[6] + 16 * v44);
      *v52 = v41;
      v52[1] = v42;
      sub_2381ADD70((uint64_t)v10, v51[7] + v60 * v44);
      v53 = v51[2];
      v37 = __OFADD__(v53, 1);
      v54 = v53 + 1;
      if (v37)
        goto LABEL_24;
      v51[2] = v54;
      v40 += v62;
      if (!--v39)
        goto LABEL_22;
    }
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  sub_2381AE580(v27, v17 & 1);
  v29 = sub_2381ADD0C(v21, v20);
  if ((v28 & 1) == (v30 & 1))
  {
    v24 = v29;
    if ((v28 & 1) == 0)
      goto LABEL_13;
LABEL_10:
    v31 = (void *)swift_allocError();
    swift_willThrow();
    v67 = v31;
    v32 = v31;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2542CA650);
    if ((swift_dynamicCast() & 1) == 0)
    {
      swift_bridgeObjectRelease();
      sub_2381ADDB4((uint64_t)v10);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();

      return;
    }
    goto LABEL_26;
  }
LABEL_25:
  sub_2381C0970();
  __break(1u);
LABEL_26:
  v63 = 0;
  v64 = 0xE000000000000000;
  sub_2381C08BC();
  sub_2381C076C();
  sub_2381C08EC();
  sub_2381C076C();
  sub_2381C0904();
  __break(1u);
}

void *sub_2381AE354()
{
  uint64_t *v0;
  uint64_t *v1;
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
  int64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  _QWORD *v23;
  int64_t v24;
  unint64_t v25;
  int64_t v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;

  v1 = v0;
  v2 = type metadata accessor for EventValue();
  v30 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v27 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2568E6220);
  v5 = *v0;
  v6 = sub_2381C091C();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
  {
    result = (void *)swift_release();
LABEL_28:
    *v1 = v7;
    return result;
  }
  v28 = v1;
  result = (void *)(v6 + 64);
  v9 = (unint64_t)((1 << *(_BYTE *)(v7 + 32)) + 63) >> 6;
  if (v7 != v5 || (unint64_t)result >= v5 + 64 + 8 * v9)
    result = memmove(result, (const void *)(v5 + 64), 8 * v9);
  v29 = v5 + 64;
  v11 = 0;
  *(_QWORD *)(v7 + 16) = *(_QWORD *)(v5 + 16);
  v12 = 1 << *(_BYTE *)(v5 + 32);
  v13 = -1;
  if (v12 < 64)
    v13 = ~(-1 << v12);
  v14 = v13 & *(_QWORD *)(v5 + 64);
  v15 = (unint64_t)(v12 + 63) >> 6;
  while (1)
  {
    if (v14)
    {
      v16 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      v17 = v16 | (v11 << 6);
      goto LABEL_12;
    }
    v24 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v24 >= v15)
      goto LABEL_26;
    v25 = *(_QWORD *)(v29 + 8 * v24);
    ++v11;
    if (!v25)
    {
      v11 = v24 + 1;
      if (v24 + 1 >= v15)
        goto LABEL_26;
      v25 = *(_QWORD *)(v29 + 8 * v11);
      if (!v25)
        break;
    }
LABEL_25:
    v14 = (v25 - 1) & v25;
    v17 = __clz(__rbit64(v25)) + (v11 << 6);
LABEL_12:
    v18 = 16 * v17;
    v19 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v17);
    v21 = *v19;
    v20 = v19[1];
    v22 = *(_QWORD *)(v30 + 72) * v17;
    sub_2381AD5F4(*(_QWORD *)(v5 + 56) + v22, (uint64_t)v4);
    v23 = (_QWORD *)(*(_QWORD *)(v7 + 48) + v18);
    *v23 = v21;
    v23[1] = v20;
    sub_2381ADD70((uint64_t)v4, *(_QWORD *)(v7 + 56) + v22);
    result = (void *)swift_bridgeObjectRetain();
  }
  v26 = v24 + 2;
  if (v26 >= v15)
  {
LABEL_26:
    result = (void *)swift_release();
    v1 = v28;
    goto LABEL_28;
  }
  v25 = *(_QWORD *)(v29 + 8 * v26);
  if (v25)
  {
    v11 = v26;
    goto LABEL_25;
  }
  while (1)
  {
    v11 = v26 + 1;
    if (__OFADD__(v26, 1))
      break;
    if (v11 >= v15)
      goto LABEL_26;
    v25 = *(_QWORD *)(v29 + 8 * v11);
    ++v26;
    if (v25)
      goto LABEL_25;
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_2381AE580(uint64_t a1, int a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
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
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  char v34;
  unint64_t v35;
  BOOL v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t *v39;
  int64_t v40;
  _QWORD *v41;
  uint64_t v42;
  int v43;

  v3 = v2;
  v5 = type metadata accessor for EventValue();
  v42 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v39 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2568E6220);
  v43 = a2;
  v9 = sub_2381C0928();
  v10 = v9;
  if (!*(_QWORD *)(v8 + 16))
    goto LABEL_41;
  v11 = 1 << *(_BYTE *)(v8 + 32);
  v12 = *(_QWORD *)(v8 + 64);
  v41 = (_QWORD *)(v8 + 64);
  if (v11 < 64)
    v13 = ~(-1 << v11);
  else
    v13 = -1;
  v14 = v13 & v12;
  v39 = v2;
  v40 = (unint64_t)(v11 + 63) >> 6;
  v15 = v9 + 64;
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
    if (v22 >= v40)
      break;
    v23 = v41;
    v24 = v41[v22];
    ++v17;
    if (!v24)
    {
      v17 = v22 + 1;
      if (v22 + 1 >= v40)
        goto LABEL_34;
      v24 = v41[v17];
      if (!v24)
      {
        v25 = v22 + 2;
        if (v25 >= v40)
        {
LABEL_34:
          swift_release();
          v3 = v39;
          if ((v43 & 1) == 0)
            goto LABEL_41;
          goto LABEL_37;
        }
        v24 = v41[v25];
        if (!v24)
        {
          while (1)
          {
            v17 = v25 + 1;
            if (__OFADD__(v25, 1))
              goto LABEL_43;
            if (v17 >= v40)
              goto LABEL_34;
            v24 = v41[v17];
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
    v26 = (uint64_t *)(*(_QWORD *)(v8 + 48) + 16 * v21);
    v28 = *v26;
    v27 = v26[1];
    v29 = *(_QWORD *)(v42 + 72);
    v30 = *(_QWORD *)(v8 + 56) + v29 * v21;
    if ((v43 & 1) != 0)
    {
      sub_2381ADD70(v30, (uint64_t)v7);
    }
    else
    {
      sub_2381AD5F4(v30, (uint64_t)v7);
      swift_bridgeObjectRetain();
    }
    sub_2381C09DC();
    sub_2381C0760();
    result = sub_2381C0A00();
    v31 = -1 << *(_BYTE *)(v10 + 32);
    v32 = result & ~v31;
    v33 = v32 >> 6;
    if (((-1 << v32) & ~*(_QWORD *)(v15 + 8 * (v32 >> 6))) != 0)
    {
      v18 = __clz(__rbit64((-1 << v32) & ~*(_QWORD *)(v15 + 8 * (v32 >> 6)))) | v32 & 0x7FFFFFFFFFFFFFC0;
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
          goto LABEL_42;
        }
        v36 = v33 == v35;
        if (v33 == v35)
          v33 = 0;
        v34 |= v36;
        v37 = *(_QWORD *)(v15 + 8 * v33);
      }
      while (v37 == -1);
      v18 = __clz(__rbit64(~v37)) + (v33 << 6);
    }
    *(_QWORD *)(v15 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    v19 = (_QWORD *)(*(_QWORD *)(v10 + 48) + 16 * v18);
    *v19 = v28;
    v19[1] = v27;
    result = sub_2381ADD70((uint64_t)v7, *(_QWORD *)(v10 + 56) + v29 * v18);
    ++*(_QWORD *)(v10 + 16);
  }
  swift_release();
  v3 = v39;
  v23 = v41;
  if ((v43 & 1) == 0)
    goto LABEL_41;
LABEL_37:
  v38 = 1 << *(_BYTE *)(v8 + 32);
  if (v38 >= 64)
    bzero(v23, ((unint64_t)(v38 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v23 = -1 << v38;
  *(_QWORD *)(v8 + 16) = 0;
LABEL_41:
  result = swift_release();
  *v3 = v10;
  return result;
}

uint64_t sub_2381AE8E8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2542C9E48);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_2381AE930()
{
  return MEMORY[0x24BEE1440];
}

uint64_t sub_2381AE93C()
{
  return sub_2381AE9A8(&qword_2568E6000, (uint64_t)&protocol conformance descriptor for EventValue);
}

uint64_t sub_2381AE960()
{
  return MEMORY[0x24BEE0D80];
}

uint64_t sub_2381AE96C()
{
  return MEMORY[0x24BEE1358];
}

uint64_t sub_2381AE978()
{
  return MEMORY[0x24BEE4058];
}

uint64_t sub_2381AE984()
{
  return sub_2381AE9A8(&qword_2568E6008, (uint64_t)&protocol conformance descriptor for EventValue);
}

uint64_t sub_2381AE9A8(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = type metadata accessor for EventValue();
    result = MEMORY[0x23B82E4F4](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_2381AE9E8()
{
  return MEMORY[0x24BEE0D90];
}

uint64_t sub_2381AE9F4()
{
  return MEMORY[0x24BEE0D88];
}

uint64_t initializeBufferWithCopyOfBuffer for LegacyConfig(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for LegacyConfig()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for LegacyConfig(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  *(_WORD *)a1 = *(_WORD *)a2;
  *(_DWORD *)(a1 + 4) = *(_DWORD *)(a2 + 4);
  v3 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v3;
  v4 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v4;
  v5 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = v5;
  *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
  v6 = *(_QWORD *)(a2 + 64);
  *(_BYTE *)(a1 + 72) = *(_BYTE *)(a2 + 72);
  *(_QWORD *)(a1 + 64) = v6;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for LegacyConfig(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  *(_WORD *)a1 = *(_WORD *)a2;
  *(_DWORD *)(a1 + 4) = *(_DWORD *)(a2 + 4);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
  v4 = *(_QWORD *)(a2 + 64);
  *(_BYTE *)(a1 + 72) = *(_BYTE *)(a2 + 72);
  *(_QWORD *)(a1 + 64) = v4;
  return a1;
}

__n128 __swift_memcpy73_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  result = *(__n128 *)(a2 + 16);
  v3 = *(_OWORD *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 57) = *(_OWORD *)(a2 + 57);
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)(a1 + 16) = result;
  return result;
}

uint64_t assignWithTake for LegacyConfig(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  *(_WORD *)a1 = *(_WORD *)a2;
  *(_DWORD *)(a1 + 4) = *(_DWORD *)(a2 + 4);
  v4 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v4;
  swift_bridgeObjectRelease();
  v5 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v5;
  swift_bridgeObjectRelease();
  v6 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = v6;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_BYTE *)(a1 + 72) = *(_BYTE *)(a2 + 72);
  return a1;
}

uint64_t getEnumTagSinglePayload for LegacyConfig(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 73))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *(_QWORD *)(a1 + 16);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for LegacyConfig(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 72) = 0;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 73) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 73) = 0;
    if (a2)
      *(_QWORD *)(result + 16) = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for LegacyConfig()
{
  return &type metadata for LegacyConfig;
}

uint64_t *initializeBufferWithCopyOfBuffer for EventValue(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5;
  int v6;
  int EnumCaseMultiPayload;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v5 = *(_QWORD *)(a3 - 8);
  v6 = *(_DWORD *)(v5 + 80);
  if ((v6 & 0x20000) != 0)
  {
    v9 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v9 + ((v6 + 16) & ~(unint64_t)v6));
    swift_retain();
  }
  else
  {
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 5)
    {
      v10 = sub_2381C0670();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(a1, a2, v10);
      swift_storeEnumTagMultiPayload();
    }
    else if (EnumCaseMultiPayload)
    {
      memcpy(a1, a2, *(_QWORD *)(v5 + 64));
    }
    else
    {
      v8 = a2[1];
      *a1 = *a2;
      a1[1] = v8;
      swift_bridgeObjectRetain();
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

uint64_t destroy for EventValue(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = swift_getEnumCaseMultiPayload();
  if ((_DWORD)result == 5)
  {
    v3 = sub_2381C0670();
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  }
  else if (!(_DWORD)result)
  {
    return swift_bridgeObjectRelease();
  }
  return result;
}

_QWORD *initializeWithCopy for EventValue(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  int EnumCaseMultiPayload;
  uint64_t v7;
  uint64_t v8;

  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 5)
  {
    v8 = sub_2381C0670();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(a1, a2, v8);
    swift_storeEnumTagMultiPayload();
  }
  else if (EnumCaseMultiPayload)
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  else
  {
    v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    swift_bridgeObjectRetain();
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

_QWORD *assignWithCopy for EventValue(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  int EnumCaseMultiPayload;
  uint64_t v7;

  if (a1 != a2)
  {
    sub_2381ADDB4((uint64_t)a1);
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 5)
    {
      v7 = sub_2381C0670();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
    else if (EnumCaseMultiPayload)
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    }
    else
    {
      *a1 = *a2;
      a1[1] = a2[1];
      swift_bridgeObjectRetain();
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

void *initializeWithTake for EventValue(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6;

  if (swift_getEnumCaseMultiPayload() == 5)
  {
    v6 = sub_2381C0670();
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  return a1;
}

void *assignWithTake for EventValue(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6;

  if (a1 != a2)
  {
    sub_2381ADDB4((uint64_t)a1);
    if (swift_getEnumCaseMultiPayload() == 5)
    {
      v6 = sub_2381C0670();
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

uint64_t getEnumTagSinglePayload for EventValue(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a3 - 8) + 48))();
}

uint64_t storeEnumTagSinglePayload for EventValue(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a4 - 8) + 56))();
}

uint64_t sub_2381AF0F8()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_2381AF108()
{
  uint64_t result;
  unint64_t v1;

  result = sub_2381C0670();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for Event()
{
  return &type metadata for Event;
}

ValueMetadata *type metadata accessor for Event.Keys()
{
  return &type metadata for Event.Keys;
}

uint64_t sub_2381AF1B4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for EventValue();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_2381AF1F8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_2381AF23C()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 40) = v0;
  return swift_task_switch();
}

uint64_t sub_2381AF254()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t result;
  uint64_t v3;
  xpc_object_t v4;
  uint64_t v5;
  char v6;
  char v7;
  _QWORD *v8;

  v1 = *(_QWORD *)(v0[5] + 112);
  result = swift_beginAccess();
  v3 = *(_QWORD *)(v1 + 40);
  v0[6] = v3;
  if (v3)
  {
    swift_retain();
    v4 = XPCDictionary.init()();
    v5 = XPCMessage.init(ty:payload:)(1u, (uint64_t)v4);
    v7 = v6;
    v0[7] = v5;
    v8 = (_QWORD *)swift_task_alloc();
    v0[8] = v8;
    *v8 = v0;
    v8[1] = sub_2381AD330;
    return XPCConnection.sendWithReply(_:)(v5, v7);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_2381AF2FC()
{
  SubmitEventsActivityConfig.activityFlags.unsafeMutableAddressor();
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

uint64_t sub_2381AF33C()
{
  uint64_t v0;

  v0 = *(_QWORD *)SubmitEventsActivityConfig.identifier.unsafeMutableAddressor();
  swift_bridgeObjectRetain();
  return v0;
}

unint64_t sub_2381AF36C(uint64_t a1)
{
  unint64_t result;

  result = sub_2381AF390();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t sub_2381AF390()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2542CA618;
  if (!qword_2542CA618)
  {
    v1 = type metadata accessor for SubmitEventsActivity();
    result = MEMORY[0x23B82E4F4](&unk_2381C1440, v1);
    atomic_store(result, (unint64_t *)&qword_2542CA618);
  }
  return result;
}

uint64_t type metadata accessor for SubmitEventsActivity()
{
  return objc_opt_self();
}

uint64_t sub_2381AF3F4(char a1)
{
  uint64_t v1;
  char v2;
  _QWORD *v3;

  v2 = a1 & 1;
  swift_allocObject();
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_2381AF454;
  return sub_2381AF4A8(v2);
}

uint64_t sub_2381AF454(uint64_t a1)
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

uint64_t sub_2381AF4A8(char a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  *(_QWORD *)(v2 + 96) = v1;
  *(_BYTE *)(v2 + 208) = a1;
  v3 = sub_2381C06D0();
  *(_QWORD *)(v2 + 104) = v3;
  *(_QWORD *)(v2 + 112) = *(_QWORD *)(v3 - 8);
  *(_QWORD *)(v2 + 120) = swift_task_alloc();
  v4 = sub_2381C0874();
  *(_QWORD *)(v2 + 128) = v4;
  *(_QWORD *)(v2 + 136) = *(_QWORD *)(v4 - 8);
  *(_QWORD *)(v2 + 144) = swift_task_alloc();
  *(_QWORD *)(v2 + 152) = sub_2381C0868();
  *(_QWORD *)(v2 + 160) = swift_task_alloc();
  sub_2381C06E8();
  *(_QWORD *)(v2 + 168) = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_2381AF578()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;

  v17 = *(_QWORD *)(v0 + 136);
  v18 = *(_QWORD *)(v0 + 144);
  v1 = *(_QWORD *)(v0 + 120);
  v19 = *(_QWORD *)(v0 + 128);
  v3 = *(_QWORD *)(v0 + 104);
  v2 = *(_QWORD *)(v0 + 112);
  v4 = *(_QWORD *)(v0 + 96);
  v20 = *(_BYTE *)(v0 + 208) & 1;
  sub_2381AFA98();
  *(_QWORD *)(v4 + 32) = 0;
  *(_QWORD *)(v4 + 40) = 0;
  sub_2381C06DC();
  *(_QWORD *)(v0 + 88) = MEMORY[0x24BEE4AF8];
  sub_2381AFAD4();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2542CA620);
  sub_2381AFB1C();
  sub_2381C08B0();
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v17 + 104))(v18, *MEMORY[0x24BEE5758], v19);
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v2 + 104))(v1, *MEMORY[0x24BEE5470], v3);
  sub_2381C088C();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  v5 = (void *)sub_2381C0880();
  *(_QWORD *)(v0 + 176) = v5;
  *(_QWORD *)(v4 + 16) = v5;
  *(_BYTE *)(v4 + 24) = v20;
  if (v20)
  {
    v10 = *(_QWORD *)(v0 + 96);
    type metadata accessor for XPCConnection();
    swift_allocObject();
    v11 = v5;
    swift_retain();
    XPCConnection.init(serviceName:targetQ:listen:delegate:)(0xD000000000000023, 0x80000002381C2290, v11, 0, v10, (uint64_t)&off_2509F3A68);
    v13 = v12;
    v14 = *(_QWORD *)(v0 + 96);
    swift_beginAccess();
    *(_QWORD *)(v14 + 40) = v13;
    swift_release();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(_QWORD *)(v0 + 96));
  }
  else
  {
    v6 = (void *)objc_opt_self();
    v7 = v5;
    v8 = objc_msgSend(v6, sel_mainBundle);
    v9 = objc_msgSend(v8, sel_bundleIdentifier);

    if (v9)
    {
      sub_2381C073C();

    }
    sub_2381C06A0();
    swift_allocObject();
    v16 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 184) = v16;
    *v16 = v0;
    v16[1] = sub_2381AF894;
    return sub_2381C0694();
  }
}

uint64_t sub_2381AF894(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;

  v4 = *v2;
  *(_QWORD *)(*v2 + 192) = v1;
  swift_task_dealloc();
  if (!v1)
    *(_QWORD *)(v4 + 200) = a1;
  return swift_task_switch();
}

uint64_t sub_2381AF908()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t result;
  void *v4;
  uint64_t v5;
  uint64_t v6;

  v1 = *(_QWORD *)(v0 + 200);
  v2 = *(_QWORD *)(v0 + 96);
  swift_beginAccess();
  *(_QWORD *)(v2 + 32) = v1;
  result = swift_release();
  if (*(_QWORD *)(v2 + 32))
  {
    v4 = *(void **)(v0 + 176);
    swift_retain();
    swift_retain();
    v5 = sub_2381C0688();
    swift_release();
    swift_release();

    v6 = *(_QWORD *)(v0 + 96);
    swift_beginAccess();
    *(_QWORD *)(v6 + 40) = v5;
    swift_release();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(_QWORD *)(v0 + 96));
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_2381AFA1C()
{
  uint64_t v0;

  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

unint64_t sub_2381AFA98()
{
  unint64_t result;

  result = qword_2542CA640;
  if (!qword_2542CA640)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2542CA640);
  }
  return result;
}

unint64_t sub_2381AFAD4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2542CA638;
  if (!qword_2542CA638)
  {
    v1 = sub_2381C0868();
    result = MEMORY[0x23B82E4F4](MEMORY[0x24BEE5698], v1);
    atomic_store(result, (unint64_t *)&qword_2542CA638);
  }
  return result;
}

unint64_t sub_2381AFB1C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2542CA628;
  if (!qword_2542CA628)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2542CA620);
    result = MEMORY[0x23B82E4F4](MEMORY[0x24BEE12C8], v1);
    atomic_store(result, (unint64_t *)&qword_2542CA628);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x23B82E4E8](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_2381AFBAC()
{
  uint64_t v0;

  swift_release();
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for ConnectionManager()
{
  return objc_opt_self();
}

uint64_t sub_2381AFC00()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 40) = v0;
  return swift_task_switch();
}

uint64_t sub_2381AFC18()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t result;
  uint64_t v3;
  xpc_object_t v4;
  uint64_t v5;
  char v6;
  char v7;
  _QWORD *v8;

  v1 = *(_QWORD *)(v0[5] + 112);
  result = swift_beginAccess();
  v3 = *(_QWORD *)(v1 + 40);
  v0[6] = v3;
  if (v3)
  {
    swift_retain();
    v4 = XPCDictionary.init()();
    v5 = XPCMessage.init(ty:payload:)(3u, (uint64_t)v4);
    v7 = v6;
    v0[7] = v5;
    v8 = (_QWORD *)swift_task_alloc();
    v0[8] = v8;
    *v8 = v0;
    v8[1] = sub_2381AD330;
    return XPCConnection.sendWithReply(_:)(v5, v7);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_2381AFCC0()
{
  CacheCleanupActivityConfig.activityFlags.unsafeMutableAddressor();
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

uint64_t sub_2381AFD00()
{
  uint64_t v0;

  v0 = *(_QWORD *)CacheCleanupActivityConfig.identifier.unsafeMutableAddressor();
  swift_bridgeObjectRetain();
  return v0;
}

unint64_t sub_2381AFD30(uint64_t a1)
{
  unint64_t result;

  result = sub_2381AFD54();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t sub_2381AFD54()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2542CA608;
  if (!qword_2542CA608)
  {
    v1 = type metadata accessor for CacheCleanupActivity();
    result = MEMORY[0x23B82E4F4](&unk_2381C1500, v1);
    atomic_store(result, (unint64_t *)&qword_2542CA608);
  }
  return result;
}

uint64_t type metadata accessor for CacheCleanupActivity()
{
  return objc_opt_self();
}

unint64_t sub_2381AFDB8()
{
  sub_2381C08BC();
  swift_bridgeObjectRelease();
  sub_2381C076C();
  return 0xD000000000000016;
}

unint64_t sub_2381AFE34()
{
  return sub_2381AFDB8();
}

uint64_t sub_2381AFE58@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  id v8;
  id v9;
  BOOL v10;
  id v11;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  id v22[2];
  _BYTE v23[32];

  v4 = sub_2381C0670();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2381B01E4((uint64_t)a1, (uint64_t)v23);
  if (swift_dynamicCast())
  {
    v8 = v22[1];
    *(id *)a2 = v22[0];
    *(_QWORD *)(a2 + 8) = v8;
  }
  else
  {
    sub_2381B0220(0, &qword_2542C9E70);
    if (!swift_dynamicCast())
      goto LABEL_29;
    v9 = v22[0];
    if (*MEMORY[0x24BDBD270])
      v10 = v22[0] == (id)*MEMORY[0x24BDBD270];
    else
      v10 = 0;
    if (v10)
    {

      *(_BYTE *)a2 = 1;
      goto LABEL_15;
    }
    v11 = (id)*MEMORY[0x24BDBD268];

    if (!v11 || v9 != v11)
    {
LABEL_29:
      if (swift_dynamicCast() || swift_dynamicCast() || swift_dynamicCast())
      {
        *(id *)a2 = v22[0];
        type metadata accessor for EventValue();
        goto LABEL_16;
      }
      if (swift_dynamicCast())
      {
        (*(void (**)(uint64_t, char *, uint64_t))(v5 + 32))(a2, v7, v4);
        type metadata accessor for EventValue();
        goto LABEL_16;
      }
      sub_2381B0220(0, &qword_2542C9E38);
      if (swift_dynamicCast())
      {
        v13 = v22[0];
        if (objc_msgSend(v22[0], sel_respondsToSelector_, sel_description))
        {
          v14 = objc_msgSend(v13, sel_description);
          v15 = sub_2381C073C();
          v17 = v16;

          *(_QWORD *)a2 = v15;
          *(_QWORD *)(a2 + 8) = v17;
          goto LABEL_15;
        }

      }
      __swift_project_boxed_opaque_existential_0(a1, a1[3]);
      v22[0] = (id)swift_getDynamicType();
      __swift_instantiateConcreteTypeFromMangledName(&qword_2568E6050);
      v18 = sub_2381C0748();
      v20 = v19;
      sub_2381B027C();
      swift_allocError();
      *v21 = v18;
      v21[1] = v20;
      swift_willThrow();
      return __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v23);
    }
    *(_BYTE *)a2 = 0;
  }
LABEL_15:
  type metadata accessor for EventValue();
LABEL_16:
  swift_storeEnumTagMultiPayload();
  return __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v23);
}

uint64_t sub_2381B01E4(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_2381B0220(uint64_t a1, unint64_t *a2)
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

_QWORD *__swift_project_boxed_opaque_existential_0(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_2381B027C()
{
  unint64_t result;

  result = qword_2568E6058;
  if (!qword_2568E6058)
  {
    result = MEMORY[0x23B82E4F4](&unk_2381C1650, &type metadata for LegacyClientError);
    atomic_store(result, (unint64_t *)&qword_2568E6058);
  }
  return result;
}

uint64_t sub_2381B02C0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  int64_t i;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t v22;
  int64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  int isUniquelyReferenced_nonNull_native;
  char v31;
  unint64_t v32;
  uint64_t v33;
  _BOOL8 v34;
  uint64_t v35;
  char v36;
  unint64_t v37;
  char v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t v41;
  BOOL v42;
  uint64_t v43;
  int64_t v44;
  uint64_t result;
  uint64_t v46;
  int64_t v47;
  uint64_t v48;
  int64_t v49;
  _OWORD *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t *v53;
  unint64_t v54;
  int64_t v55;
  __int128 v56;
  _OWORD v57[2];
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  _QWORD *v61;

  v2 = v1;
  v4 = type metadata accessor for EventValue();
  v52 = *(_QWORD *)(v4 - 8);
  v5 = MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v46 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v46 - v8;
  v10 = (_QWORD *)sub_2381C070C();
  v11 = *(_QWORD *)(a1 + 64);
  v48 = a1 + 64;
  v12 = 1 << *(_BYTE *)(a1 + 32);
  v13 = -1;
  if (v12 < 64)
    v13 = ~(-1 << v12);
  v14 = v13 & v11;
  v49 = (unint64_t)(v12 + 63) >> 6;
  v50 = v57;
  v53 = &v60;
  v47 = v49 - 1;
  v51 = a1;
  swift_bridgeObjectRetain();
  for (i = 0; ; i = v55)
  {
    if (v14)
    {
      v17 = __clz(__rbit64(v14));
      v18 = (v14 - 1) & v14;
      v19 = v17 | (i << 6);
LABEL_8:
      v20 = *(_QWORD *)(v51 + 56);
      v21 = (_QWORD *)(*(_QWORD *)(v51 + 48) + 16 * v19);
      v22 = v21[1];
      *(_QWORD *)&v56 = *v21;
      *((_QWORD *)&v56 + 1) = v22;
      sub_2381B01E4(v20 + 32 * v19, (uint64_t)v50);
      swift_bridgeObjectRetain();
      goto LABEL_18;
    }
    v23 = i + 1;
    if (__OFADD__(i, 1))
      goto LABEL_47;
    if (v23 < v49)
    {
      v24 = *(_QWORD *)(v48 + 8 * v23);
      if (v24)
        goto LABEL_12;
      i += 2;
      if (v23 + 1 >= v49)
      {
        i = v23;
      }
      else
      {
        v24 = *(_QWORD *)(v48 + 8 * i);
        if (v24)
        {
          ++v23;
LABEL_12:
          v18 = (v24 - 1) & v24;
          v19 = __clz(__rbit64(v24)) + (v23 << 6);
          i = v23;
          goto LABEL_8;
        }
        if (v23 + 2 < v49)
        {
          v24 = *(_QWORD *)(v48 + 8 * (v23 + 2));
          if (v24)
          {
            v23 += 2;
            goto LABEL_12;
          }
          v44 = v23 + 3;
          if (v23 + 3 < v49)
          {
            v24 = *(_QWORD *)(v48 + 8 * v44);
            if (!v24)
            {
              while (1)
              {
                v23 = v44 + 1;
                if (__OFADD__(v44, 1))
                  goto LABEL_48;
                if (v23 >= v49)
                {
                  i = v47;
                  goto LABEL_17;
                }
                v24 = *(_QWORD *)(v48 + 8 * v23);
                ++v44;
                if (v24)
                  goto LABEL_12;
              }
            }
            v23 += 3;
            goto LABEL_12;
          }
          i = v23 + 2;
        }
      }
    }
LABEL_17:
    v18 = 0;
    memset(v57, 0, sizeof(v57));
    v56 = 0u;
LABEL_18:
    sub_2381B0710((uint64_t)&v56, (uint64_t)&v58);
    v25 = v59;
    if (!v59)
      goto LABEL_44;
    v26 = v58;
    sub_2381B0758(v53, &v56);
    sub_2381AFE58(&v56, (uint64_t)v9);
    if (v2)
    {
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)&v56);
      swift_bridgeObjectRelease();
LABEL_44:
      swift_release();
      return (uint64_t)v10;
    }
    v54 = v18;
    v55 = i;
    v27 = v9;
    v28 = (uint64_t)v9;
    v29 = (uint64_t)v7;
    sub_2381B63B8(v28, (uint64_t)v7, (uint64_t (*)(_QWORD))type metadata accessor for EventValue);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v61 = v10;
    v32 = sub_2381ADD0C(v26, v25);
    v33 = v10[2];
    v34 = (v31 & 1) == 0;
    v35 = v33 + v34;
    if (__OFADD__(v33, v34))
      break;
    v36 = v31;
    if (v10[3] >= v35)
    {
      if ((isUniquelyReferenced_nonNull_native & 1) != 0)
      {
        v10 = v61;
        if ((v31 & 1) != 0)
          goto LABEL_4;
      }
      else
      {
        sub_2381AE354();
        v10 = v61;
        if ((v36 & 1) != 0)
          goto LABEL_4;
      }
    }
    else
    {
      sub_2381AE580(v35, isUniquelyReferenced_nonNull_native);
      v37 = sub_2381ADD0C(v26, v25);
      if ((v36 & 1) != (v38 & 1))
        goto LABEL_49;
      v32 = v37;
      v10 = v61;
      if ((v36 & 1) != 0)
      {
LABEL_4:
        v16 = v10[7] + *(_QWORD *)(v52 + 72) * v32;
        v7 = (char *)v29;
        sub_2381AF1B4(v29, v16);
        goto LABEL_5;
      }
    }
    v10[(v32 >> 6) + 8] |= 1 << v32;
    v39 = (uint64_t *)(v10[6] + 16 * v32);
    *v39 = v26;
    v39[1] = v25;
    v40 = v10[7] + *(_QWORD *)(v52 + 72) * v32;
    v7 = (char *)v29;
    sub_2381B63B8(v29, v40, (uint64_t (*)(_QWORD))type metadata accessor for EventValue);
    v41 = v10[2];
    v42 = __OFADD__(v41, 1);
    v43 = v41 + 1;
    if (v42)
      goto LABEL_46;
    v10[2] = v43;
    swift_bridgeObjectRetain();
LABEL_5:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)&v56);
    v9 = v27;
    v2 = 0;
    v14 = v54;
  }
  __break(1u);
LABEL_46:
  __break(1u);
LABEL_47:
  __break(1u);
LABEL_48:
  __break(1u);
LABEL_49:
  result = sub_2381C0970();
  __break(1u);
  return result;
}

uint64_t sub_2381B0710(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542C9E30);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

_OWORD *sub_2381B0758(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

BOOL sub_2381B0768(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_2381B0780()
{
  sub_2381C09DC();
  sub_2381C09E8();
  return sub_2381C0A00();
}

uint64_t sub_2381B07C4()
{
  return sub_2381C09E8();
}

uint64_t sub_2381B07EC()
{
  sub_2381C09DC();
  sub_2381C09E8();
  return sub_2381C0A00();
}

xpc_object_t sub_2381B082C()
{
  unsigned __int8 *v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  int v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v19;
  xpc_object_t v20;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542CA000);
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)&v19 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = *v0;
  v5 = v0[1];
  v7 = *((_QWORD *)v0 + 1);
  v6 = *((_QWORD *)v0 + 2);
  v20 = XPCDictionary.init()();
  MessageKeys.tcAllowsCellularAccess.unsafeMutableAddressor();
  if (v4 == 2)
    *v3 = 0;
  else
    *v3 = v4 & 1;
  v8 = type metadata accessor for XPCObject();
  swift_storeEnumTagMultiPayload();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v3, 0, 1, v8);
  swift_bridgeObjectRetain();
  XPCDictionary.subscript.setter((uint64_t)v3);
  MessageKeys.tcAllowsExpensiveAccess.unsafeMutableAddressor();
  if (v5 == 2)
    *v3 = 0;
  else
    *v3 = v5 & 1;
  v9 = type metadata accessor for XPCObject();
  swift_storeEnumTagMultiPayload();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v3, 0, 1, v9);
  swift_bridgeObjectRetain();
  XPCDictionary.subscript.setter((uint64_t)v3);
  if (v6)
  {
    swift_bridgeObjectRetain();
    MessageKeys.tcBundleID.unsafeMutableAddressor();
    *(_QWORD *)v3 = v7;
    *((_QWORD *)v3 + 1) = v6;
    v10 = type metadata accessor for XPCObject();
    swift_storeEnumTagMultiPayload();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v3, 0, 1, v10);
    swift_bridgeObjectRetain();
    v11 = (uint64_t)v3;
LABEL_11:
    XPCDictionary.subscript.setter(v11);
    return v20;
  }
  v12 = objc_msgSend((id)objc_opt_self(), sel_mainBundle);
  v13 = objc_msgSend(v12, sel_bundleIdentifier);

  if (v13)
  {
    v14 = sub_2381C073C();
    v16 = v15;

    MessageKeys.tcBundleID.unsafeMutableAddressor();
    *(_QWORD *)v3 = v14;
    *((_QWORD *)v3 + 1) = v16;
    v17 = type metadata accessor for XPCObject();
    swift_storeEnumTagMultiPayload();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 56))(v3, 0, 1, v17);
    swift_bridgeObjectRetain();
    v11 = (uint64_t)v3;
    goto LABEL_11;
  }
  return v20;
}

CloudTelemetry::TransportConfiguration __swiftcall TransportConfiguration.init(allowCellularAccess:allowExpensiveAccess:bundleID:)(Swift::Bool_optional allowCellularAccess, Swift::Bool_optional allowExpensiveAccess, Swift::String_optional bundleID)
{
  uint64_t v3;
  CloudTelemetry::TransportConfiguration result;

  *(Swift::Bool_optional *)v3 = allowCellularAccess;
  *(Swift::Bool_optional *)(v3 + 1) = allowExpensiveAccess;
  *(Swift::String_optional *)(v3 + 8) = bundleID;
  result.bundleID.value._object = (void *)bundleID.value._countAndFlagsBits;
  LOBYTE(result.bundleID.value._countAndFlagsBits) = allowExpensiveAccess;
  result.allowCellularAccess = allowCellularAccess;
  return result;
}

uint64_t static CloudTelemetry.setupXpcServiceActivities()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v11[4];

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542CA030);
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)v11 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_2381C07F0();
  v5 = *(_QWORD *)(v4 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56))(v3, 1, 1, v4);
  v6 = (_QWORD *)swift_allocObject();
  v6[2] = 0;
  v6[3] = 0;
  v6[4] = v0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4) == 1)
  {
    sub_2381B6880((uint64_t)v3, &qword_2542CA030);
  }
  else
  {
    sub_2381C07E4();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v3, v4);
    if (v6[2])
    {
      swift_getObjectType();
      swift_unknownObjectRetain();
      v7 = sub_2381C07C0();
      v9 = v8;
      swift_unknownObjectRelease();
      if (v9 | v7)
      {
        v11[0] = 0;
        v11[1] = 0;
        v11[2] = v7;
        v11[3] = v9;
      }
    }
  }
  swift_task_create();
  return swift_release();
}

{
  return swift_task_switch();
}

uint64_t sub_2381B0C9C()
{
  return swift_task_switch();
}

uint64_t sub_2381B0CB0()
{
  uint64_t v0;
  _QWORD *v1;

  if (qword_2542CA7B8 != -1)
    swift_once();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 24) = v1;
  type metadata accessor for Reporter();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2542CA650);
  *v1 = v0;
  v1[1] = sub_2381B0D64;
  return sub_2381C07FC();
}

uint64_t sub_2381B0D64()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;
  _QWORD *v4;

  v2 = (_QWORD *)*v1;
  v2[4] = v0;
  swift_task_dealloc();
  if (!v0)
  {
    v3 = v2[2];
    v2[5] = v3;
    v4 = (_QWORD *)swift_task_alloc();
    v2[6] = v4;
    *v4 = v2;
    v4[1] = sub_2381B0DF8;
    v4[5] = v3;
  }
  return swift_task_switch();
}

uint64_t sub_2381B0DF8()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 56) = v0;
  swift_task_dealloc();
  if (v0)
    return swift_task_switch();

  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_2381B0E6C()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2381B0E78()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2381B0EC0()
{
  uint64_t v0;
  _QWORD *v1;

  if (qword_2542CA7B8 != -1)
    swift_once();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 24) = v1;
  type metadata accessor for Reporter();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2542CA650);
  *v1 = v0;
  v1[1] = sub_2381B0F74;
  return sub_2381C07FC();
}

uint64_t sub_2381B0F74()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;
  _QWORD *v4;

  v2 = (_QWORD *)*v1;
  v2[4] = v0;
  swift_task_dealloc();
  if (!v0)
  {
    v3 = v2[2];
    v2[5] = v3;
    v4 = (_QWORD *)swift_task_alloc();
    v2[6] = v4;
    *v4 = v2;
    v4[1] = sub_2381B1008;
    v4[5] = v3;
  }
  return swift_task_switch();
}

uint64_t sub_2381B1008()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 56) = v0;
  swift_task_dealloc();
  if (v0)
    return swift_task_switch();

  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_2381B107C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;

  v5 = sub_2381C07F0();
  v6 = *(_QWORD *)(v5 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(a1, 1, v5) != 1)
  {
    sub_2381C07E4();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
    if (!*(_QWORD *)(a3 + 16))
      return swift_task_create();
    goto LABEL_3;
  }
  sub_2381B6880(a1, &qword_2542CA030);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_2381C07C0();
    swift_unknownObjectRelease();
  }
  return swift_task_create();
}

uint64_t static Reporter.setupXpcServiceActivities()()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 24) = v0;
  return swift_task_switch();
}

uint64_t sub_2381B1200()
{
  uint64_t v0;
  _QWORD *v1;

  if (qword_2542CA7B8 != -1)
    swift_once();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 32) = v1;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2542CA650);
  *v1 = v0;
  v1[1] = sub_2381B12AC;
  return sub_2381C07FC();
}

uint64_t sub_2381B12AC()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;
  _QWORD *v4;

  v2 = (_QWORD *)*v1;
  v2[5] = v0;
  swift_task_dealloc();
  if (!v0)
  {
    v3 = v2[2];
    v2[6] = v3;
    v4 = (_QWORD *)swift_task_alloc();
    v2[7] = v4;
    *v4 = v2;
    v4[1] = sub_2381B1340;
    v4[5] = v3;
  }
  return swift_task_switch();
}

uint64_t sub_2381B1340()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 64) = v0;
  swift_task_dealloc();
  if (v0)
    return swift_task_switch();

  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_2381B13B4()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2381B13C0()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t static CloudTelemetry.report(teamID:eventName:event:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_2381B1568(a1, a2, a3, a4, a5, (uint64_t)&unk_2509F3B00, (uint64_t)&unk_2568E60F8);
}

uint64_t sub_2381B1418(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  _QWORD *v14;
  uint64_t (*v16)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);

  v16 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((char *)&dword_2568E6108 + dword_2568E6108);
  v14 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v8 + 16) = v14;
  *v14 = v8;
  v14[1] = sub_2381AD438;
  return v16(a4, a5, a6, a7, a8);
}

uint64_t static CloudTelemetry.report(teamID:eventType:event:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  _QWORD *v11;
  uint64_t (*v13)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);

  v13 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((char *)&dword_2568E6108 + dword_2568E6108);
  v11 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v5 + 16) = v11;
  *v11 = v5;
  v11[1] = sub_2381B86B0;
  return v13(a1, a2, a3, a4, a5);
}

{
  return sub_2381B1568(a1, a2, a3, a4, a5, (uint64_t)&unk_2509F3B28, (uint64_t)&unk_2568E6118);
}

uint64_t sub_2381B1568(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t result;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;

  v22 = a7;
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542CA030);
  MEMORY[0x24BDAC7A8](v14);
  v16 = (char *)&v21 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = sub_2381B02C0(a5);
  if (!v8)
  {
    v18 = result;
    v19 = sub_2381C07F0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 56))(v16, 1, 1, v19);
    v20 = (_QWORD *)swift_allocObject();
    v20[2] = 0;
    v20[3] = 0;
    v20[4] = a1;
    v20[5] = a2;
    v20[6] = a3;
    v20[7] = a4;
    v20[8] = v18;
    v20[9] = v7;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_2381B107C((uint64_t)v16, v22, (uint64_t)v20);
    return swift_release();
  }
  return result;
}

uint64_t sub_2381B1680(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  _QWORD *v14;
  uint64_t (*v16)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);

  v16 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((char *)&dword_2568E6108 + dword_2568E6108);
  v14 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v8 + 16) = v14;
  *v14 = v8;
  v14[1] = sub_2381B86B0;
  return v16(a4, a5, a6, a7, a8);
}

uint64_t sub_2381B171C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void (*a7)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v8 = sub_2381C073C();
  v10 = v9;
  v11 = sub_2381C073C();
  v13 = v12;
  v14 = sub_2381C06F4();
  swift_getObjCClassMetadata();
  a7(v8, v10, v11, v13, v14);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return 1;
}

uint64_t sub_2381B1830(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7)
{
  uint64_t v7;
  uint64_t v8;

  *(_QWORD *)(v8 + 656) = v7;
  *(_BYTE *)(v8 + 745) = a7;
  *(_QWORD *)(v8 + 648) = a5;
  *(_QWORD *)(v8 + 640) = a4;
  *(_QWORD *)(v8 + 632) = a3;
  *(_QWORD *)(v8 + 624) = a2;
  *(_QWORD *)(v8 + 616) = a1;
  *(_QWORD *)(v8 + 664) = swift_getObjectType();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2542CA030);
  *(_QWORD *)(v8 + 672) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2542CA000);
  *(_QWORD *)(v8 + 680) = swift_task_alloc();
  *(_WORD *)(v8 + 746) = *(_WORD *)a6;
  *(_OWORD *)(v8 + 688) = *(_OWORD *)(a6 + 8);
  return swift_task_switch();
}

uint64_t sub_2381B18E8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t inited;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  _QWORD *v22;
  _QWORD *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  _QWORD *v28;
  _QWORD *v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD *v32;
  _BYTE *v33;
  _QWORD *v34;
  uint64_t v35;
  _QWORD *v36;
  xpc_object_t *v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;
  xpc_object_t v41;
  _OWORD *v42;
  unint64_t v43;
  char v44;
  uint64_t v45;
  NSObject *v46;
  os_log_type_t v47;
  uint8_t *v48;
  const char *v49;
  uint64_t v50;
  _BYTE *v51;
  __int128 v53;
  uint64_t v54;
  uint64_t v55;
  _QWORD *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  _QWORD *v60;
  _QWORD *v61;
  _QWORD *v62;
  uint64_t v63;
  _QWORD *v64;
  _QWORD *v65;
  uint64_t *v66;
  uint64_t v67;
  uint64_t v68;
  xpc_object_t v69;
  _QWORD *v70;
  _OWORD *v71;
  uint64_t v72;
  unint64_t v73;
  unint64_t v74;
  _OWORD *v75;
  uint64_t v76;

  v75 = (_OWORD *)(v0 + 208);
  v1 = *(_QWORD *)(v0 + 640);
  v2 = *(_QWORD *)(v0 + 632);
  v3 = *(_QWORD *)(v0 + 624);
  v4 = *(_QWORD *)(v0 + 616);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2542C9E88);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_2381C1570;
  *(_QWORD *)(inited + 32) = 0xD000000000000013;
  *(_QWORD *)(inited + 40) = 0x80000002381C2370;
  v6 = MEMORY[0x24BEE0D00];
  *(_QWORD *)(inited + 72) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(inited + 48) = v4;
  *(_QWORD *)(inited + 56) = v3;
  swift_bridgeObjectRetain();
  v7 = sub_2381B2DA4(inited);
  v8 = swift_initStackObject();
  *(_OWORD *)(v8 + 16) = xmmword_2381C1570;
  *(_QWORD *)(v8 + 32) = 0x7954746E6576655FLL;
  *(_QWORD *)(v8 + 40) = 0xEA00000000006570;
  *(_QWORD *)(v8 + 48) = v2;
  *(_QWORD *)(v8 + 72) = v6;
  *(_QWORD *)(v8 + 56) = v1;
  swift_bridgeObjectRetain();
  v9 = sub_2381B2DA4(v8);
  if (*(_QWORD *)(v9 + 16) && (v10 = sub_2381ADD0C(0x7954746E6576655FLL, 0xEA00000000006570), (v11 & 1) != 0))
  {
    sub_2381B01E4(*(_QWORD *)(v9 + 56) + 32 * v10, v0 + 176);
  }
  else
  {
    *(_OWORD *)(v0 + 176) = 0u;
    *(_OWORD *)(v0 + 192) = 0u;
  }
  swift_bridgeObjectRelease();
  sub_2381AF1F8(v0 + 176, (uint64_t)v75, qword_2542C9E90);
  if (*(_QWORD *)(v0 + 232))
  {
    sub_2381B0758(v75, (_OWORD *)(v0 + 528));
    sub_2381B01E4(v0 + 528, v0 + 496);
    if ((swift_dynamicCast() & 1) == 0)
    {
      *(_QWORD *)(v0 + 592) = 0;
      *(_QWORD *)(v0 + 600) = 0;
    }
    __swift_destroy_boxed_opaque_existential_0Tm(v0 + 528);
    v12 = *(_QWORD *)(v0 + 592);
    v13 = *(_QWORD *)(v0 + 600);
  }
  else
  {
    v13 = 0;
    v12 = 0;
  }
  sub_2381B6880(v0 + 176, qword_2542C9E90);
  if (*(_QWORD *)(v7 + 16) && (v14 = sub_2381ADD0C(0xD000000000000013, 0x80000002381C2370), (v15 & 1) != 0))
  {
    sub_2381B01E4(*(_QWORD *)(v7 + 56) + 32 * v14, v0 + 240);
  }
  else
  {
    *(_OWORD *)(v0 + 240) = 0u;
    *(_OWORD *)(v0 + 256) = 0u;
  }
  sub_2381AF1F8(v0 + 240, v0 + 272, qword_2542C9E90);
  if (!*(_QWORD *)(v0 + 296))
  {
    sub_2381B6880(v0 + 240, qword_2542C9E90);
    if (v13)
      goto LABEL_23;
LABEL_27:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (qword_2542CA720 != -1)
      swift_once();
    v50 = sub_2381C06C4();
    __swift_project_value_buffer(v50, (uint64_t)qword_2542CA708);
    v46 = sub_2381C06AC();
    v47 = sub_2381C0850();
    if (!os_log_type_enabled(v46, v47))
      goto LABEL_32;
    v48 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v48 = 0;
    v49 = "invalid or missing eventType";
    goto LABEL_31;
  }
  sub_2381B0758((_OWORD *)(v0 + 272), (_OWORD *)(v0 + 432));
  sub_2381B01E4(v0 + 432, v0 + 464);
  if ((swift_dynamicCast() & 1) == 0)
  {
    *(_QWORD *)(v0 + 576) = 0;
    *(_QWORD *)(v0 + 584) = 0;
  }
  __swift_destroy_boxed_opaque_existential_0Tm(v0 + 432);
  v16 = *(_QWORD *)(v0 + 576);
  v17 = *(_QWORD *)(v0 + 584);
  sub_2381B6880(v0 + 240, qword_2542C9E90);
  if (!v13)
    goto LABEL_27;
  if (!v17)
  {
LABEL_23:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (qword_2542CA720 != -1)
      swift_once();
    v45 = sub_2381C06C4();
    __swift_project_value_buffer(v45, (uint64_t)qword_2542CA708);
    v46 = sub_2381C06AC();
    v47 = sub_2381C0850();
    if (!os_log_type_enabled(v46, v47))
      goto LABEL_32;
    v48 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v48 = 0;
    v49 = "invalid or missing clientType";
LABEL_31:
    _os_log_impl(&dword_2381AB000, v46, v47, v49, v48, 2u);
    MEMORY[0x23B82E590](v48, -1, -1);
LABEL_32:

    sub_2381B68BC();
    swift_allocError();
    *v51 = 1;
    swift_willThrow();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  v71 = (_OWORD *)(v0 + 336);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2542C9E80);
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542C9E58);
  v19 = *(_QWORD *)(v18 - 8);
  v74 = v7;
  v20 = *(_QWORD *)(v19 + 72);
  v21 = (*(unsigned __int8 *)(v19 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
  v72 = swift_allocObject();
  *(_OWORD *)(v72 + 16) = xmmword_2381C1580;
  v73 = v21;
  v22 = (_QWORD *)(v72 + v21);
  v23 = (_QWORD *)(v72 + v21 + *(int *)(v18 + 48));
  v24 = MessageKeys.eventType.unsafeMutableAddressor();
  v25 = *((_QWORD *)v24 + 1);
  *v22 = *(_QWORD *)v24;
  v22[1] = v25;
  *v23 = v12;
  v23[1] = v13;
  v26 = type metadata accessor for XPCObject();
  swift_storeEnumTagMultiPayload();
  v27 = (_QWORD *)((char *)v22 + v20);
  v28 = (_QWORD *)((char *)v22 + v20 + *(int *)(v18 + 48));
  swift_bridgeObjectRetain();
  v29 = MessageKeys.clientType.unsafeMutableAddressor();
  v30 = v29[1];
  *v27 = *v29;
  v27[1] = v30;
  v31 = v18;
  *v28 = v16;
  v28[1] = v17;
  swift_storeEnumTagMultiPayload();
  v32 = (_QWORD *)((char *)v22 + 2 * v20);
  v33 = (char *)v32 + *(int *)(v18 + 48);
  swift_bridgeObjectRetain();
  v34 = MessageKeys.legacyClient.unsafeMutableAddressor();
  v35 = v34[1];
  *v32 = *v34;
  v32[1] = v35;
  *v33 = 1;
  swift_storeEnumTagMultiPayload();
  v76 = v20;
  v36 = (_QWORD *)((char *)v22 + 3 * v20);
  v37 = (xpc_object_t *)((char *)v36 + *(int *)(v18 + 48));
  swift_bridgeObjectRetain();
  v38 = (uint64_t *)MessageKeys.transportConfiguration.unsafeMutableAddressor();
  v40 = *v38;
  v39 = v38[1];
  *v36 = v40;
  v36[1] = v39;
  swift_bridgeObjectRetain();
  *v37 = sub_2381B082C();
  swift_storeEnumTagMultiPayload();
  v41 = XPCDictionary.init(dictionaryLiteral:)(v72);
  *(_QWORD *)(v0 + 608) = v41;
  if (!*(_QWORD *)(v74 + 16))
  {
    v53 = 0uLL;
    v42 = (_OWORD *)(v0 + 304);
LABEL_35:
    *v42 = v53;
    v42[1] = v53;
    goto LABEL_36;
  }
  v42 = (_OWORD *)(v0 + 304);
  v43 = sub_2381ADD0C(0x676E696C706D6153, 0xEC00000044495555);
  if ((v44 & 1) == 0)
  {
    v53 = 0uLL;
    goto LABEL_35;
  }
  sub_2381B01E4(*(_QWORD *)(v74 + 56) + 32 * v43, v0 + 304);
LABEL_36:
  swift_bridgeObjectRelease();
  sub_2381AF1F8((uint64_t)v42, (uint64_t)v71, qword_2542C9E90);
  if (*(_QWORD *)(v0 + 360))
  {
    sub_2381B0758(v71, (_OWORD *)(v0 + 368));
    sub_2381B01E4(v0 + 368, v0 + 400);
    if ((swift_dynamicCast() & 1) == 0)
    {
      *(_QWORD *)(v0 + 560) = 0;
      *(_QWORD *)(v0 + 568) = 0;
    }
    __swift_destroy_boxed_opaque_existential_0Tm(v0 + 368);
    v54 = *(_QWORD *)(v0 + 560);
    v55 = *(_QWORD *)(v0 + 568);
    sub_2381B6880((uint64_t)v42, qword_2542C9E90);
    if (v55)
    {
      v56 = *(_QWORD **)(v0 + 680);
      MessageKeys.samplingUUID.unsafeMutableAddressor();
      *v56 = v54;
      v56[1] = v55;
      swift_storeEnumTagMultiPayload();
      (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v26 - 8) + 56))(v56, 0, 1, v26);
      swift_bridgeObjectRetain();
      XPCDictionary.subscript.setter((uint64_t)v56);
      v41 = *(xpc_object_t *)(v0 + 608);
    }
  }
  else
  {
    sub_2381B6880((uint64_t)v42, qword_2542C9E90);
  }
  v57 = swift_bridgeObjectRetain();
  v58 = nullsub_1(v57);
  v59 = swift_allocObject();
  *(_OWORD *)(v59 + 16) = xmmword_2381C1590;
  v60 = (_QWORD *)(v59 + v73);
  v61 = (_QWORD *)(v59 + v73 + *(int *)(v31 + 48));
  v62 = MessageKeys.sendOneMessageSessionInfo.unsafeMutableAddressor();
  v63 = v62[1];
  *v60 = *v62;
  v60[1] = v63;
  *v61 = v41;
  swift_storeEnumTagMultiPayload();
  v64 = (_QWORD *)(v59 + v73 + v76);
  v65 = (_QWORD *)((char *)v64 + *(int *)(v31 + 48));
  swift_bridgeObjectRetain();
  swift_unknownObjectRetain();
  v66 = (uint64_t *)MessageKeys.sendOneMessageEvent.unsafeMutableAddressor();
  v68 = *v66;
  v67 = v66[1];
  *v64 = v68;
  v64[1] = v67;
  swift_bridgeObjectRetain();
  v69 = sub_2381AD770(v58);
  swift_bridgeObjectRelease();
  *v65 = v69;
  swift_storeEnumTagMultiPayload();
  *(_QWORD *)(v0 + 704) = XPCDictionary.init(dictionaryLiteral:)(v59);
  v70 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 712) = v70;
  *v70 = v0;
  v70[1] = sub_2381B21AC;
  v70[5] = *(_QWORD *)(v0 + 656);
  return swift_task_switch();
}

uint64_t sub_2381B21AC()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 720) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_2381B2210()
{
  uint64_t v0;
  char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  os_unfair_lock_s *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  NSObject *v11;
  os_log_type_t v12;
  uint64_t v13;
  const char *v14;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  uint32_t v18;
  uint64_t v19;
  os_log_type_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  int v25;
  uint64_t v26;
  _QWORD *v27;
  id v28;
  _QWORD *v29;

  v3 = OBJC_IVAR___CloudTelemetryReporter_activeSendOneMessageCount;
  v4 = swift_task_alloc();
  v5 = *(_QWORD *)(*(_QWORD *)(v0 + 656) + v3);
  *(_OWORD *)(v4 + 16) = *(_OWORD *)(v0 + 656);
  v6 = (os_unfair_lock_s *)(v5 + 24);
  os_unfair_lock_lock((os_unfair_lock_t)(v5 + 24));
  v7 = *(_QWORD *)(v5 + 16);
  v8 = v7 + 1;
  if (__OFADD__(v7, 1))
  {
    __break(1u);
LABEL_18:
    swift_once();
LABEL_4:
    v9 = sub_2381C06C4();
    __swift_project_value_buffer(v9, (uint64_t)qword_2542CA708);
    v10 = v1;
    v11 = sub_2381C06AC();
    v12 = sub_2381C0844();
    if (os_log_type_enabled(v11, v12))
    {
      v13 = swift_slowAlloc();
      *(_DWORD *)v13 = 134349056;
      sub_2381C0898();

      v14 = "CloudTelemetry sendOneMessage limit (%{public}ld) exceeded";
      v15 = v11;
      v16 = v12;
      v17 = (uint8_t *)v13;
      v18 = 12;
LABEL_10:
      _os_log_impl(&dword_2381AB000, v15, v16, v14, v17, v18);
      MEMORY[0x23B82E590](v13, -1, -1);

      goto LABEL_12;
    }
    goto LABEL_11;
  }
  v1 = *(char **)(v4 + 16);
  v2 = *(_QWORD *)&v1[OBJC_IVAR___CloudTelemetryReporter_activeSendOneMessageLimit];
  if (v2 < v8)
  {
    if (qword_2542CA720 == -1)
      goto LABEL_4;
    goto LABEL_18;
  }
  *(_QWORD *)(v5 + 16) = v8;
  if (qword_2542CA720 != -1)
    swift_once();
  v19 = sub_2381C06C4();
  __swift_project_value_buffer(v19, (uint64_t)qword_2542CA708);
  v10 = v1;
  v11 = sub_2381C06AC();
  v20 = sub_2381C0838();
  if (os_log_type_enabled(v11, v20))
  {
    v13 = swift_slowAlloc();
    *(_DWORD *)v13 = 134349312;
    sub_2381C0898();
    *(_WORD *)(v13 + 12) = 2050;
    sub_2381C0898();

    v14 = "active sendOneMessage count now %{public}ld/%{public}ld";
    v15 = v11;
    v16 = v20;
    v17 = (uint8_t *)v13;
    v18 = 22;
    goto LABEL_10;
  }
LABEL_11:

LABEL_12:
  os_unfair_lock_unlock(v6);
  swift_task_dealloc();
  v21 = *(_QWORD *)(v0 + 704);
  if (v2 >= v8)
  {
    v22 = *(_QWORD *)(v0 + 672);
    v23 = *(_QWORD *)(v0 + 664);
    v24 = *(void **)(v0 + 656);
    v25 = *(unsigned __int8 *)(v0 + 745);
    v26 = sub_2381C07F0();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v26 - 8) + 56))(v22, 1, 1, v26);
    v27 = (_QWORD *)swift_allocObject();
    v27[2] = 0;
    v27[3] = 0;
    v27[4] = v24;
    v27[5] = v21;
    v27[6] = v23;
    v28 = v24;
    swift_unknownObjectRetain();
    *(_QWORD *)(v0 + 728) = sub_2381B4820(v22, (uint64_t)&unk_2568E6140, (uint64_t)v27);
    if (v25 == 1)
    {
      v29 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 736) = v29;
      *v29 = v0;
      v29[1] = sub_2381B25E4;
      return sub_2381C0814();
    }
    swift_release();
  }
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2381B25E4()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_2381B2638()
{
  uint64_t v0;

  swift_release();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2381B2694()
{
  uint64_t v0;

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

id CloudTelemetry.init()()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_init);
}

uint64_t sub_2381B2758()
{
  return 1;
}

uint64_t sub_2381B2760()
{
  sub_2381C09DC();
  sub_2381C09E8();
  return sub_2381C0A00();
}

uint64_t sub_2381B27A0()
{
  return sub_2381C09E8();
}

uint64_t sub_2381B27C4()
{
  sub_2381C09DC();
  sub_2381C09E8();
  return sub_2381C0A00();
}

const char *sub_2381B2800()
{
  return "CloudTelemetry";
}

const char *sub_2381B2814()
{
  return "CloudTelemetryInProcess";
}

uint64_t sub_2381B2828()
{
  uint64_t v0;

  v0 = sub_2381C06C4();
  __swift_allocate_value_buffer(v0, qword_2542CA708);
  __swift_project_value_buffer(v0, (uint64_t)qword_2542CA708);
  return sub_2381C06B8();
}

uint64_t sub_2381B28A4()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  _QWORD v10[4];

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542CA030);
  MEMORY[0x24BDAC7A8](v0);
  v2 = (char *)v10 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_2381C07F0();
  v4 = *(_QWORD *)(v3 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v4 + 56))(v2, 1, 1, v3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = 0;
  *(_QWORD *)(v5 + 24) = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v4 + 48))(v2, 1, v3) == 1)
  {
    sub_2381B6880((uint64_t)v2, &qword_2542CA030);
    v6 = 0;
    v7 = 0;
  }
  else
  {
    sub_2381C07E4();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v2, v3);
    if (*(_QWORD *)(v5 + 16))
    {
      swift_getObjectType();
      swift_unknownObjectRetain();
      v6 = sub_2381C07C0();
      v7 = v8;
      swift_unknownObjectRelease();
    }
    else
    {
      v6 = 0;
      v7 = 0;
    }
  }
  type metadata accessor for Reporter();
  if (v7 | v6)
  {
    v10[0] = 0;
    v10[1] = 0;
    v10[2] = v6;
    v10[3] = v7;
  }
  result = swift_task_create();
  qword_2542CAC60 = result;
  return result;
}

uint64_t sub_2381B2A40(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 56) = a1;
  return swift_task_switch();
}

uint64_t sub_2381B2A58()
{
  _QWORD *v0;
  char v1;
  _QWORD *v2;

  v0[5] = &type metadata for Reporter.CloudTelemetryFeatureFlags;
  v0[6] = sub_2381B85C4();
  v1 = sub_2381C067C();
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)(v0 + 2));
  type metadata accessor for ConnectionManager();
  v2 = (_QWORD *)swift_task_alloc();
  v0[8] = v2;
  *v2 = v0;
  v2[1] = sub_2381B2AE4;
  return sub_2381AF3F4((v1 & 1) == 0);
}

uint64_t sub_2381B2AE4(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;

  v4 = *v2;
  v5 = *v2;
  swift_task_dealloc();
  if (v1)
    return (*(uint64_t (**)(void))(v5 + 8))();
  *(_QWORD *)(v4 + 72) = a1;
  return swift_task_switch();
}

uint64_t sub_2381B2B60()
{
  uint64_t v0;
  uint64_t v1;
  id *v2;
  id v3;

  v1 = *(_QWORD *)(v0 + 72);
  v2 = *(id **)(v0 + 56);
  v3 = objc_allocWithZone((Class)type metadata accessor for Reporter());
  *v2 = sub_2381B2C2C(v1, 20);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

id sub_2381B2BB4(uint64_t a1, uint64_t a2)
{
  objc_class *v2;
  id v5;

  v5 = objc_allocWithZone(v2);
  return sub_2381B2C2C(a1, a2);
}

uint64_t sub_2381B2BF4()
{
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2568E6148);
  result = swift_allocObject();
  *(_DWORD *)(result + 24) = 0;
  *(_QWORD *)(result + 16) = 0;
  qword_2568E72B0 = result;
  return result;
}

id sub_2381B2C2C(uint64_t a1, uint64_t a2)
{
  char *v2;
  objc_class *ObjectType;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  objc_super v11;

  ObjectType = (objc_class *)swift_getObjectType();
  v6 = OBJC_IVAR___CloudTelemetryReporter_activeSendOneMessageCount;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2568E6148);
  v7 = swift_allocObject();
  *(_DWORD *)(v7 + 24) = 0;
  *(_QWORD *)(v7 + 16) = 0;
  *(_QWORD *)&v2[v6] = v7;
  v8 = OBJC_IVAR___CloudTelemetryReporter_xpcServiceXpcActivityStarted;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2568E6150);
  v9 = swift_allocObject();
  *(_DWORD *)(v9 + 20) = 0;
  *(_BYTE *)(v9 + 16) = 0;
  *(_QWORD *)&v2[v8] = v9;
  *(_QWORD *)&v2[OBJC_IVAR___CloudTelemetryReporter_connectionManager] = a1;
  *(_QWORD *)&v2[OBJC_IVAR___CloudTelemetryReporter_activeSendOneMessageLimit] = a2;
  v11.receiver = v2;
  v11.super_class = ObjectType;
  return objc_msgSendSuper2(&v11, sel_init);
}

unint64_t sub_2381B2CF4(char a1)
{
  unint64_t v1;
  unint64_t v2;
  uint64_t inited;
  uint64_t v4;

  if ((a1 & 1) != 0)
    v1 = 0xD000000000000011;
  else
    v1 = 0xD000000000000016;
  if ((a1 & 1) != 0)
    v2 = 0x80000002381C23D0;
  else
    v2 = 0x80000002381C23F0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2542C9E88);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_2381C1570;
  *(_QWORD *)(inited + 32) = sub_2381C073C();
  *(_QWORD *)(inited + 40) = v4;
  *(_QWORD *)(inited + 72) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(inited + 48) = v1;
  *(_QWORD *)(inited + 56) = v2;
  return sub_2381B2DA4(inited);
}

unint64_t sub_2381B2DA4(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t result;
  char v10;
  uint64_t *v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;

  if (!*(_QWORD *)(a1 + 16))
  {
    v3 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2542C9E78);
  v2 = sub_2381C0934();
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
    sub_2381AF1F8(v6, (uint64_t)&v15, (uint64_t *)&unk_2542C9E60);
    v7 = v15;
    v8 = v16;
    result = sub_2381ADD0C(v15, v16);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v11 = (uint64_t *)(v3[6] + 16 * result);
    *v11 = v7;
    v11[1] = v8;
    result = (unint64_t)sub_2381B0758(&v17, (_OWORD *)(v3[7] + 32 * result));
    v12 = v3[2];
    v13 = __OFADD__(v12, 1);
    v14 = v12 + 1;
    if (v13)
      goto LABEL_11;
    v3[2] = v14;
    v6 += 48;
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

uint64_t sub_2381B2ED8()
{
  sub_2381C09DC();
  sub_2381C09F4();
  return sub_2381C0A00();
}

uint64_t sub_2381B2F1C()
{
  return sub_2381C09F4();
}

uint64_t sub_2381B2F44()
{
  sub_2381C09DC();
  sub_2381C09F4();
  return sub_2381C0A00();
}

_QWORD *sub_2381B2F84@<X0>(_QWORD *result@<X0>, char *a2@<X8>)
{
  char v2;
  char v3;

  if (*result == 1)
    v2 = 1;
  else
    v2 = 2;
  if (*result)
    v3 = v2;
  else
    v3 = 0;
  *a2 = v3;
  return result;
}

void sub_2381B2FA4(_QWORD *a1@<X8>)
{
  unsigned __int8 *v1;

  *a1 = *v1;
}

unint64_t sub_2381B2FB0()
{
  return 0xD000000000000018;
}

uint64_t sub_2381B2FCC()
{
  sub_2381B821C();
  sub_2381B8260();
  return sub_2381C0580();
}

unint64_t sub_2381B3010()
{
  char *v0;

  return sub_2381B2CF4(*v0);
}

uint64_t sub_2381B3018()
{
  sub_2381B81D8();
  return sub_2381C0988();
}

uint64_t sub_2381B3040()
{
  sub_2381B81D8();
  sub_2381B821C();
  sub_2381B8260();
  return sub_2381C097C();
}

uint64_t static Reporter.start()()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 24) = v0;
  return swift_task_switch();
}

uint64_t sub_2381B30A0()
{
  uint64_t v0;
  _QWORD *v1;

  if (qword_2542CA7B8 != -1)
    swift_once();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 32) = v1;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2542CA650);
  *v1 = v0;
  v1[1] = sub_2381B314C;
  return sub_2381C07FC();
}

uint64_t sub_2381B314C()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;
  _QWORD *v4;

  v2 = (_QWORD *)*v1;
  v2[5] = v0;
  swift_task_dealloc();
  if (!v0)
  {
    v3 = v2[2];
    v2[6] = v3;
    v4 = (_QWORD *)swift_task_alloc();
    v2[7] = v4;
    *v4 = v2;
    v4[1] = sub_2381B31E0;
    v4[5] = v3;
  }
  return swift_task_switch();
}

uint64_t sub_2381B31E0()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 64) = v0;
  swift_task_dealloc();
  if (v0)
    return swift_task_switch();

  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_2381B3254()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 40) = v0;
  return swift_task_switch();
}

uint64_t sub_2381B326C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  void *v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t result;
  uint64_t v15;
  uint64_t v16;

  v1 = *(_QWORD *)(v0 + 40);
  if (*(_BYTE *)(*(_QWORD *)(v1 + OBJC_IVAR___CloudTelemetryReporter_connectionManager) + 24) != 1)
    return (*(uint64_t (**)(void))(v0 + 8))();
  v2 = *(_QWORD *)(v1 + OBJC_IVAR___CloudTelemetryReporter_xpcServiceXpcActivityStarted);
  os_unfair_lock_lock((os_unfair_lock_t)(v2 + 20));
  if (*(_BYTE *)(v2 + 16) == 1)
  {
    os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 20));
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  *(_BYTE *)(v2 + 16) = 1;
  os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 20));
  if (qword_2542CA720 != -1)
    swift_once();
  v3 = sub_2381C06C4();
  __swift_project_value_buffer(v3, (uint64_t)qword_2542CA708);
  v4 = sub_2381C06AC();
  v5 = sub_2381C0838();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_2381AB000, v4, v5, "XPCService registration for CloudTelemetry", v6, 2u);
    MEMORY[0x23B82E590](v6, -1, -1);
  }
  v7 = *(void **)(v0 + 40);

  v8 = XPCActivity.makeHandler.unsafeMutableAddressor();
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v7;
  swift_beginAccess();
  v10 = *v8;
  *v8 = (uint64_t)&unk_2568E6180;
  v8[1] = v9;
  v11 = v7;
  sub_2381B6A7C(v10);
  if (qword_2542CABA8 != -1)
    swift_once();
  v12 = qword_2542CAC78;
  *(_QWORD *)(v0 + 48) = qword_2542CAC78;
  if (!(v12 >> 62))
  {
    v13 = *(_QWORD *)((v12 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain();
    *(_QWORD *)(v0 + 56) = v13;
    if (v13)
      goto LABEL_12;
LABEL_18:
    swift_bridgeObjectRelease();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  swift_bridgeObjectRetain();
  result = sub_2381C0910();
  v13 = result;
  *(_QWORD *)(v0 + 56) = result;
  if (!result)
    goto LABEL_18;
LABEL_12:
  if (v13 < 1)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(v0 + 64) = 0;
    v15 = *(_QWORD *)(v0 + 48);
    if ((v15 & 0xC000000000000001) != 0)
    {
      v16 = MEMORY[0x23B82E074](0);
    }
    else
    {
      v16 = *(_QWORD *)(v15 + 32);
      swift_retain();
    }
    *(_QWORD *)(v0 + 72) = v16;
    *(_QWORD *)(v0 + 80) = *(_QWORD *)(*(_QWORD *)v16 + 160);
    return swift_task_switch();
  }
  return result;
}

uint64_t sub_2381B3504()
{
  uint64_t v0;

  (*(void (**)(_QWORD))(v0 + 80))(0);
  return swift_task_switch();
}

uint64_t sub_2381B3544()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = *(_QWORD *)(v0 + 64);
  v2 = *(_QWORD *)(v0 + 56);
  swift_release();
  if (v1 + 1 == v2)
  {
    swift_bridgeObjectRelease();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    v4 = *(_QWORD *)(v0 + 64) + 1;
    *(_QWORD *)(v0 + 64) = v4;
    v5 = *(_QWORD *)(v0 + 48);
    if ((v5 & 0xC000000000000001) != 0)
    {
      v6 = MEMORY[0x23B82E074]();
    }
    else
    {
      v6 = *(_QWORD *)(v5 + 8 * v4 + 32);
      swift_retain();
    }
    *(_QWORD *)(v0 + 72) = v6;
    *(_QWORD *)(v0 + 80) = *(_QWORD *)(*(_QWORD *)v6 + 160);
    return swift_task_switch();
  }
}

uint64_t sub_2381B35F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  *(_QWORD *)(v4 + 16) = a1;
  *(_QWORD *)(v4 + 24) = a4;
  return swift_task_switch();
}

uint64_t sub_2381B360C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  unint64_t *v5;
  uint64_t (*v6)();
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v1 = *(_QWORD *)(v0 + 16);
  if (type metadata accessor for SubmitEventsActivity() == v1)
  {
    v3 = swift_retain();
    v4 = sub_2381AD234(v3);
    v5 = &qword_2542CA610;
    v6 = type metadata accessor for SubmitEventsActivity;
    v7 = &unk_2381C1468;
  }
  else if (type metadata accessor for CacheCleanupActivity() == v1)
  {
    v8 = swift_retain();
    v4 = sub_2381AD234(v8);
    v5 = &qword_2542CA600;
    v6 = type metadata accessor for CacheCleanupActivity;
    v7 = &unk_2381C1528;
  }
  else
  {
    if (type metadata accessor for PostInstallActivity() != v1)
      return sub_2381C0904();
    v9 = swift_retain();
    v4 = sub_2381AD234(v9);
    v5 = &qword_2542CA5E8;
    v6 = type metadata accessor for PostInstallActivity;
    v7 = &unk_2381C11D8;
  }
  v10 = sub_2381B8300(v5, (uint64_t (*)(uint64_t))v6, (uint64_t)v7);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8))(v4, v10);
}

void static Reporter.report(teamID:eventType:event:allowCellularAccess:allowExpensiveAccess:bundleID:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, int a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  os_unfair_lock_s *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  os_log_type_t v31;
  uint8_t *v32;
  uint8_t *v33;
  uint64_t v34;
  NSObject *v35;
  os_log_type_t v36;
  uint8_t *v37;
  char v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  int v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;

  v52 = a4;
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542CA030);
  MEMORY[0x24BDAC7A8](v17);
  v19 = (char *)&v44 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = sub_2381B02C0(a5);
  if (v9)
    return;
  v21 = v53;
  v50 = v20;
  v51 = v19;
  v45 = a7;
  v44 = a1;
  v46 = a3;
  v47 = a2;
  v48 = a8;
  v22 = qword_2568E66A0;
  swift_bridgeObjectRetain();
  if (v22 != -1)
    swift_once();
  v49 = &v44;
  v23 = qword_2568E72B0;
  v24 = (os_unfair_lock_s *)(qword_2568E72B0 + 24);
  os_unfair_lock_lock((os_unfair_lock_t)(qword_2568E72B0 + 24));
  v25 = *(_QWORD *)(v23 + 16);
  v26 = v25 + 1;
  v27 = (uint64_t)v51;
  if (__OFADD__(v25, 1))
  {
    __break(1u);
    goto LABEL_19;
  }
  v28 = v21;
  if (v26 <= 4)
  {
    *(_QWORD *)(v23 + 16) = v26;
    if (qword_2542CA720 == -1)
    {
LABEL_7:
      v29 = sub_2381C06C4();
      __swift_project_value_buffer(v29, (uint64_t)qword_2542CA708);
      v30 = sub_2381C06AC();
      v31 = sub_2381C082C();
      if (os_log_type_enabled(v30, v31))
      {
        v32 = (uint8_t *)swift_slowAlloc();
        *(_DWORD *)v32 = 134217984;
        v54 = v26;
        sub_2381C0898();
        _os_log_impl(&dword_2381AB000, v30, v31, "Legacy task count incremented, now %ld.", v32, 0xCu);
        v33 = v32;
        v27 = (uint64_t)v51;
        MEMORY[0x23B82E590](v33, -1, -1);
      }

      v28 = v53;
      goto LABEL_10;
    }
LABEL_19:
    swift_once();
    goto LABEL_7;
  }
LABEL_10:
  os_unfair_lock_unlock(v24);
  if (v26 <= 4)
  {
    v38 = v45 & 1;
    v39 = sub_2381C07F0();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v39 - 8) + 56))(v27, 1, 1, v39);
    v40 = swift_allocObject();
    *(_QWORD *)(v40 + 16) = 0;
    *(_QWORD *)(v40 + 24) = 0;
    v41 = v44;
    *(_QWORD *)(v40 + 32) = v28;
    *(_QWORD *)(v40 + 40) = v41;
    v42 = v46;
    *(_QWORD *)(v40 + 48) = v47;
    *(_QWORD *)(v40 + 56) = v42;
    v43 = v50;
    *(_QWORD *)(v40 + 64) = v52;
    *(_QWORD *)(v40 + 72) = v43;
    *(_BYTE *)(v40 + 80) = a6 & 1;
    *(_BYTE *)(v40 + 81) = v38;
    *(_QWORD *)(v40 + 88) = v48;
    *(_QWORD *)(v40 + 96) = a9;
    *(_QWORD *)(v40 + 104) = v28;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_2381B4820(v27, (uint64_t)&unk_2568E6190, v40);
    swift_release();
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (qword_2542CA720 != -1)
      swift_once();
    v34 = sub_2381C06C4();
    __swift_project_value_buffer(v34, (uint64_t)qword_2542CA708);
    v35 = sub_2381C06AC();
    v36 = sub_2381C085C();
    if (os_log_type_enabled(v35, v36))
    {
      v37 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v37 = 0;
      _os_log_impl(&dword_2381AB000, v35, v36, "Over legacy task count limit.", v37, 2u);
      MEMORY[0x23B82E590](v37, -1, -1);
    }

  }
}

uint64_t sub_2381B3B04(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  *(_QWORD *)(v8 + 144) = v13;
  *(_QWORD *)(v8 + 152) = v14;
  *(_WORD *)(v8 + 200) = v11;
  *(_QWORD *)(v8 + 128) = v10;
  *(_QWORD *)(v8 + 136) = v12;
  *(_QWORD *)(v8 + 112) = a7;
  *(_QWORD *)(v8 + 120) = a8;
  *(_QWORD *)(v8 + 96) = a5;
  *(_QWORD *)(v8 + 104) = a6;
  swift_bridgeObjectRetain();
  return swift_task_switch();
}

uint64_t sub_2381B3B60()
{
  uint64_t v0;
  _QWORD *v1;

  if (qword_2542CA7B8 != -1)
    swift_once();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 160) = v1;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2542CA650);
  *v1 = v0;
  v1[1] = sub_2381B3C0C;
  return sub_2381C07FC();
}

uint64_t sub_2381B3C0C()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 168) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_2381B3C70()
{
  uint64_t v0;
  void *v1;
  uint64_t *v2;
  uint64_t v3;
  id v4;
  id v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  os_unfair_lock_s *v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  os_log_type_t v19;
  uint8_t *v20;
  uint64_t v22;
  uint64_t v23;

  swift_bridgeObjectRelease();
  v1 = *(void **)(v0 + 168);
  v2 = &qword_2542CA000;
  if (qword_2542CA720 != -1)
    swift_once();
  v3 = sub_2381C06C4();
  __swift_project_value_buffer(v3, (uint64_t)qword_2542CA708);
  v4 = v1;
  v5 = v1;
  v6 = sub_2381C06AC();
  v7 = sub_2381C0844();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc();
    v22 = v3;
    v23 = swift_slowAlloc();
    v9 = v23;
    *(_DWORD *)v8 = 136315138;
    swift_getErrorValue();
    v10 = sub_2381C0994();
    *(_QWORD *)(v0 + 88) = sub_2381B5B84(v10, v11, &v23);
    v2 = &qword_2542CA000;
    sub_2381C0898();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_2381AB000, v6, v7, "Report, failed with error: %s", v8, 0xCu);
    swift_arrayDestroy();
    v12 = v9;
    v3 = v22;
    MEMORY[0x23B82E590](v12, -1, -1);
    MEMORY[0x23B82E590](v8, -1, -1);

  }
  else
  {

  }
  if (qword_2568E66A0 != -1)
    swift_once();
  v13 = *(_QWORD *)(v0 + 152);
  v14 = qword_2568E72B0;
  *(_QWORD *)(swift_task_alloc() + 16) = v13;
  v15 = (os_unfair_lock_s *)(v14 + 24);
  os_unfair_lock_lock((os_unfair_lock_t)(v14 + 24));
  v16 = *(_QWORD *)(v14 + 16);
  v17 = v16 - 1;
  if (__OFSUB__(v16, 1))
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(v14 + 16) = v17;
    if (v2[228] == -1)
      goto LABEL_10;
  }
  swift_once();
LABEL_10:
  __swift_project_value_buffer(v3, (uint64_t)qword_2542CA708);
  v18 = sub_2381C06AC();
  v19 = sub_2381C082C();
  if (os_log_type_enabled(v18, v19))
  {
    v20 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v20 = 134217984;
    *(_QWORD *)(v0 + 64) = v17;
    sub_2381C0898();
    _os_log_impl(&dword_2381AB000, v18, v19, "Legacy task count decremented, now %ld.", v20, 0xCu);
    MEMORY[0x23B82E590](v20, -1, -1);
  }

  os_unfair_lock_unlock(v15);
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2381B3FB0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  __int16 v3;
  uint64_t v4;
  _QWORD *v5;

  v2 = *(_QWORD *)(v0 + 136);
  v1 = *(_QWORD *)(v0 + 144);
  v3 = *(_WORD *)(v0 + 200);
  v4 = *(_QWORD *)(v0 + 72);
  *(_BYTE *)(v0 + 40) = v3;
  *(_QWORD *)(v0 + 176) = v4;
  *(_BYTE *)(v0 + 41) = HIBYTE(v3);
  *(_QWORD *)(v0 + 48) = v2;
  *(_QWORD *)(v0 + 56) = v1;
  swift_bridgeObjectRetain();
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 184) = v5;
  *v5 = v0;
  v5[1] = sub_2381B4040;
  return sub_2381B1830(*(_QWORD *)(v0 + 96), *(_QWORD *)(v0 + 104), *(_QWORD *)(v0 + 112), *(_QWORD *)(v0 + 120), *(_QWORD *)(v0 + 128), v0 + 40, 0);
}

uint64_t sub_2381B4040()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;

  v2 = *(void **)(*(_QWORD *)v1 + 176);
  *(_QWORD *)(*(_QWORD *)v1 + 192) = v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();

  if (!v0)
    swift_bridgeObjectRelease();
  return swift_task_switch();
}

uint64_t sub_2381B40C4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  os_unfair_lock_s *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;

  if (qword_2568E66A0 != -1)
    swift_once();
  v1 = *(_QWORD *)(v0 + 152);
  v2 = qword_2568E72B0;
  *(_QWORD *)(swift_task_alloc() + 16) = v1;
  v3 = (os_unfair_lock_s *)(v2 + 24);
  os_unfair_lock_lock((os_unfair_lock_t)(v2 + 24));
  v4 = *(_QWORD *)(v2 + 16);
  v5 = v4 - 1;
  if (__OFSUB__(v4, 1))
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(v2 + 16) = v5;
    if (qword_2542CA720 == -1)
      goto LABEL_5;
  }
  swift_once();
LABEL_5:
  v6 = sub_2381C06C4();
  __swift_project_value_buffer(v6, (uint64_t)qword_2542CA708);
  v7 = sub_2381C06AC();
  v8 = sub_2381C082C();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v9 = 134217984;
    *(_QWORD *)(v0 + 64) = v5;
    sub_2381C0898();
    _os_log_impl(&dword_2381AB000, v7, v8, "Legacy task count decremented, now %ld.", v9, 0xCu);
    MEMORY[0x23B82E590](v9, -1, -1);
  }

  os_unfair_lock_unlock(v3);
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2381B424C()
{
  uint64_t v0;
  void *v1;
  uint64_t *v2;
  uint64_t v3;
  id v4;
  id v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  os_unfair_lock_s *v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  os_log_type_t v19;
  uint8_t *v20;
  uint64_t v22;
  uint64_t v23;

  swift_bridgeObjectRelease();
  v1 = *(void **)(v0 + 192);
  v2 = &qword_2542CA000;
  if (qword_2542CA720 != -1)
    swift_once();
  v3 = sub_2381C06C4();
  __swift_project_value_buffer(v3, (uint64_t)qword_2542CA708);
  v4 = v1;
  v5 = v1;
  v6 = sub_2381C06AC();
  v7 = sub_2381C0844();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc();
    v22 = v3;
    v23 = swift_slowAlloc();
    v9 = v23;
    *(_DWORD *)v8 = 136315138;
    swift_getErrorValue();
    v10 = sub_2381C0994();
    *(_QWORD *)(v0 + 88) = sub_2381B5B84(v10, v11, &v23);
    v2 = &qword_2542CA000;
    sub_2381C0898();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_2381AB000, v6, v7, "Report, failed with error: %s", v8, 0xCu);
    swift_arrayDestroy();
    v12 = v9;
    v3 = v22;
    MEMORY[0x23B82E590](v12, -1, -1);
    MEMORY[0x23B82E590](v8, -1, -1);

  }
  else
  {

  }
  if (qword_2568E66A0 != -1)
    swift_once();
  v13 = *(_QWORD *)(v0 + 152);
  v14 = qword_2568E72B0;
  *(_QWORD *)(swift_task_alloc() + 16) = v13;
  v15 = (os_unfair_lock_s *)(v14 + 24);
  os_unfair_lock_lock((os_unfair_lock_t)(v14 + 24));
  v16 = *(_QWORD *)(v14 + 16);
  v17 = v16 - 1;
  if (__OFSUB__(v16, 1))
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(v14 + 16) = v17;
    if (v2[228] == -1)
      goto LABEL_10;
  }
  swift_once();
LABEL_10:
  __swift_project_value_buffer(v3, (uint64_t)qword_2542CA708);
  v18 = sub_2381C06AC();
  v19 = sub_2381C082C();
  if (os_log_type_enabled(v18, v19))
  {
    v20 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v20 = 134217984;
    *(_QWORD *)(v0 + 64) = v17;
    sub_2381C0898();
    _os_log_impl(&dword_2381AB000, v18, v19, "Legacy task count decremented, now %ld.", v20, 0xCu);
    MEMORY[0x23B82E590](v20, -1, -1);
  }

  os_unfair_lock_unlock(v15);
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t static Reporter.report(teamID:eventType:event:transportConfiguration:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  uint64_t v7;

  *(_QWORD *)(v7 + 80) = a5;
  *(_QWORD *)(v7 + 88) = v6;
  *(_QWORD *)(v7 + 64) = a3;
  *(_QWORD *)(v7 + 72) = a4;
  *(_QWORD *)(v7 + 48) = a1;
  *(_QWORD *)(v7 + 56) = a2;
  *(_OWORD *)(v7 + 96) = *(_OWORD *)a6;
  *(_QWORD *)(v7 + 112) = *(_QWORD *)(a6 + 16);
  return swift_task_switch();
}

uint64_t sub_2381B45BC()
{
  uint64_t v0;
  _QWORD *v1;

  if (qword_2542CA7B8 != -1)
    swift_once();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 120) = v1;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2542CA650);
  *v1 = v0;
  v1[1] = sub_2381B4668;
  return sub_2381C07FC();
}

uint64_t sub_2381B4668()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 128) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_2381B46CC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  char v6;
  unint64_t v7;
  _QWORD *v8;

  v1 = *(_QWORD *)(v0 + 112);
  *(_QWORD *)(v0 + 136) = *(_QWORD *)(v0 + 40);
  if (v1 == 1)
  {
    v2 = 0;
    v3 = 0;
    v4 = *(_QWORD *)(v0 + 96);
    v5 = *(_QWORD *)(v0 + 104);
    v6 = 2;
    LOBYTE(v7) = 2;
  }
  else
  {
    v4 = *(_QWORD *)(v0 + 96);
    v5 = *(_QWORD *)(v0 + 104);
    v7 = v4 >> 8;
    v6 = v4;
    v2 = v5;
    v3 = v1;
  }
  *(_QWORD *)(v0 + 144) = v3;
  *(_BYTE *)(v0 + 16) = v6;
  *(_BYTE *)(v0 + 17) = v7;
  *(_QWORD *)(v0 + 24) = v2;
  *(_QWORD *)(v0 + 32) = v3;
  sub_2381B6B80(v4, v5, v1);
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 152) = v8;
  *v8 = v0;
  v8[1] = sub_2381B4780;
  return sub_2381B1830(*(_QWORD *)(v0 + 48), *(_QWORD *)(v0 + 56), *(_QWORD *)(v0 + 64), *(_QWORD *)(v0 + 72), *(_QWORD *)(v0 + 80), v0 + 16, 0);
}

uint64_t sub_2381B4780()
{
  uint64_t v0;
  uint64_t *v1;
  void *v2;
  uint64_t v3;

  v2 = *(void **)(*v1 + 136);
  v3 = *v1;
  *(_QWORD *)(v3 + 160) = v0;
  swift_task_dealloc();

  swift_bridgeObjectRelease();
  if (v0)
    return swift_task_switch();
  else
    return (*(uint64_t (**)(void))(v3 + 8))();
}

uint64_t sub_2381B4808()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2381B4814()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2381B4820(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_2381C07F0();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_2381C07E4();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_2381B6880(a1, &qword_2542CA030);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_2381C07C0();
    swift_unknownObjectRelease();
  }
LABEL_5:
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_2381B4AB4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;

  v6[11] = a5;
  v6[12] = a6;
  v6[10] = a4;
  return swift_task_switch();
}

uint64_t sub_2381B4AD0()
{
  _QWORD *v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  char v12;
  _QWORD *v13;

  if (qword_2542CA720 != -1)
    swift_once();
  v1 = sub_2381C06C4();
  v0[13] = __swift_project_value_buffer(v1, (uint64_t)qword_2542CA708);
  v2 = sub_2381C06AC();
  v3 = sub_2381C0838();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_2381AB000, v2, v3, "SendOneMessage, sending to service", v4, 2u);
    MEMORY[0x23B82E590](v4, -1, -1);
  }
  v5 = v0[10];

  v6 = *(_QWORD *)(v5 + OBJC_IVAR___CloudTelemetryReporter_connectionManager);
  result = swift_beginAccess();
  v8 = *(_QWORD *)(v6 + 40);
  v0[14] = v8;
  if (v8)
  {
    v9 = v0[11];
    swift_retain();
    swift_unknownObjectRetain();
    v10 = XPCMessage.init(ty:payload:)(0, v9);
    v12 = v11;
    v0[15] = v10;
    v13 = (_QWORD *)swift_task_alloc();
    v0[16] = v13;
    *v13 = v0;
    v13[1] = sub_2381B4C3C;
    return XPCConnection.sendWithReply(_:)(v10, v12);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_2381B4C3C()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 136) = v0;
  swift_task_dealloc();
  if (!v0)
  {
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    swift_release();
  }
  return swift_task_switch();
}

void sub_2381B4CC8()
{
  uint64_t v0;
  NSObject *v1;
  os_log_type_t v2;
  uint8_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v1 = sub_2381C06AC();
  v2 = sub_2381C0838();
  if (os_log_type_enabled(v1, v2))
  {
    v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_2381AB000, v1, v2, "SendOneMessage, sent to service", v3, 2u);
    MEMORY[0x23B82E590](v3, -1, -1);
  }

  v4 = *(_QWORD *)(v0 + 136);
  v5 = *(_QWORD *)(v0 + 96);
  v6 = *(_QWORD *)(v0 + 80);
  v7 = *(_QWORD *)(v6 + OBJC_IVAR___CloudTelemetryReporter_activeSendOneMessageCount);
  v8 = swift_task_alloc();
  *(_QWORD *)(v8 + 16) = v6;
  *(_QWORD *)(v8 + 24) = v5;
  os_unfair_lock_lock((os_unfair_lock_t)(v7 + 24));
  sub_2381B83D4((_QWORD *)(v7 + 16));
  os_unfair_lock_unlock((os_unfair_lock_t)(v7 + 24));
  if (!v4)
  {
    swift_task_dealloc();
    (*(void (**)(void))(v0 + 8))();
  }
}

uint64_t sub_2381B4DDC()
{
  uint64_t v0;
  void *v1;
  id v2;
  id v3;
  NSObject *v4;
  os_log_type_t v5;
  void *v6;
  uint8_t *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;

  v1 = *(void **)(v0 + 136);
  swift_unknownObjectRelease();
  swift_release();
  v2 = v1;
  v3 = v1;
  v4 = sub_2381C06AC();
  v5 = sub_2381C0844();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = *(void **)(v0 + 136);
    v7 = (uint8_t *)swift_slowAlloc();
    v8 = swift_slowAlloc();
    v17 = v8;
    *(_DWORD *)v7 = 136315138;
    swift_getErrorValue();
    v9 = sub_2381C0994();
    *(_QWORD *)(v0 + 72) = sub_2381B5B84(v9, v10, &v17);
    sub_2381C0898();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_2381AB000, v4, v5, "SendOneMessage, failed with error: %s", v7, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B82E590](v8, -1, -1);
    MEMORY[0x23B82E590](v7, -1, -1);

  }
  else
  {
    v11 = *(void **)(v0 + 136);

  }
  v12 = *(_QWORD *)(v0 + 96);
  v13 = *(_QWORD *)(v0 + 80);
  v14 = *(_QWORD *)(v13 + OBJC_IVAR___CloudTelemetryReporter_activeSendOneMessageCount);
  v15 = swift_task_alloc();
  *(_QWORD *)(v15 + 16) = v13;
  *(_QWORD *)(v15 + 24) = v12;
  os_unfair_lock_lock((os_unfair_lock_t)(v14 + 24));
  sub_2381B83D4((_QWORD *)(v14 + 16));
  os_unfair_lock_unlock((os_unfair_lock_t)(v14 + 24));
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t static Reporter._privacyLogs()()
{
  return sub_2381B6D9C();
}

uint64_t sub_2381B4FFC(uint64_t a1)
{
  unint64_t *v1;
  uint64_t v2;
  unint64_t v3;
  int64_t v4;
  int64_t v5;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v20;
  BOOL v21;
  uint64_t v22;
  int64_t v23;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 16);
  v3 = *v1;
  v4 = *(_QWORD *)(*v1 + 16);
  v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  if (isUniquelyReferenced_nonNull_native && v5 <= *(_QWORD *)(v3 + 24) >> 1)
  {
    if (*(_QWORD *)(a1 + 16))
      goto LABEL_5;
    goto LABEL_18;
  }
  if (v4 <= v5)
    v23 = v4 + v2;
  else
    v23 = v4;
  v3 = sub_2381B5870(isUniquelyReferenced_nonNull_native, v23, 1, v3);
  if (!*(_QWORD *)(a1 + 16))
  {
LABEL_18:
    if (!v2)
      goto LABEL_19;
    goto LABEL_21;
  }
LABEL_5:
  v8 = *(_QWORD *)(v3 + 16);
  v9 = (*(_QWORD *)(v3 + 24) >> 1) - v8;
  v10 = sub_2381C0640();
  if (v9 < v2)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  v11 = *(_QWORD *)(v10 - 8);
  v12 = (*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  v13 = *(_QWORD *)(v11 + 72);
  v14 = v3 + v12 + v13 * v8;
  v15 = a1 + v12;
  v16 = v13 * v2;
  v17 = v14 + v16;
  v18 = v15 + v16;
  if (v15 < v17 && v14 < v18)
    goto LABEL_24;
  swift_arrayInitWithCopy();
  if (!v2)
  {
LABEL_19:
    result = swift_bridgeObjectRelease();
    *v1 = v3;
    return result;
  }
  v20 = *(_QWORD *)(v3 + 16);
  v21 = __OFADD__(v20, v2);
  v22 = v20 + v2;
  if (!v21)
  {
    *(_QWORD *)(v3 + 16) = v22;
    goto LABEL_19;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  result = sub_2381C0940();
  __break(1u);
  return result;
}

id Reporter.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void Reporter.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id _s14CloudTelemetryAACfD_0()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_2381B52F8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2542CA648);
  v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_2381C15A0;
  type metadata accessor for XPCActivity();
  v1 = type metadata accessor for SubmitEventsActivity();
  v2 = sub_2381B8300(&qword_2542CA610, (uint64_t (*)(uint64_t))type metadata accessor for SubmitEventsActivity, (uint64_t)&unk_2381C1468);
  *(_QWORD *)(v0 + 32) = XPCActivity.__allocating_init(handlerType:)(v1, v2);
  v3 = type metadata accessor for PostInstallActivity();
  v4 = sub_2381B8300(&qword_2542CA5E8, (uint64_t (*)(uint64_t))type metadata accessor for PostInstallActivity, (uint64_t)&unk_2381C11D8);
  *(_QWORD *)(v0 + 40) = XPCActivity.__allocating_init(handlerType:)(v3, v4);
  v5 = type metadata accessor for CacheCleanupActivity();
  v6 = sub_2381B8300(&qword_2542CA600, (uint64_t (*)(uint64_t))type metadata accessor for CacheCleanupActivity, (uint64_t)&unk_2381C1528);
  *(_QWORD *)(v0 + 48) = XPCActivity.__allocating_init(handlerType:)(v5, v6);
  result = sub_2381C07B4();
  qword_2542CAC78 = v0;
  return result;
}

uint64_t sub_2381B5414(uint64_t a1, uint64_t a2)
{
  return sub_2381B54DC(a1, a2, MEMORY[0x24BEE0CD8]);
}

uint64_t sub_2381B5420()
{
  sub_2381C073C();
  sub_2381C0760();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2381B5460()
{
  uint64_t v0;

  sub_2381C073C();
  sub_2381C09DC();
  sub_2381C0760();
  v0 = sub_2381C0A00();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_2381B54D0(uint64_t a1, uint64_t a2)
{
  return sub_2381B54DC(a1, a2, (uint64_t (*)(uint64_t))MEMORY[0x24BDCF9E0]);
}

uint64_t sub_2381B54DC(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4;
  uint64_t v5;

  v4 = sub_2381C073C();
  v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_2381B5518(uint64_t a1, id *a2)
{
  uint64_t result;

  result = sub_2381C0724();
  *a2 = 0;
  return result;
}

uint64_t sub_2381B558C(uint64_t a1, id *a2)
{
  char v3;

  v3 = sub_2381C0730();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_2381B5608@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  sub_2381C073C();
  v2 = sub_2381C0718();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_2381B5648()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;

  v0 = sub_2381C073C();
  v2 = v1;
  if (v0 == sub_2381C073C() && v2 == v3)
    v5 = 1;
  else
    v5 = sub_2381C0958();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_2381B56D0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = sub_2381C0718();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_2381B5714@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_2381C073C();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_2381B573C()
{
  sub_2381B8300(&qword_2568E61E8, (uint64_t (*)(uint64_t))type metadata accessor for FileAttributeKey, (uint64_t)&unk_2381C1AB8);
  sub_2381B8300(&qword_2568E6248, (uint64_t (*)(uint64_t))type metadata accessor for FileAttributeKey, (uint64_t)&unk_2381C1A0C);
  return sub_2381C094C();
}

uint64_t sub_2381B57C0(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_2381B5824;
  return v6(a1);
}

uint64_t sub_2381B5824()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_2381B5870(char a1, int64_t a2, char a3, unint64_t a4)
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
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2568E61F0);
  v10 = *(_QWORD *)(sub_2381C0640() - 8);
  v11 = *(_QWORD *)(v10 + 72);
  v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v13 = (_QWORD *)swift_allocObject();
  v14 = _swift_stdlib_malloc_size(v13);
  if (!v11 || (v14 - v12 == 0x8000000000000000 ? (v15 = v11 == -1) : (v15 = 0), v15))
  {
LABEL_29:
    result = sub_2381C08F8();
    __break(1u);
    return result;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  v16 = *(_QWORD *)(sub_2381C0640() - 8);
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
    sub_2381B6C84(0, v8, v18, a4);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v13;
}

_QWORD *sub_2381B5A78(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_2568E62B0);
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
    sub_2381B6B94(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_2381B5B84(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_2381B5C54(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_2381B01E4((uint64_t)v12, *a3);
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
      sub_2381B01E4((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v12);
  return v7;
}

uint64_t sub_2381B5C54(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_2381C08A4();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_2381B5E0C(a5, a6);
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
  v8 = sub_2381C08E0();
  if (!v8)
  {
    sub_2381C08F8();
    __break(1u);
LABEL_17:
    result = sub_2381C0940();
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

uint64_t sub_2381B5E0C(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_2381B5EA0(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_2381B6078(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_2381B6078(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_2381B5EA0(uint64_t a1, unint64_t a2)
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
      v3 = sub_2381B6014(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_2381C08C8();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_2381C08F8();
      __break(1u);
LABEL_10:
      v2 = sub_2381C0784();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_2381C0940();
    __break(1u);
LABEL_14:
    result = sub_2381C08F8();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_2381B6014(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2542CA660);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_2381B6078(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2542CA660);
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
  result = sub_2381C0940();
  __break(1u);
  return result;
}

unint64_t sub_2381B61C4(uint64_t a1)
{
  uint64_t v2;

  sub_2381C073C();
  sub_2381C09DC();
  sub_2381C0760();
  v2 = sub_2381C0A00();
  swift_bridgeObjectRelease();
  return sub_2381B6244(a1, v2);
}

unint64_t sub_2381B6244(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v18;

  v3 = v2 + 64;
  v4 = -1 << *(_BYTE *)(v2 + 32);
  v5 = a2 & ~v4;
  if (((*(_QWORD *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
  {
    v6 = sub_2381C073C();
    v8 = v7;
    if (v6 == sub_2381C073C() && v8 == v9)
    {
LABEL_16:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    v11 = sub_2381C0958();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v11 & 1) == 0)
    {
      v12 = ~v4;
      v5 = (v5 + 1) & v12;
      if (((*(_QWORD *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
      {
        while (1)
        {
          v13 = sub_2381C073C();
          v15 = v14;
          if (v13 == sub_2381C073C() && v15 == v16)
            break;
          v18 = sub_2381C0958();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v18 & 1) == 0)
          {
            v5 = (v5 + 1) & v12;
            if (((*(_QWORD *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
              continue;
          }
          return v5;
        }
        goto LABEL_16;
      }
    }
  }
  return v5;
}

uint64_t sub_2381B63B8(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_2381B63FC(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for XPCObject();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2381B6438()
{
  swift_unknownObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_2381B645C()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_2381B86B0;
  return swift_task_switch();
}

uint64_t type metadata accessor for Reporter()
{
  return objc_opt_self();
}

uint64_t sub_2381B64D8()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t (*v10)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);

  v2 = v0[4];
  v3 = v0[5];
  v4 = v0[6];
  v5 = v0[7];
  v6 = v0[8];
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v7;
  *v7 = v1;
  v7[1] = sub_2381B86B0;
  v10 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((char *)&dword_2568E6108 + dword_2568E6108);
  v8 = (_QWORD *)swift_task_alloc();
  v7[2] = v8;
  *v8 = v7;
  v8[1] = sub_2381AD438;
  return v10(v2, v3, v4, v5, v6);
}

uint64_t sub_2381B6584(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;

  v5[9] = a4;
  v5[10] = a5;
  v5[7] = a2;
  v5[8] = a3;
  v5[6] = a1;
  return swift_task_switch();
}

uint64_t sub_2381B65A4()
{
  uint64_t v0;
  _QWORD *v1;

  if (qword_2542CA7B8 != -1)
    swift_once();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 88) = v1;
  type metadata accessor for Reporter();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2542CA650);
  *v1 = v0;
  v1[1] = sub_2381B6658;
  return sub_2381C07FC();
}

uint64_t sub_2381B6658()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  _QWORD *v4;

  v2 = *v1;
  *(_QWORD *)(v2 + 96) = v0;
  swift_task_dealloc();
  if (v0)
    return swift_task_switch();
  *(_WORD *)(v2 + 16) = 514;
  *(_QWORD *)(v2 + 104) = *(_QWORD *)(v2 + 40);
  *(_QWORD *)(v2 + 24) = 0;
  *(_QWORD *)(v2 + 32) = 0;
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 112) = v4;
  *v4 = v2;
  v4[1] = sub_2381B670C;
  return sub_2381B1830(*(_QWORD *)(v2 + 48), *(_QWORD *)(v2 + 56), *(_QWORD *)(v2 + 64), *(_QWORD *)(v2 + 72), *(_QWORD *)(v2 + 80), v2 + 16, 0);
}

uint64_t sub_2381B670C()
{
  uint64_t v0;
  uint64_t *v1;
  void *v2;
  uint64_t v3;

  v2 = *(void **)(*v1 + 104);
  v3 = *v1;
  *(_QWORD *)(v3 + 120) = v0;
  swift_task_dealloc();

  if (v0)
    return swift_task_switch();
  else
    return (*(uint64_t (**)(void))(v3 + 8))();
}

uint64_t sub_2381B677C()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2381B6788()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t objectdestroy_9Tm()
{
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_2381B67D4()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t (*v10)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);

  v2 = v0[4];
  v3 = v0[5];
  v4 = v0[6];
  v5 = v0[7];
  v6 = v0[8];
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v7;
  *v7 = v1;
  v7[1] = sub_2381B86B0;
  v10 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((char *)&dword_2568E6108 + dword_2568E6108);
  v8 = (_QWORD *)swift_task_alloc();
  v7[2] = v8;
  *v8 = v7;
  v8[1] = sub_2381B86B0;
  return v10(v2, v3, v4, v5, v6);
}

uint64_t sub_2381B6880(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_2381B68BC()
{
  unint64_t result;

  result = qword_2568E6128;
  if (!qword_2568E6128)
  {
    result = MEMORY[0x23B82E4F4](&unk_2381C1870, &type metadata for Reporter.Error);
    atomic_store(result, (unint64_t *)&qword_2568E6128);
  }
  return result;
}

uint64_t sub_2381B6900()
{
  uint64_t v0;

  swift_unknownObjectRelease();

  swift_unknownObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_2381B6934()
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
  *(_QWORD *)(v3 + 8) = sub_2381B86B0;
  *(_QWORD *)(v3 + 96) = v2;
  *(_OWORD *)(v3 + 80) = v4;
  return swift_task_switch();
}

uint64_t sub_2381B699C()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_2381B69C0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  _QWORD *v5;

  v4 = *(_QWORD *)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_2381B6A24;
  v5[2] = a1;
  v5[3] = v4;
  return swift_task_switch();
}

uint64_t sub_2381B6A24(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v6;

  v6 = *v2;
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(a1, a2);
}

uint64_t sub_2381B6A7C(uint64_t result)
{
  if (result)
    return swift_release();
  return result;
}

uint64_t sub_2381B6A8C()
{
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_2381B6AD0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v10;

  v10 = *(_OWORD *)(v0 + 40);
  v2 = *(_QWORD *)(v0 + 56);
  v4 = *(_QWORD *)(v0 + 88);
  v3 = *(_QWORD *)(v0 + 96);
  v5 = *(_WORD *)(v0 + 80);
  v6 = *(_QWORD *)(v0 + 104);
  v7 = swift_task_alloc();
  v8 = *(_OWORD *)(v0 + 64);
  *(_QWORD *)(v1 + 16) = v7;
  *(_QWORD *)v7 = v1;
  *(_QWORD *)(v7 + 8) = sub_2381AD438;
  *(_QWORD *)(v7 + 144) = v3;
  *(_QWORD *)(v7 + 152) = v6;
  *(_QWORD *)(v7 + 136) = v4;
  *(_WORD *)(v7 + 200) = v5;
  *(_OWORD *)(v7 + 120) = v8;
  *(_QWORD *)(v7 + 112) = v2;
  *(_OWORD *)(v7 + 96) = v10;
  swift_bridgeObjectRetain();
  return swift_task_switch();
}

uint64_t sub_2381B6B80(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  if (a3 != 1)
    return swift_bridgeObjectRetain();
  return result;
}

uint64_t sub_2381B6B94(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
  result = sub_2381C0940();
  __break(1u);
  return result;
}

uint64_t sub_2381B6C84(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
    v8 = *(_QWORD *)(sub_2381C0640() - 8);
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
  result = sub_2381C0940();
  __break(1u);
  return result;
}

uint64_t sub_2381B6D9C()
{
  char *v0;
  char *v1;
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
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  NSString *v20;
  _QWORD *v21;
  unint64_t v22;
  unint64_t v23;
  _QWORD *v24;
  unint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  _QWORD *v28;
  id v29;
  _QWORD *v30;
  uint64_t v31;
  unint64_t v32;
  char *v33;
  _QWORD *v34;
  char v35;
  void *v36;
  id v37;
  uint64_t v38;
  _QWORD *v39;
  unint64_t v40;
  char *v41;
  id v42;
  unint64_t v43;
  BOOL v44;
  char *v45;
  char v46;
  void *v47;
  id v48;
  uint64_t v49;
  _QWORD *v50;
  char *v51;
  void *v52;
  id v53;
  _QWORD *v54;
  char *v55;
  int64_t v56;
  int isUniquelyReferenced_nonNull_native;
  int64_t v58;
  uint64_t v59;
  char *v60;
  uint64_t v62;
  BOOL v63;
  void *v64;
  id v65;
  void *v66;
  id v67;
  void (*v68)(char *, uint64_t);
  uint64_t v69;
  uint64_t v70;
  char *v71;
  void (*v72)(char *, char *, uint64_t);
  uint64_t v73;
  char *v74;
  void (*v75)(char *, uint64_t, uint64_t, uint64_t);
  void (*v76)(char *, char *, uint64_t);
  void *v77;
  id v78;
  void *v79;
  uint64_t v80;
  id v81;
  id v82;
  unint64_t v83;
  char v84;
  id v85;
  void *v86;
  unint64_t v87;
  unint64_t v88;
  unint64_t v89;
  void (*v90)(char *, uint64_t, uint64_t, uint64_t);
  id v91;
  void (*v92)(char *, uint64_t);
  id v93;
  uint64_t result;
  uint64_t v95;
  char *v96;
  char *v97;
  unint64_t v98;
  uint64_t v99;
  _QWORD *v100;
  _QWORD *v101;
  uint64_t v102;
  uint64_t v103;
  unint64_t v104;
  char *v105;
  char *v106;
  uint64_t v107;
  unint64_t v108;
  char *v109;
  char *v110;
  unint64_t v111;
  unint64_t v112;
  unint64_t v113;
  char *v114;
  uint64_t v115;
  void (*v116)(char *, uint64_t);
  char *v117;
  id v118;
  unint64_t v119;
  void (*v120)(char *, unint64_t, uint64_t);
  void (*v121)(char *, uint64_t, uint64_t, uint64_t);
  id v122;
  uint64_t v123;
  void (*v124)(char *, uint64_t);
  __int128 v125;
  __int128 v126;
  uint64_t v127;

  v1 = v0;
  v127 = *MEMORY[0x24BDAC8D0];
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2568E61E0);
  v3 = MEMORY[0x24BDAC7A8](v2);
  v97 = (char *)&v95 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = MEMORY[0x24BDAC7A8](v3);
  v7 = (uint64_t)&v95 - v6;
  MEMORY[0x24BDAC7A8](v5);
  v106 = (char *)&v95 - v8;
  v115 = sub_2381C0640();
  v111 = *(_QWORD *)(v115 - 8);
  v9 = MEMORY[0x24BDAC7A8](v115);
  v96 = (char *)&v95 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = MEMORY[0x24BDAC7A8](v9);
  v105 = (char *)&v95 - v12;
  v13 = MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v95 - v14;
  v16 = MEMORY[0x24BDAC7A8](v13);
  v117 = (char *)&v95 - v17;
  MEMORY[0x24BDAC7A8](v16);
  v110 = (char *)&v95 - v18;
  v19 = (_QWORD *)MEMORY[0x24BEE4AF8];
  v124 = (void (*)(char *, uint64_t))MEMORY[0x24BEE4AF8];
  v20 = NSHomeDirectory();
  v21 = (_QWORD *)sub_2381C073C();
  v23 = v22;

  v24 = sub_2381B5A78(0, 1, 1, v19);
  v26 = v24[2];
  v25 = v24[3];
  v27 = (_QWORD *)(v26 + 1);
  if (v26 >= v25 >> 1)
    goto LABEL_90;
  while (2)
  {
    v101 = v24;
    v24[2] = v27;
    v100 = v24 + 4;
    v28 = &v24[2 * v26 + 4];
    *v28 = v21;
    v28[1] = v23;
    v29 = objc_msgSend((id)objc_opt_self(), sel_defaultManager);
    v30 = v101;
    v122 = v29;
    v31 = v115;
    v99 = v101[2];
    if (!v99)
    {
      swift_bridgeObjectRelease();
      v68 = (void (*)(char *, uint64_t))MEMORY[0x24BEE4AF8];
      v23 = v111;
LABEL_55:
      v69 = *((_QWORD *)v68 + 2);
      v114 = v1;
      if (!v69)
      {
        v90 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v23 + 56);
        v119 = MEMORY[0x24BEE4AF8];
        v90(v97, 1, 1, v115);
LABEL_81:

        swift_bridgeObjectRelease();
        return v119;
      }
      v70 = *(unsigned __int8 *)(v23 + 80);
      v116 = v68;
      v117 = (char *)((v70 + 32) & ~v70);
      v71 = &v117[(_QWORD)v68];
      v121 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v23 + 72);
      v72 = *(void (**)(char *, char *, uint64_t))(v23 + 16);
      v118 = (id)*MEMORY[0x24BDD0D08];
      v119 = MEMORY[0x24BEE4AF8];
      v120 = (void (*)(char *, unint64_t, uint64_t))(MEMORY[0x24BEE4AD8] + 8);
      v73 = v115;
      while (1)
      {
        v74 = v97;
        v72(v97, v71, v73);
        v75 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v23 + 56);
        v75(v74, 0, 1, v73);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v23 + 48))(v74, 1, v73) == 1)
          goto LABEL_81;
        v76 = *(void (**)(char *, char *, uint64_t))(v23 + 32);
        v76(v105, v74, v73);
        sub_2381C0634();
        v77 = (void *)sub_2381C0718();
        swift_bridgeObjectRelease();
        *(_QWORD *)&v125 = 0;
        v78 = objc_msgSend(v122, sel_attributesOfItemAtPath_error_, v77, &v125);

        v79 = (void *)v125;
        if (!v78)
          break;
        type metadata accessor for FileAttributeKey(0);
        sub_2381B8300(&qword_2568E61E8, (uint64_t (*)(uint64_t))type metadata accessor for FileAttributeKey, (uint64_t)&unk_2381C1AB8);
        v80 = sub_2381C06F4();
        v81 = v79;

        if (*(_QWORD *)(v80 + 16))
        {
          v82 = v118;
          v83 = sub_2381B61C4((uint64_t)v82);
          if ((v84 & 1) != 0)
          {
            sub_2381B01E4(*(_QWORD *)(v80 + 56) + 32 * v83, (uint64_t)&v125);
          }
          else
          {
            v125 = 0u;
            v126 = 0u;
          }

        }
        else
        {
          v125 = 0u;
          v126 = 0u;
        }
        swift_bridgeObjectRelease();
        v23 = v111;
        if (*((_QWORD *)&v126 + 1))
        {
          if ((swift_dynamicCast() & 1) == 0 || v123 < 1)
            goto LABEL_58;
          v72(v96, v105, v115);
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v119 = sub_2381B5870(0, *(_QWORD *)(v119 + 16) + 1, 1, v119);
          v88 = *(_QWORD *)(v119 + 16);
          v87 = *(_QWORD *)(v119 + 24);
          if (v88 >= v87 >> 1)
            v119 = sub_2381B5870(v87 > 1, v88 + 1, 1, v119);
          v89 = v119;
          *(_QWORD *)(v119 + 16) = v88 + 1;
          v76(&v117[v89 + v88 * (_QWORD)v121], v96, v115);
          goto LABEL_76;
        }
        sub_2381B6880((uint64_t)&v125, qword_2542C9E90);
LABEL_58:
        v73 = v115;
        (*(void (**)(char *, uint64_t))(v23 + 8))(v105, v115);
        v71 = (char *)v121 + (_QWORD)v71;
        if (!--v69)
        {
          v75(v97, 1, 1, v115);
          goto LABEL_81;
        }
      }
      v85 = (id)v125;
      v86 = (void *)sub_2381C05F8();

      swift_willThrow();
      v114 = 0;
LABEL_76:
      v23 = v111;
      goto LABEL_58;
    }
    swift_bridgeObjectRetain();
    v32 = 0;
    v98 = 0x80000002381C2520;
    v23 = v111;
    v109 = v15;
    while (1)
    {
      v25 = v30[2];
      if (v32 >= v25)
        goto LABEL_89;
      v108 = v32;
      swift_bridgeObjectRetain();
      v33 = v117;
      sub_2381C0604();
      swift_bridgeObjectRelease();
      v34 = v110;
      sub_2381C061C();
      v116 = *(void (**)(char *, uint64_t))(v23 + 8);
      v116(v33, v31);
      v21 = v34;
      v35 = sub_2381C0628();
      if (!v1)
        break;

      v1 = 0;
LABEL_5:
      v26 = (uint64_t)v116;
LABEL_6:
      v32 = v108 + 1;
      ((void (*)(char *, uint64_t))v26)(v110, v31);
      v30 = v101;
      if (v32 == v99)
      {
        swift_bridgeObjectRelease_n();
        v68 = v124;
        goto LABEL_55;
      }
    }
    if ((v35 & 1) == 0)
      goto LABEL_5;
    v36 = (void *)sub_2381C0610();
    *(_QWORD *)&v125 = 0;
    v37 = objc_msgSend(v122, sel_contentsOfDirectoryAtURL_includingPropertiesForKeys_options_error_, v36, 0, 0, &v125);

    v21 = (_QWORD *)v125;
    if (!v37)
    {
      v93 = (id)v125;
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      sub_2381C05F8();

      swift_willThrow();
      v116(v110, v31);
      return v119;
    }
    v38 = sub_2381C07A8();
    v39 = v21;

    v103 = *(_QWORD *)(v38 + 16);
    v107 = v38;
    if (!v103)
    {
      v23 = v111;
      v121 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v111 + 56);
      v41 = v106;
      v26 = (uint64_t)v116;
LABEL_51:
      v121(v41, 1, 1, v31);
LABEL_52:
      swift_bridgeObjectRelease();
      goto LABEL_6;
    }
    v40 = 0;
    v23 = v111;
    v113 = (*(unsigned __int8 *)(v23 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v23 + 80);
    v104 = v38 + v113;
    v41 = v106;
    v26 = (uint64_t)v116;
    while (1)
    {
      v25 = *(_QWORD *)(v107 + 16);
      if (v40 >= v25)
        goto LABEL_88;
      v15 = *(char **)(v23 + 72);
      v112 = v40;
      v120 = *(void (**)(char *, unint64_t, uint64_t))(v23 + 16);
      v120(v41, v104 + (_QWORD)v15 * v40, v31);
      v121 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v23 + 56);
      v121(v41, 0, 1, v31);
      v119 = *(_QWORD *)(v23 + 48);
      if (((unsigned int (*)(char *, uint64_t, uint64_t))v119)(v41, 1, v31) == 1)
        goto LABEL_52;
      v45 = v109;
      v118 = *(id *)(v23 + 32);
      ((void (*)(char *, char *, uint64_t))v118)(v109, v41, v31);
      sub_2381C0634();
      v46 = sub_2381C0790();
      swift_bridgeObjectRelease();
      if ((v46 & 1) != 0)
        break;
      sub_2381C0634();
      sub_2381C0790();
      swift_bridgeObjectRelease();
      v64 = (void *)sub_2381C0610();
      v15 = v45;
      *(_QWORD *)&v125 = 0;
      v65 = objc_msgSend(v122, sel_contentsOfDirectoryAtURL_includingPropertiesForKeys_options_error_, v64, 0, 0, &v125);

      v66 = (void *)v125;
      if (v65)
      {
        v27 = (_QWORD *)sub_2381C07A8();
        v42 = v66;

        v21 = &v124;
        sub_2381B4FFC((uint64_t)v27);
      }
      else
      {
        v67 = (id)v125;
        v21 = (_QWORD *)sub_2381C05F8();

        swift_willThrow();
        v1 = 0;
      }
      v23 = v111;
      v26 = (uint64_t)v116;
LABEL_15:
      v43 = v112 + 1;
      ((void (*)(char *, uint64_t))v26)(v15, v31);
      v40 = v43;
      v44 = v43 == v103;
      v41 = v106;
      if (v44)
        goto LABEL_51;
    }
    v47 = (void *)sub_2381C0610();
    *(_QWORD *)&v125 = 0;
    v48 = objc_msgSend(v122, sel_contentsOfDirectoryAtURL_includingPropertiesForKeys_options_error_, v47, 0, 0, &v125);

    v21 = (_QWORD *)v125;
    if (v48)
    {
      v114 = v1;
      v49 = sub_2381C07A8();
      v50 = v21;

      v1 = *(char **)(v49 + 16);
      v102 = v49;
      if (!v1)
      {
        v26 = (uint64_t)v116;
LABEL_48:
        v121((char *)v7, 1, 1, v31);
LABEL_49:
        swift_bridgeObjectRelease();
        v1 = v114;
        v23 = v111;
        v15 = v109;
        goto LABEL_15;
      }
      v23 = v49 + v113;
      v26 = (uint64_t)v116;
      while (1)
      {
        v120((char *)v7, v23, v31);
        v121((char *)v7, 0, 1, v31);
        if (((unsigned int (*)(uint64_t, uint64_t, uint64_t))v119)(v7, 1, v31) == 1)
          goto LABEL_49;
        v51 = v117;
        ((void (*)(char *, uint64_t, uint64_t))v118)(v117, v7, v31);
        v52 = (void *)sub_2381C0610();
        ((void (*)(char *, uint64_t))v26)(v51, v31);
        *(_QWORD *)&v125 = 0;
        v53 = objc_msgSend(v122, sel_contentsOfDirectoryAtURL_includingPropertiesForKeys_options_error_, v52, 0, 0, &v125);

        v54 = (id)v125;
        if (!v53)
        {
          v21 = v54;
          v27 = (_QWORD *)sub_2381C05F8();

          swift_willThrow();
          v114 = 0;
          goto LABEL_24;
        }
        v55 = (char *)v7;
        v21 = (_QWORD *)sub_2381C07A8();

        v7 = v21[2];
        v27 = v124;
        v56 = *((_QWORD *)v124 + 2);
        v26 = v56 + v7;
        if (__OFADD__(v56, v7))
          break;
        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        if (!isUniquelyReferenced_nonNull_native || (v25 = v27[3] >> 1, (uint64_t)v25 < v26))
        {
          if (v56 <= v26)
            v58 = v56 + v7;
          else
            v58 = v56;
          v27 = (_QWORD *)sub_2381B5870(isUniquelyReferenced_nonNull_native, v58, 1, (unint64_t)v27);
          v25 = v27[3] >> 1;
        }
        v31 = v115;
        v26 = (uint64_t)v116;
        if (v21[2])
        {
          v59 = v27[2];
          v25 -= v59;
          if ((uint64_t)v25 < v7)
            goto LABEL_86;
          v60 = (char *)v27 + v113 + v59 * (_QWORD)v15;
          if ((char *)v21 + v113 < &v60[v7 * (_QWORD)v15] && v60 < (char *)v21 + v113 + v7 * (_QWORD)v15)
          {
            result = sub_2381C0940();
            __break(1u);
            return result;
          }
          swift_arrayInitWithCopy();
          if (v7)
          {
            v62 = v27[2];
            v63 = __OFADD__(v62, v7);
            v25 = v62 + v7;
            if (v63)
              goto LABEL_87;
            v27[2] = v25;
          }
        }
        else if (v7)
        {
          goto LABEL_85;
        }
        swift_bridgeObjectRelease();
        v124 = (void (*)(char *, uint64_t))v27;
        v7 = (uint64_t)v55;
LABEL_24:
        v23 += (unint64_t)v15;
        if (!--v1)
          goto LABEL_48;
      }
      __break(1u);
LABEL_85:
      __break(1u);
LABEL_86:
      __break(1u);
LABEL_87:
      __break(1u);
LABEL_88:
      __break(1u);
LABEL_89:
      __break(1u);
LABEL_90:
      v24 = sub_2381B5A78((_QWORD *)(v25 > 1), (int64_t)v27, 1, v24);
      continue;
    }
    break;
  }
  v91 = (id)v125;
  swift_bridgeObjectRelease_n();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_2381C05F8();

  swift_willThrow();
  v92 = v116;
  v116(v109, v31);
  v92(v110, v31);
  return v119;
}

unint64_t sub_2381B7B50()
{
  unint64_t result;

  result = qword_2568E61A8;
  if (!qword_2568E61A8)
  {
    result = MEMORY[0x23B82E4F4](&unk_2381C1690, &type metadata for Mode);
    atomic_store(result, (unint64_t *)&qword_2568E61A8);
  }
  return result;
}

unint64_t sub_2381B7B98()
{
  unint64_t result;

  result = qword_2568E61B0;
  if (!qword_2568E61B0)
  {
    result = MEMORY[0x23B82E4F4](&unk_2381C16F8, &type metadata for Reporter.CloudTelemetryFeatureFlags);
    atomic_store(result, (unint64_t *)&qword_2568E61B0);
  }
  return result;
}

unint64_t sub_2381B7BE0()
{
  unint64_t result;

  result = qword_2568E61B8;
  if (!qword_2568E61B8)
  {
    result = MEMORY[0x23B82E4F4](&unk_2381C1790, &type metadata for Reporter.Error);
    atomic_store(result, (unint64_t *)&qword_2568E61B8);
  }
  return result;
}

_QWORD *initializeBufferWithCopyOfBuffer for LegacyClientError(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for LegacyClientError()
{
  return swift_bridgeObjectRelease();
}

_QWORD *assignWithCopy for LegacyClientError(_QWORD *a1, _QWORD *a2)
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

_QWORD *assignWithTake for LegacyClientError(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for LegacyClientError(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for LegacyClientError(uint64_t result, int a2, int a3)
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

uint64_t sub_2381B7D5C()
{
  return 0;
}

ValueMetadata *type metadata accessor for LegacyClientError()
{
  return &type metadata for LegacyClientError;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t sub_2381B7D8C(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_2381B7D94(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for Mode()
{
  return &type metadata for Mode;
}

uint64_t destroy for TransportConfiguration()
{
  return swift_bridgeObjectRelease();
}

uint64_t _s14CloudTelemetry22TransportConfigurationVwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  *(_WORD *)a1 = *(_WORD *)a2;
  v3 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for TransportConfiguration(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_BYTE *)(a1 + 1) = *(_BYTE *)(a2 + 1);
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

uint64_t assignWithTake for TransportConfiguration(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  *(_WORD *)a1 = *(_WORD *)a2;
  v3 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for TransportConfiguration(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 24))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *(_QWORD *)(a1 + 16);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for TransportConfiguration(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 24) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 24) = 0;
    if (a2)
      *(_QWORD *)(result + 16) = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for TransportConfiguration()
{
  return &type metadata for TransportConfiguration;
}

uint64_t type metadata accessor for CloudTelemetry()
{
  return objc_opt_self();
}

uint64_t method lookup function for Reporter()
{
  return swift_lookUpClassMethod();
}

uint64_t getEnumTagSinglePayload for Reporter.CloudTelemetryFeatureFlags(unsigned int *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for Reporter.CloudTelemetryFeatureFlags(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_2381B800C + 4 * byte_2381C15D0[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_2381B802C + 4 * byte_2381C15D5[v4]))();
}

_BYTE *sub_2381B800C(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_2381B802C(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_2381B8034(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_2381B803C(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_2381B8044(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_2381B804C(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for Reporter.CloudTelemetryFeatureFlags()
{
  return &type metadata for Reporter.CloudTelemetryFeatureFlags;
}

uint64_t _s14CloudTelemetry4ModeOwet_0(unsigned __int8 *a1, unsigned int a2)
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

uint64_t _s14CloudTelemetry4ModeOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2381B8144 + 4 * byte_2381C15DF[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_2381B8178 + 4 * byte_2381C15DA[v4]))();
}

uint64_t sub_2381B8178(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2381B8180(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2381B8188);
  return result;
}

uint64_t sub_2381B8194(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2381B819CLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_2381B81A0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2381B81A8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for Reporter.Error()
{
  return &type metadata for Reporter.Error;
}

void type metadata accessor for os_unfair_lock_s(uint64_t a1)
{
  sub_2381B82B8(a1, &qword_2542CA630);
}

unint64_t sub_2381B81D8()
{
  unint64_t result;

  result = qword_2568E61C8;
  if (!qword_2568E61C8)
  {
    result = MEMORY[0x23B82E4F4](&unk_2381C1830, &type metadata for Reporter.Error);
    atomic_store(result, (unint64_t *)&qword_2568E61C8);
  }
  return result;
}

unint64_t sub_2381B821C()
{
  unint64_t result;

  result = qword_2568E61D0;
  if (!qword_2568E61D0)
  {
    result = MEMORY[0x23B82E4F4](&unk_2381C17F8, &type metadata for Reporter.Error);
    atomic_store(result, (unint64_t *)&qword_2568E61D0);
  }
  return result;
}

unint64_t sub_2381B8260()
{
  unint64_t result;

  result = qword_2568E61D8;
  if (!qword_2568E61D8)
  {
    result = MEMORY[0x23B82E4F4](MEMORY[0x24BEE4048], MEMORY[0x24BEE4008]);
    atomic_store(result, (unint64_t *)&qword_2568E61D8);
  }
  return result;
}

void type metadata accessor for FileAttributeKey(uint64_t a1)
{
  sub_2381B82B8(a1, &qword_2568E6228);
}

void sub_2381B82B8(uint64_t a1, unint64_t *a2)
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

uint64_t sub_2381B8300(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x23B82E4F4](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_2381B8340()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2381B8364(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_2381B86B0;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_2568E62E0 + dword_2568E62E0))(a1, v4);
}

void sub_2381B83D4(_QWORD *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  id v4;
  os_log_type_t v5;
  uint64_t v6;
  NSObject *oslog;

  if (__OFSUB__(*a1, 1))
  {
    __break(1u);
  }
  else
  {
    v1 = *(void **)(v2 + 16);
    --*a1;
    if (qword_2542CA720 == -1)
      goto LABEL_3;
  }
  swift_once();
LABEL_3:
  v3 = sub_2381C06C4();
  __swift_project_value_buffer(v3, (uint64_t)qword_2542CA708);
  v4 = v1;
  oslog = sub_2381C06AC();
  v5 = sub_2381C0838();
  if (os_log_type_enabled(oslog, v5))
  {
    v6 = swift_slowAlloc();
    *(_DWORD *)v6 = 134349312;
    sub_2381C0898();
    *(_WORD *)(v6 + 12) = 2050;
    sub_2381C0898();

    _os_log_impl(&dword_2381AB000, oslog, v5, "active sendOneMessage count now %{public}ld/%{public}ld", (uint8_t *)v6, 0x16u);
    MEMORY[0x23B82E590](v6, -1, -1);
  }
  else
  {

  }
}

uint64_t sub_2381B8540()
{
  swift_unknownObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_2381B8564(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_2381AD438;
  v3[7] = a1;
  return swift_task_switch();
}

unint64_t sub_2381B85C4()
{
  unint64_t result;

  result = qword_2542C9F68;
  if (!qword_2542C9F68)
  {
    result = MEMORY[0x23B82E4F4](&unk_2381C1760, &type metadata for Reporter.CloudTelemetryFeatureFlags);
    atomic_store(result, (unint64_t *)&qword_2542C9F68);
  }
  return result;
}

uint64_t __swift_destroy_boxed_opaque_existential_0Tm(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_2381B8628()
{
  return sub_2381B8300(&qword_2568E6230, (uint64_t (*)(uint64_t))type metadata accessor for FileAttributeKey, (uint64_t)&unk_2381C19D0);
}

uint64_t sub_2381B8654()
{
  return sub_2381B8300(&qword_2568E6238, (uint64_t (*)(uint64_t))type metadata accessor for FileAttributeKey, (uint64_t)&unk_2381C19A4);
}

uint64_t sub_2381B8680()
{
  return sub_2381B8300(&qword_2568E6240, (uint64_t (*)(uint64_t))type metadata accessor for FileAttributeKey, (uint64_t)&unk_2381C1A40);
}

uint64_t XPCTypeConnection.getter()
{
  return MEMORY[0x24BDACF88];
}

uint64_t XPCTypeEndpoint.getter()
{
  return MEMORY[0x24BDACFB0];
}

uint64_t XPCTypeNull.getter()
{
  return MEMORY[0x24BDACFE0];
}

uint64_t XPCTypeBool.getter()
{
  return MEMORY[0x24BDACF80];
}

uint64_t XPCTypeInt64.getter()
{
  return MEMORY[0x24BDACFD0];
}

uint64_t XPCTypeUInt64.getter()
{
  return MEMORY[0x24BDACFF8];
}

uint64_t XPCTypeDouble.getter()
{
  return MEMORY[0x24BDACFA8];
}

uint64_t XPCTypeData.getter()
{
  return MEMORY[0x24BDACF90];
}

uint64_t XPCTypeDate.getter()
{
  return MEMORY[0x24BDACF98];
}

uint64_t XPCTypeString.getter()
{
  return MEMORY[0x24BDACFF0];
}

uint64_t XPCTypeUUID.getter()
{
  return MEMORY[0x24BDAD000];
}

uint64_t XPCTypeShmem.getter()
{
  return MEMORY[0x24BDACFE8];
}

uint64_t XPCTypeArray.getter()
{
  return MEMORY[0x24BDACF78];
}

uint64_t XPCTypeDictionary.getter()
{
  return MEMORY[0x24BDACFA0];
}

uint64_t XPCTypeError.getter()
{
  return MEMORY[0x24BDACFB8];
}

uint64_t XPCTypeActivity.getter()
{
  return MEMORY[0x24BDACF70];
}

const char *SubmitEventsActivityConfig.identifier.unsafeMutableAddressor()
{
  return "submit";
}

uint64_t static SubmitEventsActivityConfig.identifier.getter()
{
  return 0x74696D627573;
}

uint64_t sub_2381B87B0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  _BYTE *v6;
  _QWORD *v7;
  _QWORD *v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t *v11;
  uint64_t v12;
  _QWORD *v13;
  _BYTE *v14;
  uint64_t result;
  _QWORD *v16;
  _BYTE *v17;
  _QWORD *v18;
  _QWORD *v19;
  _QWORD *v20;
  _BYTE *v21;
  _QWORD *v22;
  _BYTE *v23;
  _QWORD *v24;
  _QWORD *v25;
  _QWORD *v26;
  _QWORD *v27;
  _QWORD *v28;
  _QWORD *v29;
  _QWORD *v30;
  _QWORD *v31;
  unint64_t v32;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2542CA040);
  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542CA018);
  v1 = *(_QWORD *)(v0 - 8);
  v2 = *(_QWORD *)(v1 + 72);
  v3 = (*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_2381C1B00;
  v5 = (_QWORD *)(v4 + v3);
  v6 = (char *)v5 + *(int *)(v0 + 48);
  *v5 = *MEMORY[0x24BDAC6B8];
  *v6 = 1;
  type metadata accessor for XPCObject();
  swift_storeEnumTagMultiPayload();
  v7 = (_QWORD *)((char *)v5 + v2 + *(int *)(v0 + 48));
  *(_QWORD *)((char *)v5 + v2) = *MEMORY[0x24BDAC5B8];
  *v7 = 86400;
  swift_storeEnumTagMultiPayload();
  v8 = (_QWORD *)((char *)v5 + 2 * v2);
  v9 = (_QWORD *)((char *)v8 + *(int *)(v0 + 48));
  *v8 = *MEMORY[0x24BDAC5D8];
  *v9 = 43200;
  swift_storeEnumTagMultiPayload();
  v10 = (_QWORD *)((char *)v5 + 3 * v2);
  v11 = (_QWORD *)((char *)v10 + *(int *)(v0 + 48));
  *v10 = *MEMORY[0x24BDAC698];
  *v11 = sub_2381C0778();
  v11[1] = v12;
  swift_storeEnumTagMultiPayload();
  v13 = (_QWORD *)((char *)v5 + 4 * v2);
  v14 = (char *)v13 + *(int *)(v0 + 48);
  *v13 = *MEMORY[0x24BDAC598];
  *v14 = 0;
  result = swift_storeEnumTagMultiPayload();
  if (!*MEMORY[0x24BDAC688])
  {
    __break(1u);
    goto LABEL_11;
  }
  v16 = (_QWORD *)((char *)v5 + 5 * v2);
  v17 = (char *)v16 + *(int *)(v0 + 48);
  *v16 = *MEMORY[0x24BDAC688];
  *v17 = 1;
  result = swift_storeEnumTagMultiPayload();
  if (!*MEMORY[0x24BDAC6B0])
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  v18 = (_QWORD *)((char *)v5 + 6 * v2);
  v19 = (_QWORD *)((char *)v18 + *(int *)(v0 + 48));
  *v18 = *MEMORY[0x24BDAC6B0];
  *v19 = 43200;
  result = swift_storeEnumTagMultiPayload();
  if (!*MEMORY[0x24BDAC6E0])
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  v20 = (_QWORD *)((char *)&v5[v2] - v2);
  v21 = (char *)v20 + *(int *)(v0 + 48);
  *v20 = *MEMORY[0x24BDAC6E0];
  *v21 = 1;
  result = swift_storeEnumTagMultiPayload();
  if (!*MEMORY[0x24BDAC6D8])
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  v22 = &v5[v2];
  v23 = (char *)v22 + *(int *)(v0 + 48);
  *v22 = *MEMORY[0x24BDAC6D8];
  *v23 = 1;
  result = swift_storeEnumTagMultiPayload();
  if (!*MEMORY[0x24BDAC678])
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v24 = (_QWORD *)((char *)v5 + 9 * v2);
  v25 = (_QWORD *)((char *)v24 + *(int *)(v0 + 48));
  *v24 = *MEMORY[0x24BDAC678];
  *v25 = 5242880;
  result = swift_storeEnumTagMultiPayload();
  if (!*MEMORY[0x24BDAC5D0])
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  v26 = (_QWORD *)((char *)v5 + 10 * v2);
  v27 = (_QWORD *)((char *)v26 + *(int *)(v0 + 48));
  *v26 = *MEMORY[0x24BDAC5D0];
  *v27 = *MEMORY[0x24BDAC628];
  result = swift_storeEnumTagMultiPayload();
  if (!*MEMORY[0x24BDAC5E8])
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v28 = (_QWORD *)((char *)v5 + 11 * v2);
  v29 = (_QWORD *)((char *)v28 + *(int *)(v0 + 48));
  *v28 = *MEMORY[0x24BDAC5E8];
  *v29 = 0xD000000000000025;
  v29[1] = 0x80000002381C2860;
  result = swift_storeEnumTagMultiPayload();
  if (*MEMORY[0x24BDAC5E0])
  {
    v30 = (_QWORD *)((char *)v5 + 12 * v2);
    v31 = (_QWORD *)((char *)v30 + *(int *)(v0 + 48));
    *v30 = *MEMORY[0x24BDAC5E0];
    *v31 = 1;
    swift_storeEnumTagMultiPayload();
    v32 = sub_2381B8E68(v4);
    swift_setDeallocating();
    swift_arrayDestroy();
    result = swift_deallocClassInstance();
    static SubmitEventsActivityConfig.activityFlags = v32;
    return result;
  }
LABEL_17:
  __break(1u);
  return result;
}

uint64_t *SubmitEventsActivityConfig.activityFlags.unsafeMutableAddressor()
{
  if (qword_2542CA880 != -1)
    swift_once();
  return &static SubmitEventsActivityConfig.activityFlags;
}

uint64_t static SubmitEventsActivityConfig.activityFlags.getter()
{
  if (qword_2542CA880 != -1)
    swift_once();
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

uint64_t static SubmitEventsActivityConfig.activityFlags.setter(uint64_t a1)
{
  if (qword_2542CA880 != -1)
    swift_once();
  swift_beginAccess();
  static SubmitEventsActivityConfig.activityFlags = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*static SubmitEventsActivityConfig.activityFlags.modify())()
{
  if (qword_2542CA880 != -1)
    swift_once();
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t sub_2381B8D0C()
{
  if (qword_2542CA880 != -1)
    swift_once();
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

uint64_t sub_2381B8D78()
{
  return 0x74696D627573;
}

ValueMetadata *type metadata accessor for SubmitEventsActivityConfig()
{
  return &type metadata for SubmitEventsActivityConfig;
}

unint64_t sub_2381B8D9C(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_2381C09D0();
  return sub_2381B8DCC(a1, v2);
}

unint64_t sub_2381B8DCC(uint64_t a1, uint64_t a2)
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

unint64_t sub_2381B8E68(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t result;
  char v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  BOOL v18;
  uint64_t v19;
  uint64_t v20;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542CA018);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (uint64_t *)((char *)&v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  v6 = *(_QWORD *)(a1 + 16);
  if (v6)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2542CA038);
    v7 = (_QWORD *)sub_2381C0934();
    v8 = (uint64_t)v5 + *(int *)(v2 + 48);
    v9 = a1 + ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
    v10 = *(_QWORD *)(v3 + 72);
    while (1)
    {
      sub_2381B8FC0(v9, (uint64_t)v5);
      v11 = *v5;
      result = sub_2381B8D9C(*v5);
      if ((v13 & 1) != 0)
        break;
      v14 = result;
      *(_QWORD *)((char *)v7 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
      *(_QWORD *)(v7[6] + 8 * result) = v11;
      v15 = v7[7];
      v16 = type metadata accessor for XPCObject();
      result = sub_2381B9008(v8, v15 + *(_QWORD *)(*(_QWORD *)(v16 - 8) + 72) * v14);
      v17 = v7[2];
      v18 = __OFADD__(v17, 1);
      v19 = v17 + 1;
      if (v18)
        goto LABEL_10;
      v7[2] = v19;
      v9 += v10;
      if (!--v6)
        return (unint64_t)v7;
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

uint64_t sub_2381B8FC0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542CA018);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2381B9008(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for XPCObject();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

_BYTE *XPCObject.init(_:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _BYTE *result;
  BOOL value;
  int64_t v19;
  uint64_t v20;
  double v21;
  int64_t v22;
  _BYTE *v23;
  size_t length;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  v4 = type metadata accessor for XPCObject();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v8 = (uint64_t *)((char *)&v32 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  v9 = MEMORY[0x24BDAC7A8](v6);
  v11 = (uint64_t *)((char *)&v32 - v10);
  MEMORY[0x24BDAC7A8](v9);
  v13 = (uint64_t *)((char *)&v32 - v12);
  if (!a1)
    return (_BYTE *)(*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v5 + 56))(a2, 1, 1, v4);
  v14 = swift_unknownObjectRetain();
  v15 = MEMORY[0x23B82E800](v14);
  if (XPCTypeNull.getter() == v15)
  {
    swift_unknownObjectRelease_n();
LABEL_26:
    swift_storeEnumTagMultiPayload();
LABEL_27:
    sub_2381B9008((uint64_t)v13, a2);
    return (_BYTE *)(*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v5 + 56))(a2, 0, 1, v4);
  }
  if (XPCTypeConnection.getter() == v15 || XPCTypeEndpoint.getter() == v15)
  {
LABEL_35:
    swift_unknownObjectRelease();
    *v13 = a1;
    goto LABEL_26;
  }
  if (XPCTypeBool.getter() == v15)
  {
    value = xpc_BOOL_get_value(a1);
    swift_unknownObjectRelease_n();
    *(_BYTE *)v13 = value;
    goto LABEL_26;
  }
  if (XPCTypeInt64.getter() == v15)
  {
    v19 = xpc_int64_get_value(a1);
    swift_unknownObjectRelease_n();
    *v13 = v19;
    goto LABEL_26;
  }
  if (XPCTypeUInt64.getter() == v15)
  {
    v20 = xpc_uint64_get_value(a1);
    swift_unknownObjectRelease_n();
    *v13 = v20;
    goto LABEL_26;
  }
  if (XPCTypeDouble.getter() == v15)
  {
    v21 = xpc_double_get_value(a1);
    swift_unknownObjectRelease_n();
    *(double *)v13 = v21;
    goto LABEL_26;
  }
  if (XPCTypeDate.getter() == v15)
  {
    v22 = xpc_date_get_value(a1);
    swift_unknownObjectRelease_n();
    *v13 = v22;
    goto LABEL_26;
  }
  if (XPCTypeData.getter() == v15)
  {
    result = xpc_data_get_bytes_ptr(a1);
    if (result)
    {
      v23 = result;
      length = xpc_data_get_length(a1);
      v25 = sub_2381BA250(v23, length);
      v27 = v26;
      swift_unknownObjectRelease_n();
      *v11 = v25;
      v11[1] = v27;
      swift_storeEnumTagMultiPayload();
      v28 = (uint64_t)v11;
LABEL_32:
      sub_2381B9008(v28, (uint64_t)v13);
      goto LABEL_27;
    }
    __break(1u);
LABEL_38:
    __break(1u);
    goto LABEL_39;
  }
  if (XPCTypeString.getter() == v15)
  {
    result = xpc_string_get_string_ptr(a1);
    if (result)
    {
      v29 = sub_2381C0778();
      v31 = v30;
      swift_unknownObjectRelease_n();
      *v8 = v29;
      v8[1] = v31;
      swift_storeEnumTagMultiPayload();
      v28 = (uint64_t)v8;
      goto LABEL_32;
    }
    goto LABEL_38;
  }
  if (XPCTypeUUID.getter() != v15)
  {
    if (XPCTypeShmem.getter() != v15 && XPCTypeArray.getter() != v15)
    {
      v16 = XPCTypeDictionary.getter();
      swift_unknownObjectRelease();
      if (v16 != v15)
      {
        swift_unknownObjectRelease();
        return (_BYTE *)(*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v5 + 56))(a2, 1, 1, v4);
      }
      *v13 = a1;
      goto LABEL_26;
    }
    goto LABEL_35;
  }
  result = xpc_uuid_get_bytes(a1);
  if (result)
  {
    sub_2381C0658();
    swift_unknownObjectRelease_n();
    goto LABEL_26;
  }
LABEL_39:
  __break(1u);
  return result;
}

uint64_t type metadata accessor for XPCObject()
{
  uint64_t result;

  result = qword_2542CA890;
  if (!qword_2542CA890)
    return swift_getSingletonMetadata();
  return result;
}

void XPCObject.obj.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  _QWORD v5[4];

  v5[3] = *MEMORY[0x24BDAC8D0];
  v1 = sub_2381C0670();
  MEMORY[0x24BDAC7A8](v1);
  v2 = type metadata accessor for XPCObject();
  MEMORY[0x24BDAC7A8](v2);
  sub_2381BA2FC(v0, (uint64_t)v5 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  v4 = (char *)&loc_2381B95A8 + dword_2381B98DC[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

uint64_t sub_2381B95B8()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

BOOL static XPCObject.== infix(_:_:)()
{
  void *v0;
  void *v1;
  xpc_object_t v2;
  _BOOL8 v3;

  XPCObject.obj.getter();
  v1 = v0;
  XPCObject.obj.getter();
  v3 = xpc_equal(v1, v2);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  return v3;
}

BOOL sub_2381B9988()
{
  void *v0;
  void *v1;
  xpc_object_t v2;
  _BOOL8 v3;

  XPCObject.obj.getter();
  v1 = v0;
  XPCObject.obj.getter();
  v3 = xpc_equal(v1, v2);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  return v3;
}

xpc_object_t XPCDictionary.init(dictionaryLiteral:)(uint64_t a1)
{
  xpc_object_t v1;

  v1 = sub_2381BA3C8(a1);
  swift_bridgeObjectRelease();
  return v1;
}

uint64_t XPCDictionary.subscript.setter(uint64_t a1)
{
  void **v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v12;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542CA000);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *v1;
  sub_2381AF1F8(a1, (uint64_t)v5, &qword_2542CA000);
  v7 = type metadata accessor for XPCObject();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 48))(v5, 1, v7) == 1)
  {
    sub_2381B6880((uint64_t)v5, &qword_2542CA000);
    v8 = 0;
  }
  else
  {
    XPCObject.obj.getter();
    v8 = v9;
    sub_2381B63FC((uint64_t)v5);
  }
  v10 = sub_2381C0754();
  swift_bridgeObjectRelease();
  xpc_dictionary_set_value(v6, (const char *)(v10 + 32), v8);
  swift_unknownObjectRelease();
  sub_2381B6880(a1, &qword_2542CA000);
  return swift_release();
}

uint64_t XPCDictionary.keys.getter(void *a1)
{
  int64_t count;
  _QWORD *v3;
  _QWORD *isUniquelyReferenced_nonNull_native;
  int64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  char isEscapingClosureAtFileLocation;
  uint64_t result;
  _QWORD *v11;
  _QWORD aBlock[6];
  _QWORD *v13;

  count = xpc_dictionary_get_count(a1);
  v3 = (_QWORD *)MEMORY[0x24BEE4AF8];
  isUniquelyReferenced_nonNull_native = (_QWORD *)swift_isUniquelyReferenced_nonNull_native();
  if (!(_DWORD)isUniquelyReferenced_nonNull_native || count > v3[3] >> 1)
  {
    if (v3[2] <= count)
      v5 = count;
    else
      v5 = v3[2];
    v3 = sub_2381B5A78(isUniquelyReferenced_nonNull_native, v5, 0, v3);
  }
  v13 = v3;
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = &v13;
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = sub_2381BA6D8;
  *(_QWORD *)(v7 + 24) = v6;
  aBlock[4] = sub_2381BA79C;
  aBlock[5] = v7;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_2381B9CBC;
  aBlock[3] = &block_descriptor;
  v8 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  xpc_dictionary_apply(a1, v8);
  _Block_release(v8);
  isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  result = swift_release();
  if ((isEscapingClosureAtFileLocation & 1) != 0)
  {
    __break(1u);
  }
  else
  {
    v11 = v13;
    swift_release();
    return (uint64_t)v11;
  }
  return result;
}

uint64_t sub_2381B9CBC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t (*v5)(uint64_t, uint64_t);
  char v6;

  v5 = *(uint64_t (**)(uint64_t, uint64_t))(a1 + 32);
  swift_unknownObjectRetain();
  v6 = v5(a2, a3);
  swift_unknownObjectRelease();
  return v6 & 1;
}

_BYTE *XPCDictionary.subscript.getter@<X0>(void *a1@<X2>, uint64_t a2@<X8>)
{
  uint64_t v4;
  xpc_object_t v5;

  v4 = sub_2381C0754();
  v5 = xpc_dictionary_get_value(a1, (const char *)(v4 + 32));
  swift_release();
  return XPCObject.init(_:)(v5, a2);
}

void (*XPCDictionary.subscript.modify(_QWORD *a1, uint64_t a2, uint64_t a3))(uint64_t a1, char a2)
{
  void **v3;
  _QWORD *v7;
  size_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  xpc_object_t v12;

  v7 = malloc(0x38uLL);
  *a1 = v7;
  v7[1] = a3;
  v7[2] = v3;
  *v7 = a2;
  v8 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2542CA000) - 8) + 64);
  v7[3] = malloc(v8);
  v7[4] = malloc(v8);
  v7[5] = malloc(v8);
  v9 = malloc(v8);
  v7[6] = v9;
  v10 = *v3;
  v11 = sub_2381C0754();
  v12 = xpc_dictionary_get_value(v10, (const char *)(v11 + 32));
  swift_release();
  XPCObject.init(_:)(v12, (uint64_t)v9);
  return sub_2381B9E44;
}

void sub_2381B9E44(uint64_t a1, char a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void **v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;

  v2 = *(_QWORD **)a1;
  v3 = *(_QWORD *)(*(_QWORD *)a1 + 48);
  if ((a2 & 1) != 0)
  {
    v5 = v2[3];
    v4 = v2[4];
    v6 = (void **)v2[2];
    sub_2381AF1F8(v3, v4, &qword_2542CA000);
    v7 = *v6;
    sub_2381AF1F8(v4, v5, &qword_2542CA000);
    v8 = type metadata accessor for XPCObject();
    LODWORD(v5) = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(v5, 1, v8);
    swift_bridgeObjectRetain();
    v9 = v2[3];
    if ((_DWORD)v5 == 1)
    {
      sub_2381B6880(v2[3], &qword_2542CA000);
      v10 = 0;
    }
    else
    {
      XPCObject.obj.getter();
      v10 = v17;
      sub_2381B63FC(v9);
    }
    v19 = (void *)v2[5];
    v18 = (void *)v2[6];
    v21 = (void *)v2[3];
    v20 = (void *)v2[4];
    v22 = sub_2381C0754();
    swift_bridgeObjectRelease();
    xpc_dictionary_set_value(v7, (const char *)(v22 + 32), v10);
    swift_unknownObjectRelease();
    sub_2381B6880((uint64_t)v20, &qword_2542CA000);
    swift_release();
    sub_2381B6880((uint64_t)v18, &qword_2542CA000);
  }
  else
  {
    v11 = v2[5];
    v12 = *(void **)v2[2];
    sub_2381AF1F8(v3, v11, &qword_2542CA000);
    v13 = type metadata accessor for XPCObject();
    v14 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 48))(v11, 1, v13);
    swift_bridgeObjectRetain();
    v15 = v2[5];
    if (v14 == 1)
    {
      sub_2381B6880(v2[5], &qword_2542CA000);
      v16 = 0;
    }
    else
    {
      XPCObject.obj.getter();
      v16 = v23;
      sub_2381B63FC(v15);
    }
    v19 = (void *)v2[5];
    v18 = (void *)v2[6];
    v21 = (void *)v2[3];
    v20 = (void *)v2[4];
    v24 = sub_2381C0754();
    swift_bridgeObjectRelease();
    xpc_dictionary_set_value(v12, (const char *)(v24 + 32), v16);
    swift_unknownObjectRelease();
    sub_2381B6880((uint64_t)v18, &qword_2542CA000);
    swift_release();
  }
  free(v18);
  free(v19);
  free(v20);
  free(v21);
  free(v2);
}

Swift::Bool __swiftcall XPCDictionary.contains(key:)(Swift::String key)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  xpc_object_t v7;
  uint64_t v8;
  uint64_t v10;

  v2 = v1;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542CA000);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_2381C0754();
  v7 = xpc_dictionary_get_value(v2, (const char *)(v6 + 32));
  swift_release();
  XPCObject.init(_:)(v7, (uint64_t)v5);
  v8 = type metadata accessor for XPCObject();
  LOBYTE(v7) = (*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(v5, 1, v8) != 1;
  sub_2381B6880((uint64_t)v5, &qword_2542CA000);
  return (char)v7;
}

uint64_t sub_2381BA154@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  xpc_object_t v3;
  uint64_t result;

  v3 = sub_2381BA3C8(a1);
  result = swift_bridgeObjectRelease();
  *a2 = v3;
  return result;
}

uint64_t sub_2381BA190(_BYTE *__src, _BYTE *a2)
{
  unint64_t v2;
  _BYTE __dst[14];
  char v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  if (__src)
    v2 = a2 - __src;
  else
    v2 = 0;
  if ((v2 & 0x8000000000000000) != 0)
  {
    __break(1u);
LABEL_11:
    __break(1u);
  }
  if (v2 > 0xFF)
    goto LABEL_11;
  memset(__dst, 0, sizeof(__dst));
  v5 = v2;
  if (__src && a2 != __src)
    memcpy(__dst, __src, a2 - __src);
  return *(_QWORD *)__dst;
}

uint64_t sub_2381BA250(_BYTE *__src, uint64_t a2)
{
  uint64_t result;

  if (!a2)
    return 0;
  if (a2 <= 14)
    return sub_2381BA190(__src, &__src[a2]);
  sub_2381C05BC();
  swift_allocObject();
  sub_2381C058C();
  if ((unint64_t)a2 < 0x7FFFFFFF)
    return a2 << 32;
  sub_2381C064C();
  result = swift_allocObject();
  *(_QWORD *)(result + 16) = 0;
  *(_QWORD *)(result + 24) = a2;
  return result;
}

uint64_t sub_2381BA2FC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for XPCObject();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2381BA340(uint64_t a1, unint64_t a2)
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

uint64_t sub_2381BA384(uint64_t a1, unint64_t a2)
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

xpc_object_t sub_2381BA3C8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD *v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  _QWORD *v42;
  _QWORD *v43;
  uint64_t *v44;
  uint64_t v45;
  xpc_object_t empty;
  uint64_t v47;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542CA000);
  v3 = MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v38 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)&v38 - v6;
  v45 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542C9E58);
  v8 = *(_QWORD *)(v45 - 8);
  v9 = MEMORY[0x24BDAC7A8](v45);
  v43 = (uint64_t *)((char *)&v38 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  v11 = MEMORY[0x24BDAC7A8](v9);
  v42 = (uint64_t *)((char *)&v38 - v12);
  v13 = MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v38 - v14;
  MEMORY[0x24BDAC7A8](v13);
  v44 = (uint64_t *)((char *)&v38 - v16);
  empty = xpc_dictionary_create_empty();
  v17 = *(_QWORD *)(a1 + 16);
  if (v17)
  {
    v41 = (uint64_t)v44 + *(int *)(v45 + 48);
    v18 = a1 + ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80));
    v19 = *(_QWORD *)(v8 + 72);
    v39 = v15;
    v40 = v19;
    do
    {
      v22 = v44;
      sub_2381AF1F8(v18, (uint64_t)v44, &qword_2542C9E58);
      v23 = v45;
      v24 = (uint64_t)&v15[*(int *)(v45 + 48)];
      v25 = (uint64_t *)v15;
      v27 = *v22;
      v26 = v22[1];
      *v25 = *v22;
      v25[1] = v26;
      sub_2381B9008(v41, v24);
      v28 = *(int *)(v23 + 48);
      v29 = v42;
      v30 = (uint64_t)v42 + v28;
      *v42 = v27;
      v29[1] = v26;
      v47 = (uint64_t)v29 + v28;
      sub_2381BA2FC(v24, v30);
      v31 = *(int *)(v23 + 48);
      v32 = v43;
      v33 = (uint64_t)v43 + v31;
      *v43 = v27;
      v32[1] = v26;
      sub_2381BA2FC(v24, (uint64_t)v32 + v31);
      sub_2381B9008(v33, (uint64_t)v7);
      v34 = type metadata accessor for XPCObject();
      v35 = *(_QWORD *)(v34 - 8);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v35 + 56))(v7, 0, 1, v34);
      sub_2381AF1F8((uint64_t)v7, (uint64_t)v5, &qword_2542CA000);
      LODWORD(v34) = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v35 + 48))(v5, 1, v34);
      swift_bridgeObjectRetain();
      if ((_DWORD)v34 == 1)
      {
        sub_2381B6880((uint64_t)v5, &qword_2542CA000);
        v20 = 0;
      }
      else
      {
        XPCObject.obj.getter();
        v20 = v36;
        sub_2381B63FC((uint64_t)v5);
      }
      v21 = sub_2381C0754();
      swift_bridgeObjectRelease();
      xpc_dictionary_set_value(empty, (const char *)(v21 + 32), v20);
      swift_unknownObjectRelease();
      sub_2381B6880((uint64_t)v7, &qword_2542CA000);
      swift_release();
      v15 = v39;
      sub_2381B6880((uint64_t)v39, &qword_2542C9E58);
      sub_2381B63FC(v47);
      v18 += v40;
      --v17;
    }
    while (v17);
  }
  return empty;
}

uint64_t sub_2381BA6C8()
{
  return swift_deallocObject();
}

uint64_t sub_2381BA6D8()
{
  uint64_t v0;
  _QWORD **v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v7;
  unint64_t v8;
  _QWORD *v9;

  v1 = *(_QWORD ***)(v0 + 16);
  v2 = sub_2381C0778();
  v4 = v3;
  v5 = *v1;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *v1 = v5;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    v5 = sub_2381B5A78(0, v5[2] + 1, 1, v5);
    *v1 = v5;
  }
  v8 = v5[2];
  v7 = v5[3];
  if (v8 >= v7 >> 1)
  {
    v5 = sub_2381B5A78((_QWORD *)(v7 > 1), v8 + 1, 1, v5);
    *v1 = v5;
  }
  v5[2] = v8 + 1;
  v9 = &v5[2 * v8];
  v9[4] = v2;
  v9[5] = v4;
  return 1;
}

uint64_t sub_2381BA78C()
{
  return swift_deallocObject();
}

uint64_t sub_2381BA79C()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))() & 1;
}

uint64_t *initializeBufferWithCopyOfBuffer for XPCObject(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5;
  int v6;
  uint64_t v7;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v5 = *(_QWORD *)(a3 - 8);
  v6 = *(_DWORD *)(v5 + 80);
  if ((v6 & 0x20000) != 0)
  {
    v7 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v7 + ((v6 + 16) & ~(unint64_t)v6));
    swift_retain();
  }
  else
  {
    switch(swift_getEnumCaseMultiPayload())
    {
      case 0u:
      case 1u:
      case 0xAu:
      case 0xBu:
      case 0xCu:
        *a1 = *a2;
        swift_unknownObjectRetain();
        swift_storeEnumTagMultiPayload();
        break;
      case 7u:
        v10 = *a2;
        v9 = a2[1];
        sub_2381BA384(v10, v9);
        *a1 = v10;
        a1[1] = v9;
        swift_storeEnumTagMultiPayload();
        break;
      case 8u:
        v11 = a2[1];
        *a1 = *a2;
        a1[1] = v11;
        swift_bridgeObjectRetain();
        swift_storeEnumTagMultiPayload();
        break;
      case 9u:
        v12 = sub_2381C0670();
        (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v12 - 8) + 16))(a1, a2, v12);
        swift_storeEnumTagMultiPayload();
        break;
      default:
        memcpy(a1, a2, *(_QWORD *)(v5 + 64));
        break;
    }
  }
  return a1;
}

uint64_t destroy for XPCObject(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = swift_getEnumCaseMultiPayload();
  switch((int)result)
  {
    case 0:
    case 1:
    case 10:
    case 11:
    case 12:
      result = swift_unknownObjectRelease();
      break;
    case 7:
      result = sub_2381BA340(*(_QWORD *)a1, *(_QWORD *)(a1 + 8));
      break;
    case 8:
      result = swift_bridgeObjectRelease();
      break;
    case 9:
      v3 = sub_2381C0670();
      result = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
      break;
    default:
      return result;
  }
  return result;
}

uint64_t *initializeWithCopy for XPCObject(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  switch(swift_getEnumCaseMultiPayload())
  {
    case 0u:
    case 1u:
    case 0xAu:
    case 0xBu:
    case 0xCu:
      *a1 = *a2;
      swift_unknownObjectRetain();
      goto LABEL_7;
    case 7u:
      v7 = *a2;
      v6 = a2[1];
      sub_2381BA384(v7, v6);
      *a1 = v7;
      a1[1] = v6;
      goto LABEL_7;
    case 8u:
      v8 = a2[1];
      *a1 = *a2;
      a1[1] = v8;
      swift_bridgeObjectRetain();
      goto LABEL_7;
    case 9u:
      v9 = sub_2381C0670();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v9 - 8) + 16))(a1, a2, v9);
LABEL_7:
      swift_storeEnumTagMultiPayload();
      break;
    default:
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
      break;
  }
  return a1;
}

uint64_t *assignWithCopy for XPCObject(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if (a1 != a2)
  {
    sub_2381B63FC((uint64_t)a1);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 0u:
      case 1u:
      case 0xAu:
      case 0xBu:
      case 0xCu:
        *a1 = *a2;
        swift_unknownObjectRetain();
        goto LABEL_8;
      case 7u:
        v7 = *a2;
        v6 = a2[1];
        sub_2381BA384(v7, v6);
        *a1 = v7;
        a1[1] = v6;
        goto LABEL_8;
      case 8u:
        *a1 = *a2;
        a1[1] = a2[1];
        swift_bridgeObjectRetain();
        goto LABEL_8;
      case 9u:
        v8 = sub_2381C0670();
        (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(a1, a2, v8);
LABEL_8:
        swift_storeEnumTagMultiPayload();
        break;
      default:
        memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
        break;
    }
  }
  return a1;
}

void *initializeWithTake for XPCObject(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6;

  if (swift_getEnumCaseMultiPayload() == 9)
  {
    v6 = sub_2381C0670();
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  return a1;
}

void *assignWithTake for XPCObject(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6;

  if (a1 != a2)
  {
    sub_2381B63FC((uint64_t)a1);
    if (swift_getEnumCaseMultiPayload() == 9)
    {
      v6 = sub_2381C0670();
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

uint64_t sub_2381BAE38()
{
  uint64_t result;
  unint64_t v1;

  result = sub_2381C0670();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for XPCDictionary()
{
  return &type metadata for XPCDictionary;
}

uint64_t sub_2381BAEF0(uint64_t a1)
{
  uint64_t result;

  result = swift_allocObject();
  *(_QWORD *)(result + 16) = a1;
  return result;
}

uint64_t sub_2381BAF20()
{
  swift_unknownObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t sub_2381BAF44()
{
  uint64_t v0;

  v0 = sub_2381C06C4();
  __swift_allocate_value_buffer(v0, qword_2542CABB8);
  __swift_project_value_buffer(v0, (uint64_t)qword_2542CABB8);
  return sub_2381C06B8();
}

uint64_t variable initialization expression of XPCActivity.currentTask()
{
  return 0;
}

uint64_t sub_2381BAFC0()
{
  swift_beginAccess();
  return swift_retain();
}

uint64_t sub_2381BAFF4(uint64_t a1)
{
  uint64_t v1;

  swift_beginAccess();
  *(_QWORD *)(v1 + 128) = a1;
  return swift_release();
}

uint64_t (*sub_2381BB038())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t variable initialization expression of XPCActivity.disabled()
{
  return 0;
}

uint64_t sub_2381BB07C()
{
  uint64_t v0;

  swift_beginAccess();
  return *(unsigned __int8 *)(v0 + 136);
}

uint64_t sub_2381BB0AC(char a1)
{
  uint64_t v1;
  uint64_t result;

  result = swift_beginAccess();
  *(_BYTE *)(v1 + 136) = a1;
  return result;
}

uint64_t (*sub_2381BB0E8())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t *XPCActivity.makeHandler.unsafeMutableAddressor()
{
  return &static XPCActivity.makeHandler;
}

uint64_t static XPCActivity.makeHandler.getter()
{
  uint64_t v0;

  swift_beginAccess();
  v0 = static XPCActivity.makeHandler;
  sub_2381BB184(static XPCActivity.makeHandler);
  return v0;
}

uint64_t sub_2381BB184(uint64_t result)
{
  if (result)
    return swift_retain();
  return result;
}

uint64_t static XPCActivity.makeHandler.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  swift_beginAccess();
  v4 = static XPCActivity.makeHandler;
  static XPCActivity.makeHandler = a1;
  qword_2542CAC88 = a2;
  sub_2381BB184(a1);
  sub_2381B6A7C(v4);
  return sub_2381B6A7C(a1);
}

uint64_t (*static XPCActivity.makeHandler.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

Swift::Void __swiftcall XPCActivity.register(disabled:)(Swift::Bool_optional disabled)
{
  _QWORD *v1;
  _QWORD *v2;
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  uint64_t v13;
  uint64_t v14;
  os_log_type_t v15;
  uint8_t *v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  NSObject *oslog;
  uint64_t aBlock;
  unint64_t v22;
  uint64_t (*v23)(uint64_t);
  void *v24;
  uint64_t (*v25)();
  _QWORD *v26;
  uint64_t v27;

  v2 = v1;
  v4 = objc_msgSend((id)objc_opt_self(), sel_mainBundle);
  v5 = objc_msgSend(v4, sel_bundleIdentifier);

  if (v5)
  {
    sub_2381C073C();

    if (disabled.value != 2)
      (*(void (**)(Swift::Bool))(*v2 + 144))(disabled.value);
    sub_2381C08BC();
    swift_bridgeObjectRelease();
    aBlock = 0x6C655464756F6C43;
    v22 = 0xEF2E797274656D65;
    sub_2381C076C();
    swift_bridgeObjectRelease();
    sub_2381C076C();
    (*(void (**)(void))(v2[15] + 32))();
    sub_2381C076C();
    swift_bridgeObjectRelease();
    v6 = (void *)*MEMORY[0x24BDAC5A0];
    v25 = sub_2381BC9A8;
    v26 = v2;
    aBlock = MEMORY[0x24BDAC760];
    v22 = 1107296256;
    v23 = sub_2381BB70C;
    v24 = &block_descriptor_0;
    v7 = _Block_copy(&aBlock);
    swift_retain();
    swift_release();
    v8 = sub_2381C0754();
    xpc_activity_register((const char *)(v8 + 32), v6, v7);
    swift_release();
    _Block_release(v7);
    if (qword_2542CA870 != -1)
      swift_once();
    v9 = sub_2381C06C4();
    __swift_project_value_buffer(v9, (uint64_t)qword_2542CABB8);
    swift_bridgeObjectRetain();
    v10 = sub_2381C06AC();
    v11 = sub_2381C0838();
    if (os_log_type_enabled(v10, v11))
    {
      v12 = (uint8_t *)swift_slowAlloc();
      v13 = swift_slowAlloc();
      aBlock = v13;
      *(_DWORD *)v12 = 136315138;
      swift_bridgeObjectRetain();
      v27 = sub_2381B5B84(0x6C655464756F6C43, 0xEF2E797274656D65, &aBlock);
      sub_2381C0898();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_2381AB000, v10, v11, "registered: %s", v12, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x23B82E590](v13, -1, -1);
      MEMORY[0x23B82E590](v12, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }

  }
  else
  {
    if (qword_2542CA870 != -1)
      swift_once();
    v14 = sub_2381C06C4();
    __swift_project_value_buffer(v14, (uint64_t)qword_2542CABB8);
    swift_retain_n();
    oslog = sub_2381C06AC();
    v15 = sub_2381C0838();
    if (os_log_type_enabled(oslog, v15))
    {
      v16 = (uint8_t *)swift_slowAlloc();
      v17 = swift_slowAlloc();
      *(_DWORD *)v16 = 136315138;
      aBlock = v17;
      v18 = (*(uint64_t (**)(void))(v2[15] + 32))();
      v27 = sub_2381B5B84(v18, v19, &aBlock);
      sub_2381C0898();
      swift_bridgeObjectRelease();
      swift_release_n();
      _os_log_impl(&dword_2381AB000, oslog, v15, "unable to register: %s, nil bundleIdentifier", v16, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x23B82E590](v17, -1, -1);
      MEMORY[0x23B82E590](v16, -1, -1);

    }
    else
    {
      swift_release_n();

    }
  }
}

uint64_t sub_2381BB70C(uint64_t a1)
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

uint64_t sub_2381BB754()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  uint64_t v17;
  uint64_t result;
  int64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  int64_t v29;
  unint64_t v30;
  int64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  int64_t v35;
  uint64_t v36;
  int64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  xpc_object_t v41;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542CA000);
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)&v34 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for XPCObject();
  v5 = *(_QWORD *)(v4 - 8);
  v39 = v4;
  v40 = v5;
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v34 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542CA010);
  v9 = MEMORY[0x24BDAC7A8](v8);
  v11 = (uint64_t *)((char *)&v34 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v34 - v12;
  v14 = *(_QWORD *)(v0 + 112);
  v15 = *(_QWORD *)(v0 + 120);
  v16 = *(uint64_t (**)(uint64_t, uint64_t))(v15 + 24);
  v17 = *(_QWORD *)(v16(v14, v15) + 16);
  swift_bridgeObjectRelease();
  if (!v17)
    return 0;
  v41 = XPCDictionary.init()();
  result = v16(v14, v15);
  v19 = 0;
  v20 = *(_QWORD *)(result + 64);
  v36 = result + 64;
  v21 = 1 << *(_BYTE *)(result + 32);
  v22 = -1;
  if (v21 < 64)
    v22 = ~(-1 << v21);
  v23 = v22 & v20;
  v37 = (unint64_t)(v21 + 63) >> 6;
  v38 = result;
  v35 = v37 - 1;
  if ((v22 & v20) == 0)
    goto LABEL_9;
LABEL_7:
  v24 = __clz(__rbit64(v23));
  v23 &= v23 - 1;
  v25 = v24 | (v19 << 6);
  while (2)
  {
    v26 = *(_QWORD *)(v38 + 56);
    *v11 = *(_QWORD *)(*(_QWORD *)(v38 + 48) + 8 * v25);
    v27 = v26 + *(_QWORD *)(v40 + 72) * v25;
    v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542CA008);
    sub_2381BA2FC(v27, (uint64_t)v11 + *(int *)(v28 + 48));
    (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v28 - 8) + 56))(v11, 0, 1, v28);
    while (1)
    {
      sub_2381BCDB8((uint64_t)v11, (uint64_t)v13);
      v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542CA008);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v33 - 8) + 48))(v13, 1, v33) == 1)
      {
        swift_release();
        return (uint64_t)v41;
      }
      sub_2381B9008((uint64_t)&v13[*(int *)(v33 + 48)], (uint64_t)v7);
      sub_2381C0778();
      sub_2381BA2FC((uint64_t)v7, (uint64_t)v3);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v40 + 56))(v3, 0, 1, v39);
      XPCDictionary.subscript.setter((uint64_t)v3);
      result = sub_2381B63FC((uint64_t)v7);
      if (v23)
        goto LABEL_7;
LABEL_9:
      v29 = v19 + 1;
      if (__OFADD__(v19, 1))
      {
        __break(1u);
        goto LABEL_31;
      }
      if (v29 < v37)
      {
        v30 = *(_QWORD *)(v36 + 8 * v29);
        if (v30)
          goto LABEL_12;
        v31 = v19 + 2;
        ++v19;
        if (v29 + 1 < v37)
        {
          v30 = *(_QWORD *)(v36 + 8 * v31);
          if (v30)
            goto LABEL_15;
          v19 = v29 + 1;
          if (v29 + 2 < v37)
          {
            v30 = *(_QWORD *)(v36 + 8 * (v29 + 2));
            if (v30)
            {
              v29 += 2;
              goto LABEL_12;
            }
            v31 = v29 + 3;
            v19 = v29 + 2;
            if (v29 + 3 < v37)
              break;
          }
        }
      }
LABEL_26:
      v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542CA008);
      (*(void (**)(_QWORD *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v32 - 8) + 56))(v11, 1, 1, v32);
      v23 = 0;
    }
    v30 = *(_QWORD *)(v36 + 8 * v31);
    if (v30)
    {
LABEL_15:
      v29 = v31;
LABEL_12:
      v23 = (v30 - 1) & v30;
      v25 = __clz(__rbit64(v30)) + (v29 << 6);
      v19 = v29;
      continue;
    }
    break;
  }
  while (1)
  {
    v29 = v31 + 1;
    if (__OFADD__(v31, 1))
      break;
    if (v29 >= v37)
    {
      v19 = v35;
      goto LABEL_26;
    }
    v30 = *(_QWORD *)(v36 + 8 * v29);
    ++v31;
    if (v30)
      goto LABEL_12;
  }
LABEL_31:
  __break(1u);
  return result;
}

void sub_2381BBB10(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  _xpc_activity_s *v8;
  xpc_activity_state_t state;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  NSObject *v18;
  os_log_type_t v19;
  uint8_t *v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  os_log_type_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  xpc_activity_state_t v30;
  uint64_t v31;
  void *v32;
  xpc_object_t v33;
  _xpc_activity_s *v34;
  uint64_t v35;
  _QWORD *v36;
  uint64_t v37;
  NSObject *v38;
  uint64_t v39;
  uint64_t v40;

  v2 = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542CA030);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v37 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for XPCActivityHandle();
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = a1;
  v8 = (_xpc_activity_s *)swift_unknownObjectRetain();
  state = xpc_activity_get_state(v8);
  if (state == 2)
  {
    if (qword_2542CA870 != -1)
      swift_once();
    v17 = sub_2381C06C4();
    __swift_project_value_buffer(v17, (uint64_t)qword_2542CABB8);
    swift_retain_n();
    v18 = sub_2381C06AC();
    v19 = sub_2381C085C();
    if (os_log_type_enabled(v18, v19))
    {
      v20 = (uint8_t *)swift_slowAlloc();
      v21 = swift_slowAlloc();
      *(_DWORD *)v20 = 136315138;
      v40 = v21;
      v22 = (*(uint64_t (**)(void))(*(_QWORD *)(v2 + 120) + 32))();
      v39 = sub_2381B5B84(v22, v23, &v40);
      sub_2381C0898();
      swift_bridgeObjectRelease();
      swift_release_n();
      _os_log_impl(&dword_2381AB000, v18, v19, "run: %s", v20, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x23B82E590](v21, -1, -1);
      MEMORY[0x23B82E590](v20, -1, -1);
    }
    else
    {
      swift_release_n();
    }

    v34 = *(_xpc_activity_s **)(v7 + 16);
    if (xpc_activity_should_defer(v34))
    {
      xpc_activity_set_state(v34, 3);
    }
    else
    {
      xpc_activity_set_state(v34, 4);
      v35 = sub_2381C07F0();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v35 - 8) + 56))(v6, 1, 1, v35);
      v36 = (_QWORD *)swift_allocObject();
      v36[2] = 0;
      v36[3] = 0;
      v36[4] = v2;
      v36[5] = v7;
      swift_retain();
      sub_2381B4820((uint64_t)v6, (uint64_t)&unk_2568E62F0, (uint64_t)v36);
    }
  }
  else if (state)
  {
    if (qword_2542CA870 != -1)
      swift_once();
    v24 = sub_2381C06C4();
    __swift_project_value_buffer(v24, (uint64_t)qword_2542CABB8);
    swift_retain_n();
    swift_retain_n();
    v38 = sub_2381C06AC();
    v25 = sub_2381C0844();
    if (!os_log_type_enabled(v38, v25))
    {
      swift_release_n();
      swift_release_n();

      return;
    }
    v26 = swift_slowAlloc();
    v27 = swift_slowAlloc();
    v40 = v27;
    *(_DWORD *)v26 = 136315394;
    v28 = (*(uint64_t (**)(void))(*(_QWORD *)(v2 + 120) + 32))();
    v39 = sub_2381B5B84(v28, v29, &v40);
    sub_2381C0898();
    swift_bridgeObjectRelease();
    swift_release_n();
    *(_WORD *)(v26 + 12) = 2048;
    v30 = xpc_activity_get_state(*(xpc_activity_t *)(v7 + 16));
    swift_release();
    v39 = v30;
    sub_2381C0898();
    swift_release();
    _os_log_impl(&dword_2381AB000, v38, v25, "activity: %s, encountered unrecognized XPC activity state: %ld", (uint8_t *)v26, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x23B82E590](v27, -1, -1);
    MEMORY[0x23B82E590](v26, -1, -1);

  }
  else
  {
    if (qword_2542CA870 != -1)
      swift_once();
    v10 = sub_2381C06C4();
    __swift_project_value_buffer(v10, (uint64_t)qword_2542CABB8);
    swift_retain_n();
    v11 = sub_2381C06AC();
    v12 = sub_2381C0838();
    if (os_log_type_enabled(v11, v12))
    {
      v13 = (uint8_t *)swift_slowAlloc();
      v14 = swift_slowAlloc();
      *(_DWORD *)v13 = 136315138;
      v40 = v14;
      v15 = (*(uint64_t (**)(void))(*(_QWORD *)(v2 + 120) + 32))();
      v39 = sub_2381B5B84(v15, v16, &v40);
      sub_2381C0898();
      swift_bridgeObjectRelease();
      swift_release_n();
      _os_log_impl(&dword_2381AB000, v11, v12, "checkin: %s", v13, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x23B82E590](v14, -1, -1);
      MEMORY[0x23B82E590](v13, -1, -1);
    }
    else
    {
      swift_release_n();
    }

    v31 = sub_2381BB754();
    if (v31)
    {
      v32 = (void *)v31;
      v33 = xpc_activity_copy_criteria(*(xpc_activity_t *)(v7 + 16));
      swift_unknownObjectRelease();
      if (!v33)
        xpc_activity_set_criteria(*(xpc_activity_t *)(v7 + 16), v32);
      swift_unknownObjectRelease();
    }
  }
  swift_release();
}

uint64_t sub_2381BC130(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;

  *(_QWORD *)(v5 + 16) = a4;
  *(_QWORD *)(v5 + 24) = a5;
  return swift_task_switch();
}

uint64_t sub_2381BC148()
{
  uint64_t v0;

  sub_2381BC178(*(_QWORD *)(v0 + 24));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_2381BC178(uint64_t a1)
{
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  os_log_type_t v10;
  uint8_t *v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  id v21[2];
  uint64_t aBlock[6];

  v2 = v1;
  v4 = *v1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542CA030);
  v6 = MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (((*(uint64_t (**)(uint64_t))(v4 + 136))(v6) & 1) != 0)
  {
    xpc_activity_set_state(*(xpc_activity_t *)(a1 + 16), 5);
    if (qword_2542CA870 != -1)
      swift_once();
    v9 = sub_2381C06C4();
    __swift_project_value_buffer(v9, (uint64_t)qword_2542CABB8);
    swift_retain_n();
    v21[0] = (id)sub_2381C06AC();
    v10 = sub_2381C0844();
    if (os_log_type_enabled((os_log_t)v21[0], v10))
    {
      v11 = (uint8_t *)swift_slowAlloc();
      v12 = swift_slowAlloc();
      *(_DWORD *)v11 = 136315138;
      aBlock[0] = v12;
      v13 = (*(uint64_t (**)(void))(v1[15] + 32))();
      v21[1] = (id)sub_2381B5B84(v13, v14, aBlock);
      sub_2381C0898();
      swift_bridgeObjectRelease();
      swift_release_n();
      _os_log_impl(&dword_2381AB000, (os_log_t)v21[0], v10, "disabled: skipping %s", v11, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x23B82E590](v12, -1, -1);
      MEMORY[0x23B82E590](v11, -1, -1);
    }
    else
    {
      swift_release_n();
    }

  }
  else
  {
    aBlock[4] = (uint64_t)sub_2381BC9EC;
    aBlock[5] = (uint64_t)v1;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_2381BB70C;
    aBlock[3] = (uint64_t)&block_descriptor_3;
    v15 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    v16 = xpc_activity_add_eligibility_changed_handler();
    _Block_release(v15);
    v17 = sub_2381C07F0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 56))(v8, 1, 1, v17);
    v18 = sub_2381BC9F4();
    v19 = (_QWORD *)swift_allocObject();
    v19[2] = v2;
    v19[3] = v18;
    v19[4] = v16;
    v19[5] = a1;
    v19[6] = v2;
    v19[7] = v4;
    swift_retain_n();
    swift_retain();
    v20 = sub_2381B107C((uint64_t)v8, (uint64_t)&unk_2568E62C8, (uint64_t)v19);
    (*(void (**)(uint64_t))(*v2 + 120))(v20);
  }
}

uint64_t sub_2381BC490(_xpc_activity_s *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t result;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542CA030);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = xpc_activity_should_defer(a1);
  if ((_DWORD)result)
  {
    v8 = sub_2381C07F0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v6, 1, 1, v8);
    v9 = (_QWORD *)swift_allocObject();
    v9[2] = 0;
    v9[3] = 0;
    v9[4] = a2;
    swift_retain();
    sub_2381B4820((uint64_t)v6, (uint64_t)&unk_2568E62D8, (uint64_t)v9);
    return swift_release();
  }
  return result;
}

uint64_t sub_2381BC564(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  *(_QWORD *)(v4 + 16) = a4;
  return swift_task_switch();
}

uint64_t sub_2381BC57C()
{
  uint64_t v0;
  uint64_t v1;

  if ((*(uint64_t (**)(void))(**(_QWORD **)(v0 + 16) + 112))())
  {
    v1 = *(_QWORD *)(v0 + 16);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2542CA650);
    sub_2381C0808();
    (*(void (**)(_QWORD))(*(_QWORD *)v1 + 120))(0);
    swift_release();
  }
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2381BC604(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;

  v6[9] = a5;
  v6[10] = a6;
  v6[8] = a4;
  return swift_task_switch();
}

uint64_t sub_2381BC620()
{
  _QWORD *v0;
  uint64_t result;
  int *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  int *v7;

  result = swift_beginAccess();
  v2 = (int *)static XPCActivity.makeHandler;
  v0[11] = static XPCActivity.makeHandler;
  if (v2)
  {
    v3 = v0[10];
    v0[12] = qword_2542CAC88;
    v4 = *(_QWORD *)(v3 + 112);
    v5 = *(_QWORD *)(v3 + 120);
    v7 = (int *)((char *)v2 + *v2);
    swift_retain();
    v6 = (_QWORD *)swift_task_alloc();
    v0[13] = v6;
    *v6 = v0;
    v6[1] = sub_2381BC6D4;
    return ((uint64_t (*)(uint64_t, uint64_t, _QWORD))v7)(v4, v5, v0[10]);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_2381BC6D4(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;

  v3 = (_QWORD *)*v2;
  v3[5] = v2;
  v3[6] = a1;
  v3[7] = a2;
  v4 = v3[11];
  v3[14] = a1;
  swift_task_dealloc();
  sub_2381B6A7C(v4);
  return swift_task_switch();
}

uint64_t sub_2381BC750()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t ObjectType;
  _QWORD *v3;
  uint64_t (*v5)(uint64_t, uint64_t);

  sub_2381C0820();
  v1 = *(_QWORD *)(v0 + 56);
  ObjectType = swift_getObjectType();
  v5 = (uint64_t (*)(uint64_t, uint64_t))(**(int **)(v1 + 16) + *(_QWORD *)(v1 + 16));
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 120) = v3;
  *v3 = v0;
  v3[1] = sub_2381BC818;
  return v5(ObjectType, v1);
}

uint64_t sub_2381BC818()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_2381BC870()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD *)(v0 + 72);
  v2 = *(_QWORD *)(v0 + 80);
  v3 = *(_QWORD *)(v0 + 64);
  swift_unknownObjectRelease();
  sub_2381BCADC(v3, v1, v2);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t XPCActivity.__allocating_init(handlerType:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = swift_allocObject();
  swift_defaultActor_initialize();
  *(_QWORD *)(v4 + 120) = a2;
  *(_QWORD *)(v4 + 128) = 0;
  *(_BYTE *)(v4 + 136) = 0;
  *(_QWORD *)(v4 + 112) = a1;
  return v4;
}

uint64_t XPCActivity.init(handlerType:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  swift_defaultActor_initialize();
  *(_QWORD *)(v2 + 120) = a2;
  *(_QWORD *)(v2 + 128) = 0;
  *(_BYTE *)(v2 + 136) = 0;
  *(_QWORD *)(v2 + 112) = a1;
  return v2;
}

uint64_t XPCActivity.deinit()
{
  uint64_t v0;

  swift_release();
  swift_defaultActor_destroy();
  return v0;
}

uint64_t XPCActivity.__deallocating_deinit()
{
  swift_release();
  swift_defaultActor_destroy();
  return swift_defaultActor_deallocate();
}

uint64_t XPCActivity.unownedExecutor.getter()
{
  uint64_t v0;

  return v0;
}

uint64_t type metadata accessor for XPCActivityHandle()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for XPCActivity()
{
  return objc_opt_self();
}

uint64_t sub_2381BC9EC(_xpc_activity_s *a1)
{
  uint64_t v1;

  return sub_2381BC490(a1, v1);
}

unint64_t sub_2381BC9F4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2542C9F70;
  if (!qword_2542C9F70)
  {
    v1 = type metadata accessor for XPCActivity();
    result = MEMORY[0x23B82E4F4](&protocol conformance descriptor for XPCActivity, v1);
    atomic_store(result, (unint64_t *)&qword_2542C9F70);
  }
  return result;
}

uint64_t sub_2381BCA38()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2381BCA6C()
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
  v5[1] = sub_2381AD438;
  v5[9] = v3;
  v5[10] = v4;
  v5[8] = v2;
  return swift_task_switch();
}

void sub_2381BCADC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;

  if (a1)
    xpc_activity_remove_eligibility_changed_handler();
  xpc_activity_set_state(*(xpc_activity_t *)(a2 + 16), 5);
  if (qword_2542CA870 != -1)
    swift_once();
  v5 = sub_2381C06C4();
  __swift_project_value_buffer(v5, (uint64_t)qword_2542CABB8);
  swift_retain_n();
  v6 = sub_2381C06AC();
  v7 = sub_2381C085C();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc();
    v9 = swift_slowAlloc();
    *(_DWORD *)v8 = 136315138;
    v12 = v9;
    v10 = (*(uint64_t (**)(void))(*(_QWORD *)(a3 + 120) + 32))();
    sub_2381B5B84(v10, v11, &v12);
    sub_2381C0898();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2381AB000, v6, v7, "done: %s", v8, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B82E590](v9, -1, -1);
    MEMORY[0x23B82E590](v8, -1, -1);

  }
  else
  {

    swift_release_n();
  }
}

uint64_t sub_2381BCC98()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2381BCCC4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  v2 = *(_QWORD *)(v0 + 32);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_2381B86B0;
  v3[2] = v2;
  return swift_task_switch();
}

uint64_t sub_2381BCD24()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2381BCD58()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  __int128 v3;

  v2 = swift_task_alloc();
  v3 = *(_OWORD *)(v0 + 32);
  *(_QWORD *)(v1 + 16) = v2;
  *(_QWORD *)v2 = v1;
  *(_QWORD *)(v2 + 8) = sub_2381AD438;
  *(_OWORD *)(v2 + 16) = v3;
  return swift_task_switch();
}

uint64_t sub_2381BCDB8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542CA010);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

const char *MessageKeys.eventType.unsafeMutableAddressor()
{
  return "et";
}

uint64_t static MessageKeys.eventType.getter()
{
  return 29797;
}

void *MessageKeys.clientType.unsafeMutableAddressor()
{
  return &static MessageKeys.clientType;
}

uint64_t static MessageKeys.clientType.getter()
{
  return 29795;
}

void *MessageKeys.legacyClient.unsafeMutableAddressor()
{
  return &static MessageKeys.legacyClient;
}

uint64_t static MessageKeys.legacyClient.getter()
{
  return 31084;
}

void *MessageKeys.payload.unsafeMutableAddressor()
{
  return &static MessageKeys.payload;
}

uint64_t static MessageKeys.payload.getter()
{
  return 27760;
}

void *MessageKeys.sessionID.unsafeMutableAddressor()
{
  return &static MessageKeys.sessionID;
}

uint64_t static MessageKeys.sessionID.getter()
{
  return 25705;
}

const char *MessageKeys.hierarchyLevel.unsafeMutableAddressor()
{
  return "hlvl";
}

uint64_t static MessageKeys.hierarchyLevel.getter()
{
  return 1819700328;
}

const char *MessageKeys.hierarchyToken.unsafeMutableAddressor()
{
  return "hktn";
}

uint64_t static MessageKeys.hierarchyToken.getter()
{
  return 1853123432;
}

const char *MessageKeys.samplingUUID.unsafeMutableAddressor()
{
  return "suuid";
}

uint64_t static MessageKeys.samplingUUID.getter()
{
  return 0x6469757573;
}

void *MessageKeys.transportConfiguration.unsafeMutableAddressor()
{
  return &static MessageKeys.transportConfiguration;
}

uint64_t static MessageKeys.transportConfiguration.getter()
{
  return 25460;
}

const char *MessageKeys.allowed.unsafeMutableAddressor()
{
  return "allowed";
}

uint64_t static MessageKeys.allowed.getter()
{
  return 0x6465776F6C6C61;
}

const char *MessageKeys.denied.unsafeMutableAddressor()
{
  return "denied";
}

uint64_t static MessageKeys.denied.getter()
{
  return 0x6465696E6564;
}

const char *MessageKeys.overrideSampling.unsafeMutableAddressor()
{
  return "orsf";
}

uint64_t static MessageKeys.overrideSampling.getter()
{
  return 1718841967;
}

void *MessageKeys.sendOneMessageSessionInfo.unsafeMutableAddressor()
{
  return &static MessageKeys.sendOneMessageSessionInfo;
}

uint64_t static MessageKeys.sendOneMessageSessionInfo.getter()
{
  return 7549299;
}

void *MessageKeys.sendOneMessageEvent.unsafeMutableAddressor()
{
  return &static MessageKeys.sendOneMessageEvent;
}

uint64_t static MessageKeys.sendOneMessageEvent.getter()
{
  return 6631795;
}

void *MessageKeys.tcAllowsCellularAccess.unsafeMutableAddressor()
{
  return &static MessageKeys.tcAllowsCellularAccess;
}

uint64_t static MessageKeys.tcAllowsCellularAccess.getter()
{
  return 97;
}

void *MessageKeys.tcAllowsExpensiveAccess.unsafeMutableAddressor()
{
  return &static MessageKeys.tcAllowsExpensiveAccess;
}

uint64_t static MessageKeys.tcAllowsExpensiveAccess.getter()
{
  return 101;
}

void *MessageKeys.tcBundleID.unsafeMutableAddressor()
{
  return &static MessageKeys.tcBundleID;
}

uint64_t static MessageKeys.tcBundleID.getter()
{
  return 98;
}

ValueMetadata *type metadata accessor for MessageKeys()
{
  return &type metadata for MessageKeys;
}

uint64_t XPCError.description.getter(void *a1)
{
  if (xpc_dictionary_get_string(a1, "XPCErrorDescription"))
    return sub_2381C0778();
  else
    return 0x64696C61766E693CLL;
}

uint64_t XPCError.errorDescription.getter(void *a1)
{
  if (xpc_dictionary_get_string(a1, "XPCErrorDescription"))
    return sub_2381C0778();
  else
    return 0x64696C61766E693CLL;
}

uint64_t sub_2381BD06C()
{
  void **v0;

  return XPCError.errorDescription.getter(*v0);
}

uint64_t sub_2381BD074()
{
  void **v0;

  return XPCError.description.getter(*v0);
}

uint64_t XPCIncomingConnection.auditToken.getter()
{
  xpc_connection_get_audit_token();
  return 0;
}

_BYTE *XPCIncomingConnection.entitlementValue(forKey:)@<X0>(uint64_t a1@<X8>)
{
  void *v2;

  sub_2381C0754();
  v2 = (void *)xpc_connection_copy_entitlement_value();
  swift_release();
  return XPCObject.init(_:)(v2, a1);
}

_QWORD *XPCIncomingConnection.makeConnection(targetQ:delegate:)(void *a1, uint64_t a2, uint64_t a3, _xpc_connection_s *a4)
{
  id v8;
  _QWORD *v9;

  type metadata accessor for XPCConnection();
  swift_allocObject();
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  v8 = a1;
  v9 = sub_2381BE8C0(a4, v8, a2, a3);
  swift_unknownObjectRelease();

  swift_unknownObjectRelease();
  return v9;
}

_QWORD *XPCConnection.__allocating_init(conn:targetQ:delegate:)(_xpc_connection_s *a1, void *a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v8;

  swift_allocObject();
  v8 = sub_2381BE8C0(a1, a2, a3, a4);
  swift_unknownObjectRelease();

  swift_unknownObjectRelease();
  return v8;
}

uint64_t type metadata accessor for XPCConnection()
{
  return objc_opt_self();
}

uint64_t variable initialization expression of XPCConnection.conn()
{
  return 0;
}

uint64_t XPCConnection.conn.getter()
{
  swift_beginAccess();
  return swift_unknownObjectRetain();
}

uint64_t XPCConnection.conn.setter(uint64_t a1)
{
  uint64_t v1;

  swift_beginAccess();
  *(_QWORD *)(v1 + 16) = a1;
  return swift_unknownObjectRelease();
}

uint64_t (*XPCConnection.conn.modify())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t variable initialization expression of XPCConnection.delegate()
{
  return 0;
}

uint64_t XPCConnection.delegate.getter()
{
  uint64_t v0;

  swift_beginAccess();
  return MEMORY[0x23B82E62C](v0 + 24);
}

uint64_t XPCConnection.delegate.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  swift_beginAccess();
  *(_QWORD *)(v2 + 32) = a2;
  swift_unknownObjectWeakAssign();
  return swift_unknownObjectRelease();
}

void (*XPCConnection.delegate.modify(_QWORD *a1))(uint64_t a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;

  v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[5] = v1;
  swift_beginAccess();
  v4 = MEMORY[0x23B82E62C](v1 + 24);
  v5 = *(_QWORD *)(v1 + 32);
  v3[3] = v4;
  v3[4] = v5;
  return sub_2381BD43C;
}

void sub_2381BD43C(uint64_t a1, char a2)
{
  void *v3;

  v3 = *(void **)a1;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)a1 + 40) + 32) = *(_QWORD *)(*(_QWORD *)a1 + 32);
  swift_unknownObjectWeakAssign();
  if ((a2 & 1) != 0)
  {
    swift_unknownObjectRelease();
    swift_endAccess();
  }
  else
  {
    swift_endAccess();
    swift_unknownObjectRelease();
  }
  free(v3);
}

id XPCConnection.targetQ.getter()
{
  uint64_t v0;

  return *(id *)(v0 + 40);
}

uint64_t sub_2381BD4B4()
{
  uint64_t v0;

  v0 = sub_2381C06C4();
  __swift_allocate_value_buffer(v0, qword_2542CA848);
  __swift_project_value_buffer(v0, (uint64_t)qword_2542CA848);
  return sub_2381C06B8();
}

uint64_t XPCConnection.__allocating_init(targetQ:delegate:)(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = swift_allocObject();
  XPCConnection.init(targetQ:delegate:)(a1, a2, a3);
  return v6;
}

_QWORD *XPCConnection.init(targetQ:delegate:)(NSObject *a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  _QWORD *v4;
  _xpc_connection_s *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  void *v14;
  _QWORD v16[6];

  v4 = v3;
  v4[2] = 0;
  v4[4] = 0;
  swift_unknownObjectWeakInit();
  v7 = xpc_connection_create(0, a1);
  swift_beginAccess();
  v4[4] = a3;
  swift_unknownObjectWeakAssign();
  swift_beginAccess();
  v4[2] = v7;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  v4[5] = a1;
  v8 = qword_2542CA860;
  v9 = a1;
  if (v8 != -1)
    swift_once();
  v10 = sub_2381C06C4();
  __swift_project_value_buffer(v10, (uint64_t)qword_2542CA848);
  v11 = sub_2381C06AC();
  v12 = sub_2381C085C();
  if (os_log_type_enabled(v11, v12))
  {
    v13 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v13 = 0;
    _os_log_impl(&dword_2381AB000, v11, v12, "A.", v13, 2u);
    MEMORY[0x23B82E590](v13, -1, -1);
  }

  xpc_connection_set_target_queue(v7, v9);
  v16[4] = sub_2381BEAB4;
  v16[5] = v4;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 1107296256;
  v16[2] = sub_2381BB70C;
  v16[3] = &block_descriptor_1;
  v14 = _Block_copy(v16);
  swift_retain();
  swift_release();
  xpc_connection_set_event_handler(v7, v14);
  _Block_release(v14);
  xpc_connection_activate(v7);
  swift_unknownObjectRelease();

  swift_unknownObjectRelease();
  return v4;
}

uint64_t XPCConnection.eventHandler(obj:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t ObjectType;
  uint64_t v8;

  swift_beginAccess();
  result = MEMORY[0x23B82E62C](v1 + 24);
  if (result)
  {
    v4 = *(_QWORD *)(v1 + 32);
    v5 = MEMORY[0x23B82E800](a1);
    v6 = XPCTypeError.getter();
    ObjectType = swift_getObjectType();
    v8 = 16;
    if (v5 == v6)
      v8 = 8;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + v8))(a1, ObjectType, v4);
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t XPCConnection.__allocating_init(machService:targetQ:listen:delegate:)(uint64_t a1, uint64_t a2, void *a3, char a4, uint64_t a5, _xpc_connection_s *a6)
{
  uint64_t v12;

  v12 = swift_allocObject();
  XPCConnection.init(machService:targetQ:listen:delegate:)(a1, a2, a3, a4, a5, a6);
  return v12;
}

uint64_t XPCConnection.init(machService:targetQ:listen:delegate:)(uint64_t a1, uint64_t a2, void *a3, char a4, uint64_t a5, _xpc_connection_s *a6)
{
  uint64_t v6;
  uint64_t v7;
  _xpc_connection_s **v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  _xpc_connection_s *mach_service;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  NSObject *v19;
  os_log_type_t v20;
  uint8_t *v21;
  void *v22;
  _QWORD v24[6];

  v7 = v6;
  *(_QWORD *)(v6 + 16) = 0;
  v11 = (_xpc_connection_s **)(v6 + 16);
  v11[2] = 0;
  swift_unknownObjectWeakInit();
  if ((a4 & 1) != 0)
    v12 = 1;
  else
    v12 = 2;
  v13 = sub_2381C0754();
  v14 = a3;
  swift_bridgeObjectRelease();
  mach_service = xpc_connection_create_mach_service((const char *)(v13 + 32), v14, v12);

  swift_release();
  swift_beginAccess();
  v11[2] = a6;
  swift_unknownObjectWeakAssign();
  swift_beginAccess();
  *v11 = mach_service;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  v11[3] = (_xpc_connection_s *)v14;
  v16 = qword_2542CA860;
  v17 = v14;
  if (v16 != -1)
    swift_once();
  v18 = sub_2381C06C4();
  __swift_project_value_buffer(v18, (uint64_t)qword_2542CA848);
  v19 = sub_2381C06AC();
  v20 = sub_2381C085C();
  if (os_log_type_enabled(v19, v20))
  {
    v21 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v21 = 0;
    _os_log_impl(&dword_2381AB000, v19, v20, "B.", v21, 2u);
    MEMORY[0x23B82E590](v21, -1, -1);
  }

  xpc_connection_set_target_queue(mach_service, v17);
  v24[4] = sub_2381BEAB4;
  v24[5] = v7;
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 1107296256;
  v24[2] = sub_2381BB70C;
  v24[3] = &block_descriptor_3_0;
  v22 = _Block_copy(v24);
  swift_retain();
  swift_release();
  xpc_connection_set_event_handler(mach_service, v22);
  _Block_release(v22);
  xpc_connection_activate(mach_service);
  swift_unknownObjectRelease();

  swift_unknownObjectRelease();
  return v7;
}

uint64_t XPCConnection.__allocating_init(serviceName:targetQ:listen:delegate:)(uint64_t a1, uint64_t a2, void *a3, char a4, uint64_t a5, uint64_t a6)
{
  uint64_t v12;

  v12 = swift_allocObject();
  XPCConnection.init(serviceName:targetQ:listen:delegate:)(a1, a2, a3, a4, a5, a6);
  return v12;
}

void XPCConnection.init(serviceName:targetQ:listen:delegate:)(uint64_t a1, uint64_t a2, void *a3, char a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;
  _QWORD *v7;
  xpc_connection_t *v11;
  uint64_t v12;
  NSObject *v13;
  xpc_connection_t v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  NSObject *v18;
  os_log_type_t v19;
  uint8_t *v20;
  _xpc_connection_s *v21;
  void *v22;
  _xpc_connection_s *v23;
  _QWORD v24[6];

  v7 = v6;
  v7[2] = 0;
  v11 = (xpc_connection_t *)(v7 + 2);
  v7[4] = 0;
  swift_unknownObjectWeakInit();
  if ((a4 & 1) != 0)
  {
    swift_bridgeObjectRelease();
    swift_beginAccess();
    v7[4] = a6;
    swift_unknownObjectWeakAssign();
    swift_unknownObjectRelease();
    swift_beginAccess();
    v7[2] = 0;
    swift_unknownObjectRelease();
    v7[5] = a3;
    return;
  }
  v12 = sub_2381C0754();
  v13 = a3;
  swift_bridgeObjectRelease();
  v14 = xpc_connection_create((const char *)(v12 + 32), v13);

  swift_release();
  swift_beginAccess();
  v7[4] = a6;
  swift_unknownObjectWeakAssign();
  swift_beginAccess();
  v7[2] = v14;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  v7[5] = v13;
  v15 = qword_2542CA860;
  v16 = v13;
  if (v15 != -1)
    swift_once();
  v17 = sub_2381C06C4();
  __swift_project_value_buffer(v17, (uint64_t)qword_2542CA848);
  v18 = sub_2381C06AC();
  v19 = sub_2381C085C();
  if (os_log_type_enabled(v18, v19))
  {
    v20 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v20 = 0;
    _os_log_impl(&dword_2381AB000, v18, v19, "C.", v20, 2u);
    MEMORY[0x23B82E590](v20, -1, -1);
  }

  if (!*v11)
  {
    __break(1u);
    goto LABEL_12;
  }
  xpc_connection_set_target_queue(*v11, v16);
  v21 = *v11;
  if (!*v11)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  v24[4] = sub_2381BEAB4;
  v24[5] = v7;
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 1107296256;
  v24[2] = sub_2381BB70C;
  v24[3] = &block_descriptor_6;
  v22 = _Block_copy(v24);
  swift_retain();
  swift_unknownObjectRetain();
  swift_release();
  xpc_connection_set_event_handler(v21, v22);
  _Block_release(v22);
  swift_unknownObjectRelease();
  if (v7[2])
  {
    v23 = (_xpc_connection_s *)swift_unknownObjectRetain();
    xpc_connection_activate(v23);
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();

    swift_unknownObjectRelease();
    return;
  }
LABEL_13:
  __break(1u);
}

_QWORD *XPCConnection.init(conn:targetQ:delegate:)(_xpc_connection_s *a1, void *a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v5;

  v5 = sub_2381BE8C0(a1, a2, a3, a4);
  swift_unknownObjectRelease();

  swift_unknownObjectRelease();
  return v5;
}

uint64_t XPCConnection.__allocating_init(listener:targetQ:delegate:)(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;

  v8 = swift_allocObject();
  XPCConnection.init(listener:targetQ:delegate:)(a1, a2, a3, a4);
  return v8;
}

_xpc_connection_s *XPCConnection.init(listener:targetQ:delegate:)(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  _QWORD *v5;
  _xpc_connection_s *result;
  _xpc_endpoint_s *v10;
  _xpc_connection_s *v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  void *v18;
  _QWORD aBlock[6];

  v5 = v4;
  v5[2] = 0;
  v5[4] = 0;
  swift_unknownObjectWeakInit();
  swift_beginAccess();
  result = *(_xpc_connection_s **)(a1 + 16);
  if (result)
  {
    v10 = xpc_endpoint_create(result);
    v11 = xpc_connection_create_from_endpoint(v10);
    swift_beginAccess();
    v5[2] = v11;
    swift_unknownObjectRetain();
    swift_unknownObjectRelease();
    swift_beginAccess();
    v5[4] = a4;
    swift_unknownObjectWeakAssign();
    v5[5] = a2;
    v12 = qword_2542CA860;
    v13 = a2;
    if (v12 != -1)
      swift_once();
    v14 = sub_2381C06C4();
    __swift_project_value_buffer(v14, (uint64_t)qword_2542CA848);
    v15 = sub_2381C06AC();
    v16 = sub_2381C085C();
    if (os_log_type_enabled(v15, v16))
    {
      v17 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v17 = 0;
      _os_log_impl(&dword_2381AB000, v15, v16, "E.", v17, 2u);
      MEMORY[0x23B82E590](v17, -1, -1);
    }

    xpc_connection_set_target_queue(v11, v13);
    aBlock[4] = sub_2381BEAB4;
    aBlock[5] = v5;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_2381BB70C;
    aBlock[3] = &block_descriptor_9;
    v18 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    xpc_connection_set_event_handler(v11, v18);
    _Block_release(v18);
    xpc_connection_activate(v11);
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    swift_release();

    swift_unknownObjectRelease();
    return (_xpc_connection_s *)v5;
  }
  else
  {
    __break(1u);
  }
  return result;
}

_xpc_connection_s *XPCConnection.endpoint()()
{
  uint64_t v0;
  _xpc_connection_s *result;

  swift_beginAccess();
  result = *(_xpc_connection_s **)(v0 + 16);
  if (result)
    return xpc_endpoint_create(result);
  __break(1u);
  return result;
}

uint64_t XPCConnection.send(_:)()
{
  uint64_t v0;
  uint64_t result;
  _xpc_connection_s *v2;
  void *v3;

  result = swift_beginAccess();
  v2 = *(_xpc_connection_s **)(v0 + 16);
  if (v2)
  {
    swift_unknownObjectRetain();
    v3 = (void *)j__swift_unknownObjectRetain();
    xpc_connection_send_message(v2, v3);
    swift_unknownObjectRelease();
    return swift_unknownObjectRelease();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t XPCConnection.sendWithReply(_:)(uint64_t a1, char a2)
{
  uint64_t v2;
  uint64_t v3;

  *(_BYTE *)(v3 + 96) = a2;
  *(_QWORD *)(v3 + 48) = a1;
  *(_QWORD *)(v3 + 56) = v2;
  return swift_task_switch();
}

uint64_t sub_2381BE26C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t result;
  uint64_t v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v1 = *(_QWORD *)(v0 + 56);
  result = swift_beginAccess();
  v3 = *(_QWORD *)(v1 + 16);
  *(_QWORD *)(v0 + 64) = v3;
  if (v3)
  {
    v4 = *(_BYTE *)(v0 + 96);
    v5 = *(_QWORD *)(v0 + 48);
    v6 = *(_QWORD *)(*(_QWORD *)(v0 + 56) + 40);
    v7 = swift_task_alloc();
    *(_QWORD *)(v0 + 72) = v7;
    *(_QWORD *)(v7 + 16) = v3;
    *(_QWORD *)(v7 + 24) = v5;
    *(_BYTE *)(v7 + 32) = v4;
    *(_QWORD *)(v7 + 40) = v6;
    swift_unknownObjectRetain();
    v8 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 80) = v8;
    *v8 = v0;
    v8[1] = sub_2381BE360;
    return sub_2381C0964();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_2381BE360()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 88) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_2381BE3CC()
{
  uint64_t v0;

  swift_unknownObjectRelease();
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(_QWORD *)(v0 + 40));
}

uint64_t sub_2381BE404()
{
  uint64_t v0;

  swift_unknownObjectRelease();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2381BE440(uint64_t a1, _xpc_connection_s *a2, uint64_t a3, NSObject *a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  unint64_t v11;
  uint64_t v12;
  void *v13;
  _QWORD aBlock[6];

  v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2542CA020);
  v8 = *(_QWORD *)(v7 - 8);
  v9 = *(_QWORD *)(v8 + 64);
  MEMORY[0x24BDAC7A8]();
  v10 = (void *)j__swift_unknownObjectRetain();
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))((char *)aBlock - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v7);
  v11 = (*(unsigned __int8 *)(v8 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  v12 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v8 + 32))(v12 + v11, (char *)aBlock - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), v7);
  aBlock[4] = sub_2381BEBB4;
  aBlock[5] = v12;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_2381BB70C;
  aBlock[3] = &block_descriptor_14;
  v13 = _Block_copy(aBlock);
  swift_release();
  xpc_connection_send_message_with_reply(a2, v10, a4, v13);
  _Block_release(v13);
  return swift_unknownObjectRelease();
}

Swift::Bool __swiftcall OS_xpc_object.isError()()
{
  uint64_t v0;

  v0 = MEMORY[0x23B82E800]();
  return v0 == XPCTypeError.getter();
}

uint64_t XPCConnection.auditToken.getter()
{
  uint64_t v0;

  swift_beginAccess();
  if (!*(_QWORD *)(v0 + 16))
    __break(1u);
  xpc_connection_get_audit_token();
  return 0;
}

_xpc_connection_s *XPCConnection.remoteUID.getter()
{
  uint64_t v0;
  _xpc_connection_s *result;

  swift_beginAccess();
  result = *(_xpc_connection_s **)(v0 + 16);
  if (result)
    return (_xpc_connection_s *)xpc_connection_get_euid(result);
  __break(1u);
  return result;
}

uint64_t XPCConnection.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  _xpc_connection_s *v6;

  v1 = v0;
  if (qword_2542CA860 != -1)
    swift_once();
  v2 = sub_2381C06C4();
  __swift_project_value_buffer(v2, (uint64_t)qword_2542CA848);
  v3 = sub_2381C06AC();
  v4 = sub_2381C0844();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_2381AB000, v3, v4, "connection released", v5, 2u);
    MEMORY[0x23B82E590](v5, -1, -1);
  }

  swift_beginAccess();
  v6 = *(_xpc_connection_s **)(v1 + 16);
  if (v6)
    xpc_connection_cancel(v6);
  swift_unknownObjectRelease();
  sub_2381BEAC4(v1 + 24);

  return v1;
}

uint64_t XPCConnection.__deallocating_deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  _xpc_connection_s *v6;

  v1 = v0;
  if (qword_2542CA860 != -1)
    swift_once();
  v2 = sub_2381C06C4();
  __swift_project_value_buffer(v2, (uint64_t)qword_2542CA848);
  v3 = sub_2381C06AC();
  v4 = sub_2381C0844();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_2381AB000, v3, v4, "connection released", v5, 2u);
    MEMORY[0x23B82E590](v5, -1, -1);
  }

  swift_beginAccess();
  v6 = *(_xpc_connection_s **)(v1 + 16);
  if (v6)
    xpc_connection_cancel(v6);
  swift_unknownObjectRelease();
  sub_2381BEAC4(v1 + 24);

  return swift_deallocClassInstance();
}

Swift::OpaquePointer __swiftcall OS_xpc_object.type()()
{
  JUMPOUT(0x23B82E800);
}

_QWORD *sub_2381BE8C0(_xpc_connection_s *a1, void *a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  void *v15;
  _QWORD v17[6];

  v5 = v4;
  v5[2] = 0;
  v5[4] = 0;
  swift_unknownObjectWeakInit();
  swift_beginAccess();
  v5[2] = a1;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  swift_beginAccess();
  v5[4] = a4;
  swift_unknownObjectWeakAssign();
  v5[5] = a2;
  v9 = qword_2542CA860;
  v10 = a2;
  if (v9 != -1)
    swift_once();
  v11 = sub_2381C06C4();
  __swift_project_value_buffer(v11, (uint64_t)qword_2542CA848);
  v12 = sub_2381C06AC();
  v13 = sub_2381C085C();
  if (os_log_type_enabled(v12, v13))
  {
    v14 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v14 = 0;
    _os_log_impl(&dword_2381AB000, v12, v13, "D.", v14, 2u);
    MEMORY[0x23B82E590](v14, -1, -1);
  }

  xpc_connection_set_target_queue(a1, v10);
  v17[4] = sub_2381BEAB4;
  v17[5] = v5;
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 1107296256;
  v17[2] = sub_2381BB70C;
  v17[3] = &block_descriptor_17;
  v15 = _Block_copy(v17);
  swift_retain();
  swift_release();
  xpc_connection_set_event_handler(a1, v15);
  _Block_release(v15);
  xpc_connection_activate(a1);
  return v5;
}

uint64_t sub_2381BEAB8(uint64_t a1)
{
  uint64_t v1;

  return sub_2381BE440(a1, *(_xpc_connection_s **)(v1 + 16), *(_QWORD *)(v1 + 24), *(NSObject **)(v1 + 40));
}

uint64_t sub_2381BEAC4(uint64_t a1)
{
  swift_unknownObjectWeakDestroy();
  return a1;
}

unint64_t sub_2381BEAEC()
{
  unint64_t result;

  result = qword_2542C9FF8;
  if (!qword_2542C9FF8)
  {
    result = MEMORY[0x23B82E4F4](&protocol conformance descriptor for XPCError, &type metadata for XPCError);
    atomic_store(result, (unint64_t *)&qword_2542C9FF8);
  }
  return result;
}

ValueMetadata *type metadata accessor for XPCError()
{
  return &type metadata for XPCError;
}

ValueMetadata *type metadata accessor for XPCIncomingConnection()
{
  return &type metadata for XPCIncomingConnection;
}

uint64_t sub_2381BEB50()
{
  uint64_t v0;
  uint64_t v1;

  v1 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2542CA020);
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)), v1);
  return swift_deallocObject();
}

uint64_t sub_2381BEBB4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v5;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2542CA020);
  v2 = MEMORY[0x23B82E800](a1);
  if (v2 == XPCTypeError.getter())
  {
    sub_2381BEAEC();
    swift_allocError();
    *v5 = a1;
    swift_unknownObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2542CA020);
    return sub_2381C07CC();
  }
  else
  {
    v3 = swift_unknownObjectRetain();
    XPCDictionary.init(_:)(v3);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2542CA020);
    return sub_2381C07D8();
  }
}

uint64_t sub_2381BEC88(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t ObjectType;
  uint64_t v8;

  swift_beginAccess();
  result = MEMORY[0x23B82E62C](v1 + 24);
  if (result)
  {
    v4 = *(_QWORD *)(v1 + 32);
    v5 = MEMORY[0x23B82E800](a1);
    v6 = XPCTypeError.getter();
    ObjectType = swift_getObjectType();
    v8 = 16;
    if (v5 == v6)
      v8 = 8;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + v8))(a1, ObjectType, v4);
    return swift_unknownObjectRelease();
  }
  return result;
}

const char *PostInstallActivityConfig.identifier.unsafeMutableAddressor()
{
  return "postinstall";
}

uint64_t static PostInstallActivityConfig.identifier.getter()
{
  return 0x74736E6974736F70;
}

uint64_t sub_2381BED88()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t result;
  _BYTE *v9;
  _QWORD *v10;
  _BYTE *v11;
  unint64_t v12;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2542CA040);
  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542CA018);
  v1 = *(_QWORD *)(v0 - 8);
  v2 = *(_QWORD *)(v1 + 72);
  v3 = (*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_2381C1FD0;
  v5 = (_QWORD *)(v4 + v3);
  v6 = (_QWORD *)((char *)v5 + *(int *)(v0 + 48));
  *v5 = *MEMORY[0x24BDAC698];
  *v6 = sub_2381C0778();
  v6[1] = v7;
  type metadata accessor for XPCObject();
  result = swift_storeEnumTagMultiPayload();
  if (*MEMORY[0x24BDAC688])
  {
    v9 = (char *)v5 + v2 + *(int *)(v0 + 48);
    *(_QWORD *)((char *)v5 + v2) = *MEMORY[0x24BDAC688];
    *v9 = 1;
    result = swift_storeEnumTagMultiPayload();
    if (*MEMORY[0x24BDAC680])
    {
      v10 = (_QWORD *)((char *)v5 + 2 * v2);
      v11 = (char *)v10 + *(int *)(v0 + 48);
      *v10 = *MEMORY[0x24BDAC680];
      *v11 = 1;
      swift_storeEnumTagMultiPayload();
      v12 = sub_2381B8E68(v4);
      swift_setDeallocating();
      swift_arrayDestroy();
      result = swift_deallocClassInstance();
      static PostInstallActivityConfig.activityFlags = v12;
      return result;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t *PostInstallActivityConfig.activityFlags.unsafeMutableAddressor()
{
  if (qword_2542CA878 != -1)
    swift_once();
  return &static PostInstallActivityConfig.activityFlags;
}

uint64_t static PostInstallActivityConfig.activityFlags.getter()
{
  if (qword_2542CA878 != -1)
    swift_once();
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

uint64_t static PostInstallActivityConfig.activityFlags.setter(uint64_t a1)
{
  if (qword_2542CA878 != -1)
    swift_once();
  swift_beginAccess();
  static PostInstallActivityConfig.activityFlags = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*static PostInstallActivityConfig.activityFlags.modify())()
{
  if (qword_2542CA878 != -1)
    swift_once();
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t sub_2381BF088()
{
  if (qword_2542CA878 != -1)
    swift_once();
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

uint64_t sub_2381BF0F4()
{
  return 0x74736E6974736F70;
}

ValueMetadata *type metadata accessor for PostInstallActivityConfig()
{
  return &type metadata for PostInstallActivityConfig;
}

const char *CacheCleanupActivityConfig.identifier.unsafeMutableAddressor()
{
  return "db-cleanup";
}

uint64_t static CacheCleanupActivityConfig.identifier.getter()
{
  return 0x6E61656C632D6264;
}

uint64_t sub_2381BF14C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  _BYTE *v6;
  _QWORD *v7;
  _QWORD *v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t *v11;
  uint64_t v12;
  _QWORD *v13;
  _BYTE *v14;
  uint64_t result;
  _QWORD *v16;
  _BYTE *v17;
  _QWORD *v18;
  _QWORD *v19;
  _QWORD *v20;
  _QWORD *v21;
  _QWORD *v22;
  _QWORD *v23;
  _QWORD *v24;
  _QWORD *v25;
  _QWORD *v26;
  _BYTE *v27;
  unint64_t v28;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2542CA040);
  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542CA018);
  v1 = *(_QWORD *)(v0 - 8);
  v2 = *(_QWORD *)(v1 + 72);
  v3 = (*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_2381C2020;
  v5 = (_QWORD *)(v4 + v3);
  v6 = (char *)v5 + *(int *)(v0 + 48);
  *v5 = *MEMORY[0x24BDAC6B8];
  *v6 = 1;
  type metadata accessor for XPCObject();
  swift_storeEnumTagMultiPayload();
  v7 = (_QWORD *)((char *)v5 + v2 + *(int *)(v0 + 48));
  *(_QWORD *)((char *)v5 + v2) = *MEMORY[0x24BDAC5B8];
  *v7 = 86400;
  swift_storeEnumTagMultiPayload();
  v8 = (_QWORD *)((char *)v5 + 2 * v2);
  v9 = (_QWORD *)((char *)v8 + *(int *)(v0 + 48));
  *v8 = *MEMORY[0x24BDAC5D8];
  *v9 = 43200;
  swift_storeEnumTagMultiPayload();
  v10 = (_QWORD *)((char *)v5 + 3 * v2);
  v11 = (_QWORD *)((char *)v10 + *(int *)(v0 + 48));
  *v10 = *MEMORY[0x24BDAC698];
  *v11 = sub_2381C0778();
  v11[1] = v12;
  swift_storeEnumTagMultiPayload();
  v13 = (_QWORD *)((char *)v5 + 4 * v2);
  v14 = (char *)v13 + *(int *)(v0 + 48);
  *v13 = *MEMORY[0x24BDAC598];
  *v14 = 0;
  result = swift_storeEnumTagMultiPayload();
  if (!*MEMORY[0x24BDAC688])
  {
    __break(1u);
    goto LABEL_9;
  }
  v16 = (_QWORD *)((char *)v5 + 5 * v2);
  v17 = (char *)v16 + *(int *)(v0 + 48);
  *v16 = *MEMORY[0x24BDAC688];
  *v17 = 1;
  result = swift_storeEnumTagMultiPayload();
  if (!*MEMORY[0x24BDAC6B0])
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  v18 = (_QWORD *)((char *)v5 + 6 * v2);
  v19 = (_QWORD *)((char *)v18 + *(int *)(v0 + 48));
  *v18 = *MEMORY[0x24BDAC6B0];
  *v19 = 43200;
  result = swift_storeEnumTagMultiPayload();
  if (!*MEMORY[0x24BDAC5D0])
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  v20 = (_QWORD *)((char *)&v5[v2] - v2);
  v21 = (_QWORD *)((char *)v20 + *(int *)(v0 + 48));
  *v20 = *MEMORY[0x24BDAC5D0];
  *v21 = *MEMORY[0x24BDAC610];
  result = swift_storeEnumTagMultiPayload();
  if (!*MEMORY[0x24BDAC5E8])
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  v22 = &v5[v2];
  v23 = (_QWORD *)((char *)v22 + *(int *)(v0 + 48));
  *v22 = *MEMORY[0x24BDAC5E8];
  *v23 = 0xD000000000000025;
  v23[1] = 0x80000002381C2860;
  result = swift_storeEnumTagMultiPayload();
  if (!*MEMORY[0x24BDAC5E0])
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  v24 = (_QWORD *)((char *)v5 + 9 * v2);
  v25 = (_QWORD *)((char *)v24 + *(int *)(v0 + 48));
  *v24 = *MEMORY[0x24BDAC5E0];
  *v25 = 1;
  result = swift_storeEnumTagMultiPayload();
  if (*MEMORY[0x24BDAC5C0])
  {
    v26 = (_QWORD *)((char *)v5 + 10 * v2);
    v27 = (char *)v26 + *(int *)(v0 + 48);
    *v26 = *MEMORY[0x24BDAC5C0];
    *v27 = 1;
    swift_storeEnumTagMultiPayload();
    v28 = sub_2381B8E68(v4);
    swift_setDeallocating();
    swift_arrayDestroy();
    result = swift_deallocClassInstance();
    static CacheCleanupActivityConfig.activityFlags = v28;
    return result;
  }
LABEL_13:
  __break(1u);
  return result;
}

uint64_t *CacheCleanupActivityConfig.activityFlags.unsafeMutableAddressor()
{
  if (qword_2542CABD0 != -1)
    swift_once();
  return &static CacheCleanupActivityConfig.activityFlags;
}

uint64_t static CacheCleanupActivityConfig.activityFlags.getter()
{
  if (qword_2542CABD0 != -1)
    swift_once();
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

uint64_t static CacheCleanupActivityConfig.activityFlags.setter(uint64_t a1)
{
  if (qword_2542CABD0 != -1)
    swift_once();
  swift_beginAccess();
  static CacheCleanupActivityConfig.activityFlags = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*static CacheCleanupActivityConfig.activityFlags.modify())()
{
  if (qword_2542CABD0 != -1)
    swift_once();
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t sub_2381BF62C()
{
  if (qword_2542CABD0 != -1)
    swift_once();
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

uint64_t sub_2381BF698()
{
  return 0x6E61656C632D6264;
}

ValueMetadata *type metadata accessor for CacheCleanupActivityConfig()
{
  return &type metadata for CacheCleanupActivityConfig;
}

uint64_t XPCMessage.MessageType.rawValue.getter(uint64_t result)
{
  return result;
}

BOOL sub_2381BF6D0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

unint64_t sub_2381BF6E4@<X0>(unint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  unint64_t result;

  result = _s20CloudTelemetryShared10XPCMessageV11MessageTypeO8rawValueAESgs5Int64V_tcfC_0(*a1);
  *a2 = result;
  return result;
}

uint64_t XPCMessage.ty.getter(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t XPCMessage.init(ty:payload:)(unsigned __int8 a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  xpc_object_t v7;
  uint64_t v9;
  uint64_t v10;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542CA000);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = a2;
  swift_unknownObjectRetain();
  v7 = xpc_int64_create(a1);
  XPCObject.init(_:)(v7, (uint64_t)v6);
  XPCDictionary.subscript.setter((uint64_t)v6);
  swift_unknownObjectRelease();
  return v10;
}

void XPCMessage.init(fromXPC:)()
{
  uint64_t v0;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542CA000);
  MEMORY[0x24BDAC7A8](v0);
  swift_getObjectType();
  OS_xpc_object.type()();
}

void *sub_2381BF824(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;

  if (a1 != XPCTypeDictionary.getter())
    goto LABEL_2;
  v2 = swift_unknownObjectRetain();
  v3 = (void *)XPCDictionary.init(_:)(v2);
  XPCDictionary.subscript.getter(v3, (uint64_t)v1);
  swift_unknownObjectRelease();
  v4 = type metadata accessor for XPCObject();
  if ((*(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(v1, 1, v4) == 1)
  {
    swift_unknownObjectRelease();
    sub_2381C01DC((uint64_t)v1);
    return 0;
  }
  if (swift_getEnumCaseMultiPayload() != 3)
  {
    swift_unknownObjectRelease();
    sub_2381B63FC((uint64_t)v1);
    return 0;
  }
  if (*v1 >= 4uLL)
  {
LABEL_2:
    swift_unknownObjectRelease();
    return 0;
  }
  return v3;
}

uint64_t XPCMessage.description.getter(void *a1, char a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int isUniquelyReferenced_nonNull_native;
  char v21;
  unint64_t v22;
  uint64_t v23;
  _BOOL8 v24;
  uint64_t v25;
  char v26;
  unint64_t v27;
  char v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  BOOL v32;
  uint64_t v33;
  uint64_t result;
  _QWORD v35[2];
  char *v36;
  void *v37;
  uint64_t v38;
  _QWORD *v39;
  uint64_t v40;
  unint64_t v41;

  v38 = type metadata accessor for XPCObject();
  v4 = *(_QWORD *)(v38 - 8);
  MEMORY[0x24BDAC7A8](v38);
  v6 = (char *)v35 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542CA000);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)v35 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v40 = 0;
  v41 = 0xE000000000000000;
  LOBYTE(v39) = a2;
  sub_2381C08EC();
  sub_2381C076C();
  v37 = a1;
  v10 = XPCDictionary.keys.getter(a1);
  v11 = *(_QWORD *)(v10 + 16);
  v35[1] = v10;
  if (v11)
  {
    v12 = (uint64_t *)(v10 + 40);
    v13 = (_QWORD *)MEMORY[0x24BEE4B00];
    v36 = v9;
    while (1)
    {
      v16 = *(v12 - 1);
      v15 = *v12;
      swift_bridgeObjectRetain();
      XPCDictionary.subscript.getter(v37, (uint64_t)v9);
      v17 = v4;
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v4 + 48))(v9, 1, v38) == 1)
        break;
      v18 = (uint64_t)v9;
      v19 = (uint64_t)v6;
      sub_2381B9008(v18, (uint64_t)v6);
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v39 = v13;
      v22 = sub_2381ADD0C(v16, v15);
      v23 = v13[2];
      v24 = (v21 & 1) == 0;
      v25 = v23 + v24;
      if (__OFADD__(v23, v24))
      {
        __break(1u);
LABEL_17:
        __break(1u);
        break;
      }
      v26 = v21;
      if (v13[3] >= v25)
      {
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
          sub_2381BFFA0();
      }
      else
      {
        sub_2381BFC38(v25, isUniquelyReferenced_nonNull_native);
        v27 = sub_2381ADD0C(v16, v15);
        if ((v26 & 1) != (v28 & 1))
          goto LABEL_19;
        v22 = v27;
      }
      v4 = v17;
      v13 = v39;
      if ((v26 & 1) != 0)
      {
        v14 = v39[7] + *(_QWORD *)(v17 + 72) * v22;
        v6 = (char *)v19;
        sub_2381C021C(v19, v14);
      }
      else
      {
        v39[(v22 >> 6) + 8] |= 1 << v22;
        v29 = (uint64_t *)(v13[6] + 16 * v22);
        *v29 = v16;
        v29[1] = v15;
        v30 = v13[7] + *(_QWORD *)(v17 + 72) * v22;
        v6 = (char *)v19;
        sub_2381B9008(v19, v30);
        v31 = v13[2];
        v32 = __OFADD__(v31, 1);
        v33 = v31 + 1;
        if (v32)
          goto LABEL_17;
        v13[2] = v33;
        swift_bridgeObjectRetain();
      }
      v12 += 2;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      --v11;
      v9 = v36;
      if (!v11)
        goto LABEL_15;
    }
    __break(1u);
LABEL_19:
    result = sub_2381C0970();
    __break(1u);
  }
  else
  {
LABEL_15:
    swift_bridgeObjectRelease();
    sub_2381C0700();
    swift_bridgeObjectRelease();
    sub_2381C076C();
    swift_bridgeObjectRelease();
    sub_2381C076C();
    return v40;
  }
  return result;
}

uint64_t sub_2381BFC2C()
{
  uint64_t v0;

  return XPCMessage.description.getter(*(void **)v0, *(_BYTE *)(v0 + 8));
}

uint64_t sub_2381BFC38(uint64_t a1, int a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
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
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  char v34;
  unint64_t v35;
  BOOL v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t *v39;
  int64_t v40;
  _QWORD *v41;
  uint64_t v42;
  int v43;

  v3 = v2;
  v5 = type metadata accessor for XPCObject();
  v42 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v39 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *v2;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2568E6310);
  v43 = a2;
  v9 = sub_2381C0928();
  v10 = v9;
  if (!*(_QWORD *)(v8 + 16))
    goto LABEL_41;
  v11 = 1 << *(_BYTE *)(v8 + 32);
  v12 = *(_QWORD *)(v8 + 64);
  v41 = (_QWORD *)(v8 + 64);
  if (v11 < 64)
    v13 = ~(-1 << v11);
  else
    v13 = -1;
  v14 = v13 & v12;
  v39 = v2;
  v40 = (unint64_t)(v11 + 63) >> 6;
  v15 = v9 + 64;
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
    if (v22 >= v40)
      break;
    v23 = v41;
    v24 = v41[v22];
    ++v17;
    if (!v24)
    {
      v17 = v22 + 1;
      if (v22 + 1 >= v40)
        goto LABEL_34;
      v24 = v41[v17];
      if (!v24)
      {
        v25 = v22 + 2;
        if (v25 >= v40)
        {
LABEL_34:
          swift_release();
          v3 = v39;
          if ((v43 & 1) == 0)
            goto LABEL_41;
          goto LABEL_37;
        }
        v24 = v41[v25];
        if (!v24)
        {
          while (1)
          {
            v17 = v25 + 1;
            if (__OFADD__(v25, 1))
              goto LABEL_43;
            if (v17 >= v40)
              goto LABEL_34;
            v24 = v41[v17];
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
    v26 = (uint64_t *)(*(_QWORD *)(v8 + 48) + 16 * v21);
    v28 = *v26;
    v27 = v26[1];
    v29 = *(_QWORD *)(v42 + 72);
    v30 = *(_QWORD *)(v8 + 56) + v29 * v21;
    if ((v43 & 1) != 0)
    {
      sub_2381B9008(v30, (uint64_t)v7);
    }
    else
    {
      sub_2381BA2FC(v30, (uint64_t)v7);
      swift_bridgeObjectRetain();
    }
    sub_2381C09DC();
    sub_2381C0760();
    result = sub_2381C0A00();
    v31 = -1 << *(_BYTE *)(v10 + 32);
    v32 = result & ~v31;
    v33 = v32 >> 6;
    if (((-1 << v32) & ~*(_QWORD *)(v15 + 8 * (v32 >> 6))) != 0)
    {
      v18 = __clz(__rbit64((-1 << v32) & ~*(_QWORD *)(v15 + 8 * (v32 >> 6)))) | v32 & 0x7FFFFFFFFFFFFFC0;
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
          goto LABEL_42;
        }
        v36 = v33 == v35;
        if (v33 == v35)
          v33 = 0;
        v34 |= v36;
        v37 = *(_QWORD *)(v15 + 8 * v33);
      }
      while (v37 == -1);
      v18 = __clz(__rbit64(~v37)) + (v33 << 6);
    }
    *(_QWORD *)(v15 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    v19 = (_QWORD *)(*(_QWORD *)(v10 + 48) + 16 * v18);
    *v19 = v28;
    v19[1] = v27;
    result = sub_2381B9008((uint64_t)v7, *(_QWORD *)(v10 + 56) + v29 * v18);
    ++*(_QWORD *)(v10 + 16);
  }
  swift_release();
  v3 = v39;
  v23 = v41;
  if ((v43 & 1) == 0)
    goto LABEL_41;
LABEL_37:
  v38 = 1 << *(_BYTE *)(v8 + 32);
  if (v38 >= 64)
    bzero(v23, ((unint64_t)(v38 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v23 = -1 << v38;
  *(_QWORD *)(v8 + 16) = 0;
LABEL_41:
  result = swift_release();
  *v3 = v10;
  return result;
}

void *sub_2381BFFA0()
{
  uint64_t *v0;
  uint64_t *v1;
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
  int64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  _QWORD *v23;
  int64_t v24;
  unint64_t v25;
  int64_t v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;

  v1 = v0;
  v2 = type metadata accessor for XPCObject();
  v30 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v27 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2568E6310);
  v5 = *v0;
  v6 = sub_2381C091C();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
  {
    result = (void *)swift_release();
LABEL_28:
    *v1 = v7;
    return result;
  }
  v28 = v1;
  result = (void *)(v6 + 64);
  v9 = (unint64_t)((1 << *(_BYTE *)(v7 + 32)) + 63) >> 6;
  if (v7 != v5 || (unint64_t)result >= v5 + 64 + 8 * v9)
    result = memmove(result, (const void *)(v5 + 64), 8 * v9);
  v29 = v5 + 64;
  v11 = 0;
  *(_QWORD *)(v7 + 16) = *(_QWORD *)(v5 + 16);
  v12 = 1 << *(_BYTE *)(v5 + 32);
  v13 = -1;
  if (v12 < 64)
    v13 = ~(-1 << v12);
  v14 = v13 & *(_QWORD *)(v5 + 64);
  v15 = (unint64_t)(v12 + 63) >> 6;
  while (1)
  {
    if (v14)
    {
      v16 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      v17 = v16 | (v11 << 6);
      goto LABEL_12;
    }
    v24 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v24 >= v15)
      goto LABEL_26;
    v25 = *(_QWORD *)(v29 + 8 * v24);
    ++v11;
    if (!v25)
    {
      v11 = v24 + 1;
      if (v24 + 1 >= v15)
        goto LABEL_26;
      v25 = *(_QWORD *)(v29 + 8 * v11);
      if (!v25)
        break;
    }
LABEL_25:
    v14 = (v25 - 1) & v25;
    v17 = __clz(__rbit64(v25)) + (v11 << 6);
LABEL_12:
    v18 = 16 * v17;
    v19 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v17);
    v21 = *v19;
    v20 = v19[1];
    v22 = *(_QWORD *)(v30 + 72) * v17;
    sub_2381BA2FC(*(_QWORD *)(v5 + 56) + v22, (uint64_t)v4);
    v23 = (_QWORD *)(*(_QWORD *)(v7 + 48) + v18);
    *v23 = v21;
    v23[1] = v20;
    sub_2381B9008((uint64_t)v4, *(_QWORD *)(v7 + 56) + v22);
    result = (void *)swift_bridgeObjectRetain();
  }
  v26 = v24 + 2;
  if (v26 >= v15)
  {
LABEL_26:
    result = (void *)swift_release();
    v1 = v28;
    goto LABEL_28;
  }
  v25 = *(_QWORD *)(v29 + 8 * v26);
  if (v25)
  {
    v11 = v26;
    goto LABEL_25;
  }
  while (1)
  {
    v11 = v26 + 1;
    if (__OFADD__(v26, 1))
      break;
    if (v11 >= v15)
      goto LABEL_26;
    v25 = *(_QWORD *)(v29 + 8 * v11);
    ++v26;
    if (v25)
      goto LABEL_25;
  }
LABEL_30:
  __break(1u);
  return result;
}

unint64_t _s20CloudTelemetryShared10XPCMessageV11MessageTypeO8rawValueAESgs5Int64V_tcfC_0(unint64_t result)
{
  if (result >= 4)
    return 4;
  return result;
}

uint64_t sub_2381C01DC(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542CA000);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2381C021C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for XPCObject();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

unint64_t sub_2381C0264()
{
  unint64_t result;

  result = qword_2568E6308;
  if (!qword_2568E6308)
  {
    result = MEMORY[0x23B82E4F4](&protocol conformance descriptor for XPCMessage.MessageType, &type metadata for XPCMessage.MessageType);
    atomic_store(result, (unint64_t *)&qword_2568E6308);
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for XPCMessage(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  swift_unknownObjectRetain();
  return a1;
}

uint64_t destroy for XPCMessage()
{
  return swift_unknownObjectRelease();
}

uint64_t assignWithCopy for XPCMessage(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  return a1;
}

uint64_t __swift_memcpy9_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2;

  v2 = *a2;
  *(_BYTE *)(result + 8) = *((_BYTE *)a2 + 8);
  *(_QWORD *)result = v2;
  return result;
}

uint64_t assignWithTake for XPCMessage(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_unknownObjectRelease();
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  return a1;
}

uint64_t getEnumTagSinglePayload for XPCMessage(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 9))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for XPCMessage(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_BYTE *)(result + 8) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 9) = 1;
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
    *(_BYTE *)(result + 9) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for XPCMessage()
{
  return &type metadata for XPCMessage;
}

uint64_t getEnumTagSinglePayload for XPCMessage.MessageType(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for XPCMessage.MessageType(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2381C04F4 + 4 * byte_2381C2075[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_2381C0528 + 4 * asc_2381C2070[v4]))();
}

uint64_t sub_2381C0528(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2381C0530(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2381C0538);
  return result;
}

uint64_t sub_2381C0544(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2381C054CLL);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_2381C0550(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2381C0558(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_2381C0564(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for XPCMessage.MessageType()
{
  return &type metadata for XPCMessage.MessageType;
}

uint64_t sub_2381C0580()
{
  return MEMORY[0x24BDCB9F0]();
}

uint64_t sub_2381C058C()
{
  return MEMORY[0x24BDCBBB0]();
}

uint64_t sub_2381C0598()
{
  return MEMORY[0x24BDCBBC8]();
}

uint64_t sub_2381C05A4()
{
  return MEMORY[0x24BDCBBD8]();
}

uint64_t sub_2381C05B0()
{
  return MEMORY[0x24BDCBBF0]();
}

uint64_t sub_2381C05BC()
{
  return MEMORY[0x24BDCBC10]();
}

uint64_t sub_2381C05C8()
{
  return MEMORY[0x24BDCBE60]();
}

uint64_t sub_2381C05D4()
{
  return MEMORY[0x24BDCBE68]();
}

uint64_t sub_2381C05E0()
{
  return MEMORY[0x24BDCBE80]();
}

uint64_t sub_2381C05EC()
{
  return MEMORY[0x24BDCD2F0]();
}

uint64_t sub_2381C05F8()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_2381C0604()
{
  return MEMORY[0x24BDCD860]();
}

uint64_t sub_2381C0610()
{
  return MEMORY[0x24BDCD8D0]();
}

uint64_t sub_2381C061C()
{
  return MEMORY[0x24BDCD918]();
}

uint64_t sub_2381C0628()
{
  return MEMORY[0x24BDCD958]();
}

uint64_t sub_2381C0634()
{
  return MEMORY[0x24BDCD9F8]();
}

uint64_t sub_2381C0640()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_2381C064C()
{
  return MEMORY[0x24BDCDC10]();
}

uint64_t sub_2381C0658()
{
  return MEMORY[0x24BDCEA10]();
}

uint64_t sub_2381C0664()
{
  return MEMORY[0x24BDCEA18]();
}

uint64_t sub_2381C0670()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_2381C067C()
{
  return MEMORY[0x24BE30BE0]();
}

uint64_t sub_2381C0688()
{
  return MEMORY[0x24BE17DF0]();
}

uint64_t sub_2381C0694()
{
  return MEMORY[0x24BE17DF8]();
}

uint64_t sub_2381C06A0()
{
  return MEMORY[0x24BE17E08]();
}

uint64_t sub_2381C06AC()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_2381C06B8()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_2381C06C4()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_2381C06D0()
{
  return MEMORY[0x24BEE54B0]();
}

uint64_t sub_2381C06DC()
{
  return MEMORY[0x24BEE54C0]();
}

uint64_t sub_2381C06E8()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_2381C06F4()
{
  return MEMORY[0x24BDCF830]();
}

uint64_t sub_2381C0700()
{
  return MEMORY[0x24BEE0270]();
}

uint64_t sub_2381C070C()
{
  return MEMORY[0x24BEE0290]();
}

uint64_t sub_2381C0718()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_2381C0724()
{
  return MEMORY[0x24BDCFA08]();
}

uint64_t sub_2381C0730()
{
  return MEMORY[0x24BDCFA18]();
}

uint64_t sub_2381C073C()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_2381C0748()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_2381C0754()
{
  return MEMORY[0x24BEE0A30]();
}

uint64_t sub_2381C0760()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_2381C076C()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_2381C0778()
{
  return MEMORY[0x24BEE0BE8]();
}

uint64_t sub_2381C0784()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_2381C0790()
{
  return MEMORY[0x24BEE0CD0]();
}

uint64_t sub_2381C079C()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_2381C07A8()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_2381C07B4()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_2381C07C0()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_2381C07CC()
{
  return MEMORY[0x24BEE6820]();
}

uint64_t sub_2381C07D8()
{
  return MEMORY[0x24BEE6828]();
}

uint64_t sub_2381C07E4()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t sub_2381C07F0()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t sub_2381C07FC()
{
  return MEMORY[0x24BEE6AC0]();
}

uint64_t sub_2381C0808()
{
  return MEMORY[0x24BEE6AD0]();
}

uint64_t sub_2381C0814()
{
  return MEMORY[0x24BEE6AD8]();
}

uint64_t sub_2381C0820()
{
  return MEMORY[0x24BEE6B20]();
}

uint64_t sub_2381C082C()
{
  return MEMORY[0x24BEE78F0]();
}

uint64_t sub_2381C0838()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t sub_2381C0844()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_2381C0850()
{
  return MEMORY[0x24BEE7920]();
}

uint64_t sub_2381C085C()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_2381C0868()
{
  return MEMORY[0x24BEE5688]();
}

uint64_t sub_2381C0874()
{
  return MEMORY[0x24BEE5760]();
}

uint64_t sub_2381C0880()
{
  return MEMORY[0x24BEE57A0]();
}

uint64_t sub_2381C088C()
{
  return MEMORY[0x24BEE57B0]();
}

uint64_t sub_2381C0898()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_2381C08A4()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_2381C08B0()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_2381C08BC()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_2381C08C8()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_2381C08D4()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_2381C08E0()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_2381C08EC()
{
  return MEMORY[0x24BEE2BE0]();
}

uint64_t sub_2381C08F8()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_2381C0904()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_2381C0910()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_2381C091C()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_2381C0928()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_2381C0934()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_2381C0940()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_2381C094C()
{
  return MEMORY[0x24BEE31D0]();
}

uint64_t sub_2381C0958()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_2381C0964()
{
  return MEMORY[0x24BEE70E0]();
}

uint64_t sub_2381C0970()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_2381C097C()
{
  return MEMORY[0x24BDD06D8]();
}

uint64_t sub_2381C0988()
{
  return MEMORY[0x24BDD06F0]();
}

uint64_t sub_2381C0994()
{
  return MEMORY[0x24BDD0708]();
}

uint64_t sub_2381C09A0()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_2381C09AC()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_2381C09B8()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_2381C09C4()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_2381C09D0()
{
  return MEMORY[0x24BEE42D0]();
}

uint64_t sub_2381C09DC()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_2381C09E8()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_2381C09F4()
{
  return MEMORY[0x24BEE4318]();
}

uint64_t sub_2381C0A00()
{
  return MEMORY[0x24BEE4328]();
}

NSString *NSHomeDirectory(void)
{
  return (NSString *)MEMORY[0x24BDD0DD8]();
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF460](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF488](lock);
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

uint64_t swift_getDynamicType()
{
  return MEMORY[0x24BEE4D00]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x24BEE4D08]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x24BEE4D18]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x24BEE4D40]();
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

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x24BEE4E30]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x24BEE4E48]();
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

uint64_t swift_unknownObjectRelease_n()
{
  return MEMORY[0x24BEE4F78]();
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

uint64_t xpc_activity_add_eligibility_changed_handler()
{
  return MEMORY[0x24BDB05C8]();
}

xpc_object_t xpc_activity_copy_criteria(xpc_activity_t activity)
{
  return (xpc_object_t)MEMORY[0x24BDB05D0](activity);
}

xpc_activity_state_t xpc_activity_get_state(xpc_activity_t activity)
{
  return MEMORY[0x24BDB05E0](activity);
}

void xpc_activity_register(const char *identifier, xpc_object_t criteria, xpc_activity_handler_t handler)
{
  MEMORY[0x24BDB05E8](identifier, criteria, handler);
}

uint64_t xpc_activity_remove_eligibility_changed_handler()
{
  return MEMORY[0x24BDB05F0]();
}

void xpc_activity_set_criteria(xpc_activity_t activity, xpc_object_t criteria)
{
  MEMORY[0x24BDB0608](activity, criteria);
}

BOOL xpc_activity_set_state(xpc_activity_t activity, xpc_activity_state_t state)
{
  return MEMORY[0x24BDB0610](activity, state);
}

BOOL xpc_activity_should_defer(xpc_activity_t activity)
{
  return MEMORY[0x24BDB0618](activity);
}

xpc_object_t xpc_BOOL_create(BOOL value)
{
  return (xpc_object_t)MEMORY[0x24BDB06D8](value);
}

BOOL xpc_BOOL_get_value(xpc_object_t xBOOL)
{
  return MEMORY[0x24BDB06E0](xBOOL);
}

void xpc_connection_activate(xpc_connection_t connection)
{
  MEMORY[0x24BDB0710](connection);
}

void xpc_connection_cancel(xpc_connection_t connection)
{
  MEMORY[0x24BDB0718](connection);
}

uint64_t xpc_connection_copy_entitlement_value()
{
  return MEMORY[0x24BDB0720]();
}

xpc_connection_t xpc_connection_create(const char *name, dispatch_queue_t targetq)
{
  return (xpc_connection_t)MEMORY[0x24BDB0730](name, targetq);
}

xpc_connection_t xpc_connection_create_from_endpoint(xpc_endpoint_t endpoint)
{
  return (xpc_connection_t)MEMORY[0x24BDB0738](endpoint);
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x24BDB0740](name, targetq, flags);
}

uint64_t xpc_connection_get_audit_token()
{
  return MEMORY[0x24BDB0758]();
}

uid_t xpc_connection_get_euid(xpc_connection_t connection)
{
  return MEMORY[0x24BDB0770](connection);
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
  MEMORY[0x24BDB07A8](connection, message);
}

void xpc_connection_send_message_with_reply(xpc_connection_t connection, xpc_object_t message, dispatch_queue_t replyq, xpc_handler_t handler)
{
  MEMORY[0x24BDB07B0](connection, message, replyq, handler);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
  MEMORY[0x24BDB07C8](connection, handler);
}

void xpc_connection_set_target_queue(xpc_connection_t connection, dispatch_queue_t targetq)
{
  MEMORY[0x24BDB07E8](connection, targetq);
}

xpc_object_t xpc_data_create(const void *bytes, size_t length)
{
  return (xpc_object_t)MEMORY[0x24BDB0868](bytes, length);
}

const void *__cdecl xpc_data_get_bytes_ptr(xpc_object_t xdata)
{
  return (const void *)MEMORY[0x24BDB0880](xdata);
}

size_t xpc_data_get_length(xpc_object_t xdata)
{
  return MEMORY[0x24BDB0888](xdata);
}

xpc_object_t xpc_date_create(int64_t interval)
{
  return (xpc_object_t)MEMORY[0x24BDB0890](interval);
}

int64_t xpc_date_get_value(xpc_object_t xdate)
{
  return MEMORY[0x24BDB08A0](xdate);
}

BOOL xpc_dictionary_apply(xpc_object_t xdict, xpc_dictionary_applier_t applier)
{
  return MEMORY[0x24BDB08B0](xdict, applier);
}

xpc_object_t xpc_dictionary_create_empty(void)
{
  return (xpc_object_t)MEMORY[0x24BDB08D0]();
}

size_t xpc_dictionary_get_count(xpc_object_t xdict)
{
  return MEMORY[0x24BDB0910](xdict);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x24BDB0950](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x24BDB0968](xdict, key);
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
  MEMORY[0x24BDB09E0](xdict, key, value);
}

xpc_object_t xpc_double_create(double value)
{
  return (xpc_object_t)MEMORY[0x24BDB09E8](value);
}

double xpc_double_get_value(xpc_object_t xdouble)
{
  double result;

  MEMORY[0x24BDB09F0](xdouble);
  return result;
}

xpc_endpoint_t xpc_endpoint_create(xpc_connection_t connection)
{
  return (xpc_endpoint_t)MEMORY[0x24BDB09F8](connection);
}

BOOL xpc_equal(xpc_object_t object1, xpc_object_t object2)
{
  return MEMORY[0x24BDB0A08](object1, object2);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x24BDB0A70](object);
}

xpc_object_t xpc_int64_create(int64_t value)
{
  return (xpc_object_t)MEMORY[0x24BDB0A80](value);
}

int64_t xpc_int64_get_value(xpc_object_t xint)
{
  return MEMORY[0x24BDB0A88](xint);
}

xpc_object_t xpc_null_create(void)
{
  return (xpc_object_t)MEMORY[0x24BDB0AC0]();
}

xpc_object_t xpc_string_create(const char *string)
{
  return (xpc_object_t)MEMORY[0x24BDB0B80](string);
}

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return (const char *)MEMORY[0x24BDB0BA8](xstring);
}

xpc_object_t xpc_uint64_create(uint64_t value)
{
  return (xpc_object_t)MEMORY[0x24BDB0BD8](value);
}

uint64_t xpc_uint64_get_value(xpc_object_t xuint)
{
  return MEMORY[0x24BDB0BE0](xuint);
}

xpc_object_t xpc_uuid_create(const unsigned __int8 *uuid)
{
  return (xpc_object_t)MEMORY[0x24BDB0BF8](uuid);
}

