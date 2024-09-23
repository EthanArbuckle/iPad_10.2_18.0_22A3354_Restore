uint64_t sub_236AF332C()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for ATDispatcher()
{
  return objc_opt_self();
}

uint64_t sub_236AF335C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_236AF342C(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_236AF44CC((uint64_t)v12, *a3);
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
      sub_236AF44CC((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_236AF342C(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_236AF5C2C();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_236AF35E4(a5, a6);
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
  v8 = sub_236AF5C50();
  if (!v8)
  {
    sub_236AF5C68();
    __break(1u);
LABEL_17:
    result = sub_236AF5C74();
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

uint64_t sub_236AF35E4(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_236AF3678(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_236AF3850(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_236AF3850(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_236AF3678(uint64_t a1, unint64_t a2)
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
      v3 = sub_236AF37EC(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_236AF5C44();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_236AF5C68();
      __break(1u);
LABEL_10:
      v2 = sub_236AF5BE4();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_236AF5C74();
    __break(1u);
LABEL_14:
    result = sub_236AF5C68();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_236AF37EC(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_25643A9B8);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_236AF3850(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_25643A9B8);
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
  result = sub_236AF5C74();
  __break(1u);
  return result;
}

uint64_t sub_236AF399C(uint64_t a1, __int16 a2, uint64_t a3)
{
  uint64_t v3;

  *(_WORD *)(v3 + 88) = a2;
  *(_QWORD *)(v3 + 40) = a1;
  *(_QWORD *)(v3 + 48) = a3;
  return swift_task_switch();
}

uint64_t sub_236AF39B8()
{
  uint64_t v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  id v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  id v11;
  NSObject *v12;
  os_log_type_t v13;
  _BOOL4 v14;
  void *v15;
  uint8_t *v16;
  _QWORD *v17;
  id v18;
  _QWORD *v19;
  uint64_t v21;

  sub_236AF5B9C();
  swift_allocObject();
  *(_QWORD *)(v0 + 56) = sub_236AF5B90();
  if (qword_25643A8E0 != -1)
    swift_once();
  v1 = sub_236AF5B3C();
  __swift_project_value_buffer(v1, (uint64_t)qword_25643ABE0);
  v2 = sub_236AF5B24();
  v3 = sub_236AF5C14();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = swift_slowAlloc();
    v5 = swift_slowAlloc();
    v21 = v5;
    *(_DWORD *)v4 = 136315394;
    *(_QWORD *)(v0 + 24) = sub_236AF335C(0xD00000000000003ALL, 0x8000000236AF6400, &v21);
    sub_236AF5C20();
    *(_WORD *)(v4 + 12) = 2080;
    v6 = objc_msgSend((id)objc_opt_self(), sel_mainBundle);
    v7 = objc_msgSend(v6, sel_bundleIdentifier);

    if (v7)
    {
      v8 = sub_236AF5BC0();
      v10 = v9;

    }
    else
    {
      v10 = 0xE300000000000000;
      v8 = 7104878;
    }
    *(_QWORD *)(v0 + 32) = sub_236AF335C(v8, v10, &v21);
    sub_236AF5C20();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_236AF2000, v2, v3, "%s called with client bundle identifier %s", (uint8_t *)v4, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x23B7FB8DC](v5, -1, -1);
    MEMORY[0x23B7FB8DC](v4, -1, -1);
  }

  v11 = *(id *)(v0 + 40);
  v12 = sub_236AF5B24();
  v13 = sub_236AF5C14();
  v14 = os_log_type_enabled(v12, v13);
  v15 = *(void **)(v0 + 40);
  if (v14)
  {
    v16 = (uint8_t *)swift_slowAlloc();
    v17 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v16 = 138412290;
    *(_QWORD *)(v0 + 16) = v15;
    v18 = v15;
    sub_236AF5C20();
    *v17 = v15;

    _os_log_impl(&dword_236AF2000, v12, v13, "Sending question to daemon: %@", v16, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_25643A9B0);
    swift_arrayDestroy();
    MEMORY[0x23B7FB8DC](v17, -1, -1);
    MEMORY[0x23B7FB8DC](v16, -1, -1);
  }
  else
  {

    v12 = *(NSObject **)(v0 + 40);
  }

  v19 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 64) = v19;
  *v19 = v0;
  v19[1] = sub_236AF3D3C;
  return sub_236AF5B84();
}

uint64_t sub_236AF3D3C(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;

  v4 = *v2;
  *(_QWORD *)(*v2 + 72) = v1;
  swift_task_dealloc();
  if (!v1)
  {
    *(_QWORD *)(v4 + 80) = a1;
    swift_bridgeObjectRelease();
  }
  return swift_task_switch();
}

uint64_t sub_236AF3DBC()
{
  uint64_t v0;
  id v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  **(_QWORD **)(v0 + 48) = *(_QWORD *)(v0 + 80);
  v1 = objc_msgSend((id)objc_opt_self(), sel_mainBundle);
  v2 = objc_msgSend(v1, sel_bundleIdentifier);

  if (v2)
  {
    v3 = sub_236AF5BC0();
    v5 = v4;

  }
  else
  {
    v3 = 0;
    v5 = 0;
  }
  v6 = (void *)sub_236AF5B48();
  MEMORY[0x23B7FB558](v3, v5, v6, 1900);

  swift_bridgeObjectRelease();
  sub_236AF5B6C();
  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_236AF3EA0()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  v1 = *(_QWORD *)(v0 + 72);
  sub_236AF4468();
  swift_allocError();
  *v2 = v1;
  swift_willThrow();
  sub_236AF5B6C();
  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_236AF3F14(uint64_t a1, __int16 a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;

  *(_WORD *)(v3 + 136) = a2;
  *(_QWORD *)(v3 + 88) = a1;
  v7 = sub_236AF5B18();
  *(_QWORD *)(v3 + 96) = v7;
  *(_QWORD *)(v3 + 104) = *(_QWORD *)(v7 - 8);
  *(_QWORD *)(v3 + 112) = swift_task_alloc();
  v8 = swift_task_alloc();
  *(_QWORD *)(v3 + 120) = v8;
  *(_QWORD *)v8 = v3;
  *(_QWORD *)(v8 + 8) = sub_236AF3FB8;
  *(_WORD *)(v8 + 88) = a2;
  *(_QWORD *)(v8 + 40) = a1;
  *(_QWORD *)(v8 + 48) = a3;
  return swift_task_switch();
}

uint64_t sub_236AF3FB8()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 128) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_236AF401C()
{
  uint64_t v0;
  id v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_236AF5B54();
  v1 = objc_msgSend((id)objc_opt_self(), sel_mainBundle);
  v2 = objc_msgSend(v1, sel_bundleIdentifier);

  if (v2)
  {
    sub_236AF5BC0();

  }
  v4 = *(_QWORD *)(v0 + 104);
  v3 = *(_QWORD *)(v0 + 112);
  v5 = *(_QWORD *)(v0 + 96);
  sub_236AF5B60();
  sub_236AF5BA8();
  swift_bridgeObjectRelease_n();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_236AF412C()
{
  uint64_t v0;
  void *v1;
  id v2;
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v1 = *(void **)(v0 + 128);
  *(_QWORD *)(v0 + 56) = v1;
  v2 = v1;
  v3 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25643A990);
  if ((swift_dynamicCast() & 1) != 0)
  {
    *(_QWORD *)(v0 + 80) = &type metadata for ATDispatchCenter.SendError;
    v4 = *(void **)(v0 + 64);
    __swift_instantiateConcreteTypeFromMangledName(&qword_25643A9A0);
    sub_236AF5BCC();
    if (v4 == (void *)1)
    {

      sub_236AF4440((id)1);
    }
    else
    {

      if (v4)
        sub_236AF4440(v4);
      else
        sub_236AF4440(0);
    }
  }
  else
  {
    v5 = *(void **)(v0 + 128);
    swift_getErrorValue();
    *(_QWORD *)(v0 + 40) = swift_getDynamicType();
    *(_QWORD *)(v0 + 48) = *(_QWORD *)(v0 + 32);
    __swift_instantiateConcreteTypeFromMangledName(&qword_25643A998);
    sub_236AF5BCC();

  }
  sub_236AF5B54();
  v6 = objc_msgSend((id)objc_opt_self(), sel_mainBundle);
  v7 = objc_msgSend(v6, sel_bundleIdentifier);

  if (v7)
  {
    sub_236AF5BC0();

  }
  v8 = *(_QWORD *)(v0 + 104);
  v9 = *(_QWORD *)(v0 + 112);
  v10 = *(_QWORD *)(v0 + 96);
  sub_236AF5B60();
  sub_236AF5BA8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v9, v10);
  if (v1)
    swift_willThrow();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x23B7FB870]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

void sub_236AF4440(id a1)
{
  if ((unint64_t)a1 >= 2)

}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

unint64_t sub_236AF4468()
{
  unint64_t result;

  result = qword_25643A9A8;
  if (!qword_25643A9A8)
  {
    result = MEMORY[0x23B7FB87C](&protocol conformance descriptor for ATDispatchCenter.SendError, &type metadata for ATDispatchCenter.SendError);
    atomic_store(result, (unint64_t *)&qword_25643A9A8);
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

uint64_t sub_236AF44CC(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t ATDispatchCenter.SendError.id.getter()
{
  _QWORD *v0;
  uint64_t v1;

  v1 = 0x72456D6574737973;
  if (*v0 == 1)
    v1 = 0x5164696C61766E69;
  if (*v0)
    return v1;
  else
    return 0x6E776F6E6B6E75;
}

unint64_t ATDispatchCenter.SendError.errorDescription.getter()
{
  void **v0;
  unint64_t v1;
  void *v2;
  id v3;

  v1 = 0xD00000000000001ALL;
  v2 = *v0;
  if (*v0)
  {
    if (v2 == (void *)1)
    {
      return 0xD000000000000022;
    }
    else
    {
      v3 = v2;
      sub_236AF5C38();
      sub_236AF5BD8();
      __swift_instantiateConcreteTypeFromMangledName(&qword_25643A990);
      sub_236AF5C5C();
      sub_236AF4440(v2);
      return 0;
    }
  }
  return v1;
}

uint64_t sub_236AF4670@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = ATDispatchCenter.SendError.id.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_236AF46A4()
{
  uint64_t *v0;
  id v1;
  uint64_t result;

  type metadata accessor for ATDispatcher();
  swift_allocObject();
  v0 = (uint64_t *)swift_retain();
  v1 = sub_236AF5304(v0);
  result = swift_release();
  qword_25643A9C0 = (uint64_t)v1;
  return result;
}

id static ATDispatchCenter.shared.getter()
{
  if (qword_25643A8D8 != -1)
    swift_once();
  return (id)qword_25643A9C0;
}

id ATDispatchCenter.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t ATDispatchCenter.send(_:to:)(uint64_t a1, __int16 a2)
{
  uint64_t v2;
  _QWORD *v5;

  *(_QWORD *)(v2 + 16) = 0;
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 24) = v5;
  *v5 = v2;
  v5[1] = sub_236AF4888;
  return sub_236AF3F14(a1, a2, v2 + 16);
}

uint64_t sub_236AF4888()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 32) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_bridgeObjectRelease();
  return swift_task_switch();
}

uint64_t sub_236AF48F4()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_236AF4900()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_236AF4A6C(void *a1, __int16 a2, void *aBlock, void *a4)
{
  _QWORD *v4;
  id v8;
  id v9;
  _QWORD *v10;

  v4[3] = a1;
  v4[4] = a4;
  v4[5] = _Block_copy(aBlock);
  v8 = a1;
  v9 = a4;
  v4[2] = 0;
  v10 = (_QWORD *)swift_task_alloc();
  v4[6] = v10;
  *v10 = v4;
  v10[1] = sub_236AF4AF4;
  return sub_236AF3F14((uint64_t)v8, a2, (uint64_t)(v4 + 2));
}

uint64_t sub_236AF4AF4()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 56) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_bridgeObjectRelease();
  return swift_task_switch();
}

uint64_t sub_236AF4B60()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;

  v1 = *(void **)(v0 + 32);
  v2 = *(_QWORD *)(v0 + 40);

  (*(void (**)(uint64_t, _QWORD))(v2 + 16))(v2, 0);
  _Block_release(*(const void **)(v0 + 40));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_236AF4BB0()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;

  v1 = *(void **)(v0 + 56);
  v3 = *(void **)(v0 + 32);
  v2 = *(_QWORD *)(v0 + 40);

  swift_bridgeObjectRelease();
  v4 = (void *)sub_236AF5B0C();

  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v4);
  _Block_release(*(const void **)(v0 + 40));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t ATDispatchCenter.send(_:to:destinationsNotSupportingLegacyAskViaMessages:)(uint64_t a1, __int16 a2, uint64_t a3)
{
  uint64_t v3;

  *(_WORD *)(v3 + 40) = a2;
  *(_QWORD *)(v3 + 16) = a1;
  *(_QWORD *)(v3 + 24) = a3;
  return swift_task_switch();
}

uint64_t sub_236AF4C48()
{
  uint64_t v0;
  id v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  _QWORD *v7;

  v1 = objc_msgSend((id)objc_opt_self(), sel_mainBundle);
  v2 = objc_msgSend(v1, sel_bundleIdentifier);

  if (v2)
  {
    v3 = sub_236AF5BC0();
    v5 = v4;

  }
  else
  {
    v3 = 0;
    v5 = 0;
  }
  v6 = (void *)sub_236AF5B48();
  MEMORY[0x23B7FB558](v3, v5, v6, 100);

  swift_bridgeObjectRelease();
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 32) = v7;
  *v7 = v0;
  v7[1] = sub_236AF4D30;
  return sub_236AF3F14(*(_QWORD *)(v0 + 16), *(_WORD *)(v0 + 40), *(_QWORD *)(v0 + 24));
}

uint64_t sub_236AF4D30()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t ATDispatchCenter.addResponseListener(_:)(uint64_t a1)
{
  return sub_236AF4D9C(a1, (SEL *)&selRef_addObject_);
}

uint64_t ATDispatchCenter.removeResponseListener(_:)(uint64_t a1)
{
  return sub_236AF4D9C(a1, (SEL *)&selRef_removeObject_);
}

uint64_t sub_236AF4D9C(uint64_t a1, SEL *a2)
{
  uint64_t v2;
  uint64_t v5;

  v5 = OBJC_IVAR____TtC5AskTo16ATDispatchCenter_responseListeners;
  objc_sync_enter(*(id *)(v2 + OBJC_IVAR____TtC5AskTo16ATDispatchCenter_responseListeners));
  objc_msgSend(*(id *)(v2 + v5), *a2, a1);
  return objc_sync_exit(*(id *)(v2 + v5));
}

void sub_236AF4DF4(char *a1, uint64_t a2, uint64_t a3, SEL *a4)
{
  uint64_t v7;
  void *v8;
  char *v9;

  v7 = OBJC_IVAR____TtC5AskTo16ATDispatchCenter_responseListeners;
  v8 = *(void **)&a1[OBJC_IVAR____TtC5AskTo16ATDispatchCenter_responseListeners];
  swift_unknownObjectRetain();
  v9 = a1;
  objc_sync_enter(v8);
  objc_msgSend(*(id *)&a1[v7], *a4, a3);
  objc_sync_exit(*(id *)&a1[v7]);
  swift_unknownObjectRelease();

}

uint64_t ATDispatchCenter.screenTimeDidReceiveAnswer(_:forRequestWithID:responderDSID:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;

  v5[5] = a4;
  v5[6] = a5;
  v5[3] = a2;
  v5[4] = a3;
  v5[2] = a1;
  return swift_task_switch();
}

uint64_t sub_236AF4E98()
{
  uint64_t v0;
  _QWORD *v1;

  sub_236AF5B9C();
  swift_allocObject();
  *(_QWORD *)(v0 + 56) = sub_236AF5B90();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 64) = v1;
  *v1 = v0;
  v1[1] = sub_236AF4F14;
  return sub_236AF5B78();
}

uint64_t sub_236AF4F14()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 72) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_236AF4F78()
{
  uint64_t v0;

  sub_236AF5B6C();
  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_236AF4FB4()
{
  uint64_t v0;

  sub_236AF5B6C();
  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

id ATDispatchCenter.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void ATDispatchCenter.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t sub_236AF5068(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t (*v6)(void);

  v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v4;
  *v4 = v3;
  v4[1] = sub_236AF5A10;
  return v6();
}

uint64_t sub_236AF50BC(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t (*v7)(void);

  v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v5;
  *v5 = v4;
  v5[1] = sub_236AF5A10;
  return v7();
}

uint64_t sub_236AF5110(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_236AF5C08();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_236AF5BFC();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_236AF58D0(a1);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_236AF5BF0();
    swift_unknownObjectRelease();
  }
LABEL_5:
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_236AF5254(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_236AF52B8;
  return v6(a1);
}

uint64_t sub_236AF52B8()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

id sub_236AF5304(uint64_t *a1)
{
  uint64_t v1;
  objc_class *v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  char *v11;
  id v12;
  objc_super v14;
  _QWORD v15[5];
  _QWORD v16[3];
  uint64_t v17;
  _UNKNOWN **v18;

  v17 = *a1;
  v1 = v17;
  v18 = &off_2508144C0;
  v16[0] = a1;
  v2 = (objc_class *)type metadata accessor for ATDispatchCenter();
  v3 = (char *)objc_allocWithZone(v2);
  v4 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v16, v17);
  MEMORY[0x24BDAC7A8](v4, v4);
  v6 = (uint64_t *)((char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v7 + 16))(v6);
  v8 = *v6;
  v15[3] = v1;
  v15[4] = &off_2508144C0;
  v15[0] = v8;
  v9 = OBJC_IVAR____TtC5AskTo16ATDispatchCenter_responseListeners;
  v10 = (void *)objc_opt_self();
  v11 = v3;
  *(_QWORD *)&v3[v9] = objc_msgSend(v10, sel_weakObjectsHashTable);
  sub_236AF59CC((uint64_t)v15, (uint64_t)&v11[OBJC_IVAR____TtC5AskTo16ATDispatchCenter_dispatcher]);

  v14.receiver = v11;
  v14.super_class = v2;
  v12 = objc_msgSendSuper2(&v14, sel_init);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v15);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v16);
  return v12;
}

uint64_t sub_236AF5434()
{
  return MEMORY[0x24BEE0D10];
}

uint64_t type metadata accessor for ATDispatchCenter()
{
  return objc_opt_self();
}

uint64_t method lookup function for ATDispatchCenter()
{
  return swift_lookUpClassMethod();
}

_QWORD *initializeBufferWithCopyOfBuffer for ATDispatchCenter.SendError(_QWORD *a1, void **a2)
{
  void *v3;
  id v4;

  v3 = *a2;
  if ((unint64_t)*a2 >= 0xFFFFFFFF)
    v4 = v3;
  *a1 = v3;
  return a1;
}

void destroy for ATDispatchCenter.SendError(void **a1)
{
  void *v1;

  v1 = *a1;
  if ((unint64_t)v1 >= 0xFFFFFFFF)

}

void **assignWithCopy for ATDispatchCenter.SendError(void **a1, void **a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = *a1;
  v4 = *a2;
  if ((unint64_t)v3 < 0xFFFFFFFF)
  {
    if ((unint64_t)v4 >= 0xFFFFFFFF)
      v7 = v4;
    *a1 = v4;
  }
  else if ((unint64_t)v4 < 0xFFFFFFFF)
  {

    *a1 = *a2;
  }
  else
  {
    v5 = v4;
    v6 = *a1;
    *a1 = v4;

  }
  return a1;
}

_QWORD *__swift_memcpy8_8(_QWORD *result, _QWORD *a2)
{
  *result = *a2;
  return result;
}

void **assignWithTake for ATDispatchCenter.SendError(void **a1, unint64_t *a2)
{
  void *v3;
  unint64_t v4;

  v3 = *a1;
  v4 = *a2;
  if ((unint64_t)v3 < 0xFFFFFFFF)
    goto LABEL_5;
  if (v4 < 0xFFFFFFFF)
  {

LABEL_5:
    *a1 = (void *)v4;
    return a1;
  }
  *a1 = (void *)v4;

  return a1;
}

uint64_t getEnumTagSinglePayload for ATDispatchCenter.SendError(uint64_t *a1, unsigned int a2)
{
  uint64_t v3;
  unsigned int v4;
  unsigned int v5;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFE && *((_BYTE *)a1 + 8))
    return (*(_DWORD *)a1 + 2147483646);
  v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 + 1;
  v5 = v3 - 1;
  if (v4 >= 3)
    return v5;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for ATDispatchCenter.SendError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFD)
  {
    *(_QWORD *)result = 0;
    *(_DWORD *)result = a2 - 2147483646;
    if (a3 >= 0x7FFFFFFE)
      *(_BYTE *)(result + 8) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFE)
      *(_BYTE *)(result + 8) = 0;
    if (a2)
      *(_QWORD *)result = a2 + 1;
  }
  return result;
}

uint64_t sub_236AF565C(uint64_t *a1)
{
  uint64_t v1;

  v1 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v1) = -1;
  return (v1 + 1);
}

_QWORD *sub_236AF5678(_QWORD *result, int a2)
{
  unsigned int v2;

  if (a2 < 0)
  {
    v2 = a2 ^ 0x80000000;
  }
  else
  {
    if (!a2)
      return result;
    v2 = a2 - 1;
  }
  *result = v2;
  return result;
}

ValueMetadata *type metadata accessor for ATDispatchCenter.SendError()
{
  return &type metadata for ATDispatchCenter.SendError;
}

uint64_t sub_236AF56A8()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 32));
  return swift_deallocObject();
}

uint64_t sub_236AF56DC()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  __int16 v5;
  _QWORD *v6;

  v2 = *(void **)(v0 + 16);
  v3 = *(void **)(v0 + 32);
  v4 = *(void **)(v0 + 40);
  v5 = *(_WORD *)(v0 + 24);
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v6;
  *v6 = v1;
  v6[1] = sub_236AF5758;
  return ((uint64_t (*)(void *, __int16, void *, void *))((char *)&dword_25643AA20 + dword_25643AA20))(v2, v5, v3, v4);
}

uint64_t sub_236AF5758()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_236AF57A4()
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
  v5[1] = sub_236AF5A10;
  return ((uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_25643AA30 + dword_25643AA30))(v2, v3, v4);
}

uint64_t objectdestroy_9Tm()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_236AF584C(uint64_t a1)
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
  v7[1] = sub_236AF5A10;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_25643AA40 + dword_25643AA40))(a1, v4, v5, v6);
}

uint64_t sub_236AF58D0(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25643AA18);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_236AF5910()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_236AF5934(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_236AF5758;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_25643AA50 + dword_25643AA50))(a1, v4);
}

uint64_t __swift_mutable_project_boxed_opaque_existential_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
  {
    swift_makeBoxUnique();
    return v2;
  }
  return result;
}

uint64_t sub_236AF59CC(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_236AF5A18()
{
  uint64_t v0;

  v0 = sub_236AF5B3C();
  __swift_allocate_value_buffer(v0, qword_25643ABE0);
  __swift_project_value_buffer(v0, (uint64_t)qword_25643ABE0);
  return sub_236AF5B30();
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

uint64_t sub_236AF5ADC()
{
  return MEMORY[0x24BDCBE60]();
}

uint64_t sub_236AF5AE8()
{
  return MEMORY[0x24BDCBE68]();
}

uint64_t sub_236AF5AF4()
{
  return MEMORY[0x24BDCBE78]();
}

uint64_t sub_236AF5B00()
{
  return MEMORY[0x24BDCBE80]();
}

uint64_t sub_236AF5B0C()
{
  return MEMORY[0x24BDCD2F0]();
}

uint64_t sub_236AF5B18()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_236AF5B24()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_236AF5B30()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_236AF5B3C()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_236AF5B48()
{
  return MEMORY[0x24BE08970]();
}

uint64_t sub_236AF5B54()
{
  return MEMORY[0x24BE08978]();
}

uint64_t sub_236AF5B60()
{
  return MEMORY[0x24BE08988]();
}

uint64_t sub_236AF5B6C()
{
  return MEMORY[0x24BE08998]();
}

uint64_t sub_236AF5B78()
{
  return MEMORY[0x24BE089A0]();
}

uint64_t sub_236AF5B84()
{
  return MEMORY[0x24BE089B0]();
}

uint64_t sub_236AF5B90()
{
  return MEMORY[0x24BE089C0]();
}

uint64_t sub_236AF5B9C()
{
  return MEMORY[0x24BE089C8]();
}

uint64_t sub_236AF5BA8()
{
  return MEMORY[0x24BE089D0]();
}

uint64_t sub_236AF5BB4()
{
  return MEMORY[0x24BE089D8]();
}

uint64_t sub_236AF5BC0()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_236AF5BCC()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_236AF5BD8()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_236AF5BE4()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_236AF5BF0()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_236AF5BFC()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t sub_236AF5C08()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t sub_236AF5C14()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_236AF5C20()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_236AF5C2C()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_236AF5C38()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_236AF5C44()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_236AF5C50()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_236AF5C5C()
{
  return MEMORY[0x24BEE2BE0]();
}

uint64_t sub_236AF5C68()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_236AF5C74()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_236AF5C80()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_236AF5C8C()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_236AF5C98()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_236AF5CA4()
{
  return MEMORY[0x24BEE3F10]();
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x24BEDD438](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x24BEDD440](obj);
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

uint64_t swift_getDynamicType()
{
  return MEMORY[0x24BEE4D00]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x24BEE4D18]();
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

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x24BEE4EB0]();
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

