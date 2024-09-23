uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x24268984C]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t _s12LockdownMode0aB7ManagerC7enabledSbvg_0()
{
  id v1;
  void *v2;
  id v3;
  unsigned __int8 v4;
  _OWORD v5[2];
  _BYTE v6[24];
  uint64_t v7;

  if (qword_25435E090 != -1)
    swift_once();
  swift_beginAccess();
  if ((byte_25435E080 & 1) != 0)
    return 1;
  v1 = objc_msgSend((id)objc_opt_self(), sel_standardUserDefaults);
  v2 = (void *)sub_240B1A85C();
  v3 = objc_msgSend(v1, sel_objectForKey_inDomain_, v2, *MEMORY[0x24BDD0D70]);

  if (v3)
  {
    sub_240B1A8B0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v5, 0, sizeof(v5));
  }
  sub_240B177F8((uint64_t)v5, (uint64_t)v6);
  if (v7)
  {
    if ((swift_dynamicCast() & 1) != 0)
      return v4;
  }
  else
  {
    sub_240B177B8((uint64_t)v6);
  }
  return 0;
}

uint64_t sub_240B177B8(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25435E088);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_240B177F8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25435E088);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_240B17840()
{
  uint64_t result;
  BOOL v1;
  char v2;
  size_t v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x24BDAC8D0];
  v3 = 8;
  v4[0] = 0;
  result = sysctlbyname("security.mac.lockdown_mode_state", v4, &v3, 0, 0);
  if ((_DWORD)result)
    v1 = 0;
  else
    v1 = v4[0] == 1;
  v2 = v1;
  byte_25435E080 = v2;
  return result;
}

uint64_t static LockdownModeXNU.lockdownModeEnabled.getter()
{
  if (qword_25435E090 != -1)
    swift_once();
  swift_beginAccess();
  return byte_25435E080;
}

uint64_t static LockdownModeXNU.lockdownModeEnabled.setter(char a1)
{
  uint64_t result;

  if (qword_25435E090 != -1)
    swift_once();
  result = swift_beginAccess();
  byte_25435E080 = a1 & 1;
  return result;
}

uint64_t (*static LockdownModeXNU.lockdownModeEnabled.modify())()
{
  if (qword_25435E090 != -1)
    swift_once();
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t LockdownModeXNU.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t LockdownModeXNU.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for LockdownModeXNU()
{
  return objc_opt_self();
}

uint64_t method lookup function for LockdownModeXNU()
{
  return swift_lookUpClassMethod();
}

unint64_t static Logger.subsystem.getter()
{
  return 0xD000000000000016;
}

uint64_t sub_240B17C94(uint64_t a1)
{
  return sub_240B17D08(a1, qword_257087D28);
}

uint64_t static Logger.daemonLogger.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_240B17D98(qword_257087D40, (uint64_t)qword_257087D28, a1);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t sub_240B17CE4(uint64_t a1)
{
  return sub_240B17D08(a1, qword_257087E08);
}

uint64_t sub_240B17D08(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_240B1A838();
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  return sub_240B1A82C();
}

uint64_t static Logger.frameworkLogger.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_240B17D98(&qword_257087DE0, (uint64_t)qword_257087E08, a1);
}

uint64_t sub_240B17D98@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;

  if (*a1 != -1)
    swift_once();
  v5 = sub_240B1A838();
  v6 = __swift_project_value_buffer(v5, a2);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a3, v6, v5);
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

id sub_240B17E40()
{
  id result;

  result = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for LockdownModeManager()), sel_init);
  qword_25435E078 = (uint64_t)result;
  return result;
}

id LockdownModeManager.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id static LockdownModeManager.shared.getter()
{
  if (qword_25435E070 != -1)
    swift_once();
  return (id)qword_25435E078;
}

id sub_240B17F0C()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  id v4;
  void *v5;
  id v6;

  v1 = OBJC_IVAR___LockdownModeManagerInternal____lazy_storage___connection;
  v2 = *(void **)(v0 + OBJC_IVAR___LockdownModeManagerInternal____lazy_storage___connection);
  if (v2)
  {
    v3 = *(id *)(v0 + OBJC_IVAR___LockdownModeManagerInternal____lazy_storage___connection);
  }
  else
  {
    v4 = sub_240B17F68();
    v5 = *(void **)(v0 + v1);
    *(_QWORD *)(v0 + v1) = v4;
    v3 = v4;

    v2 = 0;
  }
  v6 = v2;
  return v3;
}

id sub_240B17F68()
{
  id v0;
  void *v1;
  id v2;
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t);
  void *v11;
  void (*v12)();
  uint64_t v13;

  v0 = objc_allocWithZone(MEMORY[0x24BDD1988]);
  v1 = (void *)sub_240B1A85C();
  v2 = objc_msgSend(v0, sel_initWithMachServiceName_options_, v1, 4096);

  v3 = objc_msgSend((id)objc_opt_self(), sel_interfaceWithProtocol_, &unk_25708A520);
  objc_msgSend(v2, sel_setRemoteObjectInterface_, v3);
  objc_msgSend(v2, sel_resume);
  v12 = sub_240B180F4;
  v13 = 0;
  v4 = MEMORY[0x24BDAC760];
  v8 = MEMORY[0x24BDAC760];
  v9 = 1107296256;
  v10 = sub_240B18100;
  v11 = &block_descriptor_78;
  v5 = _Block_copy(&v8);
  objc_msgSend(v2, sel_setInterruptionHandler_, v5);
  _Block_release(v5);
  v12 = sub_240B1812C;
  v13 = 0;
  v8 = v4;
  v9 = 1107296256;
  v10 = sub_240B18100;
  v11 = &block_descriptor_81;
  v6 = _Block_copy(&v8);
  objc_msgSend(v2, sel_setInvalidationHandler_, v6);
  _Block_release(v6);

  return v2;
}

void sub_240B180F4()
{
  sub_240B18138("Connection to %s was interrupted");
}

uint64_t sub_240B18100(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

void sub_240B1812C()
{
  sub_240B18138("Connection to %s was invalidated");
}

void sub_240B18138(const char *a1)
{
  uint64_t v2;
  os_log_type_t v3;
  uint8_t *v4;
  uint64_t v5;
  NSObject *oslog;
  uint64_t v7;

  if (qword_257087DE0 != -1)
    swift_once();
  v2 = sub_240B1A838();
  __swift_project_value_buffer(v2, (uint64_t)qword_257087E08);
  oslog = sub_240B1A820();
  v3 = sub_240B1A880();
  if (os_log_type_enabled(oslog, v3))
  {
    v4 = (uint8_t *)swift_slowAlloc();
    v5 = swift_slowAlloc();
    v7 = v5;
    *(_DWORD *)v4 = 136315138;
    sub_240B198AC(0xD000000000000017, 0x8000000240B1B440, &v7);
    sub_240B1A898();
    _os_log_impl(&dword_240B16000, oslog, v3, a1, v4, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2426898AC](v5, -1, -1);
    MEMORY[0x2426898AC](v4, -1, -1);

  }
  else
  {

  }
}

void sub_240B182C0(void *a1)
{
  sub_240B18E10(a1, "Could not obtain remoteObjectProxy: (%s)");
}

void sub_240B182CC(uint64_t a1, void *a2)
{
  void (*v3)(void);
  id v4;

  v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3();
  swift_release();

}

uint64_t sub_240B1831C(uint64_t a1, uint64_t a2, SEL *a3)
{
  id v6;
  void *v7;
  id v8;
  uint64_t v10;
  _QWORD aBlock[6];

  v6 = sub_240B17F0C();
  aBlock[4] = a1;
  aBlock[5] = 0;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_240B182CC;
  aBlock[3] = a2;
  v7 = _Block_copy(aBlock);
  v8 = objc_msgSend(v6, *a3, v7);
  _Block_release(v7);

  sub_240B1A8B0();
  swift_unknownObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_257087E20);
  if (swift_dynamicCast())
    return v10;
  else
    return 0;
}

void sub_240B18400(void *a1)
{
  sub_240B18E10(a1, "Could not obtain synchronousRemoteObjectProxyWithErrorHandler: (%s)");
}

uint64_t LockdownModeManager.enabledInAccount.getter()
{
  id v0;
  uint64_t v1;
  void *v2;
  id v3;
  uint64_t v4;
  unsigned __int8 *v5;
  void *v6;
  uint64_t v7;
  void *v9;
  uint64_t aBlock;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;

  v0 = sub_240B17F0C();
  v14 = sub_240B182C0;
  v15 = 0;
  v1 = MEMORY[0x24BDAC760];
  aBlock = MEMORY[0x24BDAC760];
  v11 = 1107296256;
  v12 = sub_240B182CC;
  v13 = &block_descriptor;
  v2 = _Block_copy(&aBlock);
  v3 = objc_msgSend(v0, sel_synchronousRemoteObjectProxyWithErrorHandler_, v2);
  _Block_release(v2);

  sub_240B1A8B0();
  swift_unknownObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_257087E20);
  swift_dynamicCast();
  v4 = swift_allocObject();
  *(_BYTE *)(v4 + 16) = 0;
  v5 = (unsigned __int8 *)(v4 + 16);
  v14 = sub_240B19F14;
  v15 = v4;
  aBlock = v1;
  v11 = 1107296256;
  v12 = sub_240B185E8;
  v13 = &block_descriptor_3;
  v6 = _Block_copy(&aBlock);
  swift_retain();
  swift_release();
  objc_msgSend(v9, sel_getEnabledInAccountWithSynchronize_completion_, 0, v6);
  swift_unknownObjectRelease();
  _Block_release(v6);
  swift_beginAccess();
  v7 = *v5;
  swift_release();
  return v7;
}

uint64_t sub_240B185E8(uint64_t a1, uint64_t a2)
{
  void (*v3)(uint64_t);

  v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);
  return swift_release();
}

uint64_t LockdownModeManager.getEnabledInAccount(synchronize:completion:)(char a1, uint64_t a2, uint64_t a3)
{
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v13;
  uint64_t aBlock;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;

  v6 = sub_240B17F0C();
  v18 = sub_240B182C0;
  v19 = 0;
  v7 = MEMORY[0x24BDAC760];
  aBlock = MEMORY[0x24BDAC760];
  v15 = 1107296256;
  v16 = sub_240B182CC;
  v17 = &block_descriptor_6;
  v8 = _Block_copy(&aBlock);
  v9 = objc_msgSend(v6, sel_synchronousRemoteObjectProxyWithErrorHandler_, v8);
  _Block_release(v8);

  sub_240B1A8B0();
  swift_unknownObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_257087E20);
  swift_dynamicCast();
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = a2;
  *(_QWORD *)(v10 + 24) = a3;
  v18 = sub_240B19F50;
  v19 = v10;
  aBlock = v7;
  v15 = 1107296256;
  v16 = sub_240B185E8;
  v17 = &block_descriptor_12;
  v11 = _Block_copy(&aBlock);
  swift_retain();
  swift_release();
  objc_msgSend(v13, sel_getEnabledInAccountWithSynchronize_completion_, a1 & 1, v11);
  _Block_release(v11);
  return swift_unknownObjectRelease();
}

void LockdownModeManager.setEnabled(enabled:options:completion:)(char a1, void *a2, void (*a3)(void), uint64_t a4)
{
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[6];

  v8 = sub_240B1831C((uint64_t)sub_240B182C0, (uint64_t)&block_descriptor_75, (SEL *)&selRef_remoteObjectProxyWithErrorHandler_);
  if (v8)
  {
    v9 = (void *)v8;
    if (a2)
      a2 = (void *)sub_240B1A844();
    v10 = swift_allocObject();
    *(_QWORD *)(v10 + 16) = a3;
    *(_QWORD *)(v10 + 24) = a4;
    v14[4] = sub_240B19FD8;
    v14[5] = v10;
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 1107296256;
    v14[2] = sub_240B18950;
    v14[3] = &block_descriptor_18;
    v11 = _Block_copy(v14);
    swift_retain();
    swift_release();
    objc_msgSend(v9, sel_setEnabledWithEnabled_options_completion_, a1 & 1, a2, v11);
    _Block_release(v11);
    swift_unknownObjectRelease();

  }
  else
  {
    sub_240B19F70();
    v12 = (void *)swift_allocError();
    v13 = (void *)sub_240B1A814();
    a3();

  }
}

void sub_240B18950(uint64_t a1, void *a2)
{
  void (*v3)(void *);
  id v4;

  v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3(a2);
  swift_release();

}

Swift::Void __swiftcall LockdownModeManager.notifyRestrictionChanged(_:)(Swift::String a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  os_log_type_t v6;
  uint8_t *v7;
  NSObject *oslog;
  _QWORD aBlock[6];

  if ((_s12LockdownMode0aB7ManagerC7enabledSbvg_0() & 1) != 0)
  {
    v1 = sub_240B1831C((uint64_t)sub_240B18400, (uint64_t)&block_descriptor_72, (SEL *)&selRef_synchronousRemoteObjectProxyWithErrorHandler_);
    if (v1)
    {
      v2 = (void *)v1;
      v3 = (void *)sub_240B1A85C();
      aBlock[4] = sub_240B18BE0;
      aBlock[5] = 0;
      aBlock[0] = MEMORY[0x24BDAC760];
      aBlock[1] = 1107296256;
      aBlock[2] = sub_240B18950;
      aBlock[3] = &block_descriptor_21;
      v4 = _Block_copy(aBlock);
      objc_msgSend(v2, sel_notifyRestrictionChanged_completion_, v3, v4);
      swift_unknownObjectRelease();
      _Block_release(v4);

    }
  }
  else
  {
    if (qword_257087DE0 != -1)
      swift_once();
    v5 = sub_240B1A838();
    __swift_project_value_buffer(v5, (uint64_t)qword_257087E08);
    oslog = sub_240B1A820();
    v6 = sub_240B1A88C();
    if (os_log_type_enabled(oslog, v6))
    {
      v7 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_240B16000, oslog, v6, "Lockdown Mode is off. No need to update restriction", v7, 2u);
      MEMORY[0x2426898AC](v7, -1, -1);
    }

  }
}

void sub_240B18BE0(void *a1)
{
  sub_240B19408(a1, "Could not notify of restriction change: %@");
}

uint64_t LockdownModeManager.enableIfNeeded(reboot:completion:)(char a1, uint64_t a2, uint64_t a3)
{
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v13;
  uint64_t aBlock;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;

  v6 = sub_240B17F0C();
  v18 = sub_240B182C0;
  v19 = 0;
  v7 = MEMORY[0x24BDAC760];
  aBlock = MEMORY[0x24BDAC760];
  v15 = 1107296256;
  v16 = sub_240B182CC;
  v17 = &block_descriptor_24;
  v8 = _Block_copy(&aBlock);
  v9 = objc_msgSend(v6, sel_synchronousRemoteObjectProxyWithErrorHandler_, v8);
  _Block_release(v8);

  sub_240B1A8B0();
  swift_unknownObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_257087E20);
  swift_dynamicCast();
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = a2;
  *(_QWORD *)(v10 + 24) = a3;
  v18 = sub_240B19FF0;
  v19 = v10;
  aBlock = v7;
  v15 = 1107296256;
  v16 = sub_240B1903C;
  v17 = &block_descriptor_30;
  v11 = _Block_copy(&aBlock);
  swift_retain();
  swift_release();
  objc_msgSend(v13, sel_enableIfNeededWithReboot_completion_, a1 & 1, v11);
  _Block_release(v11);
  return swift_unknownObjectRelease();
}

void sub_240B18E10(void *a1, const char *a2)
{
  uint64_t v4;
  id v5;
  id v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  NSObject *oslog;
  uint64_t v13;

  if (qword_257087DE0 != -1)
    swift_once();
  v4 = sub_240B1A838();
  __swift_project_value_buffer(v4, (uint64_t)qword_257087E08);
  v5 = a1;
  v6 = a1;
  oslog = sub_240B1A820();
  v7 = sub_240B1A880();
  if (os_log_type_enabled(oslog, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc();
    v9 = swift_slowAlloc();
    v13 = v9;
    *(_DWORD *)v8 = 136315138;
    swift_getErrorValue();
    v10 = sub_240B1A8EC();
    sub_240B198AC(v10, v11, &v13);
    sub_240B1A898();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_240B16000, oslog, v7, a2, v8, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2426898AC](v9, -1, -1);
    MEMORY[0x2426898AC](v8, -1, -1);

  }
  else
  {

  }
}

void sub_240B18FE8(char a1, uint64_t a2, void (*a3)(_QWORD))
{
  id v5;

  if (a2)
    a2 = sub_240B1A814();
  v5 = (id)a2;
  a3(a1 & 1);

}

void sub_240B1903C(uint64_t a1, uint64_t a2, void *a3)
{
  void (*v5)(uint64_t, void *);
  id v6;

  v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  swift_retain();
  v6 = a3;
  v5(a2, a3);
  swift_release();

}

uint64_t sub_240B190B8(void *a1, int a2, uint64_t a3, void *aBlock, uint64_t a5, uint64_t a6, void (*a7)(uint64_t, uint64_t, uint64_t))
{
  void *v11;
  uint64_t v12;
  id v13;

  v11 = _Block_copy(aBlock);
  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = v11;
  v13 = a1;
  a7(a3, a6, v12);

  return swift_release();
}

void LockdownModeManager.migrateIfNeeded(completion:)(void (*a1)(void), uint64_t a2)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[6];

  v4 = sub_240B1831C((uint64_t)sub_240B182C0, (uint64_t)&block_descriptor_75, (SEL *)&selRef_remoteObjectProxyWithErrorHandler_);
  if (v4)
  {
    v5 = (void *)v4;
    v6 = swift_allocObject();
    *(_QWORD *)(v6 + 16) = a1;
    *(_QWORD *)(v6 + 24) = a2;
    v10[4] = sub_240B1A604;
    v10[5] = v6;
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 1107296256;
    v10[2] = sub_240B18950;
    v10[3] = &block_descriptor_36;
    v7 = _Block_copy(v10);
    swift_retain();
    swift_release();
    objc_msgSend(v5, sel_migrateIfNeededWithCompletion_, v7);
    _Block_release(v7);
    swift_unknownObjectRelease();
  }
  else
  {
    sub_240B19F70();
    v8 = (void *)swift_allocError();
    v9 = (void *)sub_240B1A814();
    a1();

  }
}

void sub_240B1927C(uint64_t a1, void (*a2)(void))
{
  id v3;

  if (a1)
    a1 = sub_240B1A814();
  v3 = (id)a1;
  a2();

}

Swift::Void __swiftcall LockdownModeManager.rebootIfNeeded()()
{
  uint64_t v0;
  void *v1;
  void *v2;
  _QWORD v3[6];

  v0 = sub_240B1831C((uint64_t)sub_240B18400, (uint64_t)&block_descriptor_72, (SEL *)&selRef_synchronousRemoteObjectProxyWithErrorHandler_);
  if (v0)
  {
    v1 = (void *)v0;
    v3[4] = sub_240B193BC;
    v3[5] = 0;
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 1107296256;
    v3[2] = sub_240B18950;
    v3[3] = &block_descriptor_39;
    v2 = _Block_copy(v3);
    objc_msgSend(v1, sel_rebootIfNeededWithCompletion_, v2);
    swift_unknownObjectRelease();
    _Block_release(v2);
  }
}

void sub_240B193BC(void *a1)
{
  sub_240B19408(a1, "Could not call rebootIfNeeded: %@");
}

void sub_240B19408(void *a1, const char *a2)
{
  uint64_t v4;
  id v5;
  id v6;
  os_log_type_t v7;
  uint8_t *v8;
  _QWORD *v9;
  id v10;
  uint64_t v11;
  NSObject *oslog;

  if (qword_257087DE0 != -1)
    swift_once();
  v4 = sub_240B1A838();
  __swift_project_value_buffer(v4, (uint64_t)qword_257087E08);
  v5 = a1;
  v6 = a1;
  oslog = sub_240B1A820();
  v7 = sub_240B1A880();
  if (os_log_type_enabled(oslog, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc();
    v9 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v8 = 138412290;
    if (a1)
    {
      v10 = a1;
      v11 = _swift_stdlib_bridgeErrorToNSError();
      sub_240B1A898();
    }
    else
    {
      sub_240B1A898();
      v11 = 0;
    }
    *v9 = v11;

    _os_log_impl(&dword_240B16000, oslog, v7, a2, v8, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_257087E40);
    swift_arrayDestroy();
    MEMORY[0x2426898AC](v9, -1, -1);
    MEMORY[0x2426898AC](v8, -1, -1);

  }
  else
  {

  }
}

id LockdownModeManager.init()()
{
  char *v0;
  objc_class *ObjectType;
  objc_super v3;

  ObjectType = (objc_class *)swift_getObjectType();
  *(_QWORD *)&v0[OBJC_IVAR___LockdownModeManagerInternal____lazy_storage___connection] = 0;
  v3.receiver = v0;
  v3.super_class = ObjectType;
  return objc_msgSendSuper2(&v3, sel_init);
}

id LockdownModeManager.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t static LockdownModeManagerError.== infix(_:_:)()
{
  return 1;
}

uint64_t LockdownModeManagerError.hash(into:)()
{
  return sub_240B1A934();
}

uint64_t LockdownModeManagerError.hashValue.getter()
{
  sub_240B1A928();
  sub_240B1A934();
  return sub_240B1A940();
}

uint64_t sub_240B197F4()
{
  return 1;
}

uint64_t sub_240B197FC()
{
  sub_240B1A928();
  sub_240B1A934();
  return sub_240B1A940();
}

uint64_t sub_240B1983C()
{
  return sub_240B1A934();
}

uint64_t sub_240B19860()
{
  sub_240B1A928();
  sub_240B1A934();
  return sub_240B1A940();
}

uint64_t sub_240B198AC(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_240B1997C(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_240B1A524((uint64_t)v12, *a3);
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
      sub_240B1A524((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_240B1997C(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_240B1A8A4();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_240B19B34(a5, a6);
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
  v8 = sub_240B1A8C8();
  if (!v8)
  {
    sub_240B1A8D4();
    __break(1u);
LABEL_17:
    result = sub_240B1A8E0();
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

uint64_t sub_240B19B34(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_240B19BC8(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_240B19DA0(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_240B19DA0(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_240B19BC8(uint64_t a1, unint64_t a2)
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
      v3 = sub_240B19D3C(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_240B1A8BC();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_240B1A8D4();
      __break(1u);
LABEL_10:
      v2 = sub_240B1A874();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_240B1A8E0();
    __break(1u);
LABEL_14:
    result = sub_240B1A8D4();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_240B19D3C(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_257087E48);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_240B19DA0(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_257087E48);
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
  result = sub_240B1A8E0();
  __break(1u);
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

uint64_t sub_240B19F04()
{
  return swift_deallocObject();
}

uint64_t sub_240B19F14(char a1)
{
  uint64_t v1;
  uint64_t result;

  result = swift_beginAccess();
  *(_BYTE *)(v1 + 16) = a1;
  return result;
}

uint64_t sub_240B19F50()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

unint64_t sub_240B19F70()
{
  unint64_t result;

  result = qword_257087E28;
  if (!qword_257087E28)
  {
    result = MEMORY[0x242689858](&protocol conformance descriptor for LockdownModeManagerError, &type metadata for LockdownModeManagerError);
    atomic_store(result, (unint64_t *)&qword_257087E28);
  }
  return result;
}

uint64_t sub_240B19FB4()
{
  swift_release();
  return swift_deallocObject();
}

void sub_240B19FD8(uint64_t a1)
{
  uint64_t v1;

  sub_240B1927C(a1, *(void (**)(void))(v1 + 16));
}

void sub_240B19FF0(char a1, uint64_t a2)
{
  uint64_t v2;

  sub_240B18FE8(a1, a2, *(void (**)(_QWORD))(v2 + 16));
}

unint64_t sub_240B19FFC()
{
  unint64_t result;

  result = qword_257087E38;
  if (!qword_257087E38)
  {
    result = MEMORY[0x242689858](&protocol conformance descriptor for LockdownModeManagerError, &type metadata for LockdownModeManagerError);
    atomic_store(result, (unint64_t *)&qword_257087E38);
  }
  return result;
}

uint64_t type metadata accessor for LockdownModeManager()
{
  return objc_opt_self();
}

uint64_t getEnumTagSinglePayload for LockdownModeManagerError(unsigned int *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for LockdownModeManagerError(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_240B1A0F8 + 4 * byte_240B1AE10[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_240B1A118 + 4 * byte_240B1AE15[v4]))();
}

_BYTE *sub_240B1A0F8(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_240B1A118(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_240B1A120(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_240B1A128(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_240B1A130(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_240B1A138(_DWORD *result)
{
  *result = 0;
  return result;
}

uint64_t sub_240B1A144()
{
  return 0;
}

ValueMetadata *type metadata accessor for LockdownModeManagerError()
{
  return &type metadata for LockdownModeManagerError;
}

void sub_240B1A160(char a1, uint64_t a2, uint64_t a3, void (**a4)(_QWORD, _QWORD))
{
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  _QWORD v15[6];

  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = a4;
  _Block_copy(a4);
  v8 = sub_240B1831C((uint64_t)sub_240B182C0, (uint64_t)&block_descriptor_75, (SEL *)&selRef_remoteObjectProxyWithErrorHandler_);
  if (v8)
  {
    v9 = (void *)v8;
    if (a2)
      v10 = (void *)sub_240B1A844();
    else
      v10 = 0;
    v13 = swift_allocObject();
    *(_QWORD *)(v13 + 16) = sub_240B1A608;
    *(_QWORD *)(v13 + 24) = v7;
    v15[4] = sub_240B1A604;
    v15[5] = v13;
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 1107296256;
    v15[2] = sub_240B18950;
    v15[3] = &block_descriptor_66;
    v14 = _Block_copy(v15);
    swift_retain();
    swift_release();
    objc_msgSend(v9, sel_setEnabledWithEnabled_options_completion_, a1 & 1, v10, v14);
    _Block_release(v14);
    swift_release();
    swift_unknownObjectRelease();

  }
  else
  {
    sub_240B19F70();
    v11 = (void *)swift_allocError();
    v12 = (void *)sub_240B1A814();
    ((void (**)(_QWORD, void *))a4)[2](a4, v12);

    swift_release();
  }
}

uint64_t sub_240B1A32C(uint64_t a1, void (**a2)(_QWORD, _QWORD))
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v9;
  void *v10;
  _QWORD v11[6];

  v3 = swift_allocObject();
  *(_QWORD *)(v3 + 16) = a2;
  _Block_copy(a2);
  v4 = sub_240B1831C((uint64_t)sub_240B182C0, (uint64_t)&block_descriptor_75, (SEL *)&selRef_remoteObjectProxyWithErrorHandler_);
  if (v4)
  {
    v5 = (void *)v4;
    v6 = swift_allocObject();
    *(_QWORD *)(v6 + 16) = sub_240B1A4C8;
    *(_QWORD *)(v6 + 24) = v3;
    v11[4] = sub_240B1A604;
    v11[5] = v6;
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 1107296256;
    v11[2] = sub_240B18950;
    v11[3] = &block_descriptor_52;
    v7 = _Block_copy(v11);
    swift_retain();
    swift_release();
    objc_msgSend(v5, sel_migrateIfNeededWithCompletion_, v7);
    _Block_release(v7);
    swift_release();
    return swift_unknownObjectRelease();
  }
  else
  {
    sub_240B19F70();
    v9 = (void *)swift_allocError();
    v10 = (void *)sub_240B1A814();
    ((void (**)(_QWORD, void *))a2)[2](a2, v10);

    return swift_release();
  }
}

uint64_t sub_240B1A4A4()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

uint64_t sub_240B1A4C8()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 16) + 16))();
}

uint64_t sub_240B1A4D8(char a1, uint64_t a2)
{
  uint64_t v2;

  return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t))(*(_QWORD *)(v2 + 16) + 16))(*(_QWORD *)(v2 + 16), a1 & 1, a2);
}

uint64_t sub_240B1A4F0(char a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(v1 + 16) + 16))(*(_QWORD *)(v1 + 16), a1 & 1);
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

uint64_t sub_240B1A524(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t static Constants.userDefaultsKey.getter()
{
  return 0xD000000000000010;
}

unint64_t static Constants.serviceName.getter()
{
  return 0xD000000000000017;
}

void sub_240B1A644()
{
  qword_257087E50 = 0x746F6F626572;
  *(_QWORD *)algn_257087E58 = 0xE600000000000000;
}

uint64_t static Constants.stateOptionReboot.getter()
{
  return sub_240B1A760(&qword_257087DE8, &qword_257087E50);
}

void sub_240B1A684()
{
  qword_257087E60 = 0x65646F6373736170;
  *(_QWORD *)algn_257087E68 = 0xE800000000000000;
}

uint64_t static Constants.stateOptionPasscode.getter()
{
  return sub_240B1A760(&qword_257087DF0, &qword_257087E60);
}

void sub_240B1A6C8()
{
  qword_257087E70 = 0x63697665446C6C61;
  *(_QWORD *)algn_257087E78 = 0xEA00000000007365;
}

uint64_t static Constants.stateOptionAllDevices.getter()
{
  return sub_240B1A760(&qword_257087DF8, &qword_257087E70);
}

void sub_240B1A710()
{
  strcpy((char *)&qword_257087E80, "includePaired");
  *(_WORD *)&algn_257087E88[6] = -4864;
}

uint64_t static Constants.stateOptionIncludePaired.getter()
{
  return sub_240B1A760(&qword_257087E00, &qword_257087E80);
}

uint64_t sub_240B1A760(_QWORD *a1, uint64_t *a2)
{
  uint64_t v3;

  if (*a1 != -1)
    swift_once();
  v3 = *a2;
  swift_bridgeObjectRetain();
  return v3;
}

unint64_t static Constants.stateOptionAcknowledgementOnly.getter()
{
  return 0xD000000000000013;
}

unint64_t static Constants.stateOptionExcludeRestrictions.getter()
{
  return 0xD000000000000013;
}

unint64_t static Constants.stateOptionRequireAuthentication.getter()
{
  return 0xD000000000000015;
}

ValueMetadata *type metadata accessor for Constants()
{
  return &type metadata for Constants;
}

uint64_t sub_240B1A814()
{
  return MEMORY[0x24BDCD2F0]();
}

uint64_t sub_240B1A820()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_240B1A82C()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_240B1A838()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_240B1A844()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_240B1A850()
{
  return MEMORY[0x24BDCF830]();
}

uint64_t sub_240B1A85C()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_240B1A868()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_240B1A874()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_240B1A880()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_240B1A88C()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_240B1A898()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_240B1A8A4()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_240B1A8B0()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_240B1A8BC()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_240B1A8C8()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_240B1A8D4()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_240B1A8E0()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_240B1A8EC()
{
  return MEMORY[0x24BDD0708]();
}

uint64_t sub_240B1A8F8()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_240B1A904()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_240B1A910()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_240B1A91C()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_240B1A928()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_240B1A934()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_240B1A940()
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

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x24BEE4B30]();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
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

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x24BEDD0B0](self, _cmd, offset, atomic);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD108](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
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

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
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

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x24BDB0100](a1, a2, a3, a4, a5);
}

