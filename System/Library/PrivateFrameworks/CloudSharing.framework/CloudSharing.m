const char *CSLogCategoryForCategory()
{
  return "general";
}

id CSLogForCategory(uint64_t a1)
{
  if (CSLogForCategory_onceToken[0] != -1)
    dispatch_once(CSLogForCategory_onceToken, &__block_literal_global);
  return (id)CSLogForCategory_logObjects[a1];
}

id sub_1BD77E044()
{
  id v0;
  void *v1;
  id v2;
  id v3;
  id result;

  v0 = objc_allocWithZone(MEMORY[0x1E0CB3B38]);
  v1 = (void *)sub_1BD7910FC();
  v2 = objc_msgSend(v0, sel_initWithServiceName_, v1);

  v3 = objc_msgSend((id)objc_opt_self(), sel_interfaceWithProtocol_, &unk_1EF500A08);
  objc_msgSend(v2, sel_setRemoteObjectInterface_, v3);

  result = objc_msgSend(v2, sel_resume);
  qword_1EDBB6BE0 = (uint64_t)v2;
  return result;
}

uint64_t sub_1BD77E108()
{
  uint64_t result;

  result = sub_1BD77E124();
  qword_1EDBB6BE8 = result;
  return result;
}

uint64_t sub_1BD77E124()
{
  void *v0;
  void *v1;
  id v2;
  id v3;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  _QWORD aBlock[6];

  if (qword_1EDBB6B80 != -1)
    swift_once();
  v0 = (void *)qword_1EDBB6BE0;
  aBlock[4] = sub_1BD77E2EC;
  aBlock[5] = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1BD77E4C8;
  aBlock[3] = &block_descriptor_278;
  v1 = _Block_copy(aBlock);
  v2 = v0;
  v3 = objc_msgSend(v2, sel_remoteObjectProxyWithErrorHandler_, v1);
  _Block_release(v1);

  sub_1BD7911BC();
  swift_unknownObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDBB6B88);
  if (swift_dynamicCast())
    return v9;
  if (qword_1EDBB6B98 != -1)
    swift_once();
  v5 = sub_1BD7910F0();
  __swift_project_value_buffer(v5, (uint64_t)qword_1EDBB6BA0);
  v6 = sub_1BD7910D8();
  v7 = sub_1BD79118C();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_1BD77B000, v6, v7, "Failed to create SPIHelper remote object proxy", v8, 2u);
    MEMORY[0x1C3B75908](v8, -1, -1);
  }

  return 0;
}

void sub_1BD77E2EC(void *a1)
{
  uint64_t v2;
  id v3;
  id v4;
  os_log_type_t v5;
  uint8_t *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  unint64_t v10;
  NSObject *oslog;
  uint64_t v12;

  if (qword_1EDBB6B98 != -1)
    swift_once();
  v2 = sub_1BD7910F0();
  __swift_project_value_buffer(v2, (uint64_t)qword_1EDBB6BA0);
  v3 = a1;
  v4 = a1;
  oslog = sub_1BD7910D8();
  v5 = sub_1BD79118C();
  if (os_log_type_enabled(oslog, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc();
    v7 = swift_slowAlloc();
    v12 = v7;
    *(_DWORD *)v6 = 136315138;
    v8 = a1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF4FDF90);
    v9 = sub_1BD79112C();
    sub_1BD7878CC(v9, v10, &v12);
    sub_1BD7911A4();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_1BD77B000, oslog, v5, "Received SPIHelper remoteObjectProxy error: %s", v6, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C3B75908](v7, -1, -1);
    MEMORY[0x1C3B75908](v6, -1, -1);

  }
  else
  {

  }
}

void sub_1BD77E4C8(uint64_t a1, void *a2)
{
  void (*v3)(void);
  id v4;

  v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3();
  swift_release();

}

void sub_1BD77E518(uint64_t a1, void (*a2)(_QWORD, _QWORD), uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  _BOOL4 v16;
  uint64_t v17;
  uint8_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint8_t *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  char *v29;
  uint64_t v30;
  void (*v31)(_QWORD, _QWORD);
  uint64_t v32;
  char *v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t aBlock[6];

  sub_1BD791048();
  MEMORY[0x1E0C80A78]();
  v34 = (char *)&v30 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_1BD791054();
  v35 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78]();
  v33 = (char *)&v30 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_1BD7910A8();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78]();
  v12 = (char *)&v30 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1EDBB6B98 != -1)
    swift_once();
  v13 = sub_1BD7910F0();
  __swift_project_value_buffer(v13, (uint64_t)qword_1EDBB6BA0);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, a1, v9);
  v14 = sub_1BD7910D8();
  v15 = sub_1BD791198();
  v16 = os_log_type_enabled(v14, v15);
  v36 = a1;
  if (v16)
  {
    v17 = swift_slowAlloc();
    v32 = a3;
    v18 = (uint8_t *)v17;
    v19 = swift_slowAlloc();
    v30 = v7;
    v20 = v19;
    aBlock[0] = v19;
    *(_DWORD *)v18 = 136315138;
    v31 = a2;
    sub_1BD787F0C(&qword_1EF4FDF28, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAFFF8], MEMORY[0x1E0CB0048]);
    v21 = sub_1BD791210();
    v37 = sub_1BD7878CC(v21, v22, aBlock);
    a2 = v31;
    sub_1BD7911A4();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
    _os_log_impl(&dword_1BD77B000, v14, v15, "callForSharingStatus url: %s", v18, 0xCu);
    swift_arrayDestroy();
    v23 = v20;
    v7 = v30;
    MEMORY[0x1C3B75908](v23, -1, -1);
    v24 = v18;
    a3 = v32;
    MEMORY[0x1C3B75908](v24, -1, -1);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  }

  if (qword_1EDBB6B78 != -1)
    swift_once();
  v25 = (void *)qword_1EDBB6BE8;
  if (qword_1EDBB6BE8)
  {
    swift_unknownObjectRetain();
    v26 = (void *)sub_1BD791084();
    v27 = swift_allocObject();
    *(_QWORD *)(v27 + 16) = a2;
    *(_QWORD *)(v27 + 24) = a3;
    aBlock[4] = (uint64_t)sub_1BD787FCC;
    aBlock[5] = v27;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_1BD77E930;
    aBlock[3] = (uint64_t)&block_descriptor;
    v28 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    objc_msgSend(v25, sel_sharingStatusFor_withReply_, v26, v28);
    _Block_release(v28);
    swift_unknownObjectRelease();
  }
  else
  {
    sub_1BD79103C();
    sub_1BD7875B4(MEMORY[0x1E0DEE9D8]);
    sub_1BD787F0C(&qword_1EF4FDF20, (uint64_t (*)(uint64_t))MEMORY[0x1E0CADE48], MEMORY[0x1E0CADE40]);
    v29 = v33;
    sub_1BD79106C();
    v26 = (void *)sub_1BD791030();
    (*(void (**)(char *, uint64_t))(v35 + 8))(v29, v7);
    a2(0, v26);
  }

}

void sub_1BD77E940(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, void (*a7)(uint64_t, _QWORD, void *), uint64_t a8)
{
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
  void (*v20)(char *, uint64_t, uint64_t);
  NSObject *v21;
  os_log_type_t v22;
  _BOOL4 v23;
  uint64_t v24;
  uint8_t *v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  NSObject *v29;
  os_log_type_t v30;
  uint8_t *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  unint64_t v36;
  NSObject *v37;
  os_log_type_t v38;
  uint8_t *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  unint64_t v44;
  uint64_t v45;
  NSObject *v46;
  os_log_type_t v47;
  uint8_t *v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t v51;
  NSObject *v52;
  os_log_type_t v53;
  uint8_t *v54;
  uint64_t v55;
  uint64_t v56;
  unint64_t v57;
  char v58;
  uint64_t v59;
  NSObject *v60;
  os_log_type_t v61;
  uint8_t *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  uint64_t v70;
  char *v71;
  uint64_t v72;
  void *v73;
  uint64_t v74;
  char *v75;
  char *v76;
  char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  int v83;
  void (*v84)(uint64_t, _QWORD, void *);
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t aBlock[7];

  v84 = a7;
  v85 = a8;
  v83 = a6;
  v86 = a4;
  v87 = a5;
  v89 = a2;
  sub_1BD791048();
  MEMORY[0x1E0C80A78]();
  v77 = (char *)&v74 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_1BD791054();
  v78 = *(_QWORD *)(v11 - 8);
  v79 = v11;
  MEMORY[0x1E0C80A78]();
  v75 = (char *)&v74 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDBB6B70);
  MEMORY[0x1E0C80A78]();
  v76 = (char *)&v74 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_1BD7910A8();
  v15 = *(_QWORD *)(v14 - 8);
  MEMORY[0x1E0C80A78]();
  v17 = (char *)&v74 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1EDBB6B98 != -1)
    swift_once();
  v18 = sub_1BD7910F0();
  v19 = __swift_project_value_buffer(v18, (uint64_t)qword_1EDBB6BA0);
  v20 = *(void (**)(char *, uint64_t, uint64_t))(v15 + 16);
  v80 = a1;
  v20(v17, a1, v14);
  v21 = sub_1BD7910D8();
  v22 = sub_1BD791198();
  v23 = os_log_type_enabled(v21, v22);
  v88 = a3;
  v81 = v15;
  v82 = v14;
  if (v23)
  {
    v24 = swift_slowAlloc();
    v74 = v19;
    v25 = (uint8_t *)v24;
    v26 = swift_slowAlloc();
    aBlock[0] = v26;
    *(_DWORD *)v25 = 136315138;
    sub_1BD787F0C(&qword_1EF4FDF28, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAFFF8], MEMORY[0x1E0CB0048]);
    v27 = sub_1BD791210();
    v90 = sub_1BD7878CC(v27, v28, aBlock);
    sub_1BD7911A4();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
    _os_log_impl(&dword_1BD77B000, v21, v22, "callForFileSharing url: %s", v25, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C3B75908](v26, -1, -1);
    MEMORY[0x1C3B75908](v25, -1, -1);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
  }

  swift_bridgeObjectRetain_n();
  v29 = sub_1BD7910D8();
  v30 = sub_1BD791174();
  if (os_log_type_enabled(v29, v30))
  {
    v31 = (uint8_t *)swift_slowAlloc();
    v32 = swift_slowAlloc();
    aBlock[0] = v32;
    *(_DWORD *)v31 = 136315138;
    v33 = swift_bridgeObjectRetain();
    v34 = MEMORY[0x1C3B754E8](v33, MEMORY[0x1E0DEA968]);
    v36 = v35;
    swift_bridgeObjectRelease();
    v90 = sub_1BD7878CC(v34, v36, aBlock);
    sub_1BD7911A4();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1BD77B000, v29, v30, "callForFileSharing emailAddresses: %s", v31, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C3B75908](v32, -1, -1);
    MEMORY[0x1C3B75908](v31, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  swift_bridgeObjectRetain_n();
  v37 = sub_1BD7910D8();
  v38 = sub_1BD791174();
  if (os_log_type_enabled(v37, v38))
  {
    v39 = (uint8_t *)swift_slowAlloc();
    v40 = swift_slowAlloc();
    aBlock[0] = v40;
    *(_DWORD *)v39 = 136315138;
    v41 = swift_bridgeObjectRetain();
    v42 = MEMORY[0x1C3B754E8](v41, MEMORY[0x1E0DEA968]);
    v44 = v43;
    swift_bridgeObjectRelease();
    v90 = sub_1BD7878CC(v42, v44, aBlock);
    sub_1BD7911A4();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1BD77B000, v37, v38, "callForFileSharing phoneNumbers: %s", v39, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C3B75908](v40, -1, -1);
    MEMORY[0x1C3B75908](v39, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  v45 = v81;
  v46 = sub_1BD7910D8();
  v47 = sub_1BD791174();
  if (os_log_type_enabled(v46, v47))
  {
    v48 = (uint8_t *)swift_slowAlloc();
    v49 = swift_slowAlloc();
    *(_DWORD *)v48 = 136315138;
    v90 = v86;
    aBlock[0] = v49;
    type metadata accessor for ParticipantPermission(0);
    v50 = sub_1BD79112C();
    v90 = sub_1BD7878CC(v50, v51, aBlock);
    sub_1BD7911A4();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1BD77B000, v46, v47, "callForFileSharing accessType: %s", v48, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C3B75908](v49, -1, -1);
    MEMORY[0x1C3B75908](v48, -1, -1);
  }

  v52 = sub_1BD7910D8();
  v53 = sub_1BD791174();
  if (os_log_type_enabled(v52, v53))
  {
    v54 = (uint8_t *)swift_slowAlloc();
    v55 = swift_slowAlloc();
    *(_DWORD *)v54 = 136315138;
    v90 = v87;
    aBlock[0] = v55;
    type metadata accessor for ParticipantPermission(0);
    v56 = sub_1BD79112C();
    v90 = sub_1BD7878CC(v56, v57, aBlock);
    sub_1BD7911A4();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1BD77B000, v52, v53, "callForFileSharing permissionType: %s", v54, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C3B75908](v55, -1, -1);
    MEMORY[0x1C3B75908](v54, -1, -1);
  }

  v58 = v83;
  v59 = v82;
  v60 = sub_1BD7910D8();
  v61 = sub_1BD791174();
  if (os_log_type_enabled(v60, v61))
  {
    v62 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v62 = 67109120;
    LODWORD(aBlock[0]) = v58 & 1;
    sub_1BD7911A4();
    _os_log_impl(&dword_1BD77B000, v60, v61, "callForFileSharing allowOthersToInvite: %{BOOL}d", v62, 8u);
    MEMORY[0x1C3B75908](v62, -1, -1);
  }

  if (qword_1EDBB6B78 != -1)
    swift_once();
  v63 = (void *)qword_1EDBB6BE8;
  if (qword_1EDBB6BE8)
  {
    swift_unknownObjectRetain();
    v64 = (void *)sub_1BD791084();
    v65 = (void *)sub_1BD791150();
    v66 = (void *)sub_1BD791150();
    v67 = swift_allocObject();
    v68 = v85;
    *(_QWORD *)(v67 + 16) = v84;
    *(_QWORD *)(v67 + 24) = v68;
    aBlock[4] = (uint64_t)sub_1BD787FCC;
    aBlock[5] = v67;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_1BD77F364;
    aBlock[3] = (uint64_t)&block_descriptor_6;
    v69 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    objc_msgSend(v63, sel_startFileSharing_emailAddresses_phoneNumbers_accessType_permissionType_allowOthersToInvite_withReply_, v64, v65, v66, v86, v87, v58 & 1, v69);
    _Block_release(v69);
    swift_unknownObjectRelease();

  }
  else
  {
    v70 = (uint64_t)v76;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v45 + 56))(v76, 1, 1, v59);
    sub_1BD79103C();
    sub_1BD7875B4(MEMORY[0x1E0DEE9D8]);
    sub_1BD787F0C(&qword_1EF4FDF20, (uint64_t (*)(uint64_t))MEMORY[0x1E0CADE48], MEMORY[0x1E0CADE40]);
    v71 = v75;
    v72 = v79;
    sub_1BD79106C();
    v73 = (void *)sub_1BD791030();
    (*(void (**)(char *, uint64_t))(v78 + 8))(v71, v72);
    v84(v70, 0, v73);

    sub_1BD787F8C(v70);
  }
}

uint64_t sub_1BD77F364(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v8;
  char *v9;
  void (*v10)(char *, void *, void *);
  uint64_t v11;
  uint64_t v12;
  id v13;
  id v14;
  uint64_t v16;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDBB6B70);
  MEMORY[0x1E0C80A78]();
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *(void (**)(char *, void *, void *))(a1 + 32);
  if (a2)
  {
    sub_1BD79109C();
    v11 = sub_1BD7910A8();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v9, 0, 1, v11);
  }
  else
  {
    v12 = sub_1BD7910A8();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  }
  swift_retain();
  v13 = a3;
  v14 = a4;
  v10(v9, a3, a4);

  swift_release();
  return sub_1BD787F8C((uint64_t)v9);
}

void sub_1BD77F4A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;

  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDBB6B70);
  MEMORY[0x1E0C80A78](v8);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BD7906BC(a1, (uint64_t)v10, &qword_1EDBB6B70);
  v11 = sub_1BD7910A8();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11) != 1)
  {
    v13 = (void *)sub_1BD791084();
    (*(void (**)(char *, uint64_t))(v12 + 8))(v10, v11);
  }
  if (a3)
    v14 = (void *)sub_1BD791078();
  else
    v14 = 0;
  (*(void (**)(uint64_t, void *, uint64_t, void *))(a4 + 16))(a4, v13, a2, v14);

}

void sub_1BD77F5B8(void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7, void (*a8)(uint64_t, _QWORD, void *), uint64_t a9)
{
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  NSObject *v22;
  os_log_type_t v23;
  _BOOL4 v24;
  uint8_t *v25;
  _QWORD *v26;
  id v27;
  NSObject *v28;
  NSObject *v29;
  os_log_type_t v30;
  _BOOL4 v31;
  uint8_t *v32;
  _QWORD *v33;
  NSObject *v34;
  NSObject *v35;
  os_log_type_t v36;
  uint8_t *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  unint64_t v42;
  NSObject *v43;
  os_log_type_t v44;
  uint8_t *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  unint64_t v50;
  NSObject *v51;
  os_log_type_t v52;
  uint8_t *v53;
  uint64_t v54;
  uint64_t v55;
  unint64_t v56;
  NSObject *v57;
  os_log_type_t v58;
  uint8_t *v59;
  uint64_t v60;
  uint64_t v61;
  unint64_t v62;
  char v63;
  NSObject *v64;
  os_log_type_t v65;
  uint8_t *v66;
  void *v67;
  void *v68;
  void *v69;
  uint64_t v70;
  void *v71;
  uint64_t v72;
  uint64_t v73;
  char *v74;
  uint64_t v75;
  void *v76;
  uint64_t v77;
  char *v78;
  char *v79;
  char *v80;
  uint64_t v81;
  uint64_t v82;
  NSObject *v83;
  id v84;
  int v85;
  void (*v86)(uint64_t, _QWORD, void *);
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t aBlock[7];

  v86 = a8;
  v87 = a5;
  v88 = a6;
  v89 = a3;
  v13 = sub_1BD791048();
  MEMORY[0x1E0C80A78](v13);
  v80 = (char *)&v78 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_1BD791054();
  v81 = *(_QWORD *)(v15 - 8);
  v82 = v15;
  MEMORY[0x1E0C80A78](v15);
  v79 = (char *)&v78 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDBB6B70);
  MEMORY[0x1E0C80A78](v17);
  v78 = (char *)&v78 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1EDBB6B98 != -1)
    swift_once();
  v19 = sub_1BD7910F0();
  v20 = __swift_project_value_buffer(v19, (uint64_t)qword_1EDBB6BA0);
  v21 = a1;
  v22 = sub_1BD7910D8();
  v23 = sub_1BD791198();
  v24 = os_log_type_enabled(v22, v23);
  v90 = a4;
  v91 = v20;
  v85 = a7;
  v84 = v21;
  if (v24)
  {
    v25 = (uint8_t *)swift_slowAlloc();
    v26 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v25 = 138412290;
    aBlock[0] = (uint64_t)v21;
    v27 = v21;
    sub_1BD7911A4();
    *v26 = v21;

    _os_log_impl(&dword_1BD77B000, v22, v23, "callForCloudKitAddToShare share: %@", v25, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EDBB6B90);
    swift_arrayDestroy();
    MEMORY[0x1C3B75908](v26, -1, -1);
    MEMORY[0x1C3B75908](v25, -1, -1);

  }
  else
  {

  }
  v28 = a2;
  v29 = sub_1BD7910D8();
  v30 = sub_1BD791198();
  v31 = os_log_type_enabled(v29, v30);
  v83 = v28;
  if (v31)
  {
    v32 = (uint8_t *)swift_slowAlloc();
    v33 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v32 = 138412290;
    aBlock[0] = (uint64_t)v28;
    v34 = v28;
    sub_1BD7911A4();
    *v33 = v28;

    _os_log_impl(&dword_1BD77B000, v29, v30, "callForCloudKitAddToShare containerSetupInfo: %@", v32, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EDBB6B90);
    swift_arrayDestroy();
    MEMORY[0x1C3B75908](v33, -1, -1);
    MEMORY[0x1C3B75908](v32, -1, -1);
  }
  else
  {

    v29 = v28;
  }

  swift_bridgeObjectRetain_n();
  v35 = sub_1BD7910D8();
  v36 = sub_1BD791174();
  if (os_log_type_enabled(v35, v36))
  {
    v37 = (uint8_t *)swift_slowAlloc();
    v38 = swift_slowAlloc();
    aBlock[0] = v38;
    *(_DWORD *)v37 = 136315138;
    v39 = swift_bridgeObjectRetain();
    v40 = MEMORY[0x1C3B754E8](v39, MEMORY[0x1E0DEA968]);
    v42 = v41;
    swift_bridgeObjectRelease();
    v92 = sub_1BD7878CC(v40, v42, aBlock);
    sub_1BD7911A4();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1BD77B000, v35, v36, "callForCloudKitAddToShare emailAddresses: %s", v37, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C3B75908](v38, -1, -1);
    MEMORY[0x1C3B75908](v37, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  swift_bridgeObjectRetain_n();
  v43 = sub_1BD7910D8();
  v44 = sub_1BD791174();
  if (os_log_type_enabled(v43, v44))
  {
    v45 = (uint8_t *)swift_slowAlloc();
    v46 = swift_slowAlloc();
    aBlock[0] = v46;
    *(_DWORD *)v45 = 136315138;
    v47 = swift_bridgeObjectRetain();
    v48 = MEMORY[0x1C3B754E8](v47, MEMORY[0x1E0DEA968]);
    v50 = v49;
    swift_bridgeObjectRelease();
    v92 = sub_1BD7878CC(v48, v50, aBlock);
    sub_1BD7911A4();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1BD77B000, v43, v44, "callForCloudKitAddToShare phoneNumbers: %s", v45, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C3B75908](v46, -1, -1);
    MEMORY[0x1C3B75908](v45, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  v51 = sub_1BD7910D8();
  v52 = sub_1BD791174();
  if (os_log_type_enabled(v51, v52))
  {
    v53 = (uint8_t *)swift_slowAlloc();
    v54 = swift_slowAlloc();
    *(_DWORD *)v53 = 136315138;
    v92 = v87;
    aBlock[0] = v54;
    type metadata accessor for ParticipantPermission(0);
    v55 = sub_1BD79112C();
    v92 = sub_1BD7878CC(v55, v56, aBlock);
    sub_1BD7911A4();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1BD77B000, v51, v52, "callForCloudKitAddToShare accessType: %s", v53, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C3B75908](v54, -1, -1);
    MEMORY[0x1C3B75908](v53, -1, -1);
  }

  v57 = sub_1BD7910D8();
  v58 = sub_1BD791174();
  if (os_log_type_enabled(v57, v58))
  {
    v59 = (uint8_t *)swift_slowAlloc();
    v60 = swift_slowAlloc();
    *(_DWORD *)v59 = 136315138;
    v92 = v88;
    aBlock[0] = v60;
    type metadata accessor for ParticipantPermission(0);
    v61 = sub_1BD79112C();
    v92 = sub_1BD7878CC(v61, v62, aBlock);
    sub_1BD7911A4();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1BD77B000, v57, v58, "callForCloudKitAddToShare permissionType: %s", v59, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C3B75908](v60, -1, -1);
    MEMORY[0x1C3B75908](v59, -1, -1);
  }

  v63 = v85;
  v64 = sub_1BD7910D8();
  v65 = sub_1BD791174();
  if (os_log_type_enabled(v64, v65))
  {
    v66 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v66 = 67109120;
    LODWORD(aBlock[0]) = v63 & 1;
    sub_1BD7911A4();
    _os_log_impl(&dword_1BD77B000, v64, v65, "callForCloudKitAddToShare allowOthersToInvite: %{BOOL}d", v66, 8u);
    MEMORY[0x1C3B75908](v66, -1, -1);
  }

  if (qword_1EDBB6B78 != -1)
    swift_once();
  v67 = (void *)qword_1EDBB6BE8;
  if (qword_1EDBB6BE8)
  {
    swift_unknownObjectRetain();
    v68 = (void *)sub_1BD791150();
    v69 = (void *)sub_1BD791150();
    v70 = swift_allocObject();
    *(_QWORD *)(v70 + 16) = v86;
    *(_QWORD *)(v70 + 24) = a9;
    aBlock[4] = (uint64_t)sub_1BD787FCC;
    aBlock[5] = v70;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_1BD77F364;
    aBlock[3] = (uint64_t)&block_descriptor_12;
    v71 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    LOBYTE(v77) = v63 & 1;
    objc_msgSend(v67, sel_addToCloudKitSharing_containerSetupInfo_emailAddresses_phoneNumbers_accessType_permissionType_allowOthersToInvite_withReply_, v84, v83, v68, v69, v87, v88, v77, v71);
    _Block_release(v71);
    swift_unknownObjectRelease();

  }
  else
  {
    v72 = sub_1BD7910A8();
    v73 = (uint64_t)v78;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v72 - 8) + 56))(v78, 1, 1, v72);
    sub_1BD79103C();
    sub_1BD7875B4(MEMORY[0x1E0DEE9D8]);
    sub_1BD787F0C(&qword_1EF4FDF20, (uint64_t (*)(uint64_t))MEMORY[0x1E0CADE48], MEMORY[0x1E0CADE40]);
    v74 = v79;
    v75 = v82;
    sub_1BD79106C();
    v76 = (void *)sub_1BD791030();
    (*(void (**)(char *, uint64_t))(v81 + 8))(v74, v75);
    v86(v73, 0, v76);

    sub_1BD787F8C(v73);
  }
}

void sub_1BD780174(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7, void (*a8)(_QWORD, _QWORD, void *), uint64_t a9)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  os_log_type_t v22;
  _BOOL4 v23;
  uint64_t v24;
  uint8_t *v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint8_t *v29;
  NSObject *v30;
  NSObject *v31;
  os_log_type_t v32;
  _BOOL4 v33;
  uint8_t *v34;
  _QWORD *v35;
  NSObject *v36;
  NSObject *v37;
  NSObject *v38;
  os_log_type_t v39;
  uint8_t *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  unint64_t v45;
  NSObject *v46;
  os_log_type_t v47;
  uint8_t *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  unint64_t v53;
  uint64_t v54;
  NSObject *v55;
  os_log_type_t v56;
  uint8_t *v57;
  uint64_t v58;
  uint64_t v59;
  unint64_t v60;
  NSObject *v61;
  os_log_type_t v62;
  uint8_t *v63;
  uint64_t v64;
  uint64_t v65;
  unint64_t v66;
  char v67;
  NSObject *v68;
  os_log_type_t v69;
  uint8_t *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  uint64_t v75;
  void *v76;
  char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  char *v81;
  char *v82;
  uint64_t v83;
  uint64_t v84;
  NSObject *v85;
  uint64_t v86;
  int v87;
  uint64_t v88;
  void (*v89)(_QWORD, _QWORD, void *);
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t aBlock[7];

  v88 = a6;
  v89 = a8;
  v87 = a7;
  v90 = a5;
  v91 = a3;
  v92 = a4;
  v11 = sub_1BD791048();
  MEMORY[0x1E0C80A78](v11);
  v82 = (char *)&v80 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_1BD791054();
  v83 = *(_QWORD *)(v13 - 8);
  v84 = v13;
  MEMORY[0x1E0C80A78](v13);
  v81 = (char *)&v80 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_1BD7910A8();
  v16 = *(_QWORD *)(v15 - 8);
  MEMORY[0x1E0C80A78](v15);
  v18 = (char *)&v80 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1EDBB6B98 != -1)
    swift_once();
  v19 = sub_1BD7910F0();
  v20 = __swift_project_value_buffer(v19, (uint64_t)qword_1EDBB6BA0);
  (*(void (**)(char *, uint64_t, uint64_t))(v16 + 16))(v18, a1, v15);
  v21 = sub_1BD7910D8();
  v22 = sub_1BD791198();
  v23 = os_log_type_enabled(v21, v22);
  v93 = v20;
  v86 = a1;
  if (v23)
  {
    v24 = swift_slowAlloc();
    v85 = a2;
    v25 = (uint8_t *)v24;
    v26 = swift_slowAlloc();
    aBlock[0] = v26;
    *(_DWORD *)v25 = 136315138;
    sub_1BD787F0C(&qword_1EF4FDF28, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAFFF8], MEMORY[0x1E0CB0048]);
    v27 = sub_1BD791210();
    v94 = sub_1BD7878CC(v27, v28, aBlock);
    sub_1BD7911A4();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v16 + 8))(v18, v15);
    _os_log_impl(&dword_1BD77B000, v21, v22, "callForSharingURLAddToShare sharingURL: %s", v25, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C3B75908](v26, -1, -1);
    v29 = v25;
    a2 = v85;
    MEMORY[0x1C3B75908](v29, -1, -1);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v16 + 8))(v18, v15);
  }

  v30 = a2;
  v31 = sub_1BD7910D8();
  v32 = sub_1BD791198();
  v33 = os_log_type_enabled(v31, v32);
  v85 = v30;
  if (v33)
  {
    v34 = (uint8_t *)swift_slowAlloc();
    v35 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v34 = 138412290;
    aBlock[0] = (uint64_t)v30;
    v36 = v30;
    v37 = v30;
    sub_1BD7911A4();
    *v35 = v36;

    _os_log_impl(&dword_1BD77B000, v31, v32, "callForSharingURLAddToShare containerSetupInfo: %@", v34, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EDBB6B90);
    swift_arrayDestroy();
    MEMORY[0x1C3B75908](v35, -1, -1);
    MEMORY[0x1C3B75908](v34, -1, -1);
  }
  else
  {

    v31 = v30;
  }

  swift_bridgeObjectRetain_n();
  v38 = sub_1BD7910D8();
  v39 = sub_1BD791174();
  if (os_log_type_enabled(v38, v39))
  {
    v40 = (uint8_t *)swift_slowAlloc();
    v41 = swift_slowAlloc();
    aBlock[0] = v41;
    *(_DWORD *)v40 = 136315138;
    v42 = swift_bridgeObjectRetain();
    v43 = MEMORY[0x1C3B754E8](v42, MEMORY[0x1E0DEA968]);
    v45 = v44;
    swift_bridgeObjectRelease();
    v94 = sub_1BD7878CC(v43, v45, aBlock);
    sub_1BD7911A4();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1BD77B000, v38, v39, "callForSharingURLAddToShare emailAddresses: %s", v40, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C3B75908](v41, -1, -1);
    MEMORY[0x1C3B75908](v40, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  swift_bridgeObjectRetain_n();
  v46 = sub_1BD7910D8();
  v47 = sub_1BD791174();
  if (os_log_type_enabled(v46, v47))
  {
    v48 = (uint8_t *)swift_slowAlloc();
    v49 = swift_slowAlloc();
    aBlock[0] = v49;
    *(_DWORD *)v48 = 136315138;
    v50 = swift_bridgeObjectRetain();
    v51 = MEMORY[0x1C3B754E8](v50, MEMORY[0x1E0DEA968]);
    v53 = v52;
    swift_bridgeObjectRelease();
    v94 = sub_1BD7878CC(v51, v53, aBlock);
    sub_1BD7911A4();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1BD77B000, v46, v47, "callForSharingURLAddToShare phoneNumbers: %s", v48, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C3B75908](v49, -1, -1);
    MEMORY[0x1C3B75908](v48, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  v54 = v88;
  v55 = sub_1BD7910D8();
  v56 = sub_1BD791174();
  if (os_log_type_enabled(v55, v56))
  {
    v57 = (uint8_t *)swift_slowAlloc();
    v58 = swift_slowAlloc();
    *(_DWORD *)v57 = 136315138;
    v94 = v90;
    aBlock[0] = v58;
    type metadata accessor for ParticipantPermission(0);
    v59 = sub_1BD79112C();
    v94 = sub_1BD7878CC(v59, v60, aBlock);
    sub_1BD7911A4();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1BD77B000, v55, v56, "callForSharingURLAddToShare accessType: %s", v57, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C3B75908](v58, -1, -1);
    MEMORY[0x1C3B75908](v57, -1, -1);
  }

  v61 = sub_1BD7910D8();
  v62 = sub_1BD791174();
  if (os_log_type_enabled(v61, v62))
  {
    v63 = (uint8_t *)swift_slowAlloc();
    v64 = swift_slowAlloc();
    v94 = v54;
    aBlock[0] = v64;
    *(_DWORD *)v63 = 136315138;
    type metadata accessor for ParticipantPermission(0);
    v65 = sub_1BD79112C();
    v94 = sub_1BD7878CC(v65, v66, aBlock);
    sub_1BD7911A4();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1BD77B000, v61, v62, "callForSharingURLAddToShare permissionType: %s", v63, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C3B75908](v64, -1, -1);
    MEMORY[0x1C3B75908](v63, -1, -1);
  }

  v67 = v87;
  v68 = sub_1BD7910D8();
  v69 = sub_1BD791174();
  if (os_log_type_enabled(v68, v69))
  {
    v70 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v70 = 67109120;
    LODWORD(aBlock[0]) = v67 & 1;
    sub_1BD7911A4();
    _os_log_impl(&dword_1BD77B000, v68, v69, "callForSharingURLAddToShare allowOthersToInvite: %{BOOL}d", v70, 8u);
    MEMORY[0x1C3B75908](v70, -1, -1);
  }

  if (qword_1EDBB6B78 != -1)
    swift_once();
  v71 = (void *)qword_1EDBB6BE8;
  if (qword_1EDBB6BE8)
  {
    swift_unknownObjectRetain();
    v72 = (void *)sub_1BD791084();
    v73 = (void *)sub_1BD791150();
    v74 = (void *)sub_1BD791150();
    v75 = swift_allocObject();
    *(_QWORD *)(v75 + 16) = v89;
    *(_QWORD *)(v75 + 24) = a9;
    aBlock[4] = (uint64_t)sub_1BD787FCC;
    aBlock[5] = v75;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_1BD780C50;
    aBlock[3] = (uint64_t)&block_descriptor_18;
    v76 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    LOBYTE(v79) = v67 & 1;
    objc_msgSend(v71, sel_addToShareFromSharingURL_containerSetupInfo_emailAddresses_phoneNumbers_accessType_permissionType_allowOthersToInvite_withReply_, v72, v85, v73, v74, v90, v54, v79, v76);
    _Block_release(v76);
    swift_unknownObjectRelease();

  }
  else
  {
    sub_1BD79103C();
    sub_1BD7875B4(MEMORY[0x1E0DEE9D8]);
    sub_1BD787F0C(&qword_1EF4FDF20, (uint64_t (*)(uint64_t))MEMORY[0x1E0CADE48], MEMORY[0x1E0CADE40]);
    v77 = v81;
    v78 = v84;
    sub_1BD79106C();
    v74 = (void *)sub_1BD791030();
    (*(void (**)(char *, uint64_t))(v83 + 8))(v77, v78);
    v89(0, 0, v74);
  }

}

void sub_1BD780C50(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  void (*v7)(uint64_t, void *, void *);
  id v8;
  id v9;

  v7 = *(void (**)(uint64_t, void *, void *))(a1 + 32);
  swift_retain();
  v9 = a3;
  v8 = a4;
  v7(a2, a3, a4);
  swift_release();

}

void sub_1BD780E14(char a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  id v8;

  if (a3)
    v7 = sub_1BD791078();
  else
    v7 = 0;
  v8 = (id)v7;
  (*(void (**)(uint64_t, _QWORD, uint64_t))(a4 + 16))(a4, a1 & 1, a2);

}

void sub_1BD780E7C(uint64_t a1, void *a2, void (*a3)(_QWORD, void *), uint64_t a4)
{
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
  void (*v15)(char *, uint64_t, uint64_t);
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  id v23;
  NSObject *v24;
  NSObject *v25;
  os_log_type_t v26;
  uint8_t *v27;
  _QWORD *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  char *v35;
  uint64_t v36;
  _QWORD v37[2];
  char *v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  id v43;
  void (*v44)(_QWORD, void *);
  uint64_t v45;
  uint64_t v46;
  uint64_t aBlock[7];

  v44 = a3;
  v45 = a4;
  v43 = a2;
  aBlock[6] = *MEMORY[0x1E0C80C00];
  v5 = sub_1BD791048();
  MEMORY[0x1E0C80A78](v5);
  v39 = (char *)v37 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_1BD791054();
  v40 = *(_QWORD *)(v7 - 8);
  v41 = v7;
  MEMORY[0x1E0C80A78](v7);
  v38 = (char *)v37 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_1BD7910A8();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v9);
  v12 = (char *)v37 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1EDBB6B98 != -1)
    swift_once();
  v13 = sub_1BD7910F0();
  v14 = __swift_project_value_buffer(v13, (uint64_t)qword_1EDBB6BA0);
  v15 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 16);
  v42 = a1;
  v15(v12, a1, v9);
  v16 = sub_1BD7910D8();
  v17 = sub_1BD791198();
  if (os_log_type_enabled(v16, v17))
  {
    v18 = (uint8_t *)swift_slowAlloc();
    v19 = swift_slowAlloc();
    v37[1] = v14;
    v20 = v19;
    aBlock[0] = v19;
    *(_DWORD *)v18 = 136315138;
    sub_1BD787F0C(&qword_1EF4FDF28, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAFFF8], MEMORY[0x1E0CB0048]);
    v21 = sub_1BD791210();
    v46 = sub_1BD7878CC(v21, v22, aBlock);
    sub_1BD7911A4();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
    _os_log_impl(&dword_1BD77B000, v16, v17, "callForSharingURLRemoveShare sharingURL: %s", v18, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C3B75908](v20, -1, -1);
    MEMORY[0x1C3B75908](v18, -1, -1);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  }

  v23 = v43;
  v24 = v43;
  v25 = sub_1BD7910D8();
  v26 = sub_1BD791198();
  if (os_log_type_enabled(v25, v26))
  {
    v27 = (uint8_t *)swift_slowAlloc();
    v28 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v27 = 138412290;
    if (v23)
    {
      aBlock[0] = (uint64_t)v24;
      v29 = v24;
    }
    else
    {
      aBlock[0] = 0;
    }
    sub_1BD7911A4();
    *v28 = v23;

    _os_log_impl(&dword_1BD77B000, v25, v26, "callForSharingURLRemoveShare containerSetupInfo: %@", v27, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EDBB6B90);
    swift_arrayDestroy();
    MEMORY[0x1C3B75908](v28, -1, -1);
    MEMORY[0x1C3B75908](v27, -1, -1);
  }
  else
  {

    v25 = v24;
  }

  if (qword_1EDBB6B78 != -1)
    swift_once();
  v30 = (void *)qword_1EDBB6BE8;
  if (qword_1EDBB6BE8)
  {
    swift_unknownObjectRetain();
    v31 = (void *)sub_1BD791084();
    v32 = swift_allocObject();
    v33 = v45;
    *(_QWORD *)(v32 + 16) = v44;
    *(_QWORD *)(v32 + 24) = v33;
    aBlock[4] = (uint64_t)sub_1BD787FE4;
    aBlock[5] = v32;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_1BD7813DC;
    aBlock[3] = (uint64_t)&block_descriptor_24;
    v34 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    objc_msgSend(v30, sel_removeFromShareFromSharingURL_containerSetupInfo_withReply_, v31, v24, v34);
    _Block_release(v34);
    swift_unknownObjectRelease();
  }
  else
  {
    sub_1BD79103C();
    sub_1BD7875B4(MEMORY[0x1E0DEE9D8]);
    sub_1BD787F0C(&qword_1EF4FDF20, (uint64_t (*)(uint64_t))MEMORY[0x1E0CADE48], MEMORY[0x1E0CADE40]);
    v35 = v38;
    v36 = v41;
    sub_1BD79106C();
    v31 = (void *)sub_1BD791030();
    (*(void (**)(char *, uint64_t))(v40 + 8))(v35, v36);
    v44(0, v31);
  }

}

void sub_1BD7813DC(uint64_t a1, uint64_t a2, void *a3)
{
  void (*v5)(uint64_t, void *);
  id v6;

  v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  swift_retain();
  v6 = a3;
  v5(a2, a3);
  swift_release();

}

void sub_1BD781448(char a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  id v6;

  if (a2)
    v5 = sub_1BD791078();
  else
    v5 = 0;
  v6 = (id)v5;
  (*(void (**)(uint64_t, _QWORD))(a3 + 16))(a3, a1 & 1);

}

void sub_1BD7814A0(void *a1, void *a2, void (*a3)(_QWORD, void *), uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  id v20;
  NSObject *v21;
  NSObject *v22;
  os_log_type_t v23;
  uint8_t *v24;
  _QWORD *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  char *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  id v35;
  char *v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  void (*v40)(_QWORD, void *);
  _QWORD aBlock[7];

  v40 = a3;
  aBlock[6] = *MEMORY[0x1E0C80C00];
  v7 = sub_1BD791048();
  MEMORY[0x1E0C80A78](v7);
  v37 = (char *)&v34 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_1BD791054();
  v38 = *(_QWORD *)(v9 - 8);
  v39 = v9;
  MEMORY[0x1E0C80A78](v9);
  v36 = (char *)&v34 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1EDBB6B98 != -1)
    swift_once();
  v11 = sub_1BD7910F0();
  v12 = __swift_project_value_buffer(v11, (uint64_t)qword_1EDBB6BA0);
  v13 = a1;
  v14 = sub_1BD7910D8();
  v15 = sub_1BD791198();
  if (os_log_type_enabled(v14, v15))
  {
    v35 = a2;
    v16 = (uint8_t *)swift_slowAlloc();
    v17 = swift_slowAlloc();
    v34 = v12;
    v18 = (_QWORD *)v17;
    *(_DWORD *)v16 = 138412290;
    aBlock[0] = v13;
    v19 = a4;
    v20 = v13;
    a2 = v35;
    sub_1BD7911A4();
    *v18 = v13;

    a4 = v19;
    _os_log_impl(&dword_1BD77B000, v14, v15, "callForRemoveShare share: %@", v16, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EDBB6B90);
    swift_arrayDestroy();
    MEMORY[0x1C3B75908](v18, -1, -1);
    MEMORY[0x1C3B75908](v16, -1, -1);

  }
  else
  {

  }
  v21 = a2;
  v22 = sub_1BD7910D8();
  v23 = sub_1BD791198();
  if (os_log_type_enabled(v22, v23))
  {
    v35 = v13;
    v24 = (uint8_t *)swift_slowAlloc();
    v25 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v24 = 138412290;
    if (a2)
    {
      aBlock[0] = v21;
      v26 = v21;
      v27 = a2;
    }
    else
    {
      v27 = 0;
      aBlock[0] = 0;
    }
    sub_1BD7911A4();
    *v25 = v27;

    _os_log_impl(&dword_1BD77B000, v22, v23, "callForRemoveShare containerSetupInfo: %@", v24, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EDBB6B90);
    swift_arrayDestroy();
    MEMORY[0x1C3B75908](v25, -1, -1);
    MEMORY[0x1C3B75908](v24, -1, -1);
    v13 = v35;
  }
  else
  {

    v22 = v21;
  }

  if (qword_1EDBB6B78 != -1)
    swift_once();
  v28 = (void *)qword_1EDBB6BE8;
  if (qword_1EDBB6BE8)
  {
    v29 = swift_allocObject();
    *(_QWORD *)(v29 + 16) = v40;
    *(_QWORD *)(v29 + 24) = a4;
    aBlock[4] = sub_1BD787FCC;
    aBlock[5] = v29;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1BD7813DC;
    aBlock[3] = &block_descriptor_30;
    v30 = _Block_copy(aBlock);
    swift_unknownObjectRetain();
    swift_retain();
    swift_release();
    objc_msgSend(v28, sel_removeFromShare_containerSetupInfo_withReply_, v13, v21, v30);
    _Block_release(v30);
    swift_unknownObjectRelease();
  }
  else
  {
    sub_1BD79103C();
    sub_1BD7875B4(MEMORY[0x1E0DEE9D8]);
    sub_1BD787F0C(&qword_1EF4FDF20, (uint64_t (*)(uint64_t))MEMORY[0x1E0CADE48], MEMORY[0x1E0CADE40]);
    v31 = v36;
    v32 = v39;
    sub_1BD79106C();
    v33 = (void *)sub_1BD791030();
    (*(void (**)(char *, uint64_t))(v38 + 8))(v31, v32);
    v40(0, v33);

  }
}

void sub_1BD7819AC(uint64_t a1, void (*a2)(_QWORD, _QWORD), uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  _BOOL4 v17;
  uint64_t v18;
  uint8_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint8_t *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  char *v30;
  uint64_t v31;
  void (*v32)(_QWORD, _QWORD);
  uint64_t v33;
  char *v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t aBlock[6];

  v6 = sub_1BD791048();
  MEMORY[0x1E0C80A78](v6);
  v35 = (char *)&v31 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_1BD791054();
  v36 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v34 = (char *)&v31 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_1BD7910A8();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x1E0C80A78](v10);
  v13 = (char *)&v31 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1EDBB6B98 != -1)
    swift_once();
  v14 = sub_1BD7910F0();
  __swift_project_value_buffer(v14, (uint64_t)qword_1EDBB6BA0);
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v13, a1, v10);
  v15 = sub_1BD7910D8();
  v16 = sub_1BD791198();
  v17 = os_log_type_enabled(v15, v16);
  v37 = a1;
  if (v17)
  {
    v18 = swift_slowAlloc();
    v33 = a3;
    v19 = (uint8_t *)v18;
    v20 = swift_slowAlloc();
    v31 = v8;
    v21 = v20;
    aBlock[0] = v20;
    *(_DWORD *)v19 = 136315138;
    v32 = a2;
    sub_1BD787F0C(&qword_1EF4FDF28, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAFFF8], MEMORY[0x1E0CB0048]);
    v22 = sub_1BD791210();
    v38 = sub_1BD7878CC(v22, v23, aBlock);
    a2 = v32;
    sub_1BD7911A4();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
    _os_log_impl(&dword_1BD77B000, v15, v16, "callForFileURLRemoveShare url: %s", v19, 0xCu);
    swift_arrayDestroy();
    v24 = v21;
    v8 = v31;
    MEMORY[0x1C3B75908](v24, -1, -1);
    v25 = v19;
    a3 = v33;
    MEMORY[0x1C3B75908](v25, -1, -1);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  }

  if (qword_1EDBB6B78 != -1)
    swift_once();
  v26 = (void *)qword_1EDBB6BE8;
  if (qword_1EDBB6BE8)
  {
    swift_unknownObjectRetain();
    v27 = (void *)sub_1BD791084();
    v28 = swift_allocObject();
    *(_QWORD *)(v28 + 16) = a2;
    *(_QWORD *)(v28 + 24) = a3;
    aBlock[4] = (uint64_t)sub_1BD787FCC;
    aBlock[5] = v28;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_1BD7813DC;
    aBlock[3] = (uint64_t)&block_descriptor_36;
    v29 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    objc_msgSend(v26, sel_removeFromShareForFileURL_withReply_, v27, v29);
    _Block_release(v29);
    swift_unknownObjectRelease();
  }
  else
  {
    sub_1BD79103C();
    sub_1BD7875B4(MEMORY[0x1E0DEE9D8]);
    sub_1BD787F0C(&qword_1EF4FDF20, (uint64_t (*)(uint64_t))MEMORY[0x1E0CADE48], MEMORY[0x1E0CADE40]);
    v30 = v34;
    sub_1BD79106C();
    v27 = (void *)sub_1BD791030();
    (*(void (**)(char *, uint64_t))(v36 + 8))(v30, v8);
    a2(0, v27);
  }

}

void sub_1BD781DD0(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, unint64_t a5, uint64_t a6, uint8_t *a7, void (*a8)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD), uint64_t a9)
{
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
  char *v23;
  uint64_t v24;
  NSObject *v25;
  os_log_type_t v26;
  _BOOL4 v27;
  uint8_t *v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  NSObject *v32;
  NSObject *v33;
  os_log_type_t v34;
  uint8_t *v35;
  _QWORD *v36;
  NSObject *v37;
  uint64_t v38;
  unint64_t v39;
  NSObject *v40;
  os_log_type_t v41;
  uint8_t *v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  unint64_t v46;
  NSObject *v47;
  os_log_type_t v48;
  uint8_t *v49;
  uint64_t v50;
  uint64_t v51;
  NSObject *v52;
  os_log_type_t v53;
  NSObject *v54;
  uint8_t *v55;
  uint64_t v56;
  uint64_t v57;
  unint64_t v58;
  unint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  char *v67;
  uint64_t v68;
  void *v69;
  void (*v70)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  void *v71;
  uint64_t v72;
  void *v73;
  uint64_t v74;
  void (*v75)(char *, uint64_t);
  char *v76;
  char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  void (*v85)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  id v86;
  char *v87;
  uint8_t *v88;
  uint64_t v89;
  unint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t aBlock[7];

  v85 = a8;
  v86 = a2;
  v88 = a7;
  v89 = a4;
  v92 = a3;
  v12 = sub_1BD791048();
  MEMORY[0x1E0C80A78](v12);
  v77 = (char *)&v74 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v79 = sub_1BD791054();
  v78 = *(_QWORD *)(v79 - 8);
  MEMORY[0x1E0C80A78](v79);
  v76 = (char *)&v74 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v81 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDBB6B70);
  v15 = MEMORY[0x1E0C80A78](v81);
  v83 = (uint64_t)&v74 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = MEMORY[0x1E0C80A78](v15);
  v80 = (uint64_t)&v74 - v18;
  MEMORY[0x1E0C80A78](v17);
  v87 = (char *)&v74 - v19;
  v20 = sub_1BD7910A8();
  v21 = *(_QWORD *)(v20 - 8);
  MEMORY[0x1E0C80A78](v20);
  v23 = (char *)&v74 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1EDBB6B98 != -1)
    swift_once();
  v24 = sub_1BD7910F0();
  __swift_project_value_buffer(v24, (uint64_t)qword_1EDBB6BA0);
  (*(void (**)(char *, uint64_t, uint64_t))(v21 + 16))(v23, a1, v20);
  v25 = sub_1BD7910D8();
  v26 = sub_1BD791198();
  v27 = os_log_type_enabled(v25, v26);
  v93 = a6;
  v90 = a5;
  v91 = v20;
  v84 = a1;
  v82 = v21;
  if (v27)
  {
    v28 = (uint8_t *)swift_slowAlloc();
    v29 = swift_slowAlloc();
    aBlock[0] = v29;
    *(_DWORD *)v28 = 136315138;
    sub_1BD787F0C(&qword_1EF4FDF28, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAFFF8], MEMORY[0x1E0CB0048]);
    v30 = sub_1BD791210();
    v94 = sub_1BD7878CC(v30, v31, aBlock);
    sub_1BD7911A4();
    swift_bridgeObjectRelease();
    v75 = *(void (**)(char *, uint64_t))(v21 + 8);
    v75(v23, v91);
    _os_log_impl(&dword_1BD77B000, v25, v26, "callForMailContent sharingURL: %s", v28, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C3B75908](v29, -1, -1);
    MEMORY[0x1C3B75908](v28, -1, -1);
  }
  else
  {
    v75 = *(void (**)(char *, uint64_t))(v21 + 8);
    v75(v23, v20);
  }

  v32 = v86;
  v33 = sub_1BD7910D8();
  v34 = sub_1BD791198();
  if (os_log_type_enabled(v33, v34))
  {
    v35 = (uint8_t *)swift_slowAlloc();
    v36 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v35 = 138412290;
    aBlock[0] = (uint64_t)v32;
    v37 = v32;
    sub_1BD7911A4();
    *v36 = v32;

    _os_log_impl(&dword_1BD77B000, v33, v34, "callForMailContent share: %@", v35, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EDBB6B90);
    swift_arrayDestroy();
    MEMORY[0x1C3B75908](v36, -1, -1);
    MEMORY[0x1C3B75908](v35, -1, -1);
  }
  else
  {

    v33 = v32;
  }
  v38 = (uint64_t)v87;
  v39 = (unint64_t)v88;

  sub_1BD7906BC(v92, v38, &qword_1EDBB6B70);
  v40 = sub_1BD7910D8();
  v41 = sub_1BD791198();
  if (os_log_type_enabled(v40, v41))
  {
    v42 = (uint8_t *)swift_slowAlloc();
    v43 = swift_slowAlloc();
    aBlock[0] = v43;
    *(_DWORD *)v42 = 136315138;
    v88 = v42 + 4;
    sub_1BD7906BC(v38, v80, &qword_1EDBB6B70);
    v44 = sub_1BD79112C();
    v94 = sub_1BD7878CC(v44, v45, aBlock);
    sub_1BD7911A4();
    swift_bridgeObjectRelease();
    sub_1BD787F8C(v38);
    _os_log_impl(&dword_1BD77B000, v40, v41, "callForMailContent fileURL: %s", v42, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C3B75908](v43, -1, -1);
    MEMORY[0x1C3B75908](v42, -1, -1);
  }
  else
  {
    sub_1BD787F8C(v38);
  }

  v46 = v90;
  swift_bridgeObjectRetain_n();
  v47 = sub_1BD7910D8();
  v48 = sub_1BD791174();
  if (os_log_type_enabled(v47, v48))
  {
    v49 = (uint8_t *)swift_slowAlloc();
    v50 = swift_slowAlloc();
    aBlock[0] = v50;
    *(_DWORD *)v49 = 136315138;
    swift_bridgeObjectRetain();
    v94 = sub_1BD7878CC(v89, v46, aBlock);
    sub_1BD7911A4();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1BD77B000, v47, v48, "callForMailContent appName: %s", v49, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C3B75908](v50, -1, -1);
    MEMORY[0x1C3B75908](v49, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  v51 = v93;
  sub_1BD788004(v93, v39);
  sub_1BD788004(v51, v39);
  v52 = sub_1BD7910D8();
  v53 = sub_1BD791180();
  v54 = v32;
  if (os_log_type_enabled(v52, v53))
  {
    v55 = (uint8_t *)swift_slowAlloc();
    v56 = swift_slowAlloc();
    aBlock[0] = v56;
    *(_DWORD *)v55 = 136315138;
    sub_1BD788004(v51, v39);
    v57 = sub_1BD7910B4();
    v59 = v58;
    sub_1BD788048(v93, v39);
    v60 = v57;
    v61 = v93;
    v94 = sub_1BD7878CC(v60, v59, aBlock);
    sub_1BD7911A4();
    swift_bridgeObjectRelease();
    sub_1BD788048(v61, v39);
    sub_1BD788048(v61, v39);
    _os_log_impl(&dword_1BD77B000, v52, v53, "callForMailContent appIconData: %s", v55, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C3B75908](v56, -1, -1);
    MEMORY[0x1C3B75908](v55, -1, -1);
  }
  else
  {
    sub_1BD788048(v51, v39);
    sub_1BD788048(v51, v39);
  }

  if (qword_1EDBB6B78 != -1)
    swift_once();
  v62 = (void *)qword_1EDBB6BE8;
  if (qword_1EDBB6BE8)
  {
    swift_unknownObjectRetain();
    v63 = (void *)sub_1BD791084();
    v64 = v83;
    sub_1BD7906BC(v92, v83, &qword_1EDBB6B70);
    v65 = v91;
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v82 + 48))(v64, 1, v91) == 1)
    {
      v66 = 0;
    }
    else
    {
      v66 = (void *)sub_1BD791084();
      v75((char *)v64, v65);
    }
    v70 = v85;
    v71 = (void *)sub_1BD7910FC();
    v69 = (void *)sub_1BD7910C0();
    v72 = swift_allocObject();
    *(_QWORD *)(v72 + 16) = v70;
    *(_QWORD *)(v72 + 24) = a9;
    aBlock[4] = (uint64_t)sub_1BD787FCC;
    aBlock[5] = v72;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_1BD782870;
    aBlock[3] = (uint64_t)&block_descriptor_42;
    v73 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    objc_msgSend(v62, sel_mailContentFromSharingURL_share_fileURL_appName_appIconData_withReply_, v63, v54, v66, v71, v69, v73);
    _Block_release(v73);
    swift_unknownObjectRelease();

  }
  else
  {
    sub_1BD79103C();
    sub_1BD7875B4(MEMORY[0x1E0DEE9D8]);
    sub_1BD787F0C(&qword_1EF4FDF20, (uint64_t (*)(uint64_t))MEMORY[0x1E0CADE48], MEMORY[0x1E0CADE40]);
    v67 = v76;
    v68 = v79;
    sub_1BD79106C();
    v69 = (void *)sub_1BD791030();
    (*(void (**)(char *, uint64_t))(v78 + 8))(v67, v68);
    v85(0, 0, 0, 0, v69);
  }

}

uint64_t sub_1BD782870(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t, uint64_t, uint64_t, void *);
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;

  v5 = a3;
  v6 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, void *))(a1 + 32);
  if (!a2)
  {
    v7 = 0;
    v9 = 0;
    if (a3)
      goto LABEL_3;
LABEL_5:
    v10 = 0;
    goto LABEL_6;
  }
  v7 = sub_1BD791120();
  v9 = v8;
  if (!v5)
    goto LABEL_5;
LABEL_3:
  v10 = sub_1BD791120();
  v5 = v11;
LABEL_6:
  swift_retain();
  v12 = a4;
  v6(v7, v9, v10, v5, a4);
  swift_release();

  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void sub_1BD782AF8(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6)
{
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;

  v8 = a4;
  if (a2)
  {
    v9 = (void *)sub_1BD7910FC();
    if (!v8)
      goto LABEL_4;
    goto LABEL_3;
  }
  v9 = 0;
  if (a4)
LABEL_3:
    v8 = (void *)sub_1BD7910FC();
LABEL_4:
  if (a5)
    v10 = sub_1BD791078();
  else
    v10 = 0;
  v11 = (id)v10;
  (*(void (**)(uint64_t, void *, void *))(a6 + 16))(a6, v9, v8);

}

void sub_1BD782BA0(uint64_t a1, void *a2, void (*a3)(_QWORD, void *), uint64_t a4)
{
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
  void (*v15)(char *, uint64_t, uint64_t);
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  id v23;
  NSObject *v24;
  NSObject *v25;
  os_log_type_t v26;
  uint8_t *v27;
  _QWORD *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  char *v35;
  uint64_t v36;
  _QWORD v37[2];
  char *v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  id v43;
  void (*v44)(_QWORD, void *);
  uint64_t v45;
  uint64_t v46;
  uint64_t aBlock[7];

  v44 = a3;
  v45 = a4;
  v43 = a2;
  aBlock[6] = *MEMORY[0x1E0C80C00];
  v5 = sub_1BD791048();
  MEMORY[0x1E0C80A78](v5);
  v39 = (char *)v37 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_1BD791054();
  v40 = *(_QWORD *)(v7 - 8);
  v41 = v7;
  MEMORY[0x1E0C80A78](v7);
  v38 = (char *)v37 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_1BD7910A8();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v9);
  v12 = (char *)v37 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1EDBB6B98 != -1)
    swift_once();
  v13 = sub_1BD7910F0();
  v14 = __swift_project_value_buffer(v13, (uint64_t)qword_1EDBB6BA0);
  v15 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 16);
  v42 = a1;
  v15(v12, a1, v9);
  v16 = sub_1BD7910D8();
  v17 = sub_1BD791198();
  if (os_log_type_enabled(v16, v17))
  {
    v18 = (uint8_t *)swift_slowAlloc();
    v19 = swift_slowAlloc();
    v37[1] = v14;
    v20 = v19;
    aBlock[0] = v19;
    *(_DWORD *)v18 = 136315138;
    sub_1BD787F0C(&qword_1EF4FDF28, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAFFF8], MEMORY[0x1E0CB0048]);
    v21 = sub_1BD791210();
    v46 = sub_1BD7878CC(v21, v22, aBlock);
    sub_1BD7911A4();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
    _os_log_impl(&dword_1BD77B000, v16, v17, "callForMetadataFromShareURL sharingURL: %s", v18, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C3B75908](v20, -1, -1);
    MEMORY[0x1C3B75908](v18, -1, -1);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  }

  v23 = v43;
  v24 = v43;
  v25 = sub_1BD7910D8();
  v26 = sub_1BD791198();
  if (os_log_type_enabled(v25, v26))
  {
    v27 = (uint8_t *)swift_slowAlloc();
    v28 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v27 = 138412290;
    if (v23)
    {
      aBlock[0] = (uint64_t)v24;
      v29 = v24;
    }
    else
    {
      aBlock[0] = 0;
    }
    sub_1BD7911A4();
    *v28 = v23;

    _os_log_impl(&dword_1BD77B000, v25, v26, "callForMetadataFromShareURL containerSetupInfo: %@", v27, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EDBB6B90);
    swift_arrayDestroy();
    MEMORY[0x1C3B75908](v28, -1, -1);
    MEMORY[0x1C3B75908](v27, -1, -1);
  }
  else
  {

    v25 = v24;
  }

  if (qword_1EDBB6B78 != -1)
    swift_once();
  v30 = (void *)qword_1EDBB6BE8;
  if (qword_1EDBB6BE8)
  {
    swift_unknownObjectRetain();
    v31 = (void *)sub_1BD791084();
    v32 = swift_allocObject();
    v33 = v45;
    *(_QWORD *)(v32 + 16) = v44;
    *(_QWORD *)(v32 + 24) = v33;
    aBlock[4] = (uint64_t)sub_1BD787FCC;
    aBlock[5] = v32;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_1BD783100;
    aBlock[3] = (uint64_t)&block_descriptor_48;
    v34 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    objc_msgSend(v30, sel_getMetadataFromShareFromSharingURL_containerSetupInfo_withReply_, v31, v24, v34);
    _Block_release(v34);
    swift_unknownObjectRelease();
  }
  else
  {
    sub_1BD79103C();
    sub_1BD7875B4(MEMORY[0x1E0DEE9D8]);
    sub_1BD787F0C(&qword_1EF4FDF20, (uint64_t (*)(uint64_t))MEMORY[0x1E0CADE48], MEMORY[0x1E0CADE40]);
    v35 = v38;
    v36 = v41;
    sub_1BD79106C();
    v31 = (void *)sub_1BD791030();
    (*(void (**)(char *, uint64_t))(v40 + 8))(v35, v36);
    v44(0, v31);
  }

}

void sub_1BD783100(uint64_t a1, void *a2, void *a3)
{
  void (*v5)(void *, void *);
  id v6;
  id v7;

  v5 = *(void (**)(void *, void *))(a1 + 32);
  swift_retain();
  v7 = a2;
  v6 = a3;
  v5(a2, a3);
  swift_release();

}

uint64_t sub_1BD783180(void *a1, uint64_t a2, uint64_t a3, void *a4, const void *a5, void (*a6)(char *, void *, void *))
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v18;

  v10 = sub_1BD7910A8();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x1E0C80A78](v10);
  v13 = (char *)&v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = _Block_copy(a5);
  sub_1BD79109C();
  _Block_copy(v14);
  v15 = a4;
  v16 = a1;
  a6(v13, a4, v14);
  _Block_release(v14);
  _Block_release(v14);

  return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v13, v10);
}

void sub_1BD783268(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  id v6;

  if (a2)
    v5 = sub_1BD791078();
  else
    v5 = 0;
  v6 = (id)v5;
  (*(void (**)(uint64_t, uint64_t))(a3 + 16))(a3, a1);

}

uint64_t sub_1BD7832C0(void *a1, void *a2, void (*a3)(uint64_t, _QWORD, void *), uint64_t a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  NSObject *v14;
  os_log_type_t v15;
  uint64_t v16;
  uint8_t *v17;
  _QWORD *v18;
  id v19;
  uint8_t *v20;
  NSObject *v21;
  NSObject *v22;
  os_log_type_t v23;
  uint8_t *v24;
  uint64_t v25;
  void *v26;
  _QWORD *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  char *v42;
  char *v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void (*v48)(uint64_t, _QWORD, void *);
  _QWORD aBlock[7];

  v47 = a4;
  v48 = a3;
  aBlock[6] = *MEMORY[0x1E0C80C00];
  v6 = sub_1BD791048();
  MEMORY[0x1E0C80A78](v6);
  v44 = (char *)&v40 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_1BD791054();
  v45 = *(_QWORD *)(v8 - 8);
  v46 = v8;
  MEMORY[0x1E0C80A78](v8);
  v43 = (char *)&v40 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDBB6B70);
  MEMORY[0x1E0C80A78](v10);
  v42 = (char *)&v40 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1EDBB6B98 != -1)
    swift_once();
  v12 = sub_1BD7910F0();
  __swift_project_value_buffer(v12, (uint64_t)qword_1EDBB6BA0);
  v13 = a1;
  v14 = sub_1BD7910D8();
  v15 = sub_1BD791198();
  if (os_log_type_enabled(v14, v15))
  {
    v16 = swift_slowAlloc();
    v41 = a2;
    v17 = (uint8_t *)v16;
    v18 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v17 = 138412290;
    aBlock[0] = v13;
    v19 = v13;
    sub_1BD7911A4();
    *v18 = v13;

    _os_log_impl(&dword_1BD77B000, v14, v15, "callForUpdateShare share: %@", v17, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EDBB6B90);
    swift_arrayDestroy();
    MEMORY[0x1C3B75908](v18, -1, -1);
    v20 = v17;
    a2 = v41;
    MEMORY[0x1C3B75908](v20, -1, -1);

  }
  else
  {

  }
  v21 = a2;
  v22 = sub_1BD7910D8();
  v23 = sub_1BD791198();
  if (os_log_type_enabled(v22, v23))
  {
    v24 = (uint8_t *)swift_slowAlloc();
    v25 = swift_slowAlloc();
    v26 = a2;
    v27 = (_QWORD *)v25;
    *(_DWORD *)v24 = 138412290;
    v28 = v26;
    if (v26)
    {
      aBlock[0] = v21;
      v29 = v21;
    }
    else
    {
      aBlock[0] = 0;
    }
    sub_1BD7911A4();
    *v27 = v28;

    _os_log_impl(&dword_1BD77B000, v22, v23, "callForUpdateShare containerSetupInfo: %@", v24, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EDBB6B90);
    swift_arrayDestroy();
    MEMORY[0x1C3B75908](v27, -1, -1);
    MEMORY[0x1C3B75908](v24, -1, -1);
  }
  else
  {

    v22 = v21;
  }

  if (qword_1EDBB6B78 != -1)
    swift_once();
  v30 = (void *)qword_1EDBB6BE8;
  if (qword_1EDBB6BE8)
  {
    v31 = swift_allocObject();
    v32 = v47;
    *(_QWORD *)(v31 + 16) = v48;
    *(_QWORD *)(v31 + 24) = v32;
    aBlock[4] = sub_1BD787FCC;
    aBlock[5] = v31;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1BD77F364;
    aBlock[3] = &block_descriptor_54;
    v33 = _Block_copy(aBlock);
    swift_unknownObjectRetain();
    swift_retain();
    swift_release();
    objc_msgSend(v30, sel_updateShare_containerSetupInfo_withReply_, v13, v21, v33);
    _Block_release(v33);
    return swift_unknownObjectRelease();
  }
  else
  {
    v35 = sub_1BD7910A8();
    v36 = (uint64_t)v42;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v35 - 8) + 56))(v42, 1, 1, v35);
    sub_1BD79103C();
    sub_1BD7875B4(MEMORY[0x1E0DEE9D8]);
    sub_1BD787F0C(&qword_1EF4FDF20, (uint64_t (*)(uint64_t))MEMORY[0x1E0CADE48], MEMORY[0x1E0CADE40]);
    v37 = v43;
    v38 = v46;
    sub_1BD79106C();
    v39 = (void *)sub_1BD791030();
    (*(void (**)(char *, uint64_t))(v45 + 8))(v37, v38);
    v48(v36, 0, v39);

    return sub_1BD787F8C(v36);
  }
}

void sub_1BD78382C(void *a1, int a2, void *a3, void *a4, void *aBlock, void (*a6)(id, void *, void *))
{
  void *v10;
  id v11;
  id v12;
  id v13;

  v10 = _Block_copy(aBlock);
  _Block_copy(v10);
  v11 = a3;
  v12 = a4;
  v13 = a1;
  a6(v11, a4, v10);
  _Block_release(v10);
  _Block_release(v10);

}

void sub_1BD7838C0(void *a1, void (*a2)(_QWORD, _QWORD), uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  id v11;
  NSObject *v12;
  os_log_type_t v13;
  uint64_t v14;
  uint8_t *v15;
  id v16;
  id v17;
  _QWORD *v18;
  uint8_t *v19;
  uint8_t *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  _QWORD *v27;
  uint8_t *v28;
  uint64_t v29;
  void (*v30)(_QWORD, _QWORD);
  uint64_t v31;
  _QWORD aBlock[6];

  v31 = a3;
  v5 = sub_1BD791048();
  MEMORY[0x1E0C80A78](v5);
  v6 = sub_1BD791054();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1EDBB6B98 != -1)
    swift_once();
  v10 = sub_1BD7910F0();
  __swift_project_value_buffer(v10, (uint64_t)qword_1EDBB6BA0);
  v11 = a1;
  v12 = sub_1BD7910D8();
  v13 = sub_1BD791198();
  if (os_log_type_enabled(v12, v13))
  {
    v14 = swift_slowAlloc();
    v30 = a2;
    v15 = (uint8_t *)v14;
    v27 = (_QWORD *)swift_slowAlloc();
    v28 = v15;
    *(_DWORD *)v15 = 138412290;
    aBlock[0] = v11;
    v16 = v11;
    v29 = v7;
    v17 = v16;
    sub_1BD7911A4();
    v18 = v27;
    *v27 = v11;

    v19 = v28;
    v7 = v29;
    _os_log_impl(&dword_1BD77B000, v12, v13, "callForCurrentUserSharingStatus share: %@", v28, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EDBB6B90);
    swift_arrayDestroy();
    MEMORY[0x1C3B75908](v18, -1, -1);
    v20 = v19;
    a2 = v30;
    MEMORY[0x1C3B75908](v20, -1, -1);

  }
  else
  {

  }
  if (qword_1EDBB6B78 != -1)
    swift_once();
  v21 = (void *)qword_1EDBB6BE8;
  if (qword_1EDBB6BE8)
  {
    v22 = swift_allocObject();
    v23 = v31;
    *(_QWORD *)(v22 + 16) = a2;
    *(_QWORD *)(v22 + 24) = v23;
    aBlock[4] = sub_1BD787FE4;
    aBlock[5] = v22;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1BD77E930;
    aBlock[3] = &block_descriptor_60;
    v24 = _Block_copy(aBlock);
    swift_unknownObjectRetain();
    swift_retain();
    swift_release();
    objc_msgSend(v21, sel_currentUserSharingStatusFor_withReply_, v11, v24);
    _Block_release(v24);
    swift_unknownObjectRelease();
  }
  else
  {
    sub_1BD79103C();
    sub_1BD7875B4(MEMORY[0x1E0DEE9D8]);
    sub_1BD787F0C(&qword_1EF4FDF20, (uint64_t (*)(uint64_t))MEMORY[0x1E0CADE48], MEMORY[0x1E0CADE40]);
    sub_1BD79106C();
    v25 = (void *)sub_1BD791030();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    a2(0, v25);

  }
}

void sub_1BD783CC8(void *a1, void *a2, uint64_t a3, uint64_t a4, void (*a5)(uint64_t, _QWORD, void *), uint64_t a6)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  NSObject *v19;
  os_log_type_t v20;
  _BOOL4 v21;
  uint8_t *v22;
  void *v23;
  id v24;
  _QWORD *v25;
  NSObject *v26;
  NSObject *v27;
  os_log_type_t v28;
  uint8_t *v29;
  _QWORD *v30;
  NSObject *v31;
  NSObject *v32;
  os_log_type_t v33;
  _BOOL4 v34;
  uint8_t *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  NSObject *v41;
  os_log_type_t v42;
  uint8_t *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  unint64_t v48;
  _QWORD *v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  char *v58;
  uint64_t v59;
  void *v60;
  char *v61;
  char *v62;
  char *v63;
  uint64_t v64;
  uint64_t v65;
  id v66;
  _QWORD *p_isa;
  uint64_t v68;
  void (*v69)(uint64_t, _QWORD, void *);
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t aBlock[7];

  v69 = a5;
  v70 = a6;
  v10 = sub_1BD791048();
  MEMORY[0x1E0C80A78](v10);
  v63 = (char *)&v61 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_1BD791054();
  v64 = *(_QWORD *)(v12 - 8);
  v65 = v12;
  MEMORY[0x1E0C80A78](v12);
  v62 = (char *)&v61 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDBB6B70);
  MEMORY[0x1E0C80A78](v14);
  v61 = (char *)&v61 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1EDBB6B98 != -1)
    swift_once();
  v16 = sub_1BD7910F0();
  v17 = __swift_project_value_buffer(v16, (uint64_t)qword_1EDBB6BA0);
  v18 = a1;
  v19 = sub_1BD7910D8();
  v20 = sub_1BD791198();
  v21 = os_log_type_enabled(v19, v20);
  v71 = v17;
  v72 = a3;
  v68 = a4;
  v66 = v18;
  if (v21)
  {
    v22 = (uint8_t *)swift_slowAlloc();
    p_isa = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v22 = 138412290;
    aBlock[0] = (uint64_t)v18;
    v23 = a2;
    v24 = v18;
    sub_1BD7911A4();
    v25 = p_isa;
    *p_isa = v18;

    a2 = v23;
    _os_log_impl(&dword_1BD77B000, v19, v20, "callForAddParticipantsToShare share: %@", v22, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EDBB6B90);
    swift_arrayDestroy();
    MEMORY[0x1C3B75908](v25, -1, -1);
    MEMORY[0x1C3B75908](v22, -1, -1);

  }
  else
  {

  }
  v26 = a2;
  v27 = sub_1BD7910D8();
  v28 = sub_1BD791198();
  if (os_log_type_enabled(v27, v28))
  {
    v29 = (uint8_t *)swift_slowAlloc();
    v30 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v29 = 138412290;
    aBlock[0] = (uint64_t)v26;
    v31 = v26;
    sub_1BD7911A4();
    *v30 = v26;

    _os_log_impl(&dword_1BD77B000, v27, v28, "callForAddParticipantsToShare containerSetupInfo: %@", v29, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EDBB6B90);
    swift_arrayDestroy();
    MEMORY[0x1C3B75908](v30, -1, -1);
    MEMORY[0x1C3B75908](v29, -1, -1);
  }
  else
  {

    v27 = v26;
  }

  swift_bridgeObjectRetain_n();
  v32 = sub_1BD7910D8();
  v33 = sub_1BD791174();
  v34 = os_log_type_enabled(v32, v33);
  p_isa = &v26->isa;
  if (v34)
  {
    v35 = (uint8_t *)swift_slowAlloc();
    v36 = swift_slowAlloc();
    aBlock[0] = v36;
    *(_DWORD *)v35 = 136315138;
    v37 = swift_bridgeObjectRetain();
    v38 = MEMORY[0x1C3B754E8](v37, MEMORY[0x1E0DEA968]);
    v40 = v39;
    swift_bridgeObjectRelease();
    v73 = sub_1BD7878CC(v38, v40, aBlock);
    sub_1BD7911A4();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1BD77B000, v32, v33, "callForAddParticipantsToShare emailAddresses: %s", v35, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C3B75908](v36, -1, -1);
    MEMORY[0x1C3B75908](v35, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  swift_bridgeObjectRetain_n();
  v41 = sub_1BD7910D8();
  v42 = sub_1BD791174();
  if (os_log_type_enabled(v41, v42))
  {
    v43 = (uint8_t *)swift_slowAlloc();
    v44 = swift_slowAlloc();
    aBlock[0] = v44;
    *(_DWORD *)v43 = 136315138;
    v45 = swift_bridgeObjectRetain();
    v46 = MEMORY[0x1C3B754E8](v45, MEMORY[0x1E0DEA968]);
    v48 = v47;
    swift_bridgeObjectRelease();
    v73 = sub_1BD7878CC(v46, v48, aBlock);
    sub_1BD7911A4();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1BD77B000, v41, v42, "callForAddParticipantsToShare phoneNumbers: %s", v43, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C3B75908](v44, -1, -1);
    MEMORY[0x1C3B75908](v43, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  v49 = p_isa;
  if (qword_1EDBB6B78 != -1)
    swift_once();
  v50 = (void *)qword_1EDBB6BE8;
  if (qword_1EDBB6BE8)
  {
    swift_unknownObjectRetain();
    v51 = (void *)sub_1BD791150();
    v52 = (void *)sub_1BD791150();
    v53 = swift_allocObject();
    v54 = v70;
    *(_QWORD *)(v53 + 16) = v69;
    *(_QWORD *)(v53 + 24) = v54;
    aBlock[4] = (uint64_t)sub_1BD787FCC;
    aBlock[5] = v53;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_1BD77F364;
    aBlock[3] = (uint64_t)&block_descriptor_66;
    v55 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    objc_msgSend(v50, sel_addParticipantsToShare_containerSetupInfo_emailAddresses_phoneNumbers_withReply_, v66, v49, v51, v52, v55);
    _Block_release(v55);
    swift_unknownObjectRelease();

  }
  else
  {
    v56 = sub_1BD7910A8();
    v57 = (uint64_t)v61;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v56 - 8) + 56))(v61, 1, 1, v56);
    sub_1BD79103C();
    sub_1BD7875B4(MEMORY[0x1E0DEE9D8]);
    sub_1BD787F0C(&qword_1EF4FDF20, (uint64_t (*)(uint64_t))MEMORY[0x1E0CADE48], MEMORY[0x1E0CADE40]);
    v58 = v62;
    v59 = v65;
    sub_1BD79106C();
    v60 = (void *)sub_1BD791030();
    (*(void (**)(char *, uint64_t))(v64 + 8))(v58, v59);
    v69(v57, 0, v60);

    sub_1BD787F8C(v57);
  }
}

void sub_1BD784598(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, void (*a7)(uint64_t, _QWORD, void *), uint64_t a8)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  NSObject *v20;
  os_log_type_t v21;
  _BOOL4 v22;
  uint8_t *v23;
  _QWORD *v24;
  id v25;
  id v26;
  NSObject *v27;
  os_log_type_t v28;
  uint8_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  NSObject *v35;
  os_log_type_t v36;
  uint8_t *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  unint64_t v42;
  NSObject *v43;
  os_log_type_t v44;
  uint8_t *v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  char v49;
  NSObject *v50;
  os_log_type_t v51;
  uint8_t *v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  char *v61;
  uint64_t v62;
  void *v63;
  char *v64;
  char *v65;
  char *v66;
  uint64_t v67;
  uint64_t v68;
  id v69;
  uint64_t v70;
  int v71;
  void (*v72)(uint64_t, _QWORD, void *);
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t aBlock[7];

  v72 = a7;
  v73 = a8;
  v71 = a6;
  v75 = a5;
  v70 = a2;
  v11 = sub_1BD791048();
  MEMORY[0x1E0C80A78](v11);
  v66 = (char *)&v64 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_1BD791054();
  v67 = *(_QWORD *)(v13 - 8);
  v68 = v13;
  MEMORY[0x1E0C80A78](v13);
  v65 = (char *)&v64 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDBB6B70);
  MEMORY[0x1E0C80A78](v15);
  v64 = (char *)&v64 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1EDBB6B98 != -1)
    swift_once();
  v17 = sub_1BD7910F0();
  v18 = __swift_project_value_buffer(v17, (uint64_t)qword_1EDBB6BA0);
  v19 = a1;
  v20 = sub_1BD7910D8();
  v21 = sub_1BD791198();
  v22 = os_log_type_enabled(v20, v21);
  v76 = v18;
  v77 = a4;
  v74 = a3;
  v69 = v19;
  if (v22)
  {
    v23 = (uint8_t *)swift_slowAlloc();
    v24 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v23 = 138412290;
    aBlock[0] = (uint64_t)v19;
    v25 = v19;
    v26 = v19;
    sub_1BD7911A4();
    *v24 = v25;

    _os_log_impl(&dword_1BD77B000, v20, v21, "callForAddParticipantsToShare urlWrapper: %@", v23, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EDBB6B90);
    swift_arrayDestroy();
    MEMORY[0x1C3B75908](v24, -1, -1);
    MEMORY[0x1C3B75908](v23, -1, -1);

  }
  else
  {

  }
  swift_bridgeObjectRetain_n();
  v27 = sub_1BD7910D8();
  v28 = sub_1BD791174();
  if (os_log_type_enabled(v27, v28))
  {
    v29 = (uint8_t *)swift_slowAlloc();
    v30 = swift_slowAlloc();
    aBlock[0] = v30;
    *(_DWORD *)v29 = 136315138;
    v31 = swift_bridgeObjectRetain();
    v32 = MEMORY[0x1C3B754E8](v31, MEMORY[0x1E0DEA968]);
    v34 = v33;
    swift_bridgeObjectRelease();
    v78 = sub_1BD7878CC(v32, v34, aBlock);
    sub_1BD7911A4();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1BD77B000, v27, v28, "callForAddParticipantsToShare emailAddresses: %s", v29, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C3B75908](v30, -1, -1);
    MEMORY[0x1C3B75908](v29, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  swift_bridgeObjectRetain_n();
  v35 = sub_1BD7910D8();
  v36 = sub_1BD791174();
  if (os_log_type_enabled(v35, v36))
  {
    v37 = (uint8_t *)swift_slowAlloc();
    v38 = swift_slowAlloc();
    aBlock[0] = v38;
    *(_DWORD *)v37 = 136315138;
    v39 = swift_bridgeObjectRetain();
    v40 = MEMORY[0x1C3B754E8](v39, MEMORY[0x1E0DEA968]);
    v42 = v41;
    swift_bridgeObjectRelease();
    v78 = sub_1BD7878CC(v40, v42, aBlock);
    sub_1BD7911A4();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1BD77B000, v35, v36, "callForAddParticipantsToShare phoneNumbers: %s", v37, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C3B75908](v38, -1, -1);
    MEMORY[0x1C3B75908](v37, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  v43 = sub_1BD7910D8();
  v44 = sub_1BD791174();
  if (os_log_type_enabled(v43, v44))
  {
    v45 = (uint8_t *)swift_slowAlloc();
    v46 = swift_slowAlloc();
    *(_DWORD *)v45 = 136315138;
    v78 = v75;
    aBlock[0] = v46;
    type metadata accessor for ParticipantPermission(0);
    v47 = sub_1BD79112C();
    v78 = sub_1BD7878CC(v47, v48, aBlock);
    sub_1BD7911A4();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1BD77B000, v43, v44, "callForAddParticipantsToShare permissionType: %s", v45, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C3B75908](v46, -1, -1);
    MEMORY[0x1C3B75908](v45, -1, -1);
  }

  v49 = v71;
  v50 = sub_1BD7910D8();
  v51 = sub_1BD791174();
  if (os_log_type_enabled(v50, v51))
  {
    v52 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v52 = 67109120;
    LODWORD(aBlock[0]) = v49 & 1;
    sub_1BD7911A4();
    _os_log_impl(&dword_1BD77B000, v50, v51, "callForAddParticipantsToShare allowOthersToInvite: %{BOOL}d", v52, 8u);
    MEMORY[0x1C3B75908](v52, -1, -1);
  }

  if (qword_1EDBB6B78 != -1)
    swift_once();
  v53 = (void *)qword_1EDBB6BE8;
  if (qword_1EDBB6BE8)
  {
    swift_unknownObjectRetain();
    v54 = (void *)sub_1BD791150();
    v55 = (void *)sub_1BD791150();
    v56 = swift_allocObject();
    v57 = v73;
    *(_QWORD *)(v56 + 16) = v72;
    *(_QWORD *)(v56 + 24) = v57;
    aBlock[4] = (uint64_t)sub_1BD787FCC;
    aBlock[5] = v56;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_1BD77F364;
    aBlock[3] = (uint64_t)&block_descriptor_72;
    v58 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    objc_msgSend(v53, sel_addParticipantsToShareWithURLWrapper_share_emailAddresses_phoneNumbers_permissionType_allowOthersToInvite_withReply_, v69, v70, v54, v55, v75, v49 & 1, v58);
    _Block_release(v58);
    swift_unknownObjectRelease();

  }
  else
  {
    v59 = sub_1BD7910A8();
    v60 = (uint64_t)v64;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v59 - 8) + 56))(v64, 1, 1, v59);
    sub_1BD79103C();
    sub_1BD7875B4(MEMORY[0x1E0DEE9D8]);
    sub_1BD787F0C(&qword_1EF4FDF20, (uint64_t (*)(uint64_t))MEMORY[0x1E0CADE48], MEMORY[0x1E0CADE40]);
    v61 = v65;
    v62 = v68;
    sub_1BD79106C();
    v63 = (void *)sub_1BD791030();
    (*(void (**)(char *, uint64_t))(v67 + 8))(v61, v62);
    v72(v60, 0, v63);

    sub_1BD787F8C(v60);
  }
}

void sub_1BD784E48(void *a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, void (*a7)(uint64_t, _QWORD, void *), uint64_t a8)
{
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  NSObject *v22;
  os_log_type_t v23;
  _BOOL4 v24;
  uint8_t *v25;
  uint64_t v26;
  _QWORD *v27;
  id v28;
  _QWORD *v29;
  NSObject *v30;
  os_log_type_t v31;
  uint8_t *v32;
  _QWORD *v33;
  NSObject *v34;
  NSObject *v35;
  NSObject *v36;
  os_log_type_t v37;
  uint8_t *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  unint64_t v43;
  NSObject *v44;
  os_log_type_t v45;
  uint8_t *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  unint64_t v51;
  NSObject *v52;
  os_log_type_t v53;
  uint8_t *v54;
  uint64_t v55;
  uint64_t v56;
  unint64_t v57;
  char v58;
  NSObject *v59;
  os_log_type_t v60;
  uint8_t *v61;
  void *v62;
  void *v63;
  void *v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  uint64_t v68;
  uint64_t v69;
  char *v70;
  uint64_t v71;
  void *v72;
  char *v73;
  char *v74;
  char *v75;
  uint64_t v76;
  uint64_t v77;
  id v78;
  int v79;
  void (*v80)(uint64_t, _QWORD, void *);
  uint64_t v81;
  uint64_t v82;
  NSObject *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t aBlock[7];

  v80 = a7;
  v81 = a8;
  v82 = a5;
  v13 = sub_1BD791048();
  MEMORY[0x1E0C80A78](v13);
  v75 = (char *)&v73 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_1BD791054();
  v76 = *(_QWORD *)(v15 - 8);
  v77 = v15;
  MEMORY[0x1E0C80A78](v15);
  v74 = (char *)&v73 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDBB6B70);
  MEMORY[0x1E0C80A78](v17);
  v73 = (char *)&v73 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1EDBB6B98 != -1)
    swift_once();
  v19 = sub_1BD7910F0();
  v20 = __swift_project_value_buffer(v19, (uint64_t)qword_1EDBB6BA0);
  v21 = a1;
  v22 = sub_1BD7910D8();
  v23 = sub_1BD791198();
  v24 = os_log_type_enabled(v22, v23);
  v85 = v20;
  v86 = a4;
  v84 = a3;
  v79 = a6;
  v78 = v21;
  if (v24)
  {
    v25 = (uint8_t *)swift_slowAlloc();
    v26 = swift_slowAlloc();
    v83 = a2;
    v27 = (_QWORD *)v26;
    *(_DWORD *)v25 = 138412290;
    aBlock[0] = (uint64_t)v21;
    v28 = v21;
    sub_1BD7911A4();
    *v27 = v21;

    _os_log_impl(&dword_1BD77B000, v22, v23, "callForAddParticipantsToShare share: %@", v25, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EDBB6B90);
    swift_arrayDestroy();
    v29 = v27;
    a2 = v83;
    MEMORY[0x1C3B75908](v29, -1, -1);
    MEMORY[0x1C3B75908](v25, -1, -1);

  }
  else
  {

  }
  v83 = a2;
  v30 = sub_1BD7910D8();
  v31 = sub_1BD791198();
  if (os_log_type_enabled(v30, v31))
  {
    v32 = (uint8_t *)swift_slowAlloc();
    v33 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v32 = 138412290;
    v34 = v83;
    aBlock[0] = (uint64_t)v83;
    v35 = v83;
    sub_1BD7911A4();
    *v33 = v34;

    _os_log_impl(&dword_1BD77B000, v30, v31, "callForAddParticipantsToShare containerSetupInfo: %@", v32, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EDBB6B90);
    swift_arrayDestroy();
    MEMORY[0x1C3B75908](v33, -1, -1);
    MEMORY[0x1C3B75908](v32, -1, -1);
  }
  else
  {

    v30 = v83;
  }

  swift_bridgeObjectRetain_n();
  v36 = sub_1BD7910D8();
  v37 = sub_1BD791174();
  if (os_log_type_enabled(v36, v37))
  {
    v38 = (uint8_t *)swift_slowAlloc();
    v39 = swift_slowAlloc();
    aBlock[0] = v39;
    *(_DWORD *)v38 = 136315138;
    v40 = swift_bridgeObjectRetain();
    v41 = MEMORY[0x1C3B754E8](v40, MEMORY[0x1E0DEA968]);
    v43 = v42;
    swift_bridgeObjectRelease();
    v87 = sub_1BD7878CC(v41, v43, aBlock);
    sub_1BD7911A4();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1BD77B000, v36, v37, "callForAddParticipantsToShare emailAddresses: %s", v38, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C3B75908](v39, -1, -1);
    MEMORY[0x1C3B75908](v38, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  swift_bridgeObjectRetain_n();
  v44 = sub_1BD7910D8();
  v45 = sub_1BD791174();
  if (os_log_type_enabled(v44, v45))
  {
    v46 = (uint8_t *)swift_slowAlloc();
    v47 = swift_slowAlloc();
    aBlock[0] = v47;
    *(_DWORD *)v46 = 136315138;
    v48 = swift_bridgeObjectRetain();
    v49 = MEMORY[0x1C3B754E8](v48, MEMORY[0x1E0DEA968]);
    v51 = v50;
    swift_bridgeObjectRelease();
    v87 = sub_1BD7878CC(v49, v51, aBlock);
    sub_1BD7911A4();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1BD77B000, v44, v45, "callForAddParticipantsToShare phoneNumbers: %s", v46, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C3B75908](v47, -1, -1);
    MEMORY[0x1C3B75908](v46, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  v52 = sub_1BD7910D8();
  v53 = sub_1BD791174();
  if (os_log_type_enabled(v52, v53))
  {
    v54 = (uint8_t *)swift_slowAlloc();
    v55 = swift_slowAlloc();
    *(_DWORD *)v54 = 136315138;
    v87 = v82;
    aBlock[0] = v55;
    type metadata accessor for ParticipantPermission(0);
    v56 = sub_1BD79112C();
    v87 = sub_1BD7878CC(v56, v57, aBlock);
    sub_1BD7911A4();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1BD77B000, v52, v53, "callForAddParticipantsToShare permissionType: %s", v54, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C3B75908](v55, -1, -1);
    MEMORY[0x1C3B75908](v54, -1, -1);
  }

  v58 = v79;
  v59 = sub_1BD7910D8();
  v60 = sub_1BD791174();
  if (os_log_type_enabled(v59, v60))
  {
    v61 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v61 = 67109120;
    LODWORD(aBlock[0]) = v58 & 1;
    sub_1BD7911A4();
    _os_log_impl(&dword_1BD77B000, v59, v60, "callForAddParticipantsToShare allowOthersToInvite: %{BOOL}d", v61, 8u);
    MEMORY[0x1C3B75908](v61, -1, -1);
  }

  if (qword_1EDBB6B78 != -1)
    swift_once();
  v62 = (void *)qword_1EDBB6BE8;
  if (qword_1EDBB6BE8)
  {
    swift_unknownObjectRetain();
    v63 = (void *)sub_1BD791150();
    v64 = (void *)sub_1BD791150();
    v65 = swift_allocObject();
    v66 = v81;
    *(_QWORD *)(v65 + 16) = v80;
    *(_QWORD *)(v65 + 24) = v66;
    aBlock[4] = (uint64_t)sub_1BD787FCC;
    aBlock[5] = v65;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_1BD77F364;
    aBlock[3] = (uint64_t)&block_descriptor_78;
    v67 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    objc_msgSend(v62, sel_addParticipantsToShare_containerSetupInfo_emailAddresses_phoneNumbers_permissionType_allowOthersToInvite_withReply_, v78, v83, v63, v64, v82, v58 & 1, v67);
    _Block_release(v67);
    swift_unknownObjectRelease();

  }
  else
  {
    v68 = sub_1BD7910A8();
    v69 = (uint64_t)v73;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v68 - 8) + 56))(v73, 1, 1, v68);
    sub_1BD79103C();
    sub_1BD7875B4(MEMORY[0x1E0DEE9D8]);
    sub_1BD787F0C(&qword_1EF4FDF20, (uint64_t (*)(uint64_t))MEMORY[0x1E0CADE48], MEMORY[0x1E0CADE40]);
    v70 = v74;
    v71 = v77;
    sub_1BD79106C();
    v72 = (void *)sub_1BD791030();
    (*(void (**)(char *, uint64_t))(v76 + 8))(v70, v71);
    v80(v69, 0, v72);

    sub_1BD787F8C(v69);
  }
}

uint64_t sub_1BD785828(void *a1, uint64_t a2, void *a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, const void *a9, void (*a10)(id, id, uint64_t, uint64_t, uint64_t, uint64_t, void *))
{
  void *v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;

  v15 = _Block_copy(a9);
  v16 = sub_1BD79115C();
  v17 = sub_1BD79115C();
  _Block_copy(v15);
  v18 = a3;
  v19 = a4;
  v20 = a1;
  a10(v18, v19, v16, v17, a7, a8, v15);
  _Block_release(v15);
  _Block_release(v15);

  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void sub_1BD785918(uint64_t a1, void (*a2)(_QWORD, _QWORD, _QWORD), uint64_t a3)
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
  NSObject *v17;
  os_log_type_t v18;
  _BOOL4 v19;
  uint64_t v20;
  uint8_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint8_t *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  char *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  void (*v37)(_QWORD, _QWORD, _QWORD);
  uint64_t v38;
  char *v39;
  char *v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t aBlock[6];

  v6 = sub_1BD791048();
  MEMORY[0x1E0C80A78](v6);
  v41 = (char *)&v35 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_1BD791054();
  v42 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v40 = (char *)&v35 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDBB6B70);
  MEMORY[0x1E0C80A78](v10);
  v39 = (char *)&v35 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_1BD7910A8();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x1E0C80A78](v12);
  v15 = (char *)&v35 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1EDBB6B98 != -1)
    swift_once();
  v16 = sub_1BD7910F0();
  __swift_project_value_buffer(v16, (uint64_t)qword_1EDBB6BA0);
  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))(v15, a1, v12);
  v17 = sub_1BD7910D8();
  v18 = sub_1BD791198();
  v19 = os_log_type_enabled(v17, v18);
  v43 = a1;
  if (v19)
  {
    v20 = swift_slowAlloc();
    v37 = a2;
    v21 = (uint8_t *)v20;
    v22 = swift_slowAlloc();
    v36 = v8;
    v23 = v22;
    aBlock[0] = v22;
    *(_DWORD *)v21 = 136315138;
    v38 = a3;
    sub_1BD787F0C(&qword_1EF4FDF28, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAFFF8], MEMORY[0x1E0CB0048]);
    v24 = sub_1BD791210();
    v44 = sub_1BD7878CC(v24, v25, aBlock);
    a3 = v38;
    sub_1BD7911A4();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
    _os_log_impl(&dword_1BD77B000, v17, v18, "callForExistingShareForFile url: %s", v21, 0xCu);
    swift_arrayDestroy();
    v26 = v23;
    v8 = v36;
    MEMORY[0x1C3B75908](v26, -1, -1);
    v27 = v21;
    a2 = v37;
    MEMORY[0x1C3B75908](v27, -1, -1);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  }

  if (qword_1EDBB6B78 != -1)
    swift_once();
  v28 = (void *)qword_1EDBB6BE8;
  if (qword_1EDBB6BE8)
  {
    swift_unknownObjectRetain();
    v29 = (void *)sub_1BD791084();
    v30 = swift_allocObject();
    *(_QWORD *)(v30 + 16) = a2;
    *(_QWORD *)(v30 + 24) = a3;
    aBlock[4] = (uint64_t)sub_1BD787FCC;
    aBlock[5] = v30;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_1BD77F364;
    aBlock[3] = (uint64_t)&block_descriptor_84;
    v31 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    objc_msgSend(v28, sel_existingShareForFile_withReply_, v29, v31);
    _Block_release(v31);
    swift_unknownObjectRelease();

  }
  else
  {
    v32 = (uint64_t)v39;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56))(v39, 1, 1, v12);
    sub_1BD79103C();
    sub_1BD7875B4(MEMORY[0x1E0DEE9D8]);
    sub_1BD787F0C(&qword_1EF4FDF20, (uint64_t (*)(uint64_t))MEMORY[0x1E0CADE48], MEMORY[0x1E0CADE40]);
    v33 = v40;
    sub_1BD79106C();
    v34 = (void *)sub_1BD791030();
    (*(void (**)(char *, uint64_t))(v42 + 8))(v33, v8);
    a2(v32, 0, v34);

    sub_1BD787F8C(v32);
  }
}

uint64_t sub_1BD785DA4(void *a1, uint64_t a2, uint64_t a3, const void *a4, void (*a5)(char *, void *))
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  id v13;
  uint64_t v15;

  v8 = sub_1BD7910A8();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78]();
  v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a4);
  sub_1BD79109C();
  _Block_copy(v12);
  v13 = a1;
  a5(v11, v12);
  _Block_release(v12);
  _Block_release(v12);

  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

void sub_1BD785E78(uint64_t a1, void *a2, void (*a3)(_QWORD, _QWORD, void *), uint64_t a4)
{
  uint64_t v6;
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
  char *v18;
  uint64_t v19;
  NSObject *v20;
  os_log_type_t v21;
  uint8_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  NSObject *v28;
  NSObject *v29;
  os_log_type_t v30;
  uint8_t *v31;
  _QWORD *v32;
  NSObject *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  int v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  char *v47;
  char *v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void (*v53)(_QWORD, _QWORD, void *);
  uint64_t v54;
  uint64_t v55;
  uint64_t aBlock[7];

  v53 = a3;
  v54 = a4;
  aBlock[6] = *MEMORY[0x1E0C80C00];
  v6 = sub_1BD791048();
  MEMORY[0x1E0C80A78](v6);
  v49 = (char *)&v45 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_1BD791054();
  v50 = *(_QWORD *)(v8 - 8);
  v51 = v8;
  MEMORY[0x1E0C80A78](v8);
  v48 = (char *)&v45 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDBB6B70);
  v11 = MEMORY[0x1E0C80A78](v10);
  v13 = (char *)&v45 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = MEMORY[0x1E0C80A78](v11);
  v16 = (char *)&v45 - v15;
  MEMORY[0x1E0C80A78](v14);
  v18 = (char *)&v45 - v17;
  if (qword_1EDBB6B98 != -1)
    swift_once();
  v19 = sub_1BD7910F0();
  __swift_project_value_buffer(v19, (uint64_t)qword_1EDBB6BA0);
  v52 = a1;
  sub_1BD7906BC(a1, (uint64_t)v18, &qword_1EDBB6B70);
  v20 = sub_1BD7910D8();
  v21 = sub_1BD791198();
  if (os_log_type_enabled(v20, v21))
  {
    v22 = (uint8_t *)swift_slowAlloc();
    v23 = swift_slowAlloc();
    v47 = v13;
    v24 = v23;
    aBlock[0] = v23;
    v46 = a2;
    *(_DWORD *)v22 = 136315138;
    sub_1BD7906BC((uint64_t)v18, (uint64_t)v16, &qword_1EDBB6B70);
    v25 = sub_1BD79112C();
    v55 = sub_1BD7878CC(v25, v26, aBlock);
    a2 = v46;
    sub_1BD7911A4();
    swift_bridgeObjectRelease();
    sub_1BD787F8C((uint64_t)v18);
    _os_log_impl(&dword_1BD77B000, v20, v21, "callForUserNameAndEmail url: %s", v22, 0xCu);
    swift_arrayDestroy();
    v27 = v24;
    v13 = v47;
    MEMORY[0x1C3B75908](v27, -1, -1);
    MEMORY[0x1C3B75908](v22, -1, -1);
  }
  else
  {
    sub_1BD787F8C((uint64_t)v18);
  }

  v28 = a2;
  v29 = sub_1BD7910D8();
  v30 = sub_1BD791198();
  if (os_log_type_enabled(v29, v30))
  {
    v31 = (uint8_t *)swift_slowAlloc();
    v32 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v31 = 138412290;
    if (a2)
    {
      aBlock[0] = (uint64_t)v28;
      v33 = v28;
    }
    else
    {
      aBlock[0] = 0;
    }
    sub_1BD7911A4();
    *v32 = a2;

    _os_log_impl(&dword_1BD77B000, v29, v30, "callForUserNameAndEmail containerSetupInfo: %@", v31, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EDBB6B90);
    swift_arrayDestroy();
    MEMORY[0x1C3B75908](v32, -1, -1);
    MEMORY[0x1C3B75908](v31, -1, -1);
    v34 = v52;
  }
  else
  {

    v29 = v28;
    v34 = v52;
  }

  if (qword_1EDBB6B78 != -1)
    swift_once();
  v35 = (void *)qword_1EDBB6BE8;
  if (qword_1EDBB6BE8)
  {
    sub_1BD7906BC(v34, (uint64_t)v13, &qword_1EDBB6B70);
    v36 = sub_1BD7910A8();
    v37 = *(_QWORD *)(v36 - 8);
    v38 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v37 + 48))(v13, 1, v36);
    swift_unknownObjectRetain();
    v39 = 0;
    if (v38 != 1)
    {
      v39 = (void *)sub_1BD791084();
      (*(void (**)(char *, uint64_t))(v37 + 8))(v13, v36);
    }
    v40 = swift_allocObject();
    v41 = v54;
    *(_QWORD *)(v40 + 16) = v53;
    *(_QWORD *)(v40 + 24) = v41;
    aBlock[4] = (uint64_t)sub_1BD787FCC;
    aBlock[5] = v40;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_1BD786470;
    aBlock[3] = (uint64_t)&block_descriptor_90;
    v42 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    objc_msgSend(v35, sel_userNameAndEmail_containerSetupInfo_withReply_, v39, v28, v42);
    _Block_release(v42);
    swift_unknownObjectRelease();
  }
  else
  {
    sub_1BD79103C();
    sub_1BD7875B4(MEMORY[0x1E0DEE9D8]);
    sub_1BD787F0C(&qword_1EF4FDF20, (uint64_t (*)(uint64_t))MEMORY[0x1E0CADE48], MEMORY[0x1E0CADE40]);
    v43 = v48;
    v44 = v51;
    sub_1BD79106C();
    v39 = (void *)sub_1BD791030();
    (*(void (**)(char *, uint64_t))(v50 + 8))(v43, v44);
    v53(0, 0, v39);
  }

}

void sub_1BD786470(uint64_t a1, void *a2, void *a3, void *a4)
{
  void (*v7)(void *, void *, void *);
  id v8;
  id v9;
  id v10;

  v7 = *(void (**)(void *, void *, void *))(a1 + 32);
  swift_retain();
  v10 = a2;
  v8 = a3;
  v9 = a4;
  v7(a2, a3, a4);
  swift_release();

}

void sub_1BD78661C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  id v8;

  if (a3)
    v7 = sub_1BD791078();
  else
    v7 = 0;
  v8 = (id)v7;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(a4 + 16))(a4, a1, a2);

}

void sub_1BD786684(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, void (*a7)(uint64_t, _QWORD, void *), uint64_t a8)
{
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
  void (*v22)(char *, uint64_t, uint64_t);
  NSObject *v23;
  os_log_type_t v24;
  _BOOL4 v25;
  uint8_t *v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  NSObject *v30;
  os_log_type_t v31;
  uint8_t *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  unint64_t v37;
  NSObject *v38;
  os_log_type_t v39;
  uint8_t *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  unint64_t v45;
  NSObject *v46;
  os_log_type_t v47;
  uint8_t *v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t v51;
  char v52;
  uint64_t v53;
  uint64_t v54;
  NSObject *v55;
  os_log_type_t v56;
  uint8_t *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  void (*v65)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v66;
  char *v67;
  uint64_t v68;
  void *v69;
  uint8_t *v70;
  char *v71;
  char *v72;
  char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  int v79;
  void (*v80)(uint64_t, _QWORD, void *);
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t aBlock[7];

  v80 = a7;
  v81 = a8;
  v79 = a6;
  v83 = a5;
  v77 = a4;
  v11 = sub_1BD791048();
  MEMORY[0x1E0C80A78](v11);
  v73 = (char *)&v70 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_1BD791054();
  v74 = *(_QWORD *)(v13 - 8);
  v75 = v13;
  MEMORY[0x1E0C80A78](v13);
  v72 = (char *)&v70 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDBB6B70);
  MEMORY[0x1E0C80A78](v15);
  v71 = (char *)&v70 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = sub_1BD7910A8();
  v18 = *(_QWORD *)(v17 - 8);
  MEMORY[0x1E0C80A78](v17);
  v20 = (char *)&v70 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1EDBB6B98 != -1)
    swift_once();
  v21 = sub_1BD7910F0();
  __swift_project_value_buffer(v21, (uint64_t)qword_1EDBB6BA0);
  v22 = *(void (**)(char *, uint64_t, uint64_t))(v18 + 16);
  v76 = a1;
  v22(v20, a1, v17);
  v23 = sub_1BD7910D8();
  v24 = sub_1BD791198();
  v25 = os_log_type_enabled(v23, v24);
  v84 = v18;
  v85 = a3;
  v82 = a2;
  v78 = v17;
  if (v25)
  {
    v26 = (uint8_t *)swift_slowAlloc();
    v27 = swift_slowAlloc();
    aBlock[0] = v27;
    *(_DWORD *)v26 = 136315138;
    sub_1BD787F0C(&qword_1EF4FDF28, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAFFF8], MEMORY[0x1E0CB0048]);
    v28 = sub_1BD791210();
    v86 = sub_1BD7878CC(v28, v29, aBlock);
    sub_1BD7911A4();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v84 + 8))(v20, v17);
    _os_log_impl(&dword_1BD77B000, v23, v24, "callForForciblyShareFolder folderURL: %s", v26, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C3B75908](v27, -1, -1);
    MEMORY[0x1C3B75908](v26, -1, -1);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v18 + 8))(v20, v17);
  }

  swift_bridgeObjectRetain_n();
  v30 = sub_1BD7910D8();
  v31 = sub_1BD791174();
  if (os_log_type_enabled(v30, v31))
  {
    v32 = (uint8_t *)swift_slowAlloc();
    v33 = swift_slowAlloc();
    aBlock[0] = v33;
    *(_DWORD *)v32 = 136315138;
    v70 = v32 + 4;
    v34 = swift_bridgeObjectRetain();
    v35 = MEMORY[0x1C3B754E8](v34, MEMORY[0x1E0DEA968]);
    v37 = v36;
    swift_bridgeObjectRelease();
    v86 = sub_1BD7878CC(v35, v37, aBlock);
    sub_1BD7911A4();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1BD77B000, v30, v31, "callForForciblyShareFolder emailAddresses: %s", v32, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C3B75908](v33, -1, -1);
    MEMORY[0x1C3B75908](v32, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  swift_bridgeObjectRetain_n();
  v38 = sub_1BD7910D8();
  v39 = sub_1BD791174();
  if (os_log_type_enabled(v38, v39))
  {
    v40 = (uint8_t *)swift_slowAlloc();
    v41 = swift_slowAlloc();
    aBlock[0] = v41;
    *(_DWORD *)v40 = 136315138;
    v42 = swift_bridgeObjectRetain();
    v43 = MEMORY[0x1C3B754E8](v42, MEMORY[0x1E0DEA968]);
    v45 = v44;
    swift_bridgeObjectRelease();
    v86 = sub_1BD7878CC(v43, v45, aBlock);
    sub_1BD7911A4();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1BD77B000, v38, v39, "callForForciblyShareFolder phoneNumbers: %s", v40, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C3B75908](v41, -1, -1);
    MEMORY[0x1C3B75908](v40, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  v46 = sub_1BD7910D8();
  v47 = sub_1BD791174();
  if (os_log_type_enabled(v46, v47))
  {
    v48 = (uint8_t *)swift_slowAlloc();
    v49 = swift_slowAlloc();
    *(_DWORD *)v48 = 136315138;
    v86 = v83;
    aBlock[0] = v49;
    type metadata accessor for ParticipantPermission(0);
    v50 = sub_1BD79112C();
    v86 = sub_1BD7878CC(v50, v51, aBlock);
    sub_1BD7911A4();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1BD77B000, v46, v47, "callForForciblyShareFolder permissionType: %s", v48, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C3B75908](v49, -1, -1);
    MEMORY[0x1C3B75908](v48, -1, -1);
  }

  v52 = v79;
  v53 = v78;
  v54 = v84;
  v55 = sub_1BD7910D8();
  v56 = sub_1BD791174();
  if (os_log_type_enabled(v55, v56))
  {
    v57 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v57 = 67109120;
    LODWORD(aBlock[0]) = v52 & 1;
    sub_1BD7911A4();
    _os_log_impl(&dword_1BD77B000, v55, v56, "callForForciblyShareFolder allowOthersToInvite: %{BOOL}d", v57, 8u);
    MEMORY[0x1C3B75908](v57, -1, -1);
  }

  if (qword_1EDBB6B78 != -1)
    swift_once();
  v58 = (void *)qword_1EDBB6BE8;
  if (qword_1EDBB6BE8)
  {
    swift_unknownObjectRetain();
    v59 = (void *)sub_1BD791084();
    v60 = (void *)sub_1BD791150();
    v61 = (void *)sub_1BD791150();
    v62 = swift_allocObject();
    v63 = v81;
    *(_QWORD *)(v62 + 16) = v80;
    *(_QWORD *)(v62 + 24) = v63;
    aBlock[4] = (uint64_t)sub_1BD787FCC;
    aBlock[5] = v62;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_1BD77F364;
    aBlock[3] = (uint64_t)&block_descriptor_96;
    v64 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    objc_msgSend(v58, sel_forciblyShareFolder_emailAddresses_phoneNumbers_accessType_permissionType_allowOthersToInvite_withReply_, v59, v60, v61, v77, v83, v52 & 1, v64);
    _Block_release(v64);
    swift_unknownObjectRelease();

  }
  else
  {
    v65 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v54 + 56);
    v66 = (uint64_t)v71;
    v65(v71, 1, 1, v53);
    sub_1BD79103C();
    sub_1BD7875B4(MEMORY[0x1E0DEE9D8]);
    sub_1BD787F0C(&qword_1EF4FDF20, (uint64_t (*)(uint64_t))MEMORY[0x1E0CADE48], MEMORY[0x1E0CADE40]);
    v67 = v72;
    v68 = v75;
    sub_1BD79106C();
    v69 = (void *)sub_1BD791030();
    (*(void (**)(char *, uint64_t))(v74 + 8))(v67, v68);
    v80(v66, 0, v69);

    sub_1BD787F8C(v66);
  }
}

uint64_t sub_1BD786FF4(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, unsigned int a8, const void *a9, void (*a10)(char *, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD, void *))
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  uint64_t v21;
  unsigned int v22;

  v22 = a8;
  v21 = a7;
  v12 = sub_1BD7910A8();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x1E0C80A78]();
  v15 = (char *)&v21 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = _Block_copy(a9);
  sub_1BD79109C();
  v17 = sub_1BD79115C();
  v18 = sub_1BD79115C();
  _Block_copy(v16);
  v19 = a1;
  a10(v15, v17, v18, a6, v21, v22, v16);
  _Block_release(v16);
  _Block_release(v16);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v15, v12);
}

id InitiateSharing.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id InitiateSharing.init()()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for InitiateSharing();
  return objc_msgSendSuper2(&v2, sel_init);
}

id InitiateSharing.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for InitiateSharing();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t sub_1BD787208(uint64_t a1, uint64_t a2)
{
  return sub_1BD787350(a1, a2, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB1940]);
}

uint64_t sub_1BD787214(uint64_t a1, id *a2)
{
  uint64_t result;

  result = sub_1BD791108();
  *a2 = 0;
  return result;
}

uint64_t sub_1BD787288(uint64_t a1, id *a2)
{
  char v3;

  v3 = sub_1BD791114();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_1BD787304@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  sub_1BD791120();
  v2 = sub_1BD7910FC();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_1BD787344(uint64_t a1, uint64_t a2)
{
  return sub_1BD787350(a1, a2, MEMORY[0x1E0DEA950]);
}

uint64_t sub_1BD787350(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4;
  uint64_t v5;

  v4 = sub_1BD791120();
  v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_1BD78738C()
{
  sub_1BD791120();
  sub_1BD791138();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1BD7873CC()
{
  uint64_t v0;

  sub_1BD791120();
  sub_1BD791228();
  sub_1BD791138();
  v0 = sub_1BD791234();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_1BD78743C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;

  v0 = sub_1BD791120();
  v2 = v1;
  if (v0 == sub_1BD791120() && v2 == v3)
    v5 = 1;
  else
    v5 = sub_1BD79121C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_1BD7874C4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = sub_1BD7910FC();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_1BD787508@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_1BD791120();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_1BD787530()
{
  sub_1BD787F0C(&qword_1EF4FDF68, (uint64_t (*)(uint64_t))type metadata accessor for URLResourceKey, (uint64_t)&unk_1BD7919C8);
  sub_1BD787F0C(&qword_1EF4FDF70, (uint64_t (*)(uint64_t))type metadata accessor for URLResourceKey, (uint64_t)&unk_1BD791968);
  return sub_1BD791204();
}

unint64_t sub_1BD7875B4(uint64_t a1)
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
    v3 = (_QWORD *)MEMORY[0x1E0DEE9E0];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF4FDF80);
  v2 = sub_1BD7911EC();
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
    sub_1BD7906BC(v6, (uint64_t)&v15, &qword_1EF4FDF88);
    v7 = v15;
    v8 = v16;
    result = sub_1BD787724(v15, v16);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v11 = (uint64_t *)(v3[6] + 16 * result);
    *v11 = v7;
    v11[1] = v8;
    result = (unint64_t)sub_1BD790700(&v17, (_OWORD *)(v3[7] + 32 * result));
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

uint64_t sub_1BD7876E8()
{
  swift_release();
  return swift_deallocObject();
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

unint64_t sub_1BD787724(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_1BD791228();
  sub_1BD791138();
  v4 = sub_1BD791234();
  return sub_1BD787788(a1, a2, v4);
}

unint64_t sub_1BD787788(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t i;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v15;

  v4 = v3 + 64;
  v5 = -1 << *(_BYTE *)(v3 + 32);
  i = a3 & ~v5;
  if (((*(_QWORD *)(v3 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0)
  {
    v9 = *(_QWORD *)(v3 + 48);
    v10 = (_QWORD *)(v9 + 16 * i);
    if ((*v10 != a1 || v10[1] != a2) && (sub_1BD79121C() & 1) == 0)
    {
      v12 = ~v5;
      i = (i + 1) & v12;
      if (((*(_QWORD *)(v4 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0)
      {
        v13 = (_QWORD *)(v9 + 16 * i);
        if ((*v13 != a1 || v13[1] != a2) && (sub_1BD79121C() & 1) == 0)
        {
          for (i = (i + 1) & v12; ((*(_QWORD *)(v4 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0; i = (i + 1) & v12)
          {
            v15 = (_QWORD *)(v9 + 16 * i);
            if (*v15 == a1 && v15[1] == a2)
              break;
            if ((sub_1BD79121C() & 1) != 0)
              break;
          }
        }
      }
    }
  }
  return i;
}

uint64_t sub_1BD7878CC(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_1BD78799C(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_1BD79067C((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = MEMORY[0x1E0DEC2B8];
    v12[0] = a1;
    v12[1] = a2;
    v10 = *a3;
    if (*a3)
    {
      sub_1BD79067C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_1BD78799C(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_1BD7911B0();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_1BD787B54(a5, a6);
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
  v8 = sub_1BD7911D4();
  if (!v8)
  {
    sub_1BD7911E0();
    __break(1u);
LABEL_17:
    result = sub_1BD7911F8();
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

uint64_t sub_1BD787B54(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_1BD787BE8(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_1BD787DC0(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_1BD787DC0(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_1BD787BE8(uint64_t a1, unint64_t a2)
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
      v3 = sub_1BD787D5C(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_1BD7911C8();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_1BD7911E0();
      __break(1u);
LABEL_10:
      v2 = sub_1BD791144();
      if (!v2)
        return MEMORY[0x1E0DEE9D8];
    }
    sub_1BD7911F8();
    __break(1u);
LABEL_14:
    result = sub_1BD7911E0();
    __break(1u);
  }
  else
  {
    return MEMORY[0x1E0DEE9D8];
  }
  return result;
}

_QWORD *sub_1BD787D5C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  size_t v5;

  if (a2 <= a1)
    v2 = a1;
  else
    v2 = a2;
  if (!v2)
    return (_QWORD *)MEMORY[0x1E0DEE9D8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF4FDF78);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_1BD787DC0(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF4FDF78);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    v10 = (char *)MEMORY[0x1E0DEE9D8];
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
  result = sub_1BD7911F8();
  __break(1u);
  return result;
}

uint64_t sub_1BD787F0C(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x1C3B758A8](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x1C3B7589C]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_1BD787F8C(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDBB6B70);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void type metadata accessor for ParticipantPermission(uint64_t a1)
{
  sub_1BD7882E8(a1, &qword_1EF4FDF40);
}

uint64_t sub_1BD787FE4()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_1BD788004(uint64_t a1, unint64_t a2)
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

uint64_t sub_1BD788048(uint64_t a1, unint64_t a2)
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

uint64_t type metadata accessor for InitiateSharing()
{
  return objc_opt_self();
}

uint64_t method lookup function for InitiateSharing()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of InitiateSharing.callForSharingStatus(_:reply:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x50))();
}

uint64_t dispatch thunk of InitiateSharing.callForFileSharing(_:emailAddresses:phoneNumbers:accessType:permissionType:allowOthersToInvite:reply:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x58))();
}

uint64_t dispatch thunk of InitiateSharing.callForCloudKitAddToShare(_:containerSetupInfo:emailAddresses:phoneNumbers:accessType:permissionType:allowOthersToInvite:reply:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x60))();
}

uint64_t dispatch thunk of InitiateSharing.callForSharingURLAddToShare(_:containerSetupInfo:emailAddresses:phoneNumbers:accessType:permissionType:allowOthersToInvite:reply:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x68))();
}

uint64_t dispatch thunk of InitiateSharing.callForSharingURLRemoveShare(_:containerSetupInfo:reply:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x70))();
}

uint64_t dispatch thunk of InitiateSharing.callForRemoveShare(_:containerSetupInfo:reply:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x78))();
}

uint64_t dispatch thunk of InitiateSharing.callForFileURLRemoveShare(_:reply:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x80))();
}

uint64_t dispatch thunk of InitiateSharing.callForMailContent(_:share:fileURL:appName:appIconData:reply:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x88))();
}

uint64_t dispatch thunk of InitiateSharing.callForMetadataFromShareURL(_:containerSetupInfo:reply:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x90))();
}

uint64_t dispatch thunk of InitiateSharing.callForUpdateShare(_:containerSetupInfo:reply:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x98))();
}

uint64_t dispatch thunk of InitiateSharing.callForCurrentUserSharingStatus(_:reply:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xA0))();
}

uint64_t dispatch thunk of InitiateSharing.callForAddParticipantsToShare(_:containerSetupInfo:emailAddresses:phoneNumbers:reply:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xA8))();
}

uint64_t dispatch thunk of InitiateSharing.callForAddParticipantsToShareWithURLWrapper(_:share:emailAddresses:phoneNumbers:permissionType:allowOthersToInvite:reply:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xB0))();
}

uint64_t dispatch thunk of InitiateSharing.callForAddParticipantsToShare(_:containerSetupInfo:emailAddresses:phoneNumbers:permissionType:allowOthersToInvite:reply:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xB8))();
}

uint64_t dispatch thunk of InitiateSharing.callForExistingShareForFile(_:reply:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xC0))();
}

uint64_t dispatch thunk of InitiateSharing.callForUserNameAndEmail(_:containerSetupInfo:reply:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xC8))();
}

uint64_t dispatch thunk of InitiateSharing.callForForciblyShareFolder(_:emailAddresses:phoneNumbers:accessType:permissionType:allowOthersToInvite:reply:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xD0))();
}

void type metadata accessor for URLResourceKey(uint64_t a1)
{
  sub_1BD7882E8(a1, &qword_1EF4FDF30);
}

void type metadata accessor for CSUICurrentUserCKShareStatus(uint64_t a1)
{
  sub_1BD7882E8(a1, &qword_1EF4FDF38);
}

void type metadata accessor for CSUIShareItemStatus(uint64_t a1)
{
  sub_1BD7882E8(a1, &qword_1EF4FDF48);
}

void sub_1BD7882E8(uint64_t a1, unint64_t *a2)
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

uint64_t sub_1BD78832C()
{
  return sub_1BD787F0C(&qword_1EF4FDF50, (uint64_t (*)(uint64_t))type metadata accessor for URLResourceKey, (uint64_t)&unk_1BD79192C);
}

uint64_t sub_1BD788358()
{
  return sub_1BD787F0C(&qword_1EF4FDF58, (uint64_t (*)(uint64_t))type metadata accessor for URLResourceKey, (uint64_t)&unk_1BD791900);
}

uint64_t sub_1BD788384()
{
  return sub_1BD787F0C(&qword_1EF4FDF60, (uint64_t (*)(uint64_t))type metadata accessor for URLResourceKey, (uint64_t)&unk_1BD79199C);
}

void sub_1BD7883B0(uint64_t a1, void (**a2)(_QWORD, _QWORD, _QWORD))
{
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
  NSObject *v14;
  os_log_type_t v15;
  _BOOL4 v16;
  uint64_t v17;
  uint8_t *v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint8_t *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  char *v27;
  uint64_t v28;
  void *v29;
  char *v30;
  void (**v31)(_QWORD, _QWORD, _QWORD);
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t aBlock[6];

  sub_1BD791048();
  MEMORY[0x1E0C80A78]();
  v5 = (char *)&v30 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_1BD791054();
  v34 = *(_QWORD *)(v6 - 8);
  v35 = v6;
  MEMORY[0x1E0C80A78]();
  v33 = (char *)&v30 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_1BD7910A8();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78]();
  v11 = (char *)&v30 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = a2;
  _Block_copy(a2);
  if (qword_1EDBB6B98 != -1)
    swift_once();
  v13 = sub_1BD7910F0();
  __swift_project_value_buffer(v13, (uint64_t)qword_1EDBB6BA0);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a1, v8);
  v14 = sub_1BD7910D8();
  v15 = sub_1BD791198();
  v16 = os_log_type_enabled(v14, v15);
  v36 = a1;
  if (v16)
  {
    v17 = swift_slowAlloc();
    v32 = v12;
    v18 = (uint8_t *)v17;
    v19 = swift_slowAlloc();
    aBlock[0] = v19;
    v30 = v5;
    v31 = a2;
    *(_DWORD *)v18 = 136315138;
    sub_1BD787F0C(&qword_1EF4FDF28, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAFFF8], MEMORY[0x1E0CB0048]);
    v20 = sub_1BD791210();
    v37 = sub_1BD7878CC(v20, v21, aBlock);
    a2 = v31;
    sub_1BD7911A4();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    _os_log_impl(&dword_1BD77B000, v14, v15, "callForSharingStatus url: %s", v18, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C3B75908](v19, -1, -1);
    v22 = v18;
    v12 = v32;
    MEMORY[0x1C3B75908](v22, -1, -1);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  }

  if (qword_1EDBB6B78 != -1)
    swift_once();
  v23 = (void *)qword_1EDBB6BE8;
  if (qword_1EDBB6BE8)
  {
    swift_unknownObjectRetain();
    v24 = (void *)sub_1BD791084();
    v25 = swift_allocObject();
    *(_QWORD *)(v25 + 16) = sub_1BD790644;
    *(_QWORD *)(v25 + 24) = v12;
    aBlock[4] = (uint64_t)sub_1BD787FCC;
    aBlock[5] = v25;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_1BD77E930;
    aBlock[3] = (uint64_t)&block_descriptor_275;
    v26 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    objc_msgSend(v23, sel_sharingStatusFor_withReply_, v24, v26);
    _Block_release(v26);
    swift_release();
    swift_unknownObjectRelease();
  }
  else
  {
    sub_1BD79103C();
    sub_1BD7875B4(MEMORY[0x1E0DEE9D8]);
    sub_1BD787F0C(&qword_1EF4FDF20, (uint64_t (*)(uint64_t))MEMORY[0x1E0CADE48], MEMORY[0x1E0CADE40]);
    v27 = v33;
    v28 = v35;
    sub_1BD79106C();
    v29 = (void *)sub_1BD791030();
    (*(void (**)(char *, uint64_t))(v34 + 8))(v27, v28);
    v24 = (void *)sub_1BD791078();
    ((void (**)(_QWORD, _QWORD, void *))a2)[2](a2, 0, v24);
    swift_release();

  }
}

void sub_1BD788804(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, void (**a7)(const void *, void *, _QWORD, void *))
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  os_log_type_t v24;
  _BOOL4 v25;
  uint8_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  NSObject *v31;
  os_log_type_t v32;
  uint8_t *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  unint64_t v38;
  NSObject *v39;
  os_log_type_t v40;
  _BOOL4 v41;
  uint8_t *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  unint64_t v47;
  NSObject *v48;
  os_log_type_t v49;
  uint8_t *v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;
  NSObject *v54;
  os_log_type_t v55;
  uint8_t *v56;
  uint64_t v57;
  uint64_t v58;
  unint64_t v59;
  char v60;
  uint64_t v61;
  NSObject *v62;
  os_log_type_t v63;
  uint8_t *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  uint64_t v72;
  uint64_t v73;
  char *v74;
  uint64_t v75;
  void *v76;
  uint64_t v77;
  void *v78;
  void (**v79)(const void *, void *, _QWORD, void *);
  void *v80;
  void (*v81)(char *, uint64_t);
  void (**v82)(const void *, void *, _QWORD, void *);
  char *v83;
  char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  char *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  int v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t aBlock[7];

  v92 = a6;
  v93 = a4;
  v94 = a5;
  sub_1BD791048();
  ((void (*)(void))MEMORY[0x1E0C80A78])();
  v84 = (char *)&v81 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_1BD791054();
  v85 = *(_QWORD *)(v12 - 8);
  v86 = v12;
  ((void (*)(void))MEMORY[0x1E0C80A78])();
  v83 = (char *)&v81 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDBB6B70);
  v14 = ((uint64_t (*)(void))MEMORY[0x1E0C80A78])();
  v87 = (uint64_t)&v81 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v14);
  v88 = (char *)&v81 - v16;
  v97 = sub_1BD7910A8();
  v17 = *(_QWORD *)(v97 - 8);
  MEMORY[0x1E0C80A78](v97);
  v19 = (char *)&v81 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = swift_allocObject();
  *(_QWORD *)(v20 + 16) = a7;
  v82 = a7;
  _Block_copy(a7);
  if (qword_1EDBB6B98 != -1)
    swift_once();
  v21 = sub_1BD7910F0();
  v22 = __swift_project_value_buffer(v21, (uint64_t)qword_1EDBB6BA0);
  (*(void (**)(char *, uint64_t, uint64_t))(v17 + 16))(v19, a1, v97);
  v98 = v22;
  v23 = sub_1BD7910D8();
  v24 = sub_1BD791198();
  v25 = os_log_type_enabled(v23, v24);
  v95 = v17;
  v96 = a3;
  v91 = v20;
  v89 = a1;
  if (v25)
  {
    v26 = (uint8_t *)swift_slowAlloc();
    v27 = swift_slowAlloc();
    aBlock[0] = v27;
    *(_DWORD *)v26 = 136315138;
    sub_1BD787F0C(&qword_1EF4FDF28, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAFFF8], MEMORY[0x1E0CB0048]);
    v28 = v97;
    v29 = sub_1BD791210();
    v99 = sub_1BD7878CC(v29, v30, aBlock);
    sub_1BD7911A4();
    swift_bridgeObjectRelease();
    v81 = *(void (**)(char *, uint64_t))(v95 + 8);
    v81(v19, v28);
    _os_log_impl(&dword_1BD77B000, v23, v24, "callForFileSharing url: %s", v26, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C3B75908](v27, -1, -1);
    MEMORY[0x1C3B75908](v26, -1, -1);
  }
  else
  {
    v81 = *(void (**)(char *, uint64_t))(v17 + 8);
    v81(v19, v97);
  }

  swift_bridgeObjectRetain_n();
  v31 = sub_1BD7910D8();
  v32 = sub_1BD791174();
  if (os_log_type_enabled(v31, v32))
  {
    v33 = (uint8_t *)swift_slowAlloc();
    v34 = swift_slowAlloc();
    aBlock[0] = v34;
    *(_DWORD *)v33 = 136315138;
    v35 = swift_bridgeObjectRetain();
    v36 = MEMORY[0x1C3B754E8](v35, MEMORY[0x1E0DEA968]);
    v38 = v37;
    swift_bridgeObjectRelease();
    v99 = sub_1BD7878CC(v36, v38, aBlock);
    sub_1BD7911A4();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1BD77B000, v31, v32, "callForFileSharing emailAddresses: %s", v33, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C3B75908](v34, -1, -1);
    MEMORY[0x1C3B75908](v33, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  swift_bridgeObjectRetain_n();
  v39 = sub_1BD7910D8();
  v40 = sub_1BD791174();
  v41 = os_log_type_enabled(v39, v40);
  v90 = a2;
  if (v41)
  {
    v42 = (uint8_t *)swift_slowAlloc();
    v43 = swift_slowAlloc();
    aBlock[0] = v43;
    *(_DWORD *)v42 = 136315138;
    v44 = swift_bridgeObjectRetain();
    v45 = MEMORY[0x1C3B754E8](v44, MEMORY[0x1E0DEA968]);
    v47 = v46;
    swift_bridgeObjectRelease();
    v99 = sub_1BD7878CC(v45, v47, aBlock);
    sub_1BD7911A4();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1BD77B000, v39, v40, "callForFileSharing phoneNumbers: %s", v42, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C3B75908](v43, -1, -1);
    MEMORY[0x1C3B75908](v42, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  v48 = sub_1BD7910D8();
  v49 = sub_1BD791174();
  if (os_log_type_enabled(v48, v49))
  {
    v50 = (uint8_t *)swift_slowAlloc();
    v51 = swift_slowAlloc();
    *(_DWORD *)v50 = 136315138;
    v99 = v93;
    aBlock[0] = v51;
    type metadata accessor for ParticipantPermission(0);
    v52 = sub_1BD79112C();
    v99 = sub_1BD7878CC(v52, v53, aBlock);
    sub_1BD7911A4();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1BD77B000, v48, v49, "callForFileSharing accessType: %s", v50, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C3B75908](v51, -1, -1);
    MEMORY[0x1C3B75908](v50, -1, -1);
  }

  v54 = sub_1BD7910D8();
  v55 = sub_1BD791174();
  if (os_log_type_enabled(v54, v55))
  {
    v56 = (uint8_t *)swift_slowAlloc();
    v57 = swift_slowAlloc();
    *(_DWORD *)v56 = 136315138;
    v99 = v94;
    aBlock[0] = v57;
    type metadata accessor for ParticipantPermission(0);
    v58 = sub_1BD79112C();
    v99 = sub_1BD7878CC(v58, v59, aBlock);
    sub_1BD7911A4();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1BD77B000, v54, v55, "callForFileSharing permissionType: %s", v56, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C3B75908](v57, -1, -1);
    MEMORY[0x1C3B75908](v56, -1, -1);
  }

  v60 = v92;
  v61 = v95;
  v62 = sub_1BD7910D8();
  v63 = sub_1BD791174();
  if (os_log_type_enabled(v62, v63))
  {
    v64 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v64 = 67109120;
    LODWORD(aBlock[0]) = v60 & 1;
    sub_1BD7911A4();
    _os_log_impl(&dword_1BD77B000, v62, v63, "callForFileSharing allowOthersToInvite: %{BOOL}d", v64, 8u);
    MEMORY[0x1C3B75908](v64, -1, -1);
  }

  if (qword_1EDBB6B78 != -1)
    swift_once();
  v65 = (void *)qword_1EDBB6BE8;
  if (qword_1EDBB6BE8)
  {
    swift_unknownObjectRetain();
    v66 = (void *)sub_1BD791084();
    v67 = (void *)sub_1BD791150();
    v68 = (void *)sub_1BD791150();
    v69 = swift_allocObject();
    v70 = v91;
    *(_QWORD *)(v69 + 16) = sub_1BD7908EC;
    *(_QWORD *)(v69 + 24) = v70;
    aBlock[4] = (uint64_t)sub_1BD787FCC;
    aBlock[5] = v69;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_1BD77F364;
    aBlock[3] = (uint64_t)&block_descriptor_265;
    v71 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    objc_msgSend(v65, sel_startFileSharing_emailAddresses_phoneNumbers_accessType_permissionType_allowOthersToInvite_withReply_, v66, v67, v68, v93, v94, v60 & 1, v71);
    _Block_release(v71);
    swift_release();
    swift_unknownObjectRelease();

  }
  else
  {
    v72 = (uint64_t)v88;
    v73 = v97;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v61 + 56))(v88, 1, 1, v97);
    sub_1BD79103C();
    sub_1BD7875B4(MEMORY[0x1E0DEE9D8]);
    sub_1BD787F0C(&qword_1EF4FDF20, (uint64_t (*)(uint64_t))MEMORY[0x1E0CADE48], MEMORY[0x1E0CADE40]);
    v74 = v83;
    v75 = v86;
    sub_1BD79106C();
    v76 = (void *)sub_1BD791030();
    (*(void (**)(char *, uint64_t))(v85 + 8))(v74, v75);
    v77 = v87;
    sub_1BD7906BC(v72, v87, &qword_1EDBB6B70);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v61 + 48))(v77, 1, v73) == 1)
    {
      v78 = 0;
    }
    else
    {
      v78 = (void *)sub_1BD791084();
      v81((char *)v77, v97);
    }
    v79 = v82;
    v80 = (void *)sub_1BD791078();
    v79[2](v79, v78, 0, v80);

    sub_1BD787F8C(v72);
    swift_release();
  }
}

void sub_1BD789324(void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7, void (**a8)(const void *, void *, _QWORD, void *))
{
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
  id v22;
  NSObject *v23;
  os_log_type_t v24;
  _BOOL4 v25;
  uint8_t *v26;
  _QWORD *v27;
  id v28;
  NSObject *v29;
  NSObject *v30;
  os_log_type_t v31;
  _BOOL4 v32;
  uint8_t *v33;
  _QWORD *v34;
  NSObject *v35;
  NSObject *v36;
  os_log_type_t v37;
  uint8_t *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  unint64_t v43;
  NSObject *v44;
  os_log_type_t v45;
  uint8_t *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  unint64_t v51;
  NSObject *v52;
  os_log_type_t v53;
  uint8_t *v54;
  uint64_t v55;
  uint64_t v56;
  unint64_t v57;
  NSObject *v58;
  os_log_type_t v59;
  uint8_t *v60;
  uint64_t v61;
  uint64_t v62;
  unint64_t v63;
  NSObject *v64;
  os_log_type_t v65;
  _BOOL4 v66;
  char v67;
  uint8_t *v68;
  void *v69;
  void *v70;
  void *v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  uint64_t v81;
  void *v82;
  void *v83;
  uint64_t v84;
  _QWORD v85[2];
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  char *v89;
  void (**v90)(const void *, void *, _QWORD, void *);
  NSObject *v91;
  id v92;
  int v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t aBlock[7];

  v93 = a7;
  v95 = a5;
  v96 = a6;
  v97 = a3;
  v12 = sub_1BD791048();
  MEMORY[0x1E0C80A78](v12);
  v85[1] = (char *)v85 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_1BD791054();
  v86 = *(_QWORD *)(v14 - 8);
  v87 = v14;
  MEMORY[0x1E0C80A78](v14);
  v85[0] = (char *)v85 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDBB6B70);
  v17 = MEMORY[0x1E0C80A78](v16);
  v88 = (uint64_t)v85 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v17);
  v89 = (char *)v85 - v19;
  v94 = swift_allocObject();
  *(_QWORD *)(v94 + 16) = a8;
  v90 = a8;
  _Block_copy(a8);
  if (qword_1EDBB6B98 != -1)
    swift_once();
  v20 = sub_1BD7910F0();
  v21 = __swift_project_value_buffer(v20, (uint64_t)qword_1EDBB6BA0);
  v22 = a1;
  v99 = v21;
  v23 = sub_1BD7910D8();
  v24 = sub_1BD791198();
  v25 = os_log_type_enabled(v23, v24);
  v98 = a4;
  v92 = v22;
  if (v25)
  {
    v26 = (uint8_t *)swift_slowAlloc();
    v27 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v26 = 138412290;
    aBlock[0] = (uint64_t)v22;
    v28 = v22;
    sub_1BD7911A4();
    *v27 = v22;

    _os_log_impl(&dword_1BD77B000, v23, v24, "callForCloudKitAddToShare share: %@", v26, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EDBB6B90);
    swift_arrayDestroy();
    MEMORY[0x1C3B75908](v27, -1, -1);
    MEMORY[0x1C3B75908](v26, -1, -1);

  }
  else
  {

  }
  v29 = a2;
  v30 = sub_1BD7910D8();
  v31 = sub_1BD791198();
  v32 = os_log_type_enabled(v30, v31);
  v91 = v29;
  if (v32)
  {
    v33 = (uint8_t *)swift_slowAlloc();
    v34 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v33 = 138412290;
    aBlock[0] = (uint64_t)v29;
    v35 = v29;
    sub_1BD7911A4();
    *v34 = v29;

    _os_log_impl(&dword_1BD77B000, v30, v31, "callForCloudKitAddToShare containerSetupInfo: %@", v33, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EDBB6B90);
    swift_arrayDestroy();
    MEMORY[0x1C3B75908](v34, -1, -1);
    MEMORY[0x1C3B75908](v33, -1, -1);
  }
  else
  {

    v30 = v29;
  }

  swift_bridgeObjectRetain_n();
  v36 = sub_1BD7910D8();
  v37 = sub_1BD791174();
  if (os_log_type_enabled(v36, v37))
  {
    v38 = (uint8_t *)swift_slowAlloc();
    v39 = swift_slowAlloc();
    aBlock[0] = v39;
    *(_DWORD *)v38 = 136315138;
    v40 = swift_bridgeObjectRetain();
    v41 = MEMORY[0x1C3B754E8](v40, MEMORY[0x1E0DEA968]);
    v43 = v42;
    swift_bridgeObjectRelease();
    v100 = sub_1BD7878CC(v41, v43, aBlock);
    sub_1BD7911A4();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1BD77B000, v36, v37, "callForCloudKitAddToShare emailAddresses: %s", v38, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C3B75908](v39, -1, -1);
    MEMORY[0x1C3B75908](v38, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  swift_bridgeObjectRetain_n();
  v44 = sub_1BD7910D8();
  v45 = sub_1BD791174();
  if (os_log_type_enabled(v44, v45))
  {
    v46 = (uint8_t *)swift_slowAlloc();
    v47 = swift_slowAlloc();
    aBlock[0] = v47;
    *(_DWORD *)v46 = 136315138;
    v48 = swift_bridgeObjectRetain();
    v49 = MEMORY[0x1C3B754E8](v48, MEMORY[0x1E0DEA968]);
    v51 = v50;
    swift_bridgeObjectRelease();
    v100 = sub_1BD7878CC(v49, v51, aBlock);
    sub_1BD7911A4();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1BD77B000, v44, v45, "callForCloudKitAddToShare phoneNumbers: %s", v46, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C3B75908](v47, -1, -1);
    MEMORY[0x1C3B75908](v46, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  v52 = sub_1BD7910D8();
  v53 = sub_1BD791174();
  if (os_log_type_enabled(v52, v53))
  {
    v54 = (uint8_t *)swift_slowAlloc();
    v55 = swift_slowAlloc();
    *(_DWORD *)v54 = 136315138;
    v100 = v95;
    aBlock[0] = v55;
    type metadata accessor for ParticipantPermission(0);
    v56 = sub_1BD79112C();
    v100 = sub_1BD7878CC(v56, v57, aBlock);
    sub_1BD7911A4();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1BD77B000, v52, v53, "callForCloudKitAddToShare accessType: %s", v54, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C3B75908](v55, -1, -1);
    MEMORY[0x1C3B75908](v54, -1, -1);
  }

  v58 = sub_1BD7910D8();
  v59 = sub_1BD791174();
  if (os_log_type_enabled(v58, v59))
  {
    v60 = (uint8_t *)swift_slowAlloc();
    v61 = swift_slowAlloc();
    *(_DWORD *)v60 = 136315138;
    v100 = v96;
    aBlock[0] = v61;
    type metadata accessor for ParticipantPermission(0);
    v62 = sub_1BD79112C();
    v100 = sub_1BD7878CC(v62, v63, aBlock);
    sub_1BD7911A4();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1BD77B000, v58, v59, "callForCloudKitAddToShare permissionType: %s", v60, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C3B75908](v61, -1, -1);
    MEMORY[0x1C3B75908](v60, -1, -1);
  }

  v64 = sub_1BD7910D8();
  v65 = sub_1BD791174();
  v66 = os_log_type_enabled(v64, v65);
  v67 = v93;
  if (v66)
  {
    v68 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v68 = 67109120;
    LODWORD(aBlock[0]) = v67 & 1;
    sub_1BD7911A4();
    _os_log_impl(&dword_1BD77B000, v64, v65, "callForCloudKitAddToShare allowOthersToInvite: %{BOOL}d", v68, 8u);
    MEMORY[0x1C3B75908](v68, -1, -1);
  }

  if (qword_1EDBB6B78 != -1)
    swift_once();
  v69 = (void *)qword_1EDBB6BE8;
  if (qword_1EDBB6BE8)
  {
    swift_unknownObjectRetain();
    v70 = (void *)sub_1BD791150();
    v71 = (void *)sub_1BD791150();
    v72 = swift_allocObject();
    v73 = v94;
    *(_QWORD *)(v72 + 16) = sub_1BD7908EC;
    *(_QWORD *)(v72 + 24) = v73;
    aBlock[4] = (uint64_t)sub_1BD787FCC;
    aBlock[5] = v72;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_1BD77F364;
    aBlock[3] = (uint64_t)&block_descriptor_254;
    v74 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    LOBYTE(v84) = v67 & 1;
    objc_msgSend(v69, sel_addToCloudKitSharing_containerSetupInfo_emailAddresses_phoneNumbers_accessType_permissionType_allowOthersToInvite_withReply_, v92, v91, v70, v71, v95, v96, v84, v74);
    _Block_release(v74);
    swift_release();
    swift_unknownObjectRelease();

  }
  else
  {
    v75 = sub_1BD7910A8();
    v76 = *(_QWORD *)(v75 - 8);
    v77 = (uint64_t)v89;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v76 + 56))(v89, 1, 1, v75);
    sub_1BD79103C();
    sub_1BD7875B4(MEMORY[0x1E0DEE9D8]);
    sub_1BD787F0C(&qword_1EF4FDF20, (uint64_t (*)(uint64_t))MEMORY[0x1E0CADE48], MEMORY[0x1E0CADE40]);
    v78 = v85[0];
    v79 = v87;
    sub_1BD79106C();
    v80 = (void *)sub_1BD791030();
    (*(void (**)(uint64_t, uint64_t))(v86 + 8))(v78, v79);
    v81 = v88;
    sub_1BD7906BC(v77, v88, &qword_1EDBB6B70);
    v82 = 0;
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v76 + 48))(v81, 1, v75) != 1)
    {
      v82 = (void *)sub_1BD791084();
      (*(void (**)(uint64_t, uint64_t))(v76 + 8))(v81, v75);
    }
    v83 = (void *)sub_1BD791078();
    v90[2](v90, v82, 0, v83);

    sub_1BD787F8C(v77);
    swift_release();
  }
}

void sub_1BD789EC0(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7, const void *a8)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  os_log_type_t v22;
  _BOOL4 v23;
  uint8_t *v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  NSObject *v28;
  NSObject *v29;
  os_log_type_t v30;
  _BOOL4 v31;
  uint8_t *v32;
  _QWORD *v33;
  NSObject *v34;
  NSObject *v35;
  NSObject *v36;
  os_log_type_t v37;
  uint8_t *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  unint64_t v43;
  NSObject *v44;
  os_log_type_t v45;
  uint8_t *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  unint64_t v51;
  NSObject *v52;
  os_log_type_t v53;
  uint8_t *v54;
  uint64_t v55;
  uint64_t v56;
  unint64_t v57;
  NSObject *v58;
  os_log_type_t v59;
  uint8_t *v60;
  uint64_t v61;
  uint64_t v62;
  unint64_t v63;
  char v64;
  NSObject *v65;
  os_log_type_t v66;
  uint8_t *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  _QWORD v78[2];
  uint64_t v79;
  uint64_t v80;
  const void *v81;
  uint64_t v82;
  NSObject *v83;
  int v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t aBlock[7];

  v86 = a5;
  v87 = a6;
  v88 = a3;
  v89 = a4;
  v83 = a2;
  v11 = sub_1BD791048();
  MEMORY[0x1E0C80A78](v11);
  v78[1] = (char *)v78 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_1BD791054();
  v79 = *(_QWORD *)(v13 - 8);
  v80 = v13;
  MEMORY[0x1E0C80A78](v13);
  v78[0] = (char *)v78 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_1BD7910A8();
  v16 = *(_QWORD *)(v15 - 8);
  MEMORY[0x1E0C80A78](v15);
  v18 = (char *)v78 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v85 = swift_allocObject();
  *(_QWORD *)(v85 + 16) = a8;
  v81 = a8;
  _Block_copy(a8);
  if (qword_1EDBB6B98 != -1)
    swift_once();
  v19 = sub_1BD7910F0();
  v20 = __swift_project_value_buffer(v19, (uint64_t)qword_1EDBB6BA0);
  (*(void (**)(char *, uint64_t, uint64_t))(v16 + 16))(v18, a1, v15);
  v21 = sub_1BD7910D8();
  v22 = sub_1BD791198();
  v23 = os_log_type_enabled(v21, v22);
  v90 = v20;
  v84 = a7;
  v82 = a1;
  if (v23)
  {
    v24 = (uint8_t *)swift_slowAlloc();
    v25 = swift_slowAlloc();
    aBlock[0] = v25;
    *(_DWORD *)v24 = 136315138;
    sub_1BD787F0C(&qword_1EF4FDF28, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAFFF8], MEMORY[0x1E0CB0048]);
    v26 = sub_1BD791210();
    v91 = sub_1BD7878CC(v26, v27, aBlock);
    sub_1BD7911A4();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v16 + 8))(v18, v15);
    _os_log_impl(&dword_1BD77B000, v21, v22, "callForSharingURLAddToShare sharingURL: %s", v24, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C3B75908](v25, -1, -1);
    MEMORY[0x1C3B75908](v24, -1, -1);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v16 + 8))(v18, v15);
  }

  v28 = v83;
  v29 = sub_1BD7910D8();
  v30 = sub_1BD791198();
  v31 = os_log_type_enabled(v29, v30);
  v83 = v28;
  if (v31)
  {
    v32 = (uint8_t *)swift_slowAlloc();
    v33 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v32 = 138412290;
    aBlock[0] = (uint64_t)v28;
    v34 = v28;
    v35 = v28;
    sub_1BD7911A4();
    *v33 = v34;

    _os_log_impl(&dword_1BD77B000, v29, v30, "callForSharingURLAddToShare containerSetupInfo: %@", v32, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EDBB6B90);
    swift_arrayDestroy();
    MEMORY[0x1C3B75908](v33, -1, -1);
    MEMORY[0x1C3B75908](v32, -1, -1);
  }
  else
  {

    v29 = v28;
  }

  swift_bridgeObjectRetain_n();
  v36 = sub_1BD7910D8();
  v37 = sub_1BD791174();
  if (os_log_type_enabled(v36, v37))
  {
    v38 = (uint8_t *)swift_slowAlloc();
    v39 = swift_slowAlloc();
    aBlock[0] = v39;
    *(_DWORD *)v38 = 136315138;
    v40 = swift_bridgeObjectRetain();
    v41 = MEMORY[0x1C3B754E8](v40, MEMORY[0x1E0DEA968]);
    v43 = v42;
    swift_bridgeObjectRelease();
    v91 = sub_1BD7878CC(v41, v43, aBlock);
    sub_1BD7911A4();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1BD77B000, v36, v37, "callForSharingURLAddToShare emailAddresses: %s", v38, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C3B75908](v39, -1, -1);
    MEMORY[0x1C3B75908](v38, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  swift_bridgeObjectRetain_n();
  v44 = sub_1BD7910D8();
  v45 = sub_1BD791174();
  if (os_log_type_enabled(v44, v45))
  {
    v46 = (uint8_t *)swift_slowAlloc();
    v47 = swift_slowAlloc();
    aBlock[0] = v47;
    *(_DWORD *)v46 = 136315138;
    v48 = swift_bridgeObjectRetain();
    v49 = MEMORY[0x1C3B754E8](v48, MEMORY[0x1E0DEA968]);
    v51 = v50;
    swift_bridgeObjectRelease();
    v91 = sub_1BD7878CC(v49, v51, aBlock);
    sub_1BD7911A4();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1BD77B000, v44, v45, "callForSharingURLAddToShare phoneNumbers: %s", v46, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C3B75908](v47, -1, -1);
    MEMORY[0x1C3B75908](v46, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  v52 = sub_1BD7910D8();
  v53 = sub_1BD791174();
  if (os_log_type_enabled(v52, v53))
  {
    v54 = (uint8_t *)swift_slowAlloc();
    v55 = swift_slowAlloc();
    *(_DWORD *)v54 = 136315138;
    v91 = v86;
    aBlock[0] = v55;
    type metadata accessor for ParticipantPermission(0);
    v56 = sub_1BD79112C();
    v91 = sub_1BD7878CC(v56, v57, aBlock);
    sub_1BD7911A4();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1BD77B000, v52, v53, "callForSharingURLAddToShare accessType: %s", v54, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C3B75908](v55, -1, -1);
    MEMORY[0x1C3B75908](v54, -1, -1);
  }

  v58 = sub_1BD7910D8();
  v59 = sub_1BD791174();
  if (os_log_type_enabled(v58, v59))
  {
    v60 = (uint8_t *)swift_slowAlloc();
    v61 = swift_slowAlloc();
    *(_DWORD *)v60 = 136315138;
    v91 = v87;
    aBlock[0] = v61;
    type metadata accessor for ParticipantPermission(0);
    v62 = sub_1BD79112C();
    v91 = sub_1BD7878CC(v62, v63, aBlock);
    sub_1BD7911A4();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1BD77B000, v58, v59, "callForSharingURLAddToShare permissionType: %s", v60, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C3B75908](v61, -1, -1);
    MEMORY[0x1C3B75908](v60, -1, -1);
  }

  v64 = v84;
  v65 = sub_1BD7910D8();
  v66 = sub_1BD791174();
  if (os_log_type_enabled(v65, v66))
  {
    v67 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v67 = 67109120;
    LODWORD(aBlock[0]) = v64 & 1;
    sub_1BD7911A4();
    _os_log_impl(&dword_1BD77B000, v65, v66, "callForSharingURLAddToShare allowOthersToInvite: %{BOOL}d", v67, 8u);
    MEMORY[0x1C3B75908](v67, -1, -1);
  }

  if (qword_1EDBB6B78 != -1)
    swift_once();
  v68 = (void *)qword_1EDBB6BE8;
  if (qword_1EDBB6BE8)
  {
    swift_unknownObjectRetain();
    v69 = (void *)sub_1BD791084();
    v70 = (void *)sub_1BD791150();
    v71 = (void *)sub_1BD791150();
    v72 = swift_allocObject();
    v73 = v85;
    *(_QWORD *)(v72 + 16) = sub_1BD79063C;
    *(_QWORD *)(v72 + 24) = v73;
    aBlock[4] = (uint64_t)sub_1BD787FCC;
    aBlock[5] = v72;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_1BD780C50;
    aBlock[3] = (uint64_t)&block_descriptor_243;
    v74 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    LOBYTE(v77) = v64 & 1;
    objc_msgSend(v68, sel_addToShareFromSharingURL_containerSetupInfo_emailAddresses_phoneNumbers_accessType_permissionType_allowOthersToInvite_withReply_, v69, v83, v70, v71, v86, v87, v77, v74);
    _Block_release(v74);
    swift_release();
    swift_unknownObjectRelease();

  }
  else
  {
    sub_1BD79103C();
    sub_1BD7875B4(MEMORY[0x1E0DEE9D8]);
    sub_1BD787F0C(&qword_1EF4FDF20, (uint64_t (*)(uint64_t))MEMORY[0x1E0CADE48], MEMORY[0x1E0CADE40]);
    v75 = v78[0];
    v76 = v80;
    sub_1BD79106C();
    v70 = (void *)sub_1BD791030();
    (*(void (**)(uint64_t, uint64_t))(v79 + 8))(v75, v76);
    v71 = (void *)sub_1BD791078();
    (*((void (**)(const void *, _QWORD, _QWORD, void *))v81 + 2))(v81, 0, 0, v71);
    swift_release();
  }

}

void sub_1BD78A9F0(uint64_t a1, void *a2, void (**a3)(const void *, _QWORD, void *))
{
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
  NSObject *v16;
  os_log_type_t v17;
  _BOOL4 v18;
  uint64_t v19;
  uint8_t *v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint8_t *v24;
  id v25;
  NSObject *v26;
  NSObject *v27;
  os_log_type_t v28;
  uint8_t *v29;
  _QWORD *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  char *v36;
  uint64_t v37;
  void *v38;
  _QWORD v39[2];
  uint64_t v40;
  char *v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  void (**v45)(const void *, _QWORD, void *);
  uint64_t v46;
  id v47;
  uint64_t v48;
  uint64_t aBlock[7];

  v47 = a2;
  aBlock[6] = *MEMORY[0x1E0C80C00];
  v5 = sub_1BD791048();
  MEMORY[0x1E0C80A78](v5);
  v42 = (char *)v39 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_1BD791054();
  v43 = *(_QWORD *)(v7 - 8);
  v44 = v7;
  MEMORY[0x1E0C80A78](v7);
  v41 = (char *)v39 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_1BD7910A8();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v9);
  v12 = (char *)v39 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = a3;
  v45 = a3;
  _Block_copy(a3);
  if (qword_1EDBB6B98 != -1)
    swift_once();
  v14 = sub_1BD7910F0();
  v15 = __swift_project_value_buffer(v14, (uint64_t)qword_1EDBB6BA0);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, a1, v9);
  v16 = sub_1BD7910D8();
  v17 = sub_1BD791198();
  v18 = os_log_type_enabled(v16, v17);
  v46 = a1;
  if (v18)
  {
    v39[1] = v15;
    v19 = swift_slowAlloc();
    v40 = v13;
    v20 = (uint8_t *)v19;
    v21 = swift_slowAlloc();
    aBlock[0] = v21;
    *(_DWORD *)v20 = 136315138;
    v39[0] = v20 + 4;
    sub_1BD787F0C(&qword_1EF4FDF28, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAFFF8], MEMORY[0x1E0CB0048]);
    v22 = sub_1BD791210();
    v48 = sub_1BD7878CC(v22, v23, aBlock);
    sub_1BD7911A4();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
    _os_log_impl(&dword_1BD77B000, v16, v17, "callForSharingURLRemoveShare sharingURL: %s", v20, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C3B75908](v21, -1, -1);
    v24 = v20;
    v13 = v40;
    MEMORY[0x1C3B75908](v24, -1, -1);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  }

  v25 = v47;
  v26 = v47;
  v27 = sub_1BD7910D8();
  v28 = sub_1BD791198();
  if (os_log_type_enabled(v27, v28))
  {
    v29 = (uint8_t *)swift_slowAlloc();
    v30 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v29 = 138412290;
    if (v25)
    {
      aBlock[0] = (uint64_t)v26;
      v31 = v26;
    }
    else
    {
      aBlock[0] = 0;
    }
    sub_1BD7911A4();
    *v30 = v25;

    _os_log_impl(&dword_1BD77B000, v27, v28, "callForSharingURLRemoveShare containerSetupInfo: %@", v29, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EDBB6B90);
    swift_arrayDestroy();
    MEMORY[0x1C3B75908](v30, -1, -1);
    MEMORY[0x1C3B75908](v29, -1, -1);
  }
  else
  {

    v27 = v26;
  }

  if (qword_1EDBB6B78 != -1)
    swift_once();
  v32 = (void *)qword_1EDBB6BE8;
  if (qword_1EDBB6BE8)
  {
    swift_unknownObjectRetain();
    v33 = (void *)sub_1BD791084();
    v34 = swift_allocObject();
    *(_QWORD *)(v34 + 16) = sub_1BD790710;
    *(_QWORD *)(v34 + 24) = v13;
    aBlock[4] = (uint64_t)sub_1BD787FCC;
    aBlock[5] = v34;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_1BD7813DC;
    aBlock[3] = (uint64_t)&block_descriptor_233;
    v35 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    objc_msgSend(v32, sel_removeFromShareFromSharingURL_containerSetupInfo_withReply_, v33, v26, v35);
    _Block_release(v35);
    swift_release();
    swift_unknownObjectRelease();
  }
  else
  {
    sub_1BD79103C();
    sub_1BD7875B4(MEMORY[0x1E0DEE9D8]);
    sub_1BD787F0C(&qword_1EF4FDF20, (uint64_t (*)(uint64_t))MEMORY[0x1E0CADE48], MEMORY[0x1E0CADE40]);
    v36 = v41;
    v37 = v44;
    sub_1BD79106C();
    v38 = (void *)sub_1BD791030();
    (*(void (**)(char *, uint64_t))(v43 + 8))(v36, v37);
    v33 = (void *)sub_1BD791078();
    v45[2](v45, 0, v33);
    swift_release();

  }
}

void sub_1BD78AFA8(void *a1, void *a2, void (**a3)(const void *, _QWORD, void *))
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  uint64_t v16;
  _QWORD *v17;
  id v18;
  _QWORD *v19;
  NSObject *v20;
  NSObject *v21;
  os_log_type_t v22;
  uint8_t *v23;
  _QWORD *v24;
  NSObject *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  char *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  char *v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  void (**v39)(const void *, _QWORD, void *);
  uint64_t v40;
  _QWORD aBlock[7];

  aBlock[6] = *MEMORY[0x1E0C80C00];
  v6 = sub_1BD791048();
  MEMORY[0x1E0C80A78](v6);
  v36 = (char *)&v34 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_1BD791054();
  v37 = *(_QWORD *)(v8 - 8);
  v38 = v8;
  MEMORY[0x1E0C80A78](v8);
  v35 = (char *)&v34 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = swift_allocObject();
  v39 = a3;
  v40 = v10;
  *(_QWORD *)(v10 + 16) = a3;
  _Block_copy(a3);
  if (qword_1EDBB6B98 != -1)
    swift_once();
  v11 = sub_1BD7910F0();
  __swift_project_value_buffer(v11, (uint64_t)qword_1EDBB6BA0);
  v12 = a1;
  v13 = sub_1BD7910D8();
  v14 = sub_1BD791198();
  if (os_log_type_enabled(v13, v14))
  {
    v15 = (uint8_t *)swift_slowAlloc();
    v16 = swift_slowAlloc();
    v34 = a2;
    v17 = (_QWORD *)v16;
    *(_DWORD *)v15 = 138412290;
    aBlock[0] = v12;
    v18 = v12;
    sub_1BD7911A4();
    *v17 = v12;

    _os_log_impl(&dword_1BD77B000, v13, v14, "callForRemoveShare share: %@", v15, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EDBB6B90);
    swift_arrayDestroy();
    v19 = v17;
    a2 = v34;
    MEMORY[0x1C3B75908](v19, -1, -1);
    MEMORY[0x1C3B75908](v15, -1, -1);

  }
  else
  {

  }
  v20 = a2;
  v21 = sub_1BD7910D8();
  v22 = sub_1BD791198();
  if (os_log_type_enabled(v21, v22))
  {
    v23 = (uint8_t *)swift_slowAlloc();
    v24 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v23 = 138412290;
    if (a2)
    {
      aBlock[0] = v20;
      v25 = v20;
    }
    else
    {
      aBlock[0] = 0;
    }
    sub_1BD7911A4();
    *v24 = a2;

    _os_log_impl(&dword_1BD77B000, v21, v22, "callForRemoveShare containerSetupInfo: %@", v23, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EDBB6B90);
    swift_arrayDestroy();
    MEMORY[0x1C3B75908](v24, -1, -1);
    MEMORY[0x1C3B75908](v23, -1, -1);
  }
  else
  {

    v21 = v20;
  }

  if (qword_1EDBB6B78 != -1)
    swift_once();
  v26 = (void *)qword_1EDBB6BE8;
  if (qword_1EDBB6BE8)
  {
    v27 = swift_allocObject();
    v28 = v40;
    *(_QWORD *)(v27 + 16) = sub_1BD790710;
    *(_QWORD *)(v27 + 24) = v28;
    aBlock[4] = sub_1BD787FCC;
    aBlock[5] = v27;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1BD7813DC;
    aBlock[3] = &block_descriptor_222;
    v29 = _Block_copy(aBlock);
    swift_unknownObjectRetain();
    swift_retain();
    swift_release();
    objc_msgSend(v26, sel_removeFromShare_containerSetupInfo_withReply_, v12, v20, v29);
    _Block_release(v29);
    swift_release();
    swift_unknownObjectRelease();
  }
  else
  {
    sub_1BD79103C();
    sub_1BD7875B4(MEMORY[0x1E0DEE9D8]);
    sub_1BD787F0C(&qword_1EF4FDF20, (uint64_t (*)(uint64_t))MEMORY[0x1E0CADE48], MEMORY[0x1E0CADE40]);
    v30 = v35;
    v31 = v38;
    sub_1BD79106C();
    v32 = (void *)sub_1BD791030();
    (*(void (**)(char *, uint64_t))(v37 + 8))(v30, v31);
    v33 = (void *)sub_1BD791078();
    v39[2](v39, 0, v33);
    swift_release();

  }
}

void sub_1BD78B4D0(uint64_t a1, void (**a2)(_QWORD, _QWORD, _QWORD))
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  _BOOL4 v17;
  uint64_t v18;
  uint8_t *v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint8_t *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  char *v28;
  uint64_t v29;
  void *v30;
  char *v31;
  void (**v32)(_QWORD, _QWORD, _QWORD);
  uint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t aBlock[6];

  v4 = sub_1BD791048();
  MEMORY[0x1E0C80A78](v4);
  v6 = (char *)&v31 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_1BD791054();
  v35 = *(_QWORD *)(v7 - 8);
  v36 = v7;
  MEMORY[0x1E0C80A78](v7);
  v34 = (char *)&v31 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_1BD7910A8();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v9);
  v12 = (char *)&v31 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = a2;
  _Block_copy(a2);
  if (qword_1EDBB6B98 != -1)
    swift_once();
  v14 = sub_1BD7910F0();
  __swift_project_value_buffer(v14, (uint64_t)qword_1EDBB6BA0);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, a1, v9);
  v15 = sub_1BD7910D8();
  v16 = sub_1BD791198();
  v17 = os_log_type_enabled(v15, v16);
  v37 = a1;
  if (v17)
  {
    v18 = swift_slowAlloc();
    v33 = v13;
    v19 = (uint8_t *)v18;
    v20 = swift_slowAlloc();
    aBlock[0] = v20;
    v31 = v6;
    v32 = a2;
    *(_DWORD *)v19 = 136315138;
    sub_1BD787F0C(&qword_1EF4FDF28, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAFFF8], MEMORY[0x1E0CB0048]);
    v21 = sub_1BD791210();
    v38 = sub_1BD7878CC(v21, v22, aBlock);
    a2 = v32;
    sub_1BD7911A4();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
    _os_log_impl(&dword_1BD77B000, v15, v16, "callForFileURLRemoveShare url: %s", v19, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C3B75908](v20, -1, -1);
    v23 = v19;
    v13 = v33;
    MEMORY[0x1C3B75908](v23, -1, -1);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  }

  if (qword_1EDBB6B78 != -1)
    swift_once();
  v24 = (void *)qword_1EDBB6BE8;
  if (qword_1EDBB6BE8)
  {
    swift_unknownObjectRetain();
    v25 = (void *)sub_1BD791084();
    v26 = swift_allocObject();
    *(_QWORD *)(v26 + 16) = sub_1BD790634;
    *(_QWORD *)(v26 + 24) = v13;
    aBlock[4] = (uint64_t)sub_1BD787FCC;
    aBlock[5] = v26;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_1BD7813DC;
    aBlock[3] = (uint64_t)&block_descriptor_211;
    v27 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    objc_msgSend(v24, sel_removeFromShareForFileURL_withReply_, v25, v27);
    _Block_release(v27);
    swift_release();
    swift_unknownObjectRelease();
  }
  else
  {
    sub_1BD79103C();
    sub_1BD7875B4(MEMORY[0x1E0DEE9D8]);
    sub_1BD787F0C(&qword_1EF4FDF20, (uint64_t (*)(uint64_t))MEMORY[0x1E0CADE48], MEMORY[0x1E0CADE40]);
    v28 = v34;
    v29 = v36;
    sub_1BD79106C();
    v30 = (void *)sub_1BD791030();
    (*(void (**)(char *, uint64_t))(v35 + 8))(v28, v29);
    v25 = (void *)sub_1BD791078();
    ((void (**)(_QWORD, _QWORD, void *))a2)[2](a2, 0, v25);
    swift_release();

  }
}

void sub_1BD78B924(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, unint64_t a5, uint64_t a6, unint64_t a7, const void *a8)
{
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
  char *v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(char *, uint64_t, uint64_t);
  NSObject *v27;
  os_log_type_t v28;
  _BOOL4 v29;
  uint8_t *v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  NSObject *v34;
  NSObject *v35;
  os_log_type_t v36;
  uint8_t *v37;
  _QWORD *v38;
  NSObject *v39;
  uint64_t v40;
  uint64_t v41;
  NSObject *v42;
  os_log_type_t v43;
  _BOOL4 v44;
  uint8_t *v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  unint64_t v49;
  unint64_t v50;
  NSObject *v51;
  os_log_type_t v52;
  uint8_t *v53;
  uint64_t v54;
  NSObject *v55;
  os_log_type_t v56;
  uint8_t *v57;
  uint64_t v58;
  uint64_t v59;
  unint64_t v60;
  unint64_t v61;
  void *v62;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  char *v67;
  uint64_t v68;
  void *v69;
  void *v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  uint64_t v74;
  void (*v75)(char *, uint64_t);
  char *v76;
  char *v77;
  uint64_t v78;
  uint64_t v79;
  const void *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  NSObject *v87;
  char *v88;
  uint64_t v89;
  unint64_t v90;
  uint64_t v91;
  uint64_t v92;
  unint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t aBlock[7];

  v92 = a4;
  v93 = a5;
  v94 = a3;
  v87 = a2;
  v12 = sub_1BD791048();
  MEMORY[0x1E0C80A78](v12);
  v77 = (char *)&v74 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v79 = sub_1BD791054();
  v78 = *(_QWORD *)(v79 - 8);
  MEMORY[0x1E0C80A78](v79);
  v76 = (char *)&v74 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v82 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDBB6B70);
  v15 = MEMORY[0x1E0C80A78](v82);
  v85 = (uint64_t)&v74 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = MEMORY[0x1E0C80A78](v15);
  v81 = (uint64_t)&v74 - v18;
  MEMORY[0x1E0C80A78](v17);
  v88 = (char *)&v74 - v19;
  v20 = sub_1BD7910A8();
  v21 = *(_QWORD *)(v20 - 8);
  MEMORY[0x1E0C80A78](v20);
  v23 = (char *)&v74 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v91 = swift_allocObject();
  *(_QWORD *)(v91 + 16) = a8;
  v80 = a8;
  _Block_copy(a8);
  if (qword_1EDBB6B98 != -1)
    swift_once();
  v24 = sub_1BD7910F0();
  v25 = __swift_project_value_buffer(v24, (uint64_t)qword_1EDBB6BA0);
  v26 = *(void (**)(char *, uint64_t, uint64_t))(v21 + 16);
  v86 = a1;
  v26(v23, a1, v20);
  v95 = v25;
  v27 = sub_1BD7910D8();
  v28 = sub_1BD791198();
  v29 = os_log_type_enabled(v27, v28);
  v89 = a6;
  v90 = a7;
  v83 = v21;
  v84 = v20;
  if (v29)
  {
    v30 = (uint8_t *)swift_slowAlloc();
    v31 = swift_slowAlloc();
    aBlock[0] = v31;
    *(_DWORD *)v30 = 136315138;
    sub_1BD787F0C(&qword_1EF4FDF28, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAFFF8], MEMORY[0x1E0CB0048]);
    v32 = sub_1BD791210();
    v96 = sub_1BD7878CC(v32, v33, aBlock);
    sub_1BD7911A4();
    swift_bridgeObjectRelease();
    v75 = *(void (**)(char *, uint64_t))(v21 + 8);
    v75(v23, v20);
    _os_log_impl(&dword_1BD77B000, v27, v28, "callForMailContent sharingURL: %s", v30, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C3B75908](v31, -1, -1);
    MEMORY[0x1C3B75908](v30, -1, -1);
  }
  else
  {
    v75 = *(void (**)(char *, uint64_t))(v21 + 8);
    v75(v23, v20);
  }

  v34 = v87;
  v35 = sub_1BD7910D8();
  v36 = sub_1BD791198();
  if (os_log_type_enabled(v35, v36))
  {
    v37 = (uint8_t *)swift_slowAlloc();
    v38 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v37 = 138412290;
    aBlock[0] = (uint64_t)v34;
    v39 = v34;
    sub_1BD7911A4();
    *v38 = v34;

    _os_log_impl(&dword_1BD77B000, v35, v36, "callForMailContent share: %@", v37, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EDBB6B90);
    swift_arrayDestroy();
    MEMORY[0x1C3B75908](v38, -1, -1);
    MEMORY[0x1C3B75908](v37, -1, -1);
  }
  else
  {

    v35 = v34;
  }
  v40 = (uint64_t)v88;
  v41 = v89;

  sub_1BD7906BC(v94, v40, &qword_1EDBB6B70);
  v42 = sub_1BD7910D8();
  v43 = sub_1BD791198();
  v44 = os_log_type_enabled(v42, v43);
  v87 = v34;
  if (v44)
  {
    v45 = (uint8_t *)swift_slowAlloc();
    v46 = swift_slowAlloc();
    aBlock[0] = v46;
    *(_DWORD *)v45 = 136315138;
    sub_1BD7906BC(v40, v81, &qword_1EDBB6B70);
    v47 = sub_1BD79112C();
    v96 = sub_1BD7878CC(v47, v48, aBlock);
    sub_1BD7911A4();
    swift_bridgeObjectRelease();
    sub_1BD787F8C(v40);
    _os_log_impl(&dword_1BD77B000, v42, v43, "callForMailContent fileURL: %s", v45, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C3B75908](v46, -1, -1);
    MEMORY[0x1C3B75908](v45, -1, -1);
  }
  else
  {
    sub_1BD787F8C(v40);
  }

  v49 = v90;
  v50 = v93;
  swift_bridgeObjectRetain_n();
  v51 = sub_1BD7910D8();
  v52 = sub_1BD791174();
  if (os_log_type_enabled(v51, v52))
  {
    v53 = (uint8_t *)swift_slowAlloc();
    v54 = swift_slowAlloc();
    aBlock[0] = v54;
    *(_DWORD *)v53 = 136315138;
    swift_bridgeObjectRetain();
    v96 = sub_1BD7878CC(v92, v50, aBlock);
    sub_1BD7911A4();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1BD77B000, v51, v52, "callForMailContent appName: %s", v53, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C3B75908](v54, -1, -1);
    MEMORY[0x1C3B75908](v53, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  sub_1BD788004(v41, v49);
  sub_1BD788004(v41, v49);
  v55 = sub_1BD7910D8();
  v56 = sub_1BD791180();
  if (os_log_type_enabled(v55, v56))
  {
    v57 = (uint8_t *)swift_slowAlloc();
    v58 = swift_slowAlloc();
    aBlock[0] = v58;
    *(_DWORD *)v57 = 136315138;
    sub_1BD788004(v41, v49);
    v59 = sub_1BD7910B4();
    v61 = v60;
    sub_1BD788048(v41, v49);
    v96 = sub_1BD7878CC(v59, v61, aBlock);
    sub_1BD7911A4();
    swift_bridgeObjectRelease();
    sub_1BD788048(v41, v49);
    sub_1BD788048(v41, v49);
    _os_log_impl(&dword_1BD77B000, v55, v56, "callForMailContent appIconData: %s", v57, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C3B75908](v58, -1, -1);
    MEMORY[0x1C3B75908](v57, -1, -1);
  }
  else
  {
    sub_1BD788048(v41, v49);
    sub_1BD788048(v41, v49);
  }

  if (qword_1EDBB6B78 != -1)
    swift_once();
  v62 = (void *)qword_1EDBB6BE8;
  if (qword_1EDBB6BE8)
  {
    swift_unknownObjectRetain();
    v63 = (void *)sub_1BD791084();
    v64 = v85;
    sub_1BD7906BC(v94, v85, &qword_1EDBB6B70);
    v65 = v84;
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v83 + 48))(v64, 1, v84) == 1)
    {
      v66 = 0;
    }
    else
    {
      v66 = (void *)sub_1BD791084();
      v75((char *)v64, v65);
    }
    v69 = (void *)sub_1BD7910FC();
    v70 = (void *)sub_1BD7910C0();
    v71 = swift_allocObject();
    v72 = v91;
    *(_QWORD *)(v71 + 16) = sub_1BD79062C;
    *(_QWORD *)(v71 + 24) = v72;
    aBlock[4] = (uint64_t)sub_1BD787FCC;
    aBlock[5] = v71;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_1BD782870;
    aBlock[3] = (uint64_t)&block_descriptor_201;
    v73 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    objc_msgSend(v62, sel_mailContentFromSharingURL_share_fileURL_appName_appIconData_withReply_, v63, v87, v66, v69, v70, v73);
    _Block_release(v73);
    swift_release();
    swift_unknownObjectRelease();

  }
  else
  {
    sub_1BD79103C();
    sub_1BD7875B4(MEMORY[0x1E0DEE9D8]);
    sub_1BD787F0C(&qword_1EF4FDF20, (uint64_t (*)(uint64_t))MEMORY[0x1E0CADE48], MEMORY[0x1E0CADE40]);
    v67 = v76;
    v68 = v79;
    sub_1BD79106C();
    v69 = (void *)sub_1BD791030();
    (*(void (**)(char *, uint64_t))(v78 + 8))(v67, v68);
    v70 = (void *)sub_1BD791078();
    (*((void (**)(const void *, _QWORD, _QWORD, void *))v80 + 2))(v80, 0, 0, v70);
    swift_release();
  }

}

void sub_1BD78C3EC(uint64_t a1, void *a2, void (**a3)(const void *, _QWORD, void *))
{
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
  NSObject *v16;
  os_log_type_t v17;
  _BOOL4 v18;
  uint64_t v19;
  uint8_t *v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint8_t *v24;
  id v25;
  NSObject *v26;
  NSObject *v27;
  os_log_type_t v28;
  uint8_t *v29;
  _QWORD *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  char *v36;
  uint64_t v37;
  void *v38;
  _QWORD v39[2];
  uint64_t v40;
  char *v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  void (**v45)(const void *, _QWORD, void *);
  uint64_t v46;
  id v47;
  uint64_t v48;
  uint64_t aBlock[7];

  v47 = a2;
  aBlock[6] = *MEMORY[0x1E0C80C00];
  v5 = sub_1BD791048();
  MEMORY[0x1E0C80A78](v5);
  v42 = (char *)v39 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_1BD791054();
  v43 = *(_QWORD *)(v7 - 8);
  v44 = v7;
  MEMORY[0x1E0C80A78](v7);
  v41 = (char *)v39 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_1BD7910A8();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v9);
  v12 = (char *)v39 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = a3;
  v45 = a3;
  _Block_copy(a3);
  if (qword_1EDBB6B98 != -1)
    swift_once();
  v14 = sub_1BD7910F0();
  v15 = __swift_project_value_buffer(v14, (uint64_t)qword_1EDBB6BA0);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, a1, v9);
  v16 = sub_1BD7910D8();
  v17 = sub_1BD791198();
  v18 = os_log_type_enabled(v16, v17);
  v46 = a1;
  if (v18)
  {
    v39[1] = v15;
    v19 = swift_slowAlloc();
    v40 = v13;
    v20 = (uint8_t *)v19;
    v21 = swift_slowAlloc();
    aBlock[0] = v21;
    *(_DWORD *)v20 = 136315138;
    v39[0] = v20 + 4;
    sub_1BD787F0C(&qword_1EF4FDF28, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAFFF8], MEMORY[0x1E0CB0048]);
    v22 = sub_1BD791210();
    v48 = sub_1BD7878CC(v22, v23, aBlock);
    sub_1BD7911A4();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
    _os_log_impl(&dword_1BD77B000, v16, v17, "callForMetadataFromShareURL sharingURL: %s", v20, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C3B75908](v21, -1, -1);
    v24 = v20;
    v13 = v40;
    MEMORY[0x1C3B75908](v24, -1, -1);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  }

  v25 = v47;
  v26 = v47;
  v27 = sub_1BD7910D8();
  v28 = sub_1BD791198();
  if (os_log_type_enabled(v27, v28))
  {
    v29 = (uint8_t *)swift_slowAlloc();
    v30 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v29 = 138412290;
    if (v25)
    {
      aBlock[0] = (uint64_t)v26;
      v31 = v26;
    }
    else
    {
      aBlock[0] = 0;
    }
    sub_1BD7911A4();
    *v30 = v25;

    _os_log_impl(&dword_1BD77B000, v27, v28, "callForMetadataFromShareURL containerSetupInfo: %@", v29, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EDBB6B90);
    swift_arrayDestroy();
    MEMORY[0x1C3B75908](v30, -1, -1);
    MEMORY[0x1C3B75908](v29, -1, -1);
  }
  else
  {

    v27 = v26;
  }

  if (qword_1EDBB6B78 != -1)
    swift_once();
  v32 = (void *)qword_1EDBB6BE8;
  if (qword_1EDBB6BE8)
  {
    swift_unknownObjectRetain();
    v33 = (void *)sub_1BD791084();
    v34 = swift_allocObject();
    *(_QWORD *)(v34 + 16) = sub_1BD790624;
    *(_QWORD *)(v34 + 24) = v13;
    aBlock[4] = (uint64_t)sub_1BD787FCC;
    aBlock[5] = v34;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_1BD783100;
    aBlock[3] = (uint64_t)&block_descriptor_191;
    v35 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    objc_msgSend(v32, sel_getMetadataFromShareFromSharingURL_containerSetupInfo_withReply_, v33, v26, v35);
    _Block_release(v35);
    swift_release();
    swift_unknownObjectRelease();
  }
  else
  {
    sub_1BD79103C();
    sub_1BD7875B4(MEMORY[0x1E0DEE9D8]);
    sub_1BD787F0C(&qword_1EF4FDF20, (uint64_t (*)(uint64_t))MEMORY[0x1E0CADE48], MEMORY[0x1E0CADE40]);
    v36 = v41;
    v37 = v44;
    sub_1BD79106C();
    v38 = (void *)sub_1BD791030();
    (*(void (**)(char *, uint64_t))(v43 + 8))(v36, v37);
    v33 = (void *)sub_1BD791078();
    v45[2](v45, 0, v33);
    swift_release();

  }
}

uint64_t sub_1BD78C9A4(void *a1, void *a2, void (**a3)(const void *, void *, _QWORD, void *))
{
  uint64_t v6;
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
  id v18;
  NSObject *v19;
  os_log_type_t v20;
  _BOOL4 v21;
  uint64_t v22;
  uint8_t *v23;
  uint64_t v24;
  _QWORD *v25;
  uint64_t v26;
  id v27;
  _QWORD *v28;
  NSObject *v29;
  NSObject *v30;
  os_log_type_t v31;
  uint8_t *v32;
  _QWORD *v33;
  NSObject *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  uint64_t v48;
  id v49;
  void (**v50)(const void *, void *, _QWORD, void *);
  char *v51;
  char *v52;
  uint64_t v53;
  uint64_t v54;
  char *v55;
  char *v56;
  _QWORD aBlock[7];

  aBlock[6] = *MEMORY[0x1E0C80C00];
  v6 = sub_1BD791048();
  MEMORY[0x1E0C80A78](v6);
  v52 = (char *)&v48 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_1BD791054();
  v53 = *(_QWORD *)(v8 - 8);
  v54 = v8;
  MEMORY[0x1E0C80A78](v8);
  v51 = (char *)&v48 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDBB6B70);
  v11 = MEMORY[0x1E0C80A78](v10);
  v13 = (char *)&v48 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v11);
  v56 = (char *)&v48 - v14;
  v15 = swift_allocObject();
  *(_QWORD *)(v15 + 16) = a3;
  v50 = a3;
  _Block_copy(a3);
  if (qword_1EDBB6B98 != -1)
    swift_once();
  v16 = sub_1BD7910F0();
  v17 = __swift_project_value_buffer(v16, (uint64_t)qword_1EDBB6BA0);
  v18 = a1;
  v19 = sub_1BD7910D8();
  v20 = sub_1BD791198();
  v21 = os_log_type_enabled(v19, v20);
  v55 = v13;
  if (v21)
  {
    v22 = swift_slowAlloc();
    v48 = v17;
    v23 = (uint8_t *)v22;
    v24 = swift_slowAlloc();
    v49 = a2;
    v25 = (_QWORD *)v24;
    *(_DWORD *)v23 = 138412290;
    aBlock[0] = v18;
    v26 = v15;
    v27 = v18;
    sub_1BD7911A4();
    *v25 = v18;

    v15 = v26;
    _os_log_impl(&dword_1BD77B000, v19, v20, "callForUpdateShare share: %@", v23, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EDBB6B90);
    swift_arrayDestroy();
    v28 = v25;
    a2 = v49;
    MEMORY[0x1C3B75908](v28, -1, -1);
    MEMORY[0x1C3B75908](v23, -1, -1);

  }
  else
  {

  }
  v29 = a2;
  v30 = sub_1BD7910D8();
  v31 = sub_1BD791198();
  if (os_log_type_enabled(v30, v31))
  {
    v49 = v18;
    v32 = (uint8_t *)swift_slowAlloc();
    v33 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v32 = 138412290;
    if (a2)
    {
      aBlock[0] = v29;
      v34 = v29;
    }
    else
    {
      aBlock[0] = 0;
    }
    sub_1BD7911A4();
    *v33 = a2;

    _os_log_impl(&dword_1BD77B000, v30, v31, "callForUpdateShare containerSetupInfo: %@", v32, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EDBB6B90);
    swift_arrayDestroy();
    MEMORY[0x1C3B75908](v33, -1, -1);
    MEMORY[0x1C3B75908](v32, -1, -1);
    v18 = v49;
  }
  else
  {

    v30 = v29;
  }

  if (qword_1EDBB6B78 != -1)
    swift_once();
  v35 = (void *)qword_1EDBB6BE8;
  if (qword_1EDBB6BE8)
  {
    v36 = swift_allocObject();
    *(_QWORD *)(v36 + 16) = sub_1BD7908EC;
    *(_QWORD *)(v36 + 24) = v15;
    aBlock[4] = sub_1BD787FCC;
    aBlock[5] = v36;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1BD77F364;
    aBlock[3] = &block_descriptor_181;
    v37 = _Block_copy(aBlock);
    swift_unknownObjectRetain();
    swift_retain();
    swift_release();
    objc_msgSend(v35, sel_updateShare_containerSetupInfo_withReply_, v18, v29, v37);
    _Block_release(v37);
    swift_release();
    return swift_unknownObjectRelease();
  }
  else
  {
    v39 = sub_1BD7910A8();
    v40 = *(_QWORD *)(v39 - 8);
    v41 = (uint64_t)v56;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v40 + 56))(v56, 1, 1, v39);
    sub_1BD79103C();
    sub_1BD7875B4(MEMORY[0x1E0DEE9D8]);
    sub_1BD787F0C(&qword_1EF4FDF20, (uint64_t (*)(uint64_t))MEMORY[0x1E0CADE48], MEMORY[0x1E0CADE40]);
    v42 = v51;
    v43 = v54;
    sub_1BD79106C();
    v44 = (void *)sub_1BD791030();
    (*(void (**)(char *, uint64_t))(v53 + 8))(v42, v43);
    v45 = (uint64_t)v55;
    sub_1BD7906BC(v41, (uint64_t)v55, &qword_1EDBB6B70);
    v46 = 0;
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v40 + 48))(v45, 1, v39) != 1)
    {
      v46 = (void *)sub_1BD791084();
      (*(void (**)(uint64_t, uint64_t))(v40 + 8))(v45, v39);
    }
    v47 = (void *)sub_1BD791078();
    v50[2](v50, v46, 0, v47);

    sub_1BD787F8C(v41);
    return swift_release();
  }
}

void sub_1BD78CFD0(void *a1, void (**a2)(_QWORD, _QWORD, _QWORD))
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  NSObject *v12;
  os_log_type_t v13;
  uint64_t v14;
  uint8_t *v15;
  id v16;
  _QWORD *v17;
  uint8_t *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  _QWORD *v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD aBlock[6];

  v4 = sub_1BD791048();
  MEMORY[0x1E0C80A78](v4);
  v5 = sub_1BD791054();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = a2;
  _Block_copy(a2);
  if (qword_1EDBB6B98 != -1)
    swift_once();
  v10 = sub_1BD7910F0();
  __swift_project_value_buffer(v10, (uint64_t)qword_1EDBB6BA0);
  v11 = a1;
  v12 = sub_1BD7910D8();
  v13 = sub_1BD791198();
  if (os_log_type_enabled(v12, v13))
  {
    v29 = v5;
    v14 = swift_slowAlloc();
    v28 = v6;
    v15 = (uint8_t *)v14;
    v25 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v15 = 138412290;
    v26 = v9;
    v27 = v8;
    aBlock[0] = v11;
    v16 = v11;
    v9 = v26;
    v8 = v27;
    sub_1BD7911A4();
    v17 = v25;
    *v25 = v11;

    v5 = v29;
    _os_log_impl(&dword_1BD77B000, v12, v13, "callForCurrentUserSharingStatus share: %@", v15, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EDBB6B90);
    swift_arrayDestroy();
    MEMORY[0x1C3B75908](v17, -1, -1);
    v18 = v15;
    v6 = v28;
    MEMORY[0x1C3B75908](v18, -1, -1);

  }
  else
  {

  }
  if (qword_1EDBB6B78 != -1)
    swift_once();
  v19 = (void *)qword_1EDBB6BE8;
  if (qword_1EDBB6BE8)
  {
    v20 = swift_allocObject();
    *(_QWORD *)(v20 + 16) = sub_1BD790714;
    *(_QWORD *)(v20 + 24) = v9;
    aBlock[4] = sub_1BD787FCC;
    aBlock[5] = v20;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1BD77E930;
    aBlock[3] = &block_descriptor_170;
    v21 = _Block_copy(aBlock);
    swift_unknownObjectRetain();
    swift_retain();
    swift_release();
    objc_msgSend(v19, sel_currentUserSharingStatusFor_withReply_, v11, v21);
    _Block_release(v21);
    swift_release();
    swift_unknownObjectRelease();
  }
  else
  {
    sub_1BD79103C();
    sub_1BD7875B4(MEMORY[0x1E0DEE9D8]);
    sub_1BD787F0C(&qword_1EF4FDF20, (uint64_t (*)(uint64_t))MEMORY[0x1E0CADE48], MEMORY[0x1E0CADE40]);
    sub_1BD79106C();
    v22 = (void *)sub_1BD791030();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    v23 = (void *)sub_1BD791078();
    ((void (**)(_QWORD, _QWORD, void *))a2)[2](a2, 0, v23);
    swift_release();

  }
}

void sub_1BD78D3A8(void *a1, void *a2, uint64_t a3, uint64_t a4, void (**a5)(const void *, void *, _QWORD, void *))
{
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
  id v20;
  NSObject *v21;
  os_log_type_t v22;
  _BOOL4 v23;
  uint8_t *v24;
  _QWORD *v25;
  void *v26;
  id v27;
  NSObject *v28;
  NSObject *v29;
  os_log_type_t v30;
  uint8_t *v31;
  _QWORD *v32;
  NSObject *v33;
  NSObject *v34;
  os_log_type_t v35;
  uint8_t *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  unint64_t v41;
  NSObject *v42;
  os_log_type_t v43;
  uint8_t *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  unint64_t v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  uint64_t v62;
  void *v63;
  void *v64;
  _QWORD v65[2];
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  void (**v69)(const void *, void *, _QWORD, void *);
  id v70;
  uint64_t v71;
  char *v72;
  uint64_t v73;
  NSObject *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t aBlock[7];

  v10 = sub_1BD791048();
  MEMORY[0x1E0C80A78](v10);
  v65[1] = (char *)v65 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_1BD791054();
  v66 = *(_QWORD *)(v12 - 8);
  v67 = v12;
  MEMORY[0x1E0C80A78](v12);
  v65[0] = (char *)v65 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDBB6B70);
  v15 = MEMORY[0x1E0C80A78](v14);
  v68 = (uint64_t)v65 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v15);
  v72 = (char *)v65 - v17;
  v73 = swift_allocObject();
  *(_QWORD *)(v73 + 16) = a5;
  v69 = a5;
  _Block_copy(a5);
  if (qword_1EDBB6B98 != -1)
    swift_once();
  v18 = sub_1BD7910F0();
  v19 = __swift_project_value_buffer(v18, (uint64_t)qword_1EDBB6BA0);
  v20 = a1;
  v21 = sub_1BD7910D8();
  v22 = sub_1BD791198();
  v23 = os_log_type_enabled(v21, v22);
  v74 = v19;
  v75 = a3;
  v70 = v20;
  v71 = a4;
  if (v23)
  {
    v24 = (uint8_t *)swift_slowAlloc();
    v25 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v24 = 138412290;
    aBlock[0] = (uint64_t)v20;
    v26 = a2;
    v27 = v20;
    sub_1BD7911A4();
    *v25 = v20;

    a2 = v26;
    _os_log_impl(&dword_1BD77B000, v21, v22, "callForAddParticipantsToShare share: %@", v24, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EDBB6B90);
    swift_arrayDestroy();
    MEMORY[0x1C3B75908](v25, -1, -1);
    MEMORY[0x1C3B75908](v24, -1, -1);

  }
  else
  {

  }
  v28 = a2;
  v29 = sub_1BD7910D8();
  v30 = sub_1BD791198();
  if (os_log_type_enabled(v29, v30))
  {
    v31 = (uint8_t *)swift_slowAlloc();
    v32 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v31 = 138412290;
    aBlock[0] = (uint64_t)v28;
    v33 = v28;
    sub_1BD7911A4();
    *v32 = v28;

    _os_log_impl(&dword_1BD77B000, v29, v30, "callForAddParticipantsToShare containerSetupInfo: %@", v31, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EDBB6B90);
    swift_arrayDestroy();
    MEMORY[0x1C3B75908](v32, -1, -1);
    MEMORY[0x1C3B75908](v31, -1, -1);
  }
  else
  {

    v29 = v28;
  }

  swift_bridgeObjectRetain_n();
  v34 = sub_1BD7910D8();
  v35 = sub_1BD791174();
  if (os_log_type_enabled(v34, v35))
  {
    v36 = (uint8_t *)swift_slowAlloc();
    v37 = swift_slowAlloc();
    aBlock[0] = v37;
    *(_DWORD *)v36 = 136315138;
    v38 = swift_bridgeObjectRetain();
    v39 = MEMORY[0x1C3B754E8](v38, MEMORY[0x1E0DEA968]);
    v41 = v40;
    swift_bridgeObjectRelease();
    v76 = sub_1BD7878CC(v39, v41, aBlock);
    sub_1BD7911A4();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1BD77B000, v34, v35, "callForAddParticipantsToShare emailAddresses: %s", v36, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C3B75908](v37, -1, -1);
    MEMORY[0x1C3B75908](v36, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  swift_bridgeObjectRetain_n();
  v42 = sub_1BD7910D8();
  v43 = sub_1BD791174();
  if (os_log_type_enabled(v42, v43))
  {
    v44 = (uint8_t *)swift_slowAlloc();
    v45 = swift_slowAlloc();
    aBlock[0] = v45;
    v74 = v28;
    *(_DWORD *)v44 = 136315138;
    v46 = swift_bridgeObjectRetain();
    v47 = MEMORY[0x1C3B754E8](v46, MEMORY[0x1E0DEA968]);
    v49 = v48;
    swift_bridgeObjectRelease();
    v76 = sub_1BD7878CC(v47, v49, aBlock);
    sub_1BD7911A4();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1BD77B000, v42, v43, "callForAddParticipantsToShare phoneNumbers: %s", v44, 0xCu);
    v28 = v74;
    swift_arrayDestroy();
    MEMORY[0x1C3B75908](v45, -1, -1);
    MEMORY[0x1C3B75908](v44, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  v50 = (uint64_t)v72;
  if (qword_1EDBB6B78 != -1)
    swift_once();
  v51 = (void *)qword_1EDBB6BE8;
  if (qword_1EDBB6BE8)
  {
    swift_unknownObjectRetain();
    v52 = (void *)sub_1BD791150();
    v53 = (void *)sub_1BD791150();
    v54 = swift_allocObject();
    v55 = v73;
    *(_QWORD *)(v54 + 16) = sub_1BD7908EC;
    *(_QWORD *)(v54 + 24) = v55;
    aBlock[4] = (uint64_t)sub_1BD787FCC;
    aBlock[5] = v54;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_1BD77F364;
    aBlock[3] = (uint64_t)&block_descriptor_160;
    v56 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    objc_msgSend(v51, sel_addParticipantsToShare_containerSetupInfo_emailAddresses_phoneNumbers_withReply_, v70, v28, v52, v53, v56);
    _Block_release(v56);
    swift_release();
    swift_unknownObjectRelease();

  }
  else
  {
    v57 = sub_1BD7910A8();
    v58 = *(_QWORD *)(v57 - 8);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v58 + 56))(v50, 1, 1, v57);
    sub_1BD79103C();
    sub_1BD7875B4(MEMORY[0x1E0DEE9D8]);
    sub_1BD787F0C(&qword_1EF4FDF20, (uint64_t (*)(uint64_t))MEMORY[0x1E0CADE48], MEMORY[0x1E0CADE40]);
    v59 = v65[0];
    v60 = v67;
    sub_1BD79106C();
    v61 = (void *)sub_1BD791030();
    (*(void (**)(uint64_t, uint64_t))(v66 + 8))(v59, v60);
    v62 = v68;
    sub_1BD7906BC(v50, v68, &qword_1EDBB6B70);
    v63 = 0;
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v58 + 48))(v62, 1, v57) != 1)
    {
      v63 = (void *)sub_1BD791084();
      (*(void (**)(uint64_t, uint64_t))(v58 + 8))(v62, v57);
    }
    v64 = (void *)sub_1BD791078();
    v69[2](v69, v63, 0, v64);

    sub_1BD787F8C(v50);
    swift_release();
  }
}

void sub_1BD78DC68(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, void (**a7)(const void *, void *, _QWORD, void *))
{
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
  id v21;
  NSObject *v22;
  os_log_type_t v23;
  _BOOL4 v24;
  void *v25;
  uint8_t *v26;
  _QWORD *v27;
  id v28;
  NSObject *v29;
  os_log_type_t v30;
  uint8_t *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  unint64_t v36;
  NSObject *v37;
  os_log_type_t v38;
  uint8_t *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  unint64_t v44;
  NSObject *v45;
  os_log_type_t v46;
  uint8_t *v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  char v51;
  NSObject *v52;
  os_log_type_t v53;
  uint8_t *v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  char *v64;
  uint64_t v65;
  void *v66;
  uint64_t v67;
  void *v68;
  void *v69;
  uint64_t v70;
  char *v71;
  char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  char *v76;
  void (**v77)(const void *, void *, _QWORD, void *);
  id v78;
  uint64_t v79;
  int v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t aBlock[7];

  v80 = a6;
  v83 = a5;
  v79 = a2;
  v11 = sub_1BD791048();
  MEMORY[0x1E0C80A78](v11);
  v72 = (char *)&v70 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_1BD791054();
  v73 = *(_QWORD *)(v13 - 8);
  v74 = v13;
  MEMORY[0x1E0C80A78](v13);
  v71 = (char *)&v70 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDBB6B70);
  v16 = MEMORY[0x1E0C80A78](v15);
  v75 = (uint64_t)&v70 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v16);
  v76 = (char *)&v70 - v18;
  v81 = swift_allocObject();
  *(_QWORD *)(v81 + 16) = a7;
  v77 = a7;
  _Block_copy(a7);
  if (qword_1EDBB6B98 != -1)
    swift_once();
  v19 = sub_1BD7910F0();
  v20 = __swift_project_value_buffer(v19, (uint64_t)qword_1EDBB6BA0);
  v21 = a1;
  v22 = sub_1BD7910D8();
  v23 = sub_1BD791198();
  v24 = os_log_type_enabled(v22, v23);
  v84 = v20;
  v85 = a4;
  v82 = a3;
  v78 = v21;
  if (v24)
  {
    v25 = v21;
    v26 = (uint8_t *)swift_slowAlloc();
    v27 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v26 = 138412290;
    aBlock[0] = (uint64_t)v25;
    v28 = v25;
    sub_1BD7911A4();
    *v27 = v25;

    _os_log_impl(&dword_1BD77B000, v22, v23, "callForAddParticipantsToShare urlWrapper: %@", v26, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EDBB6B90);
    swift_arrayDestroy();
    MEMORY[0x1C3B75908](v27, -1, -1);
    MEMORY[0x1C3B75908](v26, -1, -1);

  }
  else
  {

  }
  swift_bridgeObjectRetain_n();
  v29 = sub_1BD7910D8();
  v30 = sub_1BD791174();
  if (os_log_type_enabled(v29, v30))
  {
    v31 = (uint8_t *)swift_slowAlloc();
    v32 = swift_slowAlloc();
    aBlock[0] = v32;
    *(_DWORD *)v31 = 136315138;
    v33 = swift_bridgeObjectRetain();
    v34 = MEMORY[0x1C3B754E8](v33, MEMORY[0x1E0DEA968]);
    v36 = v35;
    swift_bridgeObjectRelease();
    v86 = sub_1BD7878CC(v34, v36, aBlock);
    sub_1BD7911A4();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1BD77B000, v29, v30, "callForAddParticipantsToShare emailAddresses: %s", v31, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C3B75908](v32, -1, -1);
    MEMORY[0x1C3B75908](v31, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  swift_bridgeObjectRetain_n();
  v37 = sub_1BD7910D8();
  v38 = sub_1BD791174();
  if (os_log_type_enabled(v37, v38))
  {
    v39 = (uint8_t *)swift_slowAlloc();
    v40 = swift_slowAlloc();
    aBlock[0] = v40;
    *(_DWORD *)v39 = 136315138;
    v41 = swift_bridgeObjectRetain();
    v42 = MEMORY[0x1C3B754E8](v41, MEMORY[0x1E0DEA968]);
    v44 = v43;
    swift_bridgeObjectRelease();
    v86 = sub_1BD7878CC(v42, v44, aBlock);
    sub_1BD7911A4();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1BD77B000, v37, v38, "callForAddParticipantsToShare phoneNumbers: %s", v39, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C3B75908](v40, -1, -1);
    MEMORY[0x1C3B75908](v39, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  v45 = sub_1BD7910D8();
  v46 = sub_1BD791174();
  if (os_log_type_enabled(v45, v46))
  {
    v47 = (uint8_t *)swift_slowAlloc();
    v48 = swift_slowAlloc();
    *(_DWORD *)v47 = 136315138;
    v86 = v83;
    aBlock[0] = v48;
    type metadata accessor for ParticipantPermission(0);
    v49 = sub_1BD79112C();
    v86 = sub_1BD7878CC(v49, v50, aBlock);
    sub_1BD7911A4();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1BD77B000, v45, v46, "callForAddParticipantsToShare permissionType: %s", v47, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C3B75908](v48, -1, -1);
    MEMORY[0x1C3B75908](v47, -1, -1);
  }

  v51 = v80;
  v52 = sub_1BD7910D8();
  v53 = sub_1BD791174();
  if (os_log_type_enabled(v52, v53))
  {
    v54 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v54 = 67109120;
    LODWORD(aBlock[0]) = v51 & 1;
    sub_1BD7911A4();
    _os_log_impl(&dword_1BD77B000, v52, v53, "callForAddParticipantsToShare allowOthersToInvite: %{BOOL}d", v54, 8u);
    MEMORY[0x1C3B75908](v54, -1, -1);
  }

  if (qword_1EDBB6B78 != -1)
    swift_once();
  v55 = (void *)qword_1EDBB6BE8;
  if (qword_1EDBB6BE8)
  {
    swift_unknownObjectRetain();
    v56 = (void *)sub_1BD791150();
    v57 = (void *)sub_1BD791150();
    v58 = swift_allocObject();
    v59 = v81;
    *(_QWORD *)(v58 + 16) = sub_1BD7908EC;
    *(_QWORD *)(v58 + 24) = v59;
    aBlock[4] = (uint64_t)sub_1BD787FCC;
    aBlock[5] = v58;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_1BD77F364;
    aBlock[3] = (uint64_t)&block_descriptor_149;
    v60 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    objc_msgSend(v55, sel_addParticipantsToShareWithURLWrapper_share_emailAddresses_phoneNumbers_permissionType_allowOthersToInvite_withReply_, v78, v79, v56, v57, v83, v51 & 1, v60);
    _Block_release(v60);
    swift_release();
    swift_unknownObjectRelease();

  }
  else
  {
    v61 = sub_1BD7910A8();
    v62 = *(_QWORD *)(v61 - 8);
    v63 = (uint64_t)v76;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v62 + 56))(v76, 1, 1, v61);
    sub_1BD79103C();
    sub_1BD7875B4(MEMORY[0x1E0DEE9D8]);
    sub_1BD787F0C(&qword_1EF4FDF20, (uint64_t (*)(uint64_t))MEMORY[0x1E0CADE48], MEMORY[0x1E0CADE40]);
    v64 = v71;
    v65 = v74;
    sub_1BD79106C();
    v66 = (void *)sub_1BD791030();
    (*(void (**)(char *, uint64_t))(v73 + 8))(v64, v65);
    v67 = v75;
    sub_1BD7906BC(v63, v75, &qword_1EDBB6B70);
    v68 = 0;
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v62 + 48))(v67, 1, v61) != 1)
    {
      v68 = (void *)sub_1BD791084();
      (*(void (**)(uint64_t, uint64_t))(v62 + 8))(v67, v61);
    }
    v69 = (void *)sub_1BD791078();
    v77[2](v77, v68, 0, v69);

    sub_1BD787F8C(v63);
    swift_release();
  }
}

void sub_1BD78E5C4(void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, void (**a7)(const void *, void *, _QWORD, void *))
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  NSObject *v23;
  os_log_type_t v24;
  _BOOL4 v25;
  uint8_t *v26;
  _QWORD *v27;
  void *v28;
  id v29;
  NSObject *v30;
  NSObject *v31;
  os_log_type_t v32;
  _BOOL4 v33;
  uint8_t *v34;
  _QWORD *v35;
  NSObject *v36;
  NSObject *v37;
  os_log_type_t v38;
  uint8_t *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  unint64_t v44;
  NSObject *v45;
  os_log_type_t v46;
  uint8_t *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t v51;
  unint64_t v52;
  NSObject *v53;
  os_log_type_t v54;
  uint8_t *v55;
  uint64_t v56;
  uint64_t v57;
  unint64_t v58;
  uint64_t v59;
  char v60;
  NSObject *v61;
  os_log_type_t v62;
  uint8_t *v63;
  void *v64;
  void *v65;
  void *v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  uint64_t v70;
  uint64_t v71;
  char *v72;
  uint64_t v73;
  void *v74;
  uint64_t v75;
  void *v76;
  void *v77;
  uint64_t v78;
  char *v79;
  char *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  void (**v84)(const void *, void *, _QWORD, void *);
  NSObject *v85;
  id v86;
  int v87;
  char *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t aBlock[7];

  v87 = a6;
  v90 = a5;
  v91 = a3;
  v11 = sub_1BD791048();
  MEMORY[0x1E0C80A78](v11);
  v80 = (char *)&v78 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_1BD791054();
  v81 = *(_QWORD *)(v13 - 8);
  v82 = v13;
  MEMORY[0x1E0C80A78](v13);
  v79 = (char *)&v78 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDBB6B70);
  v16 = MEMORY[0x1E0C80A78](v15);
  v83 = (uint64_t)&v78 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v16);
  v19 = (char *)&v78 - v18;
  v89 = swift_allocObject();
  *(_QWORD *)(v89 + 16) = a7;
  v84 = a7;
  _Block_copy(a7);
  if (qword_1EDBB6B98 != -1)
    swift_once();
  v20 = sub_1BD7910F0();
  v21 = __swift_project_value_buffer(v20, (uint64_t)qword_1EDBB6BA0);
  v22 = a1;
  v93 = v21;
  v23 = sub_1BD7910D8();
  v24 = sub_1BD791198();
  v25 = os_log_type_enabled(v23, v24);
  v92 = a4;
  v88 = v19;
  v86 = v22;
  if (v25)
  {
    v26 = (uint8_t *)swift_slowAlloc();
    v27 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v26 = 138412290;
    aBlock[0] = (uint64_t)v22;
    v28 = a2;
    v29 = v22;
    sub_1BD7911A4();
    *v27 = v22;

    a2 = v28;
    _os_log_impl(&dword_1BD77B000, v23, v24, "callForAddParticipantsToShare share: %@", v26, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EDBB6B90);
    swift_arrayDestroy();
    MEMORY[0x1C3B75908](v27, -1, -1);
    MEMORY[0x1C3B75908](v26, -1, -1);

  }
  else
  {

  }
  v30 = a2;
  v31 = sub_1BD7910D8();
  v32 = sub_1BD791198();
  v33 = os_log_type_enabled(v31, v32);
  v85 = v30;
  if (v33)
  {
    v34 = (uint8_t *)swift_slowAlloc();
    v35 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v34 = 138412290;
    aBlock[0] = (uint64_t)v30;
    v36 = v30;
    sub_1BD7911A4();
    *v35 = v30;

    _os_log_impl(&dword_1BD77B000, v31, v32, "callForAddParticipantsToShare containerSetupInfo: %@", v34, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EDBB6B90);
    swift_arrayDestroy();
    MEMORY[0x1C3B75908](v35, -1, -1);
    MEMORY[0x1C3B75908](v34, -1, -1);
  }
  else
  {

    v31 = v30;
  }

  swift_bridgeObjectRetain_n();
  v37 = sub_1BD7910D8();
  v38 = sub_1BD791174();
  if (os_log_type_enabled(v37, v38))
  {
    v39 = (uint8_t *)swift_slowAlloc();
    v40 = swift_slowAlloc();
    aBlock[0] = v40;
    *(_DWORD *)v39 = 136315138;
    v41 = swift_bridgeObjectRetain();
    v42 = MEMORY[0x1C3B754E8](v41, MEMORY[0x1E0DEA968]);
    v44 = v43;
    swift_bridgeObjectRelease();
    v94 = sub_1BD7878CC(v42, v44, aBlock);
    sub_1BD7911A4();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1BD77B000, v37, v38, "callForAddParticipantsToShare emailAddresses: %s", v39, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C3B75908](v40, -1, -1);
    MEMORY[0x1C3B75908](v39, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  swift_bridgeObjectRetain_n();
  v45 = sub_1BD7910D8();
  v46 = sub_1BD791174();
  if (os_log_type_enabled(v45, v46))
  {
    v47 = (uint8_t *)swift_slowAlloc();
    v48 = swift_slowAlloc();
    aBlock[0] = v48;
    *(_DWORD *)v47 = 136315138;
    v49 = swift_bridgeObjectRetain();
    v50 = MEMORY[0x1C3B754E8](v49, MEMORY[0x1E0DEA968]);
    v52 = v51;
    swift_bridgeObjectRelease();
    v94 = sub_1BD7878CC(v50, v52, aBlock);
    sub_1BD7911A4();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1BD77B000, v45, v46, "callForAddParticipantsToShare phoneNumbers: %s", v47, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C3B75908](v48, -1, -1);
    MEMORY[0x1C3B75908](v47, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  v53 = sub_1BD7910D8();
  v54 = sub_1BD791174();
  if (os_log_type_enabled(v53, v54))
  {
    v55 = (uint8_t *)swift_slowAlloc();
    v56 = swift_slowAlloc();
    *(_DWORD *)v55 = 136315138;
    v94 = v90;
    aBlock[0] = v56;
    type metadata accessor for ParticipantPermission(0);
    v57 = sub_1BD79112C();
    v94 = sub_1BD7878CC(v57, v58, aBlock);
    sub_1BD7911A4();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1BD77B000, v53, v54, "callForAddParticipantsToShare permissionType: %s", v55, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C3B75908](v56, -1, -1);
    MEMORY[0x1C3B75908](v55, -1, -1);
  }

  v59 = (uint64_t)v88;
  v60 = v87;
  v61 = sub_1BD7910D8();
  v62 = sub_1BD791174();
  if (os_log_type_enabled(v61, v62))
  {
    v63 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v63 = 67109120;
    LODWORD(aBlock[0]) = v60 & 1;
    sub_1BD7911A4();
    _os_log_impl(&dword_1BD77B000, v61, v62, "callForAddParticipantsToShare allowOthersToInvite: %{BOOL}d", v63, 8u);
    MEMORY[0x1C3B75908](v63, -1, -1);
  }

  if (qword_1EDBB6B78 != -1)
    swift_once();
  v64 = (void *)qword_1EDBB6BE8;
  if (qword_1EDBB6BE8)
  {
    swift_unknownObjectRetain();
    v65 = (void *)sub_1BD791150();
    v66 = (void *)sub_1BD791150();
    v67 = swift_allocObject();
    v68 = v89;
    *(_QWORD *)(v67 + 16) = sub_1BD7908EC;
    *(_QWORD *)(v67 + 24) = v68;
    aBlock[4] = (uint64_t)sub_1BD787FCC;
    aBlock[5] = v67;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_1BD77F364;
    aBlock[3] = (uint64_t)&block_descriptor_138;
    v69 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    objc_msgSend(v64, sel_addParticipantsToShare_containerSetupInfo_emailAddresses_phoneNumbers_permissionType_allowOthersToInvite_withReply_, v86, v85, v65, v66, v90, v60 & 1, v69);
    _Block_release(v69);
    swift_release();
    swift_unknownObjectRelease();

  }
  else
  {
    v70 = sub_1BD7910A8();
    v71 = *(_QWORD *)(v70 - 8);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v71 + 56))(v59, 1, 1, v70);
    sub_1BD79103C();
    sub_1BD7875B4(MEMORY[0x1E0DEE9D8]);
    sub_1BD787F0C(&qword_1EF4FDF20, (uint64_t (*)(uint64_t))MEMORY[0x1E0CADE48], MEMORY[0x1E0CADE40]);
    v72 = v79;
    v73 = v82;
    sub_1BD79106C();
    v74 = (void *)sub_1BD791030();
    (*(void (**)(char *, uint64_t))(v81 + 8))(v72, v73);
    v75 = v83;
    sub_1BD7906BC(v59, v83, &qword_1EDBB6B70);
    v76 = 0;
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v71 + 48))(v75, 1, v70) != 1)
    {
      v76 = (void *)sub_1BD791084();
      (*(void (**)(uint64_t, uint64_t))(v71 + 8))(v75, v70);
    }
    v77 = (void *)sub_1BD791078();
    v84[2](v84, v76, 0, v77);

    sub_1BD787F8C(v59);
    swift_release();
  }
}

void sub_1BD78F03C(uint64_t a1, void (**a2)(const void *, void *, _QWORD, void *))
{
  uint64_t v4;
  uint64_t v5;
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
  char *v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  os_log_type_t v20;
  _BOOL4 v21;
  uint64_t v22;
  uint8_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  void (*v28)(char *, uint64_t);
  uint64_t v29;
  uint8_t *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  _QWORD v43[2];
  char *v44;
  uint64_t v45;
  void (**v46)(const void *, void *, _QWORD, void *);
  uint64_t v47;
  char *v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t aBlock[6];

  v4 = sub_1BD791048();
  MEMORY[0x1E0C80A78](v4);
  v49 = (char *)v43 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_1BD791054();
  v50 = *(_QWORD *)(v6 - 8);
  v51 = v6;
  MEMORY[0x1E0C80A78](v6);
  v48 = (char *)v43 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDBB6B70);
  v9 = MEMORY[0x1E0C80A78](v8);
  v11 = (char *)v43 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v9);
  v52 = (uint64_t)v43 - v12;
  v13 = sub_1BD7910A8();
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x1E0C80A78](v13);
  v16 = (char *)v43 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = swift_allocObject();
  *(_QWORD *)(v17 + 16) = a2;
  v46 = a2;
  _Block_copy(a2);
  if (qword_1EDBB6B98 != -1)
    swift_once();
  v18 = sub_1BD7910F0();
  __swift_project_value_buffer(v18, (uint64_t)qword_1EDBB6BA0);
  (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))(v16, a1, v13);
  v19 = sub_1BD7910D8();
  v20 = sub_1BD791198();
  v21 = os_log_type_enabled(v19, v20);
  v47 = v14;
  if (v21)
  {
    v22 = swift_slowAlloc();
    v45 = v17;
    v23 = (uint8_t *)v22;
    v24 = swift_slowAlloc();
    v43[1] = a1;
    v25 = v24;
    aBlock[0] = v24;
    *(_DWORD *)v23 = 136315138;
    v44 = v11;
    sub_1BD787F0C(&qword_1EF4FDF28, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAFFF8], MEMORY[0x1E0CB0048]);
    v26 = sub_1BD791210();
    v53 = sub_1BD7878CC(v26, v27, aBlock);
    v11 = v44;
    sub_1BD7911A4();
    swift_bridgeObjectRelease();
    v28 = *(void (**)(char *, uint64_t))(v14 + 8);
    v29 = v13;
    v28(v16, v13);
    _os_log_impl(&dword_1BD77B000, v19, v20, "callForExistingShareForFile url: %s", v23, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C3B75908](v25, -1, -1);
    v30 = v23;
    v17 = v45;
    MEMORY[0x1C3B75908](v30, -1, -1);
  }
  else
  {
    v28 = *(void (**)(char *, uint64_t))(v14 + 8);
    v29 = v13;
    v28(v16, v13);
  }

  if (qword_1EDBB6B78 != -1)
    swift_once();
  v31 = (void *)qword_1EDBB6BE8;
  if (qword_1EDBB6BE8)
  {
    swift_unknownObjectRetain();
    v32 = (void *)sub_1BD791084();
    v33 = swift_allocObject();
    *(_QWORD *)(v33 + 16) = sub_1BD7908EC;
    *(_QWORD *)(v33 + 24) = v17;
    aBlock[4] = (uint64_t)sub_1BD787FCC;
    aBlock[5] = v33;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_1BD77F364;
    aBlock[3] = (uint64_t)&block_descriptor_127;
    v34 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    objc_msgSend(v31, sel_existingShareForFile_withReply_, v32, v34);
    _Block_release(v34);
    swift_release();
    swift_unknownObjectRelease();

  }
  else
  {
    v35 = v47;
    v36 = v52;
    v37 = v29;
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v47 + 56))(v52, 1, 1, v29);
    sub_1BD79103C();
    sub_1BD7875B4(MEMORY[0x1E0DEE9D8]);
    sub_1BD787F0C(&qword_1EF4FDF20, (uint64_t (*)(uint64_t))MEMORY[0x1E0CADE48], MEMORY[0x1E0CADE40]);
    v38 = v48;
    v39 = v51;
    sub_1BD79106C();
    v40 = (void *)sub_1BD791030();
    (*(void (**)(char *, uint64_t))(v50 + 8))(v38, v39);
    sub_1BD7906BC(v36, (uint64_t)v11, &qword_1EDBB6B70);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v35 + 48))(v11, 1, v29) == 1)
    {
      v41 = 0;
    }
    else
    {
      v41 = (void *)sub_1BD791084();
      v28(v11, v37);
    }
    v42 = (void *)sub_1BD791078();
    v46[2](v46, v41, 0, v42);

    sub_1BD787F8C(v52);
    swift_release();
  }
}

void sub_1BD78F590(uint64_t a1, void *a2, void (**a3)(_QWORD, _QWORD, _QWORD, _QWORD))
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
  NSObject *v19;
  os_log_type_t v20;
  _BOOL4 v21;
  uint64_t v22;
  uint8_t *v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint8_t *v28;
  NSObject *v29;
  NSObject *v30;
  os_log_type_t v31;
  uint8_t *v32;
  _QWORD *v33;
  NSObject *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  int v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  char *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void (**v49)(_QWORD, _QWORD, _QWORD, _QWORD);
  char *v50;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t aBlock[7];

  aBlock[6] = *MEMORY[0x1E0C80C00];
  v6 = sub_1BD791048();
  MEMORY[0x1E0C80A78](v6);
  v51 = (char *)&v47 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_1BD791054();
  v52 = *(_QWORD *)(v8 - 8);
  v53 = v8;
  MEMORY[0x1E0C80A78](v8);
  v50 = (char *)&v47 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDBB6B70);
  v11 = MEMORY[0x1E0C80A78](v10);
  v54 = (uint64_t)&v47 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = MEMORY[0x1E0C80A78](v11);
  v15 = (char *)&v47 - v14;
  MEMORY[0x1E0C80A78](v13);
  v17 = (char *)&v47 - v16;
  v56 = swift_allocObject();
  *(_QWORD *)(v56 + 16) = a3;
  _Block_copy(a3);
  if (qword_1EDBB6B98 != -1)
    swift_once();
  v18 = sub_1BD7910F0();
  __swift_project_value_buffer(v18, (uint64_t)qword_1EDBB6BA0);
  sub_1BD7906BC(a1, (uint64_t)v17, &qword_1EDBB6B70);
  v19 = sub_1BD7910D8();
  v20 = sub_1BD791198();
  v21 = os_log_type_enabled(v19, v20);
  v55 = a1;
  if (v21)
  {
    v22 = swift_slowAlloc();
    v49 = a3;
    v23 = (uint8_t *)v22;
    v24 = swift_slowAlloc();
    aBlock[0] = v24;
    v48 = a2;
    *(_DWORD *)v23 = 136315138;
    sub_1BD7906BC((uint64_t)v17, (uint64_t)v15, &qword_1EDBB6B70);
    v25 = sub_1BD79112C();
    v57 = sub_1BD7878CC(v25, v26, aBlock);
    a2 = v48;
    sub_1BD7911A4();
    swift_bridgeObjectRelease();
    sub_1BD787F8C((uint64_t)v17);
    _os_log_impl(&dword_1BD77B000, v19, v20, "callForUserNameAndEmail url: %s", v23, 0xCu);
    swift_arrayDestroy();
    v27 = v24;
    a1 = v55;
    MEMORY[0x1C3B75908](v27, -1, -1);
    v28 = v23;
    a3 = v49;
    MEMORY[0x1C3B75908](v28, -1, -1);
  }
  else
  {
    sub_1BD787F8C((uint64_t)v17);
  }

  v29 = a2;
  v30 = sub_1BD7910D8();
  v31 = sub_1BD791198();
  if (os_log_type_enabled(v30, v31))
  {
    v32 = (uint8_t *)swift_slowAlloc();
    v33 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v32 = 138412290;
    if (a2)
    {
      aBlock[0] = (uint64_t)v29;
      v34 = v29;
    }
    else
    {
      aBlock[0] = 0;
    }
    sub_1BD7911A4();
    *v33 = a2;

    _os_log_impl(&dword_1BD77B000, v30, v31, "callForUserNameAndEmail containerSetupInfo: %@", v32, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EDBB6B90);
    swift_arrayDestroy();
    MEMORY[0x1C3B75908](v33, -1, -1);
    MEMORY[0x1C3B75908](v32, -1, -1);
    a1 = v55;
  }
  else
  {

    v30 = v29;
  }

  if (qword_1EDBB6B78 != -1)
    swift_once();
  v35 = (void *)qword_1EDBB6BE8;
  if (qword_1EDBB6BE8)
  {
    v36 = v54;
    sub_1BD7906BC(a1, v54, &qword_1EDBB6B70);
    v37 = sub_1BD7910A8();
    v38 = *(_QWORD *)(v37 - 8);
    v39 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v38 + 48))(v36, 1, v37);
    swift_unknownObjectRetain();
    v40 = 0;
    if (v39 != 1)
    {
      v40 = (void *)sub_1BD791084();
      (*(void (**)(uint64_t, uint64_t))(v38 + 8))(v36, v37);
    }
    v41 = swift_allocObject();
    v42 = v56;
    *(_QWORD *)(v41 + 16) = sub_1BD79061C;
    *(_QWORD *)(v41 + 24) = v42;
    aBlock[4] = (uint64_t)sub_1BD787FCC;
    aBlock[5] = v41;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_1BD786470;
    aBlock[3] = (uint64_t)&block_descriptor_116;
    v43 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    objc_msgSend(v35, sel_userNameAndEmail_containerSetupInfo_withReply_, v40, v29, v43);
    _Block_release(v43);
    swift_release();
    swift_unknownObjectRelease();
  }
  else
  {
    sub_1BD79103C();
    sub_1BD7875B4(MEMORY[0x1E0DEE9D8]);
    sub_1BD787F0C(&qword_1EF4FDF20, (uint64_t (*)(uint64_t))MEMORY[0x1E0CADE48], MEMORY[0x1E0CADE40]);
    v44 = v50;
    v45 = v53;
    sub_1BD79106C();
    v46 = (void *)sub_1BD791030();
    (*(void (**)(char *, uint64_t))(v52 + 8))(v44, v45);
    v40 = (void *)sub_1BD791078();
    ((void (**)(_QWORD, _QWORD, _QWORD, void *))a3)[2](a3, 0, 0, v40);
    swift_release();

  }
}

void sub_1BD78FBD8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, void (**a7)(const void *, void *, _QWORD, void *))
{
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
  char *v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  os_log_type_t v25;
  _BOOL4 v26;
  uint8_t *v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  NSObject *v31;
  os_log_type_t v32;
  _BOOL4 v33;
  uint8_t *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  NSObject *v41;
  os_log_type_t v42;
  uint8_t *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  unint64_t v48;
  NSObject *v49;
  os_log_type_t v50;
  uint8_t *v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;
  char v55;
  NSObject *v56;
  os_log_type_t v57;
  uint8_t *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  uint64_t v67;
  char *v68;
  uint64_t v69;
  void *v70;
  uint64_t v71;
  void *v72;
  void (**v73)(const void *, void *, _QWORD, void *);
  void *v74;
  uint64_t v75;
  void (*v76)(char *, uint64_t);
  void (**v77)(const void *, void *, _QWORD, void *);
  uint64_t v78;
  char *v79;
  char *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  int v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t aBlock[7];

  v88 = a6;
  v89 = a5;
  v86 = a4;
  v92 = a3;
  v10 = sub_1BD791048();
  MEMORY[0x1E0C80A78](v10);
  v80 = (char *)&v75 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_1BD791054();
  v81 = *(_QWORD *)(v12 - 8);
  v82 = v12;
  MEMORY[0x1E0C80A78](v12);
  v79 = (char *)&v75 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDBB6B70);
  v15 = MEMORY[0x1E0C80A78](v14);
  v83 = (uint64_t)&v75 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v15);
  v84 = (char *)&v75 - v17;
  v18 = sub_1BD7910A8();
  v19 = *(_QWORD *)(v18 - 8);
  MEMORY[0x1E0C80A78](v18);
  v21 = (char *)&v75 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v87 = swift_allocObject();
  *(_QWORD *)(v87 + 16) = a7;
  v77 = a7;
  _Block_copy(a7);
  if (qword_1EDBB6B98 != -1)
    swift_once();
  v22 = sub_1BD7910F0();
  v23 = __swift_project_value_buffer(v22, (uint64_t)qword_1EDBB6BA0);
  (*(void (**)(char *, uint64_t, uint64_t))(v19 + 16))(v21, a1, v18);
  v91 = v23;
  v24 = sub_1BD7910D8();
  v25 = sub_1BD791198();
  v26 = os_log_type_enabled(v24, v25);
  v90 = a2;
  v85 = a1;
  if (v26)
  {
    v27 = (uint8_t *)swift_slowAlloc();
    v28 = swift_slowAlloc();
    aBlock[0] = v28;
    *(_DWORD *)v27 = 136315138;
    sub_1BD787F0C(&qword_1EF4FDF28, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAFFF8], MEMORY[0x1E0CB0048]);
    v29 = sub_1BD791210();
    v93 = sub_1BD7878CC(v29, v30, aBlock);
    sub_1BD7911A4();
    swift_bridgeObjectRelease();
    v76 = *(void (**)(char *, uint64_t))(v19 + 8);
    v76(v21, v18);
    _os_log_impl(&dword_1BD77B000, v24, v25, "callForForciblyShareFolder folderURL: %s", v27, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C3B75908](v28, -1, -1);
    MEMORY[0x1C3B75908](v27, -1, -1);
  }
  else
  {
    v76 = *(void (**)(char *, uint64_t))(v19 + 8);
    v76(v21, v18);
  }

  swift_bridgeObjectRetain_n();
  v31 = sub_1BD7910D8();
  v32 = sub_1BD791174();
  v33 = os_log_type_enabled(v31, v32);
  v78 = v19;
  if (v33)
  {
    v34 = (uint8_t *)swift_slowAlloc();
    v35 = swift_slowAlloc();
    aBlock[0] = v35;
    *(_DWORD *)v34 = 136315138;
    v36 = swift_bridgeObjectRetain();
    v37 = MEMORY[0x1C3B754E8](v36, MEMORY[0x1E0DEA968]);
    v38 = v18;
    v40 = v39;
    swift_bridgeObjectRelease();
    v93 = sub_1BD7878CC(v37, v40, aBlock);
    sub_1BD7911A4();
    swift_bridgeObjectRelease_n();
    v18 = v38;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1BD77B000, v31, v32, "callForForciblyShareFolder emailAddresses: %s", v34, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C3B75908](v35, -1, -1);
    MEMORY[0x1C3B75908](v34, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  swift_bridgeObjectRetain_n();
  v41 = sub_1BD7910D8();
  v42 = sub_1BD791174();
  if (os_log_type_enabled(v41, v42))
  {
    v43 = (uint8_t *)swift_slowAlloc();
    v44 = swift_slowAlloc();
    aBlock[0] = v44;
    *(_DWORD *)v43 = 136315138;
    v45 = swift_bridgeObjectRetain();
    v46 = MEMORY[0x1C3B754E8](v45, MEMORY[0x1E0DEA968]);
    v48 = v47;
    swift_bridgeObjectRelease();
    v93 = sub_1BD7878CC(v46, v48, aBlock);
    sub_1BD7911A4();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1BD77B000, v41, v42, "callForForciblyShareFolder phoneNumbers: %s", v43, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C3B75908](v44, -1, -1);
    MEMORY[0x1C3B75908](v43, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  v49 = sub_1BD7910D8();
  v50 = sub_1BD791174();
  if (os_log_type_enabled(v49, v50))
  {
    v51 = (uint8_t *)swift_slowAlloc();
    v52 = swift_slowAlloc();
    *(_DWORD *)v51 = 136315138;
    v93 = v89;
    aBlock[0] = v52;
    type metadata accessor for ParticipantPermission(0);
    v53 = sub_1BD79112C();
    v93 = sub_1BD7878CC(v53, v54, aBlock);
    sub_1BD7911A4();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1BD77B000, v49, v50, "callForForciblyShareFolder permissionType: %s", v51, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C3B75908](v52, -1, -1);
    MEMORY[0x1C3B75908](v51, -1, -1);
  }

  v55 = v88;
  v56 = sub_1BD7910D8();
  v57 = sub_1BD791174();
  if (os_log_type_enabled(v56, v57))
  {
    v58 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v58 = 67109120;
    LODWORD(aBlock[0]) = v55 & 1;
    sub_1BD7911A4();
    _os_log_impl(&dword_1BD77B000, v56, v57, "callForForciblyShareFolder allowOthersToInvite: %{BOOL}d", v58, 8u);
    MEMORY[0x1C3B75908](v58, -1, -1);
  }

  if (qword_1EDBB6B78 != -1)
    swift_once();
  v59 = (void *)qword_1EDBB6BE8;
  if (qword_1EDBB6BE8)
  {
    swift_unknownObjectRetain();
    v60 = (void *)sub_1BD791084();
    v61 = (void *)sub_1BD791150();
    v62 = (void *)sub_1BD791150();
    v63 = swift_allocObject();
    v64 = v87;
    *(_QWORD *)(v63 + 16) = sub_1BD7905F0;
    *(_QWORD *)(v63 + 24) = v64;
    aBlock[4] = (uint64_t)sub_1BD787FCC;
    aBlock[5] = v63;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_1BD77F364;
    aBlock[3] = (uint64_t)&block_descriptor_106;
    v65 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    objc_msgSend(v59, sel_forciblyShareFolder_emailAddresses_phoneNumbers_accessType_permissionType_allowOthersToInvite_withReply_, v60, v61, v62, v86, v89, v55 & 1, v65);
    _Block_release(v65);
    swift_release();
    swift_unknownObjectRelease();

  }
  else
  {
    v66 = v78;
    v67 = (uint64_t)v84;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v78 + 56))(v84, 1, 1, v18);
    sub_1BD79103C();
    sub_1BD7875B4(MEMORY[0x1E0DEE9D8]);
    sub_1BD787F0C(&qword_1EF4FDF20, (uint64_t (*)(uint64_t))MEMORY[0x1E0CADE48], MEMORY[0x1E0CADE40]);
    v68 = v79;
    v69 = v82;
    sub_1BD79106C();
    v70 = (void *)sub_1BD791030();
    (*(void (**)(char *, uint64_t))(v81 + 8))(v68, v69);
    v71 = v83;
    sub_1BD7906BC(v67, v83, &qword_1EDBB6B70);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v66 + 48))(v71, 1, v18) == 1)
    {
      v72 = 0;
    }
    else
    {
      v72 = (void *)sub_1BD791084();
      v76((char *)v71, v18);
    }
    v73 = v77;
    v74 = (void *)sub_1BD791078();
    v73[2](v73, v72, 0, v74);

    sub_1BD787F8C(v67);
    swift_release();
  }
}

void sub_1BD7905F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  sub_1BD77F4A8(a1, a2, a3, *(_QWORD *)(v3 + 16));
}

uint64_t sub_1BD7905F8()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

void sub_1BD79061C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  sub_1BD78661C(a1, a2, a3, *(_QWORD *)(v3 + 16));
}

void sub_1BD790624(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  sub_1BD783268(a1, a2, *(_QWORD *)(v2 + 16));
}

void sub_1BD79062C(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5)
{
  uint64_t v5;

  sub_1BD782AF8(a1, a2, a3, a4, a5, *(_QWORD *)(v5 + 16));
}

void sub_1BD790634(char a1, uint64_t a2)
{
  uint64_t v2;

  sub_1BD781448(a1, a2, *(_QWORD *)(v2 + 16));
}

void sub_1BD79063C(char a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  sub_1BD780E14(a1, a2, a3, *(_QWORD *)(v3 + 16));
}

void sub_1BD790644(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  sub_1BD783268(a1, a2, *(_QWORD *)(v2 + 16));
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

uint64_t sub_1BD79067C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_1BD7906BC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

_OWORD *sub_1BD790700(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

void URL.evictionSafeResourceValues(forKeys:)(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  _QWORD *v12;
  _QWORD *v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id aBlock[6];
  id v22[2];

  v19 = a2;
  v22[1] = *(id *)MEMORY[0x1E0C80C00];
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF4FDF98);
  v4 = MEMORY[0x1E0C80A78](v3);
  v20 = (uint64_t)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v18 - v6;
  v22[0] = 0;
  v8 = sub_1BD791060();
  v9 = *(_QWORD *)(v8 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(v7, 1, 1, v8);
  v10 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB3600]), sel_init);
  v11 = (void *)sub_1BD791084();
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = v7;
  v12[3] = a1;
  v12[4] = v22;
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = sub_1BD790D28;
  v13[3] = v12;
  aBlock[4] = sub_1BD787FE4;
  aBlock[5] = v13;
  aBlock[0] = (id)MEMORY[0x1E0C809B0];
  aBlock[1] = (id)1107296256;
  aBlock[2] = sub_1BD790D44;
  aBlock[3] = &block_descriptor_0;
  v14 = _Block_copy(aBlock);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_release();
  aBlock[0] = 0;
  objc_msgSend(v10, sel_coordinateReadingItemAtURL_options_error_byAccessor_, v11, 4, aBlock, v14);
  _Block_release(v14);

  v15 = aBlock[0];
  LOBYTE(v14) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  if ((v14 & 1) != 0)
    __break(1u);
  if (v15)
  {
    v16 = v15;
    swift_willThrow();
    sub_1BD790E38((uint64_t)v7);

    swift_release();
  }
  else if (v22[0])
  {
    v22[0];
    swift_willThrow();
    sub_1BD790E38((uint64_t)v7);

    swift_release();
  }
  else
  {
    v17 = v20;
    sub_1BD790DF0((uint64_t)v7, v20);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(v17, 1, v8) == 1)
    {
      __break(1u);
    }
    else
    {
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 32))(v19, v17, v8);
      sub_1BD790E38((uint64_t)v7);

      swift_release();
    }
  }
}

uint64_t sub_1BD790BF4(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v8;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF4FDF98);
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BD791090();
  v6 = sub_1BD791060();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 0, 1, v6);
  return sub_1BD790EB4((uint64_t)v5, a2);
}

uint64_t sub_1BD790D04()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_1BD790D28(uint64_t a1)
{
  uint64_t v1;

  return sub_1BD790BF4(a1, *(_QWORD *)(v1 + 16));
}

uint64_t sub_1BD790D34()
{
  return swift_deallocObject();
}

uint64_t sub_1BD790D44(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  void (*v6)(char *);
  uint64_t v8;

  v2 = sub_1BD7910A8();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *(void (**)(char *))(a1 + 32);
  sub_1BD79109C();
  v6(v5);
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
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

uint64_t sub_1BD790DF0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF4FDF98);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1BD790E38(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF4FDF98);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_1BD790E78()
{
  unint64_t result;

  result = qword_1EF4FDFA0;
  if (!qword_1EF4FDFA0)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EF4FDFA0);
  }
  return result;
}

uint64_t sub_1BD790EB4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF4FDF98);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_1BD790EFC()
{
  uint64_t v0;

  v0 = sub_1BD7910F0();
  __swift_allocate_value_buffer(v0, qword_1EDBB6BA0);
  __swift_project_value_buffer(v0, (uint64_t)qword_1EDBB6BA0);
  swift_bridgeObjectRetain();
  return sub_1BD7910E4();
}

uint64_t static Logger.general.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_1EDBB6B98 != -1)
    swift_once();
  v2 = sub_1BD7910F0();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1EDBB6BA0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
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

uint64_t sub_1BD791030()
{
  return MEMORY[0x1E0CADD40]();
}

uint64_t sub_1BD79103C()
{
  return MEMORY[0x1E0CADDD0]();
}

uint64_t sub_1BD791048()
{
  return MEMORY[0x1E0CADE20]();
}

uint64_t sub_1BD791054()
{
  return MEMORY[0x1E0CADE48]();
}

uint64_t sub_1BD791060()
{
  return MEMORY[0x1E0CAF3D8]();
}

uint64_t sub_1BD79106C()
{
  return MEMORY[0x1E0CAF940]();
}

uint64_t sub_1BD791078()
{
  return MEMORY[0x1E0CAF980]();
}

uint64_t sub_1BD791084()
{
  return MEMORY[0x1E0CAFE38]();
}

uint64_t sub_1BD791090()
{
  return MEMORY[0x1E0CAFEC8]();
}

uint64_t sub_1BD79109C()
{
  return MEMORY[0x1E0CAFF00]();
}

uint64_t sub_1BD7910A8()
{
  return MEMORY[0x1E0CAFFF8]();
}

uint64_t sub_1BD7910B4()
{
  return MEMORY[0x1E0CB0110]();
}

uint64_t sub_1BD7910C0()
{
  return MEMORY[0x1E0CB01F0]();
}

uint64_t sub_1BD7910CC()
{
  return MEMORY[0x1E0CB0228]();
}

uint64_t sub_1BD7910D8()
{
  return MEMORY[0x1E0DF2240]();
}

uint64_t sub_1BD7910E4()
{
  return MEMORY[0x1E0DF2248]();
}

uint64_t sub_1BD7910F0()
{
  return MEMORY[0x1E0DF2258]();
}

uint64_t sub_1BD7910FC()
{
  return MEMORY[0x1E0CB1940]();
}

uint64_t sub_1BD791108()
{
  return MEMORY[0x1E0CB1960]();
}

uint64_t sub_1BD791114()
{
  return MEMORY[0x1E0CB1970]();
}

uint64_t sub_1BD791120()
{
  return MEMORY[0x1E0CB1980]();
}

uint64_t sub_1BD79112C()
{
  return MEMORY[0x1E0DEA5F8]();
}

uint64_t sub_1BD791138()
{
  return MEMORY[0x1E0DEA758]();
}

uint64_t sub_1BD791144()
{
  return MEMORY[0x1E0DEA850]();
}

uint64_t sub_1BD791150()
{
  return MEMORY[0x1E0CB1AC0]();
}

uint64_t sub_1BD79115C()
{
  return MEMORY[0x1E0CB1AE8]();
}

uint64_t sub_1BD791168()
{
  return MEMORY[0x1E0DEADB0]();
}

uint64_t sub_1BD791174()
{
  return MEMORY[0x1E0DF2270]();
}

uint64_t sub_1BD791180()
{
  return MEMORY[0x1E0DF2278]();
}

uint64_t sub_1BD79118C()
{
  return MEMORY[0x1E0DF2280]();
}

uint64_t sub_1BD791198()
{
  return MEMORY[0x1E0DF2290]();
}

uint64_t sub_1BD7911A4()
{
  return MEMORY[0x1E0DEBC20]();
}

uint64_t sub_1BD7911B0()
{
  return MEMORY[0x1E0DEBC90]();
}

uint64_t sub_1BD7911BC()
{
  return MEMORY[0x1E0DEBE50]();
}

uint64_t sub_1BD7911C8()
{
  return MEMORY[0x1E0DEC2B0]();
}

uint64_t sub_1BD7911D4()
{
  return MEMORY[0x1E0DEC588]();
}

uint64_t sub_1BD7911E0()
{
  return MEMORY[0x1E0DECBE0]();
}

uint64_t sub_1BD7911EC()
{
  return MEMORY[0x1E0DECD50]();
}

uint64_t sub_1BD7911F8()
{
  return MEMORY[0x1E0DECD70]();
}

uint64_t sub_1BD791204()
{
  return MEMORY[0x1E0DECE70]();
}

uint64_t sub_1BD791210()
{
  return MEMORY[0x1E0DED1D0]();
}

uint64_t sub_1BD79121C()
{
  return MEMORY[0x1E0DED600]();
}

uint64_t sub_1BD791228()
{
  return MEMORY[0x1E0DEDEF8]();
}

uint64_t sub_1BD791234()
{
  return MEMORY[0x1E0DEDF40]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1E0C80928](aBlock);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x1E0C80958](aBlock);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1E0C83EE0](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1E0C84098](__dst, __src, __len);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1E0DE7BB0](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D20](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_self()
{
  return MEMORY[0x1E0DE7D58]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E60](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E68](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1E0DEEAB0]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x1E0DEEAD8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1E0DEEB08]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x1E0DEEB10]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1E0DEEB18]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x1E0DEEB20]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x1E0DEEB60]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1E0DEEB80]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x1E0DEEBF0]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x1E0DEEBF8]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1E0DEEC78]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x1E0DEECD8]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x1E0DEECE0]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x1E0DEED38]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1E0DEED50]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x1E0DEED98]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1E0DEEDD0]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x1E0DEEDE0]();
}

uint64_t swift_once()
{
  return MEMORY[0x1E0DEEE00]();
}

uint64_t swift_release()
{
  return MEMORY[0x1E0DEEE30]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1E0DEEE48]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1E0DEEE78]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x1E0DEEE80]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1E0DEEEC0]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1E0DEEED0]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x1E0DEEFC0]();
}

