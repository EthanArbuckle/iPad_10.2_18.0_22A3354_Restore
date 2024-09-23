id sub_230EF7B34()
{
  char *v0;
  char *v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  int v21;
  uint64_t v22;
  objc_super v24;
  uint64_t v25;
  uint64_t aBlock[6];

  v1 = v0;
  v2 = OBJC_IVAR____TtC32CoreIDVAccountNotificationPlugin27DIPSystemNotificationClient_remoteObjectProxy;
  *(_QWORD *)&v0[OBJC_IVAR____TtC32CoreIDVAccountNotificationPlugin27DIPSystemNotificationClient_remoteObjectProxy] = 0;
  v3 = qword_25414B4E8;
  v4 = v1;
  if (v3 != -1)
    swift_once();
  v5 = sub_230EF9BC0();
  sub_230EF81CC(v5, (uint64_t)qword_25414B4F0);
  v6 = sub_230EF9BA8();
  v7 = sub_230EF9BFC();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc();
    v9 = swift_slowAlloc();
    aBlock[0] = v9;
    *(_DWORD *)v8 = 136446210;
    v25 = sub_230EF8620(0xD000000000000027, 0x8000000230EFA270, aBlock);
    sub_230EF9C14();
    _os_log_impl(&dword_230EF6000, v6, v7, "DIPSystemNotificationClient connecting to service %{public}s ", v8, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2348C8334](v9, -1, -1);
    MEMORY[0x2348C8334](v8, -1, -1);
  }

  v10 = objc_allocWithZone(MEMORY[0x24BDD1988]);
  v11 = (void *)sub_230EF9BCC();
  v12 = objc_msgSend(v10, sel_initWithMachServiceName_options_, v11, 4096);

  v13 = OBJC_IVAR____TtC32CoreIDVAccountNotificationPlugin27DIPSystemNotificationClient_serverConnection;
  *(_QWORD *)&v4[OBJC_IVAR____TtC32CoreIDVAccountNotificationPlugin27DIPSystemNotificationClient_serverConnection] = v12;
  v14 = (void *)objc_opt_self();
  v15 = v12;
  v16 = objc_msgSend(v14, sel_interfaceWithProtocol_, &unk_255EACB30);
  objc_msgSend(v15, sel_setRemoteObjectInterface_, v16);

  *(_QWORD *)&v1[v2] = 0;
  swift_unknownObjectRelease();
  v17 = *(void **)&v4[v13];
  objc_msgSend(v17, sel_resume);
  aBlock[4] = (uint64_t)sub_230EF7E88;
  aBlock[5] = 0;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_230EF8060;
  aBlock[3] = (uint64_t)&unk_24FFA8F50;
  v18 = _Block_copy(aBlock);
  v19 = v17;
  v20 = objc_msgSend(v19, sel_remoteObjectProxyWithErrorHandler_, v18);
  _Block_release(v18);

  sub_230EF9C2C();
  swift_unknownObjectRelease();
  sub_230EF81FC((uint64_t *)&unk_255EAB708);
  v21 = swift_dynamicCast();
  v22 = v25;
  if (!v21)
    v22 = 0;
  *(_QWORD *)&v1[v2] = v22;

  swift_unknownObjectRelease();
  v24.receiver = v4;
  v24.super_class = (Class)type metadata accessor for DIPSystemNotificationClient();
  return objc_msgSendSuper2(&v24, sel_init);
}

void sub_230EF7E88(void *a1)
{
  uint64_t v2;
  id v3;
  id v4;
  os_log_type_t v5;
  uint8_t *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  NSObject *oslog;
  uint64_t v11;

  if (qword_25414B4E8 != -1)
    swift_once();
  v2 = sub_230EF9BC0();
  sub_230EF81CC(v2, (uint64_t)qword_25414B4F0);
  v3 = a1;
  v4 = a1;
  oslog = sub_230EF9BA8();
  v5 = sub_230EF9BFC();
  if (os_log_type_enabled(oslog, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc();
    v7 = swift_slowAlloc();
    v11 = v7;
    *(_DWORD *)v6 = 136446210;
    swift_getErrorValue();
    v8 = sub_230EF9C74();
    sub_230EF8620(v8, v9, &v11);
    sub_230EF9C14();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_230EF6000, oslog, v5, "error: system notification client init -> %{public}s", v6, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2348C8334](v7, -1, -1);
    MEMORY[0x2348C8334](v6, -1, -1);

  }
  else
  {

  }
}

void sub_230EF8060(uint64_t a1, void *a2)
{
  void (*v3)(void);
  id v4;

  v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3();
  swift_release();

}

id sub_230EF80D0()
{
  char *v0;
  objc_super v2;

  objc_msgSend(*(id *)&v0[OBJC_IVAR____TtC32CoreIDVAccountNotificationPlugin27DIPSystemNotificationClient_serverConnection], sel_invalidate);
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for DIPSystemNotificationClient();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for DIPSystemNotificationClient()
{
  return objc_opt_self();
}

uint64_t sub_230EF81CC(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t sub_230EF81E4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_230EF81F4()
{
  return swift_release();
}

uint64_t sub_230EF81FC(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2348C82EC]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

void sub_230EF823C(uint64_t a1, void *a2)
{
  void (*v3)(void *);
  id v4;

  v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3(a2);
  swift_release();

}

uint64_t sub_230EF8290()
{
  uint64_t v0;

  v0 = sub_230EF9BC0();
  sub_230EF9B10(v0, qword_25414B4F0);
  sub_230EF81CC(v0, (uint64_t)qword_25414B4F0);
  return sub_230EF9BB4();
}

id sub_230EF83D4(void *a1, uint64_t a2, const char *a3)
{
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v17;
  uint64_t v18;

  if (a1)
  {
    v6 = a1;
    if (qword_25414B4E8 != -1)
      swift_once();
    v7 = sub_230EF9BC0();
    sub_230EF81CC(v7, (uint64_t)qword_25414B4F0);
    v8 = a1;
    v9 = a1;
    v10 = sub_230EF9BA8();
    v11 = sub_230EF9C08();
    if (os_log_type_enabled(v10, v11))
    {
      v12 = (uint8_t *)swift_slowAlloc();
      v13 = swift_slowAlloc();
      v18 = v13;
      *(_DWORD *)v12 = 136446210;
      swift_getErrorValue();
      v14 = sub_230EF9C74();
      v17 = sub_230EF8620(v14, v15, &v18);
      sub_230EF9C14();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_230EF6000, v10, v11, a3, v12, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2348C8334](v13, -1, -1);
      MEMORY[0x2348C8334](v12, -1, -1);

    }
    else
    {

    }
  }
  return objc_msgSend(*(id *)(a2 + OBJC_IVAR____TtC32CoreIDVAccountNotificationPlugin27DIPSystemNotificationClient_serverConnection), sel_invalidate, v17);
}

id sub_230EF85D0()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for IDVACDAccountNotificationPlugin();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for IDVACDAccountNotificationPlugin()
{
  return objc_opt_self();
}

uint64_t sub_230EF8620(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_230EF86F0(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_230EF9AD0((uint64_t)v12, *a3);
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
      sub_230EF9AD0((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_230EF9AB0((uint64_t)v12);
  return v7;
}

uint64_t sub_230EF86F0(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_230EF9C20();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_230EF88A8(a5, a6);
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
  v8 = sub_230EF9C44();
  if (!v8)
  {
    sub_230EF9C50();
    __break(1u);
LABEL_17:
    result = sub_230EF9C5C();
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

uint64_t sub_230EF88A8(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_230EF893C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_230EF8B14(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_230EF8B14(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_230EF893C(uint64_t a1, unint64_t a2)
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
      v3 = sub_230EF8AB0(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_230EF9C38();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_230EF9C50();
      __break(1u);
LABEL_10:
      v2 = sub_230EF9BE4();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_230EF9C5C();
    __break(1u);
LABEL_14:
    result = sub_230EF9C50();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_230EF8AB0(uint64_t a1, uint64_t a2)
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
  sub_230EF81FC(&qword_255EAB778);
  v4 = (_QWORD *)swift_allocObject();
  v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_230EF8B14(char a1, int64_t a2, char a3, char *a4)
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
    sub_230EF81FC(&qword_255EAB778);
    v10 = (char *)swift_allocObject();
    v11 = j__malloc_size(v10);
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
  result = sub_230EF9C5C();
  __break(1u);
  return result;
}

void sub_230EF8C60(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  id v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  uint64_t aBlock[6];

  v2 = sub_230EF9BC0();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8]();
  v5 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_25414B4E8 != -1)
    swift_once();
  v6 = sub_230EF81CC(v2, (uint64_t)qword_25414B4F0);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v6, v2);
  v7 = a1;
  v8 = sub_230EF9BA8();
  v9 = sub_230EF9BF0();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = (uint8_t *)swift_slowAlloc();
    v11 = swift_slowAlloc();
    aBlock[0] = v11;
    *(_DWORD *)v10 = 136446210;
    v12 = objc_msgSend(v7, sel_accountType);
    if (v12)
    {
      v13 = v12;
      v25 = v11;
      v26 = v7;
      v14 = objc_msgSend(v12, sel_identifier);

      if (v14)
      {
        v15 = sub_230EF9BD8();
        v17 = v16;

        v27 = sub_230EF8620(v15, v17, aBlock);
        sub_230EF9C14();
        v7 = v26;

        swift_bridgeObjectRelease();
        _os_log_impl(&dword_230EF6000, v8, v9, "User has logged into their Apple account of type: %{public}s", v10, 0xCu);
        v18 = v25;
        swift_arrayDestroy();
        MEMORY[0x2348C8334](v18, -1, -1);
        MEMORY[0x2348C8334](v10, -1, -1);

        goto LABEL_8;
      }
    }
    else
    {

      __break(1u);
    }

    __break(1u);
    return;
  }

LABEL_8:
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  v19 = (char *)objc_msgSend(objc_allocWithZone((Class)type metadata accessor for DIPSystemNotificationClient()), sel_init);
  v20 = swift_allocObject();
  *(_QWORD *)(v20 + 16) = v19;
  v21 = *(void **)&v19[OBJC_IVAR____TtC32CoreIDVAccountNotificationPlugin27DIPSystemNotificationClient_remoteObjectProxy];
  if (v21)
  {
    aBlock[4] = (uint64_t)sub_230EF9A78;
    aBlock[5] = v20;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_230EF823C;
    aBlock[3] = (uint64_t)&unk_24FFA8FA0;
    v22 = _Block_copy(aBlock);
    v23 = v19;
    swift_unknownObjectRetain();
    swift_retain();
    swift_release();
    objc_msgSend(v21, sel_appleAccountCreatedWithAccount_completion_, v7, v22);
    _Block_release(v22);

    swift_release();
    swift_unknownObjectRelease();
  }
  else
  {
    swift_release();
  }
}

void sub_230EF8FAC(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  id v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  uint64_t aBlock[6];

  v2 = sub_230EF9BC0();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8]();
  v5 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_25414B4E8 != -1)
    swift_once();
  v6 = sub_230EF81CC(v2, (uint64_t)qword_25414B4F0);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v6, v2);
  v7 = a1;
  v8 = sub_230EF9BA8();
  v9 = sub_230EF9BF0();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = (uint8_t *)swift_slowAlloc();
    v11 = swift_slowAlloc();
    aBlock[0] = v11;
    *(_DWORD *)v10 = 136446210;
    v12 = objc_msgSend(v7, sel_accountType);
    if (v12)
    {
      v13 = v12;
      v25 = v11;
      v26 = v7;
      v14 = objc_msgSend(v12, sel_identifier);

      if (v14)
      {
        v15 = sub_230EF9BD8();
        v17 = v16;

        v27 = sub_230EF8620(v15, v17, aBlock);
        sub_230EF9C14();
        v7 = v26;

        swift_bridgeObjectRelease();
        _os_log_impl(&dword_230EF6000, v8, v9, "User has logged out of their Apple account of type: %{public}s", v10, 0xCu);
        v18 = v25;
        swift_arrayDestroy();
        MEMORY[0x2348C8334](v18, -1, -1);
        MEMORY[0x2348C8334](v10, -1, -1);

        goto LABEL_8;
      }
    }
    else
    {

      __break(1u);
    }

    __break(1u);
    return;
  }

LABEL_8:
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  v19 = (char *)objc_msgSend(objc_allocWithZone((Class)type metadata accessor for DIPSystemNotificationClient()), sel_init);
  v20 = swift_allocObject();
  *(_QWORD *)(v20 + 16) = v19;
  v21 = *(void **)&v19[OBJC_IVAR____TtC32CoreIDVAccountNotificationPlugin27DIPSystemNotificationClient_remoteObjectProxy];
  if (v21)
  {
    aBlock[4] = (uint64_t)sub_230EF9B50;
    aBlock[5] = v20;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_230EF823C;
    aBlock[3] = (uint64_t)&unk_24FFA8FF0;
    v22 = _Block_copy(aBlock);
    v23 = v19;
    swift_unknownObjectRetain();
    swift_retain();
    swift_release();
    objc_msgSend(v21, sel_appleAccountDeletedWithAccount_completion_, v7, v22);
    _Block_release(v22);

    swift_release();
    swift_unknownObjectRelease();
  }
  else
  {
    swift_release();
  }
}

void sub_230EF92F8(void *a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  id v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  id v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  id v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char v42;
  id v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  id v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  char v53;
  id v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  id v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  char *v64;
  uint64_t v65;
  void *v66;
  void *v67;
  char *v68;
  char v69;
  uint64_t v70;
  void *v71;
  id v72;
  uint64_t v73;
  uint64_t aBlock[6];

  v4 = sub_230EF9BC0();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8]();
  v7 = (char *)&v70 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_25414B4E8 != -1)
    swift_once();
  v8 = sub_230EF81CC(v4, (uint64_t)qword_25414B4F0);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v8, v4);
  v9 = a1;
  v10 = sub_230EF9BA8();
  v11 = sub_230EF9BFC();
  if (os_log_type_enabled(v10, v11))
  {
    v71 = a2;
    v12 = (uint8_t *)swift_slowAlloc();
    v13 = swift_slowAlloc();
    aBlock[0] = v13;
    *(_DWORD *)v12 = 136446210;
    v72 = v9;
    v14 = objc_msgSend(v9, sel_accountType);
    if (v14)
    {
      v15 = v14;
      v70 = v13;
      v16 = objc_msgSend(v14, sel_identifier);

      if (v16)
      {
        v17 = sub_230EF9BD8();
        v19 = v18;

        v73 = sub_230EF8620(v17, v19, aBlock);
        sub_230EF9C14();
        v9 = v72;

        swift_bridgeObjectRelease();
        _os_log_impl(&dword_230EF6000, v10, v11, "received modification notification Apple account of type: %{public}s", v12, 0xCu);
        v20 = v70;
        swift_arrayDestroy();
        MEMORY[0x2348C8334](v20, -1, -1);
        MEMORY[0x2348C8334](v12, -1, -1);

        (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
        a2 = v71;
        goto LABEL_8;
      }
    }
    else
    {

      __break(1u);
    }

    __break(1u);
    return;
  }

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
LABEL_8:
  v21 = objc_msgSend(v9, sel_aa_firstName);
  if (v21)
  {
    v22 = v21;
    v23 = sub_230EF9BD8();
    v25 = v24;

  }
  else
  {
    v23 = 0;
    v25 = 0;
  }
  v26 = objc_msgSend(a2, sel_aa_firstName);
  if (v26)
  {
    v27 = v26;
    v28 = sub_230EF9BD8();
    v30 = v29;

    if (v25)
    {
      if (!v30)
        goto LABEL_60;
      if (v23 == v28 && v25 == v30)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
      else
      {
        v31 = sub_230EF9C68();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v31 & 1) == 0)
          goto LABEL_61;
      }
    }
    else if (v30)
    {
      goto LABEL_60;
    }
  }
  else if (v25)
  {
    goto LABEL_60;
  }
  v32 = objc_msgSend(v9, sel_aa_middleName);
  if (v32)
  {
    v33 = v32;
    v34 = sub_230EF9BD8();
    v36 = v35;

  }
  else
  {
    v34 = 0;
    v36 = 0;
  }
  v37 = objc_msgSend(a2, sel_aa_middleName);
  if (v37)
  {
    v38 = v37;
    v39 = sub_230EF9BD8();
    v41 = v40;

    if (v36)
    {
      if (!v41)
        goto LABEL_60;
      if (v34 == v39 && v36 == v41)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
      else
      {
        v42 = sub_230EF9C68();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v42 & 1) == 0)
          goto LABEL_61;
      }
    }
    else if (v41)
    {
      goto LABEL_60;
    }
  }
  else if (v36)
  {
    goto LABEL_60;
  }
  v43 = objc_msgSend(v9, sel_aa_lastName);
  if (v43)
  {
    v44 = v43;
    v45 = sub_230EF9BD8();
    v47 = v46;

  }
  else
  {
    v45 = 0;
    v47 = 0;
  }
  v48 = objc_msgSend(a2, sel_aa_lastName);
  if (v48)
  {
    v49 = v48;
    v50 = sub_230EF9BD8();
    v52 = v51;

    if (v47)
    {
      if (!v52)
        goto LABEL_60;
      if (v45 == v50 && v47 == v52)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
      else
      {
        v53 = sub_230EF9C68();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v53 & 1) == 0)
          goto LABEL_61;
      }
    }
    else if (v52)
    {
      goto LABEL_60;
    }
  }
  else if (v47)
  {
    goto LABEL_60;
  }
  v54 = objc_msgSend(v9, sel_aa_primaryEmail);
  if (v54)
  {
    v55 = v54;
    v56 = sub_230EF9BD8();
    v58 = v57;

  }
  else
  {
    v56 = 0;
    v58 = 0;
  }
  v59 = objc_msgSend(a2, sel_aa_primaryEmail);
  if (!v59)
  {
    if (!v58)
      return;
    goto LABEL_60;
  }
  v60 = v59;
  v61 = sub_230EF9BD8();
  v63 = v62;

  if (!v58)
  {
    if (!v63)
      return;
    goto LABEL_60;
  }
  if (!v63)
  {
LABEL_60:
    swift_bridgeObjectRelease();
LABEL_61:
    v64 = (char *)objc_msgSend(objc_allocWithZone((Class)type metadata accessor for DIPSystemNotificationClient()), sel_init);
    v65 = swift_allocObject();
    *(_QWORD *)(v65 + 16) = v64;
    v66 = *(void **)&v64[OBJC_IVAR____TtC32CoreIDVAccountNotificationPlugin27DIPSystemNotificationClient_remoteObjectProxy];
    if (v66)
    {
      aBlock[4] = (uint64_t)sub_230EF9B70;
      aBlock[5] = v65;
      aBlock[0] = MEMORY[0x24BDAC760];
      aBlock[1] = 1107296256;
      aBlock[2] = (uint64_t)sub_230EF823C;
      aBlock[3] = (uint64_t)&unk_24FFA9040;
      v67 = _Block_copy(aBlock);
      v68 = v64;
      swift_unknownObjectRetain();
      swift_retain();
      swift_release();
      objc_msgSend(v66, sel_appleAccountModifiedWithAccount_oldAccount_completion_, v9, a2, v67);
      _Block_release(v67);

      swift_release();
      swift_unknownObjectRelease();
    }
    else
    {
      swift_release();
    }
    return;
  }
  if (v56 == v61 && v58 == v63)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return;
  }
  v69 = sub_230EF9C68();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v69 & 1) == 0)
    goto LABEL_61;
}

uint64_t sub_230EF99C8(void *a1, int a2, void *a3)
{
  id v4;
  id v5;

  if (a2 == 3)
  {
    if (a3)
    {
      v4 = a3;
      sub_230EF8FAC(v4);
      goto LABEL_11;
    }
  }
  else if (a2 == 2)
  {
    if (a1 && a3)
    {
      v5 = a1;
      v4 = a3;
      sub_230EF92F8(v5, v4);

      goto LABEL_11;
    }
  }
  else if (a2 == 1 && a1)
  {
    v4 = a1;
    sub_230EF8C60(v4);
LABEL_11:

  }
  return 0;
}

uint64_t sub_230EF9A54()
{
  uint64_t v0;

  return swift_deallocObject();
}

id sub_230EF9A78(void *a1)
{
  uint64_t v1;

  return sub_230EF83D4(a1, *(_QWORD *)(v1 + 16), "Received error from account created XPC: %{public}s");
}

uint64_t sub_230EF9A98(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_230EF9AA8()
{
  return swift_release();
}

uint64_t sub_230EF9AB0(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_230EF9AD0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t *sub_230EF9B10(uint64_t a1, uint64_t *a2)
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

id sub_230EF9B50(void *a1)
{
  uint64_t v1;

  return sub_230EF83D4(a1, *(_QWORD *)(v1 + 16), "Received error from account deleted XPC: %{public}s");
}

id sub_230EF9B70(void *a1)
{
  uint64_t v1;

  return sub_230EF83D4(a1, *(_QWORD *)(v1 + 16), "Received error from account modified XPC: %{public}s");
}

uint64_t sub_230EF9BA8()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_230EF9BB4()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_230EF9BC0()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_230EF9BCC()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_230EF9BD8()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_230EF9BE4()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_230EF9BF0()
{
  return MEMORY[0x24BEE78F0]();
}

uint64_t sub_230EF9BFC()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t sub_230EF9C08()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_230EF9C14()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_230EF9C20()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_230EF9C2C()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_230EF9C38()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_230EF9C44()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_230EF9C50()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_230EF9C5C()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_230EF9C68()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_230EF9C74()
{
  return MEMORY[0x24BDD0708]();
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

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x24BEE4F70]();
}

