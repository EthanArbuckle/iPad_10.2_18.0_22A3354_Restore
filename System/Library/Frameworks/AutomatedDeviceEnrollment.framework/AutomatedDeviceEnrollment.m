uint64_t sub_23304F674()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2330566B8();
  swift_release();
  return swift_release();
}

uint64_t sub_23304F6D8(uint64_t a1, uint64_t a2, int a3)
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
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  int v43;

  v43 = a3;
  v42 = a2;
  v38 = a1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256030FF0);
  v36 = *(_QWORD *)(v4 - 8);
  v37 = v4;
  MEMORY[0x24BDAC7A8](v4);
  v35 = (char *)&v34 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v40 = type metadata accessor for AddDevicesToAutomatedDeviceEnrollmentViewModel.addDevicesExtensionViewType(0);
  v6 = MEMORY[0x24BDAC7A8](v40);
  v41 = (uint64_t)&v34 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v39 = (char *)&v34 - v8;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256030FB8);
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v34 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = type metadata accessor for AddDevicesExtensionStatus(0);
  v14 = MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)&v34 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v14);
  v18 = (char *)&v34 - v17;
  type metadata accessor for AutomatedDeviceEnrollmentAdditionExtensionTerminal(0);
  v19 = swift_allocObject();
  v20 = v19
      + OBJC_IVAR____TtC25AutomatedDeviceEnrollment50AutomatedDeviceEnrollmentAdditionExtensionTerminal__extensionStatus;
  v21 = sub_233056964();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 56))(v18, 1, 4, v21);
  sub_2330519CC((uint64_t)v18, (uint64_t)v16, type metadata accessor for AddDevicesExtensionStatus);
  sub_2330566A0();
  sub_233051A10((uint64_t)v18, type metadata accessor for AddDevicesExtensionStatus);
  (*(void (**)(uint64_t, char *, uint64_t))(v10 + 32))(v20, v12, v9);
  v22 = v19
      + OBJC_IVAR____TtC25AutomatedDeviceEnrollment50AutomatedDeviceEnrollmentAdditionExtensionTerminal_addDevicesExtensionIdentity;
  v23 = sub_23305664C();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 56))(v22, 1, 1, v23);
  *(_QWORD *)(v19
            + OBJC_IVAR____TtC25AutomatedDeviceEnrollment50AutomatedDeviceEnrollmentAdditionExtensionTerminal_extensionXPCConnection) = 0;
  *(_QWORD *)(v3 + 16) = v19;
  if ((MEMORY[0x24BEE4AF8] & 0xC000000000000000) != 0 && sub_2330569DC())
    v24 = sub_233051BE8(MEMORY[0x24BEE4AF8]);
  else
    v24 = MEMORY[0x24BEE4B08];
  v26 = v37;
  v25 = v38;
  v28 = v35;
  v27 = v36;
  v29 = v3;
  *(_QWORD *)(v3 + 24) = v24;
  v30 = v3
      + OBJC_IVAR____TtC25AutomatedDeviceEnrollment46AddDevicesToAutomatedDeviceEnrollmentViewModel__viewTypeToPresent;
  v31 = (uint64_t)v39;
  swift_storeEnumTagMultiPayload();
  sub_2330519CC(v31, v41, type metadata accessor for AddDevicesToAutomatedDeviceEnrollmentViewModel.addDevicesExtensionViewType);
  sub_2330566A0();
  sub_233051A10(v31, type metadata accessor for AddDevicesToAutomatedDeviceEnrollmentViewModel.addDevicesExtensionViewType);
  (*(void (**)(uint64_t, char *, uint64_t))(v27 + 32))(v30, v28, v26);
  v32 = v42;
  *(_QWORD *)(v29 + 32) = v25;
  *(_QWORD *)(v29 + 40) = v32;
  *(_BYTE *)(v29 + 48) = v43 & 1;
  return v29;
}

uint64_t sub_23304F9F0()
{
  uint64_t v0;
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
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  char *v20;
  id v21;

  v1 = v0;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256030F68);
  MEMORY[0x24BDAC7A8](v2);
  v20 = (char *)&v20 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256030FA0);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256030FA8);
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_256030FB0);
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v20 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256030FB8);
  sub_2330566AC();
  swift_endAccess();
  sub_233051A4C();
  v21 = (id)sub_23305694C();
  v15 = sub_233056940();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56))(v6, 1, 1, v15);
  sub_233051B0C(&qword_256030FC8, &qword_256030FA8, MEMORY[0x24BDB9EE8]);
  sub_233051E7C(&qword_256030FD0, (uint64_t (*)(uint64_t))sub_233051A4C, MEMORY[0x24BEE5670]);
  sub_2330566DC();
  sub_233051ACC((uint64_t)v6, &qword_256030FA0);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  sub_233051B0C(&qword_256030FD8, &qword_256030FB0, MEMORY[0x24BDB9A08]);
  swift_retain();
  sub_2330566E8();
  swift_release();
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  swift_beginAccess();
  sub_23305667C();
  swift_endAccess();
  swift_release();
  v16 = sub_233056904();
  v17 = (uint64_t)v20;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(v20, 1, 1, v16);
  v18 = (_QWORD *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = v1;
  swift_retain();
  sub_233050188(v17, (uint64_t)&unk_256030FE8, (uint64_t)v18);
  return swift_release();
}

uint64_t sub_23304FD18(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;

  v4[4] = a4;
  sub_233056598();
  v4[5] = swift_task_alloc();
  sub_233056898();
  v4[6] = swift_task_alloc();
  v4[7] = type metadata accessor for AddDevicesToAutomatedDeviceEnrollmentViewModel.addDevicesExtensionViewType(0);
  v4[8] = swift_task_alloc();
  v4[9] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23304FDC4()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 80) = v1;
  *v1 = v0;
  v1[1] = sub_23304FE10;
  return sub_233051FDC();
}

uint64_t sub_23304FE10()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 88) = v0;
  swift_task_dealloc();
  if (v0)
    return swift_task_switch();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_23304FEAC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  BOOL v5;
  void *v6;
  uint8_t *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;

  if (qword_256030D70 != -1)
    swift_once();
  v1 = *(_QWORD *)(v0 + 88);
  v2 = sub_233056670();
  __swift_project_value_buffer(v2, (uint64_t)qword_256031660);
  MEMORY[0x23492D378](v1);
  MEMORY[0x23492D378](v1);
  v3 = sub_233056658();
  v4 = sub_233056928();
  v5 = os_log_type_enabled(v3, v4);
  v6 = *(void **)(v0 + 88);
  if (v5)
  {
    v7 = (uint8_t *)swift_slowAlloc();
    v8 = swift_slowAlloc();
    v16 = v8;
    *(_DWORD *)v7 = 136315138;
    *(_QWORD *)(v0 + 16) = v6;
    MEMORY[0x23492D378](v6);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256030F90);
    v9 = sub_2330568C8();
    *(_QWORD *)(v0 + 24) = sub_233054120(v9, v10, &v16);
    sub_23305697C();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_23304E000, v3, v4, "queryExtensionAndSetupConfiguration failed with error '%s'", v7, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23492D474](v8, -1, -1);
    MEMORY[0x23492D474](v7, -1, -1);
  }
  else
  {

  }
  v11 = *(void **)(v0 + 88);
  v13 = *(_QWORD *)(v0 + 64);
  v12 = *(uint64_t **)(v0 + 72);
  sub_23305688C();
  sub_23305658C();
  *v12 = sub_2330568BC();
  v12[1] = v14;
  swift_storeEnumTagMultiPayload();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2330519CC((uint64_t)v12, v13, type metadata accessor for AddDevicesToAutomatedDeviceEnrollmentViewModel.addDevicesExtensionViewType);
  swift_retain();
  sub_2330566C4();
  sub_233051A10((uint64_t)v12, type metadata accessor for AddDevicesToAutomatedDeviceEnrollmentViewModel.addDevicesExtensionViewType);

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_233050188(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_233056904();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_2330568F8();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_233051ACC(a1, &qword_256030F68);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_2330568E0();
    swift_unknownObjectRelease();
  }
LABEL_5:
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_2330502D4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  NSObject *v23;
  os_log_type_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  int v33;
  uint64_t v34;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  uint64_t *v40;
  uint64_t v41;
  char *v42;
  char *v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49[2];

  v2 = v1;
  sub_233056598();
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v44 = (char *)&v37 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_233056898();
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v43 = (char *)&v37 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_233056964();
  v7 = *(_QWORD *)(v6 - 8);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v42 = (char *)&v37 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v45 = type metadata accessor for AddDevicesToAutomatedDeviceEnrollmentViewModel.addDevicesExtensionViewType(0);
  v9 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v11 = (char *)&v37 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v13 = (uint64_t *)((char *)&v37 - v12);
  v14 = type metadata accessor for AddDevicesExtensionStatus(0);
  v15 = MEMORY[0x24BDAC7A8](v14);
  v46 = (uint64_t)&v37 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = MEMORY[0x24BDAC7A8](v15);
  v19 = (char *)&v37 - v18;
  MEMORY[0x24BDAC7A8](v17);
  v21 = (char *)&v37 - v20;
  if (qword_256030D70 != -1)
    swift_once();
  v22 = sub_233056670();
  __swift_project_value_buffer(v22, (uint64_t)qword_256031660);
  v47 = a1;
  sub_2330519CC(a1, (uint64_t)v21, type metadata accessor for AddDevicesExtensionStatus);
  v23 = sub_233056658();
  v24 = sub_23305691C();
  if (os_log_type_enabled(v23, v24))
  {
    v25 = swift_slowAlloc();
    v39 = v11;
    v26 = v25;
    v27 = swift_slowAlloc();
    v41 = v2;
    v28 = v27;
    v49[0] = v27;
    *(_DWORD *)v26 = 136315394;
    v40 = v13;
    v48 = sub_233054120(0xD000000000000028, 0x80000002330573D0, v49);
    v38 = v7;
    sub_23305697C();
    *(_WORD *)(v26 + 12) = 2080;
    sub_2330519CC((uint64_t)v21, (uint64_t)v19, type metadata accessor for AddDevicesExtensionStatus);
    v29 = sub_2330568C8();
    v48 = sub_233054120(v29, v30, v49);
    v7 = v38;
    v13 = v40;
    sub_23305697C();
    swift_bridgeObjectRelease();
    sub_233051A10((uint64_t)v21, type metadata accessor for AddDevicesExtensionStatus);
    _os_log_impl(&dword_23304E000, v23, v24, "%s extension status updated to %s", (uint8_t *)v26, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x23492D474](v28, -1, -1);
    v31 = v26;
    v11 = v39;
    MEMORY[0x23492D474](v31, -1, -1);
  }
  else
  {
    sub_233051A10((uint64_t)v21, type metadata accessor for AddDevicesExtensionStatus);
  }

  v32 = v46;
  sub_2330519CC(v47, v46, type metadata accessor for AddDevicesExtensionStatus);
  v33 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v32, 4, v6);
  if ((v33 - 1) < 2)
    goto LABEL_9;
  if ((v33 - 3) < 2)
  {
    sub_23305688C();
    sub_23305658C();
    *v13 = sub_2330568BC();
    v13[1] = v34;
LABEL_9:
    swift_storeEnumTagMultiPayload();
    swift_getKeyPath();
    swift_getKeyPath();
    sub_2330519CC((uint64_t)v13, (uint64_t)v11, type metadata accessor for AddDevicesToAutomatedDeviceEnrollmentViewModel.addDevicesExtensionViewType);
    swift_retain();
    sub_2330566C4();
    return sub_233051A10((uint64_t)v13, type metadata accessor for AddDevicesToAutomatedDeviceEnrollmentViewModel.addDevicesExtensionViewType);
  }
  v36 = v42;
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 32))(v42, v32, v6);
  (*(void (**)(uint64_t *, char *, uint64_t))(v7 + 16))(v13, v36, v6);
  swift_storeEnumTagMultiPayload();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2330519CC((uint64_t)v13, (uint64_t)v11, type metadata accessor for AddDevicesToAutomatedDeviceEnrollmentViewModel.addDevicesExtensionViewType);
  swift_retain();
  sub_2330566C4();
  sub_233051A10((uint64_t)v13, type metadata accessor for AddDevicesToAutomatedDeviceEnrollmentViewModel.addDevicesExtensionViewType);
  sub_233050864();
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v36, v6);
}

uint64_t sub_233050864()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v13[4];

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256030F68);
  MEMORY[0x24BDAC7A8]();
  v3 = (char *)v13 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_233056904();
  v5 = *(_QWORD *)(v4 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56))(v3, 1, 1, v4);
  v6 = (_QWORD *)swift_allocObject();
  v6[2] = 0;
  v6[3] = 0;
  v6[4] = v1;
  v7 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4);
  swift_retain();
  if (v7 == 1)
  {
    sub_233051ACC((uint64_t)v3, &qword_256030F68);
    v8 = 0;
    v9 = 0;
  }
  else
  {
    sub_2330568F8();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v3, v4);
    if (v6[2])
    {
      swift_getObjectType();
      swift_unknownObjectRetain();
      v8 = sub_2330568E0();
      v9 = v10;
      swift_unknownObjectRelease();
    }
    else
    {
      v8 = 0;
      v9 = 0;
    }
  }
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = &unk_256030F78;
  *(_QWORD *)(v11 + 24) = v6;
  if (v9 | v8)
  {
    v13[0] = 0;
    v13[1] = 0;
    v13[2] = v8;
    v13[3] = v9;
  }
  swift_task_create();
  return swift_release();
}

uint64_t sub_233050A38(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;

  v4[4] = a4;
  sub_233056598();
  v4[5] = swift_task_alloc();
  sub_233056898();
  v4[6] = swift_task_alloc();
  v4[7] = type metadata accessor for AddDevicesToAutomatedDeviceEnrollmentViewModel.addDevicesExtensionViewType(0);
  v4[8] = swift_task_alloc();
  v4[9] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_233050AE4()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 80) = v1;
  *v1 = v0;
  v1[1] = sub_233050B38;
  return sub_2330529B8(*(_QWORD *)(v0 + 32));
}

uint64_t sub_233050B38()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 88) = v0;
  swift_task_dealloc();
  if (v0)
    return swift_task_switch();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_233050BD4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  BOOL v5;
  void *v6;
  uint8_t *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;

  if (qword_256030D70 != -1)
    swift_once();
  v1 = *(_QWORD *)(v0 + 88);
  v2 = sub_233056670();
  __swift_project_value_buffer(v2, (uint64_t)qword_256031660);
  MEMORY[0x23492D378](v1);
  MEMORY[0x23492D378](v1);
  v3 = sub_233056658();
  v4 = sub_233056928();
  v5 = os_log_type_enabled(v3, v4);
  v6 = *(void **)(v0 + 88);
  if (v5)
  {
    v7 = (uint8_t *)swift_slowAlloc();
    v8 = swift_slowAlloc();
    v16 = v8;
    *(_DWORD *)v7 = 136315138;
    *(_QWORD *)(v0 + 16) = v6;
    MEMORY[0x23492D378](v6);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256030F90);
    v9 = sub_2330568C8();
    *(_QWORD *)(v0 + 24) = sub_233054120(v9, v10, &v16);
    sub_23305697C();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_23304E000, v3, v4, "setupXPCConnectionWithExtension failed with error '%s'", v7, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23492D474](v8, -1, -1);
    MEMORY[0x23492D474](v7, -1, -1);
  }
  else
  {

  }
  v11 = *(void **)(v0 + 88);
  v13 = *(_QWORD *)(v0 + 64);
  v12 = *(uint64_t **)(v0 + 72);
  sub_23305688C();
  sub_23305658C();
  *v12 = sub_2330568BC();
  v12[1] = v14;
  swift_storeEnumTagMultiPayload();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2330519CC((uint64_t)v12, v13, type metadata accessor for AddDevicesToAutomatedDeviceEnrollmentViewModel.addDevicesExtensionViewType);
  swift_retain();
  sub_2330566C4();
  sub_233051A10((uint64_t)v12, type metadata accessor for AddDevicesToAutomatedDeviceEnrollmentViewModel.addDevicesExtensionViewType);

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_233050EB0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  v1 = v0
     + OBJC_IVAR____TtC25AutomatedDeviceEnrollment46AddDevicesToAutomatedDeviceEnrollmentViewModel__viewTypeToPresent;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256030FF0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return swift_deallocClassInstance();
}

uint64_t sub_233050F24()
{
  return type metadata accessor for AddDevicesToAutomatedDeviceEnrollmentViewModel(0);
}

uint64_t type metadata accessor for AddDevicesToAutomatedDeviceEnrollmentViewModel(uint64_t a1)
{
  return sub_23305103C(a1, (uint64_t *)&unk_256030DA8);
}

void sub_233050F40()
{
  unint64_t v0;

  sub_233050FD4();
  if (v0 <= 0x3F)
    swift_updateClassMetadata2();
}

void sub_233050FD4()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_256030DB8[0])
  {
    type metadata accessor for AddDevicesToAutomatedDeviceEnrollmentViewModel.addDevicesExtensionViewType(255);
    v0 = sub_2330566D0();
    if (!v1)
      atomic_store(v0, qword_256030DB8);
  }
}

uint64_t type metadata accessor for AddDevicesToAutomatedDeviceEnrollmentViewModel.addDevicesExtensionViewType(uint64_t a1)
{
  return sub_23305103C(a1, qword_256030F28);
}

uint64_t sub_23305103C(uint64_t a1, uint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_233051070@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  type metadata accessor for AddDevicesToAutomatedDeviceEnrollmentViewModel(0);
  result = sub_233056694();
  *a1 = result;
  return result;
}

uint64_t sub_2330510AC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v10[2];
  char v11;

  v1 = v0;
  if (qword_256030D70 != -1)
    swift_once();
  v2 = sub_233056670();
  __swift_project_value_buffer(v2, (uint64_t)qword_256031660);
  v3 = sub_233056658();
  v4 = sub_233056934();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc();
    v6 = swift_slowAlloc();
    v10[0] = v6;
    *(_DWORD *)v5 = 136315138;
    sub_233054120(0xD000000000000033, 0x8000000233057300, v10);
    sub_23305697C();
    _os_log_impl(&dword_23304E000, v3, v4, "%s Dismissing extension UI", v5, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23492D474](v6, -1, -1);
    MEMORY[0x23492D474](v5, -1, -1);
  }

  v7 = *(_QWORD *)(v1 + 40);
  v8 = *(_BYTE *)(v1 + 48);
  v10[0] = *(_QWORD *)(v1 + 32);
  v10[1] = v7;
  v11 = v8;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256030F60);
  return sub_233056868();
}

uint64_t *sub_233051278(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    if (EnumCaseMultiPayload == 1)
    {
      v10 = a2[1];
      *a1 = *a2;
      a1[1] = v10;
      swift_bridgeObjectRetain();
      swift_storeEnumTagMultiPayload();
    }
    else if (EnumCaseMultiPayload)
    {
      memcpy(a1, a2, *(_QWORD *)(v5 + 64));
    }
    else
    {
      v8 = sub_233056964();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(a1, a2, v8);
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

uint64_t sub_233051350(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = swift_getEnumCaseMultiPayload();
  if ((_DWORD)result == 1)
    return swift_bridgeObjectRelease();
  if (!(_DWORD)result)
  {
    v3 = sub_233056964();
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  }
  return result;
}

_QWORD *sub_2330513B0(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  int EnumCaseMultiPayload;
  uint64_t v7;
  uint64_t v8;

  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 1)
  {
    v8 = a2[1];
    *a1 = *a2;
    a1[1] = v8;
    swift_bridgeObjectRetain();
    swift_storeEnumTagMultiPayload();
  }
  else if (EnumCaseMultiPayload)
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  else
  {
    v7 = sub_233056964();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

_QWORD *sub_233051460(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  int EnumCaseMultiPayload;
  uint64_t v7;

  if (a1 != a2)
  {
    sub_233051A10((uint64_t)a1, type metadata accessor for AddDevicesToAutomatedDeviceEnrollmentViewModel.addDevicesExtensionViewType);
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 1)
    {
      *a1 = *a2;
      a1[1] = a2[1];
      swift_bridgeObjectRetain();
      swift_storeEnumTagMultiPayload();
    }
    else if (EnumCaseMultiPayload)
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    }
    else
    {
      v7 = sub_233056964();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

void *sub_233051530(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6;

  if (swift_getEnumCaseMultiPayload())
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  else
  {
    v6 = sub_233056964();
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

void *sub_2330515B8(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6;

  if (a1 != a2)
  {
    sub_233051A10((uint64_t)a1, type metadata accessor for AddDevicesToAutomatedDeviceEnrollmentViewModel.addDevicesExtensionViewType);
    if (swift_getEnumCaseMultiPayload())
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    }
    else
    {
      v6 = sub_233056964();
      (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

uint64_t sub_233051658(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a3 - 8) + 48))();
}

uint64_t sub_233051664(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a4 - 8) + 56))();
}

uint64_t sub_233051678()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_233051688()
{
  uint64_t result;
  unint64_t v1;

  result = sub_233056964();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

uint64_t sub_2330516F4()
{
  return MEMORY[0x24BDB9D70];
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
    result = MEMORY[0x23492D3E4]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_233051758(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_2330517BC;
  return v6(a1);
}

uint64_t sub_2330517BC()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_23305180C(uint64_t a1)
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
  v7[1] = sub_233051878;
  return sub_233050A38(a1, v4, v5, v6);
}

uint64_t sub_233051878()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_2330518C0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_233051EBC;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_256030F80 + dword_256030F80))(a1, v4);
}

uint64_t sub_233051938()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23305195C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_233051878;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_256030F80 + dword_256030F80))(a1, v4);
}

uint64_t sub_2330519CC(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_233051A10(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v3;

  v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_233051A4C()
{
  unint64_t result;

  result = qword_256030FC0;
  if (!qword_256030FC0)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_256030FC0);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x23492D3F0](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_233051ACC(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_233051B0C(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x23492D3FC](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t objectdestroyTm()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_233051B7C(uint64_t a1)
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
  v7[1] = sub_233051EBC;
  return sub_23304FD18(a1, v4, v5, v6);
}

unint64_t sub_233051BE8(unint64_t result)
{
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t (*v8)(uint64_t);
  BOOL v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;

  v1 = result;
  v2 = result >> 62;
  if (result >> 62)
  {
    swift_bridgeObjectRetain();
    v5 = sub_2330569DC();
    result = swift_bridgeObjectRelease();
    if (v5)
    {
LABEL_3:
      __swift_instantiateConcreteTypeFromMangledName(&qword_256030FF8);
      result = sub_2330569A0();
      v3 = result;
      v19 = v1;
      if (!v2)
        goto LABEL_4;
LABEL_8:
      swift_bridgeObjectRetain();
      v4 = sub_2330569DC();
      result = swift_bridgeObjectRelease();
      if (!v4)
        return v3;
      goto LABEL_9;
    }
  }
  else if (*(_QWORD *)((result & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    goto LABEL_3;
  }
  v3 = MEMORY[0x24BEE4B08];
  v19 = v1;
  if (v2)
    goto LABEL_8;
LABEL_4:
  v4 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (!v4)
    return v3;
LABEL_9:
  v6 = 0;
  v7 = v3 + 56;
  v8 = (uint64_t (*)(uint64_t))MEMORY[0x24BDB9B60];
  v18 = v4;
  while ((v19 & 0xC000000000000001) != 0)
  {
    result = MEMORY[0x23492D1C8](v6, v19);
    v9 = __OFADD__(v6++, 1);
    if (v9)
      goto LABEL_26;
LABEL_18:
    v20 = result;
    sub_233056688();
    sub_233051E7C(&qword_256031000, v8, MEMORY[0x24BDB9B70]);
    result = sub_233056874();
    v10 = -1 << *(_BYTE *)(v3 + 32);
    v11 = result & ~v10;
    v12 = v11 >> 6;
    v13 = *(_QWORD *)(v7 + 8 * (v11 >> 6));
    v14 = 1 << v11;
    if (((1 << v11) & v13) != 0)
    {
      v15 = ~v10;
      sub_233051E7C(&qword_256031008, v8, MEMORY[0x24BDB9B78]);
      do
      {
        result = sub_233056880();
        if ((result & 1) != 0)
        {
          result = swift_release();
          v4 = v18;
          goto LABEL_11;
        }
        v11 = (v11 + 1) & v15;
        v12 = v11 >> 6;
        v13 = *(_QWORD *)(v7 + 8 * (v11 >> 6));
        v14 = 1 << v11;
      }
      while ((v13 & (1 << v11)) != 0);
      v4 = v18;
    }
    *(_QWORD *)(v7 + 8 * v12) = v14 | v13;
    *(_QWORD *)(*(_QWORD *)(v3 + 48) + 8 * v11) = v20;
    v16 = *(_QWORD *)(v3 + 16);
    v9 = __OFADD__(v16, 1);
    v17 = v16 + 1;
    if (v9)
      goto LABEL_27;
    *(_QWORD *)(v3 + 16) = v17;
LABEL_11:
    v8 = (uint64_t (*)(uint64_t))MEMORY[0x24BDB9B60];
    if (v6 == v4)
      return v3;
  }
  if (v6 >= *(_QWORD *)((v19 & 0xFFFFFFFFFFFFFF8) + 0x10))
    goto LABEL_28;
  result = swift_retain();
  v9 = __OFADD__(v6++, 1);
  if (!v9)
    goto LABEL_18;
LABEL_26:
  __break(1u);
LABEL_27:
  __break(1u);
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_233051E7C(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x23492D3FC](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_233051EC4()
{
  uint64_t v0;

  v0 = sub_233056670();
  __swift_allocate_value_buffer(v0, qword_256031660);
  __swift_project_value_buffer(v0, (uint64_t)qword_256031660);
  return sub_233056664();
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

uint64_t sub_233051F78()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2330566B8();
  swift_release();
  return swift_release();
}

uint64_t sub_233051FDC()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1[7] = v0;
  sub_2330565B0();
  v1[8] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2560311F8);
  v1[9] = swift_task_alloc();
  v1[10] = swift_task_alloc();
  v1[11] = swift_task_alloc();
  v2 = sub_23305664C();
  v1[12] = v2;
  v1[13] = *(_QWORD *)(v2 - 8);
  v1[14] = swift_task_alloc();
  v1[15] = swift_task_alloc();
  v1[16] = swift_task_alloc();
  v3 = sub_2330565C8();
  v1[17] = v3;
  v1[18] = *(_QWORD *)(v3 - 8);
  v1[19] = swift_task_alloc();
  v4 = sub_2330565D4();
  v1[20] = v4;
  v1[21] = *(_QWORD *)(v4 - 8);
  v1[22] = swift_task_alloc();
  v1[23] = swift_task_alloc();
  v5 = sub_2330565EC();
  v1[24] = v5;
  v1[25] = *(_QWORD *)(v5 - 8);
  v1[26] = swift_task_alloc();
  type metadata accessor for AddDevicesExtensionStatus(0);
  v1[27] = swift_task_alloc();
  v1[28] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_233052170()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t, uint64_t);
  _QWORD *v8;
  uint64_t v10;

  v2 = v0[27];
  v1 = v0[28];
  v3 = v0[22];
  v4 = v0[23];
  v5 = v0[20];
  v10 = v0[21];
  v6 = sub_233056964();
  v0[29] = v6;
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56);
  v0[30] = v7;
  v7(v1, 2, 4, v6);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_233054794(v1, v2);
  swift_retain();
  sub_2330566C4();
  sub_2330547D8(v1);
  sub_2330565BC();
  sub_2330565E0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 16))(v3, v4, v5);
  sub_233051E7C(&qword_256031210, (uint64_t (*)(uint64_t))MEMORY[0x24BDC7820], MEMORY[0x24BDC7830]);
  sub_233056910();
  sub_233051E7C(&qword_256031218, (uint64_t (*)(uint64_t))MEMORY[0x24BDC7808], MEMORY[0x24BDC7810]);
  v8 = (_QWORD *)swift_task_alloc();
  v0[31] = v8;
  *v8 = v0;
  v8[1] = sub_23305231C;
  return sub_2330568EC();
}

uint64_t sub_23305231C()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  v2 = *(_QWORD **)v1;
  *(_QWORD *)(*(_QWORD *)v1 + 256) = v0;
  swift_task_dealloc();
  if (v0)
    (*(void (**)(_QWORD, _QWORD))(v2[18] + 8))(v2[19], v2[17]);
  return swift_task_switch();
}

uint64_t sub_233052390()
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
  void (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
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
  NSObject *v22;
  os_log_type_t v23;
  _BOOL4 v24;
  uint64_t v25;
  uint64_t v26;
  uint8_t *v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v40;
  uint64_t v41;
  void (*v42)(uint64_t, _QWORD, uint64_t, uint64_t);
  uint64_t v43;
  uint64_t v44;
  void (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t, uint64_t, uint64_t);
  void (*v47)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v48;

  v1 = *(_QWORD *)(v0 + 40);
  v2 = *(_QWORD *)(v0 + 184);
  v3 = *(_QWORD *)(v0 + 160);
  v4 = *(_QWORD *)(v0 + 168);
  v6 = *(_QWORD *)(v0 + 144);
  v5 = *(_QWORD *)(v0 + 152);
  v7 = *(_QWORD *)(v0 + 136);
  if (!v1)
  {
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v7);
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v2, v3);
LABEL_8:
    v15 = *(_QWORD *)(v0 + 216);
    v16 = *(_QWORD *)(v0 + 224);
    (*(void (**)(uint64_t, uint64_t, uint64_t, _QWORD))(v0 + 240))(v16, 3, 4, *(_QWORD *)(v0 + 232));
    swift_getKeyPath();
    swift_getKeyPath();
    sub_233054794(v16, v15);
    swift_retain();
    sub_2330566C4();
    sub_2330547D8(v16);
    goto LABEL_15;
  }
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v7);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v2, v3);
  v8 = *(_QWORD *)(v0 + 96);
  v9 = *(_QWORD *)(v0 + 104);
  v10 = *(_QWORD *)(v0 + 88);
  if (*(_QWORD *)(v1 + 16))
  {
    (*(void (**)(_QWORD, unint64_t, _QWORD))(v9 + 16))(*(_QWORD *)(v0 + 88), v1 + ((*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80)), *(_QWORD *)(v0 + 96));
    v11 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v11(v10, 0, 1, v8);
  }
  else
  {
    v11 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v11(*(_QWORD *)(v0 + 88), 1, 1, v8);
  }
  v12 = *(_QWORD *)(v0 + 96);
  v13 = *(_QWORD *)(v0 + 104);
  v14 = *(_QWORD *)(v0 + 88);
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v13 + 48))(v14, 1, v12) == 1)
  {
    sub_233053F94(*(_QWORD *)(v0 + 88));
    goto LABEL_8;
  }
  v47 = v11;
  (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(v0 + 104) + 32))(*(_QWORD *)(v0 + 128), *(_QWORD *)(v0 + 88), *(_QWORD *)(v0 + 96));
  if (qword_256030D70 != -1)
    swift_once();
  v18 = *(_QWORD *)(v0 + 120);
  v17 = *(_QWORD *)(v0 + 128);
  v20 = *(_QWORD *)(v0 + 96);
  v19 = *(_QWORD *)(v0 + 104);
  v21 = sub_233056670();
  __swift_project_value_buffer(v21, (uint64_t)qword_256031660);
  v46 = *(void (**)(uint64_t, uint64_t, uint64_t))(v19 + 16);
  v46(v18, v17, v20);
  v22 = sub_233056658();
  v23 = sub_233056934();
  v24 = os_log_type_enabled(v22, v23);
  v25 = *(_QWORD *)(v0 + 120);
  v26 = *(_QWORD *)(v0 + 104);
  if (v24)
  {
    v44 = *(_QWORD *)(v0 + 96);
    v27 = (uint8_t *)swift_slowAlloc();
    v28 = swift_slowAlloc();
    v48 = v28;
    *(_DWORD *)v27 = 136315138;
    v29 = sub_233056640();
    *(_QWORD *)(v0 + 48) = sub_233054120(v29, v30, &v48);
    sub_23305697C();
    swift_bridgeObjectRelease();
    v31 = v44;
    v45 = *(void (**)(uint64_t, uint64_t))(v26 + 8);
    v45(v25, v31);
    _os_log_impl(&dword_23304E000, v22, v23, "Add devices extension found with bundle identifier: %s", v27, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23492D474](v28, -1, -1);
    MEMORY[0x23492D474](v27, -1, -1);
  }
  else
  {
    v45 = *(void (**)(uint64_t, uint64_t))(v26 + 8);
    v45(*(_QWORD *)(v0 + 120), *(_QWORD *)(v0 + 96));
  }

  v32 = *(_QWORD *)(v0 + 224);
  v41 = *(_QWORD *)(v0 + 232);
  v42 = *(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v0 + 240);
  v43 = *(_QWORD *)(v0 + 216);
  v40 = *(_QWORD *)(v0 + 128);
  v33 = *(_QWORD *)(v0 + 112);
  v34 = *(_QWORD *)(v0 + 96);
  v36 = *(_QWORD *)(v0 + 72);
  v35 = *(_QWORD *)(v0 + 80);
  v37 = *(_QWORD *)(v0 + 56);
  ((void (*)(uint64_t))v46)(v35);
  v47(v35, 0, 1, v34);
  sub_233054874(v35, v36);
  v38 = v37
      + OBJC_IVAR____TtC25AutomatedDeviceEnrollment50AutomatedDeviceEnrollmentAdditionExtensionTerminal_addDevicesExtensionIdentity;
  swift_beginAccess();
  sub_2330548BC(v36, v38);
  swift_endAccess();
  v46(v33, v40, v34);
  sub_2330565A4();
  sub_233056958();
  v42(v32, 0, 4, v41);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_233054794(v32, v43);
  swift_retain();
  sub_2330566C4();
  sub_2330547D8(v32);
  v45(v40, v34);
LABEL_15:
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 200) + 8))(*(_QWORD *)(v0 + 208), *(_QWORD *)(v0 + 192));
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

uint64_t sub_2330528B0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD *)(v0 + 200);
  v2 = *(_QWORD *)(v0 + 208);
  v3 = *(_QWORD *)(v0 + 192);
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 168) + 8))(*(_QWORD *)(v0 + 184), *(_QWORD *)(v0 + 160));
  (*(void (**)(uint64_t, uint64_t))(v1 + 8))(v2, v3);
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

uint64_t sub_2330529B8(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2[14] = a1;
  v2[15] = v1;
  v3 = sub_233056634();
  v2[16] = v3;
  v2[17] = *(_QWORD *)(v3 - 8);
  v2[18] = swift_task_alloc();
  v4 = sub_233056610();
  v2[19] = v4;
  v2[20] = *(_QWORD *)(v4 - 8);
  v2[21] = swift_task_alloc();
  v2[22] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2560311F8);
  v2[23] = swift_task_alloc();
  v5 = sub_23305664C();
  v2[24] = v5;
  v2[25] = *(_QWORD *)(v5 - 8);
  v2[26] = swift_task_alloc();
  v2[27] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_233052AAC()
{
  uint64_t v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  uint64_t v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t v24;

  if (qword_256030D70 != -1)
    swift_once();
  v1 = sub_233056670();
  *(_QWORD *)(v0 + 224) = __swift_project_value_buffer(v1, (uint64_t)qword_256031660);
  v2 = sub_233056658();
  v3 = sub_233056934();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = (uint8_t *)swift_slowAlloc();
    v5 = swift_slowAlloc();
    v24 = v5;
    *(_DWORD *)v4 = 136315138;
    *(_QWORD *)(v0 + 104) = sub_233054120(0xD000000000000026, 0x8000000233057590, &v24);
    sub_23305697C();
    _os_log_impl(&dword_23304E000, v2, v3, "Begin %s", v4, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23492D474](v5, -1, -1);
    MEMORY[0x23492D474](v4, -1, -1);
  }

  v6 = *(_QWORD *)(v0 + 192);
  v7 = *(_QWORD *)(v0 + 200);
  v8 = *(_QWORD *)(v0 + 184);
  v9 = *(_QWORD *)(v0 + 120)
     + OBJC_IVAR____TtC25AutomatedDeviceEnrollment50AutomatedDeviceEnrollmentAdditionExtensionTerminal_addDevicesExtensionIdentity;
  swift_beginAccess();
  sub_233053F4C(v9, v8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v8, 1, v6) == 1)
  {
    sub_233053F94(*(_QWORD *)(v0 + 184));
    v10 = sub_233056658();
    v11 = sub_233056928();
    if (os_log_type_enabled(v10, v11))
    {
      v12 = (uint8_t *)swift_slowAlloc();
      v13 = swift_slowAlloc();
      v24 = v13;
      *(_DWORD *)v12 = 136315138;
      *(_QWORD *)(v0 + 72) = sub_233054120(0xD000000000000026, 0x8000000233057590, &v24);
      sub_23305697C();
      _os_log_impl(&dword_23304E000, v10, v11, "%s called when there is no extension identity", v12, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x23492D474](v13, -1, -1);
      MEMORY[0x23492D474](v12, -1, -1);
    }

    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    v15 = *(_QWORD *)(v0 + 208);
    v16 = *(_QWORD *)(v0 + 216);
    v17 = *(_QWORD *)(v0 + 192);
    v18 = *(_QWORD *)(v0 + 200);
    v19 = *(_QWORD *)(v0 + 176);
    v21 = *(_QWORD *)(v0 + 160);
    v20 = *(_QWORD *)(v0 + 168);
    v22 = *(_QWORD *)(v0 + 152);
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v18 + 32))(v16, *(_QWORD *)(v0 + 184), v17);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v18 + 16))(v15, v16, v17);
    swift_allocObject();
    swift_weakInit();
    sub_2330565F8();
    sub_233056580();
    sub_233056604();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v21 + 16))(v20, v19, v22);
    v23 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 232) = v23;
    *v23 = v0;
    v23[1] = sub_233052EB0;
    return sub_23305661C();
  }
}

uint64_t sub_233052EB0()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 240) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_233052F14()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(void);
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  id v18;
  id v19;
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
  uint8_t *v35;
  uint64_t v36;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45[2];

  v1 = *(_QWORD *)(v0 + 240);
  v2 = sub_233056628();
  if (v1)
  {
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 136) + 8))(*(_QWORD *)(v0 + 144), *(_QWORD *)(v0 + 128));
    v3 = *(_QWORD *)(v0 + 216);
    v4 = *(_QWORD *)(v0 + 192);
    v5 = *(_QWORD *)(v0 + 200);
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 160) + 8))(*(_QWORD *)(v0 + 176), *(_QWORD *)(v0 + 152));
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v3, v4);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    v6 = *(uint64_t (**)(void))(v0 + 8);
  }
  else
  {
    v7 = (void *)v2;
    v8 = *(_QWORD *)(v0 + 112);
    v9 = (void *)objc_opt_self();
    v10 = objc_msgSend(v9, sel_interfaceWithProtocol_, &unk_2560330D0);
    objc_msgSend(v7, sel_setExportedInterface_, v10);

    objc_msgSend(v7, sel_setExportedObject_, v8);
    objc_msgSend(v7, sel_resume);
    v11 = sub_233056658();
    v12 = sub_233056934();
    if (os_log_type_enabled(v11, v12))
    {
      v13 = (uint8_t *)swift_slowAlloc();
      v14 = swift_slowAlloc();
      v45[0] = v14;
      *(_DWORD *)v13 = 136315138;
      *(_QWORD *)(v0 + 96) = sub_233054120(0xD000000000000026, 0x8000000233057590, v45);
      sub_23305697C();
      _os_log_impl(&dword_23304E000, v11, v12, "%s Successfully setup XPC connection to extension", v13, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x23492D474](v14, -1, -1);
      MEMORY[0x23492D474](v13, -1, -1);
    }

    v15 = *(_QWORD *)(v0 + 120);
    v16 = *(void **)(v15
                   + OBJC_IVAR____TtC25AutomatedDeviceEnrollment50AutomatedDeviceEnrollmentAdditionExtensionTerminal_extensionXPCConnection);
    *(_QWORD *)(v15
              + OBJC_IVAR____TtC25AutomatedDeviceEnrollment50AutomatedDeviceEnrollmentAdditionExtensionTerminal_extensionXPCConnection) = v7;
    v17 = v7;

    v18 = objc_msgSend(v9, sel_interfaceWithProtocol_, &unk_25603CFE8);
    objc_msgSend(v17, sel_setRemoteObjectInterface_, v18);

    v19 = objc_msgSend(v17, sel_remoteObjectProxy);
    sub_233056994();
    swift_unknownObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_256031200);
    if (swift_dynamicCast())
    {
      v20 = *(_QWORD *)(v0 + 200);
      v42 = *(_QWORD *)(v0 + 192);
      v44 = *(_QWORD *)(v0 + 216);
      v21 = *(_QWORD *)(v0 + 176);
      v23 = *(_QWORD *)(v0 + 152);
      v22 = *(_QWORD *)(v0 + 160);
      v24 = *(_QWORD *)(v0 + 136);
      v25 = *(_QWORD *)(v0 + 144);
      v26 = *(_QWORD *)(v0 + 128);
      objc_msgSend(*(id *)(v0 + 80), sel_extensionLoaded);
      swift_unknownObjectRelease();

      (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v25, v26);
      (*(void (**)(uint64_t, uint64_t))(v22 + 8))(v21, v23);
      (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v44, v42);
    }
    else
    {
      v27 = sub_233056658();
      v28 = sub_233056928();
      v29 = os_log_type_enabled(v27, v28);
      v30 = *(_QWORD *)(v0 + 216);
      v31 = *(_QWORD *)(v0 + 192);
      v32 = *(_QWORD *)(v0 + 200);
      v33 = *(_QWORD *)(v0 + 176);
      v34 = *(_QWORD *)(v0 + 152);
      v41 = *(_QWORD *)(v0 + 144);
      v43 = *(_QWORD *)(v0 + 160);
      v39 = *(_QWORD *)(v0 + 136);
      v40 = *(_QWORD *)(v0 + 128);
      if (v29)
      {
        v38 = *(_QWORD *)(v0 + 200);
        v35 = (uint8_t *)swift_slowAlloc();
        v36 = swift_slowAlloc();
        v45[0] = v36;
        *(_DWORD *)v35 = 136315138;
        *(_QWORD *)(v0 + 88) = sub_233054120(0xD000000000000026, 0x8000000233057590, v45);
        sub_23305697C();
        _os_log_impl(&dword_23304E000, v27, v28, "%s Unable to retrieve extension XPC proxy", v35, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x23492D474](v36, -1, -1);
        MEMORY[0x23492D474](v35, -1, -1);

        (*(void (**)(uint64_t, uint64_t))(v39 + 8))(v41, v40);
        (*(void (**)(uint64_t, uint64_t))(v43 + 8))(v33, v34);
        (*(void (**)(uint64_t, uint64_t))(v38 + 8))(v30, v31);
      }
      else
      {

        (*(void (**)(uint64_t, uint64_t))(v39 + 8))(v41, v40);
        (*(void (**)(uint64_t, uint64_t))(v43 + 8))(v33, v34);
        (*(void (**)(uint64_t, uint64_t))(v32 + 8))(v30, v31);
      }
    }
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    v6 = *(uint64_t (**)(void))(v0 + 8);
  }
  return v6();
}

uint64_t sub_233053484()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD *)(v0 + 216);
  v2 = *(_QWORD *)(v0 + 192);
  v3 = *(_QWORD *)(v0 + 200);
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 160) + 8))(*(_QWORD *)(v0 + 176), *(_QWORD *)(v0 + 152));
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_233053530()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint64_t v14;

  v0 = type metadata accessor for AddDevicesExtensionStatus(0);
  v1 = MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v14 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v1);
  v5 = (char *)&v14 - v4;
  if (qword_256030D70 != -1)
    swift_once();
  v6 = sub_233056670();
  __swift_project_value_buffer(v6, (uint64_t)qword_256031660);
  v7 = sub_233056658();
  v8 = sub_233056928();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_23304E000, v7, v8, "Extension connection got interrupted", v9, 2u);
    MEMORY[0x23492D474](v9, -1, -1);
  }

  swift_beginAccess();
  if (swift_weakLoadStrong())
  {
    v10 = sub_233056964();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v5, 4, 4, v10);
    swift_getKeyPath();
    swift_getKeyPath();
    sub_233054794((uint64_t)v5, (uint64_t)v3);
    swift_retain();
    sub_2330566C4();
    sub_2330547D8((uint64_t)v5);
    swift_release();
  }
  else
  {
    v11 = sub_233056658();
    v12 = sub_233056934();
    if (os_log_type_enabled(v11, v12))
    {
      v13 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_23304E000, v11, v12, "Extension terminal got deallocated before we could handle XPC connection interruption", v13, 2u);
      MEMORY[0x23492D474](v13, -1, -1);
    }

  }
}

uint64_t sub_23305377C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0
     + OBJC_IVAR____TtC25AutomatedDeviceEnrollment50AutomatedDeviceEnrollmentAdditionExtensionTerminal__extensionStatus;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256030FB8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  sub_233053F94(v0+ OBJC_IVAR____TtC25AutomatedDeviceEnrollment50AutomatedDeviceEnrollmentAdditionExtensionTerminal_addDevicesExtensionIdentity);
  objc_release(*(id *)(v0
                     + OBJC_IVAR____TtC25AutomatedDeviceEnrollment50AutomatedDeviceEnrollmentAdditionExtensionTerminal_extensionXPCConnection));
  return swift_deallocClassInstance();
}

uint64_t sub_2330537F0()
{
  return type metadata accessor for AutomatedDeviceEnrollmentAdditionExtensionTerminal(0);
}

uint64_t type metadata accessor for AutomatedDeviceEnrollmentAdditionExtensionTerminal(uint64_t a1)
{
  return sub_23305103C(a1, (uint64_t *)&unk_256031050);
}

void sub_23305380C()
{
  unint64_t v0;
  unint64_t v1;

  sub_2330538DC(319, &qword_256031070, type metadata accessor for AddDevicesExtensionStatus, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BDB9EF0]);
  if (v0 <= 0x3F)
  {
    sub_2330538DC(319, qword_256031078, (uint64_t (*)(uint64_t))MEMORY[0x24BDC7920], MEMORY[0x24BEE1C68]);
    if (v1 <= 0x3F)
      swift_updateClassMetadata2();
  }
}

uint64_t type metadata accessor for AddDevicesExtensionStatus(uint64_t a1)
{
  return sub_23305103C(a1, (uint64_t *)&unk_2560311E8);
}

void sub_2330538DC(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
{
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;

  if (!*a2)
  {
    v7 = a3(255);
    v8 = a4(a1, v7);
    if (!v9)
      atomic_store(v8, a2);
  }
}

uint64_t *sub_233053934(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

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
    v7 = sub_233056964();
    v8 = *(_QWORD *)(v7 - 8);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48))(a2, 4, v7))
    {
      memcpy(a1, a2, *(_QWORD *)(v5 + 64));
    }
    else
    {
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16))(a1, a2, v7);
      (*(void (**)(uint64_t *, _QWORD, uint64_t, uint64_t))(v8 + 56))(a1, 0, 4, v7);
    }
  }
  return a1;
}

uint64_t sub_2330539FC(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v2 = sub_233056964();
  v3 = *(_QWORD *)(v2 - 8);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(a1, 4, v2);
  if (!(_DWORD)result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(a1, v2);
  return result;
}

void *sub_233053A64(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = sub_233056964();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v7 + 48))(a2, 4, v6))
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v7 + 16))(a1, a2, v6);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 4, v6);
  }
  return a1;
}

void *sub_233053B08(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(void *, uint64_t, uint64_t);
  int v9;
  int v10;

  v6 = sub_233056964();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v7 + 48);
  v9 = v8(a1, 4, v6);
  v10 = v8(a2, 4, v6);
  if (!v9)
  {
    if (!v10)
    {
      (*(void (**)(void *, void *, uint64_t))(v7 + 24))(a1, a2, v6);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v7 + 8))(a1, v6);
    goto LABEL_6;
  }
  if (v10)
  {
LABEL_6:
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v7 + 16))(a1, a2, v6);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 4, v6);
  return a1;
}

void *sub_233053BF8(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = sub_233056964();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v7 + 48))(a2, 4, v6))
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v7 + 32))(a1, a2, v6);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 4, v6);
  }
  return a1;
}

void *sub_233053C9C(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(void *, uint64_t, uint64_t);
  int v9;
  int v10;

  v6 = sub_233056964();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v7 + 48);
  v9 = v8(a1, 4, v6);
  v10 = v8(a2, 4, v6);
  if (!v9)
  {
    if (!v10)
    {
      (*(void (**)(void *, void *, uint64_t))(v7 + 40))(a1, a2, v6);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v7 + 8))(a1, v6);
    goto LABEL_6;
  }
  if (v10)
  {
LABEL_6:
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v7 + 32))(a1, a2, v6);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 4, v6);
  return a1;
}

uint64_t sub_233053D8C()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_233053D98(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  unsigned int v5;

  v4 = sub_233056964();
  v5 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(a1, a2, v4);
  if (v5 >= 5)
    return v5 - 4;
  else
    return 0;
}

uint64_t sub_233053DE4()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_233053DF0(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;

  if (a2)
    v5 = (a2 + 4);
  else
    v5 = 0;
  v6 = sub_233056964();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(a1, v5, a3, v6);
}

uint64_t sub_233053E44(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_233056964();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 48))(a1, 4, v2);
}

uint64_t sub_233053E7C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_233056964();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(a1, a2, 4, v4);
}

uint64_t sub_233053EBC()
{
  uint64_t result;
  unint64_t v1;

  result = sub_233056964();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataSinglePayload();
    return 0;
  }
  return result;
}

uint64_t sub_233053F10@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  type metadata accessor for AutomatedDeviceEnrollmentAdditionExtensionTerminal(0);
  result = sub_233056694();
  *a1 = result;
  return result;
}

uint64_t sub_233053F4C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2560311F8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_233053F94(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2560311F8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_233053FD4()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2330566B8();
  swift_release();
  return swift_release();
}

uint64_t sub_23305403C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v9;

  v2 = type metadata accessor for AddDevicesExtensionStatus(0);
  v3 = MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)&v9 - v6;
  sub_233054794(a1, (uint64_t)&v9 - v6);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_233054794((uint64_t)v7, (uint64_t)v5);
  swift_retain();
  sub_2330566C4();
  return sub_2330547D8((uint64_t)v7);
}

uint64_t sub_233054120(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_2330541F0(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_233054834((uint64_t)v12, *a3);
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
      sub_233054834((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_2330541F0(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_233056988();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_2330543A8(a5, a6);
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
  v8 = sub_2330569C4();
  if (!v8)
  {
    sub_2330569D0();
    __break(1u);
LABEL_17:
    result = sub_2330569E8();
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

uint64_t sub_2330543A8(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_23305443C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_233054614(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_233054614(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_23305443C(uint64_t a1, unint64_t a2)
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
      v3 = sub_2330545B0(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_2330569AC();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_2330569D0();
      __break(1u);
LABEL_10:
      v2 = sub_2330568D4();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_2330569E8();
    __break(1u);
LABEL_14:
    result = sub_2330569D0();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_2330545B0(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_256031208);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_233054614(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_256031208);
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
  result = sub_2330569E8();
  __break(1u);
  return result;
}

uint64_t sub_233054760()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

void sub_233054784()
{
  sub_233053530();
}

uint64_t sub_233054794(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for AddDevicesExtensionStatus(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2330547D8(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for AddDevicesExtensionStatus(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
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

uint64_t sub_233054834(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_233054874(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2560311F8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_2330548BC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2560311F8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t initializeBufferWithCopyOfBuffer for AddDevicesToAutomatedDeviceEnrollmentView(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for AddDevicesToAutomatedDeviceEnrollmentView()
{
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t initializeWithCopy for AddDevicesToAutomatedDeviceEnrollmentView(uint64_t a1, uint64_t a2)
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
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for AddDevicesToAutomatedDeviceEnrollmentView(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_retain();
  swift_release();
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_retain();
  swift_release();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_retain();
  swift_release();
  return a1;
}

__n128 __swift_memcpy40_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for AddDevicesToAutomatedDeviceEnrollmentView(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  swift_release();
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  v4 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v4;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for AddDevicesToAutomatedDeviceEnrollmentView(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 40))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AddDevicesToAutomatedDeviceEnrollmentView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 40) = 1;
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
    *(_BYTE *)(result + 40) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for AddDevicesToAutomatedDeviceEnrollmentView()
{
  return &type metadata for AddDevicesToAutomatedDeviceEnrollmentView;
}

uint64_t sub_233054B44()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_233054B54@<X0>(uint64_t a1@<X8>)
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
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  int EnumCaseMultiPayload;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t KeyPath;
  int v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char v33;
  char v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char v38;
  uint64_t v40;
  char *v41;
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
  char *v52;
  char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  char *v58;
  uint64_t v59;
  char *v60;
  char *v61;
  uint64_t v62;
  uint64_t v63;
  char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  _BYTE v79[7];
  char v80;
  _BYTE v81[7];
  char v82;
  _BYTE v83[7];
  _BYTE v84[7];
  char v85;
  char v86;
  _DWORD v87[3];

  v74 = a1;
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_256031228);
  MEMORY[0x24BDAC7A8](v1);
  v60 = (char *)&v56 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v70 = type metadata accessor for AddDevicesExtensionView();
  MEMORY[0x24BDAC7A8](v70);
  v64 = (char *)&v56 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v63 = sub_233056964();
  v62 = *(_QWORD *)(v63 - 8);
  MEMORY[0x24BDAC7A8](v63);
  v61 = (char *)&v56 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v72 = __swift_instantiateConcreteTypeFromMangledName(&qword_256031230);
  MEMORY[0x24BDAC7A8](v72);
  v6 = (char *)&v56 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v67 = __swift_instantiateConcreteTypeFromMangledName(&qword_256031238);
  MEMORY[0x24BDAC7A8](v67);
  v69 = (uint64_t)&v56 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v73 = __swift_instantiateConcreteTypeFromMangledName(&qword_256031240);
  MEMORY[0x24BDAC7A8](v73);
  v71 = (char *)&v56 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v66 = sub_233056760();
  v57 = *(_QWORD *)(v66 - 8);
  MEMORY[0x24BDAC7A8](v66);
  v10 = (char *)&v56 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v65 = __swift_instantiateConcreteTypeFromMangledName(&qword_256031248);
  v11 = *(_QWORD *)(v65 - 8);
  MEMORY[0x24BDAC7A8](v65);
  v13 = (char *)&v56 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v68 = __swift_instantiateConcreteTypeFromMangledName(&qword_256031250);
  v59 = *(_QWORD *)(v68 - 8);
  v14 = MEMORY[0x24BDAC7A8](v68);
  v16 = (char *)&v56 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v14);
  v58 = (char *)&v56 - v17;
  v18 = type metadata accessor for AddDevicesToAutomatedDeviceEnrollmentViewModel.addDevicesExtensionViewType(0);
  MEMORY[0x24BDAC7A8](v18);
  v20 = (uint64_t *)((char *)&v56 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0));
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2330566B8();
  swift_release();
  swift_release();
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload)
  {
    if (EnumCaseMultiPayload == 1)
    {
      v22 = *v20;
      v23 = v20[1];
      v71 = (char *)sub_23305673C();
      v70 = sub_23305685C();
      v24 = sub_2330567FC();
      v25 = (uint64_t)v60;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 56))(v60, 1, 1, v24);
      v69 = sub_233056808();
      sub_233051ACC(v25, &qword_256031228);
      KeyPath = swift_getKeyPath();
      LOBYTE(v25) = sub_2330567E4();
      v27 = sub_2330567F0();
      sub_2330567F0();
      if (sub_2330567F0() != v25)
        v27 = sub_2330567F0();
      LODWORD(v68) = v27;
      v75 = v22;
      v76 = v23;
      sub_2330556B0();
      swift_bridgeObjectRetain();
      v28 = sub_233056814();
      v30 = v29;
      v32 = v31;
      v34 = v33 & 1;
      v35 = swift_getKeyPath();
      v36 = v70;
      swift_retain();
      swift_retain();
      v37 = v69;
      swift_retain();
      sub_233055740(v28, v30, v34);
      swift_bridgeObjectRetain();
      swift_retain();
      sub_233055750(v28, v30, v34);
      swift_bridgeObjectRelease();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_bridgeObjectRelease();
      v85 = 1;
      v82 = 1;
      v80 = v34;
      v38 = sub_2330567D8();
      v86 = 1;
      *(_QWORD *)v6 = v71;
      *((_QWORD *)v6 + 1) = 0;
      v6[16] = 1;
      *(_DWORD *)(v6 + 17) = *(_DWORD *)v84;
      *((_DWORD *)v6 + 5) = *(_DWORD *)&v84[3];
      *((_QWORD *)v6 + 3) = v36;
      *((_QWORD *)v6 + 4) = KeyPath;
      *((_QWORD *)v6 + 5) = v37;
      v6[48] = v68;
      *(_DWORD *)(v6 + 49) = *(_DWORD *)v83;
      *((_DWORD *)v6 + 13) = *(_DWORD *)&v83[3];
      *(_OWORD *)(v6 + 72) = 0u;
      *(_OWORD *)(v6 + 56) = 0u;
      v6[88] = 1;
      *((_DWORD *)v6 + 23) = *(_DWORD *)&v81[3];
      *(_DWORD *)(v6 + 89) = *(_DWORD *)v81;
      *((_QWORD *)v6 + 12) = v28;
      *((_QWORD *)v6 + 13) = v30;
      v6[112] = v34;
      *(_DWORD *)(v6 + 113) = *(_DWORD *)v79;
      *((_DWORD *)v6 + 29) = *(_DWORD *)&v79[3];
      *((_QWORD *)v6 + 15) = v32;
      *((_QWORD *)v6 + 16) = v35;
      v6[136] = 1;
      *(_DWORD *)(v6 + 137) = v75;
      *((_DWORD *)v6 + 35) = *(_DWORD *)((char *)&v75 + 3);
      v6[144] = v38;
      *(_DWORD *)(v6 + 145) = v87[0];
      *((_DWORD *)v6 + 37) = *(_DWORD *)((char *)v87 + 3);
      *(_OWORD *)(v6 + 152) = 0u;
      *(_OWORD *)(v6 + 168) = 0u;
      v6[184] = v86;
      swift_storeEnumTagMultiPayload();
      __swift_instantiateConcreteTypeFromMangledName(&qword_256031260);
      sub_233055760();
      sub_233055868();
      return sub_233056748();
    }
    else
    {
      sub_2330566F4();
      sub_233056754();
      v47 = sub_233051B0C(&qword_256031270, &qword_256031248, MEMORY[0x24BDEBC00]);
      v48 = sub_233051E7C(&qword_256031278, (uint64_t (*)(uint64_t))MEMORY[0x24BDF07C8], MEMORY[0x24BDF07A8]);
      v50 = v65;
      v49 = v66;
      sub_233056838();
      (*(void (**)(char *, uint64_t))(v57 + 8))(v10, v49);
      (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v50);
      v51 = v59;
      v52 = v58;
      v53 = v16;
      v54 = v68;
      (*(void (**)(char *, char *, uint64_t))(v59 + 32))(v58, v53, v68);
      (*(void (**)(uint64_t, char *, uint64_t))(v51 + 16))(v69, v52, v54);
      swift_storeEnumTagMultiPayload();
      v75 = v50;
      v76 = v49;
      v77 = v47;
      v78 = v48;
      swift_getOpaqueTypeConformance2();
      sub_233051E7C(&qword_256031280, (uint64_t (*)(uint64_t))type metadata accessor for AddDevicesExtensionView, (uint64_t)&unk_2330571E0);
      v55 = (uint64_t)v71;
      sub_233056748();
      sub_2330558EC(v55, (uint64_t)v6);
      swift_storeEnumTagMultiPayload();
      __swift_instantiateConcreteTypeFromMangledName(&qword_256031260);
      sub_233055760();
      sub_233055868();
      sub_233056748();
      sub_233051ACC(v55, &qword_256031240);
      return (*(uint64_t (**)(char *, uint64_t))(v51 + 8))(v52, v54);
    }
  }
  else
  {
    v40 = v62;
    v41 = v61;
    v42 = v63;
    (*(void (**)(char *, uint64_t *, uint64_t))(v62 + 32))(v61, v20, v63);
    v43 = (uint64_t)v64;
    (*(void (**)(char *, char *, uint64_t))(v40 + 16))(v64, v41, v42);
    sub_2330519CC(v43, v69, (uint64_t (*)(_QWORD))type metadata accessor for AddDevicesExtensionView);
    swift_storeEnumTagMultiPayload();
    v44 = sub_233051B0C(&qword_256031270, &qword_256031248, MEMORY[0x24BDEBC00]);
    v45 = sub_233051E7C(&qword_256031278, (uint64_t (*)(uint64_t))MEMORY[0x24BDF07C8], MEMORY[0x24BDF07A8]);
    v75 = v65;
    v76 = v66;
    v77 = v44;
    v78 = v45;
    swift_getOpaqueTypeConformance2();
    sub_233051E7C(&qword_256031280, (uint64_t (*)(uint64_t))type metadata accessor for AddDevicesExtensionView, (uint64_t)&unk_2330571E0);
    v46 = (uint64_t)v71;
    sub_233056748();
    sub_2330558EC(v46, (uint64_t)v6);
    swift_storeEnumTagMultiPayload();
    __swift_instantiateConcreteTypeFromMangledName(&qword_256031260);
    sub_233055760();
    sub_233055868();
    sub_233056748();
    sub_233051ACC(v46, &qword_256031240);
    sub_233051A10(v43, (uint64_t (*)(_QWORD))type metadata accessor for AddDevicesExtensionView);
    return (*(uint64_t (**)(char *, uint64_t))(v40 + 8))(v41, v42);
  }
}

uint64_t sub_233055480()
{
  return sub_233056844();
}

uint64_t sub_233055498@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;

  *(_QWORD *)a1 = sub_23305673C();
  *(_QWORD *)(a1 + 8) = 0;
  *(_BYTE *)(a1 + 16) = 1;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256031220);
  return sub_233054B54(a1 + *(int *)(v2 + 44));
}

uint64_t sub_2330554F8()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2330566B8();
  swift_release();
  return swift_release();
}

uint64_t sub_233055564(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v9;

  v2 = type metadata accessor for AddDevicesToAutomatedDeviceEnrollmentViewModel.addDevicesExtensionViewType(0);
  v3 = MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)&v9 - v6;
  sub_2330519CC(a1, (uint64_t)&v9 - v6, type metadata accessor for AddDevicesToAutomatedDeviceEnrollmentViewModel.addDevicesExtensionViewType);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2330519CC((uint64_t)v7, (uint64_t)v5, type metadata accessor for AddDevicesToAutomatedDeviceEnrollmentViewModel.addDevicesExtensionViewType);
  swift_retain();
  sub_2330566C4();
  return sub_233051A10((uint64_t)v7, type metadata accessor for AddDevicesToAutomatedDeviceEnrollmentViewModel.addDevicesExtensionViewType);
}

uint64_t sub_233055660@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_233056724();
  *a1 = result;
  return result;
}

uint64_t sub_233055688()
{
  swift_retain();
  return sub_233056730();
}

unint64_t sub_2330556B0()
{
  unint64_t result;

  result = qword_256031258;
  if (!qword_256031258)
  {
    result = MEMORY[0x23492D3FC](MEMORY[0x24BEE0D50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_256031258);
  }
  return result;
}

uint64_t sub_2330556F4@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_23305670C();
  *a1 = result;
  return result;
}

uint64_t sub_23305571C()
{
  return sub_233056718();
}

uint64_t sub_233055740(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_retain();
  else
    return swift_bridgeObjectRetain();
}

uint64_t sub_233055750(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_release();
  else
    return swift_bridgeObjectRelease();
}

unint64_t sub_233055760()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(uint64_t);
  _QWORD v5[6];

  result = qword_256031268;
  if (!qword_256031268)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256031240);
    v2 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256031248);
    v3 = sub_233056760();
    v4 = (uint64_t (*)(uint64_t))MEMORY[0x24BDF07C8];
    v5[2] = v2;
    v5[3] = v3;
    v5[4] = sub_233051B0C(&qword_256031270, &qword_256031248, MEMORY[0x24BDEBC00]);
    v5[5] = sub_233051E7C(&qword_256031278, v4, MEMORY[0x24BDF07A8]);
    v5[0] = swift_getOpaqueTypeConformance2();
    v5[1] = sub_233051E7C(&qword_256031280, (uint64_t (*)(uint64_t))type metadata accessor for AddDevicesExtensionView, (uint64_t)&unk_2330571E0);
    result = MEMORY[0x23492D3FC](MEMORY[0x24BDEF3E0], v1, v5);
    atomic_store(result, (unint64_t *)&qword_256031268);
  }
  return result;
}

unint64_t sub_233055868()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_256031288;
  if (!qword_256031288)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256031260);
    v2[0] = sub_233051B0C(&qword_256031290, &qword_256031298, MEMORY[0x24BDF4700]);
    v2[1] = MEMORY[0x24BDECC60];
    result = MEMORY[0x23492D3FC](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_256031288);
  }
  return result;
}

uint64_t sub_2330558EC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256031240);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_233055934()
{
  return sub_233051B0C(&qword_2560312A0, &qword_2560312A8, MEMORY[0x24BDF4700]);
}

uint64_t View.automatedDeviceEnrollmentAddition(isPresented:)(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v6;

  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = a1;
  *(_QWORD *)(v6 + 24) = a2;
  *(_BYTE *)(v6 + 32) = a3;
  swift_retain();
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2560312B0);
  sub_233055B30();
  sub_233056850();
  return swift_release();
}

uint64_t sub_233055A34@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, int a3@<W2>, uint64_t a4@<X8>)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;

  type metadata accessor for AddDevicesToAutomatedDeviceEnrollmentViewModel(0);
  swift_allocObject();
  swift_retain_n();
  swift_retain_n();
  sub_23304F6D8(a1, a2, a3);
  sub_233055C3C();
  v8 = sub_233056700();
  v10 = v9;
  sub_23304F9F0();
  swift_release();
  swift_release();
  result = sub_2330567D8();
  *(_QWORD *)a4 = a1;
  *(_QWORD *)(a4 + 8) = a2;
  *(_BYTE *)(a4 + 16) = a3;
  *(_QWORD *)(a4 + 24) = v8;
  *(_QWORD *)(a4 + 32) = v10;
  *(_BYTE *)(a4 + 40) = result;
  return result;
}

uint64_t sub_233055AF8()
{
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_233055B24@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_233055A34(*(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), *(unsigned __int8 *)(v1 + 32), a1);
}

unint64_t sub_233055B30()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2560312B8;
  if (!qword_2560312B8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2560312B0);
    v2[0] = sub_233055B9C();
    v2[1] = MEMORY[0x24BDF0420];
    result = MEMORY[0x23492D3FC](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2560312B8);
  }
  return result;
}

unint64_t sub_233055B9C()
{
  unint64_t result;

  result = qword_2560312C0;
  if (!qword_2560312C0)
  {
    result = MEMORY[0x23492D3FC](&unk_23305704C, &type metadata for AddDevicesToAutomatedDeviceEnrollmentView);
    atomic_store(result, (unint64_t *)&qword_2560312C0);
  }
  return result;
}

uint64_t sub_233055BE0()
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2560312B0);
  sub_233055B30();
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_233055C3C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2560312C8;
  if (!qword_2560312C8)
  {
    v1 = type metadata accessor for AddDevicesToAutomatedDeviceEnrollmentViewModel(255);
    result = MEMORY[0x23492D3FC](&unk_233056E98, v1);
    atomic_store(result, (unint64_t *)&qword_2560312C8);
  }
  return result;
}

uint64_t sub_233055C84(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_233056964();
  return (**(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8))(a1, a2, v4);
}

uint64_t sub_233055CC0(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_233056964();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
}

uint64_t sub_233055CF4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_233056964();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t sub_233055D38(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_233056964();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t sub_233055D7C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_233056964();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t sub_233055DC0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_233056964();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t sub_233055E04()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_233055E10(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_233056964();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(a1, a2, v4);
}

uint64_t sub_233055E4C()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_233055E58(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_233056964();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(a1, a2, a2, v4);
}

uint64_t type metadata accessor for AddDevicesExtensionView()
{
  uint64_t result;

  result = qword_256031328;
  if (!qword_256031328)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_233055ED4()
{
  uint64_t result;
  unint64_t v1;

  result = sub_233056964();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_233055F3C()
{
  return sub_233056184(&qword_256031280, (uint64_t)&unk_2330571E0);
}

id sub_233055F60()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v9;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_256031368);
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for LightContentStatusBarEXHostViewController();
  v4 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
  v5 = sub_233056964();
  v6 = *(_QWORD *)(v5 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v3, v0, v5);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v6 + 56))(v3, 0, 1, v5);
  v7 = v4;
  sub_233056970();

  return v7;
}

void sub_233056038()
{
  sub_2330561C4();
}

uint64_t sub_23305604C()
{
  return sub_233056784();
}

uint64_t sub_233056084()
{
  return MEMORY[0x24BDF5560];
}

uint64_t sub_233056090()
{
  sub_233056184(&qword_256031360, (uint64_t)&unk_233057168);
  return sub_2330567C0();
}

uint64_t sub_2330560F0()
{
  sub_233056184(&qword_256031360, (uint64_t)&unk_233057168);
  return sub_233056790();
}

void sub_233056150()
{
  sub_233056184(&qword_256031360, (uint64_t)&unk_233057168);
  sub_2330567B4();
  __break(1u);
}

uint64_t sub_233056184(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = type metadata accessor for AddDevicesExtensionView();
    result = MEMORY[0x23492D3FC](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

void sub_2330561C4()
{
  uint64_t v0;
  os_log_type_t v1;
  uint8_t *v2;
  uint64_t v3;
  NSObject *oslog;
  uint64_t v5;

  if (qword_256030D70 != -1)
    swift_once();
  v0 = sub_233056670();
  __swift_project_value_buffer(v0, (uint64_t)qword_256031660);
  oslog = sub_233056658();
  v1 = sub_233056934();
  if (os_log_type_enabled(oslog, v1))
  {
    v2 = (uint8_t *)swift_slowAlloc();
    v3 = swift_slowAlloc();
    v5 = v3;
    *(_DWORD *)v2 = 136315138;
    sub_233054120(0xD000000000000022, 0x8000000233057880, &v5);
    sub_23305697C();
    _os_log_impl(&dword_23304E000, oslog, v1, "%s Nothing to do here yet", v2, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23492D474](v3, -1, -1);
    MEMORY[0x23492D474](v2, -1, -1);

  }
  else
  {

  }
}

id sub_233056530()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for LightContentStatusBarEXHostViewController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for LightContentStatusBarEXHostViewController()
{
  return objc_opt_self();
}

uint64_t sub_233056580()
{
  return MEMORY[0x24BDCEC88]();
}

uint64_t sub_23305658C()
{
  return MEMORY[0x24BDCED58]();
}

uint64_t sub_233056598()
{
  return MEMORY[0x24BDCEEA8]();
}

uint64_t sub_2330565A4()
{
  return MEMORY[0x24BDC7AB8]();
}

uint64_t sub_2330565B0()
{
  return MEMORY[0x24BDC7AD0]();
}

uint64_t sub_2330565BC()
{
  return MEMORY[0x24BDC77F0]();
}

uint64_t sub_2330565C8()
{
  return MEMORY[0x24BDC7808]();
}

uint64_t sub_2330565D4()
{
  return MEMORY[0x24BDC7820]();
}

uint64_t sub_2330565E0()
{
  return MEMORY[0x24BDC7838]();
}

uint64_t sub_2330565EC()
{
  return MEMORY[0x24BDC7840]();
}

uint64_t sub_2330565F8()
{
  return MEMORY[0x24BDC7858]();
}

uint64_t sub_233056604()
{
  return MEMORY[0x24BDC7860]();
}

uint64_t sub_233056610()
{
  return MEMORY[0x24BDC7870]();
}

uint64_t sub_23305661C()
{
  return MEMORY[0x24BDC7880]();
}

uint64_t sub_233056628()
{
  return MEMORY[0x24BDC7890]();
}

uint64_t sub_233056634()
{
  return MEMORY[0x24BDC78A8]();
}

uint64_t sub_233056640()
{
  return MEMORY[0x24BDC78D0]();
}

uint64_t sub_23305664C()
{
  return MEMORY[0x24BDC7920]();
}

uint64_t sub_233056658()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_233056664()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_233056670()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_23305667C()
{
  return MEMORY[0x24BDB9B40]();
}

uint64_t sub_233056688()
{
  return MEMORY[0x24BDB9B60]();
}

uint64_t sub_233056694()
{
  return MEMORY[0x24BDB9C48]();
}

uint64_t sub_2330566A0()
{
  return MEMORY[0x24BDB9E98]();
}

uint64_t sub_2330566AC()
{
  return MEMORY[0x24BDB9EA0]();
}

uint64_t sub_2330566B8()
{
  return MEMORY[0x24BDB9EC8]();
}

uint64_t sub_2330566C4()
{
  return MEMORY[0x24BDB9ED0]();
}

uint64_t sub_2330566D0()
{
  return MEMORY[0x24BDB9EF0]();
}

uint64_t sub_2330566DC()
{
  return MEMORY[0x24BDBA090]();
}

uint64_t sub_2330566E8()
{
  return MEMORY[0x24BDBA110]();
}

uint64_t sub_2330566F4()
{
  return MEMORY[0x24BDEBBC8]();
}

uint64_t sub_233056700()
{
  return MEMORY[0x24BDEC998]();
}

uint64_t sub_23305670C()
{
  return MEMORY[0x24BDEE288]();
}

uint64_t sub_233056718()
{
  return MEMORY[0x24BDEE290]();
}

uint64_t sub_233056724()
{
  return MEMORY[0x24BDEE390]();
}

uint64_t sub_233056730()
{
  return MEMORY[0x24BDEE3A0]();
}

uint64_t sub_23305673C()
{
  return MEMORY[0x24BDEEF60]();
}

uint64_t sub_233056748()
{
  return MEMORY[0x24BDEF3A0]();
}

uint64_t sub_233056754()
{
  return MEMORY[0x24BDF07B8]();
}

uint64_t sub_233056760()
{
  return MEMORY[0x24BDF07C8]();
}

uint64_t sub_23305676C()
{
  return MEMORY[0x24BDF0EC0]();
}

uint64_t sub_233056778()
{
  return MEMORY[0x24BDF0ED0]();
}

uint64_t sub_233056784()
{
  return MEMORY[0x24BDF0EE0]();
}

uint64_t sub_233056790()
{
  return MEMORY[0x24BDF0EF0]();
}

uint64_t sub_23305679C()
{
  return MEMORY[0x24BDF0F00]();
}

uint64_t sub_2330567A8()
{
  return MEMORY[0x24BDF0F10]();
}

uint64_t sub_2330567B4()
{
  return MEMORY[0x24BDF0F18]();
}

uint64_t sub_2330567C0()
{
  return MEMORY[0x24BDF0F28]();
}

uint64_t sub_2330567CC()
{
  return MEMORY[0x24BDF0F38]();
}

uint64_t sub_2330567D8()
{
  return MEMORY[0x24BDF14A8]();
}

uint64_t sub_2330567E4()
{
  return MEMORY[0x24BDF14C8]();
}

uint64_t sub_2330567F0()
{
  return MEMORY[0x24BDF14E8]();
}

uint64_t sub_2330567FC()
{
  return MEMORY[0x24BDF1678]();
}

uint64_t sub_233056808()
{
  return MEMORY[0x24BDF1750]();
}

uint64_t sub_233056814()
{
  return MEMORY[0x24BDF1FF0]();
}

uint64_t sub_233056820()
{
  return MEMORY[0x24BDF2088]();
}

uint64_t sub_23305682C()
{
  return MEMORY[0x24BDF20A0]();
}

uint64_t sub_233056838()
{
  return MEMORY[0x24BDF20B0]();
}

uint64_t sub_233056844()
{
  return MEMORY[0x24BDF2698]();
}

uint64_t sub_233056850()
{
  return MEMORY[0x24BDF2830]();
}

uint64_t sub_23305685C()
{
  return MEMORY[0x24BDF3F80]();
}

uint64_t sub_233056868()
{
  return MEMORY[0x24BDF47B8]();
}

uint64_t sub_233056874()
{
  return MEMORY[0x24BEE0610]();
}

uint64_t sub_233056880()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_23305688C()
{
  return MEMORY[0x24BDCF8D8]();
}

uint64_t sub_233056898()
{
  return MEMORY[0x24BDCF978]();
}

uint64_t sub_2330568A4()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_2330568B0()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_2330568BC()
{
  return MEMORY[0x24BDCFB20]();
}

uint64_t sub_2330568C8()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_2330568D4()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_2330568E0()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_2330568EC()
{
  return MEMORY[0x24BEE68C8]();
}

uint64_t sub_2330568F8()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t sub_233056904()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t sub_233056910()
{
  return MEMORY[0x24BEE6C08]();
}

uint64_t sub_23305691C()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t sub_233056928()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_233056934()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_233056940()
{
  return MEMORY[0x24BEE56F0]();
}

uint64_t sub_23305694C()
{
  return MEMORY[0x24BEE5770]();
}

uint64_t sub_233056958()
{
  return MEMORY[0x24BDC7B18]();
}

uint64_t sub_233056964()
{
  return MEMORY[0x24BDC7B30]();
}

uint64_t sub_233056970()
{
  return MEMORY[0x24BDC7B48]();
}

uint64_t sub_23305697C()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_233056988()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_233056994()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_2330569A0()
{
  return MEMORY[0x24BEE24D0]();
}

uint64_t sub_2330569AC()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_2330569B8()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_2330569C4()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_2330569D0()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_2330569DC()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_2330569E8()
{
  return MEMORY[0x24BEE30B0]();
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

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x24BEE4D08]();
}

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4D10]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x24BEE4D88]();
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

uint64_t swift_getOpaqueTypeConformance2()
{
  return MEMORY[0x24BEE4DC0]();
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

uint64_t swift_initEnumMetadataSinglePayload()
{
  return MEMORY[0x24BEE4E40]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x24BEE4E58]();
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

uint64_t swift_weakDestroy()
{
  return MEMORY[0x24BEE5028]();
}

uint64_t swift_weakInit()
{
  return MEMORY[0x24BEE5030]();
}

