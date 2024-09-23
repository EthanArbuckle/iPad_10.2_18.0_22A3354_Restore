id sub_232BF424C()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for Plugin();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for Plugin()
{
  return objc_opt_self();
}

uint64_t sub_232BF429C()
{
  uint64_t v0;

  v0 = sub_232BF46FC();
  sub_232BF46A4(v0, qword_255FF4A48);
  sub_232BF468C(v0, (uint64_t)qword_255FF4A48);
  return sub_232BF46F0();
}

void sub_232BF4318(void *a1, int a2, void *a3)
{
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v15;
  uint64_t v16;
  NSObject *v17;
  os_log_type_t v18;
  uint8_t *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  uint64_t v26;
  NSObject *v27;
  os_log_type_t v28;
  uint8_t *v29;
  id v30;

  if (!a1)
    goto LABEL_17;
  v6 = objc_msgSend(a1, sel_accountType);
  if (!v6)
  {
    __break(1u);
    return;
  }
  v7 = v6;
  v8 = objc_msgSend(v6, sel_identifier);

  if (!v8)
  {
LABEL_17:
    sub_232BF4708();
    goto LABEL_18;
  }
  v9 = sub_232BF4708();
  v11 = v10;

  v12 = sub_232BF4708();
  if (!v11)
  {
LABEL_18:
    swift_bridgeObjectRelease();
    return;
  }
  if (v9 == v12 && v11 == v13)
  {
    swift_bridgeObjectRelease_n();
    if (a2 != 2)
    {
LABEL_11:
      if (a2 == 1)
      {
        if (qword_255FF4A40 != -1)
          swift_once();
        v16 = sub_232BF46FC();
        sub_232BF468C(v16, (uint64_t)qword_255FF4A48);
        v17 = sub_232BF46E4();
        v18 = sub_232BF4714();
        if (os_log_type_enabled(v17, v18))
        {
          v19 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v19 = 0;
          _os_log_impl(&dword_232BF2000, v17, v18, "LockdownModeAccountNotificationPlugin: account added", v19, 2u);
          MEMORY[0x2349268A0](v19, -1, -1);
        }

        notify_post("com.apple.LockdownMode.accountChanged");
      }
      return;
    }
  }
  else
  {
    v15 = sub_232BF4720();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v15 & 1) == 0)
      return;
    if (a2 != 2)
      goto LABEL_11;
  }
  if (a3)
  {
    v20 = (void *)objc_opt_self();
    v21 = a1;
    v30 = a3;
    v22 = objc_msgSend(v20, sel_sharedInstance);
    v23 = objc_msgSend(v22, sel_securityLevelForAccount_, v30);

    if (v23 != (id)4)
    {
      v24 = objc_msgSend(v20, sel_sharedInstance);
      v25 = objc_msgSend(v24, sel_securityLevelForAccount_, v21);

      if (v25 == (id)4)
      {
        if (qword_255FF4A40 != -1)
          swift_once();
        v26 = sub_232BF46FC();
        sub_232BF468C(v26, (uint64_t)qword_255FF4A48);
        v27 = sub_232BF46E4();
        v28 = sub_232BF4714();
        if (os_log_type_enabled(v27, v28))
        {
          v29 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v29 = 0;
          _os_log_impl(&dword_232BF2000, v27, v28, "LockdownModeAccountNotificationPlugin: account is now eligible", v29, 2u);
          MEMORY[0x2349268A0](v29, -1, -1);
        }

        notify_post("com.apple.LockdownMode.accountChanged");
      }
    }

  }
}

uint64_t sub_232BF468C(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t *sub_232BF46A4(uint64_t a1, uint64_t *a2)
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

uint64_t sub_232BF46E4()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_232BF46F0()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_232BF46FC()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_232BF4708()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_232BF4714()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_232BF4720()
{
  return MEMORY[0x24BEE3A30]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x24BDAF160](name);
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x24BEE4BC0]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x24BEE4BC8]();
}

uint64_t swift_once()
{
  return MEMORY[0x24BEE4EC8]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x24BEE4F38]();
}

