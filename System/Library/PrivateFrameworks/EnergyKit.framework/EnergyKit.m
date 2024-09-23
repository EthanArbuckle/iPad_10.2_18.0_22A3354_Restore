uint64_t EnergySite.identifier.getter()
{
  uint64_t v0;
  id v1;
  uint64_t v2;

  v1 = *(id *)(v0 + 16);
  v2 = sub_23A8F0F50();

  return v2;
}

uint64_t EnergySite.name.getter()
{
  uint64_t v0;
  id v1;
  uint64_t v2;

  v1 = *(id *)(v0 + 16);
  v2 = sub_23A8F0F74();

  return v2;
}

void sub_23A8AF3E0(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = *(id *)(*(_QWORD *)a1 + 16);
  v4 = sub_23A8F0F74();
  v6 = v5;

  *a2 = v4;
  a2[1] = v6;
}

void sub_23A8AF428(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(*(_QWORD *)a2 + 16);
  swift_bridgeObjectRetain();
  v3 = v2;
  sub_23A8F0F80();

}

void EnergySite.name.setter()
{
  uint64_t v0;
  id v1;

  v1 = *(id *)(v0 + 16);
  sub_23A8F0F80();

}

void (*EnergySite.name.modify(uint64_t *a1))(uint64_t a1, char a2)
{
  uint64_t v1;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  a1[2] = v1;
  v3 = *(id *)(v1 + 16);
  v4 = sub_23A8F0F74();
  v6 = v5;

  *a1 = v4;
  a1[1] = v6;
  return sub_23A8AF52C;
}

void sub_23A8AF52C(uint64_t a1, char a2)
{
  id v2;
  id v3;
  id v4;

  v4 = *(id *)(*(_QWORD *)(a1 + 16) + 16);
  if ((a2 & 1) != 0)
  {
    swift_bridgeObjectRetain();
    v2 = v4;
    sub_23A8F0F80();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = v4;
    sub_23A8F0F80();
  }

}

void *EnergySite.location.getter()
{
  uint64_t v0;
  id v1;
  void *v2;
  CLLocationCoordinate2D v4;

  v1 = *(id *)(v0 + 16);
  v2 = (void *)sub_23A8F0F68();

  if (v2)
  {
    objc_msgSend(v2, sel_coordinate);
    if (!CLLocationCoordinate2DIsValid(v4))
    {

      return 0;
    }
  }
  return v2;
}

uint64_t EnergySite.timeZone.getter()
{
  uint64_t v0;
  id v1;
  uint64_t v2;

  v1 = *(id *)(v0 + 16);
  v2 = sub_23A8F0F8C();

  return v2;
}

uint64_t EnergySite.timezone.getter()
{
  uint64_t v0;
  id v1;
  uint64_t v2;

  v1 = *(id *)(v0 + 16);
  v2 = sub_23A8F0F8C();

  return v2;
}

uint64_t EnergySite.gridID.getter()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 32) = v0;
  return swift_task_switch();
}

uint64_t sub_23A8AF6A8()
{
  uint64_t v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  CLLocationCoordinate2D v10;

  v1 = *(id *)(*(_QWORD *)(v0 + 32) + 16);
  v2 = (void *)sub_23A8F0F68();
  *(_QWORD *)(v0 + 40) = v2;

  if (!v2)
    return (*(uint64_t (**)(_QWORD, _QWORD))(v0 + 8))(0, 0);
  objc_msgSend(v2, sel_coordinate);
  if (!CLLocationCoordinate2DIsValid(v10))
  {

    return (*(uint64_t (**)(_QWORD, _QWORD))(v0 + 8))(0, 0);
  }
  if (qword_2542D8AA0 != -1)
    swift_once();
  objc_msgSend(v2, sel_coordinate);
  v4 = v3;
  v6 = v5;
  v7 = swift_task_alloc();
  *(_QWORD *)(v0 + 48) = v7;
  *(_QWORD *)(v7 + 16) = v4;
  *(_QWORD *)(v7 + 24) = v6;
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 56) = v8;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569C8378);
  *v8 = v0;
  v8[1] = sub_23A8AF800;
  return sub_23A8F1400();
}

uint64_t sub_23A8AF800()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 64) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23A8AF86C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(v0 + 16);
  v1 = *(_QWORD *)(v0 + 24);

  return (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8))(v2, v1);
}

uint64_t sub_23A8AF8A8()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 40);

  swift_task_dealloc();
  return (*(uint64_t (**)(_QWORD, _QWORD))(v0 + 8))(0, 0);
}

uint64_t EnergySite.ckZoneName.getter()
{
  uint64_t v0;
  id v1;
  uint64_t v2;

  v1 = *(id *)(v0 + 16);
  v2 = sub_23A8F0E54();

  return v2;
}

BOOL EnergySite.cloudkitEnabled.getter()
{
  uint64_t v0;
  id v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;

  v1 = *(id *)(v0 + 16);
  v2 = sub_23A8F0E54();
  v4 = v3;

  swift_bridgeObjectRelease();
  v5 = HIBYTE(v4) & 0xF;
  if ((v4 & 0x2000000000000000) == 0)
    v5 = v2 & 0xFFFFFFFFFFFFLL;
  return v5 != 0;
}

uint64_t EnergySite.utilitySubscriptionID.getter()
{
  uint64_t v0;
  id v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;

  v1 = *(id *)(v0 + 16);
  v2 = sub_23A8F0EA8();
  v4 = v3;

  if (v4)
  {
    v5 = HIBYTE(v4) & 0xF;
    if ((v4 & 0x2000000000000000) == 0)
      v5 = v2 & 0xFFFFFFFFFFFFLL;
    if (!v5)
    {
      swift_bridgeObjectRelease();
      return 0;
    }
  }
  return v2;
}

BOOL EnergySite.utilityOnboarded.getter()
{
  uint64_t v0;
  id v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;

  v1 = *(id *)(v0 + 16);
  v2 = sub_23A8F0EA8();
  v4 = v3;

  if (!v4)
    return 0;
  swift_bridgeObjectRelease();
  v5 = HIBYTE(v4) & 0xF;
  if ((v4 & 0x2000000000000000) == 0)
    v5 = v2 & 0xFFFFFFFFFFFFLL;
  return v5 != 0;
}

uint64_t EnergySite.subscriptionErrorState.getter()
{
  uint64_t v0;
  id v1;
  uint64_t v2;

  v1 = *(id *)(v0 + 16);
  v2 = sub_23A8F0F38();

  return v2;
}

uint64_t EnergySite.subscriptionState.getter()
{
  uint64_t v0;
  id v1;
  uint64_t v2;

  v1 = *(id *)(v0 + 16);
  v2 = sub_23A8F0F38();

  return v2;
}

void EnergySite.accessTokenExpirationDate.getter()
{
  uint64_t v0;
  id v1;

  v1 = *(id *)(v0 + 16);
  sub_23A8F0F20();

}

uint64_t EnergySite.accessToken.getter()
{
  uint64_t v0;
  id v1;
  uint64_t v2;

  v1 = *(id *)(v0 + 16);
  v2 = sub_23A8F0E60();

  return v2;
}

uint64_t EnergySite.refreshToken.getter()
{
  uint64_t v0;
  id v1;
  uint64_t v2;

  v1 = *(id *)(v0 + 16);
  v2 = sub_23A8F0E84();

  return v2;
}

uint64_t EnergySite.ckFunctionToken.getter()
{
  uint64_t v0;
  id v1;
  uint64_t v2;

  v1 = *(id *)(v0 + 16);
  v2 = sub_23A8F0EB4();

  return v2;
}

uint64_t EnergySite.accountName.getter()
{
  uint64_t v0;
  id v1;
  uint64_t v2;

  v1 = *(id *)(v0 + 16);
  v2 = sub_23A8F0E6C();

  return v2;
}

uint64_t EnergySite.accountNumber.getter()
{
  uint64_t v0;
  id v1;
  uint64_t v2;

  v1 = *(id *)(v0 + 16);
  v2 = sub_23A8F0E90();

  return v2;
}

uint64_t EnergySite.serviceAddress.getter()
{
  uint64_t v0;
  id v1;
  uint64_t v2;

  v1 = *(id *)(v0 + 16);
  v2 = sub_23A8F0F5C();

  return v2;
}

uint64_t EnergySite.serviceLocationID.getter()
{
  uint64_t v0;
  id v1;
  uint64_t v2;

  v1 = *(id *)(v0 + 16);
  v2 = sub_23A8F0ED8();

  return v2;
}

uint64_t EnergySite.utilityID.getter()
{
  uint64_t v0;
  id v1;
  uint64_t v2;

  v1 = *(id *)(v0 + 16);
  v2 = sub_23A8F0F98();

  return v2;
}

uint64_t EnergySite.alternateSupplier.getter()
{
  uint64_t v0;
  id v1;
  uint64_t v2;

  v1 = *(id *)(v0 + 16);
  v2 = sub_23A8F0ECC();

  return v2;
}

void EnergySite.utilitySupportedCheckDate.getter()
{
  uint64_t v0;
  id v1;

  v1 = *(id *)(v0 + 16);
  sub_23A8F0F2C();

}

uint64_t EnergySite.hasExportedEnergy.getter()
{
  uint64_t v0;
  id v1;
  char v2;

  v1 = *(id *)(v0 + 16);
  v2 = sub_23A8F0E48();

  return v2 & 1;
}

void EnergySite.subscriptionCreationDate.getter()
{
  uint64_t v0;
  id v1;

  v1 = *(id *)(v0 + 16);
  sub_23A8F0F14();

}

void EnergySite.subscriptionStartDate.getter()
{
  uint64_t v0;
  id v1;

  v1 = *(id *)(v0 + 16);
  sub_23A8F0F08();

}

void EnergySite.siteTombstone.getter()
{
  uint64_t v0;
  id v1;

  v1 = *(id *)(v0 + 16);
  sub_23A8F0E9C();

}

uint64_t EnergySite.siteVersion.getter()
{
  uint64_t v0;
  id v1;
  uint64_t v2;

  v1 = *(id *)(v0 + 16);
  v2 = sub_23A8F0E78();

  return v2;
}

void EnergySite.amiLastRefreshDate.getter()
{
  uint64_t v0;
  id v1;

  v1 = *(id *)(v0 + 16);
  sub_23A8F0EF0();

}

uint64_t sub_23A8AFF40(uint64_t a1)
{
  uint64_t v1;

  return sub_23A8DA040(a1, *(double *)(v1 + 16), *(double *)(v1 + 24));
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x23B85B48C]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

void sub_23A8AFF88(_QWORD *a1@<X8>)
{
  *a1 = 0;
}

_QWORD *sub_23A8AFF90@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = *result;
  return result;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_23A8AFFAC(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_23A8AFFCC(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)result = (a2 - 1);
    *(_QWORD *)(result + 8) = 0;
    if (!a3)
      return result;
    v3 = 1;
  }
  else
  {
    if (!a3)
      return result;
    v3 = 0;
  }
  *(_BYTE *)(result + 16) = v3;
  return result;
}

void type metadata accessor for CLLocationCoordinate2D()
{
  unint64_t ForeignTypeMetadata;
  uint64_t v1;

  if (!qword_2569C83E0)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1)
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_2569C83E0);
  }
}

uint64_t sub_23A8B0068()
{
  uint64_t v0;

  swift_beginAccess();
  return MEMORY[0x23B85B5B8](v0 + 48);
}

uint64_t sub_23A8B00AC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  swift_beginAccess();
  *(_QWORD *)(v2 + 56) = a2;
  swift_unknownObjectWeakAssign();
  return swift_unknownObjectRelease();
}

void (*sub_23A8B010C(_QWORD *a1))(uint64_t a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;

  v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[5] = v1;
  swift_beginAccess();
  v4 = MEMORY[0x23B85B5B8](v1 + 48);
  v5 = *(_QWORD *)(v1 + 56);
  v3[3] = v4;
  v3[4] = v5;
  return sub_23A8B0178;
}

void sub_23A8B0178(uint64_t a1, char a2)
{
  void *v3;

  v3 = *(void **)a1;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)a1 + 40) + 56) = *(_QWORD *)(*(_QWORD *)a1 + 32);
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

uint64_t EnergySite.__allocating_init(siteID:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  uint64_t (*v7)(uint64_t, uint64_t);

  v7 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_2569C83F0 + dword_2569C83F0);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_23A8B0254;
  return v7(a1, a2);
}

uint64_t sub_23A8B0254(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v4;

  v4 = *v1;
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v4 + 8))(a1);
}

uint64_t EnergySite.__allocating_init(clientProvidedID:)(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;

  v2[2] = a1;
  v2[3] = a2;
  v3 = sub_23A8F0CE0();
  v2[4] = v3;
  v2[5] = *(_QWORD *)(v3 - 8);
  v2[6] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23A8B0304()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t (*v11)(uint64_t, uint64_t);

  v1 = *(_QWORD *)(v0 + 24);
  v2 = HIBYTE(v1) & 0xF;
  if ((v1 & 0x2000000000000000) == 0)
    v2 = *(_QWORD *)(v0 + 16) & 0xFFFFFFFFFFFFLL;
  if (v2)
  {
    v4 = *(_QWORD *)(v0 + 40);
    v3 = *(_QWORD *)(v0 + 48);
    v5 = *(_QWORD *)(v0 + 32);
    sub_23A8F1154();
    sub_23A8F0FA4();
    sub_23A8F0EE4();
    sub_23A8F0CB0();
    v6 = sub_23A8F0CBC();
    v8 = v7;
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
    swift_bridgeObjectRelease();
    v11 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_2569C83F0 + dword_2569C83F0);
    v9 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 56) = v9;
    *v9 = v0;
    v9[1] = sub_23A8B0430;
    return v11(v6, v8);
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    return (*(uint64_t (**)(_QWORD))(v0 + 8))(0);
  }
}

uint64_t sub_23A8B0430(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 64) = a1;
  swift_task_dealloc();
  swift_retain();
  return swift_task_switch();
}

uint64_t sub_23A8B0490()
{
  uint64_t v0;
  uint64_t v1;

  if (*(_QWORD *)(v0 + 64))
  {
    swift_release();
    v1 = *(_QWORD *)(v0 + 64);
  }
  else
  {
    v1 = 0;
  }
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v1);
}

uint64_t static EnergySite.generateSiteID(clientID:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v6;

  v0 = sub_23A8F0CE0();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8]();
  v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23A8F1154();
  sub_23A8F0FA4();
  sub_23A8F0EE4();
  sub_23A8F0CB0();
  v4 = sub_23A8F0CBC();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return v4;
}

uint64_t sub_23A8B05AC(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;

  v2[8] = a1;
  v2[9] = v1;
  v3 = sub_23A8F10A0();
  v2[10] = v3;
  v2[11] = *(_QWORD *)(v3 - 8);
  v2[12] = swift_task_alloc();
  v2[13] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23A8B061C()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t, uint64_t);
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  void (*v24)(uint64_t, uint64_t);
  id v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  int8x16_t *v30;
  _QWORD *v31;
  NSObject *v33;
  os_log_type_t v34;
  uint8_t *v35;
  uint64_t v36;
  uint64_t v37;
  _BYTE *v38;
  NSObject *log;
  _QWORD *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void (*v44)(uint64_t, uint64_t, uint64_t);
  os_log_type_t type;
  uint64_t v46;

  if (qword_2542D8828 != -1)
    swift_once();
  v1 = *(void **)(v0 + 64);
  v2 = *(_QWORD *)(v0 + 104);
  v3 = *(_QWORD *)(v0 + 80);
  v4 = *(_QWORD *)(v0 + 88);
  v5 = __swift_project_value_buffer(v3, (uint64_t)qword_2542D8DE0);
  swift_beginAccess();
  v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16);
  v6(v2, v5, v3);
  swift_retain_n();
  v7 = v1;
  v8 = sub_23A8F1088();
  type = sub_23A8F1268();
  v9 = os_log_type_enabled(v8, type);
  v10 = *(_QWORD *)(v0 + 104);
  v11 = *(_QWORD *)(v0 + 80);
  v12 = *(_QWORD *)(v0 + 88);
  v14 = *(void **)(v0 + 64);
  v13 = *(_QWORD *)(v0 + 72);
  if (v9)
  {
    v44 = v6;
    v15 = swift_slowAlloc();
    v40 = (_QWORD *)swift_slowAlloc();
    v41 = swift_slowAlloc();
    v46 = v41;
    *(_DWORD *)v15 = 136315394;
    v43 = v10;
    v16 = *(id *)(v13 + 16);
    v42 = v11;
    v17 = v5;
    v18 = sub_23A8F0F74();
    log = v8;
    v20 = v19;

    v21 = v18;
    v5 = v17;
    *(_QWORD *)(v0 + 48) = sub_23A8BF840(v21, v20, &v46);
    sub_23A8F12A4();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v15 + 12) = 2112;
    *(_QWORD *)(v0 + 56) = v14;
    v22 = v14;
    sub_23A8F12A4();
    *v40 = v14;

    _os_log_impl(&dword_23A8AD000, log, type, "update location for site %s to %@", (uint8_t *)v15, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(qword_2569C8410);
    swift_arrayDestroy();
    MEMORY[0x23B85B51C](v40, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x23B85B51C](v41, -1, -1);
    v23 = v15;
    v6 = v44;
    MEMORY[0x23B85B51C](v23, -1, -1);

    v24 = *(void (**)(uint64_t, uint64_t))(v12 + 8);
    v24(v43, v42);
  }
  else
  {

    swift_release_n();
    v24 = *(void (**)(uint64_t, uint64_t))(v12 + 8);
    v24(v10, v11);
  }
  v25 = *(id *)(*(_QWORD *)(v0 + 72) + 16);
  v26 = sub_23A8F0F50();
  v28 = v27;

  swift_bridgeObjectRelease();
  v29 = HIBYTE(v28) & 0xF;
  if ((v28 & 0x2000000000000000) == 0)
    v29 = v26 & 0xFFFFFFFFFFFFLL;
  if (v29)
  {
    v30 = (int8x16_t *)swift_task_alloc();
    *(_QWORD *)(v0 + 112) = v30;
    v30[1] = vextq_s8(*(int8x16_t *)(v0 + 64), *(int8x16_t *)(v0 + 64), 8uLL);
    v31 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 120) = v31;
    sub_23A8F0FA4();
    *v31 = v0;
    v31[1] = sub_23A8B0AB4;
    return sub_23A8F1400();
  }
  else
  {
    v6(*(_QWORD *)(v0 + 96), v5, *(_QWORD *)(v0 + 80));
    v33 = sub_23A8F1088();
    v34 = sub_23A8F1274();
    if (os_log_type_enabled(v33, v34))
    {
      v35 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v35 = 0;
      _os_log_impl(&dword_23A8AD000, v33, v34, "Failed to update location. Site ID is empty.", v35, 2u);
      MEMORY[0x23B85B51C](v35, -1, -1);
    }
    v36 = *(_QWORD *)(v0 + 96);
    v37 = *(_QWORD *)(v0 + 80);

    v24(v36, v37);
    sub_23A8C3D5C();
    swift_allocError();
    *v38 = 28;
    swift_willThrow();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_23A8B0AB4()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 128) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23A8B0B20()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(v0 + 72);
  v2 = *(void **)(v1 + 16);
  *(_QWORD *)(v1 + 16) = *(_QWORD *)(v0 + 40);

  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23A8B0B74()
{
  uint64_t v0;

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23A8B0BB8(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v18;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569C8870);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(_QWORD *)(v7 + 64);
  MEMORY[0x24BDAC7A8]();
  v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2542D8AC0);
  MEMORY[0x24BDAC7A8]();
  v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_23A8F1208();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v11, 1, 1, v12);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a1, v6);
  v13 = (*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  v14 = (v8 + v13 + 7) & 0xFFFFFFFFFFFFFFF8;
  v15 = swift_allocObject();
  *(_QWORD *)(v15 + 16) = 0;
  *(_QWORD *)(v15 + 24) = 0;
  (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v15 + v13, v9, v6);
  *(_QWORD *)(v15 + v14) = a2;
  *(_QWORD *)(v15 + ((v14 + 15) & 0xFFFFFFFFFFFFFFF8)) = a3;
  swift_retain();
  v16 = a3;
  sub_23A8B1124((uint64_t)v11, (uint64_t)&unk_2569C8910, v15);
  return swift_release();
}

uint64_t sub_23A8B0D28(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;

  v6[19] = a5;
  v6[20] = a6;
  v6[18] = a4;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569C8870);
  v6[21] = v7;
  v8 = *(_QWORD *)(v7 - 8);
  v6[22] = v8;
  v6[23] = *(_QWORD *)(v8 + 64);
  v6[24] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23A8B0D94()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;

  v1 = v0[24];
  v3 = v0[21];
  v2 = v0[22];
  v4 = v0[19];
  v13 = v0[20];
  v5 = v0[18];
  type metadata accessor for HomeEnergyXPCConnection();
  swift_allocObject();
  v0[25] = sub_23A8EF888();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v5, v3);
  v6 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v7 = swift_allocObject();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v2 + 32))(v7 + v6, v1, v3);
  v8 = (void *)sub_23A8EFE34((uint64_t)sub_23A8C86E8, v7);
  v0[26] = v8;
  swift_release();
  v9 = *(id *)(v4 + 16);
  sub_23A8F0F50();

  v10 = sub_23A8F1130();
  v0[27] = v10;
  swift_bridgeObjectRelease();
  v0[7] = v0 + 15;
  v0[2] = v0;
  v0[3] = sub_23A8B0F30;
  v11 = swift_continuation_init();
  v0[10] = MEMORY[0x24BDAC760];
  v0[11] = 0x40000000;
  v0[12] = sub_23A8B1098;
  v0[13] = &block_descriptor_218;
  v0[14] = v11;
  objc_msgSend(v8, sel_updateLocationWithSiteID_location_completionHandler_, v10, v13, v0 + 10);
  return swift_continuation_await();
}

uint64_t sub_23A8B0F30()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)v0 + 224) = *(_QWORD *)(*(_QWORD *)v0 + 48);
  return swift_task_switch();
}

uint64_t sub_23A8B0F90()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(void **)(v0 + 216);
  v2 = *(_QWORD *)(v0 + 200);
  v3 = *(_QWORD *)(v0 + 120);
  swift_unknownObjectRelease();

  objc_msgSend(*(id *)(v2 + 16), sel_invalidate);
  *(_QWORD *)(v0 + 136) = v3;
  sub_23A8F11F0();
  swift_release();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23A8B1014()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;

  v2 = *(void **)(v0 + 216);
  v1 = *(_QWORD *)(v0 + 224);
  swift_willThrow();
  swift_release();
  swift_unknownObjectRelease();

  *(_QWORD *)(v0 + 128) = v1;
  sub_23A8F11E4();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23A8B1098(uint64_t result, void *a2, void *a3)
{
  _QWORD *v4;
  id v5;
  id v6;

  if (a3)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2542D8AE0);
    swift_allocError();
    *v4 = a3;
    v5 = a3;
    return swift_continuation_throwingResumeWithError();
  }
  else if (a2)
  {
    **(_QWORD **)(*(_QWORD *)(*(_QWORD *)(result + 32) + 64) + 40) = a2;
    v6 = a2;
    return swift_continuation_throwingResume();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_23A8B1124(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_23A8F1208();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_23A8F11FC();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_23A8C64C8(a1, &qword_2542D8AC0);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_23A8F11D8();
    swift_unknownObjectRelease();
  }
LABEL_5:
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_23A8B1270(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;

  v3[9] = a2;
  v3[10] = v2;
  v3[8] = a1;
  v4 = sub_23A8F10A0();
  v3[11] = v4;
  v3[12] = *(_QWORD *)(v4 - 8);
  v3[13] = swift_task_alloc();
  v3[14] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23A8B12E4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t, uint64_t);
  NSObject *v6;
  os_log_type_t v7;
  _BOOL4 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, uint64_t);
  id v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD *v29;
  _QWORD *v30;
  NSObject *v32;
  os_log_type_t v33;
  uint8_t *v34;
  uint64_t v35;
  uint64_t v36;
  _BYTE *v37;
  os_log_type_t type;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void (*v42)(uint64_t, uint64_t, uint64_t);
  uint64_t v43;
  uint64_t v44[2];

  if (qword_2542D8828 != -1)
    swift_once();
  v1 = *(_QWORD *)(v0 + 112);
  v2 = *(_QWORD *)(v0 + 88);
  v3 = *(_QWORD *)(v0 + 96);
  v4 = __swift_project_value_buffer(v2, (uint64_t)qword_2542D8DE0);
  swift_beginAccess();
  v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
  v5(v1, v4, v2);
  swift_retain_n();
  swift_bridgeObjectRetain_n();
  v6 = sub_23A8F1088();
  v7 = sub_23A8F1268();
  v8 = os_log_type_enabled(v6, v7);
  v9 = *(_QWORD *)(v0 + 112);
  v10 = *(_QWORD *)(v0 + 88);
  v11 = *(_QWORD *)(v0 + 96);
  v13 = *(_QWORD *)(v0 + 72);
  v12 = *(_QWORD *)(v0 + 80);
  if (v8)
  {
    v39 = *(_QWORD *)(v0 + 64);
    v43 = v4;
    v14 = swift_slowAlloc();
    v40 = swift_slowAlloc();
    v44[0] = v40;
    *(_DWORD *)v14 = 136315394;
    v41 = v9;
    v15 = *(id *)(v12 + 16);
    type = v7;
    v16 = sub_23A8F0F74();
    v42 = v5;
    v18 = v17;

    *(_QWORD *)(v0 + 48) = sub_23A8BF840(v16, v18, v44);
    sub_23A8F12A4();
    swift_release_n();
    v5 = v42;
    swift_bridgeObjectRelease();
    *(_WORD *)(v14 + 12) = 2080;
    swift_bridgeObjectRetain();
    *(_QWORD *)(v0 + 56) = sub_23A8BF840(v39, v13, v44);
    sub_23A8F12A4();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_23A8AD000, v6, type, "update time zone for site %s to %s", (uint8_t *)v14, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x23B85B51C](v40, -1, -1);
    v19 = v14;
    v4 = v43;
    MEMORY[0x23B85B51C](v19, -1, -1);

    v20 = *(void (**)(uint64_t, uint64_t))(v11 + 8);
    v20(v41, v10);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_release_n();
    v20 = *(void (**)(uint64_t, uint64_t))(v11 + 8);
    v20(v9, v10);
  }
  v21 = *(id *)(*(_QWORD *)(v0 + 80) + 16);
  v22 = sub_23A8F0F50();
  v24 = v23;

  swift_bridgeObjectRelease();
  v25 = HIBYTE(v24) & 0xF;
  if ((v24 & 0x2000000000000000) == 0)
    v25 = v22 & 0xFFFFFFFFFFFFLL;
  if (v25)
  {
    v27 = *(_QWORD *)(v0 + 72);
    v26 = *(_QWORD *)(v0 + 80);
    v28 = *(_QWORD *)(v0 + 64);
    v29 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 120) = v29;
    v29[2] = v26;
    v29[3] = v28;
    v29[4] = v27;
    v30 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 128) = v30;
    sub_23A8F0FA4();
    *v30 = v0;
    v30[1] = sub_23A8B1748;
    return sub_23A8F1400();
  }
  else
  {
    v5(*(_QWORD *)(v0 + 104), v4, *(_QWORD *)(v0 + 88));
    v32 = sub_23A8F1088();
    v33 = sub_23A8F1274();
    if (os_log_type_enabled(v32, v33))
    {
      v34 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v34 = 0;
      _os_log_impl(&dword_23A8AD000, v32, v33, "Failed to update timezone. Site ID is empty.", v34, 2u);
      MEMORY[0x23B85B51C](v34, -1, -1);
    }
    v35 = *(_QWORD *)(v0 + 104);
    v36 = *(_QWORD *)(v0 + 88);

    v20(v35, v36);
    sub_23A8C3D5C();
    swift_allocError();
    *v37 = 28;
    swift_willThrow();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_23A8B1748()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 136) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23A8B17B4()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(v0 + 80);
  v2 = *(void **)(v1 + 16);
  *(_QWORD *)(v1 + 16) = *(_QWORD *)(v0 + 40);

  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23A8B1808()
{
  uint64_t v0;

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23A8B184C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;

  v7[20] = a6;
  v7[21] = a7;
  v7[18] = a4;
  v7[19] = a5;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569C8870);
  v7[22] = v8;
  v9 = *(_QWORD *)(v8 - 8);
  v7[23] = v9;
  v7[24] = *(_QWORD *)(v9 + 64);
  v7[25] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23A8B18B8()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v1 = v0[25];
  v3 = v0[22];
  v2 = v0[23];
  v4 = v0[19];
  v5 = v0[18];
  type metadata accessor for HomeEnergyXPCConnection();
  swift_allocObject();
  v0[26] = sub_23A8EF888();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v5, v3);
  v6 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v7 = swift_allocObject();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v2 + 32))(v7 + v6, v1, v3);
  v8 = (void *)sub_23A8EFE34((uint64_t)sub_23A8C84D8, v7);
  v0[27] = v8;
  swift_release();
  v9 = *(id *)(v4 + 16);
  sub_23A8F0F50();

  v10 = sub_23A8F1130();
  v0[28] = v10;
  swift_bridgeObjectRelease();
  v11 = sub_23A8F1130();
  v0[29] = v11;
  v0[7] = v0 + 15;
  v0[2] = v0;
  v0[3] = sub_23A8B1A6C;
  v12 = swift_continuation_init();
  v0[10] = MEMORY[0x24BDAC760];
  v0[11] = 0x40000000;
  v0[12] = sub_23A8B1098;
  v0[13] = &block_descriptor_210;
  v0[14] = v12;
  objc_msgSend(v8, sel_updateTimezoneWithSiteID_timezone_completionHandler_, v10, v11, v0 + 10);
  return swift_continuation_await();
}

uint64_t sub_23A8B1A6C()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)v0 + 240) = *(_QWORD *)(*(_QWORD *)v0 + 48);
  return swift_task_switch();
}

uint64_t sub_23A8B1ACC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;

  v3[7] = a2;
  v3[8] = v2;
  v3[6] = a1;
  v4 = sub_23A8F10A0();
  v3[9] = v4;
  v3[10] = *(_QWORD *)(v4 - 8);
  v3[11] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23A8B1B30()
{
  uint64_t v0;
  id v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _BYTE *v22;

  v1 = *(id *)(*(_QWORD *)(v0 + 64) + 16);
  v2 = sub_23A8F0F50();
  v4 = v3;

  swift_bridgeObjectRelease();
  v5 = HIBYTE(v4) & 0xF;
  if ((v4 & 0x2000000000000000) == 0)
    v5 = v2 & 0xFFFFFFFFFFFFLL;
  if (v5)
  {
    v7 = *(_QWORD *)(v0 + 56);
    v6 = *(_QWORD *)(v0 + 64);
    v8 = *(_QWORD *)(v0 + 48);
    v9 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 96) = v9;
    v9[2] = v6;
    v9[3] = v8;
    v9[4] = v7;
    v10 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 104) = v10;
    sub_23A8F0FA4();
    *v10 = v0;
    v10[1] = sub_23A8B1D78;
    return sub_23A8F1400();
  }
  else
  {
    if (qword_2542D8828 != -1)
      swift_once();
    v13 = *(_QWORD *)(v0 + 80);
    v12 = *(_QWORD *)(v0 + 88);
    v14 = *(_QWORD *)(v0 + 72);
    v15 = __swift_project_value_buffer(v14, (uint64_t)qword_2542D8DE0);
    swift_beginAccess();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v13 + 16))(v12, v15, v14);
    v16 = sub_23A8F1088();
    v17 = sub_23A8F1274();
    if (os_log_type_enabled(v16, v17))
    {
      v18 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v18 = 0;
      _os_log_impl(&dword_23A8AD000, v16, v17, "Failed to update state. Site ID is empty.", v18, 2u);
      MEMORY[0x23B85B51C](v18, -1, -1);
    }
    v20 = *(_QWORD *)(v0 + 80);
    v19 = *(_QWORD *)(v0 + 88);
    v21 = *(_QWORD *)(v0 + 72);

    (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v19, v21);
    sub_23A8C3D5C();
    swift_allocError();
    *v22 = 28;
    swift_willThrow();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_23A8B1D78()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 112) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23A8B1DE4()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(v0 + 64);
  v2 = *(void **)(v1 + 16);
  *(_QWORD *)(v1 + 16) = *(_QWORD *)(v0 + 40);

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23A8B1E30()
{
  uint64_t v0;

  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23A8B1E6C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v21;
  uint64_t v22;

  v21 = a3;
  v22 = a6;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569C8870);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(_QWORD *)(v10 + 64);
  MEMORY[0x24BDAC7A8]();
  v12 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2542D8AC0);
  MEMORY[0x24BDAC7A8]();
  v14 = (char *)&v21 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_23A8F1208();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56))(v14, 1, 1, v15);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, a1, v9);
  v16 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v17 = (v11 + v16 + 7) & 0xFFFFFFFFFFFFFFF8;
  v18 = swift_allocObject();
  *(_QWORD *)(v18 + 16) = 0;
  *(_QWORD *)(v18 + 24) = 0;
  (*(void (**)(unint64_t, char *, uint64_t))(v10 + 32))(v18 + v16, v12, v9);
  *(_QWORD *)(v18 + v17) = a2;
  v19 = (_QWORD *)(v18 + ((v17 + 15) & 0xFFFFFFFFFFFFFFF8));
  *v19 = v21;
  v19[1] = a4;
  swift_retain();
  swift_bridgeObjectRetain();
  sub_23A8B1124((uint64_t)v14, v22, v18);
  return swift_release();
}

uint64_t sub_23A8B1FEC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;

  v7[20] = a6;
  v7[21] = a7;
  v7[18] = a4;
  v7[19] = a5;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569C8870);
  v7[22] = v8;
  v9 = *(_QWORD *)(v8 - 8);
  v7[23] = v9;
  v7[24] = *(_QWORD *)(v9 + 64);
  v7[25] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23A8B2058()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v1 = v0[25];
  v3 = v0[22];
  v2 = v0[23];
  v4 = v0[19];
  v5 = v0[18];
  type metadata accessor for HomeEnergyXPCConnection();
  swift_allocObject();
  v0[26] = sub_23A8EF888();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v5, v3);
  v6 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v7 = swift_allocObject();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v2 + 32))(v7 + v6, v1, v3);
  v8 = (void *)sub_23A8EFE34((uint64_t)sub_23A8C8324, v7);
  v0[27] = v8;
  swift_release();
  v9 = *(id *)(v4 + 16);
  sub_23A8F0F50();

  v10 = sub_23A8F1130();
  v0[28] = v10;
  swift_bridgeObjectRelease();
  v11 = sub_23A8F1130();
  v0[29] = v11;
  v0[7] = v0 + 15;
  v0[2] = v0;
  v0[3] = sub_23A8B220C;
  v12 = swift_continuation_init();
  v0[10] = MEMORY[0x24BDAC760];
  v0[11] = 0x40000000;
  v0[12] = sub_23A8B1098;
  v0[13] = &block_descriptor_202;
  v0[14] = v12;
  objc_msgSend(v8, sel_updateStateWithSiteID_state_completionHandler_, v10, v11, v0 + 10);
  return swift_continuation_await();
}

uint64_t sub_23A8B220C()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)v0 + 240) = *(_QWORD *)(*(_QWORD *)v0 + 48);
  return swift_task_switch();
}

uint64_t sub_23A8B226C()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *(void **)(v0 + 224);
  v1 = *(void **)(v0 + 232);
  v3 = *(_QWORD *)(v0 + 208);
  v4 = *(_QWORD *)(v0 + 120);
  swift_unknownObjectRelease();

  objc_msgSend(*(id *)(v3 + 16), sel_invalidate);
  *(_QWORD *)(v0 + 136) = v4;
  sub_23A8F11F0();
  swift_release();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23A8B22F4()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  void *v3;

  v2 = *(void **)(v0 + 232);
  v1 = *(_QWORD *)(v0 + 240);
  v3 = *(void **)(v0 + 224);
  swift_willThrow();
  swift_release();
  swift_unknownObjectRelease();

  *(_QWORD *)(v0 + 128) = v1;
  sub_23A8F11E4();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23A8B2388(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;

  v2[6] = a1;
  v2[7] = v1;
  v3 = sub_23A8F10A0();
  v2[8] = v3;
  v2[9] = *(_QWORD *)(v3 - 8);
  v2[10] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23A8B23E8()
{
  uint64_t v0;
  id v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  int8x16_t *v6;
  _QWORD *v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _BYTE *v19;

  v1 = *(id *)(*(_QWORD *)(v0 + 56) + 16);
  v2 = sub_23A8F0F50();
  v4 = v3;

  swift_bridgeObjectRelease();
  v5 = HIBYTE(v4) & 0xF;
  if ((v4 & 0x2000000000000000) == 0)
    v5 = v2 & 0xFFFFFFFFFFFFLL;
  if (v5)
  {
    v6 = (int8x16_t *)swift_task_alloc();
    *(_QWORD *)(v0 + 88) = v6;
    v6[1] = vextq_s8(*(int8x16_t *)(v0 + 48), *(int8x16_t *)(v0 + 48), 8uLL);
    v7 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 96) = v7;
    sub_23A8F0FA4();
    *v7 = v0;
    v7[1] = sub_23A8B2624;
    return sub_23A8F1400();
  }
  else
  {
    if (qword_2542D8828 != -1)
      swift_once();
    v10 = *(_QWORD *)(v0 + 72);
    v9 = *(_QWORD *)(v0 + 80);
    v11 = *(_QWORD *)(v0 + 64);
    v12 = __swift_project_value_buffer(v11, (uint64_t)qword_2542D8DE0);
    swift_beginAccess();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 16))(v9, v12, v11);
    v13 = sub_23A8F1088();
    v14 = sub_23A8F1274();
    if (os_log_type_enabled(v13, v14))
    {
      v15 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_23A8AD000, v13, v14, "Failed to update fields. Site ID is empty.", v15, 2u);
      MEMORY[0x23B85B51C](v15, -1, -1);
    }
    v17 = *(_QWORD *)(v0 + 72);
    v16 = *(_QWORD *)(v0 + 80);
    v18 = *(_QWORD *)(v0 + 64);

    (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v16, v18);
    sub_23A8C3D5C();
    swift_allocError();
    *v19 = 28;
    swift_willThrow();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_23A8B2624()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 104) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23A8B2690()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(v0 + 56);
  v2 = *(void **)(v1 + 16);
  *(_QWORD *)(v1 + 16) = *(_QWORD *)(v0 + 40);

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23A8B26DC()
{
  uint64_t v0;

  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23A8B2718(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v17;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569C8870);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(_QWORD *)(v7 + 64);
  MEMORY[0x24BDAC7A8]();
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2542D8AC0);
  MEMORY[0x24BDAC7A8]();
  v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_23A8F1208();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v11, 1, 1, v12);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a1, v6);
  v13 = (*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  v14 = (v8 + v13 + 7) & 0xFFFFFFFFFFFFFFF8;
  v15 = swift_allocObject();
  *(_QWORD *)(v15 + 16) = 0;
  *(_QWORD *)(v15 + 24) = 0;
  (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v15 + v13, v9, v6);
  *(_QWORD *)(v15 + v14) = a2;
  *(_QWORD *)(v15 + ((v14 + 15) & 0xFFFFFFFFFFFFFFF8)) = a3;
  swift_retain();
  swift_bridgeObjectRetain();
  sub_23A8B1124((uint64_t)v11, (uint64_t)&unk_2569C88E0, v15);
  return swift_release();
}

uint64_t sub_23A8B288C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;

  v6[19] = a5;
  v6[20] = a6;
  v6[18] = a4;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569C8870);
  v6[21] = v7;
  v8 = *(_QWORD *)(v7 - 8);
  v6[22] = v8;
  v6[23] = *(_QWORD *)(v8 + 64);
  v6[24] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23A8B28F8()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v1 = v0[24];
  v2 = v0[21];
  v3 = v0[22];
  v4 = v0[19];
  v5 = v0[18];
  type metadata accessor for HomeEnergyXPCConnection();
  swift_allocObject();
  v0[25] = sub_23A8EF888();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v1, v5, v2);
  v6 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v7 = swift_allocObject();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v3 + 32))(v7 + v6, v1, v2);
  v8 = (void *)sub_23A8EFE34((uint64_t)sub_23A8C8220, v7);
  v0[26] = v8;
  swift_release();
  v9 = *(id *)(v4 + 16);
  sub_23A8F0F50();

  v10 = sub_23A8F1130();
  v0[27] = v10;
  swift_bridgeObjectRelease();
  v11 = sub_23A8F10AC();
  v0[28] = v11;
  v0[7] = v0 + 15;
  v0[2] = v0;
  v0[3] = sub_23A8B2AC0;
  v12 = swift_continuation_init();
  v0[10] = MEMORY[0x24BDAC760];
  v0[11] = 0x40000000;
  v0[12] = sub_23A8B1098;
  v0[13] = &block_descriptor_194;
  v0[14] = v12;
  objc_msgSend(v8, sel_updateFieldsWithSiteID_from_completionHandler_, v10, v11, v0 + 10);
  return swift_continuation_await();
}

uint64_t sub_23A8B2AC0()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)v0 + 232) = *(_QWORD *)(*(_QWORD *)v0 + 48);
  return swift_task_switch();
}

uint64_t sub_23A8B2B20()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *(void **)(v0 + 216);
  v1 = *(void **)(v0 + 224);
  v3 = *(_QWORD *)(v0 + 200);
  v4 = *(_QWORD *)(v0 + 120);
  swift_unknownObjectRelease();

  objc_msgSend(*(id *)(v3 + 16), sel_invalidate);
  *(_QWORD *)(v0 + 136) = v4;
  sub_23A8F11F0();
  swift_release();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23A8B2BA8()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  void *v3;

  v2 = *(void **)(v0 + 224);
  v1 = *(_QWORD *)(v0 + 232);
  v3 = *(void **)(v0 + 216);
  swift_willThrow();
  swift_release();
  swift_unknownObjectRelease();

  *(_QWORD *)(v0 + 128) = v1;
  sub_23A8F11E4();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23A8B2C3C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;

  *(_QWORD *)(v9 + 208) = v18;
  *(_QWORD *)(v9 + 216) = v8;
  *(_OWORD *)(v9 + 176) = v16;
  *(_OWORD *)(v9 + 192) = v17;
  *(_OWORD *)(v9 + 144) = v14;
  *(_OWORD *)(v9 + 160) = v15;
  *(_OWORD *)(v9 + 112) = v12;
  *(_OWORD *)(v9 + 128) = v13;
  *(_QWORD *)(v9 + 96) = a7;
  *(_QWORD *)(v9 + 104) = a8;
  *(_QWORD *)(v9 + 80) = a5;
  *(_QWORD *)(v9 + 88) = a6;
  *(_QWORD *)(v9 + 64) = a3;
  *(_QWORD *)(v9 + 72) = a4;
  *(_QWORD *)(v9 + 48) = a1;
  *(_QWORD *)(v9 + 56) = a2;
  v10 = sub_23A8F10A0();
  *(_QWORD *)(v9 + 224) = v10;
  *(_QWORD *)(v9 + 232) = *(_QWORD *)(v10 - 8);
  *(_QWORD *)(v9 + 240) = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23A8B2CC8()
{
  uint64_t v0;
  id v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
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
  _QWORD *v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  os_log_type_t v22;
  uint8_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _BYTE *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;

  v1 = *(id *)(*(_QWORD *)(v0 + 216) + 16);
  v2 = sub_23A8F0F50();
  v4 = v3;

  swift_bridgeObjectRelease();
  v5 = HIBYTE(v4) & 0xF;
  if ((v4 & 0x2000000000000000) == 0)
    v5 = v2 & 0xFFFFFFFFFFFFLL;
  if (v5)
  {
    v7 = *(_QWORD *)(v0 + 208);
    v6 = *(_QWORD *)(v0 + 216);
    v8 = *(_QWORD *)(v0 + 184);
    v33 = *(_OWORD *)(v0 + 168);
    v34 = *(_OWORD *)(v0 + 192);
    v9 = *(_QWORD *)(v0 + 160);
    v10 = *(_QWORD *)(v0 + 136);
    v31 = *(_OWORD *)(v0 + 120);
    v32 = *(_OWORD *)(v0 + 144);
    v11 = *(_QWORD *)(v0 + 112);
    v12 = *(_QWORD *)(v0 + 88);
    v29 = *(_OWORD *)(v0 + 72);
    v30 = *(_OWORD *)(v0 + 96);
    v13 = *(_QWORD *)(v0 + 64);
    v28 = *(_OWORD *)(v0 + 48);
    v14 = swift_task_alloc();
    *(_QWORD *)(v0 + 248) = v14;
    *(_QWORD *)(v14 + 16) = v6;
    *(_OWORD *)(v14 + 24) = v28;
    *(_QWORD *)(v14 + 40) = v13;
    *(_OWORD *)(v14 + 48) = v29;
    *(_QWORD *)(v14 + 64) = v12;
    *(_OWORD *)(v14 + 72) = v30;
    *(_QWORD *)(v14 + 88) = v11;
    *(_OWORD *)(v14 + 96) = v31;
    *(_QWORD *)(v14 + 112) = v10;
    *(_OWORD *)(v14 + 120) = v32;
    *(_QWORD *)(v14 + 136) = v9;
    *(_OWORD *)(v14 + 144) = v33;
    *(_QWORD *)(v14 + 160) = v8;
    *(_OWORD *)(v14 + 168) = v34;
    *(_QWORD *)(v14 + 184) = v7;
    v15 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 256) = v15;
    sub_23A8F0FA4();
    *v15 = v0;
    v15[1] = sub_23A8B2FB4;
    return sub_23A8F1400();
  }
  else
  {
    if (qword_2542D8828 != -1)
      swift_once();
    v18 = *(_QWORD *)(v0 + 232);
    v17 = *(_QWORD *)(v0 + 240);
    v19 = *(_QWORD *)(v0 + 224);
    v20 = __swift_project_value_buffer(v19, (uint64_t)qword_2542D8DE0);
    swift_beginAccess();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v18 + 16))(v17, v20, v19);
    v21 = sub_23A8F1088();
    v22 = sub_23A8F1274();
    if (os_log_type_enabled(v21, v22))
    {
      v23 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v23 = 0;
      _os_log_impl(&dword_23A8AD000, v21, v22, "Failed to update subscription. Site ID is empty.", v23, 2u);
      MEMORY[0x23B85B51C](v23, -1, -1);
    }
    v25 = *(_QWORD *)(v0 + 232);
    v24 = *(_QWORD *)(v0 + 240);
    v26 = *(_QWORD *)(v0 + 224);

    (*(void (**)(uint64_t, uint64_t))(v25 + 8))(v24, v26);
    sub_23A8C3D5C();
    swift_allocError();
    *v27 = 28;
    swift_willThrow();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_23A8B2FB4()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 264) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23A8B3020()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(v0 + 216);
  v2 = *(void **)(v1 + 16);
  *(_QWORD *)(v1 + 16) = *(_QWORD *)(v0 + 40);

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23A8B306C()
{
  uint64_t v0;

  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23A8B30A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23)
{
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;
  uint64_t v39;
  _QWORD *v40;
  uint64_t v41;
  _QWORD *v42;
  uint64_t v43;
  _QWORD *v44;
  uint64_t v45;
  _QWORD *v46;
  uint64_t v47;
  _QWORD *v48;
  uint64_t v49;
  _QWORD *v50;
  uint64_t v51;
  _QWORD *v52;
  uint64_t v53;
  _QWORD *v54;
  uint64_t v55;
  uint64_t v56;
  _QWORD *v57;
  uint64_t v58;
  _QWORD *v59;
  uint64_t v61;
  unint64_t v62;
  unint64_t v63;
  unint64_t v64;
  unint64_t v65;
  unint64_t v66;
  uint64_t v67;
  uint64_t v68;
  unint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;

  v84 = a7;
  v85 = a8;
  v80 = a5;
  v81 = a6;
  v75 = a3;
  v76 = a4;
  v70 = a2;
  v88 = a21;
  v89 = a22;
  v90 = a18;
  v91 = a20;
  v86 = a17;
  v87 = a19;
  v82 = a15;
  v83 = a16;
  v78 = a13;
  v79 = a14;
  v73 = a11;
  v74 = a12;
  v71 = a9;
  v72 = a10;
  v69 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2542D8CF8) - 8);
  v24 = *(_QWORD *)(v69 + 64);
  MEMORY[0x24BDAC7A8]();
  v68 = (uint64_t)&v61 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569C8870);
  v26 = *(_QWORD *)(v25 - 8);
  v67 = v25;
  v27 = *(_QWORD *)(v26 + 64);
  MEMORY[0x24BDAC7A8]();
  v28 = (char *)&v61 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2542D8AC0);
  MEMORY[0x24BDAC7A8]();
  v30 = (char *)&v61 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  v77 = v30;
  v31 = sub_23A8F1208();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v31 - 8) + 56))(v30, 1, 1, v31);
  (*(void (**)(char *, uint64_t, uint64_t))(v26 + 16))(v28, a1, v25);
  sub_23A8C6700(a23, (uint64_t)&v61 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0), &qword_2542D8CF8);
  v32 = (*(unsigned __int8 *)(v26 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v26 + 80);
  v33 = (v27 + v32 + 7) & 0xFFFFFFFFFFFFFFF8;
  v34 = (v33 + 15) & 0xFFFFFFFFFFFFFFF8;
  v35 = (v34 + 23) & 0xFFFFFFFFFFFFFFF8;
  v36 = (v35 + 23) & 0xFFFFFFFFFFFFFFF8;
  v37 = (v36 + 23) & 0xFFFFFFFFFFFFFFF8;
  v38 = (v37 + 23) & 0xFFFFFFFFFFFFFFF8;
  v62 = (v38 + 23) & 0xFFFFFFFFFFFFFFF8;
  v63 = (v62 + 23) & 0xFFFFFFFFFFFFFFF8;
  v64 = (v63 + 23) & 0xFFFFFFFFFFFFFFF8;
  v66 = (v64 + 23) & 0xFFFFFFFFFFFFFFF8;
  v65 = (v66 + 23) & 0xFFFFFFFFFFFFFFF8;
  v69 = (*(unsigned __int8 *)(v69 + 80) + v65 + 16) & ~(unint64_t)*(unsigned __int8 *)(v69 + 80);
  v39 = swift_allocObject();
  *(_QWORD *)(v39 + 16) = 0;
  *(_QWORD *)(v39 + 24) = 0;
  (*(void (**)(unint64_t, char *, uint64_t))(v26 + 32))(v39 + v32, v28, v67);
  *(_QWORD *)(v39 + v33) = v70;
  v40 = (_QWORD *)(v39 + v34);
  v41 = v76;
  *v40 = v75;
  v40[1] = v41;
  v42 = (_QWORD *)(v39 + v35);
  v43 = v81;
  *v42 = v80;
  v42[1] = v43;
  v44 = (_QWORD *)(v39 + v36);
  v45 = v85;
  *v44 = v84;
  v44[1] = v45;
  v46 = (_QWORD *)(v39 + v37);
  v47 = v72;
  *v46 = v71;
  v46[1] = v47;
  v48 = (_QWORD *)(v39 + v38);
  v49 = v74;
  *v48 = v73;
  v48[1] = v49;
  v50 = (_QWORD *)(v39 + v62);
  v51 = v79;
  *v50 = v78;
  v50[1] = v51;
  v52 = (_QWORD *)(v39 + v63);
  v53 = v83;
  *v52 = v82;
  v52[1] = v53;
  v54 = (_QWORD *)(v39 + v64);
  v56 = v89;
  v55 = v90;
  *v54 = v86;
  v54[1] = v55;
  v57 = (_QWORD *)(v39 + v66);
  v58 = v91;
  *v57 = v87;
  v57[1] = v58;
  v59 = (_QWORD *)(v39 + v65);
  *v59 = v88;
  v59[1] = v56;
  sub_23A8C7E20(v68, v39 + v69, &qword_2542D8CF8);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_23A8B1124((uint64_t)v77, (uint64_t)&unk_2569C88D0, v39);
  return swift_release();
}

uint64_t sub_23A8B3498(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;
  uint64_t v21;

  *(_QWORD *)(v8 + 312) = v20;
  *(_QWORD *)(v8 + 320) = v21;
  *(_OWORD *)(v8 + 296) = v19;
  *(_OWORD *)(v8 + 280) = v18;
  *(_OWORD *)(v8 + 264) = v17;
  *(_OWORD *)(v8 + 248) = v16;
  *(_OWORD *)(v8 + 232) = v15;
  *(_OWORD *)(v8 + 216) = v14;
  *(_OWORD *)(v8 + 200) = v13;
  *(_OWORD *)(v8 + 184) = v12;
  *(_QWORD *)(v8 + 168) = a7;
  *(_QWORD *)(v8 + 176) = a8;
  *(_QWORD *)(v8 + 152) = a5;
  *(_QWORD *)(v8 + 160) = a6;
  *(_QWORD *)(v8 + 144) = a4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2542D8CF8);
  *(_QWORD *)(v8 + 328) = swift_task_alloc();
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569C8870);
  *(_QWORD *)(v8 + 336) = v9;
  v10 = *(_QWORD *)(v9 - 8);
  *(_QWORD *)(v8 + 344) = v10;
  *(_QWORD *)(v8 + 352) = *(_QWORD *)(v10 + 64);
  *(_QWORD *)(v8 + 360) = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23A8B3570()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
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
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD *v34;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;

  v1 = v0[45];
  v2 = v0[42];
  v3 = v0[43];
  v4 = v0[21];
  v5 = v0[18];
  v6 = v0[19];
  type metadata accessor for HomeEnergyXPCConnection();
  swift_allocObject();
  v0[46] = sub_23A8EF888();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v1, v5, v2);
  v7 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v8 = swift_allocObject();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v3 + 32))(v8 + v7, v1, v2);
  v9 = (void *)sub_23A8EFE34((uint64_t)sub_23A8C808C, v8);
  v0[47] = v9;
  swift_release();
  v10 = *(id *)(v6 + 16);
  sub_23A8F0F50();

  v11 = sub_23A8F1130();
  v0[48] = v11;
  swift_bridgeObjectRelease();
  if (v4)
    v12 = sub_23A8F1130();
  else
    v12 = 0;
  v0[49] = v12;
  if (v0[23])
    v13 = sub_23A8F1130();
  else
    v13 = 0;
  v0[50] = v13;
  if (v0[25])
    v14 = sub_23A8F1130();
  else
    v14 = 0;
  v0[51] = v14;
  if (v0[27])
    v15 = sub_23A8F1130();
  else
    v15 = 0;
  v42 = v15;
  v0[52] = v15;
  if (v0[29])
    v16 = sub_23A8F1130();
  else
    v16 = 0;
  v41 = v16;
  v0[53] = v16;
  if (v0[31])
    v17 = sub_23A8F1130();
  else
    v17 = 0;
  v40 = v17;
  v0[54] = v17;
  if (v0[33])
    v18 = sub_23A8F1130();
  else
    v18 = 0;
  v39 = v18;
  v0[55] = v18;
  if (v0[35])
    v19 = sub_23A8F1130();
  else
    v19 = 0;
  v38 = v19;
  v0[56] = v19;
  if (v0[37])
    v20 = sub_23A8F1130();
  else
    v20 = 0;
  v37 = v20;
  v0[57] = v20;
  if (v0[39])
    v21 = sub_23A8F1130();
  else
    v21 = 0;
  v0[58] = v21;
  v22 = v0[41];
  sub_23A8C6700(v0[40], v22, &qword_2542D8CF8);
  v23 = sub_23A8F0CA4();
  v24 = *(_QWORD *)(v23 - 8);
  v25 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v24 + 48))(v22, 1, v23);
  v26 = 0;
  if (v25 != 1)
  {
    v36 = v14;
    v27 = v13;
    v28 = v12;
    v29 = v11;
    v30 = v9;
    v31 = v0[41];
    v26 = sub_23A8F0C44();
    v32 = v31;
    v9 = v30;
    v11 = v29;
    v12 = v28;
    v13 = v27;
    v14 = v36;
    (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v32, v23);
  }
  v0[59] = v26;
  v0[7] = v0 + 15;
  v0[2] = v0;
  v0[3] = sub_23A8B38F8;
  v33 = swift_continuation_init();
  v0[10] = MEMORY[0x24BDAC760];
  v34 = v0 + 10;
  v34[1] = 0x40000000;
  v34[2] = sub_23A8B1098;
  v34[3] = &block_descriptor_186;
  v34[4] = v33;
  objc_msgSend(v9, sel_updateSubscriptionWithSiteID_utilityID_subscriptionID_accessToken_refreshToken_ckFunctionToken_accountName_accountNumber_address_serviceLocationID_alternateSupplier_accessTokenExpirationDate_completionHandler_, v11, v12, v13, v14, v42, v41, v40, v39, v38, v37, v21, v26, v34);
  return swift_continuation_await();
}

uint64_t sub_23A8B38F8()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)v0 + 480) = *(_QWORD *)(*(_QWORD *)v0 + 48);
  return swift_task_switch();
}

uint64_t sub_23A8B3958()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;

  v2 = *(void **)(v0 + 464);
  v1 = *(void **)(v0 + 472);
  v3 = *(void **)(v0 + 448);
  v4 = *(void **)(v0 + 456);
  v5 = *(void **)(v0 + 432);
  v6 = *(void **)(v0 + 440);
  v8 = *(void **)(v0 + 416);
  v7 = *(void **)(v0 + 424);
  v11 = *(void **)(v0 + 408);
  v12 = *(void **)(v0 + 400);
  v13 = *(void **)(v0 + 392);
  v14 = *(void **)(v0 + 384);
  v9 = *(_QWORD *)(v0 + 368);
  v15 = *(_QWORD *)(v0 + 120);
  swift_unknownObjectRelease();

  objc_msgSend(*(id *)(v9 + 16), sel_invalidate);
  *(_QWORD *)(v0 + 136) = v15;
  sub_23A8F11F0();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23A8B3A64()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v2 = *(void **)(v0 + 472);
  v1 = *(_QWORD *)(v0 + 480);
  v4 = *(void **)(v0 + 456);
  v3 = *(void **)(v0 + 464);
  v5 = *(void **)(v0 + 440);
  v6 = *(void **)(v0 + 448);
  v8 = *(void **)(v0 + 432);
  v9 = *(void **)(v0 + 424);
  v10 = *(void **)(v0 + 416);
  v11 = *(void **)(v0 + 408);
  v12 = *(void **)(v0 + 400);
  v13 = *(void **)(v0 + 392);
  v14 = *(void **)(v0 + 384);
  swift_willThrow();
  swift_release();
  swift_unknownObjectRelease();

  *(_QWORD *)(v0 + 128) = v1;
  sub_23A8F11E4();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23A8B3B7C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;

  v9[13] = a8;
  v9[14] = v8;
  v9[11] = a6;
  v9[12] = a7;
  v9[9] = a4;
  v9[10] = a5;
  v9[7] = a2;
  v9[8] = a3;
  v9[6] = a1;
  v10 = sub_23A8F10A0();
  v9[15] = v10;
  v9[16] = *(_QWORD *)(v10 - 8);
  v9[17] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23A8B3BEC()
{
  uint64_t v0;
  id v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  os_log_type_t v19;
  uint8_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _BYTE *v24;
  __int128 v25;
  __int128 v26;

  v1 = *(id *)(*(_QWORD *)(v0 + 112) + 16);
  v2 = sub_23A8F0F50();
  v4 = v3;

  swift_bridgeObjectRelease();
  v5 = HIBYTE(v4) & 0xF;
  if ((v4 & 0x2000000000000000) == 0)
    v5 = v2 & 0xFFFFFFFFFFFFLL;
  if (v5)
  {
    v7 = *(_QWORD *)(v0 + 104);
    v6 = *(_QWORD *)(v0 + 112);
    v8 = *(_QWORD *)(v0 + 80);
    v25 = *(_OWORD *)(v0 + 64);
    v26 = *(_OWORD *)(v0 + 88);
    v10 = *(_QWORD *)(v0 + 48);
    v9 = *(_QWORD *)(v0 + 56);
    v11 = swift_task_alloc();
    *(_QWORD *)(v0 + 144) = v11;
    *(_QWORD *)(v11 + 16) = v6;
    *(_QWORD *)(v11 + 24) = v10;
    *(_QWORD *)(v11 + 32) = v9;
    *(_OWORD *)(v11 + 40) = v25;
    *(_QWORD *)(v11 + 56) = v8;
    *(_OWORD *)(v11 + 64) = v26;
    *(_QWORD *)(v11 + 80) = v7;
    v12 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 152) = v12;
    sub_23A8F0FA4();
    *v12 = v0;
    v12[1] = sub_23A8B3E64;
    return sub_23A8F1400();
  }
  else
  {
    if (qword_2542D8828 != -1)
      swift_once();
    v15 = *(_QWORD *)(v0 + 128);
    v14 = *(_QWORD *)(v0 + 136);
    v16 = *(_QWORD *)(v0 + 120);
    v17 = __swift_project_value_buffer(v16, (uint64_t)qword_2542D8DE0);
    swift_beginAccess();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v15 + 16))(v14, v17, v16);
    v18 = sub_23A8F1088();
    v19 = sub_23A8F1274();
    if (os_log_type_enabled(v18, v19))
    {
      v20 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v20 = 0;
      _os_log_impl(&dword_23A8AD000, v18, v19, "Failed to create subscription. Site ID is empty.", v20, 2u);
      MEMORY[0x23B85B51C](v20, -1, -1);
    }
    v22 = *(_QWORD *)(v0 + 128);
    v21 = *(_QWORD *)(v0 + 136);
    v23 = *(_QWORD *)(v0 + 120);

    (*(void (**)(uint64_t, uint64_t))(v22 + 8))(v21, v23);
    sub_23A8C3D5C();
    swift_allocError();
    *v24 = 28;
    swift_willThrow();
    swift_task_dealloc();
    return (*(uint64_t (**)(_QWORD))(v0 + 8))(0);
  }
}

uint64_t sub_23A8B3E64()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 160) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23A8B3ED0()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(v0 + 112);
  v2 = *(void **)(v1 + 16);
  *(_QWORD *)(v1 + 16) = *(_QWORD *)(v0 + 40);

  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(1);
}

uint64_t sub_23A8B3F20()
{
  uint64_t v0;

  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(0);
}

uint64_t sub_23A8B3F60(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  uint64_t v26;
  _QWORD *v27;
  uint64_t v28;
  _QWORD *v29;
  uint64_t v30;
  _QWORD *v31;
  uint64_t v32;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;

  v42 = a7;
  v43 = a8;
  v39 = a5;
  v40 = a6;
  v36 = a3;
  v37 = a4;
  v35 = a2;
  v41 = a10;
  v38 = a9;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569C8870);
  v12 = *(_QWORD *)(v11 - 8);
  v13 = *(_QWORD *)(v12 + 64);
  MEMORY[0x24BDAC7A8]();
  v14 = (char *)&v34 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2542D8AC0);
  MEMORY[0x24BDAC7A8]();
  v16 = (char *)&v34 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v34 = v16;
  v17 = sub_23A8F1208();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 56))(v16, 1, 1, v17);
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v14, a1, v11);
  v18 = (*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
  v19 = (v13 + v18 + 7) & 0xFFFFFFFFFFFFFFF8;
  v20 = (v19 + 15) & 0xFFFFFFFFFFFFFFF8;
  v21 = (v20 + 23) & 0xFFFFFFFFFFFFFFF8;
  v22 = (v21 + 23) & 0xFFFFFFFFFFFFFFF8;
  v23 = swift_allocObject();
  *(_QWORD *)(v23 + 16) = 0;
  *(_QWORD *)(v23 + 24) = 0;
  (*(void (**)(unint64_t, char *, uint64_t))(v12 + 32))(v23 + v18, v14, v11);
  v24 = v36;
  *(_QWORD *)(v23 + v19) = v35;
  v25 = (_QWORD *)(v23 + v20);
  v26 = v37;
  *v25 = v24;
  v25[1] = v26;
  v27 = (_QWORD *)(v23 + v21);
  v28 = v40;
  *v27 = v39;
  v27[1] = v28;
  v29 = (_QWORD *)(v23 + v22);
  v30 = v43;
  *v29 = v42;
  v29[1] = v30;
  v31 = (_QWORD *)(v23 + ((v22 + 23) & 0xFFFFFFFFFFFFFFF8));
  v32 = v41;
  *v31 = v38;
  v31[1] = v32;
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_23A8B1124((uint64_t)v34, (uint64_t)&unk_2569C88C0, v23);
  return swift_release();
}

uint64_t sub_23A8B4154(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  uint64_t v14;

  *(_QWORD *)(v8 + 216) = v14;
  *(_OWORD *)(v8 + 200) = v13;
  *(_OWORD *)(v8 + 184) = v12;
  *(_QWORD *)(v8 + 168) = a7;
  *(_QWORD *)(v8 + 176) = a8;
  *(_QWORD *)(v8 + 152) = a5;
  *(_QWORD *)(v8 + 160) = a6;
  *(_QWORD *)(v8 + 144) = a4;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569C8870);
  *(_QWORD *)(v8 + 224) = v9;
  v10 = *(_QWORD *)(v9 - 8);
  *(_QWORD *)(v8 + 232) = v10;
  *(_QWORD *)(v8 + 240) = *(_QWORD *)(v10 + 64);
  *(_QWORD *)(v8 + 248) = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23A8B41D8()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v18;

  v1 = v0;
  v18 = v0 + 15;
  v2 = v0[31];
  v3 = v0[28];
  v4 = v0[29];
  v5 = v0[19];
  v6 = v1[18];
  type metadata accessor for HomeEnergyXPCConnection();
  swift_allocObject();
  v1[32] = sub_23A8EF888();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v2, v6, v3);
  v7 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v8 = swift_allocObject();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v4 + 32))(v8 + v7, v2, v3);
  v9 = (void *)sub_23A8EFE34((uint64_t)sub_23A8C7BEC, v8);
  v1[33] = v9;
  swift_release();
  v10 = *(id *)(v5 + 16);
  sub_23A8F0F50();

  v11 = sub_23A8F1130();
  v1[34] = v11;
  swift_bridgeObjectRelease();
  v12 = sub_23A8F1130();
  v1[35] = v12;
  v13 = sub_23A8F1130();
  v1[36] = v13;
  v14 = sub_23A8F1130();
  v1[37] = v14;
  v15 = sub_23A8F1130();
  v1[38] = v15;
  v1[7] = v18;
  v1[2] = v1;
  v1[3] = sub_23A8B43F0;
  v16 = swift_continuation_init();
  v1[10] = MEMORY[0x24BDAC760];
  v1 += 10;
  v1[1] = 0x40000000;
  v1[2] = sub_23A8B1098;
  v1[3] = &block_descriptor_178;
  v1[4] = v16;
  objc_msgSend(v9, sel_createUtilitySubscriptionWithSiteID_utilityID_serviceLocationID_accessToken_refreshToken_completionHandler_, v11, v12, v13, v14, v15, v1);
  return swift_continuation_await();
}

uint64_t sub_23A8B43F0()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)v0 + 312) = *(_QWORD *)(*(_QWORD *)v0 + 48);
  return swift_task_switch();
}

uint64_t sub_23A8B4450()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;

  v2 = *(void **)(v0 + 296);
  v1 = *(void **)(v0 + 304);
  v4 = *(void **)(v0 + 280);
  v3 = *(void **)(v0 + 288);
  v5 = *(void **)(v0 + 272);
  v6 = *(_QWORD *)(v0 + 256);
  v7 = *(_QWORD *)(v0 + 120);
  swift_unknownObjectRelease();

  objc_msgSend(*(id *)(v6 + 16), sel_invalidate);
  *(_QWORD *)(v0 + 136) = v7;
  sub_23A8F11F0();
  swift_release();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23A8B44FC()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = *(void **)(v0 + 304);
  v1 = *(_QWORD *)(v0 + 312);
  v4 = *(void **)(v0 + 288);
  v3 = *(void **)(v0 + 296);
  v5 = *(void **)(v0 + 272);
  v6 = *(void **)(v0 + 280);
  swift_willThrow();
  swift_release();
  swift_unknownObjectRelease();

  *(_QWORD *)(v0 + 128) = v1;
  sub_23A8F11E4();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23A8B45A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v12;
  uint64_t v13;

  *(_QWORD *)(v9 + 128) = v13;
  *(_QWORD *)(v9 + 136) = v8;
  *(_OWORD *)(v9 + 112) = v12;
  *(_QWORD *)(v9 + 96) = a7;
  *(_QWORD *)(v9 + 104) = a8;
  *(_QWORD *)(v9 + 80) = a5;
  *(_QWORD *)(v9 + 88) = a6;
  *(_QWORD *)(v9 + 64) = a3;
  *(_QWORD *)(v9 + 72) = a4;
  *(_QWORD *)(v9 + 48) = a1;
  *(_QWORD *)(v9 + 56) = a2;
  v10 = sub_23A8F10A0();
  *(_QWORD *)(v9 + 144) = v10;
  *(_QWORD *)(v9 + 152) = *(_QWORD *)(v10 - 8);
  *(_QWORD *)(v9 + 160) = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23A8B4620()
{
  uint64_t v0;
  id v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
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
  __int128 v15;
  _QWORD *v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  os_log_type_t v23;
  uint8_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _BYTE *v28;
  __int128 v29;

  v1 = *(id *)(*(_QWORD *)(v0 + 136) + 16);
  v2 = sub_23A8F0F50();
  v4 = v3;

  swift_bridgeObjectRelease();
  v5 = HIBYTE(v4) & 0xF;
  if ((v4 & 0x2000000000000000) == 0)
    v5 = v2 & 0xFFFFFFFFFFFFLL;
  if (v5)
  {
    v7 = *(_QWORD *)(v0 + 128);
    v6 = *(_QWORD *)(v0 + 136);
    v8 = *(_QWORD *)(v0 + 120);
    v29 = *(_OWORD *)(v0 + 104);
    v10 = *(_QWORD *)(v0 + 72);
    v9 = *(_QWORD *)(v0 + 80);
    v12 = *(_QWORD *)(v0 + 56);
    v11 = *(_QWORD *)(v0 + 64);
    v13 = *(_QWORD *)(v0 + 48);
    v14 = swift_task_alloc();
    *(_QWORD *)(v0 + 168) = v14;
    v15 = *(_OWORD *)(v0 + 88);
    *(_QWORD *)(v14 + 16) = v6;
    *(_QWORD *)(v14 + 24) = v13;
    *(_QWORD *)(v14 + 32) = v12;
    *(_QWORD *)(v14 + 40) = v11;
    *(_QWORD *)(v14 + 48) = v10;
    *(_QWORD *)(v14 + 56) = v9;
    *(_OWORD *)(v14 + 64) = v15;
    *(_OWORD *)(v14 + 80) = v29;
    *(_QWORD *)(v14 + 96) = v8;
    *(_QWORD *)(v14 + 104) = v7;
    v16 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 176) = v16;
    sub_23A8F0FA4();
    *v16 = v0;
    v16[1] = sub_23A8B48A8;
    return sub_23A8F1400();
  }
  else
  {
    if (qword_2542D8828 != -1)
      swift_once();
    v19 = *(_QWORD *)(v0 + 152);
    v18 = *(_QWORD *)(v0 + 160);
    v20 = *(_QWORD *)(v0 + 144);
    v21 = __swift_project_value_buffer(v20, (uint64_t)qword_2542D8DE0);
    swift_beginAccess();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v19 + 16))(v18, v21, v20);
    v22 = sub_23A8F1088();
    v23 = sub_23A8F1274();
    if (os_log_type_enabled(v22, v23))
    {
      v24 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v24 = 0;
      _os_log_impl(&dword_23A8AD000, v22, v23, "Failed to create subscription. Site ID is empty.", v24, 2u);
      MEMORY[0x23B85B51C](v24, -1, -1);
    }
    v26 = *(_QWORD *)(v0 + 152);
    v25 = *(_QWORD *)(v0 + 160);
    v27 = *(_QWORD *)(v0 + 144);

    (*(void (**)(uint64_t, uint64_t))(v26 + 8))(v25, v27);
    sub_23A8C3D5C();
    swift_allocError();
    *v28 = 28;
    swift_willThrow();
    swift_task_dealloc();
    return (*(uint64_t (**)(_QWORD))(v0 + 8))(0);
  }
}

uint64_t sub_23A8B48A8()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 184) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23A8B4914()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(v0 + 136);
  v2 = *(void **)(v1 + 16);
  *(_QWORD *)(v1 + 16) = *(_QWORD *)(v0 + 40);

  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(1);
}

uint64_t sub_23A8B4964()
{
  uint64_t v0;

  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(0);
}

uint64_t sub_23A8B49A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, unint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
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
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD *v33;
  uint64_t v34;
  _QWORD *v35;
  uint64_t v36;
  _QWORD *v37;
  uint64_t v38;
  _QWORD *v39;
  uint64_t v40;
  _QWORD *v41;
  uint64_t v42;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  char *v49;
  unint64_t v50;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;

  v56 = a6;
  v57 = a7;
  v54 = a4;
  v55 = a5;
  v52 = a2;
  v53 = a3;
  v61 = a12;
  v62 = a13;
  v59 = a8;
  v60 = a11;
  v58 = a10;
  v50 = a9;
  v14 = sub_23A8F0CA4();
  v15 = *(_QWORD *)(v14 - 8);
  v48 = v14;
  v16 = *(_QWORD *)(v15 + 64);
  v17 = v15;
  MEMORY[0x24BDAC7A8]();
  v49 = (char *)&v44 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569C8870);
  v19 = *(_QWORD *)(v18 - 8);
  v46 = v18;
  v20 = *(_QWORD *)(v19 + 64);
  MEMORY[0x24BDAC7A8]();
  v47 = (char *)&v44 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2542D8AC0);
  MEMORY[0x24BDAC7A8]();
  v22 = (char *)&v44 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v51 = v22;
  v23 = sub_23A8F1208();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 56))(v22, 1, 1, v23);
  (*(void (**)(char *, uint64_t, uint64_t))(v19 + 16))((char *)&v44 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v18);
  v45 = v17;
  (*(void (**)(char *, unint64_t, uint64_t))(v17 + 16))((char *)&v44 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0), v50, v14);
  v24 = (*(unsigned __int8 *)(v19 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
  v25 = (v20 + v24 + 7) & 0xFFFFFFFFFFFFFFF8;
  v26 = (v25 + 15) & 0xFFFFFFFFFFFFFFF8;
  v27 = (v26 + 23) & 0xFFFFFFFFFFFFFFF8;
  v28 = (v27 + 23) & 0xFFFFFFFFFFFFFFF8;
  v29 = (*(unsigned __int8 *)(v17 + 80) + v28 + 16) & ~(unint64_t)*(unsigned __int8 *)(v17 + 80);
  v30 = (v16 + v29 + 7) & 0xFFFFFFFFFFFFFFF8;
  v50 = (v30 + 23) & 0xFFFFFFFFFFFFFFF8;
  v31 = swift_allocObject();
  *(_QWORD *)(v31 + 16) = 0;
  *(_QWORD *)(v31 + 24) = 0;
  (*(void (**)(unint64_t, char *, uint64_t))(v19 + 32))(v31 + v24, v47, v46);
  v32 = v53;
  *(_QWORD *)(v31 + v25) = v52;
  v33 = (_QWORD *)(v31 + v26);
  v34 = v54;
  *v33 = v32;
  v33[1] = v34;
  v35 = (_QWORD *)(v31 + v27);
  v36 = v56;
  *v35 = v55;
  v35[1] = v36;
  v37 = (_QWORD *)(v31 + v28);
  v38 = v59;
  *v37 = v57;
  v37[1] = v38;
  (*(void (**)(unint64_t, char *, uint64_t))(v45 + 32))(v31 + v29, v49, v48);
  v39 = (_QWORD *)(v31 + v30);
  v40 = v60;
  *v39 = v58;
  v39[1] = v40;
  v41 = (_QWORD *)(v31 + v50);
  v42 = v62;
  *v41 = v61;
  v41[1] = v42;
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_23A8B1124((uint64_t)v51, (uint64_t)&unk_2569C88B0, v31);
  return swift_release();
}

uint64_t sub_23A8B4C5C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;
  uint64_t v16;

  *(_QWORD *)(v8 + 232) = v15;
  *(_QWORD *)(v8 + 240) = v16;
  *(_OWORD *)(v8 + 216) = v14;
  *(_OWORD *)(v8 + 200) = v13;
  *(_OWORD *)(v8 + 184) = v12;
  *(_QWORD *)(v8 + 168) = a7;
  *(_QWORD *)(v8 + 176) = a8;
  *(_QWORD *)(v8 + 152) = a5;
  *(_QWORD *)(v8 + 160) = a6;
  *(_QWORD *)(v8 + 144) = a4;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569C8870);
  *(_QWORD *)(v8 + 248) = v9;
  v10 = *(_QWORD *)(v9 - 8);
  *(_QWORD *)(v8 + 256) = v10;
  *(_QWORD *)(v8 + 264) = *(_QWORD *)(v10 + 64);
  *(_QWORD *)(v8 + 272) = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23A8B4CE8()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v20;

  v1 = v0[34];
  v2 = v0[31];
  v3 = v0[32];
  v20 = v0[30];
  v4 = v0[18];
  v5 = v0[19];
  type metadata accessor for HomeEnergyXPCConnection();
  swift_allocObject();
  v0[35] = sub_23A8EF888();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v1, v4, v2);
  v6 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v7 = swift_allocObject();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v3 + 32))(v7 + v6, v1, v2);
  v8 = (void *)sub_23A8EFE34((uint64_t)sub_23A8C79A4, v7);
  v0[36] = v8;
  swift_release();
  v9 = *(id *)(v5 + 16);
  sub_23A8F0F50();

  v10 = sub_23A8F1130();
  v0[37] = v10;
  swift_bridgeObjectRelease();
  v11 = sub_23A8F1130();
  v0[38] = v11;
  v12 = sub_23A8F1130();
  v0[39] = v12;
  v13 = sub_23A8F1130();
  v0[40] = v13;
  v14 = sub_23A8F0C44();
  v0[41] = v14;
  v15 = sub_23A8F1130();
  v0[42] = v15;
  if (v20)
    v16 = sub_23A8F1130();
  else
    v16 = 0;
  v0[43] = v16;
  v0[7] = v0 + 15;
  v0[2] = v0;
  v0[3] = sub_23A8B4F38;
  v17 = swift_continuation_init();
  v0[10] = MEMORY[0x24BDAC760];
  v18 = v0 + 10;
  v18[1] = 0x40000000;
  v18[2] = sub_23A8B1098;
  v18[3] = &block_descriptor_170;
  v18[4] = v17;
  objc_msgSend(v8, sel_createUtilitySubscriptionWithSiteID_utilityID_serviceLocationID_accessToken_accessTokenExpirationDate_refreshToken_utilityCustomerName_completionHandler_, v10, v11, v12, v13, v14, v15, v16, v18);
  return swift_continuation_await();
}

uint64_t sub_23A8B4F38()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)v0 + 352) = *(_QWORD *)(*(_QWORD *)v0 + 48);
  return swift_task_switch();
}

uint64_t sub_23A8B4F98()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;

  v2 = *(void **)(v0 + 336);
  v1 = *(void **)(v0 + 344);
  v4 = *(void **)(v0 + 320);
  v3 = *(void **)(v0 + 328);
  v6 = *(void **)(v0 + 304);
  v5 = *(void **)(v0 + 312);
  v7 = *(void **)(v0 + 296);
  v8 = *(_QWORD *)(v0 + 280);
  v9 = *(_QWORD *)(v0 + 120);
  swift_unknownObjectRelease();

  objc_msgSend(*(id *)(v8 + 16), sel_invalidate);
  *(_QWORD *)(v0 + 136) = v9;
  sub_23A8F11F0();
  swift_release();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23A8B5054()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v8;
  void *v9;

  v2 = *(void **)(v0 + 344);
  v1 = *(_QWORD *)(v0 + 352);
  v4 = *(void **)(v0 + 328);
  v3 = *(void **)(v0 + 336);
  v5 = *(void **)(v0 + 312);
  v6 = *(void **)(v0 + 320);
  v8 = *(void **)(v0 + 304);
  v9 = *(void **)(v0 + 296);
  swift_willThrow();
  swift_release();
  swift_unknownObjectRelease();

  *(_QWORD *)(v0 + 128) = v1;
  sub_23A8F11E4();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23A8B5118(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  uint64_t v14;

  *(_QWORD *)(v9 + 144) = v14;
  *(_QWORD *)(v9 + 152) = v8;
  *(_OWORD *)(v9 + 112) = v12;
  *(_OWORD *)(v9 + 128) = v13;
  *(_QWORD *)(v9 + 96) = a7;
  *(_QWORD *)(v9 + 104) = a8;
  *(_QWORD *)(v9 + 80) = a5;
  *(_QWORD *)(v9 + 88) = a6;
  *(_QWORD *)(v9 + 64) = a3;
  *(_QWORD *)(v9 + 72) = a4;
  *(_QWORD *)(v9 + 48) = a1;
  *(_QWORD *)(v9 + 56) = a2;
  v10 = sub_23A8F10A0();
  *(_QWORD *)(v9 + 160) = v10;
  *(_QWORD *)(v9 + 168) = *(_QWORD *)(v10 - 8);
  *(_QWORD *)(v9 + 176) = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23A8B5194()
{
  uint64_t v0;
  id v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
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
  __int128 v15;
  _QWORD *v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  os_log_type_t v23;
  uint8_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _BYTE *v28;
  __int128 v29;
  __int128 v30;

  v1 = *(id *)(*(_QWORD *)(v0 + 152) + 16);
  v2 = sub_23A8F0F50();
  v4 = v3;

  swift_bridgeObjectRelease();
  v5 = HIBYTE(v4) & 0xF;
  if ((v4 & 0x2000000000000000) == 0)
    v5 = v2 & 0xFFFFFFFFFFFFLL;
  if (v5)
  {
    v7 = *(_QWORD *)(v0 + 144);
    v6 = *(_QWORD *)(v0 + 152);
    v8 = *(_QWORD *)(v0 + 136);
    v29 = *(_OWORD *)(v0 + 104);
    v30 = *(_OWORD *)(v0 + 120);
    v10 = *(_QWORD *)(v0 + 72);
    v9 = *(_QWORD *)(v0 + 80);
    v12 = *(_QWORD *)(v0 + 56);
    v11 = *(_QWORD *)(v0 + 64);
    v13 = *(_QWORD *)(v0 + 48);
    v14 = swift_task_alloc();
    *(_QWORD *)(v0 + 184) = v14;
    v15 = *(_OWORD *)(v0 + 88);
    *(_QWORD *)(v14 + 16) = v6;
    *(_QWORD *)(v14 + 24) = v13;
    *(_QWORD *)(v14 + 32) = v12;
    *(_QWORD *)(v14 + 40) = v11;
    *(_QWORD *)(v14 + 48) = v10;
    *(_QWORD *)(v14 + 56) = v9;
    *(_OWORD *)(v14 + 64) = v15;
    *(_OWORD *)(v14 + 80) = v29;
    *(_OWORD *)(v14 + 96) = v30;
    *(_QWORD *)(v14 + 112) = v8;
    *(_QWORD *)(v14 + 120) = v7;
    v16 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 192) = v16;
    sub_23A8F0FA4();
    *v16 = v0;
    v16[1] = sub_23A8B5428;
    return sub_23A8F1400();
  }
  else
  {
    if (qword_2542D8828 != -1)
      swift_once();
    v19 = *(_QWORD *)(v0 + 168);
    v18 = *(_QWORD *)(v0 + 176);
    v20 = *(_QWORD *)(v0 + 160);
    v21 = __swift_project_value_buffer(v20, (uint64_t)qword_2542D8DE0);
    swift_beginAccess();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v19 + 16))(v18, v21, v20);
    v22 = sub_23A8F1088();
    v23 = sub_23A8F1274();
    if (os_log_type_enabled(v22, v23))
    {
      v24 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v24 = 0;
      _os_log_impl(&dword_23A8AD000, v22, v23, "Failed to create subscription. Site ID is empty.", v24, 2u);
      MEMORY[0x23B85B51C](v24, -1, -1);
    }
    v26 = *(_QWORD *)(v0 + 168);
    v25 = *(_QWORD *)(v0 + 176);
    v27 = *(_QWORD *)(v0 + 160);

    (*(void (**)(uint64_t, uint64_t))(v26 + 8))(v25, v27);
    sub_23A8C3D5C();
    swift_allocError();
    *v28 = 28;
    swift_willThrow();
    swift_task_dealloc();
    return (*(uint64_t (**)(_QWORD))(v0 + 8))(0);
  }
}

uint64_t sub_23A8B5428()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 200) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23A8B5494()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(v0 + 152);
  v2 = *(void **)(v1 + 16);
  *(_QWORD *)(v1 + 16) = *(_QWORD *)(v0 + 40);

  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(1);
}

uint64_t sub_23A8B54E4()
{
  uint64_t v0;

  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(0);
}

uint64_t sub_23A8B5524(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15)
{
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  _QWORD *v34;
  uint64_t v35;
  _QWORD *v36;
  uint64_t v37;
  _QWORD *v38;
  uint64_t v39;
  _QWORD *v40;
  uint64_t v41;
  _QWORD *v42;
  uint64_t v43;
  _QWORD *v44;
  uint64_t v45;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  uint64_t v51;
  char *v52;
  unint64_t v53;
  uint64_t v54;
  char *v55;
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

  v58 = a5;
  v59 = a6;
  v56 = a3;
  v57 = a4;
  v53 = a1;
  v54 = a2;
  v66 = a14;
  v67 = a15;
  v65 = a13;
  v63 = a8;
  v64 = a12;
  v61 = a7;
  v62 = a11;
  v60 = a10;
  v15 = sub_23A8F0CA4();
  v16 = *(_QWORD *)(v15 - 8);
  v51 = v15;
  v17 = *(_QWORD *)(v16 + 64);
  v18 = v16;
  MEMORY[0x24BDAC7A8]();
  v52 = (char *)&v47 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569C8870);
  v20 = *(_QWORD *)(v19 - 8);
  v49 = v19;
  v21 = *(_QWORD *)(v20 + 64);
  MEMORY[0x24BDAC7A8]();
  v50 = (char *)&v47 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2542D8AC0);
  MEMORY[0x24BDAC7A8]();
  v23 = (char *)&v47 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v55 = v23;
  v24 = sub_23A8F1208();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 56))(v23, 1, 1, v24);
  (*(void (**)(char *, unint64_t, uint64_t))(v20 + 16))((char *)&v47 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0), v53, v19);
  v48 = v18;
  (*(void (**)(char *, uint64_t, uint64_t))(v18 + 16))((char *)&v47 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0), a9, v15);
  v25 = (*(unsigned __int8 *)(v20 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v20 + 80);
  v26 = (v21 + v25 + 7) & 0xFFFFFFFFFFFFFFF8;
  v27 = (v26 + 15) & 0xFFFFFFFFFFFFFFF8;
  v28 = (v27 + 23) & 0xFFFFFFFFFFFFFFF8;
  v29 = (v28 + 23) & 0xFFFFFFFFFFFFFFF8;
  v30 = (*(unsigned __int8 *)(v18 + 80) + v29 + 16) & ~(unint64_t)*(unsigned __int8 *)(v18 + 80);
  v31 = (v17 + v30 + 7) & 0xFFFFFFFFFFFFFFF8;
  v32 = (v31 + 23) & 0xFFFFFFFFFFFFFFF8;
  v53 = (v32 + 23) & 0xFFFFFFFFFFFFFFF8;
  v33 = swift_allocObject();
  *(_QWORD *)(v33 + 16) = 0;
  *(_QWORD *)(v33 + 24) = 0;
  (*(void (**)(unint64_t, char *, uint64_t))(v20 + 32))(v33 + v25, v50, v49);
  *(_QWORD *)(v33 + v26) = v54;
  v34 = (_QWORD *)(v33 + v27);
  v35 = v57;
  *v34 = v56;
  v34[1] = v35;
  v36 = (_QWORD *)(v33 + v28);
  v37 = v59;
  *v36 = v58;
  v36[1] = v37;
  v38 = (_QWORD *)(v33 + v29);
  v39 = v63;
  *v38 = v61;
  v38[1] = v39;
  (*(void (**)(unint64_t, char *, uint64_t))(v48 + 32))(v33 + v30, v52, v51);
  v40 = (_QWORD *)(v33 + v31);
  v41 = v62;
  *v40 = v60;
  v40[1] = v41;
  v42 = (_QWORD *)(v33 + v32);
  v43 = v65;
  *v42 = v64;
  v42[1] = v43;
  v44 = (_QWORD *)(v33 + v53);
  v45 = v67;
  *v44 = v66;
  v44[1] = v45;
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_23A8B1124((uint64_t)v55, (uint64_t)&unk_2569C88A0, v33);
  return swift_release();
}

uint64_t sub_23A8B57FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;
  uint64_t v17;

  *(_QWORD *)(v8 + 248) = v16;
  *(_QWORD *)(v8 + 256) = v17;
  *(_OWORD *)(v8 + 232) = v15;
  *(_OWORD *)(v8 + 216) = v14;
  *(_OWORD *)(v8 + 200) = v13;
  *(_OWORD *)(v8 + 184) = v12;
  *(_QWORD *)(v8 + 168) = a7;
  *(_QWORD *)(v8 + 176) = a8;
  *(_QWORD *)(v8 + 152) = a5;
  *(_QWORD *)(v8 + 160) = a6;
  *(_QWORD *)(v8 + 144) = a4;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569C8870);
  *(_QWORD *)(v8 + 264) = v9;
  v10 = *(_QWORD *)(v9 - 8);
  *(_QWORD *)(v8 + 272) = v10;
  *(_QWORD *)(v8 + 280) = *(_QWORD *)(v10 + 64);
  *(_QWORD *)(v8 + 288) = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23A8B588C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  id v20;
  uint64_t v21;

  v1 = v0[36];
  v3 = v0[33];
  v2 = v0[34];
  v21 = v0[32];
  v4 = v0[18];
  v5 = v0[19];
  type metadata accessor for HomeEnergyXPCConnection();
  swift_allocObject();
  v0[37] = sub_23A8EF888();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v4, v3);
  v6 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v7 = swift_allocObject();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v2 + 32))(v7 + v6, v1, v3);
  v20 = (id)sub_23A8EFE34((uint64_t)sub_23A8C76C4, v7);
  v0[38] = v20;
  swift_release();
  v8 = *(id *)(v5 + 16);
  sub_23A8F0F50();

  v9 = sub_23A8F1130();
  v0[39] = v9;
  swift_bridgeObjectRelease();
  v10 = sub_23A8F1130();
  v0[40] = v10;
  v11 = sub_23A8F1130();
  v0[41] = v11;
  v12 = sub_23A8F1130();
  v0[42] = v12;
  v13 = sub_23A8F0C44();
  v0[43] = v13;
  v14 = sub_23A8F1130();
  v0[44] = v14;
  v15 = sub_23A8F1130();
  v0[45] = v15;
  if (v21)
    v16 = sub_23A8F1130();
  else
    v16 = 0;
  v0[46] = v16;
  v0[7] = v0 + 15;
  v0[2] = v0;
  v0[3] = sub_23A8B5B00;
  v17 = swift_continuation_init();
  v0[10] = MEMORY[0x24BDAC760];
  v18 = v0 + 10;
  v18[1] = 0x40000000;
  v18[2] = sub_23A8B1098;
  v18[3] = &block_descriptor_162;
  v18[4] = v17;
  objc_msgSend(v20, sel_createUtilitySubscriptionWithSiteID_utilityID_serviceLocationID_accessToken_accessTokenExpirationDate_refreshToken_address_utilityCustomerName_completionHandler_, v9, v10, v11, v12, v13, v14, v15, v16, v18);
  return swift_continuation_await();
}

uint64_t sub_23A8B5B00()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)v0 + 376) = *(_QWORD *)(*(_QWORD *)v0 + 48);
  return swift_task_switch();
}

uint64_t sub_23A8B5B60()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v11;

  v2 = *(void **)(v0 + 360);
  v1 = *(void **)(v0 + 368);
  v4 = *(void **)(v0 + 344);
  v3 = *(void **)(v0 + 352);
  v6 = *(void **)(v0 + 328);
  v5 = *(void **)(v0 + 336);
  v7 = *(void **)(v0 + 312);
  v8 = *(void **)(v0 + 320);
  v9 = *(_QWORD *)(v0 + 296);
  v11 = *(_QWORD *)(v0 + 120);
  swift_unknownObjectRelease();

  objc_msgSend(*(id *)(v9 + 16), sel_invalidate);
  *(_QWORD *)(v0 + 136) = v11;
  sub_23A8F11F0();
  swift_release();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23A8B5C28()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v8;
  void *v9;
  void *v10;

  v2 = *(void **)(v0 + 368);
  v1 = *(_QWORD *)(v0 + 376);
  v4 = *(void **)(v0 + 352);
  v3 = *(void **)(v0 + 360);
  v5 = *(void **)(v0 + 336);
  v6 = *(void **)(v0 + 344);
  v8 = *(void **)(v0 + 328);
  v9 = *(void **)(v0 + 320);
  v10 = *(void **)(v0 + 312);
  swift_willThrow();
  swift_release();
  swift_unknownObjectRelease();

  *(_QWORD *)(v0 + 128) = v1;
  sub_23A8F11E4();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23A8B5CFC()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 24) = v0;
  return swift_task_switch();
}

uint64_t sub_23A8B5D14()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 32) = v1;
  sub_23A8F0FA4();
  *v1 = v0;
  v1[1] = sub_23A8B5DA0;
  return sub_23A8F1400();
}

uint64_t sub_23A8B5DA0()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 40) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23A8B5E04()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(v0 + 24);
  v2 = *(void **)(v1 + 16);
  *(_QWORD *)(v1 + 16) = *(_QWORD *)(v0 + 16);

  return (*(uint64_t (**)(uint64_t))(v0 + 8))(1);
}

uint64_t sub_23A8B5E44()
{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD))(v0 + 8))(0);
}

uint64_t sub_23A8B5E54(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;

  v5[18] = a4;
  v5[19] = a5;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569C8870);
  v5[20] = v6;
  v7 = *(_QWORD *)(v6 - 8);
  v5[21] = v7;
  v5[22] = *(_QWORD *)(v7 + 64);
  v5[23] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23A8B5EBC()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;

  v1 = v0[23];
  v2 = v0[20];
  v3 = v0[21];
  v4 = v0[18];
  v5 = v0[19];
  type metadata accessor for HomeEnergyXPCConnection();
  swift_allocObject();
  v0[24] = sub_23A8EF888();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v1, v4, v2);
  v6 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v7 = swift_allocObject();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v3 + 32))(v7 + v6, v1, v2);
  v8 = (void *)sub_23A8EFE34((uint64_t)sub_23A8C73B4, v7);
  v0[25] = v8;
  swift_release();
  v9 = *(id *)(v5 + 16);
  sub_23A8F0F50();

  v10 = sub_23A8F1130();
  v0[26] = v10;
  swift_bridgeObjectRelease();
  v0[7] = v0 + 15;
  v0[2] = v0;
  v0[3] = sub_23A8B6050;
  v11 = swift_continuation_init();
  v0[10] = MEMORY[0x24BDAC760];
  v0[11] = 0x40000000;
  v0[12] = sub_23A8B1098;
  v0[13] = &block_descriptor_154;
  v0[14] = v11;
  objc_msgSend(v8, sel_revokeUtilitySubscriptionWithSiteID_completionHandler_, v10, v0 + 10);
  return swift_continuation_await();
}

uint64_t sub_23A8B6050()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)v0 + 216) = *(_QWORD *)(*(_QWORD *)v0 + 48);
  return swift_task_switch();
}

uint64_t sub_23A8B60B0()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 24) = v0;
  return swift_task_switch();
}

uint64_t sub_23A8B60C8()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 32) = v1;
  sub_23A8F0FA4();
  *v1 = v0;
  v1[1] = sub_23A8B6154;
  return sub_23A8F1400();
}

uint64_t sub_23A8B6154()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 40) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23A8B61B8()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(v0 + 24);
  v2 = *(void **)(v1 + 16);
  *(_QWORD *)(v1 + 16) = *(_QWORD *)(v0 + 16);

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23A8B61F4()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23A8B6200(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;

  v5[18] = a4;
  v5[19] = a5;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569C8870);
  v5[20] = v6;
  v7 = *(_QWORD *)(v6 - 8);
  v5[21] = v7;
  v5[22] = *(_QWORD *)(v7 + 64);
  v5[23] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23A8B6268()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;

  v1 = v0[23];
  v2 = v0[20];
  v3 = v0[21];
  v4 = v0[18];
  v5 = v0[19];
  type metadata accessor for HomeEnergyXPCConnection();
  swift_allocObject();
  v0[24] = sub_23A8EF888();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v1, v4, v2);
  v6 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v7 = swift_allocObject();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v3 + 32))(v7 + v6, v1, v2);
  v8 = (void *)sub_23A8EFE34((uint64_t)sub_23A8C723C, v7);
  v0[25] = v8;
  swift_release();
  v9 = *(id *)(v5 + 16);
  sub_23A8F0F50();

  v10 = sub_23A8F1130();
  v0[26] = v10;
  swift_bridgeObjectRelease();
  v0[7] = v0 + 15;
  v0[2] = v0;
  v0[3] = sub_23A8B63FC;
  v11 = swift_continuation_init();
  v0[10] = MEMORY[0x24BDAC760];
  v0[11] = 0x40000000;
  v0[12] = sub_23A8B1098;
  v0[13] = &block_descriptor_146;
  v0[14] = v11;
  objc_msgSend(v8, sel_renewUtilityAccessTokenWithSiteID_completionHandler_, v10, v0 + 10);
  return swift_continuation_await();
}

uint64_t sub_23A8B63FC()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)v0 + 216) = *(_QWORD *)(*(_QWORD *)v0 + 48);
  return swift_task_switch();
}

uint64_t sub_23A8B645C()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(void **)(v0 + 208);
  v2 = *(_QWORD *)(v0 + 192);
  v3 = *(_QWORD *)(v0 + 120);
  swift_unknownObjectRelease();

  objc_msgSend(*(id *)(v2 + 16), sel_invalidate);
  *(_QWORD *)(v0 + 136) = v3;
  sub_23A8F11F0();
  swift_release();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23A8B64E0()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;

  v2 = *(void **)(v0 + 208);
  v1 = *(_QWORD *)(v0 + 216);
  swift_willThrow();
  swift_release();
  swift_unknownObjectRelease();

  *(_QWORD *)(v0 + 128) = v1;
  sub_23A8F11E4();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23A8B6564(void *a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  id v13;
  id v14;
  NSObject *v15;
  os_log_type_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  unint64_t v24;
  id v25;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  v8 = sub_23A8F10A0();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2542D8828 != -1)
    swift_once();
  v12 = __swift_project_value_buffer(v8, (uint64_t)qword_2542D8DE0);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, v12, v8);
  v13 = a1;
  v14 = a1;
  v15 = sub_23A8F1088();
  v16 = sub_23A8F1274();
  if (os_log_type_enabled(v15, v16))
  {
    v17 = swift_slowAlloc();
    v28 = v9;
    v18 = a3;
    v19 = a4;
    v20 = v17;
    v21 = swift_slowAlloc();
    v31 = v21;
    *(_DWORD *)v20 = 136315394;
    v29 = a2;
    v30 = sub_23A8BF840(v18, v19, &v31);
    sub_23A8F12A4();
    *(_WORD *)(v20 + 12) = 2080;
    v30 = (uint64_t)a1;
    v22 = a1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2542D8AE0);
    v23 = sub_23A8F1148();
    v30 = sub_23A8BF840(v23, v24, &v31);
    sub_23A8F12A4();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_23A8AD000, v15, v16, "%s error: %s", (uint8_t *)v20, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x23B85B51C](v21, -1, -1);
    MEMORY[0x23B85B51C](v20, -1, -1);

    (*(void (**)(char *, uint64_t))(v28 + 8))(v11, v8);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  }
  v31 = (uint64_t)a1;
  v25 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569C8870);
  return sub_23A8F11E4();
}

uint64_t sub_23A8B6818()
{
  _QWORD *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  _QWORD v9[5];
  _QWORD *v10;

  sub_23A8F0DF4();
  v1 = (void *)sub_23A8F1130();
  swift_bridgeObjectRelease();
  v2 = (void *)v0[3];
  v3 = (void *)v0[5];
  v9[4] = sub_23A8C65C4;
  v10 = v0;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 1107296256;
  v9[2] = sub_23A8D11DC;
  v9[3] = &block_descriptor_92;
  v4 = _Block_copy(v9);
  v5 = v1;
  v6 = v3;
  swift_retain();
  swift_release();
  v7 = objc_msgSend(v2, sel_addObserverForName_object_queue_usingBlock_, v5, 0, v6, v4);
  _Block_release(v4);

  v0[4] = v7;
  return swift_unknownObjectRelease();
}

uint64_t sub_23A8B6920(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  char v10;
  uint64_t result;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint64_t v15;
  uint8_t *v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint8_t *v22;
  uint64_t v23;
  uint64_t ObjectType;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint8_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  _QWORD v34[5];
  __int128 v35;
  __int128 v36;

  v3 = sub_23A8F10A0();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8]();
  v6 = (char *)&v29 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_23A8F0C08();
  if (!v7)
  {
    v35 = 0u;
    v36 = 0u;
    return sub_23A8C64C8((uint64_t)&v35, &qword_2542D8AE8);
  }
  v8 = v7;
  v32 = 0xD000000000000011;
  v33 = 0x800000023A8F3820;
  sub_23A8F1304();
  if (*(_QWORD *)(v8 + 16) && (v9 = sub_23A8BFF40((uint64_t)v34), (v10 & 1) != 0))
  {
    sub_23A8C44C0(*(_QWORD *)(v8 + 56) + 32 * v9, (uint64_t)&v35);
  }
  else
  {
    v35 = 0u;
    v36 = 0u;
  }
  swift_bridgeObjectRelease();
  sub_23A8C63A8((uint64_t)v34);
  if (!*((_QWORD *)&v36 + 1))
    return sub_23A8C64C8((uint64_t)&v35, &qword_2542D8AE8);
  __swift_instantiateConcreteTypeFromMangledName(qword_2542D8B18);
  result = swift_dynamicCast();
  if ((result & 1) != 0)
  {
    if (qword_2542D8828 != -1)
      swift_once();
    v12 = __swift_project_value_buffer(v3, (uint64_t)qword_2542D8DE0);
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v12, v3);
    swift_bridgeObjectRetain();
    v13 = sub_23A8F1088();
    v14 = sub_23A8F1280();
    if (os_log_type_enabled(v13, v14))
    {
      v15 = swift_slowAlloc();
      v31 = a2;
      v16 = (uint8_t *)v15;
      v30 = swift_slowAlloc();
      *(_QWORD *)&v35 = v30;
      *(_DWORD *)v16 = 136315138;
      v29 = v16 + 4;
      v17 = swift_bridgeObjectRetain();
      v18 = MEMORY[0x23B85AE44](v17, MEMORY[0x24BEE0D00]);
      v20 = v19;
      swift_bridgeObjectRelease();
      v32 = sub_23A8BF840(v18, v20, (uint64_t *)&v35);
      sub_23A8F12A4();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_23A8AD000, v13, v14, "Received DidUpdateGuidance for %s", v16, 0xCu);
      v21 = v30;
      swift_arrayDestroy();
      MEMORY[0x23B85B51C](v21, -1, -1);
      v22 = v16;
      a2 = v31;
      MEMORY[0x23B85B51C](v22, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    swift_beginAccess();
    result = MEMORY[0x23B85B5B8](a2 + 48);
    if (result)
    {
      v23 = *(_QWORD *)(a2 + 56);
      ObjectType = swift_getObjectType();
      v25 = *(id *)(a2 + 16);
      v26 = sub_23A8F0F50();
      v28 = v27;

      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v23 + 8))(v26, v28, ObjectType, v23);
      swift_bridgeObjectRelease();
      return swift_unknownObjectRelease();
    }
  }
  return result;
}

uint64_t static EnergySite.createSite(name:)(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;

  v2[2] = a1;
  v2[3] = a2;
  v3 = sub_23A8F0CE0();
  v2[4] = v3;
  v2[5] = *(_QWORD *)(v3 - 8);
  v2[6] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23A8B6D18()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;

  v2 = v0[5];
  v1 = v0[6];
  v3 = v0[4];
  sub_23A8F0CD4();
  v4 = sub_23A8F0CBC();
  v6 = v5;
  v0[7] = v5;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  v7 = (_QWORD *)swift_task_alloc();
  v0[8] = (uint64_t)v7;
  *v7 = v0;
  v7[1] = sub_23A8B6DAC;
  return sub_23A8C3F8C(v0[2], v0[3], v4, v6);
}

uint64_t sub_23A8B6DAC(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v4;

  v4 = *v1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v4 + 8))(a1);
}

uint64_t static EnergySite.createSite(name:clientProvidedID:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;

  v4[4] = a3;
  v4[5] = a4;
  v4[2] = a1;
  v4[3] = a2;
  v5 = sub_23A8F0CE0();
  v4[6] = v5;
  v4[7] = *(_QWORD *)(v5 - 8);
  v4[8] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23A8B6E7C()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t (*v11)(uint64_t, uint64_t);

  v1 = *(_QWORD *)(v0 + 40);
  v2 = HIBYTE(v1) & 0xF;
  if ((v1 & 0x2000000000000000) == 0)
    v2 = *(_QWORD *)(v0 + 32) & 0xFFFFFFFFFFFFLL;
  v3 = *(_QWORD *)(v0 + 64);
  if (v2)
  {
    v4 = *(_QWORD *)(v0 + 48);
    v5 = *(_QWORD *)(v0 + 56);
    sub_23A8F1154();
    sub_23A8F0FA4();
    sub_23A8F0EE4();
    sub_23A8F0CB0();
    v6 = sub_23A8F0CBC();
    v8 = v7;
    *(_QWORD *)(v0 + 72) = v6;
    *(_QWORD *)(v0 + 80) = v7;
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v3, v4);
    v11 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_2569C83F0 + dword_2569C83F0);
    swift_bridgeObjectRetain();
    v9 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 88) = v9;
    *v9 = v0;
    v9[1] = sub_23A8B6FA0;
    return v11(v6, v8);
  }
  else
  {
    swift_task_dealloc();
    return (*(uint64_t (**)(_QWORD))(v0 + 8))(0);
  }
}

uint64_t sub_23A8B6FA0(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 96) = a1;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23A8B6FFC()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v3;

  v1 = *(_QWORD *)(v0 + 96);
  if (v1)
  {
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    return (*(uint64_t (**)(uint64_t))(v0 + 8))(v1);
  }
  else
  {
    v3 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 104) = v3;
    *v3 = v0;
    v3[1] = sub_23A8B707C;
    return sub_23A8C3F8C(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 72), *(_QWORD *)(v0 + 80));
  }
}

uint64_t sub_23A8B707C(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v4;

  v4 = *v1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v4 + 8))(a1);
}

uint64_t sub_23A8B70D8()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;

  v1[5] = v0;
  v2 = sub_23A8F10A0();
  v1[6] = v2;
  v1[7] = *(_QWORD *)(v2 - 8);
  v1[8] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23A8B7138()
{
  uint64_t v0;
  id v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _BYTE *v18;

  v1 = *(id *)(*(_QWORD *)(v0 + 40) + 16);
  v2 = sub_23A8F0F50();
  v4 = v3;

  swift_bridgeObjectRelease();
  v5 = HIBYTE(v4) & 0xF;
  if ((v4 & 0x2000000000000000) == 0)
    v5 = v2 & 0xFFFFFFFFFFFFLL;
  if (v5)
  {
    v6 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 72) = v6;
    *v6 = v0;
    v6[1] = sub_23A8B734C;
    return sub_23A8F1400();
  }
  else
  {
    if (qword_2542D8828 != -1)
      swift_once();
    v9 = *(_QWORD *)(v0 + 56);
    v8 = *(_QWORD *)(v0 + 64);
    v10 = *(_QWORD *)(v0 + 48);
    v11 = __swift_project_value_buffer(v10, (uint64_t)qword_2542D8DE0);
    swift_beginAccess();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 16))(v8, v11, v10);
    v12 = sub_23A8F1088();
    v13 = sub_23A8F1274();
    if (os_log_type_enabled(v12, v13))
    {
      v14 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_23A8AD000, v12, v13, "Failed to register site. Site ID is empty.", v14, 2u);
      MEMORY[0x23B85B51C](v14, -1, -1);
    }
    v16 = *(_QWORD *)(v0 + 56);
    v15 = *(_QWORD *)(v0 + 64);
    v17 = *(_QWORD *)(v0 + 48);

    (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v15, v17);
    sub_23A8C3D5C();
    swift_allocError();
    *v18 = 28;
    swift_willThrow();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_23A8B734C()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 80) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23A8B73B0()
{
  uint64_t v0;

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23A8B73E4()
{
  uint64_t v0;

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23A8B7418(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;

  v5[16] = a4;
  v5[17] = a5;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542D8D18);
  v5[18] = v6;
  v7 = *(_QWORD *)(v6 - 8);
  v5[19] = v7;
  v5[20] = *(_QWORD *)(v7 + 64);
  v5[21] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23A8B7480()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v1 = v0[21];
  v2 = v0[18];
  v3 = v0[19];
  v4 = v0[16];
  v5 = v0[17];
  type metadata accessor for HomeEnergyXPCConnection();
  swift_allocObject();
  v0[22] = sub_23A8EF888();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v1, v4, v2);
  v6 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v7 = swift_allocObject();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v3 + 32))(v7 + v6, v1, v2);
  v8 = (void *)sub_23A8EFE34((uint64_t)sub_23A8C65A4, v7);
  v0[23] = v8;
  swift_release();
  v9 = *(void **)(v5 + 16);
  v0[24] = v9;
  v0[2] = v0;
  v0[3] = sub_23A8B75D8;
  v10 = swift_continuation_init();
  v0[10] = MEMORY[0x24BDAC760];
  v0[11] = 0x40000000;
  v0[12] = sub_23A8B7638;
  v0[13] = &block_descriptor;
  v0[14] = v10;
  objc_msgSend(v8, sel_registerEnergySiteWithSite_completionHandler_, v9, v0 + 10);
  return swift_continuation_await();
}

uint64_t sub_23A8B75D8()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)v0 + 200) = *(_QWORD *)(*(_QWORD *)v0 + 48);
  return swift_task_switch();
}

uint64_t sub_23A8B7638(uint64_t a1, void *a2)
{
  _QWORD *v3;
  id v4;

  if (!a2)
    return swift_continuation_throwingResume();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2542D8AE0);
  swift_allocError();
  *v3 = a2;
  v4 = a2;
  return swift_continuation_throwingResumeWithError();
}

uint64_t sub_23A8B76AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v16;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542D8D10);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(_QWORD *)(v7 + 64);
  MEMORY[0x24BDAC7A8]();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2542D8AC0);
  MEMORY[0x24BDAC7A8]();
  v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_23A8F1208();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v10, 1, 1, v11);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v6);
  v12 = (*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = 0;
  *(_QWORD *)(v13 + 24) = 0;
  (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v13 + v12, (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v6);
  v14 = (_QWORD *)(v13 + ((v8 + v12 + 7) & 0xFFFFFFFFFFFFFFF8));
  *v14 = a2;
  v14[1] = a3;
  swift_bridgeObjectRetain();
  sub_23A8B1124((uint64_t)v10, (uint64_t)&unk_2569C8810, v13);
  return swift_release();
}

uint64_t sub_23A8B7810(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;

  v6[19] = a5;
  v6[20] = a6;
  v6[18] = a4;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542D8D10);
  v6[21] = v7;
  v8 = *(_QWORD *)(v7 - 8);
  v6[22] = v8;
  v6[23] = *(_QWORD *)(v8 + 64);
  v6[24] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23A8B787C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;

  v1 = v0[24];
  v2 = v0[21];
  v3 = v0[22];
  v4 = v0[18];
  type metadata accessor for HomeEnergyXPCConnection();
  swift_allocObject();
  v0[25] = sub_23A8EF888();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v1, v4, v2);
  v5 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v6 = swift_allocObject();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v3 + 32))(v6 + v5, v1, v2);
  v7 = (void *)sub_23A8EFE34((uint64_t)sub_23A8C6BD4, v6);
  v0[26] = v7;
  swift_release();
  v8 = sub_23A8F1130();
  v0[27] = v8;
  v0[7] = v0 + 15;
  v0[2] = v0;
  v0[3] = sub_23A8B79F0;
  v9 = swift_continuation_init();
  v0[10] = MEMORY[0x24BDAC760];
  v0[11] = 0x40000000;
  v0[12] = sub_23A8B7A50;
  v0[13] = &block_descriptor_111;
  v0[14] = v9;
  objc_msgSend(v7, sel_siteWithSiteID_completionHandler_, v8, v0 + 10);
  return swift_continuation_await();
}

uint64_t sub_23A8B79F0()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)v0 + 224) = *(_QWORD *)(*(_QWORD *)v0 + 48);
  return swift_task_switch();
}

uint64_t sub_23A8B7A50(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3;
  _QWORD *v5;
  id v6;
  uint64_t v8;
  id v9;
  void *v10;

  v3 = *(_QWORD *)(a1 + 32);
  if (a3)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2542D8AE0);
    swift_allocError();
    *v5 = a3;
    v6 = a3;
    return swift_continuation_throwingResumeWithError();
  }
  else
  {
    v10 = a2;
    v8 = *(_QWORD *)(*(_QWORD *)(v3 + 64) + 40);
    v9 = a2;
    sub_23A8C7E20((uint64_t)&v10, v8, &qword_2542D8D08);
    return swift_continuation_throwingResume();
  }
}

uint64_t sub_23A8B7AF8()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = v0;
  return swift_task_switch();
}

uint64_t sub_23A8B7B10()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 24) = v1;
  *v1 = v0;
  v1[1] = sub_23A8B7B8C;
  return sub_23A8F1400();
}

uint64_t sub_23A8B7B8C()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 32) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23A8B7BF0()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23A8B7BFC()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23A8B7C08(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;

  v5[16] = a4;
  v5[17] = a5;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542D8D18);
  v5[18] = v6;
  v7 = *(_QWORD *)(v6 - 8);
  v5[19] = v7;
  v5[20] = *(_QWORD *)(v7 + 64);
  v5[21] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23A8B7C70()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v1 = v0[21];
  v2 = v0[18];
  v3 = v0[19];
  v4 = v0[16];
  v5 = v0[17];
  type metadata accessor for HomeEnergyXPCConnection();
  swift_allocObject();
  v0[22] = sub_23A8EF888();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v1, v4, v2);
  v6 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v7 = swift_allocObject();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v3 + 32))(v7 + v6, v1, v2);
  v8 = (void *)sub_23A8EFE34((uint64_t)sub_23A8C715C, v7);
  v0[23] = v8;
  swift_release();
  v9 = *(void **)(v5 + 16);
  v0[24] = v9;
  v0[2] = v0;
  v0[3] = sub_23A8B7DC8;
  v10 = swift_continuation_init();
  v0[10] = MEMORY[0x24BDAC760];
  v0[11] = 0x40000000;
  v0[12] = sub_23A8B7638;
  v0[13] = &block_descriptor_137;
  v0[14] = v10;
  objc_msgSend(v8, sel_deleteEnergySiteWithSite_completionHandler_, v9, v0 + 10);
  return swift_continuation_await();
}

uint64_t sub_23A8B7DC8()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)v0 + 200) = *(_QWORD *)(*(_QWORD *)v0 + 48);
  return swift_task_switch();
}

uint64_t sub_23A8B7E28()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;

  v1 = *(void **)(v0 + 192);
  v2 = *(_QWORD *)(v0 + 176);
  swift_unknownObjectRelease();

  objc_msgSend(*(id *)(v2 + 16), sel_invalidate);
  sub_23A8F11F0();
  swift_release();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23A8B7E98()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;

  v2 = *(void **)(v0 + 192);
  v1 = *(_QWORD *)(v0 + 200);
  swift_willThrow();
  swift_release();
  swift_unknownObjectRelease();

  *(_QWORD *)(v0 + 120) = v1;
  sub_23A8F11E4();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23A8B7F1C(void *a1, uint64_t a2, const char *a3, uint64_t *a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  id v13;
  id v14;
  NSObject *v15;
  os_log_type_t v16;
  uint64_t v17;
  uint8_t *v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  unint64_t v22;
  id v23;
  _QWORD v25[2];
  const char *v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  v8 = sub_23A8F10A0();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2542D8828 != -1)
    swift_once();
  v12 = __swift_project_value_buffer(v8, (uint64_t)qword_2542D8DE0);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, v12, v8);
  v13 = a1;
  v14 = a1;
  v15 = sub_23A8F1088();
  v16 = sub_23A8F1274();
  if (os_log_type_enabled(v15, v16))
  {
    v27 = a4;
    v17 = swift_slowAlloc();
    v28 = a2;
    v18 = (uint8_t *)v17;
    v19 = swift_slowAlloc();
    v29 = (uint64_t)a1;
    v30 = v19;
    v26 = a3;
    *(_DWORD *)v18 = 136315138;
    v25[1] = v18 + 4;
    v20 = a1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2542D8AE0);
    v21 = sub_23A8F1148();
    v29 = sub_23A8BF840(v21, v22, &v30);
    sub_23A8F12A4();
    a4 = v27;
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_23A8AD000, v15, v16, v26, v18, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B85B51C](v19, -1, -1);
    MEMORY[0x23B85B51C](v18, -1, -1);
  }
  else
  {

  }
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  v30 = (uint64_t)a1;
  v23 = a1;
  __swift_instantiateConcreteTypeFromMangledName(a4);
  return sub_23A8F11E4();
}

uint64_t EnergySite.EnergyUsageTimeInterval.coreAnalyticsEnumKey.getter()
{
  unsigned __int8 *v0;

  return *v0;
}

EnergyKit::EnergySite::EnergyUsageTimeInterval_optional __swiftcall EnergySite.EnergyUsageTimeInterval.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  unint64_t v3;
  EnergyKit::EnergySite::EnergyUsageTimeInterval_optional result;
  char v5;

  v2 = v1;
  v3 = sub_23A8F13D0();
  result.value = swift_bridgeObjectRelease();
  v5 = 5;
  if (v3 < 5)
    v5 = v3;
  *v2 = v5;
  return result;
}

uint64_t EnergySite.EnergyUsageTimeInterval.rawValue.getter()
{
  char *v0;

  return qword_23A8F1D40[*v0];
}

EnergyKit::EnergySite::EnergyUsageTimeInterval_optional sub_23A8B8210(Swift::String *a1)
{
  return EnergySite.EnergyUsageTimeInterval.init(rawValue:)(*a1);
}

uint64_t sub_23A8B821C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = EnergySite.EnergyUsageTimeInterval.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_23A8B8240()
{
  return sub_23A8B8248();
}

uint64_t sub_23A8B8248()
{
  sub_23A8F1478();
  sub_23A8F1160();
  swift_bridgeObjectRelease();
  return sub_23A8F1490();
}

uint64_t sub_23A8B82B0()
{
  return sub_23A8B82B8();
}

uint64_t sub_23A8B82B8()
{
  sub_23A8F1160();
  return swift_bridgeObjectRelease();
}

uint64_t sub_23A8B82F8()
{
  return sub_23A8B8300();
}

uint64_t sub_23A8B8300()
{
  sub_23A8F1478();
  sub_23A8F1160();
  swift_bridgeObjectRelease();
  return sub_23A8F1490();
}

uint64_t sub_23A8B8364(char *a1, char *a2)
{
  return sub_23A8E71D4(*a1, *a2);
}

BOOL static EnergySite.HistoricalEnergyUsageError.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t EnergySite.HistoricalEnergyUsageError.hash(into:)()
{
  return sub_23A8F1484();
}

uint64_t EnergySite.HistoricalEnergyUsageError.hashValue.getter()
{
  sub_23A8F1478();
  sub_23A8F1484();
  return sub_23A8F1490();
}

BOOL sub_23A8B83F0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_23A8B8404()
{
  sub_23A8F1478();
  sub_23A8F1484();
  return sub_23A8F1490();
}

uint64_t sub_23A8B8448()
{
  return sub_23A8F1484();
}

uint64_t sub_23A8B8470()
{
  sub_23A8F1478();
  sub_23A8F1484();
  return sub_23A8F1490();
}

double EnergySite.EnergyUsage.net.getter()
{
  uint64_t v0;

  return *(double *)(v0 + *(int *)(type metadata accessor for EnergySite.EnergyUsage(0) + 20));
}

double EnergySite.EnergyUsage.imports.getter()
{
  uint64_t v0;

  return *(double *)(v0 + *(int *)(type metadata accessor for EnergySite.EnergyUsage(0) + 24));
}

double EnergySite.EnergyUsage.exports.getter()
{
  uint64_t v0;

  return *(double *)(v0 + *(int *)(type metadata accessor for EnergySite.EnergyUsage(0) + 28));
}

uint64_t EnergySite.EnergyUsage.netByPricingPeriod.getter()
{
  type metadata accessor for EnergySite.EnergyUsage(0);
  return swift_bridgeObjectRetain();
}

uint64_t EnergySite.EnergyUsage.importsByPricingPeriod.getter()
{
  type metadata accessor for EnergySite.EnergyUsage(0);
  return swift_bridgeObjectRetain();
}

uint64_t EnergySite.EnergyUsage.exportsByPricingPeriod.getter()
{
  type metadata accessor for EnergySite.EnergyUsage(0);
  return swift_bridgeObjectRetain();
}

uint64_t EnergySite.EnergyUsage.netByTOU.getter()
{
  type metadata accessor for EnergySite.EnergyUsage(0);
  return swift_bridgeObjectRetain();
}

uint64_t EnergySite.EnergyUsage.subintervalCount.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + *(int *)(type metadata accessor for EnergySite.EnergyUsage(0) + 48));
}

uint64_t EnergySite.EnergyUsage.isValid.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for EnergySite.EnergyUsage(0) + 52));
}

unint64_t sub_23A8B85E4(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t result;
  char v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  _OWORD v15[2];
  uint64_t v16;
  __int128 v17;

  if (!*(_QWORD *)(a1 + 16))
  {
    v3 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2542D8D30);
  v2 = sub_23A8F13B8();
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
    sub_23A8C6700(v6, (uint64_t)v15, &qword_2542D8D28);
    result = sub_23A8BFF40((uint64_t)v15);
    if ((v8 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v9 = v3[6] + 40 * result;
    v10 = v15[0];
    v11 = v15[1];
    *(_QWORD *)(v9 + 32) = v16;
    *(_OWORD *)v9 = v10;
    *(_OWORD *)(v9 + 16) = v11;
    result = (unint64_t)sub_23A8C62C8(&v17, (_OWORD *)(v3[7] + 32 * result));
    v12 = v3[2];
    v13 = __OFADD__(v12, 1);
    v14 = v12 + 1;
    if (v13)
      goto LABEL_11;
    v3[2] = v14;
    v6 += 72;
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

unint64_t sub_23A8B8724(uint64_t a1)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569C87C8);
  v2 = sub_23A8F13B8();
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
    sub_23A8C6700(v6, (uint64_t)&v15, &qword_2569C87D0);
    v7 = v15;
    v8 = v16;
    result = sub_23A8BFFA8(v15, v16);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v11 = (uint64_t *)(v3[6] + 16 * result);
    *v11 = v7;
    v11[1] = v8;
    result = (unint64_t)sub_23A8C62C8(&v17, (_OWORD *)(v3[7] + 32 * result));
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

uint64_t EnergySite.EnergyUsage.init(startTime:imports:exports:importsByPricingPeriod:exportsByPricingPeriod:subintervalCount:isValid:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, char a5@<W4>, uint64_t a6@<X8>, double a7@<D0>, double a8@<D1>)
{
  uint64_t v16;
  int *v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  int64_t v28;
  unint64_t v29;
  int64_t v30;
  uint64_t v31;
  double v32;
  double v33;
  unint64_t v34;
  char v35;
  unint64_t v36;
  char v37;
  char isUniquelyReferenced_nonNull_native;
  char v39;
  unint64_t v40;
  uint64_t v41;
  _BOOL8 v42;
  uint64_t v43;
  char v44;
  unint64_t v45;
  char v46;
  double v47;
  uint64_t v48;
  uint64_t v49;
  BOOL v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  int64_t v54;
  unint64_t v55;
  uint64_t v56;
  uint64_t v57;
  unint64_t v58;
  int64_t v59;
  unint64_t v60;
  unint64_t v61;
  int64_t v62;
  unint64_t v63;
  int64_t v64;
  uint64_t v65;
  unint64_t v66;
  uint64_t result;
  uint64_t v68;
  char v69;
  uint64_t v70;
  uint64_t v71;
  int *v72;
  uint64_t v73;
  uint64_t v74;
  int64_t v75;
  uint64_t v76;

  v16 = sub_23A8F0CA4();
  v70 = *(_QWORD *)(v16 - 8);
  v71 = v16;
  (*(void (**)(uint64_t, uint64_t))(v70 + 16))(a6, a1);
  v17 = (int *)type metadata accessor for EnergySite.EnergyUsage(0);
  *(double *)(a6 + v17[5]) = a7 - a8;
  *(double *)(a6 + v17[6]) = a7;
  *(double *)(a6 + v17[7]) = a8;
  *(_QWORD *)(a6 + v17[10]) = a3;
  v72 = v17;
  v73 = a6;
  *(_QWORD *)(a6 + v17[9]) = a2;
  if (!*(_QWORD *)(a3 + 16))
  {
    swift_bridgeObjectRetain();
    v18 = a2;
    goto LABEL_40;
  }
  v68 = a4;
  v69 = a5;
  v18 = sub_23A8C4398(MEMORY[0x24BEE4AF8], (uint64_t (*)(uint64_t))sub_23A8BFF70);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain();
  v19 = sub_23A8B8DB0(a2);
  v20 = swift_bridgeObjectRetain();
  v21 = sub_23A8B91EC(v20, v19);
  v22 = 0;
  v74 = v21 + 56;
  v23 = 1 << *(_BYTE *)(v21 + 32);
  v24 = -1;
  if (v23 < 64)
    v24 = ~(-1 << v23);
  v25 = v24 & *(_QWORD *)(v21 + 56);
  v75 = (unint64_t)(v23 + 63) >> 6;
  v76 = v21;
  while (v25)
  {
    v26 = __clz(__rbit64(v25));
    v25 &= v25 - 1;
    v27 = v26 | (v22 << 6);
LABEL_23:
    v31 = *(_QWORD *)(*(_QWORD *)(v76 + 48) + 8 * v27);
    v32 = 0.0;
    v33 = 0.0;
    if (*(_QWORD *)(a2 + 16))
    {
      v34 = sub_23A8BFF70(v31);
      if ((v35 & 1) != 0)
        v33 = *(double *)(*(_QWORD *)(a2 + 56) + 8 * v34);
    }
    if (*(_QWORD *)(a3 + 16))
    {
      v36 = sub_23A8BFF70(v31);
      if ((v37 & 1) != 0)
        v32 = *(double *)(*(_QWORD *)(a3 + 56) + 8 * v36);
    }
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v40 = sub_23A8BFF70(v31);
    v41 = *(_QWORD *)(v18 + 16);
    v42 = (v39 & 1) == 0;
    v43 = v41 + v42;
    if (__OFADD__(v41, v42))
    {
      __break(1u);
LABEL_64:
      __break(1u);
LABEL_65:
      __break(1u);
LABEL_66:
      __break(1u);
LABEL_67:
      __break(1u);
      goto LABEL_68;
    }
    v44 = v39;
    if (*(_QWORD *)(v18 + 24) >= v43)
    {
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        sub_23A8C1294();
    }
    else
    {
      sub_23A8C08F8(v43, isUniquelyReferenced_nonNull_native);
      v45 = sub_23A8BFF70(v31);
      if ((v44 & 1) != (v46 & 1))
        goto LABEL_70;
      v40 = v45;
    }
    v47 = v33 - v32;
    if ((v44 & 1) != 0)
    {
      *(double *)(*(_QWORD *)(v18 + 56) + 8 * v40) = v47;
    }
    else
    {
      *(_QWORD *)(v18 + 8 * (v40 >> 6) + 64) |= 1 << v40;
      v48 = 8 * v40;
      *(_QWORD *)(*(_QWORD *)(v18 + 48) + v48) = v31;
      *(double *)(*(_QWORD *)(v18 + 56) + v48) = v47;
      v49 = *(_QWORD *)(v18 + 16);
      v50 = __OFADD__(v49, 1);
      v51 = v49 + 1;
      if (v50)
        goto LABEL_66;
      *(_QWORD *)(v18 + 16) = v51;
    }
    swift_bridgeObjectRelease();
  }
  v28 = v22 + 1;
  if (__OFADD__(v22, 1))
    goto LABEL_67;
  if (v28 >= v75)
    goto LABEL_38;
  v29 = *(_QWORD *)(v74 + 8 * v28);
  ++v22;
  if (v29)
    goto LABEL_22;
  v22 = v28 + 1;
  if (v28 + 1 >= v75)
    goto LABEL_38;
  v29 = *(_QWORD *)(v74 + 8 * v22);
  if (v29)
    goto LABEL_22;
  v22 = v28 + 2;
  if (v28 + 2 >= v75)
    goto LABEL_38;
  v29 = *(_QWORD *)(v74 + 8 * v22);
  if (v29)
  {
LABEL_22:
    v25 = (v29 - 1) & v29;
    v27 = __clz(__rbit64(v29)) + (v22 << 6);
    goto LABEL_23;
  }
  v30 = v28 + 3;
  if (v30 >= v75)
    goto LABEL_38;
  v29 = *(_QWORD *)(v74 + 8 * v30);
  if (v29)
  {
    v22 = v30;
    goto LABEL_22;
  }
  while (1)
  {
    v22 = v30 + 1;
    if (__OFADD__(v30, 1))
      goto LABEL_69;
    if (v22 >= v75)
      break;
    v29 = *(_QWORD *)(v74 + 8 * v22);
    ++v30;
    if (v29)
      goto LABEL_22;
  }
LABEL_38:
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  a5 = v69;
  a4 = v68;
LABEL_40:
  *(_QWORD *)(v73 + v72[8]) = v18;
  swift_bridgeObjectRetain();
  v52 = sub_23A8F11C0();
  v53 = v52;
  v54 = 0;
  *(_QWORD *)(v52 + 16) = 5;
  *(_OWORD *)(v52 + 32) = 0u;
  *(_OWORD *)(v52 + 48) = 0u;
  *(_QWORD *)(v52 + 64) = 0;
  v55 = v18 + 64;
  v56 = 1 << *(_BYTE *)(v18 + 32);
  v57 = -1;
  if (v56 < 64)
    v57 = ~(-1 << v56);
  v58 = v57 & *(_QWORD *)(v18 + 64);
  v59 = (unint64_t)(v56 + 63) >> 6;
  while (2)
  {
    if (v58)
    {
      v60 = __clz(__rbit64(v58));
      v58 &= v58 - 1;
      v61 = v60 | (v54 << 6);
      goto LABEL_59;
    }
    v62 = v54 + 1;
    if (__OFADD__(v54, 1))
      goto LABEL_65;
    if (v62 >= v59)
    {
LABEL_62:
      (*(void (**)(uint64_t, uint64_t))(v70 + 8))(a1, v71);
      result = swift_release();
      *(_QWORD *)(v73 + v72[11]) = v53;
      *(_QWORD *)(v73 + v72[12]) = a4;
      *(_BYTE *)(v73 + v72[13]) = a5 & 1;
      return result;
    }
    v63 = *(_QWORD *)(v55 + 8 * v62);
    ++v54;
    if (v63)
      goto LABEL_58;
    v54 = v62 + 1;
    if (v62 + 1 >= v59)
      goto LABEL_62;
    v63 = *(_QWORD *)(v55 + 8 * v54);
    if (v63)
      goto LABEL_58;
    v54 = v62 + 2;
    if (v62 + 2 >= v59)
      goto LABEL_62;
    v63 = *(_QWORD *)(v55 + 8 * v54);
    if (v63)
    {
LABEL_58:
      v58 = (v63 - 1) & v63;
      v61 = __clz(__rbit64(v63)) + (v54 << 6);
LABEL_59:
      v65 = 8 * v61;
      v66 = *(_QWORD *)(*(_QWORD *)(v18 + 48) + v65);
      if (v66 < 5)
      {
        if (v66 >= *(_QWORD *)(v52 + 16))
          goto LABEL_64;
        *(_QWORD *)(v52 + 32 + 8 * v66) = *(_QWORD *)(*(_QWORD *)(v18 + 56) + v65);
      }
      continue;
    }
    break;
  }
  v64 = v62 + 3;
  if (v64 >= v59)
    goto LABEL_62;
  v63 = *(_QWORD *)(v55 + 8 * v64);
  if (v63)
  {
    v54 = v64;
    goto LABEL_58;
  }
  while (1)
  {
    v54 = v64 + 1;
    if (__OFADD__(v64, 1))
      break;
    if (v54 >= v59)
      goto LABEL_62;
    v63 = *(_QWORD *)(v55 + 8 * v54);
    ++v64;
    if (v63)
      goto LABEL_58;
  }
LABEL_68:
  __break(1u);
LABEL_69:
  __break(1u);
LABEL_70:
  result = sub_23A8F1424();
  __break(1u);
  return result;
}

uint64_t sub_23A8B8DB0(uint64_t a1)
{
  uint64_t result;
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  int64_t v8;
  unint64_t v9;
  unint64_t v10;
  int64_t v11;
  unint64_t v12;
  int64_t v13;
  uint64_t v14;
  uint64_t v15;

  result = sub_23A8F1244();
  v3 = 0;
  v15 = result;
  v4 = a1 + 64;
  v5 = 1 << *(_BYTE *)(a1 + 32);
  v6 = -1;
  if (v5 < 64)
    v6 = ~(-1 << v5);
  v7 = v6 & *(_QWORD *)(a1 + 64);
  v8 = (unint64_t)(v5 + 63) >> 6;
  while (1)
  {
    if (v7)
    {
      v9 = __clz(__rbit64(v7));
      v7 &= v7 - 1;
      v10 = v9 | (v3 << 6);
      goto LABEL_5;
    }
    v11 = v3 + 1;
    if (__OFADD__(v3, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v11 >= v8)
      goto LABEL_23;
    v12 = *(_QWORD *)(v4 + 8 * v11);
    ++v3;
    if (!v12)
    {
      v3 = v11 + 1;
      if (v11 + 1 >= v8)
        goto LABEL_23;
      v12 = *(_QWORD *)(v4 + 8 * v3);
      if (!v12)
      {
        v3 = v11 + 2;
        if (v11 + 2 >= v8)
          goto LABEL_23;
        v12 = *(_QWORD *)(v4 + 8 * v3);
        if (!v12)
        {
          v3 = v11 + 3;
          if (v11 + 3 >= v8)
            goto LABEL_23;
          v12 = *(_QWORD *)(v4 + 8 * v3);
          if (!v12)
            break;
        }
      }
    }
LABEL_22:
    v7 = (v12 - 1) & v12;
    v10 = __clz(__rbit64(v12)) + (v3 << 6);
LABEL_5:
    result = sub_23A8C03F8(&v14, *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8 * v10));
  }
  v13 = v11 + 4;
  if (v13 >= v8)
  {
LABEL_23:
    swift_release();
    return v15;
  }
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
      break;
    if (v3 >= v8)
      goto LABEL_23;
    v12 = *(_QWORD *)(v4 + 8 * v3);
    ++v13;
    if (v12)
      goto LABEL_22;
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t sub_23A8B8F20(uint64_t a1)
{
  uint64_t v2;
  uint64_t (*v3)(uint64_t);
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t result;
  int64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t i;
  int64_t v21;
  unint64_t v22;
  int64_t v23;
  int64_t v24;
  uint64_t v25;

  v2 = sub_23A8F0CA4();
  v3 = (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900];
  v4 = *(_QWORD *)(v2 - 8);
  v5 = MEMORY[0x24BDAC7A8](v2);
  v7 = (char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v24 - v8;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542D8CF8);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23A8C6A38(&qword_2569C87A8, v3, MEMORY[0x24BDCE930]);
  result = sub_23A8F1244();
  v14 = 0;
  v15 = a1 + 64;
  v16 = 1 << *(_BYTE *)(a1 + 32);
  v17 = -1;
  if (v16 < 64)
    v17 = ~(-1 << v16);
  v18 = v17 & *(_QWORD *)(a1 + 64);
  v24 = (unint64_t)(v16 + 63) >> 6;
  v25 = result;
  if (!v18)
    goto LABEL_5;
LABEL_4:
  v19 = __clz(__rbit64(v18));
  v18 &= v18 - 1;
  for (i = v19 | (v14 << 6); ; i = __clz(__rbit64(v22)) + (v14 << 6))
  {
    (*(void (**)(char *, unint64_t, uint64_t))(v4 + 16))(v12, *(_QWORD *)(a1 + 48) + *(_QWORD *)(v4 + 72) * i, v2);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v4 + 56))(v12, 0, 1, v2);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v4 + 48))(v12, 1, v2) == 1)
      goto LABEL_25;
    (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v7, v12, v2);
    sub_23A8C04F0((uint64_t)v9, v7);
    result = (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v9, v2);
    if (v18)
      goto LABEL_4;
LABEL_5:
    v21 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v21 >= v24)
      goto LABEL_24;
    v22 = *(_QWORD *)(v15 + 8 * v21);
    ++v14;
    if (!v22)
    {
      v14 = v21 + 1;
      if (v21 + 1 >= v24)
        goto LABEL_24;
      v22 = *(_QWORD *)(v15 + 8 * v14);
      if (!v22)
      {
        v14 = v21 + 2;
        if (v21 + 2 >= v24)
          goto LABEL_24;
        v22 = *(_QWORD *)(v15 + 8 * v14);
        if (!v22)
        {
          v14 = v21 + 3;
          if (v21 + 3 >= v24)
            goto LABEL_24;
          v22 = *(_QWORD *)(v15 + 8 * v14);
          if (!v22)
            break;
        }
      }
    }
LABEL_20:
    v18 = (v22 - 1) & v22;
  }
  v23 = v21 + 4;
  if (v23 >= v24)
  {
LABEL_24:
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v4 + 56))(v12, 1, 1, v2);
LABEL_25:
    swift_release();
    return v25;
  }
  v22 = *(_QWORD *)(v15 + 8 * v23);
  if (v22)
  {
    v14 = v23;
    goto LABEL_20;
  }
  while (1)
  {
    v14 = v23 + 1;
    if (__OFADD__(v23, 1))
      break;
    if (v14 >= v24)
      goto LABEL_24;
    v22 = *(_QWORD *)(v15 + 8 * v14);
    ++v23;
    if (v22)
      goto LABEL_20;
  }
LABEL_27:
  __break(1u);
  return result;
}

uint64_t sub_23A8B91EC(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  int64_t v8;
  unint64_t v9;
  unint64_t v10;
  int64_t v11;
  unint64_t v12;
  int64_t v13;
  uint64_t v14;
  uint64_t v15;

  v2 = result;
  v3 = 0;
  v15 = a2;
  v4 = result + 64;
  v5 = 1 << *(_BYTE *)(result + 32);
  v6 = -1;
  if (v5 < 64)
    v6 = ~(-1 << v5);
  v7 = v6 & *(_QWORD *)(result + 64);
  v8 = (unint64_t)(v5 + 63) >> 6;
  while (1)
  {
    if (v7)
    {
      v9 = __clz(__rbit64(v7));
      v7 &= v7 - 1;
      v10 = v9 | (v3 << 6);
      goto LABEL_5;
    }
    v11 = v3 + 1;
    if (__OFADD__(v3, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v11 >= v8)
      goto LABEL_23;
    v12 = *(_QWORD *)(v4 + 8 * v11);
    ++v3;
    if (!v12)
    {
      v3 = v11 + 1;
      if (v11 + 1 >= v8)
        goto LABEL_23;
      v12 = *(_QWORD *)(v4 + 8 * v3);
      if (!v12)
      {
        v3 = v11 + 2;
        if (v11 + 2 >= v8)
          goto LABEL_23;
        v12 = *(_QWORD *)(v4 + 8 * v3);
        if (!v12)
        {
          v3 = v11 + 3;
          if (v11 + 3 >= v8)
            goto LABEL_23;
          v12 = *(_QWORD *)(v4 + 8 * v3);
          if (!v12)
            break;
        }
      }
    }
LABEL_22:
    v7 = (v12 - 1) & v12;
    v10 = __clz(__rbit64(v12)) + (v3 << 6);
LABEL_5:
    result = sub_23A8C03F8(&v14, *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v10));
  }
  v13 = v11 + 4;
  if (v13 >= v8)
  {
LABEL_23:
    swift_release();
    return v15;
  }
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
      break;
    if (v3 >= v8)
      goto LABEL_23;
    v12 = *(_QWORD *)(v4 + 8 * v3);
    ++v13;
    if (v12)
      goto LABEL_22;
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t sub_23A8B9344(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t result;
  uint64_t v13;
  char *v14;
  int64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t i;
  int64_t v22;
  unint64_t v23;
  int64_t v24;
  int64_t v25;
  uint64_t v26;

  v4 = sub_23A8F0CA4();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v25 - v9;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542D8CF8);
  result = MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v25 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = 0;
  v16 = a1 + 64;
  v17 = 1 << *(_BYTE *)(a1 + 32);
  v18 = -1;
  if (v17 < 64)
    v18 = ~(-1 << v17);
  v19 = v18 & *(_QWORD *)(a1 + 64);
  v25 = (unint64_t)(v17 + 63) >> 6;
  v26 = a2;
  if (!v19)
    goto LABEL_5;
LABEL_4:
  v20 = __clz(__rbit64(v19));
  v19 &= v19 - 1;
  for (i = v20 | (v15 << 6); ; i = __clz(__rbit64(v23)) + (v15 << 6))
  {
    (*(void (**)(char *, unint64_t, uint64_t))(v5 + 16))(v14, *(_QWORD *)(a1 + 48) + *(_QWORD *)(v5 + 72) * i, v4);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v5 + 56))(v14, 0, 1, v4);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v14, 1, v4) == 1)
      goto LABEL_25;
    (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v8, v14, v4);
    sub_23A8C04F0((uint64_t)v10, v8);
    result = (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v10, v4);
    if (v19)
      goto LABEL_4;
LABEL_5:
    v22 = v15 + 1;
    if (__OFADD__(v15, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v22 >= v25)
      goto LABEL_24;
    v23 = *(_QWORD *)(v16 + 8 * v22);
    ++v15;
    if (!v23)
    {
      v15 = v22 + 1;
      if (v22 + 1 >= v25)
        goto LABEL_24;
      v23 = *(_QWORD *)(v16 + 8 * v15);
      if (!v23)
      {
        v15 = v22 + 2;
        if (v22 + 2 >= v25)
          goto LABEL_24;
        v23 = *(_QWORD *)(v16 + 8 * v15);
        if (!v23)
        {
          v15 = v22 + 3;
          if (v22 + 3 >= v25)
            goto LABEL_24;
          v23 = *(_QWORD *)(v16 + 8 * v15);
          if (!v23)
            break;
        }
      }
    }
LABEL_20:
    v19 = (v23 - 1) & v23;
  }
  v24 = v22 + 4;
  if (v24 >= v25)
  {
LABEL_24:
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56))(v14, 1, 1, v4);
LABEL_25:
    swift_release();
    return v26;
  }
  v23 = *(_QWORD *)(v16 + 8 * v24);
  if (v23)
  {
    v15 = v24;
    goto LABEL_20;
  }
  while (1)
  {
    v15 = v24 + 1;
    if (__OFADD__(v24, 1))
      break;
    if (v15 >= v25)
      goto LABEL_24;
    v23 = *(_QWORD *)(v16 + 8 * v15);
    ++v24;
    if (v23)
      goto LABEL_20;
  }
LABEL_27:
  __break(1u);
  return result;
}

uint64_t EnergySite.EnergyUsage.init(imports:exports:start:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>, double a3@<D0>, double a4@<D1>)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v16;

  v8 = sub_23A8F0CA4();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a1, v8);
  v12 = MEMORY[0x24BEE4AF8];
  v13 = sub_23A8C4398(MEMORY[0x24BEE4AF8], (uint64_t (*)(uint64_t))sub_23A8C8728);
  v14 = sub_23A8C4398(v12, (uint64_t (*)(uint64_t))sub_23A8C8728);
  EnergySite.EnergyUsage.init(startTime:imports:exports:importsByPricingPeriod:exportsByPricingPeriod:subintervalCount:isValid:)((uint64_t)v11, v13, v14, 1, 1, a2, a3, a4);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v9 + 8))(a1, v8);
}

uint64_t EnergySite.EnergyUsage.init(imports:exports:start:importsByPricingPeriod:exportsByPricingPeriod:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>, double a5@<D0>, double a6@<D1>)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v17;

  v12 = sub_23A8F0CA4();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v17 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))(v15, a1, v12);
  EnergySite.EnergyUsage.init(startTime:imports:exports:importsByPricingPeriod:exportsByPricingPeriod:subintervalCount:isValid:)((uint64_t)v15, a2, a3, 1, 1, a4, a5, a6);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v13 + 8))(a1, v12);
}

uint64_t EnergySite.EnergyUsage.description.getter()
{
  sub_23A8F1328();
  sub_23A8F0C8C();
  sub_23A8F116C();
  swift_bridgeObjectRelease();
  sub_23A8F116C();
  type metadata accessor for EnergySite.EnergyUsage(0);
  sub_23A8F1214();
  sub_23A8F116C();
  sub_23A8F1214();
  sub_23A8F116C();
  swift_bridgeObjectRetain();
  sub_23A8F10C4();
  sub_23A8F116C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_23A8F116C();
  swift_bridgeObjectRetain();
  sub_23A8F10C4();
  sub_23A8F116C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t _s9EnergyKit0A4SiteC0A5UsageV9startTime10Foundation4DateVvg_0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_23A8F0CA4();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v1, v3);
}

uint64_t EnergySite.EnergyUsage.init(energyUsage:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  unint64_t v14;
  char v15;
  int v16;
  unint64_t v17;
  double v18;
  char v19;
  unint64_t v20;
  double v21;
  char v22;
  unint64_t v23;
  char v24;
  unint64_t v25;
  _BYTE *v26;
  unint64_t v28;
  char v29;
  unint64_t v30;
  __int128 v31;
  __int128 v32;
  double v33;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542D8CF8);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v31 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_23A8F0CA4();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v31 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v31 - v12;
  if (!*(_QWORD *)(a1 + 16) || (v14 = sub_23A8BFFA8(0x7472617473, 0xE500000000000000), (v15 & 1) == 0))
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v8 + 56))(v6, 1, 1, v7);
    goto LABEL_17;
  }
  sub_23A8C44C0(*(_QWORD *)(a1 + 56) + 32 * v14, (uint64_t)&v31);
  v16 = swift_dynamicCast();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v8 + 56))(v6, v16 ^ 1u, 1, v7);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
  {
LABEL_17:
    swift_bridgeObjectRelease();
    sub_23A8C64C8((uint64_t)v6, &qword_2542D8CF8);
    sub_23A8C447C();
    swift_allocError();
    *v26 = 4;
    return swift_willThrow();
  }
  (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v13, v6, v7);
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v11, v13, v7);
  if (!*(_QWORD *)(a1 + 16))
  {
    v18 = 0.0;
LABEL_19:
    v21 = 0.0;
LABEL_20:
    v25 = sub_23A8C4398(MEMORY[0x24BEE4AF8], (uint64_t (*)(uint64_t))sub_23A8BFF70);
    goto LABEL_21;
  }
  v17 = sub_23A8BFFA8(0x7374726F706D69, 0xE700000000000000);
  v18 = 0.0;
  if ((v19 & 1) != 0)
  {
    sub_23A8C44C0(*(_QWORD *)(a1 + 56) + 32 * v17, (uint64_t)&v31);
    if (swift_dynamicCast())
      v18 = v33;
  }
  if (!*(_QWORD *)(a1 + 16))
    goto LABEL_19;
  v20 = sub_23A8BFFA8(0x7374726F707865, 0xE700000000000000);
  v21 = 0.0;
  if ((v22 & 1) != 0)
  {
    sub_23A8C44C0(*(_QWORD *)(a1 + 56) + 32 * v20, (uint64_t)&v31);
    if (swift_dynamicCast())
      v21 = v33;
  }
  if (!*(_QWORD *)(a1 + 16))
    goto LABEL_20;
  v23 = sub_23A8BFFA8(0xD000000000000016, 0x800000023A8F3630);
  if ((v24 & 1) == 0)
    goto LABEL_20;
  sub_23A8C44C0(*(_QWORD *)(a1 + 56) + 32 * v23, (uint64_t)&v31);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569C8488);
  if (!swift_dynamicCast())
    goto LABEL_20;
  v25 = *(_QWORD *)&v33;
LABEL_21:
  if (*(_QWORD *)(a1 + 16) && (v28 = sub_23A8BFFA8(0xD000000000000016, 0x800000023A8F3650), (v29 & 1) != 0))
  {
    sub_23A8C44C0(*(_QWORD *)(a1 + 56) + 32 * v28, (uint64_t)&v31);
  }
  else
  {
    v31 = 0u;
    v32 = 0u;
  }
  swift_bridgeObjectRelease();
  if (!*((_QWORD *)&v32 + 1))
  {
    sub_23A8C64C8((uint64_t)&v31, &qword_2542D8AE8);
    goto LABEL_29;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569C8488);
  if (!swift_dynamicCast())
  {
LABEL_29:
    v30 = sub_23A8C4398(MEMORY[0x24BEE4AF8], (uint64_t (*)(uint64_t))sub_23A8BFF70);
    goto LABEL_30;
  }
  v30 = *(_QWORD *)&v33;
LABEL_30:
  EnergySite.EnergyUsage.init(startTime:imports:exports:importsByPricingPeriod:exportsByPricingPeriod:subintervalCount:isValid:)((uint64_t)v11, v25, v30, 1, 1, a2, v18, v21);
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v13, v7);
}

uint64_t EnergySite.HistoricalEnergyUsage.init(interval:start:usages:)@<X0>(char *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _BYTE *a4@<X8>)
{
  char v7;
  int *v8;
  _BYTE *v9;
  _BYTE *v10;
  _BYTE *v11;
  uint64_t v12;
  uint64_t result;
  _BYTE *v14;
  _BYTE *v15;

  v7 = *a1;
  v8 = (int *)type metadata accessor for EnergySite.HistoricalEnergyUsage(0);
  v9 = &a4[v8[7]];
  *(_QWORD *)v9 = 0;
  v9[8] = 1;
  v10 = &a4[v8[8]];
  *(_QWORD *)v10 = 0;
  v10[8] = 1;
  *a4 = v7;
  v11 = &a4[v8[5]];
  v12 = sub_23A8F0CA4();
  result = (*(uint64_t (**)(_BYTE *, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 32))(v11, a2, v12);
  *(_QWORD *)&a4[v8[6]] = a3;
  v14 = &a4[v8[9]];
  *(_QWORD *)v14 = 0;
  v14[8] = 0;
  v15 = &a4[v8[10]];
  *(_QWORD *)v15 = 0;
  v15[8] = 0;
  return result;
}

unsigned __int8 EnergySite.HistoricalEnergyUsage.init(response:)@<W0>(uint64_t a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _BYTE *v18;
  _BYTE *v19;
  int *v20;
  unint64_t v21;
  char v22;
  unsigned __int8 result;
  unint64_t v24;
  char v25;
  int v26;
  _BYTE *v27;
  uint64_t countAndFlagsBits;
  unint64_t v29;
  char v30;
  int v31;
  char v32;
  _BYTE *v33;
  _BYTE *v34;
  uint64_t v35;
  unint64_t v36;
  char v37;
  int v38;
  char v39;
  _BYTE *v40;
  unint64_t v41;
  char v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  unint64_t v46;
  unint64_t v47;
  unint64_t v48;
  uint64_t v49;
  _BYTE *v50;
  void (*v51)(char *, uint64_t);
  unint64_t v52;
  _BYTE *v53;
  uint64_t v54;
  uint64_t v55;
  unint64_t v56;
  char *v57;
  Swift::String v58;
  __int128 v59;
  __int128 v60;
  uint64_t v61;

  v5 = type metadata accessor for EnergySite.EnergyUsage(0);
  v61 = *(_QWORD *)(v5 - 8);
  v6 = MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v52 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v52 - v9;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542D8CF8);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v52 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_23A8F0CA4();
  v15 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v14);
  v57 = (char *)&v52 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = type metadata accessor for EnergySite.HistoricalEnergyUsage(0);
  v18 = &a2[*(int *)(v17 + 28)];
  *(_QWORD *)v18 = 0;
  v18[8] = 1;
  v19 = &a2[*(int *)(v17 + 32)];
  *(_QWORD *)v19 = 0;
  v19[8] = 1;
  if (!*(_QWORD *)(a1 + 16)
    || (v20 = (int *)v17, v21 = sub_23A8BFFA8(0x6C61767265746E69, 0xE800000000000000), (v22 & 1) == 0)
    || (sub_23A8C44C0(*(_QWORD *)(a1 + 56) + 32 * v21, (uint64_t)&v59), (swift_dynamicCast() & 1) == 0))
  {
    swift_bridgeObjectRelease();
LABEL_14:
    sub_23A8C447C();
    swift_allocError();
    *v33 = 4;
    return swift_willThrow();
  }
  result = EnergySite.EnergyUsageTimeInterval.init(rawValue:)(v58).value;
  if (v59 == 5)
  {
    __break(1u);
    return result;
  }
  *a2 = v59;
  if (!*(_QWORD *)(a1 + 16) || (v24 = sub_23A8BFFA8(0x7472617473, 0xE500000000000000), (v25 & 1) == 0))
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v15 + 56))(v13, 1, 1, v14);
    goto LABEL_16;
  }
  sub_23A8C44C0(*(_QWORD *)(a1 + 56) + 32 * v24, (uint64_t)&v59);
  v26 = swift_dynamicCast();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v15 + 56))(v13, v26 ^ 1u, 1, v14);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14) == 1)
  {
LABEL_16:
    swift_bridgeObjectRelease();
    sub_23A8C64C8((uint64_t)v13, &qword_2542D8CF8);
    goto LABEL_14;
  }
  (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v57, v13, v14);
  v27 = &a2[v20[5]];
  (*(void (**)(_BYTE *, char *, uint64_t))(v15 + 16))(v27, v57, v14);
  countAndFlagsBits = *(_QWORD *)(a1 + 16);
  if (!countAndFlagsBits)
  {
LABEL_18:
    v32 = 1;
    goto LABEL_19;
  }
  v29 = sub_23A8BFFA8(0xD000000000000016, 0x800000023A8F3670);
  if ((v30 & 1) == 0)
  {
    countAndFlagsBits = 0;
    goto LABEL_18;
  }
  sub_23A8C44C0(*(_QWORD *)(a1 + 56) + 32 * v29, (uint64_t)&v59);
  v31 = swift_dynamicCast();
  countAndFlagsBits = v58._countAndFlagsBits;
  if (!v31)
    countAndFlagsBits = 0;
  v32 = v31 ^ 1;
LABEL_19:
  v34 = &a2[v20[9]];
  *(_QWORD *)v34 = countAndFlagsBits;
  v34[8] = v32;
  v35 = *(_QWORD *)(a1 + 16);
  if (!v35)
  {
LABEL_25:
    v39 = 1;
    goto LABEL_26;
  }
  v36 = sub_23A8BFFA8(0xD000000000000016, 0x800000023A8F3690);
  if ((v37 & 1) == 0)
  {
    v35 = 0;
    goto LABEL_25;
  }
  sub_23A8C44C0(*(_QWORD *)(a1 + 56) + 32 * v36, (uint64_t)&v59);
  v38 = swift_dynamicCast();
  v35 = v58._countAndFlagsBits;
  if (!v38)
    v35 = 0;
  v39 = v38 ^ 1;
LABEL_26:
  v40 = &a2[v20[10]];
  *(_QWORD *)v40 = v35;
  v40[8] = v39;
  if (*(_QWORD *)(a1 + 16) && (v41 = sub_23A8BFFA8(0x736567617375, 0xE600000000000000), (v42 & 1) != 0))
  {
    sub_23A8C44C0(*(_QWORD *)(a1 + 56) + 32 * v41, (uint64_t)&v59);
  }
  else
  {
    v59 = 0u;
    v60 = 0u;
  }
  swift_bridgeObjectRelease();
  if (!*((_QWORD *)&v60 + 1))
  {
    sub_23A8C64C8((uint64_t)&v59, &qword_2542D8AE8);
    goto LABEL_42;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569C8490);
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_42:
    sub_23A8C447C();
    swift_allocError();
    *v50 = 4;
    swift_willThrow();
    v51 = *(void (**)(char *, uint64_t))(v15 + 8);
    v51(v57, v14);
    return ((uint64_t (*)(_BYTE *, uint64_t))v51)(v27, v14);
  }
  v55 = v58._countAndFlagsBits;
  v54 = *(_QWORD *)(v58._countAndFlagsBits + 16);
  if (v54)
  {
    v53 = v27;
    v43 = 0;
    v56 = MEMORY[0x24BEE4AF8];
    while (1)
    {
      v44 = swift_bridgeObjectRetain();
      EnergySite.EnergyUsage.init(energyUsage:)(v44, (uint64_t)v10);
      if (v2)
        break;
      sub_23A8C4544((uint64_t)v10, (uint64_t)v8);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v56 = sub_23A8BF5C4(0, *(_QWORD *)(v56 + 16) + 1, 1, v56, &qword_2569C8848, type metadata accessor for EnergySite.EnergyUsage);
      v46 = *(_QWORD *)(v56 + 16);
      v45 = *(_QWORD *)(v56 + 24);
      v47 = v46 + 1;
      if (v46 >= v45 >> 1)
      {
        v52 = v46 + 1;
        v49 = sub_23A8BF5C4(v45 > 1, v46 + 1, 1, v56, &qword_2569C8848, type metadata accessor for EnergySite.EnergyUsage);
        v47 = v52;
        v56 = v49;
      }
      ++v43;
      v48 = v56;
      *(_QWORD *)(v56 + 16) = v47;
      sub_23A8C45C4((uint64_t)v8, v48+ ((*(unsigned __int8 *)(v61 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v61 + 80))+ *(_QWORD *)(v61 + 72) * v46, type metadata accessor for EnergySite.EnergyUsage);
      sub_23A8C4588((uint64_t)v10);
      if (v54 == v43)
        goto LABEL_45;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v51 = *(void (**)(char *, uint64_t))(v15 + 8);
    v51(v57, v14);
    v27 = v53;
    return ((uint64_t (*)(_BYTE *, uint64_t))v51)(v27, v14);
  }
  v56 = MEMORY[0x24BEE4AF8];
LABEL_45:
  swift_bridgeObjectRelease();
  result = (*(unint64_t (**)(char *, uint64_t))(v15 + 8))(v57, v14);
  *(_QWORD *)&a2[v20[6]] = v56;
  return result;
}

void EnergySite.HistoricalEnergyUsage.interval.getter(_BYTE *a1@<X8>)
{
  _BYTE *v1;

  *a1 = *v1;
}

uint64_t EnergySite.HistoricalEnergyUsage.start.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for EnergySite.HistoricalEnergyUsage(0) + 20);
  v4 = sub_23A8F0CA4();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t EnergySite.HistoricalEnergyUsage.usages.getter()
{
  type metadata accessor for EnergySite.HistoricalEnergyUsage(0);
  return swift_bridgeObjectRetain();
}

uint64_t EnergySite.HistoricalEnergyUsage.totalImports.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + *(int *)(type metadata accessor for EnergySite.HistoricalEnergyUsage(0) + 28));
}

uint64_t EnergySite.HistoricalEnergyUsage.totalImports.setter(uint64_t a1, char a2)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v6;

  result = type metadata accessor for EnergySite.HistoricalEnergyUsage(0);
  v6 = v2 + *(int *)(result + 28);
  *(_QWORD *)v6 = a1;
  *(_BYTE *)(v6 + 8) = a2 & 1;
  return result;
}

uint64_t (*EnergySite.HistoricalEnergyUsage.totalImports.modify())()
{
  type metadata accessor for EnergySite.HistoricalEnergyUsage(0);
  return nullsub_1;
}

uint64_t EnergySite.HistoricalEnergyUsage.totalExports.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + *(int *)(type metadata accessor for EnergySite.HistoricalEnergyUsage(0) + 32));
}

uint64_t EnergySite.HistoricalEnergyUsage.totalExports.setter(uint64_t a1, char a2)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v6;

  result = type metadata accessor for EnergySite.HistoricalEnergyUsage(0);
  v6 = v2 + *(int *)(result + 32);
  *(_QWORD *)v6 = a1;
  *(_BYTE *)(v6 + 8) = a2 & 1;
  return result;
}

uint64_t (*EnergySite.HistoricalEnergyUsage.totalExports.modify())()
{
  type metadata accessor for EnergySite.HistoricalEnergyUsage(0);
  return nullsub_1;
}

uint64_t EnergySite.HistoricalEnergyUsage.validationTotalImports.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + *(int *)(type metadata accessor for EnergySite.HistoricalEnergyUsage(0) + 36));
}

uint64_t EnergySite.HistoricalEnergyUsage.validationTotalExports.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + *(int *)(type metadata accessor for EnergySite.HistoricalEnergyUsage(0) + 40));
}

void static EnergySite.HistoricalEnergyUsage.subintervalFor(_:)(uint64_t a1)
{
  __asm { BR              X10 }
}

uint64_t sub_23A8BA6E0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *MEMORY[0x24BDCF220];
  v2 = sub_23A8F0D28();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 104))(v0, v1, v2);
}

uint64_t sub_23A8BA738(uint64_t a1, _BYTE *a2, uint64_t a3, char a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;

  *(_QWORD *)(v5 + 24) = a3;
  *(_QWORD *)(v5 + 32) = v4;
  *(_BYTE *)(v5 + 113) = a4;
  *(_QWORD *)(v5 + 16) = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569C84A0);
  *(_QWORD *)(v5 + 40) = swift_task_alloc();
  *(_QWORD *)(v5 + 48) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(qword_2569C84A8);
  *(_QWORD *)(v5 + 56) = swift_task_alloc();
  v7 = sub_23A8F0D58();
  *(_QWORD *)(v5 + 64) = v7;
  *(_QWORD *)(v5 + 72) = *(_QWORD *)(v7 - 8);
  *(_QWORD *)(v5 + 80) = swift_task_alloc();
  *(_BYTE *)(v5 + 114) = *a2;
  return swift_task_switch();
}

uint64_t sub_23A8BA804()
{
  uint64_t v0;
  uint64_t v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _BYTE *v17;
  _BYTE *v18;
  char v20;
  _QWORD *v21;

  v1 = *(_QWORD *)(v0 + 32);
  v2 = *(id *)(v1 + 16);
  sub_23A8F0F8C();
  v4 = v3;

  if (!v4)
    goto LABEL_8;
  v5 = *(id *)(v1 + 16);
  v6 = sub_23A8F0F98();
  v8 = v7;

  *(_QWORD *)(v0 + 88) = v8;
  if (!v8)
  {
LABEL_7:
    swift_bridgeObjectRelease();
LABEL_8:
    sub_23A8C447C();
    swift_allocError();
    *v18 = 0;
    goto LABEL_9;
  }
  v9 = *(id *)(v1 + 16);
  v10 = sub_23A8F0EA8();
  v12 = v11;

  *(_QWORD *)(v0 + 96) = v12;
  if (!v12)
  {
    swift_bridgeObjectRelease();
    goto LABEL_7;
  }
  v14 = *(_QWORD *)(v0 + 64);
  v13 = *(_QWORD *)(v0 + 72);
  v15 = *(_QWORD *)(v0 + 56);
  sub_23A8F0D40();
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v13 + 48))(v15, 1, v14) == 1)
  {
    v16 = *(_QWORD *)(v0 + 56);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_23A8C64C8(v16, qword_2569C84A8);
    sub_23A8C447C();
    swift_allocError();
    *v17 = 1;
LABEL_9:
    swift_willThrow();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  v20 = *(_BYTE *)(v0 + 114);
  (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(v0 + 72) + 32))(*(_QWORD *)(v0 + 80), *(_QWORD *)(v0 + 56), *(_QWORD *)(v0 + 64));
  *(_BYTE *)(v0 + 112) = v20;
  v21 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 104) = v21;
  *v21 = v0;
  v21[1] = sub_23A8BAA38;
  return EnergySite.historicalEnergyUsage(interval:start:timezone:utilityID:subscriptionID:bulk:)(*(_QWORD *)(v0 + 48), (_BYTE *)(v0 + 112), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 80), v6, v8, v10, v12);
}

uint64_t sub_23A8BAA38()
{
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_task_switch();
}

uint64_t sub_23A8BAAA0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v1 = *(_QWORD *)(v0 + 40);
  sub_23A8C6700(*(_QWORD *)(v0 + 48), v1, &qword_2569C84A0);
  v2 = type metadata accessor for EnergySite.HistoricalEnergyUsage(0);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 48))(v1, 1, v2) == 1)
  {
    v4 = *(_QWORD *)(v0 + 72);
    v3 = *(_QWORD *)(v0 + 80);
    v5 = *(_QWORD *)(v0 + 64);
    v6 = *(_QWORD *)(v0 + 48);
    sub_23A8C64C8(*(_QWORD *)(v0 + 40), &qword_2569C84A0);
    sub_23A8C447C();
    swift_allocError();
    *v7 = 4;
    swift_willThrow();
    sub_23A8C64C8(v6, &qword_2569C84A0);
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  }
  else
  {
    v9 = *(_QWORD *)(v0 + 72);
    v8 = *(_QWORD *)(v0 + 80);
    v10 = *(_QWORD *)(v0 + 64);
    v11 = *(_QWORD *)(v0 + 40);
    v12 = *(_QWORD *)(v0 + 16);
    sub_23A8C64C8(*(_QWORD *)(v0 + 48), &qword_2569C84A0);
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v8, v10);
    sub_23A8C45C4(v11, v12, type metadata accessor for EnergySite.HistoricalEnergyUsage);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23A8BAC20(uint64_t a1, _BYTE *a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v6;

  *(_BYTE *)(v3 + 32) = *a2;
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v6;
  *v6 = v3;
  v6[1] = sub_23A8BAC94;
  return sub_23A8BA738(a1, (_BYTE *)(v3 + 32), a3, 0);
}

uint64_t sub_23A8BAC94()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 24) = v0;
  swift_task_dealloc();
  if (v0)
    return swift_task_switch();
  else
    return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_23A8BAD00()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23A8BAD0C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;

  v9[10] = a8;
  v9[11] = v8;
  v9[8] = a6;
  v9[9] = a7;
  v9[6] = a4;
  v9[7] = a5;
  v9[4] = a2;
  v9[5] = a3;
  v9[3] = a1;
  __swift_instantiateConcreteTypeFromMangledName(qword_2569C84A8);
  v9[12] = swift_task_alloc();
  v10 = sub_23A8F0D58();
  v9[13] = v10;
  v9[14] = *(_QWORD *)(v10 - 8);
  v9[15] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23A8BADA0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  _QWORD *v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _BYTE *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;

  v1 = *(_QWORD *)(v0 + 104);
  v2 = *(_QWORD *)(v0 + 112);
  v4 = *(_QWORD *)(v0 + 88);
  v3 = *(_QWORD *)(v0 + 96);
  v5 = *(id *)(v4 + 16);
  v6 = sub_23A8F0E54();
  v8 = v7;

  *(_QWORD *)(v0 + 128) = v8;
  sub_23A8F0D40();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v3, 1, v1) == 1)
  {
    v9 = *(_QWORD *)(v0 + 96);
    swift_bridgeObjectRelease();
    sub_23A8C64C8(v9, qword_2569C84A8);
  }
  else
  {
    (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(v0 + 112) + 32))(*(_QWORD *)(v0 + 120), *(_QWORD *)(v0 + 96), *(_QWORD *)(v0 + 104));
    v10 = *(id *)(v4 + 16);
    v11 = sub_23A8F0F98();
    v13 = v12;

    *(_QWORD *)(v0 + 136) = v13;
    if (v13)
    {
      v14 = *(id *)(v4 + 16);
      v15 = sub_23A8F0EA8();
      v17 = v16;

      *(_QWORD *)(v0 + 144) = v17;
      if (v17)
      {
        v33 = *(_QWORD *)(v0 + 80);
        v31 = *(_QWORD *)(v0 + 72);
        v32 = *(_QWORD *)(v0 + 120);
        v18 = *(_QWORD *)(v0 + 48);
        v19 = *(_QWORD *)(v0 + 24);
        v20 = swift_task_alloc();
        *(_QWORD *)(v0 + 152) = v20;
        v21 = *(_OWORD *)(v0 + 32);
        *(_QWORD *)(v20 + 16) = v6;
        *(_QWORD *)(v20 + 24) = v8;
        *(_QWORD *)(v20 + 32) = v15;
        *(_QWORD *)(v20 + 40) = v17;
        *(_QWORD *)(v20 + 48) = v11;
        *(_QWORD *)(v20 + 56) = v13;
        *(_QWORD *)(v20 + 64) = v19;
        *(_OWORD *)(v20 + 72) = v21;
        *(_QWORD *)(v20 + 88) = v18;
        *(_QWORD *)(v20 + 96) = v32;
        *(_QWORD *)(v20 + 104) = v31;
        *(_QWORD *)(v20 + 112) = v33;
        v22 = (_QWORD *)swift_task_alloc();
        *(_QWORD *)(v0 + 160) = v22;
        __swift_instantiateConcreteTypeFromMangledName(qword_2569C84C0);
        *v22 = v0;
        v22[1] = sub_23A8BB024;
        return sub_23A8F1400();
      }
      v28 = *(_QWORD *)(v0 + 112);
      v27 = *(_QWORD *)(v0 + 120);
      v29 = *(_QWORD *)(v0 + 104);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      (*(void (**)(uint64_t, uint64_t))(v28 + 8))(v27, v29);
    }
    else
    {
      v25 = *(_QWORD *)(v0 + 112);
      v24 = *(_QWORD *)(v0 + 120);
      v26 = *(_QWORD *)(v0 + 104);
      swift_bridgeObjectRelease();
      (*(void (**)(uint64_t, uint64_t))(v25 + 8))(v24, v26);
    }
  }
  sub_23A8C447C();
  swift_allocError();
  *v30 = 4;
  swift_willThrow();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23A8BB024()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 168) = v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23A8BB0BC()
{
  uint64_t v0;
  uint64_t v1;

  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 112) + 8))(*(_QWORD *)(v0 + 120), *(_QWORD *)(v0 + 104));
  v1 = *(_QWORD *)(v0 + 16);
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v1);
}

uint64_t sub_23A8BB11C()
{
  uint64_t v0;

  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 112) + 8))(*(_QWORD *)(v0 + 120), *(_QWORD *)(v0 + 104));
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23A8BB16C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, unint64_t a12, uint64_t a13, uint64_t a14)
{
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD *v29;
  void (*v30)(char *, uint64_t, uint64_t);
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  char *v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  char *v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  void (*v50)(char *, char *, uint64_t);
  char *v51;
  uint64_t v52;
  uint64_t v54;
  uint64_t v55;
  char *v56;
  char *v57;
  char *v58;
  char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  unint64_t v63;
  char *v64;
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
  _QWORD *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;

  v71 = a7;
  v72 = a8;
  v69 = a5;
  v70 = a6;
  v65 = a2;
  v66 = a3;
  v73 = a13;
  v74 = a14;
  v62 = a11;
  v63 = a12;
  v67 = a9;
  v68 = a4;
  v60 = a1;
  v61 = a10;
  v14 = sub_23A8F0D58();
  v77 = *(_QWORD *)(v14 - 8);
  v78 = v14;
  v15 = *(_QWORD *)(v77 + 64);
  MEMORY[0x24BDAC7A8](v14);
  v59 = (char *)&v54 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = sub_23A8F0CA4();
  v75 = *(_QWORD **)(v16 - 8);
  v76 = v16;
  v17 = v75[8];
  v18 = MEMORY[0x24BDAC7A8](v16);
  v58 = (char *)&v54 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v18);
  v20 = (char *)&v54 - v19;
  v57 = (char *)&v54 - v19;
  v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569C8830);
  v22 = *(_QWORD *)(v21 - 8);
  v55 = v21;
  v23 = *(_QWORD *)(v22 + 64);
  MEMORY[0x24BDAC7A8](v21);
  v56 = (char *)&v54 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542D8AC0);
  MEMORY[0x24BDAC7A8](v24);
  v26 = (char *)&v54 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  v64 = v26;
  v27 = sub_23A8F1208();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v27 - 8) + 56))(v26, 1, 1, v27);
  (*(void (**)(char *, uint64_t, uint64_t))(v22 + 16))((char *)&v54 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0), v60, v21);
  v29 = v75;
  v28 = v76;
  v30 = (void (*)(char *, uint64_t, uint64_t))v75[2];
  v30(v20, v61, v76);
  v30((char *)&v54 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0), v62, v28);
  v31 = v77;
  (*(void (**)(char *, unint64_t, uint64_t))(v77 + 16))((char *)&v54 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0), v63, v78);
  v32 = (*(unsigned __int8 *)(v22 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v22 + 80);
  v33 = (v23 + v32 + 7) & 0xFFFFFFFFFFFFFFF8;
  v34 = (v33 + 23) & 0xFFFFFFFFFFFFFFF8;
  v35 = (v34 + 23) & 0xFFFFFFFFFFFFFFF8;
  v36 = *((unsigned __int8 *)v29 + 80);
  v37 = (v36 + v35 + 16) & ~v36;
  v38 = (v17 + v36 + v37) & ~v36;
  v39 = (v17 + *(unsigned __int8 *)(v31 + 80) + v38) & ~(unint64_t)*(unsigned __int8 *)(v31 + 80);
  v63 = (v15 + v39 + 7) & 0xFFFFFFFFFFFFFFF8;
  v40 = (char *)swift_allocObject();
  *((_QWORD *)v40 + 2) = 0;
  *((_QWORD *)v40 + 3) = 0;
  v41 = v66;
  *((_QWORD *)v40 + 4) = v65;
  *((_QWORD *)v40 + 5) = v41;
  (*(void (**)(char *, char *, uint64_t))(v22 + 32))(&v40[v32], v56, v55);
  v42 = &v40[v33];
  v43 = v69;
  *(_QWORD *)v42 = v68;
  *((_QWORD *)v42 + 1) = v43;
  v44 = &v40[v34];
  v45 = v71;
  *(_QWORD *)v44 = v70;
  *((_QWORD *)v44 + 1) = v45;
  v46 = &v40[v35];
  v47 = v67;
  *(_QWORD *)v46 = v72;
  *((_QWORD *)v46 + 1) = v47;
  v48 = &v40[v37];
  v49 = v76;
  v50 = (void (*)(char *, char *, uint64_t))v75[4];
  v50(v48, v57, v76);
  v50(&v40[v38], v58, v49);
  (*(void (**)(char *, char *, uint64_t))(v77 + 32))(&v40[v39], v59, v78);
  v51 = &v40[v63];
  v52 = v74;
  *(_QWORD *)v51 = v73;
  *((_QWORD *)v51 + 1) = v52;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_23A8DEC80((uint64_t)v64, (uint64_t)&unk_2569C8840, (uint64_t)v40);
  return swift_release();
}

uint64_t sub_23A8BB4DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;

  *(_QWORD *)(v8 + 240) = v16;
  *(_OWORD *)(v8 + 208) = v14;
  *(_OWORD *)(v8 + 224) = v15;
  *(_OWORD *)(v8 + 176) = v12;
  *(_OWORD *)(v8 + 192) = v13;
  *(_QWORD *)(v8 + 160) = a7;
  *(_QWORD *)(v8 + 168) = a8;
  *(_QWORD *)(v8 + 144) = a5;
  *(_QWORD *)(v8 + 152) = a6;
  *(_QWORD *)(v8 + 136) = a4;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569C8830);
  *(_QWORD *)(v8 + 248) = v9;
  v10 = *(_QWORD *)(v9 - 8);
  *(_QWORD *)(v8 + 256) = v10;
  *(_QWORD *)(v8 + 264) = *(_QWORD *)(v10 + 64);
  *(_QWORD *)(v8 + 272) = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23A8BB564()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;

  v1 = v0[34];
  v3 = v0[31];
  v2 = v0[32];
  v4 = v0[19];
  v5 = v0[17];
  v6 = v0[18];
  type metadata accessor for HomeEnergyXPCConnection();
  swift_allocObject();
  v0[35] = sub_23A8EF888();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v4, v3);
  v7 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = v5;
  *(_QWORD *)(v8 + 24) = v6;
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v2 + 32))(v8 + v7, v1, v3);
  swift_bridgeObjectRetain();
  v9 = (void *)sub_23A8EFE34((uint64_t)sub_23A8C7058, v8);
  v0[36] = v9;
  swift_release();
  v10 = sub_23A8F1130();
  v0[37] = v10;
  v11 = sub_23A8F1130();
  v0[38] = v11;
  v12 = sub_23A8F1130();
  v0[39] = v12;
  v13 = sub_23A8F0C44();
  v0[40] = v13;
  v14 = sub_23A8F0C44();
  v0[41] = v14;
  v15 = sub_23A8F0D4C();
  v0[42] = v15;
  v16 = sub_23A8F1130();
  v0[43] = v16;
  v0[7] = v0 + 15;
  v0[2] = v0;
  v0[3] = sub_23A8BB790;
  v17 = swift_continuation_init();
  v0[10] = MEMORY[0x24BDAC760];
  v18 = v0 + 10;
  v18[1] = 0x40000000;
  v18[2] = sub_23A8BBC38;
  v18[3] = &block_descriptor_128;
  v18[4] = v17;
  objc_msgSend(v9, sel_intervalReadingWithSubscriptionID_utilityID_interval_start_end_timeZone_flowDirection_completionHandler_, v10, v11, v12, v13, v14, v15, v16, v18);
  return swift_continuation_await();
}

uint64_t sub_23A8BB790()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)v0 + 352) = *(_QWORD *)(*(_QWORD *)v0 + 48);
  return swift_task_switch();
}

uint64_t sub_23A8BB7F0()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;

  v2 = *(void **)(v0 + 336);
  v1 = *(void **)(v0 + 344);
  v4 = *(void **)(v0 + 320);
  v3 = *(void **)(v0 + 328);
  v5 = *(void **)(v0 + 304);
  v6 = *(void **)(v0 + 312);
  v7 = *(void **)(v0 + 296);
  v8 = *(_QWORD *)(v0 + 280);
  v9 = *(_QWORD *)(v0 + 120);
  swift_unknownObjectRelease();

  objc_msgSend(*(id *)(v8 + 16), sel_invalidate);
  *(_QWORD *)(v0 + 128) = v9;
  sub_23A8F11F0();
  swift_release();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23A8BB8B4()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v8;

  v1 = *(void **)(v0 + 344);
  v3 = *(void **)(v0 + 328);
  v2 = *(void **)(v0 + 336);
  v5 = *(void **)(v0 + 312);
  v4 = *(void **)(v0 + 320);
  v6 = *(void **)(v0 + 304);
  v8 = *(void **)(v0 + 296);
  swift_willThrow();
  swift_release();
  swift_unknownObjectRelease();

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23A8BB958(void *a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  id v13;
  id v14;
  NSObject *v15;
  os_log_type_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  id v23;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  v8 = sub_23A8F10A0();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2542D8828 != -1)
    swift_once();
  v12 = __swift_project_value_buffer(v8, (uint64_t)qword_2542D8DE0);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, v12, v8);
  v13 = a1;
  swift_bridgeObjectRetain();
  v14 = a1;
  swift_bridgeObjectRetain();
  v15 = sub_23A8F1088();
  v16 = sub_23A8F1274();
  if (os_log_type_enabled(v15, v16))
  {
    v17 = swift_slowAlloc();
    v26 = a2;
    v18 = v17;
    v28 = swift_slowAlloc();
    v30 = (uint64_t)a1;
    v31 = v28;
    *(_DWORD *)v18 = 136315394;
    v29 = a4;
    v19 = a1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2542D8AE0);
    v20 = sub_23A8F1148();
    v27 = v9;
    v30 = sub_23A8BF840(v20, v21, &v31);
    sub_23A8F12A4();
    swift_bridgeObjectRelease();

    *(_WORD *)(v18 + 12) = 2080;
    swift_bridgeObjectRetain();
    v30 = sub_23A8BF840(v26, a3, &v31);
    sub_23A8F12A4();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_23A8AD000, v15, v16, "interval reading command failed for %s %s", (uint8_t *)v18, 0x16u);
    v22 = v28;
    swift_arrayDestroy();
    MEMORY[0x23B85B51C](v22, -1, -1);
    MEMORY[0x23B85B51C](v18, -1, -1);

    (*(void (**)(char *, uint64_t))(v27 + 8))(v11, v8);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  }
  v31 = (uint64_t)a1;
  v23 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569C8830);
  return sub_23A8F11E4();
}

uint64_t sub_23A8BBC38(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3;
  _QWORD *v5;
  id v6;

  v3 = *(_QWORD *)(a1 + 32);
  if (a3)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2542D8AE0);
    swift_allocError();
    *v5 = a3;
    v6 = a3;
    return swift_continuation_throwingResumeWithError();
  }
  else
  {
    sub_23A8F0CA4();
    sub_23A8C6A38(&qword_2569C87A8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE930]);
    **(_QWORD **)(*(_QWORD *)(v3 + 64) + 40) = sub_23A8F10B8();
    return swift_continuation_throwingResume();
  }
}

uint64_t sub_23A8BBCFC()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = v0;
  return swift_task_switch();
}

uint64_t sub_23A8BBD14()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 24) = v1;
  *v1 = v0;
  v1[1] = sub_23A8BBD9C;
  return sub_23A8F1400();
}

uint64_t sub_23A8BBD9C()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 32) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23A8BBE00()
{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(unsigned __int8 *)(v0 + 40));
}

uint64_t sub_23A8BBE10()
{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD))(v0 + 8))(0);
}

uint64_t sub_23A8BBE20(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4, uint64_t a5, void (*a6)(char *, uint64_t, uint64_t))
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v19;

  v10 = __swift_instantiateConcreteTypeFromMangledName(a3);
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(_QWORD *)(v11 + 64);
  MEMORY[0x24BDAC7A8]();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2542D8AC0);
  MEMORY[0x24BDAC7A8]();
  v14 = (char *)&v19 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_23A8F1208();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56))(v14, 1, 1, v15);
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))((char *)&v19 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v10);
  v16 = (*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  v17 = swift_allocObject();
  *(_QWORD *)(v17 + 16) = 0;
  *(_QWORD *)(v17 + 24) = 0;
  (*(void (**)(unint64_t, char *, uint64_t))(v11 + 32))(v17 + v16, (char *)&v19 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0), v10);
  *(_QWORD *)(v17 + ((v12 + v16 + 7) & 0xFFFFFFFFFFFFFFF8)) = a2;
  swift_retain();
  a6(v14, a5, v17);
  return swift_release();
}

uint64_t sub_23A8BBF7C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;

  v5[15] = a4;
  v5[16] = a5;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569C8818);
  v5[17] = v6;
  v7 = *(_QWORD *)(v6 - 8);
  v5[18] = v7;
  v5[19] = *(_QWORD *)(v7 + 64);
  v5[20] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23A8BBFE4()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;

  v1 = v0[20];
  v2 = v0[17];
  v3 = v0[18];
  v4 = v0[15];
  v5 = v0[16];
  type metadata accessor for HomeEnergyXPCConnection();
  swift_allocObject();
  v0[21] = sub_23A8EF888();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v1, v4, v2);
  v6 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v7 = swift_allocObject();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v3 + 32))(v7 + v6, v1, v2);
  v8 = (void *)sub_23A8EFE34((uint64_t)sub_23A8C6CB4, v7);
  v0[22] = v8;
  swift_release();
  v9 = *(id *)(v5 + 16);
  sub_23A8F0F50();

  v10 = sub_23A8F1130();
  v0[23] = v10;
  swift_bridgeObjectRelease();
  v0[7] = v0 + 25;
  v0[2] = v0;
  v0[3] = sub_23A8BC178;
  v11 = swift_continuation_init();
  v0[10] = MEMORY[0x24BDAC760];
  v0[11] = 0x40000000;
  v0[12] = sub_23A8E5794;
  v0[13] = &block_descriptor_119;
  v0[14] = v11;
  objc_msgSend(v8, sel_isDataAvailableWithSiteID_completionHandler_, v10, v0 + 10);
  return swift_continuation_await();
}

uint64_t sub_23A8BC178()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)v0 + 192) = *(_QWORD *)(*(_QWORD *)v0 + 48);
  return swift_task_switch();
}

uint64_t sub_23A8BC1D8()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  char v3;

  v1 = *(void **)(v0 + 184);
  v2 = *(_QWORD *)(v0 + 168);
  v3 = *(_BYTE *)(v0 + 200);
  swift_unknownObjectRelease();

  objc_msgSend(*(id *)(v2 + 16), sel_invalidate);
  *(_BYTE *)(v0 + 201) = v3;
  sub_23A8F11F0();
  swift_release();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23A8BC260()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 184);
  swift_willThrow();
  swift_release();
  swift_unknownObjectRelease();

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23A8BC2C8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = v1;
  return swift_task_switch();
}

uint64_t sub_23A8BC2E0()
{
  _QWORD *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  v1 = *(id *)(v0[3] + 16);
  v2 = sub_23A8F0F50();
  v4 = v3;

  v0[4] = v4;
  v5 = (_QWORD *)swift_task_alloc();
  v0[5] = v5;
  *v5 = v0;
  v5[1] = sub_23A8BC358;
  return sub_23A8C3804(v2, v4);
}

uint64_t sub_23A8BC358(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_QWORD *)(v3 + 48) = a1;
  *(_QWORD *)(v3 + 56) = v1;
  swift_task_dealloc();
  if (!v1)
    swift_bridgeObjectRelease();
  return swift_task_switch();
}

uint64_t sub_23A8BC3CC()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  id v3;
  uint64_t v4;

  v1 = *(void **)(v0 + 48);
  v2 = *(_QWORD *)(v0 + 16);
  if (v1)
  {
    v3 = v1;
    sub_23A8F0EC0();

  }
  else
  {
    v4 = sub_23A8F0DAC();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(v2, 1, 1, v4);
  }
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23A8BC448()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23A8BC47C()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  v1[6] = v0;
  v2 = sub_23A8F10A0();
  v1[7] = v2;
  v1[8] = *(_QWORD *)(v2 - 8);
  v1[9] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2542D8D00);
  v1[10] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(qword_2569C84E8);
  v1[11] = swift_task_alloc();
  v3 = sub_23A8F0DA0();
  v1[12] = v3;
  v1[13] = *(_QWORD *)(v3 - 8);
  v1[14] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23A8BC54C()
{
  _QWORD *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  v1 = *(id *)(v0[6] + 16);
  v2 = sub_23A8F0F50();
  v4 = v3;

  v0[15] = v4;
  v5 = (_QWORD *)swift_task_alloc();
  v0[16] = v5;
  *v5 = v0;
  v5[1] = sub_23A8BC5C4;
  return sub_23A8C3804(v2, v4);
}

uint64_t sub_23A8BC5C4(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;

  v4 = *v2;
  *(_QWORD *)(*v2 + 136) = v1;
  swift_task_dealloc();
  if (!v1)
  {
    *(_QWORD *)(v4 + 144) = a1;
    swift_bridgeObjectRelease();
  }
  return swift_task_switch();
}

uint64_t sub_23A8BC640()
{
  uint64_t v0;
  NSObject *v1;
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  id v23;
  NSObject *v24;
  os_log_type_t v25;
  uint8_t *v26;
  _QWORD *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;

  v1 = *(NSObject **)(v0 + 144);
  if (!v1)
    goto LABEL_4;
  v2 = *(_QWORD *)(v0 + 80);
  v3 = v1;
  sub_23A8F0EC0();

  v4 = sub_23A8F0DAC();
  v5 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(v2, 1, v4);
  v6 = *(_QWORD *)(v0 + 80);
  if (v5)
  {
    sub_23A8C64C8(*(_QWORD *)(v0 + 80), &qword_2542D8D00);
LABEL_4:
    (*(void (**)(_QWORD, uint64_t, uint64_t, _QWORD))(*(_QWORD *)(v0 + 104) + 56))(*(_QWORD *)(v0 + 88), 1, 1, *(_QWORD *)(v0 + 96));
    v3 = v1;
LABEL_5:

    sub_23A8C64C8(*(_QWORD *)(v0 + 88), qword_2569C84E8);
    goto LABEL_6;
  }
  v9 = sub_23A8F0D70();
  sub_23A8C64C8(v6, &qword_2542D8D00);
  if (*(_QWORD *)(v9 + 16))
  {
    (*(void (**)(_QWORD, unint64_t, _QWORD))(*(_QWORD *)(v0 + 104) + 16))(*(_QWORD *)(v0 + 88), v9+ ((*(unsigned __int8 *)(*(_QWORD *)(v0 + 104) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v0 + 104) + 80)), *(_QWORD *)(v0 + 96));
    v10 = 0;
  }
  else
  {
    v10 = 1;
  }
  v11 = *(_QWORD *)(v0 + 96);
  v12 = *(_QWORD *)(v0 + 104);
  v13 = *(_QWORD *)(v0 + 88);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v12 + 56))(v13, v10, 1, v11);
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v12 + 48))(v13, 1, v11) == 1)
    goto LABEL_5;
  v14 = *(void **)(v0 + 136);
  v15 = *(_QWORD *)(v0 + 112);
  v16 = (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(*(_QWORD *)(v0 + 104) + 32))(v15, *(_QWORD *)(v0 + 88), *(_QWORD *)(v0 + 96));
  v36 = MEMORY[0x24BEE4AF8];
  v17 = (void *)MEMORY[0x23B85B168](v16);
  sub_23A8BCA8C(v15, &v36);
  if (!v14)
  {
    v31 = *(_QWORD *)(v0 + 104);
    v30 = *(_QWORD *)(v0 + 112);
    v32 = *(_QWORD *)(v0 + 96);
    objc_autoreleasePoolPop(v17);

    (*(void (**)(uint64_t, uint64_t))(v31 + 8))(v30, v32);
    v7 = v36;
    goto LABEL_7;
  }
  objc_autoreleasePoolPop(v17);
  if (qword_2569C8350 != -1)
    swift_once();
  v19 = *(_QWORD *)(v0 + 64);
  v18 = *(_QWORD *)(v0 + 72);
  v20 = *(_QWORD *)(v0 + 56);
  v21 = __swift_project_value_buffer(v20, (uint64_t)qword_2569C9B00);
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v19 + 16))(v18, v21, v20);
  v22 = v14;
  v23 = v14;
  v24 = sub_23A8F1088();
  v25 = sub_23A8F1274();
  if (os_log_type_enabled(v24, v25))
  {
    v26 = (uint8_t *)swift_slowAlloc();
    v27 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v26 = 138412290;
    v28 = v14;
    v29 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v0 + 40) = v29;
    sub_23A8F12A4();
    *v27 = v29;

    _os_log_impl(&dword_23A8AD000, v24, v25, "Failed to unarchive Readings %@", v26, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(qword_2569C8410);
    swift_arrayDestroy();
    MEMORY[0x23B85B51C](v27, -1, -1);
    MEMORY[0x23B85B51C](v26, -1, -1);

  }
  else
  {

    v3 = v24;
  }

  v34 = *(_QWORD *)(v0 + 104);
  v33 = *(_QWORD *)(v0 + 112);
  v35 = *(_QWORD *)(v0 + 96);
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 64) + 8))(*(_QWORD *)(v0 + 72), *(_QWORD *)(v0 + 56));
  (*(void (**)(uint64_t, uint64_t))(v34 + 8))(v33, v35);
  swift_bridgeObjectRelease();
LABEL_6:
  v7 = 0;
LABEL_7:
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(unint64_t))(v0 + 8))(v7);
}

uint64_t sub_23A8BCA28()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23A8BCA8C(uint64_t a1, unint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  void *v13;
  void *v14;
  uint64_t result;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t *v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  char *v30;
  _QWORD v31[2];
  unint64_t *v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  char *v37;
  uint64_t v38;

  v3 = sub_23A8F104C();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)v31 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)v31 - v8;
  sub_23A8C6974();
  v10 = sub_23A8F0D94();
  v12 = v11;
  v13 = v36;
  v14 = (void *)sub_23A8F128C();
  result = sub_23A8C69B0(v10, v12);
  if (!v13)
  {
    v33 = v9;
    v34 = v3;
    v37 = v7;
    if (!v14 || (v38 = 0, sub_23A8F119C(), v14, (v16 = v38) == 0))
    {
      swift_bridgeObjectRelease();
      v16 = MEMORY[0x24BEE4AF8];
    }
    v18 = v33;
    v17 = v34;
    v19 = v4;
    v20 = *(_QWORD *)(v16 + 16);
    if (v20)
    {
      v35 = v19;
      v31[1] = v16;
      v32 = a2;
      v21 = (unint64_t *)(v16 + 40);
      do
      {
        v22 = *(v21 - 1);
        v23 = *v21;
        v24 = sub_23A8C69F4(v22, *v21);
        v36 = (void *)MEMORY[0x23B85B168](v24);
        sub_23A8F0BD8();
        swift_allocObject();
        sub_23A8F0BCC();
        sub_23A8C6A38(&qword_2569C87F8, (uint64_t (*)(uint64_t))MEMORY[0x24BE4F4C0], MEMORY[0x24BE4F4E8]);
        sub_23A8F0BC0();
        swift_release();
        (*(void (**)(char *, char *, uint64_t))(v35 + 16))(v37, v18, v17);
        v25 = *a2;
        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        *a2 = v25;
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        {
          v25 = sub_23A8BF5C4(0, *(_QWORD *)(v25 + 16) + 1, 1, v25, &qword_2569C8800, (uint64_t (*)(_QWORD))MEMORY[0x24BE4F4C0]);
          *a2 = v25;
        }
        v28 = *(_QWORD *)(v25 + 16);
        v27 = *(_QWORD *)(v25 + 24);
        if (v28 >= v27 >> 1)
        {
          v25 = sub_23A8BF5C4(v27 > 1, v28 + 1, 1, v25, &qword_2569C8800, (uint64_t (*)(_QWORD))MEMORY[0x24BE4F4C0]);
          *v32 = v25;
        }
        v21 += 2;
        *(_QWORD *)(v25 + 16) = v28 + 1;
        v17 = v34;
        v29 = v35;
        (*(void (**)(unint64_t, char *, uint64_t))(v35 + 32))(v25+ ((*(unsigned __int8 *)(v29 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v29 + 80))+ *(_QWORD *)(v35 + 72) * v28, v37, v34);
        v30 = v33;
        (*(void (**)(char *, uint64_t))(v29 + 8))(v33, v17);
        objc_autoreleasePoolPop(v36);
        sub_23A8C69B0(v22, v23);
        --v20;
        a2 = v32;
        v18 = v30;
      }
      while (v20);
    }
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_23A8BCD9C(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;

  v2[2] = a1;
  v2[3] = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2542D8D00);
  v2[4] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(qword_2569C84E8);
  v2[5] = swift_task_alloc();
  v3 = sub_23A8F0DA0();
  v2[6] = v3;
  v2[7] = *(_QWORD *)(v3 - 8);
  v2[8] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23A8BCE44()
{
  _QWORD *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  v1 = *(id *)(v0[3] + 16);
  v2 = sub_23A8F0F50();
  v4 = v3;

  v0[9] = v4;
  v5 = (_QWORD *)swift_task_alloc();
  v0[10] = v5;
  *v5 = v0;
  v5[1] = sub_23A8BCEBC;
  return sub_23A8C3804(v2, v4);
}

uint64_t sub_23A8BCEBC(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;
  _QWORD *v5;

  v3 = (_QWORD *)*v2;
  v3[11] = a1;
  v3[12] = v1;
  swift_task_dealloc();
  if (v1)
    return swift_task_switch();
  swift_bridgeObjectRelease();
  v5 = (_QWORD *)swift_task_alloc();
  v3[13] = v5;
  *v5 = v3;
  v5[1] = sub_23A8BCF58;
  return sub_23A8BC47C();
}

uint64_t sub_23A8BCF58(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_QWORD *)(v3 + 112) = a1;
  *(_QWORD *)(v3 + 120) = v1;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23A8BCFC4()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23A8BD01C()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  id v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
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

  v1 = *(void **)(v0 + 88);
  if (!v1)
    goto LABEL_4;
  v2 = *(_QWORD *)(v0 + 32);
  v3 = v1;
  sub_23A8F0EC0();

  v4 = sub_23A8F0DAC();
  v5 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(v2, 1, v4);
  v6 = *(_QWORD *)(v0 + 32);
  if (v5)
  {
    sub_23A8C64C8(*(_QWORD *)(v0 + 32), &qword_2542D8D00);
LABEL_4:
    (*(void (**)(_QWORD, uint64_t, uint64_t, _QWORD))(*(_QWORD *)(v0 + 56) + 56))(*(_QWORD *)(v0 + 40), 1, 1, *(_QWORD *)(v0 + 48));
    v3 = v1;
LABEL_5:

    v7 = *(_QWORD *)(v0 + 40);
    swift_bridgeObjectRelease();
    sub_23A8C64C8(v7, qword_2569C84E8);
    v8 = 0;
    v9 = 0;
    v10 = 0;
    v11 = 0;
    v12 = 0;
    goto LABEL_6;
  }
  v15 = sub_23A8F0D70();
  sub_23A8C64C8(v6, &qword_2542D8D00);
  if (*(_QWORD *)(v15 + 16))
  {
    (*(void (**)(_QWORD, unint64_t, _QWORD))(*(_QWORD *)(v0 + 56) + 16))(*(_QWORD *)(v0 + 40), v15+ ((*(unsigned __int8 *)(*(_QWORD *)(v0 + 56) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v0 + 56) + 80)), *(_QWORD *)(v0 + 48));
    v16 = 0;
  }
  else
  {
    v16 = 1;
  }
  v17 = *(_QWORD *)(v0 + 48);
  v18 = *(_QWORD *)(v0 + 56);
  v19 = *(_QWORD *)(v0 + 40);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v18 + 56))(v19, v16, 1, v17);
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v18 + 48))(v19, 1, v17) == 1)
    goto LABEL_5;
  v20 = *(_QWORD *)(v0 + 112);
  v22 = *(_QWORD *)(v0 + 56);
  v21 = *(_QWORD *)(v0 + 64);
  v23 = *(_QWORD *)(v0 + 48);
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v22 + 32))(v21, *(_QWORD *)(v0 + 40), v23);
  v9 = sub_23A8F0D7C();
  v10 = v24;
  v11 = sub_23A8F0D88();
  v12 = v25;

  (*(void (**)(uint64_t, uint64_t))(v22 + 8))(v21, v23);
  if (v20)
    v8 = v20;
  else
    v8 = MEMORY[0x24BEE4AF8];
LABEL_6:
  v13 = *(_QWORD **)(v0 + 16);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  *v13 = v8;
  v13[1] = v9;
  v13[2] = v10;
  v13[3] = v11;
  v13[4] = v12;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23A8BD230()
{
  uint64_t v0;

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23A8BD288()
{
  _QWORD *v0;
  uint64_t v1;
  _QWORD *v2;

  __swift_instantiateConcreteTypeFromMangledName(qword_2569C8500);
  v0[2] = swift_task_alloc();
  v1 = sub_23A8F104C();
  v0[3] = v1;
  v0[4] = *(_QWORD *)(v1 - 8);
  v0[5] = swift_task_alloc();
  v0[6] = swift_task_alloc();
  v2 = (_QWORD *)swift_task_alloc();
  v0[7] = v2;
  *v2 = v0;
  v2[1] = sub_23A8BD328;
  return sub_23A8BC47C();
}

uint64_t sub_23A8BD328(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_QWORD *)(v3 + 64) = a1;
  swift_task_dealloc();
  if (!v1)
    return swift_task_switch();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(_QWORD))(v3 + 8))(0);
}

uint64_t sub_23A8BD3C8()
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
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t, uint64_t);

  v1 = *(_QWORD *)(v0 + 64);
  if (v1)
  {
    if (*(_QWORD *)(v1 + 16))
    {
      (*(void (**)(_QWORD, unint64_t, _QWORD))(*(_QWORD *)(v0 + 32) + 16))(*(_QWORD *)(v0 + 16), v1+ ((*(unsigned __int8 *)(*(_QWORD *)(v0 + 32) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v0 + 32) + 80)), *(_QWORD *)(v0 + 24));
      v2 = 0;
    }
    else
    {
      v2 = 1;
    }
    v3 = *(_QWORD *)(v0 + 24);
    v4 = *(_QWORD *)(v0 + 32);
    v5 = *(_QWORD *)(v0 + 16);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v4 + 56))(v5, v2, 1, v3);
    swift_bridgeObjectRelease();
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v4 + 48))(v5, 1, v3) == 1)
    {
      sub_23A8C64C8(*(_QWORD *)(v0 + 16), qword_2569C8500);
LABEL_10:
      v1 = 0;
      goto LABEL_11;
    }
    v6 = *(_QWORD *)(v0 + 40);
    v7 = *(_QWORD *)(v0 + 48);
    v8 = *(_QWORD *)(v0 + 24);
    v9 = *(_QWORD *)(v0 + 32);
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v9 + 32))(v7, *(_QWORD *)(v0 + 16), v8);
    v10 = sub_23A8F1040();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 16))(v6, v7, v8);
    v12 = *(_QWORD *)(v0 + 40);
    v11 = *(_QWORD *)(v0 + 48);
    v13 = *(_QWORD *)(v0 + 24);
    v14 = *(_QWORD *)(v0 + 32);
    if (v10 < 0)
    {
      v17 = *(void (**)(uint64_t, uint64_t))(v14 + 8);
      v17(*(_QWORD *)(v0 + 40), *(_QWORD *)(v0 + 24));
      v17(v11, v13);
      goto LABEL_10;
    }
    v15 = sub_23A8F1040();
    v16 = *(void (**)(uint64_t, uint64_t))(v14 + 8);
    v16(v12, v13);
    v16(v11, v13);
    v1 = v15 < 5;
  }
LABEL_11:
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v1);
}

uint64_t sub_23A8BD548()
{
  _QWORD *v0;
  uint64_t v1;
  _QWORD *v2;

  __swift_instantiateConcreteTypeFromMangledName(qword_2569C8500);
  v0[2] = swift_task_alloc();
  v1 = sub_23A8F104C();
  v0[3] = v1;
  v0[4] = *(_QWORD *)(v1 - 8);
  v0[5] = swift_task_alloc();
  v2 = (_QWORD *)swift_task_alloc();
  v0[6] = v2;
  *v2 = v0;
  v2[1] = sub_23A8BD5D8;
  return sub_23A8BC47C();
}

uint64_t sub_23A8BD5D8(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_QWORD *)(v3 + 56) = a1;
  swift_task_dealloc();
  if (!v1)
    return swift_task_switch();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(_QWORD))(v3 + 8))(0);
}

uint64_t sub_23A8BD664()
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

  v1 = *(_QWORD *)(v0 + 56);
  if (v1)
  {
    if (*(_QWORD *)(v1 + 16))
    {
      (*(void (**)(_QWORD, unint64_t, _QWORD))(*(_QWORD *)(v0 + 32) + 16))(*(_QWORD *)(v0 + 16), v1+ ((*(unsigned __int8 *)(*(_QWORD *)(v0 + 32) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v0 + 32) + 80)), *(_QWORD *)(v0 + 24));
      v2 = 0;
    }
    else
    {
      v2 = 1;
    }
    v3 = *(_QWORD *)(v0 + 24);
    v4 = *(_QWORD *)(v0 + 32);
    v5 = *(_QWORD *)(v0 + 16);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v4 + 56))(v5, v2, 1, v3);
    swift_bridgeObjectRelease();
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v4 + 48))(v5, 1, v3) == 1)
    {
      sub_23A8C64C8(*(_QWORD *)(v0 + 16), qword_2569C8500);
      v1 = 0;
    }
    else
    {
      v7 = *(_QWORD *)(v0 + 32);
      v6 = *(_QWORD *)(v0 + 40);
      v8 = *(_QWORD *)(v0 + 24);
      (*(void (**)(uint64_t, _QWORD, uint64_t))(v7 + 32))(v6, *(_QWORD *)(v0 + 16), v8);
      v9 = sub_23A8F1040();
      (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v6, v8);
      v1 = v9 == 999;
    }
  }
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v1);
}

uint64_t sub_23A8BD77C()
{
  _QWORD *v0;
  uint64_t v1;
  _QWORD *v2;

  __swift_instantiateConcreteTypeFromMangledName(qword_2569C8500);
  v0[2] = swift_task_alloc();
  v1 = sub_23A8F104C();
  v0[3] = v1;
  v0[4] = *(_QWORD *)(v1 - 8);
  v0[5] = swift_task_alloc();
  v2 = (_QWORD *)swift_task_alloc();
  v0[6] = v2;
  *v2 = v0;
  v2[1] = sub_23A8BD80C;
  return sub_23A8BC47C();
}

uint64_t sub_23A8BD80C(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_QWORD *)(v3 + 56) = a1;
  swift_task_dealloc();
  if (!v1)
    return swift_task_switch();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(_QWORD))(v3 + 8))(0);
}

uint64_t sub_23A8BD898()
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

  v1 = *(_QWORD *)(v0 + 56);
  if (v1)
  {
    if (*(_QWORD *)(v1 + 16))
    {
      (*(void (**)(_QWORD, unint64_t, _QWORD))(*(_QWORD *)(v0 + 32) + 16))(*(_QWORD *)(v0 + 16), v1+ ((*(unsigned __int8 *)(*(_QWORD *)(v0 + 32) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v0 + 32) + 80)), *(_QWORD *)(v0 + 24));
      v2 = 0;
    }
    else
    {
      v2 = 1;
    }
    v3 = *(_QWORD *)(v0 + 24);
    v4 = *(_QWORD *)(v0 + 32);
    v5 = *(_QWORD *)(v0 + 16);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v4 + 56))(v5, v2, 1, v3);
    swift_bridgeObjectRelease();
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v4 + 48))(v5, 1, v3) == 1)
    {
      sub_23A8C64C8(*(_QWORD *)(v0 + 16), qword_2569C8500);
      v1 = 0;
    }
    else
    {
      v7 = *(_QWORD *)(v0 + 32);
      v6 = *(_QWORD *)(v0 + 40);
      v8 = *(_QWORD *)(v0 + 24);
      (*(void (**)(uint64_t, _QWORD, uint64_t))(v7 + 32))(v6, *(_QWORD *)(v0 + 16), v8);
      v9 = sub_23A8F1040();
      (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v6, v8);
      v1 = v9 == 998;
    }
  }
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v1);
}

uint64_t sub_23A8BD9B0()
{
  _QWORD *v0;
  uint64_t v1;
  _QWORD *v2;

  __swift_instantiateConcreteTypeFromMangledName(qword_2569C8500);
  v0[2] = swift_task_alloc();
  v1 = sub_23A8F104C();
  v0[3] = v1;
  v0[4] = *(_QWORD *)(v1 - 8);
  v0[5] = swift_task_alloc();
  v2 = (_QWORD *)swift_task_alloc();
  v0[6] = v2;
  *v2 = v0;
  v2[1] = sub_23A8BDA40;
  return sub_23A8BC47C();
}

uint64_t sub_23A8BDA40(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_QWORD *)(v3 + 56) = a1;
  swift_task_dealloc();
  if (!v1)
    return swift_task_switch();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(_QWORD))(v3 + 8))(0);
}

uint64_t sub_23A8BDACC()
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

  v1 = *(_QWORD *)(v0 + 56);
  if (v1)
  {
    if (*(_QWORD *)(v1 + 16))
    {
      (*(void (**)(_QWORD, unint64_t, _QWORD))(*(_QWORD *)(v0 + 32) + 16))(*(_QWORD *)(v0 + 16), v1+ ((*(unsigned __int8 *)(*(_QWORD *)(v0 + 32) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v0 + 32) + 80)), *(_QWORD *)(v0 + 24));
      v2 = 0;
    }
    else
    {
      v2 = 1;
    }
    v3 = *(_QWORD *)(v0 + 24);
    v4 = *(_QWORD *)(v0 + 32);
    v5 = *(_QWORD *)(v0 + 16);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v4 + 56))(v5, v2, 1, v3);
    swift_bridgeObjectRelease();
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v4 + 48))(v5, 1, v3) == 1)
    {
      sub_23A8C64C8(*(_QWORD *)(v0 + 16), qword_2569C8500);
      v1 = 0;
    }
    else
    {
      v7 = *(_QWORD *)(v0 + 32);
      v6 = *(_QWORD *)(v0 + 40);
      v8 = *(_QWORD *)(v0 + 24);
      (*(void (**)(uint64_t, _QWORD, uint64_t))(v7 + 32))(v6, *(_QWORD *)(v0 + 16), v8);
      v9 = sub_23A8F1040();
      (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v6, v8);
      v1 = v9 == 997;
    }
  }
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v1);
}

uint64_t sub_23A8BDBE4()
{
  _QWORD *v0;
  uint64_t v1;
  _QWORD *v2;

  __swift_instantiateConcreteTypeFromMangledName(qword_2569C8500);
  v0[2] = swift_task_alloc();
  v1 = sub_23A8F104C();
  v0[3] = v1;
  v0[4] = *(_QWORD *)(v1 - 8);
  v0[5] = swift_task_alloc();
  v2 = (_QWORD *)swift_task_alloc();
  v0[6] = v2;
  *v2 = v0;
  v2[1] = sub_23A8BDC74;
  return sub_23A8BC47C();
}

uint64_t sub_23A8BDC74(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_QWORD *)(v3 + 56) = a1;
  swift_task_dealloc();
  if (!v1)
    return swift_task_switch();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(_QWORD))(v3 + 8))(0);
}

uint64_t sub_23A8BDD00()
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

  v1 = *(_QWORD *)(v0 + 56);
  if (v1)
  {
    if (*(_QWORD *)(v1 + 16))
    {
      (*(void (**)(_QWORD, unint64_t, _QWORD))(*(_QWORD *)(v0 + 32) + 16))(*(_QWORD *)(v0 + 16), v1+ ((*(unsigned __int8 *)(*(_QWORD *)(v0 + 32) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v0 + 32) + 80)), *(_QWORD *)(v0 + 24));
      v2 = 0;
    }
    else
    {
      v2 = 1;
    }
    v3 = *(_QWORD *)(v0 + 24);
    v4 = *(_QWORD *)(v0 + 32);
    v5 = *(_QWORD *)(v0 + 16);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v4 + 56))(v5, v2, 1, v3);
    swift_bridgeObjectRelease();
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v4 + 48))(v5, 1, v3) == 1)
    {
      sub_23A8C64C8(*(_QWORD *)(v0 + 16), qword_2569C8500);
      v1 = 0;
    }
    else
    {
      v7 = *(_QWORD *)(v0 + 32);
      v6 = *(_QWORD *)(v0 + 40);
      v8 = *(_QWORD *)(v0 + 24);
      (*(void (**)(uint64_t, _QWORD, uint64_t))(v7 + 32))(v6, *(_QWORD *)(v0 + 16), v8);
      v9 = sub_23A8F1040();
      (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v6, v8);
      v1 = v9 == 404;
    }
  }
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v1);
}

uint64_t sub_23A8BDE18(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;

  v2[5] = a1;
  v2[6] = v1;
  v3 = sub_23A8F10A0();
  v2[7] = v3;
  v2[8] = *(_QWORD *)(v3 - 8);
  v2[9] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23A8BDE78()
{
  uint64_t v0;
  id v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  int8x16_t *v6;
  _QWORD *v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _BYTE *v19;

  v1 = *(id *)(*(_QWORD *)(v0 + 48) + 16);
  v2 = sub_23A8F0F50();
  v4 = v3;

  swift_bridgeObjectRelease();
  v5 = HIBYTE(v4) & 0xF;
  if ((v4 & 0x2000000000000000) == 0)
    v5 = v2 & 0xFFFFFFFFFFFFLL;
  if (v5)
  {
    v6 = (int8x16_t *)swift_task_alloc();
    *(_QWORD *)(v0 + 80) = v6;
    v6[1] = vextq_s8(*(int8x16_t *)(v0 + 40), *(int8x16_t *)(v0 + 40), 8uLL);
    v7 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 88) = v7;
    *v7 = v0;
    v7[1] = sub_23A8BE0A8;
    return sub_23A8F1400();
  }
  else
  {
    if (qword_2542D8828 != -1)
      swift_once();
    v10 = *(_QWORD *)(v0 + 64);
    v9 = *(_QWORD *)(v0 + 72);
    v11 = *(_QWORD *)(v0 + 56);
    v12 = __swift_project_value_buffer(v11, (uint64_t)qword_2542D8DE0);
    swift_beginAccess();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 16))(v9, v12, v11);
    v13 = sub_23A8F1088();
    v14 = sub_23A8F1274();
    if (os_log_type_enabled(v13, v14))
    {
      v15 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_23A8AD000, v13, v14, "Failed to refresh peaks. Site ID is empty.", v15, 2u);
      MEMORY[0x23B85B51C](v15, -1, -1);
    }
    v17 = *(_QWORD *)(v0 + 64);
    v16 = *(_QWORD *)(v0 + 72);
    v18 = *(_QWORD *)(v0 + 56);

    (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v16, v18);
    sub_23A8C3D5C();
    swift_allocError();
    *v19 = 28;
    swift_willThrow();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_23A8BE0A8()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 96) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23A8BE114()
{
  uint64_t v0;

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23A8BE148()
{
  uint64_t v0;

  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23A8BE184(uint64_t a1, uint64_t a2, uint64_t a3)
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
  uint64_t v13;
  char *v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v23 = a3;
  v24 = a2;
  v4 = sub_23A8F0CA4();
  v5 = *(_QWORD *)(v4 - 8);
  v22 = v4;
  v6 = *(_QWORD *)(v5 + 64);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542D8D18);
  v9 = *(_QWORD *)(v8 - 8);
  v10 = *(_QWORD *)(v9 + 64);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542D8AC0);
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)&v21 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_23A8F1208();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56))(v14, 1, 1, v15);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a1, v8);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v23, v4);
  v16 = (*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  v17 = (v10 + v16 + 7) & 0xFFFFFFFFFFFFFFF8;
  v18 = (*(unsigned __int8 *)(v5 + 80) + v17 + 8) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  v19 = swift_allocObject();
  *(_QWORD *)(v19 + 16) = 0;
  *(_QWORD *)(v19 + 24) = 0;
  (*(void (**)(unint64_t, char *, uint64_t))(v9 + 32))(v19 + v16, v11, v8);
  *(_QWORD *)(v19 + v17) = v24;
  (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v19 + v18, v7, v22);
  swift_retain();
  sub_23A8DEC80((uint64_t)v14, (uint64_t)&unk_2569C87F0, v19);
  return swift_release();
}

uint64_t sub_23A8BE360(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;

  v6[16] = a5;
  v6[17] = a6;
  v6[15] = a4;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542D8D18);
  v6[18] = v7;
  v8 = *(_QWORD *)(v7 - 8);
  v6[19] = v8;
  v6[20] = *(_QWORD *)(v8 + 64);
  v6[21] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23A8BE3CC()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v1 = v0[21];
  v2 = v0[18];
  v3 = v0[19];
  v4 = v0[16];
  v5 = v0[15];
  type metadata accessor for HomeEnergyXPCConnection();
  swift_allocObject();
  v0[22] = sub_23A8EF888();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v1, v5, v2);
  v6 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v7 = swift_allocObject();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v3 + 32))(v7 + v6, v1, v2);
  v8 = (void *)sub_23A8EFE34((uint64_t)sub_23A8C68F0, v7);
  v0[23] = v8;
  swift_release();
  v9 = *(id *)(v4 + 16);
  sub_23A8F0F50();

  v10 = sub_23A8F1130();
  v0[24] = v10;
  swift_bridgeObjectRelease();
  v11 = sub_23A8F0C44();
  v0[25] = v11;
  v0[2] = v0;
  v0[3] = sub_23A8BE56C;
  v12 = swift_continuation_init();
  v0[10] = MEMORY[0x24BDAC760];
  v0[11] = 0x40000000;
  v0[12] = sub_23A8B7638;
  v0[13] = &block_descriptor_100;
  v0[14] = v12;
  objc_msgSend(v8, sel_refreshCurrentUtilityPeakPeriodsWithSiteID_start_completionHandler_, v10, v11, v0 + 10);
  return swift_continuation_await();
}

uint64_t sub_23A8BE56C()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)v0 + 208) = *(_QWORD *)(*(_QWORD *)v0 + 48);
  return swift_task_switch();
}

uint64_t sub_23A8BE5CC()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;

  v2 = *(void **)(v0 + 192);
  v1 = *(void **)(v0 + 200);
  v3 = *(_QWORD *)(v0 + 176);
  swift_unknownObjectRelease();

  objc_msgSend(*(id *)(v3 + 16), sel_invalidate);
  sub_23A8F11F0();
  swift_release();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23A8BE650()
{
  uint64_t v0;
  void *v1;
  void *v2;

  v1 = *(void **)(v0 + 200);
  v2 = *(void **)(v0 + 192);
  swift_willThrow();
  swift_release();
  swift_unknownObjectRelease();

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23A8BE6C4(void *a1, uint64_t a2, const char *a3, uint64_t *a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  id v13;
  id v14;
  NSObject *v15;
  os_log_type_t v16;
  uint64_t v17;
  uint8_t *v18;
  id v19;
  uint64_t v20;
  _QWORD *v21;
  id v22;
  _QWORD *v24;
  const char *v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;

  v8 = sub_23A8F10A0();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2542D8828 != -1)
    swift_once();
  v12 = __swift_project_value_buffer(v8, (uint64_t)qword_2542D8DE0);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, v12, v8);
  v13 = a1;
  v14 = a1;
  v15 = sub_23A8F1088();
  v16 = sub_23A8F1274();
  if (os_log_type_enabled(v15, v16))
  {
    v26 = a4;
    v17 = swift_slowAlloc();
    v27 = a2;
    v18 = (uint8_t *)v17;
    v24 = (_QWORD *)swift_slowAlloc();
    v25 = a3;
    *(_DWORD *)v18 = 138412290;
    v19 = a1;
    v20 = _swift_stdlib_bridgeErrorToNSError();
    v28 = v20;
    a4 = v26;
    sub_23A8F12A4();
    v21 = v24;
    *v24 = v20;

    _os_log_impl(&dword_23A8AD000, v15, v16, v25, v18, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(qword_2569C8410);
    swift_arrayDestroy();
    MEMORY[0x23B85B51C](v21, -1, -1);
    MEMORY[0x23B85B51C](v18, -1, -1);
  }
  else
  {

  }
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  v28 = (uint64_t)a1;
  v22 = a1;
  __swift_instantiateConcreteTypeFromMangledName(a4);
  return sub_23A8F11E4();
}

uint64_t EnergySite.deinit()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;

  sub_23A8F0DF4();
  v1 = (void *)sub_23A8F1130();
  swift_bridgeObjectRelease();
  v2 = *(_QWORD *)(v0 + 32);
  if (v2)
  {
    v3 = *(void **)(v0 + 24);
    swift_unknownObjectRetain_n();
    objc_msgSend(v3, sel_removeObserver_name_object_, v2, v1, 0);
    swift_unknownObjectRelease_n();
  }

  swift_unknownObjectRelease();
  sub_23A8C4688(v0 + 48);
  return v0;
}

uint64_t EnergySite.__deallocating_deinit()
{
  EnergySite.deinit();
  return swift_deallocClassInstance();
}

void sub_23A8BE9E0(unsigned __int8 *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  _QWORD v16[3];
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  char *v21;

  v16[0] = a2;
  v18 = a3;
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569C87E0);
  v4 = MEMORY[0x24BDAC7A8](v17);
  v6 = (char *)v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v16[2] = (char *)v16 - v7;
  v8 = sub_23A8F0D28();
  v9 = MEMORY[0x24BDAC7A8](v8);
  v10 = MEMORY[0x24BDAC7A8](v9);
  MEMORY[0x24BDAC7A8](v10);
  v21 = (char *)v16 - v11;
  v12 = sub_23A8F0CA4();
  v19 = *(_QWORD *)(v12 - 8);
  v13 = MEMORY[0x24BDAC7A8](v12);
  MEMORY[0x24BDAC7A8](v13);
  v20 = (char *)v16 - v14;
  v15 = (char *)&loc_23A8BEB44 + *((int *)qword_23A8BEDF8 + *a1);
  v16[1] = v6;
  __asm { BR              X10 }
}

uint64_t sub_23A8BEB60@<X0>(_DWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void (*v10)(uint64_t, uint64_t, uint64_t);
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, uint64_t, uint64_t);
  char v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, uint64_t, uint64_t);
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(uint64_t, uint64_t);
  uint64_t v28;
  uint64_t v29;

  v10 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 104);
  v11 = *(_QWORD *)(v8 - 88);
  v10(v11, *MEMORY[0x24BDCF220], v7);
  v12 = v11;
  v13 = v2;
  v14 = *(_QWORD *)(v8 - 96);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v4, v12, v7);
  v15 = (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 88))(v4, v7);
  if ((_DWORD)v15 == *a1 || (_DWORD)v15 == *MEMORY[0x24BDCF220])
    goto LABEL_3;
  if ((_DWORD)v15 == *MEMORY[0x24BDCF230])
  {
    sub_23A8F1028();
    sub_23A8F0C38();
    v14 = *(_QWORD *)(v8 - 96);
  }
  else
  {
    if ((_DWORD)v15 == *MEMORY[0x24BDCF1E8])
    {
LABEL_3:
      v10(v1, v15, v7);
      sub_23A8F1010();
      (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v1, v7);
      goto LABEL_4;
    }
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 104) + 16))(v14, v13, v6);
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v7);
  }
LABEL_4:
  v16 = *(_QWORD *)(v8 - 104);
  v17 = *(void (**)(uint64_t, uint64_t, uint64_t))(v16 + 16);
  v17(v3, v13, v6);
  sub_23A8C6A38((unint64_t *)&qword_2569C8538, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE948]);
  v18 = sub_23A8F1118();
  (*(void (**)(_QWORD, uint64_t))(v5 + 8))(*(_QWORD *)(v8 - 88), v7);
  if ((v18 & 1) == 0)
  {
    __break(1u);
    JUMPOUT(0x23A8BEDF8);
  }
  v20 = *(_QWORD *)(v8 - 128);
  v19 = *(_QWORD *)(v8 - 120);
  v21 = v20 + *(int *)(v19 + 48);
  v22 = v16;
  v23 = *(void (**)(uint64_t, uint64_t, uint64_t))(v16 + 32);
  v23(v20, v3, v6);
  v23(v21, v14, v6);
  v24 = *(_QWORD *)(v8 - 136);
  v25 = v24 + *(int *)(v19 + 48);
  v17(v24, v20, v6);
  v17(v25, v21, v6);
  v26 = *(_QWORD *)(v8 - 112);
  v23(v26, v24, v6);
  v27 = *(void (**)(uint64_t, uint64_t))(v22 + 8);
  v27(v25, v6);
  v28 = v24 + *(int *)(v19 + 48);
  v23(v24, v20, v6);
  v23(v28, v21, v6);
  v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569C8530);
  v23(v26 + *(int *)(v29 + 36), v28, v6);
  return ((uint64_t (*)(uint64_t, uint64_t))v27)(v24, v6);
}

uint64_t EnergySite.EnergyUsage.containsDate(_:displayInterval:in:)(uint64_t a1, unsigned __int8 *a2, uint64_t a3)
{
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
  char *v17;
  uint64_t v18;
  char *v19;
  unsigned __int8 v20;
  char v21;
  char v22;
  void (*v23)(char *, uint64_t);
  uint64_t v25;
  uint64_t v26;
  unsigned __int8 v27;

  v26 = a3;
  v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569C8530);
  v5 = MEMORY[0x24BDAC7A8](v25);
  v7 = (char *)&v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v25 - v8;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542D8CF8);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v25 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_23A8F0CA4();
  v14 = *(_QWORD *)(v13 - 8);
  v15 = MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v25 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v15);
  v19 = (char *)&v25 - v18;
  v20 = *a2;
  sub_23A8C6700(a1, (uint64_t)v12, &qword_2542D8CF8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13) == 1)
  {
    sub_23A8C64C8((uint64_t)v12, &qword_2542D8CF8);
    v21 = 0;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v19, v12, v13);
    v27 = v20;
    sub_23A8BE9E0(&v27, v26, (uint64_t)v9);
    sub_23A8C6A38((unint64_t *)&qword_2569C8538, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE948]);
    v22 = sub_23A8F1118();
    (*(void (**)(char *, char *, uint64_t))(v14 + 16))(v17, v19, v13);
    sub_23A8C6700((uint64_t)v9, (uint64_t)v7, &qword_2569C8530);
    if ((v22 & 1) != 0)
      v21 = sub_23A8F110C();
    else
      v21 = 0;
    sub_23A8C64C8((uint64_t)v7, &qword_2569C8530);
    v23 = *(void (**)(char *, uint64_t))(v14 + 8);
    v23(v17, v13);
    sub_23A8C64C8((uint64_t)v9, &qword_2569C8530);
    v23(v19, v13);
  }
  return v21 & 1;
}

uint64_t EnergySite.EnergyUsage.overlapsDateRange(_:displayInterval:in:)(uint64_t a1, unsigned __int8 *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  unsigned __int8 v16;
  char v17;
  uint64_t v19;
  unsigned __int8 v20;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569C8530);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569C8540);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569C8548);
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v19 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = *a2;
  sub_23A8C6700(a1, (uint64_t)v11, &qword_2569C8540);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12) == 1)
  {
    sub_23A8C64C8((uint64_t)v11, &qword_2569C8540);
    v17 = 0;
  }
  else
  {
    sub_23A8C7E20((uint64_t)v11, (uint64_t)v15, &qword_2569C8548);
    v20 = v16;
    sub_23A8BE9E0(&v20, a3, (uint64_t)v8);
    v17 = sub_23A8BF230((uint64_t)v15);
    sub_23A8C64C8((uint64_t)v8, &qword_2569C8530);
    sub_23A8C64C8((uint64_t)v15, &qword_2569C8548);
  }
  return v17 & 1;
}

uint64_t sub_23A8BF230(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  char v12;
  char v13;
  char v14;
  uint64_t v16;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569C8548);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569C8530);
  v7 = MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v16 - v10;
  sub_23A8F0CA4();
  sub_23A8C6A38((unint64_t *)&qword_2569C8538, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE948]);
  v12 = sub_23A8F110C();
  sub_23A8C6700(v1, (uint64_t)v11, &qword_2569C8530);
  sub_23A8C6700(a1, (uint64_t)v5, &qword_2569C8548);
  if ((v12 & 1) != 0)
  {
    sub_23A8C64C8((uint64_t)v5, &qword_2569C8548);
    sub_23A8C64C8((uint64_t)v11, &qword_2569C8530);
    sub_23A8C6700(v1, (uint64_t)v9, &qword_2569C8530);
    v13 = 0;
  }
  else
  {
    v14 = sub_23A8F1118();
    sub_23A8C64C8((uint64_t)v5, &qword_2569C8548);
    sub_23A8C64C8((uint64_t)v11, &qword_2569C8530);
    sub_23A8C6700(v1, (uint64_t)v9, &qword_2569C8530);
    if ((v14 & 1) != 0)
    {
      v13 = 0;
    }
    else
    {
      sub_23A8C6A38(&qword_2569C87B0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE958]);
      v13 = sub_23A8F1124() ^ 1;
    }
  }
  sub_23A8C64C8((uint64_t)v9, &qword_2569C8530);
  return v13 & 1;
}

uint64_t sub_23A8BF468(uint64_t result, _BYTE **a2)
{
  _BYTE *v2;

  v2 = *a2;
  *v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_23A8BF478(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_23A8BF4AC(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_23A8BF510;
  return v6(a1);
}

uint64_t sub_23A8BF510()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_23A8BF55C(void (*a1)(void))
{
  a1();
  return _swift_stdlib_bridgeErrorToNSError();
}

uint64_t sub_23A8BF57C(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_23A8BF59C(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_23A8BF5C4(a1, a2, a3, a4, &qword_2569C8848, type metadata accessor for EnergySite.EnergyUsage);
}

uint64_t sub_23A8BF5B0(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_23A8BF5C4(a1, a2, a3, a4, &qword_2569C87D8, (uint64_t (*)(_QWORD))MEMORY[0x24BDCE900]);
}

uint64_t sub_23A8BF5C4(char a1, int64_t a2, char a3, unint64_t a4, uint64_t *a5, uint64_t (*a6)(_QWORD))
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
  v13 = *(_QWORD *)(a6(0) - 8);
  v14 = *(_QWORD *)(v13 + 72);
  v15 = (*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  v16 = (_QWORD *)swift_allocObject();
  v17 = _swift_stdlib_malloc_size(v16);
  if (!v14 || (v17 - v15 == 0x8000000000000000 ? (v18 = v14 == -1) : (v18 = 0), v18))
  {
LABEL_29:
    result = sub_23A8F1394();
    __break(1u);
    return result;
  }
  v16[2] = v11;
  v16[3] = 2 * ((uint64_t)(v17 - v15) / v14);
LABEL_19:
  v19 = *(_QWORD *)(a6(0) - 8);
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
    sub_23A8C65E4(0, v11, v21, a4, a6);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v16;
}

uint64_t sub_23A8BF7D0(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t result;

  v6 = a4();
  sub_23A8BF840(v6, v7, a3);
  v8 = *a1 + 8;
  sub_23A8F12A4();
  result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t sub_23A8BF840(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_23A8BF910(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_23A8C44C0((uint64_t)v12, *a3);
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
      sub_23A8C44C0((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_23A8BF910(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_23A8F12B0();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_23A8BFAC8(a5, a6);
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
  v8 = sub_23A8F1340();
  if (!v8)
  {
    sub_23A8F1394();
    __break(1u);
LABEL_17:
    result = sub_23A8F13C4();
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

uint64_t sub_23A8BFAC8(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_23A8BFB5C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_23A8BFD34(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_23A8BFD34(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_23A8BFB5C(uint64_t a1, unint64_t a2)
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
      v3 = sub_23A8BFCD0(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_23A8F1334();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_23A8F1394();
      __break(1u);
LABEL_10:
      v2 = sub_23A8F1178();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_23A8F13C4();
    __break(1u);
LABEL_14:
    result = sub_23A8F1394();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_23A8BFCD0(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_2542D8AD8);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_23A8BFD34(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2542D8AD8);
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
  result = sub_23A8F13C4();
  __break(1u);
  return result;
}

_BYTE **sub_23A8BFE80(_BYTE **result, uint64_t a2, uint64_t a3, char a4)
{
  _BYTE *v4;

  v4 = *result;
  *v4 = a4;
  *result = v4 + 1;
  return result;
}

void sub_23A8BFE90(uint64_t *a1, _QWORD **a2, uint64_t a3, uint64_t (*a4)(void))
{
  void *v6;
  uint64_t v7;
  _QWORD *v8;

  v6 = (void *)a4();
  v7 = *a1 + 8;
  sub_23A8F12A4();
  *a1 = v7;
  v8 = *a2;
  if (*a2)
  {
    *v8 = v6;
    *a2 = v8 + 1;
  }
  else
  {

  }
}

unint64_t sub_23A8BFF40(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_23A8F12EC();
  return sub_23A8C0078(a1, v2);
}

unint64_t sub_23A8BFF70(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_23A8F146C();
  return sub_23A8C013C(a1, v2);
}

unint64_t sub_23A8BFFA8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_23A8F1478();
  sub_23A8F1160();
  v4 = sub_23A8F1490();
  return sub_23A8C01D8(a1, a2, v4);
}

unint64_t sub_23A8C000C(uint64_t a1)
{
  uint64_t v2;

  sub_23A8F0CA4();
  sub_23A8C6A38(&qword_2569C87A8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE930]);
  v2 = sub_23A8F1100();
  return sub_23A8C02B8(a1, v2);
}

unint64_t sub_23A8C0078(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v6;
  char v7;
  _BYTE v9[40];

  v3 = -1 << *(_BYTE *)(v2 + 32);
  v4 = a2 & ~v3;
  if (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0)
  {
    v6 = ~v3;
    do
    {
      sub_23A8C636C(*(_QWORD *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      v7 = MEMORY[0x23B85AF88](v9, a1);
      sub_23A8C63A8((uint64_t)v9);
      if ((v7 & 1) != 0)
        break;
      v4 = (v4 + 1) & v6;
    }
    while (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

unint64_t sub_23A8C013C(uint64_t a1, uint64_t a2)
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

unint64_t sub_23A8C01D8(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_23A8F13F4() & 1) == 0)
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
      while (!v14 && (sub_23A8F13F4() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_23A8C02B8(uint64_t a1, uint64_t a2)
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
  v5 = sub_23A8F0CA4();
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
      sub_23A8C6A38(&qword_2569C87B0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE958]);
      v14 = sub_23A8F1124();
      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
      if ((v14 & 1) != 0)
        break;
      v10 = (v10 + 1) & v11;
    }
    while (((*(_QWORD *)(v3 + 64 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0);
  }
  return v10;
}

uint64_t sub_23A8C03F8(uint64_t *a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v14;

  v3 = v2;
  v6 = *v2;
  v7 = sub_23A8F146C();
  v8 = -1 << *(_BYTE *)(v6 + 32);
  v9 = v7 & ~v8;
  if (((*(_QWORD *)(v6 + 56 + ((v9 >> 3) & 0xFFFFFFFFFFFFF8)) >> v9) & 1) == 0)
  {
LABEL_7:
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v14 = *v3;
    *v3 = 0x8000000000000000;
    sub_23A8C21AC(a2, v9, isUniquelyReferenced_nonNull_native);
    *v3 = v14;
    swift_bridgeObjectRelease();
    result = 1;
    goto LABEL_8;
  }
  v10 = *(_QWORD *)(v6 + 48);
  if (*(_QWORD *)(v10 + 8 * v9) != a2)
  {
    v11 = ~v8;
    do
    {
      v9 = (v9 + 1) & v11;
      if (((*(_QWORD *)(v6 + 56 + ((v9 >> 3) & 0xFFFFFFFFFFFFF8)) >> v9) & 1) == 0)
        goto LABEL_7;
    }
    while (*(_QWORD *)(v10 + 8 * v9) != a2);
  }
  result = 0;
LABEL_8:
  *a1 = a2;
  return result;
}

uint64_t sub_23A8C04F0(uint64_t a1, char *a2)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t);
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(_QWORD, _QWORD, _QWORD);
  uint64_t v19;
  void (*v20)(_QWORD, _QWORD, _QWORD);
  char v21;
  void (*v22)(char *, uint64_t);
  uint64_t v23;
  char isUniquelyReferenced_nonNull_native;
  char *v25;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;

  v3 = v2;
  v6 = sub_23A8F0CA4();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *v3;
  sub_23A8C6A38(&qword_2569C87A8, v11, MEMORY[0x24BDCE930]);
  swift_bridgeObjectRetain();
  v31 = a2;
  v12 = sub_23A8F1100();
  v13 = -1 << *(_BYTE *)(v10 + 32);
  v14 = v12 & ~v13;
  v15 = v10;
  v16 = v10 + 56;
  if (((*(_QWORD *)(v10 + 56 + ((v14 >> 3) & 0xFFFFFFFFFFFFF8)) >> v14) & 1) != 0)
  {
    v27 = v3;
    v28 = a1;
    v29 = ~v13;
    v30 = v7;
    v17 = *(_QWORD *)(v7 + 72);
    v18 = *(void (**)(_QWORD, _QWORD, _QWORD))(v7 + 16);
    while (1)
    {
      v19 = v15;
      v20 = v18;
      v18(v9, *(_QWORD *)(v15 + 48) + v17 * v14, v6);
      sub_23A8C6A38(&qword_2569C87B0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE958]);
      v21 = sub_23A8F1124();
      v22 = *(void (**)(char *, uint64_t))(v30 + 8);
      v22(v9, v6);
      if ((v21 & 1) != 0)
        break;
      v14 = (v14 + 1) & v29;
      v15 = v19;
      v18 = v20;
      if (((*(_QWORD *)(v16 + ((v14 >> 3) & 0xFFFFFFFFFFFFF8)) >> v14) & 1) == 0)
      {
        swift_bridgeObjectRelease();
        v3 = v27;
        a1 = v28;
        v23 = v30;
        goto LABEL_7;
      }
    }
    swift_bridgeObjectRelease();
    v22(v31, v6);
    v20(v28, *(_QWORD *)(*v27 + 48) + v17 * v14, v6);
    return 0;
  }
  else
  {
    swift_bridgeObjectRelease();
    v18 = *(void (**)(_QWORD, _QWORD, _QWORD))(v7 + 16);
    v23 = v7;
LABEL_7:
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v25 = v31;
    v18(v9, v31, v6);
    v32 = *v3;
    *v3 = 0x8000000000000000;
    sub_23A8C22CC((uint64_t)v9, v14, isUniquelyReferenced_nonNull_native);
    *v3 = v32;
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, char *, uint64_t))(v23 + 32))(a1, v25, v6);
    return 1;
  }
}

uint64_t sub_23A8C074C(uint64_t *a1, uint64_t a2, uint64_t a3)
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
  sub_23A8F1478();
  swift_bridgeObjectRetain();
  sub_23A8F1160();
  v8 = sub_23A8F1490();
  v9 = -1 << *(_BYTE *)(v7 + 32);
  v10 = v8 & ~v9;
  if (((*(_QWORD *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0)
  {
    v11 = *(_QWORD *)(v7 + 48);
    v12 = (_QWORD *)(v11 + 16 * v10);
    v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_23A8F13F4() & 1) != 0)
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
      if (v19 || (sub_23A8F13F4() & 1) != 0)
        goto LABEL_7;
    }
  }
  swift_bridgeObjectRelease();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v21 = *v3;
  *v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_23A8C24D0(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_23A8C08F8(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  int64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  int64_t v19;
  unint64_t v20;
  int64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  char v28;
  unint64_t v29;
  BOOL v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t *v34;
  char v35;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569C8850);
  result = sub_23A8F13AC();
  v7 = result;
  if (*(_QWORD *)(v5 + 16))
  {
    v35 = a2;
    v34 = v3;
    v8 = 0;
    v9 = (uint64_t *)(v5 + 64);
    v10 = 1 << *(_BYTE *)(v5 + 32);
    v32 = -1 << v10;
    v33 = v10;
    if (v10 < 64)
      v11 = ~(-1 << v10);
    else
      v11 = -1;
    v12 = v11 & *(_QWORD *)(v5 + 64);
    v13 = (unint64_t)(v10 + 63) >> 6;
    v14 = result + 64;
    while (1)
    {
      if (v12)
      {
        v17 = __clz(__rbit64(v12));
        v12 &= v12 - 1;
        v18 = v17 | (v8 << 6);
      }
      else
      {
        v19 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
LABEL_39:
          __break(1u);
LABEL_40:
          __break(1u);
          return result;
        }
        if (v19 >= v13)
          goto LABEL_31;
        v20 = v9[v19];
        ++v8;
        if (!v20)
        {
          v8 = v19 + 1;
          if (v19 + 1 >= v13)
            goto LABEL_31;
          v20 = v9[v8];
          if (!v20)
          {
            v21 = v19 + 2;
            if (v21 >= v13)
            {
LABEL_31:
              if ((v35 & 1) == 0)
              {
                result = swift_release();
                v3 = v34;
                goto LABEL_38;
              }
              if (v33 >= 64)
                bzero((void *)(v5 + 64), 8 * v13);
              else
                *v9 = v32;
              v3 = v34;
              *(_QWORD *)(v5 + 16) = 0;
              break;
            }
            v20 = v9[v21];
            if (!v20)
            {
              while (1)
              {
                v8 = v21 + 1;
                if (__OFADD__(v21, 1))
                  goto LABEL_40;
                if (v8 >= v13)
                  goto LABEL_31;
                v20 = v9[v8];
                ++v21;
                if (v20)
                  goto LABEL_21;
              }
            }
            v8 = v21;
          }
        }
LABEL_21:
        v12 = (v20 - 1) & v20;
        v18 = __clz(__rbit64(v20)) + (v8 << 6);
      }
      v22 = 8 * v18;
      v23 = *(_QWORD *)(*(_QWORD *)(v5 + 48) + v22);
      v24 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + v22);
      result = sub_23A8F146C();
      v25 = -1 << *(_BYTE *)(v7 + 32);
      v26 = result & ~v25;
      v27 = v26 >> 6;
      if (((-1 << v26) & ~*(_QWORD *)(v14 + 8 * (v26 >> 6))) != 0)
      {
        v15 = __clz(__rbit64((-1 << v26) & ~*(_QWORD *)(v14 + 8 * (v26 >> 6)))) | v26 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v28 = 0;
        v29 = (unint64_t)(63 - v25) >> 6;
        do
        {
          if (++v27 == v29 && (v28 & 1) != 0)
          {
            __break(1u);
            goto LABEL_39;
          }
          v30 = v27 == v29;
          if (v27 == v29)
            v27 = 0;
          v28 |= v30;
          v31 = *(_QWORD *)(v14 + 8 * v27);
        }
        while (v31 == -1);
        v15 = __clz(__rbit64(~v31)) + (v27 << 6);
      }
      *(_QWORD *)(v14 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
      v16 = 8 * v15;
      *(_QWORD *)(*(_QWORD *)(v7 + 48) + v16) = v23;
      *(_QWORD *)(*(_QWORD *)(v7 + 56) + v16) = v24;
      ++*(_QWORD *)(v7 + 16);
    }
  }
  result = swift_release();
LABEL_38:
  *v3 = v7;
  return result;
}

uint64_t sub_23A8C0BA0(uint64_t a1, int a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
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
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  int64_t v25;
  _QWORD *v26;
  unint64_t v27;
  int64_t v28;
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

  v3 = v2;
  v5 = sub_23A8F0E3C();
  v51 = *(_QWORD *)(v5 - 8);
  v52 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v50 = &v42[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v7 = sub_23A8F0CA4();
  v49 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v9 = &v42[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v10 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569C87C0);
  v11 = sub_23A8F13AC();
  v12 = v11;
  if (!*(_QWORD *)(v10 + 16))
    goto LABEL_41;
  v13 = 1 << *(_BYTE *)(v10 + 32);
  v14 = *(_QWORD *)(v10 + 64);
  v46 = (_QWORD *)(v10 + 64);
  if (v13 < 64)
    v15 = ~(-1 << v13);
  else
    v15 = -1;
  v16 = v15 & v14;
  v44 = v2;
  v45 = (unint64_t)(v13 + 63) >> 6;
  v17 = v11 + 64;
  v48 = v10;
  result = swift_retain();
  v19 = 0;
  v43 = a2;
  v20 = 16;
  if ((a2 & 1) != 0)
    v20 = 32;
  v47 = v20;
  v21 = v20;
  while (1)
  {
    if (v16)
    {
      v23 = __clz(__rbit64(v16));
      v16 &= v16 - 1;
      v24 = v23 | (v19 << 6);
      goto LABEL_24;
    }
    v25 = v19 + 1;
    if (__OFADD__(v19, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v25 >= v45)
      break;
    v26 = v46;
    v27 = v46[v25];
    ++v19;
    if (!v27)
    {
      v19 = v25 + 1;
      if (v25 + 1 >= v45)
        goto LABEL_34;
      v27 = v46[v19];
      if (!v27)
      {
        v28 = v25 + 2;
        if (v28 >= v45)
        {
LABEL_34:
          v40 = v48;
          swift_release();
          v3 = v44;
          if ((v43 & 1) == 0)
            goto LABEL_41;
          goto LABEL_37;
        }
        v27 = v46[v28];
        if (!v27)
        {
          while (1)
          {
            v19 = v28 + 1;
            if (__OFADD__(v28, 1))
              goto LABEL_43;
            if (v19 >= v45)
              goto LABEL_34;
            v27 = v46[v19];
            ++v28;
            if (v27)
              goto LABEL_23;
          }
        }
        v19 = v28;
      }
    }
LABEL_23:
    v16 = (v27 - 1) & v27;
    v24 = __clz(__rbit64(v27)) + (v19 << 6);
LABEL_24:
    v29 = v48;
    v30 = *(_QWORD *)(v49 + 72);
    (*(void (**)(_BYTE *, unint64_t, uint64_t))(v49 + v21))(v9, *(_QWORD *)(v48 + 48) + v30 * v24, v7);
    v31 = *(_QWORD *)(v29 + 56);
    v32 = *(_QWORD *)(v51 + 72);
    (*(void (**)(_BYTE *, unint64_t, uint64_t))(v51 + v21))(v50, v31 + v32 * v24, v52);
    sub_23A8C6A38(&qword_2569C87A8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE930]);
    result = sub_23A8F1100();
    v33 = -1 << *(_BYTE *)(v12 + 32);
    v34 = result & ~v33;
    v35 = v34 >> 6;
    if (((-1 << v34) & ~*(_QWORD *)(v17 + 8 * (v34 >> 6))) != 0)
    {
      v22 = __clz(__rbit64((-1 << v34) & ~*(_QWORD *)(v17 + 8 * (v34 >> 6)))) | v34 & 0x7FFFFFFFFFFFFFC0;
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
        v39 = *(_QWORD *)(v17 + 8 * v35);
      }
      while (v39 == -1);
      v22 = __clz(__rbit64(~v39)) + (v35 << 6);
    }
    *(_QWORD *)(v17 + ((v22 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v22;
    (*(void (**)(unint64_t, _BYTE *, uint64_t))(v49 + 32))(*(_QWORD *)(v12 + 48) + v30 * v22, v9, v7);
    result = (*(uint64_t (**)(unint64_t, _BYTE *, uint64_t))(v51 + 32))(*(_QWORD *)(v12 + 56) + v32 * v22, v50, v52);
    ++*(_QWORD *)(v12 + 16);
  }
  v40 = v48;
  swift_release();
  v3 = v44;
  v26 = v46;
  if ((v43 & 1) == 0)
    goto LABEL_41;
LABEL_37:
  v41 = 1 << *(_BYTE *)(v40 + 32);
  if (v41 >= 64)
    bzero(v26, ((unint64_t)(v41 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v26 = -1 << v41;
  *(_QWORD *)(v40 + 16) = 0;
LABEL_41:
  result = swift_release();
  *v3 = v12;
  return result;
}

uint64_t sub_23A8C0F98(uint64_t a1, char a2)
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
  unint64_t v14;
  _QWORD *v15;
  unint64_t v16;
  unint64_t v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  _OWORD *v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  char v28;
  unint64_t v29;
  BOOL v30;
  uint64_t v31;
  uint64_t v32;
  int64_t v33;
  _QWORD *v34;
  _OWORD v35[2];

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569C87C8);
  v6 = sub_23A8F13AC();
  v7 = v6;
  if (*(_QWORD *)(v5 + 16))
  {
    v8 = 1 << *(_BYTE *)(v5 + 32);
    v34 = (_QWORD *)(v5 + 64);
    if (v8 < 64)
      v9 = ~(-1 << v8);
    else
      v9 = -1;
    v10 = v9 & *(_QWORD *)(v5 + 64);
    v33 = (unint64_t)(v8 + 63) >> 6;
    v11 = v6 + 64;
    result = swift_retain();
    v13 = 0;
    while (1)
    {
      if (v10)
      {
        v16 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        v17 = v16 | (v13 << 6);
      }
      else
      {
        v18 = v13 + 1;
        if (__OFADD__(v13, 1))
        {
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          return result;
        }
        if (v18 >= v33)
          goto LABEL_34;
        v19 = v34[v18];
        ++v13;
        if (!v19)
        {
          v13 = v18 + 1;
          if (v18 + 1 >= v33)
            goto LABEL_34;
          v19 = v34[v13];
          if (!v19)
          {
            v20 = v18 + 2;
            if (v20 >= v33)
            {
LABEL_34:
              swift_release();
              v3 = v2;
              if ((a2 & 1) != 0)
              {
                v32 = 1 << *(_BYTE *)(v5 + 32);
                if (v32 >= 64)
                  bzero(v34, ((unint64_t)(v32 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v34 = -1 << v32;
                *(_QWORD *)(v5 + 16) = 0;
              }
              break;
            }
            v19 = v34[v20];
            if (!v19)
            {
              while (1)
              {
                v13 = v20 + 1;
                if (__OFADD__(v20, 1))
                  goto LABEL_41;
                if (v13 >= v33)
                  goto LABEL_34;
                v19 = v34[v13];
                ++v20;
                if (v19)
                  goto LABEL_21;
              }
            }
            v13 = v20;
          }
        }
LABEL_21:
        v10 = (v19 - 1) & v19;
        v17 = __clz(__rbit64(v19)) + (v13 << 6);
      }
      v21 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v17);
      v23 = *v21;
      v22 = v21[1];
      v24 = (_OWORD *)(*(_QWORD *)(v5 + 56) + 32 * v17);
      if ((a2 & 1) != 0)
      {
        sub_23A8C62C8(v24, v35);
      }
      else
      {
        sub_23A8C44C0((uint64_t)v24, (uint64_t)v35);
        swift_bridgeObjectRetain();
      }
      sub_23A8F1478();
      sub_23A8F1160();
      result = sub_23A8F1490();
      v25 = -1 << *(_BYTE *)(v7 + 32);
      v26 = result & ~v25;
      v27 = v26 >> 6;
      if (((-1 << v26) & ~*(_QWORD *)(v11 + 8 * (v26 >> 6))) != 0)
      {
        v14 = __clz(__rbit64((-1 << v26) & ~*(_QWORD *)(v11 + 8 * (v26 >> 6)))) | v26 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v28 = 0;
        v29 = (unint64_t)(63 - v25) >> 6;
        do
        {
          if (++v27 == v29 && (v28 & 1) != 0)
          {
            __break(1u);
            goto LABEL_40;
          }
          v30 = v27 == v29;
          if (v27 == v29)
            v27 = 0;
          v28 |= v30;
          v31 = *(_QWORD *)(v11 + 8 * v27);
        }
        while (v31 == -1);
        v14 = __clz(__rbit64(~v31)) + (v27 << 6);
      }
      *(_QWORD *)(v11 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
      v15 = (_QWORD *)(*(_QWORD *)(v7 + 48) + 16 * v14);
      *v15 = v23;
      v15[1] = v22;
      result = (uint64_t)sub_23A8C62C8(v35, (_OWORD *)(*(_QWORD *)(v7 + 56) + 32 * v14));
      ++*(_QWORD *)(v7 + 16);
    }
  }
  result = swift_release();
  *v3 = v7;
  return result;
}

void *sub_23A8C1294()
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
  int64_t v18;
  unint64_t v19;
  int64_t v20;
  unint64_t v21;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569C8850);
  v2 = *v0;
  v3 = sub_23A8F13A0();
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
    v18 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v18 >= v13)
      goto LABEL_26;
    v19 = *(_QWORD *)(v6 + 8 * v18);
    ++v9;
    if (!v19)
    {
      v9 = v18 + 1;
      if (v18 + 1 >= v13)
        goto LABEL_26;
      v19 = *(_QWORD *)(v6 + 8 * v9);
      if (!v19)
        break;
    }
LABEL_25:
    v21 = __clz(__rbit64(v19));
    v12 = (v19 - 1) & v19;
    v15 = v21 + (v9 << 6);
LABEL_12:
    v16 = 8 * v15;
    v17 = *(_QWORD *)(*(_QWORD *)(v2 + 56) + v16);
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + v16) = *(_QWORD *)(*(_QWORD *)(v2 + 48) + v16);
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v16) = v17;
  }
  v20 = v18 + 2;
  if (v20 >= v13)
    goto LABEL_26;
  v19 = *(_QWORD *)(v6 + 8 * v20);
  if (v19)
  {
    v9 = v20;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v20 + 1;
    if (__OFADD__(v20, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v19 = *(_QWORD *)(v6 + 8 * v9);
    ++v20;
    if (v19)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

char *sub_23A8C1420()
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

  v41 = sub_23A8F0E3C();
  v37 = *(_QWORD *)(v41 - 8);
  MEMORY[0x24BDAC7A8](v41);
  v40 = (char *)&v33 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v39 = sub_23A8F0CA4();
  v36 = *(_QWORD *)(v39 - 8);
  MEMORY[0x24BDAC7A8](v39);
  v38 = (char *)&v33 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569C87C0);
  v33 = v0;
  v3 = *v0;
  v4 = sub_23A8F13A0();
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

void *sub_23A8C1700()
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
  _QWORD *v21;
  int64_t v22;
  unint64_t v23;
  int64_t v24;
  uint64_t *v25;
  _OWORD v26[2];

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569C87C8);
  v2 = *v0;
  v3 = sub_23A8F13A0();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
    result = (void *)swift_release();
LABEL_28:
    *v1 = v4;
    return result;
  }
  v25 = v1;
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
    v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v22 >= v13)
      goto LABEL_26;
    v23 = *(_QWORD *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      v9 = v22 + 1;
      if (v22 + 1 >= v13)
        goto LABEL_26;
      v23 = *(_QWORD *)(v6 + 8 * v9);
      if (!v23)
        break;
    }
LABEL_25:
    v12 = (v23 - 1) & v23;
    v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v19 = *v17;
    v18 = v17[1];
    v20 = 32 * v15;
    sub_23A8C44C0(*(_QWORD *)(v2 + 56) + 32 * v15, (uint64_t)v26);
    v21 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v21 = v19;
    v21[1] = v18;
    sub_23A8C62C8(v26, (_OWORD *)(*(_QWORD *)(v4 + 56) + v20));
    result = (void *)swift_bridgeObjectRetain();
  }
  v24 = v22 + 2;
  if (v24 >= v13)
  {
LABEL_26:
    result = (void *)swift_release();
    v1 = v25;
    goto LABEL_28;
  }
  v23 = *(_QWORD *)(v6 + 8 * v24);
  if (v23)
  {
    v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v24 + 1;
    if (__OFADD__(v24, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v23 = *(_QWORD *)(v6 + 8 * v9);
    ++v24;
    if (v23)
      goto LABEL_25;
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_23A8C18E4()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  int64_t v5;
  uint64_t *v6;
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
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  char v22;
  unint64_t v23;
  BOOL v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569C8858);
  result = sub_23A8F131C();
  v4 = result;
  if (*(_QWORD *)(v2 + 16))
  {
    v5 = 0;
    v6 = (uint64_t *)(v2 + 56);
    v7 = 1 << *(_BYTE *)(v2 + 32);
    v26 = -1 << v7;
    v27 = v1;
    if (v7 < 64)
      v8 = ~(-1 << v7);
    else
      v8 = -1;
    v9 = v8 & *(_QWORD *)(v2 + 56);
    v28 = 1 << *(_BYTE *)(v2 + 32);
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
                if (v28 >= 64)
                  bzero((void *)(v2 + 56), 8 * v10);
                else
                  *v6 = v26;
                v1 = v27;
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
      v18 = *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v14);
      result = sub_23A8F146C();
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
      *(_QWORD *)(*(_QWORD *)(v4 + 48) + 8 * v12) = v18;
      ++*(_QWORD *)(v4 + 16);
    }
  }
  result = swift_release();
  *v1 = v4;
  return result;
}

uint64_t sub_23A8C1B64()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t result;
  int64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(char *, unint64_t, uint64_t);
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  char v28;
  unint64_t v29;
  BOOL v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t *v33;
  int64_t v34;
  _QWORD *v35;
  uint64_t v36;

  v1 = v0;
  v2 = sub_23A8F0CA4();
  v36 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v33 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569C87B8);
  v6 = sub_23A8F131C();
  v7 = v6;
  if (*(_QWORD *)(v5 + 16))
  {
    v8 = 1 << *(_BYTE *)(v5 + 32);
    v9 = *(_QWORD *)(v5 + 56);
    v35 = (_QWORD *)(v5 + 56);
    if (v8 < 64)
      v10 = ~(-1 << v8);
    else
      v10 = -1;
    v11 = v10 & v9;
    v33 = v0;
    v34 = (unint64_t)(v8 + 63) >> 6;
    v12 = v6 + 56;
    result = swift_retain();
    v14 = 0;
    while (1)
    {
      if (v11)
      {
        v16 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        v17 = v16 | (v14 << 6);
      }
      else
      {
        v18 = v14 + 1;
        if (__OFADD__(v14, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v18 >= v34)
          goto LABEL_33;
        v19 = v35[v18];
        ++v14;
        if (!v19)
        {
          v14 = v18 + 1;
          if (v18 + 1 >= v34)
            goto LABEL_33;
          v19 = v35[v14];
          if (!v19)
          {
            v14 = v18 + 2;
            if (v18 + 2 >= v34)
              goto LABEL_33;
            v19 = v35[v14];
            if (!v19)
            {
              v20 = v18 + 3;
              if (v20 >= v34)
              {
LABEL_33:
                swift_release();
                v1 = v33;
                v32 = 1 << *(_BYTE *)(v5 + 32);
                if (v32 > 63)
                  bzero(v35, ((unint64_t)(v32 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v35 = -1 << v32;
                *(_QWORD *)(v5 + 16) = 0;
                break;
              }
              v19 = v35[v20];
              if (!v19)
              {
                while (1)
                {
                  v14 = v20 + 1;
                  if (__OFADD__(v20, 1))
                    goto LABEL_39;
                  if (v14 >= v34)
                    goto LABEL_33;
                  v19 = v35[v14];
                  ++v20;
                  if (v19)
                    goto LABEL_23;
                }
              }
              v14 = v20;
            }
          }
        }
LABEL_23:
        v11 = (v19 - 1) & v19;
        v17 = __clz(__rbit64(v19)) + (v14 << 6);
      }
      v21 = v5;
      v22 = *(_QWORD *)(v5 + 48);
      v23 = *(_QWORD *)(v36 + 72);
      v24 = *(void (**)(char *, unint64_t, uint64_t))(v36 + 32);
      v24(v4, v22 + v23 * v17, v2);
      sub_23A8C6A38(&qword_2569C87A8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE930]);
      result = sub_23A8F1100();
      v25 = -1 << *(_BYTE *)(v7 + 32);
      v26 = result & ~v25;
      v27 = v26 >> 6;
      if (((-1 << v26) & ~*(_QWORD *)(v12 + 8 * (v26 >> 6))) != 0)
      {
        v15 = __clz(__rbit64((-1 << v26) & ~*(_QWORD *)(v12 + 8 * (v26 >> 6)))) | v26 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v28 = 0;
        v29 = (unint64_t)(63 - v25) >> 6;
        do
        {
          if (++v27 == v29 && (v28 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          v30 = v27 == v29;
          if (v27 == v29)
            v27 = 0;
          v28 |= v30;
          v31 = *(_QWORD *)(v12 + 8 * v27);
        }
        while (v31 == -1);
        v15 = __clz(__rbit64(~v31)) + (v27 << 6);
      }
      *(_QWORD *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
      result = ((uint64_t (*)(unint64_t, char *, uint64_t))v24)(*(_QWORD *)(v7 + 48) + v15 * v23, v4, v2);
      ++*(_QWORD *)(v7 + 16);
      v5 = v21;
    }
  }
  result = swift_release();
  *v1 = v7;
  return result;
}

uint64_t sub_23A8C1ED0()
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569C8780);
  v3 = sub_23A8F131C();
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
      sub_23A8F1478();
      sub_23A8F1160();
      result = sub_23A8F1490();
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

uint64_t sub_23A8C21AC(uint64_t result, unint64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;

  v5 = result;
  v6 = *(_QWORD *)(*v3 + 16);
  v7 = *(_QWORD *)(*v3 + 24);
  if (v7 > v6 && (a3 & 1) != 0)
    goto LABEL_14;
  if ((a3 & 1) != 0)
  {
    sub_23A8C18E4();
  }
  else
  {
    if (v7 > v6)
    {
      result = (uint64_t)sub_23A8C2668();
      goto LABEL_14;
    }
    sub_23A8C2BD0();
  }
  v8 = *v3;
  result = sub_23A8F146C();
  v9 = -1 << *(_BYTE *)(v8 + 32);
  a2 = result & ~v9;
  if (((*(_QWORD *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0)
  {
    v10 = *(_QWORD *)(v8 + 48);
    if (*(_QWORD *)(v10 + 8 * a2) == v5)
    {
LABEL_13:
      result = sub_23A8F1418();
      __break(1u);
    }
    else
    {
      v11 = ~v9;
      while (1)
      {
        a2 = (a2 + 1) & v11;
        if (((*(_QWORD *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) == 0)
          break;
        if (*(_QWORD *)(v10 + 8 * a2) == v5)
          goto LABEL_13;
      }
    }
  }
LABEL_14:
  v12 = *v3;
  *(_QWORD *)(*v3 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(_QWORD *)(*(_QWORD *)(v12 + 48) + 8 * a2) = v5;
  v13 = *(_QWORD *)(v12 + 16);
  v14 = __OFADD__(v13, 1);
  v15 = v13 + 1;
  if (v14)
    __break(1u);
  else
    *(_QWORD *)(v12 + 16) = v15;
  return result;
}

uint64_t sub_23A8C22CC(uint64_t a1, unint64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(char *, unint64_t, uint64_t);
  char v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t result;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;

  v26 = a1;
  v6 = sub_23A8F0CA4();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *(_QWORD *)(*v3 + 16);
  v11 = *(_QWORD *)(*v3 + 24);
  v25 = v3;
  if (v11 > v10 && (a3 & 1) != 0)
    goto LABEL_12;
  if ((a3 & 1) != 0)
  {
    sub_23A8C1B64();
  }
  else
  {
    if (v11 > v10)
    {
      sub_23A8C27FC();
      goto LABEL_12;
    }
    sub_23A8C2E30();
  }
  v12 = *v3;
  sub_23A8C6A38(&qword_2569C87A8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE930]);
  v13 = sub_23A8F1100();
  v14 = -1 << *(_BYTE *)(v12 + 32);
  a2 = v13 & ~v14;
  if (((*(_QWORD *)(v12 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0)
  {
    v15 = ~v14;
    v16 = *(_QWORD *)(v7 + 72);
    v17 = *(void (**)(char *, unint64_t, uint64_t))(v7 + 16);
    do
    {
      v17(v9, *(_QWORD *)(v12 + 48) + v16 * a2, v6);
      sub_23A8C6A38(&qword_2569C87B0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE958]);
      v18 = sub_23A8F1124();
      (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
      if ((v18 & 1) != 0)
        goto LABEL_15;
      a2 = (a2 + 1) & v15;
    }
    while (((*(_QWORD *)(v12 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0);
  }
LABEL_12:
  v19 = v26;
  v20 = *v25;
  *(_QWORD *)(*v25 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v7 + 32))(*(_QWORD *)(v20 + 48) + *(_QWORD *)(v7 + 72) * a2, v19, v6);
  v22 = *(_QWORD *)(v20 + 16);
  v23 = __OFADD__(v22, 1);
  v24 = v22 + 1;
  if (!v23)
  {
    *(_QWORD *)(v20 + 16) = v24;
    return result;
  }
  __break(1u);
LABEL_15:
  result = sub_23A8F1418();
  __break(1u);
  return result;
}

uint64_t sub_23A8C24D0(uint64_t result, uint64_t a2, unint64_t a3, char a4)
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
    sub_23A8C1ED0();
  }
  else
  {
    if (v10 > v9)
    {
      result = (uint64_t)sub_23A8C2A20();
      goto LABEL_22;
    }
    sub_23A8C3158();
  }
  v11 = *v4;
  sub_23A8F1478();
  sub_23A8F1160();
  result = sub_23A8F1490();
  v12 = -1 << *(_BYTE *)(v11 + 32);
  a3 = result & ~v12;
  v13 = v11 + 56;
  if (((*(_QWORD *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8)) >> a3) & 1) != 0)
  {
    v14 = *(_QWORD *)(v11 + 48);
    v15 = (_QWORD *)(v14 + 16 * a3);
    v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (result = sub_23A8F13F4(), (result & 1) != 0))
    {
LABEL_21:
      result = sub_23A8F1418();
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
          result = sub_23A8F13F4();
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

void *sub_23A8C2668()
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569C8858);
  v2 = *v0;
  v3 = sub_23A8F1310();
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
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + 8 * v15) = *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v15);
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

void *sub_23A8C27FC()
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
  v2 = sub_23A8F0CA4();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569C87B8);
  v6 = *v0;
  v7 = sub_23A8F1310();
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
    (*(void (**)(char *, unint64_t, uint64_t))(v3 + 16))(v5, *(_QWORD *)(v6 + 48) + v20, v2);
    result = (void *)(*(uint64_t (**)(unint64_t, char *, uint64_t))(v3 + 32))(*(_QWORD *)(v8 + 48) + v20, v5, v2);
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

void *sub_23A8C2A20()
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569C8780);
  v2 = *v0;
  v3 = sub_23A8F1310();
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

uint64_t sub_23A8C2BD0()
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
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  char v22;
  unint64_t v23;
  BOOL v24;
  uint64_t v25;
  uint64_t *v26;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569C8858);
  result = sub_23A8F131C();
  v4 = result;
  if (!*(_QWORD *)(v2 + 16))
  {
    result = swift_release();
LABEL_35:
    *v1 = v4;
    return result;
  }
  v26 = v1;
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
    v18 = *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v14);
    result = sub_23A8F146C();
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
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + 8 * v12) = v18;
    ++*(_QWORD *)(v4 + 16);
  }
  v17 = v15 + 3;
  if (v17 >= v10)
  {
LABEL_33:
    result = swift_release();
    v1 = v26;
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

uint64_t sub_23A8C2E30()
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
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t result;
  int64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  int64_t v19;
  unint64_t v20;
  int64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  char v26;
  unint64_t v27;
  BOOL v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  int64_t v33;

  v1 = v0;
  v2 = sub_23A8F0CA4();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v30 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569C87B8);
  v7 = sub_23A8F131C();
  v8 = v7;
  if (!*(_QWORD *)(v6 + 16))
  {
    result = swift_release();
LABEL_35:
    *v1 = v8;
    return result;
  }
  v9 = 1 << *(_BYTE *)(v6 + 32);
  v10 = *(_QWORD *)(v6 + 56);
  v31 = v0;
  v32 = v6 + 56;
  if (v9 < 64)
    v11 = ~(-1 << v9);
  else
    v11 = -1;
  v12 = v11 & v10;
  v33 = (unint64_t)(v9 + 63) >> 6;
  v13 = v7 + 56;
  result = swift_retain();
  v15 = 0;
  while (1)
  {
    if (v12)
    {
      v17 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v18 = v17 | (v15 << 6);
      goto LABEL_24;
    }
    v19 = v15 + 1;
    if (__OFADD__(v15, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v19 >= v33)
      goto LABEL_33;
    v20 = *(_QWORD *)(v32 + 8 * v19);
    ++v15;
    if (!v20)
    {
      v15 = v19 + 1;
      if (v19 + 1 >= v33)
        goto LABEL_33;
      v20 = *(_QWORD *)(v32 + 8 * v15);
      if (!v20)
      {
        v15 = v19 + 2;
        if (v19 + 2 >= v33)
          goto LABEL_33;
        v20 = *(_QWORD *)(v32 + 8 * v15);
        if (!v20)
          break;
      }
    }
LABEL_23:
    v12 = (v20 - 1) & v20;
    v18 = __clz(__rbit64(v20)) + (v15 << 6);
LABEL_24:
    v22 = *(_QWORD *)(v3 + 72);
    (*(void (**)(char *, unint64_t, uint64_t))(v3 + 16))(v5, *(_QWORD *)(v6 + 48) + v22 * v18, v2);
    sub_23A8C6A38(&qword_2569C87A8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE930]);
    result = sub_23A8F1100();
    v23 = -1 << *(_BYTE *)(v8 + 32);
    v24 = result & ~v23;
    v25 = v24 >> 6;
    if (((-1 << v24) & ~*(_QWORD *)(v13 + 8 * (v24 >> 6))) != 0)
    {
      v16 = __clz(__rbit64((-1 << v24) & ~*(_QWORD *)(v13 + 8 * (v24 >> 6)))) | v24 & 0x7FFFFFFFFFFFFFC0;
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
        v29 = *(_QWORD *)(v13 + 8 * v25);
      }
      while (v29 == -1);
      v16 = __clz(__rbit64(~v29)) + (v25 << 6);
    }
    *(_QWORD *)(v13 + ((v16 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v16;
    result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v3 + 32))(*(_QWORD *)(v8 + 48) + v16 * v22, v5, v2);
    ++*(_QWORD *)(v8 + 16);
  }
  v21 = v19 + 3;
  if (v21 >= v33)
  {
LABEL_33:
    result = swift_release_n();
    v1 = v31;
    goto LABEL_35;
  }
  v20 = *(_QWORD *)(v32 + 8 * v21);
  if (v20)
  {
    v15 = v21;
    goto LABEL_23;
  }
  while (1)
  {
    v15 = v21 + 1;
    if (__OFADD__(v21, 1))
      break;
    if (v15 >= v33)
      goto LABEL_33;
    v20 = *(_QWORD *)(v32 + 8 * v15);
    ++v21;
    if (v20)
      goto LABEL_23;
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_23A8C3158()
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569C8780);
  v3 = sub_23A8F131C();
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
    sub_23A8F1478();
    swift_bridgeObjectRetain();
    sub_23A8F1160();
    result = sub_23A8F1490();
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

_QWORD *sub_23A8C3404(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
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
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  objc_class *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void (*v35)(char *, uint64_t, uint64_t, uint64_t);
  id v36;
  void *v37;
  _QWORD *v38;
  void *v39;
  id v40;
  _QWORD v42[7];
  char *v43;
  char *v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;

  v42[5] = a3;
  v42[6] = a4;
  v46 = a1;
  v47 = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2542D8CF8);
  v4 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v45 = (char *)v42 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v44 = (char *)v42 - v7;
  v8 = MEMORY[0x24BDAC7A8](v6);
  v43 = (char *)v42 - v9;
  v10 = MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)v42 - v11;
  v13 = MEMORY[0x24BDAC7A8](v10);
  v15 = (char *)v42 - v14;
  v16 = MEMORY[0x24BDAC7A8](v13);
  v18 = (char *)v42 - v17;
  v19 = MEMORY[0x24BDAC7A8](v16);
  v21 = (char *)v42 - v20;
  v42[0] = (char *)v42 - v20;
  v22 = MEMORY[0x24BDAC7A8](v19);
  v24 = (char *)v42 - v23;
  v42[1] = (char *)v42 - v23;
  MEMORY[0x24BDAC7A8](v22);
  v26 = (char *)v42 - v25;
  v42[2] = (char *)v42 - v25;
  v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542D8D00);
  MEMORY[0x24BDAC7A8](v27);
  v29 = (char *)v42 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  v30 = (objc_class *)sub_23A8F0FA4();
  v31 = sub_23A8F0EFC();
  v42[3] = v32;
  v42[4] = v31;
  v33 = sub_23A8F0DAC();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v33 - 8) + 56))(v29, 1, 1, v33);
  v34 = sub_23A8F0CA4();
  v35 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v34 - 8) + 56);
  v35(v26, 1, 1, v34);
  v35(v24, 1, 1, v34);
  v35(v21, 1, 1, v34);
  v35(v18, 1, 1, v34);
  v35(v15, 1, 1, v34);
  v35(v12, 1, 1, v34);
  v35(v43, 1, 1, v34);
  v35(v44, 1, 1, v34);
  v35(v45, 1, 1, v34);
  v36 = objc_allocWithZone(v30);
  v37 = (void *)sub_23A8F0F44();
  type metadata accessor for EnergySite();
  v38 = (_QWORD *)swift_allocObject();
  v38[3] = objc_msgSend((id)objc_opt_self(), sel_defaultCenter);
  v38[4] = 0;
  v38[5] = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD1710]), sel_init);
  v38[7] = 0;
  swift_unknownObjectWeakInit();
  v38[2] = v37;
  v39 = (void *)v38[5];
  v40 = v37;
  objc_msgSend(v39, sel_setMaxConcurrentOperationCount_, 1);
  sub_23A8B6818();

  return v38;
}

uint64_t sub_23A8C3804(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;

  v2[6] = a1;
  v2[7] = a2;
  v3 = sub_23A8F10A0();
  v2[8] = v3;
  v2[9] = *(_QWORD *)(v3 - 8);
  v2[10] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23A8C3864()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _BYTE *v17;

  v2 = *(_QWORD *)(v0 + 48);
  v1 = *(_QWORD *)(v0 + 56);
  v3 = HIBYTE(v1) & 0xF;
  if ((v1 & 0x2000000000000000) == 0)
    v3 = v2 & 0xFFFFFFFFFFFFLL;
  if (v3)
  {
    v4 = swift_task_alloc();
    *(_QWORD *)(v0 + 88) = v4;
    *(_QWORD *)(v4 + 16) = v2;
    *(_QWORD *)(v4 + 24) = v1;
    v5 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 96) = v5;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2542D8D08);
    *v5 = v0;
    v5[1] = sub_23A8C3A80;
    return sub_23A8F1400();
  }
  else
  {
    if (qword_2542D8828 != -1)
      swift_once();
    v8 = *(_QWORD *)(v0 + 72);
    v7 = *(_QWORD *)(v0 + 80);
    v9 = *(_QWORD *)(v0 + 64);
    v10 = __swift_project_value_buffer(v9, (uint64_t)qword_2542D8DE0);
    swift_beginAccess();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16))(v7, v10, v9);
    v11 = sub_23A8F1088();
    v12 = sub_23A8F1274();
    if (os_log_type_enabled(v11, v12))
    {
      v13 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_23A8AD000, v11, v12, "Failed to get site. Site ID is empty.", v13, 2u);
      MEMORY[0x23B85B51C](v13, -1, -1);
    }
    v15 = *(_QWORD *)(v0 + 72);
    v14 = *(_QWORD *)(v0 + 80);
    v16 = *(_QWORD *)(v0 + 64);

    (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v14, v16);
    sub_23A8C3D5C();
    swift_allocError();
    *v17 = 28;
    swift_willThrow();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_23A8C3A80()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 104) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23A8C3AEC()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 40);
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v1);
}

uint64_t sub_23A8C3B28(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = a2;
  return swift_task_switch();
}

uint64_t sub_23A8C3B40()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  v1 = *(_QWORD *)(v0 + 24);
  v2 = *(_QWORD *)(v0 + 16) & 0xFFFFFFFFFFFFLL;
  if ((v1 & 0x2000000000000000) != 0)
    v2 = HIBYTE(v1) & 0xF;
  if (v2)
  {
    v3 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 32) = v3;
    *v3 = v0;
    v3[1] = sub_23A8C3BC0;
    return sub_23A8C3804(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
  }
  else
  {
    swift_bridgeObjectRelease();
    return (*(uint64_t (**)(_QWORD))(v0 + 8))(0);
  }
}

uint64_t sub_23A8C3BC0(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_QWORD *)(v3 + 40) = a1;
  *(_QWORD *)(v3 + 48) = v1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  return swift_task_switch();
}

uint64_t sub_23A8C3C34()
{
  uint64_t v0;
  void *v1;
  _QWORD *v2;
  void *v3;
  id v4;

  v1 = *(void **)(v0 + 40);
  if (v1)
  {
    type metadata accessor for EnergySite();
    v2 = (_QWORD *)swift_allocObject();
    v2[3] = objc_msgSend((id)objc_opt_self(), sel_defaultCenter);
    v2[4] = 0;
    v2[5] = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD1710]), sel_init);
    v2[7] = 0;
    swift_unknownObjectWeakInit();
    v2[2] = v1;
    v3 = (void *)v2[5];
    v4 = v1;
    objc_msgSend(v3, sel_setMaxConcurrentOperationCount_, 1);
    sub_23A8B6818();

  }
  else
  {
    v2 = 0;
  }
  return (*(uint64_t (**)(_QWORD *))(v0 + 8))(v2);
}

uint64_t sub_23A8C3D08()
{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD))(v0 + 8))(0);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t sub_23A8C3D54(uint64_t a1)
{
  uint64_t v1;

  return sub_23A8B0BB8(a1, *(_QWORD *)(v1 + 16), *(void **)(v1 + 24));
}

unint64_t sub_23A8C3D5C()
{
  unint64_t result;

  result = qword_2569C8408;
  if (!qword_2569C8408)
  {
    result = MEMORY[0x23B85B498](&protocol conformance descriptor for HomeEnergyError, &type metadata for HomeEnergyError);
    atomic_store(result, (unint64_t *)&qword_2569C8408);
  }
  return result;
}

uint64_t sub_23A8C3DA0(uint64_t a1)
{
  uint64_t *v1;

  return sub_23A8B1E6C(a1, v1[2], v1[3], v1[4], (uint64_t)&unk_250BB52B0, (uint64_t)&unk_2569C8900);
}

uint64_t sub_23A8C3DCC(uint64_t a1)
{
  uint64_t *v1;

  return sub_23A8B1E6C(a1, v1[2], v1[3], v1[4], (uint64_t)&unk_250BB5248, (uint64_t)&unk_2569C88F0);
}

uint64_t sub_23A8C3DF8(uint64_t a1)
{
  uint64_t v1;

  return sub_23A8B2718(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t sub_23A8C3E00(uint64_t a1)
{
  uint64_t *v1;

  return sub_23A8B30A8(a1, v1[2], v1[3], v1[4], v1[5], v1[6], v1[7], v1[8], v1[9], v1[10], v1[11], v1[12], v1[13], v1[14], v1[15], v1[16], v1[17], v1[18], v1[19],
           v1[20],
           v1[21],
           v1[22],
           v1[23]);
}

uint64_t sub_23A8C3E60(uint64_t a1)
{
  uint64_t *v1;

  return sub_23A8B3F60(a1, v1[2], v1[3], v1[4], v1[5], v1[6], v1[7], v1[8], v1[9], v1[10]);
}

uint64_t sub_23A8C3E94(uint64_t a1)
{
  uint64_t v1;

  return sub_23A8B49A4(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32), *(_QWORD *)(v1 + 40), *(_QWORD *)(v1 + 48), *(_QWORD *)(v1 + 56), *(_QWORD *)(v1 + 64), *(_QWORD *)(v1 + 72), *(_QWORD *)(v1 + 80), *(_QWORD *)(v1 + 88), *(_QWORD *)(v1 + 96), *(_QWORD *)(v1 + 104));
}

uint64_t sub_23A8C3ED4(unint64_t a1)
{
  uint64_t *v1;

  return sub_23A8B5524(a1, v1[2], v1[3], v1[4], v1[5], v1[6], v1[7], v1[8], v1[9], v1[10], v1[11], v1[12], v1[13], v1[14], v1[15]);
}

uint64_t sub_23A8C3F1C(uint64_t a1)
{
  uint64_t v1;

  return sub_23A8BBE20(a1, v1, &qword_2569C8870, (uint64_t)&unk_250BB4FD8, (uint64_t)&unk_2569C8890, (void (*)(char *, uint64_t, uint64_t))sub_23A8B1124);
}

uint64_t sub_23A8C3F54(uint64_t a1)
{
  uint64_t v1;

  return sub_23A8BBE20(a1, v1, &qword_2569C8870, (uint64_t)&unk_250BB4F70, (uint64_t)&unk_2569C8880, (void (*)(char *, uint64_t, uint64_t))sub_23A8B1124);
}

uint64_t sub_23A8C3F8C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;

  v4[8] = a3;
  v4[9] = a4;
  v4[6] = a1;
  v4[7] = a2;
  v5 = sub_23A8F10A0();
  v4[10] = v5;
  v4[11] = *(_QWORD *)(v5 - 8);
  v4[12] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23A8C3FF0()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  v1 = v0[8];
  v2 = v0[9];
  v4 = v0[6];
  v3 = v0[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v0[13] = sub_23A8C3404(v4, v3, v1, v2);
  v5 = (_QWORD *)swift_task_alloc();
  v0[14] = v5;
  *v5 = v0;
  v5[1] = sub_23A8C4070;
  return sub_23A8B70D8();
}

uint64_t sub_23A8C4070()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v4;

  v2 = *v1;
  *(_QWORD *)(v2 + 120) = v0;
  swift_task_dealloc();
  if (v0)
    return swift_task_switch();
  v4 = *(_QWORD *)(v2 + 104);
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v2 + 8))(v4);
}

uint64_t sub_23A8C40E8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  _BOOL4 v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint8_t *v14;
  uint64_t v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  if (qword_2542D8828 != -1)
    swift_once();
  v2 = *(_QWORD *)(v0 + 88);
  v1 = *(_QWORD *)(v0 + 96);
  v3 = *(_QWORD *)(v0 + 80);
  v4 = __swift_project_value_buffer(v3, (uint64_t)qword_2542D8DE0);
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v4, v3);
  swift_bridgeObjectRetain_n();
  v5 = sub_23A8F1088();
  v6 = sub_23A8F1274();
  v7 = os_log_type_enabled(v5, v6);
  v8 = *(void **)(v0 + 120);
  v9 = *(_QWORD *)(v0 + 96);
  v10 = *(_QWORD *)(v0 + 80);
  v11 = *(_QWORD *)(v0 + 88);
  v12 = *(_QWORD *)(v0 + 56);
  if (v7)
  {
    v18 = *(_QWORD *)(v0 + 80);
    v13 = *(_QWORD *)(v0 + 48);
    v14 = (uint8_t *)swift_slowAlloc();
    v17 = v11;
    v15 = swift_slowAlloc();
    v19 = v15;
    *(_DWORD *)v14 = 136315138;
    swift_bridgeObjectRetain();
    *(_QWORD *)(v0 + 40) = sub_23A8BF840(v13, v12, &v19);
    sub_23A8F12A4();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_23A8AD000, v5, v6, "Failed to register EnergySite(%s)", v14, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B85B51C](v15, -1, -1);
    MEMORY[0x23B85B51C](v14, -1, -1);

    swift_release();
    (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v9, v18);
  }
  else
  {
    swift_bridgeObjectRelease_n();

    swift_release();
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v9, v10);
  }
  swift_task_dealloc();
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(0);
}

uint64_t sub_23A8C4334(uint64_t a1)
{
  uint64_t v1;

  return sub_23A8BBE20(a1, v1, &qword_2542D8D18, (uint64_t)&unk_250BB4F08, (uint64_t)&unk_2569C8868, (void (*)(char *, uint64_t, uint64_t))sub_23A8B1124);
}

uint64_t type metadata accessor for EnergySite.EnergyUsage(uint64_t a1)
{
  return sub_23A8C4510(a1, qword_2569C8680);
}

unint64_t sub_23A8C4380(uint64_t a1)
{
  return sub_23A8C4398(a1, (uint64_t (*)(uint64_t))sub_23A8C8728);
}

unint64_t sub_23A8C438C(uint64_t a1)
{
  return sub_23A8C4398(a1, (uint64_t (*)(uint64_t))sub_23A8BFF70);
}

unint64_t sub_23A8C4398(uint64_t a1, uint64_t (*a2)(uint64_t))
{
  uint64_t v2;
  _QWORD *v5;
  uint64_t *i;
  uint64_t v7;
  uint64_t v8;
  unint64_t result;
  char v10;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;

  v2 = *(_QWORD *)(a1 + 16);
  if (v2)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2569C8850);
    v5 = (_QWORD *)sub_23A8F13B8();
    for (i = (uint64_t *)(a1 + 40); ; i += 2)
    {
      v7 = *(i - 1);
      v8 = *i;
      result = a2(v7);
      if ((v10 & 1) != 0)
        break;
      *(_QWORD *)((char *)v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
      v11 = 8 * result;
      *(_QWORD *)(v5[6] + v11) = v7;
      *(_QWORD *)(v5[7] + v11) = v8;
      v12 = v5[2];
      v13 = __OFADD__(v12, 1);
      v14 = v12 + 1;
      if (v13)
        goto LABEL_10;
      v5[2] = v14;
      if (!--v2)
        return (unint64_t)v5;
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

unint64_t sub_23A8C447C()
{
  unint64_t result;

  result = qword_2569C8480;
  if (!qword_2569C8480)
  {
    result = MEMORY[0x23B85B498](&protocol conformance descriptor for EnergySite.HistoricalEnergyUsageError, &type metadata for EnergySite.HistoricalEnergyUsageError);
    atomic_store(result, (unint64_t *)&qword_2569C8480);
  }
  return result;
}

uint64_t sub_23A8C44C0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t type metadata accessor for EnergySite.HistoricalEnergyUsage(uint64_t a1)
{
  return sub_23A8C4510(a1, qword_2569C8730);
}

uint64_t sub_23A8C4510(uint64_t a1, uint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_23A8C4544(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for EnergySite.EnergyUsage(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_23A8C4588(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for EnergySite.EnergyUsage(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_23A8C45C4(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_23A8C4608(uint64_t a1)
{
  uint64_t v1;

  return sub_23A8BB16C(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32), *(_QWORD *)(v1 + 40), *(_QWORD *)(v1 + 48), *(_QWORD *)(v1 + 56), *(_QWORD *)(v1 + 64), *(_QWORD *)(v1 + 72), *(_QWORD *)(v1 + 80), *(_QWORD *)(v1 + 88), *(_QWORD *)(v1 + 96), *(_QWORD *)(v1 + 104), *(_QWORD *)(v1 + 112));
}

uint64_t sub_23A8C4648(uint64_t a1)
{
  uint64_t v1;

  return sub_23A8BBE20(a1, v1, &qword_2569C8818, (uint64_t)&unk_250BB4E38, (uint64_t)&unk_2569C8828, (void (*)(char *, uint64_t, uint64_t))sub_23A8DEC80);
}

uint64_t sub_23A8C4680(uint64_t a1)
{
  uint64_t v1;

  return sub_23A8BE184(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t sub_23A8C4688(uint64_t a1)
{
  swift_unknownObjectWeakDestroy();
  return a1;
}

unint64_t sub_23A8C46B0()
{
  unint64_t result;

  result = qword_2569C8550;
  if (!qword_2569C8550)
  {
    result = MEMORY[0x23B85B498](&protocol conformance descriptor for EnergySite.EnergyUsageTimeInterval, &type metadata for EnergySite.EnergyUsageTimeInterval);
    atomic_store(result, (unint64_t *)&qword_2569C8550);
  }
  return result;
}

unint64_t sub_23A8C46F8()
{
  unint64_t result;

  result = qword_2569C8558;
  if (!qword_2569C8558)
  {
    result = MEMORY[0x23B85B498](&protocol conformance descriptor for EnergySite.HistoricalEnergyUsageError, &type metadata for EnergySite.HistoricalEnergyUsageError);
    atomic_store(result, (unint64_t *)&qword_2569C8558);
  }
  return result;
}

uint64_t sub_23A8C473C@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
  uint64_t v6;

  v3 = *a1;
  v4 = *a1 + 48;
  swift_beginAccess();
  result = MEMORY[0x23B85B5B8](v4);
  v6 = *(_QWORD *)(v3 + 56);
  *a2 = result;
  a2[1] = v6;
  return result;
}

uint64_t sub_23A8C4794(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(a1 + 8);
  v3 = *a2;
  swift_beginAccess();
  *(_QWORD *)(v3 + 56) = v2;
  return swift_unknownObjectWeakAssign();
}

uint64_t dispatch thunk of EnergySiteDelegate.siteDidUpdateGuidance(siteID:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 8))();
}

uint64_t dispatch thunk of EnergySiteDelegate.siteZoneCreated(siteID:zoneName:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 16))();
}

uint64_t dispatch thunk of EnergySiteDelegate.siteZoneDeleted(siteID:zoneName:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 24))();
}

uint64_t type metadata accessor for EnergySite()
{
  return objc_opt_self();
}

uint64_t method lookup function for EnergySite()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of EnergySite.delegate.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 192))();
}

uint64_t dispatch thunk of EnergySite.delegate.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 200))();
}

uint64_t dispatch thunk of EnergySite.delegate.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 208))();
}

uint64_t dispatch thunk of EnergySite.updateLocation(_:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))(**(int **)(*(_QWORD *)v1 + 224) + *(_QWORD *)(*(_QWORD *)v1 + 224));
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_23A8C8720;
  return v6(a1);
}

uint64_t dispatch thunk of EnergySite.updateTimezone(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v6;
  uint64_t (*v8)(uint64_t, uint64_t);

  v8 = (uint64_t (*)(uint64_t, uint64_t))(**(int **)(*(_QWORD *)v2 + 232) + *(_QWORD *)(*(_QWORD *)v2 + 232));
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v6;
  *v6 = v3;
  v6[1] = sub_23A8C8720;
  return v8(a1, a2);
}

uint64_t dispatch thunk of EnergySite.updateState(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v6;
  uint64_t (*v8)(uint64_t, uint64_t);

  v8 = (uint64_t (*)(uint64_t, uint64_t))(**(int **)(*(_QWORD *)v2 + 240) + *(_QWORD *)(*(_QWORD *)v2 + 240));
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v6;
  *v6 = v3;
  v6[1] = sub_23A8C8720;
  return v8(a1, a2);
}

uint64_t dispatch thunk of EnergySite.updateFields(from:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))(**(int **)(*(_QWORD *)v1 + 248) + *(_QWORD *)(*(_QWORD *)v1 + 248));
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_23A8C8720;
  return v6(a1);
}

uint64_t dispatch thunk of EnergySite.updateSubscription(utilityID:subscriptionID:accessToken:refreshToken:ckFunctionToken:accountName:accountNumber:address:serviceLocationID:alternateSupplier:accessTokenExpirationDate:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21)
{
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t (*v25)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);

  v25 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(**(int **)(*(_QWORD *)v21 + 256) + *(_QWORD *)(*(_QWORD *)v21 + 256));
  v23 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v22 + 16) = v23;
  *v23 = v22;
  v23[1] = sub_23A8C8720;
  return v25(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19, a20, a21);
}

uint64_t dispatch thunk of EnergySite.createUtilitySubscription(utilityID:serviceLocationID:accessToken:refreshToken:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  _QWORD *v18;
  uint64_t (*v20)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);

  v20 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(**(int **)(*(_QWORD *)v8 + 264) + *(_QWORD *)(*(_QWORD *)v8 + 264));
  v18 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v9 + 16) = v18;
  *v18 = v9;
  v18[1] = sub_23A8C8744;
  return v20(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t dispatch thunk of EnergySite.createUtilitySubscription(utilityID:serviceLocationID:accessToken:accessTokenExpirationDate:refreshToken:utilityCustomerName:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  uint64_t v11;
  uint64_t v12;
  _QWORD *v18;
  uint64_t (*v20)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);

  v20 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(**(int **)(*(_QWORD *)v11 + 272) + *(_QWORD *)(*(_QWORD *)v11 + 272));
  v18 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v12 + 16) = v18;
  *v18 = v12;
  v18[1] = sub_23A8C8744;
  return v20(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11);
}

uint64_t dispatch thunk of EnergySite.createUtilitySubscription(utilityID:serviceLocationID:accessToken:accessTokenExpirationDate:refreshToken:address:utilityCustomerName:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  uint64_t v13;
  uint64_t v14;
  _QWORD *v18;
  uint64_t (*v20)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);

  v20 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(**(int **)(*(_QWORD *)v13 + 280) + *(_QWORD *)(*(_QWORD *)v13 + 280));
  v18 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v14 + 16) = v18;
  *v18 = v14;
  v18[1] = sub_23A8C8744;
  return v20(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13);
}

uint64_t dispatch thunk of EnergySite.revokeUtilitySubscription()()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t (*v4)(void);

  v4 = (uint64_t (*)(void))(**(int **)(*(_QWORD *)v0 + 288) + *(_QWORD *)(*(_QWORD *)v0 + 288));
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v2;
  *v2 = v1;
  v2[1] = sub_23A8C8744;
  return v4();
}

uint64_t dispatch thunk of EnergySite.renewUtilityAccessToken()()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t (*v4)(void);

  v4 = (uint64_t (*)(void))(**(int **)(*(_QWORD *)v0 + 296) + *(_QWORD *)(*(_QWORD *)v0 + 296));
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v2;
  *v2 = v1;
  v2[1] = sub_23A8C8720;
  return v4();
}

uint64_t dispatch thunk of EnergySite.delete()()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t (*v4)(void);

  v4 = (uint64_t (*)(void))(**(int **)(*(_QWORD *)v0 + 336) + *(_QWORD *)(*(_QWORD *)v0 + 336));
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v2;
  *v2 = v1;
  v2[1] = sub_23A8C8720;
  return v4();
}

uint64_t dispatch thunk of EnergySite.historicalEnergyUsage(interval:start:bulk:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  _QWORD *v10;
  uint64_t (*v12)(uint64_t, uint64_t, uint64_t, uint64_t);

  v12 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(**(int **)(*(_QWORD *)v4 + 344)
                                                                   + *(_QWORD *)(*(_QWORD *)v4 + 344));
  v10 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v5 + 16) = v10;
  *v10 = v5;
  v10[1] = sub_23A8C4ED0;
  return v12(a1, a2, a3, a4);
}

uint64_t sub_23A8C4ED0()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t dispatch thunk of EnergySite.historicalEnergyUsage(interval:start:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD *v8;
  uint64_t (*v10)(uint64_t, uint64_t, uint64_t);

  v10 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(**(int **)(*(_QWORD *)v3 + 352)
                                                          + *(_QWORD *)(*(_QWORD *)v3 + 352));
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v8;
  *v8 = v4;
  v8[1] = sub_23A8C8720;
  return v10(a1, a2, a3);
}

uint64_t dispatch thunk of EnergySite.intervalReading(interval:start:end:timeZoneIdentifier:flowDirection:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  _QWORD *v18;
  uint64_t (*v20)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);

  v20 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(**(int **)(*(_QWORD *)v8 + 360) + *(_QWORD *)(*(_QWORD *)v8 + 360));
  v18 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v9 + 16) = v18;
  *v18 = v9;
  v18[1] = sub_23A8C5050;
  return v20(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_23A8C5050(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v4;

  v4 = *v1;
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v4 + 8))(a1);
}

uint64_t dispatch thunk of EnergySite.isDataAvailable()()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t (*v4)(void);

  v4 = (uint64_t (*)(void))(**(int **)(*(_QWORD *)v0 + 368) + *(_QWORD *)(*(_QWORD *)v0 + 368));
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v2;
  *v2 = v1;
  v2[1] = sub_23A8C8744;
  return v4();
}

uint64_t dispatch thunk of EnergySite.currentRatePlans()(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))(**(int **)(*(_QWORD *)v1 + 376) + *(_QWORD *)(*(_QWORD *)v1 + 376));
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_23A8C8720;
  return v6(a1);
}

uint64_t dispatch thunk of EnergySite.currentUtilityPeakPeriods()()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t (*v4)(void);

  v4 = (uint64_t (*)(void))(**(int **)(*(_QWORD *)v0 + 384) + *(_QWORD *)(*(_QWORD *)v0 + 384));
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v2;
  *v2 = v1;
  v2[1] = sub_23A8C8744;
  return v4();
}

uint64_t dispatch thunk of EnergySite.currentUtilityPeakPeriodsWithInfo()(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))(**(int **)(*(_QWORD *)v1 + 392) + *(_QWORD *)(*(_QWORD *)v1 + 392));
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_23A8C8720;
  return v6(a1);
}

uint64_t dispatch thunk of EnergySite.isTOU()()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t (*v4)(void);

  v4 = (uint64_t (*)(void))(**(int **)(*(_QWORD *)v0 + 400) + *(_QWORD *)(*(_QWORD *)v0 + 400));
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v2;
  *v2 = v1;
  v2[1] = sub_23A8C8744;
  return v4();
}

uint64_t dispatch thunk of EnergySite.isTiered()()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t (*v4)(void);

  v4 = (uint64_t (*)(void))(**(int **)(*(_QWORD *)v0 + 408) + *(_QWORD *)(*(_QWORD *)v0 + 408));
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v2;
  *v2 = v1;
  v2[1] = sub_23A8C8744;
  return v4();
}

uint64_t dispatch thunk of EnergySite.isFlat()()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t (*v4)(void);

  v4 = (uint64_t (*)(void))(**(int **)(*(_QWORD *)v0 + 416) + *(_QWORD *)(*(_QWORD *)v0 + 416));
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v2;
  *v2 = v1;
  v2[1] = sub_23A8C8744;
  return v4();
}

uint64_t dispatch thunk of EnergySite.isFixed()()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t (*v4)(void);

  v4 = (uint64_t (*)(void))(**(int **)(*(_QWORD *)v0 + 424) + *(_QWORD *)(*(_QWORD *)v0 + 424));
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v2;
  *v2 = v1;
  v2[1] = sub_23A8C8744;
  return v4();
}

uint64_t dispatch thunk of EnergySite.isUnsupported()()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t (*v4)(void);

  v4 = (uint64_t (*)(void))(**(int **)(*(_QWORD *)v0 + 432) + *(_QWORD *)(*(_QWORD *)v0 + 432));
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v2;
  *v2 = v1;
  v2[1] = sub_23A8C5050;
  return v4();
}

uint64_t dispatch thunk of EnergySite.refreshCurrentUtilityPeakPeriods(start:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))(**(int **)(*(_QWORD *)v1 + 440) + *(_QWORD *)(*(_QWORD *)v1 + 440));
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_23A8C8720;
  return v6(a1);
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

ValueMetadata *type metadata accessor for EnergySite.EnergyUsageTimeInterval()
{
  return &type metadata for EnergySite.EnergyUsageTimeInterval;
}

uint64_t _s9EnergyKit10EnergySiteC23EnergyUsageTimeIntervalOwet_0(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFC)
    goto LABEL_17;
  if (a2 + 4 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 4) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 4;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 4;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 4;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 5;
  v8 = v6 - 5;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t _s9EnergyKit10EnergySiteC23EnergyUsageTimeIntervalOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 4 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 4) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFC)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFB)
    return ((uint64_t (*)(void))((char *)&loc_23A8C553C + 4 * byte_23A8F19DA[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_23A8C5570 + 4 * byte_23A8F19D5[v4]))();
}

uint64_t sub_23A8C5570(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A8C5578(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23A8C5580);
  return result;
}

uint64_t sub_23A8C558C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23A8C5594);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_23A8C5598(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A8C55A0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A8C55AC(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_23A8C55B4(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for EnergySite.HistoricalEnergyUsageError()
{
  return &type metadata for EnergySite.HistoricalEnergyUsageError;
}

_QWORD *initializeBufferWithCopyOfBuffer for EnergySite.EnergyUsage(_QWORD *a1, _QWORD *a2, int *a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v12 = *a2;
    *a1 = *a2;
    a1 = (_QWORD *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_23A8F0CA4();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = a3[6];
    *(_QWORD *)((char *)a1 + a3[5]) = *(_QWORD *)((char *)a2 + a3[5]);
    *(_QWORD *)((char *)a1 + v8) = *(_QWORD *)((char *)a2 + v8);
    v9 = a3[8];
    *(_QWORD *)((char *)a1 + a3[7]) = *(_QWORD *)((char *)a2 + a3[7]);
    *(_QWORD *)((char *)a1 + v9) = *(_QWORD *)((char *)a2 + v9);
    v10 = a3[10];
    *(_QWORD *)((char *)a1 + a3[9]) = *(_QWORD *)((char *)a2 + a3[9]);
    *(_QWORD *)((char *)a1 + v10) = *(_QWORD *)((char *)a2 + v10);
    v11 = a3[12];
    *(_QWORD *)((char *)a1 + a3[11]) = *(_QWORD *)((char *)a2 + a3[11]);
    *(_QWORD *)((char *)a1 + v11) = *(_QWORD *)((char *)a2 + v11);
    *((_BYTE *)a1 + a3[13]) = *((_BYTE *)a2 + a3[13]);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t destroy for EnergySite.EnergyUsage(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_23A8F0CA4();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for EnergySite.EnergyUsage(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6 = sub_23A8F0CA4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = a3[6];
  *(_QWORD *)(a1 + a3[5]) = *(_QWORD *)(a2 + a3[5]);
  *(_QWORD *)(a1 + v7) = *(_QWORD *)(a2 + v7);
  v8 = a3[8];
  *(_QWORD *)(a1 + a3[7]) = *(_QWORD *)(a2 + a3[7]);
  *(_QWORD *)(a1 + v8) = *(_QWORD *)(a2 + v8);
  v9 = a3[10];
  *(_QWORD *)(a1 + a3[9]) = *(_QWORD *)(a2 + a3[9]);
  *(_QWORD *)(a1 + v9) = *(_QWORD *)(a2 + v9);
  v10 = a3[12];
  *(_QWORD *)(a1 + a3[11]) = *(_QWORD *)(a2 + a3[11]);
  *(_QWORD *)(a1 + v10) = *(_QWORD *)(a2 + v10);
  *(_BYTE *)(a1 + a3[13]) = *(_BYTE *)(a2 + a3[13]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for EnergySite.EnergyUsage(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;

  v6 = sub_23A8F0CA4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  *(_QWORD *)(a1 + a3[5]) = *(_QWORD *)(a2 + a3[5]);
  *(_QWORD *)(a1 + a3[6]) = *(_QWORD *)(a2 + a3[6]);
  *(_QWORD *)(a1 + a3[7]) = *(_QWORD *)(a2 + a3[7]);
  *(_QWORD *)(a1 + a3[8]) = *(_QWORD *)(a2 + a3[8]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + a3[9]) = *(_QWORD *)(a2 + a3[9]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + a3[10]) = *(_QWORD *)(a2 + a3[10]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + a3[11]) = *(_QWORD *)(a2 + a3[11]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + a3[12]) = *(_QWORD *)(a2 + a3[12]);
  *(_BYTE *)(a1 + a3[13]) = *(_BYTE *)(a2 + a3[13]);
  return a1;
}

uint64_t initializeWithTake for EnergySite.EnergyUsage(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6 = sub_23A8F0CA4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = a3[6];
  *(_QWORD *)(a1 + a3[5]) = *(_QWORD *)(a2 + a3[5]);
  *(_QWORD *)(a1 + v7) = *(_QWORD *)(a2 + v7);
  v8 = a3[8];
  *(_QWORD *)(a1 + a3[7]) = *(_QWORD *)(a2 + a3[7]);
  *(_QWORD *)(a1 + v8) = *(_QWORD *)(a2 + v8);
  v9 = a3[10];
  *(_QWORD *)(a1 + a3[9]) = *(_QWORD *)(a2 + a3[9]);
  *(_QWORD *)(a1 + v9) = *(_QWORD *)(a2 + v9);
  v10 = a3[12];
  *(_QWORD *)(a1 + a3[11]) = *(_QWORD *)(a2 + a3[11]);
  *(_QWORD *)(a1 + v10) = *(_QWORD *)(a2 + v10);
  *(_BYTE *)(a1 + a3[13]) = *(_BYTE *)(a2 + a3[13]);
  return a1;
}

uint64_t assignWithTake for EnergySite.EnergyUsage(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v6 = sub_23A8F0CA4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = a3[6];
  *(_QWORD *)(a1 + a3[5]) = *(_QWORD *)(a2 + a3[5]);
  *(_QWORD *)(a1 + v7) = *(_QWORD *)(a2 + v7);
  v8 = a3[8];
  *(_QWORD *)(a1 + a3[7]) = *(_QWORD *)(a2 + a3[7]);
  *(_QWORD *)(a1 + v8) = *(_QWORD *)(a2 + v8);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + a3[9]) = *(_QWORD *)(a2 + a3[9]);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + a3[10]) = *(_QWORD *)(a2 + a3[10]);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + a3[11]) = *(_QWORD *)(a2 + a3[11]);
  swift_bridgeObjectRelease();
  v9 = a3[13];
  *(_QWORD *)(a1 + a3[12]) = *(_QWORD *)(a2 + a3[12]);
  *(_BYTE *)(a1 + v9) = *(_BYTE *)(a2 + v9);
  return a1;
}

uint64_t getEnumTagSinglePayload for EnergySite.EnergyUsage()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23A8C5A84(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;

  v6 = sub_23A8F0CA4();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 32));
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  return (v9 + 1);
}

uint64_t storeEnumTagSinglePayload for EnergySite.EnergyUsage()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23A8C5B0C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = sub_23A8F0CA4();
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 32)) = (a2 - 1);
  return result;
}

uint64_t sub_23A8C5B84()
{
  uint64_t result;
  unint64_t v1;

  result = sub_23A8F0CA4();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for EnergySite.HistoricalEnergyUsage(uint64_t *a1, uint64_t *a2, int *a3)
{
  uint64_t *v4;
  int v5;
  uint64_t v7;
  _BYTE *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  char *v17;
  char *v18;
  char *v19;
  uint64_t v20;
  char *v21;
  char *v22;
  uint64_t v23;

  v4 = a1;
  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v23 = *a2;
    *v4 = *a2;
    v4 = (uint64_t *)(v23 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *(_BYTE *)a1 = *(_BYTE *)a2;
    v7 = a3[5];
    v8 = (char *)a1 + v7;
    v9 = (char *)a2 + v7;
    v10 = sub_23A8F0CA4();
    (*(void (**)(_BYTE *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v8, v9, v10);
    v11 = a3[7];
    *(uint64_t *)((char *)v4 + a3[6]) = *(uint64_t *)((char *)a2 + a3[6]);
    v12 = (char *)v4 + v11;
    v13 = (char *)a2 + v11;
    v12[8] = v13[8];
    *(_QWORD *)v12 = *(_QWORD *)v13;
    v14 = a3[8];
    v15 = a3[9];
    v16 = (char *)v4 + v14;
    v17 = (char *)a2 + v14;
    v16[8] = v17[8];
    *(_QWORD *)v16 = *(_QWORD *)v17;
    v18 = (char *)v4 + v15;
    v19 = (char *)a2 + v15;
    *(_QWORD *)v18 = *(_QWORD *)v19;
    v18[8] = v19[8];
    v20 = a3[10];
    v21 = (char *)v4 + v20;
    v22 = (char *)a2 + v20;
    *(_QWORD *)v21 = *(_QWORD *)v22;
    v21[8] = v22[8];
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t destroy for EnergySite.HistoricalEnergyUsage(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = a1 + *(int *)(a2 + 20);
  v3 = sub_23A8F0CA4();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
  return swift_bridgeObjectRelease();
}

_BYTE *initializeWithCopy for EnergySite.HistoricalEnergyUsage(_BYTE *a1, _BYTE *a2, int *a3)
{
  uint64_t v6;
  _BYTE *v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE *v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  _BYTE *v15;
  _BYTE *v16;
  _BYTE *v17;
  _BYTE *v18;
  uint64_t v19;
  _BYTE *v20;
  _BYTE *v21;

  *a1 = *a2;
  v6 = a3[5];
  v7 = &a1[v6];
  v8 = &a2[v6];
  v9 = sub_23A8F0CA4();
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v9 - 8) + 16))(v7, v8, v9);
  v10 = a3[7];
  *(_QWORD *)&a1[a3[6]] = *(_QWORD *)&a2[a3[6]];
  v11 = &a1[v10];
  v12 = &a2[v10];
  v11[8] = v12[8];
  *(_QWORD *)v11 = *(_QWORD *)v12;
  v13 = a3[8];
  v14 = a3[9];
  v15 = &a1[v13];
  v16 = &a2[v13];
  v15[8] = v16[8];
  *(_QWORD *)v15 = *(_QWORD *)v16;
  v17 = &a1[v14];
  v18 = &a2[v14];
  *(_QWORD *)v17 = *(_QWORD *)v18;
  v17[8] = v18[8];
  v19 = a3[10];
  v20 = &a1[v19];
  v21 = &a2[v19];
  *(_QWORD *)v20 = *(_QWORD *)v21;
  v20[8] = v21[8];
  swift_bridgeObjectRetain();
  return a1;
}

_BYTE *assignWithCopy for EnergySite.HistoricalEnergyUsage(_BYTE *a1, _BYTE *a2, int *a3)
{
  uint64_t v6;
  _BYTE *v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE *v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  _BYTE *v15;
  _BYTE *v16;
  uint64_t v17;
  uint64_t v18;
  _BYTE *v19;
  _BYTE *v20;
  uint64_t v21;
  uint64_t v22;
  _BYTE *v23;
  _BYTE *v24;
  uint64_t v25;

  *a1 = *a2;
  v6 = a3[5];
  v7 = &a1[v6];
  v8 = &a2[v6];
  v9 = sub_23A8F0CA4();
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v9 - 8) + 24))(v7, v8, v9);
  *(_QWORD *)&a1[a3[6]] = *(_QWORD *)&a2[a3[6]];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v10 = a3[7];
  v11 = &a1[v10];
  v12 = &a2[v10];
  v13 = *(_QWORD *)v12;
  v11[8] = v12[8];
  *(_QWORD *)v11 = v13;
  v14 = a3[8];
  v15 = &a1[v14];
  v16 = &a2[v14];
  v17 = *(_QWORD *)v16;
  v15[8] = v16[8];
  *(_QWORD *)v15 = v17;
  v18 = a3[9];
  v19 = &a1[v18];
  v20 = &a2[v18];
  v21 = *(_QWORD *)v20;
  v19[8] = v20[8];
  *(_QWORD *)v19 = v21;
  v22 = a3[10];
  v23 = &a1[v22];
  v24 = &a2[v22];
  v25 = *(_QWORD *)v24;
  v23[8] = v24[8];
  *(_QWORD *)v23 = v25;
  return a1;
}

_BYTE *initializeWithTake for EnergySite.HistoricalEnergyUsage(_BYTE *a1, _BYTE *a2, int *a3)
{
  uint64_t v6;
  _BYTE *v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE *v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  _BYTE *v15;
  _BYTE *v16;
  _BYTE *v17;
  _BYTE *v18;
  uint64_t v19;
  _BYTE *v20;
  _BYTE *v21;

  *a1 = *a2;
  v6 = a3[5];
  v7 = &a1[v6];
  v8 = &a2[v6];
  v9 = sub_23A8F0CA4();
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v7, v8, v9);
  v10 = a3[7];
  *(_QWORD *)&a1[a3[6]] = *(_QWORD *)&a2[a3[6]];
  v11 = &a1[v10];
  v12 = &a2[v10];
  v11[8] = v12[8];
  *(_QWORD *)v11 = *(_QWORD *)v12;
  v13 = a3[8];
  v14 = a3[9];
  v15 = &a1[v13];
  v16 = &a2[v13];
  v15[8] = v16[8];
  *(_QWORD *)v15 = *(_QWORD *)v16;
  v17 = &a1[v14];
  v18 = &a2[v14];
  *(_QWORD *)v17 = *(_QWORD *)v18;
  v17[8] = v18[8];
  v19 = a3[10];
  v20 = &a1[v19];
  v21 = &a2[v19];
  *(_QWORD *)v20 = *(_QWORD *)v21;
  v20[8] = v21[8];
  return a1;
}

_BYTE *assignWithTake for EnergySite.HistoricalEnergyUsage(_BYTE *a1, _BYTE *a2, int *a3)
{
  uint64_t v6;
  _BYTE *v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE *v12;
  _BYTE *v13;
  _BYTE *v14;
  _BYTE *v15;
  uint64_t v16;
  uint64_t v17;
  _BYTE *v18;
  _BYTE *v19;
  _BYTE *v20;
  _BYTE *v21;

  *a1 = *a2;
  v6 = a3[5];
  v7 = &a1[v6];
  v8 = &a2[v6];
  v9 = sub_23A8F0CA4();
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v9 - 8) + 40))(v7, v8, v9);
  *(_QWORD *)&a1[a3[6]] = *(_QWORD *)&a2[a3[6]];
  swift_bridgeObjectRelease();
  v10 = a3[7];
  v11 = a3[8];
  v12 = &a1[v10];
  v13 = &a2[v10];
  *(_QWORD *)v12 = *(_QWORD *)v13;
  v12[8] = v13[8];
  v14 = &a1[v11];
  v15 = &a2[v11];
  *(_QWORD *)v14 = *(_QWORD *)v15;
  v14[8] = v15[8];
  v16 = a3[9];
  v17 = a3[10];
  v18 = &a1[v16];
  v19 = &a2[v16];
  *(_QWORD *)v18 = *(_QWORD *)v19;
  v18[8] = v19[8];
  v20 = &a1[v17];
  v21 = &a2[v17];
  v20[8] = v21[8];
  *(_QWORD *)v20 = *(_QWORD *)v21;
  return a1;
}

uint64_t getEnumTagSinglePayload for EnergySite.HistoricalEnergyUsage()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23A8C6130(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;

  v6 = sub_23A8F0CA4();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1 + *(int *)(a3 + 20), a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 24));
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  return (v9 + 1);
}

uint64_t storeEnumTagSinglePayload for EnergySite.HistoricalEnergyUsage()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23A8C61BC(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = sub_23A8F0CA4();
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1 + *(int *)(a4 + 20), a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 24)) = (a2 - 1);
  return result;
}

uint64_t sub_23A8C6238()
{
  uint64_t result;
  unint64_t v1;

  result = sub_23A8F0CA4();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

_OWORD *sub_23A8C62C8(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_23A8C62D8(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = *(_QWORD *)(a1 + 16);
  result = sub_23A8F1244();
  v8 = result;
  if (v2)
  {
    v4 = (uint64_t *)(a1 + 40);
    do
    {
      v5 = *(v4 - 1);
      v6 = *v4;
      swift_bridgeObjectRetain();
      sub_23A8C074C(&v7, v5, v6);
      swift_bridgeObjectRelease();
      v4 += 2;
      --v2;
    }
    while (v2);
    return v8;
  }
  return result;
}

uint64_t sub_23A8C636C(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(MEMORY[0x24BEE23D0] - 8) + 16))(a2, a1);
  return a2;
}

uint64_t sub_23A8C63A8(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(MEMORY[0x24BEE23D0] - 8) + 8))();
  return a1;
}

uint64_t sub_23A8C63DC(uint64_t a1)
{
  uint64_t v1;

  return sub_23A8BBE20(a1, v1, &qword_2542D8D18, (uint64_t)&unk_250BB4CB0, (uint64_t)&unk_2569C8790, (void (*)(char *, uint64_t, uint64_t))sub_23A8B1124);
}

uint64_t sub_23A8C6414()
{
  return objectdestroyTm(&qword_2542D8D18);
}

uint64_t sub_23A8C6420(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;

  v4 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2542D8D18) - 8);
  v5 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v6 = *(_QWORD *)(v1 + 16);
  v7 = *(_QWORD *)(v1 + 24);
  v8 = v1 + v5;
  v9 = *(_QWORD *)(v1 + ((*(_QWORD *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFF8));
  v10 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v10;
  *v10 = v2;
  v10[1] = sub_23A8C8720;
  return sub_23A8B7418(a1, v6, v7, v8, v9);
}

uint64_t sub_23A8C64C8(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_23A8C6504()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23A8C6528(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_23A8C8720;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_2569C8798 + dword_2569C8798))(a1, v4);
}

uint64_t sub_23A8C6598()
{
  return objectdestroy_90Tm(&qword_2542D8D18);
}

uint64_t sub_23A8C65A4(uint64_t a1)
{
  return sub_23A8C6910(a1, &qword_2542D8D18, (uint64_t)"Registration of Site failed. %s", (uint64_t)&qword_2542D8D18, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_23A8B7F1C);
}

uint64_t sub_23A8C65C4(uint64_t a1)
{
  uint64_t v1;

  return sub_23A8B6920(a1, v1);
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

uint64_t sub_23A8C65E4(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t (*a5)(_QWORD))
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
    v9 = *(_QWORD *)(a5(0) - 8);
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
  result = sub_23A8F13C4();
  __break(1u);
  return result;
}

uint64_t sub_23A8C6700(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_23A8C6744()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542D8D18);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = (*(_QWORD *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  v5 = sub_23A8F0CA4();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = (v4 + *(unsigned __int8 *)(v6 + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  swift_unknownObjectRelease();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v6 + 8))(v0 + v7, v5);
  return swift_deallocObject();
}

uint64_t sub_23A8C6818(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;

  v4 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2542D8D18) - 8);
  v5 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v6 = (*(_QWORD *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8;
  v7 = *(unsigned __int8 *)(*(_QWORD *)(sub_23A8F0CA4() - 8) + 80);
  v8 = v6 + v7 + 8;
  v9 = *(_QWORD *)(v1 + 16);
  v10 = *(_QWORD *)(v1 + 24);
  v11 = v1 + v5;
  v12 = *(_QWORD *)(v1 + v6);
  v13 = v1 + (v8 & ~v7);
  v14 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v14;
  *v14 = v2;
  v14[1] = sub_23A8C8720;
  return sub_23A8BE360(a1, v9, v10, v11, v12, v13);
}

uint64_t sub_23A8C68E4()
{
  return objectdestroy_90Tm(&qword_2542D8D18);
}

uint64_t sub_23A8C68F0(uint64_t a1)
{
  return sub_23A8C6910(a1, &qword_2542D8D18, (uint64_t)"Failed to refresh current utility peak periods %@", (uint64_t)&qword_2542D8D18, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_23A8BE6C4);
}

uint64_t sub_23A8C6910(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v5;
  uint64_t v10;

  v10 = *(unsigned __int8 *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(a2) - 8) + 80);
  return a5(a1, v5 + ((v10 + 16) & ~v10), a3, a4);
}

unint64_t sub_23A8C6974()
{
  unint64_t result;

  result = qword_2542D8AD0;
  if (!qword_2542D8AD0)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2542D8AD0);
  }
  return result;
}

uint64_t sub_23A8C69B0(uint64_t a1, unint64_t a2)
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

uint64_t sub_23A8C69F4(uint64_t a1, unint64_t a2)
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

uint64_t sub_23A8C6A38(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x23B85B498](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_23A8C6A78(uint64_t a1)
{
  uint64_t v1;

  return sub_23A8B76AC(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t sub_23A8C6A80()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542D8D10);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_unknownObjectRelease();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_23A8C6B18(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;

  v4 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2542D8D10) - 8);
  v5 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v6 = *(_QWORD *)(v1 + 16);
  v7 = *(_QWORD *)(v1 + 24);
  v8 = v1 + v5;
  v9 = (uint64_t *)(v1 + ((*(_QWORD *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8));
  v10 = *v9;
  v11 = v9[1];
  v12 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v12;
  *v12 = v2;
  v12[1] = sub_23A8C8720;
  return sub_23A8B7810(a1, v6, v7, v8, v10, v11);
}

uint64_t sub_23A8C6BC8()
{
  return objectdestroy_90Tm(&qword_2542D8D10);
}

uint64_t sub_23A8C6BD4(uint64_t a1)
{
  return sub_23A8C6910(a1, &qword_2542D8D10, (uint64_t)"Failed to get energysite. %s", (uint64_t)&qword_2542D8D10, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_23A8B7F1C);
}

uint64_t sub_23A8C6BF4()
{
  return objectdestroyTm(&qword_2569C8818);
}

uint64_t sub_23A8C6C00(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;

  v4 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2569C8818) - 8);
  v5 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v6 = *(_QWORD *)(v1 + 16);
  v7 = *(_QWORD *)(v1 + 24);
  v8 = v1 + v5;
  v9 = *(_QWORD *)(v1 + ((*(_QWORD *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFF8));
  v10 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v10;
  *v10 = v2;
  v10[1] = sub_23A8C8720;
  return sub_23A8BBF7C(a1, v6, v7, v8, v9);
}

uint64_t sub_23A8C6CA8()
{
  return objectdestroy_90Tm(&qword_2569C8818);
}

uint64_t sub_23A8C6CB4(uint64_t a1)
{
  return sub_23A8C6910(a1, &qword_2569C8818, (uint64_t)"Failed to check if data is available %@", (uint64_t)&qword_2569C8818, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_23A8BE6C4);
}

uint64_t sub_23A8C6CD4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  void (*v12)(uint64_t, uint64_t);
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569C8830);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v16 = v1;
  v14 = (((((*(_QWORD *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8;
  v4 = sub_23A8F0CA4();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(unsigned __int8 *)(v5 + 80);
  v15 = (v6 + v14 + 16) & ~v6;
  v7 = *(_QWORD *)(v5 + 64);
  v8 = (v7 + v6 + v15) & ~v6;
  v9 = sub_23A8F0D58();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = (v7 + *(unsigned __int8 *)(v10 + 80) + v8) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v17 = v9;
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v16);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v12 = *(void (**)(uint64_t, uint64_t))(v5 + 8);
  v12(v0 + v15, v4);
  v12(v0 + v8, v4);
  (*(void (**)(unint64_t, uint64_t))(v10 + 8))(v0 + v11, v17);
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_23A8C6E68(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  _QWORD *v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v3 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2569C8830) - 8);
  v4 = (*(unsigned __int8 *)(v3 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v5 = (*(_QWORD *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  sub_23A8F0CA4();
  sub_23A8F0D58();
  v12 = v1[3];
  v13 = v1[2];
  v10 = v1[5];
  v11 = v1[4];
  v8 = *(_QWORD *)((char *)v1 + v5 + 8);
  v9 = *(_QWORD *)((char *)v1 + v5);
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v6;
  *v6 = v2;
  v6[1] = sub_23A8C8720;
  return sub_23A8BB4DC(a1, v13, v12, v11, v10, (uint64_t)v1 + v4, v9, v8);
}

uint64_t sub_23A8C6FE0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569C8830);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_bridgeObjectRelease();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  return swift_deallocObject();
}

uint64_t sub_23A8C7058(void *a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(unsigned __int8 *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2569C8830) - 8) + 80);
  return sub_23A8BB958(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), v1 + ((v3 + 32) & ~v3));
}

uint64_t sub_23A8C709C()
{
  return objectdestroyTm(&qword_2542D8D18);
}

uint64_t sub_23A8C70A8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;

  v4 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2542D8D18) - 8);
  v5 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v6 = *(_QWORD *)(v1 + 16);
  v7 = *(_QWORD *)(v1 + 24);
  v8 = v1 + v5;
  v9 = *(_QWORD *)(v1 + ((*(_QWORD *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFF8));
  v10 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v10;
  *v10 = v2;
  v10[1] = sub_23A8C8720;
  return sub_23A8B7C08(a1, v6, v7, v8, v9);
}

uint64_t sub_23A8C7150()
{
  return objectdestroy_90Tm(&qword_2542D8D18);
}

uint64_t sub_23A8C715C(uint64_t a1)
{
  return sub_23A8C6910(a1, &qword_2542D8D18, (uint64_t)"Deletion of Site failed. %s", (uint64_t)&qword_2542D8D18, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_23A8B7F1C);
}

uint64_t sub_23A8C717C()
{
  return objectdestroyTm(&qword_2569C8870);
}

uint64_t sub_23A8C7188(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;

  v4 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2569C8870) - 8);
  v5 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v6 = *(_QWORD *)(v1 + 16);
  v7 = *(_QWORD *)(v1 + 24);
  v8 = v1 + v5;
  v9 = *(_QWORD *)(v1 + ((*(_QWORD *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFF8));
  v10 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v10;
  *v10 = v2;
  v10[1] = sub_23A8C8720;
  return sub_23A8B6200(a1, v6, v7, v8, v9);
}

uint64_t sub_23A8C7230()
{
  return objectdestroy_90Tm(&qword_2569C8870);
}

uint64_t sub_23A8C723C(uint64_t a1)
{
  return sub_23A8C6910(a1, &qword_2569C8870, 0xD000000000000019, 0x800000023A8F35F0, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_23A8B6564);
}

uint64_t sub_23A8C7268()
{
  return objectdestroyTm(&qword_2569C8870);
}

uint64_t objectdestroyTm(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;

  v2 = __swift_instantiateConcreteTypeFromMangledName(a1);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  swift_unknownObjectRelease();
  (*(void (**)(unint64_t, uint64_t))(v3 + 8))(v1 + v4, v2);
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23A8C7300(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;

  v4 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2569C8870) - 8);
  v5 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v6 = *(_QWORD *)(v1 + 16);
  v7 = *(_QWORD *)(v1 + 24);
  v8 = v1 + v5;
  v9 = *(_QWORD *)(v1 + ((*(_QWORD *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFF8));
  v10 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v10;
  *v10 = v2;
  v10[1] = sub_23A8C8720;
  return sub_23A8B5E54(a1, v6, v7, v8, v9);
}

uint64_t sub_23A8C73A8()
{
  return objectdestroy_90Tm(&qword_2569C8870);
}

uint64_t sub_23A8C73B4(uint64_t a1)
{
  return sub_23A8C6910(a1, &qword_2569C8870, 0xD00000000000001BLL, 0x800000023A8F35D0, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_23A8B6564);
}

uint64_t sub_23A8C73E0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v8;
  uint64_t v9;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569C8870);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v8 = (((((((*(_QWORD *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8)
      + 23) & 0xFFFFFFFFFFFFFFF8;
  v4 = sub_23A8F0CA4();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = (*(unsigned __int8 *)(v5 + 80) + v8 + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  v9 = v4;
  swift_unknownObjectRelease();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(unint64_t, uint64_t))(v5 + 8))(v0 + v6, v9);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_23A8C754C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  _QWORD *v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v2 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2569C8870) - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = (*(_QWORD *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  v5 = (v4 + 15) & 0xFFFFFFFFFFFFFFF8;
  sub_23A8F0CA4();
  v13 = *(_QWORD *)(v1 + v4);
  v8 = *(_QWORD *)(v1 + 16);
  v9 = *(_QWORD *)(v1 + 24);
  v10 = *(_QWORD *)(v1 + v5);
  v11 = *(_QWORD *)(v1 + ((v5 + 23) & 0xFFFFFFFFFFFFFFF8));
  v12 = *(_QWORD *)(v1 + v5 + 8);
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v14 + 16) = v6;
  *v6 = v14;
  v6[1] = sub_23A8C8720;
  return sub_23A8B57FC(a1, v8, v9, v1 + v3, v13, v10, v12, v11);
}

uint64_t sub_23A8C76B8()
{
  return objectdestroy_90Tm(&qword_2569C8870);
}

uint64_t sub_23A8C76C4(uint64_t a1)
{
  return sub_23A8C6910(a1, &qword_2569C8870, 0xD000000000000086, 0x800000023A8F3540, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_23A8B6564);
}

uint64_t sub_23A8C76F0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v8;
  uint64_t v9;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569C8870);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v8 = (((((((*(_QWORD *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8)
      + 23) & 0xFFFFFFFFFFFFFFF8;
  v4 = sub_23A8F0CA4();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = (*(unsigned __int8 *)(v5 + 80) + v8 + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  v9 = v4;
  swift_unknownObjectRelease();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(unint64_t, uint64_t))(v5 + 8))(v0 + v6, v9);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_23A8C7840(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v3 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2569C8870) - 8);
  v4 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v5 = (*(_QWORD *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  v6 = (v5 + 15) & 0xFFFFFFFFFFFFFFF8;
  sub_23A8F0CA4();
  v14 = *(_QWORD *)(v1 + 16);
  v13 = *(_QWORD *)(v1 + 24);
  v12 = *(_QWORD *)(v1 + v5);
  v10 = *(_QWORD *)(v1 + v6 + 8);
  v11 = *(_QWORD *)(v1 + v6);
  v7 = *(_QWORD *)(v1 + ((v6 + 23) & 0xFFFFFFFFFFFFFFF8));
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v8;
  *v8 = v2;
  v8[1] = sub_23A8C8720;
  return sub_23A8B4C5C(a1, v14, v13, v1 + v4, v12, v11, v10, v7);
}

uint64_t sub_23A8C7998()
{
  return objectdestroy_90Tm(&qword_2569C8870);
}

uint64_t sub_23A8C79A4(uint64_t a1)
{
  return sub_23A8C6910(a1, &qword_2569C8870, 0xD00000000000007ELL, 0x800000023A8F34C0, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_23A8B6564);
}

uint64_t sub_23A8C79D0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569C8870);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_unknownObjectRelease();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_23A8C7AC8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v3 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2569C8870) - 8);
  v4 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v5 = (*(_QWORD *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  v6 = (v5 + 15) & 0xFFFFFFFFFFFFFFF8;
  v14 = *(_QWORD *)(v1 + 24);
  v15 = *(_QWORD *)(v1 + 16);
  v13 = v1 + v4;
  v7 = *(_QWORD *)(v1 + v5);
  v8 = *(_QWORD *)(v1 + v6);
  v9 = *(_QWORD *)(v1 + v6 + 8);
  v10 = *(_QWORD *)(v1 + ((v6 + 23) & 0xFFFFFFFFFFFFFFF8));
  v11 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v11;
  *v11 = v2;
  v11[1] = sub_23A8C8720;
  return sub_23A8B4154(a1, v15, v14, v13, v7, v8, v9, v10);
}

uint64_t sub_23A8C7BE0()
{
  return objectdestroy_90Tm(&qword_2569C8870);
}

uint64_t sub_23A8C7BEC(uint64_t a1)
{
  return sub_23A8C6910(a1, &qword_2569C8870, 0xD000000000000050, 0x800000023A8F3460, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_23A8B6564);
}

uint64_t sub_23A8C7C18()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569C8870);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v9 = (((((((((((((((((((((*(_QWORD *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8)
                    + 23) & 0xFFFFFFFFFFFFFFF8)
                  + 23) & 0xFFFFFFFFFFFFFFF8)
                + 23) & 0xFFFFFFFFFFFFFFF8)
              + 23) & 0xFFFFFFFFFFFFFFF8)
            + 23) & 0xFFFFFFFFFFFFFFF8)
          + 23) & 0xFFFFFFFFFFFFFFF8)
        + 23) & 0xFFFFFFFFFFFFFFF8)
      + 23) & 0xFFFFFFFFFFFFFFF8;
  v4 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2542D8CF8) - 8);
  v5 = (*(unsigned __int8 *)(v4 + 80) + v9 + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  swift_unknownObjectRelease();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v6 = sub_23A8F0CA4();
  v7 = *(_QWORD *)(v6 - 8);
  if (!(*(unsigned int (**)(unint64_t, uint64_t, uint64_t))(v7 + 48))(v0 + v5, 1, v6))
    (*(void (**)(unint64_t, uint64_t))(v7 + 8))(v0 + v5, v6);
  return swift_deallocObject();
}

uint64_t sub_23A8C7E20(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_23A8C7E64(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  _QWORD *v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v2 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2569C8870) - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = (*(_QWORD *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  v5 = (v4 + 15) & 0xFFFFFFFFFFFFFFF8;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2542D8CF8);
  v12 = *(_QWORD *)(v1 + 24);
  v13 = *(_QWORD *)(v1 + 16);
  v11 = *(_QWORD *)(v1 + v4);
  v9 = *(_QWORD *)(v1 + v5 + 8);
  v10 = *(_QWORD *)(v1 + v5);
  v8 = *(_QWORD *)(v1 + ((v5 + 23) & 0xFFFFFFFFFFFFFFF8));
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v14 + 16) = v6;
  *v6 = v14;
  v6[1] = sub_23A8C8720;
  return sub_23A8B3498(a1, v13, v12, v1 + v3, v11, v10, v9, v8);
}

uint64_t sub_23A8C8080()
{
  return objectdestroy_90Tm(&qword_2569C8870);
}

uint64_t sub_23A8C808C(uint64_t a1)
{
  return sub_23A8C6910(a1, &qword_2569C8870, 0xD0000000000000B6, 0x800000023A8F33A0, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_23A8B6564);
}

uint64_t sub_23A8C80B8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569C8870);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_unknownObjectRelease();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  swift_release();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_23A8C815C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;

  v4 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2569C8870) - 8);
  v5 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v6 = (*(_QWORD *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8;
  v7 = *(_QWORD *)(v1 + 16);
  v8 = *(_QWORD *)(v1 + 24);
  v9 = v1 + v5;
  v10 = *(_QWORD *)(v1 + v6);
  v11 = *(_QWORD *)(v1 + ((v6 + 15) & 0xFFFFFFFFFFFFF8));
  v12 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v12;
  *v12 = v2;
  v12[1] = sub_23A8C8720;
  return sub_23A8B288C(a1, v7, v8, v9, v10, v11);
}

uint64_t sub_23A8C8214()
{
  return objectdestroy_90Tm(&qword_2569C8870);
}

uint64_t sub_23A8C8220(uint64_t a1)
{
  return sub_23A8C6910(a1, &qword_2569C8870, 0xD000000000000013, 0x800000023A8F3380, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_23A8B6564);
}

uint64_t sub_23A8C8250(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;

  v4 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2569C8870) - 8);
  v5 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v6 = (*(_QWORD *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8;
  v7 = *(_QWORD *)(v1 + 16);
  v8 = *(_QWORD *)(v1 + 24);
  v9 = *(_QWORD *)(v1 + v6);
  v10 = v1 + v5;
  v11 = (uint64_t *)(v1 + ((v6 + 15) & 0xFFFFFFFFFFFFFFF8));
  v12 = *v11;
  v13 = v11[1];
  v14 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v14;
  *v14 = v2;
  v14[1] = sub_23A8C4ED0;
  return sub_23A8B1FEC(a1, v7, v8, v10, v9, v12, v13);
}

uint64_t sub_23A8C8318()
{
  return objectdestroy_90Tm(&qword_2569C8870);
}

uint64_t sub_23A8C8324(uint64_t a1)
{
  return sub_23A8C6910(a1, &qword_2569C8870, 0x7453657461647075, 0xEF293A5F28657461, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_23A8B6564);
}

uint64_t objectdestroy_196Tm()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569C8870);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_unknownObjectRelease();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  swift_release();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_23A8C8404(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;

  v4 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2569C8870) - 8);
  v5 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v6 = (*(_QWORD *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8;
  v7 = *(_QWORD *)(v1 + 16);
  v8 = *(_QWORD *)(v1 + 24);
  v9 = *(_QWORD *)(v1 + v6);
  v10 = v1 + v5;
  v11 = (uint64_t *)(v1 + ((v6 + 15) & 0xFFFFFFFFFFFFFFF8));
  v12 = *v11;
  v13 = v11[1];
  v14 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v14;
  *v14 = v2;
  v14[1] = sub_23A8C8720;
  return sub_23A8B184C(a1, v7, v8, v10, v9, v12, v13);
}

uint64_t sub_23A8C84CC()
{
  return objectdestroy_90Tm(&qword_2569C8870);
}

uint64_t sub_23A8C84D8(uint64_t a1)
{
  return sub_23A8C6910(a1, &qword_2569C8870, 0xD000000000000012, 0x800000023A8F3360, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_23A8B6564);
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

uint64_t sub_23A8C8524()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569C8870);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = (((*(_QWORD *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8;
  swift_unknownObjectRelease();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  swift_release();

  return swift_deallocObject();
}

uint64_t sub_23A8C85C8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;

  v4 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2569C8870) - 8);
  v5 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v6 = (*(_QWORD *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8;
  v7 = *(_QWORD *)(v1 + 16);
  v8 = *(_QWORD *)(v1 + 24);
  v9 = v1 + v5;
  v10 = *(_QWORD *)(v1 + v6);
  v11 = *(_QWORD *)(v1 + ((v6 + 15) & 0xFFFFFFFFFFFFF8));
  v12 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v12;
  *v12 = v2;
  v12[1] = sub_23A8C8720;
  return sub_23A8B0D28(a1, v7, v8, v9, v10, v11);
}

uint64_t sub_23A8C8680()
{
  return objectdestroy_90Tm(&qword_2569C8870);
}

uint64_t objectdestroy_90Tm(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(a1);
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1+ ((*(unsigned __int8 *)(*(_QWORD *)(v2 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v2 - 8) + 80)), v2);
  return swift_deallocObject();
}

uint64_t sub_23A8C86E8(uint64_t a1)
{
  return sub_23A8C6910(a1, &qword_2569C8870, 0xD000000000000012, 0x800000023A8F3340, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_23A8B6564);
}

uint64_t sub_23A8C8750()
{
  uint64_t v0;

  swift_beginAccess();
  return MEMORY[0x23B85B5B8](v0 + 16);
}

uint64_t sub_23A8C8794(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  swift_beginAccess();
  *(_QWORD *)(v2 + 24) = a2;
  swift_unknownObjectWeakAssign();
  return swift_unknownObjectRelease();
}

void (*sub_23A8C87F4(_QWORD *a1))(uint64_t a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;

  v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[5] = v1;
  swift_beginAccess();
  v4 = MEMORY[0x23B85B5B8](v1 + 16);
  v5 = *(_QWORD *)(v1 + 24);
  v3[3] = v4;
  v3[4] = v5;
  return sub_23A8C8860;
}

void sub_23A8C8860(uint64_t a1, char a2)
{
  void *v3;

  v3 = *(void **)a1;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)a1 + 40) + 24) = *(_QWORD *)(*(_QWORD *)a1 + 32);
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

_QWORD *EnergyKitManager.__allocating_init(delegate:queue:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v5;

  v5 = (_QWORD *)swift_allocObject();
  v5[3] = 0;
  swift_unknownObjectWeakInit();
  v5[4] = objc_msgSend((id)objc_opt_self(), sel_defaultCenter);
  swift_beginAccess();
  v5[3] = a2;
  swift_unknownObjectWeakAssign();
  v5[5] = a3;
  sub_23A8C8A50();
  swift_unknownObjectRelease();
  return v5;
}

_QWORD *EnergyKitManager.init(delegate:queue:)(uint64_t a1, uint64_t a2, void *a3)
{
  _QWORD *v3;
  id v6;

  v3[3] = 0;
  swift_unknownObjectWeakInit();
  v3[4] = objc_msgSend((id)objc_opt_self(), sel_defaultCenter);
  swift_beginAccess();
  v3[3] = a2;
  swift_unknownObjectWeakAssign();
  v3[5] = a3;
  v6 = a3;
  sub_23A8C8A50();
  swift_unknownObjectRelease();

  return v3;
}

void sub_23A8C8A50()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  id v6;
  _QWORD v7[5];
  uint64_t v8;

  sub_23A8F0DF4();
  v1 = (void *)sub_23A8F1130();
  swift_bridgeObjectRelease();
  v2 = *(void **)(v0 + 32);
  v3 = *(_QWORD *)(v0 + 40);
  v7[4] = sub_23A8C997C;
  v8 = v0;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 1107296256;
  v7[2] = sub_23A8D11DC;
  v7[3] = &block_descriptor_7;
  v4 = _Block_copy(v7);
  v5 = v1;
  swift_retain();
  swift_release();
  v6 = objc_msgSend(v2, sel_addObserverForName_object_queue_usingBlock_, v5, 0, v3, v4);
  _Block_release(v4);
  swift_unknownObjectRelease();

}

uint64_t sub_23A8C8B40(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t ObjectType;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  uint64_t result;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;

  v3 = sub_23A8F0C08();
  if (!v3)
  {
    v22 = 0u;
    v23 = 0u;
LABEL_11:
    sub_23A8C999C((uint64_t)&v22);
    goto LABEL_12;
  }
  v4 = v3;
  sub_23A8F0DB8();
  sub_23A8F1304();
  if (*(_QWORD *)(v4 + 16) && (v5 = sub_23A8BFF40((uint64_t)&v20), (v6 & 1) != 0))
  {
    sub_23A8C44C0(*(_QWORD *)(v4 + 56) + 32 * v5, (uint64_t)&v22);
  }
  else
  {
    v22 = 0u;
    v23 = 0u;
  }
  swift_bridgeObjectRelease();
  sub_23A8C63A8((uint64_t)&v20);
  if (!*((_QWORD *)&v23 + 1))
    goto LABEL_11;
  if ((swift_dynamicCast() & 1) != 0)
  {
    v7 = v20;
    v8 = v21;
    swift_beginAccess();
    if (MEMORY[0x23B85B5B8](a2 + 16))
    {
      v9 = *(_QWORD *)(a2 + 24);
      ObjectType = swift_getObjectType();
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 8))(v7, v8, ObjectType, v9);
      swift_bridgeObjectRelease();
      swift_unknownObjectRelease();
    }
    else
    {
      swift_bridgeObjectRelease();
    }
  }
LABEL_12:
  v11 = sub_23A8F0C08();
  if (!v11)
  {
    v22 = 0u;
    v23 = 0u;
    return sub_23A8C999C((uint64_t)&v22);
  }
  v12 = v11;
  sub_23A8F0DC4();
  sub_23A8F1304();
  if (*(_QWORD *)(v12 + 16) && (v13 = sub_23A8BFF40((uint64_t)&v20), (v14 & 1) != 0))
  {
    sub_23A8C44C0(*(_QWORD *)(v12 + 56) + 32 * v13, (uint64_t)&v22);
  }
  else
  {
    v22 = 0u;
    v23 = 0u;
  }
  swift_bridgeObjectRelease();
  sub_23A8C63A8((uint64_t)&v20);
  if (!*((_QWORD *)&v23 + 1))
    return sub_23A8C999C((uint64_t)&v22);
  result = swift_dynamicCast();
  if ((result & 1) != 0)
  {
    v16 = v20;
    v17 = v21;
    swift_beginAccess();
    if (MEMORY[0x23B85B5B8](a2 + 16))
    {
      v18 = *(_QWORD *)(a2 + 24);
      v19 = swift_getObjectType();
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v18 + 16))(v16, v17, v19, v18);
      swift_bridgeObjectRelease();
      return swift_unknownObjectRelease();
    }
    else
    {
      return swift_bridgeObjectRelease();
    }
  }
  return result;
}

uint64_t static EnergyKitManager.energySiteIDs()()
{
  return swift_task_switch();
}

uint64_t sub_23A8C8DD4()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 24) = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2542D8D20);
  *v1 = v0;
  v1[1] = sub_23A8C8E6C;
  return sub_23A8F1400();
}

uint64_t sub_23A8C8E6C()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 32) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23A8C8ED0()
{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(_QWORD *)(v0 + 16));
}

uint64_t sub_23A8C8EDC(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v12;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569C8A00);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = *(_QWORD *)(v3 + 64);
  MEMORY[0x24BDAC7A8](v2);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542D8AC0);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_23A8F1208();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v7, 1, 1, v8);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))((char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v2);
  v9 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = 0;
  *(_QWORD *)(v10 + 24) = 0;
  (*(void (**)(unint64_t, char *, uint64_t))(v3 + 32))(v10 + v9, (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v2);
  sub_23A8B1124((uint64_t)v7, (uint64_t)&unk_2569C8A10, v10);
  return swift_release();
}

uint64_t sub_23A8C9014(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;

  v4[18] = a4;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569C8A00);
  v4[19] = v5;
  v6 = *(_QWORD *)(v5 - 8);
  v4[20] = v6;
  v4[21] = *(_QWORD *)(v6 + 64);
  v4[22] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23A8C907C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;

  v1 = v0[22];
  v2 = v0[19];
  v3 = v0[20];
  v4 = v0[18];
  type metadata accessor for HomeEnergyXPCConnection();
  swift_allocObject();
  v0[23] = sub_23A8EF888();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v1, v4, v2);
  v5 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v6 = swift_allocObject();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v3 + 32))(v6 + v5, v1, v2);
  v7 = (void *)sub_23A8EFE34((uint64_t)sub_23A8C993C, v6);
  v0[24] = v7;
  swift_release();
  v0[7] = v0 + 15;
  v0[2] = v0;
  v0[3] = sub_23A8C91CC;
  v8 = swift_continuation_init();
  v0[10] = MEMORY[0x24BDAC760];
  v0[11] = 0x40000000;
  v0[12] = sub_23A8C95C4;
  v0[13] = &block_descriptor_0;
  v0[14] = v8;
  objc_msgSend(v7, sel_getAllSiteIDsWithCompletionHandler_, v0 + 10);
  return swift_continuation_await();
}

uint64_t sub_23A8C91CC()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)v0 + 200) = *(_QWORD *)(*(_QWORD *)v0 + 48);
  return swift_task_switch();
}

uint64_t sub_23A8C922C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(v0 + 184);
  v2 = *(_QWORD *)(v0 + 120);
  swift_unknownObjectRelease();
  objc_msgSend(*(id *)(v1 + 16), sel_invalidate);
  *(_QWORD *)(v0 + 136) = v2;
  sub_23A8F11F0();
  swift_release();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23A8C929C()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 200);
  swift_willThrow();
  swift_release();
  swift_unknownObjectRelease();
  *(_QWORD *)(v0 + 128) = v1;
  sub_23A8F11E4();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23A8C9318(void *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  id v9;
  id v10;
  NSObject *v11;
  os_log_type_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  unint64_t v18;
  id v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v4 = sub_23A8F10A0();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2542D8828 != -1)
    swift_once();
  v8 = __swift_project_value_buffer(v4, (uint64_t)qword_2542D8DE0);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v8, v4);
  v9 = a1;
  v10 = a1;
  v11 = sub_23A8F1088();
  v12 = sub_23A8F1274();
  if (os_log_type_enabled(v11, v12))
  {
    v13 = swift_slowAlloc();
    v21 = a2;
    v14 = v13;
    v15 = swift_slowAlloc();
    v23 = v15;
    *(_DWORD *)v14 = 136315394;
    v22 = sub_23A8BF840(0x6953796772656E65, 0xEF29287344496574, &v23);
    sub_23A8F12A4();
    *(_WORD *)(v14 + 12) = 2080;
    v22 = (uint64_t)a1;
    v16 = a1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2542D8AE0);
    v17 = sub_23A8F1148();
    v22 = sub_23A8BF840(v17, v18, &v23);
    sub_23A8F12A4();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_23A8AD000, v11, v12, "%s error: %s", (uint8_t *)v14, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x23B85B51C](v15, -1, -1);
    MEMORY[0x23B85B51C](v14, -1, -1);
  }
  else
  {

  }
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  v23 = (uint64_t)a1;
  v19 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569C8A00);
  return sub_23A8F11E4();
}

uint64_t sub_23A8C95C4(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3;
  _QWORD *v5;
  id v6;

  if (a3)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2542D8AE0);
    swift_allocError();
    *v5 = a3;
    v6 = a3;
    return swift_continuation_throwingResumeWithError();
  }
  else
  {
    v3 = *(_QWORD *)(a1 + 32);
    **(_QWORD **)(*(_QWORD *)(v3 + 64) + 40) = sub_23A8F122C();
    return swift_continuation_throwingResume();
  }
}

uint64_t EnergyKitManager.deinit()
{
  uint64_t v0;

  sub_23A8C4688(v0 + 16);

  return v0;
}

uint64_t EnergyKitManager.__deallocating_deinit()
{
  uint64_t v0;

  sub_23A8C4688(v0 + 16);

  return swift_deallocClassInstance();
}

uint64_t sub_23A8C96C0@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
  uint64_t v6;

  v3 = *a1;
  v4 = *a1 + 16;
  swift_beginAccess();
  result = MEMORY[0x23B85B5B8](v4);
  v6 = *(_QWORD *)(v3 + 24);
  *a2 = result;
  a2[1] = v6;
  return result;
}

uint64_t sub_23A8C9718(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(a1 + 8);
  v3 = *a2;
  swift_beginAccess();
  *(_QWORD *)(v3 + 24) = v2;
  return swift_unknownObjectWeakAssign();
}

uint64_t dispatch thunk of EnergyKitManagerDelegate.energySiteAdded(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 8))();
}

uint64_t dispatch thunk of EnergyKitManagerDelegate.energySiteDeleted(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 16))();
}

uint64_t type metadata accessor for EnergyKitManager()
{
  return objc_opt_self();
}

uint64_t method lookup function for EnergyKitManager()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of EnergyKitManager.delegate.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 104))();
}

uint64_t dispatch thunk of EnergyKitManager.delegate.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 112))();
}

uint64_t dispatch thunk of EnergyKitManager.delegate.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 120))();
}

uint64_t dispatch thunk of EnergyKitManager.__allocating_init(delegate:queue:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 128))();
}

uint64_t sub_23A8C97D8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569C8A00);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_unknownObjectRelease();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  return swift_deallocObject();
}

uint64_t sub_23A8C9850(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v4 = *(unsigned __int8 *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2569C8A00) - 8) + 80);
  v5 = *(_QWORD *)(v1 + 16);
  v6 = *(_QWORD *)(v1 + 24);
  v7 = v1 + ((v4 + 32) & ~v4);
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v8;
  *v8 = v2;
  v8[1] = sub_23A8C4ED0;
  return sub_23A8C9014(a1, v5, v6, v7);
}

uint64_t sub_23A8C98D8()
{
  uint64_t v0;
  uint64_t v1;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569C8A00);
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)), v1);
  return swift_deallocObject();
}

uint64_t sub_23A8C993C(void *a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(unsigned __int8 *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2569C8A00) - 8) + 80);
  return sub_23A8C9318(a1, v1 + ((v3 + 16) & ~v3));
}

uint64_t sub_23A8C997C(uint64_t a1)
{
  uint64_t v1;

  return sub_23A8C8B40(a1, v1);
}

uint64_t block_copy_helper_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

uint64_t sub_23A8C999C(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542D8AE8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void defaultLogger(_:)(uint64_t a1)
{
  __asm { BR              X10 }
}

uint64_t sub_23A8C9A10()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  if (qword_2569C8348 != -1)
    swift_once();
  v1 = sub_23A8F10A0();
  v2 = __swift_project_value_buffer(v1, (uint64_t)qword_2569C9AE8);
  swift_beginAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 16))(v0, v2, v1);
}

uint64_t sub_23A8C9B50()
{
  uint64_t result;

  sub_23A8CA46C();
  result = sub_23A8F1298();
  qword_2569C9AE0 = result;
  return result;
}

uint64_t sub_23A8C9BA8(uint64_t a1)
{
  return sub_23A8C9FA8(a1, qword_2569C9AE8);
}

uint64_t sub_23A8C9BC4(uint64_t a1)
{
  return sub_23A8C9FA8(a1, qword_2542D8DE0);
}

uint64_t sub_23A8C9BF0(uint64_t a1)
{
  return sub_23A8C9FA8(a1, qword_2569C9B00);
}

uint64_t sub_23A8C9C0C(uint64_t a1)
{
  return sub_23A8C9FA8(a1, qword_2569C9B18);
}

uint64_t sub_23A8C9C30()
{
  uint64_t v0;

  v0 = sub_23A8F107C();
  __swift_allocate_value_buffer(v0, qword_2569C9B30);
  __swift_project_value_buffer(v0, (uint64_t)qword_2569C9B30);
  return sub_23A8F1070();
}

uint64_t Logging.description.getter()
{
  char *v0;

  return *(_QWORD *)&aShared_0[8 * *v0];
}

EnergyKit::Logging_optional __swiftcall Logging.init(rawValue:)(Swift::Int rawValue)
{
  char *v1;
  char v2;

  v2 = 4;
  if ((unint64_t)rawValue < 4)
    v2 = rawValue;
  *v1 = v2;
  return (EnergyKit::Logging_optional)rawValue;
}

uint64_t Logging.rawValue.getter()
{
  unsigned __int8 *v0;

  return *v0;
}

EnergyKit::Logging_optional sub_23A8C9CE8(Swift::Int *a1)
{
  return Logging.init(rawValue:)(*a1);
}

void sub_23A8C9CF0(_QWORD *a1@<X8>)
{
  unsigned __int8 *v1;

  *a1 = *v1;
}

void setDefaultLog(_:)(void *a1)
{
  id v2;
  id v3;

  if (qword_2569C8340 != -1)
    swift_once();
  v3 = (id)qword_2569C9AE0;
  qword_2569C9AE0 = (uint64_t)a1;
  v2 = a1;

}

uint64_t setDefaultDaemonLogger(_:)(uint64_t a1)
{
  return sub_23A8C9D9C(a1, &qword_2569C8350, (uint64_t)qword_2569C9B00);
}

uint64_t setDefaultFrameworkLogger(_:)(uint64_t a1)
{
  return sub_23A8C9D9C(a1, &qword_2542D8828, (uint64_t)qword_2542D8DE0);
}

uint64_t sub_23A8C9D9C(uint64_t a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;

  if (*a2 != -1)
    swift_once();
  v5 = sub_23A8F10A0();
  v6 = __swift_project_value_buffer(v5, a3);
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 24))(v6, a1, v5);
  return swift_endAccess();
}

uint64_t setDefaultAnalyticsLogger(_:)(uint64_t a1)
{
  return sub_23A8C9D9C(a1, &qword_2569C8358, (uint64_t)qword_2569C9B18);
}

uint64_t setDefaultLogger(_:)(uint64_t a1)
{
  return sub_23A8C9D9C(a1, &qword_2569C8348, (uint64_t)qword_2569C9AE8);
}

id defaultLog()()
{
  if (qword_2569C8340 != -1)
    swift_once();
  return (id)qword_2569C9AE0;
}

Swift::Void __swiftcall setProcessName(_:)(Swift::String a1)
{
  xmmword_2569C8A18 = (__int128)a1;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
}

Swift::String_optional __swiftcall processName()()
{
  unsigned __int128 v0;
  uint64_t v1;
  void *v2;
  Swift::String_optional result;

  v0 = xmmword_2569C8A18;
  swift_bridgeObjectRetain();
  v2 = (void *)(v0 >> 64);
  v1 = v0;
  result.value._object = v2;
  result.value._countAndFlagsBits = v1;
  return result;
}

uint64_t ekSignposter()@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_2569C8360 != -1)
    swift_once();
  v2 = sub_23A8F107C();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_2569C9B30);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t sub_23A8C9F84(uint64_t a1)
{
  return sub_23A8C9FA8(a1, qword_2569C9B48);
}

uint64_t sub_23A8C9FA8(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_23A8F10A0();
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  return sub_23A8F1094();
}

Swift::Void __swiftcall logMilestone(tag:description:)(Swift::String tag, Swift::String description)
{
  void *object;
  uint64_t countAndFlagsBits;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  object = description._object;
  countAndFlagsBits = description._countAndFlagsBits;
  v4 = tag._object;
  v5 = tag._countAndFlagsBits;
  v6 = sub_23A8F10A0();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2569C8368 != -1)
    swift_once();
  v10 = __swift_project_value_buffer(v6, (uint64_t)qword_2569C9B48);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, v10, v6);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  v11 = sub_23A8F1088();
  v12 = sub_23A8F1268();
  if (os_log_type_enabled(v11, v12))
  {
    v13 = swift_slowAlloc();
    v16 = countAndFlagsBits;
    v14 = v13;
    v15 = swift_slowAlloc();
    v19 = v15;
    *(_DWORD *)v14 = 136315394;
    v17 = v7;
    swift_bridgeObjectRetain();
    v18 = sub_23A8BF840(v5, (unint64_t)v4, &v19);
    sub_23A8F12A4();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v14 + 12) = 2080;
    swift_bridgeObjectRetain();
    v18 = sub_23A8BF840(v16, (unint64_t)object, &v19);
    sub_23A8F12A4();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_23A8AD000, v11, v12, "(%s) %s", (uint8_t *)v14, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x23B85B51C](v15, -1, -1);
    MEMORY[0x23B85B51C](v14, -1, -1);

    (*(void (**)(char *, uint64_t))(v17 + 8))(v9, v6);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }
}

unint64_t sub_23A8CA28C()
{
  unint64_t result;

  result = qword_2569C8A28;
  if (!qword_2569C8A28)
  {
    result = MEMORY[0x23B85B498](&protocol conformance descriptor for Logging, &type metadata for Logging);
    atomic_store(result, (unint64_t *)&qword_2569C8A28);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for Logging(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for Logging(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23A8CA3AC + 4 * byte_23A8F1E11[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_23A8CA3E0 + 4 * byte_23A8F1E0C[v4]))();
}

uint64_t sub_23A8CA3E0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A8CA3E8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23A8CA3F0);
  return result;
}

uint64_t sub_23A8CA3FC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23A8CA404);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_23A8CA408(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A8CA410(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for Logging()
{
  return &type metadata for Logging;
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

unint64_t sub_23A8CA46C()
{
  unint64_t result;

  result = qword_2569C8A30;
  if (!qword_2569C8A30)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2569C8A30);
  }
  return result;
}

void EnergyTrends.interval.getter(_BYTE *a1@<X8>)
{
  _BYTE *v1;

  *a1 = *v1;
}

uint64_t EnergyTrends.usages.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t EnergyTrends.timeZone.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for EnergyTrends() + 24);
  v4 = sub_23A8F0D58();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t type metadata accessor for EnergyTrends()
{
  uint64_t result;

  result = qword_2542D8DD0;
  if (!qword_2542D8DD0)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t EnergyTrends.debugIdentifier.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for EnergyTrends() + 28));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t EnergyTrends.calendar.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for EnergyTrends() + 32);
  v4 = sub_23A8F0D34();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t EnergyTrends.calendar.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for EnergyTrends() + 32);
  v4 = sub_23A8F0D34();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(v3, a1, v4);
}

uint64_t (*EnergyTrends.calendar.modify())()
{
  type metadata accessor for EnergyTrends();
  return nullsub_1;
}

uint64_t EnergyTrends.init(response:timeZone:debugIdentifier:)@<X0>(_BYTE *a1@<X0>, char *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  int *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  char v21;
  void (*v22)(char *, uint64_t, uint64_t);
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  void (*v28)(char *, uint64_t);
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _BYTE *v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;

  v35 = a4;
  v37 = a3;
  v40 = a5;
  v41 = a2;
  v36 = sub_23A8F0CEC();
  v32 = *(_QWORD *)(v36 - 8);
  MEMORY[0x24BDAC7A8](v36);
  v7 = (char *)&v30 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_23A8F0D34();
  v38 = *(_QWORD *)(v8 - 8);
  v39 = v8;
  MEMORY[0x24BDAC7A8](v8);
  v34 = (char *)&v30 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = (int *)type metadata accessor for EnergyTrends();
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v30 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_23A8F0D58();
  v31 = *(_QWORD *)(v13 - 8);
  v14 = v31;
  v15 = MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v30 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v15);
  v19 = (char *)&v30 - v18;
  v20 = *(int *)(type metadata accessor for EnergySite.HistoricalEnergyUsage(0) + 24);
  v33 = a1;
  v30 = *(_QWORD *)&a1[v20];
  v21 = *a1;
  v22 = *(void (**)(char *, uint64_t, uint64_t))(v14 + 16);
  v22(v19, (uint64_t)v41, v13);
  *v12 = v21;
  v22(&v12[v10[6]], (uint64_t)v19, v13);
  v23 = &v12[v10[7]];
  v24 = v36;
  v25 = v35;
  *(_QWORD *)v23 = v37;
  *((_QWORD *)v23 + 1) = v25;
  v26 = v32;
  (*(void (**)(char *, _QWORD, uint64_t))(v32 + 104))(v7, *MEMORY[0x24BDCEF70], v24);
  swift_bridgeObjectRetain();
  v27 = v34;
  sub_23A8F0CF8();
  (*(void (**)(char *, uint64_t))(v26 + 8))(v7, v24);
  (*(void (**)(char *, char *, uint64_t))(v38 + 32))(&v12[v10[8]], v27, v39);
  v22(v17, (uint64_t)v19, v13);
  sub_23A8F0D1C();
  v28 = *(void (**)(char *, uint64_t))(v31 + 8);
  v28(v19, v13);
  *((_QWORD *)v12 + 1) = v30;
  sub_23A8C45C4((uint64_t)v12, v40, (uint64_t (*)(_QWORD))type metadata accessor for EnergyTrends);
  v28(v41, v13);
  return sub_23A8CEAEC((uint64_t)v33, type metadata accessor for EnergySite.HistoricalEnergyUsage);
}

uint64_t EnergyTrends.init(usages:interval:timeZone:debugIdentifier:)@<X0>(uint64_t a1@<X0>, _BYTE *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
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
  int *v18;
  void (*v19)(uint64_t, uint64_t, uint64_t);
  uint64_t v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t result;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;

  v28 = a4;
  v29 = a5;
  v27 = a3;
  v31 = a1;
  v8 = sub_23A8F0D58();
  v25 = *(_QWORD *)(v8 - 8);
  v9 = v25;
  MEMORY[0x24BDAC7A8](v8);
  v30 = (char *)&v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_23A8F0CEC();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v24 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = sub_23A8F0D34();
  v15 = *(_QWORD *)(v26 - 8);
  MEMORY[0x24BDAC7A8](v26);
  v17 = (char *)&v24 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_BYTE *)a6 = *a2;
  v18 = (int *)type metadata accessor for EnergyTrends();
  v19 = *(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 16);
  v20 = v27;
  v19(a6 + v18[6], v27, v8);
  v21 = (_QWORD *)(a6 + v18[7]);
  v22 = v29;
  *v21 = v28;
  v21[1] = v22;
  (*(void (**)(char *, _QWORD, uint64_t))(v12 + 104))(v14, *MEMORY[0x24BDCEF70], v11);
  sub_23A8F0CF8();
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  (*(void (**)(uint64_t, char *, uint64_t))(v15 + 32))(a6 + v18[8], v17, v26);
  v19((uint64_t)v30, v20, v8);
  sub_23A8F0D1C();
  result = (*(uint64_t (**)(uint64_t, uint64_t))(v25 + 8))(v20, v8);
  *(_QWORD *)(a6 + 8) = v31;
  return result;
}

uint64_t sub_23A8CAA8C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v8 = sub_23A8F0D28();
  v9 = MEMORY[0x24BDAC7A8](v8);
  MEMORY[0x24BDAC7A8](v9);
  if (a2)
    __asm { BR              X10 }
  v10 = sub_23A8F0CA4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(a4, a1, v10);
  v11 = sub_23A8F0CA4();
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(a4, 0, 1, v11);
}

void static EnergyTrends.displayIntervalToCalendarComponent(_:)(uint64_t a1)
{
  __asm { BR              X10 }
}

uint64_t sub_23A8CAD20()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *MEMORY[0x24BDCF250];
  v2 = sub_23A8F0D28();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 104))(v0, v1, v2);
}

double EnergyTrends.dailyAverageChangeForInterval(starting:)(uint64_t a1)
{
  char *v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  double v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  uint64_t v15;
  char v16;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569C8530);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = *v1;
  v6 = type metadata accessor for EnergyTrends();
  static EnergyTrends.intervalDateRangeStartingAt(_:displayInterval:with:)(a1, &v16, (uint64_t)&v1[*(int *)(v6 + 32)], (uint64_t)v5);
  EnergyTrends.totalImportsForDateRange(_:)((uint64_t)v5);
  v8 = v7;
  v10 = v9;
  EnergyTrends.totalExportsForDateRange(_:)((uint64_t)v5);
  v12 = v11;
  sub_23A8C64C8((uint64_t)v5, &qword_2569C8530);
  if (v10)
    v13 = (v8 - v12) / (double)v10;
  else
    v13 = 0.0;
  return v13 - EnergyTrends.previousDailyAverageImportsForInterval(starting:)();
}

uint64_t EnergyTrends.calculateDeltaNetImports(startDate:)(uint64_t a1)
{
  return sub_23A8CF1E4(a1, (void (*)(char *))EnergyTrends.totalImportsForDateRange(_:), (void (*)(char *))EnergyTrends.totalExportsForDateRange(_:), (double (*)(uint64_t))EnergyTrends.previousDailyAverageImportsForInterval(starting:));
}

double EnergyTrends.dailyAveragePercentageChangeForInterval(starting:)(uint64_t a1)
{
  uint64_t v1;

  EnergyTrends.calculatedAvgIntervalNetImportPercentChange(startDate:)(a1);
  return (double)v1;
}

void EnergyTrends.calculatedAvgIntervalNetImportPercentChange(startDate:)(uint64_t a1)
{
  char *v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  double v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  uint64_t v16;
  char v17;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569C8530);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = *v1;
  v6 = type metadata accessor for EnergyTrends();
  static EnergyTrends.intervalDateRangeStartingAt(_:displayInterval:with:)(a1, &v17, (uint64_t)&v1[*(int *)(v6 + 32)], (uint64_t)v5);
  EnergyTrends.totalImportsForDateRange(_:)((uint64_t)v5);
  v8 = v7;
  v10 = v9;
  EnergyTrends.totalExportsForDateRange(_:)((uint64_t)v5);
  v12 = v11;
  sub_23A8C64C8((uint64_t)v5, &qword_2569C8530);
  if (v10)
    v13 = (v8 - v12) / (double)v10;
  else
    v13 = 0.0;
  v14 = EnergyTrends.previousDailyAverageImportsForInterval(starting:)();
  if (v14 != 0.0)
  {
    v15 = rint((v13 / v14 + -1.0) * 100.0);
    if ((~*(_QWORD *)&v15 & 0x7FF0000000000000) != 0)
    {
      if (v15 > -9.22337204e18)
      {
        if (v15 < 9.22337204e18)
          return;
LABEL_12:
        __break(1u);
        return;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_12;
  }
}

void EnergyTrends.adjustRequestedDateForAvailableData(from:)(uint64_t a1@<X0>, uint64_t a2@<X8>)
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
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
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
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  char *v52;
  uint64_t v53;
  void (*v54)(void);
  uint64_t v55;
  uint64_t v56;
  void (*v57)(_QWORD, uint64_t, uint64_t);
  NSObject *v58;
  os_log_type_t v59;
  _BOOL4 v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t *v63;
  uint64_t v64;
  unint64_t v65;
  uint64_t v66;
  unint64_t v67;
  uint64_t v68;
  uint64_t v69;
  void (*v70)(_QWORD, _QWORD);
  uint64_t v71;
  char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  char *v77;
  void (*v78)(void);
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  char *v84;
  char *v85;
  NSObject *v86;
  os_log_type_t v87;
  int v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t *v91;
  uint64_t v92;
  unint64_t v93;
  uint64_t v94;
  unint64_t v95;
  char *v96;
  void (*v97)(char *, uint64_t);
  char *v98;
  char *v99;
  uint64_t v100;
  unint64_t v101;
  uint64_t v102;
  __int128 v103;
  void (*v104)(char *, uint64_t);
  _QWORD v105[5];
  uint64_t v106;
  uint64_t v107;
  char *v108;
  __int128 v109;
  uint64_t *v110;
  uint64_t v111;
  char *v112;
  char *v113;
  char *v114;
  char *v115;
  char *v116;
  char *v117;
  char *v118;
  void (*v119)(_QWORD, _QWORD);
  void (*v120)(_QWORD, uint64_t, uint64_t);
  uint64_t v121;
  uint64_t v122;
  void (*v123)(char *, uint64_t);
  char *v124;
  uint64_t v125;
  void (*v126)(void);
  uint64_t v127;
  uint64_t v128;
  char *v129;
  char *v130;
  uint64_t v131;
  uint64_t v132;
  char *v133;
  char *v134;
  char *v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139[7];

  v105[4] = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569C8530);
  v4 = MEMORY[0x24BDAC7A8](v3);
  v114 = (char *)v105 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v118 = (char *)v105 - v7;
  MEMORY[0x24BDAC7A8](v6);
  v130 = (char *)v105 - v8;
  v9 = type metadata accessor for EnergySite.EnergyUsage(0);
  v110 = *(uint64_t **)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v128 = (uint64_t)v105 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542D8CF8);
  v12 = MEMORY[0x24BDAC7A8](v11);
  v113 = (char *)v105 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v132 = (uint64_t)v105 - v14;
  v111 = type metadata accessor for EnergyTrends();
  v15 = MEMORY[0x24BDAC7A8](v111);
  v17 = (char *)v105 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = MEMORY[0x24BDAC7A8](v15);
  v117 = (char *)v105 - v19;
  v20 = MEMORY[0x24BDAC7A8](v18);
  v107 = (uint64_t)v105 - v21;
  MEMORY[0x24BDAC7A8](v20);
  v23 = (char *)v105 - v22;
  v24 = sub_23A8F10A0();
  v136 = *(_QWORD *)(v24 - 8);
  v25 = MEMORY[0x24BDAC7A8](v24);
  v27 = (char *)v105 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28 = MEMORY[0x24BDAC7A8](v25);
  v129 = (char *)v105 - v29;
  v30 = MEMORY[0x24BDAC7A8](v28);
  *(_QWORD *)&v109 = (char *)v105 - v31;
  MEMORY[0x24BDAC7A8](v30);
  v134 = (char *)v105 - v32;
  v33 = sub_23A8F0CA4();
  v34 = MEMORY[0x24BDAC7A8](v33);
  v105[2] = (char *)v105 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
  v36 = MEMORY[0x24BDAC7A8](v34);
  v112 = (char *)v105 - v37;
  v38 = MEMORY[0x24BDAC7A8](v36);
  v116 = (char *)v105 - v39;
  v40 = MEMORY[0x24BDAC7A8](v38);
  v115 = (char *)v105 - v41;
  v42 = MEMORY[0x24BDAC7A8](v40);
  v135 = (char *)v105 - v43;
  v44 = MEMORY[0x24BDAC7A8](v42);
  v108 = (char *)v105 - v45;
  v46 = MEMORY[0x24BDAC7A8](v44);
  v105[0] = (char *)v105 - v47;
  v48 = MEMORY[0x24BDAC7A8](v46);
  v133 = (char *)v105 - v49;
  v50 = MEMORY[0x24BDAC7A8](v48);
  v52 = (char *)v105 - v51;
  MEMORY[0x24BDAC7A8](v50);
  v122 = v53;
  v54 = *(void (**)(void))(v53 + 16);
  v124 = (char *)v105 - v55;
  v54();
  v139[6] = 0;
  if (qword_2542D8828 != -1)
    swift_once();
  v56 = __swift_project_value_buffer(v24, (uint64_t)qword_2542D8DE0);
  swift_beginAccess();
  v57 = *(void (**)(_QWORD, uint64_t, uint64_t))(v136 + 16);
  v121 = v56;
  v120 = v57;
  v57(v134, v56, v24);
  sub_23A8CEAA8(v127, (uint64_t)v23, (uint64_t (*)(_QWORD))type metadata accessor for EnergyTrends);
  v126 = v54;
  ((void (*)(char *, uint64_t, uint64_t))v54)(v52, a1, v33);
  v58 = sub_23A8F1088();
  v59 = sub_23A8F1280();
  v60 = os_log_type_enabled(v58, v59);
  v106 = a1;
  v61 = MEMORY[0x24BEE4AD8];
  v125 = v33;
  v105[3] = v27;
  v105[1] = v17;
  if (v60)
  {
    v62 = swift_slowAlloc();
    v119 = (void (*)(_QWORD, _QWORD))swift_slowAlloc();
    v139[0] = (uint64_t)v119;
    *(_DWORD *)v62 = 136315650;
    v138 = sub_23A8BF840(0xD00000000000002ALL, 0x800000023A8F3C40, v139);
    sub_23A8F12A4();
    *(_WORD *)(v62 + 12) = 2080;
    v63 = (uint64_t *)&v23[*(int *)(v111 + 28)];
    v64 = *v63;
    v65 = v63[1];
    swift_bridgeObjectRetain();
    v138 = sub_23A8BF840(v64, v65, v139);
    sub_23A8F12A4();
    swift_bridgeObjectRelease();
    sub_23A8CEAEC((uint64_t)v23, (uint64_t (*)(_QWORD))type metadata accessor for EnergyTrends);
    *(_WORD *)(v62 + 22) = 2080;
    v66 = sub_23A8F0C8C();
    v138 = sub_23A8BF840(v66, v67, v139);
    sub_23A8F12A4();
    swift_bridgeObjectRelease();
    v68 = v122;
    v123 = *(void (**)(char *, uint64_t))(v122 + 8);
    v123(v52, v125);
    _os_log_impl(&dword_23A8AD000, v58, v59, "%s (%s) looking for data in interval containing %s", (uint8_t *)v62, 0x20u);
    v69 = MEMORY[0x24BEE4AD8];
    v70 = v119;
    swift_arrayDestroy();
    MEMORY[0x23B85B51C](v70, -1, -1);
    v33 = v125;
    MEMORY[0x23B85B51C](v62, -1, -1);

    v119 = *(void (**)(_QWORD, _QWORD))(v136 + 8);
    v119(v134, v24);
    v71 = v24;
  }
  else
  {
    sub_23A8CEAEC((uint64_t)v23, (uint64_t (*)(_QWORD))type metadata accessor for EnergyTrends);
    v68 = v122;
    v123 = *(void (**)(char *, uint64_t))(v122 + 8);
    v123(v52, v33);

    v119 = *(void (**)(_QWORD, _QWORD))(v136 + 8);
    v119(v134, v24);
    v71 = v24;
    v69 = v61;
  }
  v73 = v132;
  v72 = v133;
  v74 = v127;
  v75 = *(_QWORD *)(v127 + 8);
  v76 = *(_QWORD *)(v75 + 16);
  v131 = v71;
  v77 = v124;
  v78 = v126;
  if (v76)
  {
    v79 = v128;
    sub_23A8CEAA8(v75 + ((*((unsigned __int8 *)v110 + 80) + 32) & ~(unint64_t)*((unsigned __int8 *)v110 + 80)), v128, type metadata accessor for EnergySite.EnergyUsage);
    ((void (*)(uint64_t, uint64_t, uint64_t))v78)(v73, v79, v33);
    v80 = v122;
    sub_23A8CEAEC(v79, type metadata accessor for EnergySite.EnergyUsage);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v80 + 56))(v73, 0, 1, v33);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v80 + 48))(v73, 1, v33) != 1)
    {
      (*(void (**)(char *, uint64_t, uint64_t))(v80 + 32))(v72, v73, v33);
      v81 = v106;
      if ((sub_23A8F0C50() & 1) != 0)
      {
        v82 = v109;
        v120(v109, v121, v71);
        v83 = v107;
        sub_23A8CEAA8(v74, v107, (uint64_t (*)(_QWORD))type metadata accessor for EnergyTrends);
        v84 = (char *)v105[0];
        ((void (*)(_QWORD, uint64_t, uint64_t))v78)(v105[0], v81, v33);
        v85 = v108;
        ((void (*)(char *, char *, uint64_t))v78)(v108, v72, v33);
        v86 = sub_23A8F1088();
        v87 = sub_23A8F1280();
        v88 = v87;
        if (os_log_type_enabled(v86, v87))
        {
          v89 = v83;
          v90 = swift_slowAlloc();
          v136 = swift_slowAlloc();
          v139[0] = v136;
          *(_DWORD *)v90 = 136315906;
          v138 = sub_23A8BF840(0xD00000000000002ALL, 0x800000023A8F3C40, v139);
          sub_23A8F12A4();
          *(_WORD *)(v90 + 12) = 2080;
          v91 = (uint64_t *)(v89 + *(int *)(v111 + 28));
          v92 = *v91;
          v93 = v91[1];
          swift_bridgeObjectRetain();
          v138 = sub_23A8BF840(v92, v93, v139);
          sub_23A8F12A4();
          swift_bridgeObjectRelease();
          sub_23A8CEAEC(v89, (uint64_t (*)(_QWORD))type metadata accessor for EnergyTrends);
          *(_WORD *)(v90 + 22) = 2080;
          v94 = sub_23A8F0C8C();
          v138 = sub_23A8BF840(v94, v95, v139);
          sub_23A8F12A4();
          swift_bridgeObjectRelease();
          v96 = v84;
          v97 = v123;
          v123(v96, v125);
          *(_WORD *)(v90 + 32) = 2080;
          v98 = v124;
          LODWORD(v134) = v88;
          v99 = v108;
          v100 = sub_23A8F0C8C();
          v138 = sub_23A8BF840(v100, v101, v139);
          v69 = MEMORY[0x24BEE4AD8];
          v33 = v125;
          sub_23A8F12A4();
          swift_bridgeObjectRelease();
          v97(v99, v33);
          _os_log_impl(&dword_23A8AD000, v86, (os_log_type_t)v134, "%s (%s) requested date %s is before snapshot start, pinning to snapshot start: %s", (uint8_t *)v90, 0x2Au);
          v102 = v136;
          swift_arrayDestroy();
          MEMORY[0x23B85B51C](v102, -1, -1);
          MEMORY[0x23B85B51C](v90, -1, -1);

          v119(v109, v131);
        }
        else
        {
          sub_23A8CEAEC(v83, (uint64_t (*)(_QWORD))type metadata accessor for EnergyTrends);
          v104 = v123;
          v123(v84, v33);
          v104(v85, v33);

          v119(v82, v71);
          v98 = v124;
        }
        (*(void (**)(char *, char *, uint64_t))(v122 + 40))(v98, v133, v33);
        v78 = v126;
        v77 = v98;
      }
      else
      {
        v123(v72, v33);
      }
LABEL_13:
      v134 = (char *)(v74 + *(int *)(v111 + 32));
      swift_beginAccess();
      swift_beginAccess();
      v136 = 0;
      v110 = &v137;
      *(_QWORD *)&v103 = 136316162;
      v109 = v103;
      v105[0] = "com.apple.EnergyKit";
      v108 = (char *)0x800000023A8F3C40;
      v107 = v69 + 8;
      v132 = -11;
      ((void (*)(char *, char *, uint64_t))v78)(v135, v77, v33);
      __asm { BR              X8 }
    }
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v68 + 56))(v132, 1, 1, v33);
  }
  sub_23A8C64C8(v73, &qword_2542D8CF8);
  goto LABEL_13;
}

void EnergyTrends.intervalDateRangeContaining(_:)()
{
  unsigned __int8 *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = sub_23A8F0CA4();
  v2 = MEMORY[0x24BDAC7A8](v1);
  MEMORY[0x24BDAC7A8](v2);
  v3 = *v0;
  type metadata accessor for EnergyTrends();
  __asm { BR              X9 }
}

uint64_t sub_23A8CC5A4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;

  sub_23A8F0D04();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 32))(v2, v3, v0);
  *(_BYTE *)(v7 - 81) = v6;
  static EnergyTrends.intervalDateRangeStartingAt(_:displayInterval:with:)(v2, (_BYTE *)(v7 - 81), v4, v1);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(v2, v0);
}

uint64_t EnergyTrends.usagesIn(_:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD v4[4];

  v2 = *(_QWORD *)(v1 + 8);
  v4[2] = a1;
  swift_bridgeObjectRetain();
  return sub_23A8CD8B4((uint64_t (*)(char *))sub_23A8D11C4, (uint64_t)v4, v2);
}

uint64_t static EnergyTrends.startOfSubinterval(for:displayInterval:with:)@<X0>(uint64_t a1@<X0>, char *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  int v13;
  void (*v15)(char *, uint64_t);
  uint64_t v16;
  uint64_t v17;

  v6 = sub_23A8F0D28();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v17 - v11;
  (*(void (**)(char *, _QWORD, uint64_t))(v7 + 104))((char *)&v17 - v11, **((unsigned int **)&unk_250BB55C0 + *a2), v6);
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v10, v12, v6);
  v13 = (*(uint64_t (**)(char *, uint64_t))(v7 + 88))(v10, v6);
  if (v13 == *MEMORY[0x24BDCF250])
  {
    sub_23A8F0FE0();
  }
  else if (v13 == *MEMORY[0x24BDCF220])
  {
    sub_23A8F0D04();
  }
  else if (v13 == *MEMORY[0x24BDCF230])
  {
    sub_23A8F0FC8();
  }
  else
  {
    if (v13 != *MEMORY[0x24BDCF1E8])
    {
      v15 = *(void (**)(char *, uint64_t))(v7 + 8);
      v15(v12, v6);
      v16 = sub_23A8F0CA4();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 16))(a3, a1, v16);
      return ((uint64_t (*)(char *, uint64_t))v15)(v10, v6);
    }
    sub_23A8F1004();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v12, v6);
}

uint64_t static EnergyTrends.roundToStartOfSubinterval(date:displayInterval:with:)@<X0>(char *a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v5;
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
  char v16;
  int v17;
  uint64_t v19;
  char v20;

  v19 = a2;
  v5 = sub_23A8F0CA4();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_23A8F0D28();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v19 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v19 - v14;
  v16 = *a1;
  (*(void (**)(char *, _QWORD, uint64_t))(v10 + 104))((char *)&v19 - v14, **((unsigned int **)&unk_250BB55C0 + v16), v9);
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v13, v15, v9);
  v17 = (*(uint64_t (**)(char *, uint64_t))(v10 + 88))(v13, v9);
  if (v17 != *MEMORY[0x24BDCF250]
    && v17 != *MEMORY[0x24BDCF220]
    && v17 != *MEMORY[0x24BDCF230]
    && v17 != *MEMORY[0x24BDCF1E8])
  {
    (*(void (**)(char *, uint64_t))(v10 + 8))(v13, v9);
  }
  sub_23A8F0C68();
  v20 = v16;
  static EnergyTrends.startOfSubinterval(for:displayInterval:with:)((uint64_t)v8, &v20, a3);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v15, v9);
}

void static EnergyTrends.beginningOfInterval(for:interval:with:)(uint64_t a1, uint64_t a2)
{
  __asm { BR              X11 }
}

uint64_t sub_23A8CCAB8()
{
  return sub_23A8F0D04();
}

uint64_t sub_23A8CCACC()
{
  return sub_23A8F1004();
}

uint64_t sub_23A8CCADC()
{
  return sub_23A8F0FE0();
}

uint64_t sub_23A8CCAEC()
{
  return sub_23A8F0FEC();
}

uint64_t sub_23A8CCB00()
{
  return sub_23A8F0FD4();
}

void static EnergyTrends.beginningOfInterval(for:interval:in:)(uint64_t a1@<X0>, unsigned __int8 *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v15 = a3;
  v19 = a4;
  v20 = a1;
  v5 = sub_23A8F0CA4();
  v17 = *(_QWORD *)(v5 - 8);
  v18 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v6 = sub_23A8F0D58();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_23A8F0CEC();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v15 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = sub_23A8F0D34();
  MEMORY[0x24BDAC7A8](v16);
  v14 = *a2;
  (*(void (**)(char *, _QWORD, uint64_t))(v11 + 104))(v13, *MEMORY[0x24BDCEF70], v10);
  sub_23A8F0CF8();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, v15, v6);
  sub_23A8F0D1C();
  __asm { BR              X9 }
}

uint64_t sub_23A8CCC8C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  sub_23A8F0D04();
  (*(void (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(v3 - 112) + 32))(*(_QWORD *)(v3 - 96), v2, *(_QWORD *)(v3 - 104));
  return (*(uint64_t (**)(uint64_t, _QWORD))(v1 + 8))(v0, *(_QWORD *)(v3 - 120));
}

void EnergyTrends.beginningOfInterval(for:)()
{
  unsigned __int8 *v0;
  uint64_t v1;

  v1 = *v0;
  type metadata accessor for EnergyTrends();
  __asm { BR              X9 }
}

uint64_t sub_23A8CCD74()
{
  return sub_23A8F0D04();
}

uint64_t sub_23A8CCD94()
{
  return sub_23A8F1004();
}

uint64_t sub_23A8CCDAC()
{
  return sub_23A8F0FE0();
}

uint64_t sub_23A8CCDC4()
{
  return sub_23A8F0FEC();
}

uint64_t sub_23A8CCDE0()
{
  return sub_23A8F0FD4();
}

uint64_t static EnergyTrends.intervalDateRangeStartingAt(_:displayInterval:with:)@<X0>(uint64_t a1@<X0>, _BYTE *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  char *v23;
  void (*v24)(char *, char *, uint64_t);
  char v25;
  uint64_t result;
  char *v27;
  uint64_t v28;
  char *v29;
  void (*v30)(char *, uint64_t, uint64_t);
  char *v31;
  char *v32;
  uint64_t v33;
  void (*v34)(char *, uint64_t);
  char *v35;
  char *v36;
  char *v37;
  char v38;
  uint64_t v39;
  char *v40;
  char *v41;
  void (*v42)(char *, uint64_t, uint64_t);
  char *v43;
  uint64_t v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  char v51;

  v49 = a4;
  v50 = a3;
  v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569C87E0);
  v6 = MEMORY[0x24BDAC7A8](v46);
  v8 = (char *)&v44 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v45 = (char *)&v44 - v9;
  v47 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569C8530);
  MEMORY[0x24BDAC7A8](v47);
  v48 = (char *)&v44 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_23A8F0CA4();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v44 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542D8CF8);
  v16 = MEMORY[0x24BDAC7A8](v15);
  v18 = (char *)&v44 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = MEMORY[0x24BDAC7A8](v16);
  v21 = (char *)&v44 - v20;
  MEMORY[0x24BDAC7A8](v19);
  v23 = (char *)&v44 - v22;
  LOBYTE(a2) = *a2;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v12 + 56))((char *)&v44 - v22, 1, 1, v11);
  v51 = (char)a2;
  sub_23A8CAA8C(a1, 1, (uint64_t)&v51, (uint64_t)v21);
  sub_23A8C64C8((uint64_t)v23, &qword_2542D8CF8);
  sub_23A8C7E20((uint64_t)v21, (uint64_t)v23, &qword_2542D8CF8);
  sub_23A8C6700((uint64_t)v23, (uint64_t)v18, &qword_2542D8CF8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v18, 1, v11) == 1)
  {
    sub_23A8C64C8((uint64_t)v18, &qword_2542D8CF8);
LABEL_7:
    sub_23A8D09EC();
    v38 = sub_23A8F1118();
    result = sub_23A8C64C8((uint64_t)v23, &qword_2542D8CF8);
    if ((v38 & 1) != 0)
    {
      v40 = v45;
      v39 = v46;
      v41 = &v45[*(int *)(v46 + 48)];
      v42 = *(void (**)(char *, uint64_t, uint64_t))(v12 + 16);
      v42(v45, a1, v11);
      v42(v41, a1, v11);
      v43 = &v8[*(int *)(v39 + 48)];
      v42(v8, (uint64_t)v40, v11);
      v42(v43, (uint64_t)v41, v11);
      v24 = *(void (**)(char *, char *, uint64_t))(v12 + 32);
      v33 = (uint64_t)v48;
      v24(v48, v8, v11);
      v34 = *(void (**)(char *, uint64_t))(v12 + 8);
      v34(v43, v11);
      v35 = &v8[*(int *)(v39 + 48)];
      v24(v8, v40, v11);
      v36 = v35;
      v37 = v41;
      goto LABEL_9;
    }
    __break(1u);
    goto LABEL_11;
  }
  v24 = *(void (**)(char *, char *, uint64_t))(v12 + 32);
  v24(v14, v18, v11);
  if ((sub_23A8F0C50() & 1) == 0)
  {
    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
    goto LABEL_7;
  }
  sub_23A8D09EC();
  v25 = sub_23A8F1118();
  result = sub_23A8C64C8((uint64_t)v23, &qword_2542D8CF8);
  if ((v25 & 1) != 0)
  {
    v27 = v45;
    v28 = v46;
    v29 = &v45[*(int *)(v46 + 48)];
    v30 = *(void (**)(char *, uint64_t, uint64_t))(v12 + 16);
    v30(v45, a1, v11);
    v31 = v29;
    v24(v29, v14, v11);
    v32 = &v8[*(int *)(v28 + 48)];
    v30(v8, (uint64_t)v27, v11);
    v30(v32, (uint64_t)v31, v11);
    v33 = (uint64_t)v48;
    v24(v48, v8, v11);
    v34 = *(void (**)(char *, uint64_t))(v12 + 8);
    v34(v32, v11);
    v35 = &v8[*(int *)(v28 + 48)];
    v24(v8, v27, v11);
    v36 = v35;
    v37 = v31;
LABEL_9:
    v24(v36, v37, v11);
    v24((char *)(v33 + *(int *)(v47 + 36)), v35, v11);
    v34(v8, v11);
    return sub_23A8C7E20(v33, v49, &qword_2569C8530);
  }
LABEL_11:
  __break(1u);
  return result;
}

uint64_t EnergyTrends.intervalDateRangeStartingAt(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  char *v2;
  uint64_t v5;
  char v7;

  v7 = *v2;
  v5 = type metadata accessor for EnergyTrends();
  return static EnergyTrends.intervalDateRangeStartingAt(_:displayInterval:with:)(a1, &v7, (uint64_t)&v2[*(int *)(v5 + 32)], a2);
}

void static EnergyTrends.intervalDateRangeContaining(startDate:interval:with:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = sub_23A8F0CA4();
  v4 = MEMORY[0x24BDAC7A8](v3);
  MEMORY[0x24BDAC7A8](v4);
  __asm { BR              X9 }
}

uint64_t sub_23A8CD334()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;

  sub_23A8F0D04();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 32))(v3, v4, v0);
  *(_BYTE *)(v7 - 65) = v5;
  static EnergyTrends.intervalDateRangeStartingAt(_:displayInterval:with:)(v3, (_BYTE *)(v7 - 65), v1, v2);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(v3, v0);
}

void EnergyTrends.numDaysIn(usage:)()
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = sub_23A8F0D28();
  v2 = MEMORY[0x24BDAC7A8](v1);
  v3 = MEMORY[0x24BDAC7A8](v2);
  MEMORY[0x24BDAC7A8](v3);
  v4 = sub_23A8F0CA4();
  MEMORY[0x24BDAC7A8](v4);
  __asm { BR              X10 }
}

uint64_t sub_23A8CD4E0()
{
  uint64_t v0;
  uint64_t v1;
  _DWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  char v14;

  v9 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 104);
  v9(v1, *MEMORY[0x24BDCF220], v0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v5, v1, v0);
  v10 = (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 88))(v5, v0);
  if ((_DWORD)v10 == *v2)
    goto LABEL_2;
  if ((_DWORD)v10 == *MEMORY[0x24BDCF220])
  {
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v1, v0);
    return 1;
  }
  if ((_DWORD)v10 == *MEMORY[0x24BDCF230])
  {
    sub_23A8F1028();
    sub_23A8F0C38();
    goto LABEL_3;
  }
  if ((_DWORD)v10 == *MEMORY[0x24BDCF1E8])
  {
LABEL_2:
    v9(v4, v10, v0);
    type metadata accessor for EnergyTrends();
    sub_23A8F1010();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v0);
LABEL_3:
    v11 = *(_QWORD *)(v8 - 96);
    goto LABEL_4;
  }
  v11 = *(_QWORD *)(v8 - 96);
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v7 + 16))(v3, *(_QWORD *)(v8 - 88), v11);
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v0);
LABEL_4:
  type metadata accessor for EnergyTrends();
  v12 = sub_23A8F0FF8();
  v14 = v13;
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v1, v0);
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v3, v11);
  if ((v14 & 1) != 0)
    return 1;
  else
    return v12;
}

uint64_t sub_23A8CD6A0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char v12;
  void (*v13)(char *, uint64_t, uint64_t);
  uint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v22 = type metadata accessor for EnergySite.EnergyUsage(0);
  MEMORY[0x24BDAC7A8](v22);
  v23 = (uint64_t)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569C8530);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_23A8F0CA4();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23A8D09EC();
  v12 = sub_23A8F1118();
  v13 = *(void (**)(char *, uint64_t, uint64_t))(v9 + 16);
  v24 = a1;
  v13(v11, a1, v8);
  sub_23A8C6700(a2, (uint64_t)v7, &qword_2569C8530);
  if ((v12 & 1) != 0)
  {
    v14 = v22;
    v15 = sub_23A8F110C();
    sub_23A8C64C8((uint64_t)v7, &qword_2569C8530);
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    v16 = v23;
    sub_23A8CEAA8(v24, v23, type metadata accessor for EnergySite.EnergyUsage);
    v17 = v16;
    if ((v15 & 1) != 0)
      v18 = *(unsigned __int8 *)(v16 + *(int *)(v14 + 52));
    else
      v18 = 0;
  }
  else
  {
    sub_23A8C64C8((uint64_t)v7, &qword_2569C8530);
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    v19 = v23;
    sub_23A8CEAA8(v24, v23, type metadata accessor for EnergySite.EnergyUsage);
    v18 = 0;
    v17 = v19;
  }
  sub_23A8CEAEC(v17, type metadata accessor for EnergySite.EnergyUsage);
  return v18;
}

uint64_t sub_23A8CD8B4(uint64_t (*a1)(char *), uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  char v17;
  unint64_t v18;
  unint64_t v19;
  _QWORD v20[2];
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v7 = type metadata accessor for EnergySite.EnergyUsage(0);
  v24 = *(_QWORD *)(v7 - 8);
  v8 = MEMORY[0x24BDAC7A8](v7);
  v23 = (uint64_t)v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)v20 - v11;
  v13 = MEMORY[0x24BEE4AF8];
  v25 = MEMORY[0x24BEE4AF8];
  v22 = *(_QWORD *)(a3 + 16);
  if (v22)
  {
    v14 = 0;
    v15 = MEMORY[0x24BEE4AF8];
    v20[1] = a2;
    v21 = a3;
    v20[0] = a1;
    while (v14 < *(_QWORD *)(a3 + 16))
    {
      v16 = (*(unsigned __int8 *)(v24 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v24 + 80);
      v13 = *(_QWORD *)(v24 + 72);
      sub_23A8CEAA8(a3 + v16 + v13 * v14, (uint64_t)v12, type metadata accessor for EnergySite.EnergyUsage);
      v17 = a1(v12);
      if (v3)
      {
        sub_23A8CEAEC((uint64_t)v12, type metadata accessor for EnergySite.EnergyUsage);
        swift_release();
        swift_bridgeObjectRelease();
        return v13;
      }
      if ((v17 & 1) != 0)
      {
        sub_23A8C45C4((uint64_t)v12, v23, type metadata accessor for EnergySite.EnergyUsage);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          sub_23A8D0A44(0, *(_QWORD *)(v15 + 16) + 1, 1);
        v15 = v25;
        v19 = *(_QWORD *)(v25 + 16);
        v18 = *(_QWORD *)(v25 + 24);
        if (v19 >= v18 >> 1)
        {
          sub_23A8D0A44(v18 > 1, v19 + 1, 1);
          v15 = v25;
        }
        *(_QWORD *)(v15 + 16) = v19 + 1;
        result = sub_23A8C45C4(v23, v15 + v16 + v19 * v13, type metadata accessor for EnergySite.EnergyUsage);
        a3 = v21;
        a1 = (uint64_t (*)(char *))v20[0];
      }
      else
      {
        result = sub_23A8CEAEC((uint64_t)v12, type metadata accessor for EnergySite.EnergyUsage);
      }
      if (v22 == ++v14)
      {
        v13 = v25;
        goto LABEL_15;
      }
    }
    __break(1u);
  }
  else
  {
LABEL_15:
    swift_bridgeObjectRelease();
    return v13;
  }
  return result;
}

uint64_t EnergyTrends.previousIntervalStart(for:)()
{
  char *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  unint64_t v5;
  unsigned int *v6;
  uint64_t v8;

  v1 = sub_23A8F0D28();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = *v0;
  if (v5 > 3)
    v6 = (unsigned int *)MEMORY[0x24BDCF240];
  else
    v6 = (unsigned int *)qword_250BB55E8[v5];
  (*(void (**)(char *, _QWORD, uint64_t))(v2 + 104))(v4, *v6, v1);
  type metadata accessor for EnergyTrends();
  sub_23A8F101C();
  return (*(uint64_t (**)(char *, uint64_t))(v2 + 8))(v4, v1);
}

uint64_t EnergyTrends.previousIntervalDateRange(before:)@<X0>(uint64_t a1@<X8>)
{
  char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  unint64_t v10;
  unsigned int *v11;
  uint64_t v12;
  uint64_t v14;
  char v15;

  v14 = a1;
  v2 = sub_23A8F0D28();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_23A8F0CA4();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *v1;
  if (v10 > 3)
    v11 = (unsigned int *)MEMORY[0x24BDCF240];
  else
    v11 = (unsigned int *)qword_250BB55E8[v10];
  (*(void (**)(char *, _QWORD, uint64_t))(v3 + 104))(v5, *v11, v2);
  v12 = (uint64_t)&v1[*(int *)(type metadata accessor for EnergyTrends() + 32)];
  sub_23A8F101C();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  v15 = *v1;
  static EnergyTrends.intervalDateRangeStartingAt(_:displayInterval:with:)((uint64_t)v9, &v15, v12, v14);
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

uint64_t EnergyTrends.dailyAverageNetImportsForInterval(starting:)(uint64_t a1)
{
  return sub_23A8CF2FC(a1, (void (*)(char *))EnergyTrends.totalImportsForDateRange(_:), (void (*)(char *))EnergyTrends.totalExportsForDateRange(_:));
}

double EnergyTrends.previousDailyAverageImportsForInterval(starting:)()
{
  char *v0;
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
  uint64_t v11;
  char *v12;
  unint64_t v13;
  unsigned int *v14;
  uint64_t v15;
  double v16;
  double v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  double v21;
  double v22;
  uint64_t v24;
  char v25;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569C8530);
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)&v24 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_23A8F0D28();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_23A8F0CA4();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = *v0;
  v24 = v10;
  if (v13 > 3)
    v14 = (unsigned int *)MEMORY[0x24BDCF240];
  else
    v14 = (unsigned int *)qword_250BB55E8[v13];
  (*(void (**)(char *, _QWORD, uint64_t))(v5 + 104))(v7, *v14, v4);
  v15 = (uint64_t)&v0[*(int *)(type metadata accessor for EnergyTrends() + 32)];
  sub_23A8F101C();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  v25 = *v0;
  static EnergyTrends.intervalDateRangeStartingAt(_:displayInterval:with:)((uint64_t)v12, &v25, v15, (uint64_t)v3);
  EnergyTrends.totalImportsForDateRange(_:)((uint64_t)v3);
  v17 = v16;
  v19 = v18;
  EnergyTrends.totalExportsForDateRange(_:)((uint64_t)v3);
  v21 = v20;
  sub_23A8C64C8((uint64_t)v3, &qword_2569C8530);
  if (v19)
    v22 = (v17 - v21) / (double)v19;
  else
    v22 = 0.0;
  (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v24);
  return v22;
}

uint64_t EnergyTrends.containsUsageForDate(_:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  void (*v28)(char *, uint64_t);
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;

  v35 = a1;
  v1 = sub_23A8F0CA4();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = MEMORY[0x24BDAC7A8](v1);
  v5 = (char *)&v30 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)&v30 - v6;
  v8 = sub_23A8F0D58();
  v31 = *(_QWORD *)(v8 - 8);
  v32 = v8;
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v30 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_23A8F0CEC();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v30 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_23A8F0D34();
  v34 = *(_QWORD *)(v15 - 8);
  MEMORY[0x24BDAC7A8](v15);
  v17 = (char *)&v30 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, _QWORD, uint64_t))(v12 + 104))(v14, *MEMORY[0x24BDCEF70], v11);
  sub_23A8F0CF8();
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  v18 = type metadata accessor for EnergyTrends();
  v19 = v33;
  (*(void (**)(char *, uint64_t, uint64_t))(v31 + 16))(v10, v33 + *(int *)(v18 + 24), v32);
  sub_23A8F0D1C();
  v20 = *(_QWORD *)(v19 + 8);
  v21 = *(_QWORD *)(v20 + 16);
  if (v21)
  {
    v33 = v15;
    v22 = *(_QWORD *)(type metadata accessor for EnergySite.EnergyUsage(0) - 8);
    v23 = v20 + ((*(unsigned __int8 *)(v22 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v22 + 80));
    v24 = *(_QWORD *)(v22 + 72);
    v32 = v20;
    swift_bridgeObjectRetain();
    v25 = v21 - 1;
    do
    {
      v26 = v25;
      sub_23A8F0D04();
      sub_23A8F0D04();
      v27 = sub_23A8F0C74();
      v28 = *(void (**)(char *, uint64_t))(v2 + 8);
      v28(v5, v1);
      v28(v7, v1);
      if ((v27 & 1) != 0)
        break;
      v25 = v26 - 1;
      v23 += v24;
    }
    while (v26);
    swift_bridgeObjectRelease();
    v15 = v33;
  }
  else
  {
    v27 = 0;
  }
  (*(void (**)(char *, uint64_t))(v34 + 8))(v17, v15);
  return v27 & 1;
}

void EnergyTrends.totalImportsForDateRange(_:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  uint64_t v13;
  _BYTE v14[16];
  uint64_t v15;

  v3 = type metadata accessor for EnergySite.EnergyUsage(0);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = &v14[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v7 = *(_QWORD *)(v1 + 8);
  v15 = a1;
  swift_bridgeObjectRetain();
  v8 = sub_23A8CD8B4((uint64_t (*)(char *))sub_23A8D11C4, (uint64_t)v14, v7);
  v9 = *(_QWORD *)(v8 + 16);
  if (v9)
  {
    v10 = v8 + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
    v11 = *(_QWORD *)(v4 + 72);
    swift_bridgeObjectRetain();
    v12 = 0.0;
    v13 = v9;
    do
    {
      sub_23A8CEAA8(v10, (uint64_t)v6, type metadata accessor for EnergySite.EnergyUsage);
      v12 = v12 + *(double *)&v6[*(int *)(v3 + 24)] * (double)*(uint64_t *)&v6[*(int *)(v3 + 48)];
      sub_23A8CEAEC((uint64_t)v6, type metadata accessor for EnergySite.EnergyUsage);
      v10 += v11;
      --v13;
    }
    while (v13);
    swift_bridgeObjectRelease();
  }
  __asm { BR              X10 }
}

uint64_t sub_23A8CE2D4()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return 1;
}

void EnergyTrends.totalExportsForDateRange(_:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  uint64_t v12;
  _BYTE *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  os_log_type_t v18;
  int v19;
  _BOOL4 v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  unint64_t v25;
  os_log_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  double v31;
  uint64_t v32;
  _BYTE v33[12];
  int v34;
  os_log_t v35;
  uint64_t v36;
  _BYTE *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  _BYTE v43[16];
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;

  v2 = v1;
  v4 = type metadata accessor for EnergySite.EnergyUsage(0);
  v40 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v6 = &v33[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569C8530);
  MEMORY[0x24BDAC7A8](v39);
  v8 = &v33[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v38 = type metadata accessor for EnergyTrends();
  MEMORY[0x24BDAC7A8](v38);
  v10 = &v33[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v11 = sub_23A8F10A0();
  v42 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v13 = &v33[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v14 = *(_QWORD *)(v2 + 8);
  v44 = a1;
  swift_bridgeObjectRetain();
  v15 = sub_23A8CD8B4((uint64_t (*)(char *))sub_23A8D11C4, (uint64_t)v43, v14);
  if (qword_2542D8828 != -1)
    swift_once();
  v16 = __swift_project_value_buffer(v11, (uint64_t)qword_2542D8DE0);
  swift_beginAccess();
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v42 + 16))(v13, v16, v11);
  sub_23A8CEAA8(v2, (uint64_t)v10, (uint64_t (*)(_QWORD))type metadata accessor for EnergyTrends);
  sub_23A8C6700(a1, (uint64_t)v8, &qword_2569C8530);
  swift_bridgeObjectRetain();
  v17 = sub_23A8F1088();
  v18 = sub_23A8F1280();
  v19 = v18;
  v20 = os_log_type_enabled(v17, v18);
  v41 = v2;
  if (v20)
  {
    v21 = swift_slowAlloc();
    v37 = v13;
    v35 = v17;
    v22 = v21;
    v36 = swift_slowAlloc();
    v47 = v36;
    *(_DWORD *)v22 = 136315906;
    v45 = sub_23A8BF840(0xD00000000000001CLL, 0x800000023A8F3C70, &v47);
    v34 = v19;
    sub_23A8F12A4();
    *(_WORD *)(v22 + 12) = 2080;
    v23 = (uint64_t *)&v10[*(int *)(v38 + 28)];
    v38 = v11;
    v24 = *v23;
    v25 = v23[1];
    swift_bridgeObjectRetain();
    v45 = sub_23A8BF840(v24, v25, &v47);
    sub_23A8F12A4();
    swift_bridgeObjectRelease();
    sub_23A8CEAEC((uint64_t)v10, (uint64_t (*)(_QWORD))type metadata accessor for EnergyTrends);
    *(_WORD *)(v22 + 22) = 2048;
    v45 = *(_QWORD *)(v15 + 16);
    sub_23A8F12A4();
    swift_bridgeObjectRelease();
    *(_WORD *)(v22 + 32) = 2080;
    v45 = 0;
    v46 = 0xE000000000000000;
    sub_23A8F0CA4();
    sub_23A8F1388();
    sub_23A8F116C();
    sub_23A8F1388();
    v45 = sub_23A8BF840(v45, v46, &v47);
    sub_23A8F12A4();
    swift_bridgeObjectRelease();
    sub_23A8C64C8((uint64_t)v8, &qword_2569C8530);
    v26 = v35;
    _os_log_impl(&dword_23A8AD000, v35, (os_log_type_t)v34, "%s (%s) found %ld usages in %s", (uint8_t *)v22, 0x2Au);
    v27 = v36;
    swift_arrayDestroy();
    MEMORY[0x23B85B51C](v27, -1, -1);
    MEMORY[0x23B85B51C](v22, -1, -1);

    (*(void (**)(_BYTE *, uint64_t))(v42 + 8))(v37, v38);
  }
  else
  {
    sub_23A8CEAEC((uint64_t)v10, (uint64_t (*)(_QWORD))type metadata accessor for EnergyTrends);
    swift_bridgeObjectRelease();
    sub_23A8C64C8((uint64_t)v8, &qword_2569C8530);

    (*(void (**)(_BYTE *, uint64_t))(v42 + 8))(v13, v11);
  }
  v28 = *(_QWORD *)(v15 + 16);
  if (v28)
  {
    v29 = v15 + ((*(unsigned __int8 *)(v40 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v40 + 80));
    v30 = *(_QWORD *)(v40 + 72);
    swift_bridgeObjectRetain();
    v31 = 0.0;
    v32 = v28;
    do
    {
      sub_23A8CEAA8(v29, (uint64_t)v6, type metadata accessor for EnergySite.EnergyUsage);
      v31 = v31 + *(double *)&v6[*(int *)(v4 + 28)] * (double)*(uint64_t *)&v6[*(int *)(v4 + 48)];
      sub_23A8CEAEC((uint64_t)v6, type metadata accessor for EnergySite.EnergyUsage);
      v29 += v30;
      --v32;
    }
    while (v32);
    swift_bridgeObjectRelease();
  }
  __asm { BR              X10 }
}

uint64_t sub_23A8CEAA8(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_23A8CEAEC(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v3;

  v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_23A8CEB28(uint64_t a1)
{
  uint64_t v1;

  return sub_23A8CD6A0(a1, *(_QWORD *)(v1 + 16)) & 1;
}

BOOL EnergyTrends.isDailyAverageUsageUpForInterval(starting:)(uint64_t a1)
{
  char *v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  double v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  uint64_t v15;
  char v16;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569C8530);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = *v1;
  v6 = type metadata accessor for EnergyTrends();
  static EnergyTrends.intervalDateRangeStartingAt(_:displayInterval:with:)(a1, &v16, (uint64_t)&v1[*(int *)(v6 + 32)], (uint64_t)v5);
  EnergyTrends.totalImportsForDateRange(_:)((uint64_t)v5);
  v8 = v7;
  v10 = v9;
  EnergyTrends.totalExportsForDateRange(_:)((uint64_t)v5);
  v12 = v11;
  sub_23A8C64C8((uint64_t)v5, &qword_2569C8530);
  if (v10)
    v13 = (v8 - v12) / (double)v10;
  else
    v13 = 0.0;
  return v13 - EnergyTrends.previousDailyAverageImportsForInterval(starting:)() > 0.0;
}

uint64_t EnergyTrends.importPricingPeriodsForInterval(starting:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(_QWORD *@<X8>);
  unint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  int64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  int64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  int64_t v27;
  unint64_t v28;
  int64_t v29;
  uint64_t v30;
  uint64_t v31;
  double v32;
  char isUniquelyReferenced_nonNull_native;
  char v34;
  unint64_t v35;
  uint64_t v36;
  _BOOL8 v37;
  uint64_t v38;
  char v39;
  unint64_t v40;
  char v41;
  uint64_t v42;
  uint64_t v43;
  BOOL v44;
  uint64_t v45;
  uint64_t result;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;
  _BYTE v55[16];
  char *v56;
  _QWORD *v57;

  v3 = type metadata accessor for EnergySite.EnergyUsage(0);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v53 = (uint64_t)&v47 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569C8530);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v47 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  LOBYTE(v57) = *(_BYTE *)v1;
  v9 = type metadata accessor for EnergyTrends();
  static EnergyTrends.intervalDateRangeStartingAt(_:displayInterval:with:)(a1, &v57, v1 + *(int *)(v9 + 32), (uint64_t)v8);
  v10 = *(_QWORD *)(v1 + 8);
  v47 = v8;
  v56 = v8;
  swift_bridgeObjectRetain();
  v11 = sub_23A8CD8B4((uint64_t (*)(char *))sub_23A8D11C4, (uint64_t)v55, v10);
  v52 = *(_QWORD *)(v11 + 16);
  if (!v52)
  {
    swift_bridgeObjectRelease();
    v12 = 0;
    v15 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_41;
  }
  v12 = 0;
  v13 = 0;
  v14 = *(int *)(v3 + 36);
  v50 = v11 + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  v51 = v14;
  v15 = (_QWORD *)MEMORY[0x24BEE4B00];
  v48 = v11;
  v49 = v4;
  while (2)
  {
    if (v13 >= *(_QWORD *)(v11 + 16))
    {
LABEL_49:
      __break(1u);
LABEL_50:
      result = sub_23A8F1424();
      __break(1u);
      return result;
    }
    v16 = v53;
    sub_23A8CEAA8(v50 + *(_QWORD *)(v4 + 72) * v13, v53, type metadata accessor for EnergySite.EnergyUsage);
    v54 = v13 + 1;
    v17 = *(_QWORD *)(v16 + v51);
    swift_bridgeObjectRetain();
    sub_23A8CEAEC(v16, type metadata accessor for EnergySite.EnergyUsage);
    v18 = 0;
    v19 = v17 + 64;
    v20 = 1 << *(_BYTE *)(v17 + 32);
    if (v20 < 64)
      v21 = ~(-1 << v20);
    else
      v21 = -1;
    v22 = v21 & *(_QWORD *)(v17 + 64);
    v23 = (unint64_t)(v20 + 63) >> 6;
    while (1)
    {
      if (v22)
      {
        v25 = __clz(__rbit64(v22));
        v22 &= v22 - 1;
        v26 = v25 | (v18 << 6);
        goto LABEL_27;
      }
      v27 = v18 + 1;
      if (__OFADD__(v18, 1))
        goto LABEL_47;
      if (v27 >= v23)
        break;
      v28 = *(_QWORD *)(v19 + 8 * v27);
      ++v18;
      if (!v28)
      {
        v18 = v27 + 1;
        if (v27 + 1 >= v23)
          break;
        v28 = *(_QWORD *)(v19 + 8 * v18);
        if (!v28)
        {
          v18 = v27 + 2;
          if (v27 + 2 >= v23)
            break;
          v28 = *(_QWORD *)(v19 + 8 * v18);
          if (!v28)
          {
            v29 = v27 + 3;
            if (v29 >= v23)
              break;
            v28 = *(_QWORD *)(v19 + 8 * v29);
            if (!v28)
            {
              while (1)
              {
                v18 = v29 + 1;
                if (__OFADD__(v29, 1))
                  goto LABEL_48;
                if (v18 >= v23)
                  goto LABEL_3;
                v28 = *(_QWORD *)(v19 + 8 * v18);
                ++v29;
                if (v28)
                  goto LABEL_26;
              }
            }
            v18 = v29;
          }
        }
      }
LABEL_26:
      v22 = (v28 - 1) & v28;
      v26 = __clz(__rbit64(v28)) + (v18 << 6);
LABEL_27:
      v30 = 8 * v26;
      v31 = *(_QWORD *)(*(_QWORD *)(v17 + 48) + v30);
      v32 = *(double *)(*(_QWORD *)(v17 + 56) + v30);
      sub_23A8D0A34((uint64_t)v12);
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v57 = v15;
      v35 = sub_23A8BFF70(v31);
      v36 = v15[2];
      v37 = (v34 & 1) == 0;
      v38 = v36 + v37;
      if (__OFADD__(v36, v37))
      {
        __break(1u);
LABEL_46:
        __break(1u);
LABEL_47:
        __break(1u);
LABEL_48:
        __break(1u);
        goto LABEL_49;
      }
      v39 = v34;
      if (v15[3] >= v38)
      {
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
          sub_23A8C1294();
      }
      else
      {
        sub_23A8C08F8(v38, isUniquelyReferenced_nonNull_native);
        v40 = sub_23A8BFF70(v31);
        if ((v39 & 1) != (v41 & 1))
          goto LABEL_50;
        v35 = v40;
      }
      v15 = v57;
      swift_bridgeObjectRelease();
      if ((v39 & 1) != 0)
      {
        swift_bridgeObjectRetain();
      }
      else
      {
        v15[(v35 >> 6) + 8] |= 1 << v35;
        *(_QWORD *)(v15[6] + 8 * v35) = v31;
        *(_QWORD *)(v15[7] + 8 * v35) = 0;
        v42 = v15[2];
        v43 = v42 + 1;
        v44 = __OFADD__(v42, 1);
        swift_bridgeObjectRetain();
        if (v44)
          goto LABEL_46;
        v15[2] = v43;
      }
      v24 = v15[7];
      swift_bridgeObjectRelease();
      *(double *)(v24 + 8 * v35) = v32 + *(double *)(v24 + 8 * v35);
      v12 = sub_23A8AFF88;
    }
LABEL_3:
    swift_release();
    v13 = v54;
    v11 = v48;
    v4 = v49;
    if (v54 != v52)
      continue;
    break;
  }
  swift_bridgeObjectRelease();
LABEL_41:
  v45 = v15[2];
  sub_23A8C64C8((uint64_t)v47, &qword_2569C8530);
  if (v45)
  {
    sub_23A8D0A34((uint64_t)v12);
  }
  else
  {
    swift_bridgeObjectRelease();
    sub_23A8D0A34((uint64_t)v12);
    return 0;
  }
  return (uint64_t)v15;
}

double EnergyTrends.totalImportsForPreviousInterval(starting:)()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  double v3;
  double v4;
  uint64_t v6;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569C8530);
  MEMORY[0x24BDAC7A8](v0);
  v2 = (char *)&v6 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  EnergyTrends.previousIntervalDateRange(before:)((uint64_t)v2);
  EnergyTrends.totalImportsForDateRange(_:)((uint64_t)v2);
  v4 = v3;
  sub_23A8C64C8((uint64_t)v2, &qword_2569C8530);
  return v4;
}

double EnergyTrends.totalImportsForInterval(starting:)(uint64_t a1)
{
  char *v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  double v7;
  double v8;
  uint64_t v10;
  char v11;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569C8530);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = *v1;
  v6 = type metadata accessor for EnergyTrends();
  static EnergyTrends.intervalDateRangeStartingAt(_:displayInterval:with:)(a1, &v11, (uint64_t)&v1[*(int *)(v6 + 32)], (uint64_t)v5);
  EnergyTrends.totalImportsForDateRange(_:)((uint64_t)v5);
  v8 = v7;
  sub_23A8C64C8((uint64_t)v5, &qword_2569C8530);
  return v8;
}

uint64_t EnergyTrends.calculateDeltaNetExports(startDate:)(uint64_t a1)
{
  return sub_23A8CF1E4(a1, (void (*)(char *))EnergyTrends.totalExportsForDateRange(_:), (void (*)(char *))EnergyTrends.totalImportsForDateRange(_:), (double (*)(uint64_t))EnergyTrends.previousDailyAverageExportsForInterval(starting:));
}

uint64_t sub_23A8CF1E4(uint64_t a1, void (*a2)(char *), void (*a3)(char *), double (*a4)(uint64_t))
{
  char *v4;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v14;
  char v15;

  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569C8530);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = *v4;
  v12 = type metadata accessor for EnergyTrends();
  static EnergyTrends.intervalDateRangeStartingAt(_:displayInterval:with:)(a1, &v15, (uint64_t)&v4[*(int *)(v12 + 32)], (uint64_t)v11);
  a2(v11);
  a3(v11);
  sub_23A8C64C8((uint64_t)v11, &qword_2569C8530);
  a4(a1);
  return 1;
}

uint64_t EnergyTrends.dailyAverageNetExportsForInterval(starting:)(uint64_t a1)
{
  return sub_23A8CF2FC(a1, (void (*)(char *))EnergyTrends.totalExportsForDateRange(_:), (void (*)(char *))EnergyTrends.totalImportsForDateRange(_:));
}

uint64_t sub_23A8CF2FC(uint64_t a1, void (*a2)(char *), void (*a3)(char *))
{
  char *v3;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v12;
  char v13;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569C8530);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = *v3;
  v10 = type metadata accessor for EnergyTrends();
  static EnergyTrends.intervalDateRangeStartingAt(_:displayInterval:with:)(a1, &v13, (uint64_t)&v3[*(int *)(v10 + 32)], (uint64_t)v9);
  a2(v9);
  a3(v9);
  return sub_23A8C64C8((uint64_t)v9, &qword_2569C8530);
}

double EnergyTrends.previousDailyAverageExportsForInterval(starting:)()
{
  char *v0;
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
  uint64_t v11;
  char *v12;
  unint64_t v13;
  unsigned int *v14;
  uint64_t v15;
  double v16;
  double v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  double v21;
  double v22;
  uint64_t v24;
  char v25;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569C8530);
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)&v24 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_23A8F0D28();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_23A8F0CA4();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = *v0;
  v24 = v10;
  if (v13 > 3)
    v14 = (unsigned int *)MEMORY[0x24BDCF240];
  else
    v14 = (unsigned int *)qword_250BB55E8[v13];
  (*(void (**)(char *, _QWORD, uint64_t))(v5 + 104))(v7, *v14, v4);
  v15 = (uint64_t)&v0[*(int *)(type metadata accessor for EnergyTrends() + 32)];
  sub_23A8F101C();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  v25 = *v0;
  static EnergyTrends.intervalDateRangeStartingAt(_:displayInterval:with:)((uint64_t)v12, &v25, v15, (uint64_t)v3);
  EnergyTrends.totalExportsForDateRange(_:)((uint64_t)v3);
  v17 = v16;
  v19 = v18;
  EnergyTrends.totalImportsForDateRange(_:)((uint64_t)v3);
  v21 = v20;
  sub_23A8C64C8((uint64_t)v3, &qword_2569C8530);
  if (v19)
    v22 = (v17 - v21) / (double)v19;
  else
    v22 = 0.0;
  (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v24);
  return v22;
}

BOOL EnergyTrends.isDailyAverageSurplusUpForInterval(starting:)(uint64_t a1)
{
  char *v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  double v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  uint64_t v15;
  char v16;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569C8530);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = *v1;
  v6 = type metadata accessor for EnergyTrends();
  static EnergyTrends.intervalDateRangeStartingAt(_:displayInterval:with:)(a1, &v16, (uint64_t)&v1[*(int *)(v6 + 32)], (uint64_t)v5);
  EnergyTrends.totalImportsForDateRange(_:)((uint64_t)v5);
  v8 = v7;
  v10 = v9;
  EnergyTrends.totalExportsForDateRange(_:)((uint64_t)v5);
  v12 = v11;
  sub_23A8C64C8((uint64_t)v5, &qword_2569C8530);
  if (v10)
    v13 = (v8 - v12) / (double)v10;
  else
    v13 = 0.0;
  return v13 - EnergyTrends.previousDailyAverageImportsForInterval(starting:)() < 0.0;
}

void EnergyTrends.avergeSurplusOrConsumption(startDate:)(uint64_t a1)
{
  char *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char v11;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569C8530);
  v4 = MEMORY[0x24BDAC7A8](v3);
  v5 = MEMORY[0x24BDAC7A8](v4);
  v6 = MEMORY[0x24BDAC7A8](v5);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v10 - v7;
  v11 = *v1;
  v9 = type metadata accessor for EnergyTrends();
  static EnergyTrends.intervalDateRangeStartingAt(_:displayInterval:with:)(a1, &v11, (uint64_t)&v1[*(int *)(v9 + 32)], (uint64_t)v8);
  EnergyTrends.totalImportsForDateRange(_:)((uint64_t)v8);
  EnergyTrends.totalExportsForDateRange(_:)((uint64_t)v8);
  sub_23A8C64C8((uint64_t)v8, &qword_2569C8530);
  __asm { BR              X9 }
}

double sub_23A8CF818()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  char v4;
  uint64_t v5;
  double v6;
  double v7;

  swift_bridgeObjectRelease();
  *(_BYTE *)(v5 - 100) = v4;
  static EnergyTrends.intervalDateRangeStartingAt(_:displayInterval:with:)(v0, (_BYTE *)(v5 - 100), v2, v1);
  if (v3)
    EnergyTrends.totalExportsForDateRange(_:)(v1);
  else
    EnergyTrends.totalImportsForDateRange(_:)(v1);
  v7 = v6;
  sub_23A8C64C8(v1, &qword_2569C8530);
  return v7;
}

BOOL EnergyTrends.isNetSurplusForInterval(starting:)(uint64_t a1)
{
  char *v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  double v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  double v12;
  uint64_t v14;
  char v15;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569C8530);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = *v1;
  v6 = type metadata accessor for EnergyTrends();
  static EnergyTrends.intervalDateRangeStartingAt(_:displayInterval:with:)(a1, &v15, (uint64_t)&v1[*(int *)(v6 + 32)], (uint64_t)v5);
  EnergyTrends.totalImportsForDateRange(_:)((uint64_t)v5);
  v8 = v7;
  v10 = v9;
  EnergyTrends.totalExportsForDateRange(_:)((uint64_t)v5);
  v12 = v11;
  sub_23A8C64C8((uint64_t)v5, &qword_2569C8530);
  return v10 && (v8 - v12) / (double)v10 < 0.0;
}

void static EnergyTrends.requestSnapshotDates(intervalType:timeZone:)(unsigned __int8 *a1, char *a2)
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
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  char *v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  _QWORD v39[5];
  uint64_t v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  char *v46;
  char *v47;
  char *v48;
  char *v49;
  char *v50;
  char *v51;
  uint64_t v52;

  v51 = a2;
  v3 = sub_23A8F0D28();
  v43 = *(_QWORD *)(v3 - 8);
  v44 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v42 = (char *)v39 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_23A8F0CA4();
  v52 = *(_QWORD *)(v5 - 8);
  v6 = MEMORY[0x24BDAC7A8](v5);
  v39[3] = (char *)v39 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v39[2] = (char *)v39 - v9;
  v10 = MEMORY[0x24BDAC7A8](v8);
  v46 = (char *)v39 - v11;
  v12 = MEMORY[0x24BDAC7A8](v10);
  v45 = (char *)v39 - v13;
  v14 = MEMORY[0x24BDAC7A8](v12);
  v50 = (char *)v39 - v15;
  v16 = MEMORY[0x24BDAC7A8](v14);
  v49 = (char *)v39 - v17;
  v18 = MEMORY[0x24BDAC7A8](v16);
  v20 = (char *)v39 - v19;
  v21 = MEMORY[0x24BDAC7A8](v18);
  v47 = (char *)v39 - v22;
  MEMORY[0x24BDAC7A8](v21);
  v24 = (char *)v39 - v23;
  v40 = sub_23A8F0D58();
  v25 = *(_QWORD *)(v40 - 8);
  MEMORY[0x24BDAC7A8](v40);
  v27 = (char *)v39 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28 = sub_23A8F0CEC();
  v29 = *(_QWORD *)(v28 - 8);
  MEMORY[0x24BDAC7A8](v28);
  v31 = (char *)v39 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  v32 = sub_23A8F0D34();
  v39[0] = *(_QWORD *)(v32 - 8);
  v39[1] = v32;
  MEMORY[0x24BDAC7A8](v32);
  v34 = (char *)v39 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
  v41 = *a1;
  (*(void (**)(char *, _QWORD, uint64_t))(v29 + 104))(v31, *MEMORY[0x24BDCEF70], v28);
  sub_23A8F0CF8();
  (*(void (**)(char *, uint64_t))(v29 + 8))(v31, v28);
  (*(void (**)(char *, char *, uint64_t))(v25 + 16))(v27, v51, v40);
  v51 = v34;
  sub_23A8F0D1C();
  LODWORD(v40) = *MEMORY[0x24BDCF240];
  v39[4] = v24;
  v48 = v20;
  v35 = v47;
  sub_23A8F0C80();
  v37 = v42;
  v36 = v43;
  v38 = v44;
  (*(void (**)(char *, _QWORD, uint64_t))(v43 + 104))(v42, v40, v44);
  sub_23A8F101C();
  (*(void (**)(char *, uint64_t))(v36 + 8))(v37, v38);
  (*(void (**)(char *, uint64_t))(v52 + 8))(v35, v5);
  sub_23A8F0FD4();
  __asm { BR              X8 }
}

void sub_23A8CFE4C()
{
  unint64_t v0;
  uint64_t v1;
  void (*v2)(unint64_t, uint64_t);
  uint64_t v3;
  char v4;
  uint64_t v5;
  void (*v6)(_QWORD, uint64_t, uint64_t);
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  void (*v11)(unint64_t, uint64_t, uint64_t);
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;

  v4 = sub_23A8F13F4();
  swift_bridgeObjectRelease();
  if ((v4 & 1) != 0)
  {
    sub_23A8F0D04();
    v5 = *(_QWORD *)(v3 - 104);
    sub_23A8F0FEC();
    v6 = *(void (**)(_QWORD, uint64_t, uint64_t))(*(_QWORD *)(v3 - 88) + 16);
    v6(*(_QWORD *)(v3 - 144), v5, v1);
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v0 = sub_23A8BF5B0(0, *(_QWORD *)(v0 + 16) + 1, 1, v0);
    v8 = *(_QWORD *)(v0 + 16);
    v7 = *(_QWORD *)(v0 + 24);
    if (v8 >= v7 >> 1)
      v0 = sub_23A8BF5B0(v7 > 1, v8 + 1, 1, v0);
    *(_QWORD *)(v0 + 16) = v8 + 1;
    v9 = *(_QWORD *)(v3 - 88);
    v10 = v0
        + ((*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80))
        + *(_QWORD *)(v9 + 72) * v8;
    v11 = *(void (**)(unint64_t, uint64_t, uint64_t))(v9 + 32);
    v11(v10, *(_QWORD *)(v3 - 144), v1);
    v12 = *(_QWORD *)(v3 - 128);
    sub_23A8F0FBC();
    v13 = *(_QWORD *)(v3 - 104);
    v2(v13, v1);
    v11(v13, v12, v1);
    v6(*(_QWORD *)(v3 - 136), v13, v1);
    v15 = *(_QWORD *)(v0 + 16);
    v14 = *(_QWORD *)(v0 + 24);
    if (v15 >= v14 >> 1)
      sub_23A8BF5B0(v14 > 1, v15 + 1, 1, v0);
    JUMPOUT(0x23A8CFD50);
  }
  v16 = *(_QWORD *)(v3 - 208);
  sub_23A8F0D04();
  (*(void (**)(_QWORD, uint64_t, uint64_t))(*(_QWORD *)(v3 - 88) + 16))(*(_QWORD *)(v3 - 200), v16, v1);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v0 = sub_23A8BF5B0(0, *(_QWORD *)(v0 + 16) + 1, 1, v0);
  v18 = *(_QWORD *)(v0 + 16);
  v17 = *(_QWORD *)(v0 + 24);
  if (v18 >= v17 >> 1)
    v0 = sub_23A8BF5B0(v17 > 1, v18 + 1, 1, v0);
  *(_QWORD *)(v0 + 16) = v18 + 1;
  (*(void (**)(unint64_t, _QWORD, uint64_t))(*(_QWORD *)(v3 - 88) + 32))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v3 - 88) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v3 - 88) + 80))+ *(_QWORD *)(*(_QWORD *)(v3 - 88) + 72) * v18, *(_QWORD *)(v3 - 200), v1);
  JUMPOUT(0x23A8CFD7CLL);
}

uint64_t static EnergyTrends.allocateSeats<A>(for:seats:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  double v26;
  double v27;
  double v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  NSObject *v32;
  os_log_type_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  char *v40;
  double v41;
  double v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  void (*v50)(double *, _QWORD);
  double v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  char *v55;
  char *v56;
  uint64_t TupleTypeMetadata2;
  uint64_t v58;
  char *v59;
  char *v60;
  uint64_t v61;
  double v62[6];
  uint64_t v63;
  uint64_t v64[2];

  v6 = sub_23A8F10A0();
  v7 = *(double *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v55 = (char *)&v51 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  v61 = *(_QWORD *)(TupleTypeMetadata2 - 8);
  v9 = MEMORY[0x24BDAC7A8](TupleTypeMetadata2);
  v60 = (char *)&v51 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = MEMORY[0x24BDAC7A8](v9);
  v59 = (char *)&v51 - v12;
  MEMORY[0x24BDAC7A8](v11);
  v56 = (char *)&v51 - v13;
  v63 = 0;
  v64[0] = a1;
  v14 = sub_23A8F10D0();
  swift_bridgeObjectRetain();
  MEMORY[0x23B85B498](MEMORY[0x24BEE03C0], v14);
  *(double *)&v15 = 0.0;
  sub_23A8F1184();
  v16 = swift_bridgeObjectRelease();
  v17 = v62[0];
  v58 = a3;
  if (v62[0] <= 0.0)
  {
    *(double *)&v15 = COERCE_DOUBLE(sub_23A8F10DC());
    if (qword_2542D8828 == -1)
      goto LABEL_8;
  }
  else
  {
    v6 = a2;
    v17 = (double)a2 / v62[0];
    MEMORY[0x24BDAC7A8](v16);
    *(&v51 - 2) = v17;
    v63 = sub_23A8F10DC();
    v64[0] = v63;
    v62[4] = 0.0;
    v18 = sub_23A8F10D0();
    swift_bridgeObjectRetain();
    MEMORY[0x23B85B498](MEMORY[0x24BEE03C0], v18);
    sub_23A8F1184();
    v19 = swift_bridgeObjectRelease();
    if (!__OFSUB__(a2, *(_QWORD *)&v62[0]))
    {
      if (a2 - *(_QWORD *)&v62[0] < 1)
        return v64[0];
      MEMORY[0x24BDAC7A8](v19);
      *(&v51 - 2) = v17;
      v20 = v58;
      *(_QWORD *)&v62[0] = sub_23A8F10DC();
      MEMORY[0x24BDAC7A8](*(_QWORD *)&v62[0]);
      *((_QWORD *)&v51 - 2) = v20;
      *((_QWORD *)&v51 - 1) = v21;
      v54 = v21;
      v22 = sub_23A8F10E8();
      MEMORY[0x23B85B498](MEMORY[0x24BEE04D8], v22);
      v23 = sub_23A8F1190();
      swift_bridgeObjectRelease();
      v24 = v20;
      v63 = v23;
      v6 = TupleTypeMetadata2;
      v25 = sub_23A8F11CC();
      MEMORY[0x23B85B498](MEMORY[0x24BEE12E0], v25);
      sub_23A8F1250();
      v26 = v62[0];
      v7 = v62[1];
      v28 = v62[2];
      v27 = v62[3];
      swift_unknownObjectRetain();
      *(double *)&v15 = COERCE_DOUBLE(sub_23A8F12C8());
      swift_unknownObjectRelease();
      v29 = sub_23A8F12E0();
      v55 = (char *)v15;
      if (v15 == v29)
      {
LABEL_5:
        swift_unknownObjectRelease();
        return v64[0];
      }
      v52 = *(int *)(v6 + 48);
      v53 = *(_QWORD *)&v27 >> 1;
      v40 = v55;
      v51 = v27;
      while (1)
      {
        sub_23A8F12D4();
        if ((uint64_t)v55 < *(uint64_t *)&v28 || v53 <= (uint64_t)v40)
          break;
        *(double *)&v15 = v28;
        v41 = v26;
        v42 = v7;
        v43 = *(_QWORD *)&v7 + *(_QWORD *)(v61 + 72) * (_QWORD)v40;
        v44 = v56;
        (*(void (**)(char *, uint64_t, uint64_t))(v61 + 16))(v56, v43, v6);
        v17 = *(double *)&v44[v52];
        v45 = *(int *)(v6 + 48);
        v46 = *(_QWORD *)(v24 - 8);
        v47 = v59;
        (*(void (**)(char *, char *, uint64_t))(v46 + 32))(v59, v44, v24);
        *(double *)&v47[v45] = v17;
        v48 = *(int *)(v6 + 48);
        v7 = *(double *)&v60;
        (*(void (**)(char *, char *, uint64_t))(v46 + 16))(v60, v47, v24);
        *(double *)(*(_QWORD *)&v7 + v48) = v17;
        sub_23A8F10E8();
        v50 = (void (*)(double *, _QWORD))sub_23A8F10F4();
        if ((*(_BYTE *)(v49 + 8) & 1) == 0)
        {
          if (__OFADD__(*(_QWORD *)v49, 1))
          {
            __break(1u);
            break;
          }
          ++*(_QWORD *)v49;
        }
        v50(v62, 0);
        ++v40;
        v6 = TupleTypeMetadata2;
        (*(void (**)(char *, uint64_t))(v61 + 8))(v59, TupleTypeMetadata2);
        v24 = v58;
        (*(void (**)(char *, uint64_t))(v46 + 8))(v60, v58);
        v26 = v41;
        v7 = v42;
        v28 = *(double *)&v15;
        if (v40 == (char *)sub_23A8F12E0())
          goto LABEL_5;
      }
      __break(1u);
    }
    __break(1u);
  }
  swift_once();
LABEL_8:
  v30 = __swift_project_value_buffer(v6, (uint64_t)qword_2542D8DE0);
  swift_beginAccess();
  v31 = v55;
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)&v7 + 16))(v55, v30, v6);
  swift_bridgeObjectRetain();
  v32 = sub_23A8F1088();
  v33 = sub_23A8F1280();
  if (os_log_type_enabled(v32, v33))
  {
    v34 = swift_slowAlloc();
    v35 = swift_slowAlloc();
    v61 = v6;
    v36 = v35;
    v64[0] = v35;
    *(_DWORD *)v34 = 136315650;
    v63 = sub_23A8BF840(0xD000000000000019, 0x800000023A8F3CA0, v64);
    sub_23A8F12A4();
    *(_WORD *)(v34 + 12) = 2048;
    v63 = *(_QWORD *)&v17;
    sub_23A8F12A4();
    *(_WORD *)(v34 + 22) = 2080;
    v37 = sub_23A8F10C4();
    v63 = sub_23A8BF840(v37, v38, v64);
    sub_23A8F12A4();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23A8AD000, v32, v33, "%s total %f !!! returning %s", (uint8_t *)v34, 0x20u);
    swift_arrayDestroy();
    MEMORY[0x23B85B51C](v36, -1, -1);
    MEMORY[0x23B85B51C](v34, -1, -1);

    (*(void (**)(char *, uint64_t))(*(_QWORD *)&v7 + 8))(v31, v61);
  }
  else
  {

    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(*(_QWORD *)&v7 + 8))(v31, v6);
  }
  return v15;
}

double sub_23A8D08CC@<D0>(double *a1@<X0>, double *a2@<X1>, double *a3@<X8>)
{
  double result;

  result = *a1 + *a2;
  *a3 = result;
  return result;
}

_QWORD *sub_23A8D08E0@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X1>, _QWORD *a3@<X8>)
{
  if (__OFADD__(*result, *a2))
    __break(1u);
  else
    *a3 = *result + *a2;
  return result;
}

double *sub_23A8D08FC@<X0>(double *result@<X0>, double *a2@<X8>, double a3@<D0>)
{
  double v3;

  v3 = *result * a3;
  if ((~*(_QWORD *)&v3 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_6;
  }
  if (v3 <= -9.22337204e18)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  if (v3 < 9.22337204e18)
  {
    *a2 = v3 - (double)(uint64_t)v3;
    return result;
  }
LABEL_7:
  __break(1u);
  return result;
}

void *sub_23A8D0958(void *__src, uint64_t a2, void *__dst, uint64_t a4)
{
  uint64_t v4;

  if (__src)
    v4 = a2 - (_QWORD)__src;
  else
    v4 = 0;
  if (!__dst)
  {
    if (v4 <= 0)
      return __src;
LABEL_10:
    __src = (void *)sub_23A8F13C4();
    __break(1u);
    return __src;
  }
  if (a4 - (uint64_t)__dst < v4)
    goto LABEL_10;
  if (__src)
    return memmove(__dst, __src, a2 - (_QWORD)__src);
  return __src;
}

unint64_t sub_23A8D09EC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2569C8538;
  if (!qword_2569C8538)
  {
    v1 = sub_23A8F0CA4();
    result = MEMORY[0x23B85B498](MEMORY[0x24BDCE948], v1);
    atomic_store(result, (unint64_t *)&qword_2569C8538);
  }
  return result;
}

uint64_t sub_23A8D0A34(uint64_t result)
{
  if (result)
    return swift_release();
  return result;
}

uint64_t sub_23A8D0A44(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_23A8EBDD4(a1, a2, a3, (_QWORD *)*v3);
  *v3 = result;
  return result;
}

double *sub_23A8D0A60@<X0>(double *result@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  double v3;

  v3 = *(double *)(v2 + 16) * *result;
  if ((~*(_QWORD *)&v3 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_6;
  }
  if (v3 <= -9.22337204e18)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  if (v3 < 9.22337204e18)
  {
    *a2 = (uint64_t)v3;
    return result;
  }
LABEL_7:
  __break(1u);
  return result;
}

double *sub_23A8D0AB8@<X0>(double *a1@<X0>, double *a2@<X8>)
{
  uint64_t v2;

  return sub_23A8D08FC(a1, a2, *(double *)(v2 + 16));
}

BOOL sub_23A8D0AD0(uint64_t a1, uint64_t a2)
{
  uint64_t TupleTypeMetadata2;

  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  return *(double *)(a2 + *(int *)(TupleTypeMetadata2 + 48)) < *(double *)(a1 + *(int *)(TupleTypeMetadata2 + 48));
}

uint64_t *initializeBufferWithCopyOfBuffer for EnergyTrends(uint64_t *a1, uint64_t *a2, int *a3)
{
  uint64_t *v4;
  int v5;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  void (*v11)(char *, char *, uint64_t);
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;
  void (*v20)(char *, char *, uint64_t);
  uint64_t v21;

  v4 = a1;
  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v21 = *a2;
    *v4 = *a2;
    v4 = (uint64_t *)(v21 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *(_BYTE *)a1 = *(_BYTE *)a2;
    a1[1] = a2[1];
    v7 = a3[6];
    v8 = (char *)a1 + v7;
    v9 = (char *)a2 + v7;
    v10 = sub_23A8F0D58();
    v11 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 16);
    swift_bridgeObjectRetain();
    v11(v8, v9, v10);
    v12 = a3[7];
    v13 = a3[8];
    v14 = (uint64_t *)((char *)v4 + v12);
    v15 = (uint64_t *)((char *)a2 + v12);
    v16 = v15[1];
    *v14 = *v15;
    v14[1] = v16;
    v17 = (char *)v4 + v13;
    v18 = (char *)a2 + v13;
    v19 = sub_23A8F0D34();
    v20 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v19 - 8) + 16);
    swift_bridgeObjectRetain();
    v20(v17, v18, v19);
  }
  return v4;
}

uint64_t destroy for EnergyTrends(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 24);
  v5 = sub_23A8F0D58();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  swift_bridgeObjectRelease();
  v6 = a1 + *(int *)(a2 + 32);
  v7 = sub_23A8F0D34();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v6, v7);
}

uint64_t initializeWithCopy for EnergyTrends(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t, uint64_t);
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, uint64_t, uint64_t);

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  v6 = a3[6];
  v7 = a1 + v6;
  v8 = a2 + v6;
  v9 = sub_23A8F0D58();
  v10 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 16);
  swift_bridgeObjectRetain();
  v10(v7, v8, v9);
  v11 = a3[7];
  v12 = a3[8];
  v13 = (_QWORD *)(a1 + v11);
  v14 = (_QWORD *)(a2 + v11);
  v15 = v14[1];
  *v13 = *v14;
  v13[1] = v15;
  v16 = a1 + v12;
  v17 = a2 + v12;
  v18 = sub_23A8F0D34();
  v19 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 16);
  swift_bridgeObjectRetain();
  v19(v16, v17, v18);
  return a1;
}

uint64_t assignWithCopy for EnergyTrends(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = a3[6];
  v7 = a1 + v6;
  v8 = a2 + v6;
  v9 = sub_23A8F0D58();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 24))(v7, v8, v9);
  v10 = a3[7];
  v11 = (_QWORD *)(a1 + v10);
  v12 = (_QWORD *)(a2 + v10);
  *v11 = *v12;
  v11[1] = v12[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v13 = a3[8];
  v14 = a1 + v13;
  v15 = a2 + v13;
  v16 = sub_23A8F0D34();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 24))(v14, v15, v16);
  return a1;
}

uint64_t initializeWithTake for EnergyTrends(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  v6 = a3[6];
  v7 = a1 + v6;
  v8 = a2 + v6;
  v9 = sub_23A8F0D58();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v7, v8, v9);
  v10 = a3[8];
  *(_OWORD *)(a1 + a3[7]) = *(_OWORD *)(a2 + a3[7]);
  v11 = a1 + v10;
  v12 = a2 + v10;
  v13 = sub_23A8F0D34();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 32))(v11, v12, v13);
  return a1;
}

uint64_t assignWithTake for EnergyTrends(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  v6 = a3[6];
  v7 = a1 + v6;
  v8 = a2 + v6;
  v9 = sub_23A8F0D58();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 40))(v7, v8, v9);
  v10 = a3[7];
  v11 = (_QWORD *)(a1 + v10);
  v12 = (uint64_t *)(a2 + v10);
  v14 = *v12;
  v13 = v12[1];
  *v11 = v14;
  v11[1] = v13;
  swift_bridgeObjectRelease();
  v15 = a3[8];
  v16 = a1 + v15;
  v17 = a2 + v15;
  v18 = sub_23A8F0D34();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 40))(v16, v17, v18);
  return a1;
}

uint64_t getEnumTagSinglePayload for EnergyTrends()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23A8D0FD8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = sub_23A8F0D58();
    v9 = *(_QWORD *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == (_DWORD)a2)
    {
      v10 = v8;
      v11 = *(int *)(a3 + 24);
    }
    else
    {
      v10 = sub_23A8F0D34();
      v9 = *(_QWORD *)(v10 - 8);
      v11 = *(int *)(a3 + 32);
    }
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(a1 + v11, a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for EnergyTrends()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23A8D1084(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)(result + 8) = (a2 - 1);
  }
  else
  {
    v8 = sub_23A8F0D58();
    v9 = *(_QWORD *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a3)
    {
      v10 = v8;
      v11 = *(int *)(a4 + 24);
    }
    else
    {
      v10 = sub_23A8F0D34();
      v9 = *(_QWORD *)(v10 - 8);
      v11 = *(int *)(a4 + 32);
    }
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(v5 + v11, a2, a2, v10);
  }
  return result;
}

uint64_t sub_23A8D1120()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = sub_23A8F0D58();
  if (v1 <= 0x3F)
  {
    result = sub_23A8F0D34();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t sub_23A8D11C4(uint64_t a1)
{
  return sub_23A8CEB28(a1) & 1;
}

uint64_t sub_23A8D11DC(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  void (*v6)(char *);
  uint64_t v8;

  v2 = sub_23A8F0C14();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8]();
  v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *(void (**)(char *))(a1 + 32);
  sub_23A8F0BF0();
  swift_retain();
  v6(v5);
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

_QWORD *sub_23A8D1280()
{
  uint64_t v0;
  _QWORD *result;

  type metadata accessor for HomeEnergyManager();
  v0 = swift_allocObject();
  result = sub_23A8D12F8();
  qword_2542D8A98 = v0;
  return result;
}

uint64_t static HomeEnergyManager.shared.getter()
{
  if (qword_2542D8AA0 != -1)
    swift_once();
  return swift_retain();
}

_QWORD *sub_23A8D12F8()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t v11;

  v1 = v0;
  v2 = sub_23A8F10A0();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8]();
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v1[2] = objc_msgSend((id)objc_opt_self(), sel_defaultCenter);
  v1[3] = 0;
  v1[4] = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD1710]), sel_init);
  if (qword_2542D8828 != -1)
    swift_once();
  v6 = __swift_project_value_buffer(v2, (uint64_t)qword_2542D8DE0);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v6, v2);
  v7 = sub_23A8F1088();
  v8 = sub_23A8F1280();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_23A8AD000, v7, v8, "[GridForecast] Setup notification observer", v9, 2u);
    MEMORY[0x23B85B51C](v9, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  sub_23A8D1494();
  return v1;
}

uint64_t sub_23A8D1494()
{
  _QWORD *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  _QWORD v9[5];
  _QWORD *v10;

  sub_23A8F0E18();
  v1 = (void *)sub_23A8F1130();
  swift_bridgeObjectRelease();
  v2 = (void *)v0[2];
  v3 = (void *)v0[4];
  v9[4] = sub_23A8DCAAC;
  v10 = v0;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 1107296256;
  v9[2] = sub_23A8D11DC;
  v9[3] = &block_descriptor_1;
  v4 = _Block_copy(v9);
  v5 = v1;
  v6 = v3;
  swift_retain();
  swift_release();
  v7 = objc_msgSend(v2, sel_addObserverForName_object_queue_usingBlock_, v5, 0, v6, v4);
  _Block_release(v4);

  v0[3] = v7;
  return swift_unknownObjectRelease();
}

uint64_t sub_23A8D159C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  char v18;
  uint64_t result;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23[5];
  __int128 v24;
  __int128 v25;

  v0 = sub_23A8F10A0();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8]();
  v3 = (char *)&v20 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2542D8828 != -1)
    swift_once();
  v4 = __swift_project_value_buffer(v0, (uint64_t)qword_2542D8DE0);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v3, v4, v0);
  v5 = sub_23A8F1088();
  v6 = sub_23A8F1280();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_23A8AD000, v5, v6, "[GridForecast] Received notification from daemon", v7, 2u);
    MEMORY[0x23B85B51C](v7, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  v8 = sub_23A8F0C08();
  if (!v8)
  {
    v24 = 0u;
    v25 = 0u;
LABEL_14:
    sub_23A8C999C((uint64_t)&v24);
    goto LABEL_15;
  }
  v9 = v8;
  v21 = sub_23A8F0DE8();
  v22 = v10;
  sub_23A8F1304();
  if (*(_QWORD *)(v9 + 16) && (v11 = sub_23A8BFF40((uint64_t)v23), (v12 & 1) != 0))
  {
    sub_23A8C44C0(*(_QWORD *)(v9 + 56) + 32 * v11, (uint64_t)&v24);
  }
  else
  {
    v24 = 0u;
    v25 = 0u;
  }
  swift_bridgeObjectRelease();
  sub_23A8C63A8((uint64_t)v23);
  if (!*((_QWORD *)&v25 + 1))
    goto LABEL_14;
  __swift_instantiateConcreteTypeFromMangledName(qword_2542D8B18);
  if ((swift_dynamicCast() & 1) != 0)
  {
    v13 = sub_23A8C62D8(v23[0]);
    swift_bridgeObjectRelease();
    sub_23A8DCB34(v13);
    swift_bridgeObjectRelease();
  }
LABEL_15:
  v14 = sub_23A8F0C08();
  if (!v14)
  {
    v24 = 0u;
    v25 = 0u;
    return sub_23A8C999C((uint64_t)&v24);
  }
  v15 = v14;
  v21 = sub_23A8F0DDC();
  v22 = v16;
  sub_23A8F1304();
  if (*(_QWORD *)(v15 + 16) && (v17 = sub_23A8BFF40((uint64_t)v23), (v18 & 1) != 0))
  {
    sub_23A8C44C0(*(_QWORD *)(v15 + 56) + 32 * v17, (uint64_t)&v24);
  }
  else
  {
    v24 = 0u;
    v25 = 0u;
  }
  swift_bridgeObjectRelease();
  sub_23A8C63A8((uint64_t)v23);
  if (!*((_QWORD *)&v25 + 1))
    return sub_23A8C999C((uint64_t)&v24);
  result = swift_dynamicCast();
  if ((result & 1) != 0 && LOBYTE(v23[0]) == 1)
    return sub_23A8DCF10();
  return result;
}

uint64_t sub_23A8D189C()
{
  return swift_task_switch();
}

uint64_t sub_23A8D18B0()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v3;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v5;
  char v6;

  if ((sub_23A8F0DD0() & 1) != 0)
  {
    v1 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 152) = v1;
    __swift_instantiateConcreteTypeFromMangledName(qword_2569C8A40);
    *v1 = v0;
    v1[1] = sub_23A8D1A5C;
    return sub_23A8F1400();
  }
  else
  {
    *(_QWORD *)(v0 + 40) = MEMORY[0x24BEE1328];
    *(_BYTE *)(v0 + 16) = 0;
    sub_23A8C62C8((_OWORD *)(v0 + 16), (_OWORD *)(v0 + 48));
    v3 = MEMORY[0x24BEE4B00];
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    sub_23A8DBF5C((_OWORD *)(v0 + 48), 0x737574617473, 0xE600000000000000, isUniquelyReferenced_nonNull_native);
    swift_bridgeObjectRelease();
    v5 = MEMORY[0x24BEE0D00];
    *(_QWORD *)(v0 + 80) = 0xD00000000000002DLL;
    *(_QWORD *)(v0 + 104) = v5;
    *(_QWORD *)(v0 + 88) = 0x800000023A8F3D40;
    sub_23A8C62C8((_OWORD *)(v0 + 80), (_OWORD *)(v0 + 112));
    v6 = swift_isUniquelyReferenced_nonNull_native();
    sub_23A8DBF5C((_OWORD *)(v0 + 112), 0x654D737574617473, 0xED00006567617373, v6);
    swift_bridgeObjectRelease();
    return (*(uint64_t (**)(uint64_t))(v0 + 8))(v3);
  }
}

uint64_t sub_23A8D1A5C()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 160) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23A8D1AC0()
{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(_QWORD *)(v0 + 144));
}

uint64_t sub_23A8D1AD0()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23A8D1ADC(uint64_t a1)
{
  return sub_23A8DB884(a1, &qword_2569C8C90, (uint64_t)&unk_250BB5D28, (uint64_t)&unk_2569C8CA0, (void (*)(char *, uint64_t, uint64_t))sub_23A8B1124);
}

uint64_t sub_23A8D1B00(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;

  v4[17] = a4;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569C8C90);
  v4[18] = v5;
  v6 = *(_QWORD *)(v5 - 8);
  v4[19] = v6;
  v4[20] = *(_QWORD *)(v6 + 64);
  v4[21] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23A8D1B68()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;

  v1 = v0[21];
  v2 = v0[18];
  v3 = v0[19];
  v4 = v0[17];
  type metadata accessor for HomeEnergyXPCConnection();
  swift_allocObject();
  v0[22] = sub_23A8EF888();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v1, v4, v2);
  v5 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v6 = swift_allocObject();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v3 + 32))(v6 + v5, v1, v2);
  v7 = (void *)sub_23A8EFE34((uint64_t)sub_23A8DE7F4, v6);
  v0[23] = v7;
  swift_release();
  v0[7] = v0 + 15;
  v0[2] = v0;
  v0[3] = sub_23A8D1CB8;
  v8 = swift_continuation_init();
  v0[10] = MEMORY[0x24BDAC760];
  v0[11] = 0x40000000;
  v0[12] = sub_23A8D1FE4;
  v0[13] = &block_descriptor_200;
  v0[14] = v8;
  objc_msgSend(v7, sel_dumpAllDataWithCompletionHandler_, v0 + 10);
  return swift_continuation_await();
}

uint64_t sub_23A8D1CB8()
{
  return swift_task_switch();
}

uint64_t sub_23A8D1D04()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(v0 + 176);
  v2 = *(_QWORD *)(v0 + 120);
  swift_unknownObjectRelease();
  objc_msgSend(*(id *)(v1 + 16), sel_invalidate);
  *(_QWORD *)(v0 + 128) = v2;
  sub_23A8F11F0();
  swift_release();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23A8D1D80(void *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  id v9;
  id v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  unint64_t v17;
  id v18;
  _QWORD v20[3];
  uint64_t v21;
  uint64_t v22;

  v4 = sub_23A8F10A0();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2569C8348 != -1)
    swift_once();
  v8 = __swift_project_value_buffer(v4, (uint64_t)qword_2569C9AE8);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v8, v4);
  v9 = a1;
  v10 = a1;
  v11 = sub_23A8F1088();
  v12 = sub_23A8F1274();
  if (os_log_type_enabled(v11, v12))
  {
    v20[2] = a2;
    v13 = (uint8_t *)swift_slowAlloc();
    v14 = swift_slowAlloc();
    v21 = (uint64_t)a1;
    v22 = v14;
    *(_DWORD *)v13 = 136315138;
    v20[1] = v13 + 4;
    v15 = a1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2542D8AE0);
    v16 = sub_23A8F1148();
    v21 = sub_23A8BF840(v16, v17, &v22);
    sub_23A8F12A4();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_23A8AD000, v11, v12, "Failed to dump all data. %s", v13, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B85B51C](v14, -1, -1);
    MEMORY[0x23B85B51C](v13, -1, -1);
  }
  else
  {

  }
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  v22 = (uint64_t)a1;
  v18 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569C8C90);
  return sub_23A8F11E4();
}

uint64_t sub_23A8D1FE4(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 32);
  **(_QWORD **)(*(_QWORD *)(v1 + 64) + 40) = sub_23A8F10B8();
  return swift_continuation_resume();
}

uint64_t sub_23A8D2038(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
  uint64_t v4;

  *(_QWORD *)(v4 + 24) = a2;
  *(_QWORD *)(v4 + 32) = a4;
  *(_BYTE *)(v4 + 64) = a3;
  *(_QWORD *)(v4 + 16) = a1;
  return swift_task_switch();
}

uint64_t sub_23A8D2058()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;

  if ((sub_23A8F0DD0() & 1) == 0)
    return (*(uint64_t (**)(void))(v0 + 8))();
  v2 = *(_QWORD *)(v0 + 24);
  v1 = *(_QWORD *)(v0 + 32);
  v3 = *(_BYTE *)(v0 + 64);
  v4 = *(_QWORD *)(v0 + 16);
  v5 = swift_task_alloc();
  *(_QWORD *)(v0 + 40) = v5;
  *(_QWORD *)(v5 + 16) = v4;
  *(_QWORD *)(v5 + 24) = v2;
  *(_BYTE *)(v5 + 32) = v3;
  *(_QWORD *)(v5 + 40) = v1;
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 48) = v6;
  *v6 = v0;
  v6[1] = sub_23A8D2138;
  return sub_23A8F1400();
}

uint64_t sub_23A8D2138()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 56) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23A8D21A4()
{
  uint64_t v0;

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23A8D21D8(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5)
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
  char *v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  int v28;

  v28 = a4;
  v26 = a2;
  v27 = a3;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542D8CF8);
  v8 = *(_QWORD *)(v7 - 8);
  v9 = *(_QWORD *)(v8 + 64);
  MEMORY[0x24BDAC7A8](v7);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542D8D18);
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(_QWORD *)(v11 + 64);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v25 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542D8AC0);
  MEMORY[0x24BDAC7A8](v14);
  v16 = (char *)&v25 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = sub_23A8F1208();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 56))(v16, 1, 1, v17);
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v13, a1, v10);
  sub_23A8DE498(a5, (uint64_t)&v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  v18 = (*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  v19 = (v12 + v18 + 7) & 0xFFFFFFFFFFFFFFF8;
  v20 = (*(unsigned __int8 *)(v8 + 80) + v19 + 17) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  v21 = swift_allocObject();
  *(_QWORD *)(v21 + 16) = 0;
  *(_QWORD *)(v21 + 24) = 0;
  (*(void (**)(unint64_t, char *, uint64_t))(v11 + 32))(v21 + v18, v13, v10);
  v22 = v21 + v19;
  v23 = v27;
  *(_QWORD *)v22 = v26;
  *(_QWORD *)(v22 + 8) = v23;
  *(_BYTE *)(v22 + 16) = v28;
  sub_23A8C7E20((uint64_t)&v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), v21 + v20, &qword_2542D8CF8);
  swift_bridgeObjectRetain();
  sub_23A8B1124((uint64_t)v16, (uint64_t)&unk_2569C8C88, v21);
  return swift_release();
}

uint64_t sub_23A8D23BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  *(_BYTE *)(v8 + 280) = a7;
  *(_QWORD *)(v8 + 168) = a6;
  *(_QWORD *)(v8 + 176) = a8;
  *(_QWORD *)(v8 + 152) = a4;
  *(_QWORD *)(v8 + 160) = a5;
  v9 = sub_23A8F10A0();
  *(_QWORD *)(v8 + 184) = v9;
  *(_QWORD *)(v8 + 192) = *(_QWORD *)(v9 - 8);
  *(_QWORD *)(v8 + 200) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2542D8CF8);
  *(_QWORD *)(v8 + 208) = swift_task_alloc();
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542D8D18);
  *(_QWORD *)(v8 + 216) = v10;
  v11 = *(_QWORD *)(v10 - 8);
  *(_QWORD *)(v8 + 224) = v11;
  *(_QWORD *)(v8 + 232) = *(_QWORD *)(v11 + 64);
  *(_QWORD *)(v8 + 240) = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23A8D2478()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;

  v1 = *(_QWORD *)(v0 + 240);
  v2 = *(_QWORD *)(v0 + 216);
  v3 = *(_QWORD *)(v0 + 224);
  v4 = *(_QWORD *)(v0 + 168);
  v5 = *(_QWORD *)(v0 + 152);
  type metadata accessor for HomeEnergyXPCConnection();
  swift_allocObject();
  *(_QWORD *)(v0 + 248) = sub_23A8EF888();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v1, v5, v2);
  v6 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v7 = swift_allocObject();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v3 + 32))(v7 + v6, v1, v2);
  v8 = (void *)sub_23A8EFE34((uint64_t)sub_23A8DE6D0, v7);
  *(_QWORD *)(v0 + 256) = v8;
  swift_release();
  if (v4)
    v9 = sub_23A8F1130();
  else
    v9 = 0;
  *(_QWORD *)(v0 + 264) = v9;
  v10 = *(_QWORD *)(v0 + 208);
  sub_23A8DE498(*(_QWORD *)(v0 + 176), v10);
  v11 = sub_23A8F0CA4();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11);
  v14 = 0;
  if (v13 != 1)
  {
    v15 = *(_QWORD *)(v0 + 208);
    v14 = sub_23A8F0C44();
    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v15, v11);
  }
  *(_QWORD *)(v0 + 272) = v14;
  v16 = *(unsigned __int8 *)(v0 + 280);
  *(_QWORD *)(v0 + 16) = v0;
  *(_QWORD *)(v0 + 24) = sub_23A8D2648;
  v17 = swift_continuation_init();
  *(_QWORD *)(v0 + 80) = MEMORY[0x24BDAC760];
  v18 = (_QWORD *)(v0 + 80);
  v18[1] = 0x40000000;
  v18[2] = sub_23A8DEDAC;
  v18[3] = &block_descriptor_192;
  v18[4] = v17;
  objc_msgSend(v8, sel_useMockDataWithFilePath_disableMock_validityDate_completionHandler_, v9, v16, v14, v18);
  return swift_continuation_await();
}

uint64_t sub_23A8D2648()
{
  return swift_task_switch();
}

uint64_t sub_23A8D2694()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  _BOOL4 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  uint8_t *v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v20;
  uint64_t v21;

  v2 = *(void **)(v0 + 264);
  v1 = *(void **)(v0 + 272);
  v3 = *(_QWORD *)(v0 + 248);
  swift_unknownObjectRelease();

  objc_msgSend(*(id *)(v3 + 16), sel_invalidate);
  if (qword_2542D8828 != -1)
    swift_once();
  v5 = *(_QWORD *)(v0 + 192);
  v4 = *(_QWORD *)(v0 + 200);
  v6 = *(_QWORD *)(v0 + 184);
  v7 = __swift_project_value_buffer(v6, (uint64_t)qword_2542D8DE0);
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v4, v7, v6);
  v8 = sub_23A8F1088();
  v9 = sub_23A8F1280();
  v10 = os_log_type_enabled(v8, v9);
  v11 = *(_QWORD *)(v0 + 192);
  v12 = *(_QWORD *)(v0 + 200);
  v13 = *(_QWORD *)(v0 + 184);
  if (v10)
  {
    v14 = *(unsigned __int8 *)(v0 + 280);
    v20 = *(_QWORD *)(v0 + 200);
    v15 = (uint8_t *)swift_slowAlloc();
    v16 = swift_slowAlloc();
    *(_DWORD *)v15 = 136315138;
    v21 = v16;
    if (v14)
      v17 = 0x64656C6261736964;
    else
      v17 = 0x64656C62616E65;
    if (v14)
      v18 = 0xE800000000000000;
    else
      v18 = 0xE700000000000000;
    *(_QWORD *)(v0 + 144) = sub_23A8BF840(v17, v18, &v21);
    sub_23A8F12A4();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23A8AD000, v8, v9, "Mock Data usage: %s", v15, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B85B51C](v16, -1, -1);
    MEMORY[0x23B85B51C](v15, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v20, v13);
  }
  else
  {

    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v12, v13);
  }
  sub_23A8F11F0();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23A8D28F8(void *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  id v9;
  id v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  unint64_t v17;
  id v18;
  _QWORD v20[3];
  uint64_t v21;
  uint64_t v22;

  v4 = sub_23A8F10A0();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2542D8828 != -1)
    swift_once();
  v8 = __swift_project_value_buffer(v4, (uint64_t)qword_2542D8DE0);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v8, v4);
  v9 = a1;
  v10 = a1;
  v11 = sub_23A8F1088();
  v12 = sub_23A8F1274();
  if (os_log_type_enabled(v11, v12))
  {
    v20[2] = a2;
    v13 = (uint8_t *)swift_slowAlloc();
    v14 = swift_slowAlloc();
    v21 = (uint64_t)a1;
    v22 = v14;
    *(_DWORD *)v13 = 136446210;
    v20[1] = v13 + 4;
    v15 = a1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2542D8AE0);
    v16 = sub_23A8F1148();
    v21 = sub_23A8BF840(v16, v17, &v22);
    sub_23A8F12A4();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_23A8AD000, v11, v12, "Failed to set mock data. %{public}s", v13, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B85B51C](v14, -1, -1);
    MEMORY[0x23B85B51C](v13, -1, -1);
  }
  else
  {

  }
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  v22 = (uint64_t)a1;
  v18 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2542D8D18);
  return sub_23A8F11E4();
}

uint64_t sub_23A8D2B5C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  __int128 v4;
  __int128 v5;

  *(_QWORD *)(v3 + 104) = a1;
  *(_QWORD *)(v3 + 112) = a2;
  v4 = *(_OWORD *)(a3 + 48);
  *(_OWORD *)(v3 + 48) = *(_OWORD *)(a3 + 32);
  *(_OWORD *)(v3 + 64) = v4;
  *(_BYTE *)(v3 + 80) = *(_BYTE *)(a3 + 64);
  v5 = *(_OWORD *)(a3 + 16);
  *(_OWORD *)(v3 + 16) = *(_OWORD *)a3;
  *(_OWORD *)(v3 + 32) = v5;
  return swift_task_switch();
}

uint64_t sub_23A8D2B8C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;

  if ((sub_23A8F0DD0() & 1) == 0)
    return (*(uint64_t (**)(_QWORD, unint64_t))(v0 + 8))(0, 0xE000000000000000);
  v2 = *(_QWORD *)(v0 + 104);
  v1 = *(_QWORD *)(v0 + 112);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 120) = v3;
  v3[2] = v2;
  v3[3] = v1;
  v3[4] = v0 + 16;
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 128) = v4;
  *v4 = v0;
  v4[1] = sub_23A8D2C74;
  return sub_23A8F1400();
}

uint64_t sub_23A8D2C74()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 136) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23A8D2CE0()
{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD, _QWORD))(v0 + 8))(*(_QWORD *)(v0 + 88), *(_QWORD *)(v0 + 96));
}

uint64_t sub_23A8D2CF0()
{
  uint64_t v0;

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23A8D2D24(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  unint64_t v19;
  __int128 v20;
  __int128 v21;
  uint64_t v23;
  uint64_t v24;

  v24 = a2;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569C8C68);
  v8 = *(_QWORD *)(v7 - 8);
  v9 = *(_QWORD *)(v8 + 64);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542D8AC0);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_23A8F1208();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v13, 1, 1, v14);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, a1, v7);
  v15 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  v16 = (v9 + v15 + 7) & 0xFFFFFFFFFFFFFFF8;
  v17 = swift_allocObject();
  *(_QWORD *)(v17 + 16) = 0;
  *(_QWORD *)(v17 + 24) = 0;
  (*(void (**)(unint64_t, char *, uint64_t))(v8 + 32))(v17 + v15, v10, v7);
  v18 = (_QWORD *)(v17 + v16);
  *v18 = v24;
  v18[1] = a3;
  v19 = v17 + ((v16 + 23) & 0xFFFFFFFFFFFFFFF8);
  *(_BYTE *)(v19 + 64) = *(_BYTE *)(a4 + 64);
  v20 = *(_OWORD *)(a4 + 48);
  *(_OWORD *)(v19 + 32) = *(_OWORD *)(a4 + 32);
  *(_OWORD *)(v19 + 48) = v20;
  v21 = *(_OWORD *)(a4 + 16);
  *(_OWORD *)v19 = *(_OWORD *)a4;
  *(_OWORD *)(v19 + 16) = v21;
  swift_bridgeObjectRetain();
  sub_23A8DDF0C(a4);
  sub_23A8B1124((uint64_t)v13, (uint64_t)&unk_2569C8C78, v17);
  return swift_release();
}

uint64_t sub_23A8D2EC0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v7[24] = a6;
  v7[25] = a7;
  v7[22] = a4;
  v7[23] = a5;
  v8 = sub_23A8F10A0();
  v7[26] = v8;
  v7[27] = *(_QWORD *)(v8 - 8);
  v7[28] = swift_task_alloc();
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569C8C68);
  v7[29] = v9;
  v10 = *(_QWORD *)(v9 - 8);
  v7[30] = v10;
  v7[31] = *(_QWORD *)(v10 + 64);
  v7[32] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23A8D2F54()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v13;

  v1 = v0;
  v13 = v0 + 18;
  v2 = v0[32];
  v3 = v0[30];
  v4 = v1[29];
  v5 = v1[22];
  type metadata accessor for HomeEnergyXPCConnection();
  swift_allocObject();
  v1[33] = sub_23A8EF888();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v2, v5, v4);
  v6 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v7 = swift_allocObject();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v3 + 32))(v7 + v6, v2, v4);
  v8 = (void *)sub_23A8EFE34((uint64_t)sub_23A8DE484, v7);
  v1[34] = v8;
  swift_release();
  v9 = sub_23A8F1130();
  v1[35] = v9;
  sub_23A8EF2CC();
  v10 = sub_23A8F10AC();
  v1[36] = v10;
  swift_bridgeObjectRelease();
  v1[7] = v13;
  v1[2] = v1;
  v1[3] = sub_23A8D3128;
  v11 = swift_continuation_init();
  v1[10] = MEMORY[0x24BDAC760];
  v1 += 10;
  v1[1] = 0x40000000;
  v1[2] = sub_23A8D3578;
  v1[3] = &block_descriptor_184;
  v1[4] = v11;
  objc_msgSend(v8, sel_testNotificationsForGridID_notificationContext_completionHandler_, v9, v10, v1);
  return swift_continuation_await();
}

uint64_t sub_23A8D3128()
{
  return swift_task_switch();
}

uint64_t sub_23A8D3174()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;

  v2 = *(void **)(v0 + 280);
  v1 = *(void **)(v0 + 288);
  v3 = *(_QWORD *)(v0 + 264);
  v4 = *(_QWORD *)(v0 + 152);
  v16 = *(_QWORD *)(v0 + 144);
  swift_unknownObjectRelease();

  objc_msgSend(*(id *)(v3 + 16), sel_invalidate);
  if (qword_2542D8828 != -1)
    swift_once();
  v6 = *(_QWORD *)(v0 + 216);
  v5 = *(_QWORD *)(v0 + 224);
  v7 = *(_QWORD *)(v0 + 208);
  v8 = __swift_project_value_buffer(v7, (uint64_t)qword_2542D8DE0);
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v5, v8, v7);
  v9 = sub_23A8F1088();
  v10 = sub_23A8F125C();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_23A8AD000, v9, v10, "Test notification triggered", v11, 2u);
    MEMORY[0x23B85B51C](v11, -1, -1);
  }
  v12 = *(_QWORD *)(v0 + 224);
  v13 = *(_QWORD *)(v0 + 208);
  v14 = *(_QWORD *)(v0 + 216);

  (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v12, v13);
  *(_QWORD *)(v0 + 160) = v16;
  *(_QWORD *)(v0 + 168) = v4;
  sub_23A8F11F0();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23A8D3314(void *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  id v9;
  id v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  unint64_t v17;
  id v18;
  _QWORD v20[3];
  uint64_t v21;
  uint64_t v22;

  v4 = sub_23A8F10A0();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2542D8828 != -1)
    swift_once();
  v8 = __swift_project_value_buffer(v4, (uint64_t)qword_2542D8DE0);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v8, v4);
  v9 = a1;
  v10 = a1;
  v11 = sub_23A8F1088();
  v12 = sub_23A8F1274();
  if (os_log_type_enabled(v11, v12))
  {
    v20[2] = a2;
    v13 = (uint8_t *)swift_slowAlloc();
    v14 = swift_slowAlloc();
    v21 = (uint64_t)a1;
    v22 = v14;
    *(_DWORD *)v13 = 136446210;
    v20[1] = v13 + 4;
    v15 = a1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2542D8AE0);
    v16 = sub_23A8F1148();
    v21 = sub_23A8BF840(v16, v17, &v22);
    sub_23A8F12A4();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_23A8AD000, v11, v12, "Failed to set Home Energy Notification.%{public}s", v13, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B85B51C](v14, -1, -1);
    MEMORY[0x23B85B51C](v13, -1, -1);
  }
  else
  {

  }
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  v22 = (uint64_t)a1;
  v18 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569C8C68);
  return sub_23A8F11E4();
}

uint64_t sub_23A8D3578(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = sub_23A8F113C();
  v3 = *(uint64_t **)(*(_QWORD *)(v1 + 64) + 40);
  *v3 = v2;
  v3[1] = v4;
  return swift_continuation_resume();
}

uint64_t sub_23A8D35AC(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = a1;
  return swift_task_switch();
}

uint64_t sub_23A8D35C4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  if ((sub_23A8F0DD0() & 1) == 0)
    return (*(uint64_t (**)(void))(v0 + 8))();
  v1 = *(_QWORD *)(v0 + 16);
  v2 = swift_task_alloc();
  *(_QWORD *)(v0 + 24) = v2;
  *(_QWORD *)(v2 + 16) = v1;
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 32) = v3;
  *v3 = v0;
  v3[1] = sub_23A8D367C;
  return sub_23A8F1400();
}

uint64_t sub_23A8D367C()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 40) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23A8D36E8()
{
  uint64_t v0;

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23A8D371C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v14;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542D8D18);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(_QWORD *)(v5 + 64);
  MEMORY[0x24BDAC7A8](v4);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542D8AC0);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_23A8F1208();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v9, 1, 1, v10);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))((char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v4);
  v11 = (*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = 0;
  *(_QWORD *)(v12 + 24) = 0;
  (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v12 + v11, (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v4);
  *(_QWORD *)(v12 + ((v6 + v11 + 7) & 0xFFFFFFFFFFFFFFF8)) = a2;
  swift_bridgeObjectRetain();
  sub_23A8B1124((uint64_t)v9, (uint64_t)&unk_2569C8C60, v12);
  return swift_release();
}

uint64_t sub_23A8D3870(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v5[18] = a4;
  v5[19] = a5;
  v6 = sub_23A8F10A0();
  v5[20] = v6;
  v5[21] = *(_QWORD *)(v6 - 8);
  v5[22] = swift_task_alloc();
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542D8D18);
  v5[23] = v7;
  v8 = *(_QWORD *)(v7 - 8);
  v5[24] = v8;
  v5[25] = *(_QWORD *)(v8 + 64);
  v5[26] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23A8D3900()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;

  v1 = v0[26];
  v2 = v0[23];
  v3 = v0[24];
  v4 = v0[18];
  type metadata accessor for HomeEnergyXPCConnection();
  swift_allocObject();
  v0[27] = sub_23A8EF888();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v1, v4, v2);
  v5 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v6 = swift_allocObject();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v3 + 32))(v6 + v5, v1, v2);
  v7 = (void *)sub_23A8EFE34((uint64_t)sub_23A8DE2D8, v6);
  v0[28] = v7;
  swift_release();
  v8 = sub_23A8F1220();
  v0[29] = v8;
  v0[2] = v0;
  v0[3] = sub_23A8D3A6C;
  v9 = swift_continuation_init();
  v0[10] = MEMORY[0x24BDAC760];
  v0[11] = 0x40000000;
  v0[12] = sub_23A8DEDAC;
  v0[13] = &block_descriptor_176;
  v0[14] = v9;
  objc_msgSend(v7, sel_testDelegateForGridIds_completionHandler_, v8, v0 + 10);
  return swift_continuation_await();
}

uint64_t sub_23A8D3A6C()
{
  return swift_task_switch();
}

uint64_t sub_23A8D3AB8()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v1 = *(void **)(v0 + 232);
  v2 = *(_QWORD *)(v0 + 216);
  swift_unknownObjectRelease();

  objc_msgSend(*(id *)(v2 + 16), sel_invalidate);
  if (qword_2542D8828 != -1)
    swift_once();
  v4 = *(_QWORD *)(v0 + 168);
  v3 = *(_QWORD *)(v0 + 176);
  v5 = *(_QWORD *)(v0 + 160);
  v6 = __swift_project_value_buffer(v5, (uint64_t)qword_2542D8DE0);
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v3, v6, v5);
  v7 = sub_23A8F1088();
  v8 = sub_23A8F125C();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_23A8AD000, v7, v8, "Test delegate", v9, 2u);
    MEMORY[0x23B85B51C](v9, -1, -1);
  }
  v10 = *(_QWORD *)(v0 + 176);
  v11 = *(_QWORD *)(v0 + 160);
  v12 = *(_QWORD *)(v0 + 168);

  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v10, v11);
  sub_23A8F11F0();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23A8D3C34(void *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  id v9;
  id v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  unint64_t v17;
  id v18;
  _QWORD v20[3];
  uint64_t v21;
  uint64_t v22;

  v4 = sub_23A8F10A0();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2542D8828 != -1)
    swift_once();
  v8 = __swift_project_value_buffer(v4, (uint64_t)qword_2542D8DE0);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v8, v4);
  v9 = a1;
  v10 = a1;
  v11 = sub_23A8F1088();
  v12 = sub_23A8F1274();
  if (os_log_type_enabled(v11, v12))
  {
    v20[2] = a2;
    v13 = (uint8_t *)swift_slowAlloc();
    v14 = swift_slowAlloc();
    v21 = (uint64_t)a1;
    v22 = v14;
    *(_DWORD *)v13 = 136446210;
    v20[1] = v13 + 4;
    v15 = a1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2542D8AE0);
    v16 = sub_23A8F1148();
    v21 = sub_23A8BF840(v16, v17, &v22);
    sub_23A8F12A4();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_23A8AD000, v11, v12, "Failed to test Home Energy Delegate.%{public}s", v13, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B85B51C](v14, -1, -1);
    MEMORY[0x23B85B51C](v13, -1, -1);
  }
  else
  {

  }
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  v22 = (uint64_t)a1;
  v18 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2542D8D18);
  return sub_23A8F11E4();
}

uint64_t sub_23A8D3E98()
{
  return swift_task_switch();
}

uint64_t sub_23A8D3EAC()
{
  uint64_t v0;
  _QWORD *v1;

  if ((sub_23A8F0DD0() & 1) == 0)
    return (*(uint64_t (**)(void))(v0 + 8))();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_23A8D3F4C;
  return sub_23A8F1400();
}

uint64_t sub_23A8D3F4C()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 24) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23A8D3FB0(uint64_t a1)
{
  return sub_23A8DB884(a1, &qword_2542D8D18, (uint64_t)&unk_250BB5B88, (uint64_t)&unk_2569C8C50, (void (*)(char *, uint64_t, uint64_t))sub_23A8B1124);
}

uint64_t sub_23A8D3FD4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4[18] = a4;
  v5 = sub_23A8F10A0();
  v4[19] = v5;
  v4[20] = *(_QWORD *)(v5 - 8);
  v4[21] = swift_task_alloc();
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542D8D18);
  v4[22] = v6;
  v7 = *(_QWORD *)(v6 - 8);
  v4[23] = v7;
  v4[24] = *(_QWORD *)(v7 + 64);
  v4[25] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23A8D4064()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;

  v1 = v0[25];
  v2 = v0[22];
  v3 = v0[23];
  v4 = v0[18];
  type metadata accessor for HomeEnergyXPCConnection();
  swift_allocObject();
  v0[26] = sub_23A8EF888();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v1, v4, v2);
  v5 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v6 = swift_allocObject();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v3 + 32))(v6 + v5, v1, v2);
  v7 = (void *)sub_23A8EFE34((uint64_t)sub_23A8DE17C, v6);
  v0[27] = v7;
  swift_release();
  v0[2] = v0;
  v0[3] = sub_23A8D41A4;
  v8 = swift_continuation_init();
  v0[10] = MEMORY[0x24BDAC760];
  v0[11] = 0x40000000;
  v0[12] = sub_23A8DEDAC;
  v0[13] = &block_descriptor_168;
  v0[14] = v8;
  objc_msgSend(v7, sel_testSetMockURLSessionWithCompletionHandler_, v0 + 10);
  return swift_continuation_await();
}

uint64_t sub_23A8D41A4()
{
  return swift_task_switch();
}

uint64_t sub_23A8D41F0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v1 = *(_QWORD *)(v0 + 208);
  swift_unknownObjectRelease();
  objc_msgSend(*(id *)(v1 + 16), sel_invalidate);
  if (qword_2542D8828 != -1)
    swift_once();
  v3 = *(_QWORD *)(v0 + 160);
  v2 = *(_QWORD *)(v0 + 168);
  v4 = *(_QWORD *)(v0 + 152);
  v5 = __swift_project_value_buffer(v4, (uint64_t)qword_2542D8DE0);
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v2, v5, v4);
  v6 = sub_23A8F1088();
  v7 = sub_23A8F125C();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_23A8AD000, v6, v7, "Set mock url session", v8, 2u);
    MEMORY[0x23B85B51C](v8, -1, -1);
  }
  v9 = *(_QWORD *)(v0 + 168);
  v10 = *(_QWORD *)(v0 + 152);
  v11 = *(_QWORD *)(v0 + 160);

  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v9, v10);
  sub_23A8F11F0();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23A8D4364(void *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  id v9;
  id v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  unint64_t v17;
  id v18;
  _QWORD v20[3];
  uint64_t v21;
  uint64_t v22;

  v4 = sub_23A8F10A0();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2542D8828 != -1)
    swift_once();
  v8 = __swift_project_value_buffer(v4, (uint64_t)qword_2542D8DE0);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v8, v4);
  v9 = a1;
  v10 = a1;
  v11 = sub_23A8F1088();
  v12 = sub_23A8F1274();
  if (os_log_type_enabled(v11, v12))
  {
    v20[2] = a2;
    v13 = (uint8_t *)swift_slowAlloc();
    v14 = swift_slowAlloc();
    v21 = (uint64_t)a1;
    v22 = v14;
    *(_DWORD *)v13 = 136446210;
    v20[1] = v13 + 4;
    v15 = a1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2542D8AE0);
    v16 = sub_23A8F1148();
    v21 = sub_23A8BF840(v16, v17, &v22);
    sub_23A8F12A4();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_23A8AD000, v11, v12, "Failed to set URL Session for Home Services.%{public}s", v13, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B85B51C](v14, -1, -1);
    MEMORY[0x23B85B51C](v13, -1, -1);
  }
  else
  {

  }
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  v22 = (uint64_t)a1;
  v18 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2542D8D18);
  return sub_23A8F11E4();
}

uint64_t sub_23A8D45C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;

  v4[5] = a3;
  v4[6] = a4;
  v4[3] = a1;
  v4[4] = a2;
  return swift_task_switch();
}

uint64_t sub_23A8D45E4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  __int128 v6;

  v2 = *(_QWORD *)(v0 + 40);
  v1 = *(_QWORD *)(v0 + 48);
  v6 = *(_OWORD *)(v0 + 24);
  v3 = swift_task_alloc();
  *(_QWORD *)(v0 + 56) = v3;
  *(_OWORD *)(v3 + 16) = v6;
  *(_QWORD *)(v3 + 32) = v2;
  *(_QWORD *)(v3 + 40) = v1;
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 64) = v4;
  *v4 = v0;
  v4[1] = sub_23A8D46A4;
  return sub_23A8F1400();
}

uint64_t sub_23A8D46A4()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 72) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23A8D4710()
{
  uint64_t v0;

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23A8D4744(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  unint64_t v16;
  char *v17;
  uint64_t v19;
  uint64_t v20;

  v20 = a4;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542D8AB0);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(_QWORD *)(v10 + 64);
  MEMORY[0x24BDAC7A8](v9);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542D8AC0);
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)&v19 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_23A8F1208();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56))(v14, 1, 1, v15);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))((char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v9);
  v16 = (*(unsigned __int8 *)(v10 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v17 = (char *)swift_allocObject();
  *((_QWORD *)v17 + 2) = 0;
  *((_QWORD *)v17 + 3) = 0;
  *((_QWORD *)v17 + 4) = a2;
  *((_QWORD *)v17 + 5) = a3;
  *((_QWORD *)v17 + 6) = v20;
  *((_QWORD *)v17 + 7) = a5;
  (*(void (**)(char *, char *, uint64_t))(v10 + 32))(&v17[v16], (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), v9);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_23A8B1124((uint64_t)v14, (uint64_t)&unk_2569C8C40, (uint64_t)v17);
  return swift_release();
}

uint64_t sub_23A8D48B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v8[25] = a7;
  v8[26] = a8;
  v8[23] = a5;
  v8[24] = a6;
  v8[22] = a4;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542D8AB0);
  v8[27] = v9;
  v10 = *(_QWORD *)(v9 - 8);
  v8[28] = v10;
  v8[29] = *(_QWORD *)(v10 + 64);
  v8[30] = swift_task_alloc();
  v11 = sub_23A8F10A0();
  v8[31] = v11;
  v8[32] = *(_QWORD *)(v11 - 8);
  v8[33] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23A8D494C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  _BOOL4 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;

  if (qword_2542D8828 != -1)
    swift_once();
  v1 = v0[32];
  v2 = v0[33];
  v3 = v0[31];
  v4 = v0[25];
  v5 = __swift_project_value_buffer(v3, (uint64_t)qword_2542D8DE0);
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v1 + 16))(v2, v5, v3);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  v6 = sub_23A8F1088();
  v7 = sub_23A8F125C();
  v8 = os_log_type_enabled(v6, v7);
  v10 = v0[32];
  v9 = v0[33];
  v11 = v0[31];
  if (v8)
  {
    v34 = v0[32];
    v12 = v0[22];
    v29 = v0[25];
    v30 = v0[24];
    v33 = v0[33];
    v13 = v0[23];
    v14 = swift_slowAlloc();
    v31 = swift_slowAlloc();
    v36 = v31;
    *(_DWORD *)v14 = 136380931;
    v32 = v11;
    swift_bridgeObjectRetain();
    v0[20] = sub_23A8BF840(v12, v13, &v36);
    sub_23A8F12A4();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v14 + 12) = 2081;
    if (v29)
      v15 = v30;
    else
      v15 = 0x20656D6F48206F4ELL;
    if (v29)
      v16 = v4;
    else
      v16 = 0xEA00000000004449;
    swift_bridgeObjectRetain();
    v0[21] = sub_23A8BF840(v15, v16, &v36);
    sub_23A8F12A4();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_23A8AD000, v6, v7, "Checking if next clean energy window notification is enabled for %{private}s, %{private}s", (uint8_t *)v14, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x23B85B51C](v31, -1, -1);
    MEMORY[0x23B85B51C](v14, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v34 + 8))(v33, v32);
  }
  else
  {
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();

    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v9, v11);
  }
  v17 = v0[30];
  v18 = v0[27];
  v19 = v0[28];
  v20 = v0[26];
  v35 = v0[25];
  type metadata accessor for HomeEnergyXPCConnection();
  swift_allocObject();
  v0[34] = sub_23A8EF888();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v19 + 16))(v17, v20, v18);
  v21 = (*(unsigned __int8 *)(v19 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
  v22 = swift_allocObject();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v19 + 32))(v22 + v21, v17, v18);
  v23 = (void *)sub_23A8EFE34((uint64_t)sub_23A8DE0C8, v22);
  v0[35] = v23;
  swift_release();
  v24 = sub_23A8F1130();
  v0[36] = v24;
  if (v35)
    v25 = sub_23A8F1130();
  else
    v25 = 0;
  v0[37] = v25;
  v0[7] = v0 + 18;
  v0[2] = v0;
  v0[3] = sub_23A8D4D5C;
  v26 = swift_continuation_init();
  v0[10] = MEMORY[0x24BDAC760];
  v27 = v0 + 10;
  v27[1] = 0x40000000;
  v27[2] = sub_23A8DE968;
  v27[3] = &block_descriptor_160;
  v27[4] = v26;
  objc_msgSend(v23, sel_isNextCleanEnergyWindowNotificationEnabledForGridID_homeID_completionHandler_, v24, v25, v27);
  return swift_continuation_await();
}

uint64_t sub_23A8D4D5C()
{
  return swift_task_switch();
}

uint64_t sub_23A8D4DA8()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *(void **)(v0 + 288);
  v1 = *(void **)(v0 + 296);
  v3 = *(_QWORD *)(v0 + 272);
  v4 = *(_QWORD *)(v0 + 144);
  swift_unknownObjectRelease();

  objc_msgSend(*(id *)(v3 + 16), sel_invalidate);
  *(_QWORD *)(v0 + 152) = v4;
  sub_23A8F11F0();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23A8D4E44(void *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  id v9;
  id v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  unint64_t v17;
  id v18;
  _QWORD v20[3];
  uint64_t v21;
  uint64_t v22;

  v4 = sub_23A8F10A0();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2542D8828 != -1)
    swift_once();
  v8 = __swift_project_value_buffer(v4, (uint64_t)qword_2542D8DE0);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v8, v4);
  v9 = a1;
  v10 = a1;
  v11 = sub_23A8F1088();
  v12 = sub_23A8F1274();
  if (os_log_type_enabled(v11, v12))
  {
    v20[2] = a2;
    v13 = (uint8_t *)swift_slowAlloc();
    v14 = swift_slowAlloc();
    v21 = (uint64_t)a1;
    v22 = v14;
    *(_DWORD *)v13 = 136446210;
    v20[1] = v13 + 4;
    v15 = a1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2542D8AE0);
    v16 = sub_23A8F1148();
    v21 = sub_23A8BF840(v16, v17, &v22);
    sub_23A8F12A4();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_23A8AD000, v11, v12, "Failed to get Home Energy Notification status.%{public}s", v13, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B85B51C](v14, -1, -1);
    MEMORY[0x23B85B51C](v13, -1, -1);
  }
  else
  {

  }
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  v22 = (uint64_t)a1;
  v18 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2542D8AB0);
  return sub_23A8F11E4();
}

uint64_t sub_23A8D50A8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  __int128 v4;
  __int128 v5;

  *(_QWORD *)(v3 + 96) = a1;
  *(_QWORD *)(v3 + 104) = a2;
  v4 = *(_OWORD *)(a3 + 48);
  *(_OWORD *)(v3 + 48) = *(_OWORD *)(a3 + 32);
  *(_OWORD *)(v3 + 64) = v4;
  *(_BYTE *)(v3 + 80) = *(_BYTE *)(a3 + 64);
  v5 = *(_OWORD *)(a3 + 16);
  *(_OWORD *)(v3 + 16) = *(_OWORD *)a3;
  *(_OWORD *)(v3 + 32) = v5;
  return swift_task_switch();
}

uint64_t sub_23A8D50D8()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;

  v2 = v0[12];
  v1 = v0[13];
  v3 = (_QWORD *)swift_task_alloc();
  v0[14] = v3;
  v3[2] = v2;
  v3[3] = v1;
  v3[4] = v0 + 2;
  v4 = (_QWORD *)swift_task_alloc();
  v0[15] = v4;
  *v4 = v0;
  v4[1] = sub_23A8D5190;
  return sub_23A8F1400();
}

uint64_t sub_23A8D5190()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 128) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23A8D51FC()
{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(_QWORD *)(v0 + 88));
}

uint64_t sub_23A8D520C()
{
  uint64_t v0;

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23A8D5240(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  unint64_t v15;
  char *v16;
  char *v17;
  __int128 v18;
  __int128 v19;
  uint64_t v21;

  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569C8BC0);
  v9 = *(_QWORD *)(v8 - 8);
  v10 = *(_QWORD *)(v9 + 64);
  MEMORY[0x24BDAC7A8](v8);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542D8AC0);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_23A8F1208();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v13, 1, 1, v14);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))((char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v8);
  v15 = (*(unsigned __int8 *)(v9 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  v16 = (char *)swift_allocObject();
  *((_QWORD *)v16 + 2) = 0;
  *((_QWORD *)v16 + 3) = 0;
  *((_QWORD *)v16 + 4) = a2;
  *((_QWORD *)v16 + 5) = a3;
  (*(void (**)(char *, char *, uint64_t))(v9 + 32))(&v16[v15], (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), v8);
  v17 = &v16[(v10 + v15 + 7) & 0xFFFFFFFFFFFFFFF8];
  v18 = *(_OWORD *)(a4 + 48);
  *((_OWORD *)v17 + 2) = *(_OWORD *)(a4 + 32);
  *((_OWORD *)v17 + 3) = v18;
  v17[64] = *(_BYTE *)(a4 + 64);
  v19 = *(_OWORD *)(a4 + 16);
  *(_OWORD *)v17 = *(_OWORD *)a4;
  *((_OWORD *)v17 + 1) = v19;
  swift_bridgeObjectRetain();
  sub_23A8DDF0C(a4);
  sub_23A8B1124((uint64_t)v13, (uint64_t)&unk_2569C8C30, (uint64_t)v16);
  return swift_release();
}

uint64_t sub_23A8D53C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v7[23] = a6;
  v7[24] = a7;
  v7[21] = a4;
  v7[22] = a5;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569C8BC0);
  v7[25] = v8;
  v9 = *(_QWORD *)(v8 - 8);
  v7[26] = v9;
  v7[27] = *(_QWORD *)(v9 + 64);
  v7[28] = swift_task_alloc();
  v10 = sub_23A8F10A0();
  v7[29] = v10;
  v7[30] = *(_QWORD *)(v10 - 8);
  v7[31] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23A8D545C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  _BOOL4 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint8_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  uint64_t v30;
  uint64_t v31;
  _OWORD v32[4];
  char v33;

  if (qword_2542D8828 != -1)
    swift_once();
  v2 = v0[30];
  v1 = v0[31];
  v3 = v0[29];
  v4 = __swift_project_value_buffer(v3, (uint64_t)qword_2542D8DE0);
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v4, v3);
  swift_bridgeObjectRetain_n();
  v5 = sub_23A8F1088();
  v6 = sub_23A8F125C();
  v7 = os_log_type_enabled(v5, v6);
  v9 = v0[30];
  v8 = v0[31];
  v10 = v0[29];
  v11 = v0[22];
  if (v7)
  {
    v12 = v0[21];
    v31 = v0[29];
    v13 = (uint8_t *)swift_slowAlloc();
    v30 = v8;
    v14 = swift_slowAlloc();
    *(_QWORD *)&v32[0] = v14;
    *(_DWORD *)v13 = 136380675;
    swift_bridgeObjectRetain();
    v0[20] = sub_23A8BF840(v12, v11, (uint64_t *)v32);
    sub_23A8F12A4();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_23A8AD000, v5, v6, "Enabling next clean energy window notification for %{private}s\"", v13, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B85B51C](v14, -1, -1);
    MEMORY[0x23B85B51C](v13, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v30, v31);
  }
  else
  {
    swift_bridgeObjectRelease_n();

    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v8, v10);
  }
  v15 = v0[28];
  v17 = v0[25];
  v16 = v0[26];
  v18 = v0[23];
  v19 = v0[24];
  type metadata accessor for HomeEnergyXPCConnection();
  swift_allocObject();
  v0[32] = sub_23A8EF888();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v16 + 16))(v15, v18, v17);
  v20 = (*(unsigned __int8 *)(v16 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  v21 = swift_allocObject();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v16 + 32))(v21 + v20, v15, v17);
  v22 = (void *)sub_23A8EFE34((uint64_t)sub_23A8DDF6C, v21);
  v0[33] = v22;
  swift_release();
  v23 = sub_23A8F1130();
  v0[34] = v23;
  v24 = *(_OWORD *)(v19 + 48);
  v32[2] = *(_OWORD *)(v19 + 32);
  v32[3] = v24;
  v33 = *(_BYTE *)(v19 + 64);
  v25 = *(_OWORD *)(v19 + 16);
  v32[0] = *(_OWORD *)v19;
  v32[1] = v25;
  sub_23A8EF2CC();
  v26 = sub_23A8F10AC();
  v0[35] = v26;
  swift_bridgeObjectRelease();
  v0[7] = v0 + 18;
  v0[2] = v0;
  v0[3] = sub_23A8D57F8;
  v27 = swift_continuation_init();
  v0[10] = MEMORY[0x24BDAC760];
  v28 = v0 + 10;
  v28[1] = 0x40000000;
  v28[2] = sub_23A8D5B48;
  v28[3] = &block_descriptor_152;
  v28[4] = v27;
  objc_msgSend(v22, sel_enableNextCleanEnergyWindowNotificationsForGridID_notificationContext_completionHandler_, v23, v26, v28);
  return swift_continuation_await();
}

uint64_t sub_23A8D57F8()
{
  return swift_task_switch();
}

uint64_t sub_23A8D5844()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *(void **)(v0 + 272);
  v1 = *(void **)(v0 + 280);
  v3 = *(_QWORD *)(v0 + 256);
  v4 = *(_QWORD *)(v0 + 144);
  swift_unknownObjectRelease();

  objc_msgSend(*(id *)(v3 + 16), sel_invalidate);
  *(_QWORD *)(v0 + 152) = v4;
  sub_23A8F11F0();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23A8D58E4(void *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  id v9;
  id v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  unint64_t v17;
  id v18;
  _QWORD v20[3];
  uint64_t v21;
  uint64_t v22;

  v4 = sub_23A8F10A0();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2542D8828 != -1)
    swift_once();
  v8 = __swift_project_value_buffer(v4, (uint64_t)qword_2542D8DE0);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v8, v4);
  v9 = a1;
  v10 = a1;
  v11 = sub_23A8F1088();
  v12 = sub_23A8F1274();
  if (os_log_type_enabled(v11, v12))
  {
    v20[2] = a2;
    v13 = (uint8_t *)swift_slowAlloc();
    v14 = swift_slowAlloc();
    v21 = (uint64_t)a1;
    v22 = v14;
    *(_DWORD *)v13 = 136446210;
    v20[1] = v13 + 4;
    v15 = a1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2542D8AE0);
    v16 = sub_23A8F1148();
    v21 = sub_23A8BF840(v16, v17, &v22);
    sub_23A8F12A4();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_23A8AD000, v11, v12, "Enable next clean energy forecast failed.%{public}s", v13, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B85B51C](v14, -1, -1);
    MEMORY[0x23B85B51C](v13, -1, -1);
  }
  else
  {

  }
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  v22 = (uint64_t)a1;
  v18 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569C8BC0);
  return sub_23A8F11E4();
}

uint64_t sub_23A8D5B48(uint64_t a1, uint64_t a2)
{
  **(_QWORD **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 64) + 40) = a2;
  return swift_continuation_resume();
}

uint64_t sub_23A8D5B5C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;

  v4[5] = a3;
  v4[6] = a4;
  v4[3] = a1;
  v4[4] = a2;
  return swift_task_switch();
}

uint64_t sub_23A8D5B78()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  __int128 v6;

  v2 = *(_QWORD *)(v0 + 40);
  v1 = *(_QWORD *)(v0 + 48);
  v6 = *(_OWORD *)(v0 + 24);
  v3 = swift_task_alloc();
  *(_QWORD *)(v0 + 56) = v3;
  *(_OWORD *)(v3 + 16) = v6;
  *(_QWORD *)(v3 + 32) = v2;
  *(_QWORD *)(v3 + 40) = v1;
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 64) = v4;
  *v4 = v0;
  v4[1] = sub_23A8D5C38;
  return sub_23A8F1400();
}

uint64_t sub_23A8D5C38()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 72) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23A8D5CA4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  unint64_t v16;
  char *v17;
  uint64_t v19;
  uint64_t v20;

  v20 = a4;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569C8BC0);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(_QWORD *)(v10 + 64);
  MEMORY[0x24BDAC7A8](v9);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542D8AC0);
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)&v19 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_23A8F1208();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56))(v14, 1, 1, v15);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))((char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v9);
  v16 = (*(unsigned __int8 *)(v10 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v17 = (char *)swift_allocObject();
  *((_QWORD *)v17 + 2) = 0;
  *((_QWORD *)v17 + 3) = 0;
  *((_QWORD *)v17 + 4) = a2;
  *((_QWORD *)v17 + 5) = a3;
  *((_QWORD *)v17 + 6) = v20;
  *((_QWORD *)v17 + 7) = a5;
  (*(void (**)(char *, char *, uint64_t))(v10 + 32))(&v17[v16], (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), v9);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_23A8B1124((uint64_t)v14, (uint64_t)&unk_2569C8C20, (uint64_t)v17);
  return swift_release();
}

uint64_t sub_23A8D5E14(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v8[25] = a7;
  v8[26] = a8;
  v8[23] = a5;
  v8[24] = a6;
  v8[22] = a4;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569C8BC0);
  v8[27] = v9;
  v10 = *(_QWORD *)(v9 - 8);
  v8[28] = v10;
  v8[29] = *(_QWORD *)(v10 + 64);
  v8[30] = swift_task_alloc();
  v11 = sub_23A8F10A0();
  v8[31] = v11;
  v8[32] = *(_QWORD *)(v11 - 8);
  v8[33] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23A8D5EAC()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  _BOOL4 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  if (qword_2542D8828 != -1)
    swift_once();
  v2 = v0[32];
  v1 = v0[33];
  v3 = v0[31];
  v4 = __swift_project_value_buffer(v3, (uint64_t)qword_2542D8DE0);
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v4, v3);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  v5 = sub_23A8F1088();
  v6 = sub_23A8F125C();
  v7 = os_log_type_enabled(v5, v6);
  v9 = v0[32];
  v8 = v0[33];
  v10 = v0[31];
  v11 = v0[25];
  if (v7)
  {
    v30 = v0[31];
    v31 = v0[33];
    v12 = v0[22];
    v13 = v0[23];
    v27 = v0[24];
    v29 = v0[32];
    v14 = swift_slowAlloc();
    v28 = swift_slowAlloc();
    v32 = v28;
    *(_DWORD *)v14 = 136380931;
    swift_bridgeObjectRetain();
    v0[20] = sub_23A8BF840(v12, v13, &v32);
    sub_23A8F12A4();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v14 + 12) = 2081;
    swift_bridgeObjectRetain();
    v0[21] = sub_23A8BF840(v27, v11, &v32);
    sub_23A8F12A4();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_23A8AD000, v5, v6, "Disabling next clean energy window notification for %{private}s, %{private}s\"", (uint8_t *)v14, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x23B85B51C](v28, -1, -1);
    MEMORY[0x23B85B51C](v14, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v29 + 8))(v31, v30);
  }
  else
  {
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();

    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v8, v10);
  }
  v15 = v0[30];
  v17 = v0[27];
  v16 = v0[28];
  v18 = v0[26];
  type metadata accessor for HomeEnergyXPCConnection();
  swift_allocObject();
  v0[34] = sub_23A8EF888();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v16 + 16))(v15, v18, v17);
  v19 = (*(unsigned __int8 *)(v16 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  v20 = swift_allocObject();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v16 + 32))(v20 + v19, v15, v17);
  v21 = (void *)sub_23A8EFE34((uint64_t)sub_23A8DDD84, v20);
  v0[35] = v21;
  swift_release();
  v22 = sub_23A8F1130();
  v0[36] = v22;
  v23 = sub_23A8F1130();
  v0[37] = v23;
  v0[7] = v0 + 18;
  v0[2] = v0;
  v0[3] = sub_23A8D4D5C;
  v24 = swift_continuation_init();
  v0[10] = MEMORY[0x24BDAC760];
  v25 = v0 + 10;
  v25[1] = 0x40000000;
  v25[2] = sub_23A8D5B48;
  v25[3] = &block_descriptor_144;
  v25[4] = v24;
  objc_msgSend(v21, sel_disableNextCleanEnergyWindowNotificationsForGridID_homeID_completionHandler_, v22, v23, v25);
  return swift_continuation_await();
}

uint64_t sub_23A8D626C(void *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  id v9;
  id v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  unint64_t v17;
  id v18;
  _QWORD v20[3];
  uint64_t v21;
  uint64_t v22;

  v4 = sub_23A8F10A0();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2542D8828 != -1)
    swift_once();
  v8 = __swift_project_value_buffer(v4, (uint64_t)qword_2542D8DE0);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v8, v4);
  v9 = a1;
  v10 = a1;
  v11 = sub_23A8F1088();
  v12 = sub_23A8F1274();
  if (os_log_type_enabled(v11, v12))
  {
    v20[2] = a2;
    v13 = (uint8_t *)swift_slowAlloc();
    v14 = swift_slowAlloc();
    v21 = (uint64_t)a1;
    v22 = v14;
    *(_DWORD *)v13 = 136446210;
    v20[1] = v13 + 4;
    v15 = a1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2542D8AE0);
    v16 = sub_23A8F1148();
    v21 = sub_23A8BF840(v16, v17, &v22);
    sub_23A8F12A4();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_23A8AD000, v11, v12, "Disable next clean energy forecast failed.%{public}s", v13, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B85B51C](v14, -1, -1);
    MEMORY[0x23B85B51C](v13, -1, -1);
  }
  else
  {

  }
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  v22 = (uint64_t)a1;
  v18 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569C8BC0);
  return sub_23A8F11E4();
}

uint64_t sub_23A8D64D0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 24) = a1;
  *(_QWORD *)(v2 + 32) = a2;
  return swift_task_switch();
}

uint64_t sub_23A8D64E8()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v2 = v0[3];
  v1 = v0[4];
  v3 = swift_task_alloc();
  v0[5] = v3;
  *(_QWORD *)(v3 + 16) = v2;
  *(_QWORD *)(v3 + 24) = v1;
  v4 = (_QWORD *)swift_task_alloc();
  v0[6] = v4;
  *v4 = v0;
  v4[1] = sub_23A8D6590;
  return sub_23A8F1400();
}

uint64_t sub_23A8D6590()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 56) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23A8D65FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v6[22] = a5;
  v6[23] = a6;
  v6[21] = a4;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569C8BC0);
  v6[24] = v7;
  v8 = *(_QWORD *)(v7 - 8);
  v6[25] = v8;
  v6[26] = *(_QWORD *)(v8 + 64);
  v6[27] = swift_task_alloc();
  v9 = sub_23A8F10A0();
  v6[28] = v9;
  v6[29] = *(_QWORD *)(v9 - 8);
  v6[30] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23A8D6690()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  _BOOL4 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint8_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  if (qword_2542D8828 != -1)
    swift_once();
  v2 = v0[29];
  v1 = v0[30];
  v3 = v0[28];
  v4 = __swift_project_value_buffer(v3, (uint64_t)qword_2542D8DE0);
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v4, v3);
  swift_bridgeObjectRetain_n();
  v5 = sub_23A8F1088();
  v6 = sub_23A8F125C();
  v7 = os_log_type_enabled(v5, v6);
  v9 = v0[29];
  v8 = v0[30];
  v10 = v0[28];
  v11 = v0[22];
  if (v7)
  {
    v12 = v0[21];
    v27 = v0[28];
    v13 = (uint8_t *)swift_slowAlloc();
    v26 = v8;
    v14 = swift_slowAlloc();
    v28 = v14;
    *(_DWORD *)v13 = 136380675;
    swift_bridgeObjectRetain();
    v0[20] = sub_23A8BF840(v12, v11, &v28);
    sub_23A8F12A4();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_23A8AD000, v5, v6, "Disabling next clean energy window notification for %{private}s\"", v13, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B85B51C](v14, -1, -1);
    MEMORY[0x23B85B51C](v13, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v26, v27);
  }
  else
  {
    swift_bridgeObjectRelease_n();

    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v8, v10);
  }
  v15 = v0[27];
  v16 = v0[24];
  v17 = v0[25];
  v18 = v0[23];
  type metadata accessor for HomeEnergyXPCConnection();
  swift_allocObject();
  v0[31] = sub_23A8EF888();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v17 + 16))(v15, v18, v16);
  v19 = (*(unsigned __int8 *)(v17 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v17 + 80);
  v20 = swift_allocObject();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v17 + 32))(v20 + v19, v15, v16);
  v21 = (void *)sub_23A8EFE34((uint64_t)sub_23A8DDCA8, v20);
  v0[32] = v21;
  swift_release();
  v22 = sub_23A8F1130();
  v0[33] = v22;
  v0[7] = v0 + 18;
  v0[2] = v0;
  v0[3] = sub_23A8D69D0;
  v23 = swift_continuation_init();
  v0[10] = MEMORY[0x24BDAC760];
  v24 = v0 + 10;
  v24[1] = 0x40000000;
  v24[2] = sub_23A8D5B48;
  v24[3] = &block_descriptor_136;
  v24[4] = v23;
  objc_msgSend(v21, sel_disableNextCleanEnergyWindowNotificationsForGridID_completionHandler_, v22, v24);
  return swift_continuation_await();
}

uint64_t sub_23A8D69D0()
{
  return swift_task_switch();
}

uint64_t sub_23A8D6A1C()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(void **)(v0 + 264);
  v2 = *(_QWORD *)(v0 + 248);
  v3 = *(_QWORD *)(v0 + 144);
  swift_unknownObjectRelease();

  objc_msgSend(*(id *)(v2 + 16), sel_invalidate);
  *(_QWORD *)(v0 + 152) = v3;
  sub_23A8F11F0();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23A8D6AB0()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 24) = v1;
  *v1 = v0;
  v1[1] = sub_23A8C8E6C;
  return sub_23A8F1400();
}

uint64_t sub_23A8D6B38(uint64_t a1)
{
  return sub_23A8DB884(a1, &qword_2569C8BC0, (uint64_t)&unk_250BB5980, (uint64_t)&unk_2569C8C00, (void (*)(char *, uint64_t, uint64_t))sub_23A8B1124);
}

uint64_t sub_23A8D6B5C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4[20] = a4;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569C8BC0);
  v4[21] = v5;
  v6 = *(_QWORD *)(v5 - 8);
  v4[22] = v6;
  v4[23] = *(_QWORD *)(v6 + 64);
  v4[24] = swift_task_alloc();
  v7 = sub_23A8F10A0();
  v4[25] = v7;
  v4[26] = *(_QWORD *)(v7 - 8);
  v4[27] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23A8D6BEC()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  _QWORD *v19;

  if (qword_2542D8828 != -1)
    swift_once();
  v2 = v0[26];
  v1 = v0[27];
  v3 = v0[25];
  v4 = __swift_project_value_buffer(v3, (uint64_t)qword_2542D8DE0);
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v4, v3);
  v5 = sub_23A8F1088();
  v6 = sub_23A8F125C();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_23A8AD000, v5, v6, "Disabling all next clean energy window notifications", v7, 2u);
    MEMORY[0x23B85B51C](v7, -1, -1);
  }
  v9 = v0[26];
  v8 = v0[27];
  v10 = v0[24];
  v11 = v0[25];
  v12 = v0[22];
  v14 = v0[20];
  v13 = v0[21];

  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v8, v11);
  type metadata accessor for HomeEnergyXPCConnection();
  swift_allocObject();
  v0[28] = sub_23A8EF888();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 16))(v10, v14, v13);
  v15 = (*(unsigned __int8 *)(v12 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
  v16 = swift_allocObject();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v12 + 32))(v16 + v15, v10, v13);
  v17 = (void *)sub_23A8EFE34((uint64_t)sub_23A8DDB68, v16);
  v0[29] = v17;
  swift_release();
  v0[7] = v0 + 18;
  v0[2] = v0;
  v0[3] = sub_23A8D6E30;
  v18 = swift_continuation_init();
  v0[10] = MEMORY[0x24BDAC760];
  v19 = v0 + 10;
  v19[1] = 0x40000000;
  v19[2] = sub_23A8D5B48;
  v19[3] = &block_descriptor_128_0;
  v19[4] = v18;
  objc_msgSend(v17, sel_disableAllNextCleanEnergyWindowNotificationsWithCompletionHandler_, v19);
  return swift_continuation_await();
}

uint64_t sub_23A8D6E30()
{
  return swift_task_switch();
}

uint64_t sub_23A8D6E7C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(v0 + 224);
  v2 = *(_QWORD *)(v0 + 144);
  swift_unknownObjectRelease();
  objc_msgSend(*(id *)(v1 + 16), sel_invalidate);
  *(_QWORD *)(v0 + 152) = v2;
  sub_23A8F11F0();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23A8D6F04(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 24) = a1;
  *(_QWORD *)(v2 + 32) = a2;
  return swift_task_switch();
}

uint64_t sub_23A8D6F1C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v2 = v0[3];
  v1 = v0[4];
  v3 = swift_task_alloc();
  v0[5] = v3;
  *(_QWORD *)(v3 + 16) = v2;
  *(_QWORD *)(v3 + 24) = v1;
  v4 = (_QWORD *)swift_task_alloc();
  v0[6] = v4;
  *v4 = v0;
  v4[1] = sub_23A8D6FC4;
  return sub_23A8F1400();
}

uint64_t sub_23A8D6FC4()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 56) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23A8D7030(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v6[22] = a5;
  v6[23] = a6;
  v6[21] = a4;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569C8BC0);
  v6[24] = v7;
  v8 = *(_QWORD *)(v7 - 8);
  v6[25] = v8;
  v6[26] = *(_QWORD *)(v8 + 64);
  v6[27] = swift_task_alloc();
  v9 = sub_23A8F10A0();
  v6[28] = v9;
  v6[29] = *(_QWORD *)(v9 - 8);
  v6[30] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23A8D70C4()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  _BOOL4 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint8_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  if (qword_2542D8828 != -1)
    swift_once();
  v2 = v0[29];
  v1 = v0[30];
  v3 = v0[28];
  v4 = __swift_project_value_buffer(v3, (uint64_t)qword_2542D8DE0);
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v4, v3);
  swift_bridgeObjectRetain_n();
  v5 = sub_23A8F1088();
  v6 = sub_23A8F125C();
  v7 = os_log_type_enabled(v5, v6);
  v9 = v0[29];
  v8 = v0[30];
  v10 = v0[28];
  v11 = v0[22];
  if (v7)
  {
    v12 = v0[21];
    v27 = v0[28];
    v13 = (uint8_t *)swift_slowAlloc();
    v26 = v8;
    v14 = swift_slowAlloc();
    v28 = v14;
    *(_DWORD *)v13 = 136380675;
    swift_bridgeObjectRetain();
    v0[20] = sub_23A8BF840(v12, v11, &v28);
    sub_23A8F12A4();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_23A8AD000, v5, v6, "Enable energy forecast collection for %{private}s\"", v13, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B85B51C](v14, -1, -1);
    MEMORY[0x23B85B51C](v13, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v26, v27);
  }
  else
  {
    swift_bridgeObjectRelease_n();

    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v8, v10);
  }
  v15 = v0[27];
  v16 = v0[24];
  v17 = v0[25];
  v18 = v0[23];
  type metadata accessor for HomeEnergyXPCConnection();
  swift_allocObject();
  v0[31] = sub_23A8EF888();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v17 + 16))(v15, v18, v16);
  v19 = (*(unsigned __int8 *)(v17 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v17 + 80);
  v20 = swift_allocObject();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v17 + 32))(v20 + v19, v15, v16);
  v21 = (void *)sub_23A8EFE34((uint64_t)sub_23A8DDAB4, v20);
  v0[32] = v21;
  swift_release();
  v22 = sub_23A8F1130();
  v0[33] = v22;
  v0[7] = v0 + 18;
  v0[2] = v0;
  v0[3] = sub_23A8D7404;
  v23 = swift_continuation_init();
  v0[10] = MEMORY[0x24BDAC760];
  v24 = v0 + 10;
  v24[1] = 0x40000000;
  v24[2] = sub_23A8D5B48;
  v24[3] = &block_descriptor_120;
  v24[4] = v23;
  objc_msgSend(v21, sel_enableEnergyForecastDataCollectionForGridID_completionHandler_, v22, v24);
  return swift_continuation_await();
}

uint64_t sub_23A8D7404()
{
  return swift_task_switch();
}

uint64_t sub_23A8D7450(void *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  id v9;
  id v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  unint64_t v17;
  id v18;
  _QWORD v20[3];
  uint64_t v21;
  uint64_t v22;

  v4 = sub_23A8F10A0();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2542D8828 != -1)
    swift_once();
  v8 = __swift_project_value_buffer(v4, (uint64_t)qword_2542D8DE0);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v8, v4);
  v9 = a1;
  v10 = a1;
  v11 = sub_23A8F1088();
  v12 = sub_23A8F1274();
  if (os_log_type_enabled(v11, v12))
  {
    v20[2] = a2;
    v13 = (uint8_t *)swift_slowAlloc();
    v14 = swift_slowAlloc();
    v21 = (uint64_t)a1;
    v22 = v14;
    *(_DWORD *)v13 = 136446210;
    v20[1] = v13 + 4;
    v15 = a1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2542D8AE0);
    v16 = sub_23A8F1148();
    v21 = sub_23A8BF840(v16, v17, &v22);
    sub_23A8F12A4();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_23A8AD000, v11, v12, "Enable energy forecast collection failed.%{public}s", v13, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B85B51C](v14, -1, -1);
    MEMORY[0x23B85B51C](v13, -1, -1);
  }
  else
  {

  }
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  v22 = (uint64_t)a1;
  v18 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569C8BC0);
  return sub_23A8F11E4();
}

uint64_t sub_23A8D76B4()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 24) = v1;
  *v1 = v0;
  v1[1] = sub_23A8D773C;
  return sub_23A8F1400();
}

uint64_t sub_23A8D773C()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 32) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23A8D77A0(uint64_t a1)
{
  return sub_23A8DB884(a1, &qword_2569C8BC0, (uint64_t)&unk_250BB58B0, (uint64_t)&unk_2569C8BE0, (void (*)(char *, uint64_t, uint64_t))sub_23A8B1124);
}

uint64_t sub_23A8D77C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4[20] = a4;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569C8BC0);
  v4[21] = v5;
  v6 = *(_QWORD *)(v5 - 8);
  v4[22] = v6;
  v4[23] = *(_QWORD *)(v6 + 64);
  v4[24] = swift_task_alloc();
  v7 = sub_23A8F10A0();
  v4[25] = v7;
  v4[26] = *(_QWORD *)(v7 - 8);
  v4[27] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23A8D7854()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  _QWORD *v19;

  if (qword_2542D8828 != -1)
    swift_once();
  v2 = v0[26];
  v1 = v0[27];
  v3 = v0[25];
  v4 = __swift_project_value_buffer(v3, (uint64_t)qword_2542D8DE0);
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v4, v3);
  v5 = sub_23A8F1088();
  v6 = sub_23A8F125C();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_23A8AD000, v5, v6, "Disabling energy forecast collection", v7, 2u);
    MEMORY[0x23B85B51C](v7, -1, -1);
  }
  v9 = v0[26];
  v8 = v0[27];
  v10 = v0[24];
  v11 = v0[25];
  v12 = v0[22];
  v14 = v0[20];
  v13 = v0[21];

  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v8, v11);
  type metadata accessor for HomeEnergyXPCConnection();
  swift_allocObject();
  v0[28] = sub_23A8EF888();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 16))(v10, v14, v13);
  v15 = (*(unsigned __int8 *)(v12 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
  v16 = swift_allocObject();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v12 + 32))(v16 + v15, v10, v13);
  v17 = (void *)sub_23A8EFE34((uint64_t)sub_23A8DD9F4, v16);
  v0[29] = v17;
  swift_release();
  v0[7] = v0 + 18;
  v0[2] = v0;
  v0[3] = sub_23A8D7A98;
  v18 = swift_continuation_init();
  v0[10] = MEMORY[0x24BDAC760];
  v19 = v0 + 10;
  v19[1] = 0x40000000;
  v19[2] = sub_23A8D5B48;
  v19[3] = &block_descriptor_112;
  v19[4] = v18;
  objc_msgSend(v17, sel_disableEnergyForecastDataCollectionWithCompletionHandler_, v19);
  return swift_continuation_await();
}

uint64_t sub_23A8D7A98()
{
  return swift_task_switch();
}

uint64_t sub_23A8D7AE4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 24) = a1;
  *(_QWORD *)(v2 + 32) = a2;
  return swift_task_switch();
}

uint64_t sub_23A8D7AFC()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v2 = v0[3];
  v1 = v0[4];
  v3 = swift_task_alloc();
  v0[5] = v3;
  *(_QWORD *)(v3 + 16) = v2;
  *(_QWORD *)(v3 + 24) = v1;
  v4 = (_QWORD *)swift_task_alloc();
  v0[6] = v4;
  *v4 = v0;
  v4[1] = sub_23A8D6FC4;
  return sub_23A8F1400();
}

uint64_t sub_23A8D7BA4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  unint64_t v16;
  char *v17;
  uint64_t v19;

  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569C8BC0);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(_QWORD *)(v10 + 64);
  MEMORY[0x24BDAC7A8](v9);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542D8AC0);
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)&v19 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_23A8F1208();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56))(v14, 1, 1, v15);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))((char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v9);
  v16 = (*(unsigned __int8 *)(v10 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v17 = (char *)swift_allocObject();
  *((_QWORD *)v17 + 2) = 0;
  *((_QWORD *)v17 + 3) = 0;
  *((_QWORD *)v17 + 4) = a2;
  *((_QWORD *)v17 + 5) = a3;
  (*(void (**)(char *, char *, uint64_t))(v10 + 32))(&v17[v16], (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), v9);
  swift_bridgeObjectRetain();
  sub_23A8B1124((uint64_t)v14, a5, (uint64_t)v17);
  return swift_release();
}

uint64_t sub_23A8D7CF8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v6[22] = a5;
  v6[23] = a6;
  v6[21] = a4;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569C8BC0);
  v6[24] = v7;
  v8 = *(_QWORD *)(v7 - 8);
  v6[25] = v8;
  v6[26] = *(_QWORD *)(v8 + 64);
  v6[27] = swift_task_alloc();
  v9 = sub_23A8F10A0();
  v6[28] = v9;
  v6[29] = *(_QWORD *)(v9 - 8);
  v6[30] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23A8D7D8C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  _BOOL4 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint8_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  if (qword_2542D8828 != -1)
    swift_once();
  v2 = v0[29];
  v1 = v0[30];
  v3 = v0[28];
  v4 = __swift_project_value_buffer(v3, (uint64_t)qword_2542D8DE0);
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v4, v3);
  swift_bridgeObjectRetain_n();
  v5 = sub_23A8F1088();
  v6 = sub_23A8F125C();
  v7 = os_log_type_enabled(v5, v6);
  v9 = v0[29];
  v8 = v0[30];
  v10 = v0[28];
  v11 = v0[22];
  if (v7)
  {
    v12 = v0[21];
    v27 = v0[28];
    v13 = (uint8_t *)swift_slowAlloc();
    v26 = v8;
    v14 = swift_slowAlloc();
    v28 = v14;
    *(_DWORD *)v13 = 136380675;
    swift_bridgeObjectRetain();
    v0[20] = sub_23A8BF840(v12, v11, &v28);
    sub_23A8F12A4();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_23A8AD000, v5, v6, "Disabling energy window forecast collection for %{private}s\"", v13, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B85B51C](v14, -1, -1);
    MEMORY[0x23B85B51C](v13, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v26, v27);
  }
  else
  {
    swift_bridgeObjectRelease_n();

    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v8, v10);
  }
  v15 = v0[27];
  v16 = v0[24];
  v17 = v0[25];
  v18 = v0[23];
  type metadata accessor for HomeEnergyXPCConnection();
  swift_allocObject();
  v0[31] = sub_23A8EF888();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v17 + 16))(v15, v18, v16);
  v19 = (*(unsigned __int8 *)(v17 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v17 + 80);
  v20 = swift_allocObject();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v17 + 32))(v20 + v19, v15, v16);
  v21 = (void *)sub_23A8EFE34((uint64_t)sub_23A8DD940, v20);
  v0[32] = v21;
  swift_release();
  v22 = sub_23A8F1130();
  v0[33] = v22;
  v0[7] = v0 + 18;
  v0[2] = v0;
  v0[3] = sub_23A8D7404;
  v23 = swift_continuation_init();
  v0[10] = MEMORY[0x24BDAC760];
  v24 = v0 + 10;
  v24[1] = 0x40000000;
  v24[2] = sub_23A8D5B48;
  v24[3] = &block_descriptor_104;
  v24[4] = v23;
  objc_msgSend(v21, sel_disableEnergyForecastDataCollectionForGridID_completionHandler_, v22, v24);
  return swift_continuation_await();
}

uint64_t sub_23A8D80CC(void *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  id v9;
  id v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  unint64_t v17;
  id v18;
  _QWORD v20[3];
  uint64_t v21;
  uint64_t v22;

  v4 = sub_23A8F10A0();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2542D8828 != -1)
    swift_once();
  v8 = __swift_project_value_buffer(v4, (uint64_t)qword_2542D8DE0);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v8, v4);
  v9 = a1;
  v10 = a1;
  v11 = sub_23A8F1088();
  v12 = sub_23A8F1274();
  if (os_log_type_enabled(v11, v12))
  {
    v20[2] = a2;
    v13 = (uint8_t *)swift_slowAlloc();
    v14 = swift_slowAlloc();
    v21 = (uint64_t)a1;
    v22 = v14;
    *(_DWORD *)v13 = 136446210;
    v20[1] = v13 + 4;
    v15 = a1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2542D8AE0);
    v16 = sub_23A8F1148();
    v21 = sub_23A8BF840(v16, v17, &v22);
    sub_23A8F12A4();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_23A8AD000, v11, v12, "Failed to disable cache for energy forecast.%{public}s", v13, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B85B51C](v14, -1, -1);
    MEMORY[0x23B85B51C](v13, -1, -1);
  }
  else
  {

  }
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  v22 = (uint64_t)a1;
  v18 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569C8BC0);
  return sub_23A8F11E4();
}

uint64_t sub_23A8D8330(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  uint64_t v6;

  *(_BYTE *)(v6 + 80) = a6;
  *(_QWORD *)(v6 + 40) = a4;
  *(_QWORD *)(v6 + 48) = a5;
  *(_QWORD *)(v6 + 24) = a2;
  *(_QWORD *)(v6 + 32) = a3;
  *(_QWORD *)(v6 + 16) = a1;
  return swift_task_switch();
}

uint64_t sub_23A8D8354()
{
  uint64_t v0;
  char v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  __int128 v5;
  _QWORD *v6;

  v1 = *(_BYTE *)(v0 + 80);
  v2 = *(_QWORD *)(v0 + 48);
  v3 = *(_QWORD *)(v0 + 24);
  v4 = swift_task_alloc();
  *(_QWORD *)(v0 + 56) = v4;
  v5 = *(_OWORD *)(v0 + 32);
  *(_QWORD *)(v4 + 16) = v3;
  *(_OWORD *)(v4 + 24) = v5;
  *(_QWORD *)(v4 + 40) = v2;
  *(_BYTE *)(v4 + 48) = v1;
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 64) = v6;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2542D8A88);
  *v6 = v0;
  v6[1] = sub_23A8D8418;
  return sub_23A8F1400();
}

uint64_t sub_23A8D8418()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 72) = v0;
  swift_task_dealloc();
  if (v0)
    return swift_task_switch();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_23A8D848C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(char *, uint64_t, uint64_t);
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  uint64_t v29;
  void (*v30)(uint64_t, char *, uint64_t);
  uint64_t v32;
  char *v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  int v41;

  v41 = a6;
  v38 = a5;
  v39 = a2;
  v35 = a1;
  v36 = a4;
  v40 = a3;
  v6 = sub_23A8F0CA4();
  v7 = *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64);
  v8 = *(_QWORD *)(v6 - 8);
  v9 = MEMORY[0x24BDAC7A8](v6);
  v34 = (char *)&v32 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v32 - v10;
  v33 = (char *)&v32 - v10;
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542D8AA8);
  v13 = *(_QWORD *)(v12 - 8);
  v32 = v12;
  v14 = *(_QWORD *)(v13 + 64);
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v32 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542D8AC0);
  MEMORY[0x24BDAC7A8](v16);
  v18 = (char *)&v32 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v37 = v18;
  v19 = sub_23A8F1208();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 56))(v18, 1, 1, v19);
  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))(v15, v35, v12);
  v20 = v8;
  v21 = *(void (**)(char *, uint64_t, uint64_t))(v8 + 16);
  v21(v11, v36, v6);
  v21((char *)&v32 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), v38, v6);
  v22 = (*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  v23 = (v14 + v22 + 7) & 0xFFFFFFFFFFFFFFF8;
  v24 = *(unsigned __int8 *)(v20 + 80);
  v25 = (v24 + v23 + 16) & ~v24;
  v26 = (v7 + v24 + v25) & ~v24;
  v27 = swift_allocObject();
  *(_QWORD *)(v27 + 16) = 0;
  *(_QWORD *)(v27 + 24) = 0;
  (*(void (**)(unint64_t, char *, uint64_t))(v13 + 32))(v27 + v22, v15, v32);
  v28 = (_QWORD *)(v27 + v23);
  v29 = v40;
  *v28 = v39;
  v28[1] = v29;
  v30 = *(void (**)(uint64_t, char *, uint64_t))(v20 + 32);
  v30(v27 + v25, v33, v6);
  v30(v27 + v26, v34, v6);
  *(_BYTE *)(v27 + v26 + v7) = v41;
  swift_bridgeObjectRetain();
  sub_23A8B1124((uint64_t)v37, (uint64_t)&unk_2569C8BB8, v27);
  return swift_release();
}

uint64_t sub_23A8D86DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v14;

  *(_BYTE *)(v8 + 400) = v14;
  *(_QWORD *)(v8 + 240) = a7;
  *(_QWORD *)(v8 + 248) = a8;
  *(_QWORD *)(v8 + 224) = a5;
  *(_QWORD *)(v8 + 232) = a6;
  *(_QWORD *)(v8 + 216) = a4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2542D8A88);
  *(_QWORD *)(v8 + 256) = swift_task_alloc();
  v9 = sub_23A8F0D64();
  *(_QWORD *)(v8 + 264) = v9;
  *(_QWORD *)(v8 + 272) = *(_QWORD *)(v9 - 8);
  *(_QWORD *)(v8 + 280) = swift_task_alloc();
  *(_QWORD *)(v8 + 288) = swift_task_alloc();
  v10 = sub_23A8F10A0();
  *(_QWORD *)(v8 + 296) = v10;
  *(_QWORD *)(v8 + 304) = *(_QWORD *)(v10 - 8);
  *(_QWORD *)(v8 + 312) = swift_task_alloc();
  *(_QWORD *)(v8 + 320) = swift_task_alloc();
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542D8AA8);
  *(_QWORD *)(v8 + 328) = v11;
  v12 = *(_QWORD *)(v11 - 8);
  *(_QWORD *)(v8 + 336) = v12;
  *(_QWORD *)(v8 + 344) = *(_QWORD *)(v12 + 64);
  *(_QWORD *)(v8 + 352) = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23A8D87E8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;
  unsigned int v15;

  v1 = v0;
  v14 = v0 + 168;
  v2 = *(_QWORD *)(v0 + 352);
  v3 = *(_QWORD *)(v0 + 336);
  v4 = *(_QWORD *)(v1 + 328);
  v15 = *(unsigned __int8 *)(v1 + 400);
  v5 = *(_QWORD *)(v1 + 216);
  type metadata accessor for HomeEnergyXPCConnection();
  swift_allocObject();
  *(_QWORD *)(v1 + 360) = sub_23A8EF888();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v2, v5, v4);
  v6 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v7 = swift_allocObject();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v3 + 32))(v7 + v6, v2, v4);
  v8 = (void *)sub_23A8EFE34((uint64_t)sub_23A8DD880, v7);
  *(_QWORD *)(v1 + 368) = v8;
  swift_release();
  v9 = sub_23A8F1130();
  *(_QWORD *)(v1 + 376) = v9;
  v10 = sub_23A8F0C44();
  *(_QWORD *)(v1 + 384) = v10;
  v11 = sub_23A8F0C44();
  *(_QWORD *)(v1 + 392) = v11;
  *(_QWORD *)(v1 + 56) = v14;
  *(_QWORD *)(v1 + 16) = v1;
  *(_QWORD *)(v1 + 24) = sub_23A8D899C;
  v12 = swift_continuation_init();
  *(_QWORD *)(v1 + 80) = MEMORY[0x24BDAC760];
  v1 += 80;
  *(_QWORD *)(v1 + 8) = 0x40000000;
  *(_QWORD *)(v1 + 16) = sub_23A8DEDB4;
  *(_QWORD *)(v1 + 24) = &block_descriptor_96;
  *(_QWORD *)(v1 + 32) = v12;
  objc_msgSend(v8, sel_energyWindowsForGridID_fromDate_endDate_withCaching_completionHandler_, v9, v10, v11, v15, v1);
  return swift_continuation_await();
}

uint64_t sub_23A8D899C()
{
  return swift_task_switch();
}

uint64_t sub_23A8D89E8()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  BOOL v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint8_t *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  _BYTE *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  v2 = *(void **)(v0 + 384);
  v1 = *(void **)(v0 + 392);
  v3 = *(void **)(v0 + 376);
  v4 = *(_QWORD *)(v0 + 360);
  v6 = *(_QWORD *)(v0 + 168);
  v5 = *(_QWORD *)(v0 + 176);
  swift_unknownObjectRelease();

  objc_msgSend(*(id *)(v4 + 16), sel_invalidate);
  if (v5 >> 60 == 15)
  {
    if (qword_2542D8828 != -1)
      swift_once();
    v7 = *(_QWORD *)(v0 + 320);
    v9 = *(_QWORD *)(v0 + 296);
    v8 = *(_QWORD *)(v0 + 304);
    v10 = __swift_project_value_buffer(v9, (uint64_t)qword_2542D8DE0);
    swift_beginAccess();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16))(v7, v10, v9);
    v11 = sub_23A8F1088();
    v12 = sub_23A8F1274();
    v13 = os_log_type_enabled(v11, v12);
    v14 = *(_QWORD *)(v0 + 320);
    v16 = *(_QWORD *)(v0 + 296);
    v15 = *(_QWORD *)(v0 + 304);
    if (v13)
    {
      v29 = *(_QWORD *)(v0 + 320);
      v17 = (uint8_t *)swift_slowAlloc();
      v18 = swift_slowAlloc();
      v31 = v18;
      *(_DWORD *)v17 = 136446210;
      *(_QWORD *)(v0 + 184) = sub_23A8BF840(0xD00000000000001ELL, 0x800000023A8F4130, &v31);
      sub_23A8F12A4();
      _os_log_impl(&dword_23A8AD000, v11, v12, "%{public}s", v17, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x23B85B51C](v18, -1, -1);
      MEMORY[0x23B85B51C](v17, -1, -1);

      (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v29, v16);
    }
    else
    {

      (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v14, v16);
    }
    sub_23A8C3D5C();
    v21 = swift_allocError();
    *v22 = 3;
    *(_QWORD *)(v0 + 192) = v21;
    sub_23A8F11E4();
    swift_release();
  }
  else
  {
    v19 = sub_23A8C69F4(v6, v5);
    v20 = (void *)MEMORY[0x23B85B168](v19);
    sub_23A8F0BD8();
    swift_allocObject();
    sub_23A8F0BCC();
    sub_23A8DD610();
    sub_23A8F0BC0();
    v30 = v6;
    v24 = *(_QWORD *)(v0 + 280);
    v23 = *(_QWORD *)(v0 + 288);
    v26 = *(_QWORD *)(v0 + 264);
    v25 = *(_QWORD *)(v0 + 272);
    v27 = *(_QWORD *)(v0 + 256);
    swift_release();
    objc_autoreleasePoolPop(v20);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v25 + 32))(v23, v24, v26);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v25 + 16))(v27, v23, v26);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v25 + 56))(v27, 0, 1, v26);
    sub_23A8F11F0();
    sub_23A8DD658(v30, v5);
    swift_release();
    sub_23A8DD658(v30, v5);
    (*(void (**)(uint64_t, uint64_t))(v25 + 8))(v23, v26);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23A8D8FD4(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v4;

  *(_BYTE *)(v4 + 64) = a4;
  *(_QWORD *)(v4 + 24) = a2;
  *(_QWORD *)(v4 + 32) = a3;
  *(_QWORD *)(v4 + 16) = a1;
  return swift_task_switch();
}

uint64_t sub_23A8D8FF4()
{
  uint64_t v0;
  char v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  v1 = *(_BYTE *)(v0 + 64);
  v3 = *(_QWORD *)(v0 + 24);
  v2 = *(_QWORD *)(v0 + 32);
  v4 = swift_task_alloc();
  *(_QWORD *)(v0 + 40) = v4;
  *(_QWORD *)(v4 + 16) = v3;
  *(_QWORD *)(v4 + 24) = v2;
  *(_BYTE *)(v4 + 32) = v1;
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 48) = v5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2542D8A88);
  *v5 = v0;
  v5[1] = sub_23A8D90A8;
  return sub_23A8F1400();
}

uint64_t sub_23A8D90A8()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 56) = v0;
  swift_task_dealloc();
  if (v0)
    return swift_task_switch();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_23A8D911C(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  unint64_t v15;
  char *v16;
  uint64_t v18;

  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542D8AA8);
  v9 = *(_QWORD *)(v8 - 8);
  v10 = *(_QWORD *)(v9 + 64);
  MEMORY[0x24BDAC7A8](v8);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542D8AC0);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_23A8F1208();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v13, 1, 1, v14);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))((char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v8);
  v15 = (*(unsigned __int8 *)(v9 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  v16 = (char *)swift_allocObject();
  *((_QWORD *)v16 + 2) = 0;
  *((_QWORD *)v16 + 3) = 0;
  *((_QWORD *)v16 + 4) = a2;
  *((_QWORD *)v16 + 5) = a3;
  (*(void (**)(char *, char *, uint64_t))(v9 + 32))(&v16[v15], (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), v8);
  v16[v15 + v10] = a4;
  swift_bridgeObjectRetain();
  sub_23A8B1124((uint64_t)v13, (uint64_t)&unk_2569C8BA8, (uint64_t)v16);
  return swift_release();
}

uint64_t sub_23A8D927C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  *(_BYTE *)(v7 + 384) = a7;
  *(_QWORD *)(v7 + 208) = a5;
  *(_QWORD *)(v7 + 216) = a6;
  *(_QWORD *)(v7 + 200) = a4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2542D8A88);
  *(_QWORD *)(v7 + 224) = swift_task_alloc();
  v8 = sub_23A8F0D64();
  *(_QWORD *)(v7 + 232) = v8;
  *(_QWORD *)(v7 + 240) = *(_QWORD *)(v8 - 8);
  *(_QWORD *)(v7 + 248) = swift_task_alloc();
  *(_QWORD *)(v7 + 256) = swift_task_alloc();
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542D8AA8);
  *(_QWORD *)(v7 + 264) = v9;
  v10 = *(_QWORD *)(v9 - 8);
  *(_QWORD *)(v7 + 272) = v10;
  *(_QWORD *)(v7 + 280) = *(_QWORD *)(v10 + 64);
  *(_QWORD *)(v7 + 288) = swift_task_alloc();
  v11 = sub_23A8F10A0();
  *(_QWORD *)(v7 + 296) = v11;
  *(_QWORD *)(v7 + 304) = *(_QWORD *)(v11 - 8);
  *(_QWORD *)(v7 + 312) = swift_task_alloc();
  *(_QWORD *)(v7 + 320) = swift_task_alloc();
  *(_QWORD *)(v7 + 328) = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23A8D938C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t, uint64_t);
  NSObject *v6;
  os_log_type_t v7;
  _BOOL4 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint8_t *v14;
  uint64_t v15;
  void (*v16)(uint64_t, uint64_t);
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  uint64_t v28;
  uint64_t v29;
  unsigned int v30;
  uint64_t v31;

  if (qword_2542D8828 != -1)
    swift_once();
  v1 = *(_QWORD *)(v0 + 328);
  v2 = *(_QWORD *)(v0 + 296);
  v3 = *(_QWORD *)(v0 + 304);
  v4 = __swift_project_value_buffer(v2, (uint64_t)qword_2542D8DE0);
  *(_QWORD *)(v0 + 336) = v4;
  swift_beginAccess();
  v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
  *(_QWORD *)(v0 + 344) = v5;
  v5(v1, v4, v2);
  swift_bridgeObjectRetain_n();
  v6 = sub_23A8F1088();
  v7 = sub_23A8F125C();
  v8 = os_log_type_enabled(v6, v7);
  v9 = *(_QWORD *)(v0 + 328);
  v10 = *(_QWORD *)(v0 + 296);
  v11 = *(_QWORD *)(v0 + 304);
  v12 = *(_QWORD *)(v0 + 208);
  if (v8)
  {
    v13 = *(_QWORD *)(v0 + 200);
    v29 = *(_QWORD *)(v0 + 296);
    v14 = (uint8_t *)swift_slowAlloc();
    v28 = v9;
    v15 = swift_slowAlloc();
    v31 = v15;
    *(_DWORD *)v14 = 136380675;
    swift_bridgeObjectRetain();
    *(_QWORD *)(v0 + 192) = sub_23A8BF840(v13, v12, &v31);
    sub_23A8F12A4();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_23A8AD000, v6, v7, "Fetch energy windows for %{private}s\"", v14, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B85B51C](v15, -1, -1);
    MEMORY[0x23B85B51C](v14, -1, -1);

    v16 = *(void (**)(uint64_t, uint64_t))(v11 + 8);
    v16(v28, v29);
  }
  else
  {
    swift_bridgeObjectRelease_n();

    v16 = *(void (**)(uint64_t, uint64_t))(v11 + 8);
    v16(v9, v10);
  }
  *(_QWORD *)(v0 + 352) = v16;
  v17 = *(_QWORD *)(v0 + 288);
  v18 = *(_QWORD *)(v0 + 264);
  v19 = *(_QWORD *)(v0 + 272);
  v30 = *(unsigned __int8 *)(v0 + 384);
  v20 = *(_QWORD *)(v0 + 216);
  type metadata accessor for HomeEnergyXPCConnection();
  swift_allocObject();
  *(_QWORD *)(v0 + 360) = sub_23A8EF888();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v19 + 16))(v17, v20, v18);
  v21 = (*(unsigned __int8 *)(v19 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
  v22 = swift_allocObject();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v19 + 32))(v22 + v21, v17, v18);
  v23 = (void *)sub_23A8EFE34((uint64_t)sub_23A8DD5FC, v22);
  *(_QWORD *)(v0 + 368) = v23;
  swift_release();
  v24 = sub_23A8F1130();
  *(_QWORD *)(v0 + 376) = v24;
  *(_QWORD *)(v0 + 56) = v0 + 144;
  *(_QWORD *)(v0 + 16) = v0;
  *(_QWORD *)(v0 + 24) = sub_23A8D96E4;
  v25 = swift_continuation_init();
  *(_QWORD *)(v0 + 80) = MEMORY[0x24BDAC760];
  v26 = (_QWORD *)(v0 + 80);
  v26[1] = 0x40000000;
  v26[2] = sub_23A8DEDB4;
  v26[3] = &block_descriptor_88;
  v26[4] = v25;
  objc_msgSend(v23, sel_energyWindowsFor_withCaching_completionHandler_, v24, v30, v26);
  return swift_continuation_await();
}

uint64_t sub_23A8D96E4()
{
  return swift_task_switch();
}

uint64_t sub_23A8D9730()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  BOOL v7;
  void (*v8)(uint64_t, uint64_t);
  uint64_t v9;
  uint64_t v10;
  uint8_t *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  _BYTE *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void (*v23)(uint64_t, uint64_t);
  uint64_t v24;
  uint64_t v25;

  v1 = *(void **)(v0 + 376);
  v2 = *(_QWORD *)(v0 + 360);
  v4 = *(_QWORD *)(v0 + 144);
  v3 = *(_QWORD *)(v0 + 152);
  swift_unknownObjectRelease();

  objc_msgSend(*(id *)(v2 + 16), sel_invalidate);
  if (v3 >> 60 == 15)
  {
    (*(void (**)(_QWORD, _QWORD, _QWORD))(v0 + 344))(*(_QWORD *)(v0 + 320), *(_QWORD *)(v0 + 336), *(_QWORD *)(v0 + 296));
    v5 = sub_23A8F1088();
    v6 = sub_23A8F1274();
    v7 = os_log_type_enabled(v5, v6);
    v8 = *(void (**)(uint64_t, uint64_t))(v0 + 352);
    v9 = *(_QWORD *)(v0 + 320);
    v10 = *(_QWORD *)(v0 + 296);
    if (v7)
    {
      v24 = *(_QWORD *)(v0 + 320);
      v23 = *(void (**)(uint64_t, uint64_t))(v0 + 352);
      v11 = (uint8_t *)swift_slowAlloc();
      v12 = swift_slowAlloc();
      v25 = v12;
      *(_DWORD *)v11 = 136446210;
      *(_QWORD *)(v0 + 168) = sub_23A8BF840(0xD00000000000001ELL, 0x800000023A8F4130, &v25);
      sub_23A8F12A4();
      _os_log_impl(&dword_23A8AD000, v5, v6, "%{public}s", v11, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x23B85B51C](v12, -1, -1);
      MEMORY[0x23B85B51C](v11, -1, -1);

      v23(v24, v10);
    }
    else
    {

      v8(v9, v10);
    }
    sub_23A8C3D5C();
    v15 = swift_allocError();
    *v16 = 3;
    *(_QWORD *)(v0 + 160) = v15;
    sub_23A8F11E4();
    swift_release();
  }
  else
  {
    v13 = sub_23A8C69F4(v4, v3);
    v14 = (void *)MEMORY[0x23B85B168](v13);
    sub_23A8F0BD8();
    swift_allocObject();
    sub_23A8F0BCC();
    sub_23A8DD610();
    sub_23A8F0BC0();
    v17 = *(_QWORD *)(v0 + 256);
    v18 = *(_QWORD *)(v0 + 240);
    v19 = *(_QWORD *)(v0 + 248);
    v20 = *(_QWORD *)(v0 + 224);
    v21 = *(_QWORD *)(v0 + 232);
    swift_release();
    objc_autoreleasePoolPop(v14);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v18 + 32))(v17, v19, v21);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v18 + 16))(v20, v17, v21);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v18 + 56))(v20, 0, 1, v21);
    sub_23A8F11F0();
    sub_23A8DD658(v4, v3);
    swift_release();
    sub_23A8DD658(v4, v3);
    (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v17, v21);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23A8D9C5C(void *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  id v9;
  id v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  unint64_t v17;
  id v18;
  _QWORD v20[3];
  uint64_t v21;
  uint64_t v22;

  v4 = sub_23A8F10A0();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2542D8828 != -1)
    swift_once();
  v8 = __swift_project_value_buffer(v4, (uint64_t)qword_2542D8DE0);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v8, v4);
  v9 = a1;
  v10 = a1;
  v11 = sub_23A8F1088();
  v12 = sub_23A8F1274();
  if (os_log_type_enabled(v11, v12))
  {
    v20[2] = a2;
    v13 = (uint8_t *)swift_slowAlloc();
    v14 = swift_slowAlloc();
    v21 = (uint64_t)a1;
    v22 = v14;
    *(_DWORD *)v13 = 136446210;
    v20[1] = v13 + 4;
    v15 = a1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2542D8AE0);
    v16 = sub_23A8F1148();
    v21 = sub_23A8BF840(v16, v17, &v22);
    sub_23A8F12A4();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_23A8AD000, v11, v12, "Failed to fetch energy windows. %{public}s", v13, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B85B51C](v14, -1, -1);
    MEMORY[0x23B85B51C](v13, -1, -1);
  }
  else
  {

  }
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  v22 = (uint64_t)a1;
  v18 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2542D8AA8);
  return sub_23A8F11E4();
}

uint64_t sub_23A8D9EC0(double a1, double a2)
{
  uint64_t v2;

  *(double *)(v2 + 32) = a1;
  *(double *)(v2 + 40) = a2;
  return swift_task_switch();
}

uint64_t sub_23A8D9ED8()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v2 = v0[4];
  v1 = v0[5];
  v3 = swift_task_alloc();
  v0[6] = v3;
  *(_QWORD *)(v3 + 16) = v2;
  *(_QWORD *)(v3 + 24) = v1;
  v4 = (_QWORD *)swift_task_alloc();
  v0[7] = v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569C8378);
  *v4 = v0;
  v4[1] = sub_23A8D9F90;
  return sub_23A8F1400();
}

uint64_t sub_23A8D9F90()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 64) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23A8D9FFC()
{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD, _QWORD))(v0 + 8))(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

uint64_t sub_23A8DA00C()
{
  uint64_t v0;

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23A8DA040(uint64_t a1, double a2, double a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  double *v14;
  uint64_t v16;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569C8CA8);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(_QWORD *)(v7 + 64);
  MEMORY[0x24BDAC7A8]();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2542D8AC0);
  MEMORY[0x24BDAC7A8]();
  v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_23A8F1208();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v10, 1, 1, v11);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v6);
  v12 = (*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = 0;
  *(_QWORD *)(v13 + 24) = 0;
  (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v13 + v12, (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v6);
  v14 = (double *)(v13 + ((v8 + v12 + 7) & 0xFFFFFFFFFFFFFFF8));
  *v14 = a2;
  v14[1] = a3;
  sub_23A8B1124((uint64_t)v10, (uint64_t)&unk_2569C8CB8, v13);
  return swift_release();
}

uint64_t sub_23A8DA19C(double a1, double a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  *(double *)(v6 + 200) = a1;
  *(double *)(v6 + 208) = a2;
  *(_QWORD *)(v6 + 192) = a6;
  v7 = sub_23A8F10A0();
  *(_QWORD *)(v6 + 216) = v7;
  *(_QWORD *)(v6 + 224) = *(_QWORD *)(v7 - 8);
  *(_QWORD *)(v6 + 232) = swift_task_alloc();
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569C8CA8);
  *(_QWORD *)(v6 + 240) = v8;
  v9 = *(_QWORD *)(v8 - 8);
  *(_QWORD *)(v6 + 248) = v9;
  *(_QWORD *)(v6 + 256) = *(_QWORD *)(v9 + 64);
  *(_QWORD *)(v6 + 264) = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23A8DA230()
{
  double *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  double v4;
  double v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;

  v1 = *((_QWORD *)v0 + 33);
  v2 = *((_QWORD *)v0 + 30);
  v3 = *((_QWORD *)v0 + 31);
  v5 = v0[25];
  v4 = v0[26];
  v6 = *((_QWORD *)v0 + 24);
  type metadata accessor for HomeEnergyXPCConnection();
  swift_allocObject();
  *((_QWORD *)v0 + 34) = sub_23A8EF888();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v1, v6, v2);
  v7 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v8 = swift_allocObject();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v3 + 32))(v8 + v7, v1, v2);
  v9 = (void *)sub_23A8EFE34((uint64_t)sub_23A8DE950, v8);
  *((_QWORD *)v0 + 35) = v9;
  swift_release();
  *((_QWORD *)v0 + 7) = v0 + 18;
  *((_QWORD *)v0 + 2) = v0;
  *((_QWORD *)v0 + 3) = sub_23A8DA394;
  v10 = swift_continuation_init();
  *((_QWORD *)v0 + 10) = MEMORY[0x24BDAC760];
  *((_QWORD *)v0 + 11) = 0x40000000;
  *((_QWORD *)v0 + 12) = sub_23A8DA8B8;
  *((_QWORD *)v0 + 13) = &block_descriptor_208;
  *((_QWORD *)v0 + 14) = v10;
  objc_msgSend(v9, sel_gridIDLookupWithCoordinate_completionHandler_, v0 + 10, v5, v4);
  return swift_continuation_await();
}

uint64_t sub_23A8DA394()
{
  return swift_task_switch();
}

uint64_t sub_23A8DA3E0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  _BOOL4 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint8_t *v14;
  uint64_t v15;
  uint64_t v16;
  _BYTE *v17;
  uint64_t v19;

  v1 = *(_QWORD *)(v0 + 272);
  v2 = *(_QWORD *)(v0 + 144);
  v3 = *(_QWORD *)(v0 + 152);
  swift_unknownObjectRelease();
  objc_msgSend(*(id *)(v1 + 16), sel_invalidate);
  if (v3)
  {
    *(_QWORD *)(v0 + 160) = v2;
    *(_QWORD *)(v0 + 168) = v3;
    sub_23A8F11F0();
  }
  else
  {
    if (qword_2542D8828 != -1)
      swift_once();
    v4 = *(_QWORD *)(v0 + 224);
    v5 = *(_QWORD *)(v0 + 232);
    v6 = *(_QWORD *)(v0 + 216);
    v7 = __swift_project_value_buffer(v6, (uint64_t)qword_2542D8DE0);
    swift_beginAccess();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v5, v7, v6);
    v8 = sub_23A8F1088();
    v9 = sub_23A8F1274();
    v10 = os_log_type_enabled(v8, v9);
    v12 = *(_QWORD *)(v0 + 224);
    v11 = *(_QWORD *)(v0 + 232);
    v13 = *(_QWORD *)(v0 + 216);
    if (v10)
    {
      v14 = (uint8_t *)swift_slowAlloc();
      v15 = swift_slowAlloc();
      v19 = v15;
      *(_DWORD *)v14 = 136315138;
      *(_QWORD *)(v0 + 184) = sub_23A8BF840(0xD000000000000018, 0x800000023A8F41A0, &v19);
      sub_23A8F12A4();
      _os_log_impl(&dword_23A8AD000, v8, v9, "%s", v14, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x23B85B51C](v15, -1, -1);
      MEMORY[0x23B85B51C](v14, -1, -1);
    }

    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v11, v13);
    sub_23A8C3D5C();
    v16 = swift_allocError();
    *v17 = 4;
    *(_QWORD *)(v0 + 176) = v16;
    sub_23A8F11E4();
  }
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23A8DA654(void *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  id v9;
  id v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  unint64_t v17;
  id v18;
  _QWORD v20[3];
  uint64_t v21;
  uint64_t v22;

  v4 = sub_23A8F10A0();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2542D8828 != -1)
    swift_once();
  v8 = __swift_project_value_buffer(v4, (uint64_t)qword_2542D8DE0);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v8, v4);
  v9 = a1;
  v10 = a1;
  v11 = sub_23A8F1088();
  v12 = sub_23A8F1274();
  if (os_log_type_enabled(v11, v12))
  {
    v20[2] = a2;
    v13 = (uint8_t *)swift_slowAlloc();
    v14 = swift_slowAlloc();
    v21 = (uint64_t)a1;
    v22 = v14;
    *(_DWORD *)v13 = 136315138;
    v20[1] = v13 + 4;
    v15 = a1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2542D8AE0);
    v16 = sub_23A8F1148();
    v21 = sub_23A8BF840(v16, v17, &v22);
    sub_23A8F12A4();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_23A8AD000, v11, v12, "Grid ID lookup failed. %s", v13, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B85B51C](v14, -1, -1);
    MEMORY[0x23B85B51C](v13, -1, -1);
  }
  else
  {

  }
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  v22 = (uint64_t)a1;
  v18 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569C8CA8);
  return sub_23A8F11E4();
}

uint64_t sub_23A8DA8B8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD v5[2];

  v2 = *(_QWORD *)(a1 + 32);
  if (a2)
    v3 = sub_23A8F113C();
  else
    v3 = 0;
  v5[0] = v3;
  v5[1] = a2;
  sub_23A8C7E20((uint64_t)v5, *(_QWORD *)(*(_QWORD *)(v2 + 64) + 40), &qword_2569C8378);
  return swift_continuation_resume();
}

uint64_t sub_23A8DA914()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 24) = v1;
  sub_23A8DC168();
  *v1 = v0;
  v1[1] = sub_23A8DA9A0;
  return sub_23A8F1400();
}

uint64_t sub_23A8DA9A0()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 32) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23A8DAA04(uint64_t a1)
{
  return sub_23A8DB884(a1, &qword_2542D8AB8, (uint64_t)&unk_250BB5710, (uint64_t)&unk_2569C8B98, (void (*)(char *, uint64_t, uint64_t))sub_23A8B1124);
}

uint64_t sub_23A8DAA28(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;

  v4[17] = a4;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542D8AB8);
  v4[18] = v5;
  v6 = *(_QWORD *)(v5 - 8);
  v4[19] = v6;
  v4[20] = *(_QWORD *)(v6 + 64);
  v4[21] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23A8DAA90()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;

  v1 = v0[21];
  v2 = v0[18];
  v3 = v0[19];
  v4 = v0[17];
  type metadata accessor for HomeEnergyXPCConnection();
  swift_allocObject();
  v0[22] = sub_23A8EF888();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v1, v4, v2);
  v5 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v6 = swift_allocObject();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v3 + 32))(v6 + v5, v1, v2);
  v7 = (void *)sub_23A8EFE34((uint64_t)sub_23A8DD4A4, v6);
  v0[23] = v7;
  swift_release();
  v0[7] = v0 + 15;
  v0[2] = v0;
  v0[3] = sub_23A8DABE0;
  v8 = swift_continuation_init();
  v0[10] = MEMORY[0x24BDAC760];
  v0[11] = 0x40000000;
  v0[12] = sub_23A8DAE90;
  v0[13] = &block_descriptor_80;
  v0[14] = v8;
  objc_msgSend(v7, sel_getCurrentLocationWithCompletionHandler_, v0 + 10);
  return swift_continuation_await();
}

uint64_t sub_23A8DABE0()
{
  return swift_task_switch();
}

uint64_t sub_23A8DAC2C(void *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  id v9;
  id v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  unint64_t v17;
  id v18;
  _QWORD v20[3];
  uint64_t v21;
  uint64_t v22;

  v4 = sub_23A8F10A0();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2569C8348 != -1)
    swift_once();
  v8 = __swift_project_value_buffer(v4, (uint64_t)qword_2569C9AE8);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v8, v4);
  v9 = a1;
  v10 = a1;
  v11 = sub_23A8F1088();
  v12 = sub_23A8F1274();
  if (os_log_type_enabled(v11, v12))
  {
    v20[2] = a2;
    v13 = (uint8_t *)swift_slowAlloc();
    v14 = swift_slowAlloc();
    v21 = (uint64_t)a1;
    v22 = v14;
    *(_DWORD *)v13 = 136315138;
    v20[1] = v13 + 4;
    v15 = a1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2542D8AE0);
    v16 = sub_23A8F1148();
    v21 = sub_23A8BF840(v16, v17, &v22);
    sub_23A8F12A4();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_23A8AD000, v11, v12, "Failed to get Current Location. %s", v13, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B85B51C](v14, -1, -1);
    MEMORY[0x23B85B51C](v13, -1, -1);
  }
  else
  {

  }
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  v22 = (uint64_t)a1;
  v18 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2542D8AB8);
  return sub_23A8F11E4();
}

uint64_t sub_23A8DAE90(uint64_t a1, void *a2)
{
  id v2;

  **(_QWORD **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 64) + 40) = a2;
  v2 = a2;
  return swift_continuation_resume();
}

uint64_t sub_23A8DAEC0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;

  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  return swift_task_switch();
}

uint64_t sub_23A8DAEDC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  __int128 v5;

  v1 = *(_QWORD *)(v0 + 32);
  v5 = *(_OWORD *)(v0 + 16);
  v2 = swift_task_alloc();
  *(_QWORD *)(v0 + 40) = v2;
  *(_OWORD *)(v2 + 16) = v5;
  *(_QWORD *)(v2 + 32) = v1;
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 48) = v3;
  *v3 = v0;
  v3[1] = sub_23A8DAF8C;
  return sub_23A8F1400();
}

uint64_t sub_23A8DAF8C()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 56) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23A8DAFF8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v24 = a3;
  v25 = a4;
  v23 = a2;
  v5 = sub_23A8F0CE0();
  v6 = *(_QWORD *)(v5 - 8);
  v22 = v5;
  v7 = *(_QWORD *)(v6 + 64);
  MEMORY[0x24BDAC7A8](v5);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542D8D18);
  v9 = *(_QWORD *)(v8 - 8);
  v10 = *(_QWORD *)(v9 + 64);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542D8AC0);
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)&v22 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_23A8F1208();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56))(v14, 1, 1, v15);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a1, v8);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))((char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), v23, v5);
  v16 = (*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  v17 = (v10 + *(unsigned __int8 *)(v6 + 80) + v16) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  v18 = swift_allocObject();
  *(_QWORD *)(v18 + 16) = 0;
  *(_QWORD *)(v18 + 24) = 0;
  (*(void (**)(unint64_t, char *, uint64_t))(v9 + 32))(v18 + v16, v11, v8);
  (*(void (**)(unint64_t, char *, uint64_t))(v6 + 32))(v18 + v17, (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), v22);
  v19 = (_QWORD *)(v18 + ((v7 + v17 + 7) & 0xFFFFFFFFFFFFFFF8));
  v20 = v25;
  *v19 = v24;
  v19[1] = v20;
  swift_bridgeObjectRetain();
  sub_23A8DEC80((uint64_t)v14, (uint64_t)&unk_2569C8B88, v18);
  return swift_release();
}

uint64_t sub_23A8DB1D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;

  v7[17] = a6;
  v7[18] = a7;
  v7[15] = a4;
  v7[16] = a5;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542D8D18);
  v7[19] = v8;
  v9 = *(_QWORD *)(v8 - 8);
  v7[20] = v9;
  v7[21] = *(_QWORD *)(v9 + 64);
  v7[22] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23A8DB244()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v1 = v0[22];
  v3 = v0[19];
  v2 = v0[20];
  v4 = v0[15];
  type metadata accessor for HomeEnergyXPCConnection();
  swift_allocObject();
  v0[23] = sub_23A8EF888();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v4, v3);
  v5 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v6 = swift_allocObject();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v2 + 32))(v6 + v5, v1, v3);
  v7 = (void *)sub_23A8EFE34((uint64_t)sub_23A8DD3A4, v6);
  v0[24] = v7;
  swift_release();
  v8 = sub_23A8F0CC8();
  v0[25] = v8;
  v9 = sub_23A8F1130();
  v0[26] = v9;
  v0[2] = v0;
  v0[3] = sub_23A8DB3C0;
  v10 = swift_continuation_init();
  v0[10] = MEMORY[0x24BDAC760];
  v0[11] = 0x40000000;
  v0[12] = sub_23A8B7638;
  v0[13] = &block_descriptor_71;
  v0[14] = v10;
  objc_msgSend(v7, sel_requestAddToShareForHomeUUID_siteID_completionHandler_, v8, v9, v0 + 10);
  return swift_continuation_await();
}

uint64_t sub_23A8DB3C0()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)v0 + 216) = *(_QWORD *)(*(_QWORD *)v0 + 48);
  return swift_task_switch();
}

uint64_t sub_23A8DB420()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;

  v2 = *(void **)(v0 + 200);
  v1 = *(void **)(v0 + 208);
  v3 = *(_QWORD *)(v0 + 184);
  swift_unknownObjectRelease();

  objc_msgSend(*(id *)(v3 + 16), sel_invalidate);
  sub_23A8F11F0();
  swift_release();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23A8DB4A4()
{
  uint64_t v0;
  void *v1;
  void *v2;

  v1 = *(void **)(v0 + 208);
  v2 = *(void **)(v0 + 200);
  swift_willThrow();
  swift_release();
  swift_unknownObjectRelease();

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23A8DB518(void *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  id v9;
  id v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  unint64_t v17;
  id v18;
  _QWORD v20[3];
  uint64_t v21;
  uint64_t v22;

  v4 = sub_23A8F10A0();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2569C8348 != -1)
    swift_once();
  v8 = __swift_project_value_buffer(v4, (uint64_t)qword_2569C9AE8);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v8, v4);
  v9 = a1;
  v10 = a1;
  v11 = sub_23A8F1088();
  v12 = sub_23A8F1274();
  if (os_log_type_enabled(v11, v12))
  {
    v20[2] = a2;
    v13 = (uint8_t *)swift_slowAlloc();
    v14 = swift_slowAlloc();
    v21 = (uint64_t)a1;
    v22 = v14;
    *(_DWORD *)v13 = 136315138;
    v20[1] = v13 + 4;
    v15 = a1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2542D8AE0);
    v16 = sub_23A8F1148();
    v21 = sub_23A8BF840(v16, v17, &v22);
    sub_23A8F12A4();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_23A8AD000, v11, v12, "Failed to request add to share. %s", v13, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B85B51C](v14, -1, -1);
    MEMORY[0x23B85B51C](v13, -1, -1);
  }
  else
  {

  }
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  v22 = (uint64_t)a1;
  v18 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2542D8D18);
  return sub_23A8F11E4();
}

uint64_t sub_23A8DB77C()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_23A8DB7FC;
  return sub_23A8F1400();
}

uint64_t sub_23A8DB7FC()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 24) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23A8DB860(uint64_t a1)
{
  return sub_23A8DB884(a1, &qword_2542D8D18, (uint64_t)&unk_250BB5640, (uint64_t)&unk_2569C8B78, (void (*)(char *, uint64_t, uint64_t))sub_23A8DEC80);
}

uint64_t sub_23A8DB884(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4, void (*a5)(char *, uint64_t, uint64_t))
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v18;

  v8 = __swift_instantiateConcreteTypeFromMangledName(a2);
  v9 = *(_QWORD *)(v8 - 8);
  v10 = *(_QWORD *)(v9 + 64);
  MEMORY[0x24BDAC7A8](v8);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542D8AC0);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_23A8F1208();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v13, 1, 1, v14);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))((char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v8);
  v15 = (*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  v16 = swift_allocObject();
  *(_QWORD *)(v16 + 16) = 0;
  *(_QWORD *)(v16 + 24) = 0;
  (*(void (**)(unint64_t, char *, uint64_t))(v9 + 32))(v16 + v15, (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), v8);
  a5(v13, a4, v16);
  return swift_release();
}

uint64_t sub_23A8DB9C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;

  v4[15] = a4;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542D8D18);
  v4[16] = v5;
  v6 = *(_QWORD *)(v5 - 8);
  v4[17] = v6;
  v4[18] = *(_QWORD *)(v6 + 64);
  v4[19] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23A8DBA2C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;

  v1 = v0[19];
  v2 = v0[16];
  v3 = v0[17];
  v4 = v0[15];
  type metadata accessor for HomeEnergyXPCConnection();
  swift_allocObject();
  v0[20] = sub_23A8EF888();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v1, v4, v2);
  v5 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v6 = swift_allocObject();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v3 + 32))(v6 + v5, v1, v2);
  v7 = (void *)sub_23A8EFE34((uint64_t)sub_23A8DD1CC, v6);
  v0[21] = v7;
  swift_release();
  v0[2] = v0;
  v0[3] = sub_23A8DBB6C;
  v8 = swift_continuation_init();
  v0[10] = MEMORY[0x24BDAC760];
  v0[11] = 0x40000000;
  v0[12] = sub_23A8B7638;
  v0[13] = &block_descriptor_62;
  v0[14] = v8;
  objc_msgSend(v7, sel_resetUtilityDataWithCompletionHandler_, v0 + 10);
  return swift_continuation_await();
}

uint64_t sub_23A8DBB6C()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)v0 + 176) = *(_QWORD *)(*(_QWORD *)v0 + 48);
  return swift_task_switch();
}

uint64_t sub_23A8DBBCC()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 160);
  swift_unknownObjectRelease();
  objc_msgSend(*(id *)(v1 + 16), sel_invalidate);
  sub_23A8F11F0();
  swift_release();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23A8DBC38()
{
  uint64_t v0;

  swift_willThrow();
  swift_release();
  swift_unknownObjectRelease();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23A8DBC98(void *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  id v9;
  id v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  unint64_t v17;
  id v18;
  _QWORD v20[3];
  uint64_t v21;
  uint64_t v22;

  v4 = sub_23A8F10A0();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2569C8348 != -1)
    swift_once();
  v8 = __swift_project_value_buffer(v4, (uint64_t)qword_2569C9AE8);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v8, v4);
  v9 = a1;
  v10 = a1;
  v11 = sub_23A8F1088();
  v12 = sub_23A8F1274();
  if (os_log_type_enabled(v11, v12))
  {
    v20[2] = a2;
    v13 = (uint8_t *)swift_slowAlloc();
    v14 = swift_slowAlloc();
    v21 = (uint64_t)a1;
    v22 = v14;
    *(_DWORD *)v13 = 136315138;
    v20[1] = v13 + 4;
    v15 = a1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2542D8AE0);
    v16 = sub_23A8F1148();
    v21 = sub_23A8BF840(v16, v17, &v22);
    sub_23A8F12A4();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_23A8AD000, v11, v12, "Failed to purge all data. %s", v13, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B85B51C](v14, -1, -1);
    MEMORY[0x23B85B51C](v13, -1, -1);
  }
  else
  {

  }
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  v22 = (uint64_t)a1;
  v18 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2542D8D18);
  return sub_23A8F11E4();
}

uint64_t HomeEnergyManager.deinit()
{
  uint64_t v0;

  swift_unknownObjectRelease();
  return v0;
}

uint64_t HomeEnergyManager.__deallocating_deinit()
{
  uint64_t v0;

  swift_unknownObjectRelease();
  return swift_deallocClassInstance();
}

_OWORD *sub_23A8DBF5C(_OWORD *a1, uint64_t a2, uint64_t a3, char a4)
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
  v12 = sub_23A8BFFA8(a2, a3);
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
        return sub_23A8C62C8(a1, v19);
      }
      goto LABEL_11;
    }
    if (v17 >= v15 && (a4 & 1) == 0)
    {
      sub_23A8C1700();
      goto LABEL_7;
    }
    sub_23A8C0F98(v15, a4 & 1);
    v21 = sub_23A8BFFA8(a2, a3);
    if ((v16 & 1) == (v22 & 1))
    {
      v12 = v21;
      v18 = *v5;
      if ((v16 & 1) != 0)
        goto LABEL_8;
LABEL_11:
      sub_23A8DCACC(v12, a2, a3, a1, v18);
      return (_OWORD *)swift_bridgeObjectRetain();
    }
  }
  result = (_OWORD *)sub_23A8F1424();
  __break(1u);
  return result;
}

uint64_t sub_23A8DC08C(uint64_t a1)
{
  uint64_t v1;

  return sub_23A8D21D8(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), *(unsigned __int8 *)(v1 + 32), *(_QWORD *)(v1 + 40));
}

uint64_t sub_23A8DC09C(uint64_t a1)
{
  uint64_t *v1;

  return sub_23A8D2D24(a1, v1[2], v1[3], v1[4]);
}

uint64_t sub_23A8DC0A8(uint64_t a1)
{
  uint64_t v1;

  return sub_23A8D371C(a1, *(_QWORD *)(v1 + 16));
}

uint64_t sub_23A8DC0B0(uint64_t a1)
{
  uint64_t *v1;

  return sub_23A8D4744(a1, v1[2], v1[3], v1[4], v1[5]);
}

uint64_t sub_23A8DC0BC(uint64_t a1)
{
  uint64_t *v1;

  return sub_23A8D5240(a1, v1[2], v1[3], v1[4]);
}

uint64_t sub_23A8DC0C8(uint64_t a1)
{
  uint64_t *v1;

  return sub_23A8D5CA4(a1, v1[2], v1[3], v1[4], v1[5]);
}

uint64_t sub_23A8DC0D4(uint64_t a1)
{
  uint64_t v1;

  return sub_23A8D7BA4(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), (uint64_t)&unk_250BB59E8, (uint64_t)&unk_2569C8C10);
}

uint64_t sub_23A8DC0FC(uint64_t a1)
{
  uint64_t v1;

  return sub_23A8D7BA4(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), (uint64_t)&unk_250BB5918, (uint64_t)&unk_2569C8BF0);
}

uint64_t sub_23A8DC124(uint64_t a1)
{
  uint64_t v1;

  return sub_23A8D7BA4(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), (uint64_t)&unk_250BB5848, (uint64_t)&unk_2569C8BD0);
}

uint64_t sub_23A8DC14C(uint64_t a1)
{
  uint64_t v1;

  return sub_23A8D848C(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32), *(_QWORD *)(v1 + 40), *(unsigned __int8 *)(v1 + 48));
}

uint64_t sub_23A8DC15C(uint64_t a1)
{
  uint64_t v1;

  return sub_23A8D911C(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), *(_BYTE *)(v1 + 32));
}

unint64_t sub_23A8DC168()
{
  unint64_t result;

  result = qword_2542D8AC8;
  if (!qword_2542D8AC8)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2542D8AC8);
  }
  return result;
}

uint64_t sub_23A8DC1A4(uint64_t a1)
{
  uint64_t *v1;

  return sub_23A8DAFF8(a1, v1[2], v1[3], v1[4]);
}

uint64_t type metadata accessor for HomeEnergyManager()
{
  return objc_opt_self();
}

uint64_t method lookup function for HomeEnergyManager()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of HomeEnergyManager.dumpAllData()()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t (*v4)(void);

  v4 = (uint64_t (*)(void))(**(int **)(*(_QWORD *)v0 + 184) + *(_QWORD *)(*(_QWORD *)v0 + 184));
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v2;
  *v2 = v1;
  v2[1] = sub_23A8C8744;
  return v4();
}

uint64_t dispatch thunk of HomeEnergyManager.useMockData(filePath:disableMock:validityDate:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  _QWORD *v10;
  uint64_t (*v12)(uint64_t, uint64_t, uint64_t, uint64_t);

  v12 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(**(int **)(*(_QWORD *)v4 + 192)
                                                                   + *(_QWORD *)(*(_QWORD *)v4 + 192));
  v10 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v5 + 16) = v10;
  *v10 = v5;
  v10[1] = sub_23A8C4ED0;
  return v12(a1, a2, a3, a4);
}

uint64_t dispatch thunk of HomeEnergyManager.testNotifications(forGridID:notificationContext:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD *v8;
  uint64_t (*v10)(uint64_t, uint64_t, uint64_t);

  v10 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(**(int **)(*(_QWORD *)v3 + 200)
                                                          + *(_QWORD *)(*(_QWORD *)v3 + 200));
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v8;
  *v8 = v4;
  v8[1] = sub_23A8DE97C;
  return v10(a1, a2, a3);
}

uint64_t dispatch thunk of HomeEnergyManager.testDelegate(forGridIds:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))(**(int **)(*(_QWORD *)v1 + 208) + *(_QWORD *)(*(_QWORD *)v1 + 208));
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_23A8C8720;
  return v6(a1);
}

uint64_t dispatch thunk of HomeEnergyManager.testSetMockURLSession()()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t (*v4)(void);

  v4 = (uint64_t (*)(void))(**(int **)(*(_QWORD *)v0 + 216) + *(_QWORD *)(*(_QWORD *)v0 + 216));
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v2;
  *v2 = v1;
  v2[1] = sub_23A8C8720;
  return v4();
}

uint64_t dispatch thunk of HomeEnergyManager.isNextCleanEnergyWindowNotificationEnabled(forGridID:homeID:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  _QWORD *v10;
  uint64_t (*v12)(uint64_t, uint64_t, uint64_t, uint64_t);

  v12 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(**(int **)(*(_QWORD *)v4 + 224)
                                                                   + *(_QWORD *)(*(_QWORD *)v4 + 224));
  v10 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v5 + 16) = v10;
  *v10 = v5;
  v10[1] = sub_23A8C5050;
  return v12(a1, a2, a3, a4);
}

uint64_t dispatch thunk of HomeEnergyManager.enableNextCleanEnergyWindowNotifications(forGridID:notificationContext:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD *v8;
  uint64_t (*v10)(uint64_t, uint64_t, uint64_t);

  v10 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(**(int **)(*(_QWORD *)v3 + 232)
                                                          + *(_QWORD *)(*(_QWORD *)v3 + 232));
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v8;
  *v8 = v4;
  v8[1] = sub_23A8C8744;
  return v10(a1, a2, a3);
}

uint64_t dispatch thunk of HomeEnergyManager.disableNextCleanEnergyWindowNotifications(forGridID:homeID:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  _QWORD *v10;
  uint64_t (*v12)(uint64_t, uint64_t, uint64_t, uint64_t);

  v12 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(**(int **)(*(_QWORD *)v4 + 240)
                                                                   + *(_QWORD *)(*(_QWORD *)v4 + 240));
  v10 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v5 + 16) = v10;
  *v10 = v5;
  v10[1] = sub_23A8C8744;
  return v12(a1, a2, a3, a4);
}

uint64_t dispatch thunk of HomeEnergyManager.disableNextCleanEnergyWindowNotifications(forGridID:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v6;
  uint64_t (*v8)(uint64_t, uint64_t);

  v8 = (uint64_t (*)(uint64_t, uint64_t))(**(int **)(*(_QWORD *)v2 + 248) + *(_QWORD *)(*(_QWORD *)v2 + 248));
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v6;
  *v6 = v3;
  v6[1] = sub_23A8C8744;
  return v8(a1, a2);
}

uint64_t dispatch thunk of HomeEnergyManager.disableAllNextCleanEnergyWindowNotifications()()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t (*v4)(void);

  v4 = (uint64_t (*)(void))(**(int **)(*(_QWORD *)v0 + 256) + *(_QWORD *)(*(_QWORD *)v0 + 256));
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v2;
  *v2 = v1;
  v2[1] = sub_23A8C8744;
  return v4();
}

uint64_t dispatch thunk of HomeEnergyManager.enableEnergyForecastDataCollection(forGridID:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v6;
  uint64_t (*v8)(uint64_t, uint64_t);

  v8 = (uint64_t (*)(uint64_t, uint64_t))(**(int **)(*(_QWORD *)v2 + 264) + *(_QWORD *)(*(_QWORD *)v2 + 264));
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v6;
  *v6 = v3;
  v6[1] = sub_23A8C8744;
  return v8(a1, a2);
}

uint64_t dispatch thunk of HomeEnergyManager.disableEnergyForecastDataCollection()()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t (*v4)(void);

  v4 = (uint64_t (*)(void))(**(int **)(*(_QWORD *)v0 + 272) + *(_QWORD *)(*(_QWORD *)v0 + 272));
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v2;
  *v2 = v1;
  v2[1] = sub_23A8C8744;
  return v4();
}

uint64_t dispatch thunk of HomeEnergyManager.disableEnergyForecastDataCollection(forGridID:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v6;
  uint64_t (*v8)(uint64_t, uint64_t);

  v8 = (uint64_t (*)(uint64_t, uint64_t))(**(int **)(*(_QWORD *)v2 + 280) + *(_QWORD *)(*(_QWORD *)v2 + 280));
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v6;
  *v6 = v3;
  v6[1] = sub_23A8C8744;
  return v8(a1, a2);
}

uint64_t dispatch thunk of HomeEnergyManager.energyWindows(forGridID:fromDate:endDate:withCaching:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v14;
  uint64_t (*v16)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);

  v16 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(**(int **)(*(_QWORD *)v6 + 288)
                                                                                     + *(_QWORD *)(*(_QWORD *)v6 + 288));
  v14 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v7 + 16) = v14;
  *v14 = v7;
  v14[1] = sub_23A8C8720;
  return v16(a1, a2, a3, a4, a5, a6);
}

uint64_t dispatch thunk of HomeEnergyManager.energyWindows(for:withCaching:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  _QWORD *v10;
  uint64_t (*v12)(uint64_t, uint64_t, uint64_t, uint64_t);

  v12 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(**(int **)(*(_QWORD *)v4 + 296)
                                                                   + *(_QWORD *)(*(_QWORD *)v4 + 296));
  v10 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v5 + 16) = v10;
  *v10 = v5;
  v10[1] = sub_23A8C8720;
  return v12(a1, a2, a3, a4);
}

uint64_t dispatch thunk of HomeEnergyManager.gridIDLookup(_:)(double a1, double a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v6;
  uint64_t (*v8)(double, double);

  v8 = (uint64_t (*)(double, double))(**(int **)(*(_QWORD *)v2 + 304) + *(_QWORD *)(*(_QWORD *)v2 + 304));
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v6;
  *v6 = v3;
  v6[1] = sub_23A8DC920;
  return v8(a1, a2);
}

uint64_t sub_23A8DC920(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v6;

  v6 = *v2;
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(a1, a2);
}

uint64_t dispatch thunk of HomeEnergyManager.getCurrentLocation()()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t (*v4)(void);

  v4 = (uint64_t (*)(void))(**(int **)(*(_QWORD *)v0 + 312) + *(_QWORD *)(*(_QWORD *)v0 + 312));
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v2;
  *v2 = v1;
  v2[1] = sub_23A8C8744;
  return v4();
}

uint64_t dispatch thunk of HomeEnergyManager.requestAddToShareFor(homeUUID:siteID:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD *v8;
  uint64_t (*v10)(uint64_t, uint64_t, uint64_t);

  v10 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(**(int **)(*(_QWORD *)v3 + 320)
                                                          + *(_QWORD *)(*(_QWORD *)v3 + 320));
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v8;
  *v8 = v4;
  v8[1] = sub_23A8C8720;
  return v10(a1, a2, a3);
}

uint64_t dispatch thunk of HomeEnergyManager.resetUtilityData()()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t (*v4)(void);

  v4 = (uint64_t (*)(void))(**(int **)(*(_QWORD *)v0 + 328) + *(_QWORD *)(*(_QWORD *)v0 + 328));
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v2;
  *v2 = v1;
  v2[1] = sub_23A8C8720;
  return v4();
}

uint64_t sub_23A8DCAAC()
{
  return sub_23A8D159C();
}

uint64_t block_copy_helper_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_1()
{
  return swift_release();
}

_OWORD *sub_23A8DCACC(unint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4, _QWORD *a5)
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
  result = sub_23A8C62C8(a4, (_OWORD *)(a5[7] + 32 * a1));
  v8 = a5[2];
  v9 = __OFADD__(v8, 1);
  v10 = v8 + 1;
  if (v9)
    __break(1u);
  else
    a5[2] = v10;
  return result;
}

uint64_t sub_23A8DCB34(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint64_t v13;
  uint8_t *v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint8_t *v23;
  uint64_t inited;
  id v25;
  void *v26;
  uint8_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  _OWORD v35[2];

  v2 = sub_23A8F0C14();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8]();
  v5 = (char *)&v28 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_23A8F10A0();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8]();
  v9 = (char *)&v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2542D8828 != -1)
    swift_once();
  v10 = __swift_project_value_buffer(v6, (uint64_t)qword_2542D8DE0);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, v10, v6);
  swift_bridgeObjectRetain_n();
  v11 = sub_23A8F1088();
  v12 = sub_23A8F1280();
  if (os_log_type_enabled(v11, v12))
  {
    v31 = v6;
    v13 = swift_slowAlloc();
    v32 = v3;
    v14 = (uint8_t *)v13;
    v29 = swift_slowAlloc();
    *(_QWORD *)&v35[0] = v29;
    *(_DWORD *)v14 = 136380675;
    v28 = v14 + 4;
    swift_bridgeObjectRetain();
    v15 = sub_23A8F1238();
    v30 = v7;
    v16 = v5;
    v17 = v2;
    v18 = v15;
    v20 = v19;
    swift_bridgeObjectRelease();
    v21 = v18;
    v2 = v17;
    v5 = v16;
    v33 = sub_23A8BF840(v21, v20, (uint64_t *)v35);
    sub_23A8F12A4();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23A8AD000, v11, v12, "[GridForecast] serverDidUpdateEnergyWindows called with %{private}s", v14, 0xCu);
    v22 = v29;
    swift_arrayDestroy();
    MEMORY[0x23B85B51C](v22, -1, -1);
    v23 = v14;
    v3 = v32;
    MEMORY[0x23B85B51C](v23, -1, -1);

    (*(void (**)(char *, uint64_t))(v30 + 8))(v9, v31);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }
  sub_23A8F0E00();
  sub_23A8F1130();
  swift_bridgeObjectRelease();
  memset(v35, 0, sizeof(v35));
  __swift_instantiateConcreteTypeFromMangledName(qword_2542D8D38);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_23A8F2040;
  v33 = 7562345;
  v34 = 0xE300000000000000;
  sub_23A8F1304();
  *(_QWORD *)(inited + 96) = __swift_instantiateConcreteTypeFromMangledName(&qword_2542D8D20);
  *(_QWORD *)(inited + 72) = a1;
  swift_bridgeObjectRetain();
  sub_23A8B85E4(inited);
  sub_23A8F0BFC();
  v25 = objc_msgSend((id)objc_opt_self(), sel_defaultCenter);
  v26 = (void *)sub_23A8F0BE4();
  objc_msgSend(v25, sel_postNotification_, v26);

  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_23A8DCF10()
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
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  id v12;
  void *v13;
  _OWORD v15[2];

  v0 = sub_23A8F0C14();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8]();
  v3 = (char *)v15 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_23A8F10A0();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8]();
  v7 = (char *)v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2542D8828 != -1)
    swift_once();
  v8 = __swift_project_value_buffer(v4, (uint64_t)qword_2542D8DE0);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v8, v4);
  v9 = sub_23A8F1088();
  v10 = sub_23A8F1280();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_23A8AD000, v9, v10, "[GridForecast] serverDidUpdateCoreLocation called", v11, 2u);
    MEMORY[0x23B85B51C](v11, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  sub_23A8F0E0C();
  sub_23A8F1130();
  swift_bridgeObjectRelease();
  memset(v15, 0, sizeof(v15));
  sub_23A8F0BFC();
  v12 = objc_msgSend((id)objc_opt_self(), sel_defaultCenter);
  v13 = (void *)sub_23A8F0BE4();
  objc_msgSend(v12, sel_postNotification_, v13);

  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t sub_23A8DD12C()
{
  return objectdestroyTm_0(&qword_2542D8D18);
}

uint64_t sub_23A8DD138(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v4 = *(unsigned __int8 *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2542D8D18) - 8) + 80);
  v5 = *(_QWORD *)(v1 + 16);
  v6 = *(_QWORD *)(v1 + 24);
  v7 = v1 + ((v4 + 32) & ~v4);
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v8;
  *v8 = v2;
  v8[1] = sub_23A8C8720;
  return sub_23A8DB9C4(a1, v5, v6, v7);
}

uint64_t sub_23A8DD1C0()
{
  return objectdestroy_90Tm(&qword_2542D8D18);
}

uint64_t sub_23A8DD1CC(uint64_t a1)
{
  return sub_23A8DD3B8(a1, &qword_2542D8D18, (uint64_t (*)(uint64_t, uint64_t))sub_23A8DBC98);
}

uint64_t sub_23A8DD1E0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542D8D18);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = *(_QWORD *)(v2 + 64);
  v5 = sub_23A8F0CE0();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = (v3 + v4 + *(unsigned __int8 *)(v6 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  swift_unknownObjectRelease();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  (*(void (**)(unint64_t, uint64_t))(v6 + 8))(v0 + v7, v5);
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_23A8DD2B8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;

  v4 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2542D8D18) - 8);
  v5 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v6 = *(_QWORD *)(v4 + 64);
  v7 = *(_QWORD *)(sub_23A8F0CE0() - 8);
  v8 = (v5 + v6 + *(unsigned __int8 *)(v7 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  v9 = *(_QWORD *)(v1 + 16);
  v10 = *(_QWORD *)(v1 + 24);
  v11 = v1 + v5;
  v12 = v1 + v8;
  v13 = (uint64_t *)(v1 + ((*(_QWORD *)(v7 + 64) + v8 + 7) & 0xFFFFFFFFFFFFFFF8));
  v14 = *v13;
  v15 = v13[1];
  v16 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v16;
  *v16 = v2;
  v16[1] = sub_23A8C8720;
  return sub_23A8DB1D8(a1, v9, v10, v11, v12, v14, v15);
}

uint64_t sub_23A8DD398()
{
  return objectdestroy_90Tm(&qword_2542D8D18);
}

uint64_t sub_23A8DD3A4(uint64_t a1)
{
  return sub_23A8DD3B8(a1, &qword_2542D8D18, (uint64_t (*)(uint64_t, uint64_t))sub_23A8DB518);
}

uint64_t sub_23A8DD3B8(uint64_t a1, uint64_t *a2, uint64_t (*a3)(uint64_t, uint64_t))
{
  uint64_t v3;
  uint64_t v5;

  v5 = *(unsigned __int8 *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(a2) - 8) + 80);
  return a3(a1, v3 + ((v5 + 16) & ~v5));
}

uint64_t sub_23A8DD404()
{
  return objectdestroyTm_0(&qword_2542D8AB8);
}

uint64_t sub_23A8DD410(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v4 = *(unsigned __int8 *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2542D8AB8) - 8) + 80);
  v5 = *(_QWORD *)(v1 + 16);
  v6 = *(_QWORD *)(v1 + 24);
  v7 = v1 + ((v4 + 32) & ~v4);
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v8;
  *v8 = v2;
  v8[1] = sub_23A8C8720;
  return sub_23A8DAA28(a1, v5, v6, v7);
}

uint64_t sub_23A8DD498()
{
  return objectdestroy_90Tm(&qword_2542D8AB8);
}

uint64_t sub_23A8DD4A4(uint64_t a1)
{
  return sub_23A8DD3B8(a1, &qword_2542D8AB8, (uint64_t (*)(uint64_t, uint64_t))sub_23A8DAC2C);
}

uint64_t sub_23A8DD4B8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542D8AA8);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  return swift_deallocObject();
}

uint64_t sub_23A8DD53C(uint64_t a1)
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
  char v11;
  _QWORD *v12;

  v4 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2542D8AA8) - 8);
  v5 = (*(unsigned __int8 *)(v4 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v6 = v1[2];
  v7 = v1[3];
  v8 = v1[4];
  v9 = v1[5];
  v10 = (uint64_t)v1 + v5;
  v11 = *((_BYTE *)v1 + v5 + *(_QWORD *)(v4 + 64));
  v12 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v12;
  *v12 = v2;
  v12[1] = sub_23A8C8720;
  return sub_23A8D927C(a1, v6, v7, v8, v9, v10, v11);
}

uint64_t sub_23A8DD5F0()
{
  return objectdestroy_90Tm(&qword_2542D8AA8);
}

uint64_t sub_23A8DD5FC(uint64_t a1)
{
  return sub_23A8DD3B8(a1, &qword_2542D8AA8, (uint64_t (*)(uint64_t, uint64_t))sub_23A8D9C5C);
}

unint64_t sub_23A8DD610()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2542D8A80;
  if (!qword_2542D8A80)
  {
    v1 = sub_23A8F0D64();
    result = MEMORY[0x23B85B498](MEMORY[0x24BE4F2D0], v1);
    atomic_store(result, (unint64_t *)&qword_2542D8A80);
  }
  return result;
}

uint64_t sub_23A8DD658(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_23A8C69B0(a1, a2);
  return a1;
}

uint64_t sub_23A8DD66C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542D8AA8);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = (*(_QWORD *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  v5 = sub_23A8F0CA4();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(unsigned __int8 *)(v6 + 80);
  v8 = (v4 + v7 + 16) & ~v7;
  v9 = (*(_QWORD *)(v6 + 64) + v7 + v8) & ~v7;
  swift_unknownObjectRelease();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  swift_bridgeObjectRelease();
  v10 = *(void (**)(uint64_t, uint64_t))(v6 + 8);
  v10(v0 + v8, v5);
  v10(v0 + v9, v5);
  return swift_deallocObject();
}

uint64_t sub_23A8DD76C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
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
  _QWORD *v17;

  v4 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2542D8AA8) - 8);
  v5 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v6 = (*(_QWORD *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8;
  v7 = *(_QWORD *)(sub_23A8F0CA4() - 8);
  v8 = *(unsigned __int8 *)(v7 + 80);
  v9 = (v6 + v8 + 16) & ~v8;
  v10 = *(_QWORD *)(v1 + 16);
  v11 = *(_QWORD *)(v1 + 24);
  v12 = v1 + v6;
  v13 = *(_QWORD *)(v1 + v6);
  v14 = *(_QWORD *)(v12 + 8);
  v15 = v1 + v9;
  v16 = v1 + ((*(_QWORD *)(v7 + 64) + v8 + v9) & ~v8);
  v17 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v17;
  *v17 = v2;
  v17[1] = sub_23A8C8720;
  return sub_23A8D86DC(a1, v10, v11, v1 + v5, v13, v14, v15, v16);
}

uint64_t sub_23A8DD874()
{
  return objectdestroy_90Tm(&qword_2542D8AA8);
}

uint64_t sub_23A8DD880(uint64_t a1)
{
  return sub_23A8DD3B8(a1, &qword_2542D8AA8, (uint64_t (*)(uint64_t, uint64_t))sub_23A8DE990);
}

uint64_t sub_23A8DD898(uint64_t a1)
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

  v4 = *(unsigned __int8 *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2569C8BC0) - 8) + 80);
  v5 = v1[2];
  v6 = v1[3];
  v7 = v1[4];
  v8 = v1[5];
  v9 = (uint64_t)v1 + ((v4 + 48) & ~v4);
  v10 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v10;
  *v10 = v2;
  v10[1] = sub_23A8C8720;
  return sub_23A8D7CF8(a1, v5, v6, v7, v8, v9);
}

uint64_t sub_23A8DD934()
{
  return objectdestroy_90Tm(&qword_2569C8BC0);
}

uint64_t sub_23A8DD940(uint64_t a1)
{
  return sub_23A8DD3B8(a1, &qword_2569C8BC0, (uint64_t (*)(uint64_t, uint64_t))sub_23A8D80CC);
}

uint64_t sub_23A8DD954()
{
  return objectdestroyTm_0(&qword_2569C8BC0);
}

uint64_t sub_23A8DD960(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v4 = *(unsigned __int8 *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2569C8BC0) - 8) + 80);
  v5 = *(_QWORD *)(v1 + 16);
  v6 = *(_QWORD *)(v1 + 24);
  v7 = v1 + ((v4 + 32) & ~v4);
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v8;
  *v8 = v2;
  v8[1] = sub_23A8C8720;
  return sub_23A8D77C4(a1, v5, v6, v7);
}

uint64_t sub_23A8DD9E8()
{
  return objectdestroy_90Tm(&qword_2569C8BC0);
}

uint64_t sub_23A8DD9F4(uint64_t a1)
{
  return sub_23A8DD3B8(a1, &qword_2569C8BC0, (uint64_t (*)(uint64_t, uint64_t))sub_23A8DE98C);
}

uint64_t sub_23A8DDA0C(uint64_t a1)
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

  v4 = *(unsigned __int8 *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2569C8BC0) - 8) + 80);
  v5 = v1[2];
  v6 = v1[3];
  v7 = v1[4];
  v8 = v1[5];
  v9 = (uint64_t)v1 + ((v4 + 48) & ~v4);
  v10 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v10;
  *v10 = v2;
  v10[1] = sub_23A8C8720;
  return sub_23A8D7030(a1, v5, v6, v7, v8, v9);
}

uint64_t sub_23A8DDAA8()
{
  return objectdestroy_90Tm(&qword_2569C8BC0);
}

uint64_t sub_23A8DDAB4(uint64_t a1)
{
  return sub_23A8DD3B8(a1, &qword_2569C8BC0, (uint64_t (*)(uint64_t, uint64_t))sub_23A8D7450);
}

uint64_t sub_23A8DDAC8()
{
  return objectdestroyTm_0(&qword_2569C8BC0);
}

uint64_t sub_23A8DDAD4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v4 = *(unsigned __int8 *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2569C8BC0) - 8) + 80);
  v5 = *(_QWORD *)(v1 + 16);
  v6 = *(_QWORD *)(v1 + 24);
  v7 = v1 + ((v4 + 32) & ~v4);
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v8;
  *v8 = v2;
  v8[1] = sub_23A8C8720;
  return sub_23A8D6B5C(a1, v5, v6, v7);
}

uint64_t sub_23A8DDB5C()
{
  return objectdestroy_90Tm(&qword_2569C8BC0);
}

uint64_t sub_23A8DDB68(uint64_t a1)
{
  return sub_23A8DD3B8(a1, &qword_2569C8BC0, (uint64_t (*)(uint64_t, uint64_t))sub_23A8DE988);
}

uint64_t objectdestroy_98Tm()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569C8BC0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  return swift_deallocObject();
}

uint64_t sub_23A8DDC00(uint64_t a1)
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

  v4 = *(unsigned __int8 *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2569C8BC0) - 8) + 80);
  v5 = v1[2];
  v6 = v1[3];
  v7 = v1[4];
  v8 = v1[5];
  v9 = (uint64_t)v1 + ((v4 + 48) & ~v4);
  v10 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v10;
  *v10 = v2;
  v10[1] = sub_23A8C8720;
  return sub_23A8D65FC(a1, v5, v6, v7, v8, v9);
}

uint64_t sub_23A8DDC9C()
{
  return objectdestroy_90Tm(&qword_2569C8BC0);
}

uint64_t sub_23A8DDCA8(uint64_t a1)
{
  return sub_23A8DD3B8(a1, &qword_2569C8BC0, (uint64_t (*)(uint64_t, uint64_t))sub_23A8DE984);
}

uint64_t sub_23A8DDCBC()
{
  return objectdestroy_138Tm(&qword_2569C8BC0);
}

uint64_t sub_23A8DDCC8(uint64_t a1)
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
  uint64_t v11;
  _QWORD *v12;

  v4 = *(unsigned __int8 *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2569C8BC0) - 8) + 80);
  v5 = v1[2];
  v6 = v1[3];
  v7 = v1[4];
  v8 = v1[5];
  v9 = v1[6];
  v10 = v1[7];
  v11 = (uint64_t)v1 + ((v4 + 64) & ~v4);
  v12 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v12;
  *v12 = v2;
  v12[1] = sub_23A8C8720;
  return sub_23A8D5E14(a1, v5, v6, v7, v8, v9, v10, v11);
}

uint64_t sub_23A8DDD78()
{
  return objectdestroy_90Tm(&qword_2569C8BC0);
}

uint64_t sub_23A8DDD84(uint64_t a1)
{
  return sub_23A8DD3B8(a1, &qword_2569C8BC0, (uint64_t (*)(uint64_t, uint64_t))sub_23A8D626C);
}

uint64_t sub_23A8DDD98()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569C8BC0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_23A8DDE50(uint64_t a1)
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
  uint64_t v11;
  _QWORD *v12;

  v4 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2569C8BC0) - 8);
  v5 = (*(unsigned __int8 *)(v4 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v6 = v1[2];
  v7 = v1[3];
  v8 = v1[4];
  v9 = v1[5];
  v10 = (uint64_t)v1 + v5;
  v11 = (uint64_t)v1 + ((*(_QWORD *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8);
  v12 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v12;
  *v12 = v2;
  v12[1] = sub_23A8C8720;
  return sub_23A8D53C8(a1, v6, v7, v8, v9, v10, v11);
}

uint64_t sub_23A8DDF0C(uint64_t a1)
{
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_23A8DDF60()
{
  return objectdestroy_90Tm(&qword_2569C8BC0);
}

uint64_t sub_23A8DDF6C(uint64_t a1)
{
  return sub_23A8DD3B8(a1, &qword_2569C8BC0, (uint64_t (*)(uint64_t, uint64_t))sub_23A8D58E4);
}

uint64_t sub_23A8DDF80()
{
  return objectdestroy_138Tm(&qword_2542D8AB0);
}

uint64_t objectdestroy_138Tm(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;

  v2 = __swift_instantiateConcreteTypeFromMangledName(a1);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = (*(unsigned __int8 *)(v3 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(unint64_t, uint64_t))(v3 + 8))(v1 + v4, v2);
  return swift_deallocObject();
}

uint64_t sub_23A8DE00C(uint64_t a1)
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
  uint64_t v11;
  _QWORD *v12;

  v4 = *(unsigned __int8 *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2542D8AB0) - 8) + 80);
  v5 = v1[2];
  v6 = v1[3];
  v7 = v1[4];
  v8 = v1[5];
  v9 = v1[6];
  v10 = v1[7];
  v11 = (uint64_t)v1 + ((v4 + 64) & ~v4);
  v12 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v12;
  *v12 = v2;
  v12[1] = sub_23A8C4ED0;
  return sub_23A8D48B4(a1, v5, v6, v7, v8, v9, v10, v11);
}

uint64_t sub_23A8DE0BC()
{
  return objectdestroy_90Tm(&qword_2542D8AB0);
}

uint64_t sub_23A8DE0C8(uint64_t a1)
{
  return sub_23A8DD3B8(a1, &qword_2542D8AB0, (uint64_t (*)(uint64_t, uint64_t))sub_23A8D4E44);
}

uint64_t sub_23A8DE0DC()
{
  return objectdestroyTm_0(&qword_2542D8D18);
}

uint64_t sub_23A8DE0E8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v4 = *(unsigned __int8 *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2542D8D18) - 8) + 80);
  v5 = *(_QWORD *)(v1 + 16);
  v6 = *(_QWORD *)(v1 + 24);
  v7 = v1 + ((v4 + 32) & ~v4);
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v8;
  *v8 = v2;
  v8[1] = sub_23A8C8720;
  return sub_23A8D3FD4(a1, v5, v6, v7);
}

uint64_t sub_23A8DE170()
{
  return objectdestroy_90Tm(&qword_2542D8D18);
}

uint64_t sub_23A8DE17C(uint64_t a1)
{
  return sub_23A8DD3B8(a1, &qword_2542D8D18, (uint64_t (*)(uint64_t, uint64_t))sub_23A8D4364);
}

uint64_t sub_23A8DE190()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542D8D18);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_unknownObjectRelease();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_23A8DE224(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;

  v4 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2542D8D18) - 8);
  v5 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v6 = *(_QWORD *)(v1 + 16);
  v7 = *(_QWORD *)(v1 + 24);
  v8 = v1 + v5;
  v9 = *(_QWORD *)(v1 + ((*(_QWORD *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFF8));
  v10 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v10;
  *v10 = v2;
  v10[1] = sub_23A8C8720;
  return sub_23A8D3870(a1, v6, v7, v8, v9);
}

uint64_t sub_23A8DE2CC()
{
  return objectdestroy_90Tm(&qword_2542D8D18);
}

uint64_t sub_23A8DE2D8(uint64_t a1)
{
  return sub_23A8DD3B8(a1, &qword_2542D8D18, (uint64_t (*)(uint64_t, uint64_t))sub_23A8D3C34);
}

uint64_t sub_23A8DE2EC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569C8C68);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_unknownObjectRelease();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_23A8DE3B0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;

  v4 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2569C8C68) - 8);
  v5 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v6 = (*(_QWORD *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8;
  v7 = (v6 + 23) & 0xFFFFFFFFFFFFFFF8;
  v8 = *(_QWORD *)(v1 + 16);
  v9 = *(_QWORD *)(v1 + 24);
  v10 = v1 + v5;
  v11 = (uint64_t *)(v1 + v6);
  v12 = *v11;
  v13 = v11[1];
  v14 = v1 + v7;
  v15 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v15;
  *v15 = v2;
  v15[1] = sub_23A8C8720;
  return sub_23A8D2EC0(a1, v8, v9, v10, v12, v13, v14);
}

uint64_t sub_23A8DE478()
{
  return objectdestroy_90Tm(&qword_2569C8C68);
}

uint64_t sub_23A8DE484(uint64_t a1)
{
  return sub_23A8DD3B8(a1, &qword_2569C8C68, (uint64_t (*)(uint64_t, uint64_t))sub_23A8D3314);
}

uint64_t sub_23A8DE498(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542D8CF8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_23A8DE4E0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542D8D18);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = (*(_QWORD *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  v5 = *(unsigned __int8 *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2542D8CF8) - 8) + 80);
  v6 = (v4 + v5 + 17) & ~v5;
  swift_unknownObjectRelease();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  swift_bridgeObjectRelease();
  v7 = sub_23A8F0CA4();
  v8 = *(_QWORD *)(v7 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v8 + 48))(v0 + v6, 1, v7))
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v0 + v6, v7);
  return swift_deallocObject();
}

uint64_t sub_23A8DE5DC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  _QWORD *v17;

  v4 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2542D8D18) - 8);
  v5 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v6 = (*(_QWORD *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8;
  v7 = *(unsigned __int8 *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2542D8CF8) - 8) + 80);
  v8 = (v6 + v7 + 17) & ~v7;
  v9 = *(_QWORD *)(v1 + 16);
  v10 = *(_QWORD *)(v1 + 24);
  v11 = v1 + v5;
  v12 = v1 + v6;
  v13 = *(_QWORD *)(v1 + v6);
  v14 = *(_QWORD *)(v12 + 8);
  v15 = *(_BYTE *)(v12 + 16);
  v16 = v1 + v8;
  v17 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v17;
  *v17 = v2;
  v17[1] = sub_23A8C8720;
  return sub_23A8D23BC(a1, v9, v10, v11, v13, v14, v15, v16);
}

uint64_t sub_23A8DE6C4()
{
  return objectdestroy_90Tm(&qword_2542D8D18);
}

uint64_t sub_23A8DE6D0(uint64_t a1)
{
  return sub_23A8DD3B8(a1, &qword_2542D8D18, (uint64_t (*)(uint64_t, uint64_t))sub_23A8D28F8);
}

uint64_t sub_23A8DE6E4()
{
  return objectdestroyTm_0(&qword_2569C8C90);
}

uint64_t objectdestroyTm_0(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;

  v2 = __swift_instantiateConcreteTypeFromMangledName(a1);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  swift_unknownObjectRelease();
  (*(void (**)(unint64_t, uint64_t))(v3 + 8))(v1 + v4, v2);
  return swift_deallocObject();
}

uint64_t sub_23A8DE760(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v4 = *(unsigned __int8 *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2569C8C90) - 8) + 80);
  v5 = *(_QWORD *)(v1 + 16);
  v6 = *(_QWORD *)(v1 + 24);
  v7 = v1 + ((v4 + 32) & ~v4);
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v8;
  *v8 = v2;
  v8[1] = sub_23A8C8720;
  return sub_23A8D1B00(a1, v5, v6, v7);
}

uint64_t sub_23A8DE7E8()
{
  return objectdestroy_90Tm(&qword_2569C8C90);
}

uint64_t sub_23A8DE7F4(uint64_t a1)
{
  return sub_23A8DD3B8(a1, &qword_2569C8C90, (uint64_t (*)(uint64_t, uint64_t))sub_23A8D1D80);
}

uint64_t sub_23A8DE808()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569C8CA8);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_unknownObjectRelease();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  return swift_deallocObject();
}

uint64_t sub_23A8DE88C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double *v9;
  double v10;
  double v11;
  _QWORD *v12;

  v4 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2569C8CA8) - 8);
  v5 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v6 = *(_QWORD *)(v1 + 16);
  v7 = *(_QWORD *)(v1 + 24);
  v8 = v1 + v5;
  v9 = (double *)(v1 + ((*(_QWORD *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8));
  v10 = *v9;
  v11 = v9[1];
  v12 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v12;
  *v12 = v2;
  v12[1] = sub_23A8C8720;
  return sub_23A8DA19C(v10, v11, a1, v6, v7, v8);
}

uint64_t sub_23A8DE944()
{
  return objectdestroy_90Tm(&qword_2569C8CA8);
}

uint64_t sub_23A8DE950(uint64_t a1)
{
  return sub_23A8DD3B8(a1, &qword_2569C8CA8, (uint64_t (*)(uint64_t, uint64_t))sub_23A8DA654);
}

uint64_t HomeEnergyStatusCode.description.getter(uint64_t a1)
{
  uint64_t result;

  result = 0xD000000000000017;
  switch(a1)
  {
    case 0:
      result = 0x73736563637553;
      break;
    case 1:
      return result;
    case 2:
      result = 0xD000000000000013;
      break;
    case 3:
      result = 0xD000000000000015;
      break;
    case 4:
      result = 0xD000000000000014;
      break;
    case 5:
      result = 0x6573616261746144;
      break;
    case 6:
      result = 0x6961676120797254;
      break;
    case 7:
      result = 0xD000000000000011;
      break;
    case 8:
      result = 0x2065636976726553;
      break;
    case 9:
      result = 0xD000000000000023;
      break;
    default:
      result = sub_23A8F140C();
      __break(1u);
      break;
  }
  return result;
}

unint64_t HomeEnergyStatusCode.init(rawValue:)(unint64_t a1)
{
  return sub_23A8DEC18(a1);
}

BOOL sub_23A8DEB14(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

uint64_t sub_23A8DEB28()
{
  sub_23A8F1478();
  sub_23A8F1484();
  return sub_23A8F1490();
}

uint64_t sub_23A8DEB6C()
{
  return sub_23A8F1484();
}

uint64_t sub_23A8DEB94()
{
  sub_23A8F1478();
  sub_23A8F1484();
  return sub_23A8F1490();
}

unint64_t sub_23A8DEBD4@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result;
  char v4;

  result = sub_23A8DEC18(*a1);
  *(_QWORD *)a2 = result;
  *(_BYTE *)(a2 + 8) = v4 & 1;
  return result;
}

void sub_23A8DEC04(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

uint64_t sub_23A8DEC10()
{
  uint64_t *v0;

  return HomeEnergyStatusCode.description.getter(*v0);
}

unint64_t sub_23A8DEC18(unint64_t result)
{
  if (result > 9)
    return 0;
  return result;
}

unint64_t sub_23A8DEC2C()
{
  unint64_t result;

  result = qword_2569C8CC0;
  if (!qword_2569C8CC0)
  {
    result = MEMORY[0x23B85B498](&protocol conformance descriptor for HomeEnergyStatusCode, &type metadata for HomeEnergyStatusCode);
    atomic_store(result, (unint64_t *)&qword_2569C8CC0);
  }
  return result;
}

ValueMetadata *type metadata accessor for HomeEnergyStatusCode()
{
  return &type metadata for HomeEnergyStatusCode;
}

uint64_t sub_23A8DEC80(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;

  v5 = sub_23A8F1208();
  v6 = *(_QWORD *)(v5 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(a1, 1, v5) != 1)
  {
    sub_23A8F11FC();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
    if (!*(_QWORD *)(a3 + 16))
      return swift_task_create();
    goto LABEL_3;
  }
  sub_23A8E4B50(a1);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_23A8F11D8();
    swift_unknownObjectRelease();
  }
  return swift_task_create();
}

uint64_t sub_23A8DEDAC()
{
  return swift_continuation_resume();
}

uint64_t sub_23A8DEDB4(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  id v4;
  unint64_t v5;
  unint64_t v6;
  _QWORD v8[2];

  v2 = (uint64_t)a2;
  v3 = *(_QWORD *)(a1 + 32);
  if (a2)
  {
    v4 = a2;
    v2 = sub_23A8F0C2C();
    v6 = v5;

  }
  else
  {
    v6 = 0xF000000000000000;
  }
  v8[0] = v2;
  v8[1] = v6;
  sub_23A8C7E20((uint64_t)v8, *(_QWORD *)(*(_QWORD *)(v3 + 64) + 40), &qword_2542D8A78);
  return swift_continuation_resume();
}

uint64_t HomeEnergyManager.completedOnboarding(id:)(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;

  v2[6] = a1;
  v2[7] = a2;
  v3 = sub_23A8F10A0();
  v2[8] = v3;
  v2[9] = *(_QWORD *)(v3 - 8);
  v2[10] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23A8DEE90()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  _BOOL4 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v18;

  if (qword_2542D8828 != -1)
    swift_once();
  v2 = v0[9];
  v1 = v0[10];
  v3 = v0[8];
  v4 = __swift_project_value_buffer(v3, (uint64_t)qword_2542D8DE0);
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v4, v3);
  v5 = sub_23A8F1088();
  v6 = sub_23A8F1268();
  v7 = os_log_type_enabled(v5, v6);
  v9 = v0[9];
  v8 = v0[10];
  v10 = v0[8];
  if (v7)
  {
    v11 = (uint8_t *)swift_slowAlloc();
    v12 = swift_slowAlloc();
    v18 = v12;
    *(_DWORD *)v11 = 136315138;
    v0[5] = sub_23A8BF840(0xD000000000000018, 0x800000023A8F4290, &v18);
    sub_23A8F12A4();
    _os_log_impl(&dword_23A8AD000, v5, v6, "HomeEnergyManager %s", v11, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B85B51C](v12, -1, -1);
    MEMORY[0x23B85B51C](v11, -1, -1);
  }

  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v8, v10);
  v14 = v0[6];
  v13 = v0[7];
  v15 = swift_task_alloc();
  v0[11] = v15;
  *(_QWORD *)(v15 + 16) = v14;
  *(_QWORD *)(v15 + 24) = v13;
  v16 = (_QWORD *)swift_task_alloc();
  v0[12] = v16;
  *v16 = v0;
  v16[1] = sub_23A8DF0DC;
  return sub_23A8F1400();
}

uint64_t sub_23A8DF0DC()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 104) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23A8DF148()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(unsigned __int8 *)(v0 + 112);
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v1);
}

uint64_t sub_23A8DF184()
{
  uint64_t v0;

  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(0);
}

uint64_t sub_23A8DF1C4(uint64_t a1)
{
  uint64_t v1;

  return sub_23A8E2C90(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), &qword_2569C8818, (uint64_t)&unk_250BB61C0, (uint64_t)&unk_2569C8DE0);
}

uint64_t sub_23A8DF1F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v6[20] = a5;
  v6[21] = a6;
  v6[19] = a4;
  v7 = sub_23A8F10A0();
  v6[22] = v7;
  v6[23] = *(_QWORD *)(v7 - 8);
  v6[24] = swift_task_alloc();
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569C8818);
  v6[25] = v8;
  v9 = *(_QWORD *)(v8 - 8);
  v6[26] = v9;
  v6[27] = *(_QWORD *)(v9 + 64);
  v6[28] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23A8DF288()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;

  v1 = v0[28];
  v2 = v0[25];
  v3 = v0[26];
  v4 = v0[19];
  type metadata accessor for HomeEnergyXPCConnection();
  swift_allocObject();
  v0[29] = sub_23A8EF888();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v1, v4, v2);
  v5 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v6 = swift_allocObject();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v3 + 32))(v6 + v5, v1, v2);
  v7 = (void *)sub_23A8EFE34((uint64_t)sub_23A8E5760, v6);
  v0[30] = v7;
  swift_release();
  v8 = sub_23A8F1130();
  v0[31] = v8;
  v0[7] = (char *)v0 + 261;
  v0[2] = v0;
  v0[3] = sub_23A8DF3FC;
  v9 = swift_continuation_init();
  v0[10] = MEMORY[0x24BDAC760];
  v0[11] = 0x40000000;
  v0[12] = sub_23A8DF6A4;
  v0[13] = &block_descriptor_87;
  v0[14] = v9;
  objc_msgSend(v7, sel_completedOnboardingWithId_completionHandler_, v8, v0 + 10);
  return swift_continuation_await();
}

uint64_t sub_23A8DF3FC()
{
  return swift_task_switch();
}

uint64_t sub_23A8DF448()
{
  uint64_t v0;
  void *v1;
  int v2;
  uint64_t v3;
  uint64_t v4;
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
  uint64_t v16;
  uint64_t v17;

  v1 = *(void **)(v0 + 248);
  v2 = *(unsigned __int8 *)(v0 + 261);
  swift_unknownObjectRelease();

  if (qword_2542D8828 != -1)
    swift_once();
  v4 = *(_QWORD *)(v0 + 184);
  v3 = *(_QWORD *)(v0 + 192);
  v5 = *(_QWORD *)(v0 + 176);
  v6 = __swift_project_value_buffer(v5, (uint64_t)qword_2542D8DE0);
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v3, v6, v5);
  v7 = sub_23A8F1088();
  v8 = sub_23A8F1268();
  v9 = os_log_type_enabled(v7, v8);
  v11 = *(_QWORD *)(v0 + 184);
  v10 = *(_QWORD *)(v0 + 192);
  v12 = *(_QWORD *)(v0 + 176);
  if (v9)
  {
    v16 = *(_QWORD *)(v0 + 192);
    v13 = swift_slowAlloc();
    v14 = swift_slowAlloc();
    v17 = v14;
    *(_DWORD *)v13 = 136315394;
    *(_QWORD *)(v0 + 144) = sub_23A8BF840(0xD000000000000018, 0x800000023A8F4290, &v17);
    sub_23A8F12A4();
    *(_WORD *)(v13 + 12) = 1024;
    *(_DWORD *)(v0 + 256) = v2;
    sub_23A8F12A4();
    _os_log_impl(&dword_23A8AD000, v7, v8, "%s Completed onboarding:  %{BOOL}d", (uint8_t *)v13, 0x12u);
    swift_arrayDestroy();
    MEMORY[0x23B85B51C](v14, -1, -1);
    MEMORY[0x23B85B51C](v13, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v16, v12);
  }
  else
  {

    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v10, v12);
  }
  objc_msgSend(*(id *)(*(_QWORD *)(v0 + 232) + 16), sel_invalidate);
  *(_BYTE *)(v0 + 260) = v2;
  sub_23A8F11F0();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23A8DF6A4(uint64_t a1, char a2)
{
  **(_BYTE **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 64) + 40) = a2;
  return swift_continuation_resume();
}

uint64_t HomeEnergyManager.updateCompletedOnboarding(id:value:)(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v3;
  uint64_t v4;

  *(_BYTE *)(v3 + 112) = a3;
  *(_QWORD *)(v3 + 48) = a1;
  *(_QWORD *)(v3 + 56) = a2;
  v4 = sub_23A8F10A0();
  *(_QWORD *)(v3 + 64) = v4;
  *(_QWORD *)(v3 + 72) = *(_QWORD *)(v4 - 8);
  *(_QWORD *)(v3 + 80) = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23A8DF71C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  _BOOL4 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t *v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v19;

  if (qword_2542D8828 != -1)
    swift_once();
  v2 = *(_QWORD *)(v0 + 72);
  v1 = *(_QWORD *)(v0 + 80);
  v3 = *(_QWORD *)(v0 + 64);
  v4 = __swift_project_value_buffer(v3, (uint64_t)qword_2542D8DE0);
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v4, v3);
  v5 = sub_23A8F1088();
  v6 = sub_23A8F1268();
  v7 = os_log_type_enabled(v5, v6);
  v9 = *(_QWORD *)(v0 + 72);
  v8 = *(_QWORD *)(v0 + 80);
  v10 = *(_QWORD *)(v0 + 64);
  if (v7)
  {
    v11 = (uint8_t *)swift_slowAlloc();
    v12 = swift_slowAlloc();
    v19 = v12;
    *(_DWORD *)v11 = 136315138;
    *(_QWORD *)(v0 + 40) = sub_23A8BF840(0xD000000000000024, 0x800000023A8F42B0, &v19);
    sub_23A8F12A4();
    _os_log_impl(&dword_23A8AD000, v5, v6, "HomeEnergyManager %s", v11, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B85B51C](v12, -1, -1);
    MEMORY[0x23B85B51C](v11, -1, -1);
  }

  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v8, v10);
  v13 = *(_BYTE *)(v0 + 112);
  v15 = *(_QWORD *)(v0 + 48);
  v14 = *(_QWORD *)(v0 + 56);
  v16 = swift_task_alloc();
  *(_QWORD *)(v0 + 88) = v16;
  *(_QWORD *)(v16 + 16) = v15;
  *(_QWORD *)(v16 + 24) = v14;
  *(_BYTE *)(v16 + 32) = v13;
  v17 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 96) = v17;
  *v17 = v0;
  v17[1] = sub_23A8DF968;
  return sub_23A8F1400();
}

uint64_t sub_23A8DF968()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 104) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23A8DF9D4()
{
  uint64_t v0;

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23A8DFA08()
{
  uint64_t v0;

  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23A8DFA44(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v19;

  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542D8D18);
  v9 = *(_QWORD *)(v8 - 8);
  v10 = *(_QWORD *)(v9 + 64);
  MEMORY[0x24BDAC7A8](v8);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542D8AC0);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v19 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_23A8F1208();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v13, 1, 1, v14);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))((char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v8);
  v15 = (*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  v16 = swift_allocObject();
  *(_QWORD *)(v16 + 16) = 0;
  *(_QWORD *)(v16 + 24) = 0;
  (*(void (**)(unint64_t, char *, uint64_t))(v9 + 32))(v16 + v15, (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), v8);
  v17 = v16 + ((v10 + v15 + 7) & 0xFFFFFFFFFFFFFFF8);
  *(_QWORD *)v17 = a2;
  *(_QWORD *)(v17 + 8) = a3;
  *(_BYTE *)(v17 + 16) = a4;
  swift_bridgeObjectRetain();
  sub_23A8B1124((uint64_t)v13, (uint64_t)&unk_2569C8DD0, v16);
  return swift_release();
}

uint64_t sub_23A8DFBB0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  *(_BYTE *)(v7 + 256) = a7;
  *(_QWORD *)(v7 + 160) = a5;
  *(_QWORD *)(v7 + 168) = a6;
  *(_QWORD *)(v7 + 152) = a4;
  v8 = sub_23A8F10A0();
  *(_QWORD *)(v7 + 176) = v8;
  *(_QWORD *)(v7 + 184) = *(_QWORD *)(v8 - 8);
  *(_QWORD *)(v7 + 192) = swift_task_alloc();
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542D8D18);
  *(_QWORD *)(v7 + 200) = v9;
  v10 = *(_QWORD *)(v9 - 8);
  *(_QWORD *)(v7 + 208) = v10;
  *(_QWORD *)(v7 + 216) = *(_QWORD *)(v10 + 64);
  *(_QWORD *)(v7 + 224) = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23A8DFC48()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int v11;

  v1 = *(_QWORD *)(v0 + 224);
  v3 = *(_QWORD *)(v0 + 200);
  v2 = *(_QWORD *)(v0 + 208);
  v11 = *(unsigned __int8 *)(v0 + 256);
  v4 = *(_QWORD *)(v0 + 152);
  type metadata accessor for HomeEnergyXPCConnection();
  swift_allocObject();
  *(_QWORD *)(v0 + 232) = sub_23A8EF888();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v4, v3);
  v5 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v6 = swift_allocObject();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v2 + 32))(v6 + v5, v1, v3);
  v7 = (void *)sub_23A8EFE34((uint64_t)sub_23A8E55DC, v6);
  *(_QWORD *)(v0 + 240) = v7;
  swift_release();
  v8 = sub_23A8F1130();
  *(_QWORD *)(v0 + 248) = v8;
  *(_QWORD *)(v0 + 16) = v0;
  *(_QWORD *)(v0 + 24) = sub_23A8DFDBC;
  v9 = swift_continuation_init();
  *(_QWORD *)(v0 + 80) = MEMORY[0x24BDAC760];
  *(_QWORD *)(v0 + 88) = 0x40000000;
  *(_QWORD *)(v0 + 96) = sub_23A8DEDAC;
  *(_QWORD *)(v0 + 104) = &block_descriptor_79;
  *(_QWORD *)(v0 + 112) = v9;
  objc_msgSend(v7, sel_updateCompletedOnboardingWithId_value_completionHandler_, v8, v11, v0 + 80);
  return swift_continuation_await();
}

uint64_t sub_23A8DFDBC()
{
  return swift_task_switch();
}

uint64_t sub_23A8DFE08()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  _BOOL4 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t *v12;
  uint64_t v13;
  uint64_t v15;

  v1 = *(void **)(v0 + 248);
  swift_unknownObjectRelease();

  if (qword_2542D8828 != -1)
    swift_once();
  v3 = *(_QWORD *)(v0 + 184);
  v2 = *(_QWORD *)(v0 + 192);
  v4 = *(_QWORD *)(v0 + 176);
  v5 = __swift_project_value_buffer(v4, (uint64_t)qword_2542D8DE0);
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v2, v5, v4);
  v6 = sub_23A8F1088();
  v7 = sub_23A8F1268();
  v8 = os_log_type_enabled(v6, v7);
  v10 = *(_QWORD *)(v0 + 184);
  v9 = *(_QWORD *)(v0 + 192);
  v11 = *(_QWORD *)(v0 + 176);
  if (v8)
  {
    v12 = (uint8_t *)swift_slowAlloc();
    v13 = swift_slowAlloc();
    v15 = v13;
    *(_DWORD *)v12 = 136315138;
    *(_QWORD *)(v0 + 144) = sub_23A8BF840(0xD000000000000024, 0x800000023A8F42B0, &v15);
    sub_23A8F12A4();
    _os_log_impl(&dword_23A8AD000, v6, v7, "%s Completed onboarding", v12, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B85B51C](v13, -1, -1);
    MEMORY[0x23B85B51C](v12, -1, -1);
  }

  (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v9, v11);
  objc_msgSend(*(id *)(*(_QWORD *)(v0 + 232) + 16), sel_invalidate);
  sub_23A8F11F0();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t HomeEnergyManager.utilitiesNearLocation(location:)(double a1, double a2)
{
  uint64_t v2;
  uint64_t v3;

  *(double *)(v2 + 56) = a1;
  *(double *)(v2 + 64) = a2;
  v3 = sub_23A8F10A0();
  *(_QWORD *)(v2 + 72) = v3;
  *(_QWORD *)(v2 + 80) = *(_QWORD *)(v3 - 8);
  *(_QWORD *)(v2 + 88) = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23A8E007C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  _BOOL4 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v18;

  if (qword_2542D8828 != -1)
    swift_once();
  v2 = v0[10];
  v1 = v0[11];
  v3 = v0[9];
  v4 = __swift_project_value_buffer(v3, (uint64_t)qword_2542D8DE0);
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v4, v3);
  v5 = sub_23A8F1088();
  v6 = sub_23A8F1268();
  v7 = os_log_type_enabled(v5, v6);
  v9 = v0[10];
  v8 = v0[11];
  v10 = v0[9];
  if (v7)
  {
    v11 = (uint8_t *)swift_slowAlloc();
    v12 = swift_slowAlloc();
    v18 = v12;
    *(_DWORD *)v11 = 136315138;
    v0[6] = sub_23A8BF840(0xD000000000000020, 0x800000023A8F42E0, &v18);
    sub_23A8F12A4();
    _os_log_impl(&dword_23A8AD000, v5, v6, "HomeEnergyManager %s", v11, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B85B51C](v12, -1, -1);
    MEMORY[0x23B85B51C](v11, -1, -1);
  }

  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v8, v10);
  v14 = v0[7];
  v13 = v0[8];
  v15 = swift_task_alloc();
  v0[12] = v15;
  *(_QWORD *)(v15 + 16) = v14;
  *(_QWORD *)(v15 + 24) = v13;
  v16 = (_QWORD *)swift_task_alloc();
  v0[13] = v16;
  __swift_instantiateConcreteTypeFromMangledName(qword_2542D8B18);
  *v16 = v0;
  v16[1] = sub_23A8E02D8;
  return sub_23A8F1400();
}

uint64_t sub_23A8E02D8()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 112) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23A8E0344(uint64_t a1, double a2, double a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  double *v15;
  uint64_t v17;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569C8DA8);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(_QWORD *)(v7 + 64);
  MEMORY[0x24BDAC7A8](v6);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542D8AC0);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_23A8F1208();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v11, 1, 1, v12);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v6);
  v13 = (*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  v14 = swift_allocObject();
  *(_QWORD *)(v14 + 16) = 0;
  *(_QWORD *)(v14 + 24) = 0;
  (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v14 + v13, (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v6);
  v15 = (double *)(v14 + ((v8 + v13 + 7) & 0xFFFFFFFFFFFFFFF8));
  *v15 = a2;
  v15[1] = a3;
  sub_23A8B1124((uint64_t)v11, (uint64_t)&unk_2569C8DB8, v14);
  return swift_release();
}

uint64_t sub_23A8E04A0(double a1, double a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  *(double *)(v6 + 224) = a1;
  *(double *)(v6 + 232) = a2;
  *(_QWORD *)(v6 + 216) = a6;
  v7 = sub_23A8F10A0();
  *(_QWORD *)(v6 + 240) = v7;
  *(_QWORD *)(v6 + 248) = *(_QWORD *)(v7 - 8);
  *(_QWORD *)(v6 + 256) = swift_task_alloc();
  *(_QWORD *)(v6 + 264) = swift_task_alloc();
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569C8DA8);
  *(_QWORD *)(v6 + 272) = v8;
  v9 = *(_QWORD *)(v8 - 8);
  *(_QWORD *)(v6 + 280) = v9;
  *(_QWORD *)(v6 + 288) = *(_QWORD *)(v9 + 64);
  *(_QWORD *)(v6 + 296) = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23A8E0544()
{
  double *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  double v4;
  double v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;

  v1 = *((_QWORD *)v0 + 37);
  v2 = *((_QWORD *)v0 + 34);
  v3 = *((_QWORD *)v0 + 35);
  v5 = v0[28];
  v4 = v0[29];
  v6 = *((_QWORD *)v0 + 27);
  type metadata accessor for HomeEnergyXPCConnection();
  swift_allocObject();
  *((_QWORD *)v0 + 38) = sub_23A8EF888();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v1, v6, v2);
  v7 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v8 = swift_allocObject();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v3 + 32))(v8 + v7, v1, v2);
  v9 = (void *)sub_23A8EFE34((uint64_t)sub_23A8E544C, v8);
  *((_QWORD *)v0 + 39) = v9;
  swift_release();
  *((_QWORD *)v0 + 7) = v0 + 23;
  *((_QWORD *)v0 + 2) = v0;
  *((_QWORD *)v0 + 3) = sub_23A8E06A8;
  v10 = swift_continuation_init();
  *((_QWORD *)v0 + 10) = MEMORY[0x24BDAC760];
  *((_QWORD *)v0 + 11) = 0x40000000;
  *((_QWORD *)v0 + 12) = sub_23A8E0BA0;
  *((_QWORD *)v0 + 13) = &block_descriptor_71_0;
  *((_QWORD *)v0 + 14) = v10;
  objc_msgSend(v9, sel_utilitiesNearLocationWithLocation_completionHandler_, v0 + 10, v5, v4);
  return swift_continuation_await();
}

uint64_t sub_23A8E06A8()
{
  return swift_task_switch();
}

uint64_t sub_23A8E06F4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
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
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  os_log_type_t v24;
  uint8_t *v25;
  _QWORD *v26;
  _BYTE *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _BYTE *v33;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;

  v1 = *(_QWORD *)(v0 + 184);
  v2 = *(_QWORD *)(v0 + 304);
  swift_unknownObjectRelease();
  objc_msgSend(*(id *)(v2 + 16), sel_invalidate);
  if (v1)
  {
    if (qword_2542D8828 != -1)
      swift_once();
    v3 = *(_QWORD *)(v0 + 248);
    v4 = *(_QWORD *)(v0 + 256);
    v5 = *(_QWORD *)(v0 + 240);
    v6 = __swift_project_value_buffer(v5, (uint64_t)qword_2542D8DE0);
    swift_beginAccess();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v4, v6, v5);
    swift_bridgeObjectRetain_n();
    v7 = sub_23A8F1088();
    v8 = sub_23A8F1268();
    v9 = os_log_type_enabled(v7, v8);
    v11 = *(_QWORD *)(v0 + 248);
    v10 = *(_QWORD *)(v0 + 256);
    v12 = *(_QWORD *)(v0 + 240);
    if (v9)
    {
      v37 = *(_QWORD *)(v0 + 256);
      v13 = swift_slowAlloc();
      v38 = swift_slowAlloc();
      v14 = v38;
      *(_DWORD *)v13 = 136315394;
      v36 = v12;
      *(_QWORD *)(v0 + 200) = sub_23A8BF840(0xD000000000000020, 0x800000023A8F42E0, &v38);
      sub_23A8F12A4();
      *(_WORD *)(v13 + 12) = 2080;
      v15 = swift_bridgeObjectRetain();
      v16 = MEMORY[0x23B85AE44](v15, MEMORY[0x24BEE0D00]);
      v35 = v11;
      v18 = v17;
      swift_bridgeObjectRelease();
      *(_QWORD *)(v0 + 208) = sub_23A8BF840(v16, v18, &v38);
      sub_23A8F12A4();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_23A8AD000, v7, v8, "%s result: %s", (uint8_t *)v13, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x23B85B51C](v14, -1, -1);
      MEMORY[0x23B85B51C](v13, -1, -1);

      (*(void (**)(uint64_t, uint64_t))(v35 + 8))(v37, v36);
    }
    else
    {
      swift_bridgeObjectRelease_n();

      (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v10, v12);
    }
    *(_QWORD *)(v0 + 192) = v1;
    sub_23A8F11F0();
  }
  else
  {
    if (qword_2542D8828 != -1)
      swift_once();
    v19 = *(_QWORD *)(v0 + 264);
    v21 = *(_QWORD *)(v0 + 240);
    v20 = *(_QWORD *)(v0 + 248);
    v22 = __swift_project_value_buffer(v21, (uint64_t)qword_2542D8DE0);
    swift_beginAccess();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v20 + 16))(v19, v22, v21);
    v23 = sub_23A8F1088();
    v24 = sub_23A8F1274();
    if (os_log_type_enabled(v23, v24))
    {
      v25 = (uint8_t *)swift_slowAlloc();
      v26 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v25 = 138412290;
      sub_23A8C3D5C();
      swift_allocError();
      *v27 = 16;
      v28 = _swift_stdlib_bridgeErrorToNSError();
      *(_QWORD *)(v0 + 176) = v28;
      sub_23A8F12A4();
      *v26 = v28;
      _os_log_impl(&dword_23A8AD000, v23, v24, "%@", v25, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(qword_2569C8410);
      swift_arrayDestroy();
      MEMORY[0x23B85B51C](v26, -1, -1);
      MEMORY[0x23B85B51C](v25, -1, -1);
    }
    v29 = *(_QWORD *)(v0 + 264);
    v30 = *(_QWORD *)(v0 + 240);
    v31 = *(_QWORD *)(v0 + 248);

    (*(void (**)(uint64_t, uint64_t))(v31 + 8))(v29, v30);
    sub_23A8C3D5C();
    v32 = swift_allocError();
    *v33 = 16;
    *(_QWORD *)(v0 + 168) = v32;
    sub_23A8F11E4();
  }
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23A8E0BA0(uint64_t a1, uint64_t a2)
{
  return sub_23A8E1A10(a1, a2, MEMORY[0x24BEE0D00], &qword_2569C8DC0);
}

uint64_t HomeEnergyManager.getAllUtilities(countryCode:)(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;

  v2[7] = a1;
  v2[8] = a2;
  v3 = sub_23A8F10A0();
  v2[9] = v3;
  v2[10] = *(_QWORD *)(v3 - 8);
  v2[11] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23A8E0C14()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  _BOOL4 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v18;

  if (qword_2542D8828 != -1)
    swift_once();
  v2 = v0[10];
  v1 = v0[11];
  v3 = v0[9];
  v4 = __swift_project_value_buffer(v3, (uint64_t)qword_2542D8DE0);
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v4, v3);
  v5 = sub_23A8F1088();
  v6 = sub_23A8F1268();
  v7 = os_log_type_enabled(v5, v6);
  v9 = v0[10];
  v8 = v0[11];
  v10 = v0[9];
  if (v7)
  {
    v11 = (uint8_t *)swift_slowAlloc();
    v12 = swift_slowAlloc();
    v18 = v12;
    *(_DWORD *)v11 = 136315138;
    v0[6] = sub_23A8BF840(0xD00000000000001DLL, 0x800000023A8F4310, &v18);
    sub_23A8F12A4();
    _os_log_impl(&dword_23A8AD000, v5, v6, "HomeEnergyManager %s", v11, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B85B51C](v12, -1, -1);
    MEMORY[0x23B85B51C](v11, -1, -1);
  }

  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v8, v10);
  v14 = v0[7];
  v13 = v0[8];
  v15 = swift_task_alloc();
  v0[12] = v15;
  *(_QWORD *)(v15 + 16) = v14;
  *(_QWORD *)(v15 + 24) = v13;
  v16 = (_QWORD *)swift_task_alloc();
  v0[13] = v16;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569C8CE8);
  *v16 = v0;
  v16[1] = sub_23A8E0E68;
  return sub_23A8F1400();
}

uint64_t sub_23A8E0E68()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 112) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23A8E0ED4()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 40);
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v1);
}

uint64_t sub_23A8E0F10()
{
  uint64_t v0;

  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23A8E0F4C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v17;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569C8D80);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(_QWORD *)(v7 + 64);
  MEMORY[0x24BDAC7A8](v6);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542D8AC0);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_23A8F1208();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v11, 1, 1, v12);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v6);
  v13 = (*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  v14 = swift_allocObject();
  *(_QWORD *)(v14 + 16) = 0;
  *(_QWORD *)(v14 + 24) = 0;
  (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v14 + v13, (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v6);
  v15 = (_QWORD *)(v14 + ((v8 + v13 + 7) & 0xFFFFFFFFFFFFFFF8));
  *v15 = a2;
  v15[1] = a3;
  swift_bridgeObjectRetain();
  sub_23A8B1124((uint64_t)v11, (uint64_t)&unk_2569C8D90, v14);
  return swift_release();
}

uint64_t sub_23A8E10B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v6[30] = a5;
  v6[31] = a6;
  v6[29] = a4;
  v7 = sub_23A8F10A0();
  v6[32] = v7;
  v6[33] = *(_QWORD *)(v7 - 8);
  v6[34] = swift_task_alloc();
  v6[35] = swift_task_alloc();
  v6[36] = swift_task_alloc();
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569C8D80);
  v6[37] = v8;
  v9 = *(_QWORD *)(v8 - 8);
  v6[38] = v9;
  v6[39] = *(_QWORD *)(v9 + 64);
  v6[40] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23A8E1160()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;

  v1 = v0[40];
  v2 = v0[37];
  v3 = v0[38];
  v4 = v0[31];
  v5 = v0[29];
  type metadata accessor for HomeEnergyXPCConnection();
  swift_allocObject();
  v0[41] = sub_23A8EF888();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v1, v5, v2);
  v6 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v7 = swift_allocObject();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v3 + 32))(v7 + v6, v1, v2);
  v8 = (void *)sub_23A8EFE34((uint64_t)sub_23A8E5190, v7);
  v0[42] = v8;
  swift_release();
  if (v4)
    v9 = sub_23A8F1130();
  else
    v9 = 0;
  v0[43] = v9;
  v0[7] = v0 + 23;
  v0[2] = v0;
  v0[3] = sub_23A8E12D0;
  v10 = swift_continuation_init();
  v0[10] = MEMORY[0x24BDAC760];
  v11 = v0 + 10;
  v11[1] = 0x40000000;
  v11[2] = sub_23A8E19FC;
  v11[3] = &block_descriptor_63;
  v11[4] = v10;
  objc_msgSend(v8, sel_getAllUtilitiesWithCountryCode_completionHandler_, v9, v11);
  return swift_continuation_await();
}

uint64_t sub_23A8E12D0()
{
  return swift_task_switch();
}

uint64_t sub_23A8E131C()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  _BOOL4 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  os_log_type_t v24;
  BOOL v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint8_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _BYTE *v33;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39[2];

  v1 = *(_QWORD *)(v0 + 184);
  v2 = *(void **)(v0 + 344);
  v3 = *(_QWORD *)(v0 + 328);
  swift_unknownObjectRelease();

  objc_msgSend(*(id *)(v3 + 16), sel_invalidate);
  if (v1)
  {
    if (qword_2542D8828 != -1)
      swift_once();
    v4 = *(_QWORD *)(v0 + 280);
    v5 = *(_QWORD *)(v0 + 256);
    v6 = *(_QWORD *)(v0 + 264);
    v7 = __swift_project_value_buffer(v5, (uint64_t)qword_2542D8DE0);
    swift_beginAccess();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v4, v7, v5);
    swift_bridgeObjectRetain_n();
    v8 = sub_23A8F1088();
    v9 = sub_23A8F1268();
    v10 = os_log_type_enabled(v8, v9);
    v11 = *(_QWORD *)(v0 + 280);
    v12 = *(_QWORD *)(v0 + 256);
    v13 = *(_QWORD *)(v0 + 264);
    if (v10)
    {
      v14 = swift_slowAlloc();
      v36 = swift_slowAlloc();
      v39[0] = v36;
      *(_DWORD *)v14 = 136315394;
      *(_QWORD *)(v0 + 216) = sub_23A8BF840(0xD00000000000001DLL, 0x800000023A8F4310, v39);
      sub_23A8F12A4();
      *(_WORD *)(v14 + 12) = 2080;
      v15 = swift_bridgeObjectRetain();
      v16 = MEMORY[0x23B85AE44](v15, MEMORY[0x24BDCDDE8]);
      v35 = v11;
      v18 = v17;
      swift_bridgeObjectRelease();
      *(_QWORD *)(v0 + 224) = sub_23A8BF840(v16, v18, v39);
      sub_23A8F12A4();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_23A8AD000, v8, v9, "%s result: %s", (uint8_t *)v14, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x23B85B51C](v36, -1, -1);
      MEMORY[0x23B85B51C](v14, -1, -1);

      (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v35, v12);
    }
    else
    {
      swift_bridgeObjectRelease_n();

      (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v11, v12);
    }
    sub_23A8F0BD8();
    swift_allocObject();
    sub_23A8F0BCC();
    v31 = sub_23A8E51BC(v1);
    swift_bridgeObjectRelease();
    *(_QWORD *)(v0 + 208) = v31;
    sub_23A8F11F0();
    swift_release();
  }
  else
  {
    if (qword_2542D8828 != -1)
      swift_once();
    v19 = *(_QWORD *)(v0 + 288);
    v21 = *(_QWORD *)(v0 + 256);
    v20 = *(_QWORD *)(v0 + 264);
    v22 = __swift_project_value_buffer(v21, (uint64_t)qword_2542D8DE0);
    swift_beginAccess();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v20 + 16))(v19, v22, v21);
    v23 = sub_23A8F1088();
    v24 = sub_23A8F1274();
    v25 = os_log_type_enabled(v23, v24);
    v26 = *(_QWORD *)(v0 + 288);
    v27 = *(_QWORD *)(v0 + 256);
    v28 = *(_QWORD *)(v0 + 264);
    if (v25)
    {
      v38 = *(_QWORD *)(v0 + 256);
      v37 = *(_QWORD *)(v0 + 288);
      v29 = (uint8_t *)swift_slowAlloc();
      v30 = swift_slowAlloc();
      v39[0] = v30;
      *(_DWORD *)v29 = 136315138;
      *(_QWORD *)(v0 + 176) = sub_23A8BF840(0xD00000000000001DLL, 0x800000023A8F4310, v39);
      sub_23A8F12A4();
      _os_log_impl(&dword_23A8AD000, v23, v24, "%s Failed to fetch utilities", v29, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x23B85B51C](v30, -1, -1);
      MEMORY[0x23B85B51C](v29, -1, -1);

      (*(void (**)(uint64_t, uint64_t))(v28 + 8))(v37, v38);
    }
    else
    {

      (*(void (**)(uint64_t, uint64_t))(v28 + 8))(v26, v27);
    }
    sub_23A8C3D5C();
    v32 = swift_allocError();
    *v33 = 14;
    *(_QWORD *)(v0 + 168) = v32;
    sub_23A8F11E4();
  }
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23A8E19FC(uint64_t a1, uint64_t a2)
{
  return sub_23A8E1A10(a1, a2, MEMORY[0x24BDCDDE8], &qword_2569C8DA0);
}

uint64_t sub_23A8E1A10(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;

  v5 = *(_QWORD *)(a1 + 32);
  if (a2)
    v6 = sub_23A8F11A8();
  else
    v6 = 0;
  v8 = v6;
  sub_23A8C7E20((uint64_t)&v8, *(_QWORD *)(*(_QWORD *)(v5 + 64) + 40), a4);
  return swift_continuation_resume();
}

uint64_t HomeEnergyManager.utilityInformation(utilityID:)(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;

  v2[8] = a1;
  v2[9] = a2;
  v3 = sub_23A8F10A0();
  v2[10] = v3;
  v2[11] = *(_QWORD *)(v3 - 8);
  v2[12] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23A8E1AD0()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  _BOOL4 v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  if (qword_2542D8828 != -1)
    swift_once();
  v2 = v0[11];
  v1 = v0[12];
  v3 = v0[10];
  v4 = __swift_project_value_buffer(v3, (uint64_t)qword_2542D8DE0);
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v4, v3);
  swift_bridgeObjectRetain_n();
  v5 = sub_23A8F1088();
  v6 = sub_23A8F1268();
  v7 = os_log_type_enabled(v5, v6);
  v9 = v0[11];
  v8 = v0[12];
  v10 = v0[9];
  v11 = v0[10];
  if (v7)
  {
    v21 = v0[12];
    v19 = v0[8];
    v12 = swift_slowAlloc();
    v20 = v11;
    v13 = swift_slowAlloc();
    v22 = v13;
    *(_DWORD *)v12 = 136315394;
    v0[6] = sub_23A8BF840(0xD00000000000001ELL, 0x800000023A8F4330, &v22);
    sub_23A8F12A4();
    *(_WORD *)(v12 + 12) = 2080;
    swift_bridgeObjectRetain();
    v0[7] = sub_23A8BF840(v19, v10, &v22);
    sub_23A8F12A4();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_23A8AD000, v5, v6, "HomeEnergyManager %s: utility ID %s", (uint8_t *)v12, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x23B85B51C](v13, -1, -1);
    MEMORY[0x23B85B51C](v12, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v21, v20);
  }
  else
  {
    swift_bridgeObjectRelease_n();

    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v8, v11);
  }
  v15 = v0[8];
  v14 = v0[9];
  v16 = swift_task_alloc();
  v0[13] = v16;
  *(_QWORD *)(v16 + 16) = v15;
  *(_QWORD *)(v16 + 24) = v14;
  v17 = (_QWORD *)swift_task_alloc();
  v0[14] = v17;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569C8CF8);
  *v17 = v0;
  v17[1] = sub_23A8E1DA8;
  return sub_23A8F1400();
}

uint64_t sub_23A8E1DA8()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 120) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23A8E1E14()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 40);
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v1);
}

uint64_t sub_23A8E1E50()
{
  uint64_t v0;

  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23A8E1E8C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v6[32] = a5;
  v6[33] = a6;
  v6[31] = a4;
  v7 = sub_23A8F10A0();
  v6[34] = v7;
  v6[35] = *(_QWORD *)(v7 - 8);
  v6[36] = swift_task_alloc();
  v6[37] = swift_task_alloc();
  v6[38] = swift_task_alloc();
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569C8D60);
  v6[39] = v8;
  v9 = *(_QWORD *)(v8 - 8);
  v6[40] = v9;
  v6[41] = *(_QWORD *)(v9 + 64);
  v6[42] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23A8E1F3C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;

  v1 = v0[42];
  v2 = v0[39];
  v3 = v0[40];
  v4 = v0[31];
  type metadata accessor for HomeEnergyXPCConnection();
  swift_allocObject();
  v0[43] = sub_23A8EF888();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v1, v4, v2);
  v5 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v6 = swift_allocObject();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v3 + 32))(v6 + v5, v1, v2);
  v7 = (void *)sub_23A8EFE34((uint64_t)sub_23A8E5088, v6);
  v0[44] = v7;
  swift_release();
  v8 = sub_23A8F1130();
  v0[45] = v8;
  v0[7] = v0 + 21;
  v0[2] = v0;
  v0[3] = sub_23A8E20B0;
  v9 = swift_continuation_init();
  v0[10] = MEMORY[0x24BDAC760];
  v0[11] = 0x40000000;
  v0[12] = sub_23A8DEDB4;
  v0[13] = &block_descriptor_55;
  v0[14] = v9;
  objc_msgSend(v7, sel_utilityInformationWithUtilityID_completionHandler_, v8, v0 + 10);
  return swift_continuation_await();
}

uint64_t sub_23A8E20B0()
{
  return swift_task_switch();
}

uint64_t sub_23A8E20FC()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  BOOL v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint8_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  os_log_type_t v22;
  _BOOL4 v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _BYTE *v33;
  void *v34;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39[2];

  v1 = *(void **)(v0 + 360);
  v2 = *(_QWORD *)(v0 + 344);
  v4 = *(_QWORD *)(v0 + 168);
  v3 = *(_QWORD *)(v0 + 176);
  swift_unknownObjectRelease();

  objc_msgSend(*(id *)(v2 + 16), sel_invalidate);
  if (v3 >> 60 == 15)
  {
    if (qword_2542D8828 != -1)
      swift_once();
    v5 = *(_QWORD *)(v0 + 304);
    v7 = *(_QWORD *)(v0 + 272);
    v6 = *(_QWORD *)(v0 + 280);
    v8 = __swift_project_value_buffer(v7, (uint64_t)qword_2542D8DE0);
    swift_beginAccess();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v5, v8, v7);
    v9 = sub_23A8F1088();
    v10 = sub_23A8F1274();
    v11 = os_log_type_enabled(v9, v10);
    v12 = *(_QWORD *)(v0 + 304);
    v14 = *(_QWORD *)(v0 + 272);
    v13 = *(_QWORD *)(v0 + 280);
    if (v11)
    {
      v38 = *(_QWORD *)(v0 + 304);
      v15 = (uint8_t *)swift_slowAlloc();
      v16 = swift_slowAlloc();
      v39[0] = v16;
      *(_DWORD *)v15 = 136315138;
      *(_QWORD *)(v0 + 184) = sub_23A8BF840(0xD00000000000001ELL, 0x800000023A8F4330, v39);
      sub_23A8F12A4();
      _os_log_impl(&dword_23A8AD000, v9, v10, "%s Failed to fetch utilities", v15, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x23B85B51C](v16, -1, -1);
      MEMORY[0x23B85B51C](v15, -1, -1);

      (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v38, v14);
    }
    else
    {

      (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v12, v14);
    }
    sub_23A8C3D5C();
    v32 = swift_allocError();
    *v33 = 15;
    *(_QWORD *)(v0 + 192) = v32;
    sub_23A8F11E4();
  }
  else
  {
    sub_23A8C69F4(v4, v3);
    if (qword_2542D8828 != -1)
      swift_once();
    v17 = *(_QWORD *)(v0 + 296);
    v18 = *(_QWORD *)(v0 + 272);
    v19 = *(_QWORD *)(v0 + 280);
    v20 = __swift_project_value_buffer(v18, (uint64_t)qword_2542D8DE0);
    swift_beginAccess();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v19 + 16))(v17, v20, v18);
    sub_23A8E50B4(v4, v3);
    sub_23A8C69F4(v4, v3);
    v21 = sub_23A8F1088();
    v22 = sub_23A8F1268();
    v23 = os_log_type_enabled(v21, v22);
    v24 = *(_QWORD *)(v0 + 296);
    v26 = *(_QWORD *)(v0 + 272);
    v25 = *(_QWORD *)(v0 + 280);
    if (v23)
    {
      v37 = *(_QWORD *)(v0 + 280);
      v27 = swift_slowAlloc();
      v36 = swift_slowAlloc();
      v39[0] = v36;
      *(_DWORD *)v27 = 136315394;
      *(_QWORD *)(v0 + 232) = sub_23A8BF840(0xD00000000000001ELL, 0x800000023A8F4330, v39);
      sub_23A8F12A4();
      *(_WORD *)(v27 + 12) = 2080;
      sub_23A8C69F4(v4, v3);
      v28 = sub_23A8F0C20();
      v30 = v29;
      sub_23A8DD658(v4, v3);
      *(_QWORD *)(v0 + 240) = sub_23A8BF840(v28, v30, v39);
      sub_23A8F12A4();
      swift_bridgeObjectRelease();
      sub_23A8DD658(v4, v3);
      sub_23A8DD658(v4, v3);
      _os_log_impl(&dword_23A8AD000, v21, v22, "%s result: %s", (uint8_t *)v27, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x23B85B51C](v36, -1, -1);
      MEMORY[0x23B85B51C](v27, -1, -1);

      v31 = (*(uint64_t (**)(uint64_t, uint64_t))(v37 + 8))(v24, v26);
    }
    else
    {
      sub_23A8DD658(v4, v3);
      sub_23A8DD658(v4, v3);

      v31 = (*(uint64_t (**)(uint64_t, uint64_t))(v25 + 8))(v24, v26);
    }
    v34 = (void *)MEMORY[0x23B85B168](v31);
    sub_23A8F0BD8();
    swift_allocObject();
    sub_23A8F0BCC();
    sub_23A8F1058();
    sub_23A8C6A38(&qword_2569C8D78, (uint64_t (*)(uint64_t))MEMORY[0x24BE4F578], MEMORY[0x24BE4F590]);
    sub_23A8F0BC0();
    swift_release();
    objc_autoreleasePoolPop(v34);
    *(_QWORD *)(v0 + 224) = *(_QWORD *)(v0 + 200);
    sub_23A8F11F0();
    sub_23A8DD658(v4, v3);
    sub_23A8DD658(v4, v3);
  }
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t HomeEnergyManager.isTAFEnabled(utilityID:)(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;

  v2[7] = a1;
  v2[8] = a2;
  v3 = sub_23A8F10A0();
  v2[9] = v3;
  v2[10] = *(_QWORD *)(v3 - 8);
  v2[11] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23A8E28D8()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  _BOOL4 v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  if (qword_2542D8828 != -1)
    swift_once();
  v2 = v0[10];
  v1 = v0[11];
  v3 = v0[9];
  v4 = __swift_project_value_buffer(v3, (uint64_t)qword_2542D8DE0);
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v4, v3);
  swift_bridgeObjectRetain_n();
  v5 = sub_23A8F1088();
  v6 = sub_23A8F1268();
  v7 = os_log_type_enabled(v5, v6);
  v9 = v0[10];
  v8 = v0[11];
  v10 = v0[8];
  v11 = v0[9];
  if (v7)
  {
    v21 = v0[11];
    v19 = v0[7];
    v12 = swift_slowAlloc();
    v20 = v11;
    v13 = swift_slowAlloc();
    v22 = v13;
    *(_DWORD *)v12 = 136315394;
    v0[5] = sub_23A8BF840(0xD000000000000018, 0x800000023A8F4350, &v22);
    sub_23A8F12A4();
    *(_WORD *)(v12 + 12) = 2080;
    swift_bridgeObjectRetain();
    v0[6] = sub_23A8BF840(v19, v10, &v22);
    sub_23A8F12A4();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_23A8AD000, v5, v6, "HomeEnergyManager %s: utility ID %s", (uint8_t *)v12, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x23B85B51C](v13, -1, -1);
    MEMORY[0x23B85B51C](v12, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v21, v20);
  }
  else
  {
    swift_bridgeObjectRelease_n();

    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v8, v11);
  }
  v15 = v0[7];
  v14 = v0[8];
  v16 = swift_task_alloc();
  v0[12] = v16;
  *(_QWORD *)(v16 + 16) = v15;
  *(_QWORD *)(v16 + 24) = v14;
  v17 = (_QWORD *)swift_task_alloc();
  v0[13] = v17;
  *v17 = v0;
  v17[1] = sub_23A8E2BA8;
  return sub_23A8F1400();
}

uint64_t sub_23A8E2BA8()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 112) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23A8E2C14()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(unsigned __int8 *)(v0 + 120);
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v1);
}

uint64_t sub_23A8E2C50()
{
  uint64_t v0;

  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(0);
}

uint64_t sub_23A8E2C90(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, uint64_t a5, uint64_t a6)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v21;

  v10 = __swift_instantiateConcreteTypeFromMangledName(a4);
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(_QWORD *)(v11 + 64);
  MEMORY[0x24BDAC7A8](v10);
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542D8AC0);
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)&v21 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = sub_23A8F1208();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(v15, 1, 1, v16);
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))((char *)&v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v10);
  v17 = (*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  v18 = swift_allocObject();
  *(_QWORD *)(v18 + 16) = 0;
  *(_QWORD *)(v18 + 24) = 0;
  (*(void (**)(unint64_t, char *, uint64_t))(v11 + 32))(v18 + v17, (char *)&v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0), v10);
  v19 = (_QWORD *)(v18 + ((v12 + v17 + 7) & 0xFFFFFFFFFFFFFFF8));
  *v19 = a2;
  v19[1] = a3;
  swift_bridgeObjectRetain();
  sub_23A8B1124((uint64_t)v15, a6, v18);
  return swift_release();
}

uint64_t sub_23A8E2DF0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v6[21] = a5;
  v6[22] = a6;
  v6[20] = a4;
  v7 = sub_23A8F10A0();
  v6[23] = v7;
  v6[24] = *(_QWORD *)(v7 - 8);
  v6[25] = swift_task_alloc();
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569C8818);
  v6[26] = v8;
  v9 = *(_QWORD *)(v8 - 8);
  v6[27] = v9;
  v6[28] = *(_QWORD *)(v9 + 64);
  v6[29] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23A8E2E84()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;

  v1 = v0[29];
  v2 = v0[26];
  v3 = v0[27];
  v4 = v0[20];
  type metadata accessor for HomeEnergyXPCConnection();
  swift_allocObject();
  v0[30] = sub_23A8EF888();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v1, v4, v2);
  v5 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v6 = swift_allocObject();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v3 + 32))(v6 + v5, v1, v2);
  v7 = (void *)sub_23A8EFE34((uint64_t)sub_23A8E4F94, v6);
  v0[31] = v7;
  swift_release();
  v8 = sub_23A8F1130();
  v0[32] = v8;
  v0[7] = (char *)v0 + 277;
  v0[2] = v0;
  v0[3] = sub_23A8E2FF8;
  v9 = swift_continuation_init();
  v0[10] = MEMORY[0x24BDAC760];
  v0[11] = 0x40000000;
  v0[12] = sub_23A8E5794;
  v0[13] = &block_descriptor_47;
  v0[14] = v9;
  objc_msgSend(v7, sel_isTAFEnabledWithUtilityID_completionHandler_, v8, v0 + 10);
  return swift_continuation_await();
}

uint64_t sub_23A8E2FF8()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)v0 + 264) = *(_QWORD *)(*(_QWORD *)v0 + 48);
  return swift_task_switch();
}

uint64_t sub_23A8E3058()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  _BOOL4 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;
  uint64_t v18;

  v1 = *(void **)(v0 + 256);
  v2 = *(_QWORD *)(v0 + 240);
  v3 = *(unsigned __int8 *)(v0 + 277);
  swift_unknownObjectRelease();

  objc_msgSend(*(id *)(v2 + 16), sel_invalidate);
  if (qword_2542D8828 != -1)
    swift_once();
  v5 = *(_QWORD *)(v0 + 192);
  v4 = *(_QWORD *)(v0 + 200);
  v6 = *(_QWORD *)(v0 + 184);
  v7 = __swift_project_value_buffer(v6, (uint64_t)qword_2542D8DE0);
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v4, v7, v6);
  v8 = sub_23A8F1088();
  v9 = sub_23A8F1268();
  v10 = os_log_type_enabled(v8, v9);
  v12 = *(_QWORD *)(v0 + 192);
  v11 = *(_QWORD *)(v0 + 200);
  v13 = *(_QWORD *)(v0 + 184);
  if (v10)
  {
    v17 = *(_QWORD *)(v0 + 200);
    v14 = swift_slowAlloc();
    v15 = swift_slowAlloc();
    v18 = v15;
    *(_DWORD *)v14 = 136315394;
    *(_QWORD *)(v0 + 152) = sub_23A8BF840(0xD000000000000018, 0x800000023A8F4350, &v18);
    sub_23A8F12A4();
    *(_WORD *)(v14 + 12) = 1024;
    *(_DWORD *)(v0 + 272) = v3;
    sub_23A8F12A4();
    _os_log_impl(&dword_23A8AD000, v8, v9, "%s result: %{BOOL}d", (uint8_t *)v14, 0x12u);
    swift_arrayDestroy();
    MEMORY[0x23B85B51C](v15, -1, -1);
    MEMORY[0x23B85B51C](v14, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v17, v13);
  }
  else
  {

    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v11, v13);
  }
  *(_BYTE *)(v0 + 276) = v3;
  sub_23A8F11F0();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23A8E32B4()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;

  v2 = *(void **)(v0 + 256);
  v1 = *(_QWORD *)(v0 + 264);
  swift_willThrow();
  swift_release();
  swift_unknownObjectRelease();

  *(_QWORD *)(v0 + 144) = v1;
  sub_23A8F11E4();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t HomeEnergyManager.useUtilityMockData(enableMock:)(char a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_BYTE *)(v1 + 96) = a1;
  v2 = sub_23A8F10A0();
  *(_QWORD *)(v1 + 48) = v2;
  *(_QWORD *)(v1 + 56) = *(_QWORD *)(v2 - 8);
  *(_QWORD *)(v1 + 64) = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23A8E33A4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  _BOOL4 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t *v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  if (qword_2542D8828 != -1)
    swift_once();
  v1 = *(_QWORD *)(v0 + 48);
  v3 = *(_QWORD *)(v0 + 56);
  v2 = *(_QWORD *)(v0 + 64);
  v4 = __swift_project_value_buffer(v1, (uint64_t)qword_2542D8DE0);
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v2, v4, v1);
  v5 = sub_23A8F1088();
  v6 = sub_23A8F1268();
  v7 = os_log_type_enabled(v5, v6);
  v9 = *(_QWORD *)(v0 + 56);
  v8 = *(_QWORD *)(v0 + 64);
  v10 = *(_QWORD *)(v0 + 48);
  if (v7)
  {
    v18 = *(_QWORD *)(v0 + 64);
    v17 = *(_QWORD *)(v0 + 48);
    v11 = (uint8_t *)swift_slowAlloc();
    v12 = swift_slowAlloc();
    v19 = v12;
    *(_DWORD *)v11 = 136315138;
    *(_QWORD *)(v0 + 40) = sub_23A8BF840(0xD00000000000001FLL, 0x800000023A8F4370, &v19);
    sub_23A8F12A4();
    _os_log_impl(&dword_23A8AD000, v5, v6, "HomeEnergyManager %s", v11, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B85B51C](v12, -1, -1);
    MEMORY[0x23B85B51C](v11, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v18, v17);
  }
  else
  {

    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v8, v10);
  }
  if ((sub_23A8F0DD0() & 1) != 0)
  {
    v13 = *(_BYTE *)(v0 + 96);
    v14 = swift_task_alloc();
    *(_QWORD *)(v0 + 72) = v14;
    *(_BYTE *)(v14 + 16) = v13;
    v15 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 80) = v15;
    *v15 = v0;
    v15[1] = sub_23A8E3630;
    return sub_23A8F1400();
  }
  else
  {
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_23A8E3630()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 88) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23A8E369C()
{
  uint64_t v0;

  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23A8E36D8(uint64_t a1, char a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v14;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542D8D18);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(_QWORD *)(v5 + 64);
  MEMORY[0x24BDAC7A8](v4);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542D8AC0);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_23A8F1208();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v9, 1, 1, v10);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))((char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v4);
  v11 = (*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = 0;
  *(_QWORD *)(v12 + 24) = 0;
  (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v12 + v11, (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v4);
  *(_BYTE *)(v12 + v11 + v6) = a2;
  sub_23A8B1124((uint64_t)v9, (uint64_t)&unk_2569C8D48, v12);
  return swift_release();
}

uint64_t sub_23A8E381C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  *(_BYTE *)(v5 + 232) = a5;
  *(_QWORD *)(v5 + 152) = a4;
  v6 = sub_23A8F10A0();
  *(_QWORD *)(v5 + 160) = v6;
  *(_QWORD *)(v5 + 168) = *(_QWORD *)(v6 - 8);
  *(_QWORD *)(v5 + 176) = swift_task_alloc();
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542D8D18);
  *(_QWORD *)(v5 + 184) = v7;
  v8 = *(_QWORD *)(v7 - 8);
  *(_QWORD *)(v5 + 192) = v8;
  *(_QWORD *)(v5 + 200) = *(_QWORD *)(v8 + 64);
  *(_QWORD *)(v5 + 208) = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23A8E38B0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;

  v1 = *(_QWORD *)(v0 + 208);
  v2 = *(_QWORD *)(v0 + 184);
  v3 = *(_QWORD *)(v0 + 192);
  v4 = *(unsigned __int8 *)(v0 + 232);
  v5 = *(_QWORD *)(v0 + 152);
  type metadata accessor for HomeEnergyXPCConnection();
  swift_allocObject();
  *(_QWORD *)(v0 + 216) = sub_23A8EF888();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v1, v5, v2);
  v6 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v7 = swift_allocObject();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v3 + 32))(v7 + v6, v1, v2);
  v8 = (void *)sub_23A8EFE34((uint64_t)sub_23A8E4EA0, v7);
  *(_QWORD *)(v0 + 224) = v8;
  swift_release();
  *(_QWORD *)(v0 + 16) = v0;
  *(_QWORD *)(v0 + 24) = sub_23A8E3A00;
  v9 = swift_continuation_init();
  *(_QWORD *)(v0 + 80) = MEMORY[0x24BDAC760];
  *(_QWORD *)(v0 + 88) = 0x40000000;
  *(_QWORD *)(v0 + 96) = sub_23A8DEDAC;
  *(_QWORD *)(v0 + 104) = &block_descriptor_39;
  *(_QWORD *)(v0 + 112) = v9;
  objc_msgSend(v8, sel_useUtilityMockDataWithEnableMock_completionHandler_, v4, v0 + 80);
  return swift_continuation_await();
}

uint64_t sub_23A8E3A00()
{
  return swift_task_switch();
}

uint64_t sub_23A8E3A4C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  _BOOL4 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint8_t *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v18;
  uint64_t v19;

  v1 = *(_QWORD *)(v0 + 216);
  swift_unknownObjectRelease();
  objc_msgSend(*(id *)(v1 + 16), sel_invalidate);
  if (qword_2542D8828 != -1)
    swift_once();
  v3 = *(_QWORD *)(v0 + 168);
  v2 = *(_QWORD *)(v0 + 176);
  v4 = *(_QWORD *)(v0 + 160);
  v5 = __swift_project_value_buffer(v4, (uint64_t)qword_2542D8DE0);
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v2, v5, v4);
  v6 = sub_23A8F1088();
  v7 = sub_23A8F1280();
  v8 = os_log_type_enabled(v6, v7);
  v9 = *(_QWORD *)(v0 + 168);
  v10 = *(_QWORD *)(v0 + 176);
  v11 = *(_QWORD *)(v0 + 160);
  if (v8)
  {
    v12 = *(unsigned __int8 *)(v0 + 232);
    v18 = *(_QWORD *)(v0 + 176);
    v13 = (uint8_t *)swift_slowAlloc();
    v14 = swift_slowAlloc();
    *(_DWORD *)v13 = 136315138;
    v19 = v14;
    if (v12)
      v15 = 0x64656C6261736964;
    else
      v15 = 0x64656C62616E65;
    if (v12)
      v16 = 0xE800000000000000;
    else
      v16 = 0xE700000000000000;
    *(_QWORD *)(v0 + 144) = sub_23A8BF840(v15, v16, &v19);
    sub_23A8F12A4();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23A8AD000, v6, v7, "Utility Mock Data usage: %s", v13, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B85B51C](v14, -1, -1);
    MEMORY[0x23B85B51C](v13, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v18, v11);
  }
  else
  {

    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v10, v11);
  }
  sub_23A8F11F0();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t HomeEnergyManager.clearCache()()
{
  _QWORD *v0;
  uint64_t v1;

  v1 = sub_23A8F10A0();
  v0[6] = v1;
  v0[7] = *(_QWORD *)(v1 - 8);
  v0[8] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23A8E3CF4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  _BOOL4 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t *v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  if (qword_2542D8828 != -1)
    swift_once();
  v1 = *(_QWORD *)(v0 + 48);
  v3 = *(_QWORD *)(v0 + 56);
  v2 = *(_QWORD *)(v0 + 64);
  v4 = __swift_project_value_buffer(v1, (uint64_t)qword_2542D8DE0);
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v2, v4, v1);
  v5 = sub_23A8F1088();
  v6 = sub_23A8F1268();
  v7 = os_log_type_enabled(v5, v6);
  v9 = *(_QWORD *)(v0 + 56);
  v8 = *(_QWORD *)(v0 + 64);
  v10 = *(_QWORD *)(v0 + 48);
  if (v7)
  {
    v16 = *(_QWORD *)(v0 + 64);
    v15 = *(_QWORD *)(v0 + 48);
    v11 = (uint8_t *)swift_slowAlloc();
    v12 = swift_slowAlloc();
    v17 = v12;
    *(_DWORD *)v11 = 136315138;
    *(_QWORD *)(v0 + 40) = sub_23A8BF840(0x6361437261656C63, 0xEC00000029286568, &v17);
    sub_23A8F12A4();
    _os_log_impl(&dword_23A8AD000, v5, v6, "HomeEnergyManager %s", v11, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B85B51C](v12, -1, -1);
    MEMORY[0x23B85B51C](v11, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v16, v15);
  }
  else
  {

    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v8, v10);
  }
  if ((sub_23A8F0DD0() & 1) != 0)
  {
    v13 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 72) = v13;
    *v13 = v0;
    v13[1] = sub_23A8E3F70;
    return sub_23A8F1400();
  }
  else
  {
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_23A8E3F70()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 80) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23A8E3FD4()
{
  uint64_t v0;

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23A8E4008(uint64_t a1)
{
  return sub_23A8E4484(a1, (uint64_t)&unk_250BB5EE8, (uint64_t)&unk_2569C8D38, (void (*)(char *, uint64_t, uint64_t))sub_23A8B1124);
}

uint64_t sub_23A8E4024(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4[18] = a4;
  v5 = sub_23A8F10A0();
  v4[19] = v5;
  v4[20] = *(_QWORD *)(v5 - 8);
  v4[21] = swift_task_alloc();
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542D8D18);
  v4[22] = v6;
  v7 = *(_QWORD *)(v6 - 8);
  v4[23] = v7;
  v4[24] = *(_QWORD *)(v7 + 64);
  v4[25] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23A8E40B4()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;

  v1 = v0[25];
  v2 = v0[22];
  v3 = v0[23];
  v4 = v0[18];
  type metadata accessor for HomeEnergyXPCConnection();
  swift_allocObject();
  v0[26] = sub_23A8EF888();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v1, v4, v2);
  v5 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v6 = swift_allocObject();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v3 + 32))(v6 + v5, v1, v2);
  v7 = (void *)sub_23A8EFE34((uint64_t)sub_23A8E4CD8, v6);
  v0[27] = v7;
  swift_release();
  v0[2] = v0;
  v0[3] = sub_23A8E41F4;
  v8 = swift_continuation_init();
  v0[10] = MEMORY[0x24BDAC760];
  v0[11] = 0x40000000;
  v0[12] = sub_23A8DEDAC;
  v0[13] = &block_descriptor_31;
  v0[14] = v8;
  objc_msgSend(v7, sel_clearCacheWithCompletionHandler_, v0 + 10);
  return swift_continuation_await();
}

uint64_t sub_23A8E41F4()
{
  return swift_task_switch();
}

uint64_t sub_23A8E4240()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v1 = *(_QWORD *)(v0 + 208);
  swift_unknownObjectRelease();
  objc_msgSend(*(id *)(v1 + 16), sel_invalidate);
  if (qword_2542D8828 != -1)
    swift_once();
  v3 = *(_QWORD *)(v0 + 160);
  v2 = *(_QWORD *)(v0 + 168);
  v4 = *(_QWORD *)(v0 + 152);
  v5 = __swift_project_value_buffer(v4, (uint64_t)qword_2542D8DE0);
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v2, v5, v4);
  v6 = sub_23A8F1088();
  v7 = sub_23A8F1280();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_23A8AD000, v6, v7, "Clearing UtilityServices cache)", v8, 2u);
    MEMORY[0x23B85B51C](v8, -1, -1);
  }
  v9 = *(_QWORD *)(v0 + 168);
  v10 = *(_QWORD *)(v0 + 152);
  v11 = *(_QWORD *)(v0 + 160);

  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v9, v10);
  sub_23A8F11F0();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t HomeEnergyManager.triggerAMIFetchFromDropbox()()
{
  return swift_task_switch();
}

uint64_t sub_23A8E43C8()
{
  uint64_t v0;
  _QWORD *v1;

  if ((sub_23A8F0DD0() & 1) == 0)
    return (*(uint64_t (**)(void))(v0 + 8))();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_23A8DB7FC;
  return sub_23A8F1400();
}

uint64_t sub_23A8E4468(uint64_t a1)
{
  return sub_23A8E4484(a1, (uint64_t)&unk_250BB5E80, (uint64_t)&unk_2569C8D28, (void (*)(char *, uint64_t, uint64_t))sub_23A8DEC80);
}

uint64_t sub_23A8E4484(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(char *, uint64_t, uint64_t))
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v17;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542D8D18);
  v8 = *(_QWORD *)(v7 - 8);
  v9 = *(_QWORD *)(v8 + 64);
  MEMORY[0x24BDAC7A8](v7);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542D8AC0);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_23A8F1208();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v12, 1, 1, v13);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))((char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v7);
  v14 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  v15 = swift_allocObject();
  *(_QWORD *)(v15 + 16) = 0;
  *(_QWORD *)(v15 + 24) = 0;
  (*(void (**)(unint64_t, char *, uint64_t))(v8 + 32))(v15 + v14, (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), v7);
  a4(v12, a3, v15);
  return swift_release();
}

uint64_t sub_23A8E45C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;

  v4[15] = a4;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542D8D18);
  v4[16] = v5;
  v6 = *(_QWORD *)(v5 - 8);
  v4[17] = v6;
  v4[18] = *(_QWORD *)(v6 + 64);
  v4[19] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23A8E4630()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;

  v1 = v0[19];
  v2 = v0[16];
  v3 = v0[17];
  v4 = v0[15];
  type metadata accessor for HomeEnergyXPCConnection();
  swift_allocObject();
  v0[20] = sub_23A8EF888();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v1, v4, v2);
  v5 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v6 = swift_allocObject();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v3 + 32))(v6 + v5, v1, v2);
  v7 = (void *)sub_23A8EFE34((uint64_t)sub_23A8E4B9C, v6);
  v0[21] = v7;
  swift_release();
  v0[2] = v0;
  v0[3] = sub_23A8DBB6C;
  v8 = swift_continuation_init();
  v0[10] = MEMORY[0x24BDAC760];
  v0[11] = 0x40000000;
  v0[12] = sub_23A8B7638;
  v0[13] = &block_descriptor_2;
  v0[14] = v8;
  objc_msgSend(v7, sel_triggerAMIFetchFromDropboxWithCompletionHandler_, v0 + 10);
  return swift_continuation_await();
}

uint64_t sub_23A8E4770(void *a1, uint64_t a2, uint64_t a3, unint64_t a4, const char *a5, uint64_t *a6)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  id v15;
  id v16;
  NSObject *v17;
  os_log_type_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  unint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;

  v33 = a4;
  v34 = a5;
  v10 = sub_23A8F10A0();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v28 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2542D8828 != -1)
    swift_once();
  v14 = __swift_project_value_buffer(v10, (uint64_t)qword_2542D8DE0);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v13, v14, v10);
  v15 = a1;
  v16 = a1;
  v17 = sub_23A8F1088();
  v18 = sub_23A8F1274();
  if (os_log_type_enabled(v17, v18))
  {
    v19 = swift_slowAlloc();
    v30 = v11;
    v20 = v19;
    v21 = swift_slowAlloc();
    v32 = a2;
    v22 = (_QWORD *)v21;
    v29 = swift_slowAlloc();
    v36 = v29;
    *(_DWORD *)v20 = 136315394;
    v31 = a6;
    v35 = sub_23A8BF840(a3, v33, &v36);
    sub_23A8F12A4();
    *(_WORD *)(v20 + 12) = 2112;
    v23 = a1;
    v24 = _swift_stdlib_bridgeErrorToNSError();
    v35 = v24;
    a6 = v31;
    sub_23A8F12A4();
    *v22 = v24;

    _os_log_impl(&dword_23A8AD000, v17, v18, v34, (uint8_t *)v20, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(qword_2569C8410);
    swift_arrayDestroy();
    MEMORY[0x23B85B51C](v22, -1, -1);
    v25 = v29;
    swift_arrayDestroy();
    MEMORY[0x23B85B51C](v25, -1, -1);
    MEMORY[0x23B85B51C](v20, -1, -1);

    (*(void (**)(char *, uint64_t))(v30 + 8))(v13, v10);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  }
  v36 = (uint64_t)a1;
  v26 = a1;
  __swift_instantiateConcreteTypeFromMangledName(a6);
  return sub_23A8F11E4();
}

uint64_t sub_23A8E4A40(uint64_t a1)
{
  uint64_t v1;

  return sub_23A8DFA44(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), *(_BYTE *)(v1 + 32));
}

uint64_t sub_23A8E4A4C(uint64_t a1)
{
  uint64_t v1;

  return sub_23A8E0344(a1, *(double *)(v1 + 16), *(double *)(v1 + 24));
}

uint64_t sub_23A8E4A54(uint64_t a1)
{
  uint64_t v1;

  return sub_23A8E0F4C(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t sub_23A8E4A5C(uint64_t a1)
{
  uint64_t v1;

  return sub_23A8E2C90(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), &qword_2569C8D60, (uint64_t)&unk_250BB6020, (uint64_t)&unk_2569C8D70);
}

uint64_t sub_23A8E4A8C(uint64_t a1)
{
  uint64_t v1;

  return sub_23A8E2C90(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), &qword_2569C8818, (uint64_t)&unk_250BB5FB8, (uint64_t)&unk_2569C8D58);
}

uint64_t sub_23A8E4ABC(uint64_t a1)
{
  uint64_t v1;

  return sub_23A8E36D8(a1, *(_BYTE *)(v1 + 16));
}

uint64_t sub_23A8E4AC8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v4 = *(unsigned __int8 *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2542D8D18) - 8) + 80);
  v5 = *(_QWORD *)(v1 + 16);
  v6 = *(_QWORD *)(v1 + 24);
  v7 = v1 + ((v4 + 32) & ~v4);
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v8;
  *v8 = v2;
  v8[1] = sub_23A8C4ED0;
  return sub_23A8E45C8(a1, v5, v6, v7);
}

uint64_t sub_23A8E4B50(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542D8AC0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_23A8E4B90()
{
  return objectdestroy_90Tm(&qword_2542D8D18);
}

uint64_t sub_23A8E4B9C(void *a1)
{
  return sub_23A8E4D08(a1, &qword_2542D8D18, 0xD00000000000001CLL, 0x800000023A8F4390, "%s Failed to open xpc connection. %@");
}

uint64_t objectdestroyTm_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542D8D18);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_unknownObjectRelease();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  return swift_deallocObject();
}

uint64_t sub_23A8E4C44(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v4 = *(unsigned __int8 *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2542D8D18) - 8) + 80);
  v5 = *(_QWORD *)(v1 + 16);
  v6 = *(_QWORD *)(v1 + 24);
  v7 = v1 + ((v4 + 32) & ~v4);
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v8;
  *v8 = v2;
  v8[1] = sub_23A8C4ED0;
  return sub_23A8E4024(a1, v5, v6, v7);
}

uint64_t sub_23A8E4CCC()
{
  return objectdestroy_90Tm(&qword_2542D8D18);
}

uint64_t sub_23A8E4CD8(void *a1)
{
  return sub_23A8E4D08(a1, &qword_2542D8D18, 0x6361437261656C63, 0xEC00000029286568, "%s Failed to open xpc connection. %@");
}

uint64_t sub_23A8E4D08(void *a1, uint64_t *a2, uint64_t a3, unint64_t a4, const char *a5)
{
  uint64_t v5;
  uint64_t v11;

  v11 = *(unsigned __int8 *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(a2) - 8) + 80);
  return sub_23A8E4770(a1, v5 + ((v11 + 16) & ~v11), a3, a4, a5, a2);
}

uint64_t sub_23A8E4D78()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542D8D18);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_unknownObjectRelease();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  return swift_deallocObject();
}

uint64_t sub_23A8E4DF4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  _QWORD *v10;

  v4 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2542D8D18) - 8);
  v5 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v6 = *(_QWORD *)(v1 + 16);
  v7 = *(_QWORD *)(v1 + 24);
  v8 = v1 + v5;
  v9 = *(_BYTE *)(v1 + v5 + *(_QWORD *)(v4 + 64));
  v10 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v10;
  *v10 = v2;
  v10[1] = sub_23A8C8720;
  return sub_23A8E381C(a1, v6, v7, v8, v9);
}

uint64_t sub_23A8E4E94()
{
  return objectdestroy_90Tm(&qword_2542D8D18);
}

uint64_t sub_23A8E4EA0(void *a1)
{
  return sub_23A8E4D08(a1, &qword_2542D8D18, 0xD00000000000001FLL, 0x800000023A8F4370, "%s Failed to open xpc connection. %@");
}

uint64_t sub_23A8E4ECC()
{
  return objectdestroy_41Tm(&qword_2569C8818);
}

uint64_t sub_23A8E4ED8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;

  v4 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2569C8818) - 8);
  v5 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v6 = *(_QWORD *)(v1 + 16);
  v7 = *(_QWORD *)(v1 + 24);
  v8 = v1 + v5;
  v9 = (uint64_t *)(v1 + ((*(_QWORD *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8));
  v10 = *v9;
  v11 = v9[1];
  v12 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v12;
  *v12 = v2;
  v12[1] = sub_23A8C8720;
  return sub_23A8E2DF0(a1, v6, v7, v8, v10, v11);
}

uint64_t sub_23A8E4F88()
{
  return objectdestroy_90Tm(&qword_2569C8818);
}

uint64_t sub_23A8E4F94(void *a1)
{
  return sub_23A8E4D08(a1, &qword_2569C8818, 0xD000000000000018, 0x800000023A8F4350, "%s Failed to establish daemon connection. %@");
}

uint64_t sub_23A8E4FC0()
{
  return objectdestroy_41Tm(&qword_2569C8D60);
}

uint64_t sub_23A8E4FCC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;

  v4 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2569C8D60) - 8);
  v5 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v6 = *(_QWORD *)(v1 + 16);
  v7 = *(_QWORD *)(v1 + 24);
  v8 = v1 + v5;
  v9 = (uint64_t *)(v1 + ((*(_QWORD *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8));
  v10 = *v9;
  v11 = v9[1];
  v12 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v12;
  *v12 = v2;
  v12[1] = sub_23A8C8720;
  return sub_23A8E1E8C(a1, v6, v7, v8, v10, v11);
}

uint64_t sub_23A8E507C()
{
  return objectdestroy_90Tm(&qword_2569C8D60);
}

uint64_t sub_23A8E5088(void *a1)
{
  return sub_23A8E4D08(a1, &qword_2569C8D60, 0xD00000000000001ELL, 0x800000023A8F4330, "%s Failed to establish daemon connection. %@");
}

uint64_t sub_23A8E50B4(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_23A8C69F4(a1, a2);
  return a1;
}

uint64_t sub_23A8E50C8()
{
  return objectdestroy_41Tm(&qword_2569C8D80);
}

uint64_t sub_23A8E50D4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;

  v4 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2569C8D80) - 8);
  v5 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v6 = *(_QWORD *)(v1 + 16);
  v7 = *(_QWORD *)(v1 + 24);
  v8 = v1 + v5;
  v9 = (uint64_t *)(v1 + ((*(_QWORD *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8));
  v10 = *v9;
  v11 = v9[1];
  v12 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v12;
  *v12 = v2;
  v12[1] = sub_23A8C8720;
  return sub_23A8E10B0(a1, v6, v7, v8, v10, v11);
}

uint64_t sub_23A8E5184()
{
  return objectdestroy_90Tm(&qword_2569C8D80);
}

uint64_t sub_23A8E5190(void *a1)
{
  return sub_23A8E4D08(a1, &qword_2569C8D80, 0xD00000000000001DLL, 0x800000023A8F4310, "%s Failed to establish daemon connection. %@");
}

uint64_t sub_23A8E51BC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t result;
  unint64_t *v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v3 = *(_QWORD *)(a1 + 16);
  result = MEMORY[0x24BEE4AF8];
  if (v3)
  {
    v8 = MEMORY[0x24BEE4AF8];
    sub_23A8F1364();
    sub_23A8F1064();
    v5 = (unint64_t *)(a1 + 40);
    while (1)
    {
      v7 = *(v5 - 1);
      v6 = *v5;
      sub_23A8C69F4(v7, *v5);
      sub_23A8C6A38(&qword_2569C8D98, (uint64_t (*)(uint64_t))MEMORY[0x24BE4F720], MEMORY[0x24BE4F738]);
      sub_23A8F0BC0();
      if (v1)
        break;
      v5 += 2;
      sub_23A8C69B0(v7, v6);
      sub_23A8F134C();
      sub_23A8F1370();
      sub_23A8F137C();
      sub_23A8F1358();
      if (!--v3)
        return v8;
    }
    sub_23A8C69B0(v7, v6);
    return swift_release();
  }
  return result;
}

uint64_t sub_23A8E5304()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569C8DA8);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_unknownObjectRelease();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  return swift_deallocObject();
}

uint64_t sub_23A8E5388(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double *v9;
  double v10;
  double v11;
  _QWORD *v12;

  v4 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2569C8DA8) - 8);
  v5 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v6 = *(_QWORD *)(v1 + 16);
  v7 = *(_QWORD *)(v1 + 24);
  v8 = v1 + v5;
  v9 = (double *)(v1 + ((*(_QWORD *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8));
  v10 = *v9;
  v11 = v9[1];
  v12 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v12;
  *v12 = v2;
  v12[1] = sub_23A8C8720;
  return sub_23A8E04A0(v10, v11, a1, v6, v7, v8);
}

uint64_t sub_23A8E5440()
{
  return objectdestroy_90Tm(&qword_2569C8DA8);
}

uint64_t sub_23A8E544C(void *a1)
{
  return sub_23A8E4D08(a1, &qword_2569C8DA8, 0xD000000000000020, 0x800000023A8F42E0, "%s Failed to establish daemon connection. %@");
}

uint64_t sub_23A8E5478()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542D8D18);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_unknownObjectRelease();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_23A8E5510(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  _QWORD *v13;

  v4 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2542D8D18) - 8);
  v5 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v6 = *(_QWORD *)(v1 + 16);
  v7 = *(_QWORD *)(v1 + 24);
  v8 = v1 + v5;
  v9 = v1 + ((*(_QWORD *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8);
  v10 = *(_QWORD *)v9;
  v11 = *(_QWORD *)(v9 + 8);
  v12 = *(_BYTE *)(v9 + 16);
  v13 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v13;
  *v13 = v2;
  v13[1] = sub_23A8C8720;
  return sub_23A8DFBB0(a1, v6, v7, v8, v10, v11, v12);
}

uint64_t sub_23A8E55D0()
{
  return objectdestroy_90Tm(&qword_2542D8D18);
}

uint64_t sub_23A8E55DC(void *a1)
{
  return sub_23A8E4D08(a1, &qword_2542D8D18, 0xD000000000000024, 0x800000023A8F42B0, "%s Failed to establish daemon connection. %@");
}

uint64_t sub_23A8E5608()
{
  return objectdestroy_41Tm(&qword_2569C8818);
}

uint64_t objectdestroy_41Tm(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;

  v2 = __swift_instantiateConcreteTypeFromMangledName(a1);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  swift_unknownObjectRelease();
  (*(void (**)(unint64_t, uint64_t))(v3 + 8))(v1 + v4, v2);
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_23A8E56A4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;

  v4 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2569C8818) - 8);
  v5 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v6 = *(_QWORD *)(v1 + 16);
  v7 = *(_QWORD *)(v1 + 24);
  v8 = v1 + v5;
  v9 = (uint64_t *)(v1 + ((*(_QWORD *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8));
  v10 = *v9;
  v11 = v9[1];
  v12 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v12;
  *v12 = v2;
  v12[1] = sub_23A8C8720;
  return sub_23A8DF1F4(a1, v6, v7, v8, v10, v11);
}

uint64_t sub_23A8E5754()
{
  return objectdestroy_90Tm(&qword_2569C8818);
}

uint64_t sub_23A8E5760(void *a1)
{
  return sub_23A8E4D08(a1, &qword_2569C8818, 0xD000000000000018, 0x800000023A8F4290, "%s Failed to establish daemon connection. %@");
}

uint64_t sub_23A8E5794(uint64_t a1, char a2, void *a3)
{
  _QWORD *v4;
  id v5;

  if (a3)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2542D8AE0);
    swift_allocError();
    *v4 = a3;
    v5 = a3;
    return swift_continuation_throwingResumeWithError();
  }
  else
  {
    **(_BYTE **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 64) + 40) = a2;
    return swift_continuation_throwingResume();
  }
}

uint64_t EnergySite.generateMockAMIData(startDate:endDate:forceAllReadingsToConstant:recordInterval:batchSize:rateSchedule:netMetering:direction:randomization:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;
  char v12;
  uint64_t v13;
  char v14;

  *(_BYTE *)(v9 + 123) = v14;
  *(_QWORD *)(v9 + 80) = v13;
  *(_QWORD *)(v9 + 88) = v8;
  *(_BYTE *)(v9 + 122) = v12;
  *(_QWORD *)(v9 + 64) = a8;
  *(_QWORD *)(v9 + 72) = v11;
  *(_QWORD *)(v9 + 48) = a6;
  *(_QWORD *)(v9 + 56) = a7;
  *(_BYTE *)(v9 + 121) = a5;
  *(_QWORD *)(v9 + 32) = a3;
  *(_QWORD *)(v9 + 40) = a4;
  *(_QWORD *)(v9 + 16) = a1;
  *(_QWORD *)(v9 + 24) = a2;
  return swift_task_switch();
}

uint64_t sub_23A8E585C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  __int128 v12;
  __int128 v13;
  char v14;

  if ((sub_23A8F0DD0() & 1) == 0)
    return (*(uint64_t (**)(_QWORD))(v0 + 8))(0);
  v14 = *(_BYTE *)(v0 + 123);
  v2 = *(_QWORD *)(v0 + 80);
  v1 = *(_QWORD *)(v0 + 88);
  v3 = *(_BYTE *)(v0 + 122);
  v5 = *(_QWORD *)(v0 + 64);
  v4 = *(_QWORD *)(v0 + 72);
  v6 = *(_BYTE *)(v0 + 121);
  v7 = *(_QWORD *)(v0 + 40);
  v12 = *(_OWORD *)(v0 + 24);
  v13 = *(_OWORD *)(v0 + 48);
  v8 = *(_QWORD *)(v0 + 16);
  v9 = swift_task_alloc();
  *(_QWORD *)(v0 + 96) = v9;
  *(_QWORD *)(v9 + 16) = v1;
  *(_QWORD *)(v9 + 24) = v8;
  *(_OWORD *)(v9 + 32) = v12;
  *(_QWORD *)(v9 + 48) = v7;
  *(_BYTE *)(v9 + 56) = v6;
  *(_OWORD *)(v9 + 64) = v13;
  *(_QWORD *)(v9 + 80) = v5;
  *(_QWORD *)(v9 + 88) = v4;
  *(_BYTE *)(v9 + 96) = v3;
  *(_QWORD *)(v9 + 104) = v2;
  *(_BYTE *)(v9 + 112) = v14;
  v10 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 104) = v10;
  *v10 = v0;
  v10[1] = sub_23A8E59A4;
  return sub_23A8F1400();
}

uint64_t sub_23A8E59A4()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 112) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23A8E5A10()
{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(unsigned __int8 *)(v0 + 120));
}

uint64_t sub_23A8E5A1C()
{
  uint64_t v0;

  swift_task_dealloc();
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(0);
}

uint64_t sub_23A8E5A5C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, unsigned __int8 a12, uint64_t a13, unsigned __int8 a14)
{
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  _QWORD *v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  unint64_t v37;
  unint64_t v38;
  char *v39;
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
  int v50;
  int v51;
  uint64_t v52;

  v52 = a8;
  v42 = a3;
  v43 = a4;
  v50 = a7;
  v51 = a14;
  v48 = a6;
  v49 = a13;
  v47 = a12;
  v45 = a11;
  v46 = a5;
  v44 = a10;
  v40 = a2;
  v41 = a9;
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569C8818);
  v16 = *(_QWORD *)(v15 - 8);
  v17 = *(_QWORD *)(v16 + 64);
  MEMORY[0x24BDAC7A8](v15);
  v18 = (char *)&v37 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542D8AC0);
  MEMORY[0x24BDAC7A8](v19);
  v21 = (char *)&v37 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v39 = v21;
  v22 = sub_23A8F1208();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 56))(v21, 1, 1, v22);
  (*(void (**)(char *, uint64_t, uint64_t))(v16 + 16))(v18, a1, v15);
  v23 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  v24 = (v17 + v23 + 7) & 0xFFFFFFFFFFFFFFF8;
  v25 = (v24 + 15) & 0xFFFFFFFFFFFFFFF8;
  v26 = (v25 + 47) & 0xFFFFFFFFFFFFFFF8;
  v27 = (v26 + 15) & 0xFFFFFFFFFFFFFFF8;
  v37 = (v27 + 15) & 0xFFFFFFFFFFFFFFF8;
  v38 = (v25 + 23) & 0xFFFFFFFFFFFFFFF8;
  v28 = swift_allocObject();
  *(_QWORD *)(v28 + 16) = 0;
  *(_QWORD *)(v28 + 24) = 0;
  (*(void (**)(unint64_t, char *, uint64_t))(v16 + 32))(v28 + v23, v18, v15);
  *(_QWORD *)(v28 + v24) = v40;
  v29 = (_QWORD *)(v28 + v25);
  v30 = v43;
  *v29 = v42;
  v29[1] = v30;
  v31 = v28 + v38;
  v32 = v45;
  v33 = v48;
  *(_QWORD *)v31 = v46;
  *(_QWORD *)(v31 + 8) = v33;
  *(_BYTE *)(v31 + 16) = v50;
  *(_QWORD *)(v28 + v26) = v52;
  *(_QWORD *)(v28 + v27) = v41;
  v34 = v28 + v37;
  *(_QWORD *)v34 = v44;
  *(_QWORD *)(v34 + 8) = v32;
  *(_BYTE *)(v34 + 16) = v47;
  v35 = v28 + ((v27 + 39) & 0xFFFFFFFFFFFFFFF8);
  *(_QWORD *)v35 = v49;
  *(_BYTE *)(v35 + 8) = v51;
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_23A8B1124((uint64_t)v39, (uint64_t)&unk_2569C8E10, v28);
  return swift_release();
}

uint64_t sub_23A8E5CA4(uint64_t a1)
{
  uint64_t v1;

  return sub_23A8E5A5C(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32), *(_QWORD *)(v1 + 40), *(_QWORD *)(v1 + 48), *(unsigned __int8 *)(v1 + 56), *(_QWORD *)(v1 + 64), *(_QWORD *)(v1 + 72), *(_QWORD *)(v1 + 80), *(_QWORD *)(v1 + 88), *(_BYTE *)(v1 + 96), *(_QWORD *)(v1 + 104), *(_BYTE *)(v1 + 112));
}

uint64_t sub_23A8E5CFC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  char v20;

  *(_BYTE *)(v8 + 308) = v20;
  *(_QWORD *)(v8 + 200) = v17;
  *(_QWORD *)(v8 + 208) = v19;
  *(_BYTE *)(v8 + 307) = v18;
  *(_QWORD *)(v8 + 184) = v15;
  *(_QWORD *)(v8 + 192) = v16;
  *(_QWORD *)(v8 + 168) = v12;
  *(_QWORD *)(v8 + 176) = v14;
  *(_BYTE *)(v8 + 306) = v13;
  *(_QWORD *)(v8 + 152) = a7;
  *(_QWORD *)(v8 + 160) = a8;
  *(_QWORD *)(v8 + 136) = a5;
  *(_QWORD *)(v8 + 144) = a6;
  *(_QWORD *)(v8 + 128) = a4;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569C8818);
  *(_QWORD *)(v8 + 216) = v9;
  v10 = *(_QWORD *)(v9 - 8);
  *(_QWORD *)(v8 + 224) = v10;
  *(_QWORD *)(v8 + 232) = *(_QWORD *)(v10 + 64);
  *(_QWORD *)(v8 + 240) = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23A8E5DA0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  char v21;
  unsigned int v22;
  uint64_t v23;
  uint64_t v24;

  v1 = *(_QWORD *)(v0 + 240);
  v2 = *(_QWORD *)(v0 + 216);
  v3 = *(_QWORD *)(v0 + 224);
  v21 = *(_BYTE *)(v0 + 308);
  v20 = *(_QWORD *)(v0 + 208);
  v19 = *(_BYTE *)(v0 + 307);
  v23 = *(_QWORD *)(v0 + 176);
  v24 = *(_QWORD *)(v0 + 184);
  v22 = *(unsigned __int8 *)(v0 + 306);
  v5 = *(_QWORD *)(v0 + 128);
  v4 = *(_QWORD *)(v0 + 136);
  type metadata accessor for HomeEnergyXPCConnection();
  swift_allocObject();
  *(_QWORD *)(v0 + 248) = sub_23A8EF888();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v1, v5, v2);
  v6 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v7 = swift_allocObject();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v3 + 32))(v7 + v6, v1, v2);
  v8 = (void *)sub_23A8EFE34((uint64_t)sub_23A8E715C, v7);
  *(_QWORD *)(v0 + 256) = v8;
  swift_release();
  v9 = *(id *)(v4 + 16);
  sub_23A8F0F50();

  v10 = sub_23A8F1130();
  *(_QWORD *)(v0 + 264) = v10;
  swift_bridgeObjectRelease();
  v11 = sub_23A8F1130();
  *(_QWORD *)(v0 + 272) = v11;
  v12 = sub_23A8F1130();
  *(_QWORD *)(v0 + 280) = v12;
  v13 = sub_23A8F1130();
  *(_QWORD *)(v0 + 288) = v13;
  *(_QWORD *)(v0 + 56) = v0 + 304;
  *(_QWORD *)(v0 + 16) = v0;
  *(_QWORD *)(v0 + 24) = sub_23A8E5FE0;
  v14 = swift_continuation_init();
  *(_QWORD *)(v0 + 80) = MEMORY[0x24BDAC760];
  v15 = (_QWORD *)(v0 + 80);
  v15[1] = 0x40000000;
  v15[2] = sub_23A8E5794;
  v15[3] = &block_descriptor_14;
  v15[4] = v14;
  LOBYTE(v18) = v21;
  LOBYTE(v17) = v19;
  objc_msgSend(v8, sel_generateMockAMIDataWithSiteID_startDate_endDate_forceAllReadingsToConstant_recordInterval_batchSize_rateSchedule_netMetering_direction_randomization_completionHandler_, v10, v11, v12, v22, v23, v24, v13, v17, v20, v18, v15);
  return swift_continuation_await();
}

uint64_t sub_23A8E5FE0()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)v0 + 296) = *(_QWORD *)(*(_QWORD *)v0 + 48);
  return swift_task_switch();
}

uint64_t sub_23A8E6040()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  char v6;

  v2 = *(void **)(v0 + 280);
  v1 = *(void **)(v0 + 288);
  v4 = *(void **)(v0 + 264);
  v3 = *(void **)(v0 + 272);
  v5 = *(_QWORD *)(v0 + 248);
  v6 = *(_BYTE *)(v0 + 304);
  swift_unknownObjectRelease();

  objc_msgSend(*(id *)(v5 + 16), sel_invalidate);
  *(_BYTE *)(v0 + 305) = v6;
  sub_23A8F11F0();
  swift_release();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23A8E60E8()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = *(void **)(v0 + 288);
  v1 = *(_QWORD *)(v0 + 296);
  v4 = *(void **)(v0 + 272);
  v3 = *(void **)(v0 + 280);
  v5 = *(void **)(v0 + 264);
  swift_willThrow();
  swift_release();
  swift_unknownObjectRelease();

  *(_QWORD *)(v0 + 120) = v1;
  sub_23A8F11E4();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t EnergySite.generateMultipleMeterMockAMIData(startDate:endDate:recordInterval:rateSchedule:multipleMeters:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  _QWORD *v9;

  v9[9] = a8;
  v9[10] = v8;
  v9[7] = a6;
  v9[8] = a7;
  v9[5] = a4;
  v9[6] = a5;
  v9[3] = a2;
  v9[4] = a3;
  v9[2] = a1;
  return swift_task_switch();
}

uint64_t sub_23A8E61B4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  __int128 v9;
  __int128 v10;

  if ((sub_23A8F0DD0() & 1) == 0)
    return (*(uint64_t (**)(_QWORD))(v0 + 8))(0);
  v2 = *(_QWORD *)(v0 + 72);
  v1 = *(_QWORD *)(v0 + 80);
  v3 = *(_QWORD *)(v0 + 48);
  v9 = *(_OWORD *)(v0 + 32);
  v10 = *(_OWORD *)(v0 + 56);
  v5 = *(_QWORD *)(v0 + 16);
  v4 = *(_QWORD *)(v0 + 24);
  v6 = swift_task_alloc();
  *(_QWORD *)(v0 + 88) = v6;
  *(_QWORD *)(v6 + 16) = v1;
  *(_QWORD *)(v6 + 24) = v5;
  *(_QWORD *)(v6 + 32) = v4;
  *(_OWORD *)(v6 + 40) = v9;
  *(_QWORD *)(v6 + 56) = v3;
  *(_OWORD *)(v6 + 64) = v10;
  *(_QWORD *)(v6 + 80) = v2;
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 96) = v7;
  *v7 = v0;
  v7[1] = sub_23A8E62C8;
  return sub_23A8F1400();
}

uint64_t sub_23A8E62C8()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 104) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23A8E6334()
{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(unsigned __int8 *)(v0 + 112));
}

uint64_t sub_23A8E6340()
{
  uint64_t v0;

  swift_task_dealloc();
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(0);
}

uint64_t sub_23A8E6380(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
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
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD *v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD *v33;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;

  v45 = a7;
  v46 = a8;
  v39 = a3;
  v40 = a4;
  v38 = a2;
  v43 = a10;
  v44 = a6;
  v41 = a9;
  v42 = a5;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569C8818);
  v12 = *(_QWORD *)(v11 - 8);
  v36 = v11;
  v13 = *(_QWORD *)(v12 + 64);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v35 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542D8AC0);
  MEMORY[0x24BDAC7A8](v15);
  v17 = (char *)&v35 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v37 = v17;
  v18 = sub_23A8F1208();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56))(v17, 1, 1, v18);
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v14, a1, v11);
  v19 = (*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
  v20 = (v13 + v19 + 7) & 0xFFFFFFFFFFFFFFF8;
  v21 = (v20 + 15) & 0xFFFFFFFFFFFFFFF8;
  v22 = (v21 + 23) & 0xFFFFFFFFFFFFFFF8;
  v23 = (v22 + 23) & 0xFFFFFFFFFFFFFFF8;
  v24 = (v23 + 15) & 0xFFFFFFFFFFFFFFF8;
  v25 = swift_allocObject();
  *(_QWORD *)(v25 + 16) = 0;
  *(_QWORD *)(v25 + 24) = 0;
  (*(void (**)(unint64_t, char *, uint64_t))(v12 + 32))(v25 + v19, v14, v36);
  v26 = v39;
  *(_QWORD *)(v25 + v20) = v38;
  v27 = (_QWORD *)(v25 + v21);
  v29 = v40;
  v28 = v41;
  *v27 = v26;
  v27[1] = v29;
  v30 = (_QWORD *)(v25 + v22);
  v31 = v44;
  *v30 = v42;
  v30[1] = v31;
  v32 = v46;
  *(_QWORD *)(v25 + v23) = v45;
  v33 = (_QWORD *)(v25 + v24);
  *v33 = v32;
  v33[1] = v28;
  *(_QWORD *)(v25 + ((v24 + 23) & 0xFFFFFFFFFFFFFFF8)) = v43;
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_23A8B1124((uint64_t)v37, (uint64_t)&unk_2569C8E00, v25);
  return swift_release();
}

uint64_t sub_23A8E6574(uint64_t a1)
{
  uint64_t *v1;

  return sub_23A8E6380(a1, v1[2], v1[3], v1[4], v1[5], v1[6], v1[7], v1[8], v1[9], v1[10]);
}

uint64_t sub_23A8E65A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  uint64_t v14;

  *(_QWORD *)(v8 + 200) = v14;
  *(_OWORD *)(v8 + 184) = v13;
  *(_OWORD *)(v8 + 168) = v12;
  *(_QWORD *)(v8 + 152) = a7;
  *(_QWORD *)(v8 + 160) = a8;
  *(_QWORD *)(v8 + 136) = a5;
  *(_QWORD *)(v8 + 144) = a6;
  *(_QWORD *)(v8 + 128) = a4;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569C8818);
  *(_QWORD *)(v8 + 208) = v9;
  v10 = *(_QWORD *)(v9 - 8);
  *(_QWORD *)(v8 + 216) = v10;
  *(_QWORD *)(v8 + 224) = *(_QWORD *)(v10 + 64);
  *(_QWORD *)(v8 + 232) = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23A8E662C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v17;
  uint64_t v18;

  v1 = v0[29];
  v3 = v0[26];
  v2 = v0[27];
  v17 = v0[22];
  v18 = v0[25];
  v4 = v0[16];
  v5 = v0[17];
  type metadata accessor for HomeEnergyXPCConnection();
  swift_allocObject();
  v0[30] = sub_23A8EF888();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v4, v3);
  v6 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v7 = swift_allocObject();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v2 + 32))(v7 + v6, v1, v3);
  v8 = (void *)sub_23A8EFE34((uint64_t)sub_23A8E6E98, v7);
  v0[31] = v8;
  swift_release();
  v9 = *(id *)(v5 + 16);
  sub_23A8F0F50();

  v10 = sub_23A8F1130();
  v0[32] = v10;
  swift_bridgeObjectRelease();
  v11 = sub_23A8F1130();
  v0[33] = v11;
  v12 = sub_23A8F1130();
  v0[34] = v12;
  v13 = sub_23A8F1130();
  v0[35] = v13;
  v0[7] = v0 + 37;
  v0[2] = v0;
  v0[3] = sub_23A8E682C;
  v14 = swift_continuation_init();
  v0[10] = MEMORY[0x24BDAC760];
  v15 = v0 + 10;
  v15[1] = 0x40000000;
  v15[2] = sub_23A8E5794;
  v15[3] = &block_descriptor_3;
  v15[4] = v14;
  objc_msgSend(v8, sel_generateMultipleMeterMockAMIDataWithSiteID_startDate_endDate_recordInterval_rateSchedule_multipleMeters_completionHandler_, v10, v11, v12, v17, v13, v18, v15);
  return swift_continuation_await();
}

uint64_t sub_23A8E682C()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)v0 + 288) = *(_QWORD *)(*(_QWORD *)v0 + 48);
  return swift_task_switch();
}

uint64_t sub_23A8E688C()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  char v6;

  v2 = *(void **)(v0 + 272);
  v1 = *(void **)(v0 + 280);
  v4 = *(void **)(v0 + 256);
  v3 = *(void **)(v0 + 264);
  v5 = *(_QWORD *)(v0 + 240);
  v6 = *(_BYTE *)(v0 + 296);
  swift_unknownObjectRelease();

  objc_msgSend(*(id *)(v5 + 16), sel_invalidate);
  *(_BYTE *)(v0 + 297) = v6;
  sub_23A8F11F0();
  swift_release();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23A8E6934()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = *(void **)(v0 + 280);
  v1 = *(_QWORD *)(v0 + 288);
  v4 = *(void **)(v0 + 264);
  v3 = *(void **)(v0 + 272);
  v5 = *(void **)(v0 + 256);
  swift_willThrow();
  swift_release();
  swift_unknownObjectRelease();

  *(_QWORD *)(v0 + 120) = v1;
  sub_23A8F11E4();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23A8E69D8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569C8818);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_unknownObjectRelease();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_23A8E6AC0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v3 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2569C8818) - 8);
  v4 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v5 = (*(_QWORD *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  v6 = (v5 + 15) & 0xFFFFFFFFFFFFFFF8;
  v15 = *(_QWORD *)(v1 + 16);
  v13 = v1 + v4;
  v14 = *(_QWORD *)(v1 + 24);
  v7 = *(_QWORD *)(v1 + v5);
  v8 = *(_QWORD *)(v1 + v6);
  v9 = *(_QWORD *)(v1 + v6 + 8);
  v10 = *(_QWORD *)(v1 + ((v6 + 23) & 0xFFFFFFFFFFFFFFF8));
  v11 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v11;
  *v11 = v2;
  v11[1] = sub_23A8C8720;
  return sub_23A8E65A8(a1, v15, v14, v13, v7, v8, v9, v10);
}

uint64_t sub_23A8E6BE0(void *a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  id v13;
  id v14;
  NSObject *v15;
  os_log_type_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  unint64_t v24;
  id v25;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  v8 = sub_23A8F10A0();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2542D8828 != -1)
    swift_once();
  v12 = __swift_project_value_buffer(v8, (uint64_t)qword_2542D8DE0);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, v12, v8);
  v13 = a1;
  v14 = a1;
  v15 = sub_23A8F1088();
  v16 = sub_23A8F1274();
  if (os_log_type_enabled(v15, v16))
  {
    v17 = swift_slowAlloc();
    v28 = v9;
    v18 = a3;
    v19 = a4;
    v20 = v17;
    v21 = swift_slowAlloc();
    v31 = v21;
    *(_DWORD *)v20 = 136315394;
    v29 = a2;
    v30 = sub_23A8BF840(v18, v19, &v31);
    sub_23A8F12A4();
    *(_WORD *)(v20 + 12) = 2080;
    v30 = (uint64_t)a1;
    v22 = a1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2542D8AE0);
    v23 = sub_23A8F1148();
    v30 = sub_23A8BF840(v23, v24, &v31);
    sub_23A8F12A4();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_23A8AD000, v15, v16, "%s error: %s", (uint8_t *)v20, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x23B85B51C](v21, -1, -1);
    MEMORY[0x23B85B51C](v20, -1, -1);

    (*(void (**)(char *, uint64_t))(v28 + 8))(v11, v8);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  }
  v31 = (uint64_t)a1;
  v25 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569C8818);
  return sub_23A8F11E4();
}

uint64_t sub_23A8E6E98(void *a1)
{
  return sub_23A8E7178(a1, 0xD00000000000005FLL, 0x800000023A8F4490);
}

uint64_t sub_23A8E6EB4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569C8818);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_unknownObjectRelease();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_23A8E6FA4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t *v8;
  _QWORD *v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v3 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2569C8818) - 8);
  v4 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v5 = (*(_QWORD *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  v6 = (v5 + 15) & 0xFFFFFFFFFFFFFFF8;
  v7 = (v6 + 23) & 0xFFFFFFFFFFFFFFF8;
  v17 = *(_QWORD *)(v1 + v5);
  v12 = *(_QWORD *)(v1 + 16);
  v13 = *(_QWORD *)(v1 + 24);
  v8 = (uint64_t *)(v1 + v6);
  v15 = *v8;
  v16 = v8[1];
  v11 = v1 + v4;
  v14 = *(_QWORD *)(v1 + v7);
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v9;
  *v9 = v2;
  v9[1] = sub_23A8C4ED0;
  return sub_23A8E5CFC(a1, v12, v13, v11, v17, v15, v16, v14);
}

uint64_t objectdestroy_5Tm()
{
  uint64_t v0;
  uint64_t v1;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569C8818);
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)), v1);
  return swift_deallocObject();
}

uint64_t sub_23A8E715C(void *a1)
{
  return sub_23A8E7178(a1, 0xD00000000000008CLL, 0x800000023A8F4400);
}

uint64_t sub_23A8E7178(void *a1, uint64_t a2, unint64_t a3)
{
  uint64_t v3;
  uint64_t v7;

  v7 = *(unsigned __int8 *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2569C8818) - 8) + 80);
  return sub_23A8E6BE0(a1, v3 + ((v7 + 16) & ~v7), a2, a3);
}

uint64_t sub_23A8E71D4(char a1, char a2)
{
  char v3;

  if (*(_QWORD *)&aDay_1[8 * a1] == *(_QWORD *)&aDay_1[8 * a2] && qword_23A8F2200[a1] == qword_23A8F2200[a2])
    v3 = 1;
  else
    v3 = sub_23A8F13F4();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

uint64_t EnergySite.historicalEnergyUsage(interval:start:timezone:utilityID:subscriptionID:bulk:)(uint64_t a1, _BYTE *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;
  char v14;

  *(_BYTE *)(v9 + 297) = v14;
  *(_QWORD *)(v9 + 160) = a8;
  *(_QWORD *)(v9 + 168) = v8;
  *(_QWORD *)(v9 + 144) = a6;
  *(_QWORD *)(v9 + 152) = a7;
  *(_QWORD *)(v9 + 128) = a4;
  *(_QWORD *)(v9 + 136) = a5;
  *(_QWORD *)(v9 + 112) = a1;
  *(_QWORD *)(v9 + 120) = a3;
  v11 = sub_23A8F10A0();
  *(_QWORD *)(v9 + 176) = v11;
  *(_QWORD *)(v9 + 184) = *(_QWORD *)(v11 - 8);
  *(_QWORD *)(v9 + 192) = swift_task_alloc();
  *(_QWORD *)(v9 + 200) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569C8E20);
  *(_QWORD *)(v9 + 208) = swift_task_alloc();
  *(_QWORD *)(v9 + 216) = swift_task_alloc();
  v12 = sub_23A8F0CA4();
  *(_QWORD *)(v9 + 224) = v12;
  *(_QWORD *)(v9 + 232) = *(_QWORD *)(v12 - 8);
  *(_QWORD *)(v9 + 240) = swift_task_alloc();
  *(_QWORD *)(v9 + 248) = swift_task_alloc();
  *(_QWORD *)(v9 + 256) = swift_task_alloc();
  *(_QWORD *)(v9 + 264) = swift_task_alloc();
  *(_QWORD *)(v9 + 272) = swift_task_alloc();
  *(_BYTE *)(v9 + 298) = *a2;
  return swift_task_switch();
}

uint64_t sub_23A8E737C()
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
  NSObject *v12;
  os_log_type_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;

  v1 = *(_QWORD *)(v0 + 216);
  v2 = *(_QWORD *)(v0 + 120);
  LOBYTE(v41) = *(_BYTE *)(v0 + 298);
  sub_23A8E7EC0((unsigned __int8 *)&v41, v2, v1);
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569C8E28);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 48))(v1, 1, v3) == 1)
  {
    sub_23A8C64C8(*(_QWORD *)(v0 + 216), &qword_2569C8E20);
    if (qword_2569C8350 != -1)
      swift_once();
    v5 = *(_QWORD *)(v0 + 232);
    v4 = *(_QWORD *)(v0 + 240);
    v6 = *(_QWORD *)(v0 + 224);
    v7 = *(_QWORD *)(v0 + 184);
    v8 = *(_QWORD *)(v0 + 192);
    v9 = *(_QWORD *)(v0 + 176);
    v10 = *(_QWORD *)(v0 + 120);
    v11 = __swift_project_value_buffer(v9, (uint64_t)qword_2569C9B00);
    swift_beginAccess();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(v8, v11, v9);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v4, v10, v6);
    v12 = sub_23A8F1088();
    v13 = sub_23A8F1274();
    if (os_log_type_enabled(v12, v13))
    {
      v14 = *(char *)(v0 + 298);
      v15 = swift_slowAlloc();
      v16 = swift_slowAlloc();
      v41 = v16;
      *(_DWORD *)v15 = 136315650;
      *(_QWORD *)(v0 + 88) = sub_23A8BF840(0xD00000000000004DLL, 0x800000023A8F44F0, &v41);
      sub_23A8F12A4();
      v17 = *(_QWORD *)&aDay_1[8 * v14];
      *(_WORD *)(v15 + 12) = 2080;
      v18 = *(_QWORD *)(v0 + 240);
      v36 = *(_QWORD *)(v0 + 232);
      v19 = *(_QWORD *)(v0 + 224);
      v37 = *(_QWORD *)(v0 + 184);
      v39 = *(_QWORD *)(v0 + 176);
      v40 = *(_QWORD *)(v0 + 192);
      *(_QWORD *)(v0 + 64) = sub_23A8BF840(v17, qword_23A8F2200[v14], &v41);
      sub_23A8F12A4();
      swift_bridgeObjectRelease();
      *(_WORD *)(v15 + 22) = 2080;
      sub_23A8C6A38(&qword_2569C8E30, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE988]);
      v20 = sub_23A8F13E8();
      *(_QWORD *)(v0 + 72) = sub_23A8BF840(v20, v21, &v41);
      sub_23A8F12A4();
      swift_bridgeObjectRelease();
      (*(void (**)(uint64_t, uint64_t))(v36 + 8))(v18, v19);
      _os_log_impl(&dword_23A8AD000, v12, v13, "%s error calculating intervals parameters. interval:%s, start:%s", (uint8_t *)v15, 0x20u);
      swift_arrayDestroy();
      MEMORY[0x23B85B51C](v16, -1, -1);
      MEMORY[0x23B85B51C](v15, -1, -1);

      (*(void (**)(uint64_t, uint64_t))(v37 + 8))(v40, v39);
    }
    else
    {
      v30 = *(_QWORD *)(v0 + 184);
      v29 = *(_QWORD *)(v0 + 192);
      v31 = *(_QWORD *)(v0 + 176);
      (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 232) + 8))(*(_QWORD *)(v0 + 240), *(_QWORD *)(v0 + 224));

      (*(void (**)(uint64_t, uint64_t))(v30 + 8))(v29, v31);
    }
    v32 = *(_QWORD *)(v0 + 112);
    v33 = type metadata accessor for EnergySite.HistoricalEnergyUsage(0);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v33 - 8) + 56))(v32, 1, 1, v33);
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
  else
  {
    v22 = *(_QWORD *)(v0 + 264);
    v23 = *(_QWORD *)(v0 + 272);
    v25 = *(_QWORD *)(v0 + 224);
    v24 = *(_QWORD *)(v0 + 232);
    v26 = *(_QWORD *)(v0 + 216);
    v27 = *(unsigned __int8 *)(v0 + 297);
    v28 = v26 + *(int *)(v3 + 48);
    v38 = sub_23A8F0D28();
    (*(void (**)(uint64_t))(*(_QWORD *)(v38 - 8) + 8))(v26);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v24 + 32))(v23, v28, v25);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v24 + 16))(v22, v23, v25);
    if (v27 == 1)
      __asm { BR              X9 }
    *(_BYTE *)(v0 + 296) = *(_BYTE *)(v0 + 298);
    v35 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 280) = v35;
    *v35 = v0;
    v35[1] = sub_23A8E7C70;
    return EnergySite.historicalEnergyUsageInterval(interval:start:end:timezone:utilityID:subscriptionID:)(*(_QWORD *)(v0 + 112), (_BYTE *)(v0 + 296), *(_QWORD *)(v0 + 120), *(_QWORD *)(v0 + 264), *(_QWORD *)(v0 + 128), *(_QWORD *)(v0 + 136), *(_QWORD *)(v0 + 144), *(_QWORD *)(v0 + 152));
  }
}

uint64_t sub_23A8E7C70()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 288) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23A8E7CD4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void (*v3)(uint64_t, uint64_t);
  uint64_t v4;
  uint64_t v5;

  v1 = *(_QWORD *)(v0 + 272);
  v2 = *(_QWORD *)(v0 + 224);
  v3 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v0 + 232) + 8);
  v3(*(_QWORD *)(v0 + 264), v2);
  v3(v1, v2);
  v4 = *(_QWORD *)(v0 + 112);
  v5 = type metadata accessor for EnergySite.HistoricalEnergyUsage(0);
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56))(v4, 0, 1, v5);
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

uint64_t sub_23A8E7DC4()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  void (*v4)(uint64_t, uint64_t);
  uint64_t v5;
  uint64_t v6;

  v1 = *(void **)(v0 + 288);
  v2 = *(_QWORD *)(v0 + 272);
  v3 = *(_QWORD *)(v0 + 224);
  v4 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v0 + 232) + 8);
  v4(*(_QWORD *)(v0 + 264), v3);
  v4(v2, v3);

  v5 = *(_QWORD *)(v0 + 112);
  v6 = type metadata accessor for EnergySite.HistoricalEnergyUsage(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
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

uint64_t sub_23A8E7EC0@<X0>(unsigned __int8 *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
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
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  NSObject *v44;
  os_log_type_t v45;
  _BOOL4 v46;
  char *v47;
  uint8_t *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  char *v52;
  _QWORD v54[9];
  uint64_t v55;
  char *v56;
  char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  char *v64;
  uint64_t v65;
  uint64_t v66;
  char *v67;
  uint64_t v68;
  uint64_t v69;

  v54[6] = a2;
  v60 = a3;
  v4 = sub_23A8F10A0();
  v58 = *(_QWORD *)(v4 - 8);
  v59 = v4;
  MEMORY[0x24BDAC7A8](v4);
  v67 = (char *)v54 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542D8CF8);
  v7 = MEMORY[0x24BDAC7A8](v6);
  v54[3] = (char *)v54 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v54[2] = (char *)v54 - v10;
  MEMORY[0x24BDAC7A8](v9);
  v54[1] = (char *)v54 - v11;
  v12 = __swift_instantiateConcreteTypeFromMangledName(qword_2569C84A8);
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)v54 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_23A8F0D58();
  v16 = *(_QWORD *)(v15 - 8);
  v17 = MEMORY[0x24BDAC7A8](v15);
  v19 = (char *)v54 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v17);
  v56 = (char *)v54 - v20;
  v21 = sub_23A8F0CEC();
  v22 = *(_QWORD *)(v21 - 8);
  MEMORY[0x24BDAC7A8](v21);
  v24 = (char *)v54 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = sub_23A8F0D34();
  v61 = *(_QWORD *)(v25 - 8);
  v62 = v25;
  MEMORY[0x24BDAC7A8](v25);
  v27 = (char *)v54 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  v65 = sub_23A8F0CA4();
  v63 = *(_QWORD *)(v65 - 8);
  v28 = MEMORY[0x24BDAC7A8](v65);
  v54[4] = (char *)v54 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v28);
  v31 = (char *)v54 - v30;
  v32 = sub_23A8F0D28();
  v54[7] = *(_QWORD *)(v32 - 8);
  v54[8] = v32;
  v33 = MEMORY[0x24BDAC7A8](v32);
  v54[5] = (char *)v54 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v33);
  v57 = (char *)v54 - v35;
  v55 = *a1;
  v64 = v31;
  v36 = v27;
  sub_23A8F0C98();
  (*(void (**)(char *, _QWORD, uint64_t))(v22 + 104))(v24, *MEMORY[0x24BDCEF70], v21);
  sub_23A8F0CF8();
  (*(void (**)(char *, uint64_t))(v22 + 8))(v24, v21);
  v37 = *(id *)(v66 + 16);
  sub_23A8F0F8C();
  v39 = v38;

  if (v39)
  {
    sub_23A8F0D40();
    swift_bridgeObjectRelease();
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v14, 1, v15) != 1)
    {
      v52 = v56;
      (*(void (**)(char *, char *, uint64_t))(v16 + 32))(v56, v14, v15);
      (*(void (**)(char *, char *, uint64_t))(v16 + 16))(v19, v52, v15);
      sub_23A8F0D1C();
      __asm { BR              X9 }
    }
    sub_23A8C64C8((uint64_t)v14, qword_2569C84A8);
  }
  if (qword_2569C8350 != -1)
    swift_once();
  v40 = v59;
  v41 = __swift_project_value_buffer(v59, (uint64_t)qword_2569C9B00);
  swift_beginAccess();
  v42 = v58;
  v43 = v67;
  (*(void (**)(char *, uint64_t, uint64_t))(v58 + 16))(v67, v41, v40);
  v44 = sub_23A8F1088();
  v45 = sub_23A8F1274();
  v46 = os_log_type_enabled(v44, v45);
  v47 = v64;
  if (v46)
  {
    v48 = (uint8_t *)swift_slowAlloc();
    v49 = swift_slowAlloc();
    v69 = v49;
    *(_DWORD *)v48 = 136315138;
    v68 = sub_23A8BF840(0xD00000000000002ALL, 0x800000023A8F4640, &v69);
    sub_23A8F12A4();
    _os_log_impl(&dword_23A8AD000, v44, v45, "%s valid timezone set for EnergySite required", v48, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B85B51C](v49, -1, -1);
    MEMORY[0x23B85B51C](v48, -1, -1);

    (*(void (**)(char *, uint64_t))(v42 + 8))(v67, v40);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v42 + 8))(v43, v40);
  }
  (*(void (**)(char *, uint64_t))(v61 + 8))(v36, v62);
  (*(void (**)(char *, uint64_t))(v63 + 8))(v47, v65);
  v50 = v60;
  v51 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569C8E28);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v51 - 8) + 56))(v50, 1, 1, v51);
}

uint64_t EnergySite.historicalEnergyUsageInterval(interval:start:end:timezone:utilityID:subscriptionID:)(uint64_t a1, _BYTE *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;

  *(_QWORD *)(v9 + 136) = v15;
  *(_QWORD *)(v9 + 144) = v8;
  *(_QWORD *)(v9 + 120) = a7;
  *(_QWORD *)(v9 + 128) = a8;
  *(_QWORD *)(v9 + 104) = a5;
  *(_QWORD *)(v9 + 112) = a6;
  *(_QWORD *)(v9 + 88) = a3;
  *(_QWORD *)(v9 + 96) = a4;
  *(_QWORD *)(v9 + 80) = a1;
  v11 = sub_23A8F10A0();
  *(_QWORD *)(v9 + 152) = v11;
  *(_QWORD *)(v9 + 160) = *(_QWORD *)(v11 - 8);
  *(_QWORD *)(v9 + 168) = swift_task_alloc();
  *(_QWORD *)(v9 + 176) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569C8E40);
  *(_QWORD *)(v9 + 184) = swift_task_alloc();
  *(_QWORD *)(v9 + 192) = swift_task_alloc();
  *(_QWORD *)(v9 + 200) = swift_task_alloc();
  *(_QWORD *)(v9 + 208) = swift_task_alloc();
  *(_QWORD *)(v9 + 216) = swift_task_alloc();
  *(_QWORD *)(v9 + 224) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2542D8CF8);
  *(_QWORD *)(v9 + 232) = swift_task_alloc();
  *(_QWORD *)(v9 + 240) = swift_task_alloc();
  v12 = sub_23A8F0CA4();
  *(_QWORD *)(v9 + 248) = v12;
  *(_QWORD *)(v9 + 256) = *(_QWORD *)(v12 - 8);
  *(_QWORD *)(v9 + 264) = swift_task_alloc();
  *(_QWORD *)(v9 + 272) = swift_task_alloc();
  *(_QWORD *)(v9 + 280) = swift_task_alloc();
  *(_QWORD *)(v9 + 288) = swift_task_alloc();
  *(_QWORD *)(v9 + 296) = *(_QWORD *)(type metadata accessor for EnergySite.EnergyUsage(0) - 8);
  *(_QWORD *)(v9 + 304) = swift_task_alloc();
  *(_QWORD *)(v9 + 312) = swift_task_alloc();
  *(_QWORD *)(v9 + 320) = swift_task_alloc();
  *(_QWORD *)(v9 + 328) = swift_task_alloc();
  *(_QWORD *)(v9 + 336) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569C8E48);
  *(_QWORD *)(v9 + 344) = swift_task_alloc();
  *(_QWORD *)(v9 + 352) = swift_task_alloc();
  v13 = sub_23A8F0E3C();
  *(_QWORD *)(v9 + 360) = v13;
  *(_QWORD *)(v9 + 368) = *(_QWORD *)(v13 - 8);
  *(_QWORD *)(v9 + 376) = swift_task_alloc();
  *(_QWORD *)(v9 + 384) = swift_task_alloc();
  *(_QWORD *)(v9 + 392) = swift_task_alloc();
  *(_QWORD *)(v9 + 400) = swift_task_alloc();
  *(_QWORD *)(v9 + 408) = swift_task_alloc();
  *(_QWORD *)(v9 + 416) = __swift_instantiateConcreteTypeFromMangledName(&qword_2569C8E50);
  *(_QWORD *)(v9 + 424) = swift_task_alloc();
  *(_QWORD *)(v9 + 432) = swift_task_alloc();
  *(_QWORD *)(v9 + 440) = swift_task_alloc();
  *(_QWORD *)(v9 + 448) = swift_task_alloc();
  *(_QWORD *)(v9 + 456) = swift_task_alloc();
  *(_QWORD *)(v9 + 464) = swift_task_alloc();
  *(_QWORD *)(v9 + 472) = swift_task_alloc();
  *(_QWORD *)(v9 + 480) = swift_task_alloc();
  *(_QWORD *)(v9 + 488) = swift_task_alloc();
  *(_QWORD *)(v9 + 496) = swift_task_alloc();
  *(_QWORD *)(v9 + 504) = swift_task_alloc();
  *(_BYTE *)(v9 + 576) = *a2;
  return swift_task_switch();
}

uint64_t sub_23A8E8AC0()
{
  uint64_t v0;
  char v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  __int128 v5;
  _QWORD *v6;
  __int128 v8;
  __int128 v9;

  v1 = *(_BYTE *)(v0 + 576);
  v2 = *(_QWORD *)(v0 + 144);
  v8 = *(_OWORD *)(v0 + 112);
  v9 = *(_OWORD *)(v0 + 128);
  v3 = *(_QWORD *)(v0 + 104);
  v4 = swift_task_alloc();
  *(_QWORD *)(v0 + 512) = v4;
  v5 = *(_OWORD *)(v0 + 88);
  *(_BYTE *)(v4 + 16) = v1;
  *(_OWORD *)(v4 + 24) = v5;
  *(_OWORD *)(v4 + 40) = v9;
  *(_OWORD *)(v4 + 56) = v8;
  *(_QWORD *)(v4 + 72) = v3;
  *(_QWORD *)(v4 + 80) = v2;
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 520) = v6;
  *(_QWORD *)(v0 + 528) = __swift_instantiateConcreteTypeFromMangledName(&qword_2569C8E58);
  *v6 = v0;
  v6[1] = sub_23A8E8BAC;
  return sub_23A8F1400();
}

uint64_t sub_23A8E8BAC()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 536) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_task_dealloc();
  return swift_task_switch();
}

void sub_23A8E8C18()
{
  uint64_t v0;
  int64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  int64_t v14;
  unint64_t v15;
  int64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, unint64_t, uint64_t);
  uint64_t *v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t *v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t *v39;
  NSObject *v40;
  os_log_type_t v41;
  _BOOL4 v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  unint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void (*v55)(uint64_t, uint64_t, uint64_t);
  int isUniquelyReferenced_nonNull_native;
  char v57;
  unint64_t v58;
  uint64_t v59;
  _BOOL8 v60;
  uint64_t v61;
  char v62;
  uint64_t v63;
  unint64_t v64;
  char v65;
  void (*v66)(unint64_t, uint64_t, uint64_t);
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  BOOL v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  char v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  _QWORD *v82;
  uint64_t v83;
  uint64_t v84;
  int64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t i;
  void (*v92)(uint64_t, uint64_t, uint64_t);
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  int64_t v97;
  void (*v98)(uint64_t, unint64_t, uint64_t);
  uint64_t v99;
  __int128 v100;
  void (*v101)(uint64_t, uint64_t);
  __int128 v102;
  void *v103;
  __int128 v104;
  uint64_t v105[3];

  v1 = 0;
  v2 = *(_QWORD *)(v0 + 64);
  v3 = *(_QWORD *)(v2 + 64);
  v84 = v2 + 64;
  v4 = -1;
  v90 = *(_QWORD *)(v0 + 64);
  v5 = -1 << *(_BYTE *)(v90 + 32);
  v95 = *(_QWORD *)(v0 + 416);
  v83 = *(_QWORD *)(v0 + 368);
  if (-v5 < 64)
    v4 = ~(-1 << -(char)v5);
  v6 = v4 & v3;
  v7 = *(_QWORD *)(v0 + 256);
  v85 = (unint64_t)(63 - v5) >> 6;
  v8 = (_QWORD *)MEMORY[0x24BEE4B00];
  v93 = *(_QWORD *)(v0 + 160);
  v9 = *(void **)(v0 + 536);
  v94 = v7;
LABEL_4:
  for (i = (uint64_t)v8; ; v8 = (_QWORD *)i)
  {
    *(_QWORD *)(v0 + 544) = v8;
    v103 = v9;
    if (v6)
    {
      v96 = (v6 - 1) & v6;
      v97 = v1;
      v13 = __clz(__rbit64(v6)) | (v1 << 6);
      goto LABEL_23;
    }
    v14 = v1 + 1;
    if (__OFADD__(v1, 1))
    {
      __break(1u);
      goto LABEL_42;
    }
    if (v14 >= v85)
      goto LABEL_39;
    v15 = *(_QWORD *)(v84 + 8 * v14);
    v16 = v1 + 1;
    if (!v15)
    {
      v16 = v1 + 2;
      if (v1 + 2 >= v85)
        goto LABEL_39;
      v15 = *(_QWORD *)(v84 + 8 * v16);
      if (!v15)
      {
        v16 = v1 + 3;
        if (v1 + 3 >= v85)
          goto LABEL_39;
        v15 = *(_QWORD *)(v84 + 8 * v16);
        if (!v15)
          break;
      }
    }
LABEL_22:
    v96 = (v15 - 1) & v15;
    v97 = v16;
    v13 = __clz(__rbit64(v15)) + (v16 << 6);
LABEL_23:
    v19 = *(_QWORD *)(v0 + 496);
    v18 = *(_QWORD *)(v0 + 504);
    v20 = *(_QWORD *)(v0 + 488);
    v21 = *(_QWORD *)(v0 + 248);
    v88 = *(_QWORD *)(v7 + 72);
    v22 = *(void (**)(uint64_t, unint64_t, uint64_t))(v7 + 16);
    v22(v18, *(_QWORD *)(v90 + 48) + v88 * v13, v21);
    v23 = (uint64_t *)(*(_QWORD *)(v90 + 56) + 16 * v13);
    v24 = (uint64_t *)(v18 + *(int *)(v95 + 48));
    v25 = v7;
    v26 = *v23;
    v27 = v23[1];
    *v24 = *v23;
    v24[1] = v27;
    v28 = (uint64_t *)(v19 + *(int *)(v95 + 48));
    v92 = *(void (**)(uint64_t, uint64_t, uint64_t))(v25 + 32);
    v92(v19, v18, v21);
    *v28 = v26;
    v28[1] = v27;
    v29 = (uint64_t *)(v20 + *(int *)(v95 + 48));
    v98 = v22;
    v22(v20, v19, v21);
    *v29 = v26;
    v29[1] = v27;
    sub_23A8F0BD8();
    swift_allocObject();
    sub_23A8C69F4(v26, v27);
    sub_23A8C69F4(v26, v27);
    sub_23A8F0BCC();
    sub_23A8C6A38(&qword_2569C8E60, (uint64_t (*)(uint64_t))MEMORY[0x24BE2EF88], MEMORY[0x24BE2EFA0]);
    sub_23A8F0BC0();
    v30 = *(_QWORD *)(v0 + 488);
    if (!v103)
    {
      v53 = *(_QWORD *)(v0 + 400);
      v52 = *(_QWORD *)(v0 + 408);
      v54 = *(_QWORD *)(v0 + 360);
      sub_23A8C69B0(v26, v27);
      swift_release();
      v55 = *(void (**)(uint64_t, uint64_t, uint64_t))(v83 + 32);
      v55(v53, v52, v54);
      v8 = (_QWORD *)i;
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v105[0] = i;
      v58 = sub_23A8C000C(v30);
      v59 = *(_QWORD *)(i + 16);
      v60 = (v57 & 1) == 0;
      v61 = v59 + v60;
      if (__OFADD__(v59, v60))
        goto LABEL_43;
      v62 = v57;
      if (*(_QWORD *)(i + 24) < v61)
      {
        v63 = *(_QWORD *)(v0 + 488);
        sub_23A8C0BA0(v61, isUniquelyReferenced_nonNull_native);
        v8 = (_QWORD *)v105[0];
        v64 = sub_23A8C000C(v63);
        v7 = v94;
        if ((v62 & 1) == (v65 & 1))
        {
          v58 = v64;
          v66 = (void (*)(unint64_t, uint64_t, uint64_t))v98;
          goto LABEL_33;
        }
        sub_23A8F1424();
        return;
      }
      v7 = v94;
      v66 = (void (*)(unint64_t, uint64_t, uint64_t))v98;
      if ((isUniquelyReferenced_nonNull_native & 1) != 0)
      {
LABEL_33:
        v67 = v88;
        if ((v62 & 1) != 0)
        {
LABEL_34:
          (*(void (**)(unint64_t, _QWORD, _QWORD))(v83 + 40))(v8[7] + *(_QWORD *)(v83 + 72) * v58, *(_QWORD *)(v0 + 400), *(_QWORD *)(v0 + 360));
          goto LABEL_38;
        }
      }
      else
      {
        sub_23A8C1420();
        v67 = v88;
        v66 = (void (*)(unint64_t, uint64_t, uint64_t))v98;
        v8 = (_QWORD *)v105[0];
        if ((v62 & 1) != 0)
          goto LABEL_34;
      }
      v68 = *(_QWORD *)(v0 + 488);
      v69 = *(_QWORD *)(v0 + 400);
      v70 = *(_QWORD *)(v0 + 360);
      v71 = *(_QWORD *)(v0 + 248);
      v8[(v58 >> 6) + 8] |= 1 << v58;
      v66(v8[6] + v58 * v67, v68, v71);
      v55(v8[7] + *(_QWORD *)(v83 + 72) * v58, v69, v70);
      v72 = v8[2];
      v73 = __OFADD__(v72, 1);
      v74 = v72 + 1;
      if (v73)
        goto LABEL_44;
      v8[2] = v74;
LABEL_38:
      v75 = *(_QWORD *)(v0 + 488);
      v76 = *(_QWORD *)(v0 + 496);
      v77 = *(_QWORD *)(v0 + 248);
      swift_bridgeObjectRelease();
      (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v75, v77);
      sub_23A8C64C8(v76, &qword_2569C8E50);
      v9 = 0;
      v6 = v96;
      v1 = v97;
      goto LABEL_4;
    }
    v31 = *(_QWORD *)(v0 + 248);
    swift_release();
    v101 = *(void (**)(uint64_t, uint64_t))(v94 + 8);
    v101(v30, v31);
    if (qword_2542D8828 != -1)
      swift_once();
    v32 = *(_QWORD *)(v0 + 496);
    v34 = *(_QWORD *)(v0 + 448);
    v33 = *(_QWORD *)(v0 + 456);
    v35 = *(_QWORD *)(v0 + 248);
    v36 = *(_QWORD *)(v0 + 176);
    v37 = *(_QWORD *)(v0 + 152);
    v38 = __swift_project_value_buffer(v37, (uint64_t)qword_2542D8DE0);
    swift_beginAccess();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v93 + 16))(v36, v38, v37);
    v39 = (uint64_t *)(v33 + *(int *)(v95 + 48));
    v98(v33, v32, v35);
    *v39 = v26;
    v39[1] = v27;
    sub_23A8C7E20(v33, v34, &qword_2569C8E50);
    v40 = sub_23A8F1088();
    v41 = sub_23A8F1274();
    v42 = os_log_type_enabled(v40, v41);
    v43 = *(_QWORD *)(v0 + 496);
    v44 = *(_QWORD *)(v0 + 448);
    if (v42)
    {
      v45 = *(_QWORD *)(v0 + 440);
      v46 = *(_QWORD *)(v0 + 288);
      v47 = *(_QWORD *)(v0 + 248);
      v99 = *(_QWORD *)(v0 + 176);
      v89 = *(_QWORD *)(v0 + 152);
      v87 = *(_QWORD *)(v0 + 496);
      v48 = swift_slowAlloc();
      v86 = swift_slowAlloc();
      v105[0] = v86;
      *(_DWORD *)v48 = 136315138;
      v98(v45, v44, v47);
      v92(v46, v45, v47);
      sub_23A8C6A38(&qword_2569C8E30, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE988]);
      v49 = sub_23A8F13E8();
      v51 = v50;
      v101(v46, v47);
      *(_QWORD *)(v48 + 4) = sub_23A8BF840(v49, v51, v105);
      swift_bridgeObjectRelease();
      sub_23A8C64C8(v44, &qword_2569C8E50);
      _os_log_impl(&dword_23A8AD000, v40, v41, "Failed to decode entry for imports on %s", (uint8_t *)v48, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x23B85B51C](v86, -1, -1);
      MEMORY[0x23B85B51C](v48, -1, -1);

      (*(void (**)(uint64_t, uint64_t))(v93 + 8))(v99, v89);
      v12 = v87;
    }
    else
    {
      v10 = *(_QWORD *)(v0 + 176);
      v11 = *(_QWORD *)(v0 + 152);

      sub_23A8C64C8(v44, &qword_2569C8E50);
      (*(void (**)(uint64_t, uint64_t))(v93 + 8))(v10, v11);
      v12 = v43;
    }
    sub_23A8C64C8(v12, &qword_2569C8E50);
    v9 = 0;
    v7 = v94;
    v6 = v96;
    v1 = v97;
  }
  v17 = v1 + 4;
  if (v1 + 4 >= v85)
  {
LABEL_39:
    v78 = *(_BYTE *)(v0 + 576);
    v79 = *(_QWORD *)(v0 + 144);
    v102 = *(_OWORD *)(v0 + 112);
    v104 = *(_OWORD *)(v0 + 128);
    v80 = *(_QWORD *)(v0 + 104);
    v100 = *(_OWORD *)(v0 + 88);
    swift_release();
    v81 = swift_task_alloc();
    *(_QWORD *)(v0 + 552) = v81;
    *(_BYTE *)(v81 + 16) = v78;
    *(_OWORD *)(v81 + 24) = v100;
    *(_OWORD *)(v81 + 40) = v104;
    *(_OWORD *)(v81 + 56) = v102;
    *(_QWORD *)(v81 + 72) = v80;
    *(_QWORD *)(v81 + 80) = v79;
    v82 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 560) = v82;
    *v82 = v0;
    v82[1] = sub_23A8E9450;
    sub_23A8F1400();
    return;
  }
  v15 = *(_QWORD *)(v84 + 8 * v17);
  if (v15)
  {
    v16 = v1 + 4;
    goto LABEL_22;
  }
  while (1)
  {
    v16 = v17 + 1;
    if (__OFADD__(v17, 1))
      break;
    if (v16 >= v85)
      goto LABEL_39;
    v15 = *(_QWORD *)(v84 + 8 * v16);
    ++v17;
    if (v15)
      goto LABEL_22;
  }
LABEL_42:
  __break(1u);
LABEL_43:
  __break(1u);
LABEL_44:
  __break(1u);
}

uint64_t sub_23A8E9450()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 568) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_task_dealloc();
  return swift_task_switch();
}

void sub_23A8E94BC()
{
  _QWORD *v0;
  _QWORD *v1;
  int64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  void *i;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  int64_t v15;
  unint64_t v16;
  int64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t v24;
  void (*v25)(uint64_t, unint64_t, uint64_t);
  uint64_t *v26;
  uint64_t *v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t *v30;
  uint64_t *v31;
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
  uint64_t *v45;
  NSObject *v46;
  os_log_type_t v47;
  _BOOL4 v48;
  uint64_t v49;
  unint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  _QWORD *v55;
  uint64_t v56;
  uint64_t v57;
  unint64_t v58;
  unint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  void (*v65)(uint64_t, uint64_t, uint64_t);
  int isUniquelyReferenced_nonNull_native;
  char v67;
  unint64_t v68;
  uint64_t v69;
  _BOOL8 v70;
  uint64_t v71;
  char v72;
  uint64_t v73;
  _QWORD *v74;
  unint64_t v75;
  char v76;
  _QWORD *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  BOOL v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  _QWORD *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  char *v100;
  uint64_t v101;
  uint64_t v102;
  void (*v103)(uint64_t, _QWORD, uint64_t, uint64_t);
  unint64_t v104;
  char v105;
  uint64_t v106;
  uint64_t v107;
  void (*v108)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v109;
  uint64_t v110;
  unsigned int (*v111)(uint64_t, uint64_t, uint64_t);
  double v112;
  uint64_t v113;
  uint64_t v114;
  double v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  unint64_t v121;
  char v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  double v127;
  uint64_t v128;
  uint64_t v129;
  double v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  _QWORD *v138;
  uint64_t v139;
  uint64_t v140;
  unint64_t v141;
  unint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  _QWORD *v150;
  unint64_t j;
  _QWORD *v152;
  unint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  _QWORD *v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  _QWORD *v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  double v172;
  double v173;
  uint64_t v174;
  unint64_t v175;
  uint64_t v176;
  unint64_t v177;
  unint64_t v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  void (*v188)(uint64_t, uint64_t, uint64_t);
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  int v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  void (*v198)(uint64_t, uint64_t, uint64_t);
  char v199;
  uint64_t v200;
  uint64_t v201;
  _BYTE *v202;
  int *v203;
  _BYTE *v204;
  _BYTE *v205;
  _BYTE *v206;
  _BYTE *v207;
  _QWORD *v208;
  uint64_t v209;
  int64_t v210;
  uint64_t v211;
  uint64_t v212;
  uint64_t v213;
  uint64_t v214;
  void (*v215)(_QWORD, uint64_t, uint64_t, _QWORD);
  uint64_t v216;
  uint64_t v217;
  void (*v218)(uint64_t, uint64_t, uint64_t);
  uint64_t v219;
  void (*v220)(unint64_t, uint64_t, uint64_t);
  uint64_t v221;
  uint64_t v222;
  uint64_t v223;
  int64_t v224;
  uint64_t v225;
  unint64_t v226;
  void (*v227)(uint64_t, uint64_t);
  uint64_t v228;
  uint64_t v229;
  uint64_t v230;
  uint64_t v231;
  unint64_t v232;
  void *v233;
  void (*v234)(uint64_t, char *, uint64_t);
  uint64_t v235;
  _QWORD *v236;
  _QWORD *v237[3];

  v1 = v0;
  v2 = 0;
  v3 = v0[9];
  v4 = *(_QWORD *)(v3 + 64);
  v209 = v3 + 64;
  v216 = v3;
  v5 = -1;
  v6 = -1 << *(_BYTE *)(v3 + 32);
  if (-v6 < 64)
    v5 = ~(-1 << -(char)v6);
  v7 = v5 & v4;
  v210 = (unint64_t)(63 - v6) >> 6;
  v208 = (_QWORD *)MEMORY[0x24BEE4B00];
  for (i = (void *)v0[71]; ; i = 0)
  {
    v233 = i;
    if (v7)
    {
      v222 = (v7 - 1) & v7;
      v224 = v2;
      v14 = __clz(__rbit64(v7)) | (v2 << 6);
      goto LABEL_22;
    }
    v15 = v2 + 1;
    if (__OFADD__(v2, 1))
    {
      __break(1u);
      goto LABEL_90;
    }
    if (v15 >= v210)
      goto LABEL_39;
    v16 = *(_QWORD *)(v209 + 8 * v15);
    v17 = v2 + 1;
    if (!v16)
    {
      v17 = v2 + 2;
      if (v2 + 2 >= v210)
        goto LABEL_39;
      v16 = *(_QWORD *)(v209 + 8 * v17);
      if (!v16)
      {
        v17 = v2 + 3;
        if (v2 + 3 >= v210)
          goto LABEL_39;
        v16 = *(_QWORD *)(v209 + 8 * v17);
        if (!v16)
          break;
      }
    }
LABEL_21:
    v222 = (v16 - 1) & v16;
    v224 = v17;
    v14 = __clz(__rbit64(v16)) + (v17 << 6);
LABEL_22:
    v20 = v1[59];
    v19 = v1[60];
    v21 = v1[58];
    v22 = v1[52];
    v23 = (_QWORD *)v1[32];
    v24 = v236[31];
    v213 = v23[9];
    v25 = (void (*)(uint64_t, unint64_t, uint64_t))v23[2];
    v25(v19, *(_QWORD *)(v216 + 48) + v213 * v14, v24);
    v26 = (uint64_t *)(*(_QWORD *)(v216 + 56) + 16 * v14);
    v27 = (uint64_t *)(v19 + *(int *)(v22 + 48));
    v28 = *v26;
    v29 = v26[1];
    *v27 = *v26;
    v27[1] = v29;
    v30 = (uint64_t *)(v20 + *(int *)(v22 + 48));
    v218 = (void (*)(uint64_t, uint64_t, uint64_t))v23[4];
    v218(v20, v19, v24);
    *v30 = v28;
    v30[1] = v29;
    v31 = (uint64_t *)(v21 + *(int *)(v22 + 48));
    v32 = v24;
    v1 = v236;
    v220 = (void (*)(unint64_t, uint64_t, uint64_t))v25;
    v25(v21, v20, v32);
    *v31 = v28;
    v31[1] = v29;
    sub_23A8F0BD8();
    swift_allocObject();
    sub_23A8C69F4(v28, v29);
    sub_23A8C69F4(v28, v29);
    sub_23A8F0BCC();
    sub_23A8C6A38(&qword_2569C8E60, (uint64_t (*)(uint64_t))MEMORY[0x24BE2EF88], MEMORY[0x24BE2EFA0]);
    sub_23A8F0BC0();
    v33 = v236[58];
    if (!v233)
    {
      v62 = v236[48];
      v61 = v236[49];
      v64 = v236[45];
      v63 = v236[46];
      sub_23A8C69B0(v28, v29);
      swift_release();
      v65 = *(void (**)(uint64_t, uint64_t, uint64_t))(v63 + 32);
      v65(v62, v61, v64);
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v237[0] = v208;
      v68 = sub_23A8C000C(v33);
      v69 = v208[2];
      v70 = (v67 & 1) == 0;
      v71 = v69 + v70;
      if (__OFADD__(v69, v70))
        goto LABEL_92;
      v72 = v67;
      if (v208[3] >= v71)
      {
        if ((isUniquelyReferenced_nonNull_native & 1) != 0)
        {
          v77 = v208;
          if ((v67 & 1) == 0)
            goto LABEL_36;
        }
        else
        {
          sub_23A8C1420();
          v77 = v237[0];
          v208 = v237[0];
          if ((v72 & 1) == 0)
            goto LABEL_36;
        }
      }
      else
      {
        v73 = v236[58];
        sub_23A8C0BA0(v71, isUniquelyReferenced_nonNull_native);
        v74 = v237[0];
        v75 = sub_23A8C000C(v73);
        if ((v72 & 1) != (v76 & 1))
        {
          sub_23A8F1424();
          return;
        }
        v68 = v75;
        v77 = v74;
        v208 = v74;
        if ((v72 & 1) == 0)
        {
LABEL_36:
          v78 = v236[58];
          v79 = v236[48];
          v80 = v236[45];
          v81 = v236[46];
          v82 = v236[31];
          v77[(v68 >> 6) + 8] |= 1 << v68;
          v220(v208[6] + v68 * v213, v78, v82);
          v65(v208[7] + *(_QWORD *)(v81 + 72) * v68, v79, v80);
          v83 = v208[2];
          v84 = __OFADD__(v83, 1);
          v85 = v83 + 1;
          if (v84)
            goto LABEL_93;
          v208[2] = v85;
          goto LABEL_38;
        }
      }
      (*(void (**)(unint64_t, _QWORD, _QWORD))(v236[46] + 40))(v77[7] + *(_QWORD *)(v236[46] + 72) * v68, v236[48], v236[45]);
LABEL_38:
      v86 = v236[58];
      v87 = v236[59];
      v88 = v236[31];
      v89 = v236[32];
      swift_bridgeObjectRelease();
      (*(void (**)(uint64_t, uint64_t))(v89 + 8))(v86, v88);
      v13 = v87;
      goto LABEL_5;
    }
    v35 = v236[31];
    v34 = v236[32];
    swift_release();
    v227 = *(void (**)(uint64_t, uint64_t))(v34 + 8);
    v227(v33, v35);
    if (qword_2542D8828 != -1)
      swift_once();
    v36 = v236[59];
    v37 = v236[54];
    v230 = v236[53];
    v38 = v236[52];
    v39 = v236[31];
    v40 = v236[20];
    v41 = v236[21];
    v42 = v236[19];
    v43 = __swift_project_value_buffer(v42, (uint64_t)qword_2542D8DE0);
    swift_beginAccess();
    v44 = v42;
    v1 = v236;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v40 + 16))(v41, v43, v44);
    v45 = (uint64_t *)(v37 + *(int *)(v38 + 48));
    v220(v37, v36, v39);
    *v45 = v28;
    v45[1] = v29;
    sub_23A8C7E20(v37, v230, &qword_2569C8E50);
    v46 = sub_23A8F1088();
    v47 = sub_23A8F1274();
    v48 = os_log_type_enabled(v46, v47);
    v49 = v236[59];
    if (v48)
    {
      v50 = v236[55];
      v51 = v236[53];
      v52 = v236[36];
      v53 = v236[31];
      v231 = v236[21];
      v211 = v236[20];
      v214 = v236[19];
      v54 = swift_slowAlloc();
      v55 = (_QWORD *)swift_slowAlloc();
      v237[0] = v55;
      *(_DWORD *)v54 = 136315138;
      v220(v50, v51, v53);
      v218(v52, v50, v53);
      sub_23A8C6A38(&qword_2569C8E30, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE988]);
      v56 = sub_23A8F13E8();
      v57 = v49;
      v59 = v58;
      v227(v52, v53);
      *(_QWORD *)(v54 + 4) = sub_23A8BF840(v56, v59, (uint64_t *)v237);
      swift_bridgeObjectRelease();
      sub_23A8C64C8(v51, &qword_2569C8E50);
      _os_log_impl(&dword_23A8AD000, v46, v47, "Failed to decode entry for exports on %s", (uint8_t *)v54, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x23B85B51C](v55, -1, -1);
      v60 = v54;
      v1 = v236;
      MEMORY[0x23B85B51C](v60, -1, -1);

      (*(void (**)(uint64_t, uint64_t))(v211 + 8))(v231, v214);
      v13 = v57;
    }
    else
    {
      v9 = v236[53];
      v11 = v236[20];
      v10 = v236[21];
      v12 = v236[19];

      sub_23A8C64C8(v9, &qword_2569C8E50);
      (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v10, v12);
      v13 = v49;
    }
LABEL_5:
    sub_23A8C64C8(v13, &qword_2569C8E50);
    v7 = v222;
    v2 = v224;
  }
  v18 = v2 + 4;
  if (v2 + 4 >= v210)
  {
LABEL_39:
    v90 = v1[68];
    swift_release();
    v225 = v90;
    v232 = sub_23A8BF59C(0, *(_QWORD *)(v90 + 16), 0, MEMORY[0x24BEE4AF8]);
    v91 = v1[68];
    if (v208[2])
    {
      v92 = swift_bridgeObjectRetain();
      v93 = sub_23A8B8F20(v92);
      v94 = swift_bridgeObjectRetain();
      sub_23A8B9344(v94, v93);
      v95 = swift_bridgeObjectRetain();
      v96 = (_QWORD *)sub_23A8EB9BC(v95);
      swift_bridgeObjectRelease();
      v237[0] = v96;
      sub_23A8EBFC8(v237);
      if (!i)
      {
        swift_bridgeObjectRelease();
        v97 = v237[0][2];
        if (v97)
        {
          v212 = v1[68];
          v98 = v1[46];
          v219 = v1[37];
          v99 = v1[32];
          v100 = (char *)v237[0]
               + ((*(unsigned __int8 *)(v99 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v99 + 80));
          v217 = *(_QWORD *)(v99 + 72);
          v221 = v98;
          v223 = v99;
          v234 = *(void (**)(uint64_t, char *, uint64_t))(v99 + 16);
          while (1)
          {
            v102 = v1[30];
            v101 = v1[31];
            v234(v102, v100, v101);
            v103 = *(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v223 + 56);
            v103(v102, 0, 1, v101);
            if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v223 + 48))(v102, 1, v101) == 1)
              break;
            (*(void (**)(_QWORD, _QWORD, _QWORD))(v1[32] + 32))(v1[35], v1[30], v1[31]);
            v228 = v97;
            v215 = v103;
            if (*(_QWORD *)(v225 + 16) && (v104 = sub_23A8C000C(v1[35]), (v105 & 1) != 0))
            {
              v106 = v1[45];
              v107 = v1[28];
              (*(void (**)(uint64_t, unint64_t, uint64_t))(v98 + 16))(v107, *(_QWORD *)(v212 + 56) + *(_QWORD *)(v1[46] + 72) * v104, v106);
              v108 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v98 + 56);
              v108(v107, 0, 1, v106);
            }
            else
            {
              v108 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v98 + 56);
              v108(v1[28], 1, 1, v1[45]);
            }
            v109 = v1[45];
            v110 = v1[27];
            sub_23A8C6700(v1[28], v110, &qword_2569C8E40);
            v111 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v98 + 48);
            if (v111(v110, 1, v109) == 1)
            {
              sub_23A8C64C8(v1[27], &qword_2569C8E40);
              v112 = 0.0;
            }
            else
            {
              v113 = v1[45];
              v114 = v1[27];
              sub_23A8F0E30();
              v112 = v115;
              (*(void (**)(uint64_t, uint64_t))(v98 + 8))(v114, v113);
            }
            v116 = v1[45];
            v117 = v1[26];
            sub_23A8C6700(v1[28], v117, &qword_2569C8E40);
            if (v111(v117, 1, v116) == 1)
            {
              sub_23A8C64C8(v1[26], &qword_2569C8E40);
              v118 = sub_23A8C438C(MEMORY[0x24BEE4AF8]);
            }
            else
            {
              v119 = v1[45];
              v120 = v1[26];
              v118 = sub_23A8F0E24();
              (*(void (**)(uint64_t, uint64_t))(v98 + 8))(v120, v119);
            }
            if (v208[2])
            {
              v121 = sub_23A8C000C(v1[35]);
              if ((v122 & 1) != 0)
              {
                (*(void (**)(_QWORD, unint64_t, _QWORD))(v98 + 16))(v1[25], v208[7] + *(_QWORD *)(v1[46] + 72) * v121, v1[45]);
                v123 = 0;
              }
              else
              {
                v123 = 1;
              }
            }
            else
            {
              v123 = 1;
            }
            v124 = v1[45];
            v126 = v1[24];
            v125 = v1[25];
            v108(v125, v123, 1, v124);
            sub_23A8C6700(v125, v126, &qword_2569C8E40);
            if (v111(v126, 1, v124) == 1)
            {
              sub_23A8C64C8(v1[24], &qword_2569C8E40);
              v127 = 0.0;
            }
            else
            {
              v128 = v1[45];
              v129 = v1[24];
              sub_23A8F0E30();
              v127 = v130;
              (*(void (**)(uint64_t, uint64_t))(v98 + 8))(v129, v128);
            }
            v131 = v1[45];
            v132 = v1[23];
            sub_23A8C6700(v1[25], v132, &qword_2569C8E40);
            if (v111(v132, 1, v131) == 1)
            {
              sub_23A8C64C8(v1[23], &qword_2569C8E40);
              v133 = sub_23A8C438C(MEMORY[0x24BEE4AF8]);
            }
            else
            {
              v134 = v1[45];
              v135 = v1[23];
              v133 = sub_23A8F0E24();
              (*(void (**)(uint64_t, uint64_t))(v98 + 8))(v135, v134);
            }
            v137 = v1[39];
            v136 = v1[40];
            v138 = v1;
            v139 = v1[36];
            v234(v139, (char *)v138[35], v138[31]);
            EnergySite.EnergyUsage.init(startTime:imports:exports:importsByPricingPeriod:exportsByPricingPeriod:subintervalCount:isValid:)(v139, v118, v133, 1, 1, v136, v112, v127);
            sub_23A8C4544(v136, v137);
            v140 = v232;
            v142 = *(_QWORD *)(v232 + 16);
            v141 = *(_QWORD *)(v232 + 24);
            if (v142 >= v141 >> 1)
              v140 = sub_23A8BF59C(v141 > 1, v142 + 1, 1, v232);
            v1 = v236;
            v143 = v236[39];
            v144 = v236[40];
            v145 = v236[35];
            v147 = v236[31];
            v146 = v236[32];
            v148 = v236[28];
            v149 = v236[25];
            *(_QWORD *)(v140 + 16) = v142 + 1;
            v232 = v140;
            sub_23A8EED90(v143, v140+ ((*(unsigned __int8 *)(v219 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v219 + 80))+ *(_QWORD *)(v219 + 72) * v142);
            sub_23A8C4588(v144);
            sub_23A8C64C8(v149, &qword_2569C8E40);
            sub_23A8C64C8(v148, &qword_2569C8E40);
            (*(void (**)(uint64_t, uint64_t))(v146 + 8))(v145, v147);
            v100 += v217;
            v97 = v228 - 1;
            v98 = v221;
            if (v228 == 1)
            {
              v215(v236[30], 1, 1, v236[31]);
              break;
            }
          }
        }
        else
        {
          (*(void (**)(_QWORD, uint64_t, uint64_t, _QWORD))(v1[32] + 56))(v1[30], 1, 1, v1[31]);
        }
LABEL_81:
        swift_release();
        if (*(_QWORD *)(v232 + 16))
        {
          v183 = v1[38];
          v184 = v1[31];
          v185 = v1[32];
          v186 = v1[29];
          v187 = *(unsigned __int8 *)(v1[37] + 80);
          sub_23A8C4544(v232 + ((v187 + 32) & ~v187), v183);
          v188 = *(void (**)(uint64_t, uint64_t, uint64_t))(v185 + 16);
          v188(v186, v183, v184);
          sub_23A8C4588(v183);
          (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v185 + 56))(v186, 0, 1, v184);
        }
        else
        {
          v189 = v1[32];
          (*(void (**)(_QWORD, uint64_t, uint64_t, _QWORD))(v189 + 56))(v1[29], 1, 1, v1[31]);
          v188 = *(void (**)(uint64_t, uint64_t, uint64_t))(v189 + 16);
        }
        v190 = v1[32];
        v191 = v1[31];
        v192 = v1[29];
        v188(v1[33], v1[11], v191);
        v193 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v190 + 48))(v192, 1, v191);
        v194 = v1[34];
        v195 = v1[31];
        v196 = v1[32];
        v197 = v1[29];
        if (v193 == 1)
        {
          v198 = *(void (**)(uint64_t, uint64_t, uint64_t))(v196 + 32);
          v198(v1[34], v1[33], v1[31]);
          sub_23A8C64C8(v197, &qword_2542D8CF8);
        }
        else
        {
          (*(void (**)(_QWORD, _QWORD))(v196 + 8))(v1[33], v1[31]);
          v198 = *(void (**)(uint64_t, uint64_t, uint64_t))(v196 + 32);
          v198(v194, v197, v195);
        }
        v199 = *((_BYTE *)v1 + 576);
        v200 = v1[34];
        v201 = v1[31];
        v202 = (_BYTE *)v1[10];
        v203 = (int *)type metadata accessor for EnergySite.HistoricalEnergyUsage(0);
        v204 = &v202[v203[7]];
        *(_QWORD *)v204 = 0;
        v204[8] = 1;
        v205 = &v202[v203[8]];
        *(_QWORD *)v205 = 0;
        v205[8] = 1;
        *v202 = v199;
        v198((uint64_t)&v202[v203[5]], v200, v201);
        *(_QWORD *)&v202[v203[6]] = v232;
        v206 = &v202[v203[9]];
        *(_QWORD *)v206 = 0;
        v206[8] = 0;
        v207 = &v202[v203[10]];
        *(_QWORD *)v207 = 0;
        v207[8] = 0;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
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
        ((void (*)(void))v1[1])();
        return;
      }
    }
    else
    {
      swift_bridgeObjectRetain_n();
      v150 = (_QWORD *)sub_23A8EBAB4(v91);
      swift_bridgeObjectRelease();
      v237[0] = v150;
      sub_23A8EC048(v237);
      if (!i)
      {
        v235 = v1[46];
        v229 = v1[37];
        swift_bridgeObjectRelease();
        j = 0;
        v152 = v237[0];
        v153 = v237[0][2];
        v226 = v153;
        if (v153)
          goto LABEL_73;
LABEL_72:
        v154 = v1[43];
        v155 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569C8E68);
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v155 - 8) + 56))(v154, 1, 1, v155);
        for (j = v153; ; ++j)
        {
          v159 = v1[44];
          sub_23A8C7E20(v1[43], v159, &qword_2569C8E48);
          v160 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569C8E68);
          if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v160 - 8) + 48))(v159, 1, v160) == 1)break;
          v161 = v152;
          v162 = v1[46];
          v163 = v1[47];
          v165 = v1[44];
          v164 = v1[45];
          v166 = v1;
          v167 = v1[42];
          v168 = v166[41];
          v169 = v166[36];
          v171 = v166[31];
          v170 = v166[32];
          (*(void (**)(uint64_t, uint64_t, uint64_t))(v162 + 32))(v163, v165 + *(int *)(v160 + 48), v164);
          (*(void (**)(uint64_t, uint64_t, uint64_t))(v170 + 32))(v169, v165, v171);
          sub_23A8F0E30();
          v173 = v172;
          v174 = sub_23A8F0E24();
          v175 = sub_23A8C4380(MEMORY[0x24BEE4AF8]);
          EnergySite.EnergyUsage.init(startTime:imports:exports:importsByPricingPeriod:exportsByPricingPeriod:subintervalCount:isValid:)(v169, v174, v175, 1, 1, v167, v173, 0.0);
          sub_23A8C4544(v167, v168);
          v176 = v232;
          v178 = *(_QWORD *)(v232 + 16);
          v177 = *(_QWORD *)(v232 + 24);
          if (v178 >= v177 >> 1)
            v176 = sub_23A8BF59C(v177 > 1, v178 + 1, 1, v232);
          v1 = v236;
          v179 = v236[47];
          v180 = v236[45];
          v181 = v236[41];
          v182 = v236[42];
          *(_QWORD *)(v176 + 16) = v178 + 1;
          v232 = v176;
          sub_23A8EED90(v181, v176+ ((*(unsigned __int8 *)(v229 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v229 + 80))+ *(_QWORD *)(v229 + 72) * v178);
          sub_23A8C4588(v182);
          (*(void (**)(uint64_t, uint64_t))(v235 + 8))(v179, v180);
          v152 = v161;
          v153 = v226;
          if (j == v226)
            goto LABEL_72;
LABEL_73:
          if (j >= v152[2])
            goto LABEL_91;
          v156 = v1[43];
          v157 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569C8E68);
          v158 = *(_QWORD *)(v157 - 8);
          sub_23A8C6700((uint64_t)v152+ ((*(unsigned __int8 *)(v158 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v158 + 80))+ *(_QWORD *)(v158 + 72) * j, v156, &qword_2569C8E68);
          (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v158 + 56))(v156, 0, 1, v157);
        }
        goto LABEL_81;
      }
    }
    swift_release();
    return;
  }
  v16 = *(_QWORD *)(v209 + 8 * v18);
  if (v16)
  {
    v17 = v2 + 4;
    goto LABEL_21;
  }
  while (1)
  {
    v17 = v18 + 1;
    if (__OFADD__(v18, 1))
      break;
    if (v17 >= v210)
      goto LABEL_39;
    v16 = *(_QWORD *)(v209 + 8 * v17);
    ++v18;
    if (v16)
      goto LABEL_21;
  }
LABEL_90:
  __break(1u);
LABEL_91:
  __break(1u);
LABEL_92:
  __break(1u);
LABEL_93:
  __break(1u);
}

uint64_t sub_23A8EA78C()
{
  uint64_t v0;

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

uint64_t sub_23A8EA9C4()
{
  uint64_t v0;

  swift_task_dealloc();
  swift_bridgeObjectRelease();
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

uint64_t sub_23A8EAC08(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  uint64_t v14;

  *(_QWORD *)(v8 + 200) = v14;
  *(_OWORD *)(v8 + 184) = v13;
  *(_OWORD *)(v8 + 168) = v12;
  *(_QWORD *)(v8 + 152) = a7;
  *(_QWORD *)(v8 + 160) = a8;
  *(_BYTE *)(v8 + 312) = a5;
  *(_QWORD *)(v8 + 136) = a4;
  *(_QWORD *)(v8 + 144) = a6;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569C8E80);
  *(_QWORD *)(v8 + 208) = v9;
  v10 = *(_QWORD *)(v9 - 8);
  *(_QWORD *)(v8 + 216) = v10;
  *(_QWORD *)(v8 + 224) = *(_QWORD *)(v10 + 64);
  *(_QWORD *)(v8 + 232) = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23A8EAC8C()
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
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v18;
  void *v19;

  v1 = v0[29];
  v2 = v0[26];
  v3 = v0[27];
  v4 = v0[17];
  type metadata accessor for HomeEnergyXPCConnection();
  swift_allocObject();
  v0[30] = sub_23A8EF888();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v1, v4, v2);
  v5 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v6 = swift_allocObject();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v3 + 32))(v6 + v5, v1, v2);
  v19 = (void *)sub_23A8EFE34((uint64_t)sub_23A8EEF40, v6);
  v0[31] = v19;
  swift_release();
  v7 = v0[25];
  v18 = sub_23A8F1130();
  v0[32] = v18;
  swift_bridgeObjectRelease();
  v8 = sub_23A8F0C44();
  v0[33] = v8;
  v9 = sub_23A8F0C44();
  v0[34] = v9;
  v10 = sub_23A8F1130();
  v0[35] = v10;
  v11 = sub_23A8F1130();
  v0[36] = v11;
  v12 = sub_23A8F0D4C();
  v0[37] = v12;
  v13 = *(id *)(v7 + 16);
  sub_23A8F0F50();

  v14 = sub_23A8F1130();
  v0[38] = v14;
  swift_bridgeObjectRelease();
  v0[7] = v0 + 15;
  v0[2] = v0;
  v0[3] = sub_23A8EAED8;
  v15 = swift_continuation_init();
  v0[10] = MEMORY[0x24BDAC760];
  v16 = v0 + 10;
  v16[1] = 0x40000000;
  v16[2] = sub_23A8EAF24;
  v16[3] = &block_descriptor_16;
  v16[4] = v15;
  objc_msgSend(v19, sel_leanHistoricalEnergyUsageWithInterval_start_end_subscriptionID_utilityID_timeZone_flowDirection_siteID_completionHandler_, v18, v8, v9, v10, v11, v12, 1, v14, v16);
  return swift_continuation_await();
}

uint64_t sub_23A8EAED8()
{
  return swift_task_switch();
}

uint64_t sub_23A8EAF24(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;

  v2 = *(_QWORD *)(a1 + 32);
  if (a2)
  {
    sub_23A8F0CA4();
    sub_23A8C6A38(&qword_2569C87A8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE930]);
    v3 = sub_23A8F10B8();
  }
  else
  {
    v3 = 0;
  }
  v5 = v3;
  sub_23A8C7E20((uint64_t)&v5, *(_QWORD *)(*(_QWORD *)(v2 + 64) + 40), &qword_2569C8E98);
  return swift_continuation_resume();
}

uint64_t sub_23A8EAFC4(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  _QWORD *v27;
  void (*v28)(char *, uint64_t, uint64_t);
  char *v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  unint64_t v38;
  unint64_t v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void (*v43)(uint64_t, char *, uint64_t);
  _QWORD *v44;
  uint64_t v45;
  _QWORD *v46;
  uint64_t v47;
  uint64_t v49;
  char *v50;
  char *v51;
  char *v52;
  uint64_t v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  char *v59;
  uint64_t v60;
  uint64_t v61;
  int v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  _QWORD *v69;
  uint64_t v70;
  uint64_t v71;

  v66 = a7;
  v67 = a8;
  v63 = a5;
  v64 = a6;
  v55 = a1;
  v56 = a3;
  v62 = a2;
  v68 = a12;
  v61 = a11;
  v65 = a10;
  v57 = a9;
  v58 = a4;
  v12 = sub_23A8F0D58();
  v71 = *(_QWORD *)(v12 - 8);
  v53 = v12;
  v60 = *(_QWORD *)(v71 + 64);
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)&v49 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v54 = v14;
  v15 = sub_23A8F0CA4();
  v69 = *(_QWORD **)(v15 - 8);
  v70 = v15;
  v16 = v69[8];
  v17 = MEMORY[0x24BDAC7A8](v15);
  v52 = (char *)&v49 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v17);
  v19 = (char *)&v49 - v18;
  v51 = (char *)&v49 - v18;
  v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569C8E80);
  v21 = *(_QWORD *)(v20 - 8);
  v49 = v20;
  v22 = *(_QWORD *)(v21 + 64);
  MEMORY[0x24BDAC7A8](v20);
  v50 = (char *)&v49 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542D8AC0);
  MEMORY[0x24BDAC7A8](v23);
  v25 = (char *)&v49 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  v59 = v25;
  v26 = sub_23A8F1208();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v26 - 8) + 56))(v25, 1, 1, v26);
  (*(void (**)(char *, uint64_t, uint64_t))(v21 + 16))((char *)&v49 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0), v55, v20);
  v27 = v69;
  v28 = (void (*)(char *, uint64_t, uint64_t))v69[2];
  v29 = v19;
  v30 = v70;
  v28(v29, v56, v70);
  v28((char *)&v49 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0), v58, v30);
  v31 = v71;
  (*(void (**)(char *, uint64_t, uint64_t))(v71 + 16))(v14, v57, v12);
  v32 = (*(unsigned __int8 *)(v21 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v21 + 80);
  v33 = v32 + v22;
  v34 = *((unsigned __int8 *)v27 + 80);
  v35 = (v34 + v33 + 1) & ~v34;
  v36 = (v16 + v34 + v35) & ~v34;
  v37 = (v16 + v36 + 7) & 0xFFFFFFFFFFFFFFF8;
  v38 = (v37 + 23) & 0xFFFFFFFFFFFFFFF8;
  v39 = (*(unsigned __int8 *)(v31 + 80) + v38 + 16) & ~(unint64_t)*(unsigned __int8 *)(v31 + 80);
  v40 = (v60 + v39 + 7) & 0xFFFFFFFFFFFFFFF8;
  v41 = swift_allocObject();
  *(_QWORD *)(v41 + 16) = 0;
  *(_QWORD *)(v41 + 24) = 0;
  (*(void (**)(unint64_t, char *, uint64_t))(v21 + 32))(v41 + v32, v50, v49);
  *(_BYTE *)(v41 + v33) = v62;
  v42 = v70;
  v43 = (void (*)(uint64_t, char *, uint64_t))v69[4];
  v43(v41 + v35, v51, v70);
  v43(v41 + v36, v52, v42);
  v44 = (_QWORD *)(v41 + v37);
  v45 = v64;
  *v44 = v63;
  v44[1] = v45;
  v46 = (_QWORD *)(v41 + v38);
  v47 = v67;
  *v46 = v66;
  v46[1] = v47;
  (*(void (**)(unint64_t, char *, uint64_t))(v71 + 32))(v41 + v39, v54, v53);
  *(_QWORD *)(v41 + v40) = v65;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  sub_23A8B1124((uint64_t)v59, v68, v41);
  return swift_release();
}

uint64_t sub_23A8EB304(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  uint64_t v14;

  *(_QWORD *)(v8 + 200) = v14;
  *(_OWORD *)(v8 + 184) = v13;
  *(_OWORD *)(v8 + 168) = v12;
  *(_QWORD *)(v8 + 152) = a7;
  *(_QWORD *)(v8 + 160) = a8;
  *(_BYTE *)(v8 + 312) = a5;
  *(_QWORD *)(v8 + 136) = a4;
  *(_QWORD *)(v8 + 144) = a6;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569C8E80);
  *(_QWORD *)(v8 + 208) = v9;
  v10 = *(_QWORD *)(v9 - 8);
  *(_QWORD *)(v8 + 216) = v10;
  *(_QWORD *)(v8 + 224) = *(_QWORD *)(v10 + 64);
  *(_QWORD *)(v8 + 232) = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_23A8EB388()
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
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v18;
  void *v19;

  v1 = v0[29];
  v2 = v0[26];
  v3 = v0[27];
  v4 = v0[17];
  type metadata accessor for HomeEnergyXPCConnection();
  swift_allocObject();
  v0[30] = sub_23A8EF888();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v1, v4, v2);
  v5 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v6 = swift_allocObject();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v3 + 32))(v6 + v5, v1, v2);
  v19 = (void *)sub_23A8EFE34((uint64_t)sub_23A8EEF40, v6);
  v0[31] = v19;
  swift_release();
  v7 = v0[25];
  v18 = sub_23A8F1130();
  v0[32] = v18;
  swift_bridgeObjectRelease();
  v8 = sub_23A8F0C44();
  v0[33] = v8;
  v9 = sub_23A8F0C44();
  v0[34] = v9;
  v10 = sub_23A8F1130();
  v0[35] = v10;
  v11 = sub_23A8F1130();
  v0[36] = v11;
  v12 = sub_23A8F0D4C();
  v0[37] = v12;
  v13 = *(id *)(v7 + 16);
  sub_23A8F0F50();

  v14 = sub_23A8F1130();
  v0[38] = v14;
  swift_bridgeObjectRelease();
  v0[7] = v0 + 15;
  v0[2] = v0;
  v0[3] = sub_23A8EB5D4;
  v15 = swift_continuation_init();
  v0[10] = MEMORY[0x24BDAC760];
  v16 = v0 + 10;
  v16[1] = 0x40000000;
  v16[2] = sub_23A8EAF24;
  v16[3] = &block_descriptor_4;
  v16[4] = v15;
  objc_msgSend(v19, sel_leanHistoricalEnergyUsageWithInterval_start_end_subscriptionID_utilityID_timeZone_flowDirection_siteID_completionHandler_, v18, v8, v9, v10, v11, v12, 2, v14, v16);
  return swift_continuation_await();
}

uint64_t sub_23A8EB5D4()
{
  return swift_task_switch();
}

uint64_t sub_23A8EB620()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v2 = *(void **)(v0 + 296);
  v1 = *(void **)(v0 + 304);
  v4 = *(void **)(v0 + 280);
  v3 = *(void **)(v0 + 288);
  v5 = *(void **)(v0 + 264);
  v6 = *(void **)(v0 + 272);
  v7 = *(void **)(v0 + 256);
  v8 = *(_QWORD *)(v0 + 240);
  v9 = *(_QWORD *)(v0 + 120);
  swift_unknownObjectRelease();

  objc_msgSend(*(id *)(v8 + 16), sel_invalidate);
  v10 = MEMORY[0x24BEE4B00];
  if (v9)
    v10 = v9;
  *(_QWORD *)(v0 + 128) = v10;
  sub_23A8F11F0();
  swift_release();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23A8EB6F0(void *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  id v9;
  id v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  unint64_t v17;
  id v18;
  _QWORD v20[3];
  uint64_t v21;
  uint64_t v22;

  v4 = sub_23A8F10A0();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2542D8828 != -1)
    swift_once();
  v8 = __swift_project_value_buffer(v4, (uint64_t)qword_2542D8DE0);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v8, v4);
  v9 = a1;
  v10 = a1;
  v11 = sub_23A8F1088();
  v12 = sub_23A8F1274();
  if (os_log_type_enabled(v11, v12))
  {
    v20[2] = a2;
    v13 = (uint8_t *)swift_slowAlloc();
    v14 = swift_slowAlloc();
    v21 = (uint64_t)a1;
    v22 = v14;
    *(_DWORD *)v13 = 136315138;
    v20[1] = v13 + 4;
    v15 = a1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2542D8AE0);
    v16 = sub_23A8F1148();
    v21 = sub_23A8BF840(v16, v17, &v22);
    sub_23A8F12A4();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_23A8AD000, v11, v12, "Failed to get insights. %s", v13, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B85B51C](v14, -1, -1);
    MEMORY[0x23B85B51C](v13, -1, -1);
  }
  else
  {

  }
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  v22 = (uint64_t)a1;
  v18 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569C8E80);
  return sub_23A8F11E4();
}

uint64_t sub_23A8EB954(uint64_t a1)
{
  return sub_23A8EB97C(a1, (uint64_t)&unk_250BB6360, (uint64_t)&unk_2569C8EA8);
}

uint64_t sub_23A8EB968(uint64_t a1)
{
  return sub_23A8EB97C(a1, (uint64_t)&unk_250BB62F8, (uint64_t)&unk_2569C8E90);
}

uint64_t sub_23A8EB97C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  return sub_23A8EAFC4(a1, *(unsigned __int8 *)(v3 + 16), *(_QWORD *)(v3 + 24), *(_QWORD *)(v3 + 32), *(_QWORD *)(v3 + 40), *(_QWORD *)(v3 + 48), *(_QWORD *)(v3 + 56), *(_QWORD *)(v3 + 64), *(_QWORD *)(v3 + 72), *(_QWORD *)(v3 + 80), a2, a3);
}

size_t sub_23A8EB9BC(uint64_t a1)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569C87D8);
  v3 = *(_QWORD *)(sub_23A8F0CA4() - 8);
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
      swift_bridgeObjectRetain();
      v9 = sub_23A8EE6E8(&v10, (uint64_t)v6 + v5, v1, a1);
      sub_23A8EEDD4();
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

size_t sub_23A8EBAB4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  _QWORD *v6;
  size_t result;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return MEMORY[0x24BEE4AF8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569C8E70);
  v3 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2569C8E68) - 8);
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
      v9 = *(unsigned __int8 *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2569C8E68) - 8) + 80);
      v10 = sub_23A8EEA38(&v11, (uint64_t)v6 + ((v9 + 32) & ~v9), v1, a1);
      swift_bridgeObjectRetain();
      sub_23A8EEDD4();
      if (v10 == v1)
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

uint64_t sub_23A8EBBEC(char a1, int64_t a2, char a3, _QWORD *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  _QWORD *v13;
  size_t v14;
  uint64_t v16;
  unint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  char *v21;
  unint64_t v22;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = a4[3];
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_35:
        __break(1u);
        goto LABEL_36;
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
  if (!v9)
  {
    v13 = (_QWORD *)MEMORY[0x24BEE4AF8];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569C8E70);
  v10 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2569C8E68) - 8);
  v11 = *(_QWORD *)(v10 + 72);
  v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v13 = (_QWORD *)swift_allocObject();
  v14 = _swift_stdlib_malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  if (v14 - v12 == 0x8000000000000000 && v11 == -1)
    goto LABEL_34;
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  v16 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2569C8E68) - 8);
  v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  v18 = (char *)v13 + v17;
  v19 = (char *)a4 + v17;
  if ((a1 & 1) != 0)
  {
    if (v13 < a4 || v18 >= &v19[*(_QWORD *)(v16 + 72) * v8])
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
    goto LABEL_32;
  }
  v20 = *(_QWORD *)(v16 + 72) * v8;
  v21 = &v18[v20];
  v22 = (unint64_t)&v19[v20];
  if (v19 >= v21 || (unint64_t)v18 >= v22)
  {
    swift_arrayInitWithCopy();
LABEL_32:
    swift_release();
    return (uint64_t)v13;
  }
LABEL_36:
  result = sub_23A8F13C4();
  __break(1u);
  return result;
}

uint64_t sub_23A8EBDD4(char a1, int64_t a2, char a3, _QWORD *a4)
{
  return sub_23A8EBDE8(a1, a2, a3, a4, &qword_2569C8848, type metadata accessor for EnergySite.EnergyUsage);
}

uint64_t sub_23A8EBDE8(char a1, int64_t a2, char a3, _QWORD *a4, uint64_t *a5, uint64_t (*a6)(_QWORD))
{
  unint64_t v9;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  _QWORD *v16;
  size_t v17;
  uint64_t v19;
  unint64_t v20;
  char *v21;
  char *v22;
  uint64_t v23;
  char *v24;
  unint64_t v25;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v9 = a4[3];
    v10 = v9 >> 1;
    if ((uint64_t)(v9 >> 1) < a2)
    {
      if (v10 + 0x4000000000000000 < 0)
      {
LABEL_35:
        __break(1u);
        goto LABEL_36;
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
  v11 = a4[2];
  if (v10 <= v11)
    v12 = a4[2];
  else
    v12 = v10;
  if (!v12)
  {
    v16 = (_QWORD *)MEMORY[0x24BEE4AF8];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(a5);
  v13 = *(_QWORD *)(a6(0) - 8);
  v14 = *(_QWORD *)(v13 + 72);
  v15 = (*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  v16 = (_QWORD *)swift_allocObject();
  v17 = _swift_stdlib_malloc_size(v16);
  if (!v14)
  {
    __break(1u);
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  if (v17 - v15 == 0x8000000000000000 && v14 == -1)
    goto LABEL_34;
  v16[2] = v11;
  v16[3] = 2 * ((uint64_t)(v17 - v15) / v14);
LABEL_19:
  v19 = *(_QWORD *)(a6(0) - 8);
  v20 = (*(unsigned __int8 *)(v19 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
  v21 = (char *)v16 + v20;
  v22 = (char *)a4 + v20;
  if ((a1 & 1) != 0)
  {
    if (v16 < a4 || v21 >= &v22[*(_QWORD *)(v19 + 72) * v11])
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v16 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
    goto LABEL_32;
  }
  v23 = *(_QWORD *)(v19 + 72) * v11;
  v24 = &v21[v23];
  v25 = (unint64_t)&v22[v23];
  if (v22 >= v24 || (unint64_t)v21 >= v25)
  {
    swift_arrayInitWithCopy();
LABEL_32:
    swift_release();
    return (uint64_t)v16;
  }
LABEL_36:
  result = sub_23A8F13C4();
  __break(1u);
  return result;
}

uint64_t sub_23A8EBFC8(_QWORD **a1)
{
  uint64_t v2;
  _QWORD *v3;
  char *v4;
  uint64_t result;
  char *v6[2];

  v2 = *(_QWORD *)(sub_23A8F0CA4() - 8);
  v3 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v3 = (_QWORD *)sub_23A8EED48(v3);
  v4 = (char *)v3[2];
  v6[0] = (char *)v3 + ((*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  v6[1] = v4;
  result = sub_23A8EC0CC(v6);
  *a1 = v3;
  return result;
}

uint64_t sub_23A8EC048(_QWORD **a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t result;
  _QWORD v6[2];

  v2 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2569C8E68) - 8);
  v3 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v3 = (_QWORD *)sub_23A8EED7C(v3);
  v4 = v3[2];
  v6[0] = (char *)v3 + ((*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  v6[1] = v4;
  result = sub_23A8ECB44(v6);
  *a1 = v3;
  return result;
}

uint64_t sub_23A8EC0CC(char **a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(char *, char *, uint64_t);
  char *v26;
  char *v27;
  char *v28;
  void (*v29)(char *, uint64_t);
  char *v30;
  char *v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  char *v37;
  int v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char **v47;
  uint64_t v48;
  char *v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  char *v57;
  char *v58;
  char **v59;
  void (*v60)(char *, char *, uint64_t);
  char *v61;
  char *v62;
  void (*v63)(char *, uint64_t);
  char *v64;
  char *v65;
  void (*v66)(char *, char *, uint64_t);
  char isUniquelyReferenced_nonNull_native;
  unint64_t v68;
  unint64_t v69;
  char *v70;
  char *v71;
  uint64_t v72;
  unint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  char v77;
  char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  BOOL v84;
  unint64_t v85;
  char *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  char *v91;
  uint64_t v92;
  uint64_t v93;
  BOOL v94;
  uint64_t v95;
  char v96;
  char *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  BOOL v101;
  uint64_t v102;
  uint64_t v103;
  char *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  char *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  unint64_t v112;
  char *v113;
  char *v114;
  uint64_t v115;
  char *v116;
  uint64_t v117;
  uint64_t v118;
  unint64_t v119;
  char *v120;
  unint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  char *v125;
  unint64_t v126;
  uint64_t v127;
  uint64_t v128;
  char *v129;
  uint64_t v130;
  char *v131;
  uint64_t v132;
  unint64_t v133;
  uint64_t v134;
  char *v135;
  uint64_t v136;
  void (*v137)(char *, char *, uint64_t);
  char *v138;
  char *v139;
  uint64_t v140;
  char **v141;
  char *v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;

  v3 = sub_23A8F0CA4();
  v145 = *(_QWORD *)(v3 - 8);
  v4 = MEMORY[0x24BDAC7A8](v3);
  v131 = (char *)&v127 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v142 = (char *)&v127 - v7;
  v8 = MEMORY[0x24BDAC7A8](v6);
  v139 = (char *)&v127 - v9;
  MEMORY[0x24BDAC7A8](v8);
  v138 = (char *)&v127 - v10;
  v11 = (uint64_t)a1[1];
  result = sub_23A8F13DC();
  if (result >= v11)
  {
    if (v11 < 0)
      goto LABEL_141;
    if (v11)
      return sub_23A8ED518(0, v11, 1, a1);
    return result;
  }
  if (v11 >= 0)
    v13 = v11;
  else
    v13 = v11 + 1;
  if (v11 < -1)
    goto LABEL_149;
  v141 = a1;
  v128 = result;
  v134 = v1;
  if (v11 < 2)
  {
    v17 = (char *)MEMORY[0x24BEE4AF8];
    v133 = MEMORY[0x24BEE4AF8]
         + ((*(unsigned __int8 *)(v145 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v145 + 80));
    v127 = MEMORY[0x24BEE4AF8];
    if (v11 != 1)
    {
      v19 = *(_QWORD *)(MEMORY[0x24BEE4AF8] + 16);
LABEL_107:
      if (v19 >= 2)
      {
        v120 = *v141;
        do
        {
          v121 = v19 - 2;
          if (v19 < 2)
            goto LABEL_136;
          if (!v120)
            goto LABEL_148;
          v122 = *(_QWORD *)&v17[16 * v121 + 32];
          v123 = *(_QWORD *)&v17[16 * v19 + 24];
          v124 = v134;
          sub_23A8ED9C8((unint64_t)&v120[*(_QWORD *)(v145 + 72) * v122], (unint64_t)&v120[*(_QWORD *)(v145 + 72) * *(_QWORD *)&v17[16 * v19 + 16]], (unint64_t)&v120[*(_QWORD *)(v145 + 72) * v123], v133);
          v134 = v124;
          if (v124)
            break;
          if (v123 < v122)
            goto LABEL_137;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v17 = sub_23A8EE6D4((uint64_t)v17);
          if (v121 >= *((_QWORD *)v17 + 2))
            goto LABEL_138;
          v125 = &v17[16 * v121 + 32];
          *(_QWORD *)v125 = v122;
          *((_QWORD *)v125 + 1) = v123;
          v126 = *((_QWORD *)v17 + 2);
          if (v19 > v126)
            goto LABEL_139;
          memmove(&v17[16 * v19 + 16], &v17[16 * v19 + 32], 16 * (v126 - v19));
          *((_QWORD *)v17 + 2) = v126 - 1;
          v19 = v126 - 1;
        }
        while (v126 > 2);
      }
LABEL_118:
      swift_bridgeObjectRelease();
      *(_QWORD *)(v127 + 16) = 0;
      return swift_bridgeObjectRelease();
    }
  }
  else
  {
    v14 = v13 >> 1;
    v15 = sub_23A8F11C0();
    *(_QWORD *)(v15 + 16) = v14;
    v16 = *(unsigned __int8 *)(v145 + 80);
    v127 = v15;
    v133 = v15 + ((v16 + 32) & ~v16);
  }
  v18 = 0;
  v17 = (char *)MEMORY[0x24BEE4AF8];
  while (1)
  {
    v20 = v18;
    v21 = v18 + 1;
    v132 = v18;
    if (v18 + 1 >= v11)
    {
      v32 = v18 + 1;
      v41 = v134;
      goto LABEL_58;
    }
    v22 = *v141;
    v143 = v11;
    v23 = v145;
    v24 = *(_QWORD *)(v145 + 72);
    v25 = *(void (**)(_QWORD, _QWORD, _QWORD))(v145 + 16);
    v26 = v138;
    v25(v138, &v22[v24 * v21], v3);
    v27 = &v22[v24 * v20];
    v28 = v139;
    v25(v139, v27, v3);
    v140 = sub_23A8C6A38((unint64_t *)&qword_2569C8538, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE948]);
    LODWORD(v137) = sub_23A8F110C();
    v29 = *(void (**)(_QWORD, _QWORD))(v23 + 8);
    v30 = v28;
    v20 = v132;
    v29(v30, v3);
    v29(v26, v3);
    v31 = v22;
    v32 = v20 + 2;
    v135 = v31;
    v144 = v24;
    if (v20 + 2 >= v143)
    {
      v41 = v134;
      v40 = v143;
      v39 = v24;
      if ((v137 & 1) == 0)
        break;
    }
    else
    {
      v129 = v17;
      v136 = v24 * v21;
      v33 = v31;
      v34 = v24 * v32;
      do
      {
        v35 = v32;
        v36 = v138;
        v25(v138, &v33[v34], v3);
        v37 = v139;
        v25(v139, &v33[v136], v3);
        v38 = sub_23A8F110C();
        v29(v37, v3);
        v29(v36, v3);
        if (((v137 ^ v38) & 1) != 0)
        {
          v41 = v134;
          v17 = v129;
          v32 = v35;
          v20 = v132;
          v40 = v143;
          v39 = v144;
          if ((v137 & 1) == 0)
            goto LABEL_38;
          goto LABEL_26;
        }
        v32 = v35 + 1;
        v39 = v144;
        v33 += v144;
      }
      while (v143 != v35 + 1);
      v40 = v143;
      v32 = v143;
      v41 = v134;
      v17 = v129;
      v20 = v132;
      if ((v137 & 1) == 0)
        break;
    }
LABEL_26:
    if (v32 < v20)
      goto LABEL_142;
    if (v20 >= v32)
      break;
    v129 = v17;
    v42 = 0;
    v43 = v39 * (v32 - 1);
    v44 = v32 * v39;
    v45 = v20;
    v46 = v20 * v39;
    v47 = v141;
    v140 = v32;
    do
    {
      if (v45 != v32 + v42 - 1)
      {
        if (!v135)
          goto LABEL_147;
        v48 = v41;
        v49 = &v135[v46];
        v50 = &v135[v43];
        v137 = *(char **)(v145 + 32);
        ((void (*)(char *, char *, uint64_t))v137)(v131, &v135[v46], v3);
        if (v46 < v43 || v49 >= &v135[v44])
        {
          swift_arrayInitWithTakeFrontToBack();
        }
        else if (v46 != v43)
        {
          swift_arrayInitWithTakeBackToFront();
        }
        ((void (*)(char *, char *, uint64_t))v137)(v50, v131, v3);
        v41 = v48;
        v32 = v140;
        v47 = v141;
        v39 = v144;
      }
      ++v45;
      --v42;
      v43 -= v39;
      v44 -= v39;
      v46 += v39;
    }
    while (v45 < v32 + v42);
    v17 = v129;
    v20 = v132;
    v40 = v143;
    if (v32 < v143)
      goto LABEL_41;
LABEL_58:
    if (v32 < v20)
      goto LABEL_135;
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v134 = v41;
    v140 = v32;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      v17 = sub_23A8EE3C0(0, *((_QWORD *)v17 + 2) + 1, 1, v17);
    v69 = *((_QWORD *)v17 + 2);
    v68 = *((_QWORD *)v17 + 3);
    v19 = v69 + 1;
    if (v69 >= v68 >> 1)
      v17 = sub_23A8EE3C0((char *)(v68 > 1), v69 + 1, 1, v17);
    *((_QWORD *)v17 + 2) = v19;
    v70 = v17 + 32;
    v71 = &v17[16 * v69 + 32];
    v72 = v140;
    *(_QWORD *)v71 = v20;
    *((_QWORD *)v71 + 1) = v72;
    if (v69)
    {
      while (1)
      {
        v73 = v19 - 1;
        if (v19 >= 4)
        {
          v78 = &v70[16 * v19];
          v79 = *((_QWORD *)v78 - 8);
          v80 = *((_QWORD *)v78 - 7);
          v84 = __OFSUB__(v80, v79);
          v81 = v80 - v79;
          if (v84)
            goto LABEL_124;
          v83 = *((_QWORD *)v78 - 6);
          v82 = *((_QWORD *)v78 - 5);
          v84 = __OFSUB__(v82, v83);
          v76 = v82 - v83;
          v77 = v84;
          if (v84)
            goto LABEL_125;
          v85 = v19 - 2;
          v86 = &v70[16 * v19 - 32];
          v88 = *(_QWORD *)v86;
          v87 = *((_QWORD *)v86 + 1);
          v84 = __OFSUB__(v87, v88);
          v89 = v87 - v88;
          if (v84)
            goto LABEL_127;
          v84 = __OFADD__(v76, v89);
          v90 = v76 + v89;
          if (v84)
            goto LABEL_130;
          if (v90 >= v81)
          {
            v108 = &v70[16 * v73];
            v110 = *(_QWORD *)v108;
            v109 = *((_QWORD *)v108 + 1);
            v84 = __OFSUB__(v109, v110);
            v111 = v109 - v110;
            if (v84)
              goto LABEL_134;
            v101 = v76 < v111;
            goto LABEL_95;
          }
        }
        else
        {
          if (v19 != 3)
          {
            v102 = *((_QWORD *)v17 + 4);
            v103 = *((_QWORD *)v17 + 5);
            v84 = __OFSUB__(v103, v102);
            v95 = v103 - v102;
            v96 = v84;
            goto LABEL_89;
          }
          v75 = *((_QWORD *)v17 + 4);
          v74 = *((_QWORD *)v17 + 5);
          v84 = __OFSUB__(v74, v75);
          v76 = v74 - v75;
          v77 = v84;
        }
        if ((v77 & 1) != 0)
          goto LABEL_126;
        v85 = v19 - 2;
        v91 = &v70[16 * v19 - 32];
        v93 = *(_QWORD *)v91;
        v92 = *((_QWORD *)v91 + 1);
        v94 = __OFSUB__(v92, v93);
        v95 = v92 - v93;
        v96 = v94;
        if (v94)
          goto LABEL_129;
        v97 = &v70[16 * v73];
        v99 = *(_QWORD *)v97;
        v98 = *((_QWORD *)v97 + 1);
        v84 = __OFSUB__(v98, v99);
        v100 = v98 - v99;
        if (v84)
          goto LABEL_132;
        if (__OFADD__(v95, v100))
          goto LABEL_133;
        if (v95 + v100 >= v76)
        {
          v101 = v76 < v100;
LABEL_95:
          if (v101)
            v73 = v85;
          goto LABEL_97;
        }
LABEL_89:
        if ((v96 & 1) != 0)
          goto LABEL_128;
        v104 = &v70[16 * v73];
        v106 = *(_QWORD *)v104;
        v105 = *((_QWORD *)v104 + 1);
        v84 = __OFSUB__(v105, v106);
        v107 = v105 - v106;
        if (v84)
          goto LABEL_131;
        if (v107 < v95)
          goto LABEL_14;
LABEL_97:
        v112 = v73 - 1;
        if (v73 - 1 >= v19)
        {
          __break(1u);
LABEL_121:
          __break(1u);
LABEL_122:
          __break(1u);
LABEL_123:
          __break(1u);
LABEL_124:
          __break(1u);
LABEL_125:
          __break(1u);
LABEL_126:
          __break(1u);
LABEL_127:
          __break(1u);
LABEL_128:
          __break(1u);
LABEL_129:
          __break(1u);
LABEL_130:
          __break(1u);
LABEL_131:
          __break(1u);
LABEL_132:
          __break(1u);
LABEL_133:
          __break(1u);
LABEL_134:
          __break(1u);
LABEL_135:
          __break(1u);
LABEL_136:
          __break(1u);
LABEL_137:
          __break(1u);
LABEL_138:
          __break(1u);
LABEL_139:
          __break(1u);
LABEL_140:
          __break(1u);
LABEL_141:
          __break(1u);
LABEL_142:
          __break(1u);
LABEL_143:
          __break(1u);
          goto LABEL_144;
        }
        if (!*v141)
          goto LABEL_146;
        v113 = v17;
        v114 = &v70[16 * v112];
        v115 = *(_QWORD *)v114;
        v116 = &v70[16 * v73];
        v117 = *((_QWORD *)v116 + 1);
        v118 = v134;
        sub_23A8ED9C8((unint64_t)&(*v141)[*(_QWORD *)(v145 + 72) * *(_QWORD *)v114], (unint64_t)&(*v141)[*(_QWORD *)(v145 + 72) * *(_QWORD *)v116], (unint64_t)&(*v141)[*(_QWORD *)(v145 + 72) * v117], v133);
        v134 = v118;
        if (v118)
          goto LABEL_118;
        if (v117 < v115)
          goto LABEL_121;
        if (v73 > *((_QWORD *)v113 + 2))
          goto LABEL_122;
        *(_QWORD *)v114 = v115;
        *(_QWORD *)&v70[16 * v112 + 8] = v117;
        v119 = *((_QWORD *)v113 + 2);
        if (v73 >= v119)
          goto LABEL_123;
        v17 = v113;
        v19 = v119 - 1;
        memmove(&v70[16 * v73], v116 + 16, 16 * (v119 - 1 - v73));
        *((_QWORD *)v113 + 2) = v119 - 1;
        if (v119 <= 2)
          goto LABEL_14;
      }
    }
    v19 = 1;
LABEL_14:
    v11 = (uint64_t)v141[1];
    v18 = v140;
    if (v140 >= v11)
      goto LABEL_107;
  }
LABEL_38:
  v47 = v141;
  if (v32 >= v40)
    goto LABEL_58;
LABEL_41:
  if (__OFSUB__(v32, v20))
    goto LABEL_140;
  if (v32 - v20 >= v128)
    goto LABEL_58;
  if (__OFADD__(v20, v128))
    goto LABEL_143;
  if (v20 + v128 >= v40)
    v51 = v40;
  else
    v51 = v20 + v128;
  if (v51 >= v20)
  {
    if (v32 != v51)
    {
      v129 = v17;
      v130 = v51;
      v52 = *(_QWORD *)(v145 + 72);
      v53 = *(char **)(v145 + 16);
      v134 = v41;
      v135 = v53;
      v54 = v52 * (v32 - 1);
      v136 = v52;
      v144 = v32 * v52;
      do
      {
        v56 = 0;
        v140 = v32;
        v137 = (char *)v54;
        while (1)
        {
          v143 = v20;
          v57 = *v47;
          v58 = v138;
          v59 = v47;
          v60 = (void (*)(_QWORD, _QWORD, _QWORD))v135;
          ((void (*)(char *, char *, uint64_t))v135)(v138, &(*v47)[v144 + v56], v3);
          v61 = &v57[v54 + v56];
          v62 = v139;
          v60(v139, v61, v3);
          sub_23A8C6A38((unint64_t *)&qword_2569C8538, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE948]);
          LOBYTE(v57) = sub_23A8F110C();
          v63 = *(void (**)(_QWORD, _QWORD))(v145 + 8);
          v63(v62, v3);
          v63(v58, v3);
          if ((v57 & 1) == 0)
            break;
          v64 = *v59;
          if (!*v59)
            goto LABEL_145;
          v54 = (uint64_t)v137;
          v65 = &v137[(_QWORD)v64 + v56];
          v66 = *(void (**)(_QWORD, _QWORD, _QWORD))(v145 + 32);
          v66(v142, &v64[v144 + v56], v3);
          swift_arrayInitWithTakeFrontToBack();
          v66(v65, v142, v3);
          v56 -= v136;
          v20 = v143 + 1;
          v55 = v140;
          v47 = v141;
          if (v140 == v143 + 1)
            goto LABEL_51;
        }
        v55 = v140;
        v47 = v59;
        v54 = (uint64_t)v137;
LABEL_51:
        v32 = v55 + 1;
        v54 += v136;
        v144 += v136;
        v20 = v132;
      }
      while (v32 != v130);
      v32 = v130;
      v41 = v134;
      v17 = v129;
    }
    goto LABEL_58;
  }
LABEL_144:
  __break(1u);
LABEL_145:
  __break(1u);
LABEL_146:
  __break(1u);
LABEL_147:
  __break(1u);
LABEL_148:
  __break(1u);
LABEL_149:
  result = sub_23A8F1394();
  __break(1u);
  return result;
}

uint64_t sub_23A8ECB44(_QWORD *a1)
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
  uint64_t v11;
  uint64_t v12;
  uint64_t result;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  int v36;
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
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  _QWORD *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v58;
  unint64_t v59;
  char *v60;
  char *v61;
  uint64_t v62;
  unint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  char v67;
  char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  BOOL v74;
  unint64_t v75;
  char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  char *v81;
  uint64_t v82;
  uint64_t v83;
  BOOL v84;
  uint64_t v85;
  char v86;
  char *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  BOOL v91;
  uint64_t v92;
  uint64_t v93;
  char *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  char *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  unint64_t v102;
  uint64_t v103;
  char *v104;
  char *v105;
  uint64_t v106;
  char *v107;
  uint64_t v108;
  unint64_t v109;
  uint64_t v110;
  unint64_t v111;
  char *v112;
  uint64_t v113;
  uint64_t v114;
  char *v115;
  unint64_t v116;
  char *v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  unint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  _QWORD *v131;
  uint64_t v132;
  uint64_t v133;

  v2 = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569C8E68);
  v125 = *(_QWORD *)(v4 - 8);
  v126 = v4;
  v5 = MEMORY[0x24BDAC7A8](v4);
  v122 = (uint64_t)&v117 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = MEMORY[0x24BDAC7A8](v5);
  v132 = (uint64_t)&v117 - v8;
  v9 = MEMORY[0x24BDAC7A8](v7);
  v129 = (uint64_t)&v117 - v10;
  MEMORY[0x24BDAC7A8](v9);
  v128 = (uint64_t)&v117 - v11;
  v12 = a1[1];
  result = sub_23A8F13DC();
  if (result >= v12)
  {
    if (v12 < 0)
      goto LABEL_140;
    if (v12)
      return sub_23A8ED790(0, v12, 1, a1);
    return result;
  }
  if (v12 >= 0)
    v14 = v12;
  else
    v14 = v12 + 1;
  if (v12 < -1)
    goto LABEL_148;
  v119 = result;
  if (v12 < 2)
  {
    v18 = (char *)MEMORY[0x24BEE4AF8];
    v124 = MEMORY[0x24BEE4AF8]
         + ((*(unsigned __int8 *)(v125 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v125 + 80));
    v118 = MEMORY[0x24BEE4AF8];
    if (v12 != 1)
    {
      v20 = *(_QWORD *)(MEMORY[0x24BEE4AF8] + 16);
LABEL_106:
      if (v20 >= 2)
      {
        v110 = *a1;
        do
        {
          v111 = v20 - 2;
          if (v20 < 2)
            goto LABEL_135;
          if (!v110)
            goto LABEL_147;
          v112 = v18;
          v113 = *(_QWORD *)&v18[16 * v111 + 32];
          v114 = *(_QWORD *)&v18[16 * v20 + 24];
          sub_23A8EDF1C(v110 + *(_QWORD *)(v125 + 72) * v113, v110 + *(_QWORD *)(v125 + 72) * *(_QWORD *)&v18[16 * v20 + 16], v110 + *(_QWORD *)(v125 + 72) * v114, v124);
          if (v2)
            break;
          if (v114 < v113)
            goto LABEL_136;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v112 = sub_23A8EE6D4((uint64_t)v18);
          if (v111 >= *((_QWORD *)v112 + 2))
            goto LABEL_137;
          v115 = &v112[16 * v111 + 32];
          *(_QWORD *)v115 = v113;
          *((_QWORD *)v115 + 1) = v114;
          v116 = *((_QWORD *)v112 + 2);
          if (v20 > v116)
            goto LABEL_138;
          memmove(&v112[16 * v20 + 16], &v112[16 * v20 + 32], 16 * (v116 - v20));
          *((_QWORD *)v112 + 2) = v116 - 1;
          v20 = v116 - 1;
          v18 = v112;
        }
        while (v116 > 2);
      }
LABEL_117:
      swift_bridgeObjectRelease();
      *(_QWORD *)(v118 + 16) = 0;
      return swift_bridgeObjectRelease();
    }
  }
  else
  {
    v15 = v14 >> 1;
    v16 = sub_23A8F11C0();
    *(_QWORD *)(v16 + 16) = v15;
    v17 = *(unsigned __int8 *)(v125 + 80);
    v118 = v16;
    v124 = v16 + ((v17 + 32) & ~v17);
  }
  v19 = 0;
  v18 = (char *)MEMORY[0x24BEE4AF8];
  v131 = a1;
  while (1)
  {
    v21 = v19 + 1;
    v123 = v19;
    if (v19 + 1 >= v12)
    {
      v37 = v19 + 1;
      goto LABEL_58;
    }
    v120 = v2;
    v22 = *a1;
    v23 = *(_QWORD *)(v125 + 72);
    v24 = v128;
    sub_23A8C6700(*a1 + v23 * v21, v128, &qword_2569C8E68);
    v127 = v22;
    v130 = v12;
    v25 = v129;
    sub_23A8C6700(v22 + v23 * v19, v129, &qword_2569C8E68);
    v26 = sub_23A8F0C5C();
    v27 = v25;
    v28 = v130;
    sub_23A8C64C8(v27, &qword_2569C8E68);
    sub_23A8C64C8(v24, &qword_2569C8E68);
    v133 = v23;
    if (v19 + 2 >= v28)
    {
      v32 = v19 + 2;
      if ((v26 & 1) == 0)
        goto LABEL_37;
    }
    else
    {
      v29 = v23;
      v30 = v23 * v21;
      v31 = v127;
      v32 = v19 + 2;
      v33 = v29 * (v19 + 2);
      do
      {
        v34 = v128;
        sub_23A8C6700(v31 + v33, v128, &qword_2569C8E68);
        v35 = v129;
        sub_23A8C6700(v31 + v30, v129, &qword_2569C8E68);
        v36 = sub_23A8F0C5C();
        sub_23A8C64C8(v35, &qword_2569C8E68);
        sub_23A8C64C8(v34, &qword_2569C8E68);
        if (((v26 ^ v36) & 1) != 0)
        {
          v28 = v130;
          a1 = v131;
          v19 = v123;
          if ((v26 & 1) == 0)
            goto LABEL_37;
          goto LABEL_24;
        }
        v31 += v133;
        ++v32;
      }
      while (v130 != v32);
      v28 = v130;
      a1 = v131;
      v32 = v130;
      v19 = v123;
      if ((v26 & 1) == 0)
      {
LABEL_37:
        v37 = v32;
        break;
      }
    }
LABEL_24:
    v38 = v133;
    if (v32 < v19)
      goto LABEL_141;
    v37 = v32;
    if (v19 >= v32)
      break;
    v117 = v18;
    v39 = 0;
    v40 = v133 * (v32 - 1);
    v41 = v32 * v133;
    v42 = v19 * v133;
    v43 = v127;
    do
    {
      if (v19 != v37 + v39 - 1)
      {
        if (!v43)
          goto LABEL_146;
        sub_23A8C7E20(v43 + v42, v122, &qword_2569C8E68);
        if (v42 < v40 || v43 + v42 >= (unint64_t)(v43 + v41))
        {
          swift_arrayInitWithTakeFrontToBack();
        }
        else if (v42 != v40)
        {
          swift_arrayInitWithTakeBackToFront();
        }
        sub_23A8C7E20(v122, v43 + v40, &qword_2569C8E68);
        a1 = v131;
        v37 = v32;
        v38 = v133;
      }
      ++v19;
      --v39;
      v40 -= v38;
      v41 -= v38;
      v42 += v38;
    }
    while (v19 < v37 + v39);
    v18 = v117;
    v2 = v120;
    v19 = v123;
    v28 = v130;
    if (v37 < v130)
      goto LABEL_41;
LABEL_58:
    if (v37 < v19)
      goto LABEL_134;
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v130 = v37;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      v18 = sub_23A8EE3C0(0, *((_QWORD *)v18 + 2) + 1, 1, v18);
    v59 = *((_QWORD *)v18 + 2);
    v58 = *((_QWORD *)v18 + 3);
    v20 = v59 + 1;
    if (v59 >= v58 >> 1)
      v18 = sub_23A8EE3C0((char *)(v58 > 1), v59 + 1, 1, v18);
    *((_QWORD *)v18 + 2) = v20;
    v60 = v18 + 32;
    v61 = &v18[16 * v59 + 32];
    v62 = v130;
    *(_QWORD *)v61 = v19;
    *((_QWORD *)v61 + 1) = v62;
    if (v59)
    {
      while (1)
      {
        v63 = v20 - 1;
        if (v20 >= 4)
        {
          v68 = &v60[16 * v20];
          v69 = *((_QWORD *)v68 - 8);
          v70 = *((_QWORD *)v68 - 7);
          v74 = __OFSUB__(v70, v69);
          v71 = v70 - v69;
          if (v74)
            goto LABEL_123;
          v73 = *((_QWORD *)v68 - 6);
          v72 = *((_QWORD *)v68 - 5);
          v74 = __OFSUB__(v72, v73);
          v66 = v72 - v73;
          v67 = v74;
          if (v74)
            goto LABEL_124;
          v75 = v20 - 2;
          v76 = &v60[16 * v20 - 32];
          v78 = *(_QWORD *)v76;
          v77 = *((_QWORD *)v76 + 1);
          v74 = __OFSUB__(v77, v78);
          v79 = v77 - v78;
          if (v74)
            goto LABEL_126;
          v74 = __OFADD__(v66, v79);
          v80 = v66 + v79;
          if (v74)
            goto LABEL_129;
          if (v80 >= v71)
          {
            v98 = &v60[16 * v63];
            v100 = *(_QWORD *)v98;
            v99 = *((_QWORD *)v98 + 1);
            v74 = __OFSUB__(v99, v100);
            v101 = v99 - v100;
            if (v74)
              goto LABEL_133;
            v91 = v66 < v101;
            goto LABEL_95;
          }
        }
        else
        {
          if (v20 != 3)
          {
            v92 = *((_QWORD *)v18 + 4);
            v93 = *((_QWORD *)v18 + 5);
            v74 = __OFSUB__(v93, v92);
            v85 = v93 - v92;
            v86 = v74;
            goto LABEL_89;
          }
          v65 = *((_QWORD *)v18 + 4);
          v64 = *((_QWORD *)v18 + 5);
          v74 = __OFSUB__(v64, v65);
          v66 = v64 - v65;
          v67 = v74;
        }
        if ((v67 & 1) != 0)
          goto LABEL_125;
        v75 = v20 - 2;
        v81 = &v60[16 * v20 - 32];
        v83 = *(_QWORD *)v81;
        v82 = *((_QWORD *)v81 + 1);
        v84 = __OFSUB__(v82, v83);
        v85 = v82 - v83;
        v86 = v84;
        if (v84)
          goto LABEL_128;
        v87 = &v60[16 * v63];
        v89 = *(_QWORD *)v87;
        v88 = *((_QWORD *)v87 + 1);
        v74 = __OFSUB__(v88, v89);
        v90 = v88 - v89;
        if (v74)
          goto LABEL_131;
        if (__OFADD__(v85, v90))
          goto LABEL_132;
        if (v85 + v90 >= v66)
        {
          v91 = v66 < v90;
LABEL_95:
          if (v91)
            v63 = v75;
          goto LABEL_97;
        }
LABEL_89:
        if ((v86 & 1) != 0)
          goto LABEL_127;
        v94 = &v60[16 * v63];
        v96 = *(_QWORD *)v94;
        v95 = *((_QWORD *)v94 + 1);
        v74 = __OFSUB__(v95, v96);
        v97 = v95 - v96;
        if (v74)
          goto LABEL_130;
        if (v97 < v85)
          goto LABEL_14;
LABEL_97:
        v102 = v63 - 1;
        if (v63 - 1 >= v20)
        {
          __break(1u);
LABEL_120:
          __break(1u);
LABEL_121:
          __break(1u);
LABEL_122:
          __break(1u);
LABEL_123:
          __break(1u);
LABEL_124:
          __break(1u);
LABEL_125:
          __break(1u);
LABEL_126:
          __break(1u);
LABEL_127:
          __break(1u);
LABEL_128:
          __break(1u);
LABEL_129:
          __break(1u);
LABEL_130:
          __break(1u);
LABEL_131:
          __break(1u);
LABEL_132:
          __break(1u);
LABEL_133:
          __break(1u);
LABEL_134:
          __break(1u);
LABEL_135:
          __break(1u);
LABEL_136:
          __break(1u);
LABEL_137:
          __break(1u);
LABEL_138:
          __break(1u);
LABEL_139:
          __break(1u);
LABEL_140:
          __break(1u);
LABEL_141:
          __break(1u);
LABEL_142:
          __break(1u);
          goto LABEL_143;
        }
        v103 = *a1;
        if (!*a1)
          goto LABEL_145;
        v104 = v18;
        v105 = &v60[16 * v102];
        v106 = *(_QWORD *)v105;
        v107 = &v60[16 * v63];
        v108 = *((_QWORD *)v107 + 1);
        sub_23A8EDF1C(v103 + *(_QWORD *)(v125 + 72) * *(_QWORD *)v105, v103 + *(_QWORD *)(v125 + 72) * *(_QWORD *)v107, v103 + *(_QWORD *)(v125 + 72) * v108, v124);
        if (v2)
          goto LABEL_117;
        if (v108 < v106)
          goto LABEL_120;
        if (v63 > *((_QWORD *)v104 + 2))
          goto LABEL_121;
        *(_QWORD *)v105 = v106;
        *(_QWORD *)&v60[16 * v102 + 8] = v108;
        v109 = *((_QWORD *)v104 + 2);
        if (v63 >= v109)
          goto LABEL_122;
        v18 = v104;
        v20 = v109 - 1;
        memmove(&v60[16 * v63], v107 + 16, 16 * (v109 - 1 - v63));
        *((_QWORD *)v104 + 2) = v109 - 1;
        a1 = v131;
        if (v109 <= 2)
          goto LABEL_14;
      }
    }
    v20 = 1;
LABEL_14:
    v12 = a1[1];
    v19 = v130;
    if (v130 >= v12)
      goto LABEL_106;
  }
  v2 = v120;
  if (v37 >= v28)
    goto LABEL_58;
LABEL_41:
  if (__OFSUB__(v37, v19))
    goto LABEL_139;
  if (v37 - v19 >= v119)
    goto LABEL_58;
  if (__OFADD__(v19, v119))
    goto LABEL_142;
  if (v19 + v119 >= v28)
    v44 = v28;
  else
    v44 = v19 + v119;
  if (v44 >= v19)
  {
    if (v37 != v44)
    {
      v117 = v18;
      v120 = v2;
      v121 = v44;
      v45 = *(_QWORD *)(v125 + 72);
      v133 = v45 * (v37 - 1);
      v127 = v45;
      v46 = v37 * v45;
      do
      {
        v48 = 0;
        v130 = v37;
        while (1)
        {
          v49 = *a1;
          v50 = v46;
          v51 = v46 + v48 + *a1;
          v52 = a1;
          v53 = v128;
          sub_23A8C6700(v51, v128, &qword_2569C8E68);
          v54 = v129;
          sub_23A8C6700(v133 + v48 + v49, v129, &qword_2569C8E68);
          LOBYTE(v49) = sub_23A8F0C5C();
          sub_23A8C64C8(v54, &qword_2569C8E68);
          sub_23A8C64C8(v53, &qword_2569C8E68);
          if ((v49 & 1) == 0)
            break;
          v55 = *v52;
          if (!*v52)
            goto LABEL_144;
          v46 = v50;
          v56 = v55 + v133 + v48;
          sub_23A8C7E20(v55 + v50 + v48, v132, &qword_2569C8E68);
          swift_arrayInitWithTakeFrontToBack();
          sub_23A8C7E20(v132, v56, &qword_2569C8E68);
          v48 -= v127;
          ++v19;
          v47 = v130;
          a1 = v131;
          if (v130 == v19)
            goto LABEL_51;
        }
        v47 = v130;
        a1 = v52;
        v46 = v50;
LABEL_51:
        v37 = v47 + 1;
        v133 += v127;
        v46 += v127;
        v19 = v123;
      }
      while (v37 != v121);
      v37 = v121;
      v2 = v120;
      v18 = v117;
    }
    goto LABEL_58;
  }
LABEL_143:
  __break(1u);
LABEL_144:
  __break(1u);
LABEL_145:
  __break(1u);
LABEL_146:
  __break(1u);
LABEL_147:
  __break(1u);
LABEL_148:
  result = sub_23A8F1394();
  __break(1u);
  return result;
}

uint64_t sub_23A8ED518(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  void (*v19)(char *, uint64_t, uint64_t);
  char *v20;
  void (*v21)(char *, uint64_t);
  char *v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(char *, uint64_t, uint64_t);
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(char *, uint64_t, uint64_t);
  _QWORD *v30;
  char *v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  _QWORD *v36;
  uint64_t v37;
  uint64_t v38;

  v28 = a1;
  v7 = sub_23A8F0CA4();
  v36 = *(_QWORD **)(v7 - 8);
  v8 = MEMORY[0x24BDAC7A8](v7);
  v35 = (char *)&v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v32 = (char *)&v26 - v11;
  result = MEMORY[0x24BDAC7A8](v10);
  v31 = (char *)&v26 - v13;
  v34 = a3;
  v27 = a2;
  if (a3 != a2)
  {
    v14 = v36[9];
    v29 = (void (*)(char *, uint64_t, uint64_t))v36[2];
    v30 = a4;
    v38 = v14 * (v34 - 1);
    v33 = v14;
    v37 = v14 * v34;
LABEL_5:
    v15 = 0;
    v16 = v28;
    while (1)
    {
      v17 = *a4;
      v18 = v31;
      v19 = v29;
      v29(v31, v37 + v15 + *a4, v7);
      v20 = v32;
      v19(v32, v38 + v15 + v17, v7);
      sub_23A8C6A38((unint64_t *)&qword_2569C8538, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE948]);
      LOBYTE(v17) = sub_23A8F110C();
      v21 = (void (*)(char *, uint64_t))v36[1];
      v22 = v20;
      a4 = v30;
      v21(v22, v7);
      result = ((uint64_t (*)(char *, uint64_t))v21)(v18, v7);
      if ((v17 & 1) == 0)
      {
LABEL_4:
        v38 += v33;
        v37 += v33;
        if (++v34 == v27)
          return result;
        goto LABEL_5;
      }
      v23 = *a4;
      if (!*a4)
        break;
      v24 = v23 + v38 + v15;
      v25 = (void (*)(char *, uint64_t, uint64_t))v36[4];
      v25(v35, v23 + v37 + v15, v7);
      swift_arrayInitWithTakeFrontToBack();
      result = ((uint64_t (*)(uint64_t, char *, uint64_t))v25)(v24, v35, v7);
      v15 -= v33;
      if (v34 == ++v16)
        goto LABEL_4;
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_23A8ED790(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  v25 = a1;
  v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569C8E68);
  v7 = MEMORY[0x24BDAC7A8](v26);
  v30 = (uint64_t)&v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v27 = (uint64_t)&v23 - v10;
  result = MEMORY[0x24BDAC7A8](v9);
  v14 = (char *)&v23 - v13;
  v29 = a3;
  v24 = a2;
  if (a3 != a2)
  {
    v15 = *(_QWORD *)(v12 + 72);
    v32 = v15 * (v29 - 1);
    v28 = v15;
    v31 = v15 * v29;
LABEL_5:
    v16 = 0;
    v17 = v25;
    while (1)
    {
      v18 = *a4;
      sub_23A8C6700(v31 + v16 + *a4, (uint64_t)v14, &qword_2569C8E68);
      v19 = v27;
      sub_23A8C6700(v32 + v16 + v18, v27, &qword_2569C8E68);
      LOBYTE(v18) = sub_23A8F0C5C();
      sub_23A8C64C8(v19, &qword_2569C8E68);
      result = sub_23A8C64C8((uint64_t)v14, &qword_2569C8E68);
      if ((v18 & 1) == 0)
      {
LABEL_4:
        v32 += v28;
        v31 += v28;
        if (++v29 == v24)
          return result;
        goto LABEL_5;
      }
      v20 = *a4;
      if (!*a4)
        break;
      v21 = a4;
      v22 = v20 + v32 + v16;
      sub_23A8C7E20(v20 + v31 + v16, v30, &qword_2569C8E68);
      swift_arrayInitWithTakeFrontToBack();
      result = sub_23A8C7E20(v30, v22, &qword_2569C8E68);
      v16 -= v28;
      ++v17;
      a4 = v21;
      if (v29 == v17)
        goto LABEL_4;
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_23A8ED9C8(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void (*v19)(char *, unint64_t, uint64_t);
  unint64_t v20;
  char *v21;
  char *v22;
  char v23;
  void (*v24)(char *, uint64_t);
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v30;
  char *v31;
  void (*v32)(char *, unint64_t, uint64_t);
  unint64_t v33;
  uint64_t v34;
  char *v35;
  void (*v36)(char *, uint64_t);
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  unint64_t v40;
  uint64_t result;
  uint64_t v42;
  void (*v43)(char *, unint64_t, uint64_t);
  _QWORD *v44;
  unint64_t v45;
  unint64_t v46;
  char *v47;
  char *v48;
  uint64_t v49;
  unint64_t v50;
  unint64_t v51;
  unint64_t v52;

  v8 = sub_23A8F0CA4();
  v9 = *(_QWORD **)(v8 - 8);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v48 = (char *)&v42 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v47 = (char *)&v42 - v12;
  v49 = v9[9];
  if (!v49)
  {
    __break(1u);
LABEL_62:
    __break(1u);
LABEL_63:
    __break(1u);
    goto LABEL_64;
  }
  if (a2 - a1 == 0x8000000000000000 && v49 == -1)
    goto LABEL_62;
  v13 = a3 - a2;
  if (a3 - a2 == 0x8000000000000000 && v49 == -1)
    goto LABEL_63;
  v14 = (uint64_t)(a2 - a1) / v49;
  v52 = a1;
  v51 = a4;
  v15 = v13 / v49;
  if (v14 >= v13 / v49)
  {
    if ((v15 & 0x8000000000000000) == 0)
    {
      v17 = v15 * v49;
      if (a4 < a2 || a2 + v17 <= a4)
      {
        swift_arrayInitWithTakeFrontToBack();
      }
      else if (a4 != a2)
      {
        swift_arrayInitWithTakeBackToFront();
      }
      v28 = a4 + v17;
      v50 = a4 + v17;
      v52 = a2;
      if (v17 >= 1 && a1 < a2)
      {
        v30 = -v49;
        v43 = (void (*)(char *, unint64_t, uint64_t))v9[2];
        v44 = v9;
        v45 = a4;
        v46 = a1;
        do
        {
          v49 = a3 + v30;
          v31 = v47;
          v32 = v43;
          v43(v47, v28 + v30, v8);
          v33 = a2 + v30;
          v34 = v30;
          v35 = v48;
          v32(v48, v33, v8);
          sub_23A8C6A38((unint64_t *)&qword_2569C8538, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE948]);
          LOBYTE(v32) = sub_23A8F110C();
          v36 = (void (*)(char *, uint64_t))v9[1];
          v36(v35, v8);
          v36(v31, v8);
          if ((v32 & 1) != 0)
          {
            v30 = v34;
            v37 = v49;
            if (a3 < a2 || v49 >= a2)
            {
              swift_arrayInitWithTakeFrontToBack();
              v9 = v44;
              v38 = v45;
              v39 = v46;
            }
            else
            {
              v9 = v44;
              v38 = v45;
              v39 = v46;
              if (a3 != a2)
                swift_arrayInitWithTakeBackToFront();
            }
            v52 += v30;
          }
          else
          {
            v40 = v50;
            v50 += v34;
            v30 = v34;
            v37 = v49;
            if (a3 < v40 || v49 >= v40)
            {
              swift_arrayInitWithTakeFrontToBack();
              v33 = a2;
              v9 = v44;
              v38 = v45;
              v39 = v46;
            }
            else
            {
              v9 = v44;
              v38 = v45;
              v39 = v46;
              if (a3 != v40)
                swift_arrayInitWithTakeBackToFront();
              v33 = a2;
            }
          }
          v28 = v50;
          if (v50 <= v38)
            break;
          a2 = v33;
          a3 = v37;
        }
        while (v33 > v39);
      }
      goto LABEL_60;
    }
  }
  else if ((v14 & 0x8000000000000000) == 0)
  {
    v16 = v14 * v49;
    if (a4 < a1 || a1 + v16 <= a4)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (a4 != a1)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    v46 = a4 + v16;
    v50 = a4 + v16;
    if (v16 >= 1 && a2 < a3)
    {
      v19 = (void (*)(char *, unint64_t, uint64_t))v9[2];
      do
      {
        v20 = a3;
        v21 = v47;
        v19(v47, a2, v8);
        v22 = v48;
        v19(v48, a4, v8);
        sub_23A8C6A38((unint64_t *)&qword_2569C8538, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE948]);
        v23 = sub_23A8F110C();
        v24 = (void (*)(char *, uint64_t))v9[1];
        v24(v22, v8);
        v24(v21, v8);
        v25 = v52;
        if ((v23 & 1) != 0)
        {
          v26 = a2 + v49;
          if (v52 < a2 || v52 >= v26)
          {
            swift_arrayInitWithTakeFrontToBack();
            a3 = v20;
          }
          else
          {
            a3 = v20;
            if (v52 == a2)
              v25 = a2;
            else
              swift_arrayInitWithTakeBackToFront();
          }
        }
        else
        {
          v27 = v51 + v49;
          if (v52 < v51 || v52 >= v27)
          {
            swift_arrayInitWithTakeFrontToBack();
            a3 = v20;
          }
          else
          {
            a3 = v20;
            if (v52 != v51)
              swift_arrayInitWithTakeBackToFront();
          }
          v51 = v27;
          v26 = a2;
        }
        v52 = v25 + v49;
        a4 = v51;
        if (v51 >= v46)
          break;
        a2 = v26;
      }
      while (v26 < a3);
    }
LABEL_60:
    sub_23A8EE4B8(&v52, &v51, (uint64_t *)&v50);
    return 1;
  }
LABEL_64:
  result = sub_23A8F13C4();
  __break(1u);
  return result;
}

uint64_t sub_23A8EDF1C(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  int64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;
  char v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char v33;
  uint64_t v34;
  BOOL v35;
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;
  uint64_t result;
  uint64_t v40;
  unint64_t v41;
  unint64_t v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  unint64_t v46;
  unint64_t v47;

  v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569C8E68);
  v8 = MEMORY[0x24BDAC7A8](v43);
  v44 = (uint64_t)&v40 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v40 - v10;
  v13 = *(_QWORD *)(v12 + 72);
  if (!v13)
  {
    __break(1u);
LABEL_62:
    __break(1u);
LABEL_63:
    __break(1u);
    goto LABEL_64;
  }
  if (a2 - a1 == 0x8000000000000000 && v13 == -1)
    goto LABEL_62;
  v14 = a3 - a2;
  if (a3 - a2 == 0x8000000000000000 && v13 == -1)
    goto LABEL_63;
  v15 = (uint64_t)(a2 - a1) / v13;
  v47 = a1;
  v46 = a4;
  v16 = v14 / v13;
  if (v15 >= v14 / v13)
  {
    if ((v16 & 0x8000000000000000) == 0)
    {
      v18 = v16 * v13;
      if (a4 < a2 || a2 + v18 <= a4)
      {
        swift_arrayInitWithTakeFrontToBack();
      }
      else if (a4 != a2)
      {
        swift_arrayInitWithTakeBackToFront();
      }
      v25 = a4 + v18;
      v45 = a4 + v18;
      v47 = a2;
      if (v18 >= 1 && a1 < a2)
      {
        v27 = -v13;
        v41 = a4;
        v42 = a1;
        do
        {
          v28 = a3 + v27;
          sub_23A8C6700(v25 + v27, (uint64_t)v11, &qword_2569C8E68);
          v29 = a2 + v27;
          v30 = a3;
          v31 = (uint64_t)v11;
          v32 = v44;
          sub_23A8C6700(a2 + v27, v44, &qword_2569C8E68);
          v33 = sub_23A8F0C5C();
          v34 = v32;
          v11 = (char *)v31;
          sub_23A8C64C8(v34, &qword_2569C8E68);
          sub_23A8C64C8(v31, &qword_2569C8E68);
          if ((v33 & 1) != 0)
          {
            if (v30 < a2 || v28 >= a2)
            {
              swift_arrayInitWithTakeFrontToBack();
              v37 = v41;
              v36 = v42;
            }
            else
            {
              v35 = v30 == a2;
              v37 = v41;
              v36 = v42;
              if (!v35)
                swift_arrayInitWithTakeBackToFront();
            }
            v47 += v27;
          }
          else
          {
            v38 = v45;
            v45 += v27;
            if (v30 < v38 || v28 >= v38)
            {
              swift_arrayInitWithTakeFrontToBack();
              v29 = a2;
              v37 = v41;
              v36 = v42;
            }
            else
            {
              v35 = v30 == v38;
              v37 = v41;
              v36 = v42;
              if (!v35)
                swift_arrayInitWithTakeBackToFront();
              v29 = a2;
            }
          }
          v25 = v45;
          if (v45 <= v37)
            break;
          a2 = v29;
          a3 = v28;
        }
        while (v29 > v36);
      }
      goto LABEL_60;
    }
  }
  else if ((v15 & 0x8000000000000000) == 0)
  {
    v17 = v15 * v13;
    if (a4 < a1 || a1 + v17 <= a4)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (a4 != a1)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    v42 = a4 + v17;
    v45 = a4 + v17;
    if (v17 >= 1 && a2 < a3)
    {
      v20 = v44;
      do
      {
        sub_23A8C6700(a2, (uint64_t)v11, &qword_2569C8E68);
        sub_23A8C6700(a4, v20, &qword_2569C8E68);
        v21 = sub_23A8F0C5C();
        sub_23A8C64C8(v20, &qword_2569C8E68);
        sub_23A8C64C8((uint64_t)v11, &qword_2569C8E68);
        v22 = v47;
        if ((v21 & 1) != 0)
        {
          v23 = a2 + v13;
          if (v47 < a2 || v47 >= v23)
          {
            swift_arrayInitWithTakeFrontToBack();
          }
          else if (v47 == a2)
          {
            v22 = a2;
          }
          else
          {
            swift_arrayInitWithTakeBackToFront();
          }
        }
        else
        {
          v24 = v46 + v13;
          if (v47 < v46 || v47 >= v24)
          {
            swift_arrayInitWithTakeFrontToBack();
          }
          else if (v47 != v46)
          {
            swift_arrayInitWithTakeBackToFront();
          }
          v46 = v24;
          v23 = a2;
        }
        v47 = v22 + v13;
        a4 = v46;
        if (v46 >= v42)
          break;
        a2 = v23;
      }
      while (v23 < a3);
    }
LABEL_60:
    sub_23A8EE5C4(&v47, &v46, (uint64_t *)&v45);
    return 1;
  }
LABEL_64:
  result = sub_23A8F13C4();
  __break(1u);
  return result;
}

char *sub_23A8EE3C0(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2569C8E78);
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
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8])
      memmove(v13, v14, 16 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 16 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_23A8EE4B8(unint64_t *a1, unint64_t *a2, uint64_t *a3)
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  uint64_t v8;

  v3 = *a1;
  v4 = *a2;
  v5 = *a3;
  result = sub_23A8F0CA4();
  v7 = *(_QWORD *)(*(_QWORD *)(result - 8) + 72);
  if (!v7)
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v8 = v5 - v4;
  if (v5 - v4 == 0x8000000000000000 && v7 == -1)
    goto LABEL_14;
  if (v8 / v7 < 0)
  {
LABEL_15:
    result = sub_23A8F13C4();
    __break(1u);
    return result;
  }
  if (v3 < v4 || v3 >= v4 + v8 / v7 * v7)
    return swift_arrayInitWithTakeFrontToBack();
  if (v3 != v4)
    return swift_arrayInitWithTakeBackToFront();
  return result;
}

uint64_t sub_23A8EE5C4(unint64_t *a1, unint64_t *a2, uint64_t *a3)
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  uint64_t v8;

  v3 = *a1;
  v4 = *a2;
  v5 = *a3;
  result = __swift_instantiateConcreteTypeFromMangledName(&qword_2569C8E68);
  v7 = *(_QWORD *)(*(_QWORD *)(result - 8) + 72);
  if (!v7)
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v8 = v5 - v4;
  if (v5 - v4 == 0x8000000000000000 && v7 == -1)
    goto LABEL_14;
  if (v8 / v7 < 0)
  {
LABEL_15:
    result = sub_23A8F13C4();
    __break(1u);
    return result;
  }
  if (v3 < v4 || v3 >= v4 + v8 / v7 * v7)
    return swift_arrayInitWithTakeFrontToBack();
  if (v3 != v4)
    return swift_arrayInitWithTakeBackToFront();
  return result;
}

char *sub_23A8EE6D4(uint64_t a1)
{
  return sub_23A8EE3C0(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_23A8EE6E8(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t result;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  int64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  int64_t v26;
  unint64_t v27;
  int64_t v28;
  uint64_t v29;
  void (*v30)(char *, char *, uint64_t);
  _QWORD *v31;
  uint64_t v32;
  uint64_t v33;
  int64_t v34;
  _QWORD *v35;
  uint64_t v36;
  uint64_t v37;
  int64_t v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;

  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542D8CF8);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v33 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_23A8F0CA4();
  v41 = *(_QWORD *)(v11 - 8);
  result = MEMORY[0x24BDAC7A8](v11);
  v40 = (char *)&v33 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v42 = a4;
  v15 = a4 + 56;
  v14 = *(_QWORD *)(a4 + 56);
  v16 = -1 << *(_BYTE *)(a4 + 32);
  v35 = a1;
  v36 = v16;
  v17 = -v16;
  if (v17 < 64)
    v18 = ~(-1 << v17);
  else
    v18 = -1;
  v19 = v18 & v14;
  if (!a2)
  {
    v20 = 0;
    v21 = 0;
LABEL_39:
    v31 = v35;
    v32 = ~v36;
    *v35 = v42;
    v31[1] = v15;
    v31[2] = v32;
    v31[3] = v20;
    v31[4] = v19;
    return v21;
  }
  if (!a3)
  {
    v20 = 0;
    v21 = 0;
    goto LABEL_39;
  }
  if (a3 < 0)
    goto LABEL_41;
  v20 = 0;
  v21 = 0;
  v37 = a4 + 56;
  v38 = (unint64_t)(63 - v36) >> 6;
  v34 = v38 - 1;
  v39 = a3;
  v22 = v40;
  v23 = v41;
  if (!v19)
    goto LABEL_9;
LABEL_8:
  v24 = __clz(__rbit64(v19));
  v19 &= v19 - 1;
  v25 = v24 | (v20 << 6);
  while (1)
  {
    v29 = *(_QWORD *)(v23 + 72);
    (*(void (**)(char *, unint64_t, uint64_t))(v23 + 16))(v10, *(_QWORD *)(v42 + 48) + v29 * v25, v11);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v23 + 56))(v10, 0, 1, v11);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v23 + 48))(v10, 1, v11) == 1)
    {
      v15 = v37;
      goto LABEL_38;
    }
    ++v21;
    v30 = *(void (**)(char *, char *, uint64_t))(v23 + 32);
    v30(v22, v10, v11);
    result = ((uint64_t (*)(uint64_t, char *, uint64_t))v30)(a2, v22, v11);
    if (v21 == v39)
    {
      v21 = v39;
      v15 = v37;
      goto LABEL_39;
    }
    a2 += v29;
    v23 = v41;
    if (v19)
      goto LABEL_8;
LABEL_9:
    v26 = v20 + 1;
    if (__OFADD__(v20, 1))
      break;
    v15 = v37;
    if (v26 >= v38)
      goto LABEL_37;
    v27 = *(_QWORD *)(v37 + 8 * v26);
    if (!v27)
    {
      v28 = v20 + 2;
      ++v20;
      if (v26 + 1 >= v38)
        goto LABEL_37;
      v27 = *(_QWORD *)(v37 + 8 * v28);
      if (v27)
        goto LABEL_14;
      v20 = v26 + 1;
      if (v26 + 2 >= v38)
        goto LABEL_37;
      v27 = *(_QWORD *)(v37 + 8 * (v26 + 2));
      if (v27)
      {
        v26 += 2;
      }
      else
      {
        v20 = v26 + 2;
        if (v26 + 3 >= v38)
          goto LABEL_37;
        v27 = *(_QWORD *)(v37 + 8 * (v26 + 3));
        if (!v27)
        {
          v28 = v26 + 4;
          v20 = v26 + 3;
          if (v26 + 4 < v38)
          {
            v27 = *(_QWORD *)(v37 + 8 * v28);
            if (!v27)
            {
              while (1)
              {
                v26 = v28 + 1;
                if (__OFADD__(v28, 1))
                  goto LABEL_42;
                if (v26 >= v38)
                {
                  v20 = v34;
                  goto LABEL_37;
                }
                v27 = *(_QWORD *)(v37 + 8 * v26);
                ++v28;
                if (v27)
                  goto LABEL_21;
              }
            }
LABEL_14:
            v26 = v28;
            goto LABEL_21;
          }
LABEL_37:
          (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v23 + 56))(v10, 1, 1, v11);
          v19 = 0;
LABEL_38:
          sub_23A8C64C8((uint64_t)v10, &qword_2542D8CF8);
          goto LABEL_39;
        }
        v26 += 3;
      }
    }
LABEL_21:
    v19 = (v27 - 1) & v27;
    v25 = __clz(__rbit64(v27)) + (v26 << 6);
    v20 = v26;
  }
  __break(1u);
LABEL_41:
  __break(1u);
LABEL_42:
  __break(1u);
  return result;
}

uint64_t sub_23A8EEA38(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t result;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  int64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  int64_t v24;
  unint64_t v25;
  int64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  int64_t v33;
  uint64_t v34;
  _QWORD *v35;
  int64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;

  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569C8E68);
  v38 = *(_QWORD *)(v8 - 8);
  v39 = v8;
  v9 = MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v32 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = MEMORY[0x24BDAC7A8](v9);
  v14 = (char *)&v32 - v13;
  v15 = *(_QWORD *)(a4 + 64);
  v37 = a4 + 64;
  v16 = -1 << *(_BYTE *)(a4 + 32);
  if (-v16 < 64)
    v17 = ~(-1 << -(char)v16);
  else
    v17 = -1;
  v18 = v17 & v15;
  if (!a2)
  {
    v19 = 0;
    a3 = 0;
LABEL_39:
    v31 = v37;
    *a1 = a4;
    a1[1] = v31;
    a1[2] = ~v16;
    a1[3] = v19;
    a1[4] = v18;
    return a3;
  }
  if (!a3)
  {
    v19 = 0;
    goto LABEL_39;
  }
  if (a3 < 0)
    goto LABEL_41;
  v34 = -1 << *(_BYTE *)(a4 + 32);
  v35 = a1;
  v19 = 0;
  v20 = 0;
  v36 = (unint64_t)(63 - v16) >> 6;
  v33 = v36 - 1;
  v21 = a3;
  if (!v18)
    goto LABEL_9;
LABEL_8:
  v22 = __clz(__rbit64(v18));
  v18 &= v18 - 1;
  v23 = v22 | (v19 << 6);
  while (1)
  {
    ++v20;
    v27 = *(_QWORD *)(a4 + 48);
    v28 = sub_23A8F0CA4();
    (*(void (**)(char *, unint64_t, uint64_t))(*(_QWORD *)(v28 - 8) + 16))(v11, v27 + *(_QWORD *)(*(_QWORD *)(v28 - 8) + 72) * v23, v28);
    v29 = *(_QWORD *)(a4 + 56);
    v30 = sub_23A8F0E3C();
    (*(void (**)(char *, unint64_t, uint64_t))(*(_QWORD *)(v30 - 8) + 16))(&v11[*(int *)(v39 + 48)], v29 + *(_QWORD *)(*(_QWORD *)(v30 - 8) + 72) * v23, v30);
    sub_23A8C7E20((uint64_t)v11, (uint64_t)v14, &qword_2569C8E68);
    result = sub_23A8C7E20((uint64_t)v14, a2, &qword_2569C8E68);
    if (v20 == v21)
    {
      a3 = v21;
      goto LABEL_38;
    }
    a2 += *(_QWORD *)(v38 + 72);
    if (v18)
      goto LABEL_8;
LABEL_9:
    v24 = v19 + 1;
    if (__OFADD__(v19, 1))
      break;
    if (v24 >= v36)
      goto LABEL_33;
    v25 = *(_QWORD *)(v37 + 8 * v24);
    if (!v25)
    {
      v19 += 2;
      if (v24 + 1 >= v36)
      {
        v18 = 0;
        v19 = v24;
      }
      else
      {
        v25 = *(_QWORD *)(v37 + 8 * v19);
        if (v25)
          goto LABEL_14;
        v26 = v24 + 2;
        if (v24 + 2 >= v36)
          goto LABEL_33;
        v25 = *(_QWORD *)(v37 + 8 * v26);
        if (v25)
        {
LABEL_17:
          v24 = v26;
          goto LABEL_18;
        }
        v19 = v24 + 3;
        if (v24 + 3 < v36)
        {
          v25 = *(_QWORD *)(v37 + 8 * v19);
          if (v25)
          {
LABEL_14:
            v24 = v19;
            goto LABEL_18;
          }
          v26 = v24 + 4;
          if (v24 + 4 >= v36)
          {
LABEL_33:
            v18 = 0;
            goto LABEL_37;
          }
          v25 = *(_QWORD *)(v37 + 8 * v26);
          if (!v25)
          {
            while (1)
            {
              v24 = v26 + 1;
              if (__OFADD__(v26, 1))
                goto LABEL_42;
              if (v24 >= v36)
              {
                v18 = 0;
                v19 = v33;
                goto LABEL_37;
              }
              v25 = *(_QWORD *)(v37 + 8 * v24);
              ++v26;
              if (v25)
                goto LABEL_18;
            }
          }
          goto LABEL_17;
        }
        v18 = 0;
        v19 = v24 + 2;
      }
LABEL_37:
      a3 = v20;
LABEL_38:
      v16 = v34;
      a1 = v35;
      goto LABEL_39;
    }
LABEL_18:
    v18 = (v25 - 1) & v25;
    v23 = __clz(__rbit64(v25)) + (v24 << 6);
    v19 = v24;
  }
  __break(1u);
LABEL_41:
  __break(1u);
LABEL_42:
  __break(1u);
  return result;
}

uint64_t sub_23A8EED48(_QWORD *a1)
{
  return sub_23A8EBDE8(0, a1[2], 0, a1, &qword_2569C87D8, (uint64_t (*)(_QWORD))MEMORY[0x24BDCE900]);
}

uint64_t sub_23A8EED7C(_QWORD *a1)
{
  return sub_23A8EBBEC(0, a1[2], 0, a1);
}

uint64_t sub_23A8EED90(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for EnergySite.EnergyUsage(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_23A8EEDD4()
{
  return swift_release();
}

uint64_t sub_23A8EEDE0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  _QWORD *v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v3 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2569C8E80) - 8);
  v4 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v5 = v4 + *(_QWORD *)(v3 + 64);
  v6 = *(_QWORD *)(sub_23A8F0CA4() - 8);
  v7 = *(unsigned __int8 *)(v6 + 80);
  v8 = (v5 + v7 + 1) & ~v7;
  v9 = *(_QWORD *)(v6 + 64);
  v10 = (v9 + v7 + v8) & ~v7;
  v11 = (v9 + v10 + 7) & 0xFFFFFFFFFFFFFFF8;
  sub_23A8F0D58();
  v17 = *(_QWORD *)(v1 + 24);
  v18 = *(_QWORD *)(v1 + 16);
  v12 = v1 + v4;
  v20 = v1 + v8;
  v19 = v1 + v10;
  v13 = *(_QWORD *)(v1 + v11);
  v14 = *(_BYTE *)(v1 + v5);
  v15 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v15;
  *v15 = v2;
  v15[1] = sub_23A8C4ED0;
  return sub_23A8EB304(a1, v18, v17, v12, v14, v20, v19, v13);
}

uint64_t objectdestroyTm_2()
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
  unint64_t v11;
  void (*v12)(uint64_t, uint64_t);
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569C8E80);
  v1 = *(_QWORD *)(v16 - 8);
  v2 = *(unsigned __int8 *)(v1 + 80);
  v3 = *(_QWORD *)(v1 + 64);
  v4 = sub_23A8F0CA4();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(unsigned __int8 *)(v5 + 80);
  v7 = (v3 + v6 + ((v2 + 32) & ~v2) + 1) & ~v6;
  v8 = *(_QWORD *)(v5 + 64);
  v9 = (v8 + v6 + v7) & ~v6;
  v14 = (((v8 + v9 + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8;
  v15 = sub_23A8F0D58();
  v10 = *(_QWORD *)(v15 - 8);
  v11 = (*(unsigned __int8 *)(v10 + 80) + v14 + 16) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  swift_unknownObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v1 + 8))(v0 + ((v2 + 32) & ~v2), v16);
  v12 = *(void (**)(uint64_t, uint64_t))(v5 + 8);
  v12(v0 + v7, v4);
  v12(v0 + v9, v4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(unint64_t, uint64_t))(v10 + 8))(v0 + v11, v15);
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23A8EF0C0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  _QWORD *v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v3 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2569C8E80) - 8);
  v4 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v5 = v4 + *(_QWORD *)(v3 + 64);
  v6 = *(_QWORD *)(sub_23A8F0CA4() - 8);
  v7 = *(unsigned __int8 *)(v6 + 80);
  v8 = (v5 + v7 + 1) & ~v7;
  v9 = *(_QWORD *)(v6 + 64);
  v10 = (v9 + v7 + v8) & ~v7;
  v11 = (v9 + v10 + 7) & 0xFFFFFFFFFFFFFFF8;
  sub_23A8F0D58();
  v17 = *(_QWORD *)(v1 + 24);
  v18 = *(_QWORD *)(v1 + 16);
  v12 = v1 + v4;
  v20 = v1 + v8;
  v19 = v1 + v10;
  v13 = *(_QWORD *)(v1 + v11);
  v14 = *(_BYTE *)(v1 + v5);
  v15 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v15;
  *v15 = v2;
  v15[1] = sub_23A8C8720;
  return sub_23A8EAC08(a1, v18, v17, v12, v14, v20, v19, v13);
}

uint64_t objectdestroy_7Tm()
{
  uint64_t v0;
  uint64_t v1;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569C8E80);
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)), v1);
  return swift_deallocObject();
}

uint64_t sub_23A8EF284(void *a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(unsigned __int8 *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2569C8E80) - 8) + 80);
  return sub_23A8EB6F0(a1, v1 + ((v3 + 16) & ~v3));
}

unint64_t sub_23A8EF2CC()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t inited;
  uint64_t v10;
  unint64_t v11;
  char isUniquelyReferenced_nonNull_native;
  char v13;
  _OWORD v15[2];
  __int128 v16;
  uint64_t v17;

  v2 = *v0;
  v1 = v0[1];
  v4 = v0[2];
  v3 = v0[3];
  v6 = v0[4];
  v5 = v0[5];
  v8 = v0[6];
  v7 = v0[7];
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569C8EB8);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_23A8F2230;
  *(_QWORD *)(inited + 32) = 0x656C746974;
  *(_QWORD *)(inited + 40) = 0xE500000000000000;
  v10 = MEMORY[0x24BEE0D00];
  *(_QWORD *)(inited + 48) = v2;
  *(_QWORD *)(inited + 56) = v1;
  *(_QWORD *)(inited + 72) = v10;
  *(_QWORD *)(inited + 80) = 2036625250;
  *(_QWORD *)(inited + 120) = v10;
  *(_QWORD *)(inited + 88) = 0xE400000000000000;
  *(_QWORD *)(inited + 96) = v4;
  *(_QWORD *)(inited + 104) = v3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v11 = sub_23A8B8724(inited);
  if (v5)
  {
    v17 = v10;
    *(_QWORD *)&v16 = v6;
    *((_QWORD *)&v16 + 1) = v5;
    sub_23A8C62C8(&v16, v15);
    swift_bridgeObjectRetain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    sub_23A8DBF5C(v15, 0x4C5255706174, 0xE600000000000000, isUniquelyReferenced_nonNull_native);
    swift_bridgeObjectRelease();
  }
  if (v7)
  {
    v17 = v10;
    *(_QWORD *)&v16 = v8;
    *((_QWORD *)&v16 + 1) = v7;
    sub_23A8C62C8(&v16, v15);
    swift_bridgeObjectRetain();
    v13 = swift_isUniquelyReferenced_nonNull_native();
    sub_23A8DBF5C(v15, 0x4449656D6F68, 0xE600000000000000, v13);
    swift_bridgeObjectRelease();
  }
  return v11;
}

uint64_t HomeEnergyNotificationStatus.description.getter(uint64_t a1)
{
  uint64_t result;

  result = 0xD000000000000025;
  switch(a1)
  {
    case 0:
    case 1:
      return result;
    case 2:
      result = 0xD00000000000003ALL;
      break;
    case 3:
      result = 0xD000000000000037;
      break;
    default:
      result = sub_23A8F140C();
      __break(1u);
      break;
  }
  return result;
}

unint64_t HomeEnergyNotificationStatus.init(rawValue:)(unint64_t a1)
{
  return sub_23A8EF55C(a1);
}

unint64_t sub_23A8EF508@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result;
  char v4;

  result = sub_23A8EF55C(*a1);
  *(_QWORD *)a2 = result;
  *(_BYTE *)(a2 + 8) = v4 & 1;
  return result;
}

uint64_t sub_23A8EF538()
{
  uint64_t *v0;

  return HomeEnergyNotificationStatus.description.getter(*v0);
}

void __swiftcall HomeEnergyNotificationContext.init(title:body:tapURL:homeID:seriesNotifications:)(EnergyKit::HomeEnergyNotificationContext *__return_ptr retstr, Swift::String title, Swift::String body, Swift::String_optional tapURL, Swift::String_optional homeID, Swift::Bool seriesNotifications)
{
  retstr->title = title;
  retstr->body = body;
  retstr->tapURL = tapURL;
  retstr->homeID = homeID;
  retstr->seriesNotifications = seriesNotifications;
}

unint64_t sub_23A8EF55C(unint64_t result)
{
  if (result > 3)
    return 0;
  return result;
}

unint64_t sub_23A8EF570()
{
  unint64_t result;

  result = qword_2569C8EB0;
  if (!qword_2569C8EB0)
  {
    result = MEMORY[0x23B85B498](&protocol conformance descriptor for HomeEnergyNotificationStatus, &type metadata for HomeEnergyNotificationStatus);
    atomic_store(result, (unint64_t *)&qword_2569C8EB0);
  }
  return result;
}

ValueMetadata *type metadata accessor for HomeEnergyNotificationStatus()
{
  return &type metadata for HomeEnergyNotificationStatus;
}

uint64_t initializeBufferWithCopyOfBuffer for HomeEnergyNotificationContext(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for HomeEnergyNotificationContext()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for HomeEnergyNotificationContext(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

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
  *(_BYTE *)(a1 + 64) = *(_BYTE *)(a2 + 64);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for HomeEnergyNotificationContext(uint64_t a1, uint64_t a2)
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
  *(_BYTE *)(a1 + 64) = *(_BYTE *)(a2 + 64);
  return a1;
}

__n128 __swift_memcpy65_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  result = *(__n128 *)(a2 + 16);
  v3 = *(_OWORD *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 48);
  *(_BYTE *)(a1 + 64) = *(_BYTE *)(a2 + 64);
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)(a1 + 16) = result;
  return result;
}

uint64_t assignWithTake for HomeEnergyNotificationContext(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

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
  *(_BYTE *)(a1 + 64) = *(_BYTE *)(a2 + 64);
  return a1;
}

uint64_t getEnumTagSinglePayload for HomeEnergyNotificationContext(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 65))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for HomeEnergyNotificationContext(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 64) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 65) = 1;
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
    *(_BYTE *)(result + 65) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for HomeEnergyNotificationContext()
{
  return &type metadata for HomeEnergyNotificationContext;
}

uint64_t sub_23A8EF888()
{
  uint64_t v0;
  id v1;
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t);
  void *v21;
  uint64_t (*v22)();
  uint64_t v23;

  *(_QWORD *)(v0 + 16) = 0;
  v1 = objc_allocWithZone(MEMORY[0x24BDD1988]);
  v2 = (void *)sub_23A8F1130();
  v3 = objc_msgSend(v1, sel_initWithMachServiceName_options_, v2, 0);

  v4 = *(void **)(v0 + 16);
  *(_QWORD *)(v0 + 16) = v3;

  v5 = *(void **)(v0 + 16);
  if (v5)
  {
    v6 = (void *)objc_opt_self();
    v7 = v5;
    v8 = objc_msgSend(v6, sel_interfaceWithProtocol_, &unk_2569CC010);
    objc_msgSend(v7, sel_setRemoteObjectInterface_, v8);

    v9 = *(void **)(v0 + 16);
    if (v9)
    {
      v22 = sub_23A8F04E4;
      v23 = v0;
      v10 = MEMORY[0x24BDAC760];
      v18 = MEMORY[0x24BDAC760];
      v19 = 1107296256;
      v20 = sub_23A8EFA94;
      v21 = &block_descriptor_9;
      v11 = _Block_copy(&v18);
      v12 = v9;
      swift_retain();
      swift_release();
      objc_msgSend(v12, sel_setInterruptionHandler_, v11);
      _Block_release(v11);

      v13 = *(void **)(v0 + 16);
      if (v13)
      {
        v22 = sub_23A8F0504;
        v23 = v0;
        v18 = v10;
        v19 = 1107296256;
        v20 = sub_23A8EFA94;
        v21 = &block_descriptor_12;
        v14 = _Block_copy(&v18);
        swift_retain();
        v15 = v13;
        swift_release();
        objc_msgSend(v15, sel_setInvalidationHandler_, v14);
        _Block_release(v14);

        v16 = *(void **)(v0 + 16);
        if (v16)
          objc_msgSend(v16, sel_resume);
      }
    }
  }
  return v0;
}

uint64_t sub_23A8EFA94(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

id sub_23A8EFAC0()
{
  uint64_t v0;
  void *v1;
  void *v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t);
  void *v23;
  uint64_t (*v24)();
  uint64_t v25;

  v1 = *(void **)(v0 + 16);
  if (v1)
  {
    objc_msgSend(v1, sel_suspend);
    v2 = *(void **)(v0 + 16);
    *(_QWORD *)(v0 + 16) = 0;

  }
  v3 = objc_allocWithZone(MEMORY[0x24BDD1988]);
  v4 = (void *)sub_23A8F1130();
  v5 = objc_msgSend(v3, sel_initWithMachServiceName_options_, v4, 0);

  v6 = *(void **)(v0 + 16);
  *(_QWORD *)(v0 + 16) = v5;

  v7 = *(void **)(v0 + 16);
  if (!v7)
    goto LABEL_7;
  v8 = (void *)objc_opt_self();
  v9 = v7;
  v10 = objc_msgSend(v8, sel_interfaceWithProtocol_, &unk_2569CC010);
  objc_msgSend(v9, sel_setRemoteObjectInterface_, v10);

  v11 = *(void **)(v0 + 16);
  if (!v11)
    goto LABEL_7;
  v24 = sub_23A8F04E4;
  v25 = v0;
  v12 = MEMORY[0x24BDAC760];
  v20 = MEMORY[0x24BDAC760];
  v21 = 1107296256;
  v22 = sub_23A8EFA94;
  v23 = &block_descriptor_3;
  v13 = _Block_copy(&v20);
  v14 = v11;
  swift_retain();
  swift_release();
  objc_msgSend(v14, sel_setInterruptionHandler_, v13);
  _Block_release(v13);

  v15 = *(void **)(v0 + 16);
  if (v15)
  {
    v24 = sub_23A8F0504;
    v25 = v0;
    v20 = v12;
    v21 = 1107296256;
    v22 = sub_23A8EFA94;
    v23 = &block_descriptor_6;
    v16 = _Block_copy(&v20);
    swift_retain();
    v17 = v15;
    swift_release();
    objc_msgSend(v17, sel_setInvalidationHandler_, v16);
    _Block_release(v16);

    v18 = *(void **)(v0 + 16);
  }
  else
  {
LABEL_7:
    v18 = 0;
  }
  return objc_msgSend(v18, sel_resume);
}

uint64_t sub_23A8EFCE8(uint64_t a1, const char *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  uint64_t v12;

  v3 = sub_23A8F10A0();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2542D8828 != -1)
    swift_once();
  v7 = __swift_project_value_buffer(v3, (uint64_t)qword_2542D8DE0);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v7, v3);
  v8 = sub_23A8F1088();
  v9 = sub_23A8F1274();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_23A8AD000, v8, v9, a2, v10, 2u);
    MEMORY[0x23B85B51C](v10, -1, -1);
  }

  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t sub_23A8EFE34(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  void *v9;
  _QWORD *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v16;
  NSObject *v17;
  os_log_type_t v18;
  uint8_t *v19;
  _QWORD v20[2];
  _QWORD aBlock[3];
  void *v22;
  uint64_t (*v23)(void *);
  _QWORD *v24;
  _OWORD v25[2];

  v5 = sub_23A8F10A0();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *(void **)(v2 + 16);
  if (v9 || (sub_23A8EFAC0(), (v9 = *(void **)(v2 + 16)) != 0))
  {
    v10 = (_QWORD *)swift_allocObject();
    v10[2] = v2;
    v10[3] = a1;
    v10[4] = a2;
    v23 = sub_23A8F0478;
    v24 = v10;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_23A8F03B8;
    v22 = &block_descriptor_5;
    v11 = _Block_copy(aBlock);
    v12 = v9;
    swift_retain();
    swift_retain();
    swift_release();
    v13 = objc_msgSend(v12, sel_remoteObjectProxyWithErrorHandler_, v11);
    _Block_release(v11);

    sub_23A8F12BC();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v25, 0, sizeof(v25));
  }
  sub_23A8F049C((uint64_t)v25, (uint64_t)aBlock);
  if (!v22)
  {
    sub_23A8C999C((uint64_t)aBlock);
LABEL_9:
    if (qword_2569C8350 != -1)
      swift_once();
    v16 = __swift_project_value_buffer(v5, (uint64_t)qword_2569C9B00);
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, v16, v5);
    v17 = sub_23A8F1088();
    v18 = sub_23A8F1274();
    if (os_log_type_enabled(v17, v18))
    {
      v19 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v19 = 0;
      _os_log_impl(&dword_23A8AD000, v17, v18, "Returned host vended by XPC service doesn't conform to HomeEnergyXPCProtocol.", v19, 2u);
      MEMORY[0x23B85B51C](v19, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    exit(1);
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2542D8A90);
  if ((swift_dynamicCast() & 1) == 0)
    goto LABEL_9;
  v14 = v20[1];
  sub_23A8C999C((uint64_t)v25);
  return v14;
}

uint64_t sub_23A8F00D4(void *a1, uint64_t a2, uint64_t (*a3)(_QWORD), uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  id v13;
  id v14;
  NSObject *v15;
  os_log_type_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  id v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  _QWORD v26[2];
  uint64_t (*v27)(_QWORD);
  uint64_t v28;
  uint64_t v29;

  v8 = sub_23A8F10A0();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)v26 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2542D8828 != -1)
    swift_once();
  v12 = __swift_project_value_buffer(v8, (uint64_t)qword_2542D8DE0);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, v12, v8);
  swift_retain();
  v13 = a1;
  swift_retain();
  v14 = a1;
  v15 = sub_23A8F1088();
  v16 = sub_23A8F1274();
  if (os_log_type_enabled(v15, v16))
  {
    v17 = swift_slowAlloc();
    v18 = swift_slowAlloc();
    v26[0] = v18;
    *(_DWORD *)v17 = 136315394;
    v27 = a3;
    v28 = *(_QWORD *)a2;
    v29 = v18;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2569C8EC0);
    v19 = sub_23A8F1148();
    v26[1] = a4;
    v28 = sub_23A8BF840(v19, v20, &v29);
    sub_23A8F12A4();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v17 + 12) = 2082;
    v28 = (uint64_t)a1;
    v21 = a1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2542D8AE0);
    v22 = sub_23A8F1148();
    v28 = sub_23A8BF840(v22, v23, &v29);
    a3 = v27;
    sub_23A8F12A4();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_23A8AD000, v15, v16, "%s: remoteObjectProxyWithErrorHandler error: %{public}s", (uint8_t *)v17, 0x16u);
    v24 = v26[0];
    swift_arrayDestroy();
    MEMORY[0x23B85B51C](v24, -1, -1);
    MEMORY[0x23B85B51C](v17, -1, -1);
  }
  else
  {
    swift_release_n();

  }
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  objc_msgSend(*(id *)(a2 + 16), sel_invalidate);
  return a3(a1);
}

void sub_23A8F03B8(uint64_t a1, void *a2)
{
  void (*v3)(void);
  id v4;

  v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3();
  swift_release();

}

uint64_t sub_23A8F0408()
{
  uint64_t v0;

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for HomeEnergyXPCConnection()
{
  return objc_opt_self();
}

uint64_t sub_23A8F044C()
{
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23A8F0478(void *a1)
{
  uint64_t v1;

  return sub_23A8F00D4(a1, *(_QWORD *)(v1 + 16), *(uint64_t (**)(_QWORD))(v1 + 24), *(_QWORD *)(v1 + 32));
}

uint64_t block_copy_helper_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_2()
{
  return swift_release();
}

uint64_t sub_23A8F049C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542D8AE8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_23A8F04E4()
{
  uint64_t v0;

  return sub_23A8EFCE8(v0, "XPC connection interrupted");
}

uint64_t sub_23A8F0504()
{
  uint64_t v0;

  return sub_23A8EFCE8(v0, "XPC connection invalidated");
}

uint64_t HomeEnergyError.description.getter()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_23A8F057C + 4 * byte_23A8F23A0[*v0]))(0xD000000000000011, 0x800000023A8F4A10);
}

uint64_t sub_23A8F057C()
{
  return 0x206E776F6E6B6E55;
}

uint64_t sub_23A8F05A0@<X0>(uint64_t a1@<X8>)
{
  return a1 - 4;
}

uint64_t sub_23A8F07C0()
{
  return 0x6920444965746953;
}

EnergyKit::HomeEnergyError_optional __swiftcall HomeEnergyError.init(rawValue:)(Swift::Int rawValue)
{
  char *v1;
  char v2;
  char v3;

  v2 = 0;
  v3 = 11;
  switch(rawValue)
  {
    case 0:
      goto LABEL_13;
    case 1:
      v2 = 1;
      goto LABEL_13;
    case 2:
      v2 = 2;
      goto LABEL_13;
    case 3:
      v2 = 3;
      goto LABEL_13;
    case 4:
      v2 = 4;
      goto LABEL_13;
    case 5:
      v2 = 5;
      goto LABEL_13;
    case 6:
      v2 = 6;
      goto LABEL_13;
    case 7:
      v2 = 7;
      goto LABEL_13;
    case 8:
      v2 = 8;
      goto LABEL_13;
    case 9:
      v2 = 9;
      goto LABEL_13;
    case 10:
      v2 = 10;
LABEL_13:
      v3 = v2;
      goto LABEL_14;
    case 11:
LABEL_14:
      *v1 = v3;
      break;
    case 12:
      *v1 = 12;
      break;
    case 13:
      *v1 = 13;
      break;
    case 14:
      *v1 = 14;
      break;
    case 15:
      *v1 = 15;
      break;
    case 16:
      *v1 = 16;
      break;
    case 17:
      *v1 = 17;
      break;
    case 18:
      *v1 = 18;
      break;
    case 19:
      *v1 = 19;
      break;
    case 20:
      *v1 = 20;
      break;
    case 21:
      *v1 = 21;
      break;
    case 22:
      *v1 = 22;
      break;
    case 23:
      *v1 = 23;
      break;
    case 24:
      *v1 = 24;
      break;
    case 25:
      *v1 = 25;
      break;
    case 26:
      *v1 = 26;
      break;
    case 27:
      *v1 = 27;
      break;
    case 28:
      *v1 = 28;
      break;
    default:
      *v1 = 29;
      break;
  }
  return (EnergyKit::HomeEnergyError_optional)rawValue;
}

uint64_t HomeEnergyError.rawValue.getter()
{
  unsigned __int8 *v0;

  return *v0;
}

unint64_t sub_23A8F0948()
{
  unint64_t result;

  result = qword_2569C8EC8;
  if (!qword_2569C8EC8)
  {
    result = MEMORY[0x23B85B498](&protocol conformance descriptor for HomeEnergyError, &type metadata for HomeEnergyError);
    atomic_store(result, (unint64_t *)&qword_2569C8EC8);
  }
  return result;
}

EnergyKit::HomeEnergyError_optional sub_23A8F098C(Swift::Int *a1)
{
  return HomeEnergyError.init(rawValue:)(*a1);
}

uint64_t sub_23A8F0994()
{
  sub_23A8F0B38();
  sub_23A8F0B7C();
  return sub_23A8F1460();
}

uint64_t getEnumTagSinglePayload for HomeEnergyError(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xE4)
    goto LABEL_17;
  if (a2 + 28 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 28) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 28;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 28;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 28;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0x1D;
  v8 = v6 - 29;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for HomeEnergyError(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 28 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 28) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xE4)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xE3)
    return ((uint64_t (*)(void))((char *)&loc_23A8F0AB8 + 4 * byte_23A8F23DF[v4]))();
  *a1 = a2 + 28;
  return ((uint64_t (*)(void))((char *)sub_23A8F0AEC + 4 * byte_23A8F23DA[v4]))();
}

uint64_t sub_23A8F0AEC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A8F0AF4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23A8F0AFCLL);
  return result;
}

uint64_t sub_23A8F0B08(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23A8F0B10);
  *(_BYTE *)result = a2 + 28;
  return result;
}

uint64_t sub_23A8F0B14(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A8F0B1C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for HomeEnergyError()
{
  return &type metadata for HomeEnergyError;
}

unint64_t sub_23A8F0B38()
{
  unint64_t result;

  result = qword_2569C8ED0;
  if (!qword_2569C8ED0)
  {
    result = MEMORY[0x23B85B498](&protocol conformance descriptor for HomeEnergyError, &type metadata for HomeEnergyError);
    atomic_store(result, (unint64_t *)&qword_2569C8ED0);
  }
  return result;
}

unint64_t sub_23A8F0B7C()
{
  unint64_t result;

  result = qword_2569C8ED8;
  if (!qword_2569C8ED8)
  {
    result = MEMORY[0x23B85B498](MEMORY[0x24BEE17C8], MEMORY[0x24BEE1768]);
    atomic_store(result, (unint64_t *)&qword_2569C8ED8);
  }
  return result;
}

uint64_t sub_23A8F0BC0()
{
  return MEMORY[0x24BDCB220]();
}

uint64_t sub_23A8F0BCC()
{
  return MEMORY[0x24BDCB260]();
}

uint64_t sub_23A8F0BD8()
{
  return MEMORY[0x24BDCB268]();
}

uint64_t sub_23A8F0BE4()
{
  return MEMORY[0x24BDCB8D8]();
}

uint64_t sub_23A8F0BF0()
{
  return MEMORY[0x24BDCB8E8]();
}

uint64_t sub_23A8F0BFC()
{
  return MEMORY[0x24BDCB8F0]();
}

uint64_t sub_23A8F0C08()
{
  return MEMORY[0x24BDCB918]();
}

uint64_t sub_23A8F0C14()
{
  return MEMORY[0x24BDCB930]();
}

uint64_t sub_23A8F0C20()
{
  return MEMORY[0x24BDCDBE0]();
}

uint64_t sub_23A8F0C2C()
{
  return MEMORY[0x24BDCDCE0]();
}

uint64_t sub_23A8F0C38()
{
  return MEMORY[0x24BDCE468]();
}

uint64_t sub_23A8F0C44()
{
  return MEMORY[0x24BDCE5D8]();
}

uint64_t sub_23A8F0C50()
{
  return MEMORY[0x24BDCE5E8]();
}

uint64_t sub_23A8F0C5C()
{
  return MEMORY[0x24BDCE5F0]();
}

uint64_t sub_23A8F0C68()
{
  return MEMORY[0x24BDCE600]();
}

uint64_t sub_23A8F0C74()
{
  return MEMORY[0x24BDCE858]();
}

uint64_t sub_23A8F0C80()
{
  return MEMORY[0x24BDCE880]();
}

uint64_t sub_23A8F0C8C()
{
  return MEMORY[0x24BDCE8C8]();
}

uint64_t sub_23A8F0C98()
{
  return MEMORY[0x24BDCE8F8]();
}

uint64_t sub_23A8F0CA4()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_23A8F0CB0()
{
  return MEMORY[0x24BE2EBC0]();
}

uint64_t sub_23A8F0CBC()
{
  return MEMORY[0x24BDCE9B0]();
}

uint64_t sub_23A8F0CC8()
{
  return MEMORY[0x24BDCE9D0]();
}

uint64_t sub_23A8F0CD4()
{
  return MEMORY[0x24BDCEA40]();
}

uint64_t sub_23A8F0CE0()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_23A8F0CEC()
{
  return MEMORY[0x24BDCEF80]();
}

uint64_t sub_23A8F0CF8()
{
  return MEMORY[0x24BDCEFA0]();
}

uint64_t sub_23A8F0D04()
{
  return MEMORY[0x24BDCEFC8]();
}

uint64_t sub_23A8F0D10()
{
  return MEMORY[0x24BDCF160]();
}

uint64_t sub_23A8F0D1C()
{
  return MEMORY[0x24BDCF1D0]();
}

uint64_t sub_23A8F0D28()
{
  return MEMORY[0x24BDCF290]();
}

uint64_t sub_23A8F0D34()
{
  return MEMORY[0x24BDCF2D8]();
}

uint64_t sub_23A8F0D40()
{
  return MEMORY[0x24BDCF490]();
}

uint64_t sub_23A8F0D4C()
{
  return MEMORY[0x24BDCF4D8]();
}

uint64_t sub_23A8F0D58()
{
  return MEMORY[0x24BDCF510]();
}

uint64_t sub_23A8F0D64()
{
  return MEMORY[0x24BE4F2B0]();
}

uint64_t sub_23A8F0D70()
{
  return MEMORY[0x24BE2EC60]();
}

uint64_t sub_23A8F0D7C()
{
  return MEMORY[0x24BE2EC68]();
}

uint64_t sub_23A8F0D88()
{
  return MEMORY[0x24BE2EC78]();
}

uint64_t sub_23A8F0D94()
{
  return MEMORY[0x24BE2EC88]();
}

uint64_t sub_23A8F0DA0()
{
  return MEMORY[0x24BE2ECA0]();
}

uint64_t sub_23A8F0DAC()
{
  return MEMORY[0x24BE2ECB8]();
}

uint64_t sub_23A8F0DB8()
{
  return MEMORY[0x24BE2EEB0]();
}

uint64_t sub_23A8F0DC4()
{
  return MEMORY[0x24BE2EEB8]();
}

uint64_t sub_23A8F0DD0()
{
  return MEMORY[0x24BE2EEC0]();
}

uint64_t sub_23A8F0DDC()
{
  return MEMORY[0x24BE2EEC8]();
}

uint64_t sub_23A8F0DE8()
{
  return MEMORY[0x24BE2EED0]();
}

uint64_t sub_23A8F0DF4()
{
  return MEMORY[0x24BE2EED8]();
}

uint64_t sub_23A8F0E00()
{
  return MEMORY[0x24BE2EEE0]();
}

uint64_t sub_23A8F0E0C()
{
  return MEMORY[0x24BE2EEE8]();
}

uint64_t sub_23A8F0E18()
{
  return MEMORY[0x24BE2EEF0]();
}

uint64_t sub_23A8F0E24()
{
  return MEMORY[0x24BE2EF68]();
}

uint64_t sub_23A8F0E30()
{
  return MEMORY[0x24BE2EF78]();
}

uint64_t sub_23A8F0E3C()
{
  return MEMORY[0x24BE2EF88]();
}

uint64_t sub_23A8F0E48()
{
  return MEMORY[0x24BE2EFA8]();
}

uint64_t sub_23A8F0E54()
{
  return MEMORY[0x24BE2EFB8]();
}

uint64_t sub_23A8F0E60()
{
  return MEMORY[0x24BE2EFC8]();
}

uint64_t sub_23A8F0E6C()
{
  return MEMORY[0x24BE2EFD8]();
}

uint64_t sub_23A8F0E78()
{
  return MEMORY[0x24BE2EFE8]();
}

uint64_t sub_23A8F0E84()
{
  return MEMORY[0x24BE2EFF0]();
}

uint64_t sub_23A8F0E90()
{
  return MEMORY[0x24BE2F000]();
}

uint64_t sub_23A8F0E9C()
{
  return MEMORY[0x24BE2F010]();
}

uint64_t sub_23A8F0EA8()
{
  return MEMORY[0x24BE2F028]();
}

uint64_t sub_23A8F0EB4()
{
  return MEMORY[0x24BE2F038]();
}

uint64_t sub_23A8F0EC0()
{
  return MEMORY[0x24BE2F048]();
}

uint64_t sub_23A8F0ECC()
{
  return MEMORY[0x24BE2F068]();
}

uint64_t sub_23A8F0ED8()
{
  return MEMORY[0x24BE2F078]();
}

uint64_t sub_23A8F0EE4()
{
  return MEMORY[0x24BE2F088]();
}

uint64_t sub_23A8F0EF0()
{
  return MEMORY[0x24BE2F090]();
}

uint64_t sub_23A8F0EFC()
{
  return MEMORY[0x24BE2F0A0]();
}

uint64_t sub_23A8F0F08()
{
  return MEMORY[0x24BE2F0B0]();
}

uint64_t sub_23A8F0F14()
{
  return MEMORY[0x24BE2F0F0]();
}

uint64_t sub_23A8F0F20()
{
  return MEMORY[0x24BE2F100]();
}

uint64_t sub_23A8F0F2C()
{
  return MEMORY[0x24BE2F120]();
}

uint64_t sub_23A8F0F38()
{
  return MEMORY[0x24BE2F150]();
}

uint64_t sub_23A8F0F44()
{
  return MEMORY[0x24BE2F168]();
}

uint64_t sub_23A8F0F50()
{
  return MEMORY[0x24BE2F170]();
}

uint64_t sub_23A8F0F5C()
{
  return MEMORY[0x24BE2F178]();
}

uint64_t sub_23A8F0F68()
{
  return MEMORY[0x24BE2F188]();
}

uint64_t sub_23A8F0F74()
{
  return MEMORY[0x24BE2F198]();
}

uint64_t sub_23A8F0F80()
{
  return MEMORY[0x24BE2F1A0]();
}

uint64_t sub_23A8F0F8C()
{
  return MEMORY[0x24BE2F1A8]();
}

uint64_t sub_23A8F0F98()
{
  return MEMORY[0x24BE2F1B8]();
}

uint64_t sub_23A8F0FA4()
{
  return MEMORY[0x24BE2F1C8]();
}

uint64_t sub_23A8F0FB0()
{
  return MEMORY[0x24BE2F1E8]();
}

uint64_t sub_23A8F0FBC()
{
  return MEMORY[0x24BE2F1F0]();
}

uint64_t sub_23A8F0FC8()
{
  return MEMORY[0x24BE2F200]();
}

uint64_t sub_23A8F0FD4()
{
  return MEMORY[0x24BE2F208]();
}

uint64_t sub_23A8F0FE0()
{
  return MEMORY[0x24BE2F230]();
}

uint64_t sub_23A8F0FEC()
{
  return MEMORY[0x24BE2F238]();
}

uint64_t sub_23A8F0FF8()
{
  return MEMORY[0x24BE2F260]();
}

uint64_t sub_23A8F1004()
{
  return MEMORY[0x24BE2F298]();
}

uint64_t sub_23A8F1010()
{
  return MEMORY[0x24BE2F2B8]();
}

uint64_t sub_23A8F101C()
{
  return MEMORY[0x24BE2F2C0]();
}

uint64_t sub_23A8F1028()
{
  return MEMORY[0x24BE2F2C8]();
}

uint64_t sub_23A8F1034()
{
  return MEMORY[0x24BE2F2D8]();
}

uint64_t sub_23A8F1040()
{
  return MEMORY[0x24BE4F4A8]();
}

uint64_t sub_23A8F104C()
{
  return MEMORY[0x24BE4F4C0]();
}

uint64_t sub_23A8F1058()
{
  return MEMORY[0x24BE4F578]();
}

uint64_t sub_23A8F1064()
{
  return MEMORY[0x24BE4F720]();
}

uint64_t sub_23A8F1070()
{
  return MEMORY[0x24BEE77C8]();
}

uint64_t sub_23A8F107C()
{
  return MEMORY[0x24BEE77F0]();
}

uint64_t sub_23A8F1088()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_23A8F1094()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_23A8F10A0()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_23A8F10AC()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_23A8F10B8()
{
  return MEMORY[0x24BDCF830]();
}

uint64_t sub_23A8F10C4()
{
  return MEMORY[0x24BEE0270]();
}

uint64_t sub_23A8F10D0()
{
  return MEMORY[0x24BEE03B0]();
}

uint64_t sub_23A8F10DC()
{
  return MEMORY[0x24BEE0450]();
}

uint64_t sub_23A8F10E8()
{
  return MEMORY[0x24BEE0460]();
}

uint64_t sub_23A8F10F4()
{
  return MEMORY[0x24BEE04A0]();
}

uint64_t sub_23A8F1100()
{
  return MEMORY[0x24BEE0610]();
}

uint64_t sub_23A8F110C()
{
  return MEMORY[0x24BEE07E0]();
}

uint64_t sub_23A8F1118()
{
  return MEMORY[0x24BEE07F0]();
}

uint64_t sub_23A8F1124()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_23A8F1130()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_23A8F113C()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_23A8F1148()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_23A8F1154()
{
  return MEMORY[0x24BEE0A20]();
}

uint64_t sub_23A8F1160()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_23A8F116C()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_23A8F1178()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_23A8F1184()
{
  return MEMORY[0x24BEE0EB8]();
}

uint64_t sub_23A8F1190()
{
  return MEMORY[0x24BEE0EC0]();
}

uint64_t sub_23A8F119C()
{
  return MEMORY[0x24BDCFBC0]();
}

uint64_t sub_23A8F11A8()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_23A8F11B4()
{
  return MEMORY[0x24BEE1120]();
}

uint64_t sub_23A8F11C0()
{
  return MEMORY[0x24BEE1190]();
}

uint64_t sub_23A8F11CC()
{
  return MEMORY[0x24BEE1250]();
}

uint64_t sub_23A8F11D8()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_23A8F11E4()
{
  return MEMORY[0x24BEE6820]();
}

uint64_t sub_23A8F11F0()
{
  return MEMORY[0x24BEE6828]();
}

uint64_t sub_23A8F11FC()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t sub_23A8F1208()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t sub_23A8F1214()
{
  return MEMORY[0x24BEE13A8]();
}

uint64_t sub_23A8F1220()
{
  return MEMORY[0x24BDCFCC0]();
}

uint64_t sub_23A8F122C()
{
  return MEMORY[0x24BDCFCE8]();
}

uint64_t sub_23A8F1238()
{
  return MEMORY[0x24BEE1598]();
}

uint64_t sub_23A8F1244()
{
  return MEMORY[0x24BEE15D8]();
}

uint64_t sub_23A8F1250()
{
  return MEMORY[0x24BEE19A8]();
}

uint64_t sub_23A8F125C()
{
  return MEMORY[0x24BEE78F0]();
}

uint64_t sub_23A8F1268()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t sub_23A8F1274()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_23A8F1280()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_23A8F128C()
{
  return MEMORY[0x24BE2F2F0]();
}

uint64_t sub_23A8F1298()
{
  return MEMORY[0x24BEE79A0]();
}

uint64_t sub_23A8F12A4()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_23A8F12B0()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_23A8F12BC()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_23A8F12C8()
{
  return MEMORY[0x24BEE2110]();
}

uint64_t sub_23A8F12D4()
{
  return MEMORY[0x24BEE2130]();
}

uint64_t sub_23A8F12E0()
{
  return MEMORY[0x24BEE2148]();
}

uint64_t sub_23A8F12EC()
{
  return MEMORY[0x24BEE23A0]();
}

uint64_t sub_23A8F12F8()
{
  return MEMORY[0x24BEE23A8]();
}

uint64_t sub_23A8F1304()
{
  return MEMORY[0x24BEE23E8]();
}

uint64_t sub_23A8F1310()
{
  return MEMORY[0x24BEE24B8]();
}

uint64_t sub_23A8F131C()
{
  return MEMORY[0x24BEE24C0]();
}

uint64_t sub_23A8F1328()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_23A8F1334()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_23A8F1340()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_23A8F134C()
{
  return MEMORY[0x24BEE2908]();
}

uint64_t sub_23A8F1358()
{
  return MEMORY[0x24BEE2938]();
}

uint64_t sub_23A8F1364()
{
  return MEMORY[0x24BEE2958]();
}

uint64_t sub_23A8F1370()
{
  return MEMORY[0x24BEE2980]();
}

uint64_t sub_23A8F137C()
{
  return MEMORY[0x24BEE2988]();
}

uint64_t sub_23A8F1388()
{
  return MEMORY[0x24BEE2BE0]();
}

uint64_t sub_23A8F1394()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_23A8F13A0()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_23A8F13AC()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_23A8F13B8()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_23A8F13C4()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_23A8F13D0()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_23A8F13DC()
{
  return MEMORY[0x24BEE3548]();
}

uint64_t sub_23A8F13E8()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_23A8F13F4()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_23A8F1400()
{
  return MEMORY[0x24BEE70E0]();
}

uint64_t sub_23A8F140C()
{
  return MEMORY[0x24BEE3D98]();
}

uint64_t sub_23A8F1418()
{
  return MEMORY[0x24BEE3ED0]();
}

uint64_t sub_23A8F1424()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_23A8F1430()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_23A8F143C()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_23A8F1448()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_23A8F1454()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_23A8F1460()
{
  return MEMORY[0x24BEE3F18]();
}

uint64_t sub_23A8F146C()
{
  return MEMORY[0x24BEE42D8]();
}

uint64_t sub_23A8F1478()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_23A8F1484()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_23A8F1490()
{
  return MEMORY[0x24BEE4328]();
}

BOOL CLLocationCoordinate2DIsValid(CLLocationCoordinate2D coord)
{
  return MEMORY[0x24BDBFA08]((__n128)coord, *(__n128 *)&coord.longitude);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

uint64_t _objc_autoreleasePoolPop()
{
  return MEMORY[0x24BEDCE10]();
}

uint64_t _objc_autoreleasePoolPush()
{
  return MEMORY[0x24BEDCE18]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x24BEE4B30]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

void exit(int a1)
{
  MEMORY[0x24BDAE268](*(_QWORD *)&a1);
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

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD108](a1, a2);
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

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x24BEE4BD8]();
}

uint64_t swift_continuation_await()
{
  return MEMORY[0x24BEE71B8]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x24BEE71C0]();
}

uint64_t swift_continuation_resume()
{
  return MEMORY[0x24BEE71C8]();
}

uint64_t swift_continuation_throwingResume()
{
  return MEMORY[0x24BEE71D0]();
}

uint64_t swift_continuation_throwingResumeWithError()
{
  return MEMORY[0x24BEE71D8]();
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

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4D10]();
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

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x24BEE4DF8]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x24BEE4E10]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x24BEE4E20]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x24BEE4E48]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x24BEE4E58]();
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

