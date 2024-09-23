id sub_21DCCC618()
{
  id result;

  result = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE7CC30]), sel_init);
  qword_2553AD578 = (uint64_t)result;
  return result;
}

void sub_21DCCC648()
{
  void *v0;
  uint64_t v1;
  os_log_type_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
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
  uint64_t v20;
  uint64_t v21;
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
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;

  if (qword_2540DA398 != -1)
    swift_once();
  v1 = sub_21DCCE200();
  sub_21DCCDA1C(v1, (uint64_t)qword_2540DA410);
  sub_21DCCE23C();
  v2 = sub_21DCCE1F8();
  if (sub_21DCCE1E8(v2))
  {
    *(_WORD *)sub_21DCCE174() = 0;
    sub_21DCCE1B0(&dword_21DCCA000, v3, v4, "Starting PeopleHarvester");
    sub_21DCCE158();
  }

  if (qword_2553AD570 != -1)
    swift_once();
  v5 = (void *)qword_2553AD578;
  objc_msgSend((id)qword_2553AD578, sel_setDiscoveryFlags_, 1180);
  v6 = objc_msgSend(v5, sel_setChangeFlags_, 0xFFFFFFFFLL);
  sub_21DCCE1D0((uint64_t)v6, v7, v8, v9, v10, v11, v12, v13, MEMORY[0x24BDAC760]);
  sub_21DCCE164();
  v14 = sub_21DCCE214();
  sub_21DCCE1C4(v14, sel_setInvalidationHandler_);
  sub_21DCCE228();
  sub_21DCCE230();
  sub_21DCCE1D0(v15, v16, v17, v18, v19, v20, v21, v22, v53);
  sub_21DCCE164();
  v23 = sub_21DCCE214();
  sub_21DCCE1C4(v23, sel_setPersonFoundHandler_);
  sub_21DCCE228();
  sub_21DCCE230();
  sub_21DCCE1D0(v24, v25, v26, v27, v28, v29, v30, v31, v54);
  sub_21DCCE164();
  v32 = sub_21DCCE214();
  sub_21DCCE1C4(v32, sel_setPersonLostHandler_);
  sub_21DCCE228();
  v33 = (void *)qword_2553AD578;
  sub_21DCCE230();
  v42 = sub_21DCCE1D0(v34, v35, v36, v37, v38, v39, v40, v41, v55);
  swift_retain();
  swift_release();
  objc_msgSend(v33, sel_setPersonChangedHandler_, v42);
  _Block_release(v42);
  v43 = (void *)qword_2553AD578;
  sub_21DCCE230();
  v52 = sub_21DCCE1D0(v44, v45, v46, v47, v48, v49, v50, v51, v56);
  objc_msgSend(v43, sel_activateWithCompletion_, v52);
  _Block_release(v52);
}

uint64_t sub_21DCCC8CC(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

void sub_21DCCC8F8(uint64_t a1, void *a2)
{
  void (*v3)(void);
  id v4;

  v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3();
  swift_release();

}

void sub_21DCCC948(uint64_t a1, void *a2)
{
  void (*v3)(void);
  id v4;

  v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3();
  swift_release();

}

void sub_21DCCC9A4(void *a1)
{
  uint64_t v2;
  id v3;
  id v4;
  os_log_type_t v5;
  uint8_t *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  os_log_type_t v11;
  uint8_t *v12;
  NSObject *oslog;
  uint64_t v14;

  if (a1)
  {
    if (qword_2540DA398 != -1)
      swift_once();
    v2 = sub_21DCD3974();
    sub_21DCCDA1C(v2, (uint64_t)qword_2540DA410);
    v3 = a1;
    v4 = a1;
    oslog = sub_21DCD395C();
    v5 = sub_21DCD3A40();
    if (os_log_type_enabled(oslog, v5))
    {
      v6 = (uint8_t *)swift_slowAlloc();
      v7 = swift_slowAlloc();
      v14 = v7;
      *(_DWORD *)v6 = 136315138;
      swift_getErrorValue();
      v8 = sub_21DCD3B30();
      sub_21DCD2F9C(v8, v9, &v14);
      sub_21DCD3A88();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_21DCCA000, oslog, v5, "PeopleHarvester: Error in activating peopleDiscovery:%s", v6, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x22079F46C](v7, -1, -1);
      MEMORY[0x22079F46C](v6, -1, -1);

      return;
    }

  }
  else
  {
    if (qword_2540DA398 != -1)
      swift_once();
    v10 = sub_21DCD3974();
    sub_21DCCDA1C(v10, (uint64_t)qword_2540DA410);
    oslog = sub_21DCD395C();
    v11 = sub_21DCD3A40();
    if (os_log_type_enabled(oslog, v11))
    {
      v12 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_21DCCA000, oslog, v11, "PeopleHarvester: Successfully activated peopleDiscovery", v12, 2u);
      MEMORY[0x22079F46C](v12, -1, -1);
    }
  }

}

void sub_21DCCCC24(uint64_t a1, void *a2)
{
  void (*v3)(void *);
  id v4;

  v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3(a2);
  swift_release();

}

void sub_21DCCCC78(void *a1, uint64_t a2, unint64_t a3)
{
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t v10;
  uint8_t *v11;
  id v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  void *v21;
  uint64_t v22;

  if (qword_2540DA398 != -1)
    swift_once();
  v6 = sub_21DCD3974();
  sub_21DCCDA1C(v6, (uint64_t)qword_2540DA410);
  swift_bridgeObjectRetain_n();
  v7 = sub_21DCD395C();
  v8 = sub_21DCD3A40();
  if (os_log_type_enabled(v7, v8))
  {
    v21 = a1;
    v9 = (uint8_t *)swift_slowAlloc();
    v10 = swift_slowAlloc();
    v22 = v10;
    *(_DWORD *)v9 = 136315138;
    swift_bridgeObjectRetain();
    sub_21DCD2F9C(a2, a3, &v22);
    sub_21DCD3A88();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_21DCCA000, v7, v8, "%s called", v9, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x22079F46C](v10, -1, -1);
    v11 = v9;
    a1 = v21;
    MEMORY[0x22079F46C](v11, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  v12 = a1;
  v13 = sub_21DCD395C();
  v14 = sub_21DCD3A40();
  if (os_log_type_enabled(v13, v14))
  {
    v15 = (uint8_t *)swift_slowAlloc();
    v16 = swift_slowAlloc();
    v22 = v16;
    *(_DWORD *)v15 = 136315138;
    v17 = objc_msgSend(v12, sel_description);
    v18 = sub_21DCD39BC();
    v20 = v19;

    sub_21DCD2F9C(v18, v20, &v22);
    sub_21DCD3A88();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21DCCA000, v13, v14, "Person = %s", v15, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x22079F46C](v16, -1, -1);
    MEMORY[0x22079F46C](v15, -1, -1);

  }
  else
  {

  }
}

void sub_21DCCCF68()
{
  uint64_t v0;
  NSObject *v1;
  os_log_type_t v2;
  uint8_t *v3;
  id v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  if (qword_2540DA398 != -1)
LABEL_20:
    swift_once();
  v0 = sub_21DCD3974();
  sub_21DCCDA1C(v0, (uint64_t)qword_2540DA410);
  v1 = sub_21DCD395C();
  v2 = sub_21DCD3A40();
  if (os_log_type_enabled(v1, v2))
  {
    v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_21DCCA000, v1, v2, "Ingesting event into the PeopleDiscoveryBiomeStream", v3, 2u);
    MEMORY[0x22079F46C](v3, -1, -1);
  }

  v25 = objc_msgSend(objc_msgSend((id)BiomeLibrary(), sel_ContextualUnderstanding), sel_PeopleDiscovery);
  swift_unknownObjectRelease();
  v31 = MEMORY[0x24BEE4AF8];
  if (qword_2553AD570 != -1)
    swift_once();
  v4 = objc_msgSend((id)qword_2553AD578, sel_discoveredPeople);
  sub_21DCCDC9C(0, &qword_2553AD670);
  v5 = sub_21DCD3A04();

  if (!(v5 >> 62))
  {
    v6 = *(_QWORD *)((v5 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v6)
      goto LABEL_8;
LABEL_22:
    swift_bridgeObjectRelease();
    sub_21DCCDC9C(0, &qword_2553AD678);
    v23 = sub_21DCCD3D4();
    v24 = objc_msgSend(v25, sel_source);
    objc_msgSend(v24, sel_sendEvent_, v23);

    swift_unknownObjectRelease();
    return;
  }
  swift_bridgeObjectRetain();
  v6 = sub_21DCD3B00();
  swift_bridgeObjectRelease();
  if (!v6)
    goto LABEL_22;
LABEL_8:
  v27 = v5;
  v28 = v5 & 0xC000000000000001;
  v7 = 4;
  v26 = v6;
  while (1)
  {
    if (v28)
      v8 = (id)MEMORY[0x22079F0C4](v7 - 4, v5);
    else
      v8 = *(id *)(v5 + 8 * v7);
    v9 = v8;
    if (__OFADD__(v7 - 4, 1))
    {
      __break(1u);
      goto LABEL_20;
    }
    v30 = v7 - 3;
    v10 = sub_21DCCDC40(v8, (SEL *)&selRef_contactID);
    v29 = v11;
    v12 = objc_msgSend(v9, sel_identifier);
    v13 = sub_21DCD39BC();
    v15 = v14;

    v16 = sub_21DCCDC40(v9, (SEL *)&selRef_name);
    v18 = v17;
    objc_msgSend(v9, sel_flags);
    v19 = (void *)sub_21DCD3B54();
    if ((objc_msgSend(v9, sel_activityLevel) & 0x80000000) != 0)
      break;
    v20 = (void *)sub_21DCD3B54();
    if ((objc_msgSend(v9, sel_proximity) & 0x80000000) != 0)
      break;
    v21 = (void *)sub_21DCD3B54();
    v22 = objc_allocWithZone(MEMORY[0x24BE0C2D8]);
    sub_21DCCDABC(v10, v29, v13, v15, v16, v18, v19, v20, v21);
    MEMORY[0x22079EFE0]();
    if (*(_QWORD *)((v31 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v31 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      sub_21DCD3A1C();
    sub_21DCD3A28();
    sub_21DCD3A10();

    ++v7;
    v5 = v27;
    if (v30 == v26)
      goto LABEL_22;
  }
  sub_21DCD3AF4();
  __break(1u);
}

id sub_21DCCD3D4()
{
  id v0;
  void *v1;
  id v2;

  v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  sub_21DCCDC9C(0, &qword_2553AD680);
  v1 = (void *)sub_21DCD39F8();
  swift_bridgeObjectRelease();
  v2 = objc_msgSend(v0, sel_initWithDiscoveredPersons_, v1);

  return v2;
}

void sub_21DCCD458()
{
  uint64_t v0;
  NSObject *v1;
  os_log_type_t v2;
  uint8_t *v3;

  if (qword_2540DA398 != -1)
    swift_once();
  v0 = sub_21DCD3974();
  sub_21DCCDA1C(v0, (uint64_t)qword_2540DA410);
  v1 = sub_21DCD395C();
  v2 = sub_21DCD3A40();
  if (os_log_type_enabled(v1, v2))
  {
    v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_21DCCA000, v1, v2, "PeopleHarvester: Invalidation handler called", v3, 2u);
    MEMORY[0x22079F46C](v3, -1, -1);
  }

  sub_21DCCCF68();
}

void sub_21DCCD524(void *a1)
{
  sub_21DCCCC78(a1, 0xD000000000000012, 0x800000021DCD4D60);
  sub_21DCCCF68();
}

void sub_21DCCD550(void *a1)
{
  sub_21DCCCC78(a1, 0xD000000000000011, 0x800000021DCD4D40);
  sub_21DCCCF68();
}

void sub_21DCCD57C(void *a1)
{
  sub_21DCCCC78(a1, 0xD000000000000014, 0x800000021DCD4CD0);
  sub_21DCCCF68();
}

uint64_t sub_21DCCD5A8()
{
  unsigned __int8 *v0;

  return *v0;
}

uint64_t sub_21DCCD5B4()
{
  uint64_t v0;
  NSObject *v1;
  os_log_type_t v2;
  uint8_t *v3;

  if (qword_2540DA398 != -1)
    swift_once();
  v0 = sub_21DCCE200();
  sub_21DCCDA1C(v0, (uint64_t)qword_2540DA410);
  v1 = sub_21DCCE23C();
  v2 = sub_21DCD3A40();
  if (os_log_type_enabled(v1, v2))
  {
    v3 = (uint8_t *)sub_21DCCE174();
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_21DCCA000, v1, v2, "Starting AmbientLightHarvester", v3, 2u);
    sub_21DCCE158();
  }

  sub_21DCD3950();
  sub_21DCD3944();
  return swift_release();
}

uint64_t sub_21DCCD67C()
{
  return sub_21DCCD5B4();
}

uint64_t sub_21DCCD684()
{
  uint64_t v0;
  uint64_t result;

  sub_21DCCDBC4(&qword_2540DA3B8);
  v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_21DCD3F90;
  *(_QWORD *)(v0 + 56) = &type metadata for PeopleHarvester;
  *(_QWORD *)(v0 + 64) = &off_24E1B5828;
  result = swift_allocObject();
  *(_QWORD *)(v0 + 32) = result;
  *(_BYTE *)(result + 16) = 1;
  *(_QWORD *)(result + 24) = sub_21DCCD458;
  *(_QWORD *)(result + 32) = 0;
  *(_QWORD *)(result + 40) = sub_21DCCD524;
  *(_QWORD *)(result + 48) = 0;
  *(_QWORD *)(result + 56) = sub_21DCCD550;
  *(_QWORD *)(result + 64) = 0;
  *(_QWORD *)(result + 72) = sub_21DCCD57C;
  *(_QWORD *)(result + 80) = 0;
  *(_QWORD *)(v0 + 96) = &type metadata for AmbientLightHarvester;
  *(_QWORD *)(v0 + 104) = &off_24E1B5810;
  *(_BYTE *)(v0 + 72) = 0;
  qword_2540DA428 = v0;
  return result;
}

uint64_t sub_21DCCD748()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  os_log_type_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
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
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  os_log_type_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  int v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  os_log_type_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  int v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  _BYTE v54[40];
  _QWORD v55[3];
  uint64_t v56;
  uint64_t v57;

  if (qword_2540DA398 != -1)
    swift_once();
  v1 = sub_21DCCE200();
  v2 = sub_21DCCDA1C(v1, (uint64_t)qword_2540DA410);
  sub_21DCCE23C();
  v3 = sub_21DCCE1F8();
  if (sub_21DCCE1E8(v3))
  {
    *(_WORD *)sub_21DCCE174() = 0;
    sub_21DCCE1B0(&dword_21DCCA000, v4, v5, "Starting to harvest evidence");
    sub_21DCCE158();
  }

  if (qword_2540DA3B0 != -1)
    swift_once();
  result = qword_2540DA428;
  v7 = *(_QWORD *)(qword_2540DA428 + 16);
  if (v7)
  {
    v8 = qword_2540DA428 + 32;
    v50 = qword_2540DA428;
    swift_bridgeObjectRetain();
    v52 = 136315138;
    v51 = MEMORY[0x24BEE4AD8] + 8;
    while (1)
    {
      sub_21DCCDA34(v8, (uint64_t)v55);
      v9 = v56;
      v10 = v57;
      sub_21DCCDA78(v55, v56);
      v11 = (*(uint64_t (**)(uint64_t, uint64_t))(v10 + 8))(v9, v10);
      if ((v11 & 1) == 0)
        break;
      sub_21DCD3938();
      v19 = sub_21DCD392C();
      if ((v19 & 1) != 0)
      {
        sub_21DCCE208(v19, v20, v21, v22, v23, v24, v25, v26, v50, v51, v52);
        v27 = (void *)v2;
        sub_21DCD395C();
        v28 = sub_21DCCE1F8();
        if (sub_21DCCE1D8(v28))
        {
          v29 = sub_21DCCE174();
          v30 = sub_21DCCE174();
          sub_21DCCE198(v30, v31, v32, v33, v34, v35);
          sub_21DCCDBC4((uint64_t *)&unk_2540DA3A0);
          v36 = sub_21DCCE21C();
          *(_QWORD *)(v29 + 4) = sub_21DCD2F9C(v36, v37, &v53);
          swift_bridgeObjectRelease();
          sub_21DCCDA9C((uint64_t)v54);
          sub_21DCCE17C();
          swift_arrayDestroy();
          goto LABEL_15;
        }
LABEL_16:
        sub_21DCCDA9C((uint64_t)v54);

        v48 = v56;
        v49 = v57;
        sub_21DCCDA78(v55, v56);
        (*(void (**)(uint64_t, uint64_t))(v49 + 16))(v48, v49);
      }
      sub_21DCCDA9C((uint64_t)v55);
      v8 += 40;
      if (!--v7)
        return swift_bridgeObjectRelease();
    }
    sub_21DCCE208(v11, v12, v13, v14, v15, v16, v17, v18, v50, v51, v52);
    v27 = (void *)v2;
    sub_21DCD395C();
    v38 = sub_21DCCE1F8();
    if (sub_21DCCE1D8(v38))
    {
      v39 = sub_21DCCE174();
      v40 = sub_21DCCE174();
      sub_21DCCE198(v40, v41, v42, v43, v44, v45);
      sub_21DCCDBC4((uint64_t *)&unk_2540DA3A0);
      v46 = sub_21DCCE21C();
      *(_QWORD *)(v39 + 4) = sub_21DCD2F9C(v46, v47, &v53);
      swift_bridgeObjectRelease();
      sub_21DCCDA9C((uint64_t)v54);
      sub_21DCCE17C();
      swift_arrayDestroy();
LABEL_15:
      sub_21DCCE158();
    }
    goto LABEL_16;
  }
  return result;
}

uint64_t sub_21DCCDA1C(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t sub_21DCCDA34(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

_QWORD *sub_21DCCDA78(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_21DCCDA9C(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

id sub_21DCCDABC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, void *a8, void *a9)
{
  void *v9;
  void *v10;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v10 = v9;
  if (a2)
  {
    v15 = (void *)sub_21DCD39B0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v15 = 0;
  }
  if (!a4)
  {
    v16 = 0;
    if (a6)
      goto LABEL_6;
LABEL_8:
    v17 = 0;
    goto LABEL_9;
  }
  v16 = (void *)sub_21DCD39B0();
  swift_bridgeObjectRelease();
  if (!a6)
    goto LABEL_8;
LABEL_6:
  v17 = (void *)sub_21DCD39B0();
  swift_bridgeObjectRelease();
LABEL_9:
  v18 = objc_msgSend(v10, sel_initWithContactID_identifier_name_flags_activityLevel_proximity_, v15, v16, v17, a7, a8, a9);

  return v18;
}

uint64_t sub_21DCCDBC4(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x22079F3F4]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_21DCCDC04()
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_21DCCDC40(void *a1, SEL *a2)
{
  id v2;
  void *v3;
  uint64_t v4;

  v2 = objc_msgSend(a1, *a2);
  if (!v2)
    return 0;
  v3 = v2;
  v4 = sub_21DCD39BC();

  return v4;
}

uint64_t sub_21DCCDC9C(uint64_t a1, unint64_t *a2)
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

_BYTE *initializeBufferWithCopyOfBuffer for AmbientLightHarvester(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for AmbientLightHarvester(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  int v5;
  unsigned int v6;
  BOOL v7;

  if (!a2)
  {
    v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFF)
  {
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
      if (!v4)
        goto LABEL_17;
    }
    else if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
    }
    else
    {
      v4 = a1[1];
      if (!a1[1])
        goto LABEL_17;
    }
    v5 = (*a1 | (v4 << 8)) - 2;
    return (v5 + 1);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 2;
  v5 = (v6 + 2147483646) & 0x7FFFFFFF;
  if (!v7)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for AmbientLightHarvester(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_21DCCDDC8 + 4 * byte_21DCD3FA5[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_21DCCDDFC + 4 * byte_21DCD3FA0[v4]))();
}

uint64_t sub_21DCCDDFC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_21DCCDE04(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x21DCCDE0CLL);
  return result;
}

uint64_t sub_21DCCDE18(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x21DCCDE20);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_21DCCDE24(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_21DCCDE2C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for AmbientLightHarvester()
{
  return &type metadata for AmbientLightHarvester;
}

uint64_t initializeBufferWithCopyOfBuffer for PeopleHarvester(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for PeopleHarvester()
{
  swift_release();
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t initializeWithCopy for PeopleHarvester(uint64_t a1, uint64_t a2)
{
  __int128 v3;
  uint64_t v4;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  v4 = *(_QWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 64) = v4;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for PeopleHarvester(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v4 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v4;
  swift_retain();
  swift_release();
  v5 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v5;
  swift_retain();
  swift_release();
  v6 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = v6;
  swift_retain();
  swift_release();
  v7 = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = v7;
  swift_retain();
  swift_release();
  return a1;
}

void *initializeWithTake for PeopleHarvester(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x48uLL);
}

uint64_t assignWithTake for PeopleHarvester(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_release();
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_release();
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  swift_release();
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for PeopleHarvester(uint64_t a1, int a2)
{
  unint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 72))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      v2 = *(_QWORD *)(a1 + 8);
      if (v2 >= 0xFFFFFFFF)
        LODWORD(v2) = -1;
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PeopleHarvester(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 72) = 1;
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
    *(_BYTE *)(result + 72) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for PeopleHarvester()
{
  return &type metadata for PeopleHarvester;
}

uint64_t sub_21DCCE0D8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_21DCCE0E8()
{
  return swift_release();
}

void type metadata accessor for RPPersonChangeFlags()
{
  unint64_t ForeignTypeMetadata;
  uint64_t v1;

  if (!qword_2553AD688)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1)
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_2553AD688);
  }
}

void sub_21DCCE158()
{
  JUMPOUT(0x22079F46CLL);
}

uint64_t sub_21DCCE164()
{
  return swift_retain();
}

uint64_t sub_21DCCE174()
{
  return swift_slowAlloc();
}

void sub_21DCCE17C()
{
  NSObject *v0;
  void *v1;
  const char *v2;
  uint8_t *v3;
  os_log_type_t v4;

  _os_log_impl(v1, v0, v4, v2, v3, 0xCu);
}

uint64_t sub_21DCCE198(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, ...)
{
  _DWORD *v6;
  uint64_t v8;
  va_list va;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  va_list va1;

  va_start(va1, a6);
  va_start(va, a6);
  v8 = va_arg(va1, _QWORD);
  v10 = va_arg(va1, _QWORD);
  v11 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  va_arg(va1, _QWORD);
  v14 = a1;
  *v6 = a4;
  return sub_21DCCDA34((uint64_t)va1, (uint64_t)va);
}

void sub_21DCCE1B0(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;

  _os_log_impl(a1, v4, v5, a4, v6, 2u);
}

id sub_21DCCE1C4(uint64_t a1, const char *a2)
{
  void *v2;
  uint64_t v3;

  return objc_msgSend(v2, a2, v3);
}

void *sub_21DCCE1D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return _Block_copy(&a9);
}

BOOL sub_21DCCE1D8(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

BOOL sub_21DCCE1E8(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

uint64_t sub_21DCCE1F8()
{
  return sub_21DCD3A40();
}

uint64_t sub_21DCCE200()
{
  return sub_21DCD3974();
}

uint64_t sub_21DCCE208(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v12;
  va_list va;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  va_list va1;

  va_start(va1, a11);
  va_start(va, a11);
  v12 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  return sub_21DCCDA34((uint64_t)va1, (uint64_t)va);
}

uint64_t sub_21DCCE214()
{
  return swift_release();
}

uint64_t sub_21DCCE21C()
{
  return sub_21DCD39C8();
}

void sub_21DCCE228()
{
  const void *v0;

  _Block_release(v0);
}

uint64_t sub_21DCCE23C()
{
  return sub_21DCD395C();
}

uint64_t static EvidenceSystem.start()()
{
  uint64_t v0;
  NSObject *v1;
  os_log_type_t v2;
  uint8_t *v3;

  if (qword_2540DA398 != -1)
    swift_once();
  v0 = sub_21DCD3974();
  sub_21DCCDA1C(v0, (uint64_t)qword_2540DA410);
  v1 = sub_21DCD395C();
  v2 = sub_21DCD3A40();
  if (os_log_type_enabled(v1, v2))
  {
    v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_21DCCA000, v1, v2, "Starting ContextualUnderstandingEvidence System", v3, 2u);
    MEMORY[0x22079F46C](v3, -1, -1);
  }

  return sub_21DCCD748();
}

id EvidenceSystem.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id EvidenceSystem.init()()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_init);
}

id EvidenceSystem.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for EvidenceSystem()
{
  return objc_opt_self();
}

id sub_21DCCE3EC()
{
  uint64_t v0;
  uint64_t v1;
  id result;

  sub_21DCCDBC4(&qword_2553AD810);
  v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_21DCD4080;
  type metadata accessor for ContactStoreManager();
  v1 = swift_allocObject();
  *(_QWORD *)(v1 + 16) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDBACF8]), sel_init);
  result = (id)BiomeLibrary();
  *(_QWORD *)(v0 + 56) = &type metadata for SocialContextInference;
  *(_QWORD *)(v0 + 64) = &off_24E1B5C60;
  *(_QWORD *)(v0 + 32) = result;
  *(_QWORD *)(v0 + 40) = v1;
  qword_2553AD960 = v0;
  return result;
}

uint64_t static InferenceEngine.start()()
{
  uint64_t result;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;

  sub_21DCD3938();
  result = sub_21DCD3920();
  if ((result & 1) != 0)
  {
    if (qword_2553AD5A0 != -1)
      swift_once();
    v1 = sub_21DCD3974();
    sub_21DCCDA1C(v1, (uint64_t)qword_2553AD978);
    v2 = sub_21DCD395C();
    v3 = sub_21DCD3A40();
    if (os_log_type_enabled(v2, v3))
    {
      v4 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_21DCCA000, v2, v3, "Started contextual understanding inference engine", v4, 2u);
      MEMORY[0x22079F46C](v4, -1, -1);
    }

    if (qword_2553AD588 != -1)
      swift_once();
    result = qword_2553AD960;
    v5 = *(_QWORD *)(qword_2553AD960 + 16);
    if (v5)
    {
      v6 = (_QWORD *)(qword_2553AD960 + 32);
      swift_bridgeObjectRetain();
      do
      {
        sub_21DCCDA78(v6, v6[3]);
        v7 = sub_21DCCE7EC();
        sub_21DCCE7DC(v7);
        swift_retain();
        sub_21DCCE81C((uint64_t)sub_21DCCE77C, (uint64_t)v2, 0xD000000000000047);
        swift_release();
        v8 = sub_21DCCE7EC();
        sub_21DCCE7DC(v8);
        swift_retain();
        sub_21DCCEBF0((uint64_t)sub_21DCCE7B4, (uint64_t)v2, 0xD000000000000045);
        swift_release();
        v6 += 5;
        --v5;
      }
      while (v5);
      return swift_bridgeObjectRelease();
    }
  }
  return result;
}

id InferenceEngine.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id InferenceEngine.init()()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_init);
}

id InferenceEngine.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_21DCCE77C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_21DCD1A34(a1, a2, *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24));
}

uint64_t sub_21DCCE788()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_21DCCE7B4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_21DCCFB28(a1, a2, *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24));
}

uint64_t type metadata accessor for InferenceEngine()
{
  return objc_opt_self();
}

uint64_t sub_21DCCE7DC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(a1 + 16) = v1;
  *(_QWORD *)(a1 + 24) = v2;
  return swift_unknownObjectRetain();
}

uint64_t sub_21DCCE7EC()
{
  return swift_allocObject();
}

id sub_21DCCE7F8()
{
  id result;

  result = (id)BiomeLibrary();
  qword_2553AD968 = (uint64_t)result;
  return result;
}

void sub_21DCCE81C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  uint64_t v23;

  sub_21DCCF1CC(a1, a2, a3);
  sub_21DCCF29C();
  MEMORY[0x24BDAC7A8]();
  sub_21DCCF184();
  sub_21DCCF1BC();
  MEMORY[0x24BDAC7A8]();
  sub_21DCCF168();
  sub_21DCCF1BC();
  MEMORY[0x24BDAC7A8]();
  sub_21DCCF228();
  if (qword_2553AD5A0 != -1)
    swift_once();
  v5 = sub_21DCD3974();
  sub_21DCCDA1C(v5, (uint64_t)qword_2553AD978);
  v6 = (void *)sub_21DCD395C();
  v7 = sub_21DCD3A40();
  if (sub_21DCCE1E8(v7))
  {
    *(_WORD *)sub_21DCCF290() = 0;
    sub_21DCCF1F4(&dword_21DCCA000, v8, v9, "Registering for PeopleDiscoveryStreamSubscription");
    sub_21DCCF208();
  }

  sub_21DCCEF54();
  sub_21DCCF284();
  v10 = (void *)sub_21DCCEF90();
  sub_21DCCDBC4(&qword_2553AD828);
  sub_21DCCEFD0();
  v11 = sub_21DCCF120();
  sub_21DCCF250(v11, *MEMORY[0x24BEE5750]);
  v12 = (void *)sub_21DCCF140();
  v13 = objc_allocWithZone(MEMORY[0x24BE0CB48]);
  sub_21DCCF26C();
  v14 = sub_21DCCF1E0(v12);
  if (qword_2553AD590 != -1)
    swift_once();
  v15 = objc_msgSend(objc_msgSend((id)qword_2553AD968, sel_ContextualUnderstanding), sel_PeopleDiscovery);
  sub_21DCCF260();
  v16 = objc_msgSend(v3, sel_DSLPublisher);
  v17 = objc_msgSend(v16, sel_subscribeOn_, v14);

  v18 = sub_21DCCF15C((uint64_t)sub_21DCCC8F8);
  v19 = sub_21DCCE7EC();
  *(_QWORD *)(v19 + 16) = v22;
  *(_QWORD *)(v19 + 24) = v23;
  sub_21DCCF15C((uint64_t)sub_21DCCEB84);
  sub_21DCCF240();
  v20 = swift_release();
  v21 = sub_21DCCF218(v20, sel_sinkWithCompletion_receiveInput_);
  sub_21DCCF278();
  _Block_release(v18);

  sub_21DCCF1A0();
}

void sub_21DCCEAE4(void *a1, void (*a2)(id, _QWORD))
{
  id v4;
  id v5;
  id v6;

  if ((objc_msgSend(a1, sel_respondsToSelector_, sel_eventBody) & 1) != 0)
  {
    v4 = objc_msgSend(a1, sel_eventBody);
    if (v4)
    {
      v5 = v4;
      v6 = v4;
      a2(v5, 0);

    }
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_21DCCEB84(uint64_t a1)
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

id sub_21DCCEBCC()
{
  id result;

  result = (id)BiomeLibrary();
  qword_2553AD970 = (uint64_t)result;
  return result;
}

void sub_21DCCEBF0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  uint64_t v23;

  sub_21DCCF1CC(a1, a2, a3);
  sub_21DCCF29C();
  MEMORY[0x24BDAC7A8]();
  sub_21DCCF184();
  sub_21DCCF1BC();
  MEMORY[0x24BDAC7A8]();
  sub_21DCCF168();
  sub_21DCCF1BC();
  MEMORY[0x24BDAC7A8]();
  sub_21DCCF228();
  if (qword_2553AD5A0 != -1)
    swift_once();
  v5 = sub_21DCD3974();
  sub_21DCCDA1C(v5, (uint64_t)qword_2553AD978);
  v6 = (void *)sub_21DCD395C();
  v7 = sub_21DCD3A40();
  if (sub_21DCCE1E8(v7))
  {
    *(_WORD *)sub_21DCCF290() = 0;
    sub_21DCCF1F4(&dword_21DCCA000, v8, v9, "Registering for SoundAnalysisStreamSubscription");
    sub_21DCCF208();
  }

  sub_21DCCEF54();
  sub_21DCCF284();
  v10 = (void *)sub_21DCCEF90();
  sub_21DCCDBC4(&qword_2553AD828);
  sub_21DCCEFD0();
  v11 = sub_21DCCF120();
  sub_21DCCF250(v11, *MEMORY[0x24BEE5750]);
  v12 = (void *)sub_21DCCF140();
  v13 = objc_allocWithZone(MEMORY[0x24BE0CB48]);
  sub_21DCCF26C();
  v14 = sub_21DCCF1E0(v12);
  if (qword_2553AD598 != -1)
    swift_once();
  v15 = objc_msgSend(objc_msgSend((id)qword_2553AD970, sel_ContextualUnderstanding), sel_SoundAnalysis);
  sub_21DCCF260();
  v16 = objc_msgSend(v3, sel_DSLPublisher);
  v17 = objc_msgSend(v16, sel_subscribeOn_, v14);

  v18 = sub_21DCCF15C((uint64_t)sub_21DCCC8F8);
  v19 = sub_21DCCE7EC();
  *(_QWORD *)(v19 + 16) = v22;
  *(_QWORD *)(v19 + 24) = v23;
  sub_21DCCF15C((uint64_t)sub_21DCCEB84);
  sub_21DCCF240();
  v20 = swift_release();
  v21 = sub_21DCCF218(v20, sel_sinkWithCompletion_receiveInput_);
  sub_21DCCF278();
  _Block_release(v18);

  sub_21DCCF1A0();
}

void sub_21DCCEEB4(void *a1, void (*a2)(_QWORD, id))
{
  id v4;
  id v5;
  id v6;

  if ((objc_msgSend(a1, sel_respondsToSelector_, sel_eventBody) & 1) != 0)
  {
    v4 = objc_msgSend(a1, sel_eventBody);
    if (v4)
    {
      v5 = v4;
      v6 = v4;
      a2(0, v5);

    }
  }
  else
  {
    __break(1u);
  }
}

unint64_t sub_21DCCEF54()
{
  unint64_t result;

  result = qword_2553AD818;
  if (!qword_2553AD818)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2553AD818);
  }
  return result;
}

unint64_t sub_21DCCEF90()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2553AD820;
  if (!qword_2553AD820)
  {
    v1 = sub_21DCD3A4C();
    result = MEMORY[0x22079F40C](MEMORY[0x24BEE5698], v1);
    atomic_store(result, (unint64_t *)&qword_2553AD820);
  }
  return result;
}

unint64_t sub_21DCCEFD0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2553AD830;
  if (!qword_2553AD830)
  {
    v1 = sub_21DCCF014(&qword_2553AD828);
    result = MEMORY[0x22079F40C](MEMORY[0x24BEE12C8], v1);
    atomic_store(result, (unint64_t *)&qword_2553AD830);
  }
  return result;
}

uint64_t sub_21DCCF014(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x22079F400](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

id sub_21DCCF058(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  void *v5;
  id v6;

  v5 = (void *)sub_21DCD39B0();
  swift_bridgeObjectRelease();
  v6 = objc_msgSend(v3, sel_initWithIdentifier_targetQueue_, v5, a3);

  return v6;
}

uint64_t sub_21DCCF0B8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_21DCCF0C8()
{
  return swift_release();
}

uint64_t sub_21DCCF0D0()
{
  swift_release();
  return swift_deallocObject();
}

void sub_21DCCF0F4(void *a1)
{
  uint64_t v1;

  sub_21DCCEEB4(a1, *(void (**)(_QWORD, id))(v1 + 16));
}

void sub_21DCCF0FC(void *a1)
{
  uint64_t v1;

  sub_21DCCEAE4(a1, *(void (**)(id, _QWORD))(v1 + 16));
}

uint64_t sub_21DCCF120()
{
  return sub_21DCD3AA0();
}

uint64_t sub_21DCCF140()
{
  return sub_21DCD3A64();
}

void *sub_21DCCF15C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 - 128) = a1;
  *(_QWORD *)(v2 - 120) = v1;
  return _Block_copy((const void *)(v2 - 144));
}

uint64_t sub_21DCCF168()
{
  return sub_21DCD398C();
}

uint64_t sub_21DCCF184()
{
  return sub_21DCD3A4C();
}

uint64_t sub_21DCCF1CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  *(_QWORD *)(v3 - 168) = a3;
  *(_QWORD *)(v3 - 160) = a1;
  *(_QWORD *)(v3 - 152) = a2;
  return sub_21DCD3A58();
}

id sub_21DCCF1E0(void *a1)
{
  uint64_t v1;
  uint64_t v2;

  return sub_21DCCF058(*(_QWORD *)(v2 - 168), v1, a1);
}

void sub_21DCCF1F4(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  uint8_t *v4;
  NSObject *v5;
  os_log_type_t v6;

  _os_log_impl(a1, v5, v6, a4, v4, 2u);
}

void sub_21DCCF208()
{
  JUMPOUT(0x22079F46CLL);
}

id sub_21DCCF218(uint64_t a1, const char *a2)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;

  return objc_msgSend(v3, a2, v4, v2);
}

uint64_t sub_21DCCF240()
{
  return swift_retain();
}

uint64_t sub_21DCCF250(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 104))(v3, a2, v4);
}

uint64_t sub_21DCCF260()
{
  return swift_unknownObjectRelease();
}

uint64_t sub_21DCCF26C()
{
  return swift_bridgeObjectRetain();
}

void sub_21DCCF278()
{
  const void *v0;

  _Block_release(v0);
}

uint64_t sub_21DCCF284()
{
  return sub_21DCD3980();
}

uint64_t sub_21DCCF290()
{
  return swift_slowAlloc();
}

uint64_t sub_21DCCF2B0(uint64_t a1)
{
  return sub_21DCCF334(a1, qword_2553AD978);
}

uint64_t *sub_21DCCF2D4(uint64_t a1, uint64_t *a2)
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

uint64_t sub_21DCCF314(uint64_t a1)
{
  return sub_21DCCF334(a1, qword_2540DA410);
}

uint64_t sub_21DCCF334(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_21DCD3974();
  sub_21DCCF2D4(v3, a2);
  sub_21DCCDA1C(v3, (uint64_t)a2);
  return sub_21DCD3968();
}

void sub_21DCCF3A8(void *a1, void *a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  id v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  os_log_type_t v22;
  _BOOL4 v23;
  uint8_t *v24;
  uint64_t v25;
  unint64_t v26;
  NSObject *v27;
  os_log_type_t v28;
  _BOOL4 v29;
  uint8_t *v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  id v34;
  void *v35;
  void *v36;
  id v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  NSObject *v41;
  os_log_type_t v42;
  unint64_t v43;
  uint8_t *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char v51;
  NSObject *v52;
  os_log_type_t v53;
  uint8_t *v54;
  void *v55;
  id v56;
  id v57;
  char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  id v63;
  void *v64;
  void *v65;
  void *v66;
  uint64_t v67;
  uint64_t v68;
  unint64_t v69;
  void *v70;
  char *v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  void *v75;
  unint64_t v76;

  v7 = sub_21DCD3914();
  v72 = *(_QWORD *)(v7 - 8);
  v8 = MEMORY[0x24BDAC7A8]();
  v71 = (char *)&v67 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = a1;
  if (!a1)
  {
    v11 = objc_msgSend(sub_21DCD1B7C(v8, sel_ContextualUnderstanding), sel_PeopleDiscovery);
    swift_unknownObjectRelease();
    sub_21DCCFB2C();
    v10 = v12;

  }
  v13 = a1;
  v14 = (uint64_t)a2;
  if (!a2)
  {
    v15 = objc_msgSend(sub_21DCD1B7C((uint64_t)v13, sel_ContextualUnderstanding), sel_SoundAnalysis);
    swift_unknownObjectRelease();
    sub_21DCCFC60();
    v14 = v16;

  }
  v17 = a2;
  v18 = sub_21DCD1C60(v10, a4);
  if (qword_2553AD5A0 != -1)
    swift_once();
  v19 = sub_21DCD3974();
  v20 = sub_21DCCDA1C(v19, (uint64_t)qword_2553AD978);
  sub_21DCD1C38();
  v21 = sub_21DCD1C28();
  v22 = sub_21DCD3A40();
  v23 = os_log_type_enabled(v21, v22);
  v75 = v10;
  v73 = v7;
  if (v23)
  {
    v24 = (uint8_t *)sub_21DCCE174();
    *(_DWORD *)v24 = 134217984;
    if (v18 >> 62)
    {
      swift_bridgeObjectRetain();
      v25 = sub_21DCD3B00();
      sub_21DCD1B74();
    }
    else
    {
      v25 = *(_QWORD *)((v18 & 0xFFFFFFFFFFFFF8) + 0x10);
    }
    sub_21DCD1B74();
    v76 = v25;
    sub_21DCD1B30();
    sub_21DCD1B74();
    sub_21DCD1BF0(&dword_21DCCA000, v21, v22, "Number of newly discovered people through Airdrop = %ld", v24);
    sub_21DCCE158();
  }

  sub_21DCD1C30();
  v26 = sub_21DCD2B3C(v14);
  sub_21DCD1C38();
  v27 = sub_21DCD1C28();
  v28 = sub_21DCD3A40();
  v29 = sub_21DCD1C10(v28);
  v74 = (void *)v14;
  if (v29)
  {
    v30 = (uint8_t *)sub_21DCCE174();
    *(_DWORD *)v30 = 134217984;
    if (v26 >> 62)
    {
      sub_21DCD1C00();
      v31 = sub_21DCD3B00();
      sub_21DCD1B60();
    }
    else
    {
      v31 = *(_QWORD *)((v26 & 0xFFFFFFFFFFFFF8) + 0x10);
    }
    sub_21DCD1B60();
    v76 = v31;
    sub_21DCD1B30();
    sub_21DCD1B60();
    sub_21DCD1BF0(&dword_21DCCA000, v27, v28, "Number of newly discovered people through Sound Analysis = %ld", v30);
    sub_21DCCE158();
  }

  sub_21DCD1C30();
  v76 = v18;
  v32 = sub_21DCD084C(v26);
  v33 = v76;
  v34 = objc_msgSend(sub_21DCD1B7C(v32, sel_ContextualUnderstanding), sel_PhysicalSocial);
  swift_unknownObjectRelease();
  sub_21DCCFD94();
  v36 = v35;
  if (v35)
  {
    v37 = objc_msgSend(v35, sel_discoveredPeople);
    sub_21DCD1BF8((uint64_t)v37, &qword_2553AD840);
    v38 = sub_21DCD3A04();

    v68 = sub_21DCD1490(v36);
    v40 = v39;
  }
  else
  {
    v68 = 0;
    v40 = 0;
    v38 = MEMORY[0x24BEE4AF8];
  }
  sub_21DCD1C38();
  v70 = (void *)v20;
  v41 = sub_21DCD1C28();
  v42 = sub_21DCD3A40();
  v43 = v38 >> 62;
  if (sub_21DCD1C10(v42))
  {
    v44 = (uint8_t *)sub_21DCCE174();
    *(_DWORD *)v44 = 134217984;
    if (v43)
    {
      swift_bridgeObjectRetain();
      v45 = sub_21DCD3B00();
      sub_21DCD1B58();
    }
    else
    {
      v45 = *(_QWORD *)((v38 & 0xFFFFFFFFFFFFF8) + 0x10);
    }
    sub_21DCD1B58();
    v76 = v45;
    sub_21DCD1B30();
    sub_21DCD1B58();
    sub_21DCD1BF0(&dword_21DCCA000, v41, v42, "Number of last discovered people = %ld", v44);
    sub_21DCCE158();
  }

  v46 = sub_21DCD1C30();
  if (v33 >> 62)
  {
    swift_bridgeObjectRetain();
    v47 = sub_21DCD3B00();
    v46 = swift_bridgeObjectRelease();
    if (!v43)
      goto LABEL_24;
LABEL_37:
    swift_bridgeObjectRetain();
    v48 = sub_21DCD3B00();
    v46 = sub_21DCD1B58();
    goto LABEL_25;
  }
  v47 = *(_QWORD *)((v33 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (v43)
    goto LABEL_37;
LABEL_24:
  v48 = *(_QWORD *)((v38 & 0xFFFFFFFFFFFFF8) + 0x10);
LABEL_25:
  if (v47 == v48)
  {
    v49 = sub_21DCCFEC8(v33);
    v50 = sub_21DCCFEC8(v38);
    v51 = sub_21DCD0080(v49, v50);
    sub_21DCD1B60();
    v46 = swift_bridgeObjectRelease();
    if ((v51 & 1) != 0)
    {
      sub_21DCD1B58();
      swift_bridgeObjectRelease();
      sub_21DCD1B74();
      v52 = sub_21DCD395C();
      v53 = sub_21DCD3A40();
      if (os_log_type_enabled(v52, v53))
      {
        v54 = (uint8_t *)sub_21DCCE174();
        *(_WORD *)v54 = 0;
        _os_log_impl(&dword_21DCCA000, v52, v53, "Newly discovered people same as last discovered people", v54, 2u);
        sub_21DCCE158();
      }
      v64 = v36;
      goto LABEL_34;
    }
  }
  v69 = v33;
  v70 = v36;
  if (!v36)
  {
    sub_21DCD1B58();
    sub_21DCD1B74();
    goto LABEL_33;
  }
  if (v40)
  {
    sub_21DCD1BF8(v46, &qword_2553AD838);
    v55 = (void *)sub_21DCD1BC8();
    sub_21DCD38D8();
    sub_21DCD3A34();
    sub_21DCD1BD4();
    v56 = sub_21DCD1C1C(v68, v40, v38, v55);
    objc_msgSend(v56, sel_setHasStartTimeInSecondsSinceReferenceDate_, 0);
    v57 = sub_21DCD1B7C((uint64_t)objc_msgSend(v56, sel_setHasEndTimeInSecondsSinceReferenceDate_, 1), sel_source);
    objc_msgSend(v57, sel_sendEvent_, v56);

LABEL_33:
    v58 = v71;
    sub_21DCD3908();
    v59 = sub_21DCD38FC();
    v61 = v60;
    (*(void (**)(char *, uint64_t))(v72 + 8))(v58, v73);
    sub_21DCD38D8();
    v62 = (void *)sub_21DCD3A34();
    sub_21DCD1BF8((uint64_t)v62, &qword_2553AD838);
    sub_21DCD1BC8();
    sub_21DCD1BD4();
    v52 = sub_21DCD1C1C(v59, v61, v69, v62);
    -[NSObject setHasStartTimeInSecondsSinceReferenceDate:](v52, sel_setHasStartTimeInSecondsSinceReferenceDate_, 1);
    v63 = sub_21DCD1B7C((uint64_t)-[NSObject setHasEndTimeInSecondsSinceReferenceDate:](v52, sel_setHasEndTimeInSecondsSinceReferenceDate_, 0), sel_source);
    objc_msgSend(v63, (SEL)&stru_24E1B6340.types, v52);

    v34 = v63;
    v64 = v70;
LABEL_34:
    v65 = v74;
    v66 = v75;

    return;
  }
  __break(1u);
}

void sub_21DCCFB2C()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  id v7;

  sub_21DCCDBC4(&qword_2553AD850);
  sub_21DCCF1BC();
  MEMORY[0x24BDAC7A8]();
  sub_21DCD1AA4();
  MEMORY[0x24BDAC7A8]();
  sub_21DCD1BA0();
  v1 = sub_21DCD1B84();
  v2 = sub_21DCD1AE8(v1);
  sub_21DCD1A38(v2);
  v3 = objc_allocWithZone(MEMORY[0x24BE0CC98]);
  v4 = sub_21DCD1A6C();
  v5 = sub_21DCD1B68((uint64_t)v4, sel_publisherWithOptions_);
  sub_21DCD1BC0();
  sub_21DCD1A8C((uint64_t)sub_21DCCC8F8);
  sub_21DCD1B90((uint64_t)sub_21DCD1844);
  sub_21DCD1A8C((uint64_t)sub_21DCD03B0);
  sub_21DCD1B20();
  v6 = sub_21DCD1C48();
  v7 = sub_21DCD1B10(v6, sel_sinkWithCompletion_receiveInput_);
  sub_21DCD1BE0();
  sub_21DCD1BE8();
  sub_21DCCE228();

  sub_21DCD1AC0();
  sub_21DCD1C40();
  sub_21DCD1C08();
  sub_21DCD1AFC();
}

void sub_21DCCFC60()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  id v7;

  sub_21DCCDBC4(&qword_2553AD850);
  sub_21DCCF1BC();
  MEMORY[0x24BDAC7A8]();
  sub_21DCD1AA4();
  MEMORY[0x24BDAC7A8]();
  sub_21DCD1BA0();
  v1 = sub_21DCD1B84();
  v2 = sub_21DCD1AE8(v1);
  sub_21DCD1A38(v2);
  v3 = objc_allocWithZone(MEMORY[0x24BE0CC98]);
  v4 = sub_21DCD1A6C();
  v5 = sub_21DCD1B68((uint64_t)v4, sel_publisherWithOptions_);
  sub_21DCD1BC0();
  sub_21DCD1A8C((uint64_t)sub_21DCCC8F8);
  sub_21DCD1B90((uint64_t)sub_21DCD1814);
  sub_21DCD1A8C((uint64_t)sub_21DCD03B0);
  sub_21DCD1B20();
  v6 = sub_21DCD1C48();
  v7 = sub_21DCD1B10(v6, sel_sinkWithCompletion_receiveInput_);
  sub_21DCD1BE0();
  sub_21DCD1BE8();
  sub_21DCCE228();

  sub_21DCD1AC0();
  sub_21DCD1C40();
  sub_21DCD1C08();
  sub_21DCD1AFC();
}

void sub_21DCCFD94()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  id v7;

  sub_21DCCDBC4(&qword_2553AD850);
  sub_21DCCF1BC();
  MEMORY[0x24BDAC7A8]();
  sub_21DCD1AA4();
  MEMORY[0x24BDAC7A8]();
  sub_21DCD1BA0();
  v1 = sub_21DCD1B84();
  v2 = sub_21DCD1AE8(v1);
  sub_21DCD1A38(v2);
  v3 = objc_allocWithZone(MEMORY[0x24BE0CC98]);
  v4 = sub_21DCD1A6C();
  v5 = sub_21DCD1B68((uint64_t)v4, sel_publisherWithOptions_);
  sub_21DCD1BC0();
  sub_21DCD1A8C((uint64_t)sub_21DCCC8F8);
  sub_21DCD1B90((uint64_t)sub_21DCD17BC);
  sub_21DCD1A8C((uint64_t)sub_21DCD03B0);
  sub_21DCD1B20();
  v6 = sub_21DCD1C48();
  v7 = sub_21DCD1B10(v6, sel_sinkWithCompletion_receiveInput_);
  sub_21DCD1BE0();
  sub_21DCD1BE8();
  sub_21DCCE228();

  sub_21DCD1AC0();
  sub_21DCD1C40();
  sub_21DCD1C08();
  sub_21DCD1AFC();
}

uint64_t sub_21DCCFEC8(unint64_t a1)
{
  uint64_t v2;
  uint64_t i;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v18 = MEMORY[0x24BEE4B08];
  if (a1 >> 62)
  {
LABEL_26:
    sub_21DCD1C00();
    v2 = sub_21DCD3B00();
    if (v2)
      goto LABEL_3;
LABEL_27:
    sub_21DCD1B60();
    return MEMORY[0x24BEE4B08];
  }
  v2 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  sub_21DCD1C00();
  if (!v2)
    goto LABEL_27;
LABEL_3:
  for (i = 4; ; ++i)
  {
    if ((a1 & 0xC000000000000001) != 0)
      v4 = (id)MEMORY[0x22079F0C4](i - 4, a1);
    else
      v4 = *(id *)(a1 + 8 * i);
    v5 = v4;
    v6 = i - 3;
    if (__OFADD__(i - 4, 1))
    {
      __break(1u);
      goto LABEL_26;
    }
    sub_21DCD1B4C();
    if (v7)
    {
      sub_21DCD1A98();
      sub_21DCD1AD4();
      if (!v8)
      {
        sub_21DCD1B40();
        if (v15)
        {
          sub_21DCD1A98();
          sub_21DCD1AD4();
          if (!v16)
          {
LABEL_22:

            goto LABEL_23;
          }
        }
      }
    }
    sub_21DCD1B4C();
    sub_21DCD1A98();
    if (i != 4)
    {
      sub_21DCD1B4C();
      if (v9)
      {
        sub_21DCD1A98();
        sub_21DCD1AD4();
        if (v10)
          break;
      }
    }
    sub_21DCD1B40();
    sub_21DCD1A98();
    if (i == 4)
      goto LABEL_22;
    sub_21DCD1B40();
    if (!v13)
      goto LABEL_22;
    sub_21DCD1A98();
    sub_21DCD1AD4();
    if (!v14)
      goto LABEL_22;
    result = sub_21DCD1B40();
    if (!v12)
      goto LABEL_29;
LABEL_19:
    sub_21DCD0A00(&v17, result, v12);

    swift_bridgeObjectRelease();
LABEL_23:
    if (v6 == v2)
    {
      sub_21DCD1B60();
      return v18;
    }
  }
  result = sub_21DCD1B4C();
  if (v12)
    goto LABEL_19;
  __break(1u);
LABEL_29:
  __break(1u);
  return result;
}

uint64_t sub_21DCD0080(uint64_t result, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t i;
  int64_t v11;
  unint64_t v12;
  int64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  BOOL v24;
  uint64_t v25;
  unint64_t j;
  uint64_t v27;
  _QWORD *v28;
  BOOL v29;
  uint64_t v30;
  int64_t v31;
  int64_t v32;

  if (result == a2)
    return 1;
  if (*(_QWORD *)(result + 16) != *(_QWORD *)(a2 + 16))
    return 0;
  v3 = 0;
  v4 = *(_QWORD *)(result + 56);
  v30 = result + 56;
  v5 = 1 << *(_BYTE *)(result + 32);
  if (v5 < 64)
    v6 = ~(-1 << v5);
  else
    v6 = -1;
  v7 = v6 & v4;
  v31 = (unint64_t)(v5 + 63) >> 6;
  v8 = a2 + 56;
  if ((v6 & v4) == 0)
    goto LABEL_8;
LABEL_7:
  v9 = __clz(__rbit64(v7));
  v7 &= v7 - 1;
  v32 = v3;
  for (i = v9 | (v3 << 6); ; i = __clz(__rbit64(v12)) + (v13 << 6))
  {
    v15 = result;
    v16 = (uint64_t *)(*(_QWORD *)(result + 48) + 16 * i);
    v18 = *v16;
    v17 = v16[1];
    sub_21DCD3B3C();
    swift_bridgeObjectRetain();
    sub_21DCD39D4();
    v19 = sub_21DCD3B48();
    v20 = -1 << *(_BYTE *)(a2 + 32);
    v21 = v19 & ~v20;
    if (((*(_QWORD *)(v8 + ((v21 >> 3) & 0xFFFFFFFFFFFFF8)) >> v21) & 1) == 0)
      goto LABEL_41;
    v22 = *(_QWORD *)(a2 + 48);
    v23 = (_QWORD *)(v22 + 16 * v21);
    v24 = *v23 == v18 && v23[1] == v17;
    if (!v24 && (sub_21DCD3B18() & 1) == 0)
    {
      v25 = ~v20;
      for (j = v21 + 1; ; j = v27 + 1)
      {
        v27 = j & v25;
        if (((*(_QWORD *)(v8 + (((j & v25) >> 3) & 0xFFFFFFFFFFFFF8)) >> (j & v25)) & 1) == 0)
          break;
        v28 = (_QWORD *)(v22 + 16 * v27);
        v29 = *v28 == v18 && v28[1] == v17;
        if (v29 || (sub_21DCD3B18() & 1) != 0)
          goto LABEL_30;
      }
LABEL_41:
      swift_bridgeObjectRelease();
      return 0;
    }
LABEL_30:
    swift_bridgeObjectRelease();
    result = v15;
    v3 = v32;
    if (v7)
      goto LABEL_7;
LABEL_8:
    v11 = v3 + 1;
    if (__OFADD__(v3, 1))
    {
      __break(1u);
      goto LABEL_44;
    }
    if (v11 >= v31)
      return 1;
    v12 = *(_QWORD *)(v30 + 8 * v11);
    v13 = v3 + 1;
    if (!v12)
    {
      v13 = v3 + 2;
      if (v3 + 2 >= v31)
        return 1;
      v12 = *(_QWORD *)(v30 + 8 * v13);
      if (!v12)
      {
        v13 = v3 + 3;
        if (v3 + 3 >= v31)
          return 1;
        v12 = *(_QWORD *)(v30 + 8 * v13);
        if (!v12)
        {
          v13 = v3 + 4;
          if (v3 + 4 >= v31)
            return 1;
          v12 = *(_QWORD *)(v30 + 8 * v13);
          if (!v12)
            break;
        }
      }
    }
LABEL_23:
    v7 = (v12 - 1) & v12;
    v32 = v13;
  }
  v14 = v3 + 5;
  if (v3 + 5 >= v31)
    return 1;
  v12 = *(_QWORD *)(v30 + 8 * v14);
  if (v12)
  {
    v13 = v3 + 5;
    goto LABEL_23;
  }
  while (1)
  {
    v13 = v14 + 1;
    if (__OFADD__(v14, 1))
      break;
    if (v13 >= v31)
      return 1;
    v12 = *(_QWORD *)(v30 + 8 * v13);
    ++v14;
    if (v12)
      goto LABEL_23;
  }
LABEL_44:
  __break(1u);
  return result;
}

void sub_21DCD0324(void *a1, uint64_t a2)
{
  id v3;
  void **v4;
  void *v5;
  id v6;

  v3 = objc_msgSend(a1, sel_eventBody);
  if (v3)
  {
    v6 = v3;
    if (objc_msgSend(v3, sel_hasStartTimeInSecondsSinceReferenceDate))
    {
      v4 = (void **)(a2 + 16);
      swift_beginAccess();
      v5 = *v4;
      *v4 = v6;

    }
    else
    {

    }
  }
}

void sub_21DCD03B4(void *a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  os_log_type_t v11;
  uint64_t v12;
  NSObject *oslog;
  uint64_t v14[3];
  uint64_t v15;

  v7 = objc_msgSend(a1, sel_eventBody);
  if (v7)
  {
    v8 = v7;
    swift_beginAccess();
    v9 = *(void **)(a2 + 16);
    *(_QWORD *)(a2 + 16) = v8;

  }
  else
  {
    if (qword_2553AD5A0 != -1)
      swift_once();
    v10 = sub_21DCD3974();
    sub_21DCCDA1C(v10, (uint64_t)qword_2553AD978);
    oslog = sub_21DCD395C();
    v11 = sub_21DCD3A40();
    if (os_log_type_enabled(oslog, v11))
    {
      v12 = sub_21DCCE174();
      v14[0] = sub_21DCCE174();
      *(_DWORD *)v12 = 136315394;
      v15 = sub_21DCD2F9C(0xD000000000000091, 0x800000021DCD50A0, v14);
      sub_21DCD1BB0();
      *(_WORD *)(v12 + 12) = 2080;
      v15 = sub_21DCD2F9C(a3, a4, v14);
      sub_21DCD1BB0();
      _os_log_impl(&dword_21DCCA000, oslog, v11, "%s:%s: Exception: No eventBody retreived from event", (uint8_t *)v12, 0x16u);
      swift_arrayDestroy();
      sub_21DCCE158();
    }

  }
}

id sub_21DCD0594(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  void *v5;
  void *v6;
  void *v9;
  void *v10;
  id v11;

  v6 = v5;
  if (a2)
  {
    v9 = (void *)sub_21DCD39B0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v9 = 0;
  }
  sub_21DCCDC9C(0, &qword_2553AD840);
  v10 = (void *)sub_21DCD39F8();
  swift_bridgeObjectRelease();
  v11 = objc_msgSend(v6, sel_initWithLocalIdentifier_discoveredPeople_startTimeInSecondsSinceReferenceDate_endTimeInSecondsSinceReferenceDate_, v9, v10, a4, a5);

  return v11;
}

id sub_21DCD0654(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  void *v5;
  void *v6;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;

  v6 = v5;
  v12 = sub_21DCD38F0();
  v13 = 0;
  if (sub_21DCD17C4(a1, 1, v12) != 1)
  {
    v13 = (void *)sub_21DCD38E4();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 8))(a1, v12);
  }
  if (sub_21DCD17C4(a2, 1, v12) == 1)
  {
    v14 = 0;
  }
  else
  {
    v14 = (void *)sub_21DCD38E4();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 8))(a2, v12);
  }
  v15 = objc_msgSend(v6, sel_initWithStartDate_endDate_maxEvents_lastN_reversed_, v13, v14, a3, a4, a5 & 1);

  return v15;
}

uint64_t sub_21DCD0754(unint64_t a1, uint64_t a2, unint64_t a3)
{
  BOOL v3;
  uint64_t result;

  if (a2 < 0 || (a3 + 8 * a2 > a1 ? (v3 = a1 + 8 * a2 > a3) : (v3 = 0), v3))
  {
    result = sub_21DCD3B0C();
    __break(1u);
  }
  else
  {
    sub_21DCCDC9C(0, &qword_2553AD840);
    return swift_arrayInitWithCopy();
  }
  return result;
}

uint64_t sub_21DCD084C(unint64_t a1)
{
  unint64_t *v1;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int isUniquelyReferenced_nonNull_bridgeObject;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;

  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    v3 = sub_21DCD3B00();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v4 = *v1;
  if (*v1 >> 62)
  {
    swift_bridgeObjectRetain();
    v5 = sub_21DCD3B00();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v6 = v5 + v3;
  if (__OFADD__(v5, v3))
  {
    __break(1u);
    goto LABEL_24;
  }
  v4 = *v1;
  isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *v1 = v4;
  v5 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v4 & 0x8000000000000000) == 0 && (v4 & 0x4000000000000000) == 0)
  {
    v8 = v4 & 0xFFFFFFFFFFFFFF8;
    if (v6 <= *(_QWORD *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      goto LABEL_16;
    v5 = 1;
  }
  if (v4 >> 62)
    goto LABEL_25;
  v9 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    if (v9 <= v6)
      v9 = v6;
    swift_bridgeObjectRetain();
    v4 = MEMORY[0x22079F0D0](v5, v9, 1, v4);
    swift_bridgeObjectRelease();
    *v1 = v4;
    v8 = v4 & 0xFFFFFFFFFFFFFF8;
LABEL_16:
    result = sub_21DCD14FC(v8 + 8 * *(_QWORD *)(v8 + 16) + 32, (*(_QWORD *)(v8 + 24) >> 1) - *(_QWORD *)(v8 + 16), a1);
    if (v11 >= v3)
      break;
LABEL_24:
    __break(1u);
LABEL_25:
    swift_bridgeObjectRetain();
    v9 = sub_21DCD3B00();
    swift_bridgeObjectRelease();
  }
  if (v11 < 1)
    goto LABEL_20;
  v12 = *(_QWORD *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  v13 = __OFADD__(v12, v11);
  v14 = v12 + v11;
  if (!v13)
  {
    *(_QWORD *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10) = v14;
LABEL_20:
    swift_bridgeObjectRelease();
    return sub_21DCD3A10();
  }
  __break(1u);
  return result;
}

uint64_t sub_21DCD0A00(uint64_t *a1, uint64_t a2, uint64_t a3)
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
  sub_21DCD3B3C();
  swift_bridgeObjectRetain();
  sub_21DCD39D4();
  v8 = sub_21DCD3B48();
  v9 = -1 << *(_BYTE *)(v7 + 32);
  v10 = v8 & ~v9;
  if (((*(_QWORD *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0)
  {
    v11 = *(_QWORD *)(v7 + 48);
    v12 = (_QWORD *)(v11 + 16 * v10);
    v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_21DCD3B18() & 1) != 0)
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
      if (v19 || (sub_21DCD3B18() & 1) != 0)
        goto LABEL_7;
    }
  }
  swift_bridgeObjectRelease();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v21 = *v3;
  *v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_21DCD0E84(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_21DCD0BAC()
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
  unint64_t i;
  int64_t v14;
  unint64_t v15;
  int64_t v16;
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
  uint64_t v29;
  _QWORD *v30;

  v1 = v0;
  v2 = *v0;
  sub_21DCCDBC4(&qword_2553AD848);
  v3 = sub_21DCD3AB8();
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
    if (!v7)
      goto LABEL_7;
LABEL_6:
    v12 = __clz(__rbit64(v7));
    v7 &= v7 - 1;
    for (i = v12 | (v11 << 6); ; i = __clz(__rbit64(v15)) + (v11 << 6))
    {
      v17 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * i);
      v18 = *v17;
      v19 = v17[1];
      sub_21DCD3B3C();
      sub_21DCD39D4();
      result = sub_21DCD3B48();
      v20 = -1 << *(_BYTE *)(v4 + 32);
      v21 = result & ~v20;
      v22 = v21 >> 6;
      if (((-1 << v21) & ~*(_QWORD *)(v9 + 8 * (v21 >> 6))) == 0)
      {
        v24 = 0;
        v25 = (unint64_t)(63 - v20) >> 6;
        while (++v22 != v25 || (v24 & 1) == 0)
        {
          v26 = v22 == v25;
          if (v22 == v25)
            v22 = 0;
          v24 |= v26;
          v27 = *(_QWORD *)(v9 + 8 * v22);
          if (v27 != -1)
          {
            v23 = __clz(__rbit64(~v27)) + (v22 << 6);
            goto LABEL_30;
          }
        }
        __break(1u);
LABEL_38:
        __break(1u);
LABEL_39:
        __break(1u);
        return result;
      }
      v23 = __clz(__rbit64((-1 << v21) & ~*(_QWORD *)(v9 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
      *(_QWORD *)(v9 + ((v23 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v23;
      v28 = (_QWORD *)(*(_QWORD *)(v4 + 48) + 16 * v23);
      *v28 = v18;
      v28[1] = v19;
      ++*(_QWORD *)(v4 + 16);
      if (v7)
        goto LABEL_6;
LABEL_7:
      v14 = v11 + 1;
      if (__OFADD__(v11, 1))
        goto LABEL_38;
      if (v14 >= v8)
        goto LABEL_32;
      v15 = v30[v14];
      ++v11;
      if (!v15)
      {
        v11 = v14 + 1;
        if (v14 + 1 >= v8)
          goto LABEL_32;
        v15 = v30[v11];
        if (!v15)
        {
          v11 = v14 + 2;
          if (v14 + 2 >= v8)
            goto LABEL_32;
          v15 = v30[v11];
          if (!v15)
          {
            v16 = v14 + 3;
            if (v16 >= v8)
            {
LABEL_32:
              swift_release();
              v1 = v0;
              v29 = 1 << *(_BYTE *)(v2 + 32);
              if (v29 > 63)
                sub_21DCD101C(0, (unint64_t)(v29 + 63) >> 6, v30);
              else
                *v30 = -1 << v29;
              *(_QWORD *)(v2 + 16) = 0;
              break;
            }
            v15 = v30[v16];
            if (!v15)
            {
              while (1)
              {
                v11 = v16 + 1;
                if (__OFADD__(v16, 1))
                  goto LABEL_39;
                if (v11 >= v8)
                  goto LABEL_32;
                v15 = v30[v11];
                ++v16;
                if (v15)
                  goto LABEL_20;
              }
            }
            v11 = v16;
          }
        }
      }
LABEL_20:
      v7 = (v15 - 1) & v15;
    }
  }
  result = swift_release();
  *v1 = v4;
  return result;
}

uint64_t sub_21DCD0E84(uint64_t result, uint64_t a2, unint64_t a3, char a4)
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
    sub_21DCD0BAC();
  }
  else
  {
    if (v10 > v9)
    {
      result = (uint64_t)sub_21DCD1038();
      goto LABEL_22;
    }
    sub_21DCD11E8();
  }
  v11 = *v4;
  sub_21DCD3B3C();
  sub_21DCD39D4();
  result = sub_21DCD3B48();
  v12 = -1 << *(_BYTE *)(v11 + 32);
  a3 = result & ~v12;
  v13 = v11 + 56;
  if (((*(_QWORD *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8)) >> a3) & 1) != 0)
  {
    v14 = *(_QWORD *)(v11 + 48);
    v15 = (_QWORD *)(v14 + 16 * a3);
    v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (result = sub_21DCD3B18(), (result & 1) != 0))
    {
LABEL_21:
      result = sub_21DCD3B24();
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
          result = sub_21DCD3B18();
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

uint64_t sub_21DCD101C(uint64_t result, uint64_t a2, _QWORD *a3)
{
  if (a2 < 0)
  {
    __break(1u);
  }
  else
  {
    for (; a2; --a2)
      *a3++ = result;
  }
  return result;
}

void *sub_21DCD1038()
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
  uint64_t v12;
  unint64_t v13;
  int64_t v14;
  unint64_t v15;
  unint64_t i;
  int64_t v17;
  unint64_t v18;
  int64_t v19;
  _QWORD *v20;
  uint64_t v21;
  _QWORD *v22;

  v1 = v0;
  sub_21DCCDBC4(&qword_2553AD848);
  v2 = *v0;
  v3 = sub_21DCD3AAC();
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
  v11 = *(_QWORD *)(v2 + 56);
  v12 = -1;
  if (v10 < 64)
    v12 = ~(-1 << v10);
  v13 = v12 & v11;
  v14 = (unint64_t)(v10 + 63) >> 6;
  if ((v12 & v11) == 0)
    goto LABEL_12;
LABEL_11:
  v15 = __clz(__rbit64(v13));
  v13 &= v13 - 1;
  for (i = v15 | (v9 << 6); ; i = __clz(__rbit64(v18)) + (v9 << 6))
  {
    v20 = (_QWORD *)(*(_QWORD *)(v2 + 48) + 16 * i);
    v21 = v20[1];
    v22 = (_QWORD *)(*(_QWORD *)(v4 + 48) + 16 * i);
    *v22 = *v20;
    v22[1] = v21;
    result = (void *)swift_bridgeObjectRetain();
    if (v13)
      goto LABEL_11;
LABEL_12:
    v17 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v17 >= v14)
      goto LABEL_28;
    v18 = *(_QWORD *)(v6 + 8 * v17);
    ++v9;
    if (!v18)
    {
      v9 = v17 + 1;
      if (v17 + 1 >= v14)
        goto LABEL_28;
      v18 = *(_QWORD *)(v6 + 8 * v9);
      if (!v18)
      {
        v9 = v17 + 2;
        if (v17 + 2 >= v14)
          goto LABEL_28;
        v18 = *(_QWORD *)(v6 + 8 * v9);
        if (!v18)
          break;
      }
    }
LABEL_25:
    v13 = (v18 - 1) & v18;
  }
  v19 = v17 + 3;
  if (v19 >= v14)
    goto LABEL_28;
  v18 = *(_QWORD *)(v6 + 8 * v19);
  if (v18)
  {
    v9 = v19;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v19 + 1;
    if (__OFADD__(v19, 1))
      break;
    if (v9 >= v14)
      goto LABEL_28;
    v18 = *(_QWORD *)(v6 + 8 * v9);
    ++v19;
    if (v18)
      goto LABEL_25;
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_21DCD11E8()
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
  unint64_t i;
  int64_t v14;
  unint64_t v15;
  int64_t v16;
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
  int64_t v29;

  v1 = v0;
  v2 = *v0;
  sub_21DCCDBC4(&qword_2553AD848);
  v3 = sub_21DCD3AB8();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
    result = swift_release();
LABEL_34:
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
  if (!v8)
    goto LABEL_7;
LABEL_6:
  v12 = __clz(__rbit64(v8));
  v8 &= v8 - 1;
  for (i = v12 | (v11 << 6); ; i = __clz(__rbit64(v15)) + (v11 << 6))
  {
    v17 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * i);
    v18 = *v17;
    v19 = v17[1];
    sub_21DCD3B3C();
    swift_bridgeObjectRetain();
    sub_21DCD39D4();
    result = sub_21DCD3B48();
    v20 = -1 << *(_BYTE *)(v4 + 32);
    v21 = result & ~v20;
    v22 = v21 >> 6;
    if (((-1 << v21) & ~*(_QWORD *)(v9 + 8 * (v21 >> 6))) == 0)
    {
      v24 = 0;
      v25 = (unint64_t)(63 - v20) >> 6;
      while (++v22 != v25 || (v24 & 1) == 0)
      {
        v26 = v22 == v25;
        if (v22 == v25)
          v22 = 0;
        v24 |= v26;
        v27 = *(_QWORD *)(v9 + 8 * v22);
        if (v27 != -1)
        {
          v23 = __clz(__rbit64(~v27)) + (v22 << 6);
          goto LABEL_30;
        }
      }
      __break(1u);
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    v23 = __clz(__rbit64((-1 << v21) & ~*(_QWORD *)(v9 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
    *(_QWORD *)(v9 + ((v23 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v23;
    v28 = (_QWORD *)(*(_QWORD *)(v4 + 48) + 16 * v23);
    *v28 = v18;
    v28[1] = v19;
    ++*(_QWORD *)(v4 + 16);
    if (v8)
      goto LABEL_6;
LABEL_7:
    v14 = v11 + 1;
    if (__OFADD__(v11, 1))
      goto LABEL_36;
    if (v14 >= v29)
      goto LABEL_32;
    v15 = *(_QWORD *)(v6 + 8 * v14);
    ++v11;
    if (!v15)
    {
      v11 = v14 + 1;
      if (v14 + 1 >= v29)
        goto LABEL_32;
      v15 = *(_QWORD *)(v6 + 8 * v11);
      if (!v15)
      {
        v11 = v14 + 2;
        if (v14 + 2 >= v29)
          goto LABEL_32;
        v15 = *(_QWORD *)(v6 + 8 * v11);
        if (!v15)
          break;
      }
    }
LABEL_20:
    v8 = (v15 - 1) & v15;
  }
  v16 = v14 + 3;
  if (v16 >= v29)
  {
LABEL_32:
    result = swift_release_n();
    v1 = v0;
    goto LABEL_34;
  }
  v15 = *(_QWORD *)(v6 + 8 * v16);
  if (v15)
  {
    v11 = v16;
    goto LABEL_20;
  }
  while (1)
  {
    v11 = v16 + 1;
    if (__OFADD__(v16, 1))
      break;
    if (v11 >= v29)
      goto LABEL_32;
    v15 = *(_QWORD *)(v6 + 8 * v11);
    ++v16;
    if (v15)
      goto LABEL_20;
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_21DCD1490(void *a1)
{
  id v2;
  uint64_t v3;

  v2 = objc_msgSend(a1, sel_localIdentifier);

  if (!v2)
    return 0;
  v3 = sub_21DCD39BC();

  return v3;
}

uint64_t sub_21DCD14FC(uint64_t result, uint64_t a2, unint64_t a3)
{
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t i;
  void (*v10)(_QWORD *);
  id *v11;
  id v12;
  _QWORD v13[4];

  v5 = result;
  v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    v7 = sub_21DCD3B00();
    result = swift_bridgeObjectRelease();
    if (!v7)
      return a3;
  }
  else
  {
    v7 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (!v7)
      return a3;
  }
  if (v5)
  {
    if (v6)
    {
      swift_bridgeObjectRetain();
      v8 = sub_21DCD3B00();
      result = swift_bridgeObjectRelease();
      if (v8 <= a2)
      {
        if (v7 >= 1)
        {
          sub_21DCD17D0();
          swift_bridgeObjectRetain();
          for (i = 0; i != v7; ++i)
          {
            sub_21DCCDBC4(&qword_2553AD858);
            v10 = sub_21DCD1680(v13, i, a3);
            v12 = *v11;
            ((void (*)(_QWORD *, _QWORD))v10)(v13, 0);
            *(_QWORD *)(v5 + 8 * i) = v12;
          }
          swift_bridgeObjectRelease();
          return a3;
        }
        goto LABEL_16;
      }
    }
    else
    {
      if (*(_QWORD *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10) <= a2)
      {
        sub_21DCD0754((a3 & 0xFFFFFFFFFFFFFF8) + 32, *(_QWORD *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10), v5);
        return a3;
      }
      __break(1u);
    }
    __break(1u);
LABEL_16:
    __break(1u);
  }
  __break(1u);
  return result;
}

void (*sub_21DCD1680(_QWORD *a1, unint64_t a2, uint64_t a3))(_QWORD *a1)
{
  _QWORD *v6;

  v6 = malloc(0x28uLL);
  *a1 = v6;
  v6[4] = sub_21DCD1700(v6, a2, a3);
  return sub_21DCD16D4;
}

void sub_21DCD16D4(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD))(*a1 + 32))(*a1);
  free(v1);
}

void (*sub_21DCD1700(_QWORD *a1, unint64_t a2, uint64_t a3))(id *a1)
{
  unint64_t v6;
  id v7;

  v6 = a3 & 0xC000000000000001;
  sub_21DCD2A24(a2, (a3 & 0xC000000000000001) == 0, a3);
  if (v6)
    v7 = (id)MEMORY[0x22079F0C4](a2, a3);
  else
    v7 = *(id *)(a3 + 8 * a2 + 32);
  *a1 = v7;
  return sub_21DCD176C;
}

void sub_21DCD176C(id *a1)
{

}

uint64_t sub_21DCD1774()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_21DCD1798(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a4 - 8) + 56))();
}

uint64_t sub_21DCD17A4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_21DCD17B4()
{
  return swift_release();
}

void sub_21DCD17BC(void *a1)
{
  uint64_t v1;

  sub_21DCD0324(a1, v1);
}

uint64_t sub_21DCD17C4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a3 - 8) + 48))();
}

unint64_t sub_21DCD17D0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2553AD860;
  if (!qword_2553AD860)
  {
    v1 = sub_21DCCF014(&qword_2553AD858);
    result = MEMORY[0x22079F40C](MEMORY[0x24BEE12E0], v1);
    atomic_store(result, (unint64_t *)&qword_2553AD860);
  }
  return result;
}

void sub_21DCD1814(void *a1)
{
  uint64_t v1;

  sub_21DCD03B4(a1, v1, 0xD000000000000020, 0x800000021DCD5140);
}

void sub_21DCD1844(void *a1)
{
  uint64_t v1;

  sub_21DCD03B4(a1, v1, 0xD000000000000022, 0x800000021DCD5170);
}

uint64_t destroy for SocialContextInference()
{
  swift_unknownObjectRelease();
  return swift_release();
}

_QWORD *_s23ContextualUnderstanding22SocialContextInferenceVwCP_0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_unknownObjectRetain();
  swift_retain();
  return a1;
}

_QWORD *assignWithCopy for SocialContextInference(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  return a1;
}

__n128 initializeWithTake for SocialContextInference(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

_OWORD *assignWithTake for SocialContextInference(_OWORD *a1, _OWORD *a2)
{
  swift_unknownObjectRelease();
  *a1 = *a2;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for SocialContextInference(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *((_BYTE *)a1 + 16))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      v2 = *a1;
      if ((unint64_t)*a1 >= 0xFFFFFFFF)
        LODWORD(v2) = -1;
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SocialContextInference(uint64_t result, int a2, int a3)
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
      *(_QWORD *)result = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 16) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for SocialContextInference()
{
  return &type metadata for SocialContextInference;
}

uint64_t sub_21DCD1A38(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  sub_21DCD1798(v2, 1, 1, a1);
  return sub_21DCD1798(v1, 1, 1, a1);
}

id sub_21DCD1A6C()
{
  uint64_t v0;
  uint64_t v1;

  return sub_21DCD0654(v1, v0, 1, 1, 0);
}

void *sub_21DCD1A8C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 - 96) = a1;
  *(_QWORD *)(v2 - 88) = v1;
  return _Block_copy((const void *)(v2 - 112));
}

uint64_t sub_21DCD1A98()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_21DCD1AC0()
{
  return swift_beginAccess();
}

uint64_t sub_21DCD1AE8(uint64_t a1)
{
  *(_QWORD *)(a1 + 16) = 0;
  return sub_21DCD38F0();
}

id sub_21DCD1B10(uint64_t a1, const char *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;

  return objc_msgSend(v2, a2, v3, v4);
}

uint64_t sub_21DCD1B20()
{
  return swift_retain();
}

uint64_t sub_21DCD1B30()
{
  return sub_21DCD3A88();
}

uint64_t sub_21DCD1B40()
{
  SEL *v0;
  void *v1;

  return sub_21DCCDC40(v1, v0);
}

uint64_t sub_21DCD1B4C()
{
  SEL *v0;
  void *v1;

  return sub_21DCCDC40(v1, v0);
}

uint64_t sub_21DCD1B58()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_21DCD1B60()
{
  return swift_bridgeObjectRelease();
}

id sub_21DCD1B68(uint64_t a1, const char *a2)
{
  void *v2;
  uint64_t v3;

  return objc_msgSend(v2, a2, v3);
}

uint64_t sub_21DCD1B74()
{
  return swift_bridgeObjectRelease();
}

id sub_21DCD1B7C(uint64_t a1, const char *a2)
{
  void *v2;

  return objc_msgSend(v2, a2);
}

uint64_t sub_21DCD1B84()
{
  return swift_allocObject();
}

void sub_21DCD1B90(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  *(_QWORD *)(v3 - 80) = a1;
  *(_QWORD *)(v3 - 72) = v1;
  *(_QWORD *)(v3 - 112) = v2;
  *(_QWORD *)(v3 - 104) = v4;
}

uint64_t sub_21DCD1BB0()
{
  return sub_21DCD3A88();
}

void sub_21DCD1BC0()
{
  void *v0;

}

uint64_t sub_21DCD1BC8()
{
  return sub_21DCD3A7C();
}

id sub_21DCD1BD4()
{
  uint64_t v0;

  return objc_allocWithZone(*(Class *)(v0 + 736));
}

void sub_21DCD1BE0()
{
  void *v0;

}

void sub_21DCD1BE8()
{
  const void *v0;

  _Block_release(v0);
}

void sub_21DCD1BF0(void *a1, NSObject *a2, os_log_type_t a3, const char *a4, uint8_t *a5)
{
  _os_log_impl(a1, a2, a3, a4, a5, 0xCu);
}

uint64_t sub_21DCD1BF8(uint64_t a1, unint64_t *a2)
{
  return sub_21DCCDC9C(0, a2);
}

uint64_t sub_21DCD1C00()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_21DCD1C08()
{
  return swift_release();
}

BOOL sub_21DCD1C10(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

id sub_21DCD1C1C(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  void *v4;

  return sub_21DCD0594(a1, a2, a3, a4, v4);
}

uint64_t sub_21DCD1C28()
{
  return sub_21DCD395C();
}

uint64_t sub_21DCD1C30()
{
  return swift_bridgeObjectRelease_n();
}

uint64_t sub_21DCD1C38()
{
  return swift_bridgeObjectRetain_n();
}

id sub_21DCD1C40()
{
  id *v0;

  return *v0;
}

uint64_t sub_21DCD1C48()
{
  return swift_release();
}

ValueMetadata *type metadata accessor for SocialContextStreamUtil()
{
  return &type metadata for SocialContextStreamUtil;
}

uint64_t sub_21DCD1C60(void *a1, uint64_t *a2)
{
  void *v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  uint64_t *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t *v28;
  id v29;
  void *v30;
  uint64_t v32;
  uint64_t v34;
  uint64_t v35;

  v4 = MEMORY[0x24BEE4AF8];
  v35 = MEMORY[0x24BEE4AF8];
  if (a1)
  {
    v3 = (uint64_t *)objc_msgSend(a1, sel_discoveredPersons);
    sub_21DCD1BF8((uint64_t)v3, &qword_2553AD680);
    v4 = sub_21DCD2AD0();

  }
  if ((unint64_t)v4 >> 62)
  {
    if (v4 < 0)
      v3 = (uint64_t *)v4;
    else
      v3 = (uint64_t *)(v4 & 0xFFFFFFFFFFFFFF8);
    swift_bridgeObjectRetain();
    v5 = sub_21DCD3B00();
    sub_21DCD2A7C();
    if (v5)
      goto LABEL_5;
  }
  else
  {
    v5 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v5)
    {
LABEL_5:
      if (v5 >= 1)
      {
        v6 = 0;
        v7 = v4 & 0xC000000000000001;
        while (1)
        {
          if (v7)
            v8 = (uint64_t *)MEMORY[0x22079F0C4](v6, v4);
          else
            v8 = (uint64_t *)*(id *)(v4 + 8 * v6 + 32);
          v9 = v8;
          sub_21DCCDC40(v8, (SEL *)&selRef_identifier);
          sub_21DCD1A98();
          if (v3)
          {
            if (objc_msgSend(v9, sel_flags) == 256)
            {
              v34 = sub_21DCCDC40(v9, (SEL *)&selRef_name);
              v11 = v10;
              v12 = sub_21DCCDC40(v9, (SEL *)&selRef_contactID);
              v14 = v13;
              v15 = v4;
              v16 = v5;
              v17 = v7;
              v18 = sub_21DCD2AF4();
              v20 = v19;
              v21 = objc_allocWithZone(MEMORY[0x24BE0C2E8]);
              v32 = v18;
              v7 = v17;
              v5 = v16;
              v4 = v15;
              v3 = (uint64_t *)sub_21DCD2E58(v34, v11, 0, 0, 0, 0, v12, v14, v32, v20);
              if (v3)
                goto LABEL_14;
            }
            else
            {
              v23 = sub_21DCD2AF4();
              if (v24)
              {
                v25 = v24;
              }
              else
              {
                v23 = 0;
                v25 = (void *)0xE000000000000000;
              }
              v3 = a2;
              sub_21DCD1F70(v23, v25);
              v27 = v26;
              sub_21DCD1B60();
              if (v27)
              {
                sub_21DCD2760(v27);
                v3 = v28;

                if (v3)
                {
LABEL_14:
                  v22 = v3;
                  MEMORY[0x22079EFE0]();
                  if (*(_QWORD *)((v35 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v35 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
                    sub_21DCD2A84();
                  sub_21DCD3A28();
                  v3 = &v35;
                  sub_21DCD3A10();

                  v9 = v22;
                }
              }
            }
          }
          else
          {
            sub_21DCCDC40(v9, (SEL *)&selRef_contactID);
            sub_21DCD1A98();
          }
          ++v6;

          if (v5 == v6)
            goto LABEL_28;
        }
      }
      __break(1u);
      goto LABEL_36;
    }
  }
LABEL_28:
  sub_21DCD2A7C();
  v29 = sub_21DCD2404();
  if (v29)
  {
    v2 = v29;
    sub_21DCD2760(v29);
    if (!v30)
    {
      v4 = (uint64_t)v2;
      goto LABEL_33;
    }
    v4 = v30;
    MEMORY[0x22079EFE0]();
    if (*(_QWORD *)((v35 & 0xFFFFFFFFFFFFFF8) + 0x10) < *(_QWORD *)((v35 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
    {
LABEL_31:
      sub_21DCD3A28();
      sub_21DCD3A10();

LABEL_33:
      return v35;
    }
LABEL_36:
    sub_21DCD2A84();
    goto LABEL_31;
  }
  return v35;
}

void sub_21DCD1F70(uint64_t a1, id a2)
{
  uint64_t v2;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  uint64_t v19;
  id v20;
  unint64_t v21;
  id v22;
  id v23;
  uint64_t v24;
  void *v25;
  os_log_type_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  void *v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  os_log_type_t v41;
  uint64_t v42;
  uint64_t v43;
  id v44[2];

  v44[1] = *(id *)MEMORY[0x24BDAC8D0];
  sub_21DCCDBC4(&qword_2553AD920);
  v4 = sub_21DCD2B20();
  *(_OWORD *)(v4 + 16) = xmmword_21DCD4140;
  v5 = (void *)*MEMORY[0x24BDBA2E0];
  v6 = (void *)*MEMORY[0x24BDBA2C8];
  *(_QWORD *)(v4 + 32) = *MEMORY[0x24BDBA2E0];
  *(_QWORD *)(v4 + 40) = v6;
  v7 = (void *)*MEMORY[0x24BDBA288];
  v8 = (void *)*MEMORY[0x24BDBA348];
  *(_QWORD *)(v4 + 48) = *MEMORY[0x24BDBA288];
  *(_QWORD *)(v4 + 56) = v8;
  sub_21DCD2B14();
  v9 = *(void **)(v2 + 16);
  v10 = (void *)objc_opt_self();
  v11 = v5;
  v12 = v6;
  v13 = v7;
  v14 = v8;
  v15 = (void *)sub_21DCD39B0();
  v16 = objc_msgSend(v10, sel_predicateForContactsMatchingEmailAddress_, v15);

  sub_21DCCDBC4(&qword_2553AD928);
  v17 = (void *)sub_21DCD2ADC();
  v44[0] = 0;
  v18 = objc_msgSend(v9, sel_unifiedContactsMatchingPredicate_keysToFetch_error_, v16, v17, v44);

  v20 = v44[0];
  if (v18)
  {
    sub_21DCD1BF8(v19, &qword_2553AD930);
    v21 = sub_21DCD3A04();
    v22 = v20;

    if (v21 >> 62)
    {
      sub_21DCD2B34();
      v29 = sub_21DCD3B00();
      sub_21DCD2A58();
      if (v29)
        goto LABEL_4;
    }
    else if (*(_QWORD *)((v21 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
LABEL_4:
      sub_21DCD2A7C();
      goto LABEL_14;
    }
    v30 = sub_21DCD2A58();
    sub_21DCD1BF8(v30, (unint64_t *)&unk_2553AD938);
    swift_bridgeObjectRetain();
    a2 = sub_21DCD2394();
    v31 = objc_msgSend(v10, sel_predicateForContactsMatchingPhoneNumber_, a2);

    v32 = (void *)sub_21DCD2ADC();
    sub_21DCD2A7C();
    v44[0] = 0;
    v33 = objc_msgSend(v9, sel_unifiedContactsMatchingPredicate_keysToFetch_error_, v31, v32, v44);
    sub_21DCD2B2C();

    v34 = v44[0];
    if (a2)
    {
      v21 = sub_21DCD3A04();
      v35 = v34;

LABEL_14:
      if (v21 >> 62)
      {
        sub_21DCD2B34();
        v38 = sub_21DCD3B00();
        sub_21DCD2A58();
        if (v38)
          goto LABEL_16;
      }
      else if (*(_QWORD *)((v21 & 0xFFFFFFFFFFFFF8) + 0x10))
      {
LABEL_16:
        if ((v21 & 0xC000000000000001) != 0)
          sub_21DCD2AE8();
        if (*(_QWORD *)((v21 & 0xFFFFFFFFFFFFF8) + 0x10))
        {
          v36 = *(id *)(v21 + 32);
          sub_21DCD2A58();
          goto LABEL_25;
        }
        __break(1u);
        goto LABEL_28;
      }
      sub_21DCD2A58();
      if (qword_2553AD5A0 == -1)
      {
LABEL_22:
        v39 = sub_21DCCE200();
        v40 = (void *)sub_21DCD2A98(v39, (uint64_t)qword_2553AD978);
        v41 = sub_21DCD3A40();
        if (sub_21DCD2AC0(v41))
        {
          *(_WORD *)sub_21DCCF290() = 0;
          sub_21DCD2AAC(&dword_21DCCA000, v42, v43, "Exception: No new contact returned");
          sub_21DCCE158();
        }

        goto LABEL_25;
      }
LABEL_28:
      swift_once();
      goto LABEL_22;
    }
    v37 = v44[0];
  }
  else
  {
    v23 = v44[0];
    sub_21DCD2A7C();
  }
  sub_21DCD38CC();
  sub_21DCD2B2C();
  swift_willThrow();
  if (qword_2553AD5A0 != -1)
    swift_once();
  v24 = sub_21DCCE200();
  v25 = (void *)sub_21DCD2A98(v24, (uint64_t)qword_2553AD978);
  v26 = sub_21DCD3A40();
  if (sub_21DCCE1E8(v26))
  {
    *(_WORD *)sub_21DCCF290() = 0;
    sub_21DCCE1B0(&dword_21DCCA000, v27, v28, "Exception: Couldn't obtain new contact");
    sub_21DCCE158();
  }

LABEL_25:
  sub_21DCD2A60();
}

id sub_21DCD2394()
{
  id v0;
  void *v1;
  id v2;

  v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v1 = (void *)sub_21DCD39B0();
  swift_bridgeObjectRelease();
  v2 = objc_msgSend(v0, sel_initWithStringValue_, v1);

  return v2;
}

id sub_21DCD2404()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  void *v22;
  os_log_type_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  os_log_type_t v29;
  uint64_t v30;
  uint64_t v31;
  id v33[2];

  v33[1] = *(id *)MEMORY[0x24BDAC8D0];
  sub_21DCCDBC4(&qword_2553AD920);
  v1 = sub_21DCD2B20();
  *(_OWORD *)(v1 + 16) = xmmword_21DCD4140;
  v2 = (void *)*MEMORY[0x24BDBA2E0];
  v3 = (void *)*MEMORY[0x24BDBA2C8];
  *(_QWORD *)(v1 + 32) = *MEMORY[0x24BDBA2E0];
  *(_QWORD *)(v1 + 40) = v3;
  v4 = (void *)*MEMORY[0x24BDBA288];
  v5 = (void *)*MEMORY[0x24BDBA348];
  *(_QWORD *)(v1 + 48) = *MEMORY[0x24BDBA288];
  *(_QWORD *)(v1 + 56) = v5;
  sub_21DCD2B14();
  v6 = *(_QWORD *)(v0 + 16);
  v7 = (void *)objc_opt_self();
  v8 = v2;
  v9 = v3;
  v10 = v4;
  v11 = v5;
  v12 = objc_msgSend(v7, sel_nm_predicateForMeContact);
  sub_21DCCDBC4(&qword_2553AD928);
  v13 = (void *)sub_21DCD39F8();
  sub_21DCD2A58();
  v33[0] = 0;
  v14 = objc_msgSend((id)v6, sel_unifiedContactsMatchingPredicate_keysToFetch_error_, v12, v13, v33);

  v16 = v33[0];
  if (!v14)
  {
    v20 = v33[0];
    sub_21DCD38CC();
    sub_21DCD2B2C();
    swift_willThrow();
    if (qword_2553AD5A0 == -1)
    {
LABEL_9:
      v21 = sub_21DCCE200();
      v22 = (void *)sub_21DCD2A98(v21, (uint64_t)qword_2553AD978);
      v23 = sub_21DCD3A40();
      if (sub_21DCCE1E8(v23))
      {
        *(_WORD *)sub_21DCCF290() = 0;
        sub_21DCCE1B0(&dword_21DCCA000, v24, v25, "Exception: Couldn't obtain me contact");
        sub_21DCCE158();
      }

      return 0;
    }
LABEL_22:
    swift_once();
    goto LABEL_9;
  }
  sub_21DCD1BF8(v15, &qword_2553AD930);
  v6 = sub_21DCD2AD0();
  v17 = v16;

  if (!(v6 >> 62))
  {
    if (*(_QWORD *)((v6 & 0xFFFFFFFFFFFFF8) + 0x10))
      goto LABEL_4;
LABEL_13:
    sub_21DCD1B60();
    if (qword_2553AD5A0 != -1)
      swift_once();
    v27 = sub_21DCCE200();
    v28 = (void *)sub_21DCD2A98(v27, (uint64_t)qword_2553AD978);
    v29 = sub_21DCD3A40();
    if (sub_21DCD2AC0(v29))
    {
      *(_WORD *)sub_21DCCF290() = 0;
      sub_21DCD2AAC(&dword_21DCCA000, v30, v31, "Exception: No me contact returned");
      sub_21DCCE158();
    }

    return 0;
  }
  swift_bridgeObjectRetain();
  v26 = sub_21DCD3B00();
  sub_21DCD1B60();
  if (!v26)
    goto LABEL_13;
LABEL_4:
  if ((v6 & 0xC000000000000001) != 0)
  {
    v18 = (id)MEMORY[0x22079F0C4](0, v6);
    goto LABEL_7;
  }
  if (!*(_QWORD *)((v6 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    __break(1u);
    goto LABEL_22;
  }
  v18 = *(id *)(v6 + 32);
LABEL_7:
  v19 = v18;
  sub_21DCD1B60();
  return v19;
}

uint64_t sub_21DCD271C()
{
  uint64_t v0;

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for ContactStoreManager()
{
  return objc_opt_self();
}

void sub_21DCD2760(void *a1)
{
  uint64_t v1;
  void *v2;
  id v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  void *v28;

  v3 = objc_msgSend(a1, sel_phoneNumbers);
  v4 = sub_21DCCDBC4(&qword_2553AD948);
  v5 = sub_21DCD3A04();

  if (v5 >> 62)
  {
    sub_21DCD2B34();
    v6 = sub_21DCD3B00();
    sub_21DCD2A58();
  }
  else
  {
    v6 = *(_QWORD *)((v5 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  if (v6)
  {
    if ((v5 & 0xC000000000000001) != 0)
      sub_21DCD2AE8();
    if (!*(_QWORD *)((v5 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
LABEL_28:
      MEMORY[0x22079F0C4](0, v4);
LABEL_16:
      sub_21DCD2B00();
      v14 = objc_msgSend(v2, sel_value);

      if (v14)
      {
        v15 = sub_21DCD39BC();
        v2 = (void *)v15;
        v17 = v16;
      }
      else
      {
        v2 = 0;
        v17 = 0;
      }
      goto LABEL_20;
    }
    v7 = *(id *)(v5 + 32);
    sub_21DCD2A58();
    v8 = objc_msgSend(v7, sel_value);

    if (v8)
    {
      v10 = objc_msgSend(v8, sel_stringValue);
      v1 = sub_21DCD39BC();
      v6 = v11;

    }
    else
    {
      v1 = 0;
      v6 = 0;
    }
  }
  else
  {
    v9 = sub_21DCD2A58();
    v1 = 0;
    v8 = 0;
  }
  v12 = sub_21DCD2B0C(v9, sel_emailAddresses);
  v4 = sub_21DCD3A04();

  if ((unint64_t)v4 >> 62)
  {
    if (v4 < 0)
      v2 = (void *)v4;
    else
      v2 = (void *)(v4 & 0xFFFFFFFFFFFFFF8);
    swift_bridgeObjectRetain();
    sub_21DCD3B00();
    sub_21DCD2B00();
  }
  else
  {
    v2 = *(void **)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v28 = v8;
  if (!v2)
  {
    v15 = swift_bridgeObjectRelease();
    v17 = 0;
    v14 = 0;
LABEL_20:
    v18 = sub_21DCD2B0C(v15, sel_givenName);
    v19 = sub_21DCD39BC();
    v21 = v20;

    v23 = sub_21DCD2B0C(v22, sel_identifier);
    v24 = sub_21DCD39BC();
    v26 = v25;

    v27 = objc_allocWithZone(MEMORY[0x24BE0C2E8]);
    sub_21DCD2E58(v19, v21, v1, v6, (uint64_t)v2, v17, v24, v26, 0, 0);

    sub_21DCD2A60();
    return;
  }
  if ((v4 & 0xC000000000000001) != 0)
    goto LABEL_28;
  if (*(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    v13 = *(id *)(v4 + 32);
    goto LABEL_16;
  }
  __break(1u);
}

unint64_t sub_21DCD2A24(unint64_t result, char a2, uint64_t a3)
{
  if ((a2 & 1) != 0)
  {
    if ((result & 0x8000000000000000) != 0)
    {
      __break(1u);
    }
    else if (*(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10) > result)
    {
      return result;
    }
    __break(1u);
  }
  return result;
}

ValueMetadata *type metadata accessor for SocialContextUsingAirdrop()
{
  return &type metadata for SocialContextUsingAirdrop;
}

uint64_t sub_21DCD2A58()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_21DCD2A7C()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_21DCD2A84()
{
  return sub_21DCD3A1C();
}

uint64_t sub_21DCD2A98(uint64_t a1, uint64_t a2)
{
  sub_21DCCDA1C(a1, a2);
  return sub_21DCD395C();
}

void sub_21DCD2AAC(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;

  _os_log_impl(a1, v4, v5, a4, v6, 2u);
}

BOOL sub_21DCD2AC0(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

uint64_t sub_21DCD2AD0()
{
  return sub_21DCD3A04();
}

uint64_t sub_21DCD2ADC()
{
  return sub_21DCD39F8();
}

void sub_21DCD2AE8()
{
  JUMPOUT(0x22079F0C4);
}

uint64_t sub_21DCD2AF4()
{
  SEL *v0;
  void *v1;

  return sub_21DCCDC40(v1, v0);
}

uint64_t sub_21DCD2B00()
{
  return swift_bridgeObjectRelease();
}

id sub_21DCD2B0C(uint64_t a1, const char *a2)
{
  void *v2;

  return objc_msgSend(v2, a2);
}

uint64_t sub_21DCD2B14()
{
  return sub_21DCD3A10();
}

uint64_t sub_21DCD2B20()
{
  return swift_allocObject();
}

void sub_21DCD2B2C()
{
  void *v0;

}

uint64_t sub_21DCD2B34()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_21DCD2B3C(uint64_t a1)
{
  uint64_t v1;
  id v2;

  if ((sub_21DCD2BFC(a1) & 1) == 0)
    return MEMORY[0x24BEE4AF8];
  sub_21DCCDBC4(&qword_2553AD920);
  v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_21DCD41A0;
  v2 = objc_allocWithZone(MEMORY[0x24BE0C2E8]);
  *(_QWORD *)(v1 + 32) = sub_21DCD2E58(0, 0, 0, 0, 0, 0, 0, 0, 0xD000000000000017, 0x800000021DCD51F0);
  sub_21DCD3A10();
  return v1;
}

uint64_t sub_21DCD2BFC(uint64_t a1)
{
  char v1;
  char v2;

  if (*(_QWORD *)(sub_21DCD2C58(a1) + 16))
  {
    sub_21DCD3704(0xD000000000000015, 0x800000021DCD5210);
    v2 = v1;
    sub_21DCD2A58();
  }
  else
  {
    sub_21DCD2A58();
    v2 = 0;
  }
  return v2 & 1;
}

uint64_t sub_21DCD2C58(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v11;

  if (a1)
  {
    v1 = sub_21DCD3A70();
  }
  else
  {
    sub_21DCCDBC4(&qword_2553AD950);
    v1 = sub_21DCD39A4();
  }
  v2 = v1;
  if (qword_2553AD5A0 != -1)
    swift_once();
  v3 = sub_21DCD3974();
  sub_21DCCDA1C(v3, (uint64_t)qword_2553AD978);
  swift_bridgeObjectRetain_n();
  v4 = sub_21DCD395C();
  v5 = sub_21DCD3A40();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc();
    v11 = swift_slowAlloc();
    *(_DWORD *)v6 = 136315138;
    swift_bridgeObjectRetain();
    sub_21DCCDBC4(&qword_2553AD950);
    v7 = sub_21DCD3998();
    v9 = v8;
    swift_bridgeObjectRelease();
    sub_21DCD2F9C(v7, v9, &v11);
    sub_21DCD3A88();
    sub_21DCD3898();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21DCCA000, v4, v5, "Sounds detected = %s", v6, 0xCu);
    swift_arrayDestroy();
    sub_21DCCE158();
  }

  sub_21DCD3898();
  return v2;
}

id sub_21DCD2E58(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  void *v10;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  if (a2)
  {
    v14 = (void *)sub_21DCD39B0();
    swift_bridgeObjectRelease();
    if (a4)
      goto LABEL_3;
LABEL_6:
    v15 = 0;
    if (a6)
      goto LABEL_4;
    goto LABEL_7;
  }
  v14 = 0;
  if (!a4)
    goto LABEL_6;
LABEL_3:
  v15 = (void *)sub_21DCD39B0();
  swift_bridgeObjectRelease();
  if (a6)
  {
LABEL_4:
    v16 = (void *)sub_21DCD39B0();
    swift_bridgeObjectRelease();
    goto LABEL_8;
  }
LABEL_7:
  v16 = 0;
LABEL_8:
  if (!a8)
  {
    v17 = 0;
    if (a10)
      goto LABEL_10;
LABEL_12:
    v18 = 0;
    goto LABEL_13;
  }
  v17 = (void *)sub_21DCD39B0();
  swift_bridgeObjectRelease();
  if (!a10)
    goto LABEL_12;
LABEL_10:
  v18 = (void *)sub_21DCD39B0();
  swift_bridgeObjectRelease();
LABEL_13:
  v19 = objc_msgSend(v10, sel_initWithName_phoneNumber_emailAddress_cnContactID_unknownPersonID_, v14, v15, v16, v17, v18);

  return v19;
}

uint64_t sub_21DCD2F9C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v12[3];
  uint64_t ObjectType;

  v6 = sub_21DCD306C(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_21DCD3848((uint64_t)v12, *a3);
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
      sub_21DCD3848((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_21DCCDA9C((uint64_t)v12);
  return v7;
}

uint64_t sub_21DCD306C(_QWORD *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  uint64_t v8;
  uint64_t result;
  uint64_t v11;
  _QWORD __src[2];

  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0 && __dst && a3 - (uint64_t)__dst > (uint64_t)(HIBYTE(a6) & 0xF))
    {
      __src[0] = a5;
      __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
      sub_21DCD31C0((char *)__src, HIBYTE(a6) & 0xF, __dst);
      sub_21DCD3A94();
      result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    result = sub_21DCD3284(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    v8 = sub_21DCD3AE8();
    if (!v8)
    {
      result = sub_21DCD3AF4();
      __break(1u);
      return result;
    }
  }
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0)
    return 0;
  else
    return swift_unknownObjectRetain();
}

void *sub_21DCD31C0(char *__src, size_t __n, char *__dst)
{
  void *result;

  if ((__n & 0x8000000000000000) == 0 && (&__dst[__n] <= __src || &__src[__n] <= __dst))
    return memcpy(__dst, __src, __n);
  result = (void *)sub_21DCD3B0C();
  __break(1u);
  return result;
}

uint64_t sub_21DCD3284(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_21DCD3318(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = (uint64_t)sub_21DCD34EC(0, *(_QWORD *)(v2 + 16) + 1, 1, v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = (uint64_t)sub_21DCD34EC((char *)(v3 > 1), v4 + 1, 1, v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_21DCD3318(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  char v6;
  uint64_t result;

  if ((a2 & 0x1000000000000000) != 0)
  {
    v2 = sub_21DCD39E0();
    if (v2)
      goto LABEL_6;
    return MEMORY[0x24BEE4AF8];
  }
  if ((a2 & 0x2000000000000000) != 0)
    v2 = HIBYTE(a2) & 0xF;
  else
    v2 = a1 & 0xFFFFFFFFFFFFLL;
  if (!v2)
    return MEMORY[0x24BEE4AF8];
LABEL_6:
  v3 = sub_21DCD3488(v2, 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    v4 = v3;
    v5 = sub_21DCD3AC4();
    if ((v6 & 1) != 0 || v5 != v2)
      goto LABEL_14;
    return (uint64_t)v4;
  }
  sub_21DCD3B0C();
  __break(1u);
LABEL_14:
  result = sub_21DCD3AF4();
  __break(1u);
  return result;
}

_QWORD *sub_21DCD3488(uint64_t a1, uint64_t a2)
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
  sub_21DCCDBC4(&qword_2553AD958);
  v4 = (_QWORD *)swift_allocObject();
  v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_21DCD34EC(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *(_QWORD *)(a4 + 24);
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
  v8 = *(_QWORD *)(a4 + 16);
  if (v7 <= v8)
    v9 = *(_QWORD *)(a4 + 16);
  else
    v9 = v7;
  if (v9)
  {
    sub_21DCCDBC4(&qword_2553AD958);
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
  v13 = (char *)(a4 + 32);
  if ((v5 & 1) != 0)
  {
    sub_21DCD3684(v13, v8, v12);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_21DCD35C0(v13, v8, v12);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_21DCD35C0(char *__src, size_t __n, char *__dst)
{
  void *result;

  if ((__n & 0x8000000000000000) == 0 && (&__dst[__n] <= __src || &__src[__n] <= __dst))
    return memcpy(__dst, __src, __n);
  result = (void *)sub_21DCD3B0C();
  __break(1u);
  return result;
}

char *sub_21DCD3684(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000) != 0)
  {
    __src = (char *)sub_21DCD3B0C();
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
}

unint64_t sub_21DCD3704(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_21DCD3B3C();
  sub_21DCD39D4();
  v4 = sub_21DCD3B48();
  return sub_21DCD3768(a1, a2, v4);
}

unint64_t sub_21DCD3768(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_21DCD3B18() & 1) == 0)
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
      while (!v14 && (sub_21DCD3B18() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_21DCD3848(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

ValueMetadata *type metadata accessor for SocialContextUsingSound()
{
  return &type metadata for SocialContextUsingSound;
}

uint64_t sub_21DCD3898()
{
  return swift_bridgeObjectRelease_n();
}

uint64_t sub_21DCD38CC()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_21DCD38D8()
{
  return MEMORY[0x24BDCDE98]();
}

uint64_t sub_21DCD38E4()
{
  return MEMORY[0x24BDCE5D8]();
}

uint64_t sub_21DCD38F0()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_21DCD38FC()
{
  return MEMORY[0x24BDCE9B0]();
}

uint64_t sub_21DCD3908()
{
  return MEMORY[0x24BDCEA40]();
}

uint64_t sub_21DCD3914()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_21DCD3920()
{
  return MEMORY[0x24BE4F8A8]();
}

uint64_t sub_21DCD392C()
{
  return MEMORY[0x24BE4F8B0]();
}

uint64_t sub_21DCD3938()
{
  return MEMORY[0x24BE4F8B8]();
}

uint64_t sub_21DCD3944()
{
  return MEMORY[0x24BE4F8C0]();
}

uint64_t sub_21DCD3950()
{
  return MEMORY[0x24BE4F8C8]();
}

uint64_t sub_21DCD395C()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_21DCD3968()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_21DCD3974()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_21DCD3980()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t sub_21DCD398C()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_21DCD3998()
{
  return MEMORY[0x24BEE0270]();
}

uint64_t sub_21DCD39A4()
{
  return MEMORY[0x24BEE02B0]();
}

uint64_t sub_21DCD39B0()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_21DCD39BC()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_21DCD39C8()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_21DCD39D4()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_21DCD39E0()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_21DCD39EC()
{
  return MEMORY[0x24BEE1110]();
}

uint64_t sub_21DCD39F8()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_21DCD3A04()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_21DCD3A10()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_21DCD3A1C()
{
  return MEMORY[0x24BEE1160]();
}

uint64_t sub_21DCD3A28()
{
  return MEMORY[0x24BEE11B8]();
}

uint64_t sub_21DCD3A34()
{
  return MEMORY[0x24BDCFC58]();
}

uint64_t sub_21DCD3A40()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_21DCD3A4C()
{
  return MEMORY[0x24BEE5688]();
}

uint64_t sub_21DCD3A58()
{
  return MEMORY[0x24BEE5760]();
}

uint64_t sub_21DCD3A64()
{
  return MEMORY[0x24BEE57A0]();
}

uint64_t sub_21DCD3A70()
{
  return MEMORY[0x24BE4F8D0]();
}

uint64_t sub_21DCD3A7C()
{
  return MEMORY[0x24BDD01F8]();
}

uint64_t sub_21DCD3A88()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_21DCD3A94()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_21DCD3AA0()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_21DCD3AAC()
{
  return MEMORY[0x24BEE24B8]();
}

uint64_t sub_21DCD3AB8()
{
  return MEMORY[0x24BEE24C0]();
}

uint64_t sub_21DCD3AC4()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_21DCD3AD0()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_21DCD3ADC()
{
  return MEMORY[0x24BEE2660]();
}

uint64_t sub_21DCD3AE8()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_21DCD3AF4()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_21DCD3B00()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_21DCD3B0C()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_21DCD3B18()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_21DCD3B24()
{
  return MEMORY[0x24BEE3ED0]();
}

uint64_t sub_21DCD3B30()
{
  return MEMORY[0x24BDD0708]();
}

uint64_t sub_21DCD3B3C()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_21DCD3B48()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_21DCD3B54()
{
  return MEMORY[0x24BDD07D0]();
}

uint64_t BiomeLibrary()
{
  return MEMORY[0x24BE0C258]();
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

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x24BEE4BA0]();
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

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x24BEE4D40]();
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

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x24BEE4E90]();
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

uint64_t swift_release_n()
{
  return MEMORY[0x24BEE4F00]();
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

uint64_t swift_willThrow()
{
  return MEMORY[0x24BEE5050]();
}

